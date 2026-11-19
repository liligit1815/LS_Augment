package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.app.PendingIntent;
import android.app.ActivityOptions;
import android.content.Context;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.os.PowerManager;
import android.os.Build;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.*;
import ls.augment.com.SystemUiOptions;

/** Extends only verified RedMagic package lists, for an actual selected media session. */
final class NativeIslandMediaAdmission {
    private static final Map<Object,WeakReference<NativeIslandMediaAdmission>> OWNERS=new WeakHashMap<>();
    private static Method supportMethod,showMethod,panelGet,panelUnregister,panelRefresh,foregroundMethod;
    private static Field foregroundPackage;
    private static Class<?> mediaCardType,panelType;
    private static Field panelController,panelPackage,panelCallback;
    private static Field supportList,showList,excludeList;
    private static Method currentIsland,disposableOpening;
    private static Field[] sourceGates;
    private static Method removeMedia;
    private static boolean installed;
    private final Context context;
    private final Object manager;
    private final MediaSessionManager sessions;
    private final Object permanent;
    private final Field cards;
    private MediaController candidate;
    private Object ownedPanel;
    private MediaController ownedController;
    private boolean closed;

    static int install(AugmentModule module,ClassLoader loader){
        if(installed)return 0;
        int count=0;
        try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.DynamicIslandManager",false,loader);
            Class<?> utils=Class.forName("com.zte.feature.dynamicisland.DynamicIslandUtils",false,loader);
            Method support=MagicIslandScenes.exact(type,"isSupportMediaControl",boolean.class,String.class);
            Method show=MagicIslandScenes.exact(type,"shouldShowOnMediaIsland",boolean.class,String.class);
            Method foreground=MagicIslandScenes.exact(type,"handleMediaIslandFullScreen",void.class,String.class);
            Field foregroundField=MagicIslandScenes.typed(type,"mPkgName",String.class);
            Class<?> permanentType=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method state=MagicIslandScenes.exact(permanentType,"updateMediaIslandState",void.class,boolean.class,String.class);
            Field supported=staticField(utils,"SUPPORT_PACKAGE_WHITELIST",String[].class);
            Field allowed=staticField(utils,"MEDIA_ISLAND_LIST",List.class);
            Field excluded=staticField(utils,"MEDIA_ISLAND_EXCLUDE_LIST",List.class);
            strings(supported);strings(allowed);strings(excluded);
            Class<?> card=Class.forName("com.zte.feature.dynamicisland.MediaIslandFullScreen",false,loader);
            Class<?> panel=Class.forName("com.zte.feature.dynamicisland.MediaPanelIslandFullScreen",false,loader);
            Class<?> base=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
            Method getter=MagicIslandScenes.exact(card,"getPanelIsland",base);
            Method panelList=MagicIslandScenes.exact(panel,"handleMediaControllerList",void.class,List.class);
            Method unregister=MagicIslandScenes.exact(panel,"tryToUnregisterCallback",void.class);
            Method refresh=MagicIslandScenes.exact(panel,"refreshAfterRegisterCallback",void.class);
            Field control=MagicIslandScenes.typed(panel,"mMediaController",MediaController.class);
            Field packageField=MagicIslandScenes.typed(panel,"mCurrentPlayPkg",String.class);
            Field callback=MagicIslandScenes.typed(panel,"mSessionCallback",MediaController.Callback.class);
            for(Method method:new Method[]{support,show}){
                boolean supportGate=method==support;
                module.registerFeatureHook(module.prepareFeatureHook(method,"rm.ui.native_media.admission",false).intercept(chain->{
                    Object original=chain.proceed(chain.getArgs().toArray());
                    if(!Boolean.FALSE.equals(original))return original;
                    NativeIslandMediaAdmission owner;
                    synchronized(OWNERS){WeakReference<NativeIslandMediaAdmission> ref=OWNERS.get(chain.getThisObject());owner=ref==null?null:ref.get();}
                    Object pkg=chain.getArgs().get(0);
                    return owner!=null&&pkg instanceof String&&owner.permits((String)pkg,supportGate)?true:original;
                }));count++;
            }
            module.registerFeatureHook(module.prepareFeatureHook(panelList,"rm.ui.native_media.panel_session",false).intercept(chain->{
                Object original=chain.proceed(chain.getArgs().toArray());
                List<WeakReference<NativeIslandMediaAdmission>> owners;
                synchronized(OWNERS){owners=new ArrayList<>(OWNERS.values());}
                for(WeakReference<NativeIslandMediaAdmission> ref:owners){NativeIslandMediaAdmission owner=ref.get();
                    if(owner!=null)owner.syncPanel(chain.getThisObject());}
                return original;
            }));count++;
            module.registerFeatureHook(module.prepareFeatureHook(state,"rm.ui.native_media.source_foreground",false).intercept(chain->{
                Object original=chain.proceed(chain.getArgs().toArray());
                List<WeakReference<NativeIslandMediaAdmission>> owners;
                synchronized(OWNERS){owners=new ArrayList<>(OWNERS.values());}
                for(WeakReference<NativeIslandMediaAdmission> ref:owners){NativeIslandMediaAdmission owner=ref.get();
                    if(owner!=null&&owner.permanent==chain.getThisObject())owner.reconcileForeground();}
                return original;
            }));count++;
            mediaCardType=card;panelType=panel;panelGet=getter;panelUnregister=unregister;panelRefresh=refresh;
            foregroundMethod=foreground;foregroundPackage=foregroundField;
            panelController=control;panelPackage=packageField;panelCallback=callback;
            supportMethod=support;showMethod=show;supportList=supported;showList=allowed;excludeList=excluded;installed=true;
        }catch(Throwable missing){
            FeatureRuntimeLog.state("ISLAND_MEDIA_ADMISSION","native","native_fallback:"+FeatureRuntimeLog.failure(missing));
        }
        if(installed)try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Method add=MagicIslandScenes.exact(type,"addMediaIslandFullScreen",void.class);
            Method remove=MagicIslandScenes.exact(type,"removeMediaIslandFullScreen",void.class,String.class);
            module.registerFeatureHook(module.prepareFeatureHook(add,"rm.ui.native_media.scene_selection",false).intercept(chain->{
                NativeIslandMediaAdmission owner=forPermanent(chain.getThisObject());
                if(owner!=null&&owner.sceneDisabled())return null;
                return chain.proceed(chain.getArgs().toArray());
            }));removeMedia=remove;count++;
        }catch(Exception|LinkageError unavailable){
            FeatureRuntimeLog.state("ISLAND_MEDIA_SELECTION","native","selection_unavailable:"+FeatureRuntimeLog.failure(unavailable));
        }
        if(installed)try{
            Class<?> type=Class.forName("com.zte.feature.dynamicisland.PermanentIslandManager",false,loader);
            Class<?> base=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,loader);
            Method hold=MagicIslandScenes.exact(type,"onLongClick",void.class);
            Method current=MagicIslandScenes.exact(type,"getPermanentIsland",base);
            Method disposable=MagicIslandScenes.exact(type,"isDisposableOpening",boolean.class);
            Field[] gates=new Field[4];int i=0;
            for(String name:new String[]{"mOnKeyguard","mAnimProcessing","mDynamicPanelClosing","mPriorityProcessing"})gates[i++]=MagicIslandScenes.typed(type,name,boolean.class);
            currentIsland=current;disposableOpening=disposable;sourceGates=gates;
            module.registerFeatureHook(module.prepareFeatureHook(hold,"rm.ui.native_media.source_activity",false).intercept(chain->{
                Object owner=chain.getThisObject();
                try{
                    boolean allowed=!Boolean.TRUE.equals(disposableOpening.invoke(owner));
                    String gateState="disposable="+!allowed;
                    for(Field gate:sourceGates){boolean blocked=gate.getBoolean(owner);allowed&=!blocked;gateState+=";"+gate.getName()+"="+blocked;}
                    FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","gesture",gateState);
                    if(allowed&&openSource(owner,currentIsland.invoke(owner)))return null;
                }catch(Exception|LinkageError unavailable){FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","native","native_fallback:"+FeatureRuntimeLog.failure(unavailable));}
                return chain.proceed(chain.getArgs().toArray());
            }));count++;
        }catch(Exception|LinkageError unavailable){
            FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","native","gesture_unavailable:"+FeatureRuntimeLog.failure(unavailable));
        }
        return count;
    }
    static NativeIslandMediaAdmission attach(Context context,Object manager,Object permanent,MediaSessionManager sessions){
        if(!installed||!supportMethod.getDeclaringClass().isInstance(manager)||!showMethod.getDeclaringClass().isInstance(manager))return null;
        try{
            NativeIslandMediaAdmission value=new NativeIslandMediaAdmission(context,manager,permanent,sessions);
            synchronized(OWNERS){OWNERS.put(manager,new WeakReference<>(value));}return value;
        }catch(Exception missing){FeatureRuntimeLog.state("ISLAND_MEDIA_ADMISSION","native","native_fallback:"+FeatureRuntimeLog.failure(missing));return null;}
    }
    private NativeIslandMediaAdmission(Context context,Object manager,Object permanent,MediaSessionManager sessions)throws Exception{
        this.context=context;this.manager=manager;this.permanent=permanent;this.sessions=sessions;
        cards=MagicIslandScenes.typed(permanent.getClass(),"mAppIslandList",Map.class);
    }
    void select(MediaController value){candidate=value;if(value==null)releasePanel();}
    private void reconcileForeground(){
        MediaController selected=candidate;if(selected==null)return;
        try{
            String top=(String)foregroundPackage.get(manager);
            if(selected.getPackageName().equals(top)&&permits(top,false))foregroundMethod.invoke(manager,top);
        }catch(Exception failure){FeatureRuntimeLog.state("ISLAND_MEDIA_ADMISSION","native","foreground_fallback:"+FeatureRuntimeLog.failure(failure));}
    }
    void syncPanel(Object expected){
        MediaController selected=candidate;
        if(selected==null||!permits(selected.getPackageName(),false))return;
        Object touched=null;MediaController previous=null;String previousPackage=null;MediaController.Callback callback=null;
        try{
            Object registry=cards.get(permanent);
            if(!(registry instanceof Map))return;
            Object card=((Map<?,?>)registry).get("media_island");
            if(!mediaCardType.isInstance(card))return;
            Object panel=panelGet.invoke(card);
            if(!panelType.isInstance(panel)||expected!=null&&expected!=panel)return;
            MediaController bound=(MediaController)panelController.get(panel);
            if(bound!=null&&selected.getSessionToken().equals(bound.getSessionToken())&&selected.getPackageName().equals(panelPackage.get(panel)))return;
            Object nativeCallback=panelCallback.get(panel);if(!(nativeCallback instanceof MediaController.Callback))return;
            callback=(MediaController.Callback)nativeCallback;previous=bound;previousPackage=(String)panelPackage.get(panel);
            // The panel has its own direct list gate. Bind its original callback and refresh entry;
            // all native click/seek listeners continue to operate on the real selected controller.
            panelUnregister.invoke(panel);
            touched=panel;
            panelController.set(panel,selected);panelPackage.set(panel,selected.getPackageName());
            selected.registerCallback(callback);
            panelRefresh.invoke(panel);
            if(ownedPanel!=null&&ownedPanel!=panel)releasePanel();
            ownedPanel=panel;ownedController=selected;
            FeatureRuntimeLog.state("ISLAND_MEDIA_PANEL_SESSION","bound","bound_real_session");
        }catch(Exception|LinkageError failure){
            if(touched!=null){
                try{selected.unregisterCallback(callback);}catch(RuntimeException ignored){}
                try{
                    if(panelController.get(touched)==selected){
                        panelController.set(touched,previous);panelPackage.set(touched,previousPackage);
                        if(previous!=null){previous.registerCallback(callback);panelRefresh.invoke(touched);}
                    }
                }catch(Exception|LinkageError rollback){FeatureRuntimeLog.state("ISLAND_MEDIA_PANEL_SESSION","rollback","rollback_unavailable:"+FeatureRuntimeLog.failure(rollback));}
            }
            FeatureRuntimeLog.state("ISLAND_MEDIA_PANEL_SESSION","native","native_fallback:"+FeatureRuntimeLog.failure(failure));
        }
    }
    private boolean permits(String pkg,boolean supportGate){
        try{
            // An existing list member denied by OEM code is a policy denial, not a missing package.
            return pkg!=null&&!pkg.isEmpty()&&!strings(supportGate?supportList:showList).contains(pkg)
                    &&candidate!=null&&pkg.equals(candidate.getPackageName())&&liveCandidate()!=null;
        }catch(Exception|LinkageError missing){
            FeatureRuntimeLog.state("ISLAND_MEDIA_ADMISSION","native","native_fallback:"+FeatureRuntimeLog.failure(missing));return false;
        }
    }
    private MediaController liveCandidate() throws Exception {
        MediaController selected=candidate;
        if(closed||!installed||selected==null||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)
                ||!IslandSceneSelection.enabled(context,"media"))return null;
        String pkg=selected.getPackageName();if(pkg==null||pkg.isEmpty()||strings(excludeList).contains(pkg))return null;
        int user=(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
        if(user!=android.os.Process.myUid()/100000)return null;
        MediaSession.Token token=selected.getSessionToken();
        if(token==null||!pkg.equals(sessions.getMediaKeyEventSessionPackageName())||!token.equals(sessions.getMediaKeyEventSession()))return null;
        List<MediaController> values=sessions.getActiveSessions(null);MediaController live=null;
        if(values==null)return null;
        for(MediaController value:values)if(value!=null&&pkg.equals(value.getPackageName())&&token.equals(value.getSessionToken())){
            if(live!=null)return null;live=value;
        }
        if(live==null||live.getPlaybackState()==null)return null;
        MediaMetadata metadata=live.getMetadata();
        if(metadata==null||metadata.getDescription()==null||metadata.getDescription().getTitle()==null
                ||metadata.getDescription().getTitle().length()==0)return null;
        // Media-key ownership can change during the Binder snapshot.
        return pkg.equals(sessions.getMediaKeyEventSessionPackageName())&&token.equals(sessions.getMediaKeyEventSession())
                &&user==(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null)?live:null;
    }
    /** Prefer the session's real playback page over a package launcher; absence keeps native fallback. */
    static boolean openSource(Object permanent,Object island){
        NativeIslandMediaAdmission owner=forPermanent(permanent);return owner!=null&&owner.openSessionActivity(island);
    }
    private static NativeIslandMediaAdmission forPermanent(Object permanent){
        List<WeakReference<NativeIslandMediaAdmission>> owners;
        synchronized(OWNERS){owners=new ArrayList<>(OWNERS.values());}
        for(WeakReference<NativeIslandMediaAdmission> ref:owners){NativeIslandMediaAdmission owner=ref.get();
            if(owner!=null&&owner.permanent==permanent)return owner;
        }return null;
    }
    private boolean sceneDisabled(){
        if(closed||removeMedia==null||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)||IslandSceneSelection.enabled(context,"media"))return false;
        try{return (Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null)==android.os.Process.myUid()/100000;}
        catch(Exception|LinkageError unavailable){FeatureRuntimeLog.state("ISLAND_MEDIA_SELECTION","native","user_scope_unavailable:"+FeatureRuntimeLog.failure(unavailable));return false;}
    }
    void synchronizeSelection(){
        if(!sceneDisabled())return;
        try{
            if((Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null)!=android.os.Process.myUid()/100000)return;
            Object registry=cards.get(permanent);
            if(registry instanceof Map&&mediaCardType.isInstance(((Map<?,?>)registry).get("media_island"))){
                // OEM removal owns its expanded-panel animation and queue. This reason deliberately
                // does not use the OEM's removePlayer branch or alter actual playback state.
                removeMedia.invoke(permanent,"duo_scene_disabled");
                FeatureRuntimeLog.state("ISLAND_MEDIA_SELECTION","state","native_media_withdrawn");
            }
        }catch(Exception|LinkageError unavailable){
            FeatureRuntimeLog.state("ISLAND_MEDIA_SELECTION","native","native_fallback:"+FeatureRuntimeLog.failure(unavailable));
        }
    }
    private boolean openSessionActivity(Object island){
        try{
            MediaController live=liveCandidate();if(live==null)return sourceFallback("session_unavailable");
            if(!mediaCardType.isInstance(island))return sourceFallback("different_scene");
            Object registry=cards.get(permanent);if(!(registry instanceof Map)||((Map<?,?>)registry).get("media_island")!=island)return sourceFallback("card_replaced");
            String pkg=live.getPackageName();
            if(!pkg.equals(MagicIslandScenes.typed(island.getClass(),"mMediaPkg",String.class).get(island)))return sourceFallback("card_source_changed");
            Object panel=panelGet.invoke(island);if(!panelType.isInstance(panel))return sourceFallback("panel_unavailable");
            MediaController bound=(MediaController)panelController.get(panel);
            if(bound==null||!live.getSessionToken().equals(bound.getSessionToken())||!pkg.equals(panelPackage.get(panel)))return sourceFallback("panel_source_changed");
            KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);PowerManager power=context.getSystemService(PowerManager.class);
            if(keyguard==null||keyguard.isKeyguardLocked()||power==null||!power.isInteractive())return sourceFallback("display_unavailable");
            PendingIntent intent=live.getSessionActivity();if(intent==null||!intent.isActivity()||!pkg.equals(intent.getCreatorPackage()))return sourceFallback("activity_unavailable");
            int uid=context.getPackageManager().getApplicationInfo(pkg,0).uid;
            if(uid<0||uid!=intent.getCreatorUid()||uid/100000!=android.os.Process.myUid()/100000)return sourceFallback("activity_identity_changed");
            MediaController confirmed=liveCandidate();
            if(confirmed==null||!live.getSessionToken().equals(confirmed.getSessionToken())||!intent.equals(confirmed.getSessionActivity()))return sourceFallback("session_changed");
            ActivityOptions options=ActivityOptions.makeBasic();
            options.setPendingIntentBackgroundActivityStartMode(Build.VERSION.SDK_INT>=36?
                    ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
            intent.send(context,0,null,null,null,null,options.toBundle());
            // As with ordinary island source actions, this records submission, not foreground proof.
            FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","result","session_activity_submitted");return true;
        }catch(Exception|LinkageError unavailable){
            FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","native","native_fallback:"+FeatureRuntimeLog.failure(unavailable));return false;
        }
    }
    private boolean sourceFallback(String reason){FeatureRuntimeLog.state("ISLAND_MEDIA_SOURCE","result",reason);return false;}
    void close(){
        closed=true;candidate=null;releasePanel();
        synchronized(OWNERS){WeakReference<NativeIslandMediaAdmission> ref=OWNERS.get(manager);if(ref!=null&&ref.get()==this)OWNERS.remove(manager);}
    }
    private void releasePanel(){
        if(ownedPanel!=null)try{
            MediaController bound=(MediaController)panelController.get(ownedPanel);
            if(bound==ownedController){panelUnregister.invoke(ownedPanel);panelController.set(ownedPanel,null);panelPackage.set(ownedPanel,null);}
        }catch(Exception ignored){}
        ownedPanel=null;ownedController=null;
    }
    private static Field staticField(Class<?> type,String name,Class<?> expected)throws Exception{
        for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try{
            Field field=owner.getDeclaredField(name);
            if(!Modifier.isStatic(field.getModifiers())||!expected.isAssignableFrom(field.getType()))throw new IllegalStateException(name+"_type");
            field.setAccessible(true);return field;
        }catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(name);
    }
    private static List<String> strings(Field field)throws Exception{
        Object value=field.get(null);List<?> list=value instanceof String[]?Arrays.asList((String[])value):value instanceof List?(List<?>)value:null;
        if(list==null)throw new IllegalStateException(field.getName()+"_missing");
        ArrayList<String> result=new ArrayList<>();
        for(Object item:list){if(!(item instanceof String))throw new IllegalStateException(field.getName()+"_element");result.add((String)item);}
        return result;
    }
}
