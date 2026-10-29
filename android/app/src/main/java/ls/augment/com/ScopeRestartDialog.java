package ls.augment.com;

import android.app.Activity;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** User-initiated, fixed-template target process restarts. */
final class ScopeRestartDialog {
    /** Editors drain their pending configuration writes before a user-requested restart. */
    interface Preparation { void prepareScopeRestart(Runnable restart); }
    static final String SETTINGS = "settings";
    static final String SYSTEM_UI = "systemui";
    static final String LAUNCHER = "launcher";
    static final String DEVICE = "device";
    static final String APPS = "apps";
    static final String GAMES = "games";
    static final String FAN = "fan";
    static final String AMAP = "amap";

    private static final String[] LABELS = {
            "隐藏列表（系统设置）",
            "状态栏（SystemUI）",
            "系统桌面（布局、图标与页面）",
            "系统核心与连接（重启手机）",
            "应用增强（安装兼容、双开与主题商店）",
            "游戏增强（游戏空间与风扇）",
            "散热风扇（风扇服务与控制中心）",
            "高德地图（退出后重新打开）",
            "全部作用域（重启手机）"
    };
    private static final String[] IDS = {
            SETTINGS, SYSTEM_UI, LAUNCHER, DEVICE, APPS, GAMES, FAN, AMAP, "all"
    };

    private ScopeRestartDialog() { }

    static ImageButton addButton(Activity activity, UiKit ui, LinearLayout header, String suggested) {
        ImageButton button = new ImageButton(activity);
        button.setImageResource(R.drawable.ic_restart_scope);
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setColorFilter(ui.accent);
        button.setBackground(ui.pressable(ui.controlGlass(button,22,IceGlassControlDrawable.NEUTRAL)));
        button.setContentDescription("重启作用域");button.setTooltipText("重启作用域");
        button.setOnClickListener(view -> show(activity, suggested));
        header.addView(button, new LinearLayout.LayoutParams(ui.dp(44), ui.dp(44)));
        return button;
    }

    static android.app.Dialog show(Activity activity, String suggested) {
        int checked = indexOf(suggested);
        final int[] selected = {checked};
        UiKit ui = new UiKit(activity);
        android.widget.RadioGroup choices = new android.widget.RadioGroup(activity);
        for (int i = 0; i < LABELS.length; i++) {
            android.widget.RadioButton choice = new android.widget.RadioButton(activity);
            choice.setId(android.view.View.generateViewId());
            choice.setText(LABELS[i]); choice.setTextSize(13); choice.setTextColor(ui.text);
            choice.setMinHeight(ui.dp(48));
            choice.setButtonTintList(android.content.res.ColorStateList.valueOf(ui.accent));
            choice.setPadding(ui.dp(8),ui.dp(8),ui.dp(8),ui.dp(8));
            choice.setBackground(ui.pressable(ui.roundStroke(ui.dark?0x544c7094:0x68ffffff,12,ui.outline,1)));
            choices.addView(choice, ui.margins(0,i==0?0:8,0,0));
            final int index = i;
            choice.setOnCheckedChangeListener((button, enabled) -> { if (enabled) selected[0] = index; });
            if (i == checked) choice.setChecked(true);
        }
        return ui.glassDialog("重启作用域", choices, "立即重启",
                () -> {
                    Runnable action = () -> restart(activity, IDS[selected[0]]);
                    if (activity instanceof Preparation) ((Preparation) activity).prepareScopeRestart(action);
                    else action.run();
                }, "取消");
    }

    private static int indexOf(String value) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(value)) return i;
        return IDS.length - 1;
    }

    private static void restart(Activity activity, String scope) {
        String request=java.util.UUID.randomUUID().toString();
        AuditLog.write(activity,"SCOPE_RESTART_REQUEST","request="+request+";scope="+scope+";source=manual;version="+BuildConfig.VERSION_NAME);
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(() -> {
            try {
                AppConfig config=new AppConfig(activity);
                RootShell.Result synced=config.mirrorAll();
                ConfigSnapshot restartSnapshot=config.configSnapshot();
                // Saving is asynchronous. Allow the committed snapshot to reach the framework
                // before replacing the process that will read it during startup.
                for (int attempt=0; (!synced.isSuccess() || !FrameworkConfigSync.isPublished(restartSnapshot)) && attempt<24; attempt++) {
                    android.os.SystemClock.sleep(125);
                    synced=config.mirrorAll();
                    restartSnapshot=config.configSnapshot();
                }
                if(!synced.isSuccess() || !FrameworkConfigSync.isPublished(restartSnapshot)){
                    AuditLog.write(activity,"SCOPE_RESTART_BLOCKED","request="+request+";scope="+scope+";reason=configuration_not_synced;exit="+synced.exitCode+";timeout="+synced.timedOut);
                    activity.runOnUiThread(()->Toast.makeText(activity,
                            "启动配置仍在等待 LSPosed 框架同步，请稍后再重启作用域。",
                            Toast.LENGTH_LONG).show());
                    return;
                }
                if(LAUNCHER.equals(scope) || APPS.equals(scope) || DEVICE.equals(scope) || "all".equals(scope))
                    AppConfig.traceLauncherGrid(activity,"RESTART_READY",restartSnapshot.values(),restartSnapshot.revision,
                            "request="+request+";scope="+scope+";frameworkSync=SYNCED;desktopApplied=UNCONFIRMED");
                AuditLog.writeDurable(activity,"SCOPE_RESTART_COMMAND","request="+request+";scope="+scope+";source=manual;version="+BuildConfig.VERSION_NAME);
                RootShell.Result result = RootShell.run(command(scope), null, 15, 16 * 1024);
                AuditLog.write(activity,"SCOPE_RESTART_COMMAND_RESULT","request="+request+";scope="+scope
                        +";exit="+result.exitCode+";timeout="+result.timedOut+";meaning=command_return_not_process_restart_proof");
                activity.runOnUiThread(() -> Toast.makeText(activity,
                        result.isSuccess() ? "作用域已重启" : "重启失败：" + result.publicError(),
                        Toast.LENGTH_LONG).show());
            } catch(RuntimeException error){
                AuditLog.write(activity,"SCOPE_RESTART_ERROR","request="+request+";scope="+scope+";error="+error.getClass().getSimpleName());
                activity.runOnUiThread(()->Toast.makeText(activity,"重启失败，请重新尝试。",Toast.LENGTH_LONG).show());
            } finally { executor.shutdown(); }
        });
    }

    private static String command(String scope) {
        return ScopeRestartPolicy.command(scope);
    }
}
