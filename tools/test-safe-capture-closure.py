"""Offline behavior tests. Never imports a runner main or contacts a device."""
from pathlib import Path
import copy, importlib.util, json, tempfile, unittest, time, sys, os, re
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
import adb_regression as ar
def forbidden(*args,**kwargs):raise AssertionError('Offline test attempted device access')
ar.adb=ar.shell=ar.instrument=forbidden
spec=importlib.util.spec_from_file_location('capture_closure',Path(os.environ.get('CAPTURE_CLOSURE_SOURCE',ROOT/'tools/run-safe-capture-closure-device.py')))
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)

def wm_window(rank,package,bounds,layer,pid='77',title='Window',extra=''):
    return ('  Window #%d Window{ab u0 %s}:\n mDisplayId=0 mSession=Session{ab %s:u0a123}\n package=%s\n mBaseLayer=%d mSubLayer=0\n'
        ' mHasSurface=true\n Frames: parent=[0,0][200,400] frame=%s\n Surface: shown=true\n isVisible=true\n %s\n')%(rank,title,pid,package,layer,bounds,extra)
def scene(overlay=None):
    fixture={'type':1,'active':True,'focused':True,'bounds':'[0,0][200,400]','root':{'package':m.safe.PACKAGE,'visible':True,'bounds':'[0,0][200,400]','children':[]}}
    target={'type':3,'active':False,'focused':False,'bounds':'[100,100][190,140]','root':{'package':m.safe.RECORDER,'visible':True,'bounds':'[100,100][190,140]',
        'children':[{'package':m.safe.RECORDER,'id':m.safe.RECORDER+':id/stop_bn','visible':True,'enabled':True,'clickable':True,'bounds':'[140,100][185,140]'}]}}
    wm='WINDOW MANAGER WINDOWS (dumpsys window windows)\n'+wm_window(1,m.safe.RECORDER,target['bounds'],290000,'88')+wm_window(2,m.safe.PACKAGE,fixture['bounds'],21000,'99')
    if overlay:wm+=wm_window(0,*overlay)
    return [target,fixture],'mCurrentFocus=Window{a u0 '+m.safe.PACKAGE+'/.PlainActivity}',wm,(200,400),time.monotonic()

def white_scene(overlay=None):
    observation=list(scene(overlay));observation[0]=[observation[0][1]]
    observation[0][0]['root']['children']=[{'package':m.safe.PACKAGE,'visible':True,
        'description':'duo_owned_audit_plain','bounds':'[0,20][200,380]'}]
    observation[2]='WINDOW MANAGER WINDOWS (dumpsys window windows)\n'+wm_window(2,m.safe.PACKAGE,'[0,0][200,400]',21000,'99')
    if overlay:observation[2]+=wm_window(0,*overlay)
    return observation

class Tests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.folder=Path(self.tmp.name)
        self.base={m.SHOT:'0',m.RECORD:'0',m.safe.SECURE_KEY:'1',**{'untouched-'+str(i):str(i) for i in range(494)}}
        self.meta={'protectionBefore':{},'density':1,'installedVersion':20461,'systemuiIdentity':{'pid':'77'}}
        self.j=m.Journal(self.folder/'restore.json',self.base,self.meta)
    def tearDown(self):self.tmp.cleanup()
    def collector(self):
        c=object.__new__(m.Collector);c.folder=self.folder;c.journal=self.j;c.report={'installedVersion':20461,'samples':[]};c.kind='screenshot'
        c.persist=lambda:None;return c
    def test_initial_journal_atomic_complete(self):
        d=json.loads(self.j.path.read_text('utf-8'))
        self.assertTrue(d['pending']);self.assertEqual(len(d['baseline']),497)
        self.assertIn('protectionBefore',d);self.assertEqual(d['captureTickets'],{})
    def test_optional_reviewed_schema_accepts_current_keys_and_preserves_legacy_guard(self):
        path=self.folder/'keys.json';current={**self.base,'new-monitor-items':'0','new-monitor-alpha':'100','new-monitor-custom':'0'}
        path.write_text(json.dumps(list(current)),encoding='utf-8');expected=m.expected_config_keys(path)
        m.validate_baseline({'moduleVersion':20496,'settings':current},20496,expected)
        m.validate_baseline({'moduleVersion':20496,'settings':self.base},20496)
        self.assertIsNone(m.expected_config_keys(None))
        with self.assertRaisesRegex(RuntimeError,'497'):m.validate_baseline({'moduleVersion':20496,'settings':current},20496)
        with self.assertRaisesRegex(RuntimeError,'version'):m.validate_baseline({'moduleVersion':20495,'settings':current},20496,expected)
    def test_reviewed_schema_rejects_missing_new_and_same_count_foreign_keys(self):
        expected=frozenset(self.base)
        variants=[{k:v for k,v in self.base.items() if k!='untouched-0'},{**self.base,'unexpected':'0'},
            {**{k:v for k,v in self.base.items() if k!='untouched-0'},'unexpected':'0'}]
        for settings in variants:
            with self.subTest(size=len(settings)):
                with self.assertRaisesRegex(RuntimeError,'key set'):m.validate_baseline({'moduleVersion':20496,'settings':settings},20496,expected)
    def test_reviewed_schema_requires_each_capture_key_in_file_and_baseline(self):
        for key in m.KEYS:
            keys=frozenset(self.base)-{key};path=self.folder/'keys.json';path.write_text(json.dumps(list(keys)),encoding='utf-8')
            with self.subTest(key=key):
                with self.assertRaisesRegex(ValueError,'capture key'):m.expected_config_keys(path)
                with self.assertRaisesRegex(RuntimeError,'key set'):m.validate_baseline({'moduleVersion':20496,'settings':{k:v for k,v in self.base.items() if k!=key}},20496,keys)
    def test_reviewed_schema_rejects_invalid_array_without_reading_device(self):
        path=self.folder/'keys.json'
        for value in ({'keys':list(self.base)},[1],[''],list(self.base)+[m.SHOT]):
            path.write_text(json.dumps(value),encoding='utf-8')
            with self.subTest(value_type=type(value).__name__):
                with self.assertRaisesRegex(ValueError,'JSON array'):m.expected_config_keys(path)
    def test_only_exact_observed_shade_titles_map_to_systemui(self):
        for title in ('NotificationShade','control_center'):
            self.assertEqual(m.focus_package('mCurrentFocus=Window{a u0 '+title+'}'),'com.android.systemui')
        for title in ('control_center_extra','Control_Center','controlcenter','NotificationShadeExtra','unknown_window'):
            with self.subTest(title=title):
                with self.assertRaisesRegex(RuntimeError,'Unknown native focus'):m.focus_package('mCurrentFocus=Window{a u0 '+title+'}')
    def test_control_center_title_keeps_native_package_and_unique_full_frame_checks(self):
        windows=[{'type':3,'active':True,'focused':True,'bounds':'[0,0][200,400]',
            'root':{'package':'com.android.systemui','visible':True,'bounds':'[0,0][200,400]','children':[]}}]
        focus='mCurrentFocus=Window{a u0 control_center}'
        prefix='WINDOW MANAGER WINDOWS (dumpsys window windows)\n'
        good=wm_window(0,'com.android.systemui','[0,0][200,400]',290000,title='control_center')
        self.assertEqual(m.proven_owner(windows,focus,prefix+good,(200,400),{'com.android.systemui'})[0],windows[0])
        bad=[wm_window(0,'foreign.package','[0,0][200,400]',290000,title='control_center'),
            wm_window(0,'com.android.systemui','[0,0][200,390]',290000,title='control_center'),
            good+wm_window(1,'com.android.systemui','[0,0][200,400]',290000,title='control_center')]
        for raw in bad:
            with self.subTest(native_windows=len(raw)):
                with self.assertRaisesRegex(RuntimeError,'exact native owner'):m.proven_owner(windows,focus,prefix+raw,(200,400),{'com.android.systemui'})
        foreign=copy.deepcopy(windows);foreign[0]['root']['package']='foreign.package'
        with self.assertRaisesRegex(RuntimeError,'mismatched native focus'):m.proven_owner(foreign,focus,prefix+good,(200,400),{'com.android.systemui'})
    def test_scope_rejects_other_key_before_write(self):
        before=self.j.path.read_bytes()
        with self.assertRaises(ValueError):self.j.plan({'untouched-0':'1'},self.base)
        self.assertEqual(before,self.j.path.read_bytes())
    def test_lost_set_reply_can_restore_inflight_owned_value(self):
        self.j.plan({m.SHOT:'1'},self.base);state=dict(self.base);state[m.SHOT]='1';writes=[]
        def instrument(op,label,values=None):
            if op=='set':writes.append(values);state.update(values);return {'runtimeSynced':True}
            return {'settings':dict(state)}
        self.j.restore_config(instrument)
        self.assertEqual(state,self.base);self.assertEqual(writes,[{m.SHOT:'0'}])
        # Helper success must not close the durable wrapper journal too early.
        self.assertTrue(json.loads(self.j.path.read_text('utf-8'))['pending'])
        self.j.data.update(finalChecksPending=False,pending=False);self.j.save()
        self.assertFalse(json.loads(self.j.path.read_text('utf-8'))['pending'])
    def test_foreign_owned_value_preserved(self):
        self.j.plan({m.SHOT:'1'},self.base);self.j.acknowledge({m.SHOT:'1'})
        state=dict(self.base);state[m.SHOT]='external';writes=[]
        def instrument(op,label,values=None):
            if op=='set':writes.append(values)
            return {'settings':dict(state)}
        with self.assertRaises(RuntimeError):self.j.restore(instrument,pause=lambda _:None)
        self.assertEqual(writes,[]);self.assertEqual(state[m.SHOT],'external')
        self.assertEqual(self.j.data['externalValuesPreserved'],{m.SHOT:'external'})
    def test_unrelated_mutation_stops_next_save(self):
        self.j.plan({m.SHOT:'1'},self.base);state=dict(self.base);state[m.SHOT]='1'
        self.assertEqual(m.config_conflicts(self.j.data,state),{})
        state['untouched-2']='outside';self.assertEqual(set(m.config_conflicts(self.j.data,state)),{'untouched-2'})
    def test_only_last_owned_not_historical_value(self):
        self.j.plan({m.SHOT:'1'},self.base);self.j.acknowledge({m.SHOT:'1'})
        cur=dict(self.base);cur[m.SHOT]='1';self.j.plan({m.SHOT:'0'},cur);self.j.acknowledge({m.SHOT:'0'})
        self.assertFalse(self.j.owned_value(m.SHOT,'1'))
    def test_external_return_to_original_is_not_owned_and_blocks_save(self):
        self.j.plan({m.SHOT:'1'},self.base);self.j.acknowledge({m.SHOT:'1'})
        self.assertFalse(self.j.owned_value(m.SHOT,'0'))
        self.assertEqual(set(m.config_conflicts(self.j.data,self.base)),{m.SHOT})
        c=self.collector();c.identity=lambda _:None
        def instrument(op,*args):
            self.assertEqual(op,'snapshot','Foreign original must not be overwritten')
            return {'settings':dict(self.base)}
        c.instrument=instrument
        with self.assertRaisesRegex(RuntimeError,'External'):c.set('next',{m.SHOT:'1'})
    def test_restore_preserves_external_original_and_other_value_pending(self):
        for external in ('0','outside'):
            with self.subTest(external=external):
                self.j.data.update(restore={},expected={},inflight={})
                self.j.plan({m.SHOT:'1'},self.base);self.j.acknowledge({m.SHOT:'1'})
                state=dict(self.base);state[m.SHOT]=external;writes=[]
                def instrument(op,label,values=None):
                    if op=='set':writes.append(dict(values));state.update(values)
                    return {'settings':dict(state)}
                with self.assertRaisesRegex(RuntimeError,'preserved'):self.j.restore(instrument,pause=lambda _:None)
                self.assertEqual(writes,[]);self.assertEqual(state[m.SHOT],external)
                durable=json.loads(self.j.path.read_text('utf-8'))
                self.assertTrue(durable['pending']);self.assertFalse(durable['ownedConfigurationRestored'])
                self.assertEqual(durable['externalValuesPreserved'],{m.SHOT:external})
    def test_restore_inflight_is_durable_before_commit_and_lost_ack_retry(self):
        self.j.plan({m.SHOT:'1'},self.base);self.j.acknowledge({m.SHOT:'1'})
        state=dict(self.base);state[m.SHOT]='1';lose=[True];writes=[]
        def instrument(op,label,values=None):
            if op=='set':
                durable=json.loads(self.j.path.read_text('utf-8'))
                self.assertEqual(durable['inflight'].get(m.SHOT),[state[m.SHOT],'0'])
                self.assertTrue(durable['pending']);self.assertEqual(durable['history'][-1]['restoreAttempt'],values)
                state.update(values);writes.append(dict(values))
                if lose[0]:raise RuntimeError('reply lost after commit')
                return {'runtimeSynced':True}
            return {'settings':dict(state)}
        with self.assertRaisesRegex(RuntimeError,'reply lost'):self.j.restore(instrument,pause=lambda _:None)
        restarted=m.Journal(self.j.path);self.assertTrue(restarted.owned_value(m.SHOT,'0'))
        self.assertEqual(restarted.data['expected'][m.SHOT],'1');lose[0]=False
        restarted.restore(instrument,pause=lambda _:None)
        self.assertEqual(state,self.base);self.assertEqual(restarted.data['expected'][m.SHOT],'0')
        self.assertEqual(restarted.data['inflight'],{});self.assertEqual(writes,[{m.SHOT:'0'},{m.SHOT:'0'}])
    def test_two_concurrent_tickets_survive_each_other(self):
        c=self.collector();c.files=lambda:set();c.kind='record';c.capture_begin('video')
        c.kind='screenshot';c.capture_begin('shot')
        self.assertEqual(set(json.loads(self.j.path.read_text('utf-8'))['captureTickets']),{'record','screenshot'})
        for ticket in self.j.data['captureTickets'].values():ticket['triggerAttempted']=True
        def finish(_c,label,suffix):
            self.assertEqual(_c.journal.data['nativeCapturePending']['label'],label)
            p=self.folder/(label+suffix);p.write_bytes(b'owned')
            self.j.data['ownedFiles'].append({'path':'remote/'+label,'sha256':m.sha(b'owned')})
            self.j.data['nativeCapturePending']=None;self.j.save();return p
        with patch.object(m.safe.Runner,'capture_result',finish):c.capture_result('shot','.jpg')
        self.assertEqual(set(self.j.data['captureTickets']),{'record'})
        self.assertEqual(self.j.data['nativeCapturePending']['label'],'video')
        with patch.object(m.safe.Runner,'capture_result',finish):c.capture_result('video','.mp4')
        self.assertFalse(self.j.data['captureTickets']);self.assertIsNone(self.j.data['nativeCapturePending'])
    def test_duplicate_or_wrong_ticket_rejected(self):
        c=self.collector();c.files=lambda:set();c.capture_begin('shot')
        with self.assertRaises(RuntimeError):c.capture_begin('other')
        with self.assertRaises(RuntimeError):c.capture_result('foreign','.jpg')
    def test_file_filter_never_cross_claims_recording_as_screenshot(self):
        files={'old.jpg','video.mp4','shot.PNG','../outside.jpg','partial.tmp','another.mp4'}
        self.assertEqual(m.split_files(files,'screenshot'),{'old.jpg','shot.PNG'})
        self.assertEqual(m.split_files(files,'record'),{'video.mp4','another.mp4'})
    def test_ambiguous_same_kind_output_not_claimed(self):
        c=self.collector();c.files=lambda:set();c.capture_begin('shot');c.files=lambda:{'a.jpg','b.jpg'}
        self.j.data['captureTickets']['screenshot']['triggerAttempted']=True
        with self.assertRaisesRegex(RuntimeError,'ambiguous'):c.capture_result('shot','.jpg')
        self.assertIn('screenshot',self.j.data['captureTickets']);self.assertEqual(self.j.data['ownedFiles'],[])
    def test_untriggered_result_rejected_even_when_one_new_file_exists(self):
        c=self.collector();c.files=lambda:set();c.capture_begin('shot');c.files=lambda:{'external.jpg'}
        with patch.object(m.safe.Runner,'capture_result',lambda *x:self.fail('Untriggered ticket entered native ownership code')):
            with self.assertRaisesRegex(RuntimeError,'not triggered'):c.capture_result('shot','.jpg')
        self.assertEqual(self.j.data['ownedFiles'],[])
    def test_actual_restore_never_adopts_untriggered_external_jpg_or_mp4(self):
        for kind,suffix in [('screenshot','.jpg'),('record','.mp4')]:
            with self.subTest(kind=kind):
                c=self.collector();self.j.data.update(captureTickets={kind:{'label':'not-sent','before':['original'+suffix],'triggerAttempted':False}},ownedFiles=[],cleanupMediaIdentities=[])
                c.identity=lambda _:None;c.identity_reader=type('R',(),{'idle_instrumentation':lambda _:None})()
                c.native_action=lambda *x:None;c.protection=lambda:{};c.settled_state=lambda *x:None
                c.known_navigation=lambda _:None;c.fresh_input=lambda *x:None;c.observe=lambda *x:None
                files={'original'+suffix,'external'+suffix};c.files=lambda:set(files)
                c.capture_result=lambda *x:self.fail('Untriggered file must never enter ownership/deletion path')
                c.ar=type('AR',(),{'shell':lambda *x:'idle','projection_is_idle':staticmethod(lambda _:True)})()
                c.instrument=lambda *x:{'settings':dict(self.base)}
                def cleanup(_):
                    self.assertEqual(self.j.data['ownedFiles'],[])
                    self.assertIsNone(self.j.data['nativeCapturePending'])
                with patch.object(m.safe.Runner,'cleanup',cleanup):c.restore()
                self.assertFalse(self.j.data['pending']);self.assertFalse(self.j.data['captureTickets']);self.assertEqual(files,{'original'+suffix,'external'+suffix})
                entry=self.j.data['untriggeredTicketsCancelled'][-1]
                self.assertEqual(entry['addedFilesPreserved'],['external'+suffix]);self.assertFalse(entry['claimed'])
    def test_overlay_blocks_native_tap(self):
        c=self.collector();c.native_action=lambda label,action:action();c.assert_owned_recorder=lambda **kw:None
        c.input_observation=lambda _:scene(('permission.controller','[120,90][190,150]',300000))
        c.fresh_input=lambda *x:self.fail('Must not tap through overlay')
        with self.assertRaisesRegex(RuntimeError,'intersecting'):c.tap('stop',identity=m.safe.RECORDER+':id/stop_bn')
    def test_real_native_window_parser_replays_saved_rom(self):
        raw=(ROOT/'out/full-function-audit-20261004/native-safe-20460-20261004-121638/post-failure-windows-private.txt').read_text('utf-8')
        rows=m.native_windows(raw);self.assertGreater(len(rows),3);self.assertTrue(all(w['pid'].isdigit() for w in rows))
    def real_navigation(self):
        folder=ROOT/'out/full-function-audit-20261004/capture-closure-20463-20261004-155444-9a7ec7e2'
        source=folder/'preflight-before-navigation'
        metadata=json.loads((folder/'restore.json').read_text('utf-8'))['metadata']
        self.meta.update(homeComponent=metadata['homeComponent'],systemuiIdentity=metadata['systemuiIdentity'])
        return [json.loads((source/'result-private.json').read_text('utf-8'))['uiWindows'],
            (source/'activity-private.txt').read_text('utf-8'),(source/'windows-private.txt').read_text('utf-8'),(1216,2688),time.monotonic()]
    def test_real_navigation_accepts_only_empty_offscreen_and_proven_low_wallpaper(self):
        observation=self.real_navigation();c=self.collector();c.input_observation=lambda _:observation
        self.assertEqual(c.known_navigation('real'),observation)
        rows=m.native_windows(observation[2])
        wallpaper=next(w for w in rows if w['title']=='com.android.systemui.wallpapers.ImageWallpaper')
        self.assertEqual((wallpaper['rank'],wallpaper['base'],wallpaper['pid']),(23,11000,'20209'))
        self.assertTrue(wallpaper['notTouchable'])
        # The precise inactive windows remain in parser evidence; only navigation
        # ignores their lack of positive intersection with this actual display.
        self.assertIn((0,1344,1216,1344),[w['bounds'] for w in rows])
        self.assertIn((-1216,0,0,2688),[w['bounds'] for w in rows])
    def test_real_wallpaper_wrong_identity_touchability_or_order_is_rejected(self):
        observation=self.real_navigation();c=self.collector()
        block=re.search(r'(?ms)^  Window #23 Window\{.*?(?=^  Window #24 Window\{)',observation[2]).group()
        variants=[block.replace('Window #23','Window #19'),block.replace('mBaseLayer=11000','mBaseLayer=21000'),
            block.replace('mSubLayer=0','mSubLayer=10000'),block.replace('NOT_TOUCHABLE',''),
            block.replace('20209:u0a10343','99999:u0a10343'),block.replace('package=com.android.systemui','package=foreign.wallpaper'),
            block.replace('com.android.systemui.wallpapers.ImageWallpaper','com.android.systemui.wallpapers.OtherWallpaper'),
            block.replace('mBaseLayer=11000 mSubLayer=0','')]
        for index,changed in enumerate(variants):
            with self.subTest(index=index):
                bad=list(observation);bad[2]=observation[2].replace(block,changed);c.input_observation=lambda _:bad
                with self.assertRaises(RuntimeError):c.known_navigation('bad-wallpaper')
    def test_empty_offscreen_does_not_exempt_real_overlap_or_malformed_rectangle(self):
        observation=self.real_navigation();c=self.collector()
        variants=[observation[2].replace('frame=[0,1344][1216,1344]','frame=[0,1344][1216,1345]'),
            observation[2].replace('frame=[-1216,0][0,2688]','frame=[-1216,0][1,2688]'),
            observation[2].replace('frame=[0,1344][1216,1344]','frame=[0,1344][1216,1343]'),
            observation[2]+'\n'+wm_window(0,'foreign.overlay','[0,0][1216,2688]',300000)]
        for index,changed in enumerate(variants):
            with self.subTest(index=index):
                bad=list(observation);bad[2]=changed;c.input_observation=lambda _:bad
                with self.assertRaises(RuntimeError):c.known_navigation('bad-area')
    def test_known_overlay_target_uses_real_native_order(self):
        obs=scene();point,row=m.hit_owner(*obs[:4],m.safe.RECORDER+':id/stop_bn',None)
        self.assertEqual(point,(162,120));self.assertEqual(row['pid'],'88')
        # Accessibility can look identical while native focus has moved elsewhere.
        with self.assertRaisesRegex(RuntimeError,'focus'):m.hit_owner(obs[0],'mCurrentFocus=Window{a u0 other.app/.Main}',obs[2],obs[3],m.safe.RECORDER+':id/stop_bn',None)
        with self.assertRaisesRegex(RuntimeError,'layer'):m.hit_owner(obs[0],obs[1],obs[2].replace('mBaseLayer=290000 mSubLayer=0',''),obs[3],m.safe.RECORDER+':id/stop_bn',None)
    def test_native_target_pid_mismatch_and_expired_tree_no_tap(self):
        c=self.collector();c.native_action=lambda label,action:action();c.assert_owned_recorder=lambda **kw:None
        c.input_observation=lambda _:scene();self.j.data['recorderPid']='89';c.fresh_input=lambda *x:self.fail('Wrong PID must not tap')
        with self.assertRaisesRegex(RuntimeError,'PID'):c.tap('stop',identity=m.safe.RECORDER+':id/stop_bn')
        c=self.collector();c.ar=type('AR',(),{'shell':lambda *x:self.fail('Expired tree must not send input')})()
        obs=list(scene());obs[4]=time.monotonic()-3
        with self.assertRaises(m.InputExpired):c.fresh_input('old','input tap 162 120',obs)
    def test_asleep_gate_never_wakes_or_dismisses(self):
        c=self.collector();commands=[]
        def shell(command):commands.append(command);return 'mWakefulness=Dozing'
        c.ar=type('AR',(),{'shell':staticmethod(shell)})()
        with self.assertRaisesRegex(RuntimeError,'wake'):c.fixture_page('asleep')
        self.assertEqual(commands,['dumpsys power'])
    def test_native_external_change_rejected_but_audited_save_status_allowed(self):
        c=self.collector();self.j.data['nativeRecorderSettings']={'system':{'recording_screen_status':None,'0':'0'}}
        self.j.data['nativeExpected']={'system':{'recording_screen_status':None,'0':'0'}}
        c.native_values=lambda:{'system':{'recording_screen_status':'3','0':'0'}}
        with self.assertRaises(RuntimeError):c.native_owned()
        self.j.data['nativePermitted']={'system/recording_screen_status':['3']};c.native_owned()
        c.native_values=lambda:{'system':{'recording_screen_status':'4','0':'0'}}
        with self.assertRaises(RuntimeError):c.native_owned()
        c.native_values=lambda:{'system':{'recording_screen_status':'3','0':'1'}}
        with self.assertRaises(RuntimeError):c.native_owned()
    def test_native_action_failure_keeps_inflight_not_new_ownership(self):
        c=self.collector();c.native_values=lambda:{'system':{'0':'0'}};c.native_owned=lambda:None
        def fail():raise RuntimeError('lost transport')
        with self.assertRaises(RuntimeError):c.native_action('start',fail)
        self.assertEqual(self.j.data['nativeExpected'],{})
        self.assertEqual(json.loads(self.j.path.read_text('utf-8'))['nativeInflight']['label'],'start')
    def test_stale_build_pid_revision_not_surface_proof(self):
        state={'ls_augment_diagnostics_v2':{'ls_augment_rm_capture_surface_snapshot':'b=20461|p=77|r=900|leases=0|retired=0'}}
        self.assertTrue(m.surface(state,20461,77,900)['currentIdentity'])
        for v,p,r in [(20460,77,900),(20461,78,900),(20461,77,901)]:self.assertFalse(m.surface(state,v,p,r)['currentIdentity'])
    def test_cv1_requires_current_revision_not_stale_ready(self):
        state={'ls_augment_config_v2':{'snapshot_revision_v1':'900'},'ls_augment_diagnostics_v2':{
            'ls_augment_rm_capture_client_start_0':'CV1|b=20461|r=899|g=1',
            'ls_augment_rm_capture_server_start_0':'CV1|b=20461|r=900|g=1'}}
        result=m.cv1(state,20461,0);self.assertFalse(result['client']['currentBuildRevision']);self.assertTrue(result['server']['currentBuildRevision'])
    def test_lease_must_match_exactly_and_clear_retired(self):
        c=self.collector();good={'ls_augment_config_v2':{'snapshot_revision_v1':'900'},'ls_augment_diagnostics_v2':{
            'ls_augment_rm_capture_surface_snapshot':'b=20461|p=77|r=900|leases=1|retired=0|ap=true|ex=true'}}
        c.state=lambda _:good;self.assertEqual(c.settled_state('active',1)['snapshot']['leases'],'1')
        for old,new in [('leases=1','leases=0'),('retired=0','retired=1'),('ap=true','ap=false'),('ex=true','ex=false')]:
            bad=copy.deepcopy(good);key='ls_augment_rm_capture_surface_snapshot';bad['ls_augment_diagnostics_v2'][key]=bad['ls_augment_diagnostics_v2'][key].replace(old,new);c.state=lambda _:bad
            with patch.object(m.time,'sleep',lambda _:None):
                with self.assertRaises(RuntimeError):c.settled_state('active',1)
    def test_combinations_and_unknown_cases_rejected_before_any_action(self):
        c=self.collector();c.identity=lambda _:self.fail('Unsupported case must stop before phone reads')
        for cases in (['combinations'],['basic','combinations'],[],['basic','basic'],['other']):
            with self.subTest(cases=cases):
                with self.assertRaisesRegex(ValueError,'45-second'):c.run(cases)
        for cases in (['basic'],['rotation'],['basic','rotation']):m.supported_cases(cases)
    def test_fresh_action_rechecks_after_slow_durable_log(self):
        c=self.collector();now=[10.];observation=list(white_scene());observation[4]=10.;commands=[]
        c.ar=type('AR',(),{'shell':staticmethod(lambda command:commands.append(command))})()
        original_atomic=m.atomic
        def slow_atomic(path,data):original_atomic(path,data);now[0]+=3
        with patch.object(m.time,'monotonic',lambda:now[0]),patch.object(m,'atomic',slow_atomic):
            with self.assertRaisesRegex(m.InputExpired,'after action log'):c.fresh_input('slow','input keyevent KEYCODE_SYSRQ',observation)
        self.assertEqual(commands,[])
        row=json.loads((self.folder/'slow-action.json').read_text('utf-8'))
        self.assertFalse(row['transportAttempted']);self.assertEqual(row['freshAgeMs'],3000)
    def test_fresh_input_boundary_and_actual_return_record(self):
        c=self.collector();now=[12.5];observation=list(white_scene());observation[4]=10.;commands=[]
        def shell(command):commands.append(command);now[0]+=.12
        c.ar=type('AR',(),{'shell':staticmethod(shell)})()
        with patch.object(m.time,'monotonic',lambda:now[0]):row=c.fresh_input('edge','input keyevent KEYCODE_SYSRQ',observation)
        self.assertEqual(len(commands),1);self.assertEqual(row['freshAgeMs'],2500)
        self.assertTrue(row['transportAttempted']);self.assertAlmostEqual(row['inputReturn']-row['inputCall'],.12)
    def test_screenshot_last_observation_requires_exact_marker_activity_and_no_overlay(self):
        c=self.collector();self.meta['homeComponent']='com.zte.mifavor.launcher/.Launcher'
        good=white_scene();c.input_observation=lambda _:good
        self.assertEqual(c.screenshot_observation('good',False),good)
        bads=[]
        missing=copy.deepcopy(good);missing[0][0]['root']['children']=[];bads.append(missing)
        wrong=copy.deepcopy(good);wrong[1]=wrong[1].replace('PlainActivity','SecureActivity');bads.append(wrong)
        duplicate=copy.deepcopy(good);duplicate[0][0]['root']['children']*=2;bads.append(duplicate)
        bads.append(white_scene(('permission.controller','[0,0][200,400]',300000)))
        old=copy.deepcopy(good);old[4]-=3;bads.append(old)
        for index,bad in enumerate(bads):
            with self.subTest(index=index):
                c.input_observation=lambda _:bad
                with self.assertRaises(RuntimeError):c.screenshot_observation('bad',False)
        c.input_observation=lambda _:good
        with self.assertRaisesRegex(RuntimeError,'activity'):c.screenshot_observation('wrong-direction',True)
    def screenshot_pipeline(self,save_seconds=.2,ticket_seconds=0):
        c=self.collector();events=[];now=[10.];state=dict(self.base)
        c.fixture_page=lambda *args:events.append('fixture');c.files=lambda:set()
        c.state=lambda label:events.append('state') or {}
        c.identity=lambda label:events.append('identity')
        def instrument(op,label,values=None):
            events.append(op)
            if op=='set':state.update(values);now[0]+=save_seconds;return {'runtimeSynced':True}
            return {'settings':dict(state)}
        c.instrument=instrument
        def observation(*args):
            self.assertTrue(self.j.data['inflight']);events.append('fresh')
            obs=list(white_scene());obs[4]=now[0];return obs
        c.screenshot_observation=observation
        def shell(command):events.append(command);now[0]+=.05
        def adb(*args,**kwargs):events.append('pidof');return b''
        c.ar=type('AR',(),{'shell':staticmethod(shell),'adb':staticmethod(adb)})()
        def result(*args):
            events.append('result');p=self.folder/'result.jpg';p.write_bytes(b'owned-pixels');return p
        c.capture_result=result
        original=self.j.save
        def save():
            original()
            if self.j.data.get('captureTickets',{}).get('screenshot',{}).get('triggerPhase')=='intent':now[0]+=ticket_seconds
        self.j.save=save
        return c,events,now,state
    def test_screenshot_fresh_source_after_plan_no_phone_query_after_save(self):
        c,events,now,state=self.screenshot_pipeline()
        with patch.object(m.time,'monotonic',lambda:now[0]):row=c.screenshot('owned',{m.SHOT:'1'})
        self.assertLess(events.index('identity'),events.index('snapshot'))
        self.assertLess(events.index('snapshot'),events.index('fresh'));self.assertLess(events.index('fresh'),events.index('set'))
        self.assertEqual(events[events.index('set')+1],'input keyevent KEYCODE_SYSRQ')
        self.assertEqual(row['captureWindow']['freshAgeMs'],200)
        self.assertFalse(row['captureWindow']['phoneReadBetweenSaveAndTrigger'])
    def test_slow_save_or_trigger_journal_never_sysrq_or_claims(self):
        for save_seconds,ticket_seconds in [(2.6,0),(.2,2.4)]:
            with self.subTest(save_seconds=save_seconds,ticket_seconds=ticket_seconds):
                self.j.data.update(restore={},expected={},inflight={},captureTickets={})
                c,events,now,state=self.screenshot_pipeline(save_seconds,ticket_seconds)
                with patch.object(m.time,'monotonic',lambda:now[0]):
                    with self.assertRaises(m.InputExpired):c.screenshot('late',{m.SHOT:'1'})
                self.assertNotIn('input keyevent KEYCODE_SYSRQ',events);self.assertNotIn('result',events)
                ticket=json.loads(self.j.path.read_text('utf-8'))['captureTickets']['screenshot']
                self.assertFalse(ticket['triggerAttempted']);self.assertEqual(state[m.SHOT],'1')
                self.assertEqual(self.j.data['expected'][m.SHOT],'1','Saved configuration remains owned for recovery')
                timing=json.loads((self.folder/'late-capture-window.json').read_text('utf-8'))
                self.assertFalse(timing['triggerAttempted']);self.assertGreater(timing['freshAgeMs'],2500)
                self.assertIsNotNone(timing['setReturn'])
    def assert_ticket_cannot_claim(self,c,label,expected):
        ticket=json.loads(self.j.path.read_text('utf-8'))['captureTickets']['screenshot']
        self.assertIs(ticket['triggerAttempted'],expected)
        self.assertEqual(self.j.data['ownedFiles'],[])
        c.files=lambda:{'coincident-external.jpg'}
        with patch.object(m.safe.Runner,'capture_result',lambda *args:self.fail('Unconfirmed SYSRQ cannot enter media ownership')):
            with self.assertRaisesRegex(RuntimeError,'not triggered'):m.Collector.capture_result(c,label,'.jpg')
    def test_action_atomic_error_before_shell_cancels_ticket(self):
        c,events,now,state=self.screenshot_pipeline();original=m.atomic
        def fail_action(path,data):
            if str(path).endswith('io-sysrq-action.json'):raise OSError('action log failed before shell')
            original(path,data)
        with patch.object(m,'atomic',fail_action),patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaisesRegex(OSError,'before shell'):c.screenshot('io',{m.SHOT:'1'})
        self.assertNotIn('input keyevent KEYCODE_SYSRQ',events);self.assertNotIn('result',events)
        self.assert_ticket_cannot_claim(c,'io',False)
        self.assertEqual(self.j.data['captureTickets']['screenshot']['triggerPhase'],'before_transport')
    def test_ticket_log_error_before_shell_cancels_before_and_after_write(self):
        for after_write in (False,True):
            with self.subTest(after_write=after_write):
                self.j.data.update(restore={},expected={},inflight={},captureTickets={})
                c,events,now,state=self.screenshot_pipeline();original=self.j.save
                def fail_ticket():
                    intent=self.j.data.get('captureTickets',{}).get('screenshot',{}).get('triggerPhase')=='intent'
                    if not intent or after_write:original()
                    if intent:raise OSError('ticket intent log failed')
                self.j.save=fail_ticket
                with patch.object(m.time,'monotonic',lambda:now[0]):
                    with self.assertRaisesRegex(OSError,'intent'):c.screenshot('ticket',{m.SHOT:'1'})
                self.assertNotIn('input keyevent KEYCODE_SYSRQ',events);self.assertNotIn('result',events)
                self.assert_ticket_cannot_claim(c,'ticket',False)
                self.j.save=m.Journal.save.__get__(self.j,m.Journal)
    def test_shell_called_error_is_unknown_not_zero_input_or_ownership(self):
        c,events,now,state=self.screenshot_pipeline()
        def shell(command):
            durable=json.loads(self.j.path.read_text('utf-8'))['captureTickets']['screenshot']
            self.assertIsNone(durable['triggerAttempted'],'Write-ahead intent must not claim a completed trigger')
            events.append(command);raise TimeoutError('transport reply unknown')
        c.ar.shell=shell
        with patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaisesRegex(TimeoutError,'unknown'):c.screenshot('uncertain',{m.SHOT:'1'})
        self.assertEqual(events.count('input keyevent KEYCODE_SYSRQ'),1);self.assertNotIn('result',events)
        self.assert_ticket_cannot_claim(c,'uncertain',None)
        ticket=self.j.data['captureTickets']['screenshot'];self.assertEqual(ticket['triggerPhase'],'transport_uncertain')
        action=json.loads((self.folder/'uncertain-sysrq-action.json').read_text('utf-8'))
        self.assertTrue(action['transportAttempted']);self.assertFalse(action['transportReturned'])
    def test_actual_restore_keeps_uncertain_ticket_and_external_file_pending(self):
        c=self.collector();self.j.data['captureTickets']={'screenshot':{'label':'unknown','before':[],'triggerAttempted':None,'triggerPhase':'transport_uncertain'}}
        c.identity=lambda _:None;c.identity_reader=type('R',(),{'idle_instrumentation':lambda _:None})()
        c.native_action=lambda *x:None;c.protection=lambda:{};c.settled_state=lambda *x:None
        c.known_navigation=lambda _:self.fail('Unresolved capture must not navigate');c.files=lambda:{'external.jpg'}
        c.ar=type('AR',(),{'shell':lambda *x:'idle','projection_is_idle':staticmethod(lambda _:True)})()
        c.instrument=lambda *x:{'settings':dict(self.base)}
        def cleanup(_):
            self.assertEqual(self.j.data['ownedFiles'],[])
            self.assertIsNone(self.j.data['nativeCapturePending']['triggerAttempted'])
        ownership_entries=[]
        def forbidden_ownership(*args):
            ownership_entries.append(True)
            raise AssertionError('No uncertain ownership')
        with patch.object(m.safe.Runner,'cleanup',cleanup),patch.object(m.safe.Runner,'capture_result',forbidden_ownership):
            with self.assertRaisesRegex(RuntimeError,'pending'):c.restore()
        self.assertEqual(ownership_entries,[],'Recovery must reject before calling the media ownership adapter')
        durable=json.loads(self.j.path.read_text('utf-8'))
        self.assertTrue(durable['pending']);self.assertTrue(durable['configurationRestored']);self.assertIn('screenshot',durable['captureTickets'])
        self.assertEqual(durable['ownedFiles'],[]);self.assertEqual(c.files(),{'external.jpg'})
    def test_returned_shell_then_action_log_error_is_distinct_from_timeout(self):
        c,events,now,state=self.screenshot_pipeline();original=m.atomic
        def fail_after_return(path,data):
            if str(path).endswith('returned-sysrq-action.json') and data.get('transportReturned'):raise OSError('post-return log error')
            original(path,data)
        with patch.object(m,'atomic',fail_after_return),patch.object(m.time,'monotonic',lambda:now[0]):
            with self.assertRaisesRegex(OSError,'post-return'):c.screenshot('returned',{m.SHOT:'1'})
        self.assertEqual(events.count('input keyevent KEYCODE_SYSRQ'),1);self.assertNotIn('result',events)
        ticket=json.loads(self.j.path.read_text('utf-8'))['captureTickets']['screenshot']
        self.assertIs(ticket['triggerAttempted'],True);self.assertEqual(ticket['triggerPhase'],'transport_returned')
    def test_real_pixels_not_ack_determine_screenshot_heuristic(self):
        import numpy as np
        from PIL import Image
        c=self.collector();base=np.full((400,200,3),255,dtype=np.uint8);base[12:30,15:40]=0;base[160:170,50:150]=[18,52,90]
        hidden=base.copy();hidden[12:30,15:40]=255
        for name,arr in [('portrait-reference',base),('current-on',hidden),('current-off',base)]:
            Image.fromarray(arr).save(self.folder/(name+'.png'));c.report['samples'].append({'label':name,'artifact':name+'.png','kind':'screenshot','landscape':False})
        c.pixel_summary();self.assertTrue(c.report['machineScreenshotChecks']);self.assertEqual(c.report['samples'][1]['bodyComparison']['changedPixels'],0)
        Image.fromarray(base).save(self.folder/'current-on.png');c.pixel_summary();self.assertFalse(c.report['machineScreenshotChecks'])
        self.assertFalse(c.report['wholeFeaturePassed']);self.assertEqual(c.report['phonePhysicalDisplay'],'not_observed_by_capture_API')
    def test_final_observation_config_drift_keeps_pending_and_false(self):
        c=self.collector();state=dict(self.base);c.identity=lambda _:None;c.identity_reader=type('R',(),{'idle_instrumentation':lambda _:None})()
        c.native_action=lambda label,action:None;c.protection=lambda:{};c.settled_state=lambda *x:None
        class AR:
            def shell(self,command):return 'MEDIA PROJECTION MANAGER\nMedia Projection: null'
            projection_is_idle=staticmethod(lambda _:True)
        c.ar=AR()
        def instrument(op,label,values=None):
            if op=='set':state.update(values);return {}
            return {'settings':dict(state)}
        c.instrument=instrument;c.observe=lambda _:state.update({'untouched-4':'external'})
        c.known_navigation=lambda _:None;c.fresh_input=lambda *x:None
        with patch.object(m.safe.Runner,'cleanup',lambda _:None):
            with self.assertRaises(RuntimeError):c.restore()
        self.assertFalse(self.j.data['configurationRestored']);self.assertTrue(self.j.data['pending'])
        self.assertEqual(state['untouched-4'],'external');self.assertTrue(json.loads(self.j.path.read_text('utf-8'))['pending'])
    def test_final_full_snapshot_is_last_device_operation(self):
        c=self.collector();events=[];c.identity=lambda label:events.append(label);c.identity_reader=type('R',(),{'idle_instrumentation':lambda _:events.append('idle')})()
        c.native_action=lambda label,action:None;c.protection=lambda:events.append('protection') or {}
        c.settled_state=lambda *x:events.append('leases');c.known_navigation=lambda _:None;c.fresh_input=lambda *x:events.append('home');c.observe=lambda _:events.append('pixels')
        class AR:
            def shell(self,command):events.append('projection');return 'idle'
            projection_is_idle=staticmethod(lambda _:True)
        c.ar=AR()
        def instrument(op,label,values=None):events.append(label);return {'settings':dict(self.base)}
        c.instrument=instrument
        with patch.object(m.safe.Runner,'cleanup',lambda _:None):c.restore()
        self.assertEqual(events[-1],'restore-final');self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
    def test_unknown_restore_surface_skips_input_but_verifies_all_config(self):
        c=self.collector();c.identity=lambda _:None;c.identity_reader=type('R',(),{'idle_instrumentation':lambda _:None})()
        c.native_action=lambda *x:None;c.protection=lambda:{};c.settled_state=lambda *x:None
        c.known_navigation=lambda _:(_ for _ in ()).throw(RuntimeError('Unknown foreground'))
        c.fresh_input=lambda *x:self.fail('No HOME through unknown window');c.observe=lambda *x:self.fail('No pretend restored screenshot')
        c.ar=type('AR',(),{'shell':lambda *x:'idle','projection_is_idle':staticmethod(lambda _:True)})()
        c.instrument=lambda *x:{'settings':dict(self.base)}
        with patch.object(m.safe.Runner,'cleanup',lambda _:None):c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
        self.assertIn('not_sampled',c.report['restoredScreen'])

if __name__=='__main__':unittest.main(verbosity=2)
