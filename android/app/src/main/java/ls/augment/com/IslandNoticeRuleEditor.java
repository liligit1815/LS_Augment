package ls.augment.com;

import android.app.Activity;
import android.os.Process;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.function.Consumer;
import java.util.function.Supplier;
import org.json.JSONObject;

final class IslandNoticeRuleEditor {
    private final Activity activity;
    private final UiKit ui;
    private final Supplier<String> value;
    private final Consumer<String> change;
    private final LinearLayout content;
    private final int user = Process.myUid() / 100000;
    private final Map<String,String> channels = new TreeMap<>();
    private String pkg = "", status = "";
    private int request;

    IslandNoticeRuleEditor(Activity activity, UiKit ui, Supplier<String> value, Consumer<String> change) {
        this.activity = activity;
        this.ui = ui;
        this.value = value;
        this.change = change;
        content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        render();
    }

    View view() { return content; }

    private void load(String selected) {
        pkg = selected;
        channels.clear();
        status = "正在读取应用已创建的通知渠道…";
        int generation = ++request;
        render();
        new Thread(() -> {
            Map<String,String> found = new TreeMap<>();
            String message;
            try {
                JSONObject result = IslandNoticeChannels.read(activity, selected);
                result.keys().forEachRemaining(id -> found.put(id, result.optString(id, id)));
                message = found.isEmpty() ? "此应用尚未创建通知渠道。" : "";
            } catch (Exception unavailable) {
                android.util.Log.w("DuoNoticeChannels", "Channel inventory unavailable", unavailable);
                message = "未能读取系统渠道，可重新选择应用重试。已保存的规则仍可编辑。";
            }
            String summary = message;
            activity.runOnUiThread(() -> {
                if (generation != request || activity.isFinishing() || activity.isDestroyed()) return;
                channels.putAll(found);
                status = summary;
                render();
            });
        }, "Duo-NotificationChannels").start();
    }

    void render() {
        content.removeAllViews();
        IslandNoticeRules rules = IslandNoticeRules.parse(value.get());
        if (rules == null) return;
        TreeSet<String> known = new TreeSet<>();
        Map<String,String> visible = new TreeMap<>(channels);
        for (String key : rules.keys()) {
            String[] parts = key.split("\\|", -1);
            if (!String.valueOf(user).equals(parts[0])) continue;
            known.add(parts[1]);
            if (parts[1].equals(pkg) && !parts[2].isEmpty()) {
                String[] channel = IslandNoticeRules.parts(key);
                if (channel != null) visible.putIfAbsent(channel[2], channel[2]);
            }
        }
        Button pick = ui.textButton(pkg.isEmpty() ? "选择通知应用" : "更换通知应用");
        pick.setOnClickListener(v -> AppSelectionDialog.pick(activity, ui, String.join(";", known), this::load));
        content.addView(pick, ui.wrap());
        if (pkg.isEmpty()) return;
        String label = pkg;
        try { label = activity.getPackageManager().getApplicationLabel(
                activity.getPackageManager().getApplicationInfo(pkg, 0)).toString(); }
        catch (android.content.pm.PackageManager.NameNotFoundException ignored) { }
        addRule(label + " · 应用默认", IslandNoticeRules.app(user, pkg), false, rules);
        if (!status.isEmpty()) content.addView(ui.text(status, 12, ui.muted, false), ui.wrap());
        java.util.Set<String> labels=new java.util.HashSet<>(), duplicates=new java.util.HashSet<>();
        for(String name:visible.values()) if(!labels.add(name)) duplicates.add(name);
        for (Map.Entry<String,String> row : visible.entrySet()) {
            String name=duplicates.contains(row.getValue())?row.getValue()+" ("+row.getKey()+")":row.getValue();
            addRule(name, IslandNoticeRules.channel(user, pkg, row.getKey()), true, rules);
        }
    }

    private void addRule(String title, String key, boolean channel, IslandNoticeRules rules) {
        String[] labels = {channel ? "跟随应用" : "跟随全局", "关闭上岛", "只显示胶囊", "首次自动展开"};
        Button button = ui.textButton(title + " · " + labels[rules.mode(key)]);
        button.setTag("notice-rule:" + key);
        button.setOnClickListener(v -> ui.choiceDialog(title, labels, null, choice -> {
            if (!content.isShown() || activity.isDestroyed()) return;
            IslandNoticeRules current = IslandNoticeRules.parse(value.get());
            String next = current == null ? null : current.updated(key, choice);
            if (next == null) {
                Toast.makeText(activity, "规则已达容量上限，请将不用的项目设为跟随", Toast.LENGTH_SHORT).show();
                return;
            }
            change.accept(next);
            render();
        }));
        content.addView(button, ui.wrap());
    }
}
