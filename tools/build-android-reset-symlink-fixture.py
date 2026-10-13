"""Build three isolated Android shell fixtures; never connect to or mutate a device here."""
from pathlib import Path
import hashlib
import json
import os
import re
import subprocess
import uuid

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / 'audit-output/module-runtime-reset-tests'
OUT.mkdir(parents=True, exist_ok=True)
JAVA = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
CP = os.pathsep.join(str(path) for path in (OUT / 'classes', ROOT / 'audit-output/android-sdk/platforms/android-36/android.jar',
                                          ROOT / 'android/app/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes'))
sources = {
    'game': (ROOT / 'android/app/src/main/assets/gamehelper_reset_cache.sh').read_text(encoding='utf-8'),
    'rapid': (ROOT / 'android/app/src/main/assets/rapid_reset_wait.sh').read_text(encoding='utf-8'),
    'battery': subprocess.check_output([str(JAVA / 'bin/java.exe'), '-cp', CP,
                                      'ls.augment.com.TestModuleWorkerDrain', '--battery-script'], text=True),
}
fixture = '/data/local/tmp/lsa-reset-symlink-fixture-' + str(uuid.uuid4())
assert re.fullmatch(r'/data/local/tmp/lsa-reset-symlink-fixture-[0-9a-f-]{36}', fixture)
manifest = {'fixtureRoot': fixture, 'execution': 'not executed by builder', 'recursiveDelete': False,
            'externalServices': 'cmd/am mocked; mount/umount/nsenter/setprop/getevent forbidden', 'sources': {}}

def translate(kind, source):
    case = fixture + '/' + kind
    body = re.sub(r'(?<![A-Za-z0-9_/])/data(?=/|[\s\'"]|$)', case + '/data', source)
    body = body.replace('/proc/[0-9]', case + '/proc/[0-9]')
    body = body.replace('/dev/.lsaugment_rapid_input_capture', case + '/dev/.lsaugment_rapid_input_capture')
    body = body.replace('/vendor_dlkm/lib/modules/aw9620x.ko', case + '/vendor_dlkm/lib/modules/aw9620x.ko')
    body = body.replace('/proc/sys/kernel/random/boot_id', case + '/proc/sys/kernel/random/boot_id')
    # These link-rejection fixtures do not create a driver or enter its lock
    # branch; keep even its diagnostic FD path scoped to the disposable tree.
    body = body.replace('/proc/$$/fd/9', case + '/proc/$$/fd/9')
    executable = '\n'.join(line for line in body.splitlines() if not line.lstrip().startswith('#'))
    paths = re.findall(r'/(?:data|dev|proc|vendor|system|sys|storage|sdcard|mnt)(?:/[^\s\'";|&<>)]*)?', executable)
    forbidden = [path for path in paths if path != '/dev/null' and not path.startswith(case + '/')]
    if forbidden:
        raise AssertionError('Unmapped production path: ' + repr(forbidden))
    manifest['sources'][kind] = {'sha256': hashlib.sha256(source.encode()).hexdigest(),
                                'mappedRoot': case, 'absolutePaths': sorted(set(paths)), 'unmappedPaths': []}
    return body

header = f'''#!/system/bin/sh
# Generated from production checks. All persistent file operations stay inside this fresh fixture root.
set -eu
fixture='{fixture}'
readonly fixture
fail_fixture() {{ printf 'FIXTURE_ERROR=%s\\n' "$1" >&2; exit 90; }}
[ "$(id -u)" = 0 ] || fail_fixture root_required
[ "$(readlink -f /data/local/tmp)" = /data/local/tmp ] || fail_fixture tmp_parent_alias
[ ! -e "$fixture" ] && [ ! -L "$fixture" ] || fail_fixture path_already_exists
umask 077
mkdir "$fixture" || fail_fixture fixture_create
[ "$(readlink -f "$fixture")" = "$fixture" ] && [ ! -L "$fixture" ] || fail_fixture scope
[ "$(stat -c %u "$fixture")" = 0 ] || fail_fixture fixture_owner
printf 'FIXTURE_ROOT=%s\\n' "$fixture"
# No deletion is needed by these preflight scenarios. Any deletion or hardware/service operation is a failure.
rm() {{ printf 'FIXTURE_ERROR=unexpected_delete\\n' >&2; return 97; }}
mount() {{ return 97; }}
umount() {{ return 97; }}
nsenter() {{ return 97; }}
setprop() {{ return 97; }}
getevent() {{ return 97; }}
fsync() {{ return 0; }}
cmd() {{
 [ "$*" = 'package list packages --user 0 -U cn.nubia.gamehelpmodule' ] || return 97
 printf 'package:cn.nubia.gamehelpmodule uid:%s\\n' "$expected_uid"
}}
am() {{
 [ "$*" = 'force-stop --user 0 cn.nubia.gamehelpmodule' ] || return 97
 printf yes > "$fixture/game/stopped"
}}
stat() {{
 if [ "$1" = -c ] && [ "$2" = %u ]; then
   case "$3" in "$fixture/game/"*|"$fixture/rapid/"*) printf '%s\\n' "$expected_uid"; return ;; esac
 fi
 command stat "$@"
}}
'''
blocks = [header]
for kind, uid, leaf, expected, marker in (
    ('game', 10044, '/data/user/0/cn.nubia.gamehelpmodule/cache/ls_augment_combo/motion-v3-' + 'a' * 64 + '.json', 73, 'GAMEHELPER_CACHE_ERROR=file_type'),
    ('rapid', 10077, '/data/user/0/ls.augment.com/cache/rapid-input-12345678-1234-1234-1234-123456789abc.lease', 73, 'RAPID_RESET_ERROR=lease_type'),
    ('battery', 0, '/data/adb/ls_augment/v2/battery/life.conf', 74, 'battery_restore:symlink_overlay'),
):
    scope = fixture + '/' + kind
    link = scope + leaf
    original = scope + '/original-must-survive'
    directories = [str(Path(link).parent).replace('\\', '/'), scope + '/proc/1', scope + '/dev']
    body = translate(kind, sources[kind])
    blocks.append(f'''
# {kind}: a real Android symlink targets a sentinel inside the same isolated case.
mkdir -p {' '.join("'" + folder + "'" for folder in directories)}
printf 'original-{kind}' > '{original}'
ln -s '{original}' '{link}' || fail_fixture symlink_unavailable
[ -L '{link}' ] || fail_fixture missing_symlink
printf 'Uid:\\t1\\t1\\t1\\t1\\n' > '{scope}/proc/1/status'
set +e
(
expected_uid={uid}
expected_user=0
base='{scope}/data/user/0/cn.nubia.gamehelpmodule'
{body}
) > '{scope}/result.txt' 2>&1
code=$?
set -e
[ "$code" = {expected} ] || {{ cat '{scope}/result.txt'; fail_fixture {kind}_exit; }}
grep -Fx '{marker}' '{scope}/result.txt' >/dev/null || {{ cat '{scope}/result.txt'; fail_fixture {kind}_guard; }}
[ -L '{link}' ] || fail_fixture {kind}_link_changed
[ "$(cat '{original}')" = 'original-{kind}' ] || fail_fixture {kind}_original_changed
printf 'PASS {kind} real Android symlink refused; sentinel preserved\\n'
''')
blocks.append("printf 'PASS isolated reset root-shell symlinks: 3/3; no real application/service/hardware change\\n'\n")
script = OUT / 'android-root-symlink-fixture.sh'
script.write_text('\n'.join(blocks), encoding='utf-8', newline='\n')
manifest['scriptSha256'] = hashlib.sha256(script.read_bytes()).hexdigest()
(OUT / 'android-root-symlink-fixture-manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf-8')
print(script)
print(fixture)
print('AUDIT PASS: mapped all production data/proc/dev-lock paths; no recursive deletion; service/hardware calls mocked or forbidden')
