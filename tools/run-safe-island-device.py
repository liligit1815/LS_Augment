"""Opt-in island evidence collector. Imports are offline; no production or user-media changes.

Each invocation is one <=175s owned fixture batch. PNGs and native events are
evidence for independent review, never an automatic module/pixel pass.
"""
from pathlib import Path
import argparse, contextlib, datetime, hashlib, importlib.util, json, re, shlex, struct, subprocess, time, traceback, uuid

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('island_main_base',ROOT/'tools/main_statusbar_device_collector.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
extra=base.extra;atomic=base.atomic;digest=base.digest
P='ls_augment_rm_island_';KEYS={P+s for s in ('enabled','music','notifications','charging','width','height','offset_x','notice_seconds')}
PACKAGE='ls.augment.regression.island';RUNNER=PACKAGE+'/'+PACKAGE+'.IslandFixtureRunner'
BACKGROUND=PACKAGE+'.IslandFixtureRunner$BackgroundActivity';CONTENT=PACKAGE+'.IslandFixtureRunner$ContentActivity'
TITLE='Duo 灵动岛临时验证';CASES=('lifecycle','notification-expiry','notification-click')

def valid_values(values):
    if not values or not set(values)<=KEYS:return False
    ranges={'width':(96,240),'height':(20,48),'offset_x':(-120,120),'notice_seconds':(3,15)}
    for k,v in values.items():
        if not isinstance(v,str):return False
        suffix=k[len(P):]
        if suffix in ranges:
            if not re.fullmatch(r'-?(?:0|[1-9][0-9]*)',v) or not ranges[suffix][0]<=int(v)<=ranges[suffix][1]:return False
        elif v not in ('0','1'):return False
    return True

class Journal(extra.Journal):
    kind='safe-island-lifecycle';mutable_keys=KEYS
    def __init__(self,path,baseline=None,metadata=None,resources=None,names=None):
        self.path=Path(path)
        self.data=json.loads(self.path.read_text('utf-8')) if baseline is None else {
            'kind':self.kind,'schema':1,'pending':True,'baseline':baseline,'metadata':metadata,
            'resourcesBefore':resources,'namesBefore':names,'restore':{},'expected':{},'inflight':{},'allowed':{},'history':[],
            'fixture':{'startAttempted':False,'sequence':0},'configurationRestored':False}
        self.validate()
        if baseline is not None:self.save()
    def validate(self):
        d=self.data;m=d.get('metadata',{})
        if d.get('kind')!=self.kind or d.get('schema')!=1:raise ValueError('Foreign journal')
        if not isinstance(d.get('baseline'),dict) or len(d['baseline'])!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in d['baseline'].items()):raise ValueError('Complete497 baseline required')
        if not KEYS<=d['baseline'].keys() or m.get('case') not in CASES:raise ValueError('Unknown scope')
        if not re.fullmatch('[a-f0-9]{32}',m.get('runId','')) or not re.fullmatch('[a-f0-9]{32}',m.get('secret','')):raise ValueError('Invalid fixture identity')
        if not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict) or not isinstance(m.get('nativeBaseline'),dict):raise ValueError('Incomplete protection snapshot')
        for f in ('restore','expected','inflight','allowed'):
            if not isinstance(d.get(f),dict) or not set(d[f])<=KEYS:raise ValueError('Foreign recovery keys')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()):raise ValueError('Journal baseline altered')
        if any(not isinstance(v,str) for v in d['expected'].values()):raise ValueError('Malformed expected values')
        if any(not isinstance(v,list) or not all(isinstance(x,str) for x in v) for f in ('inflight','allowed') for v in d[f].values()):raise ValueError('Malformed ownership values')
        if not isinstance(d.get('fixture'),dict) or not isinstance(d['fixture'].get('sequence'),int):raise ValueError('Missing fixture recovery')
    def valid_values(self,values):return valid_values(values)

def media_records(raw):
    if 'MEDIA SESSION SERVICE (dumpsys media_session)' not in raw or 'User Records:' not in raw or 'Audio playback (lastly played comes first)' not in raw:
        raise extra.Inconclusive('Unrecognized/incomplete native media report')
    matches=list(re.finditer(r'^\s+package=([\w.]+)\s*$',raw,re.M));result=[]
    for i,m in enumerate(matches):
        block=raw[m.end():matches[i+1].start() if i+1<len(matches) else len(raw)]
        # Stop at the next session heading/owner block; only the first values belong here.
        active=re.search(r'^\s+active=(true|false)\s*$',block,re.M)
        state=re.search(r'^\s+state=(.*)$',block,re.M)
        if not active or not state:raise extra.Inconclusive('Native media state missing')
        value=state[1].strip()
        if value=='null':code=None
        else:
            parsed=re.match(r'PlaybackState\s*\{state=(?:[A-Z_]+\()?([0-9]+)\)?[, ]',value)
            if not parsed or not 0<=int(parsed[1])<=11:raise extra.Inconclusive('Unknown playback state')
            code=int(parsed[1])
        result.append({'package':m[1],'active':active[1]=='true','state':code})
    counts=[int(x) for x in re.findall(r'Sessions Stack - have ([0-9]+) sessions:',raw)]
    if not counts or len(result)<sum(counts):raise extra.Inconclusive('Media session list incomplete')
    return result

def no_user_playing(records):
    return not any(r['package']!=PACKAGE and r['active'] and r['state'] in (3,4,5,6,8,9,10,11) for r in records)

def notification_records(raw,run_id=None):
    if re.search(r'Permission Denial|DUMP TIMEOUT|DeadObjectException|Unknown command',raw,re.I):raise extra.Inconclusive('Notification dump failed')
    markers=list(re.finditer(r'^  Notification List:\s*$',raw,re.M))
    if len(markers)!=1:raise extra.Inconclusive('Unrecognized native notification list')
    section=raw[markers[0].end():];end=re.search(r'^  \S',section,re.M)
    if end:section=section[:end.start()]
    result=[]
    for line in section.splitlines():
        if 'NotificationRecord(' not in line:continue
        m=re.search(r'NotificationRecord\([^\n]*?pkg=(\S+) user=(\S+) id=(-?\d+) tag=(\S+) .*?key=(\S+)',line)
        if not m:raise extra.Inconclusive('Unknown notification identity')
        if m[1]!=PACKAGE:result.append(list(m.groups()))
        elif run_id is None or m[4]!='island-'+run_id or m[3] not in ('1','2'):
            raise extra.Inconclusive('Another fixture notification exists; do not reuse its identity')
    return sorted(result)

def apk_hash(ar,package):
    if package not in (PACKAGE,'ls.augment.com.test'):raise ValueError('Unexpected package')
    lines=ar.shell('pm path '+package).splitlines()
    if len(lines)!=1 or not lines[0].startswith('package:'):raise extra.Inconclusive('Installed APK not unique')
    path=lines[0][8:];raw=ar.shell('sha256sum '+shlex.quote(path),root=True)
    m=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',raw)
    if not m or m[2]!=path:raise extra.Inconclusive('Installed APK hash unavailable')
    return m[1]

def fixture_valid(value,run_id,previous=None):
    if value.get('schema')!=1 or value.get('fixtureRevision')!='island-lifecycle-r2-controls' or value.get('package')!=PACKAGE or value.get('runId')!=run_id:
        raise extra.Inconclusive('Foreign/stale fixture evidence')
    for key in ('pid','startedElapsed','deadlineElapsed','observedElapsed','sequence'):
        if not isinstance(value.get(key),int) or value[key]<0:raise extra.Inconclusive('Incomplete fixture times')
    if not 0<value['deadlineElapsed']-value['startedElapsed']<=180000:raise extra.Inconclusive('Fixture exceeds bounded lifetime')
    if previous and any(value[k]!=previous[k] for k in ('pid','startedElapsed','deadlineElapsed')):raise extra.Inconclusive('Fixture process changed')
    if value.get('audioOutput') is not False or value.get('audioFocusRequested') is not False:raise extra.Inconclusive('Fixture audio contract changed')
    if not isinstance(value.get('ownNotificationIds'),list) or not set(value['ownNotificationIds'])<={1,2}:raise extra.Inconclusive('Foreign notification ids')
    if not isinstance(value.get('closed'),bool) or not isinstance(value.get('sessionReleased'),bool) or not isinstance(value.get('contentCallbacks'),int) or value['contentCallbacks']<0:raise extra.Inconclusive('Incomplete fixture lifecycle')
    if value.get('phase') not in ('starting','initial-paused','playing','paused','stopped','released','notice-expiry','notice-click','closed'):raise extra.Inconclusive('Unknown fixture phase')
    if value['observedElapsed']<value['startedElapsed']:raise extra.Inconclusive('Fixture evidence predates its run')
    return value

def choose_capsule(windows,native,run_id,size):
    if not extra.focus_state(windows,native,PACKAGE)['targetFocusedAndPanelGone']:raise extra.Inconclusive('Fixture is not uniquely foreground; no click')
    if not foreground_component(native,BACKGROUND):raise extra.Inconclusive('Owned background Activity must precede click')
    all_nodes=[n for w in windows for n,_ in extra.walk(w.get('root',{})) if n.get('visible')]
    if not any(n.get('package')==PACKAGE and run_id in str(n.get('text','')) and 'Duo 灵动岛事件验证' in str(n.get('text','')) for n in all_nodes):
        raise extra.Inconclusive('Owned background runId is not visible')
    description='灵动岛：'+TITLE+'。轻点打开，长按展开'
    pills=[n for n in all_nodes if n.get('package')=='com.android.systemui' and n.get('description')==description and n.get('enabled') and n.get('clickable')]
    if len(pills)!=1:raise extra.Inconclusive('Unique fixture notification capsule not observable')
    l,t,r,b=extra.rectangle(pills[0])
    if not 0<=l<r<=size[0] or not 0<=t<b<min(size[1]/4,300):raise extra.Inconclusive('Capsule is outside the observed status-bar region')
    owners=[w for w in windows if any(n is pills[0] for n,_ in extra.walk(w.get('root',{})))]
    if len(owners)!=1 or not any(n.get('id')==extra.ID+'status_bar' for n,_ in extra.walk(owners[0].get('root',{}))):raise extra.Inconclusive('Capsule is not in the actual native status bar')
    for w in windows:
        if w is owners[0] or w.get('root',{}).get('package')==PACKAGE:continue
        if not w.get('root',{}).get('visible'):continue
        wl,wt,wr,wb=extra.rectangle(w.get('root',{}))
        if wl<r and wr>l and wt<b and wb>t:raise extra.Inconclusive('Another visible window covers the proposed capsule tap')
    return pills[0],((l+r)//2,(t+b)//2)

def foreground_component(raw,expected):
    found=set()
    for p,c in re.findall(r'(?:topResumedActivity|mResumedActivity)=[^\n]*?\s([A-Za-z][\w.]+)/([\w.$]+)',raw):
        found.add(p+c if c.startswith('.') else c)
    return found=={expected}

def fresh_fixture_size(windows,expected):
    """Use actual current window geometry, never scale coordinates from an old PNG."""
    width,height=expected
    if not 0<width<height:raise extra.Inconclusive('Previous original PNG is not portrait')
    focused=[w for w in windows if w.get('type')==1 and w.get('active') and w.get('focused')]
    if len(focused)!=1 or focused[0].get('root',{}).get('package')!=PACKAGE:raise extra.Inconclusive('Fresh fixture window is not unique')
    full=(0,0,width,height)
    if tuple(extra.rectangle(focused[0]))!=full or tuple(extra.rectangle(focused[0]['root']))!=full:
        raise extra.Inconclusive('Fresh window/display boundary differs from the original PNG; no scaled tap')
    return width,height

class Collector(base.Collector):
    def native(self):
        return dict(super().native(),**{'system/screen_off_timeout':self.ar.shell('settings get system screen_off_timeout'),
            'global/zen_mode':self.ar.shell('settings get global zen_mode'),'global/mode_ringer':self.ar.shell('settings get global mode_ringer')})
    def protected(self,label):
        d=self.journal.data
        diff={'resources':base.difference(d['resourcesBefore'],self.resources()),'names':base.difference(d['namesBefore'],self.names()),
              'native':base.difference(d['metadata']['nativeBaseline'],self.native())}
        atomic(self.folder/(label+'-protection.json'),diff)
        if any(diff.values()):raise extra.Inconclusive('Protected user resources/names/native settings changed')
    def before(self,label,values):self.protected(label);super().before(label,values)
    def media(self,label,allow_own=True):
        raw=self.ar.shell('dumpsys media_session');(self.folder/(label+'-media-private.txt')).write_text(raw,encoding='utf-8')
        values=media_records(raw)
        if not no_user_playing(values):raise extra.Inconclusive('User media is active; never pause/change it')
        if not allow_own and any(v['package']==PACKAGE for v in values):raise extra.Inconclusive('Existing fixture media; do not reuse')
        return values
    def notices(self,label,allow_own=True):
        values=notification_records(self.ar.shell('dumpsys notification',timeout=40),self.journal.data['metadata']['runId'] if allow_own else None);atomic(self.folder/(label+'-other-notification-identities-private.json'),values)
        if values!=self.journal.data['metadata']['notificationsBefore']:raise extra.Inconclusive('User notifications changed during owned batch; no click or cleanup of them')
    def elapsed(self):
        raw=self.ar.shell('cat /proc/uptime').split()
        if len(raw)!=2 or not re.fullmatch(r'[0-9]+\.[0-9]+',raw[0]):raise extra.Inconclusive('Phone elapsed clock unavailable')
        return int(float(raw[0])*1000)
    def progress(self):
        m=self.journal.data['metadata'];path='/data/user/0/'+PACKAGE+'/cache/island-'+m['runId']+'.json'
        raw=self.ar.shell('if test -f '+path+'; then cat '+path+'; else echo ABSENT; fi',root=True)
        if raw=='ABSENT':return None
        value=fixture_valid(json.loads(raw),m['runId'],self.journal.data['fixture'].get('identity'))
        self.journal.data['fixture'].setdefault('identity',{k:value[k] for k in ('pid','startedElapsed','deadlineElapsed')});self.journal.save()
        atomic(self.folder/('fixture-seq-%03d.json'%value['sequence']),value);return value
    def start_fixture(self):
        m=self.journal.data['metadata'];d=self.journal.data['fixture']
        if apk_hash(self.ar,PACKAGE)!=m['fixtureApkSha256']:raise extra.Inconclusive('Fixture APK changed')
        if self.ar.adb('shell','pidof '+PACKAGE,check=False).strip():raise extra.Inconclusive('Fixture process already exists; do not reuse/kill it')
        d['startAttempted']=True;self.journal.save()
        self.fixture_log=(self.folder/'fixture-console-private.txt').open('wb')
        self.fixture_process=subprocess.Popen([str(self.ar.ADB),'-s',self.ar.SERIAL,'shell','am','instrument','-w','-r',
            '-e','runId',m['runId'],'-e','secret',m['secret'],RUNNER],stdout=self.fixture_log,stderr=subprocess.STDOUT)
        until=time.monotonic()+15
        while time.monotonic()<until:
            v=self.progress()
            if v and v.get('error'):raise extra.Inconclusive('Fixture setup error: '+str(v['error']))
            if v and v['phase']=='initial-paused' and not v['closed'] and v['sequence']==0 and v.get('musicActive') is False:return v
            if v and v['closed']:raise extra.Inconclusive('Fixture closed during setup')
            time.sleep(.2)
        raise extra.Inconclusive('Fixture did not become ready')
    def command(self,name,finish=False):
        d=self.journal.data['fixture'];m=self.journal.data['metadata'];v=self.progress()
        if v is None:raise extra.Inconclusive('No owned fixture state')
        if v['closed']:
            if finish:return v
            raise extra.Inconclusive('Fixture already closed')
        if v.get('error') and not finish:raise extra.Inconclusive('Fixture error: '+str(v['error']))
        if not finish and v['deadlineElapsed']-self.elapsed()<20000:raise extra.Inconclusive('Insufficient fixture lifetime for another bounded phase')
        # An unacknowledged command is not replayed; only nonce-scoped finish may supersede it.
        if not finish and v['sequence']!=d['sequence']:raise extra.Inconclusive('Fixture command acknowledgement mismatch')
        seq=v['sequence']+1;d['commandAttempt']={'sequence':seq,'command':name};self.journal.save()
        cmd='am broadcast -a '+PACKAGE+'.COMMAND -p '+PACKAGE+' --es runId '+m['runId']+' --es secret '+m['secret']+' --ei sequence '+str(seq)+' --es command '+name
        self.ar.shell(cmd,timeout=8)
        until=time.monotonic()+5
        while time.monotonic()<until:
            observed=self.progress()
            # The fixed deadline/audio guard may close before consuming finish's sequence.
            # Record actual terminal evidence without inventing a command acknowledgement.
            if finish and observed and observed['closed']:
                d['sequence']=observed['sequence'];d['finishCommandAcknowledged']=observed['sequence']==seq
                d['finishOutcome']='owned-terminal-observed';d.pop('commandAttempt',None);self.journal.save();return observed
            if observed and observed['sequence']==seq:
                d['sequence']=seq;d.pop('commandAttempt',None);self.journal.save()
                if observed.get('error') and not finish:raise extra.Inconclusive('Fixture error: '+str(observed['error']))
                if observed.get('musicActive') and not finish:raise extra.Inconclusive('External audio active')
                if observed['closed'] and not finish:raise extra.Inconclusive('Fixture closed before requested event')
                return observed
            if observed and observed['closed']:raise extra.Inconclusive('Fixture reached terminal state before command ACK')
            time.sleep(.1)
        raise extra.Inconclusive('Command was not acknowledged by the actual owned fixture')
    def frames(self,label,value,deadline=None):
        folder=self.folder/label;folder.mkdir();rows=[]
        for i in range(2):
            before=self.elapsed();raw=self.ar.adb('exec-out','screencap','-p');after=self.elapsed()
            (folder/('frame-%02d.png'%i)).write_bytes(raw)
            if raw[:8]!=b'\x89PNG\r\n\x1a\n':raise extra.Inconclusive('PNG missing')
            size=struct.unpack('>II',raw[16:24])
            if size!=tuple(self.journal.data['metadata']['displaySize']) or size[0]>=size[1]:raise extra.Inconclusive('Actual PNG direction/profile changed')
            row={'frame':i,'startElapsed':before,'endElapsed':after,'sha256':digest(raw),'size':size,'beforeDeadline':deadline is None or after<deadline}
            rows.append(row);atomic(folder/'frames.json',rows)
            if deadline is not None and after>=deadline:raise extra.Inconclusive('Missed short event screenshot window; no positive inference')
            if i==0:time.sleep(.35)
        row={'phase':label,'fixtureEvent':value,'frames':rows,'pixelPass':False,'independentPixelReviewRequired':True}
        self.report['cases'].append(row);self.persist();return row
    def wait_after(self,event,millis):
        target=event['observedElapsed']+millis
        while self.elapsed()<target:time.sleep(.2)
    def exercise(self):
        self.identity('before-fixture');self.media('before-fixture',False);self.notices('before-fixture')
        case=self.journal.data['metadata']['case'];notice_seconds=15 if case=='notification-click' else 6
        # Complete the slow configuration preparation before the fixed fixture lifetime starts.
        self.set('prepare-disabled',{P+'enabled':'0',P+'music':'1' if case=='lifecycle' else '0',P+'notifications':'1',P+'charging':'1' if case=='lifecycle' else '0',P+'notice_seconds':str(notice_seconds)})
        initial=self.start_fixture()
        windows,native,size=self.observe_all('owned-background-before')
        if size[0]>=size[1] or not extra.focus_state(windows,native,PACKAGE)['targetFocusedAndPanelGone']:raise extra.Inconclusive('Actual portrait owned background missing')
        self.journal.data['metadata']['displaySize']=size;self.journal.save()
        self.frames('disabled-initial-paused',initial)
        self.set('island-enabled',{P+'enabled':'1'})
        current=self.command('observe');self.frames('enabled-initial-paused',current)
        # Short phases intentionally use only owned command ACK and original PNGs.
        # Complete tree/config/resources/native checks bracket this bounded sequence.
        if case=='lifecycle':
            for command,label in [('play','playing'),('pause','paused-after-grace'),('play','playing-again'),('stop','stopped'),('release','released')]:
                self.media(label+'-before');event=self.command(command)
                self.wait_after(event,4700 if command=='pause' else 450);self.frames(label,event)
        else:
            event=self.command('release');self.frames('released-before-notice',event);self.media('notice-before');self.notices('notice-before')
            event=self.command('notice-click' if case=='notification-click' else 'notice-expiry')
            event_end=event['observedElapsed']+notice_seconds*1000
            self.frames('notification-appeared',event,event_end)
            if case=='notification-expiry':
                self.wait_after(event,notice_seconds*1000+1200);value=self.command('observe')
                if 1 not in value['ownNotificationIds']:raise extra.Inconclusive('Original own notification disappeared; cannot prove island-only expiry')
                self.frames('notification-expired-original-retained',value)
            else:self.click_source(event,event_end)
        self.media('after-events');self.notices('after-events')
        self.assert_config(self.instrument('snapshot','after-events')['settings']);self.protected('after-events');self.identity('after-events')
        self.report['status']='collected-independent-pixel-review-required';self.persist()
    def click_source(self,event,event_end):
        attempt={'revision':'fresh-source-r2','stages':[],'tapAttempted':False,'tapCompleted':False,'outcome':'checking','eventDeadlineElapsed':event_end,'freshAgeMs':None,'deadlineMarginMs':None}
        self.report['sourceClickAttempt']=attempt
        started=None
        def timed(name,fn):
            start=time.monotonic()
            try:return fn()
            finally:
                end=time.monotonic();attempt['stages'].append({'stage':name,'startMonotonicMs':start*1000,'endMonotonicMs':end*1000,'durationMs':(end-start)*1000})
        def eligible(value):
            fixture_valid(value or {},self.journal.data['metadata']['runId'],self.journal.data['fixture'].get('identity'))
            return not value['closed'] and not value.get('error') and value.get('musicActive') is False and value['phase']=='notice-click' and value['sessionReleased'] and value['ownNotificationIds']==[2] and value['contentCallbacks']==0
        try:
            # One genuine source observe precedes fresh UI acquisition; never repost/renew.
            source=timed('source-observe-before-fresh-ui',lambda:self.command('observe'))
            if not eligible(source):raise extra.Inconclusive('Owned source is not eligible for a fresh click')
            attempt.update(sourcePrecheckObservedElapsed=source['observedElapsed'],sourcePrecheckSequence=source['sequence'])
            appeared=[c for c in self.report['cases'] if c.get('phase')=='notification-appeared']
            if len(appeared)!=1 or len(appeared[0].get('frames',[]))!=2:raise extra.Inconclusive('Two original notification PNGs are required before clicking')
            size=tuple(self.journal.data['metadata']['displaySize'])
            if any(tuple(f.get('size',[]))!=size for f in appeared[0]['frames']):raise extra.Inconclusive('Original PNG profile is inconsistent')
            started=time.monotonic();attempt['freshStartedMonotonicMs']=started*1000
            windows=timed('fresh-all-window-tree',lambda:self.ui.all_windows('click-source-fresh'))
            def focus():
                value=self.ar.shell('dumpsys activity activities')
                (self.folder/'click-source-fresh/activity-private.txt').write_text(value,encoding='utf-8');return value
            native=timed('fresh-native-focus',focus)
            size=timed('fresh-window-dimension-check',lambda:fresh_fixture_size(windows,size))
            pill,point=timed('fresh-ownership-validation',lambda:choose_capsule(windows,native,self.journal.data['metadata']['runId'],size))
            latest=timed('final-source-state-read',self.progress)
            if not eligible(latest) or latest['sequence']!=source['sequence'] or latest['observedElapsed']<source['observedElapsed']:
                raise extra.Inconclusive('Owned notice changed during the fresh observation; no tap')
            now=timed('final-phone-elapsed-read',self.elapsed);age=(time.monotonic()-started)*1000
            attempt.update(freshAgeMs=age,phoneElapsedAtGate=now,deadlineMarginMs=event_end-now,sourceObservationAgeMs=now-latest['observedElapsed'],observedNode=pill,point=list(point),actualWindowSize=list(size))
            # Both complete observations remain mandatory. No capture or broadcast is in this gate.
            if age>2500 or now+2000>=event_end or now>=latest['deadlineElapsed'] or now<latest['observedElapsed']:
                raise extra.Inconclusive('Fresh ownership observation missed click window; no tap')
            attempt['tapAttempted']=True;timed('owned-source-tap',lambda:self.ar.shell('input tap %d %d'%point));attempt['tapCompleted']=True
            def callback():
                until=time.monotonic()+5
                while time.monotonic()<until:
                    value=self.progress()
                    if value and value['contentCallbacks']==1 and value.get('contentKind')=='CLICK':return value
                    time.sleep(.1)
                raise extra.Inconclusive('No exact source Activity callback')
            after=timed('source-callback-wait',callback)
            post,postnative,postsize=timed('source-opened-full-evidence',lambda:self.observe_all('source-opened'))
            text='\n'.join(str(n.get('text','')) for w in post for n,_ in extra.walk(w.get('root',{})) if n.get('visible'))
            if tuple(postsize)!=size or not extra.focus_state(post,postnative,PACKAGE)['targetFocusedAndPanelGone'] or 'Duo 已打开自有来源' not in text or self.journal.data['metadata']['runId'] not in text or 'CLICK' not in text or not foreground_component(postnative,CONTENT):
                raise extra.Inconclusive('Source component/title/runId not actually foreground')
            self.report['sourceClick']={'observedNode':pill,'callback':after,'foregroundComponent':CONTENT,'pixelPass':False};attempt['outcome']='exact-owned-source-opened'
        except BaseException:
            attempt['outcome']='inconclusive';attempt['error']=traceback.format_exc();raise
        finally:
            if started is not None and attempt['freshAgeMs'] is None:attempt['freshAgeAtRejectedStageMs']=(time.monotonic()-started)*1000
            self.persist()
    def cleanup_fixture(self):
        d=self.journal.data['fixture']
        if not d['startAttempted']:return
        if apk_hash(self.ar,PACKAGE)!=self.journal.data['metadata']['fixtureApkSha256']:raise extra.Inconclusive('Fixture APK changed; do not control foreign process')
        value=self.progress()
        if value is None:raise extra.Inconclusive('Fixture start outcome unknown; retain recovery journal')
        if not value['closed']:value=self.command('finish',True)
        if not value['closed'] or not value['sessionReleased'] or value['ownNotificationIds'] or value.get('channelPresent') is not False or value.get('receiverRegistered') is not False or value.get('activitiesFinishing') is not True:
            raise extra.Inconclusive('Owned fixture cleanup incomplete')
        # Read the actual native service as well; fixture cleanup ACK is not sufficient.
        records=media_records(self.ar.shell('dumpsys media_session'))
        if any(r['package']==PACKAGE for r in records):raise extra.Inconclusive('Fixture session remains in native service')
        self.notices('after-fixture-cleanup',False)
        d['cleanupVerified']=True;self.journal.save()
        process=getattr(self,'fixture_process',None)
        if process is not None:
            process.wait(timeout=8);self.fixture_log.close()
    def restore(self):
        self.journal.validate();d=self.journal.data;d['pending']=True;d['configurationRestored']=False;self.journal.save();errors=[]
        try:self.cleanup_fixture()
        except BaseException:errors.append(traceback.format_exc())
        try:
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for k,v in d['restore'].items():
                if self.journal.owned_value(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:self.instrument('set','recovery-set',changes)
            reads=[]
            for i in range(2):time.sleep(.5);reads.append(self.instrument('snapshot','recovery-check-'+str(i))['settings'])
            differences=[base.difference(d['baseline'],v) for v in reads];d['configurationDifferences']=differences;d['configurationRestored']=not any(differences)
            self.protected('recovery')
            if external or any(differences):raise extra.Inconclusive('External configuration retained; recovery remains pending')
            try:
                self.observe_all('restored-observation-'+str(len(d['history'])))
                d['restoredPixels']='collected-review-required'
            except Exception:d['restoredPixels']='not-observed';d['restoredPixelError']=traceback.format_exc()
            self.protected('recovery-after-observation')
            final=self.instrument('snapshot','recovery-final')['settings']
            d['postProtectionConfigurationDifference']=base.difference(d['baseline'],final)
            d['configurationRestored']=not d['postProtectionConfigurationDifference']
            if d['postProtectionConfigurationDifference']:raise extra.Inconclusive('Configuration changed while checking protected files/native settings')
            if not errors:d['pending']=False
        except BaseException:errors.append(traceback.format_exc())
        finally:
            d['recoveryErrors']=errors;self.journal.save();self.report.update(configurationRestored=d['configurationRestored'],restorePending=d['pending'],cleanupErrors=errors,wholeFeaturePassed=False);self.persist()
        if errors:raise extra.Inconclusive('Recovery pending; inspect exact journal')

def main():
    p=argparse.ArgumentParser(description=__doc__);mode=p.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    p.add_argument('--case',choices=CASES,default='lifecycle');p.add_argument('--expected-version',required=True,type=int)
    p.add_argument('--fixture-build',type=Path,default=ROOT/'out/island-runtime-fixture/build.json')
    p.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk');a=p.parse_args()
    import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=a.expected_version:raise extra.Inconclusive('Installed main version mismatch')
    if a.restore_only:
        j=Journal(a.restore_only.resolve());m=j.data['metadata']
        for other in extra.safe.AUDIT.rglob('restore.json'):
            if other.resolve()!=j.path.resolve() and json.loads(other.read_text('utf-8')).get('pending'):raise extra.Inconclusive('Another recovery is pending')
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name) or apk_hash(ar,'ls.augment.com.test')!=m['testApkSha256']:raise extra.Inconclusive('Recovery identity changed')
        report_file=j.path.parent/'report.json';report=json.loads(report_file.read_text('utf-8')) if report_file.exists() else {'cases':[],'status':'reconstructed-for-recovery','wholeFeaturePassed':False}
        Collector(ar,j.path.parent,j,report).restore();return
    extra.gates(ar)
    if ar.shell('am get-current-user')!='0' or not re.search(r'\bmWakefulness=Awake\b',ar.shell('dumpsys power')):raise extra.Inconclusive('Current unlocked/awake user0 prerequisite; no unlock or wake attempted')
    build=json.loads(a.fixture_build.read_text('utf-8'));apk=Path(build['apk'])
    if build.get('fixtureRevision')!='island-lifecycle-r2-controls' or digest(apk.read_bytes())!=build['sha256'] or apk_hash(ar,PACKAGE)!=build['sha256']:raise extra.Inconclusive('Reviewed fixture APK identity mismatch')
    if build['sourceSha256']!=digest((ROOT/'tools/fixtures/island/IslandFixtureRunner.java').read_bytes()):raise extra.Inconclusive('Fixture source changed since build')
    if build.get('sourceHashes')!={p.name:digest(p.read_bytes()) for p in (ROOT/'tools/fixtures/island').glob('*.java')}:raise extra.Inconclusive('Fixture protocol/source set changed since build')
    testhash=digest(a.test_apk.read_bytes())
    if apk_hash(ar,'ls.augment.com.test')!=testhash:raise extra.Inconclusive('Installed TestAPK differs from reviewed artifact')
    folder=extra.safe.AUDIT/('island-%d-%s-%s'%(code,a.case,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as out,contextlib.redirect_stdout(out):snapshot=ar.instrument('snapshot','baseline')
    settings=snapshot.get('settings',{})
    if snapshot.get('status')!='pass' or snapshot.get('moduleVersion')!=code or len(settings)!=497 or settings.get('ls_augment_systemui_master')!='1':raise extra.Inconclusive('Reviewed full497 active SystemUI prerequisite')
    media=media_records(ar.shell('dumpsys media_session'))
    if not no_user_playing(media) or any(r['package']==PACKAGE for r in media):raise extra.Inconclusive('User/other fixture media present; no writes')
    notices=notification_records(ar.shell('dumpsys notification',timeout=40))
    reader=Collector.__new__(Collector);reader.ar=ar;resources,names,native=reader.resources(),reader.names(),reader.native()
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'case':a.case,'nativeBaseline':native,
        'runId':uuid.uuid4().hex,'secret':uuid.uuid4().hex,'fixtureApkSha256':build['sha256'],'testApkSha256':testhash,
        'notificationsBefore':notices,'collectorSha256':digest(Path(__file__).read_bytes())}
    j=Journal(folder/'restore.json',settings,metadata,resources,names)
    report={'installedVersion':code,'case':a.case,'cases':[],'status':'prepared','wholeFeaturePassed':False,'allowedMutableKeys':sorted(KEYS),
        'limits':['No pixel pass from config/event ACK','Only owned silent media and ordinary notifications','No battery/native profile/user-media/user-notification mutation','Each case is a separate bounded fixture run','Paused samples are after 4.7s; this does not prove retention during the 4s grace period']}
    c=Collector(ar,folder,j,report);c.persist()
    try:c.exercise()
    except BaseException:report['status']='inconclusive';report['error']=traceback.format_exc();c.persist();raise
    finally:
        try:c.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':j.data.get('configurationRestored'),'pending':j.data['pending']},ensure_ascii=False))

if __name__=='__main__':main()
