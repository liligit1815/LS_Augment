package ls.augment.com.hook;

import android.content.Context;
import android.service.notification.StatusBarNotification;
import java.util.*;
import ls.augment.com.IslandContentRules;

/** Formats visible text after source admission. Original notifications and callbacks stay untouched. */
final class IslandContentPresentation {
    final String compact,title,detail;
    private IslandContentPresentation(String compact,String title,String detail){this.compact=compact;this.title=title;this.detail=detail;}
    private static final class Cache {
        final String raw;final IslandContentRules rules;
        Cache(String raw){this.raw=raw;IslandContentRules parsed=IslandContentRules.parse(raw);rules=parsed==null?IslandContentRules.parse(""):parsed;}
    }
    private static volatile Cache cached=new Cache("");
    static String revision(Context context){return FeatureSettings.text(context,IslandContentRules.KEY,"");}
    private static IslandContentRules rules(Context context){
        String raw=revision(context);Cache value=cached;if(!value.raw.equals(raw)){value=new Cache(raw);cached=value;}return value.rules;
    }
    static String layout(Context context,int user,String scene,String pkg,String channel){return rules(context).layout(user,scene,pkg,channel);}
    static String iconMode(Context context,int user,String scene,String pkg,String channel,boolean panel){return rules(context).icon(user,scene,pkg,channel,panel);}
    static String compactMetric(String original,String formatted,ls.augment.com.IslandNotificationProgress progress){
        String metric=progress.status();return !metric.isEmpty()&&original.equals(formatted)&&!formatted.contains(metric)?metric:"";
    }
    static Map<String,String> fields(StatusBarNotification source,String app){
        Map<String,String> fields=IslandContentRules.variables(IslandNotificationText.read(source.getPackageName(),source.getNotification()),app,source.getPackageName(),source.getNotification().getChannelId());
        ls.augment.com.IslandNotificationProgress progress=IslandNotificationText.progress(source.getNotification());
        fields.put("progress",progress.text());fields.put("state",progress.status());return fields;
    }
    static IslandContentPresentation source(Context context,StatusBarNotification source,String app,String scene,
            String compact,String title,String detail,String progress,String state){
        Map<String,String> fields=fields(source,app);if("downloads".equals(scene)){fields.put("progress",progress);fields.put("state",state);}
        return format(context,source.getUserId(),scene,source.getPackageName(),source.getNotification().getChannelId(),fields,compact,title,detail);
    }
    static IslandContentPresentation event(Context context,IslandEvent event){
        if(event.contentFields.isEmpty()||!IslandContentRules.SCENES.contains(event.scene))return new IslandContentPresentation(event.compact,event.title,event.detail);
        return format(context,event.user,event.scene,event.sourcePackage,event.sourceChannel,event.contentFields,event.compact,event.title,event.detail);
    }
    private static IslandContentPresentation format(Context context,int user,String scene,String pkg,String channel,
            Map<String,String> fields,String compact,String title,String detail){
        IslandContentRules rules=rules(context);
        return new IslandContentPresentation(rules.render(user,scene,pkg,channel,IslandContentRules.COMPACT,fields,compact),
                rules.render(user,scene,pkg,channel,IslandContentRules.TITLE,fields,title),
                rules.render(user,scene,pkg,channel,IslandContentRules.DETAIL,fields,detail));
    }
    private IslandContentPresentation(){throw new AssertionError();}
}
