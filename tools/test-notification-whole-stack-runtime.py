"""Execute the production logical section/app-stack hook against a native algorithm facade.

The firmware header/card renderer is substituted. List filtering, original row
ownership, metadata, native geometry passes, hidden targets and clear-backend
behavior run through the real registered hook. Physical input/animation need QA.
The historical filename is retained for existing test entry points.
"""
from pathlib import Path
import argparse
import ast
import hashlib
import json
import subprocess
import sys
import tempfile
from notification_stack_runtime_facade import FILES as STACK_FILES

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'

tree = ast.parse((ROOT / 'tools/test-notification-media-card-runtime.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(node.value) for node in tree.body if isinstance(node, ast.Assign)
            and any(isinstance(name, ast.Name) and name.id == 'FILES' for name in node.targets))
files = {name: base[name] for name in ['android/os/Looper.java', 'android/os/Handler.java',
    'io/github/libxposed/api/XposedInterface.java', 'ls/augment/com/hook/AugmentModule.java']}
files.update(STACK_FILES)
files['ls/augment/com/hook/TestNotificationWholeStack.java'] = (ROOT / 'tools/tests/NotificationGroupedStackRuntimeTest.java').read_text(encoding='utf-8')

java = Path(r'C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--hook-source', type=Path)
parser.add_argument('--policy-source', type=Path)
parser.add_argument('--output', type=Path)
args = parser.parse_args()
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
source_names = ['EnhancementOption.java', 'NotificationAppearanceOptions.java',
                'NotificationLayoutPolicy.java', 'NotificationStackPolicy.java',
                'hook/SystemUiAdapter.java', 'hook/NotificationStackHook.java']
overrides = {'NotificationStackPolicy.java': args.policy_source,
             'hook/NotificationStackHook.java': args.hook_source}
report = {'scope': 'offline registered production Hook against substituted native facade; no ADB or Android rendering',
          'sourceHashes': {name: hashlib.sha256((overrides.get(name) or SRC / name).read_bytes()).hexdigest()
                           for name in source_names},
          'testHash': hashlib.sha256((ROOT / 'tools/tests/NotificationGroupedStackRuntimeTest.java').read_bytes()).hexdigest(),
          'facadeHash': hashlib.sha256((ROOT / 'tools/notification_stack_runtime_facade.py').read_bytes()).hexdigest()}
with tempfile.TemporaryDirectory(prefix='lsa-notification-groups-') as folder:
    work = Path(folder)
    paths = []
    for name, code in files.items():
        path = work / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, encoding='utf-8')
        paths.append(path)
    for name in source_names:
        override = overrides.get(name)
        if override is None:
            paths.append(SRC / name)
        else:
            target = work / 'ls/augment/com' / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(override.read_bytes())
            paths.append(target)
    compile_result = subprocess.run([str(java / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-d', folder,
                                    *map(str, paths)], stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                   encoding='utf-8', errors='replace', timeout=45)
    report['compile'] = {'returncode': compile_result.returncode, 'output': compile_result.stdout}
    print(compile_result.stdout, end='', flush=True)
    if compile_result.returncode == 0:
        runtime = subprocess.run([str(java / 'java.exe'), '-cp', folder, 'ls.augment.com.hook.TestNotificationWholeStack'],
                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT, encoding='utf-8',
                                 errors='replace', timeout=25)
        report['runtime'] = {'returncode': runtime.returncode, 'output': runtime.stdout}
        print(runtime.stdout, end='', flush=True)
        report['passed'] = runtime.returncode == 0
        code = runtime.returncode
    else:
        report['passed'] = False
        code = compile_result.returncode
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    sys.exit(code)
