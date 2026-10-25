"""Read-only DEX checks for complete named and obfuscated desktop-grid contracts.

This verifies actual defined APK members and primitive types. It does not install
an APK, initialize a launcher, alter desktop data or replace phone acceptance.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('launcher_dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)


def inspect(apk):
    classes, _ = dex.read_apk(apk)
    with zipfile.ZipFile(apk) as archive:
        identity = dex.manifest_identity(archive.read('AndroidManifest.xml'))
    base = 'Lcom/android/launcher3/'
    named = ('setGridSize('+base+'InvariantDeviceProfile;Landroid/content/Context;II)V') in classes.get(base+'DesktopGrid;',{}).get('methods',{})
    desktop = base + ('DesktopGrid;' if named else 'b0;')
    july = not named and ('r(' + base + 'H1;Landroid/content/Context;II)V') in classes.get(desktop, {}).get('methods', {})
    adapter = 'android15_named' if named else 'android16_260731' if july else 'android16_obfuscated'
    idp = base + ('InvariantDeviceProfile;' if named else 'H1;' if july else 'F1;')
    item = base + ('model/data/ItemInfo;' if named else 'model/data/y;')
    occupied = base + ('util/GridOccupancy;' if named else 'util/u0;' if july else 'util/t0;')
    dp = base + ('DeviceProfile;' if named else 'h0;')
    split = named and ('getWorkspaceProfile()'+base+'deviceprofile/WorkspaceProfile;') in classes.get(dp,{}).get('methods',{})
    metrics_owner=base+'deviceprofile/WorkspaceProfile;' if split else dp
    if split: adapter='named_workspace_profile'
    launcher = base + ('Launcher;' if named else 'E2;' if july else 'C2;')
    model = base + 'model/BgDataModel;' if named else 'LC1/y0;' if july else 'Lz1/y0;'
    done = base + ('util/IntSet;' if named else 'util/A0;' if july else 'util/z0;')
    context = 'Landroid/content/Context;'
    checks = []
    for owner in [desktop, idp, item, occupied, dp, launcher, model, done,
                  base + 'CellLayout;', base + 'Workspace;']:
        checks.append({'owner': owner, 'classDefined': owner in classes, 'pass': owner in classes})

    def member(owner, kind, signature, writable=False, static=False):
        actual = dex.find_member(classes, owner, kind, signature)
        ok = actual is not None and actual[0] == owner and not actual[1] & 0x400 and bool(actual[1] & 8) == static
        if writable and actual is not None:
            ok = ok and not actual[1] & 16
        checks.append({'owner': owner, 'kind': kind, 'member': signature,
                       'definedBy': None if actual is None else actual[0], 'pass': bool(ok)})

    def method(owner, old, new, args, result):
        if split and owner==idp and new=='onConfigChanged':args=''
        if split and owner==dp:
            if new in ('updateIconSize','updateAllAppsContainerWidth'):return
            if new=='getCellSize':owner=metrics_owner
        july_methods = {(idp, 'K0'): 'L0', (dp, 'p1'): 's1', (dp, 'h1'): 'k1',
                        (dp, 'k0'): 'n0', (launcher, 'B2'): 'C2', (launcher, 'h'): 'i'}
        member(owner, 'methods', (new if named else july_methods.get((owner, old), old) if july else old)
               + '(' + args + ')' + result)

    for owner, old, new, args, result in [
        (desktop, 'r', 'setGridSize', idp + context + 'II', 'V'),
        (idp, 'K0', 'onConfigChanged', context, 'V'),
        (desktop, 'i', 'getGridNumOfRowsAndColumns', context, 'Landroid/graphics/Point;'),
        (desktop, 'k', 'getRowsAndColumnsFromInt', context, 'Landroid/graphics/Point;'),
        (desktop, 'j', 'getGridNumOfRowsAndColumnsInt', context, 'I'),
        (desktop, 'u', 'updateGridData', context + idp + item + occupied, 'Z'),
        (desktop, 'g', 'doReGridData', idp + model + context + 'Z', 'V'),
        (occupied, 'd', 'isRegionVacant', 'IIII', 'Z'),
        (occupied, 'g', 'markCells', item + 'Z', 'V'),
        (dp, 'p1', 'updateIconSize', 'F' + context, 'V'),
        (dp, 'h1', 'updateAllAppsContainerWidth', context, 'V'),
        (dp, 'k0', 'getCellSize', '', 'Landroid/graphics/Point;'),
        (base + 'CellLayout;', 'getDeviceProfile', 'getDeviceProfile', '', dp),
        (base + 'CellLayout;', 'getCountX', 'getCountX', '', 'I'),
        (base + 'CellLayout;', 'getCountY', 'getCountY', '', 'I'),
        (launcher, 'h', 'finishBindingItems', done, 'V'),
        (launcher, 'B2', 'getWorkspace', '', base + 'Workspace;'),
    ]:
        method(owner, old, new, args, result)
    for owner, old, new, typ, writable in [
        (desktop, 'd', 'mShouldResize', 'Z', True),
        (idp, 'G0', 'numRows', 'I', False), (idp, 'H0', 'numColumns', 'I', False),
        (idp, 'E1', 'dbFile', 'Ljava/lang/String;', False),
        (dp, 'C0', 'inv', idp, False),
        (dp, 'B1', 'iconSizePx', 'I', True), (dp, 'C1', 'iconTextSizePx', 'I', True),
        (dp, 'D1', 'iconDrawablePaddingPx', 'I', True),
        (dp, 'Z0', 'mIsScalableGrid', 'Z', False), (dp, 'b1', 'mIsResponsiveGrid', 'Z', False),
    ]:
        july_fields = {(idp, 'G0'): 'K0', (idp, 'H0'): 'L0', (idp, 'E1'): 'I1',
                       (dp, 'C0'): 'D0', (dp, 'B1'): 'C1', (dp, 'C1'): 'D1',
                       (dp, 'D1'): 'E1', (dp, 'Z0'): 'a1', (dp, 'b1'): 'c1'}
        if split and owner==dp and new in ('iconSizePx','iconTextSizePx','iconDrawablePaddingPx'):owner=metrics_owner
        member(owner, 'fields', (new if named else july_fields.get((owner, old), old) if july else old)
               + ':' + typ, writable)
    for name in ['container', 'cellX', 'cellY', 'spanX', 'spanY', 'screenId']:
        member(item, 'fields', name + ':I')
    for owner, name, types in [
        (desktop, 'mResizeGridMap' if named else 'a',
         {'Ljava/util/Map;', 'Ljava/util/HashMap;', 'Ljava/util/LinkedHashMap;', 'Landroid/util/ArrayMap;'}),
        (item, 'id', {'I', 'J', 'S', 'B'}),
    ]:
        matches = [s for s in classes.get(owner, {}).get('fields', {})
                   if s.startswith(name + ':') and s.split(':', 1)[1] in types]
        if len(matches) == 1:
            member(owner, 'fields', matches[0])
        else:
            checks.append({'owner': owner, 'field': name, 'matches': matches, 'pass': False})
    if split:
        member(dp,'methods','getWorkspaceProfile()'+metrics_owner)
        member(metrics_owner,'methods','changeIconSize(I)'+metrics_owner)
        member(metrics_owner,'methods','setIconTextSizePx(I)V')
        member(base+'deviceprofile/WorkspaceProfileNonResponsiveFactory;','methods',
               'createWorkspaceProfileNonResponsive('+context+'Landroid/content/res/Resources;'+base+'deviceprofile/DeviceProperties;F'+idp+'ZZILandroid/util/DisplayMetrics;IIZZ'+base+'deviceprofile/HotseatProfileInitialValues;)'+metrics_owner)
    elif named:
        member(base + 'MFVDeviceProfile;', 'methods',
               'updateIconSize_DeviceProfile(' + dp + 'Landroid/content/res/Resources;F)V')
    if july:
        member(base + 'd4;', 'methods', 'L(' + dp + 'Landroid/content/res/Resources;F)V')
        member(base + 'Y3;', 'fields', 'a:Ljava/lang/String;', static=True)
        member(idp, 'fields', 'I0:' + base + 'P3;')
        member(base + 'P3;', 'fields', 'm:' + base + 'X;', static=True)
        member(base + 'P3;', 'methods', 'h(' + base + 'X;)Ljava/lang/Object;')
        checks.append({'owner': base + 'X;', 'classDefined': base + 'X;' in classes,
                       'pass': base + 'X;' in classes})
    for owner, ancestor in [(base + 'CellLayout;', 'Landroid/view/ViewGroup;'),
                            (base + 'Workspace;', 'Landroid/view/ViewGroup;')]:
        current, seen = owner, set()
        while current != ancestor and current in classes and current not in seen:
            seen.add(current)
            current = classes[current]['parent']
        checks.append({'owner': owner, 'ancestor': ancestor, 'pass': current == ancestor})
    return {'apk': str(apk.resolve()), 'identity': identity, 'adapter': adapter,
            'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'checks': checks,
            'interfacePass': all(row['pass'] for row in checks), 'deviceBehaviorVerified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--json', type=Path)
    args = parser.parse_args()
    result = inspect(args.apk)
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(result['identity'], ensure_ascii=False))
    print(result['adapter'] + ': ' + str(sum(row['pass'] for row in result['checks']))
          + '/' + str(len(result['checks'])) + ' defined member checks passed')
    for failed in [row for row in result['checks'] if not row['pass']]:
        print(json.dumps(failed, ensure_ascii=False))
    if not result['interfacePass']:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
