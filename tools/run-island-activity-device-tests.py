"""Phone-side fixture + observed SystemUI state; restores fixture settings and battery simulation."""
import json
from pathlib import Path
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import adb, shell, ADB, SERIAL
from native_ui_helpers import all_windows, nodes
from statusbar_device_helpers import require_systemui_build

OUT = Path(__file__).resolve().parents[1] / 'out/status-island-redesign-20445/runtime'
OUT.mkdir(parents=True, exist_ok=True)
selected=set(sys.argv[1:] or ['paused-start','lifecycle','notice-open','visibility','charging'])
checks = json.loads((OUT/'results.json').read_text(encoding='utf-8')) if sys.argv[1:] and (OUT/'results.json').is_file() else []


def check(name, yes, detail=None):
    checks[:]=[item for item in checks if item['name']!=name]
    checks.append({'name': name, 'pass': bool(yes), 'detail': detail})
    (OUT / 'results.json').write_text(json.dumps(checks, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(checks[-1], ensure_ascii=False), flush=True)
    if not yes:
        raise AssertionError(name)


def state():
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
    try:
        return next((n.text or '' for n in ET.fromstring(raw) if n.get('name') == 'ls_augment_island_state'), '')
    except ET.ParseError:
        return ''


def capture(name):
    (OUT / (name + '.png')).write_bytes(adb('exec-out', 'screencap', '-p'))


def wait_state(prefix, timeout=10):
    until = time.monotonic() + timeout
    while time.monotonic() < until:
        current = state()
        if current.startswith(prefix):
            return current
        time.sleep(.25)
    raise AssertionError('Expected ' + prefix + '; got ' + state())


def wait_at(start, second):
    while time.monotonic() < start + second:
        time.sleep(min(.3, start + second - time.monotonic()))


def fixture(name, **args):
    label = 'island20445-' + name
    command = [str(ADB), '-s', SERIAL, 'shell', 'am', 'instrument', '-w', '-r', '-e', 'operation', 'island-fixture', '-e', 'label', label]
    for key, value in args.items():
        command += ['-e', key, str(value)]
    command += ['ls.augment.com.test/ls.augment.com.DeviceRegressionRunner']
    log = (OUT / (name + '.log')).open('wb')
    process = subprocess.Popen(command, stdout=log, stderr=subprocess.STDOUT)
    return process, log, time.monotonic()


def finish(name, process, log):
    process.wait(timeout=75)
    log.close()
    text = (OUT / (name + '.log')).read_text(encoding='utf-8')
    check(name + '-fixture-restored', 'status=pass' in text and '"configurationRestored":true' in text)


def island_node(label):
    found = [n for n in nodes(all_windows('island20445-' + label)) if n.get('visible') and n.get('description', '').startswith('灵动岛：')]
    check(label + '-visible-capsule', len(found) == 1)
    box = list(map(int, re.findall(r'-?\d+', found[0]['bounds'])))
    return (box[0] + box[2]) // 2, (box[1] + box[3]) // 2


require_systemui_build('island20445-loaded')
shell('input keyevent KEYCODE_WAKEUP')
shell('wm dismiss-keyguard')
shell('cmd statusbar collapse')
shell('input keyevent KEYCODE_HOME')
original_timeout = shell('settings get system screen_off_timeout')
shell('settings put system screen_off_timeout 600000')
active = None
try:
    if 'paused-start' in selected:
        # Sticky plugged-in state and a pre-existing paused player must not create an activity.
        active = fixture('paused-start', seconds=20, initialState=2, noticeAfter=99)
        wait_at(active[2], 5)
        check('paused-session-does-not-pin', state() == 'idle', state())
        capture('01-idle-with-paused-session')
        finish('paused-start', *active[:2]); active = None

    if 'lifecycle' in selected:
        active = fixture('lifecycle', seconds=53, pauseAfter=12, resumeAfter=25, stopAfter=33, noticeAfter=36, noticeRemoveAfter=50)
        start = active[2]
        check('playing-appears', wait_state('activity=1').startswith('activity=1'))
        capture('02-music-compact')
        x, y = island_node('music')
        shell(f'input swipe {x} {y} {x} {y} 750')
        time.sleep(.5)
        expanded = list(nodes(all_windows('island20445-expanded')))
        check('long-press-expands-controls', any(n.get('visible') and (n.get('description') == '暂停' or n.get('text') == '暂停') for n in expanded))
        capture('03-music-expanded')
        shell('input keyevent KEYCODE_BACK')
        wait_at(start, 15)
        check('pause-grace-visible', state().startswith('activity=1') and 'playing=false' in state(), state())
        capture('04-pause-grace')
        wait_at(start, 23)
        check('pause-expires', state() == 'idle', state())
        capture('05-paused-idle')
        wait_at(start, 28)
        check('resume-reappears', state().startswith('activity=1') and 'playing=true' in state(), state())
        wait_at(start, 35)
        check('stop-disappears', state() == 'idle', state())
        wait_at(start, 39)
        check('new-notification-appears', state().startswith('activity=2'), state())
        capture('06-notification-compact')
        wait_at(start, 49)
        check('notification-expires', state() == 'idle', state())
        finish('lifecycle', *active[:2]); active = None

    if 'notice-open' in selected:
        active = fixture('notice-open', seconds=20, music=0, initialState=2, noticeAfter=3, noticeRemoveAfter=18)
        wait_state('activity=2')
        x, y = island_node('notice')
        shell(f'input tap {x} {y}')
        time.sleep(.8)
        resumed = [line.strip() for line in shell('dumpsys activity activities').splitlines() if 'topResumedActivity' in line]
        check('notification-tap-opens-source', any('ls.augment.com/.SettingsActivity' in line for line in resumed), resumed)
        check('opened-notification-clears', state() == 'idle', state())
        finish('notice-open', *active[:2]); active = None

    if 'visibility' in selected:
        active = fixture('visibility', seconds=29, statusHideAfter=7, statusShowAfter=15, noticeAfter=99)
        start=active[2]
        wait_state('activity=1')
        x,y=island_node('visibility')
        shell(f'input swipe {x} {y} {x} {y} 750')
        wait_at(start,10)
        check('alpha-hidden-island-idle',state()=='idle',state())
        hidden_nodes=list(nodes(all_windows('island20445-alpha-hidden')))
        check('alpha-hidden-dismisses-popup',not any(n.get('visible') and n.get('description')=='暂停' for n in hidden_nodes))
        capture('09-statusbar-hidden')
        wait_at(start,18)
        check('alpha-restored-without-new-media-event',state().startswith('activity=1'),state())
        capture('10-statusbar-restored')
        shell('input keyevent KEYCODE_SLEEP')
        check('screen-off-idle',wait_state('idle',8)=='idle',shell('dumpsys power').split('mWakefulness=')[1].splitlines()[0])
        shell('input keyevent KEYCODE_WAKEUP');shell('wm dismiss-keyguard')
        check('unlock-resumes-playing',wait_state('activity=1').startswith('activity=1'))
        finish('visibility',*active[:2]);active=None

    if 'charging' in selected:
        shell('dumpsys battery unplug')
        active = fixture('charging', seconds=22, music=0, initialState=2, noticeAfter=99)
        wait_at(active[2], 4)
        check('enabled-with-no-events-idle', state() == 'idle', state())
        shell('dumpsys battery set status 2')
        shell('dumpsys battery set usb 1')
        check('plug-edge-appears', wait_state('activity=3').startswith('activity=3'))
        capture('07-charging-hint')
        time.sleep(6)
        check('charging-expires-while-plugged', state() == 'idle', state())
        shell('dumpsys battery set level 76')
        time.sleep(1)
        check('battery-level-update-does-not-rearm', state() == 'idle', state())
        capture('08-charging-idle')
        finish('charging', *active[:2]); active = None
finally:
    # Allow the fixture's finally block to restore settings even when an observation fails.
    if active:
        active[0].wait(timeout=75)
        active[1].close()
    shell('dumpsys battery reset')
    if original_timeout == 'null':
        shell('settings delete system screen_off_timeout')
    else:
        shell('settings put system screen_off_timeout ' + original_timeout)
print('PASS: ' + str(len(checks)) + ' observed island checks', flush=True)
