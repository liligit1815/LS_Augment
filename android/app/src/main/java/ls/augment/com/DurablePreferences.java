package ls.augment.com;

import android.content.SharedPreferences;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/** Publishes only successful disk commits, unlike SharedPreferences' optimistic memory map. */
final class DurablePreferences {
    private final SharedPreferences storage;
    private volatile Map<String, ?> confirmed;

    DurablePreferences(SharedPreferences storage) {
        this.storage = storage;
        confirmed = Collections.unmodifiableMap(new LinkedHashMap<>(storage.getAll()));
    }

    Map<String, ?> getAll() { return confirmed; }
    boolean contains(String key) { return confirmed.containsKey(key); }
    String getString(String key, String fallback) {
        Object value = confirmed.get(key); return value instanceof String ? (String) value : fallback;
    }
    boolean getBoolean(String key, boolean fallback) {
        Object value = confirmed.get(key); return value instanceof Boolean ? (Boolean) value : fallback;
    }
    long getLong(String key, long fallback) {
        Object value = confirmed.get(key); return value instanceof Long ? (Long) value : fallback;
    }
    int getInt(String key, int fallback) {
        Object value = confirmed.get(key); return value instanceof Integer ? (Integer) value : fallback;
    }
    Editor edit() { return new Editor(); }

    final class Editor {
        private final Map<String, Object> next = new LinkedHashMap<>(confirmed);
        Editor putString(String key, String value) { if (value == null) next.remove(key); else next.put(key, value); return this; }
        Editor putBoolean(String key, boolean value) { next.put(key, value); return this; }
        Editor putLong(String key, long value) { next.put(key, value); return this; }
        Editor putInt(String key, int value) { next.put(key, value); return this; }
        Editor remove(String key) { next.remove(key); return this; }

        /** Callers serialize edits around their complete read/modify/write transaction. */
        boolean commit() {
            // Replace all keys so a prior failed commit's optimistic values cannot leak into a retry.
            SharedPreferences.Editor write = storage.edit().clear();
            for (Map.Entry<String, Object> entry : next.entrySet()) {
                String key = entry.getKey(); Object value = entry.getValue();
                if (value instanceof String) write.putString(key, (String) value);
                else if (value instanceof Boolean) write.putBoolean(key, (Boolean) value);
                else if (value instanceof Long) write.putLong(key, (Long) value);
                else if (value instanceof Integer) write.putInt(key, (Integer) value);
                else if (value instanceof Float) write.putFloat(key, (Float) value);
                else return false;
            }
            if (!write.commit()) return false;
            confirmed = Collections.unmodifiableMap(new LinkedHashMap<>(next));
            return true;
        }
    }
}
