"""Check Extra Dim detail contracts in OEM APKs; this is not device/UI acceptance."""
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
    checks = []

    def instance(owner, signature):
        found = dex.find_member(classes, owner, 'methods', signature)
        ok = found is not None and not found[1] & (0x8 | 0x400)
        checks.append({'owner': owner, 'signature': signature, 'definedBy': found[0] if found else None, 'passed': ok})
        return ok

    custom = 'Lcom/android/systemui/qs/external/CustomTile;'
    base = 'Lcom/android/systemui/qs/tileimpl/QSTileImpl;'
    layout = 'Lcom/zte/feature/qs/layout/QsDetailModule;'
    adapter = 'Lcom/android/systemui/plugins/qs/DetailAdapter;'
    interface = bool(classes.get(adapter, {}).get('access', 0) & 0x200)
    required = [instance(custom, 'getComponent()Landroid/content/ComponentName;'),
                instance(base, 'showDetail(Z)V'), instance(base, 'fireToggleStateChanged(Z)V'),
                instance(base, 'getDetailAdapter()' + adapter),
                instance(base, 'handleLongClick(Lcom/android/systemui/animation/Expandable;)V'),
                instance(layout, 'handleShowDetailTile(Lcom/android/systemui/plugins/qs/QSTile;ZZZ)V')]
    routes = []
    for count, params in ((2, 'Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;'),
                          (1, 'Landroid/view/ViewGroup$LayoutParams;')):
        if instance(layout, 'updateDetailContainerLayout(' + params + ')V'):
            routes.append(count)
    report = {'apk': str(apk), 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
              'adapterIsInterface': interface, 'heightParameterCounts': routes, 'checks': checks,
              'passed': interface and all(required) and bool(routes),
              'evidence': 'Defined DEX contracts including inheritance; not device acceptance'}
    reports.append(report)
    print(f'{apk.name}: passed={report["passed"]}; heightParameterCounts={routes}')
args.output.parent.mkdir(parents=True, exist_ok=True)
args.output.write_text(json.dumps(reports, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
if not all(report['passed'] for report in reports):
    raise SystemExit(1)
