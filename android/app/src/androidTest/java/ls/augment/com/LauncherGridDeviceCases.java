package ls.augment.com;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Map;
import org.json.JSONObject;

/** Test APK only: three owned configuration keys and a durable restore baseline. */
final class LauncherGridDeviceCases {
    static JSONObject runtime(Context context, Bundle args) throws Exception {
        AppConfig config = new AppConfig(context);
        File baseline = new File(context.getFilesDir(), "launcher-grid-test-baseline.json");
        String stage = args.getString("stage", "observe");
        if ("apply".equals(stage)) {
            int rows = Integer.parseInt(args.getString("rows", "6"));
            int columns = Integer.parseInt(args.getString("columns", "6"));
            LauncherGridSpec next = new LauncherGridSpec(true, rows, columns);
            if (!baseline.exists()) {
                JSONObject original = new JSONObject();
                for (String key : LauncherGridSpec.defaults().values().keySet()) original.put(key, config.get(key));
                Files.write(baseline.toPath(), original.toString().getBytes(StandardCharsets.UTF_8));
            }
            Map<String,String> before = config.snapshot();
            AppConfig.SaveResult result = config.save(next.values());
            require(result.success, "Grid test configuration must save: " + result.message);
            awaitSync(config);
            for (Map.Entry<String,String> entry : before.entrySet())
                if (!next.values().containsKey(entry.getKey()))
                    require(entry.getValue().equals(config.get(entry.getKey())), "Unrelated setting changed: " + entry.getKey());
        } else if ("restore".equals(stage)) {
            require(baseline.isFile(), "No saved grid fixture baseline");
            JSONObject original = new JSONObject(new String(Files.readAllBytes(baseline.toPath()), StandardCharsets.UTF_8));
            Map<String,String> values = new LinkedHashMap<>();
            for (String key : LauncherGridSpec.defaults().values().keySet()) values.put(key, original.getString(key));
            AppConfig.SaveResult result = config.save(values);
            require(result.success, "Grid baseline must save: " + result.message);
            awaitSync(config);
            require(baseline.delete(), "Cannot remove completed grid fixture baseline");
        } else require("observe".equals(stage), "Unknown grid fixture stage");
        Bundle runtime = context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),
                "diagnostic_get", "ls_augment_launcher_grid_runtime", null);
        JSONObject current = new JSONObject();
        for (String key : LauncherGridSpec.defaults().values().keySet()) current.put(key, config.get(key));
        return new JSONObject().put("stage", stage).put("configuration", current)
                .put("runtime", runtime == null ? "" : runtime.getString("value", ""))
                .put("restorePending", baseline.exists());
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    private static void awaitSync(AppConfig config) {
        for (int i=0;i<40;i++) {
            if (config.mirrorAll().isSuccess()) return;
            android.os.SystemClock.sleep(125);
        }
        throw new AssertionError("Saved grid configuration did not reach framework runtime within 5 seconds");
    }
}
