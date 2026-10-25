#!/usr/bin/env python3
"""Verify Atomic Workbench's named Amap hooks against actual APK definitions.

Usage: python tools/check-amap-workbench-targets.py AMAP.apk [--json REPORT.json]
This checks declared Java methods and access flags, not callback frequency or
whether ordinary phone navigation emits any particular guidance message.
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
SPEC = importlib.util.spec_from_file_location(
    'workbench_dex_reader', ROOT / 'tools/check-launcher-module-targets.py')
READER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(READER)


def contracts():
    return {
        'Lcom/autonavi/bundle/routecommon/ajx/ModuleRoute;': [
            'notifyNaviInfo(Lorg/json/JSONObject;)V',
        ],
        'Lcom/amap/bundle/drive/carprojection/module/AjxModuleCarProjection;': [
            'notifyOngoingCard(Ljava/lang/String;)V',
            'notifyNaviStopped()V',
        ],
        'Lcom/amap/bundle/drive/ajx/module/ModuleDriveNavi;': [
            'doNaviFinish(Ljava/lang/String;)V',
        ],
        'Lcom/autonavi/minimap/ajx3/modules/ModuleNavi;': [
            'playTTS(Ljava/lang/String;)V',
        ],
        'Lcom/amap/bundle/audio/AudioEventBroadcast;': [
            'onEvent(IILcom/autonavi/jni/tts/AudioPlayerTask;I)V',
        ],
        'Lcom/amap/bundle/drive/navi/drivenavi/normal/page/AjxRouteCarNaviPage;': [
            'onAjxContxtCreated(Lcom/autonavi/minimap/ajx3/context/IAjxContext;)V',
            'destroy()V',
        ],
        'Lcom/amap/bundle/wearable/connect/glass/AmapLinkService;': [
            'd(Ljava/lang/String;)V',
        ],
        'Lcom/amap/linksdk/aidldefine/ILinkSdkControl;': [
            'authenticate()Ljava/lang/String;',
            'registerListener(Lcom/amap/linksdk/aidldefine/ILinkSdkCallback;)Z',
            'unregisterListener(Lcom/amap/linksdk/aidldefine/ILinkSdkCallback;)Z',
        ],
        'Lcom/amap/linksdk/aidldefine/ILinkSdkCallback;': [
            'onAmapCallback(Ljava/lang/String;)V',
            'onAmapCallbackWithFd(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;)V',
        ],
    }


def inspect(path):
    classes = {}
    car_broadcast_action = False
    with zipfile.ZipFile(path) as apk:
        identity = READER.manifest_identity(apk.read('AndroidManifest.xml'))
        for name in apk.namelist():
            if not re.fullmatch(r'classes[0-9]*\.dex', name):
                continue
            data = apk.read(name)
            definitions = READER.dex_classes(data)
            duplicates = classes.keys() & definitions.keys()
            if duplicates:
                raise ValueError('Duplicate classes: ' + str(sorted(duplicates)))
            classes.update(definitions)
            car_broadcast_action |= b'AUTONAVI_STANDARD_BROADCAST_SEND' in data

    checks = [{
        'check': 'package', 'expected': 'com.autonavi.minimap',
        'actual': identity.get('package'),
        'pass': identity.get('package') == 'com.autonavi.minimap',
    }]
    for owner, methods in contracts().items():
        declared = classes.get(owner, {}).get('methods', {})
        for signature in methods:
            access = declared.get(signature)
            checks.append({
                'class': owner, 'method': signature, 'accessFlags': access,
                'declaredRequired': True, 'expectedPublic': True,
                'expectedStatic': False,
                'pass': access is not None and bool(access & 1) and not bool(access & 8),
            })
    task = 'Lcom/autonavi/jni/tts/AudioPlayerTask;'
    declared_fields = classes.get(task, {}).get('fields', {})
    for signature in ('data:Ljava/lang/String;', 'taskType:S'):
        access = declared_fields.get(signature)
        checks.append({
            'class': task, 'field': signature, 'accessFlags': access,
            'declaredRequired': True, 'expectedPublic': True,
            'expectedStatic': False,
            'pass': access is not None and bool(access & 1) and not bool(access & 8),
        })

    return {
        'apk': str(path.resolve()),
        'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
        'identity': identity, 'classes': len(classes),
        'carBroadcastActionInDexStrings': car_broadcast_action,
        'checks': checks, 'pass': all(row['pass'] for row in checks),
        'limitation': 'Static definitions only; phone guidance delivery requires device verification.',
    }


def main():
    if hasattr(sys.stdout, 'reconfigure'):
        sys.stdout.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--json', type=Path, help='Optional full result file')
    args = parser.parse_args()
    report = inspect(args.apk)
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(('PASS' if report['pass'] else 'FAIL') + ': ' + report['apk'])
    print('  Identity: ' + json.dumps(report['identity'], ensure_ascii=False))
    print('  SHA-256: ' + report['sha256'])
    print('  %d package/method/field checks' % len(report['checks']))
    for row in report['checks']:
        if not row['pass']:
            print('  Missing or incompatible: ' + json.dumps(row, ensure_ascii=False))
    print(report['limitation'])
    return 0 if report['pass'] else 1


if __name__ == '__main__':
    sys.exit(main())
