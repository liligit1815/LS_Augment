"""ADB helpers for observed UI actions and locally retained regression evidence."""
from pathlib import Path
import argparse
import base64
import json
import re
import shlex
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
ADB = Path.home() / 'AppData/Local/Android/Sdk/platform-tools/adb.exe'
SERIAL = '9125258103D6'
OUTPUT = ROOT / 'out/full-device-regression-20260908'
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

def adb(*args, timeout=40, check=True):
    command = [str(ADB), '-s', SERIAL, *map(str, args)]
    result = subprocess.run(command, capture_output=True, timeout=timeout)
    if check and result.returncode:
        raise RuntimeError(result.stderr.decode('utf-8', 'replace') + result.stdout.decode('utf-8', 'replace'))
    return result.stdout

def shell(command, root=False, timeout=40):
    return adb('shell', 'su -c ' + shlex.quote(command) if root else command, timeout=timeout).decode('utf-8', 'replace').strip()

def snapshot(label, verbose=True):
    if not re.fullmatch(r'[A-Za-z0-9_.-]+', label):
        raise ValueError('Invalid evidence label')
    folder = OUTPUT / label
    folder.mkdir(parents=True, exist_ok=True)
    if adb('shell', 'pm path ls.augment.regression.ui', check=False).strip():
        # UiAutomation's default mode temporarily suppresses the user's other
        # accessibility services. Our observer explicitly preserves them.
        from native_ui_helpers import all_windows
        windows = all_windows(label)
        applications = [w for w in windows if w.get('type') == 1 and w.get('root', {}).get('package')]
        selected = next((w for w in applications if w.get('active')), None)
        if selected is None:
            selected = next((w for w in windows if w.get('active')), applications[0] if applications else windows[0])
        hierarchy = ET.Element('hierarchy', {'rotation': '0'})
        def append_node(parent, value, index=0):
            if not value:
                return
            attrs = {'index': str(index), 'text': '' if value.get('text') == 'null' else value.get('text', ''),
                     'content-desc': '' if value.get('description') == 'null' else value.get('description', ''),
                     'resource-id': value.get('id', ''), 'class': value.get('class', ''),
                     'package': value.get('package', ''), 'bounds': value.get('bounds', '')}
            for source, target in [('clickable','clickable'), ('checkable','checkable'), ('checked','checked'),
                                   ('enabled','enabled'), ('focusable','focusable'), ('focused','focused'),
                                   ('scrollable','scrollable'), ('longClickable','long-clickable'),
                                   ('password','password'), ('selected','selected'), ('visible','visible-to-user')]:
                attrs[target] = str(value.get(source, False)).lower()
            child = ET.SubElement(parent, 'node', attrs)
            for i, descendant in enumerate(value.get('children', [])):
                append_node(child, descendant, i)
        append_node(hierarchy, selected['root'])
        raw = ET.tostring(hierarchy, encoding='utf-8', xml_declaration=True)
    else:
        remote = '/data/local/tmp/lsa-regression-window.xml'
        shell('uiautomator dump ' + remote, timeout=25)
        raw = adb('exec-out', 'cat ' + remote)
    (folder / 'window.xml').write_bytes(raw)
    (folder / 'screen.png').write_bytes(adb('exec-out', 'screencap -p'))
    (folder / 'activity.txt').write_text(shell('dumpsys activity activities'), encoding='utf-8')
    (folder / 'processes.txt').write_text(shell('ps -A -o PID,UID,NAME'), encoding='utf-8')
    (folder / 'device.json').write_text(json.dumps({
        'at': shell('date -Iseconds'), 'uptime': shell('cat /proc/uptime'),
        'model': shell('getprop ro.product.model'), 'sim': shell('getprop gsm.sim.state'),
        'system_server': shell('pidof system_server'), 'systemui': shell('pidof com.android.systemui')
    }, indent=2), encoding='utf-8')
    nodes = []
    for node in ET.fromstring(raw).iter('node'):
        if node.get('visible-to-user') == 'false':
            continue
        if node.get('text') or node.get('content-desc'):
            nodes.append({k: node.get(k, '') for k in ('text', 'content-desc', 'class', 'clickable', 'checked', 'bounds')})
    if verbose:
        print(json.dumps({'evidence': str(folder), 'nodes': nodes}, ensure_ascii=False))
    return folder

def tap(label, text):
    folder = snapshot(label + '-before', verbose=False)
    root = ET.fromstring((folder / 'window.xml').read_bytes())
    nodes = [n for n in root.iter('node') if n.get('visible-to-user') != 'false'
             and text in (n.get('text'), n.get('content-desc'))]
    if len(nodes) > 1:
        clickable = [n for n in nodes if n.get('clickable') == 'true']
        if len(clickable) == 1:
            nodes = clickable
    if len(nodes) != 1:
        raise RuntimeError(f'Expected one observed target for {text!r}, found {len(nodes)}')
    numbers = list(map(int, re.findall(r'\d+', nodes[0].get('bounds', ''))))
    if len(numbers) != 4 or numbers[2] <= numbers[0] or numbers[3] <= numbers[1]:
        raise RuntimeError('Target has no visible bounds')
    x, y = (numbers[0] + numbers[2]) // 2, (numbers[1] + numbers[3]) // 2
    shell(f'input tap {x} {y}')
    (folder / 'action.json').write_text(json.dumps({'action': 'tap', 'text': text, 'x': x, 'y': y}, ensure_ascii=False), encoding='utf-8')
    print(json.dumps({'action': 'tap', 'text': text, 'evidence': str(folder)}, ensure_ascii=False), flush=True)

def instrument(operation, label, values=None):
    command = 'am instrument -w -r -e operation ' + shlex.quote(operation) + ' -e label ' + shlex.quote(label)
    if values is not None:
        encoded = base64.b64encode(json.dumps(values, ensure_ascii=False).encode()).decode()
        command += ' -e values ' + shlex.quote(encoded)
    command += ' ls.augment.com.test/ls.augment.com.DeviceRegressionRunner'
    result = shell(command, timeout=180)
    folder = OUTPUT / label
    folder.mkdir(parents=True, exist_ok=True)
    (folder / 'instrumentation.txt').write_text(result, encoding='utf-8')
    if 'INSTRUMENTATION_RESULT: status=pass' not in result:
        raise RuntimeError(result)
    path = '/data/user/0/ls.augment.com/files/device-regression-results/' + label + '.json'
    raw = shell('cat ' + shlex.quote(path), root=True)
    report = json.loads(raw)
    (folder / 'result-private.json').write_text(raw, encoding='utf-8')
    print(json.dumps({k: v for k, v in report.items() if k not in ('settings', 'targets', 'rawRootPackages')}, ensure_ascii=False))
    return report

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('snapshot', 'tap', 'instrument'))
    parser.add_argument('label')
    parser.add_argument('value', nargs='?')
    args = parser.parse_args()
    if args.action == 'snapshot': snapshot(args.label)
    elif args.action == 'tap': tap(args.label, args.value)
    else: instrument(args.value, args.label)
