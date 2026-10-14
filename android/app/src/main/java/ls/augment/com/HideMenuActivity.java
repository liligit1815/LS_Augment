package ls.augment.com;

import android.os.Bundle;

/** The third-level entry shares the real application manager and its saved settings. */
public final class HideMenuActivity extends HideAppsActivity {
    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        if(!HiddenEntrySession.isUnlocked())return;
    }
    @Override protected void onResume(){
        super.onResume();
        if(!HiddenEntrySession.isUnlocked())finish();
    }
}
