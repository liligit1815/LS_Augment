package ls.augment.com;

import java.util.*;

/** Shared reference accounting for Provider grants, transfer and deletion. */
public final class StatusBarAssetReferences {
    private StatusBarAssetReferences() { }
    public static Set<String> statusbarIcons(Map<String,String> values){
        Set<String> hashes=new LinkedHashSet<>();StatusBarThemeSpec spec=StatusBarThemeSpec.parse(values.getOrDefault(StatusBarThemeSpec.KEY,""));
        if(spec!=null)for(StatusBarThemeSpec.Binding binding:spec.entries())hashes.add(binding.asset);
        String summary=values.get(NotificationSummaryOptions.ASSET);if(summary!=null&&summary.matches("[0-9a-f]{64}"))hashes.add(summary);
        // Retired worksheet text is retained only for old-backup compatibility.
        // It must not grant runtime access or reserve otherwise unused artwork.
        return hashes;
    }
    public static Set<String> fonts(Map<String,String> values){
        Set<String> hashes=new LinkedHashSet<>();
        // Register actual consumers explicitly; an arbitrary text setting is not a resource grant.
        for(String key:new String[]{"ls_augment_rm_lock_clock_font","ls_augment_rm_aod_clock_font"}){
            String value=values.get(key);if(value!=null&&value.matches("font:[0-9a-f]{64}"))hashes.add(value.substring(5));
        }
        StatusBarFontSpec spec=StatusBarFontSpec.parse(values.getOrDefault(StatusBarFontSpec.KEY,""));if(spec!=null)hashes.addAll(spec.hashes());return hashes;
    }
}
