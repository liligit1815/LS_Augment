"""Verify the real diagonal masks, separate seconds and exact native restoration."""
import sys,json
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,sample,complete,dimensions,RESTORE
P=sys.argv[1];index=int(sys.argv[2]) if len(sys.argv)>2 else 16;folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def take(name,values):
    config(P+name,values);r=sleep_sample(P+name)
    check(name+'-complete',complete(r) and all(v.get('extraEllipsis',0)==0 and not v.get('extraAncestorClipped',False) and v.get('extraHeight',0)<=v.get('extraHeightLimit',0) and v.get('extraDesiredWidth',0)<=v.get('extraWidth',0)+.01 for v in r['clocks'].values()),r['clocks'])
    return r
try:
    select_native(index,P+'style');shell('setprop log.tag.LSA.ClockFit D',root=True);native=take('native',{})
    on=take('on',{'seconds':1,'period':1});m=on['clocks']['clock_minute_view']
    check('separate-seconds-period',m['format']=='mm' and m.get('extraText','').startswith('· ') and any(v in m['extraText'] for v in ['凌晨','早上','上午','中午','下午','傍晚','晚上']),m)
    tick=sample(P+'tick');check('separate-seconds-tick',tick['clocks']['clock_minute_view'].get('extraText')!=m['extraText'],tick['clocks'])
    half=take('half',{'seconds':1,'period':1,'clock_scale':.5});check('whole-composition-half',half['clocks']['clock_minute_view']['compositionScale']==.5 and half['firstDigit']['clock_hour_view']['height']<on['firstDigit']['clock_hour_view']['height']*.7,half['clocks'])
    serif=take('font',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font});check('imported-glyph-visible',serif['firstDigit']['clock_hour_view']!=half['firstDigit']['clock_hour_view'],serif['firstDigit'])
    clear=take('font-clear',{'seconds':1,'period':1,'clock_scale':.5});check('clear-restores-glyph',clear['firstDigit']['clock_hour_view']==half['firstDigit']['clock_hour_view'],clear['firstDigit'])
    large=take('large',{'seconds':1,'period':1,'clock_scale':2});check('large-within-native-composition',large['clocks']['clock_minute_view']['compositionScale']==1 and dimensions(large,'clock_hour_view')==dimensions(on,'clock_hour_view'),large['clocks'])
    small=take('period-small',{'period':1,'period_scale':.3});big=take('period-large',{'period':1,'period_scale':1.5})
    low=small['clocks']['clock_minute_view'];high=big['clocks']['clock_minute_view']
    check('period-scale-changes-visible-width',high['extraDesiredWidth']>low['extraDesiredWidth']*1.1 or (high['extraDesiredWidth']>=low['extraDesiredWidth'] and high.get('extraHeight',0)>=high.get('extraHeightLimit',1)-1),{'small':small['clocks'],'large':big['clocks'],'note':'The selected ratio is capped by actual available height.'})
    off=take('off',{});check('native-layout-and-no-extra',all('extraText' not in v and dimensions(native,k)==dimensions(off,k) for k,v in off['clocks'].items()),off['clocks'])
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
