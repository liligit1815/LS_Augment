"""Observe real AOD rendering and preserve the user's original native style."""
import json,re,time,shlex,xml.etree.ElementTree as ET,hashlib
import numpy as np
from PIL import Image
from adb_regression import OUTPUT,adb,shell,instrument
from lockscreen_device_helpers import capture
from statusbar_device_helpers import require_systemui_build,bounds

BASE=OUTPUT/'round23-aod-baseline'
RESTORE={k:v for k,v in json.loads((OUTPUT/'round21-lockscreen-baseline/result-private.json').read_text(encoding='utf-8'))['settings'].items() if k.startswith('ls_augment_rm_aod_')}

def config(label,values):
    shell('input keyevent 224');shell('wm dismiss-keyguard')
    instrument('set',label+'-config',dict(RESTORE,**{'ls_augment_rm_aod_'+k:str(v) for k,v in values.items()}))

def sleep_sample(label):
    shell('input keyevent 223');time.sleep(3)
    return sample(label)

def sample(label):
    r=capture(label);assert r['keyguard'] and not r['awake'],r
    visible={n['id'].split('/')[-1]:n for n in r['visible'] if n.get('id') not in (None,'null')}
    raw=adb('logcat','-d','--pid='+r['systemui'],'-s','LSA.ClockFit:D','*:S').decode('utf-8','replace')
    (OUTPUT/label/'clock-layout-log.txt').write_text(raw,encoding='utf-8')
    records=[json.loads(line.split('LSA.ClockFit: ',1)[1]) for line in raw.splitlines() if 'LSA.ClockFit: {' in line]
    latest={}
    for x in records:
        if x['style']=='AOD' and x['id'] in visible:latest[x['id']]=x
    clocks={k:v for k,v in latest.items() if re.search(r'[HhKkm]',re.sub(r"'[^']*'",'',v['format']))}
    by_instance={}
    for x in records:
        if x.get('style')!='AOD' or 'instance' not in x or x['id'] not in visible:continue
        if not re.search(r'[HhKkm]',re.sub(r"'[^']*'",'',x['format'])):continue
        box=list(map(int,re.findall(r'-?\d+',x.get('visibleBounds',''))))
        # The dump precedes log collection by a few seconds. Match the actual
        # observed text, not a newer second whose proportional width differs.
        nodes=[n for n in r['visible'] if n.get('id','').split('/')[-1]==x['id'] and n.get('text')==x['text']]
        if len(box)==4 and any(max(abs(a-b) for a,b in zip(box,bounds(n)))<=3 for n in nodes):by_instance[x['instance']]=x
    instances=list(by_instance.values())
    image=np.asarray(Image.open(OUTPUT/label/'screen.png').convert('RGB'))
    ink={}
    for k in clocks:
        b=bounds(visible[k]);a=image[b[1]:b[3],b[0]:b[2]].max(axis=2)>100
        # OEM vertical clocks use negative margins: an hour view's empty
        # descender area can include pixels from the changing seconds below.
        # Exclude that overlap when comparing the stable hour glyph.
        if re.search(r'[HhKk]',clocks[k]['format']):
            for other in clocks:
                if other==k or 'm' not in clocks[other]['format']:continue
                q=bounds(visible[other]);left=max(b[0],q[0]);right=min(b[2],q[2])
                if b[1]<q[1]<b[3] and left<right:a[q[1]-b[1]:min(b[3],q[3])-b[1],left-b[0]:right-b[0]]=False
        occupied=np.where(np.any(a,axis=0))[0]
        if not len(occupied):continue
        start=int(occupied[0]);end=start
        while end<a.shape[1] and a[:,end].any():end+=1
        glyph=a[:,start:end];ys=np.where(glyph)[0]
        ink[k]={'width':end-start,'height':int(ys.max()-ys.min()+1),'pixels':int(glyph.sum())}
    result={'visible':{k:{'text':v['text'],'bounds':bounds(v)} for k,v in visible.items()},'clocks':clocks,'clockInstances':instances,'layouts':latest,'firstDigit':ink}
    (OUTPUT/label/'rendered.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    return result

def install_native(path,setting,label):
    remote='/data/user_de/0/com.android.systemui/shared_prefs/aodStyle.xml'
    temp='/data/local/tmp/lsa-native-aodStyle-test.xml';adb('push',path,temp)
    pid=shell('pidof com.android.systemui');assert pid.isdigit(),pid
    shell('kill -STOP '+pid,root=True)
    try:
        shell('cat '+temp+' > '+remote,root=True)
        shell('settings put system AOD_CLOCK_STYLE '+shlex.quote(setting),root=True)
        shell('kill -9 '+pid,root=True)
    finally:shell('kill -CONT '+pid+' 2>/dev/null || true',root=True)
    time.sleep(5);shell('input keyevent 224');shell('wm dismiss-keyguard');require_systemui_build(label)
    shell('rm -f '+temp)

def select_native(index,label):
    folder=OUTPUT/label;folder.mkdir(exist_ok=True)
    original=(BASE/'aodStyle-original.xml').read_bytes()
    assert hashlib.sha256(original).hexdigest()=='98f2b971825c6e863d5a73cc7ad6cdab77b68aee2c24aa480feba499f0ed94da'
    root=ET.fromstring(original);node=next(n for n in root if n.get('name')=='style_list');model=json.loads(node.text)
    model['list'][0]['index']=index;node.text=json.dumps(model,ensure_ascii=False,separators=(',',':'))
    path=folder/'aodStyle-test.xml';path.write_bytes(ET.tostring(root,encoding='utf-8',xml_declaration=True))
    setting=json.dumps(model['list'][0],ensure_ascii=False,separators=(',',':'))
    install_native(path,setting,label+'-loaded')

def restore_native(label):
    setting=json.loads((BASE/'settings-original.json').read_text(encoding='utf-8'))['AOD_CLOCK_STYLE']
    install_native(BASE/'aodStyle-original.xml',setting,label+'-restored-loaded')
    assert adb('exec-out','su -c '+shlex.quote('cat /data/user_de/0/com.android.systemui/shared_prefs/aodStyle.xml'))==(BASE/'aodStyle-original.xml').read_bytes()
    assert shell('settings get system AOD_CLOCK_STYLE')==setting

def dimensions(sample,key):
    b=sample['visible'][key]['bounds'];return b[2]-b[0],b[3]-b[1]

def complete(sample):
    return all(k in sample['firstDigit'] and x['ellipsis']==0 and not x.get('ancestorClipped',False) and x['desiredWidth']<=x['width']-x['padding']+.01 and x['desiredHeight']<=x['height']-x['paddingVertical'] for k,x in sample['clocks'].items())
