"""Extract the native island/capsule/heads-up contracts from real APKs, without claiming device support."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('island_dex', ROOT / 'tools/check-launcher-module-targets.py')
dex = importlib.util.module_from_spec(spec)
spec.loader.exec_module(dex)

TARGETS = {
    'com/zte/feature/callnotify/CallLayout': ('getCurrentVisibility', 'updateViewTypeState', 'isViewVisible', 'showView', 'resolveTopVisibleViewType', 'hasHigherPriorityViewVisible', 'getTimeCount', 'handleVisibilityChanged', 'updateVisibility', 'setVisibility', 'updateViewVisibilityFromLauncher'),
    'com/android/systemui/statusbar/notification/headsup/HeadsUpManagerImpl': ('showNotification', 'isHeadsUpEntry', 'getEntry'),
    'com/android/systemui/statusbar/policy/HeadsUpManager': ('showNotification', 'isAlerting', 'getEntry'),
    'com/android/systemui/statusbar/notification/interruption/VisualInterruptionDecisionProviderImpl': ('makeAndLogHeadsUpDecision', 'makeUnloggedHeadsUpDecision'),
    'com/android/systemui/statusbar/notification/interruption/NotificationInterruptStateProviderImpl': ('shouldHeadsUp', 'checkHeadsUp'),
    'com/android/systemui/statusbar/notification/collection/NotificationEntry': ('getSbn', 'getRanking', 'isRowDismissed', 'isRemoved', 'isCanceled', 'setInterruption'),
    'com/android/systemui/statusbar/policy/FlashlightControllerImpl': ('isEnabled', 'isAvailable', 'setFlashlight', 'addCallback', 'removeCallback'),
    'com/zte/feature/dynamicisland/DisposableIslandManager': ('showLowBatteryIsland', 'handleHeadsetIsland', 'handleBluetoothActiveDeviceChanged', 'handleBluetoothBatteryLevelChange'),
    'com/zte/feature/dynamicisland/PermanentIslandManager': ('setControlPanelExpanded', 'setQsPanelExpanded', 'onKeyguardStateChanged', 'updateIslandVisibilityFullScreenPolling'),
    'com/android/systemui/statusbar/policy/HotspotControllerImpl': ('isHotspotEnabled', 'getNumConnectedDevices', 'addCallback', 'removeCallback', 'setHotspotEnabled'),
    'com/android/systemui/screenrecord/RecordingController': ('isRecording', 'isStarting', 'stopRecording', 'addCallback', 'removeCallback'),
}

def check(apk):
    classes, resources = dex.read_apk(apk)
    contracts = {}
    for path, methods in TARGETS.items():
        owner = 'L' + path + ';'
        current = owner
        found = {}
        while current in classes:
            for signature, flags in classes[current]['methods'].items():
                if signature.split('(')[0] in methods and signature not in found:
                    found[signature] = {'owner': current, 'flags': flags}
            current = classes[current]['parent']
        contracts[path] = {'present': owner in classes, 'methods': found,
                           'fields': classes.get(owner, {}).get('fields', {}) if path.endswith(('CallLayout', 'PermanentIslandManager')) else {}}
    return {'apk': str(apk), 'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'contracts': contracts,
            'resources': sorted(name for name in resources if 'island' in name),
            'evidence': 'Offline DEX and resource inventory, not a device acceptance result'}

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--systemui', type=Path, action='append', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    results = []
    for apk in args.systemui:
        result = check(apk)
        results.append(result)
        print(apk.name, result['sha256'], flush=True)
    args.output.write_text(json.dumps(results, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
