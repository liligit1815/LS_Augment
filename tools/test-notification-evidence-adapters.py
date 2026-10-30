"""Run real notification hook installation/discovery and identity gates against OEM-shaped boundaries."""
from pathlib import Path
import runpy, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
BASE=runpy.run_path(str(ROOT/'tools/test-atomic-workbench-media-evidence.py'))
JDK=BASE['JDK']/'bin'
keys=['io/github/libxposed/api/XposedInterface.java','ls/augment/com/hook/AugmentModule.java',
      'android/os/Bundle.java','android/os/Parcel.java','android/os/IBinder.java','android/os/Binder.java',
      'android/os/SystemClock.java','android/os/ServiceManager.java','android/os/UserHandle.java',
      'android/media/session/MediaSession.java','android/app/Notification.java','android/service/notification/StatusBarNotification.java']
S={k:BASE['STUBS'][k] for k in keys}
S.update({
'android/graphics/Bitmap.java':'package android.graphics;public class Bitmap {public int getAllocationByteCount(){return 0;}}',
'android/content/Context.java':'package android.content;public class Context {}',
'android/os/Process.java':'package android.os;public class Process {public static int uid=1000;public static int myUid(){return uid;}}',
'android/app/INotificationManager.java':'''package android.app;import android.os.*;public interface INotificationManager {
 class Stub implements IBinder {public boolean isBinderAlive(){return true;}public boolean transact(int c,Parcel d,Parcel r,int f){return false;}
 public boolean onTransact(int c,Parcel d,Parcel r,int f){return false;}}}''',
'ls/augment/com/hook/AtomicWorkbenchSystemRootAuthority.java':'''package ls.augment.com.hook;import android.content.*;import android.os.*;
 final class AtomicWorkbenchSystemRootAuthority {static Session authenticate(Context c,Bundle b,int uid,int pid){throw new SecurityException();}
 static class Session {int userId;boolean isCurrent(Context c){return false;}boolean isAlive(){return false;}}}''',
'ls/augment/com/hook/AtomicWorkbenchNotificationActionsBroker.java':'''package ls.augment.com.hook;final class AtomicWorkbenchNotificationActionsBroker {
 static final int TX=0xD04E05;static void prepare(ClassLoader l){}static void handle(Object o,android.os.Parcel d,android.os.Parcel r){throw new AssertionError("unauthenticated action");}}''',
'com/android/server/notification/NotificationRecord.java':'''package com.android.server.notification;public class NotificationRecord {
 public android.service.notification.StatusBarNotification getSbn(){return new android.service.notification.StatusBarNotification();}}''',
'com/android/server/notification/NotificationManagerService.java':'''package com.android.server.notification;import android.os.*;public class NotificationManagerService {
 public final Object mNotificationLock=new Object();public final java.util.Map<String,NotificationRecord> mNotificationsByKey=new java.util.HashMap<>();
 public IBinder mService;public int starts,removes;public android.content.Context getContext(){return new android.content.Context();}
 public void onStart(){starts++;ServiceManager.services.put("notification",mService);}
 public boolean removeFromNotificationListsLocked(NotificationRecord r){removes++;return true;}
 public class NotificationListeners {public int posts;public void notifyPostedLocked(NotificationRecord n,NotificationRecord old,boolean all){posts++;}}
 public static class Stub {public Object this$0;} // A real but incompatible old class must not mask a valid candidate.
}''',
'ls/augment/com/hook/TestNotificationAdapters.java':'''package ls.augment.com.hook;
import android.os.*;import com.android.server.notification.*;
public class TestNotificationAdapters {
 static int checks;static void yes(boolean v,String m){checks++;if(!v)throw new AssertionError(m);}
 public static class NewBinder extends android.app.INotificationManager.Stub {
  public final NotificationManagerService owner;public int originals;NewBinder(NotificationManagerService n){owner=n;}
  @Override public boolean onTransact(int c,Parcel d,Parcel r,int f){originals++;return false;}}
 public static class Child extends NewBinder {Child(NotificationManagerService n){super(n);}}
 public static class Ambiguous extends NewBinder {public NotificationManagerService another;Ambiguous(NotificationManagerService n){super(n);another=n;}}
 public static class Missing extends android.app.INotificationManager.Stub {public Object this$0;}
 static void rejects(Class<?> c)throws Exception{try{new AtomicWorkbenchNotificationAdapter(NotificationManagerService.class,android.app.INotificationManager.Stub.class,c,Parcel.class);throw new AssertionError("accepted "+c);}catch(NoSuchFieldException expected){checks++;}}
 public static void main(String[]args)throws Throwable {
  rejects(Missing.class);rejects(Ambiguous.class);rejects(NotificationManagerService.Stub.class);
  var n=new NotificationManagerService();String mode=args[0];Object binder;
  if(mode.equals("legacy"))binder=Class.forName("com.android.server.notification.NotificationManagerService$13").getConstructor(NotificationManagerService.class).newInstance(n);
  else binder=mode.equals("unknown")?new Missing():mode.equals("subclass")?new Child(n):new NewBinder(n);
  n.mService=(IBinder)binder;boolean delayed=mode.equals("delayed");if(!delayed)ServiceManager.services.put("notification",binder);
  var m=new AugmentModule();yes(AtomicWorkbenchNotificationEvidenceHook.install(m,TestNotificationAdapters.class.getClassLoader())==1,"install/discovery: "+m.logs);
  if(mode.equals("unknown")){
   m.invoke(n,"onStart",new Class<?>[0]);yes(!AtomicWorkbenchNotificationEvidenceHook.isInstalled(),"unknown owner structure stays unavailable");
   yes(Boolean.FALSE.equals(m.invoke(binder,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},0xD04E04,Parcel.obtain(),Parcel.obtain(),0)),"unknown structure preserves native behavior");
   System.out.println("PASS notification unknown: "+checks+" fail-closed guards");return;
  }
  if(delayed){yes(!AtomicWorkbenchNotificationEvidenceHook.isInstalled(),"pending is not ready");m.invoke(n,"onStart",new Class<?>[0]);yes(n.starts==1,"native startup preserved");}
  yes(AtomicWorkbenchNotificationEvidenceHook.isInstalled(),"actual binder discovered: "+m.logs);
  yes(AtomicWorkbenchNotificationEvidenceHook.localService()==n,"published owner bound");
  Object result=m.invoke(binder,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},1,Parcel.obtain(),Parcel.obtain(),0);
  yes(Boolean.FALSE.equals(result),"native transactions pass through");
  Parcel reply=Parcel.obtain();result=m.invoke(binder,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},0xD04E04,Parcel.obtain(),reply,0);
  yes(Boolean.TRUE.equals(result),"private transaction routed");reply.readException();yes(!reply.readBundle(null).getBoolean("success"),"malformed/authless read denied");
  var adapter=new AtomicWorkbenchNotificationAdapter(NotificationManagerService.class,android.app.INotificationManager.Stub.class,binder.getClass(),Parcel.class);
  n.mService=new Missing();try{adapter.owner(binder);throw new AssertionError("stale owner accepted");}catch(IllegalAccessException expected){checks++;}
  var listener=n.new NotificationListeners();m.invoke(listener,"notifyPostedLocked",new Class<?>[]{NotificationRecord.class,NotificationRecord.class,boolean.class},new NotificationRecord(),null,true);
  yes(listener.posts==1,"tracking refusal cannot interrupt native notification posting");
  System.out.println("PASS notification "+mode+": "+checks+" discovery/type/inheritance/identity/passthrough guards");
 }
}'''
})
# The old name exists only in the legacy run. Other runs must discover real objects.
LEGACY='''package com.android.server.notification;public class NotificationManagerService$13 extends android.app.INotificationManager.Stub {
 public final NotificationManagerService this$0;public NotificationManagerService$13(NotificationManagerService s){this$0=s;}}
'''
for mode in ['legacy','modern','subclass','delayed','unknown']:
    with tempfile.TemporaryDirectory(prefix='duo-notification-adapter-') as folder:
        paths=[]
        sources=dict(S)
        if mode=='legacy':sources['com/android/server/notification/NotificationManagerService$13.java']=LEGACY
        for name,code in sources.items():
            p=Path(folder)/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(code,encoding='utf8');paths.append(str(p))
        paths.extend(str(SRC/'hook'/f'{n}.java') for n in ['AtomicWorkbenchNotificationAdapter','AtomicWorkbenchNotificationEvidenceHook','AtomicWorkbenchNotificationRecords','AtomicWorkbenchMediaEvidenceReflect'])
        subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','--release','17','-d',folder,*paths],check=True)
        subprocess.run([str(JDK/'java.exe'),'-cp',folder,'ls.augment.com.hook.TestNotificationAdapters',mode],check=True)
