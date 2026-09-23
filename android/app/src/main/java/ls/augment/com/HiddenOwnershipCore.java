package ls.augment.com;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

/**
 * Ownership primitive; its presence alone never enables native recovery.
 *
 * Every entry is serialized by the actual PMS package-state write monitor. An
 * adapter must prove that external request admission, live-map/state invalidation
 * and the native commit are observed in this order, and must retain the existing
 * user-instance lifecycle lease. This class does not establish those facts,
 * install hooks, parse historical claims, or authorize a Binder caller.
 *
 * Commit is ONLY the native three-argument commitPackageStateMutation call. The
 * whole IPM hidden API, AMS calls and its notifications must remain outside this
 * monitor. A Rejection must unwind the IPM call, not become a successful no-op:
 * the pinned OEM ignores the native commit Result and would still send notices.
 */
final class HiddenOwnershipCore {
    enum Status { OWNED, INVALIDATED, RESTORED, UNKNOWN }

    static final class Target {
        final int userId;
        final long serial;
        final String packageName;
        Target(int userId, long serial, String packageName) {
            HideTargetCodec.Entry entry = new HideTargetCodec.Entry(userId, serial, packageName, true);
            if (!entry.isBound() || serial > Integer.MAX_VALUE)
                throw new IllegalArgumentException("Bound current user and ordinary package required");
            this.userId = userId;
            this.serial = serial;
            this.packageName = packageName;
        }
        String slot() { return userId + ":" + packageName; }
        boolean same(Target other) {
            return other != null && userId == other.userId && serial == other.serial
                    && packageName.equals(other.packageName);
        }
    }

    /** Actual live references, never a Computer/snapshot copy. */
    static final class Live {
        final Object user, pkg, state, parsed;
        final int appId;
        final long firstInstallTime, ceInode, deInode;
        final boolean installed, system, hidden;
        Live(Object user, Object pkg, Object state, Object parsed, int appId, long firstInstallTime,
             long ceInode, long deInode, boolean installed, boolean system, boolean hidden) {
            this.user = Objects.requireNonNull(user);
            this.pkg = Objects.requireNonNull(pkg);
            this.state = Objects.requireNonNull(state);
            this.parsed = Objects.requireNonNull(parsed);
            this.appId = appId;
            this.firstInstallTime = firstInstallTime;
            this.ceInode = ceInode;
            this.deInode = deInode;
            this.installed = installed;
            this.system = system;
            this.hidden = hidden;
        }
        boolean ordinaryInstalled() { return installed && !system && appId >= 10000; }
        boolean sameInstance(Live other) {
            return other != null && user == other.user && pkg == other.pkg && state == other.state && parsed == other.parsed
                    && appId == other.appId && firstInstallTime == other.firstInstallTime
                    && ceInode == other.ceInode && deInode == other.deInode;
        }
        boolean refersTo(Object object) { return object == user || object == pkg || object == state || object == parsed; }
    }

    @FunctionalInterface interface Probe { Live read() throws Throwable; }
    @FunctionalInterface interface Commit { Object call() throws Throwable; }

    static final class HideReceipt {
        final Object nativeResult;
        final String token; // Null is deliberately NOT ownership, even if hidden is now true.
        HideReceipt(Object nativeResult, String token) {
            this.nativeResult = nativeResult;
            this.token = token;
        }
    }

    interface ExternalScope extends AutoCloseable {
        boolean tracked();
        @Override void close();
    }

    /** The adapter keeps its single ordinary original call outside bookkeeping catches. */
    final class OrdinaryStateWrite implements AutoCloseable {
        private final Object state;
        private final Frame nestedFrame;
        private boolean closed;
        private OrdinaryStateWrite(Object state, Frame nestedFrame) {
            this.state = state; this.nestedFrame = nestedFrame;
        }
        @Override public void close() {
            requireMonitor();
            if (closed) return;
            if (ordinaryDepth <= 0 || nestedFrame != null && nestedFrame.externalDepth <= 0) {
                revoke();
                throw new IllegalStateException("Ordinary state write accounting corrupted");
            }
            closed = true;
            invalidateState(state);
            ordinaryDepth--;
            if (nestedFrame != null) nestedFrame.externalDepth--;
        }
    }

    final class ExternalRequest implements ExternalScope {
        private final Slot slot;
        private final Frame nestedFrame;
        private final boolean tracked;
        private boolean closed;
        private ExternalRequest(Slot slot, boolean tracked) {
            this.slot = slot; this.tracked = tracked; nestedFrame = frame;
            if (nestedFrame != null) {
                // Only the ordinary-IPM adapter may enter this structured scope.
                // A nested ordinary call is not the Root consumer's own setter.
                nestedFrame.externalDepth++;
                nestedFrame.unexpected = true;
                invalidate(nestedFrame.slot);
            }
        }
        @Override public boolean tracked() { return tracked; }
        @Override public void close() {
            requireMonitor();
            if (closed) return;
            closed = true;
            if (slot.requests <= 0) throw new IllegalStateException("Request accounting corrupted");
            invalidate(slot);
            slot.requests--;
            if (nestedFrame != null) {
                if (nestedFrame.externalDepth <= 0) throw new IllegalStateException("Nested request accounting corrupted");
                nestedFrame.externalDepth--;
            }
            releaseUnused(slot);
        }
    }

    /** One ordinary package copy covers every current and future user slot. */
    final class ExternalPackageRequest implements ExternalScope {
        private final PackageRequests requests;
        private final Frame nestedFrame;
        private final boolean tracked;
        private boolean closed;
        private ExternalPackageRequest(PackageRequests requests, boolean tracked) {
            this.requests = requests; this.tracked = tracked; nestedFrame = frame;
            if (nestedFrame != null) {
                nestedFrame.externalDepth++;
                nestedFrame.unexpected = true;
                invalidate(nestedFrame.slot);
            }
        }
        @Override public boolean tracked() { return tracked; }
        @Override public void close() {
            requireMonitor();
            if (closed) return;
            closed = true;
            if (requests.count <= 0) throw new IllegalStateException("Package request accounting corrupted");
            invalidatePackage(requests.packageName);
            requests.count--;
            if (nestedFrame != null) {
                if (nestedFrame.externalDepth <= 0) throw new IllegalStateException("Nested request accounting corrupted");
                nestedFrame.externalDepth--;
            }
            if (requests.count == 0) packageRequests.remove(requests.packageName, requests);
            releaseUnusedPackage(requests.packageName);
        }
    }

    final class RestoreAttempt {
        private final HiddenOwnershipCore owner = HiddenOwnershipCore.this;
        private final Target target;
        private final String token;
        private boolean used;
        private Rejection rejection;
        private Claim claim;
        private long revision;
        private boolean enteredOriginal, commitCompleted, abandoned, verifying;
        private RestoreAttempt(Target target, String token) {
            this.target = Objects.requireNonNull(target);
            this.token = token;
        }
        /** Only this exact pre-consumer rejection is safe to classify as no write. */
        boolean rejectedBeforeCommit(Throwable error) {
            requireMonitor();
            return rejection != null && rejection == error;
        }
    }

    /** A finite resource reservation, never a claim, receipt or restore capability. */
    final class HidePreparation {
        private final HiddenOwnershipCore owner = HiddenOwnershipCore.this;
        private final Target target;
        private final Slot slot;
        private Live live;
        private boolean resourceHeld = true, invalidated, validating, used, closed;
        private Frame commitFrame;
        private HidePreparation(Target target, Slot slot) { this.target = target; this.slot = slot; }
    }

    static final class Rejection extends RuntimeException {
        private Rejection(String reason) { super(reason); }
    }

    private static final class Slot {
        final String key, packageName;
        long revision;
        int requests;
        Claim claim;
        Frame pending;
        HidePreparation preparation;
        Slot(String key, String packageName) { this.key = key; this.packageName = packageName; }
    }
    private static final class PackageRequests {
        final String packageName;
        int count;
        PackageRequests(String packageName) { this.packageName = packageName; }
    }
    private static final class Claim {
        final Target target;
        final Live live;
        final long revision;
        final Slot slot;
        final String token;
        Status status = Status.OWNED;
        Claim(Target target, Live live, Slot slot, String token) {
            this.target = target; this.live = live; this.slot = slot;
            revision = slot.revision; this.token = token;
        }
    }
    private static final class Frame {
        final Target target;
        final Slot slot;
        final Live before;
        final boolean restore;
        final long revision;
        int writes, completedWrites, stateSignals, setterPackageSignals, packageSignals, externalDepth;
        boolean inSetter, unexpected;
        Frame(Target target, Slot slot, Live before, boolean restore) {
            this.target = target; this.slot = slot; this.before = before; this.restore = restore;
            revision = slot.revision;
        }
    }

    private final Object writeMonitor;
    private final int capacity;
    private final Map<String, Slot> slots = new HashMap<>();
    private final Map<String, Claim> claims = new HashMap<>();
    private final Map<String, PackageRequests> packageRequests = new HashMap<>();
    private boolean current = true;
    private Frame frame; // Native write monitor is held for the entire frame.
    private int ordinaryDepth;
    private int reservedClaims;
    private Object ingressOwner;

    HiddenOwnershipCore(Object actualWriteMonitor, int capacity) {
        writeMonitor = Objects.requireNonNull(actualWriteMonitor);
        if (capacity < 1 || capacity > 8192) throw new IllegalArgumentException("Capacity");
        this.capacity = capacity;
    }

    /** One fresh core belongs to one request ledger and exactly its PMS monitor. */
    void bindIngress(Object actualMonitor, Object owner) {
        requireMonitor();
        if (actualMonitor != writeMonitor || owner == null || ingressOwner != null
                || !current || frame != null || ordinaryDepth != 0
                || reservedClaims != 0 || !slots.isEmpty() || !claims.isEmpty() || !packageRequests.isEmpty())
            throw new IllegalStateException("Core ingress binding is not fresh and exact");
        ingressOwner = owner;
    }

    /**
     * Ordinary IPM entry, INCLUDING same-value requests, before its native snapshot.
     * Acquire the PMS monitor just for this admission, then release it before the
     * ordinary IPM body. Its matching close must also use the same monitor.
     * The actual Root frame must be identified privately by the enclosing adapter;
     * UID=0, a nonce string or an app-supplied owner is not an exemption.
     */
    ExternalRequest externalRequest(int userId, String packageName) {
        requireMonitor();
        String key = userId + ":" + packageName;
        Slot slot = slots.get(key);
        boolean tracked = true;
        if (slot == null) {
            if (!hasCapacity()) {
                revoke(); // Cannot lose an in-flight request and later mint an owner.
                tracked = false;
            }
            slot = new Slot(key, packageName);
            if (tracked) slots.put(key, slot);
        }
        invalidatePreparation(slot);
        invalidate(slot);
        if (slot.requests == Integer.MAX_VALUE) {
            revoke();
            slot = new Slot(key, packageName);
            tracked = false;
        }
        slot.requests++;
        // A detached handle carries ordinary-call scope only. Overflow has
        // already revoked the epoch; this handle cannot authorize a new hide.
        return new ExternalRequest(slot, tracked);
    }

    /** The scope spans the ordinary native body; only admission/close hold PMS. */
    ExternalPackageRequest externalPackageRequest(String packageName) {
        requireMonitor();
        try {
            requirePackageName(packageName);
            PackageRequests requests = packageRequests.get(packageName);
            boolean tracked = true;
            if (requests == null) {
                if (!hasCapacity()) { revoke(); tracked = false; }
                requests = new PackageRequests(packageName);
                if (tracked) packageRequests.put(packageName, requests);
            }
            invalidatePackage(packageName);
            if (requests.count == Integer.MAX_VALUE) {
                revoke(); requests = new PackageRequests(packageName); tracked = false;
            }
            requests.count++;
            return new ExternalPackageRequest(requests, tracked);
        } catch (RuntimeException | Error error) { revoke(); throw error; }
    }

    static void requirePackageName(String packageName) {
        // Native names include "android". Keep exact raw identity, without the
        // ordinary hidden-target selector's requirement for a dotted name.
        if (packageName == null || packageName.isEmpty() || packageName.length() > 255)
            throw new IllegalArgumentException("Bounded native package name required");
    }

    private boolean hasCapacity() { return slots.size() + packageRequests.size() < capacity; }
    private boolean hasRequests(Slot slot) {
        PackageRequests requests = packageRequests.get(slot.packageName);
        return slot.requests != 0 || requests != null && requests.count != 0;
    }
    private void invalidatePackage(String packageName) {
        for (Slot slot : slots.values()) if (packageName.equals(slot.packageName)) {
            invalidatePreparation(slot);
            invalidate(slot);
        }
    }

    /** Live object/state replacement or non-owned mutation, observed under PMS. */
    void objectChanged(Object object) {
        requireMonitor();
        if (object == null) { revoke(); return; }
        // Identify a finite expected signal ONCE, before walking claims. The
        // parent package object is shared by its users: a known B hidden-bit
        // notification must not revoke A merely because both have that parent.
        if (frame != null && frame.externalDepth == 0 && frame.inSetter) {
            if (object == frame.before.state && ++frame.stateSignals == 1) return;
            if (object == frame.before.pkg && ++frame.setterPackageSignals == 1) return;
        } else if (frame != null && frame.externalDepth == 0 && frame.completedWrites == 1 && object == frame.before.pkg
                && ++frame.packageSignals == 1) return;
        for (Slot slot : slots.values()) {
            Frame pending = slot.pending;
            boolean touchesPending = pending != null && pending.before.refersTo(object);
            if (touchesPending || slot.claim != null && slot.claim.live.refersTo(object)) invalidate(slot);
        }
    }

    /** A removed/replaced live map key must invalidate even if the same object is put back. */
    void packageMappingChanged(String packageName) {
        requireMonitor();
        for (Slot slot : slots.values()) {
            Target target = slot.pending != null ? slot.pending.target : slot.claim != null ? slot.claim.target : null;
            if (target != null && target.packageName.equals(packageName)
                    || slot.preparation != null && slot.packageName.equals(packageName)) {
                invalidatePreparation(slot);
                invalidate(slot);
            }
        }
    }

    void liveMapCleared() {
        requireMonitor();
        for (Slot slot : slots.values()) { invalidatePreparation(slot); invalidate(slot); }
    }

    /**
     * Explicit ordinary final-setter admission, even inside an owned frame. No
     * user/package identity is invented and no original is called here. An
     * unlocked native callback must retire its adapter atomically instead of
     * acquiring PMS just to call this method. Close in the original's finally.
     */
    OrdinaryStateWrite beginOrdinaryStateWrite(Object actualState) {
        requireMonitor();
        Objects.requireNonNull(actualState);
        Frame own = frame;
        // Allocate before changing depth, so a failed allocation cannot leak it.
        OrdinaryStateWrite scope = new OrdinaryStateWrite(actualState, own);
        if (ordinaryDepth == Integer.MAX_VALUE || own != null && own.externalDepth == Integer.MAX_VALUE) {
            revoke();
            throw new IllegalStateException("Ordinary state write depth exhausted");
        }
        ordinaryDepth++;
        if (own != null) {
            own.externalDepth++;
            own.unexpected = true;
            invalidate(own.slot);
        }
        invalidateState(actualState);
        return scope;
    }

    private void invalidateState(Object state) {
        // Do not use objectChanged: it may consume an expected owned notification.
        for (Slot slot : slots.values()) {
            HidePreparation preparation = slot.preparation;
            // Its initial probe may reenter before Live is available. Any ordinary
            // hidden leaf in that narrow interval cancels the resource attempt.
            if (preparation != null && (preparation.live == null || preparation.live.state == state))
                invalidatePreparation(slot);
            if (slot.pending != null && slot.pending.before.state == state
                    || slot.claim != null && slot.claim.live.state == state) invalidate(slot);
        }
    }

    /**
     * Actual setHidden interception, not an observation of its final value.
     * Ordinary invocations still call the original exactly once, including when
     * their value is unchanged. Missing/extra/reentrant setter calls cannot mint.
     */
    Object hiddenWrite(Object state, boolean value, Commit original) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(original);
        Frame own = frame;
        if (own == null || own.externalDepth != 0) {
            objectChanged(state);
            try { return original.call(); }
            finally { objectChanged(state); }
        }
        // The native commit body can reenter Java while PMS's monitor is held.
        // Authorization at commit entry alone is insufficient: revoke before
        // this exact setter => no owned write, even if an inner exception was caught.
        if (!current || own.unexpected || own.slot.revision != own.revision || hasRequests(own.slot)
                || own.slot.pending != own || state != own.before.state || value == own.restore
                || own.inSetter || own.writes != 0) {
            own.unexpected = true;
            // The native commit has already been entered. Do NOT mark this as
            // RestoreAttempt.rejectedBeforeCommit; the enclosing result is UNKNOWN.
            throw new IllegalStateException("Owned native setter lost its exact commit authority");
        }
        own.writes++;
        own.inSetter = true;
        try {
            Object result = original.call();
            own.completedWrites++;
            return result;
        } finally { own.inSetter = false; }
    }

    /** Called in VALIDATING before forceStop, with only a narrow PMS critical section. */
    HidePreparation prepareHide(Target target, Probe probe) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(target); Objects.requireNonNull(probe);
        if (!current || frame != null || ordinaryDepth != 0 || claims.size() + reservedClaims >= capacity)
            throw new Rejection("Hide preparation observation or claim capacity unavailable");
        Slot slot = slots.get(target.slot());
        if (slot != null && (slot.preparation != null || hasRequests(slot)))
            throw new Rejection("Hide preparation target already active");
        if (slot == null) {
            // Normal reservation exhaustion rejects only this attempt. No ordinary
            // request was lost, so existing claims remain usable.
            if (!hasCapacity()) throw new Rejection("Hide preparation slot capacity unavailable");
            slot = new Slot(target.slot(), target.packageName);
            slots.put(slot.key, slot);
        }
        HidePreparation preparation = new HidePreparation(target, slot);
        slot.preparation = preparation;
        reservedClaims++;
        try {
            preparation.validating = true;
            Live live = probe.read();
            if (!preparationCurrent(preparation, target) || live == null || !live.ordinaryInstalled() || live.hidden)
                throw new Rejection("Hide preparation live target unavailable");
            preparation.live = live;
            return preparation;
        } catch (Throwable failure) {
            releaseHidePreparation(preparation);
            throw failure;
        } finally { preparation.validating = false; }
    }

    /** Resource/live validation only; generic STOP notifications do not freeze a revision. */
    void requireHidePrepared(HidePreparation preparation, Target target, Probe probe) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(probe);
        if (preparation == null || preparation.owner != this || !preparation.target.same(target))
            throw new Rejection("Foreign hide preparation");
        if (preparation.validating) {
            preparation.invalidated = true;
            throw new Rejection("Recursive hide preparation validation");
        }
        if (preparation.used || !preparationCurrent(preparation, target))
            throw new Rejection("Hide preparation is no longer available");
        preparation.validating = true;
        try {
            Live live = probe.read();
            if (!preparationCurrent(preparation, target) || preparation.used || live == null
                    || !preparation.live.sameInstance(live) || !live.ordinaryInstalled() || live.hidden)
                throw new Rejection("Prepared hide live instance changed");
        } catch (Throwable failure) {
            preparation.invalidated = true;
            throw failure;
        } finally { preparation.validating = false; }
    }

    private boolean preparationCurrent(HidePreparation preparation, Target target) {
        return preparation.owner == this && preparation.target.same(target) && !preparation.closed
                && !preparation.invalidated && preparation.resourceHeld && current
                && frame == null && ordinaryDepth == 0 && reservedClaims > 0
                && claims.size() + reservedClaims <= capacity
                && slots.get(preparation.slot.key) == preparation.slot
                && preparation.slot.preparation == preparation && !hasRequests(preparation.slot);
    }

    /** Consumes exact reserved resources, then establishes a fresh owned revision at native commit. */
    HideReceipt hideCommit(HidePreparation preparation, Target target, Probe probe, Commit original) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(probe); Objects.requireNonNull(original);
        if (preparation == null || preparation.owner != this || !preparation.target.same(target))
            throw new Rejection("Foreign hide preparation");
        if (preparation.used || preparation.closed) throw new Rejection("Hide preparation already used or closed");
        preparation.used = true;
        Slot slot = preparation.slot;
        Frame own = null;
        try {
            if (preparation.validating || !preparationCurrent(preparation, target))
                throw new Rejection("Hide preparation unavailable before commit");
            preparation.validating = true;
            Live before;
            try { before = probe.read(); } finally { preparation.validating = false; }
            if (!preparationCurrent(preparation, target) || before == null
                    || !preparation.live.sameInstance(before) || !before.ordinaryInstalled() || before.hidden)
                throw new Rejection("Prepared hide no longer has exact visible live state");
            invalidate(slot);
            if (!current) throw new Rejection("Owned revision exhausted before native hide");
            own = new Frame(target, slot, before, false);
            preparation.commitFrame = own;
            frame = own; slot.pending = own;
            Object result = original.call();
            Live after = probe.read();
            if (!current || preparation.closed || preparation.invalidated || !preparation.resourceHeld
                    || slot.preparation != preparation || slots.get(slot.key) != slot
                    || hasRequests(slot) || slot.revision != own.revision || own.unexpected
                    || own.writes != 1 || own.completedWrites != 1 || own.stateSignals != 1
                    || own.setterPackageSignals != 1 || own.packageSignals != 1 || after == null
                    || !before.sameInstance(after) || !after.ordinaryInstalled() || !after.hidden)
                return new HideReceipt(result, null);
            if (claims.size() + reservedClaims > capacity || reservedClaims <= 0)
                throw new IllegalStateException("Prepared claim accounting corrupted");
            String token = UUID.randomUUID().toString();
            if (claims.containsKey(token)) { revoke(); return new HideReceipt(result, null); }
            Claim claim = new Claim(target, after, slot, token);
            claims.put(token, claim); slot.claim = claim;
            preparation.resourceHeld = false; reservedClaims--;
            return new HideReceipt(result, token);
        } finally {
            if (own != null && frame == own) frame = null;
            if (own != null && slot.pending == own) slot.pending = null;
            releaseHidePreparation(preparation);
        }
    }

    /** Release this reservation only; never discard a receipt or invalidate a replacement owner. */
    void releaseHidePreparation(HidePreparation preparation) {
        requireMonitor();
        if (preparation == null || preparation.owner != this || preparation.closed) return;
        preparation.closed = true;
        preparation.invalidated = true;
        if (preparation.commitFrame != null && frame == preparation.commitFrame
                && preparation.slot.pending == preparation.commitFrame)
            preparation.commitFrame.unexpected = true;
        if (preparation.resourceHeld) {
            preparation.resourceHeld = false;
            if (reservedClaims <= 0) { revoke(); throw new IllegalStateException("Hide reservation accounting corrupted"); }
            reservedClaims--;
        }
        if (preparation.slot.preparation == preparation) preparation.slot.preparation = null;
        releaseUnused(preparation.slot);
    }

    private void invalidatePreparation(Slot slot) {
        if (slot.preparation != null) slot.preparation.invalidated = true;
    }

    /** Legacy direct-Core contract. The production adapter uses the preparation overload only. */
    HideReceipt hideCommit(Target target, Probe probe, Commit original) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(target); Objects.requireNonNull(probe); Objects.requireNonNull(original);
        if (frame != null || ordinaryDepth != 0) throw new Rejection("Nested ownership commit");
        Live before = probe.read();
        if (before == null || !before.ordinaryInstalled()) throw new Rejection("Target is not live ordinary installed state");
        if (claims.size() + reservedClaims >= capacity)
            throw new Rejection("Ownership claim capacity reserved or exhausted");
        Slot slot = slotFor(target);
        if (slot == null || slot.preparation != null || frame != null || ordinaryDepth != 0 || !current
                || claims.size() + reservedClaims >= capacity || hasRequests(slot)) {
            if (slot != null) releaseUnused(slot);
            throw new Rejection("Ownership observation or capacity unavailable before hide");
        }
        // The outer native IPM normally short-circuits this state. If a stale
        // snapshot still reaches its consumer, preserve that original commit
        // without claiming an already hidden application. This is not a new
        // false-to-true write and cannot manufacture recovery authority.
        if (before.hidden) {
            invalidate(slot);
            return new HideReceipt(original.call(), null);
        }
        invalidate(slot);
        Frame own = new Frame(target, slot, before, false);
        frame = own; slot.pending = own;
        try {
            Object result = original.call();
            Live after = probe.read();
            if (!current || hasRequests(slot) || slot.revision != own.revision || own.unexpected
                    || own.writes != 1 || own.completedWrites != 1 || own.stateSignals != 1
                    || own.setterPackageSignals != 1 || own.packageSignals != 1 || after == null
                    || !before.sameInstance(after) || !after.ordinaryInstalled() || !after.hidden)
                return new HideReceipt(result, null);
            String token = UUID.randomUUID().toString();
            if (claims.containsKey(token)) { revoke(); return new HideReceipt(result, null); }
            Claim claim = new Claim(target, after, slot, token);
            claims.put(token, claim); slot.claim = claim;
            return new HideReceipt(result, token);
        } finally { frame = null; slot.pending = null; releaseUnused(slot); }
    }

    RestoreAttempt newRestore(Target target, String token) {
        requireMonitor();
        return new RestoreAttempt(target, token);
    }

    /**
     * A rejected attempt throws BEFORE original.call. The native commit caller
     * must let that exact exception escape through IPM's finally blocks. Returning
     * a false/native Result here would incorrectly execute its post-commit notices.
     */
    Object restoreCommit(RestoreAttempt attempt, Probe probe, Commit original) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(probe); Objects.requireNonNull(original);
        if (attempt == null || attempt.owner != this) throw new Rejection("Foreign restore attempt");
        if (attempt.used || attempt.abandoned) throw new Rejection("Restore attempt already used or abandoned");
        attempt.used = true;
        Claim claim = claims.get(attempt.token);
        if (frame != null || ordinaryDepth != 0 || !current || claim == null || claim.status != Status.OWNED
                || !claim.target.same(attempt.target) || claim.slot.claim != claim
                || hasRequests(claim.slot) || claim.slot.revision != claim.revision)
            throw reject(attempt, "Ownership is absent or no longer current");
        Live before = probe.read();
        // PMS's monitor is reentrant. Even an injected read that returns the same
        // references may have revoked a claim; recheck after the final probe.
        if (attempt.abandoned) throw reject(attempt, "Restore attempt abandoned before commit");
        if (frame != null || ordinaryDepth != 0 || !current || claim.status != Status.OWNED || claim.slot.claim != claim
                || hasRequests(claim.slot) || claim.slot.revision != claim.revision
                || before == null || !claim.live.sameInstance(before) || !before.ordinaryInstalled() || !before.hidden) {
            // A reentrant probe may already have installed a fresh owner. The
            // rejected old attempt has no authority over that replacement.
            if (claim.slot.claim == claim) invalidate(claim.slot);
            throw reject(attempt, "Live user/package/state no longer matches ownership");
        }
        // No retry can enter the native consumer again after this point. A thrown
        // original or failed post-read remains UNKNOWN; it is never re-armed.
        claim.status = Status.UNKNOWN;
        Frame own = new Frame(claim.target, claim.slot, before, true);
        frame = own; claim.slot.pending = own;
        attempt.claim = claim;
        attempt.revision = own.revision;
        attempt.enteredOriginal = true;
        try {
            Object result = original.call();
            Live after = probe.read();
            if (!attempt.abandoned && current && claim.slot.claim == claim
                    && claim.slot.revision == own.revision && !hasRequests(claim.slot)
                    && !own.unexpected && own.writes == 1 && own.completedWrites == 1 && own.stateSignals == 1
                    && own.setterPackageSignals == 1 && own.packageSignals == 1 && after != null
                    && before.sameInstance(after) && after.ordinaryInstalled() && !after.hidden)
                claim.status = Status.RESTORED;
            attempt.commitCompleted = true;
            return result;
        } finally { frame = null; claim.slot.pending = null; }
    }

    /**
     * Check this exact native restore only after its frame has unwound. RESTORED
     * alone is historical evidence: ordinary same-value operations still advance
     * the slot revision. The caller must also check the whole IPM result, its
     * fresh Engine frame and its observer/ingress binding before AND after this
     * probe, then abandon on any outer failure. Success here is deliberately
     * repeatable and does not prevent that final cleanup.
     */
    boolean verifyRestoredReceipt(RestoreAttempt attempt, Probe probe) throws Throwable {
        requireMonitor();
        if (attempt == null || attempt.owner != this) return false;
        if (attempt.verifying || !restoredReceiptCurrent(attempt)) {
            abandonRestore(attempt);
            return false;
        }
        attempt.verifying = true;
        try {
            Live live = Objects.requireNonNull(probe).read();
            if (!restoredReceiptCurrent(attempt) || live == null
                    || !attempt.claim.live.sameInstance(live) || !live.ordinaryInstalled() || live.hidden) {
                abandonRestore(attempt);
                return false;
            }
            return true;
        } catch (Throwable failure) {
            abandonRestore(attempt);
            throw failure;
        } finally { attempt.verifying = false; }
    }

    private boolean restoredReceiptCurrent(RestoreAttempt attempt) {
        Claim claim = attempt.claim;
        return attempt.used && attempt.enteredOriginal && attempt.commitCompleted && !attempt.abandoned
                && claim != null && claims.get(attempt.token) == claim && claim.target.same(attempt.target)
                && frame == null && ordinaryDepth == 0 && current && claim.status == Status.RESTORED
                && slots.get(claim.slot.key) == claim.slot && claim.slot.claim == claim
                && claim.revision == attempt.revision && claim.slot.revision == attempt.revision
                && !hasRequests(claim.slot);
    }

    /**
     * Retire one unconfirmed outer operation, even if its native commit succeeded.
     * An unused/rejected attempt cannot discard another attempt's OWNED claim;
     * cleanup of an older restore cannot invalidate a later slot replacement.
     * The ingress must stop calling this only after ALL outer checks succeed.
     */
    void abandonRestore(RestoreAttempt attempt) {
        requireMonitor();
        if (attempt == null || attempt.owner != this || attempt.abandoned) return;
        attempt.abandoned = true;
        Claim claim = attempt.claim;
        if (!attempt.enteredOriginal || claim == null || claims.get(attempt.token) != claim
                || !claim.target.same(attempt.target)
                || claim.status != Status.RESTORED && claim.status != Status.UNKNOWN) return;
        claim.status = Status.UNKNOWN;
        if (claim.slot.claim == claim) invalidate(claim.slot);
    }

    Status status(Target target, String token) {
        requireMonitor();
        Claim claim = claims.get(token);
        return claim != null && claim.target.same(target) ? claim.status : null;
    }

    /**
     * Recheck a retained receipt only after hideCommit has left its native frame.
     * The adapter separately checks its exact Engine completion frame and atomic
     * observer/ingress epoch before and after this call. No new token is issued.
     */
    boolean verifyReceipt(Target target, String token, Probe probe) throws Throwable {
        requireMonitor();
        Objects.requireNonNull(target); Objects.requireNonNull(probe);
        Claim claim = claims.get(token);
        if (claim == null || !claim.target.same(target)) return false;
        try {
            if (!receiptCurrent(claim)) { discardReceipt(target, token); return false; }
            Live live = probe.read();
            // A probe may reenter ordinary admission or retire this core.
            if (!receiptCurrent(claim) || live == null || !claim.live.sameInstance(live)
                    || !live.ordinaryInstalled() || !live.hidden) {
                discardReceipt(target, token);
                return false;
            }
            return true;
        } catch (Throwable failure) {
            discardReceipt(target, token);
            throw failure;
        }
    }

    private boolean receiptCurrent(Claim claim) {
        return frame == null && ordinaryDepth == 0 && current && claim.status == Status.OWNED
                && claim.slot.claim == claim && claim.slot.revision == claim.revision && !hasRequests(claim.slot);
    }

    /** Keep uncertain evidence; abandoning an old receipt must not revoke its replacement. */
    void discardReceipt(Target target, String token) {
        requireMonitor();
        Objects.requireNonNull(target);
        Claim claim = claims.get(token);
        if (claim == null || !claim.target.same(target) || claim.status != Status.OWNED) return;
        claim.status = Status.UNKNOWN;
        if (claim.slot.claim == claim) invalidate(claim.slot);
    }

    /** No new epoch can resurrect these claims. Make a distinct empty core after restart. */
    void revoke() {
        requireMonitor();
        current = false;
        for (Slot slot : slots.values()) { invalidatePreparation(slot); invalidate(slot); }
    }

    private Rejection reject(RestoreAttempt attempt, String reason) {
        Rejection rejection = new Rejection(reason);
        attempt.rejection = rejection;
        return rejection;
    }
    private Slot slotFor(Target target) {
        Slot slot = slots.get(target.slot());
        if (slot != null) return slot;
        if (!hasCapacity()) { revoke(); return null; }
        slot = new Slot(target.slot(), target.packageName); slots.put(slot.key, slot); return slot;
    }
    private void invalidate(Slot slot) {
        if (slot.revision == Long.MAX_VALUE) current = false;
        else slot.revision++;
        if (slot.claim != null && slot.claim.status == Status.OWNED) slot.claim.status = Status.INVALIDATED;
    }
    private void releaseUnused(Slot slot) {
        if (slot.requests == 0 && slot.pending == null && slot.claim == null && slot.preparation == null) slots.remove(slot.key, slot);
    }
    private void releaseUnusedPackage(String packageName) {
        Iterator<Slot> iterator = slots.values().iterator();
        while (iterator.hasNext()) {
            Slot slot = iterator.next();
            if (packageName.equals(slot.packageName) && slot.requests == 0
                    && slot.pending == null && slot.claim == null && slot.preparation == null) iterator.remove();
        }
    }
    private void requireMonitor() {
        if (!Thread.holdsLock(writeMonitor)) throw new IllegalStateException("Actual PMS write monitor required");
    }
}
