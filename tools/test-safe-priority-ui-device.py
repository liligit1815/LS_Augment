"""Focused offline UI-target and recovery checks; no phone/build."""
from pathlib import Path
import copy,importlib.util,json,tempfile,time,unittest
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('priority_ui_under_test',ROOT/'tools/run-safe-priority-ui-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)


def journal(folder):
    saved=json.loads((ROOT/'out/full-function-audit-20261004/statusbar-notification-icons-20463-20261004-171345/baseline/result-private.json').read_text('utf-8'))['settings']
    saved=dict(saved,**{m.PR:'0',m.LIMIT:'3',m.ORDER:''})
    meta=dict(case='priority-ui',serial='offline',installedVersion=20463,installedVersionName='test20463',mainApkSha256='a'*64,testApkSha256='b'*64,
        observerApkSha256='c'*64,process={'pid':20209},nativeBaseline={'system/font_scale':'1.0'},notificationsBefore=[],
        homeComponent='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher',runId='d'*32,
        rawBaseline={k:['string',None,v] for k,v in saved.items()},runtimeSchema={'build':20463,'runtimeKeys':list(saved)})
    return m.Journal.create(Path(folder)/'restore.json',saved,meta,{}, {},{})


def confirmed(j,values):
    current=j.expected();op=j.begin(values,current,'sent');op['transportInvoked']=True;j.save();j.acknowledge(values,dict(current,**values))


def node(text='',**kw):
    return dict(text=text,visible=True,enabled=True,clickable=False,bounds='[0,0][500,800]',**kw)


def window(children):
    root=node(package=m.APP,children=children);return dict(active=True,focused=True,bounds=root['bounds'],root=root)


class Fake(m.Collector):
    def __init__(self,folder,j):
        self.folder=Path(folder);self.journal=j;self.report={'cases':[]};self.events=[];self.current_values=j.expected()
        self.ar=self;self.editor=False;self.recovering=False;self.deadline=time.monotonic()+100;self.pixel_error=False;self.external_slow=False
    def identity(self,label):self.events.append(('identity',label))
    def protect(self,label,*args):
        self.events.append(('protect',label))
        if self.external_slow:self.current_values['ls_augment_statusbar_system_two_rows']='external-change'
    def notifications(self,label):self.events.append(('notifications',label))
    def config(self,label):
        if self.editor:raise m.core.Unobserved('Fake editor still open')
        self.events.append(('snapshot',label));return dict(self.current_values)
    def navigate(self,label,command):self.events.append(('navigate',command));self.editor=command==m.OPEN
    def evidence(self,label):
        self.events.append(('pixels',label))
        if self.pixel_error:raise m.core.Unobserved('Pixel unknown')
    def instrument(self,operation,label,values=None,**kw):
        self.assert_editor_closed();self.events.append(('set',dict(values)))
        op=self.journal.begin(values,kw['current'],label,recovery=kw.get('recovery',False));op['transportInvoked']=True;self.journal.save()
        self.current_values.update(values)
    def assert_editor_closed(self):
        if self.editor:raise AssertionError('Main instrumentation while editor active')
    def persist(self):m.atomic(self.folder/'report.json',self.report)


class PriorityUi(unittest.TestCase):
    def setUp(self):self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
    def test_only_three_keys_and_no_native(self):
        self.j.values({m.PR:'1',m.LIMIT:'0',m.ORDER:'bluetooth,volume'})
        for values in ({m.GRID:self.j.data['baseline'][m.GRID]},{m.LIMIT:'21'},{m.ORDER:'volume,volume'},{m.ORDER:'privacy.dot'}):
            with self.assertRaises(ValueError):self.j.values(values)
        with self.assertRaises(ValueError):self.j.native_value('system/font_scale','1.3')
    def test_real_native_method_no_foreign_mro(self):
        c=m.Collector.__new__(m.Collector);c.ar=type('ReadOnly',(),{'shell':lambda self,cmd,**kw:'value:'+cmd})()
        got=c.native();self.assertEqual('value:wm density',got['density']);self.assertIn('system/font_scale',got)
    def test_grid_normalization_is_refused_before_ui(self):
        raw=self.j.data['baseline'][m.GRID];self.assertTrue(m.grid_roundtrip(raw))
        p=raw.split(';');p[1],p[2]=p[2],p[1];self.assertFalse(m.grid_roundtrip(';'.join(p)))
        self.assertFalse(m.grid_roundtrip(''));self.assertFalse(m.grid_roundtrip(raw.replace(',13,',',013,',1)))
    def test_move_up_down_first_and_first_boundary_exact_serialization(self):
        initial='bluetooth,volume,nfc';up=m.moved(initial,'volume','上移一位')
        self.assertEqual(['volume','bluetooth','nfc'],m.order(up)[:3])
        down=m.moved(up,'volume','下移一位');self.assertEqual(m.order(initial),m.order(down))
        first=m.moved(down,'volume','置于首位');self.assertEqual(first,m.moved(first,'volume','上移一位'));self.assertEqual(26,len(first.split(',')))
    def test_named_requires_unique_current_window_and_exact_dialog(self):
        title=node('优先保留顺序');button=node('完成');button['clickable']=True
        windows=[window([title,button])];self.assertIs(button,m.named(windows,'完成','优先保留顺序'))
        with self.assertRaises(m.core.Unobserved):m.named(windows,'完成','another')
        with self.assertRaises(m.core.Unobserved):m.named(windows+[window([])],'完成')
        windows[0]['root']['children'].append(copy.deepcopy(button))
        with self.assertRaises(m.core.Unobserved):m.named(windows,'完成')
    def test_selector_does_not_adopt_underlying_identical_app_node(self):
        button=node('完成');button['clickable']=True;under=window([button]);under.update(active=False,focused=False)
        overlay=window([]);overlay['root']['package']='other.app'
        with self.assertRaises(m.core.Unobserved):m.named([under,overlay],'完成')
    def test_scroll_never_starts_on_a_slider_or_unknown_multiple_container(self):
        scroll=node(children=[]);scroll.update(scrollable=True,**{'class':'android.widget.ScrollView'})
        slider=node();slider.update(bounds='[0,300][500,800]',**{'class':'android.widget.SeekBar'})
        scroll['children']=[slider]
        with self.assertRaises(m.core.Unobserved):m.scroll_path([window([scroll])],'down')
        scroll['children']=[];area,points=m.scroll_path([window([scroll])],'down');self.assertGreater(points[1],points[3])
        with self.assertRaises(m.core.Unobserved):m.scroll_path([window([scroll,copy.deepcopy(scroll)])],'down')
    def test_editor_guard_prevents_every_main_snapshot_set_inventory(self):
        c=Fake(self.tmp.name,self.j);c.editor=True
        with patch.object(m.rows.Collector,'instrument',side_effect=AssertionError('reached transport')):
            for operation in ('snapshot','set','statusbar-assets-runtime'):
                with self.assertRaises(m.core.Unobserved):m.Collector.instrument(c,operation,'blocked',{m.PR:'1'} if operation=='set' else None)
    def test_ui_readback_rejects_foreign_grid_save(self):
        c=Fake(self.tmp.name,self.j);values={m.ORDER:'bluetooth,volume'};op=self.j.begin(values,self.j.expected(),'ui');op['transportInvoked']=True;self.j.save()
        c.raw_settings=lambda label:dict(self.j.expected(),**values,**{m.GRID:'external'})
        with self.assertRaises(m.core.Unobserved):c.readback('foreign-save',values)
        self.assertTrue(self.j.data['inflight'])
    def test_actual_cancel_tap_does_not_undo_prior_confirmed_order(self):
        confirmed(self.j,{m.ORDER:'bluetooth,volume'});c=Fake(self.tmp.name,self.j)
        c.raw_settings=lambda label:dict(c.current_values)
        c.find=lambda *a,**kw:({'started':time.monotonic()},node('取消'),(20,30))
        sent=[];c.action=lambda label,command,ob,values,current:sent.append((command,values))
        with patch.object(m.time,'sleep'):c.tap('cancel','取消','1. 蓝牙')
        self.assertEqual([('input tap 20 30',None)],sent);self.assertEqual('bluetooth,volume',self.j.expected()[m.ORDER]);self.assertEqual({},self.j.data['inflight'])
    def test_restore_preserves_external_revert_original_but_restores_other_owned(self):
        confirmed(self.j,{m.PR:'1',m.LIMIT:'0'});c=Fake(self.tmp.name,self.j);c.current_values[m.PR]='0'
        with patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertEqual([{m.LIMIT:'3'}],[x[1] for x in c.events if x[0]=='set']);self.assertEqual({m.PR:'0'},self.j.data['externalValuesPreserved']);self.assertTrue(self.j.data['pending'])
    def test_restore_pixel_failure_closes_owned_editor_before_terminal(self):
        confirmed(self.j,{m.PR:'1'});c=Fake(self.tmp.name,self.j);c.pixel_error=True
        with patch.object(m.time,'sleep'):c.restore()
        self.assertFalse(c.editor);self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored'])
        self.assertIn('Pixel unknown',self.j.data['restoredPixelError']);self.assertEqual('snapshot',c.events[-1][0])
    def test_slow_protection_external_edit_is_caught_by_last_full497(self):
        confirmed(self.j,{m.PR:'1'});c=Fake(self.tmp.name,self.j);c.external_slow=True
        with patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertFalse(self.j.data['configurationRestored']);self.assertEqual(['snapshot','snapshot'],[x[0] for x in c.events[-2:]])
    def test_durable_restore_inflight_survives_ack_loss(self):
        confirmed(self.j,{m.PR:'1'});op=self.j.begin({m.PR:'0'},self.j.expected(),'restore',recovery=True);op['transportInvoked']=True;self.j.save()
        reloaded=m.Journal(self.j.path);self.assertTrue(reloaded.owns(m.PR,'0'));self.assertEqual({},reloaded.settle_inflight(dict(reloaded.expected(),**{m.PR:'0'})))
    def test_fresh_deadline_after_journal_prevents_ui_tap(self):
        clock=iter([0,3,3]);called=[]
        with self.assertRaises(m.core.Unobserved):m.core.invoke_logged(Path(self.tmp.name)/'action.json','input tap 1 1',lambda:called.append(1),0,10,
            journal=self.j,values={m.PR:'1'},current=self.j.expected(),clock=lambda:next(clock))
        self.assertEqual([],called);self.assertEqual({},self.j.data['inflight']);self.assertFalse(self.j.owns(m.PR,'1'))


if __name__=='__main__':unittest.main(verbosity=2)
