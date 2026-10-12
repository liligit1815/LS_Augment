"""Compatibility entry point for grouped-stack regressions and behavioral mutations.

The former screen-overflow prefix-tail model is retired. This runner now validates
the production logical grouping policy. It copies sources to a temporary tree and
never connects to a phone; runtime facade/physical rendering are separate checks.
"""
from pathlib import Path
import argparse
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

ROOT = Path(__file__).resolve().parents[1]
SOURCE = 'android/app/src/main/java/ls/augment/com/'
POLICY = SOURCE + 'NotificationStackPolicy.java'
INPUTS = [POLICY, 'tools/TestNotificationStackPolicy.java', 'tools/TestNotificationLayoutPolicy.java',
          'tools/TestConfigSnapshot.java', 'tools/test-notification-grouping-policy.py']
MUTATIONS = [
    ('silent-replaces-alert-front', 'newest(alert.isEmpty()?silent:alert)', 'newest(items)'),
    ('oldest-instead-of-latest', 'item.postTime>winner.postTime', 'item.postTime<winner.postTime'),
    ('never-fold-big', 'if(!open) {', 'if(false) {'),
    ('native-no-mode-recategorizes', 'if(!big&&!small) {', 'if(false) {'),
    ('small-only-creates-merged-stack', 'if(big&&!items.isEmpty()) {', 'if((big||small)&&!items.isEmpty()) {'),
    ('static-category-folded', 'new Node<>(null,key,label,true,items.size())', 'new Node<>(null,key,label,false,items.size())'),
    ('merge-different-apps', 'apps.computeIfAbsent(item.appUserKey,', 'apps.computeIfAbsent("all-apps",'),
    ('remove-section-from-app-key', 'String appKey=key+":app:"+app.getKey();', 'String appKey="app:"+app.getKey();'),
    ('small-always-expanded', 'if(appOpen)for(Item<T> item:members)', 'if(true)for(Item<T> item:members)'),
    ('lose-silent-section-label', 'new Node<>(null,key,label,true,items.size())', 'new Node<>(null,key,"",true,items.size())'),
    ('lose-folded-notifications', 'result.hiddenKeys.add(item.key);', '; /* notification identity lost */'),
    ('single-app-becomes-module-stack', 'if(members.size()==1) {', 'if(members.size()==0) {'),
    ('small-off-still-groups-apps', 'if(!small) {', 'if(false) {'),
    ('small-enabled-remains-flat', 'if(!small) {', 'if(true) {'),
]


def run(command, cwd):
    value = subprocess.run(list(map(str, command)), cwd=cwd, encoding='utf-8', errors='replace',
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=45)
    return {'returncode': value.returncode, 'output': value.stdout}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mutations', action='store_true')
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    report = {'scope': 'offline production grouping, geometry primitive and signed config; no Android rendering or phone execution',
              'sourceHashes': {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in INPUTS}}
    with tempfile.TemporaryDirectory(prefix='duo-grouped-stack-') as folder:
        work = Path(folder)
        shutil.copytree(ROOT / 'android/app/src/main/java', work / 'android/app/src/main/java')
        for relative in INPUTS:
            if relative.startswith('android/'):
                continue
            target = work / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / relative, target)
        command = [sys.executable, work / 'tools/test-notification-grouping-policy.py']
        report['baseline'] = run(command, work)
        if report['baseline']['returncode']:
            raise RuntimeError(json.dumps(report, ensure_ascii=False, indent=2))
        print(report['baseline']['output'].strip(), flush=True)
        results = []
        if args.mutations:
            target = work / POLICY
            original = target.read_text(encoding='utf-8')
            for name, before, after in MUTATIONS:
                matches = original.count(before)
                if matches != (2 if name == 'lose-folded-notifications' else 1):
                    raise AssertionError(f'{name}: mutation contract changed ({matches} sites)')
                try:
                    target.write_text(original.replace(before, after), encoding='utf-8')
                    value = run(command, work)
                    value.update(name=name, rejectedByAssertion=value['returncode'] != 0
                                 and 'java.lang.AssertionError:' in value['output']
                                 and 'error:' not in value['output'])
                    results.append(value)
                    print(f"{name}: {'rejected' if value['rejectedByAssertion'] else 'NOT REJECTED'}", flush=True)
                finally:
                    target.write_text(original, encoding='utf-8')
        report['mutations'] = results
        report['passed'] = all(value['rejectedByAssertion'] for value in results)
        if args.output:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
        if not report['passed']:
            raise AssertionError('A behavior mutation survived or failed before reaching an assertion')
        print(f"All {len(results)} grouped behavior mutations rejected; phone operations: 0")


if __name__ == '__main__':
    main()
