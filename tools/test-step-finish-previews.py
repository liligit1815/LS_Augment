"""Execute settled side-pane restoration with stale, busy and replaced leases."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
source=(root/'android/app/src/main/java/ls/augment/com/step/LiveWorkspace.java').read_text(encoding='utf-8')
start=source.index('    int[] stageFinishedPreviews(')
methods=source[start:source.index('    void render(Runnable',start)]
java=r'''
import java.util.*;
class FinishPreviews {
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 static class Rect {int width(){return 1216;}int height(){return 2688;}}
 static class ActivityManager {static class RunningTaskInfo {int mode=6;}}
 static class Surface {}
 static class Tx {Map<Object,Map<String,Object[]>> values=new IdentityHashMap<>();}
 static Object call(Object o,String n,Object...args){
  if(o instanceof ActivityManager.RunningTaskInfo i)return i.mode;
  Tx tx=(Tx)o;tx.values.computeIfAbsent(args[0],v->new HashMap<>()).put(n,args);return tx;
 }
 static class PreviewGeometry {
  float scale,x,y;PreviewGeometry(int w,int h,int bw,int bh){scale=Math.min((float)bw/w,(float)bh/h);x=(bw-w*scale)/2;y=(bh-h*scale)/2;}
 }
 static class Slots {int[] ids={7,8,-1};int task(int s){return ids[s];}int[] snapshot(){return ids.clone();}}
 static class Fence {boolean busy;boolean busy(){return busy;}}
 static class Geometry {int rowHeight(int s,int n){return 668;}int rowTop(int s,int n){return s*668;}}
 static class Lease {
  ActivityManager.RunningTaskInfo info=new ActivityManager.RunningTaskInfo();Object leash=new Surface();boolean replaced;
  ActivityManager.RunningTaskInfo checkedInfo(){if(replaced)throw new IllegalStateException("identity changed");return info;}
  Object checkedLeash(){return leash;}
 }
 static class Host {
  static Host current;boolean ready=true,closing,closed;Object organizerLock=new Object(),flipStage;
  Fence fence=new Fence();int[] shiftFrom;int dragSlot=-1,visibleSlots=3,previewWidth=302;float dragX,shiftProgress;
  Slots slots=new Slots();Rect logical=new Rect();Geometry geometry=new Geometry();Map<Integer,Lease> leases=new HashMap<>();
  Object parent=new Surface();Object surface(){return parent;}
  Host(){current=this;leases.put(7,new Lease());leases.put(8,new Lease());}
  METHODS
 }
 public static void main(String[] args)throws Exception {
  Host h=new Host();Tx tx=new Tx();h.stageFinishedPreviews(tx);check(tx.values.size()==2);
  for(int s=0;s<2;s++){
   Map<String,Object[]> p=tx.values.get(h.leases.get(7+s).leash);
   check(p.get("reparent")[1]==h.parent);
   check(Math.abs((Float)p.get("setMatrix")[1]-302f/1216)<.0001);
   check(Math.abs((Float)p.get("setPosition")[2]-(s*668+.2105263f))<.01);
   check(p.get("setWindowCrop")[1]==h.logical && p.containsKey("show"));
  }
  for(int n=0;n<8;n++){
   h=new Host();tx=new Tx();switch(n){case 0:Host.current=new Host();break;case 1:h.ready=false;break;case 2:h.closing=true;break;
    case 3:h.closed=true;break;case 4:h.fence.busy=true;break;case 5:h.flipStage=new Object();break;case 6:h.shiftFrom=new int[]{0,1};break;case 7:h.dragSlot=0;break;}
   h.stageFinishedPreviews(tx);check(tx.values.isEmpty());
  }
  for(int n=0;n<4;n++){
   h=new Host();tx=new Tx();Lease lease=h.leases.get(7);
   switch(n){case 0:h.leases.remove(7);break;case 1:lease.info=null;break;case 2:lease.info.mode=1;break;case 3:lease.replaced=true;break;}
   try{h.stageFinishedPreviews(tx);throw new AssertionError("stale target");}catch(IllegalStateException expected){check(tx.values.isEmpty());}
  }
  h=new Host();h.slots.ids=new int[]{-1,-1,-1};tx=new Tx();h.stageFinishedPreviews(tx);check(tx.values.isEmpty());
  System.out.println("PASS "+checks+" production preview completion checks");
 }
}
'''.replace('METHODS',methods)
j=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-finish-previews-') as temp:
 p=Path(temp);f=p/'FinishPreviews.java';f.write_text(java,encoding='utf-8')
 subprocess.run([j/'javac','-encoding','UTF-8','-d',p,f],check=True)
 subprocess.run([j/'java','-cp',p,'FinishPreviews'],check=True)
