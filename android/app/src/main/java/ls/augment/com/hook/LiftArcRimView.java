/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;

/**
 * 沿锁屏可见底边绘制边缘效果的覆盖层，两种风格由配置切换：
 *
 * <ul>
 *   <li><b>iOS 式压暗（{@link #dim}，新默认）</b>：沿弧线切两半，压哪一半由
 *       {@link #dimUpper} 决定（设置页是二选一）—— 默认选<b>下半部分</b>：压弧线
 *       <b>以下</b>露出的区域，上部锁屏内容保持原样，强度 = {@link #dimStrength}
 *       固定值不随进度递增；选<b>上半部分</b>则压弧线<b>以上</b>的锁屏内容，下部露出的
 *       壁纸保持原样，强度 = 同一个 {@link #dimStrength} × {@code smoothstep(上滑进度)}，
 *       逐级加深到设定值。两种都靠明暗对比显出弧线，<b>不画任何描边</b>。</li>
 *   <li><b>传统描边</b>：只沿底边画一段光边（左下圆角 → 底边 → 右下圆角）。</li>
 * </ul>
 *
 * <p>宽度 / 不透明度 / 颜色由配置调节；<b>不画任何柔光、光晕、半透明薄雾</b> ——
 * 早前版本那圈“柔光”叠出来就是贴着底边的一小块灰色/黑色遮罩，已被整个删掉。
 * 裁切线以下压不压暗由 {@link #dim} 决定：压暗模式压黑，描边模式露原壁纸。
 */
final class LiftArcRimView extends View {

    private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    /** 压暗模式专用：整窗减去面板壳后剩下的「露出区」Path。 */
    private final Path revealPath = new Path();

    private LiftArcGeometry.Shape shell;

    /** 描边宽度（dp）。 */
    private float strokeWidthDp = 3f;
    /** 描边整体不透明度 0..1（只作用于传统描边；压暗模式看 {@link #dimStrength}）。 */
    private float rimAlpha = 1f;
    /** 压暗强度 0..1（只作用于压暗模式），0.57 = 旧版固定 145/255 那档。
     *  固定值直接套用，不随上滑进度递增。 */
    private float dimStrength = 0.57f;
    /** 描边颜色（压暗模式固定用黑，不读这个）。 */
    private int tintColor = 0xFFFFFFFF;
    /** true = iOS 式压暗；false = 传统描边。 */
    private boolean dim = true;
    /** 压暗哪一半：false = 弧线下方（默认），true = 弧线上方的锁屏内容。 */
    private boolean dimUpper;

    LiftArcRimView(Context context) {
        super(context);
        rimPaint.setStyle(Paint.Style.STROKE);
        setWillNotDraw(false);
    }

    void configure(float strokeWidthDp, float rimAlpha, int tintColor, boolean dim,
                   float dimStrength, boolean dimUpper) {
        boolean changed = this.strokeWidthDp != strokeWidthDp
                || this.rimAlpha != rimAlpha
                || this.tintColor != tintColor
                || this.dim != dim
                || this.dimStrength != dimStrength
                || this.dimUpper != dimUpper;
        this.strokeWidthDp = strokeWidthDp;
        this.rimAlpha = rimAlpha;
        this.tintColor = tintColor;
        this.dim = dim;
        this.dimStrength = dimStrength;
        this.dimUpper = dimUpper;
        if (changed) {
            invalidate();
        }
    }

    /** 更新壳；返回是否发生了变化。 */
    boolean update(LiftArcGeometry.Shape shape) {
        if (same(shell, shape)) {
            return false;
        }
        shell = shape;
        invalidate();
        return true;
    }

    void clear() {
        if (shell != null) {
            shell = null;
            invalidate();
        }
    }

    private static boolean same(LiftArcGeometry.Shape a, LiftArcGeometry.Shape b) {
        if (a == b) {
            return true;
        }
        if (a == null || b == null) {
            return false;
        }
        return a.visibleHeight == b.visibleHeight
                && a.top == b.top
                && a.topRadius == b.topRadius
                && a.bottomRadius == b.bottomRadius
                && a.rimAlpha == b.rimAlpha;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        LiftArcGeometry.Shape shape = shell;
        int w = getWidth();
        if (shape == null || w <= 0 || shape.visibleHeight <= 0f) {
            return;
        }
        if (dim) {
            // iOS 式压暗（1.0.20 起）：分界线永远是那条弧线 —— 上方是锁屏内容、
            // 下方是露出的壁纸，靠「自然 vs 压暗」的明暗对比显出弧线，不画任何描边。
            // dimUpper 决定压哪一半（设置页二选一）：
            //   下半部分（默认）= 压弧线下方露出的区域，深浅 = dimStrength 固定值，
            //                     手势一到就到满，不随进度递增；
            //   上半部分        = 压弧线上方的锁屏内容，起手那一帧弧线还在屏幕底边、
            //                     「上方」≈ 整块屏幕，故逐级加深（0 → dimStrength），
            //                     越滑越深，既不会一碰全屏变黑，也不是一次压到位。
            // 压暗固定用黑：arcColor 是给描边用的（默认月白），拿它来压会变成提亮。
            int vh = getHeight();
            if (dimStrength <= 0.01f || vh <= 0) {
                return;
            }
            // 面板壳与裁切同一条 Path（底边圆角外侧那两个小角归压暗一侧 —— 弧线就是分界线）
            LiftArcGeometry.path(path, w, shape);
            rimPaint.setStyle(Paint.Style.FILL);
            rimPaint.setStrokeWidth(0f);
            Path target;
            float strength = dimStrength;
            if (dimUpper) {
                // 逐级压暗：深浅 = 压暗强度 × smoothstep(上滑进度)，越滑越深、到设定值封顶，
                // 全程跟随「压暗强度」滑条缩放 —— 起手时 rise≈0 深浅也≈0，不会一碰就全屏变黑。
                // 进度取「内容已上移的屏高比例」rise（0 = 还没动，1 = 已整块滑出屏幕），
                // 不取 rimAlpha（= smoothstep(g)）：g 的行程是 MAX_SHIFT_RATIO×屏高，
                // 用 g 的话内容都滑出屏了深浅才到三成，看着像没生效。
                // smoothstep 自带 clamp，rise > 1 时稳定停在设定值。
                float rise = (vh - shape.visibleHeight) / vh;
                strength *= LiftArcGeometry.smoothstep(rise);
                if (255f * strength < 1f) {
                    return;
                }
                target = path;
            } else {
                revealPath.reset();
                revealPath.addRect(0f, 0f, w, vh, Path.Direction.CW);
                revealPath.op(path, Path.Op.DIFFERENCE);
                target = revealPath;
            }
            rimPaint.setColor(argb((int) (255f * strength), 0, 0, 0));
            canvas.drawPath(target, rimPaint);
            return;
        }

        float base = shape.rimAlpha * rimAlpha * ((tintColor>>>24)/255f);
        if (base <= 0.01f) {
            return;
        }

        // 传统描边：只画底边那一段（左下圆角 → 底边 → 右下圆角），
        // 不画整圈 roundRect：整圈的左右两条边压在屏幕边缘，柔光会糊出灰带。
        LiftArcGeometry.bottomPath(path, w, shape);

        float density = getResources().getDisplayMetrics().density;
        int tr = (tintColor >> 16) & 0xFF;
        int tg = (tintColor >> 8) & 0xFF;
        int tb = tintColor & 0xFF;

        float stroke = Math.max(strokeWidthDp * density, 0.5f);

        // 只画弧形描边本体：没有任何柔光/光晕层，底边不铺半透明“薄雾”，
        // 裁切线以下直接就是原壁纸。
        // style/strokeWidth 每帧都要显式写回：同一份 Paint 在压暗分支里被改成了 FILL/0，
        // 切回描边若不复位会画出一条糊掉的粗带。
        rimPaint.setStyle(Paint.Style.STROKE);
        rimPaint.setStrokeWidth(stroke);
        rimPaint.setColor(argb((int) (160f * base), tr, tg, tb));
        canvas.drawPath(path, rimPaint);
    }

    private static int argb(int a, int r, int g, int b) {
        int alpha = Math.max(0, Math.min(255, a));
        return (alpha << 24) | (r << 16) | (g << 8) | b;
    }
}
