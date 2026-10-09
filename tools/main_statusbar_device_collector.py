"""Opt-in main status-bar audit; importing this module never contacts a phone."""
from pathlib import Path
import argparse,contextlib,datetime,hashlib,importlib.util,json,re,shlex,time,traceback,uuid,zipfile
import xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
def load(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'tools'/file)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
extra=load('main_assets_extra','run-safe-header-extras-device.py')
wifi=load('main_assets_import','run-c17-wifi-assets-device.py')
P='ls_augment_';ART=P+'statusbar_artwork_v1';FONT=P+'statusbar_fonts_v1'
SYSTEM=P+'statusbar_system_two_rows';NOTIFICATIONS=P+'statusbar_notification_two_rows';DUAL=P+'rm_signal_dual'
KEYS={ART,FONT,SYSTEM,NOTIFICATIONS,DUAL};APP='/data/user/0/ls.augment.com/'
DIRS=[APP+'files/'+x+'/' for x in ['statusbar-assets','fonts','statusbar-pack-notices']]
NAMES=APP+'shared_prefs/statusbar_asset_names.xml'
FIXTURES=ROOT/'out/statusbar-audit-20445'
PACK_HASHES={'signal-state-test-fixture.zip':'07fef083900f690f011977561ab0f4c9d2de0f7ee2752f759c7ca7e3ac3f40f3',
 'gentle-spin-1.0.0.zip':'9b1fe10dec94724cdae21de1b4e236f96c31872e498d24dc3607ff48f98c08ec',
 'noto-sans-1.0.0.zip':'1977bd72e934c840868d0907595dfbd5957e588c0d8e12d129750084a2c01153'}
def digest(data):return hashlib.sha256(data).hexdigest()
def atomic(path,value):extra.safe.atomic(Path(path),value)
def checked_pack(name):
    path=FIXTURES/name
    if digest(path.read_bytes())!=PACK_HASHES[name]:raise ValueError('Historical source ZIP hash changed: '+name)
    with zipfile.ZipFile(path) as z:
        manifest=json.loads(z.read('manifest.json'));files={}
        for field in ('images','fontFiles'):
            for identity,file in manifest[field].items():
                data=z.read(file)
                if digest(data)!=identity:raise ValueError('Source resource hash mismatch')
                files[identity]=data
    return manifest,files
def font_with(raw,identity):
    scopes=['all','main','lock','notification','control'];roles=['global','clock','network','metrics','battery','bluetooth','other'];values={}
    if raw:
        chunks=raw.split(';')
        if chunks[0] not in ('1','2'):raise ValueError('Unknown font format')
        for item in chunks[1:]:
            key,value=item.split('=');parts=key.split(':');surface,role=('all',parts[0]) if len(parts)==1 else parts
            if surface not in scopes or role not in roles or (surface,role) in values or (chunks[0]=='1' and len(parts)!=1):raise ValueError('Malformed font roles')
            if not re.fullmatch(r'original|inherit|font:[a-f0-9]{64}',value):raise ValueError('Invalid font reference')
            if value!='inherit':values[surface,role]=value
    if not re.fullmatch('[a-f0-9]{64}',identity):raise ValueError('Invalid font hash')
    values['main','clock']='font:'+identity
    return '2;'+ ';'.join(s+':'+r+'='+values[s,r] for s in scopes for r in roles if (s,r) in values)
def visible_rows(inv):return [r for r in inv.get('surfaces',{}).get('main',[]) if r.get('state')=='visible' and not r.get('coveredBy')]
def has(rows,identity):return any(r.get('id')==identity and r.get('capability')=='whole_layers' for r in rows)
def dual_ready(inv):return all(has(visible_rows(inv),i) for i in ('mobile1.signal','mobile2.signal'))
def row_plan():
    return [('rows-00',{SYSTEM:'0',NOTIFICATIONS:'0'}),('rows-system-only',{SYSTEM:'1',NOTIFICATIONS:'0'}),
            ('rows-notification-only',{SYSTEM:'0',NOTIFICATIONS:'1'}),('rows-11',{SYSTEM:'1',NOTIFICATIONS:'1'})]
def make_pack(inv,folder,run_id,existing_theme=''):
    rows=visible_rows(inv);signals=[i for i in ('wifi.signal','mobile1.signal','mobile2.signal') if has(rows,i)]
    whole={r[0] for r in wifi.theme_rows(existing_theme) if r[2]=='whole' and r[10] in ('all','main')}
    animation=next((i for i in ('volume','cooling_fan','battery') if has(rows,i) and i not in whole),None)
    if not signals or not animation:raise extra.Inconclusive('No visible independent signal and animation target; native hidden/combined state preserved')
    signal,images=checked_pack('signal-state-test-fixture.zip');spin,animated=checked_pack('gentle-spin-1.0.0.zip')
    bindings=[r[:10]+['main'] for r in wifi.theme_rows(signal['theme']) if r[0] in signals]
    art=next(iter(animated));bindings.append([animation,'default','background',art,'1','100','0','0','100','0','main'])
    used={r[3] for r in bindings};all_images=dict(images,**animated);theme=wifi.serialize_theme(bindings)
    metadata=dict(signal['metadata']);metadata.update(name='Duo main audit '+run_id,description='Main scope only; original signal PNG and gentle-spin bytes unchanged. Not original user ZIP.')
    metadata['licenseText']=json.dumps({'signalSource':signal['metadata'],'animationSource':spin['metadata']},ensure_ascii=False)
    manifest={'format':signal['format'],'version':1,'metadata':metadata,'theme':theme,'fonts':'',
        'images':{h:'images/'+h+('.webp' if h==art else '.png') for h in used},'fontFiles':{}}
    path=folder/('duo-main-assets-'+run_id+'.zip')
    with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
        z.writestr('manifest.json',json.dumps(manifest,ensure_ascii=False))
        for h,file in manifest['images'].items():z.writestr(file,all_images[h])
    return {'path':str(path),'sha256':digest(path.read_bytes()),'theme':theme,'hashes':sorted(used),'signals':signals,'animationTarget':animation,'animationHash':art}
def difference(before,after):return {k:{'expected':before.get(k),'actual':after.get(k)} for k in before.keys()|after.keys() if before.get(k)!=after.get(k)}
def resource_difference(before,after):return {k:{'before':v,'after':after.get(k)} for k,v in before.items() if after.get(k)!=v}
def version(raw):
    code=re.search(r'\bversionCode=(\d+)',raw);name=re.search(r'\bversionName=([^\s]+)',raw)
    if not code or not name:raise extra.Inconclusive('Cannot identify installed version')
    return int(code[1]),name[1]
def test_apk_hash(ar):
    paths=ar.shell('pm path ls.augment.com.test').splitlines()
    if len(paths)!=1 or not paths[0].startswith('package:'):raise extra.Inconclusive('Test APK path ambiguous')
    raw=ar.shell('sha256sum '+shlex.quote(paths[0][8:]),root=True)
    match=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',raw)
    if not match or match[2]!=paths[0][8:]:raise extra.Inconclusive('Test APK hash unavailable')
    return match[1]
def interactive_window(windows,native,node):
    expected=node.get('package')
    if expected not in ('ls.augment.com','com.android.documentsui','com.google.android.documentsui'):raise extra.Inconclusive('UI target outside owned editor/picker')
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1 or focused[0].get('root',{}).get('package')!=expected:raise extra.Inconclusive('Unknown/covering focused window; no tap')
    if not any(n is node for n,_ in extra.walk(focused[0].get('root',{}))):raise extra.Inconclusive('Target belongs to an underlying window')
    state=extra.focus_state(windows,native,expected)
    if not state['targetFocusedAndPanelGone']:raise extra.Inconclusive('Native foreground/permission/default state does not confirm target ownership')
    return focused[0]
def choose_card_button(windows,title,button):
    found=[]
    for w in windows:
        for n,parents in extra.walk(w.get('root',{})):
            if n.get('package')=='ls.augment.com' and n.get('visible') and n.get('text')==button and n.get('clickable') and n.get('enabled'):
                for p in reversed(parents):
                    children=list(extra.walk(p))
                    if any(c.get('text')==title for c,_ in children) and sum(c.get('text')==button for c,_ in children)==1:found.append(n);break
    return found[0] if len(found)==1 else None
class Journal(extra.Journal):
    kind='safe-main-statusbar-assets';mutable_keys=KEYS
    def __init__(self,path,baseline=None,metadata=None,resources_before=None,names_before=None):
        if baseline is None:super().__init__(path);return
        self.path=Path(path)
        # All recovery inputs are present in the very first atomic journal, so
        # a host interruption cannot leave a half-initialized pending record.
        self.data={'kind':self.kind,'schema':1,'pending':True,'baseline':baseline,'metadata':metadata,
            'restore':{},'allowed':{},'expected':{},'inflight':{},'history':[],
            'resourcesBefore':resources_before or {},'namesBefore':names_before or {},'inputs':{}}
        self.save()
    def valid_values(self,values):return bool(values) and set(values)<=KEYS and all(isinstance(v,str) and (k not in (SYSTEM,NOTIFICATIONS,DUAL) or v in ('0','1')) for k,v in values.items())
class Collector(extra.Collector):
    def observe_all(self,label):
        started=time.monotonic();result=super().observe_all(label)
        self.interaction_observation=(result[0],result[1],started);return result
    def native(self):return dict(super().native(),**{'global/wifi_on':self.ar.shell('settings get global wifi_on')})
    def assert_config(self,current):
        expected=dict(self.journal.data['baseline'],**self.journal.data['expected']);diff=difference(expected,current)
        if diff:self.journal.data['unexpectedConfiguration']=diff;self.journal.save();raise extra.Inconclusive('Unexpected configuration change; stop and preserve recovery')
    def identity(self,label):
        m=self.journal.data['metadata']
        if version(self.ar.shell('dumpsys package ls.augment.com'))!=(m['installedVersion'],m['installedVersionName']):raise extra.Inconclusive('Installed version changed')
        if not self.runtime_current('com.android.systemui',label):raise extra.Inconclusive('Actual SystemUI version/boot mismatch')
        runtime=json.loads((self.folder/(label+'-runtime.json')).read_text('utf-8'))
        if self.journal.data.get('systemuiPid') not in (None,runtime['pid']):raise extra.Inconclusive('SystemUI PID changed; stop and restore')
        self.journal.data['systemuiPid']=runtime['pid'];self.journal.save()
    def before(self,label,values):
        self.identity(label);current=self.instrument('snapshot',label+'-before')['settings'];self.assert_config(current)
        self.journal.plan(values,current)
    def acknowledge(self,label,values):
        expected=dict(self.journal.data['baseline'],**self.journal.data['expected']);expected.update(values)
        for attempt in range(6):
            actual=self.instrument('snapshot',label+'-readback-'+str(attempt))['settings'];diff=difference(expected,actual)
            if not diff:self.journal.acknowledge(values);return
            if any(k not in values for k in diff):self.journal.data['unexpectedConfiguration']=diff;self.journal.save();raise extra.Inconclusive('Unrelated UI save changed configuration')
            time.sleep(.4)
        raise extra.Inconclusive('Exact requested save did not settle')
    def set(self,label,values):self.before(label,values);self.instrument('set',label,values);self.acknowledge(label,values)
    def resources(self):
        result={}
        for directory in DIRS:
            raw=self.ar.shell('if test -L '+shlex.quote(directory.rstrip('/'))+'; then echo REFUSE_LINK; elif test -d '+shlex.quote(directory)+'; then find '+shlex.quote(directory)+' -maxdepth 1 -type f -exec sha256sum {} \\; ; fi',root=True)
            for line in raw.splitlines():
                m=re.fullmatch(r'([a-f0-9]{64})\s+(.+)',line)
                if not m or not m[2].startswith(directory) or '/' in m[2][len(directory):] or not re.fullmatch(r'[a-f0-9]{64}\.(asset|json|font)',Path(m[2]).name):raise extra.Inconclusive('Unknown or pending resource file')
                result[m[2]]=m[1]
            if self.ar.shell('if test -d '+shlex.quote(directory)+'; then find '+shlex.quote(directory)+' -maxdepth 1 -type l; fi',root=True):raise extra.Inconclusive('Resource symlinks present')
        return result
    def names(self):
        if self.ar.shell('if test -e '+NAMES+'.bak; then echo PENDING; fi',root=True):raise extra.Inconclusive('Resource-name write pending')
        raw=self.ar.shell('if test -f '+NAMES+'; then cat '+NAMES+'; else echo ABSENT; fi',root=True)
        if raw=='ABSENT':return {}
        tree=ET.fromstring(raw)
        if tree.tag!='map' or any(n.tag!='string' for n in tree):raise extra.Inconclusive('Unknown resource-name storage')
        return {n.get('name'):n.text or '' for n in tree}
    def raw_config(self):
        path=APP+'shared_prefs/ls_augment_config_v2.xml'
        raw=self.ar.shell('cat '+path,root=True);tree=ET.fromstring(raw)
        if tree.tag!='map':raise extra.Inconclusive('Configuration XML unavailable')
        return {n.get('name'):(n.tag,n.get('value'),n.text or '') for n in tree}
    def ui_before_apply(self,label,values):
        # Main-app instrumentation would kill the open editor and its draft.
        # Compare its unchanged raw settings without starting instrumentation.
        if self.raw_config()!=self.ui_original_config:raise extra.Inconclusive('Settings changed while editor draft was open; no Apply tap')
        current=dict(self.journal.data['baseline'],**self.journal.data['expected'])
        self.journal.plan(values,current);self.journal.data['uiApplyStage']=label;self.journal.save()
    def saved_ui(self,label):
        for attempt in range(5):
            windows,_,_=self.observe_all(label+'-saved-'+str(attempt))
            nodes=[n for n in self.ui.nodes(windows) if n.get('visible') and n.get('package')=='ls.augment.com']
            if any(str(n.get('text','')).startswith('当前素材与字体已保存。') for n in nodes) and any(n.get('text')=='应用到状态栏' and not n.get('enabled') for n in nodes):return
            time.sleep(.3)
        raise extra.Inconclusive('UI has not confirmed completed save; no target-app instrumentation started')
    def inventory(self,label,after):
        for attempt in range(4):
            result=self.instrument('statusbar-assets-runtime',label+'-inventory-'+str(attempt))['statusbarRuntime'];inv=result.get('inventory') or {};rt=inv.get('runtime',{})
            if inv.get('surfaceObservedAt',{}).get('main',0)>=after and rt.get('activeSurface')=='main' and rt.get('enabled') and rt.get('interactive'):return inv
            time.sleep(2)
        raise extra.Inconclusive('No fresh enabled main inventory')
    def capture(self,label):
        self.identity(label);after=int(self.ar.shell('date +%s%3N'));self.launcher(label);inv=self.inventory(label,after)
        windows,_,size=self.observe_all(label)
        if size[0]>=size[1]:raise extra.Inconclusive('Portrait collector; rotation untouched')
        bars=[w for w in windows if any(n.get('id')=='com.android.systemui:id/status_bar' and n.get('visible') for n in self.ui.nodes([w]))]
        if len(bars)!=1:raise extra.Inconclusive('Unique visible main status bar absent')
        geometry=[{k:n.get(k) for k in ('id','text','description','bounds','visible','class')} for n in self.ui.nodes(bars) if n.get('visible')];frames=[]
        for i in range(8):
            start=time.monotonic();png=self.ar.adb('exec-out','screencap','-p');end=time.monotonic()
            if png[:8]!=b'\x89PNG\r\n\x1a\n':raise extra.Inconclusive('Invalid screenshot')
            (self.folder/label/f'frame-{i:02d}.png').write_bytes(png);frames.append({'frame':i,'startMonotonic':start,'endMonotonic':end,'sha256':digest(png)})
            time.sleep((.11,.23,.17,.29)[i%4])
        row={'case':label,'surface':'main','inventory':inv,'geometry':geometry,'frameTimes':frames,'clock':[n for n in geometry if n.get('id')=='com.android.systemui:id/clock'],'pixelReviewRequired':True,'visualPass':False}
        for attempt in range(4):
            raw=self.ar.shell('cat '+APP+'shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
            try:
                diagnostic=ET.fromstring(raw);break
            except ET.ParseError:
                if attempt==3:raise
                time.sleep(.2)
        (self.folder/label/'diagnostics-private.xml').write_text(raw,encoding='utf-8')
        row['layoutDiagnostics']={n.get('name'):n.text for n in diagnostic if 'statusbar' in n.get('name','')}
        atomic(self.folder/label/'geometry-and-runtime.json',row);self.report['cases'].append(row);self.persist()
        self.assert_config(self.instrument('snapshot',label+'-post')['settings']);return inv
    def hit(self,label,node,size):
        windows,native,started=self.interaction_observation
        if time.monotonic()-started>5:raise extra.Inconclusive('UI evidence too old for a coordinate action')
        interactive_window(windows,native,node)
        if not all(node.get(k) for k in ('visible','enabled','clickable')):raise extra.Inconclusive('Target is not currently clickable')
        l,t,r,b=extra.rectangle(node)
        if not (0<=l<r<=size[0] and 0<=t<b<=size[1]):raise extra.Inconclusive('Target is clipped')
        atomic(self.folder/(label+'-tap.json'),{'node':node,'point':[(l+r)//2,(t+b)//2]});self.ar.shell(f'input tap {(l+r)//2} {(t+b)//2}')
    def tap(self,label,predicate):
        for attempt in range(4):
            windows,_,size=self.observe_all(label+'-'+str(attempt));matches=[n for n in self.ui.nodes(windows) if n.get('visible') and n.get('enabled') and n.get('clickable') and predicate(n)]
            if len(matches)==1:self.hit(label,matches[0],size);return
            time.sleep(.5)
        raise extra.Inconclusive('Exact UI target unavailable: '+label)
    @staticmethod
    def text(value,package='ls.augment.com'):return lambda n:n.get('package')==package and value in (n.get('text'),n.get('description'))
    def picker(self,label,filename):
        packages=('com.android.documentsui','com.google.android.documentsui');target=lambda n:n.get('package') in packages and n.get('text')==filename
        windows,_,_=self.observe_all(label+'-picker')
        if not any(target(n) and n.get('visible') for n in self.ui.nodes(windows)):
            self.tap(label+'-roots',lambda n:n.get('package') in packages and (n.get('id')=='android:id/home' or n.get('description') in ('显示根目录','Show roots','显示导航栏','Open navigation drawer')))
            self.tap(label+'-downloads',lambda n:n.get('package') in packages and n.get('text') in ('下载','Downloads'))
        for attempt in range(3):
            windows,_,size=self.observe_all(label+'-document-'+str(attempt));found=[]
            for w in windows:
                for n,parents in extra.walk(w.get('root',{})):
                    if n.get('visible') and target(n):
                        candidates=[p for p in (n,)+tuple(reversed(parents)) if p.get('visible') and p.get('enabled') and p.get('clickable') and p.get('package') in packages]
                        if candidates:found.append(candidates[0])
            if len(found)==1:self.hit(label+'-document',found[0],size);return
            time.sleep(.5)
        raise extra.Inconclusive('Exact staged document not visible; no other file opened')
    def stage(self,path):
        path=Path(path);remote='/sdcard/Download/'+path.name
        if self.ar.shell('if test -e '+shlex.quote(remote)+'; then echo PRESENT; else echo ABSENT; fi')!='ABSENT':raise extra.Inconclusive('Staged filename exists; no overwrite')
        item={'local':str(path),'remote':remote,'sha256':digest(path.read_bytes()),'retained':True};self.journal.data.setdefault('stagedFiles',[]).append(item);self.journal.save()
        self.ar.adb('push',path,remote)
        if self.ar.shell('sha256sum '+shlex.quote(remote)).split()[0]!=item['sha256']:raise extra.Inconclusive('Staged hash mismatch')
    def font_button(self,button='导入字体'):
        for attempt in range(5):
            windows,_,size=self.observe_all('font-role-'+str(attempt));node=choose_card_button(windows,'时钟',button)
            if node is not None:
                l,t,r,b=extra.rectangle(node)
                if 0<=l<r<=size[0] and 0<=t<b<=size[1]:self.hit('font-clock',node,size);return
            focused=[w for w in windows if w.get('active') and w.get('focused') and w.get('root',{}).get('package')=='ls.augment.com']
            if len(focused)!=1:raise extra.Inconclusive('Font page lost focus')
            scrolls=[n for n in self.ui.nodes(focused) if n.get('visible') and n.get('scrollable') and n.get('package')=='ls.augment.com']
            if len(scrolls)!=1:raise extra.Inconclusive('No unique native font-page scroll area')
            _,native,started=self.interaction_observation
            if time.monotonic()-started>5:raise extra.Inconclusive('Font-scroll evidence expired')
            interactive_window(windows,native,scrolls[0])
            l,t,r,b=extra.rectangle(scrolls[0]);x=(l+r)//2;self.ar.shell(f'input swipe {x} {t+(b-t)*3//4} {x} {t+(b-t)//3} 300');time.sleep(.4)
        raise extra.Inconclusive('Clock font control not reached by bounded scroll')
    def import_font(self,font):
        values={FONT:font_with(self.journal.data['baseline'][FONT],font['hash'])};self.before('font-ui',values);self.ui_original_config=self.raw_config()
        current_resources=self.resources();current_names=self.names();current_hash=current_resources.get(DIRS[1]+font['hash']+'.font')
        if font['alreadyImported']:
            display=current_names.get('font:'+font['hash'],'已导入字体 · '+font['hash'][-10:])
            names=[current_names.get('font:'+Path(p).stem,'已导入字体 · '+Path(p).stem[-10:]) for p in current_resources if p.startswith(DIRS[1]) and p.endswith('.font')]
            if current_hash!=font['hash'] or display!=font['displayName'] or names.count(display)!=1:raise extra.Inconclusive('Existing font identity/name changed before actual picker')
        elif current_hash is not None or 'font:'+font['hash'] in current_names:raise extra.Inconclusive('New font import no longer owns a missing resource/name')
        if not font['alreadyImported']:self.stage(font['path'])
        self.ar.shell('cmd statusbar collapse');self.ar.shell('am start -W -n ls.augment.com/.StatusBarAssetsActivity --es status_assets_page fonts --es status_surface main',root=True)
        if font['alreadyImported']:
            self.font_button('选择已导入字体');display=font['displayName']
            self.tap('existing-font',lambda n:n.get('package')=='ls.augment.com' and n.get('text') in (display,display+' · 正在使用',display+' · 草稿使用'))
        else:self.font_button();self.picker('font',Path(font['path']).name)
        self.tap('font-share',self.text('导入与分享'))
        self.ui_before_apply('font-apply-ui',values);self.tap('font-apply',self.text('应用到状态栏'));self.saved_ui('font');self.acknowledge('font-applied',values)
        if self.resources().get(DIRS[1]+font['hash']+'.font')!=font['hash']:raise extra.Inconclusive('Imported font hash mismatch')
        self.report['fontImport']={'protocol':'real main:clock existing-font picker and Apply' if font['alreadyImported'] else 'real main:clock FONT=302 DocumentsUI and Apply',
            'importPickerExercised':not font['alreadyImported'],'existingFileNeverReimported':font['alreadyImported'],'input':font,'clockPatternUnchanged':True};self.persist()
    def import_artwork(self,pack):
        values={ART:wifi.merge_theme(self.journal.data['baseline'][ART],pack['theme'])};self.before('artwork-ui',values);self.ui_original_config=self.raw_config();self.stage(pack['path'])
        self.ar.shell('cmd statusbar collapse');self.ar.shell('am start -W -n ls.augment.com/.StatusBarAssetsActivity --es status_assets_page share --es status_surface main',root=True)
        self.tap('artwork-import',self.text('导入素材包'));self.picker('artwork',Path(pack['path']).name)
        self.tap('artwork-preview',self.text('载入并预览'));self.tap('artwork-share',self.text('导入与分享'))
        self.ui_before_apply('artwork-apply-ui',values);self.tap('artwork-apply',self.text('应用到状态栏'));self.saved_ui('artwork');self.acknowledge('artwork-applied',values)
        resources=self.resources()
        if any(resources.get(DIRS[0]+h+'.asset')!=h for h in pack['hashes']):raise extra.Inconclusive('Imported image hash mismatch')
        self.report['artworkImport']=pack;self.persist()
    def exercise(self,case,font):
        self.capture('user-baseline')
        if case!='rows':self.import_font(font);self.capture('font-imported')
        if case=='assets-font-rows':
            inv=self.capture('artwork-prerequisites');pack=make_pack(inv,self.folder,self.journal.data['metadata']['runId'],self.journal.data['baseline'][ART]);existing=self.resources()
            if any(DIRS[0]+h+'.asset' in existing for h in pack['hashes']):raise extra.Inconclusive('Artwork already exists; no import over existing bytes')
            self.journal.data['inputs']['artwork']=pack;self.journal.save();self.import_artwork(pack);self.capture('assets-imported')
        for label,values in row_plan():self.set(label,values);self.capture(label)
        self.set('original-rows',{k:self.journal.data['baseline'][k] for k in (SYSTEM,NOTIFICATIONS)});inv=self.capture('original-rows')
        if dual_ready(inv):
            for label,value in [('dual-sim-off','0'),('dual-sim-on','1')]:
                if not dual_ready(self.capture(label+'-prerequisites')):self.report.setdefault('notObserved',[]).append({'case':label,'reason':'Two currently visible independent SIM members unavailable'});break
                self.set(label,{DUAL:value});self.capture(label)
            self.set('dual-sim-original',{DUAL:self.journal.data['baseline'][DUAL]})
        else:self.report.setdefault('notObserved',[]).append({'case':'dual-sim','reason':'Two visible independent SIM members unavailable; no forced visibility or composite changes'})
        self.report['status']='collected_pixel_review_required';self.persist()
    def restore(self):
        errors=[];data=self.journal.data;data['pending']=True;self.journal.save()
        try:
            current=self.instrument('snapshot','recovery-before')['settings'];changes={};external={}
            for key,original in data['restore'].items():
                if key not in KEYS or original!=data['baseline'].get(key):raise ValueError('Foreign recovery key/value')
                if not self.journal.owned_value(key,current.get(key)):external[key]=current.get(key)
                else:changes[key]=original
            if changes:self.instrument('set','recovery-set',changes)
            reads=[]
            for i in range(2):time.sleep(.7);reads.append(self.instrument('snapshot','recovery-readback-'+str(i))['settings'])
            diffs=[difference(data['baseline'],r) for r in reads];resources=self.resources();rd=resource_difference(data['resourcesBefore'],resources)
            nd=resource_difference(data['namesBefore'],self.names());native_ok=self.native()==data['metadata']['nativeBaseline']
            data.update(configurationRestored=not any(diffs),configurationDifferences=diffs,externalValuesPreserved=external,resourceDifferences=rd,nameDifferences=nd,nativeSettingsUnchanged=native_ok,
                retainedNewResources={k:v for k,v in resources.items() if k not in data['resourcesBefore']})
            if any(diffs) or external or rd or nd or not native_ok:raise extra.Inconclusive('Recovery mismatch; preserve journal and all files')
            if data['metadata'].get('case') in ('font-rows','assets-font-rows'):
                data['expected']=dict(data['restore']);data['inflight']={};self.journal.save()
                self.capture('restored-main')
            data['pending']=False;self.journal.save()
        except BaseException:errors.append(traceback.format_exc());self.journal.save()
        self.report.update(configurationRestored=data.get('configurationRestored',False),restorePending=data['pending'],cleanupErrors=errors,
            originalResourcesVerified=not data.get('resourceDifferences',True),originalNamesVerified=not data.get('nameDifferences',True),nativeSettingsUnchanged=data.get('nativeSettingsUnchanged',False),resourcesNeverDeleted=True,clockFormatAndNeighborsNeverWritten=True)
        self.persist()
        if errors:raise RuntimeError('Recovery pending; use exact --restore-only journal')
def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);parser.add_argument('--case',choices=('rows','font-rows','assets-font-rows'),default='rows')
    parser.add_argument('--test-apk',type=Path,default=ROOT/'android/app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk');args=parser.parse_args()
    import adb_regression as ar
    code,name=version(ar.shell('dumpsys package ls.augment.com'))
    if code!=args.expected_version:raise extra.Inconclusive('Exact installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());m=journal.data['metadata']
        if m['serial']!=ar.SERIAL or (m['installedVersion'],m['installedVersionName'])!=(code,name):raise extra.Inconclusive('Recovery device/build mismatch')
        if test_apk_hash(ar)!=m['testApkSha256']:raise extra.Inconclusive('Recovery test APK identity changed')
        report_file=journal.path.parent/'report.json'
        report=json.loads(report_file.read_text('utf-8')) if report_file.exists() else {'installedVersion':code,'case':m['case'],'cases':[],'status':'reconstructed_for_recovery','wholeFeaturePassed':False}
        Collector(ar,journal.path.parent,journal,report).restore();return
    local_test=digest(args.test_apk.read_bytes())
    if test_apk_hash(ar)!=local_test:raise extra.Inconclusive('Installed test APK differs from reviewed local artifact')
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    folder=extra.safe.AUDIT/('main-user-assets-%d-%s'%(code,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as out,contextlib.redirect_stdout(out):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=code or baseline.get('status')!='pass':raise extra.Inconclusive('Test APK module version mismatch')
    settings=baseline['settings']
    if len(settings)!=497:raise extra.Inconclusive('Expected reviewed 497-key schema')
    if settings.get(P+'systemui_master') not in ('1','true') or settings.get(P+'statusbar_position_size_only')!='0':raise extra.Inconclusive('Existing active customization is prerequisite; never forced')
    native={ns+'/'+k:ar.shell('settings --user 0 get '+ns+' '+k) for ns,ks in extra.NATIVE.items() for k in ks};native['global/wifi_on']=ar.shell('settings get global wifi_on');run_id=uuid.uuid4().hex[:12]
    # Entirely read-only preflight before a pending journal exists. Failure here
    # cannot strand a journal without the resource baseline needed for recovery.
    reader=Collector.__new__(Collector);reader.ar=ar
    resources_before=reader.resources();names_before=reader.names()
    journal=Journal(folder/'restore.json',settings,{'serial':ar.SERIAL,'installedVersion':code,'installedVersionName':name,'homeComponent':home,'nativeBaseline':native,'case':args.case,'runId':run_id,
        'collectorSha256':digest(Path(__file__).read_bytes()),'testApkSha256':local_test,'sourceZIPHashes':PACK_HASHES},resources_before=resources_before,names_before=names_before)
    report={'installedVersion':code,'case':args.case,'surface':'main','cases':[],'status':'prepared','wholeFeaturePassed':False,'mutatedKeys':sorted(KEYS),
        'preserved':['clock patterns/rows/size','grid and all neighbor visibility','height/margins','native radio/battery state','three-in-one composition'],
        'limits':['Current portrait/font/actual radio levels only','Rows change system/notification groups; not all grid components','Counters do not establish animation pixels','New resources and staged files retained; no deletion']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    # Establish recovery resources before any UI action or config mutation.
    journal.data.update(resourcesBefore=resources_before,namesBefore=names_before,inputs={});journal.save()
    try:
        collector.identity('preflight');font=None
        if args.case!='rows':
            _,files=checked_pack('noto-sans-1.0.0.zip');h=next(iter(files))
            existing=resources_before.get(DIRS[1]+h+'.font')
            if existing is not None and existing!=h:raise extra.Inconclusive('Existing font bytes do not match their content identity')
            if existing is None and 'font:'+h in names_before:raise extra.Inconclusive('Orphaned existing font name must not be overwritten by import')
            font={'hash':h,'sourceZIP':PACK_HASHES['noto-sans-1.0.0.zip'],'alreadyImported':existing is not None}
            if existing is not None:
                display=names_before.get('font:'+h,'已导入字体 · '+h[-10:])
                names=[names_before.get('font:'+Path(p).stem,'已导入字体 · '+Path(p).stem[-10:]) for p in resources_before if p.startswith(DIRS[1]) and p.endswith('.font')]
                if names.count(display)!=1:raise extra.Inconclusive('Existing-font display name is ambiguous; no guess')
                font['displayName']=display
            else:
                path=folder/('duo-main-font-'+run_id+'.ttf');path.write_bytes(files[h]);font['path']=str(path)
            journal.data['inputs']['font']=font;journal.save()
        collector.exercise(args.case,font)
    except BaseException:
        report['status']='inconclusive' if isinstance(__import__('sys').exc_info()[1],extra.Inconclusive) else 'failed';report['error']=traceback.format_exc();raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:
            ar.shell('cmd statusbar collapse');ar.shell('input keyevent KEYCODE_HOME');collector.persist()
            print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending']},ensure_ascii=False))
if __name__=='__main__':main()
