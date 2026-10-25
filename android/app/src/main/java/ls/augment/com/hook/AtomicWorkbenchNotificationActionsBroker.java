package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.Parcel;
import android.os.SystemClock;
import android.os.UserHandle;
import android.os.UserManager;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import static ls.augment.com.hook.AtomicWorkbenchMediaEvidenceReflect.*;

/** Public published actions only. PendingIntents stay inside system_server. */
final class AtomicWorkbenchNotificationActionsBroker {
    static final int TX = 0x00D04E0A;
    private static final String DESCRIPTOR = "ls.augment.com.atomic_notification_actions.v1";
    private static final Set<String> KEYS = Set.of("operation", "key", "generation", "revision", "index", "request_id", "action_id");
    private static final int MAX_ACTIONS = 8, MAX_RECORDS = 256, MAX_CONSUMED = 256;
    // Owned by the actual NMS lock. No PI or notification contents are retained.
    private static final Map<Object, Map<String, Consumed>> CONSUMED = new java.util.WeakHashMap<>();
    private static final Map<Object, Map<String, ActionToken>> TOKENS = new java.util.WeakHashMap<>();
    private static final Map<Object, Map<String, Receipt>> RECEIPTS = new java.util.WeakHashMap<>();
    private static Method getSbn, getContext;
    private static volatile boolean ready;


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static void prepare(ClassLoader loader) {
        try {
            Class<?> nms = Class.forName("com.android.server.notification.NotificationManagerService", false, loader);
            Class<?> record = Class.forName("com.android.server.notification.NotificationRecord", false, loader);
            getSbn = method(record, "getSbn"); getContext = method(nms, "getContext");
            member(nms, "mNotificationLock"); member(nms, "mNotificationsByKey");
            ready = true;
        } catch (Throwable unavailable) { ready = false; }
    }

    static void handle(Object service, Parcel data, Parcel reply) {
        Bundle result = result("unavailable", "", "");
        boolean consumed = false, attempted = false;
        try {
            if (!ready || data == null || data.dataSize() > 8192) throw new SecurityException();
            Object lock = field(service, "mNotificationLock");
            // A nested local caller may already own NMS. Never make external calls there.
            if (Thread.holdsLock(lock)) throw new SecurityException();
            int uid = Binder.getCallingUid(), pid = Binder.getCallingPid();
            data.enforceInterface(DESCRIPTOR); if (data.readInt() != 1) throw new SecurityException();
            Bundle auth = data.readBundle(AtomicWorkbenchNotificationActionsBroker.class.getClassLoader());
            String nonce = data.readString(); long deadline = data.readLong();
            Bundle request = data.readBundle(AtomicWorkbenchNotificationActionsBroker.class.getClassLoader());
            if (data.dataAvail() != 0 || nonce == null || !nonce.matches("[0-9a-f]{32}")) throw new SecurityException();
            validate(request); AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
            String operation = request.getString("operation"), requestId = request.getString("request_id");
            result = result("rejected", nonce, requestId);
            if (service != AtomicWorkbenchNotificationEvidenceHook.localService()) throw new SecurityException();
            Context context = (Context) getContext.invoke(service);
            AtomicWorkbenchSystemRootAuthority.Session principal = AtomicWorkbenchSystemRootAuthority.authenticate(context, auth, uid, pid);
            requireUnlocked(context, principal.userId);
            if ("probe".equals(operation)) {
                if (!principal.isCurrent(context) || !principal.isAlive()) throw new SecurityException();
                AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
                result.putBoolean("success", true); result.putString("status", "ready");
            } else {
                Capture first;
                synchronized (lock) { first = capture(service, request, principal.userId); }
                // PI creator getters, lockscreen, PM and principal checks are all outside NMS.
                if ("confirm_sent".equals(operation)) {
                    int index = request.getInt("index");
                    if (!principal.isCurrent(context) || !principal.isAlive()) throw new SecurityException();
                    requireUnlocked(context, principal.userId); AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
                    synchronized (lock) {
                        if (!first.same(capture(service, request, principal.userId))) throw new SecurityException();
                        Map<String, Receipt> receipts = receipts(service); pruneReceipts(service, receipts);
                        String key = receiptKey(first.lease, index); Receipt receipt = receipts.get(key);
                        if (receipt == null || !receipt.sent || !receipt.request.equals(requestId)
                                || !receipt.token.id.equals(request.getString("action_id"))
                                || !receipt.token.sameIdentity(principal, first, index)) throw new SecurityException();
                        // App has already received and validated sent. This never dispatches a PI.
                        receipts.remove(key);
                    }
                    result.putBoolean("success", true); result.putString("status", "confirmed");
                } else if ("describe".equals(operation)) {
                    ArrayList<Bundle> rows = new ArrayList<>();
                    ArrayList<ActionToken> proposed = new ArrayList<>();
                    long expires = Math.addExact(SystemClock.elapsedRealtime(), 5000L);
                    for (int index = 0; index < first.actions.length; index++) {
                        rows.add(describe(context, first, index));
                        proposed.add(new ActionToken(principal, first, index, expires));
                    }
                    if (!principal.isCurrent(context) || !principal.isAlive()) throw new SecurityException();
                    requireUnlocked(context, principal.userId); AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
                    synchronized (lock) {
                        if (!first.same(capture(service, request, principal.userId))) throw new SecurityException();
                        Map<String, Consumed> ledger = ledger(service);
                        prune(service, ledger);
                        Map<String, ActionToken> tokens = tokens(service); pruneTokens(service, tokens);
                        Map<String, Receipt> receipts = receipts(service); pruneReceipts(service, receipts);
                        for (int index = 0; index < rows.size(); index++) {
                            Bundle row = rows.get(index);
                            if (row.getBoolean("enabled")) {
                                if (receipts.containsKey(receiptKey(first.lease, index))) {
                                    row.putBoolean("enabled", false); row.putString("status", "already_requested");
                                } else if (tokens.size() >= MAX_CONSUMED) {
                                    row.putBoolean("enabled", false); row.putString("status", "capacity_limited");
                                } else {
                                    ActionToken token = proposed.get(index); tokens.put(token.id, token);
                                    row.putString("action_id", token.id);
                                }
                            }
                        }
                    }
                    result.putParcelableArrayList("actions", rows);
                    result.putBoolean("limited", first.totalActions > MAX_ACTIONS);
                    result.putLong("valid_until_elapsed", expires);
                    result.putBoolean("success", true); result.putString("status", "ready");
                } else {
                    int index = request.getInt("index"); Receipt outgoing;
                    Bundle description = describe(context, first, index);
                    if (!description.getBoolean("enabled")) throw new SecurityException();
                    if (!principal.isCurrent(context) || !principal.isAlive()) throw new SecurityException();
                    requireUnlocked(context, principal.userId); AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
                    synchronized (lock) {
                        if (!first.same(capture(service, request, principal.userId))) throw new SecurityException();
                        Map<String, Consumed> ledger = ledger(service);
                        prune(service, ledger); String key = requestId;
                        Map<String, ActionToken> tokens = tokens(service); pruneTokens(service, tokens);
                        ActionToken token = tokens.get(request.getString("action_id"));
                        if (token == null || !token.matches(principal, first, index)) throw new SecurityException();
                        Map<String, Receipt> receipts = receipts(service); pruneReceipts(service, receipts);
                        String receiptKey = receiptKey(first.lease, index);
                        if (ledger.size() >= MAX_CONSUMED || ledger.containsKey(key) || receipts.size() >= MAX_CONSUMED
                                || receipts.containsKey(receiptKey)) throw new SecurityException();
                        // Consume before send and remove this exact action capability.
                        // A later explicit click needs a fresh describe and a new token.
                        outgoing = new Receipt(requestId, token); receipts.put(receiptKey, outgoing);
                        ledger.put(key, new Consumed(first.lease, token.expires));
                        // Every older capability for this same action retires at this attempt.
                        tokens.values().removeIf(value -> value.index == index && value.lease.same(first.lease)); consumed = true;
                    }
                    if (!principal.isCurrent(context) || !principal.isAlive()) throw new SecurityException();
                    requireUnlocked(context, principal.userId); AtomicWorkbenchNotificationEvidenceHook.fresh(deadline);
                    PendingIntent target = first.intents[index];
                    long identity = Binder.clearCallingIdentity();
                    try { attempted = true; target.send(); }
                    finally { Binder.restoreCallingIdentity(identity); }
                    synchronized (lock) { outgoing.sent = true; }
                    result.putBoolean("success", true); result.putBoolean("sent", true); result.putString("status", "sent");
                }
            }
        } catch (PendingIntent.CanceledException canceled) {
            result.putString("status", "canceled");
        } catch (Throwable deniedOrUnknown) {
            result.putString("status", attempted ? "outcome_unknown" : "rejected");
        }
        result.putBoolean("consumed", consumed); result.putBoolean("send_attempted", attempted);
        result.putLong("sample_elapsed", SystemClock.elapsedRealtime());
        // Fixed-size identity/status and at most eight public labels, never any PI.
        reply.writeNoException(); reply.writeBundle(result);
    }

    private static Bundle describe(Context context, Capture source, int index) throws Exception {
        if (index < 0 || index >= source.actions.length || index >= MAX_ACTIONS) throw new SecurityException();
        Notification.Action action = source.actions[index]; PendingIntent intent = source.intents[index];
        Bundle row = new Bundle(); row.putInt("index", index);
        row.putString("action_id", "");
        String label = label(action == null ? null : action.title); row.putString("label", label);
        boolean remote = action != null && (nonempty(action.getRemoteInputs()) || nonempty(action.getDataOnlyRemoteInputs()));
        boolean authentication = action != null && action.isAuthenticationRequired();
        row.putBoolean("authentication_required", authentication); row.putBoolean("remote_input", remote);
        String status = "ready";
        if (action == null || intent == null || label.isEmpty()) status = "unavailable";
        else if (remote) status = "remote_input_required";
        else if (intent.isActivity()) status = "open_source_required";
        else {
            int creatorUid = intent.getCreatorUid(); String creatorPackage = intent.getCreatorPackage();
            UserHandle creatorUser = intent.getCreatorUserHandle();
            if (creatorUid != source.lease.uid || !source.lease.pkg.equals(creatorPackage)
                    || creatorUser == null || !UserHandle.getUserHandleForUid(source.lease.uid).equals(creatorUser)) status = "creator_mismatch";
            Object owner = context.getPackageManager().getClass().getMethod("getPackageUidAsUser", String.class, int.class)
                    .invoke(context.getPackageManager(), source.lease.pkg, source.lease.user);
            if (!(owner instanceof Integer) || (Integer) owner != source.lease.uid) status = "creator_mismatch";
        }
        row.putBoolean("enabled", "ready".equals(status)); row.putString("status", status); return row;
    }

    private static Capture capture(Object service, Bundle request, int user) throws Exception {
        Map<?, ?> all = records(service); if (all.size() > MAX_RECORDS) throw new SecurityException();
        Object record = all.get(request.getString("key")); if (record == null) throw new SecurityException();
        StatusBarNotification n = (StatusBarNotification) getSbn.invoke(record); Notification notification = n.getNotification();
        if (!request.getString("key").equals(n.getKey()) || n.getUserId() != user || n.getUid() < 0 || n.getUid() / 100000 != user
                || notification == null || notification.visibility == Notification.VISIBILITY_SECRET
                || (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0) throw new SecurityException();
        AtomicWorkbenchNotificationRecords.Lease lease = AtomicWorkbenchNotificationEvidenceHook.actionLease(service, record, n);
        if (!request.getString("generation").equals(lease.generation) || request.getLong("revision") != lease.revision) throw new SecurityException();
        return new Capture(lease, notification);
    }
    private static Map<?, ?> records(Object service) throws Exception {
        Object value = field(service, "mNotificationsByKey"); if (!(value instanceof Map<?, ?>)) throw new SecurityException(); return (Map<?, ?>) value;
    }
    private static Map<String, Consumed> ledger(Object service) {
        synchronized (CONSUMED) { return CONSUMED.computeIfAbsent(service, ignored -> new LinkedHashMap<>()); }
    }
    private static void prune(Object service, Map<String, Consumed> ledger) throws Exception {
        Map<?, ?> all = records(service); long now = SystemClock.elapsedRealtime();
        ledger.entrySet().removeIf(entry -> entry.getValue().expires <= now
                || all.get(entry.getValue().lease.key) != entry.getValue().lease.record.get());
    }
    private static Map<String, ActionToken> tokens(Object service) {
        synchronized (TOKENS) { return TOKENS.computeIfAbsent(service, ignored -> new LinkedHashMap<>()); }
    }
    private static void pruneTokens(Object service, Map<String, ActionToken> tokens) throws Exception {
        Map<?, ?> all = records(service); long now = SystemClock.elapsedRealtime();
        tokens.entrySet().removeIf(entry -> entry.getValue().expires <= now
                || all.get(entry.getValue().lease.key) != entry.getValue().lease.record.get());
    }
    private static Map<String, Receipt> receipts(Object service) {
        synchronized (RECEIPTS) { return RECEIPTS.computeIfAbsent(service, ignored -> new LinkedHashMap<>()); }
    }
    private static String receiptKey(AtomicWorkbenchNotificationRecords.Lease lease, int index) {
        return lease.generation + ":" + lease.revision + ":" + index;
    }
    private static void pruneReceipts(Object service, Map<String, Receipt> receipts) throws Exception {
        Map<?, ?> all = records(service);
        java.util.Iterator<Receipt> iterator = receipts.values().iterator();
        while (iterator.hasNext()) {
            Receipt receipt = iterator.next(); Object record = receipt.token.lease.record.get();
            if (record == null || all.get(receipt.token.lease.key) != record) { iterator.remove(); continue; }
            StatusBarNotification n = (StatusBarNotification) getSbn.invoke(record);
            if (!receipt.token.lease.same(AtomicWorkbenchNotificationEvidenceHook.actionLease(service, record, n))) iterator.remove();
        }
    }
    private static boolean nonempty(RemoteInput[] inputs) { return inputs != null && inputs.length != 0; }
    private static String label(CharSequence value) {
        if (value == null || value.length() > 80) return "";
        String text = value.toString(); if (text.length() > 80 || text.isBlank()) return "";
        for (int index = 0; index < text.length(); index++) if (Character.isISOControl(text.charAt(index))) return "";
        return text;
    }
    private static void requireUnlocked(Context context, int user) throws Exception {
        Object current = Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
        if (!(current instanceof Integer) || (Integer) current != user) throw new SecurityException();
        Context owner = (Context) Context.class.getMethod("createContextAsUser", UserHandle.class, int.class)
                .invoke(context, UserHandle.getUserHandleForUid(user * 100000), 0);
        KeyguardManager keyguard = owner.getSystemService(KeyguardManager.class);
        UserManager users = owner.getSystemService(UserManager.class);
        if (keyguard == null || users == null || !users.isUserUnlocked() || keyguard.isDeviceLocked() || keyguard.isKeyguardLocked()) throw new SecurityException();
    }
    private static void validate(Bundle request) {
        if (request == null || !request.keySet().equals(KEYS) || !(request.get("operation") instanceof String)
                || !(request.get("key") instanceof String) || !(request.get("generation") instanceof String)
                || !(request.get("revision") instanceof Long) || !(request.get("index") instanceof Integer)
                || !(request.get("request_id") instanceof String) || !request.getString("request_id").matches("[0-9a-f]{32}")) throw new SecurityException();
        if (!(request.get("action_id") instanceof String)) throw new SecurityException();
        String operation = request.getString("operation");
        if (!Set.of("probe", "describe", "send", "confirm_sent").contains(operation)) throw new SecurityException();
        if ("probe".equals(operation)) {
            if (!request.getString("key").isEmpty() || !request.getString("generation").isEmpty()
                    || request.getLong("revision") != 0 || request.getInt("index") != -1 || !request.getString("action_id").isEmpty()) throw new SecurityException();
        } else if (!text(request.getString("key"), 1024) || !request.getString("generation").matches("[0-9a-f]{33,48}")
                || request.getLong("revision") < 1 || (!"describe".equals(operation) ? request.getInt("index") < 0
                    || request.getInt("index") >= MAX_ACTIONS || !request.getString("action_id").matches("[0-9a-f]{32}")
                    : request.getInt("index") != -1 || !request.getString("action_id").isEmpty())) throw new SecurityException();
    }
    private static Bundle result(String status, String nonce, String request) {
        Bundle result = new Bundle(); result.putInt("schema", 1); result.putBoolean("success", false);
        result.putString("nonce", nonce); result.putString("request_id", request); result.putString("status", status);
        result.putBoolean("consumed", false); result.putBoolean("send_attempted", false); result.putBoolean("sent", false);
        result.putLong("sample_elapsed", 0); result.putLong("valid_until_elapsed", 0); result.putBoolean("limited", false); result.putParcelableArrayList("actions", new ArrayList<Bundle>()); return result;
    }
    private static final class Capture {
        final AtomicWorkbenchNotificationRecords.Lease lease;
        final Notification notification;
        final Notification.Action[] actions;
        final PendingIntent[] intents;
        final Notification.Action[] publishedActions;
        final int totalActions;
        Capture(AtomicWorkbenchNotificationRecords.Lease lease, Notification notification) {
            this.lease = lease; this.notification = notification;
            Notification.Action[] source = notification.actions;
            publishedActions = source; totalActions = source == null ? 0 : source.length;
            actions = new Notification.Action[Math.min(MAX_ACTIONS, totalActions)];
            if (source != null) System.arraycopy(source, 0, actions, 0, actions.length);
            intents = new PendingIntent[actions.length];
            for (int index = 0; index < actions.length; index++) intents[index] = actions[index] == null ? null : actions[index].actionIntent;
        }
        boolean same(Capture other) {
            if (other == null || !lease.same(other.lease) || notification != other.notification
                    || publishedActions != other.publishedActions || totalActions != other.totalActions || actions.length != other.actions.length) return false;
            for (int index = 0; index < actions.length; index++) if (actions[index] != other.actions[index] || intents[index] != other.intents[index]) return false;
            return true;
        }
    }
    private static final class ActionToken {
        final String id = UUID.randomUUID().toString().replace("-", "");
        final AtomicWorkbenchSystemRootAuthority.Session principal;
        final AtomicWorkbenchNotificationRecords.Lease lease;
        final WeakReference<Notification> notification;
        final WeakReference<Notification.Action[]> publishedActions;
        final WeakReference<Notification.Action> action;
        final WeakReference<PendingIntent> intent;
        final int index;
        final long expires;
        ActionToken(AtomicWorkbenchSystemRootAuthority.Session principal, Capture source, int index, long expires) {
            this.principal = principal; lease = source.lease; this.index = index; this.expires = expires;
            notification = new WeakReference<>(source.notification); publishedActions = new WeakReference<>(source.publishedActions);
            action = new WeakReference<>(source.actions[index]); intent = new WeakReference<>(source.intents[index]);
        }
        boolean matches(AtomicWorkbenchSystemRootAuthority.Session caller, Capture actual, int index) {
            return SystemClock.elapsedRealtime() < expires && sameIdentity(caller, actual, index);
        }
        boolean sameIdentity(AtomicWorkbenchSystemRootAuthority.Session caller, Capture actual, int index) {
            return this.index == index && lease.same(actual.lease)
                    && notification.get() == actual.notification && publishedActions.get() == actual.publishedActions
                    && action.get() != null && action.get() == actual.actions[index]
                    && intent.get() != null && intent.get() == actual.intents[index]
                    && principal.rootPid == caller.rootPid && principal.moduleUid == caller.moduleUid
                    && principal.userId == caller.userId && principal.session == caller.session
                    && principal.resetGeneration == caller.resetGeneration && principal.endpoint.equals(caller.endpoint)
                    && principal.owner.equals(caller.owner);
        }
    }
    private static final class Receipt {
        final String request; final ActionToken token; boolean sent;
        Receipt(String request, ActionToken token) { this.request=request;this.token=token; }
    }
    private static final class Consumed {
        final AtomicWorkbenchNotificationRecords.Lease lease;
        final long expires;
        Consumed(AtomicWorkbenchNotificationRecords.Lease lease, long expires) { this.lease=lease;this.expires=expires; }
    }
}
