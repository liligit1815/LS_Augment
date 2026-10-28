"""Run the real focus-window and IME hooks against the observed ROM permission/session boundaries."""
from pathlib import Path
import argparse
import os
import runpy
import subprocess
import tempfile

IME = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-ime-hook.py")))
SUPPORT = IME["SUPPORT"]
SOURCES = dict(IME["SOURCES"])
SOURCES.update({
    "ls/augment/com/hook/HookTelemetry.java": 'package ls.augment.com.hook;class HookTelemetry {static void atomicWorkbench(String level,String value,Throwable error){}}',
    "android/content/pm/ApplicationInfo.java": 'package android.content.pm;public class ApplicationInfo {public int uid=10055;public String packageName="ls.augment.com";}',
    "android/os/IBinder.java": 'package android.os;public interface IBinder {boolean isBinderAlive();}',
    "android/os/Process.java": '''package android.os;public class Process {public static final java.util.Map<Integer,Integer> uids=new java.util.HashMap<>();public static boolean failPid;public static int myPid(){if(failPid)throw new LinkageError("injected diagnostic init failure");return 999;}public static int getUidForPid(int pid){return uids.getOrDefault(pid,-1);}}''',
    "android/view/Display.java": SOURCES["android/view/Display.java"].replace('FLAG_TRUSTED=128,FLAG_OWN_FOCUS=2048', 'DEFAULT_DISPLAY=0,FLAG_PRIVATE=4,FLAG_PRESENTATION=8,FLAG_TRUSTED=128,FLAG_OWN_FOCUS=2048').replace('return id;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return id;').replace('return owner;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return owner;').replace('return type;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return type;').replace('return flags;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return flags;').replace('return name;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return name;').replace('return unique;', 'com.android.server.display.DisplayManagerService.outsideDeviceLock();return unique;'),
    "android/hardware/display/DisplayManagerInternal.java": 'package android.hardware.display;public abstract class DisplayManagerInternal {}',
    "com/android/server/display/DisplayDeviceInfo.java": r'''package com.android.server.display;
    public final class DisplayDeviceInfo {
     public int flags=0x80,type=5,ownerUid=0;public String name="DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc",uniqueId="virtual:root,88";
     public static boolean recognizesOwnContent=true;public static String flagsToString(int flags){return recognizesOwnContent&&(flags&0x80)!=0?", FLAG_OWN_CONTENT_ONLY":"";}
    }''',
    "com/android/server/display/DisplayManagerService.java": r'''package com.android.server.display;
    public class DisplayManagerService {
     public static final java.util.List<Object> roots=new java.util.concurrent.CopyOnWriteArrayList<>();
     public static final class SyncRoot {} public final SyncRoot mSyncRoot=new SyncRoot();
     public DisplayDeviceInfo info=new DisplayDeviceInfo();public int displayId=88,reads,outsideReads;public boolean failRead;public Object forbiddenDisplayLock;
     public DisplayManagerService(){roots.add(mSyncRoot);}
     public static void outsideDeviceLock(){for(Object root:roots)if(Thread.holdsLock(root))throw new AssertionError("Display getter executed under DMS lock");}
     public DisplayDeviceInfo getDisplayDeviceInfoInternal(int id){
      // ROM returns shared mutable mInfo. The module must already hold this lock
      // when entering the real getter, and retain it while sampling its fields.
      if(!Thread.holdsLock(mSyncRoot)){outsideReads++;throw new AssertionError("device sample outside DMS lock");}
      if(forbiddenDisplayLock!=null&&Thread.holdsLock(forbiddenDisplayLock))throw new AssertionError("Display lock held during DMS sample");
      synchronized(mSyncRoot){reads++;if(failRead)throw new LinkageError("injected DMS read failure");return id==displayId?info:null;}
     }
     public static final class LocalService extends android.hardware.display.DisplayManagerInternal {
      public final DisplayManagerService this$0;public LocalService(DisplayManagerService owner){this$0=owner;}
     }
    }''',
    "com/android/server/wm/WindowManagerGlobalLock.java": 'package com.android.server.wm;public final class WindowManagerGlobalLock {}',
    "android/graphics/PixelFormat.java": 'package android.graphics;public class PixelFormat {public static final int TRANSLUCENT=-3;}',
    "android/graphics/Rect.java": 'package android.graphics;public class Rect {}',
    "android/view/Gravity.java": 'package android.view;public class Gravity {public static final int TOP=48,LEFT=3,START=8388611;}',
    "android/view/WindowManager.java": r'''package android.view;public interface WindowManager {class LayoutParams {
     public static final int TYPE_SYSTEM_DIALOG=2008,FLAG_NOT_TOUCHABLE=16,FLAG_NOT_TOUCH_MODAL=32,FLAG_NOT_FOCUSABLE=8,FLAG_ALT_FOCUSABLE_IM=131072,FLAG_DIM_BEHIND=2,FLAG_HARDWARE_ACCELERATED=16777216;
     public static final int SOFT_INPUT_STATE_ALWAYS_HIDDEN=3,SOFT_INPUT_ADJUST_NOTHING=48,PRIVATE_FLAG_USE_BLAST=33554432;
     public static final int PRIVATE_FLAG_FIT_INSETS_CONTROLLED=0x10000000,PRIVATE_FLAG_LAYOUT_SIZE_EXTENDED_BY_CUTOUT=0x1000;
     public int type=2008,width=1,height=1,flags=48,privateFlags,x,y,windowAnimations,format=-3,softInputMode=51,gravity=8388659;
     public float dimAmount,alpha=1;public String packageName="ls.augment.com",title="";
     public android.os.IBinder token,mWindowContextToken;public Object[] providedInsets;
     public int fitInsetsTypes=3;public int getFitInsetsTypes(){return fitInsetsTypes;}public void setFitInsetsTypes(int types){fitInsetsTypes=types;privateFlags|=PRIVATE_FLAG_FIT_INSETS_CONTROLLED;}
     public CharSequence getTitle(){return title;}}}''',
    "android/view/IWindow.java": 'package android.view;public interface IWindow {android.os.IBinder asBinder();}',
    "android/view/InputChannel.java": 'package android.view;public class InputChannel {}',
    "android/view/InsetsState.java": 'package android.view;public class InsetsState {}',
    "android/view/InsetsSourceControl.java": 'package android.view;public class InsetsSourceControl {public static class Array {}}',
    "android/view/WindowRelayoutResult.java": 'package android.view;public class WindowRelayoutResult {}',
    "com/android/server/wm/Session.java": 'package com.android.server.wm;public class Session {public int mUid=10055,mPid=456;public boolean mCanAddInternalSystemWindow;}',
    "com/android/server/wm/WindowProcessController.java": '''package com.android.server.wm;public class WindowProcessController {public int mUid=10055,mPid=456,mUserId;public String mName="ls.augment.com";public android.content.pm.ApplicationInfo mInfo=new android.content.pm.ApplicationInfo();}''',
    "com/android/server/wm/ActivityTaskManagerService.java": '''package com.android.server.wm;public class ActivityTaskManagerService {public WindowProcessController process=new WindowProcessController();public WindowProcessController getProcessController(int pid,int uid){return process!=null&&process.mPid==pid&&process.mUid==uid?process:null;}}''',
    "com/android/server/wm/WindowContainer.java": 'package com.android.server.wm;public class WindowContainer {public WindowManagerService mWmService;public DisplayContent content;public DisplayContent getDisplayContent(){return this instanceof DisplayContent?(DisplayContent)this:content;}}',
    "com/android/server/wm/WindowContextListenerController.java": r'''package com.android.server.wm;public class WindowContextListenerController {
      public final java.util.Map<android.os.IBinder,WindowContextListenerImpl> mListeners=new java.util.HashMap<>();
      public static class WindowContextListenerImpl {public WindowProcessController mWpc;public int mType=2008;public WindowContainer mContainer;}}
''',
    "com/android/server/wm/WindowState.java": 'package com.android.server.wm;public class WindowState extends WindowContainer {public android.view.WindowManager.LayoutParams mAttrs;}',
    "com/android/server/policy/PhoneWindowManager.java": r'''package com.android.server.policy;public class PhoneWindowManager {
      public int calls;public int checkAddPermission(int type,boolean corner,String pkg,int[] operation,int display){calls++;operation[0]=-1;return type==2008?-8:0;}}
''',
    "com/android/server/wm/WindowManagerService.java": r'''package com.android.server.wm;import android.os.Binder;import android.view.*;
    public class WindowManagerService {
     public final WindowManagerGlobalLock mGlobalLock=new WindowManagerGlobalLock();public RootWindowContainer mRoot=new RootWindowContainer();public DisplayWindowSettings mDisplayWindowSettings=new DisplayWindowSettings();
     public final android.hardware.display.DisplayManagerInternal mDisplayManagerInternal=new com.android.server.display.DisplayManagerService.LocalService(new com.android.server.display.DisplayManagerService());
     public android.content.Context mContext=new android.content.Context();public ls.augment.com.hook.AugmentModule module;public boolean fail;public int cached=-1,setCalls,mCurrentUserId,adds,lastOp=-2,nestedResult=999;
     public ActivityTaskManagerService mAtmService=new ActivityTaskManagerService();public com.android.server.policy.PhoneWindowManager mPolicy=new com.android.server.policy.PhoneWindowManager();
     public WindowContextListenerController mWindowContextListenerController=new WindowContextListenerController();
     public final java.util.Map<android.os.IBinder,WindowState> mWindowMap=new java.util.HashMap<>();public Runnable beforePermission,afterPermission;
     public WindowManagerService(){mRoot.display.mWmService=this;}
     public DisplayContent getDisplayContentOrCreate(int id,android.os.IBinder token){return mRoot.getDisplayContent(id);}public void setDisplayImePolicy(int id,int policy)throws Throwable{setCalls++;DisplayContent c=mRoot.getDisplayContent(id);if(c==null)return;c.requested=policy;long old=Binder.clearCallingIdentity();try{cached=(Integer)module.invoke(c,"getImePolicy",new Class<?>[0]);}finally{Binder.restoreCallingIdentity(old);}if(fail)throw new IllegalStateException("setter failed");}
     public int addWindow(Session session,IWindow client,WindowManager.LayoutParams attrs,int visibility,int display,int user,int requested,InputChannel channel,InsetsState state,InsetsSourceControl.Array controls,android.graphics.Rect frame,float[] scale)throws Throwable{
      adds++;if(beforePermission!=null)beforePermission.run();int[] operation={-2};int result=(Integer)module.invoke(mPolicy,"checkAddPermission",new Class<?>[]{int.class,boolean.class,String.class,int[].class,int.class},attrs.type,false,attrs.packageName,operation,display);lastOp=operation[0];if(result!=0)return result;
      if(afterPermission!=null)afterPermission.run();if(fail)throw new IllegalStateException("injected add failure");
      synchronized(mGlobalLock){WindowState window=new WindowState();window.mAttrs=attrs;window.content=mRoot.getDisplayContent(display);mWindowMap.put(client.asBinder(),window);}return 0;
     }
     public int relayouts;public int relayoutWindow(Session session,IWindow client,WindowManager.LayoutParams attrs,int width,int height,int visibility,int flags,int seq,int last,WindowRelayoutResult result){relayouts++;WindowState window=mWindowMap.get(client.asBinder());if(window!=null&&attrs!=null)window.mAttrs=attrs;return 0;}
    }''',
})

SOURCES["android/view/DisplayInfo.java"] = r'''package android.view;public final class DisplayInfo {
 public String name="DuoAtomic-10055-w0-12345678-1234-1234-1234-123456789abc",uniqueId="virtual:root,88";
}'''
SOURCES["android/view/Display.java"] = SOURCES["android/view/Display.java"].replace(
    'public int getDisplayId()',
    '''private final Object mLock=new Object();private DisplayInfo mDisplayInfo=new DisplayInfo();public int nameReads;public boolean failName;
     private void refreshCache(){synchronized(mLock){mDisplayInfo.name=name;mDisplayInfo.uniqueId=unique;}}
     public int getDisplayId()''').replace(
    'public String getName(){com.android.server.display.DisplayManagerService.outsideDeviceLock();return name;}',
    'public String getName(){com.android.server.display.DisplayManagerService.outsideDeviceLock();nameReads++;if(failName)throw new AssertionError("refreshing Display.getName was called");refreshCache();return name;}')

TEST = r'''package ls.augment.com.hook;
import android.os.*;import android.view.*;import com.android.server.wm.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
public final class TestFocusWindowHook {
 static int tests,checks;static void check(boolean yes,String why){checks++;if(!yes)throw new AssertionError(why);}
 interface Case{void run()throws Throwable;}static void test(String name,Case body)throws Throwable{body.run();tests++;System.out.println("PASS focus window hook: "+name);}
 static final Class<?>[] ADD={Session.class,IWindow.class,WindowManager.LayoutParams.class,int.class,int.class,int.class,int.class,InputChannel.class,InsetsState.class,InsetsSourceControl.Array.class,android.graphics.Rect.class,float[].class};
 static final Class<?>[] CHECK={int.class,boolean.class,String.class,int[].class,int.class};
 static final Class<?>[] RELAYOUT={Session.class,IWindow.class,WindowManager.LayoutParams.class,int.class,int.class,int.class,int.class,int.class,int.class,WindowRelayoutResult.class};
 public static class Token implements IBinder {public boolean alive=true;public boolean isBinderAlive(){return alive;}}
 public static class Client implements IWindow {public Token token=new Token();public IBinder asBinder(){return token;}}
 static String title(int display,String unique)throws Exception{return "DuoAtomicInputFocus-"+display+"-"+java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(unique.getBytes(java.nio.charset.StandardCharsets.UTF_8)));}
 static void reset(Class<?> owner,String... fields)throws Exception{for(String key:fields){Field f=owner.getDeclaredField(key);f.setAccessible(true);f.setBoolean(null,false);}}
 static final class Fixture {
  final AugmentModule module=new AugmentModule();final WindowManagerService service=new WindowManagerService();final Session session=new Session();final Client client=new Client();
  final WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();final Token token=new Token();final WindowContextListenerController.WindowContextListenerImpl listener=new WindowContextListenerController.WindowContextListenerImpl();
  Fixture()throws Exception{reset(AtomicWorkbenchImeHook.class,"installed","ownerHookInstalled","policyHookInstalled","contentHookInstalled");reset(AtomicWorkbenchFocusWindowHook.class,"installed","addInstalled","permissionInstalled","relayoutInstalled");
   com.android.server.display.DisplayDeviceInfo.recognizesOwnContent=true;
   Field displayLock=Display.class.getDeclaredField("mLock");displayLock.setAccessible(true);dms().forbiddenDisplayLock=displayLock.get(service.mRoot.display.mDisplay);
   Field displays=AtomicWorkbenchImeHook.class.getDeclaredField("DISPLAYS");displays.setAccessible(true);((Map<?,?>)displays.get(null)).clear();Field reservations=AtomicWorkbenchFocusWindowHook.class.getDeclaredField("RESERVATIONS");reservations.setAccessible(true);((Map<?,?>)reservations.get(null)).clear();
   Field scope=AtomicWorkbenchFocusWindowHook.class.getDeclaredField("SCOPE");scope.setAccessible(true);((ThreadLocal<?>)scope.get(null)).remove();
   Field guards=AtomicWorkbenchFocusWindowHook.class.getDeclaredField("GUARDS");guards.setAccessible(true);((Map<?,?>)guards.get(null)).clear();
   android.os.Process.uids.clear();android.os.Process.uids.put(123,0);android.os.Process.uids.put(456,10055);Binder.uid=0;Binder.pid=123;service.module=module;
   attrs.title=title(88,service.mRoot.display.mDisplay.unique);attrs.mWindowContextToken=token;listener.mWpc=service.mAtmService.process;listener.mContainer=service.mRoot.display;service.mWindowContextListenerController.mListeners.put(token,listener);
  }
  void install()throws Throwable{check(AtomicWorkbenchImeHook.install(module,getClass().getClassLoader())==2,"IME hooks missing");check(AtomicWorkbenchFocusWindowHook.install(module,getClass().getClassLoader())==3&&AtomicWorkbenchFocusWindowHook.isInstalled(),"focus hooks missing");register();}
  void register()throws Throwable{Binder.uid=0;Binder.pid=123;module.invoke(service,"setDisplayImePolicy",new Class<?>[]{int.class,int.class},88,1);Binder.uid=10055;Binder.pid=456;}
  int add()throws Throwable{return add(client,attrs);}
  int add(Client client,WindowManager.LayoutParams attrs)throws Throwable{return (Integer)module.invoke(service,"addWindow",ADD,session,client,attrs,0,88,0,0,new InputChannel(),new InsetsState(),new InsetsSourceControl.Array(),new android.graphics.Rect(),new float[1]);}
  int relayout(WindowManager.LayoutParams attrs,int width,int height)throws Throwable{return (Integer)module.invoke(service,"relayoutWindow",RELAYOUT,session,client,attrs,width,height,0,0,0,0,new WindowRelayoutResult());}
  com.android.server.display.DisplayManagerService dms(){return ((com.android.server.display.DisplayManagerService.LocalService)service.mDisplayManagerInternal).this$0;}
  void denied()throws Throwable{int calls=service.mPolicy.calls;check(add()==-8,"untrusted window gained permission");check(service.mPolicy.calls==calls+1&&service.mWindowMap.isEmpty(),"original denial bypassed or window inserted");}
 }
 public static void main(String[] args)throws Throwable{
  test("only one exact managed-app guard gets scoped permission without changing Session authority",()->{Fixture f=new Fixture();f.install();check(f.add()==0&&f.service.adds==1&&f.service.mPolicy.calls==0&&f.service.lastOp==-1,"exact guard not authorized");check(!f.session.mCanAddInternalSystemWindow,"Session granted global permission");
   int[] op={-2};check((Integer)f.module.invoke(f.service.mPolicy,"checkAddPermission",CHECK,2008,false,"ls.augment.com",op,88)==-8,"permission escaped add scope");check(!f.service.mWindowMap.isEmpty(),"original add never ran");});
  test("unregistered matching display name never grants permission",()->{Fixture f=new Fixture();check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==2,"IME install failed");check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==3,"focus install failed");Binder.uid=10055;Binder.pid=456;f.denied();});
  for(String cause:new String[]{"caller_uid","caller_pid","pid_uid","session_uid","session_pid","no_process","info_uid","info_package","process_name","process_user","foreground_user"})test("caller authentication rejects "+cause,()->{Fixture f=new Fixture();f.install();switch(cause){
   case "caller_uid":Binder.uid=20000;break;case "caller_pid":Binder.pid=999;break;case "pid_uid":android.os.Process.uids.put(456,20000);break;
   case "session_uid":f.session.mUid=20000;break;case "session_pid":f.session.mPid=999;break;case "no_process":f.service.mAtmService.process=null;break;
   case "info_uid":f.service.mAtmService.process.mInfo.uid=20000;break;case "info_package":f.service.mAtmService.process.mInfo.packageName="foreign";break;
   case "process_name":f.service.mAtmService.process.mName="ls.augment.com:other";break;case "process_user":f.service.mAtmService.process.mUserId=1;break;case "foreground_user":f.service.mCurrentUserId=1;break;}
   f.denied();});
  for(String cause:new String[]{"root_dead","root_reused","unique","name","owner","private","presentation","trusted","own_focus","own_content","display_object"})test("live Root/display authentication rejects "+cause,()->{Fixture f=new Fixture();f.install();switch(cause){
   case "root_dead":android.os.Process.uids.remove(123);break;case "root_reused":android.os.Process.uids.put(123,10055);break;case "unique":f.service.mRoot.display.mDisplay.unique="reused";break;
   case "name":f.service.mRoot.display.mDisplay.name="renamed";break;case "owner":f.service.mRoot.display.mDisplay.owner=10055;break;case "private":f.service.mRoot.display.mDisplay.flags|=4;break;
   case "presentation":f.service.mRoot.display.mDisplay.flags|=8;break;case "trusted":f.service.mRoot.display.mDisplay.flags&=~128;break;case "own_focus":f.service.mRoot.display.mDisplay.flags&=~2048;break;
   case "own_content":f.dms().info.flags&=~0x80;break;case "display_object":f.service.mRoot.display=new DisplayContent();f.service.mRoot.display.mWmService=f.service;f.listener.mContainer=f.service.mRoot.display;break;}
   f.denied();});
  test("observed identity drift invalidates registry until a fresh Root request",()->{Fixture f=new Fixture();f.install();String unique=f.service.mRoot.display.mDisplay.unique;f.service.mRoot.display.mDisplay.unique="reused";f.denied();f.service.mRoot.display.mDisplay.unique=unique;f.denied();f.register();check(f.add()==0,"fresh Root registration did not recover");});
  test("guard title binds the requested unique generation even after a fresh Root registration",()->{Fixture f=new Fixture();f.install();f.service.mRoot.display.mDisplay.unique="new exact unique";f.dms().info.uniqueId="new exact unique";f.register();f.denied();f.attrs.title=title(88,"new exact unique");check(f.add()==0,"current unique hash rejected");});
  for(String cause:new String[]{"width","height","touchable","focusable","alt_ime","dim_flag","unknown_flag","private_flag","format","alpha","dim","animation","gravity","soft_input","x","y","package","title","token","insets"})test("exact guard attributes reject "+cause,()->{Fixture f=new Fixture();f.install();switch(cause){
   case "width":f.attrs.width=2;break;case "height":f.attrs.height=0;break;case "touchable":f.attrs.flags&=~16;break;case "focusable":f.attrs.flags|=8;break;case "alt_ime":f.attrs.flags|=131072;break;
   case "dim_flag":f.attrs.flags|=2;break;case "unknown_flag":f.attrs.flags|=1024;break;case "private_flag":f.attrs.privateFlags=0x20000000;break;case "format":f.attrs.format=1;break;
   case "alpha":f.attrs.alpha=Float.NaN;break;case "dim":f.attrs.dimAmount=.5f;break;case "animation":f.attrs.windowAnimations=1;break;case "gravity":f.attrs.gravity=17;break;
   case "soft_input":f.attrs.softInputMode=0;break;case "x":f.attrs.x=1;break;case "y":f.attrs.y=-1;break;case "package":f.attrs.packageName="foreign";break;case "title":f.attrs.title="Ordinary Duo dialog";break;
   case "token":f.attrs.token=new Token();break;case "insets":f.attrs.providedInsets=new Object[]{new Object()};break;}
   f.denied();});
  for(String cause:new String[]{"missing","dead","foreign_listener","wrong_type","different_display","null_container","dead_client"})test("WindowContext ownership rejects "+cause,()->{Fixture f=new Fixture();f.install();switch(cause){
   case "missing":f.attrs.mWindowContextToken=null;break;case "dead":f.token.alive=false;break;case "foreign_listener":f.listener.mWpc=new WindowProcessController();break;case "wrong_type":f.listener.mType=1;break;
   case "different_display":f.listener.mContainer=new DisplayContent();break;case "null_container":f.listener.mContainer=null;break;case "dead_client":f.client.token.alive=false;break;}
   f.denied();});
  test("known framework hardware/layout flags and the same WindowContext token remain compatible",()->{Fixture f=new Fixture();f.install();f.attrs.flags|=WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED;f.attrs.privateFlags=WindowManager.LayoutParams.PRIVATE_FLAG_USE_BLAST;f.attrs.token=f.token;f.attrs.gravity=51;check(f.add()==0,"safe framework-adjusted attributes rejected");});
  test("a second guard is denied until the original WindowState is removed",()->{Fixture f=new Fixture();f.install();check(f.add()==0,"first guard failed");check(f.add(new Client(),f.attrs)==-8&&f.service.mWindowMap.size()==1,"second guard gained focus authority");f.service.mWindowMap.clear();check(f.add(new Client(),f.attrs)==0,"removed guard left permanent authority reservation");});
  test("old hashes on the same display cannot overlap a newer generation guard",()->{Fixture f=new Fixture();f.install();check(f.add()==0,"first guard failed");f.attrs.title=title(88,"older generation");WindowManager.LayoutParams newer=new WindowManager.LayoutParams();newer.title=title(88,f.service.mRoot.display.mDisplay.unique);newer.mWindowContextToken=f.token;check(f.add(new Client(),newer)==-8,"different hash bypassed one-guard boundary");});
  test("physical display and cross-user add retain original policy",()->{Fixture f=new Fixture();f.install();for(int[] pair:new int[][]{{0,0},{88,10}}){f.attrs.title=title(pair[0],f.service.mRoot.display.mDisplay.unique);check((Integer)f.module.invoke(f.service,"addWindow",ADD,f.session,f.client,f.attrs,0,pair[0],pair[1],0,new InputChannel(),new InsetsState(),new InsetsSourceControl.Array(),new android.graphics.Rect(),new float[1])==-8,"physical/cross-user permission broadened");}});
  test("ordinary Duo application windows preserve the original add and permission path",()->{Fixture f=new Fixture();f.install();f.attrs.type=1;f.attrs.title="Duo workspace";f.attrs.width=1080;check(f.add()==0&&f.service.mPolicy.calls==1,"normal application path changed");});
  test("permission revalidates identity immediately before overriding the ROM decision",()->{Fixture f=new Fixture();f.install();f.service.beforePermission=()->f.service.mRoot.display.mDisplay.unique="replaced between hooks";f.denied();});
  test("exceptions remove ThreadLocal and reservation without swallowing the original failure",()->{Fixture f=new Fixture();f.install();f.service.fail=true;try{f.add();throw new AssertionError("add exception swallowed");}catch(IllegalStateException expected){checks++;}f.service.fail=false;
   int[] op={-2};check((Integer)f.module.invoke(f.service.mPolicy,"checkAddPermission",CHECK,2008,false,"ls.augment.com",op,88)==-8,"exception leaked permission scope");check(f.add()==0,"failed add leaked reservation");});
  test("nested add never inherits a parent's authenticated attributes",()->{Fixture f=new Fixture();f.install();f.service.afterPermission=()->{f.service.afterPermission=null;WindowManager.LayoutParams bad=new WindowManager.LayoutParams();bad.title=f.attrs.title;bad.mWindowContextToken=f.token;bad.width=500;try{f.service.nestedResult=f.add(new Client(),bad);}catch(Throwable error){throw new RuntimeException(error);}};
   check(f.add()==0&&f.service.nestedResult==-8&&f.service.mWindowMap.size()==1,"nested large window inherited guard permission");});
  test("concurrent add reservations prevent duplicate guards before either WindowState exists",()->{Fixture f=new Fixture();f.install();CountDownLatch admitted=new CountDownLatch(1),release=new CountDownLatch(1);List<Throwable> errors=new ArrayList<>();int[] first={999};
   f.service.afterPermission=()->{admitted.countDown();try{if(!release.await(2,TimeUnit.SECONDS))throw new IllegalStateException("test admission timeout");}catch(InterruptedException e){throw new RuntimeException(e);}};
   Thread worker=new Thread(()->{try{first[0]=f.add();}catch(Throwable error){errors.add(error);}});worker.start();check(admitted.await(2,TimeUnit.SECONDS),"first guard did not reserve");
   try{check(f.add(new Client(),f.attrs)==-8&&f.service.mWindowMap.isEmpty(),"second concurrent guard entered WMS");}finally{release.countDown();worker.join(2000);}
   check(!worker.isAlive()&&errors.isEmpty()&&first[0]==0&&f.service.mWindowMap.size()==1,"reservation changed the accepted guard");});
  test("partial hook installation stays disabled and retry registers only the missing callback",()->{Fixture f=new Fixture();check(AtomicWorkbenchImeHook.install(f.module,f.getClass().getClassLoader())==2,"IME install failed");f.module.failPrepareAt=f.module.prepareCalls+3;
   check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==0&&!AtomicWorkbenchFocusWindowHook.isInstalled(),"partial installation reported ready");int callbacks=f.module.intercepts;f.module.failPrepareAt=0;
   check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==3&&f.module.intercepts==callbacks+1,"retry duplicated installed permission callback");int all=f.module.intercepts;check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==3&&f.module.intercepts==all,"ready install not idempotent");f.register();check(f.add()==0,"retry did not become functional");});
  test("focus readiness depends on the authenticated IME registry remaining installed",()->{Fixture f=new Fixture();f.install();Field installed=AtomicWorkbenchImeHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.setBoolean(null,false);check(!AtomicWorkbenchFocusWindowHook.isInstalled(),"ready outlived owner registry");f.denied();});
  test("accepted guards remain exactly one pixel and untouchable on every later relayout",()->{Fixture f=new Fixture();f.install();check(f.add()==0,"add failed");check(f.relayout(f.attrs,1,1)==0&&f.relayout(null,0,0)==0,"legitimate fixed-size relayout rejected");
   for(String cause:new String[]{"size","requested_size","touch","title","token","window_token","type"}){WindowManager.LayoutParams attrs=new WindowManager.LayoutParams();attrs.title=f.attrs.title;attrs.mWindowContextToken=f.token;int width=1;
    switch(cause){case "size":attrs.width=1080;break;case "requested_size":width=1080;break;case "touch":attrs.flags&=~16;break;case "title":attrs.title="ordinary dialog";break;case "token":attrs.mWindowContextToken=new Token();break;case "window_token":attrs.token=new Token();break;case "type":attrs.type=1;break;}
    int calls=f.service.relayouts;try{f.relayout(attrs,width,1);throw new AssertionError("guard relayout expanded authority: "+cause);}catch(SecurityException expected){checks++;}check(f.service.relayouts==calls,"rejected relayout reached native mutation");}
   check(f.relayout(f.attrs,1,1)==0,"rejected update damaged old guard");});
  test("ordinary application relayouts retain native size and touch behavior",()->{Fixture f=new Fixture();f.install();f.attrs.type=1;f.attrs.title="ordinary";check(f.add()==0,"ordinary add failed");f.attrs.width=2000;f.attrs.flags=0;check(f.relayout(f.attrs,2000,3000)==0&&f.service.relayouts==1,"ordinary application relayout restricted");});
  test("a title alone never classifies another native system window as a registered guard",()->{Fixture f=new Fixture();f.install();WindowState nativeWindow=new WindowState();nativeWindow.mAttrs=f.attrs;nativeWindow.content=f.service.mRoot.display;f.service.mWindowMap.put(f.client.asBinder(),nativeWindow);f.attrs.width=2000;check(f.relayout(f.attrs,2000,3000)==0&&f.service.relayouts==1,"unregistered native window restricted by title");check(f.module.ids.stream().noneMatch(id->id.contains("remove")),"window removal was intercepted");});
  System.out.println("FOCUS WINDOW HOOK RESULT "+tests+" cases; "+checks+" assertions");
 }
}'''


FIT_INSETS_TEST = r'''
  test("explicit fit-insets control passes the existing exact owner and permission gates",()->{Fixture f=new Fixture();f.install();f.attrs.setFitInsetsTypes(0);check(f.attrs.fitInsetsTypes==0&&f.attrs.privateFlags==0x10000000,"setter adapter mismatch");check(f.add()==0&&f.relayout(f.attrs,1,1)==0,"explicit fit insets rejected by actual hook");});
  test("captured implicit IME parent-frame private flag remains forbidden",()->{Fixture f=new Fixture();f.install();f.attrs.privateFlags=0x40000000;f.denied();});
  test("explicit fit insets never permits an injected IME parent-frame flag on relayout",()->{Fixture f=new Fixture();f.install();f.attrs.setFitInsetsTypes(0);check(f.add()==0,"explicit guard failed");f.attrs.privateFlags|=0x40000000;int calls=f.service.relayouts;try{f.relayout(f.attrs,1,1);throw new AssertionError("IME parent-frame flag bypassed relayout gate");}catch(SecurityException expected){checks++;}check(f.service.relayouts==calls,"rejected IME parent-frame relayout reached WMS");});
'''

DEVICE_EVIDENCE_TEST = r'''
  test("real Display shape has no own-content constant while actual DDI permits the exact guard",()->{Fixture f=new Fixture();
   try{Display.class.getDeclaredField("FLAG_OWN_CONTENT_ONLY");throw new AssertionError("fabricated logical flag survived");}catch(NoSuchFieldException expected){checks++;}
   for(Field field:com.android.server.display.DisplayDeviceInfo.class.getDeclaredFields())check(!field.getName().startsWith("FLAG_"),"fabricated DDI static flag survived");
   check(f.service.mRoot.display.mDisplay.flags==0x880&&f.dms().info.flags==0x80,"flag domain fixture mismatch");f.install();int reads=f.dms().reads;check(f.add()==0,"real-shape guard was not authorized");check(f.dms().reads>=reads+2&&f.dms().outsideReads==0,"actual add and policy recheck did not sample locked DDI");
  });
  for(String cause:new String[]{"missing_own_content","creation_domain_8","fake_logical_4096","id","name","unique","type","owner","null","throw"})test("actual device evidence rejects "+cause,()->{Fixture f=new Fixture();f.install();switch(cause){
   case "missing_own_content":f.dms().info.flags=0;break;case "creation_domain_8":f.dms().info.flags=8;break;case "fake_logical_4096":f.service.mRoot.display.mDisplay.flags|=4096;f.dms().info.flags=0;break;
   case "id":f.dms().displayId=89;break;case "name":f.dms().info.name="different";break;case "unique":f.dms().info.uniqueId="different";break;case "type":f.dms().info.type=1;break;case "owner":f.dms().info.ownerUid=10055;break;case "null":f.dms().info=null;break;case "throw":f.dms().failRead=true;break;}
   f.denied();
  });
  test("own-content disappearance at permission recheck retains native refusal",()->{Fixture f=new Fixture();f.install();f.service.beforePermission=()->f.dms().info.flags=0;f.denied();});
  test("same-value DMS service replacement cannot reuse the initial binding",()->{Fixture f=new Fixture();f.install();f.service.beforePermission=()->{try{Field field=WindowManagerService.class.getDeclaredField("mDisplayManagerInternal");field.setAccessible(true);field.set(f.service,new com.android.server.display.DisplayManagerService.LocalService(new com.android.server.display.DisplayManagerService()));}catch(Exception e){throw new RuntimeException(e);}};f.denied();});
  test("same DMS owner with a replaced SyncRoot cannot reuse the initial binding",()->{Fixture f=new Fixture();f.install();f.service.beforePermission=()->{try{Field field=com.android.server.display.DisplayManagerService.class.getDeclaredField("mSyncRoot");field.setAccessible(true);field.set(f.dms(),new com.android.server.display.DisplayManagerService.SyncRoot());}catch(Exception e){throw new RuntimeException(e);}};f.denied();});
  test("null or foreign LocalService shape denies without manufacturing registration",()->{for(int mode=0;mode<2;mode++){Fixture f=new Fixture();f.install();Field field=WindowManagerService.class.getDeclaredField("mDisplayManagerInternal");field.setAccessible(true);field.set(f.service,mode==0?null:new android.hardware.display.DisplayManagerInternal(){});f.denied();}});
  test("runtime flagsToString semantic incompatibility stops installation before hooks",()->{Fixture f=new Fixture();com.android.server.display.DisplayDeviceInfo.recognizesOwnContent=false;try{check(AtomicWorkbenchFocusWindowHook.install(f.module,f.getClass().getClassLoader())==0&&!AtomicWorkbenchFocusWindowHook.isInstalled()&&f.module.intercepts==0,"unrecognized device domain installed focus permission");}finally{com.android.server.display.DisplayDeviceInfo.recognizesOwnContent=true;}});
  test("actual helper samples cached Display info without refreshing or nesting its lock into DMS",()->{Fixture f=new Fixture();f.install();Display display=f.service.mRoot.display.mDisplay;display.getName();int calls=display.nameReads;display.failName=true;AtomicWorkbenchDisplayDeviceEvidence evidence=AtomicWorkbenchDisplayDeviceEvidence.resolve(f.getClass().getClassLoader());synchronized(f.service.mGlobalLock){check(evidence.ownsContentOnly(f.service,display),"cached device evidence attempted refresh or nested Display lock");}check(display.nameReads==calls&&f.dms().outsideReads==0,"device helper called refreshing Display name getter");});
  test("actual helper rejects absent WM lock and pre-held Display or DMS locks",()->{Fixture f=new Fixture();f.install();Display display=f.service.mRoot.display.mDisplay;display.getName();AtomicWorkbenchDisplayDeviceEvidence evidence=AtomicWorkbenchDisplayDeviceEvidence.resolve(f.getClass().getClassLoader());check(!evidence.ownsContentOnly(f.service,display),"device helper admitted a caller without WM lock");Field field=Display.class.getDeclaredField("mLock");field.setAccessible(true);Object lock=field.get(display);int reads=f.dms().reads;synchronized(f.service.mGlobalLock){synchronized(lock){check(!evidence.ownsContentOnly(f.service,display),"pre-held Display lock reached DMS");}synchronized(f.dms().mSyncRoot){check(!evidence.ownsContentOnly(f.service,display),"pre-held DMS lock reached Display snapshot");}}check(f.dms().reads==reads,"rejected lock entry sampled device fields");});
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--negative-controls", action="store_true")
    args = parser.parse_args()
    sources = dict(SOURCES)
    marker = '  System.out.println("FOCUS WINDOW HOOK RESULT "'
    if TEST.count(marker) != 1:
        raise AssertionError("original test runner insertion point changed")
    sources["ls/augment/com/hook/TestFocusWindowHook.java"] = TEST.replace(marker, FIT_INSETS_TEST + DEVICE_EVIDENCE_TEST + marker)
    with tempfile.TemporaryDirectory(prefix="lsa-focus-window-hook-") as directory:
        SUPPORT["compile_run"](Path(directory), sources,
            ["hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchFocusWindowHook.java", "hook/AtomicWorkbenchDisplayDeviceEvidence.java", "hook/AtomicWorkbenchFocusWindowDiagnostics.java", "AtomicWorkbenchLogPolicy.java"],
            "ls.augment.com.hook.TestFocusWindowHook")
    sdk_compile()
    device_profile_shapes()
    if args.negative_controls:
        negatives(sources)
        device_negatives(sources)


def sdk_compile():
    sdk = SUPPORT["ROOT"] / "audit-output/android-sdk/platforms/android-36/android.jar"
    if not sdk.is_file():
        raise RuntimeError("SDK 36 required for actual framework API compilation")
    with tempfile.TemporaryDirectory(prefix="lsa-focus-window-sdk36-") as directory:
        work = Path(directory)
        files = []
        for name in ("io/github/libxposed/api/XposedInterface.java", "ls/augment/com/hook/AugmentModule.java", "ls/augment/com/hook/HookTelemetry.java"):
            path = work / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(SOURCES[name], encoding="utf-8")
            files.append(path)
        files += [SUPPORT["SRC"] / "hook" / name for name in ("HookCompatibility.java", "AtomicWorkbenchImeHook.java", "AtomicWorkbenchFocusWindowHook.java", "AtomicWorkbenchDisplayDeviceEvidence.java", "AtomicWorkbenchFocusWindowDiagnostics.java")]
        files += [SUPPORT["SRC"] / "AtomicWorkbenchLogPolicy.java"]
        result = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-cp", str(sdk), "-d", str(work / "classes"), *map(str, files)],
                                text=True, encoding="utf-8", errors="replace", capture_output=True, env=SUPPORT["ENV"], timeout=25)
        if result.returncode:
            raise AssertionError(result.stdout + result.stderr)
        print("PASS production focus-window + IME hooks: SDK 36 javac")


def negatives(sources):
    source = (SUPPORT["SRC"] / "hook/AtomicWorkbenchFocusWindowHook.java").read_text(encoding="utf-8")
    mutations = {
        "nested_add_inherits_permission": (
            "// A nested add never inherits the enclosing call's permission.\n                    SCOPE.remove();",
            "// MUTANT: inherit outer scope",
            "nested large window inherited guard permission"),
        "stale_unique_title_is_accepted": (
            '\n                || !checked(title(permit.display, (String) call(display, "getUniqueId", new Class<?>[0])).contentEquals(permit.attrs.getTitle()),TITLE_UNIQUE)',
            "",
            "untrusted window gained permission"),
        "guard_can_expand_after_add": (
            "int requestedWidth, int requestedHeight) throws Throwable {\n        synchronized",
            "int requestedWidth, int requestedHeight) throws Throwable {\n        if (true) return;\n        synchronized",
            "guard relayout expanded authority"),
    }
    for label, (before, after, expected) in mutations.items():
        if source.count(before) != 1:
            raise AssertionError("negative control no longer targets one production branch: " + label)
        with tempfile.TemporaryDirectory(prefix="lsa-focus-mutant-") as directory:
            work = Path(directory)
            files = []
            mutant_sources = dict(sources)
            mutant_sources["ls/augment/com/hook/HookCompatibility.java"]=(SUPPORT["SRC"]/"hook/HookCompatibility.java").read_text(encoding="utf-8")
            mutant_sources["ls/augment/com/hook/AtomicWorkbenchFocusWindowDiagnostics.java"] = (SUPPORT["SRC"] / "hook/AtomicWorkbenchFocusWindowDiagnostics.java").read_text(encoding="utf-8")
            mutant_sources["ls/augment/com/AtomicWorkbenchLogPolicy.java"] = (SUPPORT["SRC"] / "AtomicWorkbenchLogPolicy.java").read_text(encoding="utf-8")
            mutant_sources["ls/augment/com/hook/AtomicWorkbenchImeHook.java"] = (SUPPORT["SRC"] / "hook/AtomicWorkbenchImeHook.java").read_text(encoding="utf-8")
            mutant_sources["ls/augment/com/hook/AtomicWorkbenchDisplayDeviceEvidence.java"] = (SUPPORT["SRC"] / "hook/AtomicWorkbenchDisplayDeviceEvidence.java").read_text(encoding="utf-8")
            mutant_sources["ls/augment/com/hook/AtomicWorkbenchFocusWindowHook.java"] = source.replace(before, after)
            for name, text in mutant_sources.items():
                path = work / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text, encoding="utf-8")
                files.append(str(path))
            classes = work / "classes"
            compiled = subprocess.run([SUPPORT["JAVAC"], "-encoding", "UTF-8", "-d", str(classes), *files],
                                      capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=25)
            if compiled.returncode:
                raise AssertionError(compiled.stdout + compiled.stderr)
            result = subprocess.run([SUPPORT["JAVA"], "-cp", str(classes), "ls.augment.com.hook.TestFocusWindowHook"],
                                    capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=25)
            if result.returncode == 0 or expected not in result.stdout + result.stderr:
                raise AssertionError("negative control failed to detect " + label + "\n" + result.stdout + result.stderr)
            print("PASS negative control: " + label)


def device_profile_shapes():
    runner = r'''package ls.augment.com.hook;public final class TestDeviceProfile {
     public static void main(String[] args){AugmentModule module=new AugmentModule();if(AtomicWorkbenchImeHook.install(module,TestDeviceProfile.class.getClassLoader())!=2)throw new AssertionError("required actual IME dependency missing");int actual=AtomicWorkbenchFocusWindowHook.install(module,TestDeviceProfile.class.getClassLoader());boolean valid="valid".equals(args[0]);
      if(valid?(actual!=3||module.intercepts!=6):(actual!=0||module.intercepts!=3||module.errors==0))throw new AssertionError("device profile shape did not fail closed: "+args[0]+" result="+actual+" hooks="+module.intercepts);
      if(!com.android.server.display.DisplayManagerService.roots.isEmpty())throw new AssertionError("installation instantiated a DMS owner");
      System.out.println("PASS actual device profile shape: "+args[0]);}}
    '''
    variants = {
        "valid": {},
        "missing_actual_device_getter": {"com/android/server/display/DisplayManagerService.java": ("getDisplayDeviceInfoInternal(int id)", "missingDeviceInfo(int id)")},
        "missing_device_unique_field": {"com/android/server/display/DisplayDeviceInfo.java": ("uniqueId=", "missingUnique=")},
        "device_owner_wrong_primitive_type": {"com/android/server/display/DisplayDeviceInfo.java": ("public int flags=0x80,type=5,ownerUid=0;", "public int flags=0x80,type=5;public long ownerUid=0;")},
        "device_flags_wrong_static_shape": {"com/android/server/display/DisplayDeviceInfo.java": ("public int flags=0x80,type=5,ownerUid=0;", "public static int flags=0x80;public int type=5,ownerUid=0;")},
        "sync_root_not_final": {"com/android/server/display/DisplayManagerService.java": ("public final SyncRoot mSyncRoot=", "public SyncRoot mSyncRoot=")},
        "missing_local_owner_field": {"com/android/server/display/DisplayManagerService.java": ("this$0", "missingOwner")},
    }
    for label, changes in variants.items():
        sources = dict(SOURCES)
        sources["ls/augment/com/hook/TestDeviceProfile.java"] = runner
        for name, (before, after) in changes.items():
            if before not in sources[name]:
                raise AssertionError("device shape probe anchor changed: " + label)
            sources[name] = sources[name].replace(before, after)
        with tempfile.TemporaryDirectory(prefix="lsa-device-profile-") as directory:
            SUPPORT["compile_run"](Path(directory), sources,
                ["hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchFocusWindowHook.java", "hook/AtomicWorkbenchDisplayDeviceEvidence.java", "hook/AtomicWorkbenchFocusWindowDiagnostics.java", "AtomicWorkbenchLogPolicy.java"],
                "ls.augment.com.hook.TestDeviceProfile", arguments=(label,))


def device_negatives(sources):
    mutations = {
        "actual_device_own_content_gate_removed": ("AtomicWorkbenchDisplayDeviceEvidence.java", "(actualFlags & OWN_CONTENT_ONLY) == OWN_CONTENT_ONLY && actualType == expectedType", "actualType == expectedType", "untrusted window gained permission"),
        "creation_bit_used_in_device_domain": ("AtomicWorkbenchDisplayDeviceEvidence.java", "OWN_CONTENT_ONLY = 0x80;", "OWN_CONTENT_ONLY = 0x8;", "focus hooks missing"),
        "logical_flags_read_in_device_sample": ("AtomicWorkbenchDisplayDeviceEvidence.java", "actualFlags = flags.getInt(info);", "actualFlags = display.getFlags();", "exact guard not authorized"),
        "device_unique_binding_removed": ("AtomicWorkbenchDisplayDeviceEvidence.java", " && expectedUnique.equals(actualUnique)", "", "untrusted window gained permission"),
        "device_owner_binding_removed": ("AtomicWorkbenchDisplayDeviceEvidence.java", "actualOwner == expectedOwner && ", "", "untrusted window gained permission"),
        "device_type_binding_removed": ("AtomicWorkbenchDisplayDeviceEvidence.java", " && actualType == expectedType", "", "untrusted window gained permission"),
        "device_sample_monitor_removed": ("AtomicWorkbenchDisplayDeviceEvidence.java", "synchronized (sync) {", "if (true) {", "exact guard not authorized"),
        "device_name_refresh_introduced": ("AtomicWorkbenchDisplayDeviceEvidence.java", "expectedName = (String) displayName.get(cached);", "expectedName = display.getName();", "refreshing Display.getName was called"),
        "bound_device_service_replacement_allowed": ("AtomicWorkbenchDisplayDeviceEvidence.java", "else if (boundService != service || boundLocal != local || boundDms != dms || boundSync != sync)", "else if (false)", "untrusted window gained permission"),
        "focus_skips_actual_device_witness": ("AtomicWorkbenchFocusWindowHook.java", "\n                || !checked(displayDeviceEvidence != null && displayDeviceEvidence.ownsContentOnly(permit.service,display),DISPLAY_REQUIRED)", "", "untrusted window gained permission"),
    }
    dependencies = ("hook/HookCompatibility.java", "hook/AtomicWorkbenchImeHook.java", "hook/AtomicWorkbenchFocusWindowHook.java", "hook/AtomicWorkbenchDisplayDeviceEvidence.java", "hook/AtomicWorkbenchFocusWindowDiagnostics.java", "AtomicWorkbenchLogPolicy.java")
    for label, (filename, before, after, expected) in mutations.items():
        source = (SUPPORT["SRC"] / "hook" / filename).read_text(encoding="utf-8")
        if source.count(before) != 1:
            raise AssertionError("device negative no longer targets one production branch: " + label)
        with tempfile.TemporaryDirectory(prefix="lsa-device-mutant-") as directory:
            work = Path(directory); files = []; copies = dict(sources)
            copies.update({"ls/augment/com/" + name: (SUPPORT["SRC"] / name).read_text(encoding="utf-8") for name in dependencies})
            copies["ls/augment/com/hook/" + filename] = source.replace(before, after)
            for name, value in copies.items():
                path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding="utf-8"); files.append(str(path))
            compiled = subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-d", str(work / "classes"), *files], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=30)
            if compiled.returncode:
                raise AssertionError("device negative did not compile: " + label + "\n" + compiled.stdout + compiled.stderr)
            result = subprocess.run([SUPPORT["JAVA"], "-cp", str(work / "classes"), "ls.augment.com.hook.TestFocusWindowHook"], capture_output=True, text=True, encoding="utf-8", errors="replace", env=SUPPORT["ENV"], timeout=30)
            if result.returncode == 0 or expected not in result.stdout + result.stderr:
                raise AssertionError("device negative survived or failed for another reason: " + label + "\n" + result.stdout + result.stderr)
            print("PASS actual device compiled runtime negative: " + label)


if __name__ == "__main__":
    main()
