"""Opt-in USB RSA authorization probe; importing/preflight never invokes adb.

The Windows ADB server always loads the normal user key. ADB_VENDOR_KEYS alone
does not isolate a test key. This tool temporarily renames (never exports) the
original key in .android, runs one new key on a separate loopback server, and
restores the original files and USB connection. The caller owns phone UI setup
and exact-fingerprint cleanup on the phone.

Examples:
  python tools/usb_auth_host_probe.py preflight
  python tools/usb_auth_host_probe.py observe --expected unauthorized \
      --server-pid PID_FROM_PREFLIGHT --server-exe OBSERVED_SERVER_PATH \
      --exclusive-use-confirmed --output out/ROUND
  python tools/usb_auth_host_probe.py restore --journal out/ROUND/journal.json

Each observe invocation generates a NEW key. Never reuse a previously allowed
key for an OFF comparison. No wireless ADB command is used.
"""
from __future__ import annotations

import argparse
import base64
import contextlib
import ctypes
import hashlib
import json
import os
from pathlib import Path
import secrets
import shutil
import socket
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_ADB = Path.home() / 'AppData/Local/Android/Sdk/platform-tools/adb.exe'
SERIAL = '9125258103D6'
TEST_PORT = 5049
CREATE_NO_WINDOW = 0x08000000
DETACHED_PROCESS = 0x00000008


def digest(path):
    path = Path(path)
    return hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else None


def public_fingerprint(text):
    """Matches this ROM's getFingerprints: MD5(decoded first whitespace token)."""
    return ':'.join(f'{b:02X}' for b in hashlib.md5(
        base64.b64decode(text.split()[0], validate=True)).digest())


def write_json(path, data):
    path = Path(path)
    temporary = path.with_suffix(path.suffix + '.writing')
    temporary.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding='utf-8')
    os.replace(temporary, path)


def read_json(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))


def require_windows():
    if os.name != 'nt':
        raise RuntimeError('Real observation is Windows-only.')


def process_identity(pid):
    """PID plus creation time prevents terminating a recycled, unrelated PID."""
    require_windows()
    from ctypes import wintypes
    kernel = ctypes.WinDLL('kernel32', use_last_error=True)
    kernel.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
    kernel.OpenProcess.restype = wintypes.HANDLE
    kernel.CloseHandle.argtypes = [wintypes.HANDLE]
    kernel.GetProcessTimes.argtypes = [wintypes.HANDLE] + [ctypes.POINTER(wintypes.FILETIME)] * 4
    kernel.GetExitCodeProcess.argtypes = [wintypes.HANDLE, ctypes.POINTER(wintypes.DWORD)]
    kernel.QueryFullProcessImageNameW.argtypes = [wintypes.HANDLE, wintypes.DWORD,
                                               wintypes.LPWSTR, ctypes.POINTER(wintypes.DWORD)]
    handle = kernel.OpenProcess(0x1000, False, int(pid))
    if not handle:
        if ctypes.get_last_error() == 87:  # no such process
            return None
        raise OSError(ctypes.get_last_error(), f'Cannot establish process identity: {pid}')
    try:
        exit_code = wintypes.DWORD()
        if not kernel.GetExitCodeProcess(handle, ctypes.byref(exit_code)):
            raise ctypes.WinError(ctypes.get_last_error())
        if exit_code.value != 259:  # STILL_ACTIVE
            return None
        times = [wintypes.FILETIME() for _ in range(4)]
        if not kernel.GetProcessTimes(handle, *[ctypes.byref(t) for t in times]):
            raise ctypes.WinError(ctypes.get_last_error())
        size = wintypes.DWORD(32768)
        buffer = ctypes.create_unicode_buffer(size.value)
        if not kernel.QueryFullProcessImageNameW(handle, 0, buffer, ctypes.byref(size)):
            raise ctypes.WinError(ctypes.get_last_error())
        return {'pid': int(pid), 'created': (times[0].dwHighDateTime << 32) | times[0].dwLowDateTime,
                'exe': str(Path(buffer.value).resolve())}
    finally:
        kernel.CloseHandle(handle)


def same_process(identity):
    return bool(identity) and process_identity(identity['pid']) == identity


def terminate_owned(identity, expected_exe):
    if not identity or not same_process(identity):
        return
    if Path(identity['exe']).resolve() != Path(expected_exe).resolve():
        raise RuntimeError('Refusing to stop an unexpected executable.')
    # Opening and rechecking the same handle avoids PID reuse between check/kill.
    from ctypes import wintypes
    kernel = ctypes.WinDLL('kernel32', use_last_error=True)
    kernel.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
    kernel.OpenProcess.restype = wintypes.HANDLE
    kernel.CloseHandle.argtypes = [wintypes.HANDLE]
    kernel.TerminateProcess.argtypes = [wintypes.HANDLE, wintypes.UINT]
    kernel.GetProcessTimes.argtypes = [wintypes.HANDLE] + [ctypes.POINTER(wintypes.FILETIME)] * 4
    handle = kernel.OpenProcess(0x1001, False, identity['pid'])
    if not handle:
        raise ctypes.WinError(ctypes.get_last_error())
    try:
        times = [wintypes.FILETIME() for _ in range(4)]
        if not kernel.GetProcessTimes(handle, *[ctypes.byref(t) for t in times]):
            raise ctypes.WinError(ctypes.get_last_error())
        created = (times[0].dwHighDateTime << 32) | times[0].dwLowDateTime
        if created != identity['created']:
            return
        if not kernel.TerminateProcess(handle, 1):
            raise ctypes.WinError(ctypes.get_last_error())
    finally:
        kernel.CloseHandle(handle)
    deadline = time.monotonic() + 10
    while same_process(identity) and time.monotonic() < deadline:
        time.sleep(.1)
    if same_process(identity):
        raise RuntimeError('Owned test server did not exit.')


def host_snapshot():
    """No adb invocation, no service start, no key mutation."""
    require_windows()
    script = r'''
$ErrorActionPreference='Stop'
$tcp=@(Get-NetTCPConnection | Where-Object {
    ($_.LocalPort -in @(5037,5049) -or $_.RemotePort -in @(5037,5049)) -and
    $_.State -ne 'TimeWait'
} | Select-Object LocalAddress,LocalPort,RemoteAddress,RemotePort,OwningProcess,
    @{Name='State';Expression={$_.State.ToString()}})
$processes=@(Get-Process | Where-Object {
    $_.ProcessName -match '^(adb|scrcpy|studio64|studio|vysor|QtScrcpy|sndcpy|YanRainOTAToolBox)$'
} | Select-Object Id,ProcessName)
@{tcp=$tcp;processes=$processes} | ConvertTo-Json -Depth 5 -Compress
'''
    ps = Path(os.environ['SystemRoot']) / 'System32/WindowsPowerShell/v1.0/powershell.exe'
    result = subprocess.run([str(ps), '-NoProfile', '-NonInteractive', '-Command', script],
                            capture_output=True, timeout=20, creationflags=CREATE_NO_WINDOW)
    if result.returncode:
        raise RuntimeError(result.stderr.decode('utf-8', 'replace'))
    return json.loads(result.stdout.decode('utf-8-sig'))


def validate_host(snapshot, adb_path, expected_pid=None):
    listeners = [x for x in snapshot['tcp'] if x['State'] == 'Listen' and x['LocalPort'] == 5037]
    pids = {x['OwningProcess'] for x in listeners}
    if len(pids) != 1:
        raise RuntimeError('Require exactly one existing local ADB server on port 5037.')
    pid = next(iter(pids))
    if expected_pid is not None and pid != expected_pid:
        raise RuntimeError('ADB server changed after preflight. Repeat preflight.')
    if any(x['State'] != 'Listen' or x['LocalPort'] != 5037 for x in snapshot['tcp']):
        raise RuntimeError('Another live ADB client or test-port listener exists.')
    if any(x['LocalAddress'] not in ('127.0.0.1', '::1') for x in listeners):
        raise RuntimeError('ADB server is not limited to loopback.')
    if any(x['Id'] != pid for x in snapshot['processes']):
        raise RuntimeError('Another ADB process or known recurring ADB client is running.')
    identity = process_identity(pid)
    if not identity or Path(identity['exe']).resolve() != Path(adb_path).resolve():
        raise RuntimeError('Existing server executable identity could not be verified.')
    return identity


def safe_child(root, path):
    root, path = Path(root).resolve(), Path(path)
    if path.is_symlink() or (path.exists() and getattr(path.stat(), 'st_file_attributes', 0) & 0x400):
        raise RuntimeError(f'Reparse point refused: {path.name}')
    resolved = path.resolve()
    if not resolved.is_relative_to(root) or resolved == root:
        raise RuntimeError('Path escaped its recorded directory.')
    return resolved


def restore_files(state):
    """Pure filesystem recovery; used by real recovery and temporary-dir tests."""
    root = Path(state['key_root']).resolve()
    for item in state['files']:
        current = safe_child(root, item['current'])
        backup = safe_child(root, item['backup'])
        retired = safe_child(root, item['retired'])
        original = item['original_sha256']
        observed = digest(current)
        if original is not None and observed == original:
            # Before original rename, or a prior successful recovery.
            if backup.exists():
                raise RuntimeError('Duplicate original backup is unexpected; retain both for review.')
            continue
        if observed is not None and observed != item['test_sha256']:
            raise RuntimeError(f'Unknown file at {current.name}; no overwrite performed.')
        if original is not None and digest(backup) != original:
            raise RuntimeError('Original backup is missing or differs; no overwrite performed.')
        if current.exists():
            if retired.exists() and digest(retired) != item['test_sha256']:
                raise RuntimeError('Retired test path has unrelated content.')
            os.replace(current, retired)
        if original is not None:
            os.replace(backup, current)
        if digest(current) != original:
            raise RuntimeError('Restored key hash or originally-absent state differs.')
    return True


@contextlib.contextmanager
def journal_lock(path, timeout=30):
    import msvcrt
    lock = Path(path).with_suffix('.lock')
    with lock.open('a+b') as handle:
        handle.seek(0, 2)
        if not handle.tell():
            handle.write(b'0')
            handle.flush()
        deadline = time.monotonic() + timeout
        while True:
            try:
                handle.seek(0)
                msvcrt.locking(handle.fileno(), msvcrt.LK_NBLCK, 1)
                break
            except OSError:
                if time.monotonic() >= deadline:
                    raise RuntimeError('Recovery lock timed out.')
                time.sleep(.1)
        try:
            yield
        finally:
            handle.seek(0)
            msvcrt.locking(handle.fileno(), msvcrt.LK_UNLCK, 1)


def adb_call(adb_path, args, *, port=5037, timeout=10, env=None):
    return subprocess.run([str(adb_path), '-P', str(port), *args], capture_output=True,
                          timeout=timeout, env=env, creationflags=CREATE_NO_WINDOW)


def smart_socket(command, *, port=5037, serial=None, timeout=4):
    """Talk only to an already-running local server; never auto-start adb.

    Host query results are length-prefixed. A shell stream ends on EOF. The
    legacy shell service suffices for a constant echo challenge and avoids any
    client-side retry, key-loading, or server-version replacement behavior.
    """
    with socket.create_connection(('127.0.0.1', port), timeout=timeout) as connection:
        connection.settimeout(timeout)

        def receive(size):
            data = b''
            while len(data) < size:
                chunk = connection.recv(size - len(data))
                if not chunk:
                    raise RuntimeError('ADB server closed an incomplete response.')
                data += chunk
            return data

        def request(value):
            encoded = value.encode('utf-8')
            connection.sendall(f'{len(encoded):04x}'.encode('ascii') + encoded)
            status = receive(4)
            if status == b'FAIL':
                error = receive(int(receive(4), 16)).decode('utf-8', 'replace')
                raise RuntimeError('ADB server refused: ' + error)
            if status != b'OKAY':
                raise RuntimeError('Unexpected ADB server response.')

        if serial is not None:
            request('host:transport:' + serial)
        request(command)
        if serial is None:
            return receive(int(receive(4), 16)).decode('utf-8', 'replace')
        chunks = []
        while True:
            chunk = connection.recv(65536)
            if not chunk:
                return b''.join(chunks).decode('utf-8', 'replace')
            chunks.append(chunk)


def restore(journal):
    require_windows()
    with journal_lock(journal):
        state = read_json(journal)
        if state.get('restored'):
            return state['recovery']
        # Validate journal ownership and all paths before any process mutation.
        expected_root = (Path.home() / '.android').resolve()
        if Path(state['key_root']).resolve() != expected_root:
            raise RuntimeError('Journal is not for the current Windows user.')
        for item in state['files']:
            for field in ('current', 'backup', 'retired'):
                safe_child(expected_root, item[field])
        adb_path = Path(state['adb']).resolve()
        if adb_path != DEFAULT_ADB.resolve():
            raise RuntimeError('Journal refers to an unexpected ADB executable.')
        original_exe = Path(state['original_server']['exe']).resolve()
        if digest(original_exe) != state['original_server_sha256']:
            raise RuntimeError('Original server binary changed; do not substitute a different server.')
        test_adb = safe_child(expected_root, state['test_adb'])
        if test_adb.parent.name != '.lsa-usb-auth-' + state['token'] or test_adb.name != 'adb.exe':
            raise RuntimeError('Unexpected private test executable location.')
        if digest(test_adb) != state['adb_sha256']:
            raise RuntimeError('Private test executable differs from its recorded binary.')
        # The unique copied executable establishes ownership even if the parent
        # died between CreateProcess and writing its PID receipt. Enumerating is
        # read-only; only an exact executable-path + creation-time match is killed.
        snapshot = host_snapshot()
        for entry in snapshot['processes']:
            if entry['ProcessName'].lower() != 'adb':
                continue
            identity = process_identity(entry['Id'])
            if identity and Path(identity['exe']).resolve() == test_adb:
                terminate_owned(identity, test_adb)
        restore_files(state)
        snapshot = host_snapshot()
        test_listeners = [x for x in snapshot['tcp'] if x['LocalPort'] == TEST_PORT and x['State'] == 'Listen']
        if test_listeners:
            raise RuntimeError('Unrecorded test-port process remains; original files restored, inspect its PID.')
        regular = {x['OwningProcess'] for x in snapshot['tcp']
                   if x['LocalPort'] == 5037 and x['State'] == 'Listen'}
        if regular and not (regular == {state['original_server']['pid']} and same_process(state['original_server'])):
            if not state.get('restored_server') or regular != {state['restored_server']['pid']} or not same_process(state['restored_server']):
                candidate = process_identity(next(iter(regular))) if len(regular) == 1 else None
                if (candidate and Path(candidate['exe']).resolve() == original_exe
                        and state.get('restore_start_filetime')
                        and candidate['created'] >= state['restore_start_filetime']):
                    # Recovery itself may have died after start-server returned
                    # but before persisting the restored PID. Files were already
                    # restored before the recorded start boundary.
                    state['restored_server'] = candidate
                    write_json(journal, state)
                else:
                    raise RuntimeError('Unexpected replacement server; original files restored, no process killed.')
        if not regular:
            state.setdefault('restore_start_filetime', int((time.time() + 11644473600) * 10_000_000))
            write_json(journal, state)
            started = adb_call(original_exe, ['start-server'], timeout=15)
            if started.returncode:
                raise RuntimeError('Original key files restored, but normal ADB server failed to start.')
            snapshot = host_snapshot()
            listeners = {x['OwningProcess'] for x in snapshot['tcp']
                         if x['LocalPort'] == 5037 and x['State'] == 'Listen'}
            if len(listeners) != 1:
                raise RuntimeError('Cannot identify restored normal server.')
            state['restored_server'] = process_identity(next(iter(listeners)))
            if not state['restored_server'] or Path(state['restored_server']['exe']).resolve() != original_exe:
                raise RuntimeError('Restored listener is not the original server binary.')
            write_json(journal, state)
        challenge = 'LSA_RESTORED_' + secrets.token_hex(12)
        deadline = time.monotonic() + 25
        response = ''
        while time.monotonic() < deadline:
            try:
                response = smart_socket('shell:echo ' + challenge, serial=state['serial']).strip()
                if response == challenge:
                    break
            except (OSError, RuntimeError):
                pass
            time.sleep(.5)
        if response != challenge:
            raise RuntimeError('Original key hashes restored, but USB shell reconnection is not proved.')
        expected_identity = state.get('restored_server', state['original_server'])
        if not same_process(expected_identity):
            raise RuntimeError('Original server identity changed during reconnection verification.')
        state['recovery'] = {'original_key_hashes_restored': True,
                             'original_usb_shell_challenge_passed': True,
                             'at': time.time(), 'server': state.get('restored_server', state['original_server'])}
        state['restored'] = True
        write_json(journal, state)
        return state['recovery']


def watchdog(journal):
    state = read_json(journal)
    Path(state['watchdog_ready']).write_text('ready', encoding='ascii')
    while time.time() < state['deadline'] and same_process(state['parent']):
        if read_json(journal).get('restored'):
            return
        time.sleep(.25)
    # Retry only recovery, never restart the experiment after a timeout.
    errors = []
    for _ in range(3):
        try:
            restore(journal)
            return
        except Exception as exc:
            errors.append(str(exc))
            time.sleep(1)
    write_json(Path(journal).with_name('watchdog-error.json'), {'errors': errors})


def observe(args):
    require_windows()
    if not args.exclusive_use_confirmed:
        raise RuntimeError('Refused: caller must confirm all other ADB users/agents are paused for this probe.')
    adb_path = DEFAULT_ADB.resolve()
    expected_server_exe = Path(args.server_exe).resolve()
    original_server = validate_host(host_snapshot(), expected_server_exe, args.server_pid)
    output = Path(args.output).resolve()
    if not output.is_relative_to((ROOT / 'out').resolve()) or output.exists():
        raise RuntimeError('Output must be a NEW directory inside this workspace out directory.')
    # This is an explicit observe command, so read-only phone checks now allowed.
    devices = smart_socket('host:devices').splitlines()
    entries = [line.split() for line in devices if line.strip()]
    if entries != [[args.serial, 'device']]:
        raise RuntimeError('Require exactly the intended USB phone, currently authorized, and no other devices.')
    challenge = 'LSA_BEFORE_' + secrets.token_hex(12)
    baseline = smart_socket('shell:echo ' + challenge, serial=args.serial)
    if baseline.strip() != challenge:
        raise RuntimeError('Original USB connection challenge failed.')
    key_root = (Path.home() / '.android').resolve()
    unresolved_root = Path.home() / '.android'
    if unresolved_root.is_symlink() or getattr(unresolved_root.stat(), 'st_file_attributes', 0) & 0x400:
        raise RuntimeError('A redirected .android directory requires a separate reviewed plan.')
    if not (key_root / 'adbkey').is_file():
        raise RuntimeError('Original standard user key is missing; refuse to generate one.')
    token = secrets.token_hex(12)
    key_dir = safe_child(key_root, key_root / ('.lsa-usb-auth-' + token))
    key_dir.mkdir()
    output.mkdir(parents=True)
    # A unique unchanged executable path gives the watchdog ownership evidence
    # without relying on a PID receipt being written immediately after spawn.
    test_adb = key_dir / 'adb.exe'
    for name in ('adb.exe', 'AdbWinApi.dll', 'AdbWinUsbApi.dll', 'libwinpthread-1.dll'):
        source = adb_path.parent / name
        if not source.is_file():
            raise RuntimeError('Required platform-tools runtime is absent: ' + name)
        shutil.copy2(source, key_dir / name)
    test_key = key_dir / 'generated'
    generated = adb_call(adb_path, ['keygen', str(test_key)])
    if generated.returncode or not test_key.is_file() or not test_key.with_suffix('.pub').is_file():
        raise RuntimeError('Temporary key generation failed before touching original keys.')
    public = test_key.with_suffix('.pub').read_text(encoding='utf-8')
    (output / 'test-public-key.txt').write_text(public, encoding='utf-8')
    state = {'format': 1, 'adb': str(adb_path), 'adb_sha256': digest(adb_path),
             'test_adb': str(test_adb), 'token': token, 'key_root': str(key_root), 'serial': args.serial,
             'parent': process_identity(os.getpid()), 'original_server': original_server,
             'original_server_sha256': digest(expected_server_exe),
             'deadline': time.time() + 150, 'expected': args.expected,
             'fingerprint': public_fingerprint(public), 'files': [],
             'watchdog_ready': str(output / 'watchdog-ready.txt'), 'restored': False}
    for suffix in ('', '.pub'):
        current = safe_child(key_root, key_root / ('adbkey' + suffix))
        source = Path(str(test_key) + suffix)
        state['files'].append({'current': str(current), 'source': str(source),
                               'backup': str(safe_child(key_root, key_root / ('adbkey' + suffix + '.lsa-original-' + token))),
                               'retired': str(key_dir / ('retired' + suffix)),
                               'original_sha256': digest(current), 'test_sha256': digest(source)})
    journal = output / 'journal.json'
    write_json(journal, state)
    observer_error = None
    recovery_error = None
    try:
        subprocess.Popen([sys.executable, str(Path(__file__).resolve()), '_watchdog', '--journal', str(journal)],
                         stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                         creationflags=CREATE_NO_WINDOW | DETACHED_PROCESS, close_fds=True)
        ready_deadline = time.monotonic() + 5
        while not Path(state['watchdog_ready']).is_file() and time.monotonic() < ready_deadline:
            time.sleep(.1)
        if not Path(state['watchdog_ready']).is_file():
            raise RuntimeError('Independent recovery watchdog did not become ready.')
        validate_host(host_snapshot(), expected_server_exe, original_server['pid'])
        with journal_lock(journal):
            state = read_json(journal)
            if state['restored']:
                raise RuntimeError('Watchdog already restored; experiment canceled.')
            stopped = adb_call(adb_path, ['kill-server'])
            if stopped.returncode:
                raise RuntimeError('Could not stop the validated original ADB server.')
            stop_deadline = time.monotonic() + 10
            while same_process(original_server) and time.monotonic() < stop_deadline:
                time.sleep(.1)
            if same_process(original_server):
                raise RuntimeError('Original ADB server still running; keys untouched.')
            for item in state['files']:
                if digest(item['current']) != item['original_sha256']:
                    raise RuntimeError('Original key changed after baseline; abort.')
                if Path(item['backup']).exists():
                    raise RuntimeError('Backup collision; abort.')
                if item['original_sha256'] is not None:
                    os.replace(item['current'], item['backup'])
                os.replace(item['source'], item['current'])
            environment = os.environ.copy()
            environment.pop('ADB_VENDOR_KEYS', None)
            for name in ('ADB_SERVER_SOCKET', 'ANDROID_ADB_SERVER_ADDRESS', 'ANDROID_ADB_SERVER_PORT'):
                environment.pop(name, None)
            with (output / 'test-server.log').open('wb') as log:
                # ADB's server listener rejects explicit hostnames on this build.
                # Without -a, tcp:PORT binds loopback; verify that below as well.
                server = subprocess.Popen([str(test_adb), '-L', f'tcp:{TEST_PORT}',
                                           '--one-device', args.serial, 'nodaemon', 'server'],
                                          env=environment, stdin=subprocess.DEVNULL, stdout=log, stderr=log,
                                          creationflags=CREATE_NO_WINDOW, close_fds=True)
                state['test_server'] = process_identity(server.pid)
                if not state['test_server']:
                    raise RuntimeError('New test server exited before identity could be recorded.')
                write_json(journal, state)
        states = []
        listener_checked = False
        deadline = time.monotonic() + 20
        while time.monotonic() < deadline:
            if not same_process(state['test_server']):
                raise RuntimeError('Test server exited; no auto-restart attempted.')
            try:
                text = smart_socket('host:devices', port=TEST_PORT)
                if not listener_checked:
                    listeners = [x for x in host_snapshot()['tcp']
                                 if x['LocalPort'] == TEST_PORT and x['State'] == 'Listen']
                    if (not listeners or any(x['LocalAddress'] not in ('127.0.0.1', '::1')
                            or x['OwningProcess'] != state['test_server']['pid'] for x in listeners)):
                        raise RuntimeError('Test server listener is not its expected loopback socket.')
                    listener_checked = True
            except OSError:
                # The newly started server may not yet listen. Poll the same
                # live process; a dead process is rejected above on next pass.
                text = ''
            device_state = next((line.split()[1] for line in text.splitlines()
                                 if line.split()[:1] == [args.serial] and len(line.split()) > 1), 'absent')
            states.append({'at': time.time(), 'state': device_state})
            if device_state == 'device':
                break
            time.sleep(.5)
        observed = states[-1]['state'] if states else 'absent'
        result = {'expected': args.expected, 'observed': observed, 'states': states,
                  'fingerprint': state['fingerprint'], 'pass': observed == args.expected,
                  'new_usb_shell_challenge_passed': False}
        if observed == 'device':
            proof = 'LSA_NEW_RSA_' + secrets.token_hex(16)
            answer = smart_socket('shell:echo ' + proof, serial=args.serial, port=TEST_PORT)
            result['new_usb_shell_challenge_passed'] = answer.strip() == proof
            result['pass'] &= result['new_usb_shell_challenge_passed']
        elif args.expected == 'unauthorized':
            result['pass'] &= sum(x['state'] == 'unauthorized' for x in states) >= 5
        write_json(output / 'result.json', result)
    except BaseException as exc:
        observer_error = f'{type(exc).__name__}: {exc}'
        write_json(output / 'observer-error.json', {'error': observer_error})
    finally:
        try:
            restore(journal)
        except Exception as exc:
            recovery_error = str(exc)
            write_json(output / 'recovery-error.json', {'error': recovery_error})
    if observer_error or recovery_error:
        raise RuntimeError(f'Observation: {observer_error}; recovery: {recovery_error}. Journal: {journal}')
    final = read_json(output / 'result.json')
    final['recovery'] = read_json(journal)['recovery']
    final['phone_cleanup_required'] = 'Caller must revoke only this temporary fingerprint if it was authorized.'
    write_json(output / 'result.json', final)
    return final


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest='command', required=True)
    sub.add_parser('preflight').add_argument('--server-exe', default=str(DEFAULT_ADB))
    observation = sub.add_parser('observe')
    observation.add_argument('--expected', choices=['device', 'unauthorized'], required=True)
    observation.add_argument('--server-pid', type=int, required=True)
    observation.add_argument('--server-exe', required=True,
                             help='Exact observed original server path to preserve and restore.')
    observation.add_argument('--exclusive-use-confirmed', action='store_true')
    observation.add_argument('--serial', default=SERIAL)
    observation.add_argument('--output', required=True)
    for command in ('restore', '_watchdog'):
        sub.add_parser(command).add_argument('--journal', required=True)
    args = parser.parse_args()
    if args.command == 'preflight':
        snapshot = host_snapshot()
        snapshot['listener_identities'] = [process_identity(pid) for pid in sorted({
            x['OwningProcess'] for x in snapshot['tcp'] if x['State'] == 'Listen'})]
        try:
            identity = validate_host(snapshot, Path(args.server_exe))
            snapshot['server'] = identity
            snapshot['observed_clients_clear'] = True
        except Exception as exc:
            snapshot['observed_clients_clear'] = False
            snapshot['reason'] = str(exc)
        snapshot['limitation'] = ('A snapshot cannot detect idle clients that may reconnect later. Observe refuses '
                                  'without explicit exclusive-use confirmation; pause all other phone agents/tools.')
        print(json.dumps(snapshot, ensure_ascii=False, indent=2))
    elif args.command == 'observe':
        result = observe(args)
        print(json.dumps(result, ensure_ascii=False, indent=2))
        if not result['pass']:
            raise SystemExit(2)
    elif args.command == 'restore':
        print(json.dumps(restore(args.journal), ensure_ascii=False, indent=2))
    else:
        watchdog(args.journal)


if __name__ == '__main__':
    main()
