"""Opt-in five-stage main clock/font + existing volume GIF observation.

No imports, file pushes, radio/notification actions, or resource writes. Only two
module keys are owned. Importing this file performs no device operations.
"""
from pathlib import Path
import argparse
import contextlib
import datetime
import hashlib
import importlib.util
import json
import re
import time
import traceback
import uuid
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('existing_gif_main', ROOT/'tools/main_statusbar_device_collector.py')
base = importlib.util.module_from_spec(spec); spec.loader.exec_module(base)
extra, ART, FONT = base.extra, base.ART, base.FONT
KEYS = {ART, FONT}
GIF = '3109ba965e34e35577662c85ea4239423e38f22d11af2fa6690af6174706fca0'
NOTO = 'bfb7bb691513f12e734dc346c03a03f784912432d7e3fa8e56efcf906fe86b3d'
REFERENCE = ROOT/'out/full-function-audit-20261004/summary-priority-20459-20261004-111741/priority-off/frame-00.png'
REFERENCE_BOX = (1020, 10, 1064, 50)  # Independently reviewed physical pixels, NOT a View rectangle.
REFERENCE_SHA = '5a22fba8d4c766112356e761f8925f8b261e25e9cfc6a74f4f1f05fe0e35f524'
SCHEMA_KEYS = 497

def digest(data): return hashlib.sha256(data).hexdigest()
def atomic(path, data): return extra.safe.atomic(Path(path), data)
def difference(a, b): return base.difference(a, b)

def targets(settings):
    if len(settings) != SCHEMA_KEYS or not all(isinstance(v, str) for v in settings.values()):
        raise ValueError('Expected full registered 497-string baseline')
    if not KEYS <= settings.keys(): raise ValueError('Missing owned keys')
    rows = base.wifi.theme_rows(settings[ART])
    if any(r[0] == 'volume' and r[10] in ('all', 'main') for r in rows):
        raise extra.Inconclusive('Existing volume layer binding: preserve it; no substitution')
    # Exact added tuple only; never discard another layer/id/surface.
    art = base.wifi.serialize_theme(rows + [['volume', 'default', 'background', GIF, '1', '100', '0', '0', '35', '0', 'main']])
    font = base.font_with(settings[FONT], NOTO)
    if any(x in settings[FONT].split(';') for x in (prefix+'=font:'+NOTO for prefix in ('main:clock','clock','global','main:global','all:clock','all:global'))):
        raise extra.Inconclusive('Existing clock already may resolve this font; no fake switch')
    return {ART: art, FONT: font}

def validate_schema(schema, version, settings):
    keys = schema.get('runtimeKeys', [])
    if (schema.get('build') != version or not keys or len(set(keys)) != len(keys)
            or not KEYS <= set(keys) or not set(keys) <= settings.keys()):
        raise ValueError('Exact compiled runtime schema does not match installed build/settings')

def require_resources(resources):
    for path, expected in ((base.DIRS[0]+GIF+'.asset', GIF), (base.DIRS[1]+NOTO+'.font', NOTO)):
        if resources.get(path) != expected: raise extra.Inconclusive('Existing resource absent or SHA mismatch: '+path)
    if base.DIRS[0]+GIF+'.json' not in resources: raise extra.Inconclusive('GIF metadata absent')

def source_inputs():
    """Local historical bytes only, no re-encoding or staged remote file."""
    import zipfile
    from PIL import Image
    import io
    if digest(REFERENCE.read_bytes()) != REFERENCE_SHA: raise ValueError('Independently reviewed native reference changed')
    pack = ROOT/'out/wifi-asset-spacing-20454/device-inputs/activity-only.zip'
    data = pack.read_bytes()
    if digest(data) != '40344200aff9aaa831167244c6fdef64c95d5a670949e5beaa1601d98ab26bf8':
        raise ValueError('Reviewed GIF ZIP changed')
    with zipfile.ZipFile(io.BytesIO(data)) as z:
        manifest = json.loads(z.read('manifest.json')); raw = z.read(manifest['images'][GIF])
    im = Image.open(io.BytesIO(raw))
    if digest(raw) != GIF or im.format != 'GIF' or im.n_frames != 2: raise ValueError('GIF bytes not reviewed two-frame asset')
    _, fonts = base.checked_pack('noto-sans-1.0.0.zip')
    if digest(fonts[NOTO]) != NOTO: raise ValueError('Font bytes changed')
    return {'gifHash': GIF, 'gifBytes': len(raw), 'fontHash': NOTO, 'fontBytes': len(fonts[NOTO]),
            'referenceImage': str(REFERENCE), 'referenceSha256': digest(REFERENCE.read_bytes()),
            'referenceBox': list(REFERENCE_BOX), 'resourceWritePolicy': 'none'}

def process_identity(ar, version_name):
    pid = ar.shell('pidof com.android.systemui').strip()
    if not re.fullmatch('[1-9][0-9]*', pid): raise extra.Inconclusive('No unique SystemUI process')
    for attempt in range(4):
        try:
            rows = [json.loads(n.text) for n in ET.fromstring(ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)) if n.tag == 'string' and n.text]
            break
        except (ET.ParseError, json.JSONDecodeError):
            if attempt == 3: raise
            time.sleep(.15)
    selected = [r for r in rows if str(r.get('pid')) == pid and r.get('process') == 'com.android.systemui']
    boot = ar.shell('settings get global boot_count').strip()
    boot_id = ar.shell('cat /proc/sys/kernel/random/boot_id').strip()
    if (ar.shell('pidof com.android.systemui').strip() != pid or len(selected) != 1
            or selected[0].get('moduleVersion') != version_name or selected[0].get('moduleLoaded') is not True
            or str(selected[0].get('receivedBoot')) != boot or selected[0].get('processStartedElapsed', 0) <= 0
            or not re.fullmatch('[a-f0-9-]{36}', boot_id)):
        raise extra.Inconclusive('Fresh loaded version/boot/process identity unavailable')
    return {'pid': int(pid), 'boot': boot, 'bootId': boot_id,
            'startedElapsed': selected[0]['processStartedElapsed'], 'versionName': version_name}

def dark_mask(image):
    import numpy as np
    return np.array(image.convert('RGB')).max(axis=2) < 128

def locate_volume(image, bar_bounds, reference_mask):
    """Search whole physical status bar for reviewed native ink; no transformed View box."""
    import numpy as np
    l,t,r,b = bar_bounds; area = dark_mask(image.crop((l,t,r,b)))
    h,w = area.shape; th,tw = reference_mask.shape
    if th > h or tw > w or reference_mask.sum() < 50: raise extra.Inconclusive('No usable native ink template/window')
    shape = (h+th-1,w+tw-1)
    intersection = np.rint(np.fft.irfftn(np.fft.rfftn(area, s=shape, axes=(0,1))*np.fft.rfftn(reference_mask[::-1,::-1], s=shape, axes=(0,1)), s=shape, axes=(0,1))).astype(int)[th-1:h,tw-1:w]
    sums = np.pad(area.astype(int), ((1,0),(1,0))).cumsum(0).cumsum(1)
    count = sums[th:,tw:]-sums[:-th,tw:]-sums[th:,:-tw]+sums[:-th,:-tw]
    score = intersection/np.maximum(1,count+int(reference_mask.sum())-intersection)
    y,x = np.unravel_index(score.argmax(), score.shape); best = float(score[y,x])
    remaining = score.copy(); remaining[max(0,y-th):y+th,max(0,x-tw):x+tw] = 0
    second = float(remaining.max())
    if best < .96 or second >= .90: raise extra.Inconclusive('Native vibration ink missing/ambiguous; never force visibility')
    return {'bounds': [l+int(x),t+int(y),l+int(x)+tw,t+int(y)+th], 'iou': best,
            'secondDisjointIou': second, 'method': 'whole-statusbar reviewed physical native-ink template'}

def color_exchange(images, bar_bounds, native_matches):
    """35%-alpha backgrounds: compare same-position channel *differences*, not pure colors."""
    import numpy as np
    arrays = [np.array(im.convert('RGB'), dtype=np.int16) for im in images]
    l,t,r,b = bar_bounds; best = {'samePixels': 0}
    for i in range(len(arrays)):
        for j in range(i+1,len(arrays)):
            delta = arrays[i][t:b,l:r]-arrays[j][t:b,l:r]
            red_green = ((delta[:,:,0]>30)&(delta[:,:,1]<-30)&(np.abs(delta[:,:,2])<15)) | ((delta[:,:,0]<-30)&(delta[:,:,1]>30)&(np.abs(delta[:,:,2])<15))
            # Association comes from the independently located native vibration ink in BOTH frames.
            a,c = native_matches[i]['bounds'], native_matches[j]['bounds']
            region = [max(l,min(a[0],c[0])-8),max(t,min(a[1],c[1])-8),min(r,max(a[2],c[2])+8),min(b,max(a[3],c[3])+8)]
            if a != c: continue  # movement is not a same-position animation observation
            x0,y0,x1,y1 = region; local = red_green[y0-t:y1-t,x0-l:x1-l]
            count = int(local.sum())
            if count > best['samePixels']:
                ys,xs = np.where(local)
                best = {'a':i,'b':j,'samePixels':count,'bounds':[int(xs.min())+x0,int(ys.min())+y0,int(xs.max())+1+x0,int(ys.max())+1+y0],
                        'associatedNativeInk':a,'fullBarSwapPixels':int(red_green.sum())}
    return dict(best, established=best['samePixels']>=24, visualPass=False,
                limit='Necessary actual color evidence around native volume ink only; full geometry, font and neighbours require review.')

class Journal(extra.Journal):
    kind = 'safe-main-font-existing-gif'; mutable_keys = KEYS
    def valid_values(self, values):
        return bool(values) and set(values) <= KEYS and all(isinstance(v,str) and v in
            (self.data['baseline'][k],self.data['inputs']['targets'][k]) for k,v in values.items())
    def __init__(self, path, baseline=None, metadata=None, resources=None, names=None, inputs=None):
        self.path = Path(path)
        if baseline is None:
            self.data = json.loads(self.path.read_text(encoding='utf-8'))
        else:
            self.data = {'kind':self.kind,'schema':1,'pending':True,'baseline':baseline,'metadata':metadata,
                         'restore':{},'allowed':{},'expected':{},'inflight':{},'history':[],
                         'resourcesBefore':resources,'namesBefore':names,'inputs':inputs}
        self.validate()
        if baseline is not None: self.save()
    def validate(self):
        d=self.data
        if d.get('kind')!=self.kind or len(d.get('baseline',{}))!=SCHEMA_KEYS or not KEYS<=d['baseline'].keys() or not all(isinstance(v,str) for v in d['baseline'].values()): raise ValueError('Invalid two-key journal baseline')
        if not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict) or not isinstance(d.get('inputs'),dict): raise ValueError('Incomplete durable recovery inputs')
        if any(k not in d['metadata'] for k in ('serial','installedVersion','installedVersionName','testApkSha256','nativeBaseline','process','homeComponent')): raise ValueError('Incomplete durable identity')
        require_resources(d['resourcesBefore'])
        if d['inputs'].get('gifHash')!=GIF or d['inputs'].get('fontHash')!=NOTO or set(d['inputs'].get('targets',{}))!=KEYS: raise ValueError('Incomplete fixed input identities')
        if d['inputs']['targets']!=targets(d['baseline']): raise ValueError('Recovery target differs from exact two-key plan')
        validate_schema(d['inputs'].get('runtimeSchema',{}),d['metadata']['installedVersion'],d['baseline'])
        for field in ('restore','expected','inflight','allowed'):
            if not set(d.get(field,{}))<=KEYS: raise ValueError('Foreign recovery key')
        for k,v in d['expected'].items():
            if not self.valid_values({k:v}):raise ValueError('Foreign expected value')
        for field in ('inflight','allowed'):
            for k,values in d[field].items():
                if not isinstance(values,list) or not all(self.valid_values({k:v}) for v in values):raise ValueError('Foreign in-flight recovery value')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()): raise ValueError('Foreign recovery original')

class Collector(base.Collector):
    def instrument(self, operation, label, values=None):
        if operation not in ('snapshot','set','statusbar-assets-runtime'): raise ValueError('Unreviewed instrumentation operation')
        if operation=='set' and not self.journal.valid_values(values): raise ValueError('Only ART/FONT may be written')
        result=super().instrument(operation,label,values)
        if result.get('status')!='pass': raise extra.Inconclusive('Instrumentation result not successful: '+label)
        return result
    def identity(self,label):
        m=self.journal.data['metadata']
        if base.version(self.ar.shell('dumpsys package ls.augment.com'))!=(m['installedVersion'],m['installedVersionName']): raise extra.Inconclusive('Installed version changed')
        found=process_identity(self.ar,m['installedVersionName']);atomic(self.folder/(label+'-process.json'),found)
        if found!=m['process']: raise extra.Inconclusive('SystemUI identity changed')
    def before(self,label,values):
        if self.resources()!=self.journal.data['resourcesBefore'] or self.names()!=self.journal.data['namesBefore']: raise extra.Inconclusive('Resource/name changed; no write')
        if self.native()!=self.journal.data['metadata']['nativeBaseline']: raise extra.Inconclusive('Native profile changed; no write')
        super().before(label,values)
    def capture(self,label,animation=False):
        from PIL import Image
        import io
        self.identity(label);self.assert_config(self.instrument('snapshot',label+'-before')['settings'])
        after=int(self.ar.shell('date +%s%3N'));self.launcher(label);inv=self.inventory(label,after)
        rt=inv.get('runtime',{});rows=[r for r in base.visible_rows(inv) if r.get('id')=='volume' and r.get('capability')=='whole_layers']
        if len(rows)!=1 or rt.get('powerSave'): raise extra.Inconclusive('Unique native volume/current animation prerequisite unavailable')
        if animation and (rows[0].get('matchedAsset')!=GIF or rows[0].get('application') not in ('applied','ready')): raise extra.Inconclusive('Fresh volume resource identity not matched')
        windows,_,size=self.observe_all(label)
        bars=[n for n in self.ui.nodes(windows) if n.get('id')=='com.android.systemui:id/status_bar' and n.get('visible')]
        if len(bars)!=1 or size[0]>=size[1]: raise extra.Inconclusive('Unique portrait main statusbar unavailable')
        bar=extra.rectangle(bars[0])
        if not bar or bar[0]!=0 or bar[1]!=0 or bar[2]!=size[0] or not 40<=bar[3]<=size[1]*.15: raise extra.Inconclusive('Whole physical statusbar bounds unknown')
        row={'case':label,'visualPass':False,'status':'collecting','wholeStatusBarBounds':list(bar),'inventory':inv,
             'geometry':[n for n in self.ui.nodes(windows) if n.get('id','').startswith('com.android.systemui:id/') and n.get('visible')],
             'frameTimes':[],'nativeInk':[]}
        self.report['cases'].append(row);self.persist();folder=self.folder/label
        template=self.template();images=[]
        try:
            for i in range(8):
                start=time.monotonic();raw=self.ar.adb('exec-out','screencap','-p');end=time.monotonic()
                image=Image.open(io.BytesIO(raw)).convert('RGB')
                if image.size!=tuple(size): raise extra.Inconclusive('Screenshot size/profile changed')
                (folder/f'frame-{i:02d}.png').write_bytes(raw);images.append(image)
                row['frameTimes'].append({'frame':i,'startMonotonic':start,'endMonotonic':end,'sha256':digest(raw)})
                row['nativeInk'].append(locate_volume(image,bar,template));atomic(folder/'observation.json',row)
                time.sleep((.11,.23,.17,.29)[i%4])
            row['colorExchange']=color_exchange(images,bar,row['nativeInk'])
            if animation and not row['colorExchange']['established']: raise extra.Inconclusive('No same-pixel alpha GIF exchange established; running is not proof')
            if not animation and row['colorExchange']['established']: raise extra.Inconclusive('Unexpected color exchange in baseline/restoration target')
            self.assert_config(self.instrument('snapshot',label+'-post')['settings']);self.identity(label+'-post')
            row['status']='collected_manual_font_and_neighbour_review_required'
        except BaseException as error:
            row.update(status='incomplete',error=repr(error));raise
        finally:
            atomic(folder/'observation.json',row);self.persist()
        return row
    def template(self):
        from PIL import Image
        inp=self.journal.data['inputs'];path=Path(inp['referenceImage'])
        if digest(path.read_bytes())!=inp['referenceSha256']: raise ValueError('Reviewed native ink source changed')
        return dark_mask(Image.open(path).crop(tuple(inp['referenceBox'])))
    def exercise(self):
        self.capture('user-baseline')
        target=self.journal.data['inputs']['targets'];original=self.journal.data['baseline']
        self.set('gif-on',{ART:target[ART]});self.capture('gif-only',True)
        self.set('font-on',{FONT:target[FONT]});self.capture('gif-and-font',True)
        self.set('font-off',{FONT:original[FONT]});self.capture('gif-font-restored',True)
        self.report['status']='four_stages_collected_awaiting_restoration';self.persist()
    def restore(self):
        d=self.journal.data;d['pending']=True;self.journal.save();self.journal.validate()
        errors=[];pixel_error=None
        try:
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for k,v in d['restore'].items():
                if self.journal.owned_value(k,current.get(k)):changes[k]=v
                else:external[k]=current.get(k)
            d['externalValuesPreserved']=external;self.journal.save()
            if changes:self.instrument('set','recovery-set',changes)
            reads=[];stable=0
            for attempt in range(8):
                time.sleep(.5);values=self.instrument('snapshot','recovery-readback-'+str(attempt))['settings']
                diff=difference(d['baseline'],values);reads.append(diff);stable=stable+1 if not diff else 0
                if stable>=2:break
            d.update(configurationRestored=stable>=2 and not external,configurationDifferences=reads)
            if not d['configurationRestored']:raise extra.Inconclusive('External/unsettled configuration preserved')
            protections={'resources':difference(d['resourcesBefore'],self.resources()),'names':difference(d['namesBefore'],self.names()),
                         'native':difference(d['metadata']['nativeBaseline'],self.native())}
            d['protectionDifferences']=protections
            if any(protections.values()):raise extra.Inconclusive('Resource/name/native change; nothing outside two keys restored')
            d['expected']={k:d['baseline'][k] for k in d['restore']};d['inflight']={};self.journal.save()
            try:
                label='restored-main';attempt=0
                while (self.folder/label).exists():
                    attempt+=1;label='restored-main-retry-'+str(attempt)
                d['restoredObservation']=label;self.journal.save()
                self.capture(label);d['restoredPixelState']='captured_manual_review_required'
            except BaseException as error:
                pixel_error=repr(error);d['restoredPixelState']='not_fully_observed';d['restoredPixelError']=pixel_error
            # Recheck AFTER all observation/instrumentation. No false cleared pending if a user edit races capture.
            final=[]
            for i in range(2):
                time.sleep(.5);final.append(difference(d['baseline'],self.instrument('snapshot','recovery-final-'+str(i))['settings']))
            d['postObservationConfigurationDifferences']=final
            protections={'resources':difference(d['resourcesBefore'],self.resources()),'names':difference(d['namesBefore'],self.names()),
                         'native':difference(d['metadata']['nativeBaseline'],self.native())}
            d['postObservationProtectionDifferences']=protections
            if any(final) or any(protections.values()):
                d['configurationRestored']=not any(final);raise extra.Inconclusive('Post-observation external change; keep pending')
            d['pending']=False
        except BaseException as error:
            errors.append(repr(error));d['pending']=True
        finally:
            d['cleanupErrors']=errors;self.journal.save()
            self.report.update(configurationRestored=d.get('configurationRestored',False),restorePending=d['pending'],
                restoredPixelState=d.get('restoredPixelState','not_observed'),restoredPixelError=pixel_error,
                cleanupErrors=errors,visualPass=False,wholeFeaturePassed=False)
            if not errors and not pixel_error and self.report.get('status')=='four_stages_collected_awaiting_restoration':self.report['status']='collected_manual_review_required'
            self.persist()
        if errors:raise RuntimeError('Recovery pending; exact restore-only journal retained')
        if pixel_error:raise extra.Inconclusive('Configuration restored; restoration pixels incomplete')

def main():
    parser=argparse.ArgumentParser(description=__doc__);choice=parser.add_mutually_exclusive_group(required=True)
    choice.add_argument('--run',action='store_true');choice.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--runtime-schema',type=Path)
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version:raise extra.Inconclusive('Exact installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name) or base.test_apk_hash(ar)!=m['testApkSha256']:raise extra.Inconclusive('Recovery device/build/test APK mismatch')
        folder=journal.path.parent;report_path=folder/'report.json'
        report=json.loads(report_path.read_text(encoding='utf-8')) if report_path.exists() else {'cases':[],'status':'reconstructed_for_recovery','visualPass':False}
        collector=Collector(ar,folder,journal,report)
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'configurationRestored':journal.data.get('configurationRestored',False)}))
        return
    if args.runtime_schema is None:parser.error('--run requires exact compiled --runtime-schema; no stale default')
    local_test=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=local_test:raise extra.Inconclusive('Installed test APK differs from reviewed local bytes')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    folder=extra.safe.AUDIT/('main-font-existing-gif-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as out,contextlib.redirect_stdout(out):snapshot=ar.instrument('snapshot','baseline')
    if snapshot.get('status')!='pass' or snapshot.get('moduleVersion')!=code:raise extra.Inconclusive('Test snapshot version/status mismatch')
    settings=snapshot['settings'];target=targets(settings);schema=json.loads(args.runtime_schema.read_text(encoding='utf-8'));validate_schema(schema,code,settings)
    if settings.get('ls_augment_systemui_master') not in ('1','true') or settings.get('ls_augment_statusbar_position_size_only')!='0':raise extra.Inconclusive('Existing enabled customization prerequisite absent')
    reader=Collector.__new__(Collector);reader.ar=ar
    resources,names=reader.resources(),reader.names();require_resources(resources);inputs=source_inputs();inputs.update(targets=target,runtimeSchema=schema)
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'testApkSha256':local_test,
              'homeComponent':home,'nativeBaseline':reader.native(),'process':process_identity(ar,name),'runId':uuid.uuid4().hex,
              'collectorSha256':digest(Path(__file__).read_bytes())}
    journal=Journal(folder/'restore.json',settings,metadata,resources,names,inputs)
    report={'installedVersion':code,'cases':[],'status':'prepared','ownedKeys':sorted(KEYS),'visualPass':False,'wholeFeaturePassed':False,
            'limits':['Only existing main volume background and main clock font; no native state transitions tested','No resource imports/writes; physical pixel review required']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise()
    except BaseException as error:
        report.update(status='incomplete',error=repr(error),traceback=traceback.format_exc());raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'pending':journal.data['pending'],'configurationRestored':journal.data.get('configurationRestored',False)}))

if __name__=='__main__':main()
