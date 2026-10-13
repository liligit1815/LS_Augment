"""Run the production fixed-path cleanup script against a disposable offline settings/files model."""
from pathlib import Path
import json
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JAVA_HOME = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
ANDROID_JAR = ROOT / 'audit-output/android-sdk/platforms/android-36/android.jar'
BASH = Path(r'C:/Program Files/Git/bin/bash.exe')
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com'
OUT = ROOT / 'audit-output/module-external-reset-shell-tests'
OUT.mkdir(parents=True, exist_ok=True)
# This suite executes the real reset engine and cleanup shell; native journal
# migration/ACK/await behavior is exercised by test-gfrc-recovery-store.py.
JOURNAL_STUB = OUT / 'GfrcRecoveryStore.java'
JOURNAL_STUB.write_text('package ls.augment.com; final class GfrcRecoveryStore { '
                        'static boolean awaitRestored(android.content.Context c){return true;} }', encoding='utf-8')
subprocess.run([str(JAVA_HOME / 'bin/javac.exe'), '-encoding', 'UTF-8', '-cp', str(ANDROID_JAR), '-d', str(OUT),
                str(SOURCE / 'RootShell.java'), str(SOURCE / 'RetiredBootCache.java'), str(SOURCE / 'ModuleExternalReset.java'), str(JOURNAL_STUB), str(ROOT / 'tools/TestModuleExternalReset.java')], check=True)
unit = subprocess.run([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT) + os.pathsep + str(ANDROID_JAR),
                       'ls.augment.com.TestModuleExternalReset'], text=True, capture_output=True, check=True)
(OUT / 'engine-result.txt').write_text(unit.stdout, encoding='utf-8')
print(unit.stdout.strip())
SCRIPT = subprocess.check_output([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT) + os.pathsep + str(ANDROID_JAR),
                                  'ls.augment.com.TestModuleExternalReset', '--legacy-script'], text=True)

FAKE = r'''
# Android ownership and directory fsync cannot be represented by NTFS. All path
# traversal, type, size, hardlink counts, timestamps and deletion remain real.
stat() {
  if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then
    if { [ "$bad_parent_owner" = 1 ] && [ -d "$3" ]; } ||
       { [ "$bad_file_owner" = 1 ] && [ "${3##*/}" = boot-config-v1 ]; } ||
       { [ "$bad_pending_owner" = 1 ] && [ "${3##*/}" = boot-config-v1.tmp ]; }; then echo 123:123:777
    elif [ -d "$3" ]; then echo 0:1000:750; else echo 0:1000:640; fi
    return
  fi
  if [ "$changed_stamp" = 1 ] && [ "$2" = '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' ] && [ "${3##*/}" = boot-config-v1 ]; then
    if [ -f "$fixture/stamp-seen" ]; then echo changed; return; fi
    : > "$fixture/stamp-seen"
  fi
  command stat "$@"
}
fsync() { printf '%s\n' "$1" >> "$fixture/fsync.log"; [ "$sync_fail" != 1 ]; }
rm() {
  if [ "$file_delete_fail" = 1 ] && [ "${2##*/}" = boot-config-v1 ]; then return 94;fi
  command rm "$@"
}
settings() {
  if [ "$1:$2" = get:global ]; then
    awk -v key="$3" 'index($0,key "=")==1{print substr($0,length(key)+2); found=1} END{if(!found)print "null"}' "$fixture/global.txt"
    return
  fi
  if [ "$1:$2" = list:global ]; then cat "$fixture/global.txt"; return; fi
  [ "$1:$2" = delete:global ] || return 91
  [ "$fixture_fail_delete" != 1 ] || return 92
  awk -v key="$3" 'index($0,key "=")!=1{print}' "$fixture/global.txt" > "$fixture/global.tmp" || return
  mv "$fixture/global.tmp" "$fixture/global.txt"
}
'''

def run(name, setup='', fail_delete=False, globals_text='ls_augment_old=secret\nother_setting=keep\nls_augment_steps=private\n', **flags):
    with tempfile.TemporaryDirectory(prefix='external-reset-', dir=OUT) as path:
        folder = Path(path)
        posix = '/e/' + folder.relative_to(Path('E:/')).as_posix()
        translated = SCRIPT.replace('/data', posix + '/data')
        commands = '\n'.join([
            'set -e', f"fixture='{posix}'", f"fixture_fail_delete={'1' if fail_delete else '0'}",
            '\n'.join(f'{key}={int(bool(value))}' for key,value in flags.items()), FAKE,
            'mkdir -p "$fixture/data/system/ls_augment"',
            'printf boot > "$fixture/data/system/ls_augment/boot-config-v1"',
            'printf pending > "$fixture/data/system/ls_augment/boot-config-v1.tmp"',
            'printf unrelated > "$fixture/data/system/ls_augment/untouched-file"', setup, translated,
        ])
        (folder / 'global.txt').write_text(globals_text, encoding='utf-8')
        # MSYS emulates Unix symlinks when Windows native symlink rights are absent.
        environment = dict(os.environ, MSYS='winsymlinks')
        result = subprocess.run([str(BASH), '-c', commands], capture_output=True, text=True, env=environment, timeout=60)
        root = folder / 'data/system/ls_augment'
        record = {'case': name, 'exit': result.returncode, 'output': result.stdout, 'error': result.stderr,
                  'global': (folder / 'global.txt').read_text(encoding='utf-8'),
                  'bootExists': (root / 'boot-config-v1').exists(), 'pendingExists': (root / 'boot-config-v1.tmp').exists(),
                  'unrelatedExists': (root / 'untouched-file').exists(),
                  'fsync': (folder / 'fsync.log').read_text(encoding='utf-8') if (folder / 'fsync.log').exists() else ''}
        return record

results = []
success = run('only-module-keys-and-exact-files')
assert success['exit'] == 0 and success['global'] == 'other_setting=keep\n'
assert not success['bootExists'] and success['unrelatedExists']
assert success['output'].rstrip().endswith('LSA_EXTERNAL_LEGACY_END')
assert success['output'].count('LSA_RESET_REMOVED:') == 4
assert len(success['fsync'].splitlines()) == 2
results.append(success)
support = run('legacy-package-support-keys', globals_text='ls_augment_rm_support_com.android.settings=old\nls_augment_rm_support_com.android.systemui=old\nother_setting=keep\n')
assert support['exit'] == 0 and support['global'] == 'other_setting=keep\n' and not support['bootExists']
results.append(support)
failure = run('settings-delete-denied', fail_delete=True)
assert failure['exit'] != 0 and failure['bootExists'] and 'ls_augment_old=' in failure['global']
results.append(failure)
pending = run('native-gfrc-recovery-blocks-cleanup', globals_text='ls_augment_old=secret\nredmagic_duo_native_gfrc_recovery_v1=pending\nother_setting=keep\n')
assert pending['exit'] == 82 and pending['bootExists']
assert 'redmagic_duo_native_gfrc_recovery_v1=pending' in pending['global']
assert 'ls_augment_old=secret' in pending['global']
assert 'LSA_NATIVE_GFRC_RECOVERY_PENDING' in pending['output']
results.append(pending)
invalid = run('malformed-namespace-key', globals_text='ls_augment_bad;touch_hacked=x\nother_setting=keep\n')
assert invalid['exit'] != 0 and invalid['bootExists'] and 'ls_augment_bad;' in invalid['global']
results.append(invalid)
link = run('boot-file-symlink-refused', 'rm "$fixture/data/system/ls_augment/boot-config-v1"; ln -s "$fixture/data/system/ls_augment/untouched-file" "$fixture/data/system/ls_augment/boot-config-v1" || exit 95; [ -L "$fixture/data/system/ls_augment/boot-config-v1" ] || exit 95')
assert link['exit'] in (74, 95) and link['unrelatedExists']
link['status'] = 'skipped-symlink-model-unavailable' if link['exit'] == 95 else 'pass'
results.append(link)
directory = run('parent-directory-symlink-refused', 'mv "$fixture/data/system/ls_augment" "$fixture/data/system/elsewhere"; ln -s "$fixture/data/system/elsewhere" "$fixture/data/system/ls_augment" || exit 95; [ -L "$fixture/data/system/ls_augment" ] || exit 95')
assert directory['exit'] in (74, 95)
directory['status'] = 'skipped-symlink-model-unavailable' if directory['exit'] == 95 else 'pass'
results.append(directory)
for flag in ('bad_parent_owner', 'bad_file_owner', 'bad_pending_owner', 'changed_stamp'):
    rejected = run(flag, **{flag: True})
    assert rejected['exit'] == 74 and rejected['bootExists'] and rejected['pendingExists'], rejected
    assert rejected['unrelatedExists'] and 'LSA_EXTERNAL_LEGACY_END' not in rejected['output'], rejected
    results.append(rejected)
for name,setup in (
    ('boot-hardlink-refused', 'ln "$fixture/data/system/ls_augment/boot-config-v1" "$fixture/data/system/ls_augment/extra-link"'),
    ('boot-oversize-refused', 'head -c 262145 /dev/zero > "$fixture/data/system/ls_augment/boot-config-v1"'),
    ('boot-directory-refused', 'rm "$fixture/data/system/ls_augment/boot-config-v1"; mkdir "$fixture/data/system/ls_augment/boot-config-v1"'),
):
    rejected = run(name, setup)
    assert rejected['exit'] == 74 and rejected['bootExists'] and rejected['pendingExists'], rejected
    assert rejected['unrelatedExists'] and 'LSA_EXTERNAL_LEGACY_END' not in rejected['output'], rejected
    results.append(rejected)
delete_failure = run('file-delete-failure', file_delete_fail=True)
assert delete_failure['exit'] != 0 and delete_failure['bootExists'] and delete_failure['pendingExists'], delete_failure
assert 'LSA_EXTERNAL_LEGACY_END' not in delete_failure['output'] and delete_failure['unrelatedExists']
results.append(delete_failure)
sync_failure = run('directory-durability-failure', sync_fail=True)
assert sync_failure['exit'] != 0 and 'LSA_EXTERNAL_LEGACY_END' not in sync_failure['output'], sync_failure
assert sync_failure['unrelatedExists']
results.append(sync_failure)
missing = run('boot-cache-already-absent', 'rm "$fixture/data/system/ls_augment/boot-config-v1" "$fixture/data/system/ls_augment/boot-config-v1.tmp"')
assert missing['exit'] == 0 and missing['output'].count('LSA_RESET_REMOVED:') == 2 and missing['unrelatedExists'], missing
results.append(missing)
(OUT / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
skipped = sum(record.get('status', '').startswith('skipped') for record in results)
print(f'PASS actual external-reset shell: {len(results) - skipped} offline scenarios, {skipped} symlink model scenarios unavailable; MSYS symlinks, no device commands')
