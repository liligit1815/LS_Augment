package ls.augment.com.hook;

import android.app.Notification;
import android.app.Person;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.os.Parcelable;
import android.service.notification.StatusBarNotification;
import java.util.List;

final class IslandMessageAvatar {
    static Drawable load(Context context,StatusBarNotification source){
        try{
            Parcelable[] raw=source.getNotification().extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            if(raw==null)return null;
            List<Notification.MessagingStyle.Message> messages=Notification.MessagingStyle.Message.getMessagesFromBundleArray(raw);
            if(messages.isEmpty())return null;
            Person sender=messages.get(messages.size()-1).getSenderPerson();Icon icon=sender==null?null:sender.getIcon();
            if(icon==null)return null;
            int type=icon.getType();
            if(type!=Icon.TYPE_BITMAP&&type!=Icon.TYPE_ADAPTIVE_BITMAP
                    &&!(type==Icon.TYPE_RESOURCE&&source.getPackageName().equals(icon.getResPackage())))return null;
            return icon.loadDrawable(context);
        }catch(RuntimeException malformed){return null;}
    }
    private IslandMessageAvatar(){}
}
