/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;

/**
 * 壁纸盖层：铺在锁屏窗口最底层（index 0），画一张与系统壁纸窗口同一套
 * center-crop 的壁纸位图 —— 真正垫底的壁纸长在**系统壁纸窗口**里、在我们窗口树外，
 * RenderEffect 够不着它；盖上这层再对它挂模糊，等于把被它画到的那半边背景糊掉。
 * 位图与玻璃纹理同源（LiftArcGlassStrip 那份解码），取景与 makeTileShader 完全一致，
 * 低半径阶段两张图逐像素对齐、看不出接缝。
 *
 * <p><b>只画弧线的一半（arcui7 拍板「只糊下面」）</b>：控制器逐帧喂进来的
 * {@link LiftArcGeometry.Shape} 就是压暗、内容裁切同源的那条弧线 —— 弧线<b>以上</b>
 * 一个像素都不画，透出系统壁纸保持清晰；弧线<b>以下</b>（内容升起后露出的区域）
 * 才铺这张位图去挂高斯。分界线与压暗分界线逐像素重合，正好被玻璃亮带盖住。
 * 糊哪半跟着「压暗半边」走（{@code dimUpper}，默认弧线以下）。
 *
 * <p>还没喂到弧线（刚建出来那一帧）就整层不画 —— 宁可这一轮不糊，绝不整屏糊；
 * 拿不到静态锁屏壁纸（超级/视频壁纸）就不建这层，也不拿固定截图冒充。
 */
final class LiftArcWallCoverView extends View {
    /** 铺满窗口的目标矩形（center-crop）：尺寸变化时算好，onDraw 零分配。 */
    private final Rect dst = new Rect();
    /** 弧线壳与「不糊的那半」剪裁区：字段复用，onDraw 零分配。 */
    private final Path shellPath = new Path();
    private final Path clipPath = new Path();
    private Bitmap bmp;
    /** 当前弧线壳；null = 还没喂弧，onDraw 整层不画。 */
    private LiftArcGeometry.Shape shell;
    /** 糊哪半：false = 弧线以下（默认，与压暗同侧），true = 弧线以上。 */
    private boolean blurUpper;

    LiftArcWallCoverView(Context context) {
        super(context);
        setWillNotDraw(false);
    }

    /** 换位图；同对象直接返回 —— 起滑逐帧对账时不产生失效/分配。 */
    void setBitmap(Bitmap b) {
        if (b == bmp) {
            return;
        }
        bmp = b;
        layoutDst(getWidth(), getHeight());
        invalidate();
    }

    /**
     * 逐帧喂分界弧线（与 rim/strip 同一份 Shape，窗口坐标）。
     * 只比几何四个字段：弧线随上滑每帧都在动 → 每帧重画，糊的区域跟着弧线走；
     * 数值没变（手指停住）就不失效，稳态零开销。
     */
    void setShell(LiftArcGeometry.Shape shape, boolean upper) {
        if (upper == blurUpper && same(shell, shape)) {
            return;
        }
        shell = shape;
        blurUpper = upper;
        invalidate();
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
                && a.bottomRadius == b.bottomRadius;
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        layoutDst(w, h);
    }

    /** 与 LiftArcGlassStrip.makeTileShader 同一套：max 比例铺满、居中裁切。 */
    private void layoutDst(int w, int h) {
        if (bmp == null || w <= 0 || h <= 0) {
            dst.setEmpty();
            return;
        }
        float scale = Math.max(w / (float) bmp.getWidth(), h / (float) bmp.getHeight());
        float dw = bmp.getWidth() * scale;
        float dh = bmp.getHeight() * scale;
        int left = Math.round((w - dw) * 0.5f);
        int top = Math.round((h - dh) * 0.5f);
        dst.set(left, top, left + Math.round(dw), top + Math.round(dh));
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (bmp == null || bmp.isRecycled() || dst.isEmpty()) {
            return;
        }
        int w = getWidth();
        int h = getHeight();
        LiftArcGeometry.Shape s = shell;
        if (s == null || w <= 0 || h <= 0) {
            // 没有弧线就没有分界：整层不画（真实壁纸透出来，只是不糊），
            // 绝不退回「全屏糊」—— 那正是 arcui6 被否掉的形态。
            return;
        }
        // 与压暗/裁切同一条弧切两半，只画「糊的那一半」：
        //   默认（压暗在下）= 矩形 − 壳 = 弧线以下的露出区，与 LiftArcRimView 的
        //   revealPath 同一条 op、逐像素同源；压暗在上 = 壳本身。
        LiftArcGeometry.path(shellPath, w, s);
        if (blurUpper) {
            canvas.clipPath(shellPath);
        } else {
            clipPath.reset();
            clipPath.addRect(0f, 0f, w, h, Path.Direction.CW);
            clipPath.op(shellPath, Path.Op.DIFFERENCE);
            canvas.clipPath(clipPath);
        }
        canvas.drawBitmap(bmp, null, dst, null);
    }
}
