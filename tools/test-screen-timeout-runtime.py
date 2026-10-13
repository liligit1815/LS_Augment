"""Replay the inspected OEM summary/writeback path against the production hook; no ADB."""
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com/hook/ScreenTimeoutHook.java"
FILES = {
    "android/content/ContentResolver.java": "package android.content;public class ContentResolver {public long value=60000;public int writes;public boolean failRead;}",
    "android/content/res/Resources.java": "package android.content.res;public class Resources {public int getIdentifier(String n,String t,String p){return 1;}}",
    "android/content/Context.java": """package android.content;public class Context {
        public final ContentResolver resolver=new ContentResolver();
        public ContentResolver getContentResolver(){return resolver;}
        public android.content.res.Resources getResources(){return new android.content.res.Resources();}
        public String getString(int id,Object...args){return "闲置 "+args[0]+"后";}
    }""",
    "android/provider/Settings.java": """package android.provider;public final class Settings {public static final class System {
        public static long getLong(android.content.ContentResolver r,String k,long d){if(r.failRead)throw new SecurityException("private detail");return r.value;}
        public static boolean putLong(android.content.ContentResolver r,String k,long v){r.writes++;r.value=v;return true;}
    }}""",
    "ls/augment/com/SystemOptions.java": "package ls.augment.com;public class SystemOptions {public static String key(String s){return \"ls_augment_rm_\"+s;}}",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class AugmentModule {
        boolean deoptAllowed=true;final Set<String> deoptimized=new HashSet<>();public boolean deoptimize(Method m){deoptimized.add(m.getName());return deoptAllowed;}
        public void logFeatureInfo(String s){}public void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}
    }""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;import android.content.Context;public class FeatureSettings {
        static boolean enabled=true;static int diagnostics;static String last="";
        public static Context from(Object o){return (Context)OemHooks.field(o,"mContext");}
        public static void diagnostic(Context c,String k,String v){diagnostics++;last=v;}
    }""",
    "ls/augment/com/hook/OemHooks.java": """package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;public class OemHooks {
        public interface Action {Object run(Chain c)throws Throwable;}public interface Original {Object run()throws Throwable;}
        public static final class Chain {final Object owner;final Object[] args;final Original original;Chain(Object o,Object[] a,Original f){owner=o;args=a;original=f;}
            public Object getThisObject(){return owner;}public Object getArg(int n){return args[n];}public Object proceed()throws Throwable{return original.run();}}
        static final Map<String,Action> hooks=new HashMap<>();static boolean guardAvailable=true;
        static int methods(AugmentModule m,ClassLoader l,String c,String n,Class<?> r,int argc,String k,Action action,Class<?>[] p){
            if(n.equals("setDefaultTimeValue")&&!guardAvailable)return 0;
            try{Method method=Class.forName(c,false,l).getDeclaredMethod(n,p);if(method.getReturnType()!=r||method.getParameterCount()!=argc)throw new AssertionError("bad contract");}
            catch(ReflectiveOperationException e){throw new AssertionError(e);}
            hooks.put(n,action);return 1;}
        public static Object call(Object owner,String name,Object[] args,Original original){try{Action h=hooks.get(name);return h!=null&&FeatureSettings.enabled?h.run(new Chain(owner,args,original)):original.run();}
            catch(Throwable t){throw new AssertionError(t);}}
        public static Object field(Object o,String name){if(o==null)return null;for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(ReflectiveOperationException ignored){}return null;}
    }""",
    "com/zte/adapt/display/ScreenTimeoutSettingsAdapt.java": """package com.zte.adapt.display;import ls.augment.com.hook.OemHooks;public class ScreenTimeoutSettingsAdapt {
        public int getInitialValuesLength(int length,CharSequence[] values){return (Integer)OemHooks.call(this,"getInitialValuesLength",new Object[]{length,values},()->values==null?length:values.length-2);}
    }""",
    "com/android/settings/display/ScreenTimeoutPreferenceController.java": """package com.android.settings.display;
    import android.content.Context;import android.provider.Settings;import ls.augment.com.hook.OemHooks;
    // Control flow transcribed from cached Settings.apk ScreenTimeoutPreferenceController:
    // getTimeoutSummary first resets >600000, then formats the OLD value, and
    // updateState calls the summary twice. This reproduces the return-to-page bug.
    public class ScreenTimeoutPreferenceController {
        public Context mContext;public CharSequence[] mTimeoutEntries={"15秒","30秒","1分钟","2分钟","5分钟","10分钟","30分钟","从不"};
        public CharSequence[] mTimeoutValues={"15000","30000","60000","120000","300000","600000","1800000","2147483647"};
        public long maximum=Long.MAX_VALUE;public String summary;public boolean tenMinuteLimit=true;
        public ScreenTimeoutPreferenceController(Context c){mContext=c;}
        private String setDefaultTimeValue(long max){return (String)OemHooks.call(this,"setDefaultTimeValue",new Object[]{max},()->{
            Settings.System.putLong(mContext.getContentResolver(),"screen_off_timeout",60000);return "闲置 1分钟后";});}
        private CharSequence getTimeoutSummary(long max){long current=mContext.getContentResolver().value;
            if(tenMinuteLimit&&current>600000)setDefaultTimeValue(max);
            CharSequence label=null;if(mTimeoutEntries.length==mTimeoutValues.length)for(int i=0;i<mTimeoutValues.length;i++)try{
                if(Long.parseLong(mTimeoutValues[i].toString())==current)label=mTimeoutEntries[i];}catch(RuntimeException ignored){}
            if(label==null)setDefaultTimeValue(max);
            return label==null?"未设置":current==2147483647L?label:"闲置 "+label+"后";
        }
        public void updateState(Object ignored){getTimeoutSummary(maximum);summary=getTimeoutSummary(maximum).toString();}
    }""",
    "ls/augment/com/hook/TestScreenTimeoutRuntime.java": """package ls.augment.com.hook;
    import android.content.Context;import com.android.settings.display.ScreenTimeoutPreferenceController;
    import com.zte.adapt.display.ScreenTimeoutSettingsAdapt;
    public class TestScreenTimeoutRuntime {
        static void yes(boolean b,String m){if(!b)throw new AssertionError(m);}
        static ScreenTimeoutPreferenceController controller(long value){Context c=new Context();c.resolver.value=value;return new ScreenTimeoutPreferenceController(c);}
        public static void main(String[] ignored){
            AugmentModule module=new AugmentModule();ClassLoader loader=TestScreenTimeoutRuntime.class.getClassLoader();
            yes(ScreenTimeoutHook.install(module,loader)==2,"both guard and list hooks registered");
            yes(module.deoptimized.contains("getTimeoutSummary")&&module.deoptimized.contains("updateState"),"inlined writeback callers deoptimized");
            ScreenTimeoutSettingsAdapt adapter=new ScreenTimeoutSettingsAdapt();
            FeatureSettings.enabled=false;ScreenTimeoutPreferenceController c=controller(1800000);c.updateState(null);
            yes(c.mContext.resolver.value==60000&&c.summary.contains("1分钟"),"fixture reproduces OEM return-to-parent reset");
            yes(adapter.getInitialValuesLength(8,c.mTimeoutValues)==6,"disabled keeps original choices");
            FeatureSettings.enabled=true;yes(adapter.getInitialValuesLength(8,c.mTimeoutValues)==8,"enabled restores full OEM choices");
            yes(adapter.getInitialValuesLength(3,null)==3,"null array keeps original");
            for(long value:new long[]{1800000,2147483647L}){
                c=controller(value);c.updateState(null);c.updateState(null);
                yes(c.mContext.resolver.value==value&&c.mContext.resolver.writes==0,"parent refresh must never overwrite extended choice "+value);
                yes(c.summary.contains(value==1800000?"30分钟":"从不"),"OEM localized summary retained");
                int count=FeatureSettings.diagnostics;c.updateState(null);yes(FeatureSettings.diagnostics==count,"repeated summary diagnostics deduplicated");
                c=new ScreenTimeoutPreferenceController(c.mContext);c.updateState(null);yes(c.mContext.resolver.value==value,"new controller retains stored value");
                c.maximum=value;c.updateState(null);yes(c.mContext.resolver.value==value,"exact policy boundary allowed");
            }
            c=controller(1800000);c.maximum=600000;c.updateState(null);yes(c.mContext.resolver.value==60000,"admin maximum not bypassed");
            c=controller(600000);c.updateState(null);yes(c.mContext.resolver.value==600000&&c.mContext.resolver.writes==0,"native supported value unchanged");
            for(long invalid:new long[]{700001,-1,0,Long.MAX_VALUE}){c=controller(invalid);c.updateState(null);yes(c.mContext.resolver.value==60000,"unknown setting left to native validation "+invalid);}
            c=controller(1800000);c.mTimeoutEntries=new CharSequence[]{"bad"};c.updateState(null);yes(c.mContext.resolver.value==60000,"mismatched OEM arrays fail closed");
            c=controller(1800000);c.mContext.resolver.failRead=true;c.updateState(null);yes(c.mContext.resolver.value==60000,"read failure preserves OEM fallback");
            yes(FeatureSettings.last.equals("guard_unavailable;exception=SecurityException")&&!FeatureSettings.last.contains("private"),"bounded failure reason without exception message");
            c=controller(1800000);FeatureSettings.enabled=false;c.updateState(null);yes(c.mContext.resolver.value==60000,"live disable restores OEM behavior");
            yes(ScreenTimeoutHook.extendedIndex(1800000,Long.MAX_VALUE,new CharSequence[]{"30分钟"},new CharSequence[]{"bad"})==-1,"malformed entry not accepted");
            yes(ScreenTimeoutHook.extendedIndex(1800000,Long.MAX_VALUE,null,null)==-1,"missing arrays not accepted");
            OemHooks.hooks.clear();module.deoptAllowed=false;yes(ScreenTimeoutHook.install(module,loader)==1&&!OemHooks.hooks.containsKey("getInitialValuesLength"),"no exposed choices if inlined writeback callers cannot be protected");
            OemHooks.hooks.clear();OemHooks.guardAvailable=false;yes(ScreenTimeoutHook.install(module,loader)==0&&!OemHooks.hooks.containsKey("getInitialValuesLength"),"no exposed broken choices when guard target missing");
            System.out.println("PASS timeout regression: OEM 60s reset replay, 30min/never return and re-entry, live disable, policy cap, invalid values, safe diagnostics");
        }
    }""",
}


def main():
    javac, java = shutil.which("javac"), shutil.which("java")
    if not javac or not java:
        raise SystemExit("JDK required on PATH")
    with tempfile.TemporaryDirectory(prefix="lsa-timeout-") as temp:
        root = Path(temp)
        for name, text in FILES.items():
            target = root / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text, encoding="utf-8")
        target = root / "ls/augment/com/hook/ScreenTimeoutHook.java"
        target.write_bytes(SOURCE.read_bytes())
        classes = root / "classes"
        subprocess.run([javac, "-encoding", "UTF-8", "-d", str(classes), *map(str, root.rglob("*.java"))], check=True)
        subprocess.run([java, "-cp", str(classes), "ls.augment.com.hook.TestScreenTimeoutRuntime"], check=True)


if __name__ == "__main__":
    main()
