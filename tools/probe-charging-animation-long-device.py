"""Measure actual long charging animation boundaries while testing lock timeout."""
import sys,json,time,shlex,concurrent.futures
from adb_regression import OUTPUT,adb,shell,instrument
from lockscreen_device_helpers import capture
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];delay=int(sys.argv[2]);duration=int(sys.argv[3]);limit=delay+duration+10
assert 1<=duration<=120 and 0<=delay<=60 and limit<=175
folder=OUTPUT/P;folder.mkdir(exist_ok=True);base=instrument('snapshot',P+'-baseline')['settings']
keys=['ls_augment_rm_charging_animation','ls_augment_rm_charging_every_wake','ls_augment_rm_charging_duration','ls_augment_rm_charging_delay','ls_augment_rm_lock_timeout_enabled','ls_augment_rm_lock_timeout_seconds']
restore={k:base[k] for k in keys};events=[];remote='/data/local/tmp/lsa-'+P+'.mp4';record_pid='';start=0
meta={'settings':{'enabled':1,'delay':delay,'duration':duration,'everyWake':1,'unlockAfter':-1},'events':events,'note':'Actual plugged USB and screen wake; no simulated battery values. Module lock timeout 180 sec; original timeout settings restored afterward.'}

def save():
    meta['recordCommandAt']=start;(folder/'recording.json').write_text(json.dumps(meta,ensure_ascii=False,indent=2),encoding='utf-8')

def event(name):
    events.append({'name':name,'hostMonotonic':time.monotonic(),'deviceAt':shell('date -Iseconds')});save();print(name,flush=True)

try:
    require_systemui_build(P+'-loaded');assert not shell('pidof screenrecord || true')
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    instrument('set',P+'-config',dict(zip(keys,['1','1',str(duration),str(delay),'1','180'])))
    (folder/'battery.txt').write_text(shell('dumpsys battery'),encoding='utf-8');time.sleep(.8)
    with concurrent.futures.ThreadPoolExecutor(max_workers=1) as pool:
        start=time.monotonic();future=pool.submit(adb,'shell','screenrecord --time-limit '+str(limit)+' --bit-rate 5000000 '+remote,timeout=limit+35)
        time.sleep(.8);record_pid=shell('pidof screenrecord');assert record_pid.isdigit(),record_pid
        event('recording-started');shell('input keyevent 223');time.sleep(1.2);event('wake-request');shell('input keyevent 224');wake=time.monotonic()
        for target in sorted(set([5,20,delay+1,delay+duration-1,delay+duration+3])):
            if target<1:continue
            while time.monotonic()-wake<target:time.sleep(max(0,min(2,target-(time.monotonic()-wake))))
            r=capture(P+'-at'+str(target));event('captured-'+str(target))
            assert r['keyguard'] and r['awake'],{'sample':target,'awake':r['awake'],'keyguard':r['keyguard']}
        future.result(timeout=limit+35)
    adb('pull',remote,folder/'screen.mp4');event('recording-complete')
finally:
    if record_pid and record_pid in shell('pidof screenrecord || true').split():shell('kill -2 '+record_pid);time.sleep(1)
    if not (folder/'screen.mp4').exists() and shell('test -f '+shlex.quote(remote)+' && echo exists')=='exists':adb('pull',remote,folder/'screen.mp4')
    save();instrument('set',P+'-restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard');shell('rm -f '+shlex.quote(remote))
