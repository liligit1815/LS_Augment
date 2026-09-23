"""Change the real rate slider and measure actual OEM-injected target touches."""
import argparse
import hashlib
import json
import re
import time
from game_device_helpers import *
from module_ui_helpers import hierarchy, visible, tap_node
from fan_device_helpers import prefs

parser = argparse.ArgumentParser()
parser.add_argument('stage')
parser.add_argument('--cases', default='10,off,2,5,10,1')
args = parser.parse_args()
out = OUTPUT / args.stage
out.mkdir(exist_ok=True)
assert not (out / 'results.json').exists()
original = (OUTPUT / 'round44x-record-source/owned-motion-original.json').read_bytes()
motion = json.loads(original)
source_span = max(e['sampleEventTime'] for e in motion['events']) - min(e['sampleEventTime'] for e in motion['events'])
saved_rows = json.loads((OUTPUT / 'round44v-saved-native/rows-private.json').read_text(encoding='utf-8'))['record_motion']
owned = next(r for r in saved_rows if r['packageName'] == PACKAGE)
cases = []


def configure(label, value):
    shell('am start -W -n ls.augment.com/.FeatureActivity --es module combo_speed', root=True)
    root = hierarchy(label + '-page')
    enabled = value != 'off'
    switches = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.Switch']
    assert len(switches) == 1
    if (switches[0].get('checked') == 'true') != enabled:
        tap_node(label + '-switch', switches[0])
        root = hierarchy(label + '-switched')
    if enabled:
        bars = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.SeekBar']
        assert len(bars) == 1
        b = list(map(int, re.findall(r'\d+', bars[0].get('bounds'))))
        x = round(b[0] + 5 + (b[2] - b[0] - 10) * (int(value) - 1) / 9)
        y = (b[1] + b[3]) // 2
        shell(f'input tap {x} {y}')
        (OUTPUT / (label + '-page') / 'slider-action.json').write_text(
            json.dumps({'bounds': b, 'x': x, 'y': y, 'requestedRate': value}), encoding='utf-8')
    hierarchy(label + '-saved')
    config = prefs('ls_augment_config_v2')
    assert config['ls_augment_combo_speed_enabled'] == ('1' if enabled else '0')
    if enabled:
        assert config['ls_augment_combo_speed_rate'] == value
    return {k: config[k] for k in ('ls_augment_game_master', 'ls_augment_combo_speed_enabled', 'ls_augment_combo_speed_rate')}


def open_playback(label):
    shell('am start -W -n ' + COMPONENT)
    shell('am broadcast -a cn.nubia.gamelauncher.action.START_ONEKEYLINGK '
          '-n cn.nubia.gamehelpmodule/cn.nubia.gamehelper.GameAssistReceiver '
          '--es packagename ' + PACKAGE + ' --ei enable 1', root=True)
    observed = list(nodes(all_windows(label + '-native-entry')))
    if any(n.get('visible') and n.get('id') == 'cn.nubia.gamehelpmodule:id/close_home_page' for n in observed):
        touch(label + '-close-list', identity='cn.nubia.gamehelpmodule:id/close_home_page')


for index, value in enumerate(args.cases.split(',')):
    label = args.stage + '-' + str(index) + '-' + value
    config = configure(label, value)
    open_playback(label)
    marker = max((e['now'] for e in input_events(label + '-before')), default=0)
    touch(label + '-trigger', identity='cn.nubia.gamehelpmodule:id/link_view_0')
    rate = 1 if value == 'off' else int(value)
    time.sleep(source_span / 1000 / rate + 1.5)
    events = [e for e in input_events(label + '-after') if e['now'] > marker]
    downs = [e for e in events if e['action'] == 0]
    actual = downs[-1]['now'] - downs[0]['now'] if len(downs) > 1 else None
    expected = source_span / rate
    unchanged = adb('exec-out', 'su -c ' + shlex.quote('cat ' + shlex.quote(owned['path']))) == original
    passed = (len(events) == 8 and [e['target'] for e in downs] == [0, 1, 0, 1]
              and [e['action'] for e in events] == [0, 1] * 4 and actual is not None
              and abs(actual - expected) <= max(50, expected * .05) and unchanged)
    result = {'value': value, 'settings': config, 'actualSpanMs': actual, 'expectedSpanMs': expected,
              'actualRate': source_span / actual if actual else None, 'sourceUnchanged': unchanged,
              'sourceSha256': hashlib.sha256(original).hexdigest(), 'events': events, 'pass': passed}
    cases.append(result)
    (out / 'results.json').write_text(json.dumps({'pass': all(c['pass'] for c in cases), 'complete': False,
        'cases': cases}, indent=2), encoding='utf-8')
    capture(label + '-actual')
    print({k: result[k] for k in ('value', 'actualSpanMs', 'expectedSpanMs', 'actualRate', 'sourceUnchanged', 'pass')}, flush=True)
    assert passed, 'Actual playback failed; evidence retained in ' + str(out)

current = database(args.stage + '-native-final', '/data/user/0/cn.nubia.gamehelpmodule/databases',
                   'recordmotion.db', ['record_motion'])['record_motion']
known = {r['_id']: r for r in saved_rows if r['packageName'] != PACKAGE}
originals_same = all(next(r for r in current if r['_id'] == identity) == row for identity, row in known.items())
assert originals_same
(out / 'results.json').write_text(json.dumps({'pass': True, 'complete': True, 'cases': cases,
    'originalSixRowsUnchanged': originals_same}, indent=2), encoding='utf-8')
