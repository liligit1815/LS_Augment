package ls.augment.com;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/** ADB-only test APK. No test entry point is included in the delivered application. */
public final class DeviceRegressionRunner extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); this.arguments = arguments; start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        JSONObject report = new JSONObject();
        try {
            Context context = getTargetContext();
            String operation = arguments.getString("operation", "snapshot");
            // Enumeration diagnostics must not initialize or migrate configuration.
            AppConfig config = "package-enumeration".equals(operation) || "ui-navigation".equals(operation)
                    || "ui-preview".equals(operation) || "prototype-navigation".equals(operation)
                    || "dialog-ui".equals(operation) || "ui-standards".equals(operation)
                    || "rapid-certification".equals(operation)
                    || "legal-scroll".equals(operation)
                    || "surface-flicker".equals(operation)
                    || "screenrecord-frames".equals(operation)
                    || "total-reset-read-only".equals(operation)
                    || "config-transfer-actions".equals(operation)
                    || "total-reset-inspect".equals(operation)
                    || "total-reset-root-paths".equals(operation)
                    || "private-storage-verify".equals(operation)
                    || "owned-file-cleaner-fixture".equals(operation)
                    || "log-repair-fixture".equals(operation)
                    || "log-repair-export".equals(operation)
                    || "root-transaction-fixture".equals(operation)
                    || "owned-restore-fixture".equals(operation)
                    || "recovery-navigation-fixture".equals(operation)
                    || "lifecycle-observation-fixture".equals(operation)
                    || "manual-target-fixture".equals(operation)
                    || "rapid-physical-capture-probe".equals(operation)
                    || "connectivity-icon-cases".equals(operation)
                    || "carrier-text-layout".equals(operation)
                    || "statusbar-customization-ui".equals(operation)
                    || "statusbar-network-ui".equals(operation)
                    || "statusbar-icon-style-ui".equals(operation)
                    || "island-settings-ui".equals(operation)
                    || "launcher-grid-ui".equals(operation)
                    || "fan-settings-ui".equals(operation)
                    || "game-settings-ui".equals(operation)
                    || "game-performance-monitor-ui".equals(operation)
                    || "integrated-settings-ui".equals(operation)
                    || "liftarc-settings-ui".equals(operation)
                    || "liftarc-log-fixture".equals(operation)
                    || "contributors-references-ui".equals(operation)
                    || "launcher-grid-drag".equals(operation)
                    ? null : new AppConfig(context);
            report.put("operation", operation).put("moduleVersion", BuildConfig.VERSION_CODE)
                    .put("at", System.currentTimeMillis());
            switch (operation) {
                case "liftarc-log-fixture":
                    report.put("liftArcLog",LiftArcLogDeviceCases.run(context));
                    result.putString("liftArcLog",report.getJSONObject("liftArcLog").toString());
                    break;
                case "contributors-references-ui":
                    report.put("contributorsReferencesUi",ContributorsReferencesUiCases.run(this,arguments));
                    result.putString("contributorsReferencesUi",report.getJSONObject("contributorsReferencesUi").toString());
                    break;
                case "liftarc-settings-ui":
                    report.put("liftArcSettingsUi",LiftArcUiCases.run(this,arguments));
                    result.putString("liftArcSettingsUi",report.getJSONObject("liftArcSettingsUi").toString());
                    break;
                case "log-repair-fixture":
                    report.put("logRepairFixture",LogRepairDeviceCases.run(context));
                    result.putString("logRepairFixture",report.getJSONObject("logRepairFixture").toString());
                    break;
                case "log-repair-export": {
                    byte[] export=DiagnosticExport.build(context).getBytes(StandardCharsets.UTF_8);
                    File exportFolder=new File(context.getFilesDir(),"device-regression-results");
                    if(!exportFolder.isDirectory()&&!exportFolder.mkdirs())throw new java.io.IOException("Cannot create diagnostic export folder");
                    File exportFile=new File(exportFolder,"log-repair-export.txt");
                    Files.write(exportFile.toPath(),export);
                    JSONObject summary=new JSONObject().put("path",exportFile.getAbsolutePath())
                            .put("bytes",export.length).put("moduleVersion",BuildConfig.VERSION_NAME);
                    report.put("logRepairExport",summary);result.putString("logRepairExport",summary.toString());
                    break;
                }
                case "carrier-text-layout":
                    report.put("carrierTextLayout",CarrierTextLayoutDeviceCases.run(this));
                    break;
                case "c17-summary-assets":
                    report.put("notificationSummaryAssets",C17NotificationSummaryAssetsCases.run(this,arguments));
                    break;
                case "c17-enhancement-ui":
                    report.put("c17EnhancementUi",C17EnhancementUiCases.run(this,arguments));
                    break;
                case "c17-enhancement-ui-restore":
                    report.put("c17EnhancementUi",C17EnhancementUiCases.restore(this));
                    break;
                case "c17-runtime-fixture":
                    report.put("c17RuntimeFixture",C17RuntimeFixtureCases.run(this,arguments));
                    if(!report.getJSONObject("c17RuntimeFixture").optString("error").isEmpty()
                            || !report.getJSONObject("c17RuntimeFixture").optBoolean("cleanupComplete"))
                        throw new AssertionError("Runtime fixture did not complete; inspect its report");
                    break;
                case "statusbar-arrangement":
                    report.put("statusbarArrangement",StatusBarArrangementDeviceCases.run(this));
                    if(!report.getJSONObject("statusbarArrangement").getBoolean("success"))throw new AssertionError("Status bar arrangement failed; inspect statusbar-arrangement-results.json");
                    break;
                case "statusbar-arrangement-restore":
                    report.put("statusbarArrangement",StatusBarArrangementDeviceCases.restore(this));
                    break;
                case "back-gesture-customization":
                    report.put("backGestureCustomization",BackGestureCustomizationDeviceCases.run(this,arguments));
                    break;
                case "statusbar-user-assets":
                    report.put("statusbarUserAssets",StatusBarUserAssetsDeviceCases.run(this,arguments));
                    break;
                case "statusbar-control-roundtrip":
                    report.put("statusbarControls",StatusBarControlRoundTripCases.run(this));
                    if(!report.getJSONObject("statusbarControls").getBoolean("success"))throw new AssertionError("Status bar control roundtrip failed; inspect statusbar-controls-results.json");
                    break;
                case "statusbar-control-restore":
                    report.put("statusbarControls",StatusBarControlRoundTripCases.restore(this));
                    break;
                case "back-gesture-hover":
                    report.put("backGestureHover",BackGestureHoverDeviceCases.run(this,arguments));
                    result.putString("backGestureHover",report.getJSONObject("backGestureHover").toString());
                    break;
                case "rapid-certification":
                    report.put("rapidCertification",RapidFireCertificationDeviceCases.run(context));
                    result.putString("rapidCertification",report.getJSONObject("rapidCertification").toString());
                    break;
                case "ui-standards":
                    report.put("uiStandards",UiStandardsDeviceCases.run(this,
                            Boolean.parseBoolean(arguments.getString("strict","false")),
                            Boolean.parseBoolean(arguments.getString("landscape","false"))));
                    result.putString("uiStandards",report.getJSONObject("uiStandards").toString());
                    break;
                case "integrated-settings-ui":
                    report.put("integratedSettingsUi",IntegratedSettingsUiCases.run(this,
                            Boolean.parseBoolean(arguments.getString("layoutOnly","false")),
                            Boolean.parseBoolean(arguments.getString("landscape","false"))));
                    result.putString("integratedSettingsUi",report.getJSONObject("integratedSettingsUi").toString());
                    break;
                case "realtime-activities-ui":
                    report.put("realtimeActivitiesUi", RealtimeActivitiesUiCases.run(this));
                    result.putString("realtimeActivitiesUi", report.getJSONObject("realtimeActivitiesUi").toString());
                    break;
                case "game-performance-monitor-ui":
                    report.put("gamePerformanceMonitorUi",GamePerformanceMonitorUiCases.run(this,
                            Boolean.parseBoolean(arguments.getString("layoutOnly","false")),
                            Boolean.parseBoolean(arguments.getString("landscape","false"))));
                    result.putString("gamePerformanceMonitorUi",report.getJSONObject("gamePerformanceMonitorUi").toString());
                    break;
                case "game-settings-ui":
                    report.put("gameSettingsUi",GameSettingsUiCases.run(this,
                            Boolean.parseBoolean(arguments.getString("layoutOnly","false")),
                            Boolean.parseBoolean(arguments.getString("landscape","false"))));
                    result.putString("gameSettingsUi",report.getJSONObject("gameSettingsUi").toString());
                    break;
                case "fan-settings-ui":
                    report.put("fanSettingsUi", FanSettingsUiCases.run(this,
                            Boolean.parseBoolean(arguments.getString("layoutOnly", "false"))));
                    result.putString("fanSettingsUi", report.getJSONObject("fanSettingsUi").toString());
                    break;
                case "health-settings-ui":
                    report.put("healthSettingsUi",HealthSettingsUiCases.run(this));
                    result.putString("healthSettingsUi",report.getJSONObject("healthSettingsUi").toString());
                    break;
                case "total-reset-fixture-seed":
                    report.put("totalResetFixture",TotalResetFixtureDeviceCases.seed(context));
                    result.putString("totalResetFixture",report.getJSONObject("totalResetFixture").toString());
                    break;
                case "owned-file-cleaner-fixture": {
                    TestOwnedFileCleaner.Report fixture=TestOwnedFileCleaner.run(context.getCacheDir(),true);
                    report.put("ownedFileCleaner",new JSONObject().put("passed",fixture.passed).put("unsupported",fixture.unsupported)
                            .put("cases",new JSONArray(fixture.results)));
                    LauncherResetXml.State grid=LauncherResetXml.read("<map><boolean value='true' name='owned'/><int value='6' name='original_rows'/><int name='original_columns' value='4'/></map>".getBytes(StandardCharsets.UTF_8),true);
                    if(!grid.pendingGridRestore)throw new AssertionError("Android XML parser missed grid recovery metadata");
                    int rejected=0;for(String invalid:new String[]{"<map><boolean name='owned' value='true'></map>","<map><int name='unknown' value='4'/></map>","<!DOCTYPE map [<!ENTITY x SYSTEM 'file:///irrelevant'>]><map/>"})
                        try{LauncherResetXml.read(invalid.getBytes(StandardCharsets.UTF_8),true);throw new AssertionError("Invalid grid XML accepted");}catch(java.io.IOException expected){rejected++;}
                    report.getJSONObject("ownedFileCleaner").put("androidXmlRecoveryParsing",true).put("invalidXmlRejected",rejected);
                    result.putString("ownedFileCleaner",report.getJSONObject("ownedFileCleaner").toString());
                    break;
                }
                case "total-reset-read-only":
                    report.put("totalResetUi",TotalResetReadOnlyDeviceCases.run(this));
                    result.putString("totalResetUi",report.getJSONObject("totalResetUi").toString());
                    break;
                case "config-transfer-actions":
                    report.put("configTransferActions",ConfigTransferActionsDeviceCases.run(this));
                    result.putString("configTransferActions",report.getJSONObject("configTransferActions").toString());
                    break;
                case "total-reset-inspect":
                    report.put("totalResetInspect",TotalResetInspectDeviceCases.run(context,arguments));
                    result.putString("totalResetInspect",report.getJSONObject("totalResetInspect").toString());
                    break;
                case "total-reset-root-paths":
                    report.put("totalResetRootPaths",TotalResetRootPathsDeviceCases.run(context));
                    result.putString("totalResetRootPaths",report.getJSONObject("totalResetRootPaths").toString());
                    break;
                case "launcher-grid-drag":
                    report.put("launcherGridDrag", LauncherGridDragDeviceCases.run(this,arguments));
                    result.putString("launcherGridDrag", report.getJSONObject("launcherGridDrag").toString());
                    break;
                case "launcher-grid-ui":
                    report.put("launcherGridUi", LauncherGridUiCases.run(this));
                    result.putString("launcherGridUi", report.getJSONObject("launcherGridUi").toString());
                    break;
                case "launcher-grid-runtime":
                    report.put("launcherGrid", LauncherGridDeviceCases.runtime(context,arguments));
                    result.putString("launcherGrid", report.getJSONObject("launcherGrid").toString());
                    break;
                case "brightness-controls":
                    report.put("brightness",BrightnessDeviceCases.run(context));
                    result.putString("brightness",report.getJSONObject("brightness").toString());
                    break;
                case "statusbar-assets-ui":
                    report.put("statusbarUi",StatusBarAssetsUiCases.run(this));
                    result.putString("statusbarUi",report.getJSONObject("statusbarUi").toString());
                    break;
                case "statusbar-customization-ui":
                    report.put("statusbarCustomizationUi",StatusBarCustomizationUiCases.run(this));
                    result.putString("statusbarCustomizationUi",report.getJSONObject("statusbarCustomizationUi").toString());
                    break;
                case "statusbar-network-ui":
                    report.put("statusbarNetworkUi",StatusBarNetworkUiCases.run(this,arguments));
                    result.putString("statusbarNetworkUi",report.getJSONObject("statusbarNetworkUi").toString());
                    break;
                case "statusbar-icon-style-ui":
                    report.put("statusbarIconStyleUi",StatusBarIconStyleUiCases.run(this,arguments));
                    result.putString("statusbarIconStyleUi",report.getJSONObject("statusbarIconStyleUi").toString());
                    break;
                case "island-settings-ui":
                    report.put("islandSettingsUi",IslandSettingsUiCases.run(this));
                    result.putString("islandSettingsUi",report.getJSONObject("islandSettingsUi").toString());
                    report.put("islandAppStyle",ls.augment.com.hook.IslandAppStyleRegressionCases.run(this));
                    result.putString("islandAppStyle",report.getJSONObject("islandAppStyle").toString());
                    break;
                case "statusbar-assets-runtime":
                    report.put("statusbarRuntime",StatusBarAssetsUiCases.runtime(context,arguments.getString("stage","observe")));
                    result.putString("statusbarRuntime",report.getJSONObject("statusbarRuntime").toString());
                    break;
                case "statusbar-assets-lifecycle":
                    report.put("statusbarLifecycle",StatusBarAssetsUiCases.lifecycle(this));
                    result.putString("statusbarLifecycle",report.getJSONObject("statusbarLifecycle").toString());
                    break;
                case "statusbar-assets-screen-off":
                    report.put("statusbarScreenOff",StatusBarAssetsUiCases.screenOff(this));
                    break;
                case "statusbar-asset-cases":
                    report.put("statusbarAssets",StatusBarAssetsDeviceCases.run(context));
                    result.putString("statusbarAssets",report.getJSONObject("statusbarAssets").toString());
                    break;
                case "power-dialog":
                    boolean powerDialogShown=getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES)
                            .performGlobalAction(android.accessibilityservice.AccessibilityService.GLOBAL_ACTION_POWER_DIALOG);
                    if(!powerDialogShown)throw new IllegalStateException("Power dialog action unavailable");
                    break;
                case "dialog-ui":
                    report.put("dialogs", DialogUiDeviceCases.run(this));
                    result.putString("dialogs", report.getJSONObject("dialogs").toString());
                    break;
                case "legal-scroll":
                    report.put("legalScroll", LegalScrollDeviceCases.run(this));
                    result.putString("legalScroll", report.getJSONObject("legalScroll").toString());
                    break;
                case "surface-flicker":
                    report.put("surfaceFlicker",SurfaceFlickerDeviceCases.run(this));
                    result.putString("surfaceFlicker",report.getJSONObject("surfaceFlicker").toString());
                    break;
                case "screenrecord-frames":
                    report.put("screenrecordFrames",ScreenRecordingFrameCases.run(this,arguments));
                    result.putString("screenrecordFrames",report.getJSONObject("screenrecordFrames").toString());
                    break;
                case "hide-performance":
                    report.put("performance", HidePerformanceDeviceCases.run(context, arguments));
                    result.putString("performance", report.getJSONObject("performance").toString());
                    break;
                case "hide-diagnose": {
                    RootHideManager manager = new RootHideManager(context);
                    report.put("root", manager.rootStatus().message);
                    JSONArray targets = new JSONArray();
                    for (RootHideManager.Target target : manager.targets()) {
                        HideRecoveryIdentity.Snapshot identity = HideRecoveryIdentity.read(context, target);
                        RootShell.Result stateDump = RootShell.run(HidePackageSnapshot.command(Set.of(target.packageName)), null, 15, 256 * 1024);
                        targets.put(new JSONObject().put("target", target.toString())
                                .put("problem", manager.currentTargetProblem(target))
                                .put("identitySuccess", identity.success).put("identityMessage", identity.message)
                                .put("identityKnown", !"unknown".equals(identity.packageIdentity))
                                .put("state", manager.queryState(target).name())
                                .put("stateDumpSuccess", stateDump.isSuccess()).put("stateDump", stateDump.output));
                    }
                    report.put("hideDiagnosis", targets);
                    report.put("observedSync", manager.syncMirrors().message);
                    result.putString("hideDiagnosis", targets.toString());
                    break;
                }
                case "hide-transport-probe": {
                    HideRootProtocol.Request request = new HideRootProtocol.Request(HideRootProtocol.Verb.PREPARE,
                            0, 0, "ls.augment.txvictim", null);
                    RootShell.Result reply = RootShell.run(request.command(), null, 15, 1024);
                    HideRootProtocol.Reply parsed = HideRootProtocol.parse(request, reply);
                    JSONObject probe = new JSONObject().put("exit", reply.exitCode).put("timeout", reply.timedOut)
                            .put("output", reply.output).put("reliable", reply.capture != null && reply.capture.reliable())
                            .put("raw", reply.capture == null ? "" : java.util.Base64.getEncoder().encodeToString(reply.capture.bytes()))
                            .put("parsed", parsed == null ? "null" : parsed.outcome.name());
                    if (parsed != null && parsed.outcome == HideRootProtocol.Outcome.RESERVED)
                        probe.put("cancel", RootShell.run(new HideRootProtocol.Request(HideRootProtocol.Verb.CANCEL,
                                0, 0, "ls.augment.txvictim", parsed.nonce).command(), null, 15, 1024).output);
                    report.put("transport", probe); result.putString("transport", probe.toString()); break;
                }
                case "hide-glass-dialog":
                    report.put("hideGlass", HideUiDeviceCases.glass(this));
                    result.putString("hideGlass", report.getJSONObject("hideGlass").toString());
                    break;
                case "hide-ui-response":
                    report.put("hideUi", HideUiDeviceCases.responsiveness(this));
                    result.putString("hideUi", report.getJSONObject("hideUi").toString());
                    break;
                case "hide-ui-autosave":
                    report.put("hideUi", HideUiDeviceCases.autosave(this));
                    result.putString("hideUi", report.getJSONObject("hideUi").toString());
                    break;
                case "hide-ui-layout":
                    report.put("hideUi", HideUiDeviceCases.run(this));
                    result.putString("hideUi", report.getJSONObject("hideUi").toString());
                    break;
                case "connectivity-icon-cases":
                    report.put("connectivityIcon", ConnectivityIconDeviceCases.run(context));
                    result.putString("connectivityIcon", report.getJSONObject("connectivityIcon").toString());
                    break;
                case "rapid-physical-capture-probe":
                    report.put("rapidPhysicalCapture", RapidFirePhysicalCaptureDeviceCases.run(context));
                    result.putString("rapidPhysicalCapture", report.getJSONObject("rapidPhysicalCapture").toString());
                    break;
                case "manual-target-fixture":
                    String manualLabel = arguments.getString("label");
                    if (manualLabel == null || !manualLabel.matches("[A-Za-z0-9_.-]+"))
                        throw new IllegalArgumentException("An explicit valid manual target result label is required");
                    report.put("manualTargetFixture", ManualTargetDeviceCases.run(context, arguments));
                    result.putString("manualTargetFixture", report.getJSONObject("manualTargetFixture").toString());
                    break;
                case "lifecycle-observation-fixture":
                    String observationLabel = arguments.getString("label");
                    if (observationLabel == null || !observationLabel.matches("[A-Za-z0-9_.-]+"))
                        throw new IllegalArgumentException("An explicit valid observation result label is required");
                    report.put("lifecycleObservationFixture", LifecycleObservationDeviceCases.run(context, arguments));
                    result.putString("lifecycleObservationFixture", report.getJSONObject("lifecycleObservationFixture").toString());
                    break;
                case "recovery-navigation-fixture":
                    String navigationLabel = arguments.getString("label");
                    if (navigationLabel == null || !navigationLabel.matches("[A-Za-z0-9_.-]+"))
                        throw new IllegalArgumentException("An explicit valid navigation result label is required");
                    report.put("recoveryNavigationFixture", RecoveryNavigationDeviceCases.run(this, arguments));
                    result.putString("recoveryNavigationFixture", report.getJSONObject("recoveryNavigationFixture").toString());
                    break;
                case "owned-restore-fixture":
                    String ownedLabel = arguments.getString("label");
                    if (ownedLabel == null || !ownedLabel.matches("[A-Za-z0-9_.-]+"))
                        throw new IllegalArgumentException("An explicit valid fixture result label is required");
                    report.put("ownedRestoreFixture", RootOwnedRestoreDeviceCases.run(context, arguments));
                    result.putString("ownedRestoreFixture", report.getJSONObject("ownedRestoreFixture").toString());
                    break;
                case "root-transaction-fixture":
                    String fixtureLabel = arguments.getString("label");
                    if (fixtureLabel == null || !fixtureLabel.matches("[A-Za-z0-9_.-]+"))
                        throw new IllegalArgumentException("An explicit valid fixture result label is required");
                    report.put("rootTransactionFixture", RootTransactionDeviceCases.run(context, arguments));
                    result.putString("rootTransactionFixture", report.getJSONObject("rootTransactionFixture").toString());
                    break;
                case "prototype-navigation":
                    report.put("nativePrototype",ModuleHierarchyUiCases.run(this));
                    result.putString("nativePrototype",report.getJSONObject("nativePrototype").toString());
                    break;
                case "ui-navigation":
                    report.put("ui", UiNavigationRegression.run(this));
                    break;
                case "ui-preview":
                    report.put("ui", UiNavigationRegression.runPreview(this));
                    break;
                case "package-enumeration":
                    report.put("enumeration", PackageEnumerationDiagnostics.capture(context));
                    break;
                case "config-visibility-grant":
                    context.grantUriPermission("cn.nubia.filebrowser",
                            android.net.Uri.parse("content://ls.augment.com.config/config"),
                            android.content.Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    report.put("grantReturned", true);
                    break;
                case "clock-cases":
                    report.put("formatterCases", ls.augment.com.hook.ClockRegressionCases.run())
                            .put("phoneClockChanged", false);
                    break;
                case "snapshot":
                    report.put("settings", new JSONObject(config.snapshot()));
                    report.put("aliasState", context.getPackageManager().getComponentEnabledSetting(
                            new ComponentName(context, context.getPackageName() + ".LauncherAlias")));
                    JSONArray targets = new JSONArray();
                    RootHideManager manager = new RootHideManager(context);
                    for (RootHideManager.Target target : manager.targets())
                        targets.put(new JSONObject().put("user", target.userId).put("package", target.packageName)
                                .put("state", manager.queryState(target).name()));
                    report.put("targets", targets);
                    break;
                case "set":
                    JSONObject values = new JSONObject(new String(java.util.Base64.getDecoder()
                            .decode(arguments.getString("values")), StandardCharsets.UTF_8));
                    LinkedHashMap<String, String> updates = new LinkedHashMap<>();
                    java.util.Iterator<String> keys = values.keys();
                    while (keys.hasNext()) { String key = keys.next(); updates.put(key, values.getString(key)); }
                    AppConfig.SaveResult saved = config.save(updates);
                    if (!saved.success) throw new IllegalStateException(saved.message);
                    report.put("keys", new JSONArray(updates.keySet())).put("runtimeSynced", saved.runtimeSynced);
                    for (Map.Entry<String, String> entry : updates.entrySet()) {
                        String normalized = ConfigSchema.normalize(entry.getKey(), entry.getValue());
                        if (!normalized.equals(config.get(entry.getKey()))) throw new AssertionError("Not persisted: " + entry.getKey());
                    }
                    break;
                case "island-fixture":
                    report.put("islandFixture",IslandFixtureDeviceCases.run(this,arguments));
                    result.putString("islandFixture",report.getJSONObject("islandFixture").toString());
                    break;
                case "private-storage-verify":
                    report.put("privateStorage",PrivateStorageDeviceCases.run(context));
                    break;
                case "assert-defaults":
                    JSONArray mismatches = new JSONArray();
                    for (Map.Entry<String, String> expected : ConfigSchema.defaults().entrySet())
                        if (!expected.getValue().equals(config.get(expected.getKey()))) mismatches.put(expected.getKey());
                    report.put("checked", ConfigSchema.keys().size()).put("mismatches", mismatches);
                    if (mismatches.length() != 0) throw new AssertionError("Non-default keys: " + mismatches);
                    int state = context.getPackageManager().getComponentEnabledSetting(new ComponentName(context,
                            context.getPackageName() + ".LauncherAlias"));
                    if (state == PackageManager.COMPONENT_ENABLED_STATE_DISABLED) throw new AssertionError("Launcher entry is disabled");
                    ConfigSnapshot snapshot = config.configSnapshot();
                    if (!FrameworkConfigSync.isPublished(snapshot)) throw new AssertionError("Private framework publication mismatch");
                    report.put("privateFrameworkPublication", "matched");
                    break;
                case "seed-reset":
                    Map<String, String> seed = new LinkedHashMap<>();
                    seed.put(ConfigSchema.HIDE_MASTER, "1");
                    seed.put(ConfigSchema.AUTOMATION_ENABLED, "0");
                    seed.put(ConfigSchema.TILE_LABEL, "RESET_TEST");
                    seed.put(ConfigSchema.TILE_DESCRIPTION, "RESET_DESCRIPTION");
                    seed.put(ConfigSchema.STORE_DOWNLOAD_COUNT, "7");
                    seed.put(ConfigSchema.AUDIO_GAIN_STEP, "9");
                    seed.put("ls_augment_rm_lock_timeout_seconds", "27");
                    seed.put(AppearanceOptions.LIGHT_MASK, "42");
                    seed.put(AppearanceOptions.DARK_MASK, "31");
                    if (!config.save(seed).success) throw new AssertionError("Cannot seed reset values");
                    RootHideManager hide = new RootHideManager(context);
                    Set<RootHideManager.Target> selected = new LinkedHashSet<>(hide.targets());
                    RootHideManager.Target fixture = new RootHideManager.Target(0, "ls.augment.validation");
                    selected.add(fixture);
                    RootHideManager.OperationResult selection = hide.saveTargets(selected);
                    if (!selection.success) throw new AssertionError(selection.message);
                    RootHideManager.OperationResult hidden = hide.hide(fixture);
                    if (!hidden.success || hide.queryState(fixture) != RootHideManager.State.HIDDEN)
                        throw new AssertionError("Fixture did not hide: " + hidden.message);
                    context.getPackageManager().setComponentEnabledSetting(new ComponentName(context,
                            context.getPackageName() + ".LauncherAlias"), PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                            PackageManager.DONT_KILL_APP);
                    report.put("changedSettings", seed.size()).put("fixtureHidden", true).put("aliasHidden", true);
                    break;
                case "audio-set":
                    JSONObject audioRequest = new JSONObject(new String(java.util.Base64.getDecoder()
                            .decode(arguments.getString("values")), StandardCharsets.UTF_8));
                    getUiAutomation().adoptShellPermissionIdentity("android.permission.MODIFY_AUDIO_SETTINGS");
                    try {
                        android.media.AudioManager control = context.getSystemService(android.media.AudioManager.class);
                        int selectedStream = audioRequest.optInt("stream", 3);
                        if (audioRequest.has("adjust")) control.adjustStreamVolume(selectedStream, audioRequest.getInt("adjust"), 0);
                        else if (audioRequest.has("value")) control.setStreamVolume(selectedStream, audioRequest.getInt("value"), 0);
                        if (audioRequest.has("ringer")) control.setRingerMode(audioRequest.getInt("ringer"));
                        android.os.SystemClock.sleep(1200);
                    } finally { getUiAutomation().dropShellPermissionIdentity(); }
                    report.put("requested", audioRequest);
                    // Read back the live AudioService value, not the requested value.
                case "audio-state":
                    android.media.AudioManager audio = context.getSystemService(android.media.AudioManager.class);
                    JSONArray streams = new JSONArray();
                    for (int stream : new int[]{0, 2, 3, 4, 5})
                        streams.put(new JSONObject().put("stream", stream).put("minimum", audio.getStreamMinVolume(stream))
                                .put("maximum", audio.getStreamMaxVolume(stream)).put("current", audio.getStreamVolume(stream))
                                .put("muted", audio.isStreamMute(stream)));
                    JSONArray outputs = new JSONArray();
                    for (android.media.AudioDeviceInfo device : audio.getDevices(android.media.AudioManager.GET_DEVICES_OUTPUTS))
                        outputs.put(new JSONObject().put("id", device.getId()).put("type", device.getType()));
                    report.put("streams", streams).put("outputs", outputs).put("ringerMode", audio.getRingerMode());
                    break;
                case "hide-list":
                    RootHideManager listing = new RootHideManager(context);
                    RootShell.Result rawApps = RootShell.run("/system/bin/pm list packages -3 --user 0", null, 30, 2 * 1024 * 1024);
                    report.put("rootState", listing.rootStatus().state.name()).put("rootExit", rawApps.exitCode)
                            .put("rootLineCount", rawApps.output.split("\\r?\\n").length);
                    java.util.List<RootHideManager.AppRecord> apps = listing.listApps(0);
                    int fixtureCount = 0;
                    for (RootHideManager.AppRecord app : apps) if (app.target.packageName.equals("ls.augment.validation")) fixtureCount++;
                    report.put("managedListCount", apps.size()).put("fixtureCount", fixtureCount);
                    try {
                        android.content.pm.ApplicationInfo fixtureInfo = context.getPackageManager().getApplicationInfo("ls.augment.validation", 0);
                        report.put("fixtureFlags", fixtureInfo.flags);
                    } catch (Exception e) { report.put("fixtureError", e.toString()); }
                    report.put("rawRootPackages", rawApps.output);
                    break;
                case "hide-configure":
                    JSONObject hiding = new JSONObject(new String(java.util.Base64.getDecoder()
                            .decode(arguments.getString("values")), StandardCharsets.UTF_8));
                    RootHideManager preparing = new RootHideManager(context);
                    Set<RootHideManager.Target> chosen = new LinkedHashSet<>();
                    JSONArray chosenValues = hiding.getJSONArray("targets");
                    for (int i=0;i<chosenValues.length();i++) {
                        String[] parts=chosenValues.getString(i).split(":",2);
                        if (parts.length!=2 || !(parts[1].equals("ls.augment.validation") || parts[1].startsWith("ls.augment.regression.")))
                            throw new IllegalArgumentException("Only test fixture packages can be prepared");
                        chosen.add(new RootHideManager.Target(Integer.parseInt(parts[0]),parts[1]));
                    }
                    RootHideManager.OperationResult prepared=preparing.saveTargets(chosen);
                    if(!prepared.success) throw new AssertionError(prepared.message);
                    RootHideManager.OperationResult shown=preparing.showAll();
                    if(!shown.success) throw new AssertionError(shown.message);
                    JSONArray hiddenValues=hiding.optJSONArray("hidden");
                    if(hiddenValues!=null)for(int i=0;i<hiddenValues.length();i++) {
                        String[] parts=hiddenValues.getString(i).split(":",2);
                        RootHideManager.Target item=new RootHideManager.Target(Integer.parseInt(parts[0]),parts[1]);
                        if(!chosen.contains(item))throw new IllegalArgumentException("Hidden fixture must be selected");
                        RootHideManager.OperationResult action=preparing.hide(item);
                        if(!action.success)throw new AssertionError(action.message);
                    }
                    report.put("preparedFixtureTargets",chosenValues).put("aggregate",preparing.summary().aggregate.name());
                    break;
                case "restore-baseline":
                    JSONObject baseline = new JSONObject(new String(java.util.Base64.getDecoder()
                            .decode(arguments.getString("values")), StandardCharsets.UTF_8));
                    JSONObject original = baseline.getJSONObject("settings");
                    Map<String, String> restoredValues = new LinkedHashMap<>();
                    for (String key : ConfigSchema.keys()) {
                        String value = original.has(key) ? original.getString(key) : ConfigSchema.defaultValue(key);
                        if (ConfigSchema.normalize(key, value) == null) throw new IllegalArgumentException("Invalid baseline key: " + key);
                        restoredValues.put(key, value);
                    }
                    if (baseline.getJSONArray("targets").length() != 0)
                        throw new IllegalArgumentException("This session restore requires the verified empty original target list");
                    Map<String, String> stopped = new LinkedHashMap<>();
                    stopped.put(ConfigSchema.HIDE_MASTER, "0");stopped.put(ConfigSchema.AUTOMATION_ENABLED, "0");
                    if (!config.save(stopped).success) throw new AssertionError("Cannot stop temporary automation");
                    RootHideManager restoreManager = new RootHideManager(context);
                    RootHideManager.OperationResult cleared = restoreManager.saveTargets(java.util.Collections.emptySet(), restoredValues);
                    if (!cleared.success || !cleared.runtimeSynced) throw new AssertionError(cleared.message);
                    context.getPackageManager().setComponentEnabledSetting(new ComponentName(context,
                            context.getPackageName() + ".LauncherAlias"), baseline.getInt("aliasState"), PackageManager.DONT_KILL_APP);
                    ScreenAutomation.sync(context);
                    if (!config.snapshot().equals(restoredValues)) throw new AssertionError("Baseline setting mismatch after restore");
                    report.put("restoredSettings", restoredValues.size()).put("originalTargets", 0)
                            .put("aliasState", baseline.getInt("aliasState"));
                    break;
                case "reset-root-refusal":
                    android.content.SharedPreferences diagnostics = context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0);
                    boolean hadSuppressed = diagnostics.contains("root_prompt_suppressed");
                    boolean oldSuppressed = diagnostics.getBoolean("root_prompt_suppressed", false);
                    String oldRootState = diagnostics.getString("root_last_state", null);
                    Map<String, String> beforeRefusal = config.snapshot();
                    if (beforeRefusal.get(ConfigSchema.HIDE_TARGETS).isEmpty()) throw new AssertionError("Seed hidden recovery target first");
                    try {
                        diagnostics.edit().putBoolean("root_prompt_suppressed", true).putString("root_last_state", "DENIED").commit();
                        ConfigResetController.Result refused = ConfigResetController.reset(context);
                        if (refused.success || !beforeRefusal.equals(config.snapshot()))
                            throw new AssertionError("Reset erased settings while recovery was unavailable");
                        report.put("message", refused.message).put("settingsPreserved", true)
                                .put("injection", "App-side Root refusal state; OS grant is unchanged");
                    } finally {
                        android.content.SharedPreferences.Editor restore = diagnostics.edit();
                        if (hadSuppressed) restore.putBoolean("root_prompt_suppressed", oldSuppressed); else restore.remove("root_prompt_suppressed");
                        if (oldRootState != null) restore.putString("root_last_state", oldRootState); else restore.remove("root_last_state");
                        restore.commit();
                    }
                    RootHideManager.Target kept = new RootHideManager.Target(0, "ls.augment.validation");
                    if (new RootHideManager(context).queryState(kept) != RootHideManager.State.HIDDEN)
                        throw new AssertionError("Fixture hidden state was unexpectedly changed");
                    break;
                default:
                    throw new IllegalArgumentException("Unknown operation: " + operation);
            }
            boolean passed = !"root-transaction-fixture".equals(operation)
                    || report.getJSONObject("rootTransactionFixture").getBoolean("success");
            if ("owned-restore-fixture".equals(operation))
                passed = report.getJSONObject("ownedRestoreFixture").getBoolean("success");
            if ("recovery-navigation-fixture".equals(operation))
                passed = report.getJSONObject("recoveryNavigationFixture").getBoolean("success");
            if ("lifecycle-observation-fixture".equals(operation))
                passed = report.getJSONObject("lifecycleObservationFixture").getBoolean("success");
            if ("manual-target-fixture".equals(operation))
                passed = report.getJSONObject("manualTargetFixture").getBoolean("success");
            if ("rapid-physical-capture-probe".equals(operation))
                passed = report.getJSONObject("rapidPhysicalCapture").getBoolean("success");
            if ("total-reset-inspect".equals(operation))
                passed = report.getJSONObject("totalResetInspect").getBoolean("success");
            if ("total-reset-root-paths".equals(operation))
                passed = report.getJSONObject("totalResetRootPaths").getBoolean("success");
            report.put("status", passed ? "pass" : "fail");
            File directory = new File(context.getFilesDir(), "device-regression-results");
            directory.mkdirs();
            String label = arguments.getString("label", "latest");
            if (!label.matches("[A-Za-z0-9_.-]+")) throw new IllegalArgumentException("Invalid result label");
            File file = new File(directory, label + ".json");
            Files.write(file.toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
            result.putString("resultFile", file.getAbsolutePath());
            result.putString("status", passed ? "pass" : "fail");
            result.putString("operation", operation);
            finish(passed ? Activity.RESULT_OK : Activity.RESULT_CANCELED, result);
        } catch (Throwable failure) {
            result.putString("status", "fail");
            result.putString("error", android.util.Log.getStackTraceString(failure));
            finish(Activity.RESULT_CANCELED, result);
        }
    }
}
