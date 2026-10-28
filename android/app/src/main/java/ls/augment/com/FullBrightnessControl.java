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
    private volatile String driverMaximum="",probeState="not_checked";
    private volatile long probeAt;
    private boolean probeQueued;
    private int probeFailures;
    private volatile long generation;
    private volatile int calibratedMin, calibratedMax, physicalMax;
    private volatile long observationGeneration;
    private final android.content.SharedPreferences calibration;
    private long settleGeneration=-1, settleDeadline;
    private String lastObserved="";
    private boolean settled;
    private final Runnable tick = this::apply;
    private FullBrightnessControl(Context context) {
        this.context = context.getApplicationContext();
        calibration = this.context.getSharedPreferences("brightness_calibration", Context.MODE_PRIVATE);
        HandlerThread thread = new HandlerThread("LSA-FullBrightness"); thread.start(); worker = new Handler(thread.getLooper());
        context.getContentResolver().registerContentObserver(Uri.parse("content://ls.augment.com.config/config"),false,
                new ContentObserver(worker) { @Override public void onChange(boolean self) {
                    if (!enabled()) release(true); else requestProbe(true);
                }});
        requestProbe(true);
    }
    static synchronized FullBrightnessControl get(Context context) {
        if (instance == null) instance = new FullBrightnessControl(context);
        return instance;
    }
    private boolean enabled() { return new AppConfig(context).getBoolean(BrightnessRange.ENABLED); }
    private synchronized void requestProbe(boolean explicit){
        if(probeQueued||ready)return;
        long cooldown=Math.min(60_000L,5_000L*Math.max(1,probeFailures));
        if(!explicit&&checked&&SystemClock.uptimeMillis()-probeAt<cooldown)return;
        probeQueued=true;
        worker.post(()->{try{probe();probeAt=SystemClock.uptimeMillis();probeFailures=ready?0:probeFailures+1;
            context.getContentResolver().notifyChange(Uri.parse("content://ls.augment.com.config/brightness"),null);
        }finally{synchronized(this){probeQueued=false;}}});
    }
    private void probe() {
        RootShell.Result result = RootShell.run("cat " + NODE + "max_brightness",null,4,256);
        // Eligibility follows the actual phone interface, never its marketing model.
        // The calibrated driver values must not be sent to a different range.
        driverMaximum=result.isSuccess()?result.output.trim():"";
        try { physicalMax = Integer.parseInt(driverMaximum); } catch (NumberFormatException invalid) { physicalMax = 0; }
        String identity = android.os.Build.FINGERPRINT + "|" + NODE + "|" + physicalMax;
        if (!identity.equals(calibration.getString("identity", ""))) {
            calibratedMin = calibratedMax = 0;
        } else {
            calibratedMin = calibration.getInt("minimum", 0); calibratedMax = calibration.getInt("maximum", 0);
        }
        if (physicalMax == BrightnessRange.DRIVER_MAX) {
            calibratedMin = BrightnessRange.NATIVE_MIN; calibratedMax = BrightnessRange.NATIVE_MAX;
        }
        ready = result.isSuccess() && BrightnessRange.calibrated(calibratedMin, calibratedMax, physicalMax);
        probeState=ready?"ready":!result.isSuccess()?"root_or_node_read_failed":driverMaximum.matches("[0-9]+")?"uncalibrated_driver_range":"invalid_driver_value";
        error = ready ? "" : !result.isSuccess()?"Root 或屏幕驱动读取失败，稍后自动重试；保持原厂亮度条"
                :calibrationHelp();
        checked = true;
    }
    Bundle call(String method, Bundle extras) {
        if(enabled()&&!ready)requestProbe(false);
        if ("brightness_observe".equals(method)) {
            if (extras == null || extras.size() != 1 || !(extras.get("endpoint") instanceof Integer)) return snapshot(false);
            int endpoint = extras.getInt("endpoint", -1);
            long token = ++observationGeneration; // Every new native drag cancels an in-flight endpoint observation.
            if (endpoint < 0) return snapshot(true);
            if (endpoint > 1 || ready || !enabled() || !safe() || physicalMax <= 0) return snapshot(false);
            float setting = nativeSetting();
            if (!Float.isFinite(setting)) return snapshot(false);
            worker.postDelayed(() -> observe(endpoint, token, setting, -1, 0), 700);
        } else if ("brightness_select".equals(method)) {
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
        b.putInt("selected",selected); b.putInt("applied",applied); b.putString("error",error);
        b.putString("probeState",probeState);b.putString("driverMaximum",driverMaximum);
        b.putInt("nativeMinimum",calibratedMin);b.putInt("nativeMaximum",calibratedMax);b.putInt("physicalMaximum",physicalMax);
        b.putString("node",NODE);return b;
    }
    private boolean automatic() { return Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,0)!=0; }
    private boolean safe() {
        PowerManager power = context.getSystemService(PowerManager.class);
        return !automatic() && power != null && power.isInteractive() && !power.isPowerSaveMode()
                && power.getCurrentThermalStatus() < PowerManager.THERMAL_STATUS_MODERATE;
    }
    private float nativeSetting() { return Settings.System.getFloat(context.getContentResolver(), "screen_brightness_float", Float.NaN); }
    private String calibrationHelp() {
        return "待标定：关闭自动亮度，将原厂亮度条分别拖到最低和最高并各停留 2 秒；已记录"
                + (calibratedMin > 0 ? "最低" : "") + (calibratedMax > 0 ? "最高" : "") + "；完成前保持原厂亮度条";
    }
    private void observe(int endpoint, long token, float setting, int previous, int attempts) {
        if (token != observationGeneration || ready || !enabled() || !safe() || nativeSetting() != setting) return;
        RootShell.Result reading = RootShell.run("cat " + NODE + "max_brightness " + NODE + "brightness", null, 3, 256);
        int value;
        try {
            String[] parts = reading.output.trim().split("\\s+");
            if (!reading.isSuccess() || parts.length != 2 || Integer.parseInt(parts[0]) != physicalMax) return;
            value = Integer.parseInt(parts[1]);
        } catch (NumberFormatException malformed) { return; }
        if (token != observationGeneration || !safe() || nativeSetting() != setting || value <= 0 || value > physicalMax) return;
        if (value != previous) {
            if (attempts < 8) worker.postDelayed(() -> observe(endpoint, token, setting, value, attempts + 1), 250);
            return;
        }
        if (endpoint == 0) calibratedMin = value; else calibratedMax = value;
        calibration.edit().putString("identity", android.os.Build.FINGERPRINT + "|" + NODE + "|" + physicalMax)
                .putInt("minimum", calibratedMin).putInt("maximum", calibratedMax).apply();
        ready = BrightnessRange.calibrated(calibratedMin, calibratedMax, physicalMax);
        probeState = ready ? "ready_measured_endpoints" : "calibration_incomplete";
        error = ready ? "" : calibrationHelp();
        context.getContentResolver().notifyChange(Uri.parse("content://ls.augment.com.config/brightness"), null);
    }
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
        if (!ready || !BrightnessRange.calibrated(calibratedMin, calibratedMax, physicalMax)) { release(true); return; }
        int value = BrightnessRange.driver(position, calibratedMax, physicalMax);
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
            ready=false;probeState="write_or_readback_failed";probeAt=SystemClock.uptimeMillis();probeFailures=1;
            error = "Root 亮度写入或读回失败，已释放扩展请求"; selected = -1; applied = -1; restoreNative(); return;
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
        // BrightnessSynchronizer's float setting is the native source of truth on
        // this ROM. The integer fallback uses its documented 1..255 conversion.
        float value=Settings.System.getFloat(context.getContentResolver(),"screen_brightness_float",Float.NaN);
        if(!Float.isFinite(value)||value<0||value>1){
            int setting=Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS,128);
            value=Math.max(0,Math.min(1,(setting-1)/254f));
        }
        // Repeating the same framework value can be a no-op after a direct driver
        // override. A tiny temporary change forces the OEM to restore its own curve.
        float nearby = value > 0.004f ? value-0.0001f : value+0.0001f;
        RootShell.run("cmd display set-brightness " + Float.toString(nearby)
                + "; cmd display set-brightness " + Float.toString(value),null,3,256);
    }
}
