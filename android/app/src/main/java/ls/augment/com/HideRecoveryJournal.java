package ls.augment.com;

import java.util.List;
import java.util.regex.Pattern;

/** Immutable attempt/observation evidence. A matching entry does not prove ownership. */
final class HideRecoveryJournal {
    private static final String SUCCESS = "LSA_RECOVERY_JOURNAL_OK";
    private static final Pattern UUID = Pattern.compile("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}");
    private static final Pattern PACKAGE = Pattern.compile("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");
    enum Stage { PREPARED, OBSERVED, SHOW_PREPARED, SHOW_OBSERVED, RESTORE_PREPARED, RESTORE_OBSERVED }

    static final class Entry {
        final String operationId, ownerId, packageName, packageIdentity, state, sourceHideNonce;
        final int ownerUserId, userId, exitCode;
        final long userSerial, createdAt;
        final Stage stage;
        final boolean timedOut;
        final HideRestoreGrantLedger.StatusProof recoveryProof;

        Entry(String operationId, String ownerId, int ownerUserId, int userId,
                long userSerial, String packageName, String packageIdentity, long createdAt,
                Stage stage, String state, int exitCode, boolean timedOut) {
            this(operationId,ownerId,ownerUserId,userId,userSerial,packageName,packageIdentity,
                    createdAt,stage,state,exitCode,timedOut,null);
        }
        Entry(String operationId, String ownerId, int ownerUserId, int userId,
                long userSerial, String packageName, String packageIdentity, long createdAt,
                Stage stage, String state, int exitCode, boolean timedOut, String sourceHideNonce) {
            this(operationId,ownerId,ownerUserId,userId,userSerial,packageName,packageIdentity,
                    createdAt,stage,state,exitCode,timedOut,sourceHideNonce,null);
        }
        Entry(String operationId, String ownerId, int ownerUserId, int userId,
                long userSerial, String packageName, String packageIdentity, long createdAt,
                Stage stage, String state, int exitCode, boolean timedOut, String sourceHideNonce,
                HideRestoreGrantLedger.StatusProof recoveryProof) {
            if (operationId == null || !UUID.matcher(operationId).matches()
                    || ownerId == null || !UUID.matcher(ownerId).matches()
                    || ownerUserId < 0 || ownerUserId > 99999 || userId < 0 || userId > 99999
                    || userSerial < 0 || createdAt < 0 || packageName == null
                    || packageName.length() > 255 || !PACKAGE.matcher(packageName).matches()
                    || packageName.contains("..") || packageIdentity == null
                    || !("unknown".equals(packageIdentity) || packageIdentity.matches("[0-9a-f]{64}"))
                    || stage == null
                    || (restoreStage(stage) ? sourceHideNonce == null || !UUID.matcher(sourceHideNonce).matches()
                        || sourceHideNonce.equals(operationId) || userSerial > Integer.MAX_VALUE
                        || "unknown".equals(packageIdentity) : sourceHideNonce != null)
                    || stage == Stage.RESTORE_PREPARED && (!"HIDDEN".equals(state) || exitCode != 0 || timedOut)
                    || !("VISIBLE".equals(state) || "HIDDEN".equals(state)
                    || "MISSING".equals(state) || "ERROR".equals(state))
                    || stage == Stage.PREPARED && (!"VISIBLE".equals(state) || exitCode != 0 || timedOut)
                    || stage == Stage.SHOW_PREPARED && (!("HIDDEN".equals(state) || "VISIBLE".equals(state))
                    || exitCode != 0 || timedOut))
                throw new IllegalArgumentException("Invalid recovery journal entry");
            this.operationId = operationId; this.ownerId = ownerId;
            this.ownerUserId = ownerUserId; this.userId = userId; this.userSerial = userSerial;
            this.packageName = packageName; this.packageIdentity = packageIdentity;
            this.createdAt = createdAt; this.stage = stage; this.state = state;
            this.exitCode = exitCode; this.timedOut = timedOut; this.sourceHideNonce = sourceHideNonce;
            if (recoveryProof != null) {
                HideRestoreGrantLedger.Coordinate c = recoveryProof.coordinate;
                if (!restoreStage(stage) || c.userId != userId || c.serial != userSerial
                        || !c.packageName.equals(packageName) || !c.nonce.equals(operationId)
                        || !c.sourceHideNonce.equals(sourceHideNonce))
                    throw new IllegalArgumentException("Different recovery proof coordinate");
            }
            this.recoveryProof = recoveryProof;
        }

        Entry observed(String state, int exitCode, boolean timedOut) {
            return new Entry(operationId, ownerId, ownerUserId, userId, userSerial,
                    packageName, packageIdentity, createdAt,
                    restoreStage(stage) ? Stage.RESTORE_OBSERVED
                            : stage == Stage.SHOW_PREPARED || stage == Stage.SHOW_OBSERVED ? Stage.SHOW_OBSERVED : Stage.OBSERVED,
                    state, exitCode, timedOut, sourceHideNonce, recoveryProof);
        }

        String encode() {
            return (recoveryProof != null ? "LSARJ3|" : restoreStage(stage) ? "LSARJ2|" : "LSARJ1|") + operationId + "|" + ownerId + "|" + ownerUserId + "|" + userId
                    + "|" + userSerial + "|" + packageName + "|" + packageIdentity + "|" + createdAt
                    + "|" + stage + "|" + state + "|" + exitCode + "|" + (timedOut ? "1" : "0")
                    + (restoreStage(stage) ? "|" + sourceHideNonce : "")
                    + (recoveryProof == null ? "" : "|" + recoveryProof.coordinate.epoch + "|"
                            + recoveryProof.coordinate.generation + "|" + recoveryProof.coordinate.challenge
                            + "|" + recoveryProof.statusMac);
        }
    }

    static boolean restoreStage(Stage stage) {return stage == Stage.RESTORE_PREPARED || stage == Stage.RESTORE_OBSERVED;}
    private HideRecoveryJournal() { }

    static Entry parse(String text) {
        if (text == null || text.isEmpty() || text.length() >= 2048) return null;
        for (int i = 0; i < text.length(); i++) if (text.charAt(i) < 33 || text.charAt(i) > 126) return null;
        String[] fields = text.split("\\|", -1);
        boolean recovery = fields.length == 18 && "LSARJ3".equals(fields[0]);
        boolean restore = recovery || fields.length == 14 && "LSARJ2".equals(fields[0]);
        if ((!restore && (fields.length != 13 || !"LSARJ1".equals(fields[0])))
                || !("0".equals(fields[12]) || "1".equals(fields[12]))) return null;
        try {
            HideRestoreGrantLedger.StatusProof proof = recovery ? new HideRestoreGrantLedger.StatusProof(
                    new HideRestoreGrantLedger.Coordinate(fields[14], fields[13], fields[1],
                            Long.parseLong(fields[15]), Integer.parseInt(fields[4]), Long.parseLong(fields[5]),
                            fields[6], fields[16]), fields[17]) : null;
            Entry result = new Entry(fields[1], fields[2], Integer.parseInt(fields[3]),
                    Integer.parseInt(fields[4]), Long.parseLong(fields[5]), fields[6], fields[7],
                    Long.parseLong(fields[8]), Stage.valueOf(fields[9]), fields[10],
                    Integer.parseInt(fields[11]), "1".equals(fields[12]), restore ? fields[13] : null, proof);
            return restore == restoreStage(result.stage) && result.encode().equals(text) ? result : null;
        } catch (IllegalArgumentException invalid) { return null; }
    }

    static RootShell.Result append(List<Entry> entries) {
        if (entries == null || entries.isEmpty() || entries.size() > 8)
            return new RootShell.Result(74, "恢复操作记录批次无效", false);
        StringBuilder input = new StringBuilder();
        for (Entry entry : entries) {
            if (entry == null || parse(entry.encode()) == null)
                return new RootShell.Result(74, "恢复操作记录无效", false);
            input.append(entry.encode()).append('\n');
        }
        RootShell.Result result = RootShell.run(command(), input.toString(), 30, 4096);
        if (!result.isSuccess()) return result;
        if (!SUCCESS.equals(result.output.trim()))
            return new RootShell.Result(74, "恢复操作记录校验未完成", false);
        return result;
    }

    static String command() {
        return """
                umask 077
                export LC_ALL=C
                ROOT='/data/adb/ls_augment/v2'
                ROOT_PARENT=${ROOT%/*}
                STORAGE=${ROOT_PARENT%/*}
                JOURNAL="$ROOT/recovery-journal-v1"
                EVENTS="$JOURNAL/events"
                INPUT=''
                NORMAL=''
                STAGING=''
                CANDIDATE=''
                fail() { printf '%s\\n' "recovery_journal:$1" >&2; exit 74; }
                cleanup() {
                  [ -z "$CANDIDATE" ] || rm -f "$CANDIDATE"
                  [ -z "$INPUT" ] || rm -f "$INPUT"
                  [ -z "$NORMAL" ] || rm -f "$NORMAL"
                  if [ -n "$STAGING" ] && [ -d "$STAGING" ] && [ ! -L "$STAGING" ]; then
                    rm -f "$STAGING"/*.record
                    rmdir "$STAGING"
                  fi
                }
                trap cleanup EXIT
                trap 'exit 74' HUP INT TERM
                command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
                parent="$ROOT"
                while [ "$parent" != / ]; do
                  [ ! -L "$parent" ] || fail symlink_parent
                  parent=${parent%/*}
                  [ -n "$parent" ] || parent=/
                done
                [ -d "$STORAGE" ] || fail storage_unavailable
                directory() {
                  [ ! -L "$1" ] || fail symlink_directory
                  mkdir -p "$1" || fail mkdir
                  [ -d "$1" ] && [ ! -L "$1" ] || fail invalid_directory
                  chmod 0700 "$1" || fail directory_permissions
                }
                filecheck() {
                  [ ! -L "$1" ] && [ -f "$1" ] && [ -r "$1" ] || fail invalid_file
                }
                digest() {
                  sum=$(sha256sum "$1") || return 1
                  sum=${sum%% *}
                  case "$sum" in ''|*[!0-9a-f]*) return 1 ;; esac
                  [ "${#sum}" -eq 64 ] || return 1
                  printf '%s' "$sum"
                }
                uuid() { printf '%s\\n' "$1" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'; }
                unsigned() {
                  printf '%s\\n' "$1" | grep -Eq '^(0|[1-9][0-9]*)$' || return 1
                  unsigned_limit=${2:-9223372036854775807}
                  [ "${#1}" -lt "${#unsigned_limit}" ] && return 0
                  [ "${#1}" -eq "${#unsigned_limit}" ] || return 1
                  [ "$1" = "$unsigned_limit" ] || [ "$1" \\< "$unsigned_limit" ]
                }
                validate() {
                  [ "${#record}" -lt 2048 ] || fail line_too_large
                  separators=$(printf '%s' "$record" | tr -cd '|') || fail field_count
                  case "${#separators}" in 12|13|17) ;; *) fail field_count ;; esac
                  IFS='|' read -r magic operation owner owner_user user serial package identity created stage state code timed source epoch generation challenge status_mac <<EOF
                $record
                EOF
                  case "$magic" in
                    LSARJ1)
                      [ "${#separators}" -eq 12 ] && [ -z "$source" ] || fail schema
                      case "$stage" in PREPARED|OBSERVED|SHOW_PREPARED|SHOW_OBSERVED) ;; *) fail stage ;; esac ;;
                    LSARJ2)
                      [ "${#separators}" -eq 13 ] && uuid "$source" && [ "$source" != "$operation" ] || fail restore_source
                      unsigned "$serial" 2147483647 && [ "$identity" != unknown ] || fail restore_identity
                      case "$stage" in RESTORE_PREPARED|RESTORE_OBSERVED) ;; *) fail stage ;; esac ;;
                    LSARJ3)
                      [ "${#separators}" -eq 17 ] && uuid "$source" && [ "$source" != "$operation" ] || fail restore_source
                      unsigned "$serial" 2147483647 && [ "$identity" != unknown ] || fail restore_identity
                      uuid "$epoch" && uuid "$challenge" || fail grant_coordinate
                      unsigned "$generation" && [ "$generation" != 0 ] || fail grant_generation
                      [ "${#status_mac}" -eq 64 ] || fail status_mac
                      case "$status_mac" in *[!0-9a-f]*) fail status_mac ;; esac
                      case "$stage" in RESTORE_PREPARED|RESTORE_OBSERVED) ;; *) fail stage ;; esac ;;
                    *) fail schema ;;
                  esac
                  uuid "$operation" && uuid "$owner" || fail uuid
                  unsigned "$owner_user" 99999 || fail owner_user
                  unsigned "$user" 99999 || fail target_user
                  unsigned "$serial" && unsigned "$created" || fail serial_or_time
                  [ "${#package}" -le 255 ] || fail package
                  printf '%s\\n' "$package" | grep -Eq '^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+$' || fail package
                  if [ "$identity" != unknown ]; then
                    [ "${#identity}" -eq 64 ] || fail identity
                    case "$identity" in *[!0-9a-f]*) fail identity ;; esac
                  fi
                  case "$state" in VISIBLE|HIDDEN|MISSING|ERROR) ;; *) fail state ;; esac
                  printf '%s\\n' "$code" | grep -Eq '^(0|-?[1-9][0-9]*)$' || fail exit_code
                  case "$code" in
                    -*) unsigned "${code#-}" 2147483648 || fail exit_code ;;
                    *) unsigned "$code" 2147483647 || fail exit_code ;;
                  esac
                  case "$timed" in 0|1) ;; *) fail timed_out ;; esac
                  if [ "$stage" = PREPARED ]; then
                    [ "$state" = VISIBLE ] && [ "$code" = 0 ] && [ "$timed" = 0 ] || fail prepared_state
                  elif [ "$stage" = RESTORE_PREPARED ]; then
                    [ "$state" = HIDDEN ] && [ "$code" = 0 ] && [ "$timed" = 0 ] || fail restore_prepared_state
                  elif [ "$stage" = SHOW_PREPARED ]; then
                    case "$state" in HIDDEN|VISIBLE) ;; *) fail show_prepared_state ;; esac
                    [ "$code" = 0 ] && [ "$timed" = 0 ] || fail show_prepared_state
                  fi
                }
                directory "$ROOT"
                directory "$JOURNAL"
                directory "$EVENTS"
                STAGING=$(mktemp -d "$JOURNAL/.batch.XXXXXXXX") || fail staging_create
                chmod 0700 "$STAGING" || fail staging_permissions
                INPUT=$(mktemp "$JOURNAL/.input.XXXXXXXX") || fail input_create
                NORMAL=$(mktemp "$JOURNAL/.normal.XXXXXXXX") || fail normal_create
                chmod 0600 "$INPUT" "$NORMAL" || fail input_permissions
                cat >"$INPUT" || fail input_read
                filecheck "$INPUT"
                bytes=$(wc -c <"$INPUT") || fail input_size
                unsigned "$bytes" 16384 && [ "$bytes" != 0 ] || fail input_size
                count=0
                while IFS= read -r record; do
                  count=$((count+1))
                  [ "$count" -le 8 ] || fail batch_too_large
                  validate
                  printf '%s\\n' "$record" >>"$NORMAL" || fail normalize_write
                  CANDIDATE=$(mktemp "$JOURNAL/.candidate.XXXXXXXX") || fail candidate_create
                  printf '%s\\n' "$record" >"$CANDIDATE" || fail record_write
                  chmod 0600 "$CANDIDATE" || fail candidate_permissions
                  staged="$STAGING/$operation.$stage.record"
                  [ ! -L "$staged" ] || fail symlink_staged
                  if [ -e "$staged" ]; then
                    filecheck "$staged"
                    cmp -s "$CANDIDATE" "$staged" || fail duplicate_conflict
                  else
                    cp "$CANDIDATE" "$staged" || fail stage_copy
                    chmod 0600 "$staged" || fail staged_permissions
                    cmp -s "$CANDIDATE" "$staged" || fail stage_compare
                  fi
                  rm -f "$CANDIDATE" || fail candidate_cleanup
                  CANDIDATE=''
                done <"$INPUT"
                [ "$count" -gt 0 ] || fail empty_batch
                # read strips NUL on some shells and ignores an unterminated last
                # line: byte-for-byte reconstruction rejects both, before publish.
                cmp -s "$INPUT" "$NORMAL" || fail noncanonical_input
                for staged in "$STAGING"/*.record; do
                  filecheck "$staged"
                  hash=$(digest "$staged") || fail staged_hash
                  fsync "$staged" || fail staged_sync
                  dest="$EVENTS/${staged##*/}"
                  [ ! -L "$dest" ] || fail symlink_record
                  if [ ! -e "$dest" ]; then
                    ln "$staged" "$dest" 2>/dev/null || [ -f "$dest" ] || fail publish
                  fi
                  filecheck "$dest"
                  cmp -s "$staged" "$dest" || fail record_conflict
                  chmod 0600 "$dest" || fail record_permissions
                  fsync "$dest" || fail record_sync
                  actual=$(digest "$dest") || fail record_hash
                  [ "$actual" = "$hash" ] || fail record_hash_mismatch
                done
                fsync "$EVENTS" "$JOURNAL" "$ROOT" "$ROOT_PARENT" "$STORAGE" || fail directory_sync
                printf '%s\\n' 'LSA_RECOVERY_JOURNAL_OK'
                """;
    }
}
