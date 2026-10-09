"""Narrow offline r4 rotation/ownership replay. Device entry points are forbidden."""
from pathlib import Path
import importlib.util,json,tempfile,time,unittest,copy,sys
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('r3_tests',ROOT/'tools/test-safe-capture-closure.py')
base=importlib.util.module_from_spec(spec);spec.loader.exec_module(base)
m=base.m;g=m.rotation_guard
HOME='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher'
PLAIN=m.component(m.safe.PACKAGE+'/.PlainActivity');WIDE=m.component(m.safe.PACKAGE+'/.LandscapeActivity')

class Tests(base.Tests):
    # Do not inherit/run the unrelated old35-method suite from the fixture helper.
    def make(self,user='0',actual='0',focused=HOME):
        c=self.collector();self.meta['homeComponent']=HOME
        self.j.data['rotationState']=g.initial({'auto':'0','user':'0'},'0');state=self.j.data['rotationState'];state['confirmed']=user
        world={'auto':'0','user':user,'actual':actual,'component':focused};events=[];now=[10.]
        c.ui=type('UI',(),{'all_windows':lambda *a:self.fail('UiAutomation in native transition')})()
        c.rotation_values=lambda *a: {'auto':world['auto'],'user':world['user']}
        def observation(label,*args):
            events.append('observe:'+label);g.require_owned(state,c.rotation_values())
            size=(2688,1216) if world['actual']=='1' else (1216,2688)
            return dict(component=world['component'],actual=world['actual'],size=list(size),native=c.rotation_values(),started=now[0],completed=now[0],
                inputObservation=([],None,None,size,now[0]))
        c.rotation_observation=observation
        def shell(command,**kwargs):
            events.append(command);now[0]+=.03
            if command.startswith('settings put system user_rotation '):
                durable=json.loads(self.j.path.read_text('utf-8'))['rotationState']
                self.assertEqual(durable['inflight']['phase'],'intent')
                self.assertFalse(durable['inflight']['transportCalled'])
                world['user']=command.rsplit(' ',1)[1]
            elif command.startswith(('am start -W -n ','am start -W --activity-clear-top -n ')):
                world['component']=command.split(' -n ',1)[1]
                if world['component']==HOME:
                    self.assertEqual(world['user'],'0','Target0 must be owned before HOME can itself set0')
                world['actual']='1' if world['component']==WIDE else '0'
            else:self.fail('Unexpected transport '+command)
            return 'Status: ok\nActivity: '+world['component']
        c.ar=type('AR',(),{'shell':staticmethod(shell)})()
        c.identity_reader=type('I',(),{'idle_instrumentation':lambda *a:events.append('idle-observer')})()
        return c,state,world,events,now
    def test_rotation_real_failure_history_and_strict_initial(self):
        p=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-162234-e9b5a759'
        raw=(p/'recovery-inspect/window.txt').read_text('utf-8')
        self.assertEqual(g.physical_rotation(raw),'0')
        self.assertEqual(g.focused_component(raw),HOME)
        self.assertIn('16:23:57.285: mode=USER_ROTATION_LOCKED, rotation=ROTATION_90, caller=UiAutomationConnection#restoreRotationStateLocked',raw)
        for native,actual in [({'auto':'0','user':'1'},'0'),({'auto':'1','user':'0'},'0'),({'auto':'0','user':None},'0'),({'auto':'0','user':'0'},'1')]:
            with self.assertRaises(RuntimeError):g.initial(native,actual)
        for old,new in [('mRotation=0 mDeferredRotationPauseCount','mRotation=2 mDeferredRotationPauseCount'),
                        ('mRotation=0 mDeferredRotationPauseCount','mRotation=3 mDeferredRotationPauseCount'),
                        ('Display: mDisplayId=0','Display: mDisplayId=1')]:
            with self.assertRaises(RuntimeError):g.physical_rotation(raw.replace(old,new))
        with self.assertRaises(RuntimeError):g.physical_rotation(raw+'\n Display: mDisplayId=1\n mRotation=0 mDeferredRotationPauseCount=0')
        with self.assertRaises(RuntimeError):g.physical_rotation(raw.replace('mRotation=0 mDeferredRotationPauseCount=0',''))
    def test_rotation_transition_writes_before_navigation_no_observer_and_saves_output(self):
        c,s,w,e,now=self.make()
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):
            size=c.fixture_page('landscape',True)
        self.assertEqual(size,(2688,1216));self.assertEqual(s['confirmed'],'1');self.assertIsNone(s['inflight'])
        self.assertLess(e.index('settings put system user_rotation 1'),e.index('am start -W --activity-clear-top -n '+WIDE))
        row=json.loads((self.folder/'landscape-navigate-action.json').read_text('utf-8'))
        self.assertEqual(row['transportOutput'],'Status: ok\nActivity: '+WIDE);self.assertTrue(row['transportReturned'])
        self.assertTrue(g.target_ready(c.rotation_observation('confirmed'),'1',WIDE))
    def test_rotation_actual_native_observation_replays_saved_home_and_rejects_overlay(self):
        p=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-162234-e9b5a759'
        raw=(p/'recovery-inspect/window.txt').read_text('utf-8')
        # Separate saved full/display and verbose-windows command formats. This
        # is a parser replay, not a claim these two reads were simultaneous.
        wm=(p/'restore-before-navigation/windows-private.txt').read_text('utf-8')
        png=(p/'restored-main/screen.png').read_bytes();c=self.collector()
        original=json.loads((p/'first-attempt-restore.json').read_text('utf-8'))
        self.meta.update(homeComponent=HOME,systemuiIdentity=original['metadata']['systemuiIdentity'])
        self.j.data['rotationState']=g.initial({'auto':'0','user':'0'},'0');self.j.data['rotationState']['confirmed']='1'
        responses={'dumpsys power':'mWakefulness=Awake','dumpsys window':raw,'dumpsys window windows':wm,
            'settings get system accelerometer_rotation':'0','settings get system user_rotation':'1'}
        calls=[]
        def shell(cmd,**kw):calls.append(cmd);return responses[cmd]
        c.ar=type('AR',(),{'shell':staticmethod(shell),'adb':staticmethod(lambda *a,**kw:png)})()
        obs=c.rotation_observation('real-native')
        self.assertEqual(obs['component'],HOME);self.assertEqual(obs['actual'],'0');self.assertEqual(obs['size'],[1216,2688])
        self.assertEqual(obs['native']['user'],'1','Preference must not be mistaken for actual rotation')
        self.assertFalse(g.target_ready(obs,'0',HOME))
        responses['dumpsys window windows']=wm+'\n'+base.wm_window(0,'foreign.overlay','[0,0][1216,2688]',300000)
        with self.assertRaisesRegex(RuntimeError,'overlay'):c.rotation_observation('bad-overlay')
        self.assertFalse(any('am start' in x or 'settings put' in x for x in calls))
    def test_rotation_external_return_to_original_never_overwritten(self):
        c,s,w,e,now=self.make('1','1',WIDE);w['user']='0'
        with self.assertRaisesRegex(RuntimeError,'External'):c.restore_rotation()
        self.assertFalse(any(x.startswith(('settings ','am ')) for x in e));self.assertFalse(s['restored'])
    def test_rotation_intent_alone_cannot_own_target(self):
        c,s,w,e,now=self.make();s['inflight']={'before':'0','target':'1','transportCalled':False,'phase':'intent'};w['user']='1'
        self.assertFalse(g.owned(s,'1'))
        with self.assertRaisesRegex(RuntimeError,'External'):c.restore_rotation()
        self.assertFalse(any(x.startswith(('settings ','am ')) for x in e))
    def test_rotation_before_transport_failure_cancels_without_target_ownership(self):
        c,s,w,e,now=self.make();obs=c.rotation_observation('before')
        def fail(*a,**kw):raise OSError('local pretransport')
        c.fresh_input=fail
        with self.assertRaisesRegex(OSError,'pretransport'):c.rotation_write('io','1',obs)
        self.assertEqual(w['user'],'0');self.assertEqual(s['confirmed'],'0');self.assertIsNone(s['inflight']);self.assertFalse(g.owned(s,'1'))
    def test_rotation_called_timeout_pair_can_restore_only_its_actual_values(self):
        c,s,w,e,now=self.make();obs=c.rotation_observation('before');original=c.fresh_input
        def fail(label,command,observation,execution,**kwargs):
            execution.update(transportCalled=True,transportReturned=False);w.update(user='1',actual='1',component=WIDE)
            raise TimeoutError('dispatched reply missing')
        c.fresh_input=fail
        with self.assertRaisesRegex(TimeoutError,'dispatched'):c.rotation_write('lost','1',obs)
        durable=json.loads(self.j.path.read_text('utf-8'))['rotationState'];self.assertTrue(durable['inflight']['transportCalled']);self.assertFalse(durable['inflight']['transportReturned'])
        self.assertTrue(g.owned(s,'1'));self.assertFalse(g.owned(s,'3'))
        c.fresh_input=original
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):c.restore_rotation()
        self.assertEqual(w['user'],'0');self.assertEqual(w['component'],HOME);self.assertTrue(s['restored'])
    def test_rotation_restore_owns_zero_before_home_and_closes_observers(self):
        c,s,w,e,now=self.make('1','1',WIDE)
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):c.restore_rotation()
        self.assertLess(e.index('settings put system user_rotation 0'),e.index('am start -W -n '+HOME))
        self.assertTrue(s['observersFinished']);self.assertTrue(s['restored']);self.assertEqual(s['readbacks'],[{'auto':'0','user':'0'}]*2)
        with self.assertRaisesRegex(RuntimeError,'Observer prohibited'):c.input_observation('late')
        with self.assertRaisesRegex(RuntimeError,'Observer prohibited'):c.observe('late')
    def test_rotation_never_connects_observer_on_actual180_or270(self):
        p=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-162234-e9b5a759'
        raw=(p/'recovery-inspect/window.txt').read_text('utf-8')
        for rotation,preference,pngname in [('2','0','portrait-reference-fixture.png'),('3','1','landscape-reference-fixture.png')]:
            with self.subTest(actual=rotation):
                c,s,w,e,now=self.make(preference,preference,PLAIN if preference=='0' else WIDE)
                def shell(command,**kwargs):
                    if command=='dumpsys power':return 'mWakefulness=Awake'
                    if command=='dumpsys window':return raw.replace('mRotation=0 mDeferredRotationPauseCount','mRotation='+rotation+' mDeferredRotationPauseCount')
                    self.fail('Unexpected operation before rejected observer '+command)
                c.ar.shell=shell;c.ar.adb=lambda *a,**kw:(p/pngname).read_bytes()
                with self.assertRaisesRegex(RuntimeError,'physical rotation'):c.input_observation('wrong-actual-'+rotation)
                self.assertEqual(w['user'],preference)
    def test_rotation_wrong_component_or_direction_never_enables_capture(self):
        good={'component':WIDE,'actual':'1','native':{'auto':'0','user':'1'},'size':[2688,1216]}
        self.assertTrue(g.target_ready(good,'1',WIDE))
        for changes in [dict(component=PLAIN),dict(actual='3'),dict(size=[1216,2688]),dict(native={'auto':'0','user':'0'})]:
            self.assertFalse(g.target_ready(dict(good,**changes),'1',WIDE))
        c,s,w,e,now=self.make('1','1',WIDE)
        c.rotation_observation=lambda *a:dict(good,component=PLAIN)
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):
            with self.assertRaisesRegex(RuntimeError,'bounded wait'):c.rotation_wait('wrong','1',WIDE)
        self.assertEqual(e,[])
    def test_rotation_stale_source_does_not_write_or_navigate(self):
        c,s,w,e,now=self.make();obs=c.rotation_observation('before');now[0]+=2.501
        with patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaises(m.InputExpired):c.rotation_write('old','1',obs)
        self.assertEqual(w['user'],'0');self.assertIsNone(s['inflight']);self.assertFalse(any(x.startswith('settings ') for x in e))
    def test_rotation_restore_final497_follows_all_native_restore_and_protection(self):
        c,s,w,e,now=self.make('1','1',WIDE)
        c.identity=lambda label:e.append(label);c.native_action=lambda *a:None;c.settled_state=lambda *a:e.append('leases')
        def protection():
            self.assertTrue(s['observersFinished']);self.assertTrue(s['restored']);self.assertEqual(w['user'],'0');e.append('protection');return {}
        c.protection=protection
        original_shell=c.ar.shell
        c.ar.shell=lambda cmd,**kw: 'idle' if cmd=='dumpsys media_projection' else original_shell(cmd,**kw)
        c.ar.projection_is_idle=lambda _:True
        def instrument(op,label,values=None):e.append(label);return {'settings':dict(self.base)}
        c.instrument=instrument
        with patch.object(m.safe.Runner,'cleanup',lambda _:None),patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):c.restore()
        self.assertEqual(e[-2:],['restore-final-first','restore-final']);self.assertLess(e.index('protection'),len(e)-2)
        self.assertFalse(self.j.data['pending'])
    def test_rotation_real_wrong_task_receipt_stops_before_wait(self):
        p=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-165337-97d2ce13'
        raw=json.loads((p/'portrait-reference-navigate-action.json').read_text('utf-8'))['transportOutput']
        with self.assertRaisesRegex(RuntimeError,'different activity'):g.launch_receipt(raw,PLAIN)
        self.assertEqual(g.launch_receipt(raw,WIDE),WIDE,'Same-task warning alone is not failure when target is exact')
        for invalid in ['Status: ok',raw+'\nActivity: '+WIDE,raw.replace('Status: ok','Status: timeout'),raw+'\nError: blocked']:
            with self.assertRaises(RuntimeError):g.launch_receipt(invalid,WIDE)
        c,s,w,e,now=self.make();calls=[]
        def wrong(command,**kw):calls.append(command);return raw
        c.ar.shell=wrong;c.rotation_wait=lambda *a:self.fail('Wrong task receipt must not enter native target wait')
        with patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaisesRegex(RuntimeError,'different activity'):c.fixture_page('portrait',False)
        self.assertEqual(calls,['am start -W --activity-clear-top -n '+PLAIN])
        self.assertEqual(s['history'],[]);self.assertEqual(self.j.data['captureTickets'],{})
        self.assertEqual(json.loads((self.folder/'portrait-navigate-action.json').read_text('utf-8'))['transportOutput'],raw)
    def test_rotation_restore_attempts_preserve_previous_raw_and_action(self):
        c,s,w,e,now=self.make('1','1',WIDE);observe=c.rotation_observation
        def recorded(label,*args):
            value=observe(label,*args);folder=self.folder/label;folder.mkdir(exist_ok=False)
            (folder/'proof.json').write_text(json.dumps({k:v for k,v in value.items() if k!='inputObservation'}),'utf-8')
            return value
        c.rotation_observation=recorded;original_wait=c.rotation_wait
        def first_failure(label,*args):
            c.rotation_observation(label+'-0');raise RuntimeError('First restore proof failed')
        c.rotation_wait=first_failure
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):
            with self.assertRaisesRegex(RuntimeError,'First restore'):c.restore_rotation()
            before={str(p.relative_to(self.folder)):p.read_bytes() for p in self.folder.rglob('*') if p.is_file() and 'attempt-001' in str(p)}
            self.assertTrue(any(k.endswith('-home-action.json') for k in before))
            c.rotation_wait=original_wait;c.restore_rotation()
        self.assertEqual(s['restoreAttempt'],2);self.assertTrue(s['restored'])
        self.assertTrue(any('attempt-002' in str(p) for p in self.folder.rglob('*')))
        self.assertTrue(all((self.folder/k).read_bytes()==v for k,v in before.items()))
    def test_rotation_known_geometry_only_waits_within_existing_limit(self):
        c,s,w,e,now=self.make();calls=[]
        ready=dict(component=HOME,actual='0',size=[1216,2688],native={'auto':'0','user':'0'})
        def pending_then_ready(label,deadline):
            calls.append((label,deadline))
            if len(calls)==1:raise g.KnownGeometryPending('Known transposed owner')
            return ready
        c.rotation_observation=pending_then_ready
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):
            self.assertEqual(c.rotation_wait('settle','0',HOME),ready)
        self.assertEqual(len(calls),2);self.assertEqual({x[1] for x in calls},{16.})
        def foreign(label,deadline):calls.append((label,deadline));raise RuntimeError('Unknown overlay')
        calls.clear();c.rotation_observation=foreign
        with self.assertRaisesRegex(RuntimeError,'Unknown overlay'):c.rotation_wait('foreign','0',HOME)
        self.assertEqual(len(calls),1)
        calls.clear()
        def forever(label,deadline):calls.append((label,deadline));raise g.KnownGeometryPending('Pending')
        c.rotation_observation=forever
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m.time,'sleep',lambda _:None):
            with self.assertRaisesRegex(RuntimeError,'bounded wait'):c.rotation_wait('limit','0',HOME)
        self.assertEqual(len(calls),6);self.assertEqual({x[1] for x in calls},{16.});self.assertEqual(e,[])
    def test_rotation_actual_geometry_refusal_is_narrow_and_raw_not_overwritten(self):
        p=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-165337-97d2ce13/portrait-reference-native-ready-0'
        raw=(p/'window-private.txt').read_text('utf-8');wm=(p/'windows-private.txt').read_text('utf-8');png=(p/'screen.png').read_bytes()
        c=self.collector();self.meta['homeComponent']=HOME
        journal=json.loads((p.parent/'first-attempt-restore.json').read_text('utf-8'))
        self.meta['systemuiIdentity']=journal['metadata']['systemuiIdentity'];self.j.data['rotationState']=g.initial({'auto':'0','user':'0'},'0')
        # Replay actual PNG/native pair first; wrong target readiness remains false.
        answers={'dumpsys power':'mWakefulness=Awake','dumpsys window':raw,'dumpsys window windows':wm,
                 'settings get system accelerometer_rotation':'0','settings get system user_rotation':'0'}
        c.ar=type('AR',(),{'shell':staticmethod(lambda cmd,**kw:answers[cmd]),'adb':staticmethod(lambda *a,**kw:png)})()
        observed=c.rotation_observation('actual');self.assertEqual(observed['component'],WIDE)
        self.assertFalse(g.target_ready(observed,'0',PLAIN))
        saved=(self.folder/'actual/screen.png').read_bytes()
        with self.assertRaises(FileExistsError):c.rotation_observation('actual')
        self.assertEqual((self.folder/'actual/screen.png').read_bytes(),saved)
        # Deliberately synthesize sequential-read geometry mismatch; not phone proof.
        answers['dumpsys window']=raw.replace('mRotation=1 mDeferredRotationPauseCount','mRotation=0 mDeferredRotationPauseCount')
        with self.assertRaises(g.KnownGeometryPending):c.rotation_observation('sequential')
        self.assertTrue(json.loads((self.folder/'sequential/observation.json').read_text('utf-8'))['geometryPending'])
        answers['dumpsys window windows']=wm+'\n'+base.wm_window(0,'foreign.overlay','[0,0][2688,1216]',300000)
        with self.assertRaisesRegex(RuntimeError,'overlay'):c.rotation_observation('foreign')

# Reuse setup helpers without silently rerunning the old broad test collection.
if __name__=='__main__':
    names=sys.argv[1:] or [n for n in Tests.__dict__ if n.startswith('test_rotation_')]
    if any(n not in Tests.__dict__ or not n.startswith('test_rotation_') for n in names):raise SystemExit('Unknown scoped test')
    suite=unittest.TestSuite(Tests(n) for n in names)
    result=unittest.TextTestRunner(verbosity=2).run(suite)
    raise SystemExit(0 if result.wasSuccessful() else 1)
