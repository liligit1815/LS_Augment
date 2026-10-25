"""Production navigation notification reader plus real Root/Client dispatch slices.

The notification service facade enforces permission/AppOps itself; it deliberately
returns profile/ALL items so production user and package-UID checks are exercised.
No device notification content or screen pixels are collected.
"""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile
import sys

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
MEMBER = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))["member"]

STUBS = {
"android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=100000L;public static long elapsedRealtime(){return now;}}",
"android/os/Build.java": "package android.os;public class Build {public static class VERSION {public static int SDK_INT=36;}}",
"android/os/Process.java": "package android.os;public class Process {public static int uid;public static int myUid(){return uid;}public static int myPid(){return 6789;}}",
"android/os/Binder.java": "package android.os;public class Binder {public static int uid=10515;public static int getCallingUid(){return uid;}}",
"android/os/UserHandle.java": "package android.os;public class UserHandle {private final int user;public UserHandle(int u){user=u;}public static UserHandle getUserHandleForUid(int uid){return new UserHandle(uid/100000);}public boolean equals(Object o){return o instanceof UserHandle&&((UserHandle)o).user==user;}}",
"android/os/Bundle.java": r'''package android.os;import java.util.*;public class Bundle {
 public static final Object CREATOR=new Object();public final Map<String,Object> values=new HashMap<>();public void setClassLoader(ClassLoader c){}
 public Object get(String k){return values.get(k);}public boolean containsKey(String k){return values.containsKey(k);}public Set<String> keySet(){return values.keySet();}
 public void putDouble(String k,double v){values.put(k,v);}public double getDouble(String k,double d){Object v=values.get(k);return v instanceof Double?(Double)v:d;}
 public void putBundle(String k,Bundle b){values.put(k,b);}public Bundle getBundle(String k){Object v=values.get(k);return v instanceof Bundle?(Bundle)v:null;}
 public void putBoolean(String k,boolean v){values.put(k,v);}public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}
 public void putLong(String k,long v){values.put(k,v);}public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);}public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);}
 public void putInt(String k,int v){values.put(k,v);}public int getInt(String k){return (Integer)values.getOrDefault(k,0);}
 public void putString(String k,String v){values.put(k,v);}public String getString(String k){return (String)values.get(k);}
 public String getString(String k,String d){return (String)values.getOrDefault(k,d);}
 public void putCharSequence(String k,CharSequence v){values.put(k,v);}public CharSequence getCharSequence(String k){return (CharSequence)values.get(k);}public CharSequence[] getCharSequenceArray(String k){return (CharSequence[])values.get(k);}public void putCharSequenceArray(String k,CharSequence[] v){values.put(k,v);}}
''',
"android/os/Parcel.java": r'''package android.os;import java.util.*;public class Parcel {
 public final List<Object> data=new ArrayList<>();int position;public boolean recycled;public static Parcel obtain(){return new Parcel();}
 public void writeInterfaceToken(String v){data.add(v);}public void enforceInterface(String v){if(!v.equals(data.get(position++)))throw new SecurityException("descriptor");}
 public void writeInt(int v){data.add(v);}public int readInt(){return (Integer)data.get(position++);}public void writeString(String v){data.add(v);}public String readString(){return (String)data.get(position++);}
 public void enforceNoDataAvail(){if(position!=data.size())throw new IllegalArgumentException("trailing payload");}
 public void writeNoException(){}public void readException(){}public void writeTypedObject(Object v,int f){data.add(v);}
 @SuppressWarnings("unchecked") public <T>T readTypedObject(Object creator){return (T)data.get(position++);}public void recycle(){recycled=true;}}
''',
"android/os/IBinder.java": "package android.os;public interface IBinder {default boolean isBinderAlive(){return true;}boolean transact(int code,Parcel data,Parcel reply,int flags)throws RemoteException;}",
"android/os/RemoteException.java": "package android.os;public class RemoteException extends Exception {public RemoteException(String s){super(s);}}",
"android/os/Looper.java": "package android.os;public class Looper {public static final Looper MAIN=new Looper();public static boolean main;public static Looper myLooper(){return main?MAIN:null;}public static Looper getMainLooper(){return MAIN;}}",
"android/content/ComponentName.java": "package android.content;public class ComponentName {public static ComponentName unflattenFromString(String s){return s!=null&&s.contains(\"/\")?new ComponentName():null;}}",
"android/content/Context.java": r'''package android.content;public class Context {
 public static final String APP_OPS_SERVICE="appops";public static Context current;public int permission=0,permissionChecks;public final android.app.AppOpsManager ops=new android.app.AppOpsManager();public final android.content.pm.PackageManager packages=new android.content.pm.PackageManager();
 public Object getSystemService(String name){return ops;}public android.content.pm.PackageManager getPackageManager(){return packages;}
 public int checkPermission(String p,int pid,int uid){permissionChecks++;if(!p.equals("android.permission.ACCESS_NOTIFICATIONS")||pid!=6789||uid!=0)throw new AssertionError("wrong real permission identity");return permission;}}
''',
"android/content/pm/PackageManager.java": r'''package android.content.pm;import java.util.*;public class PackageManager {
 public static final int PERMISSION_GRANTED=0;public final Map<String,Integer> owners=new HashMap<>();public int lastUser=-1,lookups;
 public int getPackageUidAsUser(String p,int user)throws NameNotFoundException{lastUser=user;lookups++;Integer uid=owners.get(p+":"+user);if(uid==null)throw new NameNotFoundException("private package");return uid;}
 public static class NameNotFoundException extends Exception {public NameNotFoundException(String s){super(s);}}}
''',
"android/app/AppOpsManager.java": r'''package android.app;public class AppOpsManager {
 public static final int MODE_ALLOWED=0,MODE_DEFAULT=3;public int mode,notes;public RuntimeException error;public int noteOpNoThrow(int op,int uid,String pkg,String tag,String message){notes++;if(op!=25||uid!=0||!"android".equals(pkg)||tag!=null||message!=null)throw new AssertionError("borrowed identity or wrong AppOp");if(error!=null)throw error;return mode;}}
''',
"android/app/ActivityManager.java": "package android.app;public class ActivityManager {public static int current=10,index;public static int[] sequence;public static int getCurrentUser(){return sequence==null?current:sequence[Math.min(index++,sequence.length-1)];}}",
"android/app/Notification.java": r'''package android.app;public class Notification {
 public static final int FLAG_ONGOING_EVENT=2,FLAG_GROUP_SUMMARY=512,VISIBILITY_SECRET=-1;public static final String CATEGORY_NAVIGATION="navigation",EXTRA_TITLE="title",EXTRA_TEXT="text",EXTRA_SUB_TEXT="subtext",EXTRA_BIG_TEXT="bigtext",EXTRA_TEXT_LINES="lines",EXTRA_TITLE_BIG="bigtitle";
 public int flags=2,visibility,criticalCalls;public String category,critical;public boolean missingCritical;public android.os.Bundle extras=new android.os.Bundle();public android.widget.RemoteViews contentView,bigContentView,headsUpContentView;
 public String getShortCriticalText(){criticalCalls++;if(missingCritical)throw new NoSuchMethodError("optional API");return critical;}}
''',
"android/widget/RemoteViews.java": r'''package android.widget;import java.util.*;
public class RemoteViews {
 private ArrayList<Object> mActions=new ArrayList<>();private RemoteViews mLandscape,mPortrait;private List<RemoteViews> mSizedRemoteViews;private boolean mHasDrawInstructions;private final String pkg;
 public RemoteViews(String pkg){this.pkg=pkg;}public String getPackage(){return pkg;}public void apply(){throw new AssertionError("executed third-party layout");}
 public void setText(int id,CharSequence text){mActions.add(new ReflectionAction(id,"setText",10,text));}
 public void nonText(int id){mActions.add(new ReflectionAction(id,"setText",4,42));}public void hide(int id,int visibility){mActions.add(new ReflectionAction(id,"setVisibility",4,visibility));}
 public void add(int id,RemoteViews child){mActions.add(new ViewGroupActionAdd(id,child));}public void unsupported(){mActions.add(new ResourceReflectionAction());}public void image(Object image){mActions.add(new ReflectionAction(99,"setImageBitmap",12,image));}
 public void variants(){mPortrait=new RemoteViews(pkg);mLandscape=new RemoteViews(pkg);}public void sized(){mSizedRemoteViews=List.of(new RemoteViews(pkg));}
 public void drawInstructions(){mHasDrawInstructions=true;}
 public static class Action {private final int mViewId;Action(int id){mViewId=id;}}
 public static class BaseReflectionAction extends Action {private final String mMethodName;private final int mType;BaseReflectionAction(int id,String m,int type){super(id);mMethodName=m;mType=type;}}
 public static class ReflectionAction extends BaseReflectionAction {private final Object mValue;ReflectionAction(int id,String m,int t,Object v){super(id,m,t);mValue=v;}}
 public static class ViewGroupActionAdd extends Action {private final RemoteViews mNestedViews;ViewGroupActionAdd(int id,RemoteViews child){super(id);mNestedViews=child;}}
 public static class ResourceReflectionAction extends Action {ResourceReflectionAction(){super(0);}}
}
''',
"android/service/notification/StatusBarNotification.java": r'''package android.service.notification;public class StatusBarNotification {
 public int user=10,uid=1010011;public String pkg="com.autonavi.minimap";public long posted=1;public android.app.Notification notification=new android.app.Notification();public boolean poison;
 public String key="notification-key";public String getKey(){return key;}public android.os.UserHandle getUser(){if(poison)throw new AssertionError("scanned beyond limit");return new android.os.UserHandle(user);}public int getUid(){return uid;}public String getPackageName(){return pkg;}public android.app.Notification getNotification(){return notification;}public long getPostTime(){return posted;}}
''',
"android/app/INotificationManager.java": r'''package android.app;import android.service.notification.StatusBarNotification;
public interface INotificationManager {
 StatusBarNotification[] getActiveNotificationsWithAttribution(String pkg,String tag);
 public static class Source implements INotificationManager {
  public StatusBarNotification[] items=new StatusBarNotification[0];public int calls;public RuntimeException error;public LinkageError linkage;public Runnable during;
  public StatusBarNotification[] getActiveNotificationsWithAttribution(String pkg,String tag){calls++;android.content.Context c=android.content.Context.current;
   if(!"android".equals(pkg)||tag!=null||android.os.Process.myUid()!=0)throw new AssertionError("service caller identity changed");
   if(c.checkPermission("android.permission.ACCESS_NOTIFICATIONS",android.os.Process.myPid(),android.os.Process.myUid())!=0)throw new SecurityException("original enforcePermission");
   int mode=c.ops.noteOpNoThrow(25,android.os.Process.myUid(),pkg,tag,null);if(mode!=0&&mode!=3)return new StatusBarNotification[0];
   if(error!=null)throw error;if(linkage!=null)throw linkage;if(during!=null)during.run();return items;
  }
 }
}

''',
"android/app/NotificationManager.java": "package android.app;public class NotificationManager {public static INotificationManager.Source service=new INotificationManager.Source();public static Object getService(){return service;}}",
"ls/augment/com/AtomicWorkbenchDiagnostics.java": r'''package ls.augment.com;public class AtomicWorkbenchDiagnostics {
 public static final java.util.List<String> events=new java.util.ArrayList<>();public static void emit(String e,int w,int u,String c,int d,String detail,Throwable error){if(error!=null)throw new AssertionError("Throwable content passed to navigation diagnostics");events.add(e+";"+detail);}}
'''
}

# The authenticated NMS transport is covered by notification-chronometers/media-evidence.
# Here its frozen reply is a boundary for actual navigation state/candidate matching.
STUBS['ls/augment/com/AtomicWorkbenchMediaSessionEvidenceClient.java'] = 'package ls.augment.com;final class AtomicWorkbenchMediaSessionEvidenceClient {interface Principal {android.os.Bundle current()throws Exception;}}'
STUBS['ls/augment/com/AtomicWorkbenchNotificationRecord.java'] = '''package ls.augment.com;final class AtomicWorkbenchNotificationRecord {
 final String key,pkg,generation;final int uid,user;final long postTime;AtomicWorkbenchNotificationRecord(String k,String p,int i,int u,long t,String g){key=k;pkg=p;uid=i;user=u;postTime=t;generation=g;}}'''
STUBS['ls/augment/com/AtomicWorkbenchNotificationEvidenceClient.java'] = '''package ls.augment.com;final class AtomicWorkbenchNotificationEvidenceClient {
 static Snapshot next;static Runnable during;static int queries;static class Snapshot {final java.util.List<AtomicWorkbenchNotificationRecord> records;Snapshot(AtomicWorkbenchNotificationRecord r){records=java.util.List.of(r);}}
 AtomicWorkbenchNotificationEvidenceClient(int u,AtomicWorkbenchMediaSessionEvidenceClient.Principal p){}Snapshot query(){queries++;if(during!=null)during.run();return next;}}'''

TEST = r'''package ls.augment.com;import android.app.*;import android.content.*;import android.os.*;import android.service.notification.*;
public class TestAtomicWorkbenchNavigation {
 static int cases,checks;static void check(boolean b,String m){checks++;if(!b)throw new AssertionError(m);}static void test(Runnable r){SystemClock.now=100000L;Build.VERSION.SDK_INT=36;ActivityManager.current=10;ActivityManager.index=0;ActivityManager.sequence=null;android.os.Process.uid=0;NotificationManager.service=new INotificationManager.Source();AtomicWorkbenchNotificationEvidenceClient.next=null;AtomicWorkbenchNotificationEvidenceClient.during=null;r.run();cases++;}
 static class F {Context c=new Context();AtomicWorkbenchNavigation nav;F(){Context.current=c;nav=new AtomicWorkbenchNavigation(c,10);}
  StatusBarNotification active(){StatusBarNotification n=new StatusBarNotification();n.notification.extras.putString(Notification.EXTRA_TITLE,"私密路线-title 正在导航");n.notification.extras.putString(Notification.EXTRA_TEXT,"私密路线-text 200米后右转");n.notification.extras.putString(Notification.EXTRA_SUB_TEXT,"私密路线-sub 路口");c.packages.owners.put(n.pkg+":10",n.uid);NotificationManager.service.items=new StatusBarNotification[]{n};return n;}
  StatusBarNotification generic(){StatusBarNotification n=active();n.notification.extras.putString("title","高德地图正在导航");n.notification.extras.putString("text","");n.notification.extras.putString("subtext","");return n;}
  android.widget.RemoteViews remote(StatusBarNotification n){android.widget.RemoteViews r=new android.widget.RemoteViews(n.pkg);n.notification.contentView=r;return r;}
  Bundle state(){return nav.state();}void inactive(String status){Bundle b=state();check(!b.getBoolean("active")&&b.getString("title").isEmpty()&&b.getString("subtitle").isEmpty(),"old content leaked after "+status);check(b.getString("navigation_status").equals(status),"wrong status "+b.getString("navigation_status"));if(!b.getBoolean("has_session"))check(b.getString("package").isEmpty(),"stale navigation owner after "+status);}
 }
 public static void main(String[] args)throws Exception {
 test(()->{F f=new F();StatusBarNotification n=f.active();String generation="a".repeat(33);AtomicWorkbenchNotificationEvidenceClient.next=new AtomicWorkbenchNotificationEvidenceClient.Snapshot(new AtomicWorkbenchNotificationRecord(n.key,n.pkg,n.uid,n.user,n.posted,generation));f.nav=new AtomicWorkbenchNavigation(f.c,10,()->new Bundle());Bundle b=f.state();check(b.getBoolean("active")&&b.getString("navigation_source_generation").equals(generation),"exact live NMS lifetime absent");n.notification.extras.putString("text","前方300米后左转");check(f.state().getString("navigation_source_generation").equals(generation),"ordinary guidance update guessed route ID");});
 for(int mode=0;mode<5;mode++){final int mismatch=mode;test(()->{F f=new F();StatusBarNotification n=f.active();AtomicWorkbenchNotificationEvidenceClient.next=new AtomicWorkbenchNotificationEvidenceClient.Snapshot(new AtomicWorkbenchNotificationRecord(mismatch==0?"other":n.key,mismatch==1?"other.map":n.pkg,mismatch==2?n.uid+1:n.uid,mismatch==3?n.user+1:n.user,mismatch==4?n.posted+1:n.posted,"a".repeat(33)));f.nav=new AtomicWorkbenchNavigation(f.c,10,()->new Bundle());Bundle b=f.state();check(b.getBoolean("active")&&b.getString("navigation_source_generation").isEmpty(),"mismatched NMS source granted new-event identity");});}
 test(()->{F f=new F();f.active();f.nav=new AtomicWorkbenchNavigation(f.c,10,()->new Bundle());check(f.state().getString("navigation_source_generation").isEmpty(),"unavailable evidence invented generation");AtomicWorkbenchNotificationEvidenceClient.during=()->ActivityManager.current=11;f.inactive("user_changed");});
 test(()->{F f=new F();f.active();f.nav=new AtomicWorkbenchNavigation(f.c,10,()->new Bundle());AtomicWorkbenchNotificationEvidenceClient.during=()->f.c.permission=-1;f.inactive("permission_denied");});
 test(()->{android.os.Process.uid=10515;boolean denied=false;try{new AtomicWorkbenchNavigation(new Context(),0);}catch(SecurityException expected){denied=true;}check(denied,"app could construct Root reader");});
 test(()->{F f=new F();StatusBarNotification n=f.active();Bundle b=f.state();check(b.getBoolean("success")&&b.getBoolean("available")&&b.getBoolean("active")&&b.getBoolean("has_session")&&b.getBoolean("has_guidance"),"real ongoing guidance not active");check(b.getString("title").equals(n.notification.extras.getString("text"))&&!b.getString("title").contains("正在导航")&&b.getString("subtitle").isEmpty(),"generic app status used as guidance or content invented");check(f.c.ops.notes==3&&f.c.permissionChecks==3&&f.c.packages.lastUser==10,"real root identity permission/AppOps/user package checks bypassed");});
 test(()->{F f=new F();f.active();check(f.state().getBoolean("active"),"precondition");NotificationManager.service.items=new StatusBarNotification[0];f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();check(f.state().getBoolean("active"),"precondition");n.notification.flags=0;f.inactive("no_navigation");});
 for(String stopped:new String[]{"导航已结束","已到达目的地","已到达终点 XX路","导航已停止","已停止导航","到达目的地","不在导航中","you have arrived"})test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.extras.putString("text",stopped);f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.extras.putString("title","高德地图");n.notification.extras.putString("text","定位服务正在运行，打开首页查看附近");n.notification.extras.putString("subtext","");f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.pkg="org.example.navigation";n.notification.category=Notification.CATEGORY_NAVIGATION;n.notification.extras.putString("title","实际通知标题");n.notification.extras.putString("text","实际通知说明");f.c.packages.owners.put(n.pkg+":10",n.uid);Bundle b=f.state();check(!b.getBoolean("active")&&b.getBoolean("has_session")&&!b.getBoolean("has_guidance")&&b.getString("navigation_status").equals("no_guidance"),"category alone falsely claimed actual route guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.pkg="org.example.fake";f.c.packages.owners.put(n.pkg+":10",n.uid);f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.user=-1;f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.user=11;f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.uid=1110011;f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();f.c.packages.owners.put(n.pkg+":10",1010099);f.inactive("no_navigation");});
 test(()->{F f=new F();f.active();f.c.packages.owners.clear();f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.flags|=512;f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.visibility=-1;f.inactive("no_navigation");});
 test(()->{F f=new F();f.active();f.c.permission=-1;f.inactive("permission_denied");check(NotificationManager.service.calls==0,"service queried after prepermission denied");});
 test(()->{F f=new F();f.active();check(f.state().getBoolean("active"),"precondition");f.c.permission=-1;f.inactive("permission_denied");});
 test(()->{F f=new F();f.active();f.c.ops.mode=1;f.inactive("permission_denied");check(NotificationManager.service.calls==0,"service queried after AppOp denial");});
 test(()->{F f=new F();f.active();f.c.ops.mode=3;check(f.state().getBoolean("active"),"MODE_DEFAULT+granted permission diverged from real NMS");});
 test(()->{F f=new F();f.active();NotificationManager.service.during=()->f.c.permission=-1;f.inactive("permission_denied");});
 test(()->{F f=new F();f.active();NotificationManager.service.during=()->f.c.ops.mode=2;f.inactive("permission_denied");});
 test(()->{F f=new F();f.active();ActivityManager.current=11;f.inactive("user_changed");check(NotificationManager.service.calls==0,"different foreground user queried");});
 test(()->{F f=new F();f.active();ActivityManager.sequence=new int[]{10,11};f.inactive("user_changed");});
 test(()->{F f=new F();f.active();ActivityManager.sequence=new int[]{10,10,11};f.inactive("user_changed");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.extras.putString("title","正在导航 "+"私".repeat(2000));n.notification.extras.putString("text","200米右转\n"+"路".repeat(2000));n.notification.extras.putString("subtext","点".repeat(2000));Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").length()<=160&&b.getString("subtitle").length()<=160&&b.getString("subtext").length()<=160&&!b.getString("subtitle").contains("\n"),"text/output bound or control stripping failed");});
 test(()->{F f=new F();StatusBarNotification n=f.active();StatusBarNotification poison=new StatusBarNotification();poison.poison=true;StatusBarNotification[] all=new StatusBarNotification[300];java.util.Arrays.fill(all,null);all[255]=n;all[256]=poison;NotificationManager.service.items=all;Bundle b=f.state();check(b.getBoolean("active")&&b.getInt("scanned")==256&&b.getBoolean("scan_limited"),"scan bound not exact or not disclosed");});
 test(()->{F f=new F();StatusBarNotification old=f.active();StatusBarNotification recent=f.active();recent.posted=9;recent.notification.extras.putString("text","300米后右转 新指引");NotificationManager.service.items=new StatusBarNotification[]{recent,old};check(f.state().getString("title").contains("新指引"),"latest real candidate not selected");});
 test(()->{F f=new F();f.active();NotificationManager.service.error=new IllegalStateException("私密路线 service failure");f.inactive("temporary_error");NotificationManager.service.error=null;check(f.state().getBoolean("active"),"transient failure permanently cached");});
 test(()->{F f=new F();f.active();NotificationManager.service.error=new SecurityException("私密路线 secret");f.inactive("permission_denied");});
 test(()->{F f=new F();f.active();NotificationManager.service.linkage=new NoSuchMethodError("私密路线 privateapi");f.inactive("unsupported");});
 test(()->{F f=new F();f.active();NotificationManager.service.items=null;f.inactive("temporary_error");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.extras.putString("title","高德地图");n.notification.extras.putString("text","500米后左转");n.notification.extras.putString("subtext","");check(f.state().getBoolean("active"),"explicit maneuver+distance not recognized");});
 test(()->{Bundle b=AtomicWorkbenchNavigation.closed();check(!b.getBoolean("active")&&!b.getBoolean("available")&&!b.getBoolean("success")&&b.getString("navigation_status").equals("closed"),"closing state stale or active");});
 test(()->{F f=new F();f.generic();Bundle b=f.state();check(b.getBoolean("available")&&b.getBoolean("has_session")&&!b.getBoolean("active")&&!b.getBoolean("has_guidance")&&b.getString("navigation_status").equals("no_guidance"),"generic navigating status was still treated as route guidance");check(b.getString("title").isEmpty()&&b.getString("subtitle").isEmpty()&&b.getString("message").contains("未取得"),"generic status leaked into details or lacked honest empty state");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("text","点击回到地图");Bundle b=f.state();check(b.getBoolean("available")&&b.getBoolean("has_session")&&!b.getBoolean("has_guidance")&&!b.getBoolean("active"),"observed title/text-only navigation falsely advertised route guidance");check(b.getString("package").equals(n.pkg)&&b.getString("message").contains("请查看地图窗口"),"verified current map owner or actionable guidance limitation missing");String d=AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1);check(d.contains("field_mask=80")&&d.contains("remote_present=false")&&d.contains("reason=notification_without_guidance"),"observed notification shape lost safe reason evidence");});
 test(()->{F f=new F();StatusBarNotification n=f.active();Bundle b=f.state();check(b.getString("package").equals(n.pkg),"real guidance missing verified map owner");n.notification.extras.putString("text","点击回到地图");b=f.state();check(b.getBoolean("has_session")&&!b.getBoolean("has_guidance")&&b.getString("title").isEmpty()&&b.getString("subtitle").isEmpty(),"guidance withdrawn while same navigation session remained did not clear old route");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString(Notification.EXTRA_BIG_TEXT,"私密BIG 前方300米后左转进入中山路");Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").equals("私密BIG 前方300米后左转进入中山路"),"real big text guidance not preferred over generic title");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putCharSequenceArray(Notification.EXTRA_TEXT_LINES,new CharSequence[]{"高德地图正在导航","前方200米右转","剩余12分钟"});Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").equals("前方200米右转")&&b.getString("subtitle").equals("剩余12分钟"),"bounded inbox lines did not preserve real guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString(Notification.EXTRA_TITLE_BIG,"进入长安街");check(f.state().getString("title").equals("进入长安街"),"expanded actual title ignored");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.critical="350米";Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").equals("350米")&&n.notification.criticalCalls==1,"API36 real short critical distance ignored");});
 test(()->{F f=new F();StatusBarNotification n=f.active();n.notification.missingCritical=true;check(f.state().getBoolean("active")&&n.notification.criticalCalls==1,"API36 optional missing critical getter disabled real ordinary guidance");});
 test(()->{Build.VERSION.SDK_INT=35;F f=new F();StatusBarNotification n=f.generic();n.notification.critical="350米";Bundle b=f.state();check(!b.getBoolean("active")&&b.getString("navigation_status").equals("no_guidance")&&n.notification.criticalCalls==0,"API35 optional getter invoked or claimed unsupported content");});
 test(()->{Build.VERSION.SDK_INT=35;F f=new F();StatusBarNotification n=f.active();n.notification.missingCritical=true;check(f.state().getBoolean("active")&&n.notification.criticalCalls==0,"API35 ordinary guidance lost or optional getter invoked");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"高德地图正在导航");r.setText(2,"前方150米右转");r.setText(3,"剩余18分钟");Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").equals("前方150米右转")&&b.getString("subtitle").equals("剩余18分钟"),"framework setText actions were not read as actual guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n),child=new android.widget.RemoteViews(n.pkg);child.setText(2,"进入中山路");r.add(10,child);check(f.state().getString("title").equals("进入中山路"),"bounded nested real setText missing");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();f.remote(n).setText(1,"高德地图正在导航");n.notification.bigContentView=new android.widget.RemoteViews(n.pkg);n.notification.bigContentView.setText(2,"前方600米左转");check(f.state().getString("title").equals("前方600米左转"),"expanded remote source did not precede compact generic view");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.setText(1,"前方900米左转");Bundle b=f.state();check(b.getString("title").equals("前方900米左转")&&!b.getString("subtitle").contains("200"),"old overridden action text resurrected");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.setText(1,null);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.hide(1,8);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n),child=new android.widget.RemoteViews(n.pkg);child.setText(2,"前方200米右转");r.add(10,child);r.hide(10,4);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.nonText(1);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.unsupported();f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.variants();f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.sized();f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.add(10,r);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);for(int i=0;i<6;i++){android.widget.RemoteViews child=new android.widget.RemoteViews(n.pkg);r.add(i,child);r=child;}r.setText(1,"前方200米右转");f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);for(int i=0;i<129;i++)r.setText(1,i==0?"前方200米右转":null);f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);for(int i=0;i<17;i++){android.widget.RemoteViews child=new android.widget.RemoteViews(n.pkg);child.setText(1,"前方200米右转");r.add(i,child);}f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);for(int i=0;i<17;i++)r.setText(i,"前方200米右转");f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.image(new Object(){public String toString(){throw new AssertionError("read image");}});check(f.state().getBoolean("active"),"text parsing executed or inspected image data");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.contentView=new android.widget.RemoteViews("unrelated.owner");n.notification.contentView.setText(1,"前方200米右转");f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();f.remote(n).setText(1,"前方200米右转");check(f.state().getBoolean("active"),"precondition");NotificationManager.service.items=new StatusBarNotification[0];f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();f.remote(n).setText(1,"前方200米右转");check(f.state().getBoolean("active"),"precondition");f.c.permission=-1;f.inactive("permission_denied");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();f.remote(n).setText(1,"前方200米右转");f.c.packages.owners.put(n.pkg+":10",1110011);f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();f.remote(n).setText(1,"前方200米右转");n.notification.bigContentView=new android.widget.RemoteViews(n.pkg);n.notification.bigContentView.setText(1,"已到达目的地");f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.setText(2,"结束导航");check(f.state().getBoolean("active"),"end-navigation action label treated as an ended event");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString(Notification.EXTRA_BIG_TEXT,"已到达目的地");f.remote(n).setText(1,"前方200米右转");f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("text","中山路");check(f.state().getBoolean("active"),"real road name rejected for confirmed session");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("text","剩余16分钟");check(f.state().getString("title").equals("剩余16分钟"),"remaining-time text not preserved");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("title","高德地图");n.notification.extras.putString("text","距离您200米的附近地点");f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification real=f.active();StatusBarNotification generic=f.generic();generic.posted=99;NotificationManager.service.items=new StatusBarNotification[]{real,generic};check(f.state().getBoolean("has_guidance"),"new generic session overrode real existing guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.hide(1,8);r.hide(1,0);check(f.state().getBoolean("active"),"last visibility state not respected");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putCharSequenceArray(Notification.EXTRA_TEXT_LINES,new CharSequence[]{"高德地图正在导航","","","","","","","","前方300米右转"});f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras=null;n.notification.category=Notification.CATEGORY_NAVIGATION;f.remote(n).setText(1,"前方300米右转");check(f.state().getBoolean("active"),"null standard extras prevented valid RemoteViews guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();android.widget.RemoteViews r=f.remote(n);r.setText(1,"前方200米右转");r.drawInstructions();f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("text","未获取到右转指引，正在加载中");f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.notification.extras.putString("text","高德地图正在导航，请注意道路安全");f.inactive("no_guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();int[] reads={0};CharSequence huge=new CharSequence(){public int length(){return Integer.MAX_VALUE;}public char charAt(int i){reads[0]++;String head="前方200米右转";return i<head.length()?head.charAt(i):'路';}public CharSequence subSequence(int s,int e){throw new AssertionError("unbounded subsequence");}public String toString(){throw new AssertionError("unbounded toString");}};f.remote(n).setText(1,huge);Bundle b=f.state();check(b.getBoolean("active")&&b.getString("title").length()<=160&&reads[0]<=160,"remote text read/toString unbounded");});
 test(()->{String d=String.join("\n",AtomicWorkbenchDiagnostics.events);check(!d.contains("私密")&&!d.contains("新指引")&&!d.contains("200米")&&!d.contains("1010011")&&!d.contains("autonavi"),"navigation text/package/UID leaked to diagnostics");check(d.contains("permission_denied")&&d.contains("user_changed")&&d.contains("NAVIGATION_CAPABILITY"),"capability metadata missing");check(d.contains("source=remote_text")&&d.contains("source=big_text")&&d.contains("remote_error=limit")&&d.contains("remote_error=layout_unsupported")&&d.contains("has_guidance=false"),"field/source/unknown evidence not diagnosed");});

 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.TITLE,"前方300米右转进入中山路");e.putString(AtomicWorkbenchAmapData.CONTENT,"剩余18分钟");e.putLong(AtomicWorkbenchAmapData.UPDATED,99900L);Bundle b=f.state();check(b.getBoolean("has_guidance")&&b.getString("title").equals("前方300米右转进入中山路")&&b.getString("subtitle").equals("剩余18分钟"),"scoped actual Amap route not preferred over static generic notification");check(AtomicWorkbenchDiagnostics.events.get(AtomicWorkbenchDiagnostics.events.size()-1).contains("source=amap_route"),"actual route bridge source missing");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.TITLE,"前方300米右转");e.putLong(AtomicWorkbenchAmapData.UPDATED,93999L);Bundle b=f.state();check(!b.getBoolean("has_guidance")&&b.getString("title").isEmpty()&&b.getString("message").contains("已过期"),"old Amap route retained after its actual update expired");e.putLong(AtomicWorkbenchAmapData.UPDATED,100001L);check(!f.state().getBoolean("has_guidance"),"future Amap time accepted");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.SOURCE,"spoken");e.putString(AtomicWorkbenchAmapData.TITLE,"500米后右转");e.putLong(AtomicWorkbenchAmapData.UPDATED,80000L);Bundle b=f.state();check(b.getBoolean("has_guidance")&&b.getString("title").equals("500米后右转")&&b.getString("subtitle").equals("最近导航播报 · 20秒前"),"recent actual spoken instruction missing or falsely advertised as live turn information");SystemClock.now=125001L;check(!f.state().getBoolean("has_guidance"),"spoken guidance did not expire");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"ended");e.putString(AtomicWorkbenchAmapData.TITLE,"前方300米右转");e.putLong(AtomicWorkbenchAmapData.UPDATED,99999L);f.inactive("no_navigation");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"unsupported");check(!f.state().getBoolean("has_guidance")&&f.state().getString("message").contains("尚未适配"),"unsupported installed Amap bridge silently advertised success");e.putString(AtomicWorkbenchAmapData.STATUS,"waiting");check(f.state().getString("message").contains("等待实际"),"waiting bridge not distinguished from absent scope");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();n.pkg="com.tencent.map";f.c.packages.owners.put(n.pkg+":10",n.uid);Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.TITLE,"前方300米右转");e.putLong(AtomicWorkbenchAmapData.UPDATED,99999L);check(!f.state().getBoolean("has_guidance"),"other map app injected Amap protocol fields");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,2);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.TITLE,"前方300米右转");e.putLong(AtomicWorkbenchAmapData.UPDATED,99999L);check(!f.state().getBoolean("has_guidance"),"unknown Amap protocol version accepted");});
 test(()->{F f=new F();f.generic();check(f.state().getString("message").contains("LSPosed"),"missing Amap scope lacked actionable phone-side prerequisite");});


 test(()->{check(AtomicWorkbenchAmapData.fresh(7000L,1000L)&&!AtomicWorkbenchAmapData.fresh(7001L,1000L)&&!AtomicWorkbenchAmapData.fresh(1000L,1001L),"live route expiry boundary incorrect");check(AtomicWorkbenchAmapData.fresh(46000L,1000L,true)&&!AtomicWorkbenchAmapData.fresh(46001L,1000L,true),"explicit recent spoken guidance expiry boundary incorrect");String text=AtomicWorkbenchAmapData.text("前方\n300米\u202e右转"+"路".repeat(200));check(text.length()<=160&&!text.contains("\n")&&!text.contains("\u202e"),"bridge text bound or direction-control filtering incorrect");});


 test(()->{F f=new F();StatusBarNotification n=f.active();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.SOURCE,"spoken");e.putString(AtomicWorkbenchAmapData.TITLE,"旧播报500米后左转");e.putLong(AtomicWorkbenchAmapData.UPDATED,80000L);Bundle b=f.state();check(b.getString("title").equals(e.getString("text"))&&!b.getString("subtitle").contains("旧播报"),"older spoken maneuver overrode or mixed into actual current standard guidance");});
 test(()->{F f=new F();StatusBarNotification n=f.generic();Bundle e=n.notification.extras;e.putInt(AtomicWorkbenchAmapData.VERSION,1);e.putString(AtomicWorkbenchAmapData.STATUS,"active");e.putString(AtomicWorkbenchAmapData.SOURCE,"spoken");e.putString(AtomicWorkbenchAmapData.TITLE,"旧播报500米后左转");e.putLong(AtomicWorkbenchAmapData.UPDATED,80000L);f.remote(n).setText(1,"前方100米右转");Bundle b=f.state();check(b.getString("title").equals("前方100米右转")&&!b.getString("subtitle").contains("旧播报"),"spoken fallback hid an actual current RemoteViews maneuver");});
 TransportTests.run();
 System.out.println("NAVIGATION RESULT "+cases+" cases; "+checks+" assertions + transport checks");
 }
}
'''


def transport_sources():
    root = (SUPPORT["SRC"] / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
    client = (SUPPORT["SRC"] / "AtomicWorkbenchClient.java").read_text(encoding="utf-8")
    auth = root[root.index('if (Binder.getCallingUid() != appUid)'):root.index('if (code == AtomicWorkbenchProtocol.TX_TOUCH')]
    # Extraction invalidation is covered by its dedicated Root suite; retain the exact
    # common auth, not unrelated C8 geometry fields, in this navigation transport slice.
    if 'if (invalidatesExtractionGeometry(code))' in auth:
        auth=auth[:auth.index('if (invalidatesExtractionGeometry(code))')]
    start = root.index('} else if (code == AtomicWorkbenchProtocol.TX_NAVIGATION_STATE)')
    branch = root[start:root.index('} else if (code == AtomicWorkbenchProtocol.TX_FOCUS_APP)', start)]
    body = branch[branch.index('{') + 1:]
    transport = r'''package ls.augment.com;import android.os.*;import android.content.*;import java.util.concurrent.Callable;
class NavigationRoot implements IBinder {
 final Context context;final int userId=10,appUid=10515;String token="a".repeat(64);boolean closing,finished;int engineCalls,registrations;AtomicWorkbenchNavigation navigation;
 NavigationRoot(Context c){context=c;}Bundle systemSessionMetadata(){return new Bundle();}void awaitRegistration(){registrations++;}Bundle execute(Callable<Bundle> action)throws Exception{engineCalls++;return action.call();}
 public boolean transact(int code,Parcel data,Parcel reply,int flags)throws RemoteException {
 AUTH
 Bundle state;if(code==AtomicWorkbenchProtocol.TX_NAVIGATION_STATE){ BRANCH }else throw new AssertionError("wrong transaction");
 reply.writeNoException();reply.writeTypedObject(state,0);return true;
 }
 NAVIGATION
}
class AtomicWorkbenchProvider {
 static final java.util.concurrent.atomic.AtomicInteger touches=new java.util.concurrent.atomic.AtomicInteger(),stops=new java.util.concurrent.atomic.AtomicInteger(),merges=new java.util.concurrent.atomic.AtomicInteger();static volatile Runnable beforeTouch;
 static void reset(){touches.set(0);stops.set(0);merges.set(0);beforeTouch=null;}
 static void touchNavigation(Object owner){touches.incrementAndGet();Runnable r=beforeTouch;if(r!=null)r.run();}
 static void stopNavigation(Object owner){stops.incrementAndGet();}static Bundle mergeNavigation(Object owner,Bundle state){merges.incrementAndGet();return state;}
}
class AtomicWorkbenchClient {
 // Navigation fixtures return no storage scope; its production parser and provenance checks remain compiled.
 final java.util.concurrent.atomic.AtomicReference<String> failure=new java.util.concurrent.atomic.AtomicReference<>();IBinder taskStorageScopeEndpoint;
 AtomicWorkbenchClient recoveryClient;IBinder endpoint;static class Pending{String token="a".repeat(64);}Pending pending=new Pending();int reports;
 final Object navigationLock=new Object();long navigationGeneration;boolean navigationStopped,closed;
 interface ParcelWriter{void write(Parcel d);}IBinder requireEndpoint(){return endpoint;}void reportFailure(String m){reports++;}
 CLIENT
}
class TransportTests {
 static int checks;static void check(boolean v,String s){checks++;if(!v)throw new AssertionError(s);}static Parcel packet(String token,boolean extra){Parcel p=Parcel.obtain();p.writeInterfaceToken(AtomicWorkbenchProtocol.DESCRIPTOR);p.writeInt(AtomicWorkbenchProtocol.VERSION);p.writeString(token);if(extra)p.writeInt(4);return p;}
 static void await(java.util.concurrent.CountDownLatch latch){try{if(!latch.await(3,java.util.concurrent.TimeUnit.SECONDS))throw new AssertionError("race timeout");}catch(InterruptedException e){throw new AssertionError(e);}}
 static void join(Thread thread)throws Exception{thread.join(4000);check(!thread.isAlive(),"consumer lifecycle deadlock");}
 interface Action{void run()throws Exception;}static Thread start(Action action,java.util.concurrent.atomic.AtomicReference<Throwable> failure){Thread thread=new Thread(()->{try{action.run();}catch(Throwable t){failure.set(t);}});thread.start();return thread;}
 static final class BlockingEndpoint implements IBinder {final java.util.concurrent.CountDownLatch entered=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1);boolean fail;public boolean transact(int code,Parcel data,Parcel reply,int flags)throws RemoteException{entered.countDown();await(release);if(fail)throw new RemoteException("injected lost Root reply");Bundle state=new Bundle();state.putBoolean("owner_user_current",true);state.putBoolean("success",true);state.putString("navigation_status","no_navigation");reply.writeNoException();reply.writeTypedObject(state,0);return true;}}
 static void run()throws Exception {
  android.os.Process.uid=0;android.app.ActivityManager.current=10;android.app.ActivityManager.sequence=null;Binder.uid=10515;Context c=new Context();Context.current=c;android.app.NotificationManager.service=new android.app.INotificationManager.Source();NavigationRoot r=new NavigationRoot(c);AtomicWorkbenchClient client=new AtomicWorkbenchClient();client.endpoint=r;
  Bundle b=client.navigationState();check(b.getBoolean("available")&&!b.getBoolean("active")&&r.engineCalls==1&&r.registrations==1,"actual Root navigation branch not executed");
  r.closing=true;b=client.navigationState();check(b.getString("navigation_status").equals("closed")&&!b.getBoolean("active"),"Root closing guard lost");r.closing=false;
  for(int kind=0;kind<3;kind++){boolean denied=false;try{Binder.uid=kind==0?12345:10515;Parcel p=packet(kind==1?"b".repeat(64):r.token,kind==2);r.transact(AtomicWorkbenchProtocol.TX_NAVIGATION_STATE,p,Parcel.obtain(),0);}catch(SecurityException|IllegalArgumentException expected){denied=true;}check(denied,"UID/token/trailing-data gate bypass "+kind);}Binder.uid=10515;
  Looper.main=true;boolean denied=false;try{client.navigationState();}catch(IllegalStateException expected){denied=true;}finally{Looper.main=false;}check(denied,"client main-thread guard lost");
  AtomicWorkbenchClient recovery=new AtomicWorkbenchClient();NavigationRoot rr=new NavigationRoot(c);recovery.endpoint=rr;client.recoveryClient=recovery;int old=r.engineCalls;client.navigationState();check(rr.engineCalls==1&&r.engineCalls==old,"client recovery route bypassed");
  client.recoveryClient=null;AtomicWorkbenchProvider.reset();client.stopNavigation();int touches=AtomicWorkbenchProvider.touches.get(),merges=AtomicWorkbenchProvider.merges.get();client.navigationState();check(AtomicWorkbenchProvider.touches.get()==touches&&AtomicWorkbenchProvider.merges.get()==merges,"late navigationState resurrected stopped consumer");
  client.resumeNavigation();client.navigationState();check(AtomicWorkbenchProvider.touches.get()==touches+1&&AtomicWorkbenchProvider.merges.get()==merges+1,"explicit UI resume did not permit a new consumer ticket");
  AtomicWorkbenchProvider.reset();BlockingEndpoint blocked=new BlockingEndpoint();AtomicWorkbenchClient racing=new AtomicWorkbenchClient();racing.endpoint=blocked;java.util.concurrent.atomic.AtomicReference<Throwable> failure=new java.util.concurrent.atomic.AtomicReference<>();Thread request=start(()->racing.navigationState(),failure);await(blocked.entered);racing.stopNavigation();blocked.release.countDown();join(request);check(failure.get()==null&&AtomicWorkbenchProvider.touches.get()==1&&AtomicWorkbenchProvider.merges.get()==0,"stop during Root request still merged memory");
  AtomicWorkbenchProvider.reset();BlockingEndpoint duringTouch=new BlockingEndpoint();AtomicWorkbenchClient touching=new AtomicWorkbenchClient();touching.endpoint=duringTouch;java.util.concurrent.CountDownLatch touchingNow=new java.util.concurrent.CountDownLatch(1),releaseTouch=new java.util.concurrent.CountDownLatch(1);AtomicWorkbenchProvider.beforeTouch=()->{touchingNow.countDown();await(releaseTouch);};failure.set(null);Thread touchingRequest=start(()->touching.navigationState(),failure);await(touchingNow);java.util.concurrent.CountDownLatch stopStarted=new java.util.concurrent.CountDownLatch(1);Thread stopping=start(()->{stopStarted.countDown();touching.stopNavigation();},failure);await(stopStarted);releaseTouch.countDown();join(stopping);await(duringTouch.entered);duringTouch.release.countDown();join(touchingRequest);check(failure.get()==null&&AtomicWorkbenchProvider.stops.get()==1&&AtomicWorkbenchProvider.merges.get()==0,"stop interleaving with touch merged a revoked ticket");AtomicWorkbenchProvider.beforeTouch=null;
  AtomicWorkbenchProvider.reset();BlockingEndpoint lateFailure=new BlockingEndpoint();lateFailure.fail=true;AtomicWorkbenchClient recovering=new AtomicWorkbenchClient();recovering.endpoint=lateFailure;java.util.concurrent.atomic.AtomicReference<Throwable> expectedFailure=new java.util.concurrent.atomic.AtomicReference<>();Thread oldRequest=start(()->recovering.navigationState(),expectedFailure);await(lateFailure.entered);recovering.stopNavigation();recovering.resumeNavigation();recovering.endpoint=r;recovering.navigationState();int stopCount=AtomicWorkbenchProvider.stops.get(),mergeCount=AtomicWorkbenchProvider.merges.get();lateFailure.release.countDown();join(oldRequest);check(expectedFailure.get() instanceof RemoteException&&AtomicWorkbenchProvider.stops.get()==stopCount&&AtomicWorkbenchProvider.merges.get()==mergeCount,"old request failure revoked a newer resumed consumer");
  AtomicWorkbenchProvider.reset();AtomicWorkbenchClient closedClient=new AtomicWorkbenchClient();closedClient.closed=true;closedClient.navigationStopped=true;closedClient.endpoint=r;closedClient.resumeNavigation();closedClient.navigationState();check(AtomicWorkbenchProvider.touches.get()==0&&AtomicWorkbenchProvider.merges.get()==0,"closed client resumed memory consumption");
  AtomicWorkbenchProvider.reset();BlockingEndpoint stoppedEntry=new BlockingEndpoint();AtomicWorkbenchClient stoppedQuery=new AtomicWorkbenchClient();stoppedQuery.endpoint=stoppedEntry;stoppedQuery.stopNavigation();failure.set(null);Thread stoppedRequest=start(()->stoppedQuery.navigationState(),failure);await(stoppedEntry.entered);stoppedQuery.resumeNavigation();stoppedQuery.endpoint=r;stoppedQuery.navigationState();int resumedMerges=AtomicWorkbenchProvider.merges.get();stoppedEntry.release.countDown();join(stoppedRequest);check(failure.get()==null&&AtomicWorkbenchProvider.touches.get()==1&&AtomicWorkbenchProvider.merges.get()==resumedMerges,"request entered while stopped merged after later resume");
  System.out.println("NAVIGATION TRANSPORT PASS "+checks+" checks; production auth/Root branch/Client request/header/recovery/worker and stop-resume race methods");
 }
}
'''
    transport = transport.replace("AUTH", auth).replace("BRANCH", body).replace("NAVIGATION\n", MEMBER(root, "private AtomicWorkbenchNavigation navigation()") + "\n")
    methods = "\n".join(MEMBER(client, signature) for signature in [
        "public Bundle navigationState() throws Exception", "public void resumeNavigation()", "public void stopNavigation()",
        "private Bundle request(int code, ParcelWriter writer) throws Exception",
        "private Bundle requestOnEndpoint(IBinder binder, int code, ParcelWriter writer) throws Exception",
        "static int taskStorageScope(Bundle response)",
        "private void writeHeader(Parcel data)", "private static void requireWorkerThread()"])
    transport = transport.replace("CLIENT\n", methods + "\n")
    # The real serial execute reports checked failures through its result contract.
    transport = transport.replace("Bundle execute(Callable<Bundle> action)throws Exception{engineCalls++;return action.call();}",
        "Bundle execute(Callable<Bundle> action){engineCalls++;try{return action.call();}catch(RuntimeException e){throw e;}catch(Exception e){throw new RuntimeException(e);}}")
    return transport.replace("import java.util.concurrent.Callable;", "import java.util.concurrent.Callable;import java.io.IOException;")


def main():
    sources = {**STUBS, "ls/augment/com/TestAtomicWorkbenchNavigation.java": TEST,
               "ls/augment/com/TransportTests.java": transport_sources()}
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-navigation-") as temporary:
        SUPPORT["compile_run"](Path(temporary), sources, ["AtomicWorkbenchNavigation.java", "AtomicWorkbenchProtocol.java", "AtomicWorkbenchAmapData.java"],
                               "ls.augment.com.TestAtomicWorkbenchNavigation")
    probe = r'''package ls.augment.com;import android.app.*;import android.content.*;import android.os.*;import android.service.notification.*;
public class MissingApiProbe {public static void main(String[] args){Context c=new Context();Context.current=c;StatusBarNotification n=new StatusBarNotification();
n.notification.category=Notification.CATEGORY_NAVIGATION;n.notification.extras.putString("title","private navigation");c.packages.owners.put(n.pkg+":10",n.uid);NotificationManager.service.items=new StatusBarNotification[]{n};
Bundle b=new AtomicWorkbenchNavigation(c,10).state();if(b.getBoolean("active")||b.getBoolean("available")||!b.getString("navigation_status").equals("unsupported"))throw new AssertionError("missing API misreported");
System.out.println("NAVIGATION actual missing reflection API: unsupported, empty; 3 checks");}}'''
    for variant in ("query", "appop", "package_uid", "remote_fields"):
        changed = dict(STUBS)
        if variant == "query":
            key = "android/app/INotificationManager.java"
            changed[key] = changed[key].replace("getActiveNotificationsWithAttribution", "getLegacyNotifications")
        elif variant == "appop":
            for key in ("android/app/AppOpsManager.java", "android/app/INotificationManager.java"):
                changed[key] = changed[key].replace("noteOpNoThrow", "noteLegacyOpNoThrow")
        elif variant == "package_uid":
            key = "android/content/pm/PackageManager.java"
            changed[key] = changed[key].replace("getPackageUidAsUser", "getLegacyPackageUid")
        else:
            key = "android/widget/RemoteViews.java"
            changed[key] = changed[key].replace("mActions", "mUnknownActions")
        current_probe = probe
        if variant == "remote_fields":
            current_probe = probe.replace('Bundle b=new AtomicWorkbenchNavigation(c,10).state();',
                'n.notification.contentView=new android.widget.RemoteViews(n.pkg);n.notification.contentView.setText(1,"前方200米右转");Bundle b=new AtomicWorkbenchNavigation(c,10).state();')
            current_probe = current_probe.replace('b.getBoolean("active")||b.getBoolean("available")||!b.getString("navigation_status").equals("unsupported")',
                'b.getBoolean("active")||!b.getBoolean("available")||!b.getString("navigation_status").equals("no_guidance")||!AtomicWorkbenchDiagnostics.events.get(0).contains("remote_error=fields_unavailable")')
            current_probe = current_probe.replace('unsupported, empty; 3 checks', 'RemoteViews fields unavailable: no_guidance, empty; 4 checks')
        with tempfile.TemporaryDirectory(prefix="lsa-navigation-missing-") as temporary:
            SUPPORT["compile_run"](Path(temporary), {**changed, "ls/augment/com/MissingApiProbe.java": current_probe},
                                   ["AtomicWorkbenchNavigation.java", "AtomicWorkbenchAmapData.java"], "ls.augment.com.MissingApiProbe")
    # Compile against the API36 getter, then remove it from the runtime facade.
    # This exercises real invokevirtual linkage, not only a method throwing a fake error.
    optional_probe = r'''package ls.augment.com;import android.app.*;import android.content.*;import android.os.*;import android.service.notification.*;
public class OptionalCriticalProbe {public static void main(String[] args){Build.VERSION.SDK_INT=Integer.parseInt(args[0]);boolean missing=args.length>1;
Context c=new Context();Context.current=c;StatusBarNotification n=new StatusBarNotification();n.notification.category=Notification.CATEGORY_NAVIGATION;n.notification.critical="350米";
n.notification.extras.putString(Notification.EXTRA_TEXT,"前方200米右转");c.packages.owners.put(n.pkg+":10",n.uid);NotificationManager.service.items=new StatusBarNotification[]{n};
Bundle b=new AtomicWorkbenchNavigation(c,10).state();boolean useCritical=Build.VERSION.SDK_INT>=36&&!missing;
if(!b.getBoolean("available")||!b.getBoolean("active")||!b.getString("title").equals(useCritical?"350米":"前方200米右转")||n.notification.criticalCalls!=(useCritical?1:0))throw new AssertionError("optional getter version/linkage fallback failed");
System.out.println("NAVIGATION optional getter runtime: API"+Build.VERSION.SDK_INT+" getter="+(missing?"actually_absent":"present")+"; 4 checks");}}'''
    with tempfile.TemporaryDirectory(prefix="lsa-navigation-optional-runtime-") as temporary:
        work = Path(temporary)
        SUPPORT["compile_run"](work, {**STUBS, "ls/augment/com/OptionalCriticalProbe.java": optional_probe},
                               ["AtomicWorkbenchNavigation.java", "AtomicWorkbenchAmapData.java"], "ls.augment.com.OptionalCriticalProbe", arguments=("36",))
        notification = work / "android/app/Notification.java"
        notification.write_text(STUBS["android/app/Notification.java"].replace("getShortCriticalText", "getLegacyCriticalText"), encoding="utf-8")
        subprocess.run([SUPPORT["JAVAC"], "--release", "17", "-encoding", "UTF-8", "-cp", str(work / "classes"),
                        "-d", str(work / "classes"), str(notification)], check=True, timeout=45, env=SUPPORT["ENV"])
        for sdk in ("35", "36"):
            subprocess.run([SUPPORT["JAVA"], "-Dfile.encoding=UTF-8", "-cp", str(work / "classes"),
                            "ls.augment.com.OptionalCriticalProbe", sdk, "missing"], check=True, timeout=25, env=SUPPORT["ENV"])
    root = Path(__file__).resolve().parents[1]
    with tempfile.TemporaryDirectory(prefix="lsa-navigation-sdk-") as temporary:
        stub = Path(temporary) / "AtomicWorkbenchDiagnostics.java"
        stub.write_text(STUBS["ls/augment/com/AtomicWorkbenchDiagnostics.java"], encoding="utf-8")
        subprocess.run(["C:/Program Files/Android/openjdk/jdk-21.0.8/bin/javac.exe" if os.name == "nt" else "javac",
                        "-encoding", "UTF-8", "-cp", str(root / "audit-output/android-sdk/platforms/android-36/android.jar"),
                        "-d", temporary, str(stub), *[str(SUPPORT["SRC"]/name) for name in ("AtomicWorkbenchNavigation.java","AtomicWorkbenchAmapData.java","AtomicWorkbenchNotificationRecord.java","AtomicWorkbenchNotificationEvidenceClient.java","AtomicWorkbenchMediaSessionEvidenceClient.java")]], check=True)
    print("NAVIGATION production Android SDK36 compile passed")
    if '--negative-controls' in sys.argv:
        original=(SUPPORT['SRC']/'AtomicWorkbenchNavigation.java').read_text(encoding='utf-8')
        for label,before,after in (
            ('wrong-key-grants-generation','key.equals(record.key)&&',''),
            ('wrong-owner-grants-generation','uid==record.uid&&',''),
            ('old-post-grants-generation','&&posted==record.postTime',''),
            ('source-query-bypassed','sourceGeneration=verifiedSourceGeneration(best.key,best.packageName,best.uid,userId,best.posted,proof);','sourceGeneration="";')):
            assert before in original,label+' anchor changed'
            mutant={**sources,'ls/augment/com/AtomicWorkbenchNavigation.java':original.replace(before,after,1)}
            for name in ('AtomicWorkbenchProtocol','AtomicWorkbenchAmapData'):
                mutant['ls/augment/com/'+name+'.java']=(SUPPORT['SRC']/(name+'.java')).read_text(encoding='utf-8')
            with tempfile.TemporaryDirectory(prefix='lsa-navigation-source-mutant-') as temporary:
                try:
                    SUPPORT['compile_run'](Path(temporary),mutant,[], 'ls.augment.com.TestAtomicWorkbenchNavigation')
                except subprocess.CalledProcessError as killed:
                    if killed.cmd[0]!=SUPPORT['JAVA']: raise
                    print('NEGATIVE CONTROL killed:',label)
                else: raise AssertionError(label+' escaped production state assertions')


if __name__ == "__main__":
    main()
