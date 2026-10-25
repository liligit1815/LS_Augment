package ls.augment.com;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
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

/** Real app-tile callbacks, task exit and HOME leases. No production state is injected. */
final class AtomicWorkbenchBindingDeviceCases {
    private static final String ONE = "ls.augment.workbench.fixture.one";
    private static final String TWO = "ls.augment.workbench.fixture.two";
    private static final String THREE = "ls.augment.workbench.fixture.three";
    private final Instrumentation test;
    private final Context target;
    private final AppConfig config;
    private final File directory;
    private final String nonce = UUID.randomUUID().toString().replace("-", "");
    private final Object observationLock = new Object();
    private final Map<String, Integer> uids = new HashMap<>();
    private final Map<String, Bundle> observations = new HashMap<>();
    private final Map<String, Integer> liveTasks = new LinkedHashMap<>();
    private final Map<String, Long> attemptedLaunches = new LinkedHashMap<>();
    private final Map<String, Bundle> explicitlyFinishedTasks = new LinkedHashMap<>();
    private final JSONArray screens = new JSONArray();
    private final JSONArray launchPlans = new JSONArray();
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

    private AtomicWorkbenchBindingDeviceCases(Instrumentation test) {
        this.test = test;
        target = test.getTargetContext();
        config = new AppConfig(target);
        directory = new File(target.getExternalFilesDir(null), "atomic-workbench-binding");
    }

    static JSONObject run(Instrumentation test) throws Exception {
        return new AtomicWorkbenchBindingDeviceCases(test).execute();
    }

    private JSONObject execute() throws Exception {
        JSONObject report = new JSONObject().put("scope", "REAL_WORKBENCH_APP_TILE_TASK_EXIT_HOME_REOPEN")
                .put("inputMethod", "APP_TILE_LISTENER_CALLBACK")
                .put("backGesture", "NOT_EXERCISED_FIXTURE_FINISHES_OWN_TASK")
                .put("raceInjection", "NOT_EXERCISED").put("screens", screens);
        report.put("launchPlans", launchPlans);
        String beforeQuick = config.get(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        boolean registered = false, passed = false, restored = false, quickRestored = false;
        try {
            require(config.getBoolean(AtomicWorkbenchConfig.ENABLED), "Enable workbench before acceptance");
            require(!AtomicWorkbenchCleanup.pending(), "Prior workbench cleanup must finish first");
            require(directory.isDirectory() || directory.mkdirs(), "Cannot create evidence directory");
            for (String pkg : new String[]{ONE, TWO, THREE})
                uids.put(pkg, target.getPackageManager().getApplicationInfo(pkg, 0).uid);
            require(new java.util.HashSet<>(uids.values()).size() == 3, "Fixtures must have distinct UIDs");
            target.registerReceiver(receiver, new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE), Context.RECEIVER_EXPORTED);
            registered = true;
            for (String pkg : uids.keySet()) control(pkg, AtomicWorkbenchFixtureActivity.ACTION_FINISH);
            saveQuick("1");
            activity = test.startActivitySync(new Intent(target, AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(() -> { activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); return null; });
            ownsSession = true;
            await(() -> main(() -> field("client") != null && (Boolean) invoke("mainReady", new Class<?>[0])
                    && !(Boolean) field("busy")), "Initial workbench HOME is ready");
            Bundle initial = status();
            ArrayList<Bundle> initialWindows = initial.getParcelableArrayList("windows", Bundle.class);
            require(initialWindows != null, "Initial task snapshot unavailable");
            for (Bundle window : initialWindows) {
                ArrayList<String> running = window.getStringArrayList("running_packages");
                require(running != null && running.isEmpty(), "Use an empty workbench; existing app tasks must not be changed");
            }

            stage = "open_side_sample";
            Bundle side = launch(TWO);
            int sideId = side.getInt("window_id", -1), sideTask = side.getInt("task_id", -1);
            int sideDisplay = side.getInt("display_id", -1);
            String sideUnique = side.getString("display_unique_id", "");
            Object sideSurface = main(() -> slotField(sideId, "surface"));
            long sideFrames = main(() -> ((AtomicWorkbenchSurface) sideSurface).frameCount());

            stage = "open_explicit_sample";
            Bundle app = launch(ONE);
            int id = app.getInt("window_id", -1), firstTask = app.getInt("task_id", -1);
            int display = app.getInt("display_id", -1), homeTask = app.getInt("home_task_id", -1);
            String unique = app.getString("display_unique_id", "");
            require(id != sideId && display != sideDisplay && homeTask >= 0, "Two independent displays with HOME behind main");
            require(main(() -> model().component(id) != null), "Explicit launcher must bind the sample before task exit");
            report.put("beforeExit", snapshot(status()));
            capture("01-explicit-app-and-side");

            stage = "finish_last_explicit_task";
            finishSample(ONE, firstTask);
            Bundle onlyHome = awaitHomeOnly(id, ONE);
            require(onlyHome.getInt("display_id", -1) == display && unique.equals(onlyHome.getString("display_unique_id", ""))
                    && onlyHome.getInt("home_task_id", -1) == homeTask,
                    "Retiring the app binding must preserve its exact display and HOME lease");
            assertSide(sideId, sideTask, sideDisplay, sideUnique, sideSurface, sideFrames);
            report.put("afterExit", snapshot(status()));
            capture("02-home-after-task-exit");

            stage = "reopen_same_sample";
            Bundle reopened = launch(ONE);
            int secondTask = reopened.getInt("task_id", -1);
            require(reopened.getInt("window_id", -1) == id && secondTask > 0 && secondTask != firstTask,
                    "Reopening must create a new real app task in the original stable window");
            require(reopened.getInt("display_id", -1) == display && unique.equals(reopened.getString("display_unique_id", ""))
                    && reopened.getInt("home_task_id", -1) == homeTask,
                    "Reopening must preserve the existing display and HOME instead of closing the session");
            assertSide(sideId, sideTask, sideDisplay, sideUnique, sideSurface, sideFrames);
            report.put("afterReopen", snapshot(status()));
            capture("03-same-app-reopened");

            stage = "replace_exited_sample_with_new_app";
            finishSample(ONE, secondTask);
            awaitHomeOnly(id, ONE);
            Bundle replacement = launch(THREE);
            require(replacement.getInt("window_id", -1) == id && replacement.getInt("display_id", -1) == display
                    && unique.equals(replacement.getString("display_unique_id", ""))
                    && replacement.getInt("home_task_id", -1) == homeTask,
                    "A different app must use the retired app's HOME-only display without changing its identity");
            require(main(() -> model().find(component(ONE)) == -1), "New app must not resurrect the old app ownership");
            assertSide(sideId, sideTask, sideDisplay, sideUnique, sideSurface, sideFrames);
            report.put("afterNewApp", snapshot(status()));
            capture("04-different-app-in-retired-slot");
            passed = true;
        } catch (Exception | AssertionError failure) {
            report.put("failure", failure.getClass().getSimpleName() + ": " + failure.getMessage()).put("stage", stage);
            if (activity != null) {
                try { report.put("failureState", snapshot(status())); } catch (Exception ignored) { }
                try { capture("99-failure"); } catch (Exception ignored) { }
            }
        } finally {
            if (ownsSession && activity != null) try {
                // Drain launch work before freezing identities, including an app
                // which was created but never reached the mainReady predicate.
                Map<String, Integer> recoveryTasks = new LinkedHashMap<>(liveTasks);
                JSONArray identityFailures = new JSONArray(), alreadyFinished = new JSONArray();
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
                        if (!attemptedLaunches.containsKey(pkg) || explicitlyFinishedTasks.containsKey(pkg) || task <= 0) continue;
                        Integer known = recoveryTasks.putIfAbsent(pkg, task);
                        if (known != null && known != task) identityFailures.put("Conflicting current task: " + pkg);
                    }
                } catch (Exception | AssertionError unavailable) {
                    report.put("recoveryStatusFailure", unavailable.getClass().getSimpleName());
                }
                for (Map.Entry<String, Long> attempt : attemptedLaunches.entrySet()) {
                    String pkg = attempt.getKey(); long started = attempt.getValue();
                    Bundle finished = explicitlyFinishedTasks.get(pkg);
                    if (finished != null && finished.getBoolean("destroyed")
                            && finished.getInt("task_id", -1) > 0 && finished.getLong("at_uptime", -1) >= started) {
                        alreadyFinished.put(fixtureIdentity(finished)); continue;
                    }
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
                // Missing identity must not skip closing the actual owned scope,
                // or become success merely because an old destroyed reply exists.
                Map<String, Integer> frozenTasks = java.util.Collections.unmodifiableMap(new LinkedHashMap<>(recoveryTasks));
                JSONArray frozen = new JSONArray();
                for (Map.Entry<String, Integer> entry : frozenTasks.entrySet())
                    frozen.put(new JSONObject().put("fixture_package", entry.getKey()).put("task_id", entry.getValue()));
                report.put("recoveryTasksBeforeClose", frozen).put("alreadyExplicitlyFinishedTasks", alreadyFinished)
                        .put("recoveryIdentityFailures", identityFailures);
                long closeStarted = SystemClock.uptimeMillis();
                main(() -> { invoke("requestCloseAll", new Class<?>[]{boolean.class}, true); return null; });
                ((ExecutorService) get(activity, "WORKER")).submit(() -> { }).get(20L, TimeUnit.SECONDS);
                await(() -> !AtomicWorkbenchCleanup.pending(), "Phone cleanup confirms every task returned");
                JSONArray returned = new JSONArray();
                for (Map.Entry<String, Integer> entry : frozenTasks.entrySet()) {
                    int expectedTask = entry.getValue();
                    Bundle value = awaitFixture(entry.getKey(), observed -> !observed.getBoolean("destroyed")
                            && observed.getInt("task_id", -1) == expectedTask && observed.getInt("display_id", -1) == 0
                            && observed.getLong("at_uptime", -1) >= closeStarted);
                    returned.put(fixtureIdentity(value));
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
                            && value.getInt("task_id", -1) == expectedTask && value.getLong("at_uptime", -1) >= finishStarted);
                }
                report.put("fixturesFinishedAfterRestore", true);
            } catch (Exception | AssertionError failure) {
                restored = false; report.put("fixtureFinishFailure", failure.getClass().getSimpleName() + ": " + failure.getMessage());
            }
            if (registered) try { target.unregisterReceiver(receiver); }
            catch (Exception | AssertionError failure) {
                restored = false; report.put("receiverRecoveryFailure", failure.getClass().getSimpleName());
            }
            try { saveQuick(beforeQuick); quickRestored = true; }
            catch (Exception | AssertionError failure) { report.put("quickConfigRecoveryFailure", failure.getClass().getSimpleName() + ": " + failure.getMessage()); }
        }
        return report.put("recoveryConfirmed", restored).put("quickConfigurationRestored", quickRestored)
                .put("success", passed && restored && quickRestored);
    }

    private Bundle launch(String pkg) throws Exception {
        String component = component(pkg);
        await(() -> main(() -> (Boolean) invoke("canInteract", new Class<?>[0])
                && activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:" + component) != null),
                "Application tile is ready: " + pkg);
        main(() -> {
            AtomicWorkbenchWorkspaceModel.LaunchPlan plan = model().planLaunch(component);
            launchPlans.put(new JSONObject().put("package", pkg).put("stage", stage)
                    .put("window_id", plan.windowId).put("existing", plan.existing)
                    .put("replaces_empty_home", plan.replacesEmptyHome));
            View tile = activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:" + component);
            if (tile.isEnabled()) {
                attemptedLaunches.put(pkg, SystemClock.uptimeMillis());
                explicitlyFinishedTasks.remove(pkg);
            }
            require(tile.isEnabled() && tile.performClick(), "Real application tile rejected click: " + pkg);
            return null;
        });
        AtomicReference<Bundle> ready = new AtomicReference<>();
        await(() -> {
            int id = main(() -> model().mainWindowId());
            Bundle window = window(status(), id);
            ArrayList<String> running = window == null ? null : window.getStringArrayList("running_packages");
            if (window == null || !window.getBoolean("success") || !"active".equals(window.getString("state"))
                    || window.getBoolean("recovery_pending") || window.getInt("display_id", -1) <= 0
                    || window.getInt("task_id", -1) <= 0 || running == null || !running.contains(pkg)
                    || !pkg.equals(packageOf(window.getString("top_component", "")))
                    || !main(() -> (Boolean) invoke("mainReady", new Class<?>[0]))) return false;
            ready.set(window); return true;
        }, "App becomes actual main foreground: " + pkg);
        Bundle window = ready.get();
        int taskId = window.getInt("task_id", -1), displayId = window.getInt("display_id", -1);
        awaitFixture(pkg, value -> !value.getBoolean("destroyed") && value.getInt("task_id", -1) == taskId
                && value.getInt("display_id", -1) == displayId);
        liveTasks.put(pkg, taskId);
        int id = window.getInt("window_id", -1);
        await(() -> main(() -> ((AtomicWorkbenchSurface) slotField(id, "surface")).frameCount() > 0L),
                "Main Surface has consumed a real display frame: " + pkg);
        return window;
    }

    private void finishSample(String pkg, int taskId) throws Exception {
        require(Integer.valueOf(taskId).equals(liveTasks.get(pkg)), "Only the current launched fixture task may be finished");
        long finishStarted = SystemClock.uptimeMillis();
        control(pkg, AtomicWorkbenchFixtureActivity.ACTION_FINISH);
        Bundle finished = awaitFixture(pkg, value -> value.getBoolean("destroyed") && value.getInt("task_id", -1) == taskId
                && value.getLong("at_uptime", -1) >= finishStarted);
        explicitlyFinishedTasks.put(pkg, new Bundle(finished));
        liveTasks.remove(pkg);
    }

    private static JSONObject fixtureIdentity(Bundle value) throws Exception {
        return new JSONObject().put("fixture_package", value.getString("fixture_package", ""))
                .put("task_id", value.getInt("task_id", -1)).put("display_id", value.getInt("display_id", -1))
                .put("at_uptime", value.getLong("at_uptime", -1)).put("destroyed", value.getBoolean("destroyed"));
    }

    private Bundle awaitHomeOnly(int id, String exited) throws Exception {
        AtomicReference<Bundle> ready = new AtomicReference<>();
        await(() -> {
            Bundle state = window(status(), id);
            ArrayList<String> running = state == null ? null : state.getStringArrayList("running_packages");
            if (state == null || !state.getBoolean("success") || !"active".equals(state.getString("state"))
                    || state.getBoolean("recovery_pending") || !state.getBoolean("native_home")
                    || state.getInt("task_count", -1) != 1 || running == null || !running.isEmpty()) return false;
            if (!main(() -> model().hasWindow(id) && model().component(id) == null
                    && model().find(component(exited)) == -1 && model().mainWindowId() == id
                    && ((ArrayList<?>) slotField(id, "runningPackages")).isEmpty())) return false;
            ready.set(state); return true;
        }, "Root and UI both retire the exited app while HOME remains");
        return ready.get();
    }

    private void assertSide(int id, int task, int display, String unique, Object surface, long frames) throws Exception {
        Bundle side = window(status(), id);
        require(side != null && side.getInt("task_id", -1) == task && side.getInt("display_id", -1) == display
                && unique.equals(side.getString("display_unique_id", ""))
                && TWO.equals(packageOf(side.getString("top_component", ""))), "Side task or display changed");
        require(main(() -> slotField(id, "surface") == surface && model().hasWindow(id)
                && ((AtomicWorkbenchSurface) surface).frameCount() >= frames), "Side Surface identity or frames were reset");
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
        JSONObject result = new JSONObject().put("mainWindow", main(() -> model().mainWindowId()));
        JSONArray values = new JSONArray();
        ArrayList<Bundle> windows = status.getParcelableArrayList("windows", Bundle.class);
        if (windows != null) for (Bundle window : windows) {
            int id = window.getInt("window_id", -1);
            JSONObject value = new JSONObject();
            for (String key : new String[]{"window_id", "display_id", "display_unique_id", "task_id", "home_task_id",
                    "task_count", "running_packages", "native_home", "home_only", "success", "recovery_pending", "state", "top_component"})
                value.put(key, window.get(key));
            if (id >= 0 && id < AtomicWorkbenchProtocol.WINDOW_COUNT) {
                value.put("componentBinding", main(() -> model().component(id)));
                value.put("emptyHomeModel", main(() -> ((boolean[]) get(model(), "emptyHome"))[id]));
                value.put("hostedModel", main(() -> ((boolean[]) get(model(), "hosted"))[id]));
            }
            values.put(value);
        }
        return result.put("windows", values);
    }
    private void capture(String name) throws Exception {
        Bitmap image = test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES)
                .takeScreenshot(); require(image != null, "Screenshot unavailable");
        File path = new File(directory, name + ".png");
        try (FileOutputStream output = new FileOutputStream(path)) {
            require(image.compress(Bitmap.CompressFormat.PNG, 100, output), "Screenshot encoding failed");
        } finally { image.recycle(); }
        screens.put(path.getAbsolutePath());
    }
    private static Bundle window(Bundle status, int id) {
        ArrayList<Bundle> windows = status.getParcelableArrayList("windows", Bundle.class);
        if (windows != null) for (Bundle value : windows) if (value.getInt("window_id", -1) == id) return value;
        return null;
    }
    private static String component(String pkg) { return pkg + "/" + pkg + ".AtomicWorkbenchFixtureActivity"; }
    private static String packageOf(String component) {
        int slash = component.indexOf('/'); return slash < 0 ? "" : component.substring(0, slash);
    }
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
    private void await(Check check, String message) throws Exception {
        long deadline = SystemClock.uptimeMillis() + 15_000L;
        do { if (check.run()) return; SystemClock.sleep(150L); } while (SystemClock.uptimeMillis() < deadline);
        throw new AssertionError(message + " (timeout 15000 ms; stage=" + stage + ")");
    }
    private <T> T main(Work<T> work) throws Exception {
        AtomicReference<T> value = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { value.set(work.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() instanceof Exception) throw (Exception) error.get();
        if (error.get() instanceof AssertionError) throw (AssertionError) error.get();
        if (error.get() != null) throw new RuntimeException(error.get());
        return value.get();
    }
    private static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
    private interface Check { boolean run() throws Exception; }
    private interface Work<T> { T run() throws Exception; }
}
