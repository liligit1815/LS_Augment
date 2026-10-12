#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="${TMPDIR:-/tmp}/ls_augment_java_tests.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP"

javac -encoding UTF-8 -source 17 -target 17 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HealthAccountState.java" \
  "$ROOT/tools/TestHealthAccountState.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SmsVerificationCode.java" \
  "$ROOT/tools/TestSmsVerificationCode.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BrightnessRange.java" \
  "$ROOT/tools/TestBrightnessRange.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideTargetCodec.java" \
  "$ROOT/tools/TestHideTargetCodec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SettingsEntryBindings.java" \
  "$ROOT/tools/TestSettingsEntryBindings.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ControlCenterPercent.java" \
  "$ROOT/tools/TestControlCenterPercent.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/NotificationWeatherText.java" \
  "$ROOT/tools/TestNotificationWeatherText.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SignatureMismatchInstallPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarClockFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ChineseCalendarText.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ChineseCalendarData.java" \
  "$ROOT/android/app/src/androidTest/java/ls/augment/com/hook/ClockRegressionCases.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarMetricsFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SignalStackLayout.java" \
  "$ROOT/tools/TestSignalStackLayout.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarLayoutSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConfigSchema.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/FanScreenOffPolicy.java" \
  "$ROOT/tools/TestFanScreenOffPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarIconCatalog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarThemeSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarSurfaceSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarAssetPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarVisibilitySpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarFontSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarAssetReferences.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarImagePolicy.java" \
  "$ROOT/tools/TestStatusBarAssets.java" \
  "$ROOT/tools/TestStatusBarAssetPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/EnhancementOption.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/EnhancementCatalog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LiftArcOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/NotificationAppearanceOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ControlCenterAppearanceOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarIconLayoutOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarIconSpacingSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarIconOrderPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/NotificationSummaryOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/CarrierTextOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/NativeFeatureGroups.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemUiOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BackGestureIconPolicy.java" \
  "$ROOT/tools/TestBackGestureIconPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemUiPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/GameOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/GamePerformanceMonitorConfig.java" \
  "$ROOT/tools/TestGamePerformanceMonitorConfig.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherGridSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherGridSafety.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherGridMigrationCheck.java" \
  "$ROOT/tools/TestLauncherGridSpec.java" \
  "$ROOT/tools/TestLauncherGridSafety.java" \
  "$ROOT/tools/TestLauncherGridMigrationCheck.java" \
  "$ROOT/tools/TestLauncherGridConfig.java" \
  "$ROOT/tools/TestLauncherGridBackup.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AppearanceOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/CollabOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/CollabPolicy.java" \
  "$ROOT/tools/TestCollabPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/EntryVisibilityOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/EntryVisibilityPolicy.java" \
  "$ROOT/tools/TestEntryVisibilityPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/GlassOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LiquidGlassPolicy.java" \
  "$ROOT/tools/TestLiquidGlassPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LiquidGlassDockPolicy.java" \
  "$ROOT/tools/TestLiquidGlassDockPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ShoulderQuickSwitchPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConnectionExtrasPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/OtaBufferPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/OtaPackageLabel.java" \
  "$ROOT/tools/TestOtaPackageLabel.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemRulesPolicy.java" \
  "$ROOT/tools/TestSystemRulesPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/GameExtrasPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/HookCompatibility.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/HomeCandidateDexResolver.java" \
  "$ROOT/tools/TestAutomaticHookCompatibility.java" \
  "$ROOT/tools/TestHomeCandidateDexResolver.java" \
  "$ROOT/tools/TestEnhancementCatalog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HookAppCatalog.java" \
  "$ROOT/tools/TestHookAppCatalog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/GlassBackdropBlur.java" \
  "$ROOT/tools/TestGlassBackdropBlur.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/CompatibilityReport.java" \
  "$ROOT/tools/TestCompatibilityReport.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AboutMotionState.java" \
  "$ROOT/tools/TestAboutMotionState.java" \
  "$ROOT/tools/TestShoulderQuickSwitchPolicy.java" \
  "$ROOT/tools/TestSystemUiPolicy.java" \
  "$ROOT/tools/TestGameExtrasPolicy.java" \
  "$ROOT/tools/TestConnectionExtrasPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AppPackageSet.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/FanCalibrationData.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/FanCalibrationOutcome.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/FanTilePolicy.java" \
  "$ROOT/tools/TestFanTilePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanLevelCommand.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanNativeSettle.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanRpmStartup.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ScreenAutomationPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ModuleRuntimeStatus.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ModuleEnvironmentState.java" \
  "$ROOT/tools/TestModuleEnvironment.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarGridSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarSheetSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarSheetLayout.java" \
  "$ROOT/tools/TestStatusBarSheet.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AudioGainPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BatteryLifePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepPlan.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepMath.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepDailyLimit.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepRecordSelection.java" \
  "$ROOT/tools/TestStepDailyLimit.java" \
  "$ROOT/tools/TestStepRecordSelection.java" \
  "$ROOT/tools/TestHealthDailyLimitConfig.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherOverrides.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarGridLayout.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarAdaptiveLayout.java" \
  "$ROOT/tools/TestStatusBarCustomization.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarPresets.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConfigEditDraft.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarPresetPreview.java" \
  "$ROOT/tools/TestStatusBarPresetPreview.java" \
  "$ROOT/tools/TestStatusBarRedesign.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarTransform.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherCompatibility.java" \
  "$ROOT/tools/TestStatusBarTransform.java" \
  "$ROOT/tools/TestLauncherCompatibility.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherMemoryPresentation.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherMemoryLayout.java" \
  "$ROOT/tools/TestLauncherMemoryPresentation.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/LauncherPageOrder.java" \
  "$ROOT/tools/TestLauncherPageOrder.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarNetworkDisplay.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConfigSnapshot.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BootConfigMirror.java" \
  "$ROOT/tools/TestBootConfigMirror.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HookTargetRegistry.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/UserResolution.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireInputDetector.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireNativeLayout.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireCaptureProtocol.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireReadOnlyCaptureProtocol.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireLifecyclePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireRouteEvidence.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/AiTriggerTimingPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/AiTemplatePixels.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/AiTemplateMatcher.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ComboSpeedPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ComboPlaybackPending.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanControlPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HiddenEntrySession.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideBatchExecutor.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HidePackageSnapshot.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RootShell.java" \
  "$ROOT/tools/TestHideBatchExecutor.java" \
  "$ROOT/tools/TestHidePackageSnapshot.java" \
  "$ROOT/tools/TestRootShellTransport.java" \
  "$ROOT/tools/TestSettingsTargetMatcher.java" \
  "$ROOT/tools/TestSignatureMismatchInstallPolicy.java" \
  "$ROOT/tools/TestStatusBarFeatureSupport.java" \
  "$ROOT/tools/TestPairedStatusBarRows.java" \
  "$ROOT/tools/TestComboSpeedPolicy.java" \
  "$ROOT/tools/TestFanControlPolicy.java" \
  "$ROOT/tools/TestFanCalibrationOutcome.java" \
  "$ROOT/tools/TestFanLevelCommand.java" \
  "$ROOT/tools/TestFanNativeSettle.java" \
  "$ROOT/tools/TestFanRpmStartup.java" \
  "$ROOT/tools/TestHiddenEntrySession.java" \
  "$ROOT/tools/TestConfigSnapshot.java" \
  "$ROOT/tools/TestHookTargetRegistry.java" \
  "$ROOT/tools/TestUserResolution.java" \
  "$ROOT/tools/TestRapidFireInputDetector.java" \
  "$ROOT/tools/TestRapidFireCaptureProtocol.java" \
  "$ROOT/tools/TestRapidFireLifecyclePolicy.java" \
  "$ROOT/tools/TestRapidFireRouteEvidence.java" \
  "$ROOT/tools/TestAiTriggerTimingPolicy.java" \
  "$ROOT/tools/TestAiTemplatePixels.java" \
  "$ROOT/tools/TestAiTemplateMatcher.java" \
  "$ROOT/tools/TestScreenAutomationPolicy.java" \
  "$ROOT/tools/TestRapidFireNativeLayout.java" \
  "$ROOT/tools/TestAudioGainPolicy.java" \
  "$ROOT/tools/TestBatteryLifePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BoundedLog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LogRepeatPolicy.java" \
  "$ROOT/tools/TestStatusBarHeight.java" \
  "$ROOT/tools/TestBoundedLog.java" \
  "$ROOT/tools/TestStepPlan.java" \
  "$ROOT/tools/TestLauncherOverrides.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ThermalTelemetry.java" \
  "$ROOT/tools/TestThermalTelemetry.java"

java -cp "$TMP" ls.augment.com.TestHideTargetCodec
java -cp "$TMP" ls.augment.com.TestCollabPolicy
java -cp "$TMP" TestEntryVisibilityPolicy
java -cp "$TMP" TestLiquidGlassPolicy
java -cp "$TMP" ls.augment.com.TestLiquidGlassDockPolicy
java -cp "$TMP" ls.augment.com.hook.TestSettingsTargetMatcher
java -cp "$TMP" ls.augment.com.hook.TestSettingsEntryBindings
java -cp "$TMP" ls.augment.com.hook.TestSignatureMismatchInstallPolicy
java -cp "$TMP" ls.augment.com.hook.TestStatusBarFeatureSupport
java -cp "$TMP" ls.augment.com.hook.TestSignalStackLayout
java -cp "$TMP" ls.augment.com.TestPairedStatusBarRows
java -cp "$TMP" ls.augment.com.TestStatusBarRedesign
java -cp "$TMP" ls.augment.com.TestStatusBarCustomization
java -cp "$TMP" ls.augment.com.TestStatusBarSheet
java -cp "$TMP" ls.augment.com.TestStatusBarPresetPreview
java -cp "$TMP" ls.augment.com.TestStatusBarAssets
java -cp "$TMP" ls.augment.com.TestStatusBarAssetPolicy
java -cp "$TMP" ls.augment.com.hook.ClockRegressionCases
java -cp "$TMP" ls.augment.com.hook.TestComboSpeedPolicy
java -cp "$TMP" ls.augment.com.hook.TestFanControlPolicy
java -cp "$TMP" TestFanTilePolicy
java -cp "$TMP" TestFanCalibrationOutcome
java -cp "$TMP" ls.augment.com.hook.TestFanLevelCommand
java -cp "$TMP" ls.augment.com.hook.TestFanNativeSettle
java -cp "$TMP" ls.augment.com.hook.TestFanRpmStartup
java -cp "$TMP" ls.augment.com.TestHiddenEntrySession
java -cp "$TMP" ls.augment.com.TestHideBatchExecutor
java -cp "$TMP" ls.augment.com.TestHidePackageSnapshot
java -cp "$TMP" ls.augment.com.TestRootShellTransport
java -cp "$TMP" ls.augment.com.TestConfigSnapshot
java -cp "$TMP" ls.augment.com.TestSmsVerificationCode
java -cp "$TMP" ls.augment.com.TestBootConfigMirror
java -cp "$TMP" ls.augment.com.TestHookTargetRegistry \
  "$ROOT/android/app/src/main/resources/META-INF/xposed/scope.list"
java -cp "$TMP" ls.augment.com.TestUserResolution
java -cp "$TMP" ls.augment.com.TestRapidFireInputDetector
java -cp "$TMP" ls.augment.com.TestRapidFireCaptureProtocol
java -cp "$TMP" ls.augment.com.TestRapidFireLifecyclePolicy
java -cp "$TMP" ls.augment.com.TestRapidFireRouteEvidence
java -cp "$TMP" ls.augment.com.hook.TestAiTriggerTimingPolicy
java -cp "$TMP" ls.augment.com.hook.TestAiTemplatePixels
java -cp "$TMP" ls.augment.com.hook.TestAiTemplateMatcher
java -cp "$TMP" ls.augment.com.TestScreenAutomationPolicy
java -cp "$TMP" ls.augment.com.TestRapidFireNativeLayout
java -cp "$TMP" ls.augment.com.TestAudioGainPolicy
java -cp "$TMP" ls.augment.com.TestBatteryLifePolicy
java -cp "$TMP" TestStepPlan
java -cp "$TMP" ls.augment.com.TestStepDailyLimit
java -cp "$TMP" ls.augment.com.TestStepRecordSelection
java -cp "$TMP" ls.augment.com.TestHealthDailyLimitConfig
java -cp "$TMP" TestLauncherOverrides
java -cp "$TMP" TestThermalTelemetry

java -cp "$TMP" ls.augment.com.TestStatusBarHeight
java -cp "$TMP" ls.augment.com.TestBoundedLog
java -cp "$TMP" ls.augment.com.TestStatusBarTransform
java -cp "$TMP" ls.augment.com.TestLauncherCompatibility
java -cp "$TMP" ls.augment.com.TestLauncherGridSpec
java -cp "$TMP" ls.augment.com.TestLauncherGridSafety
java -cp "$TMP" ls.augment.com.TestLauncherGridMigrationCheck
java -cp "$TMP" ls.augment.com.TestLauncherGridConfig
java -cp "$TMP" ls.augment.com.TestLauncherGridBackup "$ROOT"
java -cp "$TMP" TestLauncherMemoryPresentation
java -cp "$TMP" ls.augment.com.hook.TestLauncherPageOrder
java -cp "$TMP" ls.augment.com.TestEnhancementCatalog
java -cp "$TMP" ls.augment.com.TestOtaPackageLabel
java -cp "$TMP" ls.augment.com.TestHookAppCatalog
java -cp "$TMP" ls.augment.com.TestModuleEnvironment
java -cp "$TMP" ls.augment.com.TestGlassBackdropBlur
java -cp "$TMP" ls.augment.com.TestCompatibilityReport
java -cp "$TMP" ls.augment.com.TestAboutMotionState
java -cp "$TMP" ls.augment.com.TestShoulderQuickSwitchPolicy
java -cp "$TMP" ls.augment.com.TestSystemUiPolicy
java -cp "$TMP" ls.augment.com.hook.TestGameExtrasPolicy
java -cp "$TMP" ls.augment.com.hook.TestAutomaticHookCompatibility
java -cp "$TMP" ls.augment.com.TestConnectionExtrasPolicy
java -cp "$TMP" ls.augment.com.TestSystemRulesPolicy
java -cp "$TMP" ls.augment.com.hook.TestControlCenterPercent
java -cp "$TMP" ls.augment.com.TestBackGestureIconPolicy
java -cp "$TMP" ls.augment.com.hook.TestNotificationWeatherText

# Durable finite Root transaction client. Explicit I/O/engine models; never launches su.
javac -encoding UTF-8 -source 17 -target 17 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RootShell.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideTargetCodec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRecoveryJournal.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRootProtocol.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRootServer.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRootPendingStore.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRestoreGrantLedger.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRestoreGrantStore.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HideRootClient.java" \
  "$ROOT/tools/TestHideRootTransactions.java"
java -cp "$TMP" ls.augment.com.TestHideRootTransactions

# OEM contracts for NX769J/Android 15, while retaining NX809J behavior.
javac -encoding UTF-8 --release 17 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanCompatibilityProfile.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanPowerLease.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ShoulderHookTargets.java" \
  "$ROOT/tools/TestFanCompatibilityProfile.java" \
  "$ROOT/tools/TestFanPowerLease.java" \
  "$ROOT/tools/TestShoulderHookTargets.java"
java -cp "$TMP" ls.augment.com.hook.TestFanCompatibilityProfile
java -cp "$TMP" ls.augment.com.hook.TestFanPowerLease
java -cp "$TMP" ls.augment.com.hook.TestShoulderHookTargets

# Device-feedback regressions execute production callbacks with Android/OEM doubles.
python "$ROOT/tools/test-fan-fixed-runtime.py"
java -cp "$TMP" TestFanScreenOffPolicy
python "$ROOT/tools/test-fan-screen-off-runtime.py"
python "$ROOT/tools/test-dynamic-island-runtime.py"
python "$ROOT/tools/test-island-foreground-runtime.py"
python "$ROOT/tools/test-notification-media-card-runtime.py"
python "$ROOT/tools/test-shoulder-runtime.py"
python "$ROOT/tools/test-sms-clipboard-runtime.py"
python "$ROOT/tools/test-game-plugin-switch.py"
python "$ROOT/tools/test-statusbar-content-bounds.py"
python "$ROOT/tools/test-statusbar-window-sizing.py"
python "$ROOT/tools/test-statusbar-retired-transfer.py"
python "$ROOT/tools/test-statusbar-window-offset.py"
python "$ROOT/tools/test-statusbar-native-lifecycle.py"
python "$ROOT/tools/test-statusbar-explicit-clips.py"
python "$ROOT/tools/test-statusbar-recents.py"
python "$ROOT/tools/test-back-gesture-runtime.py"
python "$ROOT/tools/test-cleanup-bomb-runtime.py"
python "$ROOT/tools/test-launcher-grid-runtime.py"
python "$ROOT/tools/test-launcher-customization-runtime.py"
python "$ROOT/tools/test-volume-percent-runtime.py"
python "$ROOT/tools/test-power-menu-runtime.py"
python "$ROOT/tools/test-power-menu-lifecycle.py"
python "$ROOT/tools/test-power-mode-control.py"
python "$ROOT/tools/test-entry-visibility-runtime.py"
python "$ROOT/tools/test-collab-runtime.py"
python "$ROOT/tools/test-modern-fingerprint-runtime.py"
python "$ROOT/tools/test-compact-signal-painter.py"
python "$ROOT/tools/test-dual-signal-badges.py"
python "$ROOT/tools/test-dual-signal-lifecycle.py"
python "$ROOT/tools/test-dual-signal-slot-identity.py"
python "$ROOT/tools/test-statusbar-clock-scheduler.py"
python "$ROOT/tools/test-statusbar-clock-fallback-geometry.py"
python "$ROOT/tools/test-liquid-glass-dock-runtime.py"
python "$ROOT/tools/test-third-party-recents-background.py"
python "$ROOT/tools/test-liquid-glass-drawable-runtime.py"
python "$ROOT/tools/test-liquid-glass-control-center-runtime.py"
python "$ROOT/tools/test-liquid-glass-runtime.py"
python "$ROOT/tools/test-statusbar-failure-cleanup.py"
python "$ROOT/tools/test-freeform-launch-runtime.py"
python "$ROOT/tools/test-bluetooth-icon-runtime.py"
python "$ROOT/tools/test-vpn-icon-runtime.py"
python "$ROOT/tools/test-statusbar-snapshot-refresh.py"
python "$ROOT/tools/test-statusbar-artwork-runtime.py"
python "$ROOT/tools/test-statusbar-static-ink-fit.py"
python "$ROOT/tools/test-statusbar-assets-isolation.py"
python "$ROOT/tools/test-statusbar-assets-connectivity-lifecycle.py"
python "$ROOT/tools/test-statusbar-combined-activity.py"
python "$ROOT/tools/test-statusbar-native-state-table.py"
python "$ROOT/tools/test-statusbar-assets-hotpath.py"
python "$ROOT/tools/test-statusbar-drawable-wrapper.py"
python "$ROOT/tools/test-statusbar-inventory-identifiers.py"
python "$ROOT/tools/test-statusbar-font-runtime.py"
javac -encoding UTF-8 -cp "$TMP" -d "$TMP" "$ROOT/tools/TestBluetoothFreeformConfig.java"
java -cp "$TMP" ls.augment.com.TestBluetoothFreeformConfig
java -cp "$TMP" ls.augment.com.TestGamePerformanceMonitorConfig
java -cp "$TMP" ls.augment.com.TestBrightnessRange
java -cp "$TMP" ls.augment.com.TestHealthAccountState
