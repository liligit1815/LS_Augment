"""Reproducible offline evidence. A candidate catalogue is NOT an admission profile."""
import hashlib
import importlib.util
import json
import re
import struct
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ROM = ROOT / 'out/redmagic12-12.0.15MR1'
OUT = ROM / 'inspected/stage4'
OUT.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location('dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)
classes, origins, artifacts, families = {}, {}, {}, {}
for family, path in {
    '1': ROM / 'files/system_b/system/framework/services.jar',
    '2': ROM / 'files/system_b/system/framework/framework.jar',
    'ui': ROM / 'inspected/SystemUI-dex.zip',
}.items():
    entries = []; family_classes = {}; family_origins = {}
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if not re.fullmatch(r'classes\d*\.dex', name):
                continue
            data = archive.read(name)
            values = dex.dex_classes(data)
            # The shared parser records members/parents; retain interface arrays too.
            strings = []
            for i in range(dex.u32(data, 56)):
                _, start = dex.uleb(data, dex.u32(data, dex.u32(data, 60) + 4 * i))
                strings.append(data[start:data.index(0, start)].decode('utf-8', 'replace'))
            types = [strings[dex.u32(data, dex.u32(data, 68) + 4*i)] for i in range(dex.u32(data, 64))]
            for i in range(dex.u32(data, 96)):
                at = dex.u32(data, 100) + 32*i
                owner, interface_at = types[dex.u32(data, at)], dex.u32(data, at+12)
                values[owner]['interfaces'] = [] if not interface_at else [types[struct.unpack_from('<H', data, interface_at+4+2*j)[0]] for j in range(dex.u32(data, interface_at))]
            duplicate = family_classes.keys() & values.keys()
            if duplicate:
                raise ValueError('Duplicate definition inside archive: ' + repr(sorted(duplicate)[:5]))
            family_classes.update(values)
            family_origins.update({owner: family+'/'+name for owner in values})
            entries.append({'entry': name, 'sha256': hashlib.sha256(data).hexdigest(), 'size': len(data), 'magic': data[:8].hex()})
    artifacts[family] = {'path': path.relative_to(ROOT).as_posix(), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(), 'entries': entries}
    families[family] = (family_classes, family_origins)
    classes.update(family_classes); origins.update(family_origins)

profiles = []
for name in ['RootCriticalProfile', 'RootCoverageAdditions', 'RootRuntimeProfile', 'RootOwnershipProfile', 'RootProcessGroupProfile', 'RootHiddenRequestProfile']:
    path = ROOT / ('android/app/src/main/java/ls/augment/com/'+name+'.java')
    text = path.read_text(encoding='utf-8')
    class_rows = []
    for owner, source, flags, parent, interfaces in re.findall(r'new ClassSpec\("([^"]+)","([12]/classes\d*\.dex)",(\d+),"([^"]+)",new String\[\]\{([^}]*)\}', text):
        owner = 'L'+owner.replace('.', '/')+';'
        expected = {'parent': parent, 'access': int(flags), 'interfaces': re.findall(r'"([^"]+)"', interfaces)}
        source_classes, source_origins = families[source[0]]
        observed = source_classes.get(owner)
        actual = None if observed is None else {key: observed[key] for key in expected}
        class_rows.append({'owner': owner, 'expectedSource': source, 'actualSource': source_origins.get(owner), 'expected': expected, 'actual': actual, 'matches': expected == actual and source == source_origins.get(owner)})
    declared = {row['owner']: row['expectedSource'] for row in class_rows}
    rows = []
    for line in text.splitlines():
        if not re.search(r'new (MemberSpec|Spec|MethodSpec|FieldSpec)\(', line):
            continue
        quoted = re.findall(r'"([^"]*)"', line)
        descriptors = [s for s in quoted if s.startswith('L') and ';->' in s]
        if not descriptors:
            continue
        descriptor = descriptors[-1]
        owner, signature = descriptor.split('->', 1)
        source = next((s for s in quoted if re.fullmatch(r'[12]/classes\d*\.dex', s)), declared.get(owner))
        flag_match = re.search(r',\s*(\d+)\s*\)', line)
        if not flag_match:
            raise ValueError('Cannot parse profile flags: '+line)
        flags = int(flag_match[1]); kind = 'methods' if '(' in signature else 'fields'
        if not source:
            raise ValueError('Missing declared source: '+descriptor)
        source_classes, source_origins = families[source[0]]
        actual = source_classes.get(owner, {}).get(kind, {})
        same_name = signature.split('(')[0].split(':')[0]
        alternatives = {k:v for k,v in actual.items() if k.split('(')[0].split(':')[0] == same_name}
        rows.append({'descriptor': descriptor, 'expectedSource': source, 'actualSource': source_origins.get(owner), 'expectedFlags': flags,
                     'actualFlags': actual.get(signature), 'matches': signature in actual and actual[signature] == flags and source == source_origins.get(owner),
                     'sameNameCandidates': alternatives})
    profiles.append({'profile': name, 'sourceSha256': hashlib.sha256(path.read_bytes()).hexdigest(), 'classes': class_rows, 'members': rows})
catalog = {'schema': 1, 'status': 'OBSERVATION_ONLY_NOT_EXECUTABLE', 'runtimeAdmission': False,
           'artifacts': {k:v for k,v in artifacts.items() if k != 'ui'}, 'profiles': profiles,
           'admissionSourceSha256': {name:hashlib.sha256((ROOT/'android/app/src/main/java/ls/augment/com'/name).read_bytes()).hexdigest()
                                    for name in ['RootAndroidClassOrigins.java','RootCriticalInstaller.java','RootEarlyCoordinator.java']},
           'requiredEvidence': ['Audit new full call graph and changed lambda/lock/ownership semantics',
                                'Bind actual Class/DexCache/defining-loader provenance to the selected archive pair',
                                'Prove LSPosed early window, deoptimization results and active frame coverage on device']}
target = OUT / 'root-protection-candidate.json'
target.write_text(json.dumps(catalog, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
(OUT/'root-protection-candidate.sha256').write_text(hashlib.sha256(target.read_bytes()).hexdigest()+'  '+target.name+'\n', encoding='ascii')
for profile in profiles:
    print(profile['profile'], sum(r['matches'] for r in profile['members']), '/', len(profile['members']), 'exact members/source/flags; classes', sum(r['matches'] for r in profile['classes']), '/', len(profile['classes']))
selected = {name: value | {'source': origins[name]} for name,value in classes.items() if name.startswith((
    'Landroid/app/IActivityTaskManager', 'Landroid/view/IWindowManager', 'Landroid/view/IWindowSession',
    'Landroid/hardware/input/InputManager', 'Landroid/hardware/display/DisplayManager',
    'Landroid/view/Display;', 'Landroid/view/DisplayInfo;', 'Landroid/view/View;', 'Landroid/view/InputEvent;', 'Landroid/view/MotionEvent;',
    'Landroid/window/WindowContainer', 'Landroid/window/WindowOrganizer;',
    'Lcom/android/server/display/DisplayManagerService', 'Lcom/android/server/display/DisplayDeviceInfo;',
    'Lcom/android/server/wm/', 'Lcom/android/server/inputmethod/', 'Lcom/android/server/accessibility/', 'Lcom/android/server/input/InputManagerService;',
    'Lcom/android/systemui/statusbar/notification/collection/BundleEntry', 'Lcom/android/systemui/statusbar/notification/collection/PipelineEntry;',
    'Lcom/android/systemui/statusbar/notification/row/ExpandableNotificationRow;'))}
(OUT/'capabilities.json').write_text(json.dumps({'artifacts': artifacts, 'classes': selected}, indent=2)+'\n', encoding='utf-8')
print('Candidate catalogue and', len(selected), 'capability classes saved; runtime admission unchanged.')
