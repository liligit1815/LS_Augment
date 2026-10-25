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
 'ls/augment/com/hook/ExtraDimOwnershipClient.java':'''package ls.augment.com.hook;final class ExtraDimOwnershipClient{static final java.util.Set<Integer> owned=new java.util.HashSet<>();static java.util.function.Consumer<Boolean> callback;static final class State{final boolean owned,active;final int strength;State(boolean o,boolean a,int s){owned=o;active=a;strength=s;}}static State peek(android.content.Context c,int u,android.os.Handler h,java.util.function.Consumer<Boolean> r){callback=r;c.resolver.lastUser=u;String a=c.resolver.settings.get(u+":reduce_bright_colors_activated"),s=c.resolver.settings.get(u+":reduce_bright_colors_level");int v=s!=null&&s.matches("[0-9]{1,3}")?Integer.parseInt(s):-1;return new State(owned.contains(u)&&v>=0&&v<=100,"1".equals(a),Math.max(0,v));}}''',
'ls/augment/com/hook/FeatureSettings.java':'package ls.augment.com.hook;final class FeatureSettings{static void diagnostic(android.content.Context c,String k,String v){}}',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;public class AugmentModule{public int errors;interface Interceptor{Object run(Chain chain)throws Throwable;}interface Chain{Object getArg(int i);Object getThisObject();Object proceed()throws Throwable;}static class Builder{final java.lang.reflect.Method method;Interceptor callback;Builder(java.lang.reflect.Method m){method=m;}Builder intercept(Interceptor c){callback=c;return this;}}final java.util.Map<java.lang.reflect.Method,Interceptor> hooks=new java.util.HashMap<>();Builder prepareFeatureHook(java.lang.reflect.Method m,String k,boolean o){return new Builder(m);}void registerFeatureHook(Builder b){hooks.put(b.method,b.callback);}void deoptimize(java.lang.reflect.Method m){}void logFeatureError(String k,Throwable e){errors++;throw new AssertionError(k,e);}void logFeatureInfo(String text){}public Object invoke(Object target,String name,Object...args)throws Throwable{java.lang.reflect.Method method=null;for(java.lang.reflect.Method m:target.getClass().getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length){method=m;break;}if(method==null)throw new NoSuchMethodException(name);method.setAccessible(true);final java.lang.reflect.Method chosen=method;Chain chain=new Chain(){public Object getArg(int i){return args[i];}public Object getThisObject(){return target;}public Object proceed()throws Throwable{return chosen.invoke(target,args);}};Interceptor hook=hooks.get(chosen);return hook==null?chain.proceed():hook.run(chain);}}''',
'ls/augment/com/RootShell.java':'''package ls.augment.com;final class RootShell{static final java.util.Queue<String> dumps=new java.util.ArrayDeque<>();static String last="",settings="1\\n80";static int exit;static void responses(String...values){dumps.clear();exit=0;for(String v:values)dumps.add(v);last=values.length==0?"":values[values.length-1];}static Result run(String command,String input,long timeout,int limit){if(command.equals("dumpsys color_display"))return new Result(exit,dumps.isEmpty()?last:dumps.remove());if(command.startsWith("settings --user "))return new Result(exit,settings);throw new AssertionError(command);}static class Result{final int code;final String output;Result(int c,String s){code=c;output=s;}boolean isSuccess(){return code==0;}}}''',
'ls/augment/com/ModuleSystemSettings.java':'''package ls.augment.com;final class ModuleSystemSettings{static int writes;static boolean success=true;static WriteResult setExtraDim(android.content.Context c,boolean on,int strength){writes++;return new WriteResult(success,success?"已应用":"恢复记录写入失败");}static class WriteResult{final boolean success;final String message;WriteResult(boolean ok,String text){success=ok;message=text;}}}''',
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
  ExtraDimOwnershipClient.owned.remove(10);s.context.resolver.settings.put("10:reduce_bright_colors_level","24");s.context.resolver.settings.put("10:reduce_bright_colors_activated","0");c.strength=80;c.active=true;ExtraDimOwnershipClient.callback.accept(false);
  check(c.strength==24&&!c.active&&ExtraDimRuntime.parse(dump(m,s)).matches(10,false,24),"ownership removal reloads restored native state instead of retaining a cached tint");
  s.context.resolver.settings.remove("10:reduce_bright_colors_level");s.context.resolver.settings.remove("10:reduce_bright_colors_activated");c.strength=80;c.active=true;ExtraDimOwnershipClient.callback.accept(false);
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
  check(ExtraDimControl.active(ctx),"saved request remains accessible only for removal");before=ModuleSystemSettings.writes;check(!ExtraDimControl.set(ctx,false,80)&&ModuleSystemSettings.writes==before+1,"disabling remains writable when output verification is unavailable");
  RootShell.responses(proof(0,false,false,80,false));before=ModuleSystemSettings.writes;check(!ExtraDimControl.set(ctx,true,80)&&ModuleSystemSettings.writes==before,"unsupported acceleration blocks enabling before any Settings write");
  RootShell.responses(off,on);ModuleSystemSettings.success=false;check(!ExtraDimControl.set(ctx,true,80)&&ExtraDimControl.message().equals("恢复记录写入失败"),"durable recovery failure reaches the caller");ModuleSystemSettings.success=true;
  RootShell.responses(off);RootShell.exit=1;check(!ExtraDimControl.read(ctx)&&!ExtraDimControl.ready(),"Root/permission failure does not expose a ready tile");
  check(ExtraDimRuntime.parse(on+"\n"+on)==null&&ExtraDimRuntime.parse(on+";unexpected=1")==null,"duplicate or malformed proof fails closed");
  check(ExtraDimRuntime.parse(proof(-10000,true,true,80,true))==null&&ExtraDimRuntime.parse(proof(0,true,true,101,true))==null,"invalid user and native strength rejected");
  float[] identity=new float[16];for(int i=0;i<16;i+=5)identity[i]=1;
  check(!ExtraDimRuntime.sameTransform(true,80,identity,identity),"identity cannot acknowledge a nonzero dim effect");check(ExtraDimRuntime.sameTransform(false,80,identity,null),"removed slot is valid disabled identity");
  float[] attenuation=identity.clone();attenuation[0]=attenuation[5]=attenuation[10]=.36f;check(ExtraDimRuntime.sameTransform(true,80,attenuation,attenuation),"matching RGB reduction accepted");attenuation[0]=Float.NaN;check(!ExtraDimRuntime.sameTransform(true,80,attenuation,attenuation),"nonfinite transform rejected");
  System.out.println("PASS ExtraDimControl: "+checks+" readback/failure/disable checks (no device commands)");
 }
}''',
}
# The supplied NX789J service maps the UI percentage to 25..65 before setMatrix.
# Exercise a real internal-level controller rather than an identity-mapping facade.
files['android/content/res/Resources.java']='''package android.content.res;public class Resources{
public int getIdentifier(String n,String t,String p){return n.endsWith("Min")?1:n.endsWith("Max")?2:0;}
public static int minimum=25,maximum=65;public int getInteger(int id){return id==1?minimum:maximum;}}'''
files['android/content/Context.java']=files['android/content/Context.java'].replace('public final ContentResolver',
    'public android.content.res.Resources getResources(){return new android.content.res.Resources();}public final ContentResolver')
files['ls/augment/com/hook/TestExtraDimHook.java']=files['ls/augment/com/hook/TestExtraDimHook.java'].replace('c.strength==80','c.strength==57').replace('c.strength==20','c.strength==33')
files['ls/augment/com/hook/TestExtraDimHook.java']=files['ls/augment/com/hook/TestExtraDimHook.java'].replace(
    'ExtraDimRuntime.Snapshot proof=',
    '''check(c.strength==57,"UI 80 maps to native 57 on NX789J");
  s.context.resolver.settings.put("0:reduce_bright_colors_level","100");m.invoke(s,"applyTint",c,true);
  check(c.strength==65&&ExtraDimRuntime.parse(dump(m,s)).strength==100,"100 percent never bypasses native 65 maximum, readback retains requested percentage");
  c.strength=100;check(!ExtraDimRuntime.parse(dump(m,s)).transform,"raw 100 cannot be falsely acknowledged as calibrated 100 percent");
  s.context.resolver.settings.put("0:reduce_bright_colors_level","80");m.invoke(s,"applyTint",c,true);
  ExtraDimRuntime.Snapshot proof=''')
files['ls/augment/com/hook/TestExtraDimHook.java']=files['ls/augment/com/hook/TestExtraDimHook.java'].replace(
    'System.out.println("PASS ExtraDimHook:',
    '''s.mCurrentUser=0;ExtraDimOwnershipClient.owned.add(0);s.context.resolver.settings.put("0:reduce_bright_colors_level","80");s.context.resolver.settings.put("0:reduce_bright_colors_activated","1");
  for(int[] range:new int[][]{{0,100},{25,65},{10,90}}){android.content.res.Resources.minimum=range[0];android.content.res.Resources.maximum=range[1];m.invoke(s,"applyTint",c,true);
   check(c.strength==(int)(range[0]+(range[1]-range[0])*.8f),"each ROM supplies its own native dim calibration");
   check(ExtraDimRuntime.parse(dump(m,s)).matches(0,true,80),"percentage readback stays consistent across native ranges");}
  System.out.println("PASS ExtraDimHook:''')
with tempfile.TemporaryDirectory(prefix='duo-extra-dim-') as folder:
    work=Path(folder);sources=[]
    for name,source in files.items():
        file=work/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(source,encoding='utf-8');sources.append(file)
    sources += [SRC/name for name in ('ExtraDimRuntime.java','ExtraDimControl.java','hook/ExtraDimHook.java')]
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*map(str,sources)],check=True)
    for name in ('ls.augment.com.hook.TestExtraDimHook','ls.augment.com.TestExtraDimControl'):
        subprocess.run([str(JDK/'java.exe'),'-cp',folder,name],check=True,timeout=45)
    original=(SRC/'hook/ExtraDimHook.java').read_text(encoding='utf-8')
    mutant=work/'mutant/ls/augment/com/hook/ExtraDimHook.java';mutant.parent.mkdir(parents=True)
    mutant.write_text(original.replace('if (installed) return;','if (installed || !"NX809J".equals(Build.MODEL)) return;'),encoding='utf-8')
    subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-cp',folder,'-d',folder,str(mutant)],check=True)
    rejected=subprocess.run([str(JDK/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestExtraDimHook'],capture_output=True,text=True,timeout=20)
    assert rejected.returncode!=0 and 'NX789J installs by native capabilities' in rejected.stderr,rejected.stdout+rejected.stderr
    print('PASS NX809J-only regression mutant rejected on NX789J fixture')
