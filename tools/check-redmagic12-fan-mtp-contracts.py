"""Read-only DEX contracts for the audited fan service, fan panel and framework MTP.

This verifies signatures, staticness, field types and ancestry, not device behavior.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('dex_contracts', ROOT/'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)


def read(path):
    classes = {}
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if name.endswith('.dex'):
                classes.update(dex.dex_classes(archive.read(name)))
    return classes


def inspect(rom):
    paths = {
        'framework': rom/'files/system_b/system/framework/framework.jar',
        'fan': rom/'files/system_b/system/priv-app/NBFan/NBFan.apk',
        'mtp': rom/'files/system_b/system/priv-app/MtpService/MtpService.apk',
        'systemui': rom/'files/system_ext_b/priv-app/SystemUI_MFV/SystemUI_MFV.apk',
    }
    sources = {name: read(path) for name, path in paths.items()}
    checks = []
    def member(source, owner, signature, static=False, field=False):
        classes = sources['framework'] | sources[source]
        actual = dex.find_member(classes, owner, 'fields' if field else 'methods', signature)
        ok = actual is not None and bool(actual[1]&8) == static and (field or not actual[1]&0x400)
        checks.append(dict(source=source, owner=owner, member=signature, passed=bool(ok), definedBy=actual[0] if actual else None))
    def ancestor(source, owner, expected):
        classes = sources['framework'] | sources[source]
        current, seen = owner, set()
        while current in classes and current not in seen and current != expected:
            seen.add(current)
            current = classes[current]['parent']
        checks.append(dict(source=source, owner=owner, ancestor=expected, passed=current == expected))
    controller = 'Lcn/nubia/fan/policy/FanControllerImpl;'
    state = 'Lcn/nubia/fan/bean/FanState;'
    for signature in ['start()V', 'notifyCubeFan()V', 'setFanEnable(Z)V', 'onShutDown()V',
                      'fanMaxSpeed()V', 'cancelFanFullSpeed()V', 'notifyFanStateChanged()V', 'handleUpdateTheStateOfFan()V']:
        member('fan', controller, signature)
    for signature in ['mCurrentFanState:'+state, 'mLastFanEnable:Z', 'mShutDown:Z', 'mHandler:Landroid/os/Handler;']:
        member('fan', controller, signature, field=True)
    for name in ['isScreenUnlocked', 'isCalling', 'isQuickCharge']:
        member('fan', state, name+'()Z')
    for signature in ['setNodeValue(Ljava/lang/String;Ljava/lang/String;)V', 'readNodeValue(Ljava/lang/String;)Ljava/lang/String;']:
        member('fan', 'Lcn/nubia/fan/util/Utils;', signature, static=True)
    panel = 'Lcom/zte/mifavor/views/CoolingFanPanel;'
    tile = 'Lcom/zte/qs/tiles/CoolingFanTile;'
    ancestor('systemui', panel, 'Landroid/view/ViewGroup;')
    for signature in ['onFinishInflate()V', 'updatePanel(Ljava/lang/String;Ljava/util/List;Z)V', 'updateDataSwitch()V',
                      'updateSwitchVisibility(Z)V', 'onClick(Landroid/view/View;)V']:
        member('systemui', panel, signature)
    for signature in ['mModeCheck1:Lcom/zte/mifavor/widget/CheckedTextViewZTE;', 'mModeCheck2:Lcom/zte/mifavor/widget/CheckedTextViewZTE;',
                      'mEditContainer:Landroid/widget/LinearLayout;', 'mEmptyDesc:Landroid/widget/TextView;']:
        member('systemui', panel, signature, field=True)
    ancestor('systemui', 'Lcom/zte/mifavor/widget/CheckedTextViewZTE;', 'Landroid/widget/CheckedTextView;')
    for signature in ['handleSetListening(Z)V', 'onChanged()V',
                      'handleUpdateState(Lcom/android/systemui/plugins/qs/QSTile$BooleanState;Ljava/lang/Object;)V']:
        member('systemui', tile, signature)
    member('systemui', tile, 'mContext:Landroid/content/Context;', field=True)
    for signature in ['value:Z', 'label:Ljava/lang/CharSequence;']:
        member('systemui', 'Lcom/android/systemui/plugins/qs/QSTile$BooleanState;', signature, field=True)
    service = 'Lcom/android/mtp/MtpService;'
    ancestor('mtp', service, 'Landroid/app/Service;')
    member('mtp', service, 'mPtpMode:Z', field=True)
    member('mtp', service, 'onStartCommand(Landroid/content/Intent;II)I')
    member('mtp', service, 'onDestroy()V')
    member('framework', 'Landroid/mtp/MtpServer;', 'addStorage(Landroid/mtp/MtpStorage;)V')
    member('framework', 'Landroid/mtp/MtpServer;', 'mContext:Landroid/content/Context;', field=True)
    member('framework', 'Landroid/mtp/MtpStorage;', 'mDescription:Ljava/lang/String;', field=True)
    member('framework', 'Landroid/mtp/MtpStorage;', 'getVolumeName()Ljava/lang/String;')
    member('framework', 'Landroid/mtp/MtpStorage;', 'isRemovable()Z')
    return dict(passed=all(c['passed'] for c in checks), deviceValidated=False,
                artifacts={n: dict(path=str(p), sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for n,p in paths.items()}, checks=checks)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rom', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    report = inspect(args.rom)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(('PASS' if report['passed'] else 'FAIL'), len(report['checks']), 'fan/MTP contracts; device behavior unverified')
    for check in report['checks']:
        if not check['passed']: print(check)
    raise SystemExit(0 if report['passed'] else 1)
