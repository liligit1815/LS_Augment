#!/usr/bin/env python3
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
app = root / 'android/app'
src = app / 'src/main/java/ls/augment/com'

checks = {
    'new application id': (app / 'build.gradle', "applicationId 'ls.augment.com'"),
    'new namespace': (app / 'build.gradle', "namespace 'ls.augment.com'"),
    'android 16 compile sdk': (app / 'build.gradle', 'compileSdk 36'),
    'loaded module version probe': (src / 'SettingsActivity.java',
                                    'ModuleRuntimeStatus.matches'),
    'modern entry': (app / 'src/main/resources/META-INF/xposed/java_init.list',
                     'ls.augment.com.hook.AugmentModule'),
    'api102 metadata': (app / 'src/main/resources/META-INF/xposed/module.prop',
                        'targetApiVersion=102'),
    'config provider': (app / 'src/main/AndroidManifest.xml', 'ls.augment.com.config'),
    'tile component': (app / 'src/main/AndroidManifest.xml', '.AugmentTileService'),
    'system-owned automation': (src / 'hook/AugmentModule.java', 'ScreenOffAutomationHook.attach(context)'),
    'foreground session application': (app / 'src/main/AndroidManifest.xml', '.AugmentApplication'),
    'grouped settings home': (src / 'SettingsActivity.java', 'addCategorySection'),
    'single column settings navigation': (src / 'SettingsActivity.java', 'renderAppBar'),
    'secondary pages': (src / 'FeatureActivity.java', 'MODULE_SIGNATURE_INSTALL'),
    'renamed hide ui': (src / 'HideAppsActivity.java', '消失吧APP'),
    'concealed hide entry switch': (src / 'HideAppsActivity.java', '消失吧图标'),
    'seven-tap hide entry gate': (src / 'HiddenEntrySession.java', 'tapCount < 7'),
    'full version tap target': (src / 'SettingsActivity.java', 'onVersionTapped'),
    'launcher alias': (app / 'src/main/AndroidManifest.xml', '.LauncherAlias'),
    'launcher icon control': (src / 'FeatureActivity.java', '隐藏桌面图标'),
    'space tabs': (src / 'HideAppsActivity.java', 'renderSpaceTabs'),
    'collapsed app list': (src / 'HideAppsActivity.java', 'appBrowser.setVisibility(View.GONE)'),
    'app list expansion': (src / 'HideAppsActivity.java',
                           'appBrowser.setVisibility(appListExpanded ? View.VISIBLE : View.GONE)'),
    'hide automation integrated': (src / 'HideAppsActivity.java', '锁屏自动隐藏'),
    'private config authority': (src / 'AppConfig.java', 'ls_augment_config_v2'),
    'root pm truth': (src / 'RootHideManager.java', 'dumpsys package'),
    'pm hide': (src / 'RootHideManager.java', '"hide" : "unhide"'),
    'root package validation': (src / 'RootHideManager.java', 'isValidPackage(packageName)'),
    'root user validation': (src / 'RootHideManager.java', 'userId <= 99999'),
    'root action serialization': (src / 'RootHideManager.java', 'ReentrantLock ACTION_LOCK'),
    'root shell quoting': (src / 'RootShell.java', 'static String quote'),
    'versioned root store': (src / 'RootHideManager.java', '/data/adb/ls_augment/v2'),
    'legacy conflict only': (src / 'RootHideManager.java', 'old_pkg=0; old_mod=0'),
    'event automation': (src / 'hook/ScreenOffAutomationHook.java', 'Intent.ACTION_SCREEN_OFF'),
    'modern module class': (src / 'hook/AugmentModule.java', 'extends XposedModule'),
    'settings precision': (src / 'hook/SettingsTargetMatcher.java', 'userId + ":" + packageName'),
    'signature mismatch setting': (src / 'ConfigSchema.java',
                                   'ls_augment_allow_signature_mismatch'),
    'signature mismatch UI': (src / 'FeatureActivity.java',
                              '允许安装签名不一致的应用'),
    'signature mismatch hook': (src / 'hook/SignatureMismatchInstallHook.java',
                                'interceptVerify'),
    'signature mismatch prepare hook': (src / 'hook/SignatureMismatchInstallHook.java',
                                        'interceptPreparePackage'),
    'signature mismatch capability hook':
        (src / 'hook/SignatureMismatchInstallHook.java',
         'interceptCheckCapability'),
    'direct capability policy':
        (src / 'hook/SignatureMismatchInstallPolicy.java',
         'shouldBypassDirectCapability'),
    'shared UID remains protected': (src / 'hook/SignatureMismatchInstallPolicy.java',
                                     'hasSharedUser'),
    'cross-package permission remains protected':
        (src / 'hook/SignatureMismatchInstallPolicy.java',
         'incomingPackage.equals(permissionOwnerPackage)'),
    'systemui native icon rows': (src / 'hook/StatusBarGridHook.java', 'NotificationIconContainer'),
    'systemui live provider observer': (src / 'hook/StatusBarGridHook.java',
                                        'registerContentObserver'),
    'systemui reversible translations': (src / 'hook/StatusBarGridHook.java',
                                         'e.getValue().restore(e.getKey())'),
    'statusbar dynamic icon discovery': (src / 'hook/StatusBarGridHook.java',
                                         'group.getChildCount()'),
    'statusbar dual clock': (src / 'hook/StatusBarClockFormatter.java',
                             'secondPattern'),
    'statusbar measured layout diagnostics': (src / 'hook/StatusBarGridHook.java',
                                               'SYSTEMUI_LAYOUT_STATE'),
    'double app': (src / 'hook/DoubleAppHook.java', 'getSupportApps'),
    'double app automatic third-party merge': (src / 'hook/DoubleAppHook.java',
                                               'getInstalledApplications(0)'),
    'beautify unlimited trial': (src / 'hook/BeautifyHook.java',
                                 'trial_reset_blocked'),
    'beautify adapter expiry': (src / 'hook/BeautifyAdapterHook.java',
                                'adapter_expiry_job'),
    'double app resolver guard': (src / 'hook/DoubleAppHook.java',
                                  'resolver_bypassed_no_clone'),
    'scope restart': (src / 'ScopeRestartDialog.java', '重启作用域'),
    'super mirror': (src / 'hook/SuperMirrorDiabloHook.java', 'DB-02'),
    'fan fixed rpm policy': (src / 'hook/FanControlPolicy.java',
                             'data.closestLevel'),
    'fan OEM-session-only control': (src / 'hook/FanControlHook.java',
                                     'fan_enable_writes=0'),
    'fan control UI': (src / 'FeatureActivity.java',
                       'AppConfig.FAN_FIXED_ENABLED,"固定风扇转速"'),
    'fan max level UI': (src / 'FeatureActivity.java',
                         'AppConfig.FAN_UNLOCK_MAX,"解除原厂极限转速限制"'),
    'shoulder automatic third-party target': (src / 'hook/AugmentModule.java',
                                               'ApplicationInfo.FLAG_SYSTEM'),
    'auxiliary line OEM state ownership': (src / 'hook/AugmentModule.java',
                                            'persisted per-game on/off state'),
    'one-key-link capability gate': (src / 'hook/AugmentModule.java',
                                     '"isSupportOneKeyLink"'),
    'physical game-key capability gate': (src / 'hook/AugmentModule.java',
                                          '"isSuppprtRedMagicGameKey"'),
    'combo startPlay file swap': (src / 'hook/AugmentModule.java',
                                  'combo_speed.gamehelper.motion_file'),
    'combo motion timestamp scaler': (src / 'hook/ComboMotionFileScaler.java',
                                      'event.put("sampleEventTime", scaledSample)'),
    'combo on-demand cache hit': (src / 'hook/ComboMotionFileScaler.java',
                                  'Result.cacheHit(destination.getAbsolutePath(), identity)'),
    'combo integer rate range': (src / 'FeatureActivity.java',
                                 'AppConfig.COMBO_SPEED_RATE,"播放倍率（×）",1,10,false'),
    'AI trigger speed hook': (src / 'hook/AiTriggerSpeedHook.java',
                              'MIN_TEMPLATE_SCAN_MS'),
    'freeform hook': (src / 'hook/FreeformHook.java',
                      'WINDOW_REPLY_ICON_MANAGER'),
    'TGK rapid-fire system hook': (src / 'hook/TgkRapidFireSystemHook.java',
                                   'OEM_MAX_CPS'),
    'TGK native build': (app / 'src/main/cpp/CMakeLists.txt',
                         'tgk_rapid_native.cpp'),
    'atomic configuration snapshot': (src / 'ConfigSnapshot.java',
                                      'Immutable, checksummed all-or-nothing'),
    'configuration schema': (src / 'ConfigSchema.java',
                             'Single source of truth'),
    'multi-user explicit result': (src / 'UserResolution.java',
                                   'failure is never user 0'),
    'rapid-fire compatibility gate': (src / 'RapidFireCompatibility.java',
                                      'SESSION_MAX_MS'),
    'rapid-fire dynamic native keys': (src / 'hook/TgkRapidFireSystemHook.java',
                                       'token.acceptsSystem'),
    'rapid-fire crash fuse': (src / 'hook/RapidFireCrashFuse.java',
                              'ATTEMPTS'),
    'LSPosed native entry': (
        app / 'src/main/resources/META-INF/xposed/native_init.list',
        'liblsaugment_tgk.so'),
    'LSPosed native hook backend': (app / 'src/main/cpp/tgk_rapid_native.cpp',
                                    'NativeOnModuleLoaded native_init'),
    'verified ELF symbol resolver': (app / 'src/main/cpp/tgk_rapid_native.cpp',
                                     'resolveSymbolFromVerifiedElf'),
}

for name, (path, needle) in checks.items():
    assert path.is_file(), f'{name}: missing {path}'
    text = path.read_text(encoding='utf-8')
    assert needle in text, f'{name}: missing {needle}'

# Both preflight and the actual native installer must inspect the same complete
# function shape; changing only one side must fail validation.
java_probe = (src / 'RapidFireNativeLayout.java').read_text(encoding='utf-8')
native_probe = (app / 'src/main/cpp/tgk_layout_probe.h').read_text(encoding='utf-8')
java_words = re.findall(r'0x[0-9a-f]{8}', java_probe.split('PATTERN = {', 1)[1].split('};', 1)[0])
native_words = re.findall(r'0x[0-9a-f]{8}', native_probe.split('kPattern[] = {', 1)[1].split('};', 1)[0])
assert len(java_words) == 90 and java_words == native_words, 'Java/native structural probes differ'
assert 'kInputReaderProfiles' not in (app / 'src/main/cpp/tgk_rapid_native.cpp').read_text(encoding='utf-8')

version_file = root / 'android/version.properties'
assert version_file.is_file(), f'missing version source: {version_file}'
version = {}
for line in version_file.read_text(encoding='utf-8').splitlines():
    if '=' in line and not line.lstrip().startswith('#'):
        key, value = line.split('=', 1)
        version[key.strip()] = value.strip()
version_code = version.get('versionCode', '')
version_name = version.get('versionName', '')
assert version_code.isdigit() and int(version_code) > 0, \
    f'invalid versionCode: {version_code}'
assert re.fullmatch(r'\S+-test\d+', version_name), \
    f'invalid versionName: {version_name}'
assert version_name.endswith('test' + version_code), \
    'versionName test suffix must equal versionCode'
gradle_text = (app / 'build.gradle').read_text(encoding='utf-8')
assert 'versionCode appVersionCode' in gradle_text
assert 'versionName appVersionName' in gradle_text
assert 'new FileOutputStream(versionFile)' not in gradle_text, \
    'Gradle configuration must never mutate version.properties'

for retired_recents_source in (
        'LauncherRecentsStackHook.java', 'RecentsDismissPolicy.java',
        'RecentsMemoryFormatter.java', 'RecentsStackMath.java',
        'RecentsTransformComposition.java'):
    assert not (src / 'hook' / retired_recents_source).exists(), \
        f'retired LS_Augment recents source remains: {retired_recents_source}'
assert not (src / 'RecentsRecommendedConfig.java').exists(), \
    'retired recents configuration source remains'

augment_module_text = (src / 'hook/AugmentModule.java').read_text(
    encoding='utf-8')
for forbidden_line_state_override in (
        'findMethod(service, "pkgsArray"',
        'shoulder.line.package_list',
        'currentLineServicePackage('):
    assert forbidden_line_state_override not in augment_module_text, \
        f'auxiliary-line persisted state override regressed: {forbidden_line_state_override}'

scope = set((app / 'src/main/resources/META-INF/xposed/scope.list').read_text().split())
assert scope == {
    'com.android.settings', 'com.android.systemui', 'com.zte.beautify',
    'com.zte.beautifyadapter',
    'com.zte.cn.doubleapp',
    'com.zte.recommend', 'com.zte.game.plugintrigger',
    'cn.nubia.gamelauncher', 'cn.nubia.gameassist', 'cn.nubia.gamelab',
    'cn.nubia.fan',
    'com.mi.health', 'com.zte.mifavor.launcher',
    'cn.nubia.gamehelperline', 'cn.nubia.gamehelpmodule',
    'system', 'cn.nubia.neostore'
}, scope
assert 'com.smallcircle.heartvoice' not in scope

for source in (app / 'src/main/java').rglob('*.java'):
    text = source.read_text(encoding='utf-8')
    assert 'de.robv.android.xposed' not in text, f'legacy Xposed API in {source}'
    assert '/data/adb/modules/ls_augment/bin/' not in text, f'old KSU runtime dependency in {source}'
    assert 'augmentctl toggle' not in text, f'old KSU tile dependency in {source}'

rapid_sources = [
    src / 'hook/TgkRapidFireHook.java',
    src / 'hook/TgkRapidFireSystemHook.java',
    src / 'hook/TgkRapidFireNative.java',
    app / 'src/main/cpp/tgk_rapid_native.cpp',
]
for source in rapid_sources:
    text = source.read_text(encoding='utf-8')
    assert not re.search(r'\b(?:136|137|138)\b', text), \
        f'hard-coded shoulder key returned: {source}'

fan_text = (src / 'hook/FanControlHook.java').read_text(encoding='utf-8')
assert not re.search(r'write\s*\(\s*FAN_ENABLE\b', fan_text), \
    'fan controller must never write fan_enable'
assert 'enable.value != 0 && enable.value != 1' in fan_text, \
    'fan_enable must be validated before takeover'

freeform_text = (src / 'hook/FreeformHook.java').read_text(encoding='utf-8')
assert 'allAppsCompatible = verifyAllAppsCompatibility' in freeform_text, \
    'partial ROM freeform compatibility must disable only all-apps mode'
assert 'PackageManager.MATCH_DEFAULT_ONLY' not in freeform_text, \
    'launcher eligibility must not require the unrelated DEFAULT category'

signature_install_text = (src / 'hook/SignatureMismatchInstallHook.java').read_text(
    encoding='utf-8')
assert 'Settings.Global.getString' not in signature_install_text, \
    'hooks must not mix legacy per-key Global configuration with snapshots'
assert 'if (uid < 0) return 0;' not in augment_module_text, \
    'invalid user identity must not fall back to Android user 0'

feature_ui = (src / 'FeatureActivity.java').read_text(encoding='utf-8')
assert re.search(r'AppConfig\.AI_TRIGGER_TEMPLATE_SCAN_MS\s*,\s*"[^"]*"\s*,\s*80\s*,\s*2000\s*,\s*false', feature_ui), \
    'AI template slider must expose the full tested interval range'

entry = (app / 'src/main/resources/META-INF/xposed/java_init.list').read_text().strip()
assert entry == 'ls.augment.com.hook.AugmentModule'
assert not (app / 'src/main/assets/xposed_init').exists()
assert not (app / 'libs/xposed-api-stub.jar').exists()

builder = (root / 'build-module.sh').read_text(encoding='utf-8')
assert 'KernelSU.zip' not in builder
assert ':app:assembleDebug' in builder
assert 'android/version.properties' in builder

source_builder = (root / 'build-source.sh').read_text(encoding='utf-8')
assert 'android/version.properties' in source_builder
assert 'LS_Augment-v${VERSION}-source.zip' in source_builder

manifest_text = (app / 'src/main/AndroidManifest.xml').read_text(encoding='utf-8')
assert 'android.permission.INTERNET' not in manifest_text, \
    'user analytics/cloud collection must remain disabled'

print('Project checks: OK')
