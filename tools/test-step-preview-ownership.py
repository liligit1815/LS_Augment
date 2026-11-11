"""Exercise the production native identity check before merging side finish poses."""
from pathlib import Path
import subprocess,tempfile
root=Path(__file__).resolve().parents[1]
s=(root/'android/app/src/main/java/ls/augment/com/step/NativeWorkspaceGuard.java').read_text(encoding='utf-8')
method=s[s.index('    static boolean settledSideSnapshot('):s.index('    /** Move the same main/side')]
java=r'''
import java.util.*;
class PreviewOwnership {
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 static class Wm {static Object lock=new Object(),display=new Object(),context=new Object();}
 static class WorkspaceUsers {static boolean allows(Object c,int p,int u){return p==u||u==10;}}
 static class Slots {int[] ids={7,-1,-1,-1,-1};int[] snapshot(){return ids.clone();}}
 static class Task {Object parent=new Object(),display=Wm.display;int mode=6,layerId=32;}
 static class ChildTask extends Task {}
 static class SavedTask {boolean dirty=true;Object token=new Object(),parent;Task task;int user,layerId=32;SavedTask(Task t){task=t;parent=t.parent;}}
 static boolean active=true,ending;static int principal;static Object flip,pendingCommit;
 static Slots slots=new Slots();static Map<Integer,SavedTask> saved=new HashMap<>();static Task live;
 static Object liveTask(int id,Object token){return live;}
 static Object call(Object o,String n){Task t=(Task)o;return switch(n){case "getParent"->t.parent;case "getDisplayContent"->t.display;case "getWindowingMode"->t.mode;case "getSurfaceControl"->t;case "getLayerId"->t.layerId;default->throw new AssertionError(n);};}
 METHOD
 static void fresh(){active=true;ending=false;flip=pendingCommit=null;slots=new Slots();live=new Task();saved.clear();saved.put(7,new SavedTask(live));}
 public static void main(String[] args){
  fresh();check(!settledSideSnapshot(slots.snapshot()));
  synchronized(Wm.lock){
   check(settledSideSnapshot(slots.snapshot()));live=new ChildTask();saved.put(7,new SavedTask(live));check(settledSideSnapshot(slots.snapshot()));
   for(int n=0;n<14;n++){
    fresh();int[] expected=slots.snapshot();SavedTask r=saved.get(7);
    switch(n){case 0:active=false;break;case 1:ending=true;break;case 2:flip=new Object();break;case 3:pendingCommit=new Object();break;
     case 4:expected=null;break;case 5:expected[0]=8;break;case 6:saved.clear();break;case 7:r.dirty=false;break;case 8:live=new Task();break;
     case 9:live.parent=new Object();break;case 10:live.display=new Object();break;case 11:live.mode=1;break;case 12:live.layerId++;break;case 13:r.user=11;break;}
    check(!settledSideSnapshot(expected));
   }
   fresh();saved.get(7).user=10;check(settledSideSnapshot(slots.snapshot()));
   slots.ids[0]=-1;check(settledSideSnapshot(slots.snapshot()));
  }
  System.out.println("PASS "+checks+" production native side ownership checks");
 }
}
'''.replace('METHOD',method)
j=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
with tempfile.TemporaryDirectory(prefix='step-preview-owner-') as temp:
 p=Path(temp);f=p/'PreviewOwnership.java';f.write_text(java,encoding='utf-8')
 subprocess.run([j/'javac','-encoding','UTF-8','-d',p,f],check=True)
 subprocess.run([j/'java','-cp',p,'PreviewOwnership'],check=True)
