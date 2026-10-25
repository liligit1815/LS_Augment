/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Looper;
import android.os.PowerManager;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.TextView;

import io.github.libxposed.api.XposedInterface;

/**
 * 锁屏上滑联动控制器：把 {@code keyguard_root_view} / {@code shared_notification_container}
 * 整体上移，同时按屏幕圆角裁切内容底边、沿底边绘制弧形描边，露出下层壁纸。
 *
 * <p>所有 View 操作都发生在 SystemUI 主线程（hook 的 {@code onAttachedToWindow} /
 * {@code dispatchTouchEvent}、ViewTreeObserver 回调都在线程上），配置变更会先 {@code post} 回主线程。
 *
 * <p>位移与裁切（几何手法沿用 HyperBetter 的 {@code ShadePullGlass}）：
 * 拉满进度时内容上移固定为 {@code height * MAX_SHIFT_RATIO}，<b>与跟手参数无关</b> ——
 * dragRatio 只改行程：{@code 行程 = MAX_SHIFT_RATIO×屏高 / followMul(dragRatio)}，
 * dragRatio=1 时行程恰好等于位移，手指动多少内容动多少（1:1 完全贴手），
 * 调小则行程变短、内容按 {@link #followMul} 倍率跑在手指前面；
 * 拉满行程时位移恒为 MAX_SHIFT_RATIO×屏高，不管 dragRatio 取多小内容都一定滑出屏幕，
 * 不会卡在半屏；
 * 可见底边 {@code edge = height - shift}；「上滑联动」开启时内容整体上移 {@code -shift}，
 * 裁切壳就是内容自身的 bounds + 屏幕圆角，经过 {@code translationY} 后圆角底边正好落在
 * {@code edge} 上；关闭时内容不动，裁切壳的底边直接抬到 {@code edge}，只靠裁切露出壁纸。
 * 描边则始终按窗口坐标下从 {@code edge - height} 到 {@code edge} 的圆角矩形绘制。
 */
final class LiftArcController implements LiftArcHandleView.Callback, LiftArcConfig.Listener {

    private static final String TAG = "RedMagicDuo.LiftArc";
    private static final String PKG = "com.android.systemui";

    /** 松手回弹时长（与 HyperBetter 的 smoothstep 回弹一致）。 */
    private static final long RETURN_MS = 240L;
    /**
     * 解锁兜底检查的宽限：动画<b>结束后</b>再等这么久，才回头看内容有没有被接管。
     *
     * <p>必须是「时长 + 宽限」而不是一个固定值 —— 时长现在是可调的（150..800ms，
     * 来自 {@code config.unlockMs}），兜底若写死 700ms，用户把时长拉到 800 就会在
     * 条还在飞的半路上把它拽回去，那一下反而比不做兜底还难看。
     */
    private static final long UNLOCK_GRACE_MS = 400L;
    /**
     * 小白条触控区高度（dp）。条本体只有 5dp、离底 7.5dp，
     * 触控区给到 36dp：条下方 7.5dp、上方 23dp、左右各 16dp，远超“条周围 5dp”。
     */
    private static final float HANDLE_HEIGHT_DP = 36f;
    /** 触控区左右比条本体各多出的宽度（dp）。 */
    private static final float HANDLE_H_PAD_DP = 16f;
    /** 松手时进度达到该值就直接进入系统解锁界面（仿 iOS）。 */
    private static final float UNLOCK_THRESHOLD = 0.5f;
    /** 进度到 1 时内容最大上移比例，避免可见区域被裁成 0。 */
    private static final float MAX_SHIFT_RATIO = 0.96f;

    /** {@link #onWindowIntercept}：交给系统原来的逻辑判断。 */
    static final int INTERCEPT_DEFAULT = 0;
    /** {@link #onWindowIntercept}：强制不拦截（保证小白条手势不被窗口抢走）。 */
    static final int INTERCEPT_NO = 1;
    /** {@link #onWindowIntercept}：强制拦截（拦掉系统自己的上滑解锁）。 */
    static final int INTERCEPT_YES = 2;

    /** {@link #onWindowTouchPre}：原样放行事件。 */
    static final int TOUCH_PASS = 0;
    /** {@link #onWindowTouchPre}：吞掉事件（不交给系统，本次上滑在系统眼里不存在）。 */
    static final int TOUCH_SWALLOW = 1;
    /**
     * {@link #onWindowTouchPre}：放行，但改写成 {@link MotionEvent#ACTION_CANCEL} 再放行。
     *
     * <p>只给“吞过 MOVE 的手势”的收尾用：子树收到的是 {@code DOWN → 无 MOVE → UP}，
     * 任何按事件流判手势的观察者（GestureDetector、可点子 View）都会当成一次单击而误触发；
     * 改发 {@code ACTION_CANCEL} 就是标准的“手势被收走”语义，观察者与子 View 都干净复位。
     */
    static final int TOUCH_PASS_AS_CANCEL = 2;
    /** 时间最多能被上移多少：自身高度的一半（仿 iOS 的“露一半”）。 */
    private static final float LIFT_MAX_RATIO = 0.5f;
    /**
     * 量到的“时间本体”高度下限（占屏高）。
     *
     * <p>有些模板的时/分视图在布局里是 0dp，量出来会是 0；卡个下限，保证上限至少是原来的
     * {@code 屏高 × 0.1 × 0.5}。
     */
    private static final float LIFT_SPAN_MIN_RATIO = 0.1f;
    /** 量到的“时间本体”高度上限（占屏高），免得把整屏都当成时间。 */
    private static final float LIFT_SPAN_MAX_RATIO = 0.25f;
    /** 时间回弹动画时长。 */
    private static final long LIFT_RETURN_MS = 460L;
    /** 时间回弹的过冲量（>1 会先越过原位再弹回，就是那个“弹性”）。 */
    private static final float LIFT_OVERSHOOT = 2f;

    private static final Interpolator SMOOTHSTEP = LiftArcGeometry::smoothstep;

    private static LiftArcController sInstance;

    /** 锁屏状态：-1 未知（还没收到回调），0 不在锁屏，1 在锁屏且未被遮挡。 */
    private static int sKeyguardState = -1;
    /**
     * 控制中心是否展开中：true = 控制中心开着，整套上滑系统让路 —— 拦截不再吞事件、
     * 小白条这次按下不消费（1.0.22 反馈：开着控制中心时上滑被模块劫持）。
     * 两条 hook 路径汇到这里（见 {@link #onControlCenterOpen}），volatile 供触线程读。
     */
    private static volatile boolean sControlCenterOpen;
    private static boolean sDozing, sBouncerShowing;
    private static boolean nativeTouchReserved;
    private long lastConflictCheck=-1000;
    private final java.util.IdentityHashMap<View, Float> anchorLastY=new java.util.IdentityHashMap<>();
    private final java.util.IdentityHashMap<View, Translation> translations = new java.util.IdentityHashMap<>();
    /** {@link #resolve()} 的重试上限，避免 id 不存在时每次布局都全树查找。 */
    private static final int MAX_RESOLVE_TRY = 5;
    /** {@link #resolveClock()} 的重试上限（时间容器可能比锁屏其它部分晚出现）。 */
    private static final int MAX_CLOCK_TRY = 200;
    /**
     * 副层时间容器（{@code miui_keyguard_foreground_clock_container}）的重试上限。
     *
     * <p>分层时钟模板里“分钟”会被拆到这一层，而非分层模板它永远是空的，所以要多给几次机会。
     */
    private static final int MAX_CLOCK_SECOND_TRY = 2000;
    /** 远端配置拉取失败时的重试上限。 */
    private static final int MAX_CONFIG_TRY = 10;

    private int resolveTry;
    private int configLoadTry;
    private PowerManager powerManager;

    /** 窗口根（{@code NotificationShadeWindowView}，本质是 FrameLayout）。 */
    private final ViewGroup window;
    private final LiftArcConfig config;
    private final XposedInterface module;

    private FrameLayout overlay;
    private LiftArcRimView rim;
    /** 液态玻璃描边条（设置项「液态玻璃实时渲染弧形描边」，1.0.22）。 */
    private LiftArcGlassStrip strip;
    private LiftArcHandleView handle;
    /** 小白条上方的自定义文字（配置 hint_text 为空时不显示）。 */
    private TextView hint;

    private View keyguardRoot;
    private View sharedNotif;
    private View notificationPanel;
    private View bouncer;

    private LiftArcGeometry.Clip clipRoot = new LiftArcGeometry.Clip();
    private LiftArcGeometry.Clip clipNotif = new LiftArcGeometry.Clip();
    private LiftArcGeometry.Clip clipPanel = new LiftArcGeometry.Clip();

    /** 当前进度 0（复位）..1（拉满）。 */
    private float progress;
    /** 上一次 apply 的进度，用于避免重复写 translationY。 */
    private float lastApplied = Float.NaN;
    /** 背景模糊：上次写进 view 的半径（px）；-1 = 当前没挂效果。半径没变就不重建 effect。 */
    private int lastBlurRadius = -1;
    /** 全屏壁纸盖层：铺在 window 最底层（index 0），盖住系统壁纸窗口那张真正垫底的壁纸。 */
    private LiftArcWallCoverView cover;
    private boolean clipInstalled;
    /**
     * 壁纸/景深层的原始 translationY（首次反向补偿时记录，复位时还原）。
     * key=候选 View（身份语义），value=收集时刻它自己的 translationY。
     */
    private final java.util.IdentityHashMap<View, Float> anchorBaseY =
            new java.util.IdentityHashMap<>();
    /** 本轮手势是否已收集过锚定候选（空结果也要置位，避免每帧重扫整棵树）。 */
    private boolean anchorCollected;

    private float rangePx = 1f;
    private float startProgress;
    private int lastTickBucket = -1;

    private float radiusCache;
    private ValueAnimator animator;
    /** 解锁那一下的延时兜底；非空 = 有一道还没跑的检查，见 {@link #armUnlockGuard()}。 */
    private Runnable unlockGuard;

    // ---------------------------------------------------------------- 触摸拦截
    /** 本次手势的落点（窗口坐标）。 */
    private float downX;
    private float downY;
    /** 落点是否在小白条触控区里（是就绝不能被窗口拦截）。 */
    private boolean downInHandle;
    /** 已经决定要拦掉系统这次上滑。 */
    private boolean blockSystemSwipe;
    /**
     * 本次手势是否“归通知所有”——<b>只在 DOWN 判一次，整把不再变</b>；true = 这把手永不拦截。
     *
     * <p>以前这个判定挂在每个 MOVE 上重算，列表翻到底的一瞬间判定翻转，拦截在手势<b>中途</b>
     * 才生效，时间从此跟着手指上下蹿（反馈的“翻动通知时间上下滑动”）。现在按下那一刻定死。
     */
    private boolean gestureExempt;
    /** {@link ViewConfiguration#getScaledTouchSlop()}，懒加载。 */
    private int touchSlop;
    /** 本次手势是否已经 dump 过视图树（诊断遮罩用）。 */
    private boolean viewsDumped;
    /** 本窗口已经成功拦截过多少次系统上滑（诊断用）。 */
    private int blockCount;

    // ---------------------------------------------------------------- 时间上移（仿 iOS）
    /** 时间容器（{@code miui_keyguard_clock_container}），上移就是改它的 translationY。 */
    private View clockRoot;
    /**
     * 分层时钟的副层容器（{@code miui_keyguard_foreground_clock_container}）。
     *
     * <p>一部分模板（{@code oversize_a / classic_max / all_in_one / eastern_* …}）会把
     * <b>分钟</b>那半张表拆到另一层，见 {@code MiuiKeyguardUtils#SECONDARY_LAYER_CLOCK_TEMPLATE_ID}。
     * 只抬主层的话就变成“时在动、分不动”——必须两个一起抬。
     */
    private View clockSecond;
    /** 时间本体（{@code clock_container1}），用来算“只能上移一半”的上限。 */
    private View clockTime;
    private int clockTry;
    private int clockSecondTry;
    /** 当前上移距离（px），0 = 归位。 */
    private float lift;
    /** 手指还按着、正在跟手。 */
    private boolean liftTracking;
    /** 时间容器被我们改动前的原始 translationY（系统可能自己也在写）。 */
    private float clockBaseY = Float.NaN;
    private float clockSecondBaseY = Float.NaN;
    private ValueAnimator liftAnimator;

    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = new ViewTreeObserver.OnGlobalLayoutListener() {
        @Override
        public void onGlobalLayout() {
            try { sync(); } catch(Throwable error) { LiftArcRuntime.error("锁屏布局同步",error); }
        }
    };

    private LiftArcController(ViewGroup window, LiftArcConfig config, XposedInterface module) {
        this.window = window;
        this.config = config;
        this.module = module;
    }

    // ------------------------------------------------------------------ 入口

    static void onWindowAttached(Object w, LiftArcConfig config, XposedInterface module) {
        // Context 的第二道兜底：万一 attachBaseContext 那个 hook 在这台 ROM 上没挂住，
        // 只要窗口起来了就还有一次机会（代价是安装阶段那几条日志会晚到）。
        if (w instanceof android.view.View) {
            try {
                LiftArcLog.setContext(((android.view.View) w).getContext());
            } catch (Throwable ignored) {
                // 拿不到也只是 App 内看不到日志
            }
        }
        LiftArcController c = obtain(w, config, module);
        if (c == null) {
            return;
        }
        config.bind(c.window.getContext());
        LiftArcRuntime.bind(config,c.window.getContext());
        c.ensureInstalled();
        c.sync();
    }

    /**
     * {@code NotificationShadeWindowView#dispatchTouchEvent} 前置回调。
     *
     * <p>这是整棵视图树最外层的入口：{@code requestDisallowInterceptTouchEvent} 影响不到它，
     * 所以在这里把事件直接吞掉，系统那条“上滑解锁”就<b>根本不会发生</b> ——
     * 这比在 {@code onInterceptTouchEvent} 里改返回值可靠得多（反馈里“拦截没用”就是卡在那一步）。
     *
     * @return {@link #TOUCH_PASS} 原样放行；{@link #TOUCH_SWALLOW} 吞掉；
     *     {@link #TOUCH_PASS_AS_CANCEL} 改写成 {@link MotionEvent#ACTION_CANCEL} 后放行
     */
    static int onWindowTouchPre(Object w, LiftArcConfig config, MotionEvent ev) {
        if (w == null || ev == null) {
            return TOUCH_PASS;
        }
        LiftArcController c = sInstance;
        if (c == null || c.window != w) {
            return TOUCH_PASS;
        }
        return c.preTouch(ev);
    }

    /** {@code NotificationShadeWindowView#dispatchTouchEvent} 后置回调（事件已交给系统）。 */
    static void onWindowTouchPost(Object w, LiftArcConfig config) {
        LiftArcController c = obtain(w, config, null);
        if (c == null) {
            return;
        }
        config.bind(c.window.getContext());
        LiftArcRuntime.bind(config,c.window.getContext());
        c.ensureInstalled();
        c.sync();
    }

    /**
     * {@code NotificationShadeWindowView#onInterceptTouchEvent} 回调。
     *
     * <p>只做一件事：落点在小白条触控区里 → 强制不拦截，保证这条手势一定由小白条接管。
     * （拦掉系统上滑已经改到 {@link #onWindowTouchPre} 里了。）
     *
     * @return {@link #INTERCEPT_DEFAULT} / {@link #INTERCEPT_NO}
     */
    static int onWindowIntercept(Object w, LiftArcConfig config, MotionEvent ev) {
        if (w == null || ev == null) {
            return INTERCEPT_DEFAULT;
        }
        LiftArcController c = sInstance;
        if (c == null || c.window != w) {
            return INTERCEPT_DEFAULT;
        }
        return c.intercept(ev);
    }

    private int intercept(MotionEvent ev) {
        switch (ev.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = ev.getX();
                downY = ev.getY();
                downInHandle = !nativeTouchReserved && inHandleBox(downX, downY);
                break;

            case MotionEvent.ACTION_MOVE:
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                break;

            default:
                break;
        }
        // 小白条自己的手势：窗口任何时候都不许抢
        return downInHandle ? INTERCEPT_NO : INTERCEPT_DEFAULT;
    }

    /**
     * 事件进入系统之前先过一遍。
     *
     * <ul>
     *   <li>{@code DOWN} 只记落点，永远放行（放行才拿得到后续事件）；</li>
     *   <li>{@code MOVE} 真的成了“从下往上的解锁手势”就从此吞掉，系统那条上滑彻底消失；</li>
     *   <li>吞掉期间同步驱动“时间上移”，到时间高度一半就停住（禁止继续滑动）；</li>
     *   <li>{@code UP/CANCEL} 放行（让系统的状态标记正常清零），时间做弹性回弹。
     *       但本次手势<b>吞过 MOVE</b> 的话，{@code UP} 改写成 {@code ACTION_CANCEL}
     *       再放行：子树此前只收到 {@code DOWN} 和没超 slop 的 MOVE，收 {@code UP}
     *       会被观察事件流的一方（如锁屏歌词模块的 GestureDetector）判成单击而误触发，
     *       改收 {@code CANCEL} 则是标准的“手势被收走”，各方干净复位；</li>
     * </ul>
     *
     * @return {@link #TOUCH_PASS} / {@link #TOUCH_SWALLOW} / {@link #TOUCH_PASS_AS_CANCEL}
     */
    private int preTouch(MotionEvent ev) {
        switch (ev.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = ev.getX();
                downY = ev.getY();
                nativeTouchReserved = config.enabled && overlay!=null && overlay.getVisibility()==View.VISIBLE
                        && (onNativeShortcut(downX,downY)||onNotificationRow(downX,downY));
                downInHandle = !nativeTouchReserved && inHandleBox(downX, downY);
                blockSystemSwipe = false;
                gestureExempt = resolveGestureExempt();
                // 上一次手势如果还悬着（回弹中途又按下），先把时间放回原位
                clearLift();
                return TOUCH_PASS;

            case MotionEvent.ACTION_MOVE: {
                boolean newlyClaimed=false;
                if (downInHandle) {
                    return TOUCH_PASS;
                }
                // 必须真的是“往上滑”才拦，否则点一下（带点抖动）也会被打断
                if (!blockSystemSwipe
                        && (downY - ev.getY()) > touchSlop()
                        && shouldBlockSystemSwipe()) {
                    blockSystemSwipe = true;
                    newlyClaimed=true;
                    liftTracking = true;
                    blockCount++;
                    noteBlock("block#" + blockCount
                            + "@" + Math.round(downY * 100f / Math.max(1, window.getHeight()))
                            + "%");
                }
                if (blockSystemSwipe) {
                    updateLift(ev.getY());
                    return newlyClaimed ? TOUCH_PASS_AS_CANCEL : TOUCH_SWALLOW;
                }
                return TOUCH_PASS;
            }

            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (liftTracking) {
                    liftTracking = false;
                    springLiftBack();
                }
                // 本手势吞过 MOVE：按“手势被收走”收尾，把 UP 改写成 CANCEL 放行（见方法注释）。
                // 否则（普通点击、落在触控区的手势、可滚动区的滑动）UP 原样放过去：
                // 面板只收到 DOWN+UP（没超过 slop 的 MOVE 都还给过它），
                // 既不会开始拖动，系统的 touchActive 等状态标记也能正常清零
                boolean swallowMove = blockSystemSwipe;
                blockSystemSwipe = false;
                if (swallowMove && ev.getActionMasked() == MotionEvent.ACTION_UP) {
                    return TOUCH_PASS_AS_CANCEL;
                }
                return TOUCH_PASS;

            default:
                return TOUCH_PASS;
        }
    }

    private int touchSlop() {
        if (touchSlop <= 0) {
            try {
                touchSlop = android.view.ViewConfiguration
                        .get(window.getContext()).getScaledTouchSlop();
            } catch (Throwable t) {
                touchSlop = 16;
            }
        }
        return touchSlop;
    }

    /** 落点是否在小白条触控区（含跟随上移的 translationY）。 */
    private boolean inHandleBox(float x, float y) {
        if (handle == null || overlay == null || overlay.getVisibility() != View.VISIBLE) {
            return false;
        }
        float left = handle.getLeft() + handle.getTranslationX();
        float top = handle.getTop() + handle.getTranslationY();
        return x >= left && x <= left + handle.getWidth()
                && y >= top && y <= top + handle.getHeight();
    }

    /**
     * 是否该拦掉“系统自己的上滑解锁”。
     *
     * <p>范围是<b>整块锁屏</b>，只有小白条自己的触控区除外（那由 {@link #preTouch} 的
     * {@code downInHandle} 单独放行）——反馈要求“把拖动区域放到整个屏幕，盖掉系统的上滑解锁”，
     * 早前的“起点必须在下半屏 / 不能贴左右边”两条划区判断已按要求删除。
     *
     * <p>例外两条：① 落点<b>压在通知行上</b>——那一把手势整个归通知，我们绝不插手
     * （翻动、点击、侧滑删除都原样走系统），这条在 {@code DOWN} 时一次性判死
     * （{@link #resolveGestureExempt()}）；② <b>控制中心展开中</b>——锁屏上的上滑归系统
     * （开合控制中心），拦截与小白条整套让路（1.0.22 反馈：开着控制中心时上滑被模块劫持，
     * 关不掉控制中心、底部上滑还误触发解锁）。空白区 / 时钟区一律拦：真机上那些区域的上滑
     * NSSL 不消费，不拦就漏给系统上滑解锁（v1.0.26 反馈）。
     */
    private boolean shouldBlockSystemSwipe() {
        if (!config.interceptSwipe || sKeyguardState == 0) {
            return false;
        }
        // 控制中心开着：这条上滑归系统（用户要开合控制中心），我们整套让路
        if (sControlCenterOpen) {
            return false;
        }
        // 覆盖层可见 = 「在锁屏上 + 没弹密码盘 + 模块启用 + 屏幕亮着」，
        // 比单看 sKeyguardState 可靠（后者拿不到回调时一直是 -1）
        if (overlay == null || overlay.getVisibility() != View.VISIBLE) {
            return false;
        }
        if (sBouncerShowing || sDozing) {
            return false;   // 密码盘上的上滑是系统自己的，别碰
        }
        if (window.getWidth() <= 0 || window.getHeight() <= 0) {
            return false;
        }
        if (handle != null && progress > 0f) {
            return false;   // 我们自己正在拖
        }
        return !gestureExempt;
    }

    /**
     * 本次手势归不归通知所有——<b>只在 {@code DOWN} 判一次，整把手势不再变</b>。
     *
     * <p>判定两条，都是「这把手势不归我们」：① <b>控制中心展开中</b>——系统的开合手势优先，
     * 一步 DFS 都不用走（1.0.22 反馈：开着控制中心时上滑被模块吞掉，关不掉也往上推不动）；
     * ② 按下点<b>压在通知行上</b>（整树 DFS 找 {@code ExpandableNotificationRow}）
     * → 这把手势整个归通知，永不拦截。原“底下列表还能翻也不拦”的 {@code hitsScrollable}
     * 豁免在 v1.0.27 删除：真机上<b>空白区</b>的上滑 NSSL 根本不消费，事件会直接漏给系统
     * 上滑解锁（1.0.26 实测“空白区域大概率触发系统的上滑”就是它放的行）；而压在通知上时
     * 列表自己会消费（1.0.26 已验证），行豁免一条就够。
     *
     * <p>判定顺序先便宜后贵：小白条手势 / 功能没开 / 确定不在锁屏 / 控制中心展开 / 窗口没量好
     * / 覆盖层不可见都直接判“不拦”（这些情形下 {@link #shouldBlockSystemSwipe()} 本来也过不了）。
     */
    private boolean resolveGestureExempt() {
        if (downInHandle || !config.interceptSwipe || sKeyguardState == 0 || sControlCenterOpen) {
            return true;
        }
        if (window == null || window.getWidth() <= 0 || window.getHeight() <= 0) {
            return true;   // 窗口还没量好：拿不准，宁可不拦
        }
        if (overlay == null || overlay.getVisibility() != View.VISIBLE) {
            return true;   // 覆盖层不可见 = 不在锁屏，本来就拦不了
        }
        boolean exempt = onNotificationRow(downX, downY) || onNativeShortcut(downX,downY);
        if (exempt) {
            // 诊断：走到这里豁免只可能来自“压在通知行上”。空白区若还漏拦，
            // 这条会给出漏拦落点的 Y%，直接判别是不是行判定误报
            LiftArcLog.d("DOWN@" + Math.round(downY * 100f / Math.max(1, window.getHeight()))
                    + "%压通知行·不拦");
            LiftArcLog.flush();
        }
        return exempt;
    }

    /**
     * 落点是不是压在一条通知上——<b>整棵窗口树按边界裁剪 DFS 找</b>，不走 {@link #topmostAt}。
     *
     * <p>窗口里在通知之上还摞着一层全屏空壳（消息容器、低亮动画、模糊层、控制中心壳、AOD 壳……）：
     * 真机分发遇到“不消费”的壳会掉到下面的兄弟，但 {@code topmostAt} 会卡在壳上把链条截断——
     * 1.0.25 就是这么漏的：链条里既数不到通知行也数不到 NSSL，两个豁免同时落空，
     * 于是通知手势也被拦、时钟跟着手指上下蹿、通知反而滚不动。
     * 这里换成带边界裁剪的 DFS：只要有一条<b>可见</b>通知行盖着落点，
     * 这把手势就归通知，{@link #shouldBlockSystemSwipe()} 永不认领。
     */
    private boolean onNotificationRow(float x, float y) {
        return rowAt(window, x, y, overlay);
    }

    private static boolean rowAt(ViewGroup root, float x, float y, View skip) {
        for (int i = root.getChildCount() - 1; i >= 0; i--) {
            View c = root.getChildAt(i);
            if (c == skip || c.getVisibility() != View.VISIBLE || c.getAlpha() <= 0f) {
                continue;
            }
            float l = c.getLeft() + c.getTranslationX();
            float t = c.getTop() + c.getTranslationY();
            if (x < l || x > l + c.getWidth() || y < t || y > t + c.getHeight()) {
                continue;   // 边界裁剪：落点不在这棵子树里
            }
            if (c.getClass().getName().contains("ExpandableNotificationRow")) {
                return true;
            }
            if (c instanceof ViewGroup && rowAt((ViewGroup) c, x - l, y - t, skip)) {
                return true;
            }
        }
        return false;
    }

    // v1.0.27：原 hitsScrollable（“底下列表还能翻 → 整把手势不拦”）已删除。真机上空白区的
    // 上滑 NSSL 并不消费，放行等于直接漏给系统上滑解锁（1.0.26 实测反馈）；压在通知行上时
    // 列表自己会消费，豁免由 resolveGestureExempt 的“行判定”一条承担。不要再加回来——
    // §20 否决的是“上滑盖掉通知滚动”，那个意图由行豁免保证，与本方法无关。

    /** 这个滚动容器还能不能继续往下滑（手指上划）。拿不准就当“能滑”，宁可不拦。 */
    private static boolean canScrollDown(View v) {
        try {
            if (v.canScrollVertically(1)) {
                return true;
            }
        } catch (Throwable ignored) {
            // 走下面的兜底
        }
        try {
            java.lang.reflect.Method own = v.getClass().getMethod("getOwnScrollY");
            java.lang.reflect.Method range = v.getClass().getMethod("getScrollRange");
            Object a = own.invoke(v);
            Object b = range.invoke(v);
            if (a instanceof Integer && b instanceof Integer) {
                return ((Integer) a).intValue() < ((Integer) b).intValue();
            }
        } catch (Throwable ignored) {
            // 不是 NSSL 这类容器
        }
        return false;
    }

    private static View parentOf(View v) {
        return v.getParent() instanceof View ? (View) v.getParent() : null;
    }

    /**
     * 从窗口根往下找落点处“真的会接住事件”的最上层视图（{@code skip} 是我们自己的覆盖层）。
     *
     * <p>与 1.0.25 之前的关键区别：<b>子树里没人接、自己也不是可点/滚动的视图时，
     * 掉到 index 更小的兄弟继续找</b> —— 真机分发里 {@code onTouchEvent} 返回 false 的视图
     * 就是这样被跨过去的。窗口里摞着的全屏空壳（消息容器、低亮动画、模糊层、
     * 控制中心壳、AOD 壳……）全靠这条掉过去；旧实现会卡在壳上、把命中链截断，
     * 两个豁免同时落空 → 通知手势被误拦。
     */
    private static View topmostAt(ViewGroup root, float x, float y, View skip) {
        for (int i = root.getChildCount() - 1; i >= 0; i--) {
            View c = root.getChildAt(i);
            if (c == skip || c.getVisibility() != View.VISIBLE || c.getAlpha() <= 0f) {
                continue;
            }
            float l = c.getLeft() + c.getTranslationX();
            float t = c.getTop() + c.getTranslationY();
            if (x < l || x > l + c.getWidth() || y < t || y > t + c.getHeight()) {
                continue;
            }
            if (c instanceof ViewGroup) {
                View deeper = topmostAt((ViewGroup) c, x - l, y - t, skip);
                if (deeper != null) {
                    return deeper;
                }
            }
            if (selfHandles(c)) {
                return c;   // 子树没人接，但它自己会接（可点 / 滚动容器）：就是它
            }
            // 不接就当没看见，继续找下面的兄弟
        }
        return null;
    }

    /** 这个视图会不会自己消费触摸：可点，或者是（内嵌的）滚动容器。 */
    private static boolean selfHandles(View v) {
        if (v.isClickable() || v.isLongClickable() || v.hasOnClickListeners()) {
            return true;
        }
        String n = v.getClass().getName();
        return n.contains("Scroll") || n.contains("Recycler")
                || n.contains("ListView") || n.contains("ViewPager");
    }

    /** {@code KeyguardStateControllerImpl#notifyKeyguardState} 回调。 */
    static void onKeyguardState(boolean showing, boolean occluded) {
        sKeyguardState = (showing && !occluded) ? 1 : 0;
        final LiftArcController c = sInstance;
        if (c == null) {
            return;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            c.sync();
        } else {
            c.window.post(c::sync);
        }
    }

    /**
     * 控制中心展开状态回调 —— 两条 hook 路径都打到这里（keyguard 侧
     * {@code onExpandChanged(boolean)}、container 委托 {@code onVisibleChanged(boolean)}），
     * 谁先响谁算，互为兜底。值没变不记日志，稳态零开销。
     */
    static void onControlCenterOpen(boolean open) {
        if (sControlCenterOpen == open) return;
        sControlCenterOpen = open;
        if(sInstance!=null)sInstance.sync();
        LiftArcLog.d(open ? "控制中心展开·上滑手势让路" : "控制中心收起·拦截恢复");
        LiftArcLog.flush();
    }

    /** 控制中心开着时给 {@link LiftArcHandleView} 用：小白条这次按下直接不消费。 */
    static boolean controlCenterOpen() {
        return sControlCenterOpen;
    }
    static boolean handleTouchBlocked() {
        return sControlCenterOpen||sDozing||sBouncerShowing||nativeTouchReserved;
    }

    private static LiftArcController obtain(Object w, LiftArcConfig config, XposedInterface module) {
        if (!(w instanceof ViewGroup)) {
            return null;
        }
        ViewGroup vg = (ViewGroup) w;
        LiftArcController c = sInstance;
        if (c == null || c.window != vg) {
            if (module == null) {
                return null; // 还没经过 attach，先不创建
            }
            if(c!=null)onWindowDetached(c.window);
            c = new LiftArcController(vg, config, module);
            sInstance = c;
            config.setListener(c);
        }
        return c;
    }

    // ------------------------------------------------------------------ 装配

    private void ensureInstalled() {
        if (overlay != null) {
            return;
        }
        android.content.Context ctx = window.getContext();
        float density = window.getResources().getDisplayMetrics().density;

        overlay = new FrameLayout(ctx);
        overlay.setClipChildren(false);
        overlay.setClipToPadding(false);

        rim = new LiftArcRimView(ctx);
        rim.configure(config.arcWidth, config.arcAlpha, config.arcColor, config.arcDim,
                config.dimStrength, config.dimUpper);
        overlay.addView(rim, matchParent());

        // 玻璃条压在描边/压暗之上（玻璃是材质，不该被一层黑纱盖掉），但在小白条之下（触控优先）。
        // 黑纱在玻璃下面 = 带外的壁纸已经变暗、带内取的却是原图，所以 shader 里要按
        // 同一条弧线把压暗同步补上（setRim 后两项），否则玻璃与压暗背景之间是硬割裂。
        strip = new LiftArcGlassStrip(ctx);
        LiftArcRuntime.wallpaperPending();
        // 描边参数必须与上面 rim.configure 的五项同源：画在哪 / 多宽 / 要不要画 / 压哪半 / 压多深
        strip.setRim(config.arcWidth, config.arcAlpha, config.arcDim,
                config.dimStrength, config.dimUpper);
        strip.setGlassThickness(config.glassThick);
        // 「玻璃参数」页的九项：**必须排在 setGlassEnabled 之前** —— 否则开关一开
        // 就先 rebuild 了一次，用的还是字段初值，紧接着又 rebuild 一次才拿到真值。
        // 字段初值恰好等于默认配置，所以两次结果一样，但顺序写死更省心。
        applyGlassTuning(strip, config);
        strip.setGlassEnabled(config.glassLive);
        overlay.addView(strip, matchParent());

        handle = new LiftArcHandleView(ctx);
        handle.setCallback(this);
        attachSystemHandle(ctx);

        // 触控区 = 小白条周围一大块：条高 5dp、离底 7.5dp，
        // 触控盒高 36dp（下方 7.5dp、上方 23dp）+ 条宽左右各 16dp。
        // 开了「扩大触控范围」就整条贴满屏宽：条本体由子 View / 自绘居中，外观不变
        int handleWidth = config.handleWide
                ? ViewGroup.LayoutParams.MATCH_PARENT
                : Math.max(1,
                        (int) (handle.systemBarWidth() + 2f * HANDLE_H_PAD_DP * density));
        FrameLayout.LayoutParams handleLp =
                new FrameLayout.LayoutParams(handleWidth,
                        Math.max(1, (int) (HANDLE_HEIGHT_DP * density)),
                        Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        overlay.addView(handle, handleLp);

        // 小白条上方的自定义文字（配置 hint_text 为空时隐藏）
        hint = new TextView(ctx);
        hint.setGravity(Gravity.CENTER);
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        hint.setTextColor(0xD9FFFFFF);
        hint.setShadowLayer(4f * density, 0f, 0f, 0x66000000);
        hint.setSingleLine(true);
        hint.setVisibility(View.GONE);
        FrameLayout.LayoutParams hintLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        hintLp.bottomMargin = (int) ((HANDLE_HEIGHT_DP + 10f) * density);
        overlay.addView(hint, hintLp);
        updateHint();

        // NotificationShadeWindowView 的父类链是 WindowRootView -> FrameLayout
        FrameLayout.LayoutParams windowLp =
                new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT);
        window.addView(overlay, windowLp);

        {
            // 壁纸能力预探测，关闭主开关时同样能开启视觉配置；壁纸盖层预热：位图加载是异步的，等起滑那一刻才开始就来不及（第一次上滑会没糊）
            strip.ensureWallpaperForBlur();
        }

        try {
            window.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        } catch (Throwable t) {
            log("failed to add layout listener", t);
        }
        fadeHandle(0f);
    }

    static void onWindowDetached(Object owner) {
        LiftArcController c=sInstance;if(c==null||c.window!=owner)return;
        c.reset();c.restoreBlurAll();c.restoreAnchors();
        c.detachTarget(c.keyguardRoot,c.clipRoot);c.detachTarget(c.sharedNotif,c.clipNotif);
        if(c.window.getViewTreeObserver().isAlive())c.window.getViewTreeObserver().removeOnGlobalLayoutListener(c.layoutListener);
        if(c.overlay!=null)c.window.removeView(c.overlay);
        c.config.unbind();c.config.setListener(null);sInstance=null;LiftArcRuntime.views(false);
    }
    static void onDozing(boolean value) { sDozing=value;if(sInstance!=null)sInstance.sync(); }
    static void onBouncer(boolean value) { sBouncerShowing=value;if(sInstance!=null)sInstance.sync(); }
    static void onWallpaperReady() {
        LiftArcController c=sInstance;if(c==null)return;
        c.restoreBlurAll();c.lastApplied=Float.NaN;
        if(c.overlay!=null&&c.overlay.getVisibility()==View.VISIBLE)c.apply(c.progress);
    }
    private boolean onNativeShortcut(float x,float y) {
        int[] at=new int[2];window.getLocationOnScreen(at);
        for(String name:new String[]{"keyguard_bottom_area","keyguard_bottom_area_overlay","lock_icon_view"}) {
            View v=find(name);if(v!=null&&nativeClickableAt(v,Math.round(x+at[0]),Math.round(y+at[1])))return true;
        }
        return false;
    }
    private static boolean nativeClickableAt(View view,int x,int y) {
        if(!view.isShown())return false;android.graphics.Rect bounds=new android.graphics.Rect();
        if(!view.getGlobalVisibleRect(bounds)||!bounds.contains(x,y))return false;
        if(view.isClickable()||view.isLongClickable()||view.hasOnClickListeners())return true;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(nativeClickableAt(((ViewGroup)view).getChildAt(i),x,y))return true;
        return false;
    }
    private static boolean conflictingOverlay(View view) {
        String name=view.getClass().getName();
        if(name.startsWith("com.lockbar.app.xposed.")&&(name.endsWith("LockHandleView")||name.endsWith("LockRimView")))return true;
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)if(conflictingOverlay(((ViewGroup)view).getChildAt(i)))return true;
        return false;
    }
    private static ViewGroup.LayoutParams matchParent() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
    }

    /**
     * 用系统自己的手势条类（{@code NavigationHandle}）当小白条本体：
     * 屏宽 32%、高 5dp、离底 7.5dp、颜色取系统 {@code homeHandleColor}，与手势导航那条完全一致。
     *
     * <p>装配流程被拆成互不相干的几步：<b>只要类和构造器拿得到，条就一定装上</b>，
     * 后面配色的每一步各自 try/catch —— 早前版本里任何一步抛异常都会让整段进 catch，
     * 结果永远走自绘 fallback（反馈「小横条依旧是自绘小横条」）。
     * 每步结果都写进诊断信息，App 里能直接看到。
     */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private void attachSystemHandle(Context ctx) {
        Class<?> cls;
        try {
            cls = Class.forName(
                    "com.android.systemui.navigationbar.gestural.NavigationHandle",
                    false, ctx.getClassLoader());
        } catch (Throwable t) {
            debugStatus("handle=fallback(class:" + brief(t) + ")");
            log("NavigationHandle class missing", t);
            return;
        }

        View nav;
        try {
            java.lang.reflect.Constructor<?> ctor = cls.getDeclaredConstructor(Context.class);
            ctor.setAccessible(true);
            nav = (View) ctor.newInstance(ctx);
        } catch (Throwable t) {
            debugStatus("handle=fallback(ctor:" + brief(t) + ")");
            log("NavigationHandle ctor failed", t);
            return;
        }

        // 从这里开始，任何一步失败都只影响配色，不再影响装配
        String note = "ok";
        try {
            // 0 = 浅色档，锁屏上就是那根白色小白条
            cls.getMethod("setDarkIntensity", float.class).invoke(nav, 0f);
        } catch (Throwable t) {
            note = "darkIntensity:" + brief(t);
            log("setDarkIntensity failed", t);
        }
        try {
            String colorNote = LiftArcHandleColor.ensureVisible(nav, handle.systemHandleColor());
            // Keep a genuine setDarkIntensity failure visible when the color
            // itself is already valid; the missing optional getter is normal.
            if ("ok".equals(note) || !colorNote.startsWith("ok")) note = colorNote;
        } catch (Throwable t) {
            note = "color:" + brief(t);
            log("handle color failed", t);
        }

        handle.attachSystemHandle(nav);
        debugStatus("handle=system(" + note + ")");
    }

    /**
     * 上滑到 35% 时把窗口直系子视图快照写进诊断信息。
     *
     * <p>反馈里“上滑过程中依旧有一小块灰色/黑色遮罩”一直没有新截图，
     * 只能靠这份清单看清楚：裁切边以下、我们描边之外，还盖着哪几层（背景色 / 透明度 / 高度）。
     */
    private void dumpViews() {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("p=").append(Math.round(progress * 100f))
                    .append("% radius=").append(Math.round(radius()))
                    .append(" clip=").append(clipInstalled)
                    .append(" keyguard#").append(indexOf(keyguardRoot))
                    .append(" notif#").append(indexOf(sharedNotif))
                    .append(" panel#").append(indexOf(notificationPanel))
                    .append('\n');
            int count = window.getChildCount();
            for (int i = 0; i < count && sb.length() < 4000; i++) {
                View c = window.getChildAt(i);
                if (c == overlay || !c.isShown()) {
                    continue;
                }
                sb.append('#').append(i).append(' ').append(idName(c))
                        .append('/').append(c.getClass().getSimpleName())
                        .append(" y=").append(Math.round(c.getTop() + c.getTranslationY()))
                        .append("..").append(Math.round(c.getBottom() + c.getTranslationY()))
                        .append(" a=").append(Math.round(c.getAlpha() * 100f) / 100f);
                android.graphics.drawable.Drawable bg = c.getBackground();
                if (bg == null) {
                    sb.append(" bg=none");
                } else if (bg instanceof android.graphics.drawable.ColorDrawable) {
                    sb.append(" bg=#").append(Integer.toHexString(
                            ((android.graphics.drawable.ColorDrawable) bg).getColor()));
                } else {
                    sb.append(" bg=").append(bg.getClass().getSimpleName());
                }
                float e = c.getElevation();
                if (e > 0f) {
                    sb.append(" e=").append(Math.round(e));
                }
                sb.append('\n');
            }
            config.putDebug(LiftArcConfig.KEY_DEBUG_VIEWS, sb.toString());
            // 景深分身的证据也走 LiftArcLog：debug_views 没有导出入口，debug_log 有
            scanDepthLayers();
        } catch (Throwable t) {
            log("dumpViews failed", t);
        }
    }

    /**
     * 递归扫出可能参与「景深」的 View —— 排查<b>景深分身</b>用（上滑时景深主体被复制一份跟着上移）。
     *
     * <p><b>只读不改。</b>分身的可能成因至少有三种：① 主体层在我们移动的容器里（上移一份）
     * 而下方露出的完整壁纸里本来就有另一份；② 主体层不在我们移动的容器里，与被移动的
     * 时钟/内容错开；③ 另有模块单独 hook 了壁纸景深（LSPosed 日志里能看到
     * “Installed third-party wallpaper depth capability hooks”）。三种成因的修法完全不同，
     * 在拿到真实层级前动手只会改错。
     *
     * <p>输出里每行标注它<b>是否落在我们管理的三个 View 子树内</b>（那意味着它同时被平移 + 裁切），
     * 这一行就是区分上面三种成因的判据。用户在 App 里导出日志即可带回。
     */
    private void scanDepthLayers() {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("景深扫描 p=").append(Math.round(progress * 100f))
                    .append("% parallax=").append(config.parallax)
                    .append(" managed=keyguard/notif/panel\n");
            int[] found = {0};
            walkDepth(window, 0, sb, found);
            if (found[0] == 0) {
                sb.append("  (窗口内无 depth/subject/wallpaper 类 View)\n");
            }
            // 窗口直属子 View 全量概览：分身到底是「谁在动、谁不动」一眼可辨
            sb.append("窗口直属子View：\n");
            for (int i = 0; i < window.getChildCount(); i++) {
                View c = window.getChildAt(i);
                if (c == null) {
                    continue;
                }
                sb.append('[').append(i).append("] ")
                        .append(idName(c)).append('/').append(c.getClass().getSimpleName())
                        .append(" y=").append(c.getTop()).append("..").append(c.getBottom())
                        .append(" vis=").append(c.getVisibility())
                        .append(" a=").append(Math.round(c.getAlpha() * 100f) / 100f)
                        .append(inManaged(c) ? " [被我们平移]" : " [不动]")
                        .append('\n');
            }
            // 关键容器子层清单：主体层若仍会动，这里能直接点名它挂在谁下面
            int[] budget = {100};
            appendLayerDump(sb, "keyguard_panel_view", 1, budget);
            appendLayerDump(sb, "keyguard_info_layer", 2, budget);
            appendLayerDump(sb, "miui_keyguard_clock_container", 2, budget);
            appendLayerDump(sb, "miui_keyguard_foreground_clock_container", 2, budget);
            LiftArcLog.d(sb.toString());
            LiftArcLog.flush();
        } catch (Throwable t) {
            log("scanDepthLayers failed", t);
        }
    }

    private void walkDepth(View v, int depth, StringBuilder sb, int[] found) {
        // 三层熔断：深度、命中数、字符数 —— 通知列表展开时这棵树可能非常大
        if (v == null || depth > 8 || found[0] > 40 || sb.length() > 9000) {
            return;
        }
        String name = idName(v);
        // 主体层是系统按壁纸元数据（crop_subject_0.png）代码动态建出来的 View，
        // 未必设了 id —— 只按 id 扫会整个漏掉，所以类名也一起匹配
        if (isDepthLike(name) || isDepthLike(v.getClass().getSimpleName())) {
            found[0]++;
            StringBuilder line = new StringBuilder();
            for (int i = 0; i < depth; i++) {
                line.append("  ");
            }
            line.append(name)
                    .append('/').append(v.getClass().getSimpleName())
                    .append(" y=").append(Math.round(v.getTop() + v.getTranslationY()))
                    .append("..").append(Math.round(v.getBottom() + v.getTranslationY()))
                    .append(" ty=").append(Math.round(v.getTranslationY()))
                    .append(" a=").append(Math.round(v.getAlpha() * 100f) / 100f)
                    .append(" path=").append(pathOf(v))
                    .append(inManaged(v) ? "  [被我们平移+裁切]" : "  [不在我们管理的子树内]")
                    .append('\n');
            sb.append(line);
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                walkDepth(g.getChildAt(i), depth + 1, sb, found);
            }
        }
    }

    /** 打印某容器的子层树（限深、限行数），用于日志点名主体层挂在谁下面。 */
    private void appendLayerDump(StringBuilder sb, String rootId, int maxDepth, int[] budget) {
        if (budget[0] <= 0) {
            return;
        }
        try {
            View root = find(rootId);
            if (root == null) {
                sb.append("子层[").append(rootId).append("] 未找到\n");
                return;
            }
            sb.append("子层[").append(rootId).append("]：\n");
            dumpLayerChildren(sb, root, 1, maxDepth, budget);
        } catch (Throwable t) {
            sb.append("子层[").append(rootId).append("] dump失败 ").append(t).append('\n');
        }
    }

    private void dumpLayerChildren(StringBuilder sb, View v, int depth, int maxDepth, int[] budget) {
        if (budget[0] <= 0 || depth > maxDepth || !(v instanceof ViewGroup)) {
            return;
        }
        ViewGroup g = (ViewGroup) v;
        int n = Math.min(g.getChildCount(), 15);
        for (int i = 0; i < n; i++) {
            if (budget[0] <= 0) {
                return;
            }
            View c = g.getChildAt(i);
            if (c == null) {
                continue;
            }
            budget[0]--;
            StringBuilder line = new StringBuilder();
            for (int d = 0; d < depth; d++) {
                line.append("  ");
            }
            line.append(idName(c)).append('/').append(c.getClass().getSimpleName())
                    .append(" y=").append(c.getTop()).append("..").append(c.getBottom())
                    .append(" ty=").append(Math.round(c.getTranslationY()));
            if (c.getVisibility() != View.VISIBLE) {
                line.append(" vis=").append(c.getVisibility());
            }
            line.append('\n');
            sb.append(line);
            dumpLayerChildren(sb, c, depth + 1, maxDepth, budget);
        }
        if (g.getChildCount() > n) {
            budget[0]--;
            for (int d = 0; d < depth; d++) {
                sb.append("  ");
            }
            sb.append("...(共").append(g.getChildCount()).append("个子View)\n");
        }
    }

    /** 该 View 到窗口的祖先链（id 名，{@code >} 分隔），用于日志定位它挂在哪个子树下。 */
    private String pathOf(View v) {
        java.util.ArrayList<String> chain = new java.util.ArrayList<>();
        View c = v;
        while (c != null && c != window && chain.size() < 12) {
            chain.add(idName(c));
            android.view.ViewParent p = c.getParent();
            c = p instanceof View ? (View) p : null;
        }
        java.util.Collections.reverse(chain);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < chain.size(); i++) {
            if (i > 0) {
                sb.append('>');
            }
            sb.append(chain.get(i));
        }
        return sb.toString();
    }

    private static boolean isDepthLike(String name) {
        if (name == null || name.isEmpty() || "-".equals(name)) {
            return false;
        }
        String s = name.toLowerCase(java.util.Locale.ROOT);
        return s.contains("depth") || s.contains("subject") || s.contains("crop")
                || s.contains("wallpaper") || s.contains("portrait")
                || s.contains("blur") || s.contains("mask")
                // 景深主体抠图层 id = deducted_image_view（KeyguardDepthInteractor 维护），
                // 「deducted」不含上面任何关键词，漏了它分身就修不掉
                || s.contains("deducted");
    }

    /** 该 View 是否落在我们平移 + 裁切的三个目标之一的子树内（含自身）。 */
    private boolean inManaged(View v) {
        return under(v, keyguardRoot) || under(v, sharedNotif) || under(v, notificationPanel);
    }

    private static boolean under(View v, View root) {
        View c = v;
        while (c != null) {
            if (c == root) {
                return true;
            }
            android.view.ViewParent p = c.getParent();
            c = p instanceof View ? (View) p : null;
        }
        return false;
    }

    private int indexOf(View v) {
        if (v == null) {
            return -1;
        }
        for (int i = 0; i < window.getChildCount(); i++) {
            if (window.getChildAt(i) == v) {
                return i;
            }
        }
        return -1;
    }

    private String idName(View v) {
        try {
            int id = v.getId();
            if (id == View.NO_ID) {
                return "-";
            }
            return window.getResources().getResourceEntryName(id);
        } catch (Throwable t) {
            return "-";
        }
    }

    private static String brief(Throwable t) {
        if (t == null) {
            return "null";
        }
        Throwable c = t.getCause() != null ? t.getCause() : t;
        String m = c.getMessage();
        if (m != null && m.length() > 60) {
            m = m.substring(0, 60);
        }
        return c.getClass().getSimpleName() + (m == null ? "" : ":" + m);
    }

    // ------------------------------------------------------------------ 状态同步

    private void sync() {
        if (overlay == null) {
            return;
        }
        if (strip != null) {
            // 后开模糊的用户：锁屏一出现就补预热（方法内有节流），起滑那次才有位图可盖
            strip.ensureWallpaperForBlur();
        }
        if (!config.isReady() && configLoadTry < MAX_CONFIG_TRY) {
            // LSPosed 远端配置偶尔要等一会儿才拿得到，失败就限次重试
            configLoadTry++;
            config.load();
        }
        if (keyguardRoot == null || resolveTry < MAX_RESOLVE_TRY
                || !keyguardRoot.isAttachedToWindow()) {
            resolve();
        }
        boolean clockStale = (clockRoot != null && !clockRoot.isAttachedToWindow())
                || (clockSecond != null && !clockSecond.isAttachedToWindow());
        if (clockStale) {
            // 换锁屏样式 / 面板重建：旧引用是脱离窗口的，计数从头来
            clockTry = 0;
            clockSecondTry = 0;
        }
        if (clockStale || (clockRoot == null && clockTry < MAX_CLOCK_TRY)) {
            // 副层（分层模板的分钟）可能比主层晚挂上，主层到手后继续找副层
            clockTry++;
            clockSecondTry++;
            resolveClock();
        }

        boolean bouncerShowing = sBouncerShowing;
        boolean ready = keyguardRoot != null && keyguardRoot.isAttachedToWindow();
        long now=android.os.SystemClock.elapsedRealtime();
        if(now-lastConflictCheck>=1000) { lastConflictCheck=now;LiftArcRuntime.conflict(conflictingOverlay(window)); }
        boolean stateOk = sKeyguardState != 0;      // 0 = 明确不在锁屏；-1 = 未知，退回视图判断
        boolean interactive = isInteractive();
        LiftArcRuntime.views(ready);
        boolean onKeyguard = ready && stateOk && !bouncerShowing && !sDozing && !sControlCenterOpen && interactive
                && keyguardRoot.isShown() && config.enabled;

        int visibility = onKeyguard ? View.VISIBLE : View.GONE;
        if (overlay.getVisibility() != visibility) {
            overlay.setVisibility(visibility);
        }

        if (!onKeyguard) {
            reset();
            return;
        }

        int h = window.getHeight();
        // 行程不再固定：拉满位移恒为 h*MAX_SHIFT_RATIO，行程 = 位移 / 跟手倍率。
        // dragRatio=1 → 倍率 1 → 行程 = 位移，手指动多少内容动多少（1:1 贴手）；
        // dragRatio 越小行程越短，同样行程内容走得更多 = 更快、但越不贴手。
        float range = Math.max(h * MAX_SHIFT_RATIO / followMul(config.dragRatio), 1f);
        if (range != rangePx) {
            rangePx = range;
            handle.setRange(rangePx);
        }
    }

    /** 息屏 / AOD（dozing）时 {@code isInteractive()} 为 false，此时不该显示小白条。 */
    private boolean isInteractive() {
        try {
            if (powerManager == null) {
                powerManager = (PowerManager)
                        window.getContext().getSystemService(Context.POWER_SERVICE);
            }
            return powerManager == null || powerManager.isInteractive();
        } catch (Throwable t) {
            return true;
        }
    }

    /** 惰性解析锁屏相关 View（蓝图 sections 可能在窗口 attach 之后才加进来）。 */
    private void resolve() {
        resolveTry++;
        // Legacy RedMagic places its KeyguardStatusView inside NotificationPanelView.
        // Moving that panel as well would shift clocks twice and move QS/status bar.
        View root = find("keyguard_root_view");
        if (root == null) root = find("keyguard_status_view");
        View notif = find("shared_notification_container");
        if (notif == null) notif = find("notification_stack_scroller");
        if (under(notif,root) || under(root,notif)) notif = null;
        View panel = null;
        View box = find("keyguard_bouncer_container");

        if (root != keyguardRoot || notif != sharedNotif || panel != notificationPanel) {
            restoreBlurAll();   // 旧根上的模糊是我们挂的，换人前先把系统原件还回去
        }
        if (root != keyguardRoot) {
            restoreAnchors();   // 候选层挂在旧根下，换根前先把补偿还原
            detachTarget(keyguardRoot, clipRoot);
            clipRoot = new LiftArcGeometry.Clip();
            keyguardRoot = root;
            lastApplied = Float.NaN;
            clipInstalled = false;
        }
        if (notif != sharedNotif) {
            restoreAnchors();
            detachTarget(sharedNotif, clipNotif);
            clipNotif = new LiftArcGeometry.Clip();
            sharedNotif = notif;
            lastApplied = Float.NaN;
        }
        if (panel != notificationPanel) {
            restoreAnchors();
            detachTarget(notificationPanel, clipPanel);
            clipPanel = new LiftArcGeometry.Clip();
            notificationPanel = panel;
            lastApplied = Float.NaN;
        }
        bouncer = box;
    }

    private void detachTarget(View v, LiftArcGeometry.Clip clip) {
        if (v == null) {
            return;
        }
        try {
            clip.clear(v);
            applyContentTranslation(v,0f);
        } catch (Throwable ignored) {
            // 视图可能已被回收
        }
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private View find(String name) {
        try {
            int id = window.getResources().getIdentifier(name, "id", PKG);
            return id != 0 ? window.findViewById(id) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    // ------------------------------------------------------------------ 时间上移（仿 iOS）

    /**
     * 找锁屏时间。
     *
     * <p>要找<b>两个</b>容器：
     * <ul>
     *   <li>{@code miui_keyguard_clock_container} —— {@code KeyguardClockContainer}（整屏 FrameLayout），
     *       时针那半张表在里面；</li>
     *   <li>{@code miui_keyguard_foreground_clock_container} —— 副层，
     *       <b>分层模板的分钟（以及部分模板的日期）被拆到这一层</b>，跟主层是<b>兄弟</b>关系。</li>
     * </ul>
     * 两个是兄弟，各自改各自的 translationY 不会叠加，所以可以放心一起抬。
     *
     * <p>副层可能比主层晚出现，所以单独处理：换了副层不动进行中的位移。
     */
    private void resolveClock() {
        View root = find("keyguard_clock_container");
        if(root == null) root = find("lockscreen_clock_style_container");
        View second = null;
        if (second == root) {
            second = null;      // 防御：万一 ROM 把两个 id 指到同一个 View
        }
        if (root != clockRoot) {
            // 主容器换了（换锁屏样式 / 窗口重建）：整段复位
            if (clockRoot != null) {
                clearLift();
            }
            clockRoot = root;
            clockTime = root;
        }
        if (second != clockSecond) {
            // 只换副层引用：把旧的放回去，新的按当前 lift 立刻对齐
            if (clockSecond != null && !Float.isNaN(clockSecondBaseY)) {
                applyContentTranslation(clockSecond, 0);
            }
            clockSecond = second;
            clockSecondBaseY = Float.NaN;
            if (lift != 0f) {
                writeLift();
            }
        }
    }

    /**
     * 时间最多能上移的距离（px）：时间本体高度的一半。
     *
     * <p>时/分容器本身都是 match_parent铺满整屏，直接量会得到“整屏”，所以用 {@link #clockBox()}
     * 往下钻到真正有内容的那层，把<b>主层的时</b>和<b>副层的分</b>一起算进来——
     * 它俩左右并排时取到的就是“一张表”的高度，上下叠放时就是两张表的总高。
     */
    private float liftMax() {
        int h = window.getHeight();
        if (h <= 0) {
            return 0f;
        }
        float[] box = new float[]{Float.MAX_VALUE, -Float.MAX_VALUE};
        int[] loc = new int[2];
        clockBox(clockTime, h, loc, box);
        clockBox(clockRoot, h, loc, box);
        clockBox(clockSecond, h, loc, box);
        float span = box[0] <= box[1] ? box[1] - box[0] : h * LIFT_SPAN_MIN_RATIO;
        span = Math.max(h * LIFT_SPAN_MIN_RATIO, Math.min(h * LIFT_SPAN_MAX_RATIO, span));
        return Math.max(0f, span * LIFT_MAX_RATIO);
    }

    /**
     * 把 {@code v}（或它下面真正有内容的子孙）的纵向范围并进 {@code box[0]~box[1]}。
     *
     * <p>高度为 0（布局里写 0dp、靠代码撑开的那类）或等于屏高（match_parent 的壳）继续往下钻，
     * 其余的当内容收进来；返回是否真的收进了东西。
     */
    private static boolean clockBox(View v, int windowH, int[] loc, float[] box) {
        if (v == null || v.getVisibility() != View.VISIBLE || v.getAlpha() <= 0f) {
            return false;
        }
        int vh = v.getHeight();
        if (vh > 0 && vh < windowH) {
            v.getLocationInWindow(loc);
            float top = loc[1];
            float bottom = top + vh;
            if (box[0] > box[1]) {
                box[0] = top;
                box[1] = bottom;
            } else {
                box[0] = Math.min(box[0], top);
                box[1] = Math.max(box[1], bottom);
            }
            return true;
        }
        if (!(v instanceof ViewGroup)) {
            return false;
        }
        boolean any = false;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            if (clockBox(g.getChildAt(i), windowH, loc, box)) {
                any = true;
            }
        }
        return any;
    }

    /** 跟手更新时间上移量；到“时间高度一半”就停住，继续滑也不动（禁止滑动）。 */
    private void updateLift(float y) {
        if (!config.parallax || (clockRoot == null && clockSecond == null) || liftAnimator != null) {
            return;
        }
        float max = liftMax();
        if (max <= 0f) {
            return;
        }
        float v = Math.min(max, Math.max(0f, downY - y));
        if (v == lift) {
            return;
        }
        lift = v;
        writeLift();
    }

    /**
     * 把当前 {@link #lift} 写进时间容器（保留系统自己的原始 translationY）。
     *
     * <p>主层（时）和副层（分）是<b>兄弟</b>，各自记各自的原始值，抬的量完全一样，
     * 所以时分永远同步移动。
     */
    private void writeLift() {
        if (clockRoot != null) {
            if (Float.isNaN(clockBaseY)) {
                clockBaseY = clockRoot.getTranslationY();
            }
            applyContentTranslation(clockRoot, -lift);
        }
        if (clockSecond != null) {
            if (Float.isNaN(clockSecondBaseY)) {
                clockSecondBaseY = clockSecond.getTranslationY();
            }
            applyContentTranslation(clockSecond, -lift);
        }
    }

    /**
     * 松手后弹性归位（仿 iOS）：先越过原位一点再弹回来。
     *
     * <p>用 {@link android.view.animation.OvershootInterpolator} 而不是直接归零，
     * 就是为了要那个“回弹”的手感。
     */
    private void springLiftBack() {
        if ((clockRoot == null && clockSecond == null) || lift == 0f) {
            clearLift();
            return;
        }
        // 先把 from 抓出来再 cancel：cancel 会走 onAnimationEnd → clearLift，把 lift 清成 0
        final float from = lift;
        cancelLiftAnimator();
        ValueAnimator a = ValueAnimator.ofFloat(from, 0f);
        a.setDuration(LIFT_RETURN_MS);
        a.setInterpolator(new android.view.animation.OvershootInterpolator(LIFT_OVERSHOOT));
        a.addUpdateListener(animation -> {
            lift = (Float) animation.getAnimatedValue();
            writeLift();
        });
        a.addListener(new android.animation.AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(android.animation.Animator animation) {
                if (liftAnimator == a) {
                    liftAnimator = null;
                }
                clearLift();
            }
        });
        liftAnimator = a;
        a.start();
    }

    private void cancelLiftAnimator() {
        ValueAnimator a = liftAnimator;
        if (a != null) {
            liftAnimator = null;
            a.cancel();
        }
    }

    /** 立刻把时间放回原位（解锁 / 离开锁屏 / 取消手势）。主副两层都要放回去。 */
    private void clearLift() {
        cancelLiftAnimator();
        lift = 0f;
        liftTracking = false;
        if (clockRoot != null && !Float.isNaN(clockBaseY)) {
            applyContentTranslation(clockRoot, 0);
        }
        if (clockSecond != null && !Float.isNaN(clockSecondBaseY)) {
            applyContentTranslation(clockSecond, 0);
        }
        clockBaseY = Float.NaN;
        clockSecondBaseY = Float.NaN;
    }

    /** 诊断：拦了几次系统上滑（单独一条 key，免得把 unlock= 覆盖掉）。 */
    private void noteBlock(String text) {
        try {
            config.putDebug(LiftArcConfig.KEY_DEBUG_BLOCK, text);
        } catch (Throwable ignored) {
            // 写诊断失败不影响功能
        }
        // 同步进可导出的 LiftArcLog：拦截那一刻的命中链。反馈“通知被拦”全靠这条定位链条断在哪
        try {
            LiftArcLog.d(text + " 链=" + chainText(downX, downY));
            LiftArcLog.flush();
        } catch (Throwable ignored) {
            // 诊断失败不影响功能
        }
    }

    /** 落点往上的命中链（简单类名，最多 10 层；滚动容器标出“还能不能翻”）+ 通知行判定，诊断用。 */
    private String chainText(float x, float y) {
        StringBuilder sb = new StringBuilder();
        int n = 0;
        for (View p = topmostAt(window, x, y, overlay);
                p != null && p != window && n < 10; p = parentOf(p), n++) {
            if (n > 0) {
                sb.append('>');
            }
            String nm = p.getClass().getSimpleName();
            sb.append(nm);
            if (nm.contains("Scroll") || nm.contains("Recycler")
                    || nm.contains("ListView") || nm.contains("ViewPager")) {
                sb.append('{').append(canScrollDown(p)).append('}');
            }
        }
        sb.append(" 行=").append(onNotificationRow(x, y));
        return sb.toString();
    }

    /** 上次记进日志的诊断状态，用来避免同值反复挂载时刷屏。 */
    private String lastLoggedStatus;

    private void debugStatus(String text) {
        try {
            config.putDebug(LiftArcConfig.KEY_DEBUG_STATUS, text);
        } catch (Throwable ignored) {
            // 写诊断失败不影响功能
        }
        if (text.equals(lastLoggedStatus)) {
            return;
        }
        lastLoggedStatus = text;
        // 这一条就是“覆盖层真的挂到窗口上了”的直接证据，排查“不生效”时最关键
        LiftArcLog.d("覆盖层状态 " + text);
        LiftArcLog.flush();
    }

    // ------------------------------------------------------------------ 每帧应用

    /** 模糊满强度对应的半径（dp）：20dp 在 3x 屏上约 60px，糊到看不清细节但渐变还在。 */
    private static final float BLUR_MAX_DP = 20f;

    /**
     * 上滑模糊**只糊弧线以下露出的那半边背景**（arcui7 拍板「只糊下面」）：
     * 可见壁纸长在**系统壁纸窗口**里、在我们窗口树外，RenderEffect 够不着
     * （无景深时树内也没有任何背景层）—— 盖一张同套 center-crop 的壁纸位图到
     * window 最底层，对盖层挂效果，等于把盖层画到的那半边糊掉；哪半边由
     * {@link LiftArcWallCoverView#setShell} 逐帧喂的同源弧线裁出，与压暗分界线重合，
     * 弧线以上不画、透出真实壁纸保持清晰。景深主体/前景抠图浮在上层，按拍板
     * 保持清晰，时钟/通知同样清晰；给树内景深层挂效果的老路已整体拆除。
     * 半径 = 模糊程度 × 进度 × 20dp 连续渐强，不做分级阶梯；取整后没变就不重建 effect，
     * 稳态滑动不产生分配。
     */
    private void applySwipeBlur(float g) {
        if (!config.blurEnabled || config.blurStrength <= 0f) {
            if (lastBlurRadius != -1) {
                restoreBlurAll();
            }
            return;
        }
        float density = window.getResources().getDisplayMetrics().density;
        int r = Math.round(config.blurStrength * Math.min(g, 1f) * BLUR_MAX_DP * density);
        if (g <= 0.001f) {
            r = 0;
        }
        if (r == lastBlurRadius) {
            return;
        }
        if (r <= 0) {
            restoreBlurAll();
            return;
        }
        try {
            RenderEffect effect = RenderEffect.createBlurEffect(r, r, Shader.TileMode.CLAMP);
            ensureCover();
            if (cover != null) {
                cover.setRenderEffect(effect);
            }
            lastBlurRadius = r;
        } catch (Throwable t) {
            log("applySwipeBlur failed", t);
        }
    }

    /**
     * 挂上/续上壁纸盖层：位图取自玻璃条那份解码（同一份源、同一套 center-crop，
     * 低半径阶段与真实壁纸逐像素对齐）；加载是异步的，本帧拿不到就先不挂，半径
     * 下一次变化时自动补上。盖层只在弧线的糊侧画位图，分界由 apply() 里 setShell
     * 逐帧喂；拿不到静态壁纸（超级/视频壁纸）就不挂 —— 宁可这一轮不糊，
     * 也绝不拿固定截图冒充实时背景。
     */
    private void ensureCover() {
        if (window == null || strip == null) {
            return;
        }
        strip.ensureWallpaperForBlur();   // 自带 4s 轮询 + 20s 重试窗，加载中/已就绪都是空转
        if (cover == null) {
            android.graphics.Bitmap b = strip.wallpaperBitmap();
            if (b == null) {
                return;
            }
            cover = new LiftArcWallCoverView(window.getContext());
            cover.setBitmap(b);
            // RedMagic can host its static background as a window child. Place
            // the cover above background siblings and below the content owner.
            View content=keyguardRoot;
            while(content!=null&&content.getParent() instanceof View&&content.getParent()!=window)
                content=(View)content.getParent();
            int index=content!=null&&content.getParent()==window?window.indexOfChild(content):0;
            window.addView(cover,Math.max(0,index),matchParent());
            return;
        }
        // 换过壁纸就跟上（同对象时 setBitmap 直接返回，稳态零开销）
        android.graphics.Bitmap cur = strip.wallpaperBitmap();
        if (cur != null) {
            cover.setBitmap(cur);
        }
    }

    /**
     * 收起模糊：把盖层撤出窗口、半径缓存归 -1（下次起滑重挂）。上层（时钟/通知/景深主体）
     * 从头到尾都没被碰过、一律清晰，无需处理；系统自己的模糊（下拉玻璃、通知栏过渡）
     * 是逐帧重挂的，同样不受影响。
     */
    private void restoreBlurAll() {
        if (cover != null) {
            try {
                cover.setRenderEffect(null);
                window.removeView(cover);
            } catch (Throwable ignored) {
                // 已经不在树上（容器换代时被 resolve 收过）
            }
            cover = null;
        }
        lastBlurRadius = -1;
    }

    private void apply(float g) {
        try { applyFrame(g); }
        catch(Throwable error) {
            LiftArcRuntime.error("锁屏效果绘制",error);
            try { restoreBlurAll();clearClips();applyContentTranslation(keyguardRoot,0);applyContentTranslation(sharedNotif,0); }
            catch(Throwable ignored) { }
            if(overlay!=null)overlay.setVisibility(View.GONE);
        }
    }
    private void applyFrame(float g) {
        if (g == lastApplied) {
            return;
        }
        lastApplied = g;

        int w = window.getWidth();
        int h = window.getHeight();
        float shift = 0f;
        if (w > 0 && h > 0) {
            // 拉满进度时的位移固定为 MAX_SHIFT_RATIO×屏高，与 dragRatio 无关：
            // 旧写法 shift = h*g*dragRatio 让 dragRatio 同时决定了「滑出多少」和「跟手快慢」，
            // 于是 dragRatio 调小时（如 0.3）拉满也只上移 30% 屏高，内容卡在屏幕里出不去。
            // 行程（rangePx）已按 followMul 缩放，这里对进度保持线性，
            // d(位移)/d(手指) 恒等于 followMul：dragRatio=1 时恰好 1:1 贴手。
            shift = h * MAX_SHIFT_RATIO * g;
        }
        // edge = 窗口坐标下的“可见底边”，-shift 时内容整体上移
        float edge = h - shift;
        float ty = config.parallax ? -shift : 0f;
        applyContentTranslation(keyguardRoot, ty);
        applyContentTranslation(sharedNotif, ty);
        // 景深/壁纸层反向补偿：这些层画的是壁纸本身（含景深主体），必须留在屏幕原位 ——
        // 否则前面的主体跟着上滑、后面的系统壁纸不动，就会出现「主体分身」。
        // 内容根已平移 ty，这里给候选层写 base-ty 抵消（ty=0 时还原并清缓存）。
        anchorWallpaperLayers(ty);
        // 小白条贴着可见底边一起上升（触控区跟着走，手指不用重新找位置）
        setTranslation(handle, -shift);
        setTranslation(hint, -shift);
        // 背景模糊与位移同一节拍：半径没变时这行是空操作（稳态滑动零分配）
        applySwipeBlur(g);

        if (g <= 0.001f || w <= 0 || h <= 0) {
            clearClips();
            return;
        }

        float radius = radius();
        // 局部坐标：窗口坐标减去 translationY。
        // 联动开 = 内容跟着动，裁切就是自身 bounds；联动关 = 内容不动，裁切边上移。
        float localBottom = edge - ty;
        float localTop = (edge - h) - ty;
        LiftArcGeometry.Shape clipShape =
                new LiftArcGeometry.Shape(localBottom, radius, radius, 1f, localTop);
        // 窗口坐标系的弧线壳：rim 压暗、盖层模糊分界、玻璃条三处共用同一份，
        // 每帧只建一个；字段是不可变快照语义（要变就 copy()），谁都不原地改它。
        LiftArcGeometry.Shape arcShape =
                new LiftArcGeometry.Shape(edge, radius, radius, LiftArcGeometry.smoothstep(g), edge - h);
        // 「启用弧形描边」只管这一段：裁切 + 描边/压暗。玻璃条是「玻璃参数」页那套独立
        // 效果，由 glassLive 自己开关，关掉描边照样跟手 —— 原先这句 return 连着玻璃一起
        // 端走（clearClips() 里 rim.clear() 还捎带 strip.clear()），描边一关玻璃也没了。
        if (config.arcEnabled) {
            applyTargetClip(keyguardRoot, clipRoot, arcShape);
            applyTargetClip(sharedNotif, clipNotif, arcShape);
            clipInstalled = true;

            // 描边壳：顶边与内容顶对齐，底边落在可见底边上
            // rimAlpha=smoothstep 只给传统描边淡入用；1.0.20 起压暗分支不再读它（固定强度）
            rim.update(arcShape);
        } else {
            // 收掉裁切与描边壳，**但不动玻璃条**：这里只能调 clearArcClips()，
            // clearClips() 会连 strip 一起收。两者的 clear() 都幂等，每帧走一次没开销。
            clearArcClips();
        }
        // 盖层的模糊分界与压暗/裁切同一条弧（arcui7 拍板「只糊下面」）：喂壳过去，
        // 盖层只在糊的那半画位图 —— 弧线以上透出真实壁纸、一个像素不盖。
        // 描边关了也要喂：模糊归 blur_enabled 自己管，跟描边开关互相独立（同玻璃条）。
        if (cover != null) {
            cover.setShell(arcShape, config.dimUpper);
        }
        // 玻璃条用的是同一条弧线（同一份 Shape），逐帧跟手，不另起任何动画。
        // rimAlpha（= smoothstep(g)）照旧传下去，但 1.0.22 起它**不再控制玻璃强度**：
        // 强度在 rebuild() 里恒等于「玻璃参数」页的不透明度，手势第一帧就是满的。
        // rimAlpha 只剩两个用途 —— 驱动 shader 的 phase（液态扰动 / 跑动高光）、
        // 以及 rim 自己的描边淡入。所以这里「描边还没显影、玻璃已经满强度」是**故意的**，
        // 就是用户要的那句：不要跟随上滑程度再慢慢添加玻璃效果。
        if (strip != null) {
            strip.update(arcShape);
        }
    }

    /**
     * 跟手倍率：{@code 内容位移速度 / 手指速度}，由「跟手程度」dragRatio 决定。
     *
     * <p>行程（{@link #rangePx}）= {@code MAX_SHIFT_RATIO×屏高 / followMul}，
     * 而 {@link #apply} 里位移对进度线性 —— 两者相除，速度比恒等于本函数：
     *
     * <ul>
     *   <li>dragRatio = 1 → 倍率 1：内容与手指 1:1 完全贴手，手指停内容停；
     *   <li>dragRatio &lt; 1 → 倍率 &gt; 1：行程变短，内容按该倍率跑在手指前面。
     * </ul>
     *
     * <p>倍率恒大于等于 1：手指从底部条出发最多划一屏，行程一旦超过屏高就永远拉不满，
     * 所以「更跟手」只能朝 1:1 收敛，低档位只能是「短行程 + 更快」，这是物理上限。
     * 拉满行程时位移恒为 {@link #MAX_SHIFT_RATIO}×屏高 —— 内容一定滑出屏幕，
     * 不管 dragRatio 取多小都不会卡在半屏（旧实现 dragRatio=0.3 只能上移 30% 屏高）。
     */
    private static float followMul(float dragRatio) {
        float r = Math.max(0.2f, Math.min(1f, dragRatio));
        return 1f + 2f * (1f - r);
    }

    /** 只收「弧形描边」这一套（裁切 + 描边壳）。玻璃条归 glassLive 管，这里不碰它。 */
    private void clearArcClips() {
        if (clipInstalled) {
            clipRoot.clear(keyguardRoot);
            clipNotif.clear(sharedNotif);
            clipPanel.clear(notificationPanel);
            clipInstalled = false;
        }
        if (rim != null) {
            rim.clear();
        }
    }

    /** 整套全收（手势归零 / 尺寸无效）：裁切 + 描边壳 + 玻璃条的外壳一起。 */
    private void clearClips() {
        clearArcClips();
        if (rim != null && strip != null) {
            strip.clear();
        }
    }

    private static final class Translation {
        float base,last; Translation(float value){base=value;last=value;}
    }
    private void applyContentTranslation(View v,float delta) {
        if(v==null)return; Translation state=translations.get(v);
        if(delta==0) {
            if(state!=null) { if(Math.abs(v.getTranslationY()-state.last)<.01f)v.setTranslationY(state.base);translations.remove(v); }
            return;
        }
        if(state==null){state=new Translation(v.getTranslationY());translations.put(v,state);}
        else if(Math.abs(v.getTranslationY()-state.last)>.01f)state.base=v.getTranslationY();
        state.last=state.base+delta;setTranslation(v,state.last);
    }
    private void applyTargetClip(View view,LiftArcGeometry.Clip clip,LiftArcGeometry.Shape screen) {
        if(view==null)return;int[] origin=new int[2],target=new int[2];
        window.getLocationOnScreen(origin);view.getLocationOnScreen(target);
        float top=target[1]-origin[1];
        clip.update(view,new LiftArcGeometry.Shape(screen.visibleHeight-top,screen.topRadius,screen.bottomRadius,screen.rimAlpha,screen.top-top));
    }
    private static void setTranslation(View v, float y) {
        // HyperOSKeyguardRootView.setTranslationY 每次都会触发 onStateChanged，
        // 因此必须跳过数值未变化的写入，否则会和布局互相触发。
        if (v != null && v.getTranslationY() != y) {
            v.setTranslationY(y);
        }
    }

    // ---------------------------------------------------------- 壁纸层锚定（景深防分身）

    /**
     * 把「画壁纸本身」的层（壁纸预览 / 景深主体合成层）钉在屏幕原位。
     *
     * <p>父容器（keyguard_root_view 等）已被平移 {@code ty}，子层会跟着走 —— 但屏幕后面还有
     * 一份不动的系统壁纸，主体跟着上滑就会和后层的那份错开，形成「分身」。
     * 这里给每个候选写 {@code base - ty} 抵消父位移：壁纸层全程留在原位，
     * 与后层完全重合，上滑时只被弧形裁切逐步切走，视觉上就是一张完整壁纸。
     *
     * <p>候选 = 管理子树内 id/类名命中 depth|subject|crop|wallpaper|portrait|blur|mask 的 View
     * （与 {@link #scanDepthLayers} 同一套判定），只收集最上层命中者，整棵子树一起锚定，
     * 避免父子叠加补偿。
     *
     * <p>{@code ty == 0}（复位 / 联动关）时还原原始 translationY 并清缓存，下一轮手势重新收集 ——
     * 系统在空闲期改过 translationY 也不会被我们固化。
     */
    private void anchorWallpaperLayers(float ty) {
        try {
            if (ty == 0f) {
                restoreAnchors();
                return;
            }
            if (!anchorCollected) {
                collectAnchor(keyguardRoot);
                collectAnchor(sharedNotif);
                collectAnchor(notificationPanel);
                anchorCollected = true;   // 空结果也置位：非景深壁纸不该每帧重扫整棵树
            }
            for (java.util.Map.Entry<View, Float> e : anchorBaseY.entrySet()) {
                Float last=anchorLastY.get(e.getKey());
                if(last!=null&&Math.abs(e.getKey().getTranslationY()-last)>.01f)e.setValue(e.getKey().getTranslationY());
                float value=e.getValue()-ty;setTranslation(e.getKey(),value);anchorLastY.put(e.getKey(),value);
            }
        } catch (Throwable t) {
            log("anchorWallpaperLayers failed", t);
        }
    }

    /** 还原所有锚定候选的原始 translationY 并清缓存（视图换根 / 复位时也要走这里）。 */
    private void restoreAnchors() {
        if (!anchorCollected) {
            return;
        }
        for (java.util.Map.Entry<View, Float> e : anchorBaseY.entrySet()) {
            Float last=anchorLastY.get(e.getKey());
            if(last!=null&&Math.abs(e.getKey().getTranslationY()-last)<.01f)setTranslation(e.getKey(),e.getValue());
        }
        anchorBaseY.clear();
        anchorLastY.clear();
        anchorCollected = false;
    }

    private void collectAnchor(View root) {
        if (root == null) {
            return;
        }
        if (isAnchorLayer(root)) {
            anchorBaseY.put(root, root.getTranslationY());
            return;   // 最上层命中者：整棵子树一起留在原位，不再下钻
        }
        if (root instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) root;
            for (int i = 0; i < g.getChildCount(); i++) {
                collectAnchor(g.getChildAt(i));
            }
        }
    }

    private boolean isAnchorLayer(View v) {
        String id = idName(v);
        // blur_blend_container 长在 miui_keyguard_clock_container / foreground 两个时钟容器里，
        // 是表盘/数字的合成层 —— 1.0.20 实测把它钉住 = 锁屏时钟不再跟随上移。
        // 它属于要跟内容一起上移的「界面」，不属于壁纸层，明确排除（诊断仍会打印它，ty=0 即未锚定）
        if ("blur_blend_container".equals(id)) {
            return false;
        }
        return "depth_back_wallpaper".equals(id) || "depth_foreground_wallpaper".equals(id) || "iv_wallpaper".equals(id);
    }

    private void reset() {
        cancelAnimator();
        clearUnlockGuard();
        clearLift();
        progress = 0f;
        startProgress = 0f;
        lastTickBucket = -1;
        // 强制重新 apply：即便上一次已经是 0，也要保证位移/裁切被真正清掉
        lastApplied = Float.NaN;
        apply(0f);
        fadeHandle(0f);
        if (handle != null) {
            handle.resetGesture();
        }
    }

    // ------------------------------------------------------------------ 圆角

    private float radius() {
        if (radiusCache > 0f) {
            return radiusCache;
        }
        float r = LiftArcGeometry.screenCornerRadius(window);
        if (r <= 0f) {
            r = dimen("rounded_corner_radius");
        }
        if (r <= 0f) {
            r = dimen("rounded_corner_radius_top");
        }
        if (r > 0f) {
            radiusCache = r;
        }
        return Math.max(r, 0f);
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private float dimen(String name) {
        try {
            Resources res = window.getResources();
            int id = res.getIdentifier(name, "dimen", "android");
            return id != 0 ? res.getDimensionPixelSize(id) : 0f;
        } catch (Throwable t) {
            return 0f;
        }
    }

    // ------------------------------------------------------------------ 手势

    @Override
    public void onDragStart(float y) {
        cancelAnimator();
        clearUnlockGuard();
        startProgress = progress;
        lastTickBucket = bucket(progress);
        viewsDumped = false;
        haptic(HapticFeedbackConstants.VIRTUAL_KEY);
    }

    @Override
    public void onDragMove(float dy, float ignored) {
        if (!config.enabled || rangePx <= 1f) {
            return;
        }
        if (overlay == null || overlay.getVisibility() != View.VISIBLE) {
            // 拖动过程中离开了锁屏（弹出密码盘 / 解锁），立刻停止
            return;
        }
        float p = LiftArcGeometry.clamp01(startProgress + dy / rangePx);
        if (p == progress) {
            return;
        }
        progress = p;
        apply(p);
        fadeHandle(p);

        if (!viewsDumped && p >= 0.35f) {
            viewsDumped = true;
            LiftArcLog.d("锁屏手势进度达到35%");
        }

        int bucket = bucket(p);
        if (bucket != lastTickBucket && bucket > 0) {
            lastTickBucket = bucket;
            haptic(HapticFeedbackConstants.SEGMENT_TICK);
        }
    }

    @Override
    public void onDragEnd(float dy, float ignored, float velocityUpPx, boolean cancel) {
        if (!config.enabled || overlay == null
                || overlay.getVisibility() != View.VISIBLE) {
            reset();
            return;
        }
        // 拉过半松手进解锁；第二条路是「速度解锁」—— 100% 跟手时行程 = 0.96×屏高
        // （约 2400px），光靠进度得划掉近半屏，慢拖累、甩一下反而拖不快；甩一下就够了。
        // 顺序是**先让条飞到顶、再拉解锁界面**：以前是 show() 和 animateTo(0f) 同时发，
        // 密码盘往上冒、条往下掉，两股反方向撞在一起就是那股简陋劲。
        if (!cancel && (progress >= UNLOCK_THRESHOLD || flickByVelocity(velocityUpPx))) {
            animateUpThenUnlock();
            return;
        }
        // cancel 也包含了“点击小白条没有拖动”的情况：点击视为归位
        if (cancel || config.releaseReturn) {
            animateTo(0f);
            return;
        }
        fadeHandle(progress);
    }

    /**
     * 速度解锁：松手瞬间手指向上速度 ≥ 「触发速度」就判定解锁，与进度无关。
     *
     * <p>阈值来自设置页（dp/s），这里乘 density 换成 px/s 再比 ——
     * {@link LiftArcHandleView} 给的本来就是原始屏幕像素上的速度。
     *
     * <p>方向天然受限：只收<b>向上</b>的速度，向下甩得到的是负数，永远够不到正阈值；
     * 开关关掉这条就彻底退化成纯进度判定，行为与 1.0.21 逐帧一致。
     *
     * <p>不会截胡慢拖：滑条下限 300 dp/s 已经明显快于手动，慢拖松手时的瞬时速度
     * 远在它之下，照旧得划到 {@link #UNLOCK_THRESHOLD} 才解锁。
     */
    private boolean flickByVelocity(float velocityUpPx) {
        if (!config.flickUnlock || config.flickVelocity <= 0f || window == null) {
            return false;
        }
        float density = window.getResources().getDisplayMetrics().density;
        return velocityUpPx >= config.flickVelocity * density;
    }

    private static int bucket(float p) {
        return (int) Math.min(3f, p * 4f);
    }

    private void fadeHandle(float p) {
        if (handle != null) {
            // showHandle=false 时把条本体隐藏，但仍保留上滑手势（透明可拖）
            // 上升过程中只轻微淡出：条要跟着弧线一起升，得看得见
            // handleAlpha 是设置页里的「小白条透明度」
            float visible = config.showHandle ? config.handleAlpha : 0f;
            handle.setAlpha(Math.max(0f, visible * (1f - 0.5f * p)));
        }
        if (hint != null && hint.getVisibility() == View.VISIBLE) {
            // 上方小字跟条一起淡出，拖动时不至于糊在内容上
            hint.setAlpha(Math.max(0f, 1f - 0.6f * p));
        }
    }

    /** 刷新小白条上方的自定义文字（内容 + 位置 + 字号 / 粗细 / 字体 / 颜色）。 */
    private void updateHint() {
        if (hint == null) {
            return;
        }
        String text = config.hintText == null ? "" : config.hintText.trim();
        if (text.isEmpty()) {
            hint.setText("");
            hint.setVisibility(View.GONE);
            return;
        }
        if (!text.equals(hint.getText())) {
            hint.setText(text);
        }
        hint.setVisibility(View.VISIBLE);

        float density = window.getResources().getDisplayMetrics().density;

        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, config.hintSize);
        hint.setTextColor(config.hintColor);
        try {
            hint.setTypeface(android.graphics.Typeface.create(
                    typefaceFor(config.hintFont), config.hintWeight, false));
        } catch (Throwable t) {
            hint.setTypeface(typefaceFor(config.hintFont));
        }

        // 位置：与小白条的上下间距（条上方 36dp 触控盒之外）+ 水平偏移
        ViewGroup.LayoutParams lp = hint.getLayoutParams();
        if (lp instanceof FrameLayout.LayoutParams) {
            int bottom = (int) ((HANDLE_HEIGHT_DP + config.hintGap) * density);
            if (((FrameLayout.LayoutParams) lp).bottomMargin != bottom) {
                ((FrameLayout.LayoutParams) lp).bottomMargin = bottom;
                hint.setLayoutParams(lp);
            }
        }
        float tx = config.hintOffsetX * density;
        if (hint.getTranslationX() != tx) {
            hint.setTranslationX(tx);
        }
    }

    /**
     * 字体索引 → 系统字体族名。
     *
     * <p>0 系统默认（HyperOS 上就是 MiSans）、1 衬线、2 等宽、3 手写、4 窄体。
     * 粗细另外由 {@code hint_weight} 控制，不跟字体族混在一起。
     */
    private static android.graphics.Typeface typefaceFor(int font) {
        String family;
        switch (font) {
            case 1:
                family = "serif";
                break;
            case 2:
                family = "monospace";
                break;
            case 3:
                family = "cursive";
                break;
            case 4:
                family = "sans-serif-condensed";
                break;
            default:
                family = "sans-serif";
                break;
        }
        try {
            return android.graphics.Typeface.create(family, android.graphics.Typeface.NORMAL);
        } catch (Throwable t) {
            return android.graphics.Typeface.DEFAULT;
        }
    }

    private void haptic(int constant) {
        if (!config.haptic || handle == null) {
            return;
        }
        try {
            // 不加 FLAG_IGNORE_GLOBAL_SETTING：跟随系统「触感反馈」开关
            handle.performHapticFeedback(constant);
        } catch (Throwable t) {
            // 某些 ROM 会拒绝，忽略即可
        }
    }

    // ------------------------------------------------------------------ 动画

    private void animateTo(float target) {
        cancelAnimator();
        float from = progress;
        if (from == target) {
            if (target == 0f) {
                apply(0f);
                fadeHandle(0f);
            }
            return;
        }
        ValueAnimator a = ValueAnimator.ofFloat(from, target);
        a.setDuration(RETURN_MS);
        a.setInterpolator(SMOOTHSTEP);
        a.addUpdateListener(animation -> {
            progress = (Float) animation.getAnimatedValue();
            apply(progress);
            fadeHandle(progress);
        });
        animator = a;
        a.start();
    }

    private void cancelAnimator() {
        ValueAnimator a = animator;
        if (a != null) {
            animator = null;
            a.cancel();
        }
    }

    /**
     * 触发解锁的那一下：先把条和内容顺着上滑的劲送到屏幕顶，<b>送到位了才</b>拉解锁界面。
     *
     * <p>1.0.21 及以前是「松手立刻 {@code LiftArcUnlock.show()} + 同时 animateTo(0f)」，
     * 于是密码盘往上冒的同时条正在往下掉，两股反方向的运动撞在一起 —— 那就是看着简陋的
     * 全部原因。仿 iOS 应该是：条继续往上飞出屏幕，屏幕空一下，解锁界面才进来。
     *
     * <p>送到位后停在 {@code progress = 1}（内容上移 0.96×屏高，条和弧线都到顶）<b>不回弹</b>：
     * 解锁界面接管时 {@link #sync()} 会在下一次全局布局里把覆盖层置 GONE 并归零 ——
     * bouncer 显隐、keyguard 状态变化都会走那条 {@code OnGlobalLayoutListener}。
     * 只有 show() 明确失败才退回原来的回弹；另有一道延时兜底 {@link #armUnlockGuard()}。
     *
     * <p>被 {@link #cancelAnimator()} 取消（用户又按下、或 {@link #reset()}）时绝不能去拉
     * 解锁界面 —— ValueAnimator 被取消同样会回调 onAnimationEnd，所以先记 cancelled。
     */
    private void animateUpThenUnlock() {
        cancelAnimator();
        float from = progress;
        if (from >= 1f) {
            // 手指已经拉到顶了，没有东西可飞，直接进解锁
            finishUnlock();
            return;
        }
        ValueAnimator a = ValueAnimator.ofFloat(from, 1f);
        a.setDuration(Math.round(config.unlockMs));
        a.setInterpolator(SMOOTHSTEP);
        a.addUpdateListener(animation -> {
            progress = (Float) animation.getAnimatedValue();
            apply(progress);
            fadeHandle(progress);
            // 条是飞出去的、不是停在顶上：在 fadeHandle 那 50% 的基础上再乘 (1-p)，
            // 到顶刚好淡干净。这段只在解锁这一下跑，正常拖动不经过这里。
            if (handle != null) {
                handle.setAlpha(handle.getAlpha() * (1f - progress));
            }
            if (hint != null && hint.getVisibility() == View.VISIBLE) {
                hint.setAlpha(hint.getAlpha() * (1f - progress));
            }
        });
        a.addListener(new android.animation.AnimatorListenerAdapter() {
            private boolean cancelled;

            @Override
            public void onAnimationCancel(android.animation.Animator animation) {
                cancelled = true;
            }

            @Override
            public void onAnimationEnd(android.animation.Animator animation) {
                if (cancelled) {
                    return;
                }
                if (animator == a) {
                    animator = null;
                }
                finishUnlock();
            }
        });
        animator = a;
        a.start();
    }

    /** 条送到顶之后再拉解锁界面；起不来就按 1.0.21 的回弹处理。 */
    private void finishUnlock() {
        // 进度停在 1 时盖层正全糊着 —— 解锁一启动先撤掉，绝不能把糊住的壁纸盖到桌面上；
        // 这几帧 keyguard 还盖在上面，背景短暂回清晰无碍。回弹路径（show 失败）随
        // apply(<1) 自动重挂。
        restoreBlurAll();
        if (LiftArcUnlock.show()) {
            armUnlockGuard();
            return;
        }
        animateTo(0f);
    }

    /**
     * 解锁那一下的延时兜底。
     *
     * <p>正常路径用不到它：bouncer 一显隐、keyguard 状态一变都会走 onGlobalLayout →
     * {@link #sync()}，覆盖层随即 GONE 并归零，本兜底那时看到 progress 已经是 0、空转结束。
     * 但 {@code showPrimaryBouncer} 那条老路返回的是「结果未知」，真没弹出来时没有任何回调
     * 来收尾，内容就会一直卡在顶上 —— 这里 700ms 后看一眼，还在顶上就当没解锁、收回去。
     */
    private void armUnlockGuard() {
        clearUnlockGuard();
        Runnable r = () -> {
            unlockGuard = null;
            if (progress >= 1f) {
                animateTo(0f);
            }
        };
        unlockGuard = r;
        window.postDelayed(r, Math.round(config.unlockMs) + UNLOCK_GRACE_MS);
    }

    /** 下一次手势 / 归位时把那道兜底撤掉，免得它跟手指抢 progress。 */
    private void clearUnlockGuard() {
        Runnable r = unlockGuard;
        if (r != null) {
            unlockGuard = null;
            window.removeCallbacks(r);
        }
    }

    // ------------------------------------------------------------------ 配置变更

    /**
     * 把「玻璃参数」页那九项下发给玻璃条。
     *
     * <p>抽成方法是为了让初始化和 {@link #onConfigChanged} 两个调用点共用<b>同一行</b>：
     * 九个实参手抄两遍，早晚有一处顺序会串位 —— 那种 bug 表现为「改折射却变了高光」，
     * 肉眼根本分不清是顺序错了还是效果本来就这样。
     *
     * <p>实参顺序与 {@code LiftArcConfig} 字段声明顺序、{@code setGlassTuning} 形参顺序一致，
     * 三处锁死在同一条注释链上。
     */
    private void applyGlassTuning(LiftArcGlassStrip s, LiftArcConfig c) {
        s.setGlassTuning(c.glassDiffuse, c.glassBlur, c.glassRefract, c.glassEdgeRef,
                c.glassRefractW, c.glassFresnel, c.glassHighlight, c.glassHlWidth,
                c.glassOpacity);
    }

    @Override
    public void onConfigChanged(LiftArcConfig c) {
        // 远端配置的回调可能不在主线程
        window.post(() -> {
            if(sInstance!=this||!window.isAttachedToWindow())return;
            try {
            updateHandleWidth();
            if (rim != null) {
                rim.configure(c.arcWidth, c.arcAlpha, c.arcColor, c.arcDim, c.dimStrength,
                        c.dimUpper);
            }
            if (strip != null) {
                // 与上面 rim.configure 同源的五项：宽度 / 不透明度 / 是否压暗 / 压哪半 / 压多深
                strip.setRim(c.arcWidth, c.arcAlpha, c.arcDim, c.dimStrength, c.dimUpper);
                strip.setGlassThickness(c.glassThick);
                applyGlassTuning(strip, c);
                strip.setGlassEnabled(c.glassLive);
            }
            updateHint();
            fadeHandle(progress);
            lastApplied = Float.NaN;
            sync();
            if (overlay != null && overlay.getVisibility() == View.VISIBLE) {
                apply(progress);
                fadeHandle(progress);
            } else if (progress != 0f) {
                reset();
            }
            } catch(Throwable error) { LiftArcRuntime.error("锁屏配置应用",error); }
        });
    }

    /**
     * 「扩大触控范围」开关切换后重排小白条触控盒宽度。
     *
     * <p>宽度只是命中区：条本体在子 View / 自绘里都按屏幕居中，全宽也不改变外观。
     */
    private void updateHandleWidth() {
        if (handle == null) {
            return;
        }
        int want = config.handleWide
                ? ViewGroup.LayoutParams.MATCH_PARENT
                : Math.max(1,
                        (int) (handle.systemBarWidth()
                                + 2f * HANDLE_H_PAD_DP
                                * window.getResources().getDisplayMetrics().density));
        ViewGroup.LayoutParams lp = handle.getLayoutParams();
        if (lp != null && lp.width != want) {
            lp.width = want;
            handle.setLayoutParams(lp);
        }
    }

    private void log(String msg, Throwable t) {
        LiftArcLog.w(msg,t);
    }
}
