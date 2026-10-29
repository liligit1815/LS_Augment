#!/usr/bin/env python3
from pathlib import Path
import re
import sys
import zipfile


def scope_packages(text, label):
    packages = [line.strip() for line in text.splitlines()
                if line.strip() and not line.lstrip().startswith('#')]
    assert packages, f'{label}: empty scope'
    assert len(packages) == len(set(packages)), f'{label}: duplicate scope entries'
    assert all(re.fullmatch(r'[a-z][A-Za-z0-9_.]*', package) for package in packages), \
        f'{label}: invalid scope entry'
    return set(packages)


def same_scope(actual, expected, label):
    assert actual == expected, \
        f'{label}: missing={sorted(expected - actual)}, extra={sorted(actual - expected)}'

root = Path(__file__).resolve().parents[1]
app = root / 'android/app'
entry = app / 'src/main/resources/META-INF/xposed/java_init.list'
native_entry = app / 'src/main/resources/META-INF/xposed/native_init.list'
scope = app / 'src/main/resources/META-INF/xposed/scope.list'
prop = app / 'src/main/resources/META-INF/xposed/module.prop'
gradle = app / 'build.gradle'
manifest = app / 'src/main/AndroidManifest.xml'
source = app / 'src/main/java/ls/augment/com/hook/AugmentModule.java'

assert entry.read_text(encoding='utf-8').strip() == 'ls.augment.com.hook.AugmentModule'
assert native_entry.read_text(encoding='utf-8').strip() == 'liblsaugment_tgk.so'
registry = app / 'src/main/java/ls/augment/com/HookTargetRegistry.java'
registered_packages = scope_packages('\n'.join(re.findall(r'"([a-z][A-Za-z0-9_.]+)"',
    registry.read_text(encoding='utf-8'))), 'HookTargetRegistry')
declared_packages = scope_packages(scope.read_text(encoding='utf-8'), 'source scope.list')
same_scope(declared_packages, registered_packages, 'source scope vs Provider/package authorization registry')
props = {}
for line in prop.read_text(encoding='utf-8').splitlines():
    line=line.strip()
    if not line or line.startswith('#'): continue
    k,v=line.split('=',1); props[k]=v
assert props.get('minApiVersion') == '102'
assert props.get('targetApiVersion') == '102'
assert props.get('staticScope') == 'true'
assert set(props) == {'minApiVersion', 'targetApiVersion', 'staticScope'}, props

g = gradle.read_text(encoding='utf-8')
# The production dependency and instrumentation fixture share one pinned version.
# Resolve that declaration instead of requiring the former inline dependency.
api_version = re.search(r"def\s+libxposedApiVersion\s*=\s*['\"]([^'\"]+)['\"]", g)
assert api_version and api_version[1] == '102.0.0', 'libxposed API must stay pinned to 102.0.0'
assert re.search(r'compileOnly\s+"io\.github\.libxposed:api:\$\{libxposedApiVersion\}"', g), \
    'production libxposed API must remain compile-only'
assert 'de.robv.android.xposed' not in g
# versionCode/versionName are derived from android/version.properties at
# configuration time; the source-side diagnostic version must follow the APK.
vp = {}
for line in (root / 'android' / 'version.properties').read_text(encoding='utf-8').splitlines():
    line = line.strip()
    if line and not line.startswith('#') and '=' in line:
        k, v = line.split('=', 1)
        vp[k] = v
assert 'version.properties' in g, 'gradle must read version.properties'
assert re.fullmatch(r'\S+-test\d+', vp['versionName']), vp['versionName']
assert vp['versionName'].endswith('test' + vp['versionCode']), \
    'versionName test suffix must equal versionCode'
m = manifest.read_text(encoding='utf-8')
for legacy in ('xposedmodule','xposedminversion','xposedscope','xposeddescription'):
    assert legacy not in m, f'legacy manifest metadata remains: {legacy}'
s = source.read_text(encoding='utf-8')
assert 'extends RootEarlyModule' in s
root_entry = (app / 'src/main/java/ls/augment/com/RootEarlyModule.java').read_text(encoding='utf-8')
assert 'extends XposedModule' in root_entry
assert 'public final void onModuleLoaded(' in root_entry
assert 'public final void onSystemServerStarting(' in root_entry
assert 'protected void onModuleLoadedAfterEarly(' in s
assert 'protected void onSystemServerStartingAfterRoot(' in s
assert '.setId("ls_augment.api102.' in s
assert not re.search(r'^\s*detach\(\);', s, re.M), \
    'a non-target package callback must not detach the whole shared process'
assert 'VERSION = BuildConfig.VERSION_NAME' in s, \
    'diagnostic version must follow the APK versionName'
assert 'param.isSystemServer()' in s, \
    'system_server must be identified from ModuleLoadedParam'
assert 'LEGACY_SYSTEM_SERVER_PACKAGE' not in s, \
    'modern libxposed must not route android UI as system_server'
assert 'de.robv.android.xposed' not in s
assert not (app / 'src/main/assets/xposed_init').exists()

# Optional post-build APK verification.
if len(sys.argv) > 1:
    apk = Path(sys.argv[1])
    assert apk.is_file(), apk
    with zipfile.ZipFile(apk) as z:
        names=set(z.namelist())
        for n in ('META-INF/xposed/java_init.list','META-INF/xposed/native_init.list',
                  'META-INF/xposed/scope.list','META-INF/xposed/module.prop'):
            assert n in names, f'APK missing {n}'
            assert z.namelist().count(n) == 1, f'APK duplicate metadata entry: {n}'
        packaged_scope = scope_packages(z.read('META-INF/xposed/scope.list').decode('utf-8'), 'APK scope.list')
        same_scope(packaged_scope, declared_packages, 'APK scope vs source scope/registry')
        assert 'assets/xposed_init' not in names, 'legacy assets/xposed_init packaged'
        assert z.read('META-INF/xposed/java_init.list').decode().strip() == 'ls.augment.com.hook.AugmentModule'
        assert z.read('META-INF/xposed/native_init.list').decode().strip() == 'liblsaugment_tgk.so'
        p={}
        for line in z.read('META-INF/xposed/module.prop').decode().splitlines():
            if '=' in line:
                k,v=line.split('=',1); p[k.strip()]=v.strip()
        assert p == props, f'APK module.prop differs from source: {p} != {props}'
print('Modern libxposed API 102 checks: OK')
