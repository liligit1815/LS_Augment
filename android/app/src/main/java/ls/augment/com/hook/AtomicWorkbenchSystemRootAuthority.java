package ls.augment.com.hook;

import android.content.Context;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Process;
import java.util.Set;

/** Fresh, read-only Root-session verification shared by narrowly scoped system-server brokers. */
public final class AtomicWorkbenchSystemRootAuthority {
    private static final Set<String> REQUEST_KEYS = Set.of("version", "uid", "user", "session",
            "reset_generation", "root_pid", "endpoint", "token", "nonce");
    private static final Set<String> RESPONSE_KEYS = Set.of("version", "current", "nonce", "owner",
            "session", "reset_generation", "uid", "user", "root_pid");

    private AtomicWorkbenchSystemRootAuthority() { }

    /** Must run before the broker clears its original Binder caller, and outside subsystem locks. */
    public static Session authenticate(Context context, Bundle auth, int callerUid, int callerPid) {
        return authenticate(context, auth, callerUid, callerPid, false);
    }

    /** Only for releasing resources already owned by this exact principal; never mint new authority. */
    public static Session authenticateCleanup(Context context, Bundle auth, int callerUid, int callerPid) {
        return authenticate(context, auth, callerUid, callerPid, true);
    }

    private static Session authenticate(Context context, Bundle auth, int callerUid, int callerPid, boolean cleanup) {
        try {
            if (Process.myUid() != 1000 || callerUid != 0 || callerPid <= 0
                    || Binder.getCallingUid() != callerUid || Binder.getCallingPid() != callerPid)
                throw rejected();
            Bundle frozen = freeze(auth);
            if (frozen.getInt("root_pid", -1) != callerPid) throw rejected();
            Bundle response = query(context, frozen, !cleanup);
            IBinder owner = verifiedOwner(frozen, response, !cleanup);
            return new Session(frozen, owner, cleanup);
        } catch (RuntimeException unavailable) { throw rejected(); }
    }

    /** Only the task broker may derive cleanup credentials from its original authenticated cache. */
    static Session authenticateRetainedCleanup(Session cached, Bundle auth, int callerUid, int callerPid) {
        try {
            if (Process.myUid() != 1000 || callerUid != 0 || callerPid <= 0
                    || Binder.getCallingUid() != callerUid || Binder.getCallingPid() != callerPid
                    || cached == null || cached.cleanupOnly || cached.owner.isBinderAlive()
                    || !cached.endpoint.isBinderAlive()) throw rejected();
            Bundle frozen = freeze(auth);
            if (cached.rootPid != callerPid || frozen.getInt("root_pid", -1) != cached.rootPid
                    || frozen.getInt("uid", -1) != cached.moduleUid || frozen.getInt("user", -1) != cached.userId
                    || frozen.getLong("session", -1L) != cached.session
                    || frozen.getLong("reset_generation", -1L) != cached.resetGeneration
                    || !cached.endpoint.equals(frozen.getBinder("endpoint"))
                    || !cached.authentication.getString("token").equals(frozen.getString("token"))) throw rejected();
            if (cached.owner.isBinderAlive() || !cached.endpoint.isBinderAlive()) throw rejected();
            return new Session(frozen, cached.owner, true);
        } catch (RuntimeException unavailable) { throw rejected(); }
    }

    public static final class Session {
        public final int rootPid, moduleUid, userId;
        public final long session, resetGeneration;
        public final IBinder endpoint, owner;
        public final boolean cleanupOnly;
        private final Bundle authentication;

        private Session(Bundle auth, IBinder owner, boolean cleanupOnly) {
            authentication = auth;
            rootPid = auth.getInt("root_pid", -1); moduleUid = auth.getInt("uid", -1);
            userId = auth.getInt("user", -1); session = auth.getLong("session", -1L);
            resetGeneration = auth.getLong("reset_generation", -1L);
            endpoint = auth.getBinder("endpoint"); this.owner = owner;
            this.cleanupOnly = cleanupOnly;
        }

        /** Only a local liveness check; this is not a fresh reset/user/session authorization. */
        public boolean isAlive() { return endpoint.isBinderAlive() && owner.isBinderAlive(); }

        /** Performs Provider IPC. Call only outside WM, media, notification and accessibility locks. */
        public boolean isCurrent(Context context) {
            try {
                if (cleanupOnly || Process.myUid() != 1000 || !isAlive()) return false;
                Bundle fresh = new Bundle(authentication);
                fresh.putString("nonce", java.util.UUID.randomUUID().toString().replace("-", ""));
                return owner.equals(verifiedOwner(fresh, query(context, fresh))) && isAlive();
            } catch (RuntimeException unavailable) { return false; }
        }
    }

    private static Bundle freeze(Bundle source) {
        if (source == null) throw rejected();
        Bundle auth = new Bundle(source);
        if (!auth.keySet().equals(REQUEST_KEYS) || !(auth.get("version") instanceof Integer)
                || !(auth.get("uid") instanceof Integer) || !(auth.get("user") instanceof Integer)
                || !(auth.get("session") instanceof Long) || !(auth.get("reset_generation") instanceof Long)
                || !(auth.get("root_pid") instanceof Integer) || !(auth.get("endpoint") instanceof IBinder)
                || !(auth.get("token") instanceof String) || !(auth.get("nonce") instanceof String)
                || auth.getInt("version", -1) != 1 || auth.getInt("uid", -1) < 10000
                || auth.getInt("user", -1) < 0 || auth.getInt("uid", -1) / 100000 != auth.getInt("user", -1)
                || auth.getLong("session", -1L) < 0 || auth.getLong("reset_generation", -1L) < 0
                || auth.getInt("root_pid", -1) <= 0 || !auth.getBinder("endpoint").isBinderAlive()
                || !auth.getString("token").matches("[0-9a-f]{64}")
                || !auth.getString("nonce").matches("[0-9a-f]{32}")) throw rejected();
        return auth;
    }

    private static Bundle query(Context context, Bundle auth) {
        return query(context, auth, true);
    }

    private static Bundle query(Context context, Bundle auth, boolean requireCurrentUser) {
        if (context == null || Process.myUid() != 1000) throw rejected();
        long identity = Binder.clearCallingIdentity();
        try {
            if (requireCurrentUser && currentUser() != auth.getInt("user", -1)) throw rejected();
            // The explicit user keeps secondary-user workbenches out of user 0's Provider.
            Uri uri = Uri.parse("content://" + auth.getInt("user", -1) + "@ls.augment.com.workbench");
            Bundle response = context.getContentResolver().call(uri, "system_root_session", null, new Bundle(auth));
            if (requireCurrentUser && currentUser() != auth.getInt("user", -1)) throw rejected();
            return response;
        } finally { Binder.restoreCallingIdentity(identity); }
    }

    private static int currentUser() {
        try {
            Object current = Class.forName("android.app.ActivityManager").getMethod("getCurrentUser").invoke(null);
            return current instanceof Integer ? (Integer) current : -1;
        } catch (ReflectiveOperationException | RuntimeException unavailable) { return -1; }
    }

    private static IBinder verifiedOwner(Bundle auth, Bundle response) {
        return verifiedOwner(auth, response, true);
    }

    private static IBinder verifiedOwner(Bundle auth, Bundle response, boolean requireCurrent) {
        if (response == null || !response.keySet().equals(RESPONSE_KEYS)
                || !(response.get("version") instanceof Integer) || !(response.get("current") instanceof Boolean)
                || !(response.get("nonce") instanceof String) || !(response.get("owner") instanceof IBinder)
                || !(response.get("session") instanceof Long) || !(response.get("reset_generation") instanceof Long)
                || !(response.get("uid") instanceof Integer) || !(response.get("user") instanceof Integer)
                || !(response.get("root_pid") instanceof Integer) || response.getInt("version", -1) != 1
                || requireCurrent && !response.getBoolean("current", false) || !auth.getString("nonce").equals(response.getString("nonce"))
                || response.getInt("uid", -1) != auth.getInt("uid", -1)
                || response.getInt("user", -1) != auth.getInt("user", -1)
                || response.getInt("root_pid", -1) != auth.getInt("root_pid", -1)
                || response.getLong("session", -1L) != auth.getLong("session", -1L)
                || response.getLong("reset_generation", -1L) != auth.getLong("reset_generation", -1L)
                || !auth.getBinder("endpoint").isBinderAlive() || !response.getBinder("owner").isBinderAlive())
            throw rejected();
        return response.getBinder("owner");
    }

    private static SecurityException rejected() { return new SecurityException("工作台系统会话身份不符"); }
}
