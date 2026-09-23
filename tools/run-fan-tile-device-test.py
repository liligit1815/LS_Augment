"""Exercise the actual SystemUI fan selection strip and read back hardware state."""
import json
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET
from pathlib import Path

OUT = Path('outputs/fan-tile-fixed-20349')
OUT.mkdir(exist_ok=True)

def adb(*args):
    return subprocess.check_output(['adb', *args], timeout=35)

def shell(command, root=False):
    return adb('shell', *(['su', '-c', command] if root else [command])).decode('utf-8').strip()

def sample():
    raw = shell('cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level /sys/kernel/fan/fan_speed_count', True)
    result = dict(zip(['enable', 'level', 'rpm'], map(int, raw.split())))
    for name in ['ls_augment_config_v2', 'ls_augment_diagnostics_v2']:
        xml = shell('cat /data/user/0/ls.augment.com/shared_prefs/' + name + '.xml', True)
        result[name] = {n.get('name'): n.text or n.get('value') or '' for n in ET.fromstring(xml)
                        if 'fan_' in n.get('name', '') or n.get('name') == 'ls_augment_game_master'}
    result['mode'] = shell('settings get system fan_state_of_mode')
    result['manual'] = shell('settings get system fan_state_of_manual')
    result['at'] = time.time()
    return result

def walk(node):
    yield node
    for child in node.get('children', []):
        yield from walk(child)

def capture(label):
    shell('am instrument -w -r -e label fan-tile-check ls.augment.regression.ui/ls.augment.com.UiWindowRunner')
    value = json.loads(shell('cat /data/user/0/ls.augment.regression.ui/files/ui-windows/fan-tile-check.json', True))
    (OUT / (label + '-ui.json')).write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')
    (OUT / (label + '.png')).write_bytes(adb('exec-out', 'screencap', '-p'))
    return [n for w in value['uiWindows'] for n in walk(w['root']) if n.get('visible')]

def click(label, text):
    nodes = capture(label + '-before')
    found = [n for n in nodes if n.get('description') == text or n.get('text') == text]
    assert len(found) == 1, (text, [(n.get('text'), n.get('description')) for n in nodes])
    bounds = list(map(int, re.findall(r'-?\d+', found[0]['bounds'])))
    shell(f'input tap {(bounds[0]+bounds[2])//2} {(bounds[1]+bounds[3])//2}')

def level(target, label):
    nodes = capture(label + '-before')
    sliders = [n for n in nodes if n.get('description') == '固定档位拖拽条']
    if not sliders:
        click(label + '-fixed', '固定档位')
        time.sleep(2)
        nodes = capture(label + '-expanded')
        sliders = [n for n in nodes if n.get('description') == '固定档位拖拽条']
    assert len(sliders) == 1, sliders
    x1, y1, x2, y2 = map(int, re.findall(r'-?\d+', sliders[0]['bounds']))
    density = int(re.findall(r'\d+', shell('wm density'))[-1]) / 160
    padding = round(15 * density)
    current = max(1, int(sample()['ls_augment_config_v2'].get('ls_augment_fan_fixed_level', '1')))
    start = round(x1 + padding + (x2-x1-2*padding) * (current-1) / 4)
    end = round(x1 + padding + (x2-x1-2*padding) * (target-1) / 4)
    shell(f'input swipe {start} {(y1+y2)//2} {end} {(y1+y2)//2} 550')
    samples = []
    streak = 0
    deadline = time.monotonic() + 35
    while time.monotonic() < deadline:
        value = sample(); samples.append(value)
        diag = value['ls_augment_diagnostics_v2'].get('ls_augment_fan_control_active', '')
        config = value['ls_augment_config_v2']
        good = value['enable'] == 1 and value['level'] == target and value['rpm'] > 500 \
            and diag.startswith('controlled;kind=fixed_level;') \
            and ';selection=' + config['ls_augment_fan_tile_request'] + ';' in diag
        streak = streak + 1 if good else 0
        if streak >= 3: break
        time.sleep(.7)
    result = {'target': target, 'pass': streak >= 3, 'samples': samples}
    (OUT / (label + '-result.json')).write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    nodes = capture(label + '-after')
    result['selectedUi'] = any(n.get('text') == '固定档位' and n.get('checked') for n in nodes) \
        and all(not n.get('checked') for n in nodes if n.get('text') in ['均衡散热', '疾速散热'])
    result['appliedUi'] = any('已生效' in (n.get('text') or '') for n in nodes)
    (OUT / (label + '-result.json')).write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'case': label, 'pass': result['pass'], 'selectedUi': result['selectedUi'], 'appliedUi': result['appliedUi'], 'level': value['level'], 'rpm': value['rpm']}, flush=True)
    assert result['pass'] and result['selectedUi'] and result['appliedUi'], result

def native(mode, label):
    name = '均衡散热' if mode == 1 else '疾速散热'
    click(label, name)
    samples = []
    for _ in range(25):
        value = sample(); samples.append(value)
        cfg = value['ls_augment_config_v2']
        diag = value['ls_augment_diagnostics_v2'].get('ls_augment_fan_control_active', '')
        if value['mode'] == str(mode) and cfg['ls_augment_fan_fixed_enabled'] == '0' \
                and 'kind=fixed_level' not in diag and value['enable'] == 1:
            time.sleep(2); break
        time.sleep(.7)
    nodes = capture(label + '-after')
    checked = [n.get('text') for n in nodes if n.get('checked') and n.get('text') in ['均衡散热', '疾速散热', '固定档位']]
    passed = checked == [name] and not any(n.get('description') == '固定档位拖拽条' for n in nodes) \
        and value['mode'] == str(mode) and cfg['ls_augment_fan_fixed_enabled'] == '0'
    result = {'pass': passed, 'checked': checked, 'samples': samples}
    (OUT / (label + '-result.json')).write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print({'case': label, 'pass': passed, 'checked': checked, 'level': value['level']}, flush=True)
    assert passed, result

def toggle(enabled, label):
    nodes = capture(label + '-before')
    switches = [n for n in nodes if n.get('class') == 'android.widget.Switch' and n.get('id', '').endswith('toggle')]
    assert len(switches) == 1, switches
    if switches[0].get('checked') != enabled:
        x1, y1, x2, y2 = map(int, re.findall(r'-?\d+', switches[0]['bounds']))
        shell(f'input tap {(x1+x2)//2} {(y1+y2)//2}')
    samples = []
    streak = 0
    for _ in range(25):
        v = sample(); samples.append(v)
        good = bool(v['enable']) == enabled and (v['rpm'] > 500 if enabled else v['rpm'] == 0)
        streak = streak + 1 if good else 0
        if streak >= 3: break
        time.sleep(.7)
    result = {'pass': streak >= 3, 'samples': samples}
    (OUT / (label + '-result.json')).write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    capture(label + '-after')
    print({'case': label, 'pass': result['pass'], 'rpm': v['rpm']}, flush=True)
    assert result['pass'], result

if __name__ == '__main__':
    if sys.argv[1] == 'levels':
        (OUT / 'test-baseline.json').write_text(json.dumps(sample(), ensure_ascii=False, indent=2), encoding='utf-8')
        for i, target in enumerate([1, 2, 3, 4, 5, 1, 5, 4]):
            level(target, f'slider-{i+1}-{target}')
    elif sys.argv[1] == 'level':
        level(int(sys.argv[2]), sys.argv[3])
    elif sys.argv[1] == 'capture':
        print([(n.get('text'), n.get('description'), n.get('bounds')) for n in capture(sys.argv[2]) if n.get('text') or n.get('description')])
    elif sys.argv[1] == 'native':
        native(int(sys.argv[2]), sys.argv[3])
    elif sys.argv[1] == 'transitions':
        native(1, 'native-balanced')
        level(3, 'balanced-to-fixed3')
        native(0, 'native-extreme')
        level(2, 'extreme-to-fixed2')
        toggle(False, 'fixed-off')
        toggle(True, 'fixed-on')
        level(2, 'fixed-resume2')
        native(1, 'restore-balanced')
    elif sys.argv[1] == 'reopen':
        level(2, 'reopen-fixed2')
        shell('input keyevent 4')
        time.sleep(1)
        nodes = capture('reopen-collapsed')
        assert any(n.get('text') == '固定二档' for n in nodes), 'Collapsed tile did not refresh'
        shell('input swipe 998 1570 998 1570 650')
        time.sleep(3)
        nodes = capture('reopen-expanded')
        result = {'pass': any(n.get('description') == '固定档位拖拽条' for n in nodes)
                  and any(n.get('text') == '固定档位' and n.get('checked') for n in nodes)
                  and any('已生效' in (n.get('text') or '') for n in nodes), 'sample': sample()}
        (OUT / 'reopen-result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
        assert result['pass'], result
        print({'case': 'reopen', 'pass': True}, flush=True)
        native(1, 'final-balanced')
        time.sleep(5)
        final = sample()
        assert final['ls_augment_config_v2']['ls_augment_fan_fixed_enabled'] == '0'
        assert final['mode'] == '1' and final['enable'] == 1
        assert 'kind=fixed_level' not in final['ls_augment_diagnostics_v2']['ls_augment_fan_control_active']
        (OUT / 'final-state.json').write_text(json.dumps(final, ensure_ascii=False, indent=2), encoding='utf-8')
