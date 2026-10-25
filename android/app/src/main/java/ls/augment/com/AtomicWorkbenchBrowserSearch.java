package ls.augment.com;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

/** Public web navigation for text search. No guessed image-upload endpoint receives media. */
final class AtomicWorkbenchBrowserSearch {
    private static final String SEARCH = "https://www.bing.com/search?q=";
    private AtomicWorkbenchBrowserSearch() { }
    static boolean browser(Context context, String pkg, int uid) {
        if (context == null || pkg == null || uid < 10000) return false;
        Intent web = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/"))
                .addCategory(Intent.CATEGORY_BROWSABLE).setPackage(pkg);
        return receiver(context, web, pkg, uid) != null;
    }
    static ComponentName textReceiver(Context context, String pkg, int uid) {
        if (!browser(context, pkg, uid)) return null;
        return receiver(context, textIntent(pkg, "capability"), pkg, uid);
    }
    private static ComponentName receiver(Context context, Intent query, String pkg, int uid) {
        try {
            for (ResolveInfo result : context.getPackageManager().queryIntentActivities(query, PackageManager.MATCH_DEFAULT_ONLY)) {
                ActivityInfo a = result.activityInfo;
                if (a != null && a.enabled && a.exported && pkg.equals(a.packageName) && a.applicationInfo != null
                        && a.applicationInfo.enabled && a.applicationInfo.uid == uid && (a.permission == null || a.permission.isEmpty()))
                    return new ComponentName(a.packageName, a.name);
            }
        } catch (RuntimeException unavailable) { }
        return null;
    }
    static Intent textIntent(String pkg, String text) {
        if (pkg == null || !pkg.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)*")
                || text == null || text.isBlank() || text.length() > 32768) throw new IllegalArgumentException("invalid_browser_search");
        return new Intent(Intent.ACTION_VIEW, Uri.parse(SEARCH + java.net.URLEncoder.encode(text, java.nio.charset.StandardCharsets.UTF_8)))
                .addCategory(Intent.CATEGORY_BROWSABLE).setPackage(pkg);
    }
    static Intent textIntent(Context context, String pkg, int uid, String text) {
        Intent query = textIntent(pkg, text);
        if (!browser(context, pkg, uid)) throw new IllegalArgumentException("browser_search_unavailable");
        if (receiver(context, query, pkg, uid) == null) throw new IllegalArgumentException("browser_search_unavailable");
        return query;
    }
    static Intent sanitize(Intent supplied, String pkg) {
        if (supplied == null || !Intent.ACTION_VIEW.equals(supplied.getAction()) || supplied.getData() == null
                || supplied.getType() != null || supplied.getClipData() != null || supplied.getSelector() != null || supplied.getComponent() != null
                || supplied.getFlags() != 0 || supplied.getBundleExtra(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET) == null)
            throw new IllegalArgumentException("invalid_browser_search");
        android.os.Bundle extras = supplied.getExtras();
        if (extras == null || !extras.keySet().equals(java.util.Set.of(AtomicWorkbenchProtocol.EXTRA_EXACT_TARGET)))
            throw new IllegalArgumentException("invalid_browser_search");
        String url = supplied.getData().toString();
        if (!url.startsWith(SEARCH)) throw new IllegalArgumentException("invalid_browser_search");
        String text = java.net.URLDecoder.decode(url.substring(SEARCH.length()), java.nio.charset.StandardCharsets.UTF_8);
        Intent clean = textIntent(pkg, text);
        if (!url.equals(clean.getData().toString())) throw new IllegalArgumentException("invalid_browser_search");
        return clean;
    }
}
