#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="${TMPDIR:-/tmp}/ls_augment_java_tests.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP"

javac -encoding UTF-8 -source 17 -target 17 -d "$TMP" \
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
  "$ROOT/android/app/src/main/java/ls/augment/com/EnhancementOption.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/EnhancementCatalog.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemUiOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/SystemUiPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/GameOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AppearanceOptions.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ShoulderQuickSwitchPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConnectionExtrasPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/OtaBufferPolicy.java" \
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
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanLevelCommand.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanNativeSettle.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ScreenAutomationPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ModuleRuntimeStatus.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarGridSpec.java" \
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
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarPresets.java" \
  "$ROOT/tools/TestStatusBarRedesign.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarTransform.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherCompatibility.java" \
  "$ROOT/tools/TestStatusBarTransform.java" \
  "$ROOT/tools/TestLauncherCompatibility.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherMemoryPresentation.java" \
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
  "$ROOT/tools/TestBoundedLog.java" \
  "$ROOT/tools/TestStepPlan.java" \
  "$ROOT/tools/TestLauncherOverrides.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ThermalTelemetry.java" \
  "$ROOT/tools/TestThermalTelemetry.java"

java -cp "$TMP" ls.augment.com.TestHideTargetCodec
java -cp "$TMP" ls.augment.com.hook.TestSettingsTargetMatcher
java -cp "$TMP" ls.augment.com.hook.TestSettingsEntryBindings
java -cp "$TMP" ls.augment.com.hook.TestSignatureMismatchInstallPolicy
java -cp "$TMP" ls.augment.com.hook.TestStatusBarFeatureSupport
java -cp "$TMP" ls.augment.com.hook.TestSignalStackLayout
java -cp "$TMP" ls.augment.com.TestPairedStatusBarRows
java -cp "$TMP" ls.augment.com.TestStatusBarRedesign
java -cp "$TMP" ls.augment.com.hook.ClockRegressionCases
java -cp "$TMP" ls.augment.com.hook.TestComboSpeedPolicy
java -cp "$TMP" ls.augment.com.hook.TestFanControlPolicy
java -cp "$TMP" TestFanCalibrationOutcome
java -cp "$TMP" ls.augment.com.hook.TestFanLevelCommand
java -cp "$TMP" ls.augment.com.hook.TestFanNativeSettle
java -cp "$TMP" ls.augment.com.TestHiddenEntrySession
java -cp "$TMP" ls.augment.com.TestHideBatchExecutor
java -cp "$TMP" ls.augment.com.TestHidePackageSnapshot
java -cp "$TMP" ls.augment.com.TestRootShellTransport
java -cp "$TMP" ls.augment.com.TestConfigSnapshot
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

java -cp "$TMP" ls.augment.com.TestBoundedLog
java -cp "$TMP" ls.augment.com.TestStatusBarTransform
java -cp "$TMP" ls.augment.com.TestLauncherCompatibility
java -cp "$TMP" TestLauncherMemoryPresentation
java -cp "$TMP" ls.augment.com.hook.TestLauncherPageOrder
java -cp "$TMP" ls.augment.com.TestEnhancementCatalog
java -cp "$TMP" ls.augment.com.TestHookAppCatalog
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
