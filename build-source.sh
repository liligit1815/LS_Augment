#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/out"
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
NAME="LS_Augment-v${VERSION}-source.zip"

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
"$PYTHON_BIN" - "$ROOT/.." "$(basename "$ROOT")" "$OUT/$NAME" <<'PY'
import os
import sys
import zipfile
from pathlib import Path

workspace = Path(sys.argv[1])
project_name = sys.argv[2]
output = Path(sys.argv[3])
project = workspace / project_name
excluded_dirs = {
    '.git', '.signing', '.idea', '.gradle', '.cxx', 'build', 'out', 'work',
    'node_modules', '.next', '.vinext', '.wrangler', 'dist', '__pycache__',
}
excluded_suffixes = {
    '.apk', '.idsig', '.aab', '.apks', '.xapk', '.mp4', '.webm', '.mov',
    '.jks', '.keystore', '.p12', '.pfx', '.pem', '.key',
    '.pyc', '.pyo', '.class', '.log', '.tsbuildinfo', '.iml',
}
launcher_inputs = {
    'redmagic-launcher/original.apk',
    'redmagic-launcher/tooling/framework-res-NX809J.apk',
    'redmagic-launcher/framework/cache/1.apk',
}
with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
    for directory, dirs, files in os.walk(project):
        folder = Path(directory)
        relative_folder = folder.relative_to(project).as_posix()
        dirs[:] = sorted(d for d in dirs if d not in excluded_dirs
                         and not (folder == project and d in {'Logs', 'audit-report', 'backup'})
                         and not (relative_folder == 'redmagic-launcher/helper-src' and d.startswith('build'))
                         and not (relative_folder.endswith('module') and d in {'apk', 'logs'})
                         and not (folder / d).is_symlink())
        for name in sorted(files):
            path = folder / name
            relative = path.relative_to(project).as_posix()
            public_certificate = relative == 'tools/signing/dev41-test-cert.pem'
            if path.is_symlink() or not path.is_file():
                continue
            if (path.suffix.lower() in excluded_suffixes
                    and relative not in launcher_inputs and not public_certificate):
                continue
            if name in {'.git', 'local.properties', '.DS_Store'} or 'heartvoice' in name.lower():
                continue
            if name.endswith(('-source.zip', '-source.zip.sha256')):
                continue
            if folder == project and name.startswith('LSPosed_') and path.suffix.lower() == '.zip':
                continue
            relative_path = path.relative_to(workspace).as_posix()
            info = zipfile.ZipInfo.from_file(path, relative_path)
            info.compress_type = zipfile.ZIP_DEFLATED
            mode = 0o100755 if (path.suffix == '.sh' or relative_path.endswith('/bin/augmentctl')) else 0o100644
            info.external_attr = mode << 16
            archive.writestr(info, path.read_bytes())
PY
(cd "$OUT" && sha256sum "$NAME" > "$NAME.sha256")
echo "Built: $OUT/$NAME"
