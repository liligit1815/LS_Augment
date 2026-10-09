#!/system/bin/sh
# Read-only fixed module files. Their owning process clears cached preferences.
set -eu
fail() { printf 'LAUNCHER_RESET_ERROR=%s\n' "$1"; exit 73; }
case "$expected_uid:$expected_user" in *[!0-9:]*|:*|*:) fail identity_format ;; esac
[ "$(id -u)" = 0 ] || fail root_required
case "$base" in
    "/data/user/$expected_user/com.zte.mifavor.launcher"|"/data/user_de/$expected_user/com.zte.mifavor.launcher") ;;
    *) fail data_path ;;
esac
case "${required_base:-1}" in 0|1) ;; *) fail required_base_format ;; esac
present_base=0
if [ -e "$base" ] || [ -L "$base" ]; then
    [ -d "$base" ] && [ ! -L "$base" ] || fail data_type
    actual_base=$(readlink -f "$base") || fail canonical_path
    if [ "$actual_base" != "$base" ]; then
        [ "$base" = "/data/user/0/com.zte.mifavor.launcher" ] && [ "$actual_base" = /data/data/com.zte.mifavor.launcher ] || fail canonical_path
    fi
    [ "$(stat -c %u "$base")" = "$expected_uid" ] || fail data_owner
    present_base=1
else
    [ "${required_base:-1}" = 0 ] || fail data_type
    actual_base=$base
fi
package_matches() {
    cmd package list packages --user "$expected_user" -U com.zte.mifavor.launcher 2>/dev/null |
        grep -Fx "package:com.zte.mifavor.launcher uid:$expected_uid" >/dev/null
}
package_matches || fail package_identity
[ "$stage" = read ] || fail stage
package_matches || fail changed_package_identity
if [ "$present_base" = 1 ]; then
    [ -d "$base" ] && [ ! -L "$base" ] || fail changed_data_type
    [ "$(stat -c %u "$base")" = "$expected_uid" ] || fail changed_data_owner
    [ "$(readlink -f "$base")" = "$actual_base" ] || fail changed_canonical_path
else
    [ ! -e "$base" ] && [ ! -L "$base" ] || fail changed_data_type
fi
prefs="$base/shared_prefs"
if [ -e "$prefs" ] || [ -L "$prefs" ]; then
    [ -d "$prefs" ] && [ ! -L "$prefs" ] || fail prefs_type
    [ "$(stat -c %u "$prefs")" = "$expected_uid" ] || fail prefs_owner
    [ "$(readlink -f "$prefs")" = "$actual_base/shared_prefs" ] || fail prefs_canonical_path
fi
for name in ls_augment_launcher_grid_state.xml ls_augment_launcher_grid_state.xml.bak ls_augment_launcher_pages.xml ls_augment_launcher_pages.xml.bak; do
    file="$prefs/$name"
    if [ -e "$file" ] || [ -L "$file" ]; then
        [ -f "$file" ] && [ ! -L "$file" ] || fail file_type
        [ "$(stat -c %u "$file")" = "$expected_uid" ] || fail file_owner
        [ "$(readlink -f "$file")" = "$actual_base/shared_prefs/$name" ] || fail file_canonical_path
        size=$(stat -c %s "$file") || fail file_size
        case "$size" in ''|*[!0-9]*) fail file_size ;; esac
        [ "$size" -le 262144 ] || fail file_too_large
    fi
done
file_for() {
    case "$1" in
        grid) file="$prefs/ls_augment_launcher_grid_state.xml" ;;
        grid_bak) file="$prefs/ls_augment_launcher_grid_state.xml.bak" ;;
        pages) file="$prefs/ls_augment_launcher_pages.xml" ;;
        pages_bak) file="$prefs/ls_augment_launcher_pages.xml.bak" ;;
        *) fail role ;;
    esac
}
hash_for() {
    if [ -e "$file" ]; then
        digest=$(sha256sum "$file") || fail file_hash
        digest=${digest%% *}
    else digest=absent; fi
}
printf 'LAUNCHER_RESET_RECORDS_V1\n'
for role in grid grid_bak pages pages_bak; do
    file_for "$role"; hash_for
    if [ "$digest" = absent ]; then printf 'file|%s|0|-|-\n' "$role";
    else
        printf 'file|%s|1|%s|' "$role" "$digest"
        base64 "$file" | tr -d '\r\n' || fail file_read
        printf '\n'
    fi
done
package_matches || fail changed_package_identity
[ ! -L "$base" ] && [ ! -L "$prefs" ] || fail changed_directory_type
printf 'LAUNCHER_RESET_RECORDS_END\n'
