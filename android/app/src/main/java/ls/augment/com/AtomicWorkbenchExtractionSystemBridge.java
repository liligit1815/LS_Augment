package ls.augment.com;

import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Process;
import android.os.SystemClock;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.io.IOException;

/** Phone service lifecycle and system-minted tickets. This bridge never accepts a client point. */
public final class AtomicWorkbenchExtractionSystemBridge {
    private static final int TX=0x00D04E07;
    private static final String CONTROL="ls.augment.com.atomic_extraction_control.v1",CALLBACK="ls.augment.com.atomic_extraction_callback.v1";
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(1,1,0,TimeUnit.SECONDS,new ArrayBlockingQueue<>(2),
            action->{Thread t=new Thread(action,"Duo-ExtractionControl");t.setDaemon(true);return t;});
    private static volatile AtomicWorkbenchExtractionSystemBridge live;
    private static volatile Consumer<AtomicWorkbenchExtractionResult> listener;
    private final AtomicWorkbenchPasteService service;
    private final String generation=UUID.randomUUID().toString().replace("-","");
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Object lock=new Object();
    private volatile boolean connected=true,registered,observing;
    private boolean controlPending;
    private AtomicWorkbenchExtractionRequest active;
    private final Binder callback=new Binder(){
        @Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            if(code!=1&&code!=2)return false;
            if(Binder.getCallingUid()!=1000||!acceptsOneWayBinderFlags(flags))return true;
            try{
                if(data==null||data.dataSize()>8192)return true;
                data.enforceInterface(CALLBACK);
                if(code==1){
                    AtomicWorkbenchExtractionRequest r=AtomicWorkbenchExtractionRequest.fromBundle(data.readBundle(getClass().getClassLoader()));
                    if(data.dataAvail()!=0||r.moduleUid!=Process.myUid()||r.userId!=Process.myUid()/100000||!r.fresh(SystemClock.elapsedRealtime()))return true;
                    synchronized(lock){if(!current())return true;active=r;}
                    main.post(()->issue(r));
                }else{
                    String id=data.readString(),ticket=data.readString(),reason=data.readString();
                    if(data.dataAvail()!=0||!hex(id,32)||!hex(ticket,32)||!Set.of("cancelled","expired","stale","unavailable").contains(reason))return true;
                    synchronized(lock){if(active==null||!id.equals(active.id)||!ticket.equals(active.pointerTicket))return true;active=null;}
                    main.post(()->AtomicWorkbenchPasteService.cancelExtraction(id));
                }
            }catch(RuntimeException malformed){/* No body or arbitrary Binder error escapes this private callback. */}
            return true;
        }
    };
    private static boolean acceptsOneWayBinderFlags(int flags){
        // Native Binder supplies TF_ACCEPT_FDS and a server-side reply wrapper even for one-way calls.
        return (flags & ~0x10) == IBinder.FLAG_ONEWAY;
    }
    private AtomicWorkbenchExtractionSystemBridge(AtomicWorkbenchPasteService service){this.service=service;}
    /** A new actual service connection always gets a new generation, including reconnects. */
    static void connect(AtomicWorkbenchPasteService service){
        if(service==null)throw new IllegalArgumentException("missing_extraction_service");
        AtomicWorkbenchExtractionSystemBridge previous=live,next=new AtomicWorkbenchExtractionSystemBridge(service);live=next;
        if(previous!=null)previous.stop();next.register();
    }
    static void disconnect(AtomicWorkbenchPasteService service){
        AtomicWorkbenchExtractionSystemBridge b=live;if(b==null||b.service!=service)return;
        live=null;b.stop();
    }
    /** Only the real local service lifecycle supplies these values to the config provider. */
    static Bundle localState(){
        AtomicWorkbenchExtractionSystemBridge b=live;boolean connected=b!=null&&b.current();
        Bundle value=new Bundle();value.putString("service_generation",connected?b.generation:"");
        value.putBoolean("connected",connected);value.putInt("module_uid",Process.myUid());return value;
    }
    public static void setResultListener(Consumer<AtomicWorkbenchExtractionResult> callback){listener=callback;}
    public static boolean isRegistered(){AtomicWorkbenchExtractionSystemBridge b=live;return b!=null&&b.current()&&b.registered&&b.observing;}
    /** Blocking fresh system probe: call on a bounded UI worker, never on the UI thread. */
    public static boolean checkReady()throws IOException{
        AtomicWorkbenchExtractionSystemBridge b=live;if(b==null||!b.current())return false;
        try{
            Bundle request=new Bundle();request.putString("service_generation",b.generation);Bundle reply=control(3,request);
            return b.current()&&Boolean.TRUE.equals(reply.get("registered"))&&Boolean.TRUE.equals(reply.get("observing"));
        }catch(Exception unavailable){throw new IOException("extraction_system_unavailable");}
    }
    private boolean current(){return connected&&live==this;}
    private void issue(AtomicWorkbenchExtractionRequest r){
        synchronized(lock){if(!current()||active!=r||!r.fresh(SystemClock.elapsedRealtime()))return;}
        // requestExtraction already reports a refused request once; do not manufacture a second result.
        AtomicWorkbenchPasteService.requestExtraction(r,result->{
            Consumer<AtomicWorkbenchExtractionResult> out;
            synchronized(lock){if(!current()||active!=r||!r.fresh(SystemClock.elapsedRealtime()))return;out=listener;}
            if(out!=null)out.accept(result);else AtomicWorkbenchExtractionPresentation.show(service,result,r);
        });
    }
    private void register(){
        synchronized(lock){if(!current()||controlPending)return;controlPending=true;}
        try{IO.execute(()->{
            try{
                if(!current())return;
                Bundle b=new Bundle();b.putString("service_generation",generation);b.putBinder("callback",callback);
                b.putInt("user",Process.myUid()/100000);b.putInt("module_uid",Process.myUid());
                Bundle result=control(1,b);
                if(current()){registered=Boolean.TRUE.equals(result.get("registered"));observing=Boolean.TRUE.equals(result.get("observing"));}
            }catch(Exception unavailable){registered=false;observing=false;}
            finally{
                synchronized(lock){controlPending=false;}
                if(current()&&(!registered||!observing))main.postDelayed(this::register,1500);
            }
        });}catch(java.util.concurrent.RejectedExecutionException full){
            synchronized(lock){controlPending=false;}if(current())main.postDelayed(this::register,1500);
        }
    }
    private void stop(){
        AtomicWorkbenchExtractionRequest pending;
        synchronized(lock){connected=false;registered=false;observing=false;pending=active;active=null;}
        if(pending!=null)AtomicWorkbenchPasteService.cancelExtraction(pending.id);
        try{IO.execute(()->{try{Bundle b=new Bundle();b.putString("service_generation",generation);control(2,b);}catch(Exception ignored){/* Fresh provider state already rejects this generation. */}});}catch(java.util.concurrent.RejectedExecutionException full){/* No replacement worker is spawned for noncooperative IPC. */}
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static Bundle control(int action,Bundle request)throws Exception{
        Object value=Class.forName("android.os.ServiceManager").getMethod("getService",String.class).invoke(null,"window");
        if(!(value instanceof IBinder)||!((IBinder)value).isBinderAlive())throw new IllegalStateException("extraction_control_unavailable");
        Parcel data=Parcel.obtain(),reply=Parcel.obtain();String nonce=UUID.randomUUID().toString().replace("-","");
        try{
            data.writeInterfaceToken(CONTROL);data.writeInt(1);data.writeInt(action);data.writeString(nonce);data.writeBundle(request);
            if(!((IBinder)value).transact(TX,data,reply,0))throw new IllegalStateException("extraction_control_unavailable");
            reply.readException();if(reply.readInt()!=1||!nonce.equals(reply.readString()))throw new IllegalStateException("extraction_control_rejected");
            int ok=reply.readInt();Bundle b=reply.readBundle(AtomicWorkbenchExtractionSystemBridge.class.getClassLoader());
            if(reply.dataAvail()!=0||ok!=1||b==null||!b.keySet().equals(Set.of("registered","observing","reason"))
                    ||!(b.get("registered") instanceof Boolean)||!(b.get("observing") instanceof Boolean)||!"".equals(b.get("reason")))
                throw new IllegalStateException("extraction_control_rejected");return b;
        }finally{reply.recycle();data.recycle();}
    }
    private static boolean hex(String s,int n){return s!=null&&s.length()==n&&s.matches("[0-9a-f]+");}
}
