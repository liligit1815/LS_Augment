"""Execute actual C8 callbacks, media/NMS hooks, shared authority, wire codec and Root media controls.

Android/system-server objects are deterministic boundaries. No phone runtime is replaced by these tests.
"""
from pathlib import Path
import argparse
import os
import runpy
import subprocess
import tempfile

BASE = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-media-extended.py")))
HOME = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-home-hook.py")))
ROOT, SRC, JDK = BASE["ROOT"], BASE["SRC"], BASE["JDK"]
PRODUCTION = BASE["PRODUCTION"] + ["hook/AtomicWorkbenchMediaEvidenceReflect", "hook/AtomicWorkbenchNotificationRecords",
    "hook/AtomicWorkbenchNotificationEvidenceHook", "hook/AtomicWorkbenchMediaSessionEvidenceHook", "hook/AtomicWorkbenchSystemRootAuthority",
    "AtomicWorkbenchNotificationRecord", "AtomicWorkbenchNotificationEvidenceClient", "AtomicWorkbenchNotifications"]
STUBS = dict(BASE["STUBS"])
for name in ("io/github/libxposed/api/XposedInterface.java", "ls/augment/com/hook/AugmentModule.java"):
    STUBS[name] = HOME["SOURCES"][name]
STUBS["android/os/Bundle.java"] = STUBS["android/os/Bundle.java"].rsplit("}", 1)[0] + '''
 public boolean getBoolean(String k,boolean fallback){Object o=values.get(k);return o instanceof Boolean?(Boolean)o:fallback;}
 public void putBinder(String k,IBinder b){values.put(k,b);}public IBinder getBinder(String k){return (IBinder)values.get(k);}}
'''
STUBS["android/os/Binder.java"] = '''package android.os;public class Binder {
 public static int uid,pid=44;public static int getCallingUid(){return uid;}public static int getCallingPid(){return pid;}
 public static long clearCallingIdentity(){long old=((long)uid<<32)|(pid&0xffffffffL);uid=1000;pid=777;return old;}
 public static void restoreCallingIdentity(long old){uid=(int)(old>>32);pid=(int)old;}}
'''
STUBS["android/net/Uri.java"] = 'package android.net;public class Uri {public final String value;private Uri(String v){value=v;}public static Uri parse(String v){return new Uri(v);}public String toString(){return value;}}'
STUBS["android/content/Context.java"] = STUBS["android/content/Context.java"].replace('public Object getSystemService', 'public final ContentResolver resolver=new ContentResolver();public ContentResolver getContentResolver(){return resolver;}public Object getSystemService')
STUBS["android/content/ContentResolver.java"] = '''package android.content;import android.os.*;import android.net.Uri;
public class ContentResolver {
 public static IBinder owner,endpoint;public static boolean current=true;public static int calls;public static Runnable during;
 public Bundle call(Uri uri,String method,String arg,Bundle auth){com.android.server.media.Locks.none();calls++;
  if(!uri.toString().equals("content://"+auth.getInt("user")+"@ls.augment.com.workbench")||!method.equals("system_root_session")||Binder.uid!=1000)throw new SecurityException();
  Bundle r=new Bundle();r.putInt("version",1);r.putBoolean("current",current);r.putString("nonce",auth.getString("nonce"));r.putBinder("owner",owner);
  for(String k:new String[]{"uid","user","root_pid"})r.putInt(k,auth.getInt(k));for(String k:new String[]{"session","reset_generation"})r.putLong(k,auth.getLong(k));
  if(during!=null)during.run();return r;}}
'''
STUBS["android/app/Notification.java"] = STUBS["android/app/Notification.java"].replace('public int visibility,flags;', 'public String category;public int visibility,flags;')
STUBS.update({
 "com/android/server/media/Locks.java": '''package com.android.server.media;public class Locks {
 public static Object nms,media;public static void none(){if(nms!=null&&Thread.holdsLock(nms)||media!=null&&Thread.holdsLock(media))throw new AssertionError("IPC under subsystem lock");}
 public static void media(){if(!Thread.holdsLock(media)||Thread.holdsLock(nms))throw new AssertionError("media lock missing or nested");}
 public static void nms(){if(!Thread.holdsLock(nms)||Thread.holdsLock(media))throw new AssertionError("NMS lock missing or nested");}}
''',
 "com/android/server/media/MediaSessionRecord.java": '''package com.android.server.media;import android.media.session.*;public class MediaSessionRecord {
 public int mOwnerUid=1010123,mUserId=10;public String mPackageName="media.p1010123";public MediaSession.Token mSessionToken;public Object mController=new android.os.IBinder(){public boolean isBinderAlive(){return true;}public boolean transact(int c,android.os.Parcel d,android.os.Parcel r,int f){return false;}},mLock=new Object();public boolean mDestroyed;
 public boolean isClosed(){Locks.media();if(!Thread.holdsLock(mLock))throw new AssertionError("record lock missing");return mDestroyed;}}
''',
 "com/android/server/media/MediaSessionService.java": '''package com.android.server.media;import android.os.*;import android.media.session.*;import ls.augment.com.hook.AugmentModule;
 public class MediaSessionService {
 public final Object mLock=new Object();public final android.content.Context mContext;public MediaSessionRecord record;public Runnable during;public int reads;
 public MediaSessionService(android.content.Context c){mContext=c;}public MediaSessionRecord getMediaSessionRecordLocked(MediaSession.Token t){Locks.media();reads++;if(during!=null)during.run();return record!=null&&t.equals(record.mSessionToken)?record:null;}
 public class SessionManagerImpl implements IBinder {
  public final AugmentModule module;public int originals;public SessionManagerImpl(AugmentModule m){module=m;}
  public boolean isBinderAlive(){return true;}public boolean onTransact(int code,Parcel d,Parcel r,int flags){originals++;return false;}
  public boolean transact(int code,Parcel d,Parcel r,int flags)throws Exception{int old=android.os.Process.uid;android.os.Process.uid=1000;
   try{return (Boolean)module.invoke(this,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},code,d,r,flags);}
   catch(Exception e){throw e;}catch(Throwable t){throw new RuntimeException(t);}finally{android.os.Process.uid=old;}}
 }}
''',
 "com/android/server/notification/NotificationRecord.java": '''package com.android.server.notification;public class NotificationRecord {
 public final android.service.notification.StatusBarNotification notification;public NotificationRecord(android.service.notification.StatusBarNotification n){notification=n;}
 public android.service.notification.StatusBarNotification getSbn(){com.android.server.media.Locks.nms();return notification;}}
''',
 "com/android/server/notification/NotificationManagerService.java": '''package com.android.server.notification;import android.os.*;import ls.augment.com.hook.AugmentModule;
 public class NotificationManagerService {
  public final Object mNotificationLock=new Object();public final java.util.Map<String,NotificationRecord> mNotificationsByKey=new java.util.HashMap<>();
  public IBinder mService;public final android.content.Context context;public final AugmentModule module;public final NotificationListeners listeners=new NotificationListeners();
  public NotificationManagerService(android.content.Context c,AugmentModule m){context=c;module=m;}
  public android.content.Context getContext(){return context;}
  public boolean removeFromNotificationListsLocked(NotificationRecord r){com.android.server.media.Locks.nms();return mNotificationsByKey.remove(r.notification.getKey())!=null;}
  public class NotificationListeners {public void notifyPostedLocked(NotificationRecord n,NotificationRecord old,boolean notifyAll){com.android.server.media.Locks.nms();}}
  public void publish(NotificationRecord r)throws Throwable{synchronized(mNotificationLock){NotificationRecord old=mNotificationsByKey.put(r.notification.getKey(),r);module.invoke(listeners,"notifyPostedLocked",new Class<?>[]{NotificationRecord.class,NotificationRecord.class,boolean.class},r,old,true);}}
  public void remove(NotificationRecord r)throws Throwable{synchronized(mNotificationLock){module.invoke(this,"removeFromNotificationListsLocked",new Class<?>[]{NotificationRecord.class},r);}}
 }
''',
 "com/android/server/notification/NotificationManagerService$13.java": '''package com.android.server.notification;import android.os.*;import ls.augment.com.hook.AugmentModule;
 public class NotificationManagerService$13 implements IBinder {
 public final NotificationManagerService this$0;public final AugmentModule module;public int originals;public NotificationManagerService$13(NotificationManagerService s,AugmentModule m){this$0=s;module=m;}
 public boolean isBinderAlive(){return true;}public boolean onTransact(int code,Parcel d,Parcel r,int flags){originals++;return false;}
 public boolean transact(int code,Parcel d,Parcel r,int flags)throws Exception{int old=android.os.Process.uid;android.os.Process.uid=1000;
  try{return (Boolean)module.invoke(this,"onTransact",new Class<?>[]{int.class,Parcel.class,Parcel.class,int.class},code,d,r,flags);}
  catch(Exception e){throw e;}catch(Throwable t){throw new RuntimeException(t);}finally{android.os.Process.uid=old;}}
 }
''',
 "ls/augment/com/hook/MediaBootstrap.java": '''package ls.augment.com.hook;public class MediaBootstrap {
 public static final AugmentModule module=new AugmentModule();public static void install(){ClassLoader l=MediaBootstrap.class.getClassLoader();
 if(AtomicWorkbenchNotificationEvidenceHook.install(module,l)!=1||AtomicWorkbenchMediaSessionEvidenceHook.install(module,l)!=1||!AtomicWorkbenchMediaSessionEvidenceHook.isInstalled())throw new AssertionError("install failed "+module.logs);}}
''',
})

TEST = r'''package ls.augment.com;
import android.os.*;import android.os.Process;import android.app.*;import android.content.*;import android.media.session.*;import android.service.notification.*;
import com.android.server.media.*;import com.android.server.notification.*;import ls.augment.com.hook.MediaBootstrap;import java.util.*;
public class TestMediaEvidence {
 static int cases,checks,ids;interface Case{void run()throws Throwable;}static void test(String n,Case c)throws Throwable{c.run();cases++;System.out.println("PASS C8 media: "+n);}static void yes(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static final long ALL=PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_SKIP_TO_NEXT|PlaybackState.ACTION_SET_RATING;
 static class Live implements IBinder{boolean alive=true;public boolean isBinderAlive(){return alive;}public boolean transact(int c,Parcel d,Parcel r,int f){return false;}}
 static final class F {
  final Context context=new Context();final Live endpoint=new Live(),owner=new Live();final MediaSessionManager manager=new MediaSessionManager();
  final MediaSessionService service=new MediaSessionService(context);final MediaSessionService.SessionManagerImpl binder=service.new SessionManagerImpl(MediaBootstrap.module);
  final NotificationManagerService nms=new NotificationManagerService(context,MediaBootstrap.module);final NotificationManagerService$13 notificationBinder=new NotificationManagerService$13(nms,MediaBootstrap.module);
  final MediaController player=new MediaController(1010123,++ids,PlaybackState.STATE_PAUSED,ALL);final AtomicWorkbenchMedia media;
  StatusBarNotification notification;NotificationRecord record;Bundle auth;
  F()throws Throwable{
   ActivityManager.current=10;ActivityManager.sequence=null;ActivityManager.index=0;SystemClock.now=10000;Process.uid=0;Binder.uid=0;Binder.pid=44;Looper.main=null;
   ContentResolver.current=true;ContentResolver.calls=0;ContentResolver.during=null;ContentResolver.owner=owner;ContentResolver.endpoint=endpoint;context.service=manager;context.permission=0;
   Locks.nms=nms.mNotificationLock;Locks.media=service.mLock;nms.mService=notificationBinder;ServiceManager.services.clear();ServiceManager.services.put("media_session",binder);ServiceManager.services.put("notification",notificationBinder);
   service.record=new MediaSessionRecord();service.record.mSessionToken=player.token;notification=notification(player);record=new NotificationRecord(notification);nms.publish(record);
   NotificationManager.service=new NotificationManager.Service();NotificationManager.service.notifications=new StatusBarNotification[]{notification};
   auth=new Bundle();auth.putInt("version",1);auth.putInt("uid",1010555);auth.putInt("user",10);auth.putLong("session",1);auth.putLong("reset_generation",7);auth.putInt("root_pid",44);auth.putBinder("endpoint",endpoint);auth.putString("token","a".repeat(64));auth.putString("nonce","b".repeat(32));
   media=new AtomicWorkbenchMedia(context,10,()->new Bundle(auth));
  }
  AtomicWorkbenchMediaSessionEvidenceClient.Evidence proof(){return new AtomicWorkbenchMediaSessionEvidenceClient(()->new Bundle(auth)).query(notification,player.token);}
  Bundle state(){return media.state();}
  void repost()throws Throwable{nms.remove(record);notification=notification(player);record=new NotificationRecord(notification);nms.publish(record);NotificationManager.service.notifications=new StatusBarNotification[]{notification};}
 }
 static StatusBarNotification notification(MediaController p){StatusBarNotification n=new StatusBarNotification();n.uid=p.token.uid;n.user=10;n.pkg=p.pkg;n.key="media-key-"+p.token.id;n.notification.extras.putParcelable(Notification.EXTRA_MEDIA_SESSION,p.token);return n;}
 static Bundle request(String source){Bundle b=new Bundle();b.putInt("schema",1);b.putString("request_id",String.format("%032x",++ids));b.putString("source_id",source);b.putString("track_id","");b.putLong("created_elapsed",10000);b.putLong("deadline_elapsed",15000);return b;}
 public static void main(String[] args)throws Throwable{
  MediaBootstrap.install();
  test("actual private TX plus shared fresh authority proves notification-only controller",()->{F f=new F();AtomicWorkbenchMediaSessionEvidenceClient.Evidence e=f.proof();yes(e!=null,"live record not proved");yes(ContentResolver.calls==2,"fresh Provider fences missing");yes(f.binder.originals==0,"private transaction leaked to AIDL");Bundle s=f.state();yes(s.getBoolean("has_session")&&s.getString("controller_origin").equals("verified_notification")&&s.getBoolean("can_play"),"proved inactive controller unavailable");Bundle r=f.media.command("play",s.getString("session_id"));yes(f.player.controls.play==1&&r.getBoolean("action_dispatched")&&!r.getBoolean("action_verified"),"real proven transport not dispatched or void claimed verified");});
  for(String cause:List.of("not_registered","destroyed","uid","user","package","token","controller","notification_missing","notification_uid","notification_user","notification_package","notification_token","secret","summary"))test("actual records reject "+cause,()->{F f=new F();switch(cause){case "not_registered":f.service.record=null;break;case "destroyed":f.service.record.mDestroyed=true;break;case "uid":f.service.record.mOwnerUid++;break;case "user":f.service.record.mUserId++;break;case "package":f.service.record.mPackageName="other.app";break;case "token":f.service.record.mSessionToken=new MediaSession.Token(1010123,9999);break;case "controller":f.service.record.mController=null;break;case "notification_missing":f.nms.remove(f.record);break;case "notification_uid":f.notification.uid++;break;case "notification_user":f.notification.user++;break;case "notification_package":f.notification.pkg="other.app";break;case "notification_token":f.notification.notification.extras.putParcelable(Notification.EXTRA_MEDIA_SESSION,new MediaSession.Token(1010123,9999));break;case "secret":f.notification.notification.visibility=-1;break;default:f.notification.notification.flags=512;}yes(f.proof()==null,"unsafe live proof accepted");yes(!f.state().getBoolean("has_session")&&f.player.controls.total()==0,"unproved token became authority");});
  for(String cause:List.of("caller_uid","caller_pid","dead_endpoint","dead_owner","reset","foreground","principal_user","cleanup"))test("Root principal rejects "+cause,()->{F f=new F();switch(cause){case "caller_uid":Binder.uid=1010555;break;case "caller_pid":Binder.pid=99;break;case "dead_endpoint":f.endpoint.alive=false;break;case "dead_owner":f.owner.alive=false;break;case "reset":ContentResolver.current=false;break;case "foreground":ActivityManager.current=11;break;case "principal_user":f.auth.putInt("user",11);break;default:f.auth.putBoolean("cleanupOnly",true);}yes(f.proof()==null,"invalid principal minted discovery authority");});
  test("notification update preserves lifetime and increments revision",()->{F f=new F();var first=f.proof();StatusBarNotification n=notification(f.player);f.notification=n;f.record=new NotificationRecord(n);f.nms.publish(f.record);var second=f.proof();yes(first!=null&&second!=null&&first.sameLifetime(second)&&!first.same(second)&&second.notificationRevision==first.notificationRevision+1,"ordinary update identity wrong");});
  test("same key removal repost revokes source and old card despite equal token",()->{F f=new F();Bundle first=f.state();var proof=f.proof();f.repost();var replacement=f.proof();yes(proof!=null&&replacement!=null&&!proof.sameLifetime(replacement),"removed key reused lifetime");Bundle next=f.state();yes(!next.getString("source_id").equals(first.getString("source_id"))&&!next.getString("session_id").equals(first.getString("session_id")),"new notification generation retained old card");f.media.command("play",first.getString("session_id"));yes(f.player.controls.play==0,"old card reached reposted source");});
  test("NMS removal between independent snapshots is rejected",()->{F f=new F();f.service.during=()->{synchronized(f.nms.mNotificationLock){f.nms.mNotificationsByKey.clear();}};yes(f.proof()==null,"missing NMS recheck");});
  test("destroyed actual media record on recheck is rejected",()->{F f=new F();f.service.during=()->{if(f.service.reads==2)f.service.record.mDestroyed=true;};yes(f.proof()==null,"missing media recheck");});
  test("last Provider fence cannot hide notification removal",()->{F f=new F();ContentResolver.during=()->{if(ContentResolver.calls==2)synchronized(f.nms.mNotificationLock){f.nms.mNotificationsByKey.clear();}};yes(f.proof()==null,"Provider delay bypassed final NMS recheck");});
  test("deadline consumed by last authority call is rejected",()->{F f=new F();ContentResolver.during=()->{if(ContentResolver.calls==2)SystemClock.now+=2001;};yes(f.proof()==null,"expired proof accepted");});
  test("unknown Hook capability preserves actual active session controls",()->{F f=new F();f.manager.sessions=List.of(f.player);ServiceManager.services.remove("media_session");Bundle s=f.state();yes(s.getBoolean("can_play")&&s.getString("controller_origin").equals("active_session"),"optional proof disabled active session");});
  test("removal before final transport revalidation sends nothing",()->{F f=new F();Bundle s=f.state();int base=ContentResolver.calls;ContentResolver.during=()->{if(ContentResolver.calls==base+4)synchronized(f.nms.mNotificationLock){f.nms.mNotificationsByKey.clear();}};Bundle r=f.media.command("play",s.getString("session_id"));yes(f.player.controls.play==0&&!r.getBoolean("action_dispatched"),"revoked source received transport");});
  test("strict response schema refuses replay nonce and wrong typed fields",()->{F f=new F();IBinder good=f.binder;for(String bad:List.of("nonce","uid_type","generation","sample")){ServiceManager.services.put("media_session",new IBinder(){public boolean isBinderAlive(){return true;}public boolean transact(int code,Parcel d,Parcel r,int flags)throws Exception{d.enforceInterface("ls.augment.com.atomic_media_session_evidence.v1");d.readInt();d.readBundle(getClass().getClassLoader());String nonce=d.readString();d.readLong();Bundle b=new Bundle();b.putInt("schema",1);b.putBoolean("success",true);b.putString("nonce",bad.equals("nonce")?"0".repeat(32):nonce);b.putInt("uid",1010123);b.putInt("user",10);b.putString("package",f.player.pkg);b.putString("notification_generation","a".repeat(33));b.putLong("notification_revision",1);b.putString("media_generation","b".repeat(32));b.putLong("sample_elapsed",10000);if(bad.equals("uid_type"))b.putString("uid","1010123");if(bad.equals("generation"))b.putString("media_generation","x");if(bad.equals("sample"))b.putLong("sample_elapsed",10001);r.writeBundle(b);return true;}});yes(f.proof()==null,"malformed codec accepted "+bad);}ServiceManager.services.put("media_session",good);});
  test("manual source survives initial playing baseline then true callback edge overrides",()->{F f=new F();Looper.main=new Looper();MediaController other=new MediaController(1010456,++ids,PlaybackState.STATE_PLAYING,ALL);f.manager.sessions=List.of(f.player,other);Bundle s=f.state();String first=f.player.token.equals(other.token)?"":s.getString("source_id");ArrayList<Bundle> rows=s.getParcelableArrayList("sources",Bundle.class);String own=rows.stream().filter(b->b.getInt("owner_uid")==1010123).findFirst().get().getString("source_id");s=f.media.action("select_source",request(own));yes(s.getString("source_id").equals(own)&&s.getString("selection_reason").equals("manual"),"manual selection lost");other.emit(PlaybackState.STATE_PLAYING);yes(f.state().getString("source_id").equals(own),"baseline playing callback invented edge");other.emit(PlaybackState.STATE_BUFFERING);other.emit(PlaybackState.STATE_PLAYING);s=f.state();yes(s.getInt("source_uid")==1010456&&s.getString("selection_reason").equals("new_playing")&&s.getBoolean("observer_available"),"true callback edge did not override manual selection");});
  test("queued obsolete playback and retired callbacks cannot steal selection",()->{F f=new F();Looper.main=new Looper();MediaController other=new MediaController(1010456,++ids,PlaybackState.STATE_PAUSED,ALL);f.manager.sessions=List.of(f.player,other);Bundle s=f.state();other.emit(PlaybackState.STATE_PLAYING);other.emit(PlaybackState.STATE_PAUSED);yes(!f.state().getString("selection_reason").equals("new_playing"),"stale playing receipt selected paused source");f.manager.sessions=List.of(f.player);f.state();yes(other.unregisters==1,"removed controller callback not released");for(var callback:other.retiredCallbacks)callback.onPlaybackStateChanged(new PlaybackState(3,ALL));yes(f.state().getInt("source_uid")==1010123,"retired callback selected old source");f.media.close();yes(f.player.unregisters==1,"close retained callback");});
  test("destroyed token stays revoked until absent from active service",()->{F f=new F();Looper.main=new Looper();f.manager.sessions=List.of(f.player);f.state();f.player.destroy();yes(!f.state().getBoolean("has_session")&&!f.state().getBoolean("has_session"),"destroyed callback resurrected listed token");f.manager.sessions=List.of();f.state();f.manager.sessions=List.of(f.player);yes(f.state().getBoolean("has_session"),"new lifetime never recovered after absence");});
  test("manual receipt supersedes earlier queued play edge",()->{F f=new F();Looper.main=new Looper();MediaController other=new MediaController(1010456,++ids,PlaybackState.STATE_PAUSED,ALL);f.manager.sessions=List.of(f.player,other);Bundle s=f.state();String own=s.getString("source_id");other.emit(3);s=f.media.action("select_source",request(own));yes(s.getString("source_id").equals(own)&&s.getString("selection_reason").equals("manual"),"older edge superseded later manual action");});
  test("unselected playing fallback prefers latest valid reported update",()->{F f=new F();Looper.main=new Looper();f.player.playback.state=3;f.player.playback.updated=9000;MediaController other=new MediaController(1010456,++ids,3,ALL);other.playback.updated=9500;f.manager.sessions=List.of(f.player,other);yes(f.state().getInt("source_uid")==1010456,"fallback ignored latest playing timestamp");other.playback.updated=11000;yes(f.state().getInt("source_uid")==1010123,"future playback timestamp took fallback priority");});
  test("partial callback registration does not claim complete observation",()->{F f=new F();Looper.main=new Looper();MediaController other=new MediaController(1010456,++ids,2,ALL);other.registerFailure=new IllegalStateException();f.manager.sessions=List.of(f.player,other);Bundle s=f.state();yes(s.getBoolean("available")&&!s.getBoolean("observer_available")&&s.getInt("source_count")==2,"failed subscription hid source or claimed full observation");});
  test("callback flood invalidates queued edges instead of inventing final source",()->{F f=new F();Looper.main=new Looper();f.manager.sessions=List.of(f.player);f.state();for(int i=0;i<66;i++){f.player.emit(2);f.player.emit(3);}yes(!f.state().getString("selection_reason").equals("new_playing"),"overflow selected unbounded stale event");});
  test("NMS private listing is metadata only with current generation",()->{F f=new F();Parcel d=Parcel.obtain(),r=Parcel.obtain();d.writeInterfaceToken("ls.augment.com.atomic_notification_evidence.v1");d.writeInt(1);d.writeBundle(f.auth);d.writeString("a".repeat(32));d.writeLong(12000);yes(f.notificationBinder.transact(0x00D04E04,d,r,0),"private NMS read not claimed");r.readException();Bundle b=r.readBundle(getClassLoader());ArrayList<Bundle> records=b.getParcelableArrayList("records",Bundle.class);yes(b.getBoolean("success")&&records.size()==1&&records.get(0).keySet().equals(Set.of("key","package","uid","user","generation","revision","category","post_time","show_chronometer","count_down","when_wall","published_clock_known","published_wall","published_elapsed")),"NMS record escaped metadata schema");yes(f.notificationBinder.originals==0,"private NMS read reached AIDL");});
  System.out.println("MEDIA EVIDENCE RESULT "+cases+" cases; "+checks+" assertions");
 }
 static ClassLoader getClassLoader(){return TestMediaEvidence.class.getClassLoader();}
}'''



# Captured native Binder remote delivery; local direct calls remain separately selectable.
STUBS['android/os/NativeBinderWire.java'] = 'package android.os;public final class NativeBinderWire {\n public static boolean remote=true,appOps;public static int calls,lastCallerFlags,lastDeliveredFlags;\n public static int deliver(int flags){calls++;lastCallerFlags=flags;lastDeliveredFlags=remote?(flags|0x10|((flags&1)==0&&appOps?2:0)):flags;return lastDeliveredFlags;}\n public static void reset(){remote=true;appOps=false;calls=0;lastCallerFlags=lastDeliveredFlags=-1;}\n}'
STUBS['com/android/server/media/MediaSessionService.java'] = STUBS['com/android/server/media/MediaSessionService.java'].replace('code,d,r,flags)', 'code,d,r,android.os.NativeBinderWire.deliver(flags))',1)
STUBS['com/android/server/notification/NotificationManagerService$13.java'] = STUBS['com/android/server/notification/NotificationManagerService$13.java'].replace('code,d,r,flags)', 'code,d,r,android.os.NativeBinderWire.deliver(flags))',1)
TEST = TEST.replace('F()throws Throwable{','F()throws Throwable{NativeBinderWire.reset();',1)
BINDER_FLAGS_TEST = '  test("NATIVE_MEDIA_SYNC_FLAGS0_AND2",()->{for(int flags:new int[]{0,2,16,18}){F f=new F();NativeBinderWire.remote=false;Parcel d=stageMediaPacket(f),r=Parcel.obtain();yes(f.binder.transact(0xD04E03,d,r,flags),"native media not handled");yes(r.dataAvail()>0,"NATIVE_MEDIA_FLAG2_NO_REPLY");r.readException();Bundle b=r.readBundle(getClassLoader());yes(b.getBoolean("success")&&f.binder.originals==0,"native media valid proof denied");}});\n  test("NATIVE_NMS_SYNC_FLAGS0_AND2",()->{for(int flags:new int[]{0,2,16,18}){F f=new F();NativeBinderWire.remote=false;Parcel d=stageNmsPacket(f),r=Parcel.obtain();yes(f.notificationBinder.transact(0xD04E04,d,r,flags),"native NMS not handled");yes(r.dataAvail()>0,"NATIVE_NMS_FLAG2_NO_REPLY");r.readException();Bundle b=r.readBundle(getClassLoader());yes(b.getBoolean("success")&&b.getParcelableArrayList("records",Bundle.class).size()==1&&f.notificationBinder.originals==0,"native NMS valid metadata denied");}});\n  test("NATIVE_MEDIA_NMS_REJECT_FLAGS_NULL_REPLY",()->{for(boolean nms:new boolean[]{false,true}){for(int flags:new int[]{1,3,4,6,17,19,20,-1,Integer.MIN_VALUE}){F f=new F();NativeBinderWire.remote=false;Parcel d=nms?stageNmsPacket(f):stageMediaPacket(f),r=Parcel.obtain();int before=d.dataAvail();yes((nms?f.notificationBinder:f.binder).transact(nms?0xD04E04:0xD04E03,d,r,flags),"native private not handled");yes(r.dataAvail()==0&&d.dataAvail()==before&&f.binder.originals==0&&f.notificationBinder.originals==0,"native media/NMS invalid flags decoded/replied");}F f=new F();NativeBinderWire.remote=false;Parcel d=nms?stageNmsPacket(f):stageMediaPacket(f);int before=d.dataAvail();yes((nms?f.notificationBinder:f.binder).transact(nms?0xD04E04:0xD04E03,d,null,2)&&d.dataAvail()==before,"native media/NMS null reply decoded");}});\n  test("NATIVE_MEDIA_NMS_FLAG2_PRESERVES_AUTH_SIZE_TAIL",()->{for(boolean nms:new boolean[]{false,true})for(int mode=0;mode<3;mode++){F f=new F();NativeBinderWire.remote=false;Parcel d=nms?stageNmsPacket(f):stageMediaPacket(f),r=Parcel.obtain();if(mode==0)Binder.uid=10055;if(mode==1)d.setDataSize(nms?8193:16385);if(mode==2)d.writeInt(7);(nms?f.notificationBinder:f.binder).transact(nms?0xD04E04:0xD04E03,d,r,2);r.readException();Bundle b=r.readBundle(getClassLoader());yes(!b.getBoolean("success")&&f.binder.originals==0&&f.notificationBinder.originals==0,"native media/NMS flag2 bypassed existing guard");}});\n'
BINDER_FLAGS_TEST += '  test("actual media and NMS clients outgoing0 reach native16 or AppOps18",()->{for(boolean appOps:new boolean[]{false,true}){F f=new F();NativeBinderWire.appOps=appOps;yes(f.proof()!=null&&NativeBinderWire.lastCallerFlags==0&&NativeBinderWire.lastDeliveredFlags==(appOps?18:16),"actual media native client route missing");yes(new AtomicWorkbenchNotificationEvidenceClient(10,()->new Bundle(f.auth)).query()!=null&&NativeBinderWire.lastCallerFlags==0&&NativeBinderWire.lastDeliveredFlags==(appOps?18:16),"actual NMS native client route missing");}});\n  test("media and NMS flags remain exactly typed integers",()->{for(Class<?> c:new Class<?>[]{Class.forName("ls.augment.com.hook.AtomicWorkbenchMediaSessionEvidenceHook"),Class.forName("ls.augment.com.hook.AtomicWorkbenchNotificationEvidenceHook")}){var m=c.getDeclaredMethod("acceptsSynchronousBinderFlags",Object.class);m.setAccessible(true);for(Object value:new Object[]{null,"18",18L,18.0,Boolean.TRUE})yes(Boolean.FALSE.equals(m.invoke(null,value)),"typed flags coerced");}});\n'
BINDER_FLAGS_HELPERS = ' static Parcel stageMediaPacket(F f){Parcel d=Parcel.obtain();d.writeInterfaceToken("ls.augment.com.atomic_media_session_evidence.v1");d.writeInt(1);d.writeBundle(f.auth);d.writeString("a".repeat(32));d.writeLong(12000);d.writeString(f.notification.getKey());d.writeInt(f.player.token.uid);d.writeInt(10);d.writeString(f.player.pkg);d.writeTypedObject(f.player.token,0);return d;}\n static Parcel stageNmsPacket(F f){Parcel d=Parcel.obtain();d.writeInterfaceToken("ls.augment.com.atomic_notification_evidence.v1");d.writeInt(1);d.writeBundle(f.auth);d.writeString("a".repeat(32));d.writeLong(12000);return d;}\n'
TEST=TEST.replace('  System.out.println("MEDIA EVIDENCE RESULT "',BINDER_FLAGS_TEST+'  System.out.println("MEDIA EVIDENCE RESULT "',1)
_wire_end=TEST.rfind('}');TEST=TEST[:_wire_end]+BINDER_FLAGS_HELPERS+TEST[_wire_end:]

def run(work, mutation=None, sdk=False):
    sources = dict(STUBS)
    sources["ls/augment/com/TestMediaEvidence.java"] = TEST
    for name in PRODUCTION:
        value = (SRC / (name + ".java")).read_text(encoding="utf-8")
        if mutation and name == mutation[0]:
            assert value.count(mutation[1]) == 1, mutation[1]
            value = value.replace(mutation[1], mutation[2])
        sources["ls/augment/com/" + name + ".java"] = value
    if sdk:
        sources = {k: v for k, v in sources.items() if k.startswith(("io/github/", "ls/augment/com/hook/AugmentModule.java", "ls/augment/com/AtomicWorkbenchDiagnostics.java")) or k in ["ls/augment/com/" + n + ".java" for n in PRODUCTION]}
    files = []
    for name, value in sources.items():
        path = work / name; path.parent.mkdir(parents=True, exist_ok=True); path.write_text(value, encoding="utf-8"); files.append(str(path))
    cmd = [str(JDK / "bin/javac.exe"), "-J-Duser.language=en", "-J-Dfile.encoding=UTF-8", "--release", "17", "-encoding", "UTF-8", "-d", str(work / "classes")]
    if sdk: cmd += ["-cp", str(ROOT / "audit-output/android-sdk/platforms/android-36/android.jar")]
    result = subprocess.run(cmd + files, capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
    if result.returncode: raise AssertionError(result.stdout + result.stderr)
    if sdk: return result
    return subprocess.run([str(JDK / "bin/java.exe"), "-cp", str(work / "classes"), "ls.augment.com.TestMediaEvidence"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument("--negative-controls", action="store_true"); args = parser.parse_args()
    for sdk in (False, True):
        with tempfile.TemporaryDirectory(prefix="duo-media-evidence-") as directory:
            result = run(Path(directory), sdk=sdk); print(result.stdout, end="")
            if result.returncode: raise AssertionError(result.stderr)
            if sdk: print("PASS C8 media production and hooks compile against SDK36")
    if not args.negative_controls: return
    mutations = [
        ("hook/AtomicWorkbenchMediaSessionEvidenceHook", '!Boolean.FALSE.equals(field(record, "mDestroyed")) || !Boolean.FALSE.equals(isClosed.invoke(record))', 'false', "unsafe live proof accepted"),
        ("hook/AtomicWorkbenchMediaSessionEvidenceHook", '!pkg.equals(field(record, "mPackageName"))', 'false', "unsafe live proof accepted"),
        ("hook/AtomicWorkbenchNotificationRecords", 'return BOOT + Long.toHexString(++next);', 'return BOOT + "1";', "removed key reused lifetime"),
        ("AtomicWorkbenchMediaObservers", 'next && !playing', 'next', "baseline playing callback invented edge"),
        ("AtomicWorkbenchMedia", 'selected.evidence != null && !selected.evidence.same(evidence.query(selected.notification, selected.token))', 'false', "revoked source received transport"),
        ("AtomicWorkbenchMediaSessionEvidenceClient", '!nonce.equals(result.get("nonce"))', 'false', "malformed codec accepted nonce"),
        ('hook/AtomicWorkbenchMediaSessionEvidenceHook', 'return flags instanceof Integer && (((Integer) flags) & ~BINDER_SYNC_METADATA_FLAGS) == 0;', 'return flags instanceof Integer;', 'native media/NMS invalid flags decoded/replied'),
        ('hook/AtomicWorkbenchNotificationEvidenceHook', 'return flags instanceof Integer && (((Integer) flags) & ~BINDER_SYNC_METADATA_FLAGS) == 0;', 'return flags instanceof Integer;', 'native media/NMS invalid flags decoded/replied'),
    ]
    for mutation in mutations:
        with tempfile.TemporaryDirectory(prefix="duo-media-evidence-negative-") as directory:
            result = run(Path(directory), mutation)
            if result.returncode == 0 or mutation[3] not in result.stdout + result.stderr: raise AssertionError(result.stdout + result.stderr)
            print("PASS C8 media negative control: " + mutation[3])


if __name__ == "__main__": main()
