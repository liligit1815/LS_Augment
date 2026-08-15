#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

if grep -RInE 'install-existing|cmd[[:space:]]+package[[:space:]]+uninstall' "$ROOT/module" --include='*.sh'; then
  echo 'SAFETY ERROR: destructive package operation found.' >&2
  fail=1
fi

# pm uninstall is allowed only for LS_Augment's own Companion / historical tile helper.
while IFS=: read -r file line text; do
  case "$file" in
    */bin/install_companion.sh|*/uninstall.sh) ;;
    *) echo "SAFETY ERROR: pm uninstall outside companion lifecycle: $file:$line:$text" >&2; fail=1 ;;
  esac
done < <(grep -RInE 'pm[[:space:]]+uninstall' "$ROOT/module" --include='*.sh' || true)

for f in "$ROOT/module"/*.sh "$ROOT/module"/bin/*.sh; do
  sh -n "$f" || { echo "SHELL SYNTAX ERROR: $f" >&2; fail=1; }
done

# The backend may call pm through the hardened run_pm_hidden_setting wrapper.
# Require an explicit per-user invocation plus both allowed hidden-setting modes.
if ! grep -Fq '"$pe_pm" "$pe_mode" --user "$pe_uid" "$pe_pkg"' "$ROOT/module/bin/common.sh"; then
  echo 'SAFETY ERROR: expected per-user pm hidden-setting backend missing.' >&2
  fail=1
fi
if ! grep -Fq 'hide) pe_expected=hidden' "$ROOT/module/bin/common.sh"; then
  echo 'SAFETY ERROR: pm hide mode missing.' >&2
  fail=1
fi
if ! grep -Fq 'unhide) pe_expected=visible' "$ROOT/module/bin/common.sh"; then
  echo 'SAFETY ERROR: pm unhide mode missing.' >&2
  fail=1
fi

[[ "$fail" == 0 ]] || exit 1
echo 'Safety lint: OK'
