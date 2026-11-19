package ls.augment.com.hook;

import android.graphics.drawable.Drawable;
import java.util.List;

/** Immutable source revision. Actions are dispatched only while this exact revision remains current. */
final class IslandEvent {
    final String key,scene,title,detail,compact;
    final String sourcePackage,sourceChannel;
    final int user,uid;
    final int detailLines;
    final Object instance,revision,presentation;
    final Drawable icon,expandedIcon;
    final Runnable open;
    final List<Action> actions;
    final java.util.Map<String,String> contentFields;
    final ls.augment.com.IslandNotificationProgress progress;
    final android.service.notification.StatusBarNotification notification;
    static final class Action {
        final String label;final Runnable run;
        Action(String label,Runnable run){this.label=label;this.run=run;}
    }
    IslandEvent(String key,String scene,int user,int uid,Object instance,Object revision,String title,String detail,
            String compact,Drawable icon,Runnable open,List<Action> actions){
        this(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,"navigation".equals(scene)?4:2);
    }
    IslandEvent(String key,String scene,int user,int uid,Object instance,Object revision,String title,String detail,
            String compact,Drawable icon,Runnable open,List<Action> actions,int detailLines){
        this(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,"","",java.util.Map.of(),ls.augment.com.IslandNotificationProgress.NONE,icon,null);
    }
    private IslandEvent(String key,String scene,int user,int uid,Object instance,Object revision,String title,String detail,
            String compact,Drawable icon,Runnable open,List<Action> actions,int detailLines,String sourcePackage,String sourceChannel,java.util.Map<String,String> contentFields,ls.augment.com.IslandNotificationProgress progress,Drawable expandedIcon,android.service.notification.StatusBarNotification notification){
        this.key=key;this.scene=scene;this.user=user;this.uid=uid;this.instance=instance;this.revision=revision;
        this.title=title;this.detail=detail;this.compact=compact;this.icon=icon;this.expandedIcon=expandedIcon;this.open=open;this.actions=List.copyOf(actions);
        java.util.ArrayList<String> labels=new java.util.ArrayList<>();
        for(Action action:this.actions)labels.add(action.label==null?"":action.label);
        // Action freshness still uses revision. A new source timestamp alone is
        // not new visible content and must not reopen a manually collapsed card.
        this.progress=progress==null?ls.augment.com.IslandNotificationProgress.NONE:progress;
        this.presentation=java.util.Arrays.asList(title,detail,compact,List.copyOf(labels),this.progress.displayIdentity());
        this.detailLines=Math.max(1,Math.min(64,detailLines));
        this.sourcePackage=sourcePackage;this.sourceChannel=sourceChannel;
        this.contentFields=java.util.Map.copyOf(contentFields);this.notification=notification;
    }
    IslandEvent source(String pkg,String channel){return new IslandEvent(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,pkg,channel==null?"":channel,contentFields,progress,expandedIcon,notification);}
    IslandEvent content(java.util.Map<String,String> fields){return new IslandEvent(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,sourcePackage,sourceChannel,fields,progress,expandedIcon,notification);}
    IslandEvent progress(ls.augment.com.IslandNotificationProgress value){return new IslandEvent(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,sourcePackage,sourceChannel,contentFields,value,expandedIcon,notification);}
    IslandEvent expandedIcon(Drawable value){return new IslandEvent(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,sourcePackage,sourceChannel,contentFields,progress,value,notification);}
    IslandEvent notification(android.service.notification.StatusBarNotification source){return new IslandEvent(key,scene,user,uid,instance,revision,title,detail,compact,icon,open,actions,detailLines,sourcePackage,sourceChannel,contentFields,progress,expandedIcon,source);}
}
