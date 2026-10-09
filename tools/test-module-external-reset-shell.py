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
subprocess.run([str(JAVA_HOME / 'bin/javac.exe'), '-encoding', 'UTF-8', '-cp', str(ANDROID_JAR), '-d', str(OUT),
                str(SOURCE / 'RootShell.java'), str(SOURCE / 'ModuleExternalReset.java'), str(ROOT / 'tools/TestModuleExternalReset.java')], check=True)
unit = subprocess.run([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT) + os.pathsep + str(ANDROID_JAR),
                       'ls.augment.com.TestModuleExternalReset'], text=True, capture_output=True, check=True)
(OUT / 'engine-result.txt').write_text(unit.stdout, encoding='utf-8')
print(unit.stdout.strip())
SCRIPT = subprocess.check_output([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT) + os.pathsep + str(ANDROID_JAR),
                                  'ls.augment.com.TestModuleExternalReset', '--legacy-script'], text=True)

FAKE = r'''
settings() {
  if [ "$1:$2" = list:global ]; then cat "$fixture/global.txt"; return; fi
  [ "$1:$2" = delete:global ] || return 91
  [ "$fixture_fail_delete" != 1 ] || return 92
  awk -v key="$3" 'index($0,key "=")!=1{print}' "$fixture/global.txt" > "$fixture/global.tmp" || return
  mv "$fixture/global.tmp" "$fixture/global.txt"
}
'''

def run(name, setup='', fail_delete=False, globals_text='ls_augment_old=secret\nother_setting=keep\nls_augment_steps=private\n'):
    with tempfile.TemporaryDirectory(prefix='external-reset-', dir=OUT) as path:
        folder = Path(path)
        posix = '/e/' + folder.relative_to(Path('E:/')).as_posix()
        translated = SCRIPT.replace('/data', posix + '/data')
        commands = '\n'.join([
            f"fixture='{posix}'", f"fixture_fail_delete={'1' if fail_delete else '0'}", FAKE,
            'mkdir -p "$fixture/data/system/ls_augment"',
            'printf boot > "$fixture/data/system/ls_augment/boot-config-v1"',
            'printf pending > "$fixture/data/system/ls_augment/boot-config-v1.tmp"',
            'printf unrelated > "$fixture/data/system/ls_augment/untouched-file"', setup, translated,
        ])
        (folder / 'global.txt').write_text(globals_text, encoding='utf-8')
        environment = dict(os.environ, MSYS='winsymlinks:nativestrict')
        result = subprocess.run([str(BASH), '-c', commands], capture_output=True, text=True, env=environment)
        root = folder / 'data/system/ls_augment'
        record = {'case': name, 'exit': result.returncode, 'output': result.stdout,
                  'global': (folder / 'global.txt').read_text(encoding='utf-8'),
                  'bootExists': (root / 'boot-config-v1').exists(), 'unrelatedExists': (root / 'untouched-file').exists()}
        return record

results = []
success = run('only-module-keys-and-exact-files')
assert success['exit'] == 0 and success['global'] == 'other_setting=keep\n'
assert not success['bootExists'] and success['unrelatedExists']
assert success['output'].rstrip().endswith('LSA_EXTERNAL_LEGACY_END')
results.append(success)
support = run('legacy-package-support-keys', globals_text='ls_augment_rm_support_com.android.settings=old\nls_augment_rm_support_com.android.systemui=old\nother_setting=keep\n')
assert support['exit'] == 0 and support['global'] == 'other_setting=keep\n' and not support['bootExists']
results.append(support)
failure = run('settings-delete-denied', fail_delete=True)
assert failure['exit'] != 0 and failure['bootExists'] and 'ls_augment_old=' in failure['global']
results.append(failure)
invalid = run('malformed-namespace-key', globals_text='ls_augment_bad;touch_hacked=x\nother_setting=keep\n')
assert invalid['exit'] != 0 and invalid['bootExists'] and 'ls_augment_bad;' in invalid['global']
results.append(invalid)
link = run('boot-file-symlink-refused', 'rm "$fixture/data/system/ls_augment/boot-config-v1"; ln -s "$fixture/data/system/ls_augment/untouched-file" "$fixture/data/system/ls_augment/boot-config-v1" || exit 95; [ -L "$fixture/data/system/ls_augment/boot-config-v1" ] || exit 95')
assert link['exit'] in (76, 95) and link['unrelatedExists']
link['status'] = 'skipped-native-symlink-unavailable' if link['exit'] == 95 else 'pass'
results.append(link)
directory = run('parent-directory-symlink-refused', 'mv "$fixture/data/system/ls_augment" "$fixture/data/system/elsewhere"; ln -s "$fixture/data/system/elsewhere" "$fixture/data/system/ls_augment" || exit 95; [ -L "$fixture/data/system/ls_augment" ] || exit 95')
assert directory['exit'] in (74, 95)
directory['status'] = 'skipped-native-symlink-unavailable' if directory['exit'] == 95 else 'pass'
results.append(directory)
(OUT / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
skipped = sum(record.get('status', '').startswith('skipped') for record in results)
print(f'PASS actual external-reset shell: {len(results) - skipped} offline scenarios, {skipped} native symlink scenarios unavailable; no device commands')
