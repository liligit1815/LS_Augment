package ls.augment.com;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.media.Rating;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserHandle;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/** Current-user media bridge. Calls run on the owner's serial Root executor. */
final class AtomicWorkbenchMedia implements AutoCloseable {
    static final int MAX_ART_EDGE = 128, MAX_ART_BYTES = 128 * 128 * 4;
    static final int MAX_REPLY_BYTES = 96 * 1024, MAX_TEXT = 160, MAX_SESSIONS = 64;
    private static final int MAX_NOTIFICATIONS = 256, MAX_ACTIONS = 128, MAX_IDENTITY = 4096;
    private static final long ACTION_TTL = 5000;
    private final Context context;
    private final int userId;
    private final AtomicWorkbenchMediaSources<MediaSession.Token> sources = new AtomicWorkbenchMediaSources<>();
    private final AtomicWorkbenchMediaObservers observers = new AtomicWorkbenchMediaObservers();
    private final AtomicWorkbenchMediaSessionEvidenceClient evidence;
    private final Map<MediaSession.Token, AtomicWorkbenchMediaSessionEvidenceClient.Evidence> notificationAuthorities = new LinkedHashMap<>();
    private final Map<String, Track> tracks = new LinkedHashMap<>();
    private final Map<String, Long> seen = new LinkedHashMap<>();
    private MediaSession.Token observedToken;
    private String observedId = "", observedSource = "", lastDiagnostic = "", stage = "idle";
    private boolean closed;

    AtomicWorkbenchMedia(Context context, int userId) {
        this(context, userId, null);
    }

    AtomicWorkbenchMedia(Context context, int userId, AtomicWorkbenchMediaSessionEvidenceClient.Principal principal) {
        if (Process.myUid() != 0 || userId < 0 || userId > Integer.MAX_VALUE / 100000)
            throw new SecurityException("invalid media owner");
        this.context = context; this.userId = userId; evidence = new AtomicWorkbenchMediaSessionEvidenceClient(principal);
    }

    Bundle state() {
        if (closed) return closed();
        try { return snapshot(refresh()); }
        catch (ReflectiveOperationException | RuntimeException | LinkageError error) { return unavailable(error); }
    }

    Bundle command(String command, String sessionId) {
        AtomicWorkbenchProtocol.requireMediaCommand(command, sessionId);
        if (closed) return closed();
        boolean dispatched = false;
        try {
            Fresh fresh = refresh(); Bundle before = snapshot(fresh); Selection current = fresh.selected;
            if (current == null || !sessionId.equals(observedId)) return rejected(before, "播放器会话已变化，请重试");
            if (!before.getBoolean("can_" + command)) return rejected(before, "当前播放器暂不支持此操作");
            stage = "transport_controls"; requireSame(current); requireCurrentUser();
            MediaController.TransportControls controls = current.controller.getTransportControls();
            if (!commandAllowed(current.controller.getPlaybackState(), command)) return rejected(before, "播放器控制能力已变化，请重新操作");
            requireSame(current); requireCurrentUser();
            stage = "transport_command";
            // A transport exception can arrive after the system accepted the command.
            dispatched = true;
            switch (command) {
                case "previous": controls.skipToPrevious(); break;
                case "play": controls.play(); break;
                case "pause": controls.pause(); break;
                case "next": controls.skipToNext(); break;
                default: throw new IllegalArgumentException("invalid media command");
            }
            Bundle after = snapshot(refresh()); after.putString("message", "已请求播放控制，请以播放器状态为准");
            return actionResult(after, true, false);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Bundle result = unavailable(error);
            if (dispatched) result.putString("message", "播放操作已交给系统，结果尚未核对，请勿重复操作");
            return actionResult(result, dispatched, false);
        }
    }

    /** Strict metadata-only actions; no arbitrary Intent, token, custom action or text input. */
    Bundle action(String action, Bundle request) {
        Request parsed;
        try { parsed = new Request(action, request, SystemClock.elapsedRealtime()); }
        catch (RuntimeException bad) { return rejected(empty(false, false, "媒体请求无效或已过期"), "媒体请求无效或已过期"); }
        if (closed) return closed();
        boolean dispatched = false;
        try {
            Fresh fresh = refresh(); Bundle before = snapshot(fresh); Selection target = fresh.find(parsed.source);
            if (target == null) return rejected(before, "媒体来源已变化，请重新选择");
            if ("select_source".equals(action)) {
                claim(parsed); sources.select(parsed.source);
                return actionResult(snapshot(refresh()), false, true);
            }
            if ("describe_open".equals(action)) {
                ComponentName component = launcher(target);
                if (component == null) return rejected(before, "来源应用没有可核对的公开打开入口");
                requireSame(target); requireCurrentUser(); claim(parsed);
                before.putString("open_component", component.flattenToString()); before.putString("open_package", target.source.packageName);
                before.putInt("open_owner_uid", target.source.uid); before.putInt("open_user_id", userId);
                before.putString("open_source_id", target.source.id); before.putLong("open_deadline_elapsed", parsed.deadline);
                // The UI owns output surfaces and actual opening. This only describes a verified entry.
                return actionResult(before, false, true);
            }
            if (target != fresh.selected || !parsed.track.equals(before.getString("track_id", "")) || !before.getBoolean("can_favorite"))
                return rejected(before, "当前曲目或收藏能力已变化，请重新操作");
            boolean desired = "favorite_on".equals(action);
            Track track = tracks.get(target.source.id);
            Rating rating = favoriteEvidence(target, track);
            requireSame(target); requireCurrentUser(); claim(parsed);
            if (rating.hasHeart() == desired) { before.putBoolean("favorite", desired); return actionResult(before, false, true); }
            stage = "transport_controls"; MediaController.TransportControls controls = target.controller.getTransportControls();
            rating = favoriteEvidence(target, track); requireSame(target); requireDeadline(parsed); requireCurrentUser();
            if (rating.hasHeart() == desired) { before.putBoolean("favorite", desired); return actionResult(before, false, true); }
            stage = "transport_command"; dispatched = true;
            controls.setRating(Rating.newHeartRating(desired));
            Bundle after = snapshot(refresh());
            boolean verified = parsed.source.equals(after.getString("source_id", "")) && parsed.track.equals(after.getString("track_id", ""))
                    && after.getBoolean("favorite_known") && after.getBoolean("favorite") == desired;
            after.putString("message", verified ? "播放器已更新收藏状态" : "已请求更新收藏，结果尚未核对");
            return actionResult(after, true, verified);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Bundle result = unavailable(error);
            result.putString("message", dispatched ? "媒体操作已交给系统，结果尚未核对，请勿重复操作" : "媒体来源或能力已变化，请重新操作");
            return actionResult(result, dispatched, false);
        }
    }

    @SuppressLint("BlockedPrivateApi")
    private Fresh refresh() throws ReflectiveOperationException {
        stage = "current_user_before"; requireCurrentUser(); stage = "framework_init"; prepareFramework();
        stage = "service_lookup";
        MediaSessionManager manager = (MediaSessionManager) context.getSystemService(Context.MEDIA_SESSION_SERVICE);
        if (manager == null) throw new IllegalStateException("media service unavailable");
        stage = "session_api";
        Method active = MediaSessionManager.class.getMethod("getActiveSessionsForUser", ComponentName.class, UserHandle.class);
        stage = "session_query";
        Object value = active.invoke(manager, null, UserHandle.getUserHandleForUid(userId * 100000));
        if (!(value instanceof List<?>)) throw new IllegalStateException("invalid session list");
        List<?> activeList = (List<?>) value;
        ArrayList<Selection> all = new ArrayList<>(); Set<MediaSession.Token> live = new HashSet<>(); int examined = 0;
        for (Object item : activeList) {
            if (++examined > MAX_SESSIONS) break;
            if (!(item instanceof MediaController)) continue;
            MediaController controller = (MediaController) item;
            stage = "session_token"; MediaSession.Token token = controller.getSessionToken();
            if (token == null || live.contains(token)) continue;
            stage = "session_owner"; Identity identity = identity(controller, token);
            if (identity == null) continue;
            stage = "playback"; PlaybackState playback = controller.getPlaybackState();
            AtomicWorkbenchMediaSources.Source<MediaSession.Token> source = sources.observe(token, identity.uid, userId, identity.pkg);
            if (!observers.observe(controller, source.id, playback)) { live.add(token); sources.revoke(token); continue; }
            live.add(token); all.add(new Selection(controller, token, playback, source,
                    rank(playback) * 2 + (token.equals(observedToken) ? 1 : 0)));
        }
        Fresh result = new Fresh(all, null, activeList.size() > MAX_SESSIONS); readNotifications(result);
        Set<Selection> revoked = new HashSet<>();
        for (AtomicWorkbenchMediaObservers.Edge edge : observers.drain()) for (Selection item : all)
            if (edge.token.equals(item.token) && edge.source.equals(item.source.id) && item.playback != null
                    && item.playback.getState() == PlaybackState.STATE_PLAYING) {
                try { requireSame(item); requireCurrentUser(); sources.playingEdge(item.source.id); }
                catch (ReflectiveOperationException | RuntimeException | LinkageError failed) {
                    if (item.evidence == null) throw failed;
                    revoked.add(item); sources.revoke(item.token); result.notificationStatus = "unavailable";
                }
                break;
            }
        all.removeAll(revoked);
        for (Selection item : all) live.add(item.token);
        notificationAuthorities.keySet().retainAll(live);
        observers.retain(live); sources.retain(live); Set<String> ids = new HashSet<>(); for (Selection item : all) ids.add(item.source.id);
        tracks.keySet().retainAll(ids);
        Selection best = null;
        for (Selection item : all) if (best == null || preferable(item, best)) best = item;
        for (Selection item : all) if (item.source.id.equals(sources.preference())) { best = item; break; }
        stage = "current_user_after"; requireCurrentUser();
        result.selected = best;
        stage = "current_user_after_notifications"; requireCurrentUser(); return result;
    }

    private static boolean preferable(Selection next, Selection old) {
        if (next.score / 2 != old.score / 2) return next.score / 2 > old.score / 2;
        if (next.playback != null && next.playback.getState() == PlaybackState.STATE_PLAYING) {
            long now = SystemClock.elapsedRealtime(), a = next.playback.getLastPositionUpdateTime(), b = old.playback.getLastPositionUpdateTime();
            if (a < 0 || a > now) a = 0; if (b < 0 || b > now) b = 0;
            if (a != b) return a > b;
        }
        return next.score > old.score;
    }

    private Identity identity(MediaController controller, MediaSession.Token token) throws ReflectiveOperationException {
        // API 36 has no public token-owner UID. Root.main exempts this UID-0 VM;
        // keep token ownership independent from the package-manager UID below.
        @SuppressLint("BlockedPrivateApi")
        Method getUid = MediaSession.Token.class.getDeclaredMethod("getUid"); getUid.setAccessible(true); Object raw = getUid.invoke(token);
        if (!(raw instanceof Integer)) throw new IllegalStateException("invalid media owner");
        int uid = (Integer) raw;
        if (uid < 0 || uid / 100000 != userId) return null;
        String pkg = controller.getPackageName();
        if (pkg == null || pkg.length() > 256 || !pkg.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)*")) return null;
        return packageUid(pkg) == uid ? new Identity(uid, pkg) : null;
    }
    private void requireSame(Selection selected) throws ReflectiveOperationException {
        Identity owner = identity(selected.controller, selected.token);
        if (owner == null || owner.uid != selected.source.uid || !owner.pkg.equals(selected.source.packageName))
            throw new SecurityException("media identity changed");
        if (selected.evidence != null && !selected.evidence.same(evidence.query(selected.notification, selected.token)))
            throw new SecurityException("notification media authority changed");
    }
    private int packageUid(String pkg) throws ReflectiveOperationException {
        Object pm = context.getPackageManager();
        Object value = pm.getClass().getMethod("getPackageUidAsUser", String.class, int.class).invoke(pm, pkg, userId);
        if (!(value instanceof Integer)) throw new IllegalStateException("invalid package identity"); return (Integer) value;
    }
    private void requireCurrentUser() throws ReflectiveOperationException {
        if (Process.myUid() != 0 || closed) throw new SecurityException("media owner unavailable");
        Object value = Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
        if (!(value instanceof Integer) || ((Integer) value) != userId) throw new UserChanged();
    }

    /** Active metadata joins are optional; notification-only controllers require fresh server evidence. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private void readNotifications(Fresh fresh) {
        try {
            requireNotificationPermission();
            Method get = Class.forName("android.app.NotificationManager").getDeclaredMethod("getService");
            get.setAccessible(true); Object service = get.invoke(null);
            if (service == null) throw new IllegalStateException("notification service unavailable");
            Object result = Class.forName("android.app.INotificationManager").getMethod("getActiveNotificationsWithAttribution", String.class, String.class)
                    .invoke(service, "android", null);
            if (!(result instanceof StatusBarNotification[])) throw new IllegalStateException("invalid notification reply");
            StatusBarNotification[] notifications = (StatusBarNotification[]) result;
            if (notifications.length > MAX_NOTIFICATIONS) { fresh.notificationStatus = "scan_limited"; return; }
            requireCurrentUser();
            Map<MediaSession.Token, StatusBarNotification> candidates = new LinkedHashMap<>();
            for (StatusBarNotification sbn : notifications) {
                if (sbn == null || sbn.getUid() < 0 || sbn.getUid() / 100000 != userId
                        || !UserHandle.getUserHandleForUid(userId * 100000).equals(sbn.getUser())) continue;
                Notification n = sbn.getNotification();
                if (n == null || n.visibility == Notification.VISIBILITY_SECRET || (n.flags & Notification.FLAG_GROUP_SUMMARY) != 0 || n.extras == null) continue;
                MediaSession.Token token = n.extras.getParcelable(Notification.EXTRA_MEDIA_SESSION, MediaSession.Token.class);
                Selection target = token == null ? null : fresh.byToken(token);
                if (token == null || packageUid(sbn.getPackageName()) != sbn.getUid()) continue;
                if (target != null) {
                    if (sbn.getUid() != target.source.uid || !target.source.packageName.equals(sbn.getPackageName())) continue;
                    if (target.notification == null || sbn.getPostTime() > target.notification.getPostTime()) target.notification = sbn;
                    notificationAuthorities.remove(token); continue;
                }
                StatusBarNotification previous = candidates.get(token);
                if (previous == null || sbn.getPostTime() > previous.getPostTime()
                        || sbn.getPostTime() == previous.getPostTime() && sbn.getKey().compareTo(previous.getKey()) < 0) candidates.put(token, sbn);
            }
            int examined = 0, proved = 0;
            for (Map.Entry<MediaSession.Token, StatusBarNotification> candidate : candidates.entrySet()) {
                if (++examined > 8 || fresh.all.size() >= MAX_SESSIONS) { fresh.limited = true; break; }
                MediaSession.Token token = candidate.getKey(); StatusBarNotification sbn = candidate.getValue();
                AtomicWorkbenchMediaSessionEvidenceClient.Evidence proof = evidence.query(sbn, token);
                if (proof == null) continue;
                MediaController controller = new MediaController(context, token); Identity owner = identity(controller, token);
                if (owner == null || owner.uid != sbn.getUid() || !owner.pkg.equals(sbn.getPackageName())) continue;
                AtomicWorkbenchMediaSessionEvidenceClient.Evidence old = notificationAuthorities.get(token);
                if (old != null && !old.sameLifetime(proof)) sources.revoke(token);
                AtomicWorkbenchMediaSources.Source<MediaSession.Token> source = sources.observe(token, owner.uid, userId, owner.pkg);
                PlaybackState playback = controller.getPlaybackState();
                if (!observers.observe(controller, source.id, playback)) { sources.revoke(token); continue; }
                Selection selection = new Selection(controller, token, playback, source, rank(playback) * 2 + (token.equals(observedToken) ? 1 : 0));
                selection.notification = sbn; selection.evidence = proof; fresh.all.add(selection); notificationAuthorities.put(token, proof); proved++;
            }
            requireCurrentUser(); requireNotificationPermission(); fresh.notificationStatus = proved > 0 ? "verified_notification_controller" : "active_token_only";
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            fresh.all.removeIf(item -> item.evidence != null);
            for (Selection item : fresh.all) item.notification = null; fresh.notificationStatus = "unavailable";
        }
    }
    private void requireNotificationPermission() {
        if (context.checkPermission("android.permission.ACCESS_NOTIFICATIONS", Process.myPid(), Process.myUid()) != PackageManager.PERMISSION_GRANTED)
            throw new SecurityException("notification permission unavailable");
        // The actual NMS Binder entry independently enforces ACCESS_NOTIFICATIONS + AppOp 25.
    }

    @SuppressLint("BlockedPrivateApi")
    private void prepareFramework() throws ReflectiveOperationException {
        // app_process/systemMain omits these media registries. Do not initialize unrelated modules.
        stage = "framework_platform_init"; prepareRegistry("android.media.MediaFrameworkPlatformInitializer");
        stage = "framework_communication_init"; prepareRegistry("android.media.MediaFrameworkInitializer");
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void prepareRegistry(String className) throws ReflectiveOperationException {
        Class<?> initializer;
        try { initializer = Class.forName(className); } catch (ClassNotFoundException olderPlatform) { return; }
        Method get = initializer.getMethod("getMediaServiceManager"); if (get.invoke(null) != null) return;
        Class<?> manager = Class.forName("android.media.MediaServiceManager"); Object created = manager.getConstructor().newInstance();
        try { initializer.getMethod("setMediaServiceManager", manager).invoke(null, created); }
        catch (InvocationTargetException raced) {
            if (!(raced.getCause() instanceof IllegalStateException) || get.invoke(null) == null) throw raced;
        }
        if (get.invoke(null) == null) throw new IllegalStateException("media framework not initialized");
    }

    private Bundle snapshot(Fresh fresh) throws ReflectiveOperationException {
        Selection selected = fresh.selected;
        Bundle result = empty(true, true, selected == null ? "暂无正在播放的媒体" : "");
        result.putString("notification_status", fresh.notificationStatus); result.putBoolean("sources_limited", fresh.limited);
        result.putString("notification_controller_status", fresh.notificationStatus.equals("verified_notification_controller") ? "verified" : "unavailable");
        result.putString("selection_reason", sources.reason()); result.putLong("selection_revision", sources.revision());
        result.putBoolean("observer_available", observers.covers(fresh.all.size()));
        result.putInt("source_count", fresh.all.size());
        if (selected == null) {
            observedToken = null; observedId = ""; observedSource = ""; result.putString("media_status", "no_session");
        } else {
            if (!selected.token.equals(observedToken) || !selected.source.id.equals(observedSource)) {
                observedToken = selected.token; observedSource = selected.source.id; observedId = randomId();
            }
            result.putBoolean("has_session", true); result.putString("session_id", observedId); result.putString("source_id", selected.source.id);
            result.putString("controller_origin", selected.evidence == null ? "active_session" : "verified_notification");
            result.putString("source_package", selected.source.packageName); result.putInt("source_uid", selected.source.uid); result.putInt("source_user_id", userId);
            boolean playing = playing(selected.playback); long actions = selected.playback == null ? 0 : selected.playback.getActions();
            result.putBoolean("playing", playing); result.putBoolean("can_previous", (actions & PlaybackState.ACTION_SKIP_TO_PREVIOUS) != 0);
            result.putBoolean("can_next", (actions & PlaybackState.ACTION_SKIP_TO_NEXT) != 0);
            result.putBoolean("can_play", !playing && (actions & (PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PLAY_PAUSE)) != 0);
            result.putBoolean("can_pause", playing && (actions & (PlaybackState.ACTION_PAUSE | PlaybackState.ACTION_PLAY_PAUSE)) != 0);
            stage = "metadata"; MediaMetadata metadata = selected.controller.getMetadata();
            Track track = tracks.get(selected.source.id); String key = trackKey(metadata);
            if (track == null || !track.key.equals(key)) { track = new Track(key); tracks.put(selected.source.id, track); }
            result.putString("track_id", track.known ? track.id : ""); result.putBoolean("track_known", track.known);
            stage = "metadata_text";
            String title = first(text(metadata, MediaMetadata.METADATA_KEY_DISPLAY_TITLE), text(metadata, MediaMetadata.METADATA_KEY_TITLE));
            String subtitle = first(text(metadata, MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE), text(metadata, MediaMetadata.METADATA_KEY_ARTIST), text(metadata, MediaMetadata.METADATA_KEY_ALBUM_ARTIST));
            Bundle notification = selected.notification == null ? null : selected.notification.getNotification().extras;
            boolean notificationUsed = false;
            if (notification != null) {
                if (title.isEmpty()) { title = notificationText(notification, Notification.EXTRA_TITLE); notificationUsed = !title.isEmpty(); }
                if (subtitle.isEmpty()) { subtitle = first(notificationText(notification, Notification.EXTRA_TEXT), notificationText(notification, Notification.EXTRA_SUB_TEXT)); notificationUsed |= !subtitle.isEmpty(); }
            }
            result.putString("title", title); result.putString("subtitle", subtitle);
            result.putString("metadata_source", notificationUsed ? selected.evidence == null ? "active_session_notification" : "verified_notification" : "active_session");
            stage = "artwork"; Bitmap art = metadata == null ? null : artwork(metadata);
            if (art == null && selected.notification != null) art = notificationArtwork(selected.notification.getNotification());
            if (art != null) result.putParcelable("art", art);
            favorite(result, selected, metadata, track);
            long duration = metadata == null ? 0 : metadata.getLong(MediaMetadata.METADATA_KEY_DURATION);
            PlaybackState playback = selected.playback; int state = playback == null ? PlaybackState.STATE_NONE : playback.getState();
            AtomicWorkbenchMediaProgress progress = new AtomicWorkbenchMediaProgress(playback == null ? -1 : playback.getPosition(), duration,
                    playback == null ? 0 : playback.getPlaybackSpeed(), playback == null ? 0 : playback.getLastPositionUpdateTime(),
                    SystemClock.elapsedRealtime(), state == PlaybackState.STATE_PLAYING || state == PlaybackState.STATE_FAST_FORWARDING || state == PlaybackState.STATE_REWINDING);
            result.putBoolean("position_known", progress.known); result.putBoolean("duration_known", progress.durationKnown);
            result.putLong("position_ms", progress.position); result.putLong("duration_ms", progress.duration);
            result.putLong("sample_elapsed_ms", progress.sampled); result.putFloat("speed", progress.speed); result.putBoolean("progress_advancing", progress.advancing);
            result.putBoolean("can_open_source", launcher(selected) != null);
        }
        ArrayList<Bundle> list = new ArrayList<>();
        // Keep the selected entry if optional source rows exceed the Binder budget.
        if (selected != null) list.add(sourceBundle(selected, true));
        for (Selection source : fresh.all) if (source != selected) list.add(sourceBundle(source, false));
        result.putParcelableArrayList("sources", list);
        requireCurrentUser(); stage = "reply"; limitReply(result); stage = "ready"; diagnostic("available", "none", null); return result;
    }

    private void favorite(Bundle result, Selection selected, MediaMetadata metadata, Track track) {
        try {
            Rating rating = metadata == null ? null : metadata.getRating(MediaMetadata.METADATA_KEY_USER_RATING);
            boolean known = rating != null && rating.getRatingStyle() == Rating.RATING_HEART && rating.isRated();
            result.putBoolean("favorite_known", known); result.putBoolean("favorite", known && rating.hasHeart());
            result.putBoolean("can_favorite", known && track.known && selected.controller.getRatingType() == Rating.RATING_HEART
                    && selected.playback != null && (selected.playback.getActions() & PlaybackState.ACTION_SET_RATING) != 0);
            result.putString("favorite_status", result.getBoolean("can_favorite") ? "android_heart" : !track.known ? "track_unknown"
                    : rating != null && rating.getRatingStyle() == Rating.RATING_HEART && !rating.isRated() ? "heart_state_unknown" : "no_verified_adapter");
        } catch (RuntimeException | LinkageError optional) { result.putBoolean("favorite_known", false); result.putBoolean("can_favorite", false); result.putString("favorite_status", "unavailable"); }
    }
    private static Rating favoriteEvidence(Selection target, Track track) {
        MediaMetadata metadata = target.controller.getMetadata(); PlaybackState playback = target.controller.getPlaybackState();
        Rating rating = metadata == null ? null : metadata.getRating(MediaMetadata.METADATA_KEY_USER_RATING);
        if (track == null || !track.known || !track.key.equals(trackKey(metadata)) || rating == null || !rating.isRated()
                || rating.getRatingStyle() != Rating.RATING_HEART || target.controller.getRatingType() != Rating.RATING_HEART
                || playback == null || (playback.getActions() & PlaybackState.ACTION_SET_RATING) == 0)
            throw new IllegalStateException("media track or favorite state changed");
        return rating;
    }
    private static boolean commandAllowed(PlaybackState state, String command) {
        if (state == null) return false;
        long actions = state.getActions();
        switch (command) {
            case "previous": return (actions & PlaybackState.ACTION_SKIP_TO_PREVIOUS) != 0;
            case "next": return (actions & PlaybackState.ACTION_SKIP_TO_NEXT) != 0;
            case "play": return !playing(state) && (actions & (PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PLAY_PAUSE)) != 0;
            case "pause": return playing(state) && (actions & (PlaybackState.ACTION_PAUSE | PlaybackState.ACTION_PLAY_PAUSE)) != 0;
            default: return false;
        }
    }
    private Bundle sourceBundle(Selection selected, boolean isSelected) {
        Bundle entry = new Bundle(); entry.putString("source_id", selected.source.id);
        entry.putInt("owner_uid", selected.source.uid); entry.putInt("user_id", userId); entry.putString("package", selected.source.packageName);
        entry.putString("app_label", appLabel(selected.source.packageName)); entry.putBoolean("selected", isSelected); entry.putBoolean("has_controller", true);
        entry.putString("controller_origin", selected.evidence == null ? "active_session" : "verified_notification");
        entry.putBoolean("playing", playing(selected.playback)); entry.putBoolean("can_open_source", launcher(selected) != null); return entry;
    }
    private Context userContext() throws ReflectiveOperationException {
        return (Context) Context.class.getMethod("createContextAsUser", UserHandle.class, int.class)
                .invoke(context, UserHandle.getUserHandleForUid(userId * 100000), 0);
    }
    private ComponentName launcher(Selection source) {
        try {
            requireCurrentUser(); Identity owner = identity(source.controller, source.token); if (owner == null) return null;
            PackageManager pm = userContext().getPackageManager(); Intent launch = pm.getLaunchIntentForPackage(owner.pkg);
            ComponentName component = launch == null ? null : launch.getComponent();
            if (component == null || !owner.pkg.equals(component.getPackageName())) return null;
            ActivityInfo info = pm.getActivityInfo(component, 0);
            return info != null && info.enabled && info.exported && info.applicationInfo != null && info.applicationInfo.enabled
                    && info.applicationInfo.uid == owner.uid && (info.permission == null || info.permission.isEmpty()) ? component : null;
        } catch (ReflectiveOperationException | PackageManager.NameNotFoundException | RuntimeException | LinkageError unavailable) { return null; }
    }
    private String appLabel(String pkg) {
        try {
            PackageManager pm = userContext().getPackageManager(); ApplicationInfo app = pm.getApplicationInfo(pkg, 0);
            if (app.uid != packageUid(pkg)) return pkg; return first(bounded(pm.getApplicationLabel(app)), pkg);
        } catch (ReflectiveOperationException | PackageManager.NameNotFoundException | RuntimeException | LinkageError unavailable) { return pkg; }
    }
    private static String trackKey(MediaMetadata metadata) {
        if (metadata == null) return "";
        String mediaId = identityText(metadata, MediaMetadata.METADATA_KEY_MEDIA_ID);
        String primary = identityText(metadata, MediaMetadata.METADATA_KEY_TITLE), display = identityText(metadata, MediaMetadata.METADATA_KEY_DISPLAY_TITLE);
        String artist = identityText(metadata, MediaMetadata.METADATA_KEY_ARTIST), album = identityText(metadata, MediaMetadata.METADATA_KEY_ALBUM);
        if (mediaId == null || primary == null || display == null || artist == null || album == null) return "";
        String title = first(primary, display);
        if (mediaId.isEmpty() && title.isEmpty()) return "";
        return part(mediaId) + part(title) + part(artist) + part(album) + metadata.getLong(MediaMetadata.METADATA_KEY_DURATION);
    }
    private static String identityText(MediaMetadata metadata, String key) {
        CharSequence value = metadata.getText(key);
        if (value == null) return "";
        return value.length() > MAX_IDENTITY ? null : characters(value, value.length());
    }
    private static String part(String value) { return value.length() + ":" + value; }
    private static boolean playing(PlaybackState state) {
        if (state == null) return false;
        int value = state.getState(); return value == PlaybackState.STATE_PLAYING || value == PlaybackState.STATE_FAST_FORWARDING
                || value == PlaybackState.STATE_REWINDING || value == PlaybackState.STATE_BUFFERING || value == PlaybackState.STATE_CONNECTING;
    }
    private static int rank(PlaybackState state) {
        if (state == null) return 0;
        if (state.getState() == PlaybackState.STATE_PLAYING) return 4;
        if (playing(state)) return 3;
        return state.getState() == PlaybackState.STATE_PAUSED ? 2 : 1;
    }
    private static String text(MediaMetadata metadata, String key) { return metadata == null ? "" : bounded(metadata.getText(key)); }
    private static String bounded(CharSequence value) {
        return value == null ? "" : characters(value, Math.min(MAX_TEXT, value.length())).replaceAll("[\\p{Cntrl}]", " ").trim();
    }
    private static String characters(CharSequence value, int length) {
        StringBuilder result = new StringBuilder(length); for (int i = 0; i < length; i++) result.append(value.charAt(i)); return result.toString();
    }
    private static String notificationText(Bundle extras, String key) {
        try { return bounded(extras.getCharSequence(key)); } catch (RuntimeException | LinkageError optional) { return ""; }
    }
    private static String first(String... values) { for (String value : values) if (!value.isEmpty()) return value; return ""; }
    private static String randomId() { return UUID.randomUUID().toString().replace("-", ""); }

    private static Bitmap artwork(MediaMetadata metadata) {
        try {
            Bitmap source = metadata.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);
            if (source == null) source = metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
            if (source == null) source = metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
            return boundedArtwork(source);
        } catch (RuntimeException | OutOfMemoryError optional) { return null; }
    }
    @SuppressWarnings("deprecation")
    private static Bitmap notificationArtwork(Notification notification) {
        try {
            Bitmap source = notification.largeIcon;
            if (source == null && notification.extras != null) source = notification.extras.getParcelable(Notification.EXTRA_LARGE_ICON, Bitmap.class);
            return boundedArtwork(source);
        } catch (RuntimeException | OutOfMemoryError optional) { return null; }
    }
    private static Bitmap boundedArtwork(Bitmap source) {
        Bitmap scaled = null;
        try {
            if (source == null || source.isRecycled() || source.getWidth() < 1 || source.getHeight() < 1) return null;
            double scale = Math.min(1d, (double) MAX_ART_EDGE / Math.max(source.getWidth(), source.getHeight()));
            int width = Math.max(1, (int) Math.round(source.getWidth() * scale)), height = Math.max(1, (int) Math.round(source.getHeight() * scale));
            scaled = Bitmap.createScaledBitmap(source, width, height, true);
            Bitmap copy = scaled.copy(Bitmap.Config.ARGB_8888, false);
            if (copy != null && copy.getAllocationByteCount() <= MAX_ART_BYTES) return copy;
            if (copy != null) copy.recycle();
        } catch (RuntimeException | OutOfMemoryError optional) {
            // An optional cover cannot disable otherwise valid playback controls.
        } finally { if (scaled != null && scaled != source) scaled.recycle(); }
        return null;
    }
    private static void limitReply(Bundle result) {
        Parcel parcel = Parcel.obtain();
        try {
            parcel.writeBundle(result);
            if (parcel.dataSize() > MAX_REPLY_BYTES) {
                Bitmap art = result.getParcelable("art", Bitmap.class); result.remove("art"); if (art != null) art.recycle();
                ArrayList<Bundle> list = result.getParcelableArrayList("sources", Bundle.class);
                while (list != null && !list.isEmpty()) {
                    parcel.setDataSize(0); parcel.setDataPosition(0); parcel.writeBundle(result);
                    if (parcel.dataSize() <= MAX_REPLY_BYTES) break;
                    list.remove(list.size() - 1); result.putParcelableArrayList("sources", list); result.putBoolean("sources_limited", true);
                }
            }
        } finally { parcel.recycle(); }
    }
    private void claim(Request request) {
        requireDeadline(request); long now = SystemClock.elapsedRealtime(); seen.entrySet().removeIf(entry -> entry.getValue() <= now);
        if (seen.containsKey(request.id) || seen.size() >= MAX_ACTIONS) throw new IllegalStateException("media request already used or busy");
        seen.put(request.id, request.deadline);
    }
    private static void requireDeadline(Request request) {
        long now = SystemClock.elapsedRealtime();
        if (now < request.created || now >= request.deadline) throw new IllegalArgumentException("media request expired");
    }
    private Bundle unavailable(Throwable error) {
        forget(); Throwable actual = error;
        while (actual instanceof InvocationTargetException && actual.getCause() != null) actual = actual.getCause();
        boolean permission = actual instanceof SecurityException;
        boolean unsupported = actual instanceof NoSuchMethodException || actual instanceof ClassNotFoundException
                || actual instanceof IllegalAccessException || actual instanceof NoSuchMethodError || actual instanceof NoClassDefFoundError || actual instanceof AbstractMethodError;
        String reason = actual instanceof UserChanged ? "user_changed" : permission ? "permission_denied" : unsupported ? "unsupported" : "temporary_error";
        diagnostic("unavailable", reason, actual);
        Bundle result = empty(false, false, actual instanceof UserChanged ? "当前用户已变化，媒体来源已失效" : permission ? "无法读取媒体会话：系统未授予媒体控制权限"
                : unsupported ? "此系统缺少所需媒体接口，暂不支持媒体控制" : stage.startsWith("transport_") ? "媒体控制暂时失败，请重试" : "媒体暂时读取失败，请重试");
        result.putString("media_status", reason); result.putBoolean("retryable", !unsupported); return result;
    }
    private void forget() { observedToken = null; observedId = ""; observedSource = ""; observers.clear(); sources.clear(); tracks.clear(); notificationAuthorities.clear(); }
    @Override public void close() { closed = true; forget(); observers.close(); seen.clear(); }
    private void diagnostic(String capability, String reason, Throwable error) {
        String detail = "capability=" + capability + ";reason=" + reason + ";stage=" + stage + ";error=" + (error == null ? "none" : error.getClass().getSimpleName());
        if (detail.equals(lastDiagnostic)) return; lastDiagnostic = detail;
        AtomicWorkbenchDiagnostics.emit("MEDIA_CAPABILITY", -1, userId, "", -1, detail, error);
    }
    static Bundle closed() { Bundle result = empty(false, false, "工作台正在关闭，媒体控制暂不可用"); result.putString("media_status", "closed"); return result; }
    private static Bundle rejected(Bundle state, String message) { state.putBoolean("success", false); state.putString("message", message); return actionResult(state, false, false); }
    private static Bundle actionResult(Bundle state, boolean dispatched, boolean verified) {
        state.putBoolean("action_dispatched", dispatched); state.putBoolean("action_verified", verified); state.putBoolean("action_unknown", dispatched && !verified); return state;
    }
    private static Bundle empty(boolean success, boolean available, String message) {
        Bundle result = new Bundle(); result.putBoolean("success", success); result.putBoolean("available", available);
        result.putBoolean("has_session", false); result.putBoolean("playing", false); result.putString("session_id", ""); result.putString("source_id", "");
        result.putString("track_id", ""); result.putBoolean("track_known", false); result.putString("title", ""); result.putString("subtitle", "");
        result.putString("message", message); result.putString("media_status", "ready"); result.putBoolean("retryable", false);
        result.putBoolean("can_previous", false); result.putBoolean("can_play", false); result.putBoolean("can_pause", false); result.putBoolean("can_next", false);
        result.putBoolean("favorite_known", false); result.putBoolean("favorite", false); result.putBoolean("can_favorite", false); result.putBoolean("can_open_source", false);
        result.putBoolean("position_known", false); result.putBoolean("duration_known", false); result.putLong("position_ms", 0); result.putLong("duration_ms", 0);
        result.putLong("sample_elapsed_ms", 0); result.putFloat("speed", 0); result.putBoolean("progress_advancing", false);
        result.putString("notification_status", "unavailable"); result.putInt("source_count", 0); result.putBoolean("sources_limited", false);
        result.putParcelableArrayList("sources", new ArrayList<Bundle>()); return actionResult(result, false, false);
    }
    private static final class Request {
        final String id, source, track; final long created, deadline;
        Request(String action, Bundle value, long now) {
            if (!("select_source".equals(action) || "favorite_on".equals(action) || "favorite_off".equals(action) || "describe_open".equals(action))) throw new IllegalArgumentException("invalid media action");
            if (value == null || value.size() != 6 || !(value.get("schema") instanceof Integer) || value.getInt("schema") != 1
                    || !(value.get("request_id") instanceof String) || !(value.get("source_id") instanceof String) || !(value.get("track_id") instanceof String)
                    || !(value.get("created_elapsed") instanceof Long) || !(value.get("deadline_elapsed") instanceof Long)) throw new IllegalArgumentException("invalid media request");
            id = value.getString("request_id"); source = value.getString("source_id"); track = value.getString("track_id");
            created = value.getLong("created_elapsed"); deadline = value.getLong("deadline_elapsed"); boolean favorite = action.startsWith("favorite_");
            if (!id.matches("[0-9a-f]{32}") || !source.matches("[0-9a-f]{32}") || (favorite ? !track.matches("[0-9a-f]{32}") : !track.isEmpty())
                    || created < 0 || deadline <= created || deadline - created > ACTION_TTL || now < created || now >= deadline) throw new IllegalArgumentException("invalid media request identity or expiry");
        }
    }
    private static final class UserChanged extends IllegalStateException { }
    private static final class Identity { final int uid; final String pkg; Identity(int uid, String pkg) { this.uid = uid; this.pkg = pkg; } }
    private static final class Track { final String key, id = randomId(); final boolean known; Track(String key) { this.key = key; known = !key.isEmpty(); } }
    private static final class Selection {
        final MediaController controller; final MediaSession.Token token; final PlaybackState playback;
        final AtomicWorkbenchMediaSources.Source<MediaSession.Token> source; final int score; StatusBarNotification notification;
        AtomicWorkbenchMediaSessionEvidenceClient.Evidence evidence;
        Selection(MediaController controller, MediaSession.Token token, PlaybackState playback, AtomicWorkbenchMediaSources.Source<MediaSession.Token> source, int score) {
            this.controller = controller; this.token = token; this.playback = playback; this.source = source; this.score = score;
        }
    }
    private static final class Fresh {
        final List<Selection> all; Selection selected; boolean limited; String notificationStatus = "unavailable";
        Fresh(List<Selection> all, Selection selected, boolean limited) { this.all = all; this.selected = selected; this.limited = limited; }
        Selection find(String id) { for (Selection item : all) if (item.source.id.equals(id)) return item; return null; }
        Selection byToken(MediaSession.Token token) { for (Selection item : all) if (item.token.equals(token)) return item; return null; }
    }
}
