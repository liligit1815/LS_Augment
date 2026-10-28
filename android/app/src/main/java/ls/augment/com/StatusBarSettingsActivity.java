package ls.augment.com;
/** Full-screen editor with the same native feature controls and lifecycle as
 * the application settings, without a nested scrolling page. */
public final class StatusBarSettingsActivity extends EnhancementSettingsActivity {
    @Override public void onCreate(android.os.Bundle state){
        String route=getIntent().getStringExtra(ModuleNavigation.EXTRA_ROUTE);
        if(route==null||"status_layout".equals(route))route="status_legacy";
        if(route!=null)getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE,ModuleHierarchy.resolve(route));
        super.onCreate(state);
    }
}
