package ls.augment.com;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

/** Fixed restart actions: their coverage and shell commands share the same package list. */
public final class ScopeRestartPolicy {
    private ScopeRestartPolicy() { }

    public static List<String> packages(String scope) {
        if (scope == null) return Collections.emptyList();
        switch (scope) {
            case "settings": return List.of("com.android.settings");
            case "amap": return List.of("com.autonavi.minimap");
            case "systemui": return List.of("com.android.systemui");
            case "launcher": return List.of("com.zte.mifavor.launcher");
            case "fan": return List.of("cn.nubia.fan", "com.android.systemui");
            case "theme": return List.of("com.zte.beautify", "com.zte.beautifyadapter");
            case "apps": return List.of(
                    "cn.nubia.neostore", "com.mi.health", "com.zte.cn.doubleapp", "com.zte.beautify",
                    "com.zte.beautifyadapter", "com.android.packageinstaller", "com.zte.zdm",
                    "com.zte.mifavor.weather", "com.android.permissioncontroller", "cn.nubia.filebrowser",
                    "com.android.mtp", "com.android.ztescreenshot", "cn.nubia.photoeditor",
                    "com.android.gallery3d", "com.zte.mifavor.launcher");
            case "games": return List.of(
                    "cn.nubia.gamelauncher", "cn.nubia.gameassist", "cn.nubia.gamelab",
                    "cn.nubia.gamehelpmodule", "cn.nubia.gamehelperline", "com.zte.game.plugintrigger",
                    "cn.zte.gamefloat", "cn.nubia.gamehighlights", "cn.nubia.fan");
            default: return Collections.emptyList();
        }
    }

    public static boolean covers(String scope, Collection<String> requiredPackages) {
        return "device".equals(scope) || "all".equals(scope)
                || scope != null && !packages(scope).isEmpty() && packages(scope).containsAll(requiredPackages);
    }

    /** Keep the existing explicit choice, or suggest the existing device restart option. */
    public static String completeScope(String preferred, Collection<String> requiredPackages) {
        if (preferred == null && requiredPackages.isEmpty()) return null;
        return covers(preferred, requiredPackages) ? preferred : "device";
    }

    public static String command(String scope) {
        List<String> targets = packages(scope);
        // Preserve the dialog's device/all and unknown-choice fallback.
        if (targets.isEmpty()) return "reboot";
        List<String> commands = new ArrayList<>();
        for (String target : targets) {
            if ("com.android.systemui".equals(target)) commands.add("killall " + target);
            else if (Arrays.asList("com.zte.mifavor.launcher", "cn.nubia.fan").contains(target))
                commands.add("killall " + target + " >/dev/null 2>&1 || true");
            else commands.add("am force-stop " + target);
        }
        return String.join("; ", commands);
    }
}
