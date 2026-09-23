"""Exercise real 12/24-hour changes without changing the phone's actual time."""
import sys,json,time,shlex
from adb_regression import OUTPUT,shell,instrument
from lockscreen_device_helpers import capture,lock_wake,clock_layout
from statusbar_device_helpers import bounds,require_systemui_build
P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith('ls_augment_rm_lock_clock_')}
old=shell('settings get system time_12_24');(folder/'original-time-format.txt').write_text(old,encoding='utf-8')

def sample(name):
    shell('input tap 608 1800');r=capture(P+name);assert r['awake'] and r['keyguard']
    c=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    period=[n['text'] for n in r['visible'] if n.get('id')=='com.android.systemui:id/am_pm']
    layout=clock_layout(P+name,'LockScreenClockDefault',c['text'])
    return {'text':c['text'],'bounds':bounds(c),'period':period,'layout':layout}

def config(name,values):
    shell('input tap 608 1800');instrument('set',P+name+'-config',{'ls_augment_rm_lock_clock_'+k:str(v) for k,v in values.items()});time.sleep(.5)

def check(name,yes,value):
    checks.append({'case':name,'pass':bool(yes),'detail':value});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

try:
    require_systemui_build(folder.name);instrument('set',P+'baseline',restore);lock_wake();native24=sample('native24')
    shell('settings put system time_12_24 12',root=True);time.sleep(.7);native12=sample('native12')
    expected=int(shell('date +%H'))%12 or 12
    check('native12-selected',int(native12['text'].split(':')[0])==expected and native12['text'].count(':')==1,native12)
    config('on',{'seconds':1,'period':1});on=sample('on12')
    check('12-hour-seconds-period',int(on['text'].split(':')[0])==expected and on['text'].count(':')==2 and bool(on['period']),on)
    time.sleep(1.5);tick=sample('tick12');check('12-hour-ticks',tick['text']!=on['text'],tick)
    config('off12',{'seconds':0,'period':0});off12=sample('off12')
    check('12-hour-native-restored',off12['text'].count(':')==1 and off12['period']==native12['period'] and off12['bounds']==native12['bounds'],off12)
    config('on24',{'seconds':1,'period':1});shell('settings put system time_12_24 24',root=True);time.sleep(.7);on24=sample('on24')
    check('live-back-to24',int(on24['text'].split(':')[0])==int(shell('date +%H')) and on24['text'].count(':')==2,on24)
    config('off24',{'seconds':0,'period':0});off24=sample('off24')
    check('24-hour-native-restored',off24['bounds']==native24['bounds'] and off24['period']==native24['period'],off24)
    config('missing-font',{'font':'/data/local/tmp/LSA-nonexistent-clock-font.ttf'});missing=sample('missing-font')
    check('missing-font-native-fallback',missing['bounds']==off24['bounds'] and abs(missing['layout']['size']-off24['layout']['size'])<.01,missing)
    config('clear-missing-font',{'font':''});clear=sample('font-cleared');check('clear-missing-font-restores',clear['bounds']==off24['bounds'],clear)
finally:
    instrument('set',P+'restore',restore)
    shell('settings delete system time_12_24' if old=='null' else 'settings put system time_12_24 '+shlex.quote(old),root=True)
    shell('input keyevent 224');shell('wm dismiss-keyguard')
