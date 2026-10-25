package ls.augment.com;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Same-user durable task metadata. Locks cover disk IO only, never a system/Binder operation. */
public final class AtomicWorkbenchTaskShelfStore {
    public static final int MAX_SHELVES=64, MAX_PENDING=16, MAX_RECORDS=80;
    private static final int MAX_BYTES=512*1024;
    // Private envelope versions are independent of TaskIdentity/Record SCHEMA1.
    private static final int STORE_V1=1, STORE_V2=2;
    public enum Phase { PREPARED, MUTATING, VERIFY_PENDING, COMMITTED, CLEANUP_PENDING, TERMINAL }
    public enum Disposition { WORKSPACE_OWNED, SHELVED_REFERENCE, PASSIVE_BACKGROUND, EXTERNALLY_ACTIVE, RESTORED, RELEASED, ENDED, STALE }
    public enum LeaseState { NONE, HELD, RELEASE_PENDING, RELEASED, UNKNOWN }
    private final File dataDirectory,directory,file,lockFile;
    private final int uid,user;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile reader;
    // An already observed high generation cannot disappear during this Store owner's lifetime.
    // This is a read floor only; the durable envelope remains the cross-process evidence.
    private AtomicWorkbenchRecoveryScope observedHighScope;
    private String observedHighStoreEpoch;
    private boolean observedHighJournalWithoutMarker;
    private final long directoryDevice,directoryInode;

    public AtomicWorkbenchTaskShelfStore(Context context,int appUid,int userId) throws Exception {
        this(context,appUid,userId,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4);
    }
    AtomicWorkbenchTaskShelfStore(Context context,int appUid,int userId,
            AtomicWorkbenchRecoveryScope.ReaderProfile reader) throws Exception {
        if(reader==null) throw new IllegalArgumentException("shelf_reader_missing");
        this.reader=reader;
        ApplicationInfo info=context.getPackageManager().getApplicationInfo("ls.augment.com",0);
        if(info.uid!=appUid || appUid<10000 || userId<0 || appUid/100000!=userId) throw new SecurityException("shelf_user");
        uid=appUid; user=userId;
        File reportedDataDirectory=new File(info.dataDir).getAbsoluteFile();
        StructStat reportedData=Os.lstat(reportedDataDirectory.getPath());
        if(!OsConstants.S_ISDIR(reportedData.st_mode) || reportedData.st_uid!=uid) throw new SecurityException("shelf_data_owner");
        // PackageManager's root may use a system directory alias; pin the same owned directory.
        dataDirectory=reportedDataDirectory.getCanonicalFile();
        StructStat data=Os.lstat(dataDirectory.getPath());
        if(!OsConstants.S_ISDIR(data.st_mode) || data.st_uid!=uid) throw new SecurityException("shelf_data_owner");
        if(data.st_dev!=reportedData.st_dev || data.st_ino!=reportedData.st_ino) throw new SecurityException("shelf_data_path");
        directory=new File(dataDirectory,"files/atomic_workbench");
        file=new File(directory,"task-shelf.json"); lockFile=new File(directory,"task-shelf.lock");
        prepareDirectory(directory.getParentFile()); prepareDirectory(directory);
        StructStat stat=Os.lstat(directory.getPath()); directoryDevice=stat.st_dev; directoryInode=stat.st_ino;
        checkDirectory();
    }

    /** Durable, non-executable metadata: deliberately has no confirmation nonce or toRequest(). */
    public static final class DurableMetadata {
        public final String operationId,shelfId,sourceWindowSession,targetDisplayName,targetDisplayUnique,targetWindowSession;
        public final AtomicWorkbenchTaskOperationRequest.Action action;
        public final AtomicWorkbenchTaskIdentity identity;
        public final int sourceSlot,targetDisplayId,targetSlot;
        public final long expectedRevision,inputRevision,issuedElapsed,deadlineElapsed;
        private DurableMetadata(String op,String shelf,AtomicWorkbenchTaskOperationRequest.Action action,
                AtomicWorkbenchTaskIdentity identity,int sourceSlot,String sourceSession,int targetDisplay,
                String targetName,String targetUnique,int targetSlot,String targetSession,long expected,long input,long issued,long deadline) {
            hex(op,false); hex(shelf,false); session(sourceSession,false); display(targetDisplay,targetName,targetUnique);
            if(action==null || identity==null || !identity.leaf || !AtomicWorkbenchSlotDomain.contains(sourceSlot) || expected<0 || input<0
                    || issued<0 || deadline<=issued || deadline-issued>5000) throw invalid("durable_task_metadata");
            if(action==AtomicWorkbenchTaskOperationRequest.Action.RESTORE) {
                if(identity.displayId!=0 || targetDisplay<=0 || !AtomicWorkbenchSlotDomain.contains(targetSlot)) throw invalid("durable_restore_target");
                session(targetSession,false);
            } else {
                if(targetSlot!=-1 || targetSession==null || !targetSession.isEmpty()) throw invalid("durable_target_slot");
                if(action!=AtomicWorkbenchTaskOperationRequest.Action.END_TASK && targetDisplay!=0) throw invalid("durable_primary_target");
                if(action==AtomicWorkbenchTaskOperationRequest.Action.END_TASK && (targetDisplay!=identity.displayId
                        || !targetName.equals(identity.displayName) || !targetUnique.equals(identity.displayUnique))) throw invalid("durable_end_location");
            }
            operationId=op; shelfId=shelf; this.action=action; this.identity=identity; this.sourceSlot=sourceSlot;
            sourceWindowSession=sourceSession; targetDisplayId=targetDisplay; targetDisplayName=targetName;
            targetDisplayUnique=targetUnique; this.targetSlot=targetSlot; targetWindowSession=targetSession;
            expectedRevision=expected; inputRevision=input; issuedElapsed=issued; deadlineElapsed=deadline;
        }
        public static DurableMetadata fromRequest(AtomicWorkbenchTaskOperationRequest r) {
            if(r==null) throw invalid("request");
            return new DurableMetadata(r.operationId,r.shelfId,r.action,r.identity,r.sourceSlot,r.sourceWindowSession,
                    r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique,r.targetSlot,r.targetWindowSession,
                    r.expectedRevision,r.inputRevision,r.issuedElapsed,r.deadlineElapsed);
        }
        public boolean sameOperation(DurableMetadata other) {
            return other!=null && operationId.equals(other.operationId) && shelfId.equals(other.shelfId) && action==other.action
                    && identity.equals(other.identity) && sourceSlot==other.sourceSlot && sourceWindowSession.equals(other.sourceWindowSession)
                    && targetDisplayId==other.targetDisplayId && targetDisplayName.equals(other.targetDisplayName)
                    && targetDisplayUnique.equals(other.targetDisplayUnique) && targetSlot==other.targetSlot
                    && targetWindowSession.equals(other.targetWindowSession) && expectedRevision==other.expectedRevision
                    && inputRevision==other.inputRevision && issuedElapsed==other.issuedElapsed && deadlineElapsed==other.deadlineElapsed;
        }
        JSONObject json() throws Exception {
            JSONObject j=new JSONObject(); j.put("schema",SCHEMA); j.put("operation_id",operationId); j.put("shelf_id",shelfId);
            j.put("action",action.name()); j.put("identity",identityJson(identity)); j.put("source_slot",sourceSlot);
            j.put("source_window_session",sourceWindowSession); j.put("target_display_id",targetDisplayId);
            j.put("target_display_name",targetDisplayName); j.put("target_display_unique",targetDisplayUnique);
            j.put("target_slot",targetSlot); j.put("target_window_session",targetWindowSession);
            j.put("expected_revision",expectedRevision); j.put("input_revision",inputRevision);
            j.put("issued_elapsed",issuedElapsed); j.put("deadline_elapsed",deadlineElapsed); return j;
        }
        static DurableMetadata parse(JSONObject j) throws Exception {
            jsonKeys(j,"schema","operation_id","shelf_id","action","identity","source_slot","source_window_session",
                    "target_display_id","target_display_name","target_display_unique","target_slot","target_window_session",
                    "expected_revision","input_revision","issued_elapsed","deadline_elapsed");
            checkSchema(j);
            return new DurableMetadata(js(j,"operation_id"),js(j,"shelf_id"),AtomicWorkbenchTaskOperationRequest.Action.valueOf(js(j,"action")),
                    parseIdentity(jo(j,"identity")),ji(j,"source_slot"),js(j,"source_window_session"),ji(j,"target_display_id"),
                    js(j,"target_display_name"),js(j,"target_display_unique"),ji(j,"target_slot"),js(j,"target_window_session"),
                    jl(j,"expected_revision"),jl(j,"input_revision"),jl(j,"issued_elapsed"),jl(j,"deadline_elapsed"));
        }
    }

    public static final class Record {
        public final DurableMetadata metadata;
        public final String shelfId,operationId,leaseId,actualDisplayName,actualDisplayUnique;
        public final Phase phase;
        public final Disposition disposition;
        public final LeaseState leaseState;
        public final boolean dispatched;
        public final int actualDisplayId;
        public final AtomicWorkbenchTaskIdentity observedIdentity;
        public final Record previous;
        public Record(DurableMetadata metadata,Phase phase,Disposition disposition,LeaseState leaseState,String leaseId,
                boolean dispatched,int actualDisplayId,String actualDisplayName,String actualDisplayUnique) {
            this(metadata,phase,disposition,leaseState,leaseId,dispatched,actualDisplayId,actualDisplayName,actualDisplayUnique,null);
        }
        public Record(DurableMetadata metadata,Phase phase,Disposition disposition,LeaseState leaseState,String leaseId,
                boolean dispatched,int actualDisplayId,String actualDisplayName,String actualDisplayUnique,AtomicWorkbenchTaskIdentity observedIdentity) {
            this(metadata,phase,disposition,leaseState,leaseId,dispatched,actualDisplayId,actualDisplayName,actualDisplayUnique,observedIdentity,null);
        }
        public Record(DurableMetadata metadata,Phase phase,Disposition disposition,LeaseState leaseState,String leaseId,
                boolean dispatched,int actualDisplayId,String actualDisplayName,String actualDisplayUnique,AtomicWorkbenchTaskIdentity observedIdentity,Record previous) {
            hex(leaseId,true);
            if(metadata==null || phase==null || disposition==null || leaseState==null || actualDisplayId < -1)
                throw invalid("shelf_record");
            if(actualDisplayId==-1) { if(!"".equals(actualDisplayName) || !"".equals(actualDisplayUnique)) throw invalid("unknown_location"); }
            else display(actualDisplayId,actualDisplayName,actualDisplayUnique);
            if((leaseState==LeaseState.HELD || leaseState==LeaseState.RELEASE_PENDING) && leaseId.isEmpty()
                    || leaseState==LeaseState.NONE && !leaseId.isEmpty()
                    || phase==Phase.PREPARED && dispatched || phase==Phase.COMMITTED && (!dispatched || actualDisplayId<0)
                    || phase==Phase.TERMINAL && (leaseState==LeaseState.HELD || leaseState==LeaseState.RELEASE_PENDING || leaseState==LeaseState.UNKNOWN))
                throw invalid("shelf_record_state");
            this.metadata=metadata; shelfId=metadata.shelfId; operationId=metadata.operationId;
            this.phase=phase; this.disposition=disposition; this.leaseState=leaseState; this.leaseId=leaseId;
            this.dispatched=dispatched; this.actualDisplayId=actualDisplayId;
            this.actualDisplayName=actualDisplayName; this.actualDisplayUnique=actualDisplayUnique;
            if(observedIdentity!=null && (!metadata.identity.sameTask(observedIdentity)
                    || observedIdentity.displayId!=actualDisplayId || !observedIdentity.displayName.equals(actualDisplayName)
                    || !observedIdentity.displayUnique.equals(actualDisplayUnique))) throw invalid("shelf_observed_identity");
            this.observedIdentity=observedIdentity;
            if(previous!=null && (previous.previous!=null || previous.pending()
                    || !(metadata.action==AtomicWorkbenchTaskOperationRequest.Action.RESTORE
                        || metadata.action==AtomicWorkbenchTaskOperationRequest.Action.END_TASK && metadata.identity.displayId==0)
                    || phase==Phase.COMMITTED || phase==Phase.TERMINAL || !previous.shelfId.equals(shelfId)
                    || previous.operationId.equals(operationId) || !previous.metadata.identity.sameTask(metadata.identity)))
                throw invalid("shelf_restore_previous");
            this.previous=previous;
        }
        public boolean pending() {
            return phase!=Phase.COMMITTED && phase!=Phase.TERMINAL || leaseState==LeaseState.UNKNOWN || leaseState==LeaseState.RELEASE_PENDING;
        }
        public boolean hasResponsibility() { return pending() || leaseState==LeaseState.HELD; }
        JSONObject json() throws Exception {
            JSONObject j=new JSONObject(); j.put("schema",SCHEMA); j.put("metadata",metadata.json()); j.put("phase",phase.name());
            j.put("disposition",disposition.name()); j.put("lease_state",leaseState.name()); j.put("lease_id",leaseId);
            j.put("dispatched",dispatched); j.put("actual_display_id",actualDisplayId);
            j.put("actual_display_name",actualDisplayName); j.put("actual_display_unique",actualDisplayUnique);
            j.put("observed_identity",observedIdentity==null?new JSONObject():identityJson(observedIdentity));
            j.put("previous",previous==null?new JSONObject():previous.json()); return j;
        }
        static Record parse(JSONObject j) throws Exception {
            ArrayList<String> keys=new ArrayList<>(Arrays.asList("schema","metadata","phase","disposition","lease_state","lease_id","dispatched",
                    "actual_display_id","actual_display_name","actual_display_unique"));
            if(j.has("observed_identity")) keys.add("observed_identity"); if(j.has("previous")) keys.add("previous");
            jsonKeys(j,keys.toArray(new String[0])); checkSchema(j);
            JSONObject observed=j.has("observed_identity")?jo(j,"observed_identity"):null;
            JSONObject previous=j.has("previous")?jo(j,"previous"):null;
            return new Record(DurableMetadata.parse(jo(j,"metadata")),Phase.valueOf(js(j,"phase")),Disposition.valueOf(js(j,"disposition")),
                    LeaseState.valueOf(js(j,"lease_state")),js(j,"lease_id"),jb(j,"dispatched"),ji(j,"actual_display_id"),
                    js(j,"actual_display_name"),js(j,"actual_display_unique"),observed==null||observed.length()==0?null:parseIdentity(observed),
                    previous==null||previous.length()==0?null:Record.parse(previous));
        }
    }

    public static final class Snapshot {
        public final long revision;
        public final List<Record> records;
        public final int storageSchema;
        public final String storeEpoch;
        public final AtomicWorkbenchRecoveryScope recoveryScope;
        public final boolean scopeConsistent;
        private Snapshot(long revision,List<Record> records,AtomicWorkbenchRecoveryScope.ReaderProfile reader,
                boolean highJournal) throws IOException {
            this(revision,records,STORE_V1,"",AtomicWorkbenchRecoveryScope.legacy(),reader,highJournal);
        }
        private Snapshot(long revision,List<Record> records,int storageSchema,String storeEpoch,
                         AtomicWorkbenchRecoveryScope recoveryScope,AtomicWorkbenchRecoveryScope.ReaderProfile reader,boolean highJournal) throws IOException {
            if(recoveryScope==null || storageSchema!=STORE_V1 && storageSchema!=STORE_V2
                    || storageSchema==STORE_V1 && (!"".equals(storeEpoch) || recoveryScope.requiresHighScopeReader())
                    || storageSchema==STORE_V2 && (storeEpoch==null || !storeEpoch.matches("[0-9a-f]{32}")))
                throw new IOException("shelf_envelope_shape");
            recoveryScope.requireReader(reader);
            for(Record record:records) if(highRecord(record)) {
                if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
                    throw new IOException("shelf_scope_unsupported_full_scope");
                if(!recoveryScope.requiresHighScopeReader()) throw new IOException("shelf_high_without_marker");
            }
            scopeConsistent=!highJournal || recoveryScope.requiresHighScopeReader();
            this.revision=revision; this.records=Collections.unmodifiableList(new ArrayList<>(records));
            this.storageSchema=storageSchema; this.storeEpoch=storeEpoch; this.recoveryScope=recoveryScope;
        }
        public Record find(String shelfId) { for(Record r:records) if(r.shelfId.equals(shelfId)) return r; return null; }
    }
    /** A rename may have become visible even when its directory sync failed: query, never redispatch. */
    public static final class SaveException extends IOException {
        public final boolean replacementVisible;
        SaveException(boolean replaced,Exception cause) { super(replaced?"shelf_commit_uncertain":"shelf_prepare_failed",cause); replacementVisible=replaced; }
    }
    private interface DiskOperation<T> { T run() throws Exception; }
    private synchronized <T> T locked(DiskOperation<T> operation) throws Exception {
        checkDirectory(); checkExisting(lockFile,false);
        FileDescriptor fd=Os.open(lockFile.getPath(),OsConstants.O_RDWR|OsConstants.O_CREAT|OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW,0600);
        try(FileOutputStream stream=new FileOutputStream(fd)) {
            StructStat stat=Os.fstat(fd); regular(stat,false); sameFile(lockFile,stat);
            Os.fchown(fd,uid,uid); Os.fchmod(fd,0600);
            FileLock acquired;
            try { acquired=stream.getChannel().tryLock(); }
            catch(OverlappingFileLockException busy) { throw new IOException("shelf_store_busy",busy); }
            if(acquired==null) throw new IOException("shelf_store_busy");
            try { checkDirectory(); sameFile(lockFile,Os.fstat(fd)); return operation.run(); }
            finally { acquired.release(); }
        }
    }
    AtomicWorkbenchRecoveryScope.ReaderProfile readerProfile() { return reader; }
    int userId() { return user; }
    public Snapshot read() throws Exception { return locked(this::readLocked); }
    /** Reader support alone cannot authorize a new high allocation or upgrade its marker. */
    public Snapshot requireHighScope(long expectedRevision) throws Exception {
        return locked(()->{
            Snapshot previous=readLocked(); requireRevision(expectedRevision,previous);
            if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8 || !previous.scopeConsistent
                    || previous.recoveryScope.phase==AtomicWorkbenchRecoveryScope.Phase.DRAINING)
                throw new IOException("shelf_high_allocation_unconfirmed");
            if(previous.recoveryScope.phase==AtomicWorkbenchRecoveryScope.Phase.HIGH_REQUIRED) {
                // A prior writer may have renamed successfully but lost its directory-sync receipt.
                // Its file fsync precedes rename; this fresh checked directory sync closes that uncertainty.
                try { checkDirectory(); syncDirectory(); }
                catch(Exception uncertain) { throw new SaveException(true,uncertain); }
                return previous;
            }
            String epoch=UUID.randomUUID().toString().replace("-","");
            String storeEpoch=previous.storageSchema==STORE_V2 ? previous.storeEpoch : UUID.randomUUID().toString().replace("-","");
            Snapshot next=new Snapshot(previous.revision+1,previous.records,STORE_V2,storeEpoch,
                    AtomicWorkbenchRecoveryScope.high(epoch),reader,false);
            validateRecords(next.records);
            // writeSnapshot completes the actual file and directory fsync before this returns.
            return observe(writeSnapshot(next));
        });
    }
    interface ResetAction { void run() throws Exception; }
    /** Explicit total-reset final check and deletion share the existing checked Store lock.
     * The lock path can be unlinked by deletion; safety also relies on the existing legal
     * writer CAS/HIGH-floor/directory identity and current-principal/Journal gates.
     */
    void withResetClear(Bundle expected, ResetAction action) throws Exception {
        if(action==null) throw new IllegalArgumentException("shelf_reset_action");
        locked(()->{
            if(!ResetWriteFence.owns()) throw new IOException("shelf_reset_fence");
            Snapshot current=readLocked();
            if(reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8 || !current.scopeConsistent)
                throw new IOException("shelf_reset_scope_unknown");
            if(expected==null) {
                // Preserve the existing clean legacy reset route; it can never discard a high marker.
                if(current.recoveryScope.requiresHighScopeReader()) throw new IOException("shelf_reset_high_close_required");
            } else {
                if(!expected.keySet().equals(Set.of("store_epoch","store_revision","scope_epoch","scope_phase"))
                        || !(expected.get("store_epoch") instanceof String) || !(expected.get("store_revision") instanceof Long)
                        || !(expected.get("scope_epoch") instanceof String) || !(expected.get("scope_phase") instanceof String)
                        || !current.storeEpoch.equals(expected.get("store_epoch")) || current.revision!=(Long)expected.get("store_revision")
                        || !current.recoveryScope.epoch.equals(expected.get("scope_epoch"))
                        || !current.recoveryScope.phase.name().equals(expected.get("scope_phase")))
                    throw new IOException("shelf_reset_observation_changed");
            }
            for(Record record:current.records) if(record.hasResponsibility()) throw new IOException("shelf_reset_responsibility_pending");
            action.run(); // The caller rechecks journals, current endpoint and the same fence before its original files deletion.
            return null;
        });
    }

    private Snapshot derive(Snapshot previous,long revision,List<Record> records) throws IOException {
        return new Snapshot(revision,records,previous.storageSchema,previous.storeEpoch,previous.recoveryScope,reader,!previous.scopeConsistent);
    }
    public Snapshot save(long expectedRevision,List<Record> records) throws Exception {
        if(records==null) throw invalid("records"); List<Record> copy=new ArrayList<>(records);
        return locked(()->saveLocked(expectedRevision,copy));
    }
    public Snapshot update(long expectedRevision,Record record) throws Exception {
        if(record==null) throw invalid("record");
        return locked(()->{
            Snapshot previous=readLocked(); requireRevision(expectedRevision,previous);
            ArrayList<Record> records=new ArrayList<>(previous.records); boolean replaced=false;
            for(int i=0;i<records.size();i++) if(records.get(i).shelfId.equals(record.shelfId)) { records.set(i,record); replaced=true; break; }
            if(!replaced) records.add(record); return saveLocked(expectedRevision,records);
        });
    }
    public Snapshot remove(long expectedRevision,String shelfId) throws Exception {
        hex(shelfId,false);
        return locked(()->{
            Snapshot previous=readLocked(); requireRevision(expectedRevision,previous); Record record=previous.find(shelfId);
            if(record==null) throw new IOException("shelf_missing");
            if(record.hasResponsibility()) throw new IOException("shelf_responsibility_pending");
            ArrayList<Record> records=new ArrayList<>(previous.records); records.remove(record); return saveLocked(expectedRevision,records);
        });
    }
    /** Only an authoritative non-dispatch cancellation may restore the previous durable shelf. */
    public Snapshot rollbackPreparedShelfOperation(long expectedRevision,String operationId,Bundle cancellation) throws Exception {
        hex(operationId,false);
        return locked(()->{
            Snapshot current=readLocked(); requireRevision(expectedRevision,current); Record record=null;
            for(Record r:current.records) if(r.operationId.equals(operationId)) record=r;
            if(record==null || record.previous==null || record.dispatched || !record.pending()
                    || cancellation==null || !operationId.equals(cancellation.get("operation_id"))
                    || !Boolean.TRUE.equals(cancellation.get("cancelled")) || !Boolean.FALSE.equals(cancellation.get("mutation_dispatched"))
                    || !Boolean.FALSE.equals(cancellation.get("external"))) throw new IOException("shelf_restore_cancel_unconfirmed");
            Record prior=record.previous; AtomicWorkbenchTaskIdentity observed=AtomicWorkbenchTaskIdentity.fromBundle((Bundle)cancellation.get("identity"));
            if(!prior.metadata.identity.sameTask(observed) || observed.displayId!=0 || prior.observedIdentity==null
                    || !prior.observedIdentity.sameLocation(observed)
                    || prior.leaseState==LeaseState.HELD && (!Boolean.TRUE.equals(cancellation.get("inherited_hidden_lease"))
                        || !prior.leaseId.equals(cancellation.get("inherited_lease_id")))
                    || prior.leaseState!=LeaseState.HELD && !Boolean.FALSE.equals(cancellation.get("inherited_hidden_lease")))
                throw new IOException("shelf_previous_lease_unconfirmed");
            ArrayList<Record> records=new ArrayList<>(current.records); records.set(records.indexOf(record),prior);
            validateRecords(records); return writeSnapshot(derive(current,expectedRevision+1,records));
        });
    }
    private void requireRevision(long expected,Snapshot previous) throws IOException {
        if(expected<0 || expected!=previous.revision || expected==Long.MAX_VALUE) throw new IOException("shelf_revision_conflict");
    }
    private Snapshot saveLocked(long expected,List<Record> records) throws Exception {
        Snapshot previous=readLocked(); requireRevision(expected,previous); validateRecords(records);
        Snapshot next=derive(previous,expected+1,records);
        for(Record old:previous.records) {
            Record replacement=next.find(old.shelfId);
            if(replacement==null && old.hasResponsibility()) throw new IOException("shelf_responsibility_pending");
            if(replacement!=null && old.operationId.equals(replacement.operationId)
                    && !old.metadata.sameOperation(replacement.metadata)) throw new IOException("shelf_operation_rebound");
            if(replacement!=null && (!old.metadata.identity.sameTask(replacement.metadata.identity)
                    || old.hasResponsibility() && !old.operationId.equals(replacement.operationId)
                        && (old.pending() || !old.leaseId.equals(replacement.leaseId) || replacement.leaseState==LeaseState.NONE)))
                throw new IOException("shelf_responsibility_replaced");
        }
        return writeSnapshot(next);
    }
    private Snapshot writeSnapshot(Snapshot next) throws Exception {
        next.recoveryScope.requireReader(reader);
        JSONObject json=new JSONObject(); json.put("schema",next.storageSchema); json.put("owner_uid",uid); json.put("user_id",user);
        if(next.storageSchema==STORE_V2) {
            json.put("store_epoch",next.storeEpoch); json.put("recovery_scope",next.recoveryScope.json());
            // Nonempty outboxes are rejected on read until the complete typed retirement chain exists.
            json.put("retirement_outbox",new JSONArray());
        }
        json.put("revision",next.revision); JSONArray array=new JSONArray(); for(Record r:next.records) array.put(r.json()); json.put("records",array);
        writeAtomic(json.toString().getBytes(StandardCharsets.UTF_8)); return next;
    }
    private void validateRecords(List<Record> records) throws Exception {
        if(records.size()>MAX_RECORDS) throw new IOException("shelf_capacity");
        Set<String> shelves=new HashSet<>(),operations=new HashSet<>(),tasks=new HashSet<>(); int pending=0,shelvesCount=0;
        for(Record r:records) {
            if(r==null || r.metadata.identity.userId!=user || r.metadata.identity.uid/100000!=user
                    || !shelves.add(r.shelfId) || !operations.add(r.operationId)
                    || !tasks.add(r.metadata.identity.serverBootGeneration+":"+r.metadata.identity.taskGeneration)) throw new IOException("shelf_duplicate_or_user");
            if(r.pending()) pending++; else shelvesCount++;
        }
        if(pending>MAX_PENDING || shelvesCount>MAX_SHELVES) throw new IOException("shelf_capacity");
    }
    private Snapshot readLocked() throws Exception {
        checkDirectory(); boolean highJournals=highJournalEvidence() || observedHighJournalWithoutMarker; StructStat before;
        try { before=Os.lstat(file.getPath()); } catch(ErrnoException error) {
            if(error.errno==OsConstants.ENOENT) return observe(new Snapshot(0,Collections.emptyList(),reader,highJournals)); throw error;
        }
        regular(before,true);
        FileDescriptor fd=Os.open(file.getPath(),OsConstants.O_RDONLY|OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW,0);
        byte[] bytes;
        try(FileInputStream input=new FileInputStream(fd)) {
            StructStat opened=Os.fstat(fd); regular(opened,true);
            if(before.st_dev!=opened.st_dev || before.st_ino!=opened.st_ino) throw new SecurityException("shelf_file_replaced");
            ByteArrayOutputStream output=new ByteArrayOutputStream(); byte[] buffer=new byte[4096]; int count;
            while((count=input.read(buffer))!=-1) { if(output.size()+count>MAX_BYTES) throw new IOException("shelf_size"); output.write(buffer,0,count); }
            sameFile(file,opened); bytes=output.toByteArray();
        }
        String text=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT)
                .decode(ByteBuffer.wrap(bytes)).toString();
        new StrictJson(text).validate(); JSONObject json=new JSONObject(text);
        int storageSchema=ji(json,"schema"); String storeEpoch="";
        AtomicWorkbenchRecoveryScope scope=AtomicWorkbenchRecoveryScope.legacy();
        if(storageSchema==STORE_V1) {
            jsonKeys(json,"schema","owner_uid","user_id","revision","records");
        } else if(storageSchema==STORE_V2) {
            jsonKeys(json,"schema","owner_uid","user_id","revision","store_epoch","recovery_scope","records","retirement_outbox");
            storeEpoch=js(json,"store_epoch"); if(!storeEpoch.matches("[0-9a-f]{32}")) throw new IOException("shelf_epoch");
            scope=AtomicWorkbenchRecoveryScope.parse(jo(json,"recovery_scope"));
            Object outbox=json.get("retirement_outbox");
            if(!(outbox instanceof JSONArray)) throw new IOException("shelf_retirement_outbox_type");
            if(((JSONArray)outbox).length()!=0) throw new IOException("shelf_retirement_reader_required");
        } else throw new IOException("shelf_schema");
        scope.requireReader(reader);
        if(ji(json,"owner_uid")!=uid || ji(json,"user_id")!=user || jl(json,"revision")<1) throw new SecurityException("shelf_owner_or_revision");
        Object entries=json.get("records"); if(!(entries instanceof JSONArray)) throw new IOException("shelf_records_type");
        JSONArray array=(JSONArray)entries; if(array.length()>MAX_RECORDS) throw new IOException("shelf_capacity");
        ArrayList<Record> records=new ArrayList<>();
        for(int i=0;i<array.length();i++) { Object entry=array.get(i); if(!(entry instanceof JSONObject)) throw new IOException("shelf_record_type"); records.add(Record.parse((JSONObject)entry)); }
        validateRecords(records); checkDirectory(); return observe(new Snapshot(jl(json,"revision"),records,storageSchema,storeEpoch,scope,reader,highJournals));
    }
    private Snapshot observe(Snapshot read) throws IOException {
        if(!read.scopeConsistent) observedHighJournalWithoutMarker=true;
        if(observedHighScope!=null && (!read.recoveryScope.requiresHighScopeReader()
                || !observedHighScope.epoch.equals(read.recoveryScope.epoch)
                || !observedHighStoreEpoch.equals(read.storeEpoch)))
            throw new IOException("shelf_high_history_unavailable");
        if(read.recoveryScope.requiresHighScopeReader()) {
            observedHighScope=read.recoveryScope; observedHighStoreEpoch=read.storeEpoch;
        }
        return read;
    }
    // A journal without a matching high marker is retained as a readable discrepancy.
    // LOW4 cannot silently certify a directory containing high/future recovery owners.
    private boolean highJournalEvidence() throws Exception {
        String[] names=directory.list(); if(names==null) throw new IOException("shelf_journal_listing_unavailable");
        boolean high=false;
        for(String name:names) if(name.matches("recovery-window-[0-9]+\\.json")) {
            String slot=name.substring("recovery-window-".length(),name.length()-".json".length());
            if(!slot.matches("[0-7]")) throw new IOException("shelf_future_recovery_owner");
            if(AtomicWorkbenchSlotDomain.high(Integer.parseInt(slot))) high=true;
        }
        if(high && reader!=AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
            throw new IOException("shelf_scope_unsupported_full_scope");
        return high;
    }
    private static boolean highRecord(Record record) {
        DurableMetadata m=record.metadata;
        boolean high=AtomicWorkbenchSlotDomain.high(m.sourceSlot) || AtomicWorkbenchSlotDomain.high(m.targetSlot);
        high |= AtomicWorkbenchSlotDomain.highDisplayName(m.identity.displayName);
        high |= AtomicWorkbenchSlotDomain.highDisplayName(m.targetDisplayName);
        high |= AtomicWorkbenchSlotDomain.highDisplayName(record.actualDisplayName);
        if(record.observedIdentity!=null) high |= AtomicWorkbenchSlotDomain.highDisplayName(record.observedIdentity.displayName);
        if(record.previous!=null) high |= highRecord(record.previous);
        return high;
    }

    private void writeAtomic(byte[] bytes) throws Exception {
        if(bytes.length==0 || bytes.length>MAX_BYTES) throw new IOException("shelf_size");
        File temporary=new File(directory,"task-shelf-pending-"+UUID.randomUUID()+".tmp"); boolean renamed=false;
        try {
            FileDescriptor fd=Os.open(temporary.getPath(),OsConstants.O_WRONLY|OsConstants.O_CREAT|OsConstants.O_EXCL|OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW,0600);
            try(FileOutputStream output=new FileOutputStream(fd)) {
                regular(Os.fstat(fd),false); output.write(bytes); Os.fchown(fd,uid,uid); Os.fchmod(fd,0600);
                output.flush(); Os.fsync(fd);
            }
            checkDirectory(); checkExisting(file,true); Os.rename(temporary.getPath(),file.getPath()); renamed=true;
            checkDirectory(); syncDirectory();
        } catch(Exception failure) { throw new SaveException(renamed,failure); }
        finally { if(!renamed) try { Os.remove(temporary.getPath()); } catch(ErrnoException ignored) { } }
    }
    private void syncDirectory() throws Exception {
        FileDescriptor fd=Os.open(directory.getPath(),OsConstants.O_RDONLY|OsConstants.O_CLOEXEC|OsConstants.O_NOFOLLOW,0);
        try { StructStat stat=Os.fstat(fd);
            if(!OsConstants.S_ISDIR(stat.st_mode) || stat.st_uid!=uid || stat.st_dev!=directoryDevice || stat.st_ino!=directoryInode)
                throw new SecurityException("shelf_directory_replaced"); Os.fsync(fd);
        } finally { Os.close(fd); }
    }
    private void regular(StructStat stat,boolean bounded) throws IOException {
        if(!OsConstants.S_ISREG(stat.st_mode) || stat.st_nlink!=1 || stat.st_uid!=uid && stat.st_uid!=0
                || (stat.st_mode&0077)!=0 || bounded && (stat.st_size<1 || stat.st_size>MAX_BYTES)) throw new IOException("shelf_private_file");
    }
    private void sameFile(File candidate,StructStat opened) throws Exception {
        StructStat current=Os.lstat(candidate.getPath());
        if(current.st_dev!=opened.st_dev || current.st_ino!=opened.st_ino) throw new SecurityException("shelf_file_replaced");
    }
    private void checkExisting(File candidate,boolean bounded) throws Exception {
        try { regular(Os.lstat(candidate.getPath()),bounded); }
        catch(ErrnoException error) { if(error.errno!=OsConstants.ENOENT) throw error; }
    }
    private void prepareDirectory(File candidate) throws Exception {
        try { Os.mkdir(candidate.getPath(),0700); } catch(ErrnoException error) { if(error.errno!=OsConstants.EEXIST) throw error; }
        StructStat stat=Os.lstat(candidate.getPath());
        if(!OsConstants.S_ISDIR(stat.st_mode) || stat.st_uid!=uid && stat.st_uid!=0
                || !candidate.getCanonicalFile().equals(candidate.getAbsoluteFile())) throw new SecurityException("shelf_private_directory");
        Os.chown(candidate.getPath(),uid,uid); Os.chmod(candidate.getPath(),0700);
    }
    private void checkDirectory() throws Exception {
        for(File candidate:new File[]{dataDirectory,directory.getParentFile(),directory}) {
            StructStat stat=Os.lstat(candidate.getPath());
            if(!OsConstants.S_ISDIR(stat.st_mode) || stat.st_uid!=uid || !candidate.getCanonicalFile().equals(candidate.getAbsoluteFile())
                    || candidate.equals(directory) && (stat.st_dev!=directoryDevice || stat.st_ino!=directoryInode)) throw new SecurityException("shelf_directory_replaced");
        }
    }

    private static JSONObject identityJson(AtomicWorkbenchTaskIdentity identity) throws Exception {
        Bundle bundle=identity.toBundle(); JSONObject json=new JSONObject();
        for(String key:bundle.keySet()) json.put(key,bundle.get(key)); return json;
    }
    private static AtomicWorkbenchTaskIdentity parseIdentity(JSONObject j) throws Exception {
        jsonKeys(j,"schema","server_boot_generation","task_generation","task_id","root_task_id","leaf","uid","user_id",
                "base_component","real_component","display_id","display_name","display_unique"); checkSchema(j);
        return new AtomicWorkbenchTaskIdentity(js(j,"server_boot_generation"),js(j,"task_generation"),ji(j,"task_id"),ji(j,"root_task_id"),
                jb(j,"leaf"),ji(j,"uid"),ji(j,"user_id"),js(j,"base_component"),js(j,"real_component"),ji(j,"display_id"),js(j,"display_name"),js(j,"display_unique"));
    }
    private static void jsonKeys(JSONObject j,String... allowed) throws Exception {
        Set<String> keys=new HashSet<>(); Iterator<String> iterator=j.keys(); while(iterator.hasNext()) keys.add(iterator.next());
        if(!keys.equals(new HashSet<>(Arrays.asList(allowed)))) throw new IOException("shelf_json_keys");
    }
    private static void checkSchema(JSONObject j) throws Exception { if(ji(j,"schema")!=SCHEMA) throw new IOException("shelf_schema"); }
    private static String js(JSONObject j,String k) throws Exception { Object v=j.get(k); if(!(v instanceof String)) throw new IOException("shelf_string"); return (String)v; }
    private static long jl(JSONObject j,String k) throws Exception {
        Object v=j.get(k); if(!(v instanceof Integer) && !(v instanceof Long)) throw new IOException("shelf_integer"); return ((Number)v).longValue();
    }
    private static int ji(JSONObject j,String k) throws Exception { long v=jl(j,k); if(v<Integer.MIN_VALUE || v>Integer.MAX_VALUE) throw new IOException("shelf_int_range"); return (int)v; }
    private static boolean jb(JSONObject j,String k) throws Exception { Object v=j.get(k); if(!(v instanceof Boolean)) throw new IOException("shelf_boolean"); return (Boolean)v; }
    private static JSONObject jo(JSONObject j,String k) throws Exception { Object v=j.get(k); if(!(v instanceof JSONObject)) throw new IOException("shelf_object"); return (JSONObject)v; }

    /** Android's JSONObject parser accepts extensions and duplicate keys; durable evidence does not. */
    private static final class StrictJson {
        final String text; int position;
        StrictJson(String text) { this.text=text; }
        void validate() throws IOException { value(0); space(); if(position!=text.length()) fail(); }
        void space() { while(position<text.length() && " \r\n\t".indexOf(text.charAt(position))>=0) position++; }
        void fail() throws IOException { throw new IOException("shelf_json_syntax"); }
        boolean take(char c) { space(); if(position<text.length() && text.charAt(position)==c) { position++; return true; } return false; }
        void need(char c) throws IOException { if(!take(c)) fail(); }
        void value(int depth) throws IOException {
            if(depth>8) fail(); space(); if(position>=text.length()) fail(); char c=text.charAt(position);
            if(c=='{') { position++; Set<String> names=new HashSet<>(); if(take('}')) return;
                do { String name=string(); if(!names.add(name)) fail(); need(':'); value(depth+1); } while(take(',')); need('}');
            } else if(c=='[') { position++; int count=0; if(take(']')) return;
                do { if(++count>MAX_RECORDS) fail(); value(depth+1); } while(take(',')); need(']');
            } else if(c=='"') string();
            else if(c=='t') literal("true"); else if(c=='f') literal("false"); else if(c=='n') literal("null");
            else { int start=position; if(c=='-') position++; if(position>=text.length()) fail();
                if(text.charAt(position)=='0') position++; else { if(text.charAt(position)<'1' || text.charAt(position)>'9') fail(); while(position<text.length() && Character.isDigit(text.charAt(position))) position++; }
                try { Long.parseLong(text.substring(start,position)); } catch(NumberFormatException bad) { fail(); }
            }
        }
        void literal(String value) throws IOException { if(!text.startsWith(value,position)) fail(); position+=value.length(); }
        String string() throws IOException {
            need('"'); StringBuilder result=new StringBuilder();
            while(position<text.length()) { char c=text.charAt(position++); if(c=='"') return result.toString(); if(c<32) fail();
                if(c=='\\') { if(position>=text.length()) fail(); c=text.charAt(position++);
                    if(c=='u') { if(position+4>text.length()) fail(); try { c=(char)Integer.parseInt(text.substring(position,position+4),16); } catch(NumberFormatException bad) { fail(); } position+=4; }
                    else { int index="\"\\/bfnrt".indexOf(c); if(index<0) fail(); c="\"\\/\b\f\n\r\t".charAt(index); }
                } result.append(c); if(result.length()>4096) fail();
            } fail(); return "";
        }
    }
}
