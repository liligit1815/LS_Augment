package ls.augment.com.hook;

import android.app.Notification;
import android.content.Context;
import android.content.res.Resources;
import android.provider.Settings;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** ZTE recorder's actual foreground RemoteViews; no inferred start time or fabricated controls. */
final class NativeScreenRecordingNotice {
    static final String PACKAGE="com.android.ztescreenshot",STATE="record_screen_state";
    static boolean capable(Context context){
        try{Resources r=context.getPackageManager().getResourcesForApplication(PACKAGE);
            for(String name:new String[]{"notification_text","record_notification_time","start_pause_click","stop_click"})
                if(r.getIdentifier(name,"id",PACKAGE)==0)return false;
            return r.getIdentifier("notification_layout","layout",PACKAGE)!=0;
        }catch(Exception unavailable){return false;}
    }
    static IslandEvent read(Context context,NotificationListenerService listener,int user,IslandEvent previous){
        if(listener==null||Settings.Global.getInt(context.getContentResolver(),STATE,0)==0)return null;
        try{
            StatusBarNotification[] active=listener.getActiveNotifications();if(active==null)return null;
            Resources resources=context.getPackageManager().getResourcesForApplication(PACKAGE);
            int layout=resources.getIdentifier("notification_layout","layout",PACKAGE);
            NotificationListenerService.RankingMap rankings=listener.getCurrentRanking();
            for(StatusBarNotification source:active){
                Notification n=source.getNotification();
                if(!PACKAGE.equals(source.getPackageName())||source.getUserId()!=user||!"record".equals(n.getChannelId())
                        ||(n.flags&Notification.FLAG_FOREGROUND_SERVICE)==0||n.contentView==null
                        ||!PACKAGE.equals(n.contentView.getPackage())||layout==0||n.contentView.getLayoutId()!=layout)continue;
                NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
                if(rankings==null||!rankings.getRanking(source.getKey(),rank)||rank.isSuspended()||!rank.matchesInterruptionFilter()
                        ||rank.getImportance()<android.app.NotificationManager.IMPORTANCE_LOW)continue;
                View root=n.contentView.apply(context,new FrameLayout(context));
                View label=find(root,resources,"notification_text"),time=find(root,resources,"record_notification_time");
                if(!(label instanceof TextView)||!(time instanceof TextView))continue;
                String status=((TextView)label).getText().toString();if(status.isBlank())continue;
                String count=visible(time)?((TextView)time).getText().toString():"";
                ArrayList<IslandEvent.Action> actions=new ArrayList<>();
                add(actions,root,resources,"start_pause_click","暂停／继续",listener,source,context,user);
                add(actions,root,resources,"stop_click","结束录制",listener,source,context,user);
                if(actions.isEmpty())continue;
                Object instance=previous!=null&&previous.uid==source.getUid()?previous.instance:new Object();
                return new IslandEvent("screen_record","screen_record",user,source.getUid(),instance,IslandHeadsUpBridge.revision(source),
                        "屏幕录制",status,count.isBlank()?status:count,context.getPackageManager().getApplicationIcon(PACKAGE),null,actions);
            }
        }catch(Exception unavailable){FeatureRuntimeLog.event("ISLAND_SCREEN_SOURCE","notification_contract:"+unavailable.getClass().getSimpleName());}
        return null;
    }
    private static View find(View root,Resources resources,String name){return root.findViewById(resources.getIdentifier(name,"id",PACKAGE));}
    private static boolean visible(View view){
        if(view==null)return false;
        for(View v=view;v!=null;){if(v.getVisibility()!=View.VISIBLE)return false;android.view.ViewParent p=v.getParent();v=p instanceof View?(View)p:null;}
        return true;
    }
    private static void add(List<IslandEvent.Action> actions,View root,Resources resources,String name,String title,
            NotificationListenerService listener,StatusBarNotification source,Context context,int user){
        View button=find(root,resources,name);if(!visible(button)||!button.hasOnClickListeners()||!button.isEnabled())return;
        actions.add(new IslandEvent.Action(title,()->{
            if(Settings.Global.getInt(context.getContentResolver(),STATE,0)==0)return;
            StatusBarNotification[] active=listener.getActiveNotifications(new String[]{source.getKey()});if(active==null)return;
            for(StatusBarNotification current:active)if(current.getUserId()==user&&IslandHeadsUpBridge.same(source,current)){
                button.performClick();return; // Dispatches the original RemoteViews PendingIntent.
            }
        }));
    }
    private NativeScreenRecordingNotice(){}
}
