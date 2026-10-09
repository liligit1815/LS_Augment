package ls.augment.com.hook;

import android.app.ActivityOptions;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.UserHandle;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewConfiguration;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.IslandActivityPolicy;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Phone-only activity capsule. Uses SystemUI's existing session/notification access. */
final class DynamicIslandHook {
    private static final String PHONE="com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String LISTENER="com.android.systemui.statusbar.NotificationListener";
    private static final String P=SystemUiOptions.PREFIX+"island_";
    private static final String USER_SWITCHED="android.intent.action.USER_SWITCHED";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,State> STATES=new WeakHashMap<>();

    static int install(AugmentModule module,ClassLoader loader) {
        int count=hookNamed(module,loader,"island",PHONE,"onAttachedToWindow",0,null,(owner,args,result)->{
            if(owner instanceof FrameLayout && !STATES.containsKey(owner)){
                State state=new State((FrameLayout)owner);STATES.put((View)owner,state);state.start();
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",PHONE,"onDetachedFromWindow",0,null,(owner,args,result)->{
            State state=STATES.remove(owner);if(state!=null)state.close();return PASS;
        });
        // OEM intercepts status-bar gestures before child dispatch. Claim only a tap
        // begun inside the visible capsule; scrolling elsewhere stays OEM-owned.
        count+=hookNamed(module,loader,"island",PHONE,"dispatchTouchEvent",1,(owner,args,result)->{
            State state=STATES.get(owner);
            return state!=null && state.touch((MotionEvent)args[0])?Boolean.TRUE:PASS;
        },null);
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationPosted",2,null,(owner,args,result)->{
            if(args[0] instanceof StatusBarNotification){
                StatusBarNotification sbn=(StatusBarNotification)args[0];
                NotificationListenerService.RankingMap rankings=(NotificationListenerService.RankingMap)args[1];
                MAIN.post(()->{for(State state:new ArrayList<>(STATES.values()))try{state.notice(sbn,rankings);}
                    catch(RuntimeException failure){state.withdrawNotice(sbn.getKey());state.diagnostic("notice_unavailable:"+failure.getClass().getSimpleName());}});
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationRemoved",3,null,(owner,args,result)->{
            if(args[0] instanceof StatusBarNotification){String key=((StatusBarNotification)args[0]).getKey();
                MAIN.post(()->{for(State state:new ArrayList<>(STATES.values())){
                    state.noticeHistory.remove(key);state.withdrawNotice(key);
                }});
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationRankingUpdate",1,null,(owner,args,result)->{
            if(args[0] instanceof NotificationListenerService.RankingMap){
                NotificationListenerService.RankingMap rankings=(NotificationListenerService.RankingMap)args[0];
                MAIN.post(()->{for(State state:new ArrayList<>(STATES.values())){
                    if(state.notice!=null&&!state.allowedRanking(state.notice.getKey(),rankings)){state.clearNotice();state.refresh();}
                }});
            }return PASS;
        });
        module.logFeatureInfo("DYNAMIC_ISLAND_READY hooks="+count);
        return count;
    }

    private static final class State {
        final FrameLayout host;final Context context;final Capsule pill;
        final MediaSessionManager sessions;final KeyguardManager keyguard;final PowerManager power;
        final Runnable config=this::configure,tick=this::refresh,collapse=this::dismiss;
        final Runnable longPress=this::performLongPress;
        final View.OnLayoutChangeListener hostLayout=(view,l,t,r,b,oldL,oldT,oldR,oldB)->{
            if(l!=oldL||t!=oldT||r!=oldR||b!=oldB)requestRefresh();
        };
        final android.view.ViewTreeObserver.OnPreDrawListener hostVisibility=this::observeHostVisibility;
        final List<MediaController> controllers=new ArrayList<>();
        final Map<MediaSession.Token,IslandActivityPolicy.MediaActivity> mediaActivities=new HashMap<>();
        final Map<String,Integer> noticeHistory=new LinkedHashMap<>();
        final IslandActivityPolicy.ChargingActivity chargeActivity=new IslandActivityPolicy.ChargingActivity();
        // Query the current user's list again: a delayed callback from the previous
        // user must never republish that user's media after a user switch.
        final MediaSessionManager.OnActiveSessionsChangedListener sessionListener=ignored->reloadSessions();
        final MediaController.Callback mediaCallback=new MediaController.Callback(){
            @Override public void onPlaybackStateChanged(PlaybackState s){refresh();}
            @Override public void onMetadataChanged(MediaMetadata m){refresh();}
            @Override public void onSessionDestroyed(){reloadSessions();}
        };
        final BroadcastReceiver receiver=new BroadcastReceiver(){
            @Override public void onReceive(Context c,Intent intent){
                if(Intent.ACTION_SCREEN_OFF.equals(intent.getAction()))screenOff=true;
                else if(Intent.ACTION_SCREEN_ON.equals(intent.getAction())||Intent.ACTION_USER_PRESENT.equals(intent.getAction()))screenOff=false;
                if(Intent.ACTION_BATTERY_CHANGED.equals(intent.getAction())){
                    int status=intent.getIntExtra(BatteryManager.EXTRA_STATUS,0);
                    boolean connected=intent.getIntExtra(BatteryManager.EXTRA_PLUGGED,0)!=0;
                    charging=connected
                            && (status==BatteryManager.BATTERY_STATUS_CHARGING||status==BatteryManager.BATTERY_STATUS_FULL);
                    int scale=intent.getIntExtra(BatteryManager.EXTRA_SCALE,100);
                    battery=Math.max(0,Math.min(100,intent.getIntExtra(BatteryManager.EXTRA_LEVEL,0)*100/Math.max(1,scale)));
                    chargeActivity.update(connected,charging,SystemClock.elapsedRealtime());
                    if(screenOff||locked())chargeActivity.clear();
                }else if(Intent.ACTION_SCREEN_OFF.equals(intent.getAction())||USER_SWITCHED.equals(intent.getAction())){
                    clearNotice();chargeActivity.clear();mediaActivities.clear();dismiss();
                    if(USER_SWITCHED.equals(intent.getAction())){stopMediaListening();listenMedia();}
                }
                refresh();
            }
        };
        boolean enabled,listening,receiving,closed,charging,touching,replaying,screenOff,longPressed,observedHostVisible;
        int battery,activity,ownerUser=-1;float downX,downY;
        MotionEvent downEvent;
        long noticeUntil;String lastState="";
        StatusBarNotification notice;MediaController media;PopupWindow popup;
        Bitmap cachedArt;Drawable cachedArtDrawable,cachedAppIcon;String cachedIconPackage="",popupContent="";
        String title="",subtitle="";Drawable icon;boolean playing;
        State(FrameLayout host){this.host=host;context=host.getContext();pill=new Capsule(context);
            sessions=context.getSystemService(MediaSessionManager.class);keyguard=context.getSystemService(KeyguardManager.class);
            power=context.getSystemService(PowerManager.class);pill.setVisibility(View.GONE);
            pill.setContentDescription("灵动岛，轻点打开，长按展开");pill.setOnClickListener(v->openActivity());
            pill.setOnLongClickListener(v->{expand();return true;});
            pill.visibilityChanged=this::requestRefresh;
            host.addView(pill,new FrameLayout.LayoutParams(1,1,Gravity.TOP|Gravity.CENTER_HORIZONTAL));
            host.addOnLayoutChangeListener(hostLayout);
            host.getViewTreeObserver().addOnPreDrawListener(hostVisibility);
        }
        void requestRefresh(){if(!closed){MAIN.removeCallbacks(tick);MAIN.post(tick);}}
        boolean hostVisible(){
            if(!host.isAttachedToWindow()||!host.isShown()||host.getWindowVisibility()!=View.VISIBLE)return false;
            float alpha=1f;
            for(View current=host;current!=null;){
                alpha*=current.getAlpha();if(alpha<=.01f)return false;
                android.view.ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;
            }
            return true;
        }
        boolean observeHostVisibility(){
            // OEM fullscreen and the module's hide-status-bar option use alpha,
            // which emits no visibility callback. Compare only view properties;
            // unchanged frames do not query sessions/users or schedule any work.
            boolean visible=hostVisible();
            if(visible!=observedHostVisible){observedHostVisible=visible;requestRefresh();}
            return true;
        }
        void start(){FeatureSettings.addSnapshotListener(context,config);configure();}
        boolean option(String suffix){return FeatureSettings.integer(context,P+suffix,1,0,1)!=0;}
        boolean locked(){return keyguard!=null&&keyguard.isKeyguardLocked();}
        void configure(){
            if(closed)return;boolean next=FeatureSettings.enabled(context,SystemUiOptions.ISLAND);
            if(next!=enabled){enabled=next;if(enabled)listen();else stopListening();}
            if(!option("notifications"))clearNotice();
            if(!option("charging"))chargeActivity.clear();
            if(!option("music"))mediaActivities.clear();
            dismiss();refresh();
        }
        void listen(){
            screenOff=power==null||!power.isInteractive();
            chargeActivity.reset();
            listenMedia();
            IntentFilter filter=new IntentFilter(Intent.ACTION_BATTERY_CHANGED);filter.addAction(Intent.ACTION_SCREEN_OFF);
            filter.addAction(Intent.ACTION_SCREEN_ON);filter.addAction(Intent.ACTION_USER_PRESENT);filter.addAction(USER_SWITCHED);
            try{context.registerReceiver(receiver,filter,Context.RECEIVER_EXPORTED);receiving=true;}
            catch(RuntimeException error){diagnostic("events_unavailable:"+error.getClass().getSimpleName());}
        }
        void listenMedia(){
            if(closed||!enabled)return;
            int user=currentUser();ownerUser=user;if(user<0||sessions==null)return;
            try{
                call(sessions,"addOnActiveSessionsChangedListener",null,UserHandle.getUserHandleForUid(user*100000),
                        (java.util.concurrent.Executor)task->MAIN.post(task),sessionListener);
                listening=true;
            }catch(ReflectiveOperationException|RuntimeException error){
                // Older releases expose only the calling user's API. Never use
                // that fallback for a different foreground user.
                if(user==android.os.Process.myUid()/100000)try{
                    sessions.addOnActiveSessionsChangedListener(sessionListener,null,MAIN);listening=true;
                }catch(RuntimeException unavailable){diagnostic("media_unavailable:"+unavailable.getClass().getSimpleName());}
            }
            reloadSessions();
        }
        void reloadSessions(){
            if(closed||!enabled||sessions==null)return;
            int user=currentUser();List<MediaController> next=Collections.emptyList();
            if(user>=0)try{
                Object value=call(sessions,"getActiveSessionsForUser",null,UserHandle.getUserHandleForUid(user*100000));
                if(value instanceof List){
                    next=new ArrayList<>();for(Object controller:(List<?>)value)if(controller instanceof MediaController)next.add((MediaController)controller);
                }
            }catch(ReflectiveOperationException|RuntimeException error){
                if(user==android.os.Process.myUid()/100000)try{next=sessions.getActiveSessions(null);}catch(RuntimeException ignored){}
            }
            setSessions(next);
        }
        void setSessions(List<MediaController> next){
            for(MediaController controller:controllers)try{controller.unregisterCallback(mediaCallback);}catch(RuntimeException ignored){}
            controllers.clear();
            if(enabled&&!closed&&next!=null)for(MediaController controller:next)try{
                controller.registerCallback(mediaCallback,MAIN);controllers.add(controller);
            }catch(RuntimeException ignored){}
            List<MediaSession.Token> tokens=new ArrayList<>();
            for(MediaController controller:controllers)tokens.add(controller.getSessionToken());
            mediaActivities.keySet().retainAll(tokens);
            refresh();
        }
        MediaController selectMedia(){
            MediaController active=null,fallback=null;long now=SystemClock.elapsedRealtime();
            for(MediaController controller:controllers)try{
                PlaybackState state=controller.getPlaybackState();
                IslandActivityPolicy.MediaActivity lease=mediaActivities.get(controller.getSessionToken());
                if(lease==null){lease=new IslandActivityPolicy.MediaActivity();mediaActivities.put(controller.getSessionToken(),lease);}
                boolean showing=lease.update(state==null?0:state.getState(),now);
                if(!showing)continue;
                if(state!=null&&IslandActivityPolicy.mediaPlaying(state.getState())){
                    if(active==null||sameSession(controller,media))active=controller;
                }else if(fallback==null||sameSession(controller,media))fallback=controller;
            }catch(RuntimeException ignored){}
            return active!=null?active:fallback;
        }
        boolean sameSession(MediaController first,MediaController second){return first!=null&&second!=null&&first.getSessionToken().equals(second.getSessionToken());}
        void notice(StatusBarNotification sbn,NotificationListenerService.RankingMap map){
            if(closed||!enabled||screenOff||!option("notifications")||locked()||power==null||!power.isInteractive())return;
            Notification n=sbn.getNotification();
            // No work-profile/other-user content, group summaries, silent items,
            // secret notifications or media duplicates. Never log message contents.
            int user=currentUser();
            if(user<0||(sbn.getUserId()!=user&&sbn.getUserId()!=-1)||n.visibility==Notification.VISIBILITY_SECRET
                    ||(n.flags&(Notification.FLAG_GROUP_SUMMARY|Notification.FLAG_ONGOING_EVENT))!=0
                    ||n.extras==null||n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION)
                    ||!allowedRanking(sbn.getKey(),map)){withdrawNotice(sbn.getKey());return;}
            CharSequence text=n.extras.getCharSequence(Notification.EXTRA_TEXT),heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
            if(TextUtils.isEmpty(text)&&TextUtils.isEmpty(heading)){withdrawNotice(sbn.getKey());return;}
            // Keep a bounded, content-free fingerprint after expiration: a
            // repeated post or ONLY_ALERT_ONCE update must not pin the island.
            int fingerprint=31*String.valueOf(heading).hashCode()+String.valueOf(text).hashCode();
            Integer previous=noticeHistory.get(sbn.getKey());
            if(previous!=null&&(previous==fingerprint||(n.flags&Notification.FLAG_ONLY_ALERT_ONCE)!=0))return;
            noticeHistory.put(sbn.getKey(),fingerprint);
            if(noticeHistory.size()>64)noticeHistory.remove(noticeHistory.keySet().iterator().next());
            notice=sbn;noticeUntil=SystemClock.elapsedRealtime()+FeatureSettings.integer(context,P+"notice_seconds",6,3,15)*1000L;dismiss();refresh();
        }
        boolean allowedRanking(String key,NotificationListenerService.RankingMap map){
            NotificationListenerService.Ranking ranking=new NotificationListenerService.Ranking();
            return map!=null&&map.getRanking(key,ranking)&&ranking.getImportance()>=NotificationManager.IMPORTANCE_DEFAULT
                    &&!ranking.isSuspended()&&ranking.matchesInterruptionFilter()&&(ranking.getSuppressedVisualEffects()&
                    (NotificationManager.Policy.SUPPRESSED_EFFECT_STATUS_BAR|NotificationManager.Policy.SUPPRESSED_EFFECT_PEEK
                            |NotificationManager.Policy.SUPPRESSED_EFFECT_NOTIFICATION_LIST))==0;
        }
        int currentUser(){try{return (Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);}catch(Exception ignored){return -1;}}
        void withdrawNotice(String key){if(notice!=null&&notice.getKey().equals(key)){clearNotice();refresh();}}
        void clearNotice(){notice=null;noticeUntil=0;}
        void refresh(){
            MAIN.removeCallbacks(tick);if(closed)return;
            try{refreshState();}catch(RuntimeException failure){
                hide();diagnostic("activity_unavailable:"+failure.getClass().getSimpleName());
            }
        }
        void refreshState(){
            if(!enabled){hide();return;}
            // No periodic work or waveform frames while sleeping/locked. Screen
            // and unlock broadcasts resume the view without retaining message text.
            if(screenOff||power==null||!power.isInteractive()||locked()){
                clearNotice();chargeActivity.clear();mediaActivities.clear();activity=IslandActivityPolicy.NONE;hide();return;
            }
            if(ownerUser<0||ownerUser!=currentUser()){
                clearNotice();chargeActivity.clear();mediaActivities.clear();activity=IslandActivityPolicy.NONE;hide();return;
            }
            long now=SystemClock.elapsedRealtime();if(now>=noticeUntil)clearNotice();
            MediaController selected=option("music")?selectMedia():null;
            if(media!=null&&!sameSession(media,selected))dismiss();
            media=selected;
            boolean visible=hostVisible();
            int next=IslandActivityPolicy.choose(enabled,visible,locked(),now,media!=null,notice!=null,noticeUntil,
                    option("charging")&&charging,chargeActivity.expiresAt());
            if(activity!=next){dismiss();activity=next;}
            if(next==IslandActivityPolicy.NONE)hide();else{
                updateContent();
                // A popup is a snapshot of its media session/actions. Close it if
                // metadata or playback state changed, so it cannot control stale UI.
                String content=activity+"|"+title+"|"+subtitle+"|"+playing;
                if(popup!=null&&!content.equals(popupContent))dismiss();
                layout();showPill();pill.bringToFront();pill.invalidate();
                // Compact notifications disclose only their app. Message content
                // is read only after a deliberate long press on an unlocked phone.
                pill.setContentDescription("灵动岛："+(activity==IslandActivityPolicy.NOTICE?appLabel(notice.getPackageName()):title)+"。轻点打开，长按展开");
                diagnostic("activity="+next+",playing="+playing);
            }
            long deadline=0;
            if(notice!=null&&noticeUntil>now)deadline=noticeUntil;
            if(option("charging")&&charging&&chargeActivity.expiresAt()>now)
                deadline=earlier(deadline,chargeActivity.expiresAt());
            if(media!=null){IslandActivityPolicy.MediaActivity lease=mediaActivities.get(media.getSessionToken());
                if(lease!=null&&lease.expiresAt()>now)deadline=earlier(deadline,lease.expiresAt());}
            if(deadline>now)MAIN.postDelayed(tick,deadline-now);
        }
        long earlier(long first,long second){return first==0?second:Math.min(first,second);}
        void updateContent(){
            title="";subtitle="";icon=null;playing=false;
            if(activity==IslandActivityPolicy.MUSIC&&media!=null){
                MediaMetadata metadata=media.getMetadata();PlaybackState state=media.getPlaybackState();
                playing=state!=null&&IslandActivityPolicy.mediaPlaying(state.getState());
                if(metadata!=null){title=string(metadata.getText(MediaMetadata.METADATA_KEY_TITLE));subtitle=string(metadata.getText(MediaMetadata.METADATA_KEY_ARTIST));
                    Bitmap art=metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);if(art==null)art=metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
                    if(art!=null&&!art.isRecycled()){
                        if(art!=cachedArt){cachedArt=art;cachedArtDrawable=new android.graphics.drawable.BitmapDrawable(context.getResources(),art);}
                        icon=cachedArtDrawable;
                    }
                }
                if(title.isEmpty())title="音乐";if(icon==null)icon=appIcon(media.getPackageName());
            }else if(activity==IslandActivityPolicy.NOTICE&&notice!=null){
                Notification n=notice.getNotification();title=string(n.extras.getCharSequence(Notification.EXTRA_TITLE));
                subtitle=string(n.extras.getCharSequence(Notification.EXTRA_TEXT));icon=appIcon(notice.getPackageName());
                if(title.isEmpty())title=appLabel(notice.getPackageName());
            }else if(activity==IslandActivityPolicy.CHARGING){title="充电中";subtitle="电量 "+battery+"% · 已连接电源";}
        }
        Drawable appIcon(String pkg){
            if(pkg.equals(cachedIconPackage))return cachedAppIcon;
            cachedIconPackage=pkg;try{cachedAppIcon=context.getPackageManager().getApplicationIcon(pkg);}catch(Exception ignored){cachedAppIcon=null;}
            return cachedAppIcon;
        }
        String appLabel(String pkg){try{return context.getPackageManager().getApplicationLabel(context.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception ignored){return "新通知";}}
        String string(CharSequence value){return value==null?"":value.toString();}
        void layout(){
            int h=Math.min(dp(FeatureSettings.integer(context,P+"height",32,20,48)),Math.max(0,host.getHeight()-dp(2)));
            int w=Math.min(dp(FeatureSettings.integer(context,P+"width",120,96,240)),Math.max(0,host.getWidth()-dp(16)));
            int x=dp(FeatureSettings.integer(context,P+"offset_x",0,-120,120)),limit=Math.max(0,(host.getWidth()-w)/2-dp(8));
            x=Math.max(-limit,Math.min(limit,x));
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)pill.getLayoutParams();
            int top=Math.max(0,(host.getHeight()-h)/2);
            if(lp.width!=w||lp.height!=h||lp.topMargin!=top){lp.width=w;lp.height=h;lp.topMargin=top;pill.setLayoutParams(lp);}
            pill.setTranslationX(x);pill.icon=icon;pill.playing=playing;pill.kind=activity;pill.battery=battery;
        }
        void showPill(){
            if(popup!=null)return;
            if(pill.getVisibility()!=View.VISIBLE){
                pill.animate().cancel();pill.setAlpha(0f);pill.setScaleX(.88f);pill.setScaleY(.88f);pill.setVisibility(View.VISIBLE);
                pill.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(180).start();
            }
        }
        boolean touch(MotionEvent event){
            if(replaying)return false;
            if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
                cancelTouch();
                touching=enabled&&!screenOff&&!locked()&&pill.isShown()&&activity!=0&&event.getX()>=pill.getX()&&event.getX()<pill.getX()+pill.getWidth()
                        &&event.getY()>=pill.getY()&&event.getY()<pill.getY()+pill.getHeight();
                downX=event.getX();downY=event.getY();if(touching)downEvent=MotionEvent.obtain(event);
                if(touching)MAIN.postDelayed(longPress,ViewConfiguration.getLongPressTimeout());
            }
            if(!touching)return false;
            // Once a long press opened the panel this gesture belongs to it;
            // never turn its UP into an app launch or replay half a gesture.
            if(longPressed){
                if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL)cancelTouch();
                return true;
            }
            int slop=ViewConfiguration.get(context).getScaledTouchSlop();
            if(event.getActionMasked()==MotionEvent.ACTION_POINTER_DOWN||Math.abs(event.getX()-downX)>slop||Math.abs(event.getY()-downY)>slop){
                // The initial DOWN was held for a possible tap. Replay it once to
                // the native dispatcher, then let the original swipe continue.
                touching=false;replaying=true;
                boolean clickable=pill.isClickable(),longClickable=pill.isLongClickable();
                pill.setClickable(false);pill.setLongClickable(false);
                try{if(downEvent!=null)host.dispatchTouchEvent(downEvent);}
                finally{pill.setClickable(clickable);pill.setLongClickable(longClickable);replaying=false;cancelTouch();}
                return false;
            }
            if(event.getActionMasked()==MotionEvent.ACTION_UP){cancelTouch();if(enabled&&!closed&&!screenOff&&!locked()&&pill.isShown())pill.performClick();}
            if(event.getActionMasked()==MotionEvent.ACTION_CANCEL)cancelTouch();
            return true;
        }
        void cancelTouch(){MAIN.removeCallbacks(longPress);touching=false;longPressed=false;if(downEvent!=null){downEvent.recycle();downEvent=null;}}
        void performLongPress(){
            if(touching&&enabled&&!closed&&!screenOff&&!locked()&&pill.isShown()&&ownerUser>=0&&currentUser()==ownerUser){
                longPressed=true;pill.performLongClick();
            }
        }
        void openActivity(){
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||!pill.isShown())return;
            PendingIntent intent=null;
            try{
                if(activity==IslandActivityPolicy.NOTICE&&notice!=null)intent=notice.getNotification().contentIntent;
                else if(activity==IslandActivityPolicy.MUSIC&&media!=null)intent=media.getSessionActivity();
            }catch(RuntimeException ignored){}
            if(intent==null){expand();return;}
            openNotice(intent);dismiss();
            if(activity==IslandActivityPolicy.NOTICE){clearNotice();refresh();}
        }
        void expand(){
            if(closed||!enabled||screenOff||activity==0||locked()||power==null||!power.isInteractive()||!pill.isShown()
                    ||ownerUser<0||currentUser()!=ownerUser)return;if(popup!=null){dismiss();return;}
            try{expandContent();}catch(RuntimeException failure){dismiss();diagnostic("expand_failed:"+failure.getClass().getSimpleName());}
        }
        void expandContent(){
            LinearLayout panel=new LinearLayout(context);panel.setOrientation(LinearLayout.VERTICAL);panel.setPadding(dp(18),dp(18),dp(18),dp(12));
            GradientDrawable background=new GradientDrawable();background.setColor(Color.BLACK);background.setCornerRadius(dp(28));panel.setBackground(background);
            LinearLayout header=new LinearLayout(context);header.setGravity(Gravity.CENTER_VERTICAL);
            if(icon!=null){
                ImageView cover=new ImageView(context);cover.setImageDrawable(icon);cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
                GradientDrawable mask=new GradientDrawable();mask.setColor(Color.BLACK);mask.setCornerRadius(dp(10));cover.setBackground(mask);cover.setClipToOutline(true);
                LinearLayout.LayoutParams art=new LinearLayout.LayoutParams(dp(44),dp(44));art.rightMargin=dp(12);header.addView(cover,art);
            }
            LinearLayout copy=new LinearLayout(context);copy.setOrientation(LinearLayout.VERTICAL);
            TextView heading=text(title,16);heading.setTypeface(android.graphics.Typeface.create("sans-serif-medium",0));heading.setMaxLines(2);copy.addView(heading);
            if(!subtitle.isEmpty()){TextView detail=text(subtitle,13);detail.setTextColor(0xffaaaaaa);detail.setMaxLines(activity==IslandActivityPolicy.NOTICE?3:2);
                LinearLayout.LayoutParams detailParams=new LinearLayout.LayoutParams(-1,-2);detailParams.topMargin=dp(4);copy.addView(detail,detailParams);}
            header.addView(copy,new LinearLayout.LayoutParams(0,-2,1));panel.addView(header);
            if(activity==IslandActivityPolicy.MUSIC&&media!=null){
                final MediaController chosen=media;LinearLayout actions=new LinearLayout(context);
                PlaybackState state=chosen.getPlaybackState();long allowed=state==null?0:state.getActions();
                mediaAction(actions,"上一首",TransportButton.PREVIOUS,(allowed&PlaybackState.ACTION_SKIP_TO_PREVIOUS)!=0,()->chosen.getTransportControls().skipToPrevious());
                mediaAction(actions,playing?"暂停":"播放",playing?TransportButton.PAUSE:TransportButton.PLAY,(allowed&(playing?PlaybackState.ACTION_PAUSE:PlaybackState.ACTION_PLAY))!=0
                        ||(allowed&PlaybackState.ACTION_PLAY_PAUSE)!=0,()->{
                            PlaybackState latest=chosen.getPlaybackState();
                            if(latest!=null&&IslandActivityPolicy.mediaPlaying(latest.getState()))chosen.getTransportControls().pause();else chosen.getTransportControls().play();});
                mediaAction(actions,"下一首",TransportButton.NEXT,(allowed&PlaybackState.ACTION_SKIP_TO_NEXT)!=0,()->chosen.getTransportControls().skipToNext());
                LinearLayout.LayoutParams controls=new LinearLayout.LayoutParams(-1,dp(52));controls.topMargin=dp(12);panel.addView(actions,controls);
            }else if(activity==IslandActivityPolicy.NOTICE&&notice!=null){
                PendingIntent intent=notice.getNotification().contentIntent;
                if(intent!=null){LinearLayout actions=new LinearLayout(context);action(actions,"打开通知",true,()->{openNotice(intent);clearNotice();});panel.addView(actions);}
            }
            int width=Math.min(dp(320),host.getResources().getDisplayMetrics().widthPixels-dp(24));
            popup=new PopupWindow(panel,width,ViewGroup.LayoutParams.WRAP_CONTENT,true);popup.setBackgroundDrawable(background);
            popup.setOutsideTouchable(true);popup.setElevation(dp(8));popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NOT_NEEDED);
            popup.setIsLaidOutInScreen(true);popup.setIsClippedToScreen(true);
            popup.setOnDismissListener(()->{popup=null;MAIN.removeCallbacks(collapse);
                if(!closed&&enabled&&!screenOff&&!locked()&&activity!=IslandActivityPolicy.NONE)showPill();});
            popupContent=activity+"|"+title+"|"+subtitle+"|"+playing;
            try{
                int[] location=new int[2];pill.getLocationOnScreen(location);
                popup.showAtLocation(host,Gravity.TOP|Gravity.CENTER_HORIZONTAL,0,Math.max(dp(4),location[1]));
                pill.animate().cancel();pill.setVisibility(View.INVISIBLE);
                panel.setAlpha(0f);panel.setScaleX(.92f);panel.setScaleY(.92f);panel.setPivotY(0f);
                panel.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(200).start();
                MAIN.postDelayed(collapse,8000);
            }
            catch(RuntimeException error){dismiss();diagnostic("expand_failed:"+error.getClass().getSimpleName());}
        }
        TextView text(String value,int sp){TextView v=new TextView(context);v.setText(value);v.setTextColor(Color.WHITE);v.setTextSize(sp);v.setEllipsize(TextUtils.TruncateAt.END);return v;}
        void action(LinearLayout row,String label,boolean available,Runnable command){
            TextView button=text(label,14);button.setGravity(Gravity.CENTER);button.setMinHeight(dp(48));button.setEnabled(available);button.setAlpha(available?1f:.35f);
            button.setOnClickListener(v->runAction(command));
            row.addView(button,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
        }
        void mediaAction(LinearLayout row,String label,int glyph,boolean available,Runnable command){
            TransportButton button=new TransportButton(context,glyph);button.setContentDescription(label);button.setEnabled(available);button.setAlpha(available?1f:.3f);
            button.setOnClickListener(v->runAction(command));row.addView(button,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.MATCH_PARENT,1));
        }
        void runAction(Runnable command){
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||ownerUser<0||currentUser()!=ownerUser)return;
            try{command.run();}catch(RuntimeException ignored){}dismiss();MAIN.removeCallbacks(tick);MAIN.postDelayed(tick,150);
        }
        void openNotice(PendingIntent intent){
            openDiagnostic("clicked");
            try{
                if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||intent==null
                        ||ownerUser<0||currentUser()!=ownerUser){openDiagnostic("blocked");return;}
                // Like the native notification click path, explicitly grant the
                // sender's launch privileges for this user action. SystemUI has
                // a status-bar window, not necessarily a foreground Activity.
                ActivityOptions options=ActivityOptions.makeBasic();
                options.setPendingIntentBackgroundActivityStartMode(Build.VERSION.SDK_INT>=36
                        ?ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
                intent.send(context,0,null,null,null,null,options.toBundle());
                // send() can return even if the platform rejects a launch. This
                // diagnostic records submission, not a verified foreground app.
                openDiagnostic("submitted");
            }catch(PendingIntent.CanceledException failure){openDiagnostic("canceled");}
            catch(RuntimeException failure){openDiagnostic("failed:"+failure.getClass().getSimpleName());}
        }
        void openDiagnostic(String state){FeatureSettings.diagnostic(context,"ls_augment_island_open",state+";at="+SystemClock.elapsedRealtime());}
        int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
        void diagnostic(String value){if(!lastState.equals(value)){lastState=value;FeatureSettings.diagnostic(context,"ls_augment_island_state",value);}}
        void dismiss(){MAIN.removeCallbacks(collapse);if(popup!=null){PopupWindow old=popup;popup=null;try{old.dismiss();}catch(RuntimeException ignored){}}}
        void hide(){dismiss();pill.animate().cancel();pill.playing=false;pill.icon=null;title="";subtitle="";icon=null;popupContent="";
            pill.setContentDescription("灵动岛");pill.setVisibility(View.GONE);cancelTouch();diagnostic(enabled?"idle":"disabled");}
        void stopMediaListening(){
            if(listening&&sessions!=null)try{sessions.removeOnActiveSessionsChangedListener(sessionListener);}catch(RuntimeException ignored){}
            listening=false;
            for(MediaController c:controllers)try{c.unregisterCallback(mediaCallback);}catch(RuntimeException ignored){}controllers.clear();media=null;clearNotice();
            mediaActivities.clear();noticeHistory.clear();cachedArt=null;cachedArtDrawable=null;cachedAppIcon=null;cachedIconPackage="";
        }
        void stopListening(){
            stopMediaListening();
            chargeActivity.reset();
            if(receiving)try{context.unregisterReceiver(receiver);}catch(RuntimeException ignored){}receiving=false;
        }
        void close(){closed=true;MAIN.removeCallbacks(tick);pill.animate().cancel();FeatureSettings.removeSnapshotListener(config);stopListening();cancelTouch();dismiss();
            pill.visibilityChanged=null;host.removeOnLayoutChangeListener(hostLayout);
            if(host.getViewTreeObserver().isAlive())host.getViewTreeObserver().removeOnPreDrawListener(hostVisibility);host.removeView(pill);}
    }

    /** Monochrome transport symbols share one geometry and full 48dp hit areas. */
    private static final class TransportButton extends View {
        static final int PREVIOUS=0,PLAY=1,PAUSE=2,NEXT=3;
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final android.graphics.Path path=new android.graphics.Path();final int glyph;
        TransportButton(Context context,int glyph){super(context);this.glyph=glyph;setClickable(true);setFocusable(true);}
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);float d=getResources().getDisplayMetrics().density,cx=getWidth()/2f,cy=getHeight()/2f;
            if(glyph==PLAY||glyph==PAUSE){paint.setColor(isPressed()?0xff393939:0xff222222);canvas.drawCircle(cx,cy,24*d,paint);}
            paint.setColor(Color.WHITE);
            if(glyph==PAUSE){canvas.drawRoundRect(cx-7*d,cy-9*d,cx-2*d,cy+9*d,d,d,paint);canvas.drawRoundRect(cx+2*d,cy-9*d,cx+7*d,cy+9*d,d,d,paint);}
            else if(glyph==PLAY)triangle(canvas,cx-5*d,cy,13*d,9*d);
            else{
                boolean next=glyph==NEXT;float direction=next?1:-1;
                triangle(canvas,cx-direction*9*d,cy,direction*9*d,8*d);triangle(canvas,cx,cy,direction*9*d,8*d);
                canvas.drawRect(cx+(next?9:-11)*d,cy-8*d,cx+(next?11:-9)*d,cy+8*d,paint);
            }
        }
        void triangle(Canvas canvas,float x,float y,float width,float halfHeight){path.reset();path.moveTo(x,y-halfHeight);path.lineTo(x+width,y);path.lineTo(x,y+halfHeight);path.close();canvas.drawPath(path,paint);}
    }

    private static final class Capsule extends View {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);final RectF rect=new RectF();
        final android.graphics.Path shape=new android.graphics.Path();
        Drawable icon;boolean playing;int kind,battery;Runnable visibilityChanged;
        Capsule(Context context){super(context);setClickable(true);setFocusable(true);}
        @Override protected void onVisibilityChanged(View changedView,int visibility){
            super.onVisibilityChanged(changedView,visibility);
            if(changedView!=this&&visibilityChanged!=null)visibilityChanged.run();
        }
        @Override protected void onWindowVisibilityChanged(int visibility){
            super.onWindowVisibilityChanged(visibility);if(visibilityChanged!=null)visibilityChanged.run();
        }
        float dp(float value){return value*getResources().getDisplayMetrics().density;}
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);float h=getHeight(),w=getWidth();if(h<=0||w<=0)return;
            paint.setColor(Color.BLACK);rect.set(0,0,w,h);canvas.drawRoundRect(rect,h/2,h/2,paint);
            float size=Math.min(dp(22),h-dp(8)),left=dp(9),top=(h-size)/2;
            if(icon!=null){canvas.save();android.graphics.Path clip=new android.graphics.Path();clip.addRoundRect(left,top,left+size,top+size,dp(5),dp(5),android.graphics.Path.Direction.CW);canvas.clipPath(clip);
                icon.setBounds((int)left,(int)top,(int)(left+size),(int)(top+size));icon.draw(canvas);canvas.restore();
            }else if(kind==IslandActivityPolicy.CHARGING){
                paint.setColor(0xff91edb2);float cx=left+size/2,cy=h/2;
                shape.reset();shape.moveTo(cx+dp(2),cy-dp(9));shape.lineTo(cx-dp(6),cy+dp(1));shape.lineTo(cx-dp(1),cy+dp(1));
                shape.lineTo(cx-dp(2),cy+dp(9));shape.lineTo(cx+dp(6),cy-dp(1));shape.lineTo(cx+dp(1),cy-dp(1));shape.close();canvas.drawPath(shape,paint);
            }else{
                paint.setColor(0xffeeeeee);canvas.drawCircle(left+size/2,h/2,dp(6),paint);
                paint.setColor(Color.BLACK);canvas.drawCircle(left+size/2,h/2,dp(2),paint);
            }
            paint.setColor(0xffc7eed7);
            if(kind==IslandActivityPolicy.MUSIC){
                long t=SystemClock.uptimeMillis();for(int i=0;i<4;i++){float bar=playing?(float)(.3+.7*Math.abs(Math.sin(t/340.0+i*.9))):.2f;
                    float bh=Math.min(dp(14),h-dp(10))*bar,x=w-dp(28)+dp(i*4);rect.set(x,(h-bh)/2,x+dp(2),(h+bh)/2);canvas.drawRoundRect(rect,dp(1),dp(1),paint);}
                if(playing&&isShown())postInvalidateDelayed(80);
            }else{
                paint.setColor(kind==IslandActivityPolicy.CHARGING?0xff91edb2:0xffeeeeee);
                paint.setTextSize(Math.min(12*getResources().getDisplayMetrics().scaledDensity,h-dp(10)));paint.setTypeface(android.graphics.Typeface.create("sans-serif-medium",0));
                String label=kind==IslandActivityPolicy.CHARGING?battery+"%":"通知";
                canvas.drawText(label,w-dp(11)-paint.measureText(label),h/2-(paint.ascent()+paint.descent())/2,paint);
            }
        }
    }
}
