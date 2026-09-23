package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;

/** Second-level help menu. Checks only start after entering a third-level page. */
public final class ModuleHelpActivity extends Activity {
    private UiKit ui;
    private LinearLayout page;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        ui = new UiKit(this);
        page = ui.detailPage("日志及运行诊断", null);
        page.setTag("help-menu");
        page.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), ui.dp(24));
        menu("framework", "框架兼容性", "检查框架连接、版本与 API，并区分连接状态和当前模块加载证据。", view ->
                openDetails(CompatibilityDetailsActivity.SECTION_FRAMEWORK));
        menu("version", "当前版本兼容性", "对照当前模块收录的适配基准，读取本机系统和目标应用的实际版本。", view ->
                openDetails(CompatibilityDetailsActivity.SECTION_VERSION));
        menu("launcher", "修改版桌面兼容性", "检查修改版桌面所需的机型、系统、原厂签名、版本与关键权限；不会安装或替换桌面。", view ->
                startActivity(new Intent(this, LauncherCompatibilityActivity.class)));
        menu("diagnostics", "日志与诊断", "查看详细日志选项并按需导出诊断。进入页面不会自动启用日志或重启应用。", view ->
                ModuleNavigation.open(this, "diagnostics"));
    }

    private void openDetails(String section) {
        startActivity(new Intent(this, CompatibilityDetailsActivity.class)
                .putExtra(CompatibilityDetailsActivity.EXTRA_SECTION, section));
    }

    private void menu(String id, String title, String description, View.OnClickListener click) {
        LinearLayout card = ui.card();
        card.setTag("help-menu:" + id);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        card.setMinimumHeight(ui.dp(48));
        card.addView(ui.featureTitle(title, description), new LinearLayout.LayoutParams(0, -2, 1));
        ImageView arrow = new ImageView(this);
        arrow.setImageResource(R.drawable.ic_chevron_right);
        arrow.setColorFilter(ui.muted);
        arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams icon = new LinearLayout.LayoutParams(ui.dp(16), ui.dp(20));
        icon.setMarginStart(ui.dp(8));
        card.addView(arrow, icon);
        card.setClickable(true);
        card.setFocusable(true);
        card.setForeground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT, 18)));
        card.setOnClickListener(click);
        page.addView(card, ui.margins(0, 0, 0, 8));
    }

    /** Compatibility bridge for explicit read-only callers; the menu never invokes it. */
    public static CompatibilityReport inspect(Context context) {
        return CompatibilityDetailsActivity.inspect(context);
    }
}
