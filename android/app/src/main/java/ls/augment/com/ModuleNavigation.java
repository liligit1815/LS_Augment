package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import java.util.List;

/** One route resolver shared by app search, app pages and module settings. */
final class ModuleNavigation {
    private ModuleNavigation() { }

    static void openTarget(Activity owner, String id, String query) {
        owner.startActivity(new Intent(owner, EnhancementSettingsActivity.class)
                .putExtra("target", id).putExtra("query", query));
    }

    static void open(Activity owner, String route) {
        if (("hide".equals(route)||"automation".equals(route)||"tile".equals(route))
                && !HiddenEntrySession.isUnlocked()) return;
        if (route.startsWith("rm:")) {
            EnhancementSettingsActivity.open(owner, route.substring(3));
            return;
        }
        Class<? extends Activity> destination;
        switch (route) {
            case "launcher_custom": destination = LauncherCustomizationActivity.class; break;
            case "launcher_compatibility": destination = LauncherCompatibilityActivity.class; break;
            case "mi_health": destination = HealthSettingsActivity.class; break;
            case "config_transfer": destination = ConfigTransferActivity.class; break;
            case "scope": destination = ModuleScopeActivity.class; break;
            case "compatibility_help": destination = ModuleHelpActivity.class; break;
            case "hide":
                if (!HiddenEntrySession.isUnlocked()) return;
                destination = HideAppsActivity.class; break;
            default:
                owner.startActivity(new Intent(owner, FeatureActivity.class)
                        .putExtra(FeatureActivity.EXTRA_MODULE, route));
                return;
        }
        owner.startActivity(new Intent(owner, destination));
    }
}
