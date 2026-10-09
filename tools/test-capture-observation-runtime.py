"""Execute the real capture hook with deterministic provider/Binder/surface facades; no phone."""
from pathlib import Path
import os
import subprocess
import tempfile
import sys
import re
import json

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / 'android/app/src/main/java/ls/augment/com'
PROVIDER_KEY_PATTERN = re.search(r'!key\.matches\("([^"]+)"\)', (MAIN/'ProviderDiagnostics.java').read_text(encoding='utf-8')).group(1)
FILES = {
'android/net/Uri.java': 'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
'android/content/Intent.java': 'package android.content;public class Intent {}',
'android/content/IntentFilter.java': 'package android.content;public class IntentFilter {public IntentFilter(String s){}}',
'android/content/BroadcastReceiver.java': 'package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}',
'android/content/pm/PackageManager.java': 'package android.content.pm;public class PackageManager {public String[] getPackagesForUid(int uid){return new String[]{"com.android.ztescreenshot"};}}',
'android/content/Context.java': '''package android.content;public class Context {
 public static final int RECEIVER_EXPORTED=2;public ls.augment.com.ConfigSnapshot snapshot=new ls.augment.com.ConfigSnapshot(1,1,"0");
 public ContentResolver getContentResolver(){return new ContentResolver();}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,int flags){return null;}}''',
'android/content/ContentResolver.java': '''package android.content;import android.os.*;public class ContentResolver {
 public static volatile IBinder endpoint;public static volatile long delay;public static volatile boolean fail;public static int gets;
 public Bundle call(android.net.Uri u,String method,String arg,Bundle extras){
 if(method.equals("capture_surface_register")){endpoint=extras.getBinder("controller");return new Bundle();}
 gets++;if(delay>0)SystemClock.sleep(delay);if(fail)throw new IllegalStateException("private message must never be exported");
 Bundle b=new Bundle();if(endpoint!=null)b.putBinder("controller",endpoint);return b;}}''',
'android/os/Bundle.java': 'package android.os;public class Bundle {java.util.Map<String,IBinder> values=new java.util.HashMap<>();public void putBinder(String k,IBinder b){values.put(k,b);}public IBinder getBinder(String k){return values.get(k);}}',
'android/os/RemoteException.java': 'package android.os;public class RemoteException extends Exception {}',
'android/os/IBinder.java': '''package android.os;public interface IBinder {int FIRST_CALL_TRANSACTION=1;interface DeathRecipient{void binderDied();}
 boolean isBinderAlive();boolean transact(int c,Parcel d,Parcel r,int f)throws RemoteException;void linkToDeath(DeathRecipient d,int f)throws RemoteException;boolean unlinkToDeath(DeathRecipient d,int f);}''',
'android/os/Binder.java': '''package android.os;public class Binder implements IBinder {
 public final java.util.List<DeathRecipient> deaths=new java.util.concurrent.CopyOnWriteArrayList<>();public volatile boolean alive=true;
 public static int getCallingUid(){return 10120;}public static int getCallingPid(){return 222;}
 public boolean isBinderAlive(){return alive;}public void linkToDeath(DeathRecipient d,int f)throws RemoteException{if(!alive)throw new RemoteException();deaths.add(d);}public boolean unlinkToDeath(DeathRecipient d,int f){return deaths.remove(d);}
 public void die(){alive=false;for(DeathRecipient d:deaths)d.binderDied();}
 public boolean transact(int c,Parcel d,Parcel r,int f)throws RemoteException{return onTransact(c,d,r,f);}
 protected boolean onTransact(int c,Parcel d,Parcel r,int f)throws RemoteException{return false;}}''',
'android/os/Parcel.java': '''package android.os;public class Parcel {java.util.Queue<Object> values=new java.util.LinkedList<>();
 public static Parcel obtain(){return new Parcel();}public void recycle(){}public void writeInterfaceToken(String s){values.add(s);}public void enforceInterface(String s){if(!s.equals(values.remove()))throw new SecurityException();}
 public void writeStrongBinder(IBinder b){values.add(b);}public IBinder readStrongBinder(){return (IBinder)values.remove();}public void writeInt(int v){values.add(v);}public int readInt(){return (Integer)values.remove();}
 public void writeNoException(){}public void readException(){}}''',
'android/os/Process.java': 'package android.os;public class Process {public static int myPid(){return 321;}public static int myUid(){return 1000;}}',
'android/os/Looper.java': '''package android.os;public class Looper {public static final Thread UI=Thread.currentThread();private static final Looper MAIN=new Looper();public static int offMainReads;
 public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return Thread.currentThread()==UI?MAIN:null;}
 public static void check(){if(myLooper()!=MAIN){offMainReads++;throw new AssertionError("worker touched View");}}}''',
'android/os/Handler.java': '''package android.os;public class Handler {public static final java.util.Queue<Runnable> queue=new java.util.concurrent.ConcurrentLinkedQueue<>();public static boolean paused;
 public Handler(Looper l){}public boolean post(Runnable r){queue.add(r);return true;}
 public boolean postDelayed(Runnable r,long d){queue.add(r);return true;}public void removeCallbacks(Runnable r){queue.remove(r);}
 public static void drain(){Looper.check();if(paused)return;for(Runnable r;(r=queue.poll())!=null;)r.run();}}''',
'android/os/SystemClock.java': '''package android.os;public class SystemClock {public static long elapsedRealtime(){return System.nanoTime()/1000000;}public static long uptimeMillis(){return elapsedRealtime();}
 public static void sleep(long t){try{Thread.sleep(t);}catch(InterruptedException e){Thread.currentThread().interrupt();}}}''',
'android/view/SurfaceControl.java': '''package android.view;public class SurfaceControl {static long ids=10;public long mNativeObject=++ids,mNativeHandle=mNativeObject+100000;public volatile boolean valid=true,skip;public int calls;public final SurfaceControl original;public boolean released;
 public static int copies,releases,originalReleases,transactionCloses,failApply,failCopies,copiedValidChecks;public static volatile java.util.concurrent.CountDownLatch entered,proceed;public static volatile long delay;public static boolean blockAfter,handleFieldMissing;
 public SurfaceControl(){original=this;}public SurfaceControl(SurfaceControl source,String site){android.os.Looper.check();if(failCopies>0){failCopies--;throw new IllegalStateException("copy temporarily unavailable");}original=source.original;mNativeHandle=source.mNativeHandle;copies++;}
 public boolean isValid(){if(original!=this)copiedValidChecks++;return valid&&!released;}public void release(){if(original==this){originalReleases++;throw new AssertionError("released original SurfaceControl");}if(released)throw new AssertionError("double release");released=true;mNativeObject=0;releases++;}
 public static class Transaction {final Thread thread=Thread.currentThread();SurfaceControl target;boolean skip;void own(){if(thread!=Thread.currentThread())throw new AssertionError("shared Transaction across threads");}
 public Transaction(){}public Transaction setSkipScreenshot(SurfaceControl s,boolean b){own();if(!s.isValid())throw new IllegalStateException("invalid copied reference");target=s;skip=b;return this;}
 void barrier(){java.util.concurrent.CountDownLatch e=entered,p=proceed;if(e!=null){entered=null;e.countDown();try{p.await(2,java.util.concurrent.TimeUnit.SECONDS);}catch(InterruptedException x){Thread.currentThread().interrupt();}}}
 public void apply(boolean sync){own();if(!blockAfter)barrier();
  if(delay>0)android.os.SystemClock.sleep(delay);if(failApply>0){failApply--;throw new IllegalStateException("native apply failed");}target.skip=skip;target.original.skip=skip;target.original.calls++;if(blockAfter)barrier();}
 public void close(){own();transactionCloses++;}}}''',
'android/view/ViewTreeObserver.java': '''package android.view;public class ViewTreeObserver {public interface OnPreDrawListener{boolean onPreDraw();}public final java.util.List<OnPreDrawListener> listeners=new java.util.ArrayList<>();
 public boolean isAlive(){return true;}public void addOnPreDrawListener(OnPreDrawListener l){android.os.Looper.check();listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){android.os.Looper.check();listeners.remove(l);}
 public void draw(){android.os.Looper.check();for(OnPreDrawListener l:new java.util.ArrayList<>(listeners))l.onPreDraw();}}''',
'android/view/ViewRootImpl.java': '''package android.view;public class ViewRootImpl {public interface SurfaceChangedCallback {void surfaceCreated(SurfaceControl.Transaction t);void surfaceReplaced(SurfaceControl.Transaction t);void surfaceDestroyed();default void vriDrawStarted(boolean b){}}
 public boolean callbacksUnavailable;public final java.util.List<SurfaceChangedCallback> callbacks=new java.util.ArrayList<>();public void addSurfaceChangedCallback(SurfaceChangedCallback c){android.os.Looper.check();if(callbacksUnavailable)throw new IllegalStateException();callbacks.add(c);}public void removeSurfaceChangedCallback(SurfaceChangedCallback c){android.os.Looper.check();callbacks.remove(c);}
 public void replaced(){android.os.Looper.check();for(var c:new java.util.ArrayList<>(callbacks))c.surfaceReplaced(null);}public void destroyed(){android.os.Looper.check();for(var c:new java.util.ArrayList<>(callbacks))c.surfaceDestroyed();}}''',
'android/view/View.java': '''package android.view;public class View {public android.content.Context context;public boolean attached=true;public Root root=new Root();public final ViewTreeObserver observer=new ViewTreeObserver();public Runnable detachProbe;
 public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public java.util.List<OnAttachStateChangeListener> attaches=new java.util.ArrayList<>();
 public View(android.content.Context c){context=c;}public android.content.Context getContext(){android.os.Looper.check();return context;}public boolean isAttachedToWindow(){android.os.Looper.check();return attached;}
 public Root getViewRootImpl(){android.os.Looper.check();return root;}public ViewTreeObserver getViewTreeObserver(){android.os.Looper.check();return observer;}public boolean post(Runnable r){return new android.os.Handler(android.os.Looper.getMainLooper()).post(r);}
 public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){android.os.Looper.check();attaches.add(l);}
 // AOSP android16-release View.dispatchDetachedFromWindow notifies listeners before clearing mAttachInfo.
 public void detach(){android.os.Looper.check();for(var l:attaches)l.onViewDetachedFromWindow(this);if(detachProbe!=null)detachProbe.run();attached=false;}
 public void reattach(){android.os.Looper.check();attached=true;for(var l:attaches)l.onViewAttachedToWindow(this);}
 public static class Root extends ViewRootImpl {public SurfaceControl surface=new SurfaceControl();public SurfaceControl getSurfaceControl(){android.os.Looper.check();return surface;}}}''',
'ls/augment/com/hook/FixtureLocks.java': '''package ls.augment.com.hook;public class FixtureLocks {public static int violations;public static void outside(){try{var f=CaptureVisibilityHook.class.getDeclaredField("SURFACE_LOCK");f.setAccessible(true);if(Thread.holdsLock(f.get(null))){violations++;throw new AssertionError("View/config/Provider inside surface lock");}}catch(ReflectiveOperationException e){throw new AssertionError(e);}}}''',
'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20454;}',
'ls/augment/com/ConfigSnapshot.java': '''package ls.augment.com;public class ConfigSnapshot {public final long revision,updatedAt;public final String value,record;
 public ConfigSnapshot(long r,long t,String v){this(r,t,v,v);}public ConfigSnapshot(long r,long t,String v,String recording){revision=r;updatedAt=t;value=v;record=recording;}public String get(String k){return k.contains("record_hide")?record:value;}}''',
'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;public class ConfigSchema {public static boolean truthy(String v){return "1".equals(v)||"true".equalsIgnoreCase(v)||"yes".equalsIgnoreCase(v)||"on".equalsIgnoreCase(v);}}''',
'ls/augment/com/SystemOptions.java': 'package ls.augment.com;public class SystemOptions {public static String key(String s){return s;}}',
'ls/augment/com/hook/AugmentModule.java': 'package ls.augment.com.hook;public class AugmentModule {}',
'ls/augment/com/hook/OemHooks.java': '''package ls.augment.com.hook;public class OemHooks {
 public static int invocations;
 public interface Chain{Object proceed()throws Throwable;Object getThisObject();}public interface Hook{Object run(Chain c)throws Throwable;}
 public static void methods(AugmentModule m,ClassLoader l,String c,String n,Class<?> r,int count,String k,Hook h){}
 public static Object field(Object o,String n){try{if(n.equals("mNativeHandle")&&android.view.SurfaceControl.handleFieldMissing)return null;return o.getClass().getField(n).get(o);}catch(ReflectiveOperationException e){return null;}}
 public static Object invoke(Object o,String n,Object...args)throws Exception {invocations++;for(var m:o.getClass().getMethods())if(m.getName().equals(n)&&m.getParameterCount()==args.length)return m.invoke(o,args);throw new NoSuchMethodException(n);}}''',
'ls/augment/com/hook/SystemUiAdapter.java': '''package ls.augment.com.hook;public class SystemUiAdapter {
 public static int metadataLookups;private static final ClassValue<java.util.concurrent.ConcurrentHashMap<String,java.lang.reflect.Method>> methods=new ClassValue<>(){protected java.util.concurrent.ConcurrentHashMap<String,java.lang.reflect.Method> computeValue(Class<?> c){return new java.util.concurrent.ConcurrentHashMap<>();}};
 public static Object callIfPresent(Object o,String name)throws ReflectiveOperationException{if(o==null)return null;var cache=methods.get(o.getClass());var method=cache.get(name);if(method==null){metadataLookups++;try{method=o.getClass().getMethod(name);method.setAccessible(true);cache.put(name,method);}catch(NoSuchMethodException missing){return null;}}return method.invoke(o);}
 public static Object field(Object o,String name){return o==null?null:OemHooks.field(o,name);}}''',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import android.content.*;import ls.augment.com.*;public class FeatureSettings {
 public static java.util.Map<String,String> diagnostics=new java.util.concurrent.ConcurrentHashMap<>();public static boolean failDiagnostic;
 public static Context from(Object o){return o instanceof Context?(Context)o:null;}public static ConfigSnapshot snapshot(Context c){FixtureLocks.outside();return c.snapshot;}
 public static final java.util.Map<Context,Runnable> listeners=new java.util.IdentityHashMap<>();public static boolean enabled(Context c,String key){return ConfigSchema.truthy(snapshot(c).get(key));}public static void addSnapshotListener(Context c,Runnable r){listeners.put(c,r);}
 public static void changed(Context c){listeners.get(c).run();}
 public static void diagnostic(Context c,String k,String v){if(failDiagnostic)throw new IllegalStateException();diagnostics.put(k,v);}}''',
}

TEST = r'''
package ls.augment.com.hook;
import android.content.*;import android.os.*;import android.view.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import ls.augment.com.*;
public class TestCaptureObservation {
 static int checks;
 static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static Object call(String name,Class<?>[] types,Object...args)throws Exception{Method m=CaptureVisibilityHook.class.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 static Object field(String name)throws Exception{Field f=CaptureVisibilityHook.class.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
 static void set(String name,Object value)throws Exception{Field f=CaptureVisibilityHook.class.getDeclaredField(name);f.setAccessible(true);f.set(null,value);}
 static void drain()throws Exception{android.os.Handler.drain();((ExecutorService)field("IPC")).submit(()->{}).get(4,TimeUnit.SECONDS);((ExecutorService)field("CONTROL")).submit(()->{}).get(4,TimeUnit.SECONDS);
  long end=SystemClock.elapsedRealtime()+1500;while(((java.util.concurrent.atomic.AtomicBoolean)field("REPAIR_PENDING")).get()&&SystemClock.elapsedRealtime()<end)SystemClock.sleep(5);}
 static void reset()throws Exception{drain();for(Object entry:new ArrayList<>((List<?>)field("VIEWS"))){Field f=entry.getClass().getDeclaredField("view");f.setAccessible(true);View v=(View)((java.lang.ref.WeakReference<?>)f.get(entry)).get();if(v!=null)v.detach();}
  for(String name:new String[]{"LEASES","ACTIVE","DEATHS"})((Map<?,?>)field(name)).clear();((List<?>)field("VIEWS")).clear();
  set("cachedEndpoint",null);set("controller",null);set("context",null);FeatureSettings.diagnostics.clear();FeatureSettings.failDiagnostic=false;
  ContentResolver.endpoint=null;ContentResolver.delay=0;ContentResolver.fail=false;ContentResolver.gets=0;android.os.Handler.paused=false;SurfaceControl.delay=0;SurfaceControl.failApply=0;SurfaceControl.failCopies=0;SurfaceControl.blockAfter=false;SurfaceControl.handleFieldMissing=false;}
 static Context context(long rev,String value){Context c=new Context();c.snapshot=new ConfigSnapshot(rev,rev,value);return c;}
 static void start(Context c,int kind)throws Exception{call("start",new Class<?>[]{Object.class,int.class},c,kind);}
 static void stop(Context c)throws Exception{call("stop",new Class<?>[]{Object.class},c);}
  static Map<String,String> diag(String role,int kind){String raw=FeatureSettings.diagnostics.get("ls_augment_rm_capture_"+role+"_"+(kind<0?"all":Integer.toString(kind)));check(raw!=null,"diagnostic exists "+role+kind);
  check(raw.length()<=512,"bounded diagnostic "+raw.length());Map<String,String> out=new HashMap<>();for(String part:raw.split("\\|")){int at=part.indexOf('=');if(at>0)out.put(part.substring(0,at),part.substring(at+1));}return out;}
 static class Endpoint extends Binder {int starts,stops;boolean reject,answer=true,active;long delay;
  public boolean transact(int code,Parcel d,Parcel r,int flags){d.enforceInterface("ls.augment.capture.surface.v1");d.readStrongBinder();d.readInt();boolean on=d.readInt()==1;
   if(on){starts++;if(delay>0)SystemClock.sleep(delay);}else stops++;if(reject)return false;active=on&&answer;r.writeNoException();r.writeInt(answer||!on?1:0);return true;}}
 static void truth()throws Exception{
  for(String value:new String[]{"1","true","TRUE","yes","YES","on","ON","0","false","",null,"1x"}){reset();Context c=context(71,value);Endpoint e=new Endpoint();ContentResolver.endpoint=e;start(c,0);drain();
   boolean expected=ConfigSchema.truthy(value);Map<String,String> d=diag("client_start",0);check(expected==(e.starts==1),"original truth predicate "+value);check(d.get("r").equals("71"),"exact gate snapshot");check(d.get("g").equals(expected?"1":"0"),"gate recorded");check(d.get("seen").equals("1"),"gate read observed");if(expected)stop(c);}
  reset();start(context(1,"0"),0);Map<String,String>d=diag("client_start",0);check(d.get("default").equals("1")&&d.get("s").equals("gate_off"),"startup placeholder identified");check(ContentResolver.gets==0,"disabled gate never queries provider");
  start(context(72,"0"),1);check(diag("client_start",0).get("r").equals("1")&&diag("client_start",1).get("r").equals("72"),"screenshot/record retained independently");
 }
 static void failures()throws Exception{
  reset();start(context(81,"1"),0);drain();Map<String,String>d=diag("client_start",0);check(d.get("s").equals("endpoint_missing")&&Integer.parseInt(d.get("n"))>1,"endpoint retries observed");check(d.get("w").equals("returned_false"),"lookup rejection distinguished from outer timeout");
  reset();ContentResolver.fail=true;start(context(82,"1"),0);drain();d=diag("client_start",0);check(d.get("s").equals("request_exception")&&d.get("cleanup").equals("no_endpoint"),"provider error observed without private exception text");
  reset();Endpoint e=new Endpoint();e.reject=true;ContentResolver.endpoint=e;start(context(83,"1"),0);drain();d=diag("client_start",0);check(d.get("tx").equals("binder_rejected")&&e.starts==1&&e.stops==1,"Binder rejection with exact endpoint cleanup");
  reset();e=new Endpoint();e.answer=false;ContentResolver.endpoint=e;start(context(84,"1"),0);drain();d=diag("client_start",0);check(d.get("tx").equals("reply_false")&&d.get("cleanup").equals("released"),"remote false differs from Binder rejection");
  reset();e=new Endpoint();ContentResolver.endpoint=e;ContentResolver.delay=850;long t=SystemClock.elapsedRealtime();start(context(85,"1"),0);long duration=SystemClock.elapsedRealtime()-t;check(duration>=600&&duration<825,"650ms caller budget retained "+duration);drain();d=diag("client_start",0);
  check(d.get("w").equals("timeout")&&d.get("cancel").equals("1"),"outer timeout survives late worker report");check(e.starts==0&&e.stops==1&&d.get("cleanup").equals("released"),"late provider cannot activate and exact endpoint cleanup runs");
  reset();e=new Endpoint();e.delay=850;ContentResolver.endpoint=e;start(context(86,"1"),1);drain();d=diag("client_start",1);
  check(d.get("w").equals("timeout")&&d.get("tx").equals("reply_true")&&d.get("cleanup").equals("released"),"late tx completion retains timeout and cleanup result");check(!e.active&&e.starts==1&&e.stops==1&&((Map<?,?>)field("LEASES")).isEmpty(),"late success does not retain a lease");
 }
 static void server()throws Exception{
  reset();Context system=context(91,"0");FeatureSettings.diagnostic(system,"ls_augment_rm_capture_endpoint_-1","invalid-key");
  check(!FeatureSettings.diagnostics.containsKey("ls_augment_rm_capture_endpoint_-1"),"actual Provider key policy rejects negative suffix");
  View view=new View(system);call("attach",new Class<?>[]{View.class},view);drain();check(diag("endpoint",-1).get("s").equals("register_returned_no_ack"),"registration return never claims unprovided ack");
  Context client=context(92,"1");start(client,0);drain();Map<String,String>d=diag("server_start",0);check(d.get("r").equals("91")&&d.get("g").equals("0")&&d.get("ap").equals("1")&&d.get("ex").equals("0"),"stale SystemUI off with apply true remains observable and unchanged");
  check(d.get("a").equals("1")&&d.get("v").equals("1")&&d.get("c").equals("0")&&d.get("cp").equals("222"),"cached surface and caller counted");String startSequence=d.get("q");stop(client);drain();check(diag("server_start",0).get("q").equals(startSequence),"stop cannot erase active request witness");check(diag("server_stop",0).get("s").equals("server_stop"),"stop has its independent diagnostic");
  system.snapshot=new ConfigSnapshot(93,93,"1");start(client,0);drain();d=diag("server_start",0);check(d.get("g").equals("1")&&d.get("ex").equals("1")&&d.get("ap").equals("1")&&view.root.surface.skip,"enabled request uses native skip transaction");
  stop(client);drain();check(!view.root.surface.skip&&((Map<?,?>)field("ACTIVE")).isEmpty(),"native restoration and lease teardown unchanged");
  view.root.surface.valid=false;view.observer.draw();start(client,1);drain();d=diag("server_start",1);check(d.get("v").equals("0")&&d.get("ap").equals("0")&&d.get("g").equals("1"),"invalid surface distinct from disabled gate");check(((Map<?,?>)field("ACTIVE")).isEmpty(),"failed apply cleans exact lease");
  reset();FeatureSettings.failDiagnostic=true;Endpoint e=new Endpoint();ContentResolver.endpoint=e;start(context(94,"1"),0);drain();check(e.active,"diagnostic failure never blocks capture");
 }
 static void bounded(){CaptureRuntimeObservation o=new CaptureRuntimeObservation(Integer.MIN_VALUE,Integer.MIN_VALUE,Integer.MIN_VALUE,Long.MIN_VALUE,Long.MIN_VALUE);
  o.revision=o.endpointMs=o.transactionMs=Long.MIN_VALUE;o.lookups=o.callerPid=o.attached=o.valid=o.changed=o.leases=Integer.MIN_VALUE;
  o.phase=o.wait=o.transaction=o.cleanup="a".repeat(28);String v=o.serialize(Long.MIN_VALUE);check(v.length()<=512,"maximum width record fits provider: "+v.length());
  o.phase="/private/user/file.png";check(!o.serialize(1).contains("/private")&&o.serialize(1).contains("s=invalid"),"no freeform private data accepted");}
 static Object member(Object object,String name)throws Exception{Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(object);}
 static boolean raw(IBinder endpoint,IBinder owner,int kind,boolean active)throws Exception{Parcel d=Parcel.obtain(),r=Parcel.obtain();try{d.writeInterfaceToken("ls.augment.capture.surface.v1");d.writeStrongBinder(owner);d.writeInt(kind);d.writeInt(active?1:0);check(endpoint.transact(1,d,r,0),"Binder transaction accepted");r.readException();return r.readInt()==1;}finally{d.recycle();r.recycle();}}
 static boolean raw(IBinder owner,int kind,boolean active)throws Exception{return raw(ContentResolver.endpoint,owner,kind,active);}
 static final ExecutorService CLIENTS=Executors.newCachedThreadPool(task->{Thread t=new Thread(task,"fixture-client");t.setDaemon(true);return t;});
 static View attached(Context context)throws Exception{View view=new View(context);call("attach",new Class<?>[]{View.class},view);drain();return view;}
 static CountDownLatch holdControl()throws Exception{CountDownLatch held=new CountDownLatch(1),resume=new CountDownLatch(1);((ExecutorService)field("CONTROL")).execute(()->{held.countDown();try{resume.await(2,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});check(held.await(1,TimeUnit.SECONDS),"controller test barrier entered");return resume;}
 static void independentQueue()throws Exception{
  reset();Context system=context(110,"1");View view=attached(system);int copies=SurfaceControl.copies;android.os.Handler.paused=true;
  final boolean[] ran={false};new Handler(Looper.getMainLooper()).post(()->ran[0]=true);Binder shot=new Binder(),record=new Binder();
  check(raw(shot,0,true)&&view.root.surface.skip,"start works with paused main queue and prepublished copied surface");
  check(raw(record,1,true),"second independent recording lease accepted");check(raw(shot,0,false)&&view.root.surface.skip,"stopping screenshot retains live recording exclusion");
  record.die();drain();check(!view.root.surface.skip&&((Map<?,?>)field("ACTIVE")).isEmpty(),"Binder death restores while main queue remains paused");
  check(!ran[0],"worker never drains or requires main queue");check(SurfaceControl.copies==copies,"requests do not touch View or make main-owned copies");
  Binder again=new Binder();check(raw(again,1,true),"record starts again");system.snapshot=new ConfigSnapshot(111,111,"0");FeatureSettings.changed(system);drain();check(!view.root.surface.skip,"configuration listener updates existing recording lease decision");
  system.snapshot=new ConfigSnapshot(112,112,"1");FeatureSettings.changed(system);drain();check(view.root.surface.skip,"enabled existing recording reapplies from immutable decision");check(raw(again,1,false)&&!view.root.surface.skip,"stop also restores with paused UI");
  android.os.Handler.paused=false;drain();check(ran[0],"ordinary main task runs only after explicitly resumed");check(Looper.offMainReads==0,"no worker access to View/root");
 }
 static void lifecycle()throws Exception{
  reset();Context system=context(120,"1");View view=attached(system);Binder lease=new Binder();check(raw(lease,1,true),"record active before replacement");
  SurfaceControl old=view.root.surface;int releases=SurfaceControl.releases,copies=SurfaceControl.copies;
  view.observer.draw();check(SurfaceControl.copies==copies,"unchanged pre-draw never recopy references");
  Object first=((java.util.List<?>)member(field("surfaces"),"controls")).get(0);SurfaceControl copy=(SurfaceControl)member(first,"control");
  check(copy!=old&&copy.mNativeObject!=old.mNativeObject&&(Long)member(first,"identity")==old.mNativeObject,"snapshot keys original native identity but owns a distinct copied reference");
  old.valid=false;old.mNativeObject=0;check(raw(new Binder(),0,true),"self-owned copy survives original native-reference release until lifecycle publication");
  view.root.surface=new SurfaceControl();view.root.replaced();check(view.root.surface.skip,"replacement is excluded before lifecycle callback returns");
  check(!old.skip&&SurfaceControl.releases==releases+1,"old owned reference restored and released on identity replacement");
  check(SurfaceControl.originalReleases==0,"root-owned original was never released");
  SurfaceControl second=view.root.surface;view.root.destroyed();check(!second.skip,"destroy callback restores retired copied reference");
  check(!raw(new Binder(),0,true),"destroyed epoch cannot acknowledge cached old success");
  view.observer.draw();check(!second.skip,"pre-draw cannot resurrect destroyed same identity");
  int copyCount=SurfaceControl.copies;view.root.surface.mNativeHandle+=20000;view.observer.draw();check(SurfaceControl.copies==copyCount+1&&view.root.surface.skip,"reused source address with a new native layer clears destroy tombstone");
  view.root.surface=new SurfaceControl();view.root.replaced();check(view.root.surface.skip,"new identity after destroy restores active recording exclusion");
  final View departing=view;final int copiesBeforeDetach=SurfaceControl.copies;
  view.detachProbe=()->{check(departing.isAttachedToWindow(),"authentic detach listener precedes mAttachInfo clear");check(departing.root.callbacks.isEmpty(),"detach cannot rebind root while Android still reports attached");check(!departing.root.surface.skip&&SurfaceControl.copies==copiesBeforeDetach,"detach restores own reference without recopy during attached listener window");};
  view.detach();view.detachProbe=null;check(!view.root.surface.skip,"detach restores last surface immediately");check(!raw(new Binder(),0,true),"attached-empty snapshot cannot pass start");
  check(((List<?>)field("RETIRED")).isEmpty(),"all retired copies released");
  view.reattach();check(view.root.surface.skip&&view.root.callbacks.size()==1&&SurfaceControl.copies==copiesBeforeDetach+1,"actual reattach clears detached marker and restores current recording decision");
  reset();system=context(121,"1");view=attached(system);lease=new Binder();check(raw(lease,0,true),"same Java root reference baseline");copies=SurfaceControl.copies;releases=SurfaceControl.releases;
  view.root.surface.mNativeObject+=10000;view.root.replaced();check(SurfaceControl.copies==copies+1&&SurfaceControl.releases==releases+1,"same original Java object with changed native identity replaces own reference");check(raw(lease,0,false),"same-object replacement restores");
  copies=SurfaceControl.copies;view.root.surface.mNativeHandle+=10000;view.observer.draw();check(SurfaceControl.copies==copies+1,"same source pointer with changed underlying layer handle cannot reuse old reference");
 }
 static void nativeErrors()throws Exception{
  reset();Context system=context(130,"1");View view=attached(system);Binder lease=new Binder();check(raw(lease,1,true),"record before cleanup failure");
  CountDownLatch repair=holdControl();SurfaceControl old=view.root.surface;view.root.surface=new SurfaceControl();SurfaceControl.failApply=1;view.root.replaced();
  check(old.skip&&view.root.surface.skip,"failed old restore does not fabricate cleared old state; new surface still gets intended exclusion");
  check(((List<?>)field("RETIRED")).size()==1,"failed restoration retains own reference for repair");
  repair.countDown();drain();check(!old.skip&&((List<?>)field("RETIRED")).isEmpty(),"worker retries failed old restore then releases without another UI frame");
  SurfaceControl.failApply=1;check(raw(lease,1,false)&&!view.root.surface.skip,"transient failed native stop retries within existing server budget");
  check(((Map<?,?>)field("ACTIVE")).isEmpty(),"native failure never keeps stopped lease");
  FeatureSettings.failDiagnostic=true;Binder safe=new Binder();check(raw(safe,0,true)&&view.root.surface.skip,"diagnostic failure cannot cancel successful surface operation");check(raw(safe,0,false)&&!view.root.surface.skip,"diagnostic failure cannot prevent restoration");FeatureSettings.failDiagnostic=false;
  check(raw(safe,0,true),"second error combination lease");repair=holdControl();old=view.root.surface;view.root.surface=new SurfaceControl();SurfaceControl.failApply=2;view.root.replaced();
  check(old.skip&&!view.root.surface.skip&&((List<?>)field("RETIRED")).size()==1,"both old cleanup and new apply failure cannot reuse previous successful epoch");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_capture_surface_snapshot").contains("ap=false"),"failed new epoch is visibly rejected");
  repair.countDown();drain();check(!old.skip&&view.root.surface.skip,"both old and new failures retry using owned current references");check(raw(safe,0,false),"error combination cleanup");
  check(raw(safe,0,true),"permanent native error baseline");SurfaceControl.failApply=1000;check(!raw(safe,0,false),"persistent native failure remains false after bounded restore retries");check(((Map<?,?>)field("ACTIVE")).isEmpty(),"even persistent failure removes exact stopped lease");SurfaceControl.failApply=0;view.observer.draw();check(!view.root.surface.skip,"later native recovery can still restore retained current reference");
  reset();system=context(131,"1");view=attached(system);lease=new Binder();check(raw(lease,1,true),"same-layer restoration responsibility baseline");
  SurfaceControl.failApply=1000;system.snapshot=new ConfigSnapshot(132,132,"0");FeatureSettings.changed(system);drain();check(view.root.surface.skip,"failed config-off transaction leaves old layer needing restoration");
  repair=holdControl();view.root.surface.mNativeObject+=10000;view.root.replaced();Object replacement=((List<?>)member(field("surfaces"),"controls")).get(0);
  check((Boolean)member(replacement,"mayExclude"),"same-layer replacement inherits unresolved restoration responsibility");
  view.detach();check(view.root.surface.skip&&((List<?>)field("RETIRED")).size()==1,"failed replacement restore remains owned after detach");
  SurfaceControl.failApply=0;repair.countDown();drain();check(!view.root.surface.skip&&((List<?>)field("RETIRED")).isEmpty(),"same-layer pending exclusion restored by worker after detach");
 }
 static void cancelledTransactions()throws Exception{
  for(boolean after:new boolean[]{false,true}){
   reset();Context system=context(after?141:140,"0");View view=attached(system);Binder record=new Binder(),shot=new Binder();check(raw(record,1,true),"recording lease registered before feature becomes active");
   system.snapshot=new ConfigSnapshot(142,142,"1");SurfaceControl.blockAfter=after;
   CountDownLatch entered=new CountDownLatch(1),proceed=new CountDownLatch(1);SurfaceControl.entered=entered;SurfaceControl.proceed=proceed;
   Future<Boolean> attempt=CLIENTS.submit(()->raw(shot,0,true));check(entered.await(1,TimeUnit.SECONDS),"worker reaches real transaction barrier");
   check(!attempt.get(1,TimeUnit.SECONDS),"server 500ms timeout while native apply is blocked");proceed.countDown();drain();
   check(((Map<?,?>)field("ACTIVE")).size()==1&&((Map<?,?>)field("ACTIVE")).containsKey(record),"cancel removes exact screenshot token, keeps recording lease");
   check(view.root.surface.skip,"recording remains excluded after timeout "+(after?"after":"before")+" native commit");
   check(raw(record,1,false)&&!view.root.surface.skip,"final recording stop restores after cancellation");
  }
  reset();Context system=context(150,"1");View view=attached(system);Binder record=new Binder(),shot=new Binder();check(raw(record,1,true),"record before queued cancel");
  CountDownLatch held=new CountDownLatch(1),resume=new CountDownLatch(1);((ExecutorService)field("CONTROL")).execute(()->{held.countDown();try{resume.await(2,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});held.await();
  Future<Boolean> queued=CLIENTS.submit(()->raw(shot,0,true));check(!queued.get(1,TimeUnit.SECONDS),"queued start times out within original 500ms");resume.countDown();drain();
  check(!((Map<?,?>)field("ACTIVE")).containsKey(shot)&&view.root.surface.skip,"cancel before registration cannot later activate or erase another lease");check(raw(record,1,false),"queued-cancel survivor stops");
  reset();system=context(151,"1");view=attached(system);record=new Binder();check(raw(record,1,true),"record before client-timeout window");
  final IBinder real=ContentResolver.endpoint;ContentResolver.endpoint=new Binder(){public boolean transact(int code,Parcel d,Parcel r,int flags)throws RemoteException{boolean result=real.transact(code,d,r,flags);SystemClock.sleep(850);return result;}};
  set("cachedEndpoint",null);Context shotClient=context(151,"1");start(shotClient,0);drain();check(((Map<?,?>)field("LEASES")).isEmpty(),"late client success cannot retain lease after 650ms");
  check(((Map<?,?>)field("ACTIVE")).size()==1&&view.root.surface.skip,"late exact-endpoint release keeps independent recording");
  ContentResolver.endpoint=real;check(raw(record,1,false)&&!view.root.surface.skip,"final survivor restores after late client cleanup");
  reset();system=context(152,"1");view=attached(system);final Binder lockShot=new Binder();int before=view.root.surface.calls;
  synchronized(field("SURFACE_LOCK")){
   Future<Boolean> lockWait=CLIENTS.submit(()->raw(lockShot,0,true));check(!lockWait.get(1,TimeUnit.SECONDS),"server times out while surface lock is held");
   // Main lifecycle work can resume before CONTROL acquires the lock. It must see
   // terminal cancellation rather than the cancelled operation's stale desired=true.
   call("applyLocked",new Class<?>[]{});check(!view.root.surface.skip,"main lifecycle native-only pass cannot activate a cancelled token awaiting controller cleanup");
  }
  drain();check(view.root.surface.calls==before,"cancel before acquiring transaction lock never submits late true transaction");check(((Map<?,?>)field("ACTIVE")).isEmpty(),"lock-wait cancellation cleans exact lease");
 }
 static void epochAck()throws Exception{
  reset();Context system=context(160,"1");View view=attached(system);Binder owner=new Binder();Class<?> type=Class.forName("ls.augment.com.hook.CaptureVisibilityHook$ControlOperation");
  Constructor<?> ctor=type.getDeclaredConstructor(IBinder.class,int.class,boolean.class,CaptureRuntimeObservation.class);ctor.setAccessible(true);
  Object operation=ctor.newInstance(owner,0,true,new CaptureRuntimeObservation(20454,321,0,1,SystemClock.elapsedRealtime()));((ExecutorService)field("CONTROL")).submit((Runnable)operation).get(1,TimeUnit.SECONDS);
  Method current=type.getDeclaredMethod("currentSuccess");current.setAccessible(true);check((Boolean)current.invoke(operation),"matching applied epoch can acknowledge");
  view.root.surface=new SurfaceControl();view.root.replaced();check(!(Boolean)current.invoke(operation),"older operation cannot acknowledge replacement epoch even if that new surface applied separately");check(raw(owner,0,false),"epoch test lease cleanup");
 }
 static void missingIdentity()throws Exception{
  reset();SurfaceControl.handleFieldMissing=true;Context system=context(170,"1");View view=attached(system);Binder lease=new Binder();check(!raw(lease,0,true)&&!view.root.surface.skip,"missing native-handle reflection fails closed");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_capture_surface_snapshot").contains("why=handle_missing"),"missing handle has explicit current-epoch diagnostic");
  SurfaceControl.handleFieldMissing=false;view.observer.draw();check(raw(lease,0,true)&&view.root.surface.skip,"valid native handle recovers from failed-closed snapshot");check(raw(lease,0,false),"identity recovery cleanup");
  view.root.surface.mNativeHandle=0;view.observer.draw();check(!raw(new Binder(),0,true)&&!view.root.surface.skip,"zero handle is never accepted as a stable layer identity");
  check(FeatureSettings.diagnostics.get("ls_augment_rm_capture_surface_snapshot").contains("why=handle_missing"),"zero handle rejection is visible");
 }
 static void steadyFrames()throws Exception{
  for(boolean enabled:new boolean[]{false,true}){reset();Context system=context(enabled?181:180,enabled?"1":"0");View view=attached(system);Binder lease=new Binder();if(enabled)check(raw(lease,1,true),"steady recording lease starts");
   int calls=OemHooks.invocations,metadata=SystemUiAdapter.metadataLookups,copies=SurfaceControl.copies,validChecks=SurfaceControl.copiedValidChecks;Object snapshot=field("surfaces");
   for(int i=0;i<400;i++)view.observer.draw();
   check(OemHooks.invocations==calls,"steady capture frames skip full reflective surface apply "+enabled);check(SystemUiAdapter.metadataLookups==metadata,"steady capture frames reuse reflection accessors "+enabled);
   check(SurfaceControl.copies==copies&&SurfaceControl.copiedValidChecks==validChecks&&field("surfaces")==snapshot,"steady capture frames retain the published native snapshot "+enabled);if(enabled)check(raw(lease,1,false)&&!view.root.surface.skip,"steady recording still restores immediately");
  }
  reset();Context system=context(182,"1");View view=new View(system);view.root.callbacksUnavailable=true;call("attach",new Class<?>[]{View.class},view);drain();Binder lease=new Binder();check(raw(lease,1,true),"capture without native lifecycle callback starts");
  SurfaceControl old=view.root.surface;view.root.surface=new SurfaceControl();view.observer.draw();check(view.root.surface.skip&&!old.skip,"pre-draw identity fallback excludes replacement and restores old without callback");check(raw(lease,1,false)&&!view.root.surface.skip,"fallback recording restores immediately");
 }
 static void copyRecovery()throws Exception{
  reset();Context system=context(190,"1");SurfaceControl.failCopies=1;int copies=SurfaceControl.copies;View view=attached(system);
  check(SurfaceControl.copies==copies,"initial copy failure publishes no unsupported reference");view.observer.draw();check(SurfaceControl.copies==copies+1,"unchanged source retries transient initial copy failure on next frame");Binder lease=new Binder();check(raw(lease,1,true)&&view.root.surface.skip,"recovered initial copy supports recording");check(raw(lease,1,false)&&!view.root.surface.skip,"recovered initial copy restores immediately");
  reset();system=context(191,"1");view=attached(system);lease=new Binder();check(raw(lease,1,true),"copy recovery replacement starts recording");SurfaceControl old=view.root.surface;view.root.surface=new SurfaceControl();SurfaceControl.failCopies=1;view.root.replaced();
  check(!old.skip&&!view.root.surface.skip,"failed replacement copy restores retired source without claiming new exclusion");view.observer.draw();check(view.root.surface.skip,"same replacement source recovers exclusion on next frame after transient copy failure");check(raw(lease,1,false)&&!view.root.surface.skip,"replacement copy recovery preserves immediate stop restore");
 }
 static void repairReportOrder()throws Exception{
  reset();Context system=context(200,"1");View view=attached(system);Binder lease=new Binder();check(raw(lease,1,true),"repair order recording starts");Object success=call("applySurfaces",new Class<?>[]{});
  Object snapshot=field("surfaces");Field controls=snapshot.getClass().getDeclaredField("controls");controls.setAccessible(true);Object owned=((List<?>)controls.get(snapshot)).get(0);Field applied=owned.getClass().getDeclaredField("applied");applied.setAccessible(true);applied.setBoolean(owned,false);
  SurfaceControl.failApply=1;call("applySurfaces",new Class<?>[]{});check((Boolean)field("surfaceRepairNeeded"),"failed native apply publishes retry state");call("reportApply",new Class<?>[]{success.getClass(),CaptureRuntimeObservation.class},success,null);
  check((Boolean)field("surfaceRepairNeeded"),"delayed earlier success report cannot clear newer native retry");int calls=view.root.surface.calls;view.observer.draw();check(view.root.surface.calls>calls&&!(Boolean)field("surfaceRepairNeeded"),"next frame repairs latest failure and clears retry state");calls=view.root.surface.calls;
  call("applySurfaces",new Class<?>[]{CaptureRuntimeObservation.class,java.util.concurrent.atomic.AtomicBoolean.class},null,new java.util.concurrent.atomic.AtomicBoolean(true));check(!(Boolean)field("surfaceRepairNeeded")&&view.root.surface.calls==calls,"cancelled synthetic report does not change native retry state");check(raw(lease,1,false)&&!view.root.surface.skip,"repair-order recording stop restores immediately");
 }
 public static void main(String[]args)throws Exception{Looper.getMainLooper();truth();failures();server();bounded();independentQueue();lifecycle();nativeErrors();cancelledTransactions();epochAck();missingIdentity();steadyFrames();copyRecovery();repairReportOrder();reset();check(SurfaceControl.originalReleases==0,"all native originals retained");check(SurfaceControl.copies==SurfaceControl.releases,"all owned references released at final detach");check(Looper.offMainReads==0,"all View/root calls remain on main");check(FixtureLocks.violations==0,"no configuration/Provider/View work held the surface lock");System.out.println("capture observation checks: "+checks);}
}
'''

def run(overrides=None, expect_assertion=False):
    sources = dict(FILES)
    for name in ['android/content/ContentResolver.java', 'android/view/View.java', 'android/view/SurfaceControl.java']:
        content=sources[name]
        if name.endswith('ContentResolver.java'): content=content.replace('gets++;', 'ls.augment.com.hook.FixtureLocks.outside();gets++;')
        else: content=content.replace('android.os.Looper.check();', 'android.os.Looper.check();ls.augment.com.hook.FixtureLocks.outside();')
        sources[name]=content
    diagnostic_stub = 'ls/augment/com/hook/FeatureSettings.java'
    sources[diagnostic_stub] = sources[diagnostic_stub].replace('diagnostics.put(k,v);',
        'if(!k.matches(' + json.dumps(PROVIDER_KEY_PATTERN) + '))return;diagnostics.put(k,v);')
    sources['ls/augment/com/hook/TestCaptureObservation.java'] = TEST
    for relative in ['hook/CaptureVisibilityHook.java', 'CaptureRuntimeObservation.java']:
        sources['ls/augment/com/' + relative] = (overrides or {}).get(relative, (MAIN / relative).read_text(encoding='utf-8'))
    jdk = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
    with tempfile.TemporaryDirectory(prefix='capture-observation-') as temporary:
        paths = []
        for relative, content in sources.items():
            path = Path(temporary) / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8'); paths.append(str(path))
        subprocess.run([str(jdk/'javac'), '-encoding', 'UTF-8', '--release', '17', '-d', temporary, *paths], check=True)
        result = subprocess.run([str(jdk/'java'), '-cp', temporary, 'ls.augment.com.hook.TestCaptureObservation'], capture_output=True, text=True, timeout=30)
        if expect_assertion:
            assert result.returncode and 'AssertionError' in result.stderr, result.stdout + result.stderr
            print('KILLED:', result.stderr.splitlines()[0]); return
        print(result.stdout, end='')
        if result.returncode: print(result.stderr); result.check_returncode()

def compile_android():
    """Check real Android API signatures; collaborator app dependencies stay narrow stubs."""
    sources = {name: value for name, value in FILES.items() if not name.startswith('android/')}
    sources['ls/augment/com/hook/OemHooks.java']=sources['ls/augment/com/hook/OemHooks.java'].replace('if(n.equals("mNativeHandle")&&android.view.SurfaceControl.handleFieldMissing)return null;', '')
    sources['ls/augment/com/hook/FeatureSettings.java'] = '''package ls.augment.com.hook;
      import android.content.Context;import ls.augment.com.ConfigSnapshot;class FeatureSettings {
      static Context from(Object o){return null;}static ConfigSnapshot snapshot(Context c){return null;}
      static boolean enabled(Context c,String k){return false;}static void addSnapshotListener(Context c,Runnable r){}
      static void diagnostic(Context c,String k,String v){} }'''
    for relative in ['hook/CaptureVisibilityHook.java', 'CaptureRuntimeObservation.java']:
        sources['ls/augment/com/' + relative] = (MAIN / relative).read_text(encoding='utf-8')
    jdk = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
    with tempfile.TemporaryDirectory(prefix='capture-android-compile-') as temporary:
        paths = []
        for relative, content in sources.items():
            path = Path(temporary) / relative; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8'); paths.append(str(path))
        subprocess.run([str(jdk/'javac'), '-encoding', 'UTF-8', '--release', '17', '-cp',
                        str(ROOT/'audit-output/android-sdk/platforms/android-36/android.jar'),
                        '-d', temporary, *paths], check=True)
    print('Android 36 capture signatures: compiled')

if __name__ == '__main__':
    run()
    if '--android-compile' in sys.argv:
        compile_android()
    if '--mutations' in sys.argv:
        hook = (MAIN / 'hook/CaptureVisibilityHook.java').read_text(encoding='utf-8')
        for name, before, after in [
            ('provider-endpoint-key', '(observation.kind<0?"all":Integer.toString(observation.kind))', 'Integer.toString(observation.kind)'),
            ('truth-semantics', 'ConfigSchema.truthy(snapshot.get(key))', '"1".equals(snapshot.get(key))'),
            ('exact-revision', 'observation.revision=snapshot.revision;', 'observation.revision=1;'),
            ('timeout-preservation', 'observation.phase="tx_finished";', 'observation.phase="tx_finished";observation.wait="returned_true";'),
            ('cancel-late-provider', 'if(active&&cancelled.get()){phase("cancelled_before_tx");return false;}', ''),
            ('late-exact-endpoint-release', 'boolean released=present&&transact(endpointUsed,owner,kind,false);', 'boolean released=false;'),
            ('systemui-false-apply', 'observation.exclude=result.exclude;', 'observation.exclude=result.applied;'),
            ('separate-start-stop', 'active?"server_start":"server_stop"', '"server_start"'),
            ('main-queue-dependency', 'CONTROL.execute(operation);', 'main.post(operation);'),
            ('copied-reference-required', 'control=copy.newInstance(original,"DuoCaptureSurface");', 'control=original;'),
            ('original-native-identity', '!entry.owned.sameSource(token,handle)', 'false'),
            ('cancel-exact-owner', 'Lease lease=ACTIVE.remove(owner);', 'Lease lease=ACTIVE.remove(owner);ACTIVE.clear();'),
            ('current-epoch-only-ack', 'applied.epoch==surfaces.epoch&&', ''),
            ('cancelled-decision-never-reactivate', '!lease.cancelled.get()&&(lease.kind==0?screenshot:record)', '(lease.kind==0?screenshot:record)'),
            ('server-timeout-cleanup', 'void cancel(){if(active&&registered)', 'void cancel(){if(false)'),
            ('never-release-original', 'OemHooks.invoke(control,"release");', 'OemHooks.invoke(OemHooks.field(control,"original"),"release");'),
            ('restore-retired-before-release', 'if(!same&&old.mayExclude&&old.valid()&&!setExcluded(old,false)){clean=false;continue;}', 'if(false){clean=false;continue;}'),
            ('failed-epoch-not-applied', 'boolean complete=applied&&clean;', 'boolean complete=applied||clean;'),
            ('retry-transient-copy', 'if(retryCopy||!sourceObserved', 'if(!sourceObserved'),
            ('stale-report-native-retry', 'private static void reportApply(ApplyResult result,CaptureRuntimeObservation observation){', 'private static void reportApply(ApplyResult result,CaptureRuntimeObservation observation){surfaceRepairNeeded=result.retired>0||result.attached>0&&!result.applied;'),
            ('config-listener-reconciles-existing-lease', 'FeatureSettings.addSnapshotListener(context,()->CONTROL.execute(()->{updateDecision(null);applySurfaces();}));', 'FeatureSettings.addSnapshotListener(context,()->CONTROL.execute(()->{applySurfaces();}));'),
            ('native-handle-fail-closed', '!(nativeHandle instanceof Number)||((Number)nativeHandle).longValue()==0', 'false'),
            ('detach-listener-before-attachinfo-clear', 'entry.detached||!view.isAttachedToWindow()', '!view.isAttachedToWindow()'),
            ('same-layer-restore-responsibility', 'current.mayExclude|=old.mayExclude;', ''),
        ]:
            assert hook.count(before) == (2 if name in ('exact-revision','native-handle-fail-closed') else 1), name
            print('MUTATION', name)
            run({'hook/CaptureVisibilityHook.java': hook.replace(before, after)}, expect_assertion=True)
