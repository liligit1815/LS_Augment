"""Check the exact Recents-radius reflection contracts in captured launcher APKs."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location('launcher_contracts', ROOT / 'check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DEX)
PARAMS = 'Lcom/android/quickstep/FullscreenDrawParams;'
TASK = 'Lcom/android/quickstep/views/TaskView;'
RECENTS = 'Lcom/android/quickstep/views/RecentsView;'
SIMULATOR = 'Lcom/android/quickstep/util/TaskViewSimulator;'
CONTRACTS = [
    (PARAMS, 'methods', 'setProgress(FFF)V'),
    (PARAMS, 'fields', 'currentCornerRadius:F'),
    (TASK, 'methods', f'updateFullscreenParams({PARAMS})V'),
    (TASK, 'methods', 'updateFullscreenParams()V'),
    (TASK, 'methods', 'getTaskContainers()Ljava/util/List;'),
    (TASK, 'methods', f'getRecentsView(){RECENTS}'),
    ('Lcom/android/quickstep/views/TaskContainer;', 'methods', 'getSnapshotView()Landroid/view/View;'),
    ('Lcom/android/quickstep/task/thumbnail/TaskThumbnailView;', 'methods', 'getOutlineBounds()Landroid/graphics/Rect;'),
    (RECENTS, 'methods', 'redrawLiveTile()V'),
    (RECENTS, 'methods', 'getCurRotation()I'),
    (RECENTS, 'fields', 'mOverviewStateEnabled:Z'),
    (SIMULATOR, 'methods', 'apply(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;Z)V'),
    (SIMULATOR, 'fields', f'mCurrentFullscreenParams:{PARAMS}'),
    (SIMULATOR, 'fields', 'mContext:Landroid/content/Context;'),
    (SIMULATOR, 'fields', 'mTaskRect:Landroid/graphics/Rect;'),
]


def check(path):
    classes, _ = DEX.read_apk(path)
    with zipfile.ZipFile(path) as apk:
        identity = DEX.manifest_identity(apk.read('AndroidManifest.xml'))
    rows = []
    for owner, kind, signature in CONTRACTS:
        found = DEX.find_member(classes, owner, kind, signature)
        rows.append({'class': owner, 'kind': kind, 'member': signature,
                     'pass': found is not None and found[0] == owner and not found[1] & (8 | 1024)})
    return {'apk': str(path.resolve()), 'identity': identity,
            'sha256': hashlib.sha256(path.read_bytes()).hexdigest(), 'checks': rows,
            'pass': all(row['pass'] for row in rows)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apks', nargs='+', type=Path)
    parser.add_argument('--json', type=Path)
    args = parser.parse_args()
    results = [check(path) for path in args.apks]
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for result in results:
        print(('PASS' if result['pass'] else 'FAIL') + ': ' + str(result['identity']) +
              ' - ' + str(len(result['checks'])) + ' exact declared instance contracts')
        for row in result['checks']:
            if not row['pass']:
                print(row)
    print('Static APK interfaces only; visual behavior requires phone validation.')
    return 0 if all(result['pass'] for result in results) else 1


if __name__ == '__main__':
    raise SystemExit(main())
