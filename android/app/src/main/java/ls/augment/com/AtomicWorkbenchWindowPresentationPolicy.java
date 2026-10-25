package ls.augment.com;

import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/** UI-thread presentation bookkeeping only. It cannot authorize any task or display operation. */
public final class AtomicWorkbenchWindowPresentationPolicy {
    public enum Offer { NEW, DUPLICATE, REJECTED }
    public enum Consumption { NONE, UNCHANGED, CHANGED, EXPIRED }

    public static final class EntryKey {
        public final int userId, build;
        public final long resetGeneration, revision, triggered;
        public final String checksum;
        public EntryKey(int userId, long resetGeneration, int build, long revision, String checksum, long triggered) {
            if (userId < 0 || resetGeneration < 0 || build < 1 || revision < 1 || triggered < 0
                    || checksum == null || !checksum.matches("[0-9a-f]{64}")) throw new IllegalArgumentException("entry identity");
            this.userId = userId; this.resetGeneration = resetGeneration; this.build = build;
            this.revision = revision; this.checksum = checksum; this.triggered = triggered;
        }
        @Override public boolean equals(Object value) {
            if (!(value instanceof EntryKey)) return false;
            EntryKey other = (EntryKey) value;
            return userId == other.userId && resetGeneration == other.resetGeneration && build == other.build
                    && revision == other.revision && triggered == other.triggered && checksum.equals(other.checksum);
        }
        @Override public int hashCode() { return Objects.hash(userId, resetGeneration, build, revision, checksum, triggered); }
    }

    public static final class Roles {
        /** Compatibility alias: this is the active input main, not the only main role. */
        public final int mainId;
        private final AtomicWorkbenchPoolTopology topology;
        public Roles(int mainId, int[] sides) {
            this(AtomicWorkbenchPoolTopology.of(new int[]{mainId}, mainId, sides, new int[0]));
        }
        public Roles(AtomicWorkbenchPoolTopology topology) {
            this.topology = Objects.requireNonNull(topology); mainId = topology.activeMainId;
        }
        public AtomicWorkbenchPoolTopology topology() { return topology; }
        public int[] sideIds() { return array(topology.sideIds()); }
        public int[] mainIds() { return array(topology.mainIdsOuterToRail()); }
        public boolean dual() { return topology.dual(); }
        public boolean isSide(int id) { return topology.sideIds().contains(id); }
        public boolean isMain(int id) { return topology.mainIdsOuterToRail().contains(id); }
        public boolean isOverflow(int id) { return topology.overflowOwnedIds().contains(id); }
        public Roles promoted(int target) { return promoted(target, mainId); }
        public Roles promoted(int target, int receivingMain) {
            if (isMain(target)) return new Roles(topology.activateMainProposal(target));
            if (!isMain(receivingMain)) throw new IllegalArgumentException("receiving main");
            if (isSide(target)) return new Roles(topology.sidePromotionProposal(target, receivingMain));
            return new Roles(topology.overflowPromotionProposal(target, receivingMain));
        }
        /** A launch may add only its target's resource observation while committing its roles. */
        private boolean acceptsProposal(int target, int receivingMain, Roles after) {
            if (after == null) return false;
            Roles proposed = promoted(target, receivingMain);
            if (proposed.mainId != after.mainId
                    || !proposed.topology.mainIdsOuterToRail().equals(after.topology.mainIdsOuterToRail())
                    || !proposed.topology.sideIds().equals(after.topology.sideIds())
                    || !proposed.topology.allSideIds().equals(after.topology.allSideIds())) return false;
            for (int id : topology.poolIds())
                if (proposed.topology.owned(id) != after.topology.owned(id)
                        && !(id == target && after.topology.owned(id))) return false;
            return true;
        }
        @Override public boolean equals(Object value) {
            if (!(value instanceof Roles)) return false;
            Roles other = (Roles)value;
            return mainId == other.mainId && topology.mainIdsOuterToRail().equals(other.topology.mainIdsOuterToRail())
                    && topology.sideIds().equals(other.topology.sideIds()) && topology.allSideIds().equals(other.topology.allSideIds())
                    && topology.ownedIds().equals(other.topology.ownedIds());
        }
        @Override public int hashCode() {
            return Objects.hash(mainId, topology.mainIdsOuterToRail(), topology.sideIds(), topology.allSideIds(), topology.ownedIds());
        }
        private static int[] array(java.util.List<Integer> values) {
            int[] result = new int[values.size()]; for (int i=0;i<result.length;i++) result[i]=values.get(i); return result;
        }
    }

    public static final class Lease {
        public final int windowId, displayId;
        public final String name, unique, windowSession;
        public Lease(int windowId, int displayId, String name, String unique, String windowSession) {
            if (windowId < 0 || windowId >= AtomicWorkbenchPoolTopology.POOL_SIZE || displayId < 1 || !bounded(name, 512)
                    || !bounded(unique, 1024) || !bounded(windowSession, 256)) throw new IllegalArgumentException("lease identity");
            this.windowId = windowId; this.displayId = displayId; this.name = name; this.unique = unique; this.windowSession = windowSession;
        }
        private static boolean bounded(String value, int max) { return value != null && !value.isEmpty() && value.length() <= max; }
        @Override public boolean equals(Object value) {
            if (!(value instanceof Lease)) return false;
            Lease other = (Lease) value;
            return windowId == other.windowId && displayId == other.displayId && name.equals(other.name)
                    && unique.equals(other.unique) && windowSession.equals(other.windowSession);
        }
        @Override public int hashCode() { return Objects.hash(windowId, displayId, name, unique, windowSession); }
    }

    /** Every continuation is a new immutable receipt; no callback can edit the original. */
    public static final class Receipt {
        public final long id, sessionGeneration, entryGeneration, roleGeneration;
        public final int uiEpoch, sourceMainId, targetId, receivingMainId;
        public final Roles expectedRoles;
        public final Lease lease;
        private final boolean sidePromotion, startedDual;
        private Receipt(long id, long session, int epoch, long entry, long role, int sourceMain, int target,
                Roles expected, Lease lease, boolean sidePromotion, boolean startedDual, int receivingMain) {
            this.id = id; sessionGeneration = session; uiEpoch = epoch; entryGeneration = entry; roleGeneration = role;
            sourceMainId = sourceMain; targetId = target; expectedRoles = expected; this.lease = lease; this.sidePromotion = sidePromotion; this.startedDual = startedDual; receivingMainId = receivingMain;
        }
    }

    private AtomicWorkbenchWindowLayoutPlan.RailSide railSide = AtomicWorkbenchWindowLayoutPlan.RailSide.RIGHT;
    private final Map<EntryKey, Long> seenEntries = new LinkedHashMap<>();
    private EntryKey pendingEntry;
    private AtomicWorkbenchWindowLayoutPlan.RailSide pendingSide;
    private long pendingMaxAge, latestTrigger = -1, entryGeneration, roleGeneration, receiptSequence;
    private Roles roles;
    private Receipt activeReceipt;

    public AtomicWorkbenchWindowLayoutPlan.RailSide railSide() { return railSide; }
    public long entryGeneration() { return entryGeneration; }
    public long roleGeneration() { return roleGeneration; }

    /** Call only after actual configuration/reset/user/TTL authentication in the Activity. */
    public Offer offerEntry(EntryKey key, AtomicWorkbenchWindowLayoutPlan.RailSide side, long now, long maxAge) {
        if (key == null || side == null || maxAge < 0 || maxAge > 60_000 || !fresh(key.triggered, now, maxAge)) return Offer.REJECTED;
        Iterator<Map.Entry<EntryKey, Long>> iterator = seenEntries.entrySet().iterator();
        while (iterator.hasNext()) if (iterator.next().getValue() < now) iterator.remove();
        if (seenEntries.containsKey(key)) return Offer.DUPLICATE;
        if (key.triggered < latestTrigger) return Offer.REJECTED;
        // A newly authenticated entry fences old flips immediately, even while its side waits.
        entryGeneration++; activeReceipt = null;
        if (seenEntries.size() >= 128) return Offer.REJECTED; // Never evict a still-live deduplication identity.
        latestTrigger = key.triggered;
        seenEntries.put(key, key.triggered > Long.MAX_VALUE - maxAge ? Long.MAX_VALUE : key.triggered + maxAge);
        pendingEntry = key; pendingSide = side; pendingMaxAge = maxAge;
        return Offer.NEW;
    }

    /** Configuration authentication is repeated by the caller immediately before this one-use consumption. */
    public Consumption consumeEntry(EntryKey key, long now, boolean stillAuthenticated) {
        if (pendingEntry == null || !pendingEntry.equals(key)) return Consumption.NONE;
        boolean valid = stillAuthenticated && fresh(key.triggered, now, pendingMaxAge);
        AtomicWorkbenchWindowLayoutPlan.RailSide next = pendingSide;
        pendingEntry = null; pendingSide = null;
        if (!valid) return Consumption.EXPIRED;
        if (railSide == next) return Consumption.UNCHANGED;
        railSide = next; return Consumption.CHANGED;
    }

    public void discardEntry(EntryKey key) {
        if (pendingEntry != null && pendingEntry.equals(key)) { pendingEntry = null; pendingSide = null; }
    }
    private static boolean fresh(long triggered, long now, long maxAge) { return now >= triggered && now - triggered <= maxAge; }

    public void observeRoles(Roles observed) {
        Objects.requireNonNull(observed);
        if (!observed.equals(roles)) { roles = observed; roleGeneration++; activeReceipt = null; }
    }
    /** Non-promotion boundary: close, fullscreen transition, host desktop, lost receiver, reset. */
    public void invalidate() { roleGeneration++; activeReceipt = null; }
    public void reset() { invalidate(); entryGeneration++; pendingEntry = null; pendingSide = null; roles = null; }

    /** Role-only proposal for launch/restore; it is not permission to deliver a touch. */
    public Receipt begin(int target, long session, int epoch, Roles observed, Lease lease) {
        return begin(target, observed.mainId, session, epoch, observed, lease, false);
    }
    public Receipt begin(int target, int receivingMain, long session, int epoch, Roles observed, Lease lease) {
        return begin(target, receivingMain, session, epoch, observed, lease, false);
    }
    /** A shield click must bind to an actually visible frame in the same immutable layout. */
    public Receipt beginVisible(int target, int receivingMain, long session, int epoch, Roles observed,
            Lease lease, AtomicWorkbenchCapacityLayoutPlan layout) {
        if (layout == null || !new Roles(layout.topology).equals(observed) || !layout.frameFor(target).visible)
            throw new IllegalArgumentException("hidden or stale presentation target");
        return begin(target, receivingMain, session, epoch, observed, lease, false);
    }
    /** Compatibility alias for an explicit App selection; invisible shield events remain forbidden. */
    public Receipt beginOverflow(int target, int receivingMain, long session, int epoch, Roles observed, Lease lease) {
        if (!observed.isOverflow(target)) throw new IllegalArgumentException("retained target");
        return begin(target, receivingMain, session, epoch, observed, lease, true);
    }
    private Receipt begin(int target, int receivingMain, long session, int epoch, Roles observed, Lease lease, boolean overflow) {
        if (target < 0 || target >= AtomicWorkbenchPoolTopology.POOL_SIZE || !observed.isMain(receivingMain)
                || !(observed.isMain(target) || observed.isSide(target) || observed.isOverflow(target))
                || session < 1 || epoch < 0 || lease != null && lease.windowId != target)
            throw new IllegalArgumentException("receipt scope");
        observeRoles(observed);
        activeReceipt = new Receipt(++receiptSequence, session, epoch, entryGeneration, roleGeneration,
                observed.mainId, target, observed, lease, observed.isSide(target)||observed.isOverflow(target), observed.dual(), receivingMain);
        return activeReceipt;
    }

    /** A binding / RESTORE proposal may change visual roles, but never changes direction. */
    public Receipt proposal(Receipt receipt, Roles after) {
        if (!current(receipt)) return null;
        if (!receipt.expectedRoles.acceptsProposal(receipt.targetId, receipt.receivingMainId, after)) return null;
        if (!after.equals(roles)) { roles = after; roleGeneration++; }
        activeReceipt = copy(receipt, receipt.sessionGeneration, receipt.uiEpoch, after, receipt.lease);
        return activeReceipt;
    }

    /** Carry the original pre-proposal source into a later actual focus request. */
    public Receipt continueFocus(Receipt receipt, long session, int epoch, Roles observed, Lease lease) {
        if (!current(receipt) || receipt.sessionGeneration != session || epoch < 0 || lease == null
                || !observed.equals(roles)
                || lease.windowId != receipt.targetId || receipt.lease != null && !receipt.lease.equals(lease)) return null;
        activeReceipt = copy(receipt, session, epoch, observed, lease);
        return activeReceipt;
    }

    public Receipt bindLease(Receipt receipt, Lease lease) {
        if (!current(receipt) || lease == null || lease.windowId != receipt.targetId
                || receipt.lease != null && !receipt.lease.equals(lease)) return null;
        activeReceipt = copy(receipt, receipt.sessionGeneration, receipt.uiEpoch, receipt.expectedRoles, lease);
        return activeReceipt;
    }

    /** Carry only this receipt's newly observed target owner, before its real HOME frame.
     * The original focus reply already bound the exact lease. This does not promote roles.
     */
    public Receipt observeAllocation(Receipt receipt, Roles observed, Lease actual) {
        if (!current(receipt) || observed == null || actual == null || receipt.lease == null
                || !receipt.lease.equals(actual) || actual.windowId != receipt.targetId) return null;
        Roles expected = receipt.expectedRoles;
        if (expected.mainId != observed.mainId
                || !expected.topology.mainIdsOuterToRail().equals(observed.topology.mainIdsOuterToRail())
                || !expected.topology.sideIds().equals(observed.topology.sideIds())
                || !expected.topology.allSideIds().equals(observed.topology.allSideIds())
                || expected.topology.owned(receipt.targetId) || !observed.topology.owned(receipt.targetId)) return null;
        for (int id : expected.topology.poolIds())
            if (id != receipt.targetId && expected.topology.owned(id) != observed.topology.owned(id)) return null;
        roles = observed; roleGeneration++;
        activeReceipt = copy(receipt, receipt.sessionGeneration, receipt.uiEpoch, observed, actual);
        return activeReceipt;
    }

    public boolean eligible(Receipt receipt, long session, Roles observed) {
        return current(receipt) && receipt.sessionGeneration == session && observed.equals(roles);
    }

    /** Call only after real current focus ACK (and, for HOME, the actual frame proof). */
    public boolean confirm(Receipt receipt, long session, int epoch, Roles after, Lease actual) {
        if (!current(receipt) || receipt.sessionGeneration != session || receipt.uiEpoch != epoch) return false;
        boolean accepted = receipt.lease != null && receipt.lease.equals(actual)
                && receipt.expectedRoles.acceptsProposal(receipt.targetId, receipt.receivingMainId, after);
        boolean flip = accepted && receipt.sidePromotion && !receipt.startedDual && receipt.sourceMainId != receipt.targetId;
        activeReceipt = null;
        observeRoles(after);
        if (flip) railSide = railSide == AtomicWorkbenchWindowLayoutPlan.RailSide.LEFT
                ? AtomicWorkbenchWindowLayoutPlan.RailSide.RIGHT : AtomicWorkbenchWindowLayoutPlan.RailSide.LEFT;
        return flip;
    }
    public void cancel(Receipt receipt) { if (current(receipt)) activeReceipt = null; }

    private boolean current(Receipt receipt) {
        return receipt != null && activeReceipt != null && receipt.id == activeReceipt.id
                && receipt.sessionGeneration == activeReceipt.sessionGeneration && receipt.uiEpoch == activeReceipt.uiEpoch
                && receipt.entryGeneration == entryGeneration && receipt.roleGeneration == roleGeneration
                && receipt.expectedRoles.equals(roles) && Objects.equals(receipt.lease, activeReceipt.lease);
    }
    private Receipt copy(Receipt source, long session, int epoch, Roles expected, Lease lease) {
        return new Receipt(source.id, session, epoch, entryGeneration, roleGeneration,
                source.sourceMainId, source.targetId, expected, lease, source.sidePromotion, source.startedDual, source.receivingMainId);
    }
}
