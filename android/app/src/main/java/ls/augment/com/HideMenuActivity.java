package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public final class HideMenuActivity extends Activity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        UiKit ui=new UiKit(this);
        android.widget.LinearLayout body=ui.detailPage("消失吧APP",ScopeRestartDialog.SETTINGS),card=ui.preferenceCard();
        String[] routes={"hide_apps","automation","tile"};
        for(String route:routes){
            if(card.getChildCount()>0)card.addView(ui.divider(),new android.widget.LinearLayout.LayoutParams(-1,ui.dp(1)));
            card.addView(ui.preferenceRow(route,ModuleHierarchy.title(route),null,()->ModuleNavigation.open(this,route)),ui.wrap());
        }
        body.addView(card,ui.wrap());
    }
    @Override protected void onResume() {
        super.onResume();
        if (!HiddenEntrySession.isUnlocked()) finish();
    }
}
