package ls.augment.com.hook;

import android.content.Context;
import ls.augment.com.IslandSceneRegistry;
import ls.augment.com.SystemUiOptions;

/** A selection is intent only; each adapter must still verify its own runtime capabilities. */
final class IslandSceneSelection {
    static boolean enabled(Context context,String scene) {
        return IslandSceneRegistry.known(scene) && FeatureSettings.enabled(context,SystemUiOptions.ISLAND)
                && FeatureSettings.enabled(context,IslandSceneRegistry.key(scene));
    }
    private IslandSceneSelection() { }
}
