"""Conservative source guard for the audited Android Settings write boundaries.

This complements the executable persistence/recovery tests. It rejects a new
write boundary for review instead of pretending to perform Java dataflow analysis.
Read-only platform access and explicit legacy deletion remain permitted.
"""
from pathlib import Path
import json
import re

ROOT = Path(__file__).resolve().parent.parent
MAIN = ROOT / 'android/app/src/main'
JAVA = MAIN / 'java/ls/augment/com'
checks = 0


def require(condition, message):
    global checks
    checks += 1
    if not condition:
        raise AssertionError(message)


LEXEME = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|//[^\n]*|/\*[\s\S]*?\*/')
STRING = re.compile(r'"(?:\\.|[^"\\])*"')


def uncomment(text):
    return LEXEME.sub(lambda m: ('\n' * m.group().count('\n') if m.group().startswith(('//', '/*'))
                                else m.group()), text)


def code(path):
    return uncomment(path.read_text(encoding='utf-8-sig'))


def literals(text):
    result = []
    for found in STRING.finditer(text):
        try:
            result.append(json.loads(found.group()))
        except ValueError:
            result.append(found.group()[1:-1])
    return result


def arguments(text, opening):
    """Read a Java call without confusing nested calls, strings, or commas."""
    depth = 0
    start = opening + 1
    values = []
    pos = opening
    while pos < len(text):
        quoted = LEXEME.match(text, pos)
        if quoted:
            pos = quoted.end()
            continue
        char = text[pos]
        if char in '([{':
            depth += 1
        elif char in ')]}':
            depth -= 1
            if depth == 0:
                values.append(text[start:pos].strip())
                return values
        elif char == ',' and depth == 1:
            values.append(text[start:pos].strip())
            start = pos + 1
        pos += 1
    raise AssertionError('Unclosed Settings call')


DIRECT = re.compile(r'\b(?:android\.provider\.)?Settings\.(System|Secure|Global)\.'
                    r'(put\w*|set\w*)\s*\(')
NATIVE_DIRECT = {('System', 'adb_install_enabled'), ('Global', 'game_gfrc_mode')}
LEGACY_GFRC = 'redmagic_duo_native_gfrc_recovery_v1'
DIRECT_FILES = {'hook/ConnectionExtrasHook.java', 'hook/SuperResolutionRuntimeHook.java', 'hook/NativeIslandSettingsHook.java'}
SHELL_FILES = {'ModuleSystemSettings.java', 'ModuleExternalReset.java'}


def direct_writes(text):
    constants = dict(re.findall(r'\b(?:static\s+)?final\s+String\s+(\w+)\s*=\s*"([^"\\]+)"', text))
    values = []
    for call in DIRECT.finditer(text):
        args = arguments(text, call.end() - 1)
        if len(args) < 3:
            raise AssertionError('Unknown Settings writer signature')
        key = args[1]
        if re.fullmatch(r'"[^"\\]+"', key):
            key = json.loads(key)
        else:
            key = constants.get(key, '<dynamic:' + key + '>')
        values.append((call.group(1), key, args[2], call.group(2)))
    return values


def permitted_direct(write):
    namespace, key, value, method = write
    # putString(null) can retain a Settings row with a null value on the device.
    # Legacy retirement must use the exact provider delete boundary below.
    return ((namespace, key) in NATIVE_DIRECT and method in ('putInt', 'putString')
            or (namespace,key,method,value)==('System','dynamic_island_switch_state','putInt','0'))


PROVIDER_OPERATION = re.compile(r'\.(query|delete|insert|update|bulkInsert)\s*\(')
SETTINGS_URI = re.compile(r'\b(?:android\.provider\.)?Settings\.(System|Secure|Global)\.(CONTENT_URI|getUriFor)\b')


def provider_operations(text):
    operations = []
    for call in PROVIDER_OPERATION.finditer(text):
        args = arguments(text, call.end() - 1)
        if args and SETTINGS_URI.search(args[0]):
            operations.append((call.group(1), args))
    return operations


def permitted_provider(operation):
    method, raw_args = operation
    args = [re.sub(r'\s+', '', arg) for arg in raw_args]
    if not args or args[0] != 'Settings.Global.CONTENT_URI':
        return False
    if method == 'delete':
        return args == ['Settings.Global.CONTENT_URI', '"name=?"', 'newString[]{LEGACY_KEY}']
    if method == 'query':
        return args == ['Settings.Global.CONTENT_URI', 'newString[]{"name"}',
                        '"name=?"', 'newString[]{LEGACY_KEY}', 'null']
    return False


def shell_writer(text):
    fragments = literals(text)
    has_settings = any(re.search(r'\bsettings(?:\s|$)', s) for s in fragments)
    # Includes split commands such as `settings --user` + ... + ` put `.
    has_put = any(re.search(r'(?:^|\s)put(?:\s|$)', s) for s in fragments)
    return has_settings and has_put


sources = {str(path.relative_to(JAVA)).replace('\\', '/'): code(path)
           for path in JAVA.rglob('*.java')}
observed_direct, observed_shell = set(), set()
for name, text in sources.items():
    for write in direct_writes(text):
        observed_direct.add(name)
        require(name in DIRECT_FILES and permitted_direct(write),
                f'Unaudited Settings write in {name}: {write}')
        if write[1]=='dynamic_island_switch_state':
            require(name=='hook/NativeIslandSettingsHook.java' and 'if(ok)' in text
                    and 'if(generation!=GENERATION.get())return;' in text,
                    'OEM island rollback must remain confined to the failed current selection')
    provider = provider_operations(text)
    for operation in provider:
        require(name == 'hook/GfrcRecoveryClient.java' and permitted_provider(operation),
                f'Unaudited Settings provider operation in {name}: {operation}')
    uri_references = re.findall(r'\b(?:android\.provider\.)?Settings\.(?:System|Secure|Global)\.CONTENT_URI\b', text)
    require(len(uri_references) == len(provider),
            f'Settings provider URI must not escape into an unaudited alias or operation: {name}')
    if shell_writer(text):
        observed_shell.add(name)
        require(name in SHELL_FILES, f'Unaudited shell Settings writer: {name}')
    require(not re.search(r'import\s+static\s+android\.provider\.Settings', text),
            f'Static Settings alias bypasses the audited boundary: {name}')
    require(not re.search(r'import\s+android\.provider\.Settings\.(?:System|Secure|Global)', text),
            f'Nested Settings import bypasses the audited boundary: {name}')
    fragments = literals(text)
    if any('android.provider.Settings' in s for s in fragments) or 'Settings.' in text:
        require(not any(re.fullmatch(r'(?:put|set)(?:String|Int|Long|Float)(?:ForUser)?', s)
                        for s in fragments), f'Reflective Settings writer requires review: {name}')
    require(not any(re.match(r'PUT_(?:global|secure|system)(?:$|\W)', s) for s in fragments),
            f'Raw Settings provider mutation requires review: {name}')
    if any(s.startswith('content://settings') or '@settings/' in s for s in fragments):
        require(name in {'hook/ExtraDimHook.java', 'hook/ExtraDimOwnershipClient.java'}
                and 'GET_secure' in fragments,
                f'Unknown direct Settings provider access: {name}')
    require(not re.search(r'\bMODE_WORLD_(?:READABLE|WRITEABLE|WRITABLE)\b', text),
            f'Application state must not be world accessible: {name}')
require(observed_direct <= DIRECT_FILES, 'Direct Settings writer inventory changed')
require(observed_shell == SHELL_FILES, 'Root Settings writer inventory changed; review the new boundary')
gfrc = sources['hook/GfrcRecoveryClient.java']
require(re.search(r'final\s+String\s+LEGACY_KEY\s*=\s*"' + re.escape(LEGACY_GFRC) + r'"\s*;', gfrc),
        'GFRC provider deletion must retain the exact obsolete module key')
require({method for method, args in provider_operations(gfrc)} == {'query', 'delete'},
        'GFRC cleanup must delete the exact row and query for absence, not merely read its null value')

# Native settings are a closed set in the only generic shell write adapter.
system = sources['ModuleSystemSettings.java']
# This key is the OEM System setting that selects the physical competitive key's
# original operation. Clearing it to 0 and restoring the owned original value are
# native device operations; the feature configuration and recovery record remain
# in module-private preferences, never in this Settings row.
expected = {'global', 'system', 'secure', 'development_settings_enabled', 'adb_enabled',
            'adb_install_enabled', 'lock_refresh_rate', 'reduce_bright_colors_activated',
            'reduce_bright_colors_level', 'ls_augment_extra_dim_owned',
            'fourth_physical_key_function_value'}
allowed_start = system.index('boolean allowed(')
allowed_end = system.index('\n    }', allowed_start)
require(set(literals(system[allowed_start:allowed_end])) == expected,
        'Settings address allowlist changed; classify the new key before admitting it')
requested_start = system.index('boolean validRequested(')
requested_end = system.index('\n        }', requested_start)
require(re.search(r'if\s*\(\s*address\.key\.equals\("fourth_physical_key_function_value"\)\s*\)\s*return\s+value\.equals\("0"\)\s*;',
                  system[requested_start:requested_end]),
        'Competitive-key requests may only clear the OEM operation; owned recovery restores the original')
root_io = system[system.index('class RootIo'):]
require(re.search(r'if\s*\(\s*address\.metadata\(\)\s*&&\s*value\s*!=\s*null\s*\)\s*return\s+false\s*;', root_io),
        'Generic RootIo must reject every non-null legacy metadata write')
require('context.getApplicationContext().getSharedPreferences(PREFS, 0)' in system,
        'System-setting recovery records must remain module-private')
dim_start = system.index('WriteResult setExtraDim(')
dim_end = system.index('\n    }', dim_start)
require('ls_augment_extra_dim_owned' not in system[dim_start:dim_end],
        'Extra dim must not add a system Settings ownership marker')
ownership_start = system.index('android.os.Bundle extraDimOwnership(')
ownership_end = system.index('\n    }', ownership_start)
require('migrateExtraDimOwnership' not in system[ownership_start:ownership_end]
        and 'RootShell' not in system[ownership_start:ownership_end],
        'A background ownership query must not initiate Root authorization')

# The other dynamic shell writer exists only to update the native tile list.
external = sources['ModuleExternalReset.java']
for fragment in literals(external):
    if re.search(r'(?:^|\s)put(?:\s|$)', fragment):
        require(re.fullmatch(r'\s*put secure sysui_qs_tiles\s*', fragment),
                'Reset shell writer must be limited to the native QS tile list')

# Retired external boot snapshots cannot become an active persistence route again.
for name, text in sources.items():
    require(not re.search(r'BootConfigMirror\s*\.\s*shellWrite\s*\(', text),
            f'Retired boot mirror writer is in use: {name}')
feature = sources['hook/FeatureSettings.java']
require('Settings.Global.' not in feature and 'Settings.Secure.' not in feature
        and 'Settings.System.' not in feature, 'FeatureSettings must use module/framework storage')
require('"diagnostic"' in feature and '"content://ls.augment.com.config"' in feature,
        'Diagnostic publication must target the module provider')
framework = sources['FrameworkConfigSync.java']
require('service.getRemotePreferences(RemoteConfig.GROUP)' in framework,
        'Boot-time configuration must use the official framework preference interface')

# No hidden native/asset shell write boundary may be introduced outside Java.
other = list((MAIN / 'assets').rglob('*.sh')) + list((MAIN / 'cpp').rglob('*'))
for path in other:
    if not path.is_file():
        continue
    text = uncomment(path.read_text(encoding='utf-8-sig'))
    require(not re.search(r'\bsettings\b', text) and 'content://settings' not in text,
            f'New native/asset Settings boundary requires review: {path.relative_to(MAIN)}')
require(not list((MAIN / 'java').rglob('*.kt')), 'Add Kotlin Settings sink scanning before admitting Kotlin production sources')

# Negative controls prove the policy checks reject direct, split-shell, and
# metadata-write variants rather than merely finding current source strings.
for sample in (
        'Settings.System.putInt(resolver, "dynamic_island_switch_state", 1);',
        'Settings.System.putInt(resolver, "dynamic_island_switch_state", enabled);',
        'Settings.Global.putString(resolver, "ls_augment_test", value);',
        'Settings.Secure.putInt(resolver, dynamicKey(), 1);',
        'final String K="redmagic_duo_native_gfrc_recovery_v1"; Settings.Global.putString(r, K, payload);',
        'Settings.Global.putString(r, "redmagic_duo_native_gfrc_recovery_v1", nullableValue);',
        'Settings.Global.putString(r, "redmagic_duo_native_gfrc_recovery_v1", null);'):
    require(any(not permitted_direct(w) for w in direct_writes(sample)), 'Direct sink negative control failed')
require(shell_writer('run("settings --user " + user + " put " + namespace + " " + key);'),
        'Split shell writer negative control failed')
for sample in (
        'r.delete(Settings.Global.CONTENT_URI, null, null);',
        'r.delete(Settings.Global.CONTENT_URI, "name=?", new String[]{otherKey});',
        'r.delete(Settings.Global.CONTENT_URI, "name LIKE ?", new String[]{LEGACY_KEY});',
        'r.insert(Settings.Global.CONTENT_URI, values);',
        'r.update(Settings.Global.CONTENT_URI, values, "name=?", new String[]{LEGACY_KEY});',
        'r.delete(Settings.Secure.CONTENT_URI, "name=?", new String[]{LEGACY_KEY});'):
    require(any(not permitted_provider(operation) for operation in provider_operations(sample)),
            'Settings provider mutation negative control failed')
for sample in (
        'r.delete(Settings.Global.CONTENT_URI, "name=?", new String[]{LEGACY_KEY});',
        'r.query(Settings.Global.CONTENT_URI, new String[]{"name"}, "name=?", new String[]{LEGACY_KEY}, null);'):
    require(all(permitted_provider(operation) for operation in provider_operations(sample)),
            'Exact legacy row delete/query must remain permitted')
require(arguments('f(a(), "x,y", g(1, 2))', 1) == ['a()', '"x,y"', 'g(1, 2)'],
        'Nested call scanner failed')
print(f'PASS Settings private-storage boundary: {checks} checks, {len(sources)} production Java sources')
