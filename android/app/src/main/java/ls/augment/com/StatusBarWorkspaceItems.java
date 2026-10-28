package ls.augment.com;

import java.util.*;
import java.util.function.Function;

/** Ownership and filtering for the native workspace, independent of view state. */
final class StatusBarWorkspaceItems {
    static final String[] FILTERS={"当前已加载的图标","已修改的图标","未显示图标","全部图标"};
    static final Set<String> METRICS=new LinkedHashSet<>(Arrays.asList("cpu","gpu","battery_temp","current","power"));
    static String destination(NativeFeatureGroups.Feature f){
        String key=f.toggleKey==null?f.parameterKeys[0]:f.toggleKey;
        String suffix=key.startsWith(SystemUiOptions.PREFIX)?key.substring(SystemUiOptions.PREFIX.length()):key;
        if(suffix.equals("hidden_icon_slots"))return "hidden-icons";
        if(suffix.startsWith("hide_wifi"))return "wifi";
        if(suffix.startsWith("hide_hotspot"))return "hotspot";
        if(suffix.equals("hide_sim1"))return "mobile1";
        if(suffix.equals("hide_sim2"))return "mobile2";
        if(suffix.startsWith("hide_mobile")||suffix.startsWith("hide_hd")||suffix.startsWith("signal_"))return "general-network";
        if(suffix.equals("metrics_custom"))return "metric-details";
        if(suffix.equals("metrics_hide_units"))return "metrics-units";
        if(suffix.equals("metrics_charging_only"))return "metrics-charging";
        for(String id:METRICS)if(suffix.equals("metric_prefix_"+id)||suffix.equals("metric_width_"+id))return id;
        return StatusBarPages.destination(f);
    }
    static List<NativeFeatureGroups.Feature> features(List<NativeFeatureGroups.Feature> source){
        List<NativeFeatureGroups.Feature> out=new ArrayList<>();
        for(NativeFeatureGroups.Feature f:source){
            if(!"systemui:metrics_custom".equals(f.id)){out.add(f);continue;}
            // Common metric switches are rendered directly; prefix/width controls
            // stay with their respective metric, with the existing custom gate.
            out.add(new NativeFeatureGroups.Feature(f.id,f.title,f.toggleKey,new String[0],f.comparison,f.noOpValue,new NativeFeatureGroups.Feature[0]));
            Collections.addAll(out,f.children);
            for(String key:f.parameterKeys)out.add(new NativeFeatureGroups.Feature("workspace:"+key,
                    key.contains("prefix_")?"显示前缀":"固定宽度",null,new String[]{key},key.contains("prefix_")?"trimmedString":"number",ConfigSchema.defaultValue(key),new NativeFeatureGroups.Feature[0]));
        }
        return out;
    }
    static String parent(String id,boolean combined){
        if(id.equals("connectivity"))return "battery";
        String root=id.contains(".")?id.substring(0,id.indexOf('.')):id;
        if(combined&&(root.equals("wifi")||root.equals("mobile1")||root.equals("mobile2")||root.equals("mobile_data")))return "battery";
        if(root.equals("mobile_data")||root.equals("dual_signal"))return "general-network";
        if(root.equals("privacy"))return "system_icons";
        if(!root.equals(id))return root;
        return StatusBarWorkspaceSpec.independentSlot(id)?"":"system_icons";
    }
    static boolean matches(int filter,boolean loaded,boolean visible,boolean modified){return filter==3||filter==0&&loaded||filter==1&&modified||filter==2&&loaded&&!visible;}
    static Set<String> configuredIds(Function<String,String> value,StatusBarThemeSpec theme){
        Set<String> ids=new LinkedHashSet<>();StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(value.apply(StatusBarWorkspaceSpec.ICONS));if(positions!=null)ids.addAll(positions.ids());
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(value.apply(StatusBarVisibilitySpec.KEY));if(visibility!=null)ids.addAll(visibility.ids());
        StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.parse(value.apply(StatusBarIconSpacingSpec.KEY));if(spacing!=null)ids.addAll(spacing.ids());
        if(theme!=null)for(StatusBarThemeSpec.Binding binding:theme.entries())ids.add(binding.id);
        ids.remove("system_icons");ids.remove("notifications");return ids;
    }
    static boolean changed(String id,Function<String,String> value,StatusBarThemeSpec theme,StatusBarFontSpec fonts,String scope){
        StatusBarEditPolicy policy=StatusBarEditPolicy.resolve(value);
        if(!policy.full&&policy.item(id))return true;
        StatusBarGridSpec grid=policy.full?StatusBarGridSpec.parse(value.apply(ConfigSchema.STATUSBAR_GRID)):null;
        StatusBarGridSpec.Item item=grid==null?null:grid.get(id),original=StatusBarGridSpec.defaults().get(id);
        if(item!=null&&original!=null&&(!item.zone.equals(original.zone)||item.order!=original.order||item.size!=original.size||item.visible!=original.visible))return true;
        StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(value.apply(StatusBarWorkspaceSpec.ICONS));
        if(policy.full&&positions!=null&&positions.get(id)!=null)return true;
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(value.apply(StatusBarVisibilitySpec.KEY));
        StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.parse(value.apply(StatusBarIconSpacingSpec.KEY));
        for(String surface:StatusBarSurfaceSpec.SCOPES){
            if(!scope.equals("all")&&!surface.equals("all")&&!surface.equals(scope))continue;
            if(visibility!=null&&visibility.hidden(surface,id))return true;
            if(spacing!=null&&!spacing.resolve(surface,id).isZero())return true;
            if(theme!=null)for(StatusBarThemeSpec.Binding b:theme.entries())if(b.id.equals(id)&&(b.surface.equals(surface)||b.surface.equals("all")))return true;
            String role=METRICS.contains(id)?"metrics":Arrays.asList(StatusBarFontSpec.ROLES).contains(id)?id:"other";
            if(fonts!=null&&!fonts.resolve(role,surface).isEmpty())return true;
        }
        List<String> keys=new ArrayList<>();
        for(NativeFeatureGroups.Feature f:features(NativeFeatureGroups.forGroup("statusbar")))if(destination(f).equals(id))keys.addAll(f.allKeys());
        for(String key:ConfigSchema.keys()){
            if(key.startsWith("ls_augment_statusbar_"+id+"_")||id.equals("battery")&&key.startsWith("ls_augment_statusbar_connectivity_"))keys.add(key);
        }
        for(String key:keys){String current=value.apply(key);if(current!=null&&!Objects.equals(ConfigSchema.normalize(key,current),policy.effective(key,ConfigSchema.defaultValue(key))))return true;}
        return false;
    }
    private StatusBarWorkspaceItems(){}
}
