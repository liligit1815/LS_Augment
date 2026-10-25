package ls.augment.com;

import java.util.HashSet;

public final class TestAtomicWorkbenchWorkspaceModel {
    public static void main(String[] args) {
        AtomicWorkbenchWorkspaceModel model = new AtomicWorkbenchWorkspaceModel();
        require(model.desktopVisible() && model.appCount() == 0, "starts on real internal desktop");
        int settings = launch(model, "settings/Launcher");
        require(!model.desktopVisible(), "launch replaces desktop");
        require(model.parkMainInEmptySide(0), "empty plus returns to desktop");
        require(model.sideWindowId(0) == settings && model.component(settings) != null,
                "parking retains task identity and chosen side position");
        require(!model.parkMainInEmptySide(1), "plus cannot park the desktop itself");
        int ledger = launch(model, "ledger/Launcher");
        require(model.parkMainInEmptySide(1), "second app parks in second side");
        int qq = launch(model, "qq/Launcher");
        require(model.promote(settings), "existing app promotes");
        require(model.mainWindowId() == settings && model.sideWindowId(0) == qq
                && model.sideWindowId(1) == ledger, "only clicked side and main exchange roles");
        require(model.promote(ledger) && model.sideWindowId(1) == settings,
                "repeat exchange preserves other slots");
        require(model.parkMainInEmptySide(2) && model.desktopVisible(), "third plus produces desktop");
        require(model.appCount() == 3 && model.sideWindowId(2) == ledger,
                "three occupied sides coexist with the desktop");
        int fourth = launch(model, "fourth/Launcher");
        model.showDesktop();
        require(model.lastMainWindowId() == fourth && model.appCount() == 4,
                "home hides fourth app without losing its identity");
        require(!model.planLaunch("fifth/Launcher").accepted(), "full workbench refuses new app");
        require(launch(model, "qq/Launcher") == qq && model.appCount() == 4,
                "full workbench can still focus an existing app");
        require(model.promote(fourth), "hidden last main remains reachable");
        int closedSide = model.sideWindowId(0);
        model.removeWindow(closedSide);
        require(model.appCount() == 3 && model.component(closedSide) == null,
                "restored closed window alone releases capacity");
        require(launch(model, "replacement/Launcher") == closedSide,
                "empty ID reused without renumbering other sessions");
        AtomicWorkbenchWorkspaceModel.LaunchPlan stale = model.planLaunch("settings/Launcher");
        require(stale.accepted(), "existing live app supplies an accepted plan");
        model.showDesktop();
        require(!model.commitLaunch(stale), "stale callback cannot apply an outdated plan");
        AtomicWorkbenchWorkspaceModel.LaunchPlan beforeReset = model.planLaunch("settings/Launcher");
        model.reset();
        require(!model.commitLaunch(beforeReset) && model.appCount() == 0 && model.desktopVisible(),
                "old open result cannot resurrect a closed session");
        require(!model.promote(0), "empty slots cannot become application main");
        checkSideProjection(model);
        model.setHostedWindow(0, true);
        require(model.promote(0) && !model.desktopVisible() && model.component(0) == null,
                "native home owns and promotes a display without pretending to be a launcher component");
        require(model.planLaunch("new/App").windowId != 0, "ordinary launch cannot overwrite an occupied native-home display");
        model.setHostedWindow(2, true);
        checkSideProjection(model);
        require(model.visibleSideWindowIds(0).length == 1 && model.visibleSideWindowIds(0)[0] == 2,
                "native-home side remains visible with zero empty placeholders");
        model.removeWindow(2); model.reset();
        require(!model.hasWindow(0) && !model.hasWindow(2), "cleanup clears native-home ownership");
        checkEmptyHomeReplacement();
        checkNativeApplicationOwnership();
        checkRetiredExplicitBindings();
        for (int iteration = 0; iteration < 200; iteration++) {
            model.reset();
            for (int app = 0; app < 4; app++) launch(model, "package" + app + "/Main");
            for (int step = 0; step < 16; step++) {
                int target = (step + iteration) % 4;
                require(model.promote(target), "each live ID promotes");
                rolesUnique(model);
                require(model.appCount() == 4, "role exchange never drops or duplicates an app");
                checkSideProjection(model);
            }
            for (int id = 0; id < 4; id++) { model.removeWindow(id); checkSideProjection(model); }
        }
        System.out.println("Atomic workbench workspace model checks: OK");
    }

    private static void checkEmptyHomeReplacement() {
        AtomicWorkbenchWorkspaceModel model = new AtomicWorkbenchWorkspaceModel();
        launch(model, "one/Main"); launch(model, "two/Main"); launch(model, "three/Main");
        int home = model.planLaunch("four/Main").windowId;
        model.setHostedWindow(home, true); model.promote(home);
        require(!model.planLaunch("four/Main").accepted(), "unconfirmed HOME ownership is not safe to overwrite");
        model.setEmptyHomeWindow(home, true);
        AtomicWorkbenchWorkspaceModel.LaunchPlan replacement = model.planLaunch("four/Main");
        require(replacement.accepted() && replacement.replacesEmptyHome && replacement.windowId == home,
                "three apps plus confirmed empty HOME accept a fourth app in the same main display slot");
        require(model.commitLaunch(replacement) && model.hasWindow(home), "replacement retains existing display ownership during OPEN");
        require(!model.planLaunch("five/Main").accepted(), "an in-flight replacement cannot be overwritten");
        require(model.rollbackEmptyHomeReplacement(replacement) && model.component(home) == null && model.hasWindow(home),
                "rejected replacement removes only proposed app and retains HOME/tasks for recovery");
        require(!model.planLaunch("four/Main").accepted(), "rollback requires fresh evidence before another replacement");
        model.setEmptyHomeWindow(home, true);
        AtomicWorkbenchWorkspaceModel.LaunchPlan stale = model.planLaunch("four/Main");
        model.setEmptyHomeWindow(home, false); // A native launcher has since opened an app.
        require(!model.commitLaunch(stale), "new native app invalidates a previously empty HOME replacement plan");
        require(model.hasWindow(home) && model.visibleSideWindowIds(0).length == 3, "native app ownership and three occupied sides remain visible");
        model.setEmptyHomeWindow(home, true);
        AtomicWorkbenchWorkspaceModel.LaunchPlan confirmed = model.planLaunch("four/Main");
        require(model.commitLaunch(confirmed), "fresh HOME-only observation permits replacement");
        model.setHostedWindow(home, false); // Root confirmed HOME was restored and ordinary OPEN accepted.
        require("four/Main".equals(model.component(home)) && model.hasWindow(home), "successful replacement retains the new ordinary app");
        model.setEmptyHomeWindow(home, true);
        require(!model.planLaunch("five/Main").accepted(), "HOME overlay on a bound app cannot mark it replaceable");
        model.reset();
        require(!model.rollbackEmptyHomeReplacement(confirmed) && !model.hasWindow(home), "late failure cannot resurrect ownership after reset");
    }

    private static void checkNativeApplicationOwnership() {
        AtomicWorkbenchWorkspaceModel model = new AtomicWorkbenchWorkspaceModel();
        int douyin = launch(model, "com.ss.android.ugc.aweme/.splash.SplashActivity");
        AtomicWorkbenchWorkspaceModel.LaunchPlan alias = model.planLaunch("com.ss.android.ugc.aweme/com.ss.android.ugc.aweme.main.MainActivity");
        require(alias.existing && alias.windowId == douyin && model.commitLaunch(alias),
                "different launcher aliases focus the same package instead of opening a duplicate slot");
        require(model.appCount() == 1, "alias promotion does not add another application binding");
        model.reset();
        model.setHostedWindow(2, true);
        model.setRunningPackages(2, java.util.List.of("com.ss.android.ugc.aweme"));
        AtomicWorkbenchWorkspaceModel.LaunchPlan nativeApp = model.planLaunch("com.ss.android.ugc.aweme/.splash.SplashActivity");
        require(nativeApp.existing && nativeApp.windowId == 2 && model.commitLaunch(nativeApp),
                "native HOME launcher app keeps its original display rather than consuming another slot");
        require(model.component(2) == null && model.hasWindow(2), "native task observation does not invent a launcher binding");
        AtomicWorkbenchWorkspaceModel.LaunchPlan stale = model.planLaunch("com.ss.android.ugc.aweme/.splash.SplashActivity");
        model.setRunningPackages(2, null);
        require(model.commitLaunch(stale), "missing transport observation cannot erase real app ownership");
        stale = model.planLaunch("com.ss.android.ugc.aweme/.splash.SplashActivity");
        model.setRunningPackages(2, java.util.List.of());
        require(!model.commitLaunch(stale) && model.find("com.ss.android.ugc.aweme/.splash.SplashActivity") == -1,
                "fresh empty snapshot retires app ownership and invalidates the old focus plan");
        model.setRunningPackages(2, java.util.List.of("com.ss.android.ugc.aweme"));
        model.removeWindow(2); model.setHostedWindow(2, true);
        require(model.find("com.ss.android.ugc.aweme/.splash.SplashActivity") == -1,
                "reused display slot never inherits the old app's observed package");
        model.setRunningPackages(2, java.util.List.of("com.ss.android.ugc.aweme")); model.reset();
        model.setHostedWindow(2, true);
        require(model.find("com.ss.android.ugc.aweme/.splash.SplashActivity") == -1,
                "new workspace never inherits retired package observations");
    }

    private static void checkRetiredExplicitBindings() {
        AtomicWorkbenchWorkspaceModel model = new AtomicWorkbenchWorkspaceModel();
        int app = launch(model, "app/Launcher");
        model.setHostedWindow(app, true); // The app's display also retains real HOME.
        model.setRunningPackages(app, java.util.List.of("app"), true);
        AtomicWorkbenchWorkspaceModel.LaunchPlan alias = model.planLaunch("app/OtherLauncher");
        require(alias.existing && alias.windowId == app && model.commitLaunch(alias),
                "a confirmed package continues to own all of its launcher aliases");
        model.setRunningPackages(app, null, true);
        require("app/Launcher".equals(model.component(app)) && model.find("app/OtherLauncher") == app,
                "missing or failed observation never retires an explicit app binding");
        model.setRunningPackages(app, java.util.List.of());
        model.setRunningPackages(app, java.util.List.of(), false);
        require("app/Launcher".equals(model.component(app)) && model.find("app/OtherLauncher") == app,
                "cached or startup observations cannot revoke an in-flight launch reservation");
        AtomicWorkbenchWorkspaceModel.LaunchPlan oldFocus = model.planLaunch("app/OtherLauncher");
        int oldMain = model.mainWindowId(), oldLast = model.lastMainWindowId();
        int[] oldSides = new int[3];
        for (int index = 0; index < 3; index++) oldSides[index] = model.sideWindowId(index);
        model.setRunningPackages(app, java.util.List.of(), true);
        require(model.component(app) == null && model.find("app/Launcher") == -1 && model.appCount() == 0,
                "fresh stable empty snapshot retires the old explicit package even when the cached list was already empty");
        require(model.hasWindow(app) && !model.desktopVisible() && model.mainWindowId() == oldMain
                        && model.lastMainWindowId() == oldLast,
                "task exit preserves the live HOME/display lease and main identity until an explicit close");
        for (int index = 0; index < 3; index++) require(model.sideWindowId(index) == oldSides[index],
                "retiring an app never exchanges or renumbers side roles");
        require(!model.commitLaunch(oldFocus), "an app exit invalidates an already planned focus callback");
        require(!model.planLaunch("app/Launcher").existing,
                "opening the exited app no longer takes the stale focus route");
        model.setEmptyHomeWindow(app, true); // A separate fresh HOME-only proof permits replacement.
        AtomicWorkbenchWorkspaceModel.LaunchPlan reopened = model.planLaunch("app/OtherLauncher");
        require(!reopened.existing && reopened.replacesEmptyHome && reopened.windowId == app
                        && model.commitLaunch(reopened),
                "the app can reopen in its original confirmed HOME-only window");
        model.setRunningPackages(app, java.util.List.of(), false);
        require("app/OtherLauncher".equals(model.component(app)),
                "the prior empty observation cannot erase the newly committed replacement during startup");
        model.setRunningPackages(app, java.util.List.of("app"), true);
        require(model.find("app/Launcher") == app && model.appCount() == 1,
                "a successful relaunch reestablishes package ownership without a duplicate slot");

        model.reset();
        app = launch(model, "app/Launcher");
        launch(model, "two/Launcher"); launch(model, "three/Launcher"); launch(model, "four/Launcher");
        int currentMain = model.mainWindowId();
        model.setRunningPackages(app, java.util.List.of("remaining", "other", "remaining"), true);
        require(model.component(app) == null && model.hasWindow(app) && model.appCount() == 3,
                "an exited bound app retires without releasing a display that still contains other tasks");
        require(model.find("remaining/Launcher") == app && model.find("other/Launcher") == app,
                "all other observed packages retain their original display and aliases");
        require(!model.planLaunch("app/Launcher").accepted() && !model.planLaunch("new/Launcher").accepted(),
                "retiring one binding cannot overwrite remaining tasks when the workspace is full");
        require(model.mainWindowId() == currentMain && model.lastMainWindowId() == currentMain,
                "retiring a side-window binding never moves main focus");
        model.removeWindow(app);
        require(!model.hasWindow(app) && model.find("remaining/Launcher") == -1,
                "only confirmed close releases the remaining display ownership and package observations");
        AtomicWorkbenchWorkspaceModel.LaunchPlan fresh = model.planLaunch("app/Launcher");
        require(fresh.accepted() && !fresh.existing && fresh.windowId == app && model.commitLaunch(fresh),
                "a closed display's stable ID can be reused without old package ownership");
        model.setRunningPackages(app, java.util.List.of("app"), true);
        require(model.component(app) != null && model.find("app/OtherLauncher") == app,
                "a snapshot containing the same package never retires its explicit component");
        rolesUnique(model);
    }

    private static void checkSideProjection(AtomicWorkbenchWorkspaceModel model) {
        int main = model.mainWindowId(), appCount = model.appCount();
        String[] components = new String[4];
        for (int id = 0; id < 4; id++) components[id] = model.component(id);
        for (int limit = 0; limit <= 3; limit++) {
            int[] projected = model.visibleSideWindowIds(limit);
            int index = 0, empty = 0, occupied = 0;
            for (int side = 0; side < 3; side++) {
                int id = model.sideWindowId(side);
                if (model.hasWindow(id)) occupied++;
                if (model.hasWindow(id) || empty++ < limit)
                    require(index < projected.length && projected[index++] == id,
                            "projection preserves side order and occupied window IDs");
            }
            require(index == projected.length && projected.length == occupied + Math.min(limit, 3 - occupied),
                    "preference limits only empty placeholders");
            require(model.mainWindowId() == main && model.appCount() == appCount, "projection never changes task ownership");
            for (int id = 0; id < 4; id++) require(java.util.Objects.equals(components[id], model.component(id)),
                    "projection retains all component identities");
        }
        boolean rejected = false;
        try { model.visibleSideWindowIds(-1); } catch (IllegalArgumentException expected) { rejected = true; }
        require(rejected, "negative preference rejected");
        rejected = false;
        try { model.visibleSideWindowIds(4); } catch (IllegalArgumentException expected) { rejected = true; }
        require(rejected, "over-capacity preference rejected");
    }

    private static int launch(AtomicWorkbenchWorkspaceModel model, String component) {
        AtomicWorkbenchWorkspaceModel.LaunchPlan plan = model.planLaunch(component);
        require(plan.accepted() && model.commitLaunch(plan), "launch accepted: " + component);
        rolesUnique(model);
        return plan.windowId;
    }
    private static void rolesUnique(AtomicWorkbenchWorkspaceModel model) {
        HashSet<Integer> roles = new HashSet<>();
        roles.add(model.mainWindowId());
        for (int side = 0; side < 3; side++) require(roles.add(model.sideWindowId(side)),
                "every stable window has exactly one layout role");
        require(roles.size() == 4, "all four windows have roles");
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
