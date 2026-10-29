package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.SeekBar;
import java.util.List;
import ls.augment.com.LayerBackdropSource;
import ls.augment.com.LiquidGlassDrawable;

/** Runs both production owners of slider colors. Android/GPU behavior remains a facade. */
public final class TestControlCenterSliderGlassTheme {
    private static int checks;

    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }

    private static void night(View view, boolean enabled) {
        Configuration config = view.getResources().getConfiguration();
        config.uiMode = 5 | (enabled ? Configuration.UI_MODE_NIGHT_YES : Configuration.UI_MODE_NIGHT_NO);
        if (view instanceof ViewGroup) {
            for (View child : ((ViewGroup) view).children) night(child, enabled);
        }
    }

    private static final class Case {
        final String name;
        final ViewGroup panel;
        final View frame;
        final SeekBar seek;
        final View icon;
        final ControlCenterSliderTheme theme = new ControlCenterSliderTheme();
        final LayerDrawable layers = new LayerDrawable();
        final Drawable nativeTrack = layers.findDrawableByLayerId(android.R.id.background);
        final Drawable nativeFill = layers.findDrawableByLayerId(android.R.id.progress);
        final Drawable nativeFrame;
        final ColorStateList nativeFillTint = ColorStateList.valueOf(0xffeeeeee);
        final ColorStateList nativeTrackTint = ColorStateList.valueOf(0xffdddddd);
        final ColorStateList nativeIconTint = ColorStateList.valueOf(0xff30343a);
        boolean dark;

        Case(int kind, boolean initiallyDark) throws Exception {
            dark = initiallyDark;
            FeatureSettings.active = true;
            FeatureSettings.opaque = FeatureSettings.motion = false;
            if (kind == 2) {
                name = "horizontal brightness subclass";
                com.zte.mifavor.qs.MfvQSContainerImpl modern = new com.zte.mifavor.qs.MfvQSContainerImpl() {};
                panel = modern;
                seek = modern.brightnessView.mSlider;
                frame = seek;
                icon = new CompoundButton();
                nativeFrame = new Drawable();
                seek.setBackground(nativeFrame);
            } else {
                name = kind == 0 ? "vertical brightness" : "vertical volume";
                TestControlCenterGlass.Panel legacy = new TestControlCenterGlass.Panel();
                panel = legacy;
                ViewGroup upright = new ViewGroup();
                frame = upright;
                seek = new SeekBar() {};
                upright.addView(seek);
                icon = kind == 0 ? new CompoundButton() : new ImageView();
                upright.addView(icon);
                if (kind == 0) {
                    ViewGroup brightness = new ViewGroup();
                    upright.id = "slider_frame".hashCode();
                    seek.id = "slider".hashCode();
                    brightness.addView(upright);
                    legacy.topPanel.brightness = brightness;
                    legacy.topPanel.addView(brightness);
                } else {
                    legacy.topPanel.volume = upright;
                    legacy.topPanel.mVolumeSlider = seek;
                    legacy.topPanel.addView(upright);
                }
                nativeFrame = null;
                seek.rotation = 270;
            }
            seek.progress = layers;
            nativeTrack.setBounds(0, 0, 200, 80);
            nativeFill.tag = "progress";
            layers.setLevel(4700);
            seek.setProgressTintList(nativeFillTint);
            seek.setProgressBackgroundTintList(nativeTrackTint);
            if (icon instanceof ImageView) ((ImageView) icon).setImageTintList(nativeIconTint);
            else icon.setBackgroundTintList(nativeIconTint);
            night(panel, dark);
            TestControlCenterGlass.watch(panel);
        }

        LiquidGlassDrawable glass() throws Exception {
            Object surface = TestControlCenterGlass.field(layers.findDrawableByLayerId(android.R.id.background), "surface");
            return (LiquidGlassDrawable) TestControlCenterGlass.field(surface, "glass");
        }

        void mode(boolean value, boolean themeFirst) throws Exception {
            dark = value;
            night(panel, value);
            refresh(themeFirst);
        }

        void refresh(boolean themeFirst) throws Exception {
            // Exercise both pre-draw listener orders; neither owner may undo the other's colors.
            if (themeFirst) theme.refresh(seek, icon);
            panel.getViewTreeObserver().draw();
            if (!themeFirst) theme.refresh(seek, icon);
            verify();
        }

        void verify() throws Exception {
            check(theme.dark == dark, name + ": foreground follows runtime configuration");
            check(seek.getProgressDrawable() == layers && layers.findDrawableByLayerId(android.R.id.progress) == nativeFill,
                    name + ": native progress identity retained");
            check(nativeFill.getLevel() == 4700 && seek.getProgress() == 47 && seek.getMin() == 0 && seek.getMax() == 100,
                    name + ": native clipping level and range retained");
            check(dark ? seek.getProgressTintList().getDefaultColor() == 0xff555b63 : seek.getProgressTintList() == nativeFillTint,
                    name + ": progress switches between dark and original color");
            ColorStateList ink = icon instanceof ImageView ? ((ImageView) icon).getImageTintList() : icon.getBackgroundTintList();
            check(dark ? ink.getDefaultColor() == 0xfff2f3f5 : ink == nativeIconTint, name + ": icon color restored in day mode");
            if (dark && icon instanceof CompoundButton) check(ink.isStateful(), name + ": automatic brightness state color retained");
            if (FeatureSettings.active) {
                LiquidGlassDrawable material = glass();
                check(material.light == dark, name + ": GLASS TRACK MUST FOLLOW NIGHT MODE WITHOUT A TEXT LABEL");
                check(material.controlSurface && !material.iconOnly && material.radius == 16 && material.strength == 0,
                        name + ": glass material and native corners retained");
                check(seek.getProgressBackgroundTintList() == nativeTrackTint, name + ": no solid tint over glass");
                Canvas canvas = new Canvas();
                if (frame != seek) frame.getBackground().draw(canvas);
                layers.draw(canvas);
                check(canvas.events.equals(List.of("glass", "progress")), name + ": glass rendered under native fill");
            } else {
                check(layers.findDrawableByLayerId(android.R.id.background) == nativeTrack && frame.getBackground() == nativeFrame,
                        name + ": glass off restores native track and frame identities");
                check(dark ? seek.getProgressBackgroundTintList().getDefaultColor() == 0xff24272c
                        : seek.getProgressBackgroundTintList() == nativeTrackTint, name + ": glass off keeps correct track theme");
            }
        }

        void toggle(boolean enabled, boolean themeFirst) throws Exception {
            LiquidGlassDrawable old = FeatureSettings.active ? glass() : null;
            FeatureSettings.active = enabled;
            if (themeFirst) theme.refresh(seek, icon);
            FeatureSettings.changed();
            refresh(themeFirst);
            if (!enabled && old != null) check(old.released, name + ": switch off releases glass");
        }

        void close(boolean themeFirst) {
            if (themeFirst) theme.restore(seek, icon);
            panel.detach();
            if (!themeFirst) theme.restore(seek, icon);
            check(layers.findDrawableByLayerId(android.R.id.background) == nativeTrack && frame.getBackground() == nativeFrame,
                    name + ": detach restores both native drawable owners");
            check(seek.getProgressTintList() == nativeFillTint && seek.getProgressBackgroundTintList() == nativeTrackTint,
                    name + ": detach restores original tints");
            check(panel.getViewTreeObserver().listeners.isEmpty() && FeatureSettings.listeners == 0,
                    name + ": detach removes observers");
        }
    }

    private static void lifecycle(int kind, boolean themeFirst) throws Exception {
        Case c = new Case(kind, false);
        c.refresh(themeFirst);
        LiquidGlassDrawable initial = c.glass();
        int captures = LayerBackdropSource.created;
        c.mode(true, themeFirst);
        c.mode(false, themeFirst);
        c.mode(true, themeFirst);
        check(c.glass() == initial && LayerBackdropSource.created == captures,
                c.name + ": in-place modes reuse glass and capture source");
        c.toggle(false, themeFirst);
        c.mode(false, themeFirst);
        c.mode(true, themeFirst);
        c.close(themeFirst);
        c.panel.attach();
        c.refresh(themeFirst);
        c.toggle(true, themeFirst);
        c.mode(false, themeFirst);
        c.toggle(false, themeFirst);
        c.toggle(true, themeFirst);

        // Collapsing may hide an attached panel; expanding must read the new mode on its first frame.
        for (boolean dark : new boolean[]{true, false}) {
            c.panel.shown = false;
            c.dark = dark;
            night(c.panel, dark);
            c.panel.getViewTreeObserver().draw();
            c.panel.shown = true;
            c.refresh(themeFirst);
        }

        // Other ROMs detach/reuse the panel. Switch mode while detached, then expand again.
        for (boolean dark : new boolean[]{true, false, true}) {
            LiquidGlassDrawable old = c.glass();
            c.close(themeFirst);
            check(old.released, c.name + ": closing releases old material");
            c.dark = dark;
            night(c.panel, dark);
            c.panel.attach();
            c.refresh(themeFirst);
            check(c.glass() != old && !c.glass().released && FeatureSettings.listeners == 1,
                    c.name + ": reopen creates one live material and observer");
        }

        // Sampling failure must retain the themed glass fallback, not force an opaque slider.
        LiquidGlassDrawable material = c.glass();
        Object state = TestControlCenterGlass.field(material.source, "state");
        LayerBackdropSource source = (LayerBackdropSource) TestControlCenterGlass.field(state, "source");
        source.available = false;
        c.panel.getViewTreeObserver().draw();
        Canvas canvas = new Canvas();
        if (c.frame != c.seek) c.frame.getBackground().draw(canvas);
        c.layers.draw(canvas);
        check(material.light && canvas.events.equals(List.of("fallback", "progress")),
                c.name + ": dark translucent fallback retains native progress");
        source.available = true;
        c.refresh(themeFirst);
        c.close(themeFirst);
        check(LayerBackdropSource.created == LayerBackdropSource.releases && LiquidGlassDrawable.created == LiquidGlassDrawable.releases,
                c.name + ": all materials and captures released exactly once");
        Case recreated = new Case(kind, true);
        recreated.refresh(themeFirst);
        recreated.close(themeFirst);
        check(LayerBackdropSource.created == LayerBackdropSource.releases && LiquidGlassDrawable.created == LiquidGlassDrawable.releases,
                c.name + ": a new night-mode panel also releases cleanly");
    }

    private static void missingLayers() {
        SeekBar seek = new SeekBar();
        ControlCenterSliderTheme theme = new ControlCenterSliderTheme();
        night(seek, true);
        for (int missing : new int[]{0, android.R.id.background, android.R.id.progress}) {
            Drawable drawable = missing == 0 ? new Drawable() : new LayerDrawable();
            if (drawable instanceof LayerDrawable) ((LayerDrawable) drawable).layers.remove(missing);
            seek.progress = drawable;
            theme.refresh(seek, null);
            check(!theme.dark && seek.getProgressTintList() == null && seek.getProgressDrawable() == drawable,
                    "missing standard layers remain native");
        }
    }

    public static void main(String[] args) throws Exception {
        for (int kind = 0; kind < 3; kind++) {
            lifecycle(kind, true);
            lifecycle(kind, false);
        }
        missingLayers();
        System.out.println("PASS slider theme + glass lifecycle: " + checks
                + " checks (production hooks; Android facade; no device or GPU execution)");
    }
}
