"""Verify both production page adapters against supplied real launcher APKs.

Usage: python tools/check-launcher-pages-contracts.py APK [APK ...] --json RESULT
This verifies DEX contracts and inheritance only, not Android UI behavior.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('launcher_dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)

TYPE_MAP = {
    'Lcom/android/launcher3/C2;': 'Lcom/android/launcher3/Launcher;',
    'Lcom/android/launcher3/util/x0;': 'Lcom/android/launcher3/util/IntArray;',
    'Lcom/android/launcher3/util/z0;': 'Lcom/android/launcher3/util/IntSet;',
    'Lcom/android/launcher3/V4;': 'Lcom/android/launcher3/PagedView;',
    'Lcom/android/launcher3/P2;': 'Lcom/android/launcher3/LauncherAppState;',
    'Lcom/android/launcher3/D3;': 'Lcom/android/launcher3/LauncherModel;',
    'Lz1/k2;': 'Lcom/android/launcher3/model/ModelDbController;',
    'Lx1/Z;': 'Lcom/android/launcher3/mfvUtil/ScreenUtil;',
    'Lcom/android/launcher3/J3;': 'Lcom/android/launcher3/LauncherPrefs;',
    'Lcom/android/launcher3/B4;': 'Lcom/android/launcher3/ModelCallbacks;',
    'Lcom/android/launcher3/N5;': 'Lcom/android/launcher3/Utilities;',
    'Lcom/android/launcher3/util/m0;': 'Lcom/android/launcher3/util/Executors;',
    'Lcom/android/launcher3/util/p1;': 'Lcom/android/launcher3/util/LooperExecutor;',
    'Lcom/android/launcher3/util/A0;': 'Lcom/android/launcher3/util/IntSparseArrayMap;',
    'Lcom/android/launcher3/K5;': 'Lcom/android/launcher3/ShortcutAndWidgetContainer;',
    'Lcom/android/launcher3/views/k;': 'Lcom/android/launcher3/views/ActivityContext;',
    'Lcom/android/launcher3/V3;': 'Lcom/android/launcher3/LauncherState;',
    'Lcom/android/launcher3/statemanager/d;': 'Lcom/android/launcher3/statemanager/StateManager;',
    'Lcom/android/launcher3/statemanager/a;': 'Lcom/android/launcher3/statemanager/BaseState;',
}
MEMBER_MAP = {
    'Lcom/android/launcher3/Workspace;': {'i3': 'stripEmptyScreens', 'Q0': 'convertFinalScreenToEmptyScreenIfNecessary',
        'G2': 'removeExtraEmptyScreenDelayed', 'v1': 'insertNewWorkspaceScreen',
        ('n', 'methods'): 'getScreenWithId', ('n', 'fields'): 'mWorkspaceScreens', 'x': 'mLauncher'},
    'Lcom/android/launcher3/C2;': {('h', 'methods'): 'finishBindingItems', ('h', 'fields'): 'mModelCallbacks',
        'f': 'bindScreens', 'B2': 'getWorkspace', 'w2': 'getScreenUtil'},
    'Lcom/android/launcher3/util/x0;': {'m': 'add', 'A': 'toArray', 'q': 'clone'},
    'Lcom/android/launcher3/menu/MenuContainer;': {'G': 'setupHomeMenu', 'm': 'mHomeMenuLinearLayout', 'g': 'mActivity'},
    'Lcom/android/launcher3/B4;': {'j': 'isFirstPagePinnedItemEnabled'},
    'Lcom/android/launcher3/N5;': {'j': 'SHOULD_SHOW_FIRST_PAGE_WIDGET'},
    'Lcom/android/launcher3/P2;': {'h': 'getInstance', 'j': 'getModel'},
    'Lcom/android/launcher3/D3;': {'m0': 'getModelDbController'},
    'Lz1/k2;': {'F': 'getNewScreenId'},
    'Lcom/android/launcher3/util/m0;': {'h': 'MODEL_EXECUTOR'},
    'Lx1/Z;': {'b': 'bindDefaultPage'},
    'Lcom/android/launcher3/J3;': {'m': 'getPrefs'},
    'Lcom/android/launcher3/statemanager/d;': {'C': 'getState'},
}


def contracts(named):
    for owner, kind, signature, static in dex.contracts():
        if '/RecentsView;' in owner:
            continue
        if named:
            if 'AIFutureWidgetUtils' in owner:
                continue
            separator = '(' if kind == 'methods' else ':'
            name, suffix = signature.split(separator, 1)
            mapping = MEMBER_MAP.get(owner, {})
            signature = mapping.get((name, kind), mapping.get(name, name)) + separator + suffix
            for old, new in TYPE_MAP.items():
                signature = signature.replace(old, new)
            owner = TYPE_MAP.get(owner, owner)
        yield owner, kind, signature, static


def check(path):
    classes, _ = dex.read_apk(path)
    named = 'Lcom/android/launcher3/C2;' not in classes
    callback_binding = named and dex.find_member(classes,'Lcom/android/launcher3/ModelCallbacks;','methods','bindScreens(Lcom/android/launcher3/util/IntArray;)V') is not None and dex.find_member(classes,'Lcom/android/launcher3/Launcher;','methods','bindScreens(Lcom/android/launcher3/util/IntArray;)V') is None
    rows = []
    for owner, kind, signature, static in contracts(named):
        if callback_binding:
            if signature in ['mModelCallbacks:Lcom/android/launcher3/ModelCallbacks;','isFirstPagePinnedItemEnabled:Z','SHOULD_SHOW_FIRST_PAGE_WIDGET:Z']:continue
            if signature=='bindScreens(Lcom/android/launcher3/util/IntArray;)V':owner='Lcom/android/launcher3/ModelCallbacks;'
        actual = dex.find_member(classes, owner, kind, signature)
        # These three are dynamic calls on actual runtime owners; Targets uses
        # getDeclaredMember for every other reflected endpoint.
        declared = not (signature.startswith('getStateManager(') or signature.startswith('getState(')
                        or signature.startswith('C('))
        passed = actual is not None and bool(actual[1] & 8) == static and (not declared or actual[0] == owner)
        rows.append({'class': owner, 'kind': kind, 'member': signature, 'expectedStatic': static,
                     'declaredRequired': declared, 'definedBy': None if actual is None else actual[0], 'pass': passed})
    if callback_binding:
        for owner,kind,signature,static in [
            ('Lcom/android/launcher3/ModelCallbacks;','fields','launcher:Lcom/android/launcher3/Launcher;',False),
            ('Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;','methods','getAIFutureScreenId(Landroid/content/Context;)I',True)]:
            found=dex.find_member(classes,owner,kind,signature)
            rows.append({'class':owner,'kind':kind,'member':signature,'pass':found is not None and bool(found[1]&8)==static})
    source_owner = 'Lcom/android/launcher3/'
    source_idp = source_owner + ('InvariantDeviceProfile;' if named else 'F1;')
    for owner, kind, signature, static in [
        (source_owner + ('LauncherAppState;' if named else 'P2;'), 'methods',
         ('getIDP' if named else 'e') + '(Landroid/content/Context;)' + source_idp, True),
        (source_idp, 'fields', ('dbFile' if named else 'E1') + ':Ljava/lang/String;', False),
    ]:
        actual = dex.find_member(classes, owner, kind, signature)
        rows.append({'class': owner, 'kind': kind, 'member': signature, 'expectedStatic': static,
                     'declaredRequired': True, 'definedBy': None if actual is None else actual[0],
                     'pass': actual is not None and actual[0] == owner and bool(actual[1] & 8) == static})
    launcher = 'Lcom/android/launcher3/'
    for owner, ancestor in [(launcher + 'Workspace;', launcher + ('PagedView;' if named else 'V4;')),
                            (launcher + ('util/IntSparseArrayMap;' if named else 'util/A0;'), 'Landroid/util/SparseArray;'),
                            (launcher + ('util/LooperExecutor;' if named else 'util/p1;'), 'Ljava/util/concurrent/AbstractExecutorService;')]:
        current, seen = owner, set()
        while current != ancestor and current in classes and current not in seen:
            seen.add(current)
            current = classes[current]['parent']
        rows.append({'class': owner, 'expectedAncestor': ancestor, 'pass': current == ancestor})
    with zipfile.ZipFile(path) as apk:
        identity = dex.manifest_identity(apk.read('AndroidManifest.xml'))
    return {'apk': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'identity': identity, 'adapter': 'named_callback_binding' if callback_binding else 'android15_named' if named else 'android16_obfuscated',
            'checks': rows, 'pass': all(row['pass'] for row in rows)}


def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apks', type=Path, nargs='+')
    parser.add_argument('--json', type=Path)
    args = parser.parse_args()
    results = [check(path) for path in args.apks]
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for result in results:
        print(('PASS' if result['pass'] else 'FAIL') + ': ' + result['adapter'] + ' ' + result['identity']['versionName'])
        print('  %d real APK member/inheritance checks' % len(result['checks']))
        for row in result['checks']:
            if not row['pass']:
                print('  Incompatible: ' + json.dumps(row, ensure_ascii=False))
    print('APK interfaces only; target phone behavior requires device validation.')
    return 0 if all(result['pass'] for result in results) else 1


if __name__ == '__main__':
    sys.exit(main())
