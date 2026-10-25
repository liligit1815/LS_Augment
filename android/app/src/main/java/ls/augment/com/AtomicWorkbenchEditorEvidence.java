package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import java.util.UUID;
import java.util.Set;

/** Fresh Root-only WMS witness. Contains identities, never editor text. */
final class AtomicWorkbenchEditorEvidence {
    static final int TRANSACTION = 0x00D04E01, SCHEMA = 1;
    static final String DESCRIPTOR = "ls.augment.com.atomic_editor_evidence.v1";
    final int windowId, displayId, userId, moduleUid, targetUid, taskId, accessibilityWindowId, inputType, fieldId;
    final String displayName, displayUniqueId, packageName, windowGeneration, connectionGeneration;
    final long sampledAt;

    AtomicWorkbenchEditorEvidence(int windowId, int displayId, String displayName, String unique,
            int user, int moduleUid, int targetUid, int task, String pkg, int a11y,
            String windowGeneration, String connectionGeneration, int inputType, int fieldId, long sampledAt) {
        this.windowId = windowId; this.displayId = displayId; this.displayName = displayName; displayUniqueId = unique;
        userId = user; this.moduleUid = moduleUid; this.targetUid = targetUid; taskId = task;
        packageName = pkg; accessibilityWindowId = a11y; this.windowGeneration = windowGeneration;
        this.connectionGeneration = connectionGeneration; this.inputType = inputType; this.fieldId = fieldId;
        this.sampledAt = sampledAt;
    }

    boolean matches(AtomicWorkbenchPasteRequest r, long now) {
        return r != null && now >= sampledAt && now - sampledAt <= AtomicWorkbenchPastePolicy.MAX_DURATION
                && now < r.deadlineAt && windowId == r.windowId && displayId == r.displayId && userId == r.userId
                && moduleUid == r.moduleUid && targetUid == r.targetUid && taskId == r.taskId
                && r.displayName.equals(displayName) && r.displayUniqueId.equals(displayUniqueId)
                && r.packageName.equals(packageName) && accessibilityWindowId >= 0 && (inputType & 15) != 0
                && !AtomicWorkbenchPastePolicy.password(inputType)
                && hex(windowGeneration) && hex(connectionGeneration);
    }

    boolean sameEditor(AtomicWorkbenchEditorEvidence other) {
        return other != null && windowGeneration != null && connectionGeneration != null
                && windowGeneration.equals(other.windowGeneration) && connectionGeneration.equals(other.connectionGeneration)
                && accessibilityWindowId == other.accessibilityWindowId && inputType == other.inputType && fieldId == other.fieldId
                && windowId == other.windowId && displayId == other.displayId && userId == other.userId
                && moduleUid == other.moduleUid && targetUid == other.targetUid && taskId == other.taskId
                && displayName.equals(other.displayName) && displayUniqueId.equals(other.displayUniqueId)
                && packageName.equals(other.packageName);
    }

    /** Call in Root worker. The Hook checks original Binder UID/PID and live VD registry. */
    static AtomicWorkbenchEditorEvidence query(IBinder windowManager, AtomicWorkbenchPasteRequest r) throws Exception {
        String invalid = AtomicWorkbenchPastePolicy.invalid(r, SystemClock.elapsedRealtime());
        if (invalid != null) throw new IllegalStateException(invalid);
        String nonce = UUID.randomUUID().toString().replace("-", "");
        Parcel request = Parcel.obtain(), reply = Parcel.obtain();
        try {
            request.writeInterfaceToken(DESCRIPTOR); request.writeInt(SCHEMA); request.writeString(nonce);
            request.writeLong(r.deadlineAt); request.writeInt(r.moduleUid); request.writeInt(r.userId);
            request.writeInt(r.windowId); request.writeInt(r.displayId); request.writeString(r.displayName);
            request.writeString(r.displayUniqueId); request.writeInt(r.targetUid); request.writeInt(r.taskId);
            request.writeString(r.packageName);
            if (windowManager == null || !windowManager.transact(TRANSACTION, request, reply, 0))
                throw new IllegalStateException("editor_evidence_unavailable");
            reply.readException();
            if (reply.readInt() != SCHEMA || !nonce.equals(reply.readString()) || reply.readInt() != 1)
                throw new IllegalStateException("editor_evidence_rejected");
            AtomicWorkbenchEditorEvidence result = new AtomicWorkbenchEditorEvidence(r.windowId, r.displayId,
                    r.displayName, r.displayUniqueId, r.userId, r.moduleUid, r.targetUid, r.taskId, r.packageName,
                    reply.readInt(), reply.readString(), reply.readString(), reply.readInt(), reply.readInt(), reply.readLong());
            if (reply.dataAvail() != 0 || !result.matches(r, SystemClock.elapsedRealtime()))
                throw new IllegalStateException("stale_editor_evidence");
            return result;
        } finally { reply.recycle(); request.recycle(); }
    }

    Bundle toBundle() {
        Bundle b = new Bundle(); b.putInt("schema", SCHEMA); b.putInt("window", windowId); b.putInt("display", displayId);
        b.putString("name", displayName); b.putString("unique", displayUniqueId); b.putInt("user", userId);
        b.putInt("module_uid", moduleUid); b.putInt("target_uid", targetUid); b.putInt("task", taskId);
        b.putString("package", packageName); b.putInt("a11y_window", accessibilityWindowId);
        b.putString("window_generation", windowGeneration); b.putString("connection_generation", connectionGeneration);
        b.putInt("input_type", inputType); b.putInt("field", fieldId); b.putLong("sampled", sampledAt); return b;
    }
    static AtomicWorkbenchEditorEvidence fromBundle(Bundle b) {
        Set<String> keys = Set.of("schema", "window", "display", "name", "unique", "user", "module_uid", "target_uid", "task",
                "package", "a11y_window", "window_generation", "connection_generation", "input_type", "field", "sampled");
        Set<String> strings = Set.of("name", "unique", "package", "window_generation", "connection_generation");
        if (b == null || b.size() != keys.size() || !b.keySet().equals(keys)) throw new IllegalArgumentException("invalid_editor_evidence");
        for (String key : keys) {
            Object value = b.get(key);
            if ("sampled".equals(key) ? !(value instanceof Long) : strings.contains(key)
                    ? !(value instanceof String) || !AtomicWorkbenchPastePolicy.identifier((String) value, "unique".equals(key) ? 512 : 256)
                    : !(value instanceof Integer)) throw new IllegalArgumentException("invalid_editor_evidence");
        }
        if (b.getInt("schema", -1) != SCHEMA) throw new IllegalArgumentException("invalid_editor_evidence");
        return new AtomicWorkbenchEditorEvidence(b.getInt("window", -1), b.getInt("display", -1), b.getString("name"),
                b.getString("unique"), b.getInt("user", -1), b.getInt("module_uid", -1), b.getInt("target_uid", -1),
                b.getInt("task", -1), b.getString("package"), b.getInt("a11y_window", -1),
                b.getString("window_generation"), b.getString("connection_generation"), b.getInt("input_type"),
                b.getInt("field"), b.getLong("sampled", -1));
    }
    private static boolean hex(String value) { return value != null && value.matches("[0-9a-f]{32}"); }

    /** Window identity permits focus discovery only. It contains no editor/connection authority. */
    static final class WindowEvidence {
        final int accessibilityWindowId;
        final String windowGeneration;
        final long sampledAt;
        private final Bundle request;
        WindowEvidence(AtomicWorkbenchPasteRequest r,int window,String generation,long sampled){
            request=r.metadata();accessibilityWindowId=window;windowGeneration=generation;sampledAt=sampled;
        }
        private WindowEvidence(Bundle request,int window,String generation,long sampled){
            this.request=new Bundle(request);accessibilityWindowId=window;windowGeneration=generation;sampledAt=sampled;
        }
        boolean matches(AtomicWorkbenchPasteRequest r,long now){
            if(r==null||now<sampledAt||sampledAt<r.createdAt||now-sampledAt>AtomicWorkbenchPastePolicy.MAX_DURATION
                    ||now>=r.deadlineAt||accessibilityWindowId<0||!hex(windowGeneration))return false;
            Bundle expected=r.metadata();
            if(!request.keySet().equals(expected.keySet()))return false;
            for(String key:expected.keySet()){
                Object actual=request.get(key),value=expected.get(key);
                if(actual==null||actual.getClass()!=value.getClass()||!value.equals(actual))return false;
            }
            return true;
        }
        boolean sameWindow(AtomicWorkbenchEditorEvidence full){
            return full!=null&&accessibilityWindowId==full.accessibilityWindowId&&windowGeneration.equals(full.windowGeneration);
        }
        boolean sameWindow(WindowEvidence other){
            return other!=null&&accessibilityWindowId==other.accessibilityWindowId&&windowGeneration.equals(other.windowGeneration);
        }
        Bundle toBundle(){
            Bundle b=new Bundle();b.putInt("schema",2);b.putBundle("request",new Bundle(request));
            b.putInt("a11y_window",accessibilityWindowId);b.putString("window_generation",windowGeneration);b.putLong("sampled",sampledAt);return b;
        }
        static WindowEvidence fromBundle(Bundle b){
            if(b==null||!b.keySet().equals(Set.of("schema","request","a11y_window","window_generation","sampled"))
                    ||!Integer.valueOf(2).equals(b.get("schema"))||!(b.get("request") instanceof Bundle)
                    ||!(b.get("a11y_window") instanceof Integer)||!(b.get("window_generation") instanceof String)
                    ||!(b.get("sampled") instanceof Long))throw new IllegalArgumentException("invalid_window_evidence");
            return new WindowEvidence(b.getBundle("request"),b.getInt("a11y_window"),b.getString("window_generation"),b.getLong("sampled",-1));
        }
        static WindowEvidence query(IBinder windowManager,AtomicWorkbenchPasteRequest r)throws Exception{
            String invalid=AtomicWorkbenchPastePolicy.invalid(r,SystemClock.elapsedRealtime());
            if(invalid!=null)throw new IllegalStateException(invalid);
            String nonce=UUID.randomUUID().toString().replace("-","");Parcel data=Parcel.obtain(),reply=Parcel.obtain();
            try{
                data.writeInterfaceToken(DESCRIPTOR);data.writeInt(2);data.writeString(nonce);data.writeLong(r.deadlineAt);
                data.writeInt(r.moduleUid);data.writeInt(r.userId);data.writeInt(r.windowId);data.writeInt(r.displayId);
                data.writeString(r.displayName);data.writeString(r.displayUniqueId);data.writeInt(r.targetUid);data.writeInt(r.taskId);data.writeString(r.packageName);
                if(windowManager==null||!windowManager.transact(TRANSACTION,data,reply,0))throw new IllegalStateException("window_evidence_unavailable");
                reply.readException();
                if(reply.readInt()!=2||!nonce.equals(reply.readString())||reply.readInt()!=1)throw new IllegalStateException("window_evidence_rejected");
                WindowEvidence proof=new WindowEvidence(r,reply.readInt(),reply.readString(),reply.readLong());
                if(reply.dataAvail()!=0||!proof.matches(r,SystemClock.elapsedRealtime()))throw new IllegalStateException("stale_window_evidence");
                return proof;
            }finally{data.recycle();reply.recycle();}
        }
    }
}
