"""Offline regression of the real collector's write-ahead/finally recovery.
All device helpers are replaced before invocation; this test never calls ADB.
"""
import importlib.util
import json
from pathlib import Path
import tempfile

path = Path(__file__).with_name('run-c17-spacing-device.py')
spec = importlib.util.spec_from_file_location('spacing_collector', path)
collector = importlib.util.module_from_spec(spec)
spec.loader.exec_module(collector)
checks = 0


def check(value, reason):
    global checks
    checks += 1
    if not value:
        raise AssertionError(reason)


raw = 'IS1;all,wifi.signal,2,3,4,5;lock,wifi,1,2,3,4;main,bluetooth,3,0,4,0'
merged = collector.merge_spacing(raw, {('main', 'wifi.signal'): (8, 2, 3, 1)})
check('all,wifi.signal,2,3,4,5' in merged and 'lock,wifi,1,2,3,4' in merged, 'unrelated inheritance and lock rules retained')
check('main,bluetooth,3,0,4,0' in merged and 'main,wifi.signal,8,2,3,1' in merged, 'only requested exact surface overridden')
check(collector.merge_spacing('', {}) == '', 'empty baseline remains empty')

baseline_case = {'surface': 'main', 'surfaceVerified': True, 'inventoryFreshForSurface': True,
                 'inventory': {'surfaces': {'main': [
                     {'id': 'wifi', 'state': 'visible'}, {'id': 'wifi.signal', 'state': 'visible'},
                     {'id': 'wifi.activity_inout', 'state': 'hidden'},
                     {'id': 'mobile1', 'state': 'hidden'}, {'id': 'mobile1.signal', 'state': 'hidden'}]}}}
changes, scope = collector.selected_rules([baseline_case], collector.WIFI)
check(len(changes) == 2 and all(surface == 'main' for surface, _ in changes), 'do not invent availability on other surfaces')
check(next(row for row in scope if row['surface'] == 'main' and row['icon'].endswith('inout'))['status'] == 'configured_native_hidden', 'hidden activity never claims visual coverage')
check(not collector.selected_rules([baseline_case], collector.MOBILE)[0], 'no forced hidden mobile combination')
stale = dict(baseline_case, inventoryFreshForSurface=False)
check(not collector.selected_rules([stale], collector.WIFI)[0], 'stale inventory does not authorize fixture coverage')

# A fixture save succeeds on the device but its transport/result then fails.
# The real finally path must still restore from the already-written journal.
with tempfile.TemporaryDirectory(prefix='duo-spacing-collector-') as tmp:
    folder = Path(tmp)
    original = {collector.SPACING: raw, collector.MASTER: '1', 'ls_augment_statusbar_network_two_rows': '1', 'ls_augment_statusbar_grid': 'user-layout'}
    settings = dict(original)
    calls = []
    version = {'versionCode': 20451, 'versionName': 'offline-fixture'}

    def fake_instrument(operation, label, values=None):
        calls.append((operation, label))
        if operation == 'snapshot':
            return {'settings': dict(settings)}
        if operation == 'set':
            journal = json.loads((folder / 'restore.json').read_text(encoding='utf-8'))
            check(journal['pending'] and journal['values'] == {collector.SPACING: raw}, 'durable original value precedes every write')
            settings.update(values)
            if label == 'wifi-edges-set':
                raise RuntimeError('Simulated disconnect after successful save')
            return {'status': 'pass'}
        raise AssertionError('Unexpected instrumentation: ' + operation)

    def fake_shell(command, **kwargs):
        if command == 'dumpsys package ls.augment.com':
            return 'versionCode=20451'
        return 'unchanged-profile'

    collector.ar.instrument = fake_instrument
    collector.ar.shell = fake_shell
    collector.ar.adb = lambda *args, **kwargs: (_ for _ in ()).throw(AssertionError('ADB must not be called by offline test'))
    run = collector.Collection(folder, version, 11)
    run.phase = lambda name, scope=None: [baseline_case] if name == 'baseline' else []
    try:
        run.run(False)
        raise AssertionError('Expected synthetic transport failure')
    except RuntimeError as error:
        check(str(error) == 'Simulated disconnect after successful save', 'original collection error preserved')
    check(settings == original, 'all settings, including user rows/layout, survive interrupted collection')
    journal = json.loads((folder / 'restore.json').read_text(encoding='utf-8'))
    check(not journal['pending'], 'recovery cleared only after verified readback')
    report = json.loads((folder / 'report.json').read_text(encoding='utf-8'))
    check(report['configurationRestored'] and report['status'] == 'interrupted_or_failed', 'restore success does not mislabel failed collection as pass')

    # Explicit recovery of an externally interrupted process retains earlier observations.
    journal['pending'] = True
    collector.atomic_json(folder / 'restore.json', journal)
    settings[collector.SPACING] = merged
    report['cases'] = [{'label': 'baseline-main', 'visualReviewPending': True}]
    collector.atomic_json(folder / 'report.json', report)
    recovered = collector.Collection(folder, version, 11)
    recovered.run(True)
    after = json.loads((folder / 'report.json').read_text(encoding='utf-8'))
    check(after['cases'] == report['cases'], 'manual recovery preserves previous evidence report')
    check(settings == original and after['configurationRestored'], 'manual recovery restores original spacing only')

print(f'Spacing collector offline recovery: {checks} assertions passed; ADB was never called')
