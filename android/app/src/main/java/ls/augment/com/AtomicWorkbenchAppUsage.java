package ls.augment.com;

import android.Manifest;
import android.app.AppOpsManager;
import android.app.usage.UsageEvents;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.pm.PackageManager;
import java.util.HashMap;

/** System UsageEvents, never tile click counters. Counts are per package, not per launcher Activity. */
final class AtomicWorkbenchAppUsage {
    private AtomicWorkbenchAppUsage() { }
    static boolean allowed(Context context) {
        try {
            AppOpsManager ops=context.getSystemService(AppOpsManager.class);
            if(ops==null)return false;
            int mode=ops.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS,android.os.Process.myUid(),context.getPackageName());
            return mode==AppOpsManager.MODE_ALLOWED||(mode==AppOpsManager.MODE_DEFAULT
                    &&context.checkSelfPermission(Manifest.permission.PACKAGE_USAGE_STATS)==PackageManager.PERMISSION_GRANTED);
        }catch(RuntimeException failure){return false;}
    }
    static AtomicWorkbenchAppListModel.Usage read(Context context,int requestedMode) {
        if(!allowed(context))return AtomicWorkbenchAppListModel.Usage.unavailable("未获使用情况访问权限；频率模式暂按手动顺序显示。");
        if(requestedMode!=AtomicWorkbenchAppListModel.USAGE)
            return new AtomicWorkbenchAppListModel.Usage(true,"使用情况访问已授权。",new HashMap<>(),new HashMap<>());
        try {
            UsageStatsManager manager=context.getSystemService(UsageStatsManager.class);
            if(manager==null)return AtomicWorkbenchAppListModel.Usage.unavailable("系统统计暂不可用；频率模式暂按手动顺序显示。");
            long now=System.currentTimeMillis(),start=Math.max(0,now-14L*24*60*60*1000);
            UsageEvents events=manager.queryEvents(start,now);
            if(events==null)return AtomicWorkbenchAppListModel.Usage.unavailable("系统未返回使用统计；频率模式暂按手动顺序显示。");
            HashMap<String,Integer> counts=new HashMap<>();HashMap<String,Long> recent=new HashMap<>();
            UsageEvents.Event event=new UsageEvents.Event();int total=0;
            while(events.hasNextEvent()) {
                if(++total>200000)return AtomicWorkbenchAppListModel.Usage.unavailable("统计量超过读取上限；本次暂按手动顺序显示。");
                events.getNextEvent(event);
                if(event.getEventType()!=UsageEvents.Event.ACTIVITY_RESUMED)continue;
                String pkg=event.getPackageName();long time=event.getTimeStamp();
                if(pkg==null||time<start||time>now)continue;
                counts.put(pkg,counts.getOrDefault(pkg,0)+1);
                recent.put(pkg,Math.max(recent.getOrDefault(pkg,0L),time));
            }
            return new AtomicWorkbenchAppListModel.Usage(true,
                    counts.isEmpty()?"已授权，最近14天暂无前台进入记录；同次数按首字母排列。":"最近14天前台进入次数，同次数按最近进入时间，再按首字母。",counts,recent);
        }catch(RuntimeException failure){return AtomicWorkbenchAppListModel.Usage.unavailable("系统统计读取失败；频率模式暂按手动顺序显示。");}
    }
}
