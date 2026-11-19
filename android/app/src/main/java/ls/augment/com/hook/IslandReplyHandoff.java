package ls.augment.com.hook;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;

/** A real high-importance banner keeps its original reply entry until the system retires it. */
final class IslandReplyHandoff {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final LinkedHashMap<String,Runnable> waiting=new LinkedHashMap<>();
    static void shown(StatusBarNotification source,Object manager,Method showing){
        if(IslandMessageControls.reply(source)==null)return;
        String key=source.getKey();cancel(key);
        if(waiting.size()>=16)cancel(waiting.keySet().iterator().next());
        long deadline=SystemClock.elapsedRealtime()+30000;
        Runnable check=new Runnable(){
            boolean observed;
            public void run(){
                if(waiting.get(key)!=this)return;
                try{
                    boolean visible=Boolean.TRUE.equals(showing.invoke(manager,key));
                    if(visible)observed=true;
                    if(observed&&!visible){cancel(key);DynamicIslandHook.afterReplyBanner(source);return;}
                    if(SystemClock.elapsedRealtime()<deadline){main.postDelayed(this,250);return;}
                }catch(ReflectiveOperationException|RuntimeException unavailable){}
                cancel(key);
            }
        };
        waiting.put(key,check);check.run();
    }
    static void cancel(String key){Runnable old=waiting.remove(key);if(old!=null)main.removeCallbacks(old);}
    static void clear(){for(Runnable old:waiting.values())main.removeCallbacks(old);waiting.clear();}
    private IslandReplyHandoff(){}
}
