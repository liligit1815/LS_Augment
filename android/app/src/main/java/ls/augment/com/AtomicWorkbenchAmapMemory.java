package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.SystemClock;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/** One authenticated, transient route frame for the currently consuming workspace. */
final class AtomicWorkbenchAmapMemory {
    private static final Set<String> REGISTER_KEYS = new HashSet<>(Arrays.asList("version", "producer", "route"));
    private static final Set<String> PUBLISH_KEYS = new HashSet<>(Arrays.asList("version", "producer", "route",
            "writer", "session", "sequence", "status", "source", "title", "content", "elapsed"));
    private static final Set<String> STRUCTURED_KEYS = new HashSet<>(PUBLISH_KEYS);
    static { STRUCTURED_KEYS.add(AtomicWorkbenchAmapData.METRICS); }
    private Object owner;
    private long ownerStarted, consumerTouched;
    private Registration registration;

    private final class Registration {
        final int uid, pid;
        final IBinder producer;
        final long route;
        final String writer = token();
        final IBinder.DeathRecipient death = () -> died(this);
        long sequence, received, sampled;
        String status = "waiting", source = "", title = "", content = "";
        Bundle metrics;
        Registration(int uid, int pid, IBinder producer, long route) {
            this.uid = uid; this.pid = pid; this.producer = producer; this.route = route;
        }
    }

    synchronized void touch(Object currentOwner, long started) {
        if (currentOwner == null || started <= 0L) { reset(); return; }
        if (owner != currentOwner || ownerStarted != started) {
            reset(); owner = currentOwner; ownerStarted = started;
        }
        consumerTouched = SystemClock.elapsedRealtime();
    }

    synchronized void stop(Object currentOwner) { if (currentOwner == null || owner == currentOwner) reset(); }

    synchronized Bundle register(Object currentOwner, int uid, int pid, Bundle request) {
        if (!consumer(currentOwner) || uid < 0 || pid <= 0 || !shape(request, REGISTER_KEYS)) return rejected();
        IBinder producer = request.getBinder("producer");
        long route = request.getLong("route", -1L);
        if (producer == null || !producer.isBinderAlive() || route <= 0L) return rejected();
        Registration previous = registration;
        if (previous != null && previous.producer.isBinderAlive()) {
            if (previous.uid != uid || previous.pid != pid || !Objects.equals(previous.producer, producer)
                    || route < previous.route) return rejected();
            if (route == previous.route) return credentials(previous);
        }
        Registration next = new Registration(uid, pid, producer, route);
        try { producer.linkToDeath(next.death, 0); }
        catch (RemoteException dead) { return rejected(); }
        unlink(previous); registration = next;
        return credentials(next);
    }

    synchronized Bundle publish(Object currentOwner, int uid, int pid, Bundle request) {
        if (!consumer(currentOwner) || !(shape(request, PUBLISH_KEYS) || shape(request, STRUCTURED_KEYS))) return rejected();
        Registration value = registration;
        if (value == null || value.uid != uid || value.pid != pid || !value.producer.isBinderAlive()
                || !Objects.equals(value.producer, request.getBinder("producer"))
                || request.getLong("route", -1L) != value.route
                || request.getLong("session", -1L) != ownerStarted
                || !sameToken(value.writer, request.getString("writer", ""))) return rejected();
        long now = SystemClock.elapsedRealtime(), sampled = request.getLong("elapsed", -1L);
        long sequence = request.getLong("sequence", -1L);
        String status = request.getString("status", ""), source = request.getString("source", "");
        String title = request.getString("title", ""), content = request.getString("content", "");
        boolean ended = "ended".equals(status), spoken = "spoken".equals(source);
        boolean structured = "structured".equals(source), hasMetrics = request.containsKey(AtomicWorkbenchAmapData.METRICS);
        Bundle metrics;
        try { metrics = hasMetrics ? AtomicWorkbenchAmapData.structured(request.getBundle(AtomicWorkbenchAmapData.METRICS)) : null; }
        catch (RuntimeException malformed) { return rejected(); }
        if (hasMetrics && (metrics == null || !structured || ended) || structured && metrics == null) return rejected();
        String cleanTitle = AtomicWorkbenchAmapData.text(title), cleanContent = AtomicWorkbenchAmapData.text(content);
        if (sequence <= value.sequence || sampled < ownerStarted || sampled > now
                || title == null || content == null || title.length() > 160 || content.length() > 160
                || !ended && (!"active".equals(status) || !(structured || spoken || "drive".equals(source) || "walk_ride".equals(source))
                || !AtomicWorkbenchAmapData.fresh(now, sampled, spoken)
                || !structured && !(AtomicWorkbenchAmapData.guidance(cleanTitle) || AtomicWorkbenchAmapData.guidance(cleanContent)))) return rejected();
        if ("ended".equals(value.status) && !ended) return rejected();
        if (!ended && !structured && "active".equals(value.status) && "structured".equals(value.source)
                && value.metrics != null && AtomicWorkbenchAmapData.fresh(now, value.sampled)
                && AtomicWorkbenchAmapData.fresh(now, value.received)) {
            // Consume sequence order without allowing a later TTS callback to replace the
            // fresh route card or extend its sampling/receiving freshness window.
            value.sequence = sequence;
            Bundle response = new Bundle(); response.putBoolean("success", true); return response;
        }
        value.sequence = sequence; value.received = now; value.sampled = sampled; value.status = status;
        value.source = ended ? "" : source;
        value.title = ended ? "" : cleanTitle;
        value.content = ended ? "" : cleanContent;
        value.metrics = ended || metrics == null ? null : new Bundle(metrics);
        Bundle response = new Bundle(); response.putBoolean("success", true); return response;
    }

    synchronized Bundle merge(Object currentOwner, Bundle fallback) {
        String fallbackStatus = fallback == null ? "" : fallback.getString("navigation_status", "");
        if (fallback == null || !fallback.getBoolean("owner_user_current", false)
                || !Arrays.asList("active", "no_navigation", "no_guidance", "permission_denied", "unsupported", "temporary_error").contains(fallbackStatus)) {
            stop(currentOwner); return fallback;
        }
        if (!consumer(currentOwner)) return fallback;
        Registration value = registration;
        if (value == null) return fallback;
        if (!value.producer.isBinderAlive()) { died(value); return fallback; }
        boolean amapFallback = AtomicWorkbenchAmapData.PACKAGE.equals(fallback.getString("package", ""));
        if ("ended".equals(value.status)) return amapFallback ? empty("ended") : fallback;
        if (!"active".equals(value.status)) return fallback;
        long now = SystemClock.elapsedRealtime();
        boolean spoken = "spoken".equals(value.source);
        if (!AtomicWorkbenchAmapData.fresh(now, value.sampled, spoken)
                || !AtomicWorkbenchAmapData.fresh(now, value.received, spoken)) {
            value.title = value.content = ""; value.metrics = null; value.status = "expired"; return fallback;
        }
        // Current notification instructions take precedence over older spoken guidance.
        if (spoken && fallback.getBoolean("has_guidance", false)) return fallback;
        Bundle state = empty("active");
        state.putBoolean("active", true); state.putBoolean("has_session", true); state.putBoolean("has_guidance", true);
        state.putString("package", AtomicWorkbenchAmapData.PACKAGE);
        Object sourceGeneration=fallback.get("navigation_source_generation");
        if(amapFallback&&sourceGeneration instanceof String&&((String)sourceGeneration).matches("[0-9a-f]{33,48}"))state.putString("navigation_source_generation",(String)sourceGeneration);
        boolean structured = "structured".equals(value.source) && value.metrics != null;
        state.putString("title", structured ? "实时路线导航" : value.title.isEmpty() ? value.content : value.title);
        state.putString("subtitle", spoken ? "最近导航播报 · " + Math.max(0L, (now - value.sampled) / 1000L) + "秒前"
                : value.title.isEmpty() ? "" : value.content);
        if (structured) state.putBundle(AtomicWorkbenchAmapData.METRICS, new Bundle(value.metrics));
        state.putLong("navigation_elapsed", value.sampled);
        state.putString("navigation_source", structured ? "amap_memory_structured" : spoken ? "amap_memory_spoken" : "amap_memory_route");
        return state;
    }

    private boolean consumer(Object currentOwner) {
        long now = SystemClock.elapsedRealtime();
        if (owner == null || owner != currentOwner || consumerTouched <= 0L || now < consumerTouched
                || now - consumerTouched > AtomicWorkbenchAmapData.CONSUMER_MAX_AGE_MS) {
            reset(); return false;
        }
        return true;
    }

    private synchronized void died(Registration value) {
        if (registration == value) { unlink(value); registration = null; }
    }

    private void reset() {
        unlink(registration); registration = null; owner = null; ownerStarted = consumerTouched = 0L;
    }

    private static void unlink(Registration value) {
        if (value != null) try { value.producer.unlinkToDeath(value.death, 0); } catch (RuntimeException ignored) { }
    }

    private Bundle credentials(Registration value) {
        Bundle result = new Bundle(); result.putBoolean("success", true);
        result.putString("writer", value.writer); result.putLong("session", ownerStarted); return result;
    }

    private static boolean shape(Bundle value, Set<String> allowed) {
        return value != null && value.getInt("version", -1) == AtomicWorkbenchAmapData.CONTRACT
                && value.keySet().equals(allowed);
    }

    private static Bundle rejected() { Bundle result = new Bundle(); result.putBoolean("success", false); return result; }

    private static Bundle empty(String status) {
        Bundle result = new Bundle(); result.putBoolean("success", true); result.putBoolean("available", true);
        result.putBoolean("owner_user_current", true); result.putString("navigation_status", status);
        result.putBoolean("active", false); result.putBoolean("has_session", false); result.putBoolean("has_guidance", false);
        result.putString("package", ""); result.putString("title", ""); result.putString("subtitle", "");
        result.putString("subtext", ""); result.putString("message", ""); return result;
    }

    private static String token() {
        byte[] bytes = new byte[32]; new SecureRandom().nextBytes(bytes);
        StringBuilder value = new StringBuilder(64);
        for (byte item : bytes) value.append(String.format(java.util.Locale.ROOT, "%02x", item & 255));
        return value.toString();
    }

    private static boolean sameToken(String expected, String actual) {
        if (actual == null || actual.length() != 64 || expected.length() != 64) return false;
        int different = 0; for (int i = 0; i < 64; i++) different |= expected.charAt(i) ^ actual.charAt(i);
        return different == 0;
    }
}
