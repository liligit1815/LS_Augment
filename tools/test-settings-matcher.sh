#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="${TMPDIR:-/tmp}/ls_augment_matcher_test.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP"
javac -source 8 -target 8 -d "$TMP" \
  "$ROOT/android/app/src/main/java/ls/augment/com/hook/SettingsTargetMatcher.java" \
  "$ROOT/tools/TestSettingsTargetMatcher.java"
java -cp "$TMP" ls.augment.com.hook.TestSettingsTargetMatcher
