package ls.augment.com;

import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;

/** App-owned, coalesced root transport. Never executes su on a UI or Binder caller thread. */
final class FullBrightnessControl {
    private static final String NODE = "/sys/class/backlight/panel0-backlight/";
    // Read the primary controller only. A second display must never supply an endpoint.
    private static final String DISPLAY_STATE = "dumpsys display | awk '"
            + "/^Display Power Controller: *$/{if(primary)exit; block=1; identified=0; next} "
            + "block && /^  mDisplayId=/{if(!identified){primary=($0 ~ /^  mDisplayId=0 *$/); identified=1}} "
            + "primary && /^  mCachedBrightnessInfo\\.(brightness|brightnessMin|brightnessMax|hbmMode|brightnessMaxReason) *=/{print} "
            + "primary && /^  mBrightnessReason=/{print} "
            + "primary && /^  mScreenBrightnessRampAnimator\\.isAnimating\\(\\)=/{print} "
            + "primary && /^  mScreenBrightness=/{print; exit}'";
    private static FullBrightnessControl instance;
    private final Context context;
    private final Handler worker;
    private volatile boolean ready, checked;
    private volatile int selected = -1, applied = -1;
    private volatile String error = "";
    private volatile String driverMaximum="",probeState="not_checked";
    private volatile String endpointObservation="not_observed";
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
        String identity = android.os.Build.FINGERPRINT + "|" + NODE + "|" + physicalMax + "|settled";
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
    synchronized Bundle call(String method, Bundle extras) {
        if(enabled()&&!ready)requestProbe(false);
        if ("brightness_observe".equals(method)) {
            if (extras == null || extras.size() != 1 || !(extras.get("endpoint") instanceof Integer)) return snapshot(false);
            int endpoint = extras.getInt("endpoint", -1);
            long token = ++observationGeneration; // Every new native drag cancels an in-flight endpoint observation.
            if (endpoint < 0) return snapshot(true);
            if (endpoint > 1 || ready || !enabled() || !safe() || physicalMax <= 0) return snapshot(false);
            worker.postDelayed(() -> observe(endpoint, token, -1, 0), 700);
        } else if ("brightness_select".equals(method)) {
            if (extras == null || extras.size()!=1 || !(extras.get("position") instanceof Integer)) return snapshot(false);
            int next = extras.getInt("position",-1);
            if (next < BrightnessRange.sliderMin(calibratedMin) || next > BrightnessRange.sliderMax(calibratedMax,physicalMax) || !ready || !enabled() || automatic()) return snapshot(false);
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
        b.putString("endpointObservation",endpointObservation);
        b.putInt("nativeMinimum",calibratedMin);b.putInt("nativeMaximum",calibratedMax);b.putInt("physicalMaximum",physicalMax);
        b.putString("node",NODE);return b;
    }
    private boolean automatic() { return Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS_MODE,0)!=0; }
    private boolean safe() {
        PowerManager power = context.getSystemService(PowerManager.class);
        return !automatic() && power != null && power.isInteractive() && !power.isPowerSaveMode()
                && power.getCurrentThermalStatus() < PowerManager.THERMAL_STATUS_MODERATE;
    }
    private String calibrationHelp() {
        return "待标定：关闭自动亮度，将原厂亮度条分别拖到最低和最高并各停留 2 秒；已记录"
                + (calibratedMin > 0 ? "最低" : "") + (calibratedMax > 0 ? "最高" : "") + "；完成前保持原厂亮度条";
    }
    private static float number(String value) {
        try { return Float.parseFloat(value); } catch (NumberFormatException invalid) { return Float.NaN; }
    }
    // The OEM commits its display request asynchronously after onStopTrackingTouch.
    // A matching stable sysfs value alone could still be the previous slider position.
    private static int endpointValue(String output,int endpoint,int physicalMax) {
        String[] lines=output.trim().split("\\r?\\n");
        if(lines.length<9)return -1;
        int max,driver;
        try{max=Integer.parseInt(lines[0]);driver=Integer.parseInt(lines[1]);}
        catch(NumberFormatException invalid){return -1;}
        float brightness=Float.NaN,minimum=Float.NaN,maximum=Float.NaN;
        boolean manual=false,settled=false,normalHbm=false,uncapped=false;
        for(int i=2;i<lines.length;i++){
            String[] field=lines[i].trim().split("=",2);
            if(field.length!=2)continue;
            String value=field[1].trim();
            switch(field[0].trim()){
                case "mCachedBrightnessInfo.brightness": brightness=number(value);break;
                case "mCachedBrightnessInfo.brightnessMin": minimum=number(value);break;
                case "mCachedBrightnessInfo.brightnessMax": maximum=number(value);break;
                case "mCachedBrightnessInfo.hbmMode": normalHbm="0".equals(value);break;
                case "mCachedBrightnessInfo.brightnessMaxReason": uncapped="0".equals(value);break;
                case "mBrightnessReason": manual="manual".equals(value);break;
                case "mScreenBrightnessRampAnimator.isAnimating()": settled="false".equals(value);break;
                default: break;
            }
        }
        // OEM integer sliders round the framework range to a 1/254 step.
        float target=endpoint==0?minimum:maximum;
        return max==physicalMax && driver>0 && driver<=max && normalHbm && uncapped && settled && manual
                && minimum>=0 && maximum<=1 && maximum>minimum && Math.abs(target-brightness)<=1f/254f
                ?driver:-1;
    }
    private void observe(int endpoint,long token,int previous,int attempts) {
        if(token!=observationGeneration || ready || !enabled() || !safe())return;
        RootShell.Result reading=RootShell.run("cat "+NODE+"max_brightness "+NODE+"brightness && "+DISPLAY_STATE,null,5,2048);
        int value=reading.isSuccess()?endpointValue(reading.output,endpoint,physicalMax):-1;
        synchronized(this){
            if(token!=observationGeneration || ready || !enabled() || !safe())return;
            endpointObservation="endpoint="+endpoint+";attempt="+attempts+";read="+reading.isSuccess()+";accepted="+(value>0)+";"+endpointEvidence(reading.output);
            if(value<=0 || value!=previous){
                if(attempts<50)worker.postDelayed(()->observe(endpoint,token,value,attempts+1),value>0?250:600);
                else {
                    probeState="endpoint_not_confirmed";
                    error="未确认原厂手动亮度端点，请在亮屏并关闭自动亮度后重新拖到端点";
                }
                return;
            }
            if(endpoint==0)calibratedMin=value;else calibratedMax=value;
            calibration.edit().putString("identity",android.os.Build.FINGERPRINT+"|"+NODE+"|"+physicalMax+"|settled")
                    .putInt("minimum",calibratedMin).putInt("maximum",calibratedMax).apply();
            ready=BrightnessRange.calibrated(calibratedMin,calibratedMax,physicalMax);
            probeState=ready?"ready_measured_endpoints":"calibration_incomplete";
            error=ready?"":calibrationHelp();
        }
        context.getContentResolver().notifyChange(Uri.parse("content://ls.augment.com.config/brightness"),null);
    }
    private static String endpointEvidence(String output){
        String[] lines=output.trim().split("\\r?\\n");StringBuilder evidence=new StringBuilder();
        for(int i=0;i<lines.length&&evidence.length()<768;i++){
            String line=lines[i].trim();
            if(i<2){evidence.append(i==0?"physical=":"driver=").append(line.matches("[0-9]{1,8}")?line:"unknown").append(';');continue;}
            String[] pair=line.split("=",2);if(pair.length!=2)continue;
            String key=pair[0].trim(),value=pair[1].trim();
            if((key.matches("mCachedBrightnessInfo\\.(brightness|brightnessMin|brightnessMax|hbmMode|brightnessMaxReason)")
                    ||key.equals("mBrightnessReason")||key.equals("mScreenBrightnessRampAnimator.isAnimating()"))
                    &&value.matches("[A-Za-z0-9_.+-]{1,40}"))evidence.append(key).append('=').append(value).append(';');
        }
        return evidence.toString();
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
        float value=Float.NaN;
        if (physicalMax != BrightnessRange.DRIVER_MAX && !automatic()) {
            // ROMs that commit through DisplayManager may leave the settings mirror stale.
            RootShell.Result display=RootShell.run(DISPLAY_STATE,null,5,2048);
            if (display.isSuccess()) for (String line : display.output.split("\\n")) {
                String field=line.trim();
                if (field.startsWith("mScreenBrightness=")) value=number(field.substring("mScreenBrightness=".length()));
            }
        }
        if (!(value>=0 && value<=1))
            value=Settings.System.getFloat(context.getContentResolver(),"screen_brightness_float",Float.NaN);
        if (!(value>=0 && value<=1)) {
            int setting=Settings.System.getInt(context.getContentResolver(),Settings.System.SCREEN_BRIGHTNESS,-1);
            if (setting<1 || setting>255) {
                error="无法读取原厂亮度目标，请调节一次系统亮度条";
                return;
            }
            value=(setting-1)/254f;
        }
        // Repeating the same framework value can be a no-op after a direct driver
        // override. A tiny temporary change forces the OEM to restore its own curve.
        float nearby = value > 0.004f ? value-0.0001f : value+0.0001f;
        RootShell.run("cmd display set-brightness " + Float.toString(nearby)
                + "; cmd display set-brightness " + Float.toString(value),null,3,256);
    }
}
