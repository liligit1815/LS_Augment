package ls.augment.com;

import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Actual client/store/protocol with explicit persistent I/O and server-engine models; never calls su. */
public final class TestHideRootTransactions {
    static int passed,failed,assertions;
    static final String OWNER="12345678-1234-1234-1234-123456789abc",HASH="a".repeat(64);
    interface Case {void run() throws Exception;}
    static void check(boolean value,String message){assertions++;if(!value)throw new AssertionError(message);}
    static void test(String name,Case body){try{body.run();passed++;System.out.println("PASS client: "+name);}
        catch(Throwable failure){failed++;System.out.println("FAIL client: "+name);failure.printStackTrace(System.out);}}
    static RootShell.Result raw(int exit,String value){return new RootShell.Result(exit,value,false,
        new RootShell.CapturedOutput(value.getBytes(StandardCharsets.US_ASCII),true,false,false));}
    static RootShell.Result ok(){return new RootShell.Result(0,"",false);}
    static RootShell.Result bad(){return new RootShell.Result(75,"lost or denied",false);}
    static RootShell.Result framed(String body){return raw(0,"LSARTS1\n"+body+"\nLSARTS_END\n");}
    static String nonce(int value){return String.format(Locale.ROOT,"00000000-0000-0000-0000-%012x",value);}
    static HideRootClient.Identity identity(int i){return new HideRootClient.Identity(0,10,"org.example.app"+i,HASH,OWNER,0,100);}
    static List<HideRootClient.Identity> identities(int count){List<HideRootClient.Identity> r=new ArrayList<>();for(int i=0;i<count;i++)r.add(identity(i));return r;}

    /** Process-independent backing: atomic no-replace claim, immutable terminal, modeled sync acknowledgements. */
    static final class Disk implements HideRootPendingStore.Io {
        final Map<String,TreeMap<Integer,String>> claims=new HashMap<>();
        final Map<String,String> done=new HashMap<>();
        final List<HideRootPendingStore.Operation> operations=new ArrayList<>();
        String fail="";int failSlot=-1;boolean throwIo;
        java.util.function.Consumer<HideRootPendingStore.Operation> observe;
        synchronized String at(String key,int slot){return claims.getOrDefault(key,new TreeMap<>()).get(slot);}
        synchronized String terminal(String key,int slot){return done.get(key+":"+slot);}
        synchronized int count(){return claims.values().stream().mapToInt(Map::size).sum();}
        @Override public synchronized RootShell.Result run(HideRootPendingStore.Operation op){
            operations.add(op);if(observe!=null)observe.accept(op);if(throwIo)throw new IllegalStateException("modeled I/O");
            TreeMap<Integer,String> history=claims.computeIfAbsent(op.key,k->new TreeMap<>());
            boolean inject=failSlot<0||failSlot==op.slot;
            if(op.mode==HideRootPendingStore.Mode.READ){
                if(fail.equals("READ"))return bad();if(fail.equals("CORRUPT"))return framed("RECORD|garbage\nTERMINAL|-");
                if(history.isEmpty())return framed("EMPTY");var last=history.lastEntry();
                return framed("RECORD|"+last.getValue()+"\nTERMINAL|"+done.getOrDefault(op.key+":"+last.getKey(),"-"));
            }
            if(op.mode==HideRootPendingStore.Mode.CLAIM){
                if(inject&&fail.equals("CLAIM_BEFORE"))return bad();
                if(history.containsKey(op.slot))return bad();
                if(op.slot>0){String previous=history.get(op.slot-1),terminal=done.get(op.key+":"+(op.slot-1));
                    if(previous==null||!HideRootPendingStore.terminal(terminal)||!previous.split("\\|")[4].equals(op.record.split("\\|")[2]))return bad();}
                history.put(op.slot,op.record);
                if(inject&&(fail.equals("CLAIM_ACK")||fail.equals("CLAIM_SYNC")))return bad();
                return framed("CLAIMED|"+op.record);
            }
            if(!op.record.equals(history.get(op.slot)))return bad();
            if(inject&&fail.equals("FINISH_BEFORE"))return bad();
            String old=done.putIfAbsent(op.key+":"+op.slot,op.terminal);
            if(old!=null&&!old.equals(op.terminal))return bad();
            if(inject&&fail.equals("FINISH_ACK"))return bad();
            return framed("FINISHED|"+op.record+"|"+op.terminal);
        }
    }
    static final class Fixture {
        final Disk disk;final List<HideRootProtocol.Request> calls=Collections.synchronizedList(new ArrayList<>());
        final List<HideRecoveryJournal.Entry> journal=Collections.synchronizedList(new ArrayList<>());
        final AtomicInteger sequence=new AtomicInteger(),executions=new AtomicInteger();
        final Map<String,CompletableFuture<HideRootProtocol.Outcome>> deferred=new ConcurrentHashMap<>();
        volatile String wireFailure="",journalFailure="";volatile boolean permitValid=true,notReady;
        volatile int uncertainAt=-1;volatile HideRootProtocol.Outcome outcome=HideRootProtocol.Outcome.CHANGED;
        volatile HideRootServer server;
        Fixture(){this(new Disk());}Fixture(Disk disk){this.disk=disk;resetServer();}
        void resetServer(){server=new HideRootServer(8192,new HideRootServer.Engine(){
            public HideRootServer.Permit reserve(HideRootProtocol.Request r){return notReady?null:()->{if(!permitValid)throw new IllegalStateException("revoked");};}
            public CompletionStage<HideRootProtocol.Outcome> execute(HideRootProtocol.Request r,HideRootServer.Permit p){
                int n=executions.incrementAndGet();
                if(n==uncertainAt)return CompletableFuture.completedFuture(HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH);
                if(outcome==HideRootProtocol.Outcome.RUNNING){var future=new CompletableFuture<HideRootProtocol.Outcome>();deferred.put(r.nonce,future);return future;}
                return CompletableFuture.completedFuture(outcome);
            }},()->nonce(sequence.incrementAndGet()),0);}
        RootShell.Result run(HideRootProtocol.Request r){
            calls.add(r);HideRootProtocol.Reply reply=server.handle(0,r.args());
            if(r.verb==HideRootProtocol.Verb.HIDE){
                if(wireFailure.equals("THROW"))throw new IllegalStateException("after dispatch");
                if(wireFailure.equals("NULL"))return null;
                if(wireFailure.equals("LEGACY75"))return bad();
                if(wireFailure.equals("EMPTY75"))return raw(75,"");
                if(wireFailure.equals("TIMEOUT"))return new RootShell.Result(75,reply.encode(),true,new RootShell.CapturedOutput(reply.encode().getBytes(StandardCharsets.US_ASCII),true,false,false));
            }
            return raw(reply.exitCode(),reply.encode()+"\n");
        }
        RootShell.Result append(List<HideRecoveryJournal.Entry> entries){
            if(journalFailure.equals("BEFORE"))return bad();
            if(journalFailure.equals("THROW"))throw new IllegalStateException("journal");
            journal.addAll(entries);return journalFailure.equals("ACK")?bad():ok();
        }
        HideRootClient client(){return new HideRootClient(this::run,new HideRootPendingStore(disk),this::append);}
        HideRootClient.Attempt prepare(HideRootClient c,int count){var p=c.prepare(identities(count));check(p.attempt!=null,p.error);return p.attempt;}
        HideRootClient.Attempt durable(HideRootClient c,int count){var a=prepare(c,count);check(c.persistPrepared(a).isSuccess(),"durable prepare");return a;}
        long count(HideRootProtocol.Verb v){return calls.stream().filter(r->r.verb==v).count();}
        String gate(HideRootClient c){return c.beforeNewOperation(0,10,identity(0).packageName);}
    }
    static void join(Thread t)throws Exception{t.join(3000);check(!t.isAlive(),"thread timeout");}
    public static void main(String[] args)throws Exception{
        test("typed nonce survives LSARJ1 and normal terminal permits next independent request",()->{
            Fixture f=new Fixture();var c=f.client();var a=f.durable(c,1);String n=a.entries.get(0).operationId;
            check(f.journal.get(0).operationId.equals(n),"journal nonce changed");check(HideRecoveryJournal.parse(a.entries.get(0).encode()).encode().equals(a.entries.get(0).encode()),"LSARJ1 bytes changed");
            check(c.hide(a).isSuccess(),"normal result");check(!c.hide(a).isSuccess(),"repeat sent");
            check(f.gate(f.client()).isEmpty(),"terminal blocked new user request");
            var other=f.client();var b=f.durable(other,1);check(!n.equals(b.entries.get(0).operationId),"new request reused old nonce");
            check(other.hide(b).isSuccess()&&f.executions.get()==2&&f.disk.count()==2,"future request unavailable");
        });
        test("two clients prepare same tail and exactly one claims HIDE",()->{
            Fixture f=new Fixture();var a=f.client();var b=f.client();var aa=f.prepare(a,1);var bb=f.prepare(b,1);
            CountDownLatch go=new CountDownLatch(1);AtomicInteger winners=new AtomicInteger();List<Throwable> failures=Collections.synchronizedList(new ArrayList<>());
            Thread x=new Thread(()->{try{go.await();if(a.persistPrepared(aa).isSuccess()){winners.incrementAndGet();a.hide(aa);}}catch(Throwable t){failures.add(t);}});
            Thread y=new Thread(()->{try{go.await();if(b.persistPrepared(bb).isSuccess()){winners.incrementAndGet();b.hide(bb);}}catch(Throwable t){failures.add(t);}});
            x.start();y.start();go.countDown();join(x);join(y);
            check(failures.isEmpty()&&winners.get()==1&&f.count(HideRootProtocol.Verb.HIDE)==1&&f.executions.get()==1,"multiple claim winners");
            check(!a.persistPrepared(aa).isSuccess()&&!b.persistPrepared(bb).isSuccess(),"rearmed old attempt");
        });
        test("concurrent same Attempt launches only once",()->{
            Fixture f=new Fixture();var c=f.client();var a=f.durable(c,1);CountDownLatch go=new CountDownLatch(1);
            Runnable run=()->{try{go.await();c.hide(a);}catch(InterruptedException e){throw new AssertionError(e);}};
            Thread x=new Thread(run),y=new Thread(run);x.start();y.start();go.countDown();join(x);join(y);
            check(f.count(HideRootProtocol.Verb.HIDE)==1,"two sends");
        });
        for(String failure:List.of("CLAIM_BEFORE","CLAIM_ACK","CLAIM_SYNC"))test(failure+" cannot dispatch or reconstruct Attempt",()->{
            Fixture f=new Fixture();f.disk.fail=failure;var c=f.client();var a=f.prepare(c,1);
            check(!c.persistPrepared(a).isSuccess()&&!c.hide(a).isSuccess(),"unacknowledged claim sent");check(f.count(HideRootProtocol.Verb.HIDE)==0,"hide transport reached");
            check(!c.persistPrepared(a).isSuccess(),"claim retry rearmed");
            if(f.disk.count()>0){
                check(f.disk.terminal(HideRootPendingStore.key(0,10,identity(0).packageName),0)==null,"unacknowledged claim certified unsent");
                check(f.disk.operations.stream().noneMatch(op->op.mode==HideRootPendingStore.Mode.FINISH),"unacknowledged claim attempted terminal publication");
            }
        });
        test("claim ACK loss plus failed cleanup stays original-nonce STATUS after restart",()->{
            Fixture f=new Fixture();var io=new HideRootPendingStore.Io(){public RootShell.Result run(HideRootPendingStore.Operation op){if(op.mode==HideRootPendingStore.Mode.FINISH)return bad();f.disk.fail="CLAIM_ACK";return f.disk.run(op);}};
            var c=new HideRootClient(f::run,new HideRootPendingStore(io),f::append);var a=f.prepare(c,1);check(!c.persistPrepared(a).isSuccess(),"ACK loss accepted");
            String old=a.entries.get(0).operationId;f.disk.fail="";var restart=f.client();check(!f.gate(restart).isEmpty(),"reserved old claim bypassed");
            check(f.calls.get(f.calls.size()-1).verb==HideRootProtocol.Verb.STATUS&&old.equals(f.calls.get(f.calls.size()-1).nonce),"not old status");
            check(restart.prepare(identities(1)).attempt==null&&f.count(HideRootProtocol.Verb.HIDE)==0,"restart rearmed old claim");
        });
        for(String failure:List.of("BEFORE","ACK","THROW"))test("journal "+failure+" never HIDE",()->{
            Fixture f=new Fixture();f.journalFailure=failure;var c=f.client();var a=f.prepare(c,2);
            check(!c.persistPrepared(a).isSuccess()&&!c.hide(a).isSuccess(),"journal failure sent");
            check(f.count(HideRootProtocol.Verb.HIDE)==0,"sent before journal acknowledgement");
            for(var e:a.entries)check("LOCAL_NOT_SENT".equals(f.disk.terminal(HideRootPendingStore.key(e.userId,e.userSerial,e.packageName),0)),"unused tail retained forever");
        });
        for(String failure:List.of("THROW","NULL","LEGACY75","EMPTY75","TIMEOUT"))test("lost HIDE "+failure+" only queries old nonce after restart",()->{
            Fixture f=new Fixture();f.wireFailure=failure;var c=f.client();var a=f.durable(c,1);check(!c.hide(a).isSuccess(),"bad wire accepted");
            String n=a.entries.get(0).operationId;check(f.disk.terminal(HideRootPendingStore.key(0,10,identity(0).packageName),0)==null,"lost HIDE became terminal");
            f.wireFailure="";check(!f.gate(f.client()).isEmpty(),"same invocation silently retried");
            check(f.count(HideRootProtocol.Verb.HIDE)==1&&f.calls.get(f.calls.size()-1).nonce.equals(n),"restart resubmitted");
            check(f.gate(f.client()).isEmpty(),"verified CHANGED failed to release pending for future request");
        });
        for(HideRootProtocol.Outcome result:List.of(HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH,HideRootProtocol.Outcome.RUNNING))test(result+" cannot be erased by HIDDEN or identity drift",()->{
            Fixture f=new Fixture();f.outcome=result;var c=f.client();var a=f.durable(c,1);check(!c.hide(a).isSuccess(),"unknown success");
            for(int i=0;i<3;i++)check(!f.gate(f.client()).isEmpty(),"unknown gate passed");
            var drift=new HideRootClient.Identity(0,10,identity(0).packageName,"b".repeat(64),nonce(90),999,200);
            check(f.client().prepare(List.of(drift)).attempt==null,"owner/package change bypassed persistent gate");
            check(f.count(HideRootProtocol.Verb.PREPARE)==1&&f.count(HideRootProtocol.Verb.HIDE)==1,"unknown issued another mutation");
            for(var r:f.calls)if(r.verb==HideRootProtocol.Verb.STATUS)check(r.nonce.equals(a.entries.get(0).operationId),"changed nonce");
        });
        test("system-server restart UNKNOWN_NONCE retains original pending record",()->{
            Fixture f=new Fixture();f.outcome=HideRootProtocol.Outcome.UNKNOWN_AFTER_DISPATCH;var c=f.client();var a=f.durable(c,1);c.hide(a);f.resetServer();
            check(!f.gate(f.client()).isEmpty()&&f.client().prepare(identities(1)).attempt==null,"unknown nonce reset allows new hide");
            check(f.disk.terminal(HideRootPendingStore.key(0,10,identity(0).packageName),0)==null,"unknown tombstone lost");
        });
        test("RUNNING resolves by STATUS without resending",()->{
            Fixture f=new Fixture();f.outcome=HideRootProtocol.Outcome.RUNNING;var c=f.client();var a=f.durable(c,1);c.hide(a);
            f.deferred.get(a.entries.get(0).operationId).complete(HideRootProtocol.Outcome.CHANGED);
            check(!f.gate(f.client()).isEmpty()&&f.gate(f.client()).isEmpty(),"completion did not retire pending");
            check(f.executions.get()==1&&f.count(HideRootProtocol.Verb.HIDE)==1,"running retried");
        });
        test("partial batch preserves changed/unknown and closes never-sent tail",()->{
            Fixture f=new Fixture();f.uncertainAt=2;var c=f.client();var a=f.durable(c,4);check(!c.hide(a).isSuccess(),"partial failure accepted");
            check(f.count(HideRootProtocol.Verb.HIDE)==2,"continued after unknown");
            String[] expected={"CHANGED",null,"LOCAL_NOT_SENT","LOCAL_NOT_SENT"};
            for(int i=0;i<4;i++)check(Objects.equals(expected[i],f.disk.terminal(HideRootPendingStore.key(0,10,identity(i).packageName),0)),"wrong per-target terminal "+i);
            c.closeUnused(a);check(f.disk.terminal(HideRootPendingStore.key(0,10,identity(1).packageName),0)==null,"cleanup erased dispatched unknown");
        });
        test("live pre-dispatch cancellation releases future operation without sending",()->{
            Fixture f=new Fixture();var c=f.client();var a=f.durable(c,1);c.closeUnused(a);
            check(!c.hide(a).isSuccess()&&f.count(HideRootProtocol.Verb.HIDE)==0,"closed attempt sent");check(f.gate(f.client()).isEmpty(),"unused attempt permanently blocked");
        });
        test("close while journal persistence is blocked cannot arm afterward",()->{
            Fixture f=new Fixture();CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
            var c=new HideRootClient(f::run,new HideRootPendingStore(f.disk),entries->{entered.countDown();try{release.await();}catch(InterruptedException e){return bad();}return ok();});
            var a=f.prepare(c,1);Thread t=new Thread(()->c.persistPrepared(a));t.start();check(entered.await(2,TimeUnit.SECONDS),"journal not entered");
            c.closeUnused(a);release.countDown();join(t);check(!c.hide(a).isSuccess(),"cancelled persistence rearmed");check(f.count(HideRootProtocol.Verb.HIDE)==0,"cancelled sent");
        });
        test("terminal store failure retains pending despite typed CHANGED",()->{
            Fixture f=new Fixture();var c=f.client();var a=f.durable(c,1);f.disk.fail="FINISH_BEFORE";
            check(!c.hide(a).isSuccess()&&!f.gate(f.client()).isEmpty(),"terminal sync failure ignored");
            check(f.count(HideRootProtocol.Verb.HIDE)==1,"terminal persistence retried native");f.disk.fail="";
            check(!f.gate(f.client()).isEmpty()&&f.gate(f.client()).isEmpty(),"terminal recovery unavailable");
        });
        test("actual server NOT_READY proves no engine execution and closes nonce",()->{
            Fixture f=new Fixture();var c=f.client();var a=f.durable(c,1);f.permitValid=false;
            check(!c.hide(a).isSuccess()&&f.executions.get()==0,"not ready dispatched");
            check("NOT_READY".equals(f.disk.terminal(HideRootPendingStore.key(0,10,identity(0).packageName),0)),"typed no-dispatch not terminal");
        });
        for(String failure:List.of("READ","CORRUPT"))test("store "+failure+" rejects before PREPARE",()->{
            Fixture f=new Fixture();f.disk.fail=failure;check(f.client().prepare(identities(1)).attempt==null,"bad store accepted");check(f.calls.isEmpty(),"called server before store verified");
        });
        test("capacity 8192 reports bounded resource failure",()->{
            Fixture f=new Fixture();var e=new HideRecoveryJournal.Entry(nonce(8192),OWNER,0,0,10,identity(0).packageName,HASH,100,HideRecoveryJournal.Stage.PREPARED,"VISIBLE",0,false);
            String key=HideRootPendingStore.key(0,10,e.packageName);f.disk.claims.put(key,new TreeMap<>());f.disk.claims.get(key).put(8191,"LSARTX1|8191|"+nonce(8191)+"|"+e.encode());f.disk.done.put(key+":8191","CHANGED");
            check(f.client().prepare(identities(1)).error.contains("上限")&&f.calls.isEmpty(),"capacity overflow authorized");
        });
        test("PREPARE NOT_READY has no nonce and no automatic request loop",()->{
            Fixture f=new Fixture();f.notReady=true;var c=f.client();var p=c.prepare(identities(1));
            check(p.attempt==null&&p.error.contains("尚未就绪")&&f.disk.count()==0,"not-ready armed/durable fake nonce");
            check(c.prepare(identities(1)).attempt==null&&f.count(HideRootProtocol.Verb.PREPARE)==1,"automatic warmup flood");
        });
        System.out.println("CLIENT RESULT "+passed+" passed, "+failed+" failed, "+assertions+" assertions");if(failed>0)System.exit(1);
    }
}
