package ls.augment.com;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.util.Collections;
import java.util.concurrent.Executor;

/** Shared real preferences for the settings page and the workspace's in-place dialog. */

// Code-only view requires UiKit/state/callbacks; it is never inflated from XML. A partial XML constructor is invalid.
//noinspection ViewConstructor
final class AtomicWorkbenchAppearanceControls extends LinearLayout {
    private final Activity activity;
    private AppConfig config;
    private long generation;
    private final Executor worker;
    private final Runnable changed;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Switch media, quickOpen;
    private final Spinner empty, sideCount;
    private final ParameterSlider triggerArea, cornerSensitivity;
    private final TextView feedback;
    private final int previewColor;
    private View previewRoot;
    private android.graphics.drawable.Drawable preview;
    private final Runnable hidePreview = this::endEntryPreview;
    private final View.OnLayoutChangeListener previewLayout = (v,l,t,r,b,ol,ot,or,ob) -> {
        if (l != ol || t != ot || r != or || b != ob) endEntryPreview();
    };
    private boolean rendering, saving, allowed = true;

    AtomicWorkbenchAppearanceControls(Activity activity, UiKit ui, AppConfig config, long generation,
            Executor worker, Runnable changed) {
        super(activity);
        this.activity = activity; this.config = config; this.generation = generation;
        this.worker = worker; this.changed = changed;
        previewColor = ui.accent;
        setOrientation(VERTICAL);
        addView(ui.featureTitle("角落触发区域（%）", "调整左右上侧起滑区域，范围 50–120%。保存后显示实际区域 2 秒，默认 100%。"), ui.wrap());
        triggerArea = new ParameterSlider(ui, EnhancementOption.integer(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE,
                "atomic_workbench", "角落触发区域（%）", "", 100, 50, 120),
                String.valueOf(config.getInt(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, 100)),
                value -> saveEntryParameter(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, value), true);
        addView(triggerArea, ui.wrap());
        triggerArea.bindTitle(getChildAt(getChildCount()-2));
        addView(ui.featureTitle("角落触发灵敏度（%）", "数值越大，向中间水平滑动所需距离越短，范围 60–160%。默认 100%。"), ui.wrap());
        cornerSensitivity = new ParameterSlider(ui, EnhancementOption.integer(AtomicWorkbenchConfig.CORNER_SENSITIVITY,
                "atomic_workbench", "角落触发灵敏度（%）", "", 100, 60, 160),
                String.valueOf(config.getInt(AtomicWorkbenchConfig.CORNER_SENSITIVITY, 100)),
                value -> saveEntryParameter(AtomicWorkbenchConfig.CORNER_SENSITIVITY, value), true);
        addView(cornerSensitivity, ui.wrap());
        cornerSensitivity.bindTitle(getChildAt(getChildCount()-2));
        media = new Switch(activity);
        media.setTag("config:" + AtomicWorkbenchConfig.SHOW_MEDIA);
        addView(ui.featureRow("显示顶栏状态卡", "显示音乐、导航及可读取的计时通知，横向滑动切换。", media), ui.wrap());
        quickOpen = new Switch(activity);
        quickOpen.setTag("config:" + AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        addView(ui.featureRow("快捷打开 App", "开启后显示工作台横向应用图标，点按可打开或切换应用。关闭后整行隐藏并收回空间，已打开的窗口保留。“＋”始终打开手机原生桌面。默认关闭。", quickOpen), ui.wrap());
        addView(ui.featureTitle("副窗数量", "设置 3 至 6 个副窗。缩减只隐藏多余窗口，已打开应用保留，可从原应用入口切回。"), ui.wrap());
        sideCount = ui.choiceSpinner("副窗数量");
        sideCount.setTag("config:" + AtomicWorkbenchConfig.SIDE_COUNT);
        sideCount.setContentDescription("副窗数量");
        ArrayAdapter<String> counts = new ArrayAdapter<>(activity, android.R.layout.simple_spinner_item,
                new String[]{"3 个副窗", "4 个副窗", "5 个副窗", "6 个副窗"});
        counts.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); sideCount.setAdapter(counts);
        addView(sideCount, ui.wrap());
        addView(ui.featureTitle("侧栏空白工作区", "仅调整空白加号格数量，已打开的侧窗会始终保留。"), ui.wrap());
        empty = ui.choiceSpinner("侧栏空白工作区数量");
        empty.setTag("config:" + AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS);
        empty.setContentDescription("侧栏空白工作区数量");
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_spinner_item,
                new String[]{"不显示空白格", "1 个空白格", "2 个空白格", "3 个空白格"});
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); empty.setAdapter(adapter);
        addView(empty, ui.wrap());
        if (!(activity instanceof AtomicWorkbenchSettingsActivity)) {
            // Preference management is available even when quick-open is switched off.
            addView(ui.preferenceRow("atomic_workbench_apps", "应用列表显示", "选择、隐藏恢复、置顶及手动拖序",
                    () -> ModuleNavigation.open(activity,AtomicWorkbenchAppsActivity.DISPLAY_ROUTE)),ui.wrap());
            addView(ui.preferenceRow("atomic_workbench_app_sort", "应用列表排序", "手动、真实使用频率或首字母",
                    () -> ModuleNavigation.open(activity,AtomicWorkbenchAppsActivity.SORT_ROUTE)),ui.wrap());
        }
        feedback = ui.text("", 12, ui.muted, false);
        feedback.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        feedback.setVisibility(GONE); addView(feedback, ui.margins(0, 4, 0, 0));
        refresh(true);
        media.setOnCheckedChangeListener((button, value) -> {
            if (!rendering && value != this.config.getBoolean(AtomicWorkbenchConfig.SHOW_MEDIA))
                save(AtomicWorkbenchConfig.SHOW_MEDIA, value ? "1" : "0");
        });
        quickOpen.setOnCheckedChangeListener((button, value) -> {
            if (!rendering && value != this.config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS))
                save(AtomicWorkbenchConfig.QUICK_OPEN_APPS, value ? "1" : "0");
        });
        sideCount.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            public void onNothingSelected(AdapterView<?> parent) { }
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                int count = position + 3;
                if (!rendering && count != AtomicWorkbenchAppearanceControls.this.config.getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3))
                    save(AtomicWorkbenchConfig.SIDE_COUNT, String.valueOf(count));
            }
        });
        empty.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            public void onNothingSelected(AdapterView<?> parent) { }
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (!rendering && position != AtomicWorkbenchAppearanceControls.this.config.getInt(AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS, 3))
                    save(AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS, String.valueOf(position));
            }
        });
    }

    void refresh(boolean available) {
        allowed = available;
        rendering = true;
        media.setChecked(config.getBoolean(AtomicWorkbenchConfig.SHOW_MEDIA));
        quickOpen.setChecked(config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS));
        empty.setSelection(Math.max(0, Math.min(3, config.getInt(AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS, 3))));
        sideCount.setSelection(Math.max(3, Math.min(6, config.getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3))) - 3);
        triggerArea.setValue(String.valueOf(config.getInt(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, 100)));
        cornerSensitivity.setValue(String.valueOf(config.getInt(AtomicWorkbenchConfig.CORNER_SENSITIVITY, 100)));
        boolean enabled = allowed && !saving && !ResetWriteFence.stale(generation);
        media.setEnabled(enabled); quickOpen.setEnabled(enabled); empty.setEnabled(enabled); sideCount.setEnabled(enabled);
        triggerArea.bar.setEnabled(enabled); cornerSensitivity.bar.setEnabled(enabled);
        if (!enabled) endEntryPreview();
        rendering = false;
    }

    void rebind(AppConfig config, long generation) {
        endEntryPreview();
        triggerArea.discardEdit(); cornerSensitivity.discardEdit();
        this.config = config; this.generation = generation; refresh(allowed);
    }

    private void saveEntryParameter(String key, String value) {
        if (!rendering && !value.equals(String.valueOf(config.getInt(key, 100)))) save(key, value);
    }

    private void endEntryPreview() {
        main.removeCallbacks(hidePreview);
        if (previewRoot != null) {
            previewRoot.removeOnLayoutChangeListener(previewLayout);
            if (preview != null) previewRoot.getOverlay().remove(preview);
        }
        preview = null; previewRoot = null;
    }

    /** Paint the same policy's screen coordinates without adding a touchable window. */

    // Measure the host's actual system inset resource; the existing missing-ID fallback is required across OEM layouts.
    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi,InternalInsetResource
    private void showEntryPreview() {
        endEntryPreview();
        if (!allowed || !isAttachedToWindow() || !isShown() || activity.isDestroyed() || activity.isFinishing()
                || ResetWriteFence.stale(generation) || activity.isInMultiWindowMode() || activity.isInPictureInPictureMode()) return;
        View root = activity.getWindow().getDecorView();
        if (root.getDisplay() == null || root.getDisplay().getDisplayId() != 0 || !root.isShown()) return;
        android.graphics.Rect screen = activity.getWindowManager().getMaximumWindowMetrics().getBounds();
        float density = root.getResources().getDisplayMetrics().density;
        int resource = root.getResources().getIdentifier("status_bar_height", "dimen", "android");
        float statusBar = resource == 0 ? 24f * density : root.getResources().getDimensionPixelSize(resource);
        final AtomicWorkbenchGesturePolicy.Geometry geometry;
        try { geometry = AtomicWorkbenchGesturePolicy.Geometry.create(screen.width(), screen.height(), density, statusBar,
                config.getInt(AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, 100),
                config.getInt(AtomicWorkbenchConfig.CORNER_SENSITIVITY, 100)); }
        catch (IllegalArgumentException unavailable) { return; }
        int[] origin = new int[2]; root.getLocationOnScreen(origin);
        android.graphics.Rect visible = new android.graphics.Rect();
        int left = -origin[0], top = (int)Math.floor(geometry.minY) - origin[1];
        int right = screen.width() - origin[0], bottom = (int)Math.ceil(geometry.maxY) - origin[1];
        if (!root.getLocalVisibleRect(visible) || !visible.contains(left, top, right, bottom)) return;
        android.graphics.Paint paint = new android.graphics.Paint(); paint.setColor(previewColor); paint.setAlpha(110);
        preview = new android.graphics.drawable.Drawable() {
            public void draw(android.graphics.Canvas canvas) {
                canvas.drawRect(-origin[0], geometry.minY-origin[1], geometry.edge-origin[0], geometry.maxY-origin[1], paint);
                canvas.drawRect(geometry.width-geometry.edge-origin[0], geometry.minY-origin[1],
                        geometry.width-origin[0], geometry.maxY-origin[1], paint);
            }
            public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
            public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
        };
        preview.setBounds(0, 0, root.getWidth(), root.getHeight());
        previewRoot = root; root.getOverlay().add(preview); root.addOnLayoutChangeListener(previewLayout);
        main.postDelayed(hidePreview, 2000L);
    }

    @Override protected void onDetachedFromWindow() { endEntryPreview(); super.onDetachedFromWindow(); }
    @Override protected void onWindowVisibilityChanged(int visibility) {
        if (visibility != VISIBLE) endEntryPreview();
        super.onWindowVisibilityChanged(visibility);
    }

    private void save(String key, String value) {
        if (saving || !allowed || ResetWriteFence.stale(generation)) { refresh(allowed); return; }
        saving = true; refresh(allowed); feedback.setVisibility(VISIBLE); feedback.setText("正在保存…");
        final long requestGeneration = generation;
        final AppConfig requestConfig = config;
        worker.execute(() -> {
            AppConfig.SaveResult saved;
            try {
                saved = ResetWriteFence.stale(requestGeneration)
                        ? new AppConfig.SaveResult(false, "配置已重置，请重新打开设置。")
                        : requestConfig.save(Collections.singletonMap(key, value));
            } catch (RuntimeException failed) { saved = new AppConfig.SaveResult(false, "保存失败，请稍后重试。"); }
            final AppConfig.SaveResult result = saved;
            main.post(() -> {
                saving = false;
                if (activity.isDestroyed() || !isAttachedToWindow() || requestConfig != config || requestGeneration != generation) return;
                refresh(allowed);
                boolean current = !ResetWriteFence.stale(requestGeneration);
                feedback.setText(!current ? "配置已重置，本次操作未重新应用。" : result.success ? "已保存" : result.message);
                if (current && result.success && changed != null) changed.run();
                if (current && result.success && AtomicWorkbenchConfig.TRIGGER_AREA_SCALE.equals(key)) showEntryPreview();
            });
        });
    }
}
