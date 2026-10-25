package ls.augment.com;

import android.app.AppOpsManager;
import android.app.Notification;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserHandle;
import android.service.notification.StatusBarNotification;
import android.widget.RemoteViews;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Locale;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;

/** Fresh current-user navigation notifications, read only by the existing Root engine. */
final class AtomicWorkbenchNavigation {
    static final int MAX_NOTIFICATIONS = 256, MAX_TEXT = 160;
    static final int MAX_LINES = 8, MAX_REMOTE_ACTIONS = 128, MAX_REMOTE_VIEWS = 16, MAX_REMOTE_DEPTH = 4;
    private static final String ACCESS = "android.permission.ACCESS_NOTIFICATIONS";
    private static final int OP_ACCESS_NOTIFICATIONS = 25;
    private final Context context;
    private final int userId;
    private final AtomicWorkbenchNotificationEvidenceClient evidence;
    private String stage = "idle", lastDiagnostic = "";

    AtomicWorkbenchNavigation(Context context, int userId) {
        this(context,userId,null);
    }
    AtomicWorkbenchNavigation(Context context, int userId,AtomicWorkbenchMediaSessionEvidenceClient.Principal principal) {
        if (Process.myUid() != 0 || userId < 0 || userId > Integer.MAX_VALUE / 100000)
            throw new SecurityException("invalid navigation owner");
        this.context = context; this.userId = userId;
        evidence=principal==null?null:new AtomicWorkbenchNotificationEvidenceClient(userId,principal);
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    Bundle state() {
        try {
            stage = "current_user_before";
            if (currentUser() != userId) return userChanged();
            stage = "permission_before";
            requirePermission();
            stage = "notification_service";
            // systemMain's Context belongs to android, but the Binder caller remains UID 0.
            // The service enforces ACCESS_NOTIFICATIONS and notes op 25 itself as well.
            Method getService = Class.forName("android.app.NotificationManager").getDeclaredMethod("getService");
            getService.setAccessible(true);
            Object service = getService.invoke(null);
            if (service == null) throw new IllegalStateException("notification service unavailable");
            stage = "notification_query";
            Method query = Class.forName("android.app.INotificationManager").getMethod(
                    "getActiveNotificationsWithAttribution", String.class, String.class);
            Object value = query.invoke(service, "android", null);
            if (!(value instanceof StatusBarNotification[])) throw new IllegalStateException("invalid notification reply");
            StatusBarNotification[] notifications = (StatusBarNotification[]) value;
            stage = "current_user_after_query";
            if (currentUser() != userId) return userChanged();
            stage = "notification_filter";
            Candidate best = null;
            int scanned = Math.min(notifications.length, MAX_NOTIFICATIONS);
            for (int i = 0; i < scanned; i++) {
                Candidate next = candidate(notifications[i]);
                if (next != null && (best == null || (next.hasGuidance() && !best.hasGuidance())
                        || (next.hasGuidance() == best.hasGuidance() && next.posted > best.posted))) best = next;
            }
            String sourceGeneration="";
            if(best!=null&&evidence!=null){
                AtomicWorkbenchNotificationEvidenceClient.Snapshot proof=evidence.query();
                sourceGeneration=verifiedSourceGeneration(best.key,best.packageName,best.uid,userId,best.posted,proof);
            }
            // Package lookups and Binder calls can cross a user switch or permission withdrawal.
            stage = "permission_after";
            requirePermission();
            stage = "current_user_after";
            if (currentUser() != userId) return userChanged();
            boolean hasGuidance = best != null && best.hasGuidance();
            Bundle result = empty(true, true, hasGuidance ? "" : best != null ? best.message()
                    : notifications.length > MAX_NOTIFICATIONS
                    ? "通知数量较多，已检查范围内没有持续导航通知" : "当前没有持续导航通知");
            result.putString("navigation_status", best == null ? "no_navigation" : hasGuidance ? "active" : "no_guidance");
            result.putBoolean("owner_user_current", true);
            result.putBoolean("active", hasGuidance);
            result.putBoolean("has_session", best != null);
            result.putBoolean("has_guidance", hasGuidance);
            // This owner was verified against the current user's package UID above.
            // The UI can focus an existing map window without executing notification intents.
            result.putString("package", best == null ? "" : best.packageName);
            result.putString("navigation_source_generation",sourceGeneration);
            result.putInt("scanned", scanned);
            result.putBoolean("scan_limited", notifications.length > MAX_NOTIFICATIONS);
            if (hasGuidance) {
                result.putString("title", best.guidance.get(0).value);
                result.putString("subtitle", best.guidance.size() > 1 ? best.guidance.get(1).value : "");
                result.putString("subtext", best.guidance.size() > 2 ? best.guidance.get(2).value : "");
                if ("amap_spoken".equals(best.guidance.get(0).source)) {
                    result.putString("subtitle", "最近导航播报 · " + Math.max(0L,
                            (SystemClock.elapsedRealtime() - best.spokenElapsed) / 1000L) + "秒前");
                    result.putString("subtext", "");
                }
            }
            stage = "ready";
            diagnostic(best == null ? "idle" : hasGuidance ? "active" : "no_guidance",
                    best != null && !hasGuidance ? "notification_without_guidance" : "none", scanned,
                    notifications.length > MAX_NOTIFICATIONS, null, best);
            return result;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            return unavailable(failure);
        }
    }

    private static int currentUser() throws ReflectiveOperationException {
        return (Integer) Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
    }

    private void requirePermission() throws ReflectiveOperationException {
        if (Process.myUid() != 0 || context.checkPermission(ACCESS, Process.myPid(), Process.myUid())
                != PackageManager.PERMISSION_GRANTED) throw new SecurityException("notification permission unavailable");
        Object appOps = context.getSystemService(Context.APP_OPS_SERVICE);
        if (appOps == null) throw new IllegalStateException("app ops unavailable");
        Method note = appOps.getClass().getMethod("noteOpNoThrow", int.class, int.class, String.class,
                String.class, String.class);
        Object mode = note.invoke(appOps, OP_ACCESS_NOTIFICATIONS, Process.myUid(), "android", null, null);
        // Match this ROM's NMS: MODE_DEFAULT follows the explicitly granted permission.
        if (!(mode instanceof Integer) || ((Integer) mode != AppOpsManager.MODE_ALLOWED
                && (Integer) mode != AppOpsManager.MODE_DEFAULT)) throw new SecurityException("notification app op unavailable");
    }

    private Candidate candidate(StatusBarNotification sbn) throws ReflectiveOperationException {
        if (sbn == null || !UserHandle.getUserHandleForUid(userId * 100000).equals(sbn.getUser())
                || sbn.getUid() < 0 || sbn.getUid() / 100000 != userId) return null;
        String pkg = sbn.getPackageName();
        if (pkg == null || pkg.length() > 256 || !pkg.matches("[A-Za-z0-9_]+(\\.[A-Za-z0-9_]+)*")) return null;
        Notification n = sbn.getNotification();
        if (n == null || n.visibility == Notification.VISIBILITY_SECRET
                || (n.flags & Notification.FLAG_ONGOING_EVENT) == 0 || (n.flags & Notification.FLAG_GROUP_SUMMARY) != 0) return null;
        if (!Notification.CATEGORY_NAVIGATION.equals(n.category) && !mapPackage(pkg)) return null;
        Object manager = context.getPackageManager();
        Method packageUid = manager.getClass().getMethod("getPackageUidAsUser", String.class, int.class);
        try {
            Object uid = packageUid.invoke(manager, pkg, userId);
            if (!(uid instanceof Integer) || ((Integer) uid) != sbn.getUid()) return null;
        } catch (InvocationTargetException removed) {
            if (removed.getCause() instanceof PackageManager.NameNotFoundException) return null;
            throw removed;
        }
        ArrayList<TextPart> standard = new ArrayList<>();
        ArrayList<TextPart> spokenParts = new ArrayList<>();
        Bundle extras = n.extras == null ? new Bundle() : n.extras;
        int fields = 0;
        String bridge = "none";
        long spokenElapsed = -1L;
        if (AtomicWorkbenchAmapData.PACKAGE.equals(pkg)) {
            bridge = extras.getInt(AtomicWorkbenchAmapData.VERSION, 0) == AtomicWorkbenchAmapData.CONTRACT
                    ? extras.getString(AtomicWorkbenchAmapData.STATUS, "waiting") : "not_connected";
            if ("ended".equals(bridge)) return null;
            boolean spoken = "spoken".equals(extras.getString(AtomicWorkbenchAmapData.SOURCE, ""));
            if ("active".equals(bridge) && AtomicWorkbenchAmapData.fresh(SystemClock.elapsedRealtime(),
                    extras.getLong(AtomicWorkbenchAmapData.UPDATED, -1L), spoken)) {
                String source = spoken ? "amap_spoken" : "amap_route";
                List<TextPart> target = spoken ? spokenParts : standard;
                fields |= add(target, extras.getCharSequence(AtomicWorkbenchAmapData.TITLE), source, 128);
                fields |= add(target, extras.getCharSequence(AtomicWorkbenchAmapData.CONTENT), source, 128);
                if (spoken) spokenElapsed = extras.getLong(AtomicWorkbenchAmapData.UPDATED, -1L);
            } else if ("active".equals(bridge)) bridge = "stale";
        }
        // The target ROM's promoted-notification extractor also reads these real extras.
        fields |= add(standard, extras.getCharSequence(Notification.EXTRA_BIG_TEXT), "big_text", 1);
        CharSequence[] lines = extras.getCharSequenceArray(Notification.EXTRA_TEXT_LINES);
        if (lines != null) for (int i = 0; i < Math.min(lines.length, MAX_LINES); i++)
            fields |= add(standard, lines[i], "text_lines", 2);
        fields |= add(standard, extras.getCharSequence(Notification.EXTRA_TITLE_BIG), "big_title", 4);
        if (Build.VERSION.SDK_INT >= 36) {
            try { fields |= add(standard, n.getShortCriticalText(), "short_critical", 8); }
            catch (LinkageError optionalUnavailable) { /* Optional on vendor builds; keep real standard fields. */ }
        }
        fields |= add(standard, extras.getCharSequence(Notification.EXTRA_TEXT), "text", 16);
        fields |= add(standard, extras.getCharSequence(Notification.EXTRA_SUB_TEXT), "subtext", 32);
        fields |= add(standard, extras.getCharSequence(Notification.EXTRA_TITLE), "title", 64);
        boolean session = Notification.CATEGORY_NAVIGATION.equals(n.category);
        for (TextPart part : standard) {
            if (ended(part.value)) return null;
            session |= sessionMarker(part.value);
        }
        Candidate candidate = new Candidate(pkg, sbn.getKey(),sbn.getUid(),sbn.getPostTime(), fields);
        candidate.bridge = bridge;
        candidate.spokenElapsed = spokenElapsed;
        for (TextPart part : standard) if (guidance(part.value, session)) candidate.add(part);
        RemoteTextReader remote = new RemoteTextReader(pkg);
        candidate.remotePresent = n.bigContentView != null || n.headsUpContentView != null || n.contentView != null;
        if (!candidate.hasGuidance() && candidate.remotePresent) {
            // Only inspect framework data fields. Never inflate/apply/reapply a RemoteViews,
            // execute an action, load an image, resolve a click Intent, or bind a map service.
            List<String> values = remote.read(n.bigContentView, n.headsUpContentView, n.contentView);
            candidate.remoteError = remote.error;
            for (String value : values) {
                if (terminalRemoteText(value)) return null;
                session |= sessionMarker(value);
            }
            for (String value : values) if (guidance(value, session)) candidate.add(new TextPart(value, "remote_text"));
        }
        // A recent spoken instruction is a labelled fallback. Do not mix an older
        // spoken maneuver into current standard or RemoteViews route instructions.
        if (!candidate.hasGuidance()) for (TextPart part : spokenParts) {
            if (ended(part.value)) return null;
            if (guidance(part.value, session)) candidate.add(part);
        }
        if (!session && !candidate.hasGuidance()) return null;
        return candidate;
    }

    /** This identifies the exact NMS notification lifetime, not a guessed route/title change. */
    static String verifiedSourceGeneration(String key,String pkg,int uid,int user,long posted,AtomicWorkbenchNotificationEvidenceClient.Snapshot proof){
        if(proof==null||key==null||key.isEmpty()||uid<0||uid/100000!=user)return "";
        for(AtomicWorkbenchNotificationRecord record:proof.records)
            if(key.equals(record.key)&&pkg.equals(record.pkg)&&uid==record.uid&&user==record.user&&posted==record.postTime)return record.generation;
        return "";
    }

    private static boolean mapPackage(String pkg) {
        return "com.autonavi.minimap".equals(pkg) || "com.baidu.BaiduMap".equals(pkg)
                || "com.tencent.map".equals(pkg) || "com.google.android.apps.maps".equals(pkg);
    }

    private static boolean sessionMarker(String raw) {
        String value = raw.toLowerCase(Locale.ROOT);
        return value.contains("正在导航") || value.contains("导航中") || value.contains("导航进行中")
                || value.contains("路线引导") || value.contains("navigation in progress") || value.contains("navigating");
    }

    private static boolean guidance(String raw, boolean session) {
        String value = raw.toLowerCase(Locale.ROOT);
        if (ended(value)) return false;
        if (value.contains("未获取") || value.contains("获取失败") || value.contains("暂无") || value.contains("加载中")
                || value.contains("正在规划") || value.contains("正在定位") || value.contains("等待gps")) return false;
        boolean maneuver = value.contains("左转") || value.contains("右转") || value.contains("直行")
                || value.contains("掉头") || value.contains("驶出") || value.contains("进入环岛") || value.contains("靠左") || value.contains("靠右")
                || value.contains("turn left") || value.contains("turn right") || value.contains("continue straight");
        if (maneuver) return true;
        boolean distance = value.matches("(?s).*\\d+(?:\\.\\d+)?\\s*(?:公里|米|km\\b|m\\b).*" );
        boolean duration = value.matches("(?s).*\\d+(?:\\.\\d+)?\\s*(?:小时|分钟|分钟后|分(?:钟)?|秒|hours?\\b|mins?\\b|minutes?\\b).*" );
        String roadText = value.replace("道路", "").replace("路线", "").replace("路况", "")
                .replace("路口", "").replace("路段", "").replace("路网", "");
        boolean road = roadText.matches("(?s).*[\\p{L}\\d·]{2,24}(?:大道|公路|高速|街|路)(?![线况网口段面标灯]).*" )
                && !value.contains("规划") && !value.contains("计算") && !value.contains("安全") && !value.contains("注意");
        boolean remaining = value.contains("剩余") || value.contains("还需") || value.contains("还有")
                || value.contains("预计") || value.contains("前方") || value.contains("距离目的地") || value.contains("remaining")
                || value.contains("arrive") || value.contains("进入") || value.contains("驶入") || value.contains("沿着");
        boolean arrival = value.matches("(?s).*\\d{1,2}:\\d{2}.*") && (value.contains("到达") || value.contains("arrive"));
        return ((distance || duration || road) && (session || remaining)) || arrival;
    }

    private static int add(List<TextPart> parts, CharSequence value, String source, int bit) {
        String cleaned = text(value);
        if (cleaned.isEmpty()) return 0;
        parts.add(new TextPart(cleaned, source)); return bit;
    }

    private static boolean terminalRemoteText(String value) {
        // A notification's "结束导航" button is an action label, not an ended-session event.
        return !value.equals("结束导航") && !value.equals("退出导航") && ended(value);
    }

    private static boolean ended(String... fields) {
        for (String raw : fields) {
            String value = raw.trim().toLowerCase(Locale.ROOT);
            if (value.equals("到达目的地") || value.equals("arrived") || value.equals("结束导航") || value.equals("退出导航")
                    || value.contains("已到达") || value.contains("导航已结束") || value.contains("本次导航结束")
                    || value.contains("导航结束") || value.contains("导航已停止") || value.contains("已停止导航") || value.contains("已退出导航")
                    || value.contains("未开始导航") || value.contains("不在导航中")
                    || value.contains("navigation ended") || value.contains("navigation stopped")
                    || value.contains("you have arrived") || value.contains("arrived at your destination")) return true;
        }
        return false;
    }

    private static String text(CharSequence source) {
        if (source == null) return "";
        int length = Math.min(MAX_TEXT, source.length());
        StringBuilder value = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            char c = source.charAt(i);
            value.append(Character.isISOControl(c) || (c >= '\u202a' && c <= '\u202e')
                    || (c >= '\u2066' && c <= '\u2069') ? ' ' : c);
        }
        if (value.length() > 0 && Character.isHighSurrogate(value.charAt(value.length() - 1))) value.setLength(value.length() - 1);
        return value.toString().trim();
    }

    private Bundle userChanged() {
        diagnostic("unavailable", "user_changed", 0, false, null);
        Bundle result = empty(false, false, "当前用户已变化，请重新进入工作台");
        result.putString("navigation_status", "user_changed"); return result;
    }

    private Bundle unavailable(Throwable failure) {
        Throwable actual = failure;
        while (actual instanceof InvocationTargetException && actual.getCause() != null) actual = actual.getCause();
        boolean permission = actual instanceof SecurityException;
        boolean unsupported = actual instanceof NoSuchMethodException || actual instanceof ClassNotFoundException
                || actual instanceof IllegalAccessException || actual instanceof NoSuchMethodError
                || actual instanceof NoClassDefFoundError || actual instanceof AbstractMethodError;
        String reason = permission ? "permission_denied" : unsupported ? "unsupported" : "temporary_error";
        diagnostic("unavailable", reason, 0, false, actual);
        Bundle result = empty(false, false, permission ? "系统未允许读取导航通知"
                : unsupported ? "此系统缺少导航通知读取接口" : "导航通知暂时读取失败");
        try { result.putBoolean("owner_user_current", currentUser() == userId); }
        catch (ReflectiveOperationException | RuntimeException | LinkageError ignored) { }
        result.putString("navigation_status", reason); return result;
    }

    private void diagnostic(String status, String reason, int scanned, boolean limited, Throwable failure) {
        diagnostic(status, reason, scanned, limited, failure, null);
    }

    private void diagnostic(String status, String reason, int scanned, boolean limited, Throwable failure, Candidate selected) {
        String detail = "status=" + status + ";reason=" + reason + ";stage=" + stage + ";scanned=" + scanned
                + ";scan_limited=" + limited + ";error=" + (failure == null ? "none" : failure.getClass().getSimpleName())
                + ";has_session=" + (selected != null) + ";has_guidance=" + (selected != null && selected.hasGuidance())
                + ";source=" + (selected == null || !selected.hasGuidance() ? "none" : selected.guidance.get(0).source)
                + ";field_mask=" + (selected == null ? 0 : selected.fields)
                + ";remote_present=" + (selected != null && selected.remotePresent)
                + ";remote_error=" + (selected == null ? "none" : selected.remoteError)
                + ";amap_bridge=" + (selected == null ? "none" : selected.bridge);
        if (detail.equals(lastDiagnostic)) return;
        lastDiagnostic = detail;
        // No package, notification key, title, route text, extras, Intent or exception message.
        AtomicWorkbenchDiagnostics.emit("NAVIGATION_CAPABILITY", -1, userId, "", -1, detail, null);
    }

    static Bundle closed() {
        Bundle result = empty(false, false, "工作台正在关闭，导航卡暂不可用");
        result.putString("navigation_status", "closed"); return result;
    }

    private static Bundle empty(boolean success, boolean available, String message) {
        Bundle result = new Bundle();
        result.putBoolean("success", success); result.putBoolean("available", available); result.putBoolean("active", false);
        result.putBoolean("has_session", false); result.putBoolean("has_guidance", false);
        result.putString("title", ""); result.putString("subtitle", ""); result.putString("subtext", "");
        result.putString("package", "");
        result.putString("message", message); result.putString("navigation_status", "no_navigation");
        return result;
    }

    private static final class TextPart {
        final String value, source;
        TextPart(String value, String source) { this.value = value; this.source = source; }
    }

    private static final class Candidate {
        final String packageName,key;
        final int uid;
        final long posted;
        final int fields;
        final ArrayList<TextPart> guidance = new ArrayList<>();
        boolean remotePresent;
        String remoteError = "none";
        String bridge = "none";
        long spokenElapsed;
        Candidate(String packageName,String key,int uid, long posted, int fields) {
            this.packageName = packageName;this.key=key;this.uid=uid; this.posted = posted; this.fields = fields;
        }
        boolean hasGuidance() { return !guidance.isEmpty(); }
        String message() {
            if ("not_connected".equals(bridge)) return "未取得高德实时指引；请在 LSPosed 勾选高德地图，重新打开高德并开始导航；请查看地图窗口";
            if ("unsupported".equals(bridge)) return "当前高德版本的实时导航接口尚未适配，请查看地图窗口";
            if ("stale".equals(bridge)) return "高德实时指引已过期，等待地图更新；请查看地图窗口";
            if ("waiting".equals(bridge)) return "已接入高德，正在等待实际路线指引；请查看地图窗口";
            return "地图通知未提供转向指引，请查看地图窗口";
        }
        void add(TextPart part) {
            for (TextPart previous : guidance) if (previous.value.equals(part.value)
                    || previous.value.contains(part.value)) return;
            if (guidance.size() < 3) guidance.add(part);
        }
    }

    /** NX809J framework-current.jar!classes4.dex data contract, not an action interpreter. */
    private static final class RemoteTextReader {
        private final String ownerPackage;
        private final IdentityHashMap<RemoteViews, Boolean> seen = new IdentityHashMap<>();
        private int actions, views;
        String error = "none";
        RemoteTextReader(String ownerPackage) { this.ownerPackage = ownerPackage; }

        List<String> read(RemoteViews... roots) {
            ArrayList<String> result = new ArrayList<>();
            try {
                // Expanded first; stop after one complete root with substantive text. Do not
                // combine variant layouts that can contain different/stale instructions.
                for (RemoteViews root : roots) {
                    if (root == null) continue;
                    ArrayList<String> current = walk(root, 0);
                    boolean useful = false;
                    for (String value : current) {
                        if (terminalRemoteText(value)) return current;
                        useful |= guidance(value, true);
                    }
                    if (useful) return current;
                    if (result.isEmpty()) result = current;
                }
            } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
                // All partial actions are discarded: a later action may clear or replace them.
                error = failure instanceof Limit ? "limit" : failure instanceof Layout ? "layout_unsupported"
                        : failure instanceof ReflectiveOperationException ? "fields_unavailable" : "malformed_actions";
                return new ArrayList<>();
            }
            return result;
        }

        private ArrayList<String> walk(RemoteViews remote, int depth) throws ReflectiveOperationException {
            if (depth > MAX_REMOTE_DEPTH || ++views > MAX_REMOTE_VIEWS || seen.put(remote, Boolean.TRUE) != null) throw new Limit();
            if (remote.getClass() != RemoteViews.class) throw new Layout();
            String pkg = remote.getPackage();
            if (!ownerPackage.equals(pkg) && !"android".equals(pkg)) throw new Layout();
            if (Boolean.TRUE.equals(field(remote, "mHasDrawInstructions"))) throw new Layout();
            // Sized/landscape variants cannot be tied to an actually selected notification
            // layout here. Refuse them rather than merging incompatible instructions.
            if (field(remote, "mLandscape") != null || field(remote, "mPortrait") != null) throw new Layout();
            Object sizes = field(remote, "mSizedRemoteViews");
            if (sizes != null && (!(sizes instanceof List<?>) || !((List<?>) sizes).isEmpty())) throw new Layout();
            Object raw = field(remote, "mActions");
            if (raw == null) return new ArrayList<>();
            if (raw.getClass() != ArrayList.class) throw new Layout();
            ArrayList<?> list = (ArrayList<?>) raw;
            if (list.size() > MAX_REMOTE_ACTIONS - actions) throw new Limit();
            actions += list.size();
            LinkedHashMap<Integer, String> text = new LinkedHashMap<>();
            LinkedHashMap<Integer, Integer> visibility = new LinkedHashMap<>();
            LinkedHashMap<Integer, ArrayList<String>> nested = new LinkedHashMap<>();
            for (Object action : list) {
                if (action == null) throw new Layout();
                String name = action.getClass().getName();
                if ("android.widget.RemoteViews$ReflectionAction".equals(name)) {
                    Object method = field(action, "mMethodName");
                    int id = (Integer) field(action, "mViewId");
                    if ("setDisplayedChild".equals(method)) throw new Layout();
                    if (!"setText".equals(method) && !"setVisibility".equals(method)) continue;
                    Object type = field(action, "mType"), value = field(action, "mValue");
                    if ("setVisibility".equals(method)) {
                        if (!(type instanceof Integer) || ((Integer) type) != 4 || !(value instanceof Integer)) throw new Layout();
                        int visible = (Integer) value;
                        if (visible != 0 && visible != 4 && visible != 8) throw new Layout();
                        visibility.put(id, visible); continue;
                    }
                    // Last setText wins, including null or a non-text overload clearing it.
                    if (!(type instanceof Integer) || ((Integer) type) != 10
                            || (value != null && !(value instanceof CharSequence))) text.remove(id);
                    else text.put(id, text((CharSequence) value));
                } else if ("android.widget.RemoteViews$ViewGroupActionAdd".equals(name)) {
                    Object child = field(action, "mNestedViews");
                    if (!(child instanceof RemoteViews)) throw new Layout();
                    int id = (Integer) field(action, "mViewId");
                    ArrayList<String> children = nested.get(id);
                    if (children == null) { children = new ArrayList<>(); nested.put(id, children); }
                    children.addAll(walk((RemoteViews) child, depth + 1));
                } else if (name.startsWith("android.widget.RemoteViews$ViewGroupAction")
                        || name.equals("android.widget.RemoteViews$RemoveFromParentAction")
                        || name.equals("android.widget.RemoteViews$ViewContentNavigation")
                        || name.contains("ReflectionAction") || name.contains("ViewVisibility")) {
                    // Unknown text/resource/structural mutations could invalidate an earlier
                    // setText. Refuse this root; never evaluate resources or private actions.
                    throw new Layout();
                }
                int count = text.size();
                for (List<String> children : nested.values()) count += children.size();
                if (count > 16) throw new Limit();
            }
            ArrayList<String> result = new ArrayList<>();
            for (java.util.Map.Entry<Integer, String> entry : text.entrySet())
                if (visibility.getOrDefault(entry.getKey(), 0) == 0 && !entry.getValue().isEmpty()) result.add(entry.getValue());
            for (java.util.Map.Entry<Integer, ArrayList<String>> entry : nested.entrySet())
                if (visibility.getOrDefault(entry.getKey(), 0) == 0) result.addAll(entry.getValue());
            return result;
        }

        private static Object field(Object owner, String name) throws ReflectiveOperationException {
            Class<?> type = owner.getClass();
            // Only inspect the exact framework RemoteViews/action inheritance chain.
            while (type != null && type.getName().startsWith("android.widget.RemoteViews")) {
                try {
                    Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(owner);
                } catch (NoSuchFieldException missing) { type = type.getSuperclass(); }
            }
            throw new NoSuchFieldException("remote_views_contract");
        }
        private static final class Limit extends RuntimeException { }
        private static final class Layout extends RuntimeException { }
    }
}
