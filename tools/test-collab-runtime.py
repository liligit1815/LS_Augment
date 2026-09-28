"""Execute production collaboration hooks and OemHooks with Android/OEM host doubles."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java/ls/augment/com"

files = {
    "android/content/Context.java": """package android.content;
public class Context {public android.content.res.Resources getResources(){return new android.content.res.Resources();}public ClassLoader getClassLoader(){return getClass().getClassLoader();}public String getPackageName(){return "com.zte.beautify";}}
""",
    "android/os/Build.java": "package android.os;public class Build{public static String DEVICE=\"NX809J\",MODEL=\"NX809J\";}",
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public int getIdentifier(String n,String t,String p){return 99;}public String getString(int id){return \"native\";}public CharSequence getText(int id){return \"native\";}}",
    "android/graphics/Bitmap.java": "package android.graphics;public class Bitmap {}",
    "android/graphics/BitmapFactory.java": """package android.graphics;
public class BitmapFactory {public static class Options {public boolean inJustDecodeBounds;public int outWidth,outHeight;}
 public static Bitmap decodeFile(String path,Options o){return null;}}
""",
    "android/os/Looper.java": """package android.os;public class Looper {
 private static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}}
""",
    "android/os/Handler.java": """package android.os;public class Handler {
 public static final java.util.List<Runnable> pending=new java.util.ArrayList<>();public Handler(Looper l){}public boolean postDelayed(Runnable r,long delay){pending.add(r);return true;}public static void runPending(){var copy=new java.util.ArrayList<>(pending);pending.clear();for(Runnable r:copy)r.run();}}
""",
    "org/json/JSONObject.java": """package org.json;public class JSONObject {
 public JSONObject(java.util.Map<?,?> values){}public String toString(){return "{}";}}
""",
    "io/github/libxposed/api/XposedInterface.java": """package io.github.libxposed.api;import java.util.List;
public interface XposedInterface {interface HookHandle {void unhook();}interface Hooker {Object intercept(Chain c)throws Throwable;}
 interface Chain {Object getThisObject();Object getArg(int index);List<Object> getArgs();Object proceed()throws Throwable;Object proceed(Object[] args)throws Throwable;}}
""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
public class AugmentModule {public static AugmentModule active;public static final ThreadLocal<Object[]> currentArgs=new ThreadLocal<>();public final Map<Method,Hooker> hooks=new HashMap<>();
 public boolean deoptimize(java.lang.reflect.Executable method){return true;}
 public final List<String> errors=new ArrayList<>(),logs=new ArrayList<>();public interface Original {Object run()throws Throwable;}
 static class Call implements Chain {final Object owner;final Object[] args;final Original original;
  Call(Object o,Object[] a,Original n){owner=o;args=a;original=n;}public Object getThisObject(){return owner;}
  public Object getArg(int i){return args[i];}public List<Object> getArgs(){return Arrays.asList(args);}public Object proceed(Object[] replacement)throws Throwable{return new Call(owner,replacement,original).proceed();}public Object proceed()throws Throwable{Object[] prior=currentArgs.get();currentArgs.set(args);try{return original.run();}finally{currentArgs.set(prior);}}}
 class Builder {final Method method;Builder(Method m){method=m;}HookHandle intercept(Hooker h){hooks.put(method,h);return ()->hooks.remove(method);}}
 Builder prepareFeatureHook(Method m,String key,boolean before){return new Builder(m);}void registerFeatureHook(HookHandle h){}
 void logFeatureError(String key,Throwable error){errors.add(key+":"+error);}void logFeatureInfo(String message){logs.add(message);}
 public static Object dispatch(Class<?> type,String name,Class<?>[] types,Object[] args,Original original){
  try{Method m=type.getDeclaredMethod(name,types);Hooker h=active==null?null:active.hooks.get(m);
   return h==null?original.run():h.intercept(new Call(null,args,original));
  }catch(RuntimeException|Error e){throw e;}catch(Throwable t){throw new RuntimeException(t);}}
}
""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import java.util.*;import android.content.Context;
class FeatureSettings {static Context current=new Context();static final Map<String,String> values=new HashMap<>(),diagnostics=new HashMap<>();
 static final Map<String,Integer> writes=new HashMap<>();
 static boolean enabled(Context c,String key){return "1".equals(values.get(key));}
 static int integer(Context c,String key,int fallback,int min,int max){return Math.max(min,Math.min(max,Integer.parseInt(values.getOrDefault(key,""+fallback))));}
 static void diagnostic(Context c,String key,String value){diagnostics.put(key,value);writes.merge(key,1,Integer::sum);}
 static Context from(Object o){return current;}static void set(String key,boolean value){values.put(key,value?"1":"0");}
}
""",
    "com/zte/beautify/view/common/tools/Utilities.java": """package com.zte.beautify.view.common.tools;
import ls.augment.com.hook.AugmentModule;
public class Utilities {public static int featureCalls,propertyCalls;public static boolean failNative;
 public static String getThemeResourceFeature(){return (String)AugmentModule.dispatch(Utilities.class,"getThemeResourceFeature",new Class[]{},new Object[]{},()->{
  featureCalls++;if(failNative)throw new IllegalStateException("native feature failure");return "original_feature";});}
 public static String getThemeResourceFeature(int other){return (String)AugmentModule.dispatch(Utilities.class,"getThemeResourceFeature",new Class[]{int.class},new Object[]{other},()->"other_overload");}
 public static String getStringSystemProperties(String key){return (String)AugmentModule.dispatch(Utilities.class,"getStringSystemProperties",new Class[]{String.class},new Object[]{key},()->{
  propertyCalls++;return "original:"+key;});}
 public static String getStringSystemProperties(String key,String fallback){return (String)AugmentModule.dispatch(Utilities.class,"getStringSystemProperties",new Class[]{String.class,String.class},new Object[]{key,fallback},()->fallback);}
}
""",
    "com/zte/fingerprint/theme/FingerprintAnimProcess.java": """package com.zte.fingerprint.theme;
import android.content.Context;import java.util.ArrayList;import ls.augment.com.hook.AugmentModule;
public class FingerprintAnimProcess {public static final ArrayList<Object> original=new ArrayList<>();
 static {original.add(new Object());}public static boolean nativeChun;
 private static boolean gate(String name,boolean nativeResult){return (Boolean)AugmentModule.dispatch(FingerprintAnimProcess.class,name,new Class[]{},new Object[]{},()->nativeResult);}
 public static boolean isCustomizeForCN_IP_PB(){return gate("isCustomizeForCN_IP_PB",false);}
 public static boolean isCustomizeForGENPBUS(){return gate("isCustomizeForGENPBUS",false);}
 public static boolean isCustomizeForGENPBEU(){return gate("isCustomizeForGENPBEU",false);}
 public static boolean isCustomizeForWutheringWaves(){return gate("isCustomizeForWutheringWaves",nativeChun);}
 public static boolean isCustomizeForFighting(){return gate("isCustomizeForFighting",false);}
 public static boolean isCustomizeForWutheringWaves809J(){return gate("isCustomizeForWutheringWaves809J",false);}
 public static ArrayList<?> getAllFpAnim(Context c){return (ArrayList<?>)AugmentModule.dispatch(FingerprintAnimProcess.class,"getAllFpAnim",new Class[]{Context.class},new Object[]{c},()->original);}
}
""",
    "com/zte/fingerprint/theme/normal/Chisa.java": """package com.zte.fingerprint.theme.normal;
public class Chisa {public static int creates;public static boolean missing;
 public Chisa create(android.content.Context context){creates++;return missing?null:this;}}
""",
    "ls/augment/com/hook/TestCollabRuntime.java": """package ls.augment.com.hook;
import android.content.Context;import java.lang.reflect.*;import java.util.*;import ls.augment.com.*;
import com.zte.beautify.view.common.tools.Utilities;
import com.zte.fingerprint.theme.FingerprintAnimProcess;import com.zte.fingerprint.theme.normal.Chisa;
public class TestCollabRuntime {
 static int checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}
 static final String PROPERTY="persist.vendor.custom.variant.id",THEME_DIAG="ls_augment_collab_theme_runtime",FP_DIAG="ls_augment_collab_fingerprint_list_runtime";
 public static void main(String[] args)throws Exception {
  AugmentModule m=new AugmentModule();AugmentModule.active=m;ClassLoader loader=TestCollabRuntime.class.getClassLoader();
  check(CollabUnlockHook.install(m,loader,"example.other")==0&&m.hooks.isEmpty(),"unrelated package installs nothing");
  ClassLoader missing=new ClassLoader(loader){protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException {
   if(name.equals("com.zte.beautify.view.common.tools.Utilities"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
  check(CollabUnlockHook.install(m,missing,"com.zte.beautify")==0&&m.hooks.isEmpty(),"missing OEM API does not install guessed adapter");m.errors.clear();
  check(CollabUnlockHook.install(m,loader,"com.zte.beautify")==2,"two verified Utilities adapters installed");
  check(Utilities.getThemeResourceFeature().equals("original_feature"),"default off preserves original feature");
  check(Utilities.getStringSystemProperties(PROPERTY).equals("original:"+PROPERTY),"default off preserves property");
  String[] features={"nx809j_w_ip_mc_cn","nx809j_w_saga","nx789s_ip_mc_cn","nx789s_w_ip_mk_cn","nx789s_w_ip_pb_cn","nx789j_ip_mp_cn","nx769j_ip_tf_cn","nx729j_ip_tf_cn"};
  String[] properties={"IP_MC_W_CN","IP_PB_CN","IP_MC_CN","IP_MK_CN","IP_PB_CN","IP_MP_CN","IP_TF_CN","IP_TF_CN"};
  FeatureSettings.set(CollabOptions.THEME,true);int nativeFeature=Utilities.featureCalls,nativeProperty=Utilities.propertyCalls;
  for(int i=0;i<8;i++){
   android.os.Build.DEVICE=new String[]{"NX809J","NX809J","NX789S","NX789S","NX789S","NX789J","NX769J","NX729J"}[i];
   FeatureSettings.values.put(CollabOptions.THEME_VARIANT,""+i);
   check(Utilities.getThemeResourceFeature().equals(features[i]),"production feature mapping "+i);
   check(Utilities.getStringSystemProperties(PROPERTY).equals(properties[i]),"production property mapping "+i);
   check(FeatureSettings.diagnostics.get(THEME_DIAG).equals("native_variant_selected:"+features[i]+";resource_availability_unconfirmed"),"selection diagnosed without claiming resource validation "+i);
  }
  check(Utilities.featureCalls==nativeFeature&&Utilities.propertyCalls==nativeProperty,"enabled exact selectors replace native return values");
  for(String other:new String[]{"ro.product.model",PROPERTY+".other","",null})
   check(Utilities.getStringSystemProperties(other).equals("original:"+other),"unrelated or null property remains native");
  check(Utilities.getStringSystemProperties(PROPERTY,"native_fallback").equals("native_fallback")&&Utilities.getThemeResourceFeature(1).equals("other_overload"),"other overloads remain native");
  android.os.Build.DEVICE="NX809J";
  int writes=FeatureSettings.writes.get(THEME_DIAG),logs=m.logs.size();FeatureSettings.values.put(CollabOptions.THEME_VARIANT,"0");
  Utilities.getThemeResourceFeature();check(FeatureSettings.diagnostics.get(THEME_DIAG).contains(features[0])&&FeatureSettings.writes.get(THEME_DIAG)==writes+1,"returning to old variant updates current diagnostic");
  for(int i=0;i<30;i++)Utilities.getThemeResourceFeature();
  check(FeatureSettings.writes.get(THEME_DIAG)==writes+1&&m.logs.size()==logs,"repeated selector does not repeat diagnostics or logs");
  FeatureSettings.values.put(CollabOptions.THEME_VARIANT,"6");check(Utilities.getThemeResourceFeature().equals(features[0]),"foreign saved variant corrected for this model");android.os.Build.DEVICE="NX999J";android.os.Build.MODEL="NX999J";check(Utilities.getThemeResourceFeature().equals("original_feature"),"unsupported model preserves original selector");android.os.Build.DEVICE="NX809J";
  FeatureSettings.current=null;check(Utilities.getThemeResourceFeature().equals("original_feature"),"no context preserves native selector");FeatureSettings.current=new Context();
  FeatureSettings.set(CollabOptions.THEME,false);
  check(Utilities.getThemeResourceFeature().equals("original_feature")&&Utilities.getStringSystemProperties(PROPERTY).equals("original:"+PROPERTY),"disable restores both original selectors");
  Utilities.failNative=true;int calls=Utilities.featureCalls;try{Utilities.getThemeResourceFeature();throw new AssertionError("missing native failure");}catch(IllegalStateException expected){}
  check(Utilities.featureCalls==calls+1,"disabled native error preserved without retry");Utilities.failNative=false;
  check(CollabUnlockHook.install(m,loader,"com.zte.beautify")==2&&m.hooks.size()==2,"repeated installation does not duplicate hooks");
  ClassLoader early=new ClassLoader(loader){protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{if(name.equals("com.zte.fingerprint.theme.FingerprintAnimProcess"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
  check(CollabUnlockHook.install(m,early,"com.zte.fingerprints")==0,"early loader has no fingerprint classes");m.errors.clear();android.os.Handler.runPending();
  check(FeatureSettings.diagnostics.get("ls_augment_collab_fingerprint_settings_install_runtime").startsWith("registered=7;class_present"),"late application loader recovers and reports exact adapter count");
  check(CollabUnlockHook.install(m,loader,"com.zte.fingerprints")==7,"verified fingerprint selector adapters install");
  Context context=FeatureSettings.current;check(FingerprintAnimProcess.getAllFpAnim(context)==FingerprintAnimProcess.original,"all fingerprint controls off return original list");
  FeatureSettings.set(CollabOptions.FP_LTY,true);
  ArrayList<?> list=FingerprintAnimProcess.getAllFpAnim(context);
  check(list.size()==1&&list!=FingerprintAnimProcess.original&&FingerprintAnimProcess.original.size()==1,"missing optional style keeps native list intact");
  check(FeatureSettings.diagnostics.get(FP_DIAG).equals("native_list_incomplete:LTYIPAnimation"),"missing class not overwritten by list-ready diagnostic");
  writes=FeatureSettings.writes.get(FP_DIAG);FingerprintAnimProcess.getAllFpAnim(context);
  check(FeatureSettings.writes.get(FP_DIAG)==writes,"same missing style diagnosis is not rewritten");
  FeatureSettings.set(CollabOptions.FP_LTY,false);FeatureSettings.set(CollabOptions.FP_CHISA,true);FeatureSettings.set(CollabOptions.FP_FIGHTING,true);
  list=FingerprintAnimProcess.getAllFpAnim(context);
  check(list.size()==2&&list.get(1) instanceof Chisa&&Chisa.creates==1&&FingerprintAnimProcess.original.size()==1,"original constructor-create contract appends to copied list");
  check(FeatureSettings.diagnostics.get(FP_DIAG).equals("native_list_ready"),"complete list clears old incomplete status");
  Chisa.missing=true;FingerprintAnimProcess.getAllFpAnim(context);
  check(FeatureSettings.diagnostics.get(FP_DIAG).equals("native_list_incomplete:Chisa"),"null native create result reported incomplete");Chisa.missing=false;
  FeatureSettings.set(CollabOptions.FP_CHUN,true);check(FingerprintAnimProcess.isCustomizeForWutheringWaves(),"chun qualification independently enabled");
  FeatureSettings.set(CollabOptions.FP_GOLD,true);check(!FingerprintAnimProcess.isCustomizeForWutheringWaves()&&FingerprintAnimProcess.isCustomizeForCN_IP_PB(),"gold priority wins when both enabled");
  check(FeatureSettings.diagnostics.get(FP_DIAG).equals("native_list_incomplete:Chisa"),"later selector qualifications cannot erase incomplete list state");
  check(Utilities.getThemeResourceFeature().equals("original_feature"),"fingerprint controls do not enable themes");
  Method report=CollabUnlockHook.class.getDeclaredMethod("report",AugmentModule.class,Context.class,String.class,String.class);report.setAccessible(true);
  report.invoke(null,m,null,"late_context","waiting");report.invoke(null,m,context,"late_context","waiting");
  check(FeatureSettings.writes.get("ls_augment_collab_late_context_runtime")==1,"unavailable context cannot consume a future diagnostic update");
  report.invoke(null,m,context,"charging","missing_or_invalid_frame:frame0.webp");int chargeWrites=FeatureSettings.writes.get("ls_augment_collab_charging_runtime");
  for(int i=1;i<75;i++)report.invoke(null,m,context,"charging","missing_or_invalid_frame:frame"+i+".webp");
  check(FeatureSettings.writes.get("ls_augment_collab_charging_runtime")==chargeWrites&&FeatureSettings.diagnostics.get("ls_augment_collab_charging_runtime").equals("missing_or_invalid_frame"),"missing sequence filename changes cannot flood diagnostics");
  check(m.errors.isEmpty(),"no unexpected hook registration failures");System.out.println("PASS production collaboration runtime: "+checks+" checks");
 }
}
""",
}

for name in ("EnhancementOption.java", "CollabOptions.java", "CollabPolicy.java",
             "hook/CollabUnlockHook.java", "hook/OemHooks.java", "hook/GoldFingerprintHook.java"):
    files["ls/augment/com/" + name] = (SRC / name).read_text(encoding="utf-8")

with tempfile.TemporaryDirectory(prefix="lsa-collab-") as temp:
    sources = []
    for name, source in files.items():
        path = Path(temp) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding="utf-8")
        sources.append(str(path))
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", temp, *sources], check=True)
    subprocess.run(["java", "-cp", temp, "ls.augment.com.hook.TestCollabRuntime"], check=True)
