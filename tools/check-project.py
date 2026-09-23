#!/usr/bin/env python3
import re
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

root = Path(__file__).resolve().parents[1]
app = root / 'android/app'
src = app / 'src/main/java/ls/augment/com'

checks = {
    'new application id': (app / 'build.gradle', "applicationId 'ls.augment.com'"),
    'new namespace': (app / 'build.gradle', "namespace 'ls.augment.com'"),
    'android 16 compile sdk': (app / 'build.gradle', 'compileSdk 36'),
    'android 15 minimum sdk': (app / 'build.gradle', 'minSdk 35'),
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
    'hook application home': (src / 'SettingsActivity.java', 'HookAppCatalog.targets()'),
    'three destination navigation': (src / 'SettingsActivity.java', 'renderNavigation'),
    'shared application route resolver': (src / 'ModuleNavigation.java', 'openTarget'),
    'explicit first use agreement': (src / 'OnboardingActivity.java', 'if (!checked) return;'),
    'real scope service': (src / 'ModuleScopeService.java', 'current.getScope()'),
    'standalone controller host': (src / 'FeatureActivity.java', 'new FeatureEditorController(this,'),
    'secondary page controller': (src / 'FeatureEditorController.java', 'MODULE_SIGNATURE_INSTALL'),
    'concealed hide page gate': (src / 'HideAppsActivity.java', 'if (!HiddenEntrySession.isUnlocked())'),
    'seven-tap hide entry gate': (src / 'HiddenEntrySession.java', 'tapCount < 7'),
    'system version tap target': (src / 'ModuleAbout.java', 'systemVersion.setOnClickListener(onSystemVersionTap)'),
    'launcher alias': (app / 'src/main/AndroidManifest.xml', '.LauncherAlias'),
    'launcher icon control': (src / 'FeatureEditorController.java', '隐藏桌面图标'),
    'space selector': (src / 'HideAppsActivity.java', 'renderSpaceSelector'),
    'collapsed app list': (src / 'HideAppsActivity.java', 'showAppList(false)'),
    'app list expansion': (src / 'HideAppsActivity.java',
                           'appConfigBody.setVisibility(expanded ? View.VISIBLE : View.GONE)'),
    'hide automation integrated': (src / 'HideAppsActivity.java', '锁屏自动隐藏'),
    'private config authority': (src / 'AppConfig.java', 'ls_augment_config_v2'),
    'root pm truth': (src / 'HidePackageSnapshot.java', 'dumpsys package'),
    'batch writes remain verified': (src / 'HideBatchExecutor.java', 'transport.query(batch)'),
    'private hidden state publication': (src / 'RootHideManager.java', 'RuntimeStateStore.publishHidden'),
    'checked batch command controller': (src / 'RootHideManager.java',
                                         'HideTargetController.forCheckedBatch(context, this, root)'),
    'manual transaction preparation': (src / 'HideTargetController.java',
                                       'reservation = client.prepare(target, hidden)'),
    'manual transaction arm': (src / 'HideTargetController.java',
                              'if (!client.arm(reservation))'),
    'manual transaction dispatch': (src / 'HideTargetController.java',
                                   'reply = client.execute(reservation)'),
    'root typed request transport': (src / 'HideRootClient.java',
                                     'request->RootShell.run(request.command(),null,15,1024)'),
    'root typed hide request': (src / 'HideRootClient.java',
                                'exchange(request(HideRootProtocol.Verb.HIDE,attempt.entries.get(i)))'),
    'root typed reply validation': (src / 'HideRootClient.java',
                                     'HideRootProtocol.parse(request,result)'),
    'root transaction service command': (src / 'HideRootProtocol.java',
                                          'COMMAND = "ls-augment-user-tx-v1"'),
    'root package service transport': (src / 'HideRootProtocol.java',
                                       'new StringBuilder("/system/bin/cmd package")'),
    'root package validation': (src / 'HideTargetCodec.java', 'PACKAGE.matcher(packageName).matches()'),
    'root user validation': (src / 'HideTargetCodec.java', 'userId <= 99999'),
    'root action serialization': (src / 'RootHideManager.java', 'ReentrantLock ACTION_LOCK'),
    'root shell quoting': (src / 'RootShell.java', 'static String quote'),
    'versioned root store': (src / 'RootHideManager.java', '/data/adb/ls_augment/v2'),
    'legacy conflict only': (src / 'RootHideManager.java', 'old_pkg=0; old_mod=0'),
    'event automation': (src / 'hook/ScreenOffAutomationHook.java', 'Intent.ACTION_SCREEN_OFF'),
    'modern module entry': (src / 'hook/AugmentModule.java', 'extends RootEarlyModule'),
    'modern module API base': (src / 'RootEarlyModule.java', 'extends XposedModule'),
    'settings precision': (src / 'hook/SettingsTargetMatcher.java', 'userId + ":" + packageName'),
    'signature mismatch setting': (src / 'ConfigSchema.java',
                                   'ls_augment_allow_signature_mismatch'),
    'signature mismatch UI': (src / 'FeatureEditorController.java',
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
    'systemui published snapshot listener': (src / 'hook/StatusBarGridHook.java',
                                             'FeatureSettings.addSnapshotListener'),
    'systemui detached listener cleanup': (src / 'hook/StatusBarGridHook.java',
                                            'FeatureSettings.removeSnapshotListener'),
    'background-only configuration IPC': (src / 'hook/FeatureSettings.java',
                                           'LSA-ConfigReader'),
    'early framework configuration attach': (src / 'hook/AugmentModule.java',
                                      'FeatureSettings.attachFramework(this)'),
    'official framework remote preferences': (src / 'hook/FeatureSettings.java',
                                               'source.getRemotePreferences(RemoteConfig.GROUP)'),
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
    'fan control UI': (src / 'FeatureEditorController.java',
                       'AppConfig.FAN_FIXED_ENABLED,"固定风扇转速"'),
    'fan max level UI': (src / 'FeatureEditorController.java',
                         'AppConfig.FAN_UNLOCK_MAX,"风扇最高转速"'),
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
    'combo integer rate range': (src / 'FeatureEditorController.java',
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
    'rapid-fire private crash fuse transport': (src / 'hook/RapidFireCrashFuse.java',
                                               '"crash_fuse", null, request'),
    'durable crash arm acknowledgement': (src / 'CrashFuseStore.java',
                                          'if (!prefs.edit().putString("session", session)'),
    'LSPosed native entry': (
        app / 'src/main/resources/META-INF/xposed/native_init.list',
        'liblsaugment_tgk.so'),
    'LSPosed native hook backend': (app / 'src/main/cpp/tgk_rapid_native.cpp',
                                    'NativeOnModuleLoaded native_init'),
    'verified ELF symbol resolver': (app / 'src/main/cpp/tgk_rapid_native.cpp',
                                     'resolveSymbolFromVerifiedElf'),
}

def check_root_transport():
    # The app must use the typed transaction service above. A shell mutation fallback
    # would reopen the external serial-check-to-numeric-user-write race. These are
    # source checks; the Java regression and device runs cover execution behavior.
    for transaction_source in ('RootHideManager.java', 'HideRootClient.java', 'HideRootProtocol.java',
                               'HideTargetController.java', 'HideManualClient.java'):
        transaction_text = (src / transaction_source).read_text(encoding='utf-8')
        assert 'writeHiddenState' not in transaction_text, \
            f'old direct hidden-state writer returned: {transaction_source}'
        assert not re.search(r'\b(?:am|pm)\s+(?:force-stop|hide|unhide)\b', transaction_text), \
            f'direct am/pm mutation fallback returned: {transaction_source}'
        assert not re.search(r'\bcmd\s+(?:package\s+(?:hide|unhide)|activity\s+force-stop)\b', transaction_text), \
            f'direct cmd mutation fallback returned: {transaction_source}'


def check_native_probe():
    # Both preflight and the actual native installer must inspect the same complete
    # function shape; changing only one side must fail validation.
    java_probe = (src / 'RapidFireNativeLayout.java').read_text(encoding='utf-8')
    native_probe = (app / 'src/main/cpp/tgk_layout_probe.h').read_text(encoding='utf-8')
    java_words = re.findall(r'0x[0-9a-f]{8}', java_probe.split('PATTERN = {', 1)[1].split('};', 1)[0])
    native_words = re.findall(r'0x[0-9a-f]{8}', native_probe.split('kPattern[] = {', 1)[1].split('};', 1)[0])
    assert len(java_words) == 90 and java_words == native_words, 'Java/native structural probes differ'
    assert 'kInputReaderProfiles' not in (app / 'src/main/cpp/tgk_rapid_native.cpp').read_text(encoding='utf-8')


def check_version():
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


def check_retired_recents():
    for retired_recents_source in (
            'LauncherRecentsStackHook.java', 'RecentsDismissPolicy.java',
            'RecentsMemoryFormatter.java', 'RecentsStackMath.java',
            'RecentsTransformComposition.java'):
        assert not (src / 'hook' / retired_recents_source).exists(), \
            f'retired LS_Augment recents source remains: {retired_recents_source}'
    assert not (src / 'RecentsRecommendedConfig.java').exists(), \
        'retired recents configuration source remains'


def check_auxiliary_line():
    augment_module_text = (src / 'hook/AugmentModule.java').read_text(
        encoding='utf-8')
    for forbidden_line_state_override in (
            'findMethod(service, "pkgsArray"',
            'shoulder.line.package_list',
            'currentLineServicePackage('):
        assert forbidden_line_state_override not in augment_module_text, \
            f'auxiliary-line persisted state override regressed: {forbidden_line_state_override}'


def check_scope():
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
        'com.android.packageinstaller', 'com.zte.zdm', 'com.zte.mifavor.weather',
        'cn.zte.gamefloat', 'cn.nubia.gamehighlights',
        'com.android.permissioncontroller', 'com.android.nfc',
        'cn.nubia.filebrowser', 'com.android.ztescreenshot',
        'system', 'cn.nubia.neostore'
    }, scope
    assert 'com.smallcircle.heartvoice' not in scope


def check_legacy_sources():
    for source in (app / 'src/main/java').rglob('*.java'):
        text = source.read_text(encoding='utf-8')
        assert 'de.robv.android.xposed' not in text, f'legacy Xposed API in {source}'
        assert '/data/adb/modules/ls_augment/bin/' not in text, f'old KSU runtime dependency in {source}'
        assert 'augmentctl toggle' not in text, f'old KSU tile dependency in {source}'


def check_rapid_keys():
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


def check_fan():
    fan_text = (src / 'hook/FanControlHook.java').read_text(encoding='utf-8')
    assert not re.search(r'write\s*\(\s*FAN_ENABLE\b', fan_text), \
        'fan controller must never write fan_enable'
    assert 'enable.value != 0 && enable.value != 1' in fan_text, \
        'fan_enable must be validated before takeover'


def check_freeform():
    freeform_text = (src / 'hook/FreeformHook.java').read_text(encoding='utf-8')
    assert 'allAppsCompatible = verifyAllAppsCompatibility' in freeform_text, \
        'partial ROM freeform compatibility must disable only all-apps mode'
    assert 'PackageManager.MATCH_DEFAULT_ONLY' not in freeform_text, \
        'launcher eligibility must not require the unrelated DEFAULT category'


def check_signature_transport():
    augment_module_text = (src / 'hook/AugmentModule.java').read_text(encoding='utf-8')
    signature_install_text = (src / 'hook/SignatureMismatchInstallHook.java').read_text(
        encoding='utf-8')
    assert 'Settings.Global.getString' not in signature_install_text, \
        'hooks must not mix legacy per-key Global configuration with snapshots'
    assert 'if (uid < 0) return 0;' not in augment_module_text, \
        'invalid user identity must not fall back to Android user 0'


def check_slider():
    feature_ui = (src / 'FeatureEditorController.java').read_text(encoding='utf-8')
    assert re.search(r'AppConfig\.AI_TRIGGER_TEMPLATE_SCAN_MS\s*,\s*"[^"]*"\s*,\s*80\s*,\s*2000\s*,\s*false', feature_ui), \
        'AI template slider must expose the full tested interval range'


def check_hidden_entry():
    hide_ui = (src / 'HideAppsActivity.java').read_text(encoding='utf-8')
    assert '消失吧图标' not in hide_ui and 'HiddenEntrySession.unlock(' not in hide_ui, \
        'retired hide-entry toggle must not bypass the About system-version gate'
    settings_ui = (src / 'SettingsActivity.java').read_text(encoding='utf-8')
    assert 'if(!ABOUT.equals(selected))return;' in settings_ui, 'seven-tap handler must only run in About'
    tap_callers = [p.name for p in src.rglob('*.java')
                   if 'HiddenEntrySession.recordSystemVersionTap(' in p.read_text(encoding='utf-8')]
    assert tap_callers == ['SettingsActivity.java'], f'extra hidden-entry unlock source: {tap_callers}'
    for path in (src / 'hook/FeatureSettings.java', src / 'hook/RapidFireCrashFuse.java'):
        text = path.read_text(encoding='utf-8')
        assert 'Settings.Global.' not in text and 'preloadBootSnapshot(' not in text, \
            f'legacy Global/boot configuration transport returned: {path.name}'


def check_provider_fuse():
    provider = (src / 'LSConfigProvider.java').read_text(encoding='utf-8')
    fuse_route = provider.split('if ("crash_fuse".equals(method))', 1)[1].split('ShoulderQuickSwitchPolicy.CALL', 1)[0]
    assert fuse_route.index('Binder.getCallingUid() != Process.SYSTEM_UID') < fuse_route.index('Binder.clearCallingIdentity()'), \
        'crash fuse must verify the actual system UID before clearing Binder identity'


def check_module_entry():
    entry = (app / 'src/main/resources/META-INF/xposed/java_init.list').read_text().strip()
    assert entry == 'ls.augment.com.hook.AugmentModule'
    assert not (app / 'src/main/assets/xposed_init').exists()
    assert not (app / 'libs/xposed-api-stub.jar').exists()


def check_apk_builder():
    builder = (root / 'build-module.sh').read_text(encoding='utf-8')
    assert 'KernelSU.zip' not in builder
    assert ':app:assembleDebug' in builder
    assert 'android/version.properties' in builder


def check_source_builder():
    source_builder = (root / 'build-source.sh').read_text(encoding='utf-8')
    assert 'android/version.properties' in source_builder
    assert 'LS_Augment-v${VERSION}-source.zip' in source_builder


def check_build_boundary():
    # Module builds use installed-launcher metadata/hooks, not the launcher's source
    # checkout. Keep these entry points usable when the independent repository moves.
    for build_path in (
            'build-module.sh', 'tools/run-java-tests.sh', 'android/settings.gradle',
            'android/build.gradle', 'android/app/build.gradle'):
        build_text = (root / build_path).read_text(encoding='utf-8')
        for launcher_directory in ('redmagic-launcher/', 'LS_RedMagicLauncher/'):
            assert launcher_directory not in build_text.replace('\\', '/'), \
                f'module build depends on launcher checkout: {build_path}'


def check_source_packaging():
    source_builder = (root / 'build-source.sh').read_text(encoding='utf-8')
    # Execute the real source packager on tiny fixtures; never rebuild or overwrite
    # the user's versioned source archive as part of a project check.
    packager_match = re.search(r"<<'PY'\n(.*?)\nPY(?:\n|$)", source_builder, re.S)
    assert packager_match, 'source packager Python block not found'
    with tempfile.TemporaryDirectory(prefix='ls-module-source-boundary-') as temporary:
        workspace = Path(temporary)
        for launcher_present in (False, True):
            project_name = 'module-with-launcher' if launcher_present else 'module-only'
            project = workspace / project_name
            module_files = ('android/version.properties', 'android/app/src/main/keep.txt',
                            'android/gradlew', 'android/gradlew.bat',
                            'android/gradle/wrapper/gradle-wrapper.jar',
                            'android/gradle/wrapper/gradle-wrapper.properties',
                            'tools/keep.py')
            fixture_files = list(module_files)
            if launcher_present:
                fixture_files += [
                    'LS_RedMagicLauncher/src/keep.smali',
                    'LS_RedMagicLauncher/helper-src/main/Keep.java',
                    'LS_RedMagicLauncher/tools/keep.py',
                    'LS_RedMagicLauncher/original.apk',
                    'redmagic-launcher/src/keep.smali',
                    'redmagic-launcher/original.apk',
                    'redmagic-launcher/tooling/framework-res-NX809J.apk',
                    'redmagic-launcher/framework/cache/1.apk',
                ]
            for relative in fixture_files:
                path = project / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text('fixture\n', encoding='utf-8')
            output = workspace / f'{project_name}.zip'
            packaged = subprocess.run(
                [sys.executable, '-', str(workspace), project_name, str(output)],
                input=packager_match.group(1), text=True, capture_output=True)
            assert packaged.returncode == 0, packaged.stdout + packaged.stderr
            with zipfile.ZipFile(output) as archive:
                packaged_files = set(archive.namelist())
                wrapper = archive.getinfo(f'{project_name}/android/gradlew')
                assert wrapper.create_system == 3 and (wrapper.external_attr >> 16) & 0o111, \
                    'source archive lost executable Gradle Wrapper'
            expected = {f'{project_name}/{relative}' for relative in module_files}
            assert packaged_files == expected, \
                f'module source archive boundary failed: {packaged_files ^ expected}'


def check_manifest():
    manifest_text = (app / 'src/main/AndroidManifest.xml').read_text(encoding='utf-8')
    assert 'android.permission.INTERNET' not in manifest_text, \
        'user analytics/cloud collection must remain disabled'


def check_hidden_navigation():
    subprocess.run([sys.executable, str(root / 'tools/test-project-navigation.py')], check=True)


def check_configured_batch():
    subprocess.run([sys.executable, str(root / 'tools/test-hide-configured-batch.py')], check=True)


def check_audit_fixes():
    subprocess.run([sys.executable, str(root / 'tools/test-audit-fixes.py')], check=True)


def check_toolchain():
    assert "version '8.13.2'" in (root / 'android/build.gradle').read_text()
    properties = (root / 'android/gradle/wrapper/gradle-wrapper.properties').read_text()
    assert 'gradle-8.13-bin.zip' in properties
    assert 'distributionSha256Sum=20f1b1176237254a6fc204d8434196fa11a4cfb387567519c61556e8710aed78' in properties
    for name in ('gradlew', 'gradlew.bat', 'gradle/wrapper/gradle-wrapper.jar'):
        assert (root / 'android' / name).is_file(), f'missing wrapper file: {name}'
    assert 'suppressUnsupportedCompileSdk' not in (root / 'android/gradle.properties').read_text()
    assert '$ROOT/android/gradlew' in (root / 'build-module.sh').read_text()


def run_check(name, action, failures):
    try:
        action()
    except (AssertionError, OSError, ValueError, IndexError, subprocess.SubprocessError) as error:
        failures.append(f'{name}: {error or type(error).__name__}')


def check_source(path, needle):
    assert path.is_file(), f'missing {path}'
    assert needle in path.read_text(encoding='utf-8'), f'missing {needle}'


def main():
    failures = []
    for name, (path, needle) in checks.items():
        run_check(name, lambda path=path, needle=needle: check_source(path, needle), failures)
    sections = (
        check_root_transport,
        check_native_probe,
        check_version,
        check_retired_recents,
        check_auxiliary_line,
        check_scope,
        check_legacy_sources,
        check_rapid_keys,
        check_fan,
        check_freeform,
        check_signature_transport,
        check_slider,
        check_hidden_entry,
        check_provider_fuse,
        check_module_entry,
        check_apk_builder,
        check_source_builder,
        check_build_boundary,
        check_source_packaging,
        check_manifest,
        check_hidden_navigation,
        check_configured_batch,
        check_audit_fixes,
        check_toolchain,
    )
    for section in sections:
        run_check(section.__name__, section, failures)
    for failure in failures:
        print('FAIL: ' + failure)
    print(f'Project checks: {len(checks) + len(sections)} groups executed, {len(failures)} failed')
    return 1 if failures else 0


if __name__ == '__main__':
    raise SystemExit(main())
