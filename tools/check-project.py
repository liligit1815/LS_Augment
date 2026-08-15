#!/usr/bin/env python3
from pathlib import Path

root = Path(__file__).resolve().parents[1]
app = root / 'android/app'
src = app / 'src/main/java/ls/augment/com'

checks = {
    'new application id': (app / 'build.gradle', "applicationId 'ls.augment.com'"),
    'new namespace': (app / 'build.gradle', "namespace 'ls.augment.com'"),
    'android 16 compile sdk': (app / 'build.gradle', 'compileSdk 36'),
    '2.0 alpha version': (app / 'build.gradle', "versionName '2.0.0-alpha1-test20035'"),
    'loaded module version probe': (src / 'SettingsActivity.java',
                                    'ls_augment_probe_version'),
    'modern entry': (app / 'src/main/resources/META-INF/xposed/java_init.list',
                     'ls.augment.com.hook.AugmentModule'),
    'api102 metadata': (app / 'src/main/resources/META-INF/xposed/module.prop',
                        'targetApiVersion=102'),
    'config provider': (app / 'src/main/AndroidManifest.xml', 'ls.augment.com.config'),
    'tile component': (app / 'src/main/AndroidManifest.xml', '.AugmentTileService'),
    'automation service': (app / 'src/main/AndroidManifest.xml', '.ScreenAutomationService'),
    'foreground session application': (app / 'src/main/AndroidManifest.xml', '.AugmentApplication'),
    'grouped settings home': (src / 'SettingsActivity.java', 'addCategorySection'),
    'single column settings navigation': (src / 'SettingsActivity.java', 'renderAppBar'),
    'secondary pages': (src / 'FeatureActivity.java', 'MODULE_RECENTS_STACK'),
    'renamed hide ui': (src / 'HideAppsActivity.java', '消失吧APP'),
    'concealed hide entry switch': (src / 'HideAppsActivity.java', '消失吧图标'),
    'seven-tap hide entry gate': (src / 'HiddenEntrySession.java', 'tapCount < 7'),
    'full version tap target': (src / 'SettingsActivity.java', 'onVersionTapped'),
    'launcher alias': (app / 'src/main/AndroidManifest.xml', '.LauncherAlias'),
    'launcher icon control': (src / 'FeatureActivity.java', '隐藏桌面图标'),
    'space tabs': (src / 'HideAppsActivity.java', 'renderSpaceTabs'),
    'collapsed app list': (src / 'HideAppsActivity.java', '展开应用列表'),
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
    'event automation': (src / 'ScreenAutomationService.java', 'Intent.ACTION_SCREEN_OFF'),
    'modern module class': (src / 'hook/AugmentModule.java', 'extends XposedModule'),
    'settings precision': (src / 'hook/SettingsTargetMatcher.java', 'userId + ":" + packageName'),
    'recents visual layer': (src / 'hook/LauncherRecentsStackHook.java',
                             'clipping the whole TaskView creates hard vertical slices'),
    'recents math': (src / 'hook/RecentsStackMath.java', 'incomingProgress'),
    'recents snapped overlap': (src / 'hook/RecentsStackMath.java',
                                'frontDistanceRatio'),
    'recents transient layout hold': (src / 'hook/LauncherRecentsStackHook.java',
                                      'holdEstablishedStack'),
    'recents dismiss pose hold': (src / 'hook/LauncherRecentsStackHook.java',
                                  'holdDismissingTaskPoses'),
    'recents frame coalescing': (src / 'hook/LauncherRecentsStackHook.java',
                                 'requestVisualLayout'),
    'recents OEM transform composition': (src / 'hook/LauncherRecentsStackHook.java',
                                          'composeAfterNativeTransform'),
    'recents running task screenshot handoff': (src / 'hook/LauncherRecentsStackHook.java',
                                                'switchToScreenshot'),
    'recents recycled task cleanup': (src / 'hook/LauncherRecentsStackHook.java',
                                      'clearTaskBeforeRecycle'),
    'recents late header refresh': (src / 'hook/LauncherRecentsStackHook.java',
                                    'refreshTaskHeader'),
    'recents targeted dismiss policy': (src / 'hook/RecentsDismissPolicy.java',
                                        'createTaskDismissAnimation'),
    'recents recommended reset': (src / 'FeatureActivity.java',
                                  '恢复演示推荐值'),
    'recents recommended source of truth': (src / 'RecentsRecommendedConfig.java',
                                            'COMPRESSION_PERCENT = 32'),
    'recents exception layout recovery': (src / 'hook/LauncherRecentsStackHook.java',
                                          'recoverLastStack'),
    'single memory overlay': (src / 'hook/LauncherRecentsStackHook.java',
                              'MemoryOverlayState memoryOverlay'),
    'systemui android16': (src / 'hook/SystemUiHook.java', 'calculateIconXTranslations'),
    'systemui live provider observer': (src / 'hook/SystemUiHook.java',
                                        'CONFIG_CHANGES'),
    'systemui reversible translations': (src / 'hook/SystemUiHook.java',
                                         'clearOffsets()'),
    'statusbar dynamic icon discovery': (src / 'hook/SystemUiHook.java',
                                         'SYSTEMUI_DISCOVERED_ICONS'),
    'statusbar dual clock': (src / 'hook/StatusBarClockFormatter.java',
                             'secondPattern'),
    'statusbar measured layout diagnostics': (src / 'hook/SystemUiHook.java',
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
                                      'event.put("sampleEventTime", scaledSampleTime)'),
    'combo on-demand cache hit': (src / 'hook/ComboMotionFileScaler.java',
                                  'Result.cacheHit(destination.getAbsolutePath(), identity)'),
    'combo integer rate range': (src / 'FeatureActivity.java',
                                 'AppConfig.COMBO_SPEED_RATE, "播放倍率（×）", 1, 10, false'),
    'recents dismiss settle frames': (src / 'hook/LauncherRecentsStackHook.java',
                                      'DISMISS_SETTLE_FRAMES'),
}

for name, (path, needle) in checks.items():
    assert path.is_file(), f'{name}: missing {path}'
    text = path.read_text(encoding='utf-8')
    assert needle in text, f'{name}: missing {needle}'

recents_hook_text = (src / 'hook/LauncherRecentsStackHook.java').read_text(
    encoding='utf-8')
assert 'installDismissHooks(module, taskView' not in recents_hook_text, \
    'TaskView dismiss setters must never be intercepted'
assert 'name.contains("dismiss")' not in recents_hook_text, \
    'broad dismiss-name interception regressed'
assert 'setDismissTranslationX' not in recents_hook_text, \
    'per-frame TaskView dismiss setter interception regressed'
for transient_state in ('hold_no_cards', 'hold_no_interval'):
    assert transient_state in recents_hook_text, \
        f'recents transient hold path missing: {transient_state}'
assert '!entry.overviewEnabled || contentAlpha <= 0.01f' not in recents_hook_text, \
    'stale OEM content alpha must not block an enabled overview entry'
assert 'addOnPreDrawListener' in recents_hook_text, \
    'recents transforms must be applied after native frame layout'
for native_composition_method in ('applyTranslationX', 'applyTranslationY', 'applyScale'):
    assert native_composition_method in recents_hook_text, \
        f'OEM TaskView composition hook missing: {native_composition_method}'
assert 'rightState.deckTranslationX -= correction' in recents_hook_text, \
    'front-pair correction must survive the next OEM transform composition'
assert 'child.setTranslationX(state.baseTranslationX + visualOffset)' \
       not in recents_hook_text, \
    'raw one-shot TaskView translation ownership regressed'
assert 'DISMISS_MAX_FRAMES' not in recents_hook_text, \
    'dismiss path must not poll full deck layout for dozens of frames'
assert 'DismissFrameRunner' not in recents_hook_text, \
    'legacy per-frame dismiss traversal regressed'
recents_math_text = (src / 'hook/RecentsStackMath.java').read_text(
    encoding='utf-8')
assert 'pageProgress < 0.0f || pageProgress > 1.0f' in recents_math_text, \
    'front-pair endpoint overlap guard regressed'

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
    'com.zte.cn.doubleapp', 'com.zte.mifavor.launcher',
    'cn.nubia.gamelauncher', 'cn.nubia.gameassist', 'cn.nubia.gamehelperline',
    'cn.nubia.gamehelpmodule'
}, scope
assert 'com.smallcircle.heartvoice' not in scope

for source in (app / 'src/main/java').rglob('*.java'):
    text = source.read_text(encoding='utf-8')
    assert 'de.robv.android.xposed' not in text, f'legacy Xposed API in {source}'
    assert '/data/adb/modules/ls_augment/bin/' not in text, f'old KSU runtime dependency in {source}'
    assert 'augmentctl toggle' not in text, f'old KSU tile dependency in {source}'

entry = (app / 'src/main/resources/META-INF/xposed/java_init.list').read_text().strip()
assert entry == 'ls.augment.com.hook.AugmentModule'
assert not (app / 'src/main/assets/xposed_init').exists()
assert not (app / 'libs/xposed-api-stub.jar').exists()

builder = (root / 'build-module.sh').read_text(encoding='utf-8')
assert 'KernelSU.zip' not in builder
assert ':app:assembleDebug' in builder

manifest_text = (app / 'src/main/AndroidManifest.xml').read_text(encoding='utf-8')
assert 'android.permission.INTERNET' not in manifest_text, \
    'user analytics/cloud collection must remain disabled'

print('Project checks: OK')
