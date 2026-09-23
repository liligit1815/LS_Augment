"""Real window task observations for disposable non-resizable fixture applications."""
import re
import json
import time
import xml.etree.ElementTree as ET
from adb_regression import *

def stop_fixtures():
    for i in range(1,7):shell('am force-stop ls.augment.regression.window'+str(i))
    shell('am force-stop ls.augment.validation')

def launch_window(number,label):
    component=f'ls.augment.regression.window{number}/ls.augment.regression.ProbeActivity'
    result=shell('am start -n ls.augment.validation/.MainActivity --es component '+component)
    time.sleep(.5)
    return observe(label,result)

def observe(label,launch=''):
    folder=OUTPUT/label;folder.mkdir(exist_ok=True)
    raw=shell('dumpsys activity activities');(folder/'activity.txt').write_text(raw,encoding='utf-8')
    tasks={}
    pattern=r'\*\s+Task\{[^}\n]*#(\d+)[^}\n]*A=[^: \n]*:(ls\.augment\.regression\.window\d+)[^}\n]*mode=(\w+)[^}\n]*sz=(\d+)'
    for task,package,mode,size in re.findall(pattern,raw):
        if int(size)>0:tasks[task]={'taskId':int(task),'package':package,'mode':mode,'activities':int(size)}
    result={'tasks':list(tasks.values()),'freeformCount':sum(t['mode']=='freeform' for t in tasks.values()),'launchOutput':launch}
    (folder/'result.json').write_text(json.dumps(result,indent=2),encoding='utf-8')
    print(json.dumps({'label':label,**result}),flush=True)
    return result

def native_entry(number,label):
    package='ls.augment.regression.window'+str(number)
    result=shell('am start -W --windowingMode 1 -n '+package+'/ls.augment.regression.ProbeActivity')
    if 'Status: ok' not in result:raise AssertionError(result)
    time.sleep(.5);shell('input keyevent KEYCODE_APP_SWITCH')
    for attempt in range(3):
        folder=snapshot(label+'-recents-'+str(attempt),False)
        root=ET.fromstring((folder/'window.xml').read_bytes())
        candidates=[n for n in root.iter('node') if n.get('content-desc')=='LS ADB window-'+str(number)]
        if len(candidates)!=1:raise AssertionError('Expected the observed fixture task in Recents')
        bounds=list(map(int,re.findall(r'\d+',candidates[0].get('bounds'))))
        if bounds==[234,532,982,2185]:break
        if (bounds[0]+bounds[2])//2>608:shell('input swipe 1050 1400 350 1400 400')
        else:shell('input swipe 300 1400 1000 1400 400')
    assert bounds==[234,532,982,2185],bounds
    # The native small-window header button was identified on the captured
    # standard-style Recents screen and validated against the live task mode.
    (folder/'action.json').write_text(json.dumps({'action':'tap','basis':'visually inspected native small-window button','x':824,'y':435}),encoding='utf-8')
    shell('input tap 824 435');time.sleep(.8)
    return observe(label+'-result',result)
