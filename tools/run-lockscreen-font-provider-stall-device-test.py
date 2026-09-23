"""Restart SystemUI with the font provider briefly paused, then verify recovery."""
import sys,json,time,re
from adb_regression import OUTPUT,instrument,shell
from lockscreen_device_helpers import lock_wake,capture,clock_layout
from statusbar_device_helpers import require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[];paused=None
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_clock_')}
font='font:'+json.loads((OUTPUT/'round22f-ui-results/font-ownership.json').read_text(encoding='utf-8'))['hash']
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def sample(name):
    r=capture(P+name);c=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    return r,c
try:
    require_systemui_build(folder.name)
    instrument('set',P+'config',dict(restore,ls_augment_rm_lock_clock_seconds='1',ls_augment_rm_lock_clock_font=font,ls_augment_rm_lock_clock_scale='0.5'))
    lock_wake();r,before=sample('before');beforeLayout=clock_layout(P+'before','LockScreenClockDefault',before['text'])
    original=shell('pidof com.android.systemui');paused=shell('pidof ls.augment.com');assert re.fullmatch(r'\d+',paused)
    shell('kill -STOP '+paused,root=True);start=time.monotonic();shell('kill -9 '+original,root=True);time.sleep(3)
    lock_wake();r,blocked=sample('blocked');check('restarted-ui-remains-responsive',r['systemui']!=original and r['awake'] and r['keyguard'] and blocked['text'].count(':')==2,{'oldPid':original,'currentPid':r['systemui'],'clock':blocked['text']})
    time.sleep(2);r,second=sample('blocked-tick');check('clock-keeps-ticking-while-font-provider-paused',second['text']!=blocked['text'],{'first':blocked['text'],'second':second['text']})
    shell('kill -CONT '+paused,root=True);paused=None
    check('provider-pause-completed',True,{'pauseSeconds':time.monotonic()-start})
    time.sleep(2);shell('input tap 608 1800');r,after=sample('recovered');afterLayout=clock_layout(P+'recovered','LockScreenClockDefault',after['text'])
    check('imported-font-recovers-without-changing-setting',afterLayout['width']==beforeLayout['width'],{'before':beforeLayout,'after':afterLayout})
    require_systemui_build(P+'loaded-after-recovery')
finally:
    if paused:shell('kill -CONT '+paused,root=True)
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
