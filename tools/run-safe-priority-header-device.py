"""Finite native CONTROL header retention audit. No tile taps or native writes."""
from pathlib import Path
import argparse, datetime, importlib.util, json, re, time, traceback, uuid

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('priority_header_reviewed_ui',ROOT/'tools/run-safe-priority-ui-device.py')
ui=importlib.util.module_from_spec(spec);spec.loader.exec_module(ui)
icons,rows,core,base,extra=ui.icons,ui.rows,ui.core,ui.base,ui.extra
atomic,difference=core.atomic,core.difference
PR,LIMIT,ORDER,KEYS,IDS,APP=ui.PR,ui.LIMIT,ui.ORDER,ui.KEYS,ui.IDS,ui.APP
SURFACE='control';SYSTEMUI='com.android.systemui'
DIAG='ls_augment_statusbar_hint_priority_runtime'
INPUTS={'input keyevent KEYCODE_HOME','cmd statusbar collapse','cmd statusbar expand-settings'}


def prerequisites(settings):
    if len(settings)!=497 or not all(isinstance(k,str) and isinstance(v,str) for k,v in settings.items()):raise core.Unobserved('Full497 string baseline required')
    if settings.get('ls_augment_systemui_master') not in ('1','true'):raise core.Unobserved('Existing master inactive; no test enabling')
    if settings.get('ls_augment_statusbar_position_size_only')!='0':raise core.Unobserved('Position-only bypasses priority; not a non-grid test substitute')
    if not all(ui.valid_value(k,settings.get(k)) for k in KEYS):raise core.Unobserved('Noncanonical original priority values')


class Journal(core.Journal):
    KIND='safe-priority-native-header'
    def validate(self):
        d=self.data;m=d.get('metadata',{});b=d.get('baseline',{})
        if d.get('kind')!=self.KIND or d.get('schema')!=1 or m.get('case')!='priority-native-header' or m.get('surface')!=SURFACE:raise ValueError('Foreign native-header journal')
        prerequisites(b)
        required=('serial','installedVersion','installedVersionName','mainApkSha256','testApkSha256','observerApkSha256','process','nativeBaseline','notificationsBefore','homeComponent','runId','rawBaseline','runtimeSchema')
        if any(k not in m for k in required):raise ValueError('Incomplete exact baseline')
        if not isinstance(m['nativeBaseline'],dict) or 'system/font_scale' not in m['nativeBaseline']:raise ValueError('Native profile absent')
        if any(not isinstance(d.get(k),dict) for k in ('resourcesBefore','namesBefore','targets')) or d['targets']:raise ValueError('Resources immutable')
        for field in ('restore','confirmed','inflight'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=KEYS:raise ValueError('Foreign key')
        if not set(d['confirmed'])<=d['restore'].keys() or not set(d['inflight'])<=d['restore'].keys():raise ValueError('Ownership lacks original')
        if any(v!=b[k] for k,v in d['restore'].items()):raise ValueError('Altered original')
        for k,v in d['confirmed'].items():self.values({k:v})
        for k,values in d['inflight'].items():
            if not isinstance(values,list) or len(values)!=2:raise ValueError('Invalid inflight')
            for v in values:self.values({k:v})
        if any(d.get(k)!={} for k in ('nativeRestore','nativeConfirmed','nativeInflight')):raise ValueError('Native writes forbidden')
    def values(self,values):
        if not values or not set(values)<=KEYS or not all(ui.valid_value(k,v) for k,v in values.items()):raise ValueError('Only three priority keys')
    def native_value(self,*args):raise ValueError('Native profile immutable')


def header(windows,size):
    if size[0]>=size[1]:raise core.Unobserved('Original portrait required; no rotation or guessed landscape surface')
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1 or focused[0].get('root',{}).get('package')!=SYSTEMUI:raise core.Unobserved('Unique actual SystemUI focus required')
    w=focused[0];full=(0,0,*size)
    if core.rect(w['bounds'])!=full or core.rect(w['root']['bounds'])!=full:raise core.Unobserved('Window/root does not match actual PNG')
    visible=[n for n,_ in core.walk(w['root']) if n.get('visible')]
    def unique(nodes,name):
        matched=[n for n in nodes if n.get('id')==SYSTEMUI+':id/'+name]
        if len(matched)!=1:raise core.Unobserved('Unique visible '+name+' absent')
        return matched[0]
    if any(n.get('id')==SYSTEMUI+':id/notification_panel' for n in visible):raise core.Unobserved('Wrong/mixed notification surface')
    panel=unique(visible,'control_panel');nodes=[n for n,_ in core.walk(panel) if n.get('visible')]
    h=unique(nodes,'cc_header');hn=[n for n,_ in core.walk(h) if n.get('visible')]
    status=unique(hn,'statusIcons')
    if not core.inside(core.rect(status['bounds']),core.rect(h['bounds'])):raise core.Unobserved('Native icon row clipped outside header')
    geometry=[{k:n.get(k) for k in ('id','class','bounds','text','description','visible')} for n,_ in core.walk(h)]
    return dict(panel=panel['bounds'],header=h['bounds'],statusIcons=status['bounds'],geometry=geometry)


class HeaderNotReady(core.Unobserved):
    """Only a verified native control window may wait for its measured children."""


def control_owner(ob,system_pid):
    """Exact ROM title; never rewrite native evidence to impersonate another title."""
    windows,native,wm,size=ob['windows'],ob['native'],ob['wm'],ob['size']
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1:raise core.Unobserved('No unique control owner')
    w=focused[0];full=(0,0,*size)
    if w.get('type')!=3 or w.get('root',{}).get('package')!=SYSTEMUI or core.focus_title(native)!='control_center':raise core.Unobserved('Exact native control_center foreground required')
    if core.rect(w.get('bounds'))!=full or core.rect(w['root'].get('bounds'))!=full:raise core.Unobserved('Control tree/root/PNG frame mismatch')
    records=core.window_records(wm)
    matches=[x for x in records if x['title']=='control_center' and x['package']==SYSTEMUI and x['bounds']==full]
    if len(matches)!=1 or matches[0]['pid']!=int(system_pid):raise core.Unobserved('Exact loaded SystemUI control window unavailable')
    target=matches[0]
    # Same overlap rules as core.owner for non-coordinate navigation, with the
    # additional exact control title + current SystemUI PID + full-frame proof.
    for other in records:
        if other is target or not core.overlaps(other['bounds'],full):continue
        if other['rank']>target['rank'] and other['base']+other['sub']<=target['base']+target['sub']:continue
        if core.native_edge(other,size,system_pid):continue
        if other['notTouchable'] and other['pid']==int(system_pid) and other['package']==SYSTEMUI and other['title'] in (
                'ScreenDecorHwcOverlay','ScreenDecorOverlay','ScreenDecorOverlayTop','ScreenDecorOverlayBottom'):continue
        raise core.Unobserved('Intersecting surface above/unknown relative to control')
    return w


def measured_header(ob):
    """No retry classification for foreign/ambiguous pages; call owner first."""
    focused=[w for w in ob['windows'] if w.get('active') and w.get('focused')]
    if len(focused)!=1:raise core.Unobserved('Ambiguous control tree')
    visible=[n for n,_ in core.walk(focused[0]['root']) if n.get('visible')]
    if any(n.get('id')==SYSTEMUI+':id/notification_panel' for n in visible):raise core.Unobserved('Unexpected notification page')
    current=visible
    for identity in ('control_panel','cc_header','statusIcons'):
        found=[n for n in current if n.get('id')==SYSTEMUI+':id/'+identity]
        if len(found)>1:raise core.Unobserved('Ambiguous visible native '+identity)
        if not found:raise HeaderNotReady('Native '+identity+' not visible yet')
        bounds=core.rect(found[0]['bounds'])
        if bounds[2]<=bounds[0] or bounds[3]<=bounds[1]:raise HeaderNotReady('Native '+identity+' not measured yet')
        current=[n for n,_ in core.walk(found[0]) if n.get('visible')]
    return header(ob['windows'],ob['size'])


def fresh_inventory(inv,after):
    rt=inv.get('runtime',{})
    if not isinstance(inv.get('session'),str) or not inv['session']:raise core.Unobserved('Inventory session absent')
    if inv.get('surfaceObservedAt',{}).get(SURFACE,0)<after or SURFACE not in inv.get('observedSurfaces',[]) or rt.get('activeSurface')!=SURFACE or rt.get('enabled') is not True or rt.get('interactive') is not True:raise core.Unobserved('No fresh active control inventory')
    entries=inv.get('surfaces',{}).get(SURFACE)
    if not isinstance(entries,list) or any(r.get('surface')!=SURFACE for r in entries):raise core.Unobserved('Foreign inventory surface')
    return entries


def priority_diag(raw):
    result={}
    for part in (raw or '').split(';'):
        if '=' not in part:continue
        k,v=part.split('=',1)
        if k in result:raise core.Unobserved('Ambiguous priority diagnostic')
        result[k]=v
    if result.get('surface')!=SURFACE or not re.fullmatch(r'\d+',result.get('limit','')) or not re.fullmatch(r'\d+',result.get('eligible','')):return None
    return dict(surface=SURFACE,limit=int(result['limit']),eligible=int(result['eligible']),retained=[x for x in result.get('retained','').split(',') if x],excluded=[x for x in result.get('excluded','').split(',') if x],perKeyFreshnessProven=False)


def sources(entries):
    result={}
    for r in entries:
        if r.get('id') not in IDS or r.get('state')!='visible' or r.get('coveredBy') or r.get('application') not in ('native','native_unmapped','applied'):continue
        if not r.get('instance') or not isinstance(r.get('states'),list):continue
        result.setdefault(r['id'],[]).append(r)
    return {k:v[0] for k,v in result.items() if len(v)==1}


def candidates(off,discovery,raw_diag):
    d=priority_diag(raw_diag)
    if d is None or d['limit']!=0 or d['eligible']<3:raise core.Unobserved('Control eligible count unavailable; no substitute icons')
    a,b=sources(off),sources(discovery)
    retained=set(d['retained'])
    chosen=[i for i in IDS if i in a and i in b and i in retained and a[i]['states']==b[i]['states']]
    if len(chosen)<3:raise core.Unobserved('Fewer than three same-state native visible candidates at original capacity')
    return chosen[:3]


def matrix(chosen,original_order):
    if len(chosen)!=3 or len(set(chosen))!=3 or not set(chosen)<=set(IDS):raise ValueError('Exactly three actual distinct sources')
    phases=[]
    for i in chosen:
        others=[x for x in chosen if x!=i]
        ranked=','.join([i,*others,*[x for x in ui.order(original_order) if x not in chosen]])
        phases.append(('limit1-'+i,{PR:'1',LIMIT:'1',ORDER:ranked}))
    ranked=phases[0][1][ORDER]
    return phases+[('limit2',{PR:'1',LIMIT:'2',ORDER:ranked}),('limit0',{PR:'1',LIMIT:'0',ORDER:original_order}),('priority-off-again',{PR:'0',LIMIT:'0',ORDER:original_order})]


class Collector(base.Collector):
    native=icons.Collector.native;identity=rows.Collector.identity;protect=rows.Collector.protect
    raw_settings=rows.Collector.raw_settings;assert_config=rows.Collector.assert_config;config=rows.Collector.config
    set=rows.Collector.set;diagnostic=rows.Collector.diagnostic;png=icons.Collector.png;observe=icons.Collector.observe
    notifications=ui.Collector.notifications
    def __init__(self,*args):
        super().__init__(*args);self.deadline=time.monotonic()+1200;self.recovering=False
        rows.font.validate_schema(self.journal.data['metadata']['runtimeSchema'],self.journal.data['metadata']['installedVersion'],self.journal.data['baseline'])
    def bounded(self):
        if not self.recovering and time.monotonic()>self.deadline:raise core.Unobserved('Finite native-header batch expired')
    def instrument(self,operation,label,values=None,**kwargs):
        if operation not in ('snapshot','set','statusbar-assets-runtime'):raise ValueError('Unreviewed test operation')
        if operation=='set':self.journal.values(values)
        return rows.Collector.instrument(self,operation,label,values,**kwargs)
    def action(self,label,command,ob):
        self.bounded()
        if command not in INPUTS:raise ValueError('No tile, notification, editor, radio or coordinate input')
        return core.invoke_logged(self.folder/(label+'-action.json'),command,lambda:self.ar.shell(command,timeout=20),ob['started'],time.monotonic()+2.5 if self.recovering else self.deadline)
    def unlocked(self):
        state=rows.keyguard(self.ar.shell('dumpsys window policy'))
        if state['showing'] or state['occluded']:raise core.Unobserved('Already unlocked unobscured device required')
    def owner(self,ob):
        return control_owner(ob,self.journal.data['metadata']['process']['pid'])
    def wait_header(self,label):
        # Observation only: never repeat expansion or tolerate a foreign owner.
        deadline=time.monotonic()+16;previous=None;history=[]
        for attempt in range(4):
            self.bounded()
            if time.monotonic()>deadline:break
            name=label+'-ready-'+str(attempt);ob=self.observe(name)
            item=dict(observation=name,interval=ob['interval'],status='checking');history.append(item)
            try:
                self.owner(ob)
                if time.monotonic()>deadline:raise core.Unobserved('Control readiness deadline expired')
                geometry=measured_header(ob);signature={k:geometry[k] for k in ('panel','header','statusIcons')}
                item.update(status='geometry-candidate',geometry=signature)
                if signature==previous:
                    item['status']='two-consecutive-measured-headers'
                    return ob
                previous=signature
            except HeaderNotReady as error:
                previous=None;item.update(status='known-control-not-ready',reason=str(error))
            except BaseException as error:
                item.update(status='rejected-without-retry',reason=repr(error));raise
            finally:
                atomic(self.folder/(label+'-readiness.json'),dict(maxObservations=4,deadline=deadline,observations=history,additionalInputs=0,pixelPass=False))
            if attempt<3:time.sleep(.35)
        raise core.Unobserved('Measured control header did not stabilize within four observations/16 seconds')
    def home(self,label):
        self.unlocked();ob=self.observe(label+'-before');m=self.journal.data['metadata'];home=m['homeComponent']
        focused=[w for w in ob['windows'] if w.get('active') and w.get('focused')]
        if len(focused)!=1:raise core.Unobserved('Ambiguous input surface')
        if focused[0].get('root',{}).get('package')==SYSTEMUI:
            self.owner(ob);header(ob['windows'],ob['size']);self.action(label+'-collapse','cmd statusbar collapse',ob)
            time.sleep(.45);self.unlocked();ob=self.observe(label+'-after-collapse')
        title=core.focus_title(ob['native'])
        allowed={home,APP+'/.SettingsActivity',APP+'/'+APP+'.SettingsActivity'}
        core.native_owner(ob['native'],ob['wm'],ob['size'],allowed,m['process']['pid'])
        core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{APP,home.split('/')[0]},navigation_pid=m['process']['pid'])
        if title!=home:
            self.action(label+'-home','input keyevent KEYCODE_HOME',ob);time.sleep(.45)
            self.unlocked();ob=self.observe(label+'-home-confirmed')
        core.native_owner(ob['native'],ob['wm'],ob['size'],{home},m['process']['pid'])
        core.owner(ob['windows'],ob['native'],ob['wm'],ob['size'],{home.split('/')[0]},navigation_pid=m['process']['pid'])
        return ob
    def open_control(self,label):
        ob=self.home(label+'-home')
        # Inventory may only postdate the confirmed closed panel. This final
        # read counts against, and never resets, the 2.5-second input deadline.
        opened=int(self.ar.shell('date +%s%3N'))
        self.action(label+'-expand','cmd statusbar expand-settings',ob);time.sleep(.45)
        self.wait_header(label+'-entered')
        return opened
    def inventory(self,label,after):
        last=None
        for i in range(4):
            self.bounded();inv=self.instrument('statusbar-assets-runtime',label+'-inventory-'+str(i))['statusbarRuntime'].get('inventory') or {}
            try:fresh_inventory(inv,after);return inv
            except core.Unobserved as error:last=error
            if i<3:time.sleep(2)
        raise last
    def capture(self,label):
        self.bounded();self.identity(label);self.protect(label);self.notifications(label);self.assert_config(self.raw_settings(label+'-before'))
        opened=self.open_control(label);inv=self.inventory(label,opened)
        ob=self.observe(label+'-observed');self.owner(ob);geometry=header(ob['windows'],ob['size'])
        folder=self.folder/(label+'-observed');frames=[]
        for i in range(2):
            self.bounded();frame=self.png(folder,'frame-%02d'%i);frame['file']='frame-%02d.png'%i;frames.append(frame)
            if tuple(frame['size'])!=tuple(ob['size']):raise core.Unobserved('PNG orientation/size changed during phase')
            if i==0:time.sleep(.45)
        diag=self.diagnostic(label);current=self.raw_settings(label+'-after');self.assert_config(current)
        evidence=dict(label=label,surface=SURFACE,openedAfterWall=opened,inventory=inv,geometry=geometry,interval=ob['interval'],frames=frames,
            values={k:current[k] for k in KEYS},diagnostic=diag.get(DIAG),diagnosticDecoded=priority_diag(diag.get(DIAG)),
            diagnosticPerKeyTimestampAvailable=False,visualPass=False,pixelReviewRequired=True,physicalOrderNotAnExpectedResult=True)
        atomic(folder/'evidence.json',evidence);self.report['cases'].append(evidence);self.persist();return evidence
    def phase(self,label,values):
        self.home(label+'-pre-save');self.set(label,values);return self.capture(label)
    def exercise(self):
        original=self.journal.data['baseline'];self.capture('original')
        off=self.phase('priority-off',{PR:'0'});offrows=fresh_inventory(off['inventory'],off['openedAfterWall'])
        discovered=self.phase('discovery-limit0',{PR:'1',LIMIT:'0',ORDER:original[ORDER]})
        if off['inventory']['session']!=discovered['inventory']['session']:raise core.Unobserved('Source inventory generation changed before selection')
        selected=candidates(offrows,fresh_inventory(discovered['inventory'],discovered['openedAfterWall']),discovered['diagnostic'])
        baseline_sources={i:sources(offrows)[i] for i in selected}
        self.report['selectedSources']=dict(ids=selected,rows=baseline_sources,inventorySession=discovered['inventory']['session'],eligibilityEvidence='same-surface visible source + eligible/retained diagnostic; ink pending',noStateFabrication=True);self.persist()
        for label,values in matrix(selected,original[ORDER]):
            evidence=self.phase(label,values)
            if evidence['inventory']['session']!=discovered['inventory']['session']:raise core.Unobserved('Inventory generation changed')
            # Suppressed candidates legitimately become hidden. Check their native
            # state evidence across all inventory entries; do not demand visibility.
            allrows=evidence['inventory']['surfaces'][SURFACE]
            for identity in selected:
                matches=[r for r in allrows if r.get('id')==identity]
                if len(matches)!=1 or matches[0].get('states')!=baseline_sources[identity]['states']:raise core.Unobserved('Real source changed; no retention-only attribution')
        self.report['status']='native-header-observed-pixel-review-pending';self.persist()
    def restore(self):
        self.recovering=True;d=self.journal.data;d.update(pending=True,configurationRestored=False);self.journal.save()
        errors=[];external={};terminal=[];identity_ok=False;pixel_error=None
        try:
            self.identity('recovery-identity');identity_ok=True
            current=self.config('recovery-before');external.update(self.journal.settle_inflight(current));changes={}
            for k,v in d['restore'].items():
                if self.journal.owns(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:
                self.instrument('set','recovery-set',changes,tracked=True,current=current,recovery=True)
                self.journal.acknowledge(changes,self.config('recovery-readback'),recovery=True)
            if external:errors.append('Latest ownership conflict preserved')
        except BaseException as error:errors.append(repr(error))
        if identity_ok:
            try:self.capture('restored-control');self.home('restored-home')
            except BaseException as error:pixel_error=repr(error)
            try:self.identity('recovery-final');self.protect('recovery-final',d['metadata']['nativeBaseline']);self.notifications('recovery-final')
            except BaseException as error:errors.append(repr(error))
            try:
                for i in range(2):
                    terminal.append(difference(d['baseline'],self.config('recovery-terminal-'+str(i))))
                    if i==0:time.sleep(.4)
                if any(terminal):errors.append('Terminal full497 differs')
            except BaseException as error:errors.append(repr(error))
        d.update(terminalDifferences=terminal,configurationRestored=len(terminal)==2 and not any(terminal) and not external,cleanupErrors=errors,pending=bool(errors),restoredPixelError=pixel_error)
        self.journal.save();self.report.update(configurationRestored=d['configurationRestored'],restorePending=d['pending'],cleanupErrors=errors,restoredPixelError=pixel_error,wholeFeaturePassed=False);self.persist()
        if errors:raise core.Unobserved('Exact recovery pending')


def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--surface',choices=[SURFACE],default=SURFACE)
    parser.add_argument('--expected-version',required=True,type=int);parser.add_argument('--runtime-schema',type=Path)
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    if args.run and not args.runtime_schema:parser.error('--run requires runtime schema')
    import adb_regression as ar
    restore=args.restore_only
    if restore and restore.is_dir():restore=restore/'restore.json'
    extra.gates(ar,restore);code,name=base.version(ar.shell('dumpsys package '+APP))
    if code!=args.expected_version:raise core.Unobserved('Explicit installed build differs')
    if restore:
        journal=Journal(restore);m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (code,name)!=(m['installedVersion'],m['installedVersionName']):raise core.Unobserved('Original device/build changed')
        path=restore.parent/'report.json';report=json.loads(path.read_text('utf-8')) if path.exists() else dict(cases=[],status='reconstructed-recovery')
        Collector(ar,restore.parent,journal,report).restore();return
    schema=json.loads(args.runtime_schema.read_text('utf-8'));testhash=base.digest(args.test_apk.read_bytes())
    if rows.package_hash(ar,APP+'.test')!=testhash:raise core.Unobserved('Installed TestAPK differs')
    folder=extra.safe.AUDIT/('priority-native-control-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    initial=ar.instrument('snapshot','baseline')
    if initial.get('status')!='pass' or initial.get('moduleVersion')!=code:raise core.Unobserved('Baseline invalid')
    settings=initial['settings'];prerequisites(settings);rows.font.validate_schema(schema,code,settings)
    reader=Collector.__new__(Collector);reader.ar=ar;resources,names,native=reader.resources(),reader.names(),reader.native()
    raw=ar.shell('cat '+base.APP+'shared_prefs/ls_augment_config_v2.xml',root=True);raw_baseline=rows.raw_preferences(raw)
    if rows.resolve_raw(raw_baseline,raw_baseline,settings)!=settings:raise core.Unobserved('Raw/full497 disagree')
    notifications=rows.clear.notification_records(ar.shell('dumpsys notification',timeout=40))
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    metadata=dict(case='priority-native-header',surface=SURFACE,serial=ar.SERIAL,installedVersion=code,installedVersionName=name,mainApkSha256=rows.package_hash(ar,APP),testApkSha256=testhash,
        observerApkSha256=rows.package_hash(ar,'ls.augment.regression.ui'),process=rows.strong_identity(ar,name),nativeBaseline=native,
        notificationsBefore=notifications,homeComponent=home,runId=uuid.uuid4().hex,runtimeSchema=schema,rawBaseline=raw_baseline,collectorSha256=base.digest(Path(__file__).read_bytes()))
    journal=Journal.create(folder/'restore.json',settings,metadata,resources,names,{})
    report=dict(case='priority-native-header',surface=SURFACE,installedVersion=code,cases=[],status='prepared',mutableKeys=sorted(KEYS),nativeMutableKeys=[],wholeFeaturePassed=False,
        limits=['Retention only, never physical reordering','Each surface requires its own real baseline; notification not implemented in this release',
                'No radio, media, privacy, notification source, neighbors, font or profile manipulation','Diagnostic is deduplicated and has no per-key freshness timestamp; PNG review mandatory'])
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise()
    except BaseException as error:report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:print(json.dumps(dict(report=str(folder/'report.json'),pending=journal.data['pending'])))


if __name__=='__main__':main()
