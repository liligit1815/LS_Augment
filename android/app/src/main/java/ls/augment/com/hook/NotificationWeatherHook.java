package ls.augment.com.hook;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.time.ZoneId;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Native header content, never a posted notification. OEM provider calls stay off main. */
final class NotificationWeatherHook {
    private static final String KEY = "ls_augment_rm_notification_weather";
    private static final String TYPE = "com.zte.controlcenter.widget.CCHeaderView";
    private static final String AUTHORITY = "content://com.zte.mifavor.weather.api/";
    // Verified against ExternalApiProvider.CITY_PROJECTION in the device's weather APK.
    private static final String[] COLUMNS = {"city_name", "weather_description", "curr_temper",
            "low_temper", "high_temper", "timeMills", "time_zone"};
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ScheduledExecutorService IO = worker("LS-notification-weather");
    private static final ScheduledExecutorService TIMEOUT = worker("LS-weather-timeout");
    private static final AtomicBoolean BUSY = new AtomicBoolean();
    private static final Map<View, State> STATES = new WeakHashMap<>();

    static int install(AugmentModule module, ClassLoader loader) {
        int count = 0;
        for (String method : new String[]{"onAttachedToWindow", "updateHeaderResources", "updateVisibilities"}) {
            count += hookNamed(module, loader, "qs.weather", TYPE, method, 0, null, (owner, args, result) -> {
                if (owner instanceof RelativeLayout && ((View) owner).isAttachedToWindow()) {
                    State state = STATES.get(owner);
                    if (state == null) {
                        state = new State((RelativeLayout) owner);
                        STATES.put((View) owner, state);
                        FeatureSettings.addSnapshotListener(((View) owner).getContext(), state.tick);
                    }
                    state.refresh();
                }
                return PASS;
            });
        }
        count += hookNamed(module, loader, "qs.weather", TYPE, "onDetachedFromWindow", 0, null, (owner, args, result) -> {
            State state = STATES.remove(owner);
            if (state != null) state.close();
            return PASS;
        });
        return count;
    }

    private static ScheduledExecutorService worker(String name) {
        return Executors.newSingleThreadScheduledExecutor(task -> {
            Thread thread = new Thread(task, name); thread.setDaemon(true); return thread;
        });
    }
    private static View child(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id == 0 ? null : root.findViewById(id);
    }
    private static final class State {
        final WeakReference<RelativeLayout> header;
        final Runnable tick = this::refresh;
        final android.view.ViewTreeObserver.OnGlobalLayoutListener layout = this::alignLabel;
        WeakReference<TextView> label = new WeakReference<>(null);
        Data data;
        long nextQuery;
        boolean closed;
        State(RelativeLayout view) {
            header = new WeakReference<>(view);
            view.getViewTreeObserver().addOnGlobalLayoutListener(layout);
        }
        void refresh() {
            MAIN.removeCallbacks(tick);
            RelativeLayout view = header.get();
            if (closed) return;
            if (view == null) { close(); return; }
            if (!view.isAttachedToWindow()) return;
            boolean active = FeatureSettings.enabled(view.getContext(), KEY)
                    && Integer.valueOf(2).equals(field(view, "panelType"));
            View date = child(view, "date_view");
            View nativeDate = child(view, "date");
            if (!active || !(date instanceof RelativeLayout) || !(nativeDate instanceof TextView)
                    || nativeDate.getParent() != date || date.getVisibility() != View.VISIBLE) {
                removeLabel(); return;
            }
            TextView text = label.get();
            if (text == null) {
                text = new TextView(view.getContext());
                text.setTag("ls_augment_notification_weather");
                text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                text.setSingleLine(true);
                text.setEllipsize(TextUtils.TruncateAt.END);
                text.setGravity(android.view.Gravity.START);
                text.setOnClickListener(clicked -> openWeather());
                RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-2, -2);
                lp.addRule(RelativeLayout.END_OF, nativeDate.getId());
                lp.addRule(RelativeLayout.ALIGN_BASELINE, nativeDate.getId());
                lp.setMarginStart(dp(view, 8));
                ((RelativeLayout) date).addView(text, lp);
                label = new WeakReference<>(text);
            }
            TextView source = (TextView) nativeDate;
            text.setTextColor(source.getTextColors());
            text.setTypeface(source.getTypeface());
            float size = source.getTextSize();
            if (text.getTextSize() != size) text.setTextSize(TypedValue.COMPLEX_UNIT_PX, size);
            String summary = data == null ? "暂无天气" : data.inline();
            if (!TextUtils.equals(summary, text.getText())) {
                text.setText(summary);
            }
            text.setContentDescription((data == null ? NotificationWeatherText.EMPTY : data.render())
                    .replace('\n', '，') + "，点击打开天气");
            alignLabel();
            PowerManager power = view.getContext().getSystemService(PowerManager.class);
            if (view.isShown() && power != null && power.isInteractive()
                    && SystemClock.elapsedRealtime() >= nextQuery && BUSY.compareAndSet(false, true)) {
                nextQuery = SystemClock.elapsedRealtime() + 60_000;
                Context context = view.getContext().getApplicationContext();
                IO.execute(() -> {
                    Data fresh = null;
                    CancellationSignal signal = new CancellationSignal();
                    ScheduledFuture<?> timeout = TIMEOUT.schedule(signal::cancel, 5, TimeUnit.SECONDS);
                    try {
                        fresh = read(context, "DefaultCityWeather", signal);
                        if (fresh == null && !signal.isCanceled()) fresh = read(context, "LocCityWeather", signal);
                    } catch (RuntimeException ignored) { /* Provider missing, denied or cancelled. */ }
                    finally { timeout.cancel(false); BUSY.set(false); }
                    Data result = fresh;
                    MAIN.post(() -> {
                        if (closed) return;
                        data = result; // Do not retain the previous city's values after a failed read.
                        nextQuery = SystemClock.elapsedRealtime() + (result == null ? 60_000 : 600_000);
                        refresh();
                    });
                });
            }
            MAIN.postDelayed(tick, 30_000);
        }
        void alignLabel() {
            RelativeLayout view = header.get(); TextView text = label.get();
            if (view == null || text == null || view.getWidth() <= 0) return;
            View date = child(view, "date");
            if (date == null) return;
            android.graphics.Rect rect = new android.graphics.Rect();
            date.getDrawingRect(rect); view.offsetDescendantRectToMyCoords(date, rect);
            int edge = view.getWidth() - view.getPaddingRight();
            // Carrier/emergency text may be a descendant of the OEM right-hand group.
            View carrier = child(view, "header_carrier_text");
            if (carrier != null && carrier.isShown() && carrier.getWidth() > 0) {
                android.graphics.Rect other = new android.graphics.Rect();
                carrier.getDrawingRect(other); view.offsetDescendantRectToMyCoords(carrier, other);
                if (other.top < rect.bottom && other.bottom > rect.top && other.left >= rect.right)
                    edge = Math.min(edge, other.left - dp(view, 8));
            }
            int available = Math.max(0, edge - rect.right - dp(view, 8));
            if (text.getMaxWidth() != available) text.setMaxWidth(available);
        }
        void openWeather() {
            RelativeLayout view = header.get(); if (view == null) return;
            Intent intent = view.getContext().getPackageManager().getLaunchIntentForPackage("com.zte.mifavor.weather");
            if (intent == null) return;
            try { call(view, "postStartActivityDismissingKeyguard", intent); nextQuery = 0; }
            catch (ReflectiveOperationException ignored) { }
        }
        void removeLabel() {
            TextView text = label.get();
            if (text != null && text.getParent() instanceof ViewGroup) ((ViewGroup) text.getParent()).removeView(text);
            label.clear();
        }
        void close() {
            closed = true; MAIN.removeCallbacks(tick);
            RelativeLayout view = header.get();
            if (view != null && view.getViewTreeObserver().isAlive())
                view.getViewTreeObserver().removeOnGlobalLayoutListener(layout);
            FeatureSettings.removeSnapshotListener(tick); removeLabel(); data = null;
        }
    }
    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
    private static Data read(Context context, String path, CancellationSignal signal) {
        try (Cursor cursor = context.getContentResolver().query(Uri.parse(AUTHORITY + path), COLUMNS,
                null, null, null, signal)) {
            if (cursor == null || !cursor.moveToFirst()) return null;
            String[] values = new String[COLUMNS.length];
            for (int i = 0; i < COLUMNS.length; i++) {
                int column = cursor.getColumnIndex(COLUMNS[i]);
                values[i] = column < 0 || cursor.isNull(column) ? "" : cursor.getString(column);
            }
            return NotificationWeatherText.temperature(values[2]).isEmpty() ? null : new Data(values);
        }
    }
    private static final class Data {
        final String[] values;
        Data(String[] values) { this.values = values; }
        String inline() {
            return NotificationWeatherText.inline(values[0], values[1], values[2]);
        }
        String render() {
            long updated = 0;
            try { updated = Long.parseLong(values[5]); } catch (NumberFormatException ignored) { }
            ZoneId zone = ZoneId.systemDefault();
            try { if (!values[6].isEmpty()) zone = ZoneId.of(values[6]); } catch (RuntimeException ignored) { }
            return NotificationWeatherText.format(values[0], values[1], values[2], values[3], values[4],
                    updated, System.currentTimeMillis(), zone);
        }
    }
    private NotificationWeatherHook() { }
}
