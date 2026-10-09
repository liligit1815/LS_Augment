"""Exercise the real retired-file cleanup shell inside disposable, offline fixtures."""
from pathlib import Path
import json
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JAVA_HOME = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
BASH = Path(r'C:/Program Files/Git/bin/bash.exe')
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com'
OUT = ROOT / 'audit-output/module-retired-root-tests'
OUT.mkdir(parents=True, exist_ok=True)
subprocess.run([str(JAVA_HOME / 'bin/javac.exe'), '-encoding', 'UTF-8', '-d', str(OUT),
                str(SOURCE / 'RootShell.java'), str(SOURCE / 'ModuleRetiredRootStorage.java'),
                str(ROOT / 'tools/TestModuleRetiredRootStorage.java')], check=True)
unit = subprocess.check_output([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT), 'ls.augment.com.TestModuleRetiredRootStorage'], text=True)
print(unit.strip())
SCRIPT = subprocess.check_output([str(JAVA_HOME / 'bin/java.exe'), '-cp', str(OUT),
                                  'ls.augment.com.TestModuleRetiredRootStorage', '--script'], text=True)
FAKE = r'''
id() { [ "$1" = -u ] && printf '0\n'; }
fsync() { [ "$fixture_sync_failure" != 1 ]; }
stat() {
  if [ "$1" = -c ] && [ "$2" = '%u:%g:%a' ]; then
    if [ "$3" = "$fixture/data/adb/ls_augment/v2/battery/life.conf" ]; then
      if [ "$fixture_bad_owner" = 1 ]; then printf '10000:10000:600\n'; else printf '0:0:600\n'; fi
    else printf '0:0:700\n'; fi
    return
  fi
  if [ "$fixture_mounted" = 1 ] && [ "$1" = -c ] && [ "$2" = '%d:%i' ] && [ "$3" = "$fixture/vendor/etc/.tp/zte_battery_life.conf" ]; then
    command stat -c '%d:%i' "$fixture/data/adb/ls_augment/v2/battery/life.conf"
    return
  fi
  command stat "$@"
}
'''

def run(name, setup='', mounted=False, bad_owner=False, sync_failure=False):
    with tempfile.TemporaryDirectory(prefix='retired-root-', dir=OUT) as path:
        folder = Path(path)
        posix = '/e/' + folder.relative_to(Path('E:/')).as_posix()
        translated = SCRIPT.replace('/data', posix + '/data').replace('/vendor', posix + '/vendor')
        commands = '\n'.join([
            f"fixture='{posix}'", f'fixture_mounted={int(mounted)}', f'fixture_bad_owner={int(bad_owner)}',
            f'fixture_sync_failure={int(sync_failure)}', FAKE,
            'mkdir -p "$fixture/data/adb/ls_augment/v2/battery" "$fixture/vendor/etc/.tp"',
            'printf baseline > "$fixture/vendor/etc/.tp/zte_battery_life.conf"',
            'printf overlay > "$fixture/data/adb/ls_augment/v2/battery/life.conf"',
            'printf unrelated > "$fixture/data/adb/ls_augment/v2/runtime.properties"',
            'printf unknown > "$fixture/data/adb/ls_augment/v2/battery/do-not-delete.conf"', setup, translated,
        ])
        result = subprocess.run([str(BASH), '-c', commands], capture_output=True, text=True,
                                env=dict(os.environ, MSYS='winsymlinks:nativestrict'))
        directory = folder / 'data/adb/ls_augment/v2'
        return {'case': name, 'exit': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr,
                'overlayExists': (directory / 'battery/life.conf').exists(),
                'vendorContents': (folder / 'vendor/etc/.tp/zte_battery_life.conf').read_text(),
                'runtimeContents': (directory / 'runtime.properties').read_text(),
                'unknownContents': (directory / 'battery/do-not-delete.conf').read_text()}

results = []
normal = run('restored-overlay-exact-removal')
assert normal['exit'] == 0 and normal['stdout'].strip() == 'LSA_RETIRED_BATTERY_CLEARED:1'
assert not normal['overlayExists'] and normal['vendorContents'] == 'baseline'
assert normal['runtimeContents'] == 'unrelated' and normal['unknownContents'] == 'unknown'
results.append(normal)
absent = run('already-cleared-overlay', 'rm -f "$fixture/data/adb/ls_augment/v2/battery/life.conf"')
assert absent['exit'] == 0 and absent['stdout'].strip() == 'LSA_RETIRED_BATTERY_CLEARED:0'
results.append(absent)
mounted = run('still-mounted-overlay-retained', mounted=True)
assert mounted['exit'] == 74 and 'overlay_still_mounted' in mounted['stderr'] and mounted['overlayExists']
results.append(mounted)
owner = run('different-file-owner-retained', bad_owner=True)
assert owner['exit'] == 74 and 'file_ownership' in owner['stderr'] and owner['overlayExists']
results.append(owner)
hardlink = run('hardlink-alias-retained', 'ln "$fixture/data/adb/ls_augment/v2/battery/life.conf" "$fixture/data/adb/ls_augment/v2/battery/hardlink"')
assert hardlink['exit'] == 74 and 'hardlinked_file' in hardlink['stderr'] and hardlink['overlayExists']
results.append(hardlink)
oversized = run('oversized-unrecognized-file-retained', 'dd if=/dev/zero of="$fixture/data/adb/ls_augment/v2/battery/life.conf" bs=65537 count=1 2>/dev/null')
assert oversized['exit'] == 74 and 'oversized_file' in oversized['stderr'] and oversized['overlayExists']
results.append(oversized)
sync = run('durability-failure-reported', sync_failure=True)
assert sync['exit'] == 74 and 'removal_not_durable' in sync['stderr']
results.append(sync)
link = run('symlink-overlay-refused', 'rm "$fixture/data/adb/ls_augment/v2/battery/life.conf"; ln -s "$fixture/data/adb/ls_augment/v2/battery/do-not-delete.conf" "$fixture/data/adb/ls_augment/v2/battery/life.conf" || exit 95; [ -L "$fixture/data/adb/ls_augment/v2/battery/life.conf" ] || exit 95')
assert link['exit'] == 95 or link['exit'] == 74 and 'symlink_file' in link['stderr']
link['status'] = 'skipped-native-symlink-unavailable' if link['exit'] == 95 else 'pass'
results.append(link)
(OUT / 'results.json').write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding='utf-8')
skipped = sum(record.get('status', '').startswith('skipped') for record in results)
print(f'PASS actual retired-root shell: {len(results) - skipped} offline scenarios, {skipped} native symlink scenario unavailable; no device commands')
