"""Real OEM fan UI operations and read-only hardware/runtime observations."""
import json
import re
import time
import xml.etree.ElementTree as ET

from adb_regression import OUTPUT, shell
from module_ui_helpers import hierarchy, matches, tap, tap_node, visible


KEYS = ['ls_augment_game_master', 'ls_augment_fan_fixed_enabled',
        'ls_augment_fan_unlock_max', 'ls_augment_fan_target_rpm',
        'ls_augment_fan_calibration_request', 'ls_augment_fan_measurement']


def prefs(name):
    for attempt in range(5):
        try:
            return {n.get('name'): n.text or n.get('value') or '' for n in ET.fromstring(
                shell('/system/bin/cat /data/user/0/ls.augment.com/shared_prefs/' + name + '.xml', root=True))}
        except ET.ParseError:
            if attempt == 4:
                raise
            time.sleep(.1)


def sample():
    values = shell('cat /sys/kernel/fan/fan_enable /sys/kernel/fan/fan_speed_level '
                   '/sys/kernel/fan/fan_speed_count /sys/class/power_supply/battery/temp', root=True).splitlines()
    assert len(values) == 4, values
    result = dict(zip(['enable', 'level', 'rpm', 'batteryTenthsC'], map(int, values)))
    result.update({k: int(shell('settings get system fan_state_of_' + k)) for k in ['manual', 'mode']})
    config = prefs('ls_augment_config_v2')
    result['settings'] = {k: config.get(k, '') for k in KEYS}
    diagnostic = prefs('ls_augment_diagnostics_v2')
    result['diagnostics'] = {k: v for k, v in diagnostic.items() if 'fan_control' in k or 'fan_calibration' in k}
    result['at'] = shell('date -Iseconds')
    return result


def save(label):
    value = sample()
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    (folder / 'state.json').write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')
    return value


def open_module(label):
    shell('am start -W -n ls.augment.com/.SettingsActivity')
    for attempt in range(6):
        root = hierarchy(label + '-home' + str(attempt))
        if matches(root, '应用增强'):
            break
        shell('input keyevent 4')
    else:
        raise AssertionError('Module home not reached')
    tap(label + '-games', '游戏增强')
    tap(label + '-fan', '风扇固定转速')
    return hierarchy(label + '-page')


def open_native(label):
    # This ROM can route an external mode-activity launch back to settings.
    # Enter the mode picker through the actual OEM preference instead.
    shell('am start -W -n cn.nubia.fan/.components.GameFanSettingsActivity', root=True)
    root = hierarchy(label + '-native-settings')
    radios = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.RadioButton']
    if len(radios) != 2:
        tap(label + '-open-modes', '模式选择')
        root = hierarchy(label + '-native-page')
        radios = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.RadioButton']
    assert len(radios) == 2 and matches(root, '疾速散热') and matches(root, '均衡散热')
    return root


def native_enabled(label, desired):
    shell('am start -W -n cn.nubia.fan/.components.GameFanSettingsActivity', root=True)
    root = hierarchy(label + '-before')
    rows = [n for n in root.iter('node') if visible(n)
            and n.get('resource-id') == 'cn.nubia.fan:id/common_preference_layout'
            and any(c.get('text') == '散热风扇' for c in n.iter('node'))]
    assert len(rows) == 1
    switches = [n for n in rows[0].iter('node') if n.get('class') == 'android.widget.Switch' and visible(n)]
    assert len(switches) == 1
    if (switches[0].get('checked') == 'true') != desired:
        tap_node(label + '-toggle', switches[0])
    for _ in range(12):
        value = sample()
        if bool(value['enable']) == desired and ((value['rpm'] > 0) if desired else value['rpm'] == 0):
            return value
        time.sleep(.5)
    raise AssertionError('Native fan switch did not reach requested hardware state')


def native_mode(label, mode):
    assert mode in (0, 1)
    open_native(label)
    tap(label + '-choice', '疾速散热' if mode == 0 else '均衡散热')
    for _ in range(10):
        value = sample()
        if value['mode'] == mode:
            return value
        time.sleep(.5)
    raise AssertionError('OEM mode did not save')


def select_target(label, fraction):
    root = hierarchy(label + '-before')
    bars = [n for n in root.iter('node') if visible(n) and n.get('class') == 'android.widget.SeekBar']
    assert len(bars) == 1 and bars[0].get('enabled') == 'true'
    bounds = list(map(int, re.findall(r'\d+', bars[0].get('bounds'))))
    x = max(bounds[0] + 1, min(bounds[2] - 1, round(bounds[0] + fraction * (bounds[2] - bounds[0]))))
    y = (bounds[1] + bounds[3]) // 2
    shell(f'input tap {x} {y}')
    out = OUTPUT / label
    out.mkdir(exist_ok=True)
    (out / 'action.json').write_text(json.dumps({'node': bars[0].attrib, 'x': x, 'y': y, 'fraction': fraction}, ensure_ascii=False, indent=2), encoding='utf-8')


def texts(root):
    return [n.get('text') for n in root.iter('node') if visible(n) and n.get('text')]
