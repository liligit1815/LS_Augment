"""Finite E130 SAF steps; never synthesizes an exported document."""
import json
import shlex
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell
from game_device_helpers import capture, touch

CONFIG = '/data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml'


def raw_config():
    return adb('exec-out', 'su -c ' + shlex.quote('cat ' + CONFIG))


def prefs(raw):
    return {n.get('name'): (n.tag, (n.text or '') if n.tag == 'string' else n.get('value'))
            for n in ET.fromstring(raw)}


def import_document(label, letter, expected_path, confirm=True, picker_open=False):
    folder = OUTPUT / label
    folder.mkdir(exist_ok=True)
    before = raw_config()
    (folder / 'before-config.xml').write_bytes(before)
    (folder / 'start-ms.txt').write_text(shell('date +%s%3N'))
    if not picker_open:
        touch(label + '-open', text='导入配置')
        capture(label + '-picker')
    touch(label + '-choose', text='LSA-E278-130-' + letter + '.json')
    observed = capture(label + '-confirmation')
    dialogs = [n for n in observed if n.get('id') == 'android:id/alertTitle'
               and n.get('text') == '导入配置' and n.get('visible')]
    assert len(dialogs) == 1, 'Expected real validated import confirmation'
    prepared = raw_config()
    (folder / 'prepared-config.xml').write_bytes(prepared)
    assert prefs(before) == prefs(prepared), 'Preparation changed settings'
    touch(label + ('-confirm' if confirm else '-cancel'),
          identity='android:id/button1' if confirm else 'android:id/button2')
    expected = json.loads(expected_path.read_bytes())['settings']
    for _ in range(30):
        after = raw_config()
        actual = {k: v[1] for k, v in prefs(after).items()}
        if all(actual.get(k) == v for k, v in expected.items()):
            break
        time.sleep(.2)
    assert all(actual.get(k) == v for k, v in expected.items()), {
        k: [actual.get(k), v] for k, v in expected.items() if actual.get(k) != v}
    time.sleep(.7)
    after = raw_config()
    if not confirm:
        assert prefs(before) == prefs(after), 'Cancel changed raw settings'
    (folder / 'after-config.xml').write_bytes(after)
    (folder / 'mirror-private.json').write_text(
        shell('settings get global ls_augment_config_snapshot_v1'), encoding='utf-8')
    (folder / 'logcat-private.txt').write_bytes(adb('logcat', '-d', '-v', 'epoch'))
    returned = capture(label + '-returned')
    assert any(n.get('text') == '配置备份与重置' and n.get('visible') for n in returned)
    (folder / 'end-ms.txt').write_text(shell('date +%s%3N'))
    changes = {k: [prefs(before).get(k), prefs(after).get(k)]
               for k in prefs(before).keys() | prefs(after).keys()
               if prefs(before).get(k) != prefs(after).get(k)}
    result = {'document': letter, 'confirmed': confirm, 'preparedUnchanged': True,
              'expectedExportSettings': len(expected), 'matchedExpected': True,
              'rawChangedKeys': sorted(changes)}
    (folder / 'result.json').write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding='utf-8')
    print(result)
