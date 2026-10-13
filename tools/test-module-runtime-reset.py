"""Compile production reset workers and execute its real cleanup shells in disposable offline fixtures."""
from pathlib import Path
import json
import os
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parent.parent
GAME_ONLY = '--game-only' in sys.argv
if GAME_ONLY and os.name == 'nt':
    # Directory/link race scenarios need Linux filesystem semantics, not a mocked -L test.
    names = subprocess.check_output(['wsl.exe', '--list', '--quiet']).decode('utf-16-le').splitlines()
    distro = os.environ.get('LSA_TEST_WSL_DISTRO') or next(n.strip() for n in names if n.strip() and 'docker' not in n.lower())
    script = '/mnt/' + str(Path(__file__).resolve().drive)[0].lower() + Path(__file__).resolve().as_posix()[2:]
    raise SystemExit(subprocess.call(['wsl.exe', '-d', distro, '--exec', 'python3', script, '--game-only']))
JAVA = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
BASH = Path(r'C:/Program Files/Git/bin/bash.exe') if os.name == 'nt' else Path('/bin/bash')
PYTHON_OUTPUT = ROOT / 'audit-output/module-runtime-reset-tests'
OUT = PYTHON_OUTPUT / 'classes'
OUT.mkdir(parents=True, exist_ok=True)
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com'
ANDROID = ROOT / 'audit-output/android-sdk/platforms/android-36/android.jar'
PROJECT_CLASSES = ROOT / 'android/app/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes'
DEPENDENCIES = str(ANDROID) + os.pathsep + str(PROJECT_CLASSES)
PRODUCTION = ('RootShell', 'ResetWriteFence', 'ModuleWorkerDrain', 'BootJobService', 'BatteryLifeControl',
              'GameHelperResetCache', 'ModuleRuntimeReset', 'RapidCaptureReset', 'RapidFirePhysicalCapture',
              'LauncherResetController', 'LauncherResetXml', 'LauncherResetPolicy', 'LauncherResetRuntime', 'HealthResetController')
CP = str(OUT) + os.pathsep + DEPENDENCIES
if not GAME_ONLY:
    subprocess.run([str(JAVA / 'bin/javac.exe'), '-encoding', 'UTF-8', '-cp', DEPENDENCIES, '-d', str(OUT),
                    *[str(SOURCE / (name + '.java')) for name in PRODUCTION],
                    str(ROOT / 'tools/TestModuleWorkerDrain.java')], check=True)
    unit = subprocess.check_output([str(JAVA / 'bin/java.exe'), '-cp', CP, 'ls.augment.com.TestModuleWorkerDrain'], text=True)
    (PYTHON_OUTPUT / 'worker-result.txt').write_text(unit, encoding='utf-8')
    print(unit.strip())
SCRIPTS = {
    'game': (ROOT / 'android/app/src/main/assets/gamehelper_reset_cache.sh').read_text(encoding='utf-8'),
    'rapid': (ROOT / 'android/app/src/main/assets/rapid_reset_wait.sh').read_text(encoding='utf-8'),
    'battery': '' if GAME_ONLY else subprocess.check_output([str(JAVA / 'bin/java.exe'), '-cp', CP,
                                                           'ls.augment.com.TestModuleWorkerDrain', '--battery-script'], text=True),
}
FAKE = r'''
id() { [ "$1" = -u ] && printf '0\n'; }
fsync() { printf '%s\n' "$@" >> "$fixture/synced"; [ "$fixture_sync_fail" != 1 ]; }
fixture_stat() {
 if [ "$1" = -c ]; then
   if [ "$fixture_bad_owner" = 1 ] && [ "$3" = "$bad_file" ]; then owner=99999; else owner=$expected_uid; fi
   case "$3" in "$fixture/dev/"*|"$fixture/data/adb/"*) owner=0 ;; esac
   if [ "$fixture_bad_owner" = 1 ] && [ "$3" = "$bad_file" ]; then owner=99999; fi
   if [ "$2" = %u ]; then printf '%s\n' "$owner"; return; fi
   if [ "$2" = '%u:%g:%a' ]; then
     if [ -d "$3" ]; then printf '%s:0:700\n' "$owner"; else printf '%s:0:600\n' "$owner"; fi
     return
   fi
 fi
 command stat "$@"
}
stat() { fixture_stat "$@"; }
cmd() {
 [ "$*" = "package list packages --user 0 -U cn.nubia.gamehelpmodule" ] || return 1
 [ "$fixture_wrong_package" != 1 ] || return 1
 printf 'package:cn.nubia.gamehelpmodule uid:%s\n' "$expected_uid"
}
am() {
 [ "$*" = "force-stop --user 0 cn.nubia.gamehelpmodule" ] || return 1
 [ "$fixture_stop_fail" != 1 ] || return 1
 printf yes > "$fixture/stopped"
}
rm() {
 for argument in "$@"; do
   case "$argument" in "$fixture/dev"*) printf 'fixture forbids external lock deletion\n' >&2; return 1;; esac
   if [ "$fixture_remove_fail" = 1 ] && [ "$argument" = "$bad_file" ]; then return 1; fi
   case "$argument" in "$fixture/data/user/0/cn.nubia.gamehelpmodule/cache/ls_augment_combo/"*)
     [ -f "$fixture/stopped" ] || return 1;; esac
 done
 command rm "$@"
}
rmdir() {
  if [ "$fixture_kind" != game ]; then command rmdir "$@"; return; fi
  if [ "$*" != "-- $base/cache/ls_augment_combo" ]; then
    printf 'fixture forbids unexpected directory deletion\n' >&2; return 1
  fi
  printf yes > "$fixture/rmdir-attempted"
  command rmdir "$@"
}
'''

def fixture(name, script, setup='', bad_owner=False, stop_fail=False, remove_fail=False, sync_fail=False, wrong_package=False, game_entries='mixed'):
    with tempfile.TemporaryDirectory(prefix=script + '-', dir=PYTHON_OUTPUT if os.name == 'nt' else None) as path:
        folder = Path(path)
        posix = '/' + folder.drive[0].lower() + folder.as_posix()[2:] if os.name == 'nt' else folder.as_posix()
        translated = re.sub(r'(?<![A-Za-z0-9_/])/data(?=/|[\s\'"]|$)', posix + '/data', SCRIPTS[script])
        translated = translated.replace('/dev/.lsaugment_rapid_input_capture', posix + '/dev/.lsaugment_rapid_input_capture')
        translated = translated.replace('/vendor_dlkm/lib/modules/aw9620x.ko', posix + '/vendor_dlkm/lib/modules/aw9620x.ko')
        translated = translated.replace('/proc/sys/kernel/random/boot_id', posix + '/proc/sys/kernel/random/boot_id')
        translated = translated.replace('/proc/[0-9]', posix + '/proc/[0-9]')
        # Only compress the bounded wait in failure fixtures; no path or ownership rule is relaxed.
        translated = translated.replace('[ "$ticks" -lt 150 ]', '[ "$ticks" -lt 5 ]')
        game = posix + '/data/user/0/cn.nubia.gamehelpmodule'
        cache = game + '/cache/ls_augment_combo'
        module = posix + '/data/user/0/ls.augment.com/cache'
        a = cache + '/motion-v3-' + 'a' * 64 + '.json'
        b = cache + '/motion-v3-' + 'b' * 64 + '.pending-123456'
        lease = module + '/rapid-input-12345678-1234-1234-1234-123456789abc.lease'
        uid = 0 if script == 'battery' else (10044 if script == 'game' else 10077)
        bad = a if script == 'game' else (lease if script == 'rapid' else posix + '/data/adb/ls_augment/v2/battery/life.conf')
        header = '\n'.join([
            f"fixture='{posix}'", f"fixture_kind='{script}'", f'expected_uid={uid}', 'expected_user=0', f"base='{game}'", f"bad_file='{bad}'",
            f'fixture_bad_owner={int(bad_owner)}', f'fixture_stop_fail={int(stop_fail)}', f'fixture_remove_fail={int(remove_fail)}',
            f'fixture_sync_fail={int(sync_fail)}', f'fixture_wrong_package={int(wrong_package)}', FAKE,
            'mkdir -p "$fixture/dev" "$fixture/proc/1"',
            'printf "Uid:\\t1\\t1\\t1\\t1\\n" > "$fixture/proc/1/status"',
            f'''mkdir -p '{cache}' '{game}/files' '{module}' "$fixture/data/adb/ls_augment/v2/battery"''',
            f"printf derivative > '{a}'; printf pending > '{b}'" if game_entries != 'empty' else '',
            f"printf original > '{game}/files/motion.json'",
            f"printf unknown > '{cache}/do-not-delete.json'; printf malformed > '{cache}/motion-v3-user-note.json'; printf older > '{cache}/motion-v2-unconfirmed.json'" if game_entries == 'mixed' else '',
            f"printf lease > '{lease}'; printf unknown > '{module}/rapid-input-user-note.lease'",
            'printf overlay > "$fixture/data/adb/ls_augment/v2/battery/life.conf"',
            setup, translated,
        ])
        (PYTHON_OUTPUT / 'last-fixture.sh').write_text(header, encoding='utf-8', newline='\n')
        result = subprocess.run([str(BASH), '-s'], input=header, capture_output=True, text=True,
                                env=dict(os.environ, MSYS='winsymlinks:nativestrict'))
        game_path = folder / 'data/user/0/cn.nubia.gamehelpmodule'
        game_cache = game_path / 'cache/ls_augment_combo'
        def optional_text(path):
            return path.read_text() if path.is_file() else None
        records = {'case': name, 'exit': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr,
                   'derivativeExists': (game_path / 'cache/ls_augment_combo' / Path(a).name).exists(),
                   'pendingExists': (game_path / 'cache/ls_augment_combo' / Path(b).name).exists(),
                   'stopped': (folder / 'stopped').exists(),
                   'directoryExists': game_cache.exists(),
                   'directoryIsLink': game_cache.is_symlink(),
                   'directoryEntries': sorted(item.name for item in game_cache.iterdir()) if game_cache.is_dir() else [],
                   'rmdirAttempted': (folder / 'rmdir-attempted').exists(),
                   'syncs': (folder / 'synced').read_text().splitlines() if (folder / 'synced').exists() else [],
                   'cacheParent': (game_path / 'cache').as_posix() if os.name != 'nt' else posix + '/data/user/0/cn.nubia.gamehelpmodule/cache',
                   'replacedDirectoryExists': (game_path / 'cache/prior-combo').exists(),
                   'outsideSentinel': optional_text(folder / 'sentinel/keep'),
                   'original': (game_path / 'files/motion.json').read_text(),
                   'unknown': optional_text(game_cache / 'do-not-delete.json'),
                   'malformed': optional_text(game_cache / 'motion-v3-user-note.json'),
                   'oldUnconfirmed': optional_text(game_cache / 'motion-v2-unconfirmed.json'),
                   'leaseExists': (folder / 'data/user/0/ls.augment.com/cache' / Path(lease).name).exists(),
                   'unknownLease': (folder / 'data/user/0/ls.augment.com/cache/rapid-input-user-note.lease').read_text(),
                   'lockExists': (folder / 'dev/.lsaugment_rapid_input_capture').exists()}
        assert records['original'] == 'original' and records['unknownLease'] == 'unknown'
        if game_entries == 'mixed':
            assert records['unknown'] == 'unknown' and records['malformed'] == 'malformed' and records['oldUnconfirmed'] == 'older'
        return records

results = []
normal = fixture('game-generated-only', 'game')
assert normal['exit'] == 0 and normal['stdout'].strip() == 'GAMEHELPER_CACHE_CLEARED:2', normal
assert not normal['derivativeExists'] and not normal['pendingExists']
results.append(normal)
absent = fixture('game-no-owned-source-no-interruption', 'game', 'command rm -f -- "$bad_file" "$base/cache/ls_augment_combo"/motion-v3-*.pending-*')
assert absent['exit'] == 0 and absent['stdout'].strip() == 'GAMEHELPER_CACHE_CLEARED:0' and not absent['stopped'], absent
results.append(absent)
for name, kwargs, marker in (
    ('game-owner-refused-before-first-delete', {'bad_owner': True}, 'file_owner'),
    ('game-force-stop-denied', {'stop_fail': True}, 'force_stop'),
    ('game-package-identity-refused', {'wrong_package': True}, 'package_identity'),
    ('game-removal-denied', {'remove_fail': True}, 'file_remove'),
):
    record = fixture(name, 'game', **kwargs)
    assert record['exit'] == 73 and marker in record['stderr'] and record['derivativeExists'] and record['pendingExists'], record
    results.append(record)
live = fixture('game-active-target-uid-refused', 'game', 'printf "Uid:\\t10044\\t10044\\t10044\\t10044\\n" > "$fixture/proc/1/status"')
assert live['exit'] == 73 and 'process_still_running' in live['stderr'] and live['derivativeExists']
results.append(live)
link = fixture('game-hardlink-refused', 'game', 'ln "$bad_file" "$fixture/alias"')
assert link['exit'] == 73 and 'file_hardlink' in link['stderr'] and link['derivativeExists']
results.append(link)
durability = fixture('game-durability-failure-explicit', 'game', sync_fail=True)
assert durability['exit'] == 73 and 'removal_not_durable' in durability['stderr']
results.append(durability)

empty = fixture('game-empty-directory-retired-without-stop', 'game', game_entries='empty')
assert empty['exit'] == 0 and empty['stdout'].strip() == 'GAMEHELPER_CACHE_CLEARED:0', empty
assert not empty['stopped'] and not empty['directoryExists'] and empty['rmdirAttempted'], empty
assert empty['syncs'] == [empty['cacheParent']], empty
results.append(empty)
owned = fixture('game-owned-files-then-empty-directory-retired', 'game', game_entries='owned')
assert owned['exit'] == 0 and owned['stdout'].strip() == 'GAMEHELPER_CACHE_CLEARED:2', owned
assert owned['stopped'] and not owned['directoryExists'] and owned['rmdirAttempted'], owned
assert owned['syncs'][-1] == owned['cacheParent'], owned
results.append(owned)
for name, setup, entry in (
    ('ordinary', 'printf unknown > "$base/cache/ls_augment_combo/unknown"', 'unknown'),
    ('hidden', 'printf unknown > "$base/cache/ls_augment_combo/.unknown"', '.unknown'),
    ('double-dot', 'printf unknown > "$base/cache/ls_augment_combo/..unknown"', '..unknown'),
    ('hidden-directory', 'mkdir "$base/cache/ls_augment_combo/.keep"', '.keep'),
):
    kept = fixture('game-unknown-' + name + '-retained-without-stop', 'game', setup, game_entries='empty')
    assert kept['exit'] == 0 and kept['directoryEntries'] == [entry], kept
    assert not kept['stopped'] and not kept['rmdirAttempted'] and not kept['syncs'], kept
    results.append(kept)

replace_directory = r'''
stat() {
 if [ "$1" = -c ] && [ "$2" = '%d:%i:%u:%g:%a' ] && [ "$3" = "$base/cache/ls_augment_combo" ]; then
   if [ -e "$fixture/identity-seen" ] && [ ! -e "$fixture/replaced" ]; then
     command mv -- "$3" "$base/cache/prior-combo"
     mkdir "$3"
     printf yes > "$fixture/replaced"
   fi
   printf yes > "$fixture/identity-seen"
 fi
 fixture_stat "$@"
}
'''
changed = fixture('game-empty-directory-inode-replacement-refused', 'game', replace_directory, game_entries='empty')
assert changed['exit'] == 73 and 'changed_directory_identity' in changed['stderr'], changed
assert changed['directoryExists'] and changed['replacedDirectoryExists'] and not changed['rmdirAttempted'] and not changed['stopped'], changed
results.append(changed)
change_uid = r'''
stat() {
 if [ "$1" = -c ] && [ "$2" = %u ] && [ "$3" = "$base/cache/ls_augment_combo" ]; then
   if [ -e "$fixture/owner-seen" ]; then printf '99999\n'; return; fi
   printf yes > "$fixture/owner-seen"
 fi
 fixture_stat "$@"
}
'''
changed = fixture('game-empty-directory-owner-change-refused', 'game', change_uid, game_entries='empty')
assert changed['exit'] == 73 and 'changed_directory_owner' in changed['stderr'], changed
assert changed['directoryExists'] and not changed['rmdirAttempted'] and not changed['stopped'], changed
results.append(changed)
change_package = r'''
cmd() {
 [ ! -e "$fixture/package-seen" ] || return 1
 printf yes > "$fixture/package-seen"
 printf 'package:cn.nubia.gamehelpmodule uid:%s\n' "$expected_uid"
}
'''
changed = fixture('game-empty-directory-package-change-refused', 'game', change_package, game_entries='empty')
assert changed['exit'] == 73 and 'changed_package_identity' in changed['stderr'], changed
assert changed['directoryExists'] and not changed['rmdirAttempted'] and not changed['stopped'], changed
results.append(changed)
change_canonical = r'''
readlink() {
 if [ "$1" = -f ] && [ "$2" = "$base/cache/ls_augment_combo" ]; then
   if [ -e "$fixture/canonical-seen" ]; then printf '%s\n' "$fixture/other"; return; fi
   printf yes > "$fixture/canonical-seen"
 fi
 command readlink "$@"
}
'''
changed = fixture('game-empty-directory-canonical-change-refused', 'game', change_canonical, game_entries='empty')
assert changed['exit'] == 73 and 'changed_directory' in changed['stderr'], changed
assert changed['directoryExists'] and not changed['rmdirAttempted'] and not changed['stopped'], changed
results.append(changed)
denied = fixture('game-empty-rmdir-denied-explicit', 'game', 'rmdir() { return 1; }', game_entries='empty')
assert denied['exit'] == 73 and 'directory_remove' in denied['stderr'] and denied['directoryExists'] and not denied['stopped'], denied
results.append(denied)
raced = fixture('game-entry-created-before-rmdir-retained', 'game', r'''
rmdir() { printf unknown > "$base/cache/ls_augment_combo/.arrived"; command rmdir "$@"; }
''', game_entries='empty')
assert raced['exit'] == 0 and raced['directoryEntries'] == ['.arrived'] and not raced['stopped'] and not raced['stderr'], raced
results.append(raced)
for entries in ('empty', 'owned'):
    failed = fixture('game-' + entries + '-directory-parent-fsync-failure-explicit', 'game', r'''
fsync() {
 printf '%s\n' "$@" >> "$fixture/synced"
 [ -d "$base/cache/ls_augment_combo" ]
}
''', game_entries=entries)
    assert failed['exit'] == 73 and 'directory_removal_not_durable' in failed['stderr'], failed
    assert not failed['directoryExists'] and failed['stopped'] == (entries == 'owned') and failed['stdout'] == '', failed
    results.append(failed)
for name, setup, marker in (
    ('directory-symlink', r'''
mkdir "$fixture/sentinel"; printf intact > "$fixture/sentinel/keep"
command rmdir "$base/cache/ls_augment_combo"
ln -s "$fixture/sentinel" "$base/cache/ls_augment_combo" || exit 95
[ -L "$base/cache/ls_augment_combo" ] || exit 95
''', 'cache_type'),
    ('hidden-dangling-symlink', r'''
ln -s "$fixture/nonexistent" "$base/cache/ls_augment_combo/.unknown" || exit 95
[ -L "$base/cache/ls_augment_combo/.unknown" ] || exit 95
''', None),
):
    linked = fixture('game-empty-' + name + '-retained', 'game', setup, game_entries='empty')
    if linked['exit'] == 95 and os.name == 'nt':
        linked['status'] = 'skipped-native-symlink-unavailable'
    elif marker:
        assert linked['exit'] == 73 and marker in linked['stderr'] and linked['outsideSentinel'] == 'intact', linked
    else:
        assert linked['exit'] == 0 and linked['directoryEntries'] == ['.unknown'], linked
    assert not linked['stopped'] and not linked['rmdirAttempted'], linked
    results.append(linked)
if GAME_ONLY:
    assert not any(item.get('status', '').startswith('skipped') for item in results), results
    (PYTHON_OUTPUT / 'game-directory-linux-results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
    print(f'PASS real Linux game cache retirement: {len(results)} offline scenarios; no device commands')
    raise SystemExit(0)
rapid = fixture('rapid-private-lease-signal-only', 'rapid')
assert rapid['exit'] == 0 and rapid['stdout'].strip() == 'RAPID_CAPTURE_DRAINED:1:0' and not rapid['leaseExists'], rapid
results.append(rapid)
released = fixture('rapid-lock-released-by-its-controller', 'rapid', 'mkdir "$fixture/dev/.lsaugment_rapid_input_capture"; ( while [ -e "$bad_file" ]; do sleep 0.01; done; sleep 0.15; rmdir "$fixture/dev/.lsaugment_rapid_input_capture" ) &')
assert released['exit'] == 0 and released['stdout'].strip() == 'RAPID_CAPTURE_DRAINED:1:1' and not released['lockExists'], released
results.append(released)
busy = fixture('rapid-active-lock-never-removed', 'rapid', 'mkdir "$fixture/dev/.lsaugment_rapid_input_capture"')
assert busy['exit'] == 73 and 'session_still_running' in busy['stderr'] and busy['lockExists']
results.append(busy)
buffers = fixture('rapid-live-readonly-buffers-never-cleared', 'rapid', 'mkdir "$bad_file.read.XY1234"')
assert buffers['exit'] == 73 and 'session_still_running' in buffers['stderr']
results.append(buffers)
for name, setup, kwargs, marker in (
    ('rapid-lease-owner-refused', '', {'bad_owner': True}, 'lease_owner'),
    ('rapid-lease-hardlink-refused', 'ln "$bad_file" "$fixture/alias"', {}, 'lease_hardlink'),
    ('rapid-lease-removal-denied', '', {'remove_fail': True}, 'lease_signal'),
):
    record = fixture(name, 'rapid', setup, **kwargs)
    assert record['exit'] == 73 and marker in record['stderr'] and record['leaseExists'], record
    results.append(record)
for name, setup, kwargs, marker in (
    ('battery-unowned-overlay-refused', '', {'bad_owner': True}, 'overlay_ownership'),
    ('battery-hardlink-overlay-refused', 'ln "$bad_file" "$fixture/alias"', {}, 'overlay_hardlink'),
):
    record = fixture(name, 'battery', setup, **kwargs)
    assert record['exit'] == 74 and marker in record['stderr'], record
    results.append(record)
absent = fixture('battery-no-historical-overlay-valid', 'battery', 'command rm -f "$bad_file"')
assert absent['exit'] == 0, absent
results.append(absent)
for script in ('game', 'rapid', 'battery'):
    link = fixture(script + '-symlink-refused', script, 'command rm -f "$bad_file"; ln -s "$fixture/alias" "$bad_file" || exit 95; [ -L "$bad_file" ] || exit 95')
    assert link['exit'] in (73, 74, 95), link
    link['status'] = 'skipped-native-symlink-unavailable' if link['exit'] == 95 else 'pass'
    results.append(link)
(PYTHON_OUTPUT / 'shell-results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
skipped = sum(item.get('status', '').startswith('skipped') for item in results)
print(f'PASS real runtime reset shells: {len(results)-skipped} offline scenarios, {skipped} native symlink scenarios unavailable; no device commands')
