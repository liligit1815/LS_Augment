package ls.augment.com;

import android.app.NotificationManager;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Binder;
import android.os.Process;

import java.util.LinkedHashMap;

/** Read-only feature configuration bridge for statically scoped Hook processes. */
public final class LSConfigProvider extends ContentProvider {
    private static final String FAN_CHANNEL = "ls_augment_fan_control";
    private static final int FAN_NOTIFICATION_ID = 2044;
    private static final Object RAPID_ROUTE_LOCK = new Object();
    private static final Object AUTOMATION_LOCK = new Object();
    private static String lastAutomationRequest = "";
    @Override
    public boolean onCreate() { removeLegacyFanNotification(); return true; }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        Bundle result = new Bundle();
        if (getContext() == null || !allowedCaller()) return result;
        if ("telemetry".equals(method)) return DiagnosticStore.record(getContext(),extras);
        if ("debug_export_logs".equals(method) && BuildConfig.DEBUG && (Binder.getCallingUid()==Process.myUid()||Binder.getCallingUid()==Process.ROOT_UID)) {
            long identity=Binder.clearCallingIdentity();try { java.io.File file=new java.io.File(getContext().getFilesDir(),"last-diagnostic-export.txt");java.nio.file.Files.write(file.toPath(),DiagnosticExport.build(getContext()).getBytes(java.nio.charset.StandardCharsets.UTF_8));result.putString("path",file.getPath()); } catch(Exception e){result.putString("error",e.toString());} finally {Binder.restoreCallingIdentity(identity);}return result;
        }
        if ("hardware_telemetry".equals(method)) {
            int uid=Binder.getCallingUid();
            String[] packages=getContext().getPackageManager().getPackagesForUid(uid);
            if(uid!=Process.myUid()&&uid!=Process.ROOT_UID&&(packages==null
                    ||!java.util.Arrays.asList(packages).contains("com.android.systemui")))return result;
            long identity=Binder.clearCallingIdentity();
            try{return HardwareTelemetry.read();}finally{Binder.restoreCallingIdentity(identity);}
        }
        if ("fan_measurement".equals(method) && extras != null) {
            int caller = Binder.getCallingUid();
            String[] packages = getContext().getPackageManager().getPackagesForUid(caller);
            boolean fanCaller = packages != null
                    && java.util.Arrays.asList(packages).contains("cn.nubia.fan");
            if (!fanCaller) return result;
            String request = extras.getString("request", "");
            FanCalibrationData data = FanCalibrationData.parse(extras.getString("value", ""));
            AppConfig config = new AppConfig(getContext());
            if (!FanCalibrationData.validRequest(request, System.currentTimeMillis())
                    || !request.equals(config.get(ConfigSchema.FAN_CALIBRATION_REQUEST))
                    || data == null || !data.currentFor(FanHardwareIdentity.current())) return result;
            long identity = Binder.clearCallingIdentity();
            try {
                LinkedHashMap<String, String> updates = new LinkedHashMap<>();
                updates.put(ConfigSchema.FAN_MEASUREMENT, data.serialize());
                updates.put(ConfigSchema.FAN_CALIBRATION_REQUEST, "");
                AppConfig.SaveResult saved = config.save(updates);
                result.putBoolean("ok", saved.success);
                result.putString("message", saved.message);
                return result;
            } finally { Binder.restoreCallingIdentity(identity); }
        }
        if ("automation_execute".equals(method)) {
            // A scoped app is not allowed to trigger hidden-app operations.
            if (Binder.getCallingUid() != Process.SYSTEM_UID || extras == null) return result;
            String request = extras.getString("requestId", "");
            if (!request.matches("[0-9]+:[0-9]+") || request.length() > 80) return result;
            synchronized (AUTOMATION_LOCK) {
                if (request.equals(lastAutomationRequest)) {
                    result.putBoolean("ok", true);
                    result.putString("message", "本次熄屏事件已处理");
                    return result;
                }
                long identity = Binder.clearCallingIdentity();
                try {
                    RootHideManager.OperationResult operation =
                            new RootHideManager(getContext()).runScreenOffAutomation();
                    if(operation.success)lastAutomationRequest = request;
                    String key = operation.success ? AppConfig.AUTOMATION_LAST_EVENT
                            : AppConfig.AUTOMATION_LAST_ERROR;
                    getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit()
                            .putString(key, "screen_off;result=" + operation.message
                                    + ";ts=" + System.currentTimeMillis()).apply();
                    result.putBoolean("ok", operation.success);
                    result.putString("message", operation.message);
                    return result;
                } finally { Binder.restoreCallingIdentity(identity); }
            }
        }
        if ("rapid_route".equals(method)) {
            return recordRapidRoute(extras);
        }
        if ("snapshot".equals(method)) {
            ConfigSnapshot snapshot = new AppConfig(getContext()).configSnapshot();
            result.putBoolean("ok", true);
            result.putInt("schemaVersion", snapshot.schemaVersion);
            result.putLong("revision", snapshot.revision);
            result.putLong("updatedAt", snapshot.updatedAt);
            result.putString("scope", snapshot.scope);
            result.putString("checksum", snapshot.checksum);
            result.putString("snapshot", snapshot.serialize());
            return result;
        }
        // Compatibility-only per-key read. New Hook code consumes only the
        // complete snapshot above and never combines this with Global values.
        if ("get".equals(method) && arg != null && ConfigSchema.isRuntimeKey(arg)) {
            result.putString("value", new AppConfig(getContext()).configSnapshot().get(arg));
            return result;
        }
        // Debug builds expose an app-UID/Root-only bridge for ADB integration
        // tests. Release builds and ordinary external UIDs cannot mutate
        // configuration through the exported read-only provider.
        if ("debug_set".equals(method) && BuildConfig.DEBUG
                && (Binder.getCallingUid() == Process.myUid()
                || Binder.getCallingUid() == Process.ROOT_UID)
                && arg != null && ConfigSchema.contains(arg) && extras != null) {
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            String value = extras.getString("value", "");
            if (extras.containsKey("encodedValue")) {
                try {
                    String encoded = extras.getString("encodedValue", "");
                    if (encoded.length() > 131072) return result;
                    value = new String(java.util.Base64.getDecoder().decode(encoded),
                            java.nio.charset.StandardCharsets.UTF_8);
                } catch (IllegalArgumentException ignored) { return result; }
            }
            update.put(arg, value);
            AppConfig.SaveResult saved = new AppConfig(getContext()).save(update);
            result.putBoolean("ok", saved.success);
            result.putString("message", saved.message);
            return result;
        }
        if ("diagnostic".equals(method) && arg != null && arg.startsWith("ls_augment_")) {
            String value = extras == null ? "" : extras.getString("value", "");
            value = value.replace('\r', ' ').replace('\n', ' ');
            if (value.length() > 2000) value = value.substring(0, 2000);
            getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .edit().putString(arg, value).apply();
            if ("ls_augment_config_snapshot_handshake_v1".equals(arg)) {
                Context context = getContext().getApplicationContext();
                Thread cleanup = new Thread(() ->
                        new AppConfig(context).cleanupLegacyGlobalSettingsAfterHandshake(),
                        "LSA-ConfigMigration");
                cleanup.setDaemon(true);
                cleanup.start();
            }
            result.putBoolean("ok", true);
            return result;
        }
        if ("diagnostic_get".equals(method) && arg != null && arg.startsWith("ls_augment_")) {
            result.putString("value", getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(arg, ""));
        }
        return result;
    }

    private boolean allowedCaller() {
        try {
            if (getContext() == null) return false;
            int uid = Binder.getCallingUid();
            if (uid == Process.myUid()) return true;
            // system_server has Linux UID 1000; its modern libxposed scope is
            // the pseudo-package "system", not an Android package name.
            if (uid == Process.SYSTEM_UID) return true;
            if (BuildConfig.DEBUG && uid == Process.ROOT_UID) return true;
            String[] packages = getContext().getPackageManager().getPackagesForUid(uid);
            if (packages == null) return false;
            for (String packageName : packages) {
                if ("ls.augment.com".equals(packageName)
                        || HookTargetRegistry.contains(packageName)) return true;
            }
            return false;
        } catch (Throwable ignored) { return false; }
    }

    private Bundle recordRapidRoute(Bundle extras) {
        Bundle result = new Bundle();
        if (extras == null || getContext() == null) return result;
        String[] callers = getContext().getPackageManager().getPackagesForUid(Binder.getCallingUid());
        boolean vendor = false;
        if (callers != null) for (String caller : callers) {
            vendor |= "cn.nubia.gamelauncher".equals(caller) || "cn.nubia.gameassist".equals(caller);
        }
        if (!vendor) return result;
        synchronized (RAPID_ROUTE_LOCK) {
            RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                    new AppConfig(getContext()).configSnapshot().get(AppConfig.TGK_RAPID_FIRE_TEST_SESSION));
            if (session == null || !session.active(System.currentTimeMillis())
                    || !session.id.equals(extras.getString("sessionId"))
                    || !session.state.name().equals(extras.getString("phase"))) return result;
            String phase = session.state.name();
            RapidFireRouteEvidence fresh = RapidFireRouteEvidence.start(session.id, phase);
            if (fresh == null) return result;
            String key = RapidFireRouteEvidence.DIAGNOSTIC_PREFIX
                    + (session.state == RapidFireCompatibility.State.WAIT_LEFT ? "left" : "right");
            android.content.SharedPreferences diagnostics = getContext().getSharedPreferences(AppConfig.DIAGNOSTICS, 0);
            RapidFireRouteEvidence evidence = RapidFireRouteEvidence.parse(diagnostics.getString(key, ""));
            if (evidence == null || !evidence.matches(session.id, phase)) evidence = fresh;
            evidence.record(extras.getInt("upper", -1), extras.getInt("system", -1));
            diagnostics.edit().putString(key, evidence.serialize()).apply();
            result.putBoolean("ok", true);
        }
        return result;
    }

    private void removeLegacyFanNotification() {
        if (getContext() == null) return;
        try {
            NotificationManager manager = getContext().getSystemService(NotificationManager.class);
            if (manager != null) {
                manager.cancel(FAN_NOTIFICATION_ID);
                manager.deleteNotificationChannel(FAN_CHANNEL);
            }
        } catch (RuntimeException ignored) {
            // Removing an old notice must not affect configuration or fan control.
        }
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection,
            String[] selectionArgs, String sortOrder) { return null; }
    @Override public android.os.ParcelFileDescriptor openFile(Uri uri,String mode) throws java.io.FileNotFoundException {
        if(getContext()==null||!"r".equals(mode)||!allowedCaller())throw new java.io.FileNotFoundException("read only");
        int uid=Binder.getCallingUid();String[] packages=getContext().getPackageManager().getPackagesForUid(uid);
        if(uid!=Process.myUid()&&!(BuildConfig.DEBUG&&uid==0)
                &&(packages==null||!java.util.Arrays.asList(packages).contains("com.zte.mifavor.launcher")))throw new java.io.FileNotFoundException("launcher only");
        java.util.List<String> path=uri.getPathSegments();
        if(path.size()!=2||!"icon".equals(path.get(0)))throw new java.io.FileNotFoundException("unknown icon path");
        String hash=path.get(1);LauncherOverrides values=LauncherOverrides.parse(new AppConfig(getContext()).get(ConfigSchema.LAUNCHER_OVERRIDES));
        boolean used=false;if(values!=null)for(LauncherOverrides.Entry e:values.entries())if(e.icon.equals(hash))used=true;
        if(!used)throw new java.io.FileNotFoundException("unconfigured icon");
        return android.os.ParcelFileDescriptor.open(LauncherIconStore.file(getContext(),hash),android.os.ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection,
            String[] selectionArgs) { return 0; }
}
