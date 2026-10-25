package ls.augment.com.hook;

import android.content.Context;
import android.provider.Settings;
import java.io.BufferedReader;
import java.io.FileReader;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.GameOptions;
import ls.augment.com.ModuleRuntimeStatus;
import org.json.JSONObject;

/** Owns real GPP runtime properties in system_server; capability queries stay native. */
final class SuperResolutionRuntimeHook {
    static final String STATE_KEY = "ls_augment_super_resolution_runtime_state";
    static final String ERROR_KEY = "ls_augment_super_resolution_runtime_error";
    private static final String ALL_GAME = "vendor.gpp.allgame.enable";
    private static final String MAX_WIDTH = "vendor.gpp.maxw";
    private static final String MAX_HEIGHT = "vendor.gpp.maxh";
    private static final String EXTENSION = "vendor.gpp.create_frc_extension";
    private static final int JOURNAL_LIMIT = 4096;
    private static final LinkedHashMap<String, String> DESIRED = desiredProperties();
    private static final String[] RESTORE_ORDER = {ALL_GAME, MAX_HEIGHT, MAX_WIDTH};
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "LSA-SuperResolutionRuntime");
        thread.setDaemon(true);
        return thread;
    });
    private static final AtomicBoolean QUEUED = new AtomicBoolean();
    private static final AtomicLong REQUESTS = new AtomicLong();
    private static volatile Context application;
    private static boolean attached;
    private static Method propertyGet;
    private static Method propertySet;
    // All accesses belong to the single native worker. The provider also applies CAS.
    private static String ownerRevision;

    private SuperResolutionRuntimeHook() { }

    static synchronized void attach(Context context) {
        if (context == null || attached) return;
        Context app = context.getApplicationContext();
        application = app == null ? context : app;
        if (!FeatureSettings.addSnapshotListener(application, SuperResolutionRuntimeHook::request)) return;
        attached = true;
        request();
        // Recheck ownership after another system component changes a property.
        WORKER.scheduleWithFixedDelay(SuperResolutionRuntimeHook::request, 10, 10, TimeUnit.SECONDS);
    }

    private static LinkedHashMap<String, String> desiredProperties() {
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        // HEXLP reads these limits when a new native session is constructed.
        // Publish the limits before advertising the native all-game capability.
        values.put(MAX_WIDTH, "1080");
        values.put(MAX_HEIGHT, "2400");
        values.put(ALL_GAME, "1");
        return values;
    }

    private static void request() {
        if (application == null) return;
        REQUESTS.incrementAndGet();
        if (!QUEUED.compareAndSet(false, true)) return;
        WORKER.execute(() -> {
            long generation = REQUESTS.get();
            try { reconcile(application); }
            finally {
                QUEUED.set(false);
                if (REQUESTS.get() != generation) request();
            }
        });
    }

    private static void reconcile(Context context) {
        try {
            if (!FeatureSettings.hasVerifiedSnapshot(context)) {
                publish(context, "waiting_config", "");
                return;
            }
            ConfigSnapshot snapshot = FeatureSettings.snapshot(context);
            boolean enabled = ConfigSchema.truthy(snapshot.get(FeatureSettings.GAME_MASTER))
                    && ConfigSchema.truthy(snapshot.get(GameOptions.PLUGINS));
            String boot = ModuleRuntimeStatus.bootId();
            if (!boot.matches("[a-fA-F0-9-]{36}")) throw new IllegalStateException("boot_identity_unavailable");
            Owner owner = readOwner(context);
            if (owner != null && !boot.equals(owner.boot)) {
                // These properties are not persistent. A prior boot's values must
                // never overwrite the current boot's native defaults or other owners.
                saveOwner(context, null);
                owner = null;
            }
            if (!enabled || !"1".equals(getProperty(EXTENSION))) {
                if (owner != null) restore(context, owner, true);
                else publish(context, enabled ? "native_unavailable" : "disabled", "");
                return;
            }
            apply(context, boot, owner);
        } catch (Exception failure) {
            publish(context, "error", error(failure));
        }
    }

    private static void apply(Context context, String boot, Owner existing) throws Exception {
        Owner owner = existing == null ? new Owner(boot) : existing;
        boolean mutationNeeded = false;
        for (Map.Entry<String, String> desired : DESIRED.entrySet()) {
            String key = desired.getKey();
            String actual = getProperty(key);
            mutationNeeded |= !desired.getValue().equals(actual);
            Value saved = owner.values.get(key);
            if (saved == null) owner.values.put(key, new Value(actual, desired.getValue()));
            else if ((!saved.original.equals(actual) && !saved.intended.equals(actual))
                    || ("applied".equals(owner.phase) && !saved.intended.equals(actual))) {
                publish(context, "conflict", "property_changed_elsewhere:" + key);
                return;
            }
        }
        if (existing == null && !mutationNeeded) {
            publish(context, "external_configuration", "");
            return;
        }
        if (existing != null && !mutationNeeded && "applied".equals(owner.phase)) {
            publish(context, "applied", "");
            return;
        }
        if (existing == null) owner.capabilityOwned = !"1".equals(owner.values.get(ALL_GAME).original);
        if (owner.capabilityOwned) readNativeCapabilities();
        owner.phase = "applying";
        owner.modesStopped = false;
        // The recovery journal must be durable before the first real mutation.
        saveOwner(context, owner);
        boolean capabilityAdvertised = false;
        boolean capabilityWriteAttempted = false;
        try {
            capabilityAdvertised = owner.capabilityOwned && "1".equals(getProperty(ALL_GAME));
            for (Map.Entry<String, String> desired : DESIRED.entrySet()) {
                String key = desired.getKey();
                String value = desired.getValue();
                if (!value.equals(getProperty(key))) {
                    if (ALL_GAME.equals(key)) capabilityWriteAttempted = true;
                    setProperty(key, value);
                }
                if (!value.equals(getProperty(key))) throw new IllegalStateException("property_not_accepted:" + key);
                if (ALL_GAME.equals(key) && owner.capabilityOwned) capabilityAdvertised = true;
            }
            owner.phase = "applied";
            saveOwner(context, owner);
        } catch (Exception failure) {
            String reason = error(failure);
            try {
                boolean stopModes = capabilityAdvertised;
                if (owner.capabilityOwned && !stopModes) {
                    try { stopModes = "1".equals(getProperty(ALL_GAME)); }
                    catch (Exception unavailable) { stopModes = capabilityWriteAttempted; }
                }
                restore(context, owner, stopModes);
            }
            catch (Exception rollback) { reason += ";rollback:" + error(rollback); }
            publish(context, "error", reason);
            return;
        }
        // Applied describes native configuration only. Generated-frame evidence
        // and input/output dimensions determine whether a game's effects work.
        publish(context, "applied", "");
    }

    private static void restore(Context context, Owner owner, boolean stopUnsupportedModes) throws Exception {
        owner.phase = "restoring";
        StringBuilder issues = new StringBuilder();
        // The preceding apply journal already contains every original/intended
        // value. A journal write outage must not block real property recovery.
        try { saveOwner(context, owner); }
        catch (Exception failure) { append(issues, "owner_phase:" + error(failure)); }
        if (stopUnsupportedModes && owner.capabilityOwned && !owner.modesStopped) {
            try {
                stopUnsupportedModes(context);
                owner.modesStopped = true;
                saveOwner(context, owner);
            } catch (Exception failure) {
                append(issues, "native_modes:" + error(failure));
            }
        }
        for (String key : RESTORE_ORDER) {
            Value saved = owner.values.get(key);
            if (saved == null) continue;
            try {
                String actual = getProperty(key);
                if (!saved.original.equals(actual)) {
                    if (!saved.intended.equals(actual)) {
                        append(issues, "property_changed_elsewhere:" + key);
                        continue;
                    }
                    setProperty(key, saved.original);
                    if (!saved.original.equals(getProperty(key))) {
                        append(issues, "restore_not_accepted:" + key);
                        continue;
                    }
                }
                owner.values.remove(key);
                // Keep each unresolved value durable if recovery is interrupted.
                saveOwner(context, finished(owner, stopUnsupportedModes) ? null : owner);
            } catch (Exception failure) { append(issues, key + ":" + error(failure)); }
        }
        if (finished(owner, stopUnsupportedModes)) {
            try {
                saveOwner(context, null);
                publish(context, "restored", "");
            } catch (Exception failure) {
                append(issues, "owner_cleanup:" + error(failure));
                publish(context, "restore_pending", issues.toString());
            }
        } else {
            try { saveOwner(context, owner); }
            catch (Exception failure) { append(issues, "owner_progress:" + error(failure)); }
            publish(context, "restore_pending", issues.toString());
        }
    }

    private static boolean finished(Owner owner, boolean stopUnsupportedModes) {
        return owner.values.isEmpty() && (!stopUnsupportedModes || !owner.capabilityOwned || owner.modesStopped);
    }

    private static Owner readOwner(Context context) throws Exception {
        String raw = GfrcRecoveryClient.read(context);
        ownerRevision = raw;
        if (raw == null || raw.isEmpty()) return null;
        if (raw.length() > JOURNAL_LIMIT) throw new IllegalStateException("owner_record_too_large");
        JSONObject json = new JSONObject(raw);
        if (json.getInt("version") != 1) throw new IllegalStateException("owner_record_version");
        String boot = json.getString("boot");
        if (!boot.matches("[a-fA-F0-9-]{36}")) throw new IllegalStateException("owner_record_boot");
        JSONObject properties = json.getJSONObject("properties");
        Owner owner = new Owner(boot);
        owner.phase = json.getString("phase");
        if (!"applying".equals(owner.phase) && !"applied".equals(owner.phase) && !"restoring".equals(owner.phase))
            throw new IllegalStateException("owner_record_phase");
        owner.capabilityOwned = json.getBoolean("capabilityOwned");
        owner.modesStopped = json.getBoolean("modesStopped");
        if (properties.length() > DESIRED.size() || (properties.length() == 0
                && !("restoring".equals(owner.phase) && owner.capabilityOwned && !owner.modesStopped)))
            throw new IllegalStateException("owner_record_properties");
        Iterator<String> keys = properties.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!DESIRED.containsKey(key)) throw new IllegalStateException("owner_record_key");
            JSONObject value = properties.getJSONObject(key);
            Object original = value.get("original");
            Object intended = value.get("intended");
            if (!(original instanceof String) || ((String) original).length() > 91
                    || !(intended instanceof String) || !DESIRED.get(key).equals(intended))
                throw new IllegalStateException("owner_record_value");
            owner.values.put(key, new Value((String) original, (String) intended));
        }
        return owner;
    }

    private static void saveOwner(Context context, Owner owner) throws Exception {
        String serialized = null;
        if (owner != null) {
            JSONObject properties = new JSONObject();
            for (Map.Entry<String, Value> entry : owner.values.entrySet()) {
                properties.put(entry.getKey(), new JSONObject()
                        .put("original", entry.getValue().original)
                        .put("intended", entry.getValue().intended));
            }
            serialized = new JSONObject().put("version", 1).put("boot", owner.boot)
                    .put("phase", owner.phase).put("capabilityOwned", owner.capabilityOwned)
                    .put("modesStopped", owner.modesStopped)
                    .put("properties", properties).toString();
        }
        GfrcRecoveryClient.write(context, ownerRevision, serialized);
        ownerRevision = serialized;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static String getProperty(String key) throws Exception {
        if (propertyGet == null) propertyGet = Class.forName("android.os.SystemProperties").getMethod("get", String.class);
        return (String) propertyGet.invoke(null, key);
    }

    private static void stopUnsupportedModes(Context context) throws Exception {
        Map<String, Integer> nativeCapabilities = readNativeCapabilities();
        for (int attempt = 0; attempt < 3; attempt++) {
            String original = Settings.Global.getString(context.getContentResolver(), "game_gfrc_mode");
            if (original == null || original.isEmpty()) return;
            String intended = disabledUnsupportedModes(original, nativeCapabilities);
            if (original.equals(intended)) return;
            // Do not apply a stale snapshot when the native UI changed another entry.
            if (!original.equals(Settings.Global.getString(context.getContentResolver(), "game_gfrc_mode"))) continue;
            if (!Settings.Global.putString(context.getContentResolver(), "game_gfrc_mode", intended))
                throw new IllegalStateException("mode_not_saved");
            if (!intended.equals(Settings.Global.getString(context.getContentResolver(), "game_gfrc_mode")))
                throw new IllegalStateException("mode_not_accepted");
            return;
        }
        throw new IllegalStateException("mode_changed_concurrently");
    }

    static String disabledUnsupportedModes(String original, Map<String, Integer> nativeCapabilities) {
        String[] entries = original.split(",", -1);
        boolean changed = false;
        for (int i = 0; i < entries.length; i++) {
            String entry = entries[i];
            int separator = entry.indexOf('+');
            if (separator <= 0 || entry.indexOf('+', separator + 1) >= 0) continue;
            String packageName = entry.substring(0, separator).trim();
            String mode = entry.substring(separator + 1);
            if (!packageName.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+")
                    || !mode.matches("[0-9]{3}")) continue;
            Integer capability = nativeCapabilities.get(packageName);
            if (capability != null && capability != 0) continue;
            int last = mode.charAt(2) - '0';
            // Cube normalizes native 5/8 flags before checking the enable bit.
            int enabled = last >= 8 ? last - 8 : last >= 5 ? last - 5 : last;
            if (enabled != 1) continue;
            entries[i] = entry.substring(0, separator + 1) + mode.substring(0, 2) + (last - 1);
            changed = true;
        }
        return changed ? String.join(",", entries) : original;
    }

    private static Map<String, Integer> readNativeCapabilities() throws Exception {
        LinkedHashMap<String, Integer> capabilities = new LinkedHashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader("/system/etc/gpp_app_list"))) {
            int rows = 0;
            String line;
            while ((line = reader.readLine()) != null) {
                if (++rows > 4096 || line.length() > 1024) throw new IllegalStateException("native_list_too_large");
                String value = line.trim();
                if (value.isEmpty() || value.startsWith("#")) continue;
                String[] columns = value.split(",");
                if (columns.length != 3) continue;
                try {
                    // Match the native Cube parser's last-row-wins capability map.
                    capabilities.put(columns[0], Integer.parseInt(columns[1]) * 10 + Integer.parseInt(columns[2]));
                } catch (NumberFormatException malformed) { }
            }
        }
        if (capabilities.isEmpty()) throw new IllegalStateException("native_list_unavailable");
        return capabilities;
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void setProperty(String key, String value) throws Exception {
        if (!DESIRED.containsKey(key)) throw new IllegalArgumentException("unmanaged_property");
        if (propertySet == null) propertySet = Class.forName("android.os.SystemProperties")
                .getMethod("set", String.class, String.class);
        propertySet.invoke(null, key, value);
    }

    private static void publish(Context context, String state, String reason) {
        String details = "state=" + state + "|allgame=" + observed(ALL_GAME)
                + "|maxw=" + observed(MAX_WIDTH) + "|maxh=" + observed(MAX_HEIGHT);
        FeatureSettings.diagnostic(context, STATE_KEY, details);
        FeatureSettings.diagnostic(context, ERROR_KEY, reason);
    }

    private static String observed(String key) {
        try { return getProperty(key); } catch (Exception unavailable) { return "unavailable"; }
    }

    private static String error(Exception failure) {
        Throwable cause = failure.getCause() == null ? failure : failure.getCause();
        String message = cause.getMessage();
        return cause.getClass().getSimpleName() + (message == null ? "" : ":" + message);
    }

    private static void append(StringBuilder destination, String value) {
        if (destination.length() > 0) destination.append(';');
        destination.append(value);
    }

    private static final class Owner {
        final String boot;
        final LinkedHashMap<String, Value> values = new LinkedHashMap<>();
        String phase = "applying";
        boolean capabilityOwned;
        boolean modesStopped;
        Owner(String boot) { this.boot = boot; }
    }

    private static final class Value {
        final String original;
        final String intended;
        Value(String original, String intended) { this.original = original; this.intended = intended; }
    }
}
