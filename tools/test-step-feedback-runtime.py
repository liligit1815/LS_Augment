"""Exercise playback evidence, disappearing pages, upper routing and side focus ownership."""
from pathlib import Path
import os, subprocess, tempfile

root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'

def method(file, signature):
    s=(step/file).read_text(encoding='utf-8'); a=s.index(signature); b=s.index('{',a)+1; depth=1
    while depth:
        depth+=(s[b]=='{')-(s[b]=='}'); b+=1
    return s[a:b]

def run(name, code, extra=()):
    with tempfile.TemporaryDirectory(prefix='step-feedback-') as tmp:
        p=Path(tmp); source=p/(name+'.java'); source.write_text(code,encoding='utf-8')
        subprocess.run([java/'javac','-encoding','UTF-8','-d',p,source,*extra],check=True)
        subprocess.run([java/'java','-cp',p,'ls.augment.com.step.'+name],check=True)

run('PlaybackCases',r'''
package ls.augment.com.step;
import java.lang.reflect.*;import java.util.*;
public class PlaybackCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class PlaybackState {static final int STATE_PLAYING=3;int state=3;int getState(){return state;}}
 static class MediaController {
  PlaybackState state=new PlaybackState();String pkg="music";PlaybackInfo output=new PlaybackInfo();
  PlaybackState getPlaybackState(){return state;}String getPackageName(){return pkg;}PlaybackInfo getPlaybackInfo(){return output;}
  static class PlaybackInfo {static final int PLAYBACK_TYPE_REMOTE=2;int type=1;int getPlaybackType(){return type;}}
 }
 static class MissingPackage extends Exception {}
 static class App {int uid=10042;}
 static class Context {Context getPackageManager(){return this;}App getApplicationInfo(String pkg,int flags)throws MissingPackage{if(pkg.equals("gone"))throw new MissingPackage();return new App();}}
 static class AudioPlaybackConfiguration {boolean running,muted;int uid;AudioPlaybackConfiguration(int u,boolean a){uid=u;running=a;}boolean isActive(){return running&&!muted;}int getPlayerState(){return running?2:3;}int getClientUid(){return uid;}}
 static class Audio {boolean denied;List<AudioPlaybackConfiguration> configs=new ArrayList<>();List<AudioPlaybackConfiguration> getActivePlaybackConfigurations(){if(denied)throw new SecurityException();return configs;}}
 Context context=new Context();Audio audio=new Audio();Map<String,Integer> uids=new HashMap<>();Method active,uid,state;int started=2,unavailable;
 void unavailable(Throwable e){unavailable++;}
 ACTIVE
 PLAYING
 public static void main(String[] args)throws Exception {
  PlaybackCases p=new PlaybackCases();MediaController c=new MediaController();
  p.active=AudioPlaybackConfiguration.class.getDeclaredMethod("isActive");p.uid=AudioPlaybackConfiguration.class.getDeclaredMethod("getClientUid");
  check(!p.playing(c,p.activeUids()),"retained PLAYING session without actual local audio stays hidden");
  p.audio.configs.add(new AudioPlaybackConfiguration(10043,true));check(!p.playing(c,p.activeUids()),"another app's game audio cannot revive stale music session");
  p.audio.configs.add(new AudioPlaybackConfiguration(10042,true));check(p.playing(c,p.activeUids()),"matching active local player visible");
  p.audio.configs.get(1).muted=true;check(!p.playing(c,p.activeUids()),"old audible-only capability stays conservative");
  p.state=AudioPlaybackConfiguration.class.getDeclaredMethod("getPlayerState");
  check(p.playing(c,p.activeUids()),"verified started track keeps music visible even at zero volume");
  p.audio.configs.get(1).muted=false;
  for(int state:new int[]{0,1,2,6,7}){c.state.state=state;check(!p.playing(c,p.activeUids()),"paused/stopped/buffering/error hidden even if audio has not caught up");}
  c.state.state=3;p.audio.configs.get(1).running=false;check(!p.playing(c,p.activeUids()),"stopped audio hides stale session");
  p.audio.configs.add(new AudioPlaybackConfiguration(-1,true));check(!p.playing(c,p.activeUids()) && p.unavailable>0,"anonymous playback cannot be attributed to a package");
  p.audio.denied=true;check(!p.playing(c,p.activeUids()),"missing local permission fails closed");
  c.output.type=2;check(p.playing(c,Set.of()),"remote playback does not require a phone audio track");
  c.state.state=2;check(!p.playing(c,Set.of()),"paused remote session hidden");
  c.output.type=1;c.state.state=3;c.pkg="gone";check(!p.playing(c,Set.of(10042)),"removed package hidden");
  c.state=null;check(!p.playing(c,Set.of(10042)),"missing state hidden");
  p.active=null;check(p.activeUids().isEmpty(),"missing native capability preserves no-playback UI");
  System.out.println("PASS "+checks+" playback evidence checks");
 }
}
'''.replace('ACTIVE',method('WorkspacePlayback.java','    Set<Integer> activeUids()'))
 .replace('\n PLAYING\n','\n'+method('WorkspacePlayback.java','    boolean playing(').replace('android.content.pm.PackageManager.NameNotFoundException','MissingPackage')+'\n'))

run('PageCases',r'''
package ls.augment.com.step;
import java.util.*;
public class PageCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static class View{}static class FrameLayout {static class LayoutParams{LayoutParams(int a,int b){}}}
 static final int CONTROLS=0,MUSIC=1,UPPER=2,ROUTE=3,LEGACY_ROUTE=3,CHOSEN_CONTROLS=4,NAVIGATION=5;
 View navigationPage=new View(),networks=new View(),mediaPage=new View(),topPage=new View(),routePage=new View();List<View> children=new ArrayList<>(List.of(networks,topPage));
 boolean navigating,musicActive,manualPage,gesture,interrupted,restored,pendingMusicRestore;int page,savedPage;Object controller;Runnable timeout;
 void postDelayed(Runnable run,int delay){timeout=run;}
 boolean playing(Object c){return c!=null;}void stopPaging(){}void hint(){}
 int indexOfChild(View v){return children.indexOf(v);}int getChildCount(){return children.size();}View getChildAt(int i){return children.get(i);}
 void addView(View v,int i,FrameLayout.LayoutParams p){children.add(i,v);}void removeView(View v){children.remove(v);}
 int id(View v){return v==networks?CONTROLS:v==mediaPage?MUSIC:v==topPage?UPPER:ROUTE;}
 void openNativePage(){}void jump(int target){page=target;check(target!=MUSIC || children.contains(mediaPage),"never select absent music");}
 static class Host{int upperId=42,upperNavigationId=-1;boolean home,unknown;String action;boolean homeAloneBehindUpper(){if(unknown)throw new IllegalStateException();return home;}void log(String s){}void upperAction(String a,Runnable done){action=a;if(done!=null)done.run();}}
 static class Upper {Host host;Upper(Host h){host=h;}void render(boolean taskFace){}}
 static class Owner {Host host=new Host();Upper upper=new Upper(host);}Owner owner=new Owner();
 UPDATE
 FROMUPPER
 LEAVEPAGE
 RESTOREPAGE
 public static void main(String[] args){
  PageCases p=new PageCases();p.updatePlayback();check(p.children.size()==2 && p.page==CONTROLS,"no empty music page at startup");
  p.controller=new Object();p.updatePlayback();check(p.page==CONTROLS && p.children.get(1)==p.mediaPage,"playback inserts music without replacing selected wallpaper");
  p.manualPage=true;p.controller=null;p.updatePlayback();check(p.page==CONTROLS && !p.children.contains(p.mediaPage),"manual music page disappears on pause");
  p.controller=new Object();p.updatePlayback();p.controller=null;p.updatePlayback();check(p.page==CONTROLS,"media removal returns to tools; maps use native upper app");
  p.page=UPPER;p.gesture=true;p.controller=new Object();p.updatePlayback();check(p.page==UPPER && p.interrupted,"changing page count cancels stale gesture without replacing upper task");
  p.controller=null;p.updatePlayback();p.leaveUpperPage();check(p.page==CONTROLS,"upper fallback reaches tools");
  p.navigating=false;p.page=UPPER;p.leaveUpperPage();check(p.page==CONTROLS,"upper fallback cannot select missing music");
  p.page=UPPER;p.owner.host.home=true;p.fromUpper(-1);check(p.owner.host.action.equals("park") && p.page==CONTROLS,"horizontal departure only parks top app over Home; promotion stays in logo menu");
  p.page=UPPER;p.owner.host.home=false;p.fromUpper(-1);check(p.owner.host.action.equals("park"),"existing main app keeps top app parked");
  p.owner.host.unknown=true;p.fromUpper(-1);check(p.owner.host.action.equals("park"),"unknown main identity never auto-promotes upper app");
  p.restorePage(LEGACY_ROUTE);check(p.page==CONTROLS && p.restored,"old text-navigation bookmark migrates to existing tools page");
  p.controller=new Object();p.updatePlayback();p.restorePage(LEGACY_ROUTE);check(p.page==CONTROLS,"old bookmark returns to wallpaper; music stays available to swipe");
  p.controller=null;p.updatePlayback();p.restorePage(MUSIC);check(p.page==CONTROLS && p.pendingMusicRestore,"unlock waits for real playback evidence without selecting absent music");
  p.controller=new Object();p.updatePlayback();check(p.page==MUSIC && !p.pendingMusicRestore,"delayed active session restores previously selected music");
  p.controller=null;p.updatePlayback();p.restorePage(MUSIC);p.timeout.run();p.controller=new Object();p.updatePlayback();check(p.page==CONTROLS,"expired restore never steals wallpaper when music starts later");
  System.out.println("PASS "+checks+" page visibility and upper routing checks");
 }
}
'''.replace('UPDATE',method('WorkspaceDeck.java','    void updatePlayback('))
 .replace('FROMUPPER',method('WorkspaceDeck.java','    void fromUpper('))
 .replace('LEAVEPAGE',method('WorkspaceDeck.java','    void leaveUpperPage('))
 .replace('RESTOREPAGE',method('WorkspaceDeck.java','    void restorePage(')))

run('SideLifecycleCases',r'''
package ls.augment.com.step;
import java.util.*;import java.util.function.*;import java.lang.reflect.*;
class StepHook {} class StepHooks {static void hookMethod(Method m,StepHook h){}}
public class SideLifecycleCases {
 static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
 static Object call(Object o,String n,Object... args){return StepMembers.callMethod(o,n,args);}static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}
 LOOKUP
 EXACT
 static class LocalLandscape{static Method exact(Class<?> t,String n,Class<?> r,Class<?>... a)throws ReflectiveOperationException{return SideLifecycleCases.exact(t,n,r,a);}}
 static class Wm {static Object display=new Object(),context=new Object();}
 static boolean active=true,ending,available=true;static int principal;static Object lastMain;
 static Map<Integer,SavedTask> saved=new HashMap<>();static Map<Integer,Task> live=new HashMap<>();static SideSlots slots=new SideSlots();
 static class WorkspaceUsers{static boolean allows(Object c,int p,int u){return p==u;}}
 static class WorkspaceMainFocus{static boolean secondary(Object t){return t instanceof Task x && slots.index(x.mTaskId)>=0;}}
 static class WorkspaceReadmit{static SavedTask pending;static boolean allowsFocus(SavedTask r,Object t){return r==pending && r.task==t;}}
 static class Info{boolean isVisible=true;}static class Surface {int id=99;int getLayerId(){return id;}}
 static class Task {
  int mTaskId=42,mUserId,mode=6,type=1;Object token=new Object(),parent=new Object(),display=Wm.display;Area area;Info info=new Info();Surface surface=new Surface();boolean focusable=true;
  Object getDisplayContent(){return display;}Object getParent(){return parent;}int getWindowingMode(){return mode;}Object getSurfaceControl(){return surface;}
  Area getTaskDisplayArea(){return area;}Task getRootTask(){return this;}boolean isFocusable(){return focusable;}int getActivityType(){return type;}Info getTaskInfo(){return info;}
 }
 static class AreaBase{List<Task> roots=new ArrayList<>();Task getRootTask(Predicate<Object> p,boolean top){for(Task t:roots)if(p.test(t))return t;return null;}}
 static class Area extends AreaBase {Task getFocusedRootTask(){return null;}}
 static class AreaChild extends Area {}static class MissingArea{}static class WrongArea extends AreaBase{static Task getFocusedRootTask(){return null;}}
 static class Activity {boolean shouldResumeActivity(Activity a){return true;}boolean shouldPauseActivity(Activity a){return false;}}
 static class ActivityChild extends Activity{}static class MissingActivity{}static class WrongActivity {int shouldResumeActivity(WrongActivity a){return 1;}boolean shouldPauseActivity(WrongActivity a){return true;}}
 static class SavedTask {int id=42,user,layerId=99;Task task;Object token,parent;boolean dirty=true;SavedTask(Task t){task=t;token=t.token;parent=t.parent;}}
 static Object liveTask(int id,Object token){Task t=live.get(id);return t!=null && t.token==token?t:null;}
 static boolean ownsTask(Object t){return saved.values().stream().anyMatch(s->s.task==t && s.dirty);}
 static boolean runningActivity(Object t){return t instanceof Task;}
 static Object eligibleMain(Object t){return t instanceof Task && !ownsTask(t)?t:null;}
 PROBE
 SELECT
 OWNED
 MAIN
 KEEP
 public static void main(String[] args)throws Exception {
  probe(Area.class,Task.class,Activity.class);checks++;probe(AreaChild.class,Task.class,Activity.class);checks++;
  for(Class<?> type:new Class<?>[]{MissingArea.class,WrongArea.class})try{probe(type,Task.class,Activity.class);throw new AssertionError("unrecognized area");}catch(ReflectiveOperationException expected){checks++;}
  for(Class<?> type:new Class<?>[]{MissingActivity.class,WrongActivity.class,ActivityChild.class})try{probe(Area.class,Task.class,type);throw new AssertionError("wrong lifecycle signature");}catch(ReflectiveOperationException expected){checks++;}
  Area area=new Area();Task side=new Task(),main=new Task();main.mTaskId=7;main.mode=1;side.area=main.area=area;area.roots.addAll(List.of(side,main));
  SavedTask r=new SavedTask(side);saved.put(42,r);live.put(42,side);slots.replace(0,-1,42);lastMain=main;
  check(selectFocus(side,area)==main && keepResumed(),"side remains lifecycle eligible while main retains focused root");
  saved.put(7,new SavedTask(main));check(selectFocus(side,area)==main,"outgoing main remains the focus candidate while flip owns its surface");saved.remove(7);
  WorkspaceReadmit.pending=r;check(selectFocus(side,area)==side,"temporary game recovery focus preserved");WorkspaceReadmit.pending=null;
  lastMain=null;check(selectFocus(side,area)==main,"visible native main selected without cached identity");
  main.info.isVisible=false;check(selectFocus(side,area)==side,"hidden main is not activated");main.info.isVisible=true;
  main.mUserId=10;check(selectFocus(side,area)==side,"other user main excluded");main.mUserId=0;
  side.surface.id=100;check(selectFocus(side,area)==side,"replacement surface retains native behavior");side.surface.id=99;
  live.put(42,new Task());check(selectFocus(side,area)==side,"reused task id not intercepted");live.put(42,side);
  side.parent=new Object();check(selectFocus(side,area)==side,"foreign parent not intercepted");side.parent=r.parent;
  side.mode=5;check(selectFocus(side,area)==side,"OEM freeform ownership respected");side.mode=6;
  check(selectFocus(main,area)==main,"ordinary focus selection untouched");ending=true;check(selectFocus(side,area)==side && !keepResumed(),"ending restores native lifecycle policy");ending=false;
  available=false;check(selectFocus(side,area)==side && !keepResumed(),"missing interfaces preserve previous path");
  System.out.println("PASS "+checks+" side lifecycle capability/ownership checks");
 }
}
'''.replace('LOOKUP',method('OwnershipBridge.java','public static Method method('))
 .replace('EXACT',method('LocalLandscape.java','static Method exact(').replace('OwnershipBridge.method','method'))
 .replace('PROBE',method('SideLifecycle.java','    static Method probe('))
 .replace('SELECT',method('SideLifecycle.java','    static Object selectFocus('))
 .replace('OWNED',method('SideLifecycle.java','    static SavedTask owned('))
 .replace('MAIN',method('SideLifecycle.java','    static boolean mainCandidate('))
 .replace('KEEP',method('SideLifecycle.java','    static boolean keepResumed(')),(step/'StepMembers.java',step/'SideSlots.java'))
