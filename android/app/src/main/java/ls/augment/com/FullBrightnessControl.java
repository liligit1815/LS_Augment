package ls.augment.com;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;

/** App-owned, coalesced root transport. Never executes su on a UI or Binder caller thread. */
final class FullBrightnessControl {
    private static final String NODE = "/sys/class/backlight/panel0-backlight/";
    private static FullBrightnessControl instance;
    private final Context context;
    private final Handler worker;
    private volatile boolean ready, checked;
    private volatile int selected = -1, applied = -1;
    private volatile String error = "";
    private volatile long generation;
    private long settleGeneration=-1, settleDeadline;
    private String lastObserved="";
    private boolean settled;
    private final Runnable tick = this::apply;
    private FullBrightnessControl(Context context) {
        this.context = context.getApplicationContext();
        HandlerThread thread = new HandlerThread("LSA-FullBrightness"); thread.start(); worker = new Handler(thread.getLooper());
        context.getContentResolver().registerContentObserver(Uri.parse("content://ls.augment.com.config/config"),false,
                new ContentObserver(worker) { @Override public void onChange(boolean self) {
                    if (!enabled()) release(true);
                }});
        worker.post(this::probe);
    }
    static synchronized FullBrightnessControl get(Context context) {
        if (instance == null) instance = new FullBrightnessControl(context);
        return instance;
    }
    private boolean enabled() { return new AppConfig(context).getBoolean(BrightnessRange.ENABLED); }
    private void probe() {
        if (!BrightnessRange.supportedDevice(Build.DEVICE, Build.MODEL)) {
            error = "此机型尚未验证完整亮度范围"; checked = true; return;
        }
        RootShell.Result result = RootShell.run("cat " + NODE + "max_brightness",null,4,256);
        ready = result.isSuccess() && "8190".equals(result.output.trim()); checked = true;
        error = ready ? "" : "未取得 Root 或屏幕驱动不匹配";
    }
    Bundle call(String method, Bundle extras) {
        if ("brightness_select".equals(method)) {
            if (extras == null || extras.size()!=1 || !(extras.get("position") instanceof Integer)) return snapshot(false);
            int next = extras.getInt("position",-1);
            if (next < 0 || next > BrightnessRange.SLIDER_MAX || !ready || !enabled() || automatic()) return snapshot(false);
            generation++; selected = next; error = "";
            worker.removeCallbacks(tick);
            worker.postDelayed(tick,75);
            context.getContentResolver().notifyChange(Uri.parse("content://ls.augment.com.config/brightness"),null);
        } else if (!"brightness_read".equals(method) || extras != null) return snapshot(false);
        return snapshot(true);
    }
    private Bundle snapshot(boolean ok) {
        Bundle b = new Bundle(); b.putBoolean("ok",ok); b.putBoolean("ready",ready);
        b.putBoolean("checked",checked); b.putBoolean("enabled",enabled());
        b.putInt("selected",selected); b.putInt("applied",applied); b.putString("error",error); return b;
    }
    private boolean automatic() { return Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,0)!=0; }
    private void apply() {
        int position = selected;
        if (position < 0) return;
        PowerManager power = context.getSystemService(PowerManager.class);
        if (!enabled() || automatic() || power == null || !power.isInteractive()
                || power.isPowerSaveMode() || power.getCurrentThermalStatus() >= PowerManager.THERMAL_STATUS_MODERATE) {
            release(power != null && power.isInteractive()); return;
        }
        if (!BrightnessRange.extended(position)) {
            if (applied > 0) restoreNative();
            applied = -1; return;
        }
        long token = generation;
        int value = BrightnessRange.driver(position);
        if(settleGeneration!=token){settleGeneration=token;settleDeadline=SystemClock.uptimeMillis()+5000;lastObserved="";settled=false;}
        if(!settled) {
            RootShell.Result observed=RootShell.run("cat "+NODE+"brightness",null,3,256);
            if(generation!=token)return;
            String now=observed.output.trim();
            if(observed.isSuccess() && !now.equals(lastObserved) && !now.equals(String.valueOf(value))
                    && SystemClock.uptimeMillis()<settleDeadline) {
                lastObserved=now;worker.postDelayed(tick,150);return;
            }
            settled=true;
        }
        RootShell.Result result = RootShell.run("v=$(cat " + NODE + "brightness) || exit 1; "
                + "if [ \"$v\" != \""+value+"\" ]; then echo "+value+" > "+NODE+"brightness || exit 1; fi; cat "
                + NODE + "brightness",null,3,256);
        if (generation != token) {
            // A normal drag may have landed while su was in flight. Reconcile with
            // the *current* native setting, never write a captured stale boundary.
            if (selected >= 0 && !BrightnessRange.extended(selected)) restoreNative();
            return;
        }
        if (result.isSuccess() && !String.valueOf(value).equals(result.output.trim())) {
            // The OEM animation can overwrite the first write while the finger
            // exits its native range. Allow a bounded settle interval.
            if(SystemClock.uptimeMillis()<settleDeadline){settled=false;lastObserved="";worker.postDelayed(tick,150);return;}
        }
        if (!result.isSuccess() || !String.valueOf(value).equals(result.output.trim())) {
            error = "Root 亮度写入失败，已回到原厂范围"; selected = -1; applied = -1; restoreNative(); return;
        }
        applied = value;
        worker.postDelayed(tick,500);
    }
    private void release(boolean restore) {
        boolean wasExtended = selected >= 0 && BrightnessRange.extended(selected);
        generation++; selected = -1; applied = -1; worker.removeCallbacks(tick);
        if (restore && wasExtended) restoreNative();
    }
    private void restoreNative() {
        int setting = Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS,219);
        float value = setting>=219 ? 0.8584f : setting<=2 ? 0.0039196345f : (setting-1)/254f;
        // Repeating the same framework value can be a no-op after a direct driver
        // override. A tiny temporary change forces the OEM to restore its own curve.
        float nearby = value > 0.004f ? value-0.0001f : value+0.0001f;
        RootShell.run("cmd display set-brightness " + Float.toString(nearby)
                + "; cmd display set-brightness " + Float.toString(value),null,3,256);
    }
}
