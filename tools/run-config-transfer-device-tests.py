"""Exercise the real document picker and import confirmation, then verify device settings."""
import json
import re
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, shell, snapshot as device_snapshot, tap as device_tap

stage = sys.argv[1] if len(sys.argv) > 1 else 'round2'
assert re.fullmatch(r'[A-Za-z0-9_.-]+', stage)
def label(value): return value.replace('round2', stage, 1)
def snapshot(name, **kwargs): return device_snapshot(label(name), **kwargs)
def tap(name, text): return device_tap(label(name), text)

folder = OUTPUT / (stage + '-config-transfer-results')
folder.mkdir(parents=True, exist_ok=True)
results = []

def values():
    raw = shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml', root=True)
    return {n.get('name'): n.text or '' for n in ET.fromstring(raw) if n.tag == 'string'}

def check(case, passed, detail):
    results.append({'case': case, 'status': 'pass' if passed else 'fail', 'detail': detail})
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(results[-1], ensure_ascii=False), flush=True)
    if not passed:
        snapshot('round2-transfer-failure', verbose=False)
        raise AssertionError(case)

def select(name, already_open=False):
    if not already_open:
        tap('round2-import-' + name + '-open', '导入配置')
    tap('round2-import-' + name + '-select', 'LSA-regression-' + name + '-20260908.json')
    return snapshot('round2-import-' + name + '-selected', verbose=False)

before = values()
select('valid', already_open=True)
tap('round2-import-cancel', '取消')
check('CONFIG-01-cancel', values() == before, 'Cancelling validated import leaves every stored setting unchanged')
select('valid')
tap('round2-import-valid-confirm', '导入')
deadline = time.monotonic() + 15
while time.monotonic() < deadline:
    current = values()
    if current.get('ls_augment_tile_label') == 'ADB_IMPORT_OK':
        break
    time.sleep(.2)
check('CONFIG-02-valid-import', current.get('ls_augment_tile_label') == 'ADB_IMPORT_OK'
      and current.get('ls_augment_store_download_count') == '11', 'Actual document import updates both selected parameters')
select('valid-target')
tap('round2-import-valid-target-confirm', '导入')
deadline = time.monotonic() + 15
while time.monotonic() < deadline:
    current = values()
    if current.get('ls_augment_tile_label') == 'ADB_TARGET_IMPORT': break
    time.sleep(.2)
check('CONFIG-02b-valid-target-and-settings', current.get('ls_augment_tile_label') == 'ADB_TARGET_IMPORT'
      and current.get('ls_augment_hide_targets_v2') == '0:ls.augment.validation', 'Selection and feature settings are imported together')
for name, case in [('invalid-key', 'CONFIG-03-unknown-key'), ('missing-image', 'CONFIG-04-missing-image')]:
    baseline = values()
    screen = select(name)
    xml = (screen / 'window.xml').read_text(encoding='utf-8')
    check(case, values() == baseline and '已校验 ' not in xml, 'Rejected invalid document without any partial setting update')

baseline = values()
screen = select('invalid-target')
xml = (screen / 'window.xml').read_text(encoding='utf-8')
if '已校验 ' in xml:
    tap('round2-import-invalid-target-confirm', '导入')
    time.sleep(2)
after = values()
(folder / 'invalid-target-before-private.json').write_text(json.dumps(baseline, ensure_ascii=False, indent=2), encoding='utf-8')
(folder / 'invalid-target-after-private.json').write_text(json.dumps(after, ensure_ascii=False, indent=2), encoding='utf-8')
changed = [key for key in baseline if baseline[key] != after.get(key)]
check('CONFIG-05-invalid-target-atomicity', baseline == after, {'changedKeys': changed, 'expectation': 'An import referencing a nonexistent Android user is rejected before settings change'})
select('restore')
tap('round2-import-restore-confirm', '导入')
time.sleep(2)
check('CONFIG-06-roundtrip', values() == before, 'Importing the exported document restores all original persisted settings')
