package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.Objects;

/** Immutable exact-grant evidence. A disk record or a successful read is never sending authority. */
final class HideRestoreGrantStore {
    interface Io { RootShell.Result run(Operation operation); }
    enum Mode { READ, CLAIM, FINISH }
    private final Io io;

    HideRestoreGrantStore() { this(op -> RootShell.run(op.command(), null, 30, 8192)); }
    HideRestoreGrantStore(Io io) { this.io = Objects.requireNonNull(io); }

    static final class Snapshot {
        final boolean exists;
        final String terminal, error;
        private Snapshot(boolean exists, String terminal, String error) {
            this.exists = exists; this.terminal = terminal; this.error = error;
        }
    }

    static final class Claim {
        private final HideRestoreGrantStore owner;
        final HideRecoveryJournal.Entry entry;
        final boolean acknowledged;
        final String error;
        private boolean dispatched, closedUnsent;
        private Claim(HideRestoreGrantStore owner, HideRecoveryJournal.Entry entry,
                boolean acknowledged, String error) {
            this.owner = owner; this.entry = entry; this.acknowledged = acknowledged; this.error = error;
        }
        synchronized void markDispatched() {
            if (!acknowledged || dispatched || closedUnsent)
                throw new IllegalStateException("Recovery claim cannot dispatch");
            dispatched = true;
        }
    }

    Claim claim(HideRecoveryJournal.Entry entry) {
        try {
            HideRecoveryJournal.Entry prepared = prepared(entry);
            if (entry.stage != HideRecoveryJournal.Stage.RESTORE_PREPARED)
                throw new IllegalArgumentException("Claim needs a fresh prepared entry");
            String body = body(io.run(new Operation(Mode.CLAIM, prepared, "")));
            boolean acknowledged = ("CLAIMED|" + prepared.encode()).equals(body);
            return new Claim(this, prepared, acknowledged,
                    acknowledged ? "" : "恢复记录创建或持久确认失败，未发送恢复");
        } catch (RuntimeException failure) {
            return new Claim(this, entry, false, "恢复记录创建结果未确认，未发送恢复");
        }
    }

    /** Only the local, acknowledged create-once winner can certify that it never dispatched. */
    boolean finishNotSent(Claim claim) {
        if (claim == null || claim.owner != this || !claim.acknowledged) return false;
        synchronized (claim) {
            if (claim.dispatched) return false;
            claim.closedUnsent = true;
            return finish(claim.entry, "LOCAL_NOT_SENT");
        }
    }

    boolean finishReply(HideRecoveryJournal.Entry entry, HideRootProtocol.Reply reply) {
        try {
            HideRecoveryJournal.Entry prepared = prepared(entry);
            HideRestoreGrantLedger.StatusProof proof = prepared.recoveryProof;
            if (reply == null || reply.request == null
                    || reply.request.verb != HideRootProtocol.Verb.RECOVER
                        && reply.request.verb != HideRootProtocol.Verb.RECOVERY_STATUS
                    || !same(proof.coordinate, reply.request.coordinate)
                    || !same(proof.coordinate, reply.coordinate)
                    || !prepared.operationId.equals(reply.nonce)
                    || reply.request.verb == HideRootProtocol.Verb.RECOVERY_STATUS
                        && !proof.statusMac.equals(reply.request.authentication)
                    || reply.outcome != HideRootProtocol.Outcome.RESTORED
                        && reply.outcome != HideRootProtocol.Outcome.REJECTED_BEFORE_WRITE) return false;
            return finish(prepared, reply.outcome.name());
        } catch (RuntimeException invalid) { return false; }
    }

    Snapshot read(HideRecoveryJournal.Entry entry) {
        try {
            HideRecoveryJournal.Entry prepared = prepared(entry);
            String body = body(io.run(new Operation(Mode.READ, prepared, "")));
            if ("EMPTY".equals(body)) return new Snapshot(false, "", "");
            String prefix = "CLAIM|" + prepared.encode() + "\nTERMINAL|";
            if (body == null || !body.startsWith(prefix)) throw new IllegalStateException();
            String terminal = body.substring(prefix.length());
            if ("-".equals(terminal)) return new Snapshot(true, "", "");
            if (!terminal(terminal)) throw new IllegalStateException();
            return new Snapshot(true, terminal, "");
        } catch (RuntimeException failure) {
            return new Snapshot(false, "", "恢复记录读取或校验未确认，保留原记录");
        }
    }

    private boolean finish(HideRecoveryJournal.Entry entry, String terminal) {
        try {
            String actual = body(io.run(new Operation(Mode.FINISH, entry, terminal)));
            String prefix = "FINISHED|" + entry.encode() + "|";
            return (prefix + terminal).equals(actual)
                    || "REJECTED_BEFORE_WRITE".equals(terminal)
                        && (prefix + "LOCAL_NOT_SENT").equals(actual);
        } catch (RuntimeException failure) { return false; }
    }

    private static HideRecoveryJournal.Entry prepared(HideRecoveryJournal.Entry entry) {
        if (entry == null || entry.recoveryProof == null
                || !HideRecoveryJournal.restoreStage(entry.stage)
                || HideRecoveryJournal.parse(entry.encode()) == null)
            throw new IllegalArgumentException("Invalid recovery grant record");
        return entry.stage == HideRecoveryJournal.Stage.RESTORE_PREPARED ? entry
                : new HideRecoveryJournal.Entry(entry.operationId, entry.ownerId, entry.ownerUserId,
                    entry.userId, entry.userSerial, entry.packageName, entry.packageIdentity, entry.createdAt,
                    HideRecoveryJournal.Stage.RESTORE_PREPARED, "HIDDEN", 0, false,
                    entry.sourceHideNonce, entry.recoveryProof);
    }

    private static boolean same(HideRestoreGrantLedger.Coordinate a, HideRestoreGrantLedger.Coordinate b) {
        return a != null && b != null && a.generation == b.generation && a.userId == b.userId
                && a.serial == b.serial && a.epoch.equals(b.epoch) && a.nonce.equals(b.nonce)
                && a.sourceHideNonce.equals(b.sourceHideNonce) && a.packageName.equals(b.packageName)
                && a.challenge.equals(b.challenge);
    }
    private static boolean terminal(String value) {
        return "LOCAL_NOT_SENT".equals(value) || "RESTORED".equals(value)
                || "REJECTED_BEFORE_WRITE".equals(value);
    }
    private static String key(HideRecoveryJournal.Entry entry) {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(
                    (entry.userId + "|" + entry.userSerial + "|" + entry.packageName).getBytes(StandardCharsets.US_ASCII));
            StringBuilder result = new StringBuilder(64);
            for (byte value : hash) result.append(Character.forDigit((value & 255) >>> 4, 16))
                    .append(Character.forDigit(value & 15, 16));
            return result.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    private static String body(RootShell.Result result) {
        if (result == null || !result.isSuccess() || result.capture == null || !result.capture.reliable()) return null;
        byte[] bytes = result.capture.bytes();
        if (bytes.length == 0 || bytes.length > 8192) return null;
        for (byte value : bytes) if (value != '\n' && (value < 33 || value > 126)) return null;
        String text = new String(bytes, StandardCharsets.US_ASCII);
        String first = "LSARGS1\n", last = "\nLSARGS_END\n";
        return text.startsWith(first) && text.endsWith(last)
                ? text.substring(first.length(), text.length() - last.length()) : null;
    }

    /** Fixed validated operation; neither paths nor executable script text come from the caller. */
    static final class Operation {
        final Mode mode;
        final String key, source, epoch, generation, bucket, stem, record, terminal;
        private Operation(Mode mode, HideRecoveryJournal.Entry entry, String terminal) {
            HideRecoveryJournal.Entry prepared = prepared(entry);
            if (mode == null || (mode == Mode.FINISH ? !terminal(terminal) : !terminal.isEmpty()))
                throw new IllegalArgumentException("Invalid store operation");
            HideRestoreGrantLedger.Coordinate c = prepared.recoveryProof.coordinate;
            this.mode = mode; this.key = key(prepared); this.source = c.sourceHideNonce; this.epoch = c.epoch;
            this.generation = Long.toString(c.generation);
            this.bucket = String.format(Locale.ROOT, "%017d", c.generation / 256);
            this.stem = String.format(Locale.ROOT, "%019d", c.generation) + "-" + c.nonce;
            this.record = prepared.encode(); this.terminal = terminal;
        }
        String command() {
            return "MODE=" + RootShell.quote(mode.name()) + "\nKEY=" + RootShell.quote(key)
                    + "\nSOURCE=" + RootShell.quote(source) + "\nEPOCH=" + RootShell.quote(epoch)
                    + "\nGENERATION=" + RootShell.quote(generation) + "\nBUCKET=" + RootShell.quote(bucket)
                    + "\nSTEM=" + RootShell.quote(stem) + "\nRECORD=" + RootShell.quote(record)
                    + "\nTERMINAL=" + RootShell.quote(terminal) + "\n" + SCRIPT;
        }
    }

    private static final String SCRIPT = """
        umask 077
        export LC_ALL=C
        ROOT='/data/adb/ls_augment/v2/restore-grants-v1'
        V2=${ROOT%/*}
        APP=${V2%/*}
        STORAGE=${APP%/*}
        TMP=''
        fail() { printf '%s\\n' "restore_grant_store:$1" >&2; exit 74; }
        trap '[ -z "$TMP" ] || rm -f "$TMP"' EXIT
        trap 'exit 74' HUP INT TERM
        [ "$(id -u)" = 0 ] || fail root_required
        ascii=$(printf '%s' "$RECORD" | tr -cd '!-~') || fail ascii_check
        [ "$ascii" = "$RECORD" ] && [ "${#RECORD}" -lt 2048 ] || fail noncanonical_record
        separators=$(printf '%s' "$RECORD" | tr -cd '|') || fail field_count
        [ "${#separators}" -eq 17 ] || fail field_count
        IFS='|' read -r magic operation owner owner_user user serial package identity created stage state code timed source epoch generation challenge status_mac <<EOF
        $RECORD
        EOF
        uuid() { printf '%s\\n' "$1" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'; }
        hex64() { [ "${#1}" -eq 64 ] && case "$1" in *[!0-9a-f]*) return 1 ;; *) return 0 ;; esac; }
        unsigned() {
          printf '%s\\n' "$1" | grep -Eq '^(0|[1-9][0-9]*)$' || return 1
          limit=${2:-9223372036854775807}
          [ "${#1}" -lt "${#limit}" ] && return 0
          [ "${#1}" -eq "${#limit}" ] || return 1
          [ "$1" = "$limit" ] || [ "$1" \\< "$limit" ]
        }
        [ "$magic" = LSARJ3 ] && [ "$stage" = RESTORE_PREPARED ] || fail schema
        [ "$state" = HIDDEN ] && [ "$code" = 0 ] && [ "$timed" = 0 ] || fail prepared_state
        uuid "$operation" && uuid "$owner" && uuid "$source" && uuid "$epoch" && uuid "$challenge" || fail uuid
        [ "$source" != "$operation" ] || fail source_conflict
        unsigned "$owner_user" 99999 && unsigned "$user" 99999 && unsigned "$serial" 2147483647 || fail user_identity
        unsigned "$created" && unsigned "$generation" && [ "$generation" != 0 ] || fail generation_or_time
        hex64 "$identity" && hex64 "$status_mac" && hex64 "$KEY" || fail identity_or_mac
        [ "${#package}" -le 255 ] && printf '%s\\n' "$package" | grep -Eq '^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+$' || fail package
        digest=$(printf '%s|%s|%s' "$user" "$serial" "$package" | sha256sum) || fail tuple_digest
        [ "${digest%% *}" = "$KEY" ] || fail tuple_path
        [ "$SOURCE" = "$source" ] && [ "$EPOCH" = "$epoch" ] && [ "$GENERATION" = "$generation" ] || fail coordinate_path
        # Decimal long division uses only intermediates <= 2559, including on a 32-bit shell.
        digits=$generation; quotient=''; remainder=0
        while [ -n "$digits" ]; do
          digit=${digits%"${digits#?}"}; digits=${digits#?}
          value=$((remainder*10+digit)); next=$((value/256)); remainder=$((value%256))
          if [ -n "$quotient" ] || [ "$next" != 0 ]; then quotient="$quotient$next"; fi
        done
        [ -n "$quotient" ] || quotient=0
        expected_bucket=$(printf '%017s' "$quotient" | tr ' ' 0) || fail bucket_format
        ordinal=$(printf '%019s' "$generation" | tr ' ' 0) || fail generation_format
        [ "$BUCKET" = "$expected_bucket" ] && [ "$STEM" = "$ordinal-$operation" ] || fail generation_path
        case "$MODE:$TERMINAL" in READ:|CLAIM:|FINISH:LOCAL_NOT_SENT|FINISH:RESTORED|FINISH:REJECTED_BEFORE_WRITE) ;; *) fail mode ;; esac
        TARGET="$ROOT/$KEY"
        SOURCE_DIR="$TARGET/$SOURCE"
        EPOCH_DIR="$SOURCE_DIR/$EPOCH"
        DIR="$EPOCH_DIR/$BUCKET"
        CLAIM="$DIR/$STEM.claim"
        DONE="$DIR/$STEM.done"
        parent="$STORAGE"
        while [ "$parent" != / ]; do
          [ ! -L "$parent" ] || fail symlink_parent
          parent=${parent%/*}; [ -n "$parent" ] || parent=/
        done
        checkdir() {
          [ ! -L "$1" ] && [ -d "$1" ] || fail invalid_directory
          metadata=$(stat -c '%u:%g:%a' "$1") || fail directory_stat
          [ "$metadata" = 0:0:700 ] || fail directory_owner_or_mode
        }
        checkfile() {
          [ ! -L "$1" ] && [ -f "$1" ] && [ -r "$1" ] || fail invalid_record
          metadata=$(stat -c '%u:%g:%a' "$1") || fail record_stat
          [ "$metadata" = 0:0:600 ] || fail record_owner_or_mode
        }
        checkstorage() {
          [ ! -L "$STORAGE" ] && [ -d "$STORAGE" ] || fail invalid_storage
          metadata=$(stat -c '%u:%g:%a' "$STORAGE") || fail storage_stat
          # Existing system storage is not chmod/chowned. Reject non-root or group/world writable storage.
          case "$metadata" in 0:0:[0-7][0145][0145]) ;; *) fail storage_owner_or_mode ;; esac
        }
        checkdirs() {
          checkstorage
          for directory in "$APP" "$V2" "$ROOT" "$TARGET" "$SOURCE_DIR" "$EPOCH_DIR" "$DIR"; do
            checkdir "$directory"
          done
        }
        syncdirs() { fsync "$DIR" "$EPOCH_DIR" "$SOURCE_DIR" "$TARGET" "$ROOT" "$V2" "$APP" "$STORAGE" || fail directory_sync; }
        exact() {
          checkfile "$1"
          bytes=$(wc -c <"$1") || fail record_size
          [ "$bytes" -eq "$((${#2}+1))" ] || fail record_size
          printf '%s\\n' "$2" | cmp -s - "$1" || fail record_bytes
        }
        read_done() {
          checkfile "$DONE"
          bytes=$(wc -c <"$DONE") || fail terminal_size
          [ "$bytes" -gt 0 ] && [ "$bytes" -lt 2100 ] || fail terminal_size
          completion=$(cat "$DONE") || fail terminal_read
          case "$completion" in
            "$RECORD|LOCAL_NOT_SENT") actual_terminal=LOCAL_NOT_SENT ;;
            "$RECORD|RESTORED") actual_terminal=RESTORED ;;
            "$RECORD|REJECTED_BEFORE_WRITE") actual_terminal=REJECTED_BEFORE_WRITE ;;
            *) fail terminal_identity ;;
          esac
          exact "$DONE" "$completion"
        }
        emit() { printf 'LSARGS1\\n%s\\nLSARGS_END\\n' "$1" || fail output; }
        checkstorage
        if [ "$MODE" = READ ]; then
          for directory in "$APP" "$V2" "$ROOT" "$TARGET" "$SOURCE_DIR" "$EPOCH_DIR" "$DIR"; do
            [ ! -L "$directory" ] || fail symlink_directory
            if [ ! -e "$directory" ]; then emit EMPTY; exit 0; fi
            checkdir "$directory"
          done
          [ ! -L "$CLAIM" ] && [ ! -L "$DONE" ] || fail symlink_record
          if [ ! -e "$CLAIM" ]; then
            [ ! -e "$DONE" ] || fail orphan_terminal
            emit EMPTY; exit 0
          fi
          exact "$CLAIM" "$RECORD"
          actual_terminal='-'
          if [ -e "$DONE" ]; then read_done; fi
          checkdirs
          emit "CLAIM|$RECORD
        TERMINAL|$actual_terminal"
          exit 0
        fi
        command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
        for directory in "$APP" "$V2" "$ROOT" "$TARGET" "$SOURCE_DIR" "$EPOCH_DIR" "$DIR"; do
          [ ! -L "$directory" ] || fail symlink_directory
          if [ ! -e "$directory" ]; then
            if mkdir "$directory" 2>/dev/null; then
              chown 0:0 "$directory" && chmod 0700 "$directory" || fail directory_permissions
            else
              [ -d "$directory" ] || fail directory_create
            fi
          fi
          checkdir "$directory"
        done
        checkdirs
        [ ! -L "$CLAIM" ] && [ ! -L "$DONE" ] || fail symlink_record
        if [ "$MODE" = CLAIM ]; then
          [ ! -e "$CLAIM" ] && [ ! -e "$DONE" ] || fail already_claimed
        else
          exact "$CLAIM" "$RECORD"
          if [ -e "$DONE" ]; then
            read_done
            if [ "$actual_terminal" = LOCAL_NOT_SENT ] && [ "$TERMINAL" = REJECTED_BEFORE_WRITE ]; then
              fsync "$CLAIM" "$DONE" || fail published_sync
              checkdirs; syncdirs
              exact "$CLAIM" "$RECORD"; exact "$DONE" "$RECORD|LOCAL_NOT_SENT"
              checkdirs
              emit "FINISHED|$RECORD|LOCAL_NOT_SENT"; exit 0
            fi
            [ "$actual_terminal" = "$TERMINAL" ] || fail terminal_conflict
          fi
        fi
        TMP=$(mktemp "$DIR/.write.XXXXXXXX") || fail temp_create
        chown 0:0 "$TMP" && chmod 0600 "$TMP" || fail file_permissions
        if [ "$MODE" = CLAIM ]; then content="$RECORD"; destination="$CLAIM"; else content="$RECORD|$TERMINAL"; destination="$DONE"; fi
        printf '%s\\n' "$content" >"$TMP" || fail content_write
        exact "$TMP" "$content"
        fsync "$TMP" || fail content_sync
        checkdirs
        if ! ln "$TMP" "$destination" 2>/dev/null; then
          [ "$MODE" = FINISH ] || fail already_claimed
          read_done
          if [ "$actual_terminal" = LOCAL_NOT_SENT ] && [ "$TERMINAL" = REJECTED_BEFORE_WRITE ]; then
            TERMINAL=LOCAL_NOT_SENT; content="$RECORD|$TERMINAL"
          else
            [ "$actual_terminal" = "$TERMINAL" ] || fail terminal_conflict
          fi
        fi
        exact "$destination" "$content"
        exact "$CLAIM" "$RECORD"
        fsync "$CLAIM" "$destination" || fail published_sync
        rm -f "$TMP" || fail temp_remove
        TMP=''
        checkdirs
        syncdirs
        exact "$destination" "$content"
        checkdirs
        if [ "$MODE" = CLAIM ]; then emit "CLAIMED|$RECORD"; else emit "FINISHED|$RECORD|$TERMINAL"; fi
        """;
}
