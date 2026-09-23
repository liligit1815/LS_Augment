"""Verify native lockscreen clock settings while the real display remains locked."""
import sys,json,time
from pathlib import Path
from PIL import Image
import numpy as np
from adb_regression import OUTPUT,shell,instrument
from lockscreen_device_helpers import capture,lock_wake,clock_layout
from statusbar_device_helpers import bounds,require_systemui_build

P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);results=[]
saved=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in saved.items() if k.startswith('ls_augment_rm_lock_clock_')}
def keep_awake():shell('input tap 608 1800')
def config(name,values):
    keep_awake();instrument('set',P+name+'-config',{'ls_augment_rm_lock_clock_'+k:str(v) for k,v in values.items()});time.sleep(.5)
def sample(name):
    keep_awake();r=capture(P+name);assert r['keyguard'] and r['awake'],r
    c=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    ps=[n for n in r['visible'] if n.get('id')=='com.android.systemui:id/am_pm']
    b=bounds(c)
    image=np.asarray(Image.open(OUTPUT/(P+name)/'screen.png').convert('RGB'))
    mask=image[b[1]:b[3],b[0]:b[2]].max(axis=2)<150
    occupied=np.any(mask,axis=0);xs=np.where(occupied)[0];start=int(xs[0]);end=start
    while end<len(occupied) and occupied[end]:end+=1
    glyph=mask[:,start:end];ys=np.where(glyph)[0]
    # The first hour digit is unchanged while seconds/minutes advance. Compare
    # its real pixels instead of expecting proportional digits to have equal widths.
    ink={'width':end-start,'height':int(ys.max()-ys.min()+1),'pixels':int(glyph.sum())}
    layout=clock_layout(P+name,'LockScreenClockDefault',c['text'])
    return {'text':c['text'],'bounds':b,'width':b[2]-b[0],'firstDigit':ink,'period':[{k:n[k] for k in ['text','bounds']} for n in ps],'renderedLayout':layout}
def same_font(a,b):
    return abs(a['width']-b['width'])<=1 and abs(a['height']-b['height'])<=1 and abs(a['pixels']-b['pixels'])<=max(15,b['pixels']*.03)
def check(name,condition,value):
    result={'case':name,'pass':bool(condition),'detail':value};results.append(result)
    (folder/'results.json').write_text(json.dumps(results,ensure_ascii=False,indent=2),encoding='utf-8');print(result,flush=True);assert condition,result
try:
    require_systemui_build(folder.name);instrument('set',P+'baseline-config',restore);lock_wake();native=sample('native')
    check('native',native['text'].count(':')==1 and not native['period'],native)
    config('seconds-period',{'seconds':1,'period':1});on=sample('on-hot')
    ps=on['period'];full=bool(ps) and bounds(ps[0])[2]-bounds(ps[0])[0]>100
    check('seconds-period-hot-full',on['text'].count(':')==2 and full and on['bounds'][0]>=20 and bounds(ps[0])[2]<=1196,on)
    time.sleep(2);tick=sample('tick');check('seconds-tick',tick['text']!=on['text'] and tick['text'].count(':')==2,tick)
    config('scale05',{'scale':.5});half=sample('scale05');check('scale-half-hot',half['width']<on['width']*.85,half)
    config('serif',{'font':'/system/fonts/NotoSerif-Regular.ttf'});font=sample('serif');check('font-visible-change',abs(font['width']-half['width'])>15,font)
    config('font-clear',{'font':''});clear=sample('font-clear');check('font-clear-restore',same_font(clear['firstDigit'],half['firstDigit']),clear)
    config('scale2',{'scale':2});large=sample('scale2');check('large-fits-horizontal',large['width']>half['width'] and large['bounds'][0]>=20 and bounds(large['period'][0])[2]<=1196,large)
    config('period-off',{'period':0});seconds=sample('seconds-only');check('period-hot-off',not seconds['period'] and seconds['text'].count(':')==2,seconds)
    config('all-off',{'seconds':0,'scale':1});off=sample('off');check('all-off-native-geometry',off['text'].count(':')==1 and not off['period'] and off['bounds']==native['bounds'],off)
    lock_wake();wake=sample('off-wake');check('off-wake-restored',wake['text'].count(':')==1 and wake['bounds']==native['bounds'] and not wake['period'],wake)
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
