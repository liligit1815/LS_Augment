"""Resolve supported wake contracts from OEM DEX, separately from device acceptance."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--systemui', type=Path, action='append', required=True)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
reports = []
for apk in args.systemui:
    classes, _ = dex.read_apk(apk)
    manager = 'Lcom/zte/feature/dynamicisland/DynamicIslandManager;'
    permanent = 'Lcom/zte/feature/dynamicisland/PermanentIslandManager;'

    def named(owner, kind, prefix):
        seen = set()
        while owner in classes and owner not in seen:
            seen.add(owner)
            members = [(name, flags) for name, flags in classes[owner][kind].items()
                       if name.startswith(prefix)]
            if members:
                return members
            owner = classes[owner]['parent']
        return []

    def instance(owner, kind, signature):
        prefix = signature[:signature.index(')') + 1] if kind == 'methods' else signature.split(':')[0] + ':'
        members = named(owner, kind, prefix)
        return len(members) == 1 and members[0][0] == signature and not members[0][1] & (8 | (1024 if kind == 'methods' else 0))

    route = next((label for label, owner in [('manager', manager), ('permanent', permanent)]
                  if instance(owner, 'methods', 'onStartedWakingUp()V')), None)
    missing = []
    if route is None:
        if any(named(owner, 'methods', 'onStartedWakingUp()') for owner in [manager, permanent]):
            missing.append('incompatible wake callback')
        if named(permanent, 'fields', 'mInteractive:'):
            missing.append('interactive engine requires native wake callback')
        for kind, names in [('fields', ['mAODVisibility:Z', 'mIsDynamicIslandEnable:Z',
                                        'mPayJoyControlled:Z', 'mCurRotation:I']),
                            ('methods', ['setAODVisibility(Z)V', 'updateRooterVisibility()V'])]:
            missing.extend(name for name in names if not instance(permanent, kind, name))
        if not missing:
            route = 'permanent_visibility'
    report = {'apk': str(apk), 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
              'route': route, 'missing': missing, 'passed': route is not None,
              'evidence': 'DEX contract only; not device acceptance'}
    reports.append(report)
    print(json.dumps(report, ensure_ascii=False))
args.output.write_text(json.dumps(reports, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
if any(not report['passed'] for report in reports):
    raise SystemExit(1)
