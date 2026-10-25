package ls.augment.com;

import android.os.Bundle;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.UUID;
import java.util.function.BooleanSupplier;
import static ls.augment.com.AtomicWorkbenchTaskIdentity.*;

/** Phone-side reference manager. A closed view cannot turn a lost mutation into a retry. */
final class AtomicWorkbenchTaskReferenceUiState {
    interface Transport { Bundle exchange(Bundle request) throws Exception; }
    static final int MAX_UNCONFIRMED = 16;
    private final AtomicWorkbenchRecoveryScope.ReaderProfile reader;
    AtomicWorkbenchTaskReferenceUiState() { this(AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4); }
    AtomicWorkbenchTaskReferenceUiState(AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if (reader == null) throw invalid("task_reference_reader");
        this.reader = reader;
    }
    static final class Scope {
        final Object connection; final long session, reset;
        Scope(Object connection, long session, long reset) {
            this.connection=connection; this.session=session; this.reset=reset;
        }
    }
    static final class Selection {
        final long revision;
        final AtomicWorkbenchTaskReferenceSnapshot.Entry entry;
        final AtomicWorkbenchTaskReferenceRequest.Action action;
        Selection(AtomicWorkbenchTaskReferenceSnapshot snapshot,
                AtomicWorkbenchTaskReferenceSnapshot.Entry entry,
                AtomicWorkbenchTaskReferenceRequest.Action action) {
            if (!eligible(snapshot,entry,action)) throw invalid("task_reference_selection");
            revision=snapshot.revision; this.entry=entry; this.action=action;
        }
        boolean matches(AtomicWorkbenchTaskReferenceSnapshot fresh) {
            if (fresh==null || !fresh.success || fresh.revision!=revision) return false;
            for (var current:fresh.entries)
                if (sameEntry(entry,current)) return eligible(fresh,current,action);
            return false;
        }
    }
    static final class Work {
        final Scope scope;
        final Selection selection;
        final AtomicWorkbenchTaskReferenceRequest query;
        AtomicWorkbenchTaskReferenceRequest mutation;
        boolean sent;
        Work(Scope scope, Selection selection, AtomicWorkbenchTaskReferenceRequest query) {
            this.scope=scope; this.selection=selection; this.query=query;
        }
    }
    static final class ViewState {
        final AtomicWorkbenchTaskReferenceSnapshot snapshot;
        final boolean available, busy;
        final int unconfirmed, supersededUnknown;
        final long version;
        final String notice;
        ViewState(AtomicWorkbenchTaskReferenceSnapshot snapshot,boolean available,boolean busy,
                int unconfirmed,int supersededUnknown,long version,String notice) {
            this.snapshot=snapshot; this.available=available; this.busy=busy;
            this.unconfirmed=unconfirmed; this.supersededUnknown=supersededUnknown; this.version=version; this.notice=notice;
        }
    }
    static final class Reply {
        final AtomicWorkbenchTaskReferenceResult result, queried;
        final AtomicWorkbenchTaskReferenceSnapshot snapshot;
        Reply(Bundle data,AtomicWorkbenchTaskReferenceRequest request,AtomicWorkbenchTaskReferenceRequest query) {
            this(data,request,query,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4);
        }
        Reply(Bundle data,AtomicWorkbenchTaskReferenceRequest request,AtomicWorkbenchTaskReferenceRequest query,
                AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
            keys(data,"schema","result","snapshot","queried_result"); schema(data);
            result=AtomicWorkbenchTaskReferenceResult.fromBundle(bundle(data,"result"),request);
            snapshot=AtomicWorkbenchTaskReferenceSnapshot.fromBundle(bundle(data,"snapshot"),reader);
            if (snapshot.revision<result.revision) throw invalid("task_reference_reply_revision");
            Bundle receipt=bundle(data,"queried_result");
            if (!receipt.isEmpty() && (query==null || request.action!=AtomicWorkbenchTaskReferenceRequest.Action.STATE
                    || !request.queryRequestId.equals(query.requestId))) throw invalid("task_reference_query_binding");
            queried=receipt.isEmpty()?null:AtomicWorkbenchTaskReferenceResult.fromBundle(receipt,query);
        }
    }
    private Scope scope;
    // This remains occupied across dialog dismissal and connection replacement until the worker actually returns.
    private Work running;
    private AtomicWorkbenchTaskReferenceSnapshot snapshot;
    private boolean available;
    private long version;
    private String notice="正在读取暂存记录…";
    private final LinkedHashMap<String,AtomicWorkbenchTaskReferenceRequest> unconfirmed=new LinkedHashMap<>();
    private int queryCursor, supersededUnknown;

    synchronized Scope bind(Object connection,long session,long reset) {
        if (connection==null) throw invalid("task_reference_connection");
        if (scope==null || scope.connection!=connection || scope.session!=session || scope.reset!=reset) {
            scope=new Scope(connection,session,reset); snapshot=null; available=false;
            unconfirmed.clear(); queryCursor=0; supersededUnknown=0; notice="正在读取暂存记录…"; version++;
        }
        return scope;
    }
    synchronized boolean current(Scope value) { return value==scope; }
    synchronized ViewState view(Scope value) {
        if(value!=scope) return new ViewState(null,false,running!=null,0,0,version,"工作台连接已变化，请重新打开。");
        return new ViewState(snapshot,available,running!=null,unconfirmed.size(),supersededUnknown,version,notice);
    }
    synchronized Work begin(Scope value,Selection selection) {
        if(value!=scope || running!=null) return null;
        if(selection!=null && (!available || !selection.matches(snapshot) || unconfirmed.size()>=MAX_UNCONFIRMED)) return null;
        AtomicWorkbenchTaskReferenceRequest query=null;
        if(!unconfirmed.isEmpty()) {
            var list=new ArrayList<>(unconfirmed.values()); query=list.get(Math.floorMod(queryCursor++,list.size()));
        }
        running=new Work(value,selection,query); notice=selection==null?"正在核实记录…":"正在核实所选任务…"; version++;
        return running;
    }
    private synchronized boolean owns(Work work) { return running==work && scope==work.scope; }
    private synchronized void accept(Work work,Reply reply) {
        if(!owns(work)) return;
        if(snapshot!=null && reply.snapshot.revision<snapshot.revision) throw invalid("task_reference_snapshot_regressed");
        available=reply.snapshot.success && (reply.result.request.action!=AtomicWorkbenchTaskReferenceRequest.Action.STATE
                || reply.result.status==AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT);
        // An unavailable empty reply is not evidence that all old responsibilities disappeared.
        if(available || snapshot==null || !reply.snapshot.entries.isEmpty()) snapshot=reply.snapshot;
        if(reply.queried!=null && reply.result.status==AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT) settle(reply.queried);
        if(reply.result.request.action!=AtomicWorkbenchTaskReferenceRequest.Action.STATE) settle(reply.result);
        version++;
    }
    private void settle(AtomicWorkbenchTaskReferenceResult result) {
        var pending=unconfirmed.get(result.request.requestId);
        if(pending!=null && pending.sameRequest(result.request)
                && (result.status==AtomicWorkbenchTaskReferenceResult.Status.REMOVED
                    || result.status==AtomicWorkbenchTaskReferenceResult.Status.REJECTED))
            unconfirmed.remove(result.request.requestId);
        if(result.status==AtomicWorkbenchTaskReferenceResult.Status.REMOVED) {
            // A later explicit action can resolve this exact reference. Its earlier request remains historically unknown.
            var iterator=unconfirmed.values().iterator();
            while(iterator.hasNext()) {
                var old=iterator.next(); var current=result.request;
                if(old.shelfId.equals(current.shelfId) && old.operationId.equals(current.operationId)
                        && old.identity.equals(current.identity) && old.sourceSlot==current.sourceSlot
                        && old.sourceSession.equals(current.sourceSession)) {
                    iterator.remove(); if(supersededUnknown<Integer.MAX_VALUE) supersededUnknown++;
                }
            }
        }
    }
    private synchronized boolean arm(Work work,AtomicWorkbenchTaskReferenceRequest request) {
        if(!owns(work) || unconfirmed.size()>=MAX_UNCONFIRMED) return false;
        work.mutation=request; work.sent=true; unconfirmed.put(request.requestId,request); version++;
        return true;
    }
    private synchronized void finish(Work work,String message,boolean failedRead) {
        if(running!=work) return;
        running=null;
        if(scope==work.scope) {
            if(failedRead) available=false;
            notice=message; version++;
        } else version++;
    }
    void rejected(Work work) { finish(work,"操作未提交，请稍后再试。",false); }

    /** One user action: one fresh read, then at most one selected mutation; STATE never resumes cleanup. */
    void run(Work work,Transport transport,BooleanSupplier gate) {
        String message="工作台状态已变化，操作未提交。";
        boolean failedRead=false;
        try {
            if(!owns(work) || !allowed(gate)) return;
            var read=AtomicWorkbenchTaskReferenceRequest.state(id(),work.query==null?"":work.query.requestId,SystemClock.elapsedRealtime());
            Reply fresh=new Reply(transport.exchange(read.toBundle()),read,work.query,reader);
            accept(work,fresh);
            if(!owns(work) || !allowed(gate)) return;
            if(fresh.result.status!=AtomicWorkbenchTaskReferenceResult.Status.SNAPSHOT) {
                message="暂时无法核实记录，请稍后刷新。"; return;
            }
            if(work.selection==null) {
                message=fresh.snapshot.success?"记录已刷新。":"暂时无法核实记录，已保留上次信息。";
                if(fresh.queried!=null) message=resultMessage(fresh.queried);
                return;
            }
            if(!work.selection.matches(fresh.snapshot)) { message="记录已变化，请刷新后重新选择。"; return; }
            long now=SystemClock.elapsedRealtime();
            var entry=work.selection.entry;
            var request=new AtomicWorkbenchTaskReferenceRequest(id(),work.selection.action,"",entry.shelfId,entry.operationId,
                    entry.identity,work.selection.revision,entry.sourceSlot,entry.sourceSession,now,
                    Math.addExact(now,AtomicWorkbenchTaskReferenceRequest.MAX_LIFETIME_MS));
            if(!allowed(gate) || !arm(work,request)) return;
            // Mark before calling Binder: exceptions here cannot distinguish a lost reply from an unsent call.
            Reply changed=new Reply(transport.exchange(request.toBundle()),request,null,reader);
            accept(work,changed); message=resultMessage(changed.result);
        } catch(Exception unavailable) {
            failedRead=true;
            message=work.sent?"操作结果尚未确认。刷新只核实结果，不会自动重发清理。":"暂时无法核实记录，请稍后刷新。";
        } finally { finish(work,message,failedRead); }
    }
    static String resultMessage(AtomicWorkbenchTaskReferenceResult result) {
        switch(result.status) {
            case REMOVED:return "已移除暂存记录。";
            case REJECTED:return "所选记录已变化或暂时不能清理，请刷新后重新选择。";
            case UNCONFIRMED:return "清理结果尚未确认，记录的清理责任会继续保留。";
            default:return "记录已刷新。";
        }
    }
    static boolean eligible(AtomicWorkbenchTaskReferenceSnapshot snapshot,AtomicWorkbenchTaskReferenceSnapshot.Entry entry,
            AtomicWorkbenchTaskReferenceRequest.Action action) {
        if(snapshot==null || !snapshot.success || entry==null || action==null) return false;
        boolean present=false;
        for(var current:snapshot.entries) if(sameEntry(current,entry)) { present=true; break; }
        return present && (action==AtomicWorkbenchTaskReferenceRequest.Action.FORGET?entry.forgettable:
                action==AtomicWorkbenchTaskReferenceRequest.Action.RELEASE_AND_FORGET&&entry.canReleaseAndForget);
    }
    static boolean sameEntry(AtomicWorkbenchTaskReferenceSnapshot.Entry a,AtomicWorkbenchTaskReferenceSnapshot.Entry b) {
        return a.shelfId.equals(b.shelfId) && a.operationId.equals(b.operationId) && a.identity.equals(b.identity)
                && a.sourceSlot==b.sourceSlot && a.sourceSession.equals(b.sourceSession) && a.phase.equals(b.phase)
                && a.disposition.equals(b.disposition) && a.leaseState.equals(b.leaseState) && a.leaseId.equals(b.leaseId)
                && a.hasResponsibility==b.hasResponsibility && a.pending==b.pending
                && a.forgettable==b.forgettable && a.canReleaseAndForget==b.canReleaseAndForget;
    }
    private static boolean allowed(BooleanSupplier gate) {
        try { return gate.getAsBoolean(); } catch(RuntimeException unavailable) { return false; }
    }
    private static String id() { return UUID.randomUUID().toString().replace("-",""); }
}
