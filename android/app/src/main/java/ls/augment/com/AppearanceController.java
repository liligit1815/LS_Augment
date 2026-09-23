package ls.augment.com;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/** Background-only effects and responsive navigation around unchanged feature forms. */
final class AppearanceController {
    private static final WeakHashMap<View, String> SECTIONS = new WeakHashMap<>();
    final Activity activity;
    final boolean dark, blur, twoPane;
    final int mask;
    private TextView status;
    GlassScene glassScene;
    private Background backdrop;
    private float backdropEmphasis = 1f;

    float backdropEmphasis() { return backdropEmphasis; }
    void setBackdropEmphasis(float value) {
        backdropEmphasis = Math.max(0f, Math.min(1f, value));
        if (backdrop != null) backdrop.setAlpha(backdropEmphasis);
    }

    AppearanceController(Activity activity) {
        this.activity = activity;
        AppConfig config = new AppConfig(activity);
        boolean systemDark = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        dark = AppearanceOptions.dark(config.getInt(AppearanceOptions.THEME, 0), systemDark);
        blur = config.getBoolean(AppearanceOptions.BLUR);
        twoPane = config.getBoolean(AppearanceOptions.TWO_PANE);
        mask = config.getInt(dark ? AppearanceOptions.DARK_MASK : AppearanceOptions.LIGHT_MASK,
                dark ? 65 : 75);
    }
    static void section(View view, String title) { if (title != null && !title.isEmpty()) SECTIONS.put(view, title); }

    void setContentView(UiKit ui, View content) {
        FrameLayout layers = new FrameLayout(activity);
        layers.setBackgroundColor(ui.backgroundEnd);
        backdrop = new Background(ui);
        backdrop.setTag("about-motion-background");
        backdrop.setAlpha(backdropEmphasis);
        glassScene = new GlassScene(backdrop, blur && Build.VERSION.SDK_INT>=31 ? Math.round(ui.dp(24)/(float)GlassScene.SCALE) : 1);
        layers.addView(backdrop, new FrameLayout.LayoutParams(-1, -1));
        content.setBackground(null);
        layers.addView(content, new FrameLayout.LayoutParams(-1, -1));
        activity.setContentView(layers);
    }
    void addStatus(UiKit ui, LinearLayout body, String title) {
        if (title == null || !title.contains("外观")) return;
        status = ui.text(blur ? (Build.VERSION.SDK_INT < 31
                ? "当前系统不支持背景模糊，已使用普通背景与遮罩。"
                : "模糊仅作用于背景层，文字和按钮保持清晰。")
                : "当前保持普通背景；修改外观后重新进入页面生效。", 12, ui.muted, false);
        body.addView(status, ui.margins(0, 0, 0, 10));
    }
    View detailBody(UiKit ui, ScrollView scroll, LinearLayout body) {
        AdaptiveBody row = new AdaptiveBody(ui, scroll, body);
        return row;
    }

    private final class Background extends View {
        private final UiKit ui;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Rect capturedBounds = new Rect();
        private boolean supported;
        Background(UiKit ui) { super(activity); this.ui = ui; setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO); }
        @Override protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            supported = blur && AppearanceOptions.blurAvailable(Build.VERSION.SDK_INT, isHardwareAccelerated());
            if (supported) {
                float radius = ui.dp(24);
                setRenderEffect(RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP));
            } else if (blur && status != null) {
                status.setText("当前设备无法使用背景模糊，已使用普通背景与遮罩；功能和文字显示不受影响。");
            }
            invalidate();
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            // A previous optional mask must not fade the next background or bitmap capture.
            paint.setAlpha(255);
            if(LiquidGlassLayout.capturingBackdrop() && glassScene!=null && glassScene.cachedBitmap()!=null) {
                capturedBounds.set(0,0,getWidth(),getHeight());
                paint.setFilterBitmap(true);
                canvas.drawBitmap(glassScene.cachedBitmap(),null,capturedBounds,paint);
                return;
            }
            android.graphics.drawable.Drawable base = ui.backgroundDrawable();
            base.setBounds(0, 0, getWidth(), getHeight()); base.draw(canvas);
            {
                float radius = Math.max(getWidth(), getHeight()) * .65f;
                int cloud = dark ? Color.rgb(20, 95, 161) : Color.rgb(177, 216, 252);
                paint.setShader(new RadialGradient(getWidth() * .13f, getHeight() * .24f,
                        radius, cloud, Color.TRANSPARENT, Shader.TileMode.CLAMP));
                canvas.drawRect(0, 0, getWidth(), getHeight(), paint);
                paint.setShader(new RadialGradient(getWidth() * .92f, getHeight() * .75f,
                        radius * .72f, dark ? Color.rgb(42, 77, 140) : Color.rgb(190, 233, 248),
                        Color.TRANSPARENT, Shader.TileMode.CLAMP));
                canvas.drawRect(0, 0, getWidth(), getHeight(), paint); paint.setShader(null);
            }
            // The cards refract these real, continuous contours as they move over the page.
            float w=getWidth(), h=getHeight();
            android.graphics.RectF arc=new android.graphics.RectF(w*.30f,h*.08f,w*1.66f,h*.65f);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(new android.graphics.LinearGradient(arc.left,arc.top,arc.right,arc.bottom,
                    dark?new int[]{0x502a78bc,0x1424bcde,0x80466bbe}:new int[]{0x706fbcf4,0x38f4ffff,0x887ba7e7},
                    new float[]{0,.5f,1},Shader.TileMode.CLAMP));
            canvas.drawOval(arc,paint);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(ui.dp(2));
            paint.setShader(new android.graphics.LinearGradient(arc.left,arc.top,arc.right,arc.bottom,
                    new int[]{dark?0x704b9bc7:0x98ffffff,0x0affffff,dark?0x7072c6f0:0xa884bef4},null,Shader.TileMode.CLAMP));
            canvas.drawOval(arc,paint);
            arc.set(-w*.80f,h*.49f,w*.94f,h*1.04f);
            paint.setStyle(Paint.Style.FILL);
            paint.setShader(new android.graphics.LinearGradient(0,arc.top,w,arc.bottom,
                    dark?new int[]{0x304ea5b5,0x553b6493,0x101b386b}:new int[]{0x56b3eafa,0x58a5caf5,0x10ffffff},null,Shader.TileMode.CLAMP));
            canvas.drawOval(arc,paint);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(ui.dp(2));
            paint.setShader(new android.graphics.LinearGradient(0,arc.top,w,arc.bottom,
                    new int[]{0x08ffffff,dark?0x8057a9cc:0xbbf4ffff,0x04ffffff},null,Shader.TileMode.CLAMP));
            canvas.drawOval(arc,paint);paint.setStyle(Paint.Style.FILL);paint.setShader(null);
            if (!blur) return;
            paint.setColor(dark ? Color.argb(AppearanceOptions.maskAlpha(mask), 12, 24, 41)
                    : Color.argb(AppearanceOptions.maskAlpha(mask), 248, 252, 255));
            canvas.drawRect(0, 0, getWidth(), getHeight(), paint);
        }
    }

    private static String title(View view) {
        String title = SECTIONS.get(view); if (title != null) return title;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                title = title(group.getChildAt(i)); if (title != null) return title;
            }
        }
        return null;
    }
    private final class AdaptiveBody extends LinearLayout {
        final UiKit ui;
        final ScrollView railScroll, content;
        final LinearLayout rail, body;
        final View separator;
        final List<View> targets = new ArrayList<>();
        final List<TextView> labels = new ArrayList<>();
        String signature;
        boolean split;
        AdaptiveBody(UiKit ui, ScrollView content, LinearLayout body) {
            super(activity); this.ui = ui; this.content = content; this.body = body;
            setOrientation(HORIZONTAL);
            railScroll = new ScrollView(activity); railScroll.setFillViewport(true);
            rail = new LinearLayout(activity); rail.setOrientation(VERTICAL);
            rail.setPadding(ui.dp(10), ui.dp(12), ui.dp(10), ui.dp(24));
            rail.setBackgroundColor(ui.rail);
            railScroll.addView(rail, new ScrollView.LayoutParams(-1, -2));
            addView(railScroll, new LinearLayout.LayoutParams(ui.dp(192), -1));
            separator = ui.divider(); addView(separator, new LinearLayout.LayoutParams(ui.dp(1), -1));
            addView(content, new LinearLayout.LayoutParams(0, -1, 1));
            railScroll.setVisibility(GONE); separator.setVisibility(GONE);
            body.getViewTreeObserver().addOnGlobalLayoutListener(this::rebuild);
            content.setOnScrollChangeListener((View view, int x, int y, int oldX, int oldY) -> highlight());
        }
        @Override protected void onSizeChanged(int w, int h, int oldW, int oldH) {
            super.onSizeChanged(w,h,oldW,oldH);
            int widthDp = Math.round(w / getResources().getDisplayMetrics().density);
            boolean next = AppearanceOptions.twoPane(twoPane, widthDp, getResources().getConfiguration().fontScale);
            if (next != split) {
                split = next; railScroll.setVisibility(next ? VISIBLE : GONE);
                separator.setVisibility(next ? VISIBLE : GONE); signature = null; post(this::rebuild);
            }
        }
        private void rebuild() {
            if (!split) return;
            List<View> found = new ArrayList<>(); List<String> names = new ArrayList<>();
            StringBuilder key = new StringBuilder();
            for (int i = 0; i < body.getChildCount(); i++) {
                View child = body.getChildAt(i); if (child.getVisibility() == GONE) continue;
                String name = title(child); if (name == null) continue;
                found.add(child); names.add(name); key.append(System.identityHashCode(child)).append(':').append(name).append('|');
            }
            if (key.toString().equals(signature)) return;
            signature = key.toString(); rail.removeAllViews(); labels.clear(); targets.clear(); targets.addAll(found);
            railScroll.setVisibility(found.isEmpty() ? GONE : VISIBLE);
            separator.setVisibility(found.isEmpty() ? GONE : VISIBLE);
            rail.addView(ui.overline("本页分类"), ui.margins(4, 0, 4, 10));
            for (int i = 0; i < found.size(); i++) {
                final View target = found.get(i);
                TextView button = ui.text(names.get(i), 13, ui.text, false);
                button.setPadding(ui.dp(10), ui.dp(12), ui.dp(10), ui.dp(12));
                button.setMinimumHeight(ui.dp(48)); button.setGravity(Gravity.CENTER_VERTICAL);
                button.setClickable(true); button.setFocusable(true);
                button.setOnClickListener(view -> content.smoothScrollTo(0, Math.max(0, top(target) - ui.dp(10))));
                rail.addView(button, ui.margins(0, 0, 0, 4)); labels.add(button);
            }
            highlight();
        }
        private int top(View target) {
            Rect bounds = new Rect(0,0,target.getWidth(),target.getHeight());
            body.offsetDescendantRectToMyCoords(target,bounds); return bounds.top;
        }
        private void highlight() {
            if (!split || targets.isEmpty()) return;
            int selected = 0;
            for (int i = 0; i < targets.size(); i++) if (top(targets.get(i)) <= content.getScrollY() + ui.dp(30)) selected = i;
            for (int i = 0; i < labels.size(); i++) {
                TextView label = labels.get(i); boolean active = i == selected;
                label.setSelected(active); label.setTextColor(active ? ui.accent : ui.text);
                label.setBackground(ui.pressable(ui.round(active ? ui.accentContainer : Color.TRANSPARENT, 10)));
            }
        }
    }
}
