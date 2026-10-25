"""Exercise the production Root focus lease with real Java loopers and controlled WMS boundaries.

No phone access; this proves lifecycle/deadline logic, not device WMS permission or IME behavior.
"""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/AtomicWorkbenchInputFocusGuard.java"
JDK = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
JAVAC = str(JDK / "javac.exe") if JDK.exists() else "javac"
JAVA = str(JDK / "java.exe") if JDK.exists() else "java"
ENV = dict(os.environ)
if JDK.exists():
    ENV["PATH"] = str(JDK) + os.pathsep + ENV.get("PATH", "")

STUBS = {
"android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo {public int uid=10515;}",
"android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public final ApplicationInfo app=new ApplicationInfo();public volatile java.util.concurrent.CountDownLatch gate;public ApplicationInfo getApplicationInfo(String p,int f){if(gate!=null)try{gate.await();}catch(InterruptedException e){throw new RuntimeException(e);}return app;}}",
"android/os/Process.java": "package android.os;public class Process {public static volatile int uid;public static int myUid(){return uid;}}",
"android/os/IBinder.java": "package android.os;public interface IBinder {boolean isBinderAlive();}",
"android/os/UserManager.java": "package android.os;public class UserManager {public boolean unlocked=true,foreground=true;public boolean isUserUnlocked(){return unlocked;}public boolean isUserForeground(){return foreground;}}",
"android/hardware/display/DisplayManager.java": "package android.hardware.display;public class DisplayManager {public android.view.Display display;public android.view.Display getDisplay(int id){return display!=null&&display.id==id?display:null;}}",
"android/os/Bundle.java": "package android.os;public class Bundle {}",
"android/graphics/Color.java": "package android.graphics;public class Color {public static final int TRANSPARENT=0;}",
"android/graphics/PixelFormat.java": "package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}",
"android/view/Gravity.java": "package android.view;public class Gravity {public static final int TOP=48,START=8388611;}",
"android/view/Display.java": r'''package android.view;public class Display {
 public static final int FLAG_PRIVATE=4,FLAG_PRESENTATION=8,FLAG_TRUSTED=128,FLAG_OWN_FOCUS=16384,TYPE_VIRTUAL=5;
 public int id=51,owner=0,type=5,flags=FLAG_TRUSTED|FLAG_OWN_FOCUS;public boolean valid=true;
 public String name="DuoAtomic-10515-w0-00000000-0000-0000-0000-000000000001",unique="synthetic:51";
 public int getDisplayId(){return id;}public boolean isValid(){return valid;}public String getName(){return name;}
 public int getFlags(){return flags;}public int getOwnerUid(){return owner;}public int getType(){return type;}public String getUniqueId(){return unique;}}
''',
"android/os/Looper.java": r'''package android.os;import java.util.concurrent.*;public class Looper {
 static final ThreadLocal<Looper> CURRENT=new ThreadLocal<>();final BlockingQueue<Runnable> tasks=new LinkedBlockingQueue<>();volatile boolean quitting;
 public static Looper myLooper(){return CURRENT.get();}boolean post(Runnable r){if(quitting)return false;tasks.add(r);return true;}
 void loop()throws InterruptedException{while(!quitting||!tasks.isEmpty()){Runnable r=tasks.poll(10,TimeUnit.MILLISECONDS);if(r!=null)r.run();}}}
''',
"android/os/Handler.java": "package android.os;public class Handler {final Looper looper;public Handler(Looper l){if(l==null)throw new NullPointerException();looper=l;}public boolean post(Runnable r){return looper.post(r);}}",
"android/os/HandlerThread.java": r'''package android.os;import java.util.concurrent.*;import java.util.concurrent.atomic.*;public class HandlerThread extends Thread {
 public static volatile CountDownLatch startGate,exitGate;public static final AtomicInteger starts=new AtomicInteger(),alive=new AtomicInteger();private Looper looper;
 public HandlerThread(String n){super(n);}protected void onLooperPrepared(){}
 public void run(){starts.incrementAndGet();alive.incrementAndGet();try{CountDownLatch gate=startGate;if(gate!=null)gate.await();looper=new Looper();Looper.CURRENT.set(looper);onLooperPrepared();looper.loop();gate=exitGate;if(gate!=null)gate.await();}catch(InterruptedException e){Thread.currentThread().interrupt();}finally{alive.decrementAndGet();}}
 public boolean quitSafely(){looper.quitting=true;return true;}}
''',
"android/content/Context.java": r'''package android.content;import android.content.pm.*;import android.view.*;public class Context {
 public final PackageManager packages;public final WindowManager manager;public android.os.UserManager users=new android.os.UserManager();public android.hardware.display.DisplayManager displays=new android.hardware.display.DisplayManager();public Display display;public int windowContexts,windowType;
 public Context(){packages=new PackageManager();manager=new WindowManager();}private Context(Context p,Display d){packages=p.packages;manager=p.manager;display=d;users=p.users;displays=p.displays;}
 public PackageManager getPackageManager(){return packages;}public Context createWindowContext(Display d,int type,android.os.Bundle b){windowContexts++;windowType=type;return new Context(this,d);}
 public String getPackageName(){return "ls.augment.com";}public <T>T getSystemService(Class<T> type){return type.cast(type==android.os.UserManager.class?users:type==android.hardware.display.DisplayManager.class?displays:manager);}}
''',
"android/view/View.java": r'''package android.view;import android.content.*;public class View {
 public static final int IMPORTANT_FOR_ACCESSIBILITY_NO=2;protected final Context context;private boolean attached,focused;
 public boolean focusable,touchFocusable;public int background,accessibility;public View(Context c){context=c;}
 public void setBackgroundColor(int v){background=v;}public void setFocusable(boolean v){focusable=v;}public void setFocusableInTouchMode(boolean v){touchFocusable=v;}
 public void setImportantForAccessibility(int v){accessibility=v;}public boolean requestFocus(){return true;}
 public boolean isAttachedToWindow(){return attached;}public boolean hasWindowFocus(){return focused;}public Display getDisplay(){return context.display;}
 protected void onAttachedToWindow(){}protected void onDetachedFromWindow(){}public void onWindowFocusChanged(boolean v){}
 public final void attach(){attached=true;onAttachedToWindow();}public final void focus(boolean v){focused=v;onWindowFocusChanged(v);}public final void detach(){attached=false;focused=false;onDetachedFromWindow();}}
''',
"android/widget/FrameLayout.java": "package android.widget;public class FrameLayout extends android.view.View {public FrameLayout(android.content.Context c){super(c);}}",
"android/view/WindowManagerGlobal.java": r'''package android.view;import java.util.*;public final class WindowManagerGlobal {
 public static final WindowManagerGlobal INSTANCE=new WindowManagerGlobal();public final Set<View> owned=Collections.synchronizedSet(new HashSet<>());public static volatile boolean unreadable;
 public static WindowManagerGlobal getInstance(){return INSTANCE;}public List<View> getWindowViews(){if(unreadable)throw new IllegalStateException("synthetic-private-text");synchronized(owned){return new ArrayList<>(owned);}}}
''',
"android/view/inspector/WindowInspector.java": "package android.view.inspector;public class WindowInspector {public static java.util.List<android.view.View> getGlobalWindowViews(){return android.view.WindowManagerGlobal.INSTANCE.getWindowViews();}}",
"android/view/WindowManager.java": r'''package android.view;import android.os.*;import java.util.*;import java.util.concurrent.*;public class WindowManager {
 public static class BadTokenException extends RuntimeException{}public static class InvalidDisplayException extends RuntimeException{}
 public static class LayoutParams {public static final int TYPE_SYSTEM_DIALOG=2008,FLAG_NOT_TOUCHABLE=16,FLAG_NOT_TOUCH_MODAL=32,FLAG_NOT_FOCUSABLE=8,FLAG_ALT_FOCUSABLE_IM=131072,FLAG_DIM_BEHIND=2;
 public static final int SOFT_INPUT_STATE_ALWAYS_HIDDEN=3,SOFT_INPUT_ADJUST_NOTHING=48;public int width,height,type,flags,format,gravity,x,y,windowAnimations,softInputMode;public float dimAmount;public String title;
 public int privateFlags,fitInsetsTypes=3,fitInsetsCalls;
 public void setFitInsetsTypes(int types){fitInsetsTypes=types;fitInsetsCalls++;privateFlags|=0x10000000;}
 public LayoutParams(int w,int h,int t,int f,int p){width=w;height=h;type=t;flags=f;format=p;}public void setTitle(CharSequence t){title=t.toString();}}
 public volatile boolean autoFocus=true,attach=true,badToken,preRegistrationFailure,unknownAddFailure,skipDetach,removeThrowsAfterDetach;public volatile int removeFailures;
 public volatile boolean capturedCompatibility;public volatile int deliveredPrivateFlags;
 public volatile CountDownLatch addGate,removeGate;public volatile int adds,removes;public volatile View last;public volatile LayoutParams params;public volatile Handler ui;
 public final Set<View> owned=Collections.synchronizedSet(new HashSet<>());public final CountDownLatch added=new CountDownLatch(1),removeEntered=new CountDownLatch(1);
 public void addView(View view,LayoutParams p){adds++;last=view;params=p;ui=new Handler(Looper.myLooper());added.countDown();await(addGate);if(capturedCompatibility)applyCapturedCompatibility(p);if(badToken)throw new BadTokenException();if(preRegistrationFailure)throw new IllegalStateException("synthetic-private-text");owned.add(view);WindowManagerGlobal.INSTANCE.owned.add(view);if(attach)view.attach();if(unknownAddFailure)throw new IllegalStateException("synthetic-private-text");if(autoFocus)ui.post(()->view.focus(true));}
 // Controlled model of captured ViewRootImpl compatibility for this type/flags and default ZTE IME fit=false.
 // This is not a live WMS permission or layout simulation; the actual hook gate is tested separately.
 private void applyCapturedCompatibility(LayoutParams p){p.privateFlags&=~0x40000000;
  if((p.privateFlags&0x10000000)==0){if((p.fitInsetsTypes&3)==3&&(p.softInputMode&0xf0)!=0x10)p.privateFlags|=0x40000000;p.setFitInsetsTypes(p.fitInsetsTypes);p.privateFlags&=~0x10000000;}
  deliveredPrivateFlags=p.privateFlags;if((p.privateFlags&0x40000000)!=0)throw new BadTokenException();}
 public void removeViewImmediate(View view){removes++;removeEntered.countDown();await(removeGate);if(removeFailures>0){removeFailures--;throw new IllegalStateException("synthetic-private-text");}
 if(!owned.remove(view))throw new IllegalArgumentException("not registered");WindowManagerGlobal.INSTANCE.owned.remove(view);if(!skipDetach)view.detach();if(removeThrowsAfterDetach){removeThrowsAfterDetach=false;throw new IllegalStateException("synthetic-private-text");}}
 public void focus(){View view=last;ui.post(()->view.focus(true));}public void staleFocus(View view){ui.post(()->view.focus(true));}
 private static void await(CountDownLatch gate){if(gate==null)return;boolean interrupted=false;while(true)try{gate.await();break;}catch(InterruptedException e){interrupted=true;}if(interrupted)Thread.currentThread().interrupt();}}
''',
}

TEST = r'''package ls.augment.com;
import android.content.*;import android.os.*;import android.view.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import java.util.function.*;
public final class TestAtomicWorkbenchInputFocusGuard {
 static int checks,cases;interface Work{void run()throws Exception;}
 static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static void until(BooleanSupplier b,String m)throws Exception{long end=System.nanoTime()+1_500_000_000L;while(!b.getAsBoolean()){if(System.nanoTime()>end)throw new AssertionError(m);Thread.sleep(2);}checks++;}
 static void run(String name,Work work)throws Exception{try{work.run();cases++;System.out.println("PASS focus guard: "+name);}finally{HandlerThread.startGate=null;HandlerThread.exitGate=null;WindowManagerGlobal.unreadable=false;android.os.Process.uid=0;}}
 static Exception fails(Work work,String m)throws Exception{try{work.run();throw new AssertionError(m);}catch(Exception expected){check(expected.getMessage()!=null&&!expected.getMessage().isEmpty(),"unreadable failure");java.io.StringWriter text=new java.io.StringWriter();expected.printStackTrace(new java.io.PrintWriter(text));check(!text.toString().contains("synthetic-private-text"),"WMS private text leaked in causal stack");return expected;}}
 static AtomicWorkbenchInputFocusGuard guard(){return new AtomicWorkbenchInputFocusGuard(100,100);}
 static Display display(){return new Display();}
 static Display other(){Display d=display();d.id=52;d.name=d.name.replace("w0","w1");d.unique="synthetic:52";return d;}
 static final class Call {final CountDownLatch done=new CountDownLatch(1);volatile Throwable failure;final Thread thread;Call(Work work){thread=new Thread(()->{try{work.run();}catch(Throwable e){failure=e;}finally{done.countDown();}});thread.start();}void join()throws Exception{check(done.await(1500,TimeUnit.MILLISECONDS),"call exceeded deadline");thread.join();}void ok()throws Exception{join();if(failure!=null)throw new AssertionError("operation failed",failure);}void rejected()throws Exception{join();check(failure instanceof Exception,"operation unexpectedly succeeded");}}
 static void noThreads()throws Exception{until(()->HandlerThread.alive.get()==0,"owned handler thread leaked");}
 public static void main(String[] args)throws Exception{
  run("Root and authenticated virtual-display boundary",()->{
   Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();android.os.Process.uid=10515;fails(()->g.suspend(c,display()),"non-root accepted");android.os.Process.uid=0;
   for(int mode=0;mode<12;mode++){Display d=display();switch(mode){case 0:d.id=0;break;case 1:d.valid=false;break;case 2:d.name="unowned";break;case 3:d.owner=10515;break;case 4:d.type=1;break;case 5:d.flags&=~Display.FLAG_TRUSTED;break;case 6:d.flags&=~Display.FLAG_OWN_FOCUS;break;case 7:d.flags|=Display.FLAG_PRIVATE;break;case 8:d.flags|=Display.FLAG_PRESENTATION;break;case 9:d.unique="";break;case 10:d.name=d.name.replace("10515","10516");break;case 11:d.name=d.name.replace("w0","w4");break;}fails(()->g.suspend(c,d),"invalid display accepted");}
   check(c.windowContexts==0&&c.manager.adds==0,"invalid identity touched WMS");g.close();noThreads();
  });
  run("real focus callback, persistent idempotence, exact flags, detach and reuse",()->{
   Context c=new Context();Display d=display();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,d);
   check(c.manager.last.hasWindowFocus()&&c.manager.owned.size()==1,"not a real focus window");WindowManager.LayoutParams p=c.manager.params;
   check(c.windowType==2008&&p.type==2008&&p.width==1&&p.height==1,"wrong window type or size");
   check(p.flags==(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE|WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL),"focus/IME/touch flags changed");
   check(p.softInputMode==(3|48)&&p.dimAmount==0&&p.windowAnimations==0,"guard would pop keyboard or dim");
   check(c.manager.last.focusable&&c.manager.last.touchFocusable&&c.manager.last.background==0,"guard root configuration");
   check(d.flags==(Display.FLAG_TRUSTED|Display.FLAG_OWN_FOCUS),"display flags mutated");g.suspend(c,d);check(c.manager.adds==1,"idempotence created another window");
   g.resume();check(c.manager.removes==1&&c.manager.owned.isEmpty(),"resume did not remove");noThreads();g.resume();g.suspend(c,d);check(c.manager.adds==2,"resume cannot be reused");g.close();g.close();noThreads();fails(()->g.suspend(c,d),"closed guard reused");
  });
  run("requestFocus without WMS focus is not success; timeout removes",()->{
   Context c=new Context();c.manager.autoFocus=false;AtomicWorkbenchInputFocusGuard g=guard();long start=System.nanoTime();fails(()->g.suspend(c,display()),"requestFocus faked success");
   check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<800,"focus timeout not bounded");check(c.manager.adds==1&&c.manager.removes==1&&c.manager.owned.isEmpty(),"timeout left window");noThreads();g.close();
  });
  run("delayed genuine focus acknowledgement",()->{
   Context c=new Context();c.manager.autoFocus=false;AtomicWorkbenchInputFocusGuard g=new AtomicWorkbenchInputFocusGuard(500,100);Call call=new Call(()->g.suspend(c,display()));
   check(c.manager.added.await(500,TimeUnit.MILLISECONDS),"no add");until(()->c.manager.last.isAttachedToWindow(),"no attach");check(call.done.getCount()==1,"add falsely acknowledged");c.manager.focus();call.ok();g.close();noThreads();
  });
  run("registered window never attached cannot fake focus or leak after successful removal",()->{
   Context c=new Context();c.manager.attach=false;c.manager.skipDetach=true;AtomicWorkbenchInputFocusGuard g=guard();fails(()->g.suspend(c,display()),"unattached window accepted");check(c.manager.owned.isEmpty(),"unattached registration not removed");noThreads();g.close();
  });
  run("callback display and identity are revalidated",()->{
   Context c=new Context();c.manager.autoFocus=false;Display d=display();AtomicWorkbenchInputFocusGuard g=new AtomicWorkbenchInputFocusGuard(500,100);Call call=new Call(()->g.suspend(c,d));
   check(c.manager.added.await(500,TimeUnit.MILLISECONDS),"no add");until(()->c.manager.last.isAttachedToWindow(),"no attach");d.unique="recycled-identity";c.manager.focus();call.rejected();check(c.manager.owned.isEmpty(),"invalidated identity retained window");g.close();noThreads();
  });
  run("concurrent resume invalidates pending focus and old callbacks",()->{
   Context c=new Context();c.manager.autoFocus=false;AtomicWorkbenchInputFocusGuard g=new AtomicWorkbenchInputFocusGuard(500,200);Call call=new Call(()->g.suspend(c,display()));
   check(c.manager.added.await(500,TimeUnit.MILLISECONDS),"no add");until(()->c.manager.last.isAttachedToWindow(),"no attach");View old=c.manager.last;g.resume();call.rejected();noThreads();
   c.manager.autoFocus=true;g.suspend(c,display());old.focus(true);check(c.manager.owned.size()==1,"old callback altered lease");g.resume();noThreads();
  });
  run("WMS add rejection cleans thread; uncertain add failure removes exact view",()->{
   for(boolean known:new boolean[]{true,false}){Context c=new Context();c.manager.badToken=known;c.manager.unknownAddFailure=!known;AtomicWorkbenchInputFocusGuard g=guard();fails(()->g.suspend(c,display()),"add failure accepted");check(c.manager.owned.isEmpty(),"failed add leaked ownership");check(c.manager.removes==(known?0:1),"incorrect rejected/uncertain cleanup");g.close();noThreads();}
  });
  run("real candidate4 openSession failure proves absent global registration before cleanup",()->{
   Context c=new Context();c.manager.preRegistrationFailure=true;AtomicWorkbenchInputFocusGuard g=guard();Exception failure=fails(()->g.suspend(c,display()),"failed session creation was hidden");
   check(c.manager.removes==0,"removed view which never registered");check(c.manager.owned.isEmpty()&&WindowManagerGlobal.INSTANCE.getWindowViews().isEmpty(),"empty registration proof invalid");
   boolean typed=false;for(Throwable at=failure;at!=null;at=at.getCause())if(at instanceof IllegalStateException)typed=true;check(typed,"original causal type was discarded");noThreads();g.resume();g.close();
  });
  run("never-attached registered view still must be removed, not mistaken for empty lease",()->{
   Context c=new Context();c.manager.attach=false;c.manager.unknownAddFailure=true;c.manager.skipDetach=true;AtomicWorkbenchInputFocusGuard g=guard();fails(()->g.suspend(c,display()),"registered failed add accepted");check(c.manager.removes==1&&c.manager.owned.isEmpty(),"registered never-attached window leaked");noThreads();g.close();
  });
  run("unavailable global-registration evidence retains exact cleanup responsibility",()->{
   Context c=new Context();c.manager.preRegistrationFailure=true;WindowManagerGlobal.unreadable=true;AtomicWorkbenchInputFocusGuard g=guard();fails(()->g.suspend(c,display()),"unreadable registration faked cleanup");fails(()->g.suspend(c,other()),"unknown registry discarded lease");
   check(c.manager.removes==0,"unconfirmed membership removal attempted");WindowManagerGlobal.unreadable=false;g.resume();noThreads();g.close();
  });
  run("remove failure retains same lease and retry removes",()->{
   Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,display());c.manager.removeFailures=1;fails(g::resume,"remove failure faked success");
   check(c.manager.owned.size()==1,"failed remove lost window ownership");int adds=c.manager.adds;fails(()->g.suspend(c,other()),"new display replaced pending lease");check(c.manager.adds==adds,"pending lease spawned a thread");g.resume();check(c.manager.owned.isEmpty()&&c.manager.removes==2,"cleanup not retryable");noThreads();g.close();
  });
  run("detach then throw retains responsibility and retry finishes without second remove",()->{
   Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,display());c.manager.removeThrowsAfterDetach=true;fails(g::close,"post-detach failure hidden");check(c.manager.owned.isEmpty(),"fake setup");g.close();check(c.manager.removes==1,"confirmed detach was redundantly removed");noThreads();
  });
  run("missing detach acknowledgement cannot report cleanup success",()->{
   Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,display());c.manager.skipDetach=true;fails(g::resume,"missing detach accepted");fails(()->g.suspend(c,other()),"missing detach dropped responsibility");
   c.manager.last.detach();g.resume();noThreads();g.close();
  });
  run("noncooperative add is bounded and late focus cannot resurrect timed-out lease",()->{
   Context c=new Context();c.manager.addGate=new CountDownLatch(1);AtomicWorkbenchInputFocusGuard g=guard();long start=System.nanoTime();
   try{fails(()->g.suspend(c,display()),"blocked add accepted");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<800,"blocked binder held caller lock");int starts=HandlerThread.starts.get();fails(()->g.suspend(c,other()),"blocked lease replaced");check(HandlerThread.starts.get()==starts,"unbounded extra handler threads");}
   finally{c.manager.addGate.countDown();}until(()->c.manager.owned.isEmpty()&&HandlerThread.alive.get()==0,"late add not cleaned");g.resume();g.close();
  });
  run("noncooperative removal is bounded and owner may retry",()->{
   Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,display());c.manager.removeGate=new CountDownLatch(1);long start=System.nanoTime();
   try{fails(g::resume,"blocked remove accepted");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<600,"remove held caller lock");check(c.manager.owned.size()==1,"blocked remove lost lease");fails(()->g.suspend(c,other()),"pending removal replaced");}
   finally{c.manager.removeGate.countDown();}until(()->HandlerThread.alive.get()==0,"late removal not completed");g.resume();g.close();
  });
  run("unprepared looper is bounded, retained and eventually released",()->{
   HandlerThread.startGate=new CountDownLatch(1);Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();long start=System.nanoTime();
   try{fails(()->g.suspend(c,display()),"stuck startup accepted");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<800,"getLooper blocked caller");check(c.manager.adds==0,"startup gate ineffective");fails(()->g.suspend(c,other()),"startup lease replaced");}
   finally{HandlerThread.startGate.countDown();HandlerThread.startGate=null;}until(()->HandlerThread.alive.get()==0,"deferred pre-add cleanup failed");g.resume();g.close();
  });
  run("PackageManager verification also stays off the Root engine caller",()->{
   Context c=new Context();c.packages.gate=new CountDownLatch(1);AtomicWorkbenchInputFocusGuard g=guard();long start=System.nanoTime();
   try{fails(()->g.suspend(c,display()),"blocked package verification accepted");check(TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-start)<800,"package binder blocked Root caller");check(c.manager.adds==0,"unverified package created system window");}
   finally{c.packages.gate.countDown();}until(()->HandlerThread.alive.get()==0,"late package verification did not clean");g.resume();g.close();
  });
  run("window removed but noncooperative looper exit retains release responsibility",()->{
   HandlerThread.exitGate=new CountDownLatch(1);Context c=new Context();AtomicWorkbenchInputFocusGuard g=guard();g.suspend(c,display());
   try{fails(g::resume,"thread exit faked success");check(c.manager.owned.isEmpty(),"window removal not performed");fails(()->g.suspend(c,other()),"unreleased thread responsibility lost");}
   finally{HandlerThread.exitGate.countDown();HandlerThread.exitGate=null;}noThreads();g.resume();g.close();
  });
  run("interruption retains cleanup; permanent close races pending focus safely",()->{
   Context c=new Context();c.manager.autoFocus=false;AtomicWorkbenchInputFocusGuard g=new AtomicWorkbenchInputFocusGuard(500,200);Call call=new Call(()->g.suspend(c,display()));
   check(c.manager.added.await(500,TimeUnit.MILLISECONDS),"no add");call.thread.interrupt();call.rejected();check(call.thread.isInterrupted(),"interrupt not restored");g.close();noThreads();fails(()->g.suspend(c,display()),"close not permanent");
   Context c2=new Context();c2.manager.autoFocus=false;AtomicWorkbenchInputFocusGuard g2=new AtomicWorkbenchInputFocusGuard(500,200);Call pending=new Call(()->g2.suspend(c2,display()));check(c2.manager.added.await(500,TimeUnit.MILLISECONDS),"no add");g2.close();pending.rejected();noThreads();
  });
  System.out.println("PASS production focus guard: "+cases+" cases, "+checks+" assertions");
 }
}
'''


CAPTURED_COMPAT_TEST = r'''
  run("explicit insets survive captured ROM compatibility on the actual managed Guard path",()->{
   Context c=new Context();Display d=display();c.displays.display=d;c.manager.capturedCompatibility=true;android.os.Process.uid=10515;
   AtomicWorkbenchInputFocusGuard g=AtomicWorkbenchInputFocusGuard.managed(10515,0,()->true,333,99,0,d.id,d.name,d.unique);
   try{g.suspendManaged(c);}catch(Exception error){throw new AssertionError("explicit fit insets missing at real managed Guard add",error);}
   WindowManager.LayoutParams p=c.manager.params;
   check(p.fitInsetsCalls==1&&p.fitInsetsTypes==0,"own 1px window did not explicitly disable fitted insets");
   check(c.manager.deliveredPrivateFlags==0x10000000,"unexpected captured compatibility private flags");
   check(p.width==1&&p.height==1&&p.x==0&&p.y==0&&p.type==2008,"guard bounds or type changed");
   check(p.flags==48&&p.softInputMode==51&&p.dimAmount==0&&p.windowAnimations==0,"guard input/touch/IME flags changed");
   check(c.manager.last.hasWindowFocus()&&c.manager.last.isAttachedToWindow(),"real attached focus callback missing");
   g.resume();check(c.manager.owned.isEmpty()&&c.manager.removes==1,"managed guard detach missing");noThreads();g.close();
  });
'''


def build_run(folder, source, expect_success=True, expected_failure=None):
    src = folder / "ls/augment/com/AtomicWorkbenchInputFocusGuard.java"
    src.parent.mkdir(parents=True, exist_ok=True)
    src.write_text(source, encoding="utf-8")
    for name, text in STUBS.items():
        target = folder / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8")
    test = folder / "ls/augment/com/TestAtomicWorkbenchInputFocusGuard.java"
    marker = '  System.out.println("PASS production focus guard: "'
    if TEST.count(marker) != 1:
        raise AssertionError("original test runner insertion point changed")
    test.write_text(TEST.replace(marker, CAPTURED_COMPAT_TEST + marker), encoding="utf-8")
    out = folder / "classes"
    result = subprocess.run([JAVAC, "-encoding", "UTF-8", "-d", str(out), *map(str, folder.rglob("*.java"))], text=True, encoding="utf-8", capture_output=True, env=ENV)
    if result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    result = subprocess.run([JAVA, "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8", "-cp", str(out), "ls.augment.com.TestAtomicWorkbenchInputFocusGuard"], text=True, encoding="utf-8", capture_output=True, env=ENV, timeout=25)
    if expect_success:
        print(result.stdout, end="")
        if result.returncode:
            raise RuntimeError(result.stderr)
    elif result.returncode == 0:
        raise AssertionError("negative control escaped the production-boundary regression")
    if expected_failure is not None and expected_failure not in result.stdout + result.stderr:
        raise AssertionError("compiled negative did not fail at the required behavior: " + result.stdout + result.stderr)


def main():
    source = SOURCE.read_text(encoding="utf-8")
    with tempfile.TemporaryDirectory(prefix="duo-focus-guard-") as temporary:
        folder = Path(temporary)
        build_run(folder / "production", source)
        mutations = {
            "requestFocus is not a focus acknowledgement": source.replace("requested.focusCallbackSeen)", "true)").replace("requested.focusCallbackSeen\n", "true\n").replace("view.requestFocus();", "view.requestFocus(); synchronized (lock) { requested.focused = true; requested.focusCallbackSeen = true; requested.focusReady.countDown(); }"),
            "failed removal cannot release ownership": source.replace('attempt.failure = problem("焦点守护窗口未移除，清理责任已保留", failure);', 'requested.removed = true; requested.thread.quitSafely();'),
            "candidate4 failed openSession must not strand an unregistered view": source.replace("&& !registeredWithWindowManager(requested.view);", "&& false;"),
            "never-attached alone is not proof of absent system registration": source.replace("&& !registeredWithWindowManager(requested.view);", "&& true;"),
        }
        for index, (name, mutated) in enumerate(mutations.items()):
            if mutated == source:
                raise AssertionError("negative mutation had no effect")
            build_run(folder / f"negative-{index}", mutated, False)
            print("PASS negative control: " + name)
        setter = "            params.setFitInsetsTypes(0);"
        if source.count(setter) != 1:
            raise AssertionError("explicit fit-insets negative must target exactly one production setter")
        build_run(folder / "negative-fit-insets", source.replace(setter, ""), False,
                  "explicit fit insets missing at real managed Guard add")
        print("PASS compiled negative control: deleted explicit fit-insets setter reaches managed Guard add and is rejected")
        sdk = ROOT / "audit-output/android-sdk/platforms/android-36/android.jar"
        if sdk.exists():
            result = subprocess.run([JAVAC, "-encoding", "UTF-8", "-classpath", str(sdk), "-d", str(folder / "sdk36"), str(SOURCE)], text=True, encoding="utf-8", capture_output=True, env=ENV)
            if result.returncode:
                raise RuntimeError(result.stdout + result.stderr)
            print("PASS SDK36 production focus guard compilation")
        else:
            raise FileNotFoundError("SDK36 Android jar unavailable; signature compilation is required")


if __name__ == "__main__":
    main()
