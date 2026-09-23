"""Compare real drag placement with native behavior and restore the user's order."""
import json,shlex,time
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes,tap_id
from statusbar_device_helpers import bounds,configure,require_systemui_build
from quicksettings_device_helpers import capture

P='round19h-editor-drag-'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True)
original=shell('settings get secure sysui_qs_tiles')
(folder/'original-tiles.txt').write_text(original,encoding='utf-8')
baseline=json.loads((OUTPUT/'round17-quicksettings-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k.removeprefix('ls_augment_'):v for k,v in baseline.items() if k.startswith('ls_augment_rm_qs_')}
results=[]
def check(name,passed,detail):
    results.append({'case':name,'pass':bool(passed),'detail':detail})
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8')
    print(results[-1],flush=True);assert passed,results[-1]
def observe(name):
    label=P+name;w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    root=next(n for n in nodes(w) if n.get('visible') and n.get('id')=='com.android.systemui:id/qs_customize')
    items=[{'text':n['text'],'bounds':bounds(n)} for n in nodes([{'root':root}]) if n.get('visible') and n.get('id')=='com.android.systemui:id/tile_label']
    items.sort(key=lambda n:(round(n['bounds'][1]/5),n['bounds'][0]))
    (OUTPUT/label/'tiles.json').write_text(json.dumps(items,ensure_ascii=False,indent=2),encoding='utf-8')
    return items
def drag(name,source,target,extra=0):
    items=observe(name+'-before');a=next(n['bounds'] for n in items if n['text']==source);b=next(n['bounds'] for n in items if n['text']==target)
    command=f'input draganddrop {(a[0]+a[2])//2} {(a[1]+a[3])//2} {(b[0]+b[2])//2+extra} {(b[1]+b[3])//2} 1500'
    (OUTPUT/(P+name+'-before')/'action.txt').write_text(command,encoding='utf-8');shell(command);time.sleep(1);return observe(name+'-after')
def order(items):return [n['text'] for n in items[:11]]
def open_editor(name):
    capture(P+name+'-panel');tap_id(P+name+'-menu','com.android.systemui:id/control_center_menu_button');tap_id(P+name+'-open','com.android.systemui:id/edit_text_button')
def restore_tiles():
    if shell('settings get secure sysui_qs_tiles')!=original:shell('settings put secure sysui_qs_tiles '+shlex.quote(original),root=True)
try:
    require_systemui_build(folder.name);shell('cmd statusbar collapse');shell('wm user-rotation lock 0');configure(P+'native',{'rm_qs_grid':0})
    shell('am start -n com.android.settings/.Settings');open_editor('native')
    native=observe('native-before');original_order=order(native)
    native_moved=order(drag('native-move','NFC','红魔互传'))
    check('native-drag-control',set(native_moved)==set(original_order) and native_moved!=original_order,{'before':original_order,'after':native_moved})
    native_returned=order(drag('native-return','NFC','自动旋转',50))
    check('native-drag-back',native_returned==original_order,native_returned)
    instrument('set',P+'custom-config',{'ls_augment_rm_qs_grid':'1','ls_augment_rm_qs_edit_columns':'8'});time.sleep(1)
    moved=order(drag('custom-move','NFC','红魔互传'))
    check('custom-matches-native-drop',moved==native_moved,{'native':native_moved,'custom':moved})
    returned=order(drag('custom-return','NFC','自动旋转',35))
    check('custom-drag-back',returned==original_order,returned)
    instrument('set',P+'off-config',{'ls_augment_rm_qs_grid':'0'});time.sleep(1)
    off=observe('off')
    check('off-native-first-row',off[:4]==native[:4],{'native':native[:4],'off':off[:4]})
finally:
    shell('input keyevent 4');shell('cmd statusbar collapse');shell('wm user-rotation lock 0');restore_tiles();configure(P+'restore',restore)
    current=shell('settings get secure sysui_qs_tiles');(folder/'restored-tiles.txt').write_text(current,encoding='utf-8');assert current==original
