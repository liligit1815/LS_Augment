package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import java.lang.ref.WeakReference;
import java.util.*;

/** One route resolver shared by app search, app pages and module settings. */
final class ModuleNavigation {
    static final String EXTRA_ROUTE="module_route";
    interface AncestorHandler { void navigateToAncestor(String route); }
    private static final List<WeakReference<Activity>> STACK=new ArrayList<>();
    private ModuleNavigation() { }

    static void register(Activity owner){
        for(Iterator<WeakReference<Activity>> it=STACK.iterator();it.hasNext();){Activity a=it.next().get();if(a==null||a.isDestroyed()||a==owner)it.remove();}
        STACK.add(new WeakReference<>(owner));
    }
    static String route(Activity owner){
        Intent intent=owner.getIntent();String route=intent.getStringExtra(EXTRA_ROUTE);
        if(route!=null)return route;
        if(owner instanceof StatusBarWorkspaceActivity)return "status_layout";
        if(owner instanceof StatusBarSettingsActivity)return "status_legacy";
        if(owner instanceof CompetitiveKeySettingsActivity)return "competitive_key";
        if(owner instanceof AtomicWorkbenchSettingsActivity)return "atomic_workbench";
        if(owner instanceof AtomicWorkbenchActivity)return "atomic_workbench_session";
        if(owner instanceof StatusBarAssetsActivity)return "status_assets";
        if(owner instanceof EnhancementSettingsActivity){
            String target=intent.getStringExtra("target");
            if(target!=null)return ModuleHierarchy.resolve("target-"+("collab".equals(target)?"theme":target));
            String group=intent.getStringExtra("group");
            if("game".equals(group))return ModuleHierarchy.resolve("target-game");
            if(group!=null){
                String legacy=ModuleHierarchy.resolve("rm:"+group);
                if(!legacy.equals("rm:"+group))return legacy;
                for(ModuleHierarchy.Section s:ModuleHierarchy.allSections())if(s.id.equals(group))return ModuleHierarchy.resolve(s.route());
            }
        }
        if(owner instanceof FeatureActivity)return intent.getStringExtra(FeatureActivity.EXTRA_MODULE);
        if(owner instanceof LauncherCustomizationActivity)return "launcher_custom";
        if(owner instanceof LauncherCompatibilityActivity)return "launcher_compatibility";
        if(owner instanceof IconCropActivity)return intent.getBooleanExtra("gesture_icon",false)?"gesture_icon_crop":intent.getBooleanExtra("tile_icon",false)?"tile_icon_crop":"icon_crop";
        if(owner instanceof HealthSettingsActivity)return "mi_health";
        if(owner instanceof HideMenuActivity)return "hide";
        if(owner instanceof HideAppsActivity)return "hide_apps";
        if(owner instanceof ExtraDimActivity)return "extra_dim";
        if(owner instanceof TileSetupActivity)return "tile";
        if(owner instanceof ModuleScopeActivity)return "scope";
        if(owner instanceof LogExportActivity)return "log_export";
        if(owner instanceof SupportActivity)return "support";
        if(owner instanceof ContributorsActivity)return "contributors";
        if(owner instanceof ConfigTransferActivity)return "config_transfer";
        return "home";
    }

    static void openTarget(Activity owner, String id, String query) {
        open(owner,"target-"+id);
    }

    static void open(Activity owner, String requested) {
        if(requested==null||requested.isEmpty())return;
        String route=ModuleHierarchy.resolve(requested);
        if (ModuleHierarchy.isRestricted(route)&&!HiddenEntrySession.isUnlocked()) return;
        if (route.startsWith("rm:")) {
            String group=route.substring(3);
            for(ModuleHierarchy.Section s:ModuleHierarchy.allSections())if(s.id.equals(group)){open(owner,s.route());return;}
            EnhancementSettingsActivity.open(owner, group);
            return;
        }
        Class<? extends Activity> destination;
        ModuleHierarchy.Section section=ModuleHierarchy.group(route);
        if(route.startsWith("target-")||section!=null){
            owner.startActivity(new Intent(owner,EnhancementSettingsActivity.class).putExtra(EXTRA_ROUTE,route)
                .putExtra("target",section==null?route.substring(7):section.target));return;
        }
        if("status_layout".equals(route)){
            owner.startActivity(new Intent(owner,StatusBarWorkspaceActivity.class).putExtra(EXTRA_ROUTE,route));return;
        }
        if(StatusBarPages.editor(route)){
            owner.startActivity(new Intent(owner,StatusBarSettingsActivity.class).putExtra(EXTRA_ROUTE,route));return;
        }
        if(route.startsWith("asset/")){
            owner.startActivity(new Intent(owner,StatusBarAssetsActivity.class).putExtra(EXTRA_ROUTE,route));return;
        }
        switch (route) {
            case "atomic_workbench":destination=AtomicWorkbenchSettingsActivity.class;break;
            case "atomic_workbench_apps":case "atomic_workbench_app_sort":destination=AtomicWorkbenchAppsActivity.class;break;
            case "competitive_key":destination=CompetitiveKeySettingsActivity.class;break;
            case "home":case "settings":case "about":
                owner.startActivity(new Intent(owner,SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP).putExtra("tab",route));return;
            case "status_layout":destination=StatusBarSettingsActivity.class;break;
            case "status_assets":destination=StatusBarAssetsActivity.class;break;
            case "extra_dim":destination=ExtraDimSettingsActivity.class;break;
            case "support":destination=SupportActivity.class;break;
            case "contributors":destination=ContributorsActivity.class;break;
            case "licenses":destination=ModuleLicensesActivity.class;break;
            case "launcher_custom": destination = LauncherCustomizationActivity.class; break;
            case "launcher_compatibility": destination = LauncherCompatibilityActivity.class; break;
            case "mi_health": destination = HealthSettingsActivity.class; break;
            case "config_transfer":
                owner.startActivity(new Intent(owner,SettingsActivity.class)
                        .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP).putExtra("tab","settings"));
                return;
            case "scope": destination = ModuleScopeActivity.class; break;
            case "log_export": destination = LogExportActivity.class; break;
            case "diagnostics": case "detailed_diagnostics": case "compatibility_help": return;
            case "hide":
                if (!HiddenEntrySession.isUnlocked()) return;
                destination = HideMenuActivity.class; break;
            case "hide_apps":
                destination = HideAppsActivity.class; break;
            default:
                owner.startActivity(new Intent(owner, FeatureActivity.class)
                        .putExtra(EXTRA_ROUTE,route).putExtra(FeatureActivity.EXTRA_MODULE, route));
                return;
        }
        owner.startActivity(new Intent(owner, destination).putExtra(EXTRA_ROUTE,route));
    }

    static void ancestor(Activity owner,String route){
        if(owner instanceof AncestorHandler)((AncestorHandler)owner).navigateToAncestor(route);
        else returnTo(owner,route);
    }
    static Activity findAncestor(Activity owner,String route){
        for(int i=STACK.size()-1;i>=0;i--){Activity a=STACK.get(i).get();if(a!=null&&a!=owner&&!a.isFinishing()&&!a.isDestroyed()&&a.getTaskId()==owner.getTaskId()&&route.equals(route(a)))return a;}
        return null;
    }
    static void returnTo(Activity owner,String requested){
        String route=ModuleHierarchy.resolve(requested);
        if(Arrays.asList("home","settings","about").contains(route)){open(owner,route);return;}
        // The same activity class represents several levels; match the actual route.
        for(int i=STACK.size()-1;i>=0;i--){
            Activity a=STACK.get(i).get();
            if(a!=null&&a!=owner&&!a.isFinishing()&&!a.isDestroyed()&&a.getTaskId()==owner.getTaskId()&&route.equals(route(a))){
                for(int j=STACK.size()-1;j>i;j--){Activity child=STACK.get(j).get();if(child!=null&&child.getTaskId()==owner.getTaskId())child.finish();}
                owner.finish();return;
            }
        }
        open(owner,route);owner.finish();
    }
}
