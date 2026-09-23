"""Exercise the actual RedMagic hide list, overrides and explicit module priorities."""
import sys,json,time,shlex
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes
from quicksettings_device_helpers import restart_ui
from lockscreen_device_helpers import lock_wake
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings']
keys=['ls_augment_systemui_master','ls_augment_rm_ignore_system_icon_hide','ls_augment_rm_hidden_icon_slots','ls_augment_rm_hide_wifi_scope']
restore={k:base[k] for k in keys};old=shell('settings get secure status_bar_keys_close');oldMode=shell('settings get system use_control_panel')
(out/'native-original.json').write_text(json.dumps({'status_bar_keys_close':old,'use_control_panel':oldMode}),encoding='utf-8')
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(out/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def config(name,values):instrument('set',P+name+'-config',{'ls_augment_rm_'+k:str(v) for k,v in values.items()});time.sleep(.6)
def show(context):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.4)
    wanted='0' if context=='merged' else '1'
    if shell('settings get system use_control_panel')!=wanted:shell('settings put system use_control_panel '+wanted,root=True);time.sleep(1)
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    if context=='keyguard':lock_wake()
    elif context=='notification':shell('input swipe 170 35 170 1300 600')
    elif context in ['merged','independent']:shell('cmd statusbar expand-settings')
    time.sleep(.8)
def capture(name,bluetooth,wifi,context='main'):
    show(context);label=P+name;w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    visible=[n for n in nodes(w) if n.get('visible') and n.get('package')=='com.android.systemui']
    bt=[n for n in visible if n.get('description','').startswith('蓝牙') and n.get('class')=='android.widget.ImageView']
    wi=[n for n in visible if n.get('id')=='com.android.systemui:id/wifi_signal']
    detail={'context':context,'expectedBluetooth':bluetooth,'actualBluetooth':len(bt),'expectedWifi':wifi,'actualWifi':len(wi),'icons':[{k:n.get(k) for k in ['id','description','bounds']} for n in bt+wi]}
    check(name,len(bt)==bluetooth and len(wi)==wifi,detail)
try:
    require_systemui_build(P+'loaded');instrument('set',P+'native-config',dict(zip(keys,['0','0','','0'])))
    shell('settings delete secure status_bar_keys_close',root=True);time.sleep(.8);capture('native',1,1)
    shell("settings put secure status_bar_keys_close 'bluetooth;wifi'",root=True);time.sleep(.8)
    for c in ['main','keyguard','notification','merged','independent']:capture('blocked-'+c,0,0,c)
    config('override',{'ignore_system_icon_hide':1})
    for c in ['main','keyguard','notification','merged','independent']:capture('override-'+c,1,1,c)
    restart_ui(P+'restart-loaded');capture('override-restart',1,1)
    config('custom-hidden',{'hidden_icon_slots':'bluetooth','hide_wifi_scope':1});capture('module-explicit-hide-wins',0,0)
    config('custom-off',{'hidden_icon_slots':'','hide_wifi_scope':0});capture('module-explicit-off',1,1)
    shell('settings put secure status_bar_keys_close bluetooth',root=True);time.sleep(.8);capture('native-list-change-while-on',1,1)
    config('off',{'ignore_system_icon_hide':0});capture('off-restores-latest-native-list',0,1)
    restart_ui(P+'off-restart-loaded');capture('off-restart',0,1)
    shell('settings delete secure status_bar_keys_close',root=True);time.sleep(.8);capture('native-list-clear',1,1)
finally:
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.5)
    instrument('set',P+'restore',restore)
    shell('settings delete secure status_bar_keys_close' if old=='null' else 'settings put secure status_bar_keys_close '+shlex.quote(old),root=True)
    shell('settings delete system use_control_panel' if oldMode=='null' else 'settings put system use_control_panel '+shlex.quote(oldMode),root=True)
    assert shell('settings get secure status_bar_keys_close')==old;restart_ui(P+'restored-loaded')
