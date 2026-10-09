"""Minimal offline orchestration/restoration checks; no ADB import or phone actions."""
from pathlib import Path
import importlib.util,json,tempfile,unittest,struct
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('font_density',ROOT/'tools/run-header-font-density-device.py')
d=importlib.util.module_from_spec(spec);spec.loader.exec_module(d)

class Device:
    def __init__(self,journal):
        self.journal=journal;self.settings={'font_scale':'1.0','user_rotation':'0','accelerometer_rotation':'1'}
        self.commands=[];self.fail_font=False;self.refuse_restore=False
    def shell(self,command):
        self.commands.append(command)
        if not command.startswith('settings '):return ''
        parts=command.split();operation,key=parts[3],parts[5]
        if operation=='get':return self.settings.get(key,'null')
        disk=json.loads(self.journal.path.read_text(encoding='utf-8'))
        assert disk['pending'] and key in disk['nativeOriginal'],'Mutation was not journaled first'
        if operation=='put':
            if self.refuse_restore and key=='font_scale' and parts[6]=='1.0':return ''
            self.settings[key]=parts[6]
        elif operation=='delete':self.settings.pop(key,None)
        else:raise AssertionError(command)
        if self.fail_font and key=='font_scale':self.fail_font=False;raise RuntimeError('transport failed after font write')
        return ''

class Runner(d.DensityRunner):
    def __init__(self,folder):
        self.folder=folder;self.report={'cases':[],'stages':[],'withWeather':False};self.sequence=0
        original={d.h.P+'clock_seconds':'1',d.h.P+'clock_period':'1',d.h.WEATHER:'1','unrelated':'preserve'}
        for direction in ('portrait','landscape'):
            original[d.h.N+direction+'_enabled']='0';original[d.h.N+direction+'_size']='44'
        self.journal=d.DensityJournal(folder/'restore.json',original,{'serial':'offline','installedVersion':20457})
        self.values=dict(original);self.ar=Device(self.journal);self.records=[];self.wrong_png=False;self.different_second=False;self.fail_cleanup=False;self.native_landscape=False
    def fixture(self):pass  # Existing shared fixture identity/install logic is not simulated as a device pass.
    def runtime_current(self,*args):return True
    def instrument(self,operation,label,values=None):
        if operation=='set':
            if self.fail_cleanup and label=='restore-config':raise RuntimeError('configuration recovery failure')
            disk=json.loads(self.journal.path.read_text(encoding='utf-8'));assert disk['pending']
            assert set(values).issubset(disk['restore'])
            self.values.update(values)
        return {'settings':dict(self.values)}
    def capture(self,label,surface,wide,seconds,period,expanded,baseline_font,reopen):
        assert self.ar.settings['font_scale']=='1.3'
        self.records.append((label,wide,reopen,dict(self.values),dict(self.ar.settings)))
        orientation='landscape' if wide else 'portrait';key='ls_augment_header_clock_runtime_2_'+orientation
        clock_bounds='[0,100][500,400]' if not self.different_second or reopen else '[0,100][500,410]'
        row={'evidence':label,'pngSize':[2688,1216] if wide else [1216,2688],'headerBounds':'[0,0][1000,500]',
             'clock':{'bounds':clock_bounds},'actualFontPx':None,'layoutState':'custom_layout_reported',
             'headerDescendants':[{'id':d.h.ID+'date','visible':True,'bounds':'[0,410][300,480]'}],
             'profile':{'settings':dict(self.ar.settings),'systemUiPid':'22973','wmDensity':'Physical density: 520','deviceTime':'offline'},
             'diagnostic':{key:'adapter=CCHeaderView;panel=2;clock;mode=rows;size=270.4;orientation='+orientation,
               'ls_augment_statusbar_header_spacing_capacity_notification_'+('1' if wide else '0'):'HSC1|1000|2000|20457|0|'+('1' if wide else '0')+'|3250|1300|0|11'}}
        if self.wrong_png:row['pngSize']=[2688,1216]
        if self.native_landscape and wide:
            row['layoutState']='native_unexpected_or_stale';row['diagnostic'][key]='adapter=CCHeaderView;panel=2;native'
        self.report['cases'].append(row);return row

class DensityTest(unittest.TestCase):
    def setUp(self):self.temp=tempfile.TemporaryDirectory();self.runner=Runner(Path(self.temp.name))
    def tearDown(self):self.temp.cleanup()
    def run_session(self):
        with patch.object(d.time,'sleep'):d.run_session(self.runner)
    def test_one_font_write_six_observations_three_directions_and_full_restore(self):
        self.run_session();r=self.runner
        self.assertEqual([False,False,True,True,False,False],[x[1] for x in r.records])
        self.assertEqual([True,False]*3,[x[2] for x in r.records])
        self.assertEqual(1,r.ar.commands.count('settings --user 0 put system font_scale 1.3'))
        for _,wide,_,values,native in r.records:
            self.assertEqual('1.3',native['font_scale']);self.assertEqual('1' if wide else '0',native['user_rotation'])
            for direction in ('portrait','landscape'):self.assertEqual('64',values[d.h.N+direction+'_size'])
            for key in (d.h.P+'clock_seconds',d.h.P+'clock_period',d.h.WEATHER):self.assertEqual('0',values[key])
        self.assertEqual(r.journal.data['baseline'],r.values);self.assertEqual({'font_scale':'1.0','user_rotation':'0','accelerometer_rotation':'1'},r.ar.settings)
        self.assertTrue(all(s['stableGeometryAndDiagnostics'] and not s['pixelPassed'] for s in r.report['stages']))
        self.assertFalse(json.loads(r.journal.path.read_text(encoding='utf-8'))['pending'])
    def test_wrong_actual_png_rejected_despite_settings_and_restored(self):
        self.runner.wrong_png=True
        with self.assertRaisesRegex(d.h.PanelUnavailable,'Actual PNG'):self.run_session()
        self.assertEqual(1,len(self.runner.records));self.assertEqual('1.0',self.runner.ar.settings['font_scale']);self.assertFalse(self.runner.journal.data['pending'])
    def test_unstable_second_retains_observations_stops_before_next_orientation(self):
        self.runner.different_second=True
        with self.assertRaisesRegex(d.h.PanelUnavailable,'stable geometry'):self.run_session()
        self.assertEqual(2,len(self.runner.report['stages'][0]['observations']));self.assertEqual(2,len(self.runner.records));self.assertFalse(self.runner.journal.data['pending'])
    def test_font_write_applies_then_transport_fails_is_restored(self):
        self.runner.ar.fail_font=True
        with self.assertRaisesRegex(RuntimeError,'transport'):self.run_session()
        self.assertEqual([],self.runner.records);self.assertEqual('1.0',self.runner.ar.settings['font_scale']);self.assertFalse(self.runner.journal.data['pending'])
    def test_configuration_recovery_failure_still_restores_native_and_keeps_pending(self):
        self.runner.fail_cleanup=True
        with self.assertRaisesRegex(RuntimeError,'Restoration incomplete'):self.run_session()
        self.assertEqual('1.0',self.runner.ar.settings['font_scale']);self.assertTrue(self.runner.journal.data['pending'])
    def test_refused_native_recovery_keeps_pending_after_configuration_restored(self):
        self.runner.ar.refuse_restore=True
        with self.assertRaisesRegex(RuntimeError,'Restoration incomplete'):self.run_session()
        self.assertTrue(self.runner.journal.data['configurationRestored']);self.assertTrue(self.runner.journal.data['pending'])
    def test_cleanup_internal_false_cannot_clear_durable_pending_early(self):
        r=self.runner
        def cleanup():
            r.journal.data['pending']=False;r.journal.save()
            self.assertTrue(json.loads(r.journal.path.read_text(encoding='utf-8'))['pending'])
            raise RuntimeError('interrupted shared cleanup')
        r.cleanup=cleanup
        with self.assertRaises(RuntimeError):d.cleanup(r)
        self.assertTrue(json.loads(r.journal.path.read_text(encoding='utf-8'))['pending'])
    def test_unknown_hsc_is_not_stable_but_fallback_is_distinct(self):
        self.assertIsNone(d.hsc(None));self.assertIsNone(d.hsc('HSC1|bad'))
        native=d.h.NativeJournal(self.runner.journal,self.runner.ar);native.write('font_scale','1.3')
        first=d.evidence(self.runner.capture('a','notification',False,False,False,True,None,True),False)
        second=dict(first);second['hsc']=None;self.assertFalse(d.stable_pair(first,second))
        fallback=dict(first);fallback.update(layoutState='native_fallback_insufficient_space',reportedClockPx=None)
        self.assertFalse(d.stable_pair(first,fallback));self.assertTrue(d.stable_pair(fallback,dict(fallback)))
        self.assertFalse(fallback['pixelPassed'])
    def test_stable_native_landscape_is_retained_as_conflict_without_retry(self):
        self.runner.native_landscape=True;self.run_session()
        self.assertEqual(6,len(self.runner.records));stage=self.runner.report['stages'][1]
        self.assertTrue(stage['stableGeometryAndDiagnostics']);self.assertTrue(stage['layoutConflict'])
        self.assertFalse(stage['requestedLayoutReported']);self.assertFalse(stage['pixelPassed'])
        self.assertEqual('observed_continuous_profile_with_layout_conflict',self.runner.report['status'])
        self.assertFalse(self.runner.journal.data['pending'])
    def transition(self,observations):
        r=self.runner;self.window_index=-1
        class UI:
            def all_windows(_,label):
                self.window_index+=1
                width,height,package=observations[min(self.window_index,len(observations)-1)]
                folder=r.folder/label;folder.mkdir()
                windows=[{'active':True,'focused':True,'type':1,'root':{'package':package,'bounds':'[0,0][%d,%d]'%(width,height)}}]
                (folder/'windows.json').write_text(json.dumps(windows),encoding='utf-8');return windows
        def adb(*_):
            width,height,_=observations[min(self.window_index,len(observations)-1)]
            return b'\x89PNG\r\n\x1a\n'+bytes(8)+struct.pack('>II',width,height)
        r.ui=UI();r.ar.adb=adb
    def test_wait_retains_landscape_then_two_portrait_home_observations_before_swipe(self):
        home='com.zte.mifavor.launcher'
        self.transition([(2688,1216,home),(1216,2688,home),(1216,2688,home)])
        with patch.object(d.time,'sleep'):self.runner.open_panel('notification',False)
        rows=self.runner.report['portraitEntryObservations']
        self.assertEqual([False,True,True],[x['portraitHomeObserved'] for x in rows]);self.assertTrue(rows[-1]['consecutiveStable'])
        self.assertEqual(1,sum(x.startswith('input swipe ') for x in self.runner.ar.commands))
        self.assertEqual(3,len(list(self.runner.folder.glob('portrait-entry-*/screen.png'))))
        self.assertEqual(3,len(list(self.runner.folder.glob('portrait-entry-*/windows.json'))))
        self.assertFalse(any(x.startswith('settings ') for x in self.runner.ar.commands))
    def test_wrong_focused_surface_or_persistent_landscape_never_swipes(self):
        self.transition([(1216,2688,'unrelated.permission.dialog')])
        with patch.object(d.time,'sleep'),self.assertRaisesRegex(d.h.PanelUnavailable,'six saved'):self.runner.open_panel('notification',False)
        self.assertEqual(6,len(self.runner.report['portraitEntryObservations']))
        self.assertFalse(any(x.startswith('input swipe ') for x in self.runner.ar.commands))
    def test_transition_wrong_png_fails_before_panel_entry(self):
        self.transition([(1216,2688,'com.zte.mifavor.launcher')]);self.runner.ar.adb=lambda *_:b'not png'
        with self.assertRaisesRegex(RuntimeError,'PNG unavailable'):self.runner.open_panel('notification',False)
        self.assertFalse(any(x.startswith('input swipe ') for x in self.runner.ar.commands))

if __name__=='__main__':unittest.main(verbosity=2)
