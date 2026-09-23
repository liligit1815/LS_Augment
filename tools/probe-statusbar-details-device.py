"""Retain native Wi-Fi detail and icon-slot effects, including live/off and restart."""
import sys,json,time
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes
from statusbar_device_helpers import require_systemui_build
from quicksettings_device_helpers import restart_ui

P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);observations=[]
base=instrument('snapshot',P+'baseline')['settings']
keys=['ls_augment_systemui_master','ls_augment_rm_hide_wifi_scope','ls_augment_rm_hide_wifi_activity','ls_augment_rm_hide_wifi_standard','ls_augment_rm_hidden_icon_slots','ls_augment_rm_statusbar_hide']
restore={k:base[k] for k in keys}

def capture(name):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse')
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    label=P+name;w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    icons=[{k:v for k,v in n.items() if k!='children'} for n in nodes(w) if n.get('visible') and (any(t in n.get('id','') for t in ['wifi_','status_icon']) or n.get('class','').endswith('StatusBarIconView'))]
    observations.append({'case':name,'icons':icons});(out/'observations.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8')
    print(name,icons,flush=True)

try:
    require_systemui_build(P+'loaded');zero={k:'0' for k in keys};zero['ls_augment_rm_hidden_icon_slots']=''
    instrument('set',P+'native-config',zero);capture('native')
    for name,key,value,restart in [
        ('standard-on','hide_wifi_standard','1',False),('standard-restart','hide_wifi_standard','1',True),
        ('standard-off','hide_wifi_standard','0',False),('standard-off-restart','hide_wifi_standard','0',True),
        ('arrows-on','hide_wifi_activity','1',False),('arrows-off','hide_wifi_activity','0',False),
        ('bluetooth-hidden','hidden_icon_slots','bluetooth',False),('bluetooth-hidden-restart','hidden_icon_slots','bluetooth',True),
        ('bluetooth-off','hidden_icon_slots','',False)]:
        instrument('set',P+name+'-config',{'ls_augment_rm_'+key:value})
        if restart:restart_ui(P+name+'-loaded')
        capture(name)
finally:
    instrument('set',P+'restore',restore);restart_ui(P+'restored-loaded')
