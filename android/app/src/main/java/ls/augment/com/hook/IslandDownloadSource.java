package ls.augment.com.hook;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;
import ls.augment.com.IslandDownloadConfig;
import ls.augment.com.IslandDownloadPolicy;

/** Reads existing source notifications only. No synthetic notifications, downloads or task controls. */
final class IslandDownloadSource {
    final IslandDownloadPolicy<StatusBarNotification> activities=new IslandDownloadPolicy<>();
    private final Context context;
    private final LinkedHashMap<String,String> discovered=new LinkedHashMap<>();
    private int user=-1;
    IslandDownloadSource(Context context){this.context=context;}
    void user(int next){if(user!=next){user=next;clear();discovered.clear();publishChannels();}}
    void clear(){activities.clear();}
    boolean enabled(){return FeatureSettings.enabled(context,IslandDownloadConfig.ENABLED);}
    Set<String> selected(){return IslandDownloadConfig.selected(FeatureSettings.text(context,IslandDownloadConfig.CHANNELS,""));}
    void configure(){if(!enabled())clear();else activities.retainChannels(selected());}
    private boolean permitted(StatusBarNotification sbn,NotificationListenerService.RankingMap map,boolean discovery){
        Notification n=sbn.getNotification();
        if(user<0||sbn.getUserId()!=user||sbn.getUid()/100000!=user||n==null||n.extras==null
                ||n.visibility==Notification.VISIBILITY_SECRET||(n.flags&Notification.FLAG_GROUP_SUMMARY)!=0
                ||n.extras.containsKey(Notification.EXTRA_MEDIA_SESSION))return false;
        NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
        if(map==null||!map.getRanking(sbn.getKey(),rank)||rank.isSuspended())return false;
        // Progress channels commonly use LOW importance: selection explicitly opts into their island.
        return rank.getImportance()>=NotificationManager.IMPORTANCE_LOW&&(discovery||rank.matchesInterruptionFilter()
                &&(rank.getSuppressedVisualEffects()&(NotificationManager.Policy.SUPPRESSED_EFFECT_STATUS_BAR
                |NotificationManager.Policy.SUPPRESSED_EFFECT_PEEK|NotificationManager.Policy.SUPPRESSED_EFFECT_NOTIFICATION_LIST))==0);
    }
    private static boolean hasProgress(Notification n){return n.extras!=null
            &&IslandDownloadPolicy.progress(n.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE,false),
                n.extras.getInt(Notification.EXTRA_PROGRESS,-1),n.extras.getInt(Notification.EXTRA_PROGRESS_MAX,0));}
    boolean posted(StatusBarNotification sbn,NotificationListenerService.RankingMap map){
        Notification n=sbn.getNotification();String key=IslandDownloadConfig.channel(sbn.getUserId(),sbn.getPackageName(),n.getChannelId());
        boolean progress=hasProgress(n),ongoing=(n.flags&Notification.FLAG_ONGOING_EVENT)!=0;
        if(!key.isEmpty()&&progress&&ongoing&&permitted(sbn,map,true)){
            NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();map.getRanking(sbn.getKey(),rank);
            CharSequence name=rank.getChannel()==null?null:rank.getChannel().getName();
            String label=name==null?n.getChannelId():name.toString();if(label.length()>64)label=label.substring(0,64);
            if(!label.equals(discovered.get(key))){discovered.remove(key);discovered.put(key,label);publishChannels();}
        }
        boolean selected=enabled()&&selected().contains(key);
        boolean tracked=activities.get(sbn.getKey())!=null;
        if(!selected||!permitted(sbn,map,false)){
            activities.remove(sbn.getKey(),sbn.getUid(),sbn.getPostTime());return tracked;
        }
        activities.update(sbn.getKey(),key,sbn.getUid(),sbn.getPostTime(),ongoing,
                n.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE,false),
                n.extras.getInt(Notification.EXTRA_PROGRESS,-1),n.extras.getInt(Notification.EXTRA_PROGRESS_MAX,0),sbn);
        // Completion updates in a selected download channel must not re-enter the transient notice path.
        return tracked||progress;
    }
    void removed(StatusBarNotification sbn){activities.remove(sbn.getKey(),sbn.getUid(),sbn.getPostTime());}
    void reconcile(StatusBarNotification[] active,NotificationListenerService.RankingMap map){
        if(active==null){clear();return;}
        Set<String> keys=new HashSet<>();
        for(StatusBarNotification sbn:active)if(sbn!=null){keys.add(sbn.getKey());posted(sbn,map);}
        activities.retainKeys(keys);
    }
    void ranking(NotificationListenerService.RankingMap map){
        Set<String> keep=new HashSet<>();
        // A snapshot from the listener is preferred by the caller. Unknown/inaccessible rankings fail closed.
        for(String key:activities.keys()){
            IslandDownloadPolicy.Entry<StatusBarNotification> e=activities.get(key);
            if(e!=null&&permitted(e.source,map,false))keep.add(key);
        }
        activities.retainKeys(keep);
    }
    boolean allowsAction(StatusBarNotification current,NotificationListenerService.RankingMap map,
            IslandDownloadPolicy.Entry<StatusBarNotification> entry,PendingIntent intent){
        if(!current(entry,intent)||current==null||!current.getKey().equals(entry.key)||current.getUid()!=entry.uid
                ||current.getPostTime()!=entry.postedAt||!permitted(current,map,false))return false;
        Notification n=current.getNotification();
        if((n.flags&Notification.FLAG_ONGOING_EVENT)==0||!hasProgress(n)
                ||!n.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE,false)
                &&n.extras.getInt(Notification.EXTRA_PROGRESS,-1)==n.extras.getInt(Notification.EXTRA_PROGRESS_MAX,0))return false;
        if(intent.equals(n.contentIntent))return true;
        for(Notification.Action action:actions(n))if(intent.equals(action.actionIntent))return true;
        return false;
    }
    static List<Notification.Action> actions(Notification n){
        List<Notification.Action> result=new ArrayList<>();
        if(n.actions!=null)for(Notification.Action action:n.actions){
            if(action==null||action.actionIntent==null||action.title==null||action.title.length()==0
                    ||action.getRemoteInputs()!=null&&action.getRemoteInputs().length>0
                    ||action.getDataOnlyRemoteInputs()!=null&&action.getDataOnlyRemoteInputs().length>0)continue;
            result.add(action);if(result.size()==3)break;
        }
        return result;
    }
    boolean current(IslandDownloadPolicy.Entry<StatusBarNotification> entry,PendingIntent intent){
        if(entry==null||!enabled()||!selected().contains(entry.channel)||activities.get(entry.key)!=entry)return false;
        Notification n=entry.source.getNotification();
        if(intent==null)return false;
        if(intent.equals(n.contentIntent))return true;
        for(Notification.Action action:actions(n))if(intent.equals(action.actionIntent))return true;
        return false;
    }
    private void publishChannels(){
        try{
            String json;
            do{
                JSONArray list=new JSONArray();
                for(Map.Entry<String,String> entry:discovered.entrySet())
                    list.put(new JSONObject().put("key",entry.getKey()).put("name",entry.getValue()));
                json=new JSONObject().put("user",user).put("channels",list).toString();
                if(json.length()<=1800)break;
                discovered.remove(discovered.keySet().iterator().next());
            }while(!discovered.isEmpty());
            FeatureSettings.diagnostic(context,IslandDownloadConfig.DISCOVERED,json);
        }catch(org.json.JSONException invalid){/* No content or task identifiers are persisted. */}
    }
}
