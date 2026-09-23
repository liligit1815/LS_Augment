"""Retain the visible status-bar nodes, screenshot and native window frame together."""
import json
import re
import time
import xml.etree.ElementTree as ET
from adb_regression import ROOT, OUTPUT, adb, shell, instrument
from native_ui_helpers import all_windows, nodes

IDS = ['clock', 'notifications', 'system_icons', 'battery', 'cpu', 'gpu', 'battery_temp', 'current', 'power', 'network']
DEFAULT_ZONES = ['LS', 'LS', 'RS', 'RS', 'L2', 'L2', 'C2', 'R2', 'R2', 'CS']


def require_systemui_build(label):
    """Package installation can finish before LSPosed replaces its loaded module cache."""
    expected = re.search(r'^versionName=(.+)$', (ROOT / 'android/version.properties').read_text(), re.M)[1].strip()
    deadline = time.monotonic() + 25
    while time.monotonic() < deadline:
        pid = int(shell('pidof com.android.systemui'))
        raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
        try:
            records = [json.loads(n.text) for n in ET.fromstring(raw) if n.tag == 'string' and n.text]
        except (ET.ParseError, json.JSONDecodeError):
            # The owner may be writing its telemetry while ADB reads it.
            time.sleep(.5)
            continue
        current = [d for d in records if d.get('pid') == pid and d.get('process') == 'com.android.systemui']
        if current:
            record = current[0]
            folder = OUTPUT / label;folder.mkdir(exist_ok=True)
            (folder / 'loaded-systemui.json').write_text(json.dumps(record, ensure_ascii=False, indent=2), encoding='utf-8')
            assert record['moduleVersion'] == expected, (record['moduleVersion'], expected, pid)
            print('Verified loaded SystemUI module:', expected, 'PID', pid, flush=True)
            return
        time.sleep(2)
    raise AssertionError('No current SystemUI module telemetry')

def grid(changes=None, only=None):
    result = ['SG2']
    for i, identity in enumerate(IDS):
        item = {'zone': DEFAULT_ZONES[i], 'order': i, 'size': 13 if i < 4 else 9, 'visible': i < 4 if only is None else identity in only}
        item.update((changes or {}).get(identity, {}))
        result.append(f"{identity},{item['zone']},{item['order']},{item['size']},{int(item['visible'])}")
    return ';'.join(result)

def configure(label, values):
    power = shell('dumpsys power')
    shell('input keyevent 224')
    if 'mWakefulness=Awake' not in power:
        shell('input keyevent 82')
    instrument('set', label + '-config', {'ls_augment_' + k: str(v) for k, v in values.items()})
    shell('am start -n ls.augment.com/.SettingsActivity')
    time.sleep(1.3)

def bounds(node):
    return list(map(int, re.findall(r'-?\d+', node['bounds'])))

def observe(label):
    observed = all_windows(label)
    folder = OUTPUT / label
    (folder / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    (folder / 'windows.txt').write_text(shell('dumpsys window windows'), encoding='utf-8')
    bars = [w for w in observed if any(n.get('id') == 'com.android.systemui:id/status_bar' for n in nodes([w]))]
    assert len(bars) == 1
    visible = [{k: v for k, v in n.items() if k != 'children'} for n in nodes(bars) if n.get('visible')]
    result = {'at': shell('date -Iseconds'), 'window': bars[0]['bounds'], 'nodes': visible}
    (folder / 'statusbar.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    return result

def by_id(observed, suffix):
    return [n for n in observed['nodes'] if n.get('id') == 'com.android.systemui:id/' + suffix]

def clock(observed):
    found = by_id(observed, 'clock')
    assert len(found) == 1
    return found[0]
