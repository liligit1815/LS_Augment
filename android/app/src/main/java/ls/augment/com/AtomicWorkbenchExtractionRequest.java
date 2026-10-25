package ls.augment.com;

import android.os.Bundle;
import java.util.Set;

/** A short-lived system pointer ticket. Deliberately contains no client-selected point or text. */
public final class AtomicWorkbenchExtractionRequest {
    public static final int SCHEMA = 1;
    public static final long MAX_TTL_MS = 2500;
    public final String id, pointerTicket, configChecksum;
    public final long gestureGeneration, downTime, issuedAt, deadlineAt, configRevision, resetGeneration;
    public final int userId, moduleUid;
    public final GeometryEvidence geometry;

    public AtomicWorkbenchExtractionRequest(String id, String ticket, long gesture, long down, long issued,
            long deadline, long revision, String checksum, long reset, int user, int uid, GeometryEvidence geometry) {
        if (!hex(id, 32) || !hex(ticket, 32) || !hex(checksum, 64) || gesture < 1 || down < 0 || issued < down
                || deadline <= issued || deadline - issued > MAX_TTL_MS || revision < 1 || reset < 0
                || user < 0 || uid < 10000 || uid / 100000 != user) throw new IllegalArgumentException("invalid_extraction_request");
        this.id = id; pointerTicket = ticket; gestureGeneration = gesture; downTime = down; issuedAt = issued;
        deadlineAt = deadline; configRevision = revision; configChecksum = checksum; resetGeneration = reset;
        userId = user; moduleUid = uid; this.geometry = geometry;
    }

    /** Optional identity of a separately authenticated Root geometry registration, never a raw matrix. */
    public static final class GeometryEvidence {
        public final String ticket, displayName, displayUniqueId;
        public final int slotId, displayId;
        public final long revision;
        public GeometryEvidence(String ticket, int slot, int display, String name, String unique, long revision) {
            if (!hex(ticket, 32) || slot < 0 || display <= 0 || !identifier(name, 256)
                    || !identifier(unique, 512) || revision < 1) throw new IllegalArgumentException("invalid_extraction_geometry");
            this.ticket = ticket; slotId = slot; displayId = display; displayName = name; displayUniqueId = unique; this.revision = revision;
        }
        Bundle metadata() {
            Bundle b = new Bundle(); b.putString("ticket", ticket); b.putInt("slot", slotId); b.putInt("display", displayId);
            b.putString("name", displayName); b.putString("unique", displayUniqueId); b.putLong("revision", revision); return b;
        }
        static GeometryEvidence parse(Bundle b) {
            exact(b, Set.of("ticket", "slot", "display", "name", "unique", "revision"));
            return new GeometryEvidence(string(b,"ticket"), integer(b,"slot"), integer(b,"display"), string(b,"name"), string(b,"unique"), number(b,"revision"));
        }
    }

    public boolean fresh(long now) { return now >= issuedAt && now < deadlineAt; }
    public Bundle metadata() {
        Bundle b = new Bundle(); b.putInt("schema", SCHEMA); b.putString("id", id); b.putString("ticket", pointerTicket);
        b.putLong("gesture", gestureGeneration); b.putLong("down", downTime); b.putLong("issued", issuedAt);
        b.putLong("deadline", deadlineAt); b.putLong("config", configRevision); b.putString("checksum", configChecksum);
        b.putLong("reset", resetGeneration); b.putInt("user", userId); b.putInt("module_uid", moduleUid);
        if (geometry != null) b.putBundle("geometry", geometry.metadata()); return b;
    }
    public static AtomicWorkbenchExtractionRequest fromBundle(Bundle b) {
        Set<String> keys = b != null && b.containsKey("geometry")
                ? Set.of("schema","id","ticket","gesture","down","issued","deadline","config","checksum","reset","user","module_uid","geometry")
                : Set.of("schema","id","ticket","gesture","down","issued","deadline","config","checksum","reset","user","module_uid");
        exact(b, keys);
        if (integer(b,"schema") != SCHEMA || b.containsKey("geometry") && !(b.get("geometry") instanceof Bundle))
            throw new IllegalArgumentException("invalid_extraction_request");
        return new AtomicWorkbenchExtractionRequest(string(b,"id"), string(b,"ticket"), number(b,"gesture"), number(b,"down"),
                number(b,"issued"), number(b,"deadline"), number(b,"config"), string(b,"checksum"), number(b,"reset"),
                integer(b,"user"), integer(b,"module_uid"), b.containsKey("geometry") ? GeometryEvidence.parse(b.getBundle("geometry")) : null);
    }
    static void exact(Bundle b, Set<String> keys) { if (b == null || !b.keySet().equals(keys)) throw new IllegalArgumentException("invalid_extraction_metadata"); }
    static int integer(Bundle b, String key) { Object v = b.get(key); if (!(v instanceof Integer)) throw new IllegalArgumentException("invalid_extraction_metadata"); return (Integer)v; }
    static long number(Bundle b, String key) { Object v = b.get(key); if (!(v instanceof Long)) throw new IllegalArgumentException("invalid_extraction_metadata"); return (Long)v; }
    static String string(Bundle b, String key) { Object v = b.get(key); if (!(v instanceof String)) throw new IllegalArgumentException("invalid_extraction_metadata"); return (String)v; }
    static float decimal(Bundle b, String key) { Object v = b.get(key); if (!(v instanceof Float) || !Float.isFinite((Float)v)) throw new IllegalArgumentException("invalid_extraction_metadata"); return (Float)v; }
    static boolean hex(String s, int size) { return s != null && s.length() == size && s.matches("[0-9a-f]+"); }
    static boolean identifier(String s, int max) { if (s == null || s.isEmpty() || s.length() > max) return false; for (int i=0;i<s.length();i++) if (Character.isISOControl(s.charAt(i))) return false; return true; }
}
