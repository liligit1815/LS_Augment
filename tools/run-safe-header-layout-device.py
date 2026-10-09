"""Opt-in, single-surface clock layout capture with write-ahead restoration.
No device calls on import. PNGs/tree/metadata are evidence, never a pixel pass oracle.
"""
from pathlib import Path
import argparse,contextlib,datetime,importlib.util,json,math,re,struct,time,traceback
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('safe_header_base',ROOT/'tools/run-safe-native-function-device.py')
safe=importlib.util.module_from_spec(spec);spec.loader.exec_module(safe)
P='ls_augment_rm_qs_';N='ls_augment_rm_notification_clock_';ID='com.android.systemui:id/'
WEATHER='ls_augment_rm_notification_weather'
NATIVE_KEYS=('accelerometer_rotation','user_rotation','font_scale')
PERIODS=('凌晨','早上','上午','中午','下午','傍晚','晚上')
class PanelUnavailable(RuntimeError):pass

def pending_runs(root,exclude=None):
    return [p for p in root.rglob('restore.json') if (exclude is None or p.resolve()!=exclude.resolve())
            and json.loads(p.read_text(encoding='utf-8')).get('pending')]

def normalize_clock(value):return str(value).replace('\n:',':').replace('\n',' ')
def rect(node):
    value=list(map(int,re.findall(r'-?\d+',node.get('bounds',''))))
    if len(value)!=4:raise ValueError('Missing real node bounds')
    return value
def flatten(node):
    yield node
    for child in node.get('children',[]):yield from flatten(child)
def select_header(windows,surface,allow_missing_clock=False):
    nodes=[n for w in windows for n in flatten(w['root']) if n.get('visible')]
    name='control_panel' if surface=='control' else 'notification_panel'
    panels=[n for n in nodes if n.get('id')==ID+name]
    if len(panels)!=1:raise RuntimeError('Expected one native '+surface+' panel')
    inside=list(flatten(panels[0]));headers=[n for n in inside if n.get('visible') and n.get('id')==ID+'cc_header']
    if len(headers)!=1:raise RuntimeError('Expected one native header inside chosen surface')
    if surface=='notification' and not any(n.get('visible') and n.get('id')==ID+'notification_stack_scroller' for n in inside):raise RuntimeError('Notification stack missing')
    clocks=[n for n in flatten(headers[0]) if n.get('visible') and n.get('id')==ID+'clock']
    if not clocks and allow_missing_clock:return panels[0],headers[0],None
    if len(clocks)!=1:raise RuntimeError('Expected one native mClockView node')
    return panels[0],headers[0],clocks[0]
def font_px(node):
    raw=(node.get('renderingInfo') or {}).get('textSizePx')
    return float(raw) if isinstance(raw,(int,float)) and math.isfinite(raw) and raw>0 else None

def landscape_notification_switch(windows):
    focused=[w for w in windows if w.get('active') and w.get('focused') and w.get('root',{}).get('package')=='com.android.systemui']
    if len(focused)!=1:raise PanelUnavailable('Control center is not uniquely focused before switching')
    try:panel,header,_=select_header(focused,'control',allow_missing_clock=True)
    except RuntimeError as error:raise PanelUnavailable('Control panel header is not yet observable: '+str(error)) from error
    p,h=rect(panel),rect(header)
    if p[2]-p[0]<=p[3]-p[1]:raise PanelUnavailable('Switch prerequisite is not landscape')
    controls=[rect(n) for n in flatten(panel) if n is not panel and n.get('visible') and (n.get('clickable') or n.get('longClickable'))]
    below=[b[1] for b in controls if b[1]>=h[3] and b[3]>b[1]]
    if not below or min(below)-h[3]<16:raise PanelUnavailable('No proven empty horizontal band below native header')
    y=(h[3]+min(below))//2;start=round(p[0]+(p[2]-p[0])*.2);end=round(p[0]+(p[2]-p[0])*.8)
    if any(b[1]<=y<b[3] and b[0]<end and b[2]>start for b in controls):raise PanelUnavailable('Native control intersects proposed switch band')
    return [start,y,end,y]

def notification_scroll_path(windows,density,direction):
    visible=[n for w in windows if w.get('active') and w.get('focused') and w.get('root',{}).get('package')=='com.android.systemui'
             for n in flatten(w['root']) if n.get('visible')]
    stacks=[n for n in visible if n.get('id')==ID+'notification_stack_scroller']
    if len(stacks)!=1:raise PanelUnavailable('Native notification stack is not uniquely focused')
    stack=rect(stacks[0]);gap=round(8*density)
    top=max([stack[1]]+[rect(n)[3] for n in visible if n.get('id')==ID+'cc_header'])+gap
    bottom=min([stack[3]]+[rect(n)[1]-gap for n in visible if n.get('id')==ID+'iv_dismiss_notification_view'])-gap
    choices=[]
    for n in flatten(stacks[0]):
        if not n.get('visible') or n.get('id')!=ID+'expandableNotificationRow':continue
        l,t,r,b=rect(n);l=max(l,stack[0]+gap);r=min(r,stack[2]-gap);t=max(t,top);b=min(b,bottom)
        if r-l<120 or b-t<80:continue
        x,y=(l+r)//2,(t+b)//2;travel=min(360,y-top if direction=='up' else bottom-y)
        controls=[rect(c) for c in flatten(n) if c is not n and c.get('visible')
                  and (c.get('clickable') or c.get('longClickable') or c.get('scrollable') or c.get('editable'))]
        if any(c[0]<=x<c[2] and c[1]<=y<c[3] for c in controls):continue
        if travel>=100:choices.append((travel,x,y))
    if not choices:raise PanelUnavailable('No observed notification row permits a safe vertical scroll')
    travel,x,y=max(choices);return [x,y,x,y-travel if direction=='up' else y+travel]
def layout_state(diagnostic,expected_active):
    if 'native;insufficient-space' in diagnostic:return 'native_fallback_insufficient_space'
    if ';clock;mode=' in diagnostic:return 'custom_layout_reported'
    if ';native' in diagnostic:return 'native_reported' if not expected_active else 'native_unexpected_or_stale'
    return 'diagnostic_unavailable'
def evaluate_text(clock,seconds,period,fallback):
    text=normalize_clock(clock.get('text',''));description=normalize_clock(clock.get('description',''))
    if fallback:return {'state':'native_fallback','normalizedText':text,'description':description,'assertedCustomFormat':False}
    if seconds and not re.search(r'\d{1,2}:\d{2}:\d{2}',text):raise AssertionError('Requested seconds absent outside explicit native fallback')
    if not seconds and re.search(r'\d{1,2}:\d{2}:\d{2}',text):raise AssertionError('Seconds remain after disabling')
    count=sum(text.count(p) for p in PERIODS)
    if period and count!=1:raise AssertionError('Expected one Chinese period')
    if not period and count:raise AssertionError('Chinese period remains after disabling')
    if (seconds or period) and description!=text:raise AssertionError('Formatted accessible description is incomplete')
    return {'state':'format_observed','normalizedText':text,'description':description,'assertedCustomFormat':True}

class NativeJournal:
    def __init__(self,journal,ar):self.journal,self.ar=journal,ar
    def read(self,key):
        if key not in NATIVE_KEYS:raise ValueError('Unsupported native setting')
        value=self.ar.shell('settings --user 0 get system '+key).strip()
        if value!='null' and not re.fullmatch(r'-?\d+(?:\.\d+)?',value):raise RuntimeError('Native setting is not a safe numeric value: '+key)
        return None if value=='null' else value
    def write(self,key,value):
        if key not in NATIVE_KEYS or not re.fullmatch(r'\d+(?:\.\d+)?',str(value)):raise ValueError('Invalid native profile write')
        data=self.journal.data;original=data.setdefault('nativeOriginal',{})
        if key not in original:original[key]=self.read(key)
        data.setdefault('nativeWritten',{})[key]=str(value);data['pending']=True;self.journal.save()
        self.ar.shell('settings --user 0 put system '+key+' '+str(value))
        if self.read(key)!=str(value):raise RuntimeError('Native profile write readback differs: '+key)
    def restore(self):
        errors=[]
        for key,original in reversed(list(self.journal.data.get('nativeOriginal',{}).items())):
            try:
                if key not in NATIVE_KEYS or original is not None and not re.fullmatch(r'-?\d+(?:\.\d+)?',original):raise ValueError('Invalid native recovery record')
                command='settings --user 0 '+('delete system '+key if original is None else 'put system '+key+' '+original)
                self.ar.shell(command)
                if self.read(key)!=original:raise RuntimeError('readback differs')
            except Exception as error:errors.append(key+': '+str(error))
        self.journal.data['nativeProfileRestored']=not errors;self.journal.data['nativeProfileRestoreErrors']=errors;self.journal.save()
        if errors:raise RuntimeError('; '.join(errors))

class HeaderRunner(safe.Runner):
    def profile(self):
        raw={key:NativeJournal(self.journal,self.ar).read(key) for key in NATIVE_KEYS}
        return {'settings':raw,'wmDensity':self.ar.shell('wm density'),'wmSize':self.ar.shell('wm size'),
                'nightMode':self.ar.shell('cmd uimode night'),'inputDisplay':self.ar.shell('dumpsys input'),
                'systemUiPid':self.ar.shell('pidof com.android.systemui').strip(),'deviceTime':self.ar.shell('date +%Y-%m-%dT%H:%M:%S%z').strip()}
    def cleanup(self):
        # No media/recorder operations. Landscape can own a minimal backdrop.
        # Keep one pending flag through BOTH module and native restoration.
        errors=[]
        try:
            if self.journal.data.get('fixtureInstallAttempted'):
                safe.Runner.cleanup(self)
            else:self.journal.restore_config(self.instrument)
        except Exception as error:errors.append('configuration: '+str(error))
        try:NativeJournal(self.journal,self.ar).restore()
        except Exception as error:errors.append('native-profile: '+str(error))
        try:
            baseline=self.journal.data.get('nativeProfileBaseline',{})
            current={key:NativeJournal(self.journal,self.ar).read(key) for key in NATIVE_KEYS}
            drift={k:{'expected':v,'actual':current[k]} for k,v in baseline.items() if current[k]!=v}
            self.journal.data['nativeProfileDifferences']=drift
            if drift:errors.append('native profile differs after restoration')
        except Exception as error:errors.append('native-readback: '+str(error))
        self.journal.data.update(pending=bool(errors),cleanupErrors=errors);self.journal.save()
        self.report['cleanup']={k:self.journal.data.get(k) for k in ('configurationRestored','configurationDifferences','nativeProfileRestored','nativeProfileDifferences','pending','cleanupErrors')};self.persist()
        if errors:raise RuntimeError('Restoration incomplete: '+'; '.join(errors))
    def diagnostics(self):
        for attempt in range(6):
            raw=self.ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
            try:
                parsed=ET.fromstring(raw)
                return {n.get('name'):n.text for n in parsed if n.get('name','').startswith(('ls_augment_header_clock_runtime_','ls_augment_rm_qs_clock_','ls_augment_notification_clock_runtime','ls_augment_notification_viewport_runtime','ls_augment_statusbar_header_spacing_'))}
            except ET.ParseError:
                if attempt==5:raise
                time.sleep(.2)
    def open_panel(self,surface,wide=False):
        self.ar.shell('input keyevent KEYCODE_WAKEUP');self.ar.shell('wm dismiss-keyguard');self.ar.shell('input keyevent KEYCODE_HOME')
        self.ar.shell('cmd statusbar collapse');time.sleep(.4)
        if wide:
            # Home and UiAutomation restore this ROM's global rotation. The
            # owned fixture explicitly requests landscape, without user content.
            self.ar.shell('am start -W -n '+safe.PACKAGE+'/.LandscapeActivity')
            time.sleep(.5)
        png=self.ar.adb('exec-out','screencap','-p')
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Native display dimensions unavailable')
        w,h=struct.unpack('>II',png[16:24]);x=round(w*(.85 if surface=='control' else .15))
        if (w>h)!=wide:raise PanelUnavailable('Background did not reach requested orientation; no panel swipe attempted')
        if wide:
            self.ar.shell('cmd statusbar expand-settings')
        else:self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(h*.65)))
        time.sleep(.7)
        if wide and surface=='notification':
            previous=None;path=None
            for attempt in range(4):
                label='landscape-switch-source-%d-%d'%(len(self.report['cases']),attempt)
                windows=self.ui.all_windows(label)
                (self.folder/label/'screen.png').write_bytes(self.ar.adb('exec-out','screencap','-p'))
                try:path=landscape_notification_switch(windows)
                except PanelUnavailable as error:
                    self.report.setdefault('switchPrerequisiteObservations',[]).append({'source':label,'error':str(error),'featurePassed':False})
                    self.persist();previous=None
                    focused=[w for w in windows if w.get('active') and w.get('focused')]
                    if attempt==1 and len(focused)==1 and focused[0].get('type')==1 and focused[0].get('root',{}).get('package')==safe.PACKAGE:
                        self.ar.shell('cmd statusbar expand-settings')
                    time.sleep(.3);continue
                if path==previous:break
                previous=path;time.sleep(.3)
            else:raise PanelUnavailable('Control panel switch geometry did not settle')
            self.report.setdefault('nativePanelSwitches',[]).append({'source':label,'path':path,'method':'ROM Control-to-Notification rightward gesture; no tile click'})
            self.persist();self.ar.shell('input swipe %d %d %d %d 450'%tuple(path));time.sleep(.7)
    def capture(self,label,surface,wide,seconds,period,expanded,baseline_font,reopen=True):
        if reopen:self.open_panel(surface,wide)
        else:self.ar.shell('input keyevent KEYCODE_WAKEUP')
        for attempt in range(4):
            evidence=label if attempt==0 else label+'-settled-'+str(attempt)
            windows=self.ui.all_windows(evidence)
            png=self.ar.adb('exec-out','screencap','-p');folder=self.folder/evidence;folder.mkdir(exist_ok=True);(folder/'screen.png').write_bytes(png)
            try:panel,header,clock=select_header(windows,surface,allow_missing_clock=True);break
            except RuntimeError as error:
                observation={'case':label,'evidence':evidence,'attempt':attempt,'status':'panel_not_observed','error':str(error),'cause':'unclassified','featurePassed':False}
                self.report.setdefault('failedObservations',[]).append(observation);safe.atomic(folder/'observation.json',observation);self.persist()
                if attempt==3:raise PanelUnavailable('Chosen panel never observed; preserved all PNG/tree evidence; this is not a clock failure') from error
                focused=[w for w in windows if w.get('active') and w.get('focused')]
                if attempt==1 and not wide and len(focused)==1 and focused[0].get('type')==1 and focused[0].get('root',{}).get('package')=='com.zte.mifavor.launcher':
                    self.report.setdefault('panelEntryRetries',[]).append({'case':label,'source':evidence,'reason':'Launcher remains focused after two observations','boundedRetries':1})
                    self.persist();self.open_panel(surface,wide)
                elif attempt==1 and wide and surface=='notification':
                    try:retry_path=landscape_notification_switch(windows)
                    except (PanelUnavailable,ValueError,RuntimeError):retry_path=None
                    if retry_path is not None:
                        self.report.setdefault('panelEntryRetries',[]).append({'case':label,'source':evidence,'reason':'Control panel remains focused after two observations','boundedRetries':1,'path':retry_path})
                        self.persist();self.ar.shell('input swipe %d %d %d %d 450'%tuple(retry_path));time.sleep(.7)
                time.sleep(.3)
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Invalid PNG')
        w,h=struct.unpack('>II',png[16:24])
        if (w>h)!=wide:raise PanelUnavailable('Actual screenshot orientation differs from requested profile')
        profile=self.profile();diagnostic=self.diagnostics();scope='1' if surface=='control' else '2';orientation='landscape' if wide else 'portrait'
        key='ls_augment_header_clock_runtime_'+scope+'_'+orientation
        state=layout_state(diagnostic.get(key) or '',seconds or period or expanded);fallback=state=='native_fallback_insufficient_space'
        pixels=font_px(clock or {})
        font_state='unavailable' if pixels is None or baseline_font is None else 'preserved_native_size' if abs(pixels-baseline_font)<.15 else 'changed'
        row={'case':label,'evidence':evidence,'surface':surface,'profile':profile,'pngSize':[w,h],'panelBounds':panel.get('bounds'),
             'headerBounds':header.get('bounds'),'clock':clock,'requested':{'seconds':bool(seconds),'period':bool(period),'expanded':expanded},
             'nativeFontBaselinePx':baseline_font,'actualFontPx':pixels,'fontEvidence':font_state,'layoutState':state,
             'diagnosticKey':key,'diagnostic':diagnostic,'diagnosticIsPixelProof':False,
             'headerDescendants':[ {k:n.get(k) for k in ('id','class','text','description','bounds','visible','clickable','enabled','renderingInfo')} for n in flatten(header)],
             'visualReviewRequired':True,'pixelPassed':False}
        row['weatherNodes']=[n for n in flatten(header) if n.get('visible') and str(n.get('description','')).endswith('，点击打开天气')]
        row['weatherRequested']=self.report.get('withWeather',False)
        self.report['cases'].append(row);self.persist();safe.atomic(folder/'case.json',row)
        if row['weatherRequested'] and len(row['weatherNodes'])!=1:raise AssertionError('Requested native weather node absent or ambiguous; review preserved evidence')
        if row['weatherRequested']:
            weather_rect=rect(row['weatherNodes'][0])
            if weather_rect[2]<=weather_rect[0] or weather_rect[3]<=weather_rect[1]:raise AssertionError('Requested weather has no positive native node bounds; review preserved PNG')
        row['clockObserved']=clock is not None
        row['format']=evaluate_text(clock,seconds,period,fallback) if clock is not None else {
            'state':'clock_not_observed','normalizedText':None,'description':None,'assertedCustomFormat':False}
        if not expanded and not fallback and font_state=='changed':raise AssertionError('Ordinary formatting changed actual native TextView font size')
        safe.atomic(folder/'case.json',row);self.persist();return row
    def inspect_scroll(self):
        dpi=re.findall(r'\d+',self.ar.shell('wm density'))
        if not dpi:raise PanelUnavailable('Actual density unavailable before scrolling')
        density=int(dpi[-1])/160
        if not .5<=density<=8:raise PanelUnavailable('Unexpected density; no scroll attempted')
        observations=[];previous=None;stable=0
        for step in range(9):
            label='notification-scroll-'+str(step);windows=self.ui.all_windows(label)
            folder=self.folder/label;(folder/'screen.png').write_bytes(self.ar.adb('exec-out','screencap','-p'))
            nodes=[n for w in windows for n in flatten(w['root']) if n.get('visible')]
            rows=[{'bounds':n.get('bounds'),'texts':[x.get('text') for x in flatten(n) if x.get('visible') and x.get('text') not in (None,'','null')]}
                  for n in nodes if n.get('id')==ID+'expandableNotificationRow']
            fingerprint=json.dumps(rows,ensure_ascii=False,sort_keys=True)
            stable=stable+1 if fingerprint==previous else 0;previous=fingerprint
            row={'evidence':label,'rows':rows,'diagnostics':self.diagnostics(),'pixelReviewRequired':True}
            observations.append(row);self.report['scrollObservations']=observations;self.persist()
            if step==8:break
            direction='up' if step<6 else 'down'
            if stable>=2 and direction=='up':
                self.report['scrollStopReason']='two_stable_visible_geometries_not_proof_of_native_end';break
            action_label=label+'-before-action'
            try:
                fresh_windows=self.ui.all_windows(action_label)
                path=notification_scroll_path(fresh_windows,density,direction)
            except PanelUnavailable as error:
                self.report['scrollStopReason']=str(error);break
            row['action']={'direction':direction,'path':path,'source':action_label};self.persist()
            self.ar.shell('input swipe %d %d %d %d 500'%tuple(path));time.sleep(.6)
        self.report['scrollIsWholeFeaturePass']=False;self.persist()

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--surface',choices=('control','notification'),default='control')
    parser.add_argument('--orientation',choices=('keep','portrait','landscape'),default='keep');parser.add_argument('--font-scale',choices=('1.0','1.3'))
    parser.add_argument('--expanded',action='store_true');parser.add_argument('--clock-size',type=int)
    parser.add_argument('--with-weather',action='store_true',help='Notification only: include current native weather data in every clock case; restored afterward')
    parser.add_argument('--scroll-check',action='store_true',help='Notification only: bounded vertical scrolling, no notification/clear click or dismissal')
    args=parser.parse_args()
    if args.expanded and args.surface!='notification':parser.error('--expanded requires notification surface')
    if args.with_weather and args.surface!='notification':parser.error('--with-weather requires notification surface')
    if args.scroll_check and args.surface!='notification':parser.error('--scroll-check requires notification surface')
    if args.clock_size is not None and (not args.expanded or not 24<=args.clock_size<=100):parser.error('--clock-size requires --expanded and 24..100')
    import adb_regression as ar
    package=ar.shell('dumpsys package ls.augment.com');version=int(re.search(r'\bversionCode=(\d+)',package)[1]);version_name=re.search(r'\bversionName=([^\s]+)',package)[1]
    if version!=args.expected_version:raise RuntimeError('Installed module version mismatch')
    if args.restore_only:
        journal=safe.Journal(args.restore_only.resolve())
        if journal.data['metadata']['serial']!=ar.SERIAL:raise RuntimeError('Recovery belongs to another device')
        report=json.loads((journal.path.parent/'report.json').read_text(encoding='utf-8'));HeaderRunner(ar,journal.path.parent,journal,report).cleanup();return
    unfinished=pending_runs(safe.AUDIT)
    if unfinished:raise RuntimeError('Recover unfinished run first: '+str(unfinished[0]))
    folder=safe.AUDIT/('header-layout-%d-%s-%s'%(version,args.surface,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as stream:
        with contextlib.redirect_stdout(stream):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=version:raise RuntimeError('Test APK version mismatch')
    journal=safe.Journal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':version_name})
    report={'installedVersion':version,'surface':args.surface,'withWeather':args.with_weather,'cases':[],'status':'running','wholeFeaturePassed':False,'visualReviewRequired':True,
            'limits':['No search/date/action click proof; only original visible controls and layout are captured','No pixel pass inferred from diagnostics or accessibility bounds','Unavailable font metadata remains null','No wall-clock, timezone, radio, theme or notification-content change']}
    runner=HeaderRunner(ar,folder,journal,report);runner.persist();native=NativeJournal(journal,ar)
    try:
        if not runner.runtime_current('com.android.systemui','loaded'):raise RuntimeError('Current SystemUI has not loaded expected module')
        journal.data['nativeProfileBaseline']={k:native.read(k) for k in NATIVE_KEYS};journal.save()
        if args.orientation!='keep':native.write('accelerometer_rotation','0');native.write('user_rotation','1' if args.orientation=='landscape' else '0')
        if args.font_scale is not None:native.write('font_scale',args.font_scale)
        if args.orientation!='keep' or args.font_scale is not None:time.sleep(1)
        if args.orientation=='landscape':
            safe.FIXTURE=ROOT/'out/header-clock-20455/landscape-fixture/safe-audit.apk'
            runner.fixture()
        if args.with_weather:runner.set('weather-on',{WEATHER:'1'})
        wide=args.orientation=='landscape';group=N+('landscape_' if wide else 'portrait_');baseline_font=None
        def case(label,seconds,period,expanded=False,reopen=True):
            values={P+'clock_seconds':str(int(seconds)),P+'clock_period':str(int(period))}
            if args.surface=='notification':
                values.update({N+'portrait_enabled':'0',N+'landscape_enabled':'0',group+'enabled':str(int(expanded))})
                if expanded and args.clock_size is not None:values[group+'size']=str(args.clock_size)
            runner.set(label,values)
            return runner.capture(label,args.surface,wide,seconds,period,expanded,baseline_font,reopen)
        first=case('clock-off',False,False);baseline_font=first['actualFontPx'];report['nativeFontBaselinePx']=baseline_font
        if args.expanded:case('expanded-only',False,False,True)
        samples=[case('seconds-on-0',True,False,args.expanded)]
        for i in (1,2):
            time.sleep(1.1);samples.append(runner.capture('seconds-on-'+str(i),args.surface,wide,True,False,args.expanded,baseline_font,False))
        if all(r['clockObserved'] and r['layoutState']!='native_fallback_insufficient_space' for r in samples):
            times=[re.search(r'\d{1,2}:\d{2}:\d{2}',r['format']['normalizedText']).group(0) for r in samples]
            if len(set(times))!=3:raise AssertionError('Three distinct observed seconds required')
        else:report['secondsVerification']='not_observed_or_native_fallback'
        runner.capture('seconds-reopened',args.surface,wide,True,False,args.expanded,baseline_font,True)
        case('period-only',False,True,args.expanded);case('seconds-and-period',True,True,args.expanded)
        if args.scroll_check:runner.inspect_scroll()
        case('clock-off-again',False,False)
        report['status']='observed_visual_review_pending'
    except BaseException as error:
        report['status']='inconclusive_panel_prerequisite' if isinstance(error,PanelUnavailable) else 'failed';report['error']=traceback.format_exc();raise
    finally:
        try:ar.shell('cmd statusbar collapse')
        except Exception as error:report['collapseError']=str(error)
        if args.orientation=='landscape':
            try:ar.shell('input keyevent KEYCODE_HOME')
            except Exception as error:report['backgroundCloseError']=str(error)
        runner.persist();runner.cleanup()
        print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'nativeProfileRestored':journal.data.get('nativeProfileRestored'),'pending':journal.data['pending']},ensure_ascii=False))

if __name__=='__main__':main()
