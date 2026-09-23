"""Measure native power transitions from real lock/wake input and restore settings."""
import sys,json,time,re
from adb_regression import OUTPUT,shell,instrument,adb
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];out=OUTPUT/(P+'results');out.mkdir(exist_ok=True);checks=[]
base=instrument('snapshot',P+'baseline')['settings'];keys=['ls_augment_rm_lock_timeout_enabled','ls_augment_rm_lock_timeout_seconds','ls_augment_rm_charging_animation']
restore={k:base[k] for k in keys};nativeTimeout=shell('settings get system screen_off_timeout');nativeLockMs=None
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(out/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def take(name,enabled,seconds,unlocked=False):
    global nativeLockMs
    instrument('set',P+name+'-config',dict(zip(keys,[str(enabled),str(seconds),'0'])))
    shell('input keyevent 224');shell('wm dismiss-keyguard');time.sleep(.6)
    shell('input keyevent 223');time.sleep(1.2);shell('input keyevent 224')
    if unlocked:shell('wm dismiss-keyguard');shell('am start -W -n ls.augment.com/.SettingsActivity')
    folder=OUTPUT/(P+name);folder.mkdir(exist_ok=True);samples=[];start=time.monotonic();limit=6 if unlocked else (seconds if enabled else 15)+7
    while time.monotonic()-start<limit:
        raw=shell('dumpsys power');awake='mWakefulness=Awake' in raw
        wake=int(re.search(r'mLastWakeTime=(\d+)',raw)[1]);sleep=int(re.search(r'mLastSleepTime=(\d+)',raw)[1]);timeout=int(re.search(r'Screen off timeout: (\d+) ms',raw)[1])
        samples.append({'hostElapsed':time.monotonic()-start,'awake':awake,'wakeMs':wake,'sleepMs':sleep,'computedTimeoutMs':timeout})
        (folder/'power-last.txt').write_text(raw,encoding='utf-8')
        if not awake:break
        time.sleep(.15)
    (folder/'samples.json').write_text(json.dumps(samples,indent=2),encoding='utf-8')
    (folder/'screen.png').write_bytes(adb('exec-out','screencap -p'))
    display=shell('dumpsys window displays');(folder/'displays.txt').write_text(display,encoding='utf-8')
    last=samples[-1];elapsed=last['sleepMs']-last['wakeMs']
    if unlocked:
        check(name,last['awake'] and 'isKeyguardShowing=true' not in display and last['computedTimeoutMs']==int(nativeTimeout),{'samples':samples,'nativeTimeout':nativeTimeout})
    else:
        if name=='native':nativeLockMs=samples[0]['computedTimeoutMs']
        expected=seconds*1000 if enabled else nativeLockMs
        check(name,not last['awake'] and expected-700<=elapsed<=expected+1800,{'elapsedMs':elapsed,'expectedMs':expected,'samples':samples})
try:
    require_systemui_build(P+'loaded')
    for args in [('native',0,15),('minimum',1,1),('five-seconds',1,5),('thirty-seconds',1,30),('unlocked-unaffected',1,5,True),('off-native-restored',0,5)]:take(*args)
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard');assert shell('settings get system screen_off_timeout')==nativeTimeout
