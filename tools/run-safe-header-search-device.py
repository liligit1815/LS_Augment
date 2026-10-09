"""Opt-in search visibility and selected-app launch from a verified HOME backdrop.
No native settings or default apps change. Default search is never clicked.
"""
from pathlib import Path
import argparse,contextlib,datetime,hashlib,importlib.util,json,re,time,traceback
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('search_extras',ROOT/'tools/run-safe-header-extras-device.py')
extra=importlib.util.module_from_spec(spec);spec.loader.exec_module(extra)
SEARCH='ls_augment_rm_qs_search';TARGET='ls_augment_rm_qs_browser';APP='ls.augment.com'

class Journal(extra.Journal):
    kind='safe-header-search';mutable_keys={SEARCH,TARGET}
    def valid_values(self,values):
        return bool(values) and set(values)<=self.mutable_keys and all(
            v in (('1','2') if k==SEARCH else ('',APP)) for k,v in values.items())

def control(windows):
    focused=[w for w in windows if w.get('active') and w.get('focused') and w.get('root',{}).get('package')=='com.android.systemui']
    if len(focused)!=1:raise extra.Inconclusive('Control panel is not the unique focused SystemUI window')
    panels=[n for n,p in extra.walk(focused[0]['root']) if n.get('visible') and n.get('id')==extra.ID+'control_panel']
    if len(panels)!=1:raise extra.Inconclusive('Unique visible control panel absent')
    buttons=[n for n,p in extra.walk(panels[0]) if n.get('visible') and n.get('id')==extra.ID+'search_button'
             and any(a.get('id')==extra.ID+'cc_header' for a in p)]
    if len(buttons)>1:raise extra.Inconclusive('Ambiguous search control')
    return buttons[0] if buttons else None

class Collector(extra.Collector):
    def panel(self,label):
        native=self.native();baseline=self.journal.data['metadata']['nativeBaseline']
        if native!=baseline:raise extra.Inconclusive('Native settings changed externally; preserving them')
        w,h=self.launcher(label)
        if w>=h:raise extra.Inconclusive('Current portrait profile required')
        x=round(w*.85);self.ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(h*.66)));time.sleep(.7)
        previous=None
        for attempt in range(4):
            evidence=label+'-panel-'+str(attempt);windows,raw,size=self.observe_all(evidence)
            try:
                button=control(windows);signature=json.dumps(button,sort_keys=True)
                if signature==previous:
                    row={'case':label,'evidence':evidence,'button':button,'pixelReviewRequired':True}
                    self.report['cases'].append(row);self.persist();return button
                previous=signature
            except extra.Inconclusive:pass
            time.sleep(.4)
        raise extra.Inconclusive('Stable focused panel was not observed; no tap')
    def exercise(self):
        self.set('search-hidden',{SEARCH:'2',TARGET:''})
        if self.panel('search-hidden') is not None:raise AssertionError('Hidden search control remains visible')
        self.set('search-visible',{SEARCH:'1',TARGET:''})
        if self.panel('search-visible') is None:raise AssertionError('Requested search control absent')
        self.set('search-target',{SEARCH:'1',TARGET:APP})
        button=self.panel('search-target')
        if button is None:raise AssertionError('Target search control absent')
        # Every panel above begins from actual HOME focus, never from APP.
        self.click_observed('search-target-click',button)
        self.report['selectedTargetResult']=self.target('search-target',APP);self.persist()
        self.set('search-hidden-again',{SEARCH:'2',TARGET:''})
        if self.panel('search-hidden-again') is not None:raise AssertionError('Search failed to hide again')

def main():
    parser=argparse.ArgumentParser(description=__doc__);choice=parser.add_mutually_exclusive_group(required=True)
    choice.add_argument('--run',action='store_true');choice.add_argument('--restore-only',type=Path)
    parser.add_argument('--expected-version',type=int,required=True);args=parser.parse_args()
    import adb_regression as ar
    raw=ar.shell('dumpsys package '+APP);version=int(re.search(r'\bversionCode=(\d+)',raw)[1]);name=re.search(r'\bversionName=([^\s]+)',raw)[1]
    if version!=args.expected_version:raise extra.Inconclusive('Installed version mismatch')
    extra.gates(ar,args.restore_only)
    if args.restore_only:
        journal=Journal(args.restore_only.resolve());meta=journal.data['metadata']
        if meta['serial']!=ar.SERIAL or meta['installedVersion']!=version:raise RuntimeError('Recovery device/build mismatch')
        folder=journal.path.parent;report=json.loads((folder/'report.json').read_text(encoding='utf-8'))
        Collector(ar,folder,journal,report).restore();return
    home=extra.resolve_component(ar.shell('cmd package resolve-activity --brief --user 0 -a android.intent.action.MAIN -c android.intent.category.HOME'))
    if home.split('/')[0]==APP:raise extra.Inconclusive('Target app cannot also be HOME backdrop')
    folder=extra.safe.AUDIT/('header-search-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')));folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output):baseline=ar.instrument('snapshot','baseline')
    if baseline.get('moduleVersion')!=version:raise extra.Inconclusive('Test APK mismatch')
    native={ns+'/'+k:ar.shell('settings --user 0 get '+ns+' '+k) for ns,keys in extra.NATIVE.items() for k in keys}
    journal=Journal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':name,
        'homeComponent':home,'nativeBaseline':native,'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()})
    report={'installedVersion':version,'features':['V2-162','V2-163'],'cases':[],'status':'started','wholeFeaturePassed':False,
        'limits':['Portrait current theme/font only','Only selected module app clicked; no default browser/search click','Actual pixels require review']}
    collector=Collector(ar,folder,journal,report);collector.persist()
    try:collector.exercise();report['status']='observed_visual_review_pending'
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
