"""Explicit C-only header seconds + stack + static clear audit; import is offline.

Each case uses its own fixed120s fixture, at most6 vertical swipes, zero taps.
The frozen B collector is inherited unchanged; B journals use the B entry point.
No native setting, APK, permission, production or user notification mutation.
"""
from pathlib import Path
import argparse,contextlib,datetime,importlib.util,json,re,subprocess,time,traceback,uuid

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('combination_frozen_b',ROOT/'tools/run-safe-notification-stack-device.py')
B=importlib.util.module_from_spec(spec);spec.loader.exec_module(B)
clear=B.clear;extra=B.extra;base=B.base;atomic=B.atomic;digest=B.digest
P=B.P;SECONDS='ls_augment_rm_qs_clock_seconds';CASES=('c-original','c-yminus8');MAX_SWIPES=6
KEYS=B.KEYS|{SECONDS,clear.ALIGN,clear.X,clear.Y,clear.LIGHT,clear.DARK,clear.TRAVEL,clear.DURATION}
def profile(case,theme):
    if case not in CASES or theme not in ('light','dark'):raise ValueError('Explicit C case and actual theme required')
    return {B.STACK:'1',B.COUNT:'1',B.STEP:'8',B.INSET:'6',B.EN:'1',SECONDS:'1',clear.ALIGN:'0',clear.X:'0',
        clear.Y:'-8' if case=='c-yminus8' else '0',clear.DARK if theme=='dark' else clear.LIGHT:'#BFE0FF',clear.TRAVEL:'0',clear.DURATION:'0'}
def valid_value(key,value):
    if key==SECONDS:return value in ('0','1')
    return B.valid_value(key,value) if key in B.KEYS else key in KEYS and clear.valid_value(key,value)

class Journal(clear.Journal):
    kind='safe-notification-combination-C';mutable_keys=KEYS
    def allowed_keys(self):return set(profile(self.data['metadata']['case'],self.data['metadata']['theme']))
    def validate(self):
        d=self.data;m=d.get('metadata',{})
        if d.get('kind')!=self.kind or d.get('schema')!=1 or m.get('case') not in CASES:raise ValueError('Wrong C journal; use frozen B for B recovery')
        if not isinstance(d.get('baseline'),dict) or len(d['baseline'])!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in d['baseline'].items()):raise ValueError('Complete497 baseline required')
        if not KEYS<=d['baseline'].keys() or not all(valid_value(k,d['baseline'][k]) for k in KEYS):raise ValueError('Invalid C baseline')
        if m.get('theme') not in ('light','dark') or not isinstance(m.get('nativeBaseline'),dict) or not isinstance(m.get('notificationsBefore'),list):raise ValueError('Missing actual environment')
        if not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict):raise ValueError('Missing protection')
        for field in ('restore','allowed','expected','inflight'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=self.allowed_keys():raise ValueError('Foreign recovery keys/theme')
        if any(not set(d[f])<=set(d['restore']) for f in ('allowed','expected','inflight')):raise ValueError('Missing restore originals')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()):raise ValueError('Changed originals')
        if any(not valid_value(k,v) for k,v in d['expected'].items()):raise ValueError('Invalid expected')
        if any(not isinstance(v,list) or not v or not all(valid_value(k,x) for x in v) for f in ('allowed','inflight') for k,v in d[f].items()):raise ValueError('Invalid inflight/history')
        fixture=d.get('fixture',{})
        if fixture and (not isinstance(fixture,dict) or not isinstance(fixture.get('startAttempted'),bool) or fixture.get('seconds')!=120):raise ValueError('Wrong C lifetime')
    def valid_values(self,values):return bool(values) and set(values)<=self.allowed_keys() and all(valid_value(k,v) for k,v in values.items())

def clock_seconds(geometry):
    clocks=[n for n in geometry if n.get('id')==extra.ID+'clock' and n.get('visible')]
    if len(clocks)!=1:raise extra.Inconclusive('One visible native header clock required')
    text=re.sub(r'\s+','',clocks[0].get('text') or '')
    match=re.fullmatch(r'(\d{1,2}):(\d{2}):(\d{2})',text)
    if not match or not (0<=int(match[1])<24 and int(match[2])<60 and int(match[3])<60):raise extra.Inconclusive('Actual header seconds not observed')
    return int(match[1])*3600+int(match[2])*60+int(match[3])

def combo_layout(sample):
    geometry=sample['geometry'];ids={n['id']:n for n in geometry};clock=clock_seconds(geometry)
    required=('cc_header','clock','date','status_icons_group','notification_stack_scroller','iv_dismiss_notification_view')
    boxes={}
    for suffix in required:
        matches=[n for n in geometry if n.get('id')==extra.ID+suffix and n.get('visible')]
        if len(matches)!=1:raise extra.Inconclusive('C node absent/ambiguous: '+suffix)
        boxes[suffix]=B.legacy.rect(matches[0])
        if boxes[suffix][2]<=boxes[suffix][0] or boxes[suffix][3]<=boxes[suffix][1]:raise extra.Inconclusive('C node has no observed area: '+suffix)
    if boxes['notification_stack_scroller'][3]>boxes['iv_dismiss_notification_view'][1]:raise extra.Inconclusive('Actual stack bottom extends beneath clear; retain evidence')
    return {'clockSeconds':clock,'boxes':boxes}

def combo_pair(case):
    # Diagnostics describe reported ownership only, never substitute for pixel review.
    layouts=[combo_layout(s) for s in case['samples']]
    if len(layouts)!=2 or not 0<(layouts[1]['clockSeconds']-layouts[0]['clockSeconds'])%86400<30:raise extra.Inconclusive('Seconds did not advance in the two actual trees')
    diag=case['diagnostics'];header=diag.get('ls_augment_header_clock_runtime_1_portrait','');viewport=diag.get('ls_augment_notification_viewport_runtime','')
    if 'adapter=CCHeaderView;panel=1;clock;mode=' not in header:raise extra.Inconclusive('Notification header custom layout not reported; no C completion')
    if ';owned=true' not in viewport:raise extra.Inconclusive('Owned notification viewport not reported; no C completion')
    return {'layoutReported':True,'actualSecondsAdvance':True,'layouts':layouts,'diagnosticLimit':'May be latched; preserved with actual PNG/tree, not a visual or whole-feature pass'}

class Collector(B.Collector):
    def start_fixture(self):
        # Same frozen B launch contract; only the explicit source duration differs.
        d=self.journal.data;self.artifact_identity();self.media_audio('before-fixture')
        if not self.notifications('before-fixture'):raise extra.Inconclusive('User notifications changed')
        if self.ar.adb('shell','pidof '+B.PACKAGE,check=False).strip():raise extra.Inconclusive('Pre-existing fixture process; no reuse/kill')
        seconds=120
        now=self.elapsed();d['fixture']={'startAttempted':True,'cleanupConfirmed':False,'seconds':seconds,'launchElapsed':now,'maximumFinishElapsed':now+seconds*1000+35000,'runner':B.RUNNER,'log':'fixture-console-private.txt'};self.journal.save()
        self.fixture_log=(self.folder/'fixture-console-private.txt').open('wb')
        cmd=[str(self.ar.ADB),'-s',self.ar.SERIAL,'shell','am','instrument','-w','-r','-e','seconds',str(seconds)]
        for name in ('coverAfter','noCoverAfter','restoreCoverAfter','pauseAfter','resumeAfter','updateAfter','removeAfter'):cmd+=['-e',name,'-1']
        cmd+=['-e','operation','c17-runtime-fixture',B.RUNNER]
        self.fixture_proc=subprocess.Popen(cmd,stdout=self.fixture_log,stderr=subprocess.STDOUT)
        d['fixture']['hostPid']=self.fixture_proc.pid;self.journal.save()
        end=time.monotonic()+15
        while time.monotonic()<end:
            if self.adopt_source():return
            if self.fixture_proc.poll() is not None:break
            time.sleep(.2)
        raise extra.Inconclusive('No confirmed ready fixture; retain launch journal')
    def inject_owned(self,label,snapshot,command,target=None):
        if command!=('swipe','up'):raise ValueError('C permits upward owned vertical scrolling only; no taps')
        if self.swipes>=MAX_SWIPES:raise extra.Inconclusive('C fixed6 swipe bound reached')
        return super().inject_owned(label,snapshot,command,target)
    def capture_combo(self,label):
        snap=self.capture_stack(label);case=self.report['cases'][-1]
        try:case['combination']=combo_pair(case)
        except extra.Inconclusive as e:
            case['combination']={'layoutReported':False,'reason':str(e),'visualPass':False};self.persist();raise
        self.persist();return snap
    def exercise(self):
        self.readable=set();self.identity('preflight')
        windows,native,size=self.observe_input('original-entry');home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        kind,owner=clear.surface(windows,native,size,home)
        if kind=='home':clear.opening_path(windows,native,size,home)
        else:clear.unobstructed(windows,owner,(0,0,*size),home)
        if not size[0]<size[1]:raise extra.Inconclusive('Portrait only')
        for key in ('ls_augment_rm_qs_clock_period',P+'weather',P+'clock_portrait_enabled',P+'clock_landscape_enabled'):
            if self.journal.data['baseline'].get(key)!='0':raise extra.Inconclusive('C requires existing period/weather/large-clock off; no extra writes')
        meta=self.journal.data['metadata'];self.set('profile-before-fixture',profile(meta['case'],meta['theme']))
        self.journal.data['rawConfigured']=self.raw_expected();self.journal.save();self.start_fixture()
        self.before_input('fixture-before-open');self.open_panel('fixture-panel');self.capture_combo('top')
        reached=False
        for i in range(MAX_SWIPES+1):
            snap=self.fresh_snapshot('last-card-'+str(i)+'-before')
            combo_layout({'geometry':snap['geometry']})
            if B.legacy.unique_owned(snap,1) is not None:reached=True;break
            if self.swipes>=MAX_SWIPES:break
            self.inject_owned('last-card-'+str(i),snap,('swipe','up'));time.sleep(.35)
        if not reached:raise extra.Inconclusive('Own last card1 not fully observed within fixed bounds; user footer/card is not completion')
        self.capture_combo('own-last-card')
        samples=self.report['cases'][-1]['samples']
        if not all(1 in s['readableCandidates'] for s in samples):raise extra.Inconclusive('Own last card1 not retained across both final observations')
        self.report.update(status='collected-pixel-review-required',ownLastCardCandidate=1,wholeFeaturePassed=False,visualPass=False,
            combinationScope='Seconds+stack+static clear; exact own last card1; zero clear/content/expand actions')
        self.persist()

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--case',choices=CASES);parser.add_argument('--expected-version',required=True,type=int)
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk');args=parser.parse_args()
    if args.run and not args.case:parser.error('--run requires one explicit --case')
    import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version:raise extra.Inconclusive('Installed version mismatch')
    B.local_fixture();B.fixture_apk_hash(ar)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());meta=journal.data['metadata']
        if (meta['serial'],meta['installedVersion'],meta['installedVersionName'],meta['mainApkSha256'],meta['testApkSha256'])!=(ar.SERIAL,code,name,clear.main_apk_hash(ar),base.test_apk_hash(ar)):raise extra.Inconclusive('Recovery device/APK differs')
        ar.OUTPUT=journal.path.parent;path=ar.OUTPUT/'report.json';report=json.loads(path.read_text('utf-8')) if path.exists() else {'cases':[],'status':'reconstructed-for-recovery'}
        Collector(ar,ar.OUTPUT,journal,report).restore();return
    extra.gates(ar);testhash=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=testhash:raise extra.Inconclusive('Reviewed TestAPK mismatch')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    if home.split('/')[0]!='com.zte.mifavor.launcher':raise extra.Inconclusive('Unknown HOME')
    folder=extra.safe.AUDIT/('notification-combination-safe-%d-%s-%s'%(code,args.case,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as stream,contextlib.redirect_stdout(stream):saved=ar.instrument('snapshot','baseline')
    if saved.get('status')!='pass' or saved.get('moduleVersion')!=code:raise extra.Inconclusive('Invalid baseline')
    settings=saved['settings']
    if len(settings)!=497 or settings.get('ls_augment_systemui_master')!='1':raise extra.Inconclusive('Complete497 and already-enabled SystemUI required')
    reader=Collector.__new__(Collector);reader.ar=ar;reader.awake();resources,names,native=reader.resources(),reader.names(),reader.native()
    raw=ar.shell('dumpsys notification',timeout=40);(folder/'original-notification-private.txt').write_text(raw,encoding='utf-8');records=B.active_notifications(raw)
    if any(r['package']==B.PACKAGE for r in records):raise extra.Inconclusive('Existing fixture notification')
    _,notifications=B.partition_notifications(records)
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'case':args.case,'homeComponent':home,'theme':native['effectiveTheme'],'nativeBaseline':native,'notificationsBefore':notifications,
        'mainApkSha256':clear.main_apk_hash(ar),'testApkSha256':testhash,'fixtureApkSha256':B.APK_SHA,'fixtureSourceSha256':B.SOURCE_SHA,'collectorSha256':digest(Path(__file__).read_bytes()),'inheritedBCollectorSha256':digest((ROOT/'tools/run-safe-notification-stack-device.py').read_bytes()),'runId':uuid.uuid4().hex}
    journal=Journal(folder/'restore.json',settings,metadata,resources,names);report={'installedVersion':code,'case':args.case,'cases':[],'status':'prepared','allowedMutableKeys':sorted(journal.allowed_keys()),'wholeFeaturePassed':False,'visualPass':False,'clearButtonActions':0}
    collector=Collector(ar,folder,journal,report)
    try:collector.persist();collector.exercise()
    except BaseException:report.update(status='inconclusive',error=traceback.format_exc());raise
    finally:
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending'],'visualPass':False},ensure_ascii=False))

if __name__=='__main__':main()
