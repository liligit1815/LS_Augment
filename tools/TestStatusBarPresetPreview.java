package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Preset preview/cancel must not submit temporary values or touch unrelated settings. */
public final class TestStatusBarPresetPreview {
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static Map<String,String> snapshot(ConfigEditDraft draft){Map<String,String> result=new LinkedHashMap<>();for(Map.Entry<String,String> entry:draft.entrySet())result.put(entry.getKey(),entry.getValue());return result;}
    public static void main(String[] args){
        ConfigEditDraft draft=new ConfigEditDraft();draft.seed("master","0");draft.seed("layout","original");draft.seed("battery","three-in-one");
        Map<String,String> before=snapshot(draft),preset=new LinkedHashMap<>();preset.put("master","1");preset.put("layout","two-rows");
        StatusBarPresetPreview.preview(draft,preset);
        require("two-rows".equals(draft.get("layout")),"Preview uses selected arrangement");
        require("three-in-one".equals(draft.get("battery")),"Preview preserves unrelated component values");
        require(!draft.hasPending(),"Preview cannot be auto-saved");
        Map<String,String> candidate=snapshot(draft);
        StatusBarPresetPreview.restore(draft,before);
        require(before.equals(snapshot(draft)),"Cancel restores all prior values together");
        require(!draft.hasPending(),"Cancel does not create a save batch");
        for(Map.Entry<String,String> entry:candidate.entrySet())draft.put(entry.getKey(),entry.getValue());
        ConfigEditDraft.Batch accepted=draft.takePending();
        require(accepted.values.equals(preset),"Confirm saves exactly the selected preset as one batch");
        draft.complete(accepted,false);require(draft.hasPending(),"Failed save keeps the confirmed draft retryable");
        accepted=draft.takePending();draft.complete(accepted,true);require(!draft.hasPending(),"Successful retry finishes the confirmed draft");
        System.out.println("Status bar preset preview: 8 checks passed");
    }
}
