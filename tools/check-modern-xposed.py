#!/usr/bin/env python3
from pathlib import Path
import re
import sys
import zipfile

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
assert set(scope.read_text(encoding='utf-8').split()) == {
    'com.android.settings',
    'com.android.systemui',
    'com.zte.beautify',
    'com.zte.beautifyadapter',
    'com.zte.cn.doubleapp',
    'com.zte.recommend',
    'cn.nubia.fan', 'cn.nubia.neostore', 'com.mi.health', 'com.zte.mifavor.launcher',
    'cn.nubia.gamelauncher',
    'cn.nubia.gameassist',
    'cn.nubia.gamelab',
    'cn.nubia.gamehelperline',
    'cn.nubia.gamehelpmodule',
    'com.zte.game.plugintrigger',
    'system',
}
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
assert "compileOnly 'io.github.libxposed:api:102.0.0'" in g
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
assert 'extends XposedModule' in s
assert '.setId("ls_augment.api102.' in s
assert 'detach(); // API 102' in s
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
        assert 'assets/xposed_init' not in names, 'legacy assets/xposed_init packaged'
        assert z.read('META-INF/xposed/java_init.list').decode().strip() == 'ls.augment.com.hook.AugmentModule'
        assert z.read('META-INF/xposed/native_init.list').decode().strip() == 'liblsaugment_tgk.so'
        p={}
        for line in z.read('META-INF/xposed/module.prop').decode().splitlines():
            if '=' in line:
                k,v=line.split('=',1); p[k.strip()]=v.strip()
        assert p.get('minApiVersion') == '102'
        assert p.get('targetApiVersion') == '102'
print('Modern libxposed API 102 checks: OK')
