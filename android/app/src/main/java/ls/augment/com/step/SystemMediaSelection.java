package ls.augment.com.step;

import android.media.session.*;
import java.util.List;

/** Prefer the platform's media-key session, including paused sessions and same-package tasks. */
final class SystemMediaSelection {
    static MediaController current(MediaSessionManager manager,List<MediaController> sessions){
        try{
            Object token=StepMembers.callMethod(manager,"getMediaKeyEventSession");
            for(MediaController c:sessions)if(c.getSessionToken().equals(token))return c;
        }catch(RuntimeException|LinkageError missing){}
        try{
            Object pkg=StepMembers.callMethod(manager,"getMediaKeyEventSessionPackageName");
            for(MediaController c:sessions)if(c.getPackageName().equals(pkg))return c;
        }catch(RuntimeException|LinkageError missing){}
        MediaController first=null;
        for(MediaController c:sessions){
            if(first==null)first=c;
            if(playing(c))return c;
        }
        return first;
    }
    static boolean playing(MediaController c){
        PlaybackState state=c.getPlaybackState();
        return state!=null && state.getState()==PlaybackState.STATE_PLAYING;
    }
}
