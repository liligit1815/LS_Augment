package ls.augment.com;

import java.util.Map;

/** Temporary preset values never become edits until the controller confirms them. */
final class StatusBarPresetPreview {
    private StatusBarPresetPreview() { }

    static void preview(ConfigEditDraft draft, Map<String,String> values) { restore(draft,values); }

    static void restore(ConfigEditDraft draft, Map<String,String> snapshot) {
        for(Map.Entry<String,String> entry:snapshot.entrySet())draft.seed(entry.getKey(),entry.getValue());
    }
}
