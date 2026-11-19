package ls.augment.com.hook;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import ls.augment.com.IslandDownloadConfig;
import ls.augment.com.IslandNotificationContent;
import ls.augment.com.IslandOngoingConfig;
import ls.augment.com.SystemUiOptions;
import org.json.JSONArray;
import org.json.JSONObject;

/** Continuous source snapshots, independent of transient alert deduplication and expiry. */
class IslandNotificationActivities {
    private static final int LIMIT=32;
    private static final int COUNT_LIMIT=256;
    private final Context context;
    private final boolean counting;
    private final String scene,channelsKey,discoveredKey;
    private long order;
    private final Map<String,Object> scopes=new HashMap<>();
    private final Map<String,Entry> entries=new LinkedHashMap<>();
    private final LinkedHashMap<String,long[]> removed=new LinkedHashMap<>();
    private final LinkedHashMap<String,String> discovered=new LinkedHashMap<>();
    private int user=-1;
    private boolean closed;
    private String lastDiscovery="";
    private static final class Entry {
        final Object instance=new Object();final String key;final int uid;
        StatusBarNotification source;
        long posts=1,order;
        Entry(StatusBarNotification source){this.source=source;uid=source.getUid();key=key(source);}
    }
    IslandNotificationActivities(Context context,boolean counting){
        this.context=context;this.counting=counting;
        scene=counting?"notification_count":"ongoing";
        channelsKey=counting?ls.augment.com.IslandCountConfig.CHANNELS:IslandOngoingConfig.CHANNELS;
        discoveredKey=counting?ls.augment.com.IslandCountConfig.DISCOVERED:IslandOngoingConfig.DISCOVERED;
    }

    Map<String,IslandEvent> snapshot(NotificationListenerService listener,int currentUser,boolean visible){
        Map<String,IslandEvent> result=new LinkedHashMap<>();
        if(closed)return result;
        if(user!=currentUser){entries.clear();removed.clear();discovered.clear();scopes.clear();lastDiscovery="";user=currentUser;order=0;}
        if(user<0||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)){entries.clear();scopes.clear();return result;}
        if(listener==null){entries.clear();scopes.clear();return result;}
        try{
            StatusBarNotification[] sources=listener.getActiveNotifications();
            if(sources==null){entries.clear();scopes.clear();return result;}
            NotificationListenerService.RankingMap ranking=listener.getCurrentRanking();
            Set<String> selected=IslandDownloadConfig.selected(FeatureSettings.text(context,channelsKey,""));
            Set<String> live=new HashSet<>();
            Map<String,List<Entry>> groups=new LinkedHashMap<>();
            for(StatusBarNotification source:sources){
                if(source==null||!eligible(source))continue;
                long[] terminal=removed.get(source.getKey());
                if(terminal!=null&&terminal[0]==source.getUid()){
                    if(source.getPostTime()<=terminal[1])continue;
                    removed.remove(source.getKey());
                }
                Notification n=source.getNotification();
                NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
                if(ranking==null||!ranking.getRanking(source.getKey(),rank)||rank.isSuspended()
                        ||rank.getImportance()<NotificationManager.IMPORTANCE_LOW)continue;
                String channel=IslandDownloadConfig.channel(user,source.getPackageName(),n.getChannelId());
                if(channel.isEmpty())continue;
                CharSequence label=rank.getChannel()==null?null:rank.getChannel().getName();
                String name=label==null?n.getChannelId():label.toString();
                if(name.length()>64)name=name.substring(0,64);
                discovered.put(channel,name);
                while(discovered.size()>LIMIT)discovered.remove(discovered.keySet().iterator().next());
                if(!IslandNotificationTemplates.selected(context,source,scene,selected.contains(channel))||!IslandSceneSelection.enabled(context,scene))continue;
                if(live.size()>=(counting?COUNT_LIMIT:LIMIT)&&!live.contains(source.getKey())){
                    if(counting){entries.clear();scopes.clear();result.clear();FeatureRuntimeLog.state("ISLAND_NOTIFICATION_SOURCE","count_capacity","count_capacity;native_notifications_retained");publishChannels();return result;}
                    continue;
                }
                live.add(source.getKey());Entry entry=entries.get(source.getKey());
                if(entry==null||entry.uid!=source.getUid()){entry=new Entry(source);entry.order=++order;entries.put(source.getKey(),entry);}
                if(source.getPostTime()>=entry.source.getPostTime())entry.source=source;
                else source=entry.source;
                if(!visible||!canShow(rank))continue;
                if(counting){groups.computeIfAbsent(channel,k->new ArrayList<>()).add(entry);continue;}
                IslandNotificationContent data=content(source);if(!data.hasContent())continue;
                String title=data.title.isEmpty()?appLabel(source.getPackageName()):data.title;
                Object revision=revision(source,data);Entry current=entry;
                Notification payload=entry.source.getNotification();
                Runnable open=payload.contentIntent==null?null:()->send(listener,current,revision,payload.contentIntent);
                List<IslandEvent.Action> actions=new ArrayList<>();
                for(Notification.Action action:IslandDownloadSource.actions(payload)){
                    if(action.isAuthenticationRequired())continue;
                    actions.add(new IslandEvent.Action(action.title.toString(),()->send(listener,current,revision,action.actionIntent)));
                }
                ls.augment.com.IslandNotificationProgress progress=IslandNotificationText.progress(payload);
                Map<String,String> fields=ls.augment.com.IslandContentRules.variables(data,appLabel(source.getPackageName()),source.getPackageName(),payload.getChannelId());
                fields.put("progress",progress.text());fields.put("state",progress.status());
                if(data.proxyRates){fields.put("emphasis",data.text);fields.put("rate_detail",data.detail(false));}
                result.put(entry.key,new IslandEvent(entry.key,scene,user,source.getUid(),entry.instance,revision,
                        title,data.detail(),data.compact(),IslandNotificationArtwork.resolve(context,source,scene,false,null),open,actions,64).source(source.getPackageName(),payload.getChannelId())
                        .content(fields).progress(progress).expandedIcon(IslandNotificationArtwork.resolve(context,source,scene,true,null)).notification(source));
            }
            if(counting)for(Map.Entry<String,List<Entry>> group:groups.entrySet()){
                Entry recent=null;long total=0;
                for(Entry value:group.getValue()){
                    total=total>Long.MAX_VALUE-value.posts?Long.MAX_VALUE:total+value.posts;
                    if(recent==null||value.order>recent.order)recent=value;
                }
                if(recent==null)continue;
                Entry selectedEntry=recent;StatusBarNotification source=recent.source;Notification n=source.getNotification();
                IslandNotificationContent data=content(source);Object revision=revision(source,data);
                Runnable open=n.contentIntent==null?null:()->send(listener,selectedEntry,revision,n.contentIntent);
                List<IslandEvent.Action> actions=new ArrayList<>();
                for(Notification.Action action:IslandDownloadSource.actions(n))if(!action.isAuthenticationRequired())
                    actions.add(new IslandEvent.Action(action.title.toString(),()->send(listener,selectedEntry,revision,action.actionIntent)));
                String id="count_"+key(source.getUid(),group.getKey());
                Object instance=scopes.computeIfAbsent(group.getKey(),k->new Object());
                String detail="当前活动通知发布 "+total+" 次 · "+group.getValue().size()+" 条通知\n";
                if(!data.title.isEmpty())detail+=data.title+"\n";
                detail+=data.detail();
                Map<String,String> fields=ls.augment.com.IslandContentRules.variables(data,appLabel(source.getPackageName()),source.getPackageName(),n.getChannelId());
                fields.put("count",String.valueOf(total));fields.put("notification_count",String.valueOf(group.getValue().size()));
                result.put(id,new IslandEvent(id,scene,user,source.getUid(),instance,Arrays.asList(revision,total,group.getValue().size()),
                        appLabel(source.getPackageName()),detail,total+" 次",IslandNotificationArtwork.resolve(context,source,scene,false,null),open,actions,64).source(source.getPackageName(),n.getChannelId()).content(fields)
                        .expandedIcon(IslandNotificationArtwork.resolve(context,source,scene,true,null)).notification(source));
            }
            if(counting){Set<String> retained=new HashSet<>();for(String key:live){Entry e=entries.get(key);if(e!=null)retained.add(channel(e.source));}scopes.keySet().retainAll(retained);}
            entries.keySet().retainAll(live);publishChannels();
        }catch(RuntimeException failure){
            entries.clear();scopes.clear();result.clear();FeatureRuntimeLog.event("ISLAND_NOTIFICATION_SOURCE",scene+":"+failure.getClass().getSimpleName());
        }
        return result;
    }

    private boolean eligible(StatusBarNotification source){
        if(IslandPublishedActivity.selected(context,source))return false;
        Notification n=source.getNotification();
        if(source.getUserId()!=user||source.getUid()/100000!=user||n==null||n.extras==null
                ||(!counting&&(n.flags&Notification.FLAG_ONGOING_EVENT)==0)||(n.flags&Notification.FLAG_GROUP_SUMMARY)!=0
                ||n.visibility==Notification.VISIBILITY_SECRET||n.fullScreenIntent!=null)return false;
        // These sources have their own state/control contracts. Never reclassify them as generic status.
        if(IslandNotificationText.media(n)
                ||Notification.CATEGORY_TRANSPORT.equals(n.category)||Notification.CATEGORY_NAVIGATION.equals(n.category)
                ||Notification.CATEGORY_CALL.equals(n.category)||Notification.CATEGORY_ALARM.equals(n.category))return false;
        boolean progressSource=n.extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE,false)||n.extras.getInt(Notification.EXTRA_PROGRESS_MAX,0)>0;
        if(progressSource){
            // Explicit ongoing selection may represent non-download work (sync/processing).
            // A selected transfer channel and the system download provider keep their own owner.
            if(counting&&IslandNotificationTemplates.mode(context,source)!=ls.augment.com.IslandTemplateRules.COUNT
                    ||!IslandNotificationText.progress(n).present||IslandDownloadConfig.PROVIDER_PACKAGE.equals(source.getPackageName())
                    ||!counting&&FeatureSettings.enabled(context,IslandDownloadConfig.ENABLED)
                    &&IslandNotificationTemplates.selected(context,source,"downloads",IslandDownloadConfig.selected(FeatureSettings.text(context,IslandDownloadConfig.CHANNELS,"")).contains(channel(source))))return false;
        }
        String pkg=source.getPackageName();
        if(counting&&!ordinaryAllowed(source))return false;
        if(!counting&&!progressSource&&IslandSceneSelection.enabled(context,"notification_count")&&ordinaryAllowed(source)
                &&IslandNotificationTemplates.selected(context,source,"notification_count",IslandDownloadConfig.selected(FeatureSettings.text(context,ls.augment.com.IslandCountConfig.CHANNELS,"")).contains(channel(source))))return false;
        if("com.android.ztescreenshot".equals(pkg)||"com.android.systemui".equals(pkg)
                ||"com.autonavi.minimap".equals(pkg)&&"ROUTE_CHANNEL_ID".equals(n.getChannelId()))return false;
        // A custom view may carry controls/text absent from extras. Keep its native notification.
        return n.contentView==null&&n.bigContentView==null&&n.headsUpContentView==null;
    }
    private boolean ordinaryAllowed(StatusBarNotification source){
        ls.augment.com.IslandNoticeBlacklist blacklist=ls.augment.com.IslandNoticeBlacklist.parse(FeatureSettings.text(context,ls.augment.com.IslandNoticeBlacklist.KEY,""));
        ls.augment.com.IslandNoticeRules rules=ls.augment.com.IslandNoticeRules.parse(FeatureSettings.text(context,ls.augment.com.IslandNoticeRules.KEY,""));
        return blacklist!=null&&!blacklist.contains(user,source.getPackageName())&&rules!=null
                &&rules.resolve(user,source.getPackageName(),source.getNotification().getChannelId())!=ls.augment.com.IslandNoticeRules.OFF;
    }
    private static boolean canShow(NotificationListenerService.Ranking rank){
        return rank.matchesInterruptionFilter()&&(rank.getSuppressedVisualEffects()&
                (NotificationManager.Policy.SUPPRESSED_EFFECT_STATUS_BAR|NotificationManager.Policy.SUPPRESSED_EFFECT_PEEK
                        |NotificationManager.Policy.SUPPRESSED_EFFECT_NOTIFICATION_LIST))==0;
    }
    private static IslandNotificationContent content(StatusBarNotification source){
        return IslandNotificationText.read(source.getPackageName(),source.getNotification());
    }
    static Object revision(StatusBarNotification source,IslandNotificationContent data){
        Notification n=source.getNotification();List<Object> actions=new ArrayList<>();
        if(n.actions!=null)for(Notification.Action action:n.actions)if(action!=null)
            actions.add(Arrays.asList(String.valueOf(action.title),action.actionIntent,action.isAuthenticationRequired(),
                    action.getRemoteInputs()!=null,action.getDataOnlyRemoteInputs()!=null));
        return Arrays.asList(source.getUserId(),source.getUid(),source.getKey(),source.getPostTime(),n.flags,
                n.visibility,n.getChannelId(),data.identity(),IslandNotificationText.progress(n).identity(),n.contentIntent,actions);
    }
    private void send(NotificationListenerService listener,Entry entry,Object revision,PendingIntent intent){
        if(closed||intent==null||entries.get(entry.source.getKey())!=entry||!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)||!IslandSceneSelection.enabled(context,scene))return;
        try{
            int current=(Integer)Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
            if(current!=user)return;
            StatusBarNotification[] sources=listener.getActiveNotifications(new String[]{entry.source.getKey()});
            if(sources==null)return;
            for(StatusBarNotification source:sources){
                if(!eligible(source)||source.getUid()!=entry.uid||!source.getKey().equals(entry.source.getKey())
                        ||!revision.equals(revision(source,content(source))))continue;
                NotificationListenerService.Ranking rank=new NotificationListenerService.Ranking();
                NotificationListenerService.RankingMap ranking=listener.getCurrentRanking();
                if(ranking==null||!ranking.getRanking(source.getKey(),rank)||rank.isSuspended()
                        ||rank.getImportance()<NotificationManager.IMPORTANCE_LOW||!canShow(rank))return;
                if(!selectedForTemplate(source))return;
                android.app.ActivityOptions options=android.app.ActivityOptions.makeBasic();
                options.setPendingIntentBackgroundActivityStartMode(android.os.Build.VERSION.SDK_INT>=36?
                        android.app.ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS:android.app.ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
                intent.send(context,0,null,null,null,null,options.toBundle());return;
            }
        }catch(Exception failure){FeatureRuntimeLog.event("ISLAND_ONGOING_ACTION",failure.getClass().getSimpleName());}
    }
    void removed(StatusBarNotification source){
        if(closed||source.getUserId()!=user)return;
        Entry entry=entries.get(source.getKey());
        if(entry!=null&&(source.getUid()!=entry.uid||source.getPostTime()<entry.source.getPostTime()))return;
        entries.remove(source.getKey());
        if(counting){String scope=channel(source);boolean present=false;for(Entry remaining:entries.values())present|=scope.equals(channel(remaining.source));if(!present)scopes.remove(scope);}
        removed.put(source.getKey(),new long[]{source.getUid(),source.getPostTime()});
        while(removed.size()>128)removed.remove(removed.keySet().iterator().next());
    }
    void posted(StatusBarNotification source){
        if(source==null)return;
        try{postedSource(source);}
        catch(RuntimeException malformed){
            entries.remove(source.getKey());
            FeatureRuntimeLog.event("ISLAND_NOTIFICATION_SOURCE",scene+":post_unavailable:"+malformed.getClass().getSimpleName());
        }
    }
    private void postedSource(StatusBarNotification source){
        if(closed||source.getUserId()!=user)return;
        long[] terminal=removed.get(source.getKey());
        if(terminal!=null&&(terminal[0]!=source.getUid()||source.getPostTime()>=terminal[1]))removed.remove(source.getKey());
        Entry entry=entries.get(source.getKey());
        if(counting){
            if(!FeatureSettings.enabled(context,SystemUiOptions.ISLAND)||!IslandSceneSelection.enabled(context,scene)||!eligible(source)
                    ||!selectedForTemplate(source)){entries.remove(source.getKey());return;}
            if(entry!=null&&entry.uid==source.getUid()&&source.getPostTime()<entry.source.getPostTime())return;
            if(entry==null||entry.uid!=source.getUid()||!channel(entry.source).equals(channel(source))){
                if(entries.size()>=COUNT_LIMIT)return;
                entry=new Entry(source);entries.put(source.getKey(),entry);
            }else if(entry.posts<Long.MAX_VALUE)entry.posts++;
            entry.source=source;entry.order=++order;return;
        }
        if(entry!=null&&entry.uid==source.getUid()&&source.getPostTime()>=entry.source.getPostTime())entry.source=source;
    }
    boolean selected(StatusBarNotification source){
        try{return source!=null&&!closed&&counting&&eligible(source)&&IslandSceneSelection.enabled(context,scene)&&FeatureSettings.enabled(context,SystemUiOptions.ISLAND)
                &&selectedForTemplate(source);}
        catch(RuntimeException malformed){return false;}
    }
    private String channel(StatusBarNotification source){return IslandDownloadConfig.channel(user,source.getPackageName(),source.getNotification().getChannelId());}
    private boolean selectedForTemplate(StatusBarNotification source){return IslandNotificationTemplates.selected(context,source,scene,
            IslandDownloadConfig.selected(FeatureSettings.text(context,channelsKey,"")).contains(channel(source)));}
    void close(){closed=true;entries.clear();removed.clear();discovered.clear();scopes.clear();}
    private String appLabel(String pkg){try{return context.getPackageManager().getApplicationLabel(
            context.getPackageManager().getApplicationInfo(pkg,0)).toString();}catch(Exception absent){return pkg;}}
    private static String key(StatusBarNotification source){
        return "ongoing_"+key(source.getUid(),source.getKey());
    }
    private static String key(int uid,String identity){
        try{
            byte[] hash=MessageDigest.getInstance("SHA-256").digest(identity.getBytes(StandardCharsets.UTF_8));
            return uid+"_"+Base64.getUrlEncoder().withoutPadding().encodeToString(hash);
        }catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
    }
    private void publishChannels(){
        try{
            String json;
            do{
                JSONArray rows=new JSONArray();
                for(Map.Entry<String,String> entry:discovered.entrySet())rows.put(new JSONObject().put("key",entry.getKey()).put("name",entry.getValue()));
                json=new JSONObject().put("user",user).put("channels",rows).toString();
                if(json.length()<=1800||discovered.isEmpty())break;
                discovered.remove(discovered.keySet().iterator().next());
            }while(true);
            if(!json.equals(lastDiscovery)){lastDiscovery=json;FeatureSettings.diagnostic(context,discoveredKey,json);}
        }catch(org.json.JSONException ignored){}
    }
}
