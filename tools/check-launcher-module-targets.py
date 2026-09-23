#!/usr/bin/env python3
"""Check module hook contracts against two APKs without a launcher source tree.

Usage: python tools/check-launcher-module-targets.py ORIGINAL.apk MODIFIED.apk
The standard-library DEX reader checks *defined* members, signatures, inheritance
and static/instance access. This is an interface check, not a device UI test.
"""

import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys
import zipfile


def u32(data, offset):
    return struct.unpack_from('<I', data, offset)[0]


def uleb(data, offset):
    result = 0
    for shift in range(0, 35, 7):
        value = data[offset]
        offset += 1
        result |= (value & 127) << shift
        if value < 128:
            return result, offset
    raise ValueError('Invalid DEX unsigned LEB128')


def dex_classes(data):
    if data[:4] != b'dex\n' or u32(data, 40) != 0x12345678:
        raise ValueError('Unsupported DEX header or byte order')
    strings = []
    for i in range(u32(data, 56)):
        _, start = uleb(data, u32(data, u32(data, 60) + 4 * i))
        strings.append(data[start:data.index(0, start)].decode('utf-8', 'replace'))
    types = [strings[u32(data, u32(data, 68) + 4 * i)] for i in range(u32(data, 64))]
    prototypes = []
    for i in range(u32(data, 72)):
        at = u32(data, 76) + 12 * i
        result, parameters = u32(data, at + 4), u32(data, at + 8)
        args = [] if parameters == 0 else [types[struct.unpack_from('<H', data, parameters + 4 + 2 * j)[0]]
                                           for j in range(u32(data, parameters))]
        prototypes.append('(' + ''.join(args) + ')' + types[result])
    fields = []
    for i in range(u32(data, 80)):
        owner, kind, name = struct.unpack_from('<HHI', data, u32(data, 84) + 8 * i)
        fields.append((types[owner], strings[name] + ':' + types[kind]))
    methods = []
    for i in range(u32(data, 88)):
        owner, proto, name = struct.unpack_from('<HHI', data, u32(data, 92) + 8 * i)
        methods.append((types[owner], strings[name] + prototypes[proto]))
    result = {}
    for i in range(u32(data, 96)):
        at = u32(data, 100) + 32 * i
        owner, access, parent = struct.unpack_from('<III', data, at)
        definition = {'parent': None if parent == 0xffffffff else types[parent],
                      'access': access, 'fields': {}, 'methods': {}}
        result[types[owner]] = definition
        cursor = u32(data, at + 24)
        if not cursor:
            continue
        counts = []
        for _ in range(4):
            count, cursor = uleb(data, cursor)
            counts.append(count)
        for group, count in enumerate(counts):
            index = 0
            for _ in range(count):
                diff, cursor = uleb(data, cursor)
                flags, cursor = uleb(data, cursor)
                index += diff
                table, key = (fields, 'fields') if group < 2 else (methods, 'methods')
                if group >= 2:
                    _, cursor = uleb(data, cursor)  # code_item offset
                member_owner, signature = table[index]
                if member_owner != types[owner]:
                    raise ValueError('DEX member definition owner mismatch')
                definition[key][signature] = flags
    return result


def string_pool(data, start):
    kind, header, size = struct.unpack_from('<HHI', data, start)
    if kind != 1:
        raise ValueError('Expected Android resource string pool')
    count, _, flags, strings_start = struct.unpack_from('<IIII', data, start + 8)
    values = []
    for i in range(count):
        at = start + strings_start + u32(data, start + header + 4 * i)
        if flags & 0x100:
            # Two lengths: UTF-16 code units, then UTF-8 bytes.
            for _ in range(2):
                length = data[at]
                at += 1
                if length & 0x80:
                    length = ((length & 0x7f) << 8) | data[at]
                    at += 1
            values.append(data[at:at + length].decode('utf-8'))
        else:
            length = struct.unpack_from('<H', data, at)[0]
            at += 2
            if length & 0x8000:
                length = ((length & 0x7fff) << 16) | struct.unpack_from('<H', data, at)[0]
                at += 2
            values.append(data[at:at + length * 2].decode('utf-16le'))
    return values


def resource_names(data):
    """Read declared resource type/name pairs, including sparse/16-bit tables."""
    names = set()
    root_kind, root_header, root_size = struct.unpack_from('<HHI', data, 0)
    if root_kind != 2:
        raise ValueError('Expected Android resource table')
    cursor = root_header
    while cursor < root_size:
        kind, header, size = struct.unpack_from('<HHI', data, cursor)
        if not size:
            raise ValueError('Empty Android resource chunk')
        if kind == 0x200:
            type_names = string_pool(data, cursor + u32(data, cursor + 268))
            key_names = string_pool(data, cursor + u32(data, cursor + 276))
            child = cursor + header
            while child < cursor + size:
                child_kind, child_header, child_size = struct.unpack_from('<HHI', data, child)
                if not child_size:
                    raise ValueError('Empty resource package chunk')
                if child_kind == 0x201:
                    type_id, flags = data[child + 8:child + 10]
                    count, entries_start = struct.unpack_from('<II', data, child + 12)
                    for i in range(count):
                        if flags & 1:
                            _, entry = struct.unpack_from('<HH', data, child + child_header + i * 4)
                            entry *= 4
                        elif flags & 2:
                            entry = struct.unpack_from('<H', data, child + child_header + i * 2)[0]
                            entry = 0xffffffff if entry == 0xffff else entry * 4
                        else:
                            entry = u32(data, child + child_header + i * 4)
                        if entry != 0xffffffff:
                            at = child + entries_start + entry
                            key = u32(data, at + 4)
                            names.add(type_names[type_id - 1] + '/' + key_names[key])
                child += child_size
        cursor += size
    return names


def manifest_identity(data):
    strings = []
    cursor = struct.unpack_from('<H', data, 2)[0]
    while cursor < len(data):
        kind, header, size = struct.unpack_from('<HHI', data, cursor)
        if not size:
            raise ValueError('Empty manifest chunk')
        if kind == 1:
            strings = string_pool(data, cursor)
        elif kind == 0x102:
            extension = cursor + header
            if strings[u32(data, extension + 4)] == 'manifest':
                attr_start, attr_size, attr_count = struct.unpack_from('<HHH', data, extension + 8)
                attributes = {}
                for i in range(attr_count):
                    at = extension + attr_start + attr_size * i
                    name, raw = u32(data, at + 4), u32(data, at + 8)
                    value_type, value = data[at + 15], u32(data, at + 16)
                    attributes[strings[name]] = (strings[raw] if raw != 0xffffffff else
                                                 strings[value] if value_type == 3 else value)
                return {key: attributes.get(key) for key in ('package', 'versionName', 'versionCode')}
        cursor += size
    raise ValueError('Manifest root element not found')


def read_apk(path):
    classes = {}
    with zipfile.ZipFile(path) as apk:
        for name in apk.namelist():
            if re.fullmatch(r'classes[0-9]*\.dex', name):
                definitions = dex_classes(apk.read(name))
                duplicate = classes.keys() & definitions.keys()
                if duplicate:
                    raise ValueError('Duplicate class definitions: ' + str(sorted(duplicate)))
                classes.update(definitions)
        resources = resource_names(apk.read('resources.arsc'))
    return classes, resources


def find_member(classes, owner, kind, signature):
    seen = set()
    while owner in classes and owner not in seen:
        seen.add(owner)
        definition = classes[owner]
        if signature in definition[kind]:
            return owner, definition[kind][signature]
        owner = definition['parent']
    return None


def contracts():
    launcher = 'Lcom/android/launcher3/'
    recents = 'Lcom/android/quickstep/views/RecentsView;'
    return [
        (launcher + 'Workspace;', 'methods', 'i3()V', False),
        (launcher + 'Workspace;', 'methods', 'Q0()V', False),
        (launcher + 'Workspace;', 'methods', 'G2(IZLjava/lang/Runnable;)V', False),
        (launcher + 'Workspace;', 'methods', 'v1(II)' + launcher + 'CellLayout;', False),
        (launcher + 'Workspace;', 'methods', 'getScreenOrder()' + launcher + 'util/x0;', False),
        (launcher + 'Workspace;', 'methods', 'n(I)' + launcher + 'CellLayout;', False),
        (launcher + 'Workspace;', 'methods', 'getPanelCount()I', False),
        (launcher + 'V4;', 'methods', 'getCurrentPage()I', False),
        (launcher + 'V4;', 'methods', 'setCurrentPage(I)V', False),
        (launcher + 'CellLayout;', 'methods', 'getShortcutsAndWidgets()' + launcher + 'K5;', False),
        (launcher + 'C2;', 'methods', 'f(' + launcher + 'util/x0;)V', False),
        (launcher + 'C2;', 'methods', 'h(' + launcher + 'util/z0;)V', False),
        (launcher + 'C2;', 'methods', 'B2()' + launcher + 'Workspace;', False),
        (launcher + 'C2;', 'methods', 'w2()Lx1/Z;', False),
        (launcher + 'C2;', 'methods', 'getStateManager()' + launcher + 'statemanager/d;', False),
        (launcher + 'C2;', 'fields', 'h:' + launcher + 'B4;', False),
        (launcher + 'Workspace;', 'fields', 'n:' + launcher + 'util/A0;', False),
        (launcher + 'Workspace;', 'fields', 'x:' + launcher + 'C2;', False),
        (launcher + 'Workspace;', 'methods', 'getIsDragOccuring()Z', False),
        (launcher + 'Workspace;', 'methods', 'setState(' + launcher + 'V3;)V', False),
        (launcher + 'V4;', 'methods', 'isPageInTransition()Z', False),
        (launcher + 'V4;', 'methods', 'updatePageIndicator()V', False),
        *[(launcher + 'util/x0;', 'methods', signature, False) for signature in (
            'clear()V', 'm(I)V', 'A()[I', 'q()' + launcher + 'util/x0;')],
        (launcher + 'menu/MenuContainer;', 'methods', 'G()V', False),
        (launcher + 'menu/MenuContainer;', 'fields', 'm:Landroid/widget/LinearLayout;', False),
        (launcher + 'menu/MenuContainer;', 'fields', 'g:' + launcher + 'views/k;', False),
        (launcher + 'B4;', 'fields', 'j:Z', False),
        (launcher + 'N5;', 'fields', 'j:Z', True),
        (launcher + 'P2;', 'methods', 'h(Landroid/content/Context;)' + launcher + 'P2;', True),
        (launcher + 'P2;', 'methods', 'j()' + launcher + 'D3;', False),
        (launcher + 'D3;', 'methods', 'm0()Lz1/k2;', False),
        ('Lz1/k2;', 'methods', 'F()I', False),
        ('Lx1/Z;', 'methods', 'b(' + launcher + 'Workspace;)V', False),
        (launcher + 'J3;', 'methods', 'm(Landroid/content/Context;)Landroid/content/SharedPreferences;', True),
        (launcher + 'widget/custom/future/AIFutureWidgetUtils;', 'methods', 'l(Landroid/content/Context;)I', True),
        (launcher + 'statemanager/d;', 'methods', 'C()' + launcher + 'statemanager/a;', False),
        (recents, 'fields', 'mOverviewStateEnabled:Z', False),
        (recents, 'fields', 'mContentAlpha:F', False),
        *[(recents, 'methods', signature, False) for signature in (
            'onAttachedToWindow()V', 'onDetachedFromWindow()V', 'onLayout(ZIIII)V',
            'setOverviewStateEnabled(Z)V', 'setContentAlpha(F)V', 'setVisibility(I)V',
            'onWindowVisibilityChanged(I)V')],
    ]


def check(path, modified):
    classes, resources = read_apk(path)
    with zipfile.ZipFile(path) as apk:
        identity = manifest_identity(apk.read('AndroidManifest.xml'))
    required = contracts()
    rows = [{'manifest': identity, 'pass': identity == {
        'package': 'com.zte.mifavor.launcher',
        'versionName': '26.9.260.908.2609081608' if modified else '16.0.010.000.2604151532',
        'versionCode': 260005 if modified else 160000}}]
    for owner, kind, signature, static in required:
        actual = find_member(classes, owner, kind, signature)
        # Targets use getDeclaredField/getDeclaredMethod. Dynamic helper calls
        # are recorded on their actual declaring classes, with ancestry below.
        declared = True
        passed = (actual is not None and bool(actual[1] & 8) == static
                  and (not declared or actual[0] == owner))
        rows.append({'class': owner, 'member': signature, 'kind': kind,
                     'expectedStatic': static, 'declaredRequired': declared,
                     'definedBy': None if actual is None else actual[0],
                     'accessFlags': None if actual is None else actual[1], 'pass': passed})
    for owner, expected in (
        ('Lcom/android/launcher3/Workspace;', 'Lcom/android/launcher3/V4;'),
        ('Lcom/android/launcher3/util/A0;', 'Landroid/util/SparseArray;'),
        ('Lcom/android/launcher3/K5;', 'Landroid/view/ViewGroup;'),
        ('Lcom/android/launcher3/dragndrop/DragLayer;', 'Landroid/widget/FrameLayout;'),
        ('Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;', 'Landroid/widget/FrameLayout$LayoutParams;'),
        ('Lcom/android/quickstep/views/LauncherRecentsView;', 'Lcom/android/quickstep/views/RecentsView;'),
    ):
        current, seen = owner, set()
        while current != expected and current in classes and current not in seen:
            seen.add(current)
            current = classes[current]['parent']
        rows.append({'class': owner, 'expectedAncestor': expected, 'pass': current == expected})
    return {'apk': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'role': 'modified' if modified else 'original',
            'identity': identity,
            'classes': len(classes), 'checks': rows,
            'legacyPageHelperPresent': 'Lcom/android/launcher3/LsPageManager;' in classes,
            'legacyMemoryHelperPresent': 'Lcom/android/quickstep/views/LsRecentsMemory;' in classes,
            'nativeMemoryInfoMethodPresent': find_member(classes,
                'Lcom/android/quickstep/views/LsNativeStack;', 'methods',
                'isMemoryInfoEnabled(Landroid/content/Context;)Z') is not None,
            'nativeMemoryResources': {name: name in resources for name in (
                'id/recents_stack_memory_container', 'id/recents_stack_memory_available')},
            'pass': all(row['pass'] for row in rows)}


def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path, help='Original launcher APK to inspect')
    parser.add_argument('modified', type=Path, help='Modified 260005 launcher APK to inspect')
    parser.add_argument('--json', type=Path, help='Optional full result file')
    args = parser.parse_args()
    results = [check(args.original, False), check(args.modified, True)]
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for result in results:
        print(('PASS' if result['pass'] else 'FAIL') + ': ' + result['apk'])
        print('  Identity: ' + json.dumps(result['identity'], ensure_ascii=False))
        print('  SHA-256: ' + result['sha256'])
        print('  %d interface/resource checks; legacy page helper=%s, memory helper=%s' % (
            len(result['checks']), result['legacyPageHelperPresent'], result['legacyMemoryHelperPresent']))
        for row in result['checks']:
            if not row['pass']:
                print('  Missing or incompatible: ' + json.dumps(row, ensure_ascii=False))
    print('Static APK interfaces only; phone behavior is not verified by this check.')
    return 0 if all(result['pass'] for result in results) else 1


if __name__ == '__main__':
    sys.exit(main())
