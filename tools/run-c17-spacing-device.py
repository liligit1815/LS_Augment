"""Collect native sub-icon spacing evidence without changing radio or row modes.

Writing/importing this script does not contact a device. Running it changes only
the spacing configuration, records three native surfaces, and restores that key.
An interrupted run leaves restore.json; use --restore-only with the same output
directory before collecting again. Screenshots/geometry require human review;
diagnostic strings are supporting observations, never a visual PASS criterion.
"""
import argparse
import contextlib
import datetime as dt
import json
import os
from pathlib import Path
import re
import struct
import time
import traceback
import xml.etree.ElementTree as ET

import adb_regression as ar
import native_ui_helpers as ui

SPACING = 'ls_augment_statusbar_icon_spacing_v1'
MASTER = 'ls_augment_systemui_master'
SURFACES = ('main', 'control', 'notification')
WIFI = {'wifi.signal': (8, 2, 3, 1), 'wifi.activity_inout': (1, 3, 6, 2)}
MOBILE = {'mobile1.signal': (6, 2, 2, 1), 'mobile1.type': (1, 1, 5, 3),
          'mobile1.volte': (3, 2, 7, 1)}


def now():
    return dt.datetime.now(dt.timezone.utc).isoformat()


def atomic_json(path, value):
    temporary = path.with_name(path.name + '.tmp')
    with temporary.open('w', encoding='utf-8', newline='\n') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)


def source_version():
    text = (ar.ROOT / 'android/version.properties').read_text(encoding='utf-8')
    code = re.search(r'^versionCode=(\d+)\s*$', text, re.MULTILINE)
    name = re.search(r'^versionName=(.+)$', text, re.MULTILINE)
    if not code or not name:
        raise RuntimeError('Cannot read explicit version from android/version.properties')
    return {'versionCode': int(code[1]), 'versionName': name[1].strip()}


def merge_spacing(raw, changes):
    """Keep all unrelated and all/lock rules; exact captured surfaces take precedence."""
    rules = {}
    if raw:
        parts = raw.split(';')
        if parts[0] != 'IS1':
            raise ValueError('Unsupported existing spacing format; baseline must not be rewritten')
        for part in parts[1:]:
            fields = part.split(',')
            if len(fields) != 6 or (fields[0], fields[1]) in rules:
                raise ValueError('Malformed/duplicate existing spacing rule')
            edges = tuple(int(value) for value in fields[2:])
            if any(value < 0 or value > 24 for value in edges):
                raise ValueError('Existing spacing edge is outside the supported range')
            rules[(fields[0], fields[1])] = edges
    rules.update(changes)
    if len(rules) > 256:
        raise ValueError('Fixture would exceed the supported 256 spacing rules')
    return '' if not rules else 'IS1;' + ';'.join(
        ','.join((surface, identity, *(str(value) for value in edges)))
        for (surface, identity), edges in sorted(rules.items()))


def selected_rules(baseline_cases, requested):
    """Use existing visible combinations; hidden subparts remain native-hidden."""
    changes, scope = {}, []
    for surface in SURFACES:
        case = next((item for item in baseline_cases if item['surface'] == surface), {})
        inventory = case.get('inventory', {})
        rows = inventory.get('surfaces', {}).get(surface, [])
        fresh = case.get('inventoryFreshForSurface', False)
        for identity, edges in requested.items():
            owner = identity.split('.')[0]
            own = [row for row in rows if row.get('id') == identity]
            family = [row for row in rows if row.get('id') == owner or row.get('id', '').startswith(owner + '.')]
            visible_family = any(row.get('state') == 'visible' for row in family)
            if not case.get('surfaceVerified') or not fresh or not visible_family or not own:
                status = 'not_configured_no_fresh_visible_native_combination'
            else:
                changes[(surface, identity)] = edges
                status = 'configured_visible' if any(row.get('state') == 'visible' for row in own) else 'configured_native_hidden'
            scope.append({'surface': surface, 'icon': identity, 'edgesDp': list(edges), 'status': status,
                          'nativeStates': [row.get('state') for row in own]})
    return changes, scope


class Collection:
    def __init__(self, output, version, settle):
        self.output, self.version, self.settle = output, version, settle
        self.journal_path = output / 'restore.json'
        self.journal = None
        self.baseline = {}
        self.expected_spacing = None
        self.report = {'sourceVersion': version, 'deviceSerial': ar.SERIAL, 'startedAt': now(),
                       'status': 'collecting', 'configurationRestored': None, 'visualReviewPending': True,
                       'scope': 'Existing Wi-Fi and SIM 1 sub-icon geometry on main/control/notification; no radio toggles, no forced visibility, no row/layout/profile changes.',
                       'excluded': ['lock screen', 'SIM 2', 'connection state transitions', 'avatar', 'privacy appearance', 'privacy.dot', 'single/dual row mode switching'],
                       'onlyMutatedKey': SPACING, 'cases': [], 'phases': [], 'errors': []}

    def progress(self, phase, surface=None):
        self.report.update(currentPhase=phase, currentSurface=surface, updatedAt=now())
        atomic_json(self.output / 'report.json', self.report)

    def read_settings(self, label):
        return ar.instrument('snapshot', label)['settings']

    def assert_preserved(self, settings, label):
        # This includes row count, Grid layout, sizes, assets, font settings and master.
        differences = {key: {'before': value, 'after': settings.get(key)}
                       for key, value in self.baseline.items() if key != SPACING and settings.get(key) != value}
        if differences:
            atomic_json(self.output / (label + '-unexpected-config-diff.json'), differences)
            raise AssertionError('Configuration outside the spacing key changed; inspect saved diff')
        if self.expected_spacing is not None and settings.get(SPACING) != self.expected_spacing:
            raise AssertionError('Spacing readback differs from the requested value')

    def set_spacing(self, label, raw):
        # Durable write-ahead recovery must precede even the first attempted save.
        self.journal = {'pending': True, 'deviceSerial': ar.SERIAL, 'sourceVersion': self.version,
                        'startedAt': self.report['startedAt'], 'updatedAt': now(),
                        'values': {SPACING: self.baseline[SPACING]}, 'attemptingPhase': label}
        atomic_json(self.journal_path, self.journal)
        self.progress(label + '-saving')
        ar.instrument('set', label + '-set', {SPACING: raw})
        self.expected_spacing = raw
        self.assert_preserved(self.read_settings(label + '-readback'), label)

    def open_surface(self, surface):
        ar.shell('input keyevent 224')
        ar.shell('wm dismiss-keyguard')
        ar.shell('am start -W -n ls.augment.com/.SettingsActivity')
        ar.shell('cmd statusbar collapse')
        time.sleep(.6)
        if surface == 'control':
            ar.shell('cmd statusbar expand-settings')
        elif surface == 'notification':
            # Use actual screenshot dimensions, including a pre-existing landscape profile.
            png = ar.adb('exec-out', 'screencap -p')
            if png[:8] != b'\x89PNG\r\n\x1a\n':
                raise RuntimeError('Cannot determine current native display geometry')
            width, height = struct.unpack('>II', png[16:24])
            x = max(1, round(width * .15))
            ar.shell(f'input swipe {x} 5 {x} {round(height * .66)} 650')
        opened = int(ar.shell('date +%s')) * 1000
        time.sleep(self.settle)
        return opened

    def capture(self, phase, surface):
        label = phase + '-' + surface
        self.progress(phase, surface)
        case = {'phase': phase, 'surface': surface, 'sourceVersion': self.version,
                'label': label, 'status': 'collecting', 'visualReviewPending': True,
                'surfaceVerified': False, 'evidenceDirectory': str(self.output / label)}
        self.report['cases'].append(case)
        self.progress(phase, surface)
        try:
            opened = self.open_surface(surface)
            folder = self.output / label
            folder.mkdir(exist_ok=True)
            (folder / 'screen.png').write_bytes(ar.adb('exec-out', 'screencap -p'))
            windows = ui.all_windows(label)  # Persists full actual native accessibility trees.
            visible = [node for node in ui.nodes(windows) if node.get('visible')]
            ids = {node.get('id', '').split('/')[-1] for node in visible}
            expected = {'control': 'control_panel', 'notification': 'notification_stack_scroller'}.get(surface)
            case['surfaceVerified'] = expected in ids if expected else (
                any(node.get('package') == 'ls.augment.com' for node in visible)
                and not ({'control_panel', 'notification_stack_scroller'} & ids))
            geometry = [{key: node.get(key) for key in ('id', 'class', 'bounds', 'visible', 'clickable')}
                        for node in ui.nodes(windows)
                        if any(token in node.get('id', '').lower() for token in
                               ('wifi', 'mobile', 'inout', 'roaming', 'volte', 'status_icon', 'system_icon', 'status_bar', 'cc_header'))]
            (folder / 'native-window-dump.txt').write_text(ar.shell('dumpsys window windows'), encoding='utf-8')
            raw = ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/ls_augment_diagnostics_v2.xml', root=True)
            diagnostics = {node.attrib['name']: node.text for node in ET.fromstring(raw)
                           if any(token in node.attrib.get('name', '') for token in ('statusbar_', 'systemui_', 'connectivity_'))}
            # The helper prints its full inventory response; retain that verbose
            # output as evidence instead of flooding the live collection console.
            with (folder / 'inventory-console.txt').open('w', encoding='utf-8') as inventory_log:
                with contextlib.redirect_stdout(inventory_log):
                    runtime = ar.instrument('statusbar-assets-runtime', label + '-inventory')['statusbarRuntime']
            inventory = runtime.get('inventory') or {}
            observed = inventory.get('surfaceObservedAt', {}).get(surface, 0)
            case.update(geometry=geometry, diagnostics=diagnostics, inventory=inventory,
                        openedAtDeviceMs=opened, inventoryFreshForSurface=bool(observed >= opened),
                        systemuiPid=ar.shell('pidof com.android.systemui'), capturedAt=now(),
                        status='evidence_collected' if case['surfaceVerified'] else 'wrong_or_unverified_surface',
                        limitation='Accessibility can omit non-accessible child Views; inspect screenshots and the full native tree together. Inventory/diagnostics do not prove spacing geometry.')
            atomic_json(folder / 'geometry-and-runtime.json', case)
            self.assert_preserved(self.read_settings(label + '-configuration'), label)
            row_count = len(inventory.get('surfaces', {}).get(surface, []))
            print(f'{label}: {len(geometry)} geometry nodes, {row_count} inventory rows; visual review pending', flush=True)
        except BaseException as error:
            case.update(status='collection_error', error=repr(error), traceback=traceback.format_exc())
            raise
        finally:
            self.progress(phase, surface)
        return case

    def phase(self, name, scope=None):
        self.report['phases'].append({'name': name, 'scope': scope or [], 'startedAt': now()})
        cases = [self.capture(name, surface) for surface in SURFACES]
        self.report['phases'][-1]['completedAt'] = now()
        self.progress(name + '-complete')
        return cases

    def restore(self):
        if self.journal is None or not self.journal.get('pending'):
            return
        self.progress('restoring-configuration')
        ar.instrument('set', 'finally-restore-set', self.journal['values'])
        after = self.read_settings('finally-restore-readback')
        restored = all(after.get(key) == value for key, value in self.journal['values'].items())
        self.report['configurationRestored'] = restored
        if not restored:
            raise AssertionError('Recovery readback mismatch; restore.json remains pending')
        self.expected_spacing = self.baseline[SPACING] if self.baseline else self.journal['values'][SPACING]
        if self.baseline:
            self.assert_preserved(after, 'finally-restore')
        self.journal.update(pending=False, restoredAt=now())
        atomic_json(self.journal_path, self.journal)

    def run(self, restore_only):
        if self.journal_path.exists():
            saved = json.loads(self.journal_path.read_text(encoding='utf-8'))
            if saved.get('pending'):
                if saved.get('deviceSerial') != ar.SERIAL or set(saved.get('values', {})) != {SPACING}:
                    raise RuntimeError('Recovery journal does not match this device/key; preserve it for inspection')
                if not restore_only:
                    raise RuntimeError('Previous recovery is pending; run --restore-only with this output directory first')
                self.journal = saved
            elif not restore_only:
                raise RuntimeError('This output already contains a completed run; choose a new --output directory')
        if not restore_only and (self.output / 'report.json').exists():
            raise RuntimeError('This output already contains collection evidence; choose a new --output directory')
        if restore_only:
            if self.journal is None:
                raise RuntimeError('No pending spacing recovery journal found')
            # Recovery must extend the interrupted report, never erase prior screenshots/cases.
            report_path = self.output / 'report.json'
            if report_path.exists():
                previous = json.loads(report_path.read_text(encoding='utf-8'))
                if previous.get('deviceSerial') == ar.SERIAL:
                    self.report = previous
            self.report['manualRecoverySourceVersion'] = self.version
            self.restore()
            self.progress('manual-recovery-complete')
            atomic_json(self.output / 'manual-recovery.json', {'restoredAt': now(), 'configurationRestored': True, 'sourceVersion': self.version})
            ar.shell('cmd statusbar collapse')
            return

        self.baseline = self.read_settings('baseline-configuration')
        atomic_json(self.output / 'baseline-settings-private.json', self.baseline)
        if SPACING not in self.baseline:
            raise RuntimeError('Installed module does not register the spacing key')
        if self.baseline.get(MASTER) not in ('1', 'true'):
            raise RuntimeError('Status-bar customization is disabled; this capture does not change the user master switch')
        package = ar.shell('dumpsys package ls.augment.com')
        installed = re.search(r'\bversionCode=(\d+)', package)
        self.report['installedVersionCode'] = int(installed[1]) if installed else None
        if self.report['installedVersionCode'] != self.version['versionCode']:
            raise RuntimeError('Installed module differs from android/version.properties; no spacing was changed')
        self.expected_spacing = self.baseline[SPACING]
        self.report['baselineProfile'] = {name: ar.shell(command) for name, command in {
            'displaySize': 'wm size', 'density': 'wm density', 'fontScale': 'settings get system font_scale',
            'userRotation': 'settings get system user_rotation', 'automaticRotation': 'settings get system accelerometer_rotation',
            'controlPanelMode': 'settings get system use_control_panel', 'wifiSetting': 'settings get global wifi_on',
            'mobileDataSetting': 'settings get global mobile_data', 'airplaneSetting': 'settings get global airplane_mode_on'}.items()}
        self.report['baselineLayout'] = {key: value for key, value in self.baseline.items()
                                         if key.startswith('ls_augment_statusbar_') or key == MASTER}
        try:
            baseline_cases = self.phase('baseline')
            for name, requested in (('wifi-edges', WIFI), ('mobile1-multiple-edges', MOBILE)):
                changes, scope = selected_rules(baseline_cases, requested)
                if not changes:
                    self.report['phases'].append({'name': name, 'status': 'skipped_no_fresh_native_combination', 'scope': scope})
                    self.progress(name + '-skipped')
                    continue
                self.set_spacing(name, merge_spacing(self.baseline[SPACING], changes))
                self.phase(name, scope)
                # Exact baseline restores existing user spacing too, rather than clearing it.
                self.set_spacing(name + '-restore', self.baseline[SPACING])
                self.phase(name + '-restored', scope)
            self.report['status'] = 'collection_complete_visual_review_pending'
        except BaseException as error:
            self.report['status'] = 'interrupted_or_failed'
            self.report['errors'].append({'at': now(), 'error': repr(error), 'traceback': traceback.format_exc()})
            raise
        finally:
            try:
                self.restore()
                if self.journal is None:
                    self.assert_preserved(self.read_settings('unchanged-readback'), 'unchanged-readback')
                    self.report['configurationRestored'] = True
            except BaseException as error:
                self.report['configurationRestored'] = False
                self.report['errors'].append({'at': now(), 'phase': 'restore', 'error': repr(error)})
                raise
            finally:
                self.report['finishedAt'] = now()
                self.progress('finished')
                try:
                    ar.shell('cmd statusbar collapse')
                except Exception as error:
                    self.report['errors'].append({'phase': 'collapse-panel', 'error': repr(error)})
                    self.progress('finished')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, help='Fresh evidence directory; reuse only for --restore-only')
    parser.add_argument('--restore-only', action='store_true', help='Recover the saved spacing key without collecting or changing other settings')
    parser.add_argument('--settle-seconds', type=float, default=11, help='Wait for native layout and inventory publication (default: 11)')
    args = parser.parse_args()
    if not 5 <= args.settle_seconds <= 30:
        parser.error('--settle-seconds must be between 5 and 30')
    version = source_version()
    output = (args.output or ar.ROOT / ('out/full-function-audit-20261004/c17-spacing-' + str(version['versionCode']))).resolve()
    output.mkdir(parents=True, exist_ok=True)
    ar.OUTPUT = ui.OUTPUT = output
    Collection(output, version, args.settle_seconds).run(args.restore_only)


if __name__ == '__main__':
    main()
