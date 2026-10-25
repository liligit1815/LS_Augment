"""Run the production physical-slider hook against deterministic OEM and Android facades.

This tests callback ownership, disabled pass-through, replay suppression, independent
directions, action APIs and stale queued actions. It does not claim hardware/device UI QA.
"""
from pathlib import Path
import os
import subprocess

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'audit-output/competitive-key-runtime-tests'
SRC=OUT/'src'
JDK=Path(os.environ.get('JAVA_HOME',r'C:/Program Files/Android/openjdk/jdk-21.0.8'))

STUBS={
'android/os/Looper.java':'package android.os;public class Looper {public static Looper getMainLooper(){return null;}}',
'android/os/Handler.java':'package android.os;public class Handler {public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}public boolean postDelayed(Runnable r,long ms){return true;}}',
'android/os/Process.java':'package android.os;public class Process {public static final int SYSTEM_UID=1000;public static int myUid(){return 1000;}public static int myPid(){return 999;}}',
'android/os/Binder.java':'package android.os;public class Binder {public static long clearCallingIdentity(){return 0;}public static void restoreCallingIdentity(long v){}}',
'android/os/UserHandle.java':'package android.os;public class UserHandle {public final int id;private UserHandle(int v){id=v;}public static UserHandle of(int id){return new UserHandle(id);}}',
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle {public final Map<String,Object> values=new HashMap<>();public void putBoolean(String k,boolean v){values.put(k,v);}public void putLong(String k,long v){values.put(k,v);}public void putString(String k,String v){values.put(k,v);}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}}''',
'android/os/PowerManager.java':'''package android.os;public class PowerManager {public boolean save;public boolean isPowerSaveMode(){return save;}public boolean setPowerSaveModeEnabled(boolean on){save=on;return true;}}''',
'android/media/AudioManager.java':'''package android.media;public class AudioManager {public static final int RINGER_MODE_SILENT=0,RINGER_MODE_NORMAL=2;public int mode=2;public void setRingerModeInternal(int value){mode=value;}public int getRingerModeInternal(){return mode;}}''',
'android/net/Uri.java':'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
'android/content/Intent.java':'''package android.content;public class Intent {public static final int FLAG_ACTIVITY_NEW_TASK=268435456;public final String pkg;public Intent(String p){pkg=p;}public Intent addFlags(int f){return this;}}''',
'android/content/pm/PackageManager.java':'''package android.content.pm;import android.content.Intent;public class PackageManager {public Intent getLaunchIntentForPackage(String pkg){return new Intent(pkg);}public Object getApplicationInfo(String pkg,int flags){return new Object();}}''',
'android/content/ContentResolver.java':'''package android.content;import android.net.Uri;import android.os.Bundle;public class ContentResolver {public volatile int shells;public Bundle last;public Bundle call(Uri uri,String method,String arg,Bundle data){Bundle r=new Bundle();if(method.equals("snapshot")){r.putString("snapshot","facade");return r;}shells++;last=data;r.putString("message","命令已执行");return r;}}''',
'android/app/ActivityManager.java':'''package android.app;public class ActivityManager {public volatile String stopped="";public int stoppedUser=-1;public void forceStopPackageAsUser(String pkg,int user){stopped=pkg;stoppedUser=user;}}''',
'android/content/Context.java':'''package android.content;import android.os.*;import android.media.*;import android.content.pm.*;import android.app.*;public class Context {public static final String ACTIVITY_SERVICE="activity";public final AudioManager audio=new AudioManager();public final PowerManager power=new PowerManager();public final ActivityManager activity=new ActivityManager();public final PackageManager pm=new PackageManager();public final ContentResolver resolver=new ContentResolver();public volatile String launched="";public int launchUser=-1;public java.util.concurrent.CountDownLatch blockLaunch,launchEntered;public <T>T getSystemService(Class<T> c){return c.cast(c==AudioManager.class?audio:power);}public Object getSystemService(String s){return activity;}public PackageManager getPackageManager(){return pm;}public ContentResolver getContentResolver(){return resolver;}public Context createContextAsUser(UserHandle h,int flags){return this;}public void startActivityAsUser(Intent i,UserHandle user)throws InterruptedException {if(launchEntered!=null)launchEntered.countDown();if(blockLaunch!=null)blockLaunch.await();launched=i.pkg;launchUser=user.id;}}''',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20544;}',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema {public static boolean truthy(String s){return "1".equals(s);}}',
'ls/augment/com/ConfigSnapshot.java':'''package ls.augment.com;import java.util.*;public class ConfigSnapshot {public final long revision;public final Map<String,String> values;public ConfigSnapshot(long r,Map<String,String> v){revision=r;values=new HashMap<>(v);}public String get(String key){return values.getOrDefault(key,"");}public static ConfigSnapshot parse(String s){return ls.augment.com.hook.FeatureSettings.config;}}''',
'ls/augment/com/hook/AugmentModule.java':'package ls.augment.com.hook;public class AugmentModule {}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.*;import ls.augment.com.*;import java.util.*;public class FeatureSettings {public static Context context;public static volatile ConfigSnapshot config;public static final Map<String,String> diagnostics=new java.util.concurrent.ConcurrentHashMap<>();public static Context from(Object o){return context;}public static ConfigSnapshot snapshot(Context c){return config;}public static boolean enabled(Context c,String k){return "1".equals(config.get(k));}public static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}public static boolean addSnapshotListener(Context c,Runnable l){return true;}}''',
'ls/augment/com/hook/OemHooks.java':'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;public class OemHooks {
public interface Hooker {Object intercept(Chain c)throws Throwable;}
public interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}
static final Map<String,Hooker> hooks=new HashMap<>();
static int methods(AugmentModule module,ClassLoader loader,String type,String name,Class<?> result,int n,String key,Hooker hook,Class<?>[] params){
try{Class<?> owner=Class.forName(type);owner.getDeclaredMethod(name,params);hooks.put(type+"."+name,c->{if(!key.isEmpty()&&!FeatureSettings.enabled(FeatureSettings.context,key))return c.proceed();return hook.intercept(c);});return 1;}catch(Exception absent){return 0;}}
public static Object call(Object owner,String method,Object[] args,java.util.function.Supplier<Object> stock){Hooker hook=hooks.get(owner.getClass().getName()+"."+method);try{return hook==null?stock.get():hook.intercept(new Chain(){public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}public Object proceed(){return stock.get();}});}catch(Throwable e){throw new RuntimeException(e);}}
static Object field(Object owner,String... names){try{return owner.getClass().getField(names[0]).get(owner);}catch(Exception e){return null;}}
static boolean set(Object owner,Object value,String... names){try{(owner instanceof Class?(Class<?>)owner:owner.getClass()).getField(names[0]).set(owner instanceof Class?null:owner,value);return true;}catch(Exception e){return false;}}
static Object invoke(Object owner,String name,Object... args)throws ReflectiveOperationException {for(Method m:owner.getClass().getMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length)return m.invoke(owner,args);throw new NoSuchMethodException(name);}
}''',
'com/android/server/redmagic/GameKeysCtrl.java':'''package com.android.server.redmagic;import android.content.Context;import ls.augment.com.hook.OemHooks;public class GameKeysCtrl {public Context mContext;public int mCurrentUserId,mGameState,stock;public static boolean isGameKeyOpend=true;public GameKeysCtrl(Context c){mContext=c;}public void systemReady(){OemHooks.call(this,"systemReady",new Object[0],()->null);}public void notifyGameSwitchChanged(long when,boolean up,boolean screen){OemHooks.call(this,"notifyGameSwitchChanged",new Object[]{when,up,screen},()->{stock++;return null;});}}''',
'com/android/server/redmagic/SlideKeysCtrl.java':'''package com.android.server.redmagic;import android.content.Context;import ls.augment.com.hook.OemHooks;public class SlideKeysCtrl {public Context mContext;public int mCurrentUserId,stock;public SlideKeysCtrl(Context c){mContext=c;}public void notifyCameraSlideKeySwitchChanged(long when,boolean up,boolean screen){OemHooks.call(this,"notifyCameraSlideKeySwitchChanged",new Object[]{when,up,screen},()->{stock++;return null;});}}''',
'com/android/server/redmagic/game/GameModeController.java':'''package com.android.server.redmagic.game;import ls.augment.com.hook.OemHooks;public class GameModeController {public int reads;public boolean isGameKeyOn(){return (Boolean)OemHooks.call(this,"isGameKeyOn",new Object[0],()->{reads++;return true;});}}''',
'com/redmagic/game/GameKeysHelper.java':'''package com.redmagic.game;import android.content.Context;public class GameKeysHelper {public static boolean isSlideKeyStartGameLauncher(Context context){return true;}}''',
'ls/augment/com/hook/TestCompetitiveKeyRuntime.java':'''package ls.augment.com.hook;
import android.content.*;import ls.augment.com.*;import com.android.server.redmagic.*;import com.android.server.redmagic.game.*;import java.util.*;
public class TestCompetitiveKeyRuntime {
static int checks;static long sequence=100;static Map<String,String> values=new HashMap<>();static long revision;
static void check(boolean v,String label){checks++;if(!v)throw new AssertionError(label);}
static void set(int category,int up,int down){values.put(CompetitiveKeyOptions.CATEGORY,""+category);values.put(CompetitiveKeyOptions.UP_ACTION,""+up);values.put(CompetitiveKeyOptions.DOWN_ACTION,""+down);publish();}
static void publish(){FeatureSettings.config=new ConfigSnapshot(++revision,values);}
static void done(String text)throws Exception{long until=System.nanoTime()+2_000_000_000L;while(System.nanoTime()<until&&!FeatureSettings.diagnostics.getOrDefault(CompetitiveKeyOptions.RUNTIME,"").contains(text))Thread.sleep(5);check(FeatureSettings.diagnostics.getOrDefault(CompetitiveKeyOptions.RUNTIME,"").contains(text),"runtime "+text);}
public static void main(String[] a)throws Exception{
Context context=new Context();FeatureSettings.context=context;values.put(CompetitiveKeyOptions.ENABLED,"0");values.put(CompetitiveKeyOptions.APP_PACKAGE,"com.example.target");publish();
check(CompetitiveKeyHook.install(new AugmentModule(),TestCompetitiveKeyRuntime.class.getClassLoader())==5,"two exact physical callbacks plus lifecycle and game guards installed");
GameKeysCtrl game=new GameKeysCtrl(context);SlideKeysCtrl slide=new SlideKeysCtrl(context);GameModeController mode=new GameModeController();game.systemReady();
game.notifyGameSwitchChanged(++sequence,false,true);check(game.stock==1&&mode.isGameKeyOn(),"disabled callbacks and game mode pass through");
values.put(CompetitiveKeyOptions.ENABLED,"1");set(0,1,2);
game.notifyGameSwitchChanged(0,true,true);check(game.stock==1&&context.launched.isEmpty(),"boot/init replay suppressed without action");
game.notifyGameSwitchChanged(++sequence,true,true);done("已打开指定app");check(context.launched.equals("com.example.target")&&context.launchUser==0&&game.mGameState==1&&!GameKeysCtrl.isGameKeyOpend,"specified app opened and native switch bookkeeping updated");
slide.notifyCameraSlideKeySwitchChanged(sequence,true,true);check(slide.stock==0,"second physical route also consumes stock without duplicate action");
slide.notifyCameraSlideKeySwitchChanged(++sequence,false,true);done("已关闭指定app");check(game.mGameState==0,"OEM empty action's camera route keeps game-owner physical position current");
game.notifyGameSwitchChanged(++sequence,true,true);done("已打开指定app");
check(!mode.isGameKeyOn()&&mode.reads==1,"wake/unlock scene remains off while feature owns key");
game.notifyGameSwitchChanged(++sequence,false,true);done("已关闭指定app");check(context.activity.stopped.equals("com.example.target"),"only specified app force stopped");
set(1,3,4);game.notifyGameSwitchChanged(++sequence,true,true);done("已切换静音");check(context.audio.mode==0,"up silent uses internal ringer API");
game.notifyGameSwitchChanged(++sequence,false,true);done("已切换响铃");check(context.audio.mode==2,"down restores ring");
set(2,5,6);game.notifyGameSwitchChanged(++sequence,true,true);done("已开启省电模式");check(context.power.save,"power enabled");game.notifyGameSwitchChanged(++sequence,false,true);done("已关闭省电模式");check(!context.power.save,"power disabled");
set(3,7,0);game.notifyGameSwitchChanged(++sequence,true,true);done("命令已执行");check(context.resolver.shells==1&&Boolean.TRUE.equals(context.resolver.last.values.get("up")),"shell routed from the true up direction");
slide.notifyCameraSlideKeySwitchChanged(sequence,true,true);Thread.sleep(40);check(context.resolver.shells==1,"same physical edge from second route never reruns shell");
game.notifyGameSwitchChanged(++sequence,false,true);done("无动作");check(context.resolver.shells==1,"empty down direction suppresses native without shell");
set(3,0,7);game.notifyGameSwitchChanged(++sequence,true,true);done("无动作");game.notifyGameSwitchChanged(++sequence,false,true);done("命令已执行");check(context.resolver.shells==2&&Boolean.FALSE.equals(context.resolver.last.values.get("up")),"up empty and down executes independently");
context.blockLaunch=new java.util.concurrent.CountDownLatch(1);context.launchEntered=new java.util.concurrent.CountDownLatch(1);set(0,1,2);
game.notifyGameSwitchChanged(++sequence,true,true);check(context.launchEntered.await(2,java.util.concurrent.TimeUnit.SECONDS),"action worker reached blocking launch");
game.notifyGameSwitchChanged(++sequence,false,true);context.activity.stopped="sentinel";values.put("unrelated_statusbar_setting","changed");publish();context.blockLaunch.countDown();done("已关闭指定app");
check(context.activity.stopped.equals("com.example.target"),"unrelated snapshot revision does not discard unchanged key action");
context.blockLaunch=new java.util.concurrent.CountDownLatch(1);context.launchEntered=new java.util.concurrent.CountDownLatch(1);
game.notifyGameSwitchChanged(++sequence,true,true);check(context.launchEntered.await(2,java.util.concurrent.TimeUnit.SECONDS),"next action worker reached blocking launch");
game.notifyGameSwitchChanged(++sequence,false,true);context.activity.stopped="sentinel";values.put(CompetitiveKeyOptions.APP_PACKAGE,"com.example.changed");publish();context.blockLaunch.countDown();Thread.sleep(80);
check(context.activity.stopped.equals("sentinel"),"competitive configuration edit cancels queued action");
context.blockLaunch=new java.util.concurrent.CountDownLatch(1);context.launchEntered=new java.util.concurrent.CountDownLatch(1);
game.notifyGameSwitchChanged(++sequence,true,true);check(context.launchEntered.await(2,java.util.concurrent.TimeUnit.SECONDS),"final action worker reached blocking launch");
game.notifyGameSwitchChanged(++sequence,false,true);String stopped=context.activity.stopped;context.activity.stopped="sentinel";
values.put(CompetitiveKeyOptions.ENABLED,"0");publish();context.blockLaunch.countDown();Thread.sleep(80);check(context.activity.stopped.equals("sentinel"),"queued action cannot execute after configuration disabled");
game.notifyGameSwitchChanged(++sequence,true,true);check(game.stock==2&&mode.isGameKeyOn(),"disable restores original callbacks and wake scene behavior");
System.out.println("PASS CompetitiveKeyHook runtime: "+checks+" assertions");
}}
'''
}

def main():
    SRC.mkdir(parents=True,exist_ok=True)
    paths=[]
    for name,code in STUBS.items():
        path=SRC/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf-8');paths.append(path)
    production=ROOT/'android/app/src/main/java/ls/augment/com'
    paths += [production/name for name in ('EnhancementOption.java','CompetitiveKeyOptions.java','CompetitiveKeyPolicy.java','hook/CompetitiveKeyHook.java')]
    classes=OUT/'classes';classes.mkdir(exist_ok=True)
    subprocess.run([str(JDK/'bin/javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,paths)],check=True)
    subprocess.run([str(JDK/'bin/java.exe'),'-cp',str(classes),'ls.augment.com.hook.TestCompetitiveKeyRuntime'],check=True)

if __name__=='__main__':main()
