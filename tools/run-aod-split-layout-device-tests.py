"""Check coherent split-clock scaling and real drawing across native layouts."""
import sys,json
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,complete,dimensions,RESTORE
P=sys.argv[1];indices=[int(x) for x in sys.argv[2:]] or [8,14,15,17,18]
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def take(index,name,values):
    label=P+str(index)+'-'+name;config(label,values);r=sleep_sample(label)
    check(str(index)+'-'+name+'-actually-complete',bool(r['clocks']) and complete(r),r['clocks'])
    if values:
        ratios=[v['size']/v['nativeSize'] for v in r['clocks'].values()]
        check(str(index)+'-'+name+'-native-proportions',max(ratios)-min(ratios)<.0001,ratios)
        check(str(index)+'-'+name+'-seconds-period',sum(v['text'].count(':') for v in r['clocks'].values())>=1 and sum(any(c in v['text'] for c in ['凌晨','早上','上午','中午','下午','傍晚','晚上']) for v in r['clocks'].values())==1,r['clocks'])
    return r
try:
    shell('setprop log.tag.LSA.ClockFit D',root=True)
    for index in indices:
        select_native(index,P+str(index)+'-style');native=take(index,'native',{})
        on=take(index,'on',{'seconds':1,'period':1});half=take(index,'half',{'seconds':1,'period':1,'clock_scale':.5})
        key=next(k for k,v in on['clocks'].items() if any(c in v['format'] for c in 'HhKk'))
        check(str(index)+'-half-does-not-grow',half['clocks'][key]['size']<=on['clocks'][key]['size']+.01,{'on':on['clocks'][key]['size'],'half':half['clocks'][key]['size']})
        take(index,'large',{'seconds':1,'period':1,'clock_scale':2});serif=take(index,'font',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font})
        check(str(index)+'-font-visible',serif['firstDigit'][key]!=half['firstDigit'][key],{'original':half['firstDigit'][key],'font':serif['firstDigit'][key]})
        off=take(index,'off',{});check(str(index)+'-native-restored',all(abs(off['clocks'][k]['size']-v['size'])<.01 and off['clocks'][k]['format']==v['format'] and dimensions(native,k)==dimensions(off,k) for k,v in native['clocks'].items()),off['clocks'])
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'styles');shell('input keyevent 224');shell('wm dismiss-keyguard')
