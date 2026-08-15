package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** User-initiated, fixed-template target process restarts. */
final class ScopeRestartDialog {
    static final String SETTINGS = "settings";
    static final String LAUNCHER = "launcher";
    static final String SYSTEM_UI = "systemui";
    static final String APPS = "apps";
    static final String GAMES = "games";

    private static final String[] LABELS = {
            "隐藏列表（系统设置）",
            "最近任务（系统桌面）",
            "状态栏（SystemUI）",
            "应用增强（双开与主题商店）",
            "游戏增强（游戏空间）",
            "全部作用域"
    };
    private static final String[] IDS = {SETTINGS, LAUNCHER, SYSTEM_UI, APPS, GAMES, "all"};

    private ScopeRestartDialog() { }

    static Button addButton(Activity activity, UiKit ui, LinearLayout header, String suggested) {
        Button button = ui.tonalButton("重启作用域");
        button.setTextSize(12.5f);
        button.setMinWidth(0);
        button.setMinimumWidth(0);
        button.setPadding(ui.dp(11), ui.dp(6), ui.dp(11), ui.dp(6));
        button.setOnClickListener(view -> show(activity, suggested));
        header.addView(button, new LinearLayout.LayoutParams(-2, ui.dp(44)));
        return button;
    }

    static void show(Activity activity, String suggested) {
        int checked = indexOf(suggested);
        final int[] selected = {checked};
        new AlertDialog.Builder(activity)
                .setTitle("重启作用域")
                .setSingleChoiceItems(LABELS, checked, (dialog, which) -> selected[0] = which)
                .setNegativeButton("取消", null)
                .setPositiveButton("立即重启", (dialog, which) -> restart(activity, IDS[selected[0]]))
                .show();
    }

    private static int indexOf(String value) {
        for (int i = 0; i < IDS.length; i++) if (IDS[i].equals(value)) return i;
        return IDS.length - 1;
    }

    private static void restart(Activity activity, String scope) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(() -> {
            RootShell.Result result = RootShell.run(command(scope), null, 15, 16 * 1024);
            activity.runOnUiThread(() -> Toast.makeText(activity,
                    result.isSuccess() ? "作用域已重启" : "重启失败：" + result.publicError(),
                    Toast.LENGTH_LONG).show());
            executor.shutdown();
        });
    }

    private static String command(String scope) {
        switch (scope) {
            case SETTINGS:
                return "am force-stop com.android.settings";
            case LAUNCHER:
                return "am force-stop com.zte.mifavor.launcher; "
                        + "am start -a android.intent.action.MAIN -c android.intent.category.HOME >/dev/null 2>&1";
            case SYSTEM_UI:
                return "killall com.android.systemui";
            case APPS:
                return "am force-stop com.zte.cn.doubleapp; am force-stop com.zte.beautify; "
                        + "am force-stop com.zte.beautifyadapter";
            case GAMES:
                return "am force-stop cn.nubia.gamelauncher; am force-stop cn.nubia.gameassist; "
                        + "am force-stop cn.nubia.gamehelpmodule";
            default:
                return "am force-stop com.android.settings; "
                        + "am force-stop com.zte.mifavor.launcher; "
                        + "killall com.android.systemui; "
                        + "am force-stop com.zte.cn.doubleapp; am force-stop com.zte.beautify; "
                        + "am force-stop com.zte.beautifyadapter; "
                        + "am force-stop cn.nubia.gamelauncher; am force-stop cn.nubia.gameassist; "
                        + "am force-stop cn.nubia.gamehelpmodule; "
                        + "am start -a android.intent.action.MAIN -c android.intent.category.HOME >/dev/null 2>&1";
        }
    }
}
