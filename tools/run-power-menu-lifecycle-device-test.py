"""Observe power-menu dismissal across a SystemUI reload; never select a power action."""
import argparse,json,time
from pathlib import Path
import adb_regression as device

parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--label',default='power-menu-lifecycle-20444')
parser.add_argument('--cycles',type=int,default=2)
args=parser.parse_args()
assert args.label.replace('-','').replace('_','').isalnum()
device.OUTPUT=device.ROOT/'audit-output'/args.label
device.OUTPUT.mkdir(parents=True,exist_ok=True)
from adb_regression import shell,adb
from native_ui_helpers import all_windows,nodes

def capture(name):
    (device.OUTPUT/(name+'.png')).write_bytes(adb('exec-out','screencap','-p'))

def wake():
    # A freshly reloaded OEM SystemUI needs the screen transition to refresh its
    # interactive state before native volume/power windows can be requested.
    shell('input keyevent KEYCODE_SLEEP');time.sleep(.5)
    shell('input keyevent KEYCODE_WAKEUP');time.sleep(.6)
    shell('wm dismiss-keyguard');shell('input keyevent KEYCODE_HOME')

report={'cycles':[],'noPowerActionSelected':True}
try:
    for i in range(max(1,min(4,args.cycles))):
        wake();before=shell('pidof com.android.systemui')
        shell('input keyevent --longpress KEYCODE_POWER');time.sleep(.8)
        windows=all_windows(f'cycle-{i}-open')
        visible=[n for n in nodes(windows) if n.get('visible')]
        assert any(n.get('text')=='重启' for n in visible),'Native power menu did not open'
        capture(f'cycle-{i}-open')
        shell('input keyevent KEYCODE_BACK');time.sleep(.7)
        closed=all_windows(f'cycle-{i}-closed')
        assert not any(n.get('visible') and n.get('text')=='关机' for n in nodes(closed)),'Menu did not close'
        capture(f'cycle-{i}-closed')
        shell('killall com.android.systemui',root=True);time.sleep(3)
        capture(f'cycle-{i}-after-reload')
        after=all_windows(f'cycle-{i}-after-reload')
        unexpected=any(n.get('visible') and n.get('text') in ('关机','重启') for n in nodes(after))
        result={'cycle':i,'oldPid':before,'newPid':shell('pidof com.android.systemui'),
                'menuClosedBeforeReload':True,'unexpectedPowerMenuAfterReload':unexpected}
        report['cycles'].append(result)
        (device.OUTPUT/'result.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
        assert not unexpected,'Dismissed power menu reappeared after SystemUI reload'
    report['pass']=True
finally:
    shell('input keyevent KEYCODE_BACK');wake()
    (device.OUTPUT/'result.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps(report,ensure_ascii=False,indent=2))
