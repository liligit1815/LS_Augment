package ls.augment.com.hook;

import android.content.Context;
import android.content.res.ColorStateList;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.SystemClock;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.SeekBar;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.IntSupplier;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Ordinary OEM rendering fed exclusively by a current user's live session and actual MediaData. */
final class NativeIslandMedia implements AutoCloseable {
    private static final List<WeakReference<Object>> DATA = new ArrayList<>();
    private static WeakReference<NativeIslandMedia> selected = new WeakReference<>(null);
    private static boolean dataCaptureReady;
    private final Object manager, permanent, island;
    private final View panel;
    private final Handler main;
    private final BooleanSupplier enabled;
    private final IntSupplier user;
    private final Consumer<String> diagnostic;
    private final Method dataUser, dataToken, allowed;
    private final List<?> allowList, excludeList;
    private final Map<MediaSession.Token, Session> sessions = new HashMap<>();
    private final Runnable refresh = this::sync, progress = this::updateProgress;
    private final MediaSessionManager.OnActiveSessionsChangedListener sessionListener = ignored -> request();
    private MediaSessionManager service;
    private MediaController controller;
    private int boundUser = -1;
    private boolean closed, seekOwned, scrubbing, shown;
    private Object lastData;
    private String lastPackage;
    private Boolean lastPlaying;
    private boolean contrastOwned;
    private ColorStateList originalButtonTint, originalTrackTint, originalBackgroundTint;
    private final View.OnAttachStateChangeListener panelLifecycle = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) { bindPanel(); updateProgress(); }
        @Override public void onViewDetachedFromWindow(View view) { main.removeCallbacks(progress); request(); }
    };

    static int install(AugmentModule module, ClassLoader loader) {
        int count = 0;
        try {
            Class<?> data = Class.forName("com.android.systemui.media.controls.shared.model.MediaData", false, loader);
            Class<?> type = Class.forName("com.android.systemui.media.controls.ui.controller.MediaControlPanel", false, loader);
            Method bind = NativeIslandSceneContract.method(type, "bindPlayer", void.class, data, String.class);
            if (bind == null) throw new NoSuchMethodException("MediaControlPanel.bindPlayer");
            Class<?> manager = Class.forName("com.zte.feature.dynamicisland.DynamicIslandManager", false, loader);
            Method update = require(manager, "updateMediaControllerStatus", void.class);
            module.registerFeatureHook(module.prepareFeatureHook(bind, "rm.ui.native_media.data", false).intercept(chain -> {
                Object result = chain.proceed(chain.getArgs().toArray());
                Object value = chain.getArgs().get(0);
                synchronized (DATA) {
                    DATA.removeIf(item -> item.get() == null || item.get() == value);
                    DATA.add(new WeakReference<>(value));
                    while (DATA.size() > 32) DATA.remove(0);
                }
                NativeIslandMedia owner = selected.get();
                if (owner != null) owner.request();
                return result;
            }));
            count++;
            module.registerFeatureHook(module.prepareFeatureHook(update, "rm.ui.native_media.sessions", false).intercept(chain -> {
                NativeIslandMedia owner = selected.get();
                if (owner != null && owner.manager == chain.getThisObject() && owner.enabled.getAsBoolean()) {
                    // The ordinary OEM loop overwrites its playing result with later paused sessions.
                    // Our owned listener selects an actual playing session, irrespective of ordering.
                    owner.request(); return null;
                }
                return chain.proceed(chain.getArgs().toArray());
            }));
            count++;
            dataCaptureReady = true;
        } catch (Throwable missing) { module.logFeatureError("NATIVE_MEDIA_DATA_CONTRACT", missing); }
        return count;
    }

    NativeIslandMedia(ClassLoader loader, Object manager, Object permanent, Object island, View panel,
            Handler main, BooleanSupplier enabled, IntSupplier user, Consumer<String> diagnostic) throws Exception {
        this.manager = manager; this.permanent = permanent; this.island = island; this.panel = panel;
        this.main = main; this.enabled = enabled; this.user = user; this.diagnostic = diagnostic;
        if (!dataCaptureReady) throw new IllegalStateException("native_media_data_capture_missing");
        Class<?> data = Class.forName("com.android.systemui.media.controls.shared.model.MediaData", false, loader);
        Class<?> utils = Class.forName("com.zte.feature.dynamicisland.DynamicIslandUtils", false, loader);
        dataUser = require(data, "getUserId", int.class);
        dataToken = require(data, "getToken", MediaSession.Token.class);
        allowed = NativeIslandSceneContract.method(utils, "shouldShowOnMediaIsland", boolean.class, String.class);
        Object list = utils.getField("MEDIA_ISLAND_LIST").get(null);
        if (!(list instanceof List<?>)) throw new IllegalStateException("media_allow_list_missing");
        allowList = (List<?>) list;
        java.lang.reflect.Field exclusions = NativeIslandSceneContract.field(utils, "MEDIA_ISLAND_EXCLUDE_LIST", List.class);
        excludeList = exclusions == null ? java.util.Collections.emptyList() : (List<?>) exclusions.get(null);
        require(permanent.getClass(), "updateMediaIsland", void.class, data, boolean.class, String.class);
        require(permanent.getClass(), "addPermanentIslandInner", void.class, island.getClass());
        require(permanent.getClass(), "removePermanentIsland", void.class, island.getClass());
        require(permanent.getClass(), "removeMediaIsland", void.class, boolean.class, int.class);
        require(permanent.getClass(), "isIslandExist", boolean.class, island.getClass());
        if (!(field(panel, "mMediaProgress") instanceof SeekBar)
                || !(field(panel, "mElapsedTime") instanceof TextView)
                || !(field(panel, "mTotalTime") instanceof TextView)
                || NativeIslandSceneContract.field(island.getClass(), "mCurrentUserContext", Context.class) == null)
            throw new IllegalStateException("media_progress_or_user_contract_missing");
        panel.addOnAttachStateChangeListener(panelLifecycle);
    }

    void request() { if (!closed) { main.removeCallbacks(refresh); main.post(refresh); } }

    private final class Session extends MediaController.Callback {
        final MediaController value;
        Session(MediaController value) { this.value = value; value.registerCallback(this, main); }
        @Override public void onPlaybackStateChanged(PlaybackState state) { request(); }
        @Override public void onMetadataChanged(MediaMetadata data) { request(); }
        @Override public void onSessionDestroyed() { request(); }
        void close() { value.unregisterCallback(this); }
    }

    private void sync() {
        if (closed || !enabled.getAsBoolean()) { suspend(); return; }
        try {
            int current = user.getAsInt();
            if (current < 0 || !Integer.valueOf(current).equals(field(island, "mCurrentUser"))) { suspend(); return; }
            if (boundUser != current) {
                suspend();
                Context context = (Context) field(island, "mCurrentUserContext");
                service = context.getSystemService(MediaSessionManager.class);
                if (service == null) throw new IllegalStateException("session_service_missing");
                service.addOnActiveSessionsChangedListener(sessionListener, null, main);
                boundUser = current; selected = new WeakReference<>(this);
            }
            List<MediaController> active = service.getActiveSessions(null);
            Map<MediaSession.Token, MediaController> next = new HashMap<>();
            for (MediaController session : active) {
                String pkg = session.getPackageName();
                boolean supported = allowed != null ? Boolean.TRUE.equals(allowed.invoke(null, pkg))
                        : allowList.contains(pkg) && !excludeList.contains(pkg);
                if (supported) next.put(session.getSessionToken(), session);
            }
            sessions.entrySet().removeIf(entry -> {
                if (next.containsKey(entry.getKey())) return false;
                entry.getValue().close(); return true;
            });
            for (Map.Entry<MediaSession.Token, MediaController> entry : next.entrySet())
                if (!sessions.containsKey(entry.getKey())) sessions.put(entry.getKey(), new Session(entry.getValue()));
            MediaController target = null;
            for (MediaController session : active) {
                PlaybackState state = session.getPlaybackState();
                if (next.containsKey(session.getSessionToken()) && state != null && state.getState() == PlaybackState.STATE_PLAYING) { target = session; break; }
            }
            if (target == null && controller != null) target = next.get(controller.getSessionToken());
            Object data = target == null ? null : dataFor(target, current);
            if (target == null || target.getPlaybackState() == null || data == null) {
                remove(); controller = null; lastData = null; lastPlaying = null;
                diagnostic.accept(target == null ? "media_idle" : "media_waiting_real_data"); return;
            }
            controller = target;
            boolean playing = target.getPlaybackState().getState() == PlaybackState.STATE_PLAYING;
            String pkg = target.getPackageName();
            if (lastData != data || !pkg.equals(lastPackage) || !Boolean.valueOf(playing).equals(lastPlaying)) {
                call(permanent, "updateMediaIsland", data, playing, pkg);
                lastData = data; lastPackage = pkg; lastPlaying = playing;
            }
            bindPanel();
            if (pkg.equals(field(manager, "mPkgName"))) remove();
            else if (playing) {
                call(permanent, "removeMediaIsland", false, 0);
                if (!Boolean.TRUE.equals(call(permanent, "isIslandExist", island))) call(permanent, "addPermanentIslandInner", island);
                shown = true;
            } else if (shown && !panel.isAttachedToWindow()) call(permanent, "removeMediaIsland", true, 3000);
            updateProgress();
            diagnostic.accept("media_session=" + pkg + ";playing=" + playing + ";panel=" + panel.isAttachedToWindow());
        } catch (Exception error) {
            suspend();
            diagnostic.accept("media_unavailable:" + error.getClass().getSimpleName() + ":" + error.getMessage());
        }
    }

    private Object dataFor(MediaController target, int current) throws Exception {
        synchronized (DATA) {
            for (int i = DATA.size() - 1; i >= 0; i--) {
                Object data = DATA.get(i).get();
                if (data != null && Integer.valueOf(current).equals(dataUser.invoke(data))
                        && target.getSessionToken().equals(dataToken.invoke(data))) return data;
            }
        }
        return null;
    }

    boolean ready() {
        return !closed && enabled.getAsBoolean() && controller != null && lastData != null
                && boundUser == user.getAsInt() && controller.getPlaybackState() != null;
    }

    private void bindPanel() {
        if (!ready()) return;
        set(panel, "mMediaController", controller);
        updateContrast();
        // Respect an already supplied OEM view model. On devices without one, use the same
        // native progress widgets with the actual session's duration, actions and seek command.
        if (field(panel, "mSeekBarViewModel") != null) return;
        SeekBar bar = (SeekBar) field(panel, "mMediaProgress");
        if (!seekOwned) {
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override public void onStartTrackingTouch(SeekBar view) { scrubbing = true; }
                @Override public void onProgressChanged(SeekBar view, int value, boolean fromUser) { }
                @Override public void onStopTrackingTouch(SeekBar view) {
                    scrubbing = false;
                    MediaController target = controller;
                    PlaybackState state = target == null ? null : target.getPlaybackState();
                    if (ready() && state != null && (state.getActions() & PlaybackState.ACTION_SEEK_TO) != 0)
                        target.getTransportControls().seekTo(view.getProgress());
                }
            });
            seekOwned = true;
        }
    }

    private void updateContrast() {
        Object title = field(panel, "mDisplayTitle"), button = field(panel, "mPanelPlayPause");
        if (!(title instanceof TextView) || !(button instanceof ImageView)) return;
        ImageView play = (ImageView) button;
        SeekBar bar = (SeekBar) field(panel, "mMediaProgress");
        if (!contrastOwned) {
            originalButtonTint = play.getImageTintList();
            originalTrackTint = bar.getProgressTintList();
            originalBackgroundTint = bar.getProgressBackgroundTintList();
            contrastOwned = true;
        }
        // Ordinary OEM assets use black fills even on the black island panel. Match its
        // actual title color while retaining the native paths, track geometry and opacity.
        int color = ((TextView) title).getCurrentTextColor();
        play.setImageTintList(ColorStateList.valueOf(color));
        bar.setProgressTintList(ColorStateList.valueOf(withOpacity(color, 0xa6)));
        bar.setProgressBackgroundTintList(ColorStateList.valueOf(withOpacity(color, 0x33)));
    }

    private static int withOpacity(int color, int opacity) {
        return (color & 0x00ffffff) | (((color >>> 24) * opacity / 255) << 24);
    }

    private void updateProgress() {
        main.removeCallbacks(progress);
        if (!ready() || !panel.isAttachedToWindow() || !seekOwned) return;
        PlaybackState state = controller.getPlaybackState();
        MediaMetadata metadata = controller.getMetadata();
        if (state == null) return;
        long duration = metadata == null ? 0 : metadata.getLong(MediaMetadata.METADATA_KEY_DURATION);
        long position = state.getPosition();
        if (state.getState() == PlaybackState.STATE_PLAYING && state.getLastPositionUpdateTime() > 0)
            position += (long) ((SystemClock.elapsedRealtime() - state.getLastPositionUpdateTime()) * state.getPlaybackSpeed());
        duration = Math.max(0, Math.min(Integer.MAX_VALUE, duration));
        position = Math.max(0, Math.min(duration, position));
        SeekBar bar = (SeekBar) field(panel, "mMediaProgress");
        bar.setEnabled(duration > 0 && (state.getActions() & PlaybackState.ACTION_SEEK_TO) != 0);
        bar.setMax((int) duration);
        if (!scrubbing) bar.setProgress((int) position);
        ((TextView) field(panel, "mElapsedTime")).setText(DateUtils.formatElapsedTime(position / 1000));
        ((TextView) field(panel, "mTotalTime")).setText(DateUtils.formatElapsedTime(duration / 1000));
        if (state.getState() == PlaybackState.STATE_PLAYING) main.postDelayed(progress, 500);
    }

    private void remove() throws Exception {
        if (!shown) return;
        call(permanent, "removeMediaIsland", false, 0);
        call(permanent, "removePermanentIsland", island); shown = false;
    }

    void suspend() {
        main.removeCallbacks(refresh); main.removeCallbacks(progress);
        for (Session session : sessions.values()) session.close(); sessions.clear();
        if (service != null) service.removeOnActiveSessionsChangedListener(sessionListener);
        service = null; boundUser = -1;
        try { remove(); } catch (Exception error) { diagnostic.accept("media_remove_failed"); }
        if (seekOwned) ((SeekBar) field(panel, "mMediaProgress")).setOnSeekBarChangeListener(null);
        seekOwned = false; scrubbing = false;
        if (contrastOwned) {
            ((ImageView) field(panel, "mPanelPlayPause")).setImageTintList(originalButtonTint);
            SeekBar bar = (SeekBar) field(panel, "mMediaProgress");
            bar.setProgressTintList(originalTrackTint);
            bar.setProgressBackgroundTintList(originalBackgroundTint);
            contrastOwned = false;
        }
        if (field(panel, "mMediaController") == controller) set(panel, "mMediaController", null);
        controller = null; lastData = null; lastPlaying = null; lastPackage = null;
        if (selected.get() == this) selected = new WeakReference<>(null);
    }

    @Override public void close() { if (!closed) { closed = true; suspend(); panel.removeOnAttachStateChangeListener(panelLifecycle); } }
    private static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method value = NativeIslandSceneContract.method(type, name, result, args);
        if (value == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return value;
    }
}
