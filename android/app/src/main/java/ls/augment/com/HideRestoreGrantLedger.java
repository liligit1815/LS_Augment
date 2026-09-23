package ls.augment.com;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.regex.Pattern;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * Bounded, process-local restore grants. The caller supplies an Engine-qualified source identity;
 * this ledger authenticates dispatch and history, never native ownership or disk durability.
 * No caller code, including the payload's methods, is invoked while holding the private lock.
 */
final class HideRestoreGrantLedger<P> {
    static final int MAX_SOURCES = 8192;
    private static final Pattern UUID_TEXT = Pattern.compile(
            "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}");
    private static final Pattern MAC_TEXT = Pattern.compile("[0-9a-f]{64}");
    private static final Pattern PACKAGE = Pattern.compile(
            "[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");
    private static final String EXECUTE_DOMAIN = "LSA-RESTORE-EXECUTE-1";
    private static final String STATUS_DOMAIN = "LSA-RESTORE-STATUS-1";
    private static final int NONCE_ATTEMPTS = 8;

    enum State { RESERVED, RUNNING, REJECTED_BEFORE_WRITE, RESTORED, UNKNOWN, INVALID }
    enum Reason { CAPACITY, SOURCE_CONFLICT, COUNTER_EXHAUSTED, NONCE_CONFLICT, CRYPTO_UNAVAILABLE }

    static final class Rejection extends RuntimeException {
        final Reason reason;
        Rejection(Reason reason) { super(reason.name()); this.reason = reason; }
    }

    static final class Binding {
        final Object actualSource;
        final int userId;
        final long serial;
        final String packageName, sourceHideNonce;
        Binding(Object actualSource, int userId, long serial, String packageName,
                String sourceHideNonce) {
            if (actualSource == null || !validTuple(userId, serial, packageName)
                    || !uuid(sourceHideNonce)) throw new IllegalArgumentException("Invalid source");
            this.actualSource = actualSource;
            this.userId = userId;
            this.serial = serial;
            this.packageName = packageName;
            this.sourceHideNonce = sourceHideNonce;
        }
    }

    /** Strict immutable wire data; constructing it does not create an authenticated grant. */
    static final class Coordinate {
        final String epoch, sourceHideNonce, nonce, packageName, challenge;
        final long generation, serial;
        final int userId;
        Coordinate(String epoch, String sourceHideNonce, String nonce, long generation,
                int userId, long serial, String packageName, String challenge) {
            if (!uuid(epoch) || !uuid(sourceHideNonce) || !uuid(nonce) || !uuid(challenge)
                    || sourceHideNonce.equals(nonce) || generation <= 0
                    || !validTuple(userId, serial, packageName))
                throw new IllegalArgumentException("Invalid grant coordinate");
            this.epoch = epoch;
            this.sourceHideNonce = sourceHideNonce;
            this.nonce = nonce;
            this.generation = generation;
            this.userId = userId;
            this.serial = serial;
            this.packageName = packageName;
            this.challenge = challenge;
        }
        private String authenticatedText(String domain) {
            // All strings have bounded ASCII grammars excluding '|'; decimal numbers are canonical.
            return domain + "|" + epoch + "|" + sourceHideNonce + "|" + nonce + "|"
                    + generation + "|" + userId + "|" + serial + "|" + packageName + "|" + challenge;
        }
        private boolean same(Coordinate other) {
            return other != null && generation == other.generation && userId == other.userId
                    && serial == other.serial && epoch.equals(other.epoch)
                    && sourceHideNonce.equals(other.sourceHideNonce) && nonce.equals(other.nonce)
                    && packageName.equals(other.packageName) && challenge.equals(other.challenge);
        }
    }

    static final class Grant {
        final Coordinate coordinate;
        final String executeMac;
        Grant(Coordinate coordinate, String executeMac) {
            if (coordinate == null || !macText(executeMac))
                throw new IllegalArgumentException("Invalid execute credential");
            this.coordinate = coordinate;
            this.executeMac = executeMac;
        }
    }

    static final class StatusProof {
        final Coordinate coordinate;
        final String statusMac;
        StatusProof(Coordinate coordinate, String statusMac) {
            if (coordinate == null || !macText(statusMac))
                throw new IllegalArgumentException("Invalid status credential");
            this.coordinate = coordinate;
            this.statusMac = statusMac;
        }
    }

    static final class IssueResult {
        final State state;
        final Grant grant;
        final StatusProof proof;
        private IssueResult(State state, Grant grant, StatusProof proof) {
            this.state = state; this.grant = grant; this.proof = proof;
        }
    }

    static final class ClaimResult<P> {
        final State state;
        final Execution<P> execution;
        private ClaimResult(State state, Execution<P> execution) {
            this.state = state; this.execution = execution;
        }
    }

    /** The unique in-memory dispatch winner. Neither its constructor nor payload is exposed. */
    static final class Execution<P> {
        private final HideRestoreGrantLedger<P> owner;
        private final Slot<P> slot;
        private P payload;
        private State finished;
        private Execution(HideRestoreGrantLedger<P> owner, Slot<P> slot, P payload) {
            this.owner = owner; this.slot = slot; this.payload = payload;
        }
    }

    private static final class Slot<P> {
        private final Binding binding;
        private Coordinate coordinate;
        private StatusProof proof;
        private State state;
        private long rejectedThrough;
        private P payload;
        private Execution<P> execution;
        private Slot(Binding binding) { this.binding = binding; }
    }

    private final Object lock = new Object();
    private final int capacity;
    private final IdentityHashMap<Object, Slot<P>> byIdentity = new IdentityHashMap<>();
    private final Map<String, Slot<P>> bySourceNonce = new HashMap<>();
    private final byte[] key;
    private final String epoch;
    private final BigInteger nonceBase;
    private long nonceCounter;

    HideRestoreGrantLedger(int capacity) {
        if (capacity < 1 || capacity > MAX_SOURCES) throw new IllegalArgumentException("Invalid capacity");
        this.capacity = capacity;
        SecureRandom random = new SecureRandom();
        key = new byte[32];
        random.nextBytes(key);
        byte[] bytes = new byte[16];
        random.nextBytes(bytes);
        epoch = uuidText(new BigInteger(1, bytes));
        random.nextBytes(bytes);
        nonceBase = new BigInteger(1, bytes);
    }

    /** Fresh authorization only. A state-only response deliberately contains no old execute MAC. */
    IssueResult issue(Binding binding, P freshPayload, String challenge) {
        if (binding == null || freshPayload == null || !uuid(challenge))
            throw new IllegalArgumentException("Invalid fresh preparation");
        synchronized (lock) {
            Slot<P> slot = byIdentity.get(binding.actualSource);
            Slot<P> nonceSlot = bySourceNonce.get(binding.sourceHideNonce);
            if (slot != null ? !sameBinding(slot.binding, binding) || nonceSlot != slot
                    : nonceSlot != null) throw new Rejection(Reason.SOURCE_CONFLICT);
            if (slot != null && (slot.coordinate.challenge.equals(challenge)
                    || slot.state == State.RUNNING || slot.state == State.RESTORED
                    || slot.state == State.UNKNOWN))
                return new IssueResult(slot.state, null, slot.proof);
            if (slot == null && byIdentity.size() >= capacity) throw new Rejection(Reason.CAPACITY);
            long generation = slot == null ? 1 : slot.coordinate.generation + 1;
            if (generation <= 0) throw new Rejection(Reason.COUNTER_EXHAUSTED);
            String nonce = mintNonce(binding.sourceHideNonce);
            Coordinate coordinate = new Coordinate(epoch, binding.sourceHideNonce, nonce, generation,
                    binding.userId, binding.serial, binding.packageName, challenge);
            Grant grant = new Grant(coordinate, authenticate(EXECUTE_DOMAIN, coordinate));
            StatusProof proof = new StatusProof(coordinate, authenticate(STATUS_DOMAIN, coordinate));
            // Everything that can normally reject has completed before retiring the old grant.
            if (slot == null) {
                slot = new Slot<>(binding);
                byIdentity.put(binding.actualSource, slot);
                bySourceNonce.put(binding.sourceHideNonce, slot);
            } else {
                slot.rejectedThrough = slot.coordinate.generation;
            }
            slot.coordinate = coordinate;
            slot.proof = proof;
            slot.state = State.RESERVED;
            slot.payload = freshPayload;
            return new IssueResult(State.RESERVED, grant, proof);
        }
    }

    ClaimResult<P> claim(Grant grant) {
        synchronized (lock) {
            if (grant == null || !verified(EXECUTE_DOMAIN, grant.coordinate, grant.executeMac))
                return new ClaimResult<>(State.INVALID, null);
            Slot<P> slot = matchingSlot(grant.coordinate);
            State state = stateOf(slot, grant.coordinate);
            if (state != State.RESERVED) return new ClaimResult<>(state, null);
            Execution<P> execution = new Execution<>(this, slot, slot.payload);
            slot.execution = execution;
            slot.payload = null;
            slot.state = State.RUNNING;
            return new ClaimResult<>(State.RUNNING, execution);
        }
    }

    /** Retrieve, release the ledger lock, then call Engine. The ledger invokes no callback. */
    P payload(Execution<P> execution) {
        synchronized (lock) {
            return execution != null && execution.owner == this && execution.finished == null
                    && execution.slot.state == State.RUNNING && execution.slot.execution == execution
                    ? execution.payload : null;
        }
    }

    State finish(Execution<P> execution, State outcome) {
        synchronized (lock) {
            if (execution == null || execution.owner != this) return State.INVALID;
            if (execution.finished != null) return execution.finished;
            if (outcome != State.REJECTED_BEFORE_WRITE && outcome != State.RESTORED
                    && outcome != State.UNKNOWN) return State.INVALID;
            Slot<P> slot = execution.slot;
            if (slot.state != State.RUNNING || slot.execution != execution) return State.INVALID;
            slot.state = outcome;
            slot.execution = null;
            execution.payload = null;
            execution.finished = outcome;
            return outcome;
        }
    }

    State status(StatusProof proof) {
        synchronized (lock) {
            return proof != null && verified(STATUS_DOMAIN, proof.coordinate, proof.statusMac)
                    ? stateOf(matchingSlot(proof.coordinate), proof.coordinate) : State.INVALID;
        }
    }

    private Slot<P> matchingSlot(Coordinate coordinate) {
        Slot<P> slot = bySourceNonce.get(coordinate.sourceHideNonce);
        return slot != null && slot.binding.userId == coordinate.userId
                && slot.binding.serial == coordinate.serial
                && slot.binding.packageName.equals(coordinate.packageName) ? slot : null;
    }

    private State stateOf(Slot<P> slot, Coordinate coordinate) {
        if (slot == null) return State.INVALID;
        if (coordinate.generation <= slot.rejectedThrough) return State.REJECTED_BEFORE_WRITE;
        return slot.coordinate.same(coordinate) ? slot.state : State.INVALID;
    }

    private boolean verified(String domain, Coordinate coordinate, String signature) {
        if (!epoch.equals(coordinate.epoch)) return false;
        try {
            return MessageDigest.isEqual(authenticate(domain, coordinate).getBytes(StandardCharsets.US_ASCII),
                    signature.getBytes(StandardCharsets.US_ASCII));
        } catch (Rejection unavailable) { return false; }
    }

    private String authenticate(String domain, Coordinate coordinate) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(new SecretKeySpec(key, "HmacSHA256"));
            byte[] digest = mac.doFinal(coordinate.authenticatedText(domain).getBytes(StandardCharsets.US_ASCII));
            StringBuilder text = new StringBuilder(64);
            for (byte value : digest) text.append(Character.forDigit((value & 255) >>> 4, 16))
                    .append(Character.forDigit(value & 15, 16));
            return text.toString();
        } catch (GeneralSecurityException unavailable) { throw new Rejection(Reason.CRYPTO_UNAVAILABLE); }
    }

    private String mintNonce(String sourceHideNonce) {
        for (int attempt = 0; attempt < NONCE_ATTEMPTS; attempt++) {
            if (nonceCounter == Long.MAX_VALUE) throw new Rejection(Reason.COUNTER_EXHAUSTED);
            long next = nonceCounter + 1;
            BigInteger number = nonceBase.add(BigInteger.valueOf(next));
            if (number.bitLength() > 128) throw new Rejection(Reason.COUNTER_EXHAUSTED);
            // A failed issue may leave a gap; no later issue reuses it.
            nonceCounter = next;
            String candidate = uuidText(number);
            if (!candidate.equals(sourceHideNonce) && !bySourceNonce.containsKey(candidate)) return candidate;
        }
        throw new Rejection(Reason.NONCE_CONFLICT);
    }

    private static boolean sameBinding(Binding left, Binding right) {
        return left.actualSource == right.actualSource && left.userId == right.userId
                && left.serial == right.serial && left.packageName.equals(right.packageName)
                && left.sourceHideNonce.equals(right.sourceHideNonce);
    }
    private static boolean validTuple(int userId, long serial, String packageName) {
        return userId >= 0 && userId <= 99999 && serial >= 0 && serial <= Integer.MAX_VALUE
                && packageName != null && packageName.length() <= 255 && PACKAGE.matcher(packageName).matches();
    }
    private static boolean uuid(String text) { return text != null && UUID_TEXT.matcher(text).matches(); }
    private static boolean macText(String text) { return text != null && MAC_TEXT.matcher(text).matches(); }
    private static String uuidText(BigInteger number) {
        String text = number.toString(16);
        text = "00000000000000000000000000000000".substring(text.length()) + text;
        return text.substring(0, 8) + "-" + text.substring(8, 12) + "-" + text.substring(12, 16)
                + "-" + text.substring(16, 20) + "-" + text.substring(20);
    }
}
