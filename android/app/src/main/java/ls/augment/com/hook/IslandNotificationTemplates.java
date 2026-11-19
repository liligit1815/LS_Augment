package ls.augment.com.hook;

import android.app.Notification;
import android.content.Context;
import android.service.notification.StatusBarNotification;
import ls.augment.com.IslandTemplateRules;
import ls.augment.com.IslandDownloadConfig;

/** One template owner across alert, ongoing, count and transfer paths. */
final class IslandNotificationTemplates {
    static int mode(Context context,StatusBarNotification source){
        try{
            Notification n=source.getNotification();String pkg=source.getPackageName();
            // Dedicated business sources keep their actual native control contract.
            if(n==null||n.extras==null||IslandNotificationText.media(n)
                    ||Notification.CATEGORY_TRANSPORT.equals(n.category)||Notification.CATEGORY_NAVIGATION.equals(n.category)
                    ||Notification.CATEGORY_CALL.equals(n.category)||Notification.CATEGORY_ALARM.equals(n.category)
                    ||n.contentView!=null||n.bigContentView!=null||n.headsUpContentView!=null
                    ||IslandDownloadConfig.PROVIDER_PACKAGE.equals(pkg)||"com.android.systemui".equals(pkg)
                    ||"com.android.ztescreenshot".equals(pkg)
                    ||"com.autonavi.minimap".equals(pkg)&&"ROUTE_CHANNEL_ID".equals(n.getChannelId()))return IslandTemplateRules.AUTO;
            IslandTemplateRules rules=IslandTemplateRules.parse(FeatureSettings.text(context,IslandTemplateRules.KEY,""));
            return rules==null?-1:rules.resolve(source.getUserId(),pkg,n.getChannelId()==null?"":n.getChannelId());
        }catch(RuntimeException malformed){return -1;}
    }
    static boolean selected(Context context,StatusBarNotification source,String scene,boolean legacy){
        int mode=mode(context,source);if(mode==IslandTemplateRules.AUTO)return legacy;
        if(mode<0)return false;
        if(mode==IslandTemplateRules.COUNT)return "notification_count".equals(scene);
        boolean progress=IslandNotificationText.progress(source.getNotification()).present;
        boolean ongoing=(source.getNotification().flags&Notification.FLAG_ONGOING_EVENT)!=0;
        if(mode==IslandTemplateRules.PROGRESS&&progress&&ongoing)return "downloads".equals(scene);
        // Text keeps an ongoing notification alive; ordinary notices retain their
        // bounded alert lifecycle. Missing progress falls back to actual source text.
        return ongoing?"ongoing".equals(scene):"notifications".equals(scene);
    }
    static boolean notice(Context context,StatusBarNotification source){return selected(context,source,"notifications",true);}
    private IslandNotificationTemplates(){}
}
