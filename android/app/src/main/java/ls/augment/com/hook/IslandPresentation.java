package ls.augment.com.hook;

import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.view.View;
import android.view.WindowInsets;
import java.util.List;
import ls.augment.com.IslandEnvironmentRules;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Reads the current display/user environment. It never grants source or host eligibility. */
final class IslandPresentation {
    static int mode(Context context,View root,int user,String scene,String pkg,String channel,int sourceMode){
        String raw=FeatureSettings.text(context,IslandEnvironmentRules.KEY,"");
        if(raw.isEmpty())return sourceMode;
        IslandEnvironmentRules rules=IslandEnvironmentRules.parse(raw);if(rules==null)return IslandEnvironmentRules.OFF;
        int scoped=rules.mode(IslandEnvironmentRules.key('C',user,scene,pkg,channel));
        if(scoped==0)scoped=rules.mode(IslandEnvironmentRules.key('A',user,scene,pkg,""));
        if(scoped!=0)return scoped;if(sourceMode!=0)return sourceMode;
        String foreground="";int foregroundUser=-1;
        if(!rules.packages('F',user).isEmpty()&&rules.mode(IslandEnvironmentRules.key('X',user,"*",pkg,""))==0){
            try{
                if(root==null||root.getDisplay()==null)throw new IllegalStateException("display");
                int display=root.getDisplay().getDisplayId();
                Object service=Class.forName("android.app.ActivityTaskManager").getMethod("getService").invoke(null);
                Object tasks=call(service,"getTasks",1,false,false,display);
                if(!(tasks instanceof List)||((List<?>)tasks).isEmpty())throw new IllegalStateException("focused_task");
                Object task=((List<?>)tasks).get(0),component=field(task,"topActivity"),taskDisplay=field(task,"displayId"),owner=field(task,"userId");
                if(!(component instanceof ComponentName)||!(taskDisplay instanceof Integer)||!(owner instanceof Integer)||(Integer)taskDisplay!=display)
                    throw new IllegalStateException("focused_task_identity");
                foreground=((ComponentName)component).getPackageName();foregroundUser=(Integer)owner;
            }catch(Exception missing){FeatureRuntimeLog.state("ISLAND_PRESENTATION","foreground",missing.getClass().getSimpleName());}
        }
        boolean dnd=false,fullscreen=false;
        if(rules.mode(IslandEnvironmentRules.key('D',user,"*","",""))!=0)try{
            NotificationManager manager=context.getSystemService(NotificationManager.class);
            int filter=manager==null?NotificationManager.INTERRUPTION_FILTER_UNKNOWN:manager.getCurrentInterruptionFilter();
            dnd=filter!=NotificationManager.INTERRUPTION_FILTER_UNKNOWN&&filter!=NotificationManager.INTERRUPTION_FILTER_ALL;
        }catch(RuntimeException missing){FeatureRuntimeLog.state("ISLAND_PRESENTATION","dnd",missing.getClass().getSimpleName());}
        if(rules.mode(IslandEnvironmentRules.key('U',user,"*","",""))!=0&&root!=null){
            WindowInsets insets=root.getRootWindowInsets();fullscreen=insets!=null&&!insets.isVisible(WindowInsets.Type.statusBars());
        }
        return rules.resolve(user,scene,pkg,channel,0,new IslandEnvironmentRules.Environment(foreground,foregroundUser,dnd,fullscreen,
                context.getResources().getConfiguration().orientation==android.content.res.Configuration.ORIENTATION_LANDSCAPE));
    }
    private IslandPresentation(){}
}
