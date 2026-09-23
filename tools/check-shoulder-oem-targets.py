"""Check real OEM DEX definitions using the production shoulder target resolver.

The small Java fixtures preserve the APK's names, parameter/return types and
static modifiers. This checks interface compatibility, not Android execution.
Example: --gameassist old.apk --gameassist new.apk --gamespace space.apk
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex_reader', ROOT / 'tools/check-launcher-module-targets.py')
dex_reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex_reader)
HELPER = ROOT / 'android/app/src/main/java/ls/augment/com/hook/ShoulderHookTargets.java'
TYPES = {'V': 'void', 'Z': 'boolean', 'I': 'int', 'Ljava/lang/String;': 'String',
         '[Ljava/lang/String;': 'String[]', 'Ljava/util/List;': 'List',
         'Landroid/content/Context;': 'Context', 'Landroid/view/View;': 'View',
         'Landroid/view/ViewGroup;': 'ViewGroup'}
ASSIST = {
    'Plugin': ('Lcn/nubia/gameassist/plugin/config/PluginConfig;',
               {'d', 'k', 'l', 'g', 'getBlackList', 'isPluginEnable', 'getPluginList'}, set()),
    'Toolbar': ('Lcn/nubia/gameassist/operation/SubViewController;', {'V', 'initView'}, {'t', 'mKeys'}),
}
SPACE = {'Service': ('Lcn/nubia/tgk/TgkService;', {'onTgkCaseViewBottonClick'}, set())}


def load_apk(path):
    definitions = {}
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if re.fullmatch(r'classes\d*\.dex', name):
                definitions.update(dex_reader.dex_classes(archive.read(name)))
    return definitions


def fixture(name, definition, method_names, field_names):
    lines = ['static class ' + name + ' {']
    evidence = {'methods': {}, 'fields': {}}
    for signature, flags in definition['methods'].items():
        method, rest = signature.split('(', 1)
        if method not in method_names:
            continue
        evidence['methods'][signature] = flags
        parameters, result = rest.split(')')
        descriptors = re.findall(r'\[*L[^;]+;|\[*[VZBSCIJFD]', parameters)
        if result not in TYPES or any(item not in TYPES for item in descriptors):
            continue  # Unsupported shapes remain in evidence, never guessed.
        args = ', '.join(TYPES[item] + ' p' + str(i) for i, item in enumerate(descriptors))
        body = '' if result == 'V' else 'return false;' if result == 'Z' else 'return 0;' if result == 'I' else 'return null;'
        lines.append(('static ' if flags & 8 else '') + TYPES[result] + ' ' + method + '(' + args + ') {' + body + '}')
    for signature, flags in definition['fields'].items():
        field, kind = signature.split(':')
        if field in field_names:
            evidence['fields'][signature] = flags
            if kind in TYPES:
                lines.append(('static ' if flags & 8 else '') + TYPES[kind] + ' ' + field + ';')
    lines.append('}')
    return '\n'.join(lines), evidence


HARNESS = '''package ls.augment.com.hook;
import java.lang.reflect.*;
import java.util.List;
public class TestRealShoulderTargets {
    static class Context { }
    static class View { }
    static class ViewGroup extends View { }
    // FIXTURES
    static void found(String label, Member member) {
        if (member == null) throw new AssertionError("Missing OEM target " + label);
        System.out.println(label + " -> " + member);
    }
    public static void main(String[] args) {
        // CHECKS
        System.out.println("PASS real OEM shoulder interfaces");
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--gameassist', action='append', type=Path, default=[])
    parser.add_argument('--gamespace', action='append', type=Path, default=[])
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    if not args.gameassist and not args.gamespace:
        parser.error('Supply at least one real APK')
    records, fixtures, checks = [], [], []
    for kind, paths, targets in [('assist', args.gameassist, ASSIST), ('space', args.gamespace, SPACE)]:
        for path in paths:
            data = load_apk(path)
            index = len(records)
            record = {'apk': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(), 'targets': {}}
            for role, (owner, methods, fields) in targets.items():
                if owner not in data:
                    raise AssertionError(str(path) + ': missing class ' + owner)
                declaration, evidence = fixture(role + str(index), data[owner], methods, fields)
                fixtures.append(declaration)
                record['targets'][owner] = evidence
            label = kind + str(index)
            if kind == 'assist':
                for target, method in [('blacklist', 'pluginBlacklist'), ('enabled', 'pluginEnabled'),
                                       ('eligibility', 'pluginEligibility'), ('list', 'pluginList')]:
                    checks.append('found("' + label + '.' + target + '", ShoulderHookTargets.' + method + '(Plugin' + str(index) + '.class, Context.class));')
                checks.append('Method bind' + str(index) + ' = ShoulderHookTargets.toolbarBind(Toolbar' + str(index) + '.class, ViewGroup.class);')
                checks.append('found("' + label + '.toolbar", bind' + str(index) + ');')
                checks.append('found("' + label + '.button", ShoulderHookTargets.toolbarButton(Toolbar' + str(index) + '.class, bind' + str(index) + ', View.class));')
            else:
                checks.append('found("' + label + '.click", ShoulderHookTargets.quickSwitchClick(Service' + str(index) + '.class));')
            records.append(record)
    with tempfile.TemporaryDirectory(prefix='ls-oem-shoulder-') as temp:
        java = Path(temp) / 'TestRealShoulderTargets.java'
        java.write_text(HARNESS.replace('// FIXTURES', '\n'.join(fixtures)).replace('// CHECKS', '\n'.join(checks)), encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, str(HELPER), str(java)], check=True)
        result = subprocess.run(['java', '-cp', temp, 'ls.augment.com.hook.TestRealShoulderTargets'], check=True, capture_output=True, text=True)
        print(result.stdout, end='')
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps({'inputs': records, 'resolver_results': result.stdout.splitlines(),
                                         'limitation': 'Static signatures and resolver execution only; no device behavior validation.'},
                                        ensure_ascii=False, indent=2), encoding='utf-8')


if __name__ == '__main__':
    main()
