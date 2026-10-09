"""Opt-in continuous font1.3 / portrait-landscape-portrait header evidence. No device calls on import."""
from pathlib import Path
import argparse,contextlib,datetime,importlib.util,json,math,re,struct,time,traceback

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('density_header_base',ROOT/'tools/run-safe-header-layout-device.py')
h=importlib.util.module_from_spec(spec);spec.loader.exec_module(h)
STAGES=(('portrait-before',False),('landscape',True),('portrait-after',False))

def wait_portrait_home(runner):
    """Observe the actual transition after HOME; never retry a failed clock state."""
    sequence=len(runner.report.get('portraitEntryObservations',[]));previous=None
    for attempt in range(6):
        label='portrait-entry-%d-%d'%(sequence,attempt)
        windows=runner.ui.all_windows(label);folder=runner.folder/label;folder.mkdir(exist_ok=True)
        png=runner.ar.adb('exec-out','screencap','-p');(folder/'screen.png').write_bytes(png)
        if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Actual portrait transition PNG unavailable')
        width,height=struct.unpack('>II',png[16:24])
        focused=[w for w in windows if w.get('active') and w.get('focused')]
        owned_home=len(focused)==1 and focused[0].get('type')==1 and focused[0].get('root',{}).get('package')=='com.zte.mifavor.launcher'
        bounds=None
        if owned_home:
            try:bounds=h.rect(focused[0]['root'])
            except ValueError:pass
        portrait=0<width<height and bounds is not None and 0<bounds[2]-bounds[0]<bounds[3]-bounds[1]
        ready=bool(owned_home and portrait)
        signature=(width,height,tuple(bounds)) if ready else None
        observation={'evidence':label,'attempt':attempt,'actualPngSize':[width,height],
                     'focusedWindows':[{'type':w.get('type'),'package':w.get('root',{}).get('package'),'bounds':w.get('root',{}).get('bounds')} for w in focused],
                     'portraitHomeObserved':ready,'consecutiveStable':ready and signature==previous,
                     'featurePassed':False}
        runner.report.setdefault('portraitEntryObservations',[]).append(observation)
        h.safe.atomic(folder/'observation.json',observation);runner.persist()
        if observation['consecutiveStable']:return width,height
        previous=signature
        if attempt<5:time.sleep(.35)
    raise h.PanelUnavailable('Portrait HOME did not stabilize in six saved PNG/tree observations; no panel swipe attempted')

class DensityRunner(h.HeaderRunner):
    def open_panel(self,surface,wide=False):
        if wide:return super().open_panel(surface,wide)
        self.ar.shell('input keyevent KEYCODE_WAKEUP');self.ar.shell('wm dismiss-keyguard')
        self.ar.shell('input keyevent KEYCODE_HOME');self.ar.shell('cmd statusbar collapse')
        width,height=wait_portrait_home(self)
        x=round(width*(.85 if surface=='control' else .15))
        self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(height*.65)));time.sleep(.7)

class DensityJournal(h.safe.Journal):
    """A process interruption during shared fixture cleanup must retain recovery pending."""
    hold_pending=False
    def save(self):
        if self.hold_pending:
            data=dict(self.data);data['pending']=True;h.safe.atomic(self.path,data)
        else:super().save()

def hsc(raw):
    if not isinstance(raw,str):return None
    parts=raw.split('|')
    if len(parts)!=10 or parts[0]!='HSC1':return None
    try:
        values=list(map(int,parts[1:]))
        return dict(zip(('bootEpoch','observedElapsed','build','display','rotation','densityMilli','fontScaleMilli','rtl','capacityDp'),values))
    except ValueError:return None

def evidence(row,wide):
    width,height=row['pngSize']
    if width<=0 or height<=0 or (width>height)!=wide:raise h.PanelUnavailable('Actual PNG direction differs from continuous stage')
    orientation='landscape' if wide else 'portrait';diagnostic=row.get('diagnostic',{})
    raw=diagnostic.get('ls_augment_header_clock_runtime_2_'+orientation,'') or ''
    size=re.search(r';size=([0-9.]+)(?:;|$)',raw)
    size=float(size[1]) if size else None
    if size is not None and (not math.isfinite(size) or size<=0):size=None
    capacity_key='ls_augment_statusbar_header_spacing_capacity_notification_'+('1' if wide else '0')
    raw_hsc=diagnostic.get(capacity_key)
    return {'evidence':row['evidence'],'actualPngSize':row['pngSize'],'actualOrientation':orientation,
            'headerBounds':row.get('headerBounds'),'clockBounds':(row.get('clock') or {}).get('bounds'),
            'dateBounds':[n.get('bounds') for n in row.get('headerDescendants',[]) if n.get('visible') and n.get('id')==h.ID+'date'],
            'actualFontPx':row.get('actualFontPx'),'reportedClockPx':size,'clockDiagnostic':raw,
            'layoutState':row.get('layoutState'),'hscKey':capacity_key,'hscRaw':raw_hsc,'hsc':hsc(raw_hsc),
            'settings':row['profile']['settings'],'wmDensity':row['profile'].get('wmDensity'),
            'systemUiPid':row['profile'].get('systemUiPid'),'deviceTime':row['profile'].get('deviceTime'),
            'visibleWeatherNodeCount':len(row.get('weatherNodes',[])),
            'pixelPassed':False,'diagnosticIsPixelProof':False}

def stable_pair(first,second):
    # Text may cross a minute. Compare measured geometry and observed font inputs,
    # never claim image identity or compare settings as a proxy for rendered size.
    keys=('actualPngSize','headerBounds','clockBounds','dateBounds','actualFontPx','reportedClockPx','layoutState','systemUiPid')
    a,b=first.get('hsc'),second.get('hsc')
    metrics=('build','display','rotation','densityMilli','fontScaleMilli','rtl')
    return bool(first.get('clockBounds') and second.get('clockBounds')
                and all(first.get(k)==second.get(k) for k in keys)
                and a and b and all(a.get(k)==b.get(k) for k in metrics))

def sequence(runner,native):
    native.write('accelerometer_rotation','0');native.write('user_rotation','0')
    native.write('font_scale','1.3')  # Exactly one font write for all three stages.
    values={h.P+'clock_seconds':'0',h.P+'clock_period':'0',h.WEATHER:'0'}
    for direction in ('portrait','landscape'):
        values[h.N+direction+'_enabled']='1';values[h.N+direction+'_size']='64'
    runner.set('continuous-64sp',values)
    expected_pid=None
    for index,(label,wide) in enumerate(STAGES):
        if index:native.write('user_rotation','1' if wide else '0')
        time.sleep(1)
        if not runner.runtime_current('com.android.systemui',label+'-loaded'):
            raise RuntimeError('Current SystemUI has not loaded requested module')
        stage={'stage':label,'requestedOrientation':'landscape' if wide else 'portrait','observations':[],
               'stableGeometryAndDiagnostics':False,'pixelPassed':False}
        runner.report['stages'].append(stage);runner.persist()
        for sample in range(2):
            if sample:time.sleep(1.2)
            row=runner.capture(label+'-'+str(sample),'notification',wide,False,False,True,None,reopen=sample==0)
            observed=evidence(row,wide);stage['observations'].append(observed);runner.persist()
            if observed['settings'].get('font_scale')!='1.3':raise RuntimeError('Continuous font setting changed; preserve observations')
            if observed['visibleWeatherNodeCount']:raise h.PanelUnavailable('Weather still observed after disabling; preserve this prerequisite mismatch')
            if expected_pid is None:expected_pid=observed['systemUiPid']
            if not expected_pid or observed['systemUiPid']!=expected_pid:raise RuntimeError('SystemUI process changed during continuous comparison')
        stage['stableGeometryAndDiagnostics']=stable_pair(*stage['observations']);runner.persist()
        if not stage['stableGeometryAndDiagnostics']:raise h.PanelUnavailable('Two samples did not establish stable geometry and resource metadata: '+label)
        # Repeating a stale/native report is stable evidence, not custom-size success.
        states=[o['layoutState'] for o in stage['observations']]
        stage['requestedLayoutReported']=all(s=='custom_layout_reported' for s in states)
        stage['layoutConflict']=any(s in ('native_unexpected_or_stale','diagnostic_unavailable') for s in states)
        stage['pixelPassed']=False;runner.persist()
    conflict=any(s.get('layoutConflict') for s in runner.report['stages'])
    runner.report['status']='observed_continuous_profile_with_layout_conflict' if conflict else 'observed_continuous_profile_visual_review_pending';runner.persist()

def run_session(runner):
    native=h.NativeJournal(runner.journal,runner.ar)
    try:
        runner.journal.data['nativeProfileBaseline']={key:native.read(key) for key in h.NATIVE_KEYS};runner.journal.save()
        if not runner.runtime_current('com.android.systemui','loaded'):raise RuntimeError('SystemUI build not current')
        h.safe.FIXTURE=ROOT/'out/header-clock-20455/landscape-fixture/safe-audit.apk'
        runner.fixture()
        sequence(runner,native)
    except BaseException as error:
        runner.report['status']='inconclusive_profile_observation' if isinstance(error,h.PanelUnavailable) else 'failed'
        runner.report['error']=traceback.format_exc();raise
    finally:
        for command in ('cmd statusbar collapse','input keyevent KEYCODE_HOME'):
            try:runner.ar.shell(command)
            except Exception as error:runner.report.setdefault('exitSurfaceErrors',[]).append(str(error))
        runner.persist();cleanup(runner)

def cleanup(runner):
    runner.journal.hold_pending=True
    try:runner.cleanup()
    except BaseException:
        runner.journal.data['pending']=True;raise
    finally:
        runner.journal.hold_pending=False;runner.journal.save()

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);args=parser.parse_args()
    import adb_regression as ar
    package=ar.shell('dumpsys package ls.augment.com');version=int(re.search(r'\bversionCode=(\d+)',package)[1]);version_name=re.search(r'\bversionName=([^\s]+)',package)[1]
    if version!=args.expected_version:raise RuntimeError('Installed module version mismatch')
    if ar.shell('am get-current-user').strip()!='0':raise RuntimeError('Only primary Android user 0 supported')
    if args.restore_only:
        journal=DensityJournal(args.restore_only.resolve())
        if journal.data['metadata']['serial']!=ar.SERIAL:raise RuntimeError('Recovery belongs to another device')
        report=json.loads((journal.path.parent/'report.json').read_text(encoding='utf-8'))
        cleanup(h.HeaderRunner(ar,journal.path.parent,journal,report));return
    pending=h.pending_runs(h.safe.AUDIT)
    if pending:raise RuntimeError('Restore pending run first: '+str(pending[0]))
    folder=h.safe.AUDIT/('header-font-density-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=version:raise RuntimeError('Test APK version mismatch')
    if baseline['settings'].get('ls_augment_systemui_master')!='1':raise RuntimeError('SystemUI master must already be enabled for this isolated clock comparison')
    journal=DensityJournal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':version_name})
    report={'installedVersion':version,'surface':'notification','withWeather':False,'cases':[],'stages':[],
            'status':'running','wholeFeaturePassed':False,'visualReviewRequired':True,
            'profilePlan':'One font1.3 write; portrait -> landscape -> portrait; both clocks 64sp; seconds/period/weather off',
            'limits':['Two equal geometries/diagnostics do not certify pixel identity or requested sp','HSC raw values retained; no new runtime metric instrumentation','No SystemUI restart, clock/date tap, notification scroll or dismissal']}
    runner=DensityRunner(ar,folder,journal,report)
    try:run_session(runner)
    finally:print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data.get('pending'),'configurationRestored':journal.data.get('configurationRestored'),'nativeProfileRestored':journal.data.get('nativeProfileRestored')},ensure_ascii=False))

if __name__=='__main__':main()
