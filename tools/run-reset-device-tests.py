"""Run actual reset UI actions through ADB; inspect app and system state after each case."""
import json
import re
import sys
import time
import xml.etree.ElementTree as ET
from adb_regression import OUTPUT, adb, shell, snapshot as device_snapshot, tap as device_tap, instrument as device_instrument

stage = sys.argv[1] if len(sys.argv) > 1 else 'round1'
assert re.fullmatch(r'[A-Za-z0-9_.-]+', stage)
def label(value): return value.replace('round1', stage, 1)
def snapshot(name, **kwargs): return device_snapshot(label(name), **kwargs)
def tap(name, text): return device_tap(label(name), text)
def instrument(operation, name): return device_instrument(operation, label(name))

folder = OUTPUT / (stage + '-reset-results')
folder.mkdir(parents=True, exist_ok=True)
results = []

def prefs():
    value = shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_config_v2.xml', root=True)
    parsed = ET.fromstring(value)
    return {node.get('name'): node.text or '' for node in parsed if node.tag == 'string'}, value

def check(name, passed, detail):
    results.append({'case': name, 'status': 'pass' if passed else 'fail', 'detail': detail})
    (folder / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(results[-1], ensure_ascii=False), flush=True)
    if not passed:
        snapshot('round1-reset-failure', verbose=False)
        raise AssertionError(name + ': ' + str(detail))

before, raw = prefs()
(folder / 'before-cancel-private.xml').write_text(raw, encoding='utf-8')
tap('round1-reset-cancel-open', '重置全部配置')
dialog = snapshot('round1-reset-cancel-dialog', verbose=False)
check('RESET-01-confirmation', '确认重置' in (dialog / 'window.xml').read_text(encoding='utf-8'), 'Actual confirmation dialog is visible')
tap('round1-reset-cancel', '取消')
after, raw = prefs()
(folder / 'after-cancel-private.xml').write_text(raw, encoding='utf-8')
check('RESET-02-cancel', before == after, 'Every persisted setting remains identical after cancellation')

seed = instrument('seed-reset', 'round1-reset-seed')
check('RESET-03-seed-hidden-app', seed.get('fixtureHidden') is True and seed.get('aliasHidden') is True,
      'Test app is actually hidden in PackageManager; module launcher alias is disabled; 9 nondefault values seeded')
shell('am start -n ls.augment.com/.SettingsActivity')
tap('round1-reset-seeded-entry', '配置备份与重置')
tap('round1-reset-confirm-open', '重置全部配置')
tap('round1-reset-confirm', '确认重置')
deadline = time.monotonic() + 50
while time.monotonic() < deadline:
    current = snapshot('round1-reset-confirm-result', verbose=False)
    text = (current / 'window.xml').read_text(encoding='utf-8')
    if '重置完成' in text or '重置未完成' in text:
        break
    time.sleep(0.4)
check('RESET-04-ui-success', '重置完成' in text and '重置未完成' not in text, 'Actual reset completion dialog')
values, raw = prefs()
(folder / 'after-reset-private.xml').write_text(raw, encoding='utf-8')
(folder / 'after-reset-global.txt').write_text(shell('settings get global ls_augment_config_snapshot_v1', root=True), encoding='utf-8')
(folder / 'after-reset-boot.txt').write_text(shell('cat /data/system/ls_augment/boot-config-v1', root=True), encoding='utf-8')
package = shell('dumpsys package ls.augment.validation')
(folder / 'fixture-package-after.txt').write_text(package, encoding='utf-8')
user_line = next(line for line in package.splitlines() if 'User 0:' in line)
check('RESET-05-restore-hidden-app', 'hidden=false' in user_line and 'installed=true' in user_line, user_line.strip())
check('RESET-06-clear-selection', values.get('ls_augment_hide_targets_v2') == '', 'Hidden app selection is empty')
report = instrument('assert-defaults', 'round1-reset-defaults')
check('RESET-07-all-defaults-and-mirrors', report.get('checked') == 303 and report.get('mismatches') == []
      and report.get('runtimeMirror') == 'matched' and report.get('bootMirror') == 'matched', report)
print('Reset UI cases completed. Reboot persistence and log review are separate required cases.', flush=True)
