"""Offline ownership/recovery and saved-pixel tests; any phone API call fails."""
import copy
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
from unittest.mock import patch
import numpy as np
from PIL import Image

ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
spec=importlib.util.spec_from_file_location('summary_priority_test',ROOT/'tools/run-safe-statusbar-summary-priority-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
import adb_regression as ar
def forbidden(*a,**k): raise AssertionError('OFFLINE TEST ATTEMPTED PHONE API')
ar.shell=ar.adb=ar.instrument=forbidden
checks=0
def check(value,message):
    global checks
    assert value,message
    checks+=1
def raises(fn,error=Exception):
    global checks
    try: fn()
    except error: checks+=1;return
    raise AssertionError('Expected rejection')
def baseline():
    d={'filler'+str(i):'' for i in range(497-len(m.KEYS))}
    d.update({m.EN:'0',m.MODE:'0',m.SYMBOL:'♥',m.TEXT:'old',m.ASSET:'',m.SIZE:'18',m.PR:'0',m.LIMIT:'0',m.ORDER:''})
    return d
def make(folder,case='priority'):
    return m.Journal(folder/'restore.json',baseline(),{'case':case,'nativeBaseline':{},'installedVersion':20459}, {'original.asset':'hash'},{'original':'name'})

class Fake(m.Collector):
    def __init__(self,journal,pixels_fail=False,external_capture=False,protection_fail=False):
        self.journal=journal;self.folder=journal.path.parent;self.current=dict(journal.data['baseline']);self.report={'cases':[]};self.sets=[]
        self.pixels_fail=pixels_fail;self.external_capture=external_capture;self.protection_fail=protection_fail
    def instrument(self,operation,label,values=None):
        if operation=='set':self.sets.append(dict(values));self.current.update(values)
        elif operation!='snapshot':raise AssertionError('Unexpected operation')
        return {'settings':dict(self.current)}
    def protected(self,label):
        if self.protection_fail:raise m.extra.Inconclusive('file changed')
        return {'resources':{},'names':{},'native':{}}
    def capture(self,label):
        if self.external_capture:self.current['filler0']='external'
        if self.pixels_fail:raise m.extra.Inconclusive('screen asleep')
        self.report['cases'].append({'case':label})
    def persist(self):m.atomic(self.folder/'report.json',self.report)

with tempfile.TemporaryDirectory() as tmp:
    parent=Path(tmp)
    def directory(name):p=parent/name;p.mkdir();return p
    j=make(directory('initial'))
    saved=json.loads(j.path.read_text('utf-8'))
    check(len(saved['baseline'])==497 and saved['resourcesBefore'] and saved['namesBefore'],'Initial durable record must be complete')
    check(saved['pending'] and saved['restore']=={} and saved['inflight']=={},'Initial write precedes mutations')
    for k in m.KEYS:
        candidate={k:'1' if k in (m.PR,m.EN,m.MODE,m.LIMIT) else '18' if k==m.SIZE else ''}
        check(j.valid_values(candidate)==(k in (m.PR,m.LIMIT,m.ORDER)),'Case-specific key whitelist')
    raises(lambda:j.plan({'ls_augment_systemui_master':'1'},baseline()),ValueError)
    raises(lambda:j.plan({m.EN:'1'},baseline()),ValueError)
    for key,value in [(m.LIMIT,'-1'),(m.LIMIT,'21'),(m.LIMIT,'01'),(m.ORDER,'wifi'),(m.ORDER,'volume,volume'),(m.PR,'true')]:
        check(not m.valid_value(key,value),'Reject non-reviewed input')
    for key,value in [(m.SIZE,'7'),(m.SIZE,'41'),(m.TEXT,'x'*13),(m.TEXT,'a\nb'),(m.ASSET,'x'*64),(m.MODE,'3')]:
        check(not m.valid_value(key,value),'Summary value validation')
    check(m.valid_value(m.TEXT,'😀'*12),'Use codepoint length')
    check(m.valid_value(m.ORDER,'bluetooth,volume,cooling_fan'),'Valid rank identifiers')
    j.plan({m.PR:'1',m.LIMIT:'1'},baseline())
    check(j.data['expected']=={} and j.data['inflight'][m.PR]==['0','1'],'Write-ahead before ack')
    check(j.owned_value(m.PR,'0') and j.owned_value(m.PR,'1') and not j.owned_value(m.PR,'external'),'Exact inflight ownership')
    j.acknowledge({m.PR:'1',m.LIMIT:'1'})
    check(j.data['inflight']=={} and j.data['expected'][m.PR]=='1','Ack clears inflight')
    foreign=dict(baseline(),**{m.PR:'external'})
    raises(lambda:j.plan({m.LIMIT:'0'},foreign),ValueError)
    tampered=copy.deepcopy(j.data);tampered['restore']['filler0']='x';bad=directory('foreign')/'restore.json';m.atomic(bad,tampered)
    raises(lambda:m.Journal(bad),ValueError)
    broken=copy.deepcopy(j.data);broken.pop('resourcesBefore');bad2=directory('broken')/'restore.json';m.atomic(bad2,broken)
    raises(lambda:m.Journal(bad2),ValueError)
    check((j.path.parent/'report.json').exists() is False and m.Journal(j.path).data['baseline']==baseline(),'Report absence cannot block valid journal load')
    for name,pixels_fail,external_capture in [('ok',False,False),('pixels-missing',True,False),('external-during-pixels',False,True)]:
        owner=make(directory(name));owner.plan({m.PR:'1',m.LIMIT:'1'},baseline());owner.acknowledge({m.PR:'1',m.LIMIT:'1'})
        fake=Fake(owner,pixels_fail,external_capture);fake.current.update({m.PR:'1',m.LIMIT:'1'})
        with patch.object(m.time,'sleep',lambda _:None):
            if external_capture:raises(fake.restore,m.extra.Inconclusive)
            else:fake.restore()
        check(fake.current[m.PR]=='0' and fake.current[m.LIMIT]=='0','Original values restored')
        check(owner.data['configurationDifferences']==[{},{}],'Two full497 reads')
        check(owner.data['configurationRestored']==(not external_capture),'Final state overrides earlier successful restore reads')
        check(owner.data['pending']==external_capture,'Only actual ownership/restoration uncertainty remains pending')
        if pixels_fail:
            check(owner.data['restoredPixelState']=='not-observed' and 'screen asleep' in owner.data['restoredPixelError'],'Pixel failure honestly separate from config success')
            check(fake.report['configurationRestored'] and not fake.report['restorePending'],'No false configuration failure for image-only loss')
        elif not external_capture:check(owner.data['restoredPixelState']=='collected-review-required','Capture is not automatic pixel pass')
        else:check(owner.data['postSamplingConfigurationDifference']['filler0']['actual']=='external','Change during final frames cannot close journal')
    owner=make(directory('external-owned'));owner.plan({m.PR:'1',m.LIMIT:'1'},baseline());owner.acknowledge({m.PR:'1',m.LIMIT:'1'})
    fake=Fake(owner);fake.current.update({m.PR:'external',m.LIMIT:'1'})
    with patch.object(m.time,'sleep',lambda _:None):raises(fake.restore,m.extra.Inconclusive)
    check(fake.current[m.PR]=='external' and fake.current[m.LIMIT]=='0','Preserve external owned key, restore unaffected own key')
    check(all(m.PR not in v for v in fake.sets),'Never write over external value')
    check(owner.data['pending'] and owner.data['externalValuesPreserved']=={m.PR:'external'},'External reason durable')
    owner=make(directory('protection'));fake=Fake(owner,protection_fail=True)
    with patch.object(m.time,'sleep',lambda _:None):raises(fake.restore,m.extra.Inconclusive)
    check(owner.data['pending'],'Changed resource must keep recovery pending')
    # interrupted save before ACK remains exactly owned and recoverable
    owner=make(directory('inflight'));owner.plan({m.PR:'1'},baseline());fake=Fake(owner);fake.current[m.PR]='1'
    with patch.object(m.time,'sleep',lambda _:None):fake.restore()
    check(fake.current[m.PR]=='0' and not owner.data['pending'],'Interrupted setter recovery')
    check(owner.data['actualChangedKeys']==[m.PR] and fake.report['attemptedKeys']==[m.PR],'Recovery records observed change when save reply/ACK was lost')
    foreign=dict(baseline());foreign['filler1']='external'
    raises(lambda:fake.assert_config(foreign),m.extra.Inconclusive)
    check('filler1' in owner.data['unexpectedConfiguration'],'Unrelated config changes are observed before any next set')

for case in m.CASES:
    missing='a'*64;plan=m.phases(case,missing)
    check(all(set(v)<=m.allowed_for(case) and all(m.valid_value(k,x) for k,x in v.items()) for _,v in plan),'All phase writes within scoped valid keys')
check(dict(m.phases('priority','a'*64))['native-limit-zero']=={m.LIMIT:'0'},'Zero means native limit, not hide-all')
raises(lambda:m.phases('anything','a'*64),ValueError)
raw='  Notification List:\n    NotificationRecord(0x01: pkg=test user=UserHandle{0} id=1 tag=own importance=2 key=one: Notification())\n  mArchive=\n    NotificationRecord(0x02: pkg=other user=UserHandle{0} id=2 tag=old importance=2 key=old: Notification())\n'
check(len(m.notification_records(raw))==1,'Read active only, never archive')
raises(lambda:m.notification_records('Permission Denial'),m.extra.Inconclusive)
raises(lambda:m.notification_records('  Notification List:\n    NotificationRecord(unknown)\n'),m.extra.Inconclusive)
check(m.notification_records('  Notification List:\n  mArchive=\n')==[],'Recognized empty list')
node={'id':m.extra.ID+'status_bar','visible':True,'bounds':'[0,0][1216,107]','children':[{'visible':True,'class':'android.widget.ImageView','bounds':'[380,37][267,70]'}]}
box,geometry=m.main_geometry([{'root':node}],(1216,2688))
check(box==[0,0,1216,107] and len(geometry)==2,'Invalid child box never bounds full-bar capture')
raises(lambda:m.main_geometry([{'root':node},{'root':node}],(1216,2688)),m.extra.Inconclusive)
frames=[]
for i in range(8):
    a=np.full((107,1216,3),232,dtype=np.uint8);a[24:83,234:293]=(255,0,0) if i%2 else (0,255,0);frames.append(Image.fromarray(a))
pixels=m.pixel_series(frames)
check(pixels['samePixelsObservedRedAndGreen']==3481 and pixels['redGreenCandidateBounds']==[234,24,293,83],'Real located GIF pixels outside bad container')
check(not pixels['visualPass'],'Candidate color is never auto-pass')
check(m.pixel_series([frames[0]]*8)['samePixelsObservedRedAndGreen']==0,'Static image cannot count as animation')
raises(lambda:m.pixel_series(frames[:7]),ValueError)
assets=m.verify_local_assets()
check(set(assets)=={m.PNG,m.GIF} and assets[m.GIF]['frames']==2,'Existing source byte hashes and decode verified offline')
saved=ROOT/'out/full-function-audit-20261004/main-user-assets-20458-20261004-103526'
report=json.loads((saved/'report.json').read_text('utf-8'))
windows=json.loads((saved/'rows-00/result-private.json').read_text('utf-8'))['uiWindows']
check(m.main_geometry(windows,(1216,2688))[0]==[0,0,1216,107],'Actual ROM tree replay uses whole main bar')
with Image.open(saved/'rows-00/frame-00.png') as image:
    observed=m.check_priority_candidates(report['cases'][1],image.crop((0,0,1216,107)))
check(observed['volume']['darkPixels']==847 and observed['bluetooth']['darkPixels']==358,'Actual same-ROM visible-hint ink prerequisite')
print(json.dumps({'checks':checks,'passed':True,'phoneOperations':0,'sourceAssets':assets},ensure_ascii=False,indent=2))
