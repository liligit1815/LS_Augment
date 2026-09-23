"""Verify the actual Wi-Fi icon in each native display context via ADB."""
import sys,json,time,shlex
from adb_regression import OUTPUT,shell,adb,instrument
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import require_systemui_build
from statusbar_device_helpers import grid
from lockscreen_device_helpers import lock_wake
P=sys.argv[1];custom='--custom-layout' in sys.argv;focused='--focused' in sys.argv;kind='hotspot' if '--hotspot' in sys.argv else 'wifi'
scopeKey='ls_augment_rm_hide_'+kind+'_scope'
contexts=[v for v in sys.argv[2:] if not v.startswith('--')] or ['main','keyguard','notification','merged','independent']
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings']
keys=['ls_augment_systemui_master',scopeKey,'ls_augment_rm_hidden_icon_slots','ls_augment_rm_statusbar_hide','ls_augment_rm_keyguard_statusbar_hide']
if custom:keys+=['ls_augment_statusbar_grid_v2','ls_augment_statusbar_height_dp']
restore={k:base[k] for k in keys};old_mode=shell('settings get system use_control_panel')
zero={k:'0' for k in keys};zero['ls_augment_rm_hidden_icon_slots']=''
if custom:zero.update({'ls_augment_systemui_master':'1','ls_augment_statusbar_height_dp':'48','ls_augment_statusbar_grid_v2':grid({'system_icons':{'zone':'LS','size':18},'clock':{'zone':'RS','size':16},'battery':{'zone':'CS','size':16}},only=['clock','system_icons','battery'])})

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def show(context):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.4)
    wanted='0' if context=='merged' else '1'
    if shell('settings get system use_control_panel')!=wanted:
        shell('settings put system use_control_panel '+wanted,root=True);time.sleep(1)
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(.5)
    if context=='keyguard':lock_wake()
    elif context=='notification':shell('input swipe 170 35 170 1300 600')
    elif context in ['merged','independent']:shell('cmd statusbar expand-settings')
    time.sleep(.7)

def observe(context,choice,step):
    label=P+context+'-'+str(step)+'-scope'+str(choice)
    instrument('set',label+'-config',{scopeKey:str(choice)})
    show(context);w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    wifi=[{k:n.get(k) for k in ['id','description','bounds','visible']} for n in nodes(w) if n.get('visible') and n.get('package')=='com.android.systemui' and (n.get('id')=='com.android.systemui:id/wifi_signal' if kind=='wifi' else n.get('description')=='热点')]
    roots=[n.get('id') for n in nodes(w) if n.get('visible') and n.get('id') in ['com.android.systemui:id/status_bar','com.android.systemui:id/keyguard_header','com.android.systemui:id/control_panel','com.android.systemui:id/cc_header']]
    expected=0 if choice in [6,{'main':1,'keyguard':2,'notification':3,'merged':4,'independent':5}[context]] else 1
    check(context+'-'+str(step)+'-scope'+str(choice),len(wifi)==expected,{'kind':kind,'expectedVisibleIcons':expected,'actual':wifi,'roots':roots})

try:
    require_systemui_build(P+'loaded');instrument('set',P+'native-config',zero)
    for context in contexts:
        choices=[0,{'main':1,'keyguard':2,'notification':3,'merged':4,'independent':5}[context],0] if focused else [0,1,2,3,4,5,6,0]
        for step,choice in enumerate(choices):observe(context,choice,step)
finally:
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse');time.sleep(.5)
    instrument('set',P+'restore',restore)
    shell('settings delete system use_control_panel' if old_mode=='null' else 'settings put system use_control_panel '+shlex.quote(old_mode),root=True)
    assert shell('settings get system use_control_panel')==old_mode
