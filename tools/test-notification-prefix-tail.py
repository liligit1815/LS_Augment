"""Offline regression/mutation runner. Copies inputs to a temporary tree; no device tools."""
from pathlib import Path
import argparse
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = 'android/app/src/main/java/ls/augment/com/'
HOOK = SOURCE + 'hook/NotificationStackHook.java'
POLICY = SOURCE + 'NotificationLayoutPolicy.java'
JAVA = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
INPUTS = [HOOK, POLICY, SOURCE + 'EnhancementOption.java', SOURCE + 'NotificationAppearanceOptions.java',
          SOURCE + 'hook/SystemUiAdapter.java', 'tools/test-notification-whole-stack-runtime.py',
          'tools/test-notification-media-card-runtime.py', 'tools/TestNotificationLayoutPolicy.java']
MUTATIONS = [
    ('old-suffix-reveal', POLICY, 'return new Row(bottom-height+revealOffset,scale,nativeAlpha*shown,\n                nativeClipTop,nativeClipBottom+revealOffset,d>=4f);',
     'return new Row(bottom-height,scale,nativeAlpha*shown,clip,nativeClipBottom,d>=4f);'),
    ('missing-row-offset', POLICY, 'bottom-height+revealOffset,scale', 'bottom-height,scale'),
    ('missing-bottom-offset', POLICY, 'nativeClipTop,nativeClipBottom+revealOffset,d>=4f)', 'nativeClipTop,nativeClipBottom,d>=4f)'),
    ('discard-native-bottom', HOOK, 'nativeClip,nativeBottom,((Number)access.alpha', 'nativeClip,0,((Number)access.alpha'),
    ('skip-real-bottom-write', HOOK, 'access.clipBottom.setInt(state,projected.clipBottom);', '/* lost actual ViewState bottom write */'),
    ('skip-bottom-restore', HOOK, 'access.clipBottom.setInt(clip.state,finalBottom);', '/* lost restore before native reset */'),
    ('overwrite-newer-bottom-state', HOOK, 'if(finalBottom==clip.appliedBottom)', 'if(true)'),
    ('skip-detach-live-restore', HOOK, 'access.setClipBottom.invoke(row,finalBottom);', 'access.getClipBottom.invoke(row);'),
    ('overwrite-newer-live-bottom', HOOK, 'detached&&((Number)access.getClipBottom.invoke(row)).intValue()==clip.appliedBottom', 'detached'),
    ('stale-live-restore-after-external-target', HOOK, 'access.setClipBottom.invoke(row,finalBottom);', 'access.setClipBottom.invoke(row,clip.nativeBottom);'),
    ('leave-owned-live-after-external-target', HOOK, 'if(detached&&((Number)access.getClipBottom.invoke(row))', 'if(detached&&finalBottom==clip.nativeBottom&&((Number)access.getClipBottom.invoke(row))'),
    ('ignore-native-clip-disabled', HOOK, '!access.clipEnabled.getBoolean(row)||', ''),
    ('ignore-row-clip-exemption', HOOK, '!Boolean.TRUE.equals(access.shouldClip.invoke(row))\n                    ||', ''),
    ('ignore-native-minimum-height', HOOK, 'Math.max(projected.clipTop,access.minimumClipHeight.getInt(row))', 'projected.clipTop'),
    ('write-before-full-pass-validation', HOOK, 'if(!projected.hidden&&(', 'access.sy.invoke(state,projected.y);\n            if(!projected.hidden&&('),
]


def run(command, cwd):
    result = subprocess.run(list(map(str, command)), cwd=cwd, encoding='utf-8', errors='replace',
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=45)
    return {'returncode': result.returncode, 'output': result.stdout}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mutations', action='store_true')
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    report = {'scope': 'offline Java facade and geometry; no Android device execution',
              'sourceHashes': {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in INPUTS}}
    with tempfile.TemporaryDirectory(prefix='duo-prefix-tail-') as folder:
        work = Path(folder)
        for p in INPUTS:
            target = work / p
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / p, target)
        runtime_command = [sys.executable, work / 'tools/test-notification-whole-stack-runtime.py']
        report['runtime'] = run(runtime_command, work)
        report['policyCompile'] = run([JAVA / 'javac.exe', '-encoding', 'UTF-8', '--release', '17',
                                      '-d', work / 'policy-classes', work / (SOURCE + 'EnhancementOption.java'),
                                      work / (SOURCE + 'NotificationAppearanceOptions.java'), work / POLICY,
                                      work / 'tools/TestNotificationLayoutPolicy.java'], work)
        report['policy'] = run([JAVA / 'java.exe', '-cp', work / 'policy-classes',
                               'ls.augment.com.TestNotificationLayoutPolicy'], work)
        if any(report[k]['returncode'] for k in ['runtime', 'policyCompile', 'policy']):
            raise RuntimeError(json.dumps(report, ensure_ascii=False, indent=2))
        print(report['runtime']['output'].strip(), flush=True)
        print(report['policy']['output'].strip(), flush=True)
        results = []
        if args.mutations:
            for name, relative, before, after in MUTATIONS:
                target = work / relative
                original = target.read_text(encoding='utf-8')
                if original.count(before) != 1:
                    raise AssertionError(f'{name}: expected one exact mutation site')
                try:
                    target.write_text(original.replace(before, after), encoding='utf-8')
                    result = run(runtime_command, work)
                    # Compile/import errors do not count as meaningful mutation rejection.
                    result.update(name=name, rejectedByAssertion=result['returncode'] != 0
                                  and 'java.lang.AssertionError:' in result['output']
                                  and 'error:' not in result['output'])
                    results.append(result)
                    print(f"{name}: {'rejected' if result['rejectedByAssertion'] else 'NOT REJECTED'}", flush=True)
                finally:
                    target.write_text(original, encoding='utf-8')
        report['mutations'] = results
        report['passed'] = all(x['rejectedByAssertion'] for x in results)
        if args.output:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
        if not report['passed']:
            raise AssertionError('At least one mutation survived or did not reach a real assertion')
        print(f"All {len(results)} mutations rejected by behavioral assertions; phone operations: 0")


if __name__ == '__main__':
    main()
