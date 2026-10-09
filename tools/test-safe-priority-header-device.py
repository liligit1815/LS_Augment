"""Focused new native-header checks only; no device, builds or old suites."""
from pathlib import Path
import copy,importlib.util,json,tempfile,time,unittest
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('priority_header_under_test',ROOT/'tools/run-safe-priority-header-device.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
BASELINE=ROOT/'out/full-function-audit-20261004/statusbar-notification-icons-20463-20261004-171345/baseline/result-private.json'
TREE=ROOT/'out/full-function-audit-20261004/header-layout-20455-control-20261004-072528/seconds-on-0/result-private.json'


def journal(folder):
    saved=json.loads(BASELINE.read_text('utf-8'))['settings'];saved=dict(saved,**{m.PR:'0',m.LIMIT:'3',m.ORDER:''})
    meta=dict(case='priority-native-header',surface='control',serial='offline',installedVersion=20463,installedVersionName='test20463',mainApkSha256='a'*64,testApkSha256='b'*64,
        observerApkSha256='c'*64,process={'pid':20209},nativeBaseline={'system/font_scale':'1.0'},notificationsBefore=[],
        homeComponent='com.zte.mifavor.launcher/com.android.launcher3.uioverrides.QuickstepLauncher',runId='d'*32,
        rawBaseline={k:['string',None,v] for k,v in saved.items()},runtimeSchema={'build':20463,'runtimeKeys':list(saved)})
    return m.Journal.create(Path(folder)/'restore.json',saved,meta,{}, {},{})


def inventory():
    return dict(session='real-session-placeholder',surfaceObservedAt={'control':101},observedSurfaces=['control'],runtime=dict(activeSurface='control',enabled=True,interactive=True),
        surfaces={'control':[dict(id=i,instance=i+':1',surface='control',state='visible',states=['default'],application='native',coveredBy='') for i in ('volume','bluetooth','nfc')]})


def confirmed(j,values):
    current=j.expected();op=j.begin(values,current,'sent');op['transportInvoked']=True;j.save();j.acknowledge(values,dict(current,**values))


class Fake(m.Collector):
    def __init__(self,folder,j):
        self.folder=Path(folder);self.journal=j;self.report={'cases':[]};self.current_values=j.expected();self.events=[]
        self.deadline=time.monotonic()+100;self.recovering=False;self.pixel_error=False;self.external_slow=False;self.ar=self
    def identity(self,label):self.events.append(('identity',label))
    def protect(self,label,*args):
        self.events.append(('protect',label))
        if self.external_slow:self.current_values['ls_augment_statusbar_system_two_rows']='external'
    def notifications(self,label):self.events.append(('notifications',label))
    def config(self,label):self.events.append(('snapshot',label));return dict(self.current_values)
    def home(self,label):self.events.append(('home',label))
    def capture(self,label):
        self.events.append(('pixels',label))
        if self.pixel_error:raise m.core.Unobserved('Unknown visible surface; no input')
    def instrument(self,operation,label,values=None,**kw):
        op=self.journal.begin(values,kw['current'],label,recovery=kw.get('recovery',False));op['transportInvoked']=True;self.journal.save()
        self.events.append(('set',dict(values)));self.current_values.update(values)
    def persist(self):m.atomic(self.folder/'report.json',self.report)


class PriorityHeader(unittest.TestCase):
    def setUp(self):self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.j=journal(self.tmp.name)
    def test_control_journal_only_three_keys_no_native_no_other_surface(self):
        self.j.values({m.PR:'1',m.LIMIT:'2',m.ORDER:'volume,bluetooth,nfc'})
        for values in ({m.ui.GRID:''},{m.LIMIT:'21'},{m.ORDER:'privacy.dot'},{m.ORDER:'nfc,nfc'}):
            with self.assertRaises(ValueError):self.j.values(values)
        with self.assertRaises(ValueError):self.j.native_value('system/font_scale','1.3')
        changed=copy.deepcopy(self.j.data);changed['metadata']['surface']='notification'
        with self.assertRaises(ValueError):m.Journal(Path(self.tmp.name)/'wrong.json',changed)
    def test_position_only_inactive_rejected_without_normalizing_grid(self):
        b=self.j.data['baseline'];m.prerequisites(dict(b,**{m.ui.GRID:''}))
        for key,value in [('ls_augment_statusbar_position_size_only','1'),('ls_augment_systemui_master','0')]:
            with self.assertRaises(m.core.Unobserved):m.prerequisites(dict(b,**{key:value}))
    def test_actual_saved_control_tree_and_wrong_parent_or_surface(self):
        windows=json.loads(TREE.read_text('utf-8'))['uiWindows'];got=m.header(windows,(1216,2688));self.assertEqual('[114,146][1032,188]',got['statusIcons'])
        wrong=copy.deepcopy(windows)
        for w in wrong:
            for n,_ in m.core.walk(w.get('root',{})):
                if n.get('id')=='com.android.systemui:id/control_panel':n['id']='com.android.systemui:id/notification_panel'
        with self.assertRaises(m.core.Unobserved):m.header(wrong,(1216,2688))
        with self.assertRaises(m.core.Unobserved):m.header(windows,(2688,1216))
        wrong=copy.deepcopy(windows)
        for w in wrong:
            for n,_ in m.core.walk(w.get('root',{})):
                if n.get('id')=='com.android.systemui:id/statusIcons':n['bounds']='[0,600][1216,650]'
        with self.assertRaises(m.core.Unobserved):m.header(wrong,(1216,2688))
    def test_inventory_rejects_old_wrong_surface_noninteractive_and_no_session(self):
        inv=inventory();self.assertEqual(3,len(m.fresh_inventory(inv,100)))
        bads=[]
        old=copy.deepcopy(inv);old['surfaceObservedAt']['control']=99;bads.append(old)
        other=copy.deepcopy(inv);other['runtime']['activeSurface']='main';bads.append(other)
        other=copy.deepcopy(inv);other['surfaces']['control'][0]['surface']='main';bads.append(other)
        sleep=copy.deepcopy(inv);sleep['runtime']['interactive']=False;bads.append(sleep)
        missing=copy.deepcopy(inv);missing.pop('session');bads.append(missing)
        for bad in bads:
            with self.assertRaises(m.core.Unobserved):m.fresh_inventory(bad,100)
    def test_candidates_require_two_current_visible_sources_and_control_eligible(self):
        entries=inventory()['surfaces']['control'];diag='surface=control;limit=0;eligible=3;retained=volume,bluetooth,nfc;excluded='
        self.assertEqual(['volume','bluetooth','nfc'],m.candidates(entries,entries,diag))
        for raw in (diag.replace('surface=control','surface=main'),diag.replace('eligible=3','eligible=2'),diag.replace('limit=0','limit=1')):
            with self.assertRaises(m.core.Unobserved):m.candidates(entries,entries,raw)
        for field,value in [('coveredBy','system_icons'),('state','hidden'),('states',['vibration']),('application','ready')]:
            changed=copy.deepcopy(entries);changed[0][field]=value
            with self.assertRaises(m.core.Unobserved):m.candidates(entries,changed,diag)
        self.assertFalse(m.priority_diag(diag)['perKeyFreshnessProven'])
        restored=copy.deepcopy(entries)
        for row in restored:row['application']='native_unmapped'
        self.assertEqual(['volume','bluetooth','nfc'],m.candidates(restored,restored,diag))
    def test_matrix_rotates_three_first_choices_and_limit_zero_stays_enabled(self):
        phases=m.matrix(['volume','bluetooth','nfc'],'nfc,volume')
        self.assertEqual(6,len(phases));self.assertEqual(['volume','bluetooth','nfc'],[v[m.ORDER].split(',')[0] for _,v in phases[:3]])
        self.assertTrue(all(v[m.LIMIT]=='1' for _,v in phases[:3]));self.assertEqual('2',phases[3][1][m.LIMIT])
        self.assertEqual({m.PR:'1',m.LIMIT:'0',m.ORDER:'nfc,volume'},phases[4][1]);self.assertEqual('0',phases[5][1][m.PR])
        self.assertTrue(all(set(v)<=m.KEYS for _,v in phases))
    def test_actual_native_method_and_forbidden_input_never_enters_transport(self):
        c=m.Collector.__new__(m.Collector);c.ar=type('ReadOnly',(),{'shell':lambda self,cmd,**kw:'read:'+cmd})()
        self.assertEqual('read:wm density',c.native()['density']);c=Fake(self.tmp.name,self.j)
        with patch.object(m.core,'invoke_logged',side_effect=AssertionError('transport')):
            for command in ('input tap 1 1','cmd statusbar expand-notifications',m.ui.OPEN,'settings put system font_scale 1.3'):
                with self.assertRaises(ValueError):c.action('blocked',command,{'started':time.monotonic()})
    def test_restore_keeps_external_original_value_but_restores_still_owned_limit(self):
        confirmed(self.j,{m.PR:'1',m.LIMIT:'0'});c=Fake(self.tmp.name,self.j);c.current_values[m.PR]='0'
        with patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertEqual([{m.LIMIT:'3'}],[v for k,v in c.events if k=='set']);self.assertTrue(self.j.data['pending']);self.assertEqual({m.PR:'0'},self.j.data['externalValuesPreserved'])
    def test_restore_unknown_pixel_is_not_config_failure_terminal_checks_follow_slow_protection(self):
        confirmed(self.j,{m.PR:'1'});c=Fake(self.tmp.name,self.j);c.pixel_error=True
        with patch.object(m.time,'sleep'):c.restore()
        self.assertFalse(self.j.data['pending']);self.assertTrue(self.j.data['configurationRestored']);self.assertIn('Unknown',self.j.data['restoredPixelError'])
        self.assertEqual(['snapshot','snapshot'],[k for k,_ in c.events[-2:]])
    def test_final_external_race_is_not_hidden_by_earlier_restore_success(self):
        confirmed(self.j,{m.PR:'1'});c=Fake(self.tmp.name,self.j);c.external_slow=True
        with patch.object(m.time,'sleep'):
            with self.assertRaises(m.core.Unobserved):c.restore()
        self.assertFalse(self.j.data['configurationRestored']);self.assertTrue(self.j.data['pending'])
    def test_durable_restore_transport_ack_loss_and_after_log_freshness(self):
        confirmed(self.j,{m.PR:'1'});op=self.j.begin({m.PR:'0'},self.j.expected(),'restore',recovery=True);op['transportInvoked']=True;self.j.save()
        j=m.Journal(self.j.path);self.assertTrue(j.owns(m.PR,'0'));self.assertEqual({},j.settle_inflight(dict(j.expected(),**{m.PR:'0'})))
        c=Fake(self.tmp.name,j);called=[]
        with patch.object(m.time,'monotonic',return_value=100),patch.object(m.core,'invoke_logged',wraps=m.core.invoke_logged):
            with self.assertRaises(m.core.Unobserved):c.action('expired','cmd statusbar expand-settings',{'started':0})
        self.assertNotIn(('set',{m.PR:'0'}),c.events)


if __name__=='__main__':unittest.main(verbosity=2)
