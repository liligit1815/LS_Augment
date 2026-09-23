"""Use two real OEM timezones; retain both clock instances and restore OS state."""
import sys,json,time,shlex,re,hashlib
from PIL import Image
import numpy as np
from adb_regression import OUTPUT,shell,instrument
from aod_device_helpers import select_native,restore_native,config,sleep_sample,sample,RESTORE

P=sys.argv[1];folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
font='font:1e65d9bbb6864fd4a32b96a8f0de3739b667c9eac793ec2d6d00bab7adb5a965'
old={'switch':shell('settings get system double_clock_switch'),'home':shell('settings get system double_clock_time_zone'),'auto':shell('settings get global auto_time_zone'),'zone':shell('getprop persist.sys.timezone')}
(folder/'original-system-settings.json').write_text(json.dumps(old,indent=2),encoding='utf-8')
def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def inspect(name,r=None):
    label=P+name;r=sleep_sample(label) if r is None else r;clocks={}
    for v in sorted(r['clockInstances'],key=lambda x:x['uptimeMs']):clocks[(v['id'],v.get('timeZone'))]=v
    values=list(clocks.values());check(name+'-two-native-zones',len(values)==2 and {v.get('timeZone') for v in values}=={'America/New_York','Asia/Shanghai'},values)
    pixels=np.asarray(Image.open(OUTPUT/label/'screen.png').convert('RGB'));ink={}
    for v in values:
        b=list(map(int,re.findall(r'-?\d+',v['visibleBounds'])));a=pixels[b[1]:b[3],b[0]:b[2]].max(axis=2)>100
        occupied=np.where(np.any(a,axis=0))[0];check(name+'-'+v['timeZone']+'-actually-visible',len(occupied)>0,v)
        first=int(occupied[0]);end=first
        while end<a.shape[1] and a[:,end].any():end+=1
        glyph=a[:,first:end];ys=np.where(glyph)[0];crop=glyph[ys.min():ys.max()+1]
        ink[v['timeZone']]={'width':end-first,'height':crop.shape[0],'pixels':int(crop.sum()),'sha256':hashlib.sha256(np.packbits(crop).tobytes()).hexdigest()}
    check(name+'-all-layouts-complete',all(v['ellipsis']==0 and not v.get('ancestorClipped',False) and v['desiredWidth']<=v['width']-v['padding']+.01 and v['desiredHeight']<=v['height']-v['paddingVertical'] for v in values),values)
    return {'clocks':{v['timeZone']:v for v in values},'glyphs':ink}
def take(name,settings):config(P+name,settings);return inspect(name)
def restore_setting(space,key,value):shell('settings delete '+space+' '+key if value=='null' else 'settings put '+space+' '+key+' '+shlex.quote(value),root=True)
try:
    shell('input keyevent 224');shell('wm dismiss-keyguard');shell('settings put global auto_time_zone 0',root=True)
    shell('settings put system double_clock_switch 1',root=True);shell('settings put system double_clock_time_zone Asia/Shanghai',root=True)
    shell('cmd alarm set-timezone America/New_York',root=True);select_native(13,P+'style');shell('setprop log.tag.LSA.ClockFit D',root=True)
    native=take('native',{});on=take('on',{'seconds':1,'period':1})
    for zone,v in on['clocks'].items():
        hour=int(shell('TZ='+shlex.quote(zone)+' date +%H'));expected='凌晨' if hour<6 else '早上' if hour<8 else '上午' if hour<11 else '中午' if hour<13 else '下午' if hour<17 else '傍晚' if hour<19 else '晚上'
        check('real-time-'+zone,int(v['text'].split(':')[0])==hour and v['text'].count(':')==2 and expected in v['text'],{'displayed':v['text'],'zoneHour':hour,'expectedPeriod':expected})
    tick=inspect('tick',sample(P+'tick'));check('both-seconds-tick',all(tick['clocks'][z]['text']!=v['text'] for z,v in on['clocks'].items()),tick['clocks'])
    half=take('half',{'seconds':1,'period':1,'clock_scale':.5});serif=take('font',{'seconds':1,'period':1,'clock_scale':.5,'clock_font':font})
    check('both-custom-fonts-visible',all(serif['glyphs'][z]!=v for z,v in half['glyphs'].items()),{'before':half['glyphs'],'font':serif['glyphs']})
    clear=take('font-clear',{'seconds':1,'period':1,'clock_scale':.5});check('both-fonts-restored',clear['glyphs']==half['glyphs'],{'before':half['glyphs'],'after':clear['glyphs']})
    take('large',{'seconds':1,'period':1,'clock_scale':2})
    low=take('period-small',{'period':1,'period_scale':.3,'clock_scale':.5})
    high=take('period-large',{'period':1,'period_scale':1.5,'clock_scale':.5})
    check('both-period-size-boundaries',all(high['clocks'][z]['size']*1.5>v['size']*.3*1.1 for z,v in low['clocks'].items()),{'small':low['clocks'],'large':high['clocks']})
    seconds=take('seconds-only',{'seconds':1})
    check('both-periods-off-seconds-remain',all(v['text'].count(':')==2 and not any('\u4e00'<=c<='\u9fff' for c in v['text']) for v in seconds['clocks'].values()),seconds['clocks'])
    off=take('off',{})
    check('both-native-formats-restored',all(v['format']==native['clocks'][z]['format'] and abs(v['size']-native['clocks'][z]['size'])<.01 for z,v in off['clocks'].items()),off['clocks'])
finally:
    shell('cmd alarm set-timezone '+shlex.quote(old['zone']),root=True)
    restore_setting('global','auto_time_zone',old['auto']);restore_setting('system','double_clock_switch',old['switch']);restore_setting('system','double_clock_time_zone',old['home'])
    instrument('set',P+'restore',RESTORE);restore_native(P+'style');shell('input keyevent 224');shell('wm dismiss-keyguard')
    assert shell('getprop persist.sys.timezone')==old['zone']
