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
            View.OnClickListener onSystemVersionTap, Runnable checkUpdate) {
        DeviceInfo device = new DeviceInfo(activity);
        LinearLayout hardware = group(ui, parent, "当前设备");
        hardware.setTag("about-device-card");
        row(ui, hardware, "设备型号", device.model, "model");
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
        row(ui, hardware, "Android 版本", device.androidVersion, "android");
        row(ui, hardware, "红魔Duo版本", BuildConfig.VERSION_NAME, "module");
        android.widget.Button update=ui.tonalButton("检查更新");
        update.setTag("about-check-update");update.setOnClickListener(v->checkUpdate.run());
        hardware.addView(update,ui.margins(0,8,0,2));

        LinearLayout community=ui.card();community.setPadding(ui.dp(12),0,ui.dp(12),0);
        community.setTag("about-developer-profile");
        action(ui,community,"开发者","liligit1815",view->open(activity,REPOSITORY));
        community.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        action(ui,community,"贡献者","",view->activity.startActivity(new Intent(activity,ContributorsActivity.class)));
        community.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        action(ui,community,"支持","",view->activity.startActivity(new Intent(activity,SupportActivity.class)));
        parent.addView(community,ui.margins(0,0,0,12));

        LinearLayout legal = ui.card();
        legal.setTag("about-legal-card");
        legal.setPadding(ui.dp(12), ui.dp(1), ui.dp(12), ui.dp(1));
        action(ui, legal, "用户协议", "", view -> ModuleLegal.showTerms(activity, ui));
        legal.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));
        action(ui, legal, "隐私政策", "", view -> ModuleLegal.showPrivacy(activity, ui));
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
        LinearLayout row=new LinearLayout(ui.activity);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(ui.dp(48));
        row.addView(ui.text(label,14,ui.text,false),new LinearLayout.LayoutParams(-2,-2));
        TextView content=ui.text(value,12,ui.muted,false);content.setGravity(Gravity.END);content.setTag("device-info:"+key);
        LinearLayout.LayoutParams text=new LinearLayout.LayoutParams(0,-2,1);text.leftMargin=ui.dp(12);row.addView(content,text);
        parent.addView(row,ui.wrap());return row;
    }

    private static void single(UiKit ui, LinearLayout parent, String title, String summary, View.OnClickListener click) {
        LinearLayout card = ui.card();
        card.setPadding(ui.dp(12), ui.dp(1), ui.dp(12), ui.dp(1));
        action(ui, card, title, summary, click);
        parent.addView(card, ui.margins(0, 0, 0, 8));
    }

    private static void action(UiKit ui, LinearLayout parent, String title, String summary, View.OnClickListener click) {
        LinearLayout row = ui.groupRow();
        row.setPadding(0, ui.dp(4), 0, ui.dp(4));
        ImageView icon=new ImageView(ui.activity);
        if("开发者".equals(title)){icon.setImageResource(R.drawable.avatar_liligit1815);icon.setBackground(ui.round(Color.TRANSPARENT,20));icon.setClipToOutline(true);}
        else icon.setImageDrawable(new GlassIcon("贡献者".equals(title)?"people":"支持".equals(title)?"heart":"用户协议".equals(title)?"document":"shield",ui.accent));
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);row.addView(icon,new LinearLayout.LayoutParams(ui.dp(26),ui.dp(26)));
        TextView label=ui.text(title,15,ui.text,true);LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,-2,1);lp.leftMargin=ui.dp(14);row.addView(label,lp);
        if(!summary.isEmpty())row.addView(ui.text(summary,12,ui.muted,false),new LinearLayout.LayoutParams(-2,-2));
        row.addView(arrow(ui), new LinearLayout.LayoutParams(ui.dp(18), ui.dp(22)));
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
