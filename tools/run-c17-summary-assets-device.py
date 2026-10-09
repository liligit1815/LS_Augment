"""Collect summary PNG/GIF/fallback/wake evidence; no notifications are created or canceled.

Requires --run or --restore-only. --self-test is purely local and never invokes ADB.
The phone's durable fixture baseline is the source of truth for interrupted-run recovery.
"""
import argparse
import hashlib
import io
import json
import re
import shlex
import time
import traceback
import uuid
import xml.etree.ElementTree as ET
from pathlib import Path

import numpy as np
from PIL import Image
import adb_regression as ar
import native_ui_helpers as ui

BASELINE = '/data/user/0/ls.augment.com/files/c17-notification-summary-assets-baseline.json'
RUNNER = 'ls.augment.com.test/ls.augment.com.DeviceRegressionRunner'
CONTAINER = 'com.android.systemui:id/notificationIcons'


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')


def walk(node):
    yield node
    for child in node.get('children', []):
        yield from walk(child)


def rect(node):
    numbers = tuple(map(int, re.findall(r'-?\d+', str(node.get('bounds', '')))))
    return numbers if len(numbers) == 4 else (0, 0, 0, 0)


def positive(bounds):
    return bounds[2] > bounds[0] and bounds[3] > bounds[1]


def semantics(windows):
    found = [n for w in windows for n in walk(w['root'])
             if n.get('package') == 'com.android.systemui' and n.get('id') == CONTAINER
             and n.get('visible') and positive(rect(n))]
    if len(found) != 1:
        return {'state': 'not-observed', 'reason': 'Expected one visible notificationIcons container', 'matches': len(found)}
    node = found[0]
    # Accessibility uses ImageView even for the ROM's StatusBarIconView. These are
    # candidates only: private isIconBlocked/visibleState/mIconStates are not exposed.
    candidates = [n for n in walk(node) if n is not node and n.get('visible') and positive(rect(n))
                  and (str(n.get('class', '')).endswith('ImageView') or str(n.get('class', '')).endswith('StatusBarIconView'))]
    return {'state': 'observed', 'bounds': rect(node), 'container': node, 'nativeCandidates': candidates,
            'candidateSignature': sorted((str(n.get('description', '')), str(n.get('text', ''))) for n in candidates),
            'nativeEligibilityVerified': False, 'eligibilityLimit': 'Accessibility candidates do not reveal native eligible flags; a rendered fixture is separate positive evidence'}


def marker(frame):
    array = np.asarray(frame.convert('RGB')).astype(np.int16)
    colors = [(0, 216, 255), (255, 0, 184), (255, 255, 0)]
    masks = [np.max(np.abs(array - color), axis=2) <= 18 for color in colors]
    centers = [float(np.where(mask)[1].mean()) if mask.any() else None for mask in masks]
    return {'counts': [int(mask.sum()) for mask in masks], 'centersX': centers,
            'threeBands': all(int(mask.sum()) >= 9 for mask in masks) and centers[0] < centers[1] < centers[2]}


def frame_analysis(frames):
    if not frames or len({frame.size for frame in frames}) != 1:
        return {'state': 'not-observed', 'reason': 'No consistent bounded frames'}
    arrays = [np.asarray(frame.convert('RGB')).astype(np.int16) for frame in frames]
    red = [(a[:, :, 0] >= 225) & (a[:, :, 1] <= 30) & (a[:, :, 2] <= 30) for a in arrays]
    green = [(a[:, :, 1] >= 225) & (a[:, :, 0] <= 30) & (a[:, :, 2] <= 30) for a in arrays]
    toggled = np.logical_or.reduce(red) & np.logical_or.reduce(green)
    return {'state': 'observed', 'frameCount': len(frames), 'size': frames[0].size,
            'cropSha256': [hashlib.sha256(frame.convert('RGB').tobytes()).hexdigest() for frame in frames],
            'adjacentChangedPixels': [int((np.max(np.abs(a - b), axis=2) > 16).sum()) for a, b in zip(arrays, arrays[1:])],
            'redPixels': [int(mask.sum()) for mask in red], 'greenPixels': [int(mask.sum()) for mask in green],
            'samePixelsObservedRedAndGreen': int(toggled.sum()),
            'gifFrameAlternation': len(frames) >= 8 and int(toggled.sum()) >= 9,
            'pngMarker': [marker(frame) for frame in frames]}


def compare_native(control, fallback):
    if not control or not fallback or not control.get('crops') or not fallback.get('crops'):
        return {'state': 'not-observed', 'reason': 'Native and fallback bounded crops are required'}
    if not control.get('geometryAndCandidatesStable') or not fallback.get('geometryAndCandidatesStable'):
        return {'state': 'not-observed', 'reason': 'Native or fallback geometry changed during its frame series'}
    a, b = control['semanticBefore'], fallback['semanticBefore']
    if not a.get('nativeCandidates') or a.get('candidateSignature') != b.get('candidateSignature') or a.get('bounds') != b.get('bounds'):
        return {'state': 'not-observed', 'reason': 'Native candidates, identity signature or bounds changed; no equality inference'}
    first = np.asarray(control['crops'][-1]).astype(np.int16)
    second = np.asarray(fallback['crops'][-1]).astype(np.int16)
    if first.shape != second.shape:
        return {'state': 'not-observed', 'reason': 'Crop shape changed'}
    fraction = float((np.max(np.abs(first - second), axis=2) > 16).mean())
    return {'state': 'compared', 'changedFraction': fraction, 'matchesNativeControl': fraction <= .02,
            'evidenceLimit': 'Pixel comparison with same visible native candidates; not a read of private eligible flags'}


def instrumentation_state(raw):
    """Parse this ROM's full report; the unsupported instrumentation subcommand is never used."""
    raw = raw.replace('\r', '')
    if re.search(r'Unknown command|Bad activity command|Permission Denial|DUMP TIMEOUT|DeadObjectException', raw, re.I):
        raise ValueError('Activity dump failed or is incomplete')
    headers = ['ACTIVITY MANAGER SETTINGS ', 'ACTIVITY MANAGER ACTIVITIES ',
               'ACTIVITY MANAGER RUNNING PROCESSES (dumpsys activity processes)',
               'ACTIVITY MANAGER USERS (dumpsys activity users)', 'ACTIVITY MANAGER COMPONENT-ALIAS ']
    positions = []
    for header in headers:
        matches = list(re.finditer(r'^' + re.escape(header), raw, re.M))
        if len(matches) != 1:
            raise ValueError('Full activity dump lacks a unique recognized section: ' + header)
        positions.append(matches[0].start())
    if positions != sorted(positions):
        raise ValueError('Unexpected activity section ordering')
    processes = raw[positions[2]:positions[3]]
    for marker in ['  OOM levels:', '  Process OOM control (', '  Raw LRU list (',
                   '  Process LRU list (', '  mWakefulness=', '  mShuttingDown=', '  mForceBackgroundCheck=']:
        if not re.search(r'^' + re.escape(marker), processes, re.M):
            raise ValueError('Process section is incomplete: ' + marker)
    active = list(re.finditer(r'^  Active instrumentation:[ \t]*$', processes, re.M | re.I))
    if len(active) > 1:
        raise ValueError('Duplicate instrumentation section')
    entries = re.findall(r'ActiveInstrumentation\{[^\n]*', processes)
    components = re.findall(r'mClass=ComponentInfo\{([^}]+)\}', processes)
    process_flags = bool(re.search(r'^.*\(instrumentation\)\s*$', processes, re.M))
    if active:
        end = processes.find('\n  OOM levels:', active[0].end())
        if end < 0:
            raise ValueError('Instrumentation section has no complete following OOM section')
        body = processes[active[0].end():end].strip()
        if body and not entries:
            raise ValueError('Unknown nonempty instrumentation section')
    elif entries or components:
        raise ValueError('Instrumentation entries without the expected section header')
    return {'state': 'active' if entries or components or process_flags else 'idle', 'components': components,
            'entries': entries, 'instrumentationProcessFlags': process_flags,
            'emptyEvidence': 'Complete recognized process/activities/users report with no active instrumentation entries or process flags'}


def no_active_instrumentation():
    raw = ar.shell('dumpsys activity', timeout=40)
    try:
        state = instrumentation_state(raw)
    except ValueError as error:
        raise RuntimeError('Cannot establish an idle instrumentation state: ' + str(error)) from error
    if state['state'] != 'idle':
        raise RuntimeError('Another instrumentation is active; no concurrent fixture allowed: ' + json.dumps(state, ensure_ascii=False))
    return state


def pending():
    paths = [BASELINE, BASELINE + '.bak', BASELINE + '.new']
    return ar.shell('if ' + ' || '.join('test -e ' + shlex.quote(p) for p in paths) + '; then echo yes; else echo no; fi', root=True) == 'yes'


class Collector:
    def __init__(self, output, version, version_name, require_live_ui=True):
        self.output, self.version, self.version_name = output, version, version_name
        self.run_id = ''
        self.index = 0
        self.phases = []
        self.initial_pid = ar.shell('pidof com.android.systemui')
        if require_live_ui and not self.initial_pid.isdigit():
            raise RuntimeError('Exactly one SystemUI process is required')

    def operation(self, phase, kind=''):
        no_active_instrumentation()
        label = 'summary-' + str(self.index).zfill(2) + '-' + phase + ('-' + kind if kind else '')
        self.index += 1
        command = 'am instrument -w -r -e operation c17-summary-assets -e phase ' + shlex.quote(phase) + ' -e label ' + shlex.quote(label)
        if self.run_id:
            command += ' -e runId ' + shlex.quote(self.run_id)
        if kind:
            command += ' -e kind ' + shlex.quote(kind)
        raw = ar.shell(command + ' ' + RUNNER, timeout=120)
        folder = self.output / label
        folder.mkdir()
        (folder / 'instrumentation.txt').write_text(raw, encoding='utf-8')
        if 'INSTRUMENTATION_RESULT: status=pass' not in raw:
            raise RuntimeError('Summary fixture phase failed: ' + raw[-3500:])
        wrapper = json.loads(ar.shell('cat ' + shlex.quote('/data/user/0/ls.augment.com/files/device-regression-results/' + label + '.json'), root=True))
        save(folder / 'result.json', wrapper)
        if str(wrapper.get('moduleVersion')) != self.version or wrapper.get('status') != 'pass':
            raise AssertionError('Instrumented and installed build differ or wrapper failed')
        report = wrapper['notificationSummaryAssets']
        if not report.get('success') or self.run_id and report.get('runId') != self.run_id:
            raise AssertionError('Failed fixture result or run ownership mismatch')
        self.run_id = report['runId']
        no_active_instrumentation()
        return report

    def capture(self, name):
        no_active_instrumentation()
        if ar.shell('pidof com.android.systemui') != self.initial_pid:
            raise RuntimeError('SystemUI restarted during this run; stop evidence collection and restore')
        before = semantics(ui.all_windows(name))
        folder = self.output / name
        crops, times = [], []
        for index in range(8):
            started = time.time()
            raw = ar.adb('exec-out', 'screencap -p')
            (folder / ('frame-' + str(index).zfill(2) + '.png')).write_bytes(raw)
            with Image.open(io.BytesIO(raw)) as original:
                frame = original.convert('RGB')
            times.append({'startHostEpoch': started, 'endHostEpoch': time.time()})
            if before['state'] == 'observed':
                box = before['bounds']
                if 0 <= box[0] < box[2] <= frame.width and 0 <= box[1] < box[3] <= frame.height:
                    crop = frame.crop(box)
                    crop.save(folder / ('crop-' + str(index).zfill(2) + '.png'))
                    crops.append(crop)
            if index < 7:
                time.sleep([.071, .131, .197, .089, .173, .223, .109][index])
        after = semantics(ui.all_windows(name + '-after'))
        stable = before['state'] == after['state'] == 'observed' and before['bounds'] == after['bounds'] and before.get('candidateSignature') == after.get('candidateSignature')
        analysis = frame_analysis(crops)
        item = {'name': name, 'semanticBefore': before, 'semanticAfter': after, 'geometryAndCandidatesStable': stable,
                'frameTimes': times, 'pixels': analysis, 'nativeEligibleIcons': 'not-directly-observable',
                'summaryImageEvidence': 'not-observed', 'visualReviewRequired': True}
        if stable and analysis.get('state') == 'observed':
            if name.startswith('png') and any(m['threeBands'] for m in analysis['pngMarker']):
                item['summaryImageEvidence'] = 'three-fixture-color-bands-observed'
            if name.startswith(('gif', 'wake')) and analysis['gifFrameAlternation']:
                item['summaryImageEvidence'] = 'same-pixels-alternate-between-fixture-red-and-green'
        # Preserve raw diagnostics as context only; ready/unavailable has no timestamp or eligible count.
        diag = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
        (folder / 'diagnostics.xml').write_text(diag, encoding='utf-8')
        save(folder / 'evidence.json', item)
        self.phases.append(item)
        return dict(item, crops=crops)


def installed():
    package = ar.shell('dumpsys package ls.augment.com')
    code, name = re.search(r'\bversionCode=(\d+)', package), re.search(r'\bversionName=([^\s]+)', package)
    if not code or not name:
        raise RuntimeError('Installed module identity is unavailable')
    return code[1], name[1]


def loaded(version_name):
    pid = int(ar.shell('pidof com.android.systemui'))
    raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
    records = [json.loads(node.text) for node in ET.fromstring(raw) if node.tag == 'string' and node.text]
    current = [record for record in records if record.get('pid') == pid and record.get('process') == 'com.android.systemui']
    if len(current) != 1 or current[0].get('moduleVersion') != version_name:
        raise RuntimeError('SystemUI loaded build differs from installed build; do not collect stale results')
    return current[0]


def verify_restore(collector, restored):
    wrapper = ar.instrument('snapshot', 'summary-restored-snapshot')
    if str(wrapper.get('moduleVersion')) != collector.version or wrapper.get('status') != 'pass':
        raise AssertionError('Independent restored snapshot came from another build or failed')
    actual = wrapper['settings']
    restored['independentSnapshotMatches'] = all(actual.get(k) == v for k, v in restored['restoredValues'].items())
    if not restored['independentSnapshotMatches']:
        raise AssertionError('Independent configuration snapshot differs after restore')


def execute(args):
    no_active_instrumentation()
    version, name = installed()
    output = Path(args.out).resolve() if args.out else ar.ROOT / ('out/full-function-audit-20261004/summary-assets-' + version + '-' + time.strftime('%Y%m%d-%H%M%S'))
    output.mkdir(parents=True, exist_ok=False)
    ar.OUTPUT = ui.OUTPUT = output
    collector = Collector(output, version, name, require_live_ui=args.run)
    save(output / 'build.json', {'installedVersion': version, 'installedVersionName': name,
        'sourceVersionProperties': (ar.ROOT / 'android/version.properties').read_text(), 'sourceMayBeAheadOfInstalledBuild': True,
        'loadedSystemUi': loaded(name) if args.run else 'Not required for restoring old durable configuration'})
    if args.restore_only:
        try:
            if not pending():
                save(output / 'restore.json', {'state': 'nothing-to-restore', 'success': True})
            else:
                report = collector.operation('inspect')
                save(output / 'pending-fixture.json', report)
                restored = collector.operation('restore')
                verify_restore(collector, restored)
                if pending():
                    raise AssertionError('Durable baseline remains after restore')
                save(output / 'restore.json', restored)
        except Exception:
            save(output / 'restore-error.json', {'success': False, 'error': traceback.format_exc(),
                'instruction': 'Durable phone baseline is retained by Java until config and owned-resource restoration succeeds; inspect it before another test run.'})
            raise
        print(str(output), flush=True)
        return
    if pending():
        raise RuntimeError('Previous summary fixture baseline exists; use --restore-only. No config was changed by this run.')
    failure, cleanup_errors, sleep_attempted, preparation_attempted = None, [], False, False
    native = missing = disabled = None
    restored = None
    try:
        collector.run_id = str(uuid.uuid4())
        save(output / 'recovery.json', {'runId': collector.run_id, 'baseline': BASELINE, 'restoreCommand': 'python tools/run-c17-summary-assets-device.py --restore-only'})
        preparation_attempted = True
        prepared = collector.operation('prepare')
        save(output / 'prepared.json', prepared)
        durable = json.loads(ar.shell('cat ' + shlex.quote(BASELINE), root=True))
        if durable.get('runId') != collector.run_id:
            raise AssertionError('Durable fixture identity differs from requested run')
        save(output / 'phone-baseline.json', durable)
        # Home is a stable real status-bar surface. No status-bar visibility setting is altered.
        ar.shell('input keyevent 3')
        for kind in ['native', 'png', 'gif', 'missing']:
            change = collector.operation('apply', kind)
            save(output / (kind + '-applied.json'), change)
            time.sleep(2)
            evidence = collector.capture(kind + '-frames')
            if kind == 'native':
                native = evidence
            if kind == 'missing':
                missing = evidence
        collector.operation('apply', 'gif')
        time.sleep(2)
        collector.capture('gif-before-sleep')
        no_active_instrumentation()
        before_power = ar.shell('dumpsys power')
        (output / 'power-before.txt').write_text(before_power, encoding='utf-8')
        if 'mWakefulness=Awake' not in before_power:
            raise RuntimeError('Phone is not awake; sleep/wake phase cannot be attributed to this run')
        sleep_attempted = True
        ar.shell('input keyevent 223')
        time.sleep(2)
        asleep = ar.shell('dumpsys power')
        display = ar.shell('dumpsys display')
        (output / 'power-asleep.txt').write_text(asleep, encoding='utf-8')
        (output / 'display-asleep.txt').write_text(display, encoding='utf-8')
        save(output / 'sleep.json', {'wakefulnessAsleepOrDozing': bool(re.search(r'mWakefulness=(Asleep|Dozing)', asleep)),
            'internalSummaryDrawableStopVerified': False, 'scope': 'Power/display evidence only; no private drawable lifecycle probe'})
        ar.shell('input keyevent 224')
        sleep_attempted = False
        ar.shell('wm dismiss-keyguard')
        ar.shell('input keyevent 3')
        time.sleep(2)
        collector.capture('wake-gif-frames')
        collector.operation('apply', 'disabled')
        time.sleep(2)
        disabled = collector.capture('disabled-native-frames')
    except Exception:
        failure = traceback.format_exc()
    finally:
        if sleep_attempted:
            try:
                ar.shell('input keyevent 224')
            except Exception:
                cleanup_errors.append({'step': 'wake-after-own-sleep', 'error': traceback.format_exc()})
        try:
            if preparation_attempted and pending():
                restored = collector.operation('restore')
            elif preparation_attempted:
                # A prepare failure may already have restored its own baseline.
                restored = {'state': 'no-pending-baseline', 'settingsRestored': False, 'reason': 'Restore result not independently available; inspect prepare error'}
        except Exception:
            cleanup_errors.append({'step': 'restore-phone-baseline-and-owned-resources', 'error': traceback.format_exc()})
        try:
            remaining = pending()
        except Exception:
            remaining = None
            cleanup_errors.append({'step': 'pending-baseline-readback', 'error': traceback.format_exc()})
        if restored and restored.get('settingsRestored'):
            try:
                verify_restore(collector, restored)
            except Exception:
                cleanup_errors.append({'step': 'independent-restored-config-readback', 'error': traceback.format_exc()})
        report = {'installedVersion': version, 'runId': collector.run_id, 'phases': collector.phases,
            'executionError': failure, 'cleanupErrors': cleanup_errors, 'restoration': restored, 'pendingBaseline': remaining,
            'collectionCompleted': failure is None and not cleanup_errors and restored is not None and restored.get('settingsRestored') is True and not remaining,
            'fallbackComparedWithBefore': compare_native(native, missing), 'fallbackComparedWithDisabled': compare_native(disabled, missing),
            'allSummaryFeaturesPassed': False, 'visualReviewRequired': True,
            'limitations': ['Native icon candidates are not equivalent to private eligible flags.',
                'No eligible/no notification transition is manufactured. If not naturally observed it remains untested.',
                'An invisible whole status bar is not evidence of an empty notification list.',
                'Eight bounded pixel frames prove only captured visible frame changes; isRunning is not used.',
                'Sleep power state and visible wake frame changes do not prove the private drawable stop callback.',
                'Source preparation is not import-picker UI coverage; existing notifications are never changed.']}
        save(output / 'report.json', report)
    print(str(output), flush=True)
    if not report['collectionCompleted']:
        raise RuntimeError('Summary collection incomplete; inspect report and use --restore-only if baseline remains')


def self_test():
    def node(identity='', children=None, bounds='[10,10][40,30]', visible=True, cls='android.view.ViewGroup'):
        return {'id': identity, 'package': 'com.android.systemui', 'class': cls, 'visible': visible, 'bounds': bounds, 'children': children or []}
    candidate = node(cls='android.widget.ImageView')
    good = semantics([{'root': node(CONTAINER, [candidate])}])
    assert good['state'] == 'observed' and len(good['nativeCandidates']) == 1 and not good['nativeEligibilityVerified']
    assert semantics([{'root': node(CONTAINER, visible=False)}])['state'] == 'not-observed'
    assert semantics([{'root': node(CONTAINER, bounds='[20,20][10,10]')}])['state'] == 'not-observed'
    assert semantics([{'root': node('', [node(CONTAINER), node(CONTAINER)])}])['state'] == 'not-observed'
    red, green = Image.new('RGB', (24, 16), (255, 0, 0)), Image.new('RGB', (24, 16), (0, 255, 0))
    assert not frame_analysis([red] * 8)['gifFrameAlternation']
    assert not frame_analysis([red, green])['gifFrameAlternation']
    assert frame_analysis([red, green] * 4)['gifFrameAlternation']
    png = Image.new('RGB', (24, 16))
    for x in range(24):
        for y in range(16):
            png.putpixel((x, y), [(0, 216, 255), (255, 0, 184), (255, 255, 0)][x // 8])
    assert marker(png)['threeBands'] and not marker(red)['threeBands']
    control = {'crops': [red], 'semanticBefore': good, 'geometryAndCandidatesStable': True}
    assert compare_native(control, control)['matchesNativeControl']
    assert not compare_native(control, dict(control, crops=[green]))['matchesNativeControl']
    bad = dict(good, candidateSignature=[('different notification', '')])
    assert compare_native(control, dict(control, semanticBefore=bad))['state'] == 'not-observed'
    assert compare_native(control, dict(control, geometryAndCandidatesStable=False))['state'] == 'not-observed'
    print('12 local collector checks passed; no ADB calls')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run', action='store_true')
    mode.add_argument('--restore-only', action='store_true')
    mode.add_argument('--self-test', action='store_true')
    parser.add_argument('--out', help='New evidence directory; must not already exist')
    arguments = parser.parse_args()
    self_test() if arguments.self_test else execute(arguments)
