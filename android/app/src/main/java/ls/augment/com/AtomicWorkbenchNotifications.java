package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/** Phone Root backend for real public notification chronometers. Public actions require an explicit request and a published capability. */
final class AtomicWorkbenchNotifications implements AutoCloseable {
    private static final int MAX_CARDS = 16, MAX_RECORDS = 32, MAX_REQUESTS = 128;
    private static final Set<String> RECORD_KEYS = Set.of("schema", "request_id", "source_id", "source_generation", "source_revision", "created_elapsed", "deadline_elapsed");
    private final Context context;
    private final int user;
    private final AtomicWorkbenchNotificationEvidenceClient client;
    private final AtomicWorkbenchNotificationActionClient actionClient;
    private final Map<String, Source> sources = new LinkedHashMap<>();
    private final Map<String, Long> seen = new LinkedHashMap<>();
    private long eventRevision;
    private boolean closed, limited;
    AtomicWorkbenchNotifications(Context context, int user, AtomicWorkbenchMediaSessionEvidenceClient.Principal principal) {
        if (Process.myUid() != 0 || context == null || user < 0 || user > Integer.MAX_VALUE / 100000) throw new SecurityException();
        this.context = context; this.user = user; client = new AtomicWorkbenchNotificationEvidenceClient(user, principal); actionClient = new AtomicWorkbenchNotificationActionClient(principal);
    }
    Bundle state() {
        if (closed) return unavailable("closed");
        try { AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh = refresh(); return fresh == null ? unavailable("unavailable") : snapshot(fresh); }
        catch (ReflectiveOperationException | RuntimeException | LinkageError failed) { return unavailable("unavailable"); }
    }

    /** New Root route only. Legacy state()/04 and local timer records keep schema 1. */
    Bundle stateWithActions(Bundle selection) {
        try {
            if (selection == null || !selection.keySet().equals(Set.of("selected_source_id"))
                    || !(selection.get("selected_source_id") instanceof String)) throw new SecurityException();
            String selected = selection.getString("selected_source_id");
            if (!selected.isEmpty() && !selected.matches("[0-9a-f]{32}")) throw new SecurityException();
            AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh = refresh();
            Bundle result = fresh == null ? unavailable("unavailable") : snapshot(fresh);
            result.putInt("schema", 2); boolean actionsAvailable = false;
            Source chosen = findSource(selected); Bundle description = null;
            if (fresh != null && chosen != null) {
                description = actionClient.exchange("describe", chosen.record, -1, "", newRequestId());
                actionsAvailable = description.getBoolean("success");
            }
            long until = fresh == null ? 0 : Math.addExact(fresh.elapsed, 2000L);
            ArrayList<Bundle> cards = result.getParcelableArrayList("cards", Bundle.class);
            for (Bundle card : cards) {
                Source source = findSource(card.getString("source_id"));
                boolean current = source != null && fresh != null && SystemClock.elapsedRealtime() < until;
                boolean hasActions = current && source == chosen && actionsAvailable && publicLabels(description);
                card.putBoolean("can_describe_actions", hasActions);
                card.putBoolean("can_open_source", current && launcher(source) != null);
                card.putLong("capabilities_until_elapsed", current ? until : 0);
                card.putString("actions_status", source == chosen ? actionsAvailable ? "ready" : "unavailable" : "not_selected");
            }
            result.putBoolean("notification_actions_available", actionsAvailable);
            result.putString("actions_status", selected.isEmpty() ? "not_selected" : actionsAvailable ? "public_actions" : "unavailable");
            return result;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
            Bundle result = unavailable("unavailable"); result.putInt("schema", 2);
            ArrayList<Bundle> cards = result.getParcelableArrayList("cards", Bundle.class);
            for (Bundle card : cards) {
                card.putBoolean("can_describe_actions", false); card.putBoolean("can_open_source", false);
                card.putLong("capabilities_until_elapsed", 0); card.putString("actions_status", "unavailable");
            }
            result.putString("actions_status", "unavailable"); return result;
        }
    }

    Bundle action(String operation, Bundle metadata) {
        String id = "", sourceId = "", generation = ""; long revision = 0;
        try {
            if (!Set.of("describe", "send", "describe_open", "confirm_sent").contains(operation) || metadata == null) throw new SecurityException();
            Bundle request = new Bundle(metadata);
            if (!request.keySet().equals(Set.of("schema", "request_id", "source_id", "source_generation", "source_revision",
                    "created_elapsed", "deadline_elapsed", "index", "action_id"))
                    || !(request.get("schema") instanceof Integer) || request.getInt("schema") != 1
                    || !(request.get("request_id") instanceof String) || !request.getString("request_id").matches("[0-9a-f]{32}")
                    || !(request.get("source_id") instanceof String) || !request.getString("source_id").matches("[0-9a-f]{32}")
                    || !(request.get("source_generation") instanceof String) || !(request.get("source_revision") instanceof Long)
                    || !(request.get("created_elapsed") instanceof Long) || !(request.get("deadline_elapsed") instanceof Long)
                    || !(request.get("index") instanceof Integer) || !(request.get("action_id") instanceof String)) throw new SecurityException();
            id=request.getString("request_id"); sourceId=request.getString("source_id"); generation=request.getString("source_generation"); revision=request.getLong("source_revision");
            deadline(request); if (closed || refresh() == null) throw new SecurityException();
            Source source = findSource(sourceId);
            if (source == null || !source.record.generation.equals(generation) || source.record.revision != revision) throw new SecurityException();
            int index = request.getInt("index"); String actionId = request.getString("action_id");
            if (!Set.of("describe","describe_open").contains(operation) ? index < 0 || index >= 8 || !actionId.matches("[0-9a-f]{32}")
                    : index != -1 || !actionId.isEmpty()) throw new SecurityException();
            if ("describe_open".equals(operation)) {
                android.content.ComponentName component = launcher(source); if (component == null) throw new SecurityException();
                deadline(request); requireCurrentUser();
                Bundle result = AtomicWorkbenchNotificationOpenRequest.of(source.id, generation, revision, component.flattenToString(),
                        source.record.pkg, user, source.record.uid, request.getLong("deadline_elapsed")).descriptor();
                result.putBoolean("success", true); return result;
            }
            if ("confirm_sent".equals(operation)) {
                if (!id.equals(source.sentRequests[index]) || !actionId.equals(source.sentTokens[index])) throw new SecurityException();
                Bundle wire = actionClient.exchange(operation, source.record, index, actionId, id);
                if (!wire.getBoolean("success") || !"confirmed".equals(wire.getString("status"))) throw new SecurityException();
                source.blockedActions &= ~(1 << index);source.sentRequests[index]=null;source.sentTokens[index]=null;
                Bundle result=actionResult(operation,id,sourceId,generation,revision,"confirmed");result.putBoolean("success",true);return result;
            }
            if ("send".equals(operation)) {
                long now=SystemClock.elapsedRealtime(); seen.entrySet().removeIf(entry -> entry.getValue() <= now);
                if (seen.size() >= MAX_REQUESTS || seen.containsKey(id) || (source.blockedActions & (1 << index)) != 0) throw new SecurityException();
                // Before the single exchange: an ambiguous Root/system reply never triggers a replay.
                seen.put(id, request.getLong("deadline_elapsed")); source.blockedActions |= 1 << index;
            }
            Bundle wire = actionClient.exchange(operation, source.record, index, actionId, id);
            if ("send".equals(operation) && wire.getBoolean("sent")) { source.sentRequests[index]=id;source.sentTokens[index]=actionId; }
            Bundle result = actionResult(operation, id, sourceId, generation, revision, wire.getString("status", "unavailable"));
            result.putBoolean("success", wire.getBoolean("success")); result.putBoolean("sent", wire.getBoolean("sent"));
            result.putLong("valid_until_elapsed", wire.getLong("valid_until_elapsed",0)); result.putBoolean("limited",wire.getBoolean("limited"));
            ArrayList<Bundle> rows = wire.getParcelableArrayList("actions", Bundle.class);
            if (rows != null) {
                ArrayList<Bundle> copies = new ArrayList<>();
                for (Bundle original : rows) {
                    Bundle row = new Bundle(original);
                    if ((source.blockedActions & (1 << row.getInt("index"))) != 0) {
                        row.putBoolean("enabled",false);row.putString("status","already_requested");row.putString("action_id","");
                    }
                    copies.add(row);
                }
                result.putParcelableArrayList("actions",copies);
            }
            return result;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError rejected) {
            return actionResult(operation,id,sourceId,generation,revision,"send".equals(operation)?"outcome_unknown":"rejected");
        }
    }

    boolean openCurrent(AtomicWorkbenchNotificationOpenRequest target) {
        try {
            long now=SystemClock.elapsedRealtime(); if(target==null || target.userId!=user || !target.fresh(now) || refresh()==null)return false;
            Source source=findSource(target.sourceId);
            if(source==null || !source.record.generation.equals(target.generation) || source.record.revision!=target.revision
                    || source.record.uid!=target.ownerUid || !source.record.pkg.equals(target.packageName))return false;
            android.content.ComponentName component=launcher(source);requireCurrentUser();
            return component!=null && component.flattenToString().equals(target.component) && target.fresh(SystemClock.elapsedRealtime());
        } catch(ReflectiveOperationException | RuntimeException | LinkageError unknown){return false;}
    }
    private Source findSource(String id){for(Source source:sources.values())if(source.id.equals(id))return source;return null;}
    private static String newRequestId(){return UUID.randomUUID().toString().replace("-","");}
    private static boolean publicLabels(Bundle result){
        if(result==null)return false;ArrayList<Bundle> rows=result.getParcelableArrayList("actions",Bundle.class);
        if(rows!=null)for(Bundle row:rows)if(!row.getString("label","").isEmpty())return true;return false;
    }
    private static Bundle actionResult(String operation,String id,String source,String generation,long revision,String status){
        Bundle result=new Bundle();result.putInt("schema",1);result.putBoolean("success",false);result.putString("operation",operation);
        result.putString("request_id",id);result.putString("source_id",source);result.putString("source_generation",generation);result.putLong("source_revision",revision);
        result.putString("status",status);result.putBoolean("sent",false);result.putLong("valid_until_elapsed",0);result.putBoolean("limited",false);
        result.putParcelableArrayList("actions",new ArrayList<Bundle>());return result;
    }
    /** Same public Launcher conditions as M06, using this notification's independent identity. */
    private android.content.ComponentName launcher(Source source) {
        try {
            requireCurrentUser();if(source==null||!owner(source.record))return null;
            Context scoped=(Context)Context.class.getMethod("createContextAsUser",android.os.UserHandle.class,int.class)
                    .invoke(context,android.os.UserHandle.getUserHandleForUid(user*100000),0);
            android.content.pm.PackageManager pm=scoped.getPackageManager();
            android.content.Intent launch=pm.getLaunchIntentForPackage(source.record.pkg);
            android.content.ComponentName component=launch==null?null:launch.getComponent();
            if(component==null||!component.getPackageName().equals(source.record.pkg))return null;
            android.content.pm.ActivityInfo info=pm.getActivityInfo(component,0);
            return info!=null&&info.enabled&&info.exported&&info.applicationInfo!=null&&info.applicationInfo.enabled
                    &&info.applicationInfo.uid==source.record.uid&&(info.permission==null||info.permission.isEmpty())?component:null;
        } catch(ReflectiveOperationException | android.content.pm.PackageManager.NameNotFoundException | RuntimeException | LinkageError unavailable){return null;}
    }

    /** A local record of this actual timer sample, not the stopwatch's source-owned lap action. */
    Bundle recordTimer(Bundle metadata) {
        boolean stored = false;
        try {
            if (closed || metadata == null) throw new SecurityException(); Bundle request = new Bundle(metadata);
            if (!request.keySet().equals(RECORD_KEYS) || !(request.get("schema") instanceof Integer) || request.getInt("schema") != 1
                    || !(request.get("request_id") instanceof String) || !request.getString("request_id").matches("[0-9a-f]{32}")
                    || !(request.get("source_id") instanceof String) || !request.getString("source_id").matches("[0-9a-f]{32}")
                    || !(request.get("source_generation") instanceof String) || !(request.get("source_revision") instanceof Long)
                    || !(request.get("created_elapsed") instanceof Long) || !(request.get("deadline_elapsed") instanceof Long)) throw new SecurityException();
            deadline(request); AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh = refresh(); if (fresh == null) throw new SecurityException();
            Source target = null; for (Source source : sources.values()) if (source.id.equals(request.getString("source_id"))) target = source;
            if (target == null || !"timer".equals(target.kind) || !target.record.generation.equals(request.getString("source_generation"))
                    || target.record.revision != request.getLong("source_revision")) throw new SecurityException();
            Time time = time(target, fresh); if (!time.known) throw new SecurityException(); requireCurrentUser(); deadline(request);
            long now = SystemClock.elapsedRealtime(); seen.entrySet().removeIf(entry -> entry.getValue() <= now);
            if (seen.size() >= MAX_REQUESTS || seen.containsKey(request.getString("request_id")) || target.records.size() >= MAX_RECORDS) throw new SecurityException();
            seen.put(request.getString("request_id"), request.getLong("deadline_elapsed"));
            Bundle record = new Bundle(); record.putLong("time_ms", time.value); record.putLong("sample_elapsed", time.sample); record.putInt("number", target.records.size() + 1);
            target.records.add(record); stored = true;
            Bundle result = snapshot(fresh); result.putBoolean("record_stored", true); return result;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failed) {
            Bundle result = unavailable("record_rejected"); result.putBoolean("record_stored", stored); return result;
        }
    }

    private AtomicWorkbenchNotificationEvidenceClient.Snapshot refresh() throws ReflectiveOperationException {
        requireCurrentUser(); AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh = client.query(); requireCurrentUser(); if (fresh == null) return null;
        List<AtomicWorkbenchNotificationRecord> ordered = new ArrayList<>(fresh.records);
        ordered.sort(Comparator.comparingLong((AtomicWorkbenchNotificationRecord record) -> record.postTime).thenComparing(record -> record.key));
        Set<String> present = new HashSet<>(); for (AtomicWorkbenchNotificationRecord record : ordered) present.add(record.key);
        sources.keySet().retainAll(present);
        Set<String> live = new HashSet<>(); limited = false;
        for (AtomicWorkbenchNotificationRecord record : ordered) {
            if (!owner(record)) continue;
            Source old = sources.get(record.key); String kind = record.structuredKind();
            if (old != null && !old.record.sameLifetime(record)) { sources.remove(record.key); old = null; }
            // Keep a confirmed source's page/history while its same live notification stops exposing time.
            if (kind.isEmpty() && old != null) kind = old.kind;
            if (kind.isEmpty()) continue;
            if (old == null || !old.kind.equals(kind)) {
                if (old == null && sources.size() >= MAX_CARDS) { limited = true; continue; }
                old = new Source(record, kind, ++eventRevision); sources.put(record.key, old);
            }
            old.update(record, fresh); live.add(record.key);
        }
        sources.keySet().retainAll(live); requireCurrentUser(); return fresh;
    }
    private boolean owner(AtomicWorkbenchNotificationRecord record) throws ReflectiveOperationException {
        Object pm = context.getPackageManager(); Object uid = pm.getClass().getMethod("getPackageUidAsUser", String.class, int.class).invoke(pm, record.pkg, user);
        return uid instanceof Integer && (Integer) uid == record.uid;
    }
    private void requireCurrentUser() throws ReflectiveOperationException {
        if (Process.myUid() != 0 || closed) throw new SecurityException();
        Object current = Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
        if (!(current instanceof Integer) || (Integer) current != user) { sources.clear(); throw new SecurityException(); }
    }
    private Bundle snapshot(AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh) throws ReflectiveOperationException {
        requireCurrentUser(); Bundle result = base(true, "ready"); ArrayList<Bundle> cards = new ArrayList<>();
        for (Source source : sources.values()) cards.add(card(source, fresh));
        result.putParcelableArrayList("cards", cards); result.putBoolean("cards_limited", limited); result.putInt("card_count", cards.size());
        Parcel size = Parcel.obtain(); try { size.writeBundle(result); if (size.dataSize() > 96 * 1024) return unavailable("scan_limited"); } finally { size.recycle(); }
        requireCurrentUser(); return result;
    }
    private Bundle unavailable(String status) {
        Bundle result = base(false, status); ArrayList<Bundle> cards = new ArrayList<>();
        for (Source source : sources.values()) cards.add(card(source, null));
        result.putParcelableArrayList("cards", cards); result.putInt("card_count", cards.size()); result.putBoolean("cards_limited", limited); return result;
    }
    private Bundle base(boolean available, String status) {
        Bundle result = new Bundle(); result.putInt("schema", 1); result.putBoolean("success", available); result.putBoolean("available", available);
        result.putString("notification_status", status); result.putLong("event_revision", eventRevision); result.putBoolean("record_stored", false);
        result.putBoolean("recorder_available", false); result.putBoolean("notification_actions_available", false);
        result.putString("actions_status", "source_semantics_unavailable"); return result;
    }
    private Bundle card(Source source, AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh) {
        Bundle card = new Bundle(); card.putString("source_id", source.id); card.putString("source_generation", source.record.generation);
        card.putLong("source_revision", source.record.revision); card.putString("kind", source.kind); card.putInt("owner_uid", source.record.uid);
        card.putInt("user_id", user); card.putString("package", source.record.pkg); card.putLong("appeared_revision", source.appeared);
        Time time = time(source, fresh); card.putBoolean("time_known", time.known); card.putLong("time_ms", time.value); card.putLong("sample_elapsed", time.sample);
        card.putLong("valid_until_elapsed", time.known ? time.sample + 2000 : 0); card.putInt("display_resolution_ms", 1000);
        card.putBoolean("advancing", time.known); card.putBoolean("count_down", "timer".equals(source.kind));
        card.putBoolean("can_record", time.known && "timer".equals(source.kind) && source.records.size() < MAX_RECORDS);
        card.putBoolean("can_toggle", false); card.putBoolean("can_stop", false); card.putBoolean("can_lap", false);
        card.putString("time_status", time.known ? "public_chronometer" : source.clockChanged ? "clock_changed" : "unverified");
        ArrayList<Bundle> records = new ArrayList<>(); for (Bundle item : source.records) records.add(new Bundle(item));
        card.putParcelableArrayList("records", records); card.putBoolean("records_full", records.size() >= MAX_RECORDS); return card;
    }
    private static Time time(Source source, AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh) {
        if (fresh == null || !source.originKnown || !source.record.showChronometer || !source.kind.equals(source.record.structuredKind()) || source.record.when <= 0) return new Time();
        try {
            long now = SystemClock.elapsedRealtime(); if (now < fresh.elapsed || now - fresh.elapsed > 2000) return new Time();
            long base = source.origin;
            long value = "timer".equals(source.kind) ? Math.subtractExact(base, now) : Math.subtractExact(now, base);
            if ("stopwatch".equals(source.kind) && value < 0) return new Time(); return new Time(value, now);
        } catch (ArithmeticException unknown) { return new Time(); }
    }
    private static void deadline(Bundle request) {
        long made = request.getLong("created_elapsed"), end = request.getLong("deadline_elapsed"), now = SystemClock.elapsedRealtime();
        if (made < 0 || end <= made || end - made > 5000 || now < made || now >= end) throw new SecurityException();
    }
    private static final class Time {
        final boolean known; final long value, sample;
        Time() { known = false; value = sample = 0; } Time(long value, long sample) { known = true; this.value = value; this.sample = sample; }
    }
    private static final class Source {
        final String id = UUID.randomUUID().toString().replace("-", ""), kind; final long appeared;
        final ArrayList<Bundle> records = new ArrayList<>(); AtomicWorkbenchNotificationRecord record;
        int blockedActions;final String[] sentRequests=new String[8],sentTokens=new String[8];
        long origin, offset, anchoredRevision = -1, anchoredWhen; boolean originKnown, clockChanged, anchoredShow;
        Source(AtomicWorkbenchNotificationRecord record, String kind, long appeared) { this.record = record; this.kind = kind; this.appeared = appeared; }
        void update(AtomicWorkbenchNotificationRecord next, AtomicWorkbenchNotificationEvidenceClient.Snapshot fresh) {
            if (record.revision != next.revision) { blockedActions = 0;java.util.Arrays.fill(sentRequests,null);java.util.Arrays.fill(sentTokens,null); }
            record = next;
            try {
                long currentOffset = Math.subtractExact(fresh.wall, fresh.elapsed);
                if (anchoredRevision != next.revision) {
                    anchoredRevision = next.revision; anchoredWhen = next.when; anchoredShow = next.showChronometer;
                    offset = Math.subtractExact(next.publishedWall, next.publishedElapsed);
                    origin = Math.subtractExact(next.when, offset); originKnown = next.publishedClockKnown && next.when > 0 && next.showChronometer; clockChanged = false;
                } else {
                    long drift = Math.subtractExact(currentOffset, offset);
                    if (drift > 250 || drift < -250) { clockChanged = true; originKnown = false; }
                    if (anchoredWhen != next.when || anchoredShow != next.showChronometer) originKnown = false;
                }
                long drift = Math.subtractExact(currentOffset, offset);
                if (next.publishedClockKnown && (drift > 250 || drift < -250)) { clockChanged = true; originKnown = false; }
            } catch (ArithmeticException unknown) { originKnown = false; }
        }
    }
    @Override public void close() { closed = true; sources.clear(); seen.clear(); }
}
