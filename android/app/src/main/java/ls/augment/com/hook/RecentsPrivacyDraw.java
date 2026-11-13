package ls.augment.com.hook;

import android.graphics.Canvas;
import android.view.View;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/** Some launchers return from their own draw() before View's overlay is drawn. */
final class RecentsPrivacyDraw {
    private RecentsPrivacyDraw() { }

    static boolean install(AugmentModule module, Class<?> type, RecentsPrivacyOverlay.Painter painter) {
        final Method draw;
        try {
            draw = HookCompatibility.inheritedMethod(type, void.class, false,
                    new String[]{"draw"}, Canvas.class);
        } catch (NoSuchMethodException absent) { return false; }
        // Never replace View/FrameLayout.draw globally. Standard views retain the overlay path.
        String owner = draw.getDeclaringClass().getName();
        if (owner.startsWith("android.")) return false;
        Map<View, Boolean> drawn = new WeakHashMap<>();
        boolean[] failed = {false};
        module.registerFeatureHook(module.prepareFeatureHook(draw,
                "launcher.recents.privacy.draw", false).intercept(chain -> {
            if (type.isInstance(chain.getThisObject())) {
                View view = (View) chain.getThisObject();
                try {
                    boolean masked = painter.paint(view, (Canvas) chain.getArg(0));
                    Boolean previous = drawn.put(view, masked);
                    if (previous == null || previous != masked) {
                        FeatureSettings.diagnostic(view.getContext(), "ls_augment_recents_privacy_runtime",
                                masked ? "draw_masked;path=concrete_draw;owner=" + owner : "native_unselected;path=concrete_draw");
                    }
                    if (masked) return null;
                } catch (ReflectiveOperationException | RuntimeException error) {
                    drawn.remove(view);
                    if (!failed[0]) { failed[0] = true; module.logFeatureError("RECENTS_PRIVACY_CONCRETE_DRAW", error); }
                }
            }
            return chain.proceed();
        }));
        module.deoptimize(draw);
        module.logFeatureInfo("RECENTS_PRIVACY_DRAW_READY owner=" + owner);
        return true;
    }
}
