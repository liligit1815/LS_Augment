package ls.augment.com;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.widget.TextView;
import org.json.JSONArray;
import org.json.JSONObject;

/** Disposable self-instrumenting APK. No production permissions or test notifications. */
public final class IndependentNotificationFixture extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle args) { this.args = args; start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Context context = getTargetContext();
            String run = args.getString("run", "");
            if (!run.matches("[a-z0-9]{8,40}")) throw new IllegalArgumentException("Expected run token");
            String tag = "duo_independent_" + run;
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            String op = args.getString("op", "state");
            if (op.equals("cleanup")) {
                for (int id = 100; id < 106; id++) manager.cancel(tag, id);
                manager.cancel(tag, 200);
                manager.deleteNotificationChannel(tag);
            } else if (op.equals("post") || op.equals("update")) {
                if (!manager.areNotificationsEnabled()) throw new IllegalStateException("Notification permission required");
                NotificationChannel channel = new NotificationChannel(tag, "Duo 独立通知验证", NotificationManager.IMPORTANCE_DEFAULT);
                channel.setSound(null, null); channel.enableVibration(false);
                manager.createNotificationChannel(channel);
                boolean grouped = args.getString("group", "explicit").equals("explicit");
                for (int id = 100; id < 106; id++) {
                    if (op.equals("update") && id != 101) continue;
                    String title = "Duo 独立通知 " + id + (op.equals("update") ? " 已更新" : "");
                    Notification.Builder builder = new Notification.Builder(context, tag)
                            .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle(title)
                            .setContentText("本条可独立打开、展开、操作和清除。编号 " + id)
                            .setStyle(new Notification.BigTextStyle().bigText("独立通知 " + id + " 的展开内容。\n正文操作和按钮只应影响本条通知。\n此卡仅用于本次临时验证。"))
                            .setContentIntent(pending(context, run, id, false))
                            .addAction(new Notification.Action.Builder(null, "操作 " + id, pending(context, run, id, true)).build())
                            .setVisibility(Notification.VISIBILITY_PUBLIC).setOnlyAlertOnce(true).setAutoCancel(false);
                    if (grouped) builder.setGroup(tag + ".group").setGroupSummary(false);
                    manager.notify(tag, id, builder.build());
                }
                if (grouped && op.equals("post")) manager.notify(tag, 200, new Notification.Builder(context, tag)
                        .setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("Duo 六条通知摘要")
                        .setContentText("展开查看六条真实子通知").setGroup(tag + ".group").setGroupSummary(true)
                        .setOnlyAlertOnce(true).build());
            }
            JSONArray active = new JSONArray();
            for (android.service.notification.StatusBarNotification n : manager.getActiveNotifications())
                if (tag.equals(n.getTag())) active.put(new JSONObject().put("id", n.getId())
                        .put("key", n.getKey()).put("summary", (n.getNotification().flags & Notification.FLAG_GROUP_SUMMARY) != 0)
                        .put("group", n.getGroupKey()));
            JSONObject proof = new JSONObject(context.getSharedPreferences("proof", 0).getAll());
            result.putString("result", new JSONObject().put("run", run).put("active", active).put("proof", proof).toString());
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("error", android.util.Log.getStackTraceString(error)); finish(0, result);
        }
    }
    private PendingIntent pending(Context c, String run, int id, boolean action) {
        Intent intent = new Intent(c, action ? ActionReceiver.class : ContentActivity.class)
                .setData(android.net.Uri.parse("duo-independent://" + run + "/" + id + "/" + action))
                .putExtra("run", run).putExtra("id", id);
        return action ? PendingIntent.getBroadcast(c, id, intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE)
                : PendingIntent.getActivity(c, id, intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }
    static void count(Context c, Intent intent, String kind) {
        String run = intent.getStringExtra("run"); int id = intent.getIntExtra("id", -1);
        if (run == null || !run.matches("[a-z0-9]{8,40}") || id < 100 || id >= 106) return;
        SharedPreferences prefs = c.getSharedPreferences("proof", 0);
        String key = run + ":" + kind + ":" + id;
        prefs.edit().putInt(key, prefs.getInt(key, 0) + 1).commit();
    }
    public static final class ActionReceiver extends BroadcastReceiver {
        @Override public void onReceive(Context c, Intent intent) { count(c, intent, "action"); }
    }
    public static final class ContentActivity extends Activity {
        @Override public void onCreate(Bundle saved) {
            super.onCreate(saved);
            if (saved == null) count(this, getIntent(), "content");
            TextView text = new TextView(this); text.setText("已打开独立通知 " + getIntent().getIntExtra("id", -1));
            text.setTextSize(24); text.setPadding(32, 80, 32, 32); setContentView(text);
        }
    }
}
