"""Offline checks for B collector; real saved ROM evidence, never device access."""
from pathlib import Path
import copy,importlib.util,json,sys,tempfile,time
from types import SimpleNamespace
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
import adb_regression as ar
def forbidden(*a,**k):raise AssertionError('Offline test attempted phone access')
ar.adb=ar.shell=ar.instrument=forbidden
spec=importlib.util.spec_from_file_location('b_test',ROOT/'tools/run-safe-notification-stack-device.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
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
A=AUDIT/'notification-clear-static-20461-20261004-140453'
OLD=AUDIT/'stack-native-20457-093220'
REAL=json.loads((A/'restore.json').read_text('utf-8'))
AUDIO=(ROOT/'out/notification-clear-stack-validation-plan-20460/current-audio-private.txt').read_text('utf-8')
SOURCE=json.loads((OLD/'expand-fixture-final.json').read_text('utf-8'))
def journal(folder,case='b-stack'):
    metadata=dict(REAL['metadata'],case=case,fixtureApkSha256=m.APK_SHA)
    return m.Journal(folder/'restore.json',copy.deepcopy(REAL['baseline']),metadata,copy.deepcopy(REAL['resourcesBefore']),copy.deepcopy(REAL['namesBefore']))
def fixture_record(j,final=SOURCE):
    value=copy.deepcopy(final);start=value['startedElapsedRealtimeMs']
    j.data['fixture']={'startAttempted':True,'cleanupConfirmed':False,'seconds':value['seconds'],'launchElapsed':start-200,'maximumFinishElapsed':value['deadlineElapsedRealtimeMs']+35000,
        'log':'fixture-console-private.txt','identity':{k:value[k] for k in ('runId','notificationTag','progressPath','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs')}};j.save();return value
def notice(records):
    return 'Notification service\n  Notification List:\n'+''.join('    NotificationRecord(x: pkg='+p+' user=UserHandle{'+str(u)+'} id='+str(i)+' tag='+t+' importance=3 key='+str(u)+'|'+p+'|'+str(i)+'|'+t+'|42: Notification())\n' for p,u,i,t in records)+'  Notification listeners:\n'

check(len(m.audio_players(AUDIO))==7,'Actual ROM players parsed, excluding historical event:started entries')
check(not any(x['state']=='started' for x in m.audio_players(AUDIO)),'Real current audio sample idle/paused')
for replacement in ('started','stopped','released'):
    changed=AUDIO.replace('state:idle attr:',f'state:{replacement} attr:',1)
    check(m.audio_players(changed)[0]['state']==replacement,'Actual section state not event log')
for changed in (AUDIO.replace('state:idle attr:','state:weird attr:',1),AUDIO[:AUDIO.index('  ducked players piids:')],AUDIO.replace('  players:','  mystery:'),AUDIO+'\nDUMP TIMEOUT'):
    raises(lambda changed=changed:m.audio_players(changed),m.extra.Inconclusive)
check(m.local_fixture().is_file(),'Existing APK/source hashes are exact; no build')
check(m.validate_source(SOURCE,SOURCE['seconds']) is SOURCE,'Actual native fixture final source contract')
for k,v in [('runId','foreign'),('progressPath','/data/user/0/other/file'),('seconds',181),('audioOutput',True),('audioFocusRequested',True),('regularNotificationCount',5),('moduleConfigurationWrites',1),('deadlineElapsedRealtimeMs',SOURCE['deadlineElapsedRealtimeMs']+1)]:
    bad=copy.deepcopy(SOURCE);bad[k]=v;raises(lambda bad=bad:m.validate_source(bad,SOURCE['seconds']),m.extra.Inconclusive)
bad=copy.deepcopy(SOURCE);bad['timeline']['updateAfter']=1;raises(lambda:m.validate_source(bad,SOURCE['seconds']),m.extra.Inconclusive)
for key in ('playCallbacks','pauseCallbacks','nextCallbacks','contentActivityCallbacks','notificationActionRequests'):
    bad=copy.deepcopy(SOURCE);bad[key]=-1;raises(lambda bad=bad:m.validate_source(bad,SOURCE['seconds']),m.extra.Inconclusive)
values=m.active_notifications((A/'original-notification-private.txt').read_text('utf-8'));check(len(values)==12,'All12 actual user records retained')
own=[(m.PACKAGE,0,i,'duo_c17_fixture_run') for i in m.IDS]
records=m.active_notifications(notice(own+[('user.app',10,9,'x')]))
ours,external=m.partition_notifications(records,'duo_c17_fixture_run');check({r['id'] for r in ours}==m.IDS and len(external)==1,'Own7 separated, foreign profile preserved')
foreign=m.active_notifications(notice([(m.PACKAGE,0,0,'old-run')]+own));ours,external=m.partition_notifications(foreign,'duo_c17_fixture_run');check(len(external)==1,'Same package/old tag stays external')
for records in (m.active_notifications(notice([(m.PACKAGE,0,7,'run')])),m.active_notifications(notice([(m.PACKAGE,10,1,'run')]))):raises(lambda records=records:m.partition_notifications(records,'run'),m.extra.Inconclusive)
raises(lambda:m.active_notifications(notice([]).replace('  Notification listeners:','')),m.extra.Inconclusive)

class Fake(m.Collector):
    def __init__(self,j):
        self.journal=j;self.folder=j.path.parent;self.report={'cases':[]};self.current=dict(j.data['baseline']);self.events=[];self.sets=[];self.flags=set();self.deadline=time.monotonic()+1000;self.fixture_proc=None;self.fixture_log=None;self.swipes=0
    def instrument(self,op,label,values=None):
        # Keep the production fixture gate even though transport is replaced.
        f=self.journal.data.get('fixture',{})
        if f.get('startAttempted') and not f.get('cleanupConfirmed'):raise m.extra.Inconclusive('Active fixture')
        self.events.append(label)
        if op=='set':
            disk=json.loads(self.journal.path.read_text('utf-8'));check(all(v in disk['inflight'].get(k,[]) for k,v in values.items()),'Restore commits only after durable inflight')
            self.sets.append(dict(values));self.current.update(values)
            if 'ackloss' in self.flags:raise OSError('Lost reply after commit')
        return {'settings':dict(self.current)}
    def artifact_identity(self):
        if 'identity' in self.flags:raise m.extra.Inconclusive('Hash changed')
    def identity(self,label):self.events.append(label+'-identity')
    def protected(self,label):
        self.events.append(label+'-protection')
        if 'race' in self.flags:self.current['ls_augment_systemui_master']='0'
    def notifications(self,label):self.events.append(label+'-notifications');return 'churn' not in self.flags
    def observe_all(self,label):raise m.extra.Inconclusive('Restored pixels unavailable')
    def persist(self):m.atomic(self.folder/'report.json',self.report)
    def finish_fixture(self):
        self.events.append('finish')
        if 'active' in self.flags:raise m.extra.Inconclusive('Still active')
        if self.journal.data.get('fixture',{}).get('startAttempted'):self.journal.data['fixture']['cleanupConfirmed']=True;self.journal.save()

with tempfile.TemporaryDirectory() as tmp:
    parent=Path(tmp)
    def folder(name):x=parent/name;x.mkdir();return x
    for case in m.CASES:
        j=journal(folder(case),case);check(j.allowed_keys()==set(m.profile(case)),'Case whitelist exact')
        check(j.valid_values(m.profile(case)),'Real values legal');check(len(m.Journal(j.path).data['baseline'])==497,'Full durable baseline reload')
        for vs in ({m.P+'clear_x':'1'},{'ls_augment_rm_qs_clock_seconds':'1'},{m.STEP:'21'},{m.COUNT:'0'},{m.INSET:'17'}):raises(lambda vs=vs:j.plan(vs,j.data['baseline']),ValueError)
    j=journal(folder('strict'));j.plan({m.STACK:'1'},j.data['baseline']);j.acknowledge({m.STACK:'1'})
    check(not j.owned_value(m.STACK,'0') and j.owned_value(m.STACK,'1'),'External return to original no longer owned')
    for flag in ('normal','active','ackloss','identity','churn','race','external-baseline','external-other'):
        j=journal(folder('restore-'+flag));j.plan({m.STACK:'1',m.COUNT:'1'},j.data['baseline']);j.acknowledge({m.STACK:'1',m.COUNT:'1'});fixture_record(j)
        f=Fake(j);f.current.update(j.data['expected']);f.flags={flag};f.ar=SimpleNamespace()
        if flag=='external-baseline':f.current[m.STACK]='0'
        if flag=='external-other':f.current[m.COUNT]='6'
        with patch.object(m.extra,'gates',lambda *a:None),patch.object(m.time,'sleep',lambda _:None):
            if flag in ('active','ackloss','identity','race','external-baseline','external-other'):raises(f.restore)
            else:f.restore()
        check(f.events[0]=='finish','Cleanup before configuration recovery')
        if flag=='active':check(not f.sets and not any('recovery' in x for x in f.events),'Running source never starts module instrumentation')
        elif flag in ('normal','churn'):
            check(f.current==j.data['baseline'] and not j.data['pending'],'Owned configuration fully restored')
            check(f.events[-1]=='recovery-terminal','Terminal497 follows all slow checks')
            check(not f.report['notificationsNeverMutated'] and f.report['userNotificationsNeverMutated'],'Fixture creation distinguished from user notifications')
        elif flag.startswith('external'):
            key=m.STACK if flag=='external-baseline' else m.COUNT
            check(j.data['pending'] and all(key not in v for v in f.sets),'External key preserved and pending remains')
        elif flag=='ackloss':
            reload=m.Journal(j.path);check(reload.data['inflight'][m.STACK]==['1','0'],'Restore ACK loss retained in journal')
            other=Fake(reload);other.current=dict(f.current);other.ar=SimpleNamespace()
            with patch.object(m.extra,'gates',lambda *a:None),patch.object(m.time,'sleep',lambda _:None):other.restore()
            check(not reload.data['pending'] and other.current==reload.data['baseline'],'ACK-loss recovery resumes safely')
        elif flag=='race':check(j.data['pending'] and not j.data['configurationRestored'],'Final slow-read external change caught by terminal497')

    # Actual saved fixture log is accepted only inside this launched source identity/time range.
    j=journal(folder('adopt'));value=fixture_record(j);j.data['fixture'].pop('identity');j.save()
    (j.path.parent/'fixture-console-private.txt').write_bytes((OLD/'expand-fixture.txt').read_bytes());f=Fake(j)
    check(f.adopt_source() and j.data['fixture']['identity']['runId']==SOURCE['runId'],'Actual source launch log adopted exactly')
    j.data['fixture']['launchElapsed']+=16000;raises(f.adopt_source,m.extra.Inconclusive)

    # Real module instrumentation guard, even if parent transport would succeed.
    j=journal(folder('instrument'));fixture_record(j);f=Fake(j)
    with patch.object(m.clear.Collector,'instrument',lambda *a,**k:'transport'):
        raises(lambda:m.Collector.instrument(f,'snapshot','bad'),m.extra.Inconclusive)
        j.data['fixture']['cleanupConfirmed']=True;check(m.Collector.instrument(f,'snapshot','ok')=='transport','Confirmed cleanup releases only module-instrumentation guard')

    # Real saved tree selectors; newer PNG-first gates tested separately with A fixtures.
    tree=json.loads((OLD/'expand-013-after-collapse/result-private.json').read_text('utf-8'))['uiWindows']
    owner=next(w for w in tree if w.get('active') and w.get('focused'))
    ns=list(m.legacy.walk(owner['root']));stack=next(n for n in ns if n.get('id')==m.extra.ID+'notification_stack_scroller')
    header=next(n for n in ns if n.get('id')==m.extra.ID+'cc_header');sb=m.legacy.rect(stack);hb=m.legacy.rect(header)
    area=(sb[0],hb[3]+8,sb[2],min(sb[3]-24,2362));snap={'rows':m.legacy.rows([owner],area),'area':area,'ownedIds':m.IDS}
    check(m.expansion_target(snap,'expand') is not None,'Actual20457 collapsed long notification safe native expand target')
    for mut in ('not-owned','duplicate','disabled','foreign-title','covered'):
        bad=copy.deepcopy(snap)
        row=next(r for r in bad['rows'] if r['number']==2)
        if mut=='not-owned':bad['ownedIds']=set()
        elif mut=='duplicate':bad['rows'].append(copy.deepcopy(row))
        elif mut=='disabled':
            for n in m.legacy.walk(row['node']):
                if n.get('id')=='android:id/expand_button':n['enabled']=False
        elif mut=='foreign-title':row['readableCandidate']=False
        else:bad['rows'].append({'visible':True,'number':None,'bounds':row['bounds']})
        check(m.expansion_target(bad,'expand') is None,'Unsafe native control blocked: '+mut)

    j=journal(folder('inject'));f=Fake(j);calls=[];f.ar=SimpleNamespace(shell=lambda cmd:calls.append(cmd));f.source=lambda alive:(SOURCE,SOURCE['deadlineElapsedRealtimeMs']-15000)
    f.interaction_observation=(None,None,time.monotonic());snap['observationMonotonic']=f.interaction_observation[2];f.latest_snapshot=snap;target=m.expansion_target(snap,'expand')
    with patch.object(m.time,'sleep',lambda _:None):f.inject_owned('expand',snap,('expand',),target)
    check(len(calls)==1 and calls[0].startswith('input tap '),'Only actual native owned expand node tapped')
    for command in (('clear',),('click',),('longpress',),('dismiss',)):
        f.interaction_observation=(None,None,time.monotonic());snap['observationMonotonic']=f.interaction_observation[2];raises(lambda command=command:f.inject_owned('no',snap,command),ValueError)
    f.interaction_observation=(None,None,time.monotonic()-2.6);raises(lambda:f.inject_owned('old',snap,('expand',),target),m.extra.Inconclusive)
    f.interaction_observation=(None,None,time.monotonic());snap['observationMonotonic']=f.interaction_observation[2];f.swipes=12;raises(lambda:f.inject_owned('limit',snap,('swipe','up')),m.extra.Inconclusive)
    raises(lambda:f.inject_owned('copied',copy.deepcopy(snap),('expand',),target),m.extra.Inconclusive)
    check(len(calls)==1,'Late/unknown/overbudget actions have no transport')
    fake_clock=[100.0];f.interaction_observation=(None,None,100.0);snap['observationMonotonic']=100.0
    real_atomic=m.atomic
    def slow_atomic(path,value):real_atomic(path,value);fake_clock[0]+=2.6
    with patch.object(m.time,'monotonic',lambda:fake_clock[0]),patch.object(m,'atomic',slow_atomic):raises(lambda:f.inject_owned('slow-durable',snap,('expand',),target),m.extra.Inconclusive)
    check(len(calls)==1,'Durable log write cannot move actual input past freshness limit')

    # Exercise the actual cleanup method (not Fake.finish_fixture), including asynchronous cancel.
    for name in ('normal','own-notice-remains','own-media-remains','runner-active','source-error','cleanup-error','ack-missing','no-source-timeout'):
        j=journal(folder('finish-real-'+name));value=fixture_record(j)
        f=Fake(j);f.fixture_proc=SimpleNamespace(poll=lambda:0);f.fixture_log=None
        elapsed=[value['deadlineElapsedRealtimeMs']+1000]
        f.elapsed=lambda:elapsed[0]
        f.source=lambda alive=False:(value,elapsed[0])
        queries=[]
        def notices(label):queries.append(label);f.last_owned={0} if name=='own-notice-remains' else set();return True
        f.notifications=notices
        f.media_audio=lambda label,allow_own=False:([{'package':m.PACKAGE}] if name=='own-media-remains' else [])
        f.ar=SimpleNamespace(shell=lambda *a,**k:'actual-full-native-dump')
        if name=='source-error':value['error']='source failed'
        if name=='cleanup-error':value['cleanupErrors']=['release failed']
        if name=='ack-missing':
            j.data['fixture'].pop('identity');f.adopt_source=lambda:(j.data['fixture'].update(identity={k:value[k] for k in ('runId','notificationTag','progressPath','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs')}) or True)
        if name=='no-source-timeout':
            j.data['fixture'].pop('identity');f.adopt_source=lambda:False;elapsed[0]=j.data['fixture']['maximumFinishElapsed']
        with patch.object(m.time,'sleep',lambda _:None),patch.object(m.extra,'idle_instrumentation',lambda raw:name!='runner-active'):
            if name in ('normal','ack-missing'):m.Collector.finish_fixture(f)
            else:raises(lambda:m.Collector.finish_fixture(f),m.extra.Inconclusive)
        if name in ('normal','ack-missing'):
            check(j.data['fixture']['cleanupConfirmed'] and len(queries)==2,'Two native empty reads required after exact source cleanup, despite immediate count2')
            check(json.loads((f.folder/'fixture-cleanup.json').read_text('utf-8'))['originalImmediateCount']==2,'Original asynchronous2 count retained, not overwritten')
        else:check(not j.data['fixture']['cleanupConfirmed'],'Cleanup uncertainty keeps recovery gate closed: '+name)

    # Production source deadline and cleanup event enforce fixed time; no guessed host allowance.
    j=journal(folder('source-live'));v=fixture_record(j);v['events']=[];v['cleanupComplete']=False;v['elapsedMs']=1000
    f=Fake(j);f.fixture_proc=SimpleNamespace(poll=lambda:None)
    f.ar=SimpleNamespace(shell=lambda *a,**k:json.dumps(v))
    f.elapsed=lambda:v['startedElapsedRealtimeMs']+1000
    check(m.Collector.source(f,True)[0]['runId']==v['runId'],'Actual source with ample lifetime permits observation')
    f.elapsed=lambda:v['deadlineElapsedRealtimeMs']-10000
    raises(lambda:m.Collector.source(f,True),m.extra.Inconclusive)
    f.elapsed=lambda:v['startedElapsedRealtimeMs']+1000;v['events']=[{'event':'fixture_cleanup'}]
    raises(lambda:m.Collector.source(f,True),m.extra.Inconclusive)
    v['events']=[];f.fixture_proc=SimpleNamespace(poll=lambda:0);raises(lambda:m.Collector.source(f,True),m.extra.Inconclusive)
    f.fixture_proc=SimpleNamespace(poll=lambda:None);v['contentActivityCallbacks']=1
    raises(lambda:m.Collector.source(f,True),m.extra.Inconclusive)
    check(m.Collector.source(f,False)[0]['contentActivityCallbacks']==1,'Unexpected callback stops input but exact source still readable for cleanup')

    # No Popen call can precede the durable launch-intent record, including no-ready ACK loss.
    j=journal(folder('launch-order'));f=Fake(j);f.ar=SimpleNamespace(ADB=Path('not-adb.exe'),SERIAL='offline',adb=lambda *a,**k:b'')
    f.media_audio=lambda *a,**k:[];f.notifications=lambda label:True;f.elapsed=lambda:10000;f.adopt_source=lambda:False
    def popen(cmd,**kwargs):
        disk=json.loads(j.path.read_text('utf-8'));check(disk['fixture']['startAttempted'] and disk['fixture']['seconds']==180,'Launch intent durable before child starts')
        check(cmd[-1]==m.RUNNER and cmd.count('-1')==7,'Only exact runner, fixed180 and all timelines disabled')
        return SimpleNamespace(pid=123,poll=lambda:0)
    with patch.object(m.subprocess,'Popen',popen):raises(f.start_fixture,m.extra.Inconclusive)
    check(j.data['fixture']['startAttempted'] and not j.data['fixture']['cleanupConfirmed'],'No-ready failure retains recovery ownership')
    f.fixture_log.close()

print(json.dumps({'checks':checks,'phoneAccess':False,'productionChanged':False,'cases':list(m.CASES),'actualFixtures':['current-audio-private.txt','A20461 original notifications/restore','20457 source log/final/tree']},ensure_ascii=False))
