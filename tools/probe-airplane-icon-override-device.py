"""Use actual airplane mode to exercise the native signal-policy hide branch."""
import sys,json,time,shlex
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows,nodes
from quicksettings_device_helpers import restart_ui
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);observations=[]
base=instrument('snapshot',P+'baseline')['settings'];keys=['ls_augment_rm_ignore_system_icon_hide','ls_augment_rm_hidden_icon_slots']
restore={k:base[k] for k in keys};old=shell('settings get secure status_bar_keys_close');flight=shell('settings get global airplane_mode_on');wifi=shell('settings get global wifi_on');bt=shell('settings get global bluetooth_on')
(out/'native-original.json').write_text(json.dumps({'status_bar_keys_close':old,'airplane_mode_on':flight,'wifi_on':wifi,'bluetooth_on':bt}),encoding='utf-8')
def take(name):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    label=P+name;w=all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    n=[{k:n.get(k) for k in ['id','description','bounds']} for n in nodes(w) if n.get('visible') and n.get('package')=='com.android.systemui' and '飞行' in n.get('description','')]
    observations.append({'case':name,'actualIcons':n});(out/'observations.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8');print(name,n,flush=True)
try:
    instrument('set',P+'native-config',dict(zip(keys,['0',''])));shell('settings delete secure status_bar_keys_close',root=True)
    shell('cmd connectivity airplane-mode enable');time.sleep(3);take('native')
    shell('settings put secure status_bar_keys_close airplane',root=True);time.sleep(.8);take('blocked')
    instrument('set',P+'override-config',{'ls_augment_rm_ignore_system_icon_hide':'1'});time.sleep(.8);take('override-hot')
    restart_ui(P+'restart-loaded');take('override-restart')
    instrument('set',P+'off-config',{'ls_augment_rm_ignore_system_icon_hide':'0'});time.sleep(.8);take('off-hot')
    restart_ui(P+'off-loaded');take('off-restart')
finally:
    instrument('set',P+'restore',restore)
    shell('settings delete secure status_bar_keys_close' if old=='null' else 'settings put secure status_bar_keys_close '+shlex.quote(old),root=True)
    shell('cmd connectivity airplane-mode '+('enable' if flight=='1' else 'disable'));time.sleep(3)
    if shell('settings get global wifi_on')!=wifi:shell('svc wifi '+('enable' if wifi in ['1','2'] else 'disable'))
    if shell('settings get global bluetooth_on')!=bt:shell('cmd bluetooth_manager '+('enable' if bt=='1' else 'disable'))
    time.sleep(3);restart_ui(P+'restored-loaded');assert shell('settings get global airplane_mode_on')==flight
    (out/'radios-restored.json').write_text(json.dumps({'wifi':shell('settings get global wifi_on'),'bluetooth':shell('settings get global bluetooth_on'),'airplane':shell('settings get global airplane_mode_on'),'wifiStatus':shell('cmd wifi status')}),encoding='utf-8')
