"""Collect the real OEM camera privacy dot and restore every changed setting.

Requires --run. Opens the resolved native still-camera preview without taking a
photo, granting permissions, or dismissing prompts. Pixel candidates and runtime
capacity are independent observations; neither is a visual PASS by itself.
"""
import argparse
import contextlib
import datetime as dt
import importlib.util
import io
import json
import os
from pathlib import Path
import re
import shlex
import time
import traceback
import xml.etree.ElementTree as ET

import adb_regression as ar
import native_ui_helpers as ui

KEY = 'ls_augment_statusbar_icon_spacing_v1'
MASTER = 'ls_augment_systemui_master'


def atomic(path, value):
    temp = path.with_suffix(path.suffix + '.tmp')
    with temp.open('w', encoding='utf-8') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temp, path)


def instrument(operation, label, values=None):
    with (ar.OUTPUT / 'instrument-console.txt').open('a', encoding='utf-8') as log:
        with contextlib.redirect_stdout(log):
            return ar.instrument(operation, label, values)


def parse_observation(raw):
    fields = (raw or '').split('|')
    if len(fields) != 12 or fields[0] != 'PDS1':
        return None
    names = ('bootEpochMs', 'elapsedMs', 'build', 'display', 'rotation',
             'densityMilli', 'fontMilli', 'rtl', 'horizontal', 'vertical')
    try:
        result = dict(zip(names, map(int, fields[1:11])))
        result['status'] = fields[11]
        return result
    except ValueError:
        return None


def green_candidates(path):
    # Only the two top corners are inspected. Camera preview colours below the
    # status region must not be interpreted as a privacy dot.
    from PIL import Image
    picture = Image.open(path).convert('RGB')
    width, height = picture.size
    pixels = picture.load()
    pending = set()
    for y in range(min(150, height)):
        for x in list(range(min(160, width))) + list(range(max(160, width - 160), width)):
            r, g, b = pixels[x, y]
            if g > 110 and g > r * 1.25 and g > b * 1.12:
                pending.add((x, y))
    components = []
    while pending:
        first = pending.pop()
        stack, found = [first], [first]
        while stack:
            x, y = stack.pop()
            for neighbour in ((x-1,y), (x+1,y), (x,y-1), (x,y+1)):
                if neighbour in pending:
                    pending.remove(neighbour)
                    stack.append(neighbour)
                    found.append(neighbour)
        if len(found) >= 5:
            xs, ys = zip(*found)
            components.append({'bounds': [min(xs), min(ys), max(xs)+1, max(ys)+1], 'pixels': len(found)})
    return sorted(components, key=lambda value: value['pixels'], reverse=True)


def capture(label, version, camera):
    folder = ar.OUTPUT / label
    folder.mkdir(exist_ok=True)
    windows = ui.all_windows(label)
    visible = [n for n in ui.nodes(windows) if n.get('visible')]
    # Retain only the status region under test, never the camera preview below.
    from PIL import Image
    with Image.open(io.BytesIO(ar.adb('exec-out', 'screencap -p'))) as screen:
        original_size = list(screen.size)
        retained_bounds = [0, 0, screen.width, min(150, screen.height)]
        screen.crop(tuple(retained_bounds)).save(folder / 'screen.png')
    raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
    diagnostics = {n.attrib['name']: n.text for n in ET.fromstring(raw)
                   if n.attrib.get('name', '').startswith('ls_augment_privacy_dot_spacing_')}
    elapsed = int(float(ar.shell('cat /proc/uptime').split()[0]) * 1000)
    observations = [parse_observation(value) for value in diagnostics.values()]
    current = [o for o in observations if o and o['build'] == version and 0 <= elapsed-o['elapsedMs'] < 60_000]
    appops = ar.shell('cmd appops get '+shlex.quote(camera)+' CAMERA')
    window_geometry = ar.shell('dumpsys window windows')
    decor_sections = re.findall(r'Window #[\s\S]*?(?=\n\s*Window #|\Z)', window_geometry)
    excluded_decor = any(re.match(r'Window #\d+ Window\{[^\n]*\bScreenDecorOverlay\}', part)
                         and 'IS_ROUNDED_CORNERS_OVERLAY' in part for part in decor_sections)
    state = {'label': label, 'cameraVisible': any(n.get('package') == camera for n in visible),
             'cameraAppOpRunning': bool(re.search(r'CAMERA:.*\(running\)', appops)),
             'privacyDecorExcludedFromScreenshots': excluded_decor,
             'originalScreenSize': original_size, 'retainedStatusRegion': retained_bounds,
             'visiblePrivacyNodes': [{k: n.get(k) for k in ('id', 'bounds', 'text', 'description')}
                                     for n in visible if 'privacy' in n.get('id', '').lower()],
             'observations': observations, 'freshBuildObservations': current,
             'greenPixelCandidates': green_candidates(folder / 'screen.png'),
             'systemuiPid': ar.shell('pidof com.android.systemui'),
             'display': ar.shell('dumpsys display | grep mScreenState'),
             'visualReviewRequired': True}
    (folder / 'camera-appops.txt').write_text(appops, encoding='utf-8')
    (folder / 'window-geometry.txt').write_text(window_geometry, encoding='utf-8')
    atomic(folder / 'observations.json', state)
    print(label, 'camera='+str(state['cameraVisible']), 'green='+str(state['greenPixelCandidates']), flush=True)
    return state


def open_camera(component, fresh_owned_fixture=False):
    # Starting instrumentation briefly pauses a foreground Activity on this ROM.
    # The owned fixture correctly closes on pause. Restart only its disposable
    # task after each settings write; never clear the user's native camera task.
    flags = ' -f 0x10008000' if fresh_owned_fixture else ''
    ar.shell('am start -W'+flags+' -n '+shlex.quote(component)+' -a android.media.action.STILL_IMAGE_CAMERA')
    time.sleep(8)


def recover(output, journal):
    if journal['deviceSerial'] != ar.SERIAL or set(journal['values']) != {KEY}:
        raise RuntimeError('Recovery journal does not match this device or setting')
    instrument('set', 'restore-spacing', journal['values'])
    after = instrument('snapshot', 'restore-readback')['settings']
    if any(after.get(k) != v for k, v in journal['values'].items()):
        raise RuntimeError('Spacing restore readback mismatch; journal remains pending')
    journal.update(pending=False, restoredAt=dt.datetime.now(dt.timezone.utc).isoformat())
    atomic(output / 'restore.json', journal)
    ar.shell('cmd statusbar collapse')
    ar.shell('input keyevent 4')
    ar.shell('am start -W -n ls.augment.com/.SettingsActivity')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--run', action='store_true')
    mode.add_argument('--restore-only', type=Path)
    parser.add_argument('--camera-component', help='Explicit already installed test camera Activity; no install or permission grant is performed')
    args = parser.parse_args()
    if args.restore_only:
        ar.OUTPUT = ui.OUTPUT = args.restore_only.resolve()
        journal = json.loads((ar.OUTPUT / 'restore.json').read_text(encoding='utf-8'))
        recover(ar.OUTPUT, journal)
        atomic(ar.OUTPUT / 'manual-recovery.json', {'configurationRestored': True})
        return
    installed = ar.shell('dumpsys package ls.augment.com')
    version = int(re.search(r'\bversionCode=(\d+)', installed)[1])
    if version < 20452:
        raise RuntimeError('The installed APK predates the native privacy-spacing implementation')
    output = ar.ROOT / ('out/full-function-audit-20261004/privacy-dot-'+str(version)+'-'+time.strftime('%H%M%S'))
    output.mkdir(parents=True, exist_ok=False)
    ar.OUTPUT = ui.OUTPUT = output
    baseline = instrument('snapshot', 'baseline')['settings']
    if baseline.get(MASTER) not in ('1', 'true'):
        raise RuntimeError('Status-bar customization is disabled; master switch was not changed')
    if args.camera_component and not re.fullmatch(r'[A-Za-z0-9_.]+/[A-Za-z0-9_.$]+', args.camera_component):
        raise RuntimeError('Invalid explicit camera Activity')
    resolve_command = ('cmd package resolve-activity --brief -n '+shlex.quote(args.camera_component)
                       if args.camera_component else 'cmd package resolve-activity --brief -a android.media.action.STILL_IMAGE_CAMERA')
    resolved = ar.shell(resolve_command)
    matches = re.findall(r'^([A-Za-z0-9_.]+/[A-Za-z0-9_.$]+)$', resolved, re.MULTILINE)
    if len(matches) != 1:
        raise RuntimeError('No unique existing native camera activity; no settings changed')
    component = matches[0]
    if args.camera_component and component != args.camera_component:
        raise RuntimeError('Resolved camera component differs from the explicitly requested fixture')
    camera = component.split('/')[0]
    owned_preview = bool(args.camera_component and camera == 'ls.augment.privacycamerafixture')
    spec = importlib.util.spec_from_file_location('spacing_collector', ar.ROOT / 'tools/run-c17-spacing-device.py')
    spacing = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(spacing)
    journal = {'pending': True, 'deviceSerial': ar.SERIAL, 'installedVersion': version,
               'values': {KEY: baseline[KEY]}, 'cameraActivity': component}
    atomic(output / 'restore.json', journal)
    report = {'installedVersion': version, 'deviceSerial': ar.SERIAL, 'cases': [], 'configurationRestored': False,
              'cameraActivity': component, 'visualReviewRequired': True, 'errors': [],
              'limits': ['No photo/video recording', 'No permissions granted or prompts accepted',
                         'Current portrait/landscape only', 'Camera preview only; lock-screen and microphone not covered',
                         'Candidate green pixels are not automatically accepted as the native dot',
                         'Rounded-corner decoration windows may be excluded from screenshots; runtime geometry is not physical-display visual proof',
                         'Owned preview is freshly opened after each settings write; continuous-preview live edits are not covered']}
    try:
        ar.shell('input keyevent 224')
        ar.shell('wm dismiss-keyguard')
        ar.shell('cmd statusbar collapse')
        zero = spacing.merge_spacing(baseline[KEY], {('main', 'privacy.dot'): (0, 0, 0, 0)})
        instrument('set', 'native-zero', {KEY: zero})
        open_camera(component, owned_preview)
        first = capture('native', version, camera)
        report['cases'].append(first)
        usable = [o for o in first['freshBuildObservations'] if o['status'] in ('native', 'applied', 'outside_capacity')]
        if not first['cameraVisible'] or not first['cameraAppOpRunning'] or len(usable) != 1:
            report['status'] = 'native_dot_or_geometry_not_observed'
            return
        limits = usable[0]
        for index, edge_name in enumerate(('start', 'top', 'end', 'bottom')):
            capacity = limits['horizontal' if index in (0, 2) else 'vertical']
            amount = min(4, capacity)
            if not amount:
                report['cases'].append({'label': edge_name, 'status': 'no_safe_capacity', 'maximum': 0})
                continue
            edges = [0, 0, 0, 0]
            edges[index] = amount
            raw = spacing.merge_spacing(baseline[KEY], {('main', 'privacy.dot'): tuple(edges)})
            instrument('set', edge_name+'-spacing', {KEY: raw})
            if owned_preview: open_camera(component, True)
            else: time.sleep(2)
            case = capture(edge_name, version, camera)
            case['requestedEdgesDp'] = edges
            report['cases'].append(case)
            atomic(output / 'report.json', report)
        if limits['horizontal'] < 48 or limits['vertical'] < 48:
            outside = spacing.merge_spacing(baseline[KEY], {('main', 'privacy.dot'): (24, 24, 24, 24)})
            instrument('set', 'outside-capacity-spacing', {KEY: outside})
            if owned_preview: open_camera(component, True)
            else: time.sleep(2)
            report['cases'].append(capture('outside-capacity', version, camera))
        instrument('set', 'native-zero-restored', {KEY: zero})
        if owned_preview: open_camera(component, True)
        else: time.sleep(2)
        report['cases'].append(capture('native-restored', version, camera))
        report['status'] = 'evidence_collected_visual_review_pending'
    except BaseException:
        report['errors'].append(traceback.format_exc())
        report['status'] = 'collection_failed'
        raise
    finally:
        try:
            recover(output, journal)
            after = instrument('snapshot', 'all-settings-restored')['settings']
            differences = {k: {'before': v, 'after': after.get(k)} for k, v in baseline.items() if after.get(k) != v}
            report['configurationRestored'] = not differences
            report['unexpectedSettingDifferences'] = differences
            if differences:
                raise RuntimeError('Unrelated settings changed; inspect report before more tests')
        except BaseException:
            report['errors'].append(traceback.format_exc())
            raise
        finally:
            atomic(output / 'report.json', report)
            print('Evidence:', output, flush=True)


if __name__ == '__main__':
    main()
