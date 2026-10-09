"""Opt-in notification weather/default-calendar observations; no native preference writes.

Only two registered module booleans may change. Default cases do not open weather.
Calendar opens an already resolved app, without selecting defaults or creating events.
"""
from pathlib import Path
import argparse
import contextlib
import datetime
import hashlib
import importlib.util
import json
import re
import struct
import time
import traceback

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('header_extras_native',ROOT/'tools/run-safe-native-function-device.py')
safe=importlib.util.module_from_spec(spec);spec.loader.exec_module(safe)
WEATHER='ls_augment_rm_notification_weather';CALENDAR='ls_augment_rm_qs_calendar';KEYS={WEATHER,CALENDAR}
ID='com.android.systemui:id/';WEATHER_PACKAGE='com.zte.mifavor.weather'
NATIVE={'system':['screen_brightness','screen_brightness_mode','use_control_panel','font_scale','user_rotation','accelerometer_rotation'],
        'secure':['sysui_qs_tiles','location_mode']}


class Inconclusive(RuntimeError): pass


def walk(node,parents=()):
    yield node,parents
    for child in node.get('children',[]):yield from walk(child,parents+(node,))


def rectangle(node):
    rect=tuple(map(int,re.findall(r'-?\d+',node.get('bounds',''))))
    if len(rect)!=4 or rect[2]<=rect[0] or rect[3]<=rect[1]:raise Inconclusive('Observed control has no positive actual bounds')
    return rect


def resolve_component(raw):
    if re.search(r'No activity|No activities|unable to resolve|Error:|Exception|Permission Denial',raw,re.I):
        raise Inconclusive('Native category has no proven default: '+raw[:250])
    values=re.findall(r'^([A-Za-z][\w.]+/[A-Za-z.$][\w.$]*)\s*$',raw,re.M)
    if len(values)!=1 or re.search(r'ResolverActivity|ChooserActivity|IntentResolver',values[0],re.I):
        raise Inconclusive('Ambiguous/chooser category result; no default will be selected')
    return values[0]


def idle_instrumentation(raw):
    if re.search(r'Unknown command|Bad activity command|Permission Denial|DUMP TIMEOUT|DeadObjectException',raw,re.I):raise Inconclusive('Activity report unavailable')
    headers=['ACTIVITY MANAGER SETTINGS ','ACTIVITY MANAGER ACTIVITIES ',
        'ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)',
        'ACTIVITY MANAGER USERS (dumpsys activity users)','ACTIVITY MANAGER COMPONENT-ALIAS ']
    positions=[]
    for header in headers:
        hits=list(re.finditer('^'+re.escape(header),raw,re.M))
        if len(hits)!=1:raise Inconclusive('Incomplete full activity report')
        positions.append(hits[0].start())
    if positions!=sorted(positions):raise Inconclusive('Unexpected full activity section order')
    body=raw[positions[2]:positions[3]]
    for marker in ['  OOM levels:','  Process OOM control (','  Raw LRU list (','  Process LRU list (','  mWakefulness=','  mShuttingDown=','  mForceBackgroundCheck=']:
        if not re.search('^'+re.escape(marker),body,re.M):raise Inconclusive('Incomplete process section')
    if re.search(r'ActiveInstrumentation\{|mClass=ComponentInfo\{|\(instrumentation\)\s*$',body,re.M):return False
    active=list(re.finditer(r'^  Active instrumentation:[ \t]*$',body,re.M|re.I))
    if len(active)>1:raise Inconclusive('Ambiguous active instrumentation section')
    if active:
        end=body.find('\n  OOM levels:',active[0].end())
        if end<0 or body[active[0].end():end].strip():raise Inconclusive('Unknown active instrumentation contents')
    return True


def header(windows):
    focused=[w for w in windows if w.get('active') and w.get('focused') and w.get('root',{}).get('package')=='com.android.systemui']
    if len(focused)!=1:raise Inconclusive('Notification panel is not the actual focused SystemUI window')
    nodes=[(n,p) for w in focused for n,p in walk(w.get('root',{})) if n.get('visible')]
    if not any(n.get('id')==ID+'notification_stack_scroller' for n,p in nodes):raise Inconclusive('Actual notification panel is absent from fresh tree')
    if any(n.get('id')==ID+'control_panel' for n,p in nodes):raise Inconclusive('Control center observed instead of notifications')
    dates=[n for n,p in nodes if n.get('id')==ID+'date' and any(a.get('id')==ID+'cc_header' for a in p)
        and any(a.get('id')==ID+'date_view' for a in p)]
    if len(dates)!=1:raise Inconclusive('Native notification header date is not unique')
    weather=[n for n,p in nodes if n.get('package')=='com.android.systemui'
        and str(n.get('description','')).endswith('，点击打开天气')
        and any(a.get('id')==ID+'cc_header' for a in p)]
    if len(weather)>1:raise Inconclusive('Weather label is ambiguous')
    date=dates[0];rectangle(date)
    selected=weather[0] if weather else None
    spatial=None
    if selected is not None:
        d,w=rectangle(date),rectangle(selected)
        parents=next(p for n,p in nodes if n is selected)
        spatial={'dateBounds':d,'weatherBounds':w,'relationship':'below_date' if w[1]>=d[3] else 'above_date' if w[3]<=d[1] else 'same_vertical_band',
            'visibleAncestorBounds':[{'id':p.get('id'),'bounds':p.get('bounds')} for p in parents if p.get('id') in (ID+'date_view',ID+'cc_header',ID+'notification_panel')],
            'completeGlyphVisibilityRequiresPixels':True}
    return {'date':date,'weather':selected,'weatherState':weather_state(selected),'weatherGeometry':spatial}


def weather_state(node):
    if node is None:return 'absent'
    text=str(node.get('text',''));description=str(node.get('description',''))
    if text=='暂无天气':return 'fallback_no_weather'
    if not re.search(r'-?\d+°C',text):return 'unrecognized_label'
    if '非今日数据' in description:return 'stored_weather_not_today'
    if '更新时间未知' in description:return 'stored_weather_time_unknown'
    if '待更新' in description:return 'stored_weather_stale'
    return 'stored_weather_displayed'  # Neither provider presence nor cached text proves live data.


def source_state(raw):
    if re.search(r'READ_ERROR:|Exception|Permission Denial|not allowed|requires.*permission',raw,re.I):return 'read_denied_or_error'
    if 'No result found' in raw or not raw.strip():return 'empty_or_unavailable'
    if re.search(r'^Row:\s*\d+',raw,re.M):return 'stored_rows_returned'
    return 'unrecognized_response'


def focus_state(windows,window_dump,expected):
    nodes=[n for w in windows for n,p in walk(w.get('root',{})) if n.get('visible')]
    panel=any(n.get('id') in (ID+'notification_stack_scroller',ID+'control_panel') for n in nodes)
    focused=[w for w in windows if w.get('type')==1 and w.get('active') and w.get('focused')]
    focus=re.findall(r'mCurrentFocus=Window\{[^\n]*?\s(?:u\d+\s+)?([A-Za-z][\w.]+)/(\S+?)(?:\s|\})',window_dump)
    packages={pair[0] for pair in focus}
    texts='\n'.join(str(n.get('text','')) for n in nodes)
    activity_guide=bool(re.search(r'权限|用户协议|隐私政策|首次使用|欢迎.{0,12}使用|设置默认|选择.{0,8}应用|仅此一次|始终',texts))
    blocked=any(w.get('root',{}).get('package') in ('com.android.permissioncontroller','com.google.android.permissioncontroller','com.android.intentresolver','android') for w in focused)
    return {'targetPackage':expected,'applicationWindows':[{'package':w.get('root',{}).get('package'),'title':w.get('title'),'active':w.get('active'),'focused':w.get('focused')} for w in focused],
        'nativeFocusedPackages':sorted(packages),'notificationPanelPresent':panel,'setupOrPermissionObserved':activity_guide or blocked,
        'targetFocusedAndPanelGone':not panel and len(focused)==1 and focused[0].get('root',{}).get('package')==expected and packages=={expected} and not(activity_guide or blocked)}


class Journal:
    kind='safe-header-extras'
    mutable_keys=KEYS
    def valid_values(self,values):
        return bool(values) and set(values)<=self.mutable_keys and all(v in ('0','1') for v in values.values())
    def __init__(self,path,baseline=None,metadata=None):
        self.path=Path(path)
        self.data=json.loads(self.path.read_text(encoding='utf-8')) if baseline is None else {'kind':self.kind,'schema':1,
            'pending':True,'baseline':baseline,'metadata':metadata,'restore':{},'allowed':{},'expected':{},'inflight':{},'history':[]}
        if self.data.get('kind')!=self.kind:raise ValueError('Wrong recovery journal')
        if baseline is not None:self.save()
    def save(self):safe.atomic(self.path,self.data)
    def owned_value(self,key,current):
        original=self.data['baseline'].get(key)
        acceptable={original,self.data['expected'].get(key,original)}
        acceptable.update(self.data['inflight'].get(key,[]))
        return current in acceptable
    def plan(self,values,current):
        if not self.valid_values(values):raise ValueError('Values are outside this collector scope')
        for key in self.data['restore']:
            if not self.owned_value(key,current.get(key)):raise ValueError('External value changed; preserving '+key)
        for key in values:
            if key not in self.data['baseline']:raise ValueError('Unregistered test key')
            if not self.owned_value(key,current.get(key)):raise ValueError('External value changed; preserving '+key)
        for key,value in values.items():
            original=self.data['baseline'][key];self.data['restore'].setdefault(key,original)
            allowed=self.data['allowed'].setdefault(key,[original])
            if value not in allowed:allowed.append(value)
            self.data['inflight'][key]=[current[key],value]
        self.data['history'].append({'attempt':values,'at':datetime.datetime.now().isoformat()});self.data['pending']=True;self.save()
    def acknowledge(self,values):
        for key,value in values.items():
            if value not in self.data['inflight'].get(key,[]):raise ValueError('Cannot acknowledge an unjournaled value')
            self.data['expected'][key]=value;self.data['inflight'].pop(key,None)
        self.save()
    def restore(self,instrument,pause=time.sleep):
        if not set(self.data['restore'])<=self.mutable_keys:raise ValueError('Foreign key in restore journal')
        for key,value in self.data['restore'].items():
            if value!=self.data['baseline'].get(key):raise ValueError('Journal original differs from baseline')
        changes={};external={}
        current=instrument('snapshot','recovery-before')['settings']
        for key,original in self.data['restore'].items():
            if not self.owned_value(key,current.get(key)):external[key]=current.get(key)
            else:changes[key]=original
        # Reassert every known owned original, including values already observed
        # as baseline: a prior save may have queued asynchronous runtime sync.
        if changes:
            result=instrument('set','recovery-set',changes)
            self.data['restoreRuntimeSynced']=result.get('runtimeSynced');self.save()
        stable=0;after=current
        for attempt in range(8):
            after=instrument('snapshot','recovery-readback-'+str(attempt))['settings']
            owned_ok=all(after.get(k)==v for k,v in self.data['restore'].items() if k not in external)
            stable=stable+1 if owned_ok else 0
            if stable>=2:break
            pause(.6)
        differences={k:{'baseline':self.data['baseline'].get(k),'actual':after.get(k)} for k in self.data['baseline'].keys()|after.keys() if self.data['baseline'].get(k)!=after.get(k)}
        self.data.update(configurationRestored=not differences,ownedConfigurationRestored=stable>=2 and not external,
            externalValuesPreserved=external,configurationDifferences=differences,pending=bool(differences) or stable<2)
        self.save()
        if self.data['pending']:raise RuntimeError('Restoration has preserved external/unsettled changes; journal remains pending')


class Collector(safe.Runner):
    def __init__(self,ar,folder,journal,report):
        super().__init__(ar,folder,journal,report)
        self.sequence=max([0]+[int(m[1]) for p in folder.iterdir() if(m:=re.match(r'^(\d+)-',p.name))])
    def instrument(self,operation,label,values=None):
        result=super().instrument(operation,label,values)
        if result.get('moduleVersion')!=self.journal.data['metadata']['installedVersion']:raise RuntimeError('Test APK/installed module mismatch')
        return result
    def native(self):return {namespace+'/'+key:self.ar.shell('settings --user 0 get '+namespace+' '+key) for namespace,keys in NATIVE.items() for key in keys}
    def set(self,label,values):
        if not self.runtime_current('com.android.systemui',label):raise Inconclusive('Current SystemUI build not loaded')
        current=self.instrument('snapshot',label+'-before')['settings'];self.journal.plan(values,current)
        result=self.instrument('set',label,values)
        self.report.setdefault('saves',[]).append({'phase':label,'values':values,'runtimeSynced':result.get('runtimeSynced')});self.persist()
        for attempt in range(6):
            actual=self.instrument('snapshot',label+'-readback-'+str(attempt))['settings']
            if all(actual.get(k)==v for k,v in values.items()):self.journal.acknowledge(values);time.sleep(1);return
            time.sleep(.6)
        raise RuntimeError('Saved feature values did not settle to requested values')
    def observe_all(self,label):
        windows=self.ui.all_windows(label);folder=self.folder/label
        png=self.ar.adb('exec-out','screencap','-p')
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise Inconclusive('Screenshot unavailable')
        width,height=struct.unpack('>II',png[16:24])
        self.last_size=(width,height)
        (folder/'screen.png').write_bytes(png)
        # On NX809J the windows-only dump omits mCurrentFocus. The activity
        # activities report includes the current display focus and resumed app.
        native=self.ar.shell('dumpsys activity activities');(folder/'activity-private.txt').write_text(native,encoding='utf-8')
        return windows,native,(width,height)
    def launcher(self,label):
        self.ar.shell('input keyevent KEYCODE_WAKEUP');self.ar.shell('wm dismiss-keyguard')
        self.ar.shell('cmd statusbar collapse');self.ar.shell('input keyevent KEYCODE_HOME');time.sleep(.7)
        expected=self.journal.data['metadata']['homeComponent'].split('/')[0]
        for attempt in range(4):
            windows,native,size=self.observe_all(label+'-launcher-'+str(attempt));state=focus_state(windows,native,expected)
            if state['targetFocusedAndPanelGone']:return size
            time.sleep(.4)
        raise Inconclusive('Launcher is not actual focused background; no header control will be clicked')
    def notification(self,label):
        before=self.native();baseline=self.journal.data['metadata']['nativeBaseline']
        for key in ('system/use_control_panel','system/font_scale','system/user_rotation','system/accelerometer_rotation','secure/sysui_qs_tiles','system/screen_brightness_mode','secure/location_mode'):
            if before[key]!=baseline[key]:raise Inconclusive('Native profile changed; preserving '+key)
        width,height=self.launcher(label)
        if width>=height:raise Inconclusive('Collector is limited to current portrait mode; rotation untouched')
        x=round(width*.15);self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(height*.66)));time.sleep(1)
        previous=None
        for attempt in range(4):
            evidence=label+'-panel-'+str(attempt);windows,native,size=self.observe_all(evidence)
            try:
                actual=header(windows);signature=(actual['date']['bounds'],actual['date'].get('text'),actual['weatherState'],actual['weather'].get('text') if actual['weather'] else None)
                if signature==previous:return evidence,actual
                previous=signature
            except Inconclusive:pass
            time.sleep(.6)
        raise Inconclusive('Fresh notification header not stable/observable; screenshots retained, no blind tap')
    def weather_source(self,label):
        folder=self.folder/(label+'-source');folder.mkdir(exist_ok=True)
        package=self.ar.shell('pm path '+WEATHER_PACKAGE);(folder/'package.txt').write_text(package,encoding='utf-8')
        states={}
        for endpoint in ('DefaultCityWeather','LocCityWeather'):
            # Public read as shell. Never escalate to impersonate SystemUI permission.
            try:raw=self.ar.shell('content query --uri content://com.zte.mifavor.weather.api/'+endpoint+' --projection city_name:weather_description:curr_temper:timeMills:time_zone',timeout=15)
            except Exception as error:raw='READ_ERROR: '+type(error).__name__+': '+str(error)
            (folder/(endpoint+'-private.txt')).write_text(raw,encoding='utf-8');states[endpoint]=source_state(raw)
        result={'packageInstalled':bool(package.strip()),'readIdentity':'shell','providerStates':states,'sourceEvidence':str(folder.relative_to(self.folder)),
            'limit':'Stored provider rows are not proof of fresh/live network weather; shell denial does not prove SystemUI denial'}
        self.report.setdefault('weatherSources',[]).append(result);self.persist();return result
    def click_observed(self,label,node):
        if not node.get('clickable') or not node.get('enabled') or not node.get('visible'):raise Inconclusive('Target is not an actual enabled clickable control')
        l,t,r,b=rectangle(node)
        width,height=self.last_size
        if l<0 or t<0 or r>width or b>height:raise Inconclusive('Target is partially outside the screen')
        safe.atomic(self.folder/(label+'-action.json'),{'action':'tap-existing-header-control','id':node.get('id'),'bounds':[l,t,r,b],
            'text':node.get('text'),'description':node.get('description')})
        self.ar.shell('input tap %d %d'%((l+r)//2,(t+b)//2))
    def target(self,label,package):
        for attempt in range(5):
            time.sleep(.5);evidence=label+'-target-'+str(attempt);windows,native,size=self.observe_all(evidence)
            state=focus_state(windows,native,package);state['evidence']=evidence
            self.report.setdefault('launchObservations',[]).append(state);self.persist()
            if state['setupOrPermissionObserved']:raise Inconclusive('Permission/default/first-run guide observed; no option selected')
            if state['targetFocusedAndPanelGone']:return state
        raise Inconclusive('Resolved target did not obtain focus with panel gone')
    def weather(self,open_app=False):
        self.weather_source('weather-before')
        for label,value in [('weather-off','0'),('weather-on','1'),('weather-off-again','0')]:
            self.set(label,{WEATHER:value});evidence,actual=self.notification(label)
            if value=='1':
                # Initial provider timeout is five seconds. Sample after it, not
                # immediately when the temporary fallback label is first created.
                time.sleep(6);windows,native,size=self.observe_all(label+'-provider-settled');actual=header(windows);evidence=label+'-provider-settled'
            result={'case':label,'evidence':evidence,'date':actual['date'],'weather':actual['weather'],'weatherState':actual['weatherState'],'weatherGeometry':actual['weatherGeometry'],
                'liveWeatherVerified':False,'pixelReviewRequired':True};self.report['cases'].append(result);self.persist()
            if value=='0' and actual['weather'] is not None:raise AssertionError('Weather label still observable after disable')
            if value=='1':
                if actual['weather'] is None or actual['weatherState']=='unrecognized_label':raise Inconclusive('Enabled weather label absent/unrecognized; no data/display claim')
                if open_app:
                    if not self.ar.shell('pm path '+WEATHER_PACKAGE).strip():raise Inconclusive('Native weather app unavailable; no launch attempted')
                    self.click_observed('weather-open',actual['weather']);self.target('weather-open',WEATHER_PACKAGE)
        self.weather_source('weather-after')
    def calendar(self):
        raw=self.ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.APP_CALENDAR')
        (self.folder/'calendar-resolve.txt').write_text(raw,encoding='utf-8');component=resolve_component(raw)
        self.report['calendarTarget']={'component':component,'resolvedCategory':'android.intent.category.APP_CALENDAR','defaultSelectedByCollector':False};self.persist()
        self.set('calendar-off',{CALENDAR:'0'});evidence,actual=self.notification('calendar-off')
        self.report['cases'].append({'case':'calendar-off','evidence':evidence,'date':actual['date'],'clicked':False});self.persist()
        self.set('calendar-on',{CALENDAR:'1'});evidence,actual=self.notification('calendar-on')
        # Recheck immediately before the only date tap; never follow a newly
        # selected/ambiguous default from outside this test.
        latest=resolve_component(self.ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.APP_CALENDAR'))
        if latest!=component:raise Inconclusive('Calendar default changed externally; no date tap')
        self.report['cases'].append({'case':'calendar-on','evidence':evidence,'date':actual['date'],'target':component});self.persist()
        self.click_observed('calendar-date',actual['date']);self.target('calendar-date',component.split('/')[0])
        self.set('calendar-off-again',{CALENDAR:'0'});evidence,actual=self.notification('calendar-off-again')
        self.report['cases'].append({'case':'calendar-off-again','evidence':evidence,'date':actual['date'],'clicked':False});self.persist()
    def restore(self):
        errors=[]
        try:self.journal.restore(self.instrument)
        except BaseException:errors.append(traceback.format_exc())
        try:
            actual=self.native();self.report['nativeReadback']=actual;self.report['nativeSettingsUnchanged']=actual==self.journal.data['metadata']['nativeBaseline']
        except BaseException:errors.append(traceback.format_exc())
        self.report.update(configurationRestored=self.journal.data.get('configurationRestored',False),restorePending=self.journal.data['pending'],cleanupErrors=errors,
            nativeSettingsNeverWritten=True,eventsCreated=False,permissionsGranted=False,defaultsSelected=False)
        self.persist()
        if errors:raise RuntimeError('Restore incomplete; review durable journal and use restore-only')


def gates(ar,exclude=None):
    for path in safe.AUDIT.rglob('restore.json'):
        if exclude is not None and path.resolve()==exclude.resolve():continue
        if json.loads(path.read_text(encoding='utf-8')).get('pending'):raise Inconclusive('Prior recovery pending: '+str(path))
    if not idle_instrumentation(ar.shell('dumpsys activity',timeout=90)):raise Inconclusive('Other instrumentation active')
    pending=ar.shell("find /data/user/0/ls.augment.com/files -maxdepth 1 -type f -name '*baseline*.json*'",root=True)
    if pending:raise Inconclusive('Android test recovery baseline exists: '+pending)
    if ar.shell('if test -e /data/local/tmp/duo-wifi-assets-collector; then echo PRESENT; else echo ABSENT; fi')!='ABSENT':raise Inconclusive('Other collector lease present/unknown')


def main():
    parser=argparse.ArgumentParser(description=__doc__);choice=parser.add_mutually_exclusive_group(required=True)
    choice.add_argument('--run',action='store_true');choice.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--cases',default='weather,calendar')
    args=parser.parse_args();cases=args.cases.split(',')
    if not cases or len(cases)!=len(set(cases)) or not set(cases)<={'weather','weather-open','calendar'}:parser.error('Cases: weather, weather-open (explicit native app launch), calendar')
    import adb_regression as ar
    dump=ar.shell('dumpsys package ls.augment.com');version=int(re.search(r'\bversionCode=(\d+)',dump)[1]);name=re.search(r'\bversionName=([^\s]+)',dump)[1]
    if version!=args.expected_version:raise Inconclusive('Installed version differs from requested version')
    gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());meta=journal.data['metadata']
        if meta['serial']!=ar.SERIAL or meta['installedVersion']!=version:raise RuntimeError('Recovery device/build mismatch')
        folder=journal.path.parent;report=json.loads((folder/'report.json').read_text(encoding='utf-8'))
        Collector(ar,folder,journal,report).restore();print(str(folder/'report.json'));return
    home_raw=ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME')
    home=resolve_component(home_raw)
    folder=safe.AUDIT/('header-extras-safe-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir(parents=True);ar.OUTPUT=folder
    (folder/'home-resolve.txt').write_text(home_raw,encoding='utf-8')
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=version:raise Inconclusive('Test APK mismatch; no module values changed')
    native={namespace+'/'+key:ar.shell('settings --user 0 get '+namespace+' '+key) for namespace,keys in NATIVE.items() for key in keys}
    journal=Journal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':name,'homeComponent':home,
        'nativeBaseline':native,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()})
    report={'installedVersion':version,'requestedCases':cases,'features':(['V2-139'] if set(cases)&{'weather','weather-open'} else [])+(['V2-140'] if 'calendar' in cases else []),
        'cases':[],'status':'started','wholeFeaturePassed':False,'visualReviewRequired':True,
        'limits':['Current portrait notification panel only','No broadcasts, account changes, location/permission grants, city changes or event writes',
        'Weather text may be cached or fallback; no live data claim','Calendar off behavior is observed without clicking; enabled click must focus resolved target']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:
        if not collector.runtime_current('com.android.systemui','preflight'):raise Inconclusive('Current SystemUI build not loaded')
        if set(cases)&{'weather','weather-open'}:collector.weather('weather-open' in cases)
        if 'calendar' in cases:collector.calendar()
        report['status']='observed_visual_review_pending'
    except Inconclusive:
        report['status']='inconclusive';report['error']=traceback.format_exc();raise
    except BaseException:
        report['status']='failed';report['error']=traceback.format_exc();raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:
            ar.shell('cmd statusbar collapse');ar.shell('input keyevent KEYCODE_HOME');collector.persist()
            print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending']},ensure_ascii=False))


if __name__=='__main__':main()
