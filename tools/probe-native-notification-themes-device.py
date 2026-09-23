"""Compare real notification icons on light/dark surfaces and restore device state."""
import json,re,sys,time
from adb_regression import OUTPUT,adb,shell,instrument
from native_ui_helpers import all_windows
from quicksettings_device_helpers import restart_ui

prefix=sys.argv[1];out=OUTPUT/(prefix+'results');out.mkdir(exist_ok=True)
base=instrument('snapshot',prefix+'baseline')['settings']
keys=['ls_augment_systemui_master','ls_augment_rm_notification_native']
restore={k:base[k] for k in keys}
night=shell('cmd uimode night');match=re.search(r'Night mode: (\w+)',night,re.I)
assert match,night
original_night=match[1].lower()
(out/'night-original.txt').write_text(night,encoding='utf-8')
fixture='ls.augment.regression.window1'
inventory=json.loads((OUTPUT/'notification-fixtures/inventory.json').read_text(encoding='utf-8'))
component=next(x['component'] for x in inventory if x['package']==fixture and x['version']==2)
observations=[]

def capture(name,theme,enabled):
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('cmd statusbar collapse')
    shell('am force-stop '+fixture)
    shell('am start -W -n '+component+' --ez notify true');time.sleep(.5)
    shell('am start -W -a android.settings.SETTINGS');time.sleep(1)
    for where in ['bar','shade']:
        if where=='shade':shell('input swipe 170 35 170 1500 650');time.sleep(.8)
        label=prefix+name+'-'+where;all_windows(label)
        (OUTPUT/label/'screen.png').write_bytes(adb('exec-out','screencap -p'))
        observations.append({'case':name,'surface':where,'nightMode':shell('cmd uimode night'),'enabled':enabled,'evidence':label})
        (out/'observations.json').write_text(json.dumps(observations,ensure_ascii=False,indent=2),encoding='utf-8')
    shell('cmd statusbar collapse');print(name,flush=True)

try:
    for theme in ['no','yes']:
        shell('cmd uimode night '+theme);time.sleep(2)
        for phase,enabled in [('native',0),('on',1),('off',0)]:
            name=theme+'-'+phase
            instrument('set',prefix+name+'-config',{'ls_augment_systemui_master':'0','ls_augment_rm_notification_native':str(enabled)})
            restart_ui(prefix+name+'-loaded');capture(name,theme,enabled)
finally:
    shell('cmd statusbar collapse');shell('am start -W -n '+component+' --ez clear true');shell('am force-stop '+fixture)
    instrument('set',prefix+'restore',restore);shell('cmd uimode night '+original_night);restart_ui(prefix+'restore-loaded')
