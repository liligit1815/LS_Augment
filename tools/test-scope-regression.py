"""Run the complete scope audit regression without installing an APK or restarting a device."""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--apk', type=Path, help='Also compare a freshly built APK to the source scope')
    args = parser.parse_args()
    env = os.environ.copy()
    if env.get('JAVA_HOME'):
        env['PATH'] = str(Path(env['JAVA_HOME']) / 'bin') + os.pathsep + env.get('PATH', '')

    def run(*command):
        subprocess.run(list(map(str, command)), cwd=ROOT, env=env, check=True)

    tests = ['TestHookTargetRegistry', 'TestHookAppCatalog', 'TestModuleHierarchy', 'TestScopeRestartPolicy']
    with tempfile.TemporaryDirectory(prefix='duo-scope-suite-') as directory:
        run('javac', '-encoding', 'UTF-8', '--release', '17', '-sourcepath', ROOT/'android/app/src/main/java',
            '-d', directory, *[ROOT/'tools'/f'{name}.java' for name in tests])
        for name in tests:
            extra = [ROOT/'android/app/src/main/resources/META-INF/xposed/scope.list'] if name == 'TestHookTargetRegistry' else []
            run('java', '-cp', directory, 'ls.augment.com.'+name, *extra)
    for script in ('test-package-ready-dispatch.py', 'test-modern-xposed-scope.py'):
        run(sys.executable, ROOT/'tools'/script)
    run(sys.executable, ROOT/'tools/check-modern-xposed.py', *([args.apk.resolve()] if args.apk else []))
    print('PASS complete scope regression', flush=True)


if __name__ == '__main__':
    main()
