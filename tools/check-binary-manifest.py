#!/usr/bin/env python3
"""Verify the compiled APK's binary AndroidManifest semantics.

This catches a class of hand-built AXML failures where the source XML contains
android:permission but PackageManager resolves ServiceInfo.permission as null.
Android resource-backed attributes inside each start element are expected in
ascending framework resource-id order, matching aapt2 output.
"""
from __future__ import annotations
import struct, sys, zipfile
from pathlib import Path

NO_INDEX = 0xFFFFFFFF
ANDROID_URI = 'http://schemas.android.com/apk/res/android'
EXPECTED_SERVICE = 'ls.augment.com.AugmentTileService'
EXPECTED_PERMISSION = 'android.permission.BIND_QUICK_SETTINGS_TILE'
EXPECTED_ACTION = 'android.service.quicksettings.action.QS_TILE'
EXPECTED_LAUNCHER_ALIAS = 'ls.augment.com.LauncherAlias'
EXPECTED_SETTINGS_ACTIVITY = 'ls.augment.com.SettingsActivity'
MODULE_SETTINGS_CATEGORY = 'de.robv.android.xposed.category.MODULE_SETTINGS'


def len8(buf: bytes, p: int):
    a = buf[p]
    if a & 0x80:
        return ((a & 0x7F) << 8) | buf[p + 1], p + 2
    return a, p + 1


def len16(buf: bytes, p: int):
    a = struct.unpack_from('<H', buf, p)[0]
    if a & 0x8000:
        b = struct.unpack_from('<H', buf, p + 2)[0]
        return ((a & 0x7FFF) << 16) | b, p + 4
    return a, p + 2


def string_pool(buf: bytes, off: int):
    typ, header_size, size = struct.unpack_from('<HHI', buf, off)
    assert typ == 0x0001
    count, styles, flags, strings_start, styles_start = struct.unpack_from('<5I', buf, off + 8)
    utf8 = bool(flags & 0x100)
    offsets = [struct.unpack_from('<I', buf, off + header_size + 4 * i)[0] for i in range(count)]
    base = off + strings_start
    out = []
    for rel in offsets:
        p = base + rel
        if utf8:
            _, p = len8(buf, p)
            n, p = len8(buf, p)
            out.append(buf[p:p+n].decode('utf-8'))
        else:
            n, p = len16(buf, p)
            out.append(buf[p:p + 2*n].decode('utf-16le'))
    return out, size


def parse_manifest(raw: bytes):
    typ, header_size, total = struct.unpack_from('<HHI', raw, 0)
    assert typ == 0x0003, 'not binary Android XML'
    off = header_size
    strings = []
    resmap = []
    starts = []
    while off < total:
        typ, hs, size = struct.unpack_from('<HHI', raw, off)
        if typ == 0x0001:
            strings, _ = string_pool(raw, off)
        elif typ == 0x0180:
            count = (size - 8) // 4
            resmap = list(struct.unpack_from('<' + 'I' * count, raw, off + 8))
        elif typ == 0x0102:
            ns_idx, name_idx = struct.unpack_from('<II', raw, off + 16)
            attr_start, attr_size, attr_count, _, _, _ = struct.unpack_from('<HHHHHH', raw, off + 24)
            attrs = []
            aoff = off + 16 + attr_start
            for i in range(attr_count):
                pos = aoff + i * attr_size
                ans, aname, raw_idx = struct.unpack_from('<III', raw, pos)
                _, _, dtype, data = struct.unpack_from('<HBBI', raw, pos + 12)
                name = strings[aname]
                ns = None if ans == NO_INDEX else strings[ans]
                raw_value = None if raw_idx == NO_INDEX else strings[raw_idx]
                if dtype == 0x03 and data < len(strings):
                    typed = strings[data]
                elif dtype == 0x12:
                    typed = bool(data)
                else:
                    typed = data
                resid = resmap[aname] if aname < len(resmap) else 0
                attrs.append({'ns': ns, 'name': name, 'raw': raw_value, 'typed': typed, 'resid': resid})
            starts.append((strings[name_idx], attrs))
        off += size
    return starts


def value(attrs, name):
    for a in attrs:
        if a['ns'] == ANDROID_URI and a['name'] == name:
            return a['raw'] if a['raw'] is not None else a['typed']
    return None


def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: check-binary-manifest.py APK')
    apk = Path(sys.argv[1])
    with zipfile.ZipFile(apk) as z:
        raw = z.read('AndroidManifest.xml')
    starts = parse_manifest(raw)

    # aapt2 orders framework-backed attributes by framework resource id.
    # PackageManager/Resources TypedArray paths can mis-resolve malformed
    # hand-built AXML when this invariant is broken.
    for tag, attrs in starts:
        ids = [a['resid'] for a in attrs if a['ns'] == ANDROID_URI and a['resid']]
        if ids != sorted(ids):
            detail = ', '.join(f"{a['name']}=0x{a['resid']:08x}" for a in attrs if a['ns'] == ANDROID_URI and a['resid'])
            raise AssertionError(f'unsorted android attributes in <{tag}>: {detail}')

    services = [(tag, attrs) for tag, attrs in starts if tag == 'service']
    found = None
    for _, attrs in services:
        name = value(attrs, 'name')
        if name in (EXPECTED_SERVICE, '.AugmentTileService'):
            found = attrs
            break
    assert found is not None, 'AugmentTileService missing from compiled manifest'
    assert value(found, 'permission') == EXPECTED_PERMISSION, (
        'compiled service permission mismatch: ' + repr(value(found, 'permission')))
    assert value(found, 'exported') is True, 'compiled TileService exported != true'

    actions = [value(attrs, 'name') for tag, attrs in starts if tag == 'action']
    assert EXPECTED_ACTION in actions, 'QS_TILE action missing from compiled manifest'

    aliases = [attrs for tag, attrs in starts if tag == 'activity-alias']
    launcher = next((attrs for attrs in aliases
                     if value(attrs, 'name') == EXPECTED_LAUNCHER_ALIAS), None)
    assert launcher is not None, 'toggleable launcher alias missing'
    assert value(launcher, 'targetActivity') == EXPECTED_SETTINGS_ACTIVITY, \
        'launcher alias target mismatch'
    assert value(launcher, 'enabled') is True, 'launcher alias default must be enabled'

    categories = [value(attrs, 'name') for tag, attrs in starts if tag == 'category']
    assert MODULE_SETTINGS_CATEGORY in categories, 'LSPosed module settings category missing'
    permissions = [value(attrs, 'name') for tag, attrs in starts if tag == 'uses-permission']
    assert 'android.permission.INTERNET' not in permissions, \
        'unexpected INTERNET permission; user analytics/cloud collection is disabled'

    print('Binary manifest checks: OK')
    print('tile_service_permission=' + EXPECTED_PERMISSION)
    print('tile_service_exported=true')
    print('qs_tile_action=' + EXPECTED_ACTION)
    print('launcher_alias=' + EXPECTED_LAUNCHER_ALIAS)
    print('internet_permission=false')

if __name__ == '__main__':
    main()
