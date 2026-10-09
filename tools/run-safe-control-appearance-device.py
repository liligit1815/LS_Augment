"""Opt-in visual-only Control Center appearance audit. Never touches native controls."""
from pathlib import Path
import argparse, contextlib, datetime, hashlib, importlib.util, json, re, time, traceback
import xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('appearance_search',ROOT/'tools/run-safe-header-search-device.py')
search=importlib.util.module_from_spec(spec);spec.loader.exec_module(search)
extra=search.extra
P='ls_augment_rm_cc_'
ALLOWED={P+k:v for k,v in {
    'corners_enabled':('0','1'),'corner_radius_dp':('0','12','48'),
    'tile_fill_enabled':('0','1'),'tile_opacity':('0','50','100'),
    'tile_gradient':('0','1'),'tile_direction':('0','1','2'),
    'tile_color_light':('#145A32',),'tile_color_dark':('#145A32',),
    'tile_end_light':('#71309A',),'tile_end_dark':('#71309A',)}.items()}

class Journal(extra.Journal):
    kind='safe-control-appearance';mutable_keys=set(ALLOWED)
    def valid_values(self,values):
        return bool(values) and all(k in ALLOWED and v in ALLOWED[k] for k,v in values.items())

def panel_root(windows):
    focused=[w for w in windows if w.get('active') and w.get('focused')]
    if len(focused)!=1 or focused[0].get('root',{}).get('package')!='com.android.systemui':
        raise extra.Inconclusive('Unique focused SystemUI window absent')
    panels=[n for n,p in extra.walk(focused[0]['root']) if n.get('visible') and n.get('id')==extra.ID+'control_panel']
    if len(panels)!=1:raise extra.Inconclusive('Unique control panel absent')
    return panels[0]

def panel(windows):
    nodes=[n for n,p in extra.walk(panel_root(windows)) if n.get('visible')]
    # Geometry includes full observed labels, descriptions and native accessibility states.
    fields=('id','class','bounds','text','description','checked','selected','enabled','clickable','longClickable','checkable','rangeInfo','actionIds')
    geometry=[{k:n.get(k) for k in fields} for n in nodes]
    if not geometry:raise extra.Inconclusive('Control panel has no observable contents')
    return geometry

def control_signature(windows):
    """Keep raw geometry complete; only observed appearance surfaces gate stability."""
    roots={extra.ID+'top_panel',extra.ID+'control_center_all_tiles'}
    media=extra.ID+'control_center_media_container'
    required=roots|{media,extra.ID+'brightness_slider',extra.ID+'volume_slider'}
    nodes=[(n,p) for n,p in extra.walk(panel_root(windows)) if n.get('visible')]
    for identity in required:
        if sum(n.get('id')==identity for n,p in nodes)!=1:
            raise extra.Inconclusive('Required native appearance surface absent/ambiguous: '+identity)
    result=[]
    fields=('id','class','bounds','checkable','checked','selected','enabled','clickable','longClickable','rangeInfo','actionIds')
    for node,parents in nodes:
        ancestry={n.get('id') for n in parents}|{node.get('id')}
        if not ancestry&roots:continue
        # Media cover/title/progress can animate independently. Its actual card
        # and click targets still participate, including native button states.
        if media in ancestry and node.get('id')!=media and not node.get('clickable'):continue
        state={k:node.get(k) for k in fields}
        for field in ('text','description'):
            value=node.get(field)
            state[field]=None if value is None or value=='' or value=='null' else value
        result.append(state)
    if not result:raise extra.Inconclusive('No native appearance controls to compare')
    return result

def phase_plan(case):
    phases=[('both-off',{'corners_enabled':'0','tile_fill_enabled':'0'})]
    if case=='all':
        phases.extend([('corners-zero',{'corners_enabled':'1','corner_radius_dp':'0'}),
            ('corners-twelve',{'corner_radius_dp':'12'}),('corners-fortyeight',{'corner_radius_dp':'48'}),
            ('corners-off',{'corners_enabled':'0'})])
    elif case!='fill-only':raise ValueError('Unknown appearance case')
    phases.extend([('solid-full',{'tile_fill_enabled':'1','tile_opacity':'100','tile_gradient':'0',
        'tile_color_light':'#145A32','tile_color_dark':'#145A32','tile_end_light':'#71309A','tile_end_dark':'#71309A'}),
        ('solid-half',{'tile_opacity':'50'}),('solid-zero',{'tile_opacity':'0'}),
        ('gradient-horizontal',{'tile_opacity':'100','tile_gradient':'1','tile_direction':'0'}),
        ('gradient-vertical',{'tile_direction':'1'}),('gradient-diagonal',{'tile_direction':'2'}),
        ('both-off-again',{'corners_enabled':'0','tile_fill_enabled':'0'})])
    return phases

class Collector(extra.Collector):
    def capture(self,label):
        if self.native()!=self.journal.data['metadata']['nativeBaseline']:
            raise extra.Inconclusive('Native preferences changed externally')
        width,height=self.launcher(label)
        if width>=height:raise extra.Inconclusive('This isolated visual audit requires portrait')
        x=round(width*.85)
        self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(height*.66)));time.sleep(.7)
        previous=None
        for attempt in range(4):
            evidence=label+'-panel-'+str(attempt)
            windows,native,size=self.observe_all(evidence)
            try:
                geometry=panel(windows)
                signature=control_signature(windows)
                if signature==previous:
                    diagnostics={}
                    for retry in range(4):
                        raw=self.ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml',root=True)
                        try:
                            diagnostics={n.get('name'):n.text for n in ET.fromstring(raw) if 'cc_appearance' in n.get('name','') or 'systemui_last_error' in n.get('name','')};break
                        except ET.ParseError:
                            if retry==3:raise
                            time.sleep(.2)
                    row={'case':label,'evidence':evidence,'geometry':geometry,'stabilitySignature':signature,
                         'stabilityScope':'native tiles/sliders plus media container/click targets; excludes dynamic header',
                         'diagnostics':diagnostics,'pixelReviewRequired':True}
                    self.report['cases'].append(row);self.persist();return
                previous=signature
            except extra.Inconclusive:previous=None
            time.sleep(.4)
        raise extra.Inconclusive('Fresh stable control panel not observed')
    def exercise(self,case='all'):
        self.capture('user-baseline')
        for label,values in phase_plan(case):
            self.set(label,{P+k:v for k,v in values.items()});self.capture(label)

def main():
    parser=argparse.ArgumentParser(description=__doc__);mode=parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run',action='store_true');mode.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--case',choices=('all','fill-only'),default='all');args=parser.parse_args()
    import adb_regression as ar
    raw=ar.shell('dumpsys package ls.augment.com');version=int(re.search(r'\bversionCode=(\d+)',raw)[1]);name=re.search(r'\bversionName=([^\s]+)',raw)[1]
    if version!=args.expected_version:raise extra.Inconclusive('Installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve())
        if journal.data['metadata']['serial']!=ar.SERIAL or journal.data['metadata']['installedVersion']!=version:raise RuntimeError('Recovery identity mismatch')
        report=json.loads((journal.path.parent/'report.json').read_text(encoding='utf-8'))
        Collector(ar,journal.path.parent,journal,report).restore();return
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    folder=extra.safe.AUDIT/('control-appearance-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=version:raise extra.Inconclusive('Test APK mismatch')
    if baseline['settings'].get('ls_augment_systemui_master')!='1':raise extra.Inconclusive('SystemUI master must already be enabled')
    native={ns+'/'+k:ar.shell('settings --user 0 get '+ns+' '+k) for ns,keys in extra.NATIVE.items() for k in keys}
    journal=Journal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':name,
        'homeComponent':home,'nativeBaseline':native,'case':args.case,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()})
    report={'installedVersion':version,'features':['NEW-04','NEW-05'] if args.case=='all' else ['NEW-05'],
        'requestedCase':args.case,'cases':[],'status':'started','wholeFeaturePassed':False,
        'limits':['Current portrait theme/font only','No tile, slider or media controls operated','Active tile transitions not forced','Pixel review required; diagnostics are not visual proof']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:
        collector.exercise(args.case);report['status']='observed_visual_review_pending'
    except BaseException:
        report['status']='inconclusive' if isinstance(__import__('sys').exc_info()[1],extra.Inconclusive) else 'failed'
        report['error']=traceback.format_exc();raise
    finally:
        collector.persist()
        try:collector.restore()
        finally:
            ar.shell('cmd statusbar collapse');ar.shell('input keyevent KEYCODE_HOME');collector.persist()
            print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending']},ensure_ascii=False))

if __name__=='__main__':main()
