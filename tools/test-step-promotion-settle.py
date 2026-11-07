"""Exercise the production promotion wait against delayed and cancelled OEM transitions."""
import os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'LiveWorkspace.java').read_text(encoding='utf8')
start=source.index('    void awaitPromotion(');end=source.index('    void adoptPromotion(',start)
method=source[start:end].replace('android.os.SystemClock','Clock').replace('ActivityManager.RunningTaskInfo','Info')
harness=r'''
import java.util.*;
public class PromotionCases {
    static int checks;
    static void check(boolean b,String s){checks++;if(!b)throw new AssertionError(s);}
    static class Clock {static long now;static long uptimeMillis(){return now;}}
    static class Queue {ArrayDeque<Runnable> q=new ArrayDeque<>();void execute(Runnable r){q.add(r);}void post(Runnable r){q.add(r);}void postDelayed(Runnable r,long ms){q.add(r);}void one(){check(!q.isEmpty(),"pending callback");q.remove().run();}}
    static class Shell {static Queue executor=new Queue();}
    static class StepRuntime {static void diagnostic(String s,String d){}}
    static class Info {int mode=1;boolean visible=true;}
    static class Lease {Info info=new Info();boolean invalid;Info checkedInfo(){if(invalid)throw new IllegalStateException("token changed");return info;}}
    static class Slots {int id=7;int task(int n){return id;}}
    static class Fence {boolean busy;boolean busy(){return busy;}}
    final Slots slots=new Slots();final Map<Integer,Lease> leases=new HashMap<>();final Queue main=new Queue();final Fence fence=new Fence();
    boolean closing,closed,checkingState,idle;int adopted,rendered,reconciled,pendingNativeSlot=-1;Object nativeTransitions=new Object();
    void showSlots(){}
    Object call(Object o,String name){return o==nativeTransitions?idle:((Info)o).mode;}
    boolean flag(Info i,String name){return i.visible;}
    void close(String s){closing=true;}
    void render(){rendered++;}
    void reconcile(String s){reconciled++;}
    void adoptPromotion(int slot){adopted++;}
    METHOD
    static PromotionCases fresh(){Shell.executor=new Queue();Clock.now=100;PromotionCases h=new PromotionCases();h.leases.put(7,new Lease());return h;}
    static void ready(PromotionCases h){h.idle=true;Shell.executor.one();h.main.one();}
    public static void main(String[] args){
        PromotionCases h=fresh();h.awaitPromotion(0);Shell.executor.one();
        check(h.adopted==0 && h.checkingState,"no reparent during OEM animation");h.main.one();ready(h);
        check(h.adopted==1 && !h.checkingState && !h.closing,"one adoption after native idle");
        h=fresh();h.awaitPromotion(0);h.idle=true;Shell.executor.one();h.idle=false;h.main.one();
        check(h.adopted==0 && h.checkingState,"new native transition before delivery prevents stale adoption");h.main.one();ready(h);
        check(h.adopted==1,"second idle observation allows handoff");
        h=fresh();h.awaitPromotion(0);h.leases.get(7).info.mode=6;ready(h);Shell.executor.one();
        check(h.adopted==0 && h.rendered==1 && !h.closing && !h.checkingState,"cancelled launch preserves preview");
        h=fresh();h.awaitPromotion(0);Clock.now=2700;Shell.executor.one();h.main.one();
        check(h.closing && !h.checkingState && h.adopted==0,"timeout restores instead of stealing native animation");
        for(int kind=0;kind<5;kind++){
            h=fresh();h.awaitPromotion(0);h.idle=true;Shell.executor.one();
            switch(kind){case 0:h.closing=true;break;case 1:h.closed=true;break;case 2:h.slots.id=9;break;case 3:h.leases.put(7,new Lease());break;case 4:h.fence.busy=true;break;}
            h.main.one();check(h.adopted==0,"stale handoff rejected "+kind);
        }
        h=fresh();h.awaitPromotion(0);h.leases.get(7).invalid=true;ready(h);
        check(h.closing && h.adopted==0,"changed token follows recovery");
        h=fresh();h.awaitPromotion(0);h.leases.remove(7);Shell.executor.one();h.main.one();
        check(!h.checkingState && h.adopted==0,"retired lease before worker releases pending state");
        System.out.println("PASS "+checks+" production native promotion timing checks");
    }
}
'''.replace('METHOD',method)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-promotion-') as tmp:
    folder=Path(tmp);test=folder/'PromotionCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test],check=True)
    subprocess.run([java/'java','-cp',folder,'PromotionCases'],check=True)
