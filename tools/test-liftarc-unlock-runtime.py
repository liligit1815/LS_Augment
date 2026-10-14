"""Exercise production LiftArc installation, capture and native security requests.

SystemUI, Android and Xposed are offline facades. Compiles the unchanged full
Hooks, Unlock, entry resolver and SystemUiAdapter; no device is accessed and no
successful phone authentication or rendered gesture is claimed.
"""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / "android/app/src/main/java/ls/augment/com/hook"

STUBS = {
    "android/content/Context.java": "package android.content;public class Context {}",
    "android/view/View.java": """package android.view;public class View {
public android.content.Context getContext(){return new android.content.Context();}}""",
    "android/util/Log.java": """package android.util;public class Log {
public static String getStackTraceString(Throwable error){return error.toString();}}""",
    "android/view/MotionEvent.java": """package android.view;public class MotionEvent {
public static final int ACTION_CANCEL=3;public int action;public boolean recycled;
public MotionEvent(int action){this.action=action;}public static MotionEvent obtain(MotionEvent e){return new MotionEvent(e.action);}
public void setAction(int action){this.action=action;}public void recycle(){recycled=true;}}""",
    "io/github/libxposed/api/XposedInterface.java": """package io.github.libxposed.api;
public interface XposedInterface {enum ExceptionMode {PROTECTIVE}}""",
    "ls/augment/com/hook/FeatureSettings.java": """package ls.augment.com.hook;final class FeatureSettings {
static android.content.Context from(Object owner){return new android.content.Context();}
static void diagnostic(android.content.Context context,String key,String message){}
}""",
    "ls/augment/com/hook/LiftArcConfig.java": "package ls.augment.com.hook;final class LiftArcConfig {}",
    "ls/augment/com/hook/LiftArcLog.java": """package ls.augment.com.hook;final class LiftArcLog {
static final java.util.List<String> messages=new java.util.ArrayList<>();
static void d(String value){messages.add(value);}static boolean e(String value,Throwable error){return true;}
static void w(String value,Throwable error){}
}""",
    "ls/augment/com/hook/LiftArcRuntime.java": """package ls.augment.com.hook;final class LiftArcRuntime {
static boolean installed,ready;static final java.util.List<Throwable> errors=new java.util.ArrayList<>();
static void installed(boolean value){installed=value;}static void unlockReady(boolean value){ready=value;}
static void error(String source,Throwable error){errors.add(error);}
}""",
    "ls/augment/com/hook/LiftArcController.java": """package ls.augment.com.hook;final class LiftArcController {
static final int TOUCH_PASS=0,TOUCH_SWALLOW=1,TOUCH_PASS_AS_CANCEL=2,INTERCEPT_NO=1;
static int mode,post,attached,detached,intercept;static boolean showing,occluded,dozing,bouncer,qs;
static void onWindowAttached(Object owner,LiftArcConfig config,AugmentModule module){attached++;}
static void onWindowDetached(Object owner){detached++;}
static int onWindowTouchPre(Object owner,LiftArcConfig config,android.view.MotionEvent event){return mode;}
static void onWindowTouchPost(Object owner,LiftArcConfig config){post++;}
static int onWindowIntercept(Object owner,LiftArcConfig config,android.view.MotionEvent event){return intercept;}
static void onKeyguardState(boolean value,boolean hidden){showing=value;occluded=hidden;}
static void onDozing(boolean value){dozing=value;}static void onBouncer(boolean value){bouncer=value;}
static void onControlCenterOpen(boolean value){qs=value;}
}""",
    "ls/augment/com/hook/AugmentModule.java": """package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface;
final class AugmentModule {
interface Interceptor {Object run(Chain chain)throws Throwable;}
final Map<Executable,Registration> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();
final List<String> info=new ArrayList<>();
final class Registration {
 final Executable member;Interceptor interceptor;XposedInterface.ExceptionMode mode;String id;
 Registration(Executable member){this.member=member;}
 Registration intercept(Interceptor value){interceptor=value;return this;}Registration setId(String value){id=value;return this;}
 Registration setExceptionMode(XposedInterface.ExceptionMode value){mode=value;return this;}
}
Registration prepareFeatureHook(Method member,String id,boolean once){return new Registration(member).setId(id);}
Registration hook(Constructor<?> member){return new Registration(member);}
void registerFeatureHook(Registration value){if(hooks.put(value.member,value)!=null)throw new AssertionError("duplicate registration");}
void logFeatureError(String phase,Throwable error){errors.add(error);}void logFeatureInfo(String value){info.add(value);}
static final class Chain {
 final Executable member;Object owner;final Object[] args;
 Chain(Executable member,Object owner,Object[] args){this.member=member;this.owner=owner;this.args=args;}
 Object getThisObject(){return owner;}Object getArg(int n){return args[n];}List<Object> getArgs(){return Arrays.asList(args);}
 Object proceed()throws Throwable{return proceed(args);}
 Object proceed(Object[] actual)throws Throwable {
  member.setAccessible(true);
  try{if(member instanceof Constructor<?>){owner=((Constructor<?>)member).newInstance(actual);return owner;}
      return ((Method)member).invoke(owner,actual);}
  catch(InvocationTargetException error){throw error.getCause();}
 }
}
Object invoke(Executable member,Object owner,Object... args)throws Throwable {
 Chain chain=new Chain(member,owner,args);Registration entry=hooks.get(member);
 return entry==null?chain.proceed():entry.interceptor.run(chain);
}
}""",
    "com/android/systemui/shade/NotificationShadeWindowView.java": """package com.android.systemui.shade;
public class NotificationShadeWindowView extends android.view.View {
public int calls,attached,detached;public android.view.MotionEvent last;
public void onAttachedToWindow(){attached++;}public void onDetachedFromWindow(){detached++;}
public boolean dispatchTouchEvent(android.view.MotionEvent event){calls++;last=event;return false;}
public boolean onInterceptTouchEvent(android.view.MotionEvent event){return true;}
}""",
    "com/android/systemui/shade/NotificationPanelViewController.java": """package com.android.systemui.shade;
public class NotificationPanelViewController {public boolean expanded;
public boolean isQsExpanded(){return expanded;}public void onQsExpansionChanged(float value){}
public void setDozing(boolean value,boolean animate){}
}""",
    "com/android/systemui/statusbar/policy/KeyguardStateControllerImpl.java": """package com.android.systemui.statusbar.policy;
public class KeyguardStateControllerImpl {public boolean showing=true,occluded;
public void notifyKeyguardState(boolean a,boolean b){showing=a;occluded=b;}
public boolean isShowing(){return showing;}public boolean isOccluded(){return occluded;}}
""",
}

MANAGER = """package com.android.systemui.statusbar.phone;
import com.android.systemui.statusbar.policy.KeyguardStateControllerImpl;
public class StatusBarKeyguardViewManager {
 public final KeyguardStateControllerImpl mKeyguardStateController=new KeyguardStateControllerImpl();
 public boolean mDozing,nativeBouncer;public int constructorCode,showCalls;public Object showArgument;
 public int reasonedCalls,legacyCalls;public boolean lastScrim,failReasoned,failLegacy;public String lastReason;
 public Selected mSelectedUserInteractor=new Selected();public Security mKeyguardSecurityModel=new Security();
 public Callback mViewMediatorCallback=new Callback();
 public StatusBarKeyguardViewManager(){}public StatusBarKeyguardViewManager(int code){
  if(code<0)throw new IllegalStateException("native constructor failed");constructorCode=code;}
 public void show(Object argument){showCalls++;showArgument=argument;}public void hide(long start,long duration){}
 public void reset(boolean value){}public void setOccluded(boolean value,boolean animate){}
 public void setDozing(boolean value){mDozing=value;}public void onDozingChanged(boolean value){}
 public void setQsExpansion(float value){}public boolean isBouncerShowing(){return nativeBouncer;}
 @@ENTRY@@
 public static final class Selected {public Object raw=7;public boolean fail;
  public Object getSelectedUserId(){if(fail)throw new IllegalStateException("selected user unavailable");return raw;}}
 public enum Mode {None,Pin,Password}
 public static final class Security {public Object mode=Mode.Pin;public int calls,lastUser;
  public Object getSecurityMode(int user){calls++;lastUser=user;return mode;}}
 public static final class Callback {public int calls,lastUser;public boolean fail;
  public void keyguardDone(int user){calls++;lastUser=user;if(fail)throw new IllegalStateException("native completion failed");}}
}
"""
REASONED = """public void showPrimaryBouncer(boolean value,String reason){reasonedCalls++;lastScrim=value;lastReason=reason;
if(failReasoned)throw new IllegalStateException("native reasoned failed");}"""
LEGACY = """public void showPrimaryBouncer(boolean value){legacyCalls++;lastScrim=value;
if(failLegacy)throw new IllegalStateException("native legacy failed");}"""

HARNESS = r"""package ls.augment.com.hook;
import java.lang.reflect.*;import android.view.MotionEvent;
import com.android.systemui.statusbar.phone.StatusBarKeyguardViewManager;
import com.android.systemui.shade.NotificationShadeWindowView;
import io.github.libxposed.api.XposedInterface;
public final class TestLiftArcUnlockRuntime {
 static final String VARIANT="@@VARIANT@@";static int checks;
 static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(VARIANT+": "+message);}
 static class Missing {}
 static class WrongReturn {public boolean showPrimaryBouncer(boolean value){return value;}}
 static class WrongArguments {public void showPrimaryBouncer(Boolean value){}public void showPrimaryBouncer(boolean value,CharSequence reason){}}
 static class StaticEntry {public static void showPrimaryBouncer(boolean value){}}
 abstract static class AbstractEntry {public abstract void showPrimaryBouncer(boolean value);}
 static class ParentEntry {int calls;private void showPrimaryBouncer(boolean value){calls++;}}
 static class InheritedEntry extends ParentEntry {}
 static void resolver()throws Exception {
  for(Class<?> type:new Class<?>[]{Missing.class,WrongReturn.class,WrongArguments.class,StaticEntry.class,AbstractEntry.class}){
   check(!LiftArcUnlockEntry.supported(type),"unsupported native contract rejected: "+type);
   try{LiftArcUnlockEntry.require(type);throw new AssertionError("missing entry accepted");}catch(NoSuchMethodException expected){checks++;}
  }
  check(!LiftArcUnlockEntry.supported(null),"null class has no native entry");
  InheritedEntry inherited=new InheritedEntry();check(LiftArcUnlockEntry.supported(inherited.getClass()),"inherited exact entry supported");
  LiftArcUnlockEntry.show(inherited);check(inherited.calls==1,"inherited private native entry invoked once");
 }
 static AugmentModule install(){
  LiftArcUnlock.capture(null);LiftArcRuntime.installed=false;LiftArcRuntime.errors.clear();
  AugmentModule module=new AugmentModule();LiftArcHooks.install(module,TestLiftArcUnlockRuntime.class.getClassLoader());return module;
 }
 static void noOwner(){
  LiftArcUnlock.capture(null);check(!LiftArcRuntime.ready&&LiftArcUnlock.manager()==null,"clear capture removes readiness");
  check(!LiftArcUnlock.show(),"no captured manager cannot request unlock");
  LiftArcUnlock.capture(new Missing());check(!LiftArcRuntime.ready&&LiftArcUnlock.manager()==null,"object without native entry is not ready");
 }
 static void touch(AugmentModule module)throws Throwable {
  NotificationShadeWindowView window=new NotificationShadeWindowView();
  Method dispatch=window.getClass().getDeclaredMethod("dispatchTouchEvent",MotionEvent.class);
  MotionEvent original=new MotionEvent(2);LiftArcController.mode=LiftArcController.TOUCH_PASS;
  check(Boolean.FALSE.equals(module.invoke(dispatch,window,original)),"pass preserves native result");
  check(window.last==original&&window.calls==1,"pass preserves original event");int posts=LiftArcController.post;
  LiftArcController.mode=LiftArcController.TOUCH_SWALLOW;
  check(Boolean.TRUE.equals(module.invoke(dispatch,window,original)),"owned gesture swallowed");
  check(window.calls==1&&LiftArcController.post==posts,"swallow skips native and post callback");
  LiftArcController.mode=LiftArcController.TOUCH_PASS_AS_CANCEL;
  check(Boolean.TRUE.equals(module.invoke(dispatch,window,original)),"cancel handoff retains owned result");
  check(window.calls==2&&window.last!=original&&window.last.action==MotionEvent.ACTION_CANCEL&&window.last.recycled,
        "cancel copy sent to native and recycled");check(original.action==2&&!original.recycled,"original event unchanged");
  LiftArcController.intercept=0;Method intercept=window.getClass().getDeclaredMethod("onInterceptTouchEvent",MotionEvent.class);
  check(Boolean.TRUE.equals(module.invoke(intercept,window,original)),"unowned intercept stays native");
  LiftArcController.intercept=LiftArcController.INTERCEPT_NO;
  check(Boolean.FALSE.equals(module.invoke(intercept,window,original)),"handle gesture bypasses native interception");
  module.invoke(window.getClass().getDeclaredMethod("onAttachedToWindow"),window);
  module.invoke(window.getClass().getDeclaredMethod("onDetachedFromWindow"),window);
  check(window.attached==1&&window.detached==1&&LiftArcController.attached==1&&LiftArcController.detached==1,
        "window ownership callbacks still run after/before original");
 }
 static int bouncerCalls(StatusBarKeyguardViewManager owner){return owner.reasonedCalls+owner.legacyCalls;}
 static void secure(StatusBarKeyguardViewManager owner){
  owner.mSelectedUserInteractor=new StatusBarKeyguardViewManager.Selected();owner.mKeyguardSecurityModel=new StatusBarKeyguardViewManager.Security();
  owner.mViewMediatorCallback=new StatusBarKeyguardViewManager.Callback();owner.reasonedCalls=owner.legacyCalls=0;
  owner.failReasoned=owner.failLegacy=false;LiftArcRuntime.errors.clear();LiftArcUnlock.capture(owner);
 }
 static void nativeRequest(StatusBarKeyguardViewManager owner){
  int before=bouncerCalls(owner);check(LiftArcUnlock.show(),"secure native request accepted");
  check(bouncerCalls(owner)==before+1&&owner.lastScrim,"native bouncer receives original true scrim argument");
  check(owner.mViewMediatorCallback==null||owner.mViewMediatorCallback.calls==0,"secure/unknown mode never completes authentication");
 }
 static void security(StatusBarKeyguardViewManager owner){
  secure(owner);nativeRequest(owner);
  check(owner.reasonedCalls==(VARIANT.equals("single")?0:1)&&owner.legacyCalls==(VARIANT.equals("single")?1:0),
        "double signature preferred, single used only when double absent");
  if(!VARIANT.equals("single"))check("redmagic_duo_liftarc".equals(owner.lastReason),"Android 16 request reason unchanged");
  for(Object unknown:new Object[]{null,-1,Long.valueOf(0),"0"}){
   secure(owner);owner.mSelectedUserInteractor.raw=unknown;owner.mKeyguardSecurityModel.mode=StatusBarKeyguardViewManager.Mode.None;
   nativeRequest(owner);check(owner.mKeyguardSecurityModel.calls==0,"unknown/invalid user never assumes user zero");
  }
  secure(owner);owner.mSelectedUserInteractor=null;nativeRequest(owner);
  secure(owner);owner.mSelectedUserInteractor.fail=true;nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel=null;nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel.mode="None";nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel.mode=null;nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel.mode=StatusBarKeyguardViewManager.Mode.Password;nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel.mode=StatusBarKeyguardViewManager.Mode.None;owner.mViewMediatorCallback=null;nativeRequest(owner);
  secure(owner);owner.mKeyguardSecurityModel.mode=StatusBarKeyguardViewManager.Mode.None;
  check(LiftArcUnlock.show(),"exact native None route remains available");
  check(owner.mViewMediatorCallback.calls==1&&owner.mViewMediatorCallback.lastUser==7&&owner.mKeyguardSecurityModel.lastUser==7
        &&bouncerCalls(owner)==0,"native None completion uses the actual selected user only");
  secure(owner);owner.failReasoned=true;
  if(VARIANT.equals("both")){
   check(LiftArcUnlock.show()&&owner.reasonedCalls==1&&owner.legacyCalls==1&&LiftArcRuntime.errors.isEmpty(),
         "existing double-failure single fallback retained");
  }else if(VARIANT.equals("double")){
   check(!LiftArcUnlock.show()&&owner.reasonedCalls==1&&LiftArcRuntime.errors.size()==1,"native request failure is reported");
  }
  secure(owner);owner.failReasoned=owner.failLegacy=true;
  check(!LiftArcUnlock.show()&&LiftArcRuntime.errors.size()==1,"all supported native routes failing returns false");
  check(owner.mViewMediatorCallback.calls==0,"request failure cannot bypass authentication");
 }
 public static void main(String[] args)throws Throwable {
  resolver();noOwner();AugmentModule module=install();boolean supported=!VARIANT.equals("missing");
  check(LiftArcRuntime.installed==supported,"installation matches exact native contract");
  check(!LiftArcRuntime.ready&&LiftArcUnlock.manager()==null,"registration alone never claims captured manager readiness");
  long constructors=module.hooks.keySet().stream().filter(m->m instanceof Constructor<?>).count();
  check(constructors==(supported?2:0),"constructors registered only for supported contract");
  check(module.errors.size()==(supported?0:1),"missing entry has one installation error");
  touch(module);
  StatusBarKeyguardViewManager existing=new StatusBarKeyguardViewManager();
  Object argument=new Object();module.invoke(existing.getClass().getDeclaredMethod("show",Object.class),existing,argument);
  check(existing.showCalls==1&&existing.showArgument==argument,"manager observation preserves original show behavior");
  check(LiftArcRuntime.ready==supported&&LiftArcUnlock.manager()==(supported?existing:null),"late native callback captures only supported manager");
  if(supported){
   noOwner();Constructor<?> constructor=existing.getClass().getDeclaredConstructor(int.class);
   AugmentModule.Registration registration=module.hooks.get(constructor);
   check(registration.mode==XposedInterface.ExceptionMode.PROTECTIVE,"constructor keeps protective exception mode");
   try{module.invoke(constructor,null,-1);throw new AssertionError("constructor failure swallowed");}
   catch(IllegalStateException expected){check(!LiftArcRuntime.ready&&LiftArcUnlock.manager()==null,"failed native constructor never captured");}
   StatusBarKeyguardViewManager created=(StatusBarKeyguardViewManager)module.invoke(constructor,null,31);
   check(created.constructorCode==31&&LiftArcUnlock.manager()==created&&LiftArcRuntime.ready,"successful native constructor captures real result");
   check(LiftArcController.showing&&!LiftArcController.occluded&&!LiftArcController.dozing&&!LiftArcController.bouncer,
         "capture still synchronizes native keyguard state");
   module.invoke(created.getClass().getDeclaredMethod("setQsExpansion",float.class),created,.5f);check(LiftArcController.qs,"QS observation retained");
   module.invoke(created.getClass().getDeclaredMethod("setQsExpansion",float.class),created,0f);check(!LiftArcController.qs,"QS close observation retained");
   module.invoke(created.getClass().getDeclaredMethod("setDozing",boolean.class),created,true);check(LiftArcController.dozing,"native dozing still synchronized");
   security(created);
  }else check(!LiftArcUnlock.show(),"missing entry never requests authentication");
  noOwner();System.out.println("PASS LiftArc native unlock "+VARIANT+": "+checks+" assertions (offline facades)");
 }
}
"""


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK bin directory or installation directory")
    args = parser.parse_args()
    candidates = [args.jdk]
    if os.environ.get("JAVA_HOME"):
        candidates.append(Path(os.environ["JAVA_HOME"]) / "bin")
    if shutil.which("javac"):
        candidates.append(Path(shutil.which("javac")).resolve().parent)
    candidates.append(Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin"))
    candidates = [p / "bin" if p and (p / "bin").is_dir() else p for p in candidates]
    jdk = next((p for p in candidates if p and ((p / "javac.exe").is_file() or (p / "javac").is_file())), None)
    if not jdk:
        parser.error("Pass --jdk or set JAVA_HOME")
    suffix = ".exe" if (jdk / "javac.exe").is_file() else ""
    with tempfile.TemporaryDirectory(prefix="liftarc-unlock-runtime-") as temporary:
        for variant, entry in {"single": LEGACY, "double": REASONED, "both": REASONED + LEGACY, "missing": ""}.items():
            folder = Path(temporary) / variant
            files = dict(STUBS)
            files["com/android/systemui/statusbar/phone/StatusBarKeyguardViewManager.java"] = MANAGER.replace("@@ENTRY@@", entry)
            files["ls/augment/com/hook/TestLiftArcUnlockRuntime.java"] = HARNESS.replace("@@VARIANT@@", variant)
            sources = []
            for name, code in files.items():
                path = folder / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(code, encoding="utf-8")
                sources.append(str(path))
            sources.extend(str(HOOK / name) for name in ("LiftArcHooks.java", "LiftArcUnlock.java", "LiftArcUnlockEntry.java", "SystemUiAdapter.java"))
            subprocess.run([str(jdk / ("javac" + suffix)), "-encoding", "UTF-8", "--release", "17", "-d", str(folder / "classes"), *sources], check=True, timeout=60)
            subprocess.run([str(jdk / ("java" + suffix)), "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.hook.TestLiftArcUnlockRuntime"], check=True, timeout=30)
    print("Production LiftArc contracts, capture, native authentication boundaries and touch handoff passed; no device used.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
