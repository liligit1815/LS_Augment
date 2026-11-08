"""Run real Extra Dim hook/control bodies against native-pipeline fixtures.
These cover execution readback and user ownership, not hardware or optical output.
"""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
JDK=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
files={
'android/database/ContentObserver.java':'package android.database;public class ContentObserver{public void onChange(boolean b){}}',
'ls/augment/com/hook/FeatureRuntimeLog.java':'''package ls.augment.com.hook;final class FeatureRuntimeLog{static final java.util.List<String> events=new java.util.ArrayList<>();static void event(String s,String d){events.add(s+":"+d);}static void state(String s,String k,String d){event(s,d);}static String failure(Throwable t){return t.getClass().getName();}}''',
'ls/augment/com/StartupDiagnostics.java':'''package ls.augment.com;final class StartupDiagnostics{static final java.util.List<String> events=new java.util.ArrayList<>();static void record(String s,String d,Throwable t){events.add(s+":"+d);}}''',
'android/content/Context.java':'package android.content;public class Context{public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}}',
'android/content/ContentResolver.java':'''package android.content;public class ContentResolver{public final java.util.Map<String,String> settings=new java.util.HashMap<>();public int lastUser;public android.os.Bundle call(android.net.Uri uri,String method,String key,android.os.Bundle args){lastUser=args.getInt("_user",-1);android.os.Bundle b=new android.os.Bundle();b.putString("value",settings.get(lastUser+":"+key));return b;}}''',
'android/net/Uri.java':'package android.net;public class Uri{public static Uri parse(String text){return new Uri();}}',
'android/os/Build.java':'package android.os;public class Build{public static final String MODEL="NX789J",DEVICE="NX789J";}',
'android/os/Handler.java':'package android.os;public class Handler{}',
'android/os/Message.java':'package android.os;public class Message{}',
'android/os/Process.java':'package android.os;public class Process{public static int uid=10424;public static int myUid(){return uid;}}',
'android/os/Bundle.java':'''package android.os;public class Bundle{final java.util.Map<String,Object> values=new java.util.HashMap<>();public int size(){return values.size();}public Object get(String k){return values.get(k);}public void putBoolean(String k,boolean v){values.put(k,v);}public void putInt(String k,int v){values.put(k,v);}public void putString(String k,String v){values.put(k,v);}public boolean getBoolean(String k){return getBoolean(k,false);}public boolean getBoolean(String k,boolean d){Object v=values.get(k);return v instanceof Boolean?(Boolean)v:d;}public int getInt(String k,int d){Object v=values.get(k);return v instanceof Integer?(Integer)v:d;}public String getString(String k){return (String)values.get(k);}}''',
'com/android/server/SystemService.java':'''package com.android.server;public class SystemService{public final android.content.Context context=new android.content.Context();public final com.android.server.display.color.DisplayTransformManager manager=new com.android.server.display.color.DisplayTransformManager();public android.content.Context getContext(){return context;}protected Object getLocalService(Class<?> c){return manager;}}''',
'com/android/server/display/color/DisplayTransformManager.java':'''package com.android.server.display.color;public class DisplayTransformManager{public final java.util.Map<Integer,float[]> slots=new java.util.HashMap<>();public float[] getColorMatrix(int i){return slots.get(i);}public void setColorMatrix(int i,float[] m){slots.put(i,m.clone());}}''',
'com/android/server/display/color/TintController.java':'''package com.android.server.display.color;public class TintController{public boolean active;public void setActivated(Boolean on){active=Boolean.TRUE.equals(on);}public boolean isActivated(){return active;}public int getLevel(){return 100;}public float[] getMatrix(){return identity();}public static float[] identity(){float[] m=new float[16];for(int i=0;i<16;i+=5)m[i]=1;return m;}}''',
'com/android/server/display/color/ReduceBrightColorsTintController.java':'''package com.android.server.display.color;public class ReduceBrightColorsTintController extends TintController{public int strength;public boolean available=true;public void setMatrix(int value){strength=value;}public boolean isAvailable(android.content.Context c){return available;}public int getStrength(){return strength;}public int getLevel(){return 250;}public float[] getMatrix(){float[] m=identity();if(active)m[0]=m[5]=m[10]=1-strength*.008f;return m;}}''',
'com/android/server/display/color/ColorDisplayService.java':'''package com.android.server.display.color;public class ColorDisplayService extends com.android.server.SystemService{public int mCurrentUser;public final android.os.Handler mHandler=new android.os.Handler();public final ReduceBrightColorsTintController mReduceBrightColorsTintController=new ReduceBrightColorsTintController();public int applications;public void applyTint(TintController target,boolean immediate){applications++;manager.setColorMatrix(target.getLevel(),target.getMatrix());}private void dumpInternal(java.io.PrintWriter w){w.println("Native color service");}public void onReduceBrightColorsActivationChanged(boolean ignored){mReduceBrightColorsTintController.active="1".equals(context.resolver.settings.get(mCurrentUser+":reduce_bright_colors_activated"));}public void onReduceBrightColorsStrengthLevelChanged(){String v=context.resolver.settings.get(mCurrentUser+":reduce_bright_colors_level");mReduceBrightColorsTintController.strength=v==null?44:Integer.parseInt(v);}public void setUp(){mReduceBrightColorsTintController.strength=0;mReduceBrightColorsTintController.active=false;}public static class TintHandler{public void handleMessage(android.os.Message m){}}}''',
 'ls/augment/com/hook/ExtraDimOwnershipClient.java':r'''package ls.augment.com.hook;
final class ExtraDimOwnershipClient{
 static final java.util.Set<Integer> owned=new java.util.HashSet<>();static java.util.function.Consumer<Delivery> callback;
 static android.content.Context context;static int user,reconciles,invalidations;static State stale;static Delivery latest;
 static final class State{final boolean owned,active,restoring;final int strength;State(boolean o,boolean a,int s){this(o,a,s,false);}State(boolean o,boolean a,int s,boolean r){owned=o;active=a;strength=s;restoring=r;}}
 static final class Delivery{final State state;boolean valid=true;Delivery(State s){state=s;}boolean current(){return valid;}void complete(){}}
 static String evidence(){return "ownership=ready";}static void reconcile(int u,android.os.Handler h){reconciles++;}
 static void nativeChanged(int u,android.os.Handler h){invalidations++;if(latest!=null)latest.valid=false;}
 static State peek(android.content.Context c,int u,android.os.Handler h,java.util.function.Consumer<Delivery> r){callback=r;context=c;user=u;c.resolver.lastUser=u;if(stale!=null)return stale;return read(owned.contains(u),false);}
 static State read(boolean o,boolean restore){String a=context.resolver.settings.get(user+":reduce_bright_colors_activated"),s=context.resolver.settings.get(user+":reduce_bright_colors_level");int v=s!=null&&s.matches("[0-9]{1,3}")?Integer.parseInt(s):-1;return new State(o,"1".equals(a),v,restore);}
 static void send(boolean o){latest=new Delivery(read(o,!o));callback.accept(latest);}
}''',

'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;final class FeatureSettings{static void diagnostic(android.content.Context c,String k,String v){}}',
 'ls/augment/com/hook/AugmentModule.java':r'''package ls.augment.com.hook;
public class AugmentModule{
 public static AugmentModule active;public int errors;interface Interceptor{Object run(Chain chain)throws Throwable;}
 interface Chain{Object getArg(int i);Object getThisObject();Object proceed()throws Throwable;}
 static class Builder{final java.lang.reflect.Method method;Interceptor callback;Builder(java.lang.reflect.Method m){method=m;}Builder intercept(Interceptor c){callback=c;return this;}}
 final java.util.Map<java.lang.reflect.Method,Interceptor> hooks=new java.util.HashMap<>();
 Builder prepareFeatureHook(java.lang.reflect.Method m,String k,boolean o){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.callback);active=this;}
 void deoptimize(java.lang.reflect.Method m){}void logFeatureError(String k,Throwable e){errors++;throw new AssertionError(k,e);}void logFeatureInfo(String text){}
 public Object invoke(Object target,String name,Object...args)throws Throwable{
  java.lang.reflect.Method method=null;Class<?> type=target instanceof Class?(Class<?>)target:target.getClass();
  for(Class<?> c=type;c!=null&&method==null;c=c.getSuperclass())for(java.lang.reflect.Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){method=m;break;}
  if(method==null)throw new NoSuchMethodException(name);method.setAccessible(true);final java.lang.reflect.Method chosen=method;final Object receiver=target instanceof Class?null:target;
  Chain chain=new Chain(){public Object getArg(int i){return args[i];}public Object getThisObject(){return receiver;}public Object proceed()throws Throwable{
   boolean secure=chosen.getDeclaringClass()==android.provider.Settings.Secure.class,old=android.provider.Settings.Secure.original;
   if(secure)android.provider.Settings.Secure.original=true;try{return chosen.invoke(receiver,args);}finally{android.provider.Settings.Secure.original=old;}}};
  Interceptor hook=hooks.get(chosen);return hook==null?chain.proceed():hook.run(chain);
 }
}''',
'android/provider/Settings.java':r'''package android.provider;
public class Settings{public static final class Secure{
 public static boolean original,fail;public static final java.util.Map<String,Integer> stale=new java.util.HashMap<>();
 public static int getIntForUser(android.content.ContentResolver c,String k,int d,int u){
  if(!original&&ls.augment.com.hook.AugmentModule.active!=null)try{return (Integer)ls.augment.com.hook.AugmentModule.active.invoke(Secure.class,"getIntForUser",c,k,d,u);}catch(Throwable e){throw new IllegalStateException(e);}
  if(fail)throw new IllegalStateException("native read failed");Integer cached=stale.get(u+":"+k);if(cached!=null)return cached;
  String value=c.settings.get(u+":"+k);return value==null?d:Integer.parseInt(value);
 }
}}''',

'ls/augment/com/RootShell.java':'''package ls.augment.com;final class RootShell{static final java.util.Queue<String> dumps=new java.util.ArrayDeque<>();static String last="",settings="1\\n80";static int exit;static void responses(String...values){dumps.clear();exit=0;for(String v:values)dumps.add(v);last=values.length==0?"":values[values.length-1];}static Result run(String command,String input,long timeout,int limit){if(command.equals("dumpsys color_display"))return new Result(exit,dumps.isEmpty()?last:dumps.remove());if(command.startsWith("settings --user "))return new Result(exit,settings);throw new AssertionError(command);}static class Result{final int code;final String output;Result(int c,String s){code=c;output=s;}boolean isSuccess(){return code==0;}}}''',
'ls/augment/com/ModuleSystemSettings.java':'''package ls.augment.com;final class ModuleSystemSettings{static int writes;static boolean lastActive;static boolean success=true;static WriteResult setExtraDim(android.content.Context c,boolean on,int strength){writes++;lastActive=on;if(success)RootShell.settings=(on?"1":"0")+"\\n"+strength;return new WriteResult(success,success?"已应用":"恢复记录写入失败");}static class WriteResult{final boolean success;final String message;WriteResult(boolean ok,String text){success=ok;message=text;}}}''',
'ls/augment/com/hook/TestExtraDimHook.java':r'''package ls.augment.com.hook;
import com.android.server.display.color.*;import ls.augment.com.ExtraDimRuntime;import java.io.*;
public class TestExtraDimHook{
 static int checks;static void check(boolean yes,String label){checks++;if(!yes)throw new AssertionError(label);}
 static String dump(AugmentModule m,ColorDisplayService s)throws Throwable{StringWriter text=new StringWriter();m.invoke(s,"dumpInternal",new PrintWriter(text));return text.toString();}
 public static void main(String[] args)throws Throwable{
  AugmentModule m=new AugmentModule();ExtraDimHook.install(m,TestExtraDimHook.class.getClassLoader());check(m.hooks.size()==3,"NX789J installs by native capabilities instead of the NX809J whitelist");
  ColorDisplayService s=new ColorDisplayService();ReduceBrightColorsTintController c=s.mReduceBrightColorsTintController;
  ExtraDimOwnershipClient.owned.add(0);s.context.resolver.settings.put("0:reduce_bright_colors_activated","1");s.context.resolver.settings.put("0:reduce_bright_colors_level","80");
  m.invoke(s,"applyTint",c,true);check(c.active&&c.strength==80,"provider request synchronizes both activation and native matrix strength");
  ExtraDimRuntime.Snapshot proof=ExtraDimRuntime.parse(dump(m,s));check(proof!=null&&proof.matches(0,true,80),"live native controller and transform slot are jointly verified");
  s.manager.setColorMatrix(250,TintController.identity());check(!ExtraDimRuntime.parse(dump(m,s)).transform,"matching controller without an applied color matrix cannot prove output");
  ExtraDimOwnershipClient.owned.remove(0);c.active=false;c.strength=27;m.invoke(s,"applyTint",c,true);check(!c.active&&c.strength==27,"unowned native activation and strength preserved");
  TintController night=new TintController();night.active=true;m.invoke(s,"applyTint",night,true);check(night.active&&night.getLevel()==100,"another tint controller is untouched");
  ExtraDimOwnershipClient.owned.add(0);c.available=false;m.invoke(s,"applyTint",c,true);check(!c.active&&c.strength==27&&!ExtraDimRuntime.parse(dump(m,s)).available,"unsupported native acceleration is not invented");
  c.available=true;s.mCurrentUser=10;ExtraDimOwnershipClient.owned.add(10);s.context.resolver.settings.put("10:reduce_bright_colors_activated","0");s.context.resolver.settings.put("10:reduce_bright_colors_level","20");m.invoke(s,"applyTint",c,true);check(!c.active&&c.strength==20&&s.context.resolver.lastUser==10,"native current-user provider values win over app user 0");
  check(!ExtraDimRuntime.parse(dump(m,s)).matches(0,false,20),"user 10 output cannot acknowledge a user 0 request");
  s.context.resolver.settings.put("10:reduce_bright_colors_level","101");m.invoke(s,"applyTint",c,true);check(c.strength==20,"invalid provider strength cannot alter native pipeline");
  s.context.resolver.settings.put("10:reduce_bright_colors_level","35");s.context.resolver.settings.put("10:reduce_bright_colors_activated","1");m.invoke(s,"setUp");
  // Reflection invokes the native method through ART hooks on-device; this plain
  // JVM fixture explicitly enters the registered apply interceptor afterwards.
  m.invoke(s,"applyTint",c,true);check(ExtraDimRuntime.parse(dump(m,s)).matches(10,true,35),"native user/resources setup resumes the owned strength");
  s.context.resolver.settings.put("10:reduce_bright_colors_activated","0");m.invoke(s,"applyTint",c,true);check(ExtraDimRuntime.parse(dump(m,s)).matches(10,false,35),"disable restores the identity while retaining native strength");
  ExtraDimOwnershipClient.owned.remove(10);s.context.resolver.settings.put("10:reduce_bright_colors_level","24");s.context.resolver.settings.put("10:reduce_bright_colors_activated","0");c.strength=80;c.active=true;ExtraDimOwnershipClient.send(false);
  check(c.strength==24&&!c.active&&ExtraDimRuntime.parse(dump(m,s)).matches(10,false,24),"ownership removal reloads restored native state instead of retaining a cached tint");
  s.context.resolver.settings.remove("10:reduce_bright_colors_level");s.context.resolver.settings.remove("10:reduce_bright_colors_activated");c.strength=80;c.active=true;ExtraDimOwnershipClient.send(false);
  check(c.strength==44&&!c.active,"absent native baseline uses the native ROM default instead of a module guess");
  check(m.errors==0,"all native callback paths complete");System.out.println("PASS ExtraDimHook: "+checks+" capability/user/matrix checks (no hardware evidence)");
 }
}''',
'ls/augment/com/TestExtraDimControl.java':r'''package ls.augment.com;
public class TestExtraDimControl{
 static int checks;static void check(boolean yes,String label){checks++;if(!yes)throw new AssertionError(label);}
 static String proof(int user,boolean available,boolean on,int strength,boolean matrix){return ExtraDimRuntime.PREFIX+"user="+user+";available="+(available?1:0)+";active="+(on?1:0)+";strength="+strength+";transform="+(matrix?1:0);}
 public static void main(String[] args){
  android.content.Context ctx=new android.content.Context();String off=proof(0,true,false,50,true),on=proof(0,true,true,80,true);
  RootShell.responses(off,on);check(ExtraDimControl.set(ctx,true,80),"success requires matching current-user controller and actual matrix");check(ExtraDimControl.active(ctx)&&ExtraDimControl.strength(ctx)==80,"UI reflects native output");
  String animating=proof(0,true,true,80,false);RootShell.responses(off,animating,animating,animating,animating,animating,animating,animating,animating,on);long started=System.nanoTime();check(ExtraDimControl.set(ctx,true,80),"a normal 2.6s native tint animation can finish before verification succeeds");long waited=(System.nanoTime()-started)/1000000;check(waited>=2500&&waited<4500,"native animation wait stays inside one bounded verification window");
  RootShell.responses(off,proof(0,true,true,80,false));started=System.nanoTime();check(!ExtraDimControl.set(ctx,true,80)&&!ExtraDimControl.message().isEmpty()&&!ExtraDimControl.verified(),"Settings/controller success without the transform slot fails visibly");check((System.nanoTime()-started)/1000000>=3900&&(System.nanoTime()-started)/1000000<4500,"uncompleted transform times out once, rather than accumulating per-probe timeouts");
  RootShell.responses(off,proof(0,true,true,50,true));check(!ExtraDimControl.set(ctx,true,80),"stale native strength is not acknowledged");
  int before=ModuleSystemSettings.writes;RootShell.responses(proof(10,true,true,80,true));check(!ExtraDimControl.set(ctx,true,80)&&ModuleSystemSettings.writes==before&&!ExtraDimControl.active(ctx),"background user cannot write or reuse another user's cached active state");
  RootShell.responses(proof(0,true,false,50,true),proof(0,true,false,80,true));check(ExtraDimControl.set(ctx,false,80)&&ExtraDimControl.strength(ctx)==80,"disable waits for the requested strength rather than accepting stale native defaults");
  RootShell.responses(off,proof(10,true,true,80,true));check(!ExtraDimControl.set(ctx,true,80)&&!ExtraDimControl.active(ctx)&&!ExtraDimControl.ready(),"a foreground-user switch during application cannot retain the previous user's active cache");
  RootShell.responses("Reduce bright colors:\n    Activated: true\n    mStrength = 80");check(!ExtraDimControl.read(ctx)&&!ExtraDimControl.ready(),"native textual activation alone is insufficient when matrix readback is missing");
  check(!ExtraDimControl.active(ctx)&&ExtraDimControl.selected(ctx),"saved request remains accessible only for removal without claiming activation");before=ModuleSystemSettings.writes;check(!ExtraDimControl.set(ctx,false,80)&&ModuleSystemSettings.writes==before+1,"disabling remains writable when output verification is unavailable");
  RootShell.responses(proof(0,false,false,80,false));before=ModuleSystemSettings.writes;check(!ExtraDimControl.set(ctx,true,80)&&ModuleSystemSettings.writes==before,"unsupported acceleration blocks enabling before any Settings write");
  RootShell.responses(off,on);ModuleSystemSettings.success=false;check(!ExtraDimControl.set(ctx,true,80)&&ExtraDimControl.message().equals("恢复记录写入失败"),"durable recovery failure reaches the caller");ModuleSystemSettings.success=true;
  RootShell.responses(off);RootShell.exit=1;check(!ExtraDimControl.read(ctx)&&!ExtraDimControl.ready(),"Root/permission failure does not expose a ready tile");
  check(ExtraDimRuntime.parse(on+"\n"+on)==null&&ExtraDimRuntime.parse(on+";unexpected=1")==null,"duplicate or malformed proof fails closed");
  check(ExtraDimRuntime.parse(proof(-10000,true,true,80,true))==null&&ExtraDimRuntime.parse(proof(0,true,true,101,true))==null,"invalid user and native strength rejected");
  float[] identity=new float[16];for(int i=0;i<16;i+=5)identity[i]=1;
  check(!ExtraDimRuntime.sameTransform(true,80,identity,identity),"identity cannot acknowledge a nonzero dim effect");check(ExtraDimRuntime.sameTransform(false,80,identity,null),"removed slot is valid disabled identity");
  float[] attenuation=identity.clone();attenuation[0]=attenuation[5]=attenuation[10]=.36f;check(ExtraDimRuntime.sameTransform(true,80,attenuation,attenuation),"matching RGB reduction accepted");attenuation[0]=Float.NaN;check(!ExtraDimRuntime.sameTransform(true,80,attenuation,attenuation),"nonfinite transform rejected");
  RootShell.settings="1\n50";RootShell.responses(proof(0,true,false,50,false));
  check(ExtraDimControl.read(ctx)&&!ExtraDimControl.active(ctx)&&ExtraDimControl.selected(ctx)&&!ExtraDimControl.verified(),"saved ON and native OFF remain distinct");
  RootShell.settings="unreadable";check(ExtraDimControl.read(ctx)&&ExtraDimControl.selected(ctx)&&!ExtraDimControl.verified(),"temporary settings read failure retains same-user cancellation target");RootShell.settings="1\n50";
  android.os.Bundle state=ExtraDimControl.call(ctx,"extra_dim_read",null);
  check(state.getBoolean("selected")&&!state.getBoolean("active")&&!state.getBoolean("verified"),"detail bridge offers cancellation without fabricated execution");
  RootShell.responses(proof(0,true,false,50,false),proof(0,true,false,50,true));
  check(ExtraDimControl.toggle(ctx)&&!ModuleSystemSettings.lastActive&&!ExtraDimControl.selected(ctx),"tile click cancels failed enable instead of submitting ON again");
  RootShell.responses(proof(0,true,false,50,true),proof(0,true,true,50,true));
  check(ExtraDimControl.toggle(ctx)&&ModuleSystemSettings.lastActive&&ExtraDimControl.active(ctx),"next tile click can enable after successful cancellation");
  RootShell.settings="1\n50";RootShell.responses(proof(10,true,false,50,false));before=ModuleSystemSettings.writes;
  check(!ExtraDimControl.toggle(ctx)&&ModuleSystemSettings.writes==before&&!ExtraDimControl.selected(ctx),"cancellation never leaks across users");
  System.out.println("PASS ExtraDimControl: "+checks+" readback/failure/disable checks (no device commands)");
 }
}''',
}
# Model the native callback contract, including its independent power listener.
files['android/content/res/Resources.java']='''package android.content.res;public class Resources{
public int getIdentifier(String n,String t,String p){return n.endsWith("Min")?1:n.endsWith("Max")?2:0;}
public static int minimum=25,maximum=65;public int getInteger(int id){return id==1?minimum:maximum;}}'''
files['android/content/Context.java']=files['android/content/Context.java'].replace('public final ContentResolver',
    'public android.content.res.Resources getResources(){return new android.content.res.Resources();}public final ContentResolver')
files['com/android/server/display/color/ColorDisplayService.java']='''package com.android.server.display.color;
public class ColorDisplayService extends com.android.server.SystemService{
 public android.database.ContentObserver mContentObserver=new android.database.ContentObserver(){public void onChange(boolean b){}};
 public int mCurrentUser;public final android.os.Handler mHandler=new android.os.Handler();
 public final ReduceBrightColorsTintController mReduceBrightColorsTintController=new ReduceBrightColorsTintController();
 public int applications,activationNotifications,strengthNotifications,powerStrength;public boolean powerActive;public RuntimeException callbackFailure;
 public void applyTint(TintController target,boolean immediate){applications++;manager.setColorMatrix(target.getLevel(),target.getMatrix());}
 private void dumpInternal(java.io.PrintWriter w){w.println("Native color service");}
 public void onReduceBrightColorsActivationChanged(boolean userInitiated){
  if(callbackFailure!=null)throw callbackFailure;
  mReduceBrightColorsTintController.active=android.provider.Settings.Secure.getIntForUser(context.resolver,"reduce_bright_colors_activated",0,mCurrentUser)==1;
  powerActive=mReduceBrightColorsTintController.active;activationNotifications++;
 }
 public void onReduceBrightColorsStrengthLevelChanged(){
  int v=android.provider.Settings.Secure.getIntForUser(context.resolver,"reduce_bright_colors_level",-1,mCurrentUser);
  int min=android.content.res.Resources.minimum,max=android.content.res.Resources.maximum;
  mReduceBrightColorsTintController.strength=v==-1?44:min+(int)((max-min)*Math.max(0,Math.min(100,v))/100f);
  powerStrength=mReduceBrightColorsTintController.strength;strengthNotifications++;
 }
 public boolean resetDuringSetup;
 public void setUp(){onReduceBrightColorsStrengthLevelChanged();onReduceBrightColorsActivationChanged(false);if(resetDuringSetup)mReduceBrightColorsTintController.active=false;}
 public static class TintHandler{public void handleMessage(android.os.Message m){}}
}'''
files['com/android/server/display/color/ReduceBrightColorsTintController.java']=files['com/android/server/display/color/ReduceBrightColorsTintController.java'].replace(
 'public int strength;', 'public void setActivated(Boolean b){super.setActivated(b);}public int strength;')
files['ls/augment/com/hook/TestExtraDimHook.java']=r'''package ls.augment.com.hook;
import com.android.server.display.color.*;import ls.augment.com.ExtraDimRuntime;import java.io.*;
public class TestExtraDimHook{
 static int checks;static void check(boolean yes,String label){checks++;if(!yes)throw new AssertionError(label);}
 static class MissingModule extends AugmentModule{void logFeatureError(String k,Throwable e){errors++;}}
 static String dump(AugmentModule m,ColorDisplayService s)throws Throwable{StringWriter text=new StringWriter();m.invoke(s,"dumpInternal",new PrintWriter(text));return text.toString();}
 static void settings(ColorDisplayService s,boolean active,int amount){s.context.resolver.settings.put(s.mCurrentUser+":reduce_bright_colors_activated",active?"1":"0");s.context.resolver.settings.put(s.mCurrentUser+":reduce_bright_colors_level",String.valueOf(amount));}
 static void nativeUpdate(AugmentModule m,ColorDisplayService s)throws Throwable{s.onReduceBrightColorsStrengthLevelChanged();s.onReduceBrightColorsActivationChanged(false);m.invoke(s,"applyTint",s.mReduceBrightColorsTintController,true);}
 public static void main(String[] args)throws Throwable{
  MissingModule missing=new MissingModule();ClassLoader incomplete=new ClassLoader(TestExtraDimHook.class.getClassLoader()){
   protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException{if(n.endsWith("DisplayTransformManager"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
  ExtraDimHook.install(missing,incomplete);check(missing.errors==1&&missing.hooks.isEmpty(),"missing required native matrix interface preserves original pipeline");
  AugmentModule m=new AugmentModule();ExtraDimHook.install(m,TestExtraDimHook.class.getClassLoader());
  check(m.hooks.size()==7,"NX789J installs by native capabilities instead of the NX809J whitelist");
  ColorDisplayService s=new ColorDisplayService();ReduceBrightColorsTintController c=s.mReduceBrightColorsTintController;
  ExtraDimOwnershipClient.owned.add(0);settings(s,true,80);nativeUpdate(m,s);
  check(c.active&&c.strength==57&&s.powerActive&&s.powerStrength==57,"native calibration updates controller and brightness listener together");
  check(ExtraDimRuntime.parse(dump(m,s)).matches(0,true,80),"mapped request requires live transform readback");
  s.manager.setColorMatrix(250,TintController.identity());check(!ExtraDimRuntime.parse(dump(m,s)).transform,"controller alone does not establish output");
  check(dump(m,s).contains("reason=matrix_mismatch"),"matrix failure has its own reason");
  int repairs=ExtraDimOwnershipClient.reconciles;
  c.active=false;check(!ExtraDimRuntime.parse(dump(m,s)).transform,"inactive identity matrix cannot acknowledge an owned enable request");
  check(dump(m,s).contains("reason=activation_mismatch")&&ExtraDimOwnershipClient.reconciles>repairs,"activation failure schedules fresh reconciliation without inventing proof");
  m.invoke(s,"onReduceBrightColorsActivationChanged",false);
  check(c.active&&FeatureRuntimeLog.events.stream().anyMatch(v->v.startsWith("EXTRA_DIM_NATIVE_CALLBACK:")),"native activation callback observed without changing boolean semantics");
  m.invoke(c,"setActivated",false);
  check(!c.active&&FeatureRuntimeLog.events.stream().anyMatch(v->v.startsWith("EXTRA_DIM_ACTIVATION_WRITE:")),"native activation writer captured and original result retained");
  s.callbackFailure=new IllegalStateException("native failure");Throwable propagated=null;
  try{m.invoke(s,"onReduceBrightColorsActivationChanged",false);}catch(java.lang.reflect.InvocationTargetException failure){propagated=failure.getCause();}
  check(propagated==s.callbackFailure,"diagnostics preserve original native callback exception identity");s.callbackFailure=null;
  s.resetDuringSetup=true;m.invoke(s,"setUp");ExtraDimOwnershipClient.send(true);check(ExtraDimRuntime.parse(dump(m,s)).matches(0,true,80),"setup repairs a reset controller through native callbacks");s.resetDuringSetup=false;
  check(FeatureRuntimeLog.events.stream().anyMatch(v->v.startsWith("EXTRA_DIM_NATIVE_OBSERVER:")&&v.contains("callers=1")),"actual anonymous OEM observer resolved without a numbered class assumption");
  // Native Settings callbacks can overtake the private provider refresh.
  ExtraDimOwnershipClient.stale=new ExtraDimOwnershipClient.State(true,true,80);settings(s,false,100);nativeUpdate(m,s);
  check(!c.active&&!s.powerActive&&c.strength==65&&s.powerStrength==65,"stale ON cache cannot re-enable a native OFF or alter its brightness curve");
  ExtraDimOwnershipClient.stale=new ExtraDimOwnershipClient.State(true,false,100);settings(s,true,20);nativeUpdate(m,s);
  check(c.active&&s.powerActive&&c.strength==33&&s.powerStrength==33,"stale OFF/strength cache cannot override newer native ON/strength");
  ExtraDimOwnershipClient.stale=null;
  settings(s,false,100);dump(m,s);int notifications=s.activationNotifications;
  ExtraDimOwnershipClient.send(true);
  check(!c.active&&!s.powerActive&&c.strength==65&&s.powerStrength==65&&s.activationNotifications==notifications+1,"owned refresh invokes native power notification before matrix");
  check(ExtraDimRuntime.parse(dump(m,s)).matches(0,false,100),"off matrix and power state agree");
  ExtraDimOwnershipClient.owned.remove(0);settings(s,false,25);ExtraDimOwnershipClient.send(false);
  check(!c.active&&!s.powerActive&&c.strength==35&&s.powerStrength==35,"release also uses native calibrated callbacks");
  s.context.resolver.settings.clear();ExtraDimOwnershipClient.send(false);check(c.strength==44,"absent baseline retains native default");
  c.strength=27;c.active=false;m.invoke(s,"applyTint",c,true);check(c.strength==27&&!c.active,"unowned apply is unchanged");
  TintController night=new TintController();night.active=true;m.invoke(s,"applyTint",night,true);check(night.active&&night.getLevel()==100,"other tint unaffected");
  ExtraDimOwnershipClient.owned.add(0);settings(s,true,80);c.available=false;m.invoke(s,"applyTint",c,true);
  check(!c.active&&c.strength==27&&!ExtraDimRuntime.parse(dump(m,s)).available,"missing native availability cannot invent a pipeline");c.available=true;
  s.mCurrentUser=10;ExtraDimOwnershipClient.owned.add(10);settings(s,true,35);nativeUpdate(m,s);
  check(ExtraDimRuntime.parse(dump(m,s)).matches(10,true,35)&&!ExtraDimRuntime.parse(dump(m,s)).matches(0,true,35),"foreground-user isolation");
  dump(m,s);s.mCurrentUser=0;notifications=s.activationNotifications;ExtraDimOwnershipClient.send(true);
  check(s.activationNotifications==notifications,"stale user callback cannot mutate current user");
  for(int[] range:new int[][]{{0,100},{25,65},{10,90}}){android.content.res.Resources.minimum=range[0];android.content.res.Resources.maximum=range[1];
   settings(s,true,80);nativeUpdate(m,s);check(c.strength==(int)(range[0]+(range[1]-range[0])*.8f),"ROM-provided native range");
   check(ExtraDimRuntime.parse(dump(m,s)).matches(0,true,80),"calibrated range and transform verification retained");}
  settings(s,false,100);m.invoke(s,"setUp");m.invoke(s,"applyTint",c,true);
  check(!c.active&&!s.powerActive&&ExtraDimRuntime.parse(dump(m,s)).matches(0,false,100),"native setup does not reapply stale controller state");
  c.strength=100;check(!ExtraDimRuntime.parse(dump(m,s)).transform,"uncalibrated strength still rejected");
  android.content.res.Resources.minimum=25;android.content.res.Resources.maximum=65;
  settings(s,true,50);android.provider.Settings.Secure.stale.put("0:reduce_bright_colors_activated",0);
  android.provider.Settings.Secure.stale.put("0:reduce_bright_colors_level",100);
  dump(m,s);ExtraDimOwnershipClient.send(true);
  check(c.active&&c.strength==45&&s.powerActive&&s.powerStrength==45,"fresh provider values correct both native callbacks despite divergent Secure cache");
  check(ExtraDimRuntime.parse(dump(m,s)).matches(0,true,50),"fixed activation still requires applied RGB matrix readback");
  check(android.provider.Settings.Secure.getIntForUser(s.context.resolver,"reduce_bright_colors_activated",0,0)==0,"native Secure read outside sync retains original cache value");
  int external=ExtraDimOwnershipClient.invalidations;m.invoke(s,"onReduceBrightColorsActivationChanged",true);
  check(!c.active&&!s.powerActive&&ExtraDimOwnershipClient.invalidations>external,"external native callback runs unchanged and invalidates pending delivery");
  ExtraDimOwnershipClient.send(true);check(c.active&&s.powerActive,"fresh followup repairs divergence through original listener");
  settings(s,false,20);android.provider.Settings.Secure.stale.put("0:reduce_bright_colors_activated",1);
  ExtraDimOwnershipClient.send(true);
  check(!c.active&&!s.powerActive&&c.strength==33&&s.powerStrength==33&&ExtraDimRuntime.parse(dump(m,s)).matches(0,false,20),"reverse divergence disables and restores identity with native power notification");
  settings(s,false,35);ExtraDimOwnershipClient.owned.remove(0);ExtraDimOwnershipClient.send(false);
  check(!c.active&&!s.powerActive&&c.strength==39&&s.powerStrength==39,"release uses restored provider baseline despite stale native values");
  s.context.resolver.settings.clear();ExtraDimOwnershipClient.send(false);
  check(!c.active&&c.strength==44&&s.powerStrength==44,"absent restored baseline uses original ROM default");
  android.provider.Settings.Secure.stale.clear();ExtraDimOwnershipClient.owned.add(0);settings(s,true,50);dump(m,s);
  ExtraDimOwnershipClient.Delivery superseded=new ExtraDimOwnershipClient.Delivery(new ExtraDimOwnershipClient.State(true,true,50));superseded.valid=false;
  notifications=s.activationNotifications;ExtraDimOwnershipClient.callback.accept(superseded);
  check(s.activationNotifications==notifications,"superseded queued delivery cannot write controller or notify power");
  ColorDisplayService child=new ColorDisplayService(){};ExtraDimOwnershipClient.owned.add(0);settings(child,true,80);dump(m,child);ExtraDimOwnershipClient.send(true);
  check(child.mReduceBrightColorsTintController.active&&child.powerActive&&ExtraDimRuntime.parse(dump(m,child)).matches(0,true,80),"inherited service members retain capability-based behavior");
  check(m.errors==0,"native callback paths complete");System.out.println("PASS ExtraDimHook: "+checks+" native callback/race/readback checks (no hardware evidence)");
 }
}'''
files['ls/augment/com/hook/TestExtraDimFallback.java']=r"""package ls.augment.com.hook;
import com.android.server.display.color.*;import ls.augment.com.ExtraDimRuntime;import java.io.*;
public final class TestExtraDimFallback{
 static void check(boolean b){if(!b)throw new AssertionError("missing scoped getter fallback");}
 static String dump(AugmentModule m,ColorDisplayService s)throws Throwable{StringWriter w=new StringWriter();m.invoke(s,"dumpInternal",new PrintWriter(w));return w.toString();}
 public static void main(String[] args)throws Throwable{
  AugmentModule m=new AugmentModule();ClassLoader loader=new ClassLoader(TestExtraDimFallback.class.getClassLoader()){
   protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException{if(n.equals("android.provider.Settings$Secure"))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};
  ExtraDimHook.install(m,loader);check(m.hooks.size()==6);
  ColorDisplayService s=new ColorDisplayService();s.context.resolver.settings.put("0:reduce_bright_colors_activated","1");s.context.resolver.settings.put("0:reduce_bright_colors_level","50");ExtraDimOwnershipClient.owned.add(0);
  dump(m,s);ExtraDimOwnershipClient.send(true);check(s.powerActive&&ExtraDimRuntime.parse(dump(m,s)).matches(0,true,50));
  android.provider.Settings.Secure.stale.put("0:reduce_bright_colors_activated",0);ExtraDimOwnershipClient.send(true);
  check(!s.powerActive&&!ExtraDimRuntime.parse(dump(m,s)).transform&&dump(m,s).contains("activation_mismatch"));
  System.out.println("PASS ExtraDim fallback: 3 missing-getter/native-path/readback checks");
 }
}"""
with tempfile.TemporaryDirectory(prefix='duo-extra-dim-') as folder:
    work=Path(folder);sources=[]
    for name,source in files.items():
        file=work/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(source,encoding='utf-8');sources.append(file)
    sources += [SRC/name for name in ('ExtraDimRuntime.java','ExtraDimControl.java','hook/ExtraDimHook.java','hook/ExtraDimNativeRequest.java')]
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*map(str,sources)],check=True)
    for name in ('ls.augment.com.hook.TestExtraDimHook','ls.augment.com.TestExtraDimControl','ls.augment.com.hook.TestExtraDimFallback'):
        subprocess.run([str(JDK/'java.exe'),'-cp',folder,name],check=True,timeout=45)
    original=(SRC/'hook/ExtraDimHook.java').read_text(encoding='utf-8')
    mutant=work/'mutant/ls/augment/com/hook/ExtraDimHook.java';mutant.parent.mkdir(parents=True)
    mutant.write_text(original.replace('if (installed) return;','if (installed || !"NX809J".equals(Build.MODEL)) return;'),encoding='utf-8')
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-cp',folder,'-d',folder,str(mutant)],check=True)
    rejected=subprocess.run([str(JDK/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestExtraDimHook'],capture_output=True,text=True,timeout=20)
    assert rejected.returncode!=0 and any(label in rejected.stderr for label in ('NX789J installs by native capabilities',
            'missing required native matrix interface preserves original pipeline')),rejected.stdout+rejected.stderr
    print('PASS NX809J-only regression mutant rejected on NX789J fixture')
