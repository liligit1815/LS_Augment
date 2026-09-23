"""Use Android's native icon blacklist to test the override against an actual icon."""
import sys,json,time,shlex
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows
from quicksettings_device_helpers import restart_ui
P=sys.argv[1];nativeKey='status_bar_keys_close' if '--oem' in sys.argv else 'icon_blacklist';out=OUTPUT/(P+'results');out.mkdir(exist_ok=True)
base=instrument('snapshot',P+'baseline')['settings'];keys=['ls_augment_systemui_master','ls_augment_rm_ignore_system_icon_hide','ls_augment_rm_hidden_icon_slots']
restore={k:base[k] for k in keys};old=shell('settings get secure '+nativeKey)
(out/'native-original.json').write_text(json.dumps({nativeKey:old}),encoding='utf-8')
def capture(name):
    shell('am start -W -n ls.augment.com/.SettingsActivity');time.sleep(1)
    label=P+name;all_windows(label);(OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    (OUTPUT/label/'native-dump.txt').write_text(shell('dumpsys activity service com.android.systemui/.SystemUIService'),encoding='utf-8')
    print(name,flush=True)
try:
    instrument('set',P+'native-config',dict(zip(keys,['0','0',''])))
    shell('settings delete secure '+nativeKey,root=True);restart_ui(P+'native-loaded');capture('native')
    shell('settings put secure '+nativeKey+' bluetooth',root=True);restart_ui(P+'blocked-loaded');capture('blocked')
    instrument('set',P+'override-config',{'ls_augment_rm_ignore_system_icon_hide':'1'});restart_ui(P+'override-loaded');capture('override')
    instrument('set',P+'off-config',{'ls_augment_rm_ignore_system_icon_hide':'0'});restart_ui(P+'off-loaded');capture('off')
finally:
    instrument('set',P+'restore',restore)
    shell('settings delete secure '+nativeKey if old=='null' else 'settings put secure '+nativeKey+' '+shlex.quote(old),root=True)
    restart_ui(P+'restore-loaded');assert shell('settings get secure '+nativeKey)==old
