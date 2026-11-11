package ls.augment.com.step;

import android.content.Context;
import android.media.AudioManager;
import android.media.AudioPlaybackConfiguration;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import java.lang.reflect.Method;
import java.util.*;

/** A retained MediaSession alone is not evidence of current playback. */
final class WorkspacePlayback {
    final Context context;
    final AudioManager audio;
    final Map<String,Integer> uids=new HashMap<>();
    Method active,uid,state;
    int started;
    boolean reported;
    WorkspacePlayback(Context context) {
        this.context=context;audio=context.getSystemService(AudioManager.class);
        try {
            active=LocalLandscape.exact(AudioPlaybackConfiguration.class,"isActive",boolean.class);
            uid=LocalLandscape.exact(AudioPlaybackConfiguration.class,"getClientUid",int.class);
            try{
                Method playerState=LocalLandscape.exact(AudioPlaybackConfiguration.class,"getPlayerState",int.class);
                java.lang.reflect.Field constant=StepMembers.findField(AudioPlaybackConfiguration.class,"PLAYER_STATE_STARTED");
                if(constant.getType()!=int.class || !java.lang.reflect.Modifier.isStatic(constant.getModifiers()))
                    throw new NoSuchFieldException("PLAYER_STATE_STARTED");
                started=constant.getInt(null);state=playerState;
            }catch(ReflectiveOperationException|LinkageError old){state=null;}
        }catch(ReflectiveOperationException|LinkageError missing){unavailable(missing);}
    }
    void unavailable(Throwable reason){
        if(reported)return;reported=true;
        StepRuntime.diagnostic("MEDIA_PLAYBACK","local_playback_unavailable;reason="+reason);
    }
    Set<Integer> activeUids() {
        Set<Integer> result=new HashSet<>();
        if(audio==null || active==null || uid==null)return result;
        try {
            for(AudioPlaybackConfiguration config:audio.getActivePlaybackConfigurations())
                // A muted but running track still has a live music page. Newer
                // frameworks exclude some mute causes from isActive().
                if(state!=null?(Integer)state.invoke(config)==started:Boolean.TRUE.equals(active.invoke(config))) {
                    int value=(Integer)uid.invoke(config);
                    if(value>=0)result.add(value);
                    else unavailable(new IllegalStateException("playback identity is anonymized"));
                }
        }catch(Exception|LinkageError missing){unavailable(missing);}
        return result;
    }
    boolean playing(MediaController controller,Set<Integer> activeUids) {
        PlaybackState state=controller.getPlaybackState();
        if(state==null || state.getState()!=PlaybackState.STATE_PLAYING)return false;
        MediaController.PlaybackInfo output=controller.getPlaybackInfo();
        if(output!=null && output.getPlaybackType()==MediaController.PlaybackInfo.PLAYBACK_TYPE_REMOTE)return true;
        try {
            String pkg=controller.getPackageName();Integer owner=uids.get(pkg);
            if(owner==null){owner=context.getPackageManager().getApplicationInfo(pkg,0).uid;uids.put(pkg,owner);}
            return activeUids.contains(owner);
        }catch(android.content.pm.PackageManager.NameNotFoundException|RuntimeException missing){return false;}
    }
}
