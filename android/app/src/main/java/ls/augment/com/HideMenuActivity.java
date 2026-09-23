package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public final class HideMenuActivity extends Activity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        // Keep old explicit intents working without an extra navigation level.
        startActivity(new Intent(this, HideAppsActivity.class));
        finish();
    }
    @Override protected void onResume() {
        super.onResume();
        if (!HiddenEntrySession.isUnlocked()) finish();
    }
}
