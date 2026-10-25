"""Audit every July H1/C1 Dock interface and its native call flow in the supplied APK.

This proves DEX contracts and inspected call boundaries, not phone drag/render results.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('dock_dex', ROOT / 'tools/check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DEX)
L = 'Lcom/android/launcher3/'


def inspect(apk, smali):
    classes, _ = DEX.read_apk(apk)
    checks = []
    def member(owner, kind, signature, static=False, writable=False):
        actual = DEX.find_member(classes, owner, kind, signature)
        passed = actual is not None and actual[0] == owner and bool(actual[1] & 8) == static
        if actual:
            passed = passed and not actual[1] & 0x400 and (not writable or not actual[1] & 16)
        checks.append(dict(owner=owner, kind=kind, member=signature, passed=bool(passed)))
    def ancestor(owner, expected):
        current, seen = owner, set()
        framework = {'Landroid/widget/TextView;':'Landroid/view/View;',
                     'Landroid/widget/FrameLayout;':'Landroid/view/ViewGroup;',
                     'Landroid/view/ViewGroup;':'Landroid/view/View;'}
        while current != expected and current not in seen and (current in classes or current in framework):
            seen.add(current)
            current = classes[current]['parent'] if current in classes else framework[current]
        checks.append(dict(owner=owner, ancestor=expected, passed=current == expected))
    ctx, view = 'Landroid/content/Context;', 'Landroid/view/View;'
    hotseat, cell = L+'Hotseat;', L+'CellLayout;'
    methods = [
        ('Lr1/f;', 'g('+ctx+')I', True), ('Lr1/f;', 'A('+hotseat+'I)V', True),
        ('Lr1/a;', 'c('+cell+view+'Z)V', False), ('Lr1/a;', 'i(Z)V', False),
        (L+'E2;', 'Y1()'+hotseat, False), (cell, 'onMeasure(II)V', False),
        (cell, 'getCountX()I', False), (cell, 'getCountY()I', False),
        (cell, 'getShortcutsAndWidgets()'+L+'R5;', False),
        (L+'R5;', 'onViewRemoved('+view+')V', False),
        ('LC1/y1;', 'e('+L+'model/data/y;Z)Z', False),
        (L+'util/u0;', '<init>(II)V', False),
        (L+'BubbleTextView;', 'onMeasure(II)V', False),
        (L+'BubbleTextView;', 'getIconSize()I', False),
        (L+'BubbleTextView;', 'setIconSize(I)V', False),
        (L+'BubbleTextView;', 'K0(III)V', False),
        (L+'BubbleTextView;', 't(Landroid/graphics/drawable/Drawable;)V', False),
        (L+'BubbleTextView;', 'setIconBoundsScale(F)V', False),
        (L+'BubbleTextView;', 'getIcon()Lu1/o;', False),
        (L+'folder/FolderIcon;', 'onMeasure(II)V', False),
        (L+'folder/FolderIcon;', 'getIconSize()I', False),
        (L+'folder/FolderIcon;', 'setIconSize(I)V', False),
        (L+'folder/FolderIcon;', 'k0(III)V', False),
        (L+'folder/u0;', 'Z0('+ctx+L+'views/k;'+view+'II)V', False),
        ('Lz1/Q;', 'M3()Z', True),
        ('LC1/i1;', 't(LC1/I0;LC1/i1$a;LC1/i1$a;IILandroid/graphics/Point;LC1/L0;LC1/L0;)Z', True),
    ]
    for owner, signature, static in methods:
        member(owner, 'methods', signature, static)
    for owner, signature, static, writable in [
        ('Lr1/a;', 'g:'+L+'E2;', False, False),
        ('LC1/y1;', 'l:'+L+'H1;', False, False),
        ('LC1/y1;', 'h:'+ctx, False, False),
        ('LC1/y1;', 'p:'+L+'util/B0;', False, False),
        (L+'util/u0;', 'c:[[Z', False, False),
        (L+'H1;', 'i1:I', False, True), (L+'H1;', 'I1:Ljava/lang/String;', False, False),
        (L+'model/data/y;', 'container:I', False, False),
        (L+'model/data/y;', 'screenId:I', False, False),
        (L+'model/data/y;', 'id:I', False, False),
        (L+'Y3;', 'a:Ljava/lang/String;', True, False),
        ('LC1/i1$a;', 'a:Landroid/database/sqlite/SQLiteDatabase;', False, False),
        ('LC1/i1$a;', 'b:Ljava/lang/String;', False, False),
        ('LC1/i1$a;', 'c:'+ctx, False, False),
    ]:
        member(owner, 'fields', signature, static, writable)
    for owner, expected in [(hotseat, 'Landroid/view/ViewGroup;'),
                            (L+'R5;', 'Landroid/view/ViewGroup;'),
                            (L+'util/B0;', 'Landroid/util/SparseArray;'),
                            ('LC1/y1;', 'Landroid/database/CursorWrapper;'),
                            (L+'BubbleTextView;', 'Landroid/view/View;'),
                            (L+'folder/FolderIcon;', 'Landroid/view/ViewGroup;'),
                            ('Lu1/o;', 'Landroid/graphics/drawable/Drawable;')]:
        ancestor(owner, expected)
    for decoy in ['F1', 'C2']:
        checks.append(dict(owner=L+decoy+';', contract='old name now synthetic, cannot select family by existence',
                           passed=bool(classes[L+decoy+';']['access'] & 0x1000)))

    # Read .class headers because APKTool escapes collisions on case-insensitive Windows.
    needed = {'Lr1/f;', 'Lr1/a;', 'LC1/y1;', 'LC1/i1;', L+'folder/u0;', L+'CellLayout;', L+'H1;'}
    filename_set = {owner.rsplit('/', 1)[-1][:-1].lower() for owner in needed}
    texts = {}
    for path in smali.rglob('*.smali'):
        if path.stem.lower().removesuffix('.1') not in filename_set:
            continue
        content = path.read_text(encoding='utf-8')
        match = re.search(r'^\.class .* (L[^ ]+;)\s*$', content, re.M)
        if match and match[1] in needed:
            texts[match[1]] = (path, content)
    def flow(owner, signature, tokens):
        path, content = texts.get(owner, (None, ''))
        block = next((m[0] for m in re.finditer(r'^\.method [^\n]*\n.*?^\.end method', content, re.M | re.S)
                      if signature in m[0].splitlines()[0]), '')
        checks.append(dict(owner=owner, nativeMethod=signature, nativeFlowTokens=tokens,
                           source=None if path is None else str(path.resolve()),
                           passed=bool(block) and all(token in block for token in tokens)))
    flow('Lr1/f;', ' g('+ctx+')I', [L+'H1;->i1:I', 'LA1/a;->j('+ctx+')I'])
    flow('Lr1/f;', ' A('+hotseat+'I)V', [cell+'->C0(II)V', 'Lz1/Q;->M3()Z'])
    flow('Lr1/a;', ' c('+cell+view+'Z)V', ['Lr1/f;->g('+ctx+')I', L+'E2;->Y1()'+hotseat])
    flow('Lr1/a;', ' i(Z)V', ['Lr1/f;->g('+ctx+')I'])
    flow('LC1/y1;', ' e('+L+'model/data/y;Z)Z',
         [L+'H1;->i1:I', L+'util/u0;->c:[[Z', 'position out of bounds', '-0x65'])
    flow('LC1/i1;', ' t(LC1/I0;LC1/i1$a;LC1/i1$a;IILandroid/graphics/Point;LC1/L0;LC1/L0;)Z',
         ['move/from16 v0, p3', 'move/from16 v5, p4', 'Adding Hotseat Items', 'LC1/i1$a;->c()Ljava/util/List;'])
    flow(L+'folder/u0;', ' Z0('+ctx+L+'views/k;'+view+'II)V',
         ['Lz1/Q;->M3()Z', L+'folder/FolderIcon;->getIconSize()I'])
    with zipfile.ZipFile(apk) as archive:
        identity = DEX.manifest_identity(archive.read('AndroidManifest.xml'))
    return dict(apk=str(apk.resolve()), sha256=hashlib.sha256(apk.read_bytes()).hexdigest(), identity=identity,
                adapter='android16_h1_c1', checks=checks, allInterfacesPass=all(c['passed'] for c in checks),
                deviceBehaviorVerified=False, scope='APK-defined interfaces and native smali call flow only')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--smali', required=True, type=Path)
    parser.add_argument('--json', required=True, type=Path)
    args = parser.parse_args()
    report = inspect(args.apk, args.smali)
    args.json.parent.mkdir(parents=True, exist_ok=True)
    args.json.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(f"Dock H1/C1: {len(report['checks'])} contracts; pass={report['allInterfacesPass']}")
    for failure in [c for c in report['checks'] if not c['passed']]:
        print(json.dumps(failure, ensure_ascii=False))
    if not report['allInterfacesPass']:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
