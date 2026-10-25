package ls.augment.com.hook;

import android.graphics.Rect;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.SystemClock;
import android.os.Parcel;
import android.view.Display;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import static ls.augment.com.hook.AtomicWorkbenchExtractionWindowResolver.*;

/** Authenticated, short-lived Root geometry; coordinates alone never mint extraction authority. */
final class AtomicWorkbenchExtractionGeometryBroker {
    interface Listeners { void add(Geometry geometry)throws Exception;void remove(Geometry geometry)throws Exception; }
    static final class Geometry {
        final AtomicWorkbenchSystemRootAuthority.Session owner;
        final String ticket=random(),name,unique;
        final int slot,display,hostTask,width,height;
        final long inputRevision,uiEpoch,revision,deadline;
        final IBinder hostToken;
        final float left,top,right,bottom;
        final Window host;
        Object content;
        IBinder.DeathRecipient death;
        boolean retryQueued;
        Geometry(AtomicWorkbenchSystemRootAuthority.Session owner,Bundle b,Window host)throws Refusal{
            this.owner=owner;slot=i(b,"window_id");display=i(b,"display_id");name=s(b,"display_name");unique=s(b,"unique_id");
            hostToken=(IBinder)b.get("host_window");hostTask=i(b,"host_task");width=i(b,"buffer_width");height=i(b,"buffer_height");
            left=f(b,"left");top=f(b,"top");right=f(b,"right");bottom=f(b,"bottom");
            inputRevision=n(b,"input_revision");uiEpoch=n(b,"ui_epoch");revision=n(b,"revision");deadline=n(b,"deadline");this.host=host;
        }
        boolean contains(float x,float y){return Float.isFinite(x)&&Float.isFinite(y)&&x>=left&&x<right&&y>=top&&y<bottom;}
        float x(float physical){return (physical-left)*(width-1)/(right-left);}
        float y(float physical){return (physical-top)*(height-1)/(bottom-top);}
        boolean principal(AtomicWorkbenchSystemRootAuthority.Session s){return s!=null&&owner.rootPid==s.rootPid&&owner.moduleUid==s.moduleUid
                &&owner.userId==s.userId&&owner.session==s.session&&owner.resetGeneration==s.resetGeneration&&owner.endpoint.equals(s.endpoint)&&owner.owner.equals(s.owner);}
        Bundle metadata(){Bundle b=new Bundle();b.putString("ticket",ticket);b.putLong("revision",revision);b.putInt("display_id",display);
            b.putString("display_name",name);b.putString("unique_id",unique);b.putLong("deadline",deadline);return b;}
    }
    private final Object wms,lock=new Object();
    private final AtomicWorkbenchExtractionWindowResolver resolver;
    private final AtomicWorkbenchExtractionPointerBroker broker;
    private final AtomicWorkbenchExtractionPointerBroker.Scheduler scheduler;
    private final Listeners listeners;
    private final Map<Integer,Geometry> slots=new LinkedHashMap<>();
    private final Map<Integer,Geometry> pendingRemoval=new LinkedHashMap<>();
    private boolean controlBusy;
    AtomicWorkbenchExtractionGeometryBroker(Object wms,AtomicWorkbenchExtractionWindowResolver resolver,
            AtomicWorkbenchExtractionPointerBroker broker,AtomicWorkbenchExtractionPointerBroker.Scheduler scheduler,Listeners listeners){
        this.wms=wms;this.resolver=resolver;this.broker=broker;this.scheduler=scheduler;this.listeners=listeners;
    }
    Bundle control(int action,Bundle auth,Bundle b,int uid,int pid)throws Exception{
        // Authentication sees the original Binder principal, before ANY clearCallingIdentity.
        if(action<1||action>3||auth==null||b==null)throw new Refusal("rejected");
        AtomicWorkbenchSystemRootAuthority.Session owner=action==1
                ?AtomicWorkbenchSystemRootAuthority.authenticate(resolver.context(),auth,uid,pid)
                :AtomicWorkbenchSystemRootAuthority.authenticateCleanup(resolver.context(),auth,uid,pid);
        synchronized(lock){if(controlBusy)throw new Refusal("busy");controlBusy=true;}
        long identity=Binder.clearCallingIdentity();
        try{
            if(action==1)return register(owner,b);
            if(action==2){exact(b,Set.of("window_id","ticket"));int slot=i(b,"window_id");String ticket=s(b,"ticket");
                if(slot<0||slot>7||!hex(ticket,32))throw new Refusal("rejected");Geometry old;
                synchronized(lock){old=slots.get(slot);if(old==null)old=pendingRemoval.get(slot);if(old!=null&&(!old.principal(owner)||!old.ticket.equals(ticket)))throw new Refusal("stale");}
                if(old!=null)removeWithRetry(old);
            }else{
                exact(b,Set.of());Geometry[] all;
                synchronized(lock){all=java.util.stream.Stream.concat(slots.values().stream(),pendingRemoval.values().stream()).distinct().toArray(Geometry[]::new);}
                for(Geometry g:all)if(g.principal(owner))removeWithRetry(g);
            }
            Bundle out=new Bundle();out.putBoolean("cleared",true);return out;
        }finally{Binder.restoreCallingIdentity(identity);synchronized(lock){controlBusy=false;}}
    }
    private Bundle register(AtomicWorkbenchSystemRootAuthority.Session owner,Bundle b)throws Exception{
        exact(b,Set.of("window_id","display_id","display_name","unique_id","host_window","host_task","left","top","right","bottom",
                "buffer_width","buffer_height","input_revision","ui_epoch","revision","deadline"));
        int slot=i(b,"window_id"),display=i(b,"display_id"),width=i(b,"buffer_width"),height=i(b,"buffer_height");
        long deadline=n(b,"deadline"),now=scheduler.elapsed();
        if(slot<0||slot>7||display<=0||width<2||height<2||width>16384||height>16384||!(b.get("host_window") instanceof IBinder)
                ||!((IBinder)b.get("host_window")).isBinderAlive()||i(b,"host_task")<0||n(b,"input_revision")<1||n(b,"ui_epoch")<1||n(b,"revision")<1
                ||deadline<=now||deadline-now>2500||!identifier(s(b,"unique_id"),512)
                ||!s(b,"display_name").matches("DuoAtomic-"+owner.moduleUid+"-w"+slot+"-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
                ||f(b,"left")<0||f(b,"top")<0||f(b,"right")<=f(b,"left")||f(b,"bottom")<=f(b,"top"))throw new Refusal("rejected");
        if(broker.physicalHeld())throw new Refusal("busy");
        Window host=resolver.window(0,owner.userId,(f(b,"left")+f(b,"right"))/2,(f(b,"top")+f(b,"bottom"))/2);
        Geometry next=new Geometry(owner,b,host);validateHost(next,host);display(next);
        if(!owner.isCurrent(resolver.context()))throw new Refusal("stale");
        if(!host.same(resolver.window(0,owner.userId,host.x,host.y)))throw new Refusal("stale");display(next);
        if(scheduler.elapsed()>=next.deadline)throw new Refusal("expired");
        Geometry previous;
        synchronized(lock){previous=slots.get(slot);if(previous==null)previous=pendingRemoval.get(slot);}
        if(previous!=null)removeWithRetry(previous);
        next.death=()->{try{remove(next);}catch(Exception pending){retry(next);}};
        owner.endpoint.linkToDeath(next.death,0);
        try{owner.owner.linkToDeath(next.death,0);}catch(Exception failed){owner.endpoint.unlinkToDeath(next.death,0);throw failed;}
        try{
            if(!owner.isAlive()||!broker.publishGeometryIfIdle(()->{synchronized(lock){slots.put(slot,next);}}))throw new Refusal("busy");
            listeners.add(next);
            if(!currentLocal(next)||!owner.isCurrent(resolver.context())||scheduler.elapsed()>=next.deadline)throw new Refusal("stale");
            probeCurrent(next);
            if(!currentLocal(next))throw new Refusal("stale");
            scheduler.post(()->{if(scheduler.elapsed()>=next.deadline)try{remove(next);}catch(Exception pending){retry(next);}},next.deadline-scheduler.elapsed());
            return next.metadata();
        }catch(Exception failed){try{remove(next);}catch(Exception pending){retry(next);}throw failed;}
    }
    Geometry match(Window host,float x,float y){
        synchronized(lock){for(Geometry g:slots.values())if(currentLocalLocked(g)&&g.owner.moduleUid==host.uid&&g.owner.userId==host.user
                &&g.hostToken.equals(host.token)&&g.hostTask==host.taskId&&g.contains(x,y))return g;return null;}
    }
    Geometry displayOwner(int id,int uid,int pid){
        synchronized(lock){for(Geometry g:slots.values())if(g.display==id&&uid==0&&g.owner.rootPid==pid&&currentLocalLocked(g))return g;return null;}
    }
    Geometry monitorOwner(int id){synchronized(lock){for(Geometry g:slots.values())if(g.display==id&&currentLocalLocked(g))return g;return null;}}
    boolean currentLocal(Geometry g){synchronized(lock){return currentLocalLocked(g);}}
    private boolean currentLocalLocked(Geometry g){return g!=null&&slots.get(g.slot)==g&&g.owner.isAlive()&&scheduler.elapsed()<g.deadline;}
    void current(Geometry g,Window physical)throws Exception{
        if(!currentLocal(g)||!g.owner.isCurrent(resolver.context()))throw new Refusal("stale");
        validateHost(g,physical);display(g);
        probeCurrent(g);
        if(!currentLocal(g))throw new Refusal("stale");
    }
    private void probeCurrent(Geometry g)throws Exception{
        String nonce=random();Parcel data=Parcel.obtain(),reply=Parcel.obtain();long identity=Binder.clearCallingIdentity();
        try{
            Bundle b=new Bundle();b.putInt("window_id",g.slot);b.putInt("display_id",g.display);b.putString("display_name",g.name);b.putString("unique_id",g.unique);
            b.putLong("input_revision",g.inputRevision);b.putLong("ui_epoch",g.uiEpoch);b.putLong("revision",g.revision);b.putLong("deadline",g.deadline);
            b.putLong("provider_session",g.owner.session);b.putLong("reset_generation",g.owner.resetGeneration);
            data.writeInterfaceToken("ls.augment.com.atomic_extraction_geometry_current.v1");data.writeInt(1);data.writeString(nonce);data.writeBundle(b);
            if(!g.owner.endpoint.isBinderAlive()||!g.owner.endpoint.transact(0x00D04E08,data,reply,0))throw new Refusal("unavailable");
            reply.readException();if(reply.readInt()!=1||!nonce.equals(reply.readString())||reply.readInt()!=1||reply.dataAvail()!=0)throw new Refusal("stale");
            if(scheduler.elapsed()>=g.deadline||!g.owner.isAlive())throw new Refusal("expired");
        }finally{Binder.restoreCallingIdentity(identity);reply.recycle();data.recycle();}
    }
    private static void validateHost(Geometry g,Window host)throws Refusal{
        if(!PACKAGE.equals(host.pkg)||host.uid!=g.owner.moduleUid||host.user!=g.owner.userId||!g.hostToken.equals(host.token)
                ||host.taskId!=g.hostTask||host.display!=0||g.left<host.bounds.left||g.top<host.bounds.top||g.right>host.bounds.right
                ||g.bottom>host.bounds.bottom||g.right-g.left<1||g.bottom-g.top<1)throw new Refusal("rejected");
    }
    private void display(Geometry g)throws Exception{
        synchronized(field(wms,"mGlobalLock")){
            if(number(wms,"mCurrentUserId")!=g.owner.userId)throw new Refusal("stale");
            Object c=call(field(wms,"mRoot"),"getDisplayContent",new Class<?>[]{int.class},g.display);
            if(c==null)throw new Refusal("stale");Display d=(Display)field(c,"mDisplay");
            if(g.content!=null&&g.content!=c)throw new Refusal("stale");g.content=c;
            int flags=d.getFlags();
            int required=ls.augment.com.AtomicWorkbenchDisplayPolicy.requiredFocusFlags();
            int forbidden=ls.augment.com.AtomicWorkbenchDisplayPolicy.forbiddenFlags();
            if(!d.isValid()||d.getDisplayId()!=g.display||!g.name.equals(d.getName())||!g.unique.equals(call(d,"getUniqueId",new Class<?>[0]))
                    ||(Integer)call(d,"getOwnerUid",new Class<?>[0])!=0||(Integer)call(d,"getType",new Class<?>[0])!=5
                    ||(flags&required)!=required||(flags&forbidden)!=0)throw new Refusal("stale");
            android.graphics.Point p=new android.graphics.Point();d.getRealSize(p);if(p.x!=g.width||p.y!=g.height)throw new Refusal("stale");
        }
    }
    private void remove(Geometry g)throws Exception{
        boolean owns;
        synchronized(lock){owns=slots.get(g.slot)==g||pendingRemoval.get(g.slot)==g;
            if(slots.get(g.slot)==g)slots.remove(g.slot);if(owns)pendingRemoval.put(g.slot,g);}
        broker.geometryInvalidated(g);
        // Never unregister a newly reused display's monitor: pending registration blocks slot reuse.
        listeners.remove(g);
        g.owner.endpoint.unlinkToDeath(g.death,0);g.owner.owner.unlinkToDeath(g.death,0);
        synchronized(lock){if(pendingRemoval.get(g.slot)==g)pendingRemoval.remove(g.slot);}
    }
    private void removeWithRetry(Geometry g)throws Exception{try{remove(g);}catch(Exception pending){retry(g);throw pending;}}
    private void retry(Geometry g){
        synchronized(lock){if(g.retryQueued)return;g.retryQueued=true;}
        if(!scheduler.post(()->{try{remove(g);}catch(Exception pending){/* Exact object responsibility stays in pendingRemoval. */}
            finally{boolean remaining;synchronized(lock){g.retryQueued=false;remaining=pendingRemoval.get(g.slot)==g;}if(remaining)retry(g);}},1000)){
            synchronized(lock){g.retryQueued=false;}
        }
    }
    private static void exact(Bundle b,Set<String> keys)throws Refusal{if(b==null||!b.keySet().equals(keys))throw new Refusal("rejected");}
    private static String s(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof String))throw new Refusal("rejected");return(String)v;}
    private static int i(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof Integer))throw new Refusal("rejected");return(Integer)v;}
    private static long n(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof Long))throw new Refusal("rejected");return(Long)v;}
    private static float f(Bundle b,String k)throws Refusal{Object v=b.get(k);if(!(v instanceof Float)||!Float.isFinite((Float)v))throw new Refusal("rejected");return(Float)v;}
}
