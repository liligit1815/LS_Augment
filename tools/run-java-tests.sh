#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="${TMPDIR:-/tmp}/ls_augment_java_tests.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP"

javac -source 17 -target 17 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/RecentsStackMath.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/RecentsTransformComposition.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/RecentsDismissPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/RecentsMemoryFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/RecentsRecommendedConfig.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarClockFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/StatusBarMetricsFormatter.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/StatusBarLayoutSpec.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/ComboSpeedPolicy.java" \
  "$ROOT/android/app/src/main/java/ls/augment/com/HiddenEntrySession.java" \
  "$ROOT/tools/TestSettingsTargetMatcher.java" \
  "$ROOT/tools/TestRecentsStackMath.java" \
  "$ROOT/tools/TestRecentsTransformComposition.java" \
  "$ROOT/tools/TestRecentsDismissPolicy.java" \
  "$ROOT/tools/TestRecentsRecommendedConfig.java" \
  "$ROOT/tools/TestStatusBarFeatureSupport.java" \
  "$ROOT/tools/TestComboSpeedPolicy.java" \
  "$ROOT/tools/TestHiddenEntrySession.java"

java -cp "$TMP" ls.augment.com.hook.TestSettingsTargetMatcher
java -cp "$TMP" ls.augment.com.hook.TestRecentsStackMath
java -cp "$TMP" ls.augment.com.hook.TestRecentsTransformComposition
java -cp "$TMP" ls.augment.com.hook.TestRecentsDismissPolicy
java -cp "$TMP" ls.augment.com.TestRecentsRecommendedConfig
java -cp "$TMP" ls.augment.com.hook.TestStatusBarFeatureSupport
java -cp "$TMP" ls.augment.com.hook.TestComboSpeedPolicy
java -cp "$TMP" ls.augment.com.TestHiddenEntrySession
