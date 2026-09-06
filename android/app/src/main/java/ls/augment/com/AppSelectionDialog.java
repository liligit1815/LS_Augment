package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.function.Consumer;

/** Searchable multi-select with package enumeration off the UI thread. */
final class AppSelectionDialog {
    private AppSelectionDialog() { }
    static void show(Activity activity, UiKit ui, String title,
            String initial, Consumer<String> onSave) {
        Set<String> selected = new TreeSet<>(AppPackageSet.parse(initial));
        Set<String> initialSelection = new TreeSet<>(selected);
        ArrayList<Item> items = new ArrayList<>(), visible = new ArrayList<>();
        LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(ui.dp(14), 0, ui.dp(14), 0);
        EditText search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("搜索应用名称或包名");
        body.addView(search, new LinearLayout.LayoutParams(-1, -2));
        ListView list = new ListView(activity);
        list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        body.addView(list, new LinearLayout.LayoutParams(-1, ui.dp(330)));
        Runnable render = () -> {
            String query = search.getText().toString().trim().toLowerCase(Locale.ROOT);
            visible.clear();
            ArrayList<String> labels = new ArrayList<>();
            for (Item item : items) {
                if (!query.isEmpty() && !item.label.toLowerCase(Locale.ROOT).contains(query)
                        && !item.pkg.toLowerCase(Locale.ROOT).contains(query)) continue;
                visible.add(item);
                labels.add(item.label + "\n" + item.pkg);
            }
            list.setAdapter(new ArrayAdapter<>(activity,
                    android.R.layout.simple_list_item_multiple_choice, labels));
            list.clearChoices();
            for (int i = 0; i < visible.size(); i++) {
                list.setItemChecked(i, selected.contains(visible.get(i).pkg));
            }
        };
        list.setOnItemClickListener((parent, view, position, id) -> {
            String pkg = visible.get(position).pkg;
            if (list.isItemChecked(position)) selected.add(pkg); else selected.remove(pkg);
        });
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { render.run(); }
            @Override public void afterTextChanged(Editable value) { }
        });
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle(title).setView(body)
                .setNegativeButton("取消", null).setNeutralButton("清空选择", null)
                .setPositiveButton("确定", (ignored, which) -> onSave.accept(String.join(";", selected)))
                .create();
        dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_NEUTRAL)
                .setOnClickListener(view -> { selected.clear(); render.run(); }));
        dialog.show();
        new Thread(() -> {
            ArrayList<Item> discovered = new ArrayList<>();
            try {
                PackageManager pm = activity.getPackageManager();
                for (ApplicationInfo info : pm.getInstalledApplications(0)) {
                    if (!info.enabled || (info.flags & ApplicationInfo.FLAG_INSTALLED) == 0) continue;
                    if (pm.getLaunchIntentForPackage(info.packageName) == null
                            && !initialSelection.contains(info.packageName)) continue;
                    discovered.add(new Item(info.packageName, String.valueOf(pm.getApplicationLabel(info))));
                }
                discovered.sort(Comparator.comparing((Item item) -> item.label,
                        String.CASE_INSENSITIVE_ORDER).thenComparing(item -> item.pkg));
                activity.runOnUiThread(() -> {
                    if (activity.isFinishing() || !dialog.isShowing()) return;
                    items.addAll(discovered);
                    render.run();
                });
            } catch (RuntimeException error) {
                activity.runOnUiThread(() -> Toast.makeText(activity,
                        "无法读取应用列表，请重试", Toast.LENGTH_SHORT).show());
            }
        }, "LSA-AppSelection").start();
    }
    private static final class Item {
        final String pkg, label;
        Item(String pkg, String label) { this.pkg = pkg; this.label = label; }
    }
}
