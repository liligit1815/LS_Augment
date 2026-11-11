package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
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
    private int request;
    private boolean busy, rendering, topSupported, resumed;
    private AppConfig config;
    private UiKit ui;
    private Switch master, upper, pageIndicator;
    private Button check, count;
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
        check = ui.tonalButton("检查工作台接入");
        check.setOnClickListener(v -> probe(false));
        card.addView(check, ui.wrap());
        Button guide=ui.textButton("手势引导");
        guide.setOnClickListener(v->startActivity(new Intent(this,StepGestureGuideActivity.class)));
        card.addView(guide,ui.wrap());

        LinearLayout layout = ui.preferenceCard();
        body.addView(layout, ui.margins(0, 8, 0, 0));
        count = ui.tonalButton("");
        count.setOnClickListener(v -> chooseCount());
        layout.addView(ui.featureTitle("工作区布局", "默认一主三侧副，支持五个侧边副区和一个独立顶部副区。"), ui.wrap());
        layout.addView(count, ui.wrap());
        upper = new Switch(this);
        layout.addView(ui.featureRow("顶部副工作区", "需要系统支持原屏顶部窗口。顶部应用与音乐左右滑动切换，导航直接使用地图应用原界面；工具栏从顶部两侧边缘呼出，向外滑动或点击中间收起。原厂侧栏资源不可用时保留原工具页。", upper), ui.wrap());
        pageIndicator = new Switch(this);
        pageIndicator.setTag("config:" + StepConfig.PAGE_INDICATOR);
        layout.addView(ui.featureRow("页面指示器", "在顶部内容底部显示页数和当前位置。", pageIndicator), ui.wrap());
        layout.addView(ui.preferenceRow("atomic_workbench_apps", "快捷应用",
                "选择工作台快捷栏中显示的应用", () -> startActivity(new Intent(this, QuickPinsActivity.class))), ui.wrap());
        layout.addView(ui.preferenceRow("step_top_wallpaper", "顶部壁纸",
                "跟随桌面壁纸，或从相册单独选择", () -> startActivity(new Intent(this, StepWallpaperActivity.class))), ui.wrap());
        layout.addView(ui.featureTitle("音乐与歌词",
                "优先使用本机红魔原生音乐卡片，并跟随系统当前媒体会话；原厂不支持的播放器或缺失接口使用兼容控件。\n\n"
                + "歌词优先取自播放器。缺失时自动匹配网易云音乐、酷狗、汽水音乐和 LRCLIB，点击歌词可重试、选来源或导入本地歌词。在线查询会向所查询来源发送歌名、歌手、时长，以及对应来源可识别的歌曲编号；不发送剪贴板、应用页面或账号凭据。\n\n"
                + "查询结果仅缓存在当前进程内，切换系统用户时清空。无需额外勾选播放器作用域。进度跳转、输出设备和歌词是否可用，取决于播放器、系统接口及网络服务。"), ui.wrap());
        layout.addView(ui.featureTitle("退出与恢复", "底部上滑可在主区回桌面选应用。息屏或锁屏后，解锁会自动回到工作台。手动退出后再次进入时，只恢复仍在后台运行的原任务。"), ui.wrap());
        fold = ui.fold(master, layout);
        fold.show(state != null && state.getBoolean("expanded"));
        master.setOnCheckedChangeListener((v, on) -> {
            if (rendering) return;
            render();
            if (on) probe(true); else saveMaster(false);
        });
        upper.setOnCheckedChangeListener((v, on) -> {
            if (!rendering) saveLayout(StepConfig.sideCount(this), on);
        });
        pageIndicator.setOnCheckedChangeListener((v, on) -> {
            if (!rendering) commit(() -> StepConfig.savePageIndicator(this, on), on ? "页面指示器已显示。" : "页面指示器已隐藏。");
        });
        status.setText("可检查当前系统框架与系统界面是否已加载本版工作台。");
        render();
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
        StepRuntime.query(this, "android", new ResultReceiver(main) {
            @Override protected void onReceiveResult(int code, Bundle data) {
                if (isDestroyed()) return;
                topSupported = code == 1 && data != null && data.getInt("version") == BuildConfig.VERSION_CODE
                        && data.getBoolean("topAvailable");
                render();
            }
        });
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
        count.setText("侧边副工作区数量　" + sides);
        count.setEnabled(available);
        upper.setChecked(StepConfig.upper(this));
        upper.setEnabled(available && (topSupported || upper.isChecked()));
        pageIndicator.setChecked(StepConfig.pageIndicator(this));
        pageIndicator.setEnabled(available);
        fold.sync();
        rendering = false;
    }
    private void chooseCount() {
        boolean hasUpper = StepConfig.upper(this);
        String[] choices = new String[5];
        for (int i = 0; i < choices.length; i++) choices[i] = (i + 1) + " 个侧边副工作区";
        ui.choiceDialog("侧边副工作区数量", choices, null, i -> saveLayout(i + 1, hasUpper));
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
                    if (host == 0) topSupported = ready[host] && answer.getBoolean("topAvailable");
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
