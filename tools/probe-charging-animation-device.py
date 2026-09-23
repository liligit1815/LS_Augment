"""Record an actual USB charging wake animation and retain its visible views."""
import sys,json,time,shlex,concurrent.futures
from adb_regression import OUTPUT,adb,shell,instrument
from lockscreen_device_helpers import capture
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];folder=OUTPUT/P;folder.mkdir(exist_ok=True)
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_charging_')}
enabled=int(sys.argv[2]) if len(sys.argv)>2 else 1
delay=int(sys.argv[3]) if len(sys.argv)>3 else 0
duration=int(sys.argv[4]) if len(sys.argv)>4 else 6
every=int(sys.argv[5]) if len(sys.argv)>5 else 1
unlockAfter=float(sys.argv[6]) if len(sys.argv)>6 else -1
remote='/data/local/tmp/lsa-'+P+'.mp4';events=[]

def event(name):events.append({'name':name,'hostMonotonic':time.monotonic(),'deviceAt':shell('date -Iseconds')})

try:
    require_systemui_build(P+'loaded');assert not shell('pidof screenrecord || true'),'Another screen recording is active'
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    instrument('set',P+'-config',{'ls_augment_rm_charging_animation':str(enabled),'ls_augment_rm_charging_every_wake':str(every),'ls_augment_rm_charging_duration':str(duration),'ls_augment_rm_charging_delay':str(delay)})
    time.sleep(.7);(folder/'battery.txt').write_text(shell('dumpsys battery'),encoding='utf-8')
    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as pool:
        start=time.monotonic();future=pool.submit(adb,'shell','screenrecord --time-limit 15 --bit-rate 5000000 '+remote,timeout=30)
        time.sleep(.8);event('recording-started');shell('input keyevent 223');time.sleep(1.2);event('wake-request');shell('input keyevent 224')
        if unlockAfter>=0:time.sleep(unlockAfter);shell('wm dismiss-keyguard');event('unlocked-before-delay')
        time.sleep(.7);capture(P+'-early');event('early-captured')
        time.sleep(3);capture(P+'-middle');event('middle-captured')
        time.sleep(2);capture(P+'-late');event('late-captured')
        future.result(timeout=30)
    adb('pull',remote,folder/'screen.mp4')
    (folder/'recording.json').write_text(json.dumps({'settings':{'enabled':enabled,'delay':delay,'duration':duration,'everyWake':every,'unlockAfter':unlockAfter},'recordCommandAt':start,'events':events,'note':'Actual physical USB state; no fake battery values or plug broadcasts.'},ensure_ascii=False,indent=2),encoding='utf-8')
finally:
    instrument('set',P+'-restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
    shell('rm -f '+shlex.quote(remote))
