package ls.augment.com.hook;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.*;
import ls.augment.com.*;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Real notification/controller sources, serialized on the UI thread and hosted by the native scheduler. */
final class IslandLiveScenes {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static IslandLiveScenes active;
    private static boolean screenContract;
    private static WeakReference<Object> capturedHotspot=new WeakReference<>(null);
    private IslandBuiltinEvents builtin;
    private String hotspotFailure="hotspot_controller";
    private static Screen screen;
    private static final class Screen {
        final WeakReference<View> source;final View.OnClickListener click;final String count;final Object instance;
        Screen(View view,View.OnClickListener click,String count,Object instance){this.source=new WeakReference<>(view);this.click=click;this.count=count;this.instance=instance;}
    }
    private final Context context;
    private final ClassLoader loader;
    private final Object manager;
    private final View root,statusBar;
    private final boolean fullscreen;
    private final Map<String,IslandEvent> events=new LinkedHashMap<>();
    private final Map<String,DuoNotificationCards> cards=new LinkedHashMap<>();
    private final IslandOwnershipRegistry ownership=new IslandOwnershipRegistry();
    private final IslandFrameProof nativeFrames=new IslandFrameProof();
    private final Runnable changed=this::refresh;
    private final Runnable guidanceExpired=this::refresh;
    private final Runnable expiry=this::updateOwnership;
    private Object hotspot,hotspotCallback;
    private Method hotspotEnabled,hotspotCount,hotspotRemove;
    private boolean closed,permitted,zteScreenContract;
    private final android.database.ContentObserver screenState=new android.database.ContentObserver(MAIN){
        @Override public void onChange(boolean self){schedule();}
    };
    private int user=-1;
    private Object hotspotInstance;
    private Set<String> claims=Collections.emptySet();
    private final android.view.ViewTreeObserver.OnPreDrawListener layout=()->{observe();return true;};
    private final BroadcastReceiver environment=new BroadcastReceiver(){
        @Override public void onReceive(Context ignored,Intent intent){schedule();}
    };
    static int install(AugmentModule module,ClassLoader loader){
        int hooks=installHotspotCapture(module,loader)+IslandBuiltinEvents.install(module,loader);
        // An empty island window may stop drawing while QS covers it. Wake from the
        // actual native environment callback, not from a frame that may never run.
        for(String name:new String[]{"setControlPanelExpanded","setQsPanelExpanded","onKeyguardStateChanged"})try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method method=MagicIslandScenes.exact(type,name,void.class,boolean.class);
            module.registerFeatureHook(module.prepareFeatureHook(method,"island.environment."+name,false).intercept(chain->{
                Object result=chain.proceed();IslandLiveScenes owner=active;
                if(owner!=null&&owner.manager==chain.getThisObject())owner.schedule();return result;
            }));hooks++;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_ENVIRONMENT_MISSING "+name+":"+missing.getMessage());}
        try{
            Class<?> layout=Class.forName("com.zte.feature.callnotify.CallLayout",false,loader);
            Class<?> kind=Class.forName("com.zte.feature.callnotify.CallLayout$ViewType",false,loader);
            if(!kind.isEnum()||!View.class.isAssignableFrom(layout))throw new NoSuchMethodException("screen_chip_type");
            boolean record=false;for(Object value:kind.getEnumConstants())record|="SCREEN_RECORD".equals(((Enum<?>)value).name());
            if(!record)throw new NoSuchMethodException("screen_chip_scene");
            Method update=MagicIslandScenes.exact(layout,"updateViewTypeState",void.class,kind,int.class,String.class,Long.class,View.OnClickListener.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"island.source.screen_chip",false).intercept(chain->{
                Object result=chain.proceed();
                if("SCREEN_RECORD".equals(((Enum<?>)chain.getArg(0)).name())){
                    View view=(View)chain.getThisObject();int visibility=(Integer)chain.getArg(1);
                    String count=(String)chain.getArg(2);Long start=(Long)chain.getArg(3);View.OnClickListener click=(View.OnClickListener)chain.getArg(4);
                    MAIN.post(()->{
                        if(visibility==View.VISIBLE&&click!=null){
                            Object instance=screen!=null&&screen.source.get()==view?screen.instance:new Object();
                            // A source-provided start time distinguishes a new recording even without a hidden frame.
                            if(start!=null)instance=start;
                            screen=new Screen(view,click,count==null?"正在录屏":count,instance);
                        }else if(screen!=null&&screen.source.get()==view)screen=null;
                        if(active!=null)active.schedule();
                    });
                }
                return result;
            }));screenContract=true;return hooks+1;
        }catch(Exception missing){module.logFeatureInfo("ISLAND_SCREEN_SOURCE_UNAVAILABLE "+missing.getMessage());return hooks;}
    }
    private static void captureHotspot(Object controller){
        if(capturedHotspot.get()==controller)return;capturedHotspot=new WeakReference<>(controller);
        MAIN.post(()->{IslandLiveScenes host=active;if(host!=null&&host.hotspot==null){host.bindHotspot();host.schedule();}});
    }
    private static int installHotspotCapture(AugmentModule module,ClassLoader loader){
        int hooks=0;
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.policy.HotspotControllerImpl",false,loader);
            Class<?> callback=Class.forName("com.android.systemui.statusbar.policy.HotspotController$Callback",false,loader);
            MagicIslandScenes.exact(type,"removeCallback",void.class,callback);
            Method enabled=MagicIslandScenes.exact(type,"isHotspotEnabled",boolean.class);
            MagicIslandScenes.exact(type,"getNumConnectedDevices",int.class);
            Method add=MagicIslandScenes.exact(type,"addCallback",void.class,callback);
            for(Method method:new Method[]{enabled,add}){
                module.registerFeatureHook(module.prepareFeatureHook(method,"island.source.hotspot."+method.getName(),false).intercept(chain->{
                    Object value=chain.proceed();captureHotspot(chain.getThisObject());return value;
                }));hooks++;
            }
            for(java.lang.reflect.Constructor<?> constructor:type.getDeclaredConstructors()){
                module.registerFeatureHook(module.hook(constructor).setId("ls_augment.api102.island.hotspot."+constructor.getParameterCount())
                        .setExceptionMode(io.github.libxposed.api.XposedInterface.ExceptionMode.PROTECTIVE).intercept(chain->{
                            Object result=chain.proceed();captureHotspot(chain.getThisObject());return result;
                        }));hooks++;
            }
        }catch(Exception missing){module.logFeatureInfo("ISLAND_HOTSPOT_SOURCE_UNAVAILABLE "+missing.getMessage());}
        return hooks;
    }
    IslandLiveScenes(Context context,ClassLoader loader,Object manager,boolean fullscreen,View root,View statusBar){
        this.context=context;this.loader=loader;this.manager=manager;this.fullscreen=fullscreen;this.root=root;this.statusBar=statusBar;
    }
    void start(){
        active=this;
        if(fullscreen){builtin=new IslandBuiltinEvents(context,loader,this::schedule,this::currentUser);builtin.start();}
        root.getViewTreeObserver().addOnPreDrawListener(layout);
        if(statusBar.getViewTreeObserver()!=root.getViewTreeObserver())statusBar.getViewTreeObserver().addOnPreDrawListener(layout);
        FeatureSettings.addSnapshotListener(context,changed);
        IntentFilter filter=new IntentFilter();for(String action:new String[]{Intent.ACTION_SCREEN_OFF,Intent.ACTION_SCREEN_ON,
                Intent.ACTION_USER_PRESENT,Intent.ACTION_CONFIGURATION_CHANGED,"android.intent.action.USER_SWITCHED"})filter.addAction(action);
        context.registerReceiver(environment,filter,Context.RECEIVER_NOT_EXPORTED);
        zteScreenContract=NativeScreenRecordingNotice.capable(context);
        if(zteScreenContract)context.getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor(NativeScreenRecordingNotice.STATE),false,screenState);
        bindHotspot();refresh();
    }
    private void bindHotspot(){
        try{
            Class<?> type=Class.forName("com.android.systemui.statusbar.policy.HotspotController",false,loader);
            hotspot=capturedHotspot.get();
            if(!type.isInstance(hotspot))hotspot=field(manager,"mHotspotController");
            if(!type.isInstance(hotspot))hotspot=Class.forName("com.android.systemui.Dependency",false,loader).getMethod("get",Class.class).invoke(null,type);
            if(!type.isInstance(hotspot))throw new IllegalStateException("hotspot_controller_missing");
            Class<?> callback=Class.forName(type.getName()+"$Callback",false,loader);
            hotspotEnabled=MagicIslandScenes.exact(hotspot.getClass(),"isHotspotEnabled",boolean.class);
            hotspotCount=MagicIslandScenes.exact(hotspot.getClass(),"getNumConnectedDevices",int.class);
            Method add=MagicIslandScenes.exact(hotspot.getClass(),"addCallback",void.class,callback);
            hotspotRemove=MagicIslandScenes.exact(hotspot.getClass(),"removeCallback",void.class,callback);
            hotspotCallback=Proxy.newProxyInstance(loader,new Class<?>[]{callback},(proxy,method,args)->{
                if(method.getDeclaringClass()==Object.class){
                    if("equals".equals(method.getName()))return proxy==args[0];
                    if("hashCode".equals(method.getName()))return System.identityHashCode(proxy);return "Duo hotspot source";
                }
                schedule();return null;
            });add.invoke(hotspot,hotspotCallback);
        }catch(Exception missing){hotspot=null;hotspotFailure="controller:"+missing.getClass().getSimpleName()+":"+missing.getMessage();
            capability("hotspot",false,hotspotFailure);FeatureRuntimeLog.event("ISLAND_LIVE_SOURCE",hotspotFailure);}
    }
    static void notificationsChanged(){IslandLiveScenes value=active;if(value!=null)value.schedule();}
    static boolean owns(String scene){IslandLiveScenes value=active;return value!=null&&!value.closed
            &&IslandSceneSelection.enabled(value.context,scene)&&value.ownership.owns(scene,SystemClock.elapsedRealtime());}
    private void schedule(){if(!closed){MAIN.removeCallbacks(changed);MAIN.post(changed);}}
    private int currentUser(){try{return (Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);}catch(Exception missing){return -1;}}
    private boolean allowed(){
        return !closed&&FeatureSettings.enabled(context,SystemUiOptions.ISLAND)&&root.isAttachedToWindow()
                &&Boolean.TRUE.equals(field(manager,"mInteractive"))&&!Boolean.TRUE.equals(field(manager,"mOnKeyguard"))
                &&!Boolean.TRUE.equals(field(manager,"mAODVisibility"))&&!Boolean.TRUE.equals(field(manager,"mQsPanelExpanded"))
                &&!Boolean.TRUE.equals(field(manager,"mControlPanelExpanded"))&&statusBar.isShown()
                &&context.getResources().getConfiguration().orientation!=android.content.res.Configuration.ORIENTATION_LANDSCAPE;
    }
    private void observe(){
        if(closed)return;
        if(permitted!=allowed()){schedule();return;}
        if(screen!=null&&events.containsKey("screen_record")&&(screen.source.get()==null||!screen.source.get().isAttachedToWindow())){schedule();return;}
        updateOwnership();
    }
    private void refresh(){
        MAIN.removeCallbacks(changed);MAIN.removeCallbacks(guidanceExpired);if(closed)return;
        int nextUser=currentUser();boolean next=allowed()&&nextUser>=0;
        if(user!=nextUser){release();if(user>=0)screen=null;user=nextUser;hotspotInstance=null;}
        permitted=next;
        NotificationListenerService listener=DynamicIslandHook.notificationSource();
        capability("navigation",listener!=null,"notification_listener");
        capability("screen_record",screenContract||zteScreenContract&&listener!=null,"recording_source");
        capability("hotspot",hotspot!=null,hotspotFailure);
        if(builtin!=null)for(String scene:new String[]{"torch","low_power","bluetooth","headset"})capability(scene,builtin.capable(scene),"native_source");
        if(!next){release();if(builtin!=null)builtin.reset();return;}
        Map<String,IslandEvent> nextEvents=new LinkedHashMap<>();
        if(builtin!=null)nextEvents.putAll(builtin.snapshot(user));
        if(IslandSceneSelection.enabled(context,"navigation")&&listener!=null)navigation(listener,nextEvents);
        if(IslandSceneSelection.enabled(context,"screen_record")&&screen!=null){
            Screen snapshot=screen;View view=snapshot.source.get();
            if(view!=null&&view.isAttachedToWindow()){
                Runnable open=()->{Screen current=screen;if(current!=null&&Objects.equals(current.instance,snapshot.instance)
                        &&current.source.get()==view&&view.isAttachedToWindow())current.click.onClick(view);};
                nextEvents.put("screen_record",new IslandEvent("screen_record","screen_record",user,android.os.Process.myUid(),snapshot.instance,
                        snapshot.count,"屏幕录制",snapshot.count,snapshot.count,icon("com.android.systemui"),open,
                        List.of(new IslandEvent.Action("录屏操作",open))));
            }
        }
        if(IslandSceneSelection.enabled(context,"screen_record")&&zteScreenContract&&!nextEvents.containsKey("screen_record")){
            IslandEvent nativeRecording=NativeScreenRecordingNotice.read(context,listener,user,events.get("screen_record"));
            if(nativeRecording!=null)nextEvents.put("screen_record",nativeRecording);
        }
        if(IslandSceneSelection.enabled(context,"hotspot")&&hotspot!=null)try{
            if(Boolean.TRUE.equals(hotspotEnabled.invoke(hotspot))){
                if(hotspotInstance==null)hotspotInstance=new Object();int count=(Integer)hotspotCount.invoke(hotspot);
                Runnable open=()->{
                    Intent intent=new Intent("android.settings.WIFI_HOTSPOT_SETTINGS").setPackage("com.android.settings").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    try{
                        Context current=(Context)Context.class.getMethod("createContextAsUser",android.os.UserHandle.class,int.class)
                                .invoke(context,android.os.UserHandle.getUserHandleForUid(user*100000),0);
                        current.startActivity(intent);
                    }catch(ReflectiveOperationException unavailable){throw new IllegalStateException("current_user_context",unavailable);}
                };
                nextEvents.put("hotspot",new IslandEvent("hotspot","hotspot",user,android.os.Process.myUid(),hotspotInstance,count,
                        "个人热点",count+" 台设备已连接",count+" 台设备",icon("com.android.settings"),open,List.of(new IslandEvent.Action("管理热点",open))));
            }else hotspotInstance=null;
        }catch(Exception missing){capability("hotspot",false,"snapshot:"+missing.getClass().getSimpleName());}
        for(Map.Entry<String,IslandEvent> entry:nextEvents.entrySet()){
            IslandEvent old=events.get(entry.getKey()),value=entry.getValue();
            if(old!=null&&Objects.equals(old.instance,value.instance)&&Objects.equals(old.revision,value.revision))entry.setValue(old);
        }
        for(String key:new ArrayList<>(cards.keySet()))if(!nextEvents.containsKey(key)){cards.remove(key).close();}
        Map<String,IslandEvent> previous=new HashMap<>(events);events.clear();events.putAll(nextEvents);
        for(IslandEvent event:nextEvents.values()){
            View nativeCard=nativeCard(event.scene);
            if(nativeCard!=null){DuoNotificationCards old=cards.remove(event.key);if(old!=null)old.close();continue;}
            try{
                DuoNotificationCards card=cards.get(event.key);
                if(card==null){
                    card=new DuoNotificationCards(context,loader,manager,fullscreen,()->open(event.key),statusBar,"ls.augment.com_duo_live_"+event.key);
                    cards.put(event.key,card);
                }
                IslandEvent old=previous.get(event.key);
                if(old==null||!Objects.equals(old.instance,event.instance)||!Objects.equals(old.revision,event.revision)||!card.visible())
                    if(!card.showEvent(event,action->dispatch(event,action)))cards.remove(event.key).close();
            }catch(Exception missing){capability(event.scene,false,"host:"+missing.getClass().getSimpleName());}
        }
        updateOwnership();
    }
    private View nativeCard(String scene){
        if(!"hotspot".equals(scene))return null;
        Object card=field(manager,"mHotspotIsland");
        if(!(card instanceof View))return null;
        Object registry=field(manager,"mAppIslandList");
        return ((View)card).isAttachedToWindow()||registry instanceof Map&&((Map<?,?>)registry).containsValue(card)?(View)card:null;
    }
    private void updateOwnership(){
        Map<String,Object> visible=new HashMap<>(),transitions=new HashMap<>();Set<View> live=new HashSet<>();
        if(permitted&&allowed())for(IslandEvent event:events.values()){
            DuoNotificationCards card=cards.get(event.key);View nativeCard=nativeCard(event.scene);boolean drawn=false;
            if(nativeCard!=null){
                live.add(nativeCard);drawn=nativeFrames.confirm(nativeCard,event.revision,this::updateOwnership);
                try{Object panel=call(nativeCard,"getPanelIsland");if(panel instanceof View){
                    live.add((View)panel);drawn|=nativeFrames.confirm((View)panel,event.revision,this::updateOwnership);
                }}catch(Exception ignored){}
            }
            else if(card!=null)drawn=card.confirmedFrame(event.revision,this::updateOwnership);
            if(drawn)visible.put(event.scene,event.instance);
            else if(card!=null&&card.selected()&&(Boolean.TRUE.equals(field(manager,"mAnimProcessing"))
                    ||Boolean.TRUE.equals(field(manager,"mDynamicPanelClosing"))))transitions.put(event.scene,event.instance);
        }
        nativeFrames.retain(live);ownership.reconcile(visible,transitions,SystemClock.elapsedRealtime());
        Set<String> next=ownership.scenes(SystemClock.elapsedRealtime());
        if(!next.equals(claims)){claims=next;NativeIslandScenes.refreshLiveCapsules();}
        MAIN.removeCallbacks(expiry);long until=ownership.nextExpiry();
        if(until>0)MAIN.postDelayed(expiry,Math.max(1,until-SystemClock.elapsedRealtime()));
    }
    private void navigation(NotificationListenerService listener,Map<String,IslandEvent> next){
        try{
            long now=SystemClock.elapsedRealtime(),nearestExpiry=Long.MAX_VALUE;
            StatusBarNotification[] active=listener.getActiveNotifications();if(active==null)return;
            NotificationListenerService.RankingMap ranks=listener.getCurrentRanking();
            for(StatusBarNotification source:active){
                if(next.size()>=8)break;
                String pkg=source.getPackageName();Notification n=source.getNotification();
                boolean route=Notification.CATEGORY_NAVIGATION.equals(n.category)
                        ||"com.autonavi.minimap".equals(pkg)&&"ROUTE_CHANNEL_ID".equals(n.getChannelId());
                if(source.getUserId()!=user||!("com.autonavi.minimap".equals(pkg)||"com.baidu.BaiduMap".equals(pkg))
                        ||!route||!source.isOngoing()||n.contentIntent==null
                        ||n.visibility==Notification.VISIBILITY_SECRET||n.extras==null||(n.flags&Notification.FLAG_GROUP_SUMMARY)!=0)continue;
                NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
                if(ranks==null||!ranks.getRanking(source.getKey(),rank)||rank.isSuspended()||!rank.matchesInterruptionFilter()
                        ||rank.getImportance()<android.app.NotificationManager.IMPORTANCE_LOW)continue;
                String title=String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TITLE,"导航中"));
                String detail=String.valueOf(n.extras.getCharSequence(Notification.EXTRA_BIG_TEXT,n.extras.getCharSequence(Notification.EXTRA_TEXT,"")));
                String words=title+" "+detail;
                if(words.contains("导航已结束")||words.contains("导航结束")||words.contains("已退出导航")||words.contains("已到达目的地")
                        ||words.contains("规划路线")||words.contains("算路中")||"ended".equals(n.extras.getString(AtomicWorkbenchAmapData.STATUS)))continue;
                String key="navigation_"+source.getUid()+"_"+source.getId()+"_"+Integer.toHexString(source.getKey().hashCode());
                IslandNavigationPresentation data=IslandNavigationPresentation.read(pkg,n,now);
                title=data.title;detail=data.detail;
                if(data.expires>now)nearestExpiry=Math.min(nearestExpiry,data.expires);
                Object revision=Objects.hash(IslandHeadsUpBridge.revision(source),title,detail);IslandEvent old=events.get(key);
                Object instance=old!=null&&old.uid==source.getUid()?old.instance:new Object();
                Runnable open=()->sendNavigation(source,n.contentIntent);
                List<IslandEvent.Action> actions=new ArrayList<>();
                for(Notification.Action action:IslandDownloadSource.actions(n))actions.add(new IslandEvent.Action(action.title.toString(),()->sendNavigation(source,action.actionIntent)));
                if(actions.isEmpty())actions.add(new IslandEvent.Action("返回导航",open));
                next.put(key,new IslandEvent(key,"navigation",user,source.getUid(),instance,revision,title,detail,title,icon(pkg),open,actions));
            }
            if(nearestExpiry<Long.MAX_VALUE)MAIN.postDelayed(guidanceExpired,Math.max(1,nearestExpiry-now));
        }catch(RuntimeException missing){capability("navigation",false,"snapshot:"+missing.getClass().getSimpleName());}
    }
    private void sendNavigation(StatusBarNotification source,PendingIntent intent){
        NotificationListenerService listener=DynamicIslandHook.notificationSource();if(listener==null||intent==null)return;
        try{
            StatusBarNotification[] sources=listener.getActiveNotifications(new String[]{source.getKey()});
            if(sources==null)return;
            for(StatusBarNotification current:sources)if(IslandHeadsUpBridge.same(source,current)&&current.getUserId()==user){
                android.app.ActivityOptions options=android.app.ActivityOptions.makeBasic();
                options.setPendingIntentBackgroundActivityStartMode(android.os.Build.VERSION.SDK_INT>=36?
                        android.app.ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:android.app.ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
                intent.send(context,0,null,null,null,null,options.toBundle());return;
            }
        }catch(Exception missing){FeatureRuntimeLog.event("ISLAND_LIVE_ACTION",missing.getClass().getSimpleName());}
    }
    private void open(String key){IslandEvent event=events.get(key);if(event==null)return;
        if(event.open!=null)dispatch(event,new IslandEvent.Action("open",event.open));else{DuoNotificationCards card=cards.get(key);if(card!=null)card.expand();}}
    private void dispatch(IslandEvent event,IslandEvent.Action action){
        if(!allowed()||user!=currentUser()||events.get(event.key)!=event||!IslandSceneSelection.enabled(context,event.scene))return;
        // Returning to the navigation source must not leave this panel above the destination app.
        // dismiss() verifies this card owns the expanded panel and uses the OEM close animation.
        if("navigation".equals(event.scene)){DuoNotificationCards card=cards.get(event.key);if(card!=null)card.dismiss();}
        try{action.run.run();}catch(RuntimeException missing){FeatureRuntimeLog.event("ISLAND_LIVE_ACTION",missing.getClass().getSimpleName());}
    }
    private Drawable icon(String pkg){try{return context.getPackageManager().getApplicationIcon(pkg);}catch(Exception missing){return null;}}
    private void capability(String scene,boolean ready,String reason){
        FeatureSettings.diagnostic(context,IslandSceneRegistry.key(scene)+"_capability",ready?"ready:"+BuildConfig.VERSION_CODE:"unavailable:"+reason);
    }
    private void release(){
        MAIN.removeCallbacks(guidanceExpired);
        MAIN.removeCallbacks(expiry);
        for(DuoNotificationCards card:cards.values())card.close();cards.clear();events.clear();nativeFrames.clear();ownership.clear();
        if(!claims.isEmpty()){claims=Collections.emptySet();NativeIslandScenes.refreshLiveCapsules();}
    }
    void close(){if(closed)return;closed=true;MAIN.removeCallbacks(changed);FeatureSettings.removeSnapshotListener(changed);
        if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(layout);
        if(statusBar.getViewTreeObserver().isAlive())statusBar.getViewTreeObserver().removeOnPreDrawListener(layout);
        context.getContentResolver().unregisterContentObserver(screenState);
        try{context.unregisterReceiver(environment);}catch(RuntimeException ignored){}
        if(hotspot!=null&&hotspotRemove!=null&&hotspotCallback!=null)try{hotspotRemove.invoke(hotspot,hotspotCallback);}catch(Exception ignored){}
        if(builtin!=null)builtin.close();release();if(active==this)active=null;
    }
}
