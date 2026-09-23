"""Read actual visible icon roots across OEM bar and shade contexts."""
import sys,json,time,shlex
from adb_regression import OUTPUT,shell,adb,instrument
from native_ui_helpers import all_windows,nodes
from lockscreen_device_helpers import lock_wake
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);rows=[]
old_mode=shell('settings get system use_control_panel')

def capture(name):
    label=P+name;windows=all_windows(label)
    (OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    found=[]
    def walk(node,parents):
        identity=node.get('id','');visible=node.get('visible');chain=parents+[identity]
        if visible and (any(s in identity.lower() for s in ['wifi','hotspot','status_bar','system_icon']) or 'Wi-Fi' in node.get('description','')):
            found.append({'id':identity,'bounds':node['bounds'],'parents':parents,'class':node.get('class')})
        for child in node.get('children',[]):walk(child,chain)
    for w in windows:walk(w['root'],[])
    rows.append({'context':name,'icons':found});(folder/'observations.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2),encoding='utf-8')
    print(name,[(x['id'].split('/')[-1],x['bounds']) for x in found],flush=True)

try:
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.8);capture('main')
    lock_wake();capture('keyguard');shell('wm dismiss-keyguard')
    shell('cmd statusbar collapse');shell('settings put system use_control_panel 1',root=True);time.sleep(1)
    shell('cmd statusbar expand-notifications');time.sleep(.8);capture('notification')
    shell('cmd statusbar collapse');time.sleep(.5);shell('cmd statusbar expand-settings');time.sleep(.8);capture('independent')
    shell('cmd statusbar collapse');time.sleep(.5);shell('settings put system use_control_panel 0',root=True);time.sleep(1)
    shell('cmd statusbar expand-notifications');time.sleep(.8);capture('merged-notification')
    shell('cmd statusbar expand-settings');time.sleep(.8);capture('merged-control')
finally:
    shell('cmd statusbar collapse');time.sleep(.5)
    shell('settings delete system use_control_panel' if old_mode=='null' else 'settings put system use_control_panel '+shlex.quote(old_mode),root=True)
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    assert shell('settings get system use_control_panel')==old_mode
