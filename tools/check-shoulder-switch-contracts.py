"""Check shoulder switch declarations/constants in real OEM APK DEX files.

Static compatibility only. Does not install apps, open databases, run hooks,
inject input, verify Binder delivery, or validate physical keys/macro playback.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import re
import struct
import zipfile

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('shoulder_dex', ROOT / 'tools/check-launcher-module-targets.py')
DEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(DEX)
TGK = 'Lcn/nubia/tgk/'
DATA = TGK + 'data/'
CONTRACTS = []


def require(owner, kind, member, static=False, value=None):
    CONTRACTS.append({'owner': owner, 'kind': kind, 'member': member,
                      'static': static, 'expectedValue': value})


for member in ['enableTgkMap(Ljava/lang/String;I)V',
               'onStartCommand(Landroid/content/Intent;II)I', 'onDestroy()V',
               'hideTgkCaseListPopView()V', 'sendMsgDelayed(ILjava/lang/Object;I)V']:
    require(TGK + 'TgkService;', 'methods', member)
for member in ['mTgkGameInfo:' + DATA + 'TgkGameInfo;',
               'mInputManagerProxy:' + TGK + 'proxy/InputManagerProxy;',
               'mTgkCaseShowView:' + TGK + 'widget/TgkCaseShowView;',
               'mPackageName:Ljava/lang/String;', 'mHandler:Landroid/os/Handler;']:
    require(TGK + 'TgkService;', 'fields', member)
require(TGK + 'TgkMapView;', 'methods', 'initTgkMapView(Ljava/lang/String;)V')
require(TGK + 'TgkService$UiAsyncTask;', 'methods', 'doInBackground([Ljava/lang/Void;)Ljava/lang/Void;')
require(TGK + 'TgkService$DismissViewAsyncTask;', 'methods', 'doInBackground([Ljava/lang/Long;)Ljava/lang/Integer;')
for task in ['UiAsyncTask', 'DismissViewAsyncTask']:
    require(TGK + 'TgkService$' + task + ';', 'fields', 'tgkServiceWeakReference:Ljava/lang/ref/WeakReference;')
require(TGK + 'TgkService$DismissViewAsyncTask;', 'fields', 'mTgkGameInfo:' + DATA + 'TgkGameInfo;')
require(TGK + 'TgkService$WorkHandler;', 'methods', 'handleMessage(Landroid/os/Message;)V')
require(TGK + 'TgkHelper;', 'fields', 'IS_SUPPORT_MIDDLE_TGK:Z', True)
for member in ['getGameInfoForEnableTgk(Landroid/content/Context;Ljava/lang/String;)' + DATA + 'TgkGameInfo;',
               'getTgkLinkKey(JII)Ljava/lang/String;',
               'queryTgkLinkState(Landroid/content/ContentResolver;Ljava/lang/String;JI)V',
               'updateValidRect(' + DATA + 'TgkData;I)V',
               'setTgkParaToNative(' + TGK + 'proxy/InputManagerProxy;' + DATA + 'TgkData;' + DATA + 'TgkGameInfo;I)V']:
    require(TGK + 'TgkHelper;', 'methods', member, True)
for member in ['getSelectedCaseData()' + DATA + 'TgkData;']:
    require(DATA + 'TgkGameInfo;', 'methods', member)
for member in ['selectedTableId:I', 'selectedCasePosition:I', 'presetTableList:Ljava/util/ArrayList;',
               'importTableList:Ljava/util/ArrayList;']:
    require(DATA + 'TgkGameInfo;', 'fields', member)
for member in ['ID:J', 'state:I', 'packageName:Ljava/lang/String;', 'showName:Ljava/lang/String;',
               'mainSw:Z', 'optionArray:[I', 'optionSwArray:[Z',
               'pointsArray:[[Landroid/graphics/Rect;', 'rapidFireCountArray:[I',
               'sensitivityArray:[I', 'vibrateSw:Z']:
    require(DATA + 'TgkData;', 'fields', member)
provider = DATA + 'TgkDataProvider;'
require(provider, 'methods', 'call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;')
require(provider, 'methods', 'update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I')
require(provider, 'fields', 'mSqliteHelper:Landroid/database/sqlite/SQLiteOpenHelper;')
require(provider, 'fields', 'AUTHORITY:Ljava/lang/String;', True, 'cn.nubia.tgk.data.TgkDataProvider')
for name, value in [('PRESET_CASE_TABLE_NAME', 'preset_case_table'), ('IMPORT_CASE_TABLE_NAME', 'import_case_table'),
                    ('_ID', '_id'), ('TGK_CASE_STATE', 'state'), ('TGK_PACKAGE_NAME', 'package_name')]:
    require(DATA + 'TgkDataContract$TgkEntry;', 'fields', name + ':Ljava/lang/String;', True, value)
require(DATA + 'TgkSQLiteHelper;', 'methods', 'onCreate(Landroid/database/sqlite/SQLiteDatabase;)V')
require(TGK + 'proxy/InputManagerProxy;', 'methods', 'releaseTgk()V')
require(TGK + 'widget/TgkCaseShowView;', 'methods', 'setTgkCaseTvTitle(Ljava/lang/String;)V')
require('Lcn/nubia/neostore/utils/FeedUploadHelper;', 'fields', 'SPLIT:Ljava/lang/String;', True, '_')
for name, value in [('TGK_CASE_MAIN_SW', 'main_sw'), ('TGK_CASE_L_SW', 'left_sw'),
                    ('TGK_CASE_R_SW', 'right_sw'), ('TGK_CASE_M_SW', 'middle_sw'),
                    ('TGK_CASE_L_OPTION', 'left_option'), ('TGK_CASE_R_OPTION', 'right_option'),
                    ('TGK_CASE_M_OPTION', 'middle_option')]:
    require(DATA + 'TgkDataContract$TgkEntry;', 'fields', name + ':Ljava/lang/String;', True, value)

HELPER = 'Lcn/nubia/gamehelper/'
MANAGER = HELPER + 'manager/GameMotionHelperManager;'
BEAN = HELPER + 'bean/TouchKeyMapBean;'
STARTER = HELPER + 'db/GameTouchProvider$3;'
HELPER_CONTRACTS = []
for member in ['getTouchKeyBean(Ljava/lang/String;Ljava/lang/String;)' + BEAN,
               'updateTouchKeyMapSync()V', 'recoveryMotionByTouchKey(Ljava/lang/String;Ljava/lang/String;)V']:
    HELPER_CONTRACTS.append({'owner': MANAGER, 'kind': 'methods', 'member': member,
                             'static': False, 'expectedValue': None})
for owner, member, static in [(MANAGER, 'mContext:Landroid/content/Context;', True),
                              (MANAGER, 'mTouchKeyBeanMap:Ljava/util/HashMap;', False),
                              (MANAGER, 'mTouchKeyBeanMapLock:Ljava/lang/Object;', False),
                              *[(BEAN, name + ':Ljava/lang/String;', False)
                                for name in ['packageName', 'touchKeyName', 'motionName']],
                              (STARTER, 'this$0:' + HELPER + 'db/GameTouchProvider;', False),
                              (STARTER, 'val$touch_key_name:Ljava/lang/String;', False)]:
    HELPER_CONTRACTS.append({'owner': owner, 'kind': 'fields', 'member': member,
                             'static': static, 'expectedValue': None})
for owner, member in [(STARTER, 'run()V'),
                      (HELPER + 'db/GameTouchProvider;', 'call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;'),
                      (HELPER + 'db/GameTouchProvider;', 'touchKeyForStartRecovery(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;')]:
    HELPER_CONTRACTS.append({'owner': owner, 'kind': 'methods', 'member': member,
                             'static': False, 'expectedValue': None})
# Manually inspected smali paths can only attest a matching archive, not a
# differently versioned GameHelper from the fault log which was not supplied.
INSPECTED_HELPER_SHA256 = '9f0e9bda0abbd1563d50ab4974b6608b44f8b87133a10186dbc5380f422630f3'

FRAMEWORK = [
    'setTgkPoint([I[II)V', 'setTgkMode(II)V', 'setGameKeyEnable(ZLandroid/content/Context;)V',
    'setLeftTgkEnable(Z)V', 'setRightTgkEnable(Z)V',
    'setGameLeftKeyLinkFunction(I)V', 'setGameRightKeyLinkFunction(I)V', 'releaseTgk()V',
]
OPTIONAL_FRAMEWORK = ['setMiddleTgkEnable(Z)V', 'setGameMiddleKeyLinkFunction(I)V', 'setTgkRapidFireCount(II)V']


def strings(data):
    result = []
    for i in range(DEX.u32(data, 56)):
        _, start = DEX.uleb(data, DEX.u32(data, DEX.u32(data, 60) + 4 * i))
        result.append(data[start:data.index(0, start)].decode('utf-8', 'replace'))
    return result


def encoded_value(data, cursor, text):
    header = data[cursor]
    cursor += 1
    kind, size = header & 31, (header >> 5) + 1
    if kind == 0x1e:
        return None, cursor
    if kind == 0x1f:
        return bool(header >> 5), cursor
    if kind == 0x1c:
        count, cursor = DEX.uleb(data, cursor)
        result = []
        for _ in range(count):
            value, cursor = encoded_value(data, cursor, text)
            result.append(value)
        return result, cursor
    if kind == 0x1d:
        annotation_type, cursor = DEX.uleb(data, cursor)
        count, cursor = DEX.uleb(data, cursor)
        result = {'annotationType': annotation_type}
        for _ in range(count):
            name, cursor = DEX.uleb(data, cursor)
            result[text[name]], cursor = encoded_value(data, cursor, text)
        return result, cursor
    raw = int.from_bytes(data[cursor:cursor + size], 'little')
    cursor += size
    return (text[raw] if kind == 0x17 else raw), cursor


def static_values(data, definitions, text):
    types = [text[DEX.u32(data, DEX.u32(data, 68) + 4 * i)] for i in range(DEX.u32(data, 64))]
    result = {}
    for i in range(DEX.u32(data, 96)):
        offset = DEX.u32(data, 100) + 32 * i
        owner = types[DEX.u32(data, offset)]
        values_offset = DEX.u32(data, offset + 28)
        if not values_offset:
            continue
        fields = [name for name, flags in definitions[owner]['fields'].items() if flags & 8]
        count, cursor = DEX.uleb(data, values_offset)
        if count > len(fields):
            raise ValueError('Invalid DEX static values: ' + owner)
        for field in fields[:count]:
            value, cursor = encoded_value(data, cursor, text)
            result[(owner, field)] = value
    return result


def load(path):
    definitions, values, all_strings = {}, {}, set()
    identity = None
    dex_files = []
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if not re.fullmatch(r'classes[0-9]*\.dex', name):
                continue
            data = archive.read(name)
            declared = DEX.dex_classes(data)
            if definitions.keys() & declared.keys():
                raise ValueError('Duplicate DEX class definitions')
            text = strings(data)
            definitions.update(declared)
            values.update(static_values(data, declared, text))
            all_strings.update(text)
            dex_files.append(name)
        if 'AndroidManifest.xml' in archive.namelist():
            identity = DEX.manifest_identity(archive.read('AndroidManifest.xml'))
    if not dex_files:
        raise ValueError('Archive has no DEX definitions')
    return definitions, values, all_strings, identity, dex_files


def sha256(path):
    digest = hashlib.sha256()
    with path.open('rb') as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def member_checks(definitions, values, contracts):
    checks = []
    for contract in contracts:
        owner, kind, member = contract['owner'], contract['kind'], contract['member']
        declared = definitions.get(owner)
        flags = None if declared is None else declared[kind].get(member)
        found = flags is not None and bool(flags & 8) == contract['static']
        actual_value = values.get((owner, member))
        if contract['expectedValue'] is not None:
            found &= actual_value == contract['expectedValue']
        checks.append({**contract, 'pass': found, 'declaredOnly': True,
                       'actualFlags': flags, 'actualValue': actual_value if contract['expectedValue'] is not None else None})
    return checks


def check(path):
    definitions, values, text, identity, dex_files = load(path)
    checks = member_checks(definitions, values, CONTRACTS)
    provider_parent = definitions.get(provider, {}).get('parent')
    checks.append({'owner': provider, 'kind': 'parent', 'member': 'Landroid/content/ContentProvider;',
                   'actual': provider_parent, 'pass': provider_parent == 'Landroid/content/ContentProvider;'})
    for table in ['preset_case_table', 'import_case_table']:
        schemas = [s for s in text if re.search(r'CREATE\s+TABLE\s+' + table + r'\s*\(', s, re.I)]
        patterns = [r'\b_id\s+INTEGER\s+PRIMARY\s+KEY\b', r'\bstate\s+INTEGER\b', r'\bpackage_name\s+TEXT\b']
        patterns += [r'\b' + column + r'\s+INTEGER\b' for column in [
            'main_sw', 'left_sw', 'right_sw', 'middle_sw', 'left_option', 'right_option', 'middle_option']]
        matches = [s for s in schemas if all(re.search(pattern, s, re.I) for pattern in patterns)]
        checks.append({'owner': DATA + 'TgkSQLiteHelper;', 'kind': 'create_schema_string', 'member': table,
                       'pass': bool(matches), 'matchedSchemas': len(matches),
                       'limitation': 'APK SQL literals only; actual database validated in provider transaction'})
    return {'apk': str(path.resolve()), 'sha256': sha256(path), 'identity': identity,
            'dexFiles': dex_files, 'pass': all(item['pass'] for item in checks),
            'checkedContracts': len(checks), 'checks': checks}


def helper_report(path):
    definitions, values, _, identity, dex_files = load(path)
    checks = member_checks(definitions, values, HELPER_CONTRACTS)
    owner = HELPER + 'db/GameTouchProvider;'
    parent = definitions.get(owner, {}).get('parent')
    checks.append({'owner': owner, 'kind': 'parent', 'member': 'Landroid/content/ContentProvider;',
                   'actual': parent, 'pass': parent == 'Landroid/content/ContentProvider;'})
    digest = sha256(path)
    inspected = digest == INSPECTED_HELPER_SHA256
    return {'apk': str(path.resolve()), 'sha256': digest, 'identity': identity,
            'dexFiles': dex_files, 'pass': all(item['pass'] for item in checks),
            'checkedContracts': len(checks), 'checks': checks,
            'manuallyVerifiedDispatch': {'matchingInspectedApkHash': inspected,
                'path': 'GameTouchProvider.touchKeyForStartRecovery -> GameTouchProvider$3.run -> GameMotionHelperManager.recoveryMotionByTouchKey -> private getTouchKeyBean',
                'evidence': [HELPER + 'db/GameTouchProvider;->touchKeyForStartRecovery',
                             STARTER + '->run()V',
                             HELPER + 'manager/GameMotionHelperManager;->recoveryMotionByTouchKey',
                             HELPER + 'manager/GameMotionHelperManager;->getTouchKeyBean'] if inspected else [],
                'limitation': 'Dispatch bodies were manually inspected only for the exact matching SHA256. These APK member identifiers record that review; this tool does not revalidate method bodies.'}}


def framework_report(path):
    owner = 'Landroid/hardware/input/InputManager;'
    if path is None:
        return {'status': 'NOT_PROVIDED', 'owner': owner,
                'required': FRAMEWORK, 'optionalForMiddleOrRapid': OPTIONAL_FRAMEWORK,
                'limitation': 'InputManager is Android framework, not an APK-owned class; not verified from APKs'}
    definitions, _, _, _, dex_files = load(path)
    checks = []
    for member in FRAMEWORK + OPTIONAL_FRAMEWORK:
        flags = definitions.get(owner, {}).get('methods', {}).get(member)
        checks.append({'member': member, 'pass': flags is not None and not flags & 8,
                       'required': member in FRAMEWORK, 'flags': flags})
    return {'status': 'CHECKED_DECLARATIONS', 'archive': str(path.resolve()), 'sha256': sha256(path),
            'dexFiles': dex_files, 'owner': owner, 'pass': all(c['pass'] for c in checks if c['required']),
            'checks': checks, 'limitation': 'One supplied framework archive only; no live hook/Binder/driver validation'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--apk', type=Path, action='append', required=True)
    parser.add_argument('--framework', type=Path)
    parser.add_argument('--gamehelper', type=Path, action='append', default=[])
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    reports = [check(path) for path in args.apk]
    framework = framework_report(args.framework)
    helpers = [helper_report(path) for path in args.gamehelper]
    source_files = ['ShoulderQuickSwitchRuntime.java', 'ShoulderSelectionStore.java', 'ShoulderNativeApply.java', 'ShoulderMacroSwitchHook.java']
    sources = [{ 'path': str(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name),
                 'sha256': sha256(ROOT / 'android/app/src/main/java/ls/augment/com/hook' / name)} for name in source_files]
    result = {'pass': all(report['pass'] for report in reports + helpers), 'scope': 'APK_STATIC_COMPATIBILITY',
              'sources': sources, 'inputs': reports, 'gameHelperInputs': helpers, 'framework': framework,
              'limitation': 'Declared names/types/static modifiers, constants and schema SQL literals only. Not Android execution, transaction runtime, physical touch or macro playback proof.'}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    for report in reports:
        print(('PASS' if report['pass'] else 'FAIL') + ' OEM static shoulder switch contracts: '
              + str(report['identity']) + ' (' + str(report['checkedContracts']) + ' checks)')
        for item in report['checks']:
            if not item['pass']:
                print('  missing/mismatch: ' + item['owner'] + ' ' + item['member'])
    print('Framework declaration validation: ' + framework['status'])
    for report in helpers:
        print(('PASS' if report['pass'] else 'FAIL') + ' GameHelper macro contracts: '
              + str(report['identity']) + ' (' + str(report['checkedContracts']) + ' checks; inspected dispatch hash: '
              + str(report['manuallyVerifiedDispatch']['matchingInspectedApkHash']) + ')')
        for item in report['checks']:
            if not item['pass']:
                print('  missing/mismatch: ' + item['owner'] + ' ' + item['member'])
    print('LIMIT: static compatibility only; no physical-key or macro-playback validation.')
    raise SystemExit(0 if result['pass'] and framework.get('pass', True) else 1)


if __name__ == '__main__':
    main()
