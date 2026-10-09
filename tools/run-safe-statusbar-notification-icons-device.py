"""Explicit C-only, two finite owned notification icon cycles; import is offline.

No native settings/assets/neighbor changes. Main-app instrumentation is barred
while the self-instrumenting fixture can be alive. Pixels are never auto-passed.
"""
from pathlib import Path
import argparse, datetime, importlib.util, json, re, shlex, struct, subprocess, time, traceback, uuid

ROOT = Path(__file__).resolve().parents[1]
def load(name, filename):
    spec = importlib.util.spec_from_file_location(name, ROOT/'tools'/filename)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module); return module

rows = load('icons_readonly_rows', 'run-safe-statusbar-rows-device.py')
island = load('icons_readonly_media', 'run-safe-island-device.py')
core, base, extra, clear = rows.core, rows.base, rows.extra, rows.clear
atomic, difference = core.atomic, core.difference
SYSTEM, NOTIFICATIONS = core.SYSTEM, core.NOTIFICATIONS
APP = 'ls.augment.com'; PACKAGE = 'ls.augment.regression.c17'
RUNNER = PACKAGE+'/ls.augment.com.C17FixtureRunner'
CONTENT = PACKAGE+'/ls.augment.com.C17RuntimeFixtureCases$ContentActivity'
APP_LABEL = 'Duo 临时原生验证'
BUILD = ROOT/'out/notification-icons-fixture-20463/build/build.json'
APK_SHA = 'd73cf399b6ab0ba1f95b9ef7e59b3ba575905499f3b8b86ccfe8a4174692b180'
SOURCE_SHA = '2c288b3cad14769a4d7b8b4c832d81060f96ebaae5cad1c64b8596522f19d1ac'
KEYS = {SYSTEM, NOTIFICATIONS}; TIMELINE = {'postAfter':20, 'updateAfter':40, 'removeAfter':60}
PHASES = {'ready':(0,20,'none',[]), 'arrived':(20,40,'white-ring-48-v1',[701]),
          'updated':(40,60,'white-cross-48-v1',[701]), 'removed':(60,90,'white-cross-48-v1',[])}
IDENTITY = ('runId','echoNonce','package','pid','notificationTag','channel','notificationId',
            'progressPath','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs')


class Journal(core.Journal):
    KIND = 'safe-statusbar-notification-icons'
    def validate(self):
        super().validate()
        if self.data['metadata']['case'] != 'notification-icons': raise ValueError('C journal cannot adopt A/B scope')
        if self.data['metadata'].get('fixtureApkSha256') != APK_SHA: raise ValueError('Wrong dedicated fixture build')
        runs = self.data.get('fixtureRuns', [])
        if not isinstance(runs,list) or len(runs)>2: raise ValueError('At most two fixed runs')
        if [f.get('row') for f in runs]!=list(('0','1')[:len(runs)]): raise ValueError('Fixed 00 then 11 order only')
        nonces=set()
        for f in runs:
            if not re.fullmatch('[a-f0-9]{32}',f.get('nonce','')) or f['nonce'] in nonces: raise ValueError('Run nonce reused')
            nonces.add(f['nonce'])
            if f.get('row') not in ('0','1') or f.get('seconds')!=90 or f.get('timeline')!=TIMELINE: raise ValueError('Foreign fixture profile')
            if f.get('startAttempted') is not True or type(f.get('cleanupConfirmed')) is not bool: raise ValueError('Incomplete launch/cleanup ownership')
            if f.get('log')!='cycle-'+f['row']+'-fixture-console-private.txt': raise ValueError('Foreign launch log')
            if not isinstance(f.get('launchElapsed'),int) or f.get('maximumFinishElapsed')!=f['launchElapsed']+125000: raise ValueError('Extended recovery deadline')
            if f.get('identity'): validate_identity(f['identity'],f['nonce'])


def validate_identity(value, nonce):
    run=value.get('runId','')
    if not re.fullmatch('[a-f0-9]{32}',run) or value.get('echoNonce')!=nonce or value.get('package')!=PACKAGE: raise core.Unobserved('Foreign run/nonce/package')
    tag='duo_c17_icons_'+run
    if value.get('notificationTag')!=tag or value.get('channel')!=tag or value.get('notificationId')!=701: raise core.Unobserved('Foreign notification namespace')
    if value.get('progressPath')!='/data/user/0/'+PACKAGE+'/cache/c17-runtime-fixture/'+run+'.json': raise core.Unobserved('Foreign source path')
    for k in ('pid','startedElapsedRealtimeMs','deadlineElapsedRealtimeMs'):
        if type(value.get(k)) is not int or value[k]<=0: raise core.Unobserved('Missing source generation')
    if value['deadlineElapsedRealtimeMs']-value['startedElapsedRealtimeMs']!=90000: raise core.Unobserved('Fixture TTL changed')


def validate_source(v, nonce, identity=None):
    validate_identity(v,nonce)
    if identity and any(v.get(k)!=identity[k] for k in IDENTITY): raise core.Unobserved('Source identity changed')
    if v.get('mode')!='notification-icons' or v.get('seconds')!=90 or v.get('timeline')!=TIMELINE: raise core.Unobserved('Wrong explicit fixture mode/timeline')
    if any(v.get(k) is not False for k in ('moduleEffectsValidated','mediaSessionCreated','audioOutput','audioFocusRequested')) or v.get('moduleConfigurationWrites')!=0: raise core.Unobserved('Fixture contract changed')
    if v.get('fixtureOnly') is not True or v.get('regularNotificationCount')!=1 or v.get('smallIconIsActualBitmap') is not True or v.get('sourceCountIsNotVisibleStatusBarCount') is not True: raise core.Unobserved('Wrong icon fixture contract')
    if v.get('phase') not in (*PHASES,'finished','missed-window'): raise core.Unobserved('Unknown source phase')
    if any(type(v.get(k)) is not bool for k in ('closed','missedWindow','cleanupComplete')): raise core.Unobserved('Missing source lifecycle flags')
    for k in ('seq','elapsedMs','contentActivityCallbacks'):
        if type(v.get(k)) is not int or v[k]<0: raise core.Unobserved('Malformed event counter')
    if v['contentActivityCallbacks']>1 or v.get('ownActiveIds') not in ([],[701]) or v.get('remainingOwnNotifications')!=len(v['ownActiveIds']): raise core.Unobserved('Unexpected own source/callback count')
    if not isinstance(v.get('events'),list) or not isinstance(v.get('cleanupErrors'),list): raise core.Unobserved('Incomplete events/cleanup')
    seqs=[e.get('seq') for e in v['events']]
    if not seqs or seqs!=list(range(1,len(seqs)+1)) or seqs[-1]!=v['seq']: raise core.Unobserved('Event sequence incomplete')
    times=[e.get('elapsedMs') for e in v['events']]
    if any(type(t) is not int or t<0 or t>v['elapsedMs'] for t in times) or times!=sorted(times): raise core.Unobserved('Event chronology invalid')
    if v.get('error') or v.get('progressWriteError') or v['cleanupErrors']: raise core.Unobserved('Source reported an error')
    return v


def phase_valid(v, now, phase):
    lo,hi,glyph,ids=PHASES[phase]; start=v['startedElapsedRealtimeMs']
    if v.get('closed') or v.get('missedWindow') or v['phase']!=phase or v['glyph']!=glyph or v['ownActiveIds']!=ids: raise core.Unobserved('Requested actual phase/glyph is not current')
    if not lo*1000<=v['elapsedMs']<hi*1000 or not lo*1000<=now-start<hi*1000: raise core.Unobserved('Actual phase deadline passed; do not catch up')
    if not 0<=now-start-v['elapsedMs']<=2500: raise core.Unobserved('Progress heartbeat is stale')
    wanted={'ready':'ready','arrived':'notification_posted','updated':'notification_updated','removed':'notification_removed'}[phase]
    events=[e for e in v['events'] if e.get('event')==wanted and e.get('phase')==phase]
    if len(events)!=1 or not lo*1000<=events[0].get('elapsedMs',-1)<hi*1000: raise core.Unobserved('Unique in-window real event receipt absent')
    return start+hi*1000


def partition(raw, identity=None):
    records=clear.notification_records(raw); own=[]; external=[]
    for r in records:
        if r[0]!=PACKAGE: external.append(r); continue
        if not identity or r[3]!=identity['notificationTag'] or r[2]!='701' or r[1] not in ('0','UserHandle{0}'): raise core.Unobserved('Another fixture notification; never adopt it')
        own.append(r)
    if len(own)>1: raise core.Unobserved('Duplicate owned notification record')
    return own,sorted(external)


def local_fixture():
    meta=json.loads(BUILD.read_text('utf-8'));apk=Path(meta['apk'])
    if meta.get('sha256')!=APK_SHA or meta.get('sourceSha256')!=SOURCE_SHA or base.digest(apk.read_bytes())!=APK_SHA: raise core.Unobserved('Dedicated source/build/APK mismatch')
    return meta


def click_row(windows, native, wm, size, source, native_own, system_pid):
    """Do not infer ownership from the generic short title alone."""
    phase_valid(source,source['startedElapsedRealtimeMs']+source['elapsedMs'],'updated')
    if len(native_own)!=1 or native_own[0][0]!=PACKAGE or native_own[0][2:4]!=['701',source['notificationTag']]: raise core.Unobserved('Unique real own record missing')
    candidates=[]
    for w in windows:
        for n,parents in core.walk(w.get('root',{})):
            if n.get('visible') and n.get('text')=='Duo 单通知图标 · 十字更新':
                ancestors=[p for p in parents if p.get('class','').endswith('ExpandableNotificationRow')]
                if len(ancestors)!=1: continue
                row=ancestors[0]; visible=[x for x,_ in core.walk(row) if x.get('visible')]
                labels=[x for x in visible if x.get('id')=='android:id/app_name' and x.get('text')==APP_LABEL]
                content=[x for x in visible if x.get('text')=='本次单通知图标验证，图标 2']
                # There must be a second independent source marker, not merely app/title.
                # Current ROM may expose notification key/tag in description; if absent,
                # this optional target flow remains unobserved instead of guessing.
                markers=[x for x in visible if source['notificationTag'] in str(x.get('description','')) or source['echoNonce'] in str(x.get('text',''))]
                if len(labels)==1 and len(content)==1 and markers and row.get('enabled') and row.get('clickable'): candidates.append(row)
    if len(candidates)!=1: raise core.Unobserved('No exact source-to-row marker; optional click not observed')
    node=candidates[0];b=core.rect(node['bounds']);point=((b[0]+b[2])//2,(b[1]+b[3])//2)
    owner=core.owner(windows,native,wm,size,{'com.android.systemui'},(point[0],point[1],point[0]+1,point[1]+1),system_pid=system_pid)
    if not any(x is node for x,_ in core.walk(owner['root'])): raise core.Unobserved('Owned row is not in focused shade')
    return point


class Collector(base.Collector):
    # Reuse only the two-key journal transport and read-only protection methods;
    # no A/B action/profile/native-write methods or permissions are inherited.
    protect=rows.Collector.protect
    raw_settings=rows.Collector.raw_settings
    assert_config=rows.Collector.assert_config
    config=rows.Collector.config
    set=rows.Collector.set
    diagnostic=rows.Collector.diagnostic
    def __init__(self,*args):
        super().__init__(*args);self.deadline=time.monotonic()+720;self.recovering=False
        self.fixture_proc=None;self.fixture_log=None
        if self.journal.data['metadata']['case']!='notification-icons': raise ValueError('C only')
        rows.font.validate_schema(self.journal.data['metadata']['runtimeSchema'],self.journal.data['metadata']['installedVersion'],self.journal.data['baseline'])
    def bounded(self):
        if not self.recovering and time.monotonic()>self.deadline: raise core.Unobserved('Finite C batch expired')
    def native(self):
        # C deliberately inherits base, not the A/B collector. A borrowed method
        # with zero-argument super() would require an A/B instance at runtime.
        return dict(base.Collector.native(self), **{'global/bluetooth_on':self.ar.shell('settings get global bluetooth_on'),
            'system/screen_off_timeout':self.ar.shell('settings get system screen_off_timeout'),
            'nightPreference':self.ar.shell('cmd uimode night'),'density':self.ar.shell('wm density'),
            'displaySize':self.ar.shell('wm size')})
    def active_fixture(self):
        return any(f.get('startAttempted') and not f.get('cleanupConfirmed') for f in self.journal.data.get('fixtureRuns',[]))
    def instrument(self,operation,label,values=None,**kwargs):
        if self.active_fixture(): raise core.Unobserved('Fixture may be active; no main-app instrumentation')
        if operation not in ('snapshot','set'): raise ValueError('C cannot invoke runtime fixtures/assets/other tests')
        if operation=='set': self.journal.values(values)
        return rows.Collector.instrument(self,operation,label,values,**kwargs)
    def identity(self,label):
        rows.Collector.identity(self,label)
        if rows.package_hash(self.ar,PACKAGE)!=APK_SHA: raise core.Unobserved('Dedicated installed fixture changed')
    def elapsed(self):
        raw=self.ar.shell('cat /proc/uptime').split()
        if len(raw)!=2 or not re.fullmatch(r'\d+\.\d+',raw[0]): raise core.Unobserved('Phone elapsed unavailable')
        return int(float(raw[0])*1000)
    def current(self):
        runs=self.journal.data.get('fixtureRuns',[])
        return runs[-1] if runs else None
    def notifications(self,label,expected=None,strict=True):
        raw=self.ar.shell('dumpsys notification',timeout=40);(self.folder/(label+'-notification-private.txt')).write_text(raw,encoding='utf-8')
        f=self.current();own,external=partition(raw,f.get('identity') if f else None)
        record=dict(own=own,external=external,sameOriginalIdentities=external==self.journal.data['metadata']['notificationsBefore'])
        atomic(self.folder/(label+'-notification-identities-private.json'),record)
        if not record['sameOriginalIdentities']:
            self.journal.data.setdefault('externalNotificationChanges',[]).append(label);self.journal.save()
            if strict: raise core.Unobserved('External notification identities changed')
        if expected is not None and len(own)!=expected: raise core.Unobserved('Native owned record count differs from current phase')
        return own
    def no_media(self,label):
        raw=self.ar.shell('dumpsys media_session');(self.folder/(label+'-media-private.txt')).write_text(raw,encoding='utf-8')
        records=island.media_records(raw)
        if any(r['package']==PACKAGE for r in records): raise core.Unobserved('C fixture must not own media sessions')
        return records
    def quick_identity(self,label):
        observed=rows.strong_identity(self.ar,self.journal.data['metadata']['installedVersionName'])
        if observed!=self.journal.data['metadata']['process']: raise core.Unobserved('Loaded SystemUI generation changed')
        atomic(self.folder/(label+'-loaded.json'),observed)
    def png(self,folder,name):
        start=time.monotonic();raw=self.ar.adb('exec-out','screencap','-p');end=time.monotonic()
        (folder/(name+'.png')).write_bytes(raw)
        if raw[:8]!=b'\x89PNG\r\n\x1a\n' or len(raw)<24: raise core.Unobserved('PNG missing')
        return dict(start=start,end=end,size=struct.unpack('>II',raw[16:24]),sha256=base.digest(raw))
    def observe(self,label,png_size=None):
        self.bounded();folder=self.folder/label;folder.mkdir(exist_ok=True)
        if not re.search(r'\bmWakefulness=Awake\b',self.ar.shell('dumpsys power')): raise core.Unobserved('Already-awake phone required; no automatic wake')
        picture=None
        if png_size is None: picture=self.png(folder,'screen');png_size=picture['size']
        start=time.monotonic();windows=self.ui.all_windows(label);tree_end=time.monotonic()
        native=self.ar.shell('dumpsys activity activities');wm=self.ar.shell('dumpsys window windows');end=time.monotonic()
        (folder/'activity-private.txt').write_text(native,encoding='utf-8');(folder/'windows-private.txt').write_text(wm,encoding='utf-8')
        interval=dict(png=picture,treeStart=start,treeEnd=tree_end,nativeEnd=end,size=png_size,pngNotSameInstantAsTree=True)
        atomic(folder/'interval.json',interval)
        return dict(windows=windows,native=native,wm=wm,size=png_size,started=start,interval=interval)
    def home(self,label):
        ob=self.observe(label+'-before');m=self.journal.data['metadata'];home=m['homeComponent']
        permitted={home,APP+'/.MainActivity',CONTENT}
        # Unknown activity/overlay is never dismissed speculatively.
        title=core.focus_title(ob['native'])
        if title.split('/')[0]==APP: permitted.add(title)
        core.native_owner(ob['native'],ob['wm'],ob['size'],permitted,m['process']['pid'])
        core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{APP,PACKAGE,home.split('/')[0]},navigation_pid=m['process']['pid'])
        if rows.keyguard(self.ar.shell('dumpsys window policy'))['showing']: raise core.Unobserved('Keyguard; no HOME')
        core.invoke_logged(self.folder/(label+'-action.json'),'input keyevent KEYCODE_HOME',lambda:self.ar.shell('input keyevent KEYCODE_HOME'),ob['started'],time.monotonic()+2.5 if self.recovering else self.deadline)
        time.sleep(.45);after=self.observe(label+'-after')
        core.native_owner(after['native'],after['wm'],after['size'],{home},m['process']['pid'])
        if after['size'][0]>=after['size'][1]: raise core.Unobserved('C needs original actual portrait; no rotation writes')
        return after
    def source(self):
        f=self.current();identity=f.get('identity')
        if not identity: raise core.Unobserved('No confirmed run identity')
        self.last_source_monotonic=time.monotonic()
        raw=self.ar.shell('cat '+shlex.quote(identity['progressPath']),root=True)
        value=validate_source(json.loads(raw),f['nonce'],identity);now=self.elapsed()
        return value,now
    def adopt_source(self):
        f=self.current();path=self.folder/f['log']
        if not path.exists(): return False
        identities=[]
        for line in path.read_text('utf-8',errors='replace').splitlines():
            if not line.startswith(('INSTRUMENTATION_STATUS: c17Fixture=','INSTRUMENTATION_RESULT: fixture=')): continue
            try:value=json.loads(line.split('=',1)[1])
            except json.JSONDecodeError: continue
            validate_source(value,f['nonce'],f.get('identity'))
            if not f['launchElapsed']<=value['startedElapsedRealtimeMs']<=f['launchElapsed']+15000: raise core.Unobserved('Source outside this fixed launch interval')
            identities.append({k:value[k] for k in IDENTITY})
        if not identities: return False
        if any(x!=identities[0] for x in identities): raise core.Unobserved('Multiple source identities in launch log')
        f['identity']=identities[0];self.journal.save();return True
    def start_fixture(self,row):
        self.bounded()
        if self.active_fixture() or len(self.journal.data.get('fixtureRuns',[]))>=2: raise core.Unobserved('Existing/maximum source run')
        self.identity('cycle-'+row+'-start');self.protect('cycle-'+row+'-start')
        self.notifications('cycle-'+row+'-start',0);self.no_media('cycle-'+row+'-start')
        if not extra.idle_instrumentation(self.ar.shell('dumpsys activity',timeout=90)): raise core.Unobserved('All main instrumentation must have ended')
        self.assert_config(self.raw_settings('cycle-'+row+'-start'))
        now=self.elapsed();f=dict(row=row,nonce=uuid.uuid4().hex,seconds=90,timeline=TIMELINE.copy(),startAttempted=True,cleanupConfirmed=False,
            launchElapsed=now,maximumFinishElapsed=now+125000,log='cycle-'+row+'-fixture-console-private.txt')
        self.journal.data.setdefault('fixtureRuns',[]).append(f);self.journal.save()
        self.fixture_log=(self.folder/f['log']).open('wb')
        cmd=[str(self.ar.ADB),'-s',self.ar.SERIAL,'shell','am','instrument','-w','-r','-e','operation','c17-runtime-fixture','-e','mode','notification-icons',
            '-e','nonce',f['nonce'],'-e','seconds','90','-e','postAfter','20','-e','updateAfter','40','-e','removeAfter','60',RUNNER]
        self.fixture_proc=subprocess.Popen(cmd,stdout=self.fixture_log,stderr=subprocess.STDOUT)
        f['hostPid']=self.fixture_proc.pid;self.journal.save();until=time.monotonic()+15
        while time.monotonic()<until:
            if self.adopt_source(): return
            if self.fixture_proc.poll() is not None: break
            time.sleep(.15)
        raise core.Unobserved('Ready source unconfirmed; fixed cleanup wait remains mandatory')
    def await_phase(self,phase):
        lo,hi,_,_=PHASES[phase]
        while True:
            self.bounded();v,now=self.source();elapsed=now-v['startedElapsedRealtimeMs']
            if elapsed>=hi*1000 or v.get('missedWindow') or v.get('closed'): raise core.Unobserved('Missed '+phase+'; no replay or TTL extension')
            if v['phase']==phase:
                if v['ownActiveIds']==PHASES[phase][3]: phase_valid(v,now,phase);return v
                # notify/cancel completion may precede getActiveNotifications.
                # Wait only for that exact source's first heartbeat, no repost.
                self.report.setdefault('sourceSettleObservations',[]).append(dict(phase=phase,source=v,phoneElapsed=now));self.persist()
            if elapsed>=lo*1000+3000: raise core.Unobserved('Source did not reach real '+phase)
            time.sleep(min(.5,max(.02,(lo*1000-elapsed)/1000)))
    def phase_capture(self,phase):
        f=self.current();label='cycle-'+f['row']+'-'+phase;folder=self.folder/label;folder.mkdir()
        record=dict(label=label,phase=phase,frames=[],visualPass=False,pixelReviewRequired=True,visibleSlotCount=None,
                    sourceCountIsNotVisibleStatusBarCount=True,status='collecting')
        self.report['cases'].append(record);self.persist()
        self.quick_identity(label);self.assert_config(self.raw_settings(label+'-before'))
        if not re.search(r'\bmWakefulness=Awake\b',self.ar.shell('dumpsys power')): raise core.Unobserved('Phase source alive but screen asleep; no wake')
        for i in range(2):
            before,now=self.source();phase_valid(before,now,phase)
            if before['contentActivityCallbacks']!=int(self.report.get('optionalClick',{}).get('attempted',False)): raise core.Unobserved('Unexpected source content callback')
            frame=self.png(folder,'frame-%02d'%i)
            frame.update(sourceBefore=before,phoneBefore=now,phaseValidated=False)
            record['frames'].append(frame);atomic(folder/'observation.json',record);self.persist()
            after,phone_end=self.source();frame.update(sourceAfter=after,phoneAfter=phone_end)
            # Preserve the actual raw frame and both timings even if the real
            # source advanced while capture was in flight. It is not a pass.
            atomic(folder/'observation.json',record);self.persist();phase_valid(after,phone_end,phase)
            if frame['size'][0]>=frame['size'][1]: raise core.Unobserved('Physical direction changed')
            frame['phaseValidated']=True;atomic(folder/'observation.json',record);self.persist()
            if i==0: time.sleep(.45)
        ob=self.observe(label+'-tree',record['frames'][-1]['size'])
        core.native_owner(ob['native'],ob['wm'],ob['size'],{self.journal.data['metadata']['homeComponent']},self.journal.data['metadata']['process']['pid'])
        core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{self.journal.data['metadata']['homeComponent'].split('/')[0]},navigation_pid=self.journal.data['metadata']['process']['pid'])
        nodes=[n for w in ob['windows'] for n,_ in core.walk(w.get('root',{})) if n.get('visible')]
        bars=[core.rect(n['bounds']) for n in nodes if n.get('id')=='com.android.systemui:id/status_bar']
        if len(bars)!=1 or bars[0][0:2]!=(0,0) or bars[0][2]!=ob['size'][0] or bars[0][3]>ob['size'][1]*.2: raise core.Unobserved('Actual whole statusbar missing')
        record.update(wholeStatusBarBounds=bars[0],actualGeometry=nodes,treeInterval=ob['interval'],
                      nativeOwnRecords=self.notifications(label,len(PHASES[phase][3])),diagnostics=self.diagnostic(label))
        # Trees/canvas coordinates are evidence only; neither counts nor arbitrary
        # notification child accessibility rectangles become an automatic ROI.
        after,now=self.source();phase_valid(after,now,phase);record['sourceAfterTree']=after;record['phoneAfterTree']=now
        self.assert_config(self.raw_settings(label+'-after'))
        record['status']='collected-independent-pixel-review-required';atomic(folder/'observation.json',record);self.persist()
    def optional_click(self):
        """One optional C2 flow; no guessed row or forced expansion/scroll."""
        result=dict(attempted=False,status='not-observed',reason='',sourceCallbacks=None)
        self.report['optionalClick']=result;self.persist()
        try:
            source,now=self.source();end=phase_valid(source,now,'updated')
            if end-now<9000: raise core.Unobserved('Insufficient original phase time for optional flow')
            own=self.notifications('click-before',1);self.assert_config(self.raw_settings('click-before'))
            ob=self.observe('click-before-open');m=self.journal.data['metadata']
            core.native_owner(ob['native'],ob['wm'],ob['size'],{m['homeComponent']},m['process']['pid'])
            core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{m['homeComponent'].split('/')[0]},navigation_pid=m['process']['pid'])
            core.invoke_logged(self.folder/'click-open-action.json','cmd statusbar expand-notifications',lambda:self.ar.shell('cmd statusbar expand-notifications'),ob['started'],self.deadline)
            time.sleep(.35)
            # PNG precedes fresh tree. Source read/deadline and durable action are
            # inside the same 2.5s window; failure does not retry/open another card.
            own=self.notifications('click-current-record',1)
            ob=self.observe('click-source-row');source,now=self.source();end=phase_valid(source,now,'updated')
            point=click_row(ob['windows'],ob['native'],ob['wm'],ob['size'],source,own,m['process']['pid'])
            if end-now<=2000 or source['contentActivityCallbacks']!=0: raise core.Unobserved('Callback/deadline changed before tap')
            result.update(point=point,nonce=source['echoNonce'],runId=source['runId'],freshAgeMs=round((time.monotonic()-ob['started'])*1000),phaseMarginMs=end-now)
            self.journal.data['contentTapAttempted']=True;self.journal.save();self.persist()
            def tap():
                result['attempted']=True
                return self.ar.shell('input tap %d %d'%point)
            core.invoke_logged(self.folder/'click-tap-action.json','input tap %d %d'%point,tap,ob['started'],
                min(self.deadline,self.last_source_monotonic+(end-now-2000)/1000))
            time.sleep(.3);opened=self.observe('click-opened');source,now=self.source()
            core.native_owner(opened['native'],opened['wm'],opened['size'],{CONTENT},m['process']['pid'])
            core.owner(opened['windows'],opened['native'],opened['wm'],opened['size'],{PACKAGE},navigation_pid=m['process']['pid'])
            text='\n'.join(str(n.get('text','')) for w in opened['windows'] for n,_ in core.walk(w.get('root',{})) if n.get('visible'))
            if source['contentActivityCallbacks']!=1 or not all(x in text for x in ('runId='+source['runId'],'nonce='+source['echoNonce'],'图标=2')): raise core.Unobserved('Exact source Activity/body/callback not observed')
            result.update(status='observed-target-pixel-review-required',sourceCallbacks=1,visualPass=False)
        except core.Unobserved as error: result['reason']=str(error)
        finally:
            self.persist()
            # A fresh explicit SystemUI shade may be collapsed, never arbitrary BACK.
            ob=self.observe('click-return-before');title=core.focus_title(ob['native'])
            if title=='NotificationShade':
                core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{'com.android.systemui'},navigation_pid=self.journal.data['metadata']['process']['pid'])
                core.invoke_logged(self.folder/'click-collapse-action.json','cmd statusbar collapse',lambda:self.ar.shell('cmd statusbar collapse'),ob['started'],self.deadline)
                time.sleep(.3)
            self.home('click-home')
    def finish_fixture(self):
        f=self.current()
        if not f or f.get('cleanupConfirmed'): return
        final=None
        while True:
            now=self.elapsed()
            if not f.get('identity'): self.adopt_source()
            if f.get('identity'):
                final,_=self.source();atomic(self.folder/('cycle-'+f['row']+'-final-private.json'),final)
            ended=self.fixture_proc is None or self.fixture_proc.poll() is not None
            if ended and final and final.get('closed') and any(e.get('event')=='fixture_cleanup' for e in final['events']): break
            if now>=f['maximumFinishElapsed']:
                if not f.get('identity') and ended: break
                raise core.Unobserved('Fixed cleanup bound reached; main instrumentation remains forbidden')
            time.sleep(min(1,max(.02,(f['maximumFinishElapsed']-now)/1000)))
        if self.fixture_log: self.fixture_log.close();self.fixture_log=None
        raw=self.ar.shell('dumpsys activity',timeout=90);(self.folder/('cycle-'+f['row']+'-ended-activity-private.txt')).write_text(raw,encoding='utf-8')
        if not extra.idle_instrumentation(raw): raise core.Unobserved('Actual instrumentation still active; no recovery transport')
        samples=[]
        for i in range(2):
            label='cycle-'+f['row']+'-cleanup-'+str(i)
            own=self.notifications(label,0,strict=False);sessions=self.no_media(label)
            samples.append(dict(phoneElapsed=self.elapsed(),ownCount=len(own),ownMedia=sum(r['package']==PACKAGE for r in sessions)))
            if i==0: time.sleep(.4)
        f.update(cleanupConfirmed=True,cleanupSamples=samples,sourceRunConfirmed=bool(f.get('identity')))
        self.journal.save();self.fixture_proc=None;self.persist()
    def exercise(self):
        self.identity('preflight');self.protect('preflight');self.home('known-home')
        for row in ('0','1'):
            self.bounded();self.set('cycle-'+row+'-rows',{SYSTEM:row,NOTIFICATIONS:row})
            self.home('cycle-'+row+'-home');self.start_fixture(row)
            try:
                for phase in PHASES:
                    self.await_phase(phase);self.phase_capture(phase)
                    if row=='1' and phase=='updated' and self.journal.data['metadata']['clickOwned']: self.optional_click()
            finally: self.finish_fixture()
            self.identity('cycle-'+row+'-after');self.protect('cycle-'+row+'-after');self.assert_config(self.config('cycle-'+row+'-after'))
        self.report['status']='finite-source-and-pixel-evidence-collected';self.persist()
    def restore(self):
        self.recovering=True;d=self.journal.data;d.update(pending=True,configurationRestored=False);self.journal.save()
        try: self.finish_fixture()
        except BaseException as error:
            self.report.update(status='recovery-pending',restorePending=True,fixtureCleanupConfirmed=False,cleanupErrors=[repr(error)]);self.persist();raise
        errors=[];external={};terminal=[];identity_ok=False;pixel_error=None
        try:
            extra.gates(self.ar,self.journal.path);self.identity('recovery-identity');identity_ok=True
            current=self.config('recovery-before');external.update(self.journal.settle_inflight(current))
            changes={}
            for k,v in d['restore'].items():
                if self.journal.owns(k,current.get(k)): changes[k]=v
                else: external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:
                self.instrument('set','recovery-set',changes,tracked=True,current=current,recovery=True)
                self.journal.acknowledge(changes,self.config('recovery-readback'),recovery=True)
            if external: errors.append('Latest ownership conflict preserved')
        except BaseException as error: errors.append(repr(error))
        if identity_ok:
            try:
                self.home('restored-home');ob=self.observe('restored-main')
                folder=self.folder/'restored-main';self.png(folder,'frame-00');time.sleep(.45);self.png(folder,'frame-01')
            except BaseException as error: pixel_error=repr(error)
            try:
                self.identity('recovery-final');self.protect('recovery-final',d['metadata']['nativeBaseline'])
                self.notifications('recovery-final',0);self.no_media('recovery-final')
            except BaseException as error: errors.append(repr(error))
            # All costly protection/window/notification work precedes terminal full497.
            try:
                for i in range(2):
                    terminal.append(difference(d['baseline'],self.config('recovery-terminal-'+str(i))))
                    if i==0: time.sleep(.4)
                if any(terminal): errors.append('Terminal full497 differs')
            except BaseException as error: errors.append(repr(error))
        d.update(terminalDifferences=terminal,configurationRestored=len(terminal)==2 and not any(terminal) and not external,
                 cleanupErrors=errors,pending=bool(errors),restoredPixelError=pixel_error)
        self.journal.save();self.report.update(configurationRestored=d['configurationRestored'],restorePending=d['pending'],cleanupErrors=errors,
            restoredPixelError=pixel_error,fixtureCleanupConfirmed=not self.active_fixture(),wholeFeaturePassed=False)
        self.persist()
        if errors: raise core.Unobserved('Recovery pending')


def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--runtime-schema',type=Path)
    parser.add_argument('--click-owned',action='store_true',help='Optional one exact-source target flow in cycle 11; missing marker remains unobserved')
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    if args.run and not args.runtime_schema: parser.error('--run requires --runtime-schema')
    import adb_regression as ar
    restore=args.restore_only
    if restore and restore.is_dir(): restore=restore/'restore.json'
    # A reconnect may need to wait for its already-journalled source first.
    # The broad no-instrumentation gate runs inside restore only AFTER that wait.
    if not restore: extra.gates(ar)
    local_fixture()
    code,name=base.version(ar.shell('dumpsys package '+APP))
    if code!=args.expected_version: raise core.Unobserved('Explicit installed build mismatch')
    if restore:
        journal=Journal(restore);m=journal.data['metadata'];folder=restore.parent
        if m['serial']!=ar.SERIAL or (code,name)!=(m['installedVersion'],m['installedVersionName']): raise core.Unobserved('Original device/build changed')
        report=json.loads((folder/'report.json').read_text('utf-8')) if (folder/'report.json').exists() else dict(cases=[],status='reconstructed-recovery',wholeFeaturePassed=False)
        ar.OUTPUT=folder;Collector(ar,folder,journal,report).restore();return
    schema=json.loads(args.runtime_schema.read_text('utf-8'));test_hash=base.digest(args.test_apk.read_bytes())
    if rows.package_hash(ar,APP+'.test')!=test_hash or rows.package_hash(ar,PACKAGE)!=APK_SHA: raise core.Unobserved('Installed test/fixture hash mismatch')
    folder=extra.safe.AUDIT/('statusbar-notification-icons-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    initial=ar.instrument('snapshot','baseline')
    if initial.get('status')!='pass' or initial.get('moduleVersion')!=code: raise core.Unobserved('Baseline invocation failed')
    settings=initial['settings'];rows.prerequisites(settings);rows.font.validate_schema(schema,code,settings)
    reader=Collector.__new__(Collector);reader.ar=ar
    resources,names,native=reader.resources(),reader.names(),reader.native()
    if any(native.get(k)!='0' for k in ('system/accelerometer_rotation','system/user_rotation')): raise core.Unobserved('Original locked portrait required; no native normalization')
    raw=ar.shell('cat '+base.APP+'shared_prefs/ls_augment_config_v2.xml',root=True);raw_baseline=rows.raw_preferences(raw)
    if rows.resolve_raw(raw_baseline,raw_baseline,settings)!=settings: raise core.Unobserved('Raw/full497 baseline disagree')
    raw=ar.shell('dumpsys notification',timeout=40);(folder/'original-notification-private.txt').write_text(raw,encoding='utf-8')
    _,notifications=partition(raw)
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    metadata=dict(case='notification-icons',serial=ar.SERIAL,installedVersion=code,installedVersionName=name,mainApkSha256=rows.package_hash(ar,APP),
        testApkSha256=test_hash,observerApkSha256=rows.package_hash(ar,'ls.augment.regression.ui'),fixtureApkSha256=APK_SHA,
        process=rows.strong_identity(ar,name),nativeBaseline=native,notificationsBefore=notifications,homeComponent=home,
        runId=uuid.uuid4().hex,runtimeSchema=schema,rawBaseline=raw_baseline,clickOwned=args.click_owned,
        collectorSha256=base.digest(Path(__file__).read_bytes()),coreSha256=base.digest(Path(core.__file__).read_bytes()))
    journal=Journal.create(folder/'restore.json',settings,metadata,resources,names,{})
    report=dict(case='notification-icons',installedVersion=code,cases=[],status='prepared',allowedMutableKeys=sorted(KEYS),nativeMutableKeys=[],
        fixtureIsDevelopmentOnly=True,fixturePackage=PACKAGE,fixtureApkSha256=APK_SHA,wholeFeaturePassed=False,
        limits=['Exactly two 90/20/40/60 single-notification runs; no capacity or icon maximum changes',
                'No fixture media/audio/focus; no user notification action or clear tap',
                'Source record count is not a visible bar icon count; actual pixels/slot and glyph require independent review',
                'Optional click requires an actual source marker in the row, otherwise stays unobserved'])
    collector=Collector(ar,folder,journal,report);collector.persist()
    try: collector.exercise()
    except BaseException as error: report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try: collector.restore()
        finally: print(json.dumps(dict(report=str(folder/'report.json'),pending=journal.data['pending'],configurationRestored=journal.data.get('configurationRestored',False))))


if __name__=='__main__': main()
