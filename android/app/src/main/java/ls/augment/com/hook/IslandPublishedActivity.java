package ls.augment.com.hook;

import android.app.*;
import android.content.Context;
import android.os.Bundle;
import android.service.notification.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import ls.augment.com.*;

/** Version 1 uses Android's authenticated notification owner and cancel/update lifecycle. */
final class IslandPublishedActivity {
    static final String EXTRA="ls.augment.island.ACTIVITY";
    private static final Set<String> TEMPLATES=Set.of("detail","progress","journey","delivery","arrival","device");
    static boolean selected(Context context,StatusBarNotification source){return IslandSceneSelection.enabled(context,"published_activity")&&declared(source);}
    static boolean declared(StatusBarNotification source){
        try{
            Notification n=source.getNotification();Bundle b=n.extras==null?null:n.extras.getBundle(EXTRA);
            if(b==null||b.getInt("version")!=1||!TEMPLATES.contains(b.getString("template","")))return false;
            String pkg=source.getPackageName();
            boolean nativeRoute=("com.autonavi.minimap".equals(pkg)||"com.baidu.BaiduMap".equals(pkg))
                    &&(Notification.CATEGORY_NAVIGATION.equals(n.category)||"com.autonavi.minimap".equals(pkg)&&"ROUTE_CHANNEL_ID".equals(n.getChannelId()));
            return !nativeRoute&&!Notification.CATEGORY_CALL.equals(n.category)&&!Notification.CATEGORY_ALARM.equals(n.category)
                    &&(n.flags&Notification.FLAG_ONGOING_EVENT)!=0&&(n.flags&Notification.FLAG_GROUP_SUMMARY)==0
                    &&!IslandNotificationText.media(n)&&!IslandNotificationText.read(source.getPackageName(),n).title.isEmpty();
        }catch(RuntimeException invalid){return false;}
    }
    static boolean allowed(Context context,NotificationListenerService listener,StatusBarNotification source,int user){
        if(source==null||user<0||source.getUserId()!=user||source.getUid()/100000!=user)return false;
        Notification n=source.getNotification();
        if(n==null||n.visibility==Notification.VISIBILITY_SECRET||n.fullScreenIntent!=null||(n.flags&Notification.FLAG_GROUP_SUMMARY)!=0)return false;
        NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
        NotificationListenerService.RankingMap map=listener.getCurrentRanking();
        if(map==null||!map.getRanking(source.getKey(),rank)||rank.isSuspended()||!rank.matchesInterruptionFilter()
                ||rank.getImportance()<NotificationManager.IMPORTANCE_LOW||(rank.getSuppressedVisualEffects()&
                (NotificationManager.Policy.SUPPRESSED_EFFECT_STATUS_BAR|NotificationManager.Policy.SUPPRESSED_EFFECT_PEEK|NotificationManager.Policy.SUPPRESSED_EFFECT_NOTIFICATION_LIST))!=0)return false;
        IslandNoticeBlacklist blocked=IslandNoticeBlacklist.parse(FeatureSettings.text(context,IslandNoticeBlacklist.KEY,""));
        IslandNoticeRules rules=IslandNoticeRules.parse(FeatureSettings.text(context,IslandNoticeRules.KEY,""));
        return blocked!=null&&!blocked.contains(user,source.getPackageName())&&rules!=null
                &&rules.resolve(user,source.getPackageName(),n.getChannelId())!=IslandNoticeRules.OFF;
    }
    private static String value(Bundle b,String key){
        CharSequence text=b.getCharSequence(key);if(text==null)return "";
        return text.subSequence(0,Math.min(text.length(),256)).toString().trim();
    }
    private record Fields(String template,String stage,String route,String eta,String vehicle,String metric,String speed,String size){
        String emphasis(){
            if(!metric.isEmpty())return metric;
            if(("arrival".equals(template)||"journey".equals(template))&&!eta.isEmpty())return "预计到达 "+eta;
            if("delivery".equals(template)||"device".equals(template))return stage;
            return "";
        }
    }
    private static Fields values(Bundle b){
        return new Fields(value(b,"template"),value(b,"stage"),value(b,"route"),value(b,"eta"),value(b,"vehicle"),value(b,"metric"),value(b,"speed"),value(b,"size"));
    }
    static void collect(Context ctx,NotificationListenerService listener,int user,Map<String,IslandEvent> out){
        if(listener==null||!IslandSceneSelection.enabled(ctx,"published_activity"))return;
        try{
            StatusBarNotification[] sources=listener.getActiveNotifications();if(sources==null)return;
            int count=0;
            for(StatusBarNotification source:sources)try{
                if(source==null||!declared(source)||!allowed(ctx,listener,source,user))continue;
                Notification n=source.getNotification();IslandNotificationContent data=IslandNotificationText.read(source.getPackageName(),n);
                Fields fields=values(n.extras.getBundle(EXTRA));IslandNotificationProgress progress=IslandNotificationText.progress(n);
                if("progress".equals(fields.template)&&!progress.present)progress=IslandNotificationProgress.of(null,null,true);
                String id="published_"+UUID.nameUUIDFromBytes((source.getUid()+"\n"+source.getKey()).getBytes(StandardCharsets.UTF_8));
                Object revision=Arrays.asList(IslandNotificationActivities.revision(source,data),fields);
                LinkedHashSet<String> lines=new LinkedHashSet<>();
                String emphasis=progress.present?"":fields.emphasis();
                if(!fields.stage.isEmpty())lines.add(fields.stage);
                if(!fields.route.isEmpty())lines.add(fields.route);
                if(!fields.eta.isEmpty())lines.add("预计到达 "+fields.eta);
                if(!fields.vehicle.isEmpty())lines.add(fields.vehicle);
                if(progress.present&&!fields.metric.isEmpty())lines.add(fields.metric);
                String transfer=String.join(" · ",nonempty(fields.speed,fields.size));if(!transfer.isEmpty())lines.add(transfer);
                if(!data.detail().isEmpty())lines.add(data.detail());
                lines.remove(emphasis);
                String compact=progress.present?progress.status():emphasis;
                if(compact.isEmpty())compact=fields.stage.isEmpty()?data.title:fields.stage;
                Runnable open=action(ctx,listener,source,revision,n.contentIntent);
                ArrayList<IslandEvent.Action> actions=new ArrayList<>();
                for(Notification.Action a:IslandDownloadSource.actions(n))if(!a.isAuthenticationRequired()){
                    Runnable send=action(ctx,listener,source,revision,a.actionIntent);if(send!=null)actions.add(new IslandEvent.Action(a.title.toString(),send));
                }
                out.put(id,new IslandEvent(id,"published_activity",user,source.getUid(),id,revision,data.title,String.join("\n",lines),compact,
                        IslandNotificationArtwork.resolve(ctx,source,"ongoing",false,null),open,actions,32).source(source.getPackageName(),n.getChannelId()).progress(progress).content(emphasis.isEmpty()?Map.of():Map.of("emphasis",emphasis)).notification(source));
                if(++count>=32)break;
            }catch(RuntimeException malformed){FeatureRuntimeLog.state("ISLAND_PUBLISHED","source","invalid_activity");}
        }catch(RuntimeException disconnected){FeatureRuntimeLog.state("ISLAND_PUBLISHED","source","listener_unavailable");}
    }
    private static List<String> nonempty(String a,String b){ArrayList<String> list=new ArrayList<>();if(!a.isEmpty())list.add(a);if(!b.isEmpty())list.add(b);return list;}
    private static Runnable action(Context ctx,NotificationListenerService listener,StatusBarNotification owner,Object revision,PendingIntent token){
        if(token==null||token.getCreatorUid()!=owner.getUid()||!owner.getPackageName().equals(token.getCreatorPackage()))return null;
        return ()->{
            try{
                StatusBarNotification[] active=listener.getActiveNotifications(new String[]{owner.getKey()});
                if(active==null||active.length!=1)return;
                StatusBarNotification live=active[0];if(!declared(live)||live.getUid()!=owner.getUid()||!allowed(ctx,listener,live,owner.getUserId())
                        ||!Objects.equals(revision,Arrays.asList(IslandNotificationActivities.revision(live,IslandNotificationText.read(live.getPackageName(),live.getNotification())),values(live.getNotification().extras.getBundle(EXTRA)))))return;
                ActivityOptions options=ActivityOptions.makeBasic();
                options.setPendingIntentBackgroundActivityStartMode(android.os.Build.VERSION.SDK_INT>=36?
                        ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
                token.send(ctx,0,null,null,null,null,options.toBundle());
            }catch(PendingIntent.CanceledException|RuntimeException missing){FeatureRuntimeLog.state("ISLAND_PUBLISHED","action","source_expired");}
        };
    }
    private IslandPublishedActivity(){}
}
