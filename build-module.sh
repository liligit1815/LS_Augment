#!/usr/bin/env bash
set -euo pipefail

# Historical filename retained as a compatibility entry point. It now builds
# only the single LS_Augment APK; no KernelSU ZIP is produced.
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/out"
VERSION="2.0.0-alpha1-test20035"
GRADLE_BIN="${GRADLE_BIN:-gradle}"
APK="$ROOT/android/app/build/outputs/apk/debug/app-debug.apk"
NAME="LS_Augment-v${VERSION}.apk"

mkdir -p "$OUT"
"$GRADLE_BIN" -p "$ROOT/android" :app:assembleDebug
python "$ROOT/tools/check-modern-xposed.py" "$APK"
python "$ROOT/tools/check-binary-manifest.py" "$APK"
python "$ROOT/tools/check_apk_alignment.py" "$APK"
if command -v apksigner >/dev/null 2>&1; then
  apksigner verify --verbose --print-certs "$APK"
fi
cp -f "$APK" "$OUT/$NAME"
(cd "$OUT" && sha256sum "$NAME" > "$NAME.sha256")
echo "Built: $OUT/$NAME"
