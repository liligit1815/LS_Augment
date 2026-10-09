package ls.augment.com;
import android.app.Activity;
import android.os.Bundle;

/** Compatibility entry for saved links to the former standalone editor. */
public final class LauncherCustomizationActivity extends Activity {
    @Override protected void onCreate(Bundle state){super.onCreate(state);ModuleNavigation.open(this,"launcher_custom");finish();}
}
