package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import java.io.IOException;
import java.util.Set;
import java.util.UUID;

/** A Proof's fields alone confer no authority: both reads require a live system lease validation. */
public interface AtomicWorkbenchExtractionAuthority {
    int TRANSACTION = 0x00D04E02, SCHEMA = 1, PREPARE = 1, VALIDATE = 2, RELEASE = 3;
    String DESCRIPTOR = "ls.augment.com.atomic_extraction_evidence.v1";
    Proof prepare(AtomicWorkbenchExtractionRequest request) throws Exception;
    boolean validate(AtomicWorkbenchExtractionRequest request, Proof proof) throws Exception;
    void release(AtomicWorkbenchExtractionRequest request, Proof proof) throws Exception;

    /** No fallback authority. A missing Hook or hidden API failure is an actual unavailable result. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static AtomicWorkbenchExtractionAuthority system() {
        return new BinderAuthority((action, request, proof) -> {
            Object service = Class.forName("android.os.ServiceManager").getMethod("getService", String.class).invoke(null, "window");
            if (!(service instanceof IBinder)) throw new IOException("extraction_authority_unavailable");
            return exchange((IBinder) service, action, request, proof);
        });
    }
    interface Transport { Bundle exchange(int action, AtomicWorkbenchExtractionRequest request, Proof proof) throws Exception; }
    final class Denied extends IOException {
        public final AtomicWorkbenchExtractionResult.State state;
        private Denied(AtomicWorkbenchExtractionResult.State state) { super("extraction_"+state.name().toLowerCase(java.util.Locale.ROOT));this.state=state; }
    }

    final class BinderAuthority implements AtomicWorkbenchExtractionAuthority {
        private final Transport transport;
        BinderAuthority(Transport transport) { if (transport == null) throw new IllegalArgumentException("missing_extraction_transport"); this.transport=transport; }
        @Override public Proof prepare(AtomicWorkbenchExtractionRequest r) throws Exception {
            if (r == null || !r.fresh(SystemClock.elapsedRealtime())) throw new IOException("extraction_ticket_expired");
            Proof p=Proof.parse(transport.exchange(PREPARE,r,null));
            if(!p.matches(r,SystemClock.elapsedRealtime()))throw new IOException("extraction_proof_rejected");return p;
        }
        @Override public boolean validate(AtomicWorkbenchExtractionRequest r, Proof p) throws Exception {
            if(r==null||p==null||!p.matches(r,SystemClock.elapsedRealtime()))return false;
            Proof current=Proof.parse(transport.exchange(VALIDATE,r,p));
            return current.matches(r,SystemClock.elapsedRealtime())&&p.sameSource(current);
        }
        @Override public void release(AtomicWorkbenchExtractionRequest r, Proof p) throws Exception {
            if(r==null||p==null)return;
            Bundle reply=transport.exchange(RELEASE,r,p);
            AtomicWorkbenchExtractionRequest.exact(reply,Set.of("released"));
            if(!Boolean.TRUE.equals(reply.get("released")))throw new IOException("extraction_release_pending");
        }
    }

    /** Root may relay the real window service Binder, but the public default resolves it itself. */
    static Bundle exchange(IBinder systemWindow, int action, AtomicWorkbenchExtractionRequest r, Proof p) throws Exception {
        String nonce=UUID.randomUUID().toString().replace("-","");
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();
        try {
            if(systemWindow==null||!systemWindow.isBinderAlive())throw new IOException("extraction_authority_unavailable");
            data.writeInterfaceToken(DESCRIPTOR);data.writeInt(SCHEMA);data.writeInt(action);data.writeString(nonce);
            data.writeBundle(r.metadata());data.writeString(p==null?null:p.leaseId);data.writeString(p==null?null:p.windowNonce);
            if(!systemWindow.transact(TRANSACTION,data,reply,0))throw new IOException("extraction_authority_unavailable");
            reply.readException();
            if(reply.readInt()!=SCHEMA||!nonce.equals(reply.readString()))throw new IOException("extraction_authority_rejected");
            int success=reply.readInt();
            Bundle value=reply.readBundle(Proof.class.getClassLoader());
            if(value==null||reply.dataAvail()!=0||(success!=0&&success!=1))throw new IOException("extraction_authority_invalid_reply");
            if(success==0){
                AtomicWorkbenchExtractionRequest.exact(value,Set.of("reason"));
                AtomicWorkbenchExtractionResult.State state=switch(AtomicWorkbenchExtractionRequest.string(value,"reason")) {
                    case "protected" -> AtomicWorkbenchExtractionResult.State.PROTECTED;
                    case "stale" -> AtomicWorkbenchExtractionResult.State.STALE;
                    case "cancelled" -> AtomicWorkbenchExtractionResult.State.CANCELLED;
                    case "expired" -> AtomicWorkbenchExtractionResult.State.TIMEOUT;
                    case "unavailable" -> AtomicWorkbenchExtractionResult.State.UNAVAILABLE;
                    case "rejected" -> AtomicWorkbenchExtractionResult.State.REJECTED;
                    case "busy" -> AtomicWorkbenchExtractionResult.State.BUSY;
                    default -> throw new IOException("extraction_authority_invalid_reason");
                };
                throw new Denied(state);
            }
            return value;
        } finally {reply.recycle();data.recycle();}
    }

    final class Proof {
        public final String requestId,pointerTicket,leaseId,windowNonce,windowGeneration,displayName,displayUniqueId,packageName;
        public final int displayId,userId,moduleUid,targetUid,taskId,accessibilityWindowId,left,top,right,bottom;
        public final float pointX,pointY;
        public final long issuedAt,sampledAt,deadlineAt;
        private Proof(Bundle b) {
            requestId=s(b,"id");pointerTicket=s(b,"ticket");leaseId=s(b,"lease");windowNonce=s(b,"window_nonce");windowGeneration=s(b,"window_generation");
            displayName=s(b,"name");displayUniqueId=s(b,"unique");packageName=s(b,"package");displayId=i(b,"display");userId=i(b,"user");
            moduleUid=i(b,"module_uid");targetUid=i(b,"uid");taskId=i(b,"task");accessibilityWindowId=i(b,"a11y_window");
            left=i(b,"left");top=i(b,"top");right=i(b,"right");bottom=i(b,"bottom");pointX=AtomicWorkbenchExtractionRequest.decimal(b,"x");pointY=AtomicWorkbenchExtractionRequest.decimal(b,"y");
            issuedAt=n(b,"issued");sampledAt=n(b,"sampled");deadlineAt=n(b,"deadline");
            if(i(b,"schema")!=SCHEMA||!AtomicWorkbenchExtractionRequest.hex(requestId,32)||!AtomicWorkbenchExtractionRequest.hex(pointerTicket,32)
                    ||!AtomicWorkbenchExtractionRequest.hex(leaseId,32)||!AtomicWorkbenchExtractionRequest.hex(windowNonce,32)||!AtomicWorkbenchExtractionRequest.hex(windowGeneration,32)
                    ||!AtomicWorkbenchExtractionRequest.identifier(displayName,256)||!AtomicWorkbenchExtractionRequest.identifier(displayUniqueId,512)
                    ||!AtomicWorkbenchExtractionRequest.identifier(packageName,256)||displayId<0||userId<0||moduleUid<10000||moduleUid/100000!=userId
                    ||targetUid<0||targetUid/100000!=userId||taskId<0||accessibilityWindowId<0||right<=left||bottom<=top
                    ||pointX<left||pointX>=right||pointY<top||pointY>=bottom||issuedAt<0||sampledAt<issuedAt||deadlineAt<=sampledAt
                    ||!Boolean.FALSE.equals(b.get("protected")))throw new IllegalArgumentException("invalid_extraction_proof");
        }
        static Proof parse(Bundle b) {
            AtomicWorkbenchExtractionRequest.exact(b,Set.of("schema","id","ticket","lease","window_nonce","window_generation","name","unique","package",
                    "display","user","module_uid","uid","task","a11y_window","left","top","right","bottom","x","y","issued","sampled","deadline","protected"));
            return new Proof(b);
        }
        public boolean matches(AtomicWorkbenchExtractionRequest r,long now) {
            if(r==null||!r.fresh(now)||now<sampledAt||deadlineAt!=r.deadlineAt||issuedAt!=r.issuedAt||!r.id.equals(requestId)
                    ||!r.pointerTicket.equals(pointerTicket)||moduleUid!=r.moduleUid||userId!=r.userId)return false;
            return r.geometry==null?displayId==0:displayId==r.geometry.displayId&&r.geometry.displayName.equals(displayName)&&r.geometry.displayUniqueId.equals(displayUniqueId);
        }
        boolean sameSource(Proof p) {
            return p!=null&&requestId.equals(p.requestId)&&pointerTicket.equals(p.pointerTicket)&&leaseId.equals(p.leaseId)&&windowNonce.equals(p.windowNonce)
                    &&windowGeneration.equals(p.windowGeneration)&&displayName.equals(p.displayName)&&displayUniqueId.equals(p.displayUniqueId)&&packageName.equals(p.packageName)
                    &&displayId==p.displayId&&userId==p.userId&&moduleUid==p.moduleUid&&targetUid==p.targetUid&&taskId==p.taskId&&accessibilityWindowId==p.accessibilityWindowId
                    &&left==p.left&&top==p.top&&right==p.right&&bottom==p.bottom&&Float.compare(pointX,p.pointX)==0&&Float.compare(pointY,p.pointY)==0;
        }
        private static String s(Bundle b,String k){return AtomicWorkbenchExtractionRequest.string(b,k);}
        private static int i(Bundle b,String k){return AtomicWorkbenchExtractionRequest.integer(b,k);}
        private static long n(Bundle b,String k){return AtomicWorkbenchExtractionRequest.number(b,k);}
    }
}
