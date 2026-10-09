"""Opt-in NEW-10/NEW-12 pixel collector. No notification/radio/resource mutations.

Imports are offline. Only --run/--restore-only contact the phone. Configuration
recovery is separate from a missing final screenshot, and never overwrites an
external configuration value. Existing resources are reused by exact hash only.
"""
from pathlib import Path
import argparse, contextlib, datetime, hashlib, importlib.util, io, json, re, shlex, time, traceback, uuid, zipfile
import xml.etree.ElementTree as ET
import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('summary_priority_main', ROOT/'tools/main_statusbar_device_collector.py')
base = importlib.util.module_from_spec(spec); spec.loader.exec_module(base)
extra = base.extra
SP = 'ls_augment_notification_summary_'
EN, MODE, SYMBOL, TEXT, ASSET, SIZE = [SP+x for x in ('enabled','mode','symbol','text','asset','size')]
PR, LIMIT, ORDER = ['ls_augment_statusbar_hint_'+x for x in ('priority','limit','order')]
KEYS = {EN,MODE,SYMBOL,TEXT,ASSET,SIZE,PR,LIMIT,ORDER}
CASES = ('priority','summary-text','summary-existing-assets')
HINTS = set('privacy.camera,privacy.microphone,privacy.projection,privacy.location,vpn,screen_record,cast,connected_display,location,sensors_off,zen,mute,volume,alarm_clock,bluetooth,headset,nfc,hotspot,airplane,data_saver,managed_profile,rotate,tty,cooling_fan,liquid_cooling,refresh_rate'.split(','))
PNG = 'd49ce724074f619d2eb39519f1bdba1f095fd1b59ef439c144209ecd7bffc47b'
GIF = '3109ba965e34e35577662c85ea4239423e38f22d11af2fa6690af6174706fca0'
PACKS = {'signal-only.zip': ('7940c7cfd9ff21bec11f161aef5f28d7e59120157455b53de66f0156785efa5c',PNG,'png'),
         'activity-only.zip': ('40344200aff9aaa831167244c6fdef64c95d5a670949e5beaa1601d98ab26bf8',GIF,'gif')}
digest = base.digest
atomic = base.atomic


def allowed_for(case):
    if case == 'priority': return {PR,LIMIT,ORDER}
    if case in CASES[1:]: return {EN,MODE,SYMBOL,TEXT,ASSET,SIZE}
    raise ValueError('Unknown case')


def valid_value(k,v):
    if not isinstance(v,str): return False
    if k in (EN,PR): return v in ('0','1')
    if k == MODE: return v in ('0','1','2')
    if k in (SIZE,LIMIT): return bool(re.fullmatch(r'0|[1-9][0-9]*',v)) and ((8<=int(v)<=40) if k==SIZE else (0<=int(v)<=20))
    if k in (TEXT,SYMBOL): return len(v)<=12 and not any(x in v for x in ('\n','\r','\0'))
    if k == ASSET: return v=='' or bool(re.fullmatch('[0-9a-f]{64}',v))
    if k == ORDER:
        items=v.split(',') if v else []
        return len(v)<=2048 and len(set(items))==len(items) and all(x in HINTS for x in items)
    return False


class Journal(extra.Journal):
    kind = 'safe-statusbar-summary-priority'
    mutable_keys = KEYS
    def __init__(self,path,baseline=None,metadata=None,resources=None,names=None):
        self.path=Path(path)
        if baseline is not None:
            self.data={'kind':self.kind,'schema':1,'pending':True,'baseline':baseline,'metadata':metadata,
                       'restore':{},'allowed':{},'expected':{},'inflight':{},'history':[],
                       'resourcesBefore':resources,'namesBefore':names,'actualChangedKeys':[],
                       'restoredPixelState':'not-attempted'}
        else: self.data=json.loads(self.path.read_text('utf-8'))
        self.validate()
        if baseline is not None: self.save()
    def validate(self):
        d=self.data
        if d.get('kind')!=self.kind or d.get('schema')!=1: raise ValueError('Foreign journal')
        if not isinstance(d.get('baseline'),dict) or len(d['baseline'])!=497 or not all(isinstance(v,str) for v in d['baseline'].values()): raise ValueError('Incomplete 497-key baseline')
        allowed=allowed_for(d['metadata']['case'])
        if not allowed<=d['baseline'].keys() or not isinstance(d.get('resourcesBefore'),dict) or not isinstance(d.get('namesBefore'),dict): raise ValueError('Incomplete initial recovery input')
        for field in ('restore','expected','allowed','inflight'):
            if not isinstance(d.get(field),dict) or not set(d[field])<=allowed: raise ValueError('Foreign restoration field/key')
        if any(v!=d['baseline'][k] for k,v in d['restore'].items()): raise ValueError('Original value changed in journal')
        if any(not isinstance(v,str) for v in d['expected'].values()): raise ValueError('Invalid expected value')
        if any(not isinstance(v,list) or not all(isinstance(x,str) for x in v) for f in ('allowed','inflight') for v in d[f].values()): raise ValueError('Invalid allowed/inflight values')
    def valid_values(self,values):
        return bool(values) and set(values)<=allowed_for(self.data['metadata']['case']) and all(valid_value(k,v) for k,v in values.items())


def phases(case,missing):
    if case=='priority':
        return [('priority-off',{PR:'0',LIMIT:'0'}),
                ('volume-first',{PR:'1',LIMIT:'1',ORDER:'volume,bluetooth,cooling_fan'}),
                ('bluetooth-first',{ORDER:'bluetooth,volume,cooling_fan'}),
                ('native-limit-zero',{LIMIT:'0'}),('priority-off-again',{PR:'0'})]
    common=[('summary-off',{EN:'0'})]
    if case=='summary-text':
        common += [('symbol-18',{EN:'1',MODE:'0',SYMBOL:'♥',SIZE:'18'}),
                   ('text-18',{MODE:'1',TEXT:'DUO'}),('text-28',{SIZE:'28'})]
    elif case=='summary-existing-assets':
        common += [('png-18',{EN:'1',MODE:'2',SIZE:'18',ASSET:PNG}),('gif-18',{ASSET:GIF})]
    else: raise ValueError('Unknown case')
    return common+[('missing-native-fallback',{EN:'1',MODE:'2',SIZE:'18',ASSET:missing}),('summary-off-again',{EN:'0'})]


def notification_records(raw):
    if re.search(r'Permission Denial|DUMP TIMEOUT|DeadObjectException|Unknown command',raw,re.I): raise extra.Inconclusive('Notification dump failed')
    markers=list(re.finditer(r'^  Notification List:\s*$',raw,re.M))
    if len(markers)!=1: raise extra.Inconclusive('Unknown active notification list')
    section=raw[markers[0].end():];end=re.search(r'^  \S',section,re.M)
    if end: section=section[:end.start()]
    records=[]
    for line in section.splitlines():
        if 'NotificationRecord(' not in line: continue
        m=re.search(r'NotificationRecord\([^\n]*?pkg=(\S+) user=(\S+) id=(-?\d+) tag=(\S+) .*?key=(\S+)',line)
        if not m: raise extra.Inconclusive('Unrecognized notification identity')
        records.append(list(m.groups()))
    return sorted(records)


def main_geometry(windows,size):
    nodes=[n for w in windows for n,_ in extra.walk(w.get('root',{}))]
    bars=[n for n in nodes if n.get('visible') and n.get('id')==extra.ID+'status_bar']
    if len(bars)!=1: raise extra.Inconclusive('Unique main status bar not observed')
    l,t,r,b=extra.rectangle(bars[0]);width,height=size
    if (l,t,r)!=(0,0,width) or not 0<b<height/4: raise extra.Inconclusive('Unexpected main status bar geometry')
    return [0,0,width,b],[{k:n.get(k) for k in ('id','class','text','description','bounds','visible')} for n,_ in extra.walk(bars[0]) if n.get('visible')]


def pixel_series(frames):
    """Analyze the real full status bar; never an inverted/transformed child box."""
    arrays=[np.asarray(im.convert('RGB')).astype(np.int16) for im in frames]
    if len(arrays)!=8 or len({a.shape for a in arrays})!=1: raise ValueError('Eight consistent frames required')
    red=[(a[:,:,0]>=225)&(a[:,:,1]<=30)&(a[:,:,2]<=30) for a in arrays]
    green=[(a[:,:,1]>=225)&(a[:,:,0]<=30)&(a[:,:,2]<=30) for a in arrays]
    changed=np.logical_or.reduce(red)&np.logical_or.reduce(green)
    ys,xs=np.where(changed)
    return {'frameCount':8,'wholeBarCropSha256':[digest(a.astype(np.uint8).tobytes()) for a in arrays],
            'adjacentChangedPixels':[int((np.max(np.abs(a-b),axis=2)>16).sum()) for a,b in zip(arrays,arrays[1:])],
            'samePixelsObservedRedAndGreen':int(changed.sum()),
            'redGreenCandidateBounds':None if not len(xs) else [int(xs.min()),int(ys.min()),int(xs.max())+1,int(ys.max())+1],
            'attribution':'Candidate only: compare disabled baseline, original source and notification placement before claiming a summary GIF. Other changing icons are not proof.',
            'visualPass':False}


def check_priority_candidates(row,frame):
    visible={r['id'] for r in row['inventory'].get('surfaces',{}).get('main',[]) if r.get('state')=='visible' and r.get('application')=='native' and not r.get('coveredBy')}
    if not {'volume','bluetooth'}<=visible: raise extra.Inconclusive('Two native volume/bluetooth hints not observed; no radio/ringer change')
    evidence={}
    for identity,word in [('volume','振'),('bluetooth','蓝牙')]:
        targets=[n for n in row['geometry'] if word in str(n.get('description','')) and n.get('class')=='android.widget.ImageView']
        if len(targets)!=1: raise extra.Inconclusive('Actual native hint target is ambiguous: '+identity)
        l,t,r,b=extra.rectangle(targets[0])
        if not (0<=l<r<=frame.width and 0<=t<b<=frame.height): raise extra.Inconclusive('Hint has no bounded visible sample')
        crop=np.asarray(frame.crop((l,t,r,b)).convert('RGB')).astype(int)
        evidence[identity]={'bounds':[l,t,r,b],'contrast':int(crop.max()-crop.min()),'darkPixels':int((crop.max(axis=2)<150).sum())}
        if evidence[identity]['contrast']<30 or evidence[identity]['darkPixels']<9: raise extra.Inconclusive('No native hint ink in observed area')
    return evidence


def verify_local_assets():
    result={}
    for name,(ziphash,identity,ext) in PACKS.items():
        p=ROOT/'out/wifi-asset-spacing-20454/device-inputs'/name
        if digest(p.read_bytes())!=ziphash: raise extra.Inconclusive('Reviewed asset source ZIP changed')
        with zipfile.ZipFile(p) as z: raw=z.read('images/'+identity+'.'+ext)
        if digest(raw)!=identity: raise extra.Inconclusive('Source content identity changed')
        with Image.open(io.BytesIO(raw)) as im:
            count=getattr(im,'n_frames',1)
            if im.format!=ext.upper() or (ext=='gif' and count<2) or (ext=='png' and count!=1): raise extra.Inconclusive('Wrong source image format')
            result[identity]={'source':str(p),'zipSha256':ziphash,'sha256':identity,'format':im.format,'size':list(im.size),'frames':count}
    return result


class Collector(base.Collector):
    def native(self):
        return dict(super().native(),**{'global/bluetooth_on':self.ar.shell('settings get global bluetooth_on'),
                                        'global/mode_ringer':self.ar.shell('settings get global mode_ringer')})
    def awake(self):
        raw=self.ar.shell('dumpsys power')
        if not re.search(r'\bmWakefulness=Awake\b',raw): raise extra.Inconclusive('Phone must already be awake; no wake/sleep action')
    def launcher(self,label):
        self.awake();self.ar.shell('cmd statusbar collapse');self.ar.shell('input keyevent KEYCODE_HOME');time.sleep(.7)
        expected=self.journal.data['metadata']['homeComponent'].split('/')[0]
        for attempt in range(4):
            windows,native,size=self.observe_all(label+'-launcher-'+str(attempt))
            if extra.focus_state(windows,native,expected)['targetFocusedAndPanelGone']: return size
            time.sleep(.4)
        raise extra.Inconclusive('Launcher foreground absent; no other UI input attempted')
    def protected(self,label):
        resources,names,native=self.resources(),self.names(),self.native()
        diff={'resources':base.difference(self.journal.data['resourcesBefore'],resources),
              'names':base.difference(self.journal.data['namesBefore'],names),
              'native':base.difference(self.journal.data['metadata']['nativeBaseline'],native)}
        atomic(self.folder/(label+'-protection.json'),diff)
        if any(diff.values()): raise extra.Inconclusive('Protected resources/names/native configuration changed; preserve external state')
        return diff
    def before(self,label,values):
        self.protected(label);super().before(label,values)
    def acknowledge(self,label,values):
        super().acknowledge(label,values)
        changed=[k for k,v in values.items() if v!=self.journal.data['baseline'][k]]
        self.journal.data['actualChangedKeys']=sorted(set(self.journal.data['actualChangedKeys'])|set(changed));self.journal.save()
        self.report['actualChangedKeys']=self.journal.data['actualChangedKeys'];self.persist()
    def notifications(self,label):
        records=notification_records(self.ar.shell('dumpsys notification',timeout=40))
        atomic(self.folder/(label+'-notification-identities-private.json'),records)
        return {'count':len(records),'identitySha256':digest(json.dumps(records,sort_keys=True).encode())}
    def capture(self,label):
        self.identity(label);self.protected(label);after=int(self.ar.shell('date +%s%3N'))
        size=self.launcher(label)
        if size[0]>=size[1]: raise extra.Inconclusive('Current portrait is required; no rotation change')
        inv=self.inventory(label,after);before=self.notifications(label+'-before')
        windows,native,size=self.observe_all(label)
        home=self.journal.data['metadata']['homeComponent'].split('/')[0]
        if not extra.focus_state(windows,native,home)['targetFocusedAndPanelGone']: raise extra.Inconclusive('Foreground changed')
        bar,geometry=main_geometry(windows,size);frames=[];times=[]
        for i in range(8):
            start=time.monotonic();raw=self.ar.adb('exec-out','screencap','-p');end=time.monotonic()
            with Image.open(io.BytesIO(raw)) as im:
                if im.format!='PNG' or im.size!=size: raise extra.Inconclusive('Screenshot size/format changed')
                frames.append(im.convert('RGB').crop(tuple(bar)))
            (self.folder/label/f'frame-{i:02d}.png').write_bytes(raw)
            frames[-1].save(self.folder/label/f'bar-{i:02d}.png')
            times.append({'frame':i,'startMonotonic':start,'endMonotonic':end,'sha256':digest(raw)})
            if i<7: time.sleep((.11,.23,.17,.29)[i%4])
        post,postnative,postsize=self.observe_all(label+'-after')
        postbar,_=main_geometry(post,postsize)
        if postsize!=size or postbar!=bar or not extra.focus_state(post,postnative,home)['targetFocusedAndPanelGone']: raise extra.Inconclusive('Main viewport changed during frames')
        after_notifications=self.notifications(label+'-after')
        for retry in range(4):
            raw=self.ar.shell('cat '+base.APP+'shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
            try: ET.fromstring(raw);break
            except ET.ParseError:
                if retry==3: raise
                time.sleep(.2)
        (self.folder/label/'diagnostics-private.xml').write_text(raw,encoding='utf-8')
        row={'case':label,'inventory':inv,'geometry':geometry,'mainBarBounds':bar,'frameTimes':times,
             'notificationsBefore':before,'notificationsAfter':after_notifications,'notificationIdentityStable':before==after_notifications,
             'pixels':pixel_series(frames),'visualPass':False,'pixelReviewRequired':True}
        atomic(self.folder/label/'evidence.json',row);self.report['cases'].append(row);self.persist()
        self.assert_config(self.instrument('snapshot',label+'-post')['settings']);self.identity(label+'-post')
        return row,frames[0]
    def missing_absent(self):
        identity=self.journal.data['metadata']['missingHash'];current=self.resources()
        if any(Path(k).stem==identity for k in current) or any(identity in k for k in self.names()): raise extra.Inconclusive('Missing test hash is no longer absent')
    def exercise(self):
        case=self.journal.data['metadata']['case'];self.capture('user-baseline')
        for label,values in phases(case,self.journal.data['metadata']['missingHash']):
            if ASSET in values and values[ASSET]==self.journal.data['metadata']['missingHash']: self.missing_absent()
            self.set(label,values);row,frame=self.capture(label)
            if label=='priority-off':
                self.report['priorityPrerequisite']=check_priority_candidates(row,frame);self.persist()
            if label=='summary-off':
                candidates=[n for n in row['geometry'] if n.get('class')=='android.widget.ImageView' and '通知' in str(n.get('description',''))]
                if not row['notificationsAfter']['count'] or not candidates: raise extra.Inconclusive('No native notification candidates; eligibility is not inferred from hidden icons')
                self.report['summaryPrerequisite']={'candidateCount':len(candidates),'nativeEligibilityVerified':False};self.persist()
        self.report['status']='collected-pixel-review-required';self.persist()
    def restore(self):
        d=self.journal.data;self.journal.validate();d.update(pending=True,configurationRestored=False);self.journal.save()
        errors=[]
        try:
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for k,v in d['restore'].items():
                if self.journal.owned_value(k,current.get(k)):
                    changes[k]=v
                    if current.get(k)!=v:d['actualChangedKeys']=sorted(set(d['actualChangedKeys'])|{k})
                else: external[k]=current.get(k)
            self.journal.save()
            if changes:self.instrument('set','recovery-set',changes)
            reads=[]
            for i in range(2):time.sleep(.7);reads.append(self.instrument('snapshot','recovery-readback-'+str(i))['settings'])
            differences=[base.difference(d['baseline'],r) for r in reads]
            d.update(configurationRestored=not any(differences),configurationDifferences=differences,externalValuesPreserved=external)
            protection=self.protected('recovery');d['protectionDifferences']=protection
            if any(differences) or external: raise extra.Inconclusive('External/unsettled configuration retained; recovery pending')
            # Persist restoration first. A screenshot failure is not a failed save.
            d['expected']=dict(d['restore']);d['inflight']={};d['configurationRestored']=True;self.journal.save()
            label='restored-main-'+str(d.get('restoreAttempts',0));d['restoreAttempts']=d.get('restoreAttempts',0)+1
            try:
                self.capture(label);d['restoredPixelState']='collected-review-required';d.pop('restoredPixelError',None)
            except Exception:
                d['restoredPixelState']='not-observed';d['restoredPixelError']=traceback.format_exc()
            # Pixel collection can observe an external change. Recheck before closing ownership.
            final=self.instrument('snapshot','recovery-final')['settings'];self.protected('recovery-final')
            d['postSamplingConfigurationDifference']=base.difference(d['baseline'],final)
            d['configurationRestored']=not d['postSamplingConfigurationDifference']
            if d['postSamplingConfigurationDifference']: raise extra.Inconclusive('Configuration changed during restored image sampling')
            d['pending']=False
        except BaseException:
            errors.append(traceback.format_exc())
        finally:
            d['recoveryErrors']=errors;self.journal.save()
            self.report.update(configurationRestored=d.get('configurationRestored',False),restorePending=d['pending'],
                restoredPixelState=d['restoredPixelState'],actualChangedKeys=d['actualChangedKeys'],cleanupErrors=errors,
                attemptedKeys=sorted(d['restore']),actualChangedKeysScope='Nonbaseline owned values observed in a successful save readback or recovery-before snapshot; not every unobserved transient write.',
                resourcesNeverWritten=True,notificationsNeverMutated=True,nativePreferencesNeverWritten=True)
            self.persist()
        if errors: raise extra.Inconclusive('Recovery pending; inspect exact journal, external state preserved')


def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--case',choices=CASES,default='priority')
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk')
    args=parser.parse_args()
    import adb_regression as ar
    code,name=base.version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version: raise extra.Inconclusive('Installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name): raise extra.Inconclusive('Recovery identity mismatch')
        if base.test_apk_hash(ar)!=m['testApkSha256']: raise extra.Inconclusive('Recovery TestAPK identity changed')
        path=journal.path.parent/'report.json'
        report=json.loads(path.read_text('utf-8')) if path.exists() else {'installedVersion':code,'requestedCase':m['case'],'cases':[],'status':'reconstructed-for-recovery','wholeFeaturePassed':False}
        Collector(ar,journal.path.parent,journal,report).restore();return
    testhash=digest(args.test_apk.read_bytes())
    if base.test_apk_hash(ar)!=testhash: raise extra.Inconclusive('Installed TestAPK differs from local reviewed APK')
    sources=verify_local_assets() if args.case=='summary-existing-assets' else {}
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    folder=extra.safe.AUDIT/('summary-priority-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as stream,contextlib.redirect_stdout(stream): saved=ar.instrument('snapshot','baseline')
    if saved.get('moduleVersion')!=code or saved.get('status')!='pass': raise extra.Inconclusive('Baseline build/status mismatch')
    settings=saved['settings']
    if len(settings)!=497 or settings.get('ls_augment_systemui_master')!='1': raise extra.Inconclusive('Reviewed 497 schema and already-enabled SystemUI required')
    if args.case=='priority' and settings.get('ls_augment_statusbar_position_size_only')!='0': raise extra.Inconclusive('Priority inactive in position-only mode; preserve user choice')
    reader=Collector.__new__(Collector);reader.ar=ar;reader.awake()
    resources,names,native=reader.resources(),reader.names(),reader.native()
    for h in sources:
        if resources.get(base.DIRS[0]+h+'.asset')!=h: raise extra.Inconclusive('Required reviewed asset absent or different; no import attempted')
    missing=digest(('summary-missing-'+uuid.uuid4().hex).encode())
    if any(Path(k).stem==missing for k in resources): raise extra.Inconclusive('Missing hash collision')
    metadata={'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'homeComponent':home,
              'nativeBaseline':native,'case':args.case,'testApkSha256':testhash,'collectorSha256':digest(Path(__file__).read_bytes()),
              'missingHash':missing,'existingAssetSources':sources,'runId':uuid.uuid4().hex}
    journal=Journal(folder/'restore.json',settings,metadata,resources,names)
    report={'installedVersion':code,'requestedCase':args.case,'cases':[],'status':'prepared','wholeFeaturePassed':False,
            'allowedMutableKeys':sorted(allowed_for(args.case)),'actualChangedKeys':[],
            'limits':['Current main portrait only','Notification candidates are not private native eligibility','Priority means retention under limit, not guaranteed physical reorder','No zero-notification, radio transition or wake cycle tested','Pixels require independent review']}
    collector=Collector(ar,folder,journal,report)
    try:
        collector.persist();collector.identity('preflight');collector.exercise()
    except BaseException:
        report['status']='inconclusive' if isinstance(__import__('sys').exc_info()[1],extra.Inconclusive) else 'failed';report['error']=traceback.format_exc();raise
    finally:
        try:collector.restore()
        finally:print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending'],'restoredPixelState':journal.data['restoredPixelState']},ensure_ascii=False))


if __name__=='__main__': main()
