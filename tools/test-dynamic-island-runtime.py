from pathlib import Path
import subprocess,tempfile
root=Path(__file__).resolve().parents[1]
source=(root/'android/app/src/main/java/ls/augment/com/hook/DynamicIslandHook.java').read_text(encoding='utf-8')
def method(marker):
 start=source.index(marker);end=source.index('{',start)+1;depth=1
 while depth:
  depth+=(source[end]=='{')-(source[end]=='}');end+=1
 return source[start:end]
harness='''import java.util.*;import ls.augment.com.IslandActivityPolicy;
public class TestIslandReview {
 static int checks;static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static class MotionEvent{static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;static int owned;
  int action;float x,y;boolean copy;MotionEvent(int a,float x,float y){action=a;this.x=x;this.y=y;}
  int getActionMasked(){return action;}float getX(){return x;}float getY(){return y;}
  static MotionEvent obtain(MotionEvent e){MotionEvent n=new MotionEvent(e.action,e.x,e.y);n.copy=true;owned++;return n;}
  void recycle(){if(!copy)throw new AssertionError("double recycle");copy=false;owned--;}}
 static class ViewConfiguration{static ViewConfiguration get(Object c){return new ViewConfiguration();}int getScaledTouchSlop(){return 8;}static int getLongPressTimeout(){return 500;}}
 static class Handler{Map<Runnable,Long> jobs=new HashMap<>();void postDelayed(Runnable task,long delay){jobs.put(task,SystemClock.now+delay);}void removeCallbacks(Runnable task){jobs.remove(task);}
  void advance(long delta){SystemClock.now+=delta;for(Map.Entry<Runnable,Long> entry:new ArrayList<>(jobs.entrySet()))if(entry.getValue()<=SystemClock.now){jobs.remove(entry.getKey());entry.getKey().run();}}}
 static final Handler MAIN=new Handler();
 static class android{static class view{interface ViewParent{}}}
 static class View implements android.view.ViewParent{static final int VISIBLE=0;boolean attached=true,shown=true;int visibility;float alpha=1;android.view.ViewParent parent;
  boolean isAttachedToWindow(){return attached;}boolean isShown(){return shown&&(!(parent instanceof View)||((View)parent).isShown());}int getWindowVisibility(){return visibility;}float getAlpha(){return alpha;}android.view.ViewParent getParent(){return parent;}}
 static class FrameLayout{static class LayoutParams{int width=144,height=30,topMargin;}}
 static class Pill{int clicks,longClicks,childDown,layoutUpdates,kind,battery;Object icon;boolean playing,transparent,circularIcon;float translationX;FrameLayout.LayoutParams params=new FrameLayout.LayoutParams();boolean shown=true,clickable=true,longClickable=true;boolean isShown(){return shown;}boolean isClickable(){return clickable;}void setClickable(boolean value){clickable=value;}boolean isLongClickable(){return longClickable;}void setLongClickable(boolean value){longClickable=value;}
  Object getLayoutParams(){return params;}void setLayoutParams(FrameLayout.LayoutParams value){params=value;layoutUpdates++;}void setTranslationX(float value){translationX=value;}
  float getX(){return 100+translationX;}float getY(){return params.topMargin;}int getWidth(){return params.width;}int getHeight(){return params.height;}void performClick(){clicks++;}void performLongClick(){longClicks++;}
  boolean hit(MotionEvent e){return shown&&e.x>=getX()&&e.x<getX()+getWidth()&&e.y>=getY()&&e.y<getY()+getHeight();}}
 // Model ViewGroup's normal dispatch after the hook returns PASS. A clickable
 // child that accepts DOWN owns that gesture; merely replaying into the parent
 // does not deliver it to the parent's native notification-shade handler.
 static class Host extends View{State state;int nativeDown,nativeMove,nativeUp,width=360,height=64;boolean pillTarget,nativeTarget,failNativeDown;int getWidth(){return width;}int getHeight(){return height;}
  boolean dispatchTouchEvent(MotionEvent e){
   if(e.action==MotionEvent.ACTION_DOWN){pillTarget=false;nativeTarget=false;}
   if(state.touch(e))return true;
   if(e.action==MotionEvent.ACTION_DOWN){
    if(state.pill.hit(e)&&(state.pill.isClickable()||state.pill.isLongClickable())){pillTarget=true;state.pill.childDown++;return true;}
    if(failNativeDown)throw new IllegalStateException("native DOWN failed");nativeTarget=true;nativeDown++;return true;
   }
   if(pillTarget){if(e.action==MotionEvent.ACTION_UP||e.action==MotionEvent.ACTION_CANCEL)pillTarget=false;return true;}
   if(nativeTarget){if(e.action==MotionEvent.ACTION_MOVE)nativeMove++;if(e.action==MotionEvent.ACTION_UP){nativeUp++;nativeTarget=false;}if(e.action==MotionEvent.ACTION_CANCEL)nativeTarget=false;return true;}
   return false;
  }}
 static class PlaybackState{int value;PlaybackState(int value){this.value=value;}int getState(){return value;}}
 static class MediaSession{static class Token{}}
 static class MediaController{final MediaSession.Token token=new MediaSession.Token();final String packageName;PlaybackState state;boolean bad;MediaController(int value){this("media.default",value);}MediaController(String packageName,int value){this.packageName=packageName;state=new PlaybackState(value);}PlaybackState getPlaybackState(){if(bad)throw new IllegalStateException();return state;}MediaSession.Token getSessionToken(){return token;}String getPackageName(){return packageName;}}
 static class Build{static class VERSION{static int SDK_INT=36;}}
 static class SystemClock{static long now=1234;static long elapsedRealtime(){return now;}}
 static class PowerManager{boolean interactive=true;boolean isInteractive(){return interactive;}}
 static class Bundle{int mode;Bundle(int mode){this.mode=mode;}}
 static class ActivityOptions{static final int MODE_BACKGROUND_ACTIVITY_START_ALLOWED=1,MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS=3;int mode;
  static ActivityOptions makeBasic(){return new ActivityOptions();}void setPendingIntentBackgroundActivityStartMode(int value){mode=value;}Bundle toBundle(){return new Bundle(mode);}}
 static final String P="island_";
 static class SystemUiOptions{static final String ISLAND_OFFSET_Y=P+"offset_y",ISLAND_TRANSPARENT=P+"transparent";}
 static class FeatureSettings{static String key,value;static Map<String,Integer> values=new HashMap<>();static void diagnostic(Object context,String k,String v){key=k;value=v;}static int integer(Object c,String k,int fallback,int min,int max){return Math.max(min,Math.min(max,values.getOrDefault(k,fallback)));}static boolean enabled(Object c,String k){return values.getOrDefault(k,0)!=0;}}
 static class PendingIntent{int sends,launches,mode;boolean canceled,bad;static class CanceledException extends Exception{}
  void send(Object context,int code,Object intent,Object callback,Object handler,String permission,Bundle options)throws CanceledException{
   sends++;if(canceled)throw new CanceledException();if(bad)throw new SecurityException("private payload must not enter diagnostics");
   mode=options==null?0:options.mode;if(mode==1||mode==3)launches++;
  }}
 static class NotificationManager{static final int IMPORTANCE_DEFAULT=3;static class Policy{static final int SUPPRESSED_EFFECT_STATUS_BAR=1,SUPPRESSED_EFFECT_PEEK=2,SUPPRESSED_EFFECT_NOTIFICATION_LIST=4;}}
 static class TextUtils{static boolean isEmpty(CharSequence value){return value==null||value.length()==0;}}
 static class Extras extends HashMap<String,CharSequence>{CharSequence getCharSequence(String key){return get(key);}}
 static class Notification{static final int VISIBILITY_SECRET=-1,FLAG_GROUP_SUMMARY=512,FLAG_ONGOING_EVENT=2,FLAG_ONLY_ALERT_ONCE=8;
  static final String EXTRA_MEDIA_SESSION="media",EXTRA_TEXT="text",EXTRA_TITLE="title";int visibility,flags;Extras extras=new Extras();}
 static class StatusBarNotification{String key;int user;Notification notification=new Notification();StatusBarNotification(String key,String text){this.key=key;notification.extras.put(Notification.EXTRA_TITLE,"Heading");notification.extras.put(Notification.EXTRA_TEXT,text);}
  int getUserId(){return user;}String getKey(){return key;}Notification getNotification(){return notification;}}
 static class NotificationListenerService{static class Ranking{int importance=3,effects;boolean suspended,interruption=true;int getImportance(){return importance;}boolean isSuspended(){return suspended;}boolean matchesInterruptionFilter(){return interruption;}int getSuppressedVisualEffects(){return effects;}}
  static class RankingMap{Ranking value=new Ranking();boolean found=true;boolean getRanking(String key,Ranking result){result.importance=value.importance;result.effects=value.effects;result.suspended=value.suspended;result.interruption=value.interruption;return found;}}}
 static class NativeHost{boolean fade;boolean ownsStatusBarFade(){return fade;}}
 static class State{NativeHost nativeHost=new NativeHost();Object context=new Object();Pill pill=new Pill();Host host=new Host();PowerManager power=new PowerManager();MotionEvent downEvent;boolean enabled=true,closed,screenOff,replaying,touching,isLocked,longPressed;int activity=1,ownerUser=0,user=0;float downX,downY;List<MediaController> controllers=new ArrayList<>();MediaController media;final Map<MediaSession.Token,IslandActivityPolicy.MediaActivity> mediaActivities=new HashMap<>();final Runnable longPress=()->{};
  StatusBarNotification notice;long noticeUntil;final Map<String,Integer> noticeHistory=new LinkedHashMap<>();boolean observedHostVisible,playing,circularAppStyle;int refreshRequests,battery;Object icon;float density=1;int dp(int value){return Math.round(value*density);}
  String foreground="launcher";String foregroundPackage(){return foreground;}
  State(){host.state=this;}boolean locked(){return isLocked;}int currentUser(){return user;}boolean option(String key){return true;}void refresh(){}void dismiss(){}void requestRefresh(){refreshRequests++;}
  boolean touch(MotionEvent e){return false;}
  // METHODS
 }
 static MotionEvent event(int action,float x,float y){return new MotionEvent(action,x,y);}
 public static void main(String[] args){
  State s=new State();
  SystemClock.now=1234;
  State visibility=new State();check(visibility.observeHostVisibility()&&visibility.refreshRequests==1,"initial attached host wakes the capsule once");
  for(int frame=0;frame<100;frame++)visibility.observeHostVisibility();check(visibility.refreshRequests==1,"unchanged draw frames do not poll activity state");
  visibility.host.alpha=0;visibility.observeHostVisibility();check(visibility.refreshRequests==2&&!visibility.hostVisible(),"alpha-only status bar hiding closes the island");
  visibility.host.alpha=1;visibility.observeHostVisibility();check(visibility.refreshRequests==3&&visibility.hostVisible(),"alpha restoration wakes a previously hidden island");
  View ancestor=new View();visibility.host.parent=ancestor;ancestor.alpha=0;visibility.observeHostVisibility();check(visibility.refreshRequests==4&&!visibility.hostVisible(),"ancestor alpha is part of effective visibility");
  ancestor.alpha=1;visibility.observeHostVisibility();check(visibility.refreshRequests==5,"ancestor restoration wakes activity");
  ancestor.shown=false;visibility.observeHostVisibility();check(visibility.refreshRequests==6&&!visibility.hostVisible(),"ancestor visibility hides the expanded panel too");
  ancestor.shown=true;visibility.host.alpha=0;visibility.nativeHost.fade=true;
  check(visibility.hostVisible(),"native panel fade does not dismiss itself");
  ancestor.alpha=0;check(!visibility.hostVisible(),"native panel fade cannot bypass hidden ancestors");
  ancestor.alpha=1;visibility.host.shown=false;check(!visibility.hostVisible(),"native fade cannot bypass host visibility");
  visibility.host.shown=true;visibility.nativeHost.fade=false;check(!visibility.hostVisible(),"fullscreen alpha resumes hiding after native fade ends");

  MediaController paused=new MediaController(2),playing=new MediaController(3),broken=new MediaController(3);broken.bad=true;s.controllers.add(paused);s.controllers.add(broken);s.controllers.add(playing);
  check(s.selectMedia()==playing,"real playback beats a paused session even if another session fails");playing.state=new PlaybackState(1);
  check(s.selectMedia()==playing,"the previously playing session retains its existing track handoff grace");
  SystemClock.now+=IslandActivityPolicy.MEDIA_HANDOFF_MILLIS;
  check(s.selectMedia()==null,"after the handoff expires an unrelated stale paused session never becomes an activity");
  playing.state=new PlaybackState(3);check(s.selectMedia()==playing,"resumed playback appears");playing.state=new PlaybackState(2);check(s.selectMedia()==playing,"new pause gets brief grace");
  SystemClock.now+=4000;check(s.selectMedia()==null,"paused playback disappears exactly at four seconds");
  paused.state=new PlaybackState(7);playing.state=new PlaybackState(1);check(s.selectMedia()==null,"stopped/error sessions disappear");
  State foregroundMedia=new State();MediaController bili=new MediaController("tv.danmaku.bili",3);foregroundMedia.controllers.add(bili);foregroundMedia.foreground=bili.getPackageName();
  check(foregroundMedia.selectMedia()==null,"Bili playing in foreground never appears on the island");
  check(foregroundMedia.mediaActivities.containsKey(bili.getSessionToken()),"foreground playback still updates the session lease");
  bili.state=new PlaybackState(6);check(foregroundMedia.selectMedia()==null,"Bili buffering in foreground never appears on the island");
  bili.state=new PlaybackState(2);check(foregroundMedia.selectMedia()==null,"Bili pause grace in foreground never appears on the island");
  bili.state=new PlaybackState(3);check(foregroundMedia.selectMedia()==null,"foreground playback stays hidden when it resumes");
  foregroundMedia.foreground="launcher";check(foregroundMedia.selectMedia()==bili,"leaving Bili reveals ongoing background playback without a playback callback");foregroundMedia.media=bili;
  foregroundMedia.foreground=bili.getPackageName();check(foregroundMedia.selectMedia()==null,"returning to Bili hides unchanged playback without a playback callback");
  MediaController backgroundMusic=new MediaController("com.netease.cloudmusic",3);foregroundMedia.controllers.add(backgroundMusic);
  check(foregroundMedia.selectMedia()==backgroundMusic,"background music wins even when the previously selected session is foreground Bili");
  foregroundMedia.foreground=null;check(foregroundMedia.selectMedia()==null,"unknown foreground fails closed for every media session");
  foregroundMedia.foreground="";check(foregroundMedia.selectMedia()==bili,"known foreground belonging to another user does not hide this user's background media");
  State suppressedPause=new State();MediaController pausedBili=new MediaController("tv.danmaku.bili",3);suppressedPause.controllers.add(pausedBili);suppressedPause.foreground=pausedBili.getPackageName();
  suppressedPause.selectMedia();pausedBili.state=new PlaybackState(2);check(suppressedPause.selectMedia()==null,"a pause that starts while foreground stays hidden");
  long pauseDeadline=suppressedPause.mediaActivities.get(pausedBili.getSessionToken()).expiresAt();check(pauseDeadline==SystemClock.now+IslandActivityPolicy.PAUSE_MILLIS,"foreground pause starts its real grace deadline");
  SystemClock.now+=1000;check(suppressedPause.selectMedia()==null&&suppressedPause.mediaActivities.get(pausedBili.getSessionToken()).expiresAt()==pauseDeadline,"foreground suppression cannot renew pause grace");
  SystemClock.now=pauseDeadline;suppressedPause.foreground="launcher";check(suppressedPause.selectMedia()==null,"leaving after foreground pause grace expires cannot revive stale playback");
  State suppressedTransition=new State();MediaController bufferingBili=new MediaController("tv.danmaku.bili",6);suppressedTransition.controllers.add(bufferingBili);suppressedTransition.foreground=bufferingBili.getPackageName();
  check(suppressedTransition.selectMedia()==null,"a transition that starts while foreground stays hidden");long transitionDeadline=suppressedTransition.mediaActivities.get(bufferingBili.getSessionToken()).expiresAt();
  check(transitionDeadline==SystemClock.now+IslandActivityPolicy.TRANSITION_MILLIS,"foreground transition starts its real expiration deadline");
  SystemClock.now+=1000;check(suppressedTransition.selectMedia()==null&&suppressedTransition.mediaActivities.get(bufferingBili.getSessionToken()).expiresAt()==transitionDeadline,"foreground suppression cannot renew transition grace");
  SystemClock.now=transitionDeadline;suppressedTransition.foreground="launcher";check(suppressedTransition.selectMedia()==null,"leaving after foreground buffering expires cannot revive stale playback");SystemClock.now=1234;
  NotificationListenerService.RankingMap map=new NotificationListenerService.RankingMap();check(s.allowedRanking("key",map),"normal notification can appear");
  for(int effect:new int[]{1,2,4,7}){map.value.effects=effect;check(!s.allowedRanking("key",map),"DND visual policy honored");}map.value.effects=0;
  map.value.interruption=false;check(!s.allowedRanking("key",map),"DND interruption filter honored");map.value.interruption=true;
  map.value.suspended=true;check(!s.allowedRanking("key",map),"suspended package hidden");map.value.suspended=false;map.value.importance=2;check(!s.allowedRanking("key",map),"silent notification hidden");map.value.importance=3;map.found=false;check(!s.allowedRanking("key",map),"unknown ranking fails closed");
  map=new NotificationListenerService.RankingMap();State n=new State();StatusBarNotification message=new StatusBarNotification("message","Private text");n.notice(message,map);
  check(n.notice==message&&n.noticeUntil==7234,"new eligible notification starts one deadline");
  SystemClock.now=2234;n.notice(message,map);check(n.noticeUntil==7234,"reposted same content never extends its deadline");
  n.clearNotice();n.notice(message,map);check(n.notice==null,"expired identical notification does not pin the island again");
  message.notification.extras.put(Notification.EXTRA_TEXT,"New text");n.notice(message,map);check(n.notice==message,"meaningful changed content can present a new notification");
  n.clearNotice();message.notification.flags=Notification.FLAG_ONLY_ALERT_ONCE;message.notification.extras.put(Notification.EXTRA_TEXT,"Silent update");n.notice(message,map);check(n.notice==null,"only-alert-once content updates cannot restart the island");
  n.noticeHistory.remove(message.getKey());message.notification.flags=0;n.notice(message,map);check(n.notice==message,"a genuinely new post after removal is allowed");
  for(int flags:new int[]{Notification.FLAG_GROUP_SUMMARY,Notification.FLAG_ONGOING_EVENT}){message.notification.flags=flags;n.notice(message,map);check(n.notice==null,"summary and ongoing notifications cannot pin the island");}message.notification.flags=0;
  for(int guard=0;guard<5;guard++){State privateState=new State();StatusBarNotification hidden=new StatusBarNotification("private","secret");
   if(guard==0)hidden.user=10;if(guard==1)hidden.notification.visibility=-1;if(guard==2)hidden.notification.extras.put(Notification.EXTRA_MEDIA_SESSION,"duplicate");if(guard==3)privateState.isLocked=true;if(guard==4)privateState.screenOff=true;
   privateState.notice(hidden,map);check(privateState.notice==null,"privacy and media duplicate filters fail closed");}
  SystemClock.now=1234;
  PendingIntent pending=new PendingIntent();s.openNotice(pending);
  check(pending.sends==1&&pending.launches==1&&pending.mode==3,"Android 16 notification click grants sender launch privileges");
  check(FeatureSettings.key.equals("ls_augment_island_open")&&FeatureSettings.value.equals("submitted;at=1234"),"submission diagnostic is separate from activity state");
  Build.VERSION.SDK_INT=35;s.openNotice(pending);check(pending.launches==2&&pending.mode==1,"Android 15 uses compatible sender opt-in");Build.VERSION.SDK_INT=36;
  for(int guard=0;guard<8;guard++){State blocked=new State();PendingIntent noSend=new PendingIntent();
   if(guard==0)blocked.isLocked=true;if(guard==1)blocked.screenOff=true;if(guard==2)blocked.enabled=false;if(guard==3)blocked.closed=true;if(guard==4)blocked.power=null;if(guard==5)blocked.power.interactive=false;if(guard==6)blocked.user=1;if(guard==7)blocked.ownerUser=-1;
   blocked.openNotice(noSend);check(noSend.sends==0&&FeatureSettings.value.startsWith("blocked;"),"notification open rechecks lifecycle and privacy");}
  s.openNotice(null);check(FeatureSettings.value.startsWith("blocked;"),"null intent is never sent");
  PendingIntent canceled=new PendingIntent();canceled.canceled=true;s.openNotice(canceled);check(FeatureSettings.value.startsWith("canceled;"),"canceled intent reported without crashing SystemUI");
  PendingIntent bad=new PendingIntent();bad.bad=true;s.openNotice(bad);check(FeatureSettings.value.equals("failed:SecurityException;at=1234"),"exception diagnostic includes type only, no notification or exception payload");
  System.out.println("PASS island production event policy/privacy: "+checks+" checks");
 }
}
'''
harness=harness.replace('// METHODS','\n'.join(method(m) for m in ['boolean hostVisible(','boolean observeHostVisibility(','MediaController selectMedia(','boolean sameSession(','void notice(','void withdrawNotice(','void clearNotice(','boolean allowedRanking(','void openNotice(','void openDiagnostic(']))
# Uses the caller's configured JDK, like the other host regression scripts.
with tempfile.TemporaryDirectory(prefix='island-review-') as tmp:
 path=Path(tmp)/'TestIslandReview.java';path.write_text(harness,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-d',tmp,str(path),str(root/'android/app/src/main/java/ls/augment/com/IslandActivityPolicy.java'),str(root/'tools/TestIslandActivityPolicy.java')],check=True)
 subprocess.run(['java','-cp',tmp,'TestIslandReview'],check=True)
 subprocess.run(['java','-cp',tmp,'ls.augment.com.TestIslandActivityPolicy'],check=True)
 # Plain send() omitted this option and is silently blocked for a background
 # creator on modern Android. Reject that behavior even if submission returns.
 mutant=harness.replace('options.toBundle()','null',1)
 if mutant==harness:raise AssertionError('PendingIntent launch options not found')
 path.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',tmp,'-d',tmp,str(path)],check=True)
 rejected=subprocess.run(['java','-cp',tmp,'TestIslandReview'],capture_output=True,text=True)
 if rejected.returncode==0 or 'Android 16 notification click grants sender launch privileges' not in rejected.stderr:
  raise AssertionError('The notification regression must reject missing sender options: '+rejected.stderr)
 print('PASS missing PendingIntent sender opt-in mutant rejected')
 # Foreground filtering must affect real selection, including an already
 # selected session, while leases continue to age during suppression.
 mutant=harness.replace('controller.getPackageName().equals(foreground)','false',1)
 if mutant==harness:raise AssertionError('Foreground package guard not found in the extracted production selector')
 path.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',tmp,'-d',tmp,str(path)],check=True)
 rejected=subprocess.run(['java','-cp',tmp,'TestIslandReview'],capture_output=True,text=True)
 if rejected.returncode==0 or 'Bili playing in foreground never appears on the island' not in rejected.stderr:
  raise AssertionError('The foreground regression must reject selecting the foreground Bili session: '+rejected.stderr)
 print('PASS missing foreground-package exclusion mutant rejected')
 mutant=harness.replace('foreground==null','false',1)
 if mutant==harness:raise AssertionError('Unknown foreground guard not found in the extracted production selector')
 path.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',tmp,'-d',tmp,str(path)],check=True)
 rejected=subprocess.run(['java','-cp',tmp,'TestIslandReview'],capture_output=True,text=True)
 if rejected.returncode==0 or 'unknown foreground fails closed for every media session' not in rejected.stderr:
  raise AssertionError('The foreground regression must reject selecting media without a known foreground: '+rejected.stderr)
 print('PASS unknown foreground fails-closed mutant rejected')
