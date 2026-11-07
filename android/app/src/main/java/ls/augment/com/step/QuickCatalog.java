package ls.augment.com.step;

import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.os.UserHandle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

final class QuickCatalog {
    static final class App {
        final LauncherActivityInfo info;
        final ComponentName component;
        final String key, label;
        final long duration, last;
        App(LauncherActivityInfo info, UsageStats stats,boolean clone,long serial) {
            this.info = info;
            component = info.getComponentName();
            key = component.flattenToString()+(clone?"@serial-"+serial:"");
            CharSequence name = info.getLabel();
            label = (name == null ? component.getPackageName() : name.toString())+(clone?"（分身）":"");
            duration = stats == null ? 0 : stats.getTotalTimeInForeground();
            last = duration > 0 ? stats.getLastTimeUsed() : 0;
        }
    }
    static List<App> load(Context c, UserHandle user, boolean rankUsage) {
        Map<String,UsageStats> usage = Collections.emptyMap();
        if (rankUsage) {
            try {
                long end = System.currentTimeMillis();
                usage = c.getSystemService(UsageStatsManager.class).queryAndAggregateUsageStats(end - 7L * 86400000, end);
            } catch (RuntimeException | LinkageError denied) { /* Continue with stable name/component order. */ }
        }
        List<App> apps = new ArrayList<>();
        HashSet<String> seen = new HashSet<>();
        List<UserHandle> profiles=new ArrayList<>();profiles.add(user);
        try{
            for(UserHandle candidate:c.getSystemService(android.os.UserManager.class).getUserProfiles())
                if(!candidate.equals(user) && WorkspaceUsers.allows(c,WorkspaceUsers.id(user),WorkspaceUsers.id(candidate)))profiles.add(candidate);
        }catch(RuntimeException|LinkageError ignored){}
        for(UserHandle u:profiles){
            boolean clone=!user.equals(u);
            long serial=c.getSystemService(android.os.UserManager.class).getSerialNumberForUser(u);
            if(clone && serial<0)continue;
            List<LauncherActivityInfo> entries;
            try{entries=c.getSystemService(LauncherApps.class).getActivityList(null,u);}catch(SecurityException unavailable){continue;}
            for(LauncherActivityInfo info:entries){
                ComponentName component=info.getComponentName();
                if(!u.equals(info.getUser()))continue;
                App app=new App(info,clone || usage==null?null:usage.get(component.getPackageName()),clone,serial);
                if(seen.add(app.key))apps.add(app);
            }
        }
        apps.sort((a,b) -> {
            int byTime = Long.compare(b.duration, a.duration);
            if (byTime != 0) return byTime;
            int byRecent = Long.compare(b.last, a.last);
            if (byRecent != 0) return byRecent;
            int byName = a.label.compareToIgnoreCase(b.label);
            return byName != 0 ? byName : a.key.compareTo(b.key);
        });
        return apps;
    }
    static List<App> arranged(List<App> catalog, LinkedHashSet<String> pins) {
        java.util.LinkedHashMap<String,App> remaining = new java.util.LinkedHashMap<>();
        for (App app : catalog) remaining.put(app.key, app);
        List<App> result = new ArrayList<>();
        for (String key : pins) {
            App app = remaining.remove(key);
            if (app != null) result.add(app);
        }
        result.addAll(remaining.values());
        return result;
    }
}
