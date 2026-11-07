"""Execute production HOME preparation: delayed draw, identity changes and recovery."""
import os,re,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
STEP=ROOT/'android/app/src/main/java/ls/augment/com/step'
source=(STEP/'NativeBackdrop.java').read_text(encoding='utf8')
source=re.sub(r'^(package|import) .*?;\s*','',source,flags=re.M).replace('final class NativeBackdrop {','static final class NativeBackdrop {')
harness=r'''
import java.util.*;
public class BackdropCases {
 static int checks,started,replays,applies;static String failed;
 static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class SystemClock {static long now;static long uptimeMillis(){return now;}}
 static class Handler {ArrayDeque<Runnable> q=new ArrayDeque<>();void post(Runnable r){q.add(r);}void postDelayed(Runnable r,long ms){q.add(r);}void one(){q.remove().run();}}
 static class Wm {static Object lock=new Object(),display=new Object();static Handler handler=new Handler();}
 static class WorkspaceReadmit {static boolean available=true;}
 static class Surface {int id=20;}
 static class Task {Object token=new Object(),parent=new Object(),display=Wm.display;Surface surface=new Surface();int type=2,user,mode=1;boolean live=true,visible,drawn,reported,translucent,focused;}
 static class SavedTask {int id=1;Task task=new Task();Object token=task.token,parent=task.parent;boolean dirty;}
 static class NativeFlip {void validate(){if(!main.task.focused)throw new IllegalStateException("lost foreground");}}
 static class Intent {int getIntExtra(String key,int fallback){return 2;}Object getParcelableExtra(String key){return home.token;}}
 static class Tx {List<Runnable> ops=new ArrayList<>();}
 static int principal;static NativeFlip flip;static boolean ending;static SavedTask main;static Task home;
 static Object liveTask(int id,Object token){Task t=id==2?home:main.task;return t.live && t.token==token?t:null;}
 static Object field(Object o,String key){Task t=(Task)o;return switch(key){case "mUserId"->t.user;case "isVisible"->t.visible;default->throw new AssertionError(key);};}
 static Object call(Object o,String key,Object...a){
  if(o instanceof Surface s)return s.id;
  if(o instanceof Task t)return switch(key){case "getParent"->t.parent;case "getRootTask","getTaskInfo","topRunningActivity","findMainWindow"->t;case "getSurfaceControl"->t.surface;case "getDisplayContent"->t.display;case "getActivityType"->t.type;case "getWindowingMode"->t.mode;case "isDrawn"->t.drawn;case "isReportedDrawn"->t.reported;default->throw new AssertionError(key);};
  if(o instanceof Tx tx){
   Task t=a[0]==home.token?home:main.task;
   switch(key){case "setForceTranslucent":tx.ops.add(()->t.translucent=(Boolean)a[1]);break;case "reorder":tx.ops.add(()->{home.focused=t==home;main.task.focused=t==main.task;});break;default:throw new AssertionError(key);}
   return tx;
  }throw new AssertionError(key);
 }
 static Object transaction(){return new Tx();}
 static void apply(Object tx){check(!Thread.holdsLock(Wm.lock),"WCT outside WM lock");check(main.dirty,"recovery armed before mutation");((Tx)tx).ops.forEach(Runnable::run);applies++;}
 static void replay(){replays++;}
 static void diagnostic(String s,String d){}
 static void finish(String s){failed=s;ending=true;}
 NATIVE
 static NativeBackdrop reset(){
  Wm.handler=new Handler();SystemClock.now=0;main=new SavedTask();main.task.type=1;main.task.focused=true;home=new Task();
  flip=new NativeFlip();ending=false;failed=null;started=replays=applies=0;WorkspaceReadmit.available=true;
  return new NativeBackdrop(new Intent(),main);
 }
 static void drawn(){home.visible=home.drawn=home.reported=true;}
 static void start(NativeBackdrop b){synchronized(Wm.lock){b.prepare(flip,()->started++);}check(applies==0,"prep leaves foreground in place");Wm.handler.one();}
 public static void main(String[] args){
  NativeBackdrop b=reset();start(b);check(main.task.translucent && main.task.focused,"home behind original focused task");
  check(started==0 && replays==0,"no animation on undrawn HOME");home.visible=home.drawn=true;Wm.handler.one();check(started==0,"reported draw also required");home.reported=true;Wm.handler.one();check(started==1 && replays==1 && !ending,"start only after live home draw");
  b=reset();drawn();start(b);check(started==1,"already drawn home proceeds");
  b=reset();start(b);SystemClock.now=1200;Wm.handler.one();check(ending && started==0 && main.dirty,"draw timeout recovers modified foreground");
  for(int kind=0;kind<7;kind++){
   b=reset();start(b);drawn();switch(kind){case 0:home.token=new Object();break;case 1:home.parent=new Object();break;case 2:home.surface.id++;break;case 3:home.user=10;break;case 4:home.display=new Object();break;case 5:main.task.mode=5;break;case 6:main.task.focused=false;break;}
   Wm.handler.one();check(ending && started==0,"identity/ownership change rejects backdrop "+kind);
  }
  b=reset();start(b);flip=new NativeFlip();drawn();Wm.handler.one();check(started==0 && !ending,"stale callback cannot touch new flip");
  b=reset();start(b);ending=true;drawn();Wm.handler.one();check(started==0,"exit cancels pending draw");
  b=reset();WorkspaceReadmit.available=false;try{new NativeBackdrop(new Intent(),main);throw new AssertionError("missing API");}catch(IllegalStateException expected){checks++;}
  System.out.println("PASS "+checks+" production HOME backdrop checks");
 }
}
'''.replace('NATIVE',source)
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-home-') as tmp:
    folder=Path(tmp);test=folder/'BackdropCases.java';test.write_text(harness,encoding='utf8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,test],check=True)
    subprocess.run([java/'java','-cp',folder,'BackdropCases'],check=True)
