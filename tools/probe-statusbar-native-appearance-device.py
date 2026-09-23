"""Retain actual notification glyphs, native font and camera-circle appearance."""
import sys,json,time
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes
from quicksettings_device_helpers import restart_ui
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);observations=[]
base=instrument('snapshot',P+'baseline')['settings'];keys=['ls_augment_systemui_master','ls_augment_statusbar_clock_custom','ls_augment_rm_notification_native','ls_augment_rm_statusbar_restore_font','ls_augment_rm_cutout_always']
restore={k:base[k] for k in keys};fixture='ls.augment.regression.window1'
inventory=json.loads((OUTPUT/'notification-fixtures/inventory.json').read_text(encoding='utf-8'))
component=next(v['component'] for v in inventory if v['package']==fixture and v['version']==2)
def capture(name):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');shell('am force-stop '+fixture)
    shell('am start -W -n '+component+' --ez notify true');time.sleep(.5)
    # The fixture's bare framework theme has white system-bar glyphs over its
    # light background. Observe the notification over the normal module page.
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    for where in ['bar','shade']:
        if where=='shade':shell('input swipe 170 35 170 1300 600');time.sleep(.8)
        label=P+name+'-'+where;w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
        selected=[{k:v for k,v in n.items() if k!='children'} for n in nodes(w) if n.get('package')=='com.android.systemui' and n.get('visible') and (n.get('description') not in ['',None,'null'] or n.get('id','').split('/')[-1] in ['clock','speed_text','speed_unit','mfv_battery_level_inside','icon'])]
        observations.append({'case':name,'where':where,'nodes':selected});(out/'observations.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8')
    shell('cmd statusbar collapse');print(name,flush=True)
try:
    require_systemui_build(P+'loaded');instrument('set',P+'native-config',{k:'0' for k in keys});restart_ui(P+'native-loaded');capture('native')
    for name,key,value,restart in [('notification-on','notification_native',1,True),('notification-off','notification_native',0,True),('font-on','statusbar_restore_font',1,True),('font-off','statusbar_restore_font',0,True),('cutout-on-wake','cutout_always',1,False),('cutout-on-restart','cutout_always',1,True),('cutout-off','cutout_always',0,True)]:
        instrument('set',P+name+'-config',{'ls_augment_rm_'+key:str(value)})
        if restart:restart_ui(P+name+'-loaded')
        else:shell('input keyevent 223');time.sleep(1);shell('input keyevent 224');shell('wm dismiss-keyguard')
        capture(name)
finally:
    shell('cmd statusbar collapse');shell('am start -W -n '+component+' --ez clear true');shell('am force-stop '+fixture);instrument('set',P+'restore',restore);restart_ui(P+'restored-loaded')
