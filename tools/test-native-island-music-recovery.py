"""Execute fullscreen music recovery against first-play, restart and OEM capability races."""
from pathlib import Path
import os,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
SRC=ROOT/'android/app/src/main/java/ls/augment/com/hook'
files={
'android/content/Context.java':'package android.content;public class Context{}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Process.java':'package android.os;public class Process{public static int myUid(){return 1000;}}',
'android/app/ActivityManager.java':'package android.app;public class ActivityManager{public static int user;public static int getCurrentUser(){return user;}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler{
 static final List<Runnable> tasks=new ArrayList<>();public Handler(Looper l){}public void post(Runnable r){tasks.add(r);}
 public void postDelayed(Runnable r,long ms){tasks.add(r);}public void removeCallbacks(Runnable r){tasks.removeIf(x->x==r);}
 public static void drain(){int n=0;while(!tasks.isEmpty()){if(++n>40)throw new AssertionError("unbounded polling");tasks.remove(0).run();}}}''',
'android/media/session/PlaybackState.java':'package android.media.session;public class PlaybackState{public static final int STATE_PLAYING=3;public int state;public PlaybackState(int s){state=s;}public int getState(){return state;}}',
'android/media/session/MediaSession.java':'package android.media.session;public class MediaSession{public record Token(int id){}}',
'android/media/session/MediaController.java':'''package android.media.session;public class MediaController{
 public String pkg;public MediaSession.Token token;public PlaybackState state=new PlaybackState(3);
 public MediaController(String p,int id){pkg=p;token=new MediaSession.Token(id);}public String getPackageName(){return pkg;}
 public MediaSession.Token getSessionToken(){return token;}public PlaybackState getPlaybackState(){return state;}}''',
'android/media/session/MediaSessionManager.java':'''package android.media.session;import java.util.*;import java.util.concurrent.*;import android.os.Handler;
 public class MediaSessionManager{
 public interface OnActiveSessionsChangedListener{void onActiveSessionsChanged(List<MediaController> values);}
 public interface OnMediaKeyEventSessionChangedListener{void onMediaKeyEventSessionChanged(String p,MediaSession.Token t);}
 public List<MediaController> values=new ArrayList<>();public String pkg="music";public MediaSession.Token token;public boolean missingKeys,changedDuringQuery;
 public OnActiveSessionsChangedListener active;public OnMediaKeyEventSessionChangedListener key;public int registered,removed;
 public void addOnActiveSessionsChangedListener(OnActiveSessionsChangedListener l,Object c,Handler h){active=l;registered++;}
 public void removeOnActiveSessionsChangedListener(OnActiveSessionsChangedListener l){if(active==l){active=null;removed++;}}
 public void addOnMediaKeyEventSessionChangedListener(Executor e,OnMediaKeyEventSessionChangedListener l){if(missingKeys)throw new UnsupportedOperationException();key=l;}
 public void removeOnMediaKeyEventSessionChangedListener(OnMediaKeyEventSessionChangedListener l){if(key==l)key=null;}
 public String getMediaKeyEventSessionPackageName(){return pkg;}public MediaSession.Token getMediaKeyEventSession(){return token;}
 public List<MediaController> getActiveSessions(Object c){if(changedDuringQuery)pkg="different";return values;}}
''',
'ls/augment/com/SystemUiOptions.java':'package ls.augment.com;public class SystemUiOptions{public static final String ISLAND="island";}',
'ls/augment/com/hook/FeatureSettings.java':'''package ls.augment.com.hook;import android.content.Context;class FeatureSettings{
 static boolean on=true;static Runnable changed;static boolean enabled(Context c,String k){return on;}
 static void addSnapshotListener(Context c,Runnable r){changed=r;}static void removeSnapshotListener(Runnable r){if(changed==r)changed=null;}}''',
'ls/augment/com/hook/IslandSceneSelection.java':'package ls.augment.com.hook;class IslandSceneSelection{static boolean on=true;static boolean enabled(Object c,String id){return on;}}',
'ls/augment/com/hook/FeatureRuntimeLog.java':'''package ls.augment.com.hook;class FeatureRuntimeLog{static String last;
 static void state(String stage,String key,String value){last=value;}static String failure(Throwable t){return t.getClass().getName();}}''',
}
magic=(SRC/'MagicIslandScenes.java').read_text(encoding='utf-8')
def member(marker):
 start=magic.index(marker);end=magic.index('{',start)+1;depth=1
 while depth:
  depth+=(magic[end]=='{')-(magic[end]=='}');end+=1
 return magic[start:end]
files['ls/augment/com/hook/MagicIslandScenes.java']='package ls.augment.com.hook;import java.lang.reflect.*;class MagicIslandScenes{'+member('    static Method exact(')+member('    static Field typed(')+'}'
files['ls/augment/com/hook/NativeIslandMusicRecovery.java']=(SRC/'NativeIslandMusicRecovery.java').read_text(encoding='utf-8')
files['ls/augment/com/hook/TestMusicRecovery.java']='''package ls.augment.com.hook;
import java.util.*;import android.media.session.*;import android.os.Handler;import android.content.Context;
public class TestMusicRecovery{
 static int checks;static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 public static class Permanent{public Map<String,Object> mAppIslandList=new HashMap<>();boolean locked,disabled;}
 public static class Manager{
  public MediaSessionManager mMediaSessionManager=new MediaSessionManager();public MediaController mMediaController;
  public String mCurrentPlayPkg,mPkgName="launcher";public boolean mIsPlaying;Permanent p=new Permanent();int binds,refreshes,attempts;boolean support=true,allow=true;
  public void handleMediaControllerList(List<MediaController> list){binds++;mCurrentPlayPkg=mMediaSessionManager.pkg;
   for(MediaController c:list)if(c.pkg.equals(mCurrentPlayPkg)){mMediaController=c;refreshAfterRegisterCallback();return;}}
  public void refreshAfterRegisterCallback(){refreshes++;mIsPlaying=mMediaController.state!=null&&mMediaController.state.state==3;}
  public boolean isSupportMediaControl(String p){return support;}public boolean shouldShowOnMediaIsland(String p){return allow;}
  public void handleMediaIslandFullScreen(String foreground){attempts++;if(mIsPlaying&&!foreground.equals(mCurrentPlayPkg)&&!p.locked&&!p.disabled)p.mAppIslandList.put("media_island",this);}
 }
 public static class Child extends Manager{}
 public static class Wrong extends Manager{public String mMediaController="bad";}
 public static class Old{public Object mMediaController;}
 static MediaController add(Manager m,int id){var c=new MediaController("music",id);m.mMediaSessionManager.values.add(c);m.mMediaSessionManager.token=c.token;return c;}
 static NativeIslandMusicRecovery start(Manager m)throws Exception{var r=new NativeIslandMusicRecovery(new Context(),m,m.p);r.start();Handler.drain();return r;}
 static void reset(){FeatureSettings.on=true;IslandSceneSelection.on=true;android.app.ActivityManager.user=0;}
 public static void main(String[] args)throws Exception{
  reset();Manager m=new Manager();var c=add(m,1);var r=start(m);
  check(m.binds==1&&m.mMediaController==c&&m.mIsPlaying,"restart with pre-existing playback bootstraps without a listener callback");
  check(m.p.mAppIslandList.size()==1,"background existing playback reaches native card");
  r.request();r.request();Handler.drain();check(m.binds==1&&m.attempts==1,"repeated foreground events do not rebind or duplicate");
  r.close();check(m.mMediaSessionManager.active==null&&m.mMediaSessionManager.key==null&&FeatureSettings.changed==null,"all listeners released");
  r.request();Handler.drain();check(m.binds==1,"closed instance stays retired");
  m=new Manager();c=add(m,2);m.mPkgName="music";r=start(m);check(m.p.mAppIslandList.isEmpty(),"source foreground stays hidden");
  m.mPkgName="launcher";r.request();Handler.drain();check(m.p.mAppIslandList.size()==1,"foreground to background recovers despite already-playing state");r.close();
  m=new Manager();c=add(m,3);m.mMediaSessionManager.pkg="";r=start(m);check(m.binds==0,"active session before media-key selection is not guessed");
  m.mMediaSessionManager.pkg="music";m.mMediaSessionManager.key.onMediaKeyEventSessionChanged("music",c.token);Handler.drain();
  check(m.binds==1&&m.p.mAppIslandList.size()==1,"late media-key event repairs first-play ordering");r.close();
  m=new Manager();c=add(m,4);c.state.state=2;r=start(m);check(!m.mIsPlaying&&m.p.mAppIslandList.isEmpty(),"paused bootstrap creates no island");
  c.state.state=3;r.request();Handler.drain();check(m.mIsPlaying&&m.binds==1&&m.refreshes==2,"stale state refreshed through original callback entry");r.close();
  m=new Child();add(m,5);r=start(m);check(m.binds==1,"inherited native contracts supported");r.close();
  try{new NativeIslandMusicRecovery(new Context(),new Old(),new Permanent());throw new AssertionError("old path intercepted");}catch(NoSuchMethodException expected){checks++;}
  try{new NativeIslandMusicRecovery(new Context(),new Wrong(),new Permanent());throw new AssertionError("wrong field accepted");}catch(NoSuchFieldException expected){checks++;}
  m=new Manager();add(m,6);m.p.locked=true;r=start(m);check(m.p.mAppIslandList.isEmpty(),"native privacy gate preserved");r.close();
  m=new Manager();add(m,7);m.p.disabled=true;r=start(m);check(m.p.mAppIslandList.isEmpty(),"native scene switch preserved");r.close();
  for(int k=0;k<4;k++){m=new Manager();add(m,10+k);reset();if(k==0)m.allow=false;if(k==1)m.support=false;if(k==2)FeatureSettings.on=false;if(k==3)IslandSceneSelection.on=false;
   r=start(m);check(m.binds==0&&m.p.mAppIslandList.isEmpty(),"native/Duo exclusion "+k);r.close();}reset();
  m=new Manager();add(m,20);android.app.ActivityManager.user=10;r=start(m);check(m.binds==0,"never selects another user's media");r.close();reset();
  m=new Manager();add(m,21);m.mMediaSessionManager.changedDuringQuery=true;r=start(m);check(m.binds==0,"source switch during snapshot is rejected");r.close();
  m=new Manager();var older=add(m,22);var newer=add(m,23);r=start(m);check(m.mMediaController==newer,"same package uses actual media-key token");r.close();
  m=new Manager();add(m,24);add(m,25);m.mMediaSessionManager.token=null;r=start(m);check(m.binds==0,"ambiguous session retains native behavior");r.close();
  m=new Manager();add(m,26);m.mMediaSessionManager.missingKeys=true;r=start(m);check(m.binds==1,"optional key listener absence preserves initial recovery");r.close();
  m=new Manager();add(m,27);r=new NativeIslandMusicRecovery(new Context(),m,m.p);r.start();r.close();Handler.drain();check(m.binds==0,"close cancels queued recovery");
  m=new Manager();add(m,28);m.mPkgName=null;r=start(m);check(m.binds==0,"unknown foreground cannot bypass native foreground exclusion");
  m.mPkgName="music";r.request();Handler.drain();check(m.binds==1&&m.p.mAppIslandList.isEmpty(),"foreground readiness binds without exposing card over source");
  m.mPkgName="launcher";r.request();Handler.drain();check(m.p.mAppIslandList.size()==1,"background event completes deferred bootstrap");r.close();
  System.out.println("Native music recovery: "+checks+" checks passed");
 }
}'''
with tempfile.TemporaryDirectory(prefix='duo-music-recovery-') as tmp:
 folder=Path(tmp)
 for name,value in files.items():
  p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value,encoding='utf-8')
 java=Path(os.environ['JAVA_HOME'])/'bin'
 subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(folder),*map(str,folder.rglob('*.java'))],check=True)
 subprocess.run([str(java/'java.exe'),'-cp',str(folder),'ls.augment.com.hook.TestMusicRecovery'],check=True)
