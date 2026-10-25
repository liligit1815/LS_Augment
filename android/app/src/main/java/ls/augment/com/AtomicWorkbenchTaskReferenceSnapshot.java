package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Immutable stored-reference facts. UI flags never authorize a mutation. */
public final class AtomicWorkbenchTaskReferenceSnapshot {
    public final long revision;
    public final boolean success;
    public final String reasonCode;
    public final int totalCount,pendingCount,heldCount,forgettableCount;
    public final List<Entry> entries;
    private static final String[] KEYS={"schema","success","reason_code","revision","max_references","max_pending",
            "total_count","pending_count","held_count","forgettable_count","entries"};
    public static final class Entry {
        public final String shelfId,operationId,sourceSession,phase,disposition,leaseState,leaseId;
        public final int sourceSlot;
        public final AtomicWorkbenchTaskIdentity identity;
        public final boolean hasResponsibility,pending,forgettable,canReleaseAndForget;
        private static final String[] KEYS={"shelf_id","operation_id","identity","source_slot","source_session","phase","disposition",
                "lease_state","lease_id","has_responsibility","pending","forgettable","can_release_and_forget"};
        private Entry(Bundle b,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
            keys(b,KEYS); shelfId=string(b,"shelf_id"); operationId=string(b,"operation_id"); hex(shelfId,false); hex(operationId,false);
            identity=AtomicWorkbenchTaskIdentity.fromBundle(bundle(b,"identity")); sourceSlot=integer(b,"source_slot"); sourceSession=string(b,"source_session");
            if(!reader.contains(sourceSlot) || !identity.leaf) throw invalid("task_reference_entry"); session(sourceSession,false);
            phase=string(b,"phase"); disposition=string(b,"disposition"); leaseState=string(b,"lease_state"); leaseId=string(b,"lease_id"); hex(leaseId,true);
            if(!Set.of("PREPARED","MUTATING","VERIFY_PENDING","COMMITTED","CLEANUP_PENDING","TERMINAL").contains(phase)
                    || !Set.of("WORKSPACE_OWNED","SHELVED_REFERENCE","PASSIVE_BACKGROUND","EXTERNALLY_ACTIVE","RESTORED","RELEASED","ENDED","STALE").contains(disposition)
                    || !Set.of("NONE","HELD","RELEASE_PENDING","RELEASED","UNKNOWN").contains(leaseState)) throw invalid("task_reference_entry_state");
            if((leaseState.equals("HELD")||leaseState.equals("RELEASE_PENDING"))&&leaseId.isEmpty()
                    ||leaseState.equals("NONE")&&!leaseId.isEmpty()
                    ||phase.equals("TERMINAL")&&Set.of("HELD","RELEASE_PENDING","UNKNOWN").contains(leaseState))
                throw invalid("task_reference_entry_lease");
            hasResponsibility=bool(b,"has_responsibility"); pending=bool(b,"pending"); forgettable=bool(b,"forgettable"); canReleaseAndForget=bool(b,"can_release_and_forget");
            boolean actualPending=!(phase.equals("COMMITTED")||phase.equals("TERMINAL")) || leaseState.equals("UNKNOWN") || leaseState.equals("RELEASE_PENDING");
            if(pending!=actualPending || hasResponsibility!=(pending||leaseState.equals("HELD")) || forgettable&&hasResponsibility
                    || canReleaseAndForget && !(phase.equals("COMMITTED")&&leaseState.equals("HELD")&&!pending
                        || phase.equals("CLEANUP_PENDING")&&(leaseState.equals("RELEASE_PENDING")||leaseState.equals("RELEASED"))))
                throw invalid("task_reference_entry_flags");
        }
        public Bundle toBundle() {
            Bundle b=new Bundle(); b.putString("shelf_id",shelfId); b.putString("operation_id",operationId); b.putBundle("identity",identity.toBundle());
            b.putInt("source_slot",sourceSlot); b.putString("source_session",sourceSession); b.putString("phase",phase); b.putString("disposition",disposition);
            b.putString("lease_state",leaseState); b.putString("lease_id",leaseId); b.putBoolean("has_responsibility",hasResponsibility); b.putBoolean("pending",pending);
            b.putBoolean("forgettable",forgettable); b.putBoolean("can_release_and_forget",canReleaseAndForget); return b;
        }
    }
    private AtomicWorkbenchTaskReferenceSnapshot(Bundle b,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        keys(b,KEYS); schema(b); success=bool(b,"success"); reasonCode=string(b,"reason_code"); revision=number(b,"revision");
        if(revision<0 || !reasonCode.matches("task_reference_[a-z_]{1,80}") || integer(b,"max_references")!=64 || integer(b,"max_pending")!=16)
            throw invalid("task_reference_snapshot");
        Object raw=b.get("entries"); if(!(raw instanceof ArrayList<?>) || ((ArrayList<?>)raw).size()>80) throw invalid("task_reference_entries");
        ArrayList<Entry> list=new ArrayList<>(); Set<String> shelves=new HashSet<>(),operations=new HashSet<>(),tasks=new HashSet<>();
        int pc=0,hc=0,fc=0,user=-1;
        for(Object item:(ArrayList<?>)raw) {
            if(!(item instanceof Bundle)) throw invalid("task_reference_entry_type"); Entry e=new Entry((Bundle)item,reader);
            if(!shelves.add(e.shelfId)||!operations.add(e.operationId)||!tasks.add(e.identity.serverBootGeneration+":"+e.identity.taskGeneration))
                throw invalid("task_reference_duplicate");
            if(user>=0&&user!=e.identity.userId)throw invalid("task_reference_cross_user"); user=e.identity.userId;
            list.add(e); if(e.pending)pc++; if(e.leaseState.equals("HELD"))hc++; if(e.forgettable)fc++;
        }
        totalCount=integer(b,"total_count"); pendingCount=integer(b,"pending_count"); heldCount=integer(b,"held_count"); forgettableCount=integer(b,"forgettable_count");
        if(totalCount!=list.size()||pendingCount!=pc||heldCount!=hc||forgettableCount!=fc||pc>16||list.size()-pc>64)
            throw invalid("task_reference_counts");
        entries=Collections.unmodifiableList(list);
    }
    public static AtomicWorkbenchTaskReferenceSnapshot fromBundle(Bundle b) { return fromBundle(b,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4); }
    static AtomicWorkbenchTaskReferenceSnapshot fromBundle(Bundle b,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if(reader==null) throw invalid("task_reference_reader");
        return new AtomicWorkbenchTaskReferenceSnapshot(b,reader);
    }
    public static AtomicWorkbenchTaskReferenceSnapshot empty(long revision, boolean success, String reason) {
        Bundle b=new Bundle(); b.putInt("schema",1); b.putBoolean("success",success); b.putString("reason_code",reason); b.putLong("revision",revision);
        b.putInt("max_references",64); b.putInt("max_pending",16); b.putInt("total_count",0); b.putInt("pending_count",0);
        b.putInt("held_count",0); b.putInt("forgettable_count",0); b.putParcelableArrayList("entries",new ArrayList<Bundle>()); return fromBundle(b);
    }
    public Bundle toBundle() {
        Bundle b=new Bundle(); b.putInt("schema",1); b.putBoolean("success",success); b.putString("reason_code",reasonCode); b.putLong("revision",revision);
        b.putInt("max_references",64); b.putInt("max_pending",16); b.putInt("total_count",totalCount); b.putInt("pending_count",pendingCount);
        b.putInt("held_count",heldCount); b.putInt("forgettable_count",forgettableCount); ArrayList<Bundle> rows=new ArrayList<>();
        for(Entry e:entries)rows.add(e.toBundle()); b.putParcelableArrayList("entries",rows); return b;
    }
}
