"""Verify retained clock, charging and hidden-bar settings after a real boot."""
import sys,json,time
import numpy as np
from PIL import Image
from adb_regression import OUTPUT,adb,shell,instrument
from lockscreen_device_helpers import capture,lock_wake,clock_layout
from statusbar_device_helpers import require_systemui_build,bounds
P=sys.argv[1];font=sys.argv[2] if len(sys.argv)>2 else '/system/fonts/NotoSerif-Regular.ttf';folder=OUTPUT/(P+'results');folder.mkdir(exist_ok=True);checks=[]
base=json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings']
restore={k:v for k,v in base.items() if k.startswith(('ls_augment_rm_lock_clock_','ls_augment_rm_lock_charge_')) or k=='ls_augment_rm_keyguard_statusbar_hide'}

def check(name,yes,detail):
    checks.append({'case':name,'pass':bool(yes),'detail':detail});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]

def sample(name,enabled):
    shell('input tap 608 1800');r=capture(P+name);assert r['keyguard'] and r['awake']
    c=next(n for n in r['visible'] if n.get('id')=='com.android.systemui:id/clock_view')
    layout=clock_layout(P+name,'LockScreenClockDefault',c['text'])
    check(name+'-clock',c['text'].count(':')==(2 if enabled else 1),layout)
    period=[n['text'] for n in r['visible'] if n.get('id')=='com.android.systemui:id/am_pm']
    check(name+'-period',bool(period)==enabled,period)
    text=[n['text'] for n in r['visible'] if n.get('id')=='null' and 'mA' in n.get('text','')]
    check(name+'-details',bool(text)==enabled and (not enabled or all(unit in text[0] for unit in ['°C','mA','V','W'])),text)
    a=np.asarray(Image.open(OUTPUT/(P+name)/'screen.png').convert('RGB'));ink=int((a[:107].max(axis=2)<150).sum())
    check(name+'-top-bar',ink<30 if enabled else ink>1500,{'darkPixels':ink})
    b=bounds(c);mask=a[b[1]:b[3],b[0]:b[2]].max(axis=2)<150
    occupied=mask.any(axis=0);xs=np.where(occupied)[0];start=int(xs[0]);end=start
    while end<len(occupied) and occupied[end]:end+=1
    glyph=mask[:,start:end];ys=np.where(glyph)[0]
    return {'digit':c['text'][0],'width':end-start,'height':int(ys.max()-ys.min()+1),'pixels':int(glyph.sum())}

try:
    require_systemui_build(folder.name);instrument('set',P+'baseline',restore);lock_wake();sample('native',False)
    values={'lock_clock_seconds':1,'lock_clock_period':1,'lock_clock_font':font,'lock_clock_scale':.5,
        'lock_charge_details':1,'lock_charge_interval':5,'lock_charge_text_size':18,'lock_charge_line_gap':10,'keyguard_statusbar_hide':1}
    instrument('set',P+'on-config',{'ls_augment_rm_'+k:str(v) for k,v in values.items()});lock_wake();beforeFont=sample('before-boot',True)
    before={'at':shell('date -Iseconds'),'bootId':shell('cat /proc/sys/kernel/random/boot_id'),'uptime':shell('cat /proc/uptime')}
    (folder/'before-boot.json').write_text(json.dumps(before,indent=2),encoding='utf-8');adb('reboot');print('Real reboot requested.',flush=True)
    for i in range(100):
        time.sleep(1)
        try:
            if shell('getprop sys.boot_completed',timeout=5)=='1':break
        except Exception:pass
    else:raise RuntimeError('Boot completion not observed')
    time.sleep(5);shell('setprop log.tag.LSA.ClockFit D',root=True);shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(P+'loaded-after-boot');lock_wake()
    after={'at':shell('date -Iseconds'),'bootId':shell('cat /proc/sys/kernel/random/boot_id'),'uptime':shell('cat /proc/uptime')}
    (folder/'after-boot.json').write_text(json.dumps(after,indent=2),encoding='utf-8');check('real-boot-id-changed',after['bootId']!=before['bootId'],after)
    afterFont=sample('after-boot',True)
    check('font-glyph-retained-after-boot',beforeFont['digit']==afterFont['digit'] and abs(beforeFont['width']-afterFont['width'])<=1 and abs(beforeFont['height']-afterFont['height'])<=1 and abs(beforeFont['pixels']-afterFont['pixels'])<=max(15,beforeFont['pixels']*.03),{'font':font,'before':beforeFont,'after':afterFont})
    instrument('set',P+'hot-off-config',restore);time.sleep(.6);sample('hot-off',False)
    lock_wake();sample('off-wake',False)
finally:
    instrument('set',P+'restore',restore);shell('input keyevent 224');shell('wm dismiss-keyguard')
