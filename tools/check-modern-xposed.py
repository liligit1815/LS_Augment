#!/usr/bin/env python3
from pathlib import Path
import re
import sys
import zipfile

root = Path(__file__).resolve().parents[1]
app = root / 'android/app'
entry = app / 'src/main/resources/META-INF/xposed/java_init.list'
scope = app / 'src/main/resources/META-INF/xposed/scope.list'
prop = app / 'src/main/resources/META-INF/xposed/module.prop'
gradle = app / 'build.gradle'
manifest = app / 'src/main/AndroidManifest.xml'
source = app / 'src/main/java/ls/augment/com/hook/AugmentModule.java'

assert entry.read_text(encoding='utf-8').strip() == 'ls.augment.com.hook.AugmentModule'
assert set(scope.read_text(encoding='utf-8').split()) == {
    'com.android.settings',
    'com.android.systemui',
    'com.zte.beautify',
    'com.zte.beautifyadapter',
    'com.zte.cn.doubleapp',
    'com.zte.mifavor.launcher',
    'cn.nubia.gamelauncher',
    'cn.nubia.gameassist',
    'cn.nubia.gamehelperline',
    'cn.nubia.gamehelpmodule',
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
version_name_match = re.search(r"versionName\s+'([^']+)'", g)
version_code_match = re.search(r'versionCode\s+(\d+)', g)
assert version_name_match, 'missing Android versionName'
assert version_code_match, 'missing Android versionCode'
m = manifest.read_text(encoding='utf-8')
for legacy in ('xposedmodule','xposedminversion','xposedscope','xposeddescription'):
    assert legacy not in m, f'legacy manifest metadata remains: {legacy}'
s = source.read_text(encoding='utf-8')
assert 'extends XposedModule' in s
assert '.setId("ls_augment.api102.' in s
assert 'detach(); // API 102' in s
assert f'VERSION = "{version_name_match.group(1)}"' in s, \
    'APK versionName and LSPosed diagnostic version differ'
assert 'de.robv.android.xposed' not in s
assert not (app / 'src/main/assets/xposed_init').exists()

# Optional post-build APK verification.
if len(sys.argv) > 1:
    apk = Path(sys.argv[1])
    assert apk.is_file(), apk
    with zipfile.ZipFile(apk) as z:
        names=set(z.namelist())
        for n in ('META-INF/xposed/java_init.list','META-INF/xposed/scope.list','META-INF/xposed/module.prop'):
            assert n in names, f'APK missing {n}'
        assert 'assets/xposed_init' not in names, 'legacy assets/xposed_init packaged'
        assert z.read('META-INF/xposed/java_init.list').decode().strip() == 'ls.augment.com.hook.AugmentModule'
        p={}
        for line in z.read('META-INF/xposed/module.prop').decode().splitlines():
            if '=' in line:
                k,v=line.split('=',1); p[k.strip()]=v.strip()
        assert p.get('minApiVersion') == '102'
        assert p.get('targetApiVersion') == '102'
print('Modern libxposed API 102 checks: OK')
