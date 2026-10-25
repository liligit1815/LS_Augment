package ls.augment.com;

import java.io.*;
import java.text.Collator;
import java.util.*;

/** Preference data only. Every presented Item must come from the current launcher query. */
final class AtomicWorkbenchAppListModel {
    static final int MANUAL = 0, USAGE = 1, INITIAL = 2;
    static final int ALL = 0, SELECTED = 1, HIDDEN = 2;
    private static final int MAGIC = 0x41574150, VERSION = 1, LIMIT = 8192, MAX_BYTES = 2 * 1024 * 1024;

    static class Item {
        final String key, label, packageName, latin;
        final char initial;
        Item(String key, String label, String packageName, String latin) {
            if (key == null || key.isEmpty() || key.length() > 1024 || label == null || packageName == null)
                throw new IllegalArgumentException("app_item");
            this.key = key; this.label = label; this.packageName = packageName;
            this.latin = latin == null ? label : latin;
            String value = this.latin.trim().toUpperCase(Locale.ROOT);
            char first = value.isEmpty() ? '#' : value.charAt(0);
            initial = first >= 'A' && first <= 'Z' ? first : '#';
        }
        String key() { return key; }
        boolean matches(String query) {
            String q = query == null ? "" : query.trim().toLowerCase(Locale.ROOT);
            return label.toLowerCase(Locale.ROOT).contains(q) || packageName.toLowerCase(Locale.ROOT).contains(q);
        }
    }
    static final class Entry {
        final boolean visible, pinned;
        final long order;
        Entry(boolean visible, boolean pinned, long order) { this.visible=visible; this.pinned=pinned; this.order=order; }
    }
    static final class State {
        final int userId, mode;
        final Map<String, Entry> entries;
        State(int userId) { this(userId, MANUAL, Collections.emptyMap()); }
        State(int userId, int mode, Map<String, Entry> entries) {
            if (userId < 0 || mode < MANUAL || mode > INITIAL || entries.size() > LIMIT)
                throw new IllegalArgumentException("app_state");
            this.userId=userId; this.mode=mode;
            this.entries=Collections.unmodifiableMap(new LinkedHashMap<>(entries));
        }
        Entry entry(String key) { Entry e=entries.get(key); return e==null ? new Entry(true,false,Long.MAX_VALUE) : e; }
        State mode(int value) { return new State(userId,value,entries); }
        State visible(String key, boolean value) {
            Entry e=entry(key); return put(key,new Entry(value,e.pinned,e.order));
        }
        State pinned(String key, boolean value) {
            Entry e=entry(key); return put(key,new Entry(e.visible,value,e.order));
        }
        private State put(String key, Entry entry) {
            if (key==null || key.isEmpty() || key.length()>1024) throw new IllegalArgumentException("app_key");
            LinkedHashMap<String,Entry> next=new LinkedHashMap<>(entries); next.put(key,entry);
            return new State(userId,mode,next);
        }
        State select(List<? extends Item> current, boolean invert) {
            State next=this;
            for(Item item:current) next=next.visible(item.key, invert ? !entry(item.key).visible : true);
            return next;
        }
        State move(List<? extends Item> current, String key, String beforeKey) {
            if(mode!=MANUAL) throw new IllegalArgumentException("manual_only");
            ArrayList<Item> candidates=new ArrayList<>();candidates.addAll(current);
            ArrayList<Item> ordered=ordered(candidates,this,Usage.unavailable(""),false,Collections.emptyList());
            Item source=find(ordered,key), before=find(ordered,beforeKey);
            if(source==null || before==null || key.equals(beforeKey)) throw new IllegalArgumentException("app_missing");
            Entry from=entry(key), target=entry(beforeKey);
            if(from.visible!=target.visible || from.pinned!=target.pinned) throw new IllegalArgumentException("different_group");
            ordered.remove(source); ordered.add(ordered.indexOf(before),source);
            State next=this; long rank=0;
            for(Item item:ordered) { Entry old=entry(item.key); next=next.put(item.key,new Entry(old.visible,old.pinned,rank++)); }
            return next;
        }
    }
    static final class Usage {
        final boolean available;
        final String message;
        final Map<String,Integer> counts;
        final Map<String,Long> recent;
        Usage(boolean available, String message, Map<String,Integer> counts, Map<String,Long> recent) {
            this.available=available; this.message=message;
            this.counts=Collections.unmodifiableMap(new HashMap<>(counts));
            this.recent=Collections.unmodifiableMap(new HashMap<>(recent));
        }
        static Usage unavailable(String message) { return new Usage(false,message,Collections.emptyMap(),Collections.emptyMap()); }
    }
    static int effectiveMode(State state, Usage usage) { return state.mode==USAGE&&!usage.available ? MANUAL : state.mode; }
    static <T extends Item> ArrayList<T> ordered(List<T> current, State state, Usage usage,
            boolean visibleOnly, List<String> runningFirst) {
        final int mode=effectiveMode(state,usage);
        final Collator collator=Collator.getInstance(Locale.CHINA);
        Comparator<T> alphabet=(a,b)-> {
            int group=Integer.compare(a.initial=='#'?27:a.initial-'A',b.initial=='#'?27:b.initial-'A');
            if(group!=0)return group;
            int label=collator.compare(a.label,b.label); return label==0?a.key.compareTo(b.key):label;
        };
        ArrayList<T> rest=new ArrayList<>(); HashSet<String> seen=new HashSet<>();
        for(T item:current) if(seen.add(item.key)&&(!visibleOnly||state.entry(item.key).visible))rest.add(item);
        rest.sort((a,b)-> {
            Entry x=state.entry(a.key),y=state.entry(b.key);
            int pin=Boolean.compare(y.pinned,x.pinned); if(pin!=0)return pin;
            if(mode==MANUAL){int order=Long.compare(x.order,y.order);if(order!=0)return order;}
            if(mode==USAGE){
                int count=Integer.compare(usage.counts.getOrDefault(b.packageName,0),usage.counts.getOrDefault(a.packageName,0));
                if(count!=0)return count;
                int recent=Long.compare(usage.recent.getOrDefault(b.packageName,0L),usage.recent.getOrDefault(a.packageName,0L));
                if(recent!=0)return recent;
            }
            return alphabet.compare(a,b);
        });
        ArrayList<T> result=new ArrayList<>();
        for(String key:runningFirst) { T item=find(rest,key); if(item!=null&&!result.contains(item))result.add(item); }
        for(T item:rest)if(!result.contains(item))result.add(item);
        return result;
    }
    static <T extends Item> T find(List<T> items,String key) {
        for(T item:items)if(item.key.equals(key))return item; return null;
    }
    static <T extends Item> ArrayList<T> filter(List<T> items, State state, String query, int group) {
        ArrayList<T> result=new ArrayList<>();
        for(T item:items)if(item.matches(query)&&(group==ALL||(group==SELECTED)==state.entry(item.key).visible))result.add(item);
        return result;
    }
    static byte[] encode(State state) throws IOException {
        ByteArrayOutputStream bytes=new ByteArrayOutputStream(); DataOutputStream out=new DataOutputStream(bytes);
        out.writeInt(MAGIC);out.writeInt(VERSION);out.writeInt(state.userId);out.writeInt(state.mode);out.writeInt(state.entries.size());
        for(Map.Entry<String,Entry> row:state.entries.entrySet()) {
            if(row.getKey().isEmpty()||row.getKey().length()>1024)throw new IOException("app_key");
            out.writeUTF(row.getKey()); Entry e=row.getValue();out.writeBoolean(e.visible);out.writeBoolean(e.pinned);out.writeLong(e.order);
        }
        out.flush();if(bytes.size()>MAX_BYTES)throw new IOException("app_preferences_size");return bytes.toByteArray();
    }
    static State decode(byte[] bytes,int userId) throws IOException {
        if(bytes==null)return new State(userId);
        if(bytes.length>MAX_BYTES)throw new IOException("app_preferences_size");
        DataInputStream in=new DataInputStream(new ByteArrayInputStream(bytes));
        if(in.readInt()!=MAGIC||in.readInt()!=VERSION||in.readInt()!=userId)throw new IOException("app_preferences_owner");
        int mode=in.readInt(),count=in.readInt();
        if(mode<MANUAL||mode>INITIAL||count<0||count>LIMIT)throw new IOException("app_preferences_shape");
        LinkedHashMap<String,Entry> entries=new LinkedHashMap<>();
        for(int i=0;i<count;i++) {
            String key=in.readUTF(); boolean visible=in.readBoolean(),pinned=in.readBoolean();long order=in.readLong();
            if(key.isEmpty()||key.length()>1024||order<0||entries.put(key,new Entry(visible,pinned,order))!=null)
                throw new IOException("app_preferences_entry");
        }
        if(in.read()!=-1)throw new IOException("app_preferences_tail");
        State result=new State(userId,mode,entries);
        if(!Arrays.equals(bytes,encode(result)))throw new IOException("app_preferences_noncanonical");
        return result;
    }
}
