"""Deterministic Android service boundaries for production media runtime tests."""
def extend(stubs):
    stubs["android/os/Looper.java"] = "package android.os;public class Looper {public static Looper main;public static Looper getMainLooper(){return main;}}"
    stubs["android/os/Handler.java"] = "package android.os;public class Handler {public Handler(Looper l){if(l==null)throw new IllegalArgumentException();}}"
    stubs["android/os/IBinder.java"] = "package android.os;public interface IBinder {boolean isBinderAlive();boolean transact(int code,Parcel request,Parcel reply,int flags)throws Exception;}"
    stubs["android/os/ServiceManager.java"] = "package android.os;public class ServiceManager {public static java.util.Map<String,Object> services=new java.util.HashMap<>();public static Object getService(String name){return services.get(name);}}"
    stubs["android/app/ActivityManager.java"] = """package android.app;public class ActivityManager {
 public static int current=10;public static int[] sequence;public static int index;public static int getCurrentUser(){return sequence!=null?sequence[Math.min(index++,sequence.length-1)]:current;}}"""
    stubs["android/content/ComponentName.java"] = """package android.content;public class ComponentName {
 final String pkg,cls;public ComponentName(String p,String c){pkg=p;cls=c;}public String getPackageName(){return pkg;}public String flattenToString(){return pkg+"/"+cls;}
 public static ComponentName unflattenFromString(String value){int slash=value.indexOf('/');return slash>0&&slash<value.length()-1?new ComponentName(value.substring(0,slash),value.substring(slash+1)):null;}}"""
    stubs["android/content/Intent.java"] = """package android.content;public class Intent {ComponentName component;public Intent setComponent(ComponentName c){component=c;return this;}public ComponentName getComponent(){return component;}}"""
    stubs["android/content/pm/ApplicationInfo.java"] = "package android.content.pm;public class ApplicationInfo {public int uid;public boolean enabled=true;public String label;}"
    stubs["android/content/pm/ActivityInfo.java"] = "package android.content.pm;public class ActivityInfo {public boolean enabled=true,exported=true;public String permission;public ApplicationInfo applicationInfo;}"
    stubs["android/content/pm/PackageManager.java"] = """package android.content.pm;import android.content.*;import java.util.*;public class PackageManager {
 public static final int PERMISSION_GRANTED=0;public final Map<String,Integer> overrides=new HashMap<>();public final Set<String> missing=new HashSet<>(),noLauncher=new HashSet<>();public Runnable onUid;public int uidCalls;
 public ActivityInfo overrideActivity;public static class NameNotFoundException extends Exception {}
 public int getPackageUidAsUser(String p,int u)throws NameNotFoundException{uidCalls++;if(onUid!=null)onUid.run();if(missing.contains(p))throw new NameNotFoundException();if(overrides.containsKey(p))return overrides.get(p);return Integer.parseInt(p.substring(p.lastIndexOf('p')+1));}
 public ApplicationInfo getApplicationInfo(String p,int flags)throws NameNotFoundException{ApplicationInfo a=new ApplicationInfo();a.uid=getPackageUidAsUser(p,0);a.label=p;return a;}
 public CharSequence getApplicationLabel(ApplicationInfo a){return a.label;}
 public Intent getLaunchIntentForPackage(String p){return noLauncher.contains(p)?null:new Intent().setComponent(new ComponentName(p,p+".Main"));}
 public ActivityInfo getActivityInfo(ComponentName c,int flags)throws NameNotFoundException{if(overrideActivity!=null)return overrideActivity;ActivityInfo a=new ActivityInfo();a.applicationInfo=getApplicationInfo(c.getPackageName(),0);return a;}}"""
    stubs["android/content/Context.java"] = stubs["android/content/Context.java"].replace('public Object getSystemService', '''public final android.content.pm.PackageManager packages=new android.content.pm.PackageManager();public int permission=-1,lastContextUser=-1;
 public android.content.pm.PackageManager getPackageManager(){return packages;}public int checkPermission(String p,int pid,int uid){return permission;}
 public Context createContextAsUser(android.os.UserHandle user,int flags){lastContextUser=user.id;return this;}public Object getSystemService''')
    stubs["android/os/SystemClock.java"] = "package android.os;public class SystemClock {public static long now=10000;public static long elapsedRealtime(){return now;}}"
    stubs["android/os/Process.java"] = stubs["android/os/Process.java"].replace('public static int myUid()', 'public static int myPid(){return 44;}public static int myUid()')
    stubs["android/os/UserHandle.java"] = stubs["android/os/UserHandle.java"].replace('UserHandle(int id)', 'public UserHandle(int id)').replace('}}', ' }public int getIdentifier(){return id;}public boolean equals(Object o){return o instanceof UserHandle&&((UserHandle)o).id==id;}public int hashCode(){return id;}}')
    stubs["android/os/Bundle.java"] = stubs["android/os/Bundle.java"].rsplit('}',1)[0] + '''
 public Bundle(){}public Bundle(Bundle b){values.putAll(b.values);}public java.util.Set<String> keySet(){return values.keySet();}
 public Object get(String k){return values.get(k);}public int size(){return values.size();}
 public String getString(String k,String fallback){Object v=values.get(k);return v instanceof String?(String)v:fallback;}
 public void putInt(String k,int v){values.put(k,v);}public int getInt(String k){return getInt(k,0);}public int getInt(String k,int fallback){Object v=values.get(k);return v instanceof Integer?(Integer)v:fallback;}
 public void putLong(String k,long v){values.put(k,v);}public long getLong(String k){return getLong(k,0);}public long getLong(String k,long fallback){Object v=values.get(k);return v instanceof Long?(Long)v:fallback;}
 public void putFloat(String k,float v){values.put(k,v);}public float getFloat(String k){Object v=values.get(k);return v instanceof Float?(Float)v:0;}
 public CharSequence getCharSequence(String k){return (CharSequence)values.get(k);}
 public void putParcelableArrayList(String k,java.util.ArrayList<?> v){values.put(k,v);}public <T>java.util.ArrayList<T> getParcelableArrayList(String k,Class<T> c){return (java.util.ArrayList<T>)values.get(k);}}
'''
    stubs["android/os/Parcel.java"] = stubs["android/os/Parcel.java"].replace('public void recycle()', 'public void setDataSize(int v){size=v;}public void setDataPosition(int p){}public void recycle()')
    stubs["android/os/Parcel.java"] = stubs["android/os/Parcel.java"].replace('int size;', '''int size;public final java.util.List<Object> wire=new java.util.ArrayList<>();int cursor;
 public void writeInterfaceToken(String d){wire.add(d);}public void enforceInterface(String d){if(!d.equals(wire.get(cursor++)))throw new SecurityException();}
 public void writeInt(int n){wire.add(n);}public int readInt(){return (Integer)wire.get(cursor++);}public void writeLong(long n){wire.add(n);}public long readLong(){return (Long)wire.get(cursor++);}
 public void writeString(String s){wire.add(s);}public String readString(){return (String)wire.get(cursor++);}
 public void writeTypedObject(Object v,int flags){wire.add(v);}public <T>T readTypedObject(Object creator){return (T)wire.get(cursor++);}
 public int dataAvail(){return wire.size()-cursor;}public void writeNoException(){}public void readException(){}
 public Bundle readBundle(ClassLoader l){return (Bundle)wire.get(cursor++);}''').replace('public void writeBundle(Bundle b){', 'public void writeBundle(Bundle b){wire.add(new Bundle(b));')
    stubs["android/media/Rating.java"] = """package android.media;public class Rating {
 public static final int RATING_NONE=0,RATING_HEART=1,RATING_5_STARS=5;public final int style;public final boolean rated,heart;
 public Rating(int s,boolean r,boolean h){style=s;rated=r;heart=h;}public static Rating newHeartRating(boolean h){return new Rating(RATING_HEART,true,h);}
 public int getRatingStyle(){return style;}public boolean isRated(){return rated;}public boolean hasHeart(){return heart;}}"""
    stubs["android/media/MediaMetadata.java"] = stubs["android/media/MediaMetadata.java"].replace('METADATA_KEY_ART="art";', 'METADATA_KEY_ART="art",METADATA_KEY_MEDIA_ID="media_id",METADATA_KEY_ALBUM="album",METADATA_KEY_DURATION="duration",METADATA_KEY_USER_RATING="user_rating";').replace('public Bitmap getBitmap', 'public long getLong(String k){Object v=values.get(k);return v instanceof Long?(Long)v:0;}public android.media.Rating getRating(String k){return (android.media.Rating)values.get(k);}public Bitmap getBitmap')
    stubs["android/media/session/PlaybackState.java"] = stubs["android/media/session/PlaybackState.java"].replace('ACTION_SKIP_TO_NEXT=32;', 'ACTION_SKIP_TO_NEXT=32,ACTION_SET_RATING=128;').replace('public int state;', 'public long position=-1,updated;public float speed=1;public long getPosition(){return position;}public long getLastPositionUpdateTime(){return updated;}public float getPlaybackSpeed(){return speed;}public int state;')
    stubs["android/media/session/MediaController.java"] = stubs["android/media/session/MediaController.java"].replace('public RuntimeException failure,metadataFailure;', 'public String pkg;public int ratingType,metadataReads;public Runnable onMetadata;public RuntimeException failure,metadataFailure;').replace('token=new MediaSession.Token(uid,id);', 'token=new MediaSession.Token(uid,id);pkg="media.p"+uid;').replace('public MediaSession.Token getSessionToken()', 'public String getPackageName(){return pkg;}public int getRatingType(){return ratingType;}public MediaSession.Token getSessionToken()').replace('public MediaMetadata getMetadata(){', 'public MediaMetadata getMetadata(){metadataReads++;if(onMetadata!=null)onMetadata.run();').replace('public int previous,play,pause,next;', 'public int previous,play,pause,next,ratings;public android.media.Rating lastRating;public Runnable afterRating;public void setRating(android.media.Rating r){check();ratings++;lastRating=r;if(afterRating!=null)afterRating.run();}')
    stubs["android/app/Notification.java"] = """package android.app;public class Notification {
 public static final String EXTRA_MEDIA_SESSION="media_token",EXTRA_TITLE="title",EXTRA_TEXT="text",EXTRA_SUB_TEXT="sub_text",EXTRA_LARGE_ICON="large_icon",EXTRA_SHOW_CHRONOMETER="android.showChronometer",EXTRA_CHRONOMETER_COUNT_DOWN="android.chronometerCountDown";
 public static final int VISIBILITY_SECRET=-1,FLAG_GROUP_SUMMARY=512;public long when;public int visibility,flags;public android.os.Bundle extras=new android.os.Bundle();public android.graphics.Bitmap largeIcon;}"""
    stubs["android/service/notification/StatusBarNotification.java"] = """package android.service.notification;public class StatusBarNotification {
 public int uid,user;public String pkg;public long postTime;public android.app.Notification notification=new android.app.Notification();
 public String key="notification-key";public String getKey(){return key;}public int getUserId(){return user;}public int getUid(){return uid;}public android.os.UserHandle getUser(){return new android.os.UserHandle(user);}public String getPackageName(){return pkg;}public android.app.Notification getNotification(){return notification;}public long getPostTime(){return postTime;}}"""
    stubs["android/app/INotificationManager.java"] = """package android.app;public interface INotificationManager {android.service.notification.StatusBarNotification[] getActiveNotificationsWithAttribution(String p,String a);}"""
    stubs["android/app/NotificationManager.java"] = """package android.app;public class NotificationManager {
 public static Service service=new Service();public static Service getService(){return service;}
 public static class Service implements INotificationManager {public android.service.notification.StatusBarNotification[] notifications=new android.service.notification.StatusBarNotification[0];public RuntimeException failure;public Runnable onRead;public int queries;
 public android.service.notification.StatusBarNotification[] getActiveNotificationsWithAttribution(String p,String a){queries++;if(onRead!=null)onRead.run();if(failure!=null)throw failure;return notifications;}}}"""
    key = "android/media/session/MediaController.java"
    stubs[key] = stubs[key].replace("public Runnable onMetadata;", "public Runnable onMetadata,onControls;").replace("public TransportControls getTransportControls(){return controls;}", "public TransportControls getTransportControls(){if(onControls!=null)onControls.run();return controls;}")
    stubs[key] = stubs[key].replace('public class MediaController {', '''public class MediaController {
 public static class Callback {public void onPlaybackStateChanged(PlaybackState s){}public void onSessionDestroyed(){}}
 public static final java.util.Map<MediaSession.Token,MediaController> instances=new java.util.HashMap<>();
 public final java.util.List<Callback> callbacks=new java.util.ArrayList<>(),retiredCallbacks=new java.util.ArrayList<>();public int registers,unregisters;public RuntimeException registerFailure;
 public void registerCallback(Callback c,android.os.Handler h){if(registerFailure!=null)throw registerFailure;registers++;callbacks.add(c);}
 public void unregisterCallback(Callback c){unregisters++;callbacks.remove(c);retiredCallbacks.add(c);}
 public void emit(int state){playback.state=state;for(Callback c:new java.util.ArrayList<>(callbacks))c.onPlaybackStateChanged(playback);}
 public void destroy(){for(Callback c:new java.util.ArrayList<>(callbacks))c.onSessionDestroyed();}
 public MediaController(android.content.Context context,MediaSession.Token token){MediaController original=instances.get(token);if(original==null)throw new IllegalArgumentException();
 this.token=token;pkg=original.pkg;playback=original.playback;metadata=original.metadata;ratingType=original.ratingType;controls=original.controls;}
''').replace('public final TransportControls controls=new TransportControls();', 'public TransportControls controls=new TransportControls();').replace('playback=new PlaybackState(state,actions);', 'playback=new PlaybackState(state,actions);instances.put(token,this);')
    stubs["android/media/session/MediaSession.java"] = stubs["android/media/session/MediaSession.java"].replace('public final int uid,id;', 'public static final Object CREATOR=new Object();public final int uid,id;')
    return stubs
