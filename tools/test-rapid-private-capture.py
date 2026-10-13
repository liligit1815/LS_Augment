"""Actual shell/FD-lock fault tests. Hardware, package identity and sysfs are isolated models."""
from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import tempfile
import time
import uuid

ROOT = Path(__file__).resolve().parents[1]
if os.name == 'nt':
    # Real Linux flock/open-file-description semantics are required; do not fake
    # the very crash/concurrency behaviour this test is meant to cover.
    names = subprocess.check_output(['wsl.exe', '--list', '--quiet']).decode('utf-16-le').splitlines()
    distro = os.environ.get('LSA_TEST_WSL_DISTRO') or next(n.strip() for n in names if n.strip() and 'docker' not in n.lower())
    script = '/mnt/' + str(Path(__file__).resolve().drive)[0].lower() + Path(__file__).resolve().as_posix()[2:]
    raise SystemExit(subprocess.call(['wsl.exe', '-d', distro, '--exec', 'python3', script]))

ASSETS = ROOT / 'android/app/src/main/assets'
CAPTURE = (ASSETS / 'rapid_input_capture.sh').read_text()
RESET = (ASSETS / 'rapid_reset_wait.sh').read_text()
HASH = '3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532'
BOOT = '12345678-1234-1234-1234-123456789abc'
OTHER_BOOT = '00000000-1234-1234-1234-123456789abc'
checks = 0
results = []


def check(value, why):
    global checks
    checks += 1
    assert value, why


def wait_for(test, timeout=5):
    end = time.monotonic() + timeout
    while time.monotonic() < end:
        if test():
            return True
        time.sleep(.025)
    return False


class Fixture:
    def __init__(self, path):
        self.root = Path(path)
        self.driver = self.root / 'vendor_dlkm/lib/modules/aw9620x.ko'
        self.driver.parent.mkdir(parents=True)
        self.driver.write_bytes(b'verified immutable fixture driver')
        self.digest = hashlib.sha256(self.driver.read_bytes()).hexdigest()
        self.boot = self.root / 'boot_id'
        self.boot.write_text(BOOT + '\n')
        for n in (0, 1):
            name = self.root / f'sys/class/input/event{n}/device/name'
            name.parent.mkdir(parents=True)
            name.write_text(f'nubia_tgk_aw_sar{n}_ch0\n')
            mode = self.root / f'sys/class/leds/sar{n}/mode_operation'
            mode.parent.mkdir(parents=True)
            mode.write_text('2\n')
        self.bin = self.root / 'bin'
        self.bin.mkdir()
        reader = self.bin / 'getevent'
        reader.write_text('''#!/bin/bash
trap 'exit 0' TERM INT HUP
[ ! -e /proc/$$/fd/9 ] || echo inherited > "$fixture/inherited-lock"
echo $$ > "$fixture/reader-pid"
touch "$fixture/reader-started"
while :; do sleep 0.05; done
''')
        reader.chmod(0o700)
        self.processes = []

    def session(self, user=0):
        uid = user * 100000 + 10077
        base = self.root / f'data/user/{user}/ls.augment.com'
        cache, recovery = base / 'cache', base / 'files/rapid-capture-v1'
        cache.mkdir(parents=True, exist_ok=True)
        recovery.mkdir(parents=True, exist_ok=True)
        lease = cache / f'rapid-input-{uuid.uuid4()}.lease'
        state = recovery / (lease.name + '.recorder')
        lease.touch()
        state.touch()
        return dict(uid=uid, user=user, base=base, lease=lease, state=state)

    def text(self, source, session, extra=''):
        script = source.replace(HASH, self.digest)
        script = script.replace('/proc/sys/kernel/random/boot_id', str(self.boot))
        for path in ('/data/user/', '/data/data/', '/vendor_dlkm/', '/sys/'):
            script = script.replace(path, str(self.root) + path)
        script = script.replace('/dev/.lsaugment_rapid_input_capture', str(self.root / 'legacy-lock'))
        # Bound only the failure-test wait, leaving production intervals intact.
        script = script.replace('[ "$ticks" -lt 150 ]', '[ "$ticks" -lt 10 ]')
        prefix = f'''fixture='{self.root}'
export fixture
export PATH='{self.bin}':"$PATH"
expected_uid={session['uid']}
expected_user={session['user']}
id() {{ [ "$1" = -u ] && echo 0; }}
stat() {{
 if [ "$1" = -c ] && [ "$2" = %u ]; then
  [ "$3" != "$fixture/legacy-lock" ] || {{ echo 0; return; }}
  case "$3" in '{session['base']}'*) echo "$expected_uid"; return;; esac
 fi
 command stat "$@"
}}
sed() {{
 case "$3" in "$fixture/sys/class/leds/"*)
  value=$(cat "$3")
  if [ "${{FAIL_RESTORE:-0}}" = 1 ] && [ -f "$fixture/reader-started" ] && [ "$value" = 1 ]; then echo 3; else echo "$value"; fi
  return;;
 esac
 command sed "$@"
}}
fsync() {{
 [ "${{FAIL_SYNC:-0}}" != 1 ] || return 1
 python3 -c 'import os,sys;f=os.open(sys.argv[1],os.O_RDONLY);os.fsync(f);os.close(f)' "$1"
}}
{extra}
'''
        return prefix + script

    def start(self, session, extra=''):
        output = self.root / (session['lease'].stem + '.output')
        args = [str(os.getpid()), str(session['lease']), '/dev/input/event0', '/dev/input/event1',
                '/dev/input/event0', str(session['uid']), str(session['state'])]
        stream = output.open('w')
        proc = subprocess.Popen(['/bin/bash', '-c', self.text(CAPTURE, session, extra), '--', *args], stdout=stream, stderr=subprocess.STDOUT)
        stream.close()
        self.processes.append(proc)
        return proc, output

    def ready(self, proc, output):
        check(wait_for(lambda: 'LSA_CAPTURE_READY=' in output.read_text() or proc.poll() is not None), 'capture reaches a decision')
        check('LSA_CAPTURE_READY=' in output.read_text(), output.read_text())

    def finish(self, session, proc, output):
        Path(str(session['lease']) + '.complete').touch()
        proc.wait(timeout=6)
        check(wait_for(lambda: not session['state'].exists()), 'confirmed recovery deletes private responsibility')
        text = output.read_text()
        check('LSA_CAPTURE_END=pair_received' in text and 'LSA_CAPTURE_RESTORED=2:2' in text, text)
        check(not (self.root / 'inherited-lock').exists(), 'reader must not inherit lock FD')
        check(self.modes() == ('2', '2'), 'both original hardware modes restored')

    def modes(self):
        return tuple((self.root / f'sys/class/leds/sar{n}/mode_operation').read_text().strip() for n in (0, 1))

    def reset(self, session, extra=''):
        return subprocess.run(['/bin/bash', '-c', self.text(RESET, session, extra)], capture_output=True, text=True, timeout=6)

    def lock(self):
        return subprocess.run(['flock', '-x', '-n', str(self.driver), 'true']).returncode == 0

    def cleanup(self):
        for proc in self.processes:
            if proc.poll() is None:
                proc.terminate()
                proc.wait(timeout=6)
        pidfile = self.root / 'reader-pid'
        if pidfile.exists():
            try:
                pid = int(pidfile.read_text())
                # Only a fixture script from this exact private temporary root.
                cmdline = Path(f'/proc/{pid}/cmdline').read_bytes()
                if str(self.bin / 'getevent').encode() in cmdline:
                    os.kill(pid, signal.SIGTERM)
            except (FileNotFoundError, ProcessLookupError):
                pass


def case(name, action):
    with tempfile.TemporaryDirectory(prefix='lsa-rapid-private-') as directory:
        fixture = Fixture(directory)
        try:
            action(fixture)
            results.append(name)
            print('PASS', name, flush=True)
        finally:
            fixture.cleanup()


def normal(f):
    s = f.session(); p, out = f.start(s); f.ready(p, out)
    check(not f.lock(), 'real lock is held during capture')
    check(s['state'].read_text().startswith(BOOT + ':'), 'responsibility is in module files directory')
    f.finish(s, p, out)
    check(wait_for(f.lock), 'normal recovery releases inherited lock')
case('normal capture / restore / no reader FD leak', normal)


def overlap(f):
    first = f.session(); p, out = f.start(first); f.ready(p, out)
    other = f.session(10); second, second_out = f.start(other); second.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=busy' in second_out.read_text(), 'different Android user shares the driver inode lock')
    check(not other['state'].read_text(), 'busy rejection does not acquire restoration responsibility')
    f.finish(first, p, out)
case('cross-user exclusion on same inode', overlap)


def crash(f):
    s = f.session(); p, out = f.start(s); f.ready(p, out)
    reader = int((f.root / 'reader-pid').read_text())
    p.kill(); p.wait(timeout=3)
    check(wait_for(lambda: not s['state'].exists()), 'watchdog finishes recovery after controller SIGKILL')
    check(f.modes() == ('2', '2') and wait_for(f.lock), 'watchdog holds lock until restoration')
    check(not Path(f'/proc/{reader}').exists() or ') Z ' in Path(f'/proc/{reader}/stat').read_text(), 'watchdog stops original recorder')
case('controller SIGKILL recovery', crash)


def double_crash(f):
    s = f.session(); p, out = f.start(s); f.ready(p, out)
    children = Path(f'/proc/{p.pid}/task/{p.pid}/children').read_text().split()
    watchdogs = [int(pid) for pid in children if Path(f'/proc/{pid}/cmdline').read_bytes().startswith(b'/bin/bash\0-c\0')]
    check(len(watchdogs) == 1, 'one separate armed watchdog')
    os.kill(watchdogs[0], signal.SIGKILL); p.kill(); p.wait(timeout=3)
    check(wait_for(f.lock) and s['state'].exists(), 'kernel lock releases on total process death while durable responsibility stays')
    result = f.reset(s)
    check(result.returncode == 73 and 'recovery_unconfirmed' in result.stderr and s['state'].exists(), result.stderr)
case('controller and watchdog SIGKILL retain reset barrier', double_crash)


def reused_pid(f):
    s = f.session(); p, out = f.start(s); f.ready(p, out)
    unrelated = subprocess.Popen(['sleep', '10'])
    try:
        s['state'].write_text(f'{BOOT}:{unrelated.pid}:1\n')
        p.kill(); p.wait(timeout=3)
        check(wait_for(lambda: not s['state'].exists()), 'watchdog can finish when recorded PID no longer identifies original process')
        check(unrelated.poll() is None and f.modes() == ('2', '2'), 'starttime mismatch never kills an unrelated reused PID')
    finally:
        unrelated.terminate(); unrelated.wait(timeout=3)
case('PID reuse mismatch never signals unrelated process', reused_pid)


def reader_stop_failure(f):
    s = f.session()
    reject = '''kill() {
 if [ "$1" = -TERM ] || [ "$1" = -KILL ]; then
  [ "$2" != "$(cat "$fixture/reader-pid" 2>/dev/null)" ] || return 1
 fi
 builtin kill "$@"
}'''
    p, out = f.start(s, reject); f.ready(p, out)
    Path(str(s['lease']) + '.complete').touch(); p.wait(timeout=6)
    text = out.read_text()
    check('LSA_CAPTURE_ERROR=reader_stop_failed' in text and 'LSA_CAPTURE_RESTORED=' not in text, text)
    check(s['state'].exists() and f.modes() == ('2', '2'), 'restored modes cannot discard an unconfirmed reader responsibility')
    result = f.reset(s)
    check(result.returncode == 73 and 'recovery_unconfirmed' in result.stderr, result.stderr)
case('reader stop failure keeps restoration responsibility', reader_stop_failure)


def reset_active(f):
    s = f.session(); p, out = f.start(s); f.ready(p, out)
    result = f.reset(s)
    p.wait(timeout=5)
    check(result.returncode == 0 and result.stdout.strip() == 'RAPID_CAPTURE_DRAINED:1:1', result.stdout + result.stderr)
    check(f.modes() == ('2', '2') and not s['state'].exists(), 'reset waits for restoration rather than clearing live records')
case('reset cancels lease and waits for actual lock drain', reset_active)


def failed_restore(f):
    s = f.session(); p, out = f.start(s, 'FAIL_RESTORE=1'); f.ready(p, out)
    Path(str(s['lease']) + '.complete').touch(); p.wait(timeout=5)
    check('LSA_CAPTURE_ERROR=restore_failed' in out.read_text() and s['state'].exists(), 'failed restore retains durable responsibility')
    result = f.reset(s)
    check(result.returncode == 73 and 'recovery_unconfirmed' in result.stderr and s['state'].exists(), result.stderr)
    other = f.session(); nextp, nextout = f.start(other); nextp.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=recovery_pending' in nextout.read_text(), 'new capture cannot overwrite unresolved same-boot recovery')
    f.boot.write_text(OTHER_BOOT + '\n')
    result = f.reset(s)
    check(result.returncode == 0 and not s['state'].exists(), 'new boot releases stale responsibility without using it as a lock')
case('failed restore blocks reset / next capture; reboot permits stale cleanup', failed_restore)


def malformed(f):
    s = f.session(); s['state'].write_text('unknown recovery record')
    result = f.reset(s)
    check(result.returncode == 73 and 'recovery_format' in result.stderr and s['state'].exists(), result.stderr)
case('unknown responsibility is retained', malformed)


def rejected_sidecar(f):
    s = f.session(); alias = f.root / 'foreign'; alias.write_text('do not change')
    s['state'].unlink(); s['state'].symlink_to(alias)
    p, out = f.start(s); p.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=invalid_recorder' in out.read_text(), out.read_text())
    check(alias.read_text() == 'do not change' and f.modes() == ('2', '2'), 'symlink never modifies foreign file or hardware')
case('private sidecar symlink rejected before wake', rejected_sidecar)


def hardlink(f):
    s = f.session(); os.link(s['state'], f.root / 'alias')
    p, out = f.start(s); p.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=invalid_recorder' in out.read_text() and f.modes() == ('2', '2'), out.read_text())
case('private sidecar hardlink rejected before wake', hardlink)


def sync_fail(f):
    s = f.session(); p, out = f.start(s, 'FAIL_SYNC=1'); p.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=invalid_recorder_write' in out.read_text(), out.read_text())
    check(not (f.root / 'reader-started').exists() and f.modes() == ('2', '2'), 'failed persistence prevents hardware wake')
case('durable responsibility failure prevents wake', sync_fail)


def lock_missing(f):
    s = f.session()
    reject = '''command() {
 if [ "$1" = -v ] && [ "$2" = flock ]; then return 1; fi
 builtin command "$@"
}'''
    p, out = f.start(s, reject); p.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=missing_flock' in out.read_text() and f.modes() == ('2', '2'), out.read_text())
    check(s['state'].read_text() == '', 'unavailable lock does not start a hardware responsibility')
case('missing flock fails before any hardware mutation', lock_missing)


def readonly_reset(f):
    s = f.session(); f.driver.unlink()
    result = f.reset(s)
    check(result.returncode == 0 and result.stdout.strip() == 'RAPID_CAPTURE_DRAINED:1:0', result.stderr)
    check(not s['state'].exists(), 'empty pre-wake record is removable on unsupported hardware')
case('unsupported/read-only device reset requires no hardware driver', readonly_reset)


def legacy(f):
    s = f.session(); old = f.root / 'legacy-lock'; old.mkdir()
    p, out = f.start(s); p.wait(timeout=4)
    check('LSA_CAPTURE_ERROR=busy' in out.read_text() and old.is_dir(), 'old controller remains authoritative')
    result = f.reset(s)
    check(result.returncode == 73 and 'session_still_running' in result.stderr and old.is_dir(), 'legacy lock only waited on, never deleted')
case('legacy tmpfs lock is wait-only', legacy)

report = ROOT / 'out/rapid-private-capture/verification.json'
report.parent.mkdir(parents=True, exist_ok=True)
report.write_text(json.dumps({'cases': results, 'assertions': checks, 'lockSemantics': 'real Linux flock; real subprocess signals',
    'models': ['fixed driver hash', 'package UID', 'sysfs mode read/write', 'getevent'], 'deviceCommands': False}, indent=2))
print(f'PASS Rapid private capture: {len(results)} scenarios, {checks} assertions; no device operations')
