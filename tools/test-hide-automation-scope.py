"""Run real hide-scope UI and execution methods with offline Java transport doubles.

No Android device, su, adb, or production configuration is accessed.  The doubles
provide widget events, deterministic scheduling, in-memory persistence, and Root
responses; the scope selection and failure decisions come from production code.
Use --activity-source to demonstrate that a saved pre-fix Activity fails the same
regressions.  This is not a replacement for Android widget/ROM integration tests.
"""
from pathlib import Path
import argparse
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "android/app/src/main/java/ls/augment/com"


def member(source, signature):
    """Extract one actual Java member, counting braces outside strings/comments."""
    if source.count(signature) != 1:
        raise ValueError(f"Expected one production member: {signature}")
    start = source.index(signature)
    opening = source.index("{", start)
    depth, state, index = 0, "code", opening
    while index < len(source):
        char = source[index]
        following = source[index:index + 2]
        if state == "line":
            if char == "\n":
                state = "code"
        elif state == "block":
            if following == "*/":
                state = "code"
                index += 1
        elif state in ('"', "'"):
            if char == "\\":
                index += 1
            elif char == state:
                state = "code"
        elif following == "//":
            state = "line"
            index += 1
        elif following == "/*":
            state = "block"
            index += 1
        elif char in ('"', "'"):
            state = char
        elif char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return source[start:index + 1]
        index += 1
    raise ValueError(f"Unclosed production member: {signature}")


def between(source, beginning, ending):
    if source.count(beginning) != 1 or source.count(ending) != 1:
        raise ValueError("Production block boundaries changed; update extraction explicitly")
    start = source.index(beginning)
    return source[start:source.index(ending, start)]


UI_DOUBLES = r'''
package ls.augment.com;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Pattern;

class View {
    static final int VISIBLE = 0, GONE = 8;
    interface OnClickListener { void onClick(View view); }
    OnClickListener click;
    void setOnClickListener(OnClickListener listener) { click = listener; }
    void performClick() { if (click != null) click.onClick(this); }
    void setVisibility(int value) { }
}
class Switch extends View {
    interface OnCheckedChangeListener { void onCheckedChanged(Switch button, boolean checked); }
    boolean checked;
    OnCheckedChangeListener listener;
    Switch(Object context) { }
    void setChecked(boolean value) {
        if (checked == value) return;
        checked = value;
        if (listener != null) listener.onCheckedChanged(this, value);
    }
    boolean isChecked() { return checked; }
    void setOnCheckedChangeListener(OnCheckedChangeListener value) { listener = value; }
    // CompoundButton performs toggle (and checked-change callback) before click.
    @Override void performClick() { setChecked(!checked); super.performClick(); }
}
class TextView extends View {
    String text = "";
    void setText(String value) { text = value; }
    void setTextColor(int value) { }
}
class Button extends TextView { boolean enabled; }
class Editable implements CharSequence {
    final String value;
    Editable(String value) { this.value = value; }
    public int length() { return value.length(); }
    public char charAt(int index) { return value.charAt(index); }
    public CharSequence subSequence(int start, int end) { return value.subSequence(start, end); }
    public String toString() { return value; }
}
interface TextWatcher {
    void beforeTextChanged(CharSequence text, int start, int count, int after);
    void onTextChanged(CharSequence text, int start, int before, int count);
    void afterTextChanged(Editable text);
}
interface InputFilter {
    CharSequence filter(CharSequence source, int start, int end,
                        CharSequence dest, int dstart, int dend);
}
class EditText extends TextView {
    final List<TextWatcher> watchers = new ArrayList<>();
    EditText(Object context) { }
    void setHint(String value) { }
    void setFilters(InputFilter[] value) { }
    void setSingleLine(boolean value) { }
    void addTextChangedListener(TextWatcher watcher) { watchers.add(watcher); }
    Editable getText() { return new Editable(text); }
    @Override void setText(String value) {
        String old = text;
        for (TextWatcher watcher : watchers) watcher.beforeTextChanged(old, 0, old.length(), value.length());
        super.setText(value);
        for (TextWatcher watcher : watchers) watcher.onTextChanged(value, 0, old.length(), value.length());
        for (TextWatcher watcher : watchers) watcher.afterTextChanged(getText());
    }
}
class LinearLayout extends View {
    static final int VERTICAL = 1;
    LinearLayout() { } LinearLayout(Object context) { }
    void setOrientation(int value) { } void addView(View child, Object layout) { }
}
class UiKit {
    int danger = 1, muted = 2;
    static final class Fold { void sync() { } }
    LinearLayout card() { return new LinearLayout(); }
    LinearLayout featureRow(String title, String description, Switch control) { return new LinearLayout(); }
    Object margins(int a, int b, int c, int d) { return null; }
    Object wrap() { return null; }
    void glassDialog(String title, String message, String action, Runnable click, String cancel) { }
    void styleInput(EditText input) { }
    void setButtonEnabled(Button button, boolean enabled) { button.enabled = enabled; }
}
class Toast {
    static final int LENGTH_LONG = 1;
    static Toast makeText(Object context, String message, int duration) { return new Toast(); }
    void show() { }
}
class Worker {
    final ArrayDeque<Runnable> queue = new ArrayDeque<>();
    void execute(Runnable task) { queue.add(task); }
    boolean runAll() {
        boolean ran = !queue.isEmpty();
        int steps = 0;
        while (!queue.isEmpty()) {
            if (++steps > 1000) throw new AssertionError("Worker failed to settle");
            queue.remove().run();
        }
        return ran;
    }
}
class Handler {
    static final class Task {
        final Runnable action;
        final long at, order;
        Task(Runnable action, long at, long order) { this.action = action; this.at = at; this.order = order; }
    }
    final List<Task> queue = new ArrayList<>();
    long now, nextOrder;
    void post(Runnable task) { postDelayed(task, 0); }
    void postDelayed(Runnable task, long delay) { queue.add(new Task(task, now + delay, nextOrder++)); }
    void removeCallbacks(Runnable task) { queue.removeIf(entry -> entry.action == task); }
    boolean runDue() {
        boolean ran = false;
        for (int step = 0; step < 1000; step++) {
            Task next = queue.stream().filter(task -> task.at <= now)
                    .min(Comparator.comparingLong((Task task) -> task.at).thenComparingLong(task -> task.order))
                    .orElse(null);
            if (next == null) return ran;
            queue.remove(next);
            next.action.run();
            ran = true;
        }
        throw new AssertionError("UI queue failed to settle");
    }
}
class AppConfig {
    static final String HIDE_TARGETS = "targets";
    static final String HIDE_MASTER = "master", AUTOMATION_ENABLED = "automatic",
            AUTOMATION_SCOPE = "scope", TILE_LABEL = "label", TILE_DESCRIPTION = "description",
            TILE_ENABLED = "tile", DIAGNOSTICS = "diagnostics";
    final Map<String, String> values = new LinkedHashMap<>();
    int saves;
    AppConfig(String scope) {
        values.put(HIDE_MASTER, "1"); values.put(AUTOMATION_ENABLED, "1");
        values.put(AUTOMATION_SCOPE, scope); values.put(TILE_ENABLED, "1"); values.put(TILE_LABEL, "original label");
        values.put(TILE_DESCRIPTION, "original description");
    }
    String get(String key) { return values.get(key); }
    boolean getBoolean(String key) { return "1".equals(get(key)); }
    SaveResult save(Map<String, String> update) { values.putAll(update); saves++; return new SaveResult(); }
    static final class SaveResult { boolean success = true; String message = "saved"; }
}
class ScreenAutomation { static void sync(Object context) { } }
class ModuleNavigation { static void open(Object owner, String route) { } }
class AuditLog { static void write(Object context, String action, String message) { } }
// Reset fencing belongs to its own regression suite; this scope fixture has no reset.
class ResetWriteFence { static boolean stale(long generation) { return false; } }
// Minimal Android type used by the unchanged runScreenOffAutomation method.
class android {
    static class os { static class PowerManager { boolean interactive; boolean isInteractive() { return interactive; } } }
}
class FakeContext {
    final android.os.PowerManager power = new android.os.PowerManager();
    final Preferences prefs = new Preferences();
    <T> T getSystemService(Class<T> type) { return type.cast(power); }
    Preferences getSharedPreferences(String name, int mode) { return prefs; }
    static final class Preferences {
        String value = "GRANTED";
        String getString(String name, String fallback) { return value; }
    }
}
class RootShell {
    static final class Result {
        final boolean success, timedOut;
        final String output;
        Result(boolean success, boolean timedOut, String output) {
            this.success = success; this.timedOut = timedOut; this.output = output;
        }
        boolean isSuccess() { return success && !timedOut; }
    }
    static Result primary, fallback;
    static int queries;
    static void responses(Result first, Result second) { primary = first; fallback = second; queries = 0; }
    static Result run(String command, Object input, int timeout, int bound) {
        queries++;
        if ("cmd activity get-current-user 2>/dev/null".equals(command)) return primary;
        if ("am get-current-user 2>/dev/null".equals(command)) return fallback;
        throw new AssertionError("Unexpected shell request in offline test: " + command);
    }
}
class HideBatchExecutor {
    static final class Outcome<T> {
        final Set<T> success = new LinkedHashSet<>();
        final Map<T, String> failures = new LinkedHashMap<>();
    }
}
// This suite isolates scope selection; live user identity availability is a boundary fixture.
class HideUserIdentity {
    static final class Snapshot { final boolean success=true; final String message=""; }
    static Snapshot match(Object context, int userId, long expectedSerial) { return new Snapshot(); }
}
'''


ACTIVITY_PREFIX = r'''
class HideAppsActivity {
    final Worker executor = new Worker();
    final Handler main = new Handler();
    final Set<RootHideManager.Target> selected = new LinkedHashSet<>(), savedTargets = new LinkedHashSet<>();
    final List<Object> loaded = new ArrayList<>();
    final UiKit ui = new UiKit();
    final AppConfig config;
    final RootHideManager manager;
    final TextView userStatus = new TextView(), summary = new TextView();
    final LinearLayout automationPanel = new LinearLayout();
    final Button save = new Button();
    EditText tileLabel, tileDescription, search = new EditText(this);
    Switch master, automationEnabled, tileEnabled, automationAllUsers;
    List<RootHideManager.UserRecord> userRecords = new ArrayList<>();
    UserResolution currentUser = UserResolution.failure("尚未检测当前用户");
    int activeUserId = -1;
    long activeUserSerial = -1, appLoadGeneration;
    boolean loading = true, dirty, saving, saveFailed, allSpaces = true, operating;
    boolean rootReady = true, rootGranted = true, updatingControls, automationReady = true, automationNeedsScope;
    String rootProblem = "unavailable", automationProblem = "unavailable";
    int listFilter;
    boolean selectionReady = true, selectionLoading;
    long selectionRevision;
    Intent recoveryAfterSave;
    Runnable leaveAction;
    long editGeneration;
    UiKit.Fold automationFold, tileFold;
'''


ACTIVITY_HELPERS = r'''
    boolean isFinishing() { return false; }
    boolean isDestroyed() { return false; }
    void startActivity(Intent intent) { }
    void renderApps() { }
    void refreshAppStates() { }
    void renderSpaceSelector() { }
    void updateActionButtons() { }
    void updateSaveStatus() { }
    void inspectEnvironment(boolean requestAuthorization) { }
    void showSaveFailure(Runnable leave) { }
    void loadApps(int userId) { loading = false; }
    void settle(long advanceMillis) {
        main.now += advanceMillis;
        for (int i = 0; i < 100; i++) {
            boolean worker = executor.runAll();
            boolean uiRan = main.runDue();
            if (!worker && !uiRan) return;
        }
        throw new AssertionError("Activity queues failed to settle");
    }
    void load() { loadUsers(); settle(0); }
    void editTargets(RootHideManager.Target target) { selected.add(target); markDirty(); }
    Set<RootHideManager.Target> scope() { return scopedTargets(); }
    boolean ready(boolean hide) { return canOperate(hide); }
}
class Intent { }
'''


MANAGER_PREFIX = r'''
class RootHideManager {
    static final ReentrantLock ACTION_LOCK = new ReentrantLock();
    static final String RESET_REQUIRED = "reset";
    final long actionGeneration = 0;
    final AppConfig config;
    final FakeContext context = new FakeContext();
    final Set<Target> stored = new LinkedHashSet<>();
    final Set<Target> systemTargets = new LinkedHashSet<>();
    final Map<Target, State> states = new LinkedHashMap<>();
    UserDirectory directory = UserDirectory.success(Arrays.asList(new UserRecord(0, 0, "Owner"), new UserRecord(12, 42, "Other")));
    int targetReads, classificationReads, stateReads, batchCalls, mutations, mirrorWrites, targetSaves;
    enum RootState { GRANTED, DENIED }
    enum State { VISIBLE, HIDDEN, MISSING, ERROR }
    enum Aggregate { ALL_VISIBLE, ALL_HIDDEN, MIXED, EMPTY, ERROR }
    static class Summary {final Aggregate aggregate; Summary(Aggregate value){aggregate=value;}}
    Summary summary() {
        if(states.values().stream().anyMatch(s->s==State.ERROR))return new Summary(Aggregate.ERROR);
        if(states.values().stream().allMatch(s->s==State.VISIBLE))return new Summary(Aggregate.ALL_VISIBLE);
        if(states.values().stream().allMatch(s->s==State.HIDDEN))return new Summary(Aggregate.ALL_HIDDEN);
        return new Summary(Aggregate.MIXED);
    }
    boolean isUserInstalledApp(Target t) { return !systemTargets.contains(t); }
    RootHideManager(AppConfig config) { this.config = config; }
    UserDirectory userDirectory() { return directory; }
    UserDirectory listUsersResult(boolean allowRequest) { return directory; }
    RootStatus rootStatus() { return new RootStatus(RootState.GRANTED, "granted", "offline"); }
    ConflictState conflictState() { return new ConflictState(false, false, "none"); }
    Set<Target> targets() { targetReads++; return new LinkedHashSet<>(stored); }
    HideTargetCodec.Selection selectionStatus() { return HideTargetCodec.parse(HideTargetCodec.encode(stored)); }
    OperationResult saveTargets(Set<Target> values, Map<String, String> update, long expectedRevision) {
        stored.clear(); stored.addAll(values); targetSaves++; config.save(update);
        return OperationResult.success("saved");
    }
    long targetRevision() { return targetSaves; }
    Set<Target> userInstalledTargets(Set<Target> values) {
        classificationReads++;Set<Target> found=new LinkedHashSet<>(values);found.removeAll(systemTargets);return found;
    }
    Map<Target, State> queryStates(Set<Target> values) {
        stateReads++;
        Map<Target, State> found = new LinkedHashMap<>();
        for (Target target : values) found.put(target, states.getOrDefault(target, State.VISIBLE));
        return found;
    }
    HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> values, boolean hide) {
        if (!ACTION_LOCK.isHeldByCurrentThread()) throw new AssertionError("Unlocked operation");
        batchCalls++;
        HideBatchExecutor.Outcome<Target> result = new HideBatchExecutor.Outcome<>();
        for (Target target : values) {
            mutations++;
            states.put(target, hide ? State.HIDDEN : State.VISIBLE);
            result.success.add(target);
        }
        return result;
    }
    HideBatchExecutor.Outcome<Target> executeBatch(Set<Target> values, boolean hide, RootStatus root,
            java.util.function.Consumer<String> progress) { return executeBatch(values, hide); }
    OperationResult syncMirrors() { mirrorWrites++; return OperationResult.success("mirrored"); }
    void resetCounters() { targetReads = classificationReads = stateReads = batchCalls = mutations = mirrorWrites = 0; }
}
'''


TESTS = r'''
public class TestHideAutomationScope {
    static int passed, failed;
    static RootShell.Result ok(String output) { return new RootShell.Result(true, false, output); }
    static RootShell.Result error() { return new RootShell.Result(false, false, "failure"); }
    static RootShell.Result timeout() { return new RootShell.Result(false, true, ""); }
    static void mode(String name) {
        switch (name) {
            case "owner": RootShell.responses(ok("0"), ok("0")); break;
            case "other": RootShell.responses(ok("12"), ok("12")); break;
            case "primary-timeout": RootShell.responses(timeout(), ok("0")); break;
            case "fallback-timeout": RootShell.responses(ok("0"), timeout()); break;
            case "conflict": RootShell.responses(ok("0"), ok("12")); break;
            case "invalid": RootShell.responses(ok("unknown"), ok("0")); break;
            case "empty": RootShell.responses(ok(""), ok("")); break;
            case "unlisted": RootShell.responses(ok("25"), ok("25")); break;
            case "both-failed": RootShell.responses(error(), error()); break;
            default: throw new AssertionError(name);
        }
    }
    static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static void test(String name, Runnable body) {
        try { body.run(); passed++; System.out.println("PASS " + name); }
        catch (Throwable failure) { failed++; System.out.println("FAIL " + name + ": " + failure); }
    }
    static HideAppsActivity unresolved(String scope) {
        mode("conflict");
        HideAppsActivity activity = new HideAppsActivity(scope);
        // Isolate saving/click behavior from the separate loadUsers regression.
        activity.loading = false;
        activity.currentUser = UserResolution.failure("injected unresolved result");
        return activity;
    }
    static void savedCurrent(HideAppsActivity activity) {
        activity.settle(449);
        check(activity.config.saves == 0, "saved before automatic-save deadline");
        activity.settle(1);
        check(activity.config.saves >= 1, "the actual automatic-save callback did not persist the edit");
        check("current".equals(activity.config.get(AppConfig.AUTOMATION_SCOPE)), "save widened scope");
        check(!activity.dirty && !activity.saving, "successful save did not settle");
    }
    static RootHideManager backend(String scope) {
        RootHideManager manager = new RootHideManager(new AppConfig(scope));
        for (int user : new int[]{0, 12}) {
            RootHideManager.Target target = new RootHideManager.Target(user, user==0?0:42, "org.example.sameapp");
            manager.stored.add(target);
            manager.states.put(target, RootHideManager.State.VISIBLE);
        }
        return manager;
    }
    static void noActions(RootHideManager manager) {
        check(manager.classificationReads == 0 && manager.stateReads == 0, "queried packages after failed resolution");
        check(manager.batchCalls == 0 && manager.mutations == 0, "executed a hide/show batch after failed resolution");
        check(manager.mirrorWrites == 0, "published a mirror after failed resolution");
        check(!RootHideManager.ACTION_LOCK.isLocked(), "failure leaked operation lock");
    }
    static void hiddenOnly(RootHideManager manager, int user) {
        for (RootHideManager.Target target : manager.stored) {
            RootHideManager.State expected = target.userId == user ? RootHideManager.State.HIDDEN : RootHideManager.State.VISIBLE;
            check(manager.states.get(target) == expected, "wrong state for " + target + ": " + manager.states.get(target));
        }
        check(manager.mutations == 1, "expected exactly one per-user change");
        check(manager.mirrorWrites == 1, "successful change should publish one mirror");
    }
    public static void main(String[] args) {
        String[] failures = {"primary-timeout", "fallback-timeout", "conflict", "invalid", "empty", "unlisted", "both-failed"};
        for (String failure : failures) {
            test("UI load retains current without saving: " + failure, () -> {
                mode(failure);
                HideAppsActivity activity = new HideAppsActivity("current");
                activity.load();
                check(!activity.currentUser.resolved, "failure fixture unexpectedly resolved");
                activity.settle(450);
                check("current".equals(activity.config.get(AppConfig.AUTOMATION_SCOPE)), "availability auto-save widened scope");
                check(!activity.automationAllUsers.isChecked(), "availability callback selected all users");
                check(!activity.dirty && activity.editGeneration == 0 && activity.config.saves == 0,
                        "system discovery was treated as a user edit");
            });
        }
        test("UI unavailable user directory retains current", () -> {
            mode("owner");
            HideAppsActivity activity = new HideAppsActivity("current");
            activity.manager.directory = RootHideManager.UserDirectory.failure("injected listing failure");
            activity.load(); activity.settle(450);
            check(!activity.automationAllUsers.isChecked() && activity.config.saves == 0 && !activity.dirty,
                    "directory failure changed or saved scope");
        });
        test("UI explicit all-to-current click persists while unresolved", () -> {
            HideAppsActivity activity = unresolved("all");
            activity.automationAllUsers.performClick();
            check(!activity.automationAllUsers.isChecked(), "click listener undid user's current-only choice");
            savedCurrent(activity);
        });
        test("UI current-to-all-to-current click sequence persists final choice", () -> {
            HideAppsActivity activity = unresolved("current");
            activity.automationAllUsers.performClick();
            activity.automationAllUsers.performClick();
            check(!activity.automationAllUsers.isChecked(), "second click was forced back to all");
            savedCurrent(activity);
        });
        test("UI unresolved current allows master switch off", () -> {
            HideAppsActivity activity = unresolved("current");
            activity.master.performClick();
            savedCurrent(activity);
            check("0".equals(activity.config.get(AppConfig.HIDE_MASTER)), "master switch off was lost");
        });
        test("UI unresolved current allows tile edits", () -> {
            HideAppsActivity activity = unresolved("current");
            activity.tileLabel.setText("new label");
            activity.tileDescription.setText("new description");
            savedCurrent(activity);
            check("new label".equals(activity.config.get(AppConfig.TILE_LABEL)) &&
                    "new description".equals(activity.config.get(AppConfig.TILE_DESCRIPTION)), "tile edit was lost");
        });
        test("UI unresolved current allows target selection save", () -> {
            HideAppsActivity activity = unresolved("current");
            RootHideManager.Target owner = new RootHideManager.Target(0, 0, "org.example.owner");
            RootHideManager.Target other = new RootHideManager.Target(12, 42, "org.example.other");
            activity.editTargets(owner); activity.editTargets(other);
            savedCurrent(activity);
            check(activity.manager.targetSaves == 1 && activity.manager.stored.equals(new LinkedHashSet<>(Arrays.asList(owner, other))),
                    "target edits not passed intact to manager");
        });
        test("UI unresolved current permits disabling automation", () -> {
            HideAppsActivity activity = unresolved("current");
            activity.automationEnabled.performClick();
            savedCurrent(activity);
            check("0".equals(activity.config.get(AppConfig.AUTOMATION_ENABLED)), "disable edit was lost");
        });
        test("UI explicitly selecting all is preserved", () -> {
            HideAppsActivity activity = unresolved("current");
            activity.automationAllUsers.performClick(); activity.settle(450);
            check("all".equals(activity.config.get(AppConfig.AUTOMATION_SCOPE)) && activity.config.saves == 1, "explicit all not saved");
            activity.load(); activity.settle(450);
            check(activity.automationAllUsers.isChecked() && activity.config.saves == 1 && !activity.dirty,
                    "discovery rewrote explicit all");
        });
        for (String scope : new String[]{"current", "all"}) {
            test("UI loading initialization has no save: " + scope, () -> {
                mode("owner"); HideAppsActivity activity = new HideAppsActivity(scope);
                activity.settle(450);
                check(activity.loading && activity.config.saves == 0 && !activity.dirty && activity.editGeneration == 0,
                        "initial widget values triggered persistence");
                activity.load(); activity.settle(450);
                check(scope.equals(activity.config.get(AppConfig.AUTOMATION_SCOPE)) && activity.config.saves == 0,
                        "successful directory load changed persisted choice");
            });
        }
        test("UI resolved current retains normal automatic save", () -> {
            mode("other"); HideAppsActivity activity = new HideAppsActivity("current"); activity.load();
            check(activity.currentUser.userId == 12, "did not identify non-999 user");
            activity.tileLabel.setText("normal edit"); savedCurrent(activity);
        });
        test("UI batch scope follows space identity and ignores search/status filter", () -> {
            HideAppsActivity activity = unresolved("all");
            RootHideManager.Target owner = new RootHideManager.Target(0,0,"org.example.owner");
            RootHideManager.Target other = new RootHideManager.Target(12,42,"org.example.other");
            RootHideManager.Target stale = new RootHideManager.Target(12,41,"org.example.stale");
            activity.savedTargets.addAll(Arrays.asList(owner,other,stale));
            check(activity.scope().equals(activity.savedTargets),"all-space scope lost a saved target");
            activity.allSpaces=false;activity.activeUserId=12;activity.activeUserSerial=42;
            check(activity.scope().equals(Set.of(other)),"scope ignored the user serial or included another space");
            activity.search.setText("__no_match__");activity.listFilter=1;
            check(activity.scope().equals(Set.of(other)),"presentation filtering narrowed the confirmed scope");
            activity.activeUserSerial=43;
            check(activity.scope().isEmpty()&&activity.savedTargets.size()==3,"unknown binding widened scope or erased saved intent");
        });
        test("UI restoration remains available after master off and under a hide conflict", () -> {
            HideAppsActivity activity=unresolved("all");activity.master.performClick();activity.settle(450);
            check(!activity.ready(true)&&activity.ready(false),"master off concealed restoration or permitted hiding");
            activity.rootReady=false;
            check(!activity.ready(true)&&activity.ready(false),"hide prerequisites prevented restoration");
            activity.rootGranted=false;
            check(!activity.ready(true)&&!activity.ready(false),"visibility action accepted missing Root permission");
        });
        test("UI pending reads, edits, saves and operations block visibility actions", () -> {
            HideAppsActivity activity=unresolved("all");
            check(activity.ready(true)&&activity.ready(false),"ready fixture did not allow actions");
            activity.loading=true;check(!activity.ready(true)&&!activity.ready(false),"loading permitted an action");activity.loading=false;
            activity.selectionLoading=true;check(!activity.ready(true)&&!activity.ready(false),"selection loading permitted an action");activity.selectionLoading=false;
            activity.selectionReady=false;check(!activity.ready(true)&&!activity.ready(false),"unread selection permitted an action");activity.selectionReady=true;
            activity.dirty=true;check(!activity.ready(true)&&!activity.ready(false),"pending edit permitted an action");activity.dirty=false;
            activity.saving=true;check(!activity.ready(true)&&!activity.ready(false),"pending save permitted an action");activity.saving=false;
            activity.operating=true;check(!activity.ready(true)&&!activity.ready(false),"concurrent action permitted an action");
        });
        for (String failure : failures) {
            test("execution rejects before all package activity: " + failure, () -> {
                mode(failure); RootHideManager manager = backend("current");
                check(!manager.runScreenOffAutomation().success, "unresolved current operation succeeded");
                noActions(manager);
            });
        }
        test("execution rejects failed user listing before package lookup", () -> {
            mode("owner"); RootHideManager manager = backend("current");
            manager.directory = RootHideManager.UserDirectory.failure("listing failed");
            check(!manager.runScreenOffAutomation().success, "failed directory accepted");
            noActions(manager); check(RootShell.queries == 0, "queried current user after directory failure");
        });
        for (int user : new int[]{0, 12}) {
            test("execution recovers without widening user " + user, () -> {
                mode("primary-timeout"); RootHideManager manager = backend("current");
                check(!manager.runScreenOffAutomation().success, "timeout accepted"); noActions(manager);
                mode(user == 0 ? "owner" : "other");
                check(manager.runScreenOffAutomation().success, "resolution recovery rejected"); hiddenOnly(manager, user);
                check("current".equals(manager.config.get(AppConfig.AUTOMATION_SCOPE)) && manager.config.saves == 0,
                        "execution modified persisted scope");
            });
        }
        test("execution explicit all includes both users without current-user fallback", () -> {
            mode("conflict"); RootHideManager manager = backend("all");
            check(manager.runScreenOffAutomation().success, "explicit all unnecessarily requires current user");
            check(manager.mutations == 2 && RootShell.queries == 0, "explicit all behavior changed");
            for (RootHideManager.State state : manager.states.values()) check(state == RootHideManager.State.HIDDEN, "missed configured user");
        });
        test("execution uses fresh current user after a user switch", () -> {
            RootHideManager manager = backend("current"); mode("owner");
            check(manager.runScreenOffAutomation().success, "owner execution failed"); hiddenOnly(manager, 0);
            for (RootHideManager.Target target : manager.stored) manager.states.put(target, RootHideManager.State.VISIBLE);
            manager.resetCounters(); mode("other");
            check(manager.runScreenOffAutomation().success, "other-user execution failed"); hiddenOnly(manager, 12);
        });
        test("legacy single-show and emergency APIs perform no visibility action",()->{
            RootHideManager manager=backend("all");
            for(var t:manager.stored)manager.states.put(t,RootHideManager.State.HIDDEN);
            check(manager.show(manager.stored.iterator().next()).reviewRequired,"single show bypassed review");
            check(!manager.emergencyRestore().success,"emergency accepted an unconfirmed action");
            check(manager.batchCalls==0&&manager.mutations==0&&manager.targetSaves==0,"legacy show mutated state/config");
            check(!RootHideManager.ACTION_LOCK.isLocked(),"review leaked lock");
        });
        test("explicit show-all restores both spaces and retains the saved list",()->{
            RootHideManager manager=backend("all");manager.states.replaceAll((t,s)->RootHideManager.State.HIDDEN);
            Set<RootHideManager.Target> before=new LinkedHashSet<>(manager.stored);
            manager.config.values.put(AppConfig.HIDE_MASTER,"0");
            check(manager.showAll().success&&manager.mutations==2,"requested restore did not show configured apps with master off");
            check(manager.states.values().stream().allMatch(s->s==RootHideManager.State.VISIBLE),"restore left a hidden app");
            check(before.equals(manager.stored)&&manager.targetSaves==0,"restore changed the configured list");
        });
        test("actual toggle mixed hidden/visible restores configured apps",()->{
            RootHideManager manager=backend("all");manager.states.put(manager.stored.iterator().next(),RootHideManager.State.HIDDEN);
            check(manager.toggleAll().success&&manager.mutations==2,"mixed toggle did not restore both apps");
            check(manager.states.values().stream().allMatch(s->s==RootHideManager.State.VISIBLE),"mixed toggle hid a visible app");
        });
        test("actual toggle rejects unknown state without side effects",()->{
            RootHideManager manager=backend("all");manager.states.put(manager.stored.iterator().next(),RootHideManager.State.ERROR);
            check(!manager.toggleAll().success&&manager.batchCalls==0&&manager.mutations==0,"unknown state permitted a toggle");
        });
        test("actual toggle all-hidden restores configured apps",()->{
            RootHideManager manager=backend("all");manager.states.replaceAll((t,s)->RootHideManager.State.HIDDEN);
            check(manager.toggleAll().success&&manager.mutations==2
                    &&manager.states.values().stream().allMatch(s->s==RootHideManager.State.VISIBLE),"all-hidden toggle did not restore both apps");
        });
        test("actual toggle all-visible retains hide behavior",()->{
            RootHideManager manager=backend("all");check(manager.toggleAll().success&&manager.mutations==2,"visible toggle no longer hides");
        });
        test("legacy system target is skipped and retained without implicit show",()->{
            RootHideManager manager=backend("all");var old=manager.stored.iterator().next();
            manager.systemTargets.add(old);manager.states.put(old,RootHideManager.State.HIDDEN);
            RootHideManager.OperationResult result=manager.hideAll(false);
            check(!result.success&&result.message.contains("重新核对"),"legacy target did not request review");
            check(manager.states.get(old)==RootHideManager.State.HIDDEN&&manager.stored.contains(old),"legacy state/selection changed");
            check(manager.mutations==1&&manager.targetSaves==0,"legacy target mutated or selection erased");
        });
        System.out.println("Hide automation scope: " + passed + " passed, " + failed + " failed; offline doubles, no device commands");
        if (failed != 0) throw new AssertionError("P1-HIDE-001 regressions failed: " + failed);
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--activity-source", type=Path, default=SOURCE / "HideAppsActivity.java")
    args = parser.parse_args()
    activity = args.activity_source.read_text(encoding="utf-8-sig")
    manager = (SOURCE / "RootHideManager.java").read_text(encoding="utf-8-sig")
    activity_methods = "\n".join(member(activity, signature) for signature in (
        "    private View switchRow(", "    private String activationProblem(", "    private EditText textInput(",
        "    private void loadUsers()", "    private void updateUserAvailability(",
        "    private void saveSettings()", "    private void markDirty()",
        "    private Set<RootHideManager.Target> scopedTargets(", "    private boolean inSelectedSpace(",
        "    private boolean canOperate(",
    ))
    automation_controls = between(activity, "        LinearLayout automation=new LinearLayout(this);",
                                  "        automationCard.addView(automationPanel")
    auto_save = member(activity, "    private final Runnable autoSave =") + ";"
    constructor = r'''
    HideAppsActivity(String scope) {
        config = new AppConfig(scope); manager = new RootHideManager(config);
        switchRow("master", "", master = new Switch(this), config.getBoolean(AppConfig.HIDE_MASTER));
        switchRow("automatic", "", automationEnabled = new Switch(this), config.getBoolean(AppConfig.AUTOMATION_ENABLED));
        switchRow("tile", "", tileEnabled = new Switch(this), config.getBoolean(AppConfig.TILE_ENABLED));
        tileLabel = textInput("label", config.get(AppConfig.TILE_LABEL), 30);
        tileDescription = textInput("description", config.get(AppConfig.TILE_DESCRIPTION), 60);
''' + automation_controls + "\n    }\n"
    manager_methods = "\n".join(member(manager, signature) for signature in (
        "    OperationResult show(Target target)",
        "    OperationResult showAll()",
        "    OperationResult emergencyRestore()",
        "    OperationResult toggleAll()",
        "    OperationResult hideAll(boolean currentUserOnly)",
        "    private OperationResult change(Target target, boolean hide, boolean lockHeld)",
        "    private OperationResult changeValidated(Target target, boolean hide,",
        "    private HideUserIdentity.Snapshot matchUser(Target target)",
        "    OperationResult runScreenOffAutomation()",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly) {",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot)",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot,\n            Set<Target> confirmed, java.util.function.Consumer<String> progress)",
        "    private OperationResult changeAll(boolean hide, boolean currentUserOnly, RootStatus checkedRoot,\n            Set<Target> confirmed, Set<Target> requested, java.util.function.Consumer<String> progress)",
        "    private static void reportProgress(",
        "    UserResolution currentUser(UserDirectory directory)",
        "    private UserResolution resolveCurrentUser(UserDirectory directory)",
        "    static boolean isValidPackage(String packageName)",
        "    static boolean isProtected(String packageName)",
        "    static {",
        "    static final class Target extends", "    static final class UserRecord {",
        "    static final class UserDirectory {", "    static final class RootStatus {",
        "    static final class ConflictState {", "    static final class OperationResult {",
    ))
    package_pattern = between(manager, "    private static final Pattern PACKAGE =",
                              "    private static final Pattern USER =")
    java = (UI_DOUBLES + ACTIVITY_PREFIX + auto_save + "\n" + constructor + activity_methods
            + ACTIVITY_HELPERS + MANAGER_PREFIX.rsplit("}", 1)[0] + package_pattern
            + "\n    private static final Set<String> PROTECTED;\n" + manager_methods + "\n}\n" + TESTS)
    with tempfile.TemporaryDirectory(prefix="ls-hide-automation-scope-") as folder:
        path = Path(folder) / "TestHideAutomationScope.java"
        path.write_text(java, encoding="utf-8")
        subprocess.run(["javac", "-encoding", "UTF-8", "--release", "17", "-d", folder,
                        str(path), str(SOURCE / "UserResolution.java"), str(SOURCE / "HideTargetCodec.java"),
                        str(SOURCE / "ScreenAutomationPolicy.java")], check=True, timeout=60)
        print(f"Activity source under test: {args.activity_source.resolve()}", flush=True)
        completed = subprocess.run(["java", "-cp", folder, "ls.augment.com.TestHideAutomationScope"],
                                   timeout=30, check=False)
        raise SystemExit(completed.returncode)


if __name__ == "__main__":
    main()
