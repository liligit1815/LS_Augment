"""Select a native clock layout in its actual persisted model, then restore it."""
import sys,time,json,shlex,hashlib,re,xml.etree.ElementTree as ET
from PIL import Image
import numpy as np
from adb_regression import OUTPUT,shell,adb,instrument
from statusbar_device_helpers import require_systemui_build,bounds
from lockscreen_device_helpers import lock_wake,capture,clock_layout
P=sys.argv[1];index=int(sys.argv[2]);folder=OUTPUT/P;folder.mkdir(exist_ok=True)
remote='/data/user_de/0/com.android.systemui/shared_prefs/clockStyle.xml'
original=adb('exec-out','su -c '+shlex.quote('cat '+remote))
originalPath=folder/'clockStyle-original.xml';originalPath.write_bytes(original)
(folder/'original-sha256.txt').write_text(hashlib.sha256(original).hexdigest(),encoding='utf-8')
os=json.loads((OUTPUT/'round21-lockscreen-baseline/os-settings-private.json').read_text(encoding='utf-8'))['system']
checks=[]
def check(name,yes,value):
    checks.append({'case':name,'pass':bool(yes),'detail':value});(folder/'results.json').write_text(json.dumps(checks,ensure_ascii=False,indent=2),encoding='utf-8');print(checks[-1],flush=True);assert yes,checks[-1]
def sample(name):
    shell('input tap 608 1800');r=capture(P+'-'+name);assert r['keyguard'] and r['awake']
    names={'clock_hour_view':'hours','clock_minute_view':'minute','clock_minute_view_mask':'mask','hours':'hours','minute':'minute','am_pm':'am_pm'}
    n={names[x['id'].split('/')[-1]]:x for x in r['visible'] if x.get('id','').split('/')[-1] in names}
    a=np.asarray(Image.open(OUTPUT/(P+'-'+name)/'screen.png').convert('RGB'));b=bounds(n['hours']);mask=a[b[1]:b[3],b[0]:b[2]].max(axis=2)<150
    occupied=np.any(mask,axis=0);start=int(np.where(occupied)[0][0]);end=start
    while end<len(occupied) and occupied[end]:end+=1
    mask[:,:start]=False;mask[:,end:]=False;ys,xs=np.where(mask)
    layout=clock_layout(P+'-'+name,{0:'LockScreenClockHorizen',1:'LockScreenClockClip',3:'LockScreenClockVertical'}[index],n['minute']['text'])
    if index==1:assert layout['maskEllipsis']==0 and layout['maskText']==layout['text'] and abs(layout['maskSize']-layout['size'])<.01,layout
    seconds=[x['text'] for x in r['visible'] if re.fullmatch(r'· \d{2}',x.get('text',''))]
    if seconds:assert len(seconds)==1 and layout.get('secondsEllipsis')==0,layout
    shown=bool(seconds) if index==1 else n['minute']['text'].count(':')==1
    tick=n['minute']['text']+(':'+seconds[0][-2:] if seconds else '')
    np.save(OUTPUT/(P+'-'+name)/'hour-ink.npy',mask)
    return {'sample':name,'hour':n['hours']['text'],'minute':n['minute']['text'],'secondsDisplayed':shown,'timeWithSeconds':tick,'period':n.get('am_pm',{}).get('text'),'hourBounds':b,'minuteBounds':bounds(n['minute']),'hourInkHeight':int(ys.max()-ys.min()+1),'hourInkPixels':int(mask.sum()),'renderedLayout':layout}

def ink_difference(a,b):
    first=np.load(OUTPUT/(P+'-'+a['sample'])/'hour-ink.npy');second=np.load(OUTPUT/(P+'-'+b['sample'])/'hour-ink.npy')
    assert first.shape==second.shape and a['hour']==b['hour']
    return float(np.logical_xor(first,second).sum()/max(1,np.logical_or(first,second).sum()))
def config(name,values):
    shell('input tap 608 1800');instrument('set',P+'-'+name+'-config',{'ls_augment_rm_lock_clock_'+k:str(v) for k,v in values.items()});time.sleep(.5)
def install(path,label):
    temp='/data/local/tmp/lsa-native-clockStyle-test.xml';adb('push',path,temp)
    pid=shell('pidof com.android.systemui')
    shell('kill -STOP '+pid,root=True)
    try:
        # Keep the existing file ownership, mode and SELinux label.
        shell('cat '+temp+' > '+remote,root=True)
        shell('kill -9 '+pid,root=True)
    finally:shell('kill -CONT '+pid+' 2>/dev/null || true',root=True)
    time.sleep(5);shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(label)
try:
    root=ET.fromstring(original);node=next(n for n in root if n.get('name')=='style_list');model=json.loads(node.text)
    model['list'][0]['clockIndex']=index;model['list'][0]['mClockIndex']=index
    node.text=json.dumps(model,ensure_ascii=False,separators=(',',':'));path=folder/'clockStyle-test.xml';path.write_bytes(ET.tostring(root,encoding='utf-8',xml_declaration=True))
    install(path,P+'-loaded');lock_wake();capture(P+'-native')
    if len(sys.argv)>3 and sys.argv[3]=='full':
        native=sample('baseline');check('native-split',len(native['hour'])==2 and len(native['minute'])==2 and not native['period'],native)
        config('on',{'seconds':1,'period':1,'scale':.5});on=sample('on-hot');check('hot-seconds-period-scale',on['secondsDisplayed'] and bool(on['period']) and on['hourInkHeight']<native['hourInkHeight']*.7,on)
        time.sleep(1.5);tick=sample('tick');check('minute-seconds-tick',tick['timeWithSeconds']!=on['timeWithSeconds'] and tick['secondsDisplayed'],tick)
        config('font',{'font':'/system/fonts/NotoSerif-Regular.ttf'});font=sample('serif');font['inkDifference']=ink_difference(font,on);check('hour-font-changes',font['inkDifference']>.15,font)
        config('font-clear',{'font':''});clear=sample('font-clear');clear['inkDifference']=ink_difference(clear,on);check('hour-font-restores',clear['inkDifference']<.03 and abs(clear['hourInkHeight']-on['hourInkHeight'])<=1,clear)
        config('scale2',{'scale':2});large=sample('scale2');check('larger-hour-with-complete-seconds',large['hourInkHeight']>on['hourInkHeight']*1.3 and large['secondsDisplayed'],large)
        config('off',{'seconds':0,'period':0,'scale':1});off=sample('off');check('hot-native-restore',not off['secondsDisplayed'] and not off['period'] and off['hourBounds']==native['hourBounds'] and off['minuteBounds']==native['minuteBounds'] and abs(off['hourInkHeight']-native['hourInkHeight'])<=1,off)
    else:
        instrument('set',P+'-on-config',{'ls_augment_rm_lock_clock_seconds':'1','ls_augment_rm_lock_clock_period':'1','ls_augment_rm_lock_clock_scale':'0.5'});lock_wake();capture(P+'-on')
finally:
    instrument('set',P+'-final-off-config',{'ls_augment_rm_lock_clock_seconds':'0','ls_augment_rm_lock_clock_period':'0','ls_augment_rm_lock_clock_scale':'1.0','ls_augment_rm_lock_clock_font':''})
    install(originalPath,P+'-restored-loaded')
    for key in ['MY_CLOCK_STYLE','clock_index','clock_style_index','clock_typeface']:shell('settings put system '+key+' '+shlex.quote(os[key]),root=True)
    lock_wake();capture(P+'-original-restored');shell('wm dismiss-keyguard')
    assert adb('exec-out','su -c '+shlex.quote('cat '+remote))==original
    shell('rm -f /data/local/tmp/lsa-native-clockStyle-test.xml')
