"""Offline adversarial ownership, restore and real saved-window replay; no ADB."""
from pathlib import Path
import copy
import importlib.util
import json
import struct
import tempfile
import time
import unittest
from unittest.mock import patch

import statusbar_rows_closure_core as core

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('rows_under_test',ROOT/'tools/run-safe-statusbar-rows-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)


def baseline():
    return dict({core.SYSTEM:'0',core.NOTIFICATIONS:'0',core.ART:'',core.FONT:''},
                **{'untouched_%03d'%i:'original' for i in range(493)})


def journal(folder, case='profiles'):
    b=baseline();meta=dict(case=case,serial='offline',installedVersion=20463,installedVersionName='test20463',
        mainApkSha256='a'*64,testApkSha256='b'*64,observerApkSha256='c'*64,process={'pid':20209},
        nativeBaseline={'system/font_scale':'1.0','system/user_rotation':'0','system/accelerometer_rotation':'0','global/wifi_on':'1'},notificationsBefore=[],
        homeComponent='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher',runId='d'*32,
        runtimeSchema={'build':20463,'runtimeKeys':list(b)},rawBaseline={k:['string',None,v] for k,v in b.items()})
    return core.Journal.create(Path(folder)/'restore.json',b,meta,{}, {},m.font.targets(b) if case==core.CASES[0] else {})


def confirmed(j, values, native=False):
    current=j.expected(native);op=j.begin(values,current,'offline-write',native)
    op['transportInvoked']=True;op['stage']='transport-returned';j.save()
    j.acknowledge(values,dict(current,**values),native)


class FakeCollector(m.Collector):
    def __init__(self, folder, j):
        self.folder=Path(folder);self.journal=j;self.report={'cases':[]};self.events=[]
        self.current=j.expected();self.native_current=j.expected(True);self.pixel_failure=False;self.external_during_pixels=False
        self.identity_failure=False;self.recovering=False;self.deadline=time.monotonic()+100
        self.ar=self
    def identity(self,label):
        self.events.append(('identity',label))
        if self.identity_failure:raise RuntimeError('changed APK/PID')
    def config(self,label):self.events.append(('device-snapshot',label));return dict(self.current)
    def native(self):self.events.append(('device-native','read'));return dict(self.native_current)
    def instrument(self,operation,label,values=None,**kw):
        if operation!='set':raise AssertionError('Unexpected fixture operation')
        self.events.append(('device-set',dict(values)))
        op=self.journal.begin(values,kw['current'],label,recovery=kw.get('recovery',False));op['transportInvoked']=True
        self.current.update(values);self.journal.save();return {'status':'pass','moduleVersion':20463}
    def shell(self,command):
        self.events.append(('device-shell',command))
        if command=='settings --user 0 put system font_scale 1.0':self.native_current['system/font_scale']='1.0';return ''
        if command=='settings --user 0 put system user_rotation 0':self.native_current['system/user_rotation']='0';return ''
        raise AssertionError('Forbidden fake device command: '+command)
    def native_observe(self,label,**kw):
        self.events.append(('device-native-proof',label))
        return {'started':time.monotonic()}
    def profile_transition(self,label,rotation,activity,**kw):
        self.events.append(('device-profile',label))
        if self.native_current['system/user_rotation']!=rotation:
            self.native_current=self.native_restore_value('system/user_rotation',rotation,self.native_current)
        self.events.append(('device-native-launch',activity))
    def native_home(self,label):self.events.append(('device-native-home',label))
    def capture_restored_native(self):self.capture('restored-main-native')
    def home(self,label):self.events.append(('device-home',label))
    def capture(self,label,*a,**kw):
        self.events.append(('device-pixels',label))
        if self.external_during_pixels:self.current['untouched_001']='user edit while pictures collected'
        if self.pixel_failure:raise RuntimeError('screen not safely observed')
    def protect(self,label,expected_native=None):
        self.events.append(('device-protection',label));diff=core.difference(expected_native or self.journal.expected(True),self.native_current)
        result={'resources':{},'names':{},'native':diff}
        self.journal.data['lastProtection']={'label':label,'differences':result}
        if diff:raise RuntimeError('Native external change')
    def notifications(self,label):self.events.append(('device-notifications',label));return {'sameOriginalIdentities':True}
    def persist(self):core.atomic(self.folder/'report.json',self.report)


class Ownership(unittest.TestCase):
    def setUp(self):self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
    def test_old_baseline_and_history_are_not_authority(self):
        confirmed(self.j,{core.SYSTEM:'1'});self.j.data['allowed']={core.SYSTEM:['0','1']}
        self.assertFalse(self.j.owns(core.SYSTEM,'0'));self.assertTrue(self.j.owns(core.SYSTEM,'1'))
        self.assertIn(core.SYSTEM,self.j.conflicts(dict(self.j.expected(),**{core.SYSTEM:'0'})))
    def test_prepared_transport_does_not_claim_target(self):
        op=self.j.begin({core.SYSTEM:'1'},self.j.expected(),'not-sent')
        self.assertFalse(self.j.owns(core.SYSTEM,'1'));self.assertTrue(self.j.owns(core.SYSTEM,'0'))
        reloaded=core.Journal(self.j.path);self.assertFalse(reloaded.owns(core.SYSTEM,'1'))
        self.j.not_invoked(op);self.assertEqual({},self.j.data['inflight']);self.assertEqual({},self.j.data['restore'])
    def test_failed_log_is_zero_transport_and_zero_claim(self):
        called=[]
        with patch.object(core,'atomic',side_effect=OSError('disk full')):
            with self.assertRaises(OSError):core.invoke_logged(Path(self.tmp.name)/'action.json','test',lambda:called.append(1),0,5,
                clock=lambda:0,journal=self.j,values={core.SYSTEM:'1'},current=self.j.expected())
        self.assertEqual([],called);self.assertEqual({},self.j.data['inflight']);self.assertEqual({},self.j.data['restore'])
    def test_failed_journal_save_is_not_target_authority(self):
        called=[]
        with patch.object(self.j,'save',side_effect=OSError('journal refused')):
            with self.assertRaises(OSError):core.invoke_logged(Path(self.tmp.name)/'action.json','test',lambda:called.append(1),0,5,
                clock=lambda:0,journal=self.j,values={core.SYSTEM:'1'},current=self.j.expected())
        self.assertEqual([],called);self.assertFalse(self.j.owns(core.SYSTEM,'1'))
    def test_deadline_after_durable_plan_cancels_claim(self):
        called=[];clock=iter([0,3,3])
        with self.assertRaises(core.Unobserved):core.invoke_logged(Path(self.tmp.name)/'action.json','test',lambda:called.append(1),0,5,
            clock=lambda:next(clock),journal=self.j,values={core.SYSTEM:'1'},current=self.j.expected())
        self.assertEqual([],called);self.assertEqual({},self.j.data['restore']);self.assertEqual({},self.j.data['inflight'])
    def test_transport_error_retains_only_exact_unresolved_pair(self):
        def failed():raise TimeoutError('Android may have accepted')
        with self.assertRaises(TimeoutError):core.invoke_logged(Path(self.tmp.name)/'action.json','test',failed,0,5,
            clock=lambda:0,journal=self.j,values={core.SYSTEM:'1'},current=self.j.expected())
        self.assertTrue(self.j.owns(core.SYSTEM,'1'));self.assertTrue(self.j.owns(core.SYSTEM,'0'))
        self.assertFalse(self.j.owns(core.SYSTEM,'user_value'))
        self.assertTrue(core.Journal(self.j.path).owns(core.SYSTEM,'1'))
    def test_new_save_rejects_unresolved_and_unrelated_change(self):
        actual=self.j.expected();actual['untouched_003']='external'
        with self.assertRaises(core.Unobserved):self.j.begin({core.SYSTEM:'1'},actual,'bad')
        self.j.begin({core.SYSTEM:'1'},self.j.expected(),'first')
        with self.assertRaises(core.Unobserved):self.j.begin({core.NOTIFICATIONS:'1'},self.j.expected(),'second')
    def test_scope_and_native_limits(self):
        for values in ({'ls_augment_rm_signal_dual':'1'},{core.ART:'anything'},{core.SYSTEM:'2'}):
            with self.assertRaises(ValueError):self.j.values(values)
        for key,value in [('system/user_rotation','2'),('system/accelerometer_rotation','1'),('system/font_scale','1.5')]:
            with self.assertRaises(ValueError):self.j.native_value(key,value)
        self.j.native_value('system/user_rotation','1')
        a=journal(Path(self.tmp.name)/'assets',core.CASES[0])
        with self.assertRaises(ValueError):a.native_value('system/font_scale','1.3')
    def test_old_native_original_is_foreign_after_confirmed(self):
        confirmed(self.j,{'system/font_scale':'1.3'},True)
        self.assertFalse(self.j.owns('system/font_scale','1.0',True))
        self.assertTrue(self.j.owns('system/font_scale','1.3',True))
    def test_recovery_cannot_claim_external_old_value(self):
        confirmed(self.j,{core.SYSTEM:'1'})
        current=dict(self.j.expected(),**{core.SYSTEM:'0'})
        with self.assertRaises(core.Unobserved):self.j.begin({core.SYSTEM:'0'},current,'restore',recovery=True)


class Recovery(unittest.TestCase):
    def setUp(self):self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
    def make(self):return FakeCollector(self.tmp.name,self.j)
    def test_full_restore_final_device_reads_after_every_protection(self):
        confirmed(self.j,{core.SYSTEM:'1',core.NOTIFICATIONS:'1'});c=self.make();c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
        self.assertEqual(self.j.data['baseline'],c.current)
        self.assertEqual([('device-snapshot','recovery-terminal-0'),('device-snapshot','recovery-terminal-1')],c.events[-2:])
    def test_external_old_value_preserved_while_other_own_key_restored(self):
        confirmed(self.j,{core.SYSTEM:'1',core.NOTIFICATIONS:'1'});c=self.make();c.current[core.SYSTEM]='0'
        with self.assertRaises(core.Unobserved):c.restore()
        writes=[v for kind,v in c.events if kind=='device-set']
        self.assertEqual([{core.NOTIFICATIONS:'0'}],writes)
        self.assertEqual({core.SYSTEM:'0'},self.j.data['externalValuesPreserved']);self.assertTrue(self.j.data['pending'])
    def test_external_unrelated_value_never_overwritten(self):
        confirmed(self.j,{core.SYSTEM:'1'});c=self.make();c.current['untouched_003']='external'
        with self.assertRaises(core.Unobserved):c.restore()
        self.assertEqual('external',c.current['untouched_003']);self.assertEqual('0',c.current[core.SYSTEM]);self.assertFalse(self.j.data['configurationRestored'])
    def test_external_during_recovery_pixels_is_caught_by_terminal_read(self):
        confirmed(self.j,{core.SYSTEM:'1'});c=self.make();c.external_during_pixels=True
        with self.assertRaises(core.Unobserved):c.restore()
        self.assertFalse(self.j.data['configurationRestored']);self.assertTrue(self.j.data['pending'])
        self.assertIn('untouched_001',self.j.data['terminalDifferences'][1])
    def test_unavailable_restored_picture_does_not_claim_bad_configuration(self):
        confirmed(self.j,{core.SYSTEM:'1'});c=self.make();c.pixel_failure=True
        with self.assertRaisesRegex(core.Unobserved,'visual observation incomplete'):c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
        self.assertEqual('not_fully_observed',self.j.data['restoredPixels'])
    def test_identity_failure_runs_no_test_or_recovery_input(self):
        confirmed(self.j,{core.SYSTEM:'1'});c=self.make();c.identity_failure=True
        with self.assertRaises(core.Unobserved):c.restore()
        self.assertEqual([('identity','recovery-identity')],c.events);self.assertTrue(self.j.data['pending'])
    def test_owned_font_restored_without_orientation_write(self):
        confirmed(self.j,{'system/font_scale':'1.3'},True);c=self.make();c.restore()
        self.assertEqual('1.0',c.native_current['system/font_scale']);self.assertTrue(self.j.data['nativeProfileRestored'])
        self.assertEqual([('device-shell','settings --user 0 put system font_scale 1.0')],[x for x in c.events if x[0]=='device-shell'])
    def test_external_native_preference_is_preserved_and_pending(self):
        confirmed(self.j,{'system/font_scale':'1.3'},True);c=self.make();c.native_current['system/font_scale']='1.8'
        with self.assertRaises(core.Unobserved):c.restore()
        self.assertEqual('1.8',c.native_current['system/font_scale']);self.assertFalse(any(x[0]=='device-shell' for x in c.events))
        self.assertTrue(self.j.data['pending']);self.assertFalse(self.j.data['nativeProfileRestored'])
    def test_rotation_zero_confirmed_before_any_portrait_home(self):
        confirmed(self.j,{'system/user_rotation':'1'},True);confirmed(self.j,{'system/font_scale':'1.3'},True)
        c=self.make();c.restore()
        setting=c.events.index(('device-shell','settings --user 0 put system user_rotation 0'))
        launch=c.events.index(('device-native-launch','PlainActivity'))
        home=c.events.index(('device-native-home','recovery-native-home'))
        font=c.events.index(('device-shell','settings --user 0 put system font_scale 1.0'))
        pixels=c.events.index(('device-pixels','restored-main-native'))
        self.assertLess(setting,launch);self.assertLess(launch,home);self.assertLess(home,font);self.assertLess(font,pixels)
        self.assertFalse(any(k=='device-home' for k,v in c.events))
        self.assertFalse(self.j.data['pending']);self.assertEqual('0',c.native_current['system/user_rotation'])
    def test_rotation_original_zero_is_not_re_adopted_after_latest_one(self):
        confirmed(self.j,{'system/user_rotation':'1'},True);c=self.make();c.native_current['system/user_rotation']='0'
        with self.assertRaises(core.Unobserved):c.restore()
        self.assertTrue(self.j.data['pending']);self.assertEqual('0',c.native_current['system/user_rotation'])
        self.assertFalse(any(k in ('device-shell','device-native-launch','device-native-home','device-home') for k,v in c.events))
        self.assertIn('system/user_rotation',self.j.data['externalNativeValuesPreserved'])
    def test_missing_report_does_not_remove_journal_restore_inputs(self):
        confirmed(self.j,{core.SYSTEM:'1'});self.assertFalse((Path(self.tmp.name)/'report.json').exists())
        c=self.make();c.restore();self.assertFalse(core.Journal(self.j.path).data['pending'])


class RealWindowReplay(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.folder=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-155444-9a7ec7e2/preflight-before-navigation'
        cls.windows=json.loads((cls.folder/'result-private.json').read_text('utf-8'))['uiWindows']
        cls.native=(cls.folder/'activity-private.txt').read_text('utf-8');cls.wm=(cls.folder/'windows-private.txt').read_text('utf-8')
    def test_actual_home_zero_area_and_offscreen_windows(self):
        owner=core.owner(self.windows,self.native,self.wm,(1216,2688),{'com.zte.mifavor.launcher'},navigation_pid=20209)
        self.assertTrue(owner['focused'])
        records=core.window_records(self.wm)
        self.assertIn((0,1344,1216,1344),[r['bounds'] for r in records]);self.assertIn((-1216,0,0,2688),[r['bounds'] for r in records])
    def test_exact_native_component_without_accessibility_connection(self):
        home='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher'
        proof=core.native_owner(self.native,self.wm,(1216,2688),{home},20209)
        self.assertEqual(home,proof['component']);self.assertFalse(proof['accessibilityObserverUsed'])
        with self.assertRaises(core.Unobserved):core.native_owner(self.native,self.wm,(1216,2688),{m.FIXTURE+'/.PlainActivity'},20209)
        with self.assertRaises(core.Unobserved):core.native_owner(self.native,self.wm,(2688,1216),{home},20209)
    def test_coordinate_in_native_edge_is_rejected(self):
        with self.assertRaises(core.Unobserved):core.owner(self.windows,self.native,self.wm,(1216,2688),{'com.zte.mifavor.launcher'},(1140,900,1141,901))
    def test_wrong_native_pid_cannot_exempt_system_edges(self):
        with self.assertRaises(core.Unobserved):core.owner(self.windows,self.native,self.wm,(1216,2688),{'com.zte.mifavor.launcher'},navigation_pid=999)
    def test_permission_overlay_replaces_underlying_focus(self):
        windows=copy.deepcopy(self.windows);windows[-1]['focused']=False;windows[-1]['active']=False
        windows.append(dict(active=True,focused=True,bounds='[0,0][1216,2688]',root=dict(package='com.android.permissioncontroller',bounds='[0,0][1216,2688]')))
        with self.assertRaises(core.Unobserved):core.owner(windows,self.native,self.wm,(1216,2688),{'com.zte.mifavor.launcher'},navigation_pid=20209)
    def test_negative_native_frame_is_not_treated_as_empty(self):
        raw=self.wm.replace('frame=[0,1344][1216,1344]','frame=[0,1344][1216,1200]')
        with self.assertRaisesRegex(core.Unobserved,'Negative'):core.window_records(raw)
    def test_unknown_metadata_is_not_ignored(self):
        raw=self.wm.replace('mBaseLayer=181000 mSubLayer=0','unrecognized layer')
        with self.assertRaises(core.Unobserved):core.window_records(raw)
    def test_wallpaper_moved_above_target_refused(self):
        raw=self.wm.replace('Window #23 Window{','Window #19 Window{').replace('mBaseLayer=11000 mSubLayer=0','mBaseLayer=31000 mSubLayer=0')
        with self.assertRaises(core.Unobserved):core.owner(self.windows,self.native,raw,(1216,2688),{'com.zte.mifavor.launcher'},navigation_pid=20209)


class NativeTransition(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
        self.c=FakeCollector(self.tmp.name,self.j);self.c.fixture_active=False
        # Execute actual production-tool transition and launch methods. Transport
        # is fake; any unexpected command or UiAutomation call fails the test.
        self.c.profile_transition=m.Collector.profile_transition.__get__(self.c)
        self.c.native_launch=m.Collector.native_launch.__get__(self.c)
        self.physical='0';self.component=self.j.data['metadata']['homeComponent'];self.stale=False;self.launch_error=False
        def proof(label,**kw):
            self.c.events.append(('native-proof',(label,kw)))
            actual=self.c.native_current['system/user_rotation']
            if actual!=self.j.expected(True)['system/user_rotation']:raise core.Unobserved('Unowned rotation')
            if kw.get('rotation') is not None and (actual!=kw['rotation'] or self.physical!=kw['rotation']):raise core.Unobserved('Physical mismatch')
            if kw.get('component') is not None and self.component!=kw['component']:raise core.Unobserved('Exact activity mismatch')
            return {'started':time.monotonic()-(3 if self.stale else 0)}
        def shell(command,**kw):
            self.c.events.append(('transport',command))
            if command.startswith('settings --user 0 put system user_rotation '):
                self.assertEqual('transport-entered',self.j.data['operations'][-1]['stage'])
                self.assertTrue(self.j.data['operations'][-1]['transportInvoked'])
                self.c.native_current['system/user_rotation']=command.rsplit(' ',1)[1];return ''
            if command=='am start -W --activity-clear-top -n '+m.FIXTURE+'/.LandscapeActivity':
                self.assertEqual('1',self.j.data['nativeConfirmed']['system/user_rotation'])
                self.assertEqual({},self.j.data['nativeInflight'])
                if self.launch_error:return 'Error: Activity not started\n'
                self.component=m.FIXTURE+'/.LandscapeActivity';self.physical='1';return 'Status: ok\nActivity: '+m.FIXTURE+'/.LandscapeActivity\n'
            if command=='am start -W --activity-clear-top -n '+m.FIXTURE+'/.PlainActivity':
                self.assertEqual('0',self.j.data['nativeConfirmed']['system/user_rotation'])
                self.component=m.FIXTURE+'/.PlainActivity';self.physical='0';return 'Status: ok\nActivity: '+m.FIXTURE+'/.PlainActivity\n'
            raise AssertionError('Unreviewed fake transport '+command)
        self.c.native_observe=proof;self.c.shell=shell
        self.c.ui=type('NoObserver',(),{'all_windows':lambda *a:(_ for _ in ()).throw(AssertionError('UiAutomation during transition'))})()
    def test_real_transition_confirms_rotation_before_exact_launch_and_two_proofs(self):
        self.c.profile_transition('landscape','1','LandscapeActivity')
        actions=[v for k,v in self.c.events if k=='transport']
        self.assertEqual(['settings --user 0 put system user_rotation 1','am start -W --activity-clear-top -n '+m.FIXTURE+'/.LandscapeActivity'],actions)
        targets=[kw for k,(label,kw) in [e for e in self.c.events if e[0]=='native-proof'] if '-target-' in label]
        self.assertEqual(2,len(targets));self.assertTrue(all(v.get('rotation')=='1' for v in targets))
        self.assertTrue(self.c.fixture_active)
        self.c.profile_transition('recover','0','PlainActivity',recovery=True)
        self.assertEqual('0',self.j.data['nativeConfirmed']['system/user_rotation'])
    def test_expired_native_proof_is_zero_rotation_and_intent_transport(self):
        self.stale=True
        with self.assertRaises(core.Unobserved):self.c.profile_transition('stale','1','LandscapeActivity')
        self.assertFalse(any(k=='transport' for k,v in self.c.events));self.assertEqual({},self.j.data['nativeRestore'])
    def test_original_rotation_appearing_after_latest_one_is_not_adopted(self):
        confirmed(self.j,{'system/user_rotation':'1'},True);self.c.native_current=self.j.expected(True)
        self.c.native_current['system/user_rotation']='0'
        with self.assertRaises(core.Unobserved):self.c.profile_transition('foreign','0','PlainActivity',recovery=True)
        self.assertFalse(any(k=='transport' for k,v in self.c.events));self.assertEqual('1',self.j.data['nativeConfirmed']['system/user_rotation'])
    def test_launch_error_stops_without_observer_or_retry_and_preserves_output(self):
        self.launch_error=True
        with self.assertRaises(core.Unobserved):self.c.profile_transition('bad-launch','1','LandscapeActivity')
        actions=[v for k,v in self.c.events if k=='transport'];self.assertEqual(2,len(actions))
        self.assertFalse(self.c.fixture_active);self.assertEqual('1',self.j.data['nativeConfirmed']['system/user_rotation'])
        self.assertIn('Error:',(Path(self.tmp.name)/'bad-launch-intent-transport-output.txt').read_text('utf-8'))
    def test_stale_rotation_proof_never_connects_observer(self):
        called=[];png=b'\x89PNG\r\n\x1a\n'+b'\x00'*8+struct.pack('>II',1216,2688)
        self.c.native_observe=lambda *a,**kw:dict(png=png,started=time.monotonic()-3)
        self.c.ui=type('Observer',(),{'all_windows':lambda *a:called.append(1)})()
        with self.assertRaises(core.Unobserved):m.Collector.observe(self.c,'expired-observer')
        self.assertEqual([],called);self.assertFalse(any(k=='transport' for k,v in self.c.events))
    def test_actual_native_observe_rejects_reverse_angle_and_user_mismatch(self):
        folder=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-155444-9a7ec7e2/preflight-before-navigation'
        native=(folder/'activity-private.txt').read_text('utf-8');wm=(folder/'windows-private.txt').read_text('utf-8')
        full=(ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-162234-e9b5a759/recovery-inspect/window.txt').read_text('utf-8-sig')
        displays=full.replace('mUserRotation=ROTATION_90 mCameraRotationMode','mUserRotation=ROTATION_0 mCameraRotationMode')
        png=b'\x89PNG\r\n\x1a\n'+b'\x00'*8+struct.pack('>II',1216,2688)
        self.c.adb=lambda *a:png
        values={'dumpsys power':'mWakefulness=Awake','dumpsys activity activities':native,
            'dumpsys window windows':wm,'dumpsys window displays':displays,
            'settings --user 0 get system user_rotation':'0','settings --user 0 get system accelerometer_rotation':'0',
            'dumpsys window policy':'KeyguardServiceDelegate\n  showing=false\n  secure=false\n mKeyguardOccluded=false\n'}
        self.c.shell=lambda command:values[command]
        proof=m.Collector.native_observe(self.c,'actual-proof',rotation='0')
        self.assertEqual('0',proof['rotation'])
        values['dumpsys window displays']=displays.replace('mRotation=0 mDeferredRotationPauseCount=0','mRotation=3 mDeferredRotationPauseCount=0')
        with self.assertRaisesRegex(core.Unobserved,'Reverse'):m.Collector.native_observe(self.c,'reverse',allow_rotation_mismatch=True)
        values['dumpsys window displays']=full
        with self.assertRaisesRegex(core.Unobserved,'unsynchronized'):m.Collector.native_observe(self.c,'different-user-setting',allow_rotation_mismatch=True)
        values['dumpsys window displays']=displays
        self.c.adb=lambda *a,**kw:b'\x89PNG\r\n\x1a\n'+b'\x00'*8+struct.pack('>II',2688,1216)
        with self.assertRaises(m.NativeNotReady):m.Collector.native_observe(self.c,'png-straddles-rotation',rotation='0',ready_transition=True)
    def test_real_wrong_activity_receipt_is_rejected_before_any_readiness_probe(self):
        path=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-165337-97d2ce13/portrait-reference-navigate-action.json'
        raw=json.loads(path.read_text('utf-8'))['transportOutput'];called=[]
        self.c.shell=lambda command,**kw:(called.append(command) or raw)
        self.c.native_observe=lambda *a,**kw:(_ for _ in ()).throw(AssertionError('No proof retry after wrong Activity'))
        with self.assertRaisesRegex(core.Unobserved,'different actual Activity'):
            self.c.native_launch('wrong-return','am start -W --activity-clear-top -n '+m.FIXTURE+'/.PlainActivity',{'started':time.monotonic()})
        self.assertEqual(1,len(called))
    def test_missing_duplicate_activity_rejected_and_full_name_accepted(self):
        output=['Status: ok\n'];self.c.shell=lambda *a,**kw:output[0]
        command='am start -W --activity-clear-top -n '+m.FIXTURE+'/.PlainActivity'
        for i,raw in enumerate(['Status: ok\n','Status: ok\nActivity: '+m.FIXTURE+'/.PlainActivity\nActivity: '+m.FIXTURE+'/.PlainActivity\n']):
            output[0]=raw
            with self.assertRaises(core.Unobserved):self.c.native_launch('bad-return-'+str(i),command,{'started':time.monotonic()})
        output[0]='Status: ok\nActivity: '+m.FIXTURE+'/'+m.FIXTURE+'.PlainActivity\n'
        self.assertIsInstance(self.c.native_launch('full-name',command,{'started':time.monotonic()}),float)
    def test_known_transition_then_two_ready_proofs_has_no_repeated_input(self):
        calls=[]
        def proof(label,**kw):
            calls.append(kw)
            if len(calls)==1:raise m.NativeNotReady('known frame transition')
            return {'ready':True}
        self.c.native_observe=proof
        with patch.object(m.time,'sleep',lambda x:None):
            result=self.c.await_native_ready('finite',m.FIXTURE+'/.PlainActivity','0',time.monotonic())
        self.assertEqual({'ready':True},result);self.assertEqual(3,len(calls))
        self.assertEqual(1,len({x['read_deadline'] for x in calls}));self.assertFalse(any(k=='transport' for k,v in self.c.events))
    def test_unknown_foreground_is_not_a_retryable_transition(self):
        called=[]
        def proof(*a,**kw):called.append(1);raise core.Unobserved('Unknown permission foreground')
        self.c.native_observe=proof
        with self.assertRaisesRegex(core.Unobserved,'Unknown permission'):self.c.await_native_ready('unknown',m.FIXTURE+'/.PlainActivity','0',time.monotonic())
        self.assertEqual(1,len(called));self.assertFalse(any(k=='transport' for k,v in self.c.events))
    def test_readiness_window_never_restarts_or_accepts_late_proof(self):
        called=[];now=[100.0]
        def late(*a,**kw):called.append(kw);now[0]=106.001;return {'ready':True}
        self.c.native_observe=late
        with patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaises(core.Unobserved):self.c.await_native_ready('late',m.FIXTURE+'/.PlainActivity','0',100)
        self.assertEqual(1,len(called));self.assertEqual(106,called[0]['read_deadline'])
        called.clear()
        with self.assertRaises(core.Unobserved):self.c.await_native_ready('expired',m.FIXTURE+'/.PlainActivity','0',time.monotonic()-7)
        self.assertEqual([],called)


class Preconditions(unittest.TestCase):
    def test_actual_rotation_uses_primary_display_not_png_shape(self):
        path=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-162234-e9b5a759/recovery-inspect/window.txt'
        raw=path.read_text('utf-8-sig');proof=core.primary_rotation(raw)
        # This real failed-run dump had physical portrait but user_rotation90.
        self.assertEqual('0',proof['actualRotation']);self.assertEqual('1',proof['userRotation'])
        self.assertEqual('USER_ROTATION_LOCKED',proof['mode'])
        self.assertEqual('3',core.primary_rotation(raw.replace('mRotation=0 mDeferredRotationPauseCount=0','mRotation=3 mDeferredRotationPauseCount=0'))['actualRotation'])
        with self.assertRaises(core.Unobserved):core.primary_rotation(raw.replace('Display: mDisplayId=0','Display: mDisplayId=1'))
        with self.assertRaises(core.Unobserved):core.primary_rotation(raw.replace('mRotation=0 mDeferredRotationPauseCount=0','mRotation=unknown'))
    def test_rotation_baseline_must_be_exact_locked_portrait(self):
        with tempfile.TemporaryDirectory() as folder:
            j=journal(folder)
            for key,value in [('system/user_rotation','1'),('system/accelerometer_rotation','1')]:
                data=copy.deepcopy(j.data);data['metadata']['nativeBaseline'][key]=value
                with self.assertRaises(ValueError):core.Journal(Path(folder)/'bad.json',data)
    def test_profiles_have_only_independent_row_keys(self):
        steps=core.profile_steps();self.assertEqual(['00-before','10','00-middle','01','00-after'],[x[0] for x in steps])
        self.assertTrue(all(set(values)=={core.SYSTEM,core.NOTIFICATIONS} for _,values in steps))
    def test_existing_clock_format_is_never_a_mutable_key(self):
        self.assertEqual({core.SYSTEM,core.NOTIFICATIONS},core.allowed_keys('profiles'))
        self.assertEqual({core.SYSTEM,core.NOTIFICATIONS,core.ART,core.FONT},core.allowed_keys('current-assets-lock'))
        with self.assertRaises(ValueError):core.allowed_keys('owned-notification-transition')
    def test_explicit_c_case_cannot_acquire_assets_native_or_ab_execution(self):
        self.assertEqual({core.SYSTEM,core.NOTIFICATIONS},core.allowed_keys('notification-icons'))
        self.assertNotIn('notification-icons',m.SUPPORTED_CASES)
        with tempfile.TemporaryDirectory() as folder:
            j=journal(folder,'notification-icons');j.values({core.SYSTEM:'1',core.NOTIFICATIONS:'0'})
            with self.assertRaises(ValueError):j.values({core.ART:'x'})
            for key,value in [('system/font_scale','1.3'),('system/user_rotation','1')]:
                with self.assertRaises(ValueError):j.native_value(key,value)
            with self.assertRaisesRegex(ValueError,'cannot execute or recover C'):m.Collector(None,Path(folder),j,{})
    def test_raw_registered_deletion_refused_and_initial_absence_preserved(self):
        b=baseline();raw={core.SYSTEM:['string',None,'0']}
        self.assertEqual(b,m.resolve_raw(raw,raw,b))
        with self.assertRaises(core.Unobserved):m.resolve_raw({},raw,b)
        changed=dict(raw);changed[core.SYSTEM]=['boolean','true','']
        with self.assertRaises(core.Unobserved):m.resolve_raw(changed,raw,b)
    def test_real_keyguard_policy_and_unknown_refusal(self):
        raw=(ROOT/'out/full-function-audit-20261004/native-safe-20455-20261004-071918/policy-after-failed-fixture.txt').read_text('utf-8-sig')
        self.assertEqual({'showing':True,'secure':False,'occluded':False},m.keyguard(raw))
        with self.assertRaises(core.Unobserved):m.keyguard(raw.replace('secure=false','secure=unknown'))
    def test_overlay_switch_not_found_in_underlying_editor(self):
        node=dict(visible=True,text='系统图标分两排',children=[])
        switch=dict(visible=True,enabled=True,clickable=True,checkable=True,checked=False,**{'class':'android.widget.Switch'})
        windows=[dict(active=False,focused=False,root=dict(package='ls.augment.com',children=[dict(children=[node,switch])])),
                 dict(active=True,focused=True,root=dict(package='com.android.permissioncontroller'))]
        with self.assertRaises(core.Unobserved):core.row_switch(windows,'系统图标分两排')
        windows[0].update(active=True,focused=True);windows.pop()
        self.assertIs(switch,core.row_switch(windows,'系统图标分两排'))


class SleepReadiness(unittest.TestCase):
    @staticmethod
    def policy(showing=False,secure='false',occluded='false'):
        return 'KeyguardServiceDelegate\n  showing=%s\n  secure=%s\n mKeyguardOccluded=%s\n'%('true' if showing else 'false',secure,occluded)
    def cycle(self,pairs,slow=False):
        tmp=tempfile.TemporaryDirectory();self.addCleanup(tmp.cleanup)
        j=journal(tmp.name,core.CASES[0]);c=FakeCollector(tmp.name,j);clock=[100.0];commands=[];index=[-1]
        c.owner=lambda *a,**kw:None;c.observe=lambda *a:{'started':clock[0]}
        c.action=lambda label,command,ob:commands.append(command)
        c.capture=lambda *a,**kw:(_ for _ in ()).throw(RuntimeError('stop after one proven wake'))
        def shell(command,**kw):
            commands.append(command)
            if command=='dumpsys window policy' and index[0]<0:return self.policy()
            if command=='dumpsys power':
                index[0]+=1;clock[0]+=16 if slow else .1
                self.assertGreater(kw['timeout'],0);self.assertLessEqual(kw['timeout'],15)
                return 'mWakefulness='+pairs[min(index[0],len(pairs)-1)][0]+'\n'
            if command=='dumpsys window policy':
                clock[0]+=.1;return pairs[min(index[0],len(pairs)-1)][1]
            if command=='input keyevent KEYCODE_WAKEUP':return ''
            raise AssertionError(command)
        c.shell=shell;original=core.invoke_logged
        def logged(*a,**kw):return original(*a,**kw,clock=lambda:clock[0])
        with patch.object(m.time,'monotonic',lambda:clock[0]),patch.object(m.time,'sleep',lambda seconds:clock.__setitem__(0,clock[0]+seconds)),patch.object(core,'invoke_logged',logged):
            try:m.Collector.lock_cycle(c,'owned',2)
            except (core.Unobserved,RuntimeError) as error:failure=str(error)
            else:raise AssertionError('Fixture must stop before remaining navigation')
        evidence=json.loads((Path(tmp.name)/'owned-sleep-readiness/readiness.json').read_text('utf8'))
        return commands,evidence,failure
    def test_sleep_then_showing_uses_same_pair_and_one_wake(self):
        commands,evidence,error=self.cycle([('Dozing',self.policy()),('Dozing',self.policy(True))])
        self.assertEqual('stop after one proven wake',error);self.assertEqual(1,commands.count('input keyevent KEYCODE_SLEEP'))
        self.assertEqual(1,commands.count('input keyevent KEYCODE_WAKEUP'));self.assertEqual(2,len(evidence['samples']))
        self.assertEqual([False,True],[x['ready'] for x in evidence['samples']])
        self.assertTrue(all(len(x['reads'])==2 and x['ended']<evidence['deadline'] for x in evidence['samples']))
    def test_awake_showing_cannot_reuse_an_earlier_dozing_sample(self):
        commands,evidence,_=self.cycle([('Dozing',self.policy()),('Awake',self.policy(True)),('Asleep',self.policy(True))])
        self.assertEqual([False,False,True],[x['ready'] for x in evidence['samples']]);self.assertEqual(1,commands.count('input keyevent KEYCODE_WAKEUP'))
    def test_unknown_secure_or_occluded_never_wakes(self):
        for policy in [self.policy(True,secure='unknown'),self.policy(True,secure='true'),self.policy(True,occluded='true'),self.policy(True,occluded='unknown')]:
            with self.subTest(policy=policy):
                commands,evidence,_=self.cycle([('Dozing',policy)])
                self.assertNotIn('input keyevent KEYCODE_WAKEUP',commands);self.assertEqual(1,len(evidence['samples']));self.assertIn('error',evidence['samples'][0])
    def test_late_ready_read_and_ten_unready_pairs_do_not_wake(self):
        for slow,pairs in [(True,[('Dozing',self.policy(True))]),(False,[('Awake',self.policy())])]:
            with self.subTest(slow=slow):
                commands,evidence,_=self.cycle(pairs,slow)
                self.assertNotIn('input keyevent KEYCODE_WAKEUP',commands);self.assertEqual(1 if slow else 10,len(evidence['samples']))
    def test_all_main_pixels_and_ui_roundtrips_precede_first_sleep(self):
        from PIL import Image
        with tempfile.TemporaryDirectory() as folder:
            j=journal(folder,core.CASES[0]);c=FakeCollector(folder,j);events=[]
            (Path(folder)/'user-baseline').mkdir();Image.open(m.font.REFERENCE).save(Path(folder)/'user-baseline/frame-00.png')
            c.capture=lambda label,*a,**kw:(events.append(('pixels',label,a)) or {'inventory':{},'wholeStatusBarBounds':(0,0,1216,107)})
            c.set=lambda label,values:events.append(('set',label,values))
            c.ui_row=lambda key,value,label:events.append(('ui',label,key,value))
            c.lock_cycle=lambda label,frames:events.append(('lock',label,frames))
            with patch.object(m.base,'visible_rows',lambda *a:[{'id':'volume','capability':'whole_layers'}]):m.Collector.exercise(c)
            first=next(i for i,x in enumerate(events) if x[0]=='lock')
            self.assertEqual(['system-ui-on','notifications-ui-on','system-ui-off','notifications-ui-off'],[x[1] for x in events[:first] if x[0]=='ui'])
            self.assertEqual(['user-baseline','assets-00','assets-11','assets-00-ui-return'],[x[1] for x in events[:first] if x[0]=='pixels'])
            self.assertEqual(('lock','rows-00',2),events[first]);self.assertEqual(('set','lock-rows-11',{core.SYSTEM:'1',core.NOTIFICATIONS:'1'}),events[first+1]);self.assertEqual(('lock','rows-11',8),events[first+2])


class PixelObservation(unittest.TestCase):
    def collect(self,source_phase,missing_inventory=False):
        folder=ROOT/'out/full-function-audit-20261004/statusbar-rows-20463-current-assets-lock-20261004-165900'
        tmp=tempfile.TemporaryDirectory();self.addCleanup(tmp.cleanup)
        j=journal(tmp.name,core.CASES[0]);c=FakeCollector(tmp.name,j);c.fixture_active=False
        report=json.loads((folder/'report.json').read_text('utf-8'))
        inv=next(x['inventory'] for x in report['cases'] if x['label']=='assets-00')
        c.inventory=lambda *a: {'surfaces':{},'runtime':{}} if missing_inventory else inv
        c.raw_settings=lambda *a:dict(c.current)
        c.owner=lambda *a,**kw:None
        c.diagnostic=lambda *a:{}
        c.shell=lambda command: '1791100000000' if command=='date +%s%3N' else 'config: portrait'
        raw=(folder/source_phase/'frame-00.png').read_bytes();screens=[]
        c.adb=lambda *a:(screens.append(1) or raw)
        def observe(label):
            (Path(tmp.name)/label).mkdir()
            return {'size':(1216,2688),'windows':[{'root':{'children':[{'visible':True,'id':'com.android.systemui:id/status_bar','bounds':'[0,0][1216,107]'}]}}]}
        c.observe=observe
        with patch.object(m.time,'sleep',lambda *a:None):
            if missing_inventory:
                with self.assertRaisesRegex(core.Unobserved,'GIF prerequisite'):m.Collector.capture(c,'missing-inventory',8,animation=True)
                self.assertEqual([],screens);return
            row=m.Collector.capture(c,'pixel-only',8,animation=True)
        self.assertEqual(8,len(screens));self.assertEqual(8,len(list((Path(tmp.name)/'pixel-only').glob('frame-*.png'))))
        self.assertEqual(8,len(row['nativeInkObservations']));self.assertTrue(row['animationUnobserved'])
        self.assertFalse(row['visualPass']);self.assertFalse(row['colorExchange']['established'])
        self.assertEqual('collected-independent-pixel-review-required',row['status'])
        return row
    def test_actual_wallpaper_mismatch_keeps_eight_frames_without_weakening_threshold(self):
        row=self.collect('assets-00')
        self.assertTrue(all(not x['matched'] and x['iou']<.96 and 'error' in x for x in row['nativeInkObservations']))
        self.assertTrue(all(x['thresholds']=={'minimumIou':.96,'maximumDisjointIouExclusive':.90} for x in row['nativeInkObservations']))
    def test_all_native_matches_without_actual_frame_change_are_still_unobserved(self):
        row=self.collect('user-baseline')
        self.assertTrue(all(x['matched'] and x['iou']==1.0 for x in row['nativeInkObservations']))
        self.assertEqual(0,row['colorExchange']['samePixels'])
    def test_missing_runtime_asset_prerequisite_remains_a_hard_stop(self):
        self.collect('assets-00',True)


if __name__=='__main__':unittest.main(verbosity=2)
