"""Execute production gain hooks with legacy/device-aware AudioService boundaries and DSP doubles."""
import argparse
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com'
STUBS={
'io/github/libxposed/api/XposedInterface.java':'''package io.github.libxposed.api;import java.util.*;
public interface XposedInterface {interface Chain {Object getThisObject();Object getArg(int i);List<Object> getArgs();Object proceed()throws Throwable;Object proceed(Object[] args)throws Throwable;}}''',
'ls/augment/com/hook/AugmentModule.java':'''package ls.augment.com.hook;import java.util.*;import java.lang.reflect.*;import io.github.libxposed.api.XposedInterface.Chain;
public class AugmentModule {
 public static AugmentModule active;public final Map<Method,Entry> hooks=new LinkedHashMap<>();public final List<Throwable> errors=new ArrayList<>();
 public AugmentModule(){active=this;}public interface Original{Object run(Object[] args)throws Throwable;}public interface Interceptor{Object run(Chain c)throws Throwable;}
 public static class Entry{Method method;Interceptor action;Entry(Method m){method=m;}public Entry intercept(Interceptor a){action=a;return this;}}
 public Entry prepareFeatureHook(Method m,String id,boolean before){return new Entry(m);}public void registerFeatureHook(Entry e){hooks.put(e.method,e);}
 public void logFeatureInfo(String text){}public void logFeatureError(String text,Throwable e){errors.add(e);}public void deoptimize(Method m){}
 public static Object dispatch(Object owner,Method m,Object[] args,Original original)throws Throwable{
  Entry e=active.hooks.get(m);if(e==null)return original.run(args);
  return e.action.run(new Chain(){public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}public List<Object> getArgs(){return Arrays.asList(args);}
   public Object proceed()throws Throwable{return original.run(args);}public Object proceed(Object[] values)throws Throwable{return original.run(values);}});}
}''',
'android/content/Context.java':'''package android.content;public class Context {
 public static final int RECEIVER_EXPORTED=2;public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}
 public ContentResolver getContentResolver(){return new ContentResolver();}public Intent registerReceiver(BroadcastReceiver r,IntentFilter f,String p,android.os.Handler h,int flags){return null;}}''',
'android/content/ContentResolver.java':'''package android.content;public class ContentResolver {public android.os.Bundle call(android.net.Uri u,String m,String a,android.os.Bundle b){return new android.os.Bundle();}}''',
'android/content/BroadcastReceiver.java':'''package android.content;public abstract class BroadcastReceiver {public abstract void onReceive(Context c,Intent i);}''',
'android/content/Intent.java':'package android.content;public class Intent {}',
'android/content/IntentFilter.java':'package android.content;public class IntentFilter {public IntentFilter(String s){}}',
'android/content/pm/PackageManager.java':'''package android.content.pm;public class PackageManager {
 public String[] getPackagesForUid(int uid){return new String[]{uid==10352?"com.android.systemui":"untrusted.app"};}
 public ApplicationInfo getApplicationInfo(String s,int f)throws NameNotFoundException{return new ApplicationInfo();}
 public static class ApplicationInfo{public int uid=10352;}public static class NameNotFoundException extends Exception{}}''',
'android/net/Uri.java':'package android.net;public class Uri {public static Uri parse(String s){return new Uri();}}',
'android/os/IBinder.java':'package android.os;public interface IBinder {int FIRST_CALL_TRANSACTION=1,FLAG_ONEWAY=1;}',
'android/os/Binder.java':'''package android.os;public class Binder implements IBinder {
 public static int uid=1000;public static int getCallingUid(){return uid;}public static long clearCallingIdentity(){return 0;}
 public static void restoreCallingIdentity(long n){}protected boolean onTransact(int c,Parcel d,Parcel r,int f)throws RemoteException{return false;}}''',
'android/os/Parcel.java':'''package android.os;public class Parcel {public void enforceInterface(String s){}public int readInt(){return 0;}public long readLong(){return 0;}
 public String readString(){return "";}public void enforceNoDataAvail(){}public void writeNoException(){}public void writeBundle(Bundle b){}}''',
'android/os/RemoteException.java':'package android.os;public class RemoteException extends Exception {}',
'android/os/Looper.java':'package android.os;public class Looper {}',
'android/os/HandlerThread.java':'package android.os;public class HandlerThread {public HandlerThread(String n,int p){}public void start(){}public Looper getLooper(){return new Looper();}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler {
 public static final List<Runnable> pending=new ArrayList<>();public Handler(Looper l){}public boolean post(Runnable r){pending.add(r);return true;}
 public boolean postDelayed(Runnable r,long n){return true;}public void removeCallbacks(Runnable r){pending.removeIf(v->v==r);}
 public static void drain(){for(int n=0;!pending.isEmpty();n++){if(n>1000)throw new AssertionError("runaway handler");pending.remove(0).run();}}}''',
'android/os/Process.java':'package android.os;public class Process {public static final int THREAD_PRIORITY_BACKGROUND=10;public static int myUid(){return 1000;}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock {public static long elapsedRealtime(){return 1000;}}',
'android/os/Bundle.java':'''package android.os;import java.util.*;public class Bundle {
 final Map<String,Object> values=new HashMap<>();public int size(){return values.size();}public void putBinder(String k,IBinder v){values.put(k,v);}
 public void putInt(String k,int v){values.put(k,v);}public void putLong(String k,long v){values.put(k,v);}public void putBoolean(String k,boolean v){values.put(k,v);}public void putString(String k,String v){values.put(k,v);}
 public int getInt(String k,int d){return (Integer)values.getOrDefault(k,d);}public long getLong(String k,long d){return (Long)values.getOrDefault(k,d);}
 public boolean getBoolean(String k){return Boolean.TRUE.equals(values.get(k));}public String getString(String k,String d){return (String)values.getOrDefault(k,d);}}''',
'android/provider/Settings.java':'package android.provider;public class Settings {public static class Global {public static final String BOOT_COUNT="boot";public static int getInt(android.content.ContentResolver r,String k,int d){return 37;}}}',
'android/media/AudioManager.java':'package android.media;public class AudioManager {public static final int ADJUST_RAISE=1,ADJUST_LOWER=-1,ADJUST_SAME=0;}',
'android/media/AudioDeviceAttributes.java':'package android.media;public class AudioDeviceAttributes {}',
'android/media/AudioSystem.java':'''package android.media;import java.util.*;public class AudioSystem {public static final Set<Integer> DEVICE_OUT_ALL_A2DP_SET=Set.of(128),DEVICE_OUT_ALL_BLE_SET=Set.of(536870912),DEVICE_OUT_ALL_SCO_SET=Set.of(16);}''',
'android/media/AudioAttributes.java':'''package android.media;public class AudioAttributes {
 public static final int USAGE_UNKNOWN=0,USAGE_MEDIA=1,USAGE_GAME=14,USAGE_ALARM=4,USAGE_NOTIFICATION_RINGTONE=6;public int getUsage(){return USAGE_MEDIA;}}''',
'android/media/audiofx/LoudnessEnhancer.java':'''package android.media.audiofx;import java.util.*;public class LoudnessEnhancer {
 public static final Map<Integer,LoudnessEnhancer> created=new HashMap<>();public static boolean control=true;public int gain;public boolean enabled,released;
 public LoudnessEnhancer(int session){created.put(session,this);}public boolean hasControl(){return control;}public void setTargetGain(int value){gain=value;}
 public void setEnabled(boolean value){enabled=value;}public boolean getEnabled(){return enabled;}public int getTargetGain(){return gain;}public void release(){released=true;enabled=false;}}''',
'ls/augment/com/BuildConfig.java':'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20703;}',
'ls/augment/com/ConfigSchema.java':'package ls.augment.com;public class ConfigSchema {public static final String AUDIO_GAIN_ENABLED="gain",AUDIO_GAIN_STEP="step";public static boolean truthy(String s){return "1".equals(s);}}',
'ls/augment/com/ConfigSnapshot.java':'package ls.augment.com;public class ConfigSnapshot {public final java.util.Map<String,String> values=new java.util.HashMap<>();public String get(String k){return values.getOrDefault(k,"100");}}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import java.util.*;import android.content.*;import ls.augment.com.*;
public class FeatureSettings {
 public static boolean on=true;public static int step=10,limit=300;public static final List<Runnable> listeners=new ArrayList<>();public static final Map<String,String> diagnostics=new HashMap<>();
 public static boolean enabled(Context c,String k){return on;}public static int integer(Context c,String k,int d,int min,int max){return k.equals(ConfigSchema.AUDIO_GAIN_STEP)?step:limit;}
 public static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}public static boolean hasVerifiedSnapshot(Context c){return true;}
 public static void diagnostic(Context c,String k,String v){diagnostics.put(k,v);}public static void fire(){for(Runnable r:listeners)r.run();android.os.Handler.drain();}
 public static ConfigSnapshot snapshot(Context c){ConfigSnapshot s=new ConfigSnapshot();s.values.put("gain",on?"1":"0");s.values.put("step",""+step);
 for(String r:List.of("speaker","wired","bluetooth"))for(int stream:new int[]{2,3,4})s.values.put(AudioGainPolicy.key(r,stream),""+limit);return s;}}
'''
}
SERVICE='''package com.android.server.audio;
import java.util.*;import java.lang.reflect.*;import android.content.*;import android.media.*;import ls.augment.com.hook.AugmentModule;
public class @@CLASS@@ {
 public Context mContext=new Context();public int base=150,level=150,device=2,lastDirection=99,lastSet=-1;
 public boolean allowOp=true,allowDnd=true,skipDnd=false,muted=false,rejectNative=false,throwNative=false;
 public Integer changeRoute;public Object[] lastArguments;public int notifications;public Panel mVolumeController=new Panel();
 public class Panel{public void postVolumeChanged(int stream,int flags){notifications++;}}
 public Object boundary(String name,Class<?>[] types,Object[] args,AugmentModule.Original body){
  try{Class<?> c=getClass();Method m=null;while(c!=null){try{m=c.getDeclaredMethod(name,types);break;}catch(NoSuchMethodException e){c=c.getSuperclass();}}
   return AugmentModule.dispatch(this,m,args,body);
  }catch(RuntimeException|Error e){throw e;}catch(Throwable e){throw new RuntimeException(e);}}
 public int getStreamVolume(int s){return (Integer)boundary("getStreamVolume",new Class[]{int.class},new Object[]{s},a->muted?0:level);}
 public int getStreamMaxVolume(int s){return (Integer)boundary("getStreamMaxVolume",new Class[]{int.class},new Object[]{s},a->base);}
 public int getLastAudibleStreamVolume(int s){return (Integer)boundary("getLastAudibleStreamVolume",new Class[]{int.class},new Object[]{s},a->level);}
 public int getDeviceForStream(int s){return device;}public boolean isStreamMute(int s){return muted;}
 public boolean checkNoteAppOp(int op,int uid,String pkg,String tag){return (Boolean)boundary("checkNoteAppOp",new Class[]{int.class,int.class,String.class,String.class},new Object[]{op,uid,pkg,tag},a->allowOp);}
 public boolean volumeAdjustmentAllowedByDnd(int stream,int flags){return (Boolean)boundary("volumeAdjustmentAllowedByDnd",new Class[]{int.class,int.class},new Object[]{stream,flags},a->allowDnd);}
 public void onPlaybackConfigChange(List configs){boundary("onPlaybackConfigChange",new Class[]{List.class},new Object[]{configs},a->null);}
 public void setStreamVolume(int s,int index,int flags,AudioDeviceAttributes device,String pkg,String caller,String tag,int uid,boolean permission,boolean update){
  boundary("setStreamVolume",new Class[]{int.class,int.class,int.class,AudioDeviceAttributes.class,String.class,String.class,String.class,int.class,boolean.class,boolean.class},new Object[]{s,index,flags,device,pkg,caller,tag,uid,permission,update},a->{nativeChange(a,false);return null;});}
 @@ADJUST@@
 public void nativeChange(Object[] args,boolean adjust){
  lastArguments=args.clone();int requested=(Integer)args[1];if(adjust)lastDirection=requested;else lastSet=requested;
  if(!checkNoteAppOp(1,1000,"android",null))return;
  if(!skipDnd&&!volumeAdjustmentAllowedByDnd((Integer)args[0],(Integer)args[2]))return;
  if(throwNative)throw new SecurityException("native rejection");if(rejectNative){level=100;return;}
  level=Math.max(0,Math.min(base,adjust?level+requested:requested));if(changeRoute!=null)device=changeRoute;
 }
 public void set(int index){setStreamVolume(3,index,1,null,"android","caller","tag",1000,true,true);}
 public void adjust(int direction){@@CALL@@}
 public void explicit(int direction){@@EXPLICIT@@}
}
'''
LEGACY='''public void adjustStreamVolume(int s,int d,int flags,String pkg,String caller,int uid,int pid,String tag,boolean permission,int mode){
 boundary("adjustStreamVolume",new Class[]{int.class,int.class,int.class,String.class,String.class,int.class,int.class,String.class,boolean.class,int.class},new Object[]{s,d,flags,pkg,caller,uid,pid,tag,permission,mode},a->{nativeChange(a,true);return null;});}'''
MODERN='''public void adjustStreamVolume(int s,int d,int flags,AudioDeviceAttributes device,String pkg,String caller,int uid,int pid,String tag,boolean permission,int mode){
 boundary("adjustStreamVolume",new Class[]{int.class,int.class,int.class,AudioDeviceAttributes.class,String.class,String.class,int.class,int.class,String.class,boolean.class,int.class},new Object[]{s,d,flags,device,pkg,caller,uid,pid,tag,permission,mode},a->{@@BODY@@;return null;});}'''
HARNESS='''package ls.augment.com.hook;
import com.android.server.audio.AudioService;import android.os.*;import android.media.*;import android.media.audiofx.*;import java.util.*;import java.lang.reflect.*;import ls.augment.com.*;
public class TestAudioGainRuntime {
 static int checks;static void check(boolean ok,String text){checks++;if(!ok)throw new AssertionError(text);}
 static void eq(int a,int b,String text){check(a==b,text+" expected="+a+" actual="+b);}
 public static class Player {public boolean isActive(){return true;}public AudioAttributes getAudioAttributes(){return new AudioAttributes();}public int getSessionId(){return 42;}}
 static Object controller()throws Exception {Field f=AudioGainHook.class.getDeclaredField("controller");f.setAccessible(true);return f.get(null);}
 static AudioGainState state()throws Exception{Object c=controller();Method m=c.getClass().getDeclaredMethod("readState",int.class,long.class,String.class);m.setAccessible(true);
  return (AudioGainState)m.invoke(c,3,1L,AudioGainState.configuration(FeatureSettings.snapshot(new android.content.Context()),3));}
 public static void main(String[] args)throws Exception {
  AugmentModule module=new AugmentModule();AudioGainHook.install(module,TestAudioGainRuntime.class.getClassLoader());
  if(args[0].startsWith("missing")||args[0].equals("wrong-type")){eq(0,module.hooks.size(),"no partial extended maximum");eq(1,module.errors.size(),"missing capability diagnostic");return;}
  AudioService service=new AudioService();
  eq(170,service.getStreamMaxVolume(3),"150 native plus 20 gain steps");Handler.drain();
  service.adjust(1);Handler.drain();eq(151,service.getStreamVolume(3),"physical key crosses 100 percent");eq(150,service.level,"hardware max preserved");eq(0,service.lastDirection,"native policy runs with ADJUST_SAME");
  check(module.hooks.size()>=8,"complete service contract");
  AudioGainState state=state();eq(110,state.percent(),"live packet reports actual extended step");eq(151,state.current,"UI readback follows adjustment");
  check(Arrays.asList(service.lastArguments).contains("attribution"),"attribution survives new device slot");
  eq(2718,(Integer)service.lastArguments[service.lastArguments.length-1],"key event mode preserved");
  for(int i=0;i<30;i++)service.adjust(1);eq(170,service.getStreamVolume(3),"configured 300 percent cap");
  for(int i=0;i<20;i++)service.adjust(-1);eq(150,service.getStreamVolume(3),"down traverses extension first");
  service.adjust(-1);eq(149,service.level,"next lower reaches native range");
  service.set(160);eq(160,service.getStreamVolume(3),"slider reaches extension");eq(150,service.lastSet,"native slider argument capped");
  service.set(140);eq(140,service.getStreamVolume(3),"slider below native ceiling clears extra");service.set(150);
  service.allowOp=false;service.adjust(1);eq(150,service.getStreamVolume(3),"permission denial cannot enable gain");service.allowOp=true;
  service.allowDnd=false;service.adjust(1);eq(150,service.getStreamVolume(3),"DND denial cannot enable gain");service.allowDnd=true;
  service.skipDnd=true;service.adjust(1);eq(150,service.getStreamVolume(3),"missing policy callback fails closed");service.skipDnd=false;
  service.throwNative=true;try{service.adjust(1);throw new AssertionError("native exception lost");}catch(SecurityException expected){}service.throwNative=false;
  eq(170,service.getStreamMaxVolume(3),"pending transaction cleared after native exception");
  service.rejectNative=true;service.adjust(1);eq(100,service.getStreamVolume(3),"native limit rejection never fabricates extension");service.rejectNative=false;service.set(150);
  service.changeRoute=4;service.adjust(1);eq(150,service.getStreamVolume(3),"route change prevents cross-device gain");service.changeRoute=null;service.device=2;
  Binder.uid=12345;service.adjust(1);eq(1,service.lastDirection,"untrusted adjustment left native");eq(150,service.getStreamMaxVolume(3),"untrusted max left native");Binder.uid=1000;
  service.explicit(1);eq(150,service.getStreamVolume(3),"explicit device does not alter active stream gain");
  service.muted=true;service.adjust(1);eq(0,service.getStreamVolume(3),"muted stream never reports audible gain");service.muted=false;eq(150,service.getStreamVolume(3),"muted adjustment does not accumulate gain");
  service.adjust(1);service.onPlaybackConfigChange(List.of(new Player()));Handler.drain();
  LoudnessEnhancer effect=LoudnessEnhancer.created.get(42);check(effect!=null&&effect.getEnabled(),"active session receives DSP request");eq(AudioGainPolicy.milliBel(110),effect.gain,"actual DSP gain for one step");
  LoudnessEnhancer.control=false;service.adjust(1);Handler.drain();check(effect.released,"effect failure releases uncontrolled effect");
  check(FeatureSettings.diagnostics.get("ls_augment_audio_gain_runtime").contains("error="),"DSP failure diagnostic retained");LoudnessEnhancer.control=true;
  FeatureSettings.on=false;FeatureSettings.fire();eq(150,service.getStreamMaxVolume(3),"disabled maximum restored");eq(150,service.getStreamVolume(3),"disabled gain restored");
  FeatureSettings.on=true;FeatureSettings.fire();eq(150,service.getStreamVolume(3),"reenabling does not resurrect extra");
  check(module.errors.isEmpty(),"no install errors");System.out.println("PASS "+args[0]+" checks="+checks);
 }
}
'''

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--jdk',type=Path,required=True)
    parser.add_argument('--hook-source',type=Path);parser.add_argument('--variant',nargs='+');args=parser.parse_args()
    jdk=args.jdk/'bin' if (args.jdk/'bin').is_dir() else args.jdk
    with tempfile.TemporaryDirectory(prefix='duo-audio-runtime-') as tmp:
        for variant in args.variant or ['legacy','device','both','subclass','missing-adjust','missing-dnd','wrong-type']:
            files=dict(STUBS);modern=MODERN.replace('@@BODY@@','nativeChange(a,true)')
            if variant=='both':modern=MODERN.replace('@@BODY@@','adjustStreamVolume((Integer)a[0],(Integer)a[1],(Integer)a[2],(String)a[4],(String)a[5],(Integer)a[6],(Integer)a[7],(String)a[8],(Boolean)a[9],(Integer)a[10])')
            adjust=LEGACY if variant=='legacy' else modern+(LEGACY if variant=='both' else '')
            call='adjustStreamVolume(3,direction,17,'+('' if variant=='legacy' else 'null,')+'"android","caller",1000,4321,"attribution",true,2718);'
            explicit='setStreamVolume(3,151,1,new AudioDeviceAttributes(),"android","caller","tag",1000,true,true);' if variant=='legacy' else call.replace('null,','new AudioDeviceAttributes(),')
            source=SERVICE.replace('@@ADJUST@@',adjust).replace('@@CALL@@',call).replace('@@EXPLICIT@@',explicit)
            if variant=='missing-adjust':source=source.replace('adjustStreamVolume','unknownAdjustment')
            if variant=='missing-dnd':source=source.replace('volumeAdjustmentAllowedByDnd','unknownPolicy')
            if variant=='wrong-type':source=source.replace('AudioDeviceAttributes device,String pkg,String caller,int uid','Object device,String pkg,String caller,int uid').replace('int.class,AudioDeviceAttributes.class,String.class,String.class,int.class','int.class,Object.class,String.class,String.class,int.class')
            cls='CoreAudioService' if variant=='subclass' else 'AudioService'
            files[f'com/android/server/audio/{cls}.java']=source.replace('@@CLASS@@',cls)
            if variant=='subclass':files['com/android/server/audio/AudioService.java']='package com.android.server.audio;public class AudioService extends CoreAudioService {}'
            files['ls/augment/com/hook/TestAudioGainRuntime.java']=HARNESS
            target=Path(tmp)/variant;sources=[]
            for relative,content in files.items():
                path=target/relative;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf-8');sources.append(str(path))
            sources += [str(args.hook_source or SRC/'hook/AudioGainHook.java'),str(SRC/'hook/AudioGainTargets.java'),str(SRC/'AudioGainPolicy.java'),str(SRC/'AudioGainState.java')]
            subprocess.run([str(jdk/'javac.exe'),'-encoding','UTF-8','-d',str(target/'classes'),*sources],check=True)
            subprocess.run([str(jdk/'java.exe'),'-cp',str(target/'classes'),'ls.augment.com.hook.TestAudioGainRuntime',variant],check=True)
            print('PASS contract',variant)
if __name__=='__main__':main()
