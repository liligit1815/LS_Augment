"""Exercise the real collector orchestration with an in-memory phone, never ADB."""
import argparse
import contextlib
import importlib.util
import io
import json
from pathlib import Path
import tempfile
from unittest.mock import patch

SCRIPT = Path(__file__).with_name('run-c17-summary-assets-device.py')
spec = importlib.util.spec_from_file_location('summary_collector_under_test', SCRIPT)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
checks = 0


def check(condition, message):
    global checks
    checks += 1
    if not condition:
        raise AssertionError(message)


def scenario(name, *, preexisting=False, restore_only=False, fail='', mismatch=False):
    state = {'pending': preexisting, 'runId': '11111111-1111-4111-8111-111111111111' if preexisting else '',
             'operations': [], 'commands': [], 'settings': {'summary': 'original'}, 'asleep': False}
    class FakeCollector:
        def __init__(self, output, version, version_name, require_live_ui=True):
            self.output, self.version, self.version_name, self.run_id, self.phases = output, version, version_name, '', []
        def operation(self, phase, kind=''):
            state['operations'].append((phase, kind, self.run_id))
            if phase == 'prepare':
                check(bool(self.run_id), 'Collector owns run identity before a possibly ambiguous prepare')
                state['pending'], state['runId'] = True, self.run_id
                if fail == 'prepare-after-backup':
                    raise RuntimeError('transport lost after durable backup')
            if phase == 'apply':
                state['settings']['summary'] = kind
            if phase == 'inspect':
                self.run_id = state['runId']
            if phase == 'restore':
                check(self.run_id == state['runId'], 'Restore must use this durable run identity')
                if fail == 'restore':
                    raise RuntimeError('simulated restore failure')
                state['settings']['summary'], state['pending'] = 'original', False
                return {'success': True, 'runId': self.run_id, 'settingsRestored': True, 'restoredValues': {'summary': 'original'}}
            return {'success': True, 'runId': self.run_id}
        def capture(self, label):
            if fail == 'capture' and label.startswith('png'):
                raise RuntimeError('simulated screenshot transport failure')
            item = {'name': label, 'semanticBefore': {'state': 'not-observed'}, 'summaryImageEvidence': 'not-observed'}
            self.phases.append(item)
            return item
    def shell(command, **kwargs):
        state['commands'].append(command)
        if command == 'cat ' + m.BASELINE:
            return json.dumps({'runId': state['runId']})
        if command == 'input keyevent 223':
            state['asleep'] = True
        if command == 'input keyevent 224':
            state['asleep'] = False
        if command == 'dumpsys power':
            if state['asleep'] and fail == 'sleep-observation':
                raise RuntimeError('lost observation after owned sleep')
            return 'mWakefulness=' + ('Asleep' if state['asleep'] else 'Awake')
        if command == 'dumpsys display':
            return 'state=OFF'
        if command in ('input keyevent 3', 'input keyevent 223', 'input keyevent 224', 'wm dismiss-keyguard'):
            return ''
        raise AssertionError('Unmocked command must never reach ADB: ' + command)
    def instrument(*args, **kwargs):
        return {'moduleVersion': 20452, 'status': 'pass', 'settings': {'summary': 'different' if mismatch else state['settings']['summary']}}
    with tempfile.TemporaryDirectory(prefix='lsa-summary-collector-test-') as folder:
        out = Path(folder) / name
        args = argparse.Namespace(out=str(out), run=not restore_only, restore_only=restore_only)
        with patch.object(m, 'Collector', FakeCollector), patch.object(m, 'installed', return_value=('20452', 'test20452')), \
             patch.object(m, 'loaded', return_value={'moduleVersion': 'test20452'}), patch.object(m, 'pending', side_effect=lambda: state['pending']), \
             patch.object(m, 'no_active_instrumentation', return_value='idle'), patch.object(m.ar, 'shell', side_effect=shell), \
             patch.object(m.ar, 'adb', side_effect=AssertionError('Actual ADB is forbidden in this test')), \
             patch.object(m.ar, 'instrument', side_effect=instrument), patch.object(m.time, 'sleep'), contextlib.redirect_stdout(io.StringIO()):
            error = None
            try:
                m.execute(args)
            except Exception as caught:
                error = caught
        report = json.loads((out / 'report.json').read_text()) if (out / 'report.json').is_file() else None
        restore = json.loads((out / 'restore.json').read_text()) if (out / 'restore.json').is_file() else None
        state.update(error=error, report=report, restore=restore)
    return state


s = scenario('pending-old', preexisting=True)
check(s['error'] is not None and not s['operations'] and s['pending'], 'Old baseline is neither replaced nor silently restored')
s = scenario('capture-failed', fail='capture')
check(s['error'] is not None and not s['pending'] and s['settings']['summary'] == 'original', 'Capture failure still restores exact configuration')
check(s['report']['restoration']['independentSnapshotMatches'] and not s['report']['collectionCompleted'], 'Failed collection cannot be reported as completed')
s = scenario('ambiguous-prepare', fail='prepare-after-backup')
check(s['error'] is not None and not s['pending'], 'Ambiguous prepare is restored using the preassigned run id')
s = scenario('restore-failed', fail='restore')
check(s['pending'] and s['report']['cleanupErrors'] and not s['report']['collectionCompleted'], 'Failed cleanup retains baseline and reports failure')
s = scenario('readback-differs', mismatch=True)
check(s['report']['cleanupErrors'] and not s['report']['collectionCompleted'], 'Independent restored snapshot mismatch fails collection')
s = scenario('restore-only', preexisting=True, restore_only=True)
check(s['error'] is None and s['restore']['independentSnapshotMatches'] and not s['pending'], 'Restore-only verifies durable restoration independently')
check([p[0] for p in s['operations']] == ['inspect', 'restore'], 'Restore-only never applies test configuration')
s = scenario('nothing-pending', restore_only=True)
check(not s['operations'] and s['restore']['state'] == 'nothing-to-restore', 'Empty restore-only is a read-only no-op')
s = scenario('owned-sleep-failed', fail='sleep-observation')
check(not s['asleep'] and 'input keyevent 224' in s['commands'] and not s['pending'], 'Failure after owned sleep still wakes and restores')
s = scenario('no-eligible-evidence')
check(s['error'] is None and s['report']['collectionCompleted'], 'Collector can complete while faithfully recording missing observational prerequisites')
check(not s['report']['allSummaryFeaturesPassed'] and all(p['summaryImageEvidence'] == 'not-observed' for p in s['report']['phases']), 'Missing native eligibility/render evidence is never counted as feature success')
with patch.object(m.ar, 'shell', return_value='ACTIVITY MANAGER INSTRUMENTATION\n  ActiveInstrumentation{123}'):
    rejected = False
    try:
        m.no_active_instrumentation()
    except RuntimeError:
        rejected = True
    check(rejected, 'Another instrumentation is rejected before fixture use')
idle_dump = '''ACTIVITY MANAGER SETTINGS (dumpsys activity settings) activity_manager_constants:
ACTIVITY MANAGER ACTIVITIES (dumpsys activity activities)
ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)
  OOM levels:
  Process OOM control (1 total, non-act at 1, non-svc at 1):
  Raw LRU list (dumpsys activity lru):
  Process LRU list (sorted by oom_adj, 1 total, non-act at 1, non-svc at 1):
  mWakefulness=Awake
  mShuttingDown=false mTestPssMode=false
  mForceBackgroundCheck=false
ACTIVITY MANAGER USERS (dumpsys activity users)
ACTIVITY MANAGER COMPONENT-ALIAS (dumpsys activity component-alias)
  Enabled: false
'''
check(m.instrumentation_state(idle_dump)['state'] == 'idle', 'Absent instrumentation section is accepted only inside complete recognized activity/process sections')
check(m.instrumentation_state(idle_dump.replace('  OOM levels:', '  Active instrumentation:\n\n  OOM levels:'))['state'] == 'idle', 'An explicitly empty instrumentation section is accepted')
active_dump = idle_dump.replace('  OOM levels:', '  Active instrumentation:\n    Instrumentation #0: ActiveInstrumentation{123 {test/Runner} 1 procs}\n      mClass=ComponentInfo{test/Runner} mFinished=false\n\n  OOM levels:')
check(m.instrumentation_state(active_dump)['state'] == 'active', 'Real-ROM active instrumentation structure is detected')
check(m.instrumentation_state(idle_dump.replace('  mWakefulness=', '    Proc #0: test (instrumentation)\n  mWakefulness='))['state'] == 'active', 'An instrumentation process flag prevents falsely declaring idle')
for raw in ['Unknown command: instrumentation\nBad activity command', '', idle_dump.split('  mForceBackgroundCheck=')[0],
            idle_dump.replace('  Active instrumentation:', '').replace('  OOM levels:', '    ActiveInstrumentation{123}\n  OOM levels:')]:
    rejected = False
    try:
        m.instrumentation_state(raw)
    except ValueError:
        rejected = True
    check(rejected, 'Unsupported, truncated or structurally inconsistent dumps fail closed')
recorded = m.ar.ROOT / 'out/full-function-audit-20261004/summary-collector-activity-format.txt'
if recorded.is_file():
    real = m.instrumentation_state(recorded.read_text(encoding='utf-8'))
    check(real['state'] == 'active' and 'ls.augment.regression.ui/ls.augment.com.UiWindowRunner' in real['components'], 'Read-only captured NX809J full dump detects the live observer')
print(f'{checks} collector recovery/ownership checks passed; no device interaction')
