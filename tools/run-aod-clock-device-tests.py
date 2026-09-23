"""Real ADB AOD cases, checked against actual layout, pixels and native siblings."""
import sys,json,time
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import config,sleep_sample,sample,select_native,restore_native,dimensions,complete,RESTORE

P=sys.argv[1];index=int(sys.argv[2]);mode=sys.argv[3] if len(sys.argv)>3 else 'full'
folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def take(name,values):
    config(P+name,values);r=sleep_sample(P+name)
    check(name+'-complete-layout',complete(r),r['clocks'])
    return r

def stable_siblings(native,other):
    keys=[k for k in native['visible'] if k in ['month','day','date','date_view','clock','mfv_battery_meterview','mfv_charge_indicator_outside','mfv_battery_level_outside'] and k not in native['clocks']]
    return all(k in other['visible'] and dimensions(native,k)==dimensions(other,k) for k in keys)

try:
    select_native(index,P+'style');shell('setprop log.tag.LSA.ClockFit D',root=True)
    native=take('native',{});clock=next((k for k,v in native['clocks'].items() if 'm' in v['format']),None)
    glyphClock=next((k for k,v in native['clocks'].items() if any(c in v['format'] for c in 'HhKk')),clock)
    if mode=='image':
        check('image-style-no-time-text',not native['clocks'],native['layouts'])
        on=take('image-on',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font})
        check('image-date-battery-preserved',stable_siblings(native,on),{'native':native['visible'],'on':on['visible']})
    else:
        check('native-time-text',clock is not None,native['clocks'])
        on=take('on',{'seconds':1,'period':1})
        colonCount=native['visible'][clock]['text'].count(':')+1
        # Style 19 draws each time segment in two native masked halves.
        # Those paired layers represent one displayed time, not two periods.
        check('seconds-period-and-native-siblings',on['visible'][clock]['text'].count(':')==colonCount and sum(any(v in t['text'] for v in ['凌晨','早上','上午','中午','下午','傍晚','晚上']) for k,t in on['clocks'].items() if not k.endswith('_down'))==1 and stable_siblings(native,on),on['visible'])
        tick=sample(P+'tick');check('real-seconds-tick',tick['visible'][clock]['text']!=on['visible'][clock]['text'] and complete(tick),tick['clocks'])
        half=take('half',{'seconds':1,'period':1,'clock_scale':.5})
        check('half-scale-visible',half['firstDigit'][glyphClock]['height']<on['firstDigit'][glyphClock]['height']*.8 and stable_siblings(native,half),half['firstDigit'])
        serif=take('font',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font})
        check('imported-font-visible',abs(serif['firstDigit'][glyphClock]['pixels']-half['firstDigit'][glyphClock]['pixels'])>half['firstDigit'][glyphClock]['pixels']*.1 and stable_siblings(native,serif),serif['firstDigit'])
        clear=take('font-clear',{'seconds':1,'period':1,'clock_scale':.5})
        check('font-clear-native-glyph',clear['firstDigit'][glyphClock]==half['firstDigit'][glyphClock],clear['firstDigit'])
        large=take('large',{'seconds':1,'period':1,'clock_scale':2})
        check('large-preserves-date-and-icons',stable_siblings(native,large) and large['firstDigit'][glyphClock]['height']>half['firstDigit'][glyphClock]['height'],large['visible'])
        tall=take('large-time-only',{'clock_scale':2})
        check('large-time-height-fits',stable_siblings(native,tall),tall['clocks'])
        if mode=='full':
            low=take('period-small',{'period':1,'period_scale':.3,'clock_scale':.5})
            high=take('period-large',{'period':1,'period_scale':1.5,'clock_scale':.5})
            check('period-scale-visible',high['clocks'][clock]['desiredWidth']>low['clocks'][clock]['desiredWidth']*1.1 and stable_siblings(native,high),{'small':low['clocks'],'large':high['clocks']})
            seconds=take('seconds-only',{'seconds':1})
            check('period-off-seconds-remain',seconds['visible'][clock]['text'].count(':')==colonCount and not any('\u4e00'<=c<='\u9fff' for c in seconds['visible'][clock]['text']),seconds['clocks'])
    off=take('off',{})
    # OEM proportional digits can change one pixel when the real minute advances.
    # Retain font size, height, format and non-text width; compare exact width
    # when text is identical, otherwise account for its measured advance.
    def restored_clock(k,v):
        current=off['clocks'][k];before=dimensions(native,k);after=dimensions(off,k)
        width_same=before[0]==after[0] if v['text']==current['text'] else abs((after[0]-before[0])-(current['desiredWidth']-v['desiredWidth']))<=1.01
        return width_same and before[1]==after[1] and abs(current['size']-v['size'])<.01 and current['format']==v['format']
    check('native-restore',stable_siblings(native,off) and all(restored_clock(k,v) for k,v in native['clocks'].items()),off['clocks'])
finally:
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
