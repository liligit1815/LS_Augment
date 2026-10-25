package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import java.text.Collator;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

/** Reads the current user's real, exported launcher entries on a background thread. */
final class AtomicWorkbenchAppRepository {
    static final class App extends AtomicWorkbenchAppListModel.Item {
        final ComponentName component;
        final int uid;
        final long firstInstallTime;
        final Drawable icon;
        final String searchKey;
        App(ComponentName component, String label, Drawable icon) {
            this(component,label,icon,label,-1,-1L);
        }
        App(ComponentName component, String label, Drawable icon, String latin, int uid, long firstInstallTime) {
            super(component.flattenToString(),label,component.getPackageName(),latin);
            this.component = component;
            this.uid=uid;this.firstInstallTime=firstInstallTime;
            this.icon = icon;
            searchKey = (label + " " + component.flattenToString()).toLowerCase(Locale.ROOT);
        }
        String key() { return component.flattenToString(); }
    }

    static ArrayList<App> load(Context context) {
        PackageManager pm = context.getPackageManager();
        LinkedHashMap<String, App> unique = new LinkedHashMap<>();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER);
        List<ResolveInfo> entries = pm.queryIntentActivities(query, 0);
        android.icu.text.Transliterator letters=null;
        try { letters=android.icu.text.Transliterator.getInstance("Any-Latin; Latin-ASCII"); }
        catch (RuntimeException unavailable) { /* Non-Latin initials honestly remain #. */ }
        java.util.HashMap<String,Long> installs=new java.util.HashMap<>();
        for (ResolveInfo entry : entries) {
            ActivityInfo activity = entry.activityInfo;
            if (!allowed(activity, context.getPackageName())) continue;
            ComponentName component = new ComponentName(activity.packageName, activity.name);
            String label = component.getPackageName();
            Drawable icon = null;
            try {
                CharSequence resolved = entry.loadLabel(pm);
                if (resolved != null && resolved.length() > 0) label = resolved.toString();
                icon = entry.loadIcon(pm);
            } catch (RuntimeException ignored) { }
            long installed;
            try {
                Long cached=installs.get(activity.packageName);
                installed=cached==null?pm.getPackageInfo(activity.packageName,0).firstInstallTime:cached;
                installs.put(activity.packageName,installed);
            } catch(PackageManager.NameNotFoundException removed) { continue; }
            String latin=label;
            if(letters!=null)try{latin=letters.transliterate(label);}catch(RuntimeException unavailable){ }
            unique.putIfAbsent(component.flattenToString(), new App(component,label,icon,latin,activity.applicationInfo.uid,installed));
        }
        ArrayList<App> result = new ArrayList<>(unique.values());
        Collator collator = Collator.getInstance(Locale.getDefault());
        result.sort((left, right) -> {
            int label = collator.compare(left.label, right.label);
            return label == 0 ? left.key().compareTo(right.key()) : label;
        });
        return result;
    }

    static boolean allowed(ActivityInfo activity, String ownPackage) {
        if (activity == null || activity.applicationInfo == null || !activity.enabled
                || !activity.exported || !activity.applicationInfo.enabled
                || activity.applicationInfo.uid / 100000 != android.os.Process.myUid() / 100000
                || (activity.permission != null && !activity.permission.isEmpty())) return false;
        String pkg = activity.packageName;
        return pkg != null && !ownPackage.equals(pkg) && !"android".equals(pkg)
                && !"com.android.systemui".equals(pkg) && !pkg.endsWith("permissioncontroller");
    }

    /** A stale tile may request a refresh, never launch an uninstalled/replaced entry. */
    static boolean current(Context context, App app) {
        try {
            ActivityInfo activity=context.getPackageManager().getActivityInfo(app.component,0);
            if(!allowed(activity,context.getPackageName()) || activity.applicationInfo.uid!=app.uid
                    || context.getPackageManager().getPackageInfo(activity.packageName,0).firstInstallTime!=app.firstInstallTime) return false;
            Intent query=new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(activity.packageName);
            for(ResolveInfo entry:context.getPackageManager().queryIntentActivities(query,0))
                if(entry.activityInfo!=null&&app.component.getClassName().equals(entry.activityInfo.name)
                        && allowed(entry.activityInfo,context.getPackageName()))return true;
        }catch(PackageManager.NameNotFoundException|RuntimeException changed){ }
        return false;
    }

    private AtomicWorkbenchAppRepository() { }
}
