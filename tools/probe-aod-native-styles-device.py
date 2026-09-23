"""Survey real OEM AOD layouts; observations alone do not count as passes."""
import sys,json
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,RESTORE
P=sys.argv[1];indices=list(map(int,sys.argv[2:]));folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);rows=[]
try:
    for index in indices:
        name=P+str(index)+'-';select_native(index,name+'style');shell('setprop log.tag.LSA.ClockFit D',root=True)
        config(name+'native',{});native=sleep_sample(name+'native')
        config(name+'on',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':'font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'})
        on=sleep_sample(name+'on')
        rows.append({'index':index,'native':native,'on':on});(folder/'observations.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2),encoding='utf-8')
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
