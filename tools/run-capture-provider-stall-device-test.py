"""Suspend only the module service briefly; prove SystemUI remains responsive and always resume it."""
import json
import re
import time
from adb_regression import *
from native_ui_helpers import nodes

folder=OUTPUT/'round15b-provider-stall';folder.mkdir(exist_ok=True)
before=shell('ls /data/anr',root=True).splitlines()
(folder/'anr-before.txt').write_text('\n'.join(before),encoding='utf-8')
shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard')
shell('am start -W --windowingMode 1 -n ls.augment.regression.window2/ls.augment.regression.ProbeActivity')
pid=shell('pidof ls.augment.com');assert re.fullmatch(r'\d+',pid),pid
paused=False;started=time.monotonic()
try:
    shell('kill -STOP '+pid,root=True);paused=True
    shell('kill -9 '+shell('pidof com.android.systemui'),root=True);time.sleep(3)
    shell('input keyevent 224');shell('input keyevent 82');shell('wm dismiss-keyguard');time.sleep(.5)
    shell('cmd statusbar expand-settings');time.sleep(.5)
    label='round15b-provider-stall-visible'
    t=time.monotonic()
    raw=shell('am instrument -w -r -e label '+label+' ls.augment.regression.ui/ls.augment.com.UiWindowRunner',timeout=6)
    elapsed=time.monotonic()-t
    (folder/'observer.txt').write_text(raw,encoding='utf-8')
    assert 'INSTRUMENTATION_RESULT: status=pass' in raw
    windows=json.loads(shell('cat /data/user/0/ls.augment.regression.ui/files/ui-windows/'+label+'.json',root=True))
    (folder/'windows-private.json').write_text(json.dumps(windows,ensure_ascii=False,indent=2),encoding='utf-8')
    visible=[n for n in nodes(windows['uiWindows']) if n.get('visible')]
    assert any(n.get('text')=='录屏' for n in visible), 'Control center did not render'
    (folder/'while-paused.png').write_bytes(adb('exec-out','screencap -p'))
    # Exceed the device's observed 8-second focus timeout while the provider is paused.
    remaining=12-(time.monotonic()-started)
    if remaining>0:time.sleep(remaining)
    shell('cmd statusbar collapse')
finally:
    if paused:shell('kill -CONT '+pid,root=True)
    (folder/'resume-confirmation.txt').write_text(shell('cat /proc/'+pid+'/status',root=True),encoding='utf-8')
time.sleep(3)
after=shell('ls /data/anr',root=True).splitlines()
(folder/'anr-after.txt').write_text('\n'.join(after),encoding='utf-8')
added=sorted(set(after)-set(before))
result={'pass':not added,'pausedModulePid':pid,'pauseSeconds':12,'observerSeconds':elapsed,
        'controlCenterRenderedWhileModulePaused':True,'newAnrFiles':added,'systemuiPid':shell('pidof com.android.systemui')}
(folder/'result.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps(result,ensure_ascii=False),flush=True)
assert not added,added
