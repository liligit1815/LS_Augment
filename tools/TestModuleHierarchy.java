package ls.augment.com;
import java.util.*;

/** Navigation, scope and coverage properties independent of Android and user settings. */
public final class TestModuleHierarchy {
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static Set<String> keys(ModuleHierarchy.Section section){Set<String> result=new LinkedHashSet<>();for(NativeFeatureGroups.Feature f:section.features)result.addAll(f.allKeys());return result;}
    private static void owner(String key,String route){require(route.equals(ModuleHierarchy.featureRoute(key)),key+" has its approved unique home");}
    public static void main(String[] args){
        String[] ids={"notifications","desktop","lockscreen","audio","interaction","multitasking","atomic_workbench","capture","gaming","cooling","connectivity","apps","system_settings","health"};
        int[] counts={84,17,24,11,8,5,1,5,18,4,16,15,13,4};
        List<String> actualIds=new ArrayList<>();int total=0,index=0;
        Set<String> covered=new LinkedHashSet<>(),routes=new LinkedHashSet<>(),groupRoutes=new HashSet<>(),entries=new HashSet<>(),deviceKeys=new HashSet<>();
        require(HookAppCatalog.targets().size()==20&&HookAppCatalog.find(HookAppCatalog.AMAP)!=null,"Runtime targets include the navigation source independently of the 14 display categories");
        for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories()){
            actualIds.add(category.id);require(counts[index++]==category.featureCount,"Approved capability count for "+category.id);total+=category.featureCount;
            require(!ModuleHierarchy.sections(category.id).isEmpty(),"Every display category has content");
            require(HookAppCatalog.find(category.icon)!=null,"Category icon reuses an existing source application");routes.add(category.route());
        }
        require(actualIds.equals(Arrays.asList(ids))&&total==225,"Presentation includes 225 capabilities in 14 ordered categories");
        require("atomic_workbench".equals(ModuleHierarchy.resolve("target-atomic_workbench")),"Workbench Home entry opens its editor directly");
        require("atomic_workbench".equals(ModuleHierarchy.resolve("target-amap")),"Navigation source opens the existing Step editor");
        require(ModuleHierarchy.path("atomic_workbench").equals(Arrays.asList("home","atomic_workbench")),"Workbench is a first-level category without an empty intermediate page");
        require(ModuleHierarchy.path("atomic_workbench_session").equals(Arrays.asList("home","atomic_workbench","atomic_workbench_session")),"Running workspace retains its settings parent");
        require("atomic_workbench".equals(ModuleHierarchy.categoryForRoute("atomic_workbench")),"Workbench search has the same first-level owner");
        require("atomic_workbench".equals(ModuleHierarchy.categoryForRoute("atomic_workbench_session")),"Running workspace remains in the first-level workbench category");
        require(ModuleHierarchy.path("competitive_key").equals(Arrays.asList("home","target-system_settings","competitive_key")),"Competitive key goes directly to the third-level page");
        owner("ls_augment_competitive_key_enabled","competitive_key");
        owner("ls_augment_rm_battery_preset","status_battery");
        require(ModulePresentationCatalog.find("statusbar")==null&&ModulePresentationCatalog.find("themes")==null,"Empty old categories are absent from Home");
        require("主题与锁屏".equals(ModulePresentationCatalog.find("lockscreen").title),"Theme and lock screen use the requested shared title");
        require("systemui".equals(ModulePresentationCatalog.find("notifications").restartScope),"Merged notification directory retains the former status-bar restart shortcut and default");
        require("device".equals(ModulePresentationCatalog.find("lockscreen").restartScope),"Merged theme/lock-screen directory retains the former theme restart shortcut and default");
        require("systemui".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/notifications/statusbar")))&&"systemui".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/notifications/island"))),"Moved status-bar and island pages preserve their actual process restart scope");
        require("device".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/lockscreen/theme_download")))&&"device".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/lockscreen/collab_theme"))),"Moved theme pages preserve their device restart scope");
        require("device".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/notifications/notification_alerts"))),"Directory shortcut never overrides a notification page's distinct actual scope");
        require("systemui".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/lockscreen/lock_clock"))),"Theme directory shortcut never overrides a lock-clock page's SystemUI scope");
        require(ModuleHierarchy.sections("notifications").stream().map(s->s.id).toList().subList(0,2).equals(Arrays.asList("statusbar","island")),"Status customization and island enter the notification/control-center directory");
        require(ModuleHierarchy.sections("lockscreen").stream().map(s->s.id).toList().subList(0,2).equals(Arrays.asList("theme_download","collab_theme")),"Theme download and collaboration enter the theme/lock-screen directory");
        List<String> lockscreenIds=ModuleHierarchy.sections("lockscreen").stream().map(s->s.id).toList();
        require(lockscreenIds.indexOf("liftarc")==lockscreenIds.indexOf("lock_display")+1
                &&lockscreenIds.indexOf("lock_clock")==lockscreenIds.indexOf("liftarc")+1,"Lock swipe stays between display and clock");
        ModuleHierarchy.Section liftarc=ModuleHierarchy.group("group/lockscreen/liftarc");
        require(keys(liftarc).size()==39&&"systemui".equals(ModuleHierarchy.restartScope(liftarc)),"39 lock-swipe controls have one SystemUI home");
        require(ModuleHierarchy.path(liftarc.route()).equals(Arrays.asList("home","target-lockscreen",liftarc.route())),"Lock swipe retains the requested breadcrumb");
        require(ModuleHierarchy.activeCount(liftarc,key->ConfigSchema.defaultValue(key))==0,"Default child settings cannot activate the disabled master");
        for(ModuleHierarchy.Section s:ModuleHierarchy.allSections()){
            require(groupRoutes.add(s.route()),"No duplicate group route: "+s.route());routes.add(s.route());require(!s.title.isEmpty(),"Readable group title");
            require(ModulePresentationCatalog.find(s.target)!=null,"A section belongs to a display category");
            for(NativeFeatureGroups.Feature f:s.features)for(String key:f.allKeys()){require(covered.add(key),"No duplicated feature key: "+key);owner(key,s.route());}
            for(String key:s.deviceSettings)require(deviceKeys.add(key),"A direct system action has one home");
            for(String entry:s.entries){require(entries.add(entry),"An editor/child group has one home: "+entry);routes.add(entry);}
            if(s.parentId!=null)require(!ModuleHierarchy.sections(s.target).contains(s),"Nested USB subpage is not repeated at category root");
        }
        for(NativeFeatureGroups.Feature f:ModuleHierarchy.statusBarFeatures())for(String key:f.allKeys()){require(covered.add(key),"Status controls have one home: "+key);require(ModuleHierarchy.featureRoute(key)!=null,"Status key has a direct search route");}
        // This editor owns real catalog controls outside the generic section feature list.
        for(EnhancementOption option:CompetitiveKeyOptions.options()){
            require(covered.add(option.key),"Competitive-key editor keys have one owner: "+option.key);
            owner(option.key,"competitive_key");
        }
        Set<String> expected=new LinkedHashSet<>();for(HookAppCatalog.Target target:HookAppCatalog.targets())for(HookAppCatalog.Section s:HookAppCatalog.sections(target.id))for(EnhancementOption o:s.options)expected.add(o.key);
        Set<String> missing=new LinkedHashSet<>(expected);missing.removeAll(covered);Set<String> extra=new LinkedHashSet<>(covered);extra.removeAll(expected);
        require(missing.isEmpty()&&extra.isEmpty(),"Every existing catalog key remains reachable; missing="+missing+" extra="+extra);
        require(deviceKeys.equals(new HashSet<>(Arrays.asList("development_settings_enabled","adb_enabled","adb_install_enabled","lock_refresh_rate"))),"All four actual Android settings actions remain exactly once");
        routes.addAll(Arrays.asList(StatusBarPages.ROUTES));routes.addAll(Arrays.asList("status_layout","status_canvas","status_surfaces","asset/bluetooth","hide","hide_apps","automation","tile","tile_icon_crop","icon_crop","gesture_icon_crop","rapid_compatibility","scope","support","contributors"));
        routes.add("atomic_workbench_session");
        for(String surface:StatusBarSurfaceSpec.SURFACES)routes.add("status_surface/"+surface);
        for(HookAppCatalog.Target target:HookAppCatalog.targets()){routes.add("target-"+target.id);for(NativeFeatureGroups.Section s:NativeFeatureGroups.forTarget(target.id))routes.add("group/"+target.id+"/"+s.id);}
        routes.addAll(Arrays.asList("group/systemui/primary_interaction","group/systemui/quicksettings_more","group/systemui/status_resources","group/update/update-link","group/theme/collab_audio","beautify","launcher_custom","audio_gain","signature_install","shoulder","combo_speed","super_resolution","diablo_coexist","freeform","rm:game"));
        Map<String,String> merged=new LinkedHashMap<>();
        merged.put("target-statusbar","target-notifications");merged.put("group/statusbar/statusbar","status_layout");merged.put("group/statusbar/island","group/notifications/island");
        merged.put("target-themes","target-lockscreen");merged.put("group/themes/theme_download","group/lockscreen/theme_download");merged.put("group/themes/collab_theme","group/lockscreen/collab_theme");
        for(Map.Entry<String,String> e:merged.entrySet()){require(e.getValue().equals(ModuleHierarchy.resolve(e.getKey())),"A merged bookmark reaches its current home: "+e.getKey());routes.add(e.getKey());}
        for(String route:routes){
            String destination=ModuleHierarchy.resolve(route);require(destination.equals(ModuleHierarchy.resolve(destination)),"Resolution is idempotent: "+route);
            List<String> path=ModuleHierarchy.path(route);require(path.size()<9&&new HashSet<>(path).size()==path.size(),"No navigation cycle: "+route);
            require(Arrays.asList("home","settings","about").contains(path.get(0)),"Route returns to a main tab: "+route);
            require(destination.equals(path.get(path.size()-1)),"Path ends at the resolved destination: "+route);
            for(String item:path)require(ModuleHierarchy.singleChild(item)==null,"Skipped aliases do not reappear in breadcrumb: "+item);
            require(!ModuleHierarchy.title(destination).isEmpty(),"Resolved routes have readable titles: "+route+" -> "+destination);
        }
        owner("ls_augment_rm_statusbar_double_tap_sleep","group/interaction/status_gestures");
        owner("ls_augment_rm_screenshot_hide_status_bar","group/capture/capture");owner("ls_augment_rm_record_hide_status_bar","group/capture/capture");
        owner("ls_augment_rm_screenshot_crop_unlimited","group/capture/capture");owner("ls_augment_rm_gallery_crop_unlimited","group/capture/image_edit");
        owner("ls_augment_rm_keyguard_statusbar_hide","group/lockscreen/lock_display");owner("ls_augment_rm_secure_capture","group/capture/secure_capture");
        owner("ls_augment_rm_usb_auto_authorize","group/connectivity/usb_debug");owner("ls_augment_rm_mtp_hide_category","group/connectivity/usb_mtp");
        owner("ls_augment_rm_usb_mode_enabled","group/connectivity/usb_connection");owner("ls_augment_rm_notification_quiet_unlocked","group/notifications/notification_alerts");
        owner("ls_augment_rm_qs_volume_percent","group/audio/volume_panel");owner(BrightnessRange.ENABLED,"group/system_settings/display");
        owner("ls_augment_rm_third_party_launcher","group/desktop/default_launcher");owner("ls_augment_rm_third_party_recents_no_scrim","group/desktop/default_launcher");owner("ls_augment_rm_weather_time_period","group/desktop/desktop_clock");
        owner(LauncherOptions.WIDGET_RESIZE,"group/desktop/desktop_clock");owner(LauncherOptions.DOCK_UNLIMITED,"group/desktop/dock_glass");
        owner(LauncherOptions.NEW_APPS_LAST_PAGE,"group/desktop/launcher_grid");
        require(ModuleHierarchy.group("group/desktop/launcher_grid").features.stream().noneMatch(f->f.allKeys().contains(LauncherOptions.DOCK_UNLIMITED)),"Dock capacity no longer belongs to desktop layout and pages");
        require("桌面组件".equals(ModuleHierarchy.title("group/desktop/desktop_clock")),"Component page retains its bookmark with the requested title");
        owner(RecentsCardRadiusOptions.ENABLED,"group/desktop/recents");owner(RecentsCardRadiusOptions.OFFSET,"group/desktop/recents");
        require(ModuleHierarchy.activeCount(ModuleHierarchy.group("group/desktop/recents"),key->RecentsCardRadiusOptions.OFFSET.equals(key)?"-24":"0")==0,"Stored radius parameters remain inactive while the switch is off");
        require(ModuleHierarchy.activeCount(ModuleHierarchy.group("group/desktop/recents"),key->RecentsCardRadiusOptions.ENABLED.equals(key)?"1":"0")==1,"Recent-task radius is one separately counted feature");
        require(ModuleHierarchy.path("group/connectivity/usb_mtp").equals(Arrays.asList("home","target-connectivity","group/connectivity/usb","group/connectivity/usb_mtp")),"MTP lives under the shared USB directory");
        require(new HashSet<>(ModuleHierarchy.restartScopes(ModuleHierarchy.group("group/connectivity/usb_debug"))).equals(new HashSet<>(Arrays.asList("systemui","settings"))),"USB debug retains both actual affected processes");
        require("device".equals(ModuleHierarchy.restartScope(ModuleHierarchy.group("group/connectivity/usb_debug"))),"Mixed USB scope never advertises an app-only restart");
        require(ModuleHierarchy.group("group/connectivity/usb_debug").deviceSettings.equals(Arrays.asList("adb_enabled","adb_install_enabled")),"USB actions moved together");
        require(ModuleHierarchy.group("group/system_settings/developer").deviceSettings.equals(Collections.singletonList("development_settings_enabled")),"Developer master remains under system settings");
        require(ModuleHierarchy.group("group/system_settings/display").deviceSettings.equals(Collections.singletonList("lock_refresh_rate")),"Refresh rate belongs to display");
        require(ModuleHierarchy.path("ai_trigger").equals(Arrays.asList("home","target-gaming","ai_trigger")),"AI trigger lives in game space");
        require("target-gaming".equals(ModuleHierarchy.resolve("target-game")),"Old game route reaches renamed game space");
        require(ModuleHierarchy.path("hide_apps").equals(Arrays.asList("home","target-apps","hide","hide_apps")),"Application hiding now lives inside app management");
        for(String restricted:Arrays.asList("group/apps/hidden","hide","hide_apps","automation","tile","tile_icon_crop"))require(ModuleHierarchy.isRestricted(restricted),"Hidden session cannot be bypassed by "+restricted);
        for(String publicRoute:Arrays.asList("target-apps","group/apps/installer","icon_crop","gesture_icon_crop","asset/bluetooth"))require(!ModuleHierarchy.isRestricted(publicRoute),"Unrelated features remain public");
        require(ModuleHierarchy.path("freeform_rules").equals(Arrays.asList("home","target-multitasking","freeform_rules")),"Cross-app rules preserve one direct editor");
        require(ModuleHierarchy.path("freeform_limits").equals(Arrays.asList("home","target-multitasking","freeform_limits")),"Window limits preserve one direct editor");
        Map<String,String> embedded=new LinkedHashMap<>();embedded.put("launcher_custom","group/desktop/launcher");embedded.put("audio_gain","group/audio/audio_gain");embedded.put("signature_install","group/apps/installer");embedded.put("extra_dim","group/notifications/brightness_tiles");embedded.put("shoulder","group/gaming/shoulder");embedded.put("combo_speed","group/gaming/combo");embedded.put("super_resolution","group/gaming/performance");
        for(Map.Entry<String,String> e:embedded.entrySet()){require(e.getValue().equals(ModuleHierarchy.resolve(e.getKey())),"Old editor is embedded at its new unique home: "+e.getKey());require(ModuleHierarchy.hasInlineEditors(ModuleHierarchy.group(e.getValue())),"Host preserves editor lifecycle: "+e.getKey());}
        require(ModuleHierarchy.path("rapid_compatibility").equals(Arrays.asList("home","target-gaming","group/gaming/shoulder","rapid_compatibility")),"Compatibility test still returns to shoulder settings");
        require("status_arrangement".equals(ModuleHierarchy.resolve("status_canvas")),"Retired canvas links reach arrangement");
        require("status_assets".equals(ModuleHierarchy.resolve("group/systemui/status_resources")),"Old asset bookmark survives");
        for(String page:StatusBarPages.ROUTES)require("status_layout".equals(ModuleHierarchy.parent(page)),"Component editor remains under status editor: "+page);
        require("target-notifications".equals(ModuleHierarchy.parent("status_layout")),"Status editor returns to notification/control-center category");
        require(ModuleHierarchy.path("group/notifications/island").equals(Arrays.asList("home","target-notifications","group/notifications/island")),"Island has the merged breadcrumb");
        require(ModuleHierarchy.path("group/themes/theme_download").equals(Arrays.asList("home","target-lockscreen","group/lockscreen/theme_download")),"Theme bookmark has the merged breadcrumb");
        owner("ls_augment_rm_island_enabled","group/notifications/island");owner("ls_augment_beautify_unlimited_trial","group/lockscreen/theme_download");owner(CollabOptions.THEME,"group/lockscreen/collab_theme");
        for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories())for(ModulePresentationCatalog.Related link:ModulePresentationCatalog.related(category.route())){
            require(!ModuleHierarchy.title(ModuleHierarchy.resolve(link.route)).isEmpty(),"Related link reaches a real destination");
            require(!category.id.equals(ModuleHierarchy.categoryForRoute(link.route)),"Related navigation must point to a different home");
        }
        require(ModulePresentationCatalog.related("status_layout").size()==3,"Status ambiguity has three cross-category explanations");
        require(ModuleHierarchy.activeCount(ModuleHierarchy.group("group/gaming/shoulder"),key->"1")==4,"Shoulder count includes two embedded controls, quick switching and its position lock");
        owner(NativeIslandSceneOptions.ENABLED,"group/notifications/island");
        for(String id:NativeIslandSceneOptions.IDS)owner(NativeIslandSceneOptions.key(id),"group/notifications/island");
        owner(GameOptions.MONITOR_PIN,"group/gaming/plugins");owner(GameOptions.SHOULDER_PIN,"group/gaming/shoulder");
        require(ModuleHierarchy.activeCount(ModuleHierarchy.group("group/gaming/performance"),key->"1")==6,"Performance count includes the embedded super-resolution controls");
        require(ModuleHierarchy.activeCount(ModuleHierarchy.group("group/audio/audio_gain"),key->ConfigSchema.AUDIO_GAIN_ENABLED.equals(key)?"1":"0")==1,"Audio gain count remains truthful");
        System.out.println("V2.0 presentation hierarchy: OK (14 categories, 225 capabilities, "+covered.size()+" generic keys, "+routes.size()+" route cases)");
    }
}
