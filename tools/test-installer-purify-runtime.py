"""Run the production installer adapter + OemHooks on a deterministic Java facade.

No APK installation/device operations. Android/Xposed scheduling is a facade;
registration matching, setting gates, native continuation and reflection are real
production code. ROM rendering and security verdicts are not simulated as proof.
"""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PRODUCTION = ROOT / "android/app/src/main/java/ls/augment/com/hook"


def java_bin():
    candidates = [Path(os.environ.get("JAVA_HOME", "")) / "bin",
                  Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin"),
                  Path("C:/Program Files/Java/jdk-17/bin")]
    for candidate in candidates:
        if (candidate / "javac.exe").is_file():
            return str(candidate / "javac.exe"), str(candidate / "java.exe")
    return shutil.which("javac"), shutil.which("java")


SOURCES = {
    "android/content/Context.java": '''package android.content;
public class Context {public String getPackageName(){return "com.android.packageinstaller";}
 public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public ContentResolver getContentResolver(){return new ContentResolver();}}''',
    "android/content/ContentResolver.java": '''package android.content; public class ContentResolver {
 public android.os.Bundle call(android.net.Uri u,String m,String a,android.os.Bundle b){return null;}}''',
    "android/content/pm/PackageManager.java": '''package android.content.pm; public class PackageManager {
 public PackageInfo getPackageInfo(String s,int flags){return new PackageInfo();}}''',
    "android/content/pm/PackageInfo.java": '''package android.content.pm; public class PackageInfo {
 public long getLongVersionCode(){return 0;}}''',
    "android/net/Uri.java": '''package android.net; public class Uri {public static Uri parse(String s){return new Uri();}}''',
    "android/os/Build.java": '''package android.os; public class Build {public static String MODEL="",DISPLAY="";
 public static class VERSION {public static int SDK_INT=36;}}''',
    "android/os/Bundle.java": '''package android.os; public class Bundle {public void putString(String k,String v){}}''',
    "android/os/Looper.java": '''package android.os; public class Looper {public static Looper getMainLooper(){return null;}}''',
    "android/os/Handler.java": '''package android.os; public class Handler {public Handler(Looper l){} public boolean postDelayed(Runnable r,long t){return true;}}''',
    "android/view/View.java": '''package android.view; public class View {public static final int GONE=8;public void setVisibility(int v){}}''',
    "org/json/JSONObject.java": '''package org.json; public class JSONObject {public JSONObject(java.util.Map<?,?> m){} public String toString(){return "{}";}}''',
    "io/github/libxposed/api/XposedInterface.java": '''package io.github.libxposed.api; import java.util.List;
public interface XposedInterface {interface Hooker {Object intercept(Chain c)throws Throwable;}
 interface Chain {Object getThisObject();List<Object> getArgs();Object getArg(int i);Object proceed()throws Throwable;}}''',
    "ls/augment/com/SystemOptions.java": '''package ls.augment.com; public class SystemOptions {public static String key(String s){return "ls_augment_rm_"+s;}}''',
    "ls/augment/com/OtaBufferPolicy.java": '''package ls.augment.com; public class OtaBufferPolicy {
 public static int read(String s,byte[] b){return 0;} public static boolean validUrl(String s){return false;}}''',
    "ls/augment/com/hook/FeatureSettings.java": '''package ls.augment.com.hook; import android.content.Context;
final class FeatureSettings {static boolean purify;static boolean verifiedDisabled(String k){return false;}static Context from(Object o){return o instanceof Context?(Context)o:null;}
 static boolean enabled(Context c,String k){return purify&&k.equals("ls_augment_rm_installer_hide_purify");}
 static String text(Context c,String k,String d){return d;}static void diagnostic(Context c,String k,String v){}}''',
    "ls/augment/com/hook/AugmentModule.java": '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.*;
final class AugmentModule {final Map<Method,Hooker> hooks=new LinkedHashMap<>();int failures;
 Builder prepareFeatureHook(Method m,String key,boolean observer){return new Builder(m);}
 void registerFeatureHook(Builder b){hooks.put(b.method,b.hooker);}void logFeatureError(String s,Throwable t){failures++;}void logFeatureInfo(String s){}
 final class Builder {final Method method;Hooker hooker;Builder(Method m){method=m;}
 Builder intercept(Hooker h){hooker=h;return this;}}
 Object call(Object owner,Method method,Object...args)throws Throwable {Hooker hook=hooks.get(method);method.setAccessible(true);
  if(hook==null)throw new AssertionError("Production hook not registered: "+method);
  return hook.intercept(new Chain(){public Object getThisObject(){return owner;}
   public List<Object> getArgs(){return Arrays.asList(args);}public Object getArg(int i){return args[i];}
   public Object proceed()throws Throwable {try{return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}});}}
''',
    "com/android/packageinstaller/PackageInstallerActivity.java": '''package com.android.packageinstaller;
public class PackageInstallerActivity extends android.content.Context {
 public Object nativeResult;public Throwable nativeFailure;public int calls;public Object[] received;
 private Object getCookUI(int a,int b,int c,boolean d,String e,String f)throws Throwable {
 calls++;received=new Object[]{a,b,c,d,e,f};if(nativeFailure!=null)throw nativeFailure;return nativeResult;}
 // Same name, wrong arity must not be hooked by the exact adapter registration.
 public Object getCookUI(Object a){throw new AssertionError("wrong overload");}
 public void bindUi(Object a,Object b){}public void bindUiPerm(Object a,Object b){}public void bindUiPermRed(Object a,Object b){}
}
''',
    "ls/augment/com/hook/InstallerPurifyRuntimeTest.java": '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import com.android.packageinstaller.PackageInstallerActivity;
public final class InstallerPurifyRuntimeTest {
 static int checks;static void check(boolean v,String message){checks++;if(!v)throw new AssertionError(message);}
 // The six named fields match NX809J UICookTool. Extra sentinels guard future/native state.
 public static class NativeFlags {public boolean cleanBgColor,hidePureModeSwitchLayout,hideWarningLayout,
 needIsolate,showRiskCheckbox,showSwlimitLearnMore,nativeAllowInstall;
 public int securityVerdict;public String warningTitle="native-title",warningUnknownText="native-warning";public Object nativeClick=new Object();}
 public static final class FutureFlags extends NativeFlags {public String unknownFutureVerdict="preserve";}
 public static final class LegacyFlags {public boolean hidePureModeSwitchLayout;public String nativeState="keep";}
 public static final class MissingSwitch {public boolean needIsolate=true,hideWarningLayout=false,showRiskCheckbox=true;
 public String warningMessage="required warning";}
 static final String[] FLAGS={"cleanBgColor","hidePureModeSwitchLayout","hideWarningLayout","needIsolate",
 "showRiskCheckbox","showSwlimitLearnMore","nativeAllowInstall"};
 static Map<String,Object> snapshot(Object result)throws Exception {Map<String,Object> copy=new LinkedHashMap<>();
 if(result!=null)for(Field f:result.getClass().getFields())copy.put(f.getName(),f.get(result));return copy;}
 static Object invoke(AugmentModule module,Method method,Object value,boolean on,Object[] args)throws Throwable {
 FeatureSettings.purify=on;PackageInstallerActivity owner=new PackageInstallerActivity();owner.nativeResult=value;
 Map<String,Object> before=snapshot(value);Object actual=module.call(owner,method,args);
 check(actual==value,"native result identity replaced");check(owner.calls==1,"native continuation not exactly once");
 for(int i=0;i<args.length;i++)check(i<4?Objects.equals(owner.received[i],args[i]):owner.received[i]==args[i],"native argument changed at "+i);
 Map<String,Object> after=snapshot(value);
 for(Map.Entry<String,Object> e:before.entrySet()){
 Object expected=e.getValue();
 if(on&&value instanceof LegacyFlags&&e.getKey().equals("hidePureModeSwitchLayout"))expected=true;
 if(on&&value instanceof NativeFlags){
 if(Arrays.asList("hidePureModeSwitchLayout","hideWarningLayout","cleanBgColor").contains(e.getKey()))expected=true;
 if(Arrays.asList("showRiskCheckbox","showSwlimitLearnMore").contains(e.getKey()))expected=false;
 }
 check(Objects.equals(after.get(e.getKey()),expected),"native field changed: "+e.getKey()+" on="+on+" expected="+expected+" actual="+after.get(e.getKey()));}
 return actual;}
 public static void main(String[] ignored)throws Throwable {
 AugmentModule module=new AugmentModule();ClassLoader loader=InstallerPurifyRuntimeTest.class.getClassLoader();
 OemAppExtrasHook.install(module,loader,"com.android.packageinstaller");
 Method method=PackageInstallerActivity.class.getDeclaredMethod("getCookUI",int.class,int.class,int.class,boolean.class,String.class,String.class);
 check(module.hooks.containsKey(method),"actual getCookUI hook missing");
 check(!module.hooks.containsKey(PackageInstallerActivity.class.getMethod("getCookUI",Object.class)),"wrong native overload hooked");
 int registered=module.hooks.size();OemAppExtrasHook.install(module,loader,"com.android.packageinstaller");
 check(module.hooks.size()==registered,"duplicate installation");
 Object[] args={Integer.valueOf(-1),Integer.valueOf(2),Integer.valueOf(1),Boolean.TRUE,new String("native-virus-name"),null};
 for(int bits=0;bits<128;bits++)for(int verdict:new int[]{-3,0,7})for(boolean on:new boolean[]{false,true,false}){
 FutureFlags flags=new FutureFlags();for(int i=0;i<FLAGS.length;i++)NativeFlags.class.getField(FLAGS[i]).setBoolean(flags,(bits&(1<<i))!=0);
 flags.securityVerdict=verdict;invoke(module,method,flags,on,args);}
 invoke(module,method,new MissingSwitch(),true,args);invoke(module,method,new MissingSwitch(),false,args);
 invoke(module,method,new LegacyFlags(),true,args);invoke(module,method,new LegacyFlags(),false,args);
 invoke(module,method,null,true,args);invoke(module,method,null,false,args);
 for(boolean on:new boolean[]{false,true}){FeatureSettings.purify=on;PackageInstallerActivity owner=new PackageInstallerActivity();
 owner.nativeFailure=new IllegalStateException("native verdict failure");boolean thrown=false;
 try{module.call(owner,method,args);}catch(Throwable t){thrown=t==owner.nativeFailure;}
 check(thrown,"native failure was swallowed/replaced");check(owner.calls==1,"native failure called more than once");}
 System.out.println("Installer purify actual OemAppExtrasHook + OemHooks: "+checks+" assertions passed (Java/Android facade; no device claim)");
 }
}
'''
}
for name in ("InstallerStartupHook", "InstallerPresentationHook", "OtaReadObservationHook", "DefaultAssistantUiHook"):
    SOURCES[f"ls/augment/com/hook/{name}.java"] = (
        f"package ls.augment.com.hook; final class {name} {{static void install(AugmentModule m,ClassLoader l){{}}}}")
for name in ("CaptureVisibilityHook", "ThemeExtrasHook", "DefaultLauncherRoleHook", "ScreenshotCropHook", "GalleryCropHook", "GalleryWatermarkHook"):
    SOURCES[f"ls/augment/com/hook/{name}.java"] = (
        f"package ls.augment.com.hook; final class {name} {{static void install(AugmentModule m,ClassLoader l,String p){{}}}}")
SOURCES["ls/augment/com/hook/SystemRulesHook.java"] = (
    "package ls.augment.com.hook; final class SystemRulesHook {static void installCapture(AugmentModule m,ClassLoader l){}}")


def exercise(source, expect_failure=False, modern=False):
    javac, java = java_bin()
    if not javac or not java:
        raise RuntimeError("A JDK is required for the local production-adapter regression")
    with tempfile.TemporaryDirectory(prefix="duo-installer-purify-") as directory:
        base = Path(directory)
        all_sources = dict(SOURCES)
        if modern:
            for name in ('com/android/packageinstaller/PackageInstallerActivity.java', 'ls/augment/com/hook/InstallerPurifyRuntimeTest.java'):
                all_sources[name] = all_sources[name].replace('int a,int b,int c,boolean d', 'int a,int b,int c,int risk,boolean d')\
                    .replace('new Object[]{a,b,c,d,e,f}', 'new Object[]{a,b,c,risk,d,e,f}')\
                    .replace('int.class,int.class,int.class,boolean.class', 'int.class,int.class,int.class,int.class,boolean.class')\
                    .replace('Integer.valueOf(1),Boolean.TRUE', 'Integer.valueOf(1),Integer.valueOf(8),Boolean.TRUE')\
                    .replace('i<4?', 'i<5?')
        all_sources["ls/augment/com/hook/OemAppExtrasHook.java"] = source
        all_sources["ls/augment/com/hook/OemHooks.java"] = (PRODUCTION / "OemHooks.java").read_text(encoding="utf-8")
        all_sources["ls/augment/com/hook/InstallerWarningContract.java"] = (PRODUCTION / "InstallerWarningContract.java").read_text(encoding="utf-8")
        files = []
        for name, content in all_sources.items():
            file = base / name
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(content, encoding="utf-8")
            files.append(str(file))
        subprocess.run([javac, "-encoding", "UTF-8", "-d", str(base), *files], check=True)
        result = subprocess.run([java, "-cp", str(base), "ls.augment.com.hook.InstallerPurifyRuntimeTest"], capture_output=True, text=True)
        if expect_failure:
            if result.returncode == 0 or "native field changed:" not in result.stderr:
                raise AssertionError("Unrequested native isolation mutation was not rejected: " + result.stdout + result.stderr)
            print("Negative mutation rejected: unrequested native isolation override")
        else:
            print(result.stdout.strip())
            if result.returncode:
                raise AssertionError(result.stderr)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mutation-check", action="store_true")
    args = parser.parse_args()
    source = (PRODUCTION / "OemAppExtrasHook.java").read_text(encoding="utf-8")
    exercise(source)
    exercise(source, modern=True)
    if args.mutation_check:
        correct = 'InstallerWarningContract.Result applied=InstallerWarningContract.apply(result);'
        if source.count(correct) != 1:
            raise AssertionError("Expected the verified presentation contract mutation point")
        previous = '''for(String field:new String[]{"cleanBgColor","hidePureModeSwitchLayout","hideWarningLayout"})OemHooks.set(result,true,field);
            for(String field:new String[]{"needIsolate","showRiskCheckbox","showSwlimitLearnMore"})OemHooks.set(result,false,field);'''
        exercise(source.replace(correct, correct + previous), expect_failure=True)
