package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

/** Bounded candidate inspection, never a grant of restoration authority. */
final class HideRecoverySearch {
    static final int MAX_EXAMINED = 64;
    static final int MAX_MATCHES = 4;
    private static final int MAX_OUTPUT = 32768;
    private static final int MAX_JOURNAL = 2048;
    private static final String HEADER = "LSA_RECOVERY_SEARCH_V1";
    private static final String FOOTER = "LSA_RECOVERY_SEARCH_OK";
    private static final Pattern PACKAGE = Pattern.compile("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");

    static final class Query {
        final int userId;
        final long userSerial;
        final String packageName, cursor;

        Query(int userId, long userSerial, String packageName, String cursor) {
            if (userId < 0 || userId > 99999 || userSerial < 0 || packageName == null
                    || packageName.length() > 255 || !PACKAGE.matcher(packageName).matches())
                throw new IllegalArgumentException("Invalid recovery search target");
            this.userId = userId; this.userSerial = userSerial; this.packageName = packageName;
            this.cursor = cursor == null ? "" : cursor;
            if (!this.cursor.isEmpty()) cursorName(this.cursor, this);
        }

        private String prefix() { return "S1:" + userId + ":" + userSerial + ":" + packageName + ":"; }
        private String echo() { return "Q|" + userId + "|" + userSerial + "|" + packageName + "|" + mark(cursor); }
    }

    static final class Page {
        final boolean success;
        final String message, nextCursor;
        final List<HideRecoveryCatalog.Source> sources;
        final int examined, warnings;

        Page(boolean success, String message, String nextCursor, List<HideRecoveryCatalog.Source> sources,
                int examined, int warnings) {
            this.success = success; this.message = message; this.nextCursor = nextCursor;
            this.sources = Collections.unmodifiableList(new ArrayList<>(sources));
            this.examined = examined; this.warnings = warnings;
        }
        static Page failure(String message) {
            return new Page(false, message, "", Collections.emptyList(), 0, 0);
        }
    }

    private HideRecoverySearch() { }

    static Page read(Query query) {
        if (query == null) return Page.failure("恢复来源查询目标无效");
        RootShell.Result result = RootShell.run(command(query), null, 30, MAX_OUTPUT);
        if (result == null || !result.isSuccess() || result.capture == null || !result.capture.reliable())
            return Page.failure("恢复来源读取未完整确认，请重新读取："
                    + (result == null ? "结果未知" : result.publicError()));
        return parseProtocol(new String(result.capture.bytes(), StandardCharsets.UTF_8), query);
    }

    static Page parseProtocol(String protocol, Query query) {
        try {
            if (query == null || protocol == null || protocol.length() > MAX_OUTPUT)
                throw new IllegalArgumentException();
            for (int i = 0; i < protocol.length(); i++) {
                char c = protocol.charAt(i);
                if (c != '\n' && (c < 32 || c > 126)) throw new IllegalArgumentException();
            }
            if (protocol.endsWith("\n")) protocol = protocol.substring(0, protocol.length() - 1);
            String[] lines = protocol.split("\n", -1);
            if (lines.length < 4 || lines.length > MAX_MATCHES + 4 || !HEADER.equals(lines[0])
                    || !query.echo().equals(lines[1]) || !FOOTER.equals(lines[lines.length - 1]))
                throw new IllegalArgumentException();
            String[] meta = lines[lines.length - 2].split("\\|", -1);
            if (meta.length != 4 || !"M".equals(meta[0])) throw new IllegalArgumentException();
            int examined = count(meta[2], MAX_EXAMINED), warnings = count(meta[3], MAX_EXAMINED);
            String next = "-".equals(meta[1]) ? "" : meta[1];
            if (!next.isEmpty()) {
                cursorName(next, query);
                if (next.equals(query.cursor) || examined == 0
                        || (examined != MAX_EXAMINED && lines.length != MAX_MATCHES + 4))
                    throw new IllegalArgumentException();
            }
            StringBuilder catalogFrame = new StringBuilder("LSA_RECOVERY_CATALOG_V1\n");
            for (int i = 2; i < lines.length - 2; i++) catalogFrame.append(lines[i]).append('\n');
            catalogFrame.append("M|-|0\nLSA_RECOVERY_CATALOG_OK\n");
            HideRecoveryCatalog.Page catalog = HideRecoveryCatalog.parseProtocol(catalogFrame.toString());
            if (!catalog.success || catalog.sources.size() + warnings > examined) throw new IllegalArgumentException();
            for (HideRecoveryCatalog.Source source : catalog.sources) {
                if (!source.problem.isEmpty() || source.bytes.length == 0 || source.bytes.length > MAX_JOURNAL)
                    throw new IllegalArgumentException();
                String text = new String(source.bytes, StandardCharsets.UTF_8);
                if (text.endsWith("\n")) text = text.substring(0, text.length() - 1);
                HideRecoveryJournal.Entry entry = HideRecoveryJournal.parse(text);
                if (entry == null || (entry.stage != HideRecoveryJournal.Stage.PREPARED
                        && entry.stage != HideRecoveryJournal.Stage.RESTORE_PREPARED)
                        || entry.userId != query.userId || entry.userSerial != query.userSerial
                        || !entry.packageName.equals(query.packageName)
                        || !source.key.equals("journal:" + entry.operationId + "." + entry.stage + ".record"))
                    throw new IllegalArgumentException();
            }
            String message = "本页检查 " + examined + " 项，找到 " + catalog.sources.size() + " 份候选记录。"
                    + (warnings == 0 ? "" : "另有 " + warnings + " 项不符合记录要求，已保留。")
                    + (next.isEmpty() ? "本次已到扫描末尾；新记录可重新读取。" : "可继续读取；候选记录本身不提供恢复资格。");
            return new Page(true, message, next, catalog.sources, examined, warnings);
        } catch (RuntimeException malformed) {
            return Page.failure("恢复来源响应、目标或分页校验未通过，请重新读取；原记录已保留");
        }
    }

    private static int count(String value, int maximum) {
        if (!value.matches("0|[1-9][0-9]{0,2}")) throw new IllegalArgumentException();
        int parsed = Integer.parseInt(value);
        if (parsed > maximum) throw new IllegalArgumentException();
        return parsed;
    }

    private static String mark(String value) { return value.isEmpty() ? "-" : value; }

    private static String cursorName(String cursor, Query query) {
        String prefix = query.prefix();
        if (!cursor.startsWith(prefix) || cursor.length() > prefix.length() + 340)
            throw new IllegalArgumentException("Different recovery search cursor");
        String encoded = cursor.substring(prefix.length());
        byte[] bytes = Base64.getDecoder().decode(encoded);
        if (bytes.length < 1 || bytes.length > 255 || !Base64.getEncoder().encodeToString(bytes).equals(encoded)
                || bytes.length == 1 && bytes[0] == '.'
                || bytes.length == 2 && bytes[0] == '.' && bytes[1] == '.')
            throw new IllegalArgumentException("Invalid recovery search cursor name");
        for (byte value : bytes) if (value == 0 || value == '/') throw new IllegalArgumentException("Invalid cursor name");
        return encoded;
    }

    static String command(Query query) {
        if (query == null) throw new IllegalArgumentException("Missing recovery search query");
        String encoded = query.cursor.isEmpty() ? "" : cursorName(query.cursor, query);
        // All inserted values are validated ASCII without shell quoting characters.
        return "TARGET_USER='" + query.userId + "'\nSERIAL='" + query.userSerial + "'\nPACKAGE='" + query.packageName
                + "'\nCURSOR='" + query.cursor + "'\nCURSOR64='" + encoded + "'\nPREFIX='" + query.prefix() + "'\n" + """
                export LC_ALL=C
                ROOT='/data/adb/ls_augment/v2'
                fail() { printf '%s\\n' "recovery_search:$1" >&2; exit 74; }
                set -o pipefail || fail pipeline_unavailable
                directory() {
                  [ ! -L "$1" ] || fail symlink_directory
                  if [ -d "$1" ]; then [ -r "$1" ] && [ -x "$1" ] || fail directory_unreadable; return 0; fi
                  [ ! -e "$1" ] || fail not_directory
                  return 1
                }
                parents() {
                  rest=${ROOT#/}; prefix=''
                  while [ -n "$rest" ]; do
                    segment=${rest%%/*}; prefix="$prefix/$segment"
                    directory "$prefix" || return 1
                    case "$rest" in */*) rest=${rest#*/} ;; *) rest='' ;; esac
                  done
                  directory "$ROOT/recovery-journal-v1" || return 1
                  directory "$ROOT/recovery-journal-v1/events" || return 1
                }
                filecheck() { [ ! -L "$path" ] && [ -f "$path" ] && [ -r "$path" ]; }
                uuid() { printf '%s\\n' "$1" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'; }
                unsigned() {
                  case "$1" in ''|*[!0-9]*|0?*) return 1 ;; esac
                  [ "${#1}" -lt "${#2}" ] && return 0
                  [ "${#1}" -eq "${#2}" ] || return 1
                  [ "$1" = "$2" ] || [ "$1" \\< "$2" ]
                }
                hex64() { [ "${#1}" -eq 64 ] || return 1; case "$1" in *[!0-9a-f]*) return 1 ;; esac; }
                valid_record() {
                  separators=$(printf '%s' "$record" | tr -cd '|') || fail field_count
                  case "$magic:$stage:${#separators}" in
                    LSARJ1:PREPARED:12) [ "$state" = VISIBLE ] || return 1 ;;
                    LSARJ2:RESTORE_PREPARED:13|LSARJ3:RESTORE_PREPARED:17)
                      [ "$state" = HIDDEN ] && uuid "$source" && [ "$source" != "$operation" ] &&
                        unsigned "$serial" 2147483647 && hex64 "$identity" || return 1 ;;
                    *) return 1 ;;
                  esac
                  uuid "$operation" && uuid "$owner" && unsigned "$owner_user" 99999 &&
                    unsigned "$created" 9223372036854775807 || return 1
                  [ "$identity" = unknown ] || hex64 "$identity" || return 1
                  [ "$code" = 0 ] && [ "$timed" = 0 ] || return 1
                  if [ "$magic" = LSARJ3 ]; then
                    uuid "$epoch" && uuid "$challenge" && unsigned "$generation" 9223372036854775807 &&
                      [ "$generation" != 0 ] && hex64 "$status_mac" || return 1
                  fi
                  [ "$name" = "$operation.$stage.record" ] || return 1
                }
                inspect() {
                  case "$name" in ''|*[!A-Za-z0-9_.-]*) warnings=$((warnings+1)); return ;; esac
                  if ! printf '%s\\n' "$name" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\\.[A-Z_]+\\.record$'; then
                    warnings=$((warnings+1)); return
                  fi
                  filecheck || { warnings=$((warnings+1)); return; }
                  before=$(stat -c '%d:%i:%s:%Y:%Z' "$path") || fail file_stat
                  size=${before#*:}; size=${size#*:}; size=${size%%:*}
                  if ! unsigned "$size" 2048 || [ "$size" = 0 ]; then warnings=$((warnings+1)); return; fi
                  # Every content read has its own bound, even if a file grows after stat.
                  filecheck || fail source_changed
                  payload=$(head -c 2049 "$path" | base64 | tr -d '\\n') || fail source_read
                  bytes=$(printf '%s' "$payload" | base64 -d | wc -c) || fail source_size
                  [ "$bytes" -eq "$size" ] || fail source_changed
                  hash=$(printf '%s' "$payload" | base64 -d | sha256sum) || fail source_hash
                  hash=${hash%% *}; hex64 "$hash" || fail source_hash
                  filecheck || fail source_changed
                  after_hash=$(head -c 2049 "$path" | sha256sum) || fail source_hash
                  after_hash=${after_hash%% *}
                  after=$(stat -c '%d:%i:%s:%Y:%Z' "$path") || fail file_stat
                  filecheck && [ "$before" = "$after" ] && [ "$hash" = "$after_hash" ] || fail source_changed
                  bad=$(printf '%s' "$payload" | base64 -d | tr -d '\\n!-~' | wc -c) || fail source_text
                  if [ "$bad" -ne 0 ]; then warnings=$((warnings+1)); return; fi
                  record=$(printf '%s' "$payload" | base64 -d && printf '.') || fail source_decode
                  record=${record%.}
                  case "$record" in *'
                ') record=${record%'
                '} ;; esac
                  case "$record" in ''|*'
                '*) warnings=$((warnings+1)); return ;; esac
                  [ "${#record}" -lt 2048 ] || { warnings=$((warnings+1)); return; }
                  IFS='|' read -r magic operation owner owner_user user serial package identity created stage state code timed source epoch generation challenge status_mac <<EOF
                $record
                EOF
                  [ "$user" = "$TARGET_USER" ] && [ "$serial" = "$SERIAL" ] && [ "$package" = "$PACKAGE" ] || return
                  case "$stage" in PREPARED|RESTORE_PREPARED) ;; *) return ;; esac
                  valid_record || { warnings=$((warnings+1)); return; }
                  parents || fail directory_changed
                  filecheck || fail source_changed
                  final=$(stat -c '%d:%i:%s:%Y:%Z' "$path") || fail file_stat
                  [ "$before" = "$final" ] || fail source_changed
                  printf 'S|journal:%s|%s|%s|-|%s\\n' "$name" "$hash" "$size" "$payload" || fail output
                  matches=$((matches+1))
                }
                CURSOR_NAME=''
                if [ -n "$CURSOR64" ]; then
                  CURSOR_NAME=$(printf '%s' "$CURSOR64" | base64 -d && printf '.') || fail cursor_decode
                  CURSOR_NAME=${CURSOR_NAME%.}
                fi
                present=0; parents && present=1
                echo_cursor=${CURSOR:--}
                printf '%s\\nQ|%s|%s|%s|%s\\n' 'LSA_RECOVERY_SEARCH_V1' "$TARGET_USER" "$SERIAL" "$PACKAGE" "$echo_cursor" || fail output
                examined=0; matches=0; warnings=0; next='-'; found=0
                [ -n "$CURSOR" ] || found=1
                if [ "$present" -eq 1 ]; then
                  dir="$ROOT/recovery-journal-v1/events"
                  # Glob expansion and seeking to CURSOR still depend on historical directory size.
                  # A continuation marks a reached budget; the following page may be empty.
                  for path in "$dir"/* "$dir"/.[!.]* "$dir"/..?*; do
                    if [ ! -e "$path" ] && [ ! -L "$path" ]; then
                      case "$path" in "$dir/*"|"$dir/.[!.]*"|"$dir/..?*") continue ;; esac
                      fail entry_changed
                    fi
                    name=${path##*/}
                    if [ "$found" -eq 0 ]; then [ "$name" != "$CURSOR_NAME" ] || found=1; continue; fi
                    examined=$((examined+1))
                    inspect
                    if [ "$examined" -eq 64 ] || [ "$matches" -eq 4 ]; then
                      name64=$(printf '%s' "$name" | base64 | tr -d '\\n') || fail cursor_encode
                      next="$PREFIX$name64"
                      break
                    fi
                  done
                  parents || fail directory_changed
                fi
                [ "$found" -eq 1 ] || fail cursor_missing_refresh
                printf 'M|%s|%s|%s\\n%s\\n' "$next" "$examined" "$warnings" 'LSA_RECOVERY_SEARCH_OK' || fail output
                """;
    }
}
