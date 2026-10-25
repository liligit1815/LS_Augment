"""Read-only contracts for the actual OEM Dock and both Control Center paths.

Reads defined DEX members and binary APK resources; never initializes OEM code or
changes a device. Passing proves contracts, not GPU output or phone acceptance.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('glass_dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)


def resources(data):
    """Resolve declared resource IDs and their real ZIP paths, including sparse entries."""
    cursor = struct.unpack_from('<H', data, 2)[0]
    global_strings = dex.string_pool(data, cursor)
    result = {}
    while cursor < len(data):
        kind, header, size = struct.unpack_from('<HHI', data, cursor)
        if not size:
            raise ValueError('Empty resource chunk')
        if kind == 0x200:
            package_id = dex.u32(data, cursor + 8)
            type_names = dex.string_pool(data, cursor + dex.u32(data, cursor + 268))
            keys = dex.string_pool(data, cursor + dex.u32(data, cursor + 276))
            child = cursor + header
            while child < cursor + size:
                ck, ch, cs = struct.unpack_from('<HHI', data, child)
                if not cs:
                    raise ValueError('Empty resource package chunk')
                if ck == 0x201:
                    type_id, flags = data[child + 8:child + 10]
                    count, entries = struct.unpack_from('<II', data, child + 12)
                    for i in range(count):
                        index = i
                        if flags & 1:
                            index, offset = struct.unpack_from('<HH', data, child + ch + 4 * i)
                            offset *= 4
                        elif flags & 2:
                            offset = struct.unpack_from('<H', data, child + ch + 2 * i)[0]
                            offset = 0xffffffff if offset == 0xffff else offset * 4
                        else:
                            offset = dex.u32(data, child + ch + 4 * i)
                        if offset == 0xffffffff:
                            continue
                        at = child + entries + offset
                        entry_size, entry_flags, key = struct.unpack_from('<HHI', data, at)
                        name = type_names[type_id - 1] + '/' + keys[key]
                        row = result.setdefault(name, {'id': package_id << 24 | type_id << 16 | index, 'paths': []})
                        if not entry_flags & 1 and data[at + entry_size + 3] == 3:
                            path = global_strings[dex.u32(data, at + entry_size + 4)]
                            if path not in row['paths']:
                                row['paths'].append(path)
                child += cs
        cursor += size
    return result


def elements(data):
    strings = []
    result = []
    cursor = struct.unpack_from('<H', data, 2)[0]
    while cursor < len(data):
        kind, header, size = struct.unpack_from('<HHI', data, cursor)
        if not size:
            raise ValueError('Empty XML chunk')
        if kind == 1:
            strings = dex.string_pool(data, cursor)
        elif kind == 0x102:
            start = cursor + header
            attr_start, attr_size, count = struct.unpack_from('<HHH', data, start + 8)
            attrs = {}
            for i in range(count):
                at = start + attr_start + i * attr_size
                attrs[strings[dex.u32(data, at + 4)]] = (data[at + 15], dex.u32(data, at + 16))
            result.append((strings[dex.u32(data, start + 4)], attrs))
        cursor += size
    return result


def inspect(systemui, launcher):
    rows = []
    evidence = {}

    def check(label, passed, **extra):
        rows.append(dict(contract=label, passed=bool(passed), **extra))

    for role, apk in [('systemui', systemui), ('launcher', launcher)]:
        classes, _ = dex.read_apk(apk)
        evidence[role] = dict(path=str(apk.resolve()), sha256=hashlib.sha256(apk.read_bytes()).hexdigest())
        with zipfile.ZipFile(apk) as archive:
            evidence[role]['identity'] = dex.manifest_identity(archive.read('AndroidManifest.xml'))
            if role == 'systemui':
                for owner in ['com.zte.controlcenter.view.ControlCenterPanelView', 'com.zte.mifavor.qs.MfvQSContainerImpl']:
                    for signature in ['onFinishInflate()V', 'dispatchDraw(Landroid/graphics/Canvas;)V']:
                        member = dex.find_member(classes, 'L' + owner.replace('.', '/') + ';', 'methods', signature)
                        check(owner + '.' + signature, member is not None and not member[1] & (8 | 1024))
                for owner, signature in [
                    ('com/zte/mifavor/qs/MfvQSContainerImpl', 'qsContent:Lcom/zte/mifavor/qs/MfvQSContent;'),
                    ('com/zte/mifavor/qs/MfvQSContainerImpl', 'brightnessView:Landroid/view/View;'),
                    ('com/zte/controlcenter/view/ToggleSliderView', 'mSlider:Lcom/android/systemui/settings/brightness/ToggleSeekBar;'),
                    ('com/zte/qs/tileimpl/QSTileViewBase', 'colorBackgroundDrawable:Landroid/graphics/drawable/GradientDrawable;'),
                    ('com/zte/qs/tileimpl/QSTileViewBase', 'lastState:I'),
                ]:
                    check(owner + '.' + signature, dex.find_member(classes, 'L' + owner + ';', 'fields', signature) is not None)
                check('MFV content touch remains a boolean native callback', dex.find_member(classes,
                      'Lcom/zte/mifavor/qs/MfvQSContent;', 'methods', 'dispatchTouchEvent(Landroid/view/MotionEvent;)Z') is not None)
                table = resources(archive.read('resources.arsc'))

                def xml(name):
                    paths = table.get(name, {}).get('paths', [])
                    check(name + ' resolves to an APK XML file', bool(paths), paths=paths)
                    return [elements(archive.read(path)) for path in paths]

                content = xml('layout/qs_content')
                for tag in ['com.zte.mifavor.qs.MfvQSContent', 'com.zte.mifavor.qs.MfvQSPanel', 'com.zte.mifavor.qs.MfvQuickQSPanel']:
                    check('same qs_content tree owns ' + tag, any(any(n == tag for n, _ in nodes) for nodes in content))
                slider = xml('layout/zte_quick_qs_toggle_slider')
                progress_id = table['drawable/brightness_progress']['id']
                check('actual horizontal SeekBar selects brightness_progress', any(any('SeekBar' in n and a.get('progressDrawable') == (1, progress_id) for n, a in nodes) for nodes in slider))
                progress = xml('drawable/brightness_progress')
                for layer_id in [0x1020000, 0x102000d]:
                    check('brightness keeps native layer ' + hex(layer_id), any(any(n == 'item' and a.get('id') == (1, layer_id) for n, a in nodes) for nodes in progress))
                check('native brightness uses shape and clipped progress', any({'shape', 'clip', 'corners'}.issubset({n for n, _ in nodes}) for nodes in progress))
                media = xml('layout/media_session_view_zte')
                media_id = table['id/qs_media_controls_zte']['id']
                bg_id = table['drawable/qs_media_outline_layout_bg']['id']
                check('verified media root resource selects native background', any(any(n == 'com.android.systemui.util.animation.TransitionLayout' and a.get('id') == (1, media_id) and a.get('background') == (1, bg_id) for n, a in nodes) for nodes in media))
                background = xml('drawable/qs_media_outline_layout_bg')
                check('media native background is a rectangle GradientDrawable', any(nodes and nodes[0][0] == 'shape' and 'corners' in {n for n, _ in nodes} for nodes in background))
            else:
                for signature in ['onDraw(Landroid/graphics/Canvas;)V', 'onFinishInflate()V', 'onLayout(ZIIII)V', 'dispatchTouchEvent(Landroid/view/MotionEvent;)Z']:
                    check('Hotseat.' + signature, dex.find_member(classes, 'Lcom/android/launcher3/Hotseat;', 'methods', signature) is not None)
                getters = [s for s in classes['Lcom/android/launcher3/CellLayout;']['methods'] if s.startswith('getShortcutsAndWidgets()')]
                check('CellLayout has one icon-container accessor', len(getters) == 1, members=getters)
                if len(getters) == 1:
                    typ = getters[0].split(')', 1)[1]
                    while typ in classes:
                        typ = classes[typ]['parent']
                    check('native icon-container is a ViewGroup', typ == 'Landroid/view/ViewGroup;')
    return dict(evidence=evidence, checks=rows, passed=all(r['passed'] for r in rows),
                limitation='Read-only APK interface/resource contracts; no code execution, AGSL, compositor or device acceptance.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--systemui', required=True, type=Path)
    parser.add_argument('--launcher', required=True, type=Path)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    report = inspect(args.systemui, args.launcher)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(report, ensure_ascii=False, indent=2))
    raise SystemExit(0 if report['passed'] else 1)
