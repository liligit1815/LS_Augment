"""Verify seconds alone and first display with configuration already enabled."""
import sys,json
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,sample,complete,RESTORE
from quicksettings_device_helpers import restart_ui

P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def inspect(name):
    r=sleep_sample(P+name);m=r['clocks']['clock_minute_view']
    check(name+'-complete',complete(r) and m.get('extraHeight',0)<=m.get('extraHeightLimit',0) and m.get('extraEllipsis',0)==0,m)
    return r
try:
    select_native(16,P+'style');shell('setprop log.tag.LSA.ClockFit D',root=True)
    config(P+'seconds',{'seconds':1});r=inspect('seconds-only');t=r['clocks']['clock_minute_view']['extraText']
    check('seconds-only-without-period',t.startswith('· ') and t[2:].isdigit(),t)
    later=sample(P+'seconds-tick');check('seconds-only-ticks',later['clocks']['clock_minute_view']['extraText']!=t and complete(later),later['clocks'])
    config(P+'startup',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font})
    before=inspect('before-restart');restart_ui(P+'restart-loaded');after=inspect('after-restart')
    a=after['clocks']['clock_minute_view'];b=before['clocks']['clock_minute_view']
    check('first-display-retains-custom-font-and-scale',a['compositionScale']==.5 and a['size']==b['size'] and after['firstDigit']['clock_hour_view']==before['firstDigit']['clock_hour_view'] and any(v in a['extraText'] for v in ['凌晨','早上','上午','中午','下午','傍晚','晚上']),{'before':before['firstDigit'],'after':after['firstDigit'],'layout':a})
    config(P+'off',{});off=inspect('off');check('off-removes-extra',all('extraText' not in v for v in off['clocks'].values()),off['clocks'])
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
