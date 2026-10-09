"""Opt-in static OEM clear-button observations. No tap, press, notification or native-setting writes.

Imports are offline. Only --run / --restore-only contact a device. Whole-feature
and pixel results remain unverified until an independent original-image review.
"""
from pathlib import Path
import argparse, contextlib, datetime, importlib.util, json, re, shlex, struct, time, traceback, uuid
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('clear_main_base',ROOT/'tools/main_statusbar_device_collector.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
extra=base.extra;atomic=base.atomic;digest=base.digest
P='ls_augment_rm_notification_';EN=P+'clear_appearance_enabled';STACK=P+'stack'
ALIGN=P+'clear_align';X=P+'clear_x';Y=P+'clear_y';LIGHT=P+'clear_color_light';DARK=P+'clear_color_dark'
TRAVEL=P+'clear_entry_travel';DURATION=P+'clear_entry_duration'
KEYS={EN,STACK,ALIGN,X,Y,LIGHT,DARK,TRAVEL,DURATION};ID=extra.ID
FRESH_SECONDS=2.5;MAX_SECONDS=900

def valid_value(k,v):
    if not isinstance(v,str):return False
    if k in (EN,STACK):return v in ('0','1')
    if k in (LIGHT,DARK):return bool(re.fullmatch(r'#[0-9A-Fa-f]{6}(?:[0-9A-Fa-f]{2})?',v))
    limits={ALIGN:(0,3),X:(-120,120),Y:(-24,24),TRAVEL:(0,40),DURATION:(0,600)}
    return k in limits and bool(re.fullmatch(r'0|-?[1-9][0-9]*',v)) and limits[k][0]<=int(v)<=limits[k][1]

def theme_from_config(raw):
    # get-config reports the effective Configuration, unlike an automatic night-mode preference.
    rows=re.findall(r'^config:\s*(\S+)\s*$',raw,re.M)
    if len(rows)!=1:raise extra.Inconclusive('Effective native Configuration unavailable')
    parts=rows[0].split('-');modes=set(parts)&{'night','notnight'}
    if len(modes)!=1:raise extra.Inconclusive('Effective light/dark state is ambiguous')
    return 'dark' if 'night' in modes else 'light'

def phases(theme):
    color=DARK if theme=='dark' else LIGHT
    return [('clear-off',{EN:'0',STACK:'0'}),
            ('colored-native-position',{EN:'1',ALIGN:'0',X:'0',Y:'0',color:'#BFE0FF',TRAVEL:'0',DURATION:'0'}),
            ('align-left',{ALIGN:'1'}),('align-center',{ALIGN:'2'}),('align-right',{ALIGN:'3'}),
            ('right-small-offset',{X:'-8',Y:'-8'}),('clear-off-again',{EN:'0'})]

def notification_records(raw):
    if re.search(r'Permission Denial|DUMP TIMEOUT|DeadObjectException|Unknown command',raw,re.I):raise extra.Inconclusive('Notification dump failed')
    markers=list(re.finditer(r'^  Notification List:\s*$',raw,re.M))
    if len(markers)!=1:raise extra.Inconclusive('Native active notification section missing/ambiguous')
    section=raw[markers[0].end():];end=re.search(r'^  \S',section,re.M)
    if not end:raise extra.Inconclusive('Notification dump lacks section terminator; no empty-list inference')
    records=[]
    for line in section[:end.start()].splitlines():
        if 'NotificationRecord' not in line:continue
        match=re.search(r'NotificationRecord\([^\n]*?pkg=(\S+) user=(\S+) id=(-?\d+) tag=(\S+) .*?key=(\S+)',line)
        if not match:raise extra.Inconclusive('Unrecognized active notification identity')
        records.append(list(match.groups()))
    if len({r[-1] for r in records})!=len(records):raise extra.Inconclusive('Duplicate active notification identity')
    return sorted(records)

def main_apk_hash(ar):
    paths=ar.shell('pm path ls.augment.com').splitlines()
    if len(paths)!=1 or not paths[0].startswith('package:'):raise extra.Inconclusive('Main APK path ambiguous')
    path=paths[0][8:];raw=ar.shell('sha256sum '+shlex.quote(path),root=True)
    match=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',raw)
    if not match or match[2]!=path:raise extra.Inconclusive('Main APK identity unavailable')
    return match[1]

def proc_start(raw,pid):
    match=re.fullmatch(r'(\d+) \((.*)\) (.+)',raw.strip())
    if not match or match[1]!=str(pid):raise extra.Inconclusive('SystemUI native stat identity mismatch')
    fields=match[3].split()
    if len(fields)<20 or not re.fullmatch(r'[1-9][0-9]*',fields[19]):raise extra.Inconclusive('SystemUI native start ticks unavailable')
    return int(fields[19])

class Journal(extra.Journal):
    kind='safe-notification-clear-static';mutable_keys=KEYS
    def __init__(self,path,baseline=None,metadata=None,resources=None,names=None):
        self.path=Path(path)
        self.data=json.loads(self.path.read_text('utf-8')) if baseline is None else {
            'kind':self.kind,'schema':1,'pending':True,'baseline':baseline,'metadata':metadata,
            'resourcesBefore':resources,'namesBefore':names,'restore':{},'allowed':{},'expected':{},'inflight':{},'history':[],
            'actualChangedKeys':[],'configurationRestored':False,'restoredPixels':'not-attempted'}
        self.validate()
        if baseline is not None:self.save()
    def allowed_keys(self):return KEYS-{LIGHT if self.data['metadata']['theme']=='dark' else DARK}
    def validate(self):
        d=self.data;m=d.get('metadata',{})
        if d.get('kind')!=self.kind or d.get('schema')!=1:raise ValueError('Foreign journal')
        if not isinstance(d.get('baseline'),dict) or len(d['baseline'])!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in d['baseline'].items()):raise ValueError('Complete497 baseline required')
        if not KEYS<=d['baseline'].keys() or not all(valid_value(k,d['baseline'][k]) for k in KEYS):raise ValueError('Unregistered or invalid current clear/stack values')
        if m.get('theme') not in ('light','dark') or not isinstance(m.get('nativeBaseline'),dict) or not isinstance(m.get('notificationsBefore'),list):raise ValueError('Missing original environment')
        if not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict):raise ValueError('Missing resource protection')
        for f in ('restore','allowed','expected','inflight'):
            if not isinstance(d.get(f),dict) or not set(d[f])<=self.allowed_keys():raise ValueError('Foreign recovery key/theme')
        if any(not set(d[f])<=set(d['restore']) for f in ('allowed','expected','inflight')):raise ValueError('Ownership lacks original restore value')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()):raise ValueError('Original baseline was altered')
        if any(not valid_value(k,v) for k,v in d['expected'].items()):raise ValueError('Invalid confirmed own value')
        if any(not isinstance(v,list) or not v or not all(valid_value(k,x) for x in v) for f in ('allowed','inflight') for k,v in d[f].items()):raise ValueError('Invalid own-value history')
    def valid_values(self,values):return bool(values) and set(values)<=self.allowed_keys() and all(valid_value(k,v) for k,v in values.items())
    def owned_value(self,key,current):
        # Historical allowed[] values are audit history, never present ownership.
        confirmed=self.data['expected'].get(key,self.data['baseline'][key])
        return current in {confirmed,*self.data['inflight'].get(key,[])}
    def plan_restore(self,changes,current):
        if not set(changes)<=set(self.data['restore']):raise ValueError('Unjournaled restoration key')
        for k,v in changes.items():
            if v!=self.data['baseline'][k] or not self.owned_value(k,current.get(k)):raise ValueError('Recovery no longer owns this value')
        for k,v in changes.items():self.data['inflight'][k]=[current[k],v]
        self.data['history'].append({'restoreAttempt':changes,'at':datetime.datetime.now().isoformat()});self.data['pending']=True;self.save()

def overlap(a,b):return a[0]<b[2] and a[2]>b[0] and a[1]<b[3] and a[3]>b[1]
def inside(a,b):return b[0]<=a[0]<a[2]<=b[2] and b[1]<=a[1]<a[3]<=b[3]
def nodes(w):return [n for n,_ in extra.walk(w.get('root',{})) if n.get('visible')]
def focus_packages(native):
    values=re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu\d+\s+([^\s}]+)\s*\}',native)
    if len(values)!=1:return set()
    value=values[0]
    # Exact NX809J native title recorded in 070632. Still requires the real
    # uniquely focused type3 notification tree below; no arbitrary title alias.
    if value=='NotificationShade':return {'com.android.systemui'}
    return {value.split('/')[0]} if re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+',value) else set()

def surface(windows,native,size,home):
    width,height=size
    if not 0<width<height:raise extra.Inconclusive('Current portrait required; no rotation change')
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1:raise extra.Inconclusive('No unique actual focused window')
    owner=focused[0];package=owner.get('root',{}).get('package');ns=nodes(owner)
    if focus_packages(native)!={package}:raise extra.Inconclusive('Native and accessibility focus disagree')
    if tuple(extra.rectangle(owner))!=(0,0,width,height) or tuple(extra.rectangle(owner['root']))!=(0,0,width,height):raise extra.Inconclusive('Focused window/root does not exactly match the original PNG size')
    if package==home and owner.get('type')==1:
        if any(n.get('id') in (ID+'notification_panel',ID+'control_panel') for w in windows for n in nodes(w)):raise extra.Inconclusive('Panel has not disappeared')
        return 'home',owner
    if package=='com.android.systemui' and owner.get('type')==3:
        ids=[n.get('id') for n in ns]
        if ids.count(ID+'notification_panel')!=1 or ids.count(ID+'notification_stack_scroller')!=1 or ID+'control_panel' in ids:raise extra.Inconclusive('Exact native notification shade not observed')
        return 'notification',owner
    raise extra.Inconclusive('Unknown foreground; no input')

def unobstructed(windows,owner,area,home,allow_statusbar=False):
    for w in windows:
        if w is owner or not w.get('root',{}).get('visible'):continue
        r=extra.rectangle(w['root'])
        if not overlap(r,area):continue
        ns=nodes(w);pkg=w['root'].get('package')
        # The native full-screen shade is above the verified inactive HOME background.
        if pkg==home and w.get('type')==1 and not w.get('active') and not w.get('focused'):continue
        if allow_statusbar and pkg=='com.android.systemui' and w.get('type')==3 and any(n.get('id')==ID+'status_bar' for n in ns) and r[3]<=min(300,area[3]):continue
        raise extra.Inconclusive('Visible window obstructs the observed action/target region')

def opening_path(windows,native,size,home):
    kind,owner=surface(windows,native,size,home)
    if kind!='home':raise extra.Inconclusive('Pull-down requires proven HOME')
    width,height=size;x=round(width*.15);end=round(height*.66)
    bars=[n for w in windows if w.get('root',{}).get('package')=='com.android.systemui' for n in nodes(w) if n.get('id')==ID+'status_bar']
    if len(bars)!=1 or not inside((x,5,x+1,6),extra.rectangle(bars[0])):raise extra.Inconclusive('Native status-bar swipe origin unavailable')
    unobstructed(windows,owner,(x-2,5,x+3,end+1),home,True)
    return [x,5,x,end,650]

def clear_geometry(windows,native,size,home):
    kind,owner=surface(windows,native,size,home)
    if kind!='notification':raise extra.Inconclusive('Notification panel required')
    ns=nodes(owner);buttons=[n for n in ns if n.get('id')==ID+'iv_dismiss_notification_view']
    if len(buttons)!=1 or buttons[0].get('class')!='android.widget.ImageButton' or not all(buttons[0].get(k) for k in ('enabled','clickable')):raise extra.Inconclusive('Unique native OEM clear button is not observable')
    button=buttons[0];rect=extra.rectangle(button)
    if not inside(rect,(0,0,*size)):raise extra.Inconclusive('OEM clear button is clipped/off-screen')
    unobstructed(windows,owner,rect,home)
    ids={'iv_dismiss_notification_view','cc_header','clock','date','notification_stack_scroller','manage_text','dismiss_text','notification_footer','footer','status_icons_group'}
    geometry=[{k:n.get(k) for k in ('id','class','text','description','bounds','visible','enabled','clickable','longClickable')} for n in ns if str(n.get('id','')).removeprefix(ID) in ids]
    return {'button':{k:button.get(k) for k in ('id','class','bounds','description','enabled','clickable','longClickable')},'geometry':geometry}

class Collector(base.Collector):
    def artifact_identity(self):
        m=self.journal.data['metadata']
        if main_apk_hash(self.ar)!=m['mainApkSha256'] or base.test_apk_hash(self.ar)!=m['testApkSha256']:raise extra.Inconclusive('Main/Test APK identity changed')
    def identity(self,label):
        self.artifact_identity();m=self.journal.data['metadata']
        super().identity(label)
        runtime=json.loads((self.folder/(label+'-runtime.json')).read_text('utf-8'));pid=runtime['pid'];record=runtime['records'][0]
        boot=self.ar.shell('settings get global boot_count')
        if not re.fullmatch(r'\d+',boot) or str(record.get('receivedBoot'))!=boot:raise extra.Inconclusive('Runtime boot changed')
        start=proc_start(self.ar.shell('cat /proc/'+pid+'/stat',root=True),pid)
        current={'pid':pid,'boot':boot,'startTicks':start,'moduleLoadedAt':record.get('moduleLoadedAt'),'processStartedElapsed':record.get('processStartedElapsed')}
        if not all(isinstance(current[k],int) and current[k]>0 for k in ('moduleLoadedAt','processStartedElapsed')):raise extra.Inconclusive('Loaded process start evidence missing')
        if self.ar.adb('shell','pidof com.android.systemui',check=False).decode().strip()!=pid:raise extra.Inconclusive('Process changed while sampling identity')
        previous=self.journal.data.get('systemuiIdentity')
        atomic(self.folder/(label+'-identity.json'),dict(current,mainApkSha256=m['mainApkSha256'],testApkSha256=m['testApkSha256']))
        if previous is not None and previous!=current:raise extra.Inconclusive('SystemUI process generation changed')
        self.journal.data['systemuiIdentity']=current;self.journal.save()
    def hit(self,*a,**k):raise ValueError('No clear collector taps')
    def tap(self,*a,**k):raise ValueError('No clear collector taps')
    def click_observed(self,*a,**k):raise ValueError('No clear collector clicks')
    def native(self):return dict(super().native(),**{'system/screen_off_timeout':self.ar.shell('settings get system screen_off_timeout'),'nightPreference':self.ar.shell('cmd uimode night'),'effectiveTheme':theme_from_config(self.ar.shell('cmd activity get-config')),'density':self.ar.shell('wm density')})
    def bounded(self):
        if time.monotonic()>self.deadline:raise extra.Inconclusive('Static case time budget exhausted; no more gestures/saves')
    def awake(self):
        if not re.search(r'\bmWakefulness=Awake\b',self.ar.shell('dumpsys power')):raise extra.Inconclusive('Phone must already be awake; no wake/unlock command')
    def observe_all(self,label):return self._observation(label,'static-evidence')
    def observe_input(self,label):return self._observation(label,'input-prerequisite')
    def _observation(self,label,purpose):
        self.awake();folder=self.folder/label;folder.mkdir(exist_ok=True);intervals={};error=None;windows=None;native='';size=None;png=None
        start=time.monotonic();fresh=None
        try:
            png_start=time.monotonic();png=self.ar.adb('exec-out','screencap','-p');png_end=time.monotonic()
            intervals['png']={'start':png_start,'end':png_end};(folder/'screen.png').write_bytes(png)
            if png[:8]!=b'\x89PNG\r\n\x1a\n' or len(png)<24:raise extra.Inconclusive('Original PNG unavailable')
            size=struct.unpack('>II',png[16:24])
            # The original PNG is deliberately BEFORE the fresh input observation.
            # It supplies real display dimensions, not proof of the later UI state.
            fresh=time.monotonic();intervals['tree']={'start':fresh,'end':None}
            try:windows=self.ui.all_windows(label)
            finally:intervals['tree']['end']=time.monotonic()
            native_start=time.monotonic();intervals['nativeFocus']={'start':native_start,'end':None}
            try:native=self.ar.shell('dumpsys activity activities')
            finally:intervals['nativeFocus']['end']=time.monotonic()
            (folder/'activity-private.txt').write_text(native,encoding='utf-8')
        except Exception:error=traceback.format_exc()
        finally:
            completed=time.monotonic()
            atomic(folder/'observation.json',{'purpose':purpose,'requestedMonotonic':start,'completedMonotonic':completed,'intervals':intervals,
                'freshRequestedMonotonic':fresh,'freshAgeMs':None if fresh is None else round((completed-fresh)*1000),'size':size,'sha256':None if png is None else digest(png),'observerError':error,
                'imageRelation':'Original PNG precedes fresh tree/native focus; not same-instant evidence. Input coordinates require exact current window and root agreement with its dimensions.'})
        if error:raise extra.Inconclusive('Observation failed; any original PNG and separate intervals preserved')
        self.interaction_observation=(windows,native,fresh)
        return windows,native,size
    def protected(self,label):
        d=self.journal.data;diff={'resources':base.difference(d['resourcesBefore'],self.resources()),'names':base.difference(d['namesBefore'],self.names()),'native':base.difference(d['metadata']['nativeBaseline'],self.native())}
        atomic(self.folder/(label+'-protection.json'),diff)
        if any(diff.values()):raise extra.Inconclusive('Protected resources/names/native profile changed; preserve external state')
        return diff
    def notifications(self,label):
        raw=self.ar.shell('dumpsys notification',timeout=40);(self.folder/(label+'-notification-private.txt')).write_text(raw,encoding='utf-8')
        values=notification_records(raw);atomic(self.folder/(label+'-notification-identities-private.json'),values)
        same=values==self.journal.data['metadata']['notificationsBefore']
        self.report.setdefault('notificationObservations',[]).append({'label':label,'count':len(values),'sameOriginalIdentities':same,'identitySha256':digest(json.dumps(values,sort_keys=True).encode())});self.persist()
        return same
    def before(self,label,values):
        self.bounded();self.protected(label)
        if not self.notifications(label+'-before'):raise extra.Inconclusive('Original notifications changed; no further configuration writes')
        super().before(label,values)
    def acknowledge(self,label,values):
        super().acknowledge(label,values);self.journal.data['actualChangedKeys']=sorted(set(self.journal.data['actualChangedKeys'])|{k for k,v in values.items() if v!=self.journal.data['baseline'][k]});self.journal.save()
    def fresh_action(self,label,command):
        self.bounded();age=time.monotonic()-self.interaction_observation[2]
        if not 0<=age<=FRESH_SECONDS:raise extra.Inconclusive('Fresh window expired; no gesture')
        if command!='cmd statusbar collapse' and not re.fullmatch(r'input swipe \d+ 5 \d+ \d+ 650',command):raise ValueError('Forbidden action; clear tap/press are never permitted')
        atomic(self.folder/(label+'-action.json'),{'command':command,'windowAgeMs':round(age*1000),'clearButtonAction':False})
        self.ar.shell(command)
    def open_panel(self,label):
        self.bounded();home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        windows,native,size=self.observe_input(label+'-before-open');kind,owner=surface(windows,native,size,home)
        if kind=='notification':
            unobstructed(windows,owner,(0,0,*size),home);self.fresh_action(label+'-collapse','cmd statusbar collapse');time.sleep(.45)
        else:opening_path(windows,native,size,home)
        # Always obtain a new home observation, proving native hide before the sole pull-down.
        windows,native,size=self.observe_input(label+'-hidden-home');path=opening_path(windows,native,size,home)
        self.fresh_action(label+'-open','input swipe %d %d %d %d %d'%tuple(path));time.sleep(.8)
    def diagnostic(self,label):
        for attempt in range(4):
            raw=self.ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
            try:tree=ET.fromstring(raw);break
            except ET.ParseError:
                if attempt==3:raise
                time.sleep(.15)
        (self.folder/(label+'-diagnostic-private.xml')).write_text(raw,encoding='utf-8')
        return {n.get('name'):n.text for n in tree if any(s in n.get('name','') for s in ('notification_clear','notification_viewport','notification_stack','header_clock_runtime'))}
    def capture(self,label,reopen=True):
        if reopen:self.open_panel(label)
        home=self.journal.data['metadata']['homeComponent'].split('/')[0];samples=[]
        for i in range(2):
            self.bounded();evidence=label+'-sample-'+str(i);windows,native,size=self.observe_all(evidence)
            if not 0<=time.monotonic()-self.interaction_observation[2]<=FRESH_SECONDS:raise extra.Inconclusive('Static observation exceeded fresh-tree window; original PNG retained')
            geometry=clear_geometry(windows,native,size,home);samples.append(dict(evidence=evidence,size=size,**geometry));time.sleep(.35)
        row={'label':label,'samples':samples,'sameButtonBounds':samples[0]['button']['bounds']==samples[1]['button']['bounds'],'diagnostics':self.diagnostic(label),'diagnosticLimit':'Read-only telemetry may be unchanged/latched; active is not a pixel result','expectedValues':dict(self.journal.data['expected']),'pixelReviewRequired':True,'visualPass':False}
        self.report['cases'].append(row);self.persist()
        if not row['sameButtonBounds']:raise extra.Inconclusive('Static button did not settle; no visual pass')
        if not self.notifications(label+'-after'):raise extra.Inconclusive('Notification identities changed; no further phases')
        return row
    def exercise(self):
        self.deadline=time.monotonic()+MAX_SECONDS
        # Prerequisite is observed before any write. No invented notification or hidden-control action.
        self.identity('preflight');self.capture('original-prerequisite')
        for label,values in phases(self.journal.data['metadata']['theme']):
            self.set(label,values);self.capture(label)
        self.report['status']='collected-pixel-review-required';self.persist()
    def restore(self):
        d=self.journal.data;self.journal.validate();d.update(pending=True,configurationRestored=False);self.journal.save();errors=[]
        try:
            self.artifact_identity()
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for k,v in d['restore'].items():
                if self.journal.owned_value(k,current.get(k)):
                    changes[k]=v
                    if current.get(k)!=v:d['actualChangedKeys']=sorted(set(d['actualChangedKeys'])|{k})
                else:external[k]=current.get(k)
            self.journal.save()
            if changes:
                self.journal.plan_restore(changes,current)
                self.instrument('set','recovery-set',changes)
            reads=[]
            for i in range(2):time.sleep(.5);reads.append(self.instrument('snapshot','recovery-readback-'+str(i))['settings'])
            differences=[base.difference(d['baseline'],r) for r in reads]
            d.update(configurationRestored=not any(differences),configurationDifferences=differences,externalValuesPreserved=external)
            if any(differences) or external:raise extra.Inconclusive('External/unsettled configuration preserved')
            d['expected']=dict(d['restore']);d['inflight']={};self.journal.save()
            # Restore observation never manipulates a window: capture whatever is currently present.
            label='restored-observation-'+str(d.get('restoreAttempts',0));d['restoreAttempts']=d.get('restoreAttempts',0)+1
            try:
                windows,native,size=self.observe_all(label);geometry=clear_geometry(windows,native,size,d['metadata']['homeComponent'].split('/')[0])
                atomic(self.folder/label/'geometry.json',geometry);d['restoredPixels']='collected-review-required'
            except Exception:d['restoredPixels']='not-observed';d['restoredPixelError']=traceback.format_exc()
            # All potentially slow protection/identity evidence precedes the terminal full497 read.
            protection_error=None
            try:self.protected('recovery-final');self.identity('recovery-final')
            except Exception:protection_error=traceback.format_exc()
            notification_error=None
            try:d['notificationsUnchanged']=self.notifications('recovery-final')
            except Exception:notification_error=traceback.format_exc();d['notificationsUnchanged']=False
            final=self.instrument('snapshot','recovery-terminal')['settings'];diff=base.difference(d['baseline'],final)
            d.update(configurationRestored=not diff,terminalConfigurationDifference=diff,protectionError=protection_error,notificationError=notification_error)
            if diff or protection_error:raise extra.Inconclusive('Terminal configuration/protection check failed')
            # External notification churn is not something this collector may undo.
            d['pending']=False
            if notification_error or not d['notificationsUnchanged']:self.report.update(status='inconclusive-notification-environment',notificationProtectionStatus='changed-or-unobservable-no-notification-writes')
        except BaseException:errors.append(traceback.format_exc())
        finally:
            d['recoveryErrors']=errors;self.journal.save();self.report.update(configurationRestored=d.get('configurationRestored',False),restorePending=d['pending'],restoredPixels=d['restoredPixels'],cleanupErrors=errors,notificationsUnchanged=d.get('notificationsUnchanged'),actualChangedKeys=d['actualChangedKeys'],attemptedKeys=sorted(d['restore']),wholeFeaturePassed=False,visualPass=False,clearButtonActions=0,nativeSettingsNeverWritten=True,notificationsNeverMutated=True);self.persist()
        if errors:raise extra.Inconclusive('Recovery pending; external values preserved, inspect exact journal')

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk');args=parser.parse_args()
    import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version:raise extra.Inconclusive('Installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name) or base.test_apk_hash(ar)!=m['testApkSha256'] or main_apk_hash(ar)!=m['mainApkSha256']:raise extra.Inconclusive('Recovery device/APK identity changed')
        path=journal.path.parent/'report.json';report=json.loads(path.read_text('utf-8')) if path.exists() else {'cases':[],'status':'reconstructed-for-recovery'}
        Collector(ar,journal.path.parent,journal,report).restore();return
    testhash=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=testhash:raise extra.Inconclusive('Installed TestAPK differs from local reviewed APK')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    if home.split('/')[0]!='com.zte.mifavor.launcher':raise extra.Inconclusive('Unreviewed HOME; no foreground substitution')
    folder=extra.safe.AUDIT/('notification-clear-static-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as stream,contextlib.redirect_stdout(stream):saved=ar.instrument('snapshot','baseline')
    if saved.get('moduleVersion')!=code or saved.get('status')!='pass':raise extra.Inconclusive('Baseline TestAPK/build/status mismatch')
    settings=saved['settings']
    if len(settings)!=497 or settings.get('ls_augment_systemui_master')!='1':raise extra.Inconclusive('Complete497 and already-enabled SystemUI required')
    reader=Collector.__new__(Collector);reader.ar=ar;reader.awake();resources,names,native=reader.resources(),reader.names(),reader.native()
    raw=ar.shell('dumpsys notification',timeout=40);(folder/'original-notification-private.txt').write_text(raw,encoding='utf-8');notices=notification_records(raw)
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'homeComponent':home,'nativeBaseline':native,'theme':native['effectiveTheme'],'notificationsBefore':notices,'mainApkSha256':main_apk_hash(ar),'testApkSha256':testhash,'collectorSha256':digest(Path(__file__).read_bytes()),'runId':uuid.uuid4().hex}
    journal=Journal(folder/'restore.json',settings,metadata,resources,names)
    report={'installedVersion':code,'cases':[],'status':'prepared','allowedMutableKeys':sorted(journal.allowed_keys()),'initialValues':{k:settings[k] for k in sorted(KEYS)},'theme':metadata['theme'],'wholeFeaturePassed':False,'visualPass':False,'clearButtonActions':0,'limits':['Static current portrait/theme/font only','No clear tap/press/longpress or fixture','Color/position need original PNG review','Native hide/show is observed each phase; active telemetry is not proof']}
    collector=Collector(ar,folder,journal,report)
    try:collector.persist();collector.exercise()
    except BaseException:report.update(status='inconclusive',error=traceback.format_exc());raise
    finally:
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending'],'visualPass':False},ensure_ascii=False))

if __name__=='__main__':main()
