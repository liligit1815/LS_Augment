package ls.augment.com;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import java.io.IOException;
import java.util.Set;
import java.util.UUID;
import java.util.function.Supplier;

/** Root's phone-only geometry transport. Authentication is freshly supplied for each RPC. */
public final class AtomicWorkbenchExtractionGeometryTransport {
    public static final int TRANSACTION=0x00D04E06;
    public static final String DESCRIPTOR="ls.augment.com.atomic_extraction_geometry.v1";
    private final IBinder window;
    private final Supplier<Bundle> authentication;
    public AtomicWorkbenchExtractionGeometryTransport(IBinder window,Supplier<Bundle> authentication){
        if(window==null||authentication==null)throw new IllegalArgumentException("missing_extraction_geometry_transport");
        this.window=window;this.authentication=authentication;
    }
    /** Geometry fields are strict and checked against actual WMS windows/displays by system_server. */
    public Bundle register(Bundle geometry)throws IOException{
        Bundle b=exchange(1,geometry);
        if(!b.keySet().equals(Set.of("ticket","revision","display_id","display_name","unique_id","deadline"))
                ||!hex(b.get("ticket"),32)||!(b.get("revision") instanceof Long)||!(b.get("display_id") instanceof Integer)
                ||!(b.get("display_name") instanceof String)||!(b.get("unique_id") instanceof String)||!(b.get("deadline") instanceof Long)
                ||!java.util.Objects.equals(b.get("revision"),geometry.get("revision"))
                ||!java.util.Objects.equals(b.get("display_id"),geometry.get("display_id"))
                ||!java.util.Objects.equals(b.get("display_name"),geometry.get("display_name"))
                ||!java.util.Objects.equals(b.get("unique_id"),geometry.get("unique_id"))
                ||!java.util.Objects.equals(b.get("deadline"),geometry.get("deadline"))
                ||(Long)b.get("deadline")<=SystemClock.elapsedRealtime())
            throw new IOException("extraction_geometry_invalid_reply");return b;
    }
    public boolean clear(int windowId,String ticket)throws IOException{
        if(!AtomicWorkbenchSlotDomain.contains(windowId)||!hex(ticket,32))throw new IOException("extraction_geometry_invalid_identity");
        Bundle b=new Bundle();b.putInt("window_id",windowId);b.putString("ticket",ticket);return cleared(exchange(2,b));
    }
    public boolean clearAll()throws IOException{return cleared(exchange(3,new Bundle()));}
    private static boolean cleared(Bundle b)throws IOException{
        if(!b.keySet().equals(Set.of("cleared"))||!Boolean.TRUE.equals(b.get("cleared")))throw new IOException("extraction_geometry_cleanup_pending");return true;
    }
    private Bundle exchange(int action,Bundle geometry)throws IOException{
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();String nonce=UUID.randomUUID().toString().replace("-","");
        try{
            Bundle auth=authentication.get();if(auth==null||geometry==null||!window.isBinderAlive())throw new IOException("extraction_geometry_unavailable");
            data.writeInterfaceToken(DESCRIPTOR);data.writeInt(1);data.writeInt(action);data.writeString(nonce);
            data.writeBundle(new Bundle(auth));data.writeBundle(new Bundle(geometry));
            if(!window.transact(TRANSACTION,data,reply,0))throw new IOException("extraction_geometry_unavailable");
            reply.readException();if(reply.readInt()!=1||!nonce.equals(reply.readString()))throw new IOException("extraction_geometry_rejected");
            int success=reply.readInt();Bundle b=reply.readBundle(getClass().getClassLoader());
            if((success!=0&&success!=1)||b==null||reply.dataAvail()!=0)throw new IOException("extraction_geometry_invalid_reply");
            if(success==0){
                if(!b.keySet().equals(Set.of("reason"))||!(b.get("reason") instanceof String)
                        ||!Set.of("protected","stale","cancelled","expired","unavailable","rejected","busy").contains(b.getString("reason")))
                    throw new IOException("extraction_geometry_invalid_reply");
                throw new IOException("extraction_geometry_"+b.getString("reason"));
            }
            return b;
        }catch(IOException fixed){throw fixed;}
        catch(Exception unavailable){throw new IOException("extraction_geometry_unavailable",unavailable);}
        finally{reply.recycle();data.recycle();}
    }
    private static boolean hex(Object value,int n){return value instanceof String&&((String)value).length()==n&&((String)value).matches("[0-9a-f]+");}
}
