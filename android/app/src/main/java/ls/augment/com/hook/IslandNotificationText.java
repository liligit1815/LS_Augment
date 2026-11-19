package ls.augment.com.hook;

import android.app.Notification;
import android.os.Bundle;
import ls.augment.com.IslandNotificationContent;

/** Standard Android payload shared by compact, expanded and continuous notifications. */
final class IslandNotificationText {
    static IslandNotificationContent read(String pkg,Notification notification){
        Bundle extras=notification==null?null:notification.extras;
        CharSequence title=text(extras,Notification.EXTRA_TITLE);
        if(title==null||title.length()==0)title=text(extras,Notification.EXTRA_TITLE_BIG);
        CharSequence[] lines=null;
        try{if(extras!=null)lines=extras.getCharSequenceArray(Notification.EXTRA_TEXT_LINES);}
        catch(RuntimeException malformed){/* Preserve the other independently readable source fields. */}
        return new IslandNotificationContent(pkg,notification==null?"":notification.getChannelId(),title,
                text(extras,Notification.EXTRA_TEXT),text(extras,Notification.EXTRA_SUB_TEXT),
                text(extras,Notification.EXTRA_BIG_TEXT),text(extras,Notification.EXTRA_INFO_TEXT),lines);
    }
    private static CharSequence text(Bundle extras,String key){
        try{return extras==null?null:extras.getCharSequence(key);}
        catch(RuntimeException malformed){return null;}
    }
    static ls.augment.com.IslandNotificationProgress progress(Notification notification){
        Bundle extras=notification==null?null:notification.extras;
        try{return extras==null?ls.augment.com.IslandNotificationProgress.NONE:
                ls.augment.com.IslandNotificationProgress.of(extras.get(Notification.EXTRA_PROGRESS),
                        extras.get(Notification.EXTRA_PROGRESS_MAX),extras.get(Notification.EXTRA_PROGRESS_INDETERMINATE));}
        catch(RuntimeException malformed){return ls.augment.com.IslandNotificationProgress.NONE;}
    }
    static boolean media(Notification n){
        if(n==null||n.extras==null)return false;
        if(n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION))return true;
        try{String template=n.extras.getString(Notification.EXTRA_TEMPLATE,"");return template!=null
                &&(template.contains("MediaStyle")||template.endsWith("DecoratedMediaCustomViewStyle"));}
        catch(RuntimeException malformed){return false;}
    }
    private IslandNotificationText(){}
}
