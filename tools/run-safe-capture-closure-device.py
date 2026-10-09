"""Opt-in V2-001 closure evidence on an owned white fixture; never a feature pass.

No device access on import. Root must review prerequisites before --run. Reuses
the audited native recorder, content-hash cleanup and 497-key recovery helpers.
"""
from pathlib import Path
import argparse, contextlib, copy, datetime, hashlib, importlib.util, json, re, shlex, struct, time, traceback, uuid

ROOT=Path(__file__).resolve().parents[1]
def load(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
trace=load('capture_closure_identity','run-single-gesture-trace-device.py')
extra=load('capture_closure_journal','run-safe-header-extras-device.py')
rotation_guard=load('capture_closure_rotation','capture_rotation_guard.py')
safe=trace.safe
AUDIT=safe.AUDIT
SHOT,RECORD=safe.CAPTURE_KEYS
KEYS={SHOT,RECORD,safe.SECURE_KEY}
FRESH_SECONDS=2.5
class InputExpired(RuntimeError):pass
atomic=safe.atomic
sha=trace.sha
difference=trace.difference

def split_files(names,kind):
    suffixes=('.mp4',) if kind=='record' else ('.jpg','.jpeg','.png')
    return {n for n in names if '/' not in n and n.lower().endswith(suffixes)}

def fields(raw):
    return dict(part.split('=',1) for part in str(raw).split('|') if '=' in part)

def surface(state,version,pid,revision=None):
    row=fields(state.get('ls_augment_diagnostics_v2',{}).get('ls_augment_rm_capture_surface_snapshot',''))
    current=(row.get('b')==str(version) and row.get('p')==str(pid)
        and (revision is None or row.get('r')==str(revision)))
    return {'currentIdentity':current,'snapshot':row}

def config_conflicts(data,current):
    # Full-key guard: an unrelated mutation must stop the next save too.
    changed=difference(data['baseline'],current)
    for key in data['restore']:
        # An external writer can return a key to its original value. That is
        # still foreign when our latest confirmed value is different.
        if not owned_value(data,key,current.get(key)):
            changed[key]={'baseline':data['baseline'].get(key),'actual':current.get(key)}
    return {k:v for k,v in changed.items() if k not in data['restore'] or not owned_value(data,k,current.get(k))}

def owned_value(data,key,current):
    return current in {data['expected'].get(key,data['baseline'].get(key)),*data['inflight'].get(key,[])}

def supported_cases(cases):
    if not cases or len(set(cases))!=len(cases) or not set(cases)<={'basic','rotation'}:
        raise ValueError('Only basic/rotation are enabled; recording combinations await a bounded 45-second collector')

def expected_config_keys(path):
    if path is None:return None
    keys=json.loads(path.read_text('utf-8'))
    if not isinstance(keys,list) or any(not isinstance(k,str) or not k for k in keys) or len(keys)!=len(set(keys)):
        raise ValueError('Expected configuration keys must be a JSON array of unique nonempty strings')
    result=frozenset(keys)
    if not KEYS<=result:raise ValueError('Expected configuration keys omit a required capture key')
    return result

def validate_baseline(baseline,version,expected=None):
    settings=baseline.get('settings')
    if baseline.get('moduleVersion')!=version or not isinstance(settings,dict):
        raise RuntimeError('Current test baseline version/settings mismatch')
    if expected is None:
        if len(settings)!=497:raise RuntimeError('Expected exact 497-key current test baseline')
    elif set(settings)!=set(expected) or not KEYS<=set(settings):
        raise RuntimeError('Current test baseline does not match the reviewed configuration key set')

def foreground(windows,expected):
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    return len(focused)==1 and focused[0].get('root',{}).get('package') in expected

def focus_package(native):
    values=re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu\d+\s+([^\s}]+)\s*\}',native)
    if len(values)!=1:raise RuntimeError('Native focus is missing/ambiguous')
    if values[0] in ('NotificationShade','control_center'):return 'com.android.systemui'
    if not re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+',values[0]):raise RuntimeError('Unknown native focus title')
    return values[0].split('/')[0]

def component(value):
    if not re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+',value):raise RuntimeError('Invalid component identity')
    package,activity=value.split('/');return package+'/'+(package+activity if activity.startswith('.') else activity)

def native_windows(raw):
    if not raw.startswith('WINDOW MANAGER WINDOWS (dumpsys window windows)'):raise RuntimeError('Incomplete native windows dump')
    blocks=re.split(r'(?m)^\s*Window #(?=\d+ Window\{)',raw)[1:];result=[]
    if not blocks:raise RuntimeError('No native window ordering')
    for block in blocks:
        # Only real shown surfaces can occlude the current input target.
        if not re.search(r'\bisVisible=true\b',block) or 'mHasSurface=true' not in block or 'shown=true' not in block:continue
        rank=re.match(r'(\d+) Window\{[^\n}]*?\bu0\s+([^}]+)\}',block)
        package=re.search(r'\bpackage=([\w.]+)',block);frame=re.search(r'Frames:.*?\bframe=(\[[-\d,]+\]\[[-\d,]+\])',block)
        layer=re.search(r'mBaseLayer=(-?\d+)\s+mSubLayer=(-?\d+)',block)
        session=re.search(r'mSession=Session\{\S+\s+(\d+):',block)
        display=re.search(r'mDisplayId=(\d+)',block)
        if not all((rank,package,frame,layer,display,session)):raise RuntimeError('Shown native window lacks exact identity/frame/layer/PID')
        if display[1]!='0':raise RuntimeError('Additional visible display is outside this collector')
        result.append({'rank':int(rank[1]),'title':rank[2],'package':package[1],'bounds':tuple(map(int,re.findall(r'-?\d+',frame[1]))),
            'pid':session[1],'base':int(layer[1]),'sub':int(layer[2]),'notTouchable':bool(re.search(r'\bNOT_TOUCHABLE\b',block))})
    if not result:raise RuntimeError('No shown native window')
    return result

def overlap(a,b):return a[0]<b[2] and a[2]>b[0] and a[1]<b[3] and a[3]>b[1]
def inside(a,b):return b[0]<=a[0]<a[2]<=b[2] and b[1]<=a[1]<a[3]<=b[3]

def proven_owner(windows,native,wm,size,expected):
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1:raise RuntimeError('No unique focused accessibility window')
    focus=focused[0];pkg=focus['root'].get('package')
    if pkg not in expected or focus_package(native)!=pkg:raise RuntimeError('Unexpected/mismatched native focus; zero input')
    if tuple(extra.rectangle(focus))!=(0,0,*size) or tuple(extra.rectangle(focus['root']))!=(0,0,*size):raise RuntimeError('Focused root/display bounds disagree')
    actual=native_windows(wm)
    matches=[w for w in actual if w['package']==pkg and w['bounds']==(0,0,*size)]
    if len(matches)!=1:raise RuntimeError('Focused window has no exact native owner')
    return focus,actual

def hit_owner(windows,native,wm,size,identity,text):
    expected={'com.android.systemui'} if text=='录屏' else {safe.PACKAGE}
    _,actual=proven_owner(windows,native,wm,size,expected)
    candidates=[(w,n) for w in windows for n in extra.walk(w.get('root',{}))]
    candidates=[(w,pair[0]) for w,pair in candidates if pair[0].get('visible') and pair[0].get('enabled') is not False
        and (pair[0].get('id')==identity if identity else pair[0].get('text')==text)]
    clickable=[x for x in candidates if x[1].get('clickable')]
    if len(clickable)==1:candidates=clickable
    if len(candidates)!=1:raise RuntimeError('Control is not unique in fresh window')
    owner,node=candidates[0];pkg='com.android.systemui' if text=='录屏' else safe.RECORDER
    area=extra.rectangle(node);root=extra.rectangle(owner['root'])
    if node.get('package')!=pkg or owner['root'].get('package')!=pkg or not inside(area,root) or not inside(area,(0,0,*size)):raise RuntimeError('Control owner/bounds invalid')
    matches=[w for w in actual if w['package']==pkg and w['bounds']==root]
    if len(matches)!=1:raise RuntimeError('Control native layer is unknown/ambiguous')
    target=matches[0]
    for w in actual:
        if w is target or not overlap(w['bounds'],area):continue
        if w['rank']>target['rank'] and w['base']<=target['base']:continue
        # Real ROM corner masks have NOT_TOUCHABLE and these exact native titles.
        if w['notTouchable'] and w['package']=='com.android.systemui' and w['title'] in ('ScreenDecorHwcOverlay','ScreenDecorOverlay','ScreenDecorOverlayTop','ScreenDecorOverlayBottom'):continue
        raise RuntimeError('An intersecting native window is above/unknown relative to the target')
    return ((area[0]+area[2])//2,(area[1]+area[3])//2),target

def cv1(state,version,kind):
    diag=state.get('ls_augment_diagnostics_v2',{});revision=state.get('ls_augment_config_v2',{}).get('snapshot_revision_v1')
    found={}
    for side in ('client','server'):
        value=diag.get('ls_augment_rm_capture_'+side+'_start_'+str(kind),'');row=fields(value)
        found[side]={'currentBuildRevision':value.startswith('CV1|') and row.get('b')==str(version) and row.get('r')==str(revision),
            'observation':row}
    return found

class Journal(extra.Journal):
    kind='safe-capture-closure';mutable_keys=KEYS
    def __init__(self,path,baseline=None,metadata=None):
        self.path=Path(path)
        if baseline is None:self.data=json.loads(self.path.read_text('utf-8'))
        else:
            self.data=dict(kind=self.kind,schema=1,pending=True,baseline=baseline,metadata=metadata,
                restore={},allowed={},expected={},inflight={},history=[],ownedFiles=[],plannedFiles=[],fixtureInstallAttempted=False,
                fixtureWasPresent=True,recordingMayBeActive=False,recorderUiMayBeOpen=False,
                nativeCapturePending=None,captureTickets={},nativeExpected={},nativeInflight=None,
                nativePermitted={},finalChecksPending=True,protectionBefore=metadata['protectionBefore'],density=metadata['density'])
            if metadata.get('rotationEnabled'):
                self.data['rotationState']=rotation_guard.initial(metadata['rotationInitial']['native'],metadata['rotationInitial']['actual'])
            self.save()
        if self.data.get('kind')!=self.kind:raise ValueError('Wrong recovery journal')
    def save(self):
        # The reused cleanup helpers cannot close our journal before final checks.
        persisted=dict(self.data)
        if persisted.get('finalChecksPending'):persisted['pending']=True
        atomic(self.path,persisted)
    def restore_config(self,instrument):
        return self.restore(instrument)
    def owned_value(self,key,current):return owned_value(self.data,key,current)
    def restore(self,instrument,pause=time.sleep):
        data=self.data
        if not set(data['restore'])<=self.mutable_keys:raise ValueError('Foreign key in restore journal')
        for key,value in data['restore'].items():
            if value!=data['baseline'].get(key):raise ValueError('Journal original differs from baseline')
        current=instrument('snapshot','recovery-before')['settings'];changes={};external={}
        for key,original in data['restore'].items():
            if not self.owned_value(key,current.get(key)):external[key]=current.get(key)
            else:changes[key]=original
        data['externalValuesPreserved']=external
        if changes:
            # Recovery is a write too. A lost reply after this commit must retain
            # ownership of exactly its input and target, never historical values.
            for key,value in changes.items():data['inflight'][key]=[current[key],value]
            data['history'].append({'restoreAttempt':dict(changes),'at':datetime.datetime.now().isoformat()})
            data['pending']=True;self.save()
            result=instrument('set','recovery-set',changes)
            self.acknowledge(changes)
            data['restoreRuntimeSynced']=result.get('runtimeSynced');self.save()
        stable=0;after=current
        for attempt in range(8):
            after=instrument('snapshot','recovery-readback-'+str(attempt))['settings']
            okay=all(after.get(k)==v for k,v in data['restore'].items() if k not in external)
            stable=stable+1 if okay else 0
            if stable>=2:break
            pause(.6)
        differences=difference(data['baseline'],after)
        data.update(configurationRestored=not differences,ownedConfigurationRestored=stable>=2 and not external,
            externalValuesPreserved=external,configurationDifferences=differences,
            pending=bool(differences) or bool(external) or stable<2)
        self.save()
        if data['pending']:raise RuntimeError('Restoration has preserved external/unsettled changes; journal remains pending')

class Collector(safe.Runner):
    def __init__(self,ar,folder,journal,report):
        super().__init__(ar,folder,journal,report)
        self.sequence=max([0]+[int(m[1]) for p in folder.iterdir() if (m:=re.match(r'^(\d+)-',p.name))])
        self.kind='screenshot'
        self.identity_reader=object.__new__(trace.Collector)
        for k,v in dict(ar=ar,folder=folder,journal=journal,report=report,runner=self).items():setattr(self.identity_reader,k,v)
    def instrument(self,operation,label,values=None):
        result=super().instrument(operation,label,values)
        if result.get('moduleVersion')!=self.journal.data['metadata']['installedVersion']:raise RuntimeError('TestAPK build mismatch')
        return result
    def identity(self,label):
        trace.Collector.identity_current(self.identity_reader,label)
        for package,key in ((safe.PACKAGE,'fixtureSha256'),('ls.augment.regression.ui','observerSha256')):
            if trace.package_hash(self.ar,package)!=self.journal.data['metadata'][key]:raise RuntimeError('Fixture/observer APK changed')
        if not self.runtime_current('com.android.systemui',label):raise RuntimeError('Installed build is not actually loaded')
    def protection(self):return trace.Collector.protection(self.identity_reader)
    def observe(self,label):
        state=self.journal.data.get('rotationState')
        if state:
            if state.get('observersFinished'):raise RuntimeError('Observer prohibited after final rotation restoration')
            rotation_guard.require_owned(state,self.rotation_values())
            if state.get('inflight') or rotation_guard.physical_rotation(self.ar.shell('dumpsys window'))!=state['confirmed']:
                raise RuntimeError('Observer prohibited during native direction mismatch')
        result=super().observe(label)
        if state:rotation_guard.require_owned(state,self.rotation_values())
        return result
    def set(self,label,values,before_commit=None):
        self.identity(label)
        current=self.instrument('snapshot',label+'-before')['settings']
        if config_conflicts(self.journal.data,current):raise RuntimeError('External configuration changed; preserve and stop')
        self.journal.plan(values,current)
        if before_commit:before_commit()
        started=time.monotonic();result=self.instrument('set',label,values);returned=time.monotonic()
        self.journal.acknowledge(values)
        self.report.setdefault('saves',[]).append(dict(label=label,values=values,setCall=started,setReturn=returned,runtimeSynced=result.get('runtimeSynced')))
        self.persist()  # No post-save snapshot/sleep added before SYSRQ.
        return result
    def native_values(self):
        return {ns:{k:self.native_setting(ns,k) for k in keys} for ns,keys in safe.RECORDER_SETTINGS.items()}
    def native_owned(self):
        baseline=self.journal.data.get('nativeRecorderSettings')
        if baseline is None:return
        current=self.native_values();expected=self.journal.data['nativeExpected']
        drift={ns+'/'+k:v for ns,values in current.items() for k,v in values.items()
               if v not in [baseline[ns][k],expected.get(ns,{}).get(k,baseline[ns][k])]+self.journal.data.get('nativePermitted',{}).get(ns+'/'+k,[])}
        if drift:raise RuntimeError('Unowned native preference change; preserve '+str(sorted(drift)))
    def native_action(self,label,action):
        self.native_owned()
        self.journal.data['nativeInflight']={'label':label,'before':self.native_values()};self.journal.save()
        result=action()
        self.journal.data['nativeExpected']=self.native_values();self.journal.data['nativeInflight']=None;self.journal.save()
        return result
    def input_observation(self,label):
        rotation=self.journal.data.get('rotationState')
        if rotation and rotation.get('observersFinished'):raise RuntimeError('Observer prohibited after final rotation restoration')
        if not re.search(r'\bmWakefulness=Awake\b',self.ar.shell('dumpsys power')):raise RuntimeError('Root must wake/unlock first; zero input')
        folder=self.folder/label;folder.mkdir(exist_ok=True)
        png_start=time.monotonic();png=self.ar.adb('exec-out','screencap','-p');png_end=time.monotonic();(folder/'screen.png').write_bytes(png)
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Display dimensions unavailable')
        size=struct.unpack('>II',png[16:24])
        if rotation:
            native=self.rotation_values();rotation_guard.require_owned(rotation,native)
            actual=rotation_guard.physical_rotation(self.ar.shell('dumpsys window',timeout=5))
            if rotation.get('inflight') or actual!=rotation['confirmed'] or (size[0]>size[1])!=(actual=='1'):
                raise RuntimeError('Observer forbidden during unresolved rotation transition')
        started=time.monotonic()
        windows=self.ui.all_windows(label);tree_end=time.monotonic()
        native_start=time.monotonic();native=self.ar.shell('dumpsys activity activities');native_end=time.monotonic()
        wm_start=time.monotonic();wm=self.ar.shell('dumpsys window windows');wm_end=time.monotonic()
        if rotation:rotation_guard.require_owned(rotation,self.rotation_values())
        (folder/'activity-private.txt').write_text(native,encoding='utf-8');(folder/'windows-private.txt').write_text(wm,encoding='utf-8')
        atomic(folder/'fresh.json',{'pngRequested':png_start,'pngCompleted':png_end,'treeRequested':started,'treeCompleted':tree_end,
            'nativeFocusRequested':native_start,'nativeFocusCompleted':native_end,'nativeWindowsRequested':wm_start,'nativeWindowsCompleted':wm_end,
            'completed':time.monotonic(),'maxInputAgeSeconds':FRESH_SECONDS,'pngBeforeFreshTree':True,'continuousObservation':False})
        return windows,native,wm,size,started
    def fresh_input(self,label,command,observation,execution=None,transport_timeout=None):
        # Mutable call evidence remains available even when local logging or
        # transport raises. A shell timeout is never proof of zero phone input.
        if execution is None:execution={}
        execution.update(transportCalled=False,transportReturned=False)
        age=time.monotonic()-observation[4]
        if not 0<=age<=FRESH_SECONDS:raise InputExpired('Fresh input observation expired; zero input')
        path=self.folder/(label+'-action.json')
        row={'command':command,'treeRequested':observation[4],'freshAgeBeforeLogMs':round(age*1000),'transportAttempted':False}
        atomic(path,row)
        started=time.monotonic();age=started-observation[4]
        if not 0<=age<=FRESH_SECONDS:
            row.update(freshAgeMs=round(age*1000),refused='expired_after_action_log');atomic(path,row)
            raise InputExpired('Fresh input observation expired after action log; zero input')
        row.update(freshAgeMs=round(age*1000),transportAttempted=True,inputCall=started)
        shell=self.ar.shell
        execution['transportCalled']=True
        try:
            row['transportOutput']=shell(command) if transport_timeout is None else shell(command,timeout=transport_timeout)
            execution['transportReturned']=True
        except BaseException as error:
            row.update(inputReturn=time.monotonic(),transportReturned=False,transportError=type(error).__name__)
            try:atomic(path,row)
            except Exception as log_error:execution['actionLogError']=type(log_error).__name__
            raise
        row.update(inputReturn=time.monotonic(),transportReturned=True);atomic(path,row)
        return row
    def tap(self,label,identity=None,text=None,before_tap=None):
        def click():
            if identity:self.assert_owned_recorder(require_alive=True)
            observation=self.input_observation(label+'-fresh')
            point,owner=hit_owner(*observation[:4],identity,text)
            expected_pid=self.journal.data['recorderPid'] if identity else self.journal.data['metadata']['systemuiIdentity']['pid']
            if owner['pid']!=str(expected_pid):raise RuntimeError('Native target PID differs from owned runtime')
            atomic(self.folder/(label+'-target.json'),owner)
            callback_keys=('recorderUiMayBeOpen','recorderLaunchPending','recorderPid','nativeCapturePending','captureTickets')
            previous={k:copy.deepcopy(self.journal.data.get(k)) for k in callback_keys}
            if before_tap:before_tap()
            if identity==safe.RECORDER+':id/stop_bn':
                # Exact audited callback: RecordScreenControlFloatingView.java:1415
                # writes 3 after async file-save completion, later than tap ACK.
                self.journal.data['nativePermitted']['system/recording_screen_status']=['3'];self.journal.save()
            try:self.fresh_input(label,'input tap %d %d'%point,observation)
            except InputExpired:
                # Known local refusal before sending input, not a transport timeout.
                for k,v in previous.items():self.journal.data[k]=v
                self.journal.data['lastInputRefusedBeforeTransport']=label;self.journal.save();raise
        self.native_action(label,click)
    def restore_recorder_settings(self):
        self.native_owned()
        super().restore_recorder_settings()
    def known_navigation(self,label):
        observation=self.input_observation(label+'-before-navigation')
        home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        owner,actual=proven_owner(*observation[:4],{home,safe.PACKAGE})
        focused=re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu\d+\s+([^\s}]+)\s*\}',observation[1])
        allowed={component(self.journal.data['metadata']['homeComponent']),component(safe.PACKAGE+'/.PlainActivity'),component(safe.PACKAGE+'/.LandscapeActivity')}
        if len(focused)!=1 or component(focused[0]) not in allowed:raise RuntimeError('Unknown activity within known package; no navigation')
        display=(0,0,*observation[3])
        target=next(w for w in actual if w['package']==owner['root']['package'] and w['bounds']==display)
        for w in actual:
            rect=w['bounds']
            if len(rect)!=4 or rect[2]<rect[0] or rect[3]<rect[1]:raise RuntimeError('Invalid native window rectangle; no navigation')
            if rect[0]==rect[2] or rect[1]==rect[3] or not overlap(rect,display):continue
            if w['title']=='com.android.systemui.wallpapers.ImageWallpaper':
                if (w['package']=='com.android.systemui' and w['pid']==str(self.journal.data['metadata']['systemuiIdentity']['pid'])
                    and w['notTouchable'] and w['rank']>target['rank'] and w['base']+w['sub']<target['base']+target['sub']):continue
                raise RuntimeError('Wallpaper identity/touchability/ordering is not proven below owner; no navigation')
            if w['package'] not in (home,safe.PACKAGE,'com.android.systemui',safe.RECORDER):raise RuntimeError('Unknown shown window; no navigation')
            if w['package']==safe.RECORDER:self.assert_owned_recorder(require_alive=True)
            if w['package']=='com.android.systemui' and not (w['title'].startswith(('ScreenDecor','GestureStub')) or w['title'] in ('StatusBar','NavigationBar0')):
                raise RuntimeError('Unknown shown SystemUI surface; no navigation')
        return observation
    def fixture_page(self,label,wide=False):
        if self.journal.data.get('rotationState'):return self.rotation_fixture_page(label,wide)
        observation=self.known_navigation(label)
        component=safe.PACKAGE+('/.LandscapeActivity' if wide else '/.PlainActivity')
        self.fresh_input(label+'-navigate','am start -W -n '+component,observation)
        time.sleep(.6)
        windows=self.ui.all_windows(label+'-fixture')
        if not foreground(windows,{safe.PACKAGE}):raise RuntimeError('Owned fixture is not focused')
        raw=self.ar.adb('exec-out','screencap','-p')
        if raw[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Fixture screen missing')
        w,h=struct.unpack('>II',raw[16:24]);(self.folder/(label+'-fixture.png')).write_bytes(raw)
        if (w>h)!=wide:raise RuntimeError('Actual fixture orientation differs; no capture triggered')
        atomic(self.folder/(label+'-geometry.json'),{'width':w,'height':h,'landscape':wide,'component':component})
        return (w,h)
    def rotation_values(self,deadline=None):
        values={}
        for name,key in [('auto','accelerometer_rotation'),('user','user_rotation')]:
            remaining=5 if deadline is None else deadline-time.monotonic()
            if remaining<=0:raise RuntimeError('Native rotation observation deadline expired')
            values[name]=self.ar.shell('settings get system '+key,timeout=min(5,remaining)).strip()
        return values
    def rotation_observation(self,label,deadline=None):
        # This entire path is native-only. UiAutomation disconnect itself can
        # freeze the actual display rotation and overwrite the user's value.
        deadline=time.monotonic()+6 if deadline is None else deadline
        def budget():
            remaining=deadline-time.monotonic()
            if remaining<=0:raise RuntimeError('Native rotation observation deadline expired')
            return remaining
        if not re.search(r'\bmWakefulness=Awake\b',self.ar.shell('dumpsys power',timeout=budget())):raise RuntimeError('Rotation requires awake known window; zero input')
        folder=self.folder/label;folder.mkdir(exist_ok=False);started=time.monotonic()
        png=self.ar.adb('exec-out','screencap','-p',timeout=budget());(folder/'screen.png').write_bytes(png)
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Rotation source PNG missing')
        size=struct.unpack('>II',png[16:24]);native=self.ar.shell('dumpsys window',timeout=budget());wm=self.ar.shell('dumpsys window windows',timeout=budget())
        (folder/'window-private.txt').write_text(native,'utf-8');(folder/'windows-private.txt').write_text(wm,'utf-8')
        focused=rotation_guard.focused_component(native);actual=rotation_guard.physical_rotation(native)
        home=component(self.journal.data['metadata']['homeComponent']);allowed={home,component(safe.PACKAGE+'/.PlainActivity'),component(safe.PACKAGE+'/.LandscapeActivity')}
        if focused not in allowed:raise RuntimeError('Unknown native source activity during rotation')
        rows=native_windows(wm);display=(0,0,*size)
        targets=[w for w in rows if w['title']==focused and w['package']==focused.split('/')[0]]
        if len(targets)!=1:raise RuntimeError('No unique exact full-display native rotation owner')
        target=targets[0];rect=target['bounds']
        # Only a precisely transposed full-display frame is a known transition.
        # Missing, partial, offset or duplicate owners remain hard refusals.
        if rect not in (display,(0,0,size[1],size[0])):raise RuntimeError('No unique exact full-display native rotation owner')
        coverage=(0,0,max(size[0],rect[2]),max(size[1],rect[3]))
        pid=str(self.journal.data['metadata']['systemuiIdentity']['pid'])
        for w in rows:
            rect=w['bounds']
            if len(rect)!=4 or rect[2]<rect[0] or rect[3]<rect[1]:raise RuntimeError('Unknown rotation source bounds')
            if w is target or rect[0]==rect[2] or rect[1]==rect[3] or not overlap(rect,coverage):continue
            if (w['package']=='com.android.systemui' and w['pid']==pid and
                ((w['title']=='com.android.systemui.wallpapers.ImageWallpaper' and w['notTouchable'] and w['rank']>target['rank'] and w['base']+w['sub']<target['base']+target['sub'])
                 or w['title'] in ('ScreenDecorHwcOverlay','ScreenDecorOverlay','ScreenDecorOverlayTop','ScreenDecorOverlayBottom','GestureStubRight','GestureStubLeft','StatusBar','NavigationBar0'))):continue
            raise RuntimeError('Unknown visible native rotation overlay; zero input')
        values=self.rotation_values(deadline);state=self.journal.data['rotationState'];rotation_guard.require_owned(state,values)
        result={'component':focused,'actual':actual,'size':list(size),'native':values,'started':started,'completed':time.monotonic(),'nativeOnly':True}
        if target['bounds']!=display or (size[0]>size[1])!=(actual=='1'):
            result.update(geometryPending=True,ownerBounds=list(target['bounds']))
            atomic(folder/'observation.json',result)
            raise rotation_guard.KnownGeometryPending('Known fullscreen geometry not yet consistent; no input or observer')
        atomic(folder/'observation.json',result)
        # Reuses unchanged input age accounting, without an accessibility tree.
        result['inputObservation']=([],native,wm,size,started)
        return result
    def rotation_write(self,label,target,observation):
        if str(target) not in ('0','1'):raise ValueError('Only explicit rotation0/1 are permitted')
        state=self.journal.data['rotationState'];native=self.rotation_values();rotation_guard.require_owned(state,native)
        if state.get('inflight'):raise RuntimeError('Unresolved rotation write; restore before new transition')
        if native['user']==str(target):return
        pending={'before':state['confirmed'],'target':str(target),'phase':'intent','transportCalled':False,'transportReturned':False,'label':label}
        execution={'transportCalled':False,'transportReturned':False}
        try:
            state['inflight']=pending;self.journal.save()
            self.fresh_input(label,'settings put system user_rotation '+str(target),observation['inputObservation'],execution,transport_timeout=6)
            pending.update(execution,phase='returned');self.journal.save()
            current=self.rotation_values()
            if current!={'auto':'0','user':str(target)}:raise RuntimeError('Rotation write did not read back exactly; preserve pending')
            state['confirmed']=str(target);state['history'].append(dict(pending,readback=current));state['inflight']=None;self.journal.save()
        except BaseException as error:
            pending.update(execution,error=type(error).__name__)
            if not execution['transportCalled']:
                state['history'].append(dict(pending,phase='before_transport'));state['inflight']=None
            else:pending['phase']='returned' if execution['transportReturned'] else 'transport_uncertain'
            try:self.journal.save()
            except Exception:pass
            raise
    def rotation_wait(self,label,target,expected,deadline_seconds=6):
        deadline=time.monotonic()+deadline_seconds
        for attempt in range(6):
            try:
                observation=self.rotation_observation(label+'-'+str(attempt),deadline)
                if rotation_guard.target_ready(observation,target,expected):return observation
            except rotation_guard.KnownGeometryPending:
                pass  # No unknown identity/overlay/ownership error is retried.
            if time.monotonic()>=deadline:break
            time.sleep(.15)
        raise RuntimeError('Exact native component/direction not ready within bounded wait; no observer or SYSRQ')
    def rotation_fixture_page(self,label,wide):
        target='1' if wide else '0';expected=component(safe.PACKAGE+('/.LandscapeActivity' if wide else '/.PlainActivity'))
        observation=self.rotation_observation(label+'-native-before-write')
        self.rotation_write(label+'-native-rotation',target,observation)
        # A fresh native-only source is required even after the settings call.
        source=self.rotation_observation(label+'-native-before-launch')
        reply=self.fresh_input(label+'-navigate','am start -W --activity-clear-top -n '+expected,source['inputObservation'],transport_timeout=6)
        rotation_guard.launch_receipt(reply['transportOutput'],expected)
        ready=self.rotation_wait(label+'-native-ready',target,expected)
        atomic(self.folder/(label+'-geometry.json'),{'width':ready['size'][0],'height':ready['size'][1],'landscape':wide,'component':expected,'nativeRotation':ready['actual']})
        return tuple(ready['size'])
    def restore_rotation(self):
        state=self.journal.data['rotationState'];self.identity_reader.idle_instrumentation()
        attempt=state.get('restoreAttempt',0)
        if type(attempt) is not int or attempt<0:raise RuntimeError('Invalid restore attempt counter')
        state['restoreAttempt']=attempt+1;self.journal.save()
        prefix='restore-rotation-attempt-%03d'%(attempt+1)
        # Recovery may reconcile only a persisted actual transport's own pair;
        # an intent that was never proved dispatched cannot acquire its target.
        native=self.rotation_values();rotation_guard.require_owned(state,native)
        pending=state.get('inflight')
        if pending:
            if not pending.get('transportCalled') and native['user']!=state['confirmed']:raise RuntimeError('Unconfirmed rotation transport cannot own target')
            state['history'].append(dict(pending,reconciled=native['user']));state['confirmed']=native['user'];state['inflight']=None;self.journal.save()
        state['observersFinished']=True;self.journal.save()
        source=self.rotation_observation(prefix+'-before-home');home=component(self.journal.data['metadata']['homeComponent'])
        self.rotation_write(prefix+'-native-write',state['original'],source)
        # HOME itself may write user_rotation=0 via RotationButtonController.
        # Own and confirm that target BEFORE launch, never adopt it afterward.
        source=self.rotation_observation(prefix+'-before-launch')
        if source['component']!=home:
            reply=self.fresh_input(prefix+'-home','am start -W -n '+home,source['inputObservation'],transport_timeout=6)
            rotation_guard.launch_receipt(reply['transportOutput'],home)
        ready=self.rotation_wait(prefix+'-final','0',home)
        readbacks=[self.rotation_values()];time.sleep(.2);readbacks.append(self.rotation_values())
        if readbacks!=[{'auto':'0','user':'0'}]*2:raise RuntimeError('Final rotation changed; preserve pending')
        state.update(restored=True,readbacks=readbacks,finalObservation={k:v for k,v in ready.items() if k!='inputObservation'});self.journal.save()
        self.report['restoredScreen']='native-only HOME PNG after final owned rotation restoration'
    def files(self):return split_files(super().files(),self.kind)
    def capture_begin(self,label):
        tickets=self.journal.data['captureTickets']
        if self.kind in tickets:raise RuntimeError('This media kind has an unresolved output')
        tickets[self.kind]={'label':label,'before':sorted(self.files()),'triggerAttempted':False}
        self.journal.data['nativeCapturePending']=tickets[self.kind];self.journal.save()
    def capture_result(self,label,suffix):
        self.kind='record' if suffix=='.mp4' else 'screenshot'
        ticket=self.journal.data['captureTickets'].get(self.kind)
        if not ticket or ticket['label']!=label:raise RuntimeError('Capture ticket identity mismatch')
        if ticket.get('triggerAttempted') is not True:raise RuntimeError('Capture was not triggered; no output may be claimed')
        self.journal.data['nativeCapturePending']=ticket;self.journal.save()
        path=super().capture_result(label,suffix)
        if sha(path.read_bytes())!=self.journal.data['ownedFiles'][-1]['sha256']:raise RuntimeError('Local media hash differs')
        del self.journal.data['captureTickets'][self.kind]
        self.journal.data['nativeCapturePending']=next(iter(self.journal.data['captureTickets'].values()),None);self.journal.save()
        return path
    def state(self,label):
        self.capture_state(label)
        return json.loads((self.folder/(label+'-capture-state.json')).read_text('utf-8'))
    def settled_state(self,label,lease):
        result=None
        for attempt in range(8):
            result=self.state(label+'-'+str(attempt))
            config=result['ls_augment_config_v2'];s=surface(result,self.report['installedVersion'],self.journal.data['metadata']['systemuiIdentity']['pid'],config['snapshot_revision_v1'])
            row=s['snapshot'];ok=(s['currentIdentity'] and row.get('leases')==str(lease) and row.get('retired')=='0'
                and row.get('ap')=='true' and row.get('ex')==str(lease>0).lower())
            if ok:return s
            time.sleep(.25)
        raise RuntimeError('Exact expected capture lease/surface release was not observed: '+label)
    def screenshot_observation(self,label,wide):
        observation=self.known_navigation(label+'-capture')
        owner,actual=proven_owner(*observation[:4],{safe.PACKAGE})
        expected=component(safe.PACKAGE+('/.LandscapeActivity' if wide else '/.PlainActivity'))
        focused=re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu\d+\s+([^\s}]+)\s*\}',observation[1])
        if len(focused)!=1 or component(focused[0])!=expected:raise RuntimeError('Wrong owned capture activity; no SYSRQ')
        marker=[n for n,p in extra.walk(owner['root']) if n.get('visible') and n.get('package')==safe.PACKAGE
            and n.get('description')=='duo_owned_audit_plain']
        if len(marker)!=1 or not inside(extra.rectangle(marker[0]),(0,0,*observation[3])):
            raise RuntimeError('Owned white marker missing/ambiguous; no SYSRQ')
        if any(w['package']==safe.RECORDER for w in actual):raise RuntimeError('Recording overlays are disabled in this capture candidate')
        if (observation[3][0]>observation[3][1])!=wide:raise RuntimeError('Fresh display orientation differs; no SYSRQ')
        age=time.monotonic()-observation[4]
        if not 0<=age<=FRESH_SECONDS:raise InputExpired('Fresh capture observation expired before save; zero input')
        return observation
    def screenshot(self,label,values=None,wide=False,prepare=True):
        if prepare:self.fixture_page(label,wide)
        else:
            windows=self.ui.all_windows(label+'-owned-background')
            owned=any(n.get('visible') and n.get('package')==safe.PACKAGE and n.get('description')=='duo_owned_audit_plain'
                for w in windows for n in self.ui.nodes([w]))
            if not owned or not foreground(windows,{safe.PACKAGE,safe.RECORDER}):raise RuntimeError('Owned white background not confirmed; no SYSRQ')
        self.kind='screenshot';self.capture_begin(label)
        before=self.state(label+'-before-set')
        fresh=[]
        def before_commit():fresh.append(self.screenshot_observation(label,wide))
        # The slow identity/snapshot/plan steps precede our last source check.
        # Save -> SYSRQ contains local work only, preserving the intended race.
        if values is not None:self.set(label,values,before_commit=before_commit)
        else:before_commit()
        ticket=self.journal.data['captureTickets']['screenshot']
        saved=next((x for x in reversed(self.report.get('saves',[])) if x['label']==label),None)
        execution={'transportCalled':False,'transportReturned':False}
        try:
            # Write-ahead intent is explicitly UNKNOWN, not evidence that SYSRQ
            # ran. A crash at any point before the confirmed return fails closed.
            ticket.update(triggerAttempted=None,triggerPhase='intent');self.journal.save()
            action=self.fresh_input(label+'-sysrq','input keyevent KEYCODE_SYSRQ',fresh[0],execution)
            ticket.update(triggerAttempted=True,triggerPhase='transport_returned');self.journal.save()
        except BaseException as error:
            refused=time.monotonic()
            confirmed=True if execution['transportReturned'] else (None if execution['transportCalled'] else False)
            phase='transport_returned' if confirmed is True else ('transport_uncertain' if confirmed is None else 'before_transport')
            ticket.update(triggerAttempted=confirmed,triggerPhase=phase,triggerError=type(error).__name__)
            if confirmed is False:ticket['triggerRefused']='freshness_deadline' if isinstance(error,InputExpired) else 'local_before_transport'
            # Preserve the original exception. If storage stays unavailable the
            # durable intent remains unknown and cannot adopt/delete any media.
            try:self.journal.save()
            except Exception as log_error:ticket['triggerRecoveryLogError']=type(log_error).__name__
            timing=dict(treeRequested=fresh[0][4],refusedAt=refused,
                freshAgeMs=round((refused-fresh[0][4])*1000),setCall=saved['setCall'] if saved else None,
                setReturn=saved['setReturn'] if saved else None,triggerAttempted=confirmed,triggerPhase=phase,
                transportCalled=execution['transportCalled'],transportReturned=execution['transportReturned'],
                phoneReadBetweenSaveAndTrigger=False,continuousObservation=False)
            try:atomic(self.folder/(label+'-capture-window.json'),timing)
            except Exception:pass
            raise
        started=action['inputCall'];ended=action['inputReturn']
        timing=dict(treeRequested=fresh[0][4],freshAgeMs=action['freshAgeMs'],setCall=saved['setCall'] if saved else None,
            setReturn=saved['setReturn'] if saved else None,triggerCall=started,triggerReturn=ended,
            saveReturnToTriggerMs=round((started-saved['setReturn'])*1000) if saved else None,
            phoneReadBetweenSaveAndTrigger=False,continuousObservation=False)
        atomic(self.folder/(label+'-capture-window.json'),timing)
        path=self.capture_result(label,'.jpg');after=self.state(label+'-after')
        client=cv1(after,self.report['installedVersion'],0)['client']
        pid=self.ar.adb('shell','pidof '+safe.RECORDER,check=False).decode().strip()
        if pid and client['currentBuildRevision'] and client['observation'].get('p')==pid:
            self.claim_recorder()  # A new process may not be silently adopted later.
        row={'label':label,'artifact':path.name,'sha256':sha(path.read_bytes()),'triggerCall':started,'triggerReturn':ended,
            'before':surface(before,self.report['installedVersion'],self.journal.data['metadata']['systemuiIdentity']['pid']),
            'after':surface(after,self.report['installedVersion'],self.journal.data['metadata']['systemuiIdentity']['pid']),
            'runtimeObservation':cv1(after,self.report['installedVersion'],0),'landscape':wide,'kind':'screenshot','captureWindow':timing}
        self.report['samples'].append(row);self.persist();return row
    def video(self,label):
        self.kind='record';observation=self.input_observation(label+'-before-panel')
        proven_owner(*observation[:4],{safe.PACKAGE})
        self.fresh_input(label+'-open-panel','cmd statusbar expand-settings',observation)
        self.tap_stable_recorder_tile(label+'-tile');self.await_recorder_menu(label)
        if not self.runtime_current(safe.RECORDER,label):raise RuntimeError('Recorder loaded build is wrong')
        self.mute_recorder(label);self.start_muted_recording(label)
        for attempt in range(8):
            observed=self.state(label+'-started-'+str(attempt));client=cv1(observed,self.report['installedVersion'],1)['client']
            if (client['currentBuildRevision'] and client['observation'].get('p')==self.journal.data['recorderPid']
                and self.native_setting('global','record_screen_state')=='1'):
                self.report.setdefault('recordStarts',[]).append({'label':label,'observation':client});self.persist();return
            time.sleep(.25)
        raise RuntimeError('Actual current-revision native MediaRecorder start not observed; no concurrent screenshot')
    def end_video(self,label):
        self.tap(label+'-stop',identity=safe.RECORDER+':id/stop_bn')
        self.journal.data['recordingMayBeActive']=False;self.journal.save()
        path=self.capture_result(label,'.mp4');handlers=safe.mp4_handlers(path.read_bytes())
        if 'soun' in handlers:
            path.unlink()
            raise RuntimeError('Unexpected audio track despite mute gate; host copy removed, owned remote cleanup remains journaled')
        import cv2
        video=cv2.VideoCapture(str(path));frames=[]
        try:
            while True:
                ok,frame=video.read()
                if not ok:break
                source=self.report['recordGeometry'][label];h,w=frame.shape[:2]
                if abs(w/h-source[0]/source[1])>.01:raise RuntimeError('Recorded aspect ratio differs from owned source')
                frames.append({'frame':len(frames),'msec':video.get(cv2.CAP_PROP_POS_MSEC),'ink':self.ink(frame,w/source[0]),'width':w,'height':h})
        finally:video.release()
        if not frames:raise RuntimeError('No decoded recording frames')
        atomic(self.folder/(label+'-frames.json'),frames)
        self.report['samples'].append(dict(label=label,kind='record',artifact=path.name,sha256=sha(path.read_bytes()),handlers=handlers,
            frames=len(frames),foregroundMin=min(x['ink'] for x in frames),foregroundMax=max(x['ink'] for x in frames),allFramePixelsFile=label+'-frames.json'))
        self.persist();self.settled_state(label+'-released',0)
        self.native_action(label+'-close',self.close_recorder)
    def ink(self,array,scale=1):
        import numpy as np
        h,w=array.shape[:2];bottom=min(h,round(self.journal.data['density']*44*scale))
        band=np.asarray(array)[round(self.journal.data['density']*8*scale):bottom,:,:3].astype(int)
        mask=band.min(axis=2)<225
        mask[:,:round(w*.02)]=False;mask[:,round(w*.98):]=False;mask[:,round(w*.40):round(w*.60)]=False
        return int(mask.sum())
    def run(self,cases):
        supported_cases(cases)  # Before identity reads, setup, configuration or native recording.
        self.identity('start');self.known_navigation('preflight');self.prepare_recorder();self.journal.data['nativeExpected']=self.native_values();self.journal.save()
        self.set('secure-capture-off',{safe.SECURE_KEY:'0'})
        # Baselines are finite calibration, not repeated statistical attempts.
        off={SHOT:'0',RECORD:'0'};on={SHOT:'1',RECORD:'0'}
        self.screenshot('portrait-reference',off);self.settled_state('portrait-reference-release',0)
        if 'basic' in cases:
            self.screenshot('current-on',on);self.settled_state('current-on-release',0)
            self.screenshot('current-off',off);self.settled_state('current-off-release',0)
        if 'rotation' in cases:
            self.screenshot('landscape-reference',off,True);self.settled_state('landscape-reference-release',0)
            samples=[]
            for label,wide in [('rotation-portrait',False),('rotation-landscape',True),('rotation-back',False)]:
                samples.append(self.screenshot(label,on,wide));self.settled_state(label+'-released',0)
            self.screenshot('rotation-off',off);self.settled_state('rotation-off-released',0)
            epochs=[x['after']['snapshot'].get('e') for x in samples]
            self.report['rotation']={'epochs':epochs,'surfaceReplacementObserved':len(set(epochs))>1 and None not in epochs,
                'geometryChangeIsNotProofOfSurfaceReplacement':True};self.persist()
        self.pixel_summary()
    def pixel_summary(self):
        from PIL import Image
        import numpy as np
        reference={};reference_arrays={}
        for row in self.report['samples']:
            if row['kind']!='screenshot':continue
            pixels=np.asarray(Image.open(self.folder/row['artifact']).convert('RGB'));row['foregroundPixels']=self.ink(pixels)
            if row['label'].endswith('reference'):
                reference[row['landscape']]=row['foregroundPixels'];reference_arrays[row['landscape']]=pixels
            base=reference.get(row['landscape']);hidden=('on'==row['label'].removeprefix('current-') or row['label'] in ('rotation-portrait','rotation-landscape','rotation-back') or row['label'].startswith('combo-'))
            row['expectedHidden']=hidden;row['baselinePixels']=base
            row['heuristicObserved']=(base is not None and base>=100 and (row['foregroundPixels']<=max(60,base*.15) if hidden else row['foregroundPixels']>=base*.65))
            original=reference_arrays.get(row['landscape'])
            if original is not None and original.shape==pixels.shape:
                h,w=pixels.shape[:2];box=[round(w*.15),round(h*.30),round(w*.85),round(h*.70)];x0,y0,x1,y1=box
                delta=np.abs(original[y0:y1,x0:x1].astype(int)-pixels[y0:y1,x0:x1].astype(int))
                row['bodyComparison']={'roi':box,'changedPixels':int(np.any(delta>0,axis=2).sum()),'changedOver8Pixels':int(np.any(delta>8,axis=2).sum()),
                    'maxChannelDifference':int(delta.max()),'meanChannelDifference':float(delta.mean()),'manualReviewRequired':True}
        self.report.update(machineScreenshotChecks=all(x.get('heuristicObserved',True) for x in self.report['samples']),
            visualReviewRequired=True,wholeFeaturePassed=False,phonePhysicalDisplay='not_observed_by_capture_API',
            videoSemantics='10: only the screenshot lease interval may hide; 01/11: record lease hides throughout native capture. Frame oracle never replaces lease/time/manual review.')
        self.persist()
    def restore(self):
        self.identity('restore-identity');self.identity_reader.idle_instrumentation()
        data=self.journal.data;errors=[]
        try:self.native_action('cleanup-recorder',self.close_recorder)
        except Exception as e:errors.append('recorder: '+str(e))
        # Recover each exact outstanding ticket separately, never an arbitrary file.
        if not data.get('recordingMayBeActive'):
            for kind,ticket in list(data['captureTickets'].items()):
                try:
                    self.kind=kind
                    if ticket.get('triggerAttempted') is False:
                        # No native input was sent. Directory changes cannot be
                        # evidence of ownership, even if exactly one file appears.
                        observation={'kind':kind,'label':ticket['label'],'triggerAttempted':False,'claimed':False}
                        try:
                            current=self.files();before=set(ticket['before'])
                            observation.update(addedFilesPreserved=sorted(current-before),missingOriginalFiles=sorted(before-current))
                        except Exception as read_error:observation['directoryObservationError']=str(read_error)
                        data.setdefault('untriggeredTicketsCancelled',[]).append(observation)
                        del data['captureTickets'][kind];self.journal.save()
                    else:self.capture_result(ticket['label'],'.mp4' if kind=='record' else '.jpg')
                except Exception as e:errors.append('ticket-'+kind+': '+str(e))
        data['nativeCapturePending']=next(iter(data['captureTickets'].values()),None);self.journal.save()
        # Retain confirmed row identities even if the reused cleanup finds an
        # already absent file; absence of the file alone does not prove row removal.
        evidence=data.setdefault('cleanupMediaIdentities',[])
        for item in data.get('ownedFiles',[]):
            if item not in evidence:evidence.append(dict(item))
        self.journal.save()
        try:super().cleanup()
        except Exception as e:errors.append('native-cleanup: '+str(e))
        try:
            self.journal.restore_config(self.instrument)
            for item in evidence:
                if item.get('mediaUri'):
                    row=self.media_command('content query --uri '+shlex.quote(item['mediaUri'])+' --projection _data').strip()
                    if not re.fullmatch(r'No result found\.?',row,re.I):raise RuntimeError('Owned MediaStore row not confirmed absent; preserve it')
            if data.get('rotationState'):
                self.restore_rotation()
            elif not errors:
                try:
                    observation=self.known_navigation('restore')
                    self.fresh_input('restore-home','input keyevent KEYCODE_HOME',observation)
                    self.observe('restored-main')
                except Exception as sample_error:
                    self.report['restoredScreen']='not_sampled: '+str(sample_error)
            else:self.report['restoredScreen']='not_sampled_due_to_unresolved_cleanup'
            self.identity('restore-final-identity')
            protected=self.protection();atomic(self.folder/'after-protection.json',protected)
            if protected!=data['protectionBefore']:raise RuntimeError('Original resources/names/native preferences differ')
            data['protectionRestored']=True
            self.settled_state('restore-final-leases',0)
            if not self.ar.projection_is_idle(self.ar.shell('dumpsys media_projection')):raise RuntimeError('Projection not confirmed idle after cleanup')
            # Last device read: everything after this is local journal/report I/O.
            if data.get('rotationState'):
                penultimate=self.instrument('snapshot','restore-final-first')['settings']
                if difference(data['baseline'],penultimate):raise RuntimeError('Full497 first terminal read changed')
            final=self.instrument('snapshot','restore-final')['settings'];diff=difference(data['baseline'],final)
            data.update(configurationRestored=not diff,configurationDifferences=diff)
            if diff:raise RuntimeError('Full 497 changed during final observations')
        except Exception as e:errors.append('final: '+str(e))
        data.update(finalChecksPending=False,pending=bool(errors),cleanupErrors=errors);self.journal.save()
        self.report['restoration']={k:data.get(k) for k in ('configurationRestored','configurationDifferences','protectionRestored','nativeRecorderSettingsRestored','nativeRecorderPositionRestored','pending','cleanupErrors')};self.persist()
        if errors:raise RuntimeError('Recovery remains pending: '+'; '.join(errors))

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    mode=parser.add_mutually_exclusive_group(required=True);mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--expected-test-sha',required=True)
    parser.add_argument('--fixture-apk',type=Path,default=ROOT/'out/header-clock-20455/landscape-fixture/safe-audit.apk')
    parser.add_argument('--expected-config-keys',type=Path,help='Reviewed current-schema JSON array; require exactly these configuration keys')
    parser.add_argument('--cases',default='basic',help='basic, rotation, or basic,rotation; recording combinations disabled');args=parser.parse_args()
    cases=args.cases.split(',')
    try:supported_cases(cases)
    except ValueError as e:parser.error(str(e))
    if not re.fullmatch('[a-f0-9]{64}',args.expected_test_sha):parser.error('Exact TestAPK SHA required')
    try:reviewed_keys=expected_config_keys(args.expected_config_keys)
    except (OSError,ValueError) as e:parser.error(str(e))
    import adb_regression as ar
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or m['installedVersion']!=args.expected_version or m['testApkSha256']!=args.expected_test_sha:raise RuntimeError('Restore CLI/journal mismatch')
        folder=journal.path.parent;report=json.loads((folder/'report.json').read_text('utf-8')) if (folder/'report.json').exists() else {'restoredFromJournal':True,'installedVersion':m['installedVersion'],'wholeFeaturePassed':False}
        Collector(ar,folder,journal,report).restore();return
    for p in AUDIT.rglob('restore.json'):
        if json.loads(p.read_text('utf-8')).get('pending'):raise RuntimeError('Restore pending journal first: '+str(p))
    reader=object.__new__(trace.Collector);reader.ar=ar;reader.idle_instrumentation()
    if ar.shell('am get-current-user')!='0':raise RuntimeError('Primary user required')
    if not ar.projection_is_idle(ar.shell('dumpsys media_projection')):raise RuntimeError('Projection is not idle')
    if ar.adb('shell','pidof '+safe.RECORDER,check=False).strip():raise RuntimeError('Native recorder/screenshot process already exists')
    dump=ar.shell('dumpsys package ls.augment.com');v=re.search(r'\bversionCode=(\d+)',dump);name=re.search(r'\bversionName=(\S+)',dump)
    if not v or not name or int(v[1])!=args.expected_version or trace.package_hash(ar,'ls.augment.com.test')!=args.expected_test_sha:raise RuntimeError('Installed main/TestAPK mismatch')
    # Fixture must already be the locally reviewed signed APK with LandscapeActivity.
    fixture_hash=trace.package_hash(ar,safe.PACKAGE)
    if not args.fixture_apk.exists() or sha(args.fixture_apk.read_bytes())!=fixture_hash:raise RuntimeError('Preinstalled owned fixture differs from local APK')
    component=ar.shell('cmd package resolve-activity --brief -n '+safe.PACKAGE+'/.LandscapeActivity')
    if safe.PACKAGE+'/.LandscapeActivity' not in component:raise RuntimeError('Owned landscape component unavailable')
    observer_hash=trace.package_hash(ar,'ls.augment.regression.ui')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME'))
    protection=reader.protection();identity=reader.process_identity(ar.shell('pidof com.android.systemui'))
    rotation_initial=None
    if 'rotation' in cases:
        rotation_initial={'native':{'auto':ar.shell('settings get system accelerometer_rotation').strip(),'user':ar.shell('settings get system user_rotation').strip()},
            'actual':rotation_guard.physical_rotation(ar.shell('dumpsys window'))}
        rotation_guard.initial(rotation_initial['native'],rotation_initial['actual'])
        if protection['native']['system/user_rotation']!='0' or protection['native']['system/accelerometer_rotation']!='0':raise RuntimeError('Rotation baseline changed before journal')
    density=ar.shell('wm density');matches=re.findall(r'(?:Physical|Override) density: (\d+)',density)
    if not matches:raise RuntimeError('Display density unavailable')
    run_id=uuid.uuid4().hex;folder=AUDIT/('capture-closure-%d-%s-%s'%(args.expected_version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S'),run_id[:8]));folder.mkdir(parents=True,exist_ok=False);ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as log:
        with contextlib.redirect_stdout(log):baseline=ar.instrument('snapshot','baseline')
    validate_baseline(baseline,args.expected_version,reviewed_keys)
    journal=Journal(folder/'restore.json',baseline['settings'],dict(serial=ar.SERIAL,installedVersion=args.expected_version,installedVersionName=name[1],runId=run_id,
        mainApkSha256=trace.package_hash(ar,'ls.augment.com'),testApkSha256=args.expected_test_sha,systemuiIdentity=identity,fixtureSha256=fixture_hash,observerSha256=observer_hash,
        protectionBefore=protection,density=int(matches[-1])/160,homeComponent=home,rotationEnabled='rotation' in cases,rotationInitial=rotation_initial))
    report=dict(installedVersion=args.expected_version,cases=cases,runId=run_id,samples=[],wholeFeaturePassed=False,phonePhysicalDisplay='not_observed_by_capture_API')
    c=Collector(ar,folder,journal,report);failure=None
    try:c.run(cases)
    except BaseException as e:failure=e;report['error']=traceback.format_exc();c.persist()
    finally:
        try:c.restore()
        except Exception as e:
            report['restoreError']=str(e);c.persist()
            if failure is None:failure=e
        print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'configurationRestored':journal.data.get('configurationRestored')},ensure_ascii=False))
    if failure:raise failure

if __name__=='__main__':main()
