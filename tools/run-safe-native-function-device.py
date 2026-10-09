"""Opt-in native cases with a write-ahead recovery journal. Never run on import.

Default: real side-gesture pixels, native screenshot/recording, owned FLAG_SECURE
capture. Optional installer confirmation and native recent-memory cases complete
nine inventory features. Review the selected cases before operating a device.
"""
from pathlib import Path
import argparse
import base64
import contextlib
import datetime
import hashlib
import json
import os
import re
import shlex
import time
import traceback
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / 'out/full-function-audit-20261004'
PACKAGE = 'ls.augment.regression.safeaudit'
FIXTURE = AUDIT / 'safe-native-fixture/safe-audit.apk'
INSTALLER_KEYS = ['ls_augment_rm_installer_' + name for name in ['skip_scan', 'hide_purify', 'hide_store', 'cts']]
CAPTURE_KEYS = ['ls_augment_rm_screenshot_hide_status_bar', 'ls_augment_rm_record_hide_status_bar']
SECURE_KEY = 'ls_augment_rm_secure_capture'
RECORDER = 'com.android.ztescreenshot'
# Verified from the exact NX809J APK supplied by the device owner. Until's
# microphone/system-audio keys really are the strings "0" and "1".
RECORDER_APK_SHA256 = '5554eb6edaeb110c3c40d8cf7e0df4b8bc99fabc9de1e4b2904da2ab36ca42ff'
RECORDER_SETTINGS = {
    'system': ['0', '1', 'record_sound_index', 'selectRecordTypeSwitchOn',
               'launcherAnimInAreaRecordSelect', 'user_guide_stop', 'recording_screen_status',
               'show_touches', 'resume_show_touch', 'mipop_isShow'],
    'global': ['record_screen_state', 'zte_is_show_menu'],
}
RECORDER_POSITION_PREFS = '/data/user/0/' + RECORDER + '/shared_prefs/com.android.ztescreenshot.screenrecord.location.xml'
FEATURES = {'gesture': ['V2-147'], 'capture': ['V2-001', 'V2-002'], 'secure': ['V2-175'],
            'installer': ['V2-016', 'V2-017', 'V2-018', 'V2-019'], 'recents': ['V2-064']}


def atomic(path, value):
    temporary = path.with_suffix(path.suffix + '.tmp')
    with temporary.open('w', encoding='utf-8') as output:
        output.write(json.dumps(value, ensure_ascii=False, indent=2))
        output.flush()
        os.fsync(output.fileno())
    temporary.replace(path)


def mp4_handlers(raw):
    """Read declared MP4 media handlers, not byte strings inside video data."""
    handlers = []
    def boxes(start, end, parents=()):
        offset = start
        while offset < end:
            if offset + 8 > end: raise ValueError('Truncated MP4 box header')
            size, header = int.from_bytes(raw[offset:offset + 4], 'big'), 8
            kind = raw[offset + 4:offset + 8]
            if size == 1:
                if offset + 16 > end: raise ValueError('Truncated extended MP4 box')
                size, header = int.from_bytes(raw[offset + 8:offset + 16], 'big'), 16
            elif size == 0: size = end - offset
            if size < header or offset + size > end: raise ValueError('Invalid MP4 box bounds')
            body, stop = offset + header, offset + size
            if kind in (b'moov', b'trak', b'mdia'):
                boxes(body, stop, parents + (kind,))
            elif kind == b'hdlr' and parents == (b'moov', b'trak', b'mdia'):
                if stop - body < 12: raise ValueError('Truncated MP4 media handler')
                handlers.append(raw[body + 8:body + 12].decode('ascii'))
            offset = stop
    boxes(0, len(raw))
    if not handlers or 'vide' not in handlers: raise ValueError('No declared video track')
    return handlers


class Journal:
    """Keep the first original value, even if a set applies before transport fails."""
    def __init__(self, path, baseline=None, metadata=None):
        self.path = path
        self.data = json.loads(path.read_text(encoding='utf-8')) if baseline is None else {
            'schema': 1, 'pending': True, 'baseline': baseline, 'restore': {}, 'metadata': metadata or {},
            'fixtureInstallAttempted': False, 'fixtureWasPresent': False, 'ownedFiles': [],
            'plannedFiles': [], 'recordingMayBeActive': False, 'recorderUiMayBeOpen':False, 'nativeCapturePending': None,
        }
        if baseline is not None:
            self.save()

    def save(self):
        atomic(self.path, self.data)

    def touch(self, keys):
        for key in keys:
            if key not in self.data['baseline']:
                raise ValueError('Unknown current configuration key: ' + key)
            self.data['restore'].setdefault(key, self.data['baseline'][key])
        self.data['pending'] = True
        self.save()

    def restore_config(self, instrument):
        if self.data['restore']:
            instrument('set', 'restore-config', self.data['restore'])
        actual = instrument('snapshot', 'restore-readback')['settings']
        mismatch = {key: {'expected': value, 'actual': actual.get(key)}
                    for key, value in self.data['baseline'].items() if actual.get(key) != value}
        mismatch.update({key: {'expected': None, 'actual': actual[key]}
                         for key in actual if key not in self.data['baseline']})
        self.data['configurationRestored'] = not mismatch
        self.data['configurationDifferences'] = mismatch
        self.save()
        if mismatch:
            raise RuntimeError('Full configuration differs after restoration; journal retained')


class Runner:
    def __init__(self, ar, folder, journal, report):
        self.ar, self.folder, self.journal, self.report = ar, folder, journal, report
        ar.OUTPUT = folder
        import native_ui_helpers as ui
        ui.OUTPUT = folder
        self.ui = ui
        self.sequence = 0
        # Deliberately not reconstructed from a recovery journal. A new host
        # process cannot prove that a live recorder still belongs to its old run.
        self.recorder_lease = None

    def persist(self):
        atomic(self.folder / 'report.json', self.report)

    def instrument(self, operation, label, values=None, *, case_filter=None):
        self.sequence += 1
        unique = '%03d-%s' % (self.sequence, label)
        with (self.folder / (unique + '-console.txt')).open('w', encoding='utf-8') as output:
            with contextlib.redirect_stdout(output):
                if case_filter is not None:
                    return self.ar.instrument(operation, unique, values, case_filter=case_filter)
                return self.ar.instrument(operation, unique, values)

    def set(self, label, values):
        self.journal.touch(values)
        result = self.instrument('set', label, values)
        time.sleep(.8)
        return result

    def observe(self, label):
        windows = self.ui.all_windows(label)
        folder = self.folder / label
        folder.mkdir(exist_ok=True)
        (folder / 'screen.png').write_bytes(self.ar.adb('exec-out', 'screencap', '-p'))
        return [node for node in self.ui.nodes(windows) if node.get('visible')]

    def runtime_current(self, process, label):
        records = []
        pid = self.ar.adb('shell', 'pidof ' + process, check=False).decode('utf-8','replace').strip()
        if not re.fullmatch('[1-9][0-9]*', pid):
            atomic(self.folder/(label+'-runtime.json'), {'process':process,'pid':pid,'currentBuild':False})
            return False
        for _ in range(6):
            raw = self.ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/hook-processes.xml', root=True)
            try: parsed = ET.fromstring(raw)
            except ET.ParseError:
                # SharedPreferences can be midway through a telemetry rewrite.
                # Only a complete fresh document may establish the process gate.
                time.sleep(.2)
                continue
            for node in parsed:
                if node.tag == 'string' and node.text:
                    try:
                        value = json.loads(node.text)
                        if str(value.get('pid')) == pid and value.get('process') in (process, 'system' if process=='system_server' else process):
                            records = [value]
                    except (ValueError, TypeError): pass
            if records: break
            time.sleep(.5)
        boot = self.ar.shell('settings get global boot_count')
        current = (len(records)==1 and records[0].get('moduleVersion') == self.journal.data['metadata']['installedVersionName']
                   and records[0].get('moduleLoaded') is True and str(records[0].get('receivedBoot'))==boot)
        atomic(self.folder/(label+'-runtime.json'), {'process':process,'pid':pid,'currentBuild':current,'records':records})
        return current

    def tap(self, label, identity=None, text=None, before_tap=None):
        found = [node for node in self.observe(label + '-before')
                 if (node.get('id') == identity if identity else node.get('text') == text)]
        if len(found) != 1:
            clickable = [node for node in found if node.get('clickable')]
            if len(clickable) == 1:
                found = clickable
        if len(found) != 1:
            raise RuntimeError('Expected one observed control: ' + str(identity or text))
        bounds = list(map(int, re.findall(r'-?\d+', found[0]['bounds'])))
        if len(bounds) != 4 or bounds[2] <= bounds[0] or bounds[3] <= bounds[1]:
            raise RuntimeError('Observed control has no actual hit area')
        if before_tap is not None: before_tap()
        self.ar.shell('input tap %d %d' % ((bounds[0] + bounds[2]) // 2, (bounds[1] + bounds[3]) // 2))

    def native_setting(self, namespace, key):
        value = self.ar.shell('settings --user 0 get ' + namespace + ' ' + shlex.quote(key)).strip()
        if value == 'null': return None
        if not re.fullmatch(r'-?\d+', value):
            raise RuntimeError('Cannot read numeric native recorder setting: ' + namespace + '/' + key)
        return value

    def tap_stable_recorder_tile(self, label):
        time.sleep(.6)  # expand-settings returns before OEM tile animation ends.
        last = None
        for attempt in range(4):
            matches = [node for node in self.observe(label + '-ready-' + str(attempt))
                       if node.get('package') == 'com.android.systemui' and node.get('text') == '录屏'
                       and node.get('visible') is True and node.get('clickable') is True and node.get('enabled') is True]
            node = matches[0] if len(matches) == 1 else None
            bounds = list(map(int, re.findall(r'-?\d+', node.get('bounds', '')))) if node else []
            positive = len(bounds) == 4 and bounds[2] > bounds[0] and bounds[3] > bounds[1]
            current = tuple(bounds) if positive else None
            if current is not None and current == last:
                def mark_open_attempt():
                    self.journal.data['recorderUiMayBeOpen'] = True
                    self.journal.data['recorderLaunchPending'] = True
                    self.journal.data['recorderPid'] = self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip()
                    self.journal.save()
                self.tap(label + '-stable', text='录屏', before_tap=mark_open_attempt)
                return
            last = current
            if attempt < 3: time.sleep(.4)
        raise RuntimeError('Recorder tile not visibly stable in fresh UI observations; no invisible control was clicked')

    def media_command(self, command):
        # NX809J MediaStore rejects root UID 0 for deletion despite exit code 0.
        # Public owned media is queried/deleted as Android shell, then reverified.
        output = self.ar.shell(command)
        if re.search(r'\b(?:error|exception)\b|[A-Za-z]*Exception\b|Permission\s+Denial', output, re.I):
            raise RuntimeError('MediaStore command reported an error: ' + output[:300])
        return output

    def recorder_position_file(self, suffix=''):
        path = RECORDER_POSITION_PREFS + suffix
        encoded = self.ar.shell('if [ -f ' + shlex.quote(path) + ' ]; then base64 < ' + shlex.quote(path)
                                + '; else echo ABSENT; fi', root=True).strip()
        if encoded == 'ABSENT': return None
        raw = base64.b64decode(''.join(encoded.split()), validate=True)
        tree = ET.fromstring(raw)
        if tree.tag != 'map': raise RuntimeError('Unexpected recorder position preferences')
        return raw

    def prepare_recorder_position(self):
        if self.recorder_position_file('.bak') is not None:
            raise RuntimeError('Native position preferences have an in-progress backup; preserve before any test')
        raw = self.recorder_position_file()
        position = {'base64': base64.b64encode(raw).decode('ascii') if raw is not None else None}
        if raw is not None:
            metadata = self.ar.shell("stat -c '%u %g %a' " + shlex.quote(RECORDER_POSITION_PREFS), root=True).split()
            if len(metadata) != 3 or not all(re.fullmatch(r'\d+', value) for value in metadata):
                raise RuntimeError('Cannot preserve native recorder preference permissions')
            position.update(uid=metadata[0], gid=metadata[1], mode=metadata[2])
        self.journal.data['nativeRecorderPosition'] = position
        self.journal.save()

    def restore_recorder_position(self):
        saved = self.journal.data.get('nativeRecorderPosition')
        if saved is None: return
        temporary = RECORDER_POSITION_PREFS + '.duo-audit-' + hashlib.sha256(str(self.journal.path).encode()).hexdigest()[:12] + '.tmp'
        def discard_owned_temporary():
            if self.journal.data.get('nativeRecorderPositionTemporaryOwned'):
                if self.ar.shell('if [ -e ' + shlex.quote(temporary) + ' ]; then echo exists; fi', root=True):
                    actual_hash = self.ar.shell('sha256sum ' + shlex.quote(temporary), root=True).split()[0]
                    if actual_hash != self.journal.data.get('nativeRecorderPositionTemporaryHash'):
                        raise RuntimeError('Position recovery temporary changed or incomplete; preserve instead of deleting')
                    self.ar.shell('rm -- ' + shlex.quote(temporary), root=True)
                self.journal.data['nativeRecorderPositionTemporaryOwned'] = False
                self.journal.save()
        expected = base64.b64decode(saved['base64'], validate=True) if saved['base64'] is not None else None
        actual, backup = self.recorder_position_file(), self.recorder_position_file('.bak')
        if actual == expected and backup is None:
            discard_owned_temporary()
            self.journal.data['nativeRecorderPositionRestored'] = True; self.journal.save(); return
        if self.journal.data.get('recorderUiMayBeOpen') or self.journal.data.get('recordingMayBeActive') or self.ar.adb(
                'shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip():
            raise RuntimeError('Cannot restore position while recorder ownership or process is live')
        # Only the two known location keys may differ. Preserve unexpected app
        # preference changes instead of overwriting them with an old whole file.
        def other_keys(raw):
            return {} if raw is None else {node.get('name'): ET.tostring(node, encoding='unicode')
                for node in ET.fromstring(raw) if node.get('name') not in ('record_window_x', 'record_window_y')}
        for raw in (actual, backup):
            if raw is not None and other_keys(raw) != other_keys(expected):
                raise RuntimeError('Unrelated native position preference changed; preserve it')
        self.journal.data['nativeRecorderPositionRestored'] = False; self.journal.save()
        if expected is None:
            if actual is not None: self.ar.shell('rm -- ' + shlex.quote(RECORDER_POSITION_PREFS), root=True)
        else:
            for field in ('uid','gid','mode'):
                if not re.fullmatch(r'\d+', saved[field]): raise RuntimeError('Invalid saved preference permissions')
            if not self.journal.data.get('nativeRecorderPositionTemporaryOwned'):
                if self.ar.shell('if [ -e ' + shlex.quote(temporary) + ' ]; then echo exists; fi', root=True):
                    raise RuntimeError('Position recovery temporary already exists; refuse overwrite')
                self.journal.data['nativeRecorderPositionTemporaryOwned'] = True
                self.journal.data['nativeRecorderPositionTemporaryHash'] = hashlib.sha256(expected).hexdigest()
                self.journal.save()
            elif self.ar.shell('if [ -e ' + shlex.quote(temporary) + ' ]; then echo exists; fi', root=True):
                checksum = self.ar.shell('sha256sum ' + shlex.quote(temporary), root=True).split()[0]
                if checksum != self.journal.data.get('nativeRecorderPositionTemporaryHash'):
                    raise RuntimeError('Position recovery temporary identity changed; refuse overwrite')
            self.ar.shell('printf %s ' + shlex.quote(saved['base64']) + ' | base64 -d > ' + shlex.quote(temporary), root=True)
            checksum = self.ar.shell('sha256sum ' + shlex.quote(temporary), root=True).split()[0]
            if checksum != hashlib.sha256(expected).hexdigest(): raise RuntimeError('Position recovery temporary is incomplete')
            self.ar.shell('chown ' + saved['uid'] + ':' + saved['gid'] + ' ' + shlex.quote(temporary), root=True)
            self.ar.shell('chmod ' + saved['mode'] + ' ' + shlex.quote(temporary), root=True)
            self.ar.shell('mv -- ' + shlex.quote(temporary) + ' ' + shlex.quote(RECORDER_POSITION_PREFS), root=True)
            self.ar.shell('restorecon ' + shlex.quote(RECORDER_POSITION_PREFS), root=True)
        if backup is not None: self.ar.shell('rm -- ' + shlex.quote(RECORDER_POSITION_PREFS + '.bak'), root=True)
        if self.recorder_position_file() != expected or self.recorder_position_file('.bak') is not None:
            raise RuntimeError('Native position preferences differ after restoration')
        discard_owned_temporary()
        self.journal.data['nativeRecorderPositionRestored'] = True; self.journal.save()

    def prepare_recorder(self):
        """Save native defaults before even opening UI, which normalizes them."""
        paths = [line[8:] for line in self.ar.shell('pm path ' + RECORDER).splitlines() if line.startswith('package:')]
        if len(paths) != 1:
            raise RuntimeError('Recorder APK identity is ambiguous; no recording attempted')
        checksum = self.ar.shell('sha256sum ' + shlex.quote(paths[0]), root=True).split()[0]
        if checksum != RECORDER_APK_SHA256:
            raise RuntimeError('Recorder differs from offline-audited native implementation; no recording attempted')
        for key in ['record_screen_state', 'cn.zte.recorder.recording_state']:
            if self.native_setting('global', key) not in (None, '0'):
                raise RuntimeError('Existing native recording state; preserve current session')
        if 'nativeRecorderSettings' not in self.journal.data:
            baseline = {namespace: {key: self.native_setting(namespace, key) for key in keys}
                        for namespace, keys in RECORDER_SETTINGS.items()}
            if baseline['system']['selectRecordTypeSwitchOn'] not in (None, '1'):
                raise RuntimeError('Area recording selected; this batch requires existing full-screen mode and will not change it')
            self.prepare_recorder_position()
            self.journal.data.update(nativeRecorderSettings=baseline, nativeRecorderSettingsRestored=False,
                                     recorderApkSha256=checksum)
            self.journal.save()  # Before app constructor/settings observers run.

    def assert_recorder_muted(self):
        values = {key: self.native_setting('system', key) for key in ['0', '1', 'record_sound_index']}
        if any(value != '0' for value in values.values()):
            raise RuntimeError('Native recorder is not confirmed muted; start control was not clicked')
        if self.native_setting('system', 'selectRecordTypeSwitchOn') != '1':
            raise RuntimeError('Full-screen recording no longer selected; start control was not clicked')
        return values

    def mute_recorder(self, label):
        prefix = RECORDER + ':id/'
        ids = [prefix + 'record_mic_on_switch', prefix + 'record_system_on_switch']
        current = self.observe(label + '-audio-before')
        if not all(any(node.get('id') == identity for node in current) for identity in ids):
            self.tap(label + '-audio-menu', identity=prefix + 'sound_type')
        for index, identity in enumerate(ids):
            found = [node for node in self.observe(label + '-audio-switch-' + str(index)) if node.get('id') == identity]
            if len(found) != 1 or not isinstance(found[0].get('checked'), bool):
                raise RuntimeError('Native audio switch state unavailable; recording not started')
            if found[0]['checked']:
                self.tap(label + '-audio-disable-' + str(index), identity=identity)
                time.sleep(.2)
        current = self.observe(label + '-audio-muted')
        for identity in ids:
            found = [node for node in current if node.get('id') == identity]
            if len(found) != 1 or found[0].get('checked') is not False:
                raise RuntimeError('Native audio switch did not turn off; recording not started')
        values = self.assert_recorder_muted()
        atomic(self.folder / (label + '-audio-gate.json'), {'muted': True, 'actualSettings': values,
                                                         'controlIds': ids, 'recorderApkSha256': RECORDER_APK_SHA256})

    def start_muted_recording(self, label):
        if not self.journal.data.get('nativeRecorderSettings'):
            raise RuntimeError('Native recorder baseline must be durable before starting')
        self.assert_recorder_muted()
        self.capture_begin(label)
        self.journal.data['nativeCapturePending']['triggerAttempted'] = False
        self.journal.save()
        self.journal.data['recordingMayBeActive'] = True
        self.journal.save()
        # A fresh UI observation occurs in tap; recheck sound immediately before
        # the actual input event so a slow observation cannot use stale sound state.
        def before_start():
            self.assert_owned_recorder(require_alive=True)
            self.assert_recorder_muted()
            self.journal.data['nativeCapturePending']['triggerAttempted'] = True
            self.journal.save()
        self.tap(label + '-start', identity=RECORDER + ':id/start_bn', before_tap=before_start)

    def recorder_identity(self, pid):
        if not re.fullmatch(r'[1-9][0-9]*', pid): raise RuntimeError('Recorder PID is ambiguous')
        boot = self.ar.shell('cat /proc/sys/kernel/random/boot_id').strip()
        if not re.fullmatch(r'[0-9a-fA-F]{8}(?:-[0-9a-fA-F]{4}){3}-[0-9a-fA-F]{12}', boot):
            raise RuntimeError('Recorder boot identity unavailable')
        raw = self.ar.shell('cat /proc/' + pid + '/stat', root=True).strip()
        # comm can contain spaces/parentheses. starttime is field 22, index 19
        # after the final ') ' delimiter (the following field is process state).
        parts = raw.rsplit(') ', 1)
        fields = parts[-1].split()
        if len(parts) != 2 or not raw.startswith(pid + ' (') or len(fields) < 20 or not fields[19].isdigit():
            raise RuntimeError('Recorder process start identity unavailable')
        return {'pid': pid, 'bootId': boot, 'startTicks': fields[19]}

    def claim_recorder(self):
        pid = self.ar.shell('pidof ' + RECORDER).strip()
        identity = self.recorder_identity(pid)
        self.recorder_lease = identity
        self.journal.data.update(recorderPid=pid, recorderIdentity=identity, recorderLaunchPending=False)
        self.journal.save()

    def await_recorder_menu(self, label):
        # Native launch runs after panel collapse and an OEM delayed message.
        # Do not confuse a successful tile tap with a visible recording menu.
        for attempt in range(8):
            current = self.observe(label + '-menu-' + str(attempt))
            if any(node.get('package') == RECORDER and node.get('id') == RECORDER + ':id/start_bn'
                   and node.get('enabled') is True for node in current):
                self.claim_recorder()
                return
            time.sleep(.5)
        raise RuntimeError('Native recording menu did not appear after the observed tile tap; recording was not started')

    def assert_owned_recorder(self, require_alive=False):
        pid = self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip()
        if not pid:
            if require_alive: raise RuntimeError('Owned recorder exited before the UI action; no input sent')
            return False
        if getattr(self, 'recorder_lease', None) is None:
            raise RuntimeError('Recovery cannot establish ownership of a live recorder; preserve it for explicit review')
        try:
            identity = self.recorder_identity(pid)
        except RuntimeError:
            # The OEM exits naturally after saving. A vanished /proc entry is
            # harmless only when a fresh package lookup confirms no process;
            # a live/replaced process or a required UI action still fails closed.
            remaining = self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip()
            if not remaining and not require_alive:
                return False
            raise
        if identity != self.recorder_lease:
            raise RuntimeError('Recorder PID was reused or device rebooted; preserve current process')
        return True

    def close_recorder(self):
        if not (self.journal.data.get('recordingMayBeActive') or self.journal.data.get('recorderUiMayBeOpen')): return
        if self.journal.data.get('recorderLaunchPending'):
            raise RuntimeError('Recorder launch is unresolved; retain recovery journal for a delayed menu instead of claiming cleanup')
        current_pid = self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip()
        owned_pid = self.journal.data.get('recorderPid', '')
        if current_pid and (not owned_pid or current_pid != owned_pid):
            raise RuntimeError('Recorder process differs from journaled start; preserve current session')
        if current_pid and self.assert_owned_recorder():
            try:
                visible = self.observe('restore-recorder')
            except Exception as error:
                visible = []
                self.journal.data['recorderStopObservationError'] = str(error)
                self.journal.save()
            if self.journal.data.get('recordingMayBeActive') and any(node.get('id') == RECORDER + ':id/stop_bn' for node in visible):
                self.tap('restore-stop-owned-recording', identity=RECORDER + ':id/stop_bn',
                         before_tap=lambda: self.assert_owned_recorder(require_alive=True))
                time.sleep(1)
            # This also closes a self-opened floating control after failed runtime
            # validation, before start was ever clicked. No existing UI is allowed.
            if self.assert_owned_recorder(): self.ar.shell('am force-stop ' + RECORDER)
            if self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip():
                raise RuntimeError('Owned recorder did not exit; preserve native preferences pending retry')
        self.journal.data.update(recordingMayBeActive=False, recorderUiMayBeOpen=False)
        if (self.journal.data.get('nativeCapturePending') or {}).get('triggerAttempted') is False:
            self.journal.data['nativeCapturePending'] = None
        self.journal.save()

    def restore_recorder_settings(self):
        baseline = self.journal.data.get('nativeRecorderSettings')
        if baseline is None: return
        if self.journal.data.get('recordingMayBeActive') or self.journal.data.get('recorderUiMayBeOpen'):
            raise RuntimeError('Native audio preferences cannot be restored while recorder ownership is unresolved')
        for namespace, keys in baseline.items():
            for key, value in keys.items():
                if key not in RECORDER_SETTINGS.get(namespace, []) or (value is not None and not re.fullmatch(r'-?\d+', value)):
                    raise RuntimeError('Unknown native recovery key/value; refuse arbitrary settings write')
        actual = {namespace: {key: self.native_setting(namespace, key) for key in keys}
                  for namespace, keys in baseline.items()}
        if actual == baseline:
            self.journal.data.update(nativeRecorderSettingsReadback=actual, nativeRecorderSettingsRestored=True)
            self.journal.save()
            return  # No normalization occurred (for example, failed before UI open).
        # No live app observer may rewrite the restored null/default combination.
        if self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8', 'replace').strip():
            raise RuntimeError('A recorder process is live; preserve it and keep audio restoration pending')
        self.journal.data['nativeRecorderSettingsRestored'] = False; self.journal.save()
        for namespace, keys in baseline.items():
            for key, value in keys.items():
                command = ('delete ' + namespace + ' ' + shlex.quote(key)) if value is None else (
                    'put ' + namespace + ' ' + shlex.quote(key) + ' ' + shlex.quote(value))
                self.ar.shell('settings --user 0 ' + command)
        actual = {namespace: {key: self.native_setting(namespace, key) for key in keys}
                  for namespace, keys in baseline.items()}
        self.journal.data['nativeRecorderSettingsReadback'] = actual
        self.journal.data['nativeRecorderSettingsRestored'] = actual == baseline
        self.journal.save()
        if actual != baseline: raise RuntimeError('Native recorder preferences differ after restoration')

    def package_hash(self):
        lines = self.ar.adb('shell', 'pm path ' + PACKAGE, check=False).decode('utf-8', 'replace').splitlines()
        paths = [line[8:] for line in lines if line.startswith('package:')]
        if not paths:
            return None
        if len(paths) != 1:
            raise RuntimeError('Existing fixture package has unexpected splits; preserve it')
        raw = self.ar.shell('sha256sum ' + shlex.quote(paths[0]), root=True).split()
        if not raw or not re.fullmatch('[a-f0-9]{64}', raw[0]):
            raise RuntimeError('Unable to identify existing fixture APK')
        return raw[0]

    def fixture(self):
        if not FIXTURE.exists():
            raise RuntimeError('Build local fixture first: python tools/build-safe-audit-fixture.py')
        expected = hashlib.sha256(FIXTURE.read_bytes()).hexdigest()
        existing = self.package_hash()
        if existing and existing != expected:
            raise RuntimeError('Package already exists with different APK; it will not be overwritten')
        self.journal.data.update(fixtureSha256=expected, fixtureWasPresent=existing is not None)
        self.journal.save()
        if existing is None:
            self.journal.data['fixtureInstallAttempted'] = True
            self.journal.save()  # Durable before even an ambiguous install result.
            output = self.ar.adb('install', str(FIXTURE)).decode('utf-8', 'replace')
            if 'Success' not in output or self.package_hash() != expected:
                raise RuntimeError('Owned fixture installation not confirmed')

    def start_fixture(self, secure=False):
        # Do this before the prepared-fixture save/trigger window. Starting an
        # Activity does not wake a dozing phone or dismiss its keyguard.
        self.ar.shell('input keyevent KEYCODE_WAKEUP')
        self.ar.shell('wm dismiss-keyguard')
        self.ar.shell('cmd statusbar collapse')
        component = PACKAGE + ('/.SecureActivity' if secure else '/.PlainActivity')
        result = self.ar.shell('am start -W -n ' + component)
        if 'Status: ok' not in result:
            raise RuntimeError('Owned fixture did not open')
        time.sleep(.6)
        if not any(node.get('package') == PACKAGE for node in self.observe('fixture-' + str(self.sequence))):
            raise RuntimeError('Owned fixture not visibly in foreground')
        windows=json.loads((self.folder/('fixture-'+str(self.sequence))/'result-private.json').read_text(encoding='utf-8'))['uiWindows']
        focused=[w for w in windows if w.get('active') and w.get('focused')]
        if len(focused)!=1 or focused[0].get('type')!=1 or focused[0].get('root',{}).get('package')!=PACKAGE:
            raise RuntimeError('Owned fixture has not acquired the actual foreground focus')
        from PIL import Image
        with Image.open(self.folder/('fixture-' + str(self.sequence))/'screen.png') as screenshot:
            if screenshot.width >= screenshot.height:
                raise RuntimeError('This batch requires portrait; native rotation settings were not changed')

    def reserve_file(self, remote, purpose):
        self.journal.data.setdefault('plannedFiles', []).append({'path':remote,'purpose':purpose})
        self.journal.save()

    def owned_file(self, remote):
        checksum = self.ar.shell('sha256sum ' + shlex.quote(remote), root=True).split()[0]
        if not re.fullmatch('[a-f0-9]{64}', checksum):
            raise RuntimeError('Cannot identify generated test file')
        item = {'path': remote, 'sha256': checksum}
        if remote.startswith('/sdcard/Pictures/Screenshots/'):
            names = [remote, '/storage/emulated/0/' + remote[len('/sdcard/'):]]
            where = ' OR '.join("_data='" + name.replace("'", "''") + "'" for name in names)
            ids, paths = [], []
            for _ in range(8):
                rows = self.media_command('content query --uri content://media/external/file --projection _id:_data --where ' + shlex.quote(where))
                ids = re.findall(r'\b_id=(\d+)', rows)
                paths = re.findall(r'\b_data=([^\r\n]+)', rows)
                if len(ids)==len(paths)==1: break
                time.sleep(.3)
            if len(ids) != 1 or len(paths)!=1 or paths[0].strip() not in names:
                raise RuntimeError('Native gallery output MediaStore identity is ambiguous; preserve file')
            item['mediaUri'] = 'content://media/external/file/' + ids[0]
            item['mediaData'] = paths[0].strip()
        self.journal.data['ownedFiles'].append(item)
        self.journal.data['plannedFiles'] = [value for value in self.journal.data.get('plannedFiles', []) if value['path'] != remote]
        self.journal.save()

    def remove_owned_media_file(self, item):
        """Some OEM MediaStore providers remove their row but leave the file."""
        remote, uri = item['path'], item['mediaUri']
        prefix = '/sdcard/Pictures/Screenshots/'
        if not remote.startswith(prefix) or '/' in remote[len(prefix):] or not re.fullmatch(
                r'content://media/external/file/[0-9]+', uri):
            raise RuntimeError('Unexpected recorded media identity; preserve it')
        aliases = (remote, '/storage/emulated/0/' + remote[len('/sdcard/'):])
        if item.get('mediaData') not in aliases or not re.fullmatch(r'[a-f0-9]{64}', item['sha256']):
            raise RuntimeError('Recorded row/path/hash identity is incomplete; preserve file')
        def row_state():
            row = self.media_command('content query --uri ' + shlex.quote(uri) + ' --projection _data').strip()
            if re.fullmatch(r'No result found\.?', row, re.I): return 'missing'
            paths = re.findall(r'\b_data=([^\r\n]+)', row)
            if len(paths) == 1 and paths[0].strip() == item['mediaData'] and row.startswith('Row:'):
                return 'owned'
            raise RuntimeError('MediaStore row identity changed or query was inconclusive; preserve current entry')
        quoted = shlex.quote(remote)
        # Validate the recorded file again before any row deletion, including
        # recovery after a previous process already removed the MediaStore row.
        actual = self.ar.shell('sha256sum ' + quoted, root=True).split()[0]
        if actual != item['sha256']: raise RuntimeError('Generated file changed; preserve instead of deleting')
        if row_state() == 'owned':
            self.media_command('content delete --uri ' + shlex.quote(uri))
        if row_state() != 'missing':
            raise RuntimeError('Owned MediaStore row remains after deletion; retain journal')
        if self.ar.shell('if [ -e ' + quoted + ' ]; then echo exists; fi', root=True):
            actual = self.ar.shell('sha256sum ' + quoted, root=True).split()[0]
            if actual != item['sha256']:
                raise RuntimeError('Generated file changed after MediaStore deletion; preserve remaining file')
            # An original matching row recorded in the journal, exact original
            # path, same bytes, and confirmed absent row are all required.
            if row_state() != 'missing': raise RuntimeError('MediaStore row reappeared; preserve file')
            self.ar.shell('rm -- ' + quoted, root=True)
            if self.ar.shell('if [ -e ' + quoted + ' ]; then echo exists; fi', root=True):
                raise RuntimeError('Owned capture file still exists after exact cleanup; retain journal')

    def cleanup(self):
        errors = []
        try:
            self.close_recorder()
        except Exception as error:
            errors.append('recorder: ' + str(error))
        try:
            self.restore_recorder_settings()
        except Exception as error:
            errors.append('recorder-settings: ' + str(error))
        try:
            self.restore_recorder_position()
        except Exception as error:
            errors.append('recorder-position: ' + str(error))
        try:
            self.journal.restore_config(self.instrument)
        except Exception as error:
            errors.append('configuration: ' + str(error))
        for item in list(self.journal.data.get('ownedFiles', [])):
            try:
                quoted = shlex.quote(item['path'])
                exists = self.ar.shell('if [ -e ' + quoted + ' ]; then echo exists; fi', root=True)
                if exists == 'exists':
                    actual = self.ar.shell('sha256sum ' + quoted, root=True).split()[0]
                    if actual != item['sha256']:
                        raise RuntimeError('Generated file changed; preserve instead of deleting')
                    if item.get('mediaUri'):
                        self.remove_owned_media_file(item)
                    else:
                        self.ar.shell('rm -- ' + quoted, root=True)
                self.journal.data['ownedFiles'].remove(item)
                self.journal.save()
            except Exception as error:
                errors.append('owned-file: ' + str(error))
        for item in list(self.journal.data.get('plannedFiles', [])):
            try:
                if self.ar.shell('if [ -e ' + shlex.quote(item['path']) + ' ]; then echo exists; fi', root=True):
                    raise RuntimeError('Interrupted file creation has no confirmed hash; preserve '+item['path'])
                self.journal.data['plannedFiles'].remove(item); self.journal.save()
            except Exception as error:
                errors.append('planned-file: '+str(error))
        try:
            if self.journal.data.get('fixtureInstallAttempted') and not self.journal.data.get('fixtureWasPresent'):
                current = self.package_hash()
                if current:
                    if current != self.journal.data['fixtureSha256']:
                        raise RuntimeError('Fixture package identity changed; preserve package')
                    result = self.ar.adb('uninstall', PACKAGE).decode('utf-8', 'replace')
                    if 'Success' not in result or self.package_hash() is not None:
                        raise RuntimeError('Owned fixture cleanup not confirmed')
                self.journal.data['fixtureInstallAttempted'] = False
                self.journal.save()
        except Exception as error:
            errors.append('fixture: ' + str(error))
        if self.journal.data.get('nativeCapturePending'):
            errors.append('native output was not conclusively identified; inspect nativeCapturePending; no unknown gallery file was removed')
        self.journal.data['cleanupErrors'] = errors
        self.journal.data['pending'] = bool(errors)
        self.journal.save()
        self.report['restoration'] = {key: self.journal.data.get(key) for key in
                                      ['configurationRestored', 'configurationDifferences', 'nativeRecorderSettingsRestored',
                                       'nativeRecorderSettingsReadback', 'nativeRecorderPositionRestored', 'cleanupErrors', 'pending']}
        self.persist()
        if errors:
            raise RuntimeError('; '.join(errors))

    def gesture(self):
        keys = [key for key in self.journal.data['baseline'] if key.startswith('ls_augment_rm_back_icon_')]
        keys.append('ls_augment_systemui_master')
        self.journal.touch(keys)
        case_filter = getattr(self, 'gesture_case', None)
        result = self.instrument('back-gesture-customization', 'gesture', case_filter=case_filter)['backGestureCustomization']
        remote = result.get('evidence', '')
        if not re.fullmatch(r'/storage/emulated/0/Android/data/ls\.augment\.com/files/back-gesture-tests/[A-Za-z0-9_.-]+', remote):
            raise RuntimeError('Unexpected gesture evidence location; no phone files pulled')
        evidence = self.folder / 'gesture-pixels'
        pulled = self.ar.adb('pull', remote, str(evidence), timeout=90).decode('utf-8', 'replace')
        (self.folder / 'gesture-pull.txt').write_text(pulled, encoding='utf-8')
        self.report['gesturePixelDirectory'] = str(evidence)
        self.persist()
        if case_filter and result.get('caseFilter') != [case_filter]:
            raise AssertionError('Native gesture result does not match the requested single case')
        if result.get('skipped'):
            return {'status': 'skipped', 'reason': result.get('reason'), 'raw': result}
        if not result.get('passed') or not result.get('configurationRestored'):
            raise AssertionError('Native gesture suite did not pass and restore; inspect its durable evidence')
        return {'status': 'observed', 'visualReviewRequired': True, 'raw': result,
                'limitations': ['No GIF/WebP import, crop UI, or long-swipe hover coverage',
                                'Bundled imported preset assets are retained as the Java case documents; no user asset is deleted']}

    def files(self):
        return set(self.ar.adb('shell', 'ls /sdcard/Pictures/Screenshots/', check=False).decode('utf-8','replace').splitlines())

    def capture_begin(self, label):
        before = sorted(self.files())
        self.journal.data['nativeCapturePending'] = {'label': label, 'before': before}
        self.journal.save()

    def capture_result(self, label, suffix):
        pending = self.journal.data['nativeCapturePending']
        added = set()
        for _ in range(40):
            added = self.files() - set(pending['before'])
            if added:
                break
            time.sleep(.4)
        if len(added) != 1:
            raise RuntimeError('Native output is missing or ambiguous; leave gallery files untouched')
        name = next(iter(added))
        if '/' in name or not name.lower().endswith(('.jpg', '.jpeg', '.png', '.mp4')):
            raise RuntimeError('Unexpected native output name')
        remote = '/sdcard/Pictures/Screenshots/' + name
        local = self.folder / (label + suffix)
        for _ in range(40):
            raw = self.ar.adb('exec-out', 'cat ' + shlex.quote(remote))
            complete = raw.endswith(b'\xff\xd9') or raw.startswith(b'\x89PNG') and raw.endswith(b'IEND\xaeB`\x82')
            if suffix == '.mp4':
                offset, complete = 0, False
                while offset + 8 <= len(raw):
                    size = int.from_bytes(raw[offset:offset + 4], 'big')
                    if size == 1 and offset + 16 <= len(raw):
                        size = int.from_bytes(raw[offset + 8:offset + 16], 'big')
                    if size < 8 or offset + size > len(raw):
                        break
                    if raw[offset + 4:offset + 8] == b'moov':
                        complete = True
                    offset += size
            if complete:
                break
            time.sleep(.4)
        if not complete:
            raise RuntimeError('Native output incomplete; cannot claim a capture result')
        local.write_bytes(raw)
        # The file must remain byte-identical between extraction and ownership.
        self.owned_file(remote)
        if self.journal.data['ownedFiles'][-1]['sha256'] != hashlib.sha256(raw).hexdigest():
            self.journal.data['ownedFiles'].pop(); self.journal.save()
            raise RuntimeError('Native output changed while being retained')
        self.journal.data['nativeCapturePending'] = None
        self.journal.save()
        return local

    @staticmethod
    def bar_pixels(array):
        import numpy as np
        # White owned Activity is the fixed background. Exclude the centre
        # camera cutout and physical corner masks, then count actual glyph ink.
        h, w = array.shape[:2]
        band = np.asarray(array)[round(h*37/2688):round(h*147/2688), :, :3].astype(int)
        ink = band.min(axis=2) < 225
        ink[:, :round(w*.02)] = False; ink[:, round(w*.98):] = False
        ink[:, round(w*.40):round(w*.60)] = False
        return int(ink.sum())

    def capture_state(self, label):
        """Read existing state without starting instrumentation or a Provider call."""
        def complete_xml(name):
            for attempt in range(6):
                raw = self.ar.shell('cat /data/user/0/ls.augment.com/shared_prefs/' + name + '.xml', root=True)
                try:
                    return ET.fromstring(raw)
                except ET.ParseError:
                    if attempt == 5: raise
                    time.sleep(.15)
        result = {'observedAt': datetime.datetime.now(datetime.timezone.utc).isoformat(),
                  'meaning': 'Read-only diagnostics/configuration, never a pixel success oracle'}
        for name, selected in [('ls_augment_config_v2', set(CAPTURE_KEYS + [SECURE_KEY, 'snapshot_revision_v1'])),
                               ('ls_augment_diagnostics_v2', {'ls_augment_rm_capture_surface_runtime',
                                'ls_augment_config_snapshot_handshake_v2', 'ls_augment_boot_snapshot_state'})]:
            result[name] = {node.attrib['name']: node.text if node.text is not None else node.get('value')
                            for node in complete_xml(name) if node.get('name') in selected
                            or name == 'ls_augment_diagnostics_v2' and node.get('name', '').startswith('ls_augment_rm_capture_')}
        records = []
        for node in complete_xml('hook-processes'):
            if node.tag != 'string' or not node.text: continue
            try: value = json.loads(node.text)
            except ValueError: continue
            if value.get('process') not in ('com.android.systemui', RECORDER): continue
            row = {key: value.get(key) for key in ['process', 'pid', 'moduleVersion', 'moduleLoaded', 'receivedAt', 'receivedBoot',
                'moduleLoadedAt', 'processStartedElapsed', 'moduleLoadedElapsed', 'snapshotAt']}
            row['hooks'] = [item for item in value.get('hooks', [])
                            if any(target in item.get('target', '') for target in ['CropImageService', 'MediaRecorder', 'PhoneStatusBarView.onAttachedToWindow'])]
            records.append(row)
        # Repeated short-lived capture clients must not evict the still-running
        # SystemUI record. Keep bounded history separately for each process.
        result['recentProcesses'] = [row for process in ('com.android.systemui', RECORDER)
            for row in sorted((row for row in records if row['process']==process),
                              key=lambda row: row.get('receivedAt') or 0)[-4:]]
        atomic(self.folder / (label + '-capture-state.json'), result)

    def native_capture(self):
        from PIL import Image
        import numpy as np
        import cv2
        if any(node.get('package') == 'com.android.ztescreenshot' for node in self.observe('capture-preflight')):
            raise RuntimeError('Existing recorder/screenshot UI visible; preserve the current session')
        projection = self.ar.shell('dumpsys media_projection')
        (self.folder/'media-projection-before-private.txt').write_text(projection, encoding='utf-8')
        if not self.ar.projection_is_idle(projection):
            raise RuntimeError('Screen projection is active or not confirmed idle; preserve that session')
        self.prepare_recorder()
        rows = []
        self.set('capture-secure-off', {SECURE_KEY: '0'})
        for kind in getattr(self, 'capture_kinds', ['screenshot', 'record']):
            baseline_ink = None
            for phase, enabled in [('off', False), ('on', True), ('off-again', False)]:
                label = kind + '-' + phase
                timing = {'label': label, 'preSample': getattr(self, 'capture_pre_sample', 'after-set')}
                if timing['preSample'] == 'before-set':
                    self.capture_state(label + '-before-set')
                prepared = getattr(self, 'capture_trigger_timing', 'after-fixture') == 'prepared-fixture'
                timing['triggerTiming'] = 'prepared-fixture' if prepared else 'after-fixture'
                if prepared:
                    if kind != 'screenshot': raise RuntimeError('Prepared timing is only defined for screenshots')
                    self.start_fixture()
                    # Observe natural process exit; never create cold startup by
                    # stopping an OEM process or an unknown native session.
                    deadline = time.monotonic() + 8
                    while True:
                        old_pid = self.ar.adb('shell', 'pidof ' + RECORDER, check=False).decode('utf-8','replace').strip()
                        if not old_pid: break
                        if time.monotonic() >= deadline:
                            raise RuntimeError('Natural cold-process prerequisite not established; no native process was stopped')
                        time.sleep(.25)
                    timing['coldPidAbsentObserved'] = time.monotonic()
                    self.capture_begin(label)
                values = dict.fromkeys(CAPTURE_KEYS, '0')
                values[CAPTURE_KEYS[0 if kind == 'screenshot' else 1]] = str(int(enabled))
                timing['setCall'] = time.monotonic()
                self.set(label, values)
                timing['setReturn'] = time.monotonic()
                if not prepared: self.start_fixture()
                if timing['preSample'] == 'after-set':
                    self.capture_state(label + '-before')
                if kind == 'screenshot':
                    if not prepared: self.capture_begin(label)
                    timing['keyeventCall'] = time.monotonic()
                    self.ar.shell('input keyevent KEYCODE_SYSRQ')
                    timing['keyeventReturn'] = time.monotonic()
                    path = self.capture_result(label, '.jpg')
                    timing['outputFound'] = time.monotonic()
                    atomic(self.folder / (label + '-timing.json'), timing)
                    pixels = [self.bar_pixels(np.asarray(Image.open(path)))]
                else:
                    self.ar.shell('cmd statusbar expand-settings')
                    self.tap_stable_recorder_tile(label + '-tile')
                    self.await_recorder_menu(label)
                    if not self.runtime_current('com.android.ztescreenshot',label):
                        raise RuntimeError('Recorder has not loaded the installed module build')
                    self.mute_recorder(label)
                    self.start_muted_recording(label)
                    time.sleep(3)
                    during = self.observe(label + '-running')
                    if not any(node.get('id', '').endswith('/status_bar') and node.get('package') == 'com.android.systemui' for node in during):
                        raise AssertionError('Native status-bar window disappeared')
                    self.tap(label + '-stop', identity='com.android.ztescreenshot:id/stop_bn')
                    self.journal.data['recordingMayBeActive'] = False; self.journal.save()
                    path = self.capture_result(label, '.mp4')
                    handlers = mp4_handlers(path.read_bytes())
                    atomic(self.folder / (label + '-media-tracks.json'), {'handlers': handlers, 'audioTrackAbsent': 'soun' not in handlers})
                    if 'soun' in handlers:
                        path.unlink()  # Do not retain unexpected captured audio on the host.
                        raise AssertionError('Native output contains an unexpected audio track despite the mute gate')
                    video = cv2.VideoCapture(str(path)); pixels = []
                    try:
                        while True:
                            ok, frame = video.read()
                            if not ok: break
                            pixels.append(self.bar_pixels(frame))
                    finally: video.release()
                self.capture_state(label + '-after')
                if not pixels:
                    raise AssertionError('No decoded native capture content')
                if phase == 'off':
                    baseline_ink = sum(pixels) / len(pixels)
                    if baseline_ink < 100:
                        raise RuntimeError('Insufficient native glyph contrast for this pixel oracle; manual review required')
                valid = max(pixels) <= max(60, baseline_ink*.15) if enabled else sum(value >= baseline_ink*.65 for value in pixels) / len(pixels) > .8
                row = {'label': label, 'enabled': enabled, 'frames': len(pixels),
                       'minimumForegroundPixels': min(pixels), 'maximumForegroundPixels': max(pixels),
                       'baselineForegroundPixels': baseline_ink,
                       'pixelCheck': valid, 'artifact': path.name, 'visualReviewRequired': True}
                rows.append(row); atomic(self.folder / 'capture-progress.json', rows)
                if not valid:
                    raise AssertionError('Native capture pixel comparison failed; inspect full files, not diagnostics')
        return {'status': 'observed', 'rows': rows,
                'limitations': ['Individual off/on/off only; simultaneous screenshot+record and pause/resume not covered',
                                'White-fixture glyph-ink heuristic excludes camera/corners and requires manual review; no whole-feature pass assigned']}

    def secure(self):
        import cv2
        import numpy as np
        rows = []
        self.set('secure-capture-bars-off', dict.fromkeys(CAPTURE_KEYS, '0'))
        for phase, enabled in [('off', False), ('on', True), ('off-again', False)]:
            self.set('secure-' + phase, {SECURE_KEY: str(int(enabled))})
            self.ar.shell('am force-stop ' + PACKAGE)
            self.start_fixture(True)
            raw = self.ar.adb('exec-out', 'screencap', '-p')
            local = self.folder / ('secure-' + phase + '.png'); local.write_bytes(raw)
            still = cv2.imdecode(np.frombuffer(raw, dtype=np.uint8), cv2.IMREAD_COLOR)
            remote = '/data/local/tmp/duo-owned-' + self.folder.name + '-' + phase + '.mp4'
            if self.ar.shell('if [ -e ' + shlex.quote(remote) + ' ]; then echo exists; fi', root=True):
                raise RuntimeError('Owned recording destination already exists')
            self.reserve_file(remote,'bounded-screenrecord')
            self.ar.shell('screenrecord --time-limit 2 --bit-rate 2000000 ' + shlex.quote(remote), timeout=15)
            self.owned_file(remote)
            video_path = self.folder / ('secure-' + phase + '.mp4')
            self.ar.adb('pull', remote, str(video_path))
            video = cv2.VideoCapture(str(video_path))
            try: ok, frame = video.read()
            finally: video.release()
            if still is None or not ok: raise AssertionError('Secure fixture output could not be decoded')
            def center(value):
                h, w = value.shape[:2]
                return float(value[int(h*.25):int(h*.75), int(w*.15):int(w*.85)].mean())
            means = [center(still), center(frame)]
            valid = all(value > 220 for value in means) if enabled else all(value < 15 for value in means)
            rows.append({'phase': phase, 'enabled': enabled, 'centerMeans': means, 'pixelCheck': valid})
            atomic(self.folder / 'secure-progress.json', rows)
            if not valid: raise AssertionError('Owned FLAG_SECURE still/video pixel check failed')
        return {'status': 'observed', 'rows': rows,
                'limitations': ['Only synthetic blank FLAG_SECURE activity; DRM/protected buffers and third-party applications are not covered']}

    def await_installer_confirmation(self, label):
        prefix = 'com.android.packageinstaller:id/'
        permission_accepted = False
        for attempt in range(14):
            current = self.observe(label + '-' + str(attempt))
            # The source prompt can arrive after the first installer frame. Its
            # underlying confirmation is not evidence while the prompt covers it.
            if any(node.get('text') == '允许安装' for node in current):
                trust = [node for node in current if node.get('id') == prefix + 'alwaysTrust']
                buttons = [node for node in current if node.get('id') == 'android:id/button1'
                           and node.get('text') == '允许安装' and node.get('enabled') is True
                           and node.get('clickable') is True]
                if len(trust) != 1 or trust[0].get('checked') is not False or len(buttons) != 1:
                    raise RuntimeError('Installer one-time source permission is not unambiguously unchecked; no trust change')
                if permission_accepted:
                    raise RuntimeError('Installer repeated the source prompt after one-time permission')
                self.tap(label + '-allow-once', identity='android:id/button1')
                permission_accepted = True
            else:
                native = {node['id']: node for node in current
                          if node.get('package') == 'com.android.packageinstaller'}
                if prefix + 'ok_button' in native or prefix + 'install_confirm_question_update' in native:
                    return native
            time.sleep(.4)
        raise RuntimeError('Installer confirmation was not observed after the source-permission stage')

    def installer(self):
        if any(node.get('package') == 'com.android.packageinstaller' for node in self.observe('installer-preflight')):
            raise RuntimeError('Existing installer confirmation visible; do not interrupt it')
        remote = '/sdcard/Download/duo-owned-' + self.folder.name + '.apk'
        if self.ar.shell('if [ -e ' + shlex.quote(remote) + ' ]; then echo exists; fi', root=True):
            raise RuntimeError('Fixture destination exists; no overwrite')
        self.reserve_file(remote,'installer-apk-copy')
        self.ar.adb('push', str(FIXTURE), remote); self.owned_file(remote)
        names = ['off', 'scan', 'purify', 'store', 'cts', 'off-again']; rows = []; original_conditions = None
        prefix = 'com.android.packageinstaller:id/'
        for phase in names:
            self.set('installer-' + phase, {key: str(int(phase == name)) for key, name in zip(INSTALLER_KEYS, ['scan', 'purify', 'store', 'cts'])})
            # Development-only entry to our non-exported internal page; does not
            # change manifest exposure or certify the user's navigation path.
            self.ar.shell('am start -W -f 0x10008000 -n ls.augment.com/.EnhancementSettingsActivity --es module_route group/apps/installer_ui', root=True)
            self.observe('installer-' + phase + '-public-page')
            self.ar.shell('am force-stop com.android.packageinstaller')
            uri = 'content://com.android.externalstorage.documents/document/primary%3ADownload'
            self.ar.shell('am start -W -f 0x10008000 -a android.intent.action.VIEW -d ' + shlex.quote(uri)
                          + ' -t vnd.android.document/directory -p com.android.documentsui --grant-read-uri-permission', root=True)
            self.tap('installer-' + phase + '-owned-apk', text=Path(remote).name)
            native = self.await_installer_confirmation('installer-' + phase)
            if not self.runtime_current('com.android.packageinstaller','installer-'+phase):
                raise RuntimeError('Installer has not loaded the installed module build')
            checks = {'cts': (prefix + 'install_confirm_question_update' in native) == (phase == 'cts')}
            if phase != 'cts':
                checks.update(purify=(prefix + 'pure_mode' in native) == (phase != 'purify'),
                              store=(prefix + 'market_replace' in native) == (phase != 'store'),
                              continuePresent=prefix + 'ok_button' in native,
                              sourcePreserved=native.get(prefix + 'app_origin', {}).get('text') == '安装来源：文件')
                if phase == 'scan': checks['unscannedWarning'] = prefix + 'warning_unknown' in native
            preserved = {name: ({key: native[prefix+name].get(key) for key in ['text','enabled','checked']}
                               if prefix+name in native else None)
                         for name in ['warning_layout','warning_title_desc','riskcheckbox','learn_more','ok_button']}
            if phase == 'off': original_conditions = preserved
            elif phase in ('purify', 'off-again'):
                checks['nativeWarningAndConfirmationPreserved'] = preserved == original_conditions
            rows.append({'phase': phase, 'checks': checks, 'installedByConfirmation': False})
            atomic(self.folder / 'installer-progress.json', rows)
            self.ar.shell('input keyevent KEYCODE_BACK')
            if not all(checks.values()): raise AssertionError('Installer native confirmation differs; inspect screenshot/tree')
        return {'status': 'observed', 'rows': rows,
                'limitations': ['Confirmation UI only; actual install/scanner network/security verdict and rejection paths are not certified',
                                'Internal settings page is opened by the development harness; public navigation is not certified here',
                                'Own same-version APK; no install-confirm control is clicked']}

    def recents(self):
        total = int(re.search(r'^MemTotal:\s+(\d+)', self.ar.shell('cat /proc/meminfo'), re.M)[1]) / (1024*1024)
        rows = []
        prefix = 'ls_augment_rm_recents_memory_'
        for style in [0, 1]:
            for content in range(6):
                label = 'recents-%d-%d' % (style, content)
                self.set(label, {prefix+'custom': '1', prefix+'style': str(style), prefix+'content': str(content),
                                 prefix+'simple_size': '12', prefix+'detailed_size': '12', prefix+'portrait_top': '5',
                                 prefix+'portrait_left': '16', prefix+'portrait_height': '100', prefix+'color_mode': '0'})
                self.ar.shell('input keyevent KEYCODE_HOME'); self.ar.shell('input keyevent KEYCODE_APP_SWITCH'); time.sleep(.8)
                nodes = self.observe(label)
                texts = [node.get('text', '') for node in nodes if node.get('package') == 'com.zte.mifavor.launcher'
                         and 'GB' in node.get('text', '') and re.search('可用|已用|总量', node.get('text', ''))]
                if len(texts) != 1: raise AssertionError('Expected one actual memory label, observed ' + str(texts))
                text = texts[0]
                if content == 5:
                    match = re.fullmatch(r'(\d+\.\d+) GB 可用 \| (\d+\.\d+) GB', text)
                    valid = bool(match) and 0 <= float(match[1]) <= total and abs(float(match[2])-total) <= .006
                else:
                    expected = {0: ['可用','已用','总量'], 1: ['可用','已用'], 2: ['可用'], 3: ['已用'], 4: ['总量']}[content]
                    observed = re.findall(r'(可用|已用|总量)\s+(\d+\.\d+) GB', text)
                    values = {name: float(value) for name, value in observed}
                    valid = [name for name, _ in observed] == expected and all(0 <= value <= total+.01 for value in values.values())
                    if '总量' in values: valid &= abs(values['总量']-total) <= .006
                    if content == 0: valid &= abs(values['可用']+values['已用']-values['总量']) <= .011
                    valid &= text.count('\n') == (len(expected)-1 if style else 0)
                rows.append({'style': style, 'content': content, 'actualText': text, 'physicalTotalGiB': total, 'textCheck': bool(valid)})
                atomic(self.folder/'recents-progress.json', rows)
                if not valid: raise AssertionError('Native memory content differs from current model')
        self.set('recents-off', {prefix+'custom': '0'})
        self.ar.shell('input keyevent KEYCODE_HOME'); self.ar.shell('input keyevent KEYCODE_APP_SWITCH'); time.sleep(.8)
        after = self.observe('recents-off')
        if any(node.get('package') == 'com.zte.mifavor.launcher' and re.search(r'(可用|已用|总量).*GB', node.get('text','')) for node in after):
            raise AssertionError('Memory label remains after module switch OFF')
        return {'status': 'observed', 'rows': rows,
                'limitations': ['Current native launcher style/portrait only; no native preferences or tasks removed',
                                'No dark/light color, landscape, bounds extremes, or launcher-restart certification']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--cases', default='gesture,capture,secure', help='gesture,capture,secure,installer,recents')
    parser.add_argument('--gesture-case', choices=['left-custom-right-stock', 'right-custom-left-unchanged',
        'independent-icon-scale', 'independent-background-scale', 'independent-icon-opacity',
        'physical-inward-offset', 'independent-vertical-offset', 'independent-icon-mirror', 'disable-reenable-preserves-parameters'])
    parser.add_argument('--capture-kinds', default='screenshot,record', help='screenshot,record or either one')
    parser.add_argument('--capture-pre-sample', choices=['after-set', 'before-set'], default='after-set',
                        help='Place read-only diagnostics outside the save-to-capture timing window for a bounded race investigation')
    parser.add_argument('--capture-trigger-timing', choices=['after-fixture', 'prepared-fixture'], default='after-fixture')
    parser.add_argument('--expected-version', type=int)
    parser.add_argument('--restore-only', type=Path, help='Existing restore.json from an interrupted run')
    args = parser.parse_args()
    import adb_regression as ar
    package_dump = ar.shell('dumpsys package ls.augment.com')
    installed = re.search(r'\bversionCode=(\d+)', package_dump)
    if not installed: raise RuntimeError('Installed module version is unavailable')
    version = int(installed[1])
    if args.expected_version is not None and version != args.expected_version:
        raise RuntimeError('Installed build differs from requested candidate')
    if args.restore_only:
        journal = Journal(args.restore_only.resolve())
        if journal.data['metadata']['serial'] != ar.SERIAL: raise RuntimeError('Recovery journal belongs to another phone')
        folder = journal.path.parent
        report = json.loads((folder/'report.json').read_text(encoding='utf-8')) if (folder/'report.json').exists() else {}
        Runner(ar, folder, journal, report).cleanup()
        print(json.dumps({'restoreOnly': True, 'installedVersion': version, 'report': str(folder/'report.json')}))
        return
    if ar.shell('am get-current-user').strip()!='0':
        raise RuntimeError('This owned-fixture batch only supports primary Android user 0')
    selected = list(dict.fromkeys(value.strip() for value in args.cases.split(',') if value.strip()))
    if not selected or any(value not in FEATURES for value in selected): raise RuntimeError('Unknown or empty case selection')
    capture_kinds = list(dict.fromkeys(value.strip() for value in args.capture_kinds.split(',') if value.strip()))
    if not capture_kinds or any(value not in ('screenshot', 'record') for value in capture_kinds):
        raise RuntimeError('Unknown capture kind')
    if args.capture_trigger_timing == 'prepared-fixture' and (capture_kinds != ['screenshot'] or args.capture_pre_sample != 'before-set'):
        raise RuntimeError('Prepared timing requires screenshot only and before-set diagnostics')
    selected_features = {key: list(values) for key, values in FEATURES.items()}
    selected_features['capture'] = [('V2-001' if kind == 'screenshot' else 'V2-002') for kind in capture_kinds]
    for path in AUDIT.rglob('restore.json'):
        if json.loads(path.read_text(encoding='utf-8')).get('pending'):
            raise RuntimeError('Restore pending run first: --restore-only ' + str(path))
    label = 'native-safe-%d-%s' % (version, datetime.datetime.now().strftime('%Y%m%d-%H%M%S'))
    folder = AUDIT/label; folder.mkdir(parents=True, exist_ok=False); ar.OUTPUT=folder
    with (folder/'baseline-console.txt').open('w', encoding='utf-8') as output:
        with contextlib.redirect_stdout(output): baseline_report = ar.instrument('snapshot','baseline')
    if baseline_report['moduleVersion'] != version: raise RuntimeError('Test APK build does not match installed module')
    installed_name = re.search(r'\bversionName=([^\s]+)', package_dump)
    if not installed_name: raise RuntimeError('Installed version name unavailable')
    journal = Journal(folder/'restore.json', baseline_report['settings'], {'serial':ar.SERIAL,'installedVersion':version,
                                                                       'installedVersionName':installed_name[1],'selected':selected})
    report = {'installedVersion': version, 'features': [feature for case in selected for feature in selected_features[case]],
              'captureKinds': capture_kinds if 'capture' in selected else [],
              'cases': [], 'scope': 'Native behavior on owned fixture/launcher; no account, messages, transactions, notification clear, USB/radio/ADB settings or reboot',
              'wholeFeaturePassed': False, 'visualReviewRequired': True}
    runner = Runner(ar, folder, journal, report); runner.capture_kinds=capture_kinds
    runner.gesture_case=args.gesture_case; report['gestureCase']=args.gesture_case
    runner.capture_pre_sample=args.capture_pre_sample; report['capturePreSample']=args.capture_pre_sample
    runner.capture_trigger_timing=args.capture_trigger_timing; report['captureTriggerTiming']=args.capture_trigger_timing; runner.persist()
    failure = None
    try:
        if any(case in selected for case in ['capture','secure','installer']): runner.fixture()
        for name in selected:
            row = {'case':name,'features':selected_features[name],'status':'running'}; report['cases'].append(row); runner.persist()
            try:
                process = {'gesture':'com.android.systemui','capture':'com.android.systemui',
                           'secure':'system_server','recents':'com.zte.mifavor.launcher'}.get(name)
                if process and not runner.runtime_current(process,name+'-preflight'):
                    row.update(status='skipped',reason=process+' has not loaded the installed module build; no restart/reboot was attempted')
                else:
                    row.update(getattr(runner, 'native_capture' if name=='capture' else name)())
            except Exception as error:
                row.update(status='failed', error=type(error).__name__+': '+str(error)); raise
            finally:
                runner.persist()
                if name == 'capture':
                    runner.close_recorder()
                    runner.restore_recorder_settings()
                    runner.restore_recorder_position()
                # Restore between suites, including Java cases whose finally uses its own defaults.
                journal.restore_config(runner.instrument)
                runner.persist()
            print(name + ': ' + row['status'], flush=True)
    except BaseException as error:
        failure = error; report['error'] = traceback.format_exc(); runner.persist()
    finally:
        try: runner.cleanup()
        except Exception as error:
            report['restoreError'] = str(error); runner.persist()
            if failure is None: failure=error
        print(json.dumps({'report':str(folder/'report.json'),'configurationRestored':journal.data.get('configurationRestored'),
                          'pendingRestore':journal.data['pending']}, ensure_ascii=False), flush=True)
    if failure is not None: raise failure


if __name__ == '__main__':
    main()
