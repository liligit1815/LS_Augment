"""Opt-in B-only native notification/stack audit; import is offline.

Uses the existing self-instrumenting C17 fixture. Never clears notifications,
changes native settings, installs APKs or starts module instrumentation while
the fixture may still be running. C is intentionally not implemented.
"""
from pathlib import Path
import argparse,contextlib,datetime,hashlib,importlib.util,json,re,shlex,subprocess,time,traceback,uuid

ROOT=Path(__file__).resolve().parents[1]
def load(name,file):
    s=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
clear=load('stack_clear_base','run-safe-notification-clear-device.py')
island=load('stack_media_parser','run-safe-island-device.py')
# This file is guarded by __main__; only its pure row/ownership functions are used.
legacy=load('stack_native_selectors','run-c17-stack-device.py')
base=clear.base;extra=clear.extra;atomic=clear.atomic;digest=clear.digest
P=clear.P;STACK=clear.STACK;EN=clear.EN
COUNT=P+'stack_complete_count';STEP=P+'stack_step';INSET=P+'stack_inset'
KEYS={STACK,EN,COUNT,STEP,INSET};CASES=('b-native','b-stack')
PACKAGE='ls.augment.regression.c17';RUNNER=PACKAGE+'/ls.augment.com.C17FixtureRunner'
FIXTURE=ROOT/'out/full-function-audit-20261004/c17-runtime-fixture'
APK_SHA='f3beeefd1a1f8f9b723e0b42e5233e97180b790eec334cdfce5373c06db3427b'
SOURCE_SHA='8b4084cb858257be6842667080cae510a49f09123572369d7e525085366a4758'
SOURCE=ROOT/'android/app/src/androidTest/java/ls/augment/com/C17RuntimeFixtureCases.java'
IDS=set(range(6))|{100};FRESH=2.5;MAX_SWIPES=12

def profile(case):
    if case not in CASES:raise ValueError('Only B profiles are implemented')
    return {STACK:'0',EN:'0'} if case=='b-native' else {STACK:'1',EN:'0',COUNT:'1',STEP:'8',INSET:'6'}

def valid_value(key,value):
    if key not in KEYS or not isinstance(value,str):return False
    if key in (STACK,EN):return value in ('0','1')
    limits={COUNT:(1,6),STEP:(4,20),INSET:(0,16)}
    return bool(re.fullmatch(r'0|[1-9][0-9]*',value) and limits[key][0]<=int(value)<=limits[key][1])

class Journal(clear.Journal):
    kind='safe-notification-stack-B';mutable_keys=KEYS
    def allowed_keys(self):return set(profile(self.data['metadata']['case']))
    def validate(self):
        d=self.data;m=d.get('metadata',{})
        if d.get('kind')!=self.kind or d.get('schema')!=1 or m.get('case') not in CASES:raise ValueError('Wrong B journal')
        if not isinstance(d.get('baseline'),dict) or len(d['baseline'])!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in d['baseline'].items()):raise ValueError('Complete497 baseline required')
        if not KEYS<=d['baseline'].keys() or not all(valid_value(k,d['baseline'][k]) for k in KEYS):raise ValueError('Invalid baseline values')
        if m.get('theme') not in ('light','dark') or not isinstance(m.get('nativeBaseline'),dict) or not isinstance(m.get('notificationsBefore'),list):raise ValueError('Missing environment')
        if not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict):raise ValueError('Missing protection')
        for field in ('restore','allowed','expected','inflight'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=self.allowed_keys():raise ValueError('Foreign recovery keys')
        if any(not set(d[f])<=set(d['restore']) for f in ('allowed','expected','inflight')):raise ValueError('Missing restore originals')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()):raise ValueError('Changed originals')
        if any(not valid_value(k,v) for k,v in d['expected'].items()):raise ValueError('Invalid expected')
        if any(not isinstance(v,list) or not v or not all(valid_value(k,x) for x in v) for f in ('allowed','inflight') for k,v in d[f].items()):raise ValueError('Invalid inflight/history')
        fixture=d.get('fixture',{})
        if fixture and (not isinstance(fixture,dict) or not isinstance(fixture.get('startAttempted'),bool)):raise ValueError('Invalid fixture journal')
    def valid_values(self,values):return bool(values) and set(values)<=self.allowed_keys() and all(valid_value(k,v) for k,v in values.items())

def audio_players(raw):
    if re.search(r'Permission Denial|DUMP TIMEOUT|DeadObjectException|Unknown command',raw,re.I):raise extra.Inconclusive('Audio dump failed')
    head=list(re.finditer(r'^PlaybackActivityMonitor dump time:',raw,re.M))
    if len(head)!=1:raise extra.Inconclusive('Actual playback monitor absent/ambiguous')
    body=raw[head[0].end():]
    starts=list(re.finditer(r'^  players:\s*$',body,re.M))
    if len(starts)!=1:raise extra.Inconclusive('Players section unknown')
    body=body[starts[0].end():];end=re.search(r'^  ducked players piids:',body,re.M)
    if not end:raise extra.Inconclusive('Players section incomplete')
    result=[]
    for line in body[:end.start()].splitlines():
        if not line.strip():continue
        m=re.fullmatch(r'\s*(?:\(not logged\)\s+)?AudioPlaybackConfiguration piid:(\d+)\s+.*?u/pid:(\d+)/(\d+) state:(\w+) attr:.*',line)
        if not m or m[4] not in ('idle','started','paused','stopped','released'):raise extra.Inconclusive('Unknown actual player state')
        result.append({'playerId':int(m[1]),'uid':int(m[2]),'pid':int(m[3]),'state':m[4]})
    return result

def active_notifications(raw):
    # A's parser validates every actual NotificationRecord and incomplete dump errors.
    values=clear.notification_records(raw)
    result=[]
    for value in values:
        # clear parser returns [package,user,id,tag,key] without truncating the list.
        if len(value)!=5 or not re.fullmatch(r'-?\d+',value[2]):raise extra.Inconclusive('Unknown notification identity')
        result.append({'package':value[0],'user':value[1],'id':int(value[2]),'tag':value[3],'key':value[4]})
    return result

def partition_notifications(records,tag=None):
    owned=[];external=[]
    for r in records:
        if tag and r['package']==PACKAGE and r['tag']==tag:
            if r['id'] not in IDS or r['user'] not in ('UserHandle{0}','0'):raise extra.Inconclusive('Unexpected own id/user')
            owned.append(r)
        else:external.append([r['package'],r['user'],str(r['id']),r['tag'],r['key']])
    if len({r['id'] for r in owned})!=len(owned):raise extra.Inconclusive('Duplicate own id')
    return owned,sorted(external)

def local_fixture():
    apk=FIXTURE/'c17-runtime-fixture.apk';meta=json.loads((FIXTURE/'build.json').read_text('utf-8'))
    if digest(apk.read_bytes())!=APK_SHA or digest(SOURCE.read_bytes())!=SOURCE_SHA or meta.get('sha256')!=APK_SHA or meta.get('sourceSha256')!=SOURCE_SHA:raise extra.Inconclusive('Audited fixture artifact changed')
    return apk

def fixture_apk_hash(ar):
    paths=ar.shell('pm path '+PACKAGE).splitlines()
    if len(paths)!=1 or not paths[0].startswith('package:'):raise extra.Inconclusive('Fixture must already be installed uniquely by root')
    path=paths[0][8:];raw=ar.shell('sha256sum '+shlex.quote(path),root=True)
    m=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',raw)
    if not m or m[2]!=path or m[1]!=APK_SHA:raise extra.Inconclusive('Installed fixture hash differs')
    return m[1]

def validate_source(value,seconds,identity=None):
    if not isinstance(seconds,int) or not 1<=seconds<=180:raise extra.Inconclusive('Unsupported source lifetime')
    run=value.get('runId','')
    if not re.fullmatch('[a-f0-9]+_[a-f0-9]{8}',run) or value.get('notificationTag')!='duo_c17_fixture_'+run:raise extra.Inconclusive('Foreign fixture run')
    expected='/data/user/0/'+PACKAGE+'/cache/c17-runtime-fixture/'+run+'.json'
    if value.get('progressPath')!=expected or value.get('seconds')!=seconds:raise extra.Inconclusive('Foreign fixture source path/lifetime')
    if any(value.get(k) is not False for k in ('audioOutput','audioFocusRequested')) or value.get('moduleConfigurationWrites')!=0 or value.get('regularNotificationCount')!=6:raise extra.Inconclusive('Fixture behavior differs')
    for k in ('startedElapsedRealtimeMs','deadlineElapsedRealtimeMs','elapsedMs'):
        if not isinstance(value.get(k),int) or value[k]<0:raise extra.Inconclusive('Missing source time')
    if value['deadlineElapsedRealtimeMs']-value['startedElapsedRealtimeMs']!=seconds*1000:raise extra.Inconclusive('Source lifetime extended')
    if not isinstance(value.get('events'),list) or not isinstance(value.get('cleanupErrors'),list):raise extra.Inconclusive('Incomplete source report')
    if any(not isinstance(value.get(k),int) or value[k]<0 for k in ('playCallbacks','pauseCallbacks','nextCallbacks','contentActivityCallbacks','notificationActionRequests')):raise extra.Inconclusive('Incomplete source callbacks')
    if identity and any(value.get(k)!=identity.get(k) for k in ('runId','notificationTag','progressPath','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs')):raise extra.Inconclusive('Source identity changed')
    if any(v!=-1 for v in value.get('timeline',{}).values()) or len(value.get('timeline',{}))!=7:raise extra.Inconclusive('Timed fixture updates must be disabled')
    return value

def snapshot_geometry(windows,native,size,home,owned_ids):
    kind,owner=clear.surface(windows,native,size,home)
    if kind!='notification':raise extra.Inconclusive('Actual notification shade required')
    ns=clear.nodes(owner);stack=[n for n in ns if n.get('id')==extra.ID+'notification_stack_scroller']
    headers=[n for n in ns if n.get('id')==extra.ID+'cc_header']
    if len(stack)!=1 or len(headers)!=1:raise extra.Inconclusive('Stack/header ambiguous')
    sb=extra.rectangle(stack[0]);hb=extra.rectangle(headers[0]);area=(sb[0],max(sb[1],hb[3])+8,sb[2],sb[3]-24)
    buttons=[n for n in ns if n.get('id')==extra.ID+'iv_dismiss_notification_view']
    # Conservative input viewport, including when native NSSL itself extends under the external button.
    if len(buttons)>1:raise extra.Inconclusive('Ambiguous clear button')
    if buttons:area=(area[0],area[1],area[2],min(area[3],extra.rectangle(buttons[0])[1]-26))
    if area[3]<=area[1] or not clear.inside(area,(0,0,*size)):raise extra.Inconclusive('No safe observed viewport')
    clear.unobstructed(windows,owner,area,home)
    rows=legacy.rows([owner],area)
    return {'rows':rows,'area':area,'ownedIds':set(owned_ids),'windows':[owner],
        'geometry':[ {k:n.get(k) for k in ('id','text','description','class','bounds','visible','clickable')} for n in ns if n.get('id') in {extra.ID+x for x in ('cc_header','clock','date','status_icons_group','notification_stack_scroller','iv_dismiss_notification_view','manage_text','footer')}]}

def expansion_target(snapshot,description):
    row=legacy.unique_owned(snapshot,2)
    if row is None:return None
    accepted=('展开','Expand') if description=='expand' else ('收起','折叠','Collapse')
    controls=[n for n in legacy.walk(row['node']) if n.get('visible') and n.get('enabled') and n.get('clickable') and n.get('id')=='android:id/expand_button'
        and n.get('description') in accepted and legacy.contains(row['bounds'],legacy.rect(n)) and legacy.contains(snapshot['area'],legacy.rect(n))]
    if len(controls)!=1:return None
    bounds=legacy.rect(controls[0])
    for other in snapshot['rows']:
        if other is not row and other['visible'] and clear.overlap(bounds,other['bounds']):return None
    return controls[0]

class Collector(clear.Collector):
    def __init__(self,*args):
        super().__init__(*args);self.fixture_proc=None;self.fixture_log=None;self.observation_sequence=0;self.swipes=0
        self.deadline=time.monotonic()+600
    def instrument(self,*args,**kwargs):
        f=self.journal.data.get('fixture',{})
        if f.get('startAttempted') and not f.get('cleanupConfirmed'):raise extra.Inconclusive('Fixture may be active; module instrumentation withheld')
        return super().instrument(*args,**kwargs)
    def artifact_identity(self):
        super().artifact_identity();fixture_apk_hash(self.ar)
    def elapsed(self):
        raw=self.ar.shell('cat /proc/uptime').split()
        if len(raw)!=2 or not re.fullmatch(r'\d+\.\d+',raw[0]):raise extra.Inconclusive('Actual phone elapsed time missing')
        return int(float(raw[0])*1000)
    def raw_expected(self):return json.loads(json.dumps(self.raw_config()))
    def assert_raw(self):
        if self.raw_expected()!=self.journal.data.get('rawConfigured'):raise extra.Inconclusive('Configuration changed while fixture active; stop inputs')
    def media_audio(self,label,allow_own=False):
        raw=self.ar.shell('dumpsys media_session');(self.folder/(label+'-media-private.txt')).write_text(raw,encoding='utf-8')
        records=island.media_records(raw)
        if any(r['package']!=PACKAGE and r['active'] and r['state'] in (3,4,5,6,8,9,10,11) for r in records):raise extra.Inconclusive('User media active; preserve it')
        if not allow_own and any(r['package']==PACKAGE for r in records):raise extra.Inconclusive('Other/remaining fixture media session')
        audio=self.ar.shell('dumpsys audio',timeout=40);(self.folder/(label+'-audio-private.txt')).write_text(audio,encoding='utf-8')
        players=audio_players(audio)
        if any(p['state']=='started' for p in players):raise extra.Inconclusive('Actual audio player active; no further fixture input')
        atomic(self.folder/(label+'-media-audio.json'),{'sessions':records,'players':players});return records
    def notifications(self,label):
        raw=self.ar.shell('dumpsys notification',timeout=40);(self.folder/(label+'-notification-private.txt')).write_text(raw,encoding='utf-8')
        f=self.journal.data.get('fixture',{});tag=f.get('identity',{}).get('notificationTag')
        records=active_notifications(raw);own,external=partition_notifications(records,tag)
        if f.get('cleanupConfirmed') and own:raise extra.Inconclusive('Fixture notifications returned after cleanup')
        if not tag and any(r['package']==PACKAGE for r in records):raise extra.Inconclusive('Existing fixture notification; no adoption')
        same=external==self.journal.data['metadata']['notificationsBefore']
        atomic(self.folder/(label+'-notification-identities-private.json'),{'owned':own,'external':external,'sameOriginalIdentities':same})
        self.last_owned={r['id'] for r in own};self.report.setdefault('notificationObservations',[]).append({'label':label,'ownedIds':sorted(self.last_owned),'externalCount':len(external),'sameOriginalIdentities':same});self.persist()
        return same
    def source(self,alive=False):
        f=self.journal.data['fixture'];identity=f.get('identity')
        if not identity:raise extra.Inconclusive('No confirmed source identity')
        raw=self.ar.shell('cat '+shlex.quote(identity['progressPath']),root=True)
        value=validate_source(json.loads(raw),f['seconds'],identity)
        now=self.elapsed()
        if now<value['startedElapsedRealtimeMs']:raise extra.Inconclusive('Phone elapsed generation differs')
        if alive and (value.get('error') or value.get('cleanupComplete') or now+10000>=value['deadlineElapsedRealtimeMs'] or any(e.get('event')=='fixture_cleanup' for e in value['events'])):raise extra.Inconclusive('Source finished/deadline approaching; no more input')
        if alive and any(value[k]!=0 for k in ('playCallbacks','pauseCallbacks','nextCallbacks','contentActivityCallbacks','notificationActionRequests')):raise extra.Inconclusive('Unexpected source interaction outside B scope; stop inputs and allow cleanup')
        if alive and self.fixture_proc is not None and self.fixture_proc.poll() is not None:raise extra.Inconclusive('Fixture runner exited')
        return value,now
    def start_fixture(self):
        d=self.journal.data;self.artifact_identity();self.media_audio('before-fixture')
        if not self.notifications('before-fixture'):raise extra.Inconclusive('User notifications changed')
        if self.ar.adb('shell','pidof '+PACKAGE,check=False).strip():raise extra.Inconclusive('Pre-existing fixture process; no reuse/kill')
        seconds=60 if d['metadata']['case']=='b-native' else 180
        now=self.elapsed();d['fixture']={'startAttempted':True,'cleanupConfirmed':False,'seconds':seconds,'launchElapsed':now,'maximumFinishElapsed':now+seconds*1000+35000,'runner':RUNNER,'log':'fixture-console-private.txt'};self.journal.save()
        self.fixture_log=(self.folder/'fixture-console-private.txt').open('wb')
        cmd=[str(self.ar.ADB),'-s',self.ar.SERIAL,'shell','am','instrument','-w','-r','-e','seconds',str(seconds)]
        for name in ('coverAfter','noCoverAfter','restoreCoverAfter','pauseAfter','resumeAfter','updateAfter','removeAfter'):cmd+=['-e',name,'-1']
        cmd+=['-e','operation','c17-runtime-fixture',RUNNER]
        self.fixture_proc=subprocess.Popen(cmd,stdout=self.fixture_log,stderr=subprocess.STDOUT)
        d['fixture']['hostPid']=self.fixture_proc.pid;self.journal.save()
        end=time.monotonic()+15
        while time.monotonic()<end:
            if self.adopt_source():return
            if self.fixture_proc.poll() is not None:break
            time.sleep(.2)
        raise extra.Inconclusive('No confirmed ready fixture; retain launch journal')
    def adopt_source(self):
        f=self.journal.data['fixture'];path=self.folder/f['log']
        if not path.is_file():return False
        identities=[]
        for line in path.read_text('utf-8',errors='replace').splitlines():
            if not line.startswith(('INSTRUMENTATION_STATUS: c17Fixture=','INSTRUMENTATION_RESULT: fixture=')):continue
            try:v=json.loads(line.split('=',1)[1])
            except json.JSONDecodeError:continue
            v=validate_source(v,f['seconds'],f.get('identity'))
            if not f['launchElapsed']<=v['startedElapsedRealtimeMs']<=f['launchElapsed']+15000:raise extra.Inconclusive('Source started outside this launch')
            identities.append({k:v[k] for k in ('runId','notificationTag','progressPath','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs')})
        if not identities:return False
        if any(x!=identities[0] for x in identities):raise extra.Inconclusive('Multiple source runs in this launch log')
        f['identity']=identities[0];self.journal.save();return True
    def finish_fixture(self):
        f=self.journal.data.get('fixture',{})
        if not f.get('startAttempted'):return
        # Fixed device deadline, never renewed; host reconnect cannot extend it.
        while True:
            now=self.elapsed()
            if not f.get('identity'):self.adopt_source()
            final=None
            if f.get('identity'):
                final,_=self.source();atomic(self.folder/'fixture-final-private.json',final)
            ended=self.fixture_proc is None or self.fixture_proc.poll() is not None
            if ended and final and any(e.get('event')=='fixture_cleanup' for e in final['events']):break
            if now>=f['maximumFinishElapsed']:raise extra.Inconclusive('Fixture completion unconfirmed; no module instrumentation')
            time.sleep(min(1,max(.01,(f['maximumFinishElapsed']-now)/1000)))
        if self.fixture_log:self.fixture_log.close()
        # Actual full native process dump, not just a dead host subprocess.
        raw=self.ar.shell('dumpsys activity',timeout=90);(self.folder/'fixture-ended-activity-private.txt').write_text(raw,encoding='utf-8')
        if not extra.idle_instrumentation(raw):raise extra.Inconclusive('An instrumentation is still active; recovery withheld')
        if final.get('error') or final.get('cleanupErrors'):raise extra.Inconclusive('Fixture cleanup reported errors')
        samples=[]
        for i in range(2):
            same=self.notifications('fixture-cleanup-'+str(i));sessions=self.media_audio('fixture-cleanup-'+str(i))
            samples.append({'ownActiveIds':sorted(self.last_owned),'sameOriginalIdentities':same,'ownMediaSessions':sum(r['package']==PACKAGE for r in sessions),'phoneElapsedMs':self.elapsed()});time.sleep(.4)
        atomic(self.folder/'fixture-cleanup.json',{'samples':samples,'nativeInstrumentationIdle':True,'originalImmediateCount':final.get('remainingOwnNotifications')})
        if any(s['ownActiveIds'] or s['ownMediaSessions'] for s in samples):raise extra.Inconclusive('Owned sources remain; no module instrumentation')
        f['cleanupConfirmed']=True;f['cleanupSamples']=samples;self.journal.save()
    def before_input(self,label):
        self.bounded();self.assert_raw();self.quick_runtime();self.media_audio(label,True)
        if not self.notifications(label):raise extra.Inconclusive('User notification identities changed; no further input')
        self.source(True)
        if self.last_owned!=IDS:raise extra.Inconclusive('Exact six regular and one media notifications no longer active')
    def quick_runtime(self):
        identity=self.journal.data['systemuiIdentity'];pid=self.ar.adb('shell','pidof com.android.systemui',check=False).decode().strip()
        if pid!=identity['pid'] or clear.proc_start(self.ar.shell('cat /proc/'+pid+'/stat',root=True),pid)!=identity['startTicks']:raise extra.Inconclusive('SystemUI process changed during fixture')
    def fresh_action(self,label,command):
        if self.journal.data.get('fixture',{}).get('startAttempted'):self.source(True)
        self.bounded();age=time.monotonic()-self.interaction_observation[2]
        if not 0<=age<=FRESH:raise extra.Inconclusive('Fresh opening window expired')
        if command!='cmd statusbar collapse' and not re.fullmatch(r'input swipe \d+ 5 \d+ \d+ 650',command):raise ValueError('Unknown opening input')
        path=self.folder/(label+'-action.json');record={'command':command,'windowAgeMs':round(age*1000),'clearButtonAction':False,'inputAttempted':False}
        atomic(path,record)
        age=time.monotonic()-self.interaction_observation[2]
        if not 0<=age<=FRESH:raise extra.Inconclusive('Input journal latency expired fresh opening window; no input')
        self.ar.shell(command);record.update(inputAttempted=True,actualPreInputAgeMs=round(age*1000));atomic(path,record)
    def fresh_snapshot(self,label):
        self.before_input(label);windows,native,size=self.observe_input(label)
        if not size[0]<size[1]:raise extra.Inconclusive('Actual portrait required')
        snap=snapshot_geometry(windows,native,size,self.journal.data['metadata']['homeComponent'].split('/')[0],self.last_owned)
        snap['label']=label;snap['observationMonotonic']=self.interaction_observation[2];self.latest_snapshot=snap;return snap
    def capture_stack(self,label):
        samples=[]
        for i in range(2):
            name=label+'-sample-'+str(i);snap=self.fresh_snapshot(name)
            fields={'label':name,'area':snap['area'],'geometry':snap['geometry'],'ownedIds':sorted(snap['ownedIds']),
                'rows':[{k:r[k] for k in ('number','numbers','bounds','visible','readableCandidate')} for r in snap['rows']],
                'readableCandidates':[n for n in range(1,7) if legacy.unique_owned(snap,n) is not None]}
            source,now=self.source(True);fields['source']=source;fields['phoneElapsedMs']=now
            atomic(self.folder/name/'stack-evidence.json',fields);samples.append(fields);time.sleep(.35)
        self.report['cases'].append({'label':label,'samples':samples,'diagnostics':self.diagnostic(label),'pixelReviewRequired':True,'visualPass':False});self.persist()
        self.readable.update(n for s in samples for n in s['readableCandidates']);return snap
    def inject_owned(self,label,snapshot,command,target=None):
        # Source/clock calls are intentionally inside the same2.5s bound, after fresh UI.
        source,now=self.source(True);age=time.monotonic()-self.interaction_observation[2]
        if not 0<=age<=FRESH:raise extra.Inconclusive('Fresh target expired; no input')
        if snapshot is not getattr(self,'latest_snapshot',None) or snapshot.get('observationMonotonic')!=self.interaction_observation[2]:raise extra.Inconclusive('Target snapshot differs from latest input observation')
        if snapshot['ownedIds']!=IDS:raise extra.Inconclusive('Fixture sources changed')
        if command[0]=='swipe':
            if self.swipes>=MAX_SWIPES:raise extra.Inconclusive('Fixed scroll bound reached')
            start,end=legacy.scroll_gesture(snapshot,command[1]);actual='input swipe %d %d %d %d 500'%(*start,*end);self.swipes+=1
        elif command[0] in ('expand','collapse'):
            node=expansion_target(snapshot,command[0])
            if node is None or node is not target:raise extra.Inconclusive('Exact unobstructed native expand/collapse control missing')
            b=legacy.rect(node);actual='input tap %d %d'%((b[0]+b[2])//2,(b[1]+b[3])//2)
        else:raise ValueError('No content/clear/longpress/swipe-dismiss commands')
        action={'label':label,'command':actual,'kind':command[0],'freshAgeMs':round(age*1000),'sourceRunId':source['runId'],'deadlineRemainingMs':source['deadlineElapsedRealtimeMs']-now,'clearButtonAction':False,'inputAttempted':False}
        path=self.folder/(label+'-action.json');atomic(path,action)
        age=time.monotonic()-self.interaction_observation[2]
        if not 0<=age<=FRESH:raise extra.Inconclusive('Input journal latency expired fresh target; no input')
        self.ar.shell(actual);action.update(inputAttempted=True,actualPreInputAgeMs=round(age*1000));atomic(path,action)
        self.report.setdefault('actions',[]).append(action);self.persist();time.sleep(.55)
    def vertical(self,label,direction):
        snap=self.fresh_snapshot(label+'-before');self.inject_owned(label,snap,('swipe',direction));return self.capture_stack(label+'-after')
    def expand_long(self):
        snap=self.fresh_snapshot('long-before-expand')
        if expansion_target(snap,'collapse') is not None:
            self.inject_owned('long-initial-collapse',snap,('collapse',),expansion_target(snap,'collapse'));self.capture_stack('long-collapsed-baseline');snap=self.fresh_snapshot('long-after-initial-collapse')
        target=expansion_target(snap,'expand')
        if target is None:raise extra.Inconclusive('Long owned notification not safely expandable')
        self.inject_owned('long-expand',snap,('expand',),target);snap=self.capture_stack('long-expanded')
        for i in range(3):
            if legacy.expanded_reading(snap,2):break
            direction=legacy.reading_scroll_direction(snap,2)
            if not direction:break
            snap=self.vertical('long-reading-'+str(i),direction)
        fresh=self.fresh_snapshot('long-before-collapse')
        if not legacy.expanded_reading(fresh,2):raise extra.Inconclusive('Expanded final paragraph not completely observable; no collapse tap')
        target=expansion_target(fresh,'collapse')
        self.inject_owned('long-collapse',fresh,('collapse',),target);collapsed=self.capture_stack('long-collapsed')
        if expansion_target(collapsed,'expand') is None:raise extra.Inconclusive('Collapse outcome not observed')
        self.report['longTextInteraction']={'expandedFinalParagraphCandidate':True,'nativeExpandControlReturned':True,'pixelReviewRequired':True};self.persist()
    def exercise(self):
        self.readable=set();self.identity('preflight')
        windows,native,size=self.observe_input('original-entry');home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        kind,owner=clear.surface(windows,native,size,home)
        if kind=='home':clear.opening_path(windows,native,size,home)
        else:clear.unobstructed(windows,owner,(0,0,*size),home)
        if not size[0]<size[1]:raise extra.Inconclusive('Portrait only')
        # No hidden changes to user header settings for isolation.
        for key in ('ls_augment_rm_qs_clock_seconds','ls_augment_rm_qs_clock_period',P+'weather',P+'clock_portrait_enabled',P+'clock_landscape_enabled'):
            if self.journal.data['baseline'].get(key)!='0':raise extra.Inconclusive('B isolation requires existing header options off; no extra writes')
        self.set('profile-before-fixture',profile(self.journal.data['metadata']['case']))
        self.journal.data['rawConfigured']=self.raw_expected();self.journal.save();self.start_fixture()
        self.before_input('fixture-before-open');self.open_panel('fixture-panel');snap=self.capture_stack('top')
        if self.journal.data['metadata']['case']=='b-stack':
            expanded=False
            for i in range(MAX_SWIPES+1):
                if not expanded and legacy.unique_owned(snap,2) is not None:self.expand_long();expanded=True
                if self.readable==set(range(1,7)) and expanded:break
                if self.swipes>=MAX_SWIPES:break
                snap=self.vertical('browse-'+str(i),'up')
            self.report['sixReadableCandidates']=sorted(self.readable)
            if self.readable!=set(range(1,7)) or not expanded:raise extra.Inconclusive('Bounded B coverage incomplete; keep observed evidence')
        self.report['status']='collected-pixel-review-required';self.persist()
    def restore(self):
        d=self.journal.data;d['pending']=True;self.journal.save()
        try:self.finish_fixture()
        except BaseException:
            self.report.update(status='recovery-pending',fixtureCleanupConfirmed=False,configurationRestored=False,restorePending=True,cleanupErrors=[traceback.format_exc()]);self.persist();raise
        try:
            # No module instrumentation until all cleanup gates above passed.
            extra.gates(self.ar,self.journal.path);super().restore()
        finally:
            self.report.update(fixtureCleanupConfirmed=not d.get('fixture',{}).get('startAttempted') or d.get('fixture',{}).get('cleanupConfirmed',False),
                notificationsNeverMutated=not d.get('fixture',{}).get('startAttempted',False),userNotificationsNeverMutated=True,
                fixtureStartAttempted=d.get('fixture',{}).get('startAttempted',False),fixtureNotificationPolicy='Only exact own tag/ids may be created/cancelled by audited fixture; unknown launch is not creation proof',
                fixturePackage=PACKAGE,fixtureIsDevelopmentOnly=True,clearButtonActions=0)
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
    local_fixture();fixture_apk_hash(ar)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if (m['serial'],m['installedVersion'],m['installedVersionName'],m['mainApkSha256'],m['testApkSha256'])!=(ar.SERIAL,code,name,clear.main_apk_hash(ar),base.test_apk_hash(ar)):raise extra.Inconclusive('Recovery device/APK differs')
        ar.OUTPUT=journal.path.parent;path=ar.OUTPUT/'report.json';report=json.loads(path.read_text('utf-8')) if path.exists() else {'cases':[],'status':'reconstructed-for-recovery'}
        Collector(ar,ar.OUTPUT,journal,report).restore();return
    extra.gates(ar);testhash=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=testhash:raise extra.Inconclusive('Reviewed TestAPK mismatch')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    if home.split('/')[0]!='com.zte.mifavor.launcher':raise extra.Inconclusive('Unknown HOME')
    folder=extra.safe.AUDIT/('notification-stack-safe-%d-%s-%s'%(code,args.case,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as stream,contextlib.redirect_stdout(stream):saved=ar.instrument('snapshot','baseline')
    if saved.get('status')!='pass' or saved.get('moduleVersion')!=code:raise extra.Inconclusive('Invalid baseline')
    settings=saved['settings']
    if len(settings)!=497 or settings.get('ls_augment_systemui_master')!='1':raise extra.Inconclusive('Complete497 and already-enabled SystemUI required')
    reader=Collector.__new__(Collector);reader.ar=ar;reader.awake();resources,names,native=reader.resources(),reader.names(),reader.native()
    raw=ar.shell('dumpsys notification',timeout=40);(folder/'original-notification-private.txt').write_text(raw,encoding='utf-8');records=active_notifications(raw)
    if any(r['package']==PACKAGE for r in records):raise extra.Inconclusive('Existing fixture notification')
    _,notifications=partition_notifications(records)
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'case':args.case,'homeComponent':home,'theme':native['effectiveTheme'],'nativeBaseline':native,'notificationsBefore':notifications,
        'mainApkSha256':clear.main_apk_hash(ar),'testApkSha256':testhash,'fixtureApkSha256':APK_SHA,'fixtureSourceSha256':SOURCE_SHA,'collectorSha256':digest(Path(__file__).read_bytes()),'runId':uuid.uuid4().hex}
    journal=Journal(folder/'restore.json',settings,metadata,resources,names);report={'installedVersion':code,'case':args.case,'cases':[],'status':'prepared','allowedMutableKeys':sorted(journal.allowed_keys()),'wholeFeaturePassed':False,'visualPass':False,'clearButtonActions':0}
    collector=Collector(ar,folder,journal,report)
    try:collector.persist();collector.exercise()
    except BaseException:report.update(status='inconclusive',error=traceback.format_exc());raise
    finally:
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending'],'visualPass':False},ensure_ascii=False))

if __name__=='__main__':main()
