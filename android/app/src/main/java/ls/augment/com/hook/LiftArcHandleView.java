/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

/**
 * 锁屏底部「小白条」的触控区。
 *
 * <p><b>条本体用系统自带的那一条</b>：直接 new 一个 SystemUI 自己的
 * {@code com.android.systemui.navigationbar.gestural.NavigationHandle} 作为子 View，
 * 尺寸（屏宽 32%）、圆角（{@code navigation_handle_radius} = 2.5dp → 高 5dp）、
 * 位置（{@code navigation_handle_bottom} = 7.5dp）、颜色（{@code homeHandleColor}）
 * 全部来自系统资源，跟手势导航那条完全一致。反射失败时才退化成按同款参数自绘。
 *
 * <p><b>触控区就是这条方框</b>：高 36dp、宽 = 条宽 + 左右各 16dp，贴着屏幕底边
 * （条周围 5dp 以上都能触发），不再是原来那块 44dp 高、盖在小白条上方的大区域。
 *
 * <p>本 View 同时承担上滑手势的捕获；系统 NavigationHandle 不可点击，
 * 事件会正常回落到本 View。
 */
final class LiftArcHandleView extends FrameLayout {

    /**
     * 手势回调，progress 始终为 0..1。
     *
     * <p>{@code velocityUpPx} = 松手瞬间手指的向上速度（px/s，正值 = 上滑），
     * 在 ACTION_UP 上由 {@link #velocityUpPx()} 现算后透出去，给「速度解锁」用。
     */
    interface Callback {
        void onDragStart(float y);

        void onDragMove(float dy, float progress);

        void onDragEnd(float dy, float progress, float velocityUpPx, boolean cancel);
    }

    /** navigation_handle_radius */
    private static final float SYSTEM_RADIUS_DP = 2.5f;
    /** navigation_handle_bottom */
    private static final float SYSTEM_BOTTOM_DP = 7.5f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    private Callback callback;
    private int handleColor;
    /** 系统 handle 装配失败时才自绘。 */
    private boolean fallback = true;

    private float downY;
    private float totalDy;
    private boolean dragging;
    /** 本次手势累计位移换算成进度时的分母（屏幕高度的某个比例）。 */
    private float rangePx = 1f;

    // ---- 松手速度采样（「速度解锁」用）----
    // 只留最近一小段 (事件时间, y)，松手时拿末段斜率当手指速度。
    private static final int VEL_N = 32;
    private static final long VEL_WINDOW_MS = 160L;
    private final long[] vT = new long[VEL_N];
    private final float[] vY = new float[VEL_N];
    private int vCount;

    LiftArcHandleView(Context context) {
        super(context);
        paint.setStyle(Paint.Style.FILL);
        setWillNotDraw(false);
        setClipChildren(false);
        // 自绘分支用系统 homeHandleColor；透明度走 View.alpha（由控制器统一给）
        handleColor = systemHandleColor();
    }

    void setCallback(Callback callback) {
        this.callback = callback;
    }

    /** 装配系统自带的手势条。 */
    void attachSystemHandle(View systemHandle) {
        if (systemHandle == null) {
            return;
        }
        fallback = false;
        addView(systemHandle, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
        post(this::restoreChildAlpha);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        // 系统 NavigationHandle 在它自己的 onAttachedToWindow 里会按
        // HomeHandleVisibilityController 把自己设成透明（系统那条在锁屏上就是隐藏的）。
        // 这里的 post 排在子 View attach 之后执行，保证恢复可见。
        post(this::restoreChildAlpha);
    }

    private void restoreChildAlpha() {
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child.getAlpha() != 1f) {
                child.setAlpha(1f);
                child.invalidate();
            }
        }
    }

    void setRange(float rangePx) {
        this.rangePx = Math.max(rangePx, 1f);
    }

    /** 供外部在回弹动画结束后把进度归零。 */
    void resetGesture() {
        dragging = false;
        totalDy = 0f;
    }

    /** 系统手势条的宽度：屏宽 * 0.32（竖屏）/ 0.21（横屏）。 */
    float systemBarWidth() {
        return getResources().getDisplayMetrics().widthPixels * factor();
    }

    private float factor() {
        int orientation = getResources().getConfiguration().orientation;
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 0.32f : 0.21f;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (!fallback) {
            return;
        }
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }
        float density = getResources().getDisplayMetrics().density;
        float radius = SYSTEM_RADIUS_DP * density;
        float barH = radius * 2f;
        float barW = Math.min(w, systemBarWidth());
        float left = (w - barW) / 2f;
        float bottom = h - SYSTEM_BOTTOM_DP * density;
        if (bottom - barH < 0f) {
            bottom = h;
        }
        rect.set(left, bottom - barH, left + barW, bottom);
        paint.setColor(handleColor);
        // View.alpha already composites the whole handle, including this fallback.
        paint.setAlpha(handleColor>>>24);
        canvas.drawRoundRect(rect, radius, radius, paint);
    }

    /**
     * 记一个 (事件时间, y) 样本；缓冲满就把最老的挤掉。
     *
     * <p>32 点在 120Hz 下约 267ms、60Hz 下约 533ms，都盖得住一次甩动。
     * 满了才开始移位，慢拖时不产生任何每帧开销。
     */
    private void vPush(long t, float y) {
        if (vCount < VEL_N) {
            vT[vCount] = t;
            vY[vCount] = y;
            vCount++;
            return;
        }
        System.arraycopy(vT, 1, vT, 0, VEL_N - 1);
        System.arraycopy(vY, 1, vY, 0, VEL_N - 1);
        vT[VEL_N - 1] = t;
        vY[VEL_N - 1] = y;
    }

    /**
     * 松手瞬间手指的向上速度，单位 px/s，正值 = 上滑。
     *
     * <p>取「末点往前、落在最近 {@link #VEL_WINDOW_MS} 内」的最早那个样本算斜率 ——
     * 只看最近一段，量到的才是**松手那一刻**在甩还是在拖；整段平均会把
     * 「先慢慢拖、最后一下甩」抹平。窗口里凑不出第二个时间点（慢拖且事件被系统
     * 批处理成同一时间戳）时就一直往前退，退到第一个 dt&gt;0 的样本对为止，
     * 全程退无可退才返回 0。
     *
     * <p>返回 0 = 速度判定不成立，调用方照旧走「进度 ≥ UNLOCK_THRESHOLD」那条路。
     */
    private float velocityUpPx() {
        if (vCount < 2) {
            return 0f;
        }
        int last = vCount - 1;
        long tLast = vT[last];
        float yLast = vY[last];
        int inWindow = -1;
        int nearest = -1;
        for (int i = last - 1; i >= 0; i--) {
            long dt = tLast - vT[i];
            if (dt <= 0L) {
                // 批处理出来的同时间戳点没有斜率可言，跳过它继续往前找
                continue;
            }
            if (nearest < 0) {
                nearest = i;
            }
            if (dt <= VEL_WINDOW_MS) {
                // 还在窗口内：继续往前，窗口里最老的那个基线才够长
                inWindow = i;
            } else {
                break;
            }
        }
        int first = inWindow >= 0 ? inWindow : nearest;
        if (first < 0) {
            return 0f;
        }
        long dt = tLast - vT[first];
        if (dt <= 0L) {
            return 0f;
        }
        // y 变小 = 手指往上 = 正速度
        return (vY[first] - yLast) * 1000f / (float) dt;
    }

    @SuppressLint("ClickableViewAccessibility")
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                // 控制中心开着时小白条整条让路：这次按下不消费，事件原样交给系统 ——
                // 上滑关控制中心、系统自己的手势都照常，解锁动画绝不误触发（1.0.22 反馈）
                if (LiftArcController.handleTouchBlocked()) {
                    return false;
                }
                downY = event.getRawY();
                totalDy = 0f;
                dragging = false;
                vCount = 0;
                vPush(event.getEventTime(), downY);
                // 一按下就告诉父窗口别拦截：锁屏窗口的 onInterceptTouchEvent 里
                // 有一堆 MIUI 的手势判断，晚一步这条手势就可能被抢走
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(true);
                }
                if (callback != null) {
                    callback.onDragStart(downY);
                }
                return true;

            case MotionEvent.ACTION_MOVE: {
                float dy = downY - event.getRawY();   // 上滑为正
                totalDy = dy;
                vPush(event.getEventTime(), event.getRawY());
                if (!dragging && Math.abs(dy) > 4f * getResources().getDisplayMetrics().density) {
                    dragging = true;
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                }
                if (dragging && callback != null) {
                    float progress = LiftArcGeometry.clamp01(totalDy / rangePx);
                    callback.onDragMove(totalDy, progress);
                }
                return true;
            }

            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL: {
                boolean cancel = event.getActionMasked() == MotionEvent.ACTION_CANCEL;
                vPush(event.getEventTime(), event.getRawY());
                if (callback != null) {
                    float progress = LiftArcGeometry.clamp01(totalDy / rangePx);
                    callback.onDragEnd(totalDy, progress, velocityUpPx(), cancel || !dragging);
                }
                vCount = 0;
                dragging = false;
                performClick();
                return true;
            }

            default:
                return super.onTouchEvent(event);
        }
    }

    /**
     * 系统 {@code homeHandleColor}（浅色主题那一档，通常就是半透明白）；
     * 读不到就退回 {@code navigation_bar_home_handle_light_color} = #80FFFFFF。
     */

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    int systemHandleColor() {
        try {
            int attr = getResources().getIdentifier("homeHandleColor", "attr", "android");
            if (attr == 0) {
                attr = getResources().getIdentifier("homeHandleColor", "attr",
                        "com.android.systemui");
            }
            if (attr != 0) {
                TypedValue tv = new TypedValue();
                if (getContext().getTheme().resolveAttribute(attr, tv, true)) {
                    if (tv.type >= TypedValue.TYPE_FIRST_COLOR_INT
                            && tv.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                        if ((tv.data >>> 24) >= 8) return tv.data;
                    }
                    if (tv.resourceId != 0) {
                        TypedValue value = new TypedValue();
                        getResources().getValue(tv.resourceId, value, true);
                        if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                                && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                            if ((value.data >>> 24) >= 8) return value.data;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
            // 读不到就用系统默认值
        }
        return 0x80FFFFFF;
    }

    @Override
    public boolean performClick() {
        super.performClick();
        return true;
    }
}
