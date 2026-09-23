package ls.augment.com;
import java.util.*;
import java.util.concurrent.*;
import static ls.augment.com.TestHideRootTransactions.*;

/** Extracted real manager members; Android identity/state and process I/O are explicit models. */
class RootHideManager {
    final Object context=new Object();
    enum State {VISIBLE,HIDDEN,MISSING,ERROR}
    final Map<Target,State> actual=new LinkedHashMap<>();
    final HideRootClient rootTransactions=new HideRootClient(IntegrationIO::protocol,new HideRootPendingStore(IntegrationIO.disk),HideRecoveryJournal::append);
    static boolean isValidPackage(String value){return value.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+");}
    Map<Target,State> queryStates(Set<Target> values){
        if(IntegrationIO.queryInterleave!=null){Runnable run=IntegrationIO.queryInterleave;IntegrationIO.queryInterleave=null;run.run();}
        IntegrationIO.trace.add("query");Map<Target,State> out=new LinkedHashMap<>();
        for(Target t:values)out.put(t,actual.getOrDefault(t,State.VISIBLE));return out;
    }
    HideBatchExecutor.Outcome<Target> execute(Set<Target> values,boolean hide){return executeBatch(values,hide);}
    HideBatchExecutor.CommandResult record(Set<Target> values){return recordHide(values);}
    // @PRODUCTION_MEMBERS@
}
class AuditLog {static void write(Object context,String action,String message){IntegrationIO.trace.add("audit:"+action);}}
class HideRecoveryEmergency {static RootShell.Result install(){IntegrationIO.trace.add("emergency");return IntegrationIO.emergencyFailure?bad():ok();}}
class HideRecoveryIdentity {
    static final class Owner {final boolean success;final String id=OWNER,message="owner model";final int userId=0;Owner(boolean success){this.success=success;}}
    static final class Snapshot {final boolean success=true;final long userSerial;final String packageIdentity=HASH,message="identity model";Snapshot(long serial){userSerial=serial;}}
    static Owner owner(Object context){IntegrationIO.trace.add("owner");return new Owner(!IntegrationIO.ownerFailure);}
    static Snapshot read(Object context,RootHideManager.Target target){
        int count=IntegrationIO.identityReads.merge(target,1,Integer::sum);IntegrationIO.trace.add("identity");
        return new Snapshot(target.userSerial+(count==IntegrationIO.changeIdentityAt?1:0));
    }
}
class IntegrationIO {
    static TestHideRootTransactions.Disk disk;
    static final List<String> trace=new ArrayList<>();
    static final List<HideRecoveryJournal.Entry> durable=new ArrayList<>();
    static final Map<RootHideManager.Target,Integer> identityReads=new HashMap<>();
    static final List<HideRootProtocol.Request> calls=new ArrayList<>();
    static RootHideManager manager;static HideRootServer server;static int sequence,nativeCalls,changeIdentityAt;
    static String failStage="",failure="";static boolean ownerFailure,emergencyFailure,loseHideAck;
    static int unknownAt=-1;static Runnable queryInterleave;
    static void reset(){disk=new TestHideRootTransactions.Disk();trace.clear();durable.clear();identityReads.clear();calls.clear();
        sequence=nativeCalls=changeIdentityAt=0;failStage=failure="";ownerFailure=emergencyFailure=loseHideAck=false;unknownAt=-1;queryInterleave=null;
        server=new HideRootServer(8192,new HideRootServer.Engine(){
            public HideRootServer.Permit reserve(HideRootProtocol.Request r){return ()->{};}
            public CompletionStage<HideRootProtocol.Outcome> execute(HideRootProtocol.Request r,HideRootServer.Permit permit){
                nativeCalls++;manager.actual.put(new RootHideManager.Target(r.userId,r.serial,r.packageName),RootHideManager.State.HIDDEN);
                return CompletableFuture.completedFuture(nativeCalls==unknownAt?HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH:HideRootProtocol.Outcome.CHANGED);
            }},()->nonce(++sequence),0);
        manager=new RootHideManager();
    }
    static RootShell.Result protocol(HideRootProtocol.Request request){
        calls.add(request);trace.add(request.verb.name());HideRootProtocol.Reply reply=server.handle(0,request.args());
        return request.verb==HideRootProtocol.Verb.HIDE&&loseHideAck?bad():raw(reply.exitCode(),reply.encode()+"\n");
    }
    /** Only RootShell.run's process-launch overload is replaced; actual Journal.append validates this response. */
    static RootShell.Result run(String command,String stdin,long timeout,int maxOutput){
        check(command.equals(HideRecoveryJournal.command()),"unreviewed root command reached manager: "+command);
        List<HideRecoveryJournal.Entry> entries=new ArrayList<>();for(String line:stdin.split("\n")){var e=HideRecoveryJournal.parse(line);check(e!=null,"bad real LSARJ1 input");entries.add(e);}
        String stage=entries.get(0).stage.name();trace.add("persist:"+stage);
        if(stage.equals(failStage)){
            if(failure.equals("THROW"))throw new IllegalStateException("journal transport");
            if(failure.equals("BAD_MARKER"))return raw(0,"bad marker");
            if(failure.equals("TIMEOUT"))return new RootShell.Result(75,"timeout",true);
            return bad();
        }
        durable.addAll(entries);return raw(0,"LSA_RECOVERY_JOURNAL_OK");
    }
}
public class TestHideManagerRecording {
    static Set<RootHideManager.Target> targets(int count){Set<RootHideManager.Target> values=new LinkedHashSet<>();for(int i=0;i<count;i++)values.add(new RootHideManager.Target(i%2==0?0:12,1000L+(i%2==0?0:12),"org.example.app"+i));return values;}
    static void scenario(String name,Case body){test("actual manager "+name,()->{IntegrationIO.reset();body.run();});}
    public static void main(String[] args){
        scenario("normal server nonce through claim/journal/HIDE and immutable observations",()->{
            var t=targets(2);var result=IntegrationIO.manager.execute(t,true);check(result.success.equals(t),"normal manager hide failed "+result.failures);
            check(IntegrationIO.nativeCalls==2&&IntegrationIO.durable.size()==4,"wrong per-target count");
            for(int i=0;i<2;i++){var e=IntegrationIO.durable.get(i);check(e.operationId.equals(IntegrationIO.calls.get(i).nonce==null?nonce(i+1):IntegrationIO.calls.get(i).nonce),"server-issued nonce lost");
                check(IntegrationIO.durable.get(i+2).operationId.equals(e.operationId),"observation nonce changed");}
            int journal=IntegrationIO.trace.indexOf("persist:PREPARED"),hide=IntegrationIO.trace.indexOf("HIDE");check(journal>=0&&hide>journal,"HIDE before journal");
            check(IntegrationIO.manager.execute(t,true).success.equals(t)&&IntegrationIO.nativeCalls==2,"already hidden issued another mutation");
            for(var target:t)IntegrationIO.manager.actual.put(target,RootHideManager.State.VISIBLE);
            check(IntegrationIO.manager.execute(t,true).success.equals(t)&&IntegrationIO.nativeCalls==4,"terminal history wrongly treated as current hidden or permanent refusal");
        });
        scenario("owner failure before prepare",()->{IntegrationIO.ownerFailure=true;check(IntegrationIO.manager.record(targets(1)).stop&&IntegrationIO.calls.isEmpty(),"owner unavailable sent");});
        scenario("emergency safety failure stops all batches",()->{IntegrationIO.emergencyFailure=true;var out=IntegrationIO.manager.execute(targets(20),true);check(out.success.isEmpty()&&out.failures.size()==20&&IntegrationIO.calls.isEmpty(),"unsafe emergency bypass");});
        scenario("preexisting hidden with no pending performs no preparation",()->{var ts=targets(2);for(var t:ts)IntegrationIO.manager.actual.put(t,RootHideManager.State.HIDDEN);check(IntegrationIO.manager.execute(ts,true).success.equals(ts)&&IntegrationIO.calls.isEmpty()&&IntegrationIO.durable.isEmpty(),"normal hidden no-op changed");});
        for(String stage:List.of("PREPARED","OBSERVED"))for(String fault:List.of("DENIED","TIMEOUT","THROW","BAD_MARKER"))scenario("real Journal "+stage+" "+fault+" stops batch",()->{
            IntegrationIO.failStage=stage;IntegrationIO.failure=fault;var out=IntegrationIO.manager.execute(targets(20),true);
            check(out.success.isEmpty()&&out.failures.size()==20,"unconfirmed journal success");
            check(IntegrationIO.nativeCalls==(stage.equals("PREPARED")?0:8),"unexpected retry/native count");
        });
        scenario("pre-dispatch serial mismatch closes unused claims",()->{
            IntegrationIO.changeIdentityAt=2;var ts=targets(1);check(IntegrationIO.manager.execute(ts,true).success.isEmpty()&&IntegrationIO.nativeCalls==0,"identity changed sent");
            var t=ts.iterator().next();check("LOCAL_NOT_SENT".equals(IntegrationIO.disk.terminal(HideRootPendingStore.key(t.userId,t.userSerial,t.packageName),0)),"unused claim permanently retained");
            IntegrationIO.changeIdentityAt=0;check(IntegrationIO.manager.execute(ts,true).success.equals(ts),"future safe operation refused");
        });
        scenario("unknown then HIDDEN cannot erase old nonce across new manager",()->{
            IntegrationIO.unknownAt=1;var ts=targets(1);check(IntegrationIO.manager.execute(ts,true).success.isEmpty(),"unknown immediate success");
            String original=IntegrationIO.calls.stream().filter(r->r.verb==HideRootProtocol.Verb.HIDE).findFirst().orElseThrow().nonce;
            IntegrationIO.manager=new RootHideManager();for(var t:ts)IntegrationIO.manager.actual.put(t,RootHideManager.State.HIDDEN);
            check(IntegrationIO.manager.execute(ts,true).success.isEmpty(),"hidden shortcut erased unknown");
            check(IntegrationIO.nativeCalls==1&&IntegrationIO.calls.get(IntegrationIO.calls.size()-1).nonce.equals(original),"new manager retried");
        });
        scenario("B sees empty then A claims unknown before B HIDDEN snapshot",()->{
            var ts=targets(1);var target=ts.iterator().next();IntegrationIO.unknownAt=1;
            IntegrationIO.queryInterleave=()->{
                var other=new HideRootClient(IntegrationIO::protocol,new HideRootPendingStore(IntegrationIO.disk),HideRecoveryJournal::append);
                var identity=new HideRootClient.Identity(target.userId,target.userSerial,target.packageName,HASH,OWNER,0,1);
                var attempt=other.prepare(List.of(identity)).attempt;check(attempt!=null&&other.persistPrepared(attempt).isSuccess(),"interleaved A prepare");other.hide(attempt);
            };
            var out=IntegrationIO.manager.execute(ts,true);check(out.success.isEmpty()&&out.failures.size()==1,"stale empty gate accepted HIDDEN");
            check(IntegrationIO.nativeCalls==1&&IntegrationIO.calls.stream().filter(r->r.verb==HideRootProtocol.Verb.HIDE).count()==1,"B sent extra HIDE");
        });
        scenario("partial batch unknown preserves later LOCAL_NOT_SENT entries",()->{
            IntegrationIO.unknownAt=2;var out=IntegrationIO.manager.execute(targets(20),true);
            check(out.success.isEmpty()&&out.failures.size()==20&&IntegrationIO.nativeCalls==2,"partial batch continued");
            check(IntegrationIO.durable.size()==16,"original PREPARED/OBSERVED records lost");
            long local=IntegrationIO.disk.done.values().stream().filter("LOCAL_NOT_SENT"::equals).count();check(local==6,"unused batch tail not closed");
        });
        scenario("three ordinary batch groups all use new finite protocol",()->{check(IntegrationIO.manager.execute(targets(20),true).success.size()==20&&IntegrationIO.nativeCalls==20&&IntegrationIO.durable.size()==40,"later batches bypassed");});
        scenario("show remains blocked by separate ownership review",()->{check(IntegrationIO.manager.execute(targets(2),false).success.isEmpty()&&IntegrationIO.calls.isEmpty(),"recovery scope widened");});
        System.out.println("MANAGER RESULT "+passed+" passed, "+failed+" failed, "+assertions+" assertions");if(failed>0)System.exit(1);
    }
}
