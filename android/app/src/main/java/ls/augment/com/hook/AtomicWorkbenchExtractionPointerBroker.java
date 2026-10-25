package ls.augment.com.hook;

import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Parcel;
import android.os.SystemClock;
import android.view.MotionEvent;
import java.util.LinkedHashMap;
import java.util.Map;
import ls.augment.com.AtomicWorkbenchExtractionRequest;
import ls.augment.com.AtomicWorkbenchExtractionPolicy;
import static ls.augment.com.hook.AtomicWorkbenchExtractionWindowResolver.*;

/** One bounded phone worker; native dispatch only copies scalars and invalidates generations. */
final class AtomicWorkbenchExtractionPointerBroker {
    static final String CALLBACK="ls.augment.com.atomic_extraction_callback.v1";
    static final int ISSUE=1,CANCEL=2;
    interface StateReader { State read(int uid,int pid,String serviceGeneration) throws Exception; }
    interface Scheduler {
        long uptime(); long elapsed();
        boolean post(Runnable action,long delay);
    }
    static final class PhoneScheduler implements Scheduler {
        final HandlerThread thread=new HandlerThread("Duo-Extraction");
        final Handler handler;
        PhoneScheduler(){thread.start();handler=new Handler(thread.getLooper());}
        public long uptime(){return SystemClock.uptimeMillis();}
        public long elapsed(){return SystemClock.elapsedRealtime();}
        public boolean post(Runnable r,long delay){return handler.postDelayed(r,Math.max(0,delay));}
    }
    static final class State {
        final long revision,reset;
        final String checksum,generation;
        final int uid,user,timeout;
        final float slop;
        final String blacklist,home,ime;
        final boolean allowed;
        State(int uid,int user,String generation,long revision,String checksum,long reset,int timeout,float slop,
                String blacklist,String home,String ime,boolean allowed) {
            if(uid<10000||uid/100000!=user||!hex(generation,32)||revision<1||!hex(checksum,64)||reset<0
                    ||timeout<250||timeout>1200||!Float.isFinite(slop)||slop<=0)throw new IllegalArgumentException("extraction_state_invalid");
            this.uid=uid;this.user=user;this.generation=generation;this.revision=revision;this.checksum=checksum;this.reset=reset;
            this.timeout=timeout;this.slop=slop;this.blacklist=blacklist==null?"":blacklist;this.home=home;this.ime=ime;
            this.allowed=allowed;
        }
        boolean same(State s){return s!=null&&uid==s.uid&&user==s.user&&generation.equals(s.generation)&&revision==s.revision
                &&checksum.equals(s.checksum)&&reset==s.reset&&timeout==s.timeout&&Float.compare(slop,s.slop)==0
                &&allowed==s.allowed&&blacklist.equals(s.blacklist)&&java.util.Objects.equals(home,s.home)&&java.util.Objects.equals(ime,s.ime);}
        void source(Window w)throws Refusal {
            if(!allowed||PACKAGE.equals(w.pkg)||w.pkg.equals(home)||w.pkg.equals(ime)||"com.android.systemui".equals(w.pkg))throw new Refusal("rejected");
            for(String s:blacklist.split("[\\s,;]+"))if(w.pkg.equals(s))throw new Refusal("rejected");
        }
    }
    /** A callback-scoped owner. The generation is checked against the live App provider, not trusted here. */
    static final class Owner {
        final int uid,pid,user;
        final String generation;
        final IBinder callback;
        final Connection connection;
        final State registeredState;
        IBinder.DeathRecipient death;
        Owner(int uid,int pid,String generation,IBinder callback,Connection connection,State state){this.uid=uid;this.pid=pid;user=uid/100000;this.generation=generation;this.callback=callback;this.connection=connection;registeredState=state;}
    }
    static final class Sample {
        final int action,display,device,pointers,pointer;
        final long down,event;
        final float x,y,maxDistance;
        final boolean hardware;
        Sample(int action,int display,int device,int pointers,int pointer,long down,long event,float x,float y,float maxDistance,boolean hardware){
            this.action=action;this.display=display;this.device=device;this.pointers=pointers;this.pointer=pointer;
            this.down=down;this.event=event;this.x=x;this.y=y;this.maxDistance=maxDistance;this.hardware=hardware;
        }
    }
    private static final class Stream {
        final long generation;
        final Owner owner;
        final Sample down;
        State state;
        Window window;
        Window host;
        AtomicWorkbenchExtractionGeometryBroker.Geometry geometry;
        Sample virtualDown;
        Sample physical;
        final Map<String,Sample> physicalEvents=new LinkedHashMap<>();
        int unconfirmed;
        boolean completing;
        boolean active=true,fired;
        Stream(long g,Owner o,Sample s){generation=g;owner=o;down=s;physical=s;physicalEvents.put(physicalKey(s),s);}
    }
    private static final class Ticket {
        final Owner owner;
        final Stream stream;
        final AtomicWorkbenchExtractionRequest request;
        final Window window;
        Ticket(Owner o,Stream s,AtomicWorkbenchExtractionRequest r,Window w){owner=o;stream=s;request=r;window=w;}
    }
    private static final class Lease {
        final Ticket ticket;
        final String id=random(),nonce=random();
        final int accessibility;
        Lease(Ticket t,int a){ticket=t;accessibility=a;}
    }
    private static final class Resolved {
        final Window window;
        final int accessibility;
        Resolved(Window window,int accessibility){this.window=window;this.accessibility=accessibility;}
    }
    private static final class Correlation {
        final Stream stream;
        final Sample sample;
        final AtomicWorkbenchExtractionGeometryBroker.Geometry geometry;
        boolean injected,observed,failed;
        Correlation(Stream s,Sample sample,AtomicWorkbenchExtractionGeometryBroker.Geometry g){stream=s;this.sample=sample;geometry=g;}
    }
    private final Object lock=new Object();
    private final AtomicWorkbenchExtractionWindowResolver resolver;
    private final StateReader reader;
    private final Scheduler scheduler;
    private final Map<String,Lease> retired=new LinkedHashMap<>();
    private final Map<String,Correlation> correlations=new LinkedHashMap<>();
    private AtomicWorkbenchExtractionGeometryBroker geometries;
    private Owner owner;
    private Stream stream;
    private Ticket ticket;
    private Lease lease;
    private long generation;
    private boolean workQueued,reading;
    private int nativeDragInFlight;
    private volatile Runnable deathCleanup;
    private volatile java.util.function.Consumer<String> diagnostic;
    private long lastDiagnosticAt = -10000;

    AtomicWorkbenchExtractionPointerBroker(AtomicWorkbenchExtractionWindowResolver resolver,StateReader reader,Scheduler scheduler){
        this.resolver=resolver;this.reader=reader;this.scheduler=scheduler;
    }
    void deathCleanup(Runnable cleanup){deathCleanup=cleanup;}
    void diagnostic(java.util.function.Consumer<String> sink){diagnostic=sink;}
    private void diagnostic(String stage,Throwable failure){
        java.util.function.Consumer<String> sink=diagnostic;if(sink==null)return;
        try{
            long now=scheduler.elapsed();synchronized(lock){if(now-lastDiagnosticAt<3000)return;lastDiagnosticAt=now;}
            for(int i=0;i<4&&failure.getCause()!=null;i++)failure=failure.getCause();
            String reason=failure instanceof Refusal?((Refusal)failure).reason:"unavailable";
            String capability=failure instanceof Refusal?((Refusal)failure).capability:"";
            String member=(failure instanceof NoSuchFieldException||failure instanceof NoSuchMethodException)?failure.getMessage():"";
            if(member==null||!member.matches("[A-Za-z0-9_$]{1,64}"))member="";
            final String value="ATOMIC_WORKBENCH_EXTRACTION_SOURCE stage="+stage+";reason="+reason
                    +";branch="+(capability.isEmpty()?"unspecified":capability)+";error="+failure.getClass().getSimpleName()
                    +(member.isEmpty()?"":";field_mask="+member);
            scheduler.post(()->{try{sink.accept(value);}catch(Throwable ignored){}},0);
        }catch(Throwable ignored){}
    }
    void geometryBroker(AtomicWorkbenchExtractionGeometryBroker broker){geometries=broker;}
    void beginNativeDrag(){Ticket cancelled;synchronized(lock){nativeDragInFlight++;cancelled=ticket;cancelLocked();}sendCancelLater(cancelled,"cancelled");}
    void endNativeDrag(){synchronized(lock){nativeDragInFlight=Math.max(0,nativeDragInFlight-1);}}
    void abortGesture(){Ticket cancelled;synchronized(lock){cancelled=ticket;cancelLocked();}sendCancelLater(cancelled,"cancelled");}
    boolean physicalHeld(){synchronized(lock){return stream!=null&&stream.active;}}
    boolean publishGeometryIfIdle(Runnable publication){synchronized(lock){if(stream!=null&&stream.active)return false;publication.run();return true;}}
    void geometryInvalidated(AtomicWorkbenchExtractionGeometryBroker.Geometry g){Ticket cancelled=null;synchronized(lock){if(stream!=null&&stream.geometry==g){cancelled=ticket;cancelLocked();}}sendCancelLater(cancelled,"stale");}
    Owner register(int uid,int pid,String serviceGeneration,IBinder callback)throws Exception {
        resolver.caller(uid,pid);
        if(callback==null||!callback.isBinderAlive()||!hex(serviceGeneration,32))throw new Refusal("rejected");
        State state=reader.read(uid,pid,serviceGeneration);
        Connection c=resolver.connection(uid/100000,uid);
        resolver.caller(uid,pid);
        if(!state.same(reader.read(uid,pid,serviceGeneration))||!c.same(resolver.connection(uid/100000,uid)))throw new Refusal("stale");
        Owner next=new Owner(uid,pid,serviceGeneration,callback,c,state);
        next.death=()->{invalidate(next,"cancelled");Runnable cleanup=deathCleanup;if(cleanup!=null)cleanup.run();};
        callback.linkToDeath(next.death,0);
        Owner old;Ticket cancelled;
        synchronized(lock){if(!callback.isBinderAlive()){callback.unlinkToDeath(next.death,0);throw new Refusal("stale");}old=owner;cancelled=ticket;owner=next;cancelLocked();}
        unlink(old);sendCancelLater(cancelled,"stale");return next;
    }
    boolean registered(){synchronized(lock){return owner!=null&&owner.callback.isBinderAlive();}}
    boolean owns(int uid,int pid,String g){synchronized(lock){return owner!=null&&owner.uid==uid&&owner.pid==pid&&owner.generation.equals(g);}}
    void checkReady(int uid,int pid,String generation)throws Exception{
        Owner o;synchronized(lock){o=owner;if(o==null||o.uid!=uid||o.pid!=pid||!o.generation.equals(generation))throw new Refusal("stale");}
        resolver.caller(uid,pid);State before=reader.read(uid,pid,generation);
        if(!o.connection.same(resolver.connection(o.user,uid))||!before.same(reader.read(uid,pid,generation)))throw new Refusal("stale");
        synchronized(lock){if(owner!=o||!o.callback.isBinderAlive())throw new Refusal("stale");}
    }
    void unregister(int uid,int pid,String g)throws Refusal {
        Owner found;
        synchronized(lock){found=owner;if(found==null)return;if(found.uid!=uid||found.pid!=pid||!found.generation.equals(g))throw new Refusal("rejected");}
        invalidate(found,"cancelled");
    }
    void invalidate(Owner expected,String reason){
        Ticket cancelled;Owner removed;
        synchronized(lock){if(owner!=expected)return;removed=owner;owner=null;cancelled=ticket;cancelLocked();}
        unlink(removed);sendCancel(cancelled,reason);
    }
    private static void unlink(Owner o){if(o!=null&&o.death!=null)try{o.callback.unlinkToDeath(o.death,0);}catch(RuntimeException ignored){}}

    /** Called inside a real PointerEventListener, before finishInputEvent. No Binder/Provider here. */
    void observe(Sample sample){
        Ticket cancelled=null;Stream start=null;
        synchronized(lock){
            if(owner==null)return;
            if(sample.action==MotionEvent.ACTION_DOWN){
                cancelled=ticket;cancelLocked();
                long now=scheduler.uptime();
                if(sample.display==0&&sample.hardware&&sample.pointers==1&&sample.pointer>=0&&sample.down==sample.event
                        &&sample.event>=0&&now>=sample.event&&now-sample.event<=80&&Float.isFinite(sample.x)&&Float.isFinite(sample.y)
                        &&!workQueued&&nativeDragInFlight==0&&owner.callback.isBinderAlive()){
                    start=new Stream(++generation,owner,sample);stream=start;workQueued=true;
                }
            }else if(stream!=null){
                Stream s=stream;float dx=sample.x-s.down.x,dy=sample.y-s.down.y;
                float slop=s.state==null?s.owner.registeredState.slop:s.state.slop;
                if(sample.display!=s.down.display||sample.device!=s.down.device||sample.down!=s.down.down||sample.pointer!=s.down.pointer
                        ||!sample.hardware||sample.pointers!=1||sample.event<s.down.event||sample.event>scheduler.uptime()+5
                        ||!Float.isFinite(sample.x)||!Float.isFinite(sample.y)||!Float.isFinite(sample.maxDistance)
                        ||sample.maxDistance>slop||dx*dx+dy*dy>slop*slop
                        ||sample.action!=MotionEvent.ACTION_MOVE){cancelled=ticket;cancelLocked();}
                else{s.physical=sample;s.physicalEvents.put(physicalKey(sample),sample);while(s.physicalEvents.size()>32)s.physicalEvents.remove(s.physicalEvents.keySet().iterator().next());}
            }
        }
        sendCancelLater(cancelled,"cancelled");
        if(start==null&&sample.action==MotionEvent.ACTION_DOWN)
            diagnostic(sample.hardware?"native_down_not_admitted":"virtual_down_ignored",new Refusal("rejected"));
        if(start!=null){final Stream pending=start;if(!scheduler.post(()->begin(pending),0)){synchronized(lock){if(stream==pending)cancelLocked();workQueued=false;}}}
    }
    private void begin(Stream s){
        String stage="begin";
        try {
            if(!current(s)||scheduler.uptime()-s.down.event>80)throw new Refusal("stale");
            resolver.caller(s.owner.uid,s.owner.pid);
            stage="physical_window";Window w=resolver.window(0,s.owner.user,s.down.x,s.down.y);
            if(!current(s)||scheduler.uptime()-s.down.event>80)throw new Refusal("stale");
            stage="state";State state=reader.read(s.owner.uid,s.owner.pid,s.owner.generation);resolver.packageIdentity(w);
            AtomicWorkbenchExtractionGeometryBroker.Geometry geometry=null;
            if(PACKAGE.equals(w.pkg)){
                stage="geometry";
                if(!state.allowed||geometries==null||(geometry=geometries.match(w,s.down.x,s.down.y))==null)throw new Refusal("unavailable");
                geometries.current(geometry,w);
            }else state.source(w);
            if(!current(s)||scheduler.uptime()-s.down.event>=state.timeout)throw new Refusal("stale");
            synchronized(lock){if(!currentLocked(s))return;s.state=state;s.host=w;s.geometry=geometry;if(geometry==null)s.window=w;}
            if(geometry!=null)completeVirtual(s);
            if(!scheduler.post(()->fire(s),Math.max(0,s.down.event+state.timeout-scheduler.uptime())))throw new Refusal("unavailable");
        }catch(Exception denied){diagnostic(stage,denied);synchronized(lock){if(stream==s)cancelLocked();}}
        finally{synchronized(lock){workQueued=false;}}
    }
    private void fire(Stream s){
        synchronized(lock){if(!currentLocked(s)||s.fired||workQueued)return;workQueued=true;s.fired=true;}
        try {
            State state=reader.read(s.owner.uid,s.owner.pid,s.owner.generation);
            if(!s.state.same(state))throw new Refusal("stale");
            virtualCurrent(s);
            if(s.window==null)throw new Refusal("unavailable");
            Window w=resolve(s.owner,s.window,state).window;
            virtualCurrent(s);
            if(!current(s)||scheduler.uptime()<s.down.event+state.timeout)throw new Refusal("cancelled");
            long issued=scheduler.elapsed();
            AtomicWorkbenchExtractionRequest r=new AtomicWorkbenchExtractionRequest(random(),random(),s.generation,s.down.down,
                    issued,Math.min(issued+AtomicWorkbenchExtractionRequest.MAX_TTL_MS,s.geometry==null?Long.MAX_VALUE:s.geometry.deadline),state.revision,state.checksum,state.reset,s.owner.user,s.owner.uid,
                    s.geometry==null?null:new AtomicWorkbenchExtractionRequest.GeometryEvidence(s.geometry.ticket,s.geometry.slot,s.geometry.display,s.geometry.name,s.geometry.unique,s.geometry.revision));
            Ticket t=new Ticket(s.owner,s,r,w);
            synchronized(lock){if(!currentLocked(s))throw new Refusal("cancelled");ticket=t;}
            scheduler.post(()->expire(t),AtomicWorkbenchExtractionRequest.MAX_TTL_MS);
            if(!sendIssue(t)){synchronized(lock){if(ticket==t)cancelLocked();}}
        }catch(Exception denied){diagnostic("fire",denied);synchronized(lock){if(stream==s)cancelLocked();}}
        finally{synchronized(lock){workQueued=false;}}
    }
    private Resolved resolve(Owner o,Window expected,State state)throws Exception {
        resolver.caller(o.uid,o.pid);
        Connection c=resolver.connection(o.user,o.uid);
        if(!o.connection.same(c))throw new Refusal("stale");
        Window first=resolver.window(expected.display,o.user,expected.x,expected.y);
        if(!expected.same(first))throw new Refusal("stale");state.source(first);
        int id=resolver.accessibility(first,c);
        resolver.packageIdentity(first);
        if(!state.same(reader.read(o.uid,o.pid,o.generation)))throw new Refusal("stale");
        Window last=resolver.window(expected.display,o.user,expected.x,expected.y);
        if(!first.same(last)||id!=resolver.accessibility(last,c)||!o.connection.same(resolver.connection(o.user,o.uid)))throw new Refusal("stale");
        resolver.caller(o.uid,o.pid);
        if(!state.same(reader.read(o.uid,o.pid,o.generation)))throw new Refusal("stale");return new Resolved(last,id);
    }
    Bundle evidence(int action,int uid,int pid,AtomicWorkbenchExtractionRequest r,String leaseId,String nonce)throws Exception {
        if(action==3)return release(uid,pid,r,leaseId,nonce);
        Ticket t;Lease l;
        synchronized(lock){
            t=ticket;l=lease;
            if(t==null||t.owner!=owner||t.owner.uid!=uid||t.owner.pid!=pid||!sameRequest(t.request,r))throw new Refusal("rejected");
            freshLocked(t);
            if(action==1){if(leaseId!=null||nonce!=null)throw new Refusal("rejected");if(l!=null)throw new Refusal("busy");}
            else if(action==2){if(l==null||l.ticket!=t||!l.id.equals(leaseId)||!l.nonce.equals(nonce))throw new Refusal("rejected");}
            else throw new Refusal("rejected");
            if(reading)throw new Refusal("busy");reading=true;
        }
        try{
            State state=reader.read(uid,pid,t.owner.generation);
            if(!t.stream.state.same(state))throw new Refusal("stale");
            virtualCurrent(t.stream);
            Resolved resolved=resolve(t.owner,t.window,state);
            virtualCurrent(t.stream);
            synchronized(lock){
                freshLocked(t);
                if(action==1){if(lease!=null)throw new Refusal("busy");l=new Lease(t,resolved.accessibility);lease=l;}
                else if(lease!=l||l.accessibility!=resolved.accessibility)throw new Refusal("stale");
                return proof(l,resolved.window,scheduler.elapsed());
            }
        }finally{synchronized(lock){reading=false;}}
    }
    private Bundle release(int uid,int pid,AtomicWorkbenchExtractionRequest r,String leaseId,String nonce)throws Refusal {
        synchronized(lock){
            Lease l=lease!=null&&lease.id.equals(leaseId)?lease:retired.get(leaseId);
            if(l==null||l.ticket.owner.uid!=uid||l.ticket.owner.pid!=pid||!l.nonce.equals(nonce)||!sameRequest(l.ticket.request,r))throw new Refusal("rejected");
            if(lease==l){retireLocked(l);lease=null;}
            Bundle b=new Bundle();b.putBoolean("released",true);return b;
        }
    }
    private void freshLocked(Ticket t)throws Refusal {
        if(ticket!=t||owner!=t.owner||!currentLocked(t.stream))throw new Refusal("cancelled");
        if(!t.request.fresh(scheduler.elapsed()))throw new Refusal("expired");
        if(t.stream.geometry!=null&&(t.stream.unconfirmed!=0||geometries==null||!geometries.currentLocal(t.stream.geometry)))throw new Refusal("stale");
    }
    private boolean current(Stream s){synchronized(lock){return currentLocked(s);}}
    private boolean currentLocked(Stream s){return stream==s&&s.active&&owner==s.owner&&s.owner.callback.isBinderAlive();}
    private void retireLocked(Lease l){
        retired.put(l.id,l);while(retired.size()>8)retired.remove(retired.keySet().iterator().next());
        scheduler.post(()->{synchronized(lock){if(retired.get(l.id)==l)retired.remove(l.id);}},Math.max(2500,l.ticket.request.deadlineAt-scheduler.elapsed()+2500));
    }
    private void cancelLocked(){if(stream!=null)stream.active=false;stream=null;ticket=null;correlations.clear();if(lease!=null){retireLocked(lease);lease=null;}}
    private void expire(Ticket t){Ticket cancelled=null;synchronized(lock){if(ticket==t&&!t.request.fresh(scheduler.elapsed())){cancelled=ticket;cancelLocked();}}sendCancel(cancelled,"expired");}
    private void sendCancelLater(Ticket t,String reason){if(t!=null)scheduler.post(()->sendCancel(t,reason),0);}
    private static boolean sameRequest(AtomicWorkbenchExtractionRequest a,AtomicWorkbenchExtractionRequest b){return a!=null&&b!=null&&a.metadata().keySet().equals(b.metadata().keySet())
            &&a.id.equals(b.id)&&a.pointerTicket.equals(b.pointerTicket)&&a.gestureGeneration==b.gestureGeneration&&a.downTime==b.downTime
            &&a.issuedAt==b.issuedAt&&a.deadlineAt==b.deadlineAt&&a.configRevision==b.configRevision&&a.configChecksum.equals(b.configChecksum)
            &&a.resetGeneration==b.resetGeneration&&a.userId==b.userId&&a.moduleUid==b.moduleUid&&sameGeometry(a.geometry,b.geometry);}
    private static boolean sameGeometry(AtomicWorkbenchExtractionRequest.GeometryEvidence a,AtomicWorkbenchExtractionRequest.GeometryEvidence b){return a==null?b==null:b!=null&&a.ticket.equals(b.ticket)&&a.slotId==b.slotId&&a.displayId==b.displayId&&a.displayName.equals(b.displayName)&&a.displayUniqueId.equals(b.displayUniqueId)&&a.revision==b.revision;}

    /** Captured before IMS clears identity, committed only after the original native injection succeeds. */
    void injected(Sample sample,int uid,int pid,boolean success){correlate(sample,uid,pid,success,false);}
    /** This is the independent native per-display monitor observation, not an inject return value. */
    void observedVirtual(Sample sample){
        Sample normalized=null;Ticket cancelled=null;
        synchronized(lock){
            Stream s=stream;if(s==null||sample.display<=0)return;
            // Ordinary native injection canonicalizes its device ID to VIRTUAL_KEYBOARD_ID (-1).
            // IMS must separately prove the original physical device; never accept any arbitrary ID.
            if(sample.device!=-1){if(s.geometry!=null&&s.geometry.display==sample.display){cancelled=ticket;cancelLocked();}}
            else normalized=new Sample(sample.action,sample.display,s.down.device,sample.pointers,sample.pointer,sample.down,sample.event,
                    sample.x,sample.y,sample.maxDistance,false);
        }
        sendCancelLater(cancelled,"cancelled");if(normalized!=null)correlate(normalized,0,-1,true,true);
    }
    private void correlate(Sample sample,int uid,int pid,boolean success,boolean observed){
        Stream complete=null;Ticket cancelled=null;
        synchronized(lock){
            Stream s=stream;if(s==null||!currentLocked(s)||geometries==null||sample.display<=0)return;
            AtomicWorkbenchExtractionGeometryBroker.Geometry g=observed?geometryForMonitor(sample.display):geometries.displayOwner(sample.display,uid,pid);
            if(g==null||g.owner.moduleUid!=s.owner.uid||sample.pointers!=1||sample.pointer!=s.down.pointer||sample.device!=s.down.device
                    ||sample.down!=s.down.down||sample.event<s.down.event||sample.event>scheduler.uptime()+5||!Float.isFinite(sample.x)||!Float.isFinite(sample.y))return;
            String key=key(sample,s.generation);Correlation c=correlations.get(key);
            if(c==null){if(correlations.size()>=32){cancelled=ticket;cancelLocked();}
                else{c=new Correlation(s,sample,g);correlations.put(key,c);if(observed){s.unconfirmed++;c.observed=true;}
                    final Correlation pending=c;scheduler.post(()->correlationTimeout(key,pending),120);}}
            else if(c.geometry!=g)return;
            if(c!=null){
                if(observed&&!c.observed){c.observed=true;s.unconfirmed++;}
                if(!observed){c.injected=success;c.failed=!success;}
                if(c.observed&&c.failed){cancelled=ticket;cancelLocked();}
                else if(c.observed&&c.injected){
                    correlations.remove(key);s.unconfirmed=Math.max(0,s.unconfirmed-1);
                    Sample p=s.physicalEvents.get(physicalKey(sample));
                    // Match the exact physical stream event, point and the existing input-policy scale.
                    if(p==null||!g.contains(p.x,p.y)
                            ||Math.abs(g.x(p.x)-sample.x)>.025f||Math.abs(g.y(p.y)-sample.y)>.025f){cancelled=ticket;cancelLocked();}
                    else if(sample.action==MotionEvent.ACTION_DOWN){s.virtualDown=sample;complete=s;}
                    else if(sample.action!=MotionEvent.ACTION_MOVE){cancelled=ticket;cancelLocked();}
                }
            }
        }
        sendCancelLater(cancelled,"cancelled");
        if(complete!=null){final Stream pending=complete;scheduler.post(()->completeVirtual(pending),0);}
    }
    private AtomicWorkbenchExtractionGeometryBroker.Geometry geometryForMonitor(int display){
        Stream s=stream;
        if(s!=null&&s.geometry!=null&&s.geometry.display==display&&geometries.currentLocal(s.geometry))return s.geometry;
        // DOWN may arrive before the worker has resolved the physical host window.
        return geometries.monitorOwner(display);
    }
    private void correlationTimeout(String key,Correlation c){Ticket cancelled=null;synchronized(lock){if(correlations.get(key)==c){correlations.remove(key);if(currentLocked(c.stream)){cancelled=ticket;cancelLocked();}}}sendCancel(cancelled,"cancelled");}
    private static String key(Sample s,long generation){return generation+":"+s.action+":"+s.display+":"+s.device+":"+s.pointer+":"+s.down+":"+s.event+":"+Float.floatToIntBits(s.x)+":"+Float.floatToIntBits(s.y);}
    private static String physicalKey(Sample s){return s.action+":"+s.event+":"+s.device+":"+s.pointer+":"+s.down;}
    private void completeVirtual(Stream s){
        synchronized(lock){if(!currentLocked(s)||s.geometry==null||s.virtualDown==null||s.state==null||s.window!=null||s.completing)return;s.completing=true;}
        try{
            virtualCurrent(s);
            if(scheduler.uptime()-s.virtualDown.event>120)throw new Refusal("stale");
            Window target=resolver.window(s.geometry.display,s.owner.user,s.virtualDown.x,s.virtualDown.y);
            s.state.source(target);resolver.packageIdentity(target);
            virtualCurrent(s);
            synchronized(lock){if(currentLocked(s))s.window=target;}
        }catch(Exception failed){diagnostic("virtual_window",failed);Ticket cancelled=null;synchronized(lock){if(stream==s){cancelled=ticket;cancelLocked();}}sendCancel(cancelled,"stale");}
        finally{synchronized(lock){s.completing=false;}}
    }
    private void virtualCurrent(Stream s)throws Exception{
        if(s.geometry==null)return;
        synchronized(lock){if(!currentLocked(s)||s.virtualDown==null||s.unconfirmed!=0)throw new Refusal("stale");}
        Window host=resolver.window(0,s.owner.user,s.down.x,s.down.y);
        if(!s.host.same(host))throw new Refusal("stale");geometries.current(s.geometry,host);
        synchronized(lock){if(!currentLocked(s)||s.unconfirmed!=0)throw new Refusal("stale");}
    }
    private boolean sendIssue(Ticket t)throws Exception {
        if(!current(t.stream)||!t.request.fresh(scheduler.elapsed()))return false;
        Parcel p=Parcel.obtain();try{p.writeInterfaceToken(CALLBACK);p.writeBundle(t.request.metadata());return t.owner.callback.transact(ISSUE,p,null,IBinder.FLAG_ONEWAY);}finally{p.recycle();}
    }
    private void sendCancel(Ticket t,String reason){if(t==null)return;Parcel p=Parcel.obtain();try{p.writeInterfaceToken(CALLBACK);p.writeString(t.request.id);p.writeString(t.request.pointerTicket);p.writeString(reason);t.owner.callback.transact(CANCEL,p,null,IBinder.FLAG_ONEWAY);}catch(Exception ignored){}finally{p.recycle();}}
    private static Bundle proof(Lease l,Window w,long sampled)throws Refusal {
        AtomicWorkbenchExtractionRequest r=l.ticket.request;if(sampled<r.issuedAt||sampled>=r.deadlineAt)throw new Refusal("expired");
        Bundle b=new Bundle();b.putInt("schema",1);b.putString("id",r.id);b.putString("ticket",r.pointerTicket);b.putString("lease",l.id);
        b.putString("window_nonce",l.nonce);b.putString("window_generation",w.generation);b.putString("name",w.name);b.putString("unique",w.unique);b.putString("package",w.pkg);
        b.putInt("display",w.display);b.putInt("user",w.user);b.putInt("module_uid",r.moduleUid);b.putInt("uid",w.uid);b.putInt("task",w.taskId);b.putInt("a11y_window",l.accessibility);
        b.putInt("left",w.bounds.left);b.putInt("top",w.bounds.top);b.putInt("right",w.bounds.right);b.putInt("bottom",w.bounds.bottom);b.putFloat("x",w.x);b.putFloat("y",w.y);
        b.putLong("issued",r.issuedAt);b.putLong("sampled",sampled);b.putLong("deadline",r.deadlineAt);b.putBoolean("protected",false);return b;
    }
}
