package ls.augment.com;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.regex.Pattern;

/** Durable target intent and observations. Reading or saving data never authorizes or sends an action. */
final class HideTargetStore {
    static final int SCHEMA_VERSION = 1, MAX_RECORDS = 1024, MAX_BYTES = 1024 * 1024;
    private static final int MAX_OUTPUT = MAX_BYTES * 2;
    private static final Object PROCESS_LOCK = new Object();
    private static final Pattern NUMBER = Pattern.compile("0|[1-9][0-9]*");
    private static final Pattern ID = Pattern.compile("[A-Za-z0-9][A-Za-z0-9._:-]{0,127}");
    private static final Pattern HEX = Pattern.compile("[0-9a-f]{64}");

    enum ObservedState { HIDDEN, VISIBLE, MISSING, UNKNOWN }
    enum Action { HIDE, SHOW }
    enum OperationStatus { PENDING, SUCCEEDED, FAILED, UNKNOWN }
    enum ReadStatus { OK, ABSENT, CORRUPT, UNAVAILABLE }
    enum WriteStatus { APPLIED, CONFLICT, REJECTED, UNKNOWN }
    enum Mode { READ, CAS, LEGACY }
    interface Io { RootShell.Result run(Operation operation); }
    private final Io io;

    HideTargetStore() { this(op -> RootShell.run(op.command(), op.stdin(), 30, MAX_OUTPUT)); }
    HideTargetStore(Io io) { this.io = Objects.requireNonNull(io); }

    static final class LastOperation {
        final String id, error, backendNonce;
        final long revision;
        final Action action;
        final OperationStatus status;
        LastOperation(String id, long revision, Action action, OperationStatus status, String error, String backendNonce) {
            if (id == null || !ID.matcher(id).matches() || revision < 1)
                throw new IllegalArgumentException("Invalid operation identity");
            this.id = id; this.revision = revision;
            this.action = Objects.requireNonNull(action); this.status = Objects.requireNonNull(status);
            this.error = error == null ? "" : error;
            this.backendNonce = backendNonce == null ? "" : backendNonce;
            if (this.error.getBytes(StandardCharsets.UTF_8).length > 1024
                    || !this.backendNonce.isEmpty() && !ID.matcher(this.backendNonce).matches())
                throw new IllegalArgumentException("Invalid operation detail");
            // Reject unpaired surrogates; every accepted value must survive an exact round trip.
            if (!utf8(this.error.getBytes(StandardCharsets.UTF_8)).equals(this.error))
                throw new IllegalArgumentException("Invalid operation text");
        }
    }

    static final class Record {
        final int userId;
        final long userSerial, observedAt;
        final String packageName;
        final boolean bound, managed;
        final Boolean desiredHidden;
        final ObservedState observedState;
        final LastOperation lastOperation;
        Record(int userId, long userSerial, String packageName, boolean bound, boolean managed,
                Boolean desiredHidden, ObservedState observedState, long observedAt, LastOperation lastOperation) {
            if (!new HideTargetCodec.Entry(userId, userSerial, packageName, bound).isValid() || observedAt < 0)
                throw new IllegalArgumentException("Invalid target identity or time");
            this.userId = userId; this.userSerial = userSerial; this.packageName = packageName;
            this.bound = bound; this.managed = managed; this.desiredHidden = desiredHidden;
            this.observedState = Objects.requireNonNull(observedState); this.observedAt = observedAt;
            this.lastOperation = lastOperation;
        }
        String key() { return userId + "|" + userSerial + "|" + packageName; }
    }

    static final class Snapshot {
        final int schemaVersion = SCHEMA_VERSION;
        final long revision;
        final List<Record> records;
        Snapshot(long revision, List<Record> records) {
            if (revision < 0 || records == null || records.size() > MAX_RECORDS)
                throw new IllegalArgumentException("Invalid target document bounds");
            List<Record> copy = new ArrayList<>(records);
            Set<String> keys = new HashSet<>();
            for (Record record : copy) {
                if (record == null || !keys.add(record.key())
                        || record.lastOperation != null && record.lastOperation.revision > revision)
                    throw new IllegalArgumentException("Duplicate target or future operation");
            }
            copy.sort(Comparator.comparingInt((Record r) -> r.userId)
                    .thenComparing(r -> r.packageName).thenComparingLong(r -> r.userSerial));
            this.revision = revision; this.records = Collections.unmodifiableList(copy);
            if (encode().getBytes(StandardCharsets.US_ASCII).length > MAX_BYTES)
                throw new IllegalArgumentException("Target document exceeds byte limit");
        }
        String encode() {
            StringBuilder out = new StringBuilder("LSAT1|").append(revision).append('|').append(records.size()).append('\n');
            for (Record r : records) {
                out.append("T|").append(r.userId).append('|').append(r.userSerial).append('|').append(r.packageName)
                        .append('|').append(bit(r.bound)).append('|').append(bit(r.managed)).append('|')
                        .append(r.desiredHidden == null ? "-" : bit(r.desiredHidden)).append('|').append(r.observedState)
                        .append('|').append(r.observedAt).append('|');
                LastOperation op = r.lastOperation;
                if (op == null) out.append("-|0|-|-|-|-");
                else out.append(op.id).append('|').append(op.revision).append('|').append(op.action).append('|')
                        .append(op.status).append('|').append(text(op.error)).append('|')
                        .append(op.backendNonce.isEmpty() ? "-" : op.backendNonce);
                out.append('\n');
            }
            return out.append("LSAT_END\n").toString();
        }
    }

    static final class ReadResult {
        final ReadStatus status;
        final Snapshot snapshot;
        final String error, sha256, raw;
        private ReadResult(ReadStatus status, Snapshot snapshot, String error, String sha256, String raw) {
            this.status = status; this.snapshot = snapshot; this.error = error; this.sha256 = sha256; this.raw = raw;
        }
    }
    static final class WriteResult {
        final WriteStatus status;
        final boolean applied;
        final Snapshot snapshot;
        final String error;
        private WriteResult(WriteStatus status, Snapshot snapshot, String error) {
            this.status = status; this.applied = status == WriteStatus.APPLIED; this.snapshot = snapshot; this.error = error;
        }
        ReadResult acknowledgedRead() {
            if (!applied) throw new IllegalStateException("No acknowledged document");
            String raw = snapshot.encode();
            return new ReadResult(ReadStatus.OK, snapshot, "", sha256(raw), raw);
        }
    }
    static final class LegacyResult {
        final ReadStatus status;
        final String raw, sha256, error;
        final List<HideTargetCodec.Entry> entries;
        private LegacyResult(ReadStatus status, String raw, String sha256, String error, List<HideTargetCodec.Entry> entries) {
            this.status = status; this.raw = raw; this.sha256 = sha256; this.error = error;
            this.entries = Collections.unmodifiableList(new ArrayList<>(entries));
        }
    }

    ReadResult read() {
        synchronized (PROCESS_LOCK) { return readLocked(); }
    }
    private ReadResult readLocked() {
        String raw = "", hash = "";
        boolean receivedData = false;
        try {
            Wire wire = wire(io.run(new Operation(Mode.READ, null, null)));
            if (wire.kind.equals("ABSENT"))
                return new ReadResult(ReadStatus.ABSENT, new Snapshot(0, Collections.emptyList()), "", "", "");
            if (wire.kind.equals("CORRUPT") || wire.kind.equals("UNAVAILABLE"))
                return new ReadResult(ReadStatus.valueOf(wire.kind), null, wire.detail, "", "");
            if (!wire.kind.equals("DATA")) throw new IllegalArgumentException("Invalid read response");
            receivedData = true;
            raw = wire.detail; hash = wire.hash;
            return new ReadResult(ReadStatus.OK, parse(raw), "", hash, raw);
        } catch (IllegalArgumentException invalid) {
            return new ReadResult(receivedData ? ReadStatus.CORRUPT : ReadStatus.UNAVAILABLE,
                    null, "目标记录读取或校验失败，保留原文件", hash, raw);
        } catch (RuntimeException unavailable) {
            return new ReadResult(ReadStatus.UNAVAILABLE, null, "目标记录读取未确认，保留原文件", "", "");
        }
    }

    WriteResult compareAndSet(long expectedRevision, Snapshot proposed) {
        if (expectedRevision < 0 || expectedRevision == Long.MAX_VALUE || proposed == null
                || proposed.revision != expectedRevision + 1)
            return new WriteResult(WriteStatus.REJECTED, null, "目标记录修订号无效");
        synchronized (PROCESS_LOCK) {
            ReadResult before = readLocked();
            if (before.status != ReadStatus.OK && before.status != ReadStatus.ABSENT)
                return new WriteResult(WriteStatus.REJECTED, null, before.error);
            if (before.snapshot.revision != expectedRevision)
                return new WriteResult(WriteStatus.CONFLICT, before.snapshot, "目标记录已被其他操作更新");
            return compareAndSet(before, proposed);
        }
    }

    /** Reuse an actual read/write receipt; the locked on-disk hash and revision still decide CAS. */
    WriteResult compareAndSet(ReadResult before, Snapshot proposed) {
        if (before == null || before.status != ReadStatus.OK && before.status != ReadStatus.ABSENT
                || before.snapshot == null || before.snapshot.revision == Long.MAX_VALUE || proposed == null
                || proposed.revision != before.snapshot.revision + 1)
            return new WriteResult(WriteStatus.REJECTED, null, "目标记录回执或修订号无效");
        synchronized (PROCESS_LOCK) {
            Set<String> retained = new HashSet<>();
            for (Record record : proposed.records) retained.add(record.key());
            for (Record record : before.snapshot.records) if (!retained.contains(record.key()))
                return new WriteResult(WriteStatus.REJECTED, null, "取消管理应保留目标记录，不可删除既有目标");
            try {
                Wire reply = wire(io.run(new Operation(Mode.CAS, before, proposed)));
                if (reply.kind.equals("CONFLICT"))
                    return new WriteResult(WriteStatus.CONFLICT, null, "目标记录已被其他进程更新");
                if (reply.kind.equals("REJECTED"))
                    return new WriteResult(WriteStatus.REJECTED, null, reply.detail);
                if (!reply.kind.equals("APPLIED") || !reply.detail.equals(proposed.encode()))
                    return new WriteResult(WriteStatus.UNKNOWN, null, "目标记录提交未确认，请只读核对，不补发应用操作");
                return new WriteResult(WriteStatus.APPLIED, parse(reply.detail), "");
            } catch (RuntimeException uncertain) {
                return new WriteResult(WriteStatus.UNKNOWN, null, "目标记录提交结果未知，保留文件并只读核对");
            }
        }
    }

    LegacyResult readLegacyTargets() {
        synchronized (PROCESS_LOCK) {
            String raw = "", hash = "";
            try {
                Wire wire = wire(io.run(new Operation(Mode.LEGACY, null, null)));
                if (wire.kind.equals("ABSENT"))
                    return new LegacyResult(ReadStatus.ABSENT, "", "", "", Collections.emptyList());
                if (wire.kind.equals("CORRUPT") || wire.kind.equals("UNAVAILABLE"))
                    return new LegacyResult(ReadStatus.valueOf(wire.kind), "", "", wire.detail, Collections.emptyList());
                if (!wire.kind.equals("DATA")) throw new IllegalArgumentException("Invalid legacy response");
                raw = wire.detail; hash = wire.hash;
                HideTargetCodec.Selection parsed = HideTargetCodec.parse(raw);
                return new LegacyResult(parsed.valid ? ReadStatus.OK : ReadStatus.CORRUPT,
                        raw, hash, parsed.message, parsed.entries);
            } catch (RuntimeException invalid) {
                return new LegacyResult(ReadStatus.UNAVAILABLE, raw, hash, "旧目标名单读取未确认，保留原值", Collections.emptyList());
            }
        }
    }

    static Snapshot parse(String raw) {
        if (raw == null || raw.length() > MAX_BYTES) throw new IllegalArgumentException("Document bounds");
        String[] lines = raw.split("\n", -1);
        if (lines.length < 3 || !lines[lines.length - 1].isEmpty() || !lines[lines.length - 2].equals("LSAT_END"))
            throw new IllegalArgumentException("Document framing");
        String[] head = lines[0].split("\\|", -1);
        if (head.length != 3 || !head[0].equals("LSAT1")) throw new IllegalArgumentException("Document schema");
        long revision = number(head[1]);
        long count = number(head[2]);
        if (revision < 1 || count > MAX_RECORDS || count != lines.length - 3)
            throw new IllegalArgumentException("Document revision or count");
        List<Record> records = new ArrayList<>();
        for (int i = 1; i < lines.length - 2; i++) {
            String[] f = lines[i].split("\\|", -1);
            if (f.length != 15 || !f[0].equals("T")) throw new IllegalArgumentException("Record schema");
            LastOperation operation = null;
            if (!f[9].equals("-")) operation = new LastOperation(f[9], number(f[10]), Action.valueOf(f[11]),
                    OperationStatus.valueOf(f[12]), untext(f[13]), f[14].equals("-") ? "" : f[14]);
            else if (!f[10].equals("0") || !f[11].equals("-") || !f[12].equals("-")
                    || !f[13].equals("-") || !f[14].equals("-")) throw new IllegalArgumentException("Absent operation fields");
            long user = number(f[1]);
            if (user > 99999) throw new IllegalArgumentException("User bounds");
            records.add(new Record((int) user, f[2].equals("-1") ? -1 : number(f[2]), f[3],
                    bool(f[4]), bool(f[5]), f[6].equals("-") ? null : bool(f[6]),
                    ObservedState.valueOf(f[7]), number(f[8]), operation));
        }
        Snapshot result = new Snapshot(revision, records);
        if (!result.encode().equals(raw)) throw new IllegalArgumentException("Noncanonical document");
        return result;
    }
    private static long number(String value) {
        if (!NUMBER.matcher(value).matches()) throw new IllegalArgumentException("Noncanonical number");
        return Long.parseLong(value);
    }
    private static boolean bool(String value) {
        if (value.equals("0")) return false;
        if (value.equals("1")) return true;
        throw new IllegalArgumentException("Invalid boolean");
    }
    private static String bit(boolean value) { return value ? "1" : "0"; }
    private static String text(String value) {
        return value.isEmpty() ? "-" : Base64.getEncoder().encodeToString(value.getBytes(StandardCharsets.UTF_8));
    }
    private static String untext(String value) {
        if (value.equals("-")) return "";
        String decoded = utf8(Base64.getDecoder().decode(value));
        if (!text(decoded).equals(value)) throw new IllegalArgumentException("Noncanonical text");
        return decoded;
    }
    private static String utf8(byte[] bytes) {
        try { return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString(); }
        catch (CharacterCodingException invalid) { throw new IllegalArgumentException("Invalid UTF-8", invalid); }
    }
    static String sha256(String value) {
        try {
            byte[] bytes = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder out = new StringBuilder(64);
            for (byte b : bytes) out.append(Character.forDigit((b & 255) >>> 4, 16)).append(Character.forDigit(b & 15, 16));
            return out.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    private static final class Wire {
        final String kind, hash, detail;
        Wire(String kind, String hash, String detail) { this.kind = kind; this.hash = hash; this.detail = detail; }
    }
    private static Wire wire(RootShell.Result result) {
        if (result == null || result.timedOut || result.capture == null || !result.capture.reliable())
            throw new IllegalArgumentException("Unconfirmed transport");
        byte[] bytes = result.capture.bytes();
        if (bytes.length > MAX_OUTPUT) throw new IllegalArgumentException("Response bounds");
        String[] f = utf8(bytes).split("\n", -1);
        if (f.length != 4 || !f[0].equals("LSAT_STORE1") || !f[2].equals("LSAT_STORE_END") || !f[3].isEmpty())
            throw new IllegalArgumentException("Response framing");
        String[] body = f[1].split("\\|", -1);
        if (body.length == 1 && result.isSuccess() && (body[0].equals("ABSENT") || body[0].equals("CONFLICT")))
            return new Wire(body[0], "", "");
        if (body.length == 3 && result.isSuccess() && (body[0].equals("DATA") || body[0].equals("APPLIED"))
                && HEX.matcher(body[1]).matches()) {
            byte[] decoded = Base64.getDecoder().decode(body[2]);
            if (decoded.length > MAX_BYTES || !Base64.getEncoder().encodeToString(decoded).equals(body[2]))
                throw new IllegalArgumentException("Response data bounds");
            String raw = utf8(decoded);
            if (!sha256(raw).equals(body[1])) throw new IllegalArgumentException("Response digest");
            return new Wire(body[0], body[1], raw);
        }
        if (body.length == 3 && body[0].equals("ERROR") && result.exitCode == 74
                && (body[1].equals("CORRUPT") || body[1].equals("UNAVAILABLE") || body[1].equals("REJECTED") || body[1].equals("UNKNOWN"))
                && body[2].matches("[a-z_]{1,80}")) return new Wire(body[1], "", body[2]);
        throw new IllegalArgumentException("Response shape");
    }

    /** Fixed paths, fixed script, validated immutable payload; Io is only a test seam. */
    static final class Operation {
        final Mode mode;
        final String expectedHash, expectedRevision, document, proposedHash;
        private Operation(Mode mode, ReadResult before, Snapshot proposed) {
            this.mode = mode;
            expectedHash = before == null || before.status == ReadStatus.ABSENT ? "ABSENT" : before.sha256;
            expectedRevision = before == null ? "0" : Long.toString(before.snapshot.revision);
            document = proposed == null ? "" : proposed.encode();
            proposedHash = proposed == null ? "" : sha256(document);
        }
        String stdin() { return document; }
        String command() {
            return "MODE=" + RootShell.quote(mode.name()) + "\nEXPECTED=" + RootShell.quote(expectedHash)
                    + "\nREVISION=" + RootShell.quote(expectedRevision) + "\nPROPOSED=" + RootShell.quote(proposedHash) + "\n" + SCRIPT;
        }
    }

    private static final String SCRIPT = """
        umask 077
        export LC_ALL=C
        ROOT='/data/adb/ls_augment/v2/manual-targets-v1'
        V2=${ROOT%/*}; APP=${V2%/*}; STORAGE=${APP%/*}
        FILE="$ROOT/document"
        TMP=''
        PHASE=REJECTED
        emit() { printf 'LSAT_STORE1\n%s\nLSAT_STORE_END\n' "$1"; }
        fail() { if [ "$MODE" = CAS ]; then kind=$PHASE; else kind=UNAVAILABLE; fi; emit "ERROR|$kind|$1"; exit 74; }
        bad() { if [ "$MODE" = CAS ]; then kind=$PHASE; else kind=CORRUPT; fi; emit "ERROR|$kind|$1"; exit 74; }
        cleanup() { [ -z "$TMP" ] || rm -f "$TMP"; }
        trap cleanup EXIT
        trap 'exit 74' HUP INT TERM
        [ "$(id -u)" = 0 ] || fail root_required
        parent=$ROOT
        while [ "$parent" != / ]; do
          [ ! -L "$parent" ] || bad symlink_parent
          parent=${parent%/*}; [ -n "$parent" ] || parent=/
        done
        [ -d "$STORAGE" ] || fail storage_unavailable
        meta=$(stat -c '%u:%g:%a' "$STORAGE") || fail storage_stat
        case "$meta" in 0:0:700|0:0:750|0:0:755|0:0:711) ;; *) bad storage_permissions ;; esac
        if [ "$MODE" = CAS ]; then
          command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
          command -v flock >/dev/null 2>&1 || fail flock_unavailable
        fi
        for dir in "$APP" "$V2" "$ROOT"; do
          if [ "$MODE" = LEGACY ] && [ "$dir" = "$ROOT" ]; then break; fi
          [ ! -L "$dir" ] || bad symlink_directory
          if [ ! -e "$dir" ]; then
            if [ "$MODE" != CAS ]; then emit ABSENT; exit 0; fi
            mkdir "$dir" 2>/dev/null || [ -d "$dir" ] || fail directory_create
          fi
          [ -d "$dir" ] && [ ! -L "$dir" ] || bad invalid_directory
          [ "$(stat -c '%u:%g:%a' "$dir")" = 0:0:700 ] || bad directory_permissions
        done
        [ "$MODE" != LEGACY ] || FILE="$V2/targets.conf"
        checkfile() {
          [ ! -L "$1" ] && [ -f "$1" ] || bad invalid_file
          [ "$(stat -c '%u:%g:%a:%h' "$1")" = 0:0:600:1 ] || bad file_permissions
          size=$(stat -c '%s' "$1") || fail file_stat
          case "$size" in ''|*[!0-9]*) bad file_size ;; esac
          [ "$size" -le 1048576 ] || bad file_too_large
        }
        fingerprint() { stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$1"; }
        digest() { sum=$(sha256sum "$1") || fail digest_failed; SUM=${sum%% *}; }
        data() {
          checkfile "$FILE"
          before_meta=$(fingerprint "$FILE") || fail file_stat
          digest "$FILE"; before_hash=$SUM
          encoded=$(base64 <"$FILE" | tr -d '\n') || fail file_read
          digest "$FILE"
          [ "$before_hash" = "$SUM" ] && [ "$before_meta" = "$(fingerprint "$FILE")" ] || fail file_changed
          checkfile "$FILE"
          emit "$1|$SUM|$encoded"
        }
        if [ "$MODE" != CAS ]; then
          [ ! -L "$FILE" ] || bad symlink_file
          if [ ! -e "$FILE" ]; then emit ABSENT; exit 0; fi
          data DATA; exit 0
        fi
        LOCK="$ROOT/lock"
        [ ! -L "$LOCK" ] || bad symlink_lock
        if [ ! -e "$LOCK" ]; then (set -C; : >"$LOCK") 2>/dev/null || [ -f "$LOCK" ] || fail lock_create; fi
        checkfile "$LOCK"
        [ "$(stat -c '%s' "$LOCK")" = 0 ] || bad lock_content
        exec 9<>"$LOCK" || fail lock_open
        flock -x -n 9 9>&9 2>/dev/null || fail lock_busy
        [ ! -L "$FILE" ] || bad symlink_file
        if [ -e "$FILE" ]; then
          checkfile "$FILE"; digest "$FILE"
          [ "$EXPECTED" = "$SUM" ] || { emit CONFLICT; exit 0; }
          IFS='|' read -r magic revision count <"$FILE" || bad document_header
          [ "$magic" = LSAT1 ] && [ "$revision" = "$REVISION" ] || { emit CONFLICT; exit 0; }
        else
          [ "$EXPECTED" = ABSENT ] && [ "$REVISION" = 0 ] || { emit CONFLICT; exit 0; }
        fi
        TMP=$(mktemp "$ROOT/.write.XXXXXXXX") || fail temp_create
        # Java has bounded stdin. head also prevents an unexpected writer filling storage.
        head -c 1048577 >"$TMP" || fail temp_write
        checkfile "$TMP"
        digest "$TMP"; [ "$SUM" = "$PROPOSED" ] || fail proposed_digest
        fsync "$TMP" || fail temp_sync
        # From rename onward failure/timeout cannot certify that the old document remains.
        PHASE=UNKNOWN
        mv -f "$TMP" "$FILE" || fail rename_failed
        TMP=''
        fsync "$FILE" "$ROOT" "$V2" "$APP" "$STORAGE" || fail durable_sync
        checkfile "$FILE"; digest "$FILE"; [ "$SUM" = "$PROPOSED" ] || fail final_digest
        data APPLIED
        """;
}
