#!/usr/bin/env python3
"""Verify the edit-only indicator hook against supplied OEM Launcher APKs.

Usage: python tools/check-launcher-indicator-contracts.py --old OLD.apk --named NEW.apk --output report.json
Checks defined DEX members, signatures, inheritance and resource IDs. Static
evidence does not establish device behavior or support for every series build.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import zipfile

spec = importlib.util.spec_from_file_location('launcher_dex', Path(__file__).with_name('check-launcher-module-targets.py'))
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)
P = 'Lcom/android/launcher3/'
INDICATOR = P + 'pageindicators/MfvPageIndicatorImpl;'
LAYOUT = P + 'pageindicators/MfvPageIndicatorLayout;'
WORKSPACE = P + 'Workspace;'


def implemented_interfaces(data):
    strings = []
    for i in range(dex.u32(data, 56)):
        _, start = dex.uleb(data, dex.u32(data, dex.u32(data, 60) + 4 * i))
        strings.append(data[start:data.index(0, start)].decode('utf-8', 'replace'))
    types = [strings[dex.u32(data, dex.u32(data, 68) + 4 * i)] for i in range(dex.u32(data, 64))]
    result = {}
    for i in range(dex.u32(data, 96)):
        at = dex.u32(data, 100) + 32 * i
        offset = dex.u32(data, at + 12)
        result[types[dex.u32(data, at)]] = [] if not offset else [
            types[struct.unpack_from('<H', data, offset + 4 + 2 * n)[0]]
            for n in range(dex.u32(data, offset))]
    return result


def check(apk, named):
    classes, interfaces = {}, {}
    with zipfile.ZipFile(apk) as archive:
        if archive.testzip() is not None:
            raise ValueError('Corrupt APK')
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                data = archive.read(name)
                definitions = dex.dex_classes(data)
                if classes.keys() & definitions.keys():
                    raise ValueError('Duplicate DEX definitions')
                classes.update(definitions)
                interfaces.update(implemented_interfaces(data))
        resources = dex.resource_names(archive.read('resources.arsc'))
        identity = dex.manifest_identity(archive.read('AndroidManifest.xml'))
    def select(old, new):
        return new if named else old
    launcher = P + select('C2', 'Launcher') + ';'
    paged = P + select('V4', 'PagedView') + ';'
    state = P + select('V3', 'LauncherState') + ';'
    manager = P + 'statemanager/' + select('d', 'StateManager') + ';'
    base = P + 'statemanager/' + select('a', 'BaseState') + ';'
    menu = P + 'menu/' + select('l', 'MenuOverviewState') + ';'
    checks = []
    def member(owner, kind, signature, static=False):
        original, found = owner, False
        while owner in classes:
            if signature in classes[owner][kind]:
                flags = classes[owner][kind][signature]
                found = bool(flags & 8) == static and (kind != 'methods' or not flags & 0x400)
                break
            owner = classes[owner]['parent']
        checks.append(dict(owner=original, defined_by=owner, kind=kind, signature=signature, passed=found))
    def derives(child, parent, seen=None):
        if child == parent:
            return True
        # Android framework ancestry is external to the APK's DEX definitions.
        if child == 'Landroid/widget/RelativeLayout;':
            return parent in ('Landroid/view/ViewGroup;', 'Landroid/view/View;')
        if child == 'Landroid/view/ViewGroup;':
            return parent == 'Landroid/view/View;'
        seen = set() if seen is None else seen
        if child in seen or child not in classes:
            return False
        seen.add(child)
        return any(derives(ancestor, parent, seen) for ancestor in
                   [classes[child]['parent'], *interfaces.get(child, [])])
    for owner, signature in [
        (INDICATOR, 'onDraw(Landroid/graphics/Canvas;)V'),
        (INDICATOR, select('g', 'attach') + '(Landroid/view/ViewGroup;)V'),
        (paged, 'iniMfvPageIndicator(Landroid/view/View;)V'),
        (paged, 'getMfvPageIndicatorLayout()' + LAYOUT),
        (launcher, select('B2', 'getWorkspace') + '()' + WORKSPACE),
        (launcher, 'getStateManager()' + manager),
        (launcher, select('d4', 'onStateSetStart') + '(' + state + ')V'),
        (launcher, select('c4', 'onStateSetEnd') + '(' + state + ')V'),
        (launcher, 'onResume()V'),
        (manager, select('C', 'getState') + '()' + base),
    ]:
        member(owner, 'methods', signature)
    for owner, signature in [
        (INDICATOR, select('v', 'mPagedView') + ':Landroid/view/ViewGroup;'),
        (WORKSPACE, select('x', 'mLauncher') + ':' + launcher),
        (paged, 'mMfvPageIndicator:' + INDICATOR),
        (paged, 'mMfvPageIndicatorMiboard:' + INDICATOR),
    ]:
        member(owner, 'fields', signature)
    member(state, 'fields', select('A', 'MENU_OVERVIEW') + ':' + state, True)
    for child, parent in [(WORKSPACE, paged), (WORKSPACE, 'Landroid/view/ViewGroup;'),
                          (INDICATOR, 'Landroid/view/View;'), (LAYOUT, 'Landroid/view/ViewGroup;'),
                          (state, base), (menu, state)]:
        checks.append(dict(child=child, parent=parent, passed=derives(child, parent)))
    for name in ['page_indicator_mfv', 'mfv_page_indicator_launcher', 'mfv_page_indicator_miboard']:
        checks.append(dict(resource='id/' + name, passed='id/' + name in resources))
    checks.append(dict(identity=identity, passed=identity['package'] == 'com.zte.mifavor.launcher'))
    return dict(profile=select('obfuscated_mfv', 'named_mfv'), apk=str(apk.resolve()),
                sha256=hashlib.sha256(apk.read_bytes()).hexdigest(), identity=identity,
                passed=sum(c['passed'] for c in checks), total=len(checks), checks=checks, device_tested=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--old', type=Path, required=True)
    parser.add_argument('--named', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    results = [check(args.old, False), check(args.named, True)]
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for result in results:
        print(result['profile'], result['passed'], '/', result['total'], result['identity'])
        for item in result['checks']:
            if not item['passed']:
                print('FAIL', item)
    if any(r['passed'] != r['total'] for r in results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
