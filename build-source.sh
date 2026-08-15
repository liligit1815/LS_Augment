#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/out"
NAME="LS_Augment-v2.0.0-alpha1-test20035-source.zip"

if [[ -z "${PYTHON_BIN:-}" ]]; then
  for candidate in python3 python; do
    if command -v "$candidate" >/dev/null 2>&1 \
        && "$candidate" -c 'import sys' >/dev/null 2>&1; then
      PYTHON_BIN="$candidate"
      break
    fi
  done
fi
if [[ -z "${PYTHON_BIN:-}" ]]; then
  echo "Python 3 is required (set PYTHON_BIN if it is not on PATH)." >&2
  exit 2
fi

mkdir -p "$OUT"
rm -f "$OUT/$NAME" "$OUT/$NAME.sha256"
if command -v zip >/dev/null 2>&1; then
  (
    cd "$ROOT/.."
    zip -qr "$OUT/$NAME" "$(basename "$ROOT")" \
      -x '*/.git/*' '*/.signing/*' '*/out/*' '*/android/.gradle/*' \
         '*/android/app/build/*' '*/module/apk/*' '*/work/*' \
         '*.apk' '*.mp4' '*/LSPosed_*.zip' '*.jks' '*.keystore' '*.p12' \
         '*.pem' '*.key' '*heartvoice*' '*HeartVoice*' '*.DS_Store'
  )
else
  "$PYTHON_BIN" - "$ROOT/.." "$(basename "$ROOT")" "$OUT/$NAME" <<'PY'
import sys
import zipfile
from pathlib import Path

workspace = Path(sys.argv[1])
project_name = sys.argv[2]
output = Path(sys.argv[3])
project = workspace / project_name
with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
    for path in sorted(project.rglob('*')):
        relative_path = path.relative_to(workspace).as_posix()
        if not path.is_file():
            continue
        wrapped = f'/{relative_path}'
        if '/.git/' in wrapped or '/.signing/' in wrapped or '/out/' in wrapped \
                or '/android/.gradle/' in wrapped or '/android/app/build/' in wrapped \
                or '/module/apk/' in wrapped or '/work/' in wrapped \
                or path.suffix.lower() in {'.apk', '.mp4', '.jks', '.keystore', '.p12', '.pem', '.key'} \
                or 'heartvoice' in path.name.lower() \
                or (path.parent == project and path.name.startswith('LSPosed_') and path.suffix.lower() == '.zip') \
                or path.name == '.DS_Store':
            continue
        info = zipfile.ZipInfo.from_file(path, relative_path)
        info.compress_type = zipfile.ZIP_DEFLATED
        mode = 0o100755 if (path.suffix == '.sh' or relative_path.endswith('/bin/augmentctl')) else 0o100644
        info.external_attr = mode << 16
        archive.writestr(info, path.read_bytes())
PY
fi
(cd "$OUT" && sha256sum "$NAME" > "$NAME.sha256")
echo "Built: $OUT/$NAME"
