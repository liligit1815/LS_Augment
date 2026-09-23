package ls.augment.com.hook;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import ls.augment.com.HideTargetCodec;

/**
 * Provenance for Settings' exact ApplicationInfo objects. A serial read after a
 * list was obtained can verify its pre-observation, but cannot supply a missing
 * pre-observation. This class does no Android calls and holds no owner/info strongly.
 */
final class SettingsEntryBindings {
    static final long VALID_FOR_MS = 10_000L;
    static final int MAX_RECORDS = 8192;

    private final Object lock = new Object();
    private final int limit;
    private final ReferenceQueue<Object> ownerQueue = new ReferenceQueue<>();
    private final ReferenceQueue<Object> infoQueue = new ReferenceQueue<>();
    private final Map<IdentityRef, OwnerState> owners = new HashMap<>();
    // Invalid records remain here until their info is collected: never rebind a seen ref.
    private final Map<IdentityRef, Record> seen = new HashMap<>();
    private final Map<Integer, UserState> users = new HashMap<>();
    private final WeakHashMap<Observation, Boolean> observations = new WeakHashMap<>();
    private boolean exhausted;

    SettingsEntryBindings() { this(MAX_RECORDS); }

    SettingsEntryBindings(int limit) {
        if (limit < 1 || limit > MAX_RECORDS) throw new IllegalArgumentException("limit");
        this.limit = limit;
    }

    /** Values are copied before the package query; neither UserInfo nor its owner is retained. */
    static final class Observation {
        final int userId;
        final long serial;
        final long ownerEpoch;
        final long userEpoch;
        private final SettingsEntryBindings source;
        private final OwnerState owner;
        private final UserState user;

        private Observation(SettingsEntryBindings source, OwnerState owner, UserState user,
                int userId, long serial) {
            this.source = source;
            this.owner = owner;
            this.user = user;
            this.userId = userId;
            this.serial = serial;
            ownerEpoch = owner.epoch;
            userEpoch = user.epoch;
        }
    }

    /** A temporary input value; only capture's local snapshot retains info strongly. */
    static final class Item {
        final Object info;
        final int userId;
        final String packageName;

        Item(Object info, int userId, String packageName) {
            this.info = info;
            this.userId = userId;
            this.packageName = packageName;
        }
    }

    /** One-use worker ticket for one exact record, never for records added later. */
    static final class Check {
        final int userId;
        private final SettingsEntryBindings source;
        private final Record record;

        private Check(SettingsEntryBindings source, Record record) {
            this.source = source;
            this.record = record;
            userId = record.before.userId;
        }
    }

    Observation observe(Object owner, int userId, long serial) {
        if (owner == null || !validUser(userId) || !validSerial(serial)) return null;
        synchronized (lock) {
            drain();
            OwnerState state = owner(owner, true);
            UserState user = user(userId, true);
            if (exhausted || state == null || state.blocked || user == null
                    || serial <= user.retiredThrough) return null;
            if (observations.size() >= limit) {
                block(state);
                return null;
            }
            user.maxObservedSerial = Math.max(user.maxObservedSerial, serial);
            Observation result = new Observation(this, state, user, userId, serial);
            observations.put(result, Boolean.TRUE);
            return result;
        }
    }

    long generation(Object owner) {
        if (owner == null) return -1;
        synchronized (lock) {
            drain();
            OwnerState state = owner(owner, true);
            return exhausted || state == null || state.blocked ? -1 : state.epoch;
        }
    }

    void invalidateOwner(Object owner) {
        if (owner == null) return;
        synchronized (lock) {
            drain();
            OwnerState state = owner(owner, true);
            if (state != null) invalidate(state);
        }
    }

    /** Serial numbers are monotonic Android user-instance identifiers, including user 0. */
    void retireUser(int userId) {
        if (!validUser(userId)) return;
        synchronized (lock) {
            drain();
            UserState user = user(userId, true);
            if (user == null) return;
            user.epoch++;
            user.retiredThrough = Math.max(user.retiredThrough, user.maxObservedSerial);
            for (Record record : seen.values()) {
                if (record.before != null && record.before.user == user) invalidate(record);
            }
        }
    }

    /**
     * Consumes before once. The caller must pass the raw return objects, before
     * publishing them to entries. A later capture of a seen ref revokes it, even
     * if its fields and serial happen to be equal; duplicate rows within this call deduplicate.
     */
    boolean capture(Observation before, List<Item> items, long now) {
        final List<Item> copy;
        try {
            // A caller-supplied collection may run code. Never invoke it under our lock.
            copy = items == null ? Collections.emptyList() : new ArrayList<>(items);
        } catch (RuntimeException unavailable) {
            synchronized (lock) {
                if (before != null && before.source == this) invalidate(before.owner);
            }
            return false;
        }
        synchronized (lock) {
            drain();
            boolean fresh = before != null && before.source == this
                    && observations.remove(before) != null && current(before) && now >= 0;
            IdentityHashMap<Object, Item> unique = new IdentityHashMap<>();
            IdentityHashMap<Object, Boolean> conflicting = new IdentityHashMap<>();
            for (Item item : copy) {
                if (item == null || item.info == null) continue;
                Item prior = unique.put(item.info, item);
                if (prior != null && (prior.userId != item.userId
                        || !sameString(prior.packageName, item.packageName))) {
                    conflicting.put(item.info, Boolean.TRUE);
                }
            }
            int additional = 0;
            for (Object info : unique.keySet()) {
                if (!seen.containsKey(new IdentityRef(info))) additional++;
            }
            if (additional > limit - seen.size()) {
                // Keep every old tombstone. This owner may not resume and bless untracked refs.
                if (before != null && before.source == this) block(before.owner);
                else exhaust();
                return false;
            }
            boolean accepted = false;
            for (Item item : unique.values()) {
                IdentityRef lookup = new IdentityRef(item.info);
                Record old = seen.get(lookup);
                if (old != null) {
                    invalidate(old);
                    continue;
                }
                boolean eligible = fresh && item.userId == before.userId
                        && validPackage(item.userId, item.packageName)
                        && !conflicting.containsKey(item.info);
                IdentityRef key = new IdentityRef(item.info, infoQueue);
                seen.put(key, new Record(key, eligible ? before : null,
                        eligible ? item.packageName : null, now));
                accepted |= eligible;
            }
            return accepted;
        }
    }

    /** An observed ref must not become eligible again merely by being discarded. */
    void discard(Object info) {
        if (info == null) return;
        synchronized (lock) {
            drain();
            Record record = seen.get(new IdentityRef(info));
            if (record != null) invalidate(record);
        }
    }

    List<Check> checks() {
        synchronized (lock) {
            drain();
            List<Check> result = new ArrayList<>();
            if (!exhausted) {
                for (Record record : seen.values()) {
                    if (!current(record)) continue;
                    Check check = new Check(this, record);
                    record.check = check;
                    result.add(check);
                }
            }
            return Collections.unmodifiableList(result);
        }
    }

    /** Returns whether usable authorization changed, not whether a command/check ran. */
    boolean complete(Check check, long actualSerial, long now) {
        if (check == null || check.source != this) return false;
        synchronized (lock) {
            drain();
            Record record = check.record;
            if (record.check != check || !current(record)) return false;
            record.check = null; // A replay cannot revive or extend this result.
            boolean hadAuthorization = authorized(record, now);
            boolean monotonic = now >= record.capturedAt
                    && (!record.hasCompleted || now >= record.lastCompletedAt);
            record.verified = monotonic && validSerial(actualSerial)
                    && actualSerial == record.before.serial;
            if (monotonic) {
                record.hasCompleted = true;
                record.lastCompletedAt = now;
            }
            return hadAuthorization != authorized(record, now);
        }
    }

    boolean matches(Object owner, Object exactInfo, int userId, String pkg,
            Set<HideTargetCodec.Entry> authorized, long now) {
        if (owner == null || exactInfo == null || authorized == null
                || !validUser(userId) || pkg == null) return false;
        final Record record;
        final long serial;
        synchronized (lock) {
            drain();
            record = seen.get(new IdentityRef(exactInfo));
            if (record == null || !current(record) || !authorized(record, now)
                    || record.before.owner.key.get() != owner
                    || record.before.userId != userId || !pkg.equals(record.packageName)) {
                return false;
            }
            // The captured package was already codec-validated. No per-row regex or set scan.
            serial = record.before.serial;
        }
        // The production selection is an immutable hash set. Even a custom collection's
        // contains/Entry callbacks must run outside our lock; recheck after it returns.
        try {
            if (!authorized.contains(new HideTargetCodec.Entry(userId, serial, pkg, true)))
                return false;
        } catch (RuntimeException unavailable) {
            return false;
        }
        synchronized (lock) {
            drain();
            return seen.get(new IdentityRef(exactInfo)) == record && current(record)
                    && authorized(record, now) && record.before.owner.key.get() == owner;
        }
    }

    private boolean current(Observation before) {
        return !exhausted && !before.owner.blocked && before.owner.key.get() != null
                && before.owner.epoch == before.ownerEpoch
                && before.user.epoch == before.userEpoch
                && before.serial > before.user.retiredThrough;
    }

    private boolean current(Record record) {
        return record.before != null && !record.invalid && record.key.get() != null
                && seen.get(record.key) == record && current(record.before);
    }

    private boolean authorized(Record record, long now) {
        return record.verified && now >= record.lastCompletedAt
                && now - record.lastCompletedAt < VALID_FOR_MS;
    }

    private OwnerState owner(Object owner, boolean create) {
        OwnerState state = owners.get(new IdentityRef(owner));
        if (state == null && create && !exhausted) {
            if (owners.size() >= limit) { exhaust(); return null; }
            IdentityRef key = new IdentityRef(owner, ownerQueue);
            state = new OwnerState(key);
            owners.put(key, state);
        }
        return state;
    }

    private UserState user(int userId, boolean create) {
        UserState state = users.get(userId);
        if (state == null && create && !exhausted) {
            if (users.size() >= limit) { exhaust(); return null; }
            state = new UserState();
            users.put(userId, state);
        }
        return state;
    }

    private void invalidate(OwnerState owner) {
        owner.epoch++;
        for (Record record : seen.values()) {
            if (record.before != null && record.before.owner == owner) invalidate(record);
        }
        observations.keySet().removeIf(before -> before.owner == owner);
    }

    private void invalidate(Record record) {
        record.invalid = true;
        record.verified = false;
        record.check = null;
    }

    private void block(OwnerState owner) {
        invalidate(owner);
        owner.blocked = true;
    }

    private void exhaust() {
        exhausted = true;
        for (Record record : seen.values()) invalidate(record);
        for (OwnerState owner : owners.values()) {
            owner.epoch++;
            owner.blocked = true;
        }
        observations.clear();
    }

    private void drain() {
        IdentityRef ref;
        while ((ref = (IdentityRef) infoQueue.poll()) != null) seen.remove(ref);
        while ((ref = (IdentityRef) ownerQueue.poll()) != null) {
            OwnerState removed = owners.remove(ref);
            if (removed != null) invalidate(removed);
        }
    }

    private static boolean validUser(int userId) { return userId >= 0 && userId <= 99999; }
    private static boolean validSerial(long serial) {
        return serial >= 0 && serial <= Integer.MAX_VALUE;
    }
    private static boolean validPackage(int userId, String pkg) {
        return new HideTargetCodec.Entry(userId, -1, pkg, false).isValid();
    }
    private static boolean sameString(String first, String second) {
        return first == null ? second == null : first.equals(second);
    }

    private static final class IdentityRef extends WeakReference<Object> {
        private final int hash;
        IdentityRef(Object value) { super(value); hash = System.identityHashCode(value); }
        IdentityRef(Object value, ReferenceQueue<Object> queue) {
            super(value, queue); hash = System.identityHashCode(value);
        }
        @Override public int hashCode() { return hash; }
        @Override public boolean equals(Object other) {
            if (this == other) return true;
            if (!(other instanceof IdentityRef)) return false;
            Object value = get();
            return value != null && value == ((IdentityRef) other).get();
        }
    }

    private static final class OwnerState {
        final IdentityRef key;
        long epoch;
        boolean blocked;
        OwnerState(IdentityRef key) { this.key = key; }
    }

    private static final class UserState {
        long epoch;
        long maxObservedSerial = -1;
        long retiredThrough = -1;
    }

    private static final class Record {
        final IdentityRef key;
        final Observation before;
        final String packageName;
        final long capturedAt;
        boolean invalid;
        boolean verified;
        boolean hasCompleted;
        long lastCompletedAt;
        Check check;
        Record(IdentityRef key, Observation before, String packageName, long capturedAt) {
            this.key = key;
            this.before = before;
            this.packageName = packageName;
            this.capturedAt = capturedAt;
        }
    }
}
