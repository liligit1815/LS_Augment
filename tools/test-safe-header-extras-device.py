"""Offline recovery, UI qualification and category-resolution tests. No ADB."""
from pathlib import Path
import importlib.util
import json
import sys
import tempfile
import unittest
from types import SimpleNamespace

ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'tools'))
spec=importlib.util.spec_from_file_location('header_extras_test',ROOT/'tools/run-safe-header-extras-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)


def baseline():return {m.WEATHER:'0',m.CALENDAR:'1','unrelated':'original'}


class Transport:
    def __init__(self,values):self.values=dict(values);self.calls=[];self.fault=None;self.delay=0;self.pending=None
    def __call__(self,op,label,values=None):
        self.calls.append((op,label,values))
        if op=='set':
            if self.fault=='before':self.fault=None;raise ConnectionError('before write')
            if self.delay:self.pending=dict(values)
            else:self.values.update(values)
            if self.fault=='after':self.fault=None;raise ConnectionError('after write')
        elif self.pending:
            self.delay-=1
            if self.delay<=0:self.values.update(self.pending);self.pending=None
        return {'settings':dict(self.values),'runtimeSynced':self.pending is None}


def node(identity,text='null',description='null',rect='[10,20][100,60]',children=(),package='com.android.systemui'):
    return {'id':m.ID+identity if identity else 'null','text':text,'description':description,'bounds':rect,'visible':True,
        'enabled':True,'clickable':True,'package':package,'children':list(children)}


def window(root,package='com.android.systemui',kind=3,active=True):
    root['package']=package;return {'root':root,'active':active,'focused':active,'type':kind,'title':'fixture'}


def panel(weather=None,below=False):
    date=node('date','10月4日 星期日')
    children=[node('date_view',children=[date])]
    if weather is not None:children.append(node('',weather,'暂无天气 · 点击打开天气更新，点击打开天气',rect='[10,65][160,95]' if below else '[110,20][250,60]'))
    return [window(node('notification_panel',children=[node('notification_stack_scroller'),node('cc_header',children=children)]))]


class Recovery(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory();self.addCleanup(self.temp.cleanup)
        self.path=Path(self.temp.name)/'restore.json';self.j=m.Journal(self.path,baseline(),{})
    def test_writes_only_two_boolean_keys(self):
        for values in [{'screen_brightness':'0'},{m.WEATHER:'yes'},{'ls_augment_rm_qs_grid':'1'},{}]:
            with self.subTest(values=values),self.assertRaises(ValueError):self.j.plan(values,baseline())
    def test_write_ahead_recovers_applied_transport_failure(self):
        value={m.WEATHER:'1'};self.j.plan(value,baseline());t=Transport(baseline());t.fault='after'
        with self.assertRaises(ConnectionError):t('set','try',value)
        loaded=m.Journal(self.path);loaded.restore(t,lambda _:None)
        self.assertEqual(t.values,baseline());self.assertFalse(loaded.data['pending'])
    def test_restore_handles_asynchronous_readback(self):
        self.j.plan({m.WEATHER:'1'},baseline());self.j.acknowledge({m.WEATHER:'1'})
        t=Transport(baseline()|{m.WEATHER:'1'});t.delay=3;self.j.restore(t,lambda _:None)
        self.assertEqual(t.values,baseline());self.assertFalse(self.j.data['pending'])
        self.assertEqual(len([c for c in t.calls if c[1].startswith('recovery-readback')]),4)
    def test_async_never_settles_retains_pending(self):
        self.j.plan({m.WEATHER:'1'},baseline());self.j.acknowledge({m.WEATHER:'1'})
        t=Transport(baseline()|{m.WEATHER:'1'});t.delay=100
        with self.assertRaises(RuntimeError):self.j.restore(t,lambda _:None)
        self.assertTrue(m.Journal(self.path).data['pending'])
    def test_restore_disconnect_can_be_retried(self):
        for fault in ('before','after'):
            with self.subTest(fault=fault):
                j=m.Journal(self.path,baseline(),{});j.plan({m.WEATHER:'1'},baseline());t=Transport(baseline()|{m.WEATHER:'1'});t.fault=fault
                with self.assertRaises(ConnectionError):j.restore(t,lambda _:None)
                m.Journal(self.path).restore(t,lambda _:None);self.assertEqual(t.values,baseline())
    def test_original_nondefault_preserved(self):
        self.j.plan({m.CALENDAR:'0'},baseline());self.j.acknowledge({m.CALENDAR:'0'});t=Transport(baseline()|{m.CALENDAR:'0'})
        self.j.restore(t,lambda _:None);self.assertEqual(t.values[m.CALENDAR],'1')
    def test_original_not_replaced_by_later_phase(self):
        self.j.plan({m.CALENDAR:'0'},baseline());self.j.acknowledge({m.CALENDAR:'0'})
        self.j.plan({m.CALENDAR:'1'},baseline()|{m.CALENDAR:'0'});self.j.acknowledge({m.CALENDAR:'1'})
        self.assertEqual(self.j.data['restore'][m.CALENDAR],'1')
    def test_external_change_to_an_earlier_test_value_is_preserved(self):
        self.j.plan({m.CALENDAR:'0'},baseline());self.j.acknowledge({m.CALENDAR:'0'})
        self.j.plan({m.CALENDAR:'1'},baseline()|{m.CALENDAR:'0'});self.j.acknowledge({m.CALENDAR:'1'})
        t=Transport(baseline()|{m.CALENDAR:'0'})
        with self.assertRaises(RuntimeError):self.j.restore(t,lambda _:None)
        self.assertEqual(t.values[m.CALENDAR],'0');self.assertFalse(any(c[0]=='set' for c in t.calls))
    def test_external_unknown_owned_value_does_not_block_other_owned_restore(self):
        self.j.plan({m.WEATHER:'1',m.CALENDAR:'0'},baseline());self.j.acknowledge({m.WEATHER:'1',m.CALENDAR:'0'})
        t=Transport(baseline()|{m.WEATHER:'external',m.CALENDAR:'0'})
        with self.assertRaises(RuntimeError):self.j.restore(t,lambda _:None)
        self.assertEqual(t.values[m.WEATHER],'external');self.assertEqual(t.values[m.CALENDAR],'1')
        self.assertTrue(self.j.data['pending'])
    def test_unrelated_external_change_kept(self):
        self.j.plan({m.WEATHER:'1'},baseline());t=Transport(baseline()|{m.WEATHER:'1','unrelated':'user-later'})
        with self.assertRaises(RuntimeError):self.j.restore(t,lambda _:None)
        self.assertEqual(t.values['unrelated'],'user-later');self.assertEqual(t.values[m.WEATHER],'0')
    def test_next_phase_refuses_changed_untouched_key(self):
        with self.assertRaises(ValueError):self.j.plan({m.CALENDAR:'0'},baseline()|{m.CALENDAR:'0'})
    def test_bad_journal_original_or_key_refused(self):
        self.j.data['restore']['screen_brightness']='5'
        with self.assertRaises(ValueError):self.j.restore(Transport(baseline()),lambda _:None)
        self.j.data['restore']={m.CALENDAR:'0'}
        with self.assertRaises(ValueError):self.j.restore(Transport(baseline()),lambda _:None)
    def test_readback_exception_does_not_clear_pending(self):
        self.j.plan({m.WEATHER:'1'},baseline());t=Transport(baseline()|{m.WEATHER:'1'})
        def fail(op,label,values=None):
            if label=='recovery-readback-0':raise ConnectionError('lost read')
            return t(op,label,values)
        with self.assertRaises(ConnectionError):self.j.restore(fail,lambda _:None)
        self.assertTrue(m.Journal(self.path).data['pending'])
    def test_reasserts_original_even_if_config_already_back(self):
        self.j.plan({m.WEATHER:'1'},baseline());t=Transport(baseline());self.j.restore(t,lambda _:None)
        self.assertEqual(next(c[2] for c in t.calls if c[0]=='set'),{m.WEATHER:'0'})


class Qualification(unittest.TestCase):
    def test_cross_gate_covers_future_and_nested_collectors_before_phone_access(self):
        with tempfile.TemporaryDirectory() as temp:
            old=m.safe.AUDIT;self.addCleanup(setattr,m.safe,'AUDIT',old);m.safe.AUDIT=Path(temp)
            path=Path(temp)/'future-collector'/'nested'/'restore.json';path.parent.mkdir(parents=True)
            path.write_text(json.dumps({'pending':True}),encoding='utf-8')
            def no_phone(*args,**kwargs):raise AssertionError('Must block before any phone access')
            with self.assertRaisesRegex(m.Inconclusive,'Prior recovery pending'):m.gates(SimpleNamespace(shell=no_phone))
    def test_restore_only_excludes_exact_self_not_other_restore_file(self):
        with tempfile.TemporaryDirectory() as temp:
            old=m.safe.AUDIT;self.addCleanup(setattr,m.safe,'AUDIT',old);m.safe.AUDIT=Path(temp)
            own=Path(temp)/'header-extras-safe-self'/'restore.json';own.parent.mkdir();own.write_text(json.dumps({'pending':True}),encoding='utf-8')
            other=Path(temp)/'header-layout-other'/'restore.json';other.parent.mkdir();other.write_text(json.dumps({'pending':True}),encoding='utf-8')
            def no_phone(*args,**kwargs):raise AssertionError('Another journal must block first')
            with self.assertRaisesRegex(m.Inconclusive,'header-layout-other'):m.gates(SimpleNamespace(shell=no_phone),own)
            other.write_text(json.dumps({'pending':False}),encoding='utf-8')
            raw='\n'.join(['ACTIVITY MANAGER SETTINGS x','ACTIVITY MANAGER ACTIVITIES x','ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)',
                '  OOM levels:','  Process OOM control (x)','  Raw LRU list (x)','  Process LRU list (x)','  mWakefulness=awake','  mShuttingDown=false','  mForceBackgroundCheck=false',
                'ACTIVITY MANAGER USERS (dumpsys activity users)','ACTIVITY MANAGER COMPONENT-ALIAS x'])
            def shell(command,**kwargs):return raw if command=='dumpsys activity' else '' if command.startswith('find ') else 'ABSENT'
            m.gates(SimpleNamespace(shell=shell),own)
    def test_concrete_category_component_only(self):self.assertEqual(m.resolve_component('priority=0\ncom.android.calendar/.AllInOneActivity\n'),'com.android.calendar/.AllInOneActivity')
    def test_resolver_chooser_missing_and_multiple_targets_refused(self):
        for raw in ['No activity found','android/com.android.internal.app.ResolverActivity','com.android.intentresolver/.ChooserActivity','com.a/.One\ncom.b/.Two','Error: permission denied','']:
            with self.subTest(raw=raw),self.assertRaises(m.Inconclusive):m.resolve_component(raw)
    def test_header_weather_can_be_below_date(self):
        actual=m.header(panel('暂无天气',True));self.assertEqual(actual['weatherState'],'fallback_no_weather')
        self.assertEqual(actual['weatherGeometry']['relationship'],'below_date')
    def test_weather_same_band_does_not_assume_shared_parent(self):
        actual=m.header(panel('暂无天气'));self.assertEqual(actual['weatherGeometry']['relationship'],'same_vertical_band')
    def test_missing_weather_is_absent_not_live_data(self):self.assertEqual(m.header(panel())['weatherState'],'absent')
    def test_nonfocused_stale_systemui_tree_cannot_authorize_tap(self):
        windows=panel('暂无天气');windows[0]['active']=False
        with self.assertRaises(m.Inconclusive):m.header(windows)
    def test_control_panel_does_not_authorize_notification_date(self):
        windows=panel();windows[0]['root']['children'].append(node('control_panel'))
        with self.assertRaises(m.Inconclusive):m.header(windows)
    def test_unrelated_weather_text_outside_header_is_ignored(self):
        windows=panel();windows[0]['root']['children'].append(node('','21°C','天气，点击打开天气'))
        self.assertIsNone(m.header(windows)['weather'])
    def test_zero_size_label_not_tappable(self):
        windows=panel('暂无天气');windows[0]['root']['children'][1]['children'][-1]['bounds']='[10,10][10,10]'
        with self.assertRaises(m.Inconclusive):m.header(windows)
    def test_cached_stale_unknown_states_never_called_live(self):
        for description,expected in [('晴，非今日数据 · 点击更新，点击打开天气','stored_weather_not_today'),('晴，更新时间未知，点击打开天气','stored_weather_time_unknown'),('晴，待更新，点击打开天气','stored_weather_stale'),('晴，06:10更新，点击打开天气','stored_weather_displayed')]:
            self.assertEqual(m.weather_state(node('',text='城市 晴 23°C',description=description)),expected)
    def test_denied_weather_query_not_claimed_empty_or_live(self):
        self.assertEqual(m.source_state('java.lang.SecurityException: permission denied'),'read_denied_or_error')
        self.assertEqual(m.source_state('READ_ERROR: TimeoutExpired'),'read_denied_or_error')
        self.assertEqual(m.source_state('No result found.'),'empty_or_unavailable')
        self.assertEqual(m.source_state('Row: 0 city_name=X, curr_temper=23'),'stored_rows_returned')
    def test_target_needs_native_and_accessibility_focus_and_no_panel(self):
        package='com.android.calendar';windows=[window(node('',package=package),package,1)]
        native='mCurrentFocus=Window{123 u0 com.android.calendar/.AllInOneActivity}'
        self.assertTrue(m.focus_state(windows,native,package)['targetFocusedAndPanelGone'])
        self.assertFalse(m.focus_state(windows,'',package)['targetFocusedAndPanelGone'])
        self.assertFalse(m.focus_state(windows,native,'com.other.app')['targetFocusedAndPanelGone'])
        windows+=panel();self.assertFalse(m.focus_state(windows,native,package)['targetFocusedAndPanelGone'])
    def test_permission_and_first_run_guides_are_not_success(self):
        for package,text in [('com.android.permissioncontroller','允许'),('com.android.calendar','用户协议'),('com.android.calendar','首次使用需要权限')]:
            windows=[window(node('',text,package=package),package,1)]
            state=m.focus_state(windows,'mCurrentFocus=Window{1 u0 '+package+'/.Main}',package)
            self.assertTrue(state['setupOrPermissionObserved']);self.assertFalse(state['targetFocusedAndPanelGone'])
    def test_unfocused_background_app_is_not_a_launch_pass(self):
        windows=[window(node('',package='com.android.calendar'),'com.android.calendar',1,False)]
        self.assertFalse(m.focus_state(windows,'mCurrentFocus=Window{1 u0 com.android.calendar/.Main}','com.android.calendar')['targetFocusedAndPanelGone'])
    def test_native_tree_shape_from_actual_saved_notification(self):
        path=ROOT/'out/full-function-audit-20261004/wifi-spacing-traffic-20453-20261004-045651/baseline-notification/result-private.json'
        if not path.is_file():self.skipTest('Optional actual fixture absent')
        actual=m.header(json.loads(path.read_text(encoding='utf-8'))['uiWindows'])
        self.assertEqual(actual['date']['id'],m.ID+'date');self.assertEqual(actual['weatherState'],'absent')
    def test_click_rejects_offscreen_or_disabled_before_any_command(self):
        with tempfile.TemporaryDirectory() as tmp:
            c=object.__new__(m.Collector);c.folder=Path(tmp);c.last_size=(600,1200);commands=[];c.ar=SimpleNamespace(shell=commands.append)
            for value in [dict(node('date'),enabled=False),node('date',rect='[-20,20][100,60]'),node('date',rect='[550,20][650,60]')]:
                with self.assertRaises(m.Inconclusive):c.click_observed('invalid',value)
            self.assertEqual(commands,[])


if __name__=='__main__':unittest.main(verbosity=2)
