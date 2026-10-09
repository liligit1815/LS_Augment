"""Offline C behavior checks plus unchanged B checks, using saved Android evidence."""
from pathlib import Path
import ast,copy,hashlib,importlib.util,json,sys,tempfile,time
from types import SimpleNamespace
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
import adb_regression as ar
def forbidden(*a,**k):raise AssertionError('Offline test attempted phone access')
ar.adb=ar.shell=ar.instrument=forbidden
bt=load('unchanged_b_checks',ROOT/'tools/test-safe-notification-stack-device.py')
B_CHECKS=bt.checks
m=load('c_checks',ROOT/'tools/run-safe-notification-combination-device.py')
checks=0
def check(value,label):
    global checks
    assert value,label;checks+=1
def raises(fn,kind=Exception):
    global checks
    try:fn()
    except kind:checks+=1;return
    raise AssertionError('Expected rejection')
AUDIT=ROOT/'out/full-function-audit-20261004'
N=AUDIT/'notification-stack-safe-20461-b-native-20261004-144531'
B=AUDIT/'notification-stack-safe-20461-b-stack-20261004-144839'
H=AUDIT/'header-layout-20456-notification-20261004-083530'
REAL=json.loads((B/'restore.json').read_text('utf8'))
freeze=json.loads((ROOT/'out/notification-stack-safe-collector/b-r1-snapshot/freeze.json').read_text('utf8'))
for p,h in freeze['files'].items():
    check(hashlib.sha256((ROOT/p).read_bytes()).hexdigest()==h,'B frozen source/test unchanged')
    check((ROOT/'out/notification-stack-safe-collector/b-r1-snapshot'/Path(p).name).read_bytes()==(ROOT/p).read_bytes(),'B exact snapshot preserved')
# Full old journals remain loadable by the unchanged B reader, not adopted as C.
for f in (N,B):
    check(not m.B.Journal(f/'restore.json').data['pending'],'Actual B terminal journal compatible')
    raises(lambda f=f:m.Journal(f/'restore.json'),ValueError)
for case in m.CASES:
    for theme in ('light','dark'):
        p=m.profile(case,theme);check(len(p)==12,'Exactly12 keys per C profile')
        check(p[m.SECONDS]=='1' and p[m.clear.Y]==('-8' if case.endswith('yminus8') else '0'),'C requested stimulus exact')
        other=m.clear.LIGHT if theme=='dark' else m.clear.DARK
        check(other not in p and p[m.clear.DARK if theme=='dark' else m.clear.LIGHT]=='#BFE0FF','Only actual theme color')
        check(all(m.valid_value(k,v) for k,v in p.items()),'All actual registered values accepted')
check({k for k,v in m.profile('c-original','light').items() if m.profile('c-yminus8','light')[k]!=v}=={m.clear.Y},'C cases differ only in Y')
for key,value in [(m.SECONDS,'2'),(m.clear.Y,'-25'),(m.clear.X,'121'),(m.B.INSET,'17'),(m.B.COUNT,'0'),('unknown','1')]:check(not m.valid_value(key,value),'Invalid values rejected')

def journal(folder,case='c-original',theme='light'):
    meta=dict(REAL['metadata'],case=case,theme=theme)
    return m.Journal(folder/'restore.json',copy.deepcopy(REAL['baseline']),meta,copy.deepcopy(REAL['resourcesBefore']),copy.deepcopy(REAL['namesBefore']))

class Fake(m.Collector):
    __init__=bt.Fake.__init__;instrument=bt.Fake.instrument;artifact_identity=bt.Fake.artifact_identity
    identity=bt.Fake.identity;protected=bt.Fake.protected;notifications=bt.Fake.notifications
    observe_all=bt.Fake.observe_all;persist=bt.Fake.persist;finish_fixture=bt.Fake.finish_fixture

with tempfile.TemporaryDirectory() as tmp:
    parent=Path(tmp)
    def folder(name):p=parent/name;p.mkdir();return p
    for theme in ('light','dark'):
        j=journal(folder(theme),theme=theme);p=m.profile('c-original',theme)
        check(j.allowed_keys()==set(p) and j.valid_values(p),'C journal whitelist exact')
        check(len(m.Journal(j.path).data['baseline'])==497,'497 durable C journal reload')
        other=m.clear.LIGHT if theme=='dark' else m.clear.DARK
        for values in ({other:'#000000'},{m.P+'clock_portrait_enabled':'1'},{'ls_augment_systemui_master':'0'}):raises(lambda values=values:j.plan(values,j.data['baseline']),ValueError)
    for flag in ('normal','ackloss','external-original','external-other','active','race'):
        j=journal(folder(flag));p=m.profile('c-yminus8','light');j.data['metadata']['case']='c-yminus8';j.plan(p,j.data['baseline']);j.acknowledge(p)
        f=Fake(j);f.ar=SimpleNamespace();f.current.update(p);f.flags={flag}
        if flag=='external-original':f.current[m.SECONDS]=j.data['baseline'][m.SECONDS]
        if flag=='external-other':f.current[m.clear.Y]='4'
        with patch.object(m.B.extra,'gates',lambda *a:None),patch.object(m.time,'sleep',lambda _:None):
            if flag=='normal':f.restore()
            else:raises(f.restore)
        if flag=='normal':check(f.current==j.data['baseline'] and not j.data['pending'] and f.events[-1]=='recovery-terminal','C12 restored then final497 after slow checks')
        elif flag=='ackloss':
            reload=m.Journal(j.path);check('0' in reload.data['inflight'][m.SECONDS],'Restore ACK loss preserves original in current inflight')
            g=Fake(reload);g.ar=SimpleNamespace();g.current=dict(f.current)
            with patch.object(m.B.extra,'gates',lambda *a:None),patch.object(m.time,'sleep',lambda _:None):g.restore()
            check(g.current==j.data['baseline'] and not reload.data['pending'],'Lost restore ACK can resume')
        elif flag.startswith('external'):
            key=m.SECONDS if flag.endswith('original') else m.clear.Y
            check(j.data['pending'] and all(key not in v for v in f.sets),'External original/other preserved, never claimed from history')
        else:check(j.data['pending'],'Cleanup/terminal race keeps pending')
    j=journal(folder('launch'));f=Fake(j);f.ar=SimpleNamespace(ADB=Path('no-adb'),SERIAL='offline',adb=lambda *a,**k:b'')
    f.media_audio=lambda *a,**k:[];f.notifications=lambda _:True;f.elapsed=lambda:10000;f.adopt_source=lambda:False
    def popen(cmd,**kwargs):
        d=json.loads(j.path.read_text('utf8'));check(d['fixture']['seconds']==120 and d['fixture']['maximumFinishElapsed']==165000,'Fixed120 launch journal precedes Popen')
        check(cmd[cmd.index('seconds')+1]=='120' and cmd[-1]==m.B.RUNNER and cmd.count('-1')==7,'Source120 and all7 schedules disabled')
        return SimpleNamespace(pid=123,poll=lambda:0)
    with patch.object(m.subprocess,'Popen',popen):raises(f.start_fixture,m.extra.Inconclusive)
    f.fixture_log.close();check(m.Journal(j.path).data['fixture']['startAttempted'],'Unconfirmed C launch retained')
    j.data['fixture']['seconds']=180;j.save();raises(lambda:m.Journal(j.path),ValueError)

    # Actual original20456 header geometry and scoped diagnostics, not invented coordinate fixtures.
    samples=[]
    for name in ('seconds-on-0','seconds-on-1'):
        d=json.loads((H/name/'result-private.json').read_text('utf8'))['uiWindows']
        ns=[n for w in d for n in m.B.legacy.walk(w['root']) if n.get('visible')]
        ids={m.extra.ID+x for x in ('cc_header','clock','date','status_icons_group','notification_stack_scroller','iv_dismiss_notification_view')}
        samples.append({'geometry':[n for n in ns if n.get('id') in ids]})
    case={'samples':samples,'diagnostics':json.loads((H/'seconds-on-1/case.json').read_text('utf8'))['diagnostic']}
    actual=m.combo_pair(case);check(actual['actualSecondsAdvance'] and actual['layouts'][0]['boxes']['notification_stack_scroller'][3]==2362,'Actual 20456 seconds pair + physical326 inset accepted as reported layout only')
    for mutation in ('stale','two-part','invalid-seconds','duplicate-clock','hidden-clock','overlap','native-header','not-owned','other-panel-only'):
        d=copy.deepcopy(case);geo=d['samples'][1]['geometry'];clock=next(n for n in geo if n['id']==m.extra.ID+'clock')
        if mutation=='stale':clock['text']=next(n['text'] for n in d['samples'][0]['geometry'] if n['id']==m.extra.ID+'clock')
        elif mutation=='two-part':clock['text']='08:35'
        elif mutation=='invalid-seconds':clock['text']='08:35:60'
        elif mutation=='duplicate-clock':geo.append(copy.deepcopy(clock))
        elif mutation=='hidden-clock':clock['visible']=False
        elif mutation=='overlap':next(n for n in geo if n['id']==m.extra.ID+'notification_stack_scroller')['bounds']='[0,0][1216,2688]'
        elif mutation=='native-header':d['diagnostics']['ls_augment_header_clock_runtime_1_portrait']='adapter=CCHeaderView;panel=1;native'
        elif mutation=='not-owned':d['diagnostics']['ls_augment_notification_viewport_runtime']='owned=false'
        else:d['diagnostics'].pop('ls_augment_header_clock_runtime_1_portrait')
        raises(lambda d=d:m.combo_pair(d),m.extra.Inconclusive)
    d=copy.deepcopy(case)
    for s,t in zip(d['samples'],('23:59:\n58','00:00:\n02')):next(n for n in s['geometry'] if n['id']==m.extra.ID+'clock')['text']=t
    check(m.combo_pair(d)['actualSecondsAdvance'],'Actual text supports semantic newline and midnight')

    # Exact real own-last-card selection versus actual tail clipping/user rows.
    def snap(name):
        windows=json.loads((B/name/'result-private.json').read_text('utf8'))['uiWindows'];native=(B/name/'activity-private.txt').read_text('utf8')
        return m.B.snapshot_geometry(windows,native,(1216,2688),'com.zte.mifavor.launcher',m.B.IDS)
    tail=snap('long-collapsed-sample-1');last=snap('browse-6-after-sample-1')
    check(m.B.legacy.unique_owned(tail,1) is None,'Real cropped-title tail not last-card completion')
    check(m.B.legacy.unique_owned(last,1) is not None,'Actual complete owned final card accepted')
    bad=copy.deepcopy(last);bad['ownedIds'].remove(0);check(m.B.legacy.unique_owned(bad,1) is None,'Same title with missing owned id rejected')
    bad=copy.deepcopy(last);bad['rows']=[r for r in bad['rows'] if r['number'] is None];check(m.B.legacy.unique_owned(bad,1) is None,'User bottom cards never substitute own final row')
    j=journal(folder('input'));f=Fake(j);calls=[];f.ar=SimpleNamespace(shell=lambda cmd:calls.append(cmd));f.source=lambda alive:(bt.SOURCE,bt.SOURCE['deadlineElapsedRealtimeMs']-15000)
    f.interaction_observation=(None,None,time.monotonic());last['observationMonotonic']=f.interaction_observation[2];f.latest_snapshot=last
    with patch.object(m.B.time,'sleep',lambda _:None):f.inject_owned('vertical',last,('swipe','up'))
    check(len(calls)==1 and calls[0].startswith('input swipe '),'C only existing safe owned scroll transport')
    for command in (('expand',),('collapse',),('clear',),('click',),('swipe','down')):raises(lambda command=command:f.inject_owned('blocked',last,command),ValueError)
    f.swipes=6;raises(lambda:f.inject_owned('seventh',last,('swipe','up')),m.extra.Inconclusive)
    check(len(calls)==1,'Forbidden and seventh inputs do not reach transport')

    # Execute C exercise routing with transports replaced, keep actual saved final-card selectors.
    class Exercise(Fake):
        def __init__(self,j,sequence,final_ok=True):
            super().__init__(j);self.sequence=list(sequence);self.final_ok=final_ok;self.opened=0
        def observe_input(self,label):return [],'',(1216,2688)
        def set(self,label,values):self.sets.append(values)
        def raw_expected(self):return {}
        def start_fixture(self):self.events.append('start120')
        def before_input(self,label):pass
        def open_panel(self,label):self.opened+=1
        def capture_combo(self,label):self.report['cases'].append({'label':label,'samples':[{'readableCandidates':[1] if self.final_ok else []}]*2})
        def fresh_snapshot(self,label):return self.sequence.pop(0) if self.sequence else tail
        def inject_owned(self,label,snapshot,command,target=None):
            assert command==('swipe','up');self.swipes+=1
    for label,seq,ok,success,expected_count in [('first',[last],True,True,0),('six',[tail]*6+[last],True,True,6),('limit',[tail]*8,True,False,6),('lost-final',[last],False,False,0)]:
        j=journal(folder('exercise-'+label));f=Exercise(j,seq,ok)
        with patch.object(m.clear,'surface',lambda *a:('home',{})),patch.object(m.clear,'opening_path',lambda *a:None),patch.object(m,'combo_layout',lambda _:None),patch.object(m.time,'sleep',lambda _:None):
            if success:f.exercise()
            else:raises(f.exercise,m.extra.Inconclusive)
        check(f.swipes==expected_count and f.opened==1,'C control flow bounded once, no repeated open/extra gestures')
        if success:check(f.report['ownLastCardCandidate']==1 and not f.report['visualPass'],'Only exact final-card gate ends collection, never pixel pass')
        else:check('ownLastCardCandidate' not in f.report,'Partial/changed last card cannot report completion')

print(json.dumps({'checks':checks,'unchangedBChecks':B_CHECKS,'additionalInheritedTransportChecks':bt.checks-B_CHECKS,'phoneAccess':False,'productionChanged':False,'cases':list(m.CASES),'fixedFixtureSeconds':120,'maximumSwipes':6},ensure_ascii=False))
