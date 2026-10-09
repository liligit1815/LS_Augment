"""Focused C collector fault checks. Offline only; no ADB/subprocess launch."""
from pathlib import Path
import copy, importlib.util, json, tempfile, time, unittest, sys, types
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('c_icons_under_test',ROOT/'tools/run-safe-statusbar-notification-icons-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)


def journal(folder):
    baseline={m.SYSTEM:'0',m.NOTIFICATIONS:'0',**{'untouched_%03d'%i:'original' for i in range(495)}}
    meta=dict(case='notification-icons',serial='offline',installedVersion=20463,installedVersionName='test20463',
        mainApkSha256='a'*64,testApkSha256='b'*64,observerApkSha256='c'*64,fixtureApkSha256=m.APK_SHA,process={'pid':20209},
        nativeBaseline={'system/font_scale':'1.0','system/user_rotation':'0','system/accelerometer_rotation':'0'},notificationsBefore=[],
        homeComponent='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher',runId='d'*32,
        runtimeSchema={'build':20463,'runtimeKeys':list(baseline)},rawBaseline={k:['string',None,v] for k,v in baseline.items()},clickOwned=False)
    return m.Journal.create(Path(folder)/'restore.json',baseline,meta,{}, {},{})


def source(phase='ready',elapsed=None):
    low,high,glyph,ids=m.PHASES.get(phase,m.PHASES['removed']);elapsed=low*1000+10 if elapsed is None else elapsed
    nonce='a'*32;run='b'*32;tag='duo_c17_icons_'+run
    phases=['ready','arrived','updated','removed'];count=phases.index(phase)+1 if phase in phases else 4
    events=[dict(event=event,phase=p,seq=i+1,elapsedMs=lo*1000+1,ownActiveIds=own,glyph=0 if p=='ready' else 1 if p=='arrived' else 2,
                 notifyStartedMs=lo*1000,notifyReturnedMs=lo*1000+1,cancelStartedMs=0,cancelReturnedMs=0)
        for i,(p,event,lo,own) in enumerate([('ready','ready',0,[]),('arrived','notification_posted',20,[701]),('updated','notification_updated',40,[701]),('removed','notification_removed',60,[])][:count])]
    return dict(mode='notification-icons',fixtureOnly=True,moduleEffectsValidated=False,moduleConfigurationWrites=0,
        runId=run,echoNonce=nonce,package=m.PACKAGE,pid=400,notificationTag=tag,channel=tag,notificationId=701,
        progressPath='/data/user/0/'+m.PACKAGE+'/cache/c17-runtime-fixture/'+run+'.json',seconds=90,
        startedElapsedRealtimeMs=100000,deadlineElapsedRealtimeMs=190000,elapsedMs=elapsed,phase=phase,seq=len(events),
        missedWindow=False,closed=False,timeline=dict(m.TIMELINE),glyph=glyph,smallIconIsActualBitmap=True,
        ownActiveIds=list(ids),remainingOwnNotifications=len(ids),regularNotificationCount=1,
        mediaSessionCreated=False,audioOutput=False,audioFocusRequested=False,contentActivityCallbacks=0,events=events,
        cleanupErrors=[],cleanupComplete=False,error='',progressWriteError='',sourceCountIsNotVisibleStatusBarCount=True)


def fixture(j,identity=True):
    v=source();f=dict(row='0',nonce=v['echoNonce'],seconds=90,timeline=dict(m.TIMELINE),startAttempted=True,cleanupConfirmed=False,
        launchElapsed=100000,maximumFinishElapsed=225000,log='cycle-0-fixture-console-private.txt')
    if identity:f['identity']={k:v[k] for k in m.IDENTITY}
    j.data['fixtureRuns']=[f];j.save();return f


def confirmed(j,values):
    current=j.expected();operation=j.begin(values,current,'actual-offline-transport');operation['transportInvoked']=True;j.save()
    j.acknowledge(values,dict(current,**values))


class Fake(m.Collector):
    def __init__(self,folder,j):
        self.folder=Path(folder);self.journal=j;self.report={'cases':[]};self.events=[];self.ar=self
        self.fixture_proc=None;self.fixture_log=None;self.recovering=False;self.deadline=time.monotonic()+100
        self.current_values=j.expected();self.external_during_protection=False;self.pixel_error=False
    def identity(self,label):self.events.append(('identity',label))
    def config(self,label):self.events.append(('snapshot',label));return dict(self.current_values)
    def protect(self,label,*args):
        self.events.append(('protection',label))
        if self.external_during_protection:self.current_values['untouched_001']='external-change'
    def notifications(self,label,expected=None,strict=True):self.events.append(('notifications',label));return []
    def no_media(self,label):self.events.append(('media',label));return []
    def home(self,label):self.events.append(('home',label))
    def observe(self,label,*args):
        self.events.append(('pixels',label));(self.folder/label).mkdir(exist_ok=True)
        if self.pixel_error:raise m.core.Unobserved('unknown foreground')
        return {}
    def png(self,*args):self.events.append(('png','read'));return {}
    def persist(self):m.atomic(self.folder/'report.json',self.report)
    def instrument(self,op,label,values=None,**kw):
        if self.active_fixture():raise AssertionError('Unsafe main instrumentation')
        self.events.append(('set',dict(values)))
        operation=self.journal.begin(values,kw['current'],label,recovery=kw.get('recovery',False))
        operation['transportInvoked']=True;self.journal.save()
        self.current_values.update(values)
        return {'status':'pass','moduleVersion':20463}


class CCollector(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
    def test_scope_c_is_two_keys_and_never_native_or_assets(self):
        for values in ({m.SYSTEM:'1',m.NOTIFICATIONS:'0'},):self.j.values(values)
        for values in ({m.core.ART:''},{m.SYSTEM:'2'}):
            with self.assertRaises(ValueError):self.j.values(values)
        with self.assertRaises(ValueError):self.j.native_value('system/user_rotation','1')
        altered=copy.deepcopy(self.j.data);altered['metadata']['case']='profiles'
        with self.assertRaises(ValueError):m.Journal(self.j.path,altered)
    def test_real_native_method_uses_base_mro_and_all_five_additions(self):
        calls=[]
        class ReadOnly:
            def shell(self,command,**kwargs):calls.append(command);return 'native:'+command
        reader=m.Collector.__new__(m.Collector);reader.ar=ReadOnly()
        actual=reader.native()
        self.assertEqual('native:settings --user 0 get system font_scale',actual['system/font_scale'])
        self.assertEqual('native:settings get global wifi_on',actual['global/wifi_on'])
        for key,command in [('global/bluetooth_on','settings get global bluetooth_on'),('system/screen_off_timeout','settings get system screen_off_timeout'),
                            ('nightPreference','cmd uimode night'),('density','wm density'),('displaySize','wm size')]:
            self.assertEqual('native:'+command,actual[key])
        self.assertEqual(len(calls),len(set(calls)));self.assertFalse(any(' put ' in c for c in calls))
    def test_real_main_preflight_reaches_validated_c_journal_without_alias_mocks(self):
        saved=json.loads((ROOT/'out/full-function-audit-20261004/statusbar-notification-icons-20463-20261004-171345/baseline/result-private.json').read_text('utf-8'))
        from xml.etree.ElementTree import Element,SubElement,tostring
        tree=Element('map')
        for k,v in saved['settings'].items():SubElement(tree,'string',name=k).text=v
        xml=tostring(tree,encoding='unicode')
        notifications=(ROOT/'out/full-function-audit-20261004/notification-combination-safe-20463-c-original-20261004-155849/original-notification-private.txt').read_text('utf-8')
        calls=[];created=[]
        class ReachedJournal(Exception):pass
        def shell(command,**kwargs):
            calls.append(command)
            if command=='dumpsys package '+m.APP:return 'versionCode=20463 versionName=test20463'
            if command.startswith('cat '+m.base.APP+'shared_prefs/ls_augment_config_v2.xml'):return xml
            if command=='dumpsys notification':return notifications
            if command.startswith('cmd package resolve-activity'):return 'com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher'
            if command.startswith('settings'):
                return '1.0' if command.endswith('font_scale') else '0'
            if command in ('cmd uimode night','wm density','wm size'):return 'read-only-native'
            if command.startswith('if test -f '+m.base.NAMES):return 'ABSENT'
            if command.startswith('if test -'):return ''
            raise AssertionError('Unexpected preflight command: '+command)
        ar=types.SimpleNamespace(SERIAL='offline',OUTPUT=None,shell=shell,instrument=lambda op,label:saved)
        original=m.Journal.create
        def create(*args,**kwargs):
            j=original(*args,**kwargs);created.append(j);raise ReachedJournal()
        test_apk=Path(self.tmp.name)/'test.apk';test_apk.write_bytes(b'offline-test-apk')
        def package_hash(ar,package):return m.base.digest(test_apk.read_bytes()) if package==m.APP+'.test' else m.APK_SHA if package==m.PACKAGE else 'a'*64
        argv=['collector','--run','--expected-version','20463','--runtime-schema',str(ROOT/'out/integration-20463/runtime-schema/schema.json'),'--test-apk',str(test_apk)]
        with patch.dict(sys.modules,{'adb_regression':ar}),patch.object(sys,'argv',argv),patch.object(m.extra,'gates'),patch.object(m.extra.safe,'AUDIT',Path(self.tmp.name)), \
             patch.object(m.rows,'package_hash',side_effect=package_hash),patch.object(m.rows,'strong_identity',return_value={'pid':20209}),patch.object(m.Journal,'create',side_effect=create):
            with self.assertRaises(ReachedJournal):m.main()
        self.assertEqual(1,len(created));j=created[0];self.assertEqual(497,len(j.data['baseline']))
        self.assertEqual('0',j.data['metadata']['nativeBaseline']['global/bluetooth_on'])
        self.assertEqual('read-only-native',j.data['metadata']['nativeBaseline']['density'])
        self.assertEqual({},j.data['restore']);self.assertNotIn('fixtureRuns',j.data)
        self.assertFalse(any('am instrument' in x or ' put ' in x for x in calls))
    def test_source_accepts_four_actual_phases_without_deriving_slot_count(self):
        for phase in m.PHASES:
            v=source(phase);m.validate_source(v,'a'*32);m.phase_valid(v,100000+v['elapsedMs']+1,phase)
        self.assertTrue(source('arrived')['sourceCountIsNotVisibleStatusBarCount'])
    def test_foreign_nonce_id_path_pid_generation_rejected(self):
        v=source('updated');identity={k:v[k] for k in m.IDENTITY}
        for key,value in [('echoNonce','c'*32),('notificationId',702),('progressPath','/tmp/other'),('pid',401),('deadlineElapsedRealtimeMs',191000),('timeline',{'postAfter':10})]:
            with self.subTest(key=key):
                bad=copy.deepcopy(v);bad[key]=value
                with self.assertRaises(m.core.Unobserved):m.validate_source(bad,'a'*32,identity)
    def test_phase_edge_and_stale_heartbeat_do_not_catch_up(self):
        v=source('arrived',39999);m.phase_valid(v,139999,'arrived')
        with self.assertRaises(m.core.Unobserved):m.phase_valid(v,140000,'arrived')
        for key,value in [('missedWindow',True),('glyph','white-cross-48-v1'),('ownActiveIds',[]),('phase','updated')]:
            bad=copy.deepcopy(v);bad[key]=value
            with self.assertRaises(m.core.Unobserved):m.phase_valid(bad,139999,'arrived')
        v=source('arrived',21000)
        with self.assertRaises(m.core.Unobserved):m.phase_valid(v,123501,'arrived')
    def test_actual_phase_capture_keeps_png_if_source_advances_during_capture(self):
        fixture(self.j);c=Fake(self.tmp.name,self.j);c.quick_identity=lambda label:None
        c.raw_settings=lambda label:c.current_values;c.shell=lambda *a,**kw:'mWakefulness=Awake'
        values=iter([(source('arrived',39999),139999),(source('updated'),140010)])
        c.source=lambda:next(values)
        def image(folder,label):
            (folder/(label+'.png')).write_bytes(b'raw-offline-frame')
            return dict(size=(1216,2688),start=1,end=2,sha256='actual-png-placeholder')
        c.png=image
        with self.assertRaises(m.core.Unobserved):c.phase_capture('arrived')
        row=json.loads((c.folder/'cycle-0-arrived/observation.json').read_text('utf-8'))
        self.assertEqual(1,len(row['frames']));self.assertFalse(row['frames'][0]['phaseValidated'])
        self.assertEqual('updated',row['frames'][0]['sourceAfter']['phase']);self.assertFalse(row['visualPass'])
        self.assertTrue((c.folder/'cycle-0-arrived/frame-00.png').exists())
    def test_missing_event_or_sequence_rejected(self):
        for edit in ('duplicate','early','hole'):
            v=source('updated')
            if edit=='duplicate':v['events'].append(copy.deepcopy(v['events'][-1]))
            if edit=='early':v['events'][-1]['elapsedMs']=30000
            if edit=='hole':v['events'][0]['seq']=2
            with self.assertRaises(m.core.Unobserved):
                m.validate_source(v,'a'*32);m.phase_valid(v,140011,'updated')
    def test_actual_arrival_waits_only_for_own_heartbeat_without_repost(self):
        fixture(self.j);c=Fake(self.tmp.name,self.j);early=source('arrived',20001);early['ownActiveIds']=[];early['remainingOwnNotifications']=0
        values=iter([(early,120001),(source('arrived',21000),121000)]);c.source=lambda:next(values)
        with patch.object(m.time,'sleep'):observed=c.await_phase('arrived')
        self.assertEqual([701],observed['ownActiveIds']);self.assertEqual(1,len(c.report['sourceSettleObservations']))
        self.assertEqual([],c.events)
    def test_notification_partition_checks_complete_real_dump_not_count_only(self):
        path=ROOT/'out/full-function-audit-20261004/notification-combination-safe-20463-c-original-20261004-155849/original-notification-private.txt'
        raw=path.read_text('utf-8');own,external=m.partition(raw)
        self.assertEqual([],own);self.assertGreater(len(external),3)
        records=[['other.app','UserHandle{0}','10','null','original'],[m.PACKAGE,'UserHandle{0}','701','duo_c17_icons_'+'b'*32,'owned']]
        with patch.object(m.clear,'notification_records',return_value=records):
            own,external=m.partition('',source());self.assertEqual(1,len(own));self.assertEqual(1,len(external))
            with self.assertRaises(m.core.Unobserved):m.partition('')
            records[-1][3]='other-run'
            with self.assertRaises(m.core.Unobserved):m.partition('',source())
    def test_active_guard_precedes_every_main_instrumentation_operation(self):
        fixture(self.j);c=Fake(self.tmp.name,self.j)
        for op in ('snapshot','set','statusbar-assets-runtime'):
            with patch.object(m.rows.Collector,'instrument',side_effect=AssertionError('transport reached')):
                with self.assertRaises(m.core.Unobserved):m.Collector.instrument(c,op,'blocked',{m.SYSTEM:'0'} if op=='set' else None)
    def test_unknown_launch_is_not_allowed_to_restore_before_cleanup(self):
        fixture(self.j,False);c=Fake(self.tmp.name,self.j)
        with patch.object(c,'finish_fixture',side_effect=m.core.Unobserved('source not confirmed')):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertFalse(any(e[0] in ('set','snapshot') for e in c.events));self.assertTrue(self.j.data['pending'])
    def test_log_adoption_refuses_old_source_with_same_timeline_but_other_nonce(self):
        f=fixture(self.j,False);c=Fake(self.tmp.name,self.j);v=source();v['echoNonce']='c'*32
        (c.folder/f['log']).write_text('INSTRUMENTATION_STATUS: c17Fixture='+json.dumps(v),encoding='utf-8')
        with self.assertRaises(m.core.Unobserved):c.adopt_source()
        self.assertNotIn('identity',f)
    def test_unknown_launch_can_only_finish_after_fixed_bound_and_two_zero_reads(self):
        fixture(self.j,False);c=Fake(self.tmp.name,self.j);c.elapsed=lambda:225000;c.adopt_source=lambda:False
        raw=(ROOT/'out/full-function-audit-20261004/notification-combination-safe-20463-c-original-20261004-155849/fixture-ended-activity-private.txt').read_text('utf-8')
        c.shell=lambda command,**kw:raw
        with patch.object(m.time,'sleep'):c.finish_fixture()
        self.assertTrue(self.j.data['fixtureRuns'][0]['cleanupConfirmed']);self.assertFalse(self.j.data['fixtureRuns'][0]['sourceRunConfirmed'])
        self.assertEqual(2,sum(x[0]=='notifications' for x in c.events));self.assertEqual(2,sum(x[0]=='media' for x in c.events))
    def test_actual_instrumentation_busy_keeps_cleanup_pending(self):
        fixture(self.j,False);c=Fake(self.tmp.name,self.j);c.elapsed=lambda:225000;c.adopt_source=lambda:False;c.shell=lambda *a,**kw:'saved full process dump'
        with patch.object(m.extra,'idle_instrumentation',return_value=False):
            with self.assertRaises(m.core.Unobserved):c.finish_fixture()
        self.assertFalse(self.j.data['fixtureRuns'][0]['cleanupConfirmed']);self.assertEqual([],c.events)
    def test_restore_external_original_is_not_adopted(self):
        confirmed(self.j,{m.SYSTEM:'1',m.NOTIFICATIONS:'1'});c=Fake(self.tmp.name,self.j);c.current_values[m.SYSTEM]='0'
        with patch.object(m.extra,'gates'),patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        sets=[x[1] for x in c.events if x[0]=='set'];self.assertEqual([{m.NOTIFICATIONS:'0'}],sets)
        self.assertEqual({m.SYSTEM:'0'},self.j.data['externalValuesPreserved']);self.assertTrue(self.j.data['pending'])
    def test_restore_ack_loss_keeps_durable_actual_transport_authority(self):
        confirmed(self.j,{m.SYSTEM:'1'});operation=self.j.begin({m.SYSTEM:'0'},self.j.expected(),'restore-crash',recovery=True)
        operation['transportInvoked']=True;self.j.save();self.j=m.Journal(self.j.path)
        c=Fake(self.tmp.name,self.j);c.current_values[m.SYSTEM]='0'
        with patch.object(m.extra,'gates'),patch.object(m.time,'sleep'):c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
    def test_external_change_during_slow_final_protection_is_terminal_failure(self):
        confirmed(self.j,{m.SYSTEM:'1'});c=Fake(self.tmp.name,self.j);c.external_during_protection=True
        with patch.object(m.extra,'gates'),patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertEqual('snapshot',c.events[-1][0]);self.assertEqual('snapshot',c.events[-2][0])
        self.assertFalse(self.j.data['configurationRestored']);self.assertTrue(self.j.data['pending'])
    def test_pixel_failure_does_not_fake_pixel_pass_or_block_exact_restore(self):
        confirmed(self.j,{m.NOTIFICATIONS:'1'});c=Fake(self.tmp.name,self.j);c.pixel_error=True
        with patch.object(m.extra,'gates'),patch.object(m.time,'sleep'):c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored']);self.assertIn('unknown foreground',self.j.data['restoredPixelError'])
        self.assertFalse(c.report['wholeFeaturePassed'])
    def test_optional_click_rejects_title_and_label_without_nonce_or_tag_marker(self):
        v=source('updated');row=dict(class_='x',enabled=True,clickable=True,children=[
            {'visible':True,'text':'Duo 单通知图标 · 十字更新'},
            {'visible':True,'id':'android:id/app_name','text':m.APP_LABEL},
            {'visible':True,'text':'本次单通知图标验证，图标 2'}])
        row['class']='com.android.systemui.statusbar.notification.row.ExpandableNotificationRow'
        with self.assertRaises(m.core.Unobserved):m.click_row([{'root':row}],'','',(1216,2688),v,[[m.PACKAGE,'0','701',v['notificationTag'],'key']],20209)
    def test_two_run_order_nonce_and_fixed_finish_are_journal_invariants(self):
        f=fixture(self.j)
        for change in ({'row':'1'},{'maximumFinishElapsed':226000},{'seconds':91}):
            d=copy.deepcopy(self.j.data);d['fixtureRuns'][0].update(change)
            with self.assertRaises(ValueError):m.Journal(self.j.path,d)
        d=copy.deepcopy(self.j.data);second=copy.deepcopy(f);second.update(row='1',log='cycle-1-fixture-console-private.txt');d['fixtureRuns'].append(second)
        with self.assertRaises(ValueError):m.Journal(self.j.path,d)


if __name__=='__main__':unittest.main(verbosity=2)
