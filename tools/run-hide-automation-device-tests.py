"""Screen events and Android per-user package states on the connected phone."""
import json
import time
from adb_regression import *

stage=sys.argv[1] if len(sys.argv)>1 else 'round5'
folder=OUTPUT/(stage+'-automation-results');folder.mkdir(exist_ok=True)
targets=json.loads(sys.argv[2]) if len(sys.argv)>2 else ['0:ls.augment.validation','999:ls.augment.regression.window1']
results=[]
def state():
    values={}
    for target in targets:
        user,package=target.split(':',1)
        raw=shell('dumpsys package '+package,root=True)
        line=next(x.strip() for x in raw.splitlines() if x.strip().startswith('User '+user+':'))
        if 'installed=true' not in line:raise AssertionError('Fixture must be installed: '+target)
        values[target]='hidden=true' in line
    return values

def cycle(name,enabled,scope,expected):
    instrument('set',stage+'-'+name+'-settings',{'ls_augment_hide_master':'1',
        'ls_augment_automation_enabled':'1' if enabled else '0','ls_augment_automation_scope':scope})
    instrument('hide-configure',stage+'-'+name+'-visible',{'targets':targets})
    assert not any(state().values())
    shell('input keyevent KEYCODE_WAKEUP');shell('wm dismiss-keyguard');time.sleep(1)
    shell('input keyevent KEYCODE_SLEEP');started=time.monotonic()
    try:
        while time.monotonic()-started<15:
            actual=state()
            if enabled and actual==expected:break
            time.sleep(.75)
        evidence=folder/name;evidence.mkdir(exist_ok=True)
        (evidence/'power.txt').write_text(shell('dumpsys power'),encoding='utf-8')
        record={'case':name,'enabled':enabled,'scope':scope,'expected':expected,'actual':actual,
                'elapsedSeconds':round(time.monotonic()-started,2),'status':'pass' if actual==expected else 'fail'}
        results.append(record)
        (folder/'results.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
        print(json.dumps(record),flush=True)
        assert actual==expected
    finally:
        shell('input keyevent KEYCODE_WAKEUP');shell('wm dismiss-keyguard')

try:
    cycle('AUTO-01-current-user',True,'current',{targets[0]:True,targets[1]:False})
    cycle('AUTO-02-all-users',True,'all',{targets[0]:True,targets[1]:True})
    cycle('AUTO-03-off',False,'current',{targets[0]:False,targets[1]:False})
finally:
    instrument('set',stage+'-automation-final-off',{'ls_augment_automation_enabled':'0','ls_augment_automation_scope':'current'})
    instrument('hide-configure',stage+'-automation-final-visible',{'targets':targets})
