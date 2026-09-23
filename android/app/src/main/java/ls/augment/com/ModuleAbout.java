package ls.augment.com;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** Compact About cards, shared with the bottom-navigation destination. */
final class ModuleAbout {
    private static final String REPOSITORY = "https://github.com/liligit1815/LS_Augment";

    private ModuleAbout() { }

    static View appendCards(Activity activity, UiKit ui, LinearLayout parent,
            View.OnClickListener onSystemVersionTap) {
        DeviceInfo device = new DeviceInfo(activity);
        LinearLayout hardware = group(ui, parent, "当前设备");
        hardware.setTag("about-device-card");
        TextView deviceName = ui.text(device.name, 18, ui.text, true);
        deviceName.setTag("device-info:name");
        deviceName.setTextIsSelectable(true);
        hardware.addView(deviceName, ui.margins(0, 4, 0, 6));
        row(ui, hardware, "设备型号", device.model, "model");
        row(ui, hardware, "安卓版本", device.androidVersion, "android");
        LinearLayout systemVersion = row(ui, hardware, "系统版本", device.systemVersion, "system");
        systemVersion.setTag("about-system-version-entry");
        systemVersion.setOnClickListener(onSystemVersionTap);
        systemVersion.setFocusable(true);
        // The whole device-system row is the sole disclosure target. Selectable
        // child text would otherwise consume taps intended for this row.
        for (int i = 0; i < systemVersion.getChildCount(); i++) {
            View child = systemVersion.getChildAt(i);
            if (child instanceof TextView) ((TextView) child).setTextIsSelectable(false);
            child.setClickable(false); child.setFocusable(false);
        }
        row(ui, hardware, "桌面版本", device.launcherVersion, "launcher");

        LinearLayout developer = group(ui, parent, "开发者");
        developer.setTag("about-developer-profile");
        LinearLayout profile = new LinearLayout(activity);
        profile.setGravity(Gravity.CENTER_VERTICAL);
        profile.setPadding(0, ui.dp(6), 0, ui.dp(6));
        ImageView avatar = new ImageView(activity);
        avatar.setImageResource(R.drawable.avatar_liligit1815);
        avatar.setScaleType(ImageView.ScaleType.CENTER_CROP);
        avatar.setBackground(ui.round(Color.TRANSPARENT, 28));
        avatar.setClipToOutline(true);
        avatar.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        profile.addView(avatar, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        LinearLayout person = new LinearLayout(activity);
        person.setOrientation(LinearLayout.VERTICAL);
        person.addView(ui.text("liligit1815", 13, ui.text, true), ui.wrap());
        person.addView(ui.text("问题反馈、版本查询，请点击前往 GitHub", 11.5f, ui.muted, false), ui.margins(0, 4, 0, 0));
        LinearLayout.LayoutParams personParams = new LinearLayout.LayoutParams(0, -2, 1);
        personParams.setMarginStart(ui.dp(13));
        profile.addView(person, personParams);
        profile.addView(arrow(ui), new LinearLayout.LayoutParams(ui.dp(18), ui.dp(22)));
        developer.setClickable(true); developer.setFocusable(true);
        developer.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));
        developer.setOnClickListener(view -> open(activity, REPOSITORY));
        developer.setContentDescription("liligit1815，问题反馈、版本查询，点击前往 GitHub");
        developer.addView(profile, ui.wrap());

        single(ui, parent, "贡献者", "感谢为项目提供帮助的个人与团队", view ->
                activity.startActivity(new Intent(activity, ContributorsActivity.class)));
        single(ui, parent, "支持", "您可以在此处捐赠以支持我们。", view ->
                activity.startActivity(new Intent(activity, SupportActivity.class)));

        LinearLayout legal = ui.card();
        legal.setTag("about-legal-card");
        legal.setPadding(ui.dp(12), ui.dp(1), ui.dp(12), ui.dp(1));
        action(ui, legal, "用户协议", "使用前了解功能边界与注意事项", view -> ModuleLegal.showTerms(activity, ui));
        legal.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));
        action(ui, legal, "隐私政策", "了解本地信息、权限与数据管理", view -> ModuleLegal.showPrivacy(activity, ui));
        parent.addView(legal, ui.margins(0, 0, 0, 8));
        return hardware;
    }

    private static LinearLayout group(UiKit ui, LinearLayout parent, String title) {
        LinearLayout card = ui.card();
        card.setPadding(ui.dp(12), ui.dp(10), ui.dp(12), ui.dp(8));
        TextView heading = ui.text(title, 12, ui.accent, true);
        card.addView(heading, ui.margins(0, 0, 0, 5));
        parent.addView(card, ui.margins(0, 0, 0, 8));
        return card;
    }

    private static LinearLayout row(UiKit ui, LinearLayout parent, String label, String value, String key) {
        LinearLayout row = new LinearLayout(ui.activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, ui.dp(7), 0, ui.dp(7));
        TextView title = ui.text(label, 11, ui.muted, false);
        row.addView(title, ui.wrap());
        TextView content = ui.text(value, 15, ui.text, false);
        content.setTag("device-info:"+key);
        content.setTextIsSelectable(true);
        content.setLineSpacing(ui.dp(2), 1f);
        row.addView(content, ui.margins(0, 3, 0, 0));
        parent.addView(row, ui.wrap());
        return row;
    }

    private static void single(UiKit ui, LinearLayout parent, String title, String summary, View.OnClickListener click) {
        LinearLayout card = ui.card();
        card.setPadding(ui.dp(12), ui.dp(1), ui.dp(12), ui.dp(1));
        action(ui, card, title, summary, click);
        parent.addView(card, ui.margins(0, 0, 0, 8));
    }

    private static void action(UiKit ui, LinearLayout parent, String title, String summary, View.OnClickListener click) {
        LinearLayout row = new LinearLayout(ui.activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, ui.dp(9), 0, ui.dp(9));
        LinearLayout copy = new LinearLayout(ui.activity);
        copy.setOrientation(LinearLayout.VERTICAL);
        copy.addView(ui.text(title, 12.5f, ui.text, true), ui.wrap());
        copy.addView(ui.text(summary, 11.5f, ui.muted, false), ui.margins(0, 4, 0, 0));
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        row.addView(arrow(ui), new LinearLayout.LayoutParams(ui.dp(18), ui.dp(22)));
        row.setMinimumHeight(ui.dp(54));
        clickable(ui, row, click);
        parent.addView(row, ui.wrap());
    }

    private static ImageView arrow(UiKit ui) {
        ImageView arrow = new ImageView(ui.activity);
        arrow.setImageResource(R.drawable.ic_chevron_right);
        arrow.setColorFilter(ui.muted);
        arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return arrow;
    }

    static void refreshDevice(Activity activity, View hardware) {
        DeviceInfo device=new DeviceInfo(activity);
        String[] keys={"name","model","android","system","launcher"};
        String[] values={device.name,device.model,device.androidVersion,device.systemVersion,device.launcherVersion};
        for(int i=0;i<keys.length;i++) {
            TextView value=hardware.findViewWithTag("device-info:"+keys[i]);
            if(value!=null && !values[i].contentEquals(value.getText())) value.setText(values[i]);
        }
    }

    private static void clickable(UiKit ui, View view, View.OnClickListener click) {
        view.setClickable(true);
        view.setFocusable(true);
        view.setBackground(ui.pressable(ui.round(Color.TRANSPARENT, 12)));
        view.setOnClickListener(click);
    }

    private static void open(Activity activity, String url) {
        try { activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))); }
        catch (ActivityNotFoundException exception) {
            Toast.makeText(activity, "未找到可打开链接的浏览器", Toast.LENGTH_LONG).show();
        }
    }
}
