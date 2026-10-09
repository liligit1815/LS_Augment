"""Offline tests of the new collector's actual journal, capture and recovery.
Synthetic screenshots exercise recognition, never count as device evidence.
"""
from pathlib import Path
import copy
import importlib.util
import io
import json
import os
import tempfile
import unittest
from unittest.mock import patch
import numpy as np
from PIL import Image

spec=importlib.util.spec_from_file_location('font_gif',Path(__file__).with_name('run-main-font-existing-gif-device.py'))
m=importlib.util.module_from_spec(spec)
if os.environ.get('FONT_GIF_TEST_SOURCE'):
    exec(compile(Path(os.environ['FONT_GIF_TEST_SOURCE']).read_text('utf-8'),spec.origin,'exec'),m.__dict__)
else:spec.loader.exec_module(m)
TEMPLATE=m.dark_mask(Image.open(m.REFERENCE).crop(m.REFERENCE_BOX))

def baseline(): return dict({f'key{i}':'0' for i in range(495)},**{m.ART:'',m.FONT:''})
def resources(): return {m.base.DIRS[0]+m.GIF+'.asset':m.GIF,m.base.DIRS[0]+m.GIF+'.json':'a'*64,m.base.DIRS[1]+m.NOTO+'.font':m.NOTO}
def inputs(b): return {'gifHash':m.GIF,'fontHash':m.NOTO,'targets':m.targets(b),'runtimeSchema':{'build':20460,'runtimeKeys':[m.ART,m.FONT]}}
def metadata(): return {'serial':'offline','installedVersion':20460,'installedVersionName':'test20460','testApkSha256':'b'*64,
    'nativeBaseline':{'rotation':'0','font':'1.0'},'process':{'pid':123,'bootId':'test'},'homeComponent':'home/.Main'}
def journal(path,b=None):
    b=baseline() if b is None else b
    return m.Journal(path,b,metadata(),resources(),{},inputs(b))

def frame(color=None,x=60,y=15,second=False,foreign_color=False):
    a=np.full((800,240,3),220,np.uint8);h,w=TEMPLATE.shape
    a[y:y+h,x:x+w][TEMPLATE]=70
    if second:a[15:15+h,140:140+w][TEMPLATE]=70
    if color is not None:
        left=5 if foreign_color else x;top=65 if foreign_color else y
        block=a[top:top+h,left:left+w].copy()
        blend=np.rint(block.astype(float)*.65+np.array(color)*.35).astype(np.uint8)
        if not foreign_color:blend[TEMPLATE]=block[TEMPLATE]
        a[top:top+h,left:left+w]=blend
    return Image.fromarray(a)

class Fixture(m.Collector):
    def __init__(self,folder,j):
        self.folder=folder;self.journal=j;self.report={'cases':[],'status':'prepared','visualPass':False}
        self.values=copy.deepcopy(j.data['baseline']);self.saved=[];self.set_failure=False;self.snapshot_fail=False
        self.actual_resources=resources();self.actual_names={};self.native_values=metadata()['nativeBaseline'];self.post_change=None
        self.capture_failure=None;self.queued=[];self.count=0;self.systemui_changed=False
        self.post_resource_change=False;self.blank_frame=False;self.defer_restore=False
        self.ar=self
        self.ui=type('Ui',(),{'nodes':staticmethod(lambda windows:iter(windows))})()
    def persist(self): m.atomic(self.folder/'report.json',self.report)
    def identity(self,label):
        if self.systemui_changed:raise m.extra.Inconclusive('simulated changed process')
    def resources(self):return copy.deepcopy(self.actual_resources)
    def names(self):return copy.deepcopy(self.actual_names)
    def native(self):return copy.deepcopy(self.native_values)
    def template(self):return TEMPLATE
    def shell(self,*args,**kwargs):
        if args[0]=='date +%s%3N':return '1000'
        raise AssertionError('Unexpected device command: '+str(args))
    def launcher(self,label):pass
    def inventory(self,label,after):
        asset=bool(self.values[m.ART]);return {'runtime':{'powerSave':False},'surfaces':{'main':[{'id':'volume','state':'visible','coveredBy':'','capability':'whole_layers','application':'applied' if asset else 'native','matchedAsset':m.GIF if asset else ''}]}}
    def observe_all(self,label):
        (self.folder/label).mkdir(exist_ok=True)
        if self.capture_failure==label:raise m.extra.Inconclusive('simulated observation unavailable')
        if label=='restored-main' and self.post_change:self.values[self.post_change[0]]=self.post_change[1]
        if label=='restored-main' and self.post_resource_change:self.actual_resources['new-file']='external'
        return [{'id':'com.android.systemui:id/status_bar','visible':True,'bounds':'[0,0][240,100]'}],'',(240,800)
    def adb(self,*args):
        assert args==('exec-out','screencap','-p')
        color=(255,0,0) if self.count%2 else (0,255,0);self.count+=1
        im=Image.new('RGB',(240,800),'white') if self.blank_frame else frame(color if self.values[m.ART] else None)
        b=io.BytesIO();im.save(b,format='PNG');return b.getvalue()
    def instrument(self,op,label,values=None):
        if op=='snapshot':
            if self.snapshot_fail:raise RuntimeError('snapshot unavailable')
            if self.queued:self.values.update(self.queued.pop(0))
            return {'settings':copy.deepcopy(self.values),'status':'pass','moduleVersion':20460}
        if op!='set':raise AssertionError(op)
        if not self.journal.valid_values(values):raise ValueError('foreign values')
        # Actual source before() must have written a recoverable journal first.
        loaded=m.Journal(self.journal.path)
        for k,v in values.items():
            assert k in loaded.data['restore']
        self.saved.append(dict(values))
        if self.defer_restore and label=='recovery-set':self.queued=[{},dict(values)]
        else:self.values.update(values)
        if self.set_failure:raise RuntimeError('host interrupted after commit')
        return {'status':'pass','moduleVersion':20460,'runtimeSynced':False}

class Tests(unittest.TestCase):
    def setUp(self):self.temp=tempfile.TemporaryDirectory();self.path=Path(self.temp.name)
    def tearDown(self):self.temp.cleanup()
    def fixture(self):return Fixture(self.path,journal(self.path/'restore.json'))
    def test_exact_targets_and_preserve_foreign_layers(self):
        b=baseline();b[m.ART]='2;bluetooth,default,foreground,'+'f'*64+',0,100,0,0,100,0,main';b[m.FONT]='2;lock:clock=original;main:battery=original'
        t=m.targets(b);self.assertIn('bluetooth,default,foreground',t[m.ART]);self.assertIn('main:battery=original',t[m.FONT]);self.assertIn('lock:clock=original',t[m.FONT])
        self.assertIn(',1,100,0,0,35,0,main',t[m.ART]);self.assertEqual(set(t),m.KEYS)
    def test_volume_layer_conflict_refuses_without_replacing(self):
        for surface in ('main','all'):
            for layer in ('whole','background','foreground'):
                b=baseline();b[m.ART]=f'2;volume,default,{layer},'+('f'*64)+f',0,100,0,0,100,0,{surface}'
                with self.assertRaises(m.extra.Inconclusive):m.targets(b)
    def test_other_surface_volume_preserved(self):
        b=baseline();b[m.ART]='2;volume,default,foreground,'+'f'*64+',0,100,0,0,100,0,control';self.assertIn(',control',m.targets(b)[m.ART])
    def test_same_font_and_bad_schema_refused(self):
        for role in ('main:clock','main:global','all:clock','all:global','clock','global'):
            b=baseline();b[m.FONT]='2;'+role+'=font:'+m.NOTO
            with self.assertRaises(m.extra.Inconclusive):m.targets(b)
        for s in ({'build':20459,'runtimeKeys':[m.ART,m.FONT]},{'build':20460,'runtimeKeys':[m.ART]},{'build':20460,'runtimeKeys':[m.ART,m.FONT,m.FONT]}):
            with self.assertRaises(ValueError):m.validate_schema(s,20460,baseline())
    def test_missing_changed_bytes_refuse(self):
        for path in (m.base.DIRS[0]+m.GIF+'.asset',m.base.DIRS[1]+m.NOTO+'.font'):
            r=resources();r.pop(path)
            with self.assertRaises(m.extra.Inconclusive):m.require_resources(r)
            r[path]='x'*64
            with self.assertRaises(m.extra.Inconclusive):m.require_resources(r)
    def test_first_durable_record_is_complete(self):
        j=journal(self.path/'restore.json');loaded=m.Journal(j.path)
        self.assertEqual(loaded.data,j.data);self.assertEqual(len(j.data['baseline']),497);self.assertEqual(set(j.data['inputs']['targets']),m.KEYS)
        self.assertTrue(j.data['pending']);self.assertEqual(j.data['history'],[])
    def test_wrong_or_corrupt_recovery_scope_refused(self):
        j=journal(self.path/'restore.json')
        for field in ('restore','expected','inflight','allowed'):
            d=copy.deepcopy(j.data);d[field]['foreign']='1';m.atomic(j.path,d)
            with self.assertRaises(ValueError):m.Journal(j.path)
        d=copy.deepcopy(j.data);d['restore'][m.ART]='foreign';m.atomic(j.path,d)
        with self.assertRaises(ValueError):m.Journal(j.path)
    def test_art_commit_interrupt_restore_from_disk(self):
        c=self.fixture();c.set_failure=True
        with self.assertRaises(RuntimeError):c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]})
        c.journal=m.Journal(c.journal.path);c.set_failure=False
        with patch.object(m.time,'sleep',lambda _:None):c.restore()
        self.assertEqual(c.values,baseline());self.assertFalse(c.journal.data['pending']);self.assertEqual(c.report['restoredPixelState'],'captured_manual_review_required')
    def test_second_key_inflight_is_restorable(self):
        c=self.fixture();t=c.journal.data['inputs']['targets'];c.set('gif-on',{m.ART:t[m.ART]});c.set_failure=True
        with self.assertRaises(RuntimeError):c.set('font-on',{m.FONT:t[m.FONT]})
        self.assertEqual(set(c.journal.data['restore']),m.KEYS);c.set_failure=False;c.journal=m.Journal(c.journal.path)
        with patch.object(m.time,'sleep',lambda _:None):c.restore()
        self.assertEqual(c.values,baseline())
    def test_external_owned_value_preserved_and_pending(self):
        c=self.fixture();c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]});c.values[m.ART]='new-user-value';n=len(c.saved)
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(c.values[m.ART],'new-user-value');self.assertEqual(len(c.saved),n);self.assertTrue(c.journal.data['pending'])
    def test_unrelated_config_change_before_write_refuses(self):
        c=self.fixture();c.values['key17']='external'
        with self.assertRaises(m.extra.Inconclusive):c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]})
        self.assertEqual(c.saved,[])
    def test_post_capture_external_change_keeps_pending(self):
        c=self.fixture();c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]});c.post_change=('key17','external')
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(c.values['key17'],'external');self.assertTrue(c.journal.data['pending']);self.assertFalse(c.journal.data['configurationRestored'])
    def test_post_capture_owned_change_keeps_pending(self):
        c=self.fixture();c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]});c.post_change=(m.ART,'external')
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(c.values[m.ART],'external');self.assertTrue(c.journal.data['pending'])
    def test_post_capture_new_resource_preserved_pending(self):
        c=self.fixture();c.post_resource_change=True
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(c.actual_resources['new-file'],'external');self.assertTrue(c.journal.data['pending'])
    def test_delayed_async_restore_waits_for_two_equal_reads(self):
        c=self.fixture();c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]});c.defer_restore=True
        with patch.object(m.time,'sleep',lambda _:None):c.restore()
        self.assertEqual(len(c.journal.data['configurationDifferences']),3)
        self.assertTrue(c.journal.data['configurationDifferences'][0]);self.assertEqual(c.values,baseline());self.assertFalse(c.journal.data['pending'])
    def test_recovery_retry_keeps_existing_pixels(self):
        c=self.fixture();prior=self.path/'restored-main';prior.mkdir();(prior/'frame-00.png').write_bytes(b'previous-partial-evidence')
        with patch.object(m.time,'sleep',lambda _:None):c.restore()
        self.assertEqual((prior/'frame-00.png').read_bytes(),b'previous-partial-evidence')
        self.assertEqual(c.journal.data['restoredObservation'],'restored-main-retry-1');self.assertFalse(c.journal.data['pending'])
    def test_historical_value_is_not_current_ownership(self):
        c=self.fixture();t=c.journal.data['inputs']['targets']
        c.set('font-on',{m.FONT:t[m.FONT]});c.set('font-off',{m.FONT:''});c.values[m.FONT]=t[m.FONT]
        n=len(c.saved)
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
        self.assertEqual(len(c.saved),n);self.assertTrue(c.journal.data['pending']);self.assertEqual(c.values[m.FONT],t[m.FONT])
    def test_write_ahead_save_failure_never_mutates(self):
        c=self.fixture()
        with patch.object(c.journal,'save',side_effect=OSError('disk full')),self.assertRaises(OSError):c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]})
        self.assertEqual(c.saved,[]);self.assertEqual(c.values,baseline());self.assertEqual(m.Journal(c.journal.path).data['restore'],{})
    def test_visible_inventory_without_native_pixels_stops_before_set(self):
        c=self.fixture();c.blank_frame=True
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(m.extra.Inconclusive):c.exercise()
        self.assertEqual(c.saved,[]);self.assertEqual(c.values,baseline())
    def test_actual_instrumentation_gate_rejects_other_operations_and_keys(self):
        c=self.fixture()
        for op,values in (('import',None),('set',{'key9':'1'}),('set',{m.ART:'unreviewed'})):
            with self.assertRaises(ValueError):m.Collector.instrument(c,op,'invalid',values)
    def test_process_identity_requires_exact_live_pid_boot_version(self):
        row={'pid':123,'process':'com.android.systemui','moduleVersion':'test20460','moduleLoaded':True,'receivedBoot':524,'processStartedElapsed':100}
        class Ar:
            def __init__(self,entry,pids=('123','123')):self.entry=entry;self.pids=iter(pids);self.calls=0
            def shell(self,cmd,**kwargs):
                if cmd=='pidof com.android.systemui':return next(self.pids)
                if cmd=='settings get global boot_count':return '524'
                if cmd=='cat /proc/sys/kernel/random/boot_id':return '12345678-1234-1234-1234-123456789012'
                if cmd.startswith('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml'):
                    self.calls+=1
                    if self.calls==1:return ''
                    return '<map><string>'+json.dumps(self.entry)+'</string></map>'
                raise AssertionError(cmd)
        with patch.object(m.time,'sleep',lambda _:None):
            self.assertEqual(m.process_identity(Ar(row),'test20460')['pid'],123)
            for change in ({'moduleVersion':'test20459'},{'receivedBoot':523},{'processStartedElapsed':0},{'moduleLoaded':False}):
                with self.assertRaises(m.extra.Inconclusive):m.process_identity(Ar(dict(row,**change)),'test20460')
            with self.assertRaises(m.extra.Inconclusive):m.process_identity(Ar(row,('123','124')),'test20460')
    def test_pixel_failure_does_not_lie_about_config_recovery(self):
        c=self.fixture();c.set('gif-on',{m.ART:c.journal.data['inputs']['targets'][m.ART]});c.capture_failure='restored-main'
        with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(m.extra.Inconclusive):c.restore()
        self.assertTrue(c.journal.data['configurationRestored']);self.assertFalse(c.journal.data['pending']);self.assertEqual(c.report['restoredPixelState'],'not_fully_observed')
    def test_native_and_new_resource_changes_never_overwritten(self):
        for kind in ('native','new-resource','names'):
            with self.subTest(kind=kind):
                sub=self.path/kind;sub.mkdir();c=Fixture(sub,journal(sub/'restore.json'))
                if kind=='native':c.native_values['rotation']='1'
                elif kind=='names':c.actual_names['new']='external'
                else:c.actual_resources['new-file']='external'
                with patch.object(m.time,'sleep',lambda _:None),self.assertRaises(RuntimeError):c.restore()
                self.assertTrue(c.journal.data['pending'])
    def test_restore_exception_is_pending(self):
        c=self.fixture();c.snapshot_fail=True
        with self.assertRaises(RuntimeError):c.restore()
        self.assertTrue(m.Journal(c.journal.path).data['pending'])
    def test_whole_bar_search_ignores_old_location(self):
        self.assertEqual(m.locate_volume(frame(x=131),(0,0,240,100),TEMPLATE)['bounds'],[131,15,175,55])
        with self.assertRaises(m.extra.Inconclusive):m.locate_volume(frame(second=True),(0,0,240,100),TEMPLATE)
        with self.assertRaises(m.extra.Inconclusive):m.locate_volume(Image.new('RGB',(240,800),'white'),(0,0,240,100),TEMPLATE)
    def test_alpha35_exchange_and_native_ink(self):
        images=[frame((255,0,0)),frame((0,255,0))];loc=[m.locate_volume(x,(0,0,240,100),TEMPLATE) for x in images]
        result=m.color_exchange(images,(0,0,240,100),loc);self.assertTrue(result['established']);self.assertFalse(result['visualPass']);self.assertGreater(result['samePixels'],100)
        self.assertTrue(all(x['iou']==1 for x in loc));self.assertLess(np.array(images[0])[:,:,1].min(),255)
    def test_static_running_or_foreign_swaps_do_not_establish(self):
        for images in ([frame((255,0,0))]*8,[frame((255,0,0),foreign_color=True),frame((0,255,0),foreign_color=True)],
                       [frame((255,0,0)),frame((0,255,0),x=121)]):
            loc=[m.locate_volume(x,(0,0,240,100),TEMPLATE) for x in images]
            self.assertFalse(m.color_exchange(images,(0,0,240,100),loc)['established'])
    def test_real_collector_five_stage40_frame_fixture(self):
        c=self.fixture()
        with patch.object(m.time,'sleep',lambda _:None):c.exercise();c.restore()
        self.assertEqual([x['case'] for x in c.report['cases']],['user-baseline','gif-only','gif-and-font','gif-font-restored','restored-main'])
        self.assertEqual(sum(len(x['frameTimes']) for x in c.report['cases']),40)
        self.assertTrue(all(not x['visualPass'] for x in c.report['cases']));self.assertEqual(c.values,baseline());self.assertFalse(c.journal.data['pending'])
        self.assertTrue(all(set(x)<=m.KEYS for x in c.saved));self.assertEqual(c.report['status'],'collected_manual_review_required')

if __name__=='__main__':unittest.main(verbosity=2)
