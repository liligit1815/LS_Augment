package ls.augment.com.hook;

import android.app.ActivityOptions;
import android.app.KeyguardManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
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
import android.view.Display;
import android.view.View;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.IslandActivityPolicy;
import ls.augment.com.IslandDownloadPolicy;
import ls.augment.com.IslandNoticeRules;
import ls.augment.com.IslandNoticeBlacklist;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Duo event policy presented by the firmware native island engine. */
final class DynamicIslandHook {
    private static final String PHONE="com.android.systemui.statusbar.phone.PhoneStatusBarView";
    private static final String LISTENER="com.android.systemui.statusbar.NotificationListener";
    private static final String P=SystemUiOptions.PREFIX+"island_";
    private static final String USER_SWITCHED="android.intent.action.USER_SWITCHED";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private static volatile java.lang.ref.WeakReference<NotificationListenerService> notificationListener=new java.lang.ref.WeakReference<>(null);
    private static final Runnable TASK_CHANGED=()->{
        for(State state:new ArrayList<>(STATES.values()))if(!state.closed){
            if(state.enabled)state.requestRefresh();
            state.nativeHost.nativeForegroundChanged();
        }
    };

    private static void taskChanged(){
        // Both native listeners can report the same switch from Binder threads.
        // Coalesce on the UI thread; task changes do not depend on media callbacks.
        MAIN.removeCallbacks(TASK_CHANGED);MAIN.post(TASK_CHANGED);
    }

    static int install(AugmentModule module,ClassLoader loader) {
        int taskHooks=NativeIslandHost.install(module,loader)+NativeIslandSettingsHook.install(module,loader)
                +IslandStatusBarAvoidanceHook.install(module,loader)+MagicIslandScenes.install(module,loader)
                +IslandHeadsUpBridge.install(module,loader)+IslandLiveScenes.install(module,loader);
        for(String listener:new String[]{"com.android.systemui.shared.system.TaskStackChangeListeners$Impl",
                "com.android.wm.shell.common.TaskStackListenerImpl"}){
            for(String method:new String[]{"onTaskStackChanged","onTaskMovedToFront","onTaskDisplayChanged",
                    "onActivityPinned","onActivityUnpinned"})
                taskHooks+=hookNamed(module,loader,"island",listener,method,-1,null,(owner,args,result)->{
                    taskChanged();return PASS;
                });
        }
        // Focus changes inside split-screen may have no stack/front callback.
        // The native listeners inherit this method from the framework class.
        taskHooks+=hookNamed(module,loader,"island","android.app.TaskStackListener","onTaskFocusChanged",2,null,(owner,args,result)->{
            taskChanged();return PASS;
        });
        int count=hookNamed(module,loader,"island",PHONE,"onAttachedToWindow",0,null,(owner,args,result)->{
            if(owner instanceof View)IslandStatusBarAvoidanceHook.attach(((View)owner).getContext());
            if(owner instanceof FrameLayout && !STATES.containsKey(owner)){
                State state=new State((FrameLayout)owner);STATES.put((View)owner,state);state.start();
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",PHONE,"onDetachedFromWindow",0,null,(owner,args,result)->{
            State state=STATES.remove(owner);if(state!=null)state.close();return PASS;
        });
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationPosted",2,null,(owner,args,result)->{
            if(owner instanceof NotificationListenerService)notificationListener=new java.lang.ref.WeakReference<>((NotificationListenerService)owner);
            if(args[0] instanceof StatusBarNotification){
                StatusBarNotification sbn=(StatusBarNotification)args[0];
                NotificationListenerService.RankingMap rankings=(NotificationListenerService.RankingMap)args[1];
                MAIN.post(()->{IslandLiveScenes.notificationsChanged();for(State state:new ArrayList<>(STATES.values()))try{state.posted(sbn,rankings);}
                    catch(RuntimeException failure){state.downloads.removed(sbn);state.requestRefresh();state.withdrawNotice(sbn.getKey());state.diagnostic("notice_unavailable:"+failure.getClass().getSimpleName());}});
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationRemoved",3,null,(owner,args,result)->{
            if(args[0] instanceof StatusBarNotification){StatusBarNotification removed=(StatusBarNotification)args[0];String key=removed.getKey();
                MAIN.post(()->{IslandLiveScenes.notificationsChanged();IslandHeadsUpBridge.removed(removed);for(State state:new ArrayList<>(STATES.values())){
                    state.downloads.removed(removed);state.requestRefresh();
                    if(state.downloads.activities.get(key)==null)state.announcedDownloads.remove(key);
                    if(state.notice!=null&&key.equals(state.notice.getKey())
                            &&(removed.getUid()!=state.notice.getUid()||removed.getPostTime()<state.notice.getPostTime()))continue;
                    if(key.equals(state.firstKey))state.cancelFirst();
                    state.noticeHistory.remove(key);state.withdrawNotice(key);
                }});
            }return PASS;
        });
        count+=hookNamed(module,loader,"island",LISTENER,"onNotificationRankingUpdate",1,null,(owner,args,result)->{
            if(args[0] instanceof NotificationListenerService.RankingMap){
                NotificationListenerService.RankingMap rankings=(NotificationListenerService.RankingMap)args[0];
                MAIN.post(()->{IslandLiveScenes.notificationsChanged();for(State state:new ArrayList<>(STATES.values())){
                    state.downloadSnapshot();state.downloads.ranking(rankings);state.requestRefresh();
                    if(state.notice!=null&&!state.allowedRanking(state.notice.getKey(),rankings)){state.clearNotice();state.refresh();}
                }});
            }return PASS;
        });
        count+=hookListenerLifecycle(module,loader,"onListenerConnected",owner->{
            if(owner instanceof NotificationListenerService){notificationListener=new java.lang.ref.WeakReference<>((NotificationListenerService)owner);
                MAIN.post(()->{IslandLiveScenes.notificationsChanged();for(State state:new ArrayList<>(STATES.values())){state.restoreDownloadSnapshot();state.requestRefresh();}});}
        });
        count+=hookListenerLifecycle(module,loader,"onListenerDisconnected",owner->{
            MAIN.post(()->{if(notificationListener.get()!=owner)return;notificationListener.clear();IslandHeadsUpBridge.clear();IslandLiveScenes.notificationsChanged();
                for(State state:new ArrayList<>(STATES.values())){state.downloads.clear();state.clearNotice();state.requestRefresh();}});
        });
        module.logFeatureInfo("DYNAMIC_ISLAND_READY hooks="+count+",taskHooks="+taskHooks);
        return count+taskHooks;
    }
    static boolean canPrepareHeadsUp(StatusBarNotification source,NotificationListenerService.Ranking ranking){
        for(State state:new ArrayList<>(STATES.values()))if(state.canPrepareHeadsUp(source,ranking))return true;
        return false;
    }
    static NotificationListenerService notificationSource(){return notificationListener.get();}
    static boolean prepareHeadsUp(StatusBarNotification source,NotificationListenerService.Ranking ranking){
        for(State state:new ArrayList<>(STATES.values()))if(state.canPrepareHeadsUp(source,ranking)){
            if(state.downloads.canPrepareHeadsUp(source,ranking)){
                NotificationListenerService listener=notificationListener.get();if(listener==null)return false;
                state.downloads.posted(source,listener.getCurrentRanking());state.refresh();
                return state.activity==IslandActivityPolicy.DOWNLOAD&&state.download!=null&&IslandHeadsUpBridge.same(state.download.source,source);
            }
            state.notice(source,true,true);return IslandHeadsUpBridge.same(state.notice,source);
        }
        return false;
    }
    static boolean confirmHeadsUp(StatusBarNotification source,Runnable drawn){
        for(State state:new ArrayList<>(STATES.values()))if(!state.closed&&state.enabled&&!state.locked()
                &&state.hostVisible()&&(state.activity==IslandActivityPolicy.NOTICE&&IslandHeadsUpBridge.same(state.notice,source)
                    ||state.activity==IslandActivityPolicy.DOWNLOAD&&state.download!=null&&IslandHeadsUpBridge.same(state.download.source,source)))
            return state.nativeHost.confirmedFrame(IslandHeadsUpBridge.revision(source),drawn);
        return false;
    }
    static void abortHeadsUp(StatusBarNotification source){
        for(State state:new ArrayList<>(STATES.values())){
            if(IslandHeadsUpBridge.same(state.notice,source)){
                state.nativeHost.abortPresentation();state.clearNotice();state.cancelFirst();state.refresh();
            }
            IslandDownloadPolicy.Entry<StatusBarNotification> entry=state.downloads.activities.get(source.getKey());
            if(entry!=null&&IslandHeadsUpBridge.same(entry.source,source)){
                if(state.activity==IslandActivityPolicy.DOWNLOAD&&state.download==entry){
                    state.nativeHost.abortPresentation();state.download=null;state.cancelFirst();
                }
                state.downloads.removed(source);state.refresh();
            }
        }
    }
    private static int hookListenerLifecycle(AugmentModule module,ClassLoader loader,String name,java.util.function.Consumer<Object> callback){
        try{
            Class<?> type=Class.forName(LISTENER,false,loader);
            if(!NotificationListenerService.class.isAssignableFrom(type))throw new NoSuchMethodException("listener_type");
            // getMethod resolves inherited lifecycle callbacks as well as OEM overrides.
            java.lang.reflect.Method method=type.getMethod(name);
            if(method.getReturnType()!=void.class||java.lang.reflect.Modifier.isStatic(method.getModifiers())
                    ||java.lang.reflect.Modifier.isAbstract(method.getModifiers()))throw new NoSuchMethodException(name+":signature");
            module.registerFeatureHook(module.prepareFeatureHook(method,"island.download."+name,false).intercept(chain->{
                Object result=chain.proceed();if(type.isInstance(chain.getThisObject()))callback.accept(chain.getThisObject());return result;
            }));return 1;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_DOWNLOAD_LISTENER_UNAVAILABLE "+name+":"+missing.getClass().getSimpleName());return 0;}
    }

    private static final class State {
        final FrameLayout host;final Context context;final NativeIslandHost nativeHost;
        final IslandDownloadSource downloads;
        IslandDownloadPolicy.Entry<StatusBarNotification> download;
        final MediaSessionManager sessions;final KeyguardManager keyguard;final PowerManager power;
        final Runnable config=this::configure,tick=this::refresh;
        final Runnable firstExpansion=this::expandFirst;
        String firstKey;
        int firstKind,entryWaits;
        final java.util.Set<String> announcedDownloads=new java.util.HashSet<>();
        final View.OnLayoutChangeListener hostLayout=(view,l,t,r,b,oldL,oldT,oldR,oldB)->{
            if(l!=oldL||t!=oldT||r!=oldR||b!=oldB)requestRefresh();
        };
        final android.view.ViewTreeObserver.OnPreDrawListener hostVisibility=this::observeHostVisibility;
        final List<MediaController> controllers=new ArrayList<>();
        final Map<MediaSession.Token,IslandActivityPolicy.MediaActivity> mediaActivities=new HashMap<>();
        final Map<String,Integer> noticeHistory=new LinkedHashMap<>();
        IslandNoticeRules noticeRules=IslandNoticeRules.parse("");
        IslandNoticeBlacklist noticeBlacklist=IslandNoticeBlacklist.parse("");
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
                    downloads.clear();download=null;
                    clearNotice();chargeActivity.clear();mediaActivities.clear();dismiss();
                    if(USER_SWITCHED.equals(intent.getAction())){noticeHistory.clear();stopMediaListening();listenMedia();}
                }
                if(Intent.ACTION_USER_PRESENT.equals(intent.getAction())||Intent.ACTION_SCREEN_ON.equals(intent.getAction())
                        ||USER_SWITCHED.equals(intent.getAction()))restoreDownloadSnapshot();
                refresh();
            }
        };
        boolean enabled,listening,receiving,closed,charging,screenOff,observedHostVisible;
        int battery,activity,ownerUser=-1;
        long noticeUntil;String lastState="";
        StatusBarNotification notice;MediaController media;
        Bitmap cachedArt;Drawable cachedArtDrawable,cachedAppIcon;String cachedIconPackage="",popupContent="";
        MediaSession.Token artworkSession;long artworkMissingSince=-1;boolean holdingArtwork;
        String title="",subtitle="";Drawable icon;boolean playing;
        State(FrameLayout host){this.host=host;context=host.getContext();
            downloads=new IslandDownloadSource(context);
            nativeHost=new NativeIslandHost(host,this::expand,this::openActivity,this::runAction);
            nativeHost.onPanelChanged(this::requestRefresh);
            sessions=context.getSystemService(MediaSessionManager.class);keyguard=context.getSystemService(KeyguardManager.class);
            power=context.getSystemService(PowerManager.class);
            host.addOnLayoutChangeListener(hostLayout);
            host.getViewTreeObserver().addOnPreDrawListener(hostVisibility);
        }
        void requestRefresh(){if(!closed){MAIN.removeCallbacks(tick);MAIN.post(tick);}}
        boolean hostVisible(){
            if(!host.isAttachedToWindow()||!host.isShown()||host.getWindowVisibility()!=View.VISIBLE)return false;
            float alpha=1f;
            for(View current=host;current!=null;){
                // The native island fades this bar while its panel is open.
                // That presentation transition is not a fullscreen/hidden-bar event.
                alpha*=current==host&&nativeHost.ownsStatusBarFade()?1f:current.getAlpha();if(alpha<=.01f)return false;
                android.view.ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;
            }
            return true;
        }
        boolean observeHostVisibility(){
            // OEM fullscreen/root fades emit no visibility callback. Hiding status
            // content leaves this root untouched and must not change island state.
            // Compare only view properties;
            // unchanged frames do not query sessions/users or schedule any work.
            boolean visible=hostVisible();
            if(visible!=observedHostVisible){observedHostVisible=visible;requestRefresh();}
            return true;
        }
        void start(){NativeIslandSettingsHook.attach(context);FeatureSettings.addSnapshotListener(context,config);configure();}
        boolean option(String suffix){
            if (("music".equals(suffix)||"charging".equals(suffix))
                    && !FeatureSettings.enabled(context,ls.augment.com.SystemUiOptions.ISLAND)) return false;
            return FeatureSettings.integer(context,P+suffix,1,0,1)!=0;
        }
        boolean locked(){return keyguard!=null&&keyguard.isKeyguardLocked();}
        void configure(){
            if(closed)return;cancelFirst();boolean next=FeatureSettings.enabled(context,SystemUiOptions.ISLAND);
            noticeRules=IslandNoticeRules.parse(FeatureSettings.text(context,IslandNoticeRules.KEY,""));
            noticeBlacklist=IslandNoticeBlacklist.parse(FeatureSettings.text(context,IslandNoticeBlacklist.KEY,""));
            if(next!=enabled){
                enabled=next;if(enabled)listen();else {stopListening();nativeHost.release();}
            }
            nativeHost.selectNative(next);
            if(!option("notifications")||notice!=null&&noticeMode(notice)==IslandNoticeRules.OFF)clearNotice();
            if(!option("charging"))chargeActivity.clear();
            if(!option("music"))mediaActivities.clear();
            downloads.configure();restoreDownloadSnapshot();
            dismiss();refresh();
        }
        void downloadSnapshot(){
            downloads.user(currentUser());
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()){downloads.clear();return;}
            NotificationListenerService listener=notificationListener.get();
            try{
                if(listener==null){downloads.clear();return;}
                downloads.reconcile(listener.getActiveNotifications(),listener.getCurrentRanking());
            }catch(RuntimeException unavailable){downloads.clear();diagnostic("download_snapshot_unavailable:"+unavailable.getClass().getSimpleName());}
        }
        void restoreDownloadSnapshot(){
            downloadSnapshot();announcedDownloads.clear();announcedDownloads.addAll(downloads.activities.keys());
        }
        void posted(StatusBarNotification sbn,NotificationListenerService.RankingMap rankings){
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive())return;
            downloads.user(currentUser());
            String key=sbn.getKey();
            if(downloads.posted(sbn,rankings)){
                withdrawNotice(key);requestRefresh();
                if(downloads.activities.get(key)==null)announcedDownloads.remove(key);
                else if(announcedDownloads.add(key))scheduleFirst(key,IslandActivityPolicy.DOWNLOAD);
                announcedDownloads.retainAll(downloads.activities.keys());
                return;
            }
            NotificationListenerService.Ranking ranking=new NotificationListenerService.Ranking();
            if(rankings!=null&&rankings.getRanking(key,ranking)&&IslandHeadsUpBridge.listenerMayShow(sbn,ranking))notice(sbn,rankings);
            requestRefresh();
        }
        void scheduleFirst(String key,int kind){
            int mode=kind==IslandActivityPolicy.NOTICE&&notice!=null?noticeMode(notice):IslandNoticeRules.INHERIT;
            boolean expand=mode==IslandNoticeRules.EXPAND||mode==IslandNoticeRules.INHERIT
                    &&FeatureSettings.enabled(context,SystemUiOptions.ISLAND_FIRST_EXPAND);
            if(!expand||!hostVisible())return;
            cancelFirst();firstKey=key;firstKind=kind;entryWaits=0;
            firstDiagnostic("new:"+kind);
            MAIN.postDelayed(firstExpansion,350);
        }
        void expandFirst(){
            String key=firstKey;
            if(key==null||activity!=firstKind||!enabled||closed||screenOff||locked()||!hostVisible()
                    ||ownerUser!=currentUser()||nativeHost.expanded()){cancelFirst();return;}
            String current=activity==IslandActivityPolicy.DOWNLOAD&&download!=null?download.key:notice==null?null:notice.getKey();
            if(!key.equals(current)){cancelFirst();return;}
            if(!nativeHost.readyForFirstExpansion()){
                if(++entryWaits<=10)MAIN.postDelayed(firstExpansion,120);
                else {firstDiagnostic("entry_busy:"+firstKind);cancelFirst();}
                return;
            }
            cancelFirst();nativeHost.expand();firstDiagnostic("requested:"+firstKind);
        }
        void cancelFirst(){MAIN.removeCallbacks(firstExpansion);firstKey=null;}
        void firstDiagnostic(String value){FeatureSettings.diagnostic(context,"ls_augment_island_first_expansion",value);}
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
            if(controllers.isEmpty())return null;
            String foreground=foregroundPackage();
            MediaController active=null,fallback=null;long now=SystemClock.elapsedRealtime();
            for(MediaController controller:controllers)try{
                PlaybackState state=controller.getPlaybackState();
                IslandActivityPolicy.MediaActivity lease=mediaActivities.get(controller.getSessionToken());
                if(lease==null){lease=new IslandActivityPolicy.MediaActivity();mediaActivities.put(controller.getSessionToken(),lease);}
                boolean showing=lease.update(state==null?0:state.getState(),now);
                // Videos also publish MediaSessions. Keep the lease up to date
                // while its own app is foreground, but only offer background
                // media on the island. Unknown foreground state fails closed.
                if(!showing||foreground==null||controller.getPackageName().equals(foreground))continue;
                if(state!=null&&IslandActivityPolicy.mediaPlaying(state.getState())){
                    if(active==null||sameSession(controller,media))active=controller;
                }else if(fallback==null||sameSession(controller,media))fallback=controller;
            }catch(RuntimeException ignored){}
            return active!=null?active:fallback;
        }

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        String foregroundPackage(){
            Display display=host.getDisplay();if(display==null)return null;
            try{
                Object service=Class.forName("android.app.ActivityTaskManager").getMethod("getService").invoke(null);
                // Request the focused leaf task on this status bar's display;
                // a focused root task can be a split-screen container.
                Object tasks=call(service,"getTasks",1,false,false,display.getDisplayId());
                if(!(tasks instanceof List)||((List<?>)tasks).isEmpty())return null;
                Object task=((List<?>)tasks).get(0);
                Object component=field(task,"topActivity"),taskDisplay=field(task,"displayId"),taskUser=field(task,"userId");
                if(!(component instanceof ComponentName)||!(taskDisplay instanceof Integer)||!(taskUser instanceof Integer)
                        ||(Integer)taskDisplay!=display.getDisplayId())return null;
                // A profile/clone with the same package is a different source.
                return (Integer)taskUser==ownerUser?((ComponentName)component).getPackageName():"";
            }catch(ReflectiveOperationException|RuntimeException unavailable){return null;}
        }
        boolean sameSession(MediaController first,MediaController second){return first!=null&&second!=null&&first.getSessionToken().equals(second.getSessionToken());}
        int noticeMode(StatusBarNotification source){
            if(noticeBlacklist==null||noticeBlacklist.contains(ownerUser,source.getPackageName()))return IslandNoticeRules.OFF;
            return noticeRules==null?IslandNoticeRules.OFF:noticeRules.resolve(ownerUser,source.getPackageName(),source.getNotification().getChannelId());
        }
        void notice(StatusBarNotification sbn,NotificationListenerService.RankingMap map){
            notice(sbn,allowedRanking(sbn.getKey(),map));
        }
        boolean canPrepareHeadsUp(StatusBarNotification sbn,NotificationListenerService.Ranking ranking){
            if(closed||!enabled||screenOff||locked()||!hostVisible()||power==null||!power.isInteractive()
                    ||ownerUser<0||ownerUser!=currentUser()||!rankingAllowed(ranking))return false;
            if(downloads.canPrepareHeadsUp(sbn,ranking))return !nativeHost.holdsActivity()
                    ||activity==IslandActivityPolicy.DOWNLOAD&&download!=null&&IslandHeadsUpBridge.same(download.source,sbn);
            if(!option("notifications")||noticeMode(sbn)==IslandNoticeRules.OFF
                    ||nativeHost.holdsActivity()&&!IslandHeadsUpBridge.sameIdentity(notice,sbn))return false;
            Notification n=sbn.getNotification();
            return ownerUser>=0&&(sbn.getUserId()==ownerUser||sbn.getUserId()==-1)
                    &&n.visibility!=Notification.VISIBILITY_SECRET&&n.fullScreenIntent==null
                    &&(n.flags&(Notification.FLAG_GROUP_SUMMARY|Notification.FLAG_ONGOING_EVENT))==0
                    &&n.extras!=null&&!n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION)
                    &&(!TextUtils.isEmpty(n.extras.getCharSequence(Notification.EXTRA_TITLE))
                        ||!TextUtils.isEmpty(n.extras.getCharSequence(Notification.EXTRA_TEXT)));
        }
        void notice(StatusBarNotification sbn,boolean rankingPermits){
            notice(sbn,rankingPermits,false);
        }
        void notice(StatusBarNotification sbn,boolean rankingPermits,boolean nativeAlert){
            if(closed||!enabled||screenOff||!option("notifications")||locked()||power==null||!power.isInteractive())return;
            Notification n=sbn.getNotification();
            // No work-profile/other-user content, group summaries, silent items,
            // secret notifications or media duplicates. Never log message contents.
            int user=currentUser();
            if(user<0||(sbn.getUserId()!=user&&sbn.getUserId()!=-1)||n.visibility==Notification.VISIBILITY_SECRET
                    ||(n.flags&(Notification.FLAG_GROUP_SUMMARY|Notification.FLAG_ONGOING_EVENT))!=0
                    ||n.extras==null||n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION)
                    ||noticeMode(sbn)==IslandNoticeRules.OFF||!rankingPermits){withdrawNotice(sbn.getKey());return;}
            CharSequence text=n.extras.getCharSequence(Notification.EXTRA_TEXT),heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
            if(TextUtils.isEmpty(text)&&TextUtils.isEmpty(heading)){withdrawNotice(sbn.getKey());return;}
            // Keep a bounded, content-free fingerprint after expiration: a
            // repeated post or ONLY_ALERT_ONCE update must not pin the island.
            int fingerprint=31*String.valueOf(heading).hashCode()+String.valueOf(text).hashCode();
            Integer previous=noticeHistory.get(sbn.getKey());
            // The native heads-up decision already authorized a new reminder. An old,
            // expired content fingerprint must not turn that authorized alert into a banner.
            // Passive listener updates retain the original bounded deduplication policy.
            if(!nativeAlert&&previous!=null&&(previous==fingerprint||(n.flags&Notification.FLAG_ONLY_ALERT_ONCE)!=0)){
                if(notice!=null&&notice.getKey().equals(sbn.getKey())&&sbn.getPostTime()>=notice.getPostTime()){
                    notice=sbn;noticeHistory.put(sbn.getKey(),fingerprint);
                }
                return;
            }
            noticeHistory.put(sbn.getKey(),fingerprint);
            if(noticeHistory.size()>64)noticeHistory.remove(noticeHistory.keySet().iterator().next());
            boolean replacing=notice!=null&&!notice.getKey().equals(sbn.getKey());
            notice=sbn;noticeUntil=SystemClock.elapsedRealtime()+FeatureSettings.integer(context,P+"notice_seconds",6,3,15)*1000L;
            if(replacing)dismiss();
            refresh();
            if(previous==null)scheduleFirst(sbn.getKey(),IslandActivityPolicy.NOTICE);
        }
        boolean allowedRanking(String key,NotificationListenerService.RankingMap map){
            NotificationListenerService.Ranking ranking=new NotificationListenerService.Ranking();
            return map!=null&&map.getRanking(key,ranking)&&rankingAllowed(ranking);
        }
        boolean rankingAllowed(NotificationListenerService.Ranking ranking){
            return ranking!=null&&ranking.getImportance()>=NotificationManager.IMPORTANCE_DEFAULT
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
                downloads.clear();download=null;
                clearNotice();chargeActivity.clear();mediaActivities.clear();activity=IslandActivityPolicy.NONE;hide();return;
            }
            if(ownerUser<0||ownerUser!=currentUser()){
                downloads.clear();download=null;
                clearNotice();chargeActivity.clear();mediaActivities.clear();activity=IslandActivityPolicy.NONE;hide();return;
            }
            long now=SystemClock.elapsedRealtime();
            boolean noticePanel=activity==IslandActivityPolicy.NOTICE&&nativeHost.holdsActivity();
            if(now>=noticeUntil&&!noticePanel)clearNotice();
            MediaController selected=option("music")&&!nativeHost.managesNativeScenes()?selectMedia():null;
            if(media!=null&&!sameSession(media,selected))dismiss();
            media=selected;
            boolean visible=hostVisible();
            IslandDownloadPolicy.Entry<StatusBarNotification> selectedDownload=downloads.activities.choose(download==null?null:download.key);
            boolean downloadChanged=download!=null&&(selectedDownload==null||!download.key.equals(selectedDownload.key));
            download=selectedDownload;
            int next=IslandActivityPolicy.chooseWithDownload(enabled,visible,locked(),now,media!=null,notice!=null,noticePanel?Long.MAX_VALUE:noticeUntil,
                    option("charging")&&charging&&!nativeHost.managesNativeScenes(),chargeActivity.expiresAt(),download!=null);
            // Withdrawal owns the close animation. Do not also request a separate collapse.
            if(next!=IslandActivityPolicy.NONE&&(activity!=next||downloadChanged))dismiss();
            activity=next;
            if(next==IslandActivityPolicy.NONE)hide();else{
                updateContent();
                String compact=activity==IslandActivityPolicy.NOTICE?appLabel(notice.getPackageName()):title;
                boolean shown=activity==IslandActivityPolicy.DOWNLOAD
                        ?nativeHost.showDownload(download,icon,appLabel(download.source.getPackageName()),this::downloadAction)
                        :activity==IslandActivityPolicy.NOTICE?nativeHost.showNotice(notice,title,subtitle,compact,icon,this::noticeAction)
                        :nativeHost.show(activity,title,subtitle,compact,icon,playing,battery,media);
                if(!shown){diagnostic("native_unavailable");return;}
                diagnostic("activity="+next+",playing="+playing);
            }
            long deadline=0;
            if(holdingArtwork&&artworkMissingSince>=0&&now<artworkMissingSince+1500)deadline=artworkMissingSince+1500;
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
                if(!media.getSessionToken().equals(artworkSession)){
                    artworkSession=media.getSessionToken();cachedArt=null;cachedArtDrawable=null;artworkMissingSince=-1;
                }
                holdingArtwork=false;
                MediaMetadata metadata=media.getMetadata();PlaybackState state=media.getPlaybackState();
                playing=state!=null&&IslandActivityPolicy.mediaPlaying(state.getState());
                if(metadata!=null){title=string(metadata.getText(MediaMetadata.METADATA_KEY_TITLE));subtitle=string(metadata.getText(MediaMetadata.METADATA_KEY_ARTIST));
                    Bitmap art=metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);if(art==null)art=metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
                    if(art!=null&&!art.isRecycled()){
                        if(art!=cachedArt){cachedArt=art;cachedArtDrawable=new android.graphics.drawable.BitmapDrawable(context.getResources(),art);}
                        icon=cachedArtDrawable;
                        artworkMissingSince=-1;
                    }
                }
                if(icon==null&&cachedArtDrawable!=null&&cachedArt!=null&&!cachedArt.isRecycled()){
                    long now=SystemClock.elapsedRealtime();if(artworkMissingSince<0)artworkMissingSince=now;
                    if(now-artworkMissingSince<1500){icon=cachedArtDrawable;holdingArtwork=true;}
                }
                if(title.isEmpty())title="音乐";if(icon==null)icon=appIcon(media.getPackageName());
            }else if(activity==IslandActivityPolicy.NOTICE&&notice!=null){
                Notification n=notice.getNotification();title=string(n.extras.getCharSequence(Notification.EXTRA_TITLE));
                subtitle=string(n.extras.getCharSequence(Notification.EXTRA_TEXT));icon=appIcon(notice.getPackageName());
                if(title.isEmpty())title=appLabel(notice.getPackageName());
            }else if(activity==IslandActivityPolicy.DOWNLOAD&&download!=null){
                title=download.indeterminate?"下载中":"下载 "+download.percent+"%";icon=appIcon(download.source.getPackageName());
            }else if(activity==IslandActivityPolicy.CHARGING){title="充电中";subtitle="电量 "+battery+"% · 已连接电源";}
        }
        Drawable appIcon(String pkg){
            if(pkg.equals(cachedIconPackage))return cachedAppIcon;
            cachedIconPackage=pkg;try{cachedAppIcon=context.getPackageManager().getApplicationIcon(pkg);}catch(Exception ignored){cachedAppIcon=null;}
            return cachedAppIcon;
        }
        String appLabel(String pkg){try{return context.getPackageManager().getApplicationLabel(context.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception ignored){return "新通知";}}
        String string(CharSequence value){return value==null?"":value.toString();}
        void openActivity(){
            cancelFirst();
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||!nativeHost.visible())return;
            PendingIntent intent=null;
            try{
                if(activity==IslandActivityPolicy.NOTICE&&notice!=null)intent=notice.getNotification().contentIntent;
                else if(activity==IslandActivityPolicy.DOWNLOAD&&download!=null)intent=download.source.getNotification().contentIntent;
                else if(activity==IslandActivityPolicy.MUSIC&&media!=null)intent=media.getSessionActivity();
            }catch(RuntimeException ignored){}
            if(intent==null){expand();return;}
            if(activity==IslandActivityPolicy.DOWNLOAD){downloadAction(download,intent);dismiss();return;}
            if(activity==IslandActivityPolicy.NOTICE){
                if(!noticeAction(notice,intent))return;
            }else if(!openNotice(intent))return;
            dismiss();
            if(activity==IslandActivityPolicy.NOTICE){clearNotice();refresh();}
        }
        void expand(){
            cancelFirst();
            openDiagnostic("long_pressed;visible="+nativeHost.visible()+";activity="+activity+";locked="+locked());
            if(closed||!enabled||screenOff||activity==0||locked()||power==null||!power.isInteractive()||!nativeHost.visible()
                    ||ownerUser<0||currentUser()!=ownerUser)return;
            if(nativeHost.expanded()){dismiss();return;}
            nativeHost.expand();
        }
        void runAction(Runnable command){
            if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||ownerUser<0||currentUser()!=ownerUser)return;
            try{command.run();}catch(RuntimeException ignored){}
            // Playback callbacks update the existing panel. A media control is not a request to close it.
            nativeHost.panelActivity();
            MAIN.removeCallbacks(tick);MAIN.postDelayed(tick,150);
        }
        void downloadAction(IslandDownloadPolicy.Entry<StatusBarNotification> entry,PendingIntent intent){
            if(activity!=IslandActivityPolicy.DOWNLOAD||!nativeHost.visible()||!downloads.current(entry,intent))return;
            // Re-read the authoritative source before dispatch: a withdrawn/replaced notification cannot leave live controls.
            NotificationListenerService listener=notificationListener.get();
            try{
                if(listener==null)return;
                boolean found=false;StatusBarNotification[] active=listener.getActiveNotifications();
                NotificationListenerService.RankingMap ranking=listener.getCurrentRanking();
                if(active!=null)for(StatusBarNotification current:active)if(downloads.allowsAction(current,ranking,entry,intent)){found=true;break;}
                if(!found){downloadSnapshot();requestRefresh();return;}
                openNotice(intent);
                nativeHost.panelActivity();
            }catch(RuntimeException unavailable){openDiagnostic("download_action_unavailable:"+unavailable.getClass().getSimpleName());}
        }
        StatusBarNotification activeNotice(StatusBarNotification source,NotificationListenerService listener){
            if(source==null||source!=notice||listener==null||closed||!enabled||!option("notifications")||screenOff||locked()
                    ||power==null||!power.isInteractive()||ownerUser<0||ownerUser!=currentUser()
                    ||activity!=IslandActivityPolicy.NOTICE||!nativeHost.visible()||!hostVisible()
                    ||android.os.SystemClock.elapsedRealtime()>=noticeUntil&&!nativeHost.holdsActivity())return null;
            StatusBarNotification[] active=listener.getActiveNotifications(new String[]{source.getKey()});
            if(active==null)return null;
            for(StatusBarNotification current:active){
                if(current==null||!source.getKey().equals(current.getKey())||source.getUid()!=current.getUid()
                        ||source.getPostTime()!=current.getPostTime()||source.getUserId()!=current.getUserId()
                        ||!source.getPackageName().equals(current.getPackageName())
                        ||current.getUserId()!=ownerUser&&current.getUserId()!=-1)continue;
                Notification n=current.getNotification();
                if(java.util.Objects.equals(n.getChannelId(),source.getNotification().getChannelId())
                        &&n.visibility!=Notification.VISIBILITY_SECRET&&n.extras!=null&&!n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION)
                        &&(n.flags&(Notification.FLAG_GROUP_SUMMARY|Notification.FLAG_ONGOING_EVENT))==0
                        &&noticeMode(current)!=IslandNoticeRules.OFF&&allowedRanking(current.getKey(),listener.getCurrentRanking()))return current;
            }
            return null;
        }
        boolean noticeAction(StatusBarNotification source,PendingIntent intent){
            if(intent==null)return false;
            try{
                StatusBarNotification current=activeNotice(source,notificationListener.get());
                if(current==null)return false;
                Notification n=current.getNotification();
                boolean allowed=intent.equals(n.contentIntent);
                for(Notification.Action button:IslandDownloadSource.actions(n))allowed|=intent.equals(button.actionIntent);
                boolean sent=allowed&&openNotice(intent);
                if(sent)nativeHost.panelActivity();
                return sent;
            }catch(RuntimeException failure){openDiagnostic("notice_action_unavailable:"+failure.getClass().getSimpleName());}
            return false;
        }
        boolean openNotice(PendingIntent intent){
            openDiagnostic("clicked");
            try{
                if(closed||!enabled||screenOff||locked()||power==null||!power.isInteractive()||intent==null
                        ||ownerUser<0||currentUser()!=ownerUser){openDiagnostic("blocked");return false;}
                // Like the native notification click path, explicitly grant the
                // sender's launch privileges for this user action. SystemUI has
                // a status-bar window, not necessarily a foreground Activity.
                ActivityOptions options=ActivityOptions.makeBasic();
                options.setPendingIntentBackgroundActivityStartMode(Build.VERSION.SDK_INT>=36
                        ?ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
                intent.send(context,0,null,null,null,null,options.toBundle());
                // send() can return even if the platform rejects a launch. This
                // diagnostic records submission, not a verified foreground app.
                openDiagnostic("submitted");return true;
            }catch(PendingIntent.CanceledException failure){openDiagnostic("canceled");}
            catch(RuntimeException failure){openDiagnostic("failed:"+failure.getClass().getSimpleName());}
            return false;
        }
        void openDiagnostic(String state){FeatureSettings.diagnostic(context,"ls_augment_island_open",state+";at="+SystemClock.elapsedRealtime());}
        int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
        void diagnostic(String value){if(!lastState.equals(value)){lastState=value;FeatureSettings.diagnostic(context,"ls_augment_island_state",value);}}
        void dismiss(){nativeHost.dismiss();}
        void hide(){nativeHost.hide();title="";subtitle="";icon=null;popupContent="";diagnostic(enabled?"idle":"disabled");}
        void stopMediaListening(){
            if(listening&&sessions!=null)try{sessions.removeOnActiveSessionsChangedListener(sessionListener);}catch(RuntimeException ignored){}
            listening=false;
            for(MediaController c:controllers)try{c.unregisterCallback(mediaCallback);}catch(RuntimeException ignored){}controllers.clear();media=null;clearNotice();
            mediaActivities.clear();noticeHistory.clear();cachedArt=null;cachedArtDrawable=null;cachedAppIcon=null;cachedIconPackage="";
            artworkSession=null;artworkMissingSince=-1;holdingArtwork=false;
        }
        void stopListening(){
            cancelFirst();
            announcedDownloads.clear();
            downloads.clear();download=null;
            stopMediaListening();
            chargeActivity.reset();
            if(receiving)try{context.unregisterReceiver(receiver);}catch(RuntimeException ignored){}receiving=false;
        }
        void close(){closed=true;MAIN.removeCallbacks(tick);FeatureSettings.removeSnapshotListener(config);stopListening();nativeHost.close();
            host.removeOnLayoutChangeListener(hostLayout);
            if(host.getViewTreeObserver().isAlive())host.getViewTreeObserver().removeOnPreDrawListener(hostVisibility);}
    }
}
