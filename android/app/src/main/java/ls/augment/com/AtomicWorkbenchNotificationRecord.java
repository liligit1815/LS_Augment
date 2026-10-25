package ls.augment.com;

import android.os.Bundle;
import java.util.Set;

/** Immutable identity and public chronometer structure. No body, RemoteViews or PendingIntent. */
final class AtomicWorkbenchNotificationRecord {
    private static final Set<String> KEYS = Set.of("key", "package", "uid", "user", "generation", "revision", "category", "post_time",
            "show_chronometer", "count_down", "when_wall", "published_clock_known", "published_wall", "published_elapsed");
    final String key, pkg, generation, category;
    final int uid, user;
    final long revision, postTime, when;
    final boolean showChronometer, countDown;
    final boolean publishedClockKnown;
    final long publishedWall, publishedElapsed;
    AtomicWorkbenchNotificationRecord(Bundle row, int expectedUser) {
        if (row == null || !row.keySet().equals(KEYS) || !(row.get("uid") instanceof Integer) || !(row.get("user") instanceof Integer)
                || !(row.get("revision") instanceof Long) || !(row.get("post_time") instanceof Long) || !(row.get("when_wall") instanceof Long)
                || !(row.get("show_chronometer") instanceof Boolean) || !(row.get("count_down") instanceof Boolean)
                || !(row.get("published_clock_known") instanceof Boolean) || !(row.get("published_wall") instanceof Long) || !(row.get("published_elapsed") instanceof Long)) throw new SecurityException();
        key = string(row, "key", 1024); pkg = string(row, "package", 256); generation = string(row, "generation", 48); category = string(row, "category", 64);
        uid = row.getInt("uid"); user = row.getInt("user"); revision = row.getLong("revision"); postTime = row.getLong("post_time"); when = row.getLong("when_wall");
        showChronometer = row.getBoolean("show_chronometer"); countDown = row.getBoolean("count_down");
        publishedClockKnown = row.getBoolean("published_clock_known"); publishedWall = row.getLong("published_wall"); publishedElapsed = row.getLong("published_elapsed");
        if (key.isEmpty() || !pkg.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)*") || !generation.matches("[0-9a-f]{33,48}")
                || uid < 0 || user != expectedUser || uid / 100000 != user || revision < 1
                || publishedClockKnown && (publishedWall <= 0 || publishedElapsed < 0)) throw new SecurityException();
    }
    boolean sameLifetime(AtomicWorkbenchNotificationRecord other) { return other != null && key.equals(other.key) && generation.equals(other.generation)
            && uid == other.uid && user == other.user && pkg.equals(other.pkg); }
    String structuredKind() {
        if (!showChronometer) return "";
        if (countDown) return "timer";
        return "stopwatch".equals(category) ? "stopwatch" : "";
    }
    private static String string(Bundle row, String key, int max) {
        Object raw = row.get(key); if (!(raw instanceof String)) throw new SecurityException(); String value = (String) raw;
        if (value.length() > max) throw new SecurityException();
        for (int i = 0; i < value.length(); i++) if (Character.isISOControl(value.charAt(i))) throw new SecurityException(); return value;
    }
}
