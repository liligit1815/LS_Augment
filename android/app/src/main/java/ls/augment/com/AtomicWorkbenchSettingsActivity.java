package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.util.Collections;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import ls.augment.com.step.QuickPinsActivity;
import ls.augment.com.step.StepRuntime;

/** Keep the established settings identity across the switch to physical tasks. */
public final class AtomicWorkbenchSettingsActivity extends Activity {
    static final String EXTRA_COMPONENT = AtomicWorkbenchConfig.EXTRA_COMPONENT;
    static final String EXTRA_GENERATION = "atomic_workbench_generation";
    private static final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private long generation;
    private int request, countSelection=-1;
    private boolean busy, rendering, resumed;
    private AppConfig config;
    private UiKit ui;
    private Switch master, pageIndicator, toolbarAutoCollapse;
    private Button check;
    private Spinner count;
    private TextView status;
    private UiKit.Fold fold;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        generation = ResetWriteFence.generation();
        config = new AppConfig(this);
        ui = new UiKit(this);
        LinearLayout body = ui.detailPage("红魔Step", "device");
        ui.addDetailSectionTitle(body, "工作台");
        LinearLayout card = ui.preferenceCard();
        body.addView(card, ui.wrap());
        master = new Switch(this);
        master.setTag("config:" + AtomicWorkbenchConfig.ENABLED);
        master.setChecked(config.getBoolean(AtomicWorkbenchConfig.ENABLED));
        card.addView(ui.featureRow("启用红魔Step",
                "从状态栏左角或右角向屏幕中央横滑，打开工作台。首次安装或更新后，请在 LSPosed 为红魔Duo启用系统框架和系统界面作用域并重启手机。", master), ui.wrap());
        status = ui.text("", 12, ui.muted, false);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        card.addView(status, ui.margins(0, 4, 0, 8));
        check = ui.button("检查工作台接入");
        check.setOnClickListener(v -> probe(false));
        card.addView(check, ui.wrap());
        Button guide=ui.textButton("手势引导");
        guide.setOnClickListener(v->startActivity(new Intent(this,StepGestureGuideActivity.class)));
        card.addView(guide,ui.wrap());

        LinearLayout layout = ui.preferenceCard();
        body.addView(layout, ui.margins(0, 8, 0, 0));
        count = ui.choiceSpinner("侧边副工作区数量");
        count.setContentDescription("侧边副工作区数量");
        count.setTag("config:" + AtomicWorkbenchConfig.SIDE_COUNT);
        String[] choices = new String[5];
        for (int i=0;i<choices.length;i++) choices[i]=(i+1)+" 个侧边副工作区";
        count.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,choices));
        layout.addView(ui.featureTitle("工作区布局", "默认一主三侧副，支持五个侧边副区和一个独立顶部副区。"), ui.wrap());
        layout.addView(count, ui.wrap());
        pageIndicator = new Switch(this);
        pageIndicator.setTag("config:" + StepConfig.PAGE_INDICATOR);
        layout.addView(ui.featureRow("页面指示器", "在顶部内容底部显示页数和当前位置。", pageIndicator), ui.wrap());
        toolbarAutoCollapse = new Switch(this);
        toolbarAutoCollapse.setTag("config:" + StepConfig.TOOLBAR_AUTO_COLLAPSE);
        layout.addView(ui.featureRow("自动收起工具栏", "操作工具栏按钮后自动收起；关闭后保持展开，点击顶区非工具栏区域收起。", toolbarAutoCollapse), ui.wrap());
        layout.addView(ui.preferenceRow("atomic_workbench_apps", "快捷应用",
                "选择工作台快捷栏中显示的应用", () -> startActivity(new Intent(this, QuickPinsActivity.class))), ui.wrap());
        layout.addView(ui.preferenceRow("step_top_wallpaper", "顶部壁纸",
                "跟随桌面壁纸，或从相册单独选择", () -> startActivity(new Intent(this, StepWallpaperActivity.class))), ui.wrap());
        fold = ui.fold(master, layout);
        fold.show(state != null && state.getBoolean("expanded"));
        master.setOnCheckedChangeListener((v, on) -> {
            if (rendering) return;
            render();
            if (on) probe(true); else saveMaster(false);
        });
        pageIndicator.setOnCheckedChangeListener((v, on) -> {
            if (!rendering) commit(() -> StepConfig.savePageIndicator(this, on), on ? "页面指示器已显示。" : "页面指示器已隐藏。");
        });
        toolbarAutoCollapse.setOnCheckedChangeListener((v, on) -> {
            if (!rendering) commit(() -> StepConfig.saveToolbarAutoCollapse(this, on), on ? "操作后自动收起工具栏。" : "操作后保持工具栏展开。");
        });
        status.setText("可检查当前系统框架与系统界面是否已加载本版工作台。");
        render();
        count.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            @Override public void onNothingSelected(AdapterView<?> parent){}
            @Override public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                if(rendering || busy || !resumed || isDestroyed() || !count.isEnabled()
                        || ResetWriteFence.stale(generation) || position==countSelection)return;
                countSelection=position;
                if(position+1!=StepConfig.sideCount(AtomicWorkbenchSettingsActivity.this))
                    saveLayout(position+1,StepConfig.upper(AtomicWorkbenchSettingsActivity.this));
            }
        });
    }

    @Override protected void onResume() {
        super.onResume(); resumed=true; render();
        if(StepConfig.enabled(this) && StepGestureGuideActivity.needsOffer(this)){
            StepRuntime.query(this,"com.android.systemui",new ResultReceiver(main){
                @Override protected void onReceiveResult(int code,Bundle answer){
                    if(!isDestroyed() && resumed && code==1 && answer!=null
                            && answer.getInt("version")==BuildConfig.VERSION_CODE)StepGestureGuideActivity.offer(AtomicWorkbenchSettingsActivity.this);
                }
            });
        }
    }
    @Override protected void onSaveInstanceState(Bundle out) {
        super.onSaveInstanceState(out);
        out.putBoolean("expanded", fold.content.getVisibility() == View.VISIBLE);
    }
    @Override protected void onPause(){resumed=false;super.onPause();}
    @Override protected void onDestroy() { request++; main.removeCallbacksAndMessages(null); super.onDestroy(); }

    private void render() {
        rendering = true;
        boolean available = !busy && !ResetWriteFence.stale(generation);
        master.setChecked(config.getBoolean(AtomicWorkbenchConfig.ENABLED));
        master.setEnabled(available);
        check.setEnabled(available);
        int sides = StepConfig.sideCount(this);
        if(!busy){
            countSelection=Math.max(0,Math.min(4,sides-1));
            count.setSelection(countSelection);
        }
        count.setEnabled(available);
        pageIndicator.setChecked(StepConfig.pageIndicator(this));
        pageIndicator.setEnabled(available);
        toolbarAutoCollapse.setChecked(StepConfig.toolbarAutoCollapse(this));
        toolbarAutoCollapse.setEnabled(available);
        fold.sync();
        rendering = false;
    }
    private void saveLayout(int sides, boolean top) {
        commit(() -> StepConfig.saveLayout(this, sides, top), "布局已保存，下次进入工作台时使用。");
    }
    private void saveMaster(boolean on) {
        commit(() -> config.save(Collections.singletonMap(AtomicWorkbenchConfig.ENABLED, on ? "1" : "0")).success,
                on ? "工作台已开启，可从状态栏角部横滑进入。" : "工作台已关闭。");
    }
    private void commit(java.util.function.BooleanSupplier save, String message) {
        busy = true; render();
        worker.execute(() -> {
            boolean saved = false;
            try { saved = !ResetWriteFence.stale(generation) && save.getAsBoolean(); }
            catch (RuntimeException ignored) { }
            final boolean ok = saved;
            main.post(() -> {
                if (isDestroyed()) return;
                busy = false; status.setText(ok ? message : "配置未保存，请重新打开此页再试。"); render();
                if(ok && resumed && StepConfig.enabled(this))StepGestureGuideActivity.offer(this);
            });
        });
    }

    private void probe(boolean enableAfter) {
        if (busy) return;
        busy = true; render();
        int token = ++request;
        status.setText("正在检查系统框架和系统界面…");
        String[] hosts = {"android", "com.android.systemui"};
        String[] results = {"系统框架未响应", "系统界面未响应"};
        boolean[] ready = new boolean[2], replied = new boolean[2];
        Runnable finish = () -> {
            if (request != token || isDestroyed()) return;
            request++; busy = false;
            status.setText(String.join(" · ", results));
            if (enableAfter && ready[0] && ready[1]) saveMaster(true); else render();
        };
        main.postDelayed(finish, 3500);
        for (int index = 0; index < hosts.length; index++) {
            final int host = index;
            StepRuntime.query(this, hosts[index], new ResultReceiver(main) {
                @Override protected void onReceiveResult(int code, Bundle answer) {
                    if (request != token || answer == null || replied[host]) return;
                    replied[host] = true;
                    ready[host] = code == 1 && answer.getInt("version") == BuildConfig.VERSION_CODE;
                    results[host] = answer.getString("details", hosts[host]) + (ready[host] ? "已就绪" : "未就绪");
                    if (replied[0] && replied[1]) finish.run();
                }
            });
        }
    }

    static void onStorageReset() { }

    static boolean allowed(ActivityInfo activity) {
        if (activity == null || activity.packageName == null || !activity.enabled || !activity.exported
                || activity.applicationInfo == null || !activity.applicationInfo.enabled
                || activity.applicationInfo.uid / 100000 != android.os.Process.myUid() / 100000
                || (activity.permission != null && !activity.permission.isEmpty())) return false;
        String pkg = activity.packageName;
        return !"ls.augment.com".equals(pkg) && !"android".equals(pkg)
                && !"com.android.systemui".equals(pkg) && !pkg.endsWith("permissioncontroller");
    }
}
