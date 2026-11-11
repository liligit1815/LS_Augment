"""Exercise the real producer/endpoint/launcher hooks against delayed OEM writes and stale sessions."""
from pathlib import Path
import ast, os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
def literals(name):
    tree=ast.parse((ROOT/'tools'/name).read_text('utf-8'))
    for node in tree.body:
        if isinstance(node,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='files' for t in node.targets) and isinstance(node.value,ast.Dict):
            return ast.literal_eval(node.value)
files={k:v for k,v in literals('test-native-island-clock-source.py').items() if not k.startswith('zte/') and not k.endswith('TestClockSource.java')}
tree=ast.parse((ROOT/'tools/test-native-island-recorder-source.py').read_text('utf-8'))
for node in tree.body:
    if isinstance(node,ast.Expr) and isinstance(node.value,ast.Call) and isinstance(node.value.func,ast.Attribute) and node.value.func.attr=='update':
        files.update(ast.literal_eval(node.value.args[0]))
files.pop('ls/augment/com/hook/TestRecorderSource.java')
files.pop('ls/augment/com/hook/NativeIslandRecorderBridge.java')
files.update({
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle {
 Map<String,Object> data=new HashMap<>();public void putLong(String k,long v){data.put(k,v);}public long getLong(String k){return ((Number)data.getOrDefault(k,0L)).longValue();}
 public void putInt(String k,int v){data.put(k,v);}public int getInt(String k){return ((Number)data.getOrDefault(k,0)).intValue();}
 public void putBoolean(String k,boolean v){data.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(data.get(k));}
 public void putString(String k,String v){data.put(k,v);}public String getString(String k){return (String)data.get(k);}public boolean containsKey(String k){return data.containsKey(k);}}''',
'android/os/Binder.java':'package android.os;public class Binder {public static int uid=10006;public static int getCallingUid(){return uid;}}',
'android/os/Process.java':'package android.os;public class Process {public static int myUid(){return 1000;}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long now=1000,generation=1000000;public static long elapsedRealtime(){return now;}public static long elapsedRealtimeNanos(){return ++generation;}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler {
 static final List<Runnable> queue=new ArrayList<>();public static final Map<Runnable,Long> delayed=new HashMap<>();
 public Handler(Looper l){}public void post(Runnable r){queue.add(r);}public void postDelayed(Runnable r,long ms){delayed.put(r,SystemClock.now+ms);}
 public void removeCallbacks(Runnable r){queue.removeIf(v->v==r);delayed.remove(r);}
 public static void flush(){int n=0;while(!queue.isEmpty()){if(++n>100)throw new AssertionError("callback loop");queue.remove(0).run();}}
 public static void advance(long ms){SystemClock.now+=ms;for(var e:new ArrayList<>(delayed.entrySet()))if(e.getValue()<=SystemClock.now){delayed.remove(e.getKey());queue.add(e.getKey());}flush();}}''',
'android/content/pm/ApplicationInfo.java':'package android.content.pm;public class ApplicationInfo {public int uid;public ApplicationInfo(int v){uid=v;}}',
'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager {
 public ApplicationInfo getApplicationInfo(String p,int flags){return new ApplicationInfo(p.equals("cn.zte.recorder")?10006:p.equals("com.zte.mifavor.launcher")?10042:-1);}}''',
'android/content/Context.java':'''package android.content;import android.os.*;import android.content.pm.*;public class Context {
 public int uid=10006;public static final int RECEIVER_EXPORTED=2;public final ContentResolver resolver=new ContentResolver(this);public BroadcastReceiver receiver;public String requiredPermission;
 public PackageManager getPackageManager(){return new PackageManager();}public Context getApplicationContext(){return this;}public ContentResolver getContentResolver(){return resolver;}
 public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String p,Handler h,int flags){receiver=r;requiredPermission=p;return null;}
 public void unregisterReceiver(BroadcastReceiver r){if(receiver==r)receiver=null;}}''',
'android/content/ContentProvider.java':'''package android.content;import android.os.Bundle;public class ContentProvider {
 public Context getContext(){return new Context();}public Bundle call(String method,String arg,Bundle data){return new Bundle();}}''',
'com/zte/feature/callnotify/ClientProvider.java':'''package com.zte.feature.callnotify;import android.os.Bundle;public class ClientProvider extends android.content.ContentProvider {
 public static final ClientProvider instance=new ClientProvider();@Override public Bundle call(String m,String a,Bundle b){return super.call(m,a,b);}}''',
'android/content/ContentResolver.java':'''package android.content;import android.os.*;import android.net.Uri;import android.database.*;
 import ls.augment.com.hook.AugmentModule;import com.zte.feature.callnotify.ClientProvider;
 public class ContentResolver {public static String value="1",count="00:00:09";public int observers;final Context owner;public ContentResolver(Context c){owner=c;}
 public void registerContentObserver(Object u,boolean b,ContentObserver o){observers++;}public void unregisterContentObserver(ContentObserver o){observers--;}
 public Cursor query(Uri u,String[] p,String s,String[] a,String order){return new Cursor(value);}
 public Bundle call(Uri u,String m,String a,Bundle b){int before=Binder.uid;Binder.uid=owner.uid;try{return (Bundle)AugmentModule.invoke(ClientProvider.instance,ClientProvider.class,"call",new Class<?>[]{String.class,String.class,Bundle.class},m,a,b);}catch(Throwable t){throw new RuntimeException(t);}finally{Binder.uid=before;}}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
 public class AugmentModule {public static final Map<Method,Callback> hooks=new HashMap<>();public int errors;
 public interface Callback {Object run(Chain c)throws Throwable;}public static class Chain {
 Method method;Object target;Object[] args;Chain(Method m,Object o,Object[] a){method=m;target=o;args=a;}
 public Object getThisObject(){return target;}public Object getArg(int i){return args[i];}public List<Object> getArgs(){return Arrays.asList(args);}
 public Object proceed()throws Throwable{return method.invoke(target,args);}public Object proceed(Object[] a)throws Throwable{return method.invoke(target,a);}}
 public static class Hook {Method m;Hook(Method v){m=v;}public Hook intercept(Callback c){hooks.put(m,c);return this;}}
 public Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}public void registerFeatureHook(Hook h){}
 public void logFeatureInfo(String s){}public void logFeatureError(String s,Throwable t){errors++;}
 public static Object invoke(Object o,Class<?> type,String name,Class<?>[] sig,Object...a)throws Throwable {
 Method m=null;for(Class<?> c=type;c!=null;c=c.getSuperclass())try{m=c.getDeclaredMethod(name,sig);break;}catch(NoSuchMethodException ignored){}
 m.setAccessible(true);Callback cb=hooks.get(m);return cb==null?m.invoke(o,a):cb.run(new Chain(m,o,a));}}
''',
'cn/zte/recorder/notification/SystemUiResolver.java':'''package cn.zte.recorder.notification;import java.util.*;import android.content.*;
 public class SystemUiResolver {private static final String RECORD_VISIBLE_URI="content://com.android.systemui.zte/record_visible_status";
 public static final List<Runnable> writes=new ArrayList<>();public static int visibleCalls;
 public static void updateVisible(Context c,int s){visibleCalls++;writes.add(()->ContentResolver.value=Integer.toString(s));}
 public static void updateInfo(Context c,String s){writes.add(()->ContentResolver.count=s);}
 public static void commit(){while(!writes.isEmpty())writes.remove(0).run();}}''',
'cn/zte/recorder/RecorderService.java':'''package cn.zte.recorder;import android.content.Context;import cn.zte.recorder.notification.SystemUiResolver;import ls.augment.com.hook.AugmentModule;
 public class RecorderService extends android.app.Service {
 public static boolean foreground=true,lateWriter;public static String time="00:00:00";public static int counts;
 public static boolean isForeGroundRecording(){return foreground;}public static void setForeGround(boolean f){foreground=f;}
 public static void updateCount(Context c,int s){counts++;try{AugmentModule.invoke(null,SystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class},c,time);
  if(lateWriter){lateWriter=false;Thread old=new Thread(()->{try{AugmentModule.invoke(null,SystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class},c,"00:00:99");}catch(Throwable t){throw new RuntimeException(t);}});old.start();old.join();}
 }catch(Throwable t){throw new RuntimeException(t);}}}''',
'ls/augment/com/hook/NativeIslandScenes.java':'''package ls.augment.com.hook;import android.os.SystemClock;public class NativeIslandScenes {
 static boolean eligible=true;static NativeIslandRecorderState model=new NativeIslandRecorderState();
 static boolean recorderTakeover(){var s=model.current(SystemClock.now);return eligible&&s!=null&&s.complete();}
 static final java.util.Set<String> nativeScenes=new java.util.HashSet<>();
 static boolean capsuleOwned(String scene){return eligible&&(nativeScenes.contains(scene)||"record".equals(scene)&&recorderTakeover());}
 static boolean recorderSnapshot(NativeIslandRecorderState.Snapshot s){return eligible&&model.accept(s,SystemClock.now);}}''',
'android/graphics/RectF.java':'package android.graphics;public class RectF {}',
'android/view/View.java':'package android.view;public class View {}',
'android/view/ViewGroup.java':'package android.view;public class ViewGroup extends View {public int children;public int getChildCount(){return children;}}',
'android/view/WindowManager.java':'package android.view;public class WindowManager {public static class LayoutParams {public static final int FLAG_NOT_TOUCHABLE=16;public int flags=17039656;}}',
'com/android/quickstep/views/CapsuleView.java':'''package com.android.quickstep.views;import android.content.Context;import android.graphics.RectF;public class CapsuleView extends android.view.View {
 public static final int RECORD_VIEW_CODE=1,CALL_VIEW_CODE=0,MEETING_VIEW_CODE=3,MEETING_NEW_VER_VIEW_CODE=4;public static int created;
 public static CapsuleView getCapsuleView(Context c,int type,RectF bounds){created++;return new CapsuleView();}}''',
'ls/augment/com/hook/SystemUiAdapter.java':'''package ls.augment.com.hook;import java.lang.reflect.*;class SystemUiAdapter {
 static Object field(Object o,String name){if(o!=null)for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(Exception ignored){}return null;}
 static Object call(Object o,String name,Object...args)throws Exception{for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){m.setAccessible(true);return m.invoke(o,args);}throw new NoSuchMethodException(name);}}''',
'ls/augment/com/hook/NativeIslandPanelCompat.java':'''package ls.augment.com.hook;class NativeIslandPanelCompat {static boolean ordinary(Object o){return Boolean.FALSE.equals(SystemUiAdapter.field(o,"fullscreen"));}}''',
'ls/augment/com/hook/TestRecorderHandoff.java':'''package ls.augment.com.hook;
import android.content.*;import android.os.*;import android.graphics.RectF;import android.view.*;import cn.zte.recorder.*;
import cn.zte.recorder.manager.RecorderState;import cn.zte.recorder.notification.SystemUiResolver;import com.android.quickstep.views.CapsuleView;
public class TestRecorderHandoff {
 static int checks;static final Class<?>[] NONE={};static void check(boolean ok,String text){checks++;if(!ok)throw new AssertionError(text);}
 static NativeIslandRecorderState.Snapshot current(){return NativeIslandScenes.model.current(SystemClock.now);}
 static Object capsule(Context c,int type)throws Throwable{return AugmentModule.invoke(null,CapsuleView.class,"getCapsuleView",new Class<?>[]{Context.class,int.class,RectF.class},c,type,new RectF());}
 static void front(boolean f)throws Throwable{AugmentModule.invoke(null,RecorderService.class,"setForeGround",new Class<?>[]{boolean.class},f);Handler.flush();}
 static void status(RecorderService s,int state)throws Throwable{RecorderState.state=state;AugmentModule.invoke(null,SystemUiResolver.class,"updateVisible",new Class<?>[]{Context.class,int.class},s,state);Handler.flush();}
 public static class Host {public boolean fullscreen,mDynamicPanelShowing,mDynamicPanelClosing;public ViewGroup mDynamicPermanentContainer=new ViewGroup(),mDynamicDisposableContainer=new ViewGroup();
 public WindowManager.LayoutParams mParams=new WindowManager.LayoutParams();public int updates;public void updateWindowFlags(boolean on){updates++;if(on)mParams.flags&=~16;else mParams.flags|=16;}}
 public static class SubHost extends Host {}
 public static void main(String[] args)throws Throwable {
  AugmentModule module=new AugmentModule();check(NativeIslandRecorderBridge.install(module,TestRecorderHandoff.class.getClassLoader()),"endpoint contract");
  NativeIslandLauncherCapsule.install(module,TestRecorderHandoff.class.getClassLoader());NativeIslandRecorderSource.install(module,TestRecorderHandoff.class.getClassLoader());
  check(module.errors==0,"all actual hooks installed");Context launcher=new Context();launcher.uid=10042;
  check(capsule(launcher,1)!=null,"unknown producer uses OEM fallback");
  FeatureSettings.values.put("duo",true);FeatureSettings.values.put("master",false);FeatureSettings.values.put("record",false);
  RecorderState.state=1;RecorderService s=new RecorderService();AugmentModule.invoke(s,RecorderService.class,"onCreate",NONE);Handler.flush();
  check(current().active()&&!current().visible(false)&&current().count.equals("00:00:00"),"foreground snapshot combines new session and actual zero duration");
  check(ContentResolver.count.equals("00:00:09"),"OEM count write deliberately still pending");
  check(capsule(launcher,1)==null,"independent launcher capsule cannot display stale nine");
  check(capsule(launcher,0)!=null,"call animation preserved");
  NativeIslandScenes.nativeScenes.add("call");NativeIslandScenes.nativeScenes.add("meeting");
  check(capsule(launcher,0)==null&&capsule(launcher,3)==null&&capsule(launcher,4)==null,"native call and both meeting animations yield to island");
  check(capsule(launcher,2)!=null&&capsule(launcher,99)!=null,"cast and unknown launcher types preserved");
  NativeIslandScenes.nativeScenes.clear();
  check(SystemUiResolver.visibleCalls==0,"atomic transport does not add a competing native visible writer");
  front(false);check(current().visible(false),"foreground setter updates immediately without countdown tick");
  check(!current().visible(true),"SystemUI foreground barrier vetoes delayed background snapshot");
  var old=current();RecorderService.time="00:00:01";AugmentModule.invoke(null,SystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class},s,RecorderService.time);Handler.flush();
  check(current().count.equals("00:00:01"),"real publisher callback updates model without updateCount hook");
  AugmentModule.invoke(null,SystemUiResolver.class,"updateInfo",new Class<?>[]{Context.class,String.class},s,"00:00:09");Handler.flush();
  check(current().count.equals("00:00:01"),"late previous-session publisher value is resampled from actual current model");
  RecorderService.lateWriter=true;Handler.advance(1000);
  check(current().count.equals("00:00:01"),"concurrent old publisher cannot contaminate current thread's sample");
  RecorderService.time=null;Handler.advance(1000);
  check(!current().complete()&&capsule(launcher,1)!=null,"missing synchronous count keeps original capsule");
  RecorderService.time="00:00:01";Handler.advance(1000);
  check(current().complete()&&capsule(launcher,1)==null,"complete snapshot restores ownership");
  check(!NativeIslandScenes.model.accept(old,SystemClock.now),"late old sequence rejected");
  front(true);check(!current().visible(false),"return to recorder retracts before stale provider commits");
  SystemUiResolver.commit();check(!current().visible(false),"delayed native writes do not resurrect foreground island");
  front(false);RecorderService.time="00:00:09 paused";status(s,2);check(current().active()&&current().state==2&&current().count.endsWith("paused"),"pause text and status are one snapshot");
  long seq=current().sequence;Handler.advance(1000);check(current().sequence>seq&&current().fresh(SystemClock.now),"paused service heartbeat renews ownership");
  status(s,0);check(!current().active()&&current().count==null,"stop invalidates previous duration");
  check(capsule(launcher,1)==null,"stop handoff does not expose stale native capsule");
  var ended=current();RecorderState.state=1;RecorderService.time="00:00:00";RecorderService newer=new RecorderService();AugmentModule.invoke(newer,RecorderService.class,"onCreate",NONE);Handler.flush();
  check(current().generation>ended.generation&&!NativeIslandScenes.model.accept(ended,SystemClock.now),"old service cannot withdraw new recording");
  Context hostile=new Context();hostile.uid=10055;check(!NativeIslandRecorderBridge.owns(hostile),"foreign caller cannot use capability endpoint");
  check(!NativeIslandRecorderBridge.publish(hostile,Long.MAX_VALUE,1,1,false,"00:00:99"),"foreign snapshot rejected before it can poison generation");
  FeatureSettings.change("master",false);Handler.advance(1000);check(capsule(launcher,1)==null,"completion OFF keeps native recorder ownership and heartbeat");
  NativeIslandScenes.eligible=false;check(capsule(launcher,1)!=null,"master OFF restores original animation");
  FeatureSettings.change("duo",false);int writes=SystemUiResolver.visibleCalls;Handler.advance(2000);check(SystemUiResolver.visibleCalls==writes&&Handler.delayed.isEmpty(),"OFF stops heartbeat and producer writes");
  NativeIslandScenes.eligible=true;SystemClock.now+=5000;check(!NativeIslandRecorderBridge.owns(launcher),"missing producer expires to native fallback");
  check(!NativeIslandScenes.model.accept(new NativeIslandRecorderState.Snapshot(Long.MAX_VALUE,1,SystemClock.now+1,1,false,"x"),SystemClock.now),"future timestamps rejected");
  for(Host h:new Host[]{new Host(),new SubHost()}){
   NativeIslandInput.releaseEmpty(h);check((h.mParams.flags&16)!=0&&h.updates==1,"empty ordinary host releases input");
   NativeIslandInput.releaseEmpty(h);check(h.updates==1,"layout callbacks do not repeatedly update flags");
   h.mParams.flags&=~16;h.mDynamicPermanentContainer.children=1;NativeIslandInput.releaseEmpty(h);check((h.mParams.flags&16)==0,"persistent content keeps input");
   h.mDynamicPermanentContainer.children=0;h.mDynamicDisposableContainer.children=1;NativeIslandInput.releaseEmpty(h);check((h.mParams.flags&16)==0,"transient notification keeps input");
   h.mDynamicDisposableContainer.children=0;h.mDynamicPanelShowing=true;NativeIslandInput.releaseEmpty(h);check((h.mParams.flags&16)==0,"open panel keeps input");
   h.mDynamicPanelShowing=false;h.fullscreen=true;NativeIslandInput.releaseEmpty(h);check((h.mParams.flags&16)==0,"fullscreen host untouched");
  }
  NativeIslandInput.releaseEmpty(new Object());
  System.out.println("PASS recorder handoff: "+checks+" checks; real source/IPC/launcher hooks, delayed writes, leases, OFF, pause, stale sessions and empty input");
 }
}'''
})
with tempfile.TemporaryDirectory(prefix='duo-recorder-handoff-') as temp:
    folder=Path(temp)
    for name,text in files.items():
        p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8')
    real=['NativeIslandRecorderSource','NativeIslandRecorderBridge','NativeIslandRecorderState','NativeIslandLauncherCapsule',
          'NativeIslandInput','NativeIslandSceneContract','NativeIslandScenePolicy']
    sources=[*map(str,folder.rglob('*.java')),*[str(ROOT/'android/app/src/main/java/ls/augment/com/hook'/f'{name}.java') for name in real]]
    java=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',temp,*sources],check=True)
    subprocess.run([str(java/'java.exe'),'-cp',temp,'ls.augment.com.hook.TestRecorderHandoff'],check=True,timeout=30)
