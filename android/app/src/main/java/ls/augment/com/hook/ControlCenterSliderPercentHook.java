package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.SeekBar;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Adds text to the upright native slider frame without changing its children or touch handling. */
final class ControlCenterSliderPercentHook {
    private static final String BRIGHTNESS = "com.zte.controlcenter.view.CCToggleSliderView";
    private static final String VOLUME = "com.zte.controlcenter.view.CCVolumeSliderView";
    private static final Map<View, State> STATES = new WeakHashMap<>();

    private ControlCenterSliderPercentHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        int count = hook(module, loader, BRIGHTNESS, "onFinishInflate", 0, null,
                (owner, args, result) -> { watch(owner, false); return PASS; });
        count += hook(module, loader, VOLUME, "onAttachedToWindow", 0, null,
                (owner, args, result) -> { watch(owner, true); return PASS; });
        return count;
    }

    private static void watch(Object owner, boolean volume) {
        if (!(owner instanceof View)) return;
        View view = (View) owner;
        State state = STATES.get(view);
        if (state == null) {
            state = new State(view, volume);
            STATES.put(view, state);
            view.addOnAttachStateChangeListener(state);
        }
        if (view.isAttachedToWindow()) state.attach();
    }

    private static View child(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id == 0 ? null : view.findViewById(id);
    }

    private static boolean named(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id != 0 && view.getId() == id;
    }

    private static final class State implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        final WeakReference<View> source;
        final boolean volume;
        final String key;
        final Runnable settingsChanged = this::refreshSafely;
        WeakReference<ViewGroup> frame = new WeakReference<>(null);
        WeakReference<SeekBar> slider = new WeakReference<>(null);
        WeakReference<View> icon = new WeakReference<>(null);
        ViewTreeObserver observer;
        PercentLabel label;
        boolean attached, added;

        State(View view, boolean volume) {
            source = new WeakReference<>(view);
            this.volume = volume;
            key = volume ? SystemUiOptions.QS_VOLUME_PERCENT : SystemUiOptions.QS_BRIGHTNESS_PERCENT;
        }

        void attach() {
            if (attached) return;
            View view = source.get();
            if (view == null) return;
            // The native SeekBars are rotated 270 degrees. Draw in their upright
            // FrameLayout, not on the SeekBar where text would rotate as well.
            View holder = volume && view.getParent() instanceof View
                    ? (View) view.getParent() : child(view, "slider_frame");
            View seek = volume ? view : child(view, "slider");
            if (!(holder instanceof ViewGroup) || !(seek instanceof SeekBar)) return;
            // Only the two top-panel controls; expanded volume dialogs keep their own UI.
            if (volume ? !named(holder, "volume_slider") : !named(view, "brightness_slider")) return;
            View symbol = child(holder, volume ? "volume_icon" : "toggle");
            if (symbol == null) return;
            frame = new WeakReference<>((ViewGroup) holder);
            slider = new WeakReference<>((SeekBar) seek);
            icon = new WeakReference<>(symbol);
            label = new PercentLabel();
            attached = true;
            observer = holder.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(view.getContext(), settingsChanged);
            refreshSafely();
        }

        void refreshSafely() {
            try { refresh(); }
            catch (Throwable error) {
                // Listener callbacks run outside the hook interceptor: fail closed
                // here too so an incompatible layout cannot crash SystemUI.
                hide();
                View view = source.get();
                if (view != null) FeatureSettings.diagnostic(view.getContext(),
                        "ls_augment_rm_qs_percent_error", error.toString());
            }
        }

        void refresh() {
            ViewGroup holder = frame.get();
            SeekBar seek = slider.get();
            View symbol = icon.get();
            if (!attached || holder == null || seek == null || symbol == null) return;
            if (!FeatureSettings.enabled(holder.getContext(), key)) { hide(); return; }
            int percent = ControlCenterPercent.of(seek.getProgress(), seek.getMin(), seek.getMax());
            if (percent < 0 || holder.getWidth() <= 0 || holder.getHeight() <= 0) { hide(); return; }
            float density = holder.getResources().getDisplayMetrics().density;
            // Keep text above the sun/speaker, including when native resources
            // resize the first row on rotation. Leave enough room for 100%.
            // Some native configurations hide the automatic-brightness icon.
            // A GONE icon has no laid-out position; keep its percentage visible.
            float bottom = symbol.getVisibility() != View.GONE && symbol.getHeight() > 0
                    ? symbol.getY() - 6f * density : holder.getHeight() / 2f + 7f * density;
            float available = bottom - 6f * density;
            float size = Math.min(14f * holder.getResources().getDisplayMetrics().scaledDensity,
                    Math.min(available / 1.4f, holder.getWidth() / 3.4f));
            if (size < 8f * density) { hide(); return; }
            label.update(percent + "%", holder.getWidth(), holder.getHeight(), bottom, size, density);
            if (!added) { holder.getOverlay().add(label); added = true; }
        }

        void hide() {
            ViewGroup holder = frame.get();
            if (added && holder != null && label != null) holder.getOverlay().remove(label);
            added = false;
        }

        void detach() {
            attached = false;
            FeatureSettings.removeSnapshotListener(settingsChanged);
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
            hide();
            label = null;
            frame.clear(); slider.clear(); icon.clear();
        }

        @Override public boolean onPreDraw() { refreshSafely(); return true; }
        @Override public void onViewAttachedToWindow(View view) {
            try { attach(); }
            catch (Throwable error) {
                detach();
                FeatureSettings.diagnostic(view.getContext(), "ls_augment_rm_qs_percent_error", error.toString());
            }
        }
        @Override public void onViewDetachedFromWindow(View view) { detach(); }
    }

    private static final class PercentLabel extends Drawable {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
        String text = "";
        float x, baseline, bottom, textSize, density;

        PercentLabel() {
            paint.setTextAlign(Paint.Align.CENTER);
            paint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        }

        void update(String next, int width, int height, float bottom, float size, float density) {
            if (next.equals(text) && getBounds().width() == width && getBounds().height() == height
                    && this.bottom == bottom && textSize == size && this.density == density) return;
            text = next; this.bottom = bottom; textSize = size; this.density = density;
            paint.setTextSize(size);
            // The native fill stays white in night mode too. Match its dark
            // icons; a light outline also keeps the unfilled portion readable.
            paint.setColor(0xff30343a);
            outline.set(paint);
            outline.setStyle(Paint.Style.STROKE);
            outline.setStrokeWidth(1.5f * density);
            outline.setColor(0xb0ffffff);
            x = width / 2f;
            baseline = bottom - paint.getFontMetrics().descent;
            setBounds(0, 0, width, height);
            invalidateSelf();
        }

        @Override public void draw(Canvas canvas) {
            canvas.drawText(text, x, baseline, outline);
            canvas.drawText(text, x, baseline, paint);
        }
        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha); outline.setAlpha(alpha * 176 / 255); invalidateSelf();
        }
        @Override public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter); outline.setColorFilter(filter); invalidateSelf();
        }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
