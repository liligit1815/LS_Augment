package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

public final class TestAuditFixes {
    private static int assertions;
    static void check(boolean value, String message) {
        assertions++;
        if (!value) throw new AssertionError(message);
    }
    private static ConfigEditDraft seeded(Map<String,String> disk) {
        ConfigEditDraft draft=new ConfigEditDraft();disk.forEach(draft::seed);return draft;
    }
    private static void drafts() {
        Map<String,String> disk=new LinkedHashMap<>(Map.of("left","0","right","0"));
        ConfigEditDraft a=seeded(disk);a.put("left","10");ConfigEditDraft.Batch first=a.takePending();
        ConfigEditDraft b=seeded(disk);
        disk.putAll(first.values);a.complete(first,true);
        b.put("right","20");ConfigEditDraft.Batch second=b.takePending();disk.putAll(second.values);
        check(disk.equals(Map.of("left","10","right","20")),"old page overwrote unrelated setting");
        check(second.values.size()==1,"unchanged draft fields leaked into save");
        b.complete(second,true);check(b.unsaved().isEmpty(),"saved edits retained");

        a.put("left","11");first=a.takePending();
        a.put("left","12");second=a.takePending();
        a.complete(first,true);check(a.unsaved().get("left").equals("12"),"old ACK removed new edit");
        a.complete(second,false);check(a.hasPending(),"failed newest edit cannot retry");
        ConfigEditDraft.Batch retry=a.takePending();check(retry.values.get("left").equals("12"),"retry uses stale value");
        a.complete(retry,true);check(a.unsaved().isEmpty(),"retry not cleared");

        a.put("left","13");first=a.takePending();a.put("right","30");second=a.takePending();
        check(second.values.equals(Map.of("right","30")),"in-flight field was resubmitted with unrelated edit");
        a.complete(first,false);a.complete(second,true);
        check(a.takePending().values.equals(Map.of("left","13")),"one failure lost after another field succeeded");

        ConfigEditDraft reset=seeded(Map.of("left","0","right","0"));
        reset.force("left","0");reset.force("right","0");
        check(reset.takePending().values.size()==2,"reset must explicitly overwrite every selected field");
        ConfigEditDraft restored=seeded(Map.of("left","99","right","55"));
        reset.unsaved().forEach(restored::force);
        check(restored.takePending().values.equals(Map.of("left","0","right","0")),"recreation lost explicit reset");
        ConfigEditDraft clean=seeded(disk);check(clean.unsaved().isEmpty(),"recreation would serialize untouched fields");
        clean.put("left",disk.get("left"));check(!clean.hasPending(),"unchanged UI rebind became an edit");
        clean.put("left","80");clean.takePending();clean.put("left",disk.get("left"));
        check(clean.takePending().values.get("left").equals(disk.get("left")),"revert while queued was dropped");
    }
    private static void quotas() throws Exception {
        DiagnosticWritePolicy policy=new DiagnosticWritePolicy();
        for(int i=0;i<64;i++)check(policy.allowRequest(101,0),"normal caller burst rejected");
        check(!policy.allowRequest(101,9999),"per-UID quota exceeded");
        check(policy.allowRequest(102,9999),"another UID lost its own allowance");
        check(policy.allowRequest(101,10000),"new window did not refill");
        check(!policy.allowRequest(-1,10000),"invalid identity accepted");
        DiagnosticWritePolicy global=new DiagnosticWritePolicy();
        for(int uid=0;uid<4;uid++)for(int i=0;i<64;i++)check(global.allowRequest(uid,0),"global burst rejected early");
        check(!global.allowRequest(4,0),"global quota exceeded");
        DiagnosticWritePolicy many=new DiagnosticWritePolicy();
        for(int uid=0;uid<64;uid++)check(many.allowRequest(uid,0),"caller map rejected early");
        check(!many.allowRequest(65,0),"caller tracking grew unbounded");
        check(many.allowRequest(65,10000),"old caller map never expires");

        DiagnosticWritePolicy parallel=new DiagnosticWritePolicy();
        AtomicInteger accepted=new AtomicInteger();CountDownLatch start=new CountDownLatch(1);
        Thread[] threads=new Thread[8];
        for(int i=0;i<threads.length;i++){
            threads[i]=new Thread(()->{try{start.await();}catch(InterruptedException e){throw new AssertionError(e);}
                for(int j=0;j<64;j++)if(parallel.allowRequest(700,0))accepted.incrementAndGet();});
            threads[i].start();
        }
        start.countDown();for(Thread t:threads)t.join();
        check(accepted.get()==64,"concurrent rate check bypassed limit");

        Map<String,Object> stored=new LinkedHashMap<>();
        for(int i=0;i<512;i++)stored.put("key"+i,"");
        check(!DiagnosticWritePolicy.fits(stored,"another",""),"key cap exceeded");
        check(DiagnosticWritePolicy.fits(stored,"key0","normal"),"existing key cannot update at count cap");
        stored.clear();stored.put("a","x".repeat(512*1024-1));
        check(DiagnosticWritePolicy.fits(stored,"a",stored.get("a").toString()),"exact byte cap rejected");
        check(!DiagnosticWritePolicy.fits(stored,"b",""),"byte cap exceeded");
        stored.clear();stored.put("a","中".repeat(180000));
        check(!DiagnosticWritePolicy.fits(stored,"b","x"),"UTF-8 quota treated Chinese as one byte");
        check(DiagnosticWritePolicy.fits(stored,"a","small"),"old oversized store cannot shrink");
        check(!DiagnosticWritePolicy.fits(stored,"a","中".repeat(180001)),"old oversized store can grow");
        check(DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(2001)).length()==2000,"per-value limit changed");
        check(DiagnosticWritePolicy.normalize("ls_augment_test","x".repeat(1999)+"😀").length()==1999,"truncation broke surrogate pair");
    }
    private static void provider() {
        FakeContext context=new FakeContext();
        android.os.SystemClock.now=100_000;
        check(ProviderDiagnostics.record(context,100,"ls_augment_reserved","x")==ProviderDiagnostics.Result.INVALID,"schema key accepted");
        check(ProviderDiagnostics.record(context,100,"ls_augment_tgk_fuse_test","x")==ProviderDiagnostics.Result.INVALID,"fuse key accepted");
        check(ProviderDiagnostics.record(context,100,null,"x")==ProviderDiagnostics.Result.INVALID,"null key accepted");
        for(int i=0;i<64;i++)check(ProviderDiagnostics.record(context,100,"ls_augment_key"+i,"ok")==ProviderDiagnostics.Result.ACCEPTED,"ordinary diagnostic rejected");
        check(ProviderDiagnostics.record(context,100,"ls_augment_extra","x")==ProviderDiagnostics.Result.THROTTLED,"actual store omitted rate gate");
        check(context.prefs.values.size()==64,"rejected call mutated preferences");
        android.os.SystemClock.now+=10000;
        int writes=context.prefs.writes;
        check(ProviderDiagnostics.record(context,100,"ls_augment_key0","ok")==ProviderDiagnostics.Result.ACCEPTED,"duplicate rejected");
        check(context.prefs.writes==writes,"duplicate triggered disk write");
        String large="x".repeat(32768);boolean full=false;
        for(int i=0;i<32;i++){
            ProviderDiagnostics.Result result=ProviderDiagnostics.record(context,100,"ls_augment_rm_support_"+i,large);
            if(result==ProviderDiagnostics.Result.FULL)full=true;
        }
        check(full,"actual store never applied total quota");
        check(context.prefs.values.size()<96,"full calls created keys");
    }
    public static void main(String[] args) throws Exception {
        drafts();quotas();provider();StatusBarSaveHarness.verify();
        System.out.println("Audit fixes: "+assertions+" assertions passed (drafts, quota, provider, production save)");
    }
}
