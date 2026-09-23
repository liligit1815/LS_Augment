package ls.augment.regression.game;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Disposable, local-only targets for actual OEM recognition and macro playback. */
public final class GameActivity extends Activity {
    private final int[] down = new int[2];
    private final int[] up = new int[2];
    private TextView status;
    private Button templateTarget;
    private final Handler sceneHandler = new Handler(Looper.getMainLooper());
    private long started;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_FULLSCREEN);
        started = SystemClock.elapsedRealtime();
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setGravity(Gravity.CENTER);
        root.setPadding(dp(12), dp(8), dp(12), dp(12));
        root.setBackgroundColor(0xffedf4ff);
        TextView title = new TextView(this);
        title.setText("LS 游戏验收 · 实际点击计数");
        title.setTextSize(18);
        title.setGravity(Gravity.CENTER);
        root.addView(title, new LinearLayout.LayoutParams(-1, -2));
        LinearLayout targets = new LinearLayout(this);
        targets.setGravity(Gravity.CENTER);
        for (int i = 0; i < 2; i++) {
            final int index = i;
            Button target = new Button(this);
            if (i == 0) templateTarget = target;
            target.setText(i == 0 ? "目标 A" : "目标 B");
            target.setTextSize(24);
            target.setTextColor(0xffffffff);
            target.setBackgroundTintList(android.content.res.ColorStateList.valueOf(i == 0 ? 0xff126cc5 : 0xffb13950));
            target.setContentDescription(i == 0 ? "目标 A" : "目标 B");
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(80), 1);
            lp.setMargins(dp(6), dp(6), dp(6), dp(6));
            targets.addView(target, lp);
            target.setOnTouchListener((view, event) -> {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) down[index]++;
                else if (action == MotionEvent.ACTION_UP) up[index]++;
                else if (action != MotionEvent.ACTION_CANCEL) return true;
                android.util.Log.i("LSA-GameValidation", "target=" + index + ";action=" + action
                        + ";eventTime=" + event.getEventTime() + ";now=" + SystemClock.elapsedRealtime()
                        + ";down=" + down[index] + ";up=" + up[index]
                        + ";x=" + event.getRawX() + ";y=" + event.getRawY());
                render();
                return true;
            });
        }
        root.addView(targets, new LinearLayout.LayoutParams(-1, 0, 1));
        status = new TextView(this);
        status.setGravity(Gravity.CENTER);
        status.setTextSize(18);
        root.addView(status, new LinearLayout.LayoutParams(-1, -2));
        render();
        setContentView(root);
        applySceneIntent(getIntent());
        android.util.Log.i("LSA-GameValidation", "session=" + started + ";package=" + getPackageName());
    }

    @Override protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        applySceneIntent(intent);
    }

    @Override protected void onDestroy() {
        sceneHandler.removeCallbacksAndMessages(null);
        super.onDestroy();
    }

    private void applySceneIntent(Intent intent) {
        if (intent == null || !intent.hasExtra("template_mode")) return;
        sceneHandler.removeCallbacksAndMessages(null);
        setScene(intent.getStringExtra("template_mode"));
        int reveal = intent.getIntExtra("reveal_after_ms", 0);
        if (reveal > 0 && reveal <= 60000) sceneHandler.postDelayed(() -> setScene("normal"), reveal);
    }

    private void setScene(String mode) {
        templateTarget.setVisibility("hidden".equals(mode) ? View.INVISIBLE : View.VISIBLE);
        templateTarget.setText("blank".equals(mode) ? "" : "alternate".equals(mode) ? "目标 B" : "目标 A");
        templateTarget.setBackgroundTintList(android.content.res.ColorStateList.valueOf(
                "alternate".equals(mode) ? 0xffb13950 : 0xff126cc5));
        android.util.Log.i("LSA-GameValidation", "scene=" + mode + ";now=" + SystemClock.elapsedRealtime());
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private void render() {
        status.setText("A：按下 " + down[0] + " / 松开 " + up[0]
                + "    B：按下 " + down[1] + " / 松开 " + up[1]);
    }
}
