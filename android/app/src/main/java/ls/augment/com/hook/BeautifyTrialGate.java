package ls.augment.com.hook;

import android.content.Context;

/** The current theme page owns this feature; the retired app-group gate is unrelated. */
final class BeautifyTrialGate {
    static boolean enabled(Context context) {
        boolean enabled=FeatureSettings.enabled(context,FeatureSettings.BEAUTIFY_UNLIMITED_TRIAL);
        FeatureSettings.diagnostic(context,"ls_augment_beautify_runtime",
                "enabled="+enabled+";config_verified="+FeatureSettings.hasVerifiedSnapshot(context)
                        +";legacy_app_master="+FeatureSettings.enabled(context,FeatureSettings.APP_MASTER));
        return enabled;
    }
    private BeautifyTrialGate() { }
}
