/* Derived from miyupyxh/LiftArc 1.0.22, commit 13245bbdc1c5431b14d8016512463f8d336c6306.
 * GPL-3.0; see assets/licenses/liftarc-GPL-3.0.txt and third_party/LiftArc/README.md.
 * Phone-side RedMagic adaptation: configuration, lifecycle, geometry and reflection.
 */
package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.RuntimeShader;
import android.graphics.Shader;
import android.app.WallpaperManager;
import android.os.SystemClock;
import android.view.View;

import java.io.FileInputStream;

/**
 * 液态玻璃描边条（设置项「液态玻璃实时渲染弧形描边」）。
 *
 * <p><b>不新建第二条曲线</b>。中心线默认就是 {@link LiftArcRimView} 画那条高光描边用的
 * <b>同一份 {@code LiftArcGeometry.bottomPath()}</b>，再用 {@link Paint#getFillPath} 把 stroke
 * 转成填充轮廓 —— 所以描边模式下玻璃和现有弧线<b>逐像素重合</b>。
 *
 * <p><b>开压暗时中心线沿法线朝弧线上方挪开半条带宽</b>（见 {@link #strokeCenter}）：
 * 整条玻璃带变成弧线上方的那条环带，外侧脸正好压在弧线上，<b>压下面、压上面几何完全一样</b>
 * ——压下面时带子在亮的那半边（{@code dimF = 1}）；压上面时带子就是<b>被压暗那一半的底边</b>
 * （{@code dimF = 1 - dimS*riseS}，与 {@code LiftArcRimView} 的黑纱同值），所以两个方向都不会
 * 和背景错层，分界线也始终是那条弧线。{@code dimUpper} 因此只进 shader 的 {@code dimMode}、
 * <b>不进几何</b>。挪的是法线方向而不是整体平移：弧线两端本来就竖着贴屏幕边缘，
 * 平移会让带子依旧骑在分界线上。
 *
 * <p><b>渲染区域严格受控</b>：绘制只有 {@code canvas.drawPath(band, glassPaint)} 一句，
 * 颜色只可能落在那条轮廓里（3dp 左右的一条细线）。本类<b>从不改 View alpha、
 * 不改整窗亮度、不动压暗/描边/手势</b>，也不把 Shader 铺到整个弧形填充区。
 *
 * <p><b>两种模式都画</b>（1.0.22 起）：iOS 式压暗模式本来就不描边，但用户明确要求压暗模式
 * 也要有底部玻璃 —— 所以 {@link #strokeVisible()} 不再看 dim，只在描边模式下额外要求
 * {@code arcAlpha > 0}（描边不透明度为 0 = 没有描边）。
 *
 * <p><b>强度恒定满值</b>（1.0.22）：玻璃<b>不再</b>跟随上滑进度淡入淡出 —— 需求原文是
 * 「把这个玻璃效果一直设到最高，不要跟随上滑程度再慢慢添加玻璃效果」。
 * {@link #rebuild()} 里的 alpha 恒等于「玻璃参数」页那条不透明度，
 * 从手势开始到结束一格不变；随手势变的只有<b>位置</b>与液态<b>相位</b>。
 *
 * <p><b>两级 shader</b>：真机 SkSL 编译有不确定因素，先试完整的 {@link #AGSL}，
 * 失败再试 {@link #AGSL_BASIC}（只用最保守的语法），两个都失败才放弃玻璃。
 * <b>任何一级的失败都会把具体异常打进日志</b>（tag LockBar），便于定位。
 *
 * <p><b>五个初调参数</b>（都在 {@link #K_*}，改完重新编译即可校准）：
 *
 * <ul>
 *   <li>{@link #K_DIFFUSE}   玻璃漫反射 5% —— 取色来自背景本身（远景模糊 × 场景亮度），
 *       <b>不是盖一层白/灰</b>；
 *   <li>{@link #K_BLUR_PX}   背景模糊 1 物理像素 —— 描边中线最糊、靠边收窄，做出厚度；
 *   <li>{@link #K_REFRACT}   折射强度 35% —— 三层折射（边缘透镜 + 法向波纹 + 切向流动），
 *       全部以描边半宽为尺度；采样时 R/G/B 各走一条折射路径，边缘才会有真实的色散；
 *   <li>{@link #K_HIGHLIGHT} 边缘高光 45% —— 外缘细亮线 + 压暗侧壁 + 内外斜面反光 +
 *       随上滑进度跑的高光斑 + 镜面反射；主光与补光都点积法线，所以高光跟着弧线曲率走；
 *   <li>{@link #K_OPACITY}   玻璃整体不透明度 96% —— 走 {@link Paint#setAlpha}，
 *       Shader 内 alpha 恒为 1，避免半透明混合的歧义。
 * </ul>
 *
 * <p><b>背景从哪来（必须知道的限制）</b>：描边背后一半是锁屏内容（本窗口）、一半是壁纸窗口，
 * <b>本窗口内的任何 Shader 都读不到它们的像素</b> —— 没有逐帧截屏，也不用固定壁纸贴图冒充，
 * 而是直接读 {@link WallpaperManager#getWallpaperFile} 拿<b>当前真实生效的锁屏壁纸</b>，
 * 按与系统壁纸窗口同一套 center-crop 铺满窗口，缓存成 BitmapShader；换壁纸靠
 * {@link WallpaperManager#getWallpaperId} 轮询发现并自动重载。对静态锁屏壁纸来说，
 * 这张图与屏幕背后那一帧<b>是同一张</b>。
 *
 * <p><b>真正的跨窗口逐帧实时采样只有系统合成侧的 MiGlass</b>。上一版试过，但它靠 View 的
 * Outline 定形状，而 3dp 的描边轮廓是<b>细长非凸</b>形，一旦 Outline 裁不动就会退化成整块
 * 矩形玻璃 —— 直接违反「渲染范围严格贴合描边」。本次为了守住区域红线<b>主动摘掉它</b>。
 * 代价是：超级壁纸 / 视频壁纸这类拿不到静态文件的，本类就不叠加玻璃（保留原描边），
 * 日志会写明原因。
 *
 * <p>AGSL 编不过时同样只是「这条玻璃不生效」，原有描边、动画、手势一律不受影响。
 */
final class LiftArcGlassStrip extends View {

    // ---------------------------------------------------------------- 光学参数
    //
    // 这一组就是液态玻璃的可调节渲染参数（括号里是它们的对外叫法）。
    // 改完重跑 :app:assembleRelease 即可上机对比 —— 全部只影响玻璃材质，
    // 绝不触碰弧形几何、描边宽度、上滑动画与手势。
    //
    //  注意「折射」和「模糊」是两件事：模糊一大就会把折射位移抹平。
    //  历史教训：blurRadius=16 配上随带宽放大，实际模糊核到了 43px，
    //  而折射位移 57px 全被 86px 直径的采样平均掉 —— 看起来就像"没有折射"。
    //
    //  更重要的教训（本轮）：<b>折射位移不是越大越好</b>。采样坐标
    //  uv = p + n·lens 的雅可比是 1 + d(lens)/d(距离)，一旦它过 0 就发生
    //  折叠 —— 背景被镜像后叠在一起，看起来就是「纹理重复 / 拖影」。
    //  旧公式 lens = 折射强度×R×3.1×edge² 在边沿的雅可比是 −5.3，
    //  也就是说带宽外侧约 80% 的区域整片都在折叠。所以 K_REFRACT 现在
    //  是<b>斜率上限</b>（≤1 恒不折叠），位移峰值约 0.5×带半宽，而不是 3 倍。

    /**
     * 漫反射强度 diffuseStrength 0..1（0.13）。混入的环境光，取色自背景本身。
     * <p>对照 iOS 26 Liquid Glass 实拍后下调：这一项是乘性的，
     * 0.30 在中灰背景上等于整条玻璃<b>提亮 27%</b> —— 那层奶白雾就是它，
     * 玻璃后面的字被冲淡成磨砂。真玻璃是「透亮」不是「提亮」。
     */
    static final float K_DIFFUSE = 0.05f;
    /**
     * 背景模糊半径 blurRadius，物理像素（7）。刻意压小，给折射留出可辨认的细节。
     * <p>iOS 的液态玻璃背后<b>是清晰的</b>，只有形变没有磨砂；10px 已经把
     * 背景细节糊掉一截，读起来像毛玻璃而不是玻璃。
     */
    static final float K_BLUR_PX = 1f;
    /**
     * 折射强度 refractionStrength 0..1（0.85）。<b>语义 = 斜率上限</b>：
     * d(lens)/d(距离) ≤ 强度 × 0.82 × (2·edge − edge²) + 边缘项 ≤ 1，
     * 因此采样雅可比恒为正、背景永不折叠。位移峰值 ≈ 0.55 × 带半宽。
     */
    static final float K_REFRACT = 0.85f;
    /**
     * 边缘折射 edgeRefraction 0..1（0.40）。把弯折往边沿推的额外一项，
     * 同样吃斜率预算，所以系数只有 0.12 —— 陡峭的边环正是上一版折叠的主因。
     */
    static final float K_EDGE_REFRACT = 0.40f;
    /**
     * 折射影响范围 refractionWidth 0..1（0.45）。决定「边缘光学强区」（色散、
     * 菲涅尔）从带宽外侧多少比例开始起效；shader 内下限 0.30，防止
     * smoothstep 过窄导致导数爆炸。
     */
    static final float K_REFRACT_W = 0.45f;
    /**
     * 菲涅尔强度 fresnelStrength 0..1（0.30）。掠射角反射环境的比例，玻璃感主来源。
     * 环境反射里的「白色」成分在 shader 内已按背景亮度缩放，这里再整体压一档，
     * 保证即使在高亮背景上，掠射反射也只是玻璃的一部分而不是盖在背景上的光带。
     */
    static final float K_FRESNEL = 0.22f;
    /**
     * 镜面高光强度 highlightIntensity 0..1（0.36）。叠加已改成 screen 混合，不会过曝；
     * 且所有高光项在求和后统一乘 (0.35 + 0.65 × 背景亮度)，暗背景上只剩柔和反射。
     */
    static final float K_HIGHLIGHT = 0.46f;
    /**
     * 高光宽度 highlightWidth 0.5..2.0（0.85）。沿弧在 0.70~1.20 倍间漂移，
     * 另按局部曲率在 0.85~1.30 倍间收放 —— 弧弯得越急，高光越宽越柔。
     * <p>0.85 是刻意收窄：iOS 的镜面高光是<b>贴着轮廓的一条细线</b>，
     * 不是一条宽光带；把默认值收窄之后再把峰值亮度抬回来，
     * 得到的是「细而亮」而不是「宽而糊」。
     */
    static final float K_HL_WIDTH = 0.85f;
    /** 玻璃整体不透明度 0..1（96%）。 */
    static final float K_OPACITY = 0.96f;
    //
    //  第 9 个参数 glassThickness（玻璃厚度）不在这里 —— 它是用户可调的设置项
    //  `glass_thick`（1..40dp，缺省 20dp，与描边宽度完全无关），由 LiftArcConfig 读入后经
    //  setGlassThickness 传下来，shader 侧以 uniform `halfW` 的形式参与所有光学计算。

    // ---------------------------------------------------------------- 形状

    /** 纹理重试间隔（拿不到壁纸时不至于每帧砸 binder）。 */
    private static final long RETRY_MS = 20_000L;
    /** 壁纸 id 复查间隔（换壁纸后多久能发现）。 */
    private static final long RECHECK_MS = 4_000L;
    /** 纹理解码上限：太大的位图对 SystemUI 是净负担，超过就降采样。 */
    private static final int TEX_MAX_DIM = 2560;

    // ---------------------------------------------------------------- AGSL（一级：完整）
    //
    // 注意：这条字符串是<b>直接喂给 SkSL 词法器</b>的 ——
    //   1) 注释里绝对不能出现非 ASCII（中划线、中文都不行），否则真机编译失败；
    //   2) uniform / 变量名不能撞 SkSL 内置函数（refract、reflect、sign、mix、clamp、
    //      pow、normalize、smoothstep、exp、sin、dot、length、abs、max、min、step…），
    //      所以折射强度叫 refractK、视口叫 viewSize；
    //   3) 只用最标准的构造：不用 mix(float3,float3,float)、不用 clamp(float3,float,float)、
    //      不用 float3(1.0) 单参 splat、不用三元表达式 —— 全部手写等价式。
    // 以上任何一条不确定的写法都会同时体现在 AGSL_BASIC 兜底版里被避开。

    private static final String AGSL =
            "uniform shader wallpaper;\n"
                    + "uniform float2 viewSize;\n"
                    + "uniform float  topY;\n"
                    + "uniform float  bottomY;\n"
                    + "uniform float  botR;\n"
                    + "uniform float  halfW;\n"
                    + "uniform float  diffuse;\n"
                    + "uniform float  blurPx;\n"
                    + "uniform float  refractK;\n"
                    + "uniform float  edgeRef;\n"
                    + "uniform float  refractW;\n"
                    + "uniform float  fresnelK;\n"
                    + "uniform float  highlight;\n"
                    + "uniform float  hlWidth;\n"
                    + "uniform float  phase;\n"
                    + "uniform float  dimS;\n"
                    + "uniform float  dimMode;\n"
                    + "\n"
                    // signed distance to the stroke centerline: 0 exactly on the line
                    + "float sdShell(float2 p) {\n"
                    + "    float2 c = float2(viewSize.x * 0.5, (topY + bottomY) * 0.5);\n"
                    + "    float2 b = float2(viewSize.x * 0.5, (bottomY - topY) * 0.5);\n"
                    + "    float  r = max(botR, 1.0);\n"
                    + "    float2 q = abs(p - c) - b + r;\n"
                    + "    return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;\n"
                    + "}\n"
                    + "\n"
                    // 13 tap gaussian: center + 6 at 0.55r + 6 at r, weights ~ 1
                    + "float3 blurSample(float2 uv, float r) {\n"
                    + "    float3 s = float3(wallpaper.eval(uv).rgb) * 0.20;\n"
                    + "    float r1 = r * 0.55;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 1.0,  0.0)      * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.5,  0.866025) * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.5,  0.866025) * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-1.0,  0.0)      * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.5, -0.866025) * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.5, -0.866025) * r1).rgb) * 0.09;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.866025,  0.5) * r ).rgb) * 0.043;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.0,       1.0) * r ).rgb) * 0.043;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.866025,  0.5) * r ).rgb) * 0.043;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.866025, -0.5) * r ).rgb) * 0.043;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.0,      -1.0) * r ).rgb) * 0.043;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.866025, -0.5) * r ).rgb) * 0.043;\n"
                    + "    return s;\n"
                    + "}\n"
                    + "\n"
                    // far-field scatter used by the diffuse term (7 taps is plenty)
                    + "float3 wideSample(float2 uv, float r) {\n"
                    + "    float3 s = float3(wallpaper.eval(uv).rgb) * 0.4;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 1.0,  0.0)      * r).rgb) * 0.1;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.5,  0.866025) * r).rgb) * 0.1;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.5,  0.866025) * r).rgb) * 0.1;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-1.0,  0.0)      * r).rgb) * 0.1;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2(-0.5, -0.866025) * r).rgb) * 0.1;\n"
                    + "    s = s + float3(wallpaper.eval(uv + float2( 0.5, -0.866025) * r).rgb) * 0.1;\n"
                    + "    return s;\n"
                    + "}\n"
                    + "\n"
                    + "half4 main(float2 p) {\n"
                    // cross-section: u = -1 inner face, 0 band centre, +1 outer face.
                    //
                    // WHEN DIMMING IS ON THE BAND IS NOT STRADDLING THE ARC ANY MORE: the
                    // Java side walks the stroke centreline half a band-width ABOVE the arc
                    // (LiftArcGlassStrip.strokeCenter), so the band is the ring
                    // [R - 2*halfW, R] and d runs from -2h to 0 instead of -h to +h, with
                    // the outer face landing exactly on the arc. Re-anchor u on the band
                    // centre (d = -h) or every ramp below would read the faces backwards.
                    //
                    // sh is simply +1 while dimming is on and 0 in stroke mode, NEVER -1:
                    // both dim directions put the band on the same upper ring - dim-below
                    // leaves it in the bright half, dim-above puts it against the bottom
                    // edge OF THE DIMMED HALF. dimMode does not move the geometry any
                    // more, it only picks which half LiftArcRimView paints and therefore
                    // what dimF has to be. sh derives from the same dimS gate the Java
                    // path builder used, so the two can never disagree.
                    + "    float d = sdShell(p);\n"
                    + "    float sh = min(max(dimS * 100.0, 0.0), 1.0);\n"
                    + "    float u = clamp(d / max(halfW, 0.5) + sh, -1.0, 1.0);\n"
                    + "    float th = 1.0 - abs(u);\n"
                    + "    float edge = abs(u);\n"
                    + "    float eo = (u + 1.0) * 0.5;\n"
                    + "    float ei = (1.0 - u) * 0.5;\n"
                    + "    float R = max(halfW, 0.5);\n"
                    // The dissolve envelope is hoisted to the top because the very same
                    // ramp now also tapers the refraction. Displacement has to reach
                    // exactly zero where alpha reaches zero: the composited pixel is
                    // outc*aEdge + backdrop*(1-aEdge), so a displacement that is still
                    // full when the alpha is already fading shows the wallpaper twice
                    // across the boundary - that reads as a texture seam, not as glass.
                    //
                    // It also decides how crisp the silhouette is. 0.74 spread the fade
                    // over 26% of the half-width (~11px), which turned the outer face
                    // into a 10px gradient and made the whole strip read as a soft light
                    // bar. iOS's liquid glass has a DEFINED edge: it is still antialiased
                    // (alpha reaches 0 exactly on the path), just over ~4px, and the
                    // thin specular line lives entirely inside it now.
                    + "    float aEdge = 1.0 - smoothstep(0.84, 1.0, edge);\n"
                    // 上沿改成长渐变：u<0 是带子朝屏幕上方那一侧，不再吃 0.84 的紧膝，
                    // 改走 smoothstep(-1, 0, u) 一路从 1 溶到 0 —— 渐变长度从原来的
                    // 6.7px 拉满到整个上半段 42px，「上面那条边」不再是一条线。
                    // u>0 贴着弧线的那一侧保持原来的紧边不动：玻璃与弧线的交界仍然
                    // 是定义清楚的一条线，只有朝上那一面化开。
                    //
                    // 插在 aEdge 声明之后、endFade/dFade 之前：dFade = aEdge*aEdge 在
                    // 其后才计算，所以上半段的折射位移会跟着 alpha 一起退到 0，不会
                    // 出现「alpha 已经淡掉、位移还在」那种重影接缝。
                    + "    aEdge = min(aEdge, smoothstep(-1.0, 0.0, u));\n"
                    // TAPER THE BAND OUT AT BOTH BUTT CAPS.
                    //
                    // strokeCenter's centreline is an OPEN path, so getFillPath closes
                    // each end with a horizontal Paint.Cap.BUTT cut at y = bottomY - botR,
                    // one at each screen edge. Until the inner ring takes over at
                    // x = 2*halfW that straight cut IS the band's top face, and there
                    // u = 0 so aEdge reads 1: full opacity glass starting abruptly with
                    // bare wallpaper directly above it - a perfectly horizontal hard edge
                    // ~84px long at each end of the arc. That is the seam circled in the
                    // two screenshots. LiftArcRimView's cloth is no longer part of it: both
                    // sides of the cut sit inside the shell and read the same dimF, so
                    // what is left is the glass itself being chopped.
                    //
                    // endFade measures the distance to the two cap SEGMENTS (x beyond the
                    // cap's half-length, y below the cap line), so it is exactly 0 along the
                    // whole cut and 1 one band-width away - the segment the code tests,
                    // [capL - hw, capL + hw] x {capY}, is exactly that top face. aEdge feeds
                    // dFade as well, so the refraction and the blur stop growing on the same
                    // ramp: the band eases to nothing instead of being chopped, and where it
                    // is chopped there is no alpha left to show a step with.
                    + "    float hw2 = max(halfW, 0.5);\n"
                    + "    float capY = bottomY - min(max(botR, 1.0), viewSize.x * 0.5);\n"
                    + "    float capL = sh * halfW;\n"
                    + "    float2 dl = float2(max(abs(p.x - capL) - hw2, 0.0),\n"
                    + "                        max(p.y - capY, 0.0));\n"
                    + "    float2 dr = float2(max(abs(p.x - (viewSize.x - capL)) - hw2, 0.0),\n"
                    + "                        max(p.y - capY, 0.0));\n"
                    + "    float endFade = smoothstep(0.0, hw2 * 2.0,\n"
                    + "                              min(length(dl), length(dr)));\n"
                    + "    aEdge = aEdge * endFade;\n"
                    + "    float dFade = aEdge * aEdge;\n"
                    + "\n"
                    // LOCKRIMVIEW DIM SYNC. The black scrim LiftArcRimView paints lives one
                    // view BELOW this strip, so the wallpaper outside the band shows
                    // through it already darkened while this shader renders the raw
                    // bitmap - the strip used to sit at full brightness on a 0.57 scrim,
                    // a 2.3x step against its surroundings on both sides of the arc.
                    //
                    // dimF is applied to the FINAL pixel, not to the samples. Scaling
                    // every term by the same factor is exactly what a black scrim over
                    // the strip would do, so the glass keeps the very same relative
                    // contrast in the dimmed half as it has in the natural half: the
                    // rim reads there exactly the way it reads everywhere else instead
                    // of turning into a brighter-than-backdrop slab whose edge gives
                    // the seam away. Dimming only the samples would have left every
                    // additive floor (env white, hlTint white, the 0.35 rim gate)
                    // undimmed, and those floors are precisely what makes an edge.
                    //
                    // WHY THIS IS A STEP AND NOT A RAMP ANY MORE.
                    //
                    // It used to sweep smoothstep over the whole band so the glass carried
                    // the boundary itself. That only works while the band STRADDLES the arc.
                    // Since 1.0.22 the Java side walks the centreline half a band-width
                    // above the arc (strokeCenter) for BOTH dim directions, so the band is
                    // the ring d in [-2h, 0] - always on the inner side of the shell. A
                    // ramp anchored on the band would now dim the MIDDLE of the band when
                    // dimming is below (it sits in the bright half) and turn the glass into
                    // a dark lens floating above a hard edge.
                    //
                    // So dimF is simply LiftArcRimView's own value at that pixel: one hard
                    // step at d = 0, exactly where LiftArcRimView cuts. Read it per mode,
                    // with the band always at d <= 0:
                    //   dim-below (dimMode 0): dimO = 0 -> mask 0 -> dimF = 1.0. Correct:
                    //     the band is inside the shell, and the scrim covers the OUTSIDE.
                    //   dim-above (dimMode 1): dimO = 0 -> dimI = 1 -> mask = 1 -> dimF =
                    //     1 - dimS*riseS, the same dimStrength*smoothstep(rise) LiftArcRimView
                    //     paints over path. Correct: the band IS the bottom edge of the
                    //     dimmed half, so it has to sit in the same black cloth as the
                    //     pixels right above it.
                    // The only pixels that ever read the far side of the step are on the
                    // outer face, where aEdge is already 0.
                    //
                    // dimMode 0 = dim OUTSIDE the shell (dimUpper off, the default);
                    // dimMode 1 = dim INSIDE, ramped by the same smoothstep(rise)
                    // LiftArcRimView uses. dimS is 0 in stroke mode and collapses dimF to 1.
                    + "    float dimO = min(max(d * 1000.0, 0.0), 1.0);\n"
                    + "    float dimI = 1.0 - dimO;\n"
                    + "    float mask = dimO * (1.0 - dimMode) + dimI * dimMode;\n"
                    + "    float rise = (viewSize.y - bottomY) / max(viewSize.y, 1.0);\n"
                    + "    float riseS = rise * rise * (3.0 - 2.0 * rise);\n"
                    + "    float dimA = dimS * mask * ((1.0 - dimMode) + dimMode * riseS);\n"
                    + "    float dimF = 1.0 - dimA;\n"
                    + "\n"
                    // normal by central differences + a liquid tilt driven by gesture phase
                    + "    float2 g = float2(\n"
                    + "        sdShell(p + float2(1.0, 0.0)) - sdShell(p - float2(1.0, 0.0)),\n"
                    + "        sdShell(p + float2(0.0, 1.0)) - sdShell(p - float2(0.0, 1.0)));\n"
                    + "    float2 n0 = g / max(length(g), 0.0001);\n"
                    + "    float2 t0 = float2(-n0.y, n0.x);\n"
                    + "    float ph = phase * 6.2831853;\n"
                    + "    float wig = sin(p.x * 0.017 + ph * 1.35) * 0.20\n"
                    + "              + sin(p.x * 0.0063 - ph * 0.75) * 0.13;\n"
                    + "    float2 nraw = n0 + t0 * wig;\n"
                    + "    float2 n = nraw / max(length(nraw), 0.0001);\n"
                    + "    float2 tg = float2(-n.y, n.x);\n"
                    + "\n"
                    // Local curvature of the stroke: a second difference of the distance
                    // field along the tangent equals 1 / radius of curvature, normalised
                    // by the shell's own bottom radius so a flat stretch reads 0 and a
                    // fully bent one reads ~0.55. This replaces the old travelling
                    // gaussian, which lit one fixed stretch of arc no matter what was
                    // behind it - a gaussian at a fixed position IS a white band.
                    + "    float cs = 14.0;\n"
                    + "    float curv = (sdShell(p + tg * cs) + sdShell(p - tg * cs)\n"
                    + "               - 2.0 * d) / (cs * cs);\n"
                    + "    float kFace = clamp(abs(curv) * max(botR, 1.0) * 0.55, 0.0, 1.0);\n"
                    + "\n"
                    // refraction, three layers, all scaled by half stroke width:
                    // edge lens pulls background into the rim, ripple runs normal,
                    // slide runs tangentially so the glass reads as flowing.
                    //
                    // DISPLACEMENT IS SLOPE-BOUNDED. The derivative of lens is the local
                    // magnification of the backdrop: sampling Jacobian = 1 + d(lens)/dd.
                    // Once that crosses zero the sampling coordinate folds back on itself
                    // and the wallpaper mirrors into repeated / ghosted texture. The old
                    // edge^2 profile reached -5.3 at the rim, so it folded over ~80% of
                    // the band - that was the ghosting, not refraction being too weak.
                    //   g(e) = e^2 - e^3/3 -> g'(0) = 0 (no kink at the centerline),
                    //                         g'(1) = 1 (ceiling reached only at the rim)
                    // so d(lens)/dd = refractK * 0.82 * (2e - e^2) + ... <= ~0.86 and the
                    // Jacobian stays positive everywhere the glass is still visible.
                    + "    float side = 0.0 - sign(u);\n"
                    + "    float gx = p.x / max(viewSize.x, 1.0) * 2.0 - 1.0;\n"
                    + "    float ring = smoothstep(max(1.0 - refractW, 0.30), 1.0, edge);\n"
                    + "    float e2 = edge * edge;\n"
                    + "    float gp = e2 - e2 * edge * 0.3333333;\n"
                    + "    float lens = side * (R * refractK * 0.82)\n"
                    + "               * (gp + edgeRef * 0.12 * e2 * edge)\n"
                    + "               * (0.88 + 0.12 * kFace);\n"
                    // Normal ripple stays tiny on purpose: it spends slope budget 1:1 for
                    // every pixel of amplitude. The flowing feel comes from `slide`, which
                    // runs tangentially along the arc and therefore costs almost nothing.
                    + "    float ripple = refractK * R * 0.10 * edge\n"
                    + "                * sin(p.x * 0.011 + ph * 1.9);\n"
                    + "    float slide = refractK * R * 0.55 * edge\n"
                    + "                * sin(p.x * 0.0085 - ph * 1.1)\n"
                    + "                * (0.72 + 0.56 * kFace);\n"
                    + "    float2 uv = p + n * ((lens + ripple) * dFade)\n"
                    + "               + tg * (slide * dFade);\n"
                    // Chromatic dispersion is a few px, not tens: a large split leaves the
                    // red and blue copies of the same detail visibly doubled.
                    + "    float disp = refractK * R * 0.14 * edge * (0.6 + 0.8 * ring) * dFade;\n"
                    + "\n"
                    // adaptive: measure the backdrop first, then pick haze / blur / gain.
                    // The kernel is deliberately narrow - every tap is one literal copy of
                    // the wallpaper, so a wide ring of taps over a detailed background
                    // reads as several repeated images rather than as an average.
                    // Reflections and highlight tint both read this sample, so it must
                    // stay LOCAL. At R*0.40 the 7 taps spanned ~0.8 x band thickness -
                    // a 34px smear. Blending 26% of a 34px blur into the rim is exactly
                    // the soft glow halo that made the strip read as a light bar instead
                    // of a piece of glass sitting on the wallpaper.
                    + "    float3 wide = wideSample(uv, R * 0.16);\n"
                    + "    float bgLum = dot(wide, float3(0.2126, 0.7152, 0.0722));\n"
                    + "    float darkBg = 1.0 - smoothstep(0.0, 0.5, bgLum);\n"
                    // blur is kept well below the displacement it has to survive: 60px band
                    // blurs ~11px at the center instead of the old 43px, so the moved
                    // texture stays recognisable as moved texture.
                    + "    float r = max(blurPx * (0.55 + 0.45 * th)\n"
                    + "                * (0.90 + 0.20 * darkBg), 1.0);\n"
                    + "\n"
                    // live sample + chromatic dispersion (three separate refraction paths)
                    + "    float3 cG = blurSample(uv, r);\n"
                    + "    float3 cR = blurSample(uv + n * disp, r);\n"
                    + "    float3 cB = blurSample(uv - n * disp, r);\n"
                    + "    float3 col = float3(cR.r, cG.g, cB.b);\n"
                    + "\n"
                    // Diffuse re-weights the colour that is already on screen instead of
                    // adding a second, independently sampled copy of the backdrop on top
                    // of it - adding is what leaked the tap pattern into the image.
                    + "    col = col * (1.0 + diffuse * (0.62 + 0.58 * bgLum));\n"
                    + "    col = col + diffuse * 0.10 * th * (0.30 + 0.70 * bgLum)\n"
                    + "            * float3(0.92, 0.95, 1.0);\n"
                    + "\n"
                    + "    // glass side walls: a soft gradient just inside each face reads as\n"
                    // slab thickness. Kept low and wide - a tight dark band is the same
                    // kind of hard-edged graphic the white rim used to be.
                    + "    float sideWall = smoothstep(0.28, 0.68, eo)\n"
                    + "                   * (1.0 - smoothstep(0.68, 0.88, eo));\n"
                    + "    float innerWall = smoothstep(0.28, 0.68, ei)\n"
                    + "                   * (1.0 - smoothstep(0.68, 0.88, ei));\n"
                    + "    col = col * (1.0 - 0.12 * sideWall);\n"
                    + "    col = col * (1.0 - 0.06 * innerWall);\n"
                    + "\n"
                    // Highlight width drifts along the arc instead of holding one value for
                    // the whole stroke, so no two stretches keep the same rim width.
                    + "    float hw = hlWidth * (0.70 + 0.50 * (0.5 + 0.5\n"
                    + "                    * sin(gx * 2.6 + ph * 0.6)))\n"
                    + "               * (0.85 + 0.45 * kFace);\n"
                    + "    float bevelO = smoothstep(0.74, 0.99, eo);\n"
                    + "    float bevelI = smoothstep(0.78, 1.0, ei) * 0.45;\n"
                    // THE RIM IS THE REASON THE STRIP READ AS A DRAWN BAND.
                    // It used to ramp from eo 0.54 up to 0.86 and then hold full
                    // strength: in edge units that is a 0.5 x half-width climb (~19px)
                    // followed by a plateau, so ~30px of the strip carried highlight.
                    // A 30px-wide bright zone IS a light bar whatever its brightness.
                    //
                    // The fix for too concentrated / the edge is abrupt was NOT to
                    // dim the rim - it was to stop it being a step. Both former ends
                    // sat on a plateau (the ramp topped out at 0.93 and then held 1.0
                    // out to the face), so the highlight arrived at full strength in
                    // ~3px and stopped dead: measured on device that is a flat-topped
                    // bar with two hard borders.
                    //
                    // The upper edge now sits AT the face (0.995) so the ramp never
                    // reaches a plateau, and smoothstep gives zero slope at both ends,
                    // so the line is a bump that eases in over ~10px and tapers to
                    // nothing exactly where the alpha does - no kink, no border, and
                    // the peak lands where aEdge is still 1 instead of under the fade.
                    // Width still drifts with hw and curvature, so a bent stretch gets
                    // a slightly wider, softer line.
                    + "    float rimO = smoothstep(0.88 - 0.16 * hw,\n"
                    + "                           0.995, eo);\n"
                    + "    float rimI = smoothstep(0.88 - 0.16 * hw,\n"
                    + "                           0.995, ei) * 0.50;\n"
                    + "    float fres = pow(edge, 1.8) * (0.80 + 0.40 * ring);\n"
                    // The white component of the environment reflection used to be a
                    // flat 0.30 whatever was behind the glass, which put a fixed white
                    // floor under every rim pixel - that floor is most of what read as a
                    // drawn line. It now tracks the backdrop's own luminance, so a dark
                    // wallpaper gets a faint sheen and a bright one gets a full reflection.
                    // A gain above 1 made the reflection strictly brighter than what is
                    // behind it, so Fresnel could only ever ADD light - that one-sided
                    // add is what showed up as a milky veil over the wallpaper. Under 1
                    // the reflection is a copy of the scene, and the white component is
                    // the only part that lifts it.
                    // SCENE-LED REFLECTION. The white term used to be a flat floor
                    // plus a linear term in bgLum, so a dark backdrop still got 0.07
                    // of pure white pushed through the whole face - the glass then sat
                    // measurably above its own background (the ~1.47 plateau we read
                    // off the recording) and the two never fused.
                    //
                    // bgLum is squared so the white contribution collapses as the
                    // backdrop darkens (0.02 at bgLum 0.15 instead of 0.07), and the
                    // scene copy is at unity: on any real wallpaper the reflection is
                    // now carried by the sampled texture, not by an additive white.
                    // This is a change of WHERE the reflection comes from, not a
                    // dimming of it - a bright backdrop still lights the face up,
                    // because that is the sample lighting it up.
                    + "    float3 env = wide * 1.00\n"
                    + "               + float3(1.0, 1.0, 1.0) * (0.008 + 0.12 * bgLum * bgLum);\n"
                    + "    col = col + (env - col) * (fres * fresnelK);\n"
                    + "\n"
                    // EDGE CONVERGENCE - the seam against the dimmed backdrop was two
                    // separate discontinuities and neither one was the alpha ramp.
                    //   1. BRIGHTNESS. The bulk still carried its diffuse / Fresnel
                    //      lift all the way out to the face, so the strip stopped at
                    //      roughly 1.15x the backdrop instead of dropping onto it -
                    //      a step, and the scrim below it is a 0.43 copy of the same
                    //      backdrop, so the step survived the dimming intact.
                    //   2. TEXTURE. The lens displacement is largest right at the
                    //      face (~16px with the current slope budget) while dFade
                    //      only collapses it inside the outer 10% of the half width,
                    //      so 16px of shear landed inside a 4px alpha ramp. That is
                    //      the visible edge, not a soft dissolve.
                    // Both are removed by sampling THIS pixel's own backdrop with
                    // wallpaper.eval(p) and letting col meet it as edge -> 1. At
                    // edge 1 col is the backdrop, and dimF already equals the scrim
                    // there, so the face matches its neighbour exactly - the
                    // boundary is zero by construction instead of merely small.
                    //
                    // It starts at 0.66, so the refracted sample, the dispersion and
                    // the diffuse body are untouched through the inner two thirds of
                    // the band: the material still reads where you look for it. The
                    // rim highlight is applied AFTER this convergence, so the edge
                    // keeps its specular line - what it no longer sits on top of is
                    // a bright slab, which is what made it read as a drawn line.
                    + "    float3 rawB = float3(wallpaper.eval(p).rgb);\n"
                    + "    float toBg = smoothstep(0.66, 0.98, edge);\n"
                    + "    col = col + (rawB - col) * toBg;\n"
                    + "\n"
                    + "    // key + fill light, both dotted against the local normal\n"
                    + "    float2 L1 = normalize(float2(-0.42, 0.91));\n"
                    + "    float2 L2 = normalize(float2(0.58, 0.81));\n"
                    + "    float keyL = 0.5 + 0.5 * dot(n, L1);\n"
                    + "    float fillL = 0.5 + 0.5 * dot(n, L2);\n"
                    + "    float rimLight = 0.55 * keyL + 0.45 * max(fillL, 0.55 * keyL);\n"
                    + "\n"
                    // No travelling gaussian any more. A gaussian parked at a position
                    // along the stroke IS a concentrated band of light: it lights one
                    // stretch of arc at full strength regardless of what sits behind it,
                    // so no amount of weakening stops it reading as something laid on top.
                    // Curvature, the local normal and the drifting key light carry all of
                    // the along-arc variation now - none of them can produce a blob.
                    //
                    // The rim is not a constant ring either. It is masked by how squarely this
                    // stretch of surface faces the key light - squared, so a section that
                    // turns away drops to almost nothing - and by what is actually behind
                    // the glass. A dark wallpaper no longer blows the rim into a wire, and
                    // no two stretches of the arc keep the same brightness, which is what
                    // stops it reading as one drawn white line.
                    // WHERE THE HIGHLIGHT LIVES ALONG THE ARC.
                    //
                    // rimLight is a single fixed key light, so face2 = rimLight^2 is
                    // largest on the flat middle of the arc (outer normal points
                    // straight at L1) and collapses toward both ends. The rim therefore
                    // bloomed into one bright stretch at a fixed x range - a bar - no
                    // matter how the finger moved. Measured on the recording: the
                    // highlight peaked at x 395..830 and died at the corners.
                    //
                    // bendK makes local curvature the primary modulator (0.58 on the
                    // flat, 1.00 on a corner) and the light direction only trims the
                    // result (floor raised 0.15 -> 0.45, peak unchanged). The kFace term
                    // nearly doubles. Net effect: the flat middle drops to about half
                    // its old strength while the curved ends come up, so the highlight
                    // is spread ALONG the arc and tracks the geometry instead of one
                    // fixed spot - non-uniform, but non-uniform for a reason.
                    + "    float face2 = rimLight * rimLight;\n"
                    + "    float bendK = 0.58 + 0.42 * kFace;\n"
                    + "    float hl = (rimO + rimI) * bendK * (0.45 + 0.55 * face2)\n"
                    + "             + (bevelO + bevelI) * 0.20 * (0.35 + 0.65 * face2)\n"
                    + "             + 0.24 * kFace * (rimO + bevelO * 0.45);\n"
                    + "\n"
                    // specular. The light direction drifts along the arc, so the lobe is
                    // spread across the stroke instead of landing on one spot, and the
                    // higher exponent keeps what is left a thin sheen rather than a band.
                    + "    float3 N = normalize(float3(n * (0.60 + 0.40 * edge),\n"
                    + "                               0.50 + 0.50 * th));\n"
                    + "    float3 Lh = normalize(float3(-0.30 + 0.34 * sin(gx * 1.7 + ph * 0.5),\n"
                    + "                                -0.45, 1.84));\n"
                    + "    float spec = pow(max(dot(N, Lh), 0.0), 7.0);\n"
                    + "    hl = hl + 0.20 * spec * (0.30 + 0.70 * rimLight);\n"
                    + "\n"
                    // Every highlight term above is scaled by what is actually behind the
                    // glass, and it is applied only once, after all of them have been
                    // summed. A dark wallpaper now yields a soft low reflection and a
                    // bright busy one yields a proportionate highlight, so the strip can
                    // never show the same brightness on two different backdrops - that
                    // invariance is precisely what made it look painted on.
                    // The gate floor used to be 0.35, which put a third of the rim
                    // on screen whatever was behind it - that floor is what keeps a
                    // white line white on a dark wallpaper. 0.20 shifts the weight
                    // onto bgLum, so a dark backdrop now yields about 0.32 instead
                    // of 0.45 and a bright one is unchanged (0.20 + 0.80 still
                    // reaches 1.00): the rim follows the backdrop's own light.
                    + "    hl = hl * (0.08 + 0.92 * bgLum);\n"
                    + "\n"
                    // Highlight colour is mostly the scene reflecting back, only partly a
                    // near-white sheen. A flat white add is exactly what made the edge
                    // look like a separate painted line on top of the glass.
                    //
                    // The highlight is also blended as a SCREEN, never added flat: added
                    // flat it pushes a bright stretch of backdrop straight past 1.0 and it
                    // clips into a solid white band; a screen rolls off into whatever is
                    // already there, so the brightest the glass ever gets is the backdrop.
                    //
                    // Same quadratic gate as env: a 0.10 white floor was being added
                    // everywhere, which on a dark wallpaper is the whole reason the rim
                    // read as a separate white object sitting on top of the scene. With
                    // bgLum squared the white is 0.039 at bgLum 0.15 (was 0.151) and the
                    // scene copy carries the line instead - the highlight now takes the
                    // colour of what is behind it, so it survives on bright backdrops
                    // and dissolves into dark ones the way a reflection actually does.
                    + "    float3 hlTint = wide * 0.74\n"
                    + "                  + float3(1.0, 0.99, 0.97) * (0.015 + 0.20 * bgLum * bgLum);\n"
                    + "    float3 add = min(highlight * hl * hlTint, 1.0);\n"
                    + "    col = col + (float3(1.0, 1.0, 1.0) - col) * add;\n"
                    + "\n"
                    + "    float3 outc = min(max(col, 0.0), 1.0);\n"
                    // The scrim, applied last and to the whole pixel - transmission and
                    // reflection alike - so the dimmed half keeps the exact same relative
                    // contrast as the natural half. Scaling only the samples would leave
                    // the additive floors behind and turn the band's edge into a seam.
                    + "    outc = outc * dimF;\n"
                    // Dissolve into whatever is behind the strip over the outer 26% so the
                    // drawn path edge never reads as a cut and the rim brightness runs
                    // into the backdrop instead of stopping on a line. aEdge itself is
                    // declared at the top of main() because it also gates the refraction
                    // sampling offsets - see dFade there.
                    // AGSL output must be premultiplied (RGB <= A) - hence outc * aEdge.
                    + "    return half4(outc * aEdge, aEdge);\n"
                    + "}\n";

    // ---------------------------------------------------------------- AGSL（二级：兜底）
    //
    // 完整版万一编不过，这一版用最保守的写法保证「至少有玻璃」：
    // 没有函数复用、没有三元、没有 mix/clamp 向量重载、没有色散/流光，
    // 只保留：透镜折射 + 4 抽头模糊 + 侧壁压暗 + 外缘亮线 + 漫反射。
    // 用到的 15 个 uniform 与完整版一致，setFloatUniform 才不会踩空。

    private static final String AGSL_BASIC =
            "uniform shader wallpaper;\n"
                    + "uniform float2 viewSize;\n"
                    + "uniform float  topY;\n"
                    + "uniform float  bottomY;\n"
                    + "uniform float  botR;\n"
                    + "uniform float  halfW;\n"
                    + "uniform float  diffuse;\n"
                    + "uniform float  blurPx;\n"
                    + "uniform float  refractK;\n"
                    + "uniform float  edgeRef;\n"
                    + "uniform float  refractW;\n"
                    + "uniform float  fresnelK;\n"
                    + "uniform float  highlight;\n"
                    + "uniform float  hlWidth;\n"
                    + "uniform float  phase;\n"
                    + "uniform float  dimS;\n"
                    + "uniform float  dimMode;\n"
                    + "\n"
                    + "float sdShell(float2 p) {\n"
                    + "    float2 c = float2(viewSize.x * 0.5, (topY + bottomY) * 0.5);\n"
                    + "    float2 b = float2(viewSize.x * 0.5, (bottomY - topY) * 0.5);\n"
                    + "    float  r = max(botR, 1.0);\n"
                    + "    float2 q = abs(p - c) - b + r;\n"
                    + "    return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;\n"
                    + "}\n"
                    + "\n"
                    + "half4 main(float2 p) {\n"
                    // Same band anchor as the full version: strokeCenter puts the band on
                    // the upper ring [R-2*halfW, R] for BOTH dim directions, so d runs
                    // -2h..0 and u is re-centred with sh = +1. dimMode never moves the
                    // geometry, it only picks which half is painted (see dimF below).
                    + "    float d = sdShell(p);\n"
                    + "    float sh = min(max(dimS * 100.0, 0.0), 1.0);\n"
                    + "    float u = clamp(d / max(halfW, 0.5) + sh, -1.0, 1.0);\n"
                    + "    float edge = abs(u);\n"
                    + "    float aEdge = 1.0 - smoothstep(0.84, 1.0, edge);\n"
                    // Same split as the full version: the upper face (u<0) dissolves over
                    // the whole upper half instead of the tight 0.84 knee, so the top of
                    // the band has no visible edge. The arc side keeps its tight knee.
                    // Placed before endFade/dFade so the displacement tapers with alpha.
                    + "    aEdge = min(aEdge, smoothstep(-1.0, 0.0, u));\n"
                    // Same cap taper as the full version: strokeCenter's centreline is an
                    // open path, so getFillPath butts it off with a horizontal cut at
                    // y = bottomY - botR at both screen edges. endFade is 0 on that cut,
                    // so the band eases to nothing there instead of showing a step.
                    + "    float hw2 = max(halfW, 0.5);\n"
                    + "    float capY = bottomY - min(max(botR, 1.0), viewSize.x * 0.5);\n"
                    + "    float capL = sh * halfW;\n"
                    + "    float2 dl = float2(max(abs(p.x - capL) - hw2, 0.0),\n"
                    + "                        max(p.y - capY, 0.0));\n"
                    + "    float2 dr = float2(max(abs(p.x - (viewSize.x - capL)) - hw2, 0.0),\n"
                    + "                        max(p.y - capY, 0.0));\n"
                    + "    float endFade = smoothstep(0.0, hw2 * 2.0,\n"
                    + "                              min(length(dl), length(dr)));\n"
                    + "    aEdge = aEdge * endFade;\n"
                    + "    float dFade = aEdge * aEdge;\n"
                    // Hard step at the shell edge, same as the full version. The band lives
                    // entirely on the dim side of the shell, so this is simply LiftArcRimView's
                    // own value across the band: dimF = 1.0 for dim-below (the band is in
                    // the bright half) and dimF = 1 - dimS*riseS for dim-above (the band IS
                    // the bottom edge of the dimmed half). Never a ramp - a ramp anchored
                    // here would darken the middle of the band for no reason.
                    + "    float dimO = min(max(d * 1000.0, 0.0), 1.0);\n"
                    + "    float dimI = 1.0 - dimO;\n"
                    + "    float mask = dimO * (1.0 - dimMode) + dimI * dimMode;\n"
                    + "    float rise = (viewSize.y - bottomY) / max(viewSize.y, 1.0);\n"
                    + "    float riseS = rise * rise * (3.0 - 2.0 * rise);\n"
                    + "    float dimA = dimS * mask * ((1.0 - dimMode) + dimMode * riseS);\n"
                    + "    float dimF = 1.0 - dimA;\n"
                    + "    float2 g = float2(\n"
                    + "        sdShell(p + float2(1.0, 0.0)) - sdShell(p - float2(1.0, 0.0)),\n"
                    + "        sdShell(p + float2(0.0, 1.0)) - sdShell(p - float2(0.0, 1.0)));\n"
                    + "    float gl = length(g);\n"
                    + "    float2 n = float2(0.0, 1.0);\n"
                    + "    if (gl > 0.0001) {\n"
                    + "        n = g / gl;\n"
                    + "    }\n"
                    + "    float side = 0.0 - sign(u);\n"
                    + "    float ph = phase * 6.2831853;\n"
                    + "    float gx = p.x / max(viewSize.x, 1.0) * 2.0 - 1.0;\n"
                    + "    float ring = smoothstep(max(1.0 - refractW, 0.30), 1.0, edge);\n"
                    // Same slope-bounded profile as the full version: the old edge^2 lens
                    // reached a sampling Jacobian of -5.3 at the rim, which folded the
                    // backdrop over itself and showed up as repeated / ghosted texture.
                    + "    float e2 = edge * edge;\n"
                    + "    float gp = e2 - e2 * edge * 0.3333333;\n"
                    + "    float lens = side * (halfW * refractK * 0.82)\n"
                    + "               * (gp + edgeRef * 0.12 * e2 * edge);\n"
                    + "    float sway = refractK * halfW * 0.12 * edge * sin(p.x * 0.010 + ph);\n"
                    + "    float2 uv = p + n * ((lens + sway) * dFade);\n"
                    + "    float rr = max(blurPx * 0.25, 1.0);\n"
                    + "    float3 c0 = float3(wallpaper.eval(uv).rgb);\n"
                    + "    float3 c1 = float3(wallpaper.eval(uv + float2(rr, 0.0)).rgb);\n"
                    + "    float3 c2 = float3(wallpaper.eval(uv + float2(0.0, rr)).rgb);\n"
                    + "    float3 c3 = float3(wallpaper.eval(uv + float2(0.0, -rr)).rgb);\n"
                    + "    float3 base = (c0 + c1 + c2 + c3) * 0.25;\n"
                    + "    float bL = base.x * 0.2126 + base.y * 0.7152 + base.z * 0.0722;\n"
                    + "    float wall = smoothstep(0.28, 0.68, edge)\n"
                    + "               * (1.0 - smoothstep(0.68, 0.88, edge));\n"
                    + "    float hw = hlWidth * (0.70 + 0.50 * (0.5 + 0.5\n"
                    + "                * sin(gx * 2.6 + ph * 0.6)));\n"
                    + "    float rim = smoothstep(0.88 - 0.18 * hw,\n"
                    + "                           0.995, edge);\n"
                    + "    float fres = edge * edge * (0.80 + 0.40 * ring);\n"
                    + "    float3 env = base * 1.00\n"
                    + "               + float3(1.0, 1.0, 1.0) * (0.008 + 0.12 * bL * bL);\n"
                    + "    float3 outc = base * (1.0 + diffuse * 0.5) * (1.0 - 0.12 * wall);\n"
                    + "    outc = outc + (env - outc) * (fres * fresnelK);\n"
                    // Same edge convergence as the full version: measure this pixel's
                    // own backdrop and let the material meet it at the face, otherwise
                    // the fallback keeps the brightness step and the texture shear.
                    + "    float3 rawB = float3(wallpaper.eval(p).rgb);\n"
                    + "    float toBg = smoothstep(0.66, 0.98, edge);\n"
                    + "    outc = outc + (rawB - outc) * toBg;\n"
                    + "    float3 hlt = base * 0.74\n"
                    + "               + float3(1.0, 0.99, 0.97) * (0.015 + 0.20 * bL * bL);\n"
                    + "    float rimG = rim * (0.08 + 0.92 * bL);\n"
                    + "    float3 add = min(highlight * rimG * hlt, 1.0);\n"
                    + "    outc = outc + (float3(1.0, 1.0, 1.0) - outc) * add;\n"
                    + "    outc = min(max(outc, 0.0), 1.0);\n"
                    + "    outc = outc * dimF;\n"
                    + "    return half4(outc * aEdge, aEdge);\n"
                    + "}\n";

    private final Paint glassPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    /** 只用来把描边 Path 转成填充轮廓，参数必须与 LiftArcRimView.rimPaint 一致。 */
    private final Paint strokeSrc = new Paint(Paint.ANTI_ALIAS_FLAG);
    /** 玻璃的实际渲染区域 = 现有高光描边的真实轮廓。 */
    private final Path band = new Path();
    /** 描边中心线（描边模式 = LiftArcGeometry.bottomPath，压暗模式沿法线挪开半条带宽），每帧重建。 */
    private final Path arcPath = new Path();

    private RuntimeShader shader;
    /** AGSL 编不过时置真：不画玻璃，保留原描边。 */
    private boolean shaderBroken;

    private Bitmap wallpaper;
    private int wallpaperId = Integer.MIN_VALUE;
    private boolean loading;
    private long lastAttempt = -RETRY_MS;
    private long lastIdCheck;

    private LiftArcGeometry.Shape shell;
    private boolean enabled;

    /** 描边宽度（dp），与 LiftArcRimView 同源。 */
    private float strokeWidthDp = 3f;
    /** 玻璃带厚度（dp）：1..40，缺省 20，与描边宽度完全无关。 */
    private float thicknessDp = 20f;
    /** 描边不透明度 0..1，与 LiftArcRimView 同源。 */
    private float arcAlpha = 1f;
    /** true = iOS 式压暗，与 LiftArcRimView 同源。 */
    private boolean dim = true;
    /**
     * 压暗强度 0..1，与 {@link LiftArcRimView} 同源。描边模式（{@link #dim} = false）时
     * 下发 0 —— 那时屏幕上根本没有压暗层，玻璃也不许自己变暗。
     */
    private float dimStrength = 0.57f;
    /** 压哪一半：false = 压弧线以下露出的壁纸（默认），true = 压弧线以上的锁屏内容。 */
    private boolean dimUpper;

    // -------------------------------------------------------------- 玻璃参数
    //
    // 「玻璃参数」页的九项实时取值。**默认值就是上面那组 K_* 常量**，而同一组常量
    // 也是 LiftArcConfig 读远端配置时的缺省 —— 所以默认值只有一个真值来源，改常量
    // 两边一起变，不会出现界面显示 0.13、实际下发 0.16 这种对不上。
    //
    // 初值给 K_* 而不是 0：远端配置还没就绪时（LSPosed 未连上）glass 就已经能画，
    // 这时如果 uniform 全是 0，玻璃会变成一张全黑贴纸。
    /** 漫反射 diffuseStrength 0..1，默认 {@link #K_DIFFUSE}。 */
    private float pDiffuse = K_DIFFUSE;
    /** 背景模糊基准 blurRadius（物理像素），默认 {@link #K_BLUR_PX}。 */
    private float pBlurPx = K_BLUR_PX;
    /** 折射强度 refractionStrength 0..0.90，默认 {@link #K_REFRACT}；上限由斜率预算定死。 */
    private float pRefract = K_REFRACT;
    /** 边缘折射 edgeRefraction 0..0.50，默认 {@link #K_EDGE_REFRACT}。 */
    private float pEdgeRef = K_EDGE_REFRACT;
    /** 折射范围 refractionWidth 0..1，默认 {@link #K_REFRACT_W}。 */
    private float pRefractW = K_REFRACT_W;
    /** 菲涅尔 fresnelStrength 0..1，默认 {@link #K_FRESNEL}。 */
    private float pFresnel = K_FRESNEL;
    /** 边缘高光 highlightIntensity 0..1，默认 {@link #K_HIGHLIGHT}。 */
    private float pHighlight = K_HIGHLIGHT;
    /** 高光宽度 highlightWidth 0.30..1.50，默认 {@link #K_HL_WIDTH}。 */
    private float pHlWidth = K_HL_WIDTH;
    /** 玻璃整体不透明度 opacity 0.20..1，默认 {@link #K_OPACITY}。 */
    private float pOpacity = K_OPACITY;

    LiftArcGlassStrip(Context context) {
        super(context);
        glassPaint.setStyle(Paint.Style.FILL);
        glassPaint.setAlpha(Math.round(pOpacity * 255f));
        strokeSrc.setStyle(Paint.Style.STROKE);
        strokeSrc.setStrokeCap(Paint.Cap.BUTT);
        strokeSrc.setStrokeJoin(Paint.Join.MITER);
        strokeSrc.setStrokeMiter(4f);
        setWillNotDraw(false);
        // 不吃任何触摸：上滑手势由 LiftArcHandleView 和 hook 负责，这里绝不能拦
        setClickable(false);
        setFocusable(false);
        buildShader();
    }

    // ------------------------------------------------------------------ 对外

    /**
     * 开关（设置项「液态玻璃实时渲染弧形描边」）。
     * 不能叫 setEnabled —— 那是 View 的 public 方法。
     */
    void setGlassEnabled(boolean on) {
        if (enabled == on) {
            return;
        }
        enabled = on;
        if (on) {
            ensureWallpaper(true);
        }
        rebuild();
        invalidate();
    }

    /**
     * 描边参数（必须与 {@link LiftArcRimView#configure} 传入的五项同源）：
     * 玻璃要画在哪、画多宽、描边模式下要不要画，全看这三项；后两项是压暗几何 ——
     * {@code dim}/{@code dimStrength} 决定中心线挪不挪（{@link #shifted()}，与
     * {@code LiftArcRimView} 是否画纱同一阈值）和 dimF 的深浅，{@code dimUpper} 决定
     * 黑纱压在哪一半（→ AGSL 的 {@code dimMode}）。两者只要有一个与黑纱对不上，
     * 玻璃就和脚下的壁纸不同亮，于是像贴纸压在压暗背景上（1.0.22 反馈的「割裂」）。
     */
    void setRim(float strokeWidthDp, float arcAlpha, boolean dim,
                float dimStrength, boolean dimUpper) {
        if (this.strokeWidthDp == strokeWidthDp
                && this.arcAlpha == arcAlpha
                && this.dim == dim
                && this.dimStrength == dimStrength
                && this.dimUpper == dimUpper) {
            return;
        }
        this.strokeWidthDp = strokeWidthDp;
        this.arcAlpha = arcAlpha;
        this.dim = dim;
        this.dimStrength = dimStrength;
        this.dimUpper = dimUpper;
        rebuild();
        invalidate();
    }

    /**
     * 玻璃带厚度（与「描边宽度」**完全解耦**，没有「跟随描边」档）：
     * 取值 1..40dp，缺省 20dp，入参越界一律钳进这个区间。
     *
     * <p>只改<b>玻璃自己的带宽</b> —— 白描边仍由 {@link LiftArcRimView#configure} 按
     * 「描边宽度」画，两者互不影响，玻璃可比白线宽也可比白线窄。中心线默认始终是
     * {@link LiftArcGeometry#bottomPath} 那一条（开压暗时沿法线<b>朝弧线上方</b>挪开半条带宽，
     * 见 {@link #strokeCenter}），不产生第二条手绘曲线。
     *
     * <p>40dp 这个上限来自几何：开压暗时中心线半径 = botR - halfW，带内圈半径 =
     * botR - glassPx，botR 约 300px，再粗内圈就归零、圆角自交。
     */
    void setGlassThickness(float thicknessDp) {
        float v = thicknessDp < 1f ? 1f : Math.min(thicknessDp, 40f);
        if (this.thicknessDp == v) {
            return;
        }
        this.thicknessDp = v;
        rebuild();
        invalidate();
    }

    /**
     * 「玻璃参数」页的九项（玻璃厚度不在这里，它走 {@link #setGlassThickness}）。
     *
     * <p>参数顺序 = diffuse / blurPx / refract / edgeRef / refractW / fresnel /
     * highlight / hlWidth / opacity，与 {@link LiftArcConfig} 的字段声明顺序一致 ——
     * 两处只要有一处调换顺序就会把折射下发成高光，所以两边都写死这个顺序。
     *
     * <p>九项全等才直接返回：配置回调会在**每一次**任意设置项变更时被叫醒，
     * 没有这层比较，拖一个跟玻璃无关的滑条也会重跑一遍路径与 uniform。
     */
    void setGlassTuning(float diffuse, float blurPx, float refract, float edgeRef,
                        float refractW, float fresnel, float highlight,
                        float hlWidth, float opacity) {
        if (pDiffuse == diffuse && pBlurPx == blurPx && pRefract == refract
                && pEdgeRef == edgeRef && pRefractW == refractW
                && pFresnel == fresnel && pHighlight == highlight
                && pHlWidth == hlWidth && pOpacity == opacity) {
            return;
        }
        pDiffuse = diffuse;
        pBlurPx = blurPx;
        pRefract = refract;
        pEdgeRef = edgeRef;
        pRefractW = refractW;
        pFresnel = fresnel;
        pHighlight = highlight;
        pHlWidth = hlWidth;
        pOpacity = opacity;
        rebuild();
        invalidate();
    }

    /**
     * 更新外壳；返回形状是否变化。几何完全来自上滑动画，本方法不生成任何自己的曲线。
     */
    boolean update(LiftArcGeometry.Shape shape) {
        boolean changed = !same(shell, shape);
        if (changed) {
            shell = shape;
            if (enabled) {
                rebuild();
                invalidate();
            }
        }
        if (enabled) {
            pollWallpaper();
        }
        return changed;
    }

    /** 手势结束 / 联动关闭：收掉外壳。 */
    void clear() {
        if (shell == null) {
            return;
        }
        shell = null;
        band.reset();
        invalidate();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (enabled) {
            ensureWallpaper(false);
        }
    }

    // ------------------------------------------------------------------ 背景纹理

    /** 保证有一张真实锁屏壁纸；force = true 时忽略重试间隔。 */
    private void ensureWallpaper(boolean force) {
        if (wallpaper != null || loading || !enabled) {
            return;
        }
        long now = SystemClock.elapsedRealtime();
        if (!force && now - lastAttempt < RETRY_MS) {
            return;
        }
        lastAttempt = now;
        loading = true;
        new Thread(this::loadWallpaper, "LockBar-wallpaper").start();
    }

    /** 换壁纸后多久能发现（每次手势 update 里节流查一次 id）。 */
    private void pollWallpaper() {
        long now=SystemClock.elapsedRealtime();if(now-lastIdCheck<RECHECK_MS)return;
        lastIdCheck=now;
        new Thread(() -> {
            try {
                int id=WallpaperManager.getInstance(getContext()).getWallpaperId(WallpaperManager.FLAG_LOCK);
                post(() -> {
                    if(!isAttachedToWindow())return;
                    if(wallpaperId!=Integer.MIN_VALUE&&id!=wallpaperId) {
                        wallpaperId=id;releaseWallpaper();LiftArcRuntime.wallpaper(false,shader!=null&&!shaderBroken);LiftArcController.onWallpaperReady();
                        ensureWallpaperForBlur();
                    } else if(wallpaperId==Integer.MIN_VALUE)wallpaperId=id;
                });
            } catch(Throwable ignored) { }
        },"Duo-LiftArc-wallpaper-id").start();
    }

    /**
     * 给上滑模糊的壁纸盖层供图：不看玻璃开关（玻璃关着也得有壁纸糊），先节流轮询一次
     * 壁纸 id（玻璃关着换壁纸也跟得上），再按同一条 20s 重试窗补加载 —— 超级/视频壁纸
     * 解码失败时不逐帧补线程。位图已就绪 / 正在加载时整段空转。
     */
    void ensureWallpaperForBlur() {
        pollWallpaper();
        if (wallpaper != null || loading) {
            return;
        }
        if (enabled) {
            ensureWallpaper(false);
            return;
        }
        long now = SystemClock.elapsedRealtime();
        if (now - lastAttempt < RETRY_MS) {
            return;
        }
        lastAttempt = now;
        loading = true;
        new Thread(this::loadWallpaper, "LockBar-wallpaper").start();
    }

    /** 上滑模糊盖层取位图：与玻璃纹理同一份解码、同一份引用（release 只丢引用不回收）。 */
    Bitmap wallpaperBitmap() {
        return wallpaper;
    }

    private void releaseWallpaper() {
        wallpaper = null;
        // 故意不 recycle：位图可能还被 RuntimeShader 的输入引用着，回收会直接崩渲染线程。
        // 只丢引用交给 GC；onDraw 看 wallpaper == null 就不会去采。
    }

    /** 后台线程：把当前锁屏壁纸读成一张降采样位图，再回主线程挂成 BitmapShader。 */
    private void loadWallpaper() {
        Bitmap bmp = null;
        int id = Integer.MIN_VALUE;
        try {
            WallpaperManager wm = WallpaperManager.getInstance(getContext());
            if(wm.getWallpaperInfo(WallpaperManager.FLAG_LOCK)!=null) {
                post(() -> onWallpaperReady(null,Integer.MIN_VALUE));
                return;
            }
            try {
                id = wm.getWallpaperId(WallpaperManager.FLAG_LOCK);
            } catch (Throwable ignored) {
                id = Integer.MIN_VALUE;
            }

            int flag = -1;
            int sample = 1;
            // 第一遍：只解尺寸，算降采样倍数（两次 getWallpaperFile，避免同一个 fd 读两遍）
            ParcelFileReader bounds = openWallpaper(wm, WallpaperManager.FLAG_LOCK);
            if (bounds == null && wm.getWallpaperInfo() == null) {
                bounds = openWallpaper(wm, WallpaperManager.FLAG_SYSTEM);
            }
            if (bounds != null) {
                flag = bounds.flag;
                try {
                    BitmapFactory.Options o = new BitmapFactory.Options();
                    o.inJustDecodeBounds = true;
                    bounds.decode(o);
                    int maxDim = Math.max(o.outWidth, o.outHeight);
                    while (maxDim > 0 && maxDim / sample > TEX_MAX_DIM) {
                        sample *= 2;
                    }
                } catch (Throwable ignored) {
                    // 尺寸拿不到就按原图解（sample 保持 1）
                } finally {
                    bounds.close();
                }
            }

            if (flag >= 0) {
                ParcelFileReader full = openWallpaper(wm, flag);
                if (full != null) {
                    try {
                        BitmapFactory.Options o = new BitmapFactory.Options();
                        o.inSampleSize = sample;
                        o.inPreferredConfig = Bitmap.Config.ARGB_8888;
                        bmp = full.decode(o);
                    } catch (Throwable ignored) {
                        bmp = null;
                    } finally {
                        full.close();
                    }
                }
            }
        } catch (Throwable ignored) {
            bmp = null;
        }
        final Bitmap result = bmp;
        final int gotId = id;
        post(() -> onWallpaperReady(result, gotId));
    }

    private void onWallpaperReady(Bitmap bmp, int id) {
        loading = false;
        if(!isAttachedToWindow())return;
        releaseWallpaper();
        LiftArcRuntime.wallpaper(bmp != null,shader != null && !shaderBroken);
        if (bmp == null) {
            LiftArcLog.d("glass: 读不到静态锁屏壁纸（超级/视频壁纸），"
                    + "窗内无其它可用背景源，本轮不叠加玻璃（保留原描边）");
            return;
        }
        wallpaper = bmp;
        wallpaperId = id;
        // 纹理是 Shader 的**输入**，glassPaint 上挂的始终是 RuntimeShader，不能被覆盖
        if (shader != null) {
            shader.setInputShader("wallpaper", makeTileShader(bmp));
        }
        LiftArcLog.d("glass: 壁纸纹理就绪 " + bmp.getWidth() + "x" + bmp.getHeight());
        invalidate();
        LiftArcController.onWallpaperReady();
    }

    /** 中心裁切铺满窗口 —— 与系统壁纸窗口同一套 center-crop，保证与真实背景对齐。 */
    private Shader makeTileShader(Bitmap bmp) {
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            w = bmp.getWidth();
            h = bmp.getHeight();
        }
        float scale = Math.max(w / (float) bmp.getWidth(), h / (float) bmp.getHeight());
        Matrix m = new Matrix();
        m.setScale(scale, scale);
        m.postTranslate((w - bmp.getWidth() * scale) * 0.5f,
                (h - bmp.getHeight() * scale) * 0.5f);
        Shader s = new android.graphics.BitmapShader(bmp,
                Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        s.setLocalMatrix(m);
        return s;
    }

    /** 打开壁纸文件；{@code bounds} 模式靠 {@link BitmapFactory.Options#inJustDecodeBounds}。 */
    private ParcelFileReader openWallpaper(WallpaperManager wm, int flag) {
        try {
            android.os.ParcelFileDescriptor pfd = wm.getWallpaperFile(flag);
            if (pfd == null) {
                return null;
            }
            return new ParcelFileReader(pfd, flag);
        } catch (Throwable t) {
            return null;
        }
    }

    private final class ParcelFileReader {
        private final android.os.ParcelFileDescriptor pfd;
        final int flag;

        ParcelFileReader(android.os.ParcelFileDescriptor pfd, int flag) {
            this.pfd = pfd;
            this.flag = flag;
        }

        Bitmap decode(BitmapFactory.Options o) throws Exception {
            try (FileInputStream in = new FileInputStream(pfd.getFileDescriptor())) {
                return BitmapFactory.decodeStream(in, null, o);
            }
        }

        void close() {
            try {
                pfd.close();
            } catch (Throwable ignored) {
                // 已经关了 / 关失败都不影响画面
            }
        }
    }

    // ------------------------------------------------------------------ 几何

    /**
     * 玻璃现在该不该画？
     *
     * <p>1.0.22 起<b>压暗模式也画</b>（用户明确要求「iOS 式压暗也加上底部玻璃折射」）。
     * 只有传统描边模式才额外要求 {@code arcAlpha > 0} —— 描边不透明度被调成 0
     * 等于「没有描边」，这时也不该凭空多一条玻璃线。
     *
     * <p>可见度本身是<b>二值开关</b>，不再随上滑进度淡入淡出 —— {@link #rebuild()}
     * 里的 alpha 恒等于「玻璃参数」页那条不透明度，这里不做二次判断。
     */
    private boolean strokeVisible() {
        if (shell == null) {
            return false;
        }
        return dim || arcAlpha > 0.01f;
    }

    /**
     * 该不该把中心线挪开 —— 只看「{@link LiftArcRimView} 到底会不会画那层 scrim」。
     *
     * <p>与 {@code LiftArcRimView.onDraw} 里 {@code dimStrength <= 0.01f} 的早退<b>同一个
     * 阈值、同一个开闭</b>：它不画纱的那 0.01 区间里这里也不挪；它只要画了纱这里就挪。
     * {@link #rebuild} 里 {@code dimS} 的 setter 也走这一个方法，所以
     * 「{@code dimS != 0}」「挪了中心线」「scrim 存在」三件事在任何强度下都同生共死。
     */
    private boolean shifted() {
        return dim && dimStrength > 0.01f;
    }

    /**
     * 玻璃带的<b>中心线</b>。描边模式（dimS=0）下与 {@link LiftArcGeometry#bottomPath} 逐点相同；
     * 开压暗时整条沿法线<b>朝弧线上方</b>挪开半条带宽。
     *
     * <p><b>两种压暗方向几何完全一样</b>：玻璃永远坐在<b>弧线上方的那条 84px 环带</b>里
     * （半径 {@code [R-2h, R]}，外侧脸正好压在弧线上）—— 压下面时它在亮的那半边，
     * 压上面时它在被压暗那一半的<b>底边</b>（需求原文：「放到压暗的底部」）。
     * {@code dimUpper} 因此<b>不进几何</b>，它只通过 AGSL 的 {@code dimMode} 决定这块玻璃
     * 的 {@code dimF} 是 1 还是 {@code 1 - dimS*riseS}，也就是背景压不压。
     * 带子两侧的背景在两种模式下都与带内一致，端帽上下也同侧，所以不会因为换方向而多出断层。
     *
     * <p><b>为什么是法线偏移而不是整体平移</b>：弧线两端是竖着贴屏幕边缘的（切线竖直、
     * 法线水平），上下平移在那里等于是沿弧线方向滑动，带子会继续骑在分界线上、挪了个寂寞。
     * 这里用同心圆弧解析构造 —— 圆角半径取 {@code bottomRadius - halfW}，直段跟着圆角走，
     * 端点落在 {@code (halfW, bottom-radius)} / {@code (w - halfW, bottom-radius)}，
     * 与 shader 里 {@code capL = sh * halfW}、{@code capY = bottomY - botR} 逐一对应：
     * <pre>
     *   开压暗 rIn = R - halfW：中心线在弧线上方 halfW，带子下半张脸正好落在弧线上
     *   不开   rIn = R       ：与 LiftArcGeometry.bottomPath 完全一致
     * </pre>
     *
     * <p><b>与 shader 侧必须同向</b>：AGSL 里 {@code sh = min(max(dimS*100,0),1)}，
     * 带子偏移后 {@code d} 从 {@code -2h} 走到 {@code 0}、中心在 {@code -h}，
     * {@code sh = 1} 把 {@code u} 重新以带中心为 0 —— 两边由同一个布尔驱动，
     * 不会出现带子挪了、{@code u} 没挪（或反过来）的错位。
     */
    private void strokeCenter(Path p, int w, float halfW) {
        p.reset();
        if (shell == null || w <= 0f) {
            return;
        }
        float bottom = shell.visibleHeight;
        float r = Math.max(shell.bottomRadius, 0f);
        if (r <= 0f || bottom <= 0f) {
            return;
        }
        // LiftArcGeometry.bottomPath 同一个钳制
        float rr = Math.min(r, w / 2f);
        float hw = Math.max(halfW, 1f);
        float rIn = rr;
        if (shifted()) {
            // 恒定朝弧线上方（壳内）—— 与 dimUpper 无关，压下面、压上面都一样
            rIn = rr - hw;
        }
        if (rIn < 1f) {
            rIn = 1f;
        }
        float cy = bottom - rr;          // 圆角圆心 y（与 bottomPath 用的是同一个圆心）
        float lineY = cy + rIn;          // 直段 y = 圆心 + 新半径
        p.moveTo(rr - rIn, cy);
        p.arcTo(new RectF(rr - rIn, cy - rIn, rr + rIn, cy + rIn), 180f, -90f);
        p.lineTo(w - rr, lineY);
        p.arcTo(new RectF(w - rr - rIn, cy - rIn, w - rr + rIn, cy + rIn), 90f, -90f);
    }

    /**
     * 重建渲染区域：{@code band} = 玻璃带的真实轮廓。
     *
     * <p>中心线由 {@link #strokeCenter} 生成 —— 描边模式下就是 {@link LiftArcGeometry#bottomPath}
     * 那一条（与 LiftArcRimView 同方法、同 Shape、同 cap/join），玻璃和弧线完全重合；
     * 开压暗时整条沿法线<b>朝弧线上方</b>挪开半条带宽，两种压暗方向几何相同。
     * 宽度与 cap/join 照抄，不是手绘的第二条曲线。
     */
    private void rebuild() {
        band.reset();
        int w = getWidth();
        int h = getHeight();
        if (!enabled || shell == null || w <= 0 || h <= 0 || shell.visibleHeight <= 0f) {
            return;
        }
        if (!strokeVisible()) {
            return;
        }
        float density = getResources().getDisplayMetrics().density;
        // 玻璃带宽与描边宽度**完全解耦**，没有「跟随描边」档：1..40dp，缺省 20dp。
        // getFillPath 走 STROKE → 得到的 band 是以中心线为轴的对称带，宽度即玻璃厚度。
        float glassPx = Math.max(thicknessDp * density, 2f);
        float halfW = glassPx * 0.5f;

        strokeCenter(arcPath, w, halfW);
        if (arcPath.isEmpty()) {
            return;
        }
        strokeSrc.setStrokeWidth(glassPx);
        strokeSrc.getFillPath(arcPath, band);

        // 玻璃强度**恒定满值** —— 不再乘上滑进度。1.0.22 需求原文：
        // 「把这个玻璃效果一直设到最高，不要跟随上滑程度再慢慢添加玻璃效果」。
        // 以前这里乘 clamp01(shell.rimAlpha)，g=0 时整条带子 alpha 为 0，
        // 手指一动才从无到有淡进来，于是「玻璃是后来贴上去的」。
        // 位置仍由几何随手势移动、液态扰动仍由 phase 跟随手势 —— 变的只有
        // 「出现多少」这一项：现在从头到尾都是满的。
        // 描边模式下也不再乘 arcAlpha：玻璃与白描边在厚度上早就解耦了，
        // 不透明度同样解耦，arcAlpha 只管 LiftArcRimView 那条白线。
        glassPaint.setAlpha(Math.max(0, Math.min(255, Math.round(pOpacity * 255f))));

        if (shader != null) {
            shader.setFloatUniform("viewSize", (float) w, (float) h);
            shader.setFloatUniform("topY", shell.top);
            shader.setFloatUniform("bottomY", shell.visibleHeight);
            shader.setFloatUniform("botR", shell.bottomRadius);
            shader.setFloatUniform("halfW", halfW);
            shader.setFloatUniform("diffuse", pDiffuse);
            // 模糊半径跟着玻璃带宽走，但**刻意压小并封顶**。
            // 模糊和折射是两件事：模糊核一大，折射位移就会被采样平均掉，
            // 玻璃于是只剩磨砂、看不出背景在动。30px 带 = 10px 模糊，
            // 60px 带只到 13px、24dp 带封顶 20px —— 有厚度的通透感，但细节还在。
            float blurPx = Math.min(pBlurPx * 2f,
                    Math.max(pBlurPx, pBlurPx * glassPx / 45f));
            shader.setFloatUniform("blurPx", blurPx);
            shader.setFloatUniform("refractK", pRefract);
            shader.setFloatUniform("edgeRef", pEdgeRef);
            shader.setFloatUniform("refractW", pRefractW);
            shader.setFloatUniform("fresnelK", pFresnel);
            shader.setFloatUniform("highlight", pHighlight);
            shader.setFloatUniform("hlWidth", pHlWidth);
            // phase = smoothstep(上滑进度)：驱动液态扰动与跑动高光，两端都是 sin(0) 不跳变
            shader.setFloatUniform("phase", shell.rimAlpha);
            // 压暗同步：与 LiftArcRimView.onDraw 完全同源的两个量。
            // dimMode = 黑纱压在哪一半 → 决定带内这块玻璃的 dimF 是 1（压下面，带子在
            // 亮的那半边）还是 1 - dimS*riseS（压上面，带子就是压暗那一半的底边）；
            // dimS = 压多深，且只在真会画 scrim 时才非 0 —— 这样 shader 里的
            // sh = min(max(dimS*100,0),1) 与 strokeCenter 挪不挪中心线由同一个布尔
            // 决定，两边永远同向。LiftArcRimView 在 dimStrength<=0.01 时不画 scrim，
            // 这里也不给值，两侧一致。
            shader.setFloatUniform("dimS",
                    shifted() ? clamp01(dimStrength) : 0f);
            shader.setFloatUniform("dimMode", dimUpper ? 1f : 0f);
        }
    }

    /**
     * 两级编译：完整版 → 兜底基础版 → 放弃。
     *
     * <p><b>任何一级失败都必须把具体异常打进日志</b> —— 1.0.22 首次真机只打了一句
     * 「AGSL 编译失败」没带原因，定位不到，这次不能重蹈覆辙。
     */
    private void buildShader() {
        if (shader != null || shaderBroken) {
            return;
        }
        Throwable fullErr = null;
        try {
            shader = new RuntimeShader(AGSL);
            glassPaint.setShader(shader);
            return;
        } catch (Throwable t) {
            fullErr = t;
            shader = null;
        }
        try {
            shader = new RuntimeShader(AGSL_BASIC);
            glassPaint.setShader(shader);
            LiftArcLog.w("glass: 完整版 AGSL 编译失败，已降级到基础版",fullErr);
        } catch (Throwable t) {
            shaderBroken = true;
            shader = null;
            glassPaint.setShader(null);
            LiftArcLog.e("glass: AGSL 两级编译都失败，本轮不叠加玻璃；fullError="
                    +(fullErr==null?"unknown":fullErr.getClass().getSimpleName()),t);
        }
    }

    private static float clamp01(float v) {
        return v < 0f ? 0f : (v > 1f ? 1f : v);
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (wallpaper != null && shader != null) {
            shader.setInputShader("wallpaper", makeTileShader(wallpaper));
        }
        rebuild();
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

    // ------------------------------------------------------------------ 绘制

    @Override
    protected void onDraw(Canvas canvas) {
        if (!enabled || shell == null || band.isEmpty()) {
            return;
        }
        // 唯一一句绘制：折射 / 模糊 / 漫反射 / 高光 / 厚度全部只落在描边轮廓内。
        // 没有壁纸纹理或 AGSL 挂了就不画 —— 底下 LiftArcRimView 的原描边照常在。
        if (wallpaper != null && shader != null) {
            try { canvas.drawPath(band, glassPaint); }
            catch(Throwable error) {
                shaderBroken=true;shader=null;enabled=false;glassPaint.setShader(null);
                LiftArcRuntime.wallpaper(true,false);LiftArcRuntime.effectError("锁屏玻璃绘制",error);
            }
        }
    }
}
