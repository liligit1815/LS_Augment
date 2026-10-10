/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;
import android.view.WindowInsets;

/**
 * 上滑联动用到的几何计算。
 *
 * 公式与绘制手法移植自 HyperBetter 的 {@code ShadePullGlass}：
 * 用一个"上角/下角可分别指定半径"的圆角矩形来描述锁屏内容的可见区域，
 * 底边（{@link Shape#visibleHeight}）随手指上滑不断上移，底边以下被裁掉、露出壁纸，
 * 描边则沿着同一条 Path 画出随屏幕圆角走的弧线。
 */
final class LiftArcGeometry {

    private LiftArcGeometry() {
    }

    /** 描述锁屏内容的可见壳：RectF(0, top, width, visibleHeight)。 */
    static final class Shape {
        /** 可见区域底边的 y。 */
        float visibleHeight;
        /** 上两角半径。 */
        float topRadius;
        /** 下两角半径。 */
        float bottomRadius;
        /** 描边/柔光强度系数 0..1。 */
        float rimAlpha;
        /** 可见区域顶边的 y（通常为负值，表示内容超出顶部）。 */
        float top;

        Shape(float visibleHeight, float topRadius, float bottomRadius, float rimAlpha, float top) {
            this.visibleHeight = visibleHeight;
            this.topRadius = topRadius;
            this.bottomRadius = bottomRadius;
            this.rimAlpha = rimAlpha;
            this.top = top;
        }

        Shape copy(float visibleHeight, float topRadius, float bottomRadius, float rimAlpha, float top) {
            return new Shape(visibleHeight, topRadius, bottomRadius, rimAlpha, top);
        }
    }

    /**
     * 由进度构造壳。
     *
     * @param progress 0 = 内容完全滑出（底边收到顶），1 = 内容完全在位
     */
    static Shape shape(int width, int height, float progress, float cornerRadius) {
        if (width <= 0 || height <= 0 || cornerRadius <= 0f) {
            return null;
        }
        float p = clamp01(progress);
        float visibleHeight = height * p;
        if (visibleHeight <= 0f) {
            return null;
        }
        float r = Math.min(cornerRadius, Math.min(height / 2f, width / 2f));
        // 顶边始终保持在 visibleHeight - height，即"内容整体位置"不变，只改可见底边
        return new Shape(visibleHeight, r, r, 1f, visibleHeight - height);
    }

    /** 用壳生成八角圆角矩形 Path（上角与下角可不同）。 */
    static void path(Path path, int width, Shape shape) {
        float t = shape.topRadius;
        float b = shape.bottomRadius;
        float[] radii = {t, t, t, t, b, b, b, b};
        path.reset();
        path.addRoundRect(
                new RectF(0f, shape.top, width, shape.visibleHeight),
                radii,
                Path.Direction.CW);
    }

    /**
     * 只画「可见底边」那一段：左下圆角 → 底边 → 右下圆角。
     *
     * <p>描边视图用这个 Path —— 早前用整条 roundRect 时，Path 的左右两条边正好压在
     * 屏幕左右边缘上，柔光会沿着整条屏幕边糊出一条灰带（反馈里的“灰色遮罩”）。
     * 裁切仍然用完整的 {@link #path}。
     */
    static void bottomPath(Path path, int width, Shape shape) {
        float r = Math.max(shape.bottomRadius, 0f);
        float bottom = shape.visibleHeight;
        path.reset();
        if (width <= 0f || r <= 0f) {
            return;
        }
        float rr = Math.min(r, width / 2f);
        path.moveTo(0f, bottom - rr);
        path.arcTo(new RectF(0f, bottom - 2f * rr, 2f * rr, bottom), 180f, -90f);
        path.lineTo(width - rr, bottom);
        path.arcTo(new RectF(width - 2f * rr, bottom - 2f * rr, width, bottom), 90f, -90f);
    }

    /** 读取屏幕圆角半径（取左右上角的较小值，回退到下角）。 */
    static float screenCornerRadius(View view) {
        WindowInsets insets = view.getRootWindowInsets();
        if (inverts(insets)) {
            return 0f;
        }
        float tl = corner(insets, 0);
        float tr = corner(insets, 1);
        float min = Math.min(tl, tr);
        if (min <= 0f) {
            float bl = corner(insets, 2);
            float br = corner(insets, 3);
            min = Math.min(bl, br);
        }
        return Math.max(min, 0f);
    }

    private static boolean inverts(WindowInsets insets) {
        return insets == null;
    }

    private static float corner(WindowInsets insets, int position) {
        try {
            android.view.RoundedCorner c = insets.getRoundedCorner(position);
            return c != null ? c.getRadius() : 0f;
        } catch (Throwable t) {
            return 0f;
        }
    }

    /** 通过 Outline 裁切一个 View（超出台壳的部分被裁掉，露出下层壁纸）。 */
    static final class Clip {
        private final Path path = new Path();
        private android.view.ViewOutlineProvider originalProvider;
        private boolean originalClip;
        private boolean installed;
        private float lastTop;
        private float lastBottom;
        private float lastRadius;
        private int lastWidth;
        private android.view.ViewOutlineProvider ownedProvider;

        void update(View view, Shape shape) {
            if (view == null || !view.isAttachedToWindow() || view.getWidth() <= 0 || shape == null) {
                clear(view);
                return;
            }
            float top = shape.top;
            float bottom = shape.visibleHeight;
            float radius = shape.bottomRadius;
            int width = view.getWidth();
            if (installed && view.getOutlineProvider()==ownedProvider && view.getClipToOutline() && top == lastTop && bottom == lastBottom
                    && radius == lastRadius && width == lastWidth) {
                return;
            }
            if (!installed) {
                originalProvider = view.getOutlineProvider();
                originalClip = view.getClipToOutline();
                installed = true;
            } else if (view.getOutlineProvider() != ownedProvider) {
                originalProvider = view.getOutlineProvider();
                originalClip = view.getClipToOutline();
            }
            lastTop = top;
            lastBottom = bottom;
            lastRadius = radius;
            lastWidth = width;
            ownedProvider = new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View v, Outline outline) {
                    path(path, width, shapeOf(v));
                    outline.setPath(path);
                }
            };
            view.setOutlineProvider(ownedProvider);
            view.setClipToOutline(true);
            view.invalidateOutline();
        }

        private Shape shapeOf(View v) {
            return new Shape(lastBottom, lastRadius, lastRadius, 1f, lastTop);
        }

        void clear(View view) {
            if (!installed || view == null) {
                return;
            }
            installed = false;
            if(view.getOutlineProvider()==ownedProvider) {
                view.setOutlineProvider(originalProvider);
                if(view.getClipToOutline())view.setClipToOutline(originalClip);
                view.invalidateOutline();
            }
            originalProvider = null;
            ownedProvider = null;
        }
    }

    /** smoothstep 缓动。 */
    static float smoothstep(float t) {
        float x = clamp01(t);
        return x * x * (3f - 2f * x);
    }

    static float clamp01(float v) {
        if (v < 0f) {
            return 0f;
        }
        if (v > 1f) {
            return 1f;
        }
        return v;
    }
}
