package ls.augment.com;

import java.util.IdentityHashMap;
import java.util.function.IntPredicate;
import static ls.augment.com.AtomicWorkbenchRecoveryScope.ReaderProfile;

/** Same-lane recovery mapping, independent of UI eligibility and live allocation capability. */
interface AtomicWorkbenchRecoveryOwners {
    ReaderProfile readerProfile();
    AtomicWorkbenchPlatform platform(int slot);
    boolean recovering(int slot);
    AtomicWorkbenchPlatform legacy();

    static AtomicWorkbenchRecoveryOwners low4(AtomicWorkbenchEngine engine) {
        return new AtomicWorkbenchRecoveryOwners() {
            public ReaderProfile readerProfile() { return ReaderProfile.LOW4; }
            public AtomicWorkbenchPlatform platform(int slot) { return engine.taskPlatform(slot); }
            public boolean recovering(int slot) { return engine.taskWindowRecovering(slot); }
            public AtomicWorkbenchPlatform legacy() { return null; } // Existing Engine owns legacy cleanup separately.
        };
    }

    /** Requires all eight distinct owners and the separate legacy owner, never an integer claim. */
    static AtomicWorkbenchRecoveryOwners full8(AtomicWorkbenchPlatform legacy,
            AtomicWorkbenchPlatform[] slots, IntPredicate recovering) {
        if (legacy == null || legacy.recoveryWindowId()!=-1 || legacy.recoveryReaderProfile()!=ReaderProfile.FULL8
                || slots == null || slots.length != ReaderProfile.FULL8.poolCount || recovering == null)
            throw new IllegalArgumentException("task_recovery_owners_incomplete");
        AtomicWorkbenchPlatform[] bound = slots.clone();
        IdentityHashMap<AtomicWorkbenchPlatform, Boolean> unique = new IdentityHashMap<>();
        unique.put(legacy, Boolean.TRUE);
        for(int slot=0;slot<bound.length;slot++) {
            AtomicWorkbenchPlatform owner=bound[slot];
            if(owner==null || owner.recoveryWindowId()!=slot || owner.recoveryReaderProfile()!=ReaderProfile.FULL8
                    || unique.put(owner,Boolean.TRUE)!=null)
                throw new IllegalArgumentException("task_recovery_owners_incomplete");
        }
        return new AtomicWorkbenchRecoveryOwners() {
            public ReaderProfile readerProfile() { return ReaderProfile.FULL8; }
            public AtomicWorkbenchPlatform platform(int slot) { return ReaderProfile.FULL8.contains(slot) ? bound[slot] : null; }
            public boolean recovering(int slot) { return !ReaderProfile.FULL8.contains(slot) || recovering.test(slot); }
            public AtomicWorkbenchPlatform legacy() { return legacy; }
        };
    }
}
