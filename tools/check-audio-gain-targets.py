"""Check production AudioService signatures against OEM services.jar files (offline only)."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex_reader', ROOT / 'tools/check-launcher-module-targets.py')
reader = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reader)


def production_contracts():
    source = (ROOT / 'android/app/src/main/java/ls/augment/com/hook/AudioGainTargets.java').read_text(encoding='utf-8')
    aliases = dict(re.findall(r'\b(I|Z|S|DEVICE)="([^"]+)"', source))
    primitives = {'int': 'I', 'boolean': 'Z', 'void': 'V'}

    def descriptor(value):
        value = aliases.get(value, value.strip('"'))
        return primitives.get(value, 'L' + value.replace('.', '/') + ';')

    contracts = {}
    for name, body in re.findall(r'case "([^"]+)":(.*?)(?=\s*case "|\s*\n        })', source, re.S):
        contracts[name] = [name + '(' + ''.join(descriptor(p) for p in params.split(',')) + ')' + descriptor(result)
                           for result, params in re.findall(r'signature\(method,(\w+)\.class,([^)]*)\)', body)]
    assert len(contracts) == 8 and all(contracts.values()), contracts
    return contracts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--services', type=Path, action='append', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    contracts = production_contracts()
    results = []
    for path in args.services:
        definitions = {}
        with zipfile.ZipFile(path) as archive:
            for name in archive.namelist():
                if re.fullmatch(r'classes\d*\.dex', name):
                    definitions.update(reader.dex_classes(archive.read(name)))
        methods = {}
        name = 'Lcom/android/server/audio/AudioService;'
        while name in definitions:
            definition = definitions[name]
            for method, flags in definition['methods'].items():
                methods.setdefault(method, flags)
            name = definition['parent']
        matched = {name: [m for m in candidates if m in methods and not methods[m] & 8]
                   for name, candidates in contracts.items()}
        missing = [name for name, candidates in matched.items() if not candidates]
        results.append({'services': str(path.resolve()), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                        'pass': not missing, 'matched': matched, 'missing': missing})
        print('FAIL' if missing else 'PASS', path, 'missing=' + str(missing), matched['adjustStreamVolume'])
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps({'validation': 'OEM interface evidence only; no device execution', 'results': results},
                                      ensure_ascii=False, indent=2), encoding='utf-8')
    if any(not result['pass'] for result in results):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
