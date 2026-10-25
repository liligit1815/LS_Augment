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
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

/** Public receivers for the actual payload, including activities with no launcher entry. */
final class AtomicWorkbenchShareTargetRepository {
    static final class Descriptor {
        final String action, mime;
        final int files;
        final boolean hasText;
        Descriptor(boolean hasText, List<String> mimes) {
            files = mimes == null ? 0 : mimes.size();
            if (files > AtomicWorkbenchTransferPolicy.MAX_ITEMS || files == 0 && !hasText)
                throw new IllegalArgumentException("没有可分享的内容");
            this.hasText = hasText;
            action = files > 1 ? Intent.ACTION_SEND_MULTIPLE : Intent.ACTION_SEND;
            mime = AtomicWorkbenchTransferPolicy.commonMime(mimes);
        }
        static Descriptor from(AtomicWorkbenchTransferStore.Payload payload) {
            if (payload == null) throw new IllegalArgumentException("没有可分享的内容");
            return new Descriptor(!payload.text.isEmpty(), payload.mimes);
        }
        Intent query() { return new Intent(action).setType(mime).addCategory(Intent.CATEGORY_DEFAULT); }
        String key() { return action + ":" + mime + ":" + files + ":" + hasText; }
    }

    static final class Target {
        final ComponentName component;
        final int userId;
        final String label, appLabel, action, mime;
        final Drawable icon;
        Target(ComponentName component, int userId, String label, String appLabel, Drawable icon, Descriptor descriptor) {
            this.component = component; this.userId = userId; this.label = label; this.appLabel = appLabel;
            this.icon = icon; action = descriptor.action; mime = descriptor.mime;
        }
        String key() { return userId + ":" + component.flattenToString(); }
    }

    static final class Result {
        final List<Target> targets;
        final boolean available;
        final String message;
        Result(List<Target> targets, boolean available, String message) {
            this.targets = Collections.unmodifiableList(new ArrayList<>(targets));
            this.available = available; this.message = message;
        }
    }

    static Result load(Context context, Descriptor descriptor, int userId) {
        if (descriptor == null) return new Result(Collections.emptyList(), false, "请先添加流转内容");
        // A separate user must be queried and launched through its own authenticated
        // phone bridge. Never label a current-user result as another user's target.
        if (userId != android.os.Process.myUid() / 100000)
            return new Result(Collections.emptyList(), false, "此用户的分享入口尚未连接");
        try {
            PackageManager pm = context.getPackageManager();
            LinkedHashMap<String, Target> unique = new LinkedHashMap<>();
            for (ResolveInfo resolved : pm.queryIntentActivities(descriptor.query(), PackageManager.MATCH_DEFAULT_ONLY)) {
                ActivityInfo activity = resolved.activityInfo;
                if (!allowed(activity, context.getPackageName(), userId)) continue;
                ComponentName component = new ComponentName(activity.packageName, activity.name);
                String appLabel = activity.packageName, label = activity.name;
                Drawable icon = null;
                try {
                    CharSequence app = pm.getApplicationLabel(activity.applicationInfo);
                    CharSequence name = resolved.loadLabel(pm);
                    if (app != null && app.length() > 0) appLabel = app.toString();
                    if (name != null && name.length() > 0) label = name.toString();
                    icon = resolved.loadIcon(pm);
                } catch (RuntimeException ignored) { }
                Target target = new Target(component, userId, label, appLabel, icon, descriptor);
                unique.putIfAbsent(target.key(), target);
            }
            ArrayList<Target> result = new ArrayList<>(unique.values());
            Collator collator = Collator.getInstance(Locale.getDefault());
            result.sort((a, b) -> {
                int app = collator.compare(a.appLabel, b.appLabel);
                int label = app == 0 ? collator.compare(a.label, b.label) : app;
                return label == 0 ? a.key().compareTo(b.key()) : label;
            });
            return new Result(result, true, result.isEmpty() ? "没有支持这类内容的公开分享入口" : "");
        } catch (RuntimeException unavailable) {
            return new Result(Collections.emptyList(), false, "暂时无法读取手机分享入口，请重试");
        }
    }

    static boolean contains(Context context, Descriptor descriptor, Target selected) {
        if (selected == null || descriptor == null || !descriptor.action.equals(selected.action) || !descriptor.mime.equals(selected.mime)) return false;
        Result current = load(context, descriptor, selected.userId);
        if (!current.available) return false;
        for (Target target : current.targets) if (target.key().equals(selected.key())) return true;
        return false;
    }

    /** A declaration is a candidate receive route; dispatch still rechecks the frozen task. */
    static boolean accepts(Context context, Descriptor descriptor, String packageName, int uid) {
        if (descriptor == null || !AtomicWorkbenchTransferPolicy.validPackage(packageName)
                || uid < 10000 || uid / 100000 != android.os.Process.myUid() / 100000) return false;
        try {
            for (ResolveInfo result : context.getPackageManager().queryIntentActivities(
                    descriptor.query().setPackage(packageName), PackageManager.MATCH_DEFAULT_ONLY)) {
                ActivityInfo activity = result.activityInfo;
                if (allowed(activity, context.getPackageName(), uid / 100000)
                        && uid == activity.applicationInfo.uid && packageName.equals(activity.packageName)) return true;
            }
        } catch (RuntimeException unavailable) { }
        return false;
    }

    static boolean allowed(ActivityInfo activity, String ownPackage, int userId) {
        return activity != null && activity.applicationInfo != null && activity.enabled && activity.exported
                && activity.applicationInfo.enabled && activity.applicationInfo.uid / 100000 == userId
                && activity.packageName != null && activity.name != null && !activity.name.isEmpty()
                && !ownPackage.equals(activity.packageName)
                && (activity.permission == null || activity.permission.isEmpty());
    }

    private AtomicWorkbenchShareTargetRepository() { }
}
