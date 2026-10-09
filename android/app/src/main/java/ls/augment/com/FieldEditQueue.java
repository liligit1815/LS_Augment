package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

/** Field-local admission for debounced writes. A claimed write is already in flight. */
final class FieldEditQueue {
    private static final class Edit {
        final String key, value;
        final long generation;
        final boolean invalid;
        Edit(String key, String value, long generation, boolean invalid) {
            this.key=key; this.value=value; this.generation=generation; this.invalid=invalid;
        }
    }

    static final class Batch {
        private final LinkedHashMap<String,Edit> edits;
        private Batch(Map<String,Edit> edits) { this.edits=new LinkedHashMap<>(edits); }
        boolean isEmpty() { return edits.isEmpty(); }
        Map<String,String> values() {
            LinkedHashMap<String,String> values=new LinkedHashMap<>();
            for(Edit edit:edits.values()) values.put(edit.key,edit.value);
            return values;
        }
    }

    private final Map<String,Edit> latest=new LinkedHashMap<>();
    private final Map<String,Edit> pending=new LinkedHashMap<>();
    private final Map<String,Edit> claimed=new LinkedHashMap<>();
    private long generation;

    synchronized void put(String key,String value) {
        Edit edit=new Edit(key,value,++generation,false);
        latest.put(key,edit);pending.put(key,edit);
    }
    synchronized void putAll(Map<String,String> values) {
        for(Map.Entry<String,String> entry:values.entrySet()) put(entry.getKey(),entry.getValue());
    }
    synchronized long invalidate(String key) {
        Edit edit=new Edit(key,null,++generation,true);
        latest.put(key,edit);pending.remove(key);return edit.generation;
    }
    synchronized boolean isInvalid(String key) {
        Edit edit=latest.get(key);return edit!=null&&edit.invalid;
    }
    synchronized boolean isInvalid(String key,long token) {
        Edit edit=latest.get(key);return edit!=null&&edit.invalid&&edit.generation==token;
    }
    synchronized boolean needsSubmission(String key) { return latest.containsKey(key)||claimed.containsKey(key); }
    synchronized boolean isInFlight(String key) { return claimed.containsKey(key); }
    synchronized boolean isEmpty() { return pending.isEmpty(); }
    /** Only explicit unfinished legal edits are restorable; invalid fallbacks are never intents. */
    synchronized Map<String,String> restorableValues() {
        Map<String,String> values=new LinkedHashMap<>();
        for(Edit edit:latest.values()) if(!edit.invalid) values.put(edit.key,edit.value);
        return values;
    }
    synchronized Batch takePending() {
        Batch result=new Batch(pending);pending.clear();return result;
    }

    /** Only this short admission check is synchronized; never hold its monitor during disk I/O. */
    synchronized Batch claim(Batch batch) {
        Map<String,Edit> accepted=new LinkedHashMap<>();
        for(Edit edit:batch.edits.values()) {
            Edit current=latest.get(edit.key);
            if(current!=edit||current.invalid) continue;
            if(claimed.containsKey(edit.key)) throw new IllegalStateException("Field write already in flight");
            accepted.put(edit.key,edit);claimed.put(edit.key,edit);
        }
        return new Batch(accepted);
    }

    /** A failed old generation must not resurrect a now-invalid or superseded value. */
    synchronized boolean complete(Batch batch,boolean success) {
        boolean retryPending=false;
        for(Edit edit:batch.edits.values()) {
            if(claimed.get(edit.key)==edit) claimed.remove(edit.key);
            Edit current=latest.get(edit.key);
            if(!success&&current==edit&&!current.invalid) {
                pending.putIfAbsent(edit.key,edit);retryPending=true;
            } else if(success&&current==edit) latest.remove(edit.key);
        }
        return retryPending;
    }
}
