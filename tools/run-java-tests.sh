#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="${TMPDIR:-/tmp}/ls_augment_java_tests.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP"

javac -source 17 -target 17 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SignatureMismatchInstallPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarClockFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarMetricsFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarLayoutSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConfigSchema.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AppPackageSet.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/FanCalibrationData.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ScreenAutomationPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ModuleRuntimeStatus.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarGridSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/AudioGainPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/BatteryLifePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepPlan.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StepMath.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/LauncherOverrides.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarGridLayout.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarNetworkDisplay.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/ConfigSnapshot.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HookTargetRegistry.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/UserResolution.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireInputDetector.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireNativeLayout.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireCaptureProtocol.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireReadOnlyCaptureProtocol.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireLifecyclePolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RapidFireRouteEvidence.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/AiTriggerTimingPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ComboSpeedPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/FanControlPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HiddenEntrySession.java" \
  "$ROOT/tools/TestSettingsTargetMatcher.java" \
  "$ROOT/tools/TestSignatureMismatchInstallPolicy.java" \
  "$ROOT/tools/TestStatusBarFeatureSupport.java" \
  "$ROOT/tools/TestComboSpeedPolicy.java" \
  "$ROOT/tools/TestFanControlPolicy.java" \
  "$ROOT/tools/TestHiddenEntrySession.java" \
  "$ROOT/tools/TestConfigSnapshot.java" \
  "$ROOT/tools/TestHookTargetRegistry.java" \
  "$ROOT/tools/TestUserResolution.java" \
  "$ROOT/tools/TestRapidFireInputDetector.java" \
  "$ROOT/tools/TestRapidFireCaptureProtocol.java" \
  "$ROOT/tools/TestRapidFireLifecyclePolicy.java" \
  "$ROOT/tools/TestRapidFireRouteEvidence.java" \
  "$ROOT/tools/TestAiTriggerTimingPolicy.java" \
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

java -cp "$TMP" ls.augment.com.hook.TestSettingsTargetMatcher
java -cp "$TMP" ls.augment.com.hook.TestSignatureMismatchInstallPolicy
java -cp "$TMP" ls.augment.com.hook.TestStatusBarFeatureSupport
java -cp "$TMP" ls.augment.com.hook.TestComboSpeedPolicy
java -cp "$TMP" ls.augment.com.hook.TestFanControlPolicy
java -cp "$TMP" ls.augment.com.TestHiddenEntrySession
java -cp "$TMP" ls.augment.com.TestConfigSnapshot
java -cp "$TMP" ls.augment.com.TestHookTargetRegistry \
  "$ROOT/android/app/src/main/resources/META-INF/xposed/scope.list"
java -cp "$TMP" ls.augment.com.TestUserResolution
java -cp "$TMP" ls.augment.com.TestRapidFireInputDetector
java -cp "$TMP" ls.augment.com.TestRapidFireCaptureProtocol
java -cp "$TMP" ls.augment.com.TestRapidFireLifecyclePolicy
java -cp "$TMP" ls.augment.com.TestRapidFireRouteEvidence
java -cp "$TMP" ls.augment.com.hook.TestAiTriggerTimingPolicy
java -cp "$TMP" ls.augment.com.TestScreenAutomationPolicy
java -cp "$TMP" ls.augment.com.TestRapidFireNativeLayout
java -cp "$TMP" ls.augment.com.TestAudioGainPolicy
java -cp "$TMP" ls.augment.com.TestBatteryLifePolicy
java -cp "$TMP" TestStepPlan
java -cp "$TMP" TestLauncherOverrides
java -cp "$TMP" TestThermalTelemetry

java -cp "$TMP" ls.augment.com.TestBoundedLog
