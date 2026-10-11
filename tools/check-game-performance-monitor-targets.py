#!/usr/bin/env python3
"""Check production monitor mappings against real GameAssist APK definitions.

Example: --gameassist GameAssist16.apk --gameassist GameAssist17.apk --output result.json
Reads the production Access constructor and checks both complete profiles in
production order. This validates declared names, exact types/signatures and
instance access; it does not execute APK code or verify phone behavior.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import sys
import zipfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/GamePerformanceMonitorHook.java'
spec = importlib.util.spec_from_file_location('monitor_dex_reader', ROOT / 'tools/check-launcher-module-targets.py')
dex_reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex_reader)

JAVA_TYPES = {
    'void': 'V', 'boolean': 'Z', 'int': 'I', 'float': 'F',
    'Context': 'Landroid/content/Context;',
    'String': 'Ljava/lang/String;',
    'android.widget.LinearLayout': 'Landroid/widget/LinearLayout;',
    'View': 'Landroid/view/View;',
    'ViewGroup': 'Landroid/view/ViewGroup;',
    'ViewGroup.LayoutParams': 'Landroid/view/ViewGroup$LayoutParams;',
    'WindowManager.LayoutParams': 'Landroid/view/WindowManager$LayoutParams;',
}


def enclosed(text, start, opening='(', closing=')'):
    """Return a balanced Java expression without evaluating it."""
    if text[start] != opening:
        raise ValueError('Expected ' + opening)
    depth, quoted, escaped = 0, False, False
    for index in range(start, len(text)):
        char = text[index]
        if quoted:
            if escaped:
                escaped = False
            elif char == '\\':
                escaped = True
            elif char == '"':
                quoted = False
            continue
        if char == '"':
            quoted = True
        elif char == opening:
            depth += 1
        elif char == closing:
            depth -= 1
            if depth == 0:
                return text[start + 1:index], index + 1
    raise ValueError('Unbalanced Java expression')


def arguments(text):
    result, start, depth, quoted, escaped = [], 0, 0, False, False
    for index, char in enumerate(text):
        if quoted:
            if escaped:
                escaped = False
            elif char == '\\':
                escaped = True
            elif char == '"':
                quoted = False
        elif char == '"':
            quoted = True
        elif char == '(':
            depth += 1
        elif char == ')':
            depth -= 1
        elif char == ',' and depth == 0:
            result.append(text[start:index].strip())
            start = index + 1
    if depth or quoted:
        raise ValueError('Unbalanced argument list')
    result.append(text[start:].strip())
    return result


def literal(text):
    if not re.fullmatch(r'"[^"\\]*"', text):
        raise ValueError('Expected a plain Java string literal: ' + text)
    return text[1:-1]


def member_names(expression):
    if expression.startswith('"'):
        value = literal(expression)
        return [value, value]
    match = re.fullmatch(r'name\s*\((.*)\)', expression, re.DOTALL)
    if not match:
        raise ValueError('Unsupported production member selector: ' + expression)
    parts = arguments(match.group(1))
    if len(parts) != 3 or parts[0] != 'legacy':
        raise ValueError('Unsupported production name() arguments: ' + expression)
    return [literal(parts[1]), literal(parts[2])]


def descriptor(expression, monitor_type, field_types):
    expression = expression.strip()
    if expression == 'type':
        return monitor_type
    match = re.fullmatch(r'(\w+)\.getType\(\)', expression)
    if match:
        if match.group(1) not in field_types:
            raise ValueError('Field type used before its declaration: ' + expression)
        return field_types[match.group(1)]
    match = re.fullmatch(r'([\w.]+)\.class', expression)
    if match and match.group(1) in JAVA_TYPES:
        return JAVA_TYPES[match.group(1)]
    match = re.fullmatch(r'Class\.forName\s*\((.*)\)', expression, re.DOTALL)
    if match:
        parts = arguments(match.group(1))
        if len(parts) != 3 or parts[1:] != ['false', 'loader']:
            raise ValueError('Unsupported Class.forName arguments: ' + expression)
        name = parts[0]
        if name.startswith('"'):
            return 'L' + literal(name).replace('.', '/') + ';'
        replacement = re.fullmatch(r'TYPE\.replace\s*\((.*)\)', name, re.DOTALL)
        if replacement:
            old, new = [literal(part) for part in arguments(replacement.group(1))]
            return monitor_type.replace(old, new)
    raise ValueError('Unsupported production type expression: ' + expression)


def production_contracts(source):
    text = source.read_text(encoding='utf-8')
    type_match = re.search(r'\bTYPE\s*=\s*("[^"\\]+")\s*;', text)
    if not type_match:
        raise ValueError('Monitor TYPE constant was not found')
    monitor_type = 'L' + literal(type_match.group(1)).replace('.', '/') + ';'
    access_start = text.index('private static final class Access')
    access, _ = enclosed(text, text.index('{', access_start), '{', '}')
    declarations = {}
    for kind, java_kind in [('fields', 'Field'), ('methods', 'Method')]:
        match = re.search(r'\bfinal\s+' + java_kind + r'\s+([^;]+);', access)
        if not match:
            raise ValueError('Missing Access ' + java_kind + ' declarations')
        declarations[kind] = {item.strip() for item in match.group(1).split(',')}
    if len(declarations['fields']) != 14 or len(declarations['methods']) != 13:
        raise ValueError('Expected the complete 14-field / 13-method production contract')
    if not re.search(r'return\s+legacy\s*\?\s*older\s*:\s*modern\s*;', access):
        raise ValueError('Production name() selection changed; review this parser')
    resolver = re.search(r'\bstatic\s+Access\s+resolve\s*\(', access)
    if not resolver:
        raise ValueError('Missing complete-profile Access resolver')
    resolver_body, _ = enclosed(access, access.index('{', resolver.end()), '{', '}')
    order = re.findall(r'new\s+Access\s*\(\s*loader\s*,\s*(false|true)\s*\)', resolver_body)
    if order != ['false', 'true']:
        raise ValueError('Expected complete modern profile followed by complete legacy fallback')
    route = re.search(r'route\s*=\s*legacy\s*\?\s*("[^"\\]+")\s*:\s*("[^"\\]+")\s*;', access)
    if not route:
        raise ValueError('Missing production profile labels')
    profiles = [{'route': literal(route.group(2)), 'legacy': False, 'contracts': []},
                {'route': literal(route.group(1)), 'legacy': True, 'contracts': []}]
    constructor = re.search(r'private\s+Access\s*\(\s*ClassLoader\s+loader\s*,\s*boolean\s+legacy\s*\)', access)
    if not constructor:
        raise ValueError('Missing complete-profile Access constructor')
    body, _ = enclosed(access, access.index('{', constructor.end()), '{', '}')
    field_types, seen = {}, {'fields': set(), 'methods': set()}
    for match in re.finditer(r'\b(\w+)\s*=\s*(field|method)\s*\(', body):
        role, call = match.group(1), match.group(2)
        expression, _ = enclosed(body, match.end() - 1)
        parts = arguments(expression)
        kind = 'fields' if call == 'field' else 'methods'
        if role in seen[kind] or role not in declarations[kind]:
            raise ValueError('Unexpected or duplicate production member: ' + role)
        if len(parts) < 3 or (call == 'field' and len(parts) != 3):
            raise ValueError('Unsupported production reflection call: ' + expression)
        owner = descriptor(parts[0], monitor_type, field_types)
        names = member_names(parts[1])
        value_type = descriptor(parts[2], monitor_type, field_types)
        if call == 'field':
            field_types[role] = value_type
            suffix = ':' + value_type
        else:
            suffix = '(' + ''.join(descriptor(part, monitor_type, field_types) for part in parts[3:]) + ')' + value_type
        for index, profile in enumerate(profiles):
            profile['contracts'].append({'role': role, 'class': owner, 'kind': kind,
                                         'member': names[index] + suffix,
                                         'declaredRequired': True, 'expectedStatic': False})
        seen[kind].add(role)
    if seen != declarations or any(len(profile['contracts']) != 27 for profile in profiles):
        raise ValueError('Could not read every production member mapping')
    return {'source': str(source.resolve()), 'sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
            'monitorClass': monitor_type, 'profiles': profiles}


def load_apk(path):
    definitions, locations = {}, {}
    with zipfile.ZipFile(path) as archive:
        identity = dex_reader.manifest_identity(archive.read('AndroidManifest.xml'))
        for name in archive.namelist():
            if not re.fullmatch(r'classes\d*\.dex', name):
                continue
            data = dex_reader.dex_classes(archive.read(name))
            duplicate = definitions.keys() & data.keys()
            if duplicate:
                raise ValueError('Duplicate DEX class definitions: ' + str(sorted(duplicate)))
            definitions.update(data)
            locations.update({owner: name for owner in data})
    return identity, definitions, locations


def check_apk(path, production):
    identity, definitions, locations = load_apk(path)
    profiles = []
    for profile in production['profiles']:
        checks = []
        for contract in profile['contracts']:
            row = dict(contract)
            owner, kind, signature = row['class'], row['kind'], row['member']
            flags = definitions.get(owner, {}).get(kind, {}).get(signature)
            prefix = signature.split(':', 1)[0] + ':' if kind == 'fields' else signature.split('(', 1)[0] + '('
            row.update({'definedInDex': locations.get(owner), 'accessFlags': flags,
                        'sameNamedDefinitions': sorted(member for member in definitions.get(owner, {}).get(kind, {}) if member.startswith(prefix)),
                        'pass': flags is not None and not flags & 8})
            checks.append(row)
        profiles.append({'route': profile['route'], 'legacy': profile['legacy'],
                         'checks': checks, 'pass': all(row['pass'] for row in checks)})
    selected = next((profile['route'] for profile in profiles if profile['pass']), None)
    return {'apk': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'identity': identity, 'classCount': len(definitions), 'profiles': profiles,
            'selectedRoute': selected,
            'pass': identity.get('package') == 'cn.nubia.gameassist' and selected is not None}


def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--gameassist', action='append', type=Path, required=True,
                        help='Real GameAssist APK; repeat for multiple versions')
    parser.add_argument('--source', type=Path, default=SOURCE, help='Production GamePerformanceMonitorHook.java')
    parser.add_argument('--output', type=Path, help='Optional full JSON evidence')
    args = parser.parse_args()
    production = production_contracts(args.source)
    results = [check_apk(path, production) for path in args.gameassist]
    report = {'pass': all(result['pass'] for result in results), 'production': production, 'inputs': results,
              'limitation': 'Static production mappings and real APK definitions only; no APK execution or phone behavior verification.'}
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for result in results:
        print(('PASS' if result['pass'] else 'FAIL') + ': ' + result['apk'])
        print('  Identity: ' + json.dumps(result['identity'], ensure_ascii=False))
        print('  Complete selected profile: ' + str(result['selectedRoute']))
        for profile in result['profiles']:
            print('  ' + profile['route'] + ': ' + str(sum(row['pass'] for row in profile['checks'])) + '/27 declared instance contracts')
            if not result['pass']:
                for row in profile['checks']:
                    if not row['pass']:
                        print('    Missing or incompatible: ' + json.dumps(row, ensure_ascii=False))
    print(report['limitation'])
    return 0 if report['pass'] else 1


if __name__ == '__main__':
    sys.exit(main())
