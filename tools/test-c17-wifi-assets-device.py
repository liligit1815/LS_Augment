"""Offline collector fault/restore tests. Unexpected device operations always fail."""
import base64
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import zipfile
from types import SimpleNamespace

spec = importlib.util.spec_from_file_location('wifi_assets_collector', Path(__file__).with_name('run-c17-wifi-assets-device.py'))
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
VERSION = {'versionCode': 20454, 'versionName': '2.0.0-alpha1-test20454'}
PROFILE = {'build':20454, 'rotation':0, 'density':3250, 'font':1000, 'rtl':0, 'bootEpoch':1000000, 'uptime':5000}
ENV = 'a' * 64
BUDGET = 'WAS1;' + ENV + ';native_slot;46;42;150;60;3.25;1;1;HSC1|1000000|4900|20454|0|0|3250|1000|0|6'
REJECT = BUDGET.replace('native_slot','capacity').replace(';150;60;',';84;125;')
DETAIL = 'WAB1;reason=bounded;vertical=83;consumed=523;limit=84;parent={class=com.zte.controlcenter.widget.CCHeaderView};branch={class=android.widget.RelativeLayout};blocker={none};widthOrigin={nativeWidth=501,available=501,consumed=417,limit=84,class=com.android.systemui.statusbar.phone.StatusIconContainer,resource=statusIcons,visibility=0,local=0,0,501,42};build=20454;uptime=4900'


def background(package='ls.augment.com'):
    return [{'type':1,'active':True,'focused':True,'root':{'package':package,'visible':True}}]


def native_focus(component='ls.augment.com/.SettingsActivity'):
    return 'mCurrentFocus=Window{123 u0 '+component+'}'


def panel():
    return [{'type':3,'active':True,'focused':True,'root':{'package':'com.android.systemui','visible':True,
        'id':'com.android.systemui:id/control_panel','bounds':'[0,0][1216,2688]'}}]


class OfflineGuard(unittest.TestCase):
    def setUp(self):
        self.shell = patch.object(m.ar, 'shell', side_effect=AssertionError('Unexpected device shell forbidden')).start()
        self.adb = patch.object(m.ar, 'adb', side_effect=AssertionError('Unexpected ADB forbidden')).start()
        self.instrument = patch.object(m.ar, 'instrument', side_effect=AssertionError('Unexpected instrumentation forbidden')).start()
        self.addCleanup(patch.stopall)


class LocalTests(OfflineGuard):
    def test_expected_runtime_schema_requires_matching_build_and_complete_keys(self):
        with tempfile.TemporaryDirectory() as temp:
            path=Path(temp)/'schema.json'
            path.write_text(json.dumps({'build':20454,'runtimeKeys':list(m.KEYS)}),encoding='utf-8')
            collector=object.__new__(m.Collector)
            collector.version=VERSION
            collector.baseline={**dict.fromkeys(m.KEYS,''),'app_only':'preserved'}
            collector.expected={m.ART:'changed'}
            with patch.object(m,'RUNTIME_SCHEMA',path):
                self.assertEqual(collector.expected_runtime_values(),{m.ART:'changed',m.spacing.SPACING:''})
                collector.version={'versionCode':20455}
                with self.assertRaises(RuntimeError):collector.expected_runtime_values()
                collector.version=VERSION;del collector.baseline[m.spacing.SPACING]
                with self.assertRaises(RuntimeError):collector.expected_runtime_values()
            self.shell.assert_not_called();self.adb.assert_not_called()

    def test_active_internal_display_rotation(self):
        line='Viewport INTERNAL: displayId=0, uniqueId=local:123, orientation=0, logicalFrame=[0, 0, 1216, 2688], isActive=[1]'
        self.assertEqual(m.native_rotation(line+'\n'+line),0)
        self.assertEqual(m.native_rotation(line+'\nViewport INTERNAL: displayId=1, orientation=3, isActive=[1]'),0)
        self.assertEqual(m.native_rotation('SurfaceOrientation: 2'),2)
        for raw in ('',line+'\n'+line.replace('orientation=0','orientation=1'),line.replace('isActive=[1]','isActive=[0]')):
            with self.assertRaises(RuntimeError):m.native_rotation(raw)

    def test_scoped_pack_bytes_and_originals_unchanged(self):
        plan = json.loads(m.DEFAULT_PLAN.read_text(encoding='utf-8'))
        before = {e['pack']:m.digest(Path(e['pack']).read_bytes()) for e in plan['packs']}
        with tempfile.TemporaryDirectory() as temp:
            result = m.prepare_inputs(m.DEFAULT_PLAN, Path(temp), ('control','notification'), '1'*32)
            for kind, pack in result['packs'].items():
                with zipfile.ZipFile(pack['path']) as z:
                    manifest=json.loads(z.read('manifest.json'))
                    self.assertEqual({row[10] for row in m.theme_rows(manifest['theme'])},{'control','notification'})
                    self.assertTrue(all(row[0] in m.IDS for row in m.theme_rows(manifest['theme'])))
                    self.assertEqual(manifest['fonts'],'')
                    for digest,path in manifest['images'].items():self.assertEqual(m.digest(z.read(path)),digest)
                    self.assertIn('Duo WiFi audit',manifest['metadata']['name'])
                    self.assertNotEqual(pack['sha256'],pack['sourceSha256'])
            self.assertEqual(before,{p:m.digest(Path(p).read_bytes()) for p in before})
        self.shell.assert_not_called();self.adb.assert_not_called()

    def test_bad_pack_identity_rejected_offline(self):
        with tempfile.TemporaryDirectory() as temp:
            p=Path(temp);plan=json.loads(m.DEFAULT_PLAN.read_text(encoding='utf-8'));plan['packs'][0]['sha256']='0'*64
            f=p/'bad.json';f.write_text(json.dumps(plan),encoding='utf-8')
            with self.assertRaises(ValueError):m.prepare_inputs(f,p/'out',('control',),'2'*32)

    def test_scoping_rejects_non_wifi_or_already_scoped_input(self):
        good='1;wifi.signal,level1,whole,'+'a'*64+',0,100,0,0,100,0'
        for raw in (good.replace('wifi.signal','mobile1.signal'), m.scoped_theme(good,('control',))):
            with self.assertRaises(ValueError):m.scoped_theme(raw,('control',))

    def test_merge_retains_other_icons_fonts_not_in_theme(self):
        a='1;volume,default,whole,'+'b'*64+',0,100,0,0,100,0'
        b='1;wifi.signal,level1,whole,'+'a'*64+',0,100,0,0,100,0'
        result=m.theme_rows(m.merge_theme(a,m.scoped_theme(b,('control',))))
        self.assertEqual(len(result),2)
        self.assertIn(['volume','default','whole','b'*64,'0','100','0','0','100','0','all'],result)
        self.assertEqual(m.serialize_theme(m.theme_rows(a)),a)

    def test_runtime_checksum_and_duplicate_rejected(self):
        def raw(body):return 'LSA1.'+m.digest(body)+'.'+base64.urlsafe_b64encode(body).decode().rstrip('=')
        b=b'v=1\nr=3\nt=123\ns=device\nkey=YWJj\n'
        self.assertEqual(m.decode_runtime(raw(b)),{'key':'abc'})
        with self.assertRaises(ValueError):m.decode_runtime(raw(b).replace('LSA1.','LSA1.'+'0'*64,1))
        with self.assertRaises(ValueError):m.decode_runtime(raw(b+b'key=YWJj\n'))

    def test_environment_ignores_only_two_wifi_children(self):
        values={m.ART:'',m.spacing.SPACING:'IS1;all,wifi.signal,1,2,3,4;control,mobile1.signal,1,0,0,0;notification,wifi.activity_inout,1,1,2,1','other':'a,b=c'}
        copy=dict(values);copy[m.spacing.SPACING]='IS1;control,mobile1.signal,1,0,0,0'
        self.assertEqual(m.environment(values),m.environment(copy))
        copy['other']='changed';self.assertNotEqual(m.environment(values),m.environment(copy))

    def test_capacity_whole_pair_rounding_boundary(self):
        budget=m.parse_budget(BUDGET,PROFILE,ENV,1004000)
        self.assertTrue(m.accepts(budget,m.SMALL))
        # 2*46 + (7+3)+(3+7) = 112; height 42 + (3+3) = 48.
        self.assertTrue(m.accepts(dict(budget,maxWidth=112,maxHeight=48),m.SMALL))
        self.assertFalse(m.accepts(dict(budget,maxWidth=111,maxHeight=48),m.SMALL))
        self.assertFalse(m.accepts(dict(budget,maxWidth=112,maxHeight=47),m.SMALL))

    def test_unknown_rejected_capacity_never_accepted(self):
        for raw in ('',BUDGET.replace('native_slot','capacity'),BUDGET.replace('native_slot','layout'),
                    BUDGET.replace(ENV,'b'*64),BUDGET.replace(';1;1;HSC1',';1;0;HSC1'),BUDGET.replace(';3.25;',';NaN;'),
                    BUDGET.replace(';150;',';0;'),BUDGET.replace('|20454|','|20453|')):
            with self.subTest(raw=raw),self.assertRaises(ValueError):m.parse_budget(raw,PROFILE,ENV,1004000)

    def test_profile_generation_age_direction_and_clock_rejected(self):
        for field,value in [('rotation',1),('density',3200),('font',1300),('rtl',1),('build',20455),('bootEpoch',1006000),('uptime',51000),('uptime',2000)]:
            with self.subTest(field=field),self.assertRaises(ValueError):m.parse_budget(BUDGET,dict(PROFILE,**{field:value}),ENV,1004000)
        with self.assertRaises(ValueError):m.parse_budget(BUDGET,PROFILE,ENV,1006001)

    def test_ui_ambiguity_disabled_and_outside_rect(self):
        def window(nodes):return [{'root':{'children':nodes}}]
        a={'visible':True,'enabled':True,'text':'one','bounds':'[1,2][10,20]'}
        self.assertEqual(m.choose_node(window([a]),lambda n:n.get('text')=='one'),a)
        with self.assertRaises(ValueError):m.choose_node(window([a,a]),lambda n:n.get('text')=='one')
        with self.assertRaises(ValueError):m.choose_node(window([dict(a,enabled=False)]),lambda n:n.get('text')=='one')
        for b in ('','[0,0][0,3]','[4,2][2,6]'):
            with self.assertRaises(ValueError):m.bounds({'bounds':b})

    def test_red_green_pixels_not_global_or_counter_inference(self):
        from PIL import Image
        with tempfile.TemporaryDirectory() as temp:
            p=Path(temp);geometry=[{'id':'com.android.systemui:id/wifi_inout','visible':True,'bounds':'[4,4][12,12]'}]
            for frame,color in enumerate(((255,160,160),(160,255,160))):
                im=Image.new('RGB',(20,20),'white');im.paste(color,(4,4,12,12));im.save(p/f'frame-{frame:02d}.png')
            self.assertTrue(m.gif_color_observation(p,geometry)['established'])
            self.assertEqual(m.gif_color_observation(p,geometry)['strongestPair']['samePixelsChangedRedGreen'],64)
            self.assertFalse(m.gif_color_observation(p,[dict(geometry[0],bounds='[12,12][20,20]')])['established'])
            self.assertFalse(m.gif_color_observation(p,[])['established'])


class RecoveryTests(OfflineGuard):
    def fake(self, folder):
        c=m.Collector(Path(folder),VERSION)
        c.baseline={m.ART:'',m.spacing.SPACING:'',m.FONT:'keep-user-font','rows':'two'}
        current=dict(c.baseline);events=[]
        c.expected={k:c.baseline[k] for k in m.KEYS}
        c.journal={'pending':True,'runId':'owned-run','version':VERSION,'deviceSerial':m.ar.SERIAL,
                   'values':dict(c.expected),'allowedValues':{k:[v] for k,v in c.expected.items()},'resourcesBefore':{}}
        m.spacing.atomic_json(c.journal_path,c.journal)
        c.read_settings=lambda label: dict(current)
        c.check_process=lambda:None
        def instrument(op,label,values=None):
            events.append(('instrument',op,label,dict(values) if values else None))
            if op=='set':current.update(values)
            return {'status':'pass','moduleVersion':20454}
        c.instrument=instrument
        remote={}
        def adb(*args,**kw):
            events.append(('adb',*args))
            if args[0]=='push':remote['data']=Path(args[1]).read_bytes();return b'ok'
            if args[0]=='exec-out':return remote['data']
            raise AssertionError(args)
        def shell(command,**kw):
            events.append(('shell',command))
            if command=='date +%s%3N':return '1005000'
            if command=='if test -f '+m.LEASE+'/restore.json; then cat '+m.LEASE+'/restore.json; else echo ABSENT; fi':return remote.get('data',c.journal_path.read_bytes()).decode()
            if command in ('am force-stop ls.augment.com','rm '+m.LEASE+'/restore.json && rmdir '+m.LEASE):return ''
            if command=='if test -d '+m.LEASE+'; then rmdir '+m.LEASE+'; fi':return ''
            raise AssertionError(command)
        self.adb.side_effect=adb;self.shell.side_effect=shell
        return c,current,events,remote

    def test_write_ahead_precedes_mutation_and_exact_restore(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp)
            c.set_values('fixture',{m.ART:'fixture'})
            self.assertEqual(current[m.ART],'fixture')
            self.assertLess(next(i for i,e in enumerate(events) if e[:2]==('adb','push')),next(i for i,e in enumerate(events) if e[:2]==('instrument','set')))
            c.restore();self.assertEqual(current,c.baseline)
            self.assertFalse(json.loads(c.journal_path.read_text())['pending'])
            self.assertTrue(c.report['configurationRestored'])

    def test_transport_loss_after_save_still_recovers(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp)
            real=c.instrument
            def lost(op,label,values=None):
                real(op,label,values)
                raise RuntimeError('lost reply after actual save')
            c.instrument=lost
            with self.assertRaises(RuntimeError):c.set_values('fixture',{m.ART:'fixture'})
            self.assertTrue(json.loads(c.journal_path.read_text())['pending'])
            c.instrument=real;c.restore();self.assertEqual(current,c.baseline)

    def test_local_and_remote_journal_failure_prevents_save(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp)
            self.adb.side_effect=RuntimeError('push fails')
            with self.assertRaises(RuntimeError):c.set_values('fixture',{m.ART:'fixture'})
            self.assertEqual(current,c.baseline)
            self.assertFalse(any(e[:2]==('instrument','set') for e in events))

    def test_foreign_lease_does_not_stop_app_or_change_config(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);remote['data']=b'{"runId":"foreign"}'
            with self.assertRaises(RuntimeError):c.restore()
            self.assertEqual(current,c.baseline)
            self.assertFalse(any('force-stop' in str(e) or e[:2]==('instrument','set') for e in events))

    def test_other_device_or_extra_restore_key_has_zero_device_actions(self):
        for change in ('device','key'):
            with tempfile.TemporaryDirectory() as temp:
                c,current,events,remote=self.fake(temp)
                if change=='device':c.journal['deviceSerial']='foreign-device'
                else:c.journal['values']['unowned']='0'
                with self.assertRaises(RuntimeError):c.restore()
                self.assertEqual(events,[])

    def test_later_user_setting_is_not_overwritten(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);current[m.ART]='later-user-change'
            with self.assertRaises(RuntimeError):c.restore()
            self.assertEqual(current[m.ART],'later-user-change')
            self.assertFalse(any(e[:2]==('instrument','set') for e in events))
            self.assertTrue(c.journal['pending'])

    def test_restoration_mismatch_keeps_pending(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);c.set_values('fixture',{m.ART:'fixture'})
            c.instrument=lambda *a,**k:None
            with self.assertRaises(RuntimeError):c.restore()
            self.assertTrue(json.loads(c.journal_path.read_text())['pending'])

    def test_foreign_resource_preserved_and_reported(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp)
            path=m.ASSETS+'a'*64+'.asset';c.journal['resourcesBefore']={path:'a'*64}
            c.file_hash=lambda path:'b'*64
            with self.assertRaises(RuntimeError):c.restore()
            self.assertTrue(c.journal['pending'])
            self.assertFalse(any('rm ' in str(e) for e in events))

    def test_cleanup_error_does_not_clear_pending(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);original=self.shell.side_effect
            def failed(command,**kw):
                if command.startswith('rm '):raise RuntimeError('lease removal failure')
                return original(command,**kw)
            self.shell.side_effect=failed
            with self.assertRaises(RuntimeError):c.restore()
            self.assertTrue(json.loads(c.journal_path.read_text())['pending'])

    def test_crash_after_lease_file_removed_can_finish_restore(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);c.journal['valuesRestored']=True
            remote['data']=b'ABSENT'
            c.restore()
            self.assertFalse(c.journal['pending'])
            self.assertFalse(any('rm '+m.LEASE in str(e) for e in events))

    def test_missing_lease_without_verified_restore_is_not_owned(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);remote['data']=b'ABSENT'
            with self.assertRaises(RuntimeError):c.restore()
            self.assertTrue(c.journal['pending'])
            self.assertFalse(any(e[:2]==('instrument','set') for e in events))

    def test_fresh_object_restore_only_uses_old_journal_and_never_ping(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);c.set_values('fixture',{m.ART:'fixture'})
            m.spacing.atomic_json(c.output/'baseline-settings-private.json',c.baseline)
            old=c.report
            with patch.object(m.summary,'no_active_instrumentation',return_value={'state':'idle'}),patch.object(m.traffic,'OwnedPing',side_effect=AssertionError('Recovery cannot ping')):
                c.run(restore_only=True)
            self.assertEqual(current,c.baseline)
            self.assertEqual(c.report['startedAt'],old['startedAt'])


class RejectionAndEntranceTests(OfflineGuard):
    def budget(self):return m.parse_budget(REJECT,PROFILE,ENV,1004000,'capacity')

    def test_rejection_requires_exact_current_was_and_real_horizontal_shortfall(self):
        b=self.budget();self.assertFalse(m.accepts(b,{k:(0,0,0,0) for k in m.IDS}))
        detail=m.parse_rejection_detail(DETAIL,b,PROFILE,1004000)
        self.assertEqual((detail['limit'],detail['requiredZeroEdgeWidth']),(84,92))
        for changed in (REJECT.replace('capacity','native_slot'),REJECT.replace('capacity','layout'),REJECT.replace(ENV,'b'*64),REJECT.replace('|20454|','|20453|'),REJECT.replace(';1;1;HSC1',';1;0;HSC1')):
            with self.assertRaises(ValueError):m.parse_budget(changed,PROFILE,ENV,1004000,'capacity')
        for raw,budget in ((DETAIL.replace('reason=bounded','reason=overlap'),b),
                          (DETAIL.replace('build=20454','build=20453'),b),(DETAIL.replace('blocker={none}','blocker={unknown}'),b),
                          (DETAIL.replace('consumed=417','consumed=416'),b),(DETAIL,dict(b,maxHeight=124)),
                          (DETAIL.replace('nativeWidth=501,available=501,consumed=417,limit=84','nativeWidth=509,available=509,consumed=417,limit=92').replace(';limit=84;',';limit=92;'),dict(b,maxWidth=92))):
            with self.subTest(raw=raw),self.assertRaises(ValueError):m.parse_rejection_detail(raw,budget,PROFILE,1004000)

    def test_unchanged_wab_may_only_reuse_previously_validated_current_run_geometry(self):
        b=self.budget();old=m.parse_rejection_detail(DETAIL,b,PROFILE,1004000)
        later=dict(PROFILE,uptime=120000,bootEpoch=1000001)
        with self.assertRaises(ValueError):m.parse_rejection_detail(DETAIL,b,later,1119000)
        self.assertTrue(m.parse_rejection_detail(DETAIL,b,later,1119000,old)['geometryReusedFromEarlierValidatedPhase'])
        for raw,profile in ((DETAIL.replace('local=0,0,501,42','local=1,0,502,42'),later),(DETAIL,dict(later,bootEpoch=1010000))):
            with self.assertRaises(ValueError):m.parse_rejection_detail(raw,b,profile,1119000,old)

    def test_ready_hash_matched_is_not_drawn_and_wrong_scope_or_native_state_rejected(self):
        theme='2;wifi.signal,level4,whole,'+'a'*64+',0,100,0,0,100,0,control'
        row={'id':'wifi.signal','state':'visible','application':'ready','matchedState':'level4','matchedAsset':'a'*64,'states':['level4']}
        self.assertEqual(m.require_resource_rows([row],('wifi.signal',),theme,'control','ready')['wifi.signal'],[row])
        for changed in (dict(row,application='applied'),dict(row,application='load_failed'),dict(row,matchedAsset='b'*64),dict(row,state='native_hidden'),dict(row,coveredBy='wifi'),dict(row,states=['level3'])):
            with self.assertRaises(RuntimeError):m.require_resource_rows([changed],('wifi.signal',),theme,'control','ready')
        with self.assertRaises(RuntimeError):m.require_resource_rows([row],('wifi.signal',),theme,'notification','ready')
        with self.assertRaises(RuntimeError):m.require_resource_rows([row],('wifi.signal',),theme,'control','applied')

    def test_background_requires_agreeing_unique_native_and_accessibility_focus(self):
        home='com.example.home/.Launcher'
        self.assertTrue(m.known_background(background(),native_focus(),home))
        self.assertTrue(m.known_background(background('com.example.home'),native_focus('com.example.home/com.example.home.Launcher'),home))
        for windows,native in ((background('other.app'),native_focus('other.app/.Activity')),(background(),native_focus('other.app/.Activity')),(background()+background(),native_focus()),(background(),''),(panel(),native_focus())):
            self.assertFalse(m.known_background(windows,native,home))
        self.assertEqual(m.resolve_home('com.example.home/.Launcher'),home)
        for raw in ('','android/.ResolverActivity','com.a/.A\ncom.b/.B'):
            with self.assertRaises(ValueError):m.resolve_home(raw)

    def collector(self,temp,observations):
        c=m.Collector(Path(temp),VERSION,settle=0,expect_capacity_rejection=True);c.home_component='com.example.home/.Launcher'
        c.entrance_observation=lambda label: next(observations)
        commands=[]
        def shell(command,**kw):
            if command in ('input keyevent 224','wm dismiss-keyguard','cmd statusbar collapse','cmd statusbar expand-settings'):
                commands.append(command);return ''
            if command=='date +%s%3N':return '1005000'
            raise AssertionError(command)
        self.shell.side_effect=shell
        return c,commands

    def test_control_entry_two_stable_samples_and_only_one_known_background_retry(self):
        bg=(background(),native_focus());p=(panel(),native_focus('com.android.systemui/.Panel'))
        with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
            c,commands=self.collector(temp,iter([bg]+[bg]*4+[p,p]))
            self.assertEqual(c.open_control('sample'),1005000)
            self.assertEqual(commands.count('cmd statusbar expand-settings'),2)
            self.assertFalse(any('am start' in x or 'input swipe' in x for x in commands))

    def test_control_unknown_foreground_has_no_open_or_retry(self):
        bg=(background(),native_focus());unknown=(background('other.app'),native_focus('other.app/.Activity'))
        for sequence,opens in (([unknown],0),([bg]+[unknown]*4,1),([bg]*9,2)):
            with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
                c,commands=self.collector(temp,iter(sequence))
                with self.assertRaises(RuntimeError):c.open_control('sample')
                self.assertEqual(commands.count('cmd statusbar expand-settings'),opens)

    def test_existing_control_collapses_only_then_verifies_known_background(self):
        bg=(background(),native_focus());p=(panel(),native_focus('com.android.systemui/.Panel'))
        with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
            c,commands=self.collector(temp,iter([p,bg,p,p]));c.open_control('sample')
            self.assertEqual(commands.count('cmd statusbar collapse'),1)

    def test_rejection_mode_actual_capture_retains_eight_frames_without_claiming_pixels(self):
        from PIL import Image
        import io
        with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
            c=m.Collector(Path(temp),VERSION,expect_capacity_rejection=True);c.not_before=1004000
            theme='2;wifi.signal,default,whole,'+'a'*64+',0,100,0,0,100,0,control;wifi.activity_inout,default,background,'+'b'*64+',0,100,0,0,100,0,control'
            c.baseline={m.ART:'',m.spacing.SPACING:''};c.expected={m.ART:theme,m.spacing.SPACING:''}
            c.expected_runtime_values=lambda:dict(c.expected);env=m.environment(c.expected)
            diag={ 'ls_augment_statusbar_wifi_spacing_contract_control_0_wifi':'asset_cells;'+BUDGET.split(';')[-1],
                   'ls_augment_statusbar_wifi_asset_space_control_0_wifi':REJECT.replace(ENV,env),
                   'ls_augment_statusbar_wifi_asset_budget_control_0_wifi':DETAIL}
            xml='<map>'+''.join('<string name="'+k+'">'+v+'</string>' for k,v in diag.items())+'</map>'
            rows=[{'id':identity,'state':'visible','application':'ready','matchedState':'default','matchedAsset':asset*64,'states':['default'],'capability':'whole_layers'} for identity,asset in zip(m.IDS,('a','b'))]
            inventory={'surfaces':{'control':rows},'surfaceObservedAt':{'control':1004500},'runtime':{'activeSurface':'control','enabled':True,'interactive':True}}
            windows=panel();windows[0]['root']['children']=[{'id':'com.android.systemui:id/statusIcons','visible':True,'bounds':'[495,150][996,192]'},
                {'id':'com.android.systemui:id/wifi_inout','visible':True,'bounds':'[745,150][791,192]'}]
            c.observe=lambda label:windows;c.open_control=lambda label:1004000;c.check_process=lambda:None;c.current_profile=lambda:PROFILE
            c.instrument=lambda *a,**k:{'statusbarRuntime':{'inventory':inventory}};c.read_settings=lambda label:dict(c.expected)
            c.identity={'gateway':'192.168.1.1'};c.ping_binary='mock';c.ping_help='mock'
            png=io.BytesIO();Image.new('RGB',(1216,2688),'white').save(png,format='PNG');self.adb.side_effect=lambda *a,**k:png.getvalue()
            self.shell.side_effect=lambda command,**k:xml if command.startswith('cat /data/user/0/ls.augment.com/shared_prefs/') else (_ for _ in ()).throw(AssertionError(command))
            wait=[];ping=SimpleNamespace(process=SimpleNamespace(poll=lambda:None),wait=lambda:wait.append(True) or {'bothDirectionsObserved':True})
            with patch.object(m.traffic,'network_identity',return_value=(c.identity,{})),patch.object(m.traffic,'ping_command',return_value='bounded mock'),patch.object(m.traffic,'OwnedPing',return_value=ping):
                result=c.capture('signal-and-activity','control',m.IDS)
            self.assertEqual(len(list((Path(temp)/'signal-and-activity-control').glob('frame-*.png'))),8)
            self.assertTrue(result['expectedCapacityRejectionObserved']);self.assertTrue(result['visualReviewPending']);self.assertEqual(wait,[True])
            self.assertFalse(result['gifPixels']['established']);self.assertIn('pending independent PNG review',result['neighborPixelPreservation'])


class CompleteFlowTests(OfflineGuard):
    def flow(self, temp, rejection, fail_phase=None, header_seconds=False, observe_settled_fallback=False):
        c,current,events,remote=RecoveryTests.fake(self,temp)
        c.journal_path.unlink();c.journal=None;c.version={'versionCode':20458,'versionName':'2.0.0-alpha1-test20458'}
        c.expect_capacity_rejection=rejection
        c.observe_settled_fallback=observe_settled_fallback
        c.baseline.update({m.spacing.MASTER:'1','ls_augment_statusbar_position_size_only':'0',**{'untouched_'+str(i):str(i) for i in range(491)}})
        c.baseline.pop('untouched_0');c.baseline[m.HEADER_SECONDS]='0'
        c.baseline['untouched_1']='HH:MMIIE'
        c.header_seconds=header_seconds
        c.mutation_keys=m.KEYS+(m.HEADER_SECONDS,) if header_seconds else m.KEYS
        if header_seconds:
            c.version={'versionCode':20459,'versionName':'2.0.0-alpha1-test20459'}
            c.native_settings=lambda:{'profile':dict(PROFILE), 'settings':{'font_scale':'1.0'}}
            c.expected_runtime_values=lambda:dict(c.baseline,**c.expected)
        if observe_settled_fallback:
            c.version={'versionCode':20460,'versionName':'2.0.0-alpha1-test20460'}
            c.native_settings=lambda:{'profile':dict(PROFILE), 'settings':{'font_scale':'1.0'}}
        current.update(c.baseline)
        original_shell=self.shell.side_effect;original_adb=self.adb.side_effect
        def shell(command,**kw):
            if command.startswith('find /data/user/0/ls.augment.com/files '):return ''
            if command=='if test -e '+m.LEASE+'; then echo PRESENT; else echo ABSENT; fi':return 'ABSENT'
            if command.startswith('cmd package resolve-activity '):return 'com.example.home/.Launcher'
            if command=='command -v ping':return '/system/bin/ping'
            if command in ('mkdir '+m.LEASE,'cmd statusbar collapse'):return ''
            return original_shell(command,**kw)
        def adb(*args,**kw):
            if args[:1]==('shell',):return b'-c count -i interval -s packetsize -w deadline -I interface'
            return original_adb(*args,**kw)
        self.shell.side_effect=shell;self.adb.side_effect=adb
        c.assets_state=lambda:{m.ASSETS+asset+'.asset':None for asset in c.inputs['packs']['signal-and-activity']['hashes']+[c.inputs['missingHash']]}
        c.file_hash=lambda path:None
        c.import_pack=lambda variant:c.set_values('import-'+variant,{m.ART:m.merge_theme(c.baseline[m.ART],c.inputs['packs'][variant]['theme'])})
        phases=[]
        def phase(name,*args,**kwargs):
            phases.append(name)
            if name==fail_phase:raise RuntimeError('injected phase capture failure')
            return [{'budget':m.parse_budget(BUDGET,PROFILE,ENV,1004000)}]
        c.phase=phase
        contexts=(patch.object(m.summary,'no_active_instrumentation',return_value={'state':'idle'}),
                  patch.object(m.traffic,'loaded_systemui',return_value={'pid':123}),
                  patch.object(m.traffic,'network_identity',return_value=({'interface':'wlan0','gateway':'192.168.1.1'},{})),
                  patch.object(m.traffic,'ping_command',return_value='mock'))
        import contextlib
        with contextlib.ExitStack() as stack:
            for ctx in contexts:stack.enter_context(ctx)
            if fail_phase:
                with self.assertRaises(RuntimeError):c.run()
            else:c.run()
        self.assertEqual(len(c.baseline),497);self.assertEqual(current,c.baseline)
        self.assertTrue(c.report['configurationRestored']);self.assertFalse(json.loads(c.journal_path.read_text())['pending'])
        self.assertEqual(c.report['status'],'incomplete' if fail_phase else 'collection_complete_visual_review_pending')
        return phases,events

    def test_rejection_sequence_reaches_both_removal_and_exact_baseline_pixels(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=self.flow(temp,True)
            self.assertEqual(phases,['user-baseline','signal-only','activity-only','signal-and-activity','bindings-removed','restored'])
            self.assertFalse(any('small-edges' in str(event) or 'absent-hash' in str(event) for event in events))

    def test_failed_phase_still_restores_all497_and_stops_later_imports(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=self.flow(temp,True,'activity-only')
            self.assertEqual(phases,['user-baseline','signal-only','activity-only'])

    def test_default_success_mode_keeps_original_eight_phase_scope(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=self.flow(temp,False)
            self.assertEqual(phases,['user-baseline','signal-only','activity-only','signal-and-activity','small-edges','bindings-removed','missing-hash-fallback','restored'])
            self.assertFalse(any(m.HEADER_SECONDS in (e[3] or {}) for e in events if e[:2]==('instrument','set')))

    def test_seconds_mode_has_nine_phases_and_exact_three_key_mutations(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=self.flow(temp,False,header_seconds=True)
            self.assertEqual(phases,['user-baseline','header-seconds-native','signal-only','activity-only','signal-and-activity','small-edges','bindings-removed','missing-hash-fallback','restored'])
            changes=[e[3] for e in events if e[:2]==('instrument','set')]
            self.assertEqual(set().union(*(set(v) for v in changes)),set(m.KEYS+(m.HEADER_SECONDS,)))
            self.assertEqual(next(v[m.HEADER_SECONDS] for v in changes if m.HEADER_SECONDS in v),'1')
            self.assertEqual(changes[-1][m.HEADER_SECONDS],'0')
            journal=json.loads((Path(temp)/'restore.json').read_text())
            self.assertTrue(journal['headerSeconds']);self.assertEqual(set(journal['values']),set(m.KEYS+(m.HEADER_SECONDS,)))

    def test_seconds_prerequisite_failure_restores_before_any_import(self):
        with tempfile.TemporaryDirectory() as temp:
            phases,events=self.flow(temp,False,'header-seconds-native',header_seconds=True)
            self.assertEqual(phases,['user-baseline','header-seconds-native'])
            self.assertFalse(any(e[:2]==('instrument','set') and str(e[2]).startswith('import-') for e in events))


class SecondsAndTargetTests(OfflineGuard):
    def clock_panel(self,text='10:20:30',description=None):
        windows=panel()
        clock={'id':'com.android.systemui:id/clock','visible':True,'text':text,
               'description':text if description is None else description,'bounds':'[10,90][600,210]','renderingInfo':None}
        windows[0]['root']['children']=[{'id':'com.android.systemui:id/cc_header','visible':True,'children':[clock]}]
        return windows,clock

    def target(self,package='ls.augment.com'):
        node={'package':package,'visible':True,'enabled':True,'clickable':True,'text':'导入','bounds':'[20,30][60,80]'}
        windows=background(package);windows[0]['root']['children']=[node]
        return windows,node,native_focus(package+'/.Activity')

    def test_exact_focused_picker_and_editor_target(self):
        for package in ('ls.augment.com','com.android.documentsui','com.google.android.documentsui'):
            windows,node,native=self.target(package)
            m.interactive_target(windows,native,node)

    def test_underlying_same_package_copy_and_foreign_native_focus_blocked(self):
        windows,node,native=self.target()
        covered=dict(windows[0],active=False,focused=False)
        overlay,_copy,_native=self.target()
        for ws,observed,nat in (([covered]+overlay,node,native),(windows,dict(node),native),
                               (windows,node,native_focus('other.app/.A')),(windows,node,''),
                               (windows+overlay,node,native)):
            with self.subTest(case=(ws,observed,nat)),self.assertRaises(RuntimeError):m.interactive_target(ws,nat,observed)

    def test_permission_and_default_dialogs_fail_closed(self):
        for text in ('需要相机权限','用户协议','选择默认应用','仅此一次','欢迎开始使用'):
            windows,node,native=self.target();windows[0]['root']['children'].append({'visible':True,'text':text})
            with self.assertRaises(RuntimeError):m.interactive_target(windows,native,node)

    def test_tap_checks_actual_ownership_and_full_target_bounds(self):
        import io
        from PIL import Image
        png=io.BytesIO();Image.new('RGB',(100,100)).save(png,format='PNG')
        for scenario in ('ok','cover','clipped'):
            with tempfile.TemporaryDirectory() as temp:
                c=m.Collector(Path(temp),VERSION);windows,node,native=self.target()
                if scenario=='cover':windows[0].update(active=False,focused=False)
                if scenario=='clipped':node['bounds']='[20,30][160,80]'
                c.entrance_observation=lambda label:(windows,native)
                self.adb.side_effect=lambda *a,**k:png.getvalue()
                self.shell.side_effect=None;self.shell.return_value='';self.shell.reset_mock()
                if scenario=='ok':
                    c.tap('target',lambda n:n.get('text')=='导入',attempts=1)
                    self.shell.assert_called_once_with('input tap 40 55')
                else:
                    with self.assertRaises(RuntimeError):c.tap('target',lambda n:n.get('text')=='导入',attempts=1)
                    self.shell.assert_not_called()

    def test_header_requires_visible_clock_inside_the_focused_panel(self):
        windows,clock=self.clock_panel();self.assertEqual(m.header_clock(windows)['text'],'10:20:30')
        clock['visible']=False
        with self.assertRaises(RuntimeError):m.header_clock(windows)
        windows,clock=self.clock_panel();windows[0].update(active=False,focused=False)
        overlay=[{'active':True,'focused':True,'root':{'package':'com.android.systemui','visible':True}}]
        self.assertIsNone(m.control_signature(windows+overlay))
        with self.assertRaises(RuntimeError):m.header_clock(windows+overlay)

    def test_advancing_real_seconds_and_owned_layout_not_config_are_required(self):
        first={'text':'上午 10:20\n:30','description':'上午 10:20:30'}
        last={'text':'上午\n10:20:32','description':'上午 10:20:32'}
        observed=m.verify_seconds(first,last,'adapter=CCHeaderView;clock;mode=native_clock;size=208')
        self.assertEqual(observed['observedSeconds'],['10:20:30','10:20:32']);self.assertFalse(observed['pixelPass'])
        for a,b,diag in ((first,first,';clock;mode=x'),(first,dict(last,description='10:20:32'),';clock;mode=x'),
                         ({'text':'10:20','description':'10:20'},last,';clock;mode=x'),(first,last,'adapter=CCHeaderView;native'),
                         (first,last,'adapter=CCHeaderView;native_fallback;reason=space')):
            with self.assertRaises(RuntimeError):m.verify_seconds(a,b,diag)

    def test_seconds_changes_runtime_fingerprint_and_rejects_old_was(self):
        off={m.ART:'',m.spacing.SPACING:'',m.HEADER_SECONDS:'0'};on=dict(off,**{m.HEADER_SECONDS:'1'})
        self.assertNotEqual(m.environment(off),m.environment(on))
        old=BUDGET.replace(ENV,m.environment(off))
        with self.assertRaises(ValueError):m.parse_budget(old,PROFILE,m.environment(on),1004000)

    def test_seconds_must_be_in_exact_build_runtime_schema(self):
        with tempfile.TemporaryDirectory() as temp:
            path=Path(temp)/'schema.json';c=m.Collector(Path(temp),{'versionCode':20459},header_seconds=True)
            c.baseline={**dict.fromkeys(m.KEYS,''),m.HEADER_SECONDS:'0'};c.expected={m.HEADER_SECONDS:'1'}
            with patch.object(m,'RUNTIME_SCHEMA',path):
                path.write_text(json.dumps({'build':20459,'runtimeKeys':list(m.KEYS)}))
                with self.assertRaises(RuntimeError):c.expected_runtime_values()
                path.write_text(json.dumps({'build':20459,'runtimeKeys':list(m.KEYS+(m.HEADER_SECONDS,))}))
                self.assertEqual(c.expected_runtime_values()[m.HEADER_SECONDS],'1')
                path.write_text(json.dumps({'build':20458,'runtimeKeys':list(m.KEYS+(m.HEADER_SECONDS,))}))
                with self.assertRaises(RuntimeError):c.expected_runtime_values()

    def test_actual_capture_records_header_pair_and_rejects_unowned_or_stale_clock(self):
        import io
        from PIL import Image
        png=io.BytesIO();Image.new('RGB',(1216,2688),'white').save(png,format='PNG')
        for scenario in ('advancing','native-layout','stale-seconds'):
            with tempfile.TemporaryDirectory() as temp,patch.object(m.time,'sleep'):
                c=m.Collector(Path(temp),{'versionCode':20459},header_seconds=True)
                c.baseline={**dict.fromkeys(m.KEYS,''),m.HEADER_SECONDS:'0'}
                c.expected={**dict.fromkeys(m.KEYS,''),m.HEADER_SECONDS:'1'}
                c.check_process=lambda:None;c.open_control=lambda label:1004000
                c.current_profile=lambda:dict(PROFILE,build=20459)
                c.read_settings=lambda label:dict(c.expected);c.expected_runtime_values=lambda:dict(c.expected)
                def observe(label):
                    text='10:20:32' if label.endswith('-clock-after') and scenario!='stale-seconds' else '10:20:30'
                    return self.clock_panel(text)[0]
                c.observe=observe
                inventory={'surfaces':{'control':[]},'surfaceObservedAt':{'control':1004500},
                           'runtime':{'activeSurface':'control','enabled':True,'interactive':True}}
                c.instrument=lambda *a,**k:{'statusbarRuntime':{'inventory':inventory}}
                diag='adapter=CCHeaderView;native' if scenario=='native-layout' else 'adapter=CCHeaderView;clock;mode=native_clock;size=208'
                xml='<map><string name="ls_augment_header_clock_runtime_1_portrait">'+diag+'</string></map>'
                self.shell.side_effect=lambda cmd,**kw:xml if cmd.startswith('cat /data/user/0/ls.augment.com/shared_prefs/') else (_ for _ in ()).throw(AssertionError(cmd))
                self.adb.side_effect=lambda *a,**kw:png.getvalue()
                c.identity={'gateway':'192.168.1.1'};c.ping_binary=c.ping_help='mock'
                ping=SimpleNamespace(process=SimpleNamespace(poll=lambda:None),wait=lambda:{'bothDirectionsObserved':True})
                with patch.object(m.traffic,'network_identity',return_value=(c.identity,{})),patch.object(m.traffic,'ping_command',return_value='bounded mock'),patch.object(m.traffic,'OwnedPing',return_value=ping):
                    if scenario=='advancing':
                        result=c.capture('header-seconds-native','control')
                        self.assertEqual(result['headerSecondsObservation']['observedSeconds'],['10:20:30','10:20:32'])
                        self.assertFalse(result['headerSecondsObservation']['pixelPass'])
                    else:
                        with self.assertRaises(RuntimeError):c.capture('header-seconds-native','control')
                evidence=json.loads((Path(temp)/'header-seconds-native-control/geometry-and-runtime.json').read_text())
                self.assertEqual(evidence['status'],'evidence_collected_visual_review_pending' if scenario=='advancing' else 'incomplete')
                self.assertEqual(len(list((Path(temp)/'header-seconds-native-control').glob('frame-*.png'))),8)
                self.assertIn('headerClockBefore',evidence);self.assertIn('headerClockAfter',evidence)

    def test_mode_limits_traffic_bound_and_cli_conflicts_are_offline(self):
        import sys
        with tempfile.TemporaryDirectory() as temp:
            c=m.Collector(Path(temp),VERSION,header_seconds=True)
            self.assertEqual(c.report['trafficBudget']['maximumSamples'],9)
            self.assertEqual(c.mutation_keys,m.KEYS+(m.HEADER_SECONDS,));self.assertEqual(len(m.KEYS),2)
            for kwargs in ({'surfaces':('control','notification')},{'expect_capacity_rejection':True}):
                with self.assertRaises(ValueError):m.Collector(Path(temp),VERSION,header_seconds=True,**kwargs)
            for args in (['--run','--surfaces','control,notification'],['--run','--expect-capacity-rejection'],['--restore-only','--output',temp]):
                with patch.object(sys,'argv',['collector','--header-seconds',*args]),patch('sys.stderr'),self.assertRaises(SystemExit) as result:m.main()
                self.assertEqual(result.exception.code,2)
        self.shell.assert_not_called();self.adb.assert_not_called();self.instrument.assert_not_called()


class SecondsRecoveryTests(OfflineGuard):
    def fake(self,temp):
        c,current,events,remote=RecoveryTests.fake(self,temp)
        c.baseline.update({m.HEADER_SECONDS:'0','clock_pattern':'HH:MMIIE',**{'keep_'+str(i):str(i) for i in range(491)}})
        current.update(c.baseline)
        c.header_seconds=True;c.mutation_keys=m.KEYS+(m.HEADER_SECONDS,)
        c.expected={key:c.baseline[key] for key in c.mutation_keys}
        c.journal.update(headerSeconds=True,values=dict(c.expected),allowedValues={k:[v] for k,v in c.expected.items()},
                         nativeSettingsBefore={'profile':{'density':3250,'font':1000},'settings':{'font_scale':'1.0'}})
        c.native_settings=lambda:c.journal['nativeSettingsBefore']
        m.spacing.atomic_json(c.journal_path,c.journal)
        return c,current,events,remote

    def test_seconds_durable_write_and_exact497_recovery_after_lost_reply(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);original=c.instrument
            def lost(op,label,values=None):
                original(op,label,values)
                raise RuntimeError('saved but reply lost')
            c.instrument=lost
            with self.assertRaises(RuntimeError):c.set_values('seconds',{m.HEADER_SECONDS:'1'})
            self.assertEqual(current[m.HEADER_SECONDS],'1')
            self.assertEqual(json.loads(remote['data'])['allowedValues'][m.HEADER_SECONDS],['0','1'])
            self.assertLess(next(i for i,e in enumerate(events) if e[:2]==('adb','push')),next(i for i,e in enumerate(events) if e[:2]==('instrument','set')))
            c.instrument=original;c.header_seconds=False;c.mutation_keys=m.KEYS;c.restore()
            self.assertEqual(len(current),497);self.assertEqual(current,c.baseline);self.assertEqual(current['clock_pattern'],'HH:MMIIE')
            self.assertFalse(c.journal['pending']);self.assertTrue(c.report['nativeSettingsUnchanged'])

    def test_seconds_push_failure_never_saves_and_unknown_value_not_overwritten(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);self.adb.side_effect=RuntimeError('push failed')
            with self.assertRaises(RuntimeError):c.set_values('seconds',{m.HEADER_SECONDS:'1'})
            self.assertEqual(current,c.baseline);self.assertFalse(any(e[:2]==('instrument','set') for e in events))
            current[m.HEADER_SECONDS]='foreign-invalid'
            with self.assertRaises(RuntimeError):c.restore()
            self.assertEqual(current[m.HEADER_SECONDS],'foreign-invalid');self.assertTrue(c.journal['pending'])

    def test_new_three_key_restore_only_does_not_need_cli_flag_or_runtime_schema(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);c.set_values('seconds',{m.HEADER_SECONDS:'1'})
            m.spacing.atomic_json(c.output/'baseline-settings-private.json',c.baseline)
            c.header_seconds=False;c.mutation_keys=m.KEYS
            c.expected_runtime_values=lambda:(_ for _ in ()).throw(AssertionError('Recovery needs no schema'))
            with patch.object(m.summary,'no_active_instrumentation',return_value={'state':'idle'}),patch.object(m.traffic,'OwnedPing',side_effect=AssertionError('Recovery cannot ping')):
                c.run(restore_only=True)
            self.assertEqual(current,c.baseline);self.assertEqual(c.mutation_keys,m.KEYS+(m.HEADER_SECONDS,));self.assertFalse(c.journal['pending'])

    def test_foreign_seconds_journal_shapes_reject_before_device_actions(self):
        import copy
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);original=copy.deepcopy(c.journal)
            invalid=[]
            for flag in (False,'true',1):
                j=copy.deepcopy(original);j['headerSeconds']=flag;invalid.append(j)
            j=copy.deepcopy(original);j.pop('headerSeconds');invalid.append(j)
            j=copy.deepcopy(original);j['allowedValues'].pop(m.HEADER_SECONDS);invalid.append(j)
            j=copy.deepcopy(original);j['allowedValues'][m.HEADER_SECONDS].append('2');invalid.append(j)
            j=copy.deepcopy(original);j['values']['unowned']='0';invalid.append(j)
            for j in invalid:
                c.journal=j
                with self.assertRaises(RuntimeError):c.restore()
            self.assertEqual(events,[])

    def test_native_profile_change_preserved_and_pending_not_cleared(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp);c.set_values('seconds',{m.HEADER_SECONDS:'1'})
            c.native_settings=lambda:{'profile':{'density':3250,'font':1300},'settings':{'font_scale':'1.3'}}
            with self.assertRaises(RuntimeError):c.restore()
            self.assertEqual(current,c.baseline);self.assertTrue(c.journal['pending']);self.assertFalse(c.report['nativeSettingsUnchanged'])
            self.assertFalse(any('settings put' in str(e) or 'wm density' in str(e) for e in events))
            self.assertFalse(any('rm '+m.LEASE in str(e) for e in events))

    def test_entire_keyset_including_null_extras_is_checked(self):
        with tempfile.TemporaryDirectory() as temp:
            c,current,events,remote=self.fake(temp)
            for settings in (dict(current,foreign=None),{k:v for k,v in current.items() if k!='clock_pattern'},dict(current,clock_pattern='HH:MM')):
                with self.assertRaises(RuntimeError):c.assert_preserved(settings,'difference')
            self.assertEqual(events,[])


if __name__=='__main__':unittest.main(verbosity=2)
