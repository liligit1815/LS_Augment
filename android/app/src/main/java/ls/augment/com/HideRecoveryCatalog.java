package ls.augment.com;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

/** Read-only, verified pages of evidence; catalog membership never proves ownership. */
final class HideRecoveryCatalog {
    private static final int MAX_FILE = 1024 * 1024;
    private static final int MAX_OUTPUT = 8 * 1024 * 1024;
    private static final Pattern KEY = Pattern.compile("(?:journal:[0-9a-f]{8}-[0-9a-f]{4}-"
            + "[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\\.[A-Z_]+\\.record|"
            + "(?:targets|backup|selection|script):[0-9a-f]{64}\\.raw)");
    private static final Set<String> PROBLEMS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "SYMLINK", "MISSING", "NOT_FILE", "UNREADABLE", "TOO_LARGE", "HASH_FAILED",
            "HASH_MISMATCH", "READ_FAILED", "SOURCE_CHANGED")));

    static final class Source {
        final String key, sha256, problem;
        final byte[] bytes;
        Source(String key, String sha256, byte[] bytes, String problem) {
            this.key = key; this.sha256 = sha256; this.bytes = bytes.clone(); this.problem = problem;
        }
    }

    static final class Page {
        final boolean success;
        final String message, nextCursor;
        final List<Source> sources;
        private Page(boolean success, String message, List<Source> sources, String nextCursor) {
            this.success = success; this.message = message;
            this.sources = Collections.unmodifiableList(new ArrayList<>(sources)); this.nextCursor = nextCursor;
        }
        static Page failure(String message) { return new Page(false, message, Collections.emptyList(), ""); }
    }

    private HideRecoveryCatalog() { }

    static Page read(String cursor) { return execute(cursor == null ? "" : cursor, ""); }

    static Page readOne(String key) {
        if (!validKey(key)) return Page.failure("恢复来源标识无效，请重新刷新");
        return execute("", key);
    }

    private static Page execute(String cursor, String key) {
        if (!cursor.isEmpty() && !validKey(cursor)) return Page.failure("恢复分页标识无效，请重新刷新");
        RootShell.Result result = RootShell.run(command(cursor, key), null, 30, MAX_OUTPUT);
        if (!result.isSuccess()) return Page.failure("读取恢复记录失败，请重新刷新：" + result.publicError());
        Page page = parseProtocol(result.output);
        if (page.success && !key.isEmpty() && (page.sources.size() != 1
                || !page.sources.get(0).key.equals(key) || !page.nextCursor.isEmpty()))
            return Page.failure("恢复来源响应不匹配，请重新刷新");
        return page;
    }

    private static boolean validKey(String key) {
        return key != null && key.length() <= 263 && KEY.matcher(key).matches();
    }

    /** Accepts only complete ASCII framing; binary payloads are decoded without normalization. */
    static Page parseProtocol(String protocol) {
        try {
            if (protocol == null || protocol.length() > MAX_OUTPUT) throw new IllegalArgumentException();
            for (int i = 0; i < protocol.length(); i++) {
                char c = protocol.charAt(i);
                if (c != '\n' && (c < 32 || c > 126)) throw new IllegalArgumentException();
            }
            if (protocol.endsWith("\n")) protocol = protocol.substring(0, protocol.length() - 1);
            String[] lines = protocol.split("\n", -1);
            if (lines.length < 3 || lines.length > 7 || !lines[0].equals("LSA_RECOVERY_CATALOG_V1")
                    || !lines[lines.length - 1].equals("LSA_RECOVERY_CATALOG_OK")) throw new IllegalArgumentException();
            List<Source> sources = new ArrayList<>();
            Set<String> seen = new HashSet<>();
            for (int i = 1; i < lines.length - 2; i++) {
                String[] f = lines[i].split("\\|", -1);
                if (f.length != 6 || !f[0].equals("S") || !validKey(f[1]) || !seen.add(f[1]))
                    throw new IllegalArgumentException();
                if (!f[4].equals("-")) {
                    if (!PROBLEMS.contains(f[4]) || !f[2].equals("-") || !f[3].equals("0") || !f[5].isEmpty())
                        throw new IllegalArgumentException();
                    sources.add(new Source(f[1], "", new byte[0], f[4]));
                    continue;
                }
                if (!f[2].matches("[0-9a-f]{64}") || !f[3].matches("0|[1-9][0-9]{0,6}"))
                    throw new IllegalArgumentException();
                int size = Integer.parseInt(f[3]);
                if (size > MAX_FILE || f[5].length() != ((size + 2) / 3) * 4) throw new IllegalArgumentException();
                byte[] bytes = Base64.getDecoder().decode(f[5]);
                if (bytes.length != size || !Base64.getEncoder().encodeToString(bytes).equals(f[5]))
                    throw new IllegalArgumentException();
                byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
                StringBuilder hash = new StringBuilder(64);
                for (byte value : digest) hash.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
                if (!hash.toString().equals(f[2])) throw new IllegalArgumentException();
                if (!f[1].startsWith("journal:") && !f[1].endsWith(":" + f[2] + ".raw"))
                    throw new IllegalArgumentException();
                String problem = "";
                try {
                    StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                            .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes));
                } catch (CharacterCodingException invalidText) { problem = "INVALID_UTF8"; }
                sources.add(new Source(f[1], f[2], bytes, problem));
            }
            String[] meta = lines[lines.length - 2].split("\\|", -1);
            if (meta.length != 3 || !meta[0].equals("M") || !meta[2].matches("0|[1-9][0-9]{0,8}"))
                throw new IllegalArgumentException();
            String next = meta[1].equals("-") ? "" : meta[1];
            if (!next.isEmpty() && (sources.size() != 4 || !next.equals(sources.get(3).key)))
                throw new IllegalArgumentException();
            int warnings = Integer.parseInt(meta[2]);
            String message = warnings == 0 ? "" : "发现 " + warnings + " 个未知格式文件名，已保留，不用于恢复";
            return new Page(true, message, sources, next);
        } catch (Exception malformed) { return Page.failure("恢复记录读取或校验不完整，请重新刷新"); }
    }

    static String command(String cursor, String singleKey) {
        String after = cursor == null ? "" : cursor;
        String single = singleKey == null ? "" : singleKey;
        if ((!after.isEmpty() && !validKey(after)) || (!single.isEmpty() && !validKey(single))
                || (!after.isEmpty() && !single.isEmpty())) throw new IllegalArgumentException("Invalid catalog key");
        // Validated keys contain no quotes, substitutions, path separators or whitespace.
        return "CURSOR='" + after + "'\nSINGLE='" + single + "'\n" + """
                export LC_ALL=C
                ROOT='/data/adb/ls_augment/v2'
                fail() { printf '%s\\n' "recovery_catalog:$1" >&2; exit 74; }
                set -o pipefail || fail pipeline_unavailable
                directory() {
                  [ ! -L "$1" ] || fail symlink_directory
                  if [ -d "$1" ]; then
                    [ -r "$1" ] && [ -x "$1" ] || fail directory_unreadable
                    ls -a1 "$1" >/dev/null || fail directory_inventory
                    return 0
                  fi
                  [ ! -e "$1" ] || fail not_directory
                  dir_parent=${1%/*}
                  [ -n "$dir_parent" ] || dir_parent=/
                  inventory=$(ls -a1 "$dir_parent") || fail parent_inventory
                  case "
                $inventory
                " in *"
                ${1##*/}
                "*) fail directory_unavailable ;; esac
                  return 1
                }
                digest() {
                  sum=$(sha256sum "$1" 2>/dev/null) || return 1
                  sum=${sum%% *}
                  case "$sum" in ''|*[!0-9a-f]*) return 1 ;; esac
                  [ "${#sum}" -eq 64 ] || return 1
                  printf '%s' "$sum"
                }
                problem() { printf 'S|%s|-|0|%s|\\n' "$key" "$1" || fail output; }
                source() {
                  if [ -L "$path" ]; then problem SYMLINK; return; fi
                  if [ ! -e "$path" ]; then problem MISSING; return; fi
                  if [ ! -f "$path" ]; then problem NOT_FILE; return; fi
                  if [ ! -r "$path" ]; then problem UNREADABLE; return; fi
                  size=$(wc -c 2>/dev/null <"$path") || { problem UNREADABLE; return; }
                  case "$size" in ''|*[!0-9]*) problem UNREADABLE; return ;; esac
                  if [ "${#size}" -gt 7 ] || [ "$size" -gt 1048576 ]; then problem TOO_LARGE; return; fi
                  before=$(digest "$path") || { problem HASH_FAILED; return; }
                  if [ "$kind" != journal ] && [ "$before.raw" != "$name" ]; then problem HASH_MISMATCH; return; fi
                  [ ! -L "$path" ] && [ -f "$path" ] || { problem SOURCE_CHANGED; return; }
                  # Bound the actual read as well as the preceding stat, even if a writer grows the file.
                  data=$(head -c 1048577 "$path" 2>/dev/null | base64 2>/dev/null | tr -d '\\n' 2>/dev/null) || { problem READ_FAILED; return; }
                  [ "${#data}" -le 1398104 ] || { problem TOO_LARGE; return; }
                  [ ! -L "$path" ] && [ -f "$path" ] || { problem SOURCE_CHANGED; return; }
                  after=$(digest "$path") || { problem HASH_FAILED; return; }
                  size_after=$(wc -c 2>/dev/null <"$path") || { problem UNREADABLE; return; }
                  if [ "$before" != "$after" ] || [ "$size" != "$size_after" ]; then problem SOURCE_CHANGED; return; fi
                  [ ! -L "$path" ] && [ -f "$path" ] || { problem SOURCE_CHANGED; return; }
                  printf 'S|%s|%s|%s|-|%s\\n' "$key" "$before" "$size" "$data" || fail output
                }
                valid_name() {
                  [ "${#name}" -le 255 ] || return 1
                  case "$name" in ''|*[!A-Za-z0-9_.-]*) return 1 ;; esac
                  if [ "$kind" = journal ]; then
                    printf '%s\\n' "$name" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\\.[A-Z_]+\\.record$'
                  else
                    printf '%s\\n' "$name" | grep -Eq '^[0-9a-f]{64}\\.raw$'
                  fi
                }
                present=1
                rest=${ROOT#/}
                prefix=''
                while [ -n "$rest" ]; do
                  segment=${rest%%/*}
                  prefix="$prefix/$segment"
                  if ! directory "$prefix"; then present=0; break; fi
                  case "$rest" in */*) rest=${rest#*/} ;; *) rest='' ;; esac
                done
                printf '%s\\n' 'LSA_RECOVERY_CATALOG_V1' || fail output
                count=0
                warnings=0
                more=0
                last='-'
                found=0
                [ -n "$CURSOR" ] || found=1
                if [ "$present" -eq 1 ]; then
                  for kind in journal targets backup selection script; do
                    if [ -n "$SINGLE" ] && [ "${SINGLE%%:*}" != "$kind" ]; then continue; fi
                    if [ "$kind" = journal ]; then
                      parent="$ROOT/recovery-journal-v1"
                      dir="$parent/events"
                    else
                      parent="$ROOT/recovery-history-v1"
                      dir="$parent/$kind"
                    fi
                    directory "$parent" || continue
                    directory "$dir" || continue
                    if [ -n "$SINGLE" ]; then
                      key="$SINGLE"
                      name=${key#*:}
                      path="$dir/$name"
                      [ -e "$path" ] || [ -L "$path" ] || fail source_missing_refresh
                      source
                      directory "$parent" && directory "$dir" || fail directory_changed
                      count=1
                      break
                    fi
                    for path in "$dir"/* "$dir"/.[!.]* "$dir"/..?*; do
                      if [ ! -e "$path" ] && [ ! -L "$path" ]; then
                        case "$path" in "$dir/*"|"$dir/.[!.]*"|"$dir/..?*") continue ;; esac
                      fi
                      name=${path##*/}
                      if ! valid_name; then
                        warnings=$((warnings+1))
                        [ "$warnings" -le 999999999 ] || fail inventory_too_large
                        continue
                      fi
                      key="$kind:$name"
                      if [ "$found" -eq 0 ]; then
                        [ "$key" != "$CURSOR" ] || found=1
                        continue
                      fi
                      if [ "$count" -lt 4 ]; then
                        source
                        count=$((count+1))
                        last="$key"
                      else
                        more=1
                      fi
                    done
                    directory "$parent" && directory "$dir" || fail directory_changed
                  done
                fi
                [ "$found" -eq 1 ] || fail cursor_missing_refresh
                [ -z "$SINGLE" ] || [ "$count" -eq 1 ] || fail source_missing_refresh
                [ "$more" -eq 1 ] || last='-'
                printf 'M|%s|%s\\n' "$last" "$warnings" || fail output
                printf '%s\\n' 'LSA_RECOVERY_CATALOG_OK' || fail output
                """;
    }
}
