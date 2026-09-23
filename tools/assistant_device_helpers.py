"""Observe actual assistant UI routing through native touch and power inputs."""
import json
import re
import time
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from game_device_helpers import capture
from module_ui_helpers import find, tap_node, hierarchy, visible


def option(label, suffix, enabled):
    title = {'assist_gesture': '手势使用默认数字助理',
             'power_default_assistant': '长按电源打开默认助理'}[suffix]
    # The OEM assistant is a floating window that can obscure a newly opened
    # settings Activity. Dismiss only the currently observed test invocation.
    for attempt in range(3):
        nodes = capture(label + '-dismiss-native' + str(attempt))
        if not any(n.get('visible') and str(n.get('id', '')).startswith('com.zte.aiassistant:') for n in nodes):
            break
        shell('input keyevent 4')
        time.sleep(.5)
    shell('am start -W -f 0x10008000 -n ls.augment.com/.EnhancementSettingsActivity --es group system', root=True)
    for attempt in range(6):
        root = hierarchy(label + '-ready' + str(attempt))
        if any(visible(n) and n.get('class') == 'android.widget.ScrollView' for n in root.iter('node')):
            break
        time.sleep(1)
    else:
        raise AssertionError('Module settings page did not become ready')
    _, found = find(label, title)
    switches = [n for n in found if n.get('class') == 'android.widget.Switch']
    assert len(switches) == 1
    if (switches[0].get('checked') == 'true') != enabled:
        tap_node(label + '-toggle', switches[0])
    time.sleep(1)
    assert prefs('ls_augment_config_v2')['ls_augment_rm_' + suffix] == ('1' if enabled else '0')


def observe(label):
    nodes = capture(label)
    result = {
        'activity_assistant_visible': any(n.get('visible') and 'LS ASSISTANT TEST' in n.get('text', '') for n in nodes),
        'voice_assistant_visible': any(n.get('visible') and 'LS VOICE ASSISTANT TEST' in n.get('text', '') for n in nodes),
        'native_assistant_visible': any(n.get('visible') and str(n.get('id', '')).startswith('com.zte.aiassistant:') for n in nodes),
    }
    folder = OUTPUT / label
    (folder / 'state.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    (folder / 'config.json').write_text(json.dumps(prefs('ls_augment_config_v2'), indent=2), encoding='utf-8')
    for package, filename in [('assistant', 'shared_prefs/launches.xml'),
                              ('voiceassistant', 'files/session-events.jsonl')]:
        raw = adb('shell', 'su -c "/system/bin/cat /data/user/0/ls.augment.regression.' + package + '/' + filename + '"', check=False)
        (folder / (package + '-events.txt')).write_bytes(raw)
    print(label, json.dumps(result), flush=True)
    return result


def gesture(label):
    nodes = capture(label + '-before')
    found = [n for n in nodes if n.get('visible') and n.get('id') == 'com.android.systemui:id/home_handle']
    assert len(found) == 1
    bounds = list(map(int, re.findall(r'\d+', found[0]['bounds'])))
    x, y = (bounds[0] + bounds[2]) // 2, (bounds[1] + bounds[3]) // 2
    (OUTPUT / (label + '-before') / 'gesture-action.json').write_text(
        json.dumps({'observed': found[0], 'x': x, 'y': y, 'hold_ms': 900}, indent=2), encoding='utf-8')
    shell(f'input swipe {x} {y} {x} {y} 900')
    time.sleep(2)
    return observe(label)


def power(label):
    shell('input keyevent --duration 800 26')
    time.sleep(2)
    return observe(label)
