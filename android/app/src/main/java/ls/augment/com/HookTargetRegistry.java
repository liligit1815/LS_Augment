package ls.augment.com;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

/** Package scope shared by the Provider policy and scope-list regression test. */
public final class HookTargetRegistry {
    private static final Set<String> PACKAGES = Collections.unmodifiableSet(
            new LinkedHashSet<>(Arrays.asList(
                    "com.android.settings",
                    "com.android.systemui",
                    "com.zte.beautify",
                    "com.zte.beautifyadapter",
                    "com.zte.cn.doubleapp",
                    "com.zte.recommend",
                    "cn.nubia.gamelauncher",
                    "cn.nubia.gameassist",
                    "cn.nubia.gamelab",
                    "cn.nubia.fan",
                    "com.mi.health",
                    "cn.nubia.neostore",
                    "com.zte.mifavor.launcher",
                    "cn.nubia.gamehelperline",
                    "cn.nubia.gamehelpmodule",
                    "com.zte.game.plugintrigger",
                    "com.android.packageinstaller",
                    "com.zte.zdm",
                    "com.zte.mifavor.weather",
                    "cn.zte.gamefloat",
                    "cn.nubia.gamehighlights",
                    "com.android.permissioncontroller",
                    "com.android.nfc",
                    "cn.nubia.filebrowser",
                    "com.android.ztescreenshot",
                    "system")));

    private HookTargetRegistry() { }

    public static Set<String> packages() {
        return PACKAGES;
    }

    public static boolean contains(String packageName) {
        return PACKAGES.contains(packageName);
    }
}
