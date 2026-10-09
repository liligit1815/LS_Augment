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
 static class Pill{int clicks,longClicks,childDown;boolean shown=true,clickable=true,longClickable=true;boolean isShown(){return shown;}boolean isClickable(){return clickable;}void setClickable(boolean value){clickable=value;}boolean isLongClickable(){return longClickable;}void setLongClickable(boolean value){longClickable=value;}
  float getX(){return 100;}float getY(){return 0;}int getWidth(){return 144;}int getHeight(){return 30;}void performClick(){clicks++;}void performLongClick(){longClicks++;}
  boolean hit(MotionEvent e){return shown&&e.x>=getX()&&e.x<getX()+getWidth()&&e.y>=getY()&&e.y<getY()+getHeight();}}
 // Model ViewGroup's normal dispatch after the hook returns PASS. A clickable
 // child that accepts DOWN owns that gesture; merely replaying into the parent
 // does not deliver it to the parent's native notification-shade handler.
 static class Host extends View{State state;int nativeDown,nativeMove,nativeUp;boolean pillTarget,nativeTarget,failNativeDown;
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
 static class MediaController{final MediaSession.Token token=new MediaSession.Token();PlaybackState state;boolean bad;MediaController(int value){state=new PlaybackState(value);}PlaybackState getPlaybackState(){if(bad)throw new IllegalStateException();return state;}MediaSession.Token getSessionToken(){return token;}}
 static class Build{static class VERSION{static int SDK_INT=36;}}
 static class SystemClock{static long now=1234;static long elapsedRealtime(){return now;}}
 static class PowerManager{boolean interactive=true;boolean isInteractive(){return interactive;}}
 static class Bundle{int mode;Bundle(int mode){this.mode=mode;}}
 static class ActivityOptions{static final int MODE_BACKGROUND_ACTIVITY_START_ALLOWED=1,MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS=3;int mode;
  static ActivityOptions makeBasic(){return new ActivityOptions();}void setPendingIntentBackgroundActivityStartMode(int value){mode=value;}Bundle toBundle(){return new Bundle(mode);}}
 static final String P="island_";
 static class FeatureSettings{static String key,value;static void diagnostic(Object context,String k,String v){key=k;value=v;}static int integer(Object c,String k,int fallback,int min,int max){return fallback;}}
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
 static class State{Object context=new Object();Pill pill=new Pill();Host host=new Host();PowerManager power=new PowerManager();MotionEvent downEvent;boolean enabled=true,closed,screenOff,replaying,touching,isLocked,longPressed;int activity=1,ownerUser=0,user=0;float downX,downY;List<MediaController> controllers=new ArrayList<>();MediaController media;final Map<MediaSession.Token,IslandActivityPolicy.MediaActivity> mediaActivities=new HashMap<>();final Runnable longPress=this::performLongPress;
  StatusBarNotification notice;long noticeUntil;final Map<String,Integer> noticeHistory=new LinkedHashMap<>();boolean observedHostVisible;int refreshRequests;
  State(){host.state=this;}boolean locked(){return isLocked;}int currentUser(){return user;}boolean option(String key){return true;}void refresh(){}void dismiss(){}void requestRefresh(){refreshRequests++;}
  // METHODS
 }
 static MotionEvent event(int action,float x,float y){return new MotionEvent(action,x,y);}
 public static void main(String[] args){
  State s=new State();check(!s.touch(event(0,10,10)),"outside gesture stays native");
  check(s.touch(event(0,110,10)),"capsule starts tap");check(s.touch(event(1,112,12)),"capsule finishes tap");check(s.pill.clicks==1&&MotionEvent.owned==0,"tap clicks once and releases event");
  for(int i=0;i<100;i++){check(s.host.dispatchTouchEvent(event(0,110,10)),"hold initial down");check(s.host.dispatchTouchEvent(event(2,110,30)),"parent dispatch handles the swipe");check(s.host.dispatchTouchEvent(event(1,110,60)),"parent dispatch handles the release");}
  check(s.host.nativeDown==100&&s.host.nativeMove==100&&s.host.nativeUp==100&&s.pill.childDown==0,"swipe replay reaches native handler instead of the clickable pill");
  check(s.pill.clicks==1&&MotionEvent.owned==0&&s.pill.isClickable(),"swipe restores capsule clickability without a tap or event leak");
  check(s.host.dispatchTouchEvent(event(0,110,10))&&s.host.dispatchTouchEvent(event(1,110,10))&&s.pill.clicks==2,"capsule remains tappable after native swipes");
  State nativeFailure=new State();nativeFailure.host.failNativeDown=true;nativeFailure.host.dispatchTouchEvent(event(0,110,10));
  try{nativeFailure.host.dispatchTouchEvent(event(2,110,30));throw new AssertionError("missing native failure");}catch(IllegalStateException expected){}
  check(nativeFailure.pill.isClickable()&&!nativeFailure.replaying&&!nativeFailure.touching&&MotionEvent.owned==0,"failed native replay restores clickability and releases event");
  s.touch(event(0,110,10));check(!s.touch(event(5,110,10)),"multi-touch belongs to native");check(MotionEvent.owned==0,"multi-touch releases held event");
  s.touch(event(0,110,10));check(s.touch(event(3,110,10))&&MotionEvent.owned==0,"cancel releases held event");
  int clicked=s.pill.clicks;s.touch(event(0,110,10));MAIN.advance(500);check(s.pill.longClicks==1,"held tap expands once");
  check(s.touch(event(1,110,10))&&s.pill.clicks==clicked,"release after long press never launches the app");
  s.touch(event(0,110,10));s.touch(event(3,110,10));MAIN.advance(500);check(s.pill.longClicks==1&&MAIN.jobs.isEmpty(),"canceled gesture cannot open a later popup");
  s.touch(event(0,110,10));s.touch(event(2,110,30));MAIN.advance(500);check(s.pill.longClicks==1,"native swipe cancels long press");
  for(int guard=0;guard<5;guard++){State blocked=new State();blocked.touch(event(0,110,10));
   if(guard==0)blocked.isLocked=true;if(guard==1)blocked.screenOff=true;if(guard==2)blocked.enabled=false;if(guard==3)blocked.closed=true;if(guard==4)blocked.user=1;
   MAIN.advance(500);check(blocked.pill.longClicks==0,"lifecycle changes invalidate pending long press");blocked.cancelTouch();}
  SystemClock.now=1234;
  State visibility=new State();check(visibility.observeHostVisibility()&&visibility.refreshRequests==1,"initial attached host wakes the capsule once");
  for(int frame=0;frame<100;frame++)visibility.observeHostVisibility();check(visibility.refreshRequests==1,"unchanged draw frames do not poll activity state");
  visibility.host.alpha=0;visibility.observeHostVisibility();check(visibility.refreshRequests==2&&!visibility.hostVisible(),"alpha-only status bar hiding closes the island");
  visibility.host.alpha=1;visibility.observeHostVisibility();check(visibility.refreshRequests==3&&visibility.hostVisible(),"alpha restoration wakes a previously hidden island");
  View ancestor=new View();visibility.host.parent=ancestor;ancestor.alpha=0;visibility.observeHostVisibility();check(visibility.refreshRequests==4&&!visibility.hostVisible(),"ancestor alpha is part of effective visibility");
  ancestor.alpha=1;visibility.observeHostVisibility();check(visibility.refreshRequests==5,"ancestor restoration wakes activity");
  ancestor.shown=false;visibility.observeHostVisibility();check(visibility.refreshRequests==6&&!visibility.hostVisible(),"ancestor visibility hides the expanded panel too");
  s.screenOff=true;check(!s.touch(event(0,110,10)),"screen-off never captures taps");s.screenOff=false;s.isLocked=true;check(!s.touch(event(0,110,10)),"lock screen never captures taps");s.isLocked=false;
  MediaController paused=new MediaController(2),playing=new MediaController(3),broken=new MediaController(3);broken.bad=true;s.controllers.add(paused);s.controllers.add(broken);s.controllers.add(playing);
  check(s.selectMedia()==playing,"real playback beats a paused session even if another session fails");playing.state=new PlaybackState(1);check(s.selectMedia()==null,"an unrelated stale paused session never becomes an activity");
  playing.state=new PlaybackState(3);check(s.selectMedia()==playing,"resumed playback appears");playing.state=new PlaybackState(2);check(s.selectMedia()==playing,"new pause gets brief grace");
  SystemClock.now+=4000;check(s.selectMedia()==null,"paused playback disappears exactly at four seconds");SystemClock.now=1234;
  paused.state=new PlaybackState(7);playing.state=new PlaybackState(1);check(s.selectMedia()==null,"stopped/error sessions disappear");
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
  System.out.println("PASS island production touch/media/privacy: "+checks+" checks");
 }
}
'''
harness=harness.replace('// METHODS','\n'.join(method(m) for m in ['boolean touch(','void cancelTouch(','void performLongPress(','boolean hostVisible(','boolean observeHostVisibility(','MediaController selectMedia(','boolean sameSession(','void notice(','void withdrawNotice(','void clearNotice(','boolean allowedRanking(','void openNotice(','void openDiagnostic(']))
# Uses the caller's configured JDK, like the other host regression scripts.
with tempfile.TemporaryDirectory(prefix='island-review-') as tmp:
 path=Path(tmp)/'TestIslandReview.java';path.write_text(harness,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-d',tmp,str(path),str(root/'android/app/src/main/java/ls/augment/com/IslandActivityPolicy.java'),str(root/'tools/TestIslandActivityPolicy.java')],check=True)
 subprocess.run(['java','-cp',tmp,'TestIslandReview'],check=True)
 subprocess.run(['java','-cp',tmp,'ls.augment.com.TestIslandActivityPolicy'],check=True)
 # Prove that the test detects the device failure, not just successful hook
 # return values: the previous implementation replayed DOWN with the pill still
 # clickable, so real hit testing captured it before the native shade handler.
 mutant=harness.replace('pill.setClickable(false);','/* mutant: child remains clickable during replay */',1)
 if mutant==harness:raise AssertionError('Clickable handoff was not found in the extracted production method')
 path.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',tmp,'-d',tmp,str(path)],check=True)
 rejected=subprocess.run(['java','-cp',tmp,'TestIslandReview'],capture_output=True,text=True)
 if rejected.returncode==0 or 'swipe replay reaches native handler instead of the clickable pill' not in rejected.stderr:
  raise AssertionError('The hit-test regression must reject replay with a clickable capsule: '+rejected.stderr)
 print('PASS clickable-child regression mutant rejected at native gesture handoff')
 mutant=harness.replace('pill.setLongClickable(false);','/* mutant: child remains long-clickable during replay */',1)
 if mutant==harness:raise AssertionError('Long-clickable handoff was not found in the extracted production method')
 path.write_text(mutant,encoding='utf-8')
 subprocess.run(['javac','-encoding','UTF-8','-cp',tmp,'-d',tmp,str(path)],check=True)
 rejected=subprocess.run(['java','-cp',tmp,'TestIslandReview'],capture_output=True,text=True)
 if rejected.returncode==0 or 'swipe replay reaches native handler instead of the clickable pill' not in rejected.stderr:
  raise AssertionError('The hit-test regression must reject a long-clickable capsule during replay: '+rejected.stderr)
 print('PASS long-clickable-child regression mutant rejected at native gesture handoff')
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
