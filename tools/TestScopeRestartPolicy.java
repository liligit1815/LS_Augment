package ls.augment.com;

import java.util.List;

/** Regression scenarios for reload coverage; never runs a command or touches a device. */
public final class TestScopeRestartPolicy {
    private static int checks;
    public static void main(String[] args) {
        page("group/notifications/island", "device");
        page("group/gaming/plugins", "device");
        page("group/gaming/performance", "device");
        page("group/capture/capture", "device");
        page("group/connectivity/usb_mtp", "apps");
        page("group/notifications/statusbar", "systemui");
        page("group/lockscreen/lock_clock", "systemui");
        page("group/lockscreen/theme_download", "theme");
        page("group/desktop/launcher_grid", "launcher");
        page("group/cooling/fan", "fan");
        page("group/atomic_workbench/workspace", "device");
        page("group/capture/image_edit", "apps");
        check("device".equals(HookAppCatalog.restartScopeForRoute("super_resolution")), "standalone super-resolution editor misses server");
        check("device".equals(HookAppCatalog.restartScopeForRoute("diablo_coexist")), "standalone coexistence editor misses server");
        check("games".equals(HookAppCatalog.restartScopeForRoute("combo_speed")), "combo-only editor must retain local restart");
        check("systemui".equals(HookAppCatalog.restartScopeForRoute("status_layout")), "status editor inherited unrelated island sources");
        check("theme".equals(HookAppCatalog.restartScopeForRoute("beautify")), "theme editor must restart both theme processes only");
        check("theme".equals(HookAppCatalog.restartScopeForKey(ConfigSchema.BEAUTIFY_UNLIMITED_TRIAL)), "trial inherited unrelated fingerprint/system restart");
        check("am force-stop com.zte.beautify; am force-stop com.zte.beautifyadapter".equals(ScopeRestartPolicy.command("theme")), "theme restart must cover frontend and backend without reboot");
        check("device".equals(ModuleHierarchy.restartScopeForCategory("notifications")), "notification category misses island sources");
        check("device".equals(ModuleHierarchy.restartScopeForCategory("gaming")), "game category misses server");
        check("device".equals(ModuleHierarchy.restartScopeForCategory("capture")), "capture category misses SystemUI");
        check("fan".equals(ModuleHierarchy.restartScopeForCategory("cooling")), "fan page must cover service and tile");
        check("device".equals(ModuleHierarchy.restartScopeForCategory("atomic_workbench")), "workbench category must not narrow to Amap");
        check(ModuleHierarchy.restartScopeForCategory("unknown") == null, "unknown page suggested a reboot");
        check(HookAppCatalog.restartScopeForKey("unknown") == null, "unknown key suggested a reboot");
        check(ScopeRestartPolicy.completeScope(null, List.of()) == null, "empty scope suggested reboot");
        check("device".equals(ScopeRestartPolicy.completeScope("apps", List.of("unknown.app"))), "unknown dependency falsely covered");
        check("device".equals(ScopeRestartPolicy.completeScope("games", List.of("system"))), "system_server falsely covered by games");

        for (EnhancementOption option : EnhancementCatalog.options()) {
            String suggestion = HookAppCatalog.restartScopeForKey(option.key);
            if (suggestion == null) continue;
            String command = ScopeRestartPolicy.command(suggestion);
            for (String pkg : HookAppCatalog.affectedPackages(option.key))
                check("reboot".equals(command) || command.contains(" " + pkg + ";")
                        || command.endsWith(" " + pkg) || command.contains(" " + pkg + " >/dev/null"),
                        "suggestion does not execute a reload of " + pkg + " for " + option.key);
        }
        for (String scope : List.of("settings", "amap", "systemui", "launcher", "apps", "games", "fan", "theme"))
            for (String pkg : ScopeRestartPolicy.packages(scope))
                check(HookTargetRegistry.contains(pkg), "restart restored a retired or undeclared target: " + pkg);
        check(ScopeRestartPolicy.command("apps").contains("am force-stop com.android.gallery3d;"), "gallery drag source not reloaded");
        check(ScopeRestartPolicy.command("apps").contains("am force-stop com.android.mtp;"), "standalone MTP not reloaded");
        check("killall com.zte.mifavor.launcher >/dev/null 2>&1 || true".equals(ScopeRestartPolicy.command("launcher")), "launcher restart contract changed");
        check("killall cn.nubia.fan >/dev/null 2>&1 || true; killall com.android.systemui".equals(ScopeRestartPolicy.command("fan")), "fan/tile restart contract changed");
        System.out.println("PASS TestScopeRestartPolicy: " + checks + " checks");
    }
    private static void page(String route, String expected) {
        ModuleHierarchy.Section section = ModuleHierarchy.group(route);
        check(section != null && expected.equals(ModuleHierarchy.restartScope(section)), "wrong page restart: " + route);
    }
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
}
