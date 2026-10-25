"""Run the production IME hooks against a ROM that forces fallback policy to LOCAL."""
from pathlib import Path
import runpy
import tempfile
import argparse,difflib,hashlib,json,os,subprocess,sys
ROOT=Path(__file__).resolve().parents[1]

HOME = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-hook.py")))
SUPPORT = HOME["SUPPORT"]
SOURCES = {key: HOME["SOURCES"][key] for key in (
    "io/github/libxposed/api/XposedInterface.java",
    "android/content/pm/ApplicationInfo.java",
    "android/os/Binder.java", "android/os/Process.java",
    "ls/augment/com/hook/AugmentModule.java",
)}
SOURCES["ls/augment/com/hook/AugmentModule.java"] = SOURCES["ls/augment/com/hook/AugmentModule.java"].replace(
    "public int errors;", "public int errors,prepareCalls,failPrepareAt,intercepts;").replace(
    "callbacks.put(method,c);", "intercepts++;callbacks.put(method,c);").replace(
    "ids.add(id);return new Builder(m);", "if(++prepareCalls==failPrepareAt)throw new IllegalStateException(\"injected registration failure\");ids.add(id);return new Builder(m);")
SOURCES.update({
    "android/content/Context.java": "package android.content;public class Context {public final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public android.content.pm.PackageManager getPackageManager(){return pm;}}",
    "android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager {public int uid=10055;public ApplicationInfo getApplicationInfoAsUser(String p,int f,int u){if(!p.equals(\"ls.augment.com\"))throw new AssertionError(p);ApplicationInfo a=new ApplicationInfo();a.uid=uid;return a;}}",
    "android/view/Display.java": '''package android.view;public class Display {public static final int TYPE_VIRTUAL=5,FLAG_TRUSTED=128,FLAG_OWN_FOCUS=2048;public int id=88,owner=0,type=5,flags=2176;public String name="DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc",unique="virtual:root,88";
     public int getDisplayId(){return id;}public int getOwnerUid(){return owner;}public int getType(){return type;}public int getFlags(){return flags;}public String getName(){return name;}public String getUniqueId(){return unique;}}''',
    "com/android/server/wm/WindowContainer.java": "package com.android.server.wm;public class WindowContainer {public WindowManagerService mWmService;}",
    "com/android/server/wm/DisplayContent.java": '''package com.android.server.wm;public class DisplayContent extends WindowContainer {public android.view.Display mDisplay=new android.view.Display();public int requested=1,originalCalls,vendorPolicy=0;public boolean vendorOverride=true;public int getDisplayId(){return mDisplay.id;}public int getImePolicy(){originalCalls++;return requested==1&&vendorOverride?vendorPolicy:requested;}}''',
    "com/android/server/wm/RootWindowContainer.java": "package com.android.server.wm;public class RootWindowContainer {public DisplayContent display=new DisplayContent();public DisplayContent getDisplayContent(int id){return display!=null&&display.getDisplayId()==id?display:null;}}",
    "com/android/server/wm/DisplayWindowSettings.java": "package com.android.server.wm;public class DisplayWindowSettings {public int getImePolicyLocked(DisplayContent c){return c.requested;}}",
    "com/android/server/wm/WindowManagerService.java": '''package com.android.server.wm;import android.os.Binder;public class WindowManagerService {public final Object mGlobalLock=new Object();public RootWindowContainer mRoot=new RootWindowContainer();public DisplayWindowSettings mDisplayWindowSettings=new DisplayWindowSettings();public android.content.Context mContext=new android.content.Context();public ls.augment.com.hook.AugmentModule module;public boolean fail;public int cached=-1,setCalls;
     public WindowManagerService(){mRoot.display.mWmService=this;}public void setDisplayImePolicy(int id,int policy)throws Throwable {setCalls++;DisplayContent c=mRoot.getDisplayContent(id);if(c==null)return;c.requested=policy;long token=Binder.clearCallingIdentity();try{cached=(Integer)module.invoke(c,"getImePolicy",new Class<?>[0]);}finally{Binder.restoreCallingIdentity(token);}if(fail)throw new IllegalStateException("injected setter failure");}}''',
})

TEST = r'''package ls.augment.com.hook;
import android.os.*;import com.android.server.wm.*;import java.lang.reflect.*;import java.util.*;
public final class TestWorkbenchImeHook {
 static int tests,checks;static void check(boolean yes,String message){checks++;if(!yes)throw new AssertionError(message);}
 interface Case{void run()throws Throwable;}static void test(String name,Case action)throws Throwable{action.run();tests++;System.out.println("PASS production IME hook: "+name);}
 static final class Fixture {final AugmentModule module=new AugmentModule();final WindowManagerService service=new WindowManagerService();final DisplayContent content=service.mRoot.display;
  Fixture()throws Exception{for(String name:new String[]{"installed","policyHookInstalled","ownerHookInstalled"}){Field installed=AtomicWorkbenchImeHook.class.getDeclaredField(name);installed.setAccessible(true);installed.set(null,false);}Field map=AtomicWorkbenchImeHook.class.getDeclaredField("DISPLAYS");map.setAccessible(true);((Map<?,?>)map.get(null)).clear();Binder.uid=0;Binder.pid=123;android.os.Process.processUid=0;service.module=module;}
  void install(){check(AtomicWorkbenchImeHook.install(module,getClass().getClassLoader())==2&&AtomicWorkbenchImeHook.isInstalled(),"required hooks not installed");}
  void set(int requested)throws Throwable{module.invoke(service,"setDisplayImePolicy",new Class<?>[]{int.class,int.class},content.getDisplayId(),requested);}
  int get()throws Throwable{return (Integer)module.invoke(content,"getImePolicy",new Class<?>[0]);}
 }
 public static void main(String[] args)throws Throwable{
  test("authenticated root request repairs synchronous ROM cache before HOME exists",()->{Fixture f=new Fixture();f.install();check(f.get()==0,"name alone authenticated a display");f.set(1);check(f.service.cached==1&&f.get()==1,"ROM policy did not become phone fallback synchronously");check(f.content.originalCalls==3,"original policy evaluation was bypassed");check(f.service.setCalls==1,"setter ran twice");check(f.module.logs.size()==1&&f.module.logs.get(0).contains("rom_actual=0;actual=1"),"correction lacks bounded diagnostic");f.get();check(f.module.logs.size()==1,"repeated reads spam diagnostics");});
  test("LOCAL and HIDE requests keep ROM semantics",()->{Fixture f=new Fixture();f.install();f.set(1);for(int requested:new int[]{0,2}){f.set(requested);check(f.service.cached==requested&&f.get()==requested,"non-fallback policy changed");}});
  test("ROM already honoring fallback stays unchanged",()->{Fixture f=new Fixture();f.content.vendorOverride=false;f.install();f.set(1);check(f.get()==1&&f.module.logs.isEmpty(),"native fallback treated as a ROM correction");});
  test("ROM hide or unknown effective results are never broadened",()->{for(int policy:new int[]{2,-1,3}){Fixture f=new Fixture();f.install();f.content.vendorPolicy=policy;f.set(1);check(f.get()==policy,"effective ROM result was broadened: "+policy);}});
  test("unprivileged and system callers cannot register a display",()->{for(int uid:new int[]{10055,1000}){Fixture f=new Fixture();f.install();Binder.uid=uid;f.set(1);check(f.get()==0,"non-root caller registered an identity");}});
  test("full canonical name and module app UID are required",()->{for(String name:new String[]{"presentation","DuoAtomic-10055-w8-12345678-1234-1234-1234-123456789abc","DuoAtomic-10055-w0-1-1-1-1-1","DuoAtomic-10056-w0-12345678-1234-1234-1234-123456789abc","DuoAtomic-110055-w0-12345678-1234-1234-1234-123456789abc"}){Fixture f=new Fixture();f.install();f.content.mDisplay.name=name;f.set(1);check(f.get()==0,"foreign/malformed display authenticated: "+name);}});
  test("secondary-user package identity is resolved in that user",()->{Fixture f=new Fixture();f.install();f.content.mDisplay.name="DuoAtomic-110055-w3-12345678-1234-1234-1234-123456789abc";f.service.mContext.pm.uid=110055;f.set(1);check(f.get()==1,"valid secondary user rejected");});
  test("virtual root ownership trusted own-focus and unique ID are required",()->{for(int mutation=0;mutation<6;mutation++){Fixture f=new Fixture();f.install();switch(mutation){case 0:f.content.mDisplay.owner=10055;break;case 1:f.content.mDisplay.type=1;break;case 2:f.content.mDisplay.flags=2048;break;case 3:f.content.mDisplay.flags=128;break;case 4:f.content.mDisplay.unique="";break;case 5:f.content.mDisplay.id=0;break;}f.set(1);check(f.get()==0,"invalid identity registered: "+mutation);}});
  test("requesting process must be live root and remains part of identity",()->{Fixture f=new Fixture();f.install();android.os.Process.processUid=-1;f.set(1);check(f.get()==0,"dead caller registered");android.os.Process.processUid=0;f.set(1);check(f.get()==1,"live root cannot register");android.os.Process.processUid=10055;check(f.get()==0,"reused non-root PID retained override");android.os.Process.processUid=0;check(f.get()==0,"invalidated process identity revived without a new request");});
  test("identity drift invalidates exact object name unique ID and flags",()->{for(int mutation=0;mutation<6;mutation++){Fixture f=new Fixture();f.install();f.set(1);switch(mutation){case 0:f.content.mDisplay.unique="replacement";break;case 1:f.content.mDisplay.name="renamed";break;case 2:f.content.mDisplay.owner=10055;break;case 3:f.content.mDisplay.flags=128;break;case 4:f.service.mRoot.display=new DisplayContent();break;case 5:f.content.mWmService=new WindowManagerService();break;}check(f.get()==0,"mutated identity kept override: "+mutation);}});
  test("foreign displays retain their original result after another display registered",()->{Fixture f=new Fixture();f.install();f.set(1);DisplayContent other=new DisplayContent();other.mWmService=f.service;check((Integer)f.module.invoke(other,"getImePolicy",new Class<?>[0])==0,"display name or number reused another object's registration");});
  test("failed setter discards provisional authentication and propagates once",()->{Fixture f=new Fixture();f.install();f.service.fail=true;boolean failed=false;try{f.set(1);}catch(IllegalStateException expected){failed=true;}check(failed&&f.service.setCalls==1,"setter failure swallowed or original ran twice");check(f.get()==0,"failed setter retained provisional registration");});
  test("partial hook installation is never ready and cannot alter a policy",()->{Fixture f=new Fixture();f.module.failDeopt=true;check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==0&&!AtomicWorkbenchImeHook.isInstalled(),"failed installation reported ready");f.set(1);check(f.get()==0,"partial installation changed ROM behavior");});
  test("retry only registers the missing callback and successful installs are idempotent",()->{Fixture f=new Fixture();f.module.failPrepareAt=2;check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==0&&!AtomicWorkbenchImeHook.isInstalled(),"incomplete callbacks reported ready");check(f.module.intercepts==1,"fixture did not retain one installed callback");f.set(1);check(f.get()==0,"partial registration changed policy");f.module.failPrepareAt=0;f.install();check(f.module.intercepts==2,"retry duplicated the existing callback");f.install();check(f.module.intercepts==2,"successful installation duplicated callbacks");f.set(1);check(f.get()==1,"retry did not restore working phone IME routing");});
  System.out.println("WORKBENCH IME HOOK RESULT "+tests+" passed; "+checks+" assertions");
 }
}'''



WMS = r'''package com.android.server.wm;
import android.os.*;
public class WindowManagerService {
 public final Object mGlobalLock=new Object(); public RootWindowContainer mRoot=new RootWindowContainer();
 public DisplayWindowSettings mDisplayWindowSettings=new DisplayWindowSettings();
 public android.content.Context mContext=new android.content.Context();
 public ls.augment.com.hook.AugmentModule module;
 public boolean fail,permission=true,throwCreate,returnForeign,returnNull;
 public int cached=-1,setCalls,createCalls,permissionChecks,createdBeforeClear;
 public Runnable beforeCreate,afterSet;
 public final SecurityException permissionFailure=new SecurityException("controlled permission rejection");
 public final IllegalStateException setterFailure=new IllegalStateException("controlled setter rejection");
 public final IllegalStateException createFailure=new IllegalStateException("controlled creation rejection");
 public WindowManagerService(){mRoot.display.mWmService=this;}
 public DisplayContent getDisplayContentOrCreate(int id,IBinder token) {
  createCalls++; if(Binder.uid!=1000)createdBeforeClear++;
  if(!Thread.holdsLock(mGlobalLock))throw new AssertionError("creation outside original WMS lock");
  if(throwCreate)throw createFailure;
  if(beforeCreate!=null){Runnable r=beforeCreate;beforeCreate=null;r.run();}
  if(returnNull)return null;
  if(mRoot.display==null){mRoot.display=new DisplayContent();mRoot.display.mWmService=this;}
  if(returnForeign){DisplayContent other=new DisplayContent();other.mWmService=this;return other;}
  return mRoot.getDisplayContent(id);
 }
 public void setDisplayImePolicy(int id,int policy)throws Throwable {
  setCalls++;permissionChecks++;if(!permission)throw permissionFailure;
  long token=Binder.clearCallingIdentity();
  try{synchronized(mGlobalLock){
   DisplayContent c=(DisplayContent)module.invoke(this,"getDisplayContentOrCreate",new Class<?>[]{int.class,IBinder.class},id,null);
   if(c==null)return;
   c.requested=policy;
   cached=(Integer)module.invoke(c,"getImePolicy",new Class<?>[0]);
   if(afterSet!=null){Runnable r=afterSet;afterSet=null;r.run();}
   if(fail)throw setterFailure;
  }}finally{Binder.restoreCallingIdentity(token);}
 }
}'''

EXTRA = r'''
 static java.util.List<String> policyLogs(Fixture f){return f.module.logs.stream().filter(s->s.startsWith("ATOMIC_WORKBENCH_IME_POLICY ")).toList();}
 static java.util.List<String> ownerLogs(Fixture f){return f.module.logs.stream().filter(s->s.startsWith("ATOMIC_WORKBENCH_IME_OWNER_REQUEST ")).toList();}
 static final class FaultLocal extends ThreadLocal<Object> {
  boolean getOnce,removeFails,clearSetFails;
  public Object get(){if(getOnce){getOnce=false;throw new IllegalStateException("controlled get fault");}return super.get();}
  public void remove(){if(removeFails)throw new IllegalStateException("controlled remove fault");super.remove();}
  public void set(Object value){if(value==null&&clearSetFails)throw new IllegalStateException("controlled clear fault");super.set(value);}
 }
 static Object replaceLocal(Object value)throws Exception {
  Field field=AtomicWorkbenchImeHook.class.getDeclaredField("OWNER_REQUEST");field.setAccessible(true);Object old=field.get(null);
  Field singleton=sun.misc.Unsafe.class.getDeclaredField("theUnsafe");singleton.setAccessible(true);sun.misc.Unsafe unsafe=(sun.misc.Unsafe)singleton.get(null);
  unsafe.putObjectVolatile(unsafe.staticFieldBase(field),unsafe.staticFieldOffset(field),value);return old;
 }
 static void coldOnly()throws Throwable {
  Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.set(1);
  check(f.service.cached==1,"COLD_DC_ORIGINAL_SETTER_CACHE_NOT_REPAIRED");
  check(f.service.setCalls==1&&f.service.createCalls==1&&f.service.permissionChecks==1&&f.service.createdBeforeClear==0,"original setter/permission/clear/create order changed");
 }
 static boolean registered(DisplayContent content)throws Exception {
  Field field=AtomicWorkbenchImeHook.class.getDeclaredField("DISPLAYS");field.setAccessible(true);
  return ((Map<?,?>)field.get(null)).containsKey(content);
 }
 static void invokeCreate(Fixture f,android.os.IBinder token){
  try{f.module.invoke(f.service,"getDisplayContentOrCreate",new Class<?>[]{int.class,android.os.IBinder.class},88,token);}
  catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}
 }
 static void setUnchecked(Fixture f,int policy){try{f.set(policy);}catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
 static void extra()throws Throwable {
  test("cold DC is authenticated only after the original permission/clear/create path",()->coldOnly());
  test("cold original permission failure creates nothing and propagates the same exception",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.service.permission=false;Throwable seen=null;
   try{f.set(1);}catch(Throwable e){seen=e;}
   check(seen==f.service.permissionFailure&&f.service.setCalls==1&&f.service.permissionChecks==1&&f.service.createCalls==0&&f.service.mRoot.display==null,"permission order or exception changed");
  });
  test("cold creation throw remains the original throw and leaves no scoped registration",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.service.throwCreate=true;Throwable seen=null;
   try{f.set(1);}catch(Throwable e){seen=e;}
   check(seen==f.service.createFailure&&f.service.createCalls==1&&f.service.mRoot.display==null,"creation failure changed");
   f.service.throwCreate=false; synchronized(f.service.mGlobalLock){invokeCreate(f,null);}
   check(!registered(f.service.mRoot.display),"failed setter leaked a request scope");
  });
  test("cold setter throw rolls provisional registration back and preserves the exact throw",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.service.fail=true;Throwable seen=null;
   try{f.set(1);}catch(Throwable e){seen=e;}
   check(seen==f.service.setterFailure&&f.service.setCalls==1&&!registered(f.service.mRoot.display),"failed original setter retained authority");
  });
  test("cold malformed names and non-root callers remain unregistered",()->{
   for(int mutation=0;mutation<3;mutation++){
    Fixture f=new Fixture();f.install();f.service.mRoot.display=null;
    if(mutation==0)Binder.uid=10055;if(mutation==1)Binder.uid=1000;
    if(mutation==2){f.service.beforeCreate=()->{f.service.mRoot.display=new DisplayContent();f.service.mRoot.display.mWmService=f.service;f.service.mRoot.display.mDisplay.name="foreign";};}
    f.set(1);check(f.service.cached==0&&!registered(f.service.mRoot.display),"foreign cold display gained fallback");
   }
  });
  test("cold LOCAL and HIDE setters do not open fallback authority",()->{
   for(int policy:new int[]{0,2}){Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.set(policy);
    check(f.service.cached==policy&&!registered(f.service.mRoot.display),"non-fallback cold request registered");}
  });
  test("an ordinary get-or-create outside a setter never registers",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;
   synchronized(f.service.mGlobalLock){long token=Binder.clearCallingIdentity();try{invokeCreate(f,null);}finally{Binder.restoreCallingIdentity(token);}}
   check(!registered(f.service.mRoot.display)&&f.service.setCalls==0,"unscoped creation gained authority");
  });
  test("non-null token create within an active cold setter does not register",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;
   f.service.beforeCreate=()->{invokeCreate(f,new android.os.IBinder(){});try{check(!registered(f.service.mRoot.display),"token creation borrowed the setter authority");}catch(Exception e){throw new RuntimeException(e);}};
   f.set(1);check(f.service.cached==1&&registered(f.service.mRoot.display),"valid final null-token route was lost");
  });
  test("nested HIDE setter cannot inherit the parent request and parent resumes afterwards",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;
   f.service.beforeCreate=()->{setUnchecked(f,2);try{check(f.service.cached==2&&!registered(f.service.mRoot.display),"nested non-fallback inherited root request");}catch(Exception e){throw new RuntimeException(e);}};
   f.set(1);check(f.service.cached==1&&registered(f.service.mRoot.display)&&f.service.setCalls==2,"parent request was not restored");
  });
  test("foreign service creation during an active setter cannot acquire the parent principal",()->{
   Fixture f=new Fixture();f.install();WindowManagerService other=new WindowManagerService();other.module=f.module;other.mRoot.display=null;f.service.mRoot.display=null;
   f.service.beforeCreate=()->{synchronized(other.mGlobalLock){try{f.module.invoke(other,"getDisplayContentOrCreate",new Class<?>[]{int.class,android.os.IBinder.class},88,null);check(!registered(other.mRoot.display),"foreign service gained parent authority");}catch(Throwable e){throw new RuntimeException(e);}}};
   f.set(1);check(f.service.cached==1&&registered(f.service.mRoot.display),"foreign callback lost legitimate request");
  });
  test("returned DC must be the current exact root mapping",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;f.service.returnForeign=true;f.set(1);
   check(f.service.cached==0&&!registered(f.service.mRoot.display),"unmapped returned object registered");
  });
  test("later successful nested registration survives outer setter throw",()->{
   Fixture f=new Fixture();f.install();f.set(1);
   Field mapField=AtomicWorkbenchImeHook.class.getDeclaredField("DISPLAYS");mapField.setAccessible(true);Map<?,?> map=(Map<?,?>)mapField.get(null);Object before=map.get(f.content);
   final Object[] nested={null};f.service.fail=true;
   // Permit only the nested setter to return successfully.
   f.service.afterSet=()->{int calling=Binder.uid;Binder.uid=0;f.service.fail=false;try{setUnchecked(f,1);nested[0]=map.get(f.content);}finally{Binder.uid=calling;f.service.fail=true;}};
   Throwable seen=null;try{f.set(1);}catch(Throwable e){seen=e;}
   check(seen==f.service.setterFailure&&nested[0]!=null&&nested[0]!=before&&map.get(f.content)==nested[0],"outer rollback erased a successful nested identity");
  });
  test("missing internal observer keeps both existing public capabilities unavailable",()->{
   Fixture f=new Fixture();f.module.failPrepareAt=2;
   check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==0&&!AtomicWorkbenchImeHook.isInstalled(),"internal observer failure reported installed");
   f.set(1);check(f.service.cached==0,"partial installation changed policy");
  });
  test("nested context get/remove failure cannot grant the parent request to HIDE",()->{
   Fixture f=new Fixture();f.install();FaultLocal local=new FaultLocal();Object old=replaceLocal(local);
   try{f.service.mRoot.display=null;f.service.beforeCreate=()->{local.getOnce=true;local.removeFails=true;setUnchecked(f,2);try{check(f.service.cached==2&&!registered(f.service.mRoot.display),"faulting nested HIDE inherited parent authority");}catch(Exception e){throw new RuntimeException(e);}};
    f.set(1);check(!registered(f.service.mRoot.display)&&f.service.cached==0&&Binder.uid==0,"faulting context was revived or changed original completion");
   }finally{replaceLocal(old);}
  });
  test("terminal cleanup failure leaves only an inactive request",()->{
   Fixture f=new Fixture();f.install();FaultLocal local=new FaultLocal();Object old=replaceLocal(local);
   try{f.service.mRoot.display=null;f.service.returnNull=true;f.service.beforeCreate=()->{local.removeFails=true;local.clearSetFails=true;};f.set(1);
    f.service.returnNull=false;synchronized(f.service.mGlobalLock){long token=Binder.clearCallingIdentity();try{invokeCreate(f,null);}finally{Binder.restoreCallingIdentity(token);}}
    check(!registered(f.service.mRoot.display),"retired request authorized a later unrelated create");
   }finally{replaceLocal(old);}
  });
  test("new owner diagnostics are bounded and only use current allowlisted metadata outside WMS lock",()->{
   Fixture f=new Fixture();f.install();f.service.mRoot.display=null;for(int i=0;i<40;i++)f.set(1);
   check(ownerLogs(f).size()==32&&f.module.ownerUnderLock==0,"owner diagnostic budget or lock boundary failed");
   String first=ownerLogs(f).get(0),safe=ls.augment.com.AtomicWorkbenchLogPolicy.safe(first);
   for(String field:new String[]{"stage=OWNER_REQUEST","display=88","root_pid=123","phase=COLD","original_state=ABSENT","native_result=RETURNED","registered=true","reason=NONE","result=SETTER_RETURNED","count=1"})check(safe.contains(field),"new diagnostic field was filtered: "+field);
   check(safe.length()<1536&&safe.split(" ").length<64,"owner diagnostic exceeded receiver budget");
  });
  test("owner diagnostic sink failure cannot change original result or retain request scope",()->{
   Fixture f=new Fixture();f.install();f.module.throwOwnerInfo=true;f.service.mRoot.display=null;f.set(1);
   check(f.service.cached==1&&f.service.setCalls==1&&registered(f.service.mRoot.display)&&f.module.ownerUnderLock==0,"diagnostic failure changed setter");
   Field field=AtomicWorkbenchImeHook.class.getDeclaredField("OWNER_REQUEST");field.setAccessible(true);check(((ThreadLocal<?>)field.get(null)).get()==null,"diagnostic failure retained scope");
  });
 }
'''

SOURCES["android/os/IBinder.java"]="package android.os; public interface IBinder {}"
SOURCES["com/android/server/wm/WindowManagerService.java"]=WMS
_module="ls/augment/com/hook/AugmentModule.java"
SOURCES[_module]=SOURCES[_module].replace('public int errors,','public boolean throwOwnerInfo;public Object lockToWatch;public int ownerUnderLock;public int errors,').replace('public void logFeatureInfo(String s){logs.add(s);}', 'public void logFeatureInfo(String s){if(s.startsWith("ATOMIC_WORKBENCH_IME_OWNER_REQUEST ")){if(lockToWatch!=null&&Thread.holdsLock(lockToWatch))ownerUnderLock++;if(throwOwnerInfo)throw new IllegalStateException("controlled owner diagnostic failure");}logs.add(s);}')

def item(path):
    path = Path(path)
    data = path.read_bytes()
    return {'path': str(path.resolve()), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest().upper()}

def run_case(out, source, name, test, sources):
    work = out / name
    work.mkdir()
    files = []
    for relative, text in sources.items():
        path = work / 'src' / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf-8')
        files.append(path)
    runner = work / 'src/ls/augment/com/hook/TestWorkbenchImeHook.java'
    runner.write_text(test, encoding='utf-8')
    files.append(runner)
    classes = work / 'classes'
    compile_command = [SUPPORT['JAVAC'], '--release', '17', '-encoding', 'UTF-8', '-d', str(classes), str(source), str(ROOT/'android/app/src/main/java/ls/augment/com/AtomicWorkbenchLogPolicy.java'), *map(str, files)]
    env = os.environ.copy();env['JAVA_TOOL_OPTIONS'] = '-Dfile.encoding=UTF-8'
    def invoke(command, phase):
        result = subprocess.run(command, capture_output=True, timeout=60, env=env)
        (work / (phase+'-stdout.txt')).write_bytes(result.stdout)
        (work / (phase+'-stderr.txt')).write_bytes(result.stderr)
        (work / (phase+'-command.json')).write_text(json.dumps(command, indent=2), encoding='utf-8')
        return result.returncode
    compiled = invoke(compile_command, 'compile')
    runtime = None if compiled else invoke([SUPPORT['JAVA'], '-cp', str(classes), 'ls.augment.com.hook.TestWorkbenchImeHook'], 'runtime')
    result = {'compileExit': compiled, 'runtimeExit': runtime, 'source': item(source), 'generatedJava': [item(p) for p in files]}
    (work/'result.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
    return result

def main():
    global ROOT
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root',type=Path,default=ROOT)
    parser.add_argument('--ime-source',type=Path)
    parser.add_argument('--baseline-source',type=Path)
    parser.add_argument('--out',type=Path)
    parser.add_argument('--negative-controls',action='store_true')
    args=parser.parse_args();ROOT=args.root.resolve()
    out=args.out.resolve() if args.out else Path(tempfile.mkdtemp(prefix='lsa-ime-cold-regression-'))
    if args.out:out.mkdir()
    source=(args.ime_source or ROOT/'android/app/src/main/java/ls/augment/com/hook/AtomicWorkbenchImeHook.java').resolve()
    sources=dict(SOURCES)
    common_test=TEST.replace('f.module.logs','policyLogs(f)').replace('service.module=module;', 'service.module=module;module.lockToWatch=service.mGlobalLock;try{Field reports=AtomicWorkbenchImeHook.class.getDeclaredField("OWNER_REPORTS");reports.setAccessible(true);((java.util.concurrent.atomic.AtomicLong)reports.get(null)).set(0);}catch(NoSuchFieldException ignored){}')
    test=common_test.replace('"ownerHookInstalled"}', '"ownerHookInstalled","contentHookInstalled"}').replace('f.module.intercepts==2','f.module.intercepts==3')
    test=test.replace(' public static void main(String[] args)throws Throwable{',EXTRA+'\n public static void main(String[] args)throws Throwable{\n  extra();')
    paths=[source,Path(__file__),ROOT/'android/app/src/main/java/ls/augment/com/AtomicWorkbenchLogPolicy.java']
    initial={str(p):item(p) for p in paths}
    baseline=None
    if args.baseline_source:
        baseline_test=common_test.replace(' public static void main(String[] args)throws Throwable{',EXTRA+'\n public static void main(String[] args)throws Throwable{\n  coldOnly();if(true)return;')
        baseline=run_case(out,args.baseline_source.resolve(),'baseline-cold',baseline_test,sources)
        stderr=(out/'baseline-cold/runtime-stderr.txt').read_text(encoding='utf-8') if baseline['runtimeExit'] is not None else ''
        baseline['expectedRuntimeRed']=baseline['compileExit']==0 and baseline['runtimeExit'] not in (None,0) and 'COLD_DC_ORIGINAL_SETTER_CACHE_NOT_REPAIRED' in stderr
    positive=run_case(out,source,'positive',test,sources)
    negatives=[]
    if args.negative_controls:
        candidate=source.read_text(encoding='utf-8')
        changes=[
            ('remove-cold-registration','synchronized (request.lock) { request.register(content); }','synchronized (request.lock) { }','COLD_DC_ORIGINAL_SETTER_CACHE_NOT_REPAIRED'),
            ('inherit-parent-scope','                clearOwnerRequest();\n                try {','                // mutation: retain active parent\n                if (parent != null) parent.active = parentActive;\n                try {','nested non-fallback inherited root request'),
            ('remove-throw-rollback','try { request.rollback(); } catch (Throwable unavailable) { }','try { } catch (Throwable unavailable) { }','failed original setter retained authority'),
            ('remove-terminal-retirement','if (request != null) request.active = false;','if (request != null) { }','retired request authorized a later unrelated create'),
        ]
        for name,old,new,witness in changes:
            assert candidate.count(old)==1,(name,'mutation anchor')
            path=out/(name+'-source')/'AtomicWorkbenchImeHook.java';path.parent.mkdir()
            path.write_text(candidate.replace(old,new),encoding='utf-8')
            result=run_case(out,path,name,test,sources)
            stderr=(out/name/'runtime-stderr.txt').read_text(encoding='utf-8') if result['runtimeExit'] is not None else ''
            result.update(expectedWitness=witness,killedAtRuntime=result['compileExit']==0 and result['runtimeExit'] not in (None,0) and witness in stderr)
            negatives.append(result)
    stable=all(item(p)==row for p,row in initial.items())
    good=positive['compileExit']==0 and positive['runtimeExit']==0 and stable and (baseline is None or baseline['expectedRuntimeRed']) and all(r['killedAtRuntime'] for r in negatives)
    summary=dict(status='PASS_CONTROLLED_PRODUCTION_IME_REGRESSION' if good else 'FAIL_CONTROLLED_PRODUCTION_IME_REGRESSION',positive=positive,baseline=baseline,negativeControls=negatives,sourceAndToolsStable=stable,inputs=initial,allPathsProven=False,phoneValidated=False,boundary='Actual complete ImeHook plus actual LogPolicy; controlled WMS/Display/identity/Xposed and host-only ThreadLocal fault injection. No Android API/phone proof.')
    (out/'summary.json').write_text(json.dumps(summary,indent=2),encoding='utf-8')
    if (out/'positive/runtime-stdout.txt').exists():print((out/'positive/runtime-stdout.txt').read_text(encoding='utf-8'),end='')
    print(json.dumps(dict(status=summary['status'],out=str(out),negativeControls=len(negatives),sourceAndToolsStable=stable)))
    raise SystemExit(0 if good else 1)

if __name__=='__main__':main()
