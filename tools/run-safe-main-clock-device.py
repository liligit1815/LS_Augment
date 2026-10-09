"""Opt-in main clock A/B observations. No imports, recording, clock/radio/native-setting writes.

Only --run/--restore-only contact a device. Each invocation owns one small batch;
full configuration restoration and independently reviewed pixels remain separate.
"""
from pathlib import Path
import argparse, contextlib, datetime as dt, hashlib, importlib.util, io, json, re, shlex, struct, time, traceback, uuid

ROOT=Path(__file__).resolve().parents[1]
def load(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result
font=load('main_clock_identity','run-main-font-existing-gif-device.py')
base,extra=font.base,font.extra
summary=load('main_clock_notification_identity','run-safe-statusbar-summary-priority-device.py')
P='ls_augment_statusbar_clock_'
CUSTOM,ROWS,FIRST,SECOND,H24,SECONDS,PERIOD,WEEK=[P+s for s in ('custom','rows','pattern','pattern_second','24h','seconds','period','week')]
KEYS={CUSTOM,ROWS,FIRST,SECOND,H24,SECONDS,PERIOD,WEEK}
DATE_COMMAND="date '+%s%3N|%Y-%m-%dT%H:%M:%S.%3N%z'"
AT_COUNT=497
atomic,difference,digest=font.atomic,base.difference,base.digest

def allowed_for(case):
    if case=='custom':return {CUSTOM,ROWS,FIRST,SECOND}
    if case=='defaults':return {CUSTOM,ROWS,FIRST,H24,SECONDS,PERIOD,WEEK}
    raise ValueError('Only custom/defaults batches are implemented; no recording case')

def phases(case):
    if case=='custom':return [
        ('two-marked-lines',{CUSTOM:'1',ROWS:'2',FIRST:"'D'HH:mm",SECOND:"'L2' MM.dd"}),
        ('single-keeps-second',{ROWS:'1'}),('two-again',{ROWS:'2'}),('blank-second',{SECOND:''}),('custom-off',{CUSTOM:'0'})]
    if case=='defaults':return [
        ('reference-24',{CUSTOM:'1',ROWS:'1',FIRST:'',H24:'1',SECONDS:'0',PERIOD:'0',WEEK:'0'}),
        ('only-12h',{H24:'0'}),('default-12h-period',{PERIOD:'1'}),('default-12h-period-off',{PERIOD:'0'}),
        ('reference-after-12h',{H24:'1'}),('only-seconds',{SECONDS:'1'}),('reference-after-seconds',{SECONDS:'0'}),
        ('only-period',{PERIOD:'1'}),('reference-after-period',{PERIOD:'0'}),('only-week',{WEEK:'1'}),('reference-after-week',{WEEK:'0'})]
    allowed_for(case)

def validate_schema(schema,version,settings,case):
    keys=schema.get('runtimeKeys',[])
    if schema.get('build')!=version or not keys or len(keys)!=len(set(keys)) or not allowed_for(case)<=set(keys) or not set(keys)<=set(settings):
        raise ValueError('Exact compiled runtime schema/build/owned-key mismatch')

def prerequisite(settings,case):
    if len(settings)!=AT_COUNT or not KEYS<=settings.keys() or not all(isinstance(v,str) for v in settings.values()):raise ValueError('Expected complete 497-string baseline')
    required={'ls_augment_systemui_master':'1','ls_augment_statusbar_position_size_only':'0',
              'ls_augment_rm_screenshot_hide_status_bar':'0','ls_augment_rm_clock_milliseconds_refresh':'0'}
    if any(settings.get(k)!=v for k,v in required.items()):raise extra.Inconclusive('Existing master/position/capture/high-frequency prerequisite unavailable; no unrelated changes')
    if case=='custom' and any(settings[k]!='0' for k in (H24,SECONDS,PERIOD,WEEK)):raise extra.Inconclusive('Custom batch requires current default flags off; they are not owned')

def stamp(raw):
    match=re.fullmatch(r'(\d{13})\|([0-9T:.+-]+)',raw.strip())
    if not match:raise extra.Inconclusive('Phone millisecond clock unsupported')
    actual=dt.datetime.fromisoformat(match[2])
    if actual.tzinfo is None or abs(round(actual.timestamp()*1000)-int(match[1]))>2:raise extra.Inconclusive('Phone epoch/local-time disagree')
    return {'epochMs':int(match[1]),'iso':match[2],'offsetSeconds':int(actual.utcoffset().total_seconds())}

def time_candidates(before,after):
    start,end=before['epochMs'],after['epochMs']
    if before['offsetSeconds']!=after['offsetSeconds'] or not 0<=end-start<=15000:raise extra.Inconclusive('Time/offset moved or observation interval too broad')
    zone=dt.timezone(dt.timedelta(seconds=before['offsetSeconds']))
    # One scheduled ordinary tick may still show the preceding second. This
    # bounded grace is reported; it never proves exact cadence or millisecond timing.
    return [dt.datetime.fromtimestamp(s,zone) for s in range((start-1000)//1000,end//1000+1)]

def locale_identity(global_raw,app_raw,config):
    if 'com.android.systemui' not in app_raw or re.search(r'Error|Exception|Unknown|Permission',app_raw,re.I):raise extra.Inconclusive('SystemUI locale override cannot be established')
    groups=re.findall(r'\[([A-Za-z0-9,_-]*)\]',app_raw)
    if len(groups)!=1:raise extra.Inconclusive('Ambiguous SystemUI locale list')
    source=groups[0] or global_raw.strip()
    tag=source.split(',')[0].replace('_','-')
    if tag not in ('zh-CN','zh-Hans-CN','en-US'):raise extra.Inconclusive('This time oracle only supports observed zh-CN/en-US; no locale mutation')
    if not groups[0]:
        patterns=('zh-rCN','b+zh+Hans+CN','zh-CN','zh-Hans-CN') if tag.startswith('zh') else ('en-rUS','en-US')
        if not any(p in config for p in patterns):raise extra.Inconclusive('Global locale/config do not agree')
    return 'zh-CN' if tag.startswith('zh') else 'en-US'

def period(hour,locale):
    if locale=='en-US':return 'AM' if hour<12 else 'PM'
    return next(name for upper,name in ((5,'凌晨'),(8,'早上'),(11,'上午'),(13,'中午'),(18,'下午'),(20,'傍晚'),(24,'晚上')) if hour<upper)

def default_text(t,settings,locale,legacy=False):
    use24=settings[H24]=='1'; seconds=settings[SECONDS]=='1'; show_period=settings[PERIOD]=='1'
    text=(f'{t.hour:02}' if use24 else str(t.hour%12 or 12))+f':{t.minute:02}'
    if seconds:text+=f':{t.second:02}'
    if not use24 and (not show_period or legacy):text+=' '+(('上午' if t.hour<12 else '下午') if locale=='zh-CN' else ('AM' if t.hour<12 else 'PM'))
    if show_period:text+=' '+period(t.hour,locale)
    if settings[WEEK]=='1':text+=' '+(('周一','周二','周三','周四','周五','周六','周日') if locale=='zh-CN' else ('Mon','Tue','Wed','Thu','Fri','Sat','Sun'))[t.weekday()]
    return text

def clock_texts(windows):
    bars=[n for w in windows for n,_ in extra.walk(w.get('root',{})) if n.get('id')=='com.android.systemui:id/status_bar' and n.get('visible')]
    if len(bars)!=1:raise extra.Inconclusive('Unique actual main status bar absent')
    bar=bars[0];bounds=extra.rectangle(bar)
    entries=[{k:n.get(k) for k in ('id','class','text','bounds')} for n,_ in extra.walk(bar)
             if n.get('visible') and n.get('package')=='com.android.systemui' and n.get('text') not in (None,'','null')]
    first=[e for e in entries if re.search(r'\d{1,2}:\d{2}',str(e['text']))]
    if len(first)!=1:raise extra.Inconclusive('Actual clock text is absent/ambiguous, including anonymous grid text')
    first_lines=str(first[0]['text']).splitlines()
    seconds=[line for e in entries for line in str(e['text']).splitlines() if line.startswith('L2 ')]
    return {'barBounds':list(bounds),'first':first_lines[0],'secondMarkers':seconds,'entries':entries,'nativeBoundsAreNotCanvasGlyphBoxes':True}

def classify(label,observed,settings,locale,before,after):
    dates=time_candidates(before,after)
    if label=='user-baseline' or label.startswith('restored-main') or label=='custom-off':
        if label=='custom-off' and (observed['first'].startswith('D') or observed['secondMarkers']):
            return {'kind':'native_refresh_not_established','functionalPass':False,
                    'reason':'Custom marker remains before a confirmed natural native tick; no product failure inferred and no time broadcast sent.'}
        return {'kind':'native_or_user_pattern_manual_pixel_review','candidatesNotGeneratedForArbitraryUserFormat':True}
    if settings[FIRST]=="'D'HH:mm":
        candidates={t.strftime('D%H:%M') for t in dates}
        seconds={t.strftime('L2 %m.%d') for t in dates}
        wanted=settings[ROWS]=='2' and bool(settings[SECOND].strip())
        if observed['first'] not in candidates or (wanted and (len(observed['secondMarkers'])!=1 or observed['secondMarkers'][0] not in seconds)) or (not wanted and observed['secondMarkers']):
            raise extra.Inconclusive('Custom text/second-row interval oracle did not match; pixels retained')
        return {'kind':'custom_text_interval_matched','firstCandidates':sorted(candidates),'secondCandidates':sorted(seconds) if wanted else [],'renderGraceMs':1000}
    fixed={default_text(t,settings,locale) for t in dates}
    old={default_text(t,settings,locale,True) for t in dates}
    if label=='default-12h-period':
        if observed['first'] in fixed:return {'kind':'single_default_period_observed','candidates':sorted(fixed),'visualPass':False}
        if observed['first'] in old:return {'kind':'known_legacy_duplicate_observed','candidates':sorted(old),'functionalPass':False,'visualPass':False}
    elif observed['first'] in fixed:return {'kind':'default_text_interval_matched','candidates':sorted(fixed),'renderGraceMs':1000}
    raise extra.Inconclusive('Default text does not match bounded phone time/locale; no historical oracle')

class Journal(extra.Journal):
    kind='safe-main-clock'
    def __init__(self,path,baseline=None,metadata=None,resources=None,names=None):
        self.path=Path(path)
        self.data=json.loads(self.path.read_text('utf-8')) if baseline is None else {'kind':self.kind,'schema':1,'pending':True,
            'baseline':baseline,'metadata':metadata,'resourcesBefore':resources,'namesBefore':names,
            'restore':{},'expected':{},'inflight':{},'allowed':{},'history':[]}
        self.validate()
        if baseline is not None:self.save()
    @property
    def mutable_keys(self):return allowed_for(self.data['metadata']['case'])
    def owned_value(self,key,current):
        # The history/allowed list is audit data, never restoration authority.
        confirmed=self.data['expected'].get(key,self.data['baseline'].get(key))
        return current in {confirmed,*self.data['inflight'].get(key,[])}
    def valid_values(self,values):
        choices={k:{self.data['baseline'][k]} for k in self.mutable_keys}
        for _,v in phases(self.data['metadata']['case']):
            for k,s in v.items():choices[k].add(s)
        return bool(values) and set(values)<=self.mutable_keys and all(isinstance(v,str) and v in choices[k] for k,v in values.items())
    def validate(self):
        d=self.data;m=d.get('metadata',{})
        if d.get('kind')!=self.kind or d.get('schema')!=1 or len(d.get('baseline',{}))!=AT_COUNT or not all(isinstance(v,str) for v in d['baseline'].values()):raise ValueError('Invalid complete clock journal')
        for k in ('serial','installedVersion','installedVersionName','mainApkSha256','testApkSha256','nativeBaseline','process','homeComponent','runtimeSchema','locale','case','notificationsBefore'):
            if k not in m:raise ValueError('Missing initial durable input: '+k)
        if not KEYS<=d['baseline'].keys() or not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict):raise ValueError('Missing recovery resources/config')
        validate_schema(m['runtimeSchema'],m['installedVersion'],d['baseline'],m['case'])
        for field in ('restore','expected','inflight','allowed'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=self.mutable_keys:raise ValueError('Foreign recovery key')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()):raise ValueError('Changed original recovery value')
        if any(not self.valid_values({k:v}) for k,v in d['expected'].items()):raise ValueError('Foreign expected value')
        for field in ('inflight','allowed'):
            if any(not isinstance(v,list) or not v or any(not self.valid_values({k:x}) for x in v) for k,v in d[field].items()):raise ValueError('Foreign pending values')

def package_hash(ar,package):
    raw=ar.shell('pm path '+package).splitlines()
    if len(raw)!=1 or not raw[0].startswith('package:'):raise extra.Inconclusive('APK path not unique')
    path=raw[0][8:];found=ar.shell('sha256sum '+shlex.quote(path),root=True)
    m=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',found)
    if not m or m[2]!=path:raise extra.Inconclusive('APK hash unavailable')
    return m[1]

class Collector(base.Collector):
    def instrument(self,operation,label,values=None):
        if operation not in ('snapshot','set'):raise ValueError('Unreviewed operation')
        if operation=='set' and not self.journal.valid_values(values):raise ValueError('Clock batch write whitelist rejected')
        result=super().instrument(operation,label,values)
        if result.get('status')!='pass':raise extra.Inconclusive('Instrumentation failed: '+label)
        return result
    def native(self):
        values=super().native()
        for namespace,keys in {'system':('time_12_24','system_locales','screen_off_timeout'),'global':('auto_time','auto_time_zone')}.items():
            for key in keys:values[namespace+'/'+key]=self.ar.shell('settings --user 0 get '+namespace+' '+key)
        for key in ('persist.sys.timezone','persist.sys.locale'):values['property/'+key]=self.ar.shell('getprop '+key)
        values['systemuiLocales']=self.ar.shell('cmd locale get-app-locales com.android.systemui --user 0')
        return values
    def notifications(self):
        records=summary.notification_records(self.ar.shell('dumpsys notification',timeout=40))
        return {'count':len(records),'identitySha256':digest(json.dumps(records,sort_keys=True).encode())}
    def identity(self,label):
        m=self.journal.data['metadata']
        if base.version(self.ar.shell('dumpsys package ls.augment.com'))!=(m['installedVersion'],m['installedVersionName']):raise extra.Inconclusive('Installed module changed')
        if font.process_identity(self.ar,m['installedVersionName'])!=m['process']:raise extra.Inconclusive('Loaded SystemUI PID/boot/build changed')
        if package_hash(self.ar,'ls.augment.com')!=m['mainApkSha256'] or base.test_apk_hash(self.ar)!=m['testApkSha256']:raise extra.Inconclusive('Main/test APK identity changed')
    def protections(self):
        d=self.journal.data
        return {'resources':difference(d['resourcesBefore'],self.resources()),'names':difference(d['namesBefore'],self.names()),
                'native':difference(d['metadata']['nativeBaseline'],self.native())}
    def before(self,label,values):
        if any(self.protections().values()):raise extra.Inconclusive('Protected native/resources changed; no write')
        if self.notifications()!=self.journal.data['metadata']['notificationsBefore']:raise extra.Inconclusive('Notification identity changed naturally; stop, never clear it')
        super().before(label,values)
    def launcher(self,label):
        # No blind wake/dismiss or HOME over a foreign/permission window.
        windows,native,size=self.observe_all(label+'-entry')
        home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        if extra.focus_state(windows,native,home)['targetFocusedAndPanelGone']:return size
        if not extra.focus_state(windows,native,'ls.augment.com')['targetFocusedAndPanelGone']:raise extra.Inconclusive('Known HOME/Duo foreground required; no input issued')
        self.ar.shell('input keyevent KEYCODE_HOME');time.sleep(.6)
        windows,native,size=self.observe_all(label+'-home')
        if not extra.focus_state(windows,native,home)['targetFocusedAndPanelGone']:raise extra.Inconclusive('HOME did not become real dual focus')
        return size
    def phone_stamp(self):
        start=time.monotonic();value=stamp(self.ar.shell(DATE_COMMAND));value['hostStartMonotonic']=start;value['hostEndMonotonic']=time.monotonic();return value
    def capture(self,label):
        self.identity(label);self.assert_config(self.instrument('snapshot',label+'-before')['settings'])
        if any(self.protections().values()):raise extra.Inconclusive('Protected native/resources changed')
        size=self.launcher(label)
        if size[0]>=size[1]:raise extra.Inconclusive('Current portrait only; no rotation writes')
        expected=dict(self.journal.data['baseline'],**self.journal.data['expected']);locale=self.journal.data['metadata']['locale']
        row={'case':label,'status':'collecting','visualPass':False,'samples':[],'expectedOwnedValues':{k:expected[k] for k in self.journal.mutable_keys}}
        self.report['cases'].append(row);self.persist();folder=self.folder/label;folder.mkdir(exist_ok=True)
        try:
            count=3 if label=='only-seconds' else 2
            for i in range(count):
                before=self.phone_stamp();windows=self.ui.all_windows(label+'-tree-'+str(i));after=self.phone_stamp()
                a=self.phone_stamp();raw=self.ar.adb('exec-out','screencap','-p');b=self.phone_stamp()
                (folder/f'frame-{i:02}.png').write_bytes(raw)
                sample={'treeBefore':before,'treeAfter':after,'pngBefore':a,'pngAfter':b,'sha256':digest(raw),
                        'pixelsNeedIndependentReading':True,'classification':{'kind':'not_evaluated'}}
                row['samples'].append(sample);atomic(folder/'observation.json',row);self.persist()
                if raw[:8]!=b'\x89PNG\r\n\x1a\n' or struct.unpack('>II',raw[16:24])!=tuple(size):raise extra.Inconclusive('PNG/profile changed')
                from PIL import Image
                with Image.open(io.BytesIO(raw)) as image:image.verify()
                sample['pngTimeCandidates']=[t.isoformat() for t in time_candidates(a,b)]
                try:
                    text=clock_texts(windows);sample['text']=text
                    sample['classification']=classify(label,text,expected,locale,before,after)
                except extra.Inconclusive as error:
                    if label!='custom-off':raise
                    sample['classification']={'kind':'native_refresh_not_established','functionalPass':False,'reason':repr(error),
                        'limit':'No confirmed native tick or unique native clock; current pixels retained, no product failure inferred.'}
                atomic(folder/'observation.json',row);self.persist();time.sleep(.25)
            if label=='only-seconds' and len({s['text']['first'] for s in row['samples']})<2:raise extra.Inconclusive('No observed seconds progression; no saved-value substitute')
            self.assert_config(self.instrument('snapshot',label+'-after')['settings']);self.identity(label+'-after')
            row.update(status='collected_manual_pixel_review_required',notificationsAfter=self.notifications())
        except BaseException as error:row.update(status='incomplete',error=repr(error));raise
        finally:atomic(folder/'observation.json',row);self.persist()
    def exercise(self):
        self.capture('user-baseline')
        for label,values in phases(self.journal.data['metadata']['case']):
            self.set(label,values);time.sleep(1.2);self.capture(label)
        self.report['status']='stages_collected_awaiting_restoration';self.persist()
    def restore(self):
        d=self.journal.data;d['pending']=True;self.journal.save();self.journal.validate();errors=[];pixel_error=None
        try:
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for k,v in d['restore'].items():
                if self.journal.owned_value(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:
                # A crash after the restoration commit still owns this exact
                # original value, but never any arbitrary historical test value.
                for k,v in changes.items():d['inflight'][k]=[current[k],v]
                d['history'].append({'restoreAttempt':changes,'at':dt.datetime.now().isoformat()});self.journal.save()
                self.instrument('set','recovery-set',changes)
            stable=0;reads=[]
            for attempt in range(8):
                time.sleep(.5);diff=difference(d['baseline'],self.instrument('snapshot','recovery-readback-'+str(attempt))['settings']);reads.append(diff)
                stable=stable+1 if not diff else 0
                if stable>=2:break
            d.update(configurationRestored=stable>=2 and not external,configurationDifferences=reads,protectionDifferences=self.protections())
            if not d['configurationRestored'] or any(d['protectionDifferences'].values()):raise extra.Inconclusive('External/unsettled state preserved')
            d['expected']=dict(d['restore']);d['inflight']={};self.journal.save()
            label='restored-main';index=0
            while (self.folder/label).exists():index+=1;label='restored-main-retry-'+str(index)
            try:self.capture(label);d['restoredPixelState']='collected_manual_review_required'
            except BaseException as error:pixel_error=repr(error);d['restoredPixelState']='incomplete';d['restoredPixelError']=pixel_error
            final=[]
            for i in range(2):time.sleep(.5);final.append(difference(d['baseline'],self.instrument('snapshot','recovery-final-'+str(i))['settings']))
            d['postObservationConfigurationDifferences']=final;d['postObservationProtectionDifferences']=self.protections()
            d['notificationsAfter']=self.notifications();d['notificationIdentityUnchanged']=d['notificationsAfter']==d['metadata']['notificationsBefore']
            terminal=difference(d['baseline'],self.instrument('snapshot','recovery-terminal')['settings'])
            d['terminalConfigurationDifferences']=terminal
            if any(final) or terminal or any(d['postObservationProtectionDifferences'].values()):
                d['configurationRestored']=not any(final) and not terminal;raise extra.Inconclusive('Post-observation external change; keep pending')
            d['pending']=False
        except BaseException as error:errors.append(repr(error));d['pending']=True
        finally:
            d['cleanupErrors']=errors;self.journal.save();self.report.update(configurationRestored=d.get('configurationRestored',False),
                restorePending=d['pending'],restoredPixelState=d.get('restoredPixelState','not_observed'),cleanupErrors=errors,visualPass=False,wholeFeaturePassed=False)
            if not errors and not pixel_error and self.report.get('status')=='stages_collected_awaiting_restoration':self.report['status']='collected_manual_review_required'
            self.persist()
        if errors:raise RuntimeError('Recovery pending; preserve exact restore-only journal')
        if pixel_error:raise extra.Inconclusive('Configuration restored; restored pixels incomplete')

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--case',choices=('custom','defaults'),default='custom');parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--runtime-schema',type=Path);parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args();import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version:raise extra.Inconclusive('Installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name) or base.test_apk_hash(ar)!=m['testApkSha256'] or package_hash(ar,'ls.augment.com')!=m['mainApkSha256']:raise extra.Inconclusive('Recovery device/build/APK mismatch')
        folder=journal.path.parent;report=json.loads((folder/'report.json').read_text('utf-8')) if (folder/'report.json').exists() else {'cases':[],'status':'reconstructed_for_recovery'}
        Collector(ar,folder,journal,report).restore();return
    if args.runtime_schema is None:parser.error('--run requires exact compiled --runtime-schema')
    test_hash=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=test_hash:raise extra.Inconclusive('Installed test APK differs from local reviewed bytes')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    folder=extra.safe.AUDIT/('main-clock-%s-%d-%s'%(args.case,code,dt.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as out,contextlib.redirect_stdout(out):snapshot=ar.instrument('snapshot','baseline')
    if snapshot.get('status')!='pass' or snapshot.get('moduleVersion')!=code:raise extra.Inconclusive('Snapshot identity/status mismatch')
    baseline=snapshot['settings'];prerequisite(baseline,args.case)
    schema=json.loads(args.runtime_schema.read_text('utf-8'));validate_schema(schema,code,baseline,args.case)
    reader=Collector.__new__(Collector);reader.ar=ar;native=reader.native();config=ar.shell('am get-config')
    locale=locale_identity(native['system/system_locales'] if native['system/system_locales'] not in ('','null') else native['property/persist.sys.locale'],native['systemuiLocales'],config)
    (folder/'native-config.txt').write_text(config,encoding='utf-8')
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'mainApkSha256':package_hash(ar,'ls.augment.com'),
        'testApkSha256':test_hash,'process':font.process_identity(ar,name),'homeComponent':home,'nativeBaseline':native,'locale':locale,
        'runtimeSchema':schema,'case':args.case,'runId':uuid.uuid4().hex,'collectorSha256':digest(Path(__file__).read_bytes()),'notificationsBefore':reader.notifications()}
    metadata['dependencySha256']={p:digest((ROOT/'tools'/p).read_bytes()) for p in (
        'run-main-font-existing-gif-device.py','main_statusbar_device_collector.py','run-safe-header-extras-device.py',
        'run-safe-native-function-device.py','run-safe-statusbar-summary-priority-device.py','adb_regression.py','native_ui_helpers.py')}
    journal=Journal(folder/'restore.json',baseline,metadata,reader.resources(),reader.names())
    report={'cases':[],'status':'prepared','installedVersion':code,'case':args.case,'ownedKeys':sorted(allowed_for(args.case)),
        'visualPass':False,'wholeFeaturePassed':False,'limits':['Configuration channel only; editor UI save not exercised','No recording/millisecond cadence proof',
        'Default12h period duplicate is classified as observed legacy behavior, not a pass','Anonymous clock text and bounded phone time are necessary evidence; full PNG review required']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise()
    except BaseException as error:report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'configurationRestored':journal.data.get('configurationRestored',False)}))

if __name__=='__main__':main()
