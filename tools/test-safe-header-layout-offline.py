"""Offline collector/recovery contracts; no ADB import, APK install or phone calls."""
from pathlib import Path
import importlib.util,json,tempfile,unittest,io
from types import SimpleNamespace
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('header_layout',ROOT/'tools/run-safe-header-layout-device.py')
h=importlib.util.module_from_spec(spec);spec.loader.exec_module(h)

class Device:
    def __init__(self,journal):
        self.journal=journal;self.values={'font_scale':'1.0','user_rotation':'0','accelerometer_rotation':'1'};self.commands=[];self.fail_after_write=False;self.ignore_restore=False
    def shell(self,command):
        self.commands.append(command);parts=command.split();assert parts[:3]==['settings','--user','0'];operation=parts[3];key=parts[5]
        if operation=='get':return self.values.get(key,'null')
        saved=json.loads(self.journal.path.read_text(encoding='utf-8'))
        assert saved['pending'] and key in saved.get('nativeOriginal',{}),'native journal must reach disk before write'
        if self.ignore_restore:return ''
        if operation=='delete':self.values.pop(key,None)
        elif operation=='put':self.values[key]=parts[6]
        else:raise AssertionError(command)
        if self.fail_after_write:self.fail_after_write=False;raise RuntimeError('transport failed after setting applied')
        return ''

class HeaderCollectorTest(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.root=Path(self.temp.name);self.journal=h.safe.Journal(self.root/'restore.json',{'clock':'0','weather':'0'},{'serial':'offline'})
        self.device=Device(self.journal);self.native=h.NativeJournal(self.journal,self.device)
    def tearDown(self):self.temp.cleanup()
    def test_write_ahead_retains_first_original_after_transport_failure(self):
        self.device.fail_after_write=True
        with self.assertRaisesRegex(RuntimeError,'transport'):self.native.write('font_scale','1.3')
        self.assertEqual('1.3',self.device.values['font_scale']);self.assertEqual('1.0',self.journal.data['nativeOriginal']['font_scale'])
        self.native.write('font_scale','1.0');self.native.write('font_scale','1.3');self.native.restore();self.assertEqual('1.0',self.device.values['font_scale'])
    def test_absent_native_value_is_deleted_on_restore(self):
        self.device.values.pop('user_rotation');self.native.write('user_rotation','1');self.native.restore();self.assertNotIn('user_rotation',self.device.values)
    def test_no_native_setting_written_means_no_restoration_write(self):
        self.native.restore();self.assertEqual([],self.device.commands)
    def test_unsafe_native_value_rejected_before_change(self):
        self.device.values['font_scale']='1; echo invalid'
        with self.assertRaises(RuntimeError):self.native.write('font_scale','1.3')
        self.assertFalse(self.journal.data.get('nativeOriginal'));self.assertEqual(1,len(self.device.commands))
    def runner(self,config_failure=False,extra=False):
        runner=object.__new__(h.HeaderRunner);runner.ar=self.device;runner.folder=self.root;runner.journal=self.journal;runner.report={};runner.persist=lambda:h.safe.atomic(self.root/'report.json',runner.report)
        actual={'clock':'0','weather':'0'};self.journal.touch(['clock','weather']);actual.update(clock='1',weather='1')
        def instrument(operation,label,values=None):
            if operation=='set':
                if config_failure:raise RuntimeError('configuration transport failure')
                actual.update(values);return {}
            if extra:actual['foreign']='new'
            return {'settings':dict(actual)}
        runner.instrument=instrument;return runner
    def test_configuration_failure_still_restores_native_and_keeps_pending(self):
        self.native.write('font_scale','1.3');runner=self.runner(config_failure=True)
        with self.assertRaisesRegex(RuntimeError,'Restoration incomplete'):runner.cleanup()
        self.assertEqual('1.0',self.device.values['font_scale']);self.assertTrue(self.journal.data['pending'])
    def test_native_failure_still_restores_config_and_keeps_pending(self):
        self.native.write('user_rotation','1');self.device.ignore_restore=True;runner=self.runner()
        with self.assertRaisesRegex(RuntimeError,'Restoration incomplete'):runner.cleanup()
        self.assertTrue(self.journal.data['configurationRestored']);self.assertTrue(self.journal.data['pending'])
    def test_both_restore_before_pending_cleared_including_weather(self):
        self.journal.data['nativeProfileBaseline']=dict(self.device.values);self.native.write('font_scale','1.3');runner=self.runner();runner.cleanup()
        saved=json.loads(self.journal.path.read_text(encoding='utf-8'));self.assertFalse(saved['pending']);self.assertTrue(saved['configurationRestored']);self.assertTrue(saved['nativeProfileRestored']);self.assertEqual({'clock':'0','weather':'0'},saved['restore'])
    def test_unrelated_configuration_difference_is_not_hidden(self):
        runner=self.runner(extra=True)
        with self.assertRaises(RuntimeError):runner.cleanup()
        self.assertTrue(self.journal.data['pending']);self.assertIn('foreign',self.journal.data['configurationDifferences'])
    def test_unwritten_native_drift_retains_pending_without_overwriting_it(self):
        self.journal.data['nativeProfileBaseline']=dict(self.device.values);self.device.values['user_rotation']='2';runner=self.runner()
        with self.assertRaises(RuntimeError):runner.cleanup()
        self.assertTrue(self.journal.data['pending']);self.assertEqual('2',self.device.values['user_rotation']);self.assertFalse(any('put ' in x for x in self.device.commands))
    def test_cross_batch_pending_and_self_exclusion(self):
        for folder in ['quicksettings-grid/x','wifi-assets-test','header-extras-safe/x']:
            p=self.root/folder/'restore.json';p.parent.mkdir(parents=True);p.write_text('{"pending":true}',encoding='utf-8')
        self.assertEqual(4,len(h.pending_runs(self.root)));self.assertEqual(3,len(h.pending_runs(self.root,self.journal.path)))
    def test_recovery_rejects_bad_journal_key(self):
        self.journal.data['nativeOriginal']={'font_scale;bad':'1'}
        with self.assertRaises(RuntimeError):self.native.restore()
        self.assertEqual([],self.device.commands)
    def test_semantic_lines_and_description(self):
        value={'text':'07:12\n:03\n早上','description':'07:12:03 早上'}
        self.assertTrue(h.evaluate_text(value,True,True,False)['assertedCustomFormat'])
        with self.assertRaises(AssertionError):h.evaluate_text({'text':'07:12 早上','description':'07:12'},False,True,False)
        with self.assertRaises(AssertionError):h.evaluate_text({'text':'07:12 早上早上','description':'07:12 早上早上'},False,True,False)
    def test_fallback_and_missing_font_are_not_passes(self):
        self.assertIsNone(h.font_px({}));self.assertIsNone(h.font_px({'renderingInfo':{'textSizePx':float('nan')}}));self.assertEqual(156,h.font_px({'renderingInfo':{'textSizePx':156}}))
        self.assertEqual('native_fallback_insufficient_space',h.layout_state('adapter=CCHeaderView;native;insufficient-space',True));self.assertFalse(h.evaluate_text({'text':'07:12'},True,True,True)['assertedCustomFormat'])
    def test_requested_surface_and_descendant_are_required(self):
        clock={'id':h.ID+'clock','visible':True};header={'id':h.ID+'cc_header','visible':True,'children':[clock]};panel={'id':h.ID+'notification_panel','visible':True,'children':[header,{'id':h.ID+'notification_stack_scroller','visible':True}]};windows=[{'root':panel}]
        self.assertIs(clock,h.select_header(windows,'notification')[2])
        with self.assertRaises(RuntimeError):h.select_header(windows,'control')
        panel['children'].pop()
        with self.assertRaises(RuntimeError):h.select_header(windows,'notification')
    def test_weather_flag_is_rejected_for_control_before_device_import(self):
        with patch('sys.argv',['collector','--run','--expected-version','20455','--surface','control','--with-weather']):
            with self.assertRaises(SystemExit) as result:h.main()
            self.assertEqual(2,result.exception.code)
    def capture_runner(self,windows,weather=False):
        from PIL import Image
        png=io.BytesIO();Image.new('RGB',(100,200),'white').save(png,format='PNG')
        runner=object.__new__(h.HeaderRunner);runner.folder=self.root;runner.report={'cases':[],'withWeather':weather};runner.persist=lambda:h.safe.atomic(self.root/'report.json',runner.report)
        runner.ar=SimpleNamespace(shell=lambda cmd:'',adb=lambda *args:png.getvalue());runner.ui=SimpleNamespace(all_windows=lambda label:windows);runner.profile=lambda:{};runner.diagnostics=lambda:{'ls_augment_header_clock_runtime_2_portrait':'adapter=CCHeaderView;clock;mode=rows'}
        return runner
    def windows(self,weather=True):
        clock={'id':h.ID+'clock','visible':True,'text':'07:12:03','description':'07:12:03','bounds':'[0,0][50,50]','renderingInfo':{'textSizePx':156}}
        children=[clock]
        if weather:children.append({'id':'null','visible':True,'text':'北京 晴 26°','description':'北京，晴，26°，点击打开天气','bounds':'[0,50][90,90]'})
        return [{'root':{'id':h.ID+'notification_panel','visible':True,'children':[{'id':h.ID+'cc_header','visible':True,'children':children},{'id':h.ID+'notification_stack_scroller','visible':True}]}}]
    def test_capture_saves_actual_weather_and_never_claims_pixel_pass(self):
        runner=self.capture_runner(self.windows(),True);row=runner.capture('observed','notification',False,True,False,False,156,reopen=False)
        self.assertEqual('北京 晴 26°',row['weatherNodes'][0]['text']);self.assertEqual(156,row['actualFontPx']);self.assertFalse(row['pixelPassed']);self.assertTrue((self.root/'observed/screen.png').exists())
    def test_missing_weather_preserves_case_before_failure(self):
        runner=self.capture_runner(self.windows(False),True)
        with self.assertRaisesRegex(AssertionError,'weather node'):runner.capture('missing','notification',False,True,False,False,156,reopen=False)
        self.assertTrue((self.root/'missing/case.json').exists());self.assertEqual(1,len(runner.report['cases']))
    def test_failed_panel_observations_are_not_erased_or_labeled_lockscreen(self):
        runner=self.capture_runner([])
        with patch.object(h.time,'sleep'):
            with self.assertRaises(h.PanelUnavailable):runner.capture('no-panel','notification',False,True,False,False,156,reopen=False)
        self.assertEqual(4,len(runner.report['failedObservations']))
        self.assertTrue(all(x['cause']=='unclassified' and not x['featurePassed'] for x in runner.report['failedObservations']))
        self.assertEqual(4,len(list(self.root.rglob('screen.png'))))
    def test_portrait_background_never_receives_landscape_swipe(self):
        runner=self.capture_runner([]);commands=[];runner.ar.shell=lambda cmd:commands.append(cmd) or ''
        with patch.object(h.time,'sleep'):
            with self.assertRaises(h.PanelUnavailable):runner.open_panel('control',True)
        self.assertIn('am start -W -n '+h.safe.PACKAGE+'/.LandscapeActivity',commands)
        self.assertFalse(any(c.startswith('input swipe') for c in commands))
    def test_landscape_uses_actual_dimensions_from_rotatable_background(self):
        from PIL import Image
        runner=self.capture_runner([]);commands=[];png=io.BytesIO();Image.new('RGB',(200,100),'white').save(png,format='PNG')
        runner.ar.shell=lambda cmd:commands.append(cmd) or '';runner.ar.adb=lambda *args:png.getvalue()
        with patch.object(h.time,'sleep'):runner.open_panel('control',True)
        self.assertIn('cmd statusbar expand-settings',commands)
        self.assertFalse(any(c.startswith('input swipe') for c in commands))
    def test_native_hidden_clock_preserves_full_panel_evidence_without_format_pass(self):
        windows=self.windows();header=windows[0]['root']['children'][0];header['children']=[]
        runner=self.capture_runner(windows)
        row=runner.capture('hidden-clock','notification',False,True,False,True,None,reopen=False)
        self.assertFalse(row['clockObserved']);self.assertIsNone(row['clock']);self.assertFalse(row['format']['assertedCustomFormat'])
        self.assertEqual('clock_not_observed',row['format']['state']);self.assertTrue((self.root/'hidden-clock/screen.png').exists())
    def test_native_switch_uses_empty_band_and_rejects_controls_in_path(self):
        header={'id':h.ID+'cc_header','visible':True,'bounds':'[297,0][2390,107]'}
        media={'visible':True,'clickable':True,'bounds':'[297,140][759,602]'}
        panel={'id':h.ID+'control_panel','visible':True,'bounds':'[0,0][2688,1216]','children':[header,media]}
        windows=[{'active':True,'focused':True,'root':{'package':'com.android.systemui','children':[panel]}}]
        self.assertEqual([538,123,2150,123],h.landscape_notification_switch(windows))
        panel['children'].append({'visible':True,'clickable':True,'bounds':'[500,90][700,140]'})
        with self.assertRaises(h.PanelUnavailable):h.landscape_notification_switch(windows)
        panel['children'].pop();media['bounds']='[297,113][759,602]'
        with self.assertRaises(h.PanelUnavailable):h.landscape_notification_switch(windows)
    def test_scroll_path_stays_above_clear_and_inside_observed_row(self):
        header={'id':h.ID+'cc_header','visible':True,'bounds':'[0,0][1216,500]'}
        row={'id':h.ID+'expandableNotificationRow','visible':True,'bounds':'[62,2180][1154,2446]'}
        stack={'id':h.ID+'notification_stack_scroller','visible':True,'bounds':'[0,0][1216,2688]','children':[row]}
        clear={'id':h.ID+'iv_dismiss_notification_view','visible':True,'bounds':'[540,2388][677,2525]'}
        windows=[{'active':True,'focused':True,'root':{'package':'com.android.systemui','children':[header,stack,clear]}}]
        x,y,xx,yy=h.notification_scroll_path(windows,3.25,'up')
        self.assertEqual(x,xx);self.assertGreaterEqual(y,2180);self.assertLess(y,2362);self.assertGreaterEqual(yy,526)
        row['children']=[{'visible':True,'clickable':True,'bounds':'[62,2180][1154,2446]'}]
        with self.assertRaises(h.PanelUnavailable):h.notification_scroll_path(windows,3.25,'up')
        row.pop('children')
        windows[0]['focused']=False
        with self.assertRaises(h.PanelUnavailable):h.notification_scroll_path(windows,3.25,'up')

if __name__=='__main__':unittest.main(verbosity=2)
