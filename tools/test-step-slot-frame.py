"""Run production slot-frame and common handoff completion with delayed callbacks."""
import os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'LiveWorkspace.java').read_text(encoding='utf8')
def method(name):
    start=source.index('    void '+name+'(');end=source.index('{',start)+1;depth=1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}');end+=1
    return source[start:end]
harness=r'''
package ls.augment.com.step;
import java.util.*;import java.util.function.Consumer;
public class SlotFrameCases {
    static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static class Queue {ArrayDeque<Runnable> now=new ArrayDeque<>(),later=new ArrayDeque<>();void post(Runnable r){now.add(r);}void postDelayed(Runnable r,long ms){later.add(r);}void drain(){while(!now.isEmpty())now.remove().run();}}
    static class Panel {boolean attached=true,hardware=true;int x=800,y=320,width=280,invalidations;ArrayDeque<Runnable> frames=new ArrayDeque<>();
        boolean isAttachedToWindow(){return attached;}boolean isHardwareAccelerated(){return hardware;}Panel getViewTreeObserver(){return this;}
        void registerFrameCommitCallback(Runnable r){frames.add(r);}void invalidate(){invalidations++;}void getLocationOnScreen(int[] at){at[0]=x;at[1]=y;}int getWidth(){return width;}}
    static class Geometry {int sideX=800,top=320;}
    static class Bundle {}
    static class Input {int releases;void release(Runnable r){releases++;r.run();}}
    final Queue main=new Queue();final Panel panel=new Panel();final Geometry geometry=new Geometry();final Input input=new Input();final OperationFence fence=new OperationFence();
    boolean closing,closed;long slotFrameGeneration;int pendingNativeSlot=0,previewWidth=280,slotsShown,completions,stagesClosed,resumes,logs;String failure;Consumer<Bundle> reply;
    void showSlots(){slotsShown++;}void fail(String s){failure=s;closing=true;fence.close();}void clearDrag(){}void closeFlipStage(){stagesClosed++;}void log(String s){logs++;}void resumeNext(){resumes++;}
    void rpc(String action,Bundle args,Consumer<Bundle> done){check(action.equals("replay"),"shared final native replay");reply=done;}
    METHODS
    void painted(){panel.frames.remove().run();main.drain();}
    public static void main(String[] args){
        SlotFrameCases h=new SlotFrameCases();SlotFrameCases target=h;long ticket=h.fence.begin();
        h.commitSlotFrame(()->target.finishHandoff(ticket,"last preview"));h.main.drain();
        check(h.pendingNativeSlot==-1 && h.slotsShown==1 && h.reply==null && h.input.releases==0,"empty final UI is prepared, no early success");
        h.painted();check(h.reply!=null && h.input.releases==0 && h.fence.busy(),"view frame alone cannot release input");
        h.reply.accept(new Bundle());check(h.input.releases==1 && h.stagesClosed==1 && !h.fence.busy() && h.logs==1,"release only after view and native transaction");
        h.reply.accept(new Bundle());check(h.input.releases==1,"duplicate native callback cannot complete twice");
        h.main.later.remove().run();check(h.failure==null,"completed view timeout harmless");
        for(int kind=0;kind<5;kind++){
            h=new SlotFrameCases();final SlotFrameCases active=h;h.commitSlotFrame(()->active.completions++);h.main.drain();
            switch(kind){case 0:h.closing=true;break;case 1:h.closed=true;break;case 2:h.slotFrameGeneration++;break;case 3:h.panel.x++;break;case 4:h.panel.width++;break;}
            h.painted();check(h.completions==0,"stale/wrong frame rejected "+kind);
        }
        h=new SlotFrameCases();final SlotFrameCases timed=h;h.commitSlotFrame(()->timed.completions++);h.main.drain();h.main.later.remove().run();h.painted();
        check(h.failure!=null && h.completions==0,"late draw after timeout cannot release guard");
        for(int kind=0;kind<2;kind++){
            h=new SlotFrameCases();if(kind==0)h.panel.attached=false;else h.panel.hardware=false;
            h.commitSlotFrame(()->{});h.main.drain();check(h.failure!=null && h.panel.frames.isEmpty(),"missing drawing capability recovers "+kind);
        }
        System.out.println("PASS "+checks+" production slot frame and handoff checks");
    }
}
'''.replace('METHODS',method('finishHandoff')+'\n'+method('commitSlotFrame'))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-slots-') as tmp:
    d=Path(tmp);p=d/'SlotFrameCases.java';p.write_text(harness,encoding='utf8')
    subprocess.run([str(java/'javac'),'-encoding','UTF-8','-d',str(d),str(p),str(STEP/'OperationFence.java')],check=True)
    subprocess.run([str(java/'java'),'-cp',str(d),'ls.augment.com.step.SlotFrameCases'],check=True)
