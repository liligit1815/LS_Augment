package ls.augment.com;

import java.util.*;

public final class TestStatusBarWorkspace {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        nativeDefaults();
        StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.empty()
                .with("wifi",new StatusBarGridSpec.Item("L2",998,0,true))
                .with("vendor-new",new StatusBarGridSpec.Item("C1",0,32,true));
        check(positions.serialize().equals(StatusBarWorkspaceSpec.parse(positions.serialize()).serialize()),"positions round trip including native size and device slots");
        for(String invalid:new String[]{"SI1;wifi,L1,999,13","SI1;wifi,Z1,1,13","SI1;wifi,L1,1,5","SI1;wifi,L1,1,13;wifi,R1,2,13","SI1;wifi,L1,1,13;"})check(StatusBarWorkspaceSpec.parse(invalid)==null,"reject malformed "+invalid);
        StatusBarGridSpec legacy=StatusBarGridSpec.defaults();String original=legacy.serialize();
        check(StatusBarWorkspaceSpec.effectiveGrid(legacy,"0")==legacy,"legacy mode keeps original grid");
        StatusBarGridSpec single=StatusBarWorkspaceSpec.effectiveGrid(legacy,"1");
        for(String id:StatusBarGridSpec.IDS)check(single.get(id).zone.endsWith("S")&&single.get(id).order==legacy.get(id).order,"single row preserves order "+id);
        check(original.equals(legacy.serialize()),"single row never overwrites saved positions");
        check("1".equals(StatusBarWorkspaceSpec.effectiveValue(ConfigSchema.STATUSBAR_CLOCK_ROWS,"2","1")),"clock follows single row");
        check("3".equals(StatusBarWorkspaceSpec.effectiveValue(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"4","1")),"network keeps both values in single row");
        check("2".equals(StatusBarWorkspaceSpec.effectiveValue(ConfigSchema.STATUSBAR_CLOCK_ROWS,"2","2")),"double row restores clock choice");
        check("0".equals(StatusBarWorkspaceSpec.effectiveValue(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"20","1")),"single row ignores gap without deleting it");
        for(boolean dual:new boolean[]{false,true}){
            Map<String,String> preset=StatusBarWorkspaceSpec.preset(dual);
            check(!preset.containsKey(StatusBarThemeSpec.KEY)&&!preset.containsKey(StatusBarFontSpec.KEY),"presets preserve artwork and fonts");
            check(preset.containsKey(ConfigSchema.STATUSBAR_GRID),"both presets define a complete layout");
            for(Map.Entry<String,String> e:preset.entrySet())check(ConfigSchema.normalize(e.getKey(),e.getValue())!=null,"valid preset field "+e.getKey());
        }
        StatusBarVisibilitySpec hidden=StatusBarVisibilitySpec.empty().with("all","clock",true).with("lock","power",true)
                .with("main","connectivity",true).with("main","vpn",true);
        Map<String,String> source=new LinkedHashMap<>();source.put(StatusBarVisibilitySpec.KEY,hidden.serialize());source.put(ConfigSchema.STATUSBAR_GRID,original);
        Map<String,String> dual=StatusBarWorkspaceSpec.preset(true,source);
        check(hidden.serialize().equals(source.get(StatusBarVisibilitySpec.KEY))&&original.equals(source.get(ConfigSchema.STATUSBAR_GRID)),"preset does not mutate its source");
        check("HH:mmIIE".equals(dual.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN))&&"MM.ddN月e".equals(dual.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND)),"exact requested clock patterns");
        check("1".equals(dual.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&"2".equals(dual.get(ConfigSchema.STATUSBAR_CLOCK_ROWS)),"custom two-line clock enabled");
        check("1".equals(dual.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))&&"1".equals(dual.get(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)),"recorded combined icon and two-row notifications");
        check("-1".equals(dual.get(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP))&&"23".equals(dual.get(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE)),"recorded signed gap and circle diameter");
        check("189".equals(dual.get(ConfigSchema.CONNECTIVITY_SCALE_KEYS[0]))&&"-5".equals(dual.get(ConfigSchema.CONNECTIVITY_Y_KEYS[0]))&&"123".equals(dual.get(ConfigSchema.CONNECTIVITY_SCALE_KEYS[1])),"recorded wifi and battery internal geometry");
        check("1".equals(dual.get(ConfigSchema.STATUSBAR_CONNECTIVITY_REVERSE))&&"1".equals(dual.get(ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS)),"recorded circle direction and palette");
        check("".equals(dual.get(ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK))&&"".equals(dual.get(ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK)),"recorded traffic rows have no direction prefixes");
        Map<String,String> changedSource=new LinkedHashMap<>(source);changedSource.put(ConfigSchema.CONNECTIVITY_SCALE_KEYS[0],"75");changedSource.put(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,"40");changedSource.put(SystemUiOptions.PREFIX+"metric_prefix_power","custom:");
        check(dual.equals(StatusBarWorkspaceSpec.preset(true,changedSource)),"saved appearance is independent of intervening edits");
        check("0".equals(dual.get(SystemUiOptions.PREFIX+"metrics_charging_only")),"power remains visible while discharging");
        check("".equals(dual.get(StatusBarWorkspaceSpec.ICONS))&&"".equals(dual.get(StatusBarIconSpacingSpec.KEY)),"old icon layout cannot override the preset");
        StatusBarGridSpec grid=StatusBarGridSpec.parse(dual.get(ConfigSchema.STATUSBAR_GRID));
        check(grid.get("clock").zone.equals("LS")&&grid.get("clock").visible,"clock uses both left rows");
        check(grid.get("notifications").zone.equals("L1")&&grid.get("notifications").visible,"notifications in upper left row");
        check(grid.get("power").zone.equals("R2")&&grid.get("power").visible,"power in lower right row");
        check(grid.get("clock").order<grid.get("notifications").order&&grid.get("clock").order<grid.get("power").order,"notification and power follow aligned clock rows");
        check(grid.get("battery").zone.equals("RS")&&grid.get("battery").order==998&&grid.get("battery").visible,"combined icon spans both rows at the far right");
        for(String id:new String[]{"cpu","gpu","battery_temp","current"})check(!grid.get(id).visible,"preset excludes extra readings "+id);
        check(grid.get("network").visible&&grid.get("network").zone.equals("RS")&&grid.get("power").order<grid.get("network").order&&grid.get("network").order<grid.get("battery").order,"network between power and far-right battery");
        check("4".equals(dual.get(ConfigSchema.STATUSBAR_NETWORK_DISPLAY))&&StatusBarNetworkDisplay.format(4,"1K","2K").equals("↑1K\n↓2K"),"network upload above download");
        Map<String,String> compact=StatusBarWorkspaceSpec.preset(false,dual);StatusBarGridSpec compactGrid=StatusBarGridSpec.parse(compact.get(ConfigSchema.STATUSBAR_GRID));
        check("0".equals(compact.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&"0".equals(compact.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)),"single preset restores native clock and battery");
        for(String id:StatusBarGridSpec.IDS){check(compactGrid.get(id).zone.endsWith("S"),"single preset clears second-row positions: "+id);if(StatusBarWorkspaceItems.METRICS.contains(id)||id.equals("network"))check(!compactGrid.get(id).visible,"single preset excludes extra readings: "+id);}
        StatusBarVisibilitySpec visible=StatusBarVisibilitySpec.parse(dual.get(StatusBarVisibilitySpec.KEY));
        check(!visible.hidden("main","clock")&&!visible.hidden("lock","power")&&!visible.hidden("main","connectivity"),"requested components are unhidden");
        check(visible.hidden("main","vpn"),"unrelated icon hiding is preserved");
        ConfigEditDraft preview=new ConfigEditDraft();for(Map.Entry<String,String> e:source.entrySet())preview.seed(e.getKey(),e.getValue());
        preview.seed(StatusBarWorkspaceSpec.ROWS,"1");Map<String,String> backup=new LinkedHashMap<>();for(Map.Entry<String,String> e:preview.entrySet())backup.put(e.getKey(),e.getValue());
        // Production snapshots contain every affected key, including defaults.
        for(String key:dual.keySet())if(!backup.containsKey(key)){backup.put(key,ConfigSchema.defaultValue(key));preview.seed(key,ConfigSchema.defaultValue(key));}
        StatusBarPresetPreview.preview(preview,dual);check(!preview.hasPending(),"two-row preview is not an edit");
        StatusBarPresetPreview.restore(preview,backup);for(Map.Entry<String,String> e:backup.entrySet())check(Objects.equals(e.getValue(),preview.get(e.getKey())),"cancel restores "+e.getKey());
        Map<String,String> reset=StatusBarWorkspaceSpec.reset();
        for(Map.Entry<String,String> e:reset.entrySet())check(ConfigSchema.normalize(e.getKey(),e.getValue())!=null,"valid reset "+e.getKey());
        check("0".equals(reset.get(ConfigSchema.SYSTEMUI_MASTER)),"reset disables master");
        check("0".equals(reset.get(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED)),"reset disables separate native battery style");
        for(String key:new String[]{StatusBarThemeSpec.KEY,StatusBarFontSpec.KEY,StatusBarVisibilitySpec.KEY,StatusBarIconSpacingSpec.KEY,StatusBarWorkspaceSpec.ICONS})check("".equals(reset.get(key)),"reset clears scoped rules "+key);
        check(!reset.containsKey("ls_augment_launcher_grid")&&!reset.containsKey(SystemUiOptions.ISLAND),"reset preserves other modules");
        ConfigEditDraft draft=new ConfigEditDraft();draft.seed(StatusBarWorkspaceSpec.ROWS,"2");draft.put(StatusBarWorkspaceSpec.ROWS,"1");ConfigEditDraft.Batch old=draft.takePending();
        draft.replaceSaved(reset);draft.put(StatusBarWorkspaceSpec.ROWS,"2");draft.complete(old,true);
        check("2".equals(draft.unsaved().get(StatusBarWorkspaceSpec.ROWS)),"late acknowledgement cannot clear a post-reset edit");
        StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.empty().with("all","system_icons",new StatusBarIconSpacingSpec.Insets(1,2,3,4));
        check(spacing.resolve("main","bluetooth").start==1,"system default spacing reaches real semantic icons");
        check(spacing.resolve("main","wifi.signal").isZero()&&spacing.resolve("main","battery").isZero(),"default is not applied again to composite children or battery");
        spacing=spacing.with("all","bluetooth",StatusBarIconSpacingSpec.ZERO);
        check(spacing.resolve("main","bluetooth").isZero(),"per-icon native spacing overrides shared defaults");
        for(String key:StatusBarMargins.KEYS){check("-8".equals(ConfigSchema.normalize(key,"-8")),"signed margin supported "+key);check(ConfigSchema.normalize(key,"-65")==null,"reject out-of-range margin "+key);}
        check(StatusBarMargins.resolve(18,0,3)==18&&StatusBarMargins.resolve(18,-3,3)==9&&StatusBarMargins.resolve(18,3,3)==27,"OEM baseline and signed offsets");
        List<StatusBarGridLayout.Node> box=Collections.singletonList(new StatusBarGridLayout.Node("clock","LS",0,40,12));
        StatusBarAdaptiveLayout.Result zero=StatusBarAdaptiveLayout.pack(box,300,30,18,18,0,0,0,0,0);
        StatusBarAdaptiveLayout.Result negative=StatusBarAdaptiveLayout.pack(box,300,30,9,18,-4,0,0,0,0);
        check(zero.valid&&negative.valid&&negative.boxes.get("clock").x<zero.boxes.get("clock").x&&negative.boxes.get("clock").y<zero.boxes.get("clock").y,"negative margins move visible content outward");
        check(!StatusBarAdaptiveLayout.pack(box,300,30,-60,18,0,0,0,0,0).valid,"extreme negative margins preserve physical visibility by rejecting pack");
        Map<String,Integer> keyCounts=new LinkedHashMap<>();for(NativeFeatureGroups.Feature f:StatusBarWorkspaceItems.features(NativeFeatureGroups.forGroup("statusbar")))for(String key:f.allKeys())keyCounts.put(key,keyCounts.getOrDefault(key,0)+1);
        for(NativeFeatureGroups.Feature f:NativeFeatureGroups.forGroup("statusbar"))for(String key:f.allKeys())check(keyCounts.get(key)==1,"split settings retain exactly one owner: "+key);
        for(String[] pair:new String[][]{{"systemui:hide_mobile_activity","general-network"},{"systemui:hide_wifi_activity","wifi"},{"systemui:hide_hotspot_scope","hotspot"},{"systemui:hide_sim1","mobile1"},{"systemui:network_custom","network"},{"systemui:metrics_custom","metric-details"},{"systemui:hidden_icon_slots","hidden-icons"},{"ls_augment_rm_metrics_hide_units","metrics-units"},{"ls_augment_rm_metrics_charging_only","metrics-charging"}}){boolean found=false;for(NativeFeatureGroups.Feature f:StatusBarWorkspaceItems.features(NativeFeatureGroups.forGroup("statusbar")))if(f.id.equals(pair[0]))found=StatusBarWorkspaceItems.destination(f).equals(pair[1]);check(found,"unique destination: "+pair[0]);}
        for(int filter=0;filter<4;filter++)for(boolean loaded:new boolean[]{false,true})for(boolean shown:new boolean[]{false,true})for(boolean modified:new boolean[]{false,true})check(StatusBarWorkspaceItems.matches(filter,loaded,shown,modified)==(filter==3||filter==0&&loaded||filter==1&&modified||filter==2&&loaded&&!shown),"filter state matrix");
        check(StatusBarWorkspaceItems.parent("wifi",true).equals("battery")&&StatusBarWorkspaceItems.parent("wifi.signal",false).equals("wifi"),"children lead to the real order owner");
        check(StatusBarWorkspaceItems.parent("dual_signal",false).equals("general-network")&&StatusBarWorkspaceItems.parent("privacy.camera",false).equals("system_icons"),"shared objects link to existing settings owners");
        Map<String,String> baseline=new LinkedHashMap<>(ConfigSchema.defaults());check(!StatusBarWorkspaceItems.changed("bluetooth",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty(),"main"),"default icon not modified");
        baseline.put(StatusBarWorkspaceSpec.ICONS,positions.serialize());check(StatusBarWorkspaceItems.changed("wifi",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty(),"main"),"position override counts as modified");
        baseline=new LinkedHashMap<>(ConfigSchema.defaults());baseline.put(StatusBarVisibilitySpec.KEY,StatusBarVisibilitySpec.empty().with("main","bluetooth",true).serialize());check(StatusBarWorkspaceItems.changed("bluetooth",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty(),"main"),"hidden rule counts as modified");
        baseline=new LinkedHashMap<>(ConfigSchema.defaults());baseline.put(StatusBarIconSpacingSpec.KEY,StatusBarIconSpacingSpec.empty().with("all","bluetooth",new StatusBarIconSpacingSpec.Insets(1,0,0,0)).serialize());check(StatusBarWorkspaceItems.changed("bluetooth",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty(),"main"),"spacing counts as modified");
        baseline=new LinkedHashMap<>(ConfigSchema.defaults());check(StatusBarWorkspaceItems.changed("clock",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty().with("clock","original","main"),"main"),"font selection counts as modified");
        baseline.putAll(dual);check(StatusBarWorkspaceItems.changed("network",baseline::get,StatusBarThemeSpec.empty(),StatusBarFontSpec.empty(),"main"),"preset changes count as modified");
        baseline.put(StatusBarVisibilitySpec.KEY,StatusBarVisibilitySpec.empty().with("all","vendor_hidden",true).serialize());
        StatusBarThemeSpec vendorTheme=StatusBarThemeSpec.empty().with(new StatusBarThemeSpec.Binding("vendor_art","default","foreground","a".repeat(64),true,100,0,0,100,false));
        check(StatusBarWorkspaceItems.configuredIds(baseline::get,vendorTheme).containsAll(Arrays.asList("vendor_hidden","vendor_art")),"configured device-only icons survive inventory disappearance");
        check(StatusBarWorkspaceItems.changed("vendor_art",baseline::get,vendorTheme,StatusBarFontSpec.empty(),"main"),"artwork counts as modified");
        System.out.println("Status bar workspace: "+checks+" checks passed");
    }
    private static void nativeDefaults(){
        Map<String,String> values=new LinkedHashMap<>(StatusBarWorkspaceSpec.reset());
        values.put(ConfigSchema.SYSTEMUI_MASTER,"1");StatusBarEditPolicy policy=StatusBarEditPolicy.resolve(values::get);
        check(policy.empty(),"master alone owns no layout fields");
        for(String id:new String[]{"clock","notifications","system_icons","battery"})check(policy.grid("").get(id).size==0,"native size inherited: "+id);
        check("0".equals(policy.effective(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"1")),"unmodified notification rows inherit native");
        check("0".equals(policy.effective(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"1")),"unmodified system rows inherit native");
        values.put(ConfigSchema.STATUSBAR_GRID,StatusBarGridSpec.defaults().serialize());values.put(StatusBarWorkspaceSpec.ROWS,"0");
        check(StatusBarEditPolicy.resolve(values::get).empty(),"old master-saved defaults do not become an applied preset");
        values.put(ConfigSchema.STATUSBAR_GRID,StatusBarGridSpec.defaults().with("battery",new StatusBarGridSpec.Item("RS",998,16,true)).serialize());
        check(StatusBarEditPolicy.resolve(values::get).full,"real legacy layout remains complete");
        policy=StatusBarEditPolicy.partial().with("battery","size",true).with("wifi","order",true);
        values.put(StatusBarEditPolicy.KEY,policy.serialize());check(!StatusBarEditPolicy.resolve(values::get).full,"explicit partial policy overrides old serialized grid");
        check(policy.grid(values.get(ConfigSchema.STATUSBAR_GRID)).get("clock").size==0&&policy.grid(values.get(ConfigSchema.STATUSBAR_GRID)).get("battery").size==16,"one size edit cannot claim another component");
        check(!policy.owns("battery","zone")&&!policy.owns("wifi","size"),"field masks do not leak between fields");
        check(StatusBarEditPolicy.parse(policy.serialize()).serialize().equals(policy.serialize()),"explicit policy round trip");
        check(policy.with("battery","size",false).grid(values.get(ConfigSchema.STATUSBAR_GRID)).get("battery").size==0,"return to native size releases ownership");
        for(String invalid:new String[]{"SE1;full;battery,size","SE1;partial;battery,nope","SE1;partial;wifi,size;wifi,size","SE1;partial;","bad"})check(StatusBarEditPolicy.parse(invalid)==null,"invalid policy rejected");
        for(boolean dual:new boolean[]{false,true})check(StatusBarEditPolicy.resolve(StatusBarWorkspaceSpec.preset(dual)::get).full,"explicit preset owns complete layout");
        StatusBarGridLayout.Box a=new StatusBarGridLayout.Box(10,10,20,20,1),b=new StatusBarGridLayout.Box(45,10,20,20,1),c=new StatusBarGridLayout.Box(80,10,20,20,1);
        List<StatusBarSelectiveLayout.Item> untouched=Arrays.asList(new StatusBarSelectiveLayout.Item("clock","LS",a,20,20,false,false,0),new StatusBarSelectiveLayout.Item("battery","RS",c,20,20,false,false,3));
        check(StatusBarSelectiveLayout.place(untouched,120,40,0,0,0,0,0,0).boxes.isEmpty(),"no-op applies zero transforms");
        List<StatusBarSelectiveLayout.Item> size=new ArrayList<>(untouched);size.set(1,new StatusBarSelectiveLayout.Item("battery","RS",c,12,12,true,false,3));
        StatusBarSelectiveLayout.Result result=StatusBarSelectiveLayout.place(size,120,40,0,0,0,0,0,0);
        check(result.valid&&result.boxes.size()==1&&!result.boxes.containsKey("clock"),"single-size edit leaves native clock untouched");
        check(result.boxes.get("battery").x==84&&result.boxes.get("battery").y==14,"size edit preserves native center");
        size.set(1,new StatusBarSelectiveLayout.Item("battery","RS",c,110,20,true,false,3));
        check(!StatusBarSelectiveLayout.place(size,120,40,0,0,0,0,0,0).valid,"collision does not shrink unrelated native icons");
        List<StatusBarSelectiveLayout.Item> ordered=Arrays.asList(new StatusBarSelectiveLayout.Item("wifi","RS",a,20,20,true,false,9),new StatusBarSelectiveLayout.Item("bt","RS",b,20,20,false,false,1),new StatusBarSelectiveLayout.Item("alarm","RS",c,20,20,false,false,2));
        Map<String,StatusBarGridLayout.Box> reordered=StatusBarSelectiveLayout.reorder(ordered,true);
        check(reordered.get("wifi").x==80&&reordered.get("bt").x==10&&reordered.get("alarm").x==45,"numeric order actually reorders native siblings");
        check(reordered.get("wifi").width==20&&reordered.get("wifi").height==20,"order preserves native dimensions and spacing");
        List<StatusBarSelectiveLayout.Item> moved=Collections.singletonList(new StatusBarSelectiveLayout.Item("wifi","CS",a,20,20,true,true,0));
        check(!StatusBarSelectiveLayout.place(moved,120,40,0,0,0,0,40,80).valid,"cutout obstruction falls back instead of drawing through camera");
    }
}
