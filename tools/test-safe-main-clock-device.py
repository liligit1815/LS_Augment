"""Offline execution of main-clock journal/recovery/time oracles. No device evidence."""
from pathlib import Path
import copy, datetime as dt, importlib.util, io, json, os, tempfile, unittest
from unittest.mock import patch

spec=importlib.util.spec_from_file_location('main_clock',Path(__file__).with_name('run-safe-main-clock-device.py'))
m=importlib.util.module_from_spec(spec)
if os.environ.get('MAIN_CLOCK_TEST_SOURCE'):
    exec(compile(Path(os.environ['MAIN_CLOCK_TEST_SOURCE']).read_text('utf-8'),spec.origin,'exec'),m.__dict__)
else:spec.loader.exec_module(m)

def baseline():
    result={k:'0' for k in m.KEYS}
    result.update({m.CUSTOM:'1',m.ROWS:'2',m.FIRST:'HH:MMIIE',m.SECOND:'MM.ddN月e',
        'ls_augment_systemui_master':'1','ls_augment_statusbar_position_size_only':'0',
        'ls_augment_rm_screenshot_hide_status_bar':'0','ls_augment_rm_clock_milliseconds_refresh':'0'})
    result.update({f'untouched{i}':'original' for i in range(497-len(result))});return result

def metadata(case='custom'):
    return {'serial':'offline','installedVersion':20460,'installedVersionName':'test20460','mainApkSha256':'a'*64,
        'testApkSha256':'b'*64,'nativeBaseline':{'time_12_24':'null'},'process':{'pid':9},'homeComponent':'home/.Main',
        'runtimeSchema':{'build':20460,'runtimeKeys':list(m.KEYS)},'locale':'zh-CN','case':case,
        'notificationsBefore':{'count':3,'identitySha256':'c'*64}}

def journal(path,case='custom'):
    return m.Journal(path,baseline(),metadata(case),{'owned-original':'hash'},{'name':'title'})

def at(iso):
    value=dt.datetime.fromisoformat(iso)
    return m.stamp(f'{round(value.timestamp()*1000)}|{iso}')

def observed(first,second=None):return {'first':first,'secondMarkers':[] if second is None else [second]}

class Fixture(m.Collector):
    def __init__(self,folder,j):
        self.folder,self.journal=folder,j;self.report={'cases':[],'status':'stages_collected_awaiting_restoration'}
        self.values=copy.deepcopy(j.data['baseline']);self.saved=[];self.set_failure=False;self.read_failure=False
        self.resource_values={'owned-original':'hash'};self.name_values={'name':'title'};self.native_values={'time_12_24':'null'}
        self.notification_values=metadata()['notificationsBefore'];self.post_change=None;self.post_resource=False;self.pixel_failure=False
        self.queued=[];self.defer=False;self.identity_changed=False;self.capture_labels=[];self.late_change=None
    def persist(self):m.atomic(self.folder/'report.json',self.report)
    def identity(self,label):
        if self.identity_changed:raise m.extra.Inconclusive('changed PID')
    def resources(self):return copy.deepcopy(self.resource_values)
    def names(self):return copy.deepcopy(self.name_values)
    def native(self):return copy.deepcopy(self.native_values)
    def notifications(self):
        if self.late_change:self.values[self.late_change[0]]=self.late_change[1]
        return copy.deepcopy(self.notification_values)
    def capture(self,label):
        self.capture_labels.append(label);(self.folder/label).mkdir(exist_ok=True)
        if self.post_change:self.values[self.post_change[0]]=self.post_change[1]
        if self.post_resource:self.resource_values['foreign-new']='new'
        if self.pixel_failure:raise m.extra.Inconclusive('actual surface unavailable')
    def instrument(self,op,label,values=None):
        if op=='snapshot':
            if self.read_failure:raise RuntimeError('snapshot unavailable')
            if self.queued:self.values.update(self.queued.pop(0))
            return {'status':'pass','moduleVersion':20460,'settings':copy.deepcopy(self.values)}
        if op!='set' or not self.journal.valid_values(values):raise ValueError('scope')
        # Inspect the durable file before the fake save, including interruption.
        disk=m.Journal(self.journal.path)
        for k,v in values.items():
            assert k in disk.data['restore']
            if label!='recovery-set':assert v in disk.data['inflight'][k]
        self.saved.append(dict(values))
        if self.defer and label=='recovery-set':self.queued=[{},dict(values)]
        else:self.values.update(values)
        if self.set_failure:raise RuntimeError('interrupted after commit')
        return {'status':'pass','moduleVersion':20460,'runtimeSynced':False}

class Tests(unittest.TestCase):
    def setUp(self):self.tmp=tempfile.TemporaryDirectory();self.folder=Path(self.tmp.name)
    def tearDown(self):self.tmp.cleanup()
    def fixture(self,case='custom'):return Fixture(self.folder,journal(self.folder/'restore.json',case))
    def restore(self,c):
        with patch.object(m.time,'sleep',lambda _:None):c.restore()
    def test_phase_whitelists(self):
        self.assertEqual([len(m.allowed_for(c)) for c in ('custom','defaults')],[4,7])
        for case in ('custom','defaults'):
            self.assertTrue(all(set(values)<=m.allowed_for(case) for _,values in m.phases(case)))
            self.assertNotIn('ls_augment_rm_clock_milliseconds_refresh',m.allowed_for(case))
        with self.assertRaises(ValueError):m.phases('milliseconds')
    def test_complete_first_journal(self):
        j=journal(self.folder/'restore.json');self.assertEqual(m.Journal(j.path).data,j.data);self.assertEqual(len(j.data['baseline']),497)
        self.assertEqual(j.data['history'],[]);self.assertTrue(j.data['pending'])
    def test_foreign_key_or_staged_value_refused(self):
        j=journal(self.folder/'restore.json')
        for values in ({m.H24:'1'},{m.FIRST:'external custom'},{m.ROWS:'3'},{m.CUSTOM:True}):self.assertFalse(j.valid_values(values))
    def test_journal_corruption_refused(self):
        j=journal(self.folder/'restore.json')
        for field in ('restore','expected','allowed','inflight'):
            d=copy.deepcopy(j.data);d[field]['foreign']='1';m.atomic(j.path,d)
            with self.assertRaises(ValueError):m.Journal(j.path)
        d=copy.deepcopy(j.data);d['restore'][m.FIRST]='overwrite';m.atomic(j.path,d)
        with self.assertRaises(ValueError):m.Journal(j.path)
    def test_wrong_schema_build_or_missing_key(self):
        for schema in ({'build':20459,'runtimeKeys':list(m.KEYS)},{'build':20460,'runtimeKeys':[m.CUSTOM]},{'build':20460,'runtimeKeys':list(m.KEYS)+[m.CUSTOM]}):
            with self.assertRaises(ValueError):m.validate_schema(schema,20460,baseline(),'custom')
    def test_preconditions_do_not_acquire_foreign_keys(self):
        m.prerequisite(baseline(),'custom')
        for key,value in ((m.PERIOD,'1'),('ls_augment_systemui_master','0'),('ls_augment_rm_screenshot_hide_status_bar','1'),('ls_augment_rm_clock_milliseconds_refresh','1')):
            b=baseline();b[key]=value
            with self.assertRaises(m.extra.Inconclusive):m.prerequisite(b,'custom')
    def test_hard_crash_after_commit_restores_from_disk(self):
        c=self.fixture();c.set_failure=True
        with self.assertRaises(RuntimeError):c.set('two',dict(m.phases('custom')[0][1]))
        c.journal=m.Journal(c.journal.path);c.set_failure=False;self.restore(c)
        self.assertEqual(c.values,baseline());self.assertFalse(c.journal.data['pending'])
    def test_historical_value_not_newest_is_not_owned(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.set('two',{m.FIRST:baseline()[m.FIRST]})
        c.values[m.FIRST]="'D'HH:mm";count=len(c.saved)
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertEqual(len(c.saved),count);self.assertEqual(c.values[m.FIRST],"'D'HH:mm");self.assertTrue(c.journal.data['pending'])
    def test_external_owned_value_preserved(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.values[m.FIRST]='new user format'
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertEqual(c.values[m.FIRST],'new user format');self.assertTrue(c.journal.data['pending'])
    def test_external_reset_to_original_is_not_claimed(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.values[m.FIRST]=baseline()[m.FIRST];count=len(c.saved)
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertEqual(len(c.saved),count);self.assertTrue(c.journal.data['pending'])
    def test_crash_during_restore_commit_remains_recoverable(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.set_failure=True
        with self.assertRaises(RuntimeError):self.restore(c)
        c.set_failure=False;c.journal=m.Journal(c.journal.path);self.restore(c)
        self.assertEqual(c.values,baseline());self.assertFalse(c.journal.data['pending'])
    def test_foreign_change_before_write_stops(self):
        c=self.fixture();c.values['untouched0']='user'
        with self.assertRaises(m.extra.Inconclusive):c.set('one',{m.FIRST:"'D'HH:mm"})
        self.assertEqual(c.saved,[])
    def test_protected_native_resources_and_notifications_stop_writes(self):
        for target in ('native_values','resource_values','name_values','notification_values'):
            c=self.fixture();getattr(c,target)['new']='user'
            with self.assertRaises(m.extra.Inconclusive):c.set('one',{m.FIRST:"'D'HH:mm"})
            self.assertEqual(c.saved,[])
    def test_live_pid_change_stops_write(self):
        c=self.fixture();c.identity_changed=True
        with self.assertRaises(m.extra.Inconclusive):c.set('one',{m.FIRST:"'D'HH:mm"})
        self.assertEqual(c.saved,[])
    def test_async_restore_two_stable_reads(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.defer=True;self.restore(c)
        self.assertEqual(len(c.journal.data['configurationDifferences']),3);self.assertFalse(c.journal.data['pending'])
    def test_restore_pixels_and_config_independent(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.pixel_failure=True
        with self.assertRaises(m.extra.Inconclusive):self.restore(c)
        self.assertTrue(c.report['configurationRestored']);self.assertFalse(c.journal.data['pending']);self.assertEqual(c.report['restoredPixelState'],'incomplete')
    def test_change_during_restored_observation_stays_pending(self):
        for key in (m.FIRST,'untouched0'):
            c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.post_change=(key,'outside')
            with self.assertRaises(RuntimeError):self.restore(c)
            self.assertEqual(c.values[key],'outside');self.assertTrue(c.journal.data['pending'])
    def test_new_resource_after_restored_observation_preserved(self):
        c=self.fixture();c.post_resource=True
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertIn('foreign-new',c.resource_values);self.assertTrue(c.journal.data['pending'])
    def test_change_during_final_protection_reads_stays_pending(self):
        c=self.fixture();c.set('one',{m.FIRST:"'D'HH:mm"});c.late_change=('untouched0','late user edit')
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertEqual(c.values['untouched0'],'late user edit');self.assertTrue(c.journal.data['pending'])
        self.assertTrue(c.journal.data['terminalConfigurationDifferences'])
    def test_retry_retains_prior_restoration_evidence(self):
        c=self.fixture();p=self.folder/'restored-main';p.mkdir();(p/'frame-00.png').write_bytes(b'old')
        self.restore(c);self.assertEqual(c.capture_labels,['restored-main-retry-1']);self.assertEqual((p/'frame-00.png').read_bytes(),b'old')
    def test_snapshot_failure_remains_pending(self):
        c=self.fixture();c.read_failure=True
        with self.assertRaises(RuntimeError):self.restore(c)
        self.assertTrue(c.journal.data['pending'])
    def test_stamp_exact_epoch_and_offset(self):
        s=at('2026-10-04T12:59:59.250+08:00');self.assertEqual(s['offsetSeconds'],28800)
        with self.assertRaises(m.extra.Inconclusive):m.stamp('0|2026-10-04T12:00:00+0800')
        raw=f"{s['epochMs']+1000}|{s['iso']}"
        with self.assertRaises(m.extra.Inconclusive):m.stamp(raw)
    def test_time_interval_cross_hour_and_day(self):
        a=at('2026-10-04T23:59:59.800+08:00');b=at('2026-10-05T00:00:00.900+08:00')
        c=m.time_candidates(a,b);self.assertEqual({x.date().isoformat() for x in c},{'2026-10-04','2026-10-05'})
        self.assertEqual(c[0].second,58)
    def test_bad_time_interval_refuses(self):
        a=at('2026-10-04T12:00:00.000+08:00')
        for b in (at('2026-10-04T11:59:59.000+08:00'),at('2026-10-04T12:00:16.000+08:00'),dict(a,offsetSeconds=0)):
            with self.assertRaises(m.extra.Inconclusive):m.time_candidates(a,b)
    def test_locale_gates(self):
        self.assertEqual(m.locale_identity('zh-CN','Locales for com.android.systemui for user 0 are []','config: zh-rCN-ldltr'),'zh-CN')
        self.assertEqual(m.locale_identity('fr-FR','Locales for com.android.systemui for user 0 are [en-US]','config: fr-rFR'),'en-US')
        for inputs in [('zh-TW','Locales for com.android.systemui []','zh-rTW'),('zh-CN','Permission Denial com.android.systemui','zh-rCN'),('zh-CN','Locales for com.android.systemui []','en-rUS')]:
            with self.assertRaises(m.extra.Inconclusive):m.locale_identity(*inputs)
    def test_saved_real_readonly_preflight_shape(self):
        path=m.ROOT/'out/main-clock-safe-plan-20460/root-preflight/phone-time-locale.json'
        raw=json.loads(path.read_text('utf-8'))
        self.assertTrue(all(v['exitCode']==0 for v in raw.values()))
        self.assertEqual(m.stamp(raw['time']['stdout'])['offsetSeconds'],28800)
        self.assertEqual(m.locale_identity(raw['systemLocales']['stdout'],raw['systemuiLocales']['stdout'],raw['config']['stdout']),'zh-CN')
    def test_month_not_minute_preserved_in_user_baseline(self):
        b=baseline();a=at('2026-10-04T12:01:21.000+08:00');z=at('2026-10-04T12:01:22.000+08:00')
        r=m.classify('user-baseline',observed('12:10甲午周日'),b,'zh-CN',a,z)
        self.assertEqual(r['kind'],'native_or_user_pattern_manual_pixel_review')
    def test_custom_off_marker_before_tick_is_not_called_failure_or_pass(self):
        a=at('2026-10-04T12:01:21.000+08:00')
        value=m.classify('custom-off',observed('D12:01'),baseline(),'zh-CN',a,a)
        self.assertEqual(value['kind'],'native_refresh_not_established');self.assertFalse(value['functionalPass'])
    def test_custom_rows_retains_second_value(self):
        s=dict(baseline(),**m.phases('custom')[0][1]);a=at('2026-10-04T12:01:21.000+08:00');z=at('2026-10-04T12:01:22.000+08:00')
        m.classify('two-marked-lines',observed('D12:01','L2 10.04'),s,'zh-CN',a,z)
        s[m.ROWS]='1';m.classify('single-keeps-second',observed('D12:01'),s,'zh-CN',a,z)
        self.assertEqual(s[m.SECOND],"'L2' MM.dd")
        with self.assertRaises(m.extra.Inconclusive):m.classify('single-keeps-second',observed('D12:01','L2 10.04'),s,'zh-CN',a,z)
    def test_stale_date_time_not_accepted(self):
        s=dict(baseline(),**m.phases('custom')[0][1]);a=at('2026-10-04T12:01:21.000+08:00')
        with self.assertRaises(m.extra.Inconclusive):m.classify('two-marked-lines',observed('D12:00','L2 09.08'),s,'zh-CN',a,a)
    def test_legacy_duplicate_is_observed_not_pass(self):
        s=dict(baseline(),**m.phases('defaults')[0][1]);s.update({m.H24:'0',m.PERIOD:'1'})
        a=at('2026-10-04T12:05:09.000+08:00')
        old=m.classify('default-12h-period',observed('12:05 下午 中午'),s,'zh-CN',a,a)
        self.assertEqual(old['kind'],'known_legacy_duplicate_observed');self.assertFalse(old['functionalPass'])
        new=m.classify('default-12h-period',observed('12:05 中午'),s,'zh-CN',a,a)
        self.assertEqual(new['kind'],'single_default_period_observed');self.assertFalse(new['visualPass'])
        with self.assertRaises(m.extra.Inconclusive):m.classify('default-12h-period',observed('12:05'),s,'zh-CN',a,a)
    def test_default_week_phone_day_not_historic_tuesday(self):
        s=dict(baseline(),**m.phases('defaults')[0][1]);s[m.WEEK]='1';a=at('2026-10-04T12:05:09.000+08:00')
        m.classify('only-week',observed('12:05 周日'),s,'zh-CN',a,a)
        with self.assertRaises(m.extra.Inconclusive):m.classify('only-week',observed('12:05 周二'),s,'zh-CN',a,a)
    def test_actual_anonymous_clock_in_statusbar(self):
        node={'id':'null','class':'android.widget.TextView','package':'com.android.systemui','visible':True,'text':'D12:01','bounds':'[10,10][80,40]'}
        root={'id':'com.android.systemui:id/status_bar','visible':True,'bounds':'[0,0][1216,107]','children':[node]}
        self.assertEqual(m.clock_texts([{'root':root}])['first'],'D12:01')
        root['children'].append(dict(node,text='13:05'))
        with self.assertRaises(m.extra.Inconclusive):m.clock_texts([{'root':root}])
    def test_saved_real_anonymous_baseline_tree(self):
        path=m.ROOT/'out/full-function-audit-20261004/main-font-existing-gif-20460-20261004-120121/user-baseline/result-private.json'
        raw=json.loads(path.read_text('utf-8'));value=m.clock_texts(raw['uiWindows'])
        self.assertEqual(value['first'],'12:10甲午周日');self.assertEqual(value['barBounds'],[0,0,1216,107])
        self.assertTrue(any(e['id']=='null' and e['text']=='10.04八月廿四' for e in value['entries']))
    def test_foreign_foreground_no_home_action(self):
        c=self.fixture();c.ar=type('Ar',(),{'shell':lambda *a:(_ for _ in ()).throw(AssertionError('No input expected'))})()
        window={'type':1,'active':True,'focused':True,'root':{'package':'foreign.app','children':[]}}
        c.observe_all=lambda label:([window],'mCurrentFocus=Window{aaa u0 foreign.app/.Main}',(1216,2688))
        with self.assertRaises(m.extra.Inconclusive):m.Collector.launcher(c,'test')
    def test_oracle_failure_keeps_actual_capture_bytes(self):
        from PIL import Image
        c=self.fixture();c.set('two',dict(m.phases('custom')[0][1]))
        image=Image.new('RGB',(1216,2688),'white');buf=io.BytesIO();image.save(buf,format='PNG');raw=buf.getvalue()
        c.ar=type('Ar',(),{'adb':lambda *args:raw})()
        node={'id':'null','class':'android.widget.TextView','package':'com.android.systemui','visible':True,'text':'D11:50','bounds':'[10,10][80,40]'}
        root={'id':'com.android.systemui:id/status_bar','visible':True,'bounds':'[0,0][1216,107]','children':[node]}
        c.ui=type('Ui',(),{'all_windows':lambda *args:[{'root':root}]})()
        c.phone_stamp=lambda:at('2026-10-04T12:01:21.000+08:00');c.launcher=lambda label:(1216,2688)
        with self.assertRaises(m.extra.Inconclusive):m.Collector.capture(c,'two-marked-lines')
        self.assertEqual((self.folder/'two-marked-lines/frame-00.png').read_bytes(),raw)
        row=json.loads((self.folder/'two-marked-lines/observation.json').read_text('utf-8'))
        self.assertEqual(row['status'],'incomplete');self.assertEqual(row['samples'][0]['text']['first'],'D11:50')

if __name__=='__main__':unittest.main()
