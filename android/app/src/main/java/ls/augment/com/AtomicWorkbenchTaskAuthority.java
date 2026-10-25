package ls.augment.com;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import java.lang.reflect.Method;
import java.util.Set;

/** Phone-local transport to the exact-task system broker. Never starts an Intent. */
final class AtomicWorkbenchTaskAuthority {
    static final int TRANSACTION = 0x00D04E05;
    private static final int RETAINED_CLEANUP_TRANSACTION = 0x00D04E09;
    static final String DESCRIPTOR = "ls.augment.com.atomic_task_operations.v1";
    interface Authentication { Bundle get() throws Exception; }
    private final Context context;
    private final Authentication authentication;
    private final Authentication retainedCleanupAuthentication;
    private final long[] diagnosticLast = new long[20], diagnosticSuppressed = new long[20];
    private long diagnosticCount;

    private synchronized void diagnostic(String action, String stage, boolean success, Throwable error) {
        try {
            // The action is always a fixed internal callsite, never caller-supplied metadata.
            int index = switch (action) {
                case "describe" -> 1; case "primary_display" -> 2; case "inspect" -> 3;
                case "prepare" -> 4; case "apply" -> 5; case "query" -> 6;
                case "cancel" -> 7; case "release" -> 8; case "cleanup" -> 9; default -> 0;
            };
            int bucket = index * 2 + (success ? 1 : 0);
            long count = ++diagnosticCount, now = System.nanoTime();
            if (diagnosticLast[bucket] != 0 && now - diagnosticLast[bucket] < 3_000_000_000L) { diagnosticSuppressed[bucket]++; return; }
            diagnosticLast[bucket] = now;
            long suppressed = diagnosticSuppressed[bucket]; diagnosticSuppressed[bucket] = 0;
            AtomicWorkbenchDiagnostics.emit("ATOMIC_TASK_TRANSPORT", -1, -1, "", -1,
                    "owner_id=TASK_C13_ROOT_01;diag_abi=1;stage=" + stage + ";action=" + action
                    + ";success=" + success + ";count=" + count + ";suppressed=" + suppressed, error);
        } catch (Throwable ignored) { }
    }

    static final class Unconfirmed extends Exception {
        final boolean mutationAttempted;
        Unconfirmed(boolean attempted) { super("task_operation_transport_unconfirmed"); mutationAttempted = attempted; }
    }

    AtomicWorkbenchTaskAuthority(Context context, Authentication authentication) {
        this(context, authentication, null);
    }

    AtomicWorkbenchTaskAuthority(Context context, Authentication authentication, Authentication retainedCleanupAuthentication) {
        if (context == null || authentication == null) throw new IllegalArgumentException("task_authority_missing");
        this.context = context; this.authentication = authentication;
        this.retainedCleanupAuthentication = retainedCleanupAuthentication;
    }

    /** Fresh core observation through the original authenticated synchronous broker. */
    Bundle capacity(int expectedUser) throws Exception {
        String probe = java.util.UUID.randomUUID().toString().replace("-", "");
        Bundle request = new Bundle(); request.putInt("schema", 1); request.putString("probe_id", probe);
        Bundle result = exchange("capacity", request, false);
        if (expectedUser < 0 || !result.keySet().equals(Set.of("schema", "success", "probe_id", "profile", "pool_limit",
                "core_bits", "server_pid", "server_generation", "user_id"))
                || !(result.get("schema") instanceof Integer) || result.getInt("schema") != 1
                || !Boolean.TRUE.equals(result.get("success")) || !probe.equals(result.get("probe_id"))
                || !"FULL8_CORE".equals(result.get("profile")) || !(result.get("pool_limit") instanceof Integer)
                || result.getInt("pool_limit") != 8 || !(result.get("core_bits") instanceof Integer) || result.getInt("core_bits") != 15
                || !(result.get("server_pid") instanceof Integer) || result.getInt("server_pid") <= 0
                || !(result.get("server_generation") instanceof String) || !result.getString("server_generation").matches("[0-9a-f]{32}")
                || !(result.get("user_id") instanceof Integer) || result.getInt("user_id") != expectedUser)
            throw new SecurityException("task_capacity_unconfirmed");
        return result;
    }

    Bundle describe(Bundle window) throws Exception { return exchange("describe", window, false); }
    Bundle primaryDisplay() throws Exception { return exchange("primary_display", new Bundle(), false); }
    Bundle inspect(java.util.ArrayList<String> ids) throws Exception {
        if (ids == null || ids.size() > 80) throw new IllegalArgumentException("task_inspect_capacity");
        for (String id : ids) requireId(id);
        Bundle request = new Bundle(); request.putStringArrayList("operation_ids", new java.util.ArrayList<>(ids));
        return exchange("inspect", request, false);
    }
    Bundle prepare(AtomicWorkbenchTaskOperationRequest request) throws Exception {
        request.requireFresh(android.os.SystemClock.elapsedRealtime());
        return exchange("prepare", request.toBundle(), false);
    }
    Bundle apply(String operationId, String ticket) throws Exception {
        Bundle request = operation(operationId); requireId(ticket); request.putString("ticket", ticket);
        Bundle result = exchange("apply", request, true);
        if (!operationId.equals(result.get("operation_id"))) throw new Unconfirmed(true);
        for (String key : Set.of("mutation_dispatched", "position_verified", "visibility_verified", "focus_unchanged",
                "cleanup_pending", "operation_unconfirmed", "hidden_lease", "cancelled", "external", "ended"))
            if (!(result.get(key) instanceof Boolean)) throw new Unconfirmed(true);
        if (!(result.get("lease_id") instanceof String)) throw new Unconfirmed(true);
        if (result.getBoolean("success") && (!result.getBoolean("mutation_dispatched") || !result.getBoolean("position_verified")
                || !result.getBoolean("visibility_verified") || !result.getBoolean("focus_unchanged")
                || result.getBoolean("cleanup_pending") || result.getBoolean("operation_unconfirmed"))) throw new Unconfirmed(true);
        return result;
    }
    Bundle query(String operationId) throws Exception { return exchange("query", operation(operationId), false); }
    Bundle cancel(String operationId) throws Exception { return exchange("cancel", operation(operationId), false); }
    Bundle release(String operationId) throws Exception { return exchange("release", operation(operationId), true); }
    Bundle cleanup() throws Exception { return exchange("cleanup", new Bundle(), true); }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private Bundle exchange(String action, Bundle request, boolean mutation) throws Exception {
        String stage = "AUTH_METADATA";
        boolean observedSuccess = false;
        Throwable diagnosticFailure = null;
        try {
        Bundle auth;
        int transaction = TRANSACTION;
        try { auth = authentication.get(); }
        catch (Exception metadataUnavailable) {
            if (retainedCleanupAuthentication == null
                    || !("cleanup".equals(action) || "release".equals(action) || "cancel".equals(action))) throw metadataUnavailable;
            // This getter itself requires closing + the original dead owner. There is no
            // retry through the old transaction or dead Provider after the dedicated route.
            auth = retainedCleanupAuthentication.get();
            transaction = RETAINED_CLEANUP_TRANSACTION;
        }
        if (auth == null || !auth.keySet().equals(Set.of("version", "uid", "user", "session", "reset_generation",
                "root_pid", "endpoint", "token", "nonce"))) throw new SecurityException("task_auth_metadata");
        Object nonce = auth.get("nonce");
        if (!(nonce instanceof String) || !((String) nonce).matches("[0-9a-f]{32}"))
            throw new SecurityException("task_auth_nonce");
        // Resolve the real service on the phone; no computer-side agent is involved.
        stage = "SERVICE";
        Class<?> manager = Class.forName("android.os.ServiceManager");
        Method getService = manager.getDeclaredMethod("getService", String.class);
        IBinder binder = (IBinder) getService.invoke(null, "window");
        if (binder == null || !binder.isBinderAlive()) throw new IllegalStateException("task_authority_unavailable");
        stage = "PARCEL";
        Parcel data = Parcel.obtain(), reply = Parcel.obtain();
        boolean attempted = false;
        try {
            stage = "ENCODE";
            data.writeInterfaceToken(DESCRIPTOR); data.writeInt(1);
            data.writeBundle(auth); data.writeString(action); data.writeBundle(request);
            attempted = mutation;
            stage = "TRANSACT";
            if (!binder.transact(transaction, data, reply, 0)) throw new Unconfirmed(attempted);
            stage = "REMOTE_EXCEPTION";
            reply.readException();
            stage = "ENVELOPE";
            if (reply.dataSize() > 128 * 1024 || reply.readInt() != 1 || !nonce.equals(reply.readString()))
                throw new Unconfirmed(attempted);
            Bundle result = reply.readBundle(AtomicWorkbenchTaskAuthority.class.getClassLoader());
            stage = "RESULT_DTO";
            if (reply.dataAvail() != 0 || result == null || !(result.get("schema") instanceof Integer)
                    || result.getInt("schema") != 1 || !(result.get("success") instanceof Boolean))
                throw new Unconfirmed(attempted);
            try { observedSuccess = Boolean.TRUE.equals(result.get("success")); } catch (Throwable ignored) { }
            stage = "COMPLETE";
            return new Bundle(result);
        } catch (Unconfirmed unknown) { throw unknown; }
        catch (Exception unavailable) { diagnosticFailure = unavailable; throw new Unconfirmed(attempted); }
        finally { data.recycle(); reply.recycle(); }
        } catch (Exception | Error unavailable) { if (diagnosticFailure == null) diagnosticFailure = unavailable; throw unavailable; }
        finally { if (!"capacity".equals(action)) diagnostic(action, stage, observedSuccess, diagnosticFailure); }
    }

    private static Bundle operation(String id) {
        requireId(id); Bundle result = new Bundle(); result.putString("operation_id", id); return result;
    }
    private static void requireId(String id) {
        if (id == null || !id.matches("[0-9a-f]{32}")) throw new IllegalArgumentException("task_operation_id");
    }
}
