"""Explicit, reversible native header checks. No radio/tile actions or clock changes."""
from pathlib import Path
import argparse
import contextlib
import datetime
import importlib.util
import json
import re
import struct
import time
import traceback

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('safe_native',ROOT/'tools/run-safe-native-function-device.py')
safe=importlib.util.module_from_spec(spec);spec.loader.exec_module(safe)
P='ls_augment_rm_qs_'
PREFIX='com.android.systemui:id/'


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run',action='store_true')
    parser.add_argument('--expected-version',type=int,required=True)
    parser.add_argument('--restore-only',type=Path)
    args=parser.parse_args()
    if not args.run and not args.restore_only:parser.error('Use --run or --restore-only')
    import adb_regression as ar
    dump=ar.shell('dumpsys package ls.augment.com')
    version=int(re.search(r'\bversionCode=(\d+)',dump)[1])
    name=re.search(r'\bversionName=([^\s]+)',dump)[1]
    if version!=args.expected_version:raise RuntimeError('Installed version differs from requested version')
    if args.restore_only:
        journal=safe.Journal(args.restore_only.resolve())
        if journal.data['metadata']['serial']!=ar.SERIAL:raise RuntimeError('Different phone')
        report=json.loads((journal.path.parent/'report.json').read_text(encoding='utf-8'))
        safe.Runner(ar,journal.path.parent,journal,report).cleanup();return
    for pattern in ['native-safe-*/restore.json','header-safe-*/restore.json']:
        for path in safe.AUDIT.glob(pattern):
            if json.loads(path.read_text(encoding='utf-8')).get('pending'):raise RuntimeError('Restore pending run first: '+str(path))
    folder=safe.AUDIT/('header-safe-%d-%s'%(version,datetime.datetime.now().strftime('%Y%m%d-%H%M%S')))
    folder.mkdir();ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w',encoding='utf-8') as output:
        with contextlib.redirect_stdout(output):baseline=ar.instrument('snapshot','baseline')
    if baseline['moduleVersion']!=version:raise RuntimeError('Test APK mismatch')
    journal=safe.Journal(folder/'restore.json',baseline['settings'],{'serial':ar.SERIAL,'installedVersion':version,'installedVersionName':name})
    report={'installedVersion':version,'features':['V2-141','V2-142','V2-162','V2-163'],
            'cases':[],'wholeFeaturePassed':False,'visualReviewRequired':True,
            'limits':['Portrait/current theme and font only','No wall-clock/time-zone/calendar changes',
                      'Search opens only the Duo module; default search destination is not clicked',
                      'No radio, brightness, sound, notification-clear, or other tile action']}
    runner=safe.Runner(ar,folder,journal,report);runner.persist()
    system_keys=['time_12_24','screen_brightness','screen_brightness_mode']
    system_before={key:ar.shell('settings get system '+key) for key in system_keys}
    try:
        if not runner.runtime_current('com.android.systemui','loaded'):raise RuntimeError('Current SystemUI build is not loaded')
        def panel(label,expand=True):
            ar.shell('input keyevent KEYCODE_WAKEUP')
            ar.shell('wm dismiss-keyguard')
            if expand:
                ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
                ar.shell('cmd statusbar collapse');time.sleep(.7)
                png=ar.adb('exec-out','screencap -p')
                if png[:8]!=b'\x89PNG\r\n\x1a\n':raise RuntimeError('Display dimensions unavailable')
                width,height=struct.unpack('>II',png[16:24]);x=round(width*.85)
                ar.shell('input swipe %d 5 %d %d 650'%(x,x,round(height*.65)));time.sleep(.8)
            panels=[]
            for attempt in range(4):
                evidence=label if attempt==0 else label+'-settled-'+str(attempt)
                all_nodes=runner.observe(evidence)
                panels=[n for n in all_nodes if n.get('id')==PREFIX+'control_panel']
                if len(panels)==1:break
                time.sleep(.4)
            if len(panels)!=1:raise RuntimeError('Native control panel not uniquely visible')
            descendants=[n for n in runner.ui.nodes([{'root':panels[0]}]) if n.get('visible')]
            header=[{k:n.get(k) for k in ['id','text','description','bounds','clickable','enabled']}
                    for n in descendants if n.get('id') in [PREFIX+'clock',PREFIX+'date',PREFIX+'search_button']]
            clocks=[n for n in header if n['id']==PREFIX+'clock']
            if len(clocks)!=1:raise RuntimeError('Native panel clock not uniquely visible')
            result={'case':label,'evidence':evidence,'header':header,'clock':clocks[0]['text'],
                    'searchVisible':any(n['id']==PREFIX+'search_button' for n in header),
                    'deviceTime':ar.shell('date +%H:%M:%S')}
            report['cases'].append(result);runner.persist();return result
        def clock(label,seconds,period):
            runner.set(label,{P+'clock_seconds':str(seconds),P+'clock_period':str(period)})
            return panel(label)
        clock('clock-off',0,0)
        samples=[clock('seconds-on-0',1,0)]
        for i in (1,2):time.sleep(1.1);samples.append(panel('seconds-on-'+str(i),False))
        texts=[re.search(r'\d{1,2}:\d{2}:\d{2}',sample['clock']) for sample in samples]
        if not all(texts) or len({match[0] for match in texts})!=3:raise AssertionError('Three changing native second values were not observed')
        panel('seconds-reopened')
        clock('period-only',0,1)
        clock('seconds-and-period',1,1)
        last=clock('clock-off-again',0,0)
        if re.search(r'\d{1,2}:\d{2}:\d{2}',last['clock']):raise AssertionError('Native seconds did not turn off')
        runner.set('search-visible',{P+'search':'1',P+'browser':''})
        if not panel('search-visible')['searchVisible']:raise AssertionError('Search icon not visible')
        runner.set('search-hidden',{P+'search':'2'})
        if panel('search-hidden')['searchVisible']:raise AssertionError('Search icon not hidden')
        runner.set('search-duo',{P+'search':'1',P+'browser':'ls.augment.com'})
        panel('search-duo')
        runner.tap('search-duo-click',identity=PREFIX+'search_button')
        target=[]
        for i in range(6):
            target=runner.observe('search-duo-result-'+str(i))
            if any(n.get('package')=='ls.augment.com' for n in target):break
            time.sleep(.3)
        else:raise AssertionError('Search did not open the selected module application')
        report['searchTargetObserved']='ls.augment.com'
        report['status']='observed_visual_review_pending'
    except BaseException:
        report['status']='failed';report['error']=traceback.format_exc();raise
    finally:
        ar.shell('cmd statusbar collapse')
        report['nativeSettingsUnchanged']={key:ar.shell('settings get system '+key) for key in system_keys}==system_before
        runner.persist();runner.cleanup()
        print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),'pending':journal.data['pending']},ensure_ascii=False))


if __name__=='__main__':main()
