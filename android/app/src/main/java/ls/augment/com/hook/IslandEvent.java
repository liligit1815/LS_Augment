package ls.augment.com.hook;

import android.graphics.drawable.Drawable;
import java.util.List;

/** Immutable source revision. Actions are dispatched only while this exact revision remains current. */
final class IslandEvent {
    final String key,scene,title,detail,compact;
    final int user,uid;
    final Object instance,revision;
    final Drawable icon;
    final Runnable open;
    final List<Action> actions;
    static final class Action {
        final String label;final Runnable run;
        Action(String label,Runnable run){this.label=label;this.run=run;}
    }
    IslandEvent(String key,String scene,int user,int uid,Object instance,Object revision,String title,String detail,
            String compact,Drawable icon,Runnable open,List<Action> actions){
        this.key=key;this.scene=scene;this.user=user;this.uid=uid;this.instance=instance;this.revision=revision;
        this.title=title;this.detail=detail;this.compact=compact;this.icon=icon;this.open=open;this.actions=List.copyOf(actions);
    }
}
