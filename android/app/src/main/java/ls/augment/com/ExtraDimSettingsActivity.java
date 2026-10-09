package ls.augment.com;

import android.app.Activity;
import android.os.Bundle;

/** Compatibility entry; the QS tile long press still opens its compact system dialog. */
public final class ExtraDimSettingsActivity extends Activity {
    @Override public void onCreate(Bundle state){
        super.onCreate(state);ModuleNavigation.open(this,"extra_dim");finish();
    }
}
