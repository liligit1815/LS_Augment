package ls.augment.com.hook;

import android.app.Notification;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.service.notification.StatusBarNotification;

/** Source-only artwork. One unavailable asset must not hide another independently valid source. */
final class IslandNotificationArtwork {
    static Drawable resolve(Context context,StatusBarNotification source,String scene,boolean panel,Drawable fallback){
        if(source==null)return fallback;
        String mode=IslandContentPresentation.iconMode(context,source.getUserId(),scene,source.getPackageName(),source.getNotification().getChannelId(),panel);
        if("notifications".equals(scene)&&"auto".equals(mode)){
            Drawable sender=IslandMessageAvatar.load(context,source);if(sender!=null)return sender;
        }
        return choose(context,source.getNotification(),source.getPackageName(),mode,fallback);
    }
    static Drawable choose(Context context,Notification source,String pkg,String mode,Drawable fallback){
        String[] order="notif_small".equals(mode)?new String[]{"small","app","large"}
                :"app_icon".equals(mode)?new String[]{"app","small","large"}:new String[]{"large","small","app"};
        for(String kind:order){
            Drawable value=null;
            try{
                if("app".equals(kind))value=context.getPackageManager().getApplicationIcon(pkg);
                else if(source!=null){Icon icon="small".equals(kind)?source.getSmallIcon():source.getLargeIcon();if(icon!=null)value=icon.loadDrawable(context);}
            }catch(Exception unavailable){/* Try the next actual source; never substitute a different package. */}
            if(value!=null)return value;
        }
        return fallback;
    }
    private IslandNotificationArtwork(){ }
}
