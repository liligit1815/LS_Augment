#!/usr/bin/env bash
set -euo pipefail

# Historical filename retained as a compatibility entry point. It now builds
# only the single LS_Augment APK; no KernelSU ZIP is produced.
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/out"
# version.properties is the single source of truth. Gradle reads it without
# mutating it, so the packaged filename always matches the APK metadata.
VERSION_FILE="$ROOT/android/version.properties"
if [[ ! -f "$VERSION_FILE" ]]; then
  echo "Missing version file: $VERSION_FILE" >&2
  exit 2
fi
VERSION="$(sed -n 's/^versionName=//p' "$VERSION_FILE" | tail -1 | tr -d '\r')"
if [[ -z "$VERSION" ]]; then
  echo "Missing versionName in $VERSION_FILE" >&2
  exit 2
fi
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
