"""Run the actual system wallpaper helper against controlled Android 16 service boundaries."""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
HOME = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-hook.py")))
SOURCES = {
    "android/os/Bundle.java": SUPPORT["BUNDLE"],
    "android/os/SystemClock.java": '''package android.os;public class SystemClock {public static long now=1000;public static long uptimeMillis(){return now;}}''',
    "android/content/Context.java": '''package android.content;public class Context {}''',
    "ls/augment/com/BuildConfig.java": '''package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20562;}''',
    "ls/augment/com/hook/FeatureSettings.java": '''package ls.augment.com.hook;public class FeatureSettings {public static String value;public static int writes;static void diagnosticHomeReadiness(android.content.Context c,String key,String state){value=state;writes++;}}''',
    "io/github/libxposed/api/XposedInterface.java": '''package io.github.libxposed.api;public interface XposedInterface {interface Hooker {Object intercept(Chain c)throws Throwable;}interface Chain {Object proceed()throws Throwable;Object getThisObject();java.util.List<Object> getArgs();}interface HookHandle{}interface HookBuilder {HookHandle intercept(Hooker h);}}''',
    "android/os/IBinder.java": '''package android.os;public interface IBinder {boolean isBinderAlive();}''',
    "android/os/IInterface.java": '''package android.os;public interface IInterface {IBinder asBinder();}''',
    "android/service/wallpaper/IWallpaperEngine.java": '''package android.service.wallpaper;public interface IWallpaperEngine extends android.os.IInterface {}''',
    "android/os/Binder.java": HOME["SOURCES"]["android/os/Binder.java"],
    "android/view/Display.java": HOME["SOURCES"]["android/view/Display.java"],
    "android/os/Process.java": '''package android.os;public class Process {public static final int THREAD_PRIORITY_BACKGROUND=10;public static int uid=1000;public static int myUid(){return uid;}}''',
    "android/os/Looper.java": '''package android.os;public class Looper {}''',
    "android/os/HandlerThread.java": '''package android.os;public class HandlerThread {public HandlerThread(String n,int p){}public void start(){}public Looper getLooper(){return new Looper();}}''',
    "android/os/Handler.java": '''package android.os;import java.util.*;public class Handler {public static final List<Runnable> queued=new ArrayList<>();static final Map<Runnable,Long> due=new IdentityHashMap<>();public static long lastDelay;public static boolean running,stopped;public Handler(Looper l){}public boolean post(Runnable r){if(stopped)return false;queued.add(r);due.put(r,SystemClock.now);return true;}public boolean postDelayed(Runnable r,long d){if(stopped)return false;lastDelay=d;queued.add(r);due.put(r,SystemClock.now+d);return true;}public void removeCallbacks(Runnable r){queued.removeIf(v->v==r);due.remove(r);}public static void tick(){if(queued.isEmpty())return;long next=Long.MAX_VALUE;for(Runnable r:queued)next=Math.min(next,due.getOrDefault(r,SystemClock.now));SystemClock.now=Math.max(SystemClock.now,next);List<Runnable> q=new ArrayList<>();for(Runnable r:new ArrayList<>(queued))if(due.getOrDefault(r,0L)<=SystemClock.now){q.add(r);queued.remove(r);due.remove(r);}running=true;try{for(Runnable r:q)r.run();}finally{running=false;}}}''',
    "android/util/SparseArray.java": '''package android.util;import java.util.*;public class SparseArray<T> {public final Map<Integer,T> values=new HashMap<>();public T get(int id){return values.get(id);}public void put(int id,T value){values.put(id,value);}public void remove(int id){values.remove(id);}}''',
    "com/android/server/LocalServices.java": '''package com.android.server;public class LocalServices {public static Object service;public static Object getService(Class<?> type){return service;}}''',
    "com/android/server/wm/ActivityTaskManagerService.java": '''package com.android.server.wm;public class ActivityTaskManagerService {public final Object mGlobalLock=new Object();public final android.content.Context mContext=new android.content.Context();public final RootWindowContainer mRootWindowContainer=new RootWindowContainer();}''',
    "com/android/server/wm/RootWindowContainer.java": '''package com.android.server.wm;public class RootWindowContainer {public final DisplayContent display=new DisplayContent();public final HomeTask task=new HomeTask(display);public boolean missing;public DisplayContent getDisplayContent(int id){return !missing&&id==display.mDisplay.id?display:null;}public HomeTask anyTaskForId(int id,int mode){return id==72?task:null;}}''',
    "com/android/server/wm/HomeTask.java": '''package com.android.server.wm;public class HomeTask {final DisplayContent display;public final Activity activity;public HomeTask(DisplayContent d){display=d;activity=new Activity(d);}public int getDisplayId(){return display.mDisplay.id;}public Activity topRunningActivity(){return activity;}public static class Activity {public final WindowState window;Activity(DisplayContent d){window=new WindowState(d);}public WindowState findMainWindow(){return window;}}}''',
    "com/android/server/wm/WindowState.java": '''package com.android.server.wm;public class WindowState {public DisplayContent content;public boolean drawn;public WindowState(DisplayContent d){content=d;}public DisplayContent getDisplayContent(){return content;}public boolean isDrawn(){return drawn;}}''',
    "com/android/server/wm/DisplayContent.java": '''package com.android.server.wm;public class DisplayContent {public final android.view.Display mDisplay=new android.view.Display();public final WallpaperController mWallpaperController=new WallpaperController();public boolean home=true,decors=true;public int getDisplayId(){return mDisplay.id;}public boolean isHomeSupported(){return home;}public boolean isSystemDecorationsSupported(){return decors;}}''',
    "com/android/server/wm/WallpaperController.java": '''package com.android.server.wm;import java.util.*;public class WallpaperController {public Object mWallpaperTarget=new Object();public final List<WallpaperWindowToken> mWallpaperTokens=new ArrayList<>();}''',
    "com/android/server/wm/WallpaperWindowToken.java": '''package com.android.server.wm;public class WallpaperWindowToken {public final Object token;public boolean visible;public final WindowState window;public WallpaperWindowToken(Object t,boolean v,DisplayContent d){token=t;visible=v;window=new WindowState(d);}public boolean isVisible(){return visible;}public int getChildCount(){return 1;}public WindowState getChildAt(int index){return window;}}''',
    "com/android/server/wallpaper/WallpaperManagerInternal.java": '''package com.android.server.wallpaper;public abstract class WallpaperManagerInternal {public abstract void onDisplayAddSystemDecorations(int display);public abstract void onDisplayRemoveSystemDecorations(int display);}''',
    "com/android/server/wallpaper/WallpaperManagerService.java": r'''package com.android.server.wallpaper;
import android.util.SparseArray;import com.android.server.wm.*;
public class WallpaperManagerService {
 public final Object mLock=new Object();public int mCurrentUserId=0,adds,removes,removeFailures;
 public WallpaperData mLastWallpaper=new WallpaperData(),mFallbackWallpaper=new WallpaperData(),mLastLockWallpaper;
 public boolean connected=true,visible=true,tokenCreated=true,fallbackAvailable=true,failAdd,retainTokens;public final ActivityTaskManagerService atm;
 public WallpaperManagerService(ActivityTaskManagerService s){atm=s;}
 public boolean isWallpaperCompatibleForDisplay(int id,WallpaperConnection c){return c!=null&&c.compatible;}
 public static class WallpaperData {public int userId=0;public WallpaperConnection connection=new WallpaperConnection();}
 public static class WallpaperConnection {public final SparseArray<DisplayConnector> mDisplayConnector=new SparseArray<>();public boolean compatible=true;public void attachEngine(android.service.wallpaper.IWallpaperEngine e,int d){mDisplayConnector.get(d).mEngine=e;}public void engineShown(android.service.wallpaper.IWallpaperEngine e){}}
 public static class Engine implements android.service.wallpaper.IWallpaperEngine {public boolean alive=true;public android.os.IBinder asBinder(){return ()->alive;}}
 public static class DisplayConnector {public int mDisplayId;public Object mEngine,mToken=new Object();public DisplayConnector(int d){mDisplayId=d;}}
 public final class LocalService extends WallpaperManagerInternal {
  public void onDisplayAddSystemDecorations(int id){
   if(Thread.holdsLock(atm.mGlobalLock))throw new AssertionError("WMS lock held during wallpaper initialization");
   if(!Thread.holdsLock(mLock))throw new AssertionError("WPMS lock missing");
   adds++;if(failAdd)throw new SecurityException("private wallpaper path /secret/file.jpg");
   if(mLastWallpaper==null)return;
   WallpaperData chosen=isWallpaperCompatibleForDisplay(id,mLastWallpaper.connection)?mLastWallpaper:fallbackAvailable?mFallbackWallpaper:null;
   if(chosen==null||chosen.connection==null)return;
   attach(chosen,id);
  }
  public void onDisplayRemoveSystemDecorations(int id){
   if(Thread.holdsLock(atm.mGlobalLock))throw new AssertionError("WMS lock held during wallpaper removal");
   removes++;if(removeFailures-->0)throw new IllegalStateException("temporary wallpaper binder failure");
   synchronized(mLock){for(WallpaperData data:new WallpaperData[]{mLastWallpaper,mFallbackWallpaper,mLastLockWallpaper}){
    if(data==null||data.connection==null)continue;DisplayConnector c=data.connection.mDisplayConnector.get(id);if(c==null)continue;
    data.connection.mDisplayConnector.remove(id);c.mEngine=null;if(!retainTokens)atm.mRootWindowContainer.display.mWallpaperController.mWallpaperTokens.removeIf(t->t.token==c.mToken);return;}}
  }
 }
 public void attach(WallpaperData data,int id){DisplayConnector c=data.connection.mDisplayConnector.get(id);if(c==null){c=new DisplayConnector(id);data.connection.mDisplayConnector.put(id,c);}if(!connected)return;
  c.mEngine=new Engine();if(tokenCreated)atm.mRootWindowContainer.display.mWallpaperController.mWallpaperTokens.add(new WallpaperWindowToken(c.mToken,visible,atm.mRootWindowContainer.display));}
}''',
    "ls/augment/com/hook/AugmentModule.java": '''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;import io.github.libxposed.api.XposedInterface.*;public class AugmentModule {public final List<String> logs=new ArrayList<>();public final Map<Method,Hooker> hooks=new HashMap<>();public boolean failLog;public void logFeatureInfo(String s){if(failLog)throw new IllegalStateException("logging unavailable");logs.add(s);}public void logFeatureError(String s,Throwable e){logs.add(s+" "+e.getClass().getSimpleName());}public HookBuilder prepareFeatureHook(Method m,String id,boolean protect){return h->{hooks.put(m,h);return new HookHandle(){};};}public void registerFeatureHook(HookHandle h){}public void deoptimize(Method m){}public void invoke(Object owner,String name,Class<?>[] types,Object...args)throws Exception{Method m=owner.getClass().getMethod(name,types);Hooker h=hooks.get(m);if(h==null)throw new AssertionError("real callback hook missing");try{h.intercept(new Chain(){public Object proceed()throws Throwable{return m.invoke(owner,args);}public Object getThisObject(){return owner;}public List<Object> getArgs(){return Arrays.asList(args);}});}catch(Exception e){throw e;}catch(Throwable e){throw new AssertionError(e);}}}''',
}

TEST = r'''package ls.augment.com.hook;
import android.os.*;import com.android.server.*;import com.android.server.wm.*;import com.android.server.wallpaper.*;import java.lang.reflect.*;import java.util.*;
public class TestAtomicWallpaper {
 static int tests,checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 interface Case {void run()throws Exception;}static void test(String name,Case body)throws Exception{body.run();tests++;System.out.println("PASS production wallpaper: "+name);}
 static class Fixture {
  final AugmentModule module=new AugmentModule();final ActivityTaskManagerService atm=new ActivityTaskManagerService();
  final DisplayContent display=atm.mRootWindowContainer.display;final WallpaperManagerService wp=new WallpaperManagerService(atm);
  boolean active=true;AtomicWorkbenchWallpaperHook.Session session;
  Fixture()throws Exception{Handler.queued.clear();Handler.stopped=false;SystemClock.now=1000;FeatureSettings.writes=0;Field f=AtomicWorkbenchWallpaperHook.class.getDeclaredField("SESSIONS");f.setAccessible(true);((Map<?,?>)f.get(null)).clear();f=AtomicWorkbenchWallpaperHook.class.getDeclaredField("interfaceObserversAttempted");f.setAccessible(true);f.setBoolean(null,false);LocalServices.service=wp.new LocalService();android.os.Process.uid=1000;Binder.uid=0;}
  void acquire(){synchronized(atm.mGlobalLock){session=AtomicWorkbenchWallpaperHook.acquire(module,atm,88,0,display.mDisplay.name,display.mDisplay.unique,()->active);}check(wp.adds==0,"acquire called WPMS under HOME caller");}
  Bundle state(){return AtomicWorkbenchWallpaperHook.snapshot(session);}
  String status(){return state().getString("wallpaper_state");}
  void drain(){for(int n=0;n<100&&!Handler.queued.isEmpty();n++){Handler.tick();if(session!=null&&session.readinessMonitoring&&!session.cancelled)break;}check(Handler.queued.isEmpty()||session!=null&&session.readinessMonitoring&&Handler.queued.size()==1&&Handler.lastDelay==2000,"polling/lease monitoring was not bounded");}
  void acquireHome(){session=AtomicWorkbenchWallpaperHook.acquire(module,atm,88,0,display.mDisplay.name,display.mDisplay.unique,72,()->active);Handler.tick();}
  void drawHome(){atm.mRootWindowContainer.task.activity.window.drawn=true;AtomicWorkbenchWallpaperHook.noteDrawn(atm.mRootWindowContainer.task.activity.window);display.mWallpaperController.mWallpaperTokens.get(0).window.drawn=true;AtomicWorkbenchWallpaperHook.noteDrawn(display.mWallpaperController.mWallpaperTokens.get(0).window);Handler.tick();}
  void release(){synchronized(atm.mGlobalLock){AtomicWorkbenchWallpaperHook.release(session);}drain();}
 }
 public static void main(String[] args)throws Exception {
  test("late decor initialization connects actual current wallpaper engine",()->{Fixture f=new Fixture();f.acquire();Handler.tick();check(f.wp.adds==1&&f.status().equals("interface_ready"),"current connector not initialized");check(f.state().getBoolean("wallpaper_current_engine")&&f.state().getBoolean("wallpaper_token_present")&&f.state().getBoolean("wallpaper_client_visible"),"interface evidence absent");check(!f.state().getBoolean("wallpaper_frame_verified"),"interface state claimed a rendered frame");check(Binder.uid==0,"Binder identity not restored");});
  test("incompatible current wallpaper uses actual system fallback",()->{Fixture f=new Fixture();f.wp.mLastWallpaper.connection.compatible=false;f.acquire();f.drain();check(f.status().equals("interface_ready")&&f.state().getString("wallpaper_source").equals("fallback"),"fallback not identified");check(!f.state().getBoolean("wallpaper_current_compatible")&&!f.state().getBoolean("wallpaper_current_engine"),"unsupported current wallpaper impersonated");});
  test("missing fallback is an honest bounded timeout",()->{Fixture f=new Fixture();f.wp.mLastWallpaper.connection.compatible=false;f.wp.fallbackAvailable=false;f.acquire();f.drain();check(f.status().equals("timeout")&&f.wp.adds==1,"fallback absence silently succeeded or retried unboundedly");check(f.module.logs.size()<=4,"poll spam");});
  test("existing engine and token do not cause duplicate attach",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.acquire();f.drain();check(f.wp.adds==0&&f.status().equals("interface_ready"),"healthy connector duplicated");});
  test("asynchronous service connection is observed without duplicate initialization",()->{Fixture f=new Fixture();f.wp.connected=false;f.acquire();Handler.tick();check(f.status().equals("waiting")&&f.wp.adds==1,"async state not pending");f.wp.connected=true;f.wp.attach(f.wp.mLastWallpaper,88);f.drain();check(f.status().equals("interface_ready")&&f.wp.adds==1,"late engine ignored or reattached");});
  test("a pending engine with registered token is not attached twice",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine=null;f.acquire();Handler.tick();check(f.wp.adds==0&&f.status().equals("waiting"),"in-flight token duplicated");f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine=new WallpaperManagerService.Engine();f.drain();check(f.status().equals("interface_ready"),"in-flight engine not observed");});
  test("dead engine with visible token cannot report interface ready",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);((WallpaperManagerService.Engine)f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine).alive=false;f.acquire();f.drain();check(f.status().equals("timeout")&&f.state().getBoolean("wallpaper_current_engine_reference")&&!f.state().getBoolean("wallpaper_current_engine"),"dead binder impersonated a connected engine");check(f.wp.adds==0,"dead engine with pending service recovery was attached twice");});
  test("replacement engine recovers from dead retained binder",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);((WallpaperManagerService.Engine)f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine).alive=false;f.acquire();Handler.tick();check(f.status().equals("waiting"),"dead engine did not wait");f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine=new WallpaperManagerService.Engine();f.drain();check(f.status().equals("interface_ready")&&f.wp.adds==0,"system engine recovery ignored or duplicated");});
  test("dead orphan engine is detached before repair",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);((WallpaperManagerService.Engine)f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine).alive=false;f.display.mWallpaperController.mWallpaperTokens.clear();f.acquire();f.drain();check(f.status().equals("interface_ready")&&f.wp.removes==1&&f.wp.adds==1,"dead orphan was reattached without removal");});
  test("engine without WMS token is detached and repaired by WPMS",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.display.mWallpaperController.mWallpaperTokens.clear();f.acquire();f.drain();check(f.wp.removes==1&&f.wp.adds==1&&f.status().equals("interface_ready"),"orphan engine was treated healthy");});
  test("hidden wallpaper engine does not claim visibility",()->{Fixture f=new Fixture();f.wp.visible=false;f.acquire();f.drain();check(f.status().equals("timeout")&&f.state().getBoolean("wallpaper_current_engine")&&!f.state().getBoolean("wallpaper_client_visible"),"hidden token passed readiness");});
  test("no wallpaper target keeps interface unconfirmed",()->{Fixture f=new Fixture();f.display.mWallpaperController.mWallpaperTarget=null;f.acquire();f.drain();check(f.status().equals("timeout")&&!f.state().getBoolean("wallpaper_target_present"),"targetless engine passed readiness");});
  test("late HOME support waits then initializes",()->{Fixture f=new Fixture();f.display.home=false;f.acquire();Handler.tick();check(f.wp.adds==0,"unsupported display initialized");f.display.home=true;f.drain();check(f.wp.adds==1&&f.status().equals("interface_ready"),"late lease support not observed");});
  test("lease precedes decoration policy without consuming initialization",()->{Fixture f=new Fixture();f.display.decors=false;f.acquire();Handler.tick();check(f.wp.adds==0&&f.state().getInt("wallpaper_initializations",-1)==0&&f.status().equals("waiting"),"initialization ran before decoration policy took effect");f.display.decors=true;f.drain();check(f.wp.adds==1&&f.status().equals("interface_ready"),"late decoration policy did not trigger first initialization");});
  test("decoration policy never becoming ready cannot claim wallpaper ready",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.display.decors=false;f.acquire();f.drain();check(f.wp.adds==0&&f.status().equals("timeout")&&!f.state().getBoolean("wallpaper_decors_supported"),"unconfigured display claimed ready from retained wallpaper token");});
  test("current wallpaper unavailable initially can become ready",()->{Fixture f=new Fixture();WallpaperManagerService.WallpaperData saved=f.wp.mLastWallpaper;f.wp.mLastWallpaper=null;f.acquire();Handler.tick();check(f.wp.adds==0,"null wallpaper initialized");f.wp.mLastWallpaper=saved;f.drain();check(f.status().equals("interface_ready"),"late current wallpaper ignored");});
  test("foreign user does not initialize or expose wallpaper",()->{Fixture f=new Fixture();f.wp.mCurrentUserId=10;f.acquire();f.drain();check(f.status().equals("unavailable")&&f.wp.adds==0&&f.state().getString("wallpaper_error").equals("SecurityException"),"foreign user accepted");});
  test("wallpaper data user must match leased HOME user",()->{Fixture f=new Fixture();f.wp.mLastWallpaper.userId=10;f.acquire();f.drain();check(f.status().equals("unavailable")&&f.wp.adds==0,"foreign WallpaperData accepted");});
  test("non-system caller and physical display are rejected",()->{Fixture f=new Fixture();android.os.Process.uid=10055;f.acquire();f.drain();check(f.status().equals("unavailable")&&f.wp.adds==0,"non-system caller accepted");AtomicWorkbenchWallpaperHook.Session s=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,0,0,f.display.mDisplay.name,f.display.mDisplay.unique,()->true);check(AtomicWorkbenchWallpaperHook.snapshot(s).getString("wallpaper_state").equals("unavailable"),"default display accepted");});
  test("display ID reuse prevents initialization and cleanup mutation",()->{Fixture f=new Fixture();f.acquire();f.display.mDisplay.unique="new-display";f.drain();check(f.status().equals("display_lost")&&f.wp.adds==0,"reused display initialized");f.release();check(f.wp.removes==0&&f.status().equals("cleanup_display_gone"),"reused display removed");});
  test("lease expiry before queued initialization does no attach",()->{Fixture f=new Fixture();f.acquire();f.active=false;f.drain();check(f.wp.adds==0&&f.status().equals("released"),"expired lease attached wallpaper");});
  test("release drains actual connector and token asynchronously",()->{Fixture f=new Fixture();f.acquire();f.drain();f.release();check(f.wp.removes==1&&f.wp.mLastWallpaper.connection.mDisplayConnector.get(88)==null&&f.display.mWallpaperController.mWallpaperTokens.isEmpty(),"connector or WMS token leaked");check(f.status().equals("released")&&f.state().getInt("wallpaper_remaining_connectors",-1)==0,"cleanup result not verified");});
  test("current and fallback transition connectors are both released",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.wp.attach(f.wp.mFallbackWallpaper,88);f.acquire();f.drain();f.release();check(f.wp.removes==2&&f.state().getInt("wallpaper_remaining_connectors",-1)==0,"fallback connector leaked");});
  test("transient cleanup failure receives bounded recovery",()->{Fixture f=new Fixture();f.acquire();f.drain();f.wp.removeFailures=1;f.release();check(f.wp.removes==2&&f.status().equals("released"),"transient detach failure not retried");});
  test("permanent cleanup failure remains explicit and bounded",()->{Fixture f=new Fixture();f.acquire();f.drain();f.wp.removeFailures=50;f.release();check(f.wp.removes==3&&f.status().equals("cleanup_failed"),"permanent removal failure lost or unbounded");});
  test("deferred WMS token removal is observed before release confirmation",()->{Fixture f=new Fixture();f.acquire();f.drain();f.wp.retainTokens=true;AtomicWorkbenchWallpaperHook.release(f.session);Handler.tick();check(f.status().equals("cleanup_pending")&&f.state().getInt("wallpaper_remaining_tokens",-1)==1,"live WMS token reported removed");f.display.mWallpaperController.mWallpaperTokens.clear();f.drain();check(f.status().equals("released")&&f.wp.removes==1,"deferred token cleanup not confirmed");});
  test("persistent WMS token remains a bounded cleanup warning",()->{Fixture f=new Fixture();f.acquire();f.drain();f.wp.retainTokens=true;f.release();check(f.status().equals("cleanup_pending")&&f.state().getInt("wallpaper_remaining_connectors",-1)==0&&f.state().getInt("wallpaper_remaining_tokens",-1)==1,"remaining token hidden by zero connector count");check(f.module.logs.size()<=6,"cleanup spam");});
  test("stale release cannot detach replacement lease",()->{Fixture f=new Fixture();f.acquire();f.drain();AtomicWorkbenchWallpaperHook.Session old=f.session;f.session=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,88,0,f.display.mDisplay.name,f.display.mDisplay.unique,()->true);AtomicWorkbenchWallpaperHook.release(old);f.drain();check(f.wp.removes==0&&f.status().equals("interface_ready"),"stale lease removed live connector");});
  test("queued release followed by replacement does not delete new owner",()->{Fixture f=new Fixture();f.acquire();f.drain();AtomicWorkbenchWallpaperHook.release(f.session);f.session=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,88,0,f.display.mDisplay.name,f.display.mDisplay.unique,()->true);f.drain();check(f.wp.removes==0&&f.status().equals("interface_ready"),"queued cleanup erased replacement");});
  test("exact system local-service contract is required",()->{Fixture f=new Fixture();LocalServices.service=new Object();f.acquire();f.drain();check(f.status().equals("unavailable")&&f.wp.adds==0,"missing lifecycle API guessed");});
  test("missing wallpaper service fails without impacting HOME",()->{Fixture f=new Fixture();LocalServices.service=null;f.acquire();f.drain();check(f.status().equals("unavailable")&&f.wp.adds==0,"absent WPMS accepted");});
  test("error diagnostics exclude private failure messages",()->{Fixture f=new Fixture();f.wp.failAdd=true;f.acquire();f.drain();check(f.status().equals("unavailable")&&f.state().getString("wallpaper_error").equals("SecurityException"),"error type lost");check(f.module.logs.stream().noneMatch(s->s.contains("secret")||s.contains("file.jpg")),"wallpaper path logged");});
  test("diagnostic failure cannot break initialization or cleanup",()->{Fixture f=new Fixture();f.module.failLog=true;f.acquire();f.drain();check(f.status().equals("interface_ready"),"logging failure broke attach");f.release();check(f.status().equals("released"),"logging failure broke cleanup");});
  test("snapshot is detached from mutable caller Bundle",()->{Fixture f=new Fixture();f.acquire();f.drain();Bundle s=f.state();s.putBoolean("wallpaper_frame_verified",true);s.putString("wallpaper_state","fake");check(!f.state().getBoolean("wallpaper_frame_verified")&&f.status().equals("interface_ready"),"caller mutated cached status");});
  test("real HOME waits for separate HOME and wallpaper drawn evidence",()->{Fixture f=new Fixture();f.session=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,88,0,f.display.mDisplay.name,f.display.mDisplay.unique,72,()->f.active);Handler.tick();
   check(f.state().getBoolean("wallpaper_client_visible")&&!f.state().getBoolean("home_surface_ready")&&!f.state().getBoolean("wallpaper_frame_verified"),"interface visibility impersonated drawn buffers");
   SystemClock.now=1100;f.atm.mRootWindowContainer.task.activity.window.drawn=true;AtomicWorkbenchWallpaperHook.noteDrawn(f.atm.mRootWindowContainer.task.activity.window);Handler.tick();check(f.state().getBoolean("home_surface_ready")&&!f.state().getBoolean("wallpaper_frame_verified"),"HOME icons alone certified wallpaper frame");
   SystemClock.now=1200;f.display.mWallpaperController.mWallpaperTokens.get(0).window.drawn=true;AtomicWorkbenchWallpaperHook.noteDrawn(f.display.mWallpaperController.mWallpaperTokens.get(0).window);f.drain();check(f.state().getBoolean("home_surface_ready")&&f.state().getBoolean("wallpaper_frame_verified"),"drawn WM windows not observed");
   check(FeatureSettings.value.contains("|72|1200|true|true|true||1000|1100|1200|"),"actual draw times replaced by later poll time");});
  test("drawn window on another display cannot certify this HOME",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.display.mWallpaperController.mWallpaperTokens.get(0).window.drawn=true;
   f.atm.mRootWindowContainer.task.activity.window.drawn=true;f.atm.mRootWindowContainer.task.activity.window.content=new DisplayContent();
   f.session=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,88,0,f.display.mDisplay.name,f.display.mDisplay.unique,72,()->f.active);f.drain();
   check(!f.state().getBoolean("home_surface_ready")&&f.status().equals("timeout"),"foreign-display drawn window acknowledged this transfer");});
  test("revisiting retained display reuses healthy connector without initialization or detach",()->{Fixture f=new Fixture();f.acquire();f.drain();int adds=f.wp.adds;AtomicWorkbenchWallpaperHook.Session old=f.session;
   f.session=AtomicWorkbenchWallpaperHook.acquire(f.module,f.atm,88,0,f.display.mDisplay.name,f.display.mDisplay.unique,()->true);f.drain();AtomicWorkbenchWallpaperHook.release(old);f.drain();
   check(f.wp.adds==adds&&f.wp.removes==0&&f.status().equals("interface_ready"),"retained wallpaper lifecycle rebuilt on re-entry");});
  test("live HOME readiness is freshly observed after the original packet expires",()->{Fixture f=new Fixture();f.acquireHome();SystemClock.now=1200;f.drawHome();
   String[] first=FeatureSettings.value.split("\\|",-1);int adds=f.wp.adds,logs=f.module.logs.size();
   check(f.session.readinessMonitoring&&Handler.queued.size()==1&&Handler.lastDelay==2000,"ready HOME has no low-frequency lease monitor");
   SystemClock.now=19000;Handler.tick();String[] fresh=FeatureSettings.value.split("\\|",-1);
   check(fresh[5].equals("19000")&&fresh[6].equals("true")&&fresh[8].equals("true"),"old observation was reused instead of reading WM again");
   check(first[10].equals(fresh[10])&&first[13].equals(fresh[13]),"heartbeat invented a different HOME generation");
   check(first[11].equals(fresh[11])&&first[12].equals(fresh[12]),"heartbeat replaced actual draw times with poll time");
   check(f.wp.adds==adds&&f.module.logs.size()==logs,"steady-state monitoring reattached connector or spammed logs");
   f.release();check(Handler.queued.isEmpty(),"release left readiness polling alive");});
  test("live monitoring withdraws readiness and recovers from real drawn-state changes",()->{Fixture f=new Fixture();f.acquireHome();SystemClock.now=1200;f.drawHome();
   SystemClock.now=3200;f.atm.mRootWindowContainer.task.activity.window.drawn=false;Handler.tick();
   check(FeatureSettings.value.contains("|3200|false|true|true|"),"old HOME drawn success survived current WM state");
   SystemClock.now=5200;f.drawHome();check(FeatureSettings.value.contains("|5200|true|true|true|"),"HOME redraw could not recover existing lease");});
  test("a delayed first draw can recover after initial timeout without a new HOME migration",()->{Fixture f=new Fixture();f.acquireHome();f.drain();
   check(f.status().equals("timeout")&&f.session.readinessMonitoring,"initial timeout discarded future recovery observation");
   SystemClock.now=21000;f.drawHome();check(f.status().equals("interface_ready")&&FeatureSettings.value.contains("|21000|true|true|true|"),"late draw stayed permanently timed out");
   check(f.wp.adds==1,"late draw recreated wallpaper connector");});
  test("expired HOME lease cancels monitoring and cleans up without publishing new evidence",()->{Fixture f=new Fixture();f.acquireHome();f.drawHome();String before=FeatureSettings.value;
   f.active=false;SystemClock.now=19000;Handler.tick();check(f.status().equals("released")&&Handler.queued.isEmpty(),"expired lease retained monitor/connector");
   check(FeatureSettings.value.equals(before),"expired lease published a fresh readiness claim");});
  test("monitor read failures withdraw prior success with a reason and recover",()->{Fixture f=new Fixture();f.acquireHome();f.drawHome();f.wp.mCurrentUserId=10;SystemClock.now=3000;Handler.tick();
   check(f.status().equals("unavailable")&&FeatureSettings.value.contains("|3000|false|false|false|SecurityException|"),"WM read failure retained formerly true packet");
   int logs=f.module.logs.size();SystemClock.now=5000;Handler.tick();check(f.module.logs.size()==logs,"unchanged monitor error spammed detail log");
   f.wp.mCurrentUserId=0;SystemClock.now=7000;Handler.tick();check(f.status().equals("interface_ready")&&FeatureSettings.value.contains("|7000|true|true|true|"),"transient monitor failure could not recover");});
  test("display ID reuse stops monitor before touching the foreign display",()->{Fixture f=new Fixture();f.acquireHome();f.drawHome();int adds=f.wp.adds,removes=f.wp.removes;
   f.display.mDisplay.unique="replacement";Handler.tick();check(f.status().equals("display_lost")&&Handler.queued.isEmpty(),"reused display retained monitor");
   check(f.wp.adds==adds&&f.wp.removes==removes,"reused display was initialized or removed");});
  test("monitor observes a missing wallpaper token without rebuilding a connector",()->{Fixture f=new Fixture();f.acquireHome();f.drawHome();int adds=f.wp.adds,removes=f.wp.removes;
   WallpaperWindowToken token=f.display.mWallpaperController.mWallpaperTokens.get(0);f.display.mWallpaperController.mWallpaperTokens.clear();SystemClock.now=3000;Handler.tick();
   check(f.status().equals("waiting")&&!f.state().getBoolean("wallpaper_frame_verified"),"missing token retained successful wallpaper readiness");
   check(f.wp.adds==adds&&f.wp.removes==removes,"read-only readiness monitor rebuilt a wallpaper connector");
   f.display.mWallpaperController.mWallpaperTokens.add(token);SystemClock.now=5000;Handler.tick();
   check(f.status().equals("interface_ready")&&f.state().getBoolean("wallpaper_frame_verified"),"system token recovery was not observed");});
  test("draw events bypass the pending probe and merge a burst into one observation",()->{Fixture f=new Fixture();f.acquireHome();check(Handler.lastDelay==32,"initial probe retained 250ms delay");
   SystemClock.now=1001;f.atm.mRootWindowContainer.task.activity.window.drawn=true;f.display.mWallpaperController.mWallpaperTokens.get(0).window.drawn=true;
   for(int i=0;i<100;i++){AtomicWorkbenchWallpaperHook.noteDrawn(f.atm.mRootWindowContainer.task.activity.window);AtomicWorkbenchWallpaperHook.noteDrawn(f.display.mWallpaperController.mWallpaperTokens.get(0).window);}
   check(Handler.queued.size()==1,"draw burst grew the worker queue");Handler.tick();check(SystemClock.now==1001&&f.session.lastReadinessReady,"draw callback waited for a scheduled probe");
   check(Handler.queued.size()==1&&Handler.lastDelay==2000&&f.wp.adds==1,"draw wake rebuilt connector or retained fast polling");
   int observations=f.state().getInt("readiness_observations",0);for(int i=0;i<100;i++)AtomicWorkbenchWallpaperHook.noteDrawn(f.atm.mRootWindowContainer.task.activity.window);
   check(Handler.queued.size()==1&&Handler.lastDelay==2000&&f.state().getInt("readiness_observations",0)==observations,"ready draw callbacks turned heartbeat into continuous polling");});
  test("actual attachEngine callback wakes the lease but cannot certify undrawn windows",()->{Fixture f=new Fixture();f.wp.attach(f.wp.mLastWallpaper,88);f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine=null;f.acquireHome();
   check(f.module.hooks.size()==2,"exact ROM interface callbacks were not installed once");SystemClock.now=1002;
   f.module.invoke(f.wp.mLastWallpaper.connection,"attachEngine",new Class<?>[]{android.service.wallpaper.IWallpaperEngine.class,int.class},new WallpaperManagerService.Engine(),88);
   check(!f.state().getBoolean("home_surface_ready"),"callback performed WM observation inline");Handler.tick();
   check(SystemClock.now==1002&&f.status().equals("interface_ready")&&!f.state().getBoolean("home_surface_ready")&&!f.state().getBoolean("wallpaper_frame_verified"),"engine attachment impersonated draw evidence");
   check(f.wp.adds==0,"engine callback initialized a healthy existing connector");});
  test("actual engineShown wakes recovery after timeout without manufacturing a frame",()->{Fixture f=new Fixture();f.acquireHome();f.drain();check(f.session.readinessMonitoring,"fixture did not reach bounded initial timeout");
   SystemClock.now++;f.module.invoke(f.wp.mLastWallpaper.connection,"engineShown",new Class<?>[]{android.service.wallpaper.IWallpaperEngine.class},f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine);
   long at=SystemClock.now;Handler.tick();check(SystemClock.now==at&&!f.state().getBoolean("wallpaper_frame_verified")&&!f.session.lastReadinessReady,"engineShown callback fabricated a wallpaper frame");
   f.drawHome();check(f.session.lastReadinessReady&&f.wp.adds==1,"late actual draws did not recover retained lease");});
  test("fast probes are bounded and unchanged observations do not spend diagnostic quota",()->{Fixture f=new Fixture();f.acquireHome();int writes=FeatureSettings.writes;
   for(int i=0;i<20;i++)Handler.tick();check(SystemClock.now<2000&&FeatureSettings.writes==writes,"unchanged fast probes flooded Provider diagnostics");
   SystemClock.now=2100;Handler.tick();check(Handler.lastDelay==250,"short probe window did not end");f.drain();
   check(SystemClock.now>=7000&&f.status().equals("timeout")&&Handler.lastDelay==2000,"initial six-second deadline or steady heartbeat changed");
   check(FeatureSettings.writes<=5&&f.wp.adds==1,"timeout probes exhausted quota or repeated initialization");});
  test("cancelled and superseded leases cannot be resurrected by late callbacks",()->{Fixture f=new Fixture();f.acquireHome();AtomicWorkbenchWallpaperHook.Session old=f.session;f.drawHome();String packet=FeatureSettings.value;f.release();
   AtomicWorkbenchWallpaperHook.noteDrawn(f.atm.mRootWindowContainer.task.activity.window);check(Handler.queued.isEmpty()&&FeatureSettings.value.equals(packet),"late draw revived released lease");
   f.active=true;f.acquireHome();AtomicWorkbenchWallpaperHook.release(old);f.drawHome();check(!f.session.cancelled&&f.session.lastReadinessReady,"old release cancelled replacement");});
  test("an initial transient service failure keeps bounded recovery without an init storm",()->{Fixture f=new Fixture();f.wp.mCurrentUserId=10;f.acquireHome();check(f.status().equals("unavailable")&&Handler.lastDelay==32,"initial service failure permanently discarded lease");
   f.wp.mCurrentUserId=0;Handler.tick();f.drawHome();check(f.session.lastReadinessReady&&f.wp.adds==1,"service recovery failed or duplicated initialization");});
  test("interface callback after display identity reuse never touches the foreign display",()->{Fixture f=new Fixture();f.acquireHome();int adds=f.wp.adds;String packet=FeatureSettings.value;f.display.mDisplay.unique="new-owner";
   f.module.invoke(f.wp.mLastWallpaper.connection,"engineShown",new Class<?>[]{android.service.wallpaper.IWallpaperEngine.class},f.wp.mLastWallpaper.connection.mDisplayConnector.get(88).mEngine);Handler.tick();
   check(f.status().equals("display_lost")&&Handler.queued.isEmpty()&&f.wp.adds==adds&&FeatureSettings.value.equals(packet),"late interface event certified or modified a reused display");});
  System.out.println("WALLPAPER RESULT "+tests+" passed; "+checks+" assertions");
 }
}'''


def main():
    sources = dict(SOURCES)
    sources["ls/augment/com/hook/TestAtomicWallpaper.java"] = TEST
    with tempfile.TemporaryDirectory(prefix="lsa-wallpaper-") as temporary:
        SUPPORT["compile_run"](Path(temporary), sources,
            ["hook/AtomicWorkbenchWallpaperHook.java"], "ls.augment.com.hook.TestAtomicWallpaper")


if __name__ == "__main__":
    main()
