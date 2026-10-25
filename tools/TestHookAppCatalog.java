package ls.augment.com;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Checks migration coverage and the cross-application splits that old groups obscured. */
public final class TestHookAppCatalog {
    public static void main(String[] args) {
        Set<String> allKeys = new LinkedHashSet<>();
        for (EnhancementOption option : EnhancementCatalog.options()) {
            if (option.kind == EnhancementOption.Kind.INTERNAL) {
                check(HookAppCatalog.targetForKey(option.key) == null, "internal control exposed: " + option.key);
            } else {
                check(allKeys.add(option.key), "duplicate source key: " + option.key);
                check(HookAppCatalog.find(HookAppCatalog.targetForKey(option.key)) != null,
                        "unmapped visible control: " + option.key);
            }
        }
        Set<String> visibleKeys = new LinkedHashSet<>();
        Set<String> coveredPackages = new LinkedHashSet<>();
        Set<String> targetIds = new HashSet<>();
        Set<String> editorRoutes = new HashSet<>();
        List<HookAppCatalog.Target> targets = new ArrayList<>(HookAppCatalog.targets());
        check(targets.stream().noneMatch(t -> HookAppCatalog.MODULE.equals(t.id)), "module preferences leaked onto home");
        check(targets.size()==20,"runtime inventory includes the dedicated photo editor and Amap navigation");
        check(HookAppCatalog.find(HookAppCatalog.AMAP).packages.equals(List.of("com.autonavi.minimap"))
                && HookAppCatalog.AMAP.equals(HookAppCatalog.targetForRoute("atomic_workbench")),
                "Amap navigation has its own scope and reuses the workbench editor");
        check(targets.stream().noneMatch(t->HookAppCatalog.COLLAB.equals(t.id)),"standalone collaboration remains");
        check(HookAppCatalog.find("collab")==HookAppCatalog.find("theme"),"old collaboration route must resolve to theme");
        for(EnhancementOption option:CollabOptions.options())if(option.kind!=EnhancementOption.Kind.INTERNAL)
            check(HookAppCatalog.THEME.equals(HookAppCatalog.targetForKey(option.key)),"collaboration option lost: "+option.key);
        targets.add(HookAppCatalog.find(HookAppCatalog.MODULE));
        int editorCount = 0;
        for (HookAppCatalog.Target target : targets) {
            check(targetIds.add(target.id), "duplicate application: " + target.id);
            if (!HookAppCatalog.MODULE.equals(target.id)) {
                check(!target.packages.isEmpty(), "missing target package: " + target.id);
                for (String pkg : target.packages) {
                    check(HookTargetRegistry.contains(pkg), "navigation points to unsupported scope: " + pkg);
                    coveredPackages.add(pkg);
                }
            }
            int count = 0;
            Set<String> sectionIds = new HashSet<>();
            for (HookAppCatalog.Section section : HookAppCatalog.sections(target.id)) {
                check(sectionIds.add(section.id), "duplicate section: " + target.id + "/" + section.id);
                check(!section.options.isEmpty(), "empty section: " + target.id + "/" + section.id);
                for (EnhancementOption option : section.options) {
                    count++;
                    check(visibleKeys.add(option.key), "control duplicated across application pages: " + option.key);
                    check(target.id.equals(HookAppCatalog.targetForKey(option.key)), "wrong page: " + option.key);
                    for (String pkg : HookAppCatalog.affectedPackages(option.key))
                        check(HookTargetRegistry.contains(pkg), "unknown affected package: " + pkg);
                }
            }
            check(count == HookAppCatalog.optionCount(target.id), "control count differs: " + target.id);
            List<HookAppCatalog.Entry> entries = HookAppCatalog.entries(target.id);
            for (HookAppCatalog.Entry entry : entries) {
                editorCount++;
                check(editorRoutes.add(entry.route), "editor duplicated: " + entry.route);
                check(target.id.equals(HookAppCatalog.targetForRoute(entry.route)), "editor owner differs: " + entry.route);
            }
            check(count > 0 || !entries.isEmpty(), "empty application page: " + target.id);
            System.out.println(target.id + "\t" + target.title + "\tcontrols=" + count + "\teditors=" + entries.size());
        }
        check(visibleKeys.equals(allKeys), "some existing controls were lost");
        check(coveredPackages.equals(HookTargetRegistry.packages()), "scoped application is absent from inventory");
        // GameExtrasHook.space() installs both watermark editor hooks in GameSpace.
        check(HookAppCatalog.affectedPackages(GameOptions.WATERMARK_UNLIMITED).equals(
                List.of("cn.nubia.gamelauncher")), "watermark scope must match the GameSpace editor consumer");
        check(HookAppCatalog.affectedPackages(GameOptions.PLUGINS).equals(
                List.of("system", "cn.nubia.gamelauncher", "cn.nubia.gameassist")),
                "expanded super resolution needs the system runtime and native UI scopes");
        check(!editorRoutes.contains("battery")&&HookAppCatalog.targetForRoute("battery")==null,"retired battery entry remains reachable");
        check(editorRoutes.containsAll(List.of("freeform", "audio_gain", "signature_install",
                "status_layout", "launcher_custom", "launcher_compatibility", "shoulder", "combo_speed",
                "super_resolution", "ai_trigger", "fan_control", "beautify", "double_app", "store_download",
                "mi_health", "launcher_icon", "config_transfer", "log_export")), "existing editor was lost");
        for (String concealed : List.of("hide", "hide_apps", "automation", "tile", "tile_setup")) {
            check(!editorRoutes.contains(concealed), "concealed editor bypasses the hidden-entry gate");
            check(HookAppCatalog.MODULE.equals(HookAppCatalog.targetForRoute(concealed)), "concealed route lost");
        }
        owner("clipboard_overlay", HookAppCatalog.SYSTEM_UI);
        owner("assist_gesture", HookAppCatalog.SYSTEM_UI);
        owner("onehand_offset", HookAppCatalog.SYSTEM_UI);
        owner("lock_volume", HookAppCatalog.SYSTEM_UI);
        owner("usb_auto_authorize", HookAppCatalog.SYSTEM_UI);
        owner("usb_install_no_account", HookAppCatalog.SETTINGS);
        owner("usb_mode", HookAppCatalog.SETTINGS);
        owner("settings_time_period", HookAppCatalog.SETTINGS);
        owner("audio_steps_media", HookAppCatalog.SYSTEM);
        owner("audio_no_safe_warning", HookAppCatalog.SYSTEM);
        owner("signature_min_v1", HookAppCatalog.SYSTEM);
        owner("installer_cts", HookAppCatalog.INSTALLER);
        owner("airplane_keep_wifi", HookAppCatalog.SYSTEM);
        owner("nfc_screen_off", HookAppCatalog.NFC);
        owner("mtp_name", HookAppCatalog.FILES);
        owner("third_party_launcher", HookAppCatalog.PERMISSIONS);
        owner("third_party_recents_no_scrim", HookAppCatalog.LAUNCHER);
        check(HookAppCatalog.affectedPackages("ls_augment_rm_third_party_launcher").equals(
                List.of("com.android.permissioncontroller")), "HOME candidates retain their original scope");
        check(HookAppCatalog.affectedPackages("ls_augment_rm_third_party_recents_no_scrim").equals(
                List.of("com.zte.mifavor.launcher")), "fallback overview belongs to the system launcher");
        owner("desktop_clock_pattern", HookAppCatalog.LAUNCHER);
        owner("launcher_grid_enabled", HookAppCatalog.LAUNCHER);
        owner("launcher_grid_rows", HookAppCatalog.LAUNCHER);
        owner("launcher_grid_columns", HookAppCatalog.LAUNCHER);
        check("launcher".equals(HookAppCatalog.find(HookAppCatalog.LAUNCHER).restartScope),
                "desktop changes must suggest restarting only the launcher");
        check("launcher_grid".equals(HookAppCatalog.sections(HookAppCatalog.LAUNCHER).get(0).id),
                "desktop layout must be the first launcher section");
        HookAppCatalog.Section dock=HookAppCatalog.sections(HookAppCatalog.LAUNCHER).stream().filter(s->s.id.equals("dock_glass")).findFirst().orElseThrow();
        check("Dock".equals(dock.title)&&dock.options.stream().anyMatch(o->o.key.equals(LauncherOptions.DOCK_UNLIMITED)),"Dock capacity remains grouped with the Dock runtime controls");
        owner("weather_time_period", HookAppCatalog.WEATHER);
        owner("screenshot_hide_status_bar", HookAppCatalog.SCREENSHOT);
        owner("record_hide_status_bar", HookAppCatalog.SCREENSHOT);
        owner("screenshot_crop_unlimited", HookAppCatalog.SCREENSHOT);
        owner("gallery_crop_unlimited", HookAppCatalog.GALLERY);
        check(HookAppCatalog.affectedPackages(SystemOptions.key("screenshot_crop_unlimited")).equals(
                List.of("com.android.ztescreenshot")), "screenshot crop stays in the screenshot application");
        check(HookAppCatalog.affectedPackages(SystemOptions.key("gallery_crop_unlimited")).equals(
                List.of("cn.nubia.photoeditor")), "gallery editing delegates to the dedicated photo editor");
        check(HookAppCatalog.SYSTEM_UI.equals(HookAppCatalog.targetForKey(SystemUiOptions.QS_BRIGHTNESS_PERCENT)), "brightness control misplaced");
        check(HookAppCatalog.MODULE.equals(HookAppCatalog.targetForKey(AppearanceOptions.THEME)), "module theme misplaced");
        check(HookAppCatalog.targetForRoute("rm:connections") == null, "mixed old group falsely claims one target");
        check(HookAppCatalog.targetForRoute("rm:system") == null, "mixed old group falsely claims one target");
        check(HookAppCatalog.find("missing") == null && HookAppCatalog.sections("missing").isEmpty()
                && HookAppCatalog.entries("missing").isEmpty(), "unknown route must fail closed");
        System.out.println("PASS: " + HookAppCatalog.targets().size() + " application groups, " + coveredPackages.size()
                + " hook scopes, " + visibleKeys.size() + " generic controls, " + editorCount + " existing editors.");
    }

    private static void owner(String suffix, String target) {
        check(target.equals(HookAppCatalog.targetForKey(SystemOptions.key(suffix))), "incorrect owner: " + suffix);
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
