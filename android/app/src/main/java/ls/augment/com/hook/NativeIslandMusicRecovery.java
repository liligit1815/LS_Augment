package ls.augment.com.hook;

import android.content.Context;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;
import ls.augment.com.SystemUiOptions;

/** Reconnects existing sessions to the fullscreen OEM music island; never renders a replacement. */
final class NativeIslandMusicRecovery {
    private final Context context;
    private final Object manager,permanent;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final MediaSessionManager sessions;
    private final Method accept,refresh,foreground,supported,allowed;
    private final Field controller,currentPackage,playing,foregroundPackage,cards;
    private final Runnable reconcile=this::reconcile;
    private final Runnable changed=this::request;
    private final MediaSessionManager.OnActiveSessionsChangedListener active=ignored->request();
    private Object keyListener;
    private Method removeKeyListener;
    private boolean closed,listening;

    NativeIslandMusicRecovery(Context context,Object manager,Object permanent)throws Exception{
        this.context=context;this.manager=manager;this.permanent=permanent;
        Class<?> type=manager.getClass();
        accept=MagicIslandScenes.exact(type,"handleMediaControllerList",void.class,List.class);
        refresh=MagicIslandScenes.exact(type,"refreshAfterRegisterCallback",void.class);
        foreground=MagicIslandScenes.exact(type,"handleMediaIslandFullScreen",void.class,String.class);
        supported=MagicIslandScenes.exact(type,"isSupportMediaControl",boolean.class,String.class);
        allowed=MagicIslandScenes.exact(type,"shouldShowOnMediaIsland",boolean.class,String.class);
        controller=MagicIslandScenes.typed(type,"mMediaController",MediaController.class);
        currentPackage=MagicIslandScenes.typed(type,"mCurrentPlayPkg",String.class);
        playing=MagicIslandScenes.typed(type,"mIsPlaying",boolean.class);
        foregroundPackage=MagicIslandScenes.typed(type,"mPkgName",String.class);
        cards=MagicIslandScenes.typed(permanent.getClass(),"mAppIslandList",Map.class);
        Object service=MagicIslandScenes.typed(type,"mMediaSessionManager",MediaSessionManager.class).get(manager);
        if(!(service instanceof MediaSessionManager))throw new IllegalStateException("media_service_missing");
        sessions=(MediaSessionManager)service;
    }

    void start(){
        try{
            sessions.addOnActiveSessionsChangedListener(active,null,main);listening=true;
            listenForMediaKeys();
            FeatureSettings.addSnapshotListener(context,changed);
            request(); // Android's active-session listener does not deliver the initial snapshot.
        }catch(RuntimeException failure){close();report("unavailable:"+FeatureRuntimeLog.failure(failure));}
    }

    void request(){
        if(closed)return;
        main.removeCallbacks(reconcile);
        // TaskStack callbacks can precede the native foreground listener on the same main loop.
        main.postDelayed(reconcile,100);
    }

    private void listenForMediaKeys(){
        try{
            Class<?> listener=Class.forName("android.media.session.MediaSessionManager$OnMediaKeyEventSessionChangedListener");
            Method add=MagicIslandScenes.exact(sessions.getClass(),"addOnMediaKeyEventSessionChangedListener",void.class,Executor.class,listener);
            removeKeyListener=MagicIslandScenes.exact(sessions.getClass(),"removeOnMediaKeyEventSessionChangedListener",void.class,listener);
            keyListener=Proxy.newProxyInstance(listener.getClassLoader(),new Class<?>[]{listener},(proxy,method,args)->{
                if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
                if(method.getName().equals("equals"))return args!=null&&args.length==1&&proxy==args[0];
                if(method.getName().equals("toString"))return "DuoNativeMusicSessionListener";
                if(method.getName().equals("onMediaKeyEventSessionChanged"))request();
                return null;
            });
            add.invoke(sessions,(Executor)task->main.post(task),keyListener);
        }catch(Exception unavailable){
            if(keyListener!=null&&removeKeyListener!=null)try{removeKeyListener.invoke(sessions,keyListener);}catch(Exception ignored){}
            keyListener=null;removeKeyListener=null;
            report("media_key_listener_unavailable:"+FeatureRuntimeLog.failure(unavailable));
        }
    }

    private void reconcile(){
        if(closed||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)||!IslandSceneSelection.enabled(context,"media"))return;
        try{
            int user=(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
            // These public APIs are scoped to the caller's user. Do not replay another user's session.
            if(user!=android.os.Process.myUid()/100000){report("native_fallback:user_scope");return;}
            Object top=foregroundPackage.get(manager);
            // The OEM refresh entry can add a playing card. Its foreground exclusion must be ready first.
            if(!(top instanceof String)||((String)top).isEmpty()){report("native_fallback:foreground_not_ready");return;}
            String pkg=sessions.getMediaKeyEventSessionPackageName();
            if(pkg==null||pkg.isEmpty()||!Boolean.TRUE.equals(supported.invoke(manager,pkg))
                    ||!Boolean.TRUE.equals(allowed.invoke(manager,pkg))){report("native_fallback:no_eligible_media_key_session");return;}
            MediaSession.Token token=sessions.getMediaKeyEventSession();
            List<MediaController> values=sessions.getActiveSessions(null);
            MediaController selected=null;
            for(MediaController value:values){
                if(!pkg.equals(value.getPackageName())||(token!=null&&!token.equals(value.getSessionToken())))continue;
                if(selected!=null){report("native_fallback:ambiguous_session");return;}
                selected=value;
            }
            if(selected==null){report("native_fallback:session_not_ready");return;}
            // A source can change while its list is queried. Retry only on the next real event.
            if(!pkg.equals(sessions.getMediaKeyEventSessionPackageName())
                    ||!Objects.equals(token,sessions.getMediaKeyEventSession())
                    ||user!=(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null)){
                report("native_fallback:source_changed");return;
            }
            MediaController before=(MediaController)controller.get(manager);
            boolean rebound=before==null||!selected.getSessionToken().equals(before.getSessionToken())
                    ||!pkg.equals(currentPackage.get(manager));
            PlaybackState state=selected.getPlaybackState();
            boolean isPlaying=state!=null&&state.getState()==PlaybackState.STATE_PLAYING;
            if(rebound)accept.invoke(manager,Collections.singletonList(selected));
            else if(playing.getBoolean(manager)!=isPlaying)refresh.invoke(manager);
            MediaController bound=(MediaController)controller.get(manager);
            if(bound==null||!selected.getSessionToken().equals(bound.getSessionToken())
                    ||!pkg.equals(currentPackage.get(manager))){report("native_fallback:native_selection_not_applied");return;}
            Object registry=cards.get(permanent);
            boolean missing=registry instanceof Map&&!((Map<?,?>)registry).containsKey("media_island");
            if(isPlaying&&playing.getBoolean(manager)&&missing&&top instanceof String&&!((String)top).isEmpty()){
                // Native allow/exclude lists, scene switch, foreground, privacy and layout gates remain authoritative.
                foreground.invoke(manager,top);
            }
            Object after=cards.get(permanent);
            report("session;rebound="+rebound+";playing="+isPlaying+";foregroundKnown="+(top instanceof String)
                    +";card="+(after instanceof Map&&((Map<?,?>)after).containsKey("media_island")));
        }catch(Exception|LinkageError failure){report("native_fallback:"+FeatureRuntimeLog.failure(failure));}
    }

    private static void report(String state){FeatureRuntimeLog.state("ISLAND_MUSIC_RECOVERY",state,state);}

    void close(){
        closed=true;main.removeCallbacks(reconcile);FeatureSettings.removeSnapshotListener(changed);
        if(listening)try{sessions.removeOnActiveSessionsChangedListener(active);}catch(RuntimeException ignored){}
        listening=false;
        if(keyListener!=null&&removeKeyListener!=null)try{removeKeyListener.invoke(sessions,keyListener);}catch(Exception ignored){}
        keyListener=null;removeKeyListener=null;
    }
}
