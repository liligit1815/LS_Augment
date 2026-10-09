package ls.augment.com;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/** Exercises the real pure policy and fence; no Android runtime or personal data. */
public final class TestLauncherResetPolicy {
    private static final String NONCE="01234567-89ab-cdef-0123-456789abcdef",OTHER="abcdef01-2345-6789-abcd-ef0123456789";
    private static final String CHECKSUM="a".repeat(64),PACKAGE=LauncherResetPolicy.PACKAGE;
    private static int assertions,cases;
    private static void check(boolean value,String message){assertions++;if(!value)throw new AssertionError(message);}
    private static LauncherResetPolicy.Request request(){return new LauncherResetPolicy.Request(NONCE,0,4,10376,20415,77,CHECKSUM,1000,21000,5);}
    private static LauncherResetPolicy.Request change(String nonce,int user,long serial,int uid,int version,long revision,String checksum,long start,long expiry,long generation){
        return new LauncherResetPolicy.Request(nonce,user,serial,uid,version,revision,checksum,start,expiry,generation);
    }
    private static boolean matches(LauncherResetPolicy.Request r,String nonce,int user,long serial,int version,long revision,String checksum,long generation,long now){
        return LauncherResetPolicy.matches(r,nonce,user,serial,version,revision,checksum,generation,now);
    }
    private static void validity(){
        cases++;LauncherResetPolicy.Request r=request();
        check(LauncherResetPolicy.valid(r,1000),"Created boundary valid");
        check(LauncherResetPolicy.valid(r,20999),"Last TTL millisecond valid");
        check(!LauncherResetPolicy.valid(r,21000),"Expiry boundary rejected");
        check(!LauncherResetPolicy.valid(r,999),"Future creation rejected");
        check(!LauncherResetPolicy.valid(null,1000),"Null request rejected");
        for(String nonce:new String[]{null,"","bad",NONCE.toUpperCase(),NONCE+"x","0123456789abcdef0123456789abcdef"})
            check(!LauncherResetPolicy.valid(change(nonce,0,4,10376,20415,77,CHECKSUM,1000,21000,5),1000),"Malformed nonce rejected");
        for(String hash:new String[]{null,"","a".repeat(63),"a".repeat(65),"A".repeat(64),"g".repeat(64)})
            check(!LauncherResetPolicy.valid(change(NONCE,0,4,10376,20415,77,hash,1000,21000,5),1000),"Malformed checksum rejected");
        for(LauncherResetPolicy.Request invalid:new LauncherResetPolicy.Request[]{
                change(NONCE,-1,4,10376,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,100000,4,10376,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,1,4,10376,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,-1,10376,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,(long)Integer.MAX_VALUE+1,10376,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,1000,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,1,4,100999,20415,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,10376,0,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,10376,-1,77,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,10376,20415,0,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,10376,20415,-1,CHECKSUM,1000,21000,5),
                change(NONCE,0,4,10376,20415,77,CHECKSUM,-1,1000,5),
                change(NONCE,0,4,10376,20415,77,CHECKSUM,1000,1000,5),
                change(NONCE,0,4,10376,20415,77,CHECKSUM,1000,21001,5),
                change(NONCE,0,4,10376,20415,77,CHECKSUM,1000,21000,0)})
            check(!LauncherResetPolicy.valid(invalid,1000),"Invalid identity/time/version/revision rejected");
        check(LauncherResetPolicy.valid(change(NONCE,12,44,1210376,20415,77,CHECKSUM,0,20000,5),0),"Multi-user identity accepted");
    }
    private static void callers(){
        cases++;LauncherResetPolicy.Request r=request();
        check(LauncherResetPolicy.caller(r,10376,PACKAGE,new String[]{PACKAGE}),"Exact caller accepted");
        check(!LauncherResetPolicy.caller(null,10376,PACKAGE,new String[]{PACKAGE}),"Absent request rejected");
        for(int uid:new int[]{0,1000,10377,110376,-1})
            check(!LauncherResetPolicy.caller(r,uid,PACKAGE,new String[]{PACKAGE}),"Wrong UID rejected");
        for(String name:new String[]{null,"","another.package",PACKAGE+"x"})
            check(!LauncherResetPolicy.caller(r,10376,name,new String[]{PACKAGE}),"Calling package must be exact");
        for(String[] names:new String[][]{null,new String[0],new String[]{null},new String[]{"another.package"},
                new String[]{PACKAGE,"another.package"},new String[]{PACKAGE,PACKAGE}})
            check(!LauncherResetPolicy.caller(r,10376,PACKAGE,names),"Missing/shared UID inventory rejected");
    }
    private static void requestBinding(){
        cases++;LauncherResetPolicy.Request r=request();
        check(matches(r,NONCE,0,4,20415,77,CHECKSUM,5,1000),"Full request binding accepted");
        check(!matches(r,OTHER,0,4,20415,77,CHECKSUM,5,1000),"Old/new nonce mismatch rejected");
        check(!matches(r,NONCE,1,4,20415,77,CHECKSUM,5,1000),"Wrong user rejected");
        check(!matches(r,NONCE,0,5,20415,77,CHECKSUM,5,1000),"Reused user serial rejected");
        check(!matches(r,NONCE,0,4,20414,77,CHECKSUM,5,1000),"Old Hook version rejected");
        check(!matches(r,NONCE,0,4,20415,76,CHECKSUM,5,1000),"Old pause revision rejected");
        check(!matches(r,NONCE,0,4,20415,77,"b".repeat(64),5,1000),"Pause checksum mismatch rejected");
        check(!matches(r,NONCE,0,4,20415,77,CHECKSUM,6,1000),"New fence generation rejects old request");
        check(!matches(r,NONCE,0,4,20415,77,CHECKSUM,5,21000),"Expired acknowledgement rejected");
    }
    private static void sessions(){
        cases++;LauncherResetPolicy.Session session=new LauncherResetPolicy.Session(request());
        check(session.receipt()==null,"No fabricated acknowledgement");
        check(!session.ack(123,true,"pages_empty",1000),"ACK before claim rejected");
        check(!session.claim(0,1000)&&!session.claim(-1,1000),"Invalid PID rejected");
        check(session.claim(123,1000),"First PID claims");
        check(session.claim(123,1001),"Same process can reread pending request");
        check(!session.claim(124,1001),"Restarted process cannot claim predecessor request");
        check(!session.ack(124,true,"pages_empty",1001),"Restarted process cannot ACK predecessor request");
        for(String code:new String[]{null,"","pages-empty","PAGES_EMPTY","a".repeat(49),"failed"})
            check(!session.ack(123,true,code,1001),"Only success code pages_empty accepted");
        check(!session.ack(123,true,"pages_empty",21000),"Claim does not bypass expiry");
        check(session.receipt()==null,"Rejected ACK cannot publish receipt");
        check(session.ack(123,true,"pages_empty",1002),"Claimed process success accepted");
        check(session.receipt().success&&session.receipt().pid==123&&"pages_empty".equals(session.receipt().code),"Success receipt exact");
        check(!session.ack(123,false,"commit_failed",1003),"Replay cannot overwrite successful receipt");
        check(!session.claim(123,1003)&&!session.claim(124,1003),"Completed request cannot be reclaimed");
        LauncherResetPolicy.Session failed=new LauncherResetPolicy.Session(request());
        check(failed.claim(123,1000),"Failure fixture claimed");
        check(failed.ack(123,false,"commit_failed",1001),"Persist failure produces explicit receipt");
        check(!failed.receipt().success&&"commit_failed".equals(failed.receipt().code),"Failure preserved");
        check(!failed.ack(123,true,"pages_empty",1002),"Replay cannot promote failed commit to success");
        check(!failed.receipt().success,"Original failure remains final");
        LauncherResetPolicy.Session fresh=new LauncherResetPolicy.Session(change(OTHER,0,4,10376,20415,78,CHECKSUM,1000,21000,6));
        check(fresh.claim(124,1001)&&fresh.ack(124,true,"pages_empty",1002),"New nonce/generation allows restarted process fresh cleanup");
    }
    private static void concurrentClaims()throws Exception{
        cases++;LauncherResetPolicy.Session session=new LauncherResetPolicy.Session(request());
        CountDownLatch go=new CountDownLatch(1);AtomicBoolean a=new AtomicBoolean(),b=new AtomicBoolean();
        Thread first=new Thread(()->{try{go.await();a.set(session.claim(123,1001));}catch(Exception e){throw new RuntimeException(e);}});
        Thread second=new Thread(()->{try{go.await();b.set(session.claim(124,1001));}catch(Exception e){throw new RuntimeException(e);}});
        first.start();second.start();go.countDown();first.join();second.join();
        check(a.get()!=b.get(),"Concurrent claim has one owning PID");
        int owner=a.get()?123:124;check(session.ack(owner,true,"pages_empty",1002),"Concurrent winner can ACK");
        check(!session.ack(owner==123?124:123,false,"commit_failed",1002),"Concurrent loser cannot publish failure");
    }
    private static void fence()throws Exception{
        cases++;check(!ResetWriteFence.active()&&!ResetWriteFence.owns()&&!ResetWriteFence.blocked(),"Fence initially idle");
        long before=ResetWriteFence.generation();check(!ResetWriteFence.stale(before),"Fresh editor before reset valid");
        ResetWriteFence.begin();long during=ResetWriteFence.generation();
        try {
            check(during>before&&ResetWriteFence.active()&&ResetWriteFence.owns()&&!ResetWriteFence.blocked(),"Owner activates new fence generation");
            check(ResetWriteFence.stale(before)&&!ResetWriteFence.stale(during),"Old editor invalid, owner editor current");
            boolean rejected=false;try{ResetWriteFence.begin();}catch(IllegalStateException expected){rejected=true;}
            check(rejected,"Nested reset cannot take ownership");
            AtomicReference<Throwable> failure=new AtomicReference<>();
            Thread outsider=new Thread(()->{try{
                if(!ResetWriteFence.active()||ResetWriteFence.owns()||!ResetWriteFence.blocked()||!ResetWriteFence.stale(during))
                    throw new AssertionError("Foreign thread fence access");
                ResetWriteFence.end();
                if(!ResetWriteFence.active()||ResetWriteFence.generation()!=during)throw new AssertionError("Foreign end cleared fence");
                try{ResetWriteFence.begin();throw new AssertionError("Foreign begin stole fence");}catch(IllegalStateException expected){}
            }catch(Throwable error){failure.set(error);}});
            outsider.start();outsider.join();check(failure.get()==null,"Other threads cannot open/write/end owner reset");
        }finally{ResetWriteFence.end();}
        check(!ResetWriteFence.active()&&!ResetWriteFence.owns()&&!ResetWriteFence.blocked(),"Fence reliably released");
        check(ResetWriteFence.generation()>during&&ResetWriteFence.stale(during),"End invalidates drafts created during reset");
        check(!ResetWriteFence.stale(ResetWriteFence.generation()),"New editor after reset valid");
    }
    public static void main(String[] args)throws Exception{
        validity();callers();requestBinding();sessions();concurrentClaims();fence();
        System.out.println("{\"success\":true,\"cases\":"+cases+",\"assertions\":"+assertions+",\"personalDataTouched\":false}");
    }
}
