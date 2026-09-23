"""Real-device airplane radio observations; raw network details stay local."""
import json
import re
import time
from adb_regression import OUTPUT, adb, shell
from fan_device_helpers import prefs
from module_ui_helpers import find, tap_node


def save(label):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    raw = {}
    for key, command in {
        'wifi': 'dumpsys wifi', 'wifi-status': 'cmd wifi status',
        'bluetooth': 'dumpsys bluetooth_manager', 'links': 'ip link',
        'global': 'settings list global', 'secure': 'settings --user 0 list secure',
        'usb': 'getprop sys.usb.config',
    }.items():
        raw[key] = shell(command)
        (folder / (key + '-private.txt')).write_text(raw[key], encoding='utf-8')
    active_ap = []
    for block in raw['wifi'].split('Dump of SoftApManager id=')[1:]:
        head = block[:600]
        if 'mIfaceIsUp: true' in head:
            active_ap.append({'id': head.splitlines()[0],
                'interface': re.search(r'mApInterfaceName: (\S+)', head)[1],
                'state': re.search(r'current StateMachine mode: (.+)', head)[1]})
    bt = re.search(r'^\s*state: (\w+)', raw['bluetooth'], re.M)
    result = {
        'airplane': dict(x.split('=', 1) for x in raw['global'].splitlines() if '=' in x).get('airplane_mode_on'),
        'wifi_enabled': 'Wifi is enabled' in raw['wifi-status'],
        'wifi_connected': 'Wifi is connected to' in raw['wifi-status'],
        'bluetooth_state': bt[1] if bt else None,
        'active_ap': active_ap,
        # This dump line reads the persisted global setting, not the tracker's
        # private mAirplaneModeOn. Observe STA/AP effects independently above.
        'persisted_airplane_dump': [x.strip() for x in re.findall(r'^AirplaneModeOn (.+)', raw['wifi'], re.M)],
    }
    (folder / 'state.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    (folder / 'module-config.json').write_text(json.dumps(prefs('ls_augment_config_v2'), indent=2), encoding='utf-8')
    print(label, json.dumps(result), flush=True)
    return result


def options(label, wifi, bluetooth):
    assert shell('settings get global airplane_mode_on') == '0'
    shell('am start -W -f 0x10008000 -n ls.augment.com/.EnhancementSettingsActivity --es group connections', root=True)
    time.sleep(2)
    for suffix, title, desired in [('wifi', '飞行模式保留 Wi-Fi 和热点', wifi),
                                    ('bluetooth', '飞行模式保留蓝牙', bluetooth)]:
        _, found = find(label + '-' + suffix, title)
        nodes = [n for n in found if n.get('class') == 'android.widget.Switch']
        assert len(nodes) == 1
        if (nodes[0].get('checked') == 'true') != desired:
            tap_node(label + '-toggle-' + suffix, nodes[0])
        time.sleep(1)
        assert prefs('ls_augment_config_v2')['ls_augment_rm_airplane_keep_' + suffix] == ('1' if desired else '0')


def airplane(enabled):
    shell('cmd connectivity airplane-mode ' + ('enable' if enabled else 'disable'), root=True)
    time.sleep(6)
    assert shell('settings get global airplane_mode_on') == ('1' if enabled else '0')


def prepare(label, wifi=True, bluetooth=True, hotspot=True):
    assert shell('settings get global airplane_mode_on') == '0'
    shell('cmd wifi stop-lohs', root=True)
    shell('cmd wifi set-wifi-enabled ' + ('enabled' if wifi else 'disabled'), root=True)
    shell('svc bluetooth ' + ('enable' if bluetooth else 'disable'), root=True)
    time.sleep(6)
    if hotspot:
        shell('cmd wifi start-lohs LSA-Local-106 wpa2 LSA106test6382 -b 2', root=True)
        time.sleep(3)
    result = save(label)
    assert result['wifi_enabled'] == wifi
    if wifi:
        assert result['wifi_connected']
    assert result['bluetooth_state'] == ('ON' if bluetooth else 'OFF')
    assert bool(result['active_ap']) == hotspot
    return result
