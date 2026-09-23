package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/** Durable finite Root client. Recovery can query an old nonce, never arm another HIDE. */
final class HideRootClient {
    interface Runner { RootShell.Result run(HideRootProtocol.Request request); }
    interface Journal { RootShell.Result append(List<HideRecoveryJournal.Entry> entries); }
    private final Runner runner;
    private final HideRootPendingStore store;
    private final HideRestoreGrantStore restoreStore;
    private final Journal journal;
    private static volatile long prepareNotBeforeNanos;
    HideRootClient(){this(request->RootShell.run(request.command(),null,15,1024),new HideRootPendingStore(),HideRecoveryJournal::append);}
    HideRootClient(Runner runner,HideRootPendingStore store,Journal journal){
        this(runner,store,journal,new HideRestoreGrantStore());
    }
    HideRootClient(Runner runner,HideRootPendingStore store,Journal journal,HideRestoreGrantStore restoreStore){
        if(runner==null||store==null||journal==null||restoreStore==null)throw new IllegalArgumentException("Missing transaction transport");
        this.runner=runner;this.store=store;this.journal=journal;this.restoreStore=restoreStore;
    }
    static final class Identity {
        final int userId,ownerUserId;final long serial,createdAt;
        final String packageName,packageIdentity,ownerId;
        Identity(int userId,long serial,String packageName,String packageIdentity,String ownerId,int ownerUserId,long createdAt){
            new HideRootProtocol.Request(HideRootProtocol.Verb.PREPARE,userId,serial,packageName,null);
            new HideRecoveryJournal.Entry(ownerId,ownerId,ownerUserId,userId,serial,packageName,packageIdentity,
                createdAt,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
            if("unknown".equals(packageIdentity))throw new IllegalArgumentException("Unknown package identity");
            this.userId=userId;this.serial=serial;this.packageName=packageName;this.packageIdentity=packageIdentity;
            this.ownerId=ownerId;this.ownerUserId=ownerUserId;this.createdAt=createdAt;
        }
    }
    static final class Preparation {
        final Attempt attempt;final String error;
        Preparation(Attempt attempt,String error){this.attempt=attempt;this.error=error;}
    }
    static final class Attempt {
        final List<HideRecoveryJournal.Entry> entries;
        private final HideRootClient client;
        private final List<HideRootPendingStore.Snapshot> slots;
        private final List<HideRootPendingStore.Claim> claims=new ArrayList<>();
        private int phase; // new -> persisting -> durable -> claimed/closed; never reconstructed from disk.
        private Attempt(HideRootClient client,List<HideRecoveryJournal.Entry> entries,List<HideRootPendingStore.Snapshot> slots){
            this.client=client;this.entries=Collections.unmodifiableList(new ArrayList<>(entries));this.slots=new ArrayList<>(slots);
        }
    }
    static final class Exchange {
        final RootShell.Result transport;final HideRootProtocol.Reply reply;
        Exchange(RootShell.Result transport,HideRootProtocol.Reply reply){this.transport=transport;this.reply=reply;}
    }
    static final class RestorePreparation {
        final RestoreAttempt attempt; final String error;
        RestorePreparation(RestoreAttempt attempt,String error){this.attempt=attempt;this.error=error;}
    }
    /** Disk evidence can never construct this single-use sending capability. */
    static final class RestoreAttempt {
        final HideRecoveryJournal.Entry entry;
        private final HideRootClient client;
        private HideRestoreGrantLedger.Grant grant;
        private HideRestoreGrantStore.Claim claim;
        private int phase;
        private RestoreAttempt(HideRootClient client,HideRecoveryJournal.Entry entry,HideRestoreGrantLedger.Grant grant){
            this.client=client;this.entry=entry;this.grant=grant;
        }
    }

    /** Must run before a caller treats a later HIDDEN snapshot as success. Empty means no pending operation. */
    String beforeNewOperation(int userId,long serial,String packageName){
        HideRootPendingStore.Snapshot snapshot=store.read(userId,serial,packageName);
        return pendingProblem(snapshot);
    }
    private String pendingProblem(HideRootPendingStore.Snapshot snapshot){
        if(!snapshot.error.isEmpty())return snapshot.error;
        if(snapshot.pending==null)return "";
        Exchange observation=snapshot.pending.restoring()?restoreStatus(snapshot.pending.entry):status(snapshot.pending.entry);
        if(observation.reply!=null&&store.finishReply(snapshot.pending,observation.reply))
            return "已核对前一次事务并保留结果；本次没有发送状态修改，请重新发起新的操作";
        return "前一次操作结果仍未确认，已仅查询原事务编号并保留记录；未发送新的状态修改";
    }

    Preparation prepare(List<Identity> input){
        if(input==null||input.isEmpty()||input.size()>8)return failed("隐藏准备批次无效，未执行隐藏");
        List<Identity> identities=new ArrayList<>(input);Set<String> targets=new HashSet<>();
        for(Identity identity:identities)if(identity==null||!targets.add(identity.userId+":"+identity.packageName))
            return failed("隐藏目标无效或重复，未执行隐藏");
        List<HideRootPendingStore.Snapshot> slots=new ArrayList<>();
        for(Identity identity:identities){
            HideRootPendingStore.Snapshot slot=store.read(identity.userId,identity.serial,identity.packageName);
            String problem=pendingProblem(slot);if(!problem.isEmpty())return failed(problem);
            if(!slot.available())return failed("该目标隐藏事务历史已达上限，原记录继续保留；仍可核对或恢复已有隐藏");
            slots.add(slot);
        }
        long backoff=prepareNotBeforeNanos;
        if(backoff!=0&&backoff-System.nanoTime()>0)return failed("系统事务入口正在准备，请稍后再试；本次未发送隐藏");
        List<HideRecoveryJournal.Entry> entries=new ArrayList<>();Set<String> nonces=new HashSet<>();
        for(Identity identity:identities){
            Exchange exchange=exchange(new HideRootProtocol.Request(HideRootProtocol.Verb.PREPARE,identity.userId,identity.serial,identity.packageName,null));
            if(exchange.reply!=null&&exchange.reply.outcome==HideRootProtocol.Outcome.NOT_READY){
                prepareNotBeforeNanos=System.nanoTime()+2_000_000_000L;
                return failed("系统事务入口尚未就绪，请稍后再试；本次未发送隐藏");
            }
            if(exchange.reply==null||exchange.reply.outcome!=HideRootProtocol.Outcome.RESERVED||!nonces.add(exchange.reply.nonce))
                return failed("操作准备未确认，未执行隐藏");
            entries.add(new HideRecoveryJournal.Entry(exchange.reply.nonce,identity.ownerId,identity.ownerUserId,
                identity.userId,identity.serial,identity.packageName,identity.packageIdentity,identity.createdAt,
                HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false));
        }
        return new Preparation(new Attempt(this,entries,slots),"");
    }

    RootShell.Result persistPrepared(Attempt attempt){
        if(attempt==null||attempt.client!=this)return failure("准备记录不属于本次操作，未执行隐藏",false);
        synchronized(attempt){if(attempt.phase!=0)return failure("准备记录已使用，不能重新执行",false);attempt.phase=1;}
        RootShell.Result saved=null;boolean durable=false;
        try{
            for(int i=0;i<attempt.entries.size();i++){
                HideRootPendingStore.Claim claim=store.claim(attempt.slots.get(i),attempt.entries.get(i));attempt.claims.add(claim);
                if(!claim.acknowledged)return failure(claim.error,false);
            }
            saved=journal.append(attempt.entries);durable=saved!=null&&saved.isSuccess();
            return saved==null?failure("准备记录保存结果未确认，未执行隐藏",false):saved;
        }catch(RuntimeException uncertain){return failure("准备记录保存结果未确认，未执行隐藏",false);}
        finally{
            synchronized(attempt){attempt.phase=durable&&attempt.phase==1?2:3;durable=attempt.phase==2;}
            if(!durable)finishUnsent(attempt,0);
        }
    }

    /** Claim before any process launch. No retry, PREPARE or restoration from disk is possible here. */
    RootShell.Result hide(Attempt attempt){
        if(attempt==null||attempt.client!=this)return failure("准备记录不属于本次操作，未执行隐藏",false);
        synchronized(attempt){
            if(attempt.phase!=2){attempt.phase=3;return failure("没有可执行的准备记录，请保留记录并核对本次操作状态",false);}
            attempt.phase=3;
        }
        for(int i=0;i<attempt.entries.size();i++){
            HideRootPendingStore.Claim claim=attempt.claims.get(i);
            try{claim.markDispatched();}
            catch(RuntimeException rejected){finishUnsent(attempt,i);return failure("事务已使用或未获持久确认，未重新发送",false);}
            Exchange exchange=exchange(request(HideRootProtocol.Verb.HIDE,attempt.entries.get(i)));
            boolean recorded=exchange.reply!=null&&store.finishReply(claim.record,exchange.reply);
            if(exchange.reply==null||!exchange.reply.mutationSuccess()||!recorded){
                finishUnsent(attempt,i+1);
                return failure("执行结果或结果持久化未确认，已停止后续目标；后续仅查询原事务编号",
                    exchange.transport!=null&&exchange.transport.timedOut);
            }
        }
        // Typed protocol ACKs and durable terminal records have been checked. This is not wire capture.
        return new RootShell.Result(0,"",false);
    }
    private void finishUnsent(Attempt attempt,int first){
        for(int i=first;i<attempt.claims.size();i++)store.finishNotSent(attempt.claims.get(i));
    }
    /** Cancels only this still-live, unused attempt after a failed pre-dispatch identity/state check. */
    void closeUnused(Attempt attempt){
        if(attempt==null||attempt.client!=this)return;
        synchronized(attempt){
            if(attempt.phase==3)return; // A HIDE owner may be between batch members.
            int previous=attempt.phase;attempt.phase=3;
            if(previous==1)return; // The persister closes its own claims in finally.
        }
        finishUnsent(attempt,0);
    }
    Exchange status(HideRecoveryJournal.Entry entry){return exchange(request(HideRootProtocol.Verb.STATUS,entry));}

    RestorePreparation prepareRestore(Identity identity,HideRecoveryJournal.Entry source){
        if(identity==null||source==null||source.stage!=HideRecoveryJournal.Stage.PREPARED
                ||HideRecoveryJournal.parse(source.encode())==null||identity.userId!=source.userId
                ||identity.serial!=source.userSerial||!identity.packageName.equals(source.packageName)
                ||!identity.packageIdentity.equals(source.packageIdentity))
            return new RestorePreparation(null,"隐藏前记录与当前目标不匹配，未准备恢复");
        HideRootPendingStore.Snapshot slot=store.read(identity.userId,identity.serial,identity.packageName);
        String problem=pendingProblem(slot);if(!problem.isEmpty())return new RestorePreparation(null,problem);
        Exchange exchange=exchange(HideRootProtocol.Request.prepareRecovery(
                identity.userId,identity.serial,identity.packageName,source.operationId,UUID.randomUUID().toString()));
        if(exchange.reply==null||exchange.reply.outcome!=HideRootProtocol.Outcome.RESERVED
                ||exchange.reply.grant==null||exchange.reply.proof==null
                ||source.operationId.equals(exchange.reply.nonce))
            return new RestorePreparation(null,exchange.reply!=null&&exchange.reply.proof!=null
                    ?"已有恢复事务的系统状态为 "+exchange.reply.outcome+"；本次未获得新的执行授权，原记录继续保留"
                    :"系统未确认这次隐藏仍可恢复；可能已重启、改动或失效，原记录继续保留");
        HideRecoveryJournal.Entry prepared=new HideRecoveryJournal.Entry(exchange.reply.nonce,identity.ownerId,
                identity.ownerUserId,identity.userId,identity.serial,identity.packageName,identity.packageIdentity,
                identity.createdAt,HideRecoveryJournal.Stage.RESTORE_PREPARED,"HIDDEN",0,false,source.operationId,exchange.reply.proof);
        return new RestorePreparation(new RestoreAttempt(this,prepared,exchange.reply.grant),"");
    }
    RootShell.Result persistPrepared(RestoreAttempt attempt){
        if(attempt==null||attempt.client!=this)return failure("恢复准备不属于本次操作",false);
        synchronized(attempt){if(attempt.phase!=0)return failure("恢复准备已使用，未重新发送",false);attempt.phase=1;}
        boolean durable=false;
        try{
            attempt.claim=restoreStore.claim(attempt.entry);
            if(!attempt.claim.acknowledged)return failure(attempt.claim.error,false);
            RootShell.Result result=journal.append(List.of(attempt.entry));durable=result!=null&&result.isSuccess();
            return durable?result:failure("恢复前记录未获持久确认，未发送恢复",false);
        }catch(RuntimeException failure){return failure("恢复前记录保存结果未确认，未发送恢复",false);}
        finally{
            synchronized(attempt){attempt.phase=durable&&attempt.phase==1?2:3;durable=attempt.phase==2;if(!durable)attempt.grant=null;}
            if(!durable&&attempt.claim!=null)restoreStore.finishNotSent(attempt.claim);
        }
    }
    RootShell.Result restore(RestoreAttempt attempt){
        if(attempt==null||attempt.client!=this)return failure("恢复准备不属于本次操作",false);
        HideRestoreGrantLedger.Grant grant;
        synchronized(attempt){
            if(attempt.phase!=2||attempt.grant==null){attempt.phase=3;attempt.grant=null;return failure("没有本次可执行的恢复记录，未重新发送",false);}
            attempt.phase=3;grant=attempt.grant;attempt.grant=null;
        }
        try{attempt.claim.markDispatched();}
        catch(RuntimeException rejected){restoreStore.finishNotSent(attempt.claim);return failure("恢复事务已使用或未获持久确认",false);}
        Exchange exchange=exchange(HideRootProtocol.Request.recover(grant));
        boolean recorded=exchange.reply!=null&&restoreStore.finishReply(attempt.entry,exchange.reply);
        boolean restored=exchange.reply!=null&&exchange.reply.outcome==HideRootProtocol.Outcome.RESTORED;
        boolean observed=false;
        try{
            RootShell.Result saved=journal.append(List.of(attempt.entry.observed(restored?"VISIBLE":"ERROR",
                    exchange.transport==null?75:exchange.transport.exitCode,exchange.transport==null||exchange.transport.timedOut)));
            observed=saved!=null&&saved.isSuccess();
        }catch(RuntimeException retained){/* The durable PREPARED/claim remains available for status only. */}
        if(restored&&recorded&&observed)return new RootShell.Result(0,"已恢复本次隐藏；结果与恢复记录已核对保存",false);
        return failure(restored?"系统已报告恢复完成，但结果记录尚未全部确认；请只核对这次恢复结果，不要重复发送"
                :"恢复结果未确认或已被系统拒绝；记录已保留，后续只核对原事务编号",
                exchange.transport!=null&&exchange.transport.timedOut);
    }
    void closeUnused(RestoreAttempt attempt){
        if(attempt==null||attempt.client!=this)return;
        synchronized(attempt){if(attempt.phase==3)return;int previous=attempt.phase;attempt.phase=3;attempt.grant=null;if(previous==1)return;}
        if(attempt.claim!=null)restoreStore.finishNotSent(attempt.claim);
    }
    Exchange restoreStatus(HideRecoveryJournal.Entry entry){return exchange(restoreRequest(HideRootProtocol.Verb.RESTORE_STATUS,entry));}
    RootShell.Result recheckRestore(HideRecoveryJournal.Entry entry){
        // Re-reading evidence permits only STATUS. It never constructs RestoreAttempt.
        HideRootProtocol.Request request=restoreRequest(HideRootProtocol.Verb.RESTORE_STATUS,entry);
        if(entry.recoveryProof!=null) {
            HideRestoreGrantStore.Snapshot snapshot=restoreStore.read(entry);
            if(!snapshot.error.isEmpty())return failure(snapshot.error,false);
            Exchange result=exchange(request);
            if(result.reply==null)return failure("这次恢复结果仍未确认，原记录已保留；未重新发送恢复",result.transport!=null&&result.transport.timedOut);
            boolean recorded=restoreStore.finishReply(entry,result.reply);
            if(result.reply.outcome==HideRootProtocol.Outcome.RESTORED)
                return recorded?new RootShell.Result(0,"系统确认这次恢复已经完成；本次仅查询原事务，未再修改状态",false)
                        :failure("系统确认恢复已经完成，但持久结果尚未确认；原记录保留，未重新发送恢复",false);
            return failure("这次恢复的系统状态为 "+result.reply.outcome+"；原记录保留，未重新发送恢复",false);
        }
        HideRootPendingStore.Snapshot snapshot=store.read(entry.userId,entry.userSerial,entry.packageName);
        if(!snapshot.error.isEmpty())return failure(snapshot.error,false);
        Exchange result=exchange(request);
        if(result.reply==null)return failure("这次恢复结果仍未确认，原记录已保留；未重新发送恢复",result.transport!=null&&result.transport.timedOut);
        boolean exactPending=snapshot.pending!=null&&snapshot.pending.entry.encode().equals(entry.encode());
        if(exactPending&&!store.finishReply(snapshot.pending,result.reply))
            return failure("这次恢复仍在执行、状态未知或结果保存未确认；未重新发送恢复",false);
        if(result.reply.outcome==HideRootProtocol.Outcome.RESTORED)
            return new RootShell.Result(0,"系统确认这次恢复已经完成；本次仅查询原事务，未再修改状态",false);
        return failure("这次恢复的系统状态为 "+result.reply.outcome+"；原记录保留，未重新发送恢复",false);
    }
    private HideRootProtocol.Request restoreRequest(HideRootProtocol.Verb verb,HideRecoveryJournal.Entry entry){
        if(entry==null||entry.stage!=HideRecoveryJournal.Stage.RESTORE_PREPARED
                ||HideRecoveryJournal.parse(entry.encode())==null
                ||verb!=HideRootProtocol.Verb.RESTORE&&verb!=HideRootProtocol.Verb.RESTORE_STATUS)
            throw new IllegalArgumentException("Invalid restore journal entry");
        if(entry.recoveryProof!=null) {
            if(verb!=HideRootProtocol.Verb.RESTORE_STATUS)throw new IllegalArgumentException("Disk proof cannot execute recovery");
            return HideRootProtocol.Request.recoveryStatus(entry.recoveryProof);
        }
        return new HideRootProtocol.Request(verb,entry.userId,entry.userSerial,entry.packageName,entry.operationId,entry.sourceHideNonce);
    }
    private HideRootProtocol.Request request(HideRootProtocol.Verb verb,HideRecoveryJournal.Entry entry){
        if((verb!=HideRootProtocol.Verb.HIDE&&verb!=HideRootProtocol.Verb.STATUS)||entry==null||HideRecoveryJournal.parse(entry.encode())==null
                ||entry.stage!=HideRecoveryJournal.Stage.PREPARED&&entry.stage!=HideRecoveryJournal.Stage.OBSERVED)
            throw new IllegalArgumentException("Invalid hide journal entry");
        return new HideRootProtocol.Request(verb,entry.userId,entry.userSerial,entry.packageName,entry.operationId);
    }
    private Exchange exchange(HideRootProtocol.Request request){
        RootShell.Result result;
        try{result=runner.run(request);}catch(RuntimeException error){result=failure("请求传输异常，执行结果未确认",true);}
        return new Exchange(result,HideRootProtocol.parse(request,result));
    }
    private static Preparation failed(String message){return new Preparation(null,message);}
    private static RootShell.Result failure(String message,boolean timeout){return new RootShell.Result(75,message,timeout);}
}
