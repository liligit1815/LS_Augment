"""Compare real editor exits with forced mode changes during native animations."""
import sys,json,time
from adb_regression import OUTPUT,shell,instrument,adb
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import configure,bounds,require_systemui_build

P=sys.argv[1]
race=len(sys.argv)>2 and sys.argv[2]=='race'
folder=OUTPUT/P;folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in base.items() if k.startswith('ls_augment_rm_qs_')}
original=shell('settings get secure sysui_qs_tiles');results=[]
def awake():shell('input keyevent 224');shell('wm dismiss-keyguard')
def click(name,rid):
    w=all_windows(P+'-'+name);n=next(n for n in nodes(w) if n.get('visible') and n.get('id')==rid);b=bounds(n)
    shell(f'input tap {(b[0]+b[2])//2} {(b[1]+b[3])//2}')
def save():
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    (folder/'exits.txt').write_text(shell('dumpsys activity exit-info com.android.systemui',root=True),encoding='utf-8')
try:
    require_systemui_build(P);configure(P+'-baseline',restore);awake();shell('am start -n com.android.settings/.Settings')
    (folder/'crashes-before.txt').write_text(shell('find /data/system/dropbox -maxdepth 1 -type f',root=True),encoding='utf-8')
    for enabled in ([0] if race else [0,1]):
        instrument('set',P+'-config-'+str(enabled),{'ls_augment_rm_qs_grid':str(enabled),'ls_augment_rm_qs_edit_columns':'8','ls_augment_rm_qs_land_edit_columns':'10'})
        for i in range(1 if race else 6):
            mode=1 if race else (1-i%2);name=f'{enabled}-{i}';awake();shell('cmd statusbar collapse');time.sleep(.5);shell('settings put system use_control_panel '+str(mode),root=True);time.sleep(.5)
            pid=shell('pidof com.android.systemui');shell('cmd statusbar expand-settings');time.sleep(.5)
            if mode:
                click(name+'-menu','com.android.systemui:id/control_center_menu_button');click(name+'-edit','com.android.systemui:id/edit_text_button')
            else:click(name+'-edit','android:id/edit')
            time.sleep(.4)
            w=all_windows(P+'-'+name+'-editor');assert any(n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize' for n in nodes(w))
            if race:
                # Deliberately bypass the UI's requirement to leave the editor.
                shell('input keyevent 4; cmd statusbar collapse; settings put system use_control_panel 0',root=True)
            else:
                click(name+'-close','com.android.systemui:id/qs_edit_button_back');time.sleep(.5);shell('cmd statusbar collapse');time.sleep(.5)
                w=all_windows(P+'-'+name+'-closed');assert not any(n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize' for n in nodes(w))
                shell('settings put system use_control_panel '+str(1-mode),root=True)
            time.sleep(2)
            after=shell('pidof com.android.systemui');result={'name':name,'enabled':enabled,'mode':mode,'forcedMidAnimation':race,'pidBefore':pid,'pidAfter':after,'pass':pid==after}
            results.append(result);save();print(result,flush=True)
            if after!=pid:
                time.sleep(7);break
    (folder/'crashes-after.txt').write_text(shell('find /data/system/dropbox -maxdepth 1 -type f',root=True),encoding='utf-8')
finally:
    awake();shell('cmd statusbar collapse');time.sleep(.7);shell('settings put system use_control_panel 1',root=True);shell('wm user-rotation lock 0');configure(P+'-restore',restore)
    assert shell('settings get secure sysui_qs_tiles')==original
