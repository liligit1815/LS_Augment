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
    static final String SETTINGS = "settings";
    static final String SYSTEM_UI = "systemui";
    static final String DEVICE = "device";
    static final String APPS = "apps";
    static final String GAMES = "games";

    private static final String[] LABELS = {
            "隐藏列表（系统设置）",
            "状态栏（SystemUI）",
            "系统核心与连接（重启手机）",
            "应用增强（安装兼容、双开与主题商店）",
            "游戏增强（游戏空间与风扇）",
            "全部作用域（重启手机）"
    };
    private static final String[] IDS = {
            SETTINGS, SYSTEM_UI, DEVICE, APPS, GAMES, "all"
    };

    private ScopeRestartDialog() { }

    static ImageButton addButton(Activity activity, UiKit ui, LinearLayout header, String suggested) {
        ImageButton button = new ImageButton(activity);
        button.setImageResource(R.drawable.ic_restart_scope);
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setColorFilter(ui.accent);
        button.setBackground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,22)));
        button.setContentDescription("重启作用域");button.setTooltipText("重启作用域");
        button.setOnClickListener(view -> show(activity, suggested));
        header.addView(button, new LinearLayout.LayoutParams(ui.dp(44), ui.dp(44)));
        return button;
    }

    static void show(Activity activity, String suggested) {
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
        ui.glassDialog("重启作用域", choices, "立即重启",
                () -> restart(activity, IDS[selected[0]]), "取消");
    }

    private static int indexOf(String value) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(value)) return i;
        return IDS.length - 1;
    }

    private static void restart(Activity activity, String scope) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(() -> {
            try {
                RootShell.Result synced=new AppConfig(activity).mirrorAll();
                if(!synced.isSuccess()){
                    activity.runOnUiThread(()->Toast.makeText(activity,
                            "启动配置仍在等待 LSPosed 框架同步，请稍后再重启作用域。",
                            Toast.LENGTH_LONG).show());
                    return;
                }
                RootShell.Result result = RootShell.run(command(scope), null, 15, 16 * 1024);
                activity.runOnUiThread(() -> Toast.makeText(activity,
                        result.isSuccess() ? "作用域已重启" : "重启失败：" + result.publicError(),
                        Toast.LENGTH_LONG).show());
            } finally { executor.shutdown(); }
        });
    }

    private static String command(String scope) {
        switch (scope) {
            case SETTINGS:
                return "am force-stop com.android.settings";
            case SYSTEM_UI:
                return "killall com.android.systemui";
            case DEVICE:
                return "reboot";
            case APPS:
                return "am force-stop cn.nubia.neostore; am force-stop com.mi.health; am force-stop com.zte.cn.doubleapp; am force-stop com.zte.beautify; "
                        + "am force-stop com.zte.beautifyadapter; am force-stop com.android.packageinstaller; "
                        + "am force-stop com.zte.zdm; am force-stop com.zte.mifavor.weather; "
                        + "am force-stop com.android.permissioncontroller; am force-stop cn.nubia.filebrowser; "
                        + "am force-stop com.android.ztescreenshot; killall com.zte.mifavor.launcher >/dev/null 2>&1 || true";
            case GAMES:
                return "am force-stop cn.nubia.gamelauncher; am force-stop cn.nubia.gameassist; "
                        + "am force-stop cn.nubia.gamelab; "
                        + "am force-stop cn.nubia.gamehelpmodule; "
                        + "am force-stop cn.nubia.gamehelperline; "
                        + "am force-stop com.zte.game.plugintrigger; "
                        + "am force-stop cn.zte.gamefloat; am force-stop cn.nubia.gamehighlights; "
                        + "killall cn.nubia.fan >/dev/null 2>&1 || true";
            default:
                return "reboot";
        }
    }
}
