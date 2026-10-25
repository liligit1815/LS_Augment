package ls.augment.com;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.BatteryManager;
import android.os.SystemClock;
import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/** Actual SystemUI battery adapter acknowledgement; never opens or switches an Activity. */
final class IosBatteryRuntimeDeviceCases {
    private static final String RUNTIME = "ls_augment_ios_battery_runtime";
    private static final String DISPLAY = SystemUiOptions.PREFIX + "battery_style";
    private final Context context;
    private final AppConfig config;
    private final JSONArray stages = new JSONArray();
    private final JSONObject report = new JSONObject();
    private int checks;

    private IosBatteryRuntimeDeviceCases(Context context) {
        this.context = context; config = new AppConfig(context);
    }
    static JSONObject run(Context context) throws Exception {
        return new IosBatteryRuntimeDeviceCases(context).execute();
    }

    private JSONObject execute() throws Exception {
        Map<String, String> before = new LinkedHashMap<>(config.snapshot());
        Map<String, String> original = new LinkedHashMap<>();
        // Only restore fields owned by this temporary fixture, preserving any unrelated user edits.
        for (String key : new String[]{SystemUiOptions.BATTERY_PRESET, DISPLAY,
                ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED, ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,
                ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY}) original.put(key, before.get(key));
        report.put("moduleVersion", BuildConfig.VERSION_NAME).put("device", android.os.Build.MODEL)
                .put("stages", stages).put("original", new JSONObject(original))
                .put("initialRuntime", config.diagnostic(RUNTIME)).put("actualBatteryBefore", battery());
        Throwable failure = null;
        boolean restored = false;
        try {
            // Independent battery appearance works with the user's existing layout-master state.
            save(Map.of(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP, "0",
                    ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY, "0",
                    ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED, "1",
                    SystemUiOptions.BATTERY_PRESET, "1", DISPLAY, "4"));
            observe("ios-without-number", false);
            save(Map.of(DISPLAY, "1"));
            observe("ios-inside-number", true);
            save(Map.of(DISPLAY, "4"));
            observe("ios-number-removed", false);
            save(Map.of(SystemUiOptions.BATTERY_PRESET, "0"));
            String raw = await(false, true);
            stages.put(new JSONObject().put("stage", "native-restored").put("diagnostic", raw));
            require("native_restored".equals(raw), "Selecting native restores the actual SystemUI adapter");
            report.put("actualBatteryAfter", battery());
        } catch (Throwable error) {
            failure = error; report.put("error", error.toString());
        } finally {
            try {
                save(original);
                Map<String, String> after = config.snapshot();
                restored = true;
                for (Map.Entry<String, String> item : original.entrySet())
                    restored &= java.util.Objects.equals(item.getValue(), after.get(item.getKey()));
                require(restored, "Every battery fixture setting restored");
                // Preserve unrelated parameters without writing the full snapshot back over concurrent edits.
                report.put("allConfigurationUnchanged", before.equals(after));
            } catch (Throwable restoreError) {
                report.put("restoreError", restoreError.toString());
                if (failure == null) failure = restoreError; else failure.addSuppressed(restoreError);
            }
            report.put("configurationRestored", restored).put("checks", checks)
                    .put("success", failure == null && restored).put("finalRuntime", config.diagnostic(RUNTIME));
            File folder = new File(context.getFilesDir(), "device-regression-results");
            if (!folder.isDirectory() && !folder.mkdirs()) throw new java.io.IOException("Cannot create battery report directory");
            File output = new File(folder, "ios-battery-runtime-results.json");
            Files.write(output.toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
            report.put("path", output.getAbsolutePath());
        }
        return report;
    }

    private void observe(String stage, boolean digits) throws Exception {
        String raw = await(digits, false);
        Map<String, String> state = parse(raw);
        String asset = state.get("asset");
        int level = Integer.parseInt(state.get("level"));
        int performance = Integer.parseInt(state.get("performanceMode"));
        String expected = IosBatteryPolicy.asset(digits,
                Boolean.parseBoolean(state.get("charging")), Boolean.parseBoolean(state.get("powerSave")),
                IosBatteryPolicy.performance(performance), Boolean.parseBoolean(state.get("dark")));
        require(expected.equals(asset), "Artwork follows the current SystemUI charging/power/contrast state");
        int width, height;
        try (InputStream stream = context.getAssets().open(IosBatteryPolicy.ASSET_DIRECTORY + asset)) {
            BitmapFactory.Options options = new BitmapFactory.Options(); options.inScaled = false;
            Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
            require(bitmap != null, "The acknowledged APK artwork decodes");
            width = bitmap.getWidth(); height = bitmap.getHeight(); bitmap.recycle();
        }
        require(height == 600 || height == 6000, "Artwork contains all supplied level frames");
        int frame = IosBatteryPolicy.frame(level, height / IosBatteryPolicy.FRAME_HEIGHT);
        stages.put(new JSONObject().put("stage", stage).put("diagnostic", raw)
                .put("asset", asset).put("width", width).put("height", height)
                .put("frame", frame).put("digits", digits).put("actualBattery", battery()));
    }

    private String await(boolean digits, boolean nativeAppearance) throws Exception {
        long deadline = SystemClock.elapsedRealtime() + 15_000L;
        String raw = "";
        do {
            raw = config.diagnostic(RUNTIME);
            if (nativeAppearance && "native_restored".equals(raw)) return raw;
            if (!nativeAppearance && raw.startsWith("asset=")) {
                Map<String, String> state = parse(raw);
                if (String.valueOf(digits).equals(state.get("digits")) && state.containsKey("level")
                        && state.containsKey("charging") && state.containsKey("powerSave")
                        && state.containsKey("performanceMode") && state.containsKey("dark")) return raw;
            }
            if (raw.startsWith("asset_unavailable:")) throw new AssertionError("SystemUI cannot load supplied battery artwork: " + raw);
            SystemClock.sleep(100);
        } while (SystemClock.elapsedRealtime() < deadline);
        throw new AssertionError("No current SystemUI battery acknowledgement for "
                + (nativeAppearance ? "native restoration" : "digits=" + digits) + "; last=" + raw
                + ". Verify the latest module is loaded and an actual status bar is attached.");
    }

    private JSONObject battery() throws Exception {
        Intent actual = context.registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        JSONObject observation = new JSONObject();
        if (actual != null) observation.put("level", actual.getIntExtra(BatteryManager.EXTRA_LEVEL, -1))
                .put("scale", actual.getIntExtra(BatteryManager.EXTRA_SCALE, 100))
                .put("status", actual.getIntExtra(BatteryManager.EXTRA_STATUS, -1))
                .put("plugged", actual.getIntExtra(BatteryManager.EXTRA_PLUGGED, 0));
        return observation;
    }

    private static Map<String, String> parse(String raw) {
        Map<String, String> result = new LinkedHashMap<>();
        for (String field : raw.split(";")) {
            int split = field.indexOf('=');
            if (split > 0) result.put(field.substring(0, split), field.substring(split + 1));
        }
        return result;
    }
    private void save(Map<String, String> changes) {
        AppConfig.SaveResult result = config.save(changes);
        require(result.success, "Battery fixture save succeeds: " + result.message);
    }
    private void require(boolean condition, String message) {
        checks++; if (!condition) throw new AssertionError(message);
    }
}
