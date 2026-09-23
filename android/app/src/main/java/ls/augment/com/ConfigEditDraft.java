package ls.augment.com;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/** UI-thread draft. Only explicit edits are submitted; acknowledgements are per edit. */
final class ConfigEditDraft {
    static final class Batch {
        final Map<String, String> values;
        private final Map<String, Long> revisions;
        private Batch(Map<String, String> values, Map<String, Long> revisions) {
            this.values = Collections.unmodifiableMap(values);
            this.revisions = revisions;
        }
    }

    private final LinkedHashMap<String, String> values = new LinkedHashMap<>();
    private final Map<String, Long> edits = new LinkedHashMap<>();
    private final Map<String, Long> queued = new LinkedHashMap<>();
    private long revision;

    void seed(String key, String value) { values.put(key, value); }
    String get(String key) { return values.get(key); }
    boolean containsKey(String key) { return values.containsKey(key); }
    Set<String> keySet() { return Collections.unmodifiableSet(values.keySet()); }
    Set<Map.Entry<String, String>> entrySet() {
        return Collections.unmodifiableMap(values).entrySet();
    }
    void put(String key, String value) {
        if (!Objects.equals(values.get(key), value)) force(key, value);
    }
    // Reset is an explicit edit even when this page already displays the default.
    void force(String key, String value) {
        values.put(key, value);
        edits.put(key, ++revision);
    }
    Map<String, String> unsaved() {
        Map<String, String> result = new LinkedHashMap<>();
        for (String key : edits.keySet()) result.put(key, values.get(key));
        return result;
    }
    boolean hasPending() {
        for (Map.Entry<String, Long> edit : edits.entrySet())
            if (!edit.getValue().equals(queued.get(edit.getKey()))) return true;
        return false;
    }
    Batch takePending() {
        Map<String, String> update = new LinkedHashMap<>();
        Map<String, Long> versions = new LinkedHashMap<>();
        for (Map.Entry<String, Long> edit : edits.entrySet()) {
            String key = edit.getKey();
            if (edit.getValue().equals(queued.get(key))) continue;
            update.put(key, values.get(key));
            versions.put(key, edit.getValue());
            queued.put(key, edit.getValue());
        }
        return new Batch(update, versions);
    }
    void complete(Batch batch, boolean success) {
        for (Map.Entry<String, Long> edit : batch.revisions.entrySet()) {
            if (success) edits.remove(edit.getKey(), edit.getValue());
            queued.remove(edit.getKey(), edit.getValue());
        }
    }
}
