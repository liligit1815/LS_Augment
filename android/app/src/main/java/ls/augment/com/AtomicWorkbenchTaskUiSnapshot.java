package ls.augment.com;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** A bounded, immutable task picker observation. It never grants authority to mutate a Task. */
final class AtomicWorkbenchTaskUiSnapshot {
    static final class Window {
        final int id, displayId;
        final String session, name, unique;
        final List<AtomicWorkbenchTaskIdentity> tasks;
        Window(Bundle b,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
            id = AtomicWorkbenchTaskIdentity.integer(b, "window_id");
            displayId = AtomicWorkbenchTaskIdentity.integer(b, "display_id");
            session = AtomicWorkbenchTaskIdentity.string(b, "window_session");
            name = AtomicWorkbenchTaskIdentity.string(b, "display_name");
            unique = AtomicWorkbenchTaskIdentity.string(b, "display_unique");
            if (!reader.contains(id) || displayId <= 0) throw new IllegalArgumentException("task_window");
            AtomicWorkbenchTaskIdentity.session(session, false);
            AtomicWorkbenchTaskIdentity.display(displayId, name, unique);
            ArrayList<Bundle> raw = b.getParcelableArrayList("tasks");
            if (raw == null || raw.size() > 64) throw new IllegalArgumentException("task_window_tasks");
            ArrayList<AtomicWorkbenchTaskIdentity> values = new ArrayList<>();
            java.util.HashSet<String> seen = new java.util.HashSet<>();
            for (Bundle item : raw) {
                AtomicWorkbenchTaskIdentity task = AtomicWorkbenchTaskIdentity.fromBundle(item);
                if (!task.leaf || task.displayId != displayId || !name.equals(task.displayName)
                        || !unique.equals(task.displayUnique) || !seen.add(task.taskGeneration))
                    throw new IllegalArgumentException("task_window_identity");
                values.add(task);
            }
            tasks = Collections.unmodifiableList(values);
        }
        boolean matches(int display, String displayUnique, String windowSession) {
            return displayId == display && unique.equals(displayUnique) && session.equals(windowSession);
        }
        boolean contains(AtomicWorkbenchTaskIdentity expected) {
            for (AtomicWorkbenchTaskIdentity task : tasks) if (task.equals(expected)) return true;
            return false;
        }
    }
    static final class Entry {
        final String shelfId, sourceSession;
        final int sourceSlot;
        final AtomicWorkbenchTaskIdentity identity;
        Entry(Bundle b, long revision,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
            if (!Boolean.TRUE.equals(b.get("can_restore")) || !Boolean.FALSE.equals(b.get("pending"))
                    || AtomicWorkbenchTaskIdentity.number(b, "revision") != revision)
                throw new IllegalArgumentException("task_entry_unavailable");
            shelfId = AtomicWorkbenchTaskIdentity.string(b, "shelf_id");
            sourceSession = AtomicWorkbenchTaskIdentity.string(b, "source_window_session");
            sourceSlot = AtomicWorkbenchTaskIdentity.integer(b, "source_slot");
            AtomicWorkbenchTaskIdentity.hex(shelfId, false); AtomicWorkbenchTaskIdentity.session(sourceSession, false);
            identity = AtomicWorkbenchTaskIdentity.fromBundle(AtomicWorkbenchTaskIdentity.bundle(b, "identity"));
            if (!reader.contains(sourceSlot) || identity.displayId != 0 || !identity.leaf)
                throw new IllegalArgumentException("task_entry_identity");
        }
    }
    final long revision, inputRevision;
    final String primaryName, primaryUnique;
    final List<Window> windows;
    final List<Entry> entries;
    private final java.util.Map<AtomicWorkbenchTaskIdentity, String> references;
    AtomicWorkbenchTaskUiSnapshot(Bundle state) {
        this(state,AtomicWorkbenchRecoveryScope.ReaderProfile.LOW4);
    }
    AtomicWorkbenchTaskUiSnapshot(Bundle state,AtomicWorkbenchRecoveryScope.ReaderProfile reader) {
        if(reader==null) throw new IllegalArgumentException("task_snapshot_reader");
        if (state == null || !Boolean.TRUE.equals(state.get("success"))
                || !Boolean.FALSE.equals(state.get("operation_unconfirmed"))
                || !Boolean.FALSE.equals(state.get("cleanup_pending"))) throw new IllegalArgumentException("task_snapshot_unknown");
        revision = AtomicWorkbenchTaskIdentity.number(state, "shelf_revision");
        inputRevision = AtomicWorkbenchTaskIdentity.number(state, "input_revision");
        if (revision < 0 || inputRevision < 0) throw new IllegalArgumentException("task_snapshot_revision");
        Bundle primary = AtomicWorkbenchTaskIdentity.bundle(state, "primary_display");
        if (AtomicWorkbenchTaskIdentity.integer(primary, "display_id") != 0) throw new IllegalArgumentException("task_primary");
        primaryName = AtomicWorkbenchTaskIdentity.string(primary, "display_name");
        primaryUnique = AtomicWorkbenchTaskIdentity.string(primary, "display_unique");
        AtomicWorkbenchTaskIdentity.display(0, primaryName, primaryUnique);
        ArrayList<Bundle> rawWindows = state.getParcelableArrayList("windows"), rawEntries = state.getParcelableArrayList("entries");
        if (rawWindows == null || rawWindows.size() > reader.poolCount || rawEntries == null || rawEntries.size() > 80)
            throw new IllegalArgumentException("task_snapshot_size");
        ArrayList<Window> w = new ArrayList<>(); java.util.HashSet<Integer> ids = new java.util.HashSet<>();
        for (Bundle item : rawWindows) { Window window = new Window(item,reader); if (!ids.add(window.id)) throw new IllegalArgumentException("task_window_duplicate"); w.add(window); }
        ArrayList<Entry> e = new ArrayList<>(); java.util.HashSet<String> shelves = new java.util.HashSet<>();
        java.util.LinkedHashMap<AtomicWorkbenchTaskIdentity, String> retained = new java.util.LinkedHashMap<>();
        for (Bundle item : rawEntries) {
            if(!reader.contains(AtomicWorkbenchTaskIdentity.integer(item,"source_slot")))
                throw new IllegalArgumentException("task_entry_identity");
            AtomicWorkbenchTaskIdentity identity = AtomicWorkbenchTaskIdentity.fromBundle(AtomicWorkbenchTaskIdentity.bundle(item, "identity"));
            String shelf = AtomicWorkbenchTaskIdentity.string(item, "shelf_id"); AtomicWorkbenchTaskIdentity.hex(shelf, false);
            if (!shelves.add(shelf)) throw new IllegalArgumentException("task_entry_duplicate");
            for (AtomicWorkbenchTaskIdentity previous : retained.keySet())
                if (previous.sameTask(identity)) throw new IllegalArgumentException("task_reference_duplicate");
            retained.put(identity, shelf);
            if (!Boolean.TRUE.equals(item.get("can_restore"))) continue;
            Entry entry = new Entry(item, revision,reader);
            e.add(entry);
        }
        windows = Collections.unmodifiableList(w); entries = Collections.unmodifiableList(e);
        references = Collections.unmodifiableMap(retained);
    }
    Window window(int id) { for (Window window : windows) if (window.id == id) return window; return null; }
    Entry entry(String shelfId) { for (Entry entry : entries) if (entry.shelfId.equals(shelfId)) return entry; return null; }
    static String nonce() { return java.util.UUID.randomUUID().toString().replace("-", ""); }
    AtomicWorkbenchTaskOperationRequest action(Window expectedWindow, AtomicWorkbenchTaskIdentity task,
            AtomicWorkbenchTaskOperationRequest.Action action, long now, String confirmation) {
        Window current = window(expectedWindow.id);
        if (action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE || current == null
                || !current.matches(expectedWindow.displayId, expectedWindow.unique, expectedWindow.session)
                || !current.contains(task)) throw new IllegalArgumentException("task_selection_stale");
        boolean end = action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK;
        String shelf = null;
        for (java.util.Map.Entry<AtomicWorkbenchTaskIdentity, String> reference : references.entrySet())
            if (reference.getKey().sameTask(task)) { shelf = reference.getValue(); break; }
        return new AtomicWorkbenchTaskOperationRequest(nonce(), action, task, current.id, current.session,
                end ? task.displayId : 0, end ? task.displayName : primaryName, end ? task.displayUnique : primaryUnique,
                -1, "", shelf == null ? nonce() : shelf, revision, inputRevision, now, now + 4500, end ? confirmation : "");
    }
    AtomicWorkbenchTaskOperationRequest restore(Entry expected, Window target, long now) {
        Entry current = entry(expected.shelfId); Window receiver = window(target.id);
        if (current == null || !current.identity.equals(expected.identity) || current.sourceSlot != expected.sourceSlot
                || !current.sourceSession.equals(expected.sourceSession) || receiver == null || !receiver.tasks.isEmpty()
                || !receiver.matches(target.displayId, target.unique, target.session)) throw new IllegalArgumentException("task_restore_stale");
        return new AtomicWorkbenchTaskOperationRequest(nonce(), AtomicWorkbenchTaskOperationRequest.Action.RESTORE,
                current.identity, current.sourceSlot, current.sourceSession, receiver.displayId, receiver.name, receiver.unique,
                receiver.id, receiver.session, current.shelfId, revision, inputRevision, now, now + 4500, "");
    }
}
