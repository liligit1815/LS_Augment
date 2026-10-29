"""Exercise the actual release checker against isolated source/APK drift fixtures."""
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
META = 'android/app/src/main/resources/META-INF/xposed/'
REGISTRY = 'android/app/src/main/java/ls/augment/com/HookTargetRegistry.java'
FILES = ['tools/check-modern-xposed.py', 'android/version.properties', 'android/app/build.gradle',
         'android/app/src/main/AndroidManifest.xml', REGISTRY,
         'android/app/src/main/java/ls/augment/com/hook/AugmentModule.java',
         'android/app/src/main/java/ls/augment/com/RootEarlyModule.java']
FILES += [META + name for name in ('scope.list', 'java_init.list', 'native_init.list', 'module.prop')]
baseline = {name: (ROOT / name).read_text(encoding='utf-8') for name in FILES}
scopes = [line for line in baseline[META + 'scope.list'].splitlines() if line.strip()]


def main():
    cases = [
        ('matching', {}, {}, True, ''),
        ('reordered-and-comments', {}, {'scope.list': '# scope\n' + '\n'.join(reversed(scopes))}, True, ''),
        ('apk-missing-package', {}, {'scope.list': '\n'.join(scopes[1:])}, False, 'APK scope vs source'),
        ('apk-restores-QQ', {}, {'scope.list': '\n'.join(scopes + ['com.tencent.mobileqq'])}, False, 'extra='),
        ('apk-duplicate-package', {}, {'scope.list': '\n'.join(scopes + [scopes[0]])}, False, 'duplicate scope'),
        ('source-duplicate-package', {META + 'scope.list': '\n'.join(scopes + [scopes[0]])}, {}, False, 'source scope.list: duplicate'),
        ('registry-duplicate-package', {REGISTRY: baseline[REGISTRY].replace('"com.android.settings",', '"com.android.settings", "com.android.settings",')}, {}, False, 'HookTargetRegistry: duplicate'),
        ('source-registry-drift', {META + 'scope.list': '\n'.join(scopes[1:])}, {}, False, 'source scope vs Provider'),
        ('apk-missing-staticScope', {}, {'module.prop': 'minApiVersion=102\ntargetApiVersion=102\n'}, False, 'module.prop differs'),
        ('apk-disables-staticScope', {}, {'module.prop': baseline[META + 'module.prop'].replace('staticScope=true', 'staticScope=false')}, False, 'module.prop differs'),
        ('apk-empty-scope', {}, {'scope.list': '# empty\n'}, False, 'empty scope'),
        ('apk-invalid-scope', {}, {'scope.list': '\n'.join(scopes + ['com.bad;reboot'])}, False, 'invalid scope'),
    ]
    with tempfile.TemporaryDirectory(prefix='duo-scope-check-') as directory:
        fixture = Path(directory)
        for name, source_changes, apk_changes, success, reason in cases:
            for path, text in (baseline | source_changes).items():
                destination = fixture / path
                destination.parent.mkdir(parents=True, exist_ok=True)
                destination.write_text(text, encoding='utf-8')
            apk = fixture / 'fixture.apk'
            with zipfile.ZipFile(apk, 'w') as archive:
                for item in ('scope.list', 'java_init.list', 'native_init.list', 'module.prop'):
                    archive.writestr('META-INF/xposed/' + item, apk_changes.get(item, baseline[META + item]))
            result = subprocess.run([sys.executable, str(fixture / 'tools/check-modern-xposed.py'), str(apk)],
                                    capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=30)
            output = result.stdout + result.stderr
            assert (result.returncode == 0) == success, (name, output)
            assert success or reason in output, (name, output)
            print('PASS', name)
    print(f'Modern Xposed scope checker: {len(cases)} scenarios passed')


if __name__ == '__main__':
    main()
