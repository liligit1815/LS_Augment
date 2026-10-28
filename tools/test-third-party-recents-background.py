"""Exercise the production fallback Recents scrim hook with Android boundary doubles.

The fixture checks interception, native-call preservation and contract discovery.
It does not claim that a physical device renders the repaired background.
"""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOKS = ROOT / "android/app/src/main/java/ls/augment/com/hook"
SOURCES = {
    "android/graphics/Color.java": """package android.graphics;
public class Color {public static final int TRANSPARENT=0,WHITE=0xffffffff,BLACK=0xff000000;
public static int alpha(int color){return color>>>24;}}""",
    "android/content/res/Resources.java": """package android.content.res;
public class Resources {
    public int identifierCalls,colorCalls;
    public int getIdentifier(String name,String type,String pkg){identifierCalls++;throw new AssertionError("theme lookup unnecessary");}
    public int getColor(int id,Theme theme){colorCalls++;throw new AssertionError("color lookup unnecessary");}
    public static class Theme {public int calls;}
}""",
    "android/content/Context.java": """package android.content;
import android.content.res.Resources;
public class Context {public final Resources resources=new Resources();public final Resources.Theme theme=new Resources.Theme();
public Resources getResources(){return resources;}public Resources.Theme getTheme(){return theme;}
public String getPackageName(){return "com.android.launcher3";}}""",
    "android/app/Activity.java": "package android.app;public class Activity extends android.content.Context {}",
    "com/android/launcher3/Launcher.java": "package com.android.launcher3;public class Launcher extends android.app.Activity {}",
    "com/android/quickstep/RecentsActivity.java": "package com.android.quickstep;public class RecentsActivity extends android.app.Activity {}",
    "com/android/quickstep/fallback/RecentsState.java": """package com.android.quickstep.fallback;
import android.content.Context;import java.util.*;
public class RecentsState {
    public static final int FLAG_SCRIM=8;public int flags=FLAG_SCRIM,nativeColor=0xffffffff,calls,flagCalls;
    public boolean failNative,failFlag;public Context nativeContext;public final List<String> order=new ArrayList<>();
    public int getScrimColor(Context context){calls++;nativeContext=context;order.add("native");
        if(failNative)throw new IllegalStateException("native scrim failure");return nativeColor;}
    public boolean hasFlag(int flag){flagCalls++;order.add("flag");
        if(failFlag)throw new IllegalStateException("native flag failure");
        if(flag!=FLAG_SCRIM)throw new AssertionError("wrong native flag");return (flags&flag)!=0;}
}""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;
import android.content.Context;import java.util.*;import com.android.quickstep.fallback.RecentsState;
final class FeatureSettings {
    static boolean active,oldLauncherActive;static int gateCalls;static Context gateContext;static RecentsState current;
    static final Map<String,String> diagnostics=new HashMap<>();
    static boolean enabled(Context context,String key){gateCalls++;gateContext=context;
        if(!"ls_augment_rm_third_party_recents_no_scrim".equals(key))throw new AssertionError("wrong independent gate");
        if(current!=null)current.order.add("gate");return active;}
    static void diagnostic(Context context,String key,String value){
        if(context!=gateContext)throw new AssertionError("wrong diagnostic context");diagnostics.put(key,value);}
}""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
    interface Interceptor {Object intercept(Chain chain)throws Throwable;}
    static class Chain {
        final Object owner;final Method method;final Object[] args;int proceeds;
        Chain(Object owner,Method method,Object[] args){this.owner=owner;this.method=method;this.args=args;}
        Object getThisObject(){return owner;}Object getArg(int index){return args[index];}
        Object proceed()throws Throwable {proceeds++;try{return method.invoke(owner,args);}
            catch(InvocationTargetException failure){throw failure.getCause();}}
    }
    static class Registration {final Method method;final Interceptor interceptor;
        Registration(Method method,Interceptor interceptor){this.method=method;this.interceptor=interceptor;}}
    static class Builder {final Method method;Builder(Method method){this.method=method;}
        Registration intercept(Interceptor interceptor){return new Registration(method,interceptor);}}
    final Map<Method,Registration> hooks=new HashMap<>();final List<String> errors=new ArrayList<>();
    int preparations,registrations;String feature;boolean deopt;Chain lastChain;
    Builder prepareFeatureHook(Method method,String feature,boolean deopt){preparations++;this.feature=feature;this.deopt=deopt;return new Builder(method);}
    void registerFeatureHook(Registration registration){registrations++;hooks.put(registration.method,registration);}
    void logFeatureError(String stage,Throwable failure){errors.add(stage+":"+failure.getClass().getSimpleName());}
    Object call(Object owner,ContextArgument argument)throws Throwable {
        Method method=owner.getClass().getDeclaredMethod("getScrimColor",android.content.Context.class);
        lastChain=new Chain(owner,method,new Object[]{argument.context});Registration registration=hooks.get(method);
        return registration==null?lastChain.proceed():registration.interceptor.intercept(lastChain);
    }
    static class ContextArgument {final android.content.Context context;ContextArgument(android.content.Context context){this.context=context;}}
}""",
    "ls/augment/com/hook/ThirdPartyRecentsBackgroundTest.java": """package ls.augment.com.hook;
import android.content.Context;import android.graphics.Color;
import com.android.quickstep.RecentsActivity;import com.android.quickstep.fallback.RecentsState;
import java.util.*;
public class ThirdPartyRecentsBackgroundTest {
    static int checks;static final String DIAGNOSTIC="ls_augment_rm_third_party_recents_background";
    static void check(boolean condition,String label){checks++;if(!condition)throw new AssertionError(label);}
    static int call(AugmentModule module,RecentsState state,Context context)throws Throwable {
        int before=state.calls;state.order.clear();FeatureSettings.current=state;
        int result=(Integer)module.call(state,new AugmentModule.ContextArgument(context));
        check(state.calls==before+1&&module.lastChain.proceeds==1,"native method called exactly once");
        check(state.nativeContext==context,"native receives original Context");
        check(state.order.get(0).equals("native"),"native result precedes all decisions");return result;
    }
    static void noTheme(Context context){check(context.resources.identifierCalls==0&&context.resources.colorCalls==0&&context.theme.calls==0,
        "disabling the mask does not consult theme/wallpaper resources");}
    static void unchanged(AugmentModule module,RecentsState state,Context context,String label)throws Throwable {
        FeatureSettings.diagnostics.clear();check(call(module,state,context)==state.nativeColor,label);
        check(!FeatureSettings.diagnostics.containsKey(DIAGNOSTIC),label+" has no repair diagnostic");}
    public static void main(String[] args)throws Throwable {
        String mode=args[0];AugmentModule module=new AugmentModule();ClassLoader loader=ThirdPartyRecentsBackgroundTest.class.getClassLoader();
        if(mode.equals("missing-state")||mode.equals("linkage-error"))loader=new ClassLoader(loader){protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException {
            if(name.equals("com.android.quickstep.fallback.RecentsState")){
                if(mode.equals("linkage-error"))throw new NoClassDefFoundError("unsupported OEM dependency");
                throw new ClassNotFoundException(name);}
            return super.loadClass(name,resolve);}};
        ThirdPartyRecentsBackgroundHook.install(module,loader);
        if(!mode.equals("valid")){
            check(module.hooks.isEmpty(),"unsupported contract leaves no hooks");
            check(module.preparations==0&&module.registrations==0,"contract resolved before any hook preparation");
            check(module.errors.size()==1&&module.errors.get(0).startsWith("THIRD_PARTY_RECENTS_BACKGROUND_INSTALL:"),"unsupported contract diagnosed");
            System.out.println(mode+": "+checks+" checks passed");return;
        }
        check(module.hooks.size()==1&&module.registrations==1,"one scrim hook registered");
        check(module.feature.equals("launcher.recents.third_party_background")&&!module.deopt,"feature hook identity");
        ThirdPartyRecentsBackgroundHook.install(module,loader);check(module.registrations==1,"installation idempotent");
        RecentsState state=new RecentsState();RecentsActivity recents=new RecentsActivity();
        FeatureSettings.active=false;unchanged(module,state,recents,"OFF preserves native white");
        check(state.flagCalls==0,"OFF avoids native state flag lookup");
        FeatureSettings.oldLauncherActive=true;unchanged(module,state,recents,"old third-party-launcher switch cannot enable mask switch");
        FeatureSettings.oldLauncherActive=false;FeatureSettings.active=true;
        check(call(module,state,recents)==Color.TRANSPARENT,"new switch alone disables native white mask");
        check(state.order.equals(List.of("native","gate","flag")),"native precedes feature gate and state lookup");
        check(FeatureSettings.gateContext==recents,"gate uses fallback Activity context");
        check(FeatureSettings.diagnostics.containsKey(DIAGNOSTIC),"changed mask publishes diagnostic");
        state.nativeColor=Color.BLACK;check(call(module,state,recents)==Color.TRANSPARENT,"native black mask also disabled");
        FeatureSettings.active=false;unchanged(module,state,recents,"subsequent OFF immediately returns native black");FeatureSettings.active=true;
        int gateBefore=FeatureSettings.gateCalls;unchanged(module,state,new com.android.launcher3.Launcher(),"regular Launcher preserved");
        unchanged(module,state,new Context(),"application context preserved");unchanged(module,state,new android.app.Activity(),"unrelated Activity preserved");
        unchanged(module,state,null,"null context preserved");check(FeatureSettings.gateCalls==gateBefore,"other contexts never enter feature gate");
        state.flags=0;state.nativeColor=Color.WHITE;
        unchanged(module,state,recents,"HOME without FLAG_SCRIM preserved even with white native target");
        state.nativeColor=0;unchanged(module,state,recents,"HOME transparent native target preserved");
        state.flags=16;unchanged(module,state,recents,"background other flag remains transparent");
        state.flags=RecentsState.FLAG_SCRIM;
        for(int color:new int[]{0,0x00123456,0x55000000,0xccffffff,0xff123456,0xfffafafa}){
            state.nativeColor=color;check(call(module,state,recents)==Color.TRANSPARENT,"all configured mask colors disabled "+Integer.toHexString(color));
            FeatureSettings.active=false;unchanged(module,state,recents,"OFF restores original color "+Integer.toHexString(color));FeatureSettings.active=true;
        }
        noTheme(recents);state.nativeColor=Color.WHITE;
        state.failFlag=true;int errors=module.errors.size();unchanged(module,state,recents,"runtime flag failure preserves original");
        check(module.errors.size()==errors+1&&module.errors.get(errors).startsWith("THIRD_PARTY_RECENTS_BACKGROUND_APPLY:"),"runtime failure diagnosed");
        state.failFlag=false;check(call(module,state,recents)==Color.TRANSPARENT,"native flag lookup recovers on next invocation");
        state.failNative=true;int calls=state.calls,gate=FeatureSettings.gateCalls;
        try{module.call(state,new AugmentModule.ContextArgument(recents));throw new AssertionError("native exception lost");}
        catch(IllegalStateException expected){check(expected.getMessage().equals("native scrim failure"),"native failure unchanged");}
        check(state.calls==calls+1&&module.lastChain.proceeds==1&&FeatureSettings.gateCalls==gate,"native failure never substituted or retried");
        System.out.println(mode+": "+checks+" checks passed");
    }
}""",
}


def java_tool(name):
    candidates = []
    if os.environ.get("JAVA_HOME"):
        candidates.append(Path(os.environ["JAVA_HOME"]) / "bin" / (name + ".exe"))
    candidates.append(Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin") / (name + ".exe"))
    for candidate in candidates:
        if candidate.is_file():
            return str(candidate)
    resolved = shutil.which(name)
    if resolved:
        return resolved
    raise FileNotFoundError(f"A JDK is required to run this fixture: {name} unavailable")


def main():
    javac, java = java_tool("javac"), java_tool("java")
    variants = {
        "valid": {},
        "object": {},
        "missing-state": {},
        "linkage-error": {},
        "invalid-activity": {"com/android/quickstep/RecentsActivity.java": ("extends android.app.Activity", "extends android.content.Context")},
        "invalid-color-return": {"com/android/quickstep/fallback/RecentsState.java": ("public int getScrimColor", "public long getScrimColor")},
        "invalid-color-static": {"com/android/quickstep/fallback/RecentsState.java": ("public int getScrimColor(Context context){calls++;nativeContext=context;order.add(\"native\");\n        if(failNative)throw new IllegalStateException(\"native scrim failure\");return nativeColor;}", "public static int getScrimColor(Context context){return 0xffffffff;}")},
        "invalid-flag-return": {"com/android/quickstep/fallback/RecentsState.java": ("public boolean hasFlag(int flag)", "public Boolean hasFlag(int flag)")},
        "invalid-flag-parameter": {"com/android/quickstep/fallback/RecentsState.java": ("hasFlag(int flag)", "hasFlag(long flag)")},
        "invalid-flag-type": {"com/android/quickstep/fallback/RecentsState.java": ("public static final int FLAG_SCRIM=8", "public static final long FLAG_SCRIM=8")},
        "invalid-flag-instance": {"com/android/quickstep/fallback/RecentsState.java": ("public static final int FLAG_SCRIM=8", "public final int FLAG_SCRIM=8")},
    }
    with tempfile.TemporaryDirectory(prefix="lsa-third-party-recents-background-") as directory:
        root = Path(directory)
        for mode, changes in variants.items():
            source, classes = root / mode / "src", root / mode / "classes"
            current=dict(SOURCES)
            if mode=="object":
                current["com/android/launcher3/views/ScrimColors.java"]="package com.android.launcher3.views;public class ScrimColors{final int bg,fg;public ScrimColors(int b,int f){bg=b;fg=f;}public int getBackgroundColor(){return bg;}public int getForegroundColor(){return fg;}}"
                k="com/android/quickstep/fallback/RecentsState.java"
                current[k]=current[k].replace("public int getScrimColor", "public com.android.launcher3.views.ScrimColors getScrimColor").replace("return nativeColor;", "return new com.android.launcher3.views.ScrimColors(nativeColor, nativeColor ^ 0x123456);")
                k="ls/augment/com/hook/ThirdPartyRecentsBackgroundTest.java"
                current[k]=current[k].replace('!mode.equals("valid")','!mode.equals("valid")&&!mode.equals("object")').replace('int result=(Integer)module.call(state,new AugmentModule.ContextArgument(context));','com.android.launcher3.views.ScrimColors colors=(com.android.launcher3.views.ScrimColors)module.call(state,new AugmentModule.ContextArgument(context));int result=colors.getBackgroundColor();if(FeatureSettings.active&&context instanceof RecentsActivity&&state.flags==RecentsState.FLAG_SCRIM&&!state.failFlag)check(colors.getForegroundColor()==0,"both native color channels cleared");else check(colors.getForegroundColor()==(state.nativeColor ^ 0x123456),"original foreground preserved");')
            for name, content in current.items():
                if name in changes:
                    old, new = changes[name]
                    assert old in content, f"Missing fixture mutation: {mode}"
                    content = content.replace(old, new)
                # Invalid contracts do not execute the valid branch, but it still
                # needs to compile against deliberately changed field types.
                if mode == "invalid-flag-type" and name.endswith("ThirdPartyRecentsBackgroundTest.java"):
                    content = content.replace("state.flags=RecentsState.FLAG_SCRIM", "state.flags=(int)RecentsState.FLAG_SCRIM")
                if mode == "invalid-flag-type" and name.endswith("RecentsState.java"):
                    content = content.replace("public int flags=FLAG_SCRIM", "public int flags=(int)FLAG_SCRIM")
                if mode == "invalid-flag-instance" and name.endswith("ThirdPartyRecentsBackgroundTest.java"):
                    content = content.replace("state.flags=RecentsState.FLAG_SCRIM", "state.flags=state.FLAG_SCRIM")
                target = source / name
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(content, encoding="utf-8")
            subprocess.run([javac, "-encoding", "UTF-8", "-d", str(classes),
                            str(HOOKS / "ThirdPartyRecentsBackgroundHook.java"), str(HOOKS / "HookCompatibility.java"),
                            *map(str, source.rglob("*.java"))], check=True)
            subprocess.run([java, "-cp", str(classes), "ls.augment.com.hook.ThirdPartyRecentsBackgroundTest", mode], check=True)
    print("Fallback Recents background interception and unsupported-contract tests passed")


if __name__ == "__main__":
    main()
