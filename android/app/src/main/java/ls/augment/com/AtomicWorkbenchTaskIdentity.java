package ls.augment.com;

import android.os.Bundle;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Objects;

/** Equality metadata for one live system Task object, never authority to operate on it. */
public final class AtomicWorkbenchTaskIdentity {
    public static final int SCHEMA = 1;
    public final String serverBootGeneration, taskGeneration, baseComponent, realComponent;
    public final String displayName, displayUnique;
    public final int taskId, rootTaskId, uid, userId, displayId;
    public final boolean leaf;
    private static final String[] KEYS = {"schema", "server_boot_generation", "task_generation",
            "task_id", "root_task_id", "leaf", "uid", "user_id", "base_component",
            "real_component", "display_id", "display_name", "display_unique"};

    public AtomicWorkbenchTaskIdentity(String boot, String generation, int taskId, int rootTaskId,
            boolean leaf, int uid, int userId, String baseComponent, String realComponent,
            int displayId, String displayName, String displayUnique) {
        hex(boot, false); hex(generation, false); component(baseComponent); component(realComponent);
        display(displayId, displayName, displayUnique);
        if (taskId < 0 || rootTaskId < 0 || uid < 1000 || uid % 100000 < 1000 || userId < 0 || uid / 100000 != userId)
            throw invalid("task_identity");
        this.serverBootGeneration = boot; this.taskGeneration = generation;
        this.taskId = taskId; this.rootTaskId = rootTaskId; this.leaf = leaf;
        this.uid = uid; this.userId = userId; this.baseComponent = baseComponent;
        this.realComponent = realComponent; this.displayId = displayId;
        this.displayName = displayName; this.displayUnique = displayUnique;
    }

    public Bundle toBundle() {
        Bundle b = new Bundle(); b.putInt("schema", SCHEMA);
        b.putString("server_boot_generation", serverBootGeneration); b.putString("task_generation", taskGeneration);
        b.putInt("task_id", taskId); b.putInt("root_task_id", rootTaskId); b.putBoolean("leaf", leaf);
        b.putInt("uid", uid); b.putInt("user_id", userId); b.putString("base_component", baseComponent);
        b.putString("real_component", realComponent); b.putInt("display_id", displayId);
        b.putString("display_name", displayName); b.putString("display_unique", displayUnique); return b;
    }

    public static AtomicWorkbenchTaskIdentity fromBundle(Bundle b) {
        keys(b, KEYS); schema(b);
        return new AtomicWorkbenchTaskIdentity(string(b,"server_boot_generation"), string(b,"task_generation"),
                integer(b,"task_id"), integer(b,"root_task_id"), bool(b,"leaf"), integer(b,"uid"),
                integer(b,"user_id"), string(b,"base_component"), string(b,"real_component"),
                integer(b,"display_id"), string(b,"display_name"), string(b,"display_unique"));
    }

    /** A reparent may change the root and location while keeping this same Task object. */
    public boolean sameTask(AtomicWorkbenchTaskIdentity other) {
        return other != null && taskId == other.taskId && uid == other.uid && userId == other.userId
                && serverBootGeneration.equals(other.serverBootGeneration) && taskGeneration.equals(other.taskGeneration)
                && baseComponent.equals(other.baseComponent) && realComponent.equals(other.realComponent);
    }

    public boolean sameLocation(AtomicWorkbenchTaskIdentity other) {
        return other != null && displayId == other.displayId && displayName.equals(other.displayName)
                && displayUnique.equals(other.displayUnique);
    }

    @Override public boolean equals(Object other) {
        if (!(other instanceof AtomicWorkbenchTaskIdentity)) return false;
        AtomicWorkbenchTaskIdentity value = (AtomicWorkbenchTaskIdentity) other;
        return sameTask(value) && sameLocation(value) && rootTaskId == value.rootTaskId && leaf == value.leaf;
    }
    @Override public int hashCode() {
        return Objects.hash(serverBootGeneration,taskGeneration,taskId,rootTaskId,leaf,uid,userId,
                baseComponent,realComponent,displayId,displayName,displayUnique);
    }

    static IllegalArgumentException invalid(String field) { return new IllegalArgumentException(field); }
    static void hex(String value, boolean empty) {
        if (value == null || !(empty && value.isEmpty()) && !value.matches("[0-9a-f]{32}")) throw invalid("generation_id");
    }
    static void component(String value) {
        if (value == null || value.length() > 1024
                || !value.matches("[A-Za-z_][A-Za-z0-9_]*(?:\\.[A-Za-z_][A-Za-z0-9_]*)*/\\.?[A-Za-z_$][A-Za-z0-9_$]*(?:\\.[A-Za-z_$][A-Za-z0-9_$]*)*")) throw invalid("component");
    }
    static void text(String value, int limit, boolean empty) {
        if (value == null || value.length() > limit || !empty && value.isEmpty()) throw invalid("metadata_text");
        for (int i=0;i<value.length();i++) if (Character.isISOControl(value.charAt(i))) throw invalid("metadata_text");
    }
    static void display(int id, String name, String unique) {
        if (id < 0) throw invalid("display_id"); text(name,512,false); text(unique,1024,false);
    }
    static void session(String value, boolean empty) {
        if (value == null || !(empty && value.isEmpty())
                && !value.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) throw invalid("window_session");
    }
    static void keys(Bundle b, String... allowed) {
        if (b == null || !b.keySet().equals(new HashSet<>(Arrays.asList(allowed)))) throw invalid("bundle_keys");
    }
    static void schema(Bundle b) { if (integer(b,"schema") != SCHEMA) throw invalid("schema"); }
    @SuppressWarnings("deprecation") static Object typed(Bundle b,String key,Class<?> type) {
        Object v=b.get(key); if (v == null || v.getClass()!=type) throw invalid("typed_"+key); return v;
    }
    static String string(Bundle b,String k) { return (String)typed(b,k,String.class); }
    static int integer(Bundle b,String k) { return (Integer)typed(b,k,Integer.class); }
    static long number(Bundle b,String k) { return (Long)typed(b,k,Long.class); }
    static boolean bool(Bundle b,String k) { return (Boolean)typed(b,k,Boolean.class); }
    static Bundle bundle(Bundle b,String k) { return (Bundle)typed(b,k,Bundle.class); }
}
