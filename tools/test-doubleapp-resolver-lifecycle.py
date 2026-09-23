"""Execute the complete production DoubleAppHook with boundary Android/Xposed doubles.

The registered resolver interceptor calls a real Java fixture OEM onCreate through
proceed(). A minimal ActivityThread clears mCalled and checks superclass creation
after a normal return. Fixtures cover selected lifecycle behaviors, not the full
OEM activity or Android runtime. No device, Root, app installation, or real launch.
"""
import argparse
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/DoubleAppHook.java'

SOURCES = {
'android/os/Bundle.java': 'package android.os;public class Bundle {}',
'android/os/Build.java': 'package android.os;public class Build {public static class VERSION {public static int SDK_INT=36;}}',
'android/content/ComponentName.java': '''package android.content;
public final class ComponentName {private final String pkg;public ComponentName(String p,String cls){pkg=p;}public String getPackageName(){return pkg;}}
''',
'android/content/Intent.java': '''package android.content;
import java.util.*;
public class Intent {
    public final Map<String,Object> extras=new HashMap<>();
    public int legacyReads,typedReads,flags;public RuntimeException parcelError;
    private String pkg;private ComponentName component;
    public Intent setPackage(String value){pkg=value;return this;}public String getPackage(){return pkg;}
    public Intent setComponent(ComponentName value){component=value;return this;}public ComponentName getComponent(){return component;}
    public Intent putExtra(String key,Object value){extras.put(key,value);return this;}
    public String getStringExtra(String key){Object value=extras.get(key);return value instanceof String?(String)value:null;}
    @SuppressWarnings("unchecked") public <T>T getParcelableExtra(String key){legacyReads++;if(parcelError!=null)throw parcelError;return (T)extras.get(key);}
    public <T>T getParcelableExtra(String key,Class<T> type){typedReads++;if(parcelError!=null)throw parcelError;Object value=extras.get(key);return type.isInstance(value)?type.cast(value):null;}
    public Intent setFlags(int value){flags=value;return this;}public int getFlags(){return flags;}
}
''',
'android/content/pm/ApplicationInfo.java': '''package android.content.pm;
public class ApplicationInfo {public static final int FLAG_SYSTEM=1,FLAG_INSTALLED=0x800000;public String packageName;public boolean enabled=true;public int flags=FLAG_INSTALLED;public ApplicationInfo(){}public ApplicationInfo(String p,int f,boolean e){packageName=p;flags=f;enabled=e;}}
''',
'android/content/pm/PackageInfo.java': 'package android.content.pm;public class PackageInfo {public ApplicationInfo applicationInfo;}',
'android/content/pm/PackageManager.java': '''package android.content.pm;
import java.util.*;
public class PackageManager {
    public static final int MATCH_UNINSTALLED_PACKAGES=8192;
    public final Map<String,ApplicationInfo> apps=new LinkedHashMap<>();
    public boolean cloneInstalled,cloneThrows,cloneNull,appsThrow;public int cloneQueries;public String queriedPackage;public int queriedUser;
    public ApplicationInfo getApplicationInfo(String pkg,int flags){ApplicationInfo info=apps.get(pkg);if(info==null)throw new IllegalArgumentException("unknown app");return info;}
    public List<ApplicationInfo> getInstalledApplications(int flags){if(appsThrow)throw new IllegalStateException("inventory failed");return new ArrayList<>(apps.values());}
    public PackageInfo getPackageInfoAsUser(String pkg,int flags,int user){
        cloneQueries++;queriedPackage=pkg;queriedUser=user;
        if(cloneThrows)throw new IllegalStateException("clone query failed");if(cloneNull)return null;
        PackageInfo result=new PackageInfo();result.applicationInfo=new ApplicationInfo(pkg,cloneInstalled?ApplicationInfo.FLAG_INSTALLED:0,true);return result;
    }
}
''',
'android/content/Context.java': '''package android.content;
import android.content.pm.PackageManager;
public class Context {public final PackageManager pm=new PackageManager();public PackageManager getPackageManager(){return pm;}}
''',
'android/app/Activity.java': '''package android.app;
import android.content.*;import android.os.Bundle;import java.util.*;
public class Activity extends Context {
    public boolean mCalled,finishing,destroyed,inOriginal;
    public int superCalls,originalCalls,startAttempts,startSuccess,finishAttempts,oemStarts,oemFinishes;
    public final List<String> events=new ArrayList<>();
    public Intent wrapper,launched;public int launchedFlags;
    public RuntimeException startFailure,finishFailure,intentFailure,finishingFailure;
    protected void onCreate(Bundle state){superCalls++;mCalled=true;events.add("super.onCreate");}
    public Intent getIntent(){if(intentFailure!=null)throw intentFailure;return wrapper;}
    public void startActivity(Intent intent){
        if(inOriginal)oemStarts++;else startAttempts++;
        events.add(inOriginal?"oem.start":"module.start");
        if(startFailure!=null)throw startFailure;
        if(!inOriginal){startSuccess++;launched=intent;launchedFlags=intent.getFlags();}
    }
    public void finish(){
        if(inOriginal)oemFinishes++;else finishAttempts++;
        events.add(inOriginal?"oem.finish":"module.finish");
        if(finishFailure!=null)throw finishFailure;finishing=true;
    }
    public boolean isFinishing(){if(finishingFailure!=null)throw finishingFailure;return finishing;}
    public boolean isDestroyed(){return destroyed;}
}
''',
'android/app/SuperNotCalledException.java': '''package android.app;
public final class SuperNotCalledException extends RuntimeException {public SuperNotCalledException(){super("Activity did not call through to super.onCreate()");}}
''',
'com/zte/cn/doubleapp/activity/DoubleAppResolverActivity.java': '''package com.zte.cn.doubleapp.activity;
import android.app.Activity;import android.content.Intent;import android.os.Bundle;
public class DoubleAppResolverActivity extends Activity {
    public boolean finishInOriginal,destroyInOriginal,navigateInOriginal,clearRealIntentFlag;
    public Throwable originalFailure;public boolean throwBeforeSuper;
    @Override protected void onCreate(Bundle state){
        originalCalls++;events.add("oem.begin");inOriginal=true;
        try {
            if(throwBeforeSuper&&originalFailure!=null)rethrow(originalFailure);
            super.onCreate(state);
            if(clearRealIntentFlag&&wrapper!=null){Object real=wrapper.extras.get("doubleLay_intent");if(real instanceof Intent)((Intent)real).setFlags(((Intent)real).getFlags()&~0x800000);events.add("oem.intent-mutated");}
            if(navigateInOriginal)startActivity(new Intent().setPackage("fixture.oem.target"));
            if(finishInOriginal)finish();
            if(destroyInOriginal){destroyed=true;events.add("oem.destroy");}
            if(originalFailure!=null)rethrow(originalFailure);
            events.add("oem.end");
        }finally{inOriginal=false;}
    }
    private static void rethrow(Throwable error){DoubleAppResolverActivity.<RuntimeException>unchecked(error);}
    @SuppressWarnings("unchecked") private static <T extends Throwable>void unchecked(Throwable error)throws T{throw (T)error;}
}
''',
'com/zte/cn/doubleapp/common/Utils.java': '''package com.zte.cn.doubleapp.common;
import android.content.Context;
public class Utils {public static int originals;public static boolean showLimitedApps(Context c){originals++;return true;}}
''',
'com/zte/cn/doubleapp/common/UpdateUtils.java': '''package com.zte.cn.doubleapp.common;
import android.content.Context;import java.util.*;
public class UpdateUtils {public static Collection<String> original;public static int originals;public static Collection<String> getSupportApps(Context c){originals++;return original;}}
''',
'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;
public interface XposedInterface {interface HookHandle {}}
''',
'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
import android.content.Context;
final class FeatureSettings {
    static final String APP_MASTER="master",DOUBLE_ANY_APP="any",DOUBLE_LOW_MEMORY="memory",
        DOUBLE_INSTALLED="installed",DOUBLE_LAST_ERROR="error",DOUBLE_ACTIVE="active",DOUBLE_LAST_HIT="hit";
    static boolean master=true,any=true,memory=true;static Context context;static String failDiagnostic="";
    static Context from(Object owner){return owner instanceof Context?(Context)owner:context;}
    static boolean enabled(Context c,String key){return key.equals(APP_MASTER)?master:key.equals(DOUBLE_ANY_APP)?any:memory;}
    static void diagnostic(Context c,String key,String value){if(key.equals(failDiagnostic))throw new IllegalStateException("diagnostic "+key);}
}
''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.HookHandle;
final class AugmentModule {
    interface Interceptor {Object intercept(Chain chain)throws Throwable;}
    interface Chain {Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}
    static final class Registration implements HookHandle {
        final Method method;final String id;final boolean before;final Interceptor interceptor;
        Registration(Method m,String i,boolean b,Interceptor f){method=m;id=i;before=b;interceptor=f;}
    }
    final class Builder {
        final Method method;final String id;final boolean before;
        Builder(Method m,String i,boolean b){method=m;id=i;before=b;}
        HookHandle intercept(Interceptor interceptor){return new Registration(method,id,before,interceptor);}
    }
    final Map<String,Registration> registered=new LinkedHashMap<>();
    Builder prepareFeatureHook(Method method,String id,boolean before){return new Builder(method,id,before);}
    void registerFeatureHook(HookHandle handle){Registration r=(Registration)handle;registered.put(r.id,r);}
    void logFeatureInfo(String text){}void logFeatureError(String text,Throwable error){}
    static Object original(Method method,Object owner,Object[] args)throws Throwable {
        try{return method.invoke(owner,args);}catch(InvocationTargetException wrapper){throw wrapper.getCause();}
    }
}
''',
}

TEST = r'''package ls.augment.com.hook;
import android.app.*;import android.content.*;import android.content.pm.*;import android.os.*;
import com.zte.cn.doubleapp.activity.DoubleAppResolverActivity;
import com.zte.cn.doubleapp.common.*;
import java.util.*;
public final class TestDoubleAppLifecycle {
    static final String PKG="com.example.target";
    static final Object RETURN_MARKER=new Object();
    static int passed,failed;static final List<String> failures=new ArrayList<>();
    interface Scenario {void run()throws Throwable;}
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static void test(String name,Scenario scenario){try{scenario.run();passed++;System.out.println("PASS "+name);}catch(Throwable error){failed++;failures.add(name);System.out.println("FAIL "+name+": "+error);}}
    static final class Fixture {
        final DoubleAppResolverActivity activity=new DoubleAppResolverActivity();
        final Intent real=new Intent().setPackage(PKG);
        final AugmentModule module=new AugmentModule();
        final AugmentModule.Registration resolver;int proceeds;Object returned;Throwable error;
        Object proceedResult=RETURN_MARKER;
        Fixture(int sdk){
            Build.VERSION.SDK_INT=sdk;FeatureSettings.master=true;FeatureSettings.any=true;FeatureSettings.memory=true;FeatureSettings.failDiagnostic="";
            activity.pm.apps.put(PKG,new ApplicationInfo(PKG,ApplicationInfo.FLAG_INSTALLED,true));
            activity.wrapper=new Intent().putExtra("doubleapp_calling_package","cn.nubia.gameassist").putExtra("doubleLay_intent",real);
            FeatureSettings.context=activity;Utils.originals=0;UpdateUtils.originals=0;
            UpdateUtils.original=new ArrayList<>(Arrays.asList("com.oem.supported"));
            int count=DoubleAppHook.install(module,TestDoubleAppLifecycle.class.getClassLoader());
            check(count==3&&module.registered.size()==3,"real install did not register all three hooks: "+count);
            resolver=module.registered.get("doubleapp.resolver.real_clone_guard");check(resolver!=null,"resolver not registered");
        }
        void dispatch(){
            // Android ActivityThread performs this clearing/check outside the hook.
            activity.mCalled=false;activity.events.add("thread.clear-mCalled");
            try {
                returned=resolver.interceptor.intercept(new AugmentModule.Chain(){
                    public Object getThisObject(){return activity;}public Object getArg(int index){return new Bundle();}
                    public Object proceed()throws Throwable {
                        proceeds++;activity.events.add("chain.proceed");
                        AugmentModule.original(resolver.method,activity,new Object[]{new Bundle()});
                        // Real onCreate is void. This opaque boundary token additionally
                        // checks that interceptors return the original chain result unchanged.
                        return proceedResult;
                    }
                });
                activity.events.add("thread.check-mCalled");
                if(!activity.mCalled)throw new SuperNotCalledException();
            }catch(Throwable thrown){error=thrown;}
        }
        String evidence(){return "error="+(error==null?"none":error.getClass().getSimpleName())+", proceed="+proceeds+
            ", OEM="+activity.originalCalls+", super="+activity.superCalls+", starts="+activity.startAttempts+", events="+activity.events;}
        void complete(int starts,int finishes){
            check(error==null,"ActivityThread lifecycle failed: "+evidence());
            check(proceeds==1&&activity.originalCalls==1&&activity.superCalls==1,"original initialization count: "+evidence());
            check(returned==proceedResult,"chain return identity lost: "+evidence());
            check(activity.startAttempts==starts&&activity.finishAttempts==finishes,"wrong bypass behavior: "+evidence());
            if(starts>0){
                check(activity.events.indexOf("oem.end")<activity.events.indexOf("module.start"),"navigation preceded OEM initialization: "+evidence());
                if(finishes>0)check(activity.events.indexOf("module.start")<activity.events.indexOf("module.finish"),"finish preceded launch");
            }
        }
        void parcelBranch(){
            check(activity.wrapper.typedReads==(Build.VERSION.SDK_INT>=33?1:0),"typed parcel branch incorrect");
            check(activity.wrapper.legacyReads==(Build.VERSION.SDK_INT<33?1:0),"legacy parcel branch incorrect");
        }
        Object invoke(String prefix)throws Throwable {
            AugmentModule.Registration r=module.registered.values().stream().filter(x->x.id.startsWith(prefix)).findFirst().orElseThrow();
            return r.interceptor.intercept(new AugmentModule.Chain(){
                public Object getThisObject(){return null;}public Object getArg(int index){return activity;}
                public Object proceed()throws Throwable{return AugmentModule.original(r.method,null,new Object[]{activity});}
            });
        }
    }
    static void resolverCases(int sdk){
        String v="SDK "+sdk+" ";
        test(v+"master off initializes OEM exactly once",()->{var f=new Fixture(sdk);FeatureSettings.master=false;f.dispatch();f.complete(0,0);check(f.activity.pm.cloneQueries==0,"queried clone with master off");});
        test(v+"double-app off initializes OEM exactly once",()->{var f=new Fixture(sdk);FeatureSettings.any=false;f.dispatch();f.complete(0,0);check(f.activity.pm.cloneQueries==0,"queried disabled clone feature");});
        test(v+"no clone still navigates once after OEM creation",()->{var f=new Fixture(sdk);f.dispatch();f.complete(1,1);f.parcelBranch();check(f.activity.startSuccess==1&&f.activity.launched==f.real,"valid bypass disappeared or copied Intent");check(f.activity.pm.cloneQueries==1&&f.activity.pm.queriedUser==999&&f.activity.pm.queriedPackage.equals(PKG),"wrong clone query");});
        test(v+"real clone retains OEM resolver",()->{var f=new Fixture(sdk);f.activity.pm.cloneInstalled=true;f.dispatch();f.complete(0,0);f.parcelBranch();});
        test(v+"clone query exception retains OEM resolver",()->{var f=new Fixture(sdk);f.activity.pm.cloneThrows=true;f.dispatch();f.complete(0,0);});
        test(v+"null clone query result retains OEM resolver",()->{var f=new Fixture(sdk);f.activity.pm.cloneNull=true;f.dispatch();f.complete(0,0);});
        test(v+"null nested Extra retains initialized OEM resolver",()->{var f=new Fixture(sdk);f.activity.wrapper.putExtra("doubleLay_intent",null);f.dispatch();f.complete(0,0);f.parcelBranch();});
        test(v+"wrong nested Extra type preserves lifecycle",()->{var f=new Fixture(sdk);f.activity.wrapper.putExtra("doubleLay_intent","wrong type");f.dispatch();f.complete(0,0);f.parcelBranch();});
        test(v+"parcel decoding exception preserves lifecycle",()->{var f=new Fixture(sdk);f.activity.wrapper.parcelError=new IllegalStateException("bad parcel");f.dispatch();f.complete(0,0);});
        test(v+"wrong caller retains OEM resolver",()->{var f=new Fixture(sdk);f.activity.wrapper.putExtra("doubleapp_calling_package","other.caller");f.dispatch();f.complete(0,0);});
        test(v+"null wrapper retains OEM resolver",()->{var f=new Fixture(sdk);f.activity.wrapper=null;f.dispatch();f.complete(0,0);});
        test(v+"Intent access exception preserves original result",()->{var f=new Fixture(sdk);f.activity.intentFailure=new IllegalStateException("intent lookup");f.dispatch();f.complete(0,0);});
        test(v+"start failure does not reinitialize OEM",()->{var f=new Fixture(sdk);f.activity.startFailure=new IllegalStateException("launch denied");f.dispatch();f.complete(1,0);check(f.activity.startSuccess==0,"failed launch counted successful");});
        test(v+"finish failure does not reinitialize OEM",()->{var f=new Fixture(sdk);f.activity.finishFailure=new IllegalStateException("finish denied");f.dispatch();f.complete(1,1);});
        for(String key:new String[]{FeatureSettings.DOUBLE_ACTIVE,FeatureSettings.DOUBLE_LAST_HIT})test(v+"diagnostic failure "+key+" does not reinitialize OEM",()->{var f=new Fixture(sdk);FeatureSettings.failDiagnostic=key;f.dispatch();f.complete(1,1);});
        for(boolean beforeSuper:new boolean[]{false,true})test(v+"original exception identity preserved, beforeSuper="+beforeSuper,()->{
            var f=new Fixture(sdk);Throwable original=new AssertionError("OEM creation failed");f.activity.originalFailure=original;f.activity.throwBeforeSuper=beforeSuper;f.dispatch();
            check(f.error==original,"original exception replaced: "+f.evidence());check(f.proceeds==1&&f.activity.originalCalls==1,"original retried or skipped: "+f.evidence());
            check(f.activity.superCalls==(beforeSuper?0:1),"fixture superclass call changed");check(f.activity.startAttempts==0&&f.activity.finishAttempts==0,"navigation after original exception: "+f.evidence());
        });
        test(v+"OEM already finished cannot launch a second activity",()->{var f=new Fixture(sdk);f.activity.finishInOriginal=true;f.activity.navigateInOriginal=true;f.dispatch();f.complete(0,0);check(f.activity.oemStarts==1&&f.activity.oemFinishes==1,"OEM navigation did not execute exactly once");});
        test(v+"OEM already destroyed cannot navigate",()->{var f=new Fixture(sdk);f.activity.destroyInOriginal=true;f.dispatch();f.complete(0,0);});
        test(v+"finishing lookup exception preserves original result",()->{var f=new Fixture(sdk);f.activity.finishingFailure=new IllegalStateException("finishing lookup");f.dispatch();f.complete(0,0);});
        test(v+"same real Intent retains original flag mutation",()->{var f=new Fixture(sdk);f.real.setFlags(0x800000|0x10000000);f.activity.clearRealIntentFlag=true;f.dispatch();f.complete(1,1);check(f.activity.launched==f.real&&f.activity.launchedFlags==0x10000000,"OEM Intent flags lost or observed too early: "+f.evidence());});
        test(v+"component package takes precedence",()->{var f=new Fixture(sdk);f.real.setPackage("wrong.wrapper.package").setComponent(new ComponentName(PKG,"Target"));f.dispatch();f.complete(1,1);check(f.activity.pm.queriedPackage.equals(PKG),"component package ignored");});
        test(v+"real void null return is preserved",()->{var f=new Fixture(sdk);f.proceedResult=null;f.activity.pm.cloneInstalled=true;f.dispatch();f.complete(0,0);});
    }
    static void regressions(){
        test("low-memory enabled bypasses only its boolean gate",()->{var f=new Fixture(36);check(f.invoke("doubleapp.low_memory.").equals(false),"low memory gate not unlocked");check(Utils.originals==0,"enabled low memory unnecessarily called original");});
        for(boolean master:new boolean[]{false,true})test("low-memory disabled path preserves original master="+master,()->{var f=new Fixture(36);FeatureSettings.master=master;FeatureSettings.memory=!master;check(f.invoke("doubleapp.low_memory.").equals(true)&&Utils.originals==1,"low-memory original changed");});
        test("support list disabled returns exact original",()->{var f=new Fixture(36);FeatureSettings.any=false;Object original=UpdateUtils.original;check(f.invoke("doubleapp.support_apps.")==original&&UpdateUtils.originals==1,"disabled support result changed");});
        test("support list master off returns exact original",()->{var f=new Fixture(36);FeatureSettings.master=false;Object original=UpdateUtils.original;check(f.invoke("doubleapp.support_apps.")==original&&UpdateUtils.originals==1,"master-off support result changed");});
        for(boolean asSet:new boolean[]{false,true})test("support expansion keeps OEM values and filters unsafe candidates set="+asSet,()->{
            var f=new Fixture(36);UpdateUtils.original=asSet?new LinkedHashSet<>(Arrays.asList("com.oem.supported",PKG)):new ArrayList<>(Arrays.asList("com.oem.supported",PKG,PKG));
            f.activity.pm.apps.put("com.example.added",new ApplicationInfo("com.example.added",ApplicationInfo.FLAG_INSTALLED,true));
            f.activity.pm.apps.put("com.android.system",new ApplicationInfo("com.android.system",ApplicationInfo.FLAG_INSTALLED|ApplicationInfo.FLAG_SYSTEM,true));
            f.activity.pm.apps.put("com.example.disabled",new ApplicationInfo("com.example.disabled",ApplicationInfo.FLAG_INSTALLED,false));
            f.activity.pm.apps.put("com.example.uninstalled",new ApplicationInfo("com.example.uninstalled",0,true));
            f.activity.pm.apps.put("ls.augment.com",new ApplicationInfo("ls.augment.com",ApplicationInfo.FLAG_INSTALLED,true));
            Object result=f.invoke("doubleapp.support_apps.");check(result instanceof Collection,"support result type");
            check(new ArrayList<>((Collection<?>)result).equals(Arrays.asList("com.oem.supported",PKG,"com.example.added")),"candidate regression: "+result);
            check((result instanceof Set)==asSet&&UpdateUtils.originals==1,"collection shape or original call changed");
        });
        test("support inventory exception returns exact original",()->{var f=new Fixture(36);f.activity.pm.appsThrow=true;Object original=UpdateUtils.original;check(f.invoke("doubleapp.support_apps.")==original&&UpdateUtils.originals==1,"failed expansion lost OEM candidates");});
    }
    public static void main(String[] args){
        for(int sdk:new int[]{28,32,33,36})resolverCases(sdk);
        regressions();
        System.out.println("RESULT "+passed+" passed, "+failed+" failed; 0 skipped");
        System.out.println("Limits: real complete Hook and registered interceptor; selected Java OEM lifecycle fixture, not full Android/OEM runtime or real navigation.");
        if(failed>0)System.exit(1);
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--hook-source', type=Path, default=DEFAULT_SOURCE,
                        help='Compile this complete DoubleAppHook source snapshot')
    args = parser.parse_args()
    sources = dict(SOURCES)
    sources['ls/augment/com/hook/DoubleAppHook.java'] = args.hook_source.read_text(encoding='utf-8')
    sources['ls/augment/com/hook/TestDoubleAppLifecycle.java'] = TEST
    with tempfile.TemporaryDirectory(prefix='lsa-doubleapp-lifecycle-') as temp:
        workspace = Path(temp)
        paths = []
        for name, text in sources.items():
            path = workspace / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding='utf-8')
            paths.append(str(path))
        result = subprocess.run(['javac', '--release', '17', '-encoding', 'UTF-8',
                                 '-d', str(workspace / 'classes'), *paths],
                                capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        if result.returncode:
            print(result.stdout + result.stderr, end='')
            return result.returncode
        print('Compiled complete production DoubleAppHook.java; exercising actual registered interceptors.', flush=True)
        result = subprocess.run(['java', '-cp', str(workspace / 'classes'),
                                 'ls.augment.com.hook.TestDoubleAppLifecycle'],
                                capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=60)
        print(result.stdout + result.stderr, end='')
        return result.returncode


if __name__ == '__main__':
    raise SystemExit(main())
