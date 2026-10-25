package ls.augment.com;

import android.app.Activity;
import android.app.StatusBarManager;
import android.content.ComponentName;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.widget.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** QS long press opens a compact floating intensity slider. */
public final class ExtraDimActivity extends Activity {
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private Switch enabled;
    private SeekBar slider;
    private TextView status;
    private UiKit.Fold intensityFold;
    private boolean rendering;
    private volatile int revision;
    private final Runnable save = this::submit;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        ComponentName tile=getIntent().getParcelableExtra(android.content.Intent.EXTRA_COMPONENT_NAME,ComponentName.class);
        if(tile!=null&&!ExtraDimTileService.class.getName().equals(tile.getClassName())) {
            startActivity(new android.content.Intent(this,SettingsActivity.class));finish();return;
        }
        UiKit ui=new UiKit(this);
        LiquidGlassLayout surface=new LiquidGlassLayout(ui,4);surface.setTag("liquid-glass-dialog");
        surface.setOrientation(LinearLayout.VERTICAL);surface.setPadding(ui.dp(22),ui.dp(20),ui.dp(22),ui.dp(20));
        LinearLayout panel = new LinearLayout(this); panel.setOrientation(LinearLayout.VERTICAL);
        surface.addView(panel,ui.wrap());
        enabled = new Switch(this); enabled.setChecked(ExtraDimControl.active(this));
        panel.addView(ui.featureRow("极暗",null,enabled),ui.wrap());
        LinearLayout strengthControls=new LinearLayout(this);strengthControls.setOrientation(LinearLayout.VERTICAL);
        strengthControls.setTag("extra-dim-strength-controls");panel.addView(strengthControls,ui.wrap());
        intensityFold=ui.fold(enabled,strengthControls);
        TextView label = ui.text("",13,ui.text,false); strengthControls.addView(label,ui.margins(0,8,0,0));
        slider = ui.slider(); slider.setMax(100); slider.setProgress(ExtraDimControl.strength(this));
        slider.setContentDescription("极暗强度"); label.setText(label.getContext().getString(R.string.status_extradimactivity_15 ,String.valueOf(slider.getProgress())));
        NumericParameterEditor.linear(ui,slider,"极暗强度",0,1,"%",label);
        slider.setProgressTintList(android.content.res.ColorStateList.valueOf(ui.accent));
        slider.setThumbTintList(android.content.res.ColorStateList.valueOf(ui.accent));
        strengthControls.addView(slider,ui.wrap());
        status = ui.text("强度越高，画面越暗",12,ui.muted,false); panel.addView(status);
        Button add = ui.tonalButton("添加极暗磁贴"); panel.addView(add,ui.margins(0,12,0,0));
        add.setOnClickListener(v -> {
            StatusBarManager manager = getSystemService(StatusBarManager.class);
            if (manager != null) manager.requestAddTileService(new ComponentName(this,ExtraDimTileService.class),
                    "极暗", Icon.createWithResource(this,R.drawable.ic_extra_dim), getMainExecutor(),
                    result -> status.setText(result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ADDED
                            || result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ALREADY_ADDED ? "极暗磁贴已添加" : "未添加磁贴"));
        });
        enabled.setOnCheckedChangeListener((button,on) -> { if (!rendering) {intensityFold.sync();queue();} });
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar bar,int value,boolean fromUser) {
                label.setText(label.getContext().getString(R.string.status_extradimactivity_15 ,String.valueOf(value)));
                if (fromUser && enabled.isChecked()) queue();
            }
            public void onStartTrackingTouch(SeekBar bar) { }
            public void onStopTrackingTouch(SeekBar bar) { main.removeCallbacks(save); submit(); }
        });
        setContentView(surface);
        getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
        getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        getWindow().setDimAmount(ui.dark?.28f:.12f);
        getWindow().setLayout(Math.min(ui.dp(420),getResources().getDisplayMetrics().widthPixels-ui.dp(36)), -2);
        surface.refreshBackdrop();
        enabled.setEnabled(false);slider.setEnabled(false);status.setText("正在读取极暗设置…");
        intensityFold.sync();
        worker.execute(() -> {
            boolean ok=ExtraDimControl.read(this);
            main.post(() -> {
                if(isDestroyed())return;
                rendering=true;enabled.setChecked(ExtraDimControl.active(this));slider.setProgress(ExtraDimControl.strength(this));rendering=false;
                enabled.setEnabled(ok||enabled.isChecked());slider.setEnabled(ok);
                intensityFold.sync();
                status.setText(ok&&ExtraDimControl.message().isEmpty()?"强度越高，画面越暗":ExtraDimControl.message());
            });
        });
    }
    private void queue() { revision++; main.removeCallbacks(save); main.postDelayed(save,120); }
    private void submit() {
        int expected = revision, level = slider.getProgress(); boolean active = enabled.isChecked();
        worker.execute(() -> {
            if (expected != revision) return;
            boolean ok = ExtraDimControl.set(this,active,level);
            String feedback=ExtraDimControl.message();
            boolean readBack=ok||ExtraDimControl.read(this);
            main.post(() -> {
                if (isDestroyed() || expected != revision) return;
                if(!ok){
                    rendering=true;
                    if(readBack){enabled.setChecked(ExtraDimControl.active(this));slider.setProgress(ExtraDimControl.strength(this));}
                    enabled.setEnabled(readBack||enabled.isChecked());slider.setEnabled(readBack);rendering=false;intensityFold.sync();
                }
                status.setText(ok ? "系统色彩变换已应用 · 强度越高，画面越暗" : feedback);
            });
        });
    }
    @Override public void onPause() { if (slider!=null && main.hasCallbacks(save)) { main.removeCallbacks(save); submit(); } super.onPause(); }
    @Override public void onDestroy() { main.removeCallbacks(save); worker.shutdown(); super.onDestroy(); }
}
