"""Observe the same native macro in a fresh host and its warm follow-up."""
import hashlib
import json
import shlex
import sys
import time

from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from game_device_helpers import PACKAGE, COMPONENT, touch, input_events, capture
from native_ui_helpers import all_windows, nodes


label = sys.argv[1]
expected_rate = float(sys.argv[2])
count = int(sys.argv[3])
folder = OUTPUT / label
folder.mkdir(exist_ok=False)
baseline = json.loads((OUTPUT / 'round122a-macro-db/all-tables-private.json').read_text(encoding='utf-8'))
owned = next(row for row in baseline['record_motion'] if row['_id'] == 9)
assert owned['packageName'] == PACKAGE
source = adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(owned['path'])))
assert hashlib.sha256(source).hexdigest() == 'b3f77a3eb53e19901cd998ed42eddea9a914fb7159f28d394ebbe5dcf9c52f27'
motion = json.loads(source)
span = max(e['sampleEventTime'] for e in motion['events']) - min(e['sampleEventTime'] for e in motion['events'])
config = prefs('ls_augment_config_v2')
assert config['ls_augment_combo_speed_enabled'] == ('0' if expected_rate == 1 else '1')
if expected_rate != 1:
    assert float(config['ls_augment_combo_speed_rate']) == expected_rate
(folder / 'config.json').write_text(json.dumps(config, indent=2), encoding='utf-8')
# The caller has closed the previous toolbar, and requests a fresh actual host.
shell('am force-stop cn.nubia.gamehelpmodule', root=True)
assert not shell('pidof cn.nubia.gamehelpmodule || true')
shell('am start -W -n ' + COMPONENT + ' --es template_mode normal')
shell('am broadcast -a cn.nubia.gamelauncher.action.START_ONEKEYLINGK '
      '-n cn.nubia.gamehelpmodule/cn.nubia.gamehelper.GameAssistReceiver '
      '--es packagename ' + PACKAGE + ' --ei enable 1', root=True)
observed = list(nodes(all_windows(label + '-entry')))
if any(n.get('visible') and n.get('id') == 'cn.nubia.gamehelpmodule:id/close_home_page' for n in observed):
    touch(label + '-close-list', identity='cn.nubia.gamehelpmodule:id/close_home_page')
pid = shell('pidof cn.nubia.gamehelpmodule')
assert pid
cases = []
for index in range(count):
    before = input_events(label + '-before-' + str(index))
    touch(label + '-play-' + str(index), identity='cn.nubia.gamehelpmodule:id/link_view_0')
    # Observe a whole original-speed span too, so cold fallback is never mistaken
    # for lost events simply because the expected accelerated window ended.
    time.sleep(span / 1000 + 1.1)
    after = input_events(label + '-after-' + str(index))
    assert after[:len(before)] == before, 'Input log rotated; use raw evidence instead.'
    events = after[len(before):]
    downs = [e for e in events if e['action'] == 0]
    actual = downs[-1]['now'] - downs[0]['now'] if len(downs) > 1 else None
    expected = span / expected_rate
    current = shell('pidof cn.nubia.gamehelpmodule')
    unchanged = adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(owned['path']))) == source
    row = {
        'index': index, 'freshHostFirstPlay': index == 0, 'pid': current,
        'sameHost': current == pid, 'events': events,
        'actualSpanMs': actual, 'expectedSpanMs': expected,
        'sourceUnchanged': unchanged,
        'diagnostics': {k: v for k, v in prefs('ls_augment_diagnostics_v2').items() if 'combo' in k},
    }
    row['pass'] = (current == pid and len(events) == 8 and unchanged
                   and [e['action'] for e in events] == [0, 1] * 4
                   and [e['target'] for e in downs] == [0, 1, 0, 1]
                   and actual is not None and abs(actual - expected) <= max(50, expected * .05))
    cases.append(row)
    (folder / 'results.json').write_text(json.dumps(cases, indent=2), encoding='utf-8')
    (folder / 'hook-processes.json').write_text(json.dumps(prefs('hook-processes'), indent=2), encoding='utf-8')
    print({k: row[k] for k in ['index', 'pid', 'actualSpanMs', 'expectedSpanMs', 'pass']}, flush=True)
    if not row['pass']:
        break
(folder / 'logcat.txt').write_bytes(adb('logcat', '-d', '-v', 'epoch', '--pid=' + pid))
touch(label + '-native-close', identity='cn.nubia.gamehelpmodule:id/btn_playing_close')
capture(label + '-closed')
assert len(cases) == count and all(row['pass'] for row in cases), 'Actual playback mismatch; native toolbar closed.'
