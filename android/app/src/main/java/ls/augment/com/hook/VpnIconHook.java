package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ImageView;
import java.util.Collections;
import java.util.Set;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.VpnIconPainter;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Replaces only a fully visible native VPN icon, leaving VPN policy and animation intact. */
final class VpnIconHook {
    private static final String ICON = "com.android.systemui.statusbar.StatusBarIconView";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<View> VIEWS = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View, Boolean> SELECTIONS = new WeakHashMap<>();
    private static volatile VpnIconPainter painter;
    private static boolean observing;
    private static int renderedColor;
    private static boolean rendered;

    static int install(AugmentModule module, ClassLoader loader) {
        int count = hookNamed(module, loader, "vpn", ICON, "set", 1, null, (owner, args, result) -> {
            if (owner instanceof View) remember((View) owner);
            return PASS;
        });
        count += hookNamed(module, loader, "vpn", ICON, "onMeasure", 2, null, (owner, args, result) -> {
            if (owner instanceof View) remember((View) owner);
            return PASS;
        });
        count += hookNamed(module, loader, "vpn", ICON, "onDraw", 1, (owner, args, result) -> {
            if (!(owner instanceof View)) return PASS;
            View view = (View) owner;
            if (!eligible(view)) return PASS;
            int color = iconColor(view);
            float height = Math.min(view.getHeight(), VpnIconPainter.VIEWPORT_SIZE
                    * view.getResources().getDisplayMetrics().density);
            if (!painter.draw((Canvas) args[0], view.getPaddingLeft(), (view.getHeight() - height) / 2,
                    view.getWidth() - view.getPaddingLeft() - view.getPaddingRight(), height, color)) return PASS;
            if (!rendered || renderedColor != color) {
                rendered = true; renderedColor = color;
                FeatureSettings.diagnostic(view.getContext(), "ls_augment_vpn_rendered",
                        "art=shared-ring;style=1;color=" + Integer.toHexString(color));
            }
            return null;
        }, null);
        return count;
    }

    private static boolean isVpn(View view) { return "vpn".equals(field(view, "mSlot")); }
    private static boolean selected(View view) {
        return !RedMagicLegacyUiHook.positionSizeOnly(view.getContext())
                && FeatureSettings.integer(view.getContext(), ConfigSchema.STATUSBAR_VPN_STYLE, 0, 0, 1) == 1;
    }
    private static boolean eligible(View view) {
        VpnIconPainter ready = painter;
        if (!isVpn(view) || !selected(view) || ready == null || !ready.isReady()
                || view.getVisibility() != View.VISIBLE || !(view instanceof ImageView)
                || ((ImageView) view).getDrawable() == null) return false;
        // Let the existing drawable wrapper enforce hiding and draw all imported layers.
        // Its artwork takes priority over this built-in style whenever a layer is ready.
        if (StatusBarAssetsHook.hiddenByPolicy(view) || StatusBarAssetsHook.isHidden(view, "vpn")
                || StatusBarAssetsHook.layoutRendering(view).current) return false;
        Object amount = field(view, "mIconAppearAmount"), state = field(view, "mVisibleState");
        return amount instanceof Number && ((Number) amount).floatValue() == 1f
                && state instanceof Number && ((Number) state).intValue() == 0;
    }
    private static int iconColor(View view) {
        Object current = field(view, "mCurrentSetColor");
        if (current instanceof Integer && (Integer) current != 0) return (Integer) current;
        ColorStateList tint = ((ImageView) view).getImageTintList();
        if (tint != null) return tint.getColorForState(view.getDrawableState(), tint.getDefaultColor());
        for (String name : new String[]{"mDrawableColor", "mDecorColor"}) {
            Object color = field(view, name);
            if (color instanceof Integer && (Integer) color != 0) return (Integer) color;
        }
        return 0xffffffff;
    }
    static Rect contentBounds(View view) {
        if (!eligible(view)) return null;
        float height = Math.min(view.getHeight(), VpnIconPainter.VIEWPORT_SIZE
                * view.getResources().getDisplayMetrics().density);
        float width = view.getWidth() - view.getPaddingLeft() - view.getPaddingRight();
        float size = Math.min(width, height);
        float left = view.getPaddingLeft() + (width - size) / 2;
        float top = (view.getHeight() - size) / 2;
        if (size <= 0) return null;
        RectF ink = new RectF();
        VpnIconPainter.inkBounds(ink);
        float scale = size / VpnIconPainter.VIEWPORT_SIZE;
        return new Rect((int) Math.floor(left + ink.left * scale),
                (int) Math.floor(top + ink.top * scale),
                (int) Math.ceil(left + ink.right * scale),
                (int) Math.ceil(top + ink.bottom * scale));
    }
    private static void remember(View view) {
        if (!isVpn(view)) return;
        if(VIEWS.add(view))SELECTIONS.put(view,selected(view));
        if (!observing) observing = FeatureSettings.addSnapshotListener(view.getContext(), () -> MAIN.post(VpnIconHook::refresh));
        if (painter == null) painter = new VpnIconPainter(view.getContext());
    }
    private static void refresh() {
        for (View view : VIEWS) {
            boolean next=selected(view);Boolean previous=SELECTIONS.put(view,next);
            if(previous!=null&&previous==next)continue;
            StatusBarGridHook.invalidateLayout(view);
            view.invalidate();
        }
    }
}
