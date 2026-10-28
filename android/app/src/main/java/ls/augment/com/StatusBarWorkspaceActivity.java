package ls.augment.com;

/** Four groups share one native editor and one persisted configuration. */
public final class StatusBarWorkspaceActivity extends EnhancementSettingsActivity implements ModuleNavigation.AncestorHandler {
    @Override public void navigateToAncestor(String route){statusWorkspaceAncestor(route);}
}
