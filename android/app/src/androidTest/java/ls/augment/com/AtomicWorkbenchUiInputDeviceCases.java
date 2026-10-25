package ls.augment.com;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Real four-window UI acceptance using only isolated developer samples.
 * App tiles and side shields execute their real click callbacks. Input then enters
 * the actual TextureView's dispatchTouchEvent and its production touch listener.
 * This intentionally does not call client.touchWindow or mutate the UI/model.
 */
final class AtomicWorkbenchUiInputDeviceCases {
    private static final String[] PACKAGES = {"ls.augment.workbench.fixture.one",
            "ls.augment.workbench.fixture.two", "ls.augment.workbench.fixture.three",
            "ls.augment.workbench.fixture.four"};
    private static final String[] COUNTERS = {"click_count", "touch_down_count", "touch_up_count",
            "touch_cancel_count", "long_click_count", "pointer_down_count", "pointer_up_count", "touch_event_count"};
    private final Instrumentation test;
    private final Context target;
    private final AppConfig config;
    private final String nonce = UUID.randomUUID().toString().replace("-", "");
    private final Object observationLock = new Object();
    private final Map<String, Integer> uids = new HashMap<>();
    private final Map<String, Bundle> observations = new HashMap<>();
    private final Map<String, Identity> identities = new LinkedHashMap<>();
    private final Map<String, Integer> liveTasks = new LinkedHashMap<>();
    private final Map<String, Long> attemptedLaunches = new LinkedHashMap<>();
    private final JSONArray actions = new JSONArray(), screens = new JSONArray();
    private final File directory;
    private Activity activity;
    private String stage = "prepare";
    private boolean ownsSession;
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || !nonce.equals(intent.getStringExtra("nonce"))) return;
            String pkg = intent.getStringExtra("fixture_package");
            Integer expected = uids.get(pkg);
            if (expected == null || getSentFromUid() != expected) return;
            synchronized (observationLock) { observations.put(pkg, new Bundle(intent.getExtras())); }
        }
    };

    private AtomicWorkbenchUiInputDeviceCases(Instrumentation test) {
        this.test = test;
        target = test.getTargetContext();
        config = new AppConfig(target);
        directory = new File(target.getExternalFilesDir(null), "atomic-workbench-ui-input");
    }

    static JSONObject run(Instrumentation test) throws Exception {
        return new AtomicWorkbenchUiInputDeviceCases(test).execute(false);
    }

    private String physicalEvidence = "physical-p0";
    private boolean extractionTextFixture, extractionEditorInsertion, extractionDragWitness, extractionConfigChanged, extractionConfigRestored = true, extractionClosed = true;
    private final Map<String, String> extractionConfigBefore = new LinkedHashMap<>();
    private Activity extractionActivity;
    private AtomicWorkbenchExtractionHandoff extractionHandoff;
    private String extractionNonce, ownedExtractionText, pendingHashBefore, accessibilityServicesBefore, accessibilityEnabledBefore;
    private Object observedExtractionDrag;
    private final JSONArray extractionDragEvents = new JSONArray();
    private final Map<View, View.OnDragListener> extractionDragListeners = new LinkedHashMap<>();
    private boolean extractionRealSource;
    private boolean extractionNoFocusTarget;
    private boolean extractionFocusProbe;
    private boolean extractionGeometryProbe;
    private Instrumentation.ActivityMonitor realExtractionMonitor;
    private int realSourceReadinessPending;
    private boolean extractionObserveResults;
    private boolean extractionResultListenerChanged;
    private final JSONArray realSourceResults = new JSONArray();
    private java.util.function.Consumer<AtomicWorkbenchExtractionResult> originalExtractionResultListener;

    static JSONObject runPhysical(Instrumentation test, Bundle arguments) throws Exception {
        AtomicWorkbenchUiInputDeviceCases cases = new AtomicWorkbenchUiInputDeviceCases(test);
        cases.physicalEvidence = arguments.getString("label", "physical-p0");
        cases.extractionTextFixture = "1".equals(arguments.getString("extractionTextFixture", "0"));
        cases.extractionEditorInsertion = "1".equals(arguments.getString("extractionEditorInsertion", "0"));
        cases.extractionDragWitness = "1".equals(arguments.getString("extractionDragWitness", "0"));
        cases.extractionRealSource = "1".equals(arguments.getString("extractionRealSource", "0"));
        cases.extractionNoFocusTarget = "1".equals(arguments.getString("extractionNoFocusTarget", "0"));
        cases.extractionFocusProbe = "1".equals(arguments.getString("extractionFocusProbe", "0"));
        require(!cases.extractionFocusProbe || cases.extractionNoFocusTarget, "Focus-only diagnosis requires the explicitly unfocused owned fixture");
        require(!cases.extractionNoFocusTarget || cases.extractionRealSource, "No-focus target requires the real owned source fixture");
        cases.extractionGeometryProbe = "1".equals(arguments.getString("extractionGeometryProbe", "0"));
        require(!cases.extractionGeometryProbe || cases.extractionRealSource, "Geometry diagnosis requires the real owned fixture");
        cases.extractionObserveResults = "1".equals(arguments.getString("extractionObserveResults", "0"));
        require(!cases.extractionObserveResults || cases.extractionRealSource, "Result diagnostics require the real owned source mode");
        require(!cases.extractionRealSource || cases.extractionEditorInsertion && !cases.extractionDragWitness,
                "Real source extraction requires the authorized service and unchanged native drag handlers");
        require(!cases.extractionEditorInsertion || cases.extractionTextFixture && !cases.extractionDragWitness,
                "Editor insertion requires the explicit owned-text fixture without a diagnostic drag wrapper");
        require(cases.physicalEvidence.matches("[A-Za-z0-9_.-]{1,64}"), "Invalid physical evidence directory");
        return cases.execute(true);
    }

    private JSONObject execute(boolean physical) throws Exception {
        JSONObject report = new JSONObject()
                .put("scope", "REAL_WORKBENCH_FOUR_PRELAUNCHED_FIXTURES_SIDE_PROMOTION_FIRST_TOUCH")
                .put("inputMethod", "REAL_TEXTURE_VIEW_DISPATCH_TOUCH_EVENT")
                .put("launchMethod", "REAL_QUICK_APP_TILE_PERFORM_CLICK")
                .put("promotionMethod", "REAL_SIDE_SHIELD_PERFORM_CLICK")
                .put("firstTouchGate", "FIRST_OBSERVED_MAIN_READY_TRUE_IN_SAME_MAIN_CALLBACK")
                .put("postPromotionInputHandleBarrier", false).put("postPromotionFocusBarrier", false)
                .put("postPromotionFrameBarrier", false).put("firstTapRetries", 0)
                .put("tapHoldMs", 48).put("readyPollMs", 1)
                .put("screenAwakePolicy", "TEST_WINDOW_KEEP_SCREEN_ON_NO_SETTING_CHANGE")
                .put("device", android.os.Build.MODEL).put("screens", screens).put("actions", actions)
                .put("untested", new JSONArray().put("FRESH_APP_LAUNCH_FIRST_TOUCH")
                        .put("PHYSICAL_HOST_HIT_TESTING_AND_OCCLUSION")
                        .put("SYSTEM_GESTURE_NAVIGATION_AND_PHYSICAL_KEYBOARD")
                        .put("REAL_APP_CONTACTS_MESSAGES_AND_EXTERNAL_CONTENT"));
        String beforeQuick = config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        boolean registered = false, passed = false, restored = false, quickRestored = false;
        try {
            require(config.getBoolean(AtomicWorkbenchConfig.ENABLED), "Enable workbench before acceptance");
            require(!AtomicWorkbenchCleanup.pending(), "Prior workbench cleanup must finish first");
            require(directory.isDirectory() || directory.mkdirs(), "Cannot create evidence directory");
            android.os.PowerManager power = target.getSystemService(android.os.PowerManager.class);
            android.app.KeyguardManager keyguard = target.getSystemService(android.app.KeyguardManager.class);
            require(power != null && power.isInteractive() && keyguard != null && !keyguard.isKeyguardLocked(),
                    "Phone must be awake and unlocked; acceptance does not change device settings");
            for (String pkg : PACKAGES)
                uids.put(pkg, target.getPackageManager().getApplicationInfo(pkg, 0).uid);
            require(new java.util.HashSet<>(uids.values()).size() == PACKAGES.length, "Fixtures need distinct UIDs");
            target.registerReceiver(receiver, new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE),
                    Context.RECEIVER_EXPORTED);
            registered = true;
            for (String pkg : PACKAGES) control(pkg, AtomicWorkbenchFixtureActivity.ACTION_FINISH);
            saveQuick("1");
            activity = test.startActivitySync(new Intent(target, AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            ownsSession = true;
            main(() -> { activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); return null; });
            await(() -> main(() -> field("client") != null && (Boolean) invoke("mainReady", new Class<?>[0])
                    && !(Boolean) field("busy")), "Initial native HOME is ready");
            ArrayList<Bundle> initial = status().getParcelableArrayList("windows", Bundle.class);
            require(initial != null, "Initial window snapshot unavailable");
            for (Bundle window : initial) {
                ArrayList<String> running = window.getStringArrayList("running_packages");
                require(running != null && running.isEmpty(), "Use an empty workbench; do not replace user app tasks");
            }
            // Setup observes real launches and sample geometry. First-touch timing is
            // measured separately for subsequent real side-window promotions, never
            // widened into a claim about fresh-launch input readiness.
            for (String pkg : PACKAGES) {
                stage = "setup_quick_launch_" + pkg;
                identities.put(pkg, launch(pkg));
            }
            require(identities.size() == 4, "Four real fixture identities required");
            require(new java.util.HashSet<>(windowIds()).size() == 4
                    && new java.util.HashSet<>(displayIds()).size() == 4, "Fixtures share a window or display");
            report.put("initialFourWindows", assertIdentities());
            capture("01-four-real-windows");
            if (physical) {
                report.put("scope", "REAL_FOUR_FIXTURES_PHYSICAL_IME_AND_NAVIGATION_ACCEPTANCE")
                        .put("inputMethod", "UI_AUTOMATION_PHYSICAL_DISPLAY_0_TOUCHSCREEN")
                        .put("validationLayer", "EXTERNAL_ASSERTIONS_ON_AUTHENTICATED_FIXTURES_AND_OBSERVED_UI")
                        .put("untested", new JSONArray().put("REAL_APP_CONTACTS_MESSAGES_AND_EXTERNAL_CONTENT"));
                String pkg = PACKAGES[3];
                Bundle state = observeAll().get(pkg);
                if (!extractionNoFocusTarget) {
                Gesture editorTap = begin(pkg, state, "editor", "physical_setup_editor");
                SystemClock.sleep(48L); up(editorTap);
                Bundle focusedEditor = awaitFixture(pkg, value -> value.getBoolean("editor_focused")
                        && value.getInt("touch_up_count") == state.getInt("touch_up_count") + 1);
                assertOneCompleteGesture(state, focusedEditor);
                JSONObject initialIme = AtomicWorkbenchImeDeviceProbe.awaitVisible(test, pkg, uids.get(pkg), identities.get(pkg).display, 12_000L);
                require(initialIme.getBoolean("success"), "Phone IME is required for physical acceptance");
                editorTap.evidence.put("after", fixtureEvidence(focusedEditor)).put("phoneIme", initialIme).put("success", true);
                } else {
                    Bundle noFocus=awaitFixture(pkg,value->!value.getBoolean("editor_focused")&&value.getBoolean("window_focused")
                            &&"".equals(value.getString("editor_text")));
                    report.put("originalNoFocusTarget",fixtureEvidence(noFocus)).put("noFocusEditorSetupSkipped",true);
                }
                if (extractionTextFixture) {
                    stage = extractionRealSource ? "prepare_real_source_observer" : "prepare_owned_extracted_text_fixture";
                    if (extractionDragWitness) main(() -> { installExtractionDragWitness(); return null; });
                    prepareExtractedTextFixture();
                    report.put("scope", extractionRealSource ? "REAL_OWNED_SOURCE_SYSTEM_EXTRACTION_OBSERVER"
                                    : "SYNTHETIC_ALREADY_EXTRACTED_TEXT_REAL_FLOATING_ACTIVITY_PHYSICAL_DRAG")
                            .put("realSourceExtractionTested", false).put("syntheticAlreadyExtractedText", !extractionRealSource).put("editorInsertionTested", false)
                            .put("editorInsertionRequested", extractionEditorInsertion)
                            .put("systemPermissionsChangedByTest", false);
                }
                JSONObject manual = AtomicWorkbenchPhysicalDeviceSession.run(test, activity,
                        new File(directory, physicalEvidence), () -> {
                            for (String source : PACKAGES) control(source, AtomicWorkbenchFixtureActivity.ACTION_QUERY);
                            JSONObject observation = new JSONObject().put("fixtures", fixturesEvidence(latestAll()))
                                    .put("activityFinishing", activity.isFinishing()).put("activityDestroyed", activity.isDestroyed())
                                    .put("mainReady", main(() -> invoke("mainReady", new Class<?>[0])))
                                    .put("hostResumed", main(() -> field("resumed")))
                                    .put("hostFocusedWindow", main(() -> field("focusedWindow")))
                                    .put("quickOpenAppsBeforeDeveloperSession", beforeQuick);
                            String expected = pkg; int expectedDisplay = identities.get(pkg).display;
                            try {
                                JSONObject current = snapshot(status()); observation.put("workspace", current);
                                JSONArray windows = current.getJSONArray("windows");
                                for (int index = 0; index < windows.length(); index++) {
                                    JSONObject window = windows.getJSONObject(index);
                                    String top = packageOf(window.optString("top_component"));
                                    if (window.optInt("window_id", -1) == current.getInt("mainWindow")
                                            && uids.containsKey(top) && window.optInt("display_id", -1) > 0) {
                                        expected = top; expectedDisplay = window.getInt("display_id");
                                    }
                                }
                            } catch (Exception | AssertionError unavailable) { observation.put("workspaceFailure", unavailable.getMessage()); }
                            observation.put("expectedEditorPackage", expected).put("imeEvidence",
                                    AtomicWorkbenchImeDeviceProbe.observeCurrent(test, expected, uids.get(expected), expectedDisplay));
                            if (extractionTextFixture) observation.put("extractionFixture", extractionObservation());
                            return observation;
                        }, id -> extractionGeometryProbe ? probeOwnedGeometry(id) : probeOwnedPaste(id));
                report.put("physicalSession", manual); passed = manual.getBoolean("success");
            } else {
            for (int index : new int[]{0, 2, 1, 3, 0, 1, 2, 3}) {
                String pkg = PACKAGES[index];
                stage = "side_promotion_first_tap_" + index;
                Map<String, Bundle> before = observeAll();
                Gesture tap = promoteAndFirstDown(pkg, before.get(pkg));
                SystemClock.sleep(48L); // Ordinary DOWN-to-UP duration, never a readiness delay.
                up(tap);
                Map<String, Bundle> after = completedObservations(pkg, before.get(pkg), tap.lastEventAt);
                tap.evidence.put("after", fixtureEvidence(after.get(pkg))).put("allFixturesAfter", fixturesEvidence(after));
                assertTap(before.get(pkg), after.get(pkg), tap, true);
                confirmTapFrames(tap);
                assertPromotionWindowFocus(pkg, before, tap);
                assertOthersUntouched(pkg, before, after);
                tap.evidence.put("after", fixtureEvidence(after.get(pkg)))
                        .put("allFixturesAfter", fixturesEvidence(after))
                        .put("identitiesAfter", assertIdentities()).put("success", true);
            }

            // Exercise the same production UI event path for each promoted target.
            // Every promotion's first action above has already passed without retry.
            for (int index : new int[]{0, 1, 2, 3}) {
                String pkg = PACKAGES[index];
                stage = "gesture_promotion_first_tap_" + index;
                Map<String, Bundle> before = observeAll();
                Gesture tap = promoteAndFirstDown(pkg, before.get(pkg));
                SystemClock.sleep(48L);
                up(tap);
                Map<String, Bundle> after = completedObservations(pkg, before.get(pkg), tap.lastEventAt);
                tap.evidence.put("after", fixtureEvidence(after.get(pkg))).put("allFixturesAfter", fixturesEvidence(after));
                assertTap(before.get(pkg), after.get(pkg), tap, true);
                confirmTapFrames(tap);
                assertPromotionWindowFocus(pkg, before, tap);
                assertOthersUntouched(pkg, before, after);
                tap.evidence.put("after", fixtureEvidence(after.get(pkg)))
                        .put("allFixturesAfter", fixturesEvidence(after)).put("success", true);
                stage = "scroll_" + index;
                scroll(pkg);
                stage = "long_press_" + index;
                longPress(pkg);
                stage = "two_pointer_" + index;
                multiTouch(pkg);
                assertIdentities();
            }
            stage = "editor_ui_tap";
            String editorPackage = PACKAGES[3];
            Identity editorIdentity = identities.get(editorPackage);
            Map<String, Bundle> beforeEditor = observeAll();
            Gesture editorTap = begin(editorPackage, beforeEditor.get(editorPackage), "editor", "editor_tap");
            SystemClock.sleep(48L);
            up(editorTap);
            Bundle editor = awaitFixture(editorPackage, value -> sameIdentity(editorIdentity, value)
                    && value.getLong("at_uptime", -1) >= editorTap.lastEventAt && value.getBoolean("editor_focused"));
            assertTap(beforeEditor.get(editorPackage), editor, editorTap, false);
            Map<String, Bundle> editorAfter = observeAfter(editorTap.lastEventAt);
            assertOthersUntouched(editorPackage, beforeEditor, editorAfter);
            editorTap.evidence.put("after", fixtureEvidence(editor)).put("success", true);
            stage = "phone_ime_and_editor_text";
            JSONObject ime = AtomicWorkbenchImeDeviceProbe.awaitVisible(test, editorPackage,
                    uids.get(editorPackage), editorIdentity.display, 12_000L);
            report.put("imeEvidence", ime);
            require(ime.optBoolean("success"), "Real phone IME target is unconfirmed: " + ime);
            String expectedText = "uiworkbench42";
            AtomicWorkbenchImeDeviceProbe.sendLatinText(test, editorIdentity.display, expectedText);
            Bundle typed = awaitFixture(editorPackage, value -> sameIdentity(editorIdentity, value)
                    && expectedText.equals(value.getString("editor_text", "")));
            report.put("editorText", typed.getString("editor_text", ""))
                    .put("textInputMethod", "DEVELOPER_ALPHANUMERIC_INPUT_COMMAND_TO_REAL_EDITOR")
                    .put("finalFourWindows", assertIdentities());
            capture("02-phone-ime-real-virtual-editor");
            passed = true;
            }
        } catch (Exception | AssertionError failure) {
            report.put("failure", failure.getClass().getSimpleName() + ": " + failure.getMessage())
                    .put("stage", stage).put("fixtureObservationsAtFailure", fixturesEvidence(latestAll()));
            if (activity != null) {
                try { report.put("windowStateAtFailure", snapshot(status())); } catch (Exception ignored) { }
                try { capture("99-failure"); } catch (Exception ignored) { }
            }
        } finally {
            // Test-only capture cleanup must not replace or bypass the original four-task finally.
            if (extractionTextFixture) try {
                if (extractionHandoff != null) extractionHandoff.expire(extractionNonce);
                if (extractionActivity == null && realExtractionMonitor != null)
                    extractionActivity = realExtractionMonitor.getLastActivity();
                if (extractionActivity != null) {
                    main(() -> { extractionActivity.finish(); return null; });
                    await(() -> main(extractionActivity::isDestroyed), "Owned extraction Activity must finish");
                }
                extractionClosed = true;
            } catch (Exception | AssertionError failure) {
                extractionClosed = false; report.put("extractionCloseFailure", failure.getClass().getSimpleName());
            }
            if (realExtractionMonitor != null) try { test.removeMonitor(realExtractionMonitor); }
            catch (Exception | AssertionError failure) { extractionClosed = false; report.put("realExtractionMonitorCleanupFailure", failure.getClass().getSimpleName()); }
            finally { realExtractionMonitor = null; }
            if (extractionResultListenerChanged) try { main(() -> {
                AtomicWorkbenchExtractionSystemBridge.setResultListener(originalExtractionResultListener); return null;
            }); } catch (Exception | AssertionError failure) {
                extractionClosed = false; report.put("realExtractionListenerCleanupFailure", failure.getClass().getSimpleName());
            }
            if (extractionTextFixture) try { main(() -> { restoreExtractionDragWitness(); return null; }); }
            catch (Exception | AssertionError failure) {
                extractionClosed = false; report.put("extractionWitnessRestoreFailure", failure.getClass().getSimpleName());
            }
            // Identity failures cannot skip closing the actual owned scope, and
            // only a fresh reply for the same task can authorize fixture finish.
            try {
                if (ownsSession && activity != null) try {
                    Map<String, Integer> recoveryTasks = new LinkedHashMap<>(liveTasks);
                    JSONArray identityFailures = new JSONArray();
                    try { ((ExecutorService) get(activity, "WORKER")).submit(() -> { }).get(20L, TimeUnit.SECONDS); }
                    catch (Exception | AssertionError unavailable) {
                        identityFailures.put("Launch work completion unconfirmed");
                        report.put("recoveryWorkerFailure", unavailable.getClass().getSimpleName());
                    }
                    try {
                        ArrayList<Bundle> windows = status().getParcelableArrayList("windows", Bundle.class);
                        if (windows != null) for (Bundle window : windows) {
                            String pkg = packageOf(window.getString("top_component", ""));
                            int task = window.getInt("task_id", -1);
                            if (!attemptedLaunches.containsKey(pkg) || task <= 0) continue;
                            Integer known = recoveryTasks.putIfAbsent(pkg, task);
                            if (known != null && known != task) identityFailures.put("Conflicting current task: " + pkg);
                        }
                    } catch (Exception | AssertionError unavailable) {
                        identityFailures.put("Current window task snapshot unconfirmed");
                        report.put("recoveryStatusFailure", unavailable.getClass().getSimpleName());
                    }
                    for (Map.Entry<String, Long> attempt : attemptedLaunches.entrySet()) {
                        String pkg = attempt.getKey(); long started = attempt.getValue();
                        try {
                            Integer expected = recoveryTasks.get(pkg);
                            Bundle observed = awaitFixture(pkg, value -> !value.getBoolean("destroyed")
                                    && value.getLong("at_uptime", -1) >= started && value.getInt("task_id", -1) > 0
                                    && (expected != null ? value.getInt("task_id", -1) == expected
                                            : value.getInt("display_id", -1) > 0));
                            recoveryTasks.put(pkg, observed.getInt("task_id"));
                        } catch (Exception | AssertionError unavailable) {
                            identityFailures.put("Current attempted task unconfirmed: " + pkg);
                        }
                    }
                    Map<String, Integer> frozenTasks = java.util.Collections.unmodifiableMap(new LinkedHashMap<>(recoveryTasks));
                    JSONArray frozen = new JSONArray();
                    for (Map.Entry<String, Integer> entry : frozenTasks.entrySet())
                        frozen.put(new JSONObject().put("fixture_package", entry.getKey()).put("task_id", entry.getValue()));
                    report.put("recoveryTasksBeforeClose", frozen).put("recoveryIdentityFailures", identityFailures);
                    long closeStarted = SystemClock.uptimeMillis();
                    main(() -> { invoke("requestCloseAll", new Class<?>[]{boolean.class}, true); return null; });
                    try { ((ExecutorService) get(activity, "WORKER")).submit(() -> { }).get(20L, TimeUnit.SECONDS); }
                    catch (Exception | AssertionError unavailable) {
                        identityFailures.put("Close work completion unconfirmed");
                        report.put("recoveryCloseWorkerFailure", unavailable.getClass().getSimpleName());
                    }
                    await(() -> !AtomicWorkbenchCleanup.pending(), "Phone cleanup confirms task recovery");
                    JSONArray returned = new JSONArray();
                    for (Map.Entry<String, Integer> entry : frozenTasks.entrySet()) {
                        int expectedTask = entry.getValue();
                        Bundle value = awaitFixture(entry.getKey(), state -> !state.getBoolean("destroyed")
                                && state.getInt("task_id", -1) == expectedTask && state.getInt("display_id", -1) == 0
                                && state.getLong("at_uptime", -1) >= closeStarted);
                        returned.put(fixtureEvidence(value));
                    }
                    report.put("returnedSameTasksOnPhoneDisplay", returned);
                    require(identityFailures.length() == 0, "Every attempted fixture needs a current task identity before recovery can be confirmed");
                    liveTasks.clear(); liveTasks.putAll(frozenTasks);
                    restored = true;
                } catch (Exception | AssertionError failure) {
                    report.put("recoveryFailure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
                }
                if (restored && registered) try {
                    for (Map.Entry<String, Integer> entry : liveTasks.entrySet()) {
                        long finishStarted = SystemClock.uptimeMillis(); int expectedTask = entry.getValue();
                        control(entry.getKey(), AtomicWorkbenchFixtureActivity.ACTION_FINISH);
                        awaitFixture(entry.getKey(), value -> value.getBoolean("destroyed")
                                && value.getInt("task_id", -1) == expectedTask
                                && value.getLong("at_uptime", -1) >= finishStarted);
                    }
                    report.put("fixturesFinishedAfterRestore", true);
                } catch (Exception | AssertionError failure) {
                    restored = false;
                    report.put("fixtureFinishFailure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
                }
            } finally {
                try {
                    if (registered) try { target.unregisterReceiver(receiver); }
                    catch (Exception | AssertionError failure) {
                        restored = false; report.put("receiverRecoveryFailure", failure.getClass().getSimpleName());
                    }
                } finally {
                    if (extractionConfigChanged) try {
                        AppConfig.SaveResult saved = config.save(extractionConfigBefore);
                        require(saved.success, "Extraction test configuration restoration failed");
                        for (Map.Entry<String, String> entry : extractionConfigBefore.entrySet())
                            require(entry.getValue().equals(config.get(entry.getKey())), "Extraction setting differs after restore");
                        extractionConfigRestored = true;
                    } catch (Exception | AssertionError failure) {
                        report.put("extractionConfigRecoveryFailure", failure.getClass().getSimpleName());
                    }
                    try { saveQuick(beforeQuick); quickRestored = true; }
                    catch (Exception | AssertionError failure) {
                        report.put("quickConfigRecoveryFailure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
                    }
                }
            }
        }
        boolean permissionsUnchanged = !extractionTextFixture || accessibilityServicesBefore == null || extractionPermissionsUnchanged();
        if (extractionTextFixture) report.put("extractionActivityClosed", extractionClosed)
                .put("extractionConfigurationRestored", extractionConfigRestored).put("systemPermissionsUnchanged", permissionsUnchanged);
        return report.put("realSourceReadinessPending", realSourceReadinessPending)
                .put("recoveryConfirmed", restored).put("quickConfigurationRestored", quickRestored)
                .put("success", passed && restored && quickRestored && extractionClosed && extractionConfigRestored && permissionsUnchanged);
    }

    /** Real mode only observes production callbacks; synthetic mode explicitly offers owned test text. */
    private void prepareExtractedTextFixture() throws Exception {
        accessibilityServicesBefore = secureValue("enabled_accessibility_services");
        accessibilityEnabledBefore = secureValue("accessibility_enabled");
        android.content.ComponentName pasteService = new android.content.ComponentName(target, AtomicWorkbenchPasteService.class);
        boolean declared = false;
        for (String component : accessibilityServicesBefore.split(":"))
            declared |= pasteService.equals(android.content.ComponentName.unflattenFromString(component));
        require(declared == extractionEditorInsertion, "Enabled-service setting does not match this explicit fixture mode");
        if (extractionEditorInsertion) {
            Bundle readiness=new Bundle();readiness.putString("ownedPasteServiceAwaitingConnection",physicalEvidence);
            test.sendStatus(0,readiness);
            await(AtomicWorkbenchPasteService::available,
                    "Already user-enabled paste service must actually connect before insertion fixture setup");
        }
        else require(!AtomicWorkbenchPasteService.available(), "This refusal-only fixture requires the paste service to remain disabled");
        for (String key : new String[]{AtomicWorkbenchExtractionPolicy.ENABLED, AtomicWorkbenchExtractionPolicy.TEXT_ENABLED})
            extractionConfigBefore.put(key, config.get(key));
        extractionConfigChanged = true; extractionConfigRestored = false;
        require(config.save(Map.of(AtomicWorkbenchExtractionPolicy.ENABLED, "1", AtomicWorkbenchExtractionPolicy.TEXT_ENABLED, "1")).success,
                "Cannot prepare the two temporary extraction fixture settings");
        pendingHashBefore = pendingManifestHash();
        if (extractionRealSource) {
            ownedExtractionText = "原子工作台开发验收";
            if (extractionObserveResults) main(() -> {
                Field listener = AtomicWorkbenchExtractionSystemBridge.class.getDeclaredField("listener"); listener.setAccessible(true);
                originalExtractionResultListener = (java.util.function.Consumer<AtomicWorkbenchExtractionResult>) listener.get(null);
                require(originalExtractionResultListener == null, "A preexisting extraction result consumer must remain unchanged");
                AtomicWorkbenchExtractionSystemBridge.setResultListener(value -> {
                    try { boolean owned = value.sourcePackage != null && identities.containsKey(value.sourcePackage);
                        realSourceResults.put(new JSONObject().put("state", value.state.name()).put("kind", value.kind.name())
                                .put("sourceOwned", owned).put("ownedTextMatches", owned && ownedExtractionText.equals(value.text)));
                    } catch (Exception failed) { throw new AssertionError(failed); }
                });
                extractionResultListenerChanged = true;
                return null;
            });
            realExtractionMonitor = test.addMonitor(AtomicWorkbenchExtractionActivity.class.getName(), null, false);
            await(() -> {
                if (!AtomicWorkbenchExtractionSystemBridge.isRegistered()) return false;
                try { return AtomicWorkbenchExtractionSystemBridge.checkReady(); }
                catch (java.io.IOException pending) {
                    realSourceReadinessPending++;
                    return false;
                }
            }, "Fresh system extraction registration must settle before any source input");
            return;
        }
        ownedExtractionText = "已提取测试文本 DuoDrag" + nonce.substring(0, 8);
        Field handoff = AtomicWorkbenchExtractionPresentation.class.getDeclaredField("HANDOFF"); handoff.setAccessible(true);
        extractionHandoff = (AtomicWorkbenchExtractionHandoff) handoff.get(null);
        ConfigSnapshot current = config.configSnapshot();
        extractionNonce = extractionHandoff.offer(new AtomicWorkbenchExtractionHandoff.Value(nonce, ownedExtractionText,
                target.getPackageName(), current.checksum, ResetWriteFence.generation()));
        require(extractionNonce != null, "Private synthetic text handoff was not issued");
        extractionClosed = false;
        Instrumentation.ActivityMonitor monitor = test.addMonitor(AtomicWorkbenchExtractionActivity.class.getName(), null, false);
        try {
            require(main(() -> AtomicWorkbenchExtractionPresentation.launch(activity, extractionNonce)), "Actual private presentation did not launch");
            extractionActivity = monitor.waitForActivityWithTimeout(10_000L);
            require(extractionActivity != null, "Actual extraction Activity monitor timed out");
            require(extractionActivity.getTaskId() == activity.getTaskId(), "Private extraction must belong to its actual visible workbench task");
        } finally { test.removeMonitor(monitor); }
        await(() -> main(() -> !extractionActivity.isFinishing() && (Boolean) get(extractionActivity, "started")
                && extractionActivity.getWindow().getDecorView().findViewWithTag("atomic-workbench-extracted-preview") != null),
                "Actual extraction Activity did not accept synthetic text");
    }

    private JSONObject extractionObservation() throws Exception {
        JSONObject result = main(() -> {
            if (extractionActivity == null && realExtractionMonitor != null) {
                extractionActivity = realExtractionMonitor.getLastActivity();
                if (extractionActivity != null) extractionClosed = false;
            }
            JSONObject value = new JSONObject().put("syntheticAlreadyExtractedText", !extractionRealSource)
                    .put("realSourceRequested", extractionRealSource)
                    .put("nativeResultDiagnostic", extractionObserveResults).put("realSourceResults", new JSONArray(realSourceResults.toString()))
                    .put("testDragHandlerWitness", extractionDragWitness)
                    .put("ownedTestText", ownedExtractionText)
                    .put("realSourceExtractionTested", false).put("editorInsertionTested", false)
                    .put("editorInsertionRequested", extractionEditorInsertion)
                    .put("workbenchStatus", ((TextView) field("status")).getText().toString())
                    .put("textDeliveryActive", field("textDeliveryActive")).put("workbenchBusy", field("busy"))
                    .put("pasteServiceAvailable", AtomicWorkbenchPasteService.available());
            Object coordinator = field("pasteCoordinator");
            JSONArray outcomes = new JSONArray();
            synchronized (coordinator) {
                for (Object entry : ((Map<?, ?>) get(coordinator, "completed")).values()) {
                    AtomicWorkbenchPasteResult outcome = (AtomicWorkbenchPasteResult) entry;
                    outcomes.put(new JSONObject().put("state", outcome.state.name()).put("reason", outcome.reason)
                            .put("located", outcome.located).put("dispatched", outcome.dispatched)
                            .put("verified", outcome.verified).put("focusRestored", outcome.focusRestored));
                }
            }
            value.put("productionPasteOutcomes", outcomes);
            if (extractionRealSource) {
                Field live = AtomicWorkbenchExtractionSystemBridge.class.getDeclaredField("live"); live.setAccessible(true);
                Object bridge = live.get(null);
                value.put("systemPointerRegistered", AtomicWorkbenchExtractionSystemBridge.isRegistered())
                        .put("workspaceGeometryAttempted", field("extractionGeometryAttempted"))
                        .put("workspaceGeometryCandidatePresent", !((String) field("extractionGeometrySignature")).isEmpty());
                if (bridge != null) synchronized (get(bridge, "lock")) { value.put("nativeSystemRequestActive", get(bridge, "active") != null); }
            }
            if (extractionActivity == null) return value.put("sourceMissing", true);
            if (extractionRealSource) {
                AtomicWorkbenchExtractionHandoff.Value accepted = (AtomicWorkbenchExtractionHandoff.Value) get(extractionActivity, "value");
                boolean owned = accepted != null && identities.containsKey(accepted.sourcePackage);
                value.put("realAcceptedSourceOwned", owned).put("realAcceptedTextMatchesOwned", owned && ownedExtractionText.equals(accepted.text));
                if (owned) value.put("realAcceptedSourcePackage", accepted.sourcePackage);
            }
            Object source = get(extractionActivity, "transfer"), receiver = field("transfer");
            value.put("separateTransferInstances", source != null && receiver != null && source != receiver)
                    .put("sourceTask", extractionActivity.getTaskId()).put("receiverTask", activity.getTaskId())
                    .put("receiverForeground", receiver == null ? false : get(receiver, "foreground"))
                    .put("receiverActive", field("active"))
                    .put("sourceWindowFlags", extractionActivity.getWindow().getAttributes().flags)
                    .put("sourceWindowAlpha", extractionActivity.getWindow().getAttributes().alpha)
                    .put("realWorkspaceDragEvents", new JSONArray(extractionDragEvents.toString()))
                    .put("sourceStarted", get(extractionActivity, "started")).put("sourceFinishing", extractionActivity.isFinishing())
                    .put("sourceDestroyed", extractionActivity.isDestroyed());
            Object drag = source == null ? null : get(source, "activeDrag");
            value.put("activeDrag", drag != null);
            if (drag != null) observedExtractionDrag = drag;
            if (observedExtractionDrag != null) {
                AtomicWorkbenchPendingPayload frozen = (AtomicWorkbenchPendingPayload) get(observedExtractionDrag, "frozen");
                value.put("frozenTextIsOwnedTestText", !frozen.text.isEmpty() && ownedExtractionText.contains(frozen.text))
                        .put("frozenTextLength", frozen.text.length()).put("frozenHasFiles", !frozen.files.isEmpty())
                        .put("dragConsumed", get(observedExtractionDrag, "consumed")).put("dragEnded", get(observedExtractionDrag, "ended"));
                if (extractionEditorInsertion && !frozen.text.isEmpty() && ownedExtractionText.contains(frozen.text))
                    value.put("ownedFrozenText", frozen.text);
            }
            Object tool = get(extractionActivity, "textTool");
            android.app.Dialog dialog = tool == null ? null : (android.app.Dialog) get(tool, "dialog");
            value.put("toolDialogShowing", dialog != null && dialog.isShowing());
            if (dialog != null) value.put("toolWindowAlpha", dialog.getWindow().getAttributes().alpha)
                    .put("toolWindowFlags", dialog.getWindow().getAttributes().flags)
                    .put("toolWindowFocused", dialog.getWindow().getDecorView().hasWindowFocus());
            JSONArray hovered = new JSONArray();
            for (Identity identity : identities.values()) if ((Boolean) slotField(identity.window, "dropHovered")) hovered.put(identity.window);
            return value.put("hoveredWindowIds", hovered);
        });
        String hash = pendingManifestHash();
        return result.put("pendingManifestSha256", hash).put("pendingManifestUnchanged", hash.equals(pendingHashBefore))
                .put("systemPermissionsUnchanged", extractionPermissionsUnchanged());
    }

    /** A separate metadata/read-only diagnostic after a rejected owned drop; never commits text. */
    /** Diagnostic only: observes one actual production registration reply; never a source acceptance. */
    private JSONObject probeOwnedGeometry(int id) throws Exception {
        require(extractionGeometryProbe && extractionRealSource && extractionEditorInsertion, "Explicit geometry diagnosis required");
        AtomicWorkbenchClient client=main(()->(AtomicWorkbenchClient)field("client"));
        Bundle geometry=main(()->{
            require(client!=null&&(Boolean)field("active")&&(Boolean)invoke("mainReady",new Class<?>[0])
                    &&!(Boolean)field("busy")&&extractionActivity==null&&AtomicWorkbenchPasteService.available(),"Owned geometry probe not idle");
            String pkg=(String)invoke("transferPackage",new Class<?>[]{int.class},id);Identity owned=identities.get(pkg);
            require(owned!=null&&owned.window==id&&owned.task==(Integer)slotField(id,"targetTaskId")
                    &&owned.display==(Integer)slotField(id,"displayId"),"Geometry source is not the original owned fixture");
            Bundle candidate=(Bundle)invoke("captureExtractionGeometry",new Class<?>[0]);
            if(candidate==null)return null;
            Field sequence=activity.getClass().getDeclaredField("extractionGeometryRevision");sequence.setAccessible(true);
            long next=sequence.getLong(activity)+1;sequence.setLong(activity,next);
            candidate.putLong("revision",next);candidate.putLong("deadline",SystemClock.elapsedRealtime()+2400L);return candidate;
        });
        JSONObject result=new JSONObject().put("scope","OWNED_PRODUCTION_GEOMETRY_REGISTRATION_DIAGNOSIS_ONLY")
                .put("sourceInputSent",false).put("sourceAcceptance",false).put("candidatePresent",geometry!=null);
        if(geometry==null)return result;
        Bundle before=client.status();result.put("actualInputRevision",before.getLong("input_revision",-1))
                .put("expectedInputRevision",geometry.getLong("input_revision",-2))
                .put("cleanupPendingBefore",before.getBoolean("extraction_geometry_cleanup_pending"));
        try{
            Bundle reply=client.registerExtractionGeometry(geometry);
            String message=reply.getString("message","");
            String stage=reply.getBoolean("success")?"REGISTERED":message.equals("工作台画面尚未就绪，文字提取未注册。")?"ROOT_NOT_READY"
                    :message.equals("工作台窗口身份已变化，普通输入保留，文字提取暂不可用。")?"WINDOW_IDENTITY_OR_INPUT_REVISION"
                    :message.equals("工作台显示代际已变化，提取注册未应用。")?"UI_GENERATION":"UNKNOWN_REFUSAL";
            result.put("registrationSuccess",reply.getBoolean("success")).put("registrationStage",stage);
        }catch(Exception refused){
            String message=refused.getMessage();result.put("exception",refused.getClass().getSimpleName())
                    .put("registrationStage",message!=null&&message.matches("[a-z_]{1,100}")?message:"RPC_REFUSED");
        }
        Bundle after=client.status();result.put("cleanupPendingAfter",after.getBoolean("extraction_geometry_cleanup_pending"));
        return result;
    }

    private JSONObject probeOwnedPaste(int id) throws Exception {
        require(extractionTextFixture && extractionEditorInsertion && id >= 0 && id < 8,
                "Read-only paste probe requires the explicitly authorized owned insertion fixture");
        AtomicWorkbenchClient client = main(() -> (AtomicWorkbenchClient) field("client"));
        AtomicWorkbenchPasteRequest request = main(() -> {
            require(client != null && (Boolean) field("active") && !(Boolean) field("busy")
                    && !(Boolean) field("textDeliveryActive") && AtomicWorkbenchPasteService.available(), "Paste operation is not idle");
            require(extractionActivity != null && get(get(extractionActivity, "transfer"), "activeDrag") == null,
                    "Read-only probe cannot overlap a source drag");
            String pkg = (String) invoke("transferPackage", new Class<?>[]{int.class}, id);
            Identity identity = identities.get(pkg);
            require(identity != null && identity.window == id && identity.task == (Integer) slotField(id, "targetTaskId")
                    && identity.display == (Integer) slotField(id, "displayId")
                    && identity.unique.equals(slotField(id, "displayUniqueId")), "Probe target is not the same owned task/display");
            return new AtomicWorkbenchDeliveryTarget(client.inputSession(), ((Number) field("launchGeneration")).longValue(),
                    ((Number) field("epoch")).longValue(), id, identity.display, (String) slotField(id, "displayName"), identity.unique,
                    android.os.Process.myUid() / 100000, android.os.Process.myUid(), (Integer) slotField(id, "targetUid"),
                    identity.task, pkg, nonce, 0L, SystemClock.elapsedRealtime()).paste("x");
        });
        JSONObject result = new JSONObject().put("textCommitAttempted", false).put("window", id);
        AtomicWorkbenchPasteCoordinator.Editor editor = null;
        try {
            result.put("explicitHostFocusBeforePrepare", true).put("hostFocus", probeReply(client.focusHostInput()));
            Bundle focusPrepared=null;
            if(extractionFocusProbe){
                result.put("scope","OWNED_WINDOW_FOCUS_AND_EDITOR_METADATA_DIAGNOSIS_ONLY").put("sourceAcceptance",false);
                result.put("rootBefore",new JSONObject().put("revision",client.status().getLong("input_revision",-1)));
                focusPrepared=client.preparePaste(request);result.put("windowPrepare",probeReply(focusPrepared));
                require("editable_focus_required".equals(focusPrepared.getString("reason")),"Expected an unfocused window-only lease");
                var proof=AtomicWorkbenchEditorEvidence.WindowEvidence.fromBundle(focusPrepared.getBundle("window_evidence"));
                result.put("visibleNodeFocus",AtomicWorkbenchPasteService.focusFirstVisible(request,proof));
                result.put("rootAfterNodeFocus",new JSONObject().put("revision",client.status().getLong("input_revision",-1)));
                focusPrepared=client.preparePaste(request);result.put("immediateEditorPrepare",probeReply(focusPrepared));
            }else result.put("targetFocus", probeReply(client.focusWindow(id)));
            long bindDeadline = SystemClock.uptimeMillis() + 2500L;
            JSONObject input;
            do {
                input = AtomicWorkbenchImeDeviceProbe.observeCurrent(test, request.packageName, request.targetUid, request.displayId);
                if (input.optInt("target_uid", -1) == request.targetUid && input.optInt("target_display_id", -1) == request.displayId
                        && request.packageName.equals(input.optString("editor_package")) && input.optBoolean("current_client_consistent")) break;
                SystemClock.sleep(40L);
            } while (SystemClock.uptimeMillis() < bindDeadline);
            result.put("inputMetadataAfterExplicitFocus", input);
            Bundle prepared = focusPrepared==null||!focusPrepared.getBoolean("success") ? client.preparePaste(request) : focusPrepared;
            result.put("prepare", probeReply(prepared));
            if (prepared.getBoolean("success")) {
                AtomicWorkbenchEditorEvidence evidence = AtomicWorkbenchEditorEvidence.fromBundle(prepared.getBundle("evidence"));
                result.put("evidenceMatches", evidence.matches(request, SystemClock.elapsedRealtime()));
                editor = AtomicWorkbenchPasteService.backend().capture(request, evidence);
                result.put("editorCurrent", editor.current());
                android.view.accessibility.AccessibilityNodeInfo node = (android.view.accessibility.AccessibilityNodeInfo) get(editor, "node");
                result.put("nodeSelection", main(() -> new JSONObject().put("start", node.getTextSelectionStart())
                        .put("end", node.getTextSelectionEnd()).put("inputType", node.getInputType())));
                android.accessibilityservice.InputMethod.AccessibilityInputConnection connection =
                        (android.accessibilityservice.InputMethod.AccessibilityInputConnection) get(editor, "connection");
                android.view.inputmethod.SurroundingText around = connection.getSurroundingText(
                        AtomicWorkbenchPastePolicy.CONTEXT, AtomicWorkbenchPastePolicy.CONTEXT, 0);
                result.put("connectionRead", new JSONObject().put("returned", around != null)
                        .put("length", around == null || around.getText() == null ? -1 : around.getText().length())
                        .put("start", around == null ? -1 : around.getSelectionStart()).put("end", around == null ? -1 : around.getSelectionEnd())
                        .put("offset", around == null ? -1 : around.getOffset()).put("editorCurrentAfterRead", editor.current()));
                AtomicWorkbenchPastePolicy.Snapshot read = editor.read();
                result.put("boundedReadAvailable", read != null).put("validate", probeReply(client.validatePaste(request, evidence)));
            }
        } catch (Exception | AssertionError failed) {
            String reason = failed.getMessage();
            result.put("failureType", failed.getClass().getSimpleName()).put("failureReason",
                    reason != null && reason.matches("[a-z_]{1,64}") ? reason : "diagnostic_unavailable");
        } finally {
            if (editor != null) editor.close();
            result.put("release", probeReply(client.releasePaste(request)));
            AtomicWorkbenchPasteService.releaseVisibleFocus(request);
        }
        return result;
    }

    private static JSONObject probeReply(Bundle reply) throws Exception {
        JSONObject result = new JSONObject();
        for (String key : new String[]{"success", "reason", "focus_restored", "restore_required", "cleanup_pending", "operation_unconfirmed"})
            if (reply.containsKey(key)) result.put(key, reply.get(key));
        return result;
    }

    /** Opt-in diagnostic only; acceptance uses the unchanged listener without this wrapper. */
    private void installExtractionDragWitness() throws Exception {
        Method handler = AtomicWorkbenchActivity.class.getDeclaredMethod("onWorkspaceDrag", int.class, View.class, android.view.DragEvent.class);
        handler.setAccessible(true);
        for (Identity identity : identities.values()) {
            View frame = (View) slotField(identity.window, "frame");
            final int windowId = identity.window;
            // Slot.frame's existing listener calls this same production member once.
            // Do not access hidden framework listener fields or bypass its admission.
            View.OnDragListener original = (view, event) -> {
                try { return (Boolean) handler.invoke(activity, windowId, view, event); }
                catch (java.lang.reflect.InvocationTargetException failure) {
                    Throwable cause = failure.getCause();
                    if (cause instanceof RuntimeException) throw (RuntimeException) cause;
                    if (cause instanceof Error) throw (Error) cause;
                    throw new AssertionError(cause);
                } catch (ReflectiveOperationException failure) { throw new AssertionError(failure); }
            };
            extractionDragListeners.put(frame, original);
            frame.setOnDragListener((view, event) -> {
                boolean accepted = original.onDrag(view, event);
                if (extractionDragEvents.length() < 48) try {
                    extractionDragEvents.put(new JSONObject().put("window", windowId).put("action", event.getAction())
                            .put("at_uptime", SystemClock.uptimeMillis()).put("accepted", accepted));
                } catch (org.json.JSONException failure) { throw new AssertionError(failure); }
                return accepted;
            });
        }
    }

    private void restoreExtractionDragWitness() {
        for (Map.Entry<View, View.OnDragListener> entry : extractionDragListeners.entrySet())
            entry.getKey().setOnDragListener(entry.getValue());
        extractionDragListeners.clear();
    }

    private String secureValue(String key) { String value = android.provider.Settings.Secure.getString(target.getContentResolver(), key); return value == null ? "<absent>" : value; }
    private boolean extractionPermissionsUnchanged() {
        return accessibilityServicesBefore.equals(secureValue("enabled_accessibility_services"))
                && accessibilityEnabledBefore.equals(secureValue("accessibility_enabled"))
                && AtomicWorkbenchPasteService.available() == extractionEditorInsertion;
    }
    private String pendingManifestHash() throws Exception {
        File file = new File(target.getFilesDir(), "workbench-pending-v2.bin");
        if (!file.isFile()) return "<absent>";
        java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-256");
        try (java.io.InputStream input = new java.io.FileInputStream(file)) { byte[] buffer = new byte[8192]; int count;
            while ((count = input.read(buffer)) != -1) digest.update(buffer, 0, count); }
        StringBuilder result = new StringBuilder(); for (byte value : digest.digest()) result.append(String.format("%02x", value & 255)); return result.toString();
    }

    private Identity launch(String pkg) throws Exception {
        String component = component(pkg);
        await(() -> main(() -> (Boolean) invoke("canInteract", new Class<?>[0])
                && activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:" + component) != null),
                "Real application tile available: " + pkg);
        main(() -> {
            View tile = activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:" + component);
            if (tile.isEnabled() && tile.isShown()) attemptedLaunches.put(pkg, SystemClock.uptimeMillis());
            require(tile.isEnabled() && tile.isShown() && tile.performClick(), "App tile rejected click: " + pkg);
            return null;
        });
        AtomicReference<Bundle> result = new AtomicReference<>();
        await(() -> {
            control(pkg, AtomicWorkbenchFixtureActivity.ACTION_QUERY);
            int id = main(() -> model().mainWindowId());
            Bundle value = window(status(), id);
            if (value != null && value.getInt("task_id", -1) > 0 && value.getInt("display_id", -1) > 0
                    && pkg.equals(packageOf(value.getString("top_component", ""))))
                liveTasks.put(pkg, value.getInt("task_id"));
            if (value == null || !value.getBoolean("success") || !"active".equals(value.getString("state"))
                    || value.getBoolean("recovery_pending") || value.getInt("display_id", -1) <= 0
                    || value.getInt("task_id", -1) <= 0 || !pkg.equals(packageOf(value.getString("top_component", "")))
                    || !main(() -> component.equals(model().component(id)) && (Boolean) invoke("mainReady", new Class<?>[0])))
                return false;
            result.set(value); return true;
        }, "Real app occupies main window: " + pkg);
        Bundle state = result.get();
        int id = state.getInt("window_id", -1), task = state.getInt("task_id", -1), display = state.getInt("display_id", -1);
        liveTasks.put(pkg, task);
        awaitFixture(pkg, value -> value.getInt("task_id", -1) == task && value.getInt("display_id", -1) == display
                && geometryReady(value));
        await(() -> main(() -> ((AtomicWorkbenchSurface) slotField(id, "surface")).frameCount() > 0L),
                "Setup receives an actual fixture display frame: " + pkg);
        return main(() -> new Identity(pkg, state, (AtomicWorkbenchSurface) slotField(id, "surface"),
                (Integer) slotField(id, "surfaceLifecycle")));
    }

    /** No status/fixture query, sleep or frame/input/focus gate runs after this click and before DOWN. */
    private Gesture promoteAndFirstDown(String pkg, Bundle before) throws Exception {
        Identity identity = identities.get(pkg);
        JSONObject evidence = new JSONObject().put("action", "side_promotion_first_tap").put("package", pkg)
                .put("window", identity.window).put("before", fixtureEvidence(before))
                .put("allFixturesBefore", fixturesEvidence(latestAll())).put("success", false);
        actions.put(evidence);
        long clickedAt = main(() -> {
            require(model().mainWindowId() != identity.window, "Target must begin as a real side window");
            require((Boolean) invoke("canInteract", new Class<?>[0]), "Workbench does not accept promotion");
            View shield = (View) slotField(identity.window, "shield");
            require(shield.isShown() && shield.isEnabled(), "Real side shield is not actionable");
            long now = SystemClock.uptimeMillis();
            require(shield.performClick(), "Real side shield rejected click");
            return now;
        });
        evidence.put("promotionClickAt", clickedAt);
        long deadline = SystemClock.uptimeMillis() + 15_000L;
        do {
            Gesture gesture = main(() -> {
                if (model().mainWindowId() != identity.window || !(Boolean) invoke("mainReady", new Class<?>[0])) return null;
                long readyAt = SystemClock.uptimeMillis();
                // Coordinate data was authenticated before promotion. A fresh
                // fixture focus/layout observation here would conceal the race.
                Gesture value = new Gesture(identity, before.getFloat("button_x"), before.getFloat("button_y"), evidence);
                value.readyAt = readyAt;
                value.downAt = SystemClock.uptimeMillis();
                value.lastEventAt = value.downAt;
                value.downHandled = dispatch(value, MotionEvent.ACTION_DOWN, value.x, value.y);
                evidence.put("firstObservedMainReadyAt", readyAt).put("downAt", value.downAt)
                        .put("readyToDownMs", value.downAt - readyAt).put("promotionToDownMs", value.downAt - clickedAt)
                        .put("prePromotionGeometryAt", before.getLong("at_uptime", -1))
                        .put("downHandledByView", value.downHandled).put("geometryAtDown", value.geometry)
                        .put("mainReadyAtDown", true);
                return value;
            });
            if (gesture != null) return gesture;
            SystemClock.sleep(1L); // Poll readiness; never wait after it first reports true.
        } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError("Side promotion never reached mainReady: " + pkg);
    }

    private Gesture begin(String pkg, Bundle state, String prefix, String action) throws Exception {
        Identity identity = identities.get(pkg);
        JSONObject evidence = new JSONObject().put("action", action).put("package", pkg)
                .put("before", fixtureEvidence(state)).put("success", false);
        actions.put(evidence);
        return main(() -> {
            require(model().mainWindowId() == identity.window && (Boolean) invoke("mainReady", new Class<?>[0]),
                    "Gesture target is not the real ready main window");
            Gesture value = new Gesture(identity, state.getFloat(prefix + "_x"), state.getFloat(prefix + "_y"), evidence);
            value.downAt = value.lastEventAt = SystemClock.uptimeMillis();
            value.downHandled = dispatch(value, MotionEvent.ACTION_DOWN, value.x, value.y);
            evidence.put("downAt", value.downAt).put("geometryAtDown", value.geometry);
            return value;
        });
    }

    private void up(Gesture gesture) throws Exception {
        main(() -> {
            gesture.lastEventAt = SystemClock.uptimeMillis();
            boolean handled = dispatch(gesture, MotionEvent.ACTION_UP, gesture.x, gesture.y);
            gesture.evidence.put("upAt", gesture.lastEventAt).put("upHandledByView", handled)
                    .put("geometryAtUp", surfaceGeometry(gesture.identity));
            return null;
        });
    }

    private void scroll(String pkg) throws Exception {
        Map<String, Bundle> before = observeAll(); Bundle old = before.get(pkg);
        Identity identity = identities.get(pkg);
        JSONObject evidence = new JSONObject().put("action", "scroll").put("package", pkg)
                .put("before", fixtureEvidence(old)).put("success", false);
        actions.put(evidence);
        float range = old.getInt("scroll_height") * .30f;
        Gesture gesture = main(() -> {
            Gesture value = new Gesture(identity, old.getFloat("scroll_x"), old.getFloat("scroll_y") + range, evidence);
            value.downAt = value.lastEventAt = SystemClock.uptimeMillis();
            dispatch(value, MotionEvent.ACTION_DOWN, value.x, value.y); return value;
        });
        for (int step = 1; step <= 8; step++) {
            SystemClock.sleep(20L);
            final float remoteY = old.getFloat("scroll_y") + range - 2 * range * step / 8f;
            main(() -> { gesture.y = gesture.localY(remoteY); dispatch(gesture, MotionEvent.ACTION_MOVE, gesture.x, gesture.y); return null; });
        }
        up(gesture);
        Map<String, Bundle> after = completedObservations(pkg, old, gesture.lastEventAt); Bundle value = after.get(pkg);
        assertOneCompleteGesture(old, value);
        require(value.getInt("scroll_offset_y") > old.getInt("scroll_offset_y"), "Real ScrollView did not move");
        require(value.getInt("click_count") == old.getInt("click_count"), "Scroll clicked the sample button");
        assertOthersUntouched(pkg, before, after);
        evidence.put("after", fixtureEvidence(value)).put("allFixturesAfter", fixturesEvidence(after)).put("success", true);
    }

    private void longPress(String pkg) throws Exception {
        Map<String, Bundle> before = observeAll(); Bundle old = before.get(pkg);
        Gesture gesture = begin(pkg, old, "button", "long_press");
        SystemClock.sleep(ViewConfiguration.getLongPressTimeout() + 150L);
        up(gesture);
        Map<String, Bundle> after = completedObservations(pkg, old, gesture.lastEventAt); Bundle value = after.get(pkg);
        assertOneCompleteGesture(old, value);
        require(value.getInt("long_click_count") == old.getInt("long_click_count") + 1,
                "Actual fixture long-click callback was not invoked once");
        require(value.getInt("click_count") == old.getInt("click_count"), "Long press emitted a normal button click");
        assertOthersUntouched(pkg, before, after);
        gesture.evidence.put("after", fixtureEvidence(value)).put("allFixturesAfter", fixturesEvidence(after)).put("success", true);
    }

    private void multiTouch(String pkg) throws Exception {
        Map<String, Bundle> before = observeAll(); Bundle old = before.get(pkg);
        Gesture gesture = begin(pkg, old, "scroll", "two_pointer");
        MotionEvent.PointerProperties[] properties = {property(0), property(1)};
        float otherX = gesture.localX(old.getFloat("scroll_x") + Math.min(36f, old.getInt("scroll_width") / 5f));
        for (int action : new int[]{MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                MotionEvent.ACTION_MOVE, MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT)}) {
            SystemClock.sleep(20L);
            main(() -> {
                MotionEvent event = MotionEvent.obtain(gesture.downAt, SystemClock.uptimeMillis(), action, 2,
                        properties, new MotionEvent.PointerCoords[]{coordinate(gesture.x, gesture.y), coordinate(otherX, gesture.y)},
                        0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
                try { gesture.identity.surface.dispatchTouchEvent(event); } finally { event.recycle(); }
                return null;
            });
        }
        up(gesture);
        Map<String, Bundle> after = completedObservations(pkg, old, gesture.lastEventAt); Bundle value = after.get(pkg);
        assertOneCompleteGesture(old, value);
        require(value.getInt("max_pointer_count") >= 2
                && value.getInt("pointer_down_count") == old.getInt("pointer_down_count") + 1
                && value.getInt("pointer_up_count") == old.getInt("pointer_up_count") + 1,
                "Two-pointer event sequence was not received intact by the real sample");
        require(value.getInt("click_count") == old.getInt("click_count"), "Two-pointer input clicked the sample button");
        assertOthersUntouched(pkg, before, after);
        gesture.evidence.put("after", fixtureEvidence(value)).put("allFixturesAfter", fixturesEvidence(after)).put("success", true);
    }

    private static void assertOneCompleteGesture(Bundle before, Bundle after) {
        require(after.getInt("touch_down_count") == before.getInt("touch_down_count") + 1
                && after.getInt("touch_up_count") == before.getInt("touch_up_count") + 1
                && after.getInt("touch_cancel_count") == before.getInt("touch_cancel_count"),
                "Expected exactly one complete DOWN/UP without cancellation; actual="
                        + after.getInt("touch_down_count") + "/" + after.getInt("touch_up_count")
                        + "/" + after.getInt("touch_cancel_count"));
    }

    private static void assertTap(Bundle before, Bundle after, Gesture gesture, boolean button) throws Exception {
        assertOneCompleteGesture(before, after);
        require(after.getInt("click_count") == before.getInt("click_count") + (button ? 1 : 0),
                "First and only tap did not hit the intended " + (button ? "button" : "editor"));
        require(after.getInt("long_click_count") == before.getInt("long_click_count")
                && after.getInt("pointer_down_count") == before.getInt("pointer_down_count")
                && after.getInt("pointer_up_count") == before.getInt("pointer_up_count"), "Tap produced unrelated callbacks");
        require(Math.abs(after.getFloat("last_touch_x") - gesture.remoteX) < 1.1f
                && Math.abs(after.getFloat("last_touch_y") - gesture.remoteY) < 1.1f,
                "UI-to-display mapping changed during the first gesture");
        gesture.evidence.put("firstAttemptClickConfirmed", button)
                .put("receivedExactlyOneDownAndUp", true).put("receivedNoCancel", true);
    }

    private void confirmTapFrames(Gesture gesture) throws Exception {
        long before = gesture.geometry.getLong("frames");
        await(() -> main(() -> gesture.identity.surface.frameCount() > before),
                "The input target produces a new frame after its actual click");
        gesture.evidence.put("frameAdvancedAfterTap", true)
                .put("framesAfterTap", main(() -> gesture.identity.surface.frameCount()));
    }

    /** Observe actual app callbacks after the one permitted first tap; never gate that tap on this probe. */
    private void assertPromotionWindowFocus(String promoted, Map<String, Bundle> before, Gesture gesture) throws Exception {
        require(!before.get(promoted).getBoolean("window_focused"), "Side fixture was not actually demoted before promotion");
        Bundle focused = awaitFixture(promoted, value -> value.getBoolean("window_focused")
                && value.getInt("window_focus_gain_count") > before.get(promoted).getInt("window_focus_gain_count"));
        JSONArray callbacks = new JSONArray().put(fixtureEvidence(focused));
        int previousMain = 0;
        for (String pkg : PACKAGES) if (!pkg.equals(promoted)) {
            Bundle old = before.get(pkg);
            Bundle side = awaitFixture(pkg, value -> !value.getBoolean("window_focused")
                    && value.getLong("at_uptime", -1) >= gesture.lastEventAt);
            if (old.getBoolean("window_focused")) {
                previousMain++;
                require(side.getInt("window_focus_loss_count") > old.getInt("window_focus_loss_count"),
                        "Old main app never received its real focus loss callback");
            }
            callbacks.put(fixtureEvidence(side));
        }
        require(previousMain == 1, "Pre-promotion main app focus ownership was ambiguous");
        gesture.evidence.put("actualAppWindowFocusCallbacksAfterFirstTap", callbacks)
                .put("focusCallbackProbeBeforeFirstTap", false).put("actualSideFocusLossAndTargetGain", true);
    }

    private static boolean dispatch(Gesture gesture, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(gesture.downAt, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try { return gesture.identity.surface.dispatchTouchEvent(event); } finally { event.recycle(); }
    }

    private void assertOthersUntouched(String targetPackage, Map<String, Bundle> before,
            Map<String, Bundle> after) {
        for (String pkg : PACKAGES) if (!pkg.equals(targetPackage)) {
            Bundle old = before.get(pkg), value = after.get(pkg);
            for (String counter : COUNTERS)
                require(value.getInt(counter) == old.getInt(counter), "Input reached side fixture " + pkg + ": " + counter);
        }
    }

    private JSONObject assertIdentities() throws Exception {
        Bundle status = status();
        for (Identity identity : identities.values()) {
            Bundle state = window(status, identity.window);
            require(state != null && state.getBoolean("success") && !state.getBoolean("recovery_pending")
                    && state.getInt("task_id", -1) == identity.task && state.getInt("display_id", -1) == identity.display
                    && identity.unique.equals(state.getString("display_unique_id", ""))
                    && identity.pkg.equals(packageOf(state.getString("top_component", ""))),
                    "Task/display/unique identity changed: " + identity.pkg);
            main(() -> {
                AtomicWorkbenchSurface surface = (AtomicWorkbenchSurface) slotField(identity.window, "surface");
                require(surface == identity.surface && surface.getSurfaceTexture() == identity.texture
                        && surface.getHolder().getSurface() == identity.output
                        && (Integer) slotField(identity.window, "surfaceLifecycle") == identity.lifecycle
                        && surface.frameCount() >= identity.frames && surface.isShown()
                        && component(identity.pkg).equals(model().component(identity.window)),
                        "Surface, producer, lifecycle, frames or UI binding changed: " + identity.pkg);
                return null;
            });
        }
        return snapshot(status);
    }

    /** Wait for observation of the one gesture already sent; this never resends input. */
    private Map<String, Bundle> completedObservations(String pkg, Bundle before, long at) throws Exception {
        Identity identity = identities.get(pkg);
        Bundle received = awaitFixture(pkg, value -> sameIdentity(identity, value)
                && value.getLong("at_uptime", -1) >= at
                && (value.getInt("touch_up_count") > before.getInt("touch_up_count")
                        || value.getInt("touch_cancel_count") > before.getInt("touch_cancel_count")));
        return observeAfter(received.getLong("at_uptime", at));
    }
    private Map<String, Bundle> observeAll() throws Exception { return observeAfter(SystemClock.uptimeMillis()); }
    private Map<String, Bundle> observeAfter(long at) throws Exception {
        Map<String, Bundle> result = new LinkedHashMap<>();
        for (String pkg : PACKAGES) {
            Identity identity = identities.get(pkg);
            result.put(pkg, awaitFixture(pkg, value -> sameIdentity(identity, value)
                    && geometryReady(value) && value.getLong("at_uptime", -1) >= at));
        }
        return result;
    }
    private static boolean sameIdentity(Identity identity, Bundle value) {
        return identity != null && !value.getBoolean("destroyed")
                && value.getInt("task_id", -1) == identity.task && value.getInt("display_id", -1) == identity.display;
    }
    private static boolean geometryReady(Bundle value) {
        return value.getInt("fixture_protocol") == AtomicWorkbenchFixtureActivity.PROTOCOL
                && !value.getBoolean("destroyed") && value.getBoolean("geometry_ready")
                && value.getInt("button_width") > 0 && value.getInt("button_height") > 0
                && value.getInt("scroll_width") > 0 && value.getInt("scroll_height") > 0;
    }
    private Map<String, Bundle> latestAll() {
        Map<String, Bundle> result = new LinkedHashMap<>();
        synchronized (observationLock) {
            for (String pkg : PACKAGES) {
                Bundle value = observations.get(pkg);
                if (value != null) result.put(pkg, new Bundle(value));
            }
        }
        return result;
    }
    private Bundle awaitFixture(String pkg, Predicate<Bundle> condition) throws Exception {
        AtomicReference<Bundle> ready = new AtomicReference<>();
        await(() -> {
            synchronized (observationLock) {
                Bundle value = observations.get(pkg);
                if (value != null && condition.test(value)) { ready.set(new Bundle(value)); return true; }
            }
            control(pkg, AtomicWorkbenchFixtureActivity.ACTION_QUERY); return false;
        }, "Authenticated fixture observation: " + pkg);
        return ready.get();
    }
    private void control(String pkg, String action) {
        target.sendBroadcast(new Intent(action).setPackage(pkg).putExtra("nonce", nonce), null,
                BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle());
    }
    private void saveQuick(String value) {
        AppConfig.SaveResult result = config.save(Map.of(AtomicWorkbenchConfig.QUICK_OPEN_APPS, value));
        require(result.success, result.message);
    }
    private Bundle status() throws Exception {
        AtomicWorkbenchClient client = main(() -> (AtomicWorkbenchClient) field("client"));
        require(client != null, "Workbench client disconnected"); return client.status();
    }
    private JSONObject snapshot(Bundle status) throws Exception {
        JSONObject result = new JSONObject().put("mainWindow", main(() -> model().mainWindowId()))
                .put("focusedWindow", status.getInt("focused_window_id", -1));
        JSONArray values = new JSONArray();
        ArrayList<Bundle> windows = status.getParcelableArrayList("windows", Bundle.class);
        if (windows != null) for (Bundle state : windows) {
            JSONObject item = new JSONObject();
            for (String key : new String[]{"window_id", "display_id", "display_unique_id", "task_id", "home_task_id",
                    "task_count", "running_packages", "native_home", "success", "recovery_pending", "state", "top_component"})
                item.put(key, state.get(key));
            int id = state.getInt("window_id", -1);
            if (id >= 0 && id < AtomicWorkbenchProtocol.WINDOW_COUNT) main(() -> {
                AtomicWorkbenchSurface surface = (AtomicWorkbenchSurface) slotField(id, "surface");
                Rect rect = new Rect(); boolean visible = surface.getGlobalVisibleRect(rect);
                item.put("componentBinding", model().component(id)).put("surfaceObject", System.identityHashCode(surface))
                        .put("producerSurfaceObject", System.identityHashCode(surface.getHolder().getSurface()))
                        .put("textureObject", System.identityHashCode(surface.getSurfaceTexture()))
                        .put("surfaceLifecycle", slotField(id, "surfaceLifecycle")).put("frames", surface.frameCount())
                        .put("visible", visible).put("visibleBounds", rect.flattenToString())
                        .put("surfaceWidth", surface.getWidth()).put("surfaceHeight", surface.getHeight())
                        .put("diagnostic", surface.diagnosticState());
                return null;
            });
            values.put(item);
        }
        return result.put("windows", values);
    }
    private JSONObject surfaceGeometry(Identity identity) throws Exception {
        AtomicWorkbenchSurface surface = identity.surface;
        return new JSONObject().put("viewWidth", surface.getWidth()).put("viewHeight", surface.getHeight())
                .put("displayWidth", slotField(identity.window, "displayWidth"))
                .put("displayHeight", slotField(identity.window, "displayHeight"))
                .put("frames", surface.frameCount()).put("layoutRequested", surface.isLayoutRequested())
                .put("shieldVisibility", ((View) slotField(identity.window, "shield")).getVisibility())
                .put("placeholderVisibility", ((View) slotField(identity.window, "placeholder")).getVisibility());
    }
    private static JSONObject fixtureEvidence(Bundle value) throws Exception {
        JSONObject result = new JSONObject();
        if (value == null) return result.put("missing", true);
        for (String key : value.keySet()) if (!"nonce".equals(key)) result.put(key, value.get(key));
        return result;
    }
    private static JSONArray fixturesEvidence(Map<String, Bundle> values) throws Exception {
        JSONArray result = new JSONArray();
        for (String pkg : PACKAGES) result.put(fixtureEvidence(values.get(pkg)).put("expectedPackage", pkg));
        return result;
    }
    private void capture(String name) throws Exception {
        Bitmap image = test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES)
                .takeScreenshot(); require(image != null, "Screenshot unavailable");
        File file = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(file)) {
            require(image.compress(Bitmap.CompressFormat.PNG, 100, output), "Screenshot encoding failed");
        } finally { image.recycle(); }
        screens.put(file.getAbsolutePath());
    }
    private ArrayList<Integer> windowIds() {
        ArrayList<Integer> result = new ArrayList<>(); for (Identity value : identities.values()) result.add(value.window); return result;
    }
    private ArrayList<Integer> displayIds() {
        ArrayList<Integer> result = new ArrayList<>(); for (Identity value : identities.values()) result.add(value.display); return result;
    }
    private static Bundle window(Bundle status, int id) {
        ArrayList<Bundle> values = status.getParcelableArrayList("windows", Bundle.class);
        if (values != null) for (Bundle value : values) if (value.getInt("window_id", -1) == id) return value;
        return null;
    }
    private static String component(String pkg) { return pkg + "/" + pkg + ".AtomicWorkbenchFixtureActivity"; }
    private static String packageOf(String component) { int slash = component.indexOf('/'); return slash < 0 ? "" : component.substring(0, slash); }
    private AtomicWorkbenchWorkspaceModel model() throws Exception { return (AtomicWorkbenchWorkspaceModel) field("model"); }
    private Object slotField(int id, String name) throws Exception { return get(((Object[]) field("slots"))[id], name); }
    private Object field(String name) throws Exception { return get(activity, name); }
    private static Object get(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner);
    }
    private Object invoke(String name, Class<?>[] parameters, Object... arguments) throws Exception {
        Method method = activity.getClass().getDeclaredMethod(name, parameters); method.setAccessible(true);
        return method.invoke(activity, arguments);
    }
    private void await(Check check, String detail) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 15_000L;
        do { if (check.run()) return; SystemClock.sleep(100L); } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError(detail + " (timeout 15000 ms; stage=" + stage + ")");
    }
    private <T> T main(Work<T> work) throws Exception {
        AtomicReference<T> result = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(work.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() instanceof Exception) throw (Exception) error.get();
        if (error.get() instanceof AssertionError) throw (AssertionError) error.get();
        if (error.get() != null) throw new RuntimeException(error.get());
        return result.get();
    }
    private static MotionEvent.PointerProperties property(int id) {
        MotionEvent.PointerProperties value = new MotionEvent.PointerProperties(); value.id = id;
        value.toolType = MotionEvent.TOOL_TYPE_FINGER; return value;
    }
    private static MotionEvent.PointerCoords coordinate(float x, float y) {
        MotionEvent.PointerCoords value = new MotionEvent.PointerCoords(); value.x = x; value.y = y;
        value.pressure = 1f; value.size = 1f; return value;
    }
    private static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
    private interface Check { boolean run() throws Exception; }
    private interface Work<T> { T run() throws Exception; }

    private final class Gesture {
        final Identity identity;
        final JSONObject evidence, geometry;
        final float remoteX, remoteY, viewWidth, viewHeight;
        final int displayWidth, displayHeight;
        float x, y;
        long readyAt, downAt, lastEventAt;
        boolean downHandled;
        Gesture(Identity identity, float remoteX, float remoteY, JSONObject evidence) throws Exception {
            this.identity = identity; this.remoteX = remoteX; this.remoteY = remoteY; this.evidence = evidence;
            viewWidth = identity.surface.getWidth(); viewHeight = identity.surface.getHeight();
            displayWidth = (Integer) slotField(identity.window, "displayWidth");
            displayHeight = (Integer) slotField(identity.window, "displayHeight");
            geometry = surfaceGeometry(identity);
            evidence.put("geometryAtDown", geometry);
            require(viewWidth > 0 && viewHeight > 0 && displayWidth > 1 && displayHeight > 1,
                    "mainReady exposed invalid UI/display input geometry");
            View frame = (View) slotField(identity.window, "frame");
            android.widget.FrameLayout.LayoutParams requested = (android.widget.FrameLayout.LayoutParams) frame.getLayoutParams();
            float scale = Math.min(frame.getWidth() / (float) displayWidth, frame.getHeight() / (float) displayHeight);
            int fittedWidth = Math.max(1, Math.round(displayWidth * scale));
            int fittedHeight = Math.max(1, Math.round(displayHeight * scale));
            geometry.put("frameWidth", frame.getWidth()).put("frameHeight", frame.getHeight())
                    .put("requestedFrameWidth", requested.width).put("requestedFrameHeight", requested.height)
                    .put("frameLeft", frame.getLeft()).put("frameTop", frame.getTop())
                    .put("requestedFrameLeft", requested.leftMargin).put("requestedFrameTop", requested.topMargin)
                    .put("expectedFittedWidth", fittedWidth).put("expectedFittedHeight", fittedHeight);
            require(requested.width > 0 && requested.height > 0
                    && frame.getWidth() == requested.width && frame.getHeight() == requested.height
                    && frame.getLeft() == requested.leftMargin && frame.getTop() == requested.topMargin
                    && identity.surface.getWidth() == fittedWidth && identity.surface.getHeight() == fittedHeight,
                    "mainReady exposed incomplete main-role frame or surface geometry");
            x = localX(remoteX); y = localY(remoteY);
            require(Float.isFinite(x) && Float.isFinite(y) && x >= 0 && y >= 0 && x < viewWidth && y < viewHeight,
                    "Authenticated fixture target falls outside the actual TextureView");
        }
        float localX(float value) { return value * viewWidth / (displayWidth - 1f); }
        float localY(float value) { return value * viewHeight / (displayHeight - 1f); }
    }
    private static final class Identity {
        final String pkg, unique;
        final int window, task, display, lifecycle;
        final AtomicWorkbenchSurface surface;
        final Object texture;
        final Surface output;
        final long frames;
        Identity(String pkg, Bundle state, AtomicWorkbenchSurface surface, int lifecycle) {
            this.pkg = pkg; this.surface = surface; this.lifecycle = lifecycle;
            window = state.getInt("window_id", -1); task = state.getInt("task_id", -1);
            display = state.getInt("display_id", -1); unique = state.getString("display_unique_id", "");
            texture = surface.getSurfaceTexture(); output = surface.getHolder().getSurface(); frames = surface.frameCount();
            require(window >= 0 && task > 0 && display > 0 && !unique.isEmpty()
                    && texture != null && output != null && output.isValid() && frames > 0,
                    "Real fixture identity is incomplete: " + pkg);
        }
    }
}
