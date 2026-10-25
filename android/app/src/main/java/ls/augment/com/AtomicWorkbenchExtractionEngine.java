package ls.augment.com;

import android.app.KeyguardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.os.PowerManager;
import android.os.Process;
import android.os.SystemClock;
import android.os.UserManager;
import android.provider.Settings;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;

/** One real phone read at a time, including after timeout while a provider ignores cancellation. */
final class AtomicWorkbenchExtractionEngine implements AutoCloseable {
    interface Environment {
        boolean current(AtomicWorkbenchExtractionRequest request);
        boolean sourceAllowed(AtomicWorkbenchExtractionAuthority.Proof proof);
    }
    private static final Object OWNERSHIP=new Object();
    private static Job working;
    private static final ThreadPoolExecutor WORKER=new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<>(1),r->{Thread t=new Thread(r,"Duo-Extraction");t.setDaemon(true);return t;});
    private static final ScheduledThreadPoolExecutor TIMER=new ScheduledThreadPoolExecutor(1,r->{Thread t=new Thread(r,"Duo-ExtractionDeadline");t.setDaemon(true);return t;});
    static { TIMER.setRemoveOnCancelPolicy(true); }
    private final AtomicWorkbenchExtractionAuthority authority;
    private final AtomicWorkbenchExtractionAccessibilitySource source;
    private final Environment environment;
    private final Executor callbacks;
    private volatile boolean closed;
    private volatile Job pendingDelivery;

    AtomicWorkbenchExtractionEngine(android.accessibilityservice.AccessibilityService service,Executor callbacks) {
        this(AtomicWorkbenchExtractionAuthority.system(),new AtomicWorkbenchExtractionAccessibilitySource(service),new PhoneEnvironment(service),callbacks);
        source.connect();
    }
    AtomicWorkbenchExtractionEngine(AtomicWorkbenchExtractionAuthority authority,AtomicWorkbenchExtractionAccessibilitySource source,Environment environment,Executor callbacks) {
        if(authority==null||source==null||environment==null||callbacks==null)throw new IllegalArgumentException("missing_extraction_backend");
        this.authority=authority;this.source=source;this.environment=environment;this.callbacks=callbacks;
    }
    boolean submit(AtomicWorkbenchExtractionRequest request,Consumer<AtomicWorkbenchExtractionResult> callback) {
        if(request==null||callback==null)throw new IllegalArgumentException("missing_extraction_request");
        Job job=new Job(this,request,callback);
        synchronized(OWNERSHIP){
            if(closed){job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE));return false;}
            if(working!=null||pendingDelivery!=null){job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.BUSY));return false;}
            working=job;pendingDelivery=job;
        }
        long remaining=request.deadlineAt-SystemClock.elapsedRealtime();
        if(remaining<=0){job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.TIMEOUT));synchronized(OWNERSHIP){if(working==job)working=null;}return false;}
        try {
            job.deadline=TIMER.schedule(()->{job.cancelled=true;job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.TIMEOUT));},remaining,TimeUnit.MILLISECONDS);
            WORKER.execute(()->{
                try { run(job); }
                catch(Throwable unavailable) { job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE)); }
            });return true;
        } catch(RuntimeException rejected){
            if(job.deadline!=null)job.deadline.cancel(false);
            synchronized(OWNERSHIP){if(working==job)working=null;}
            job.finish(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.BUSY));return false;
        }
    }
    void event(int type,int window) { source.event(type,window); }
    void interrupt() { source.interrupted();cancel(null); }
    void cancel(String requestId) {
        Job job=pendingDelivery;
        if(job!=null&&job.owner==this&&(requestId==null||requestId.equals(job.request.id))){job.cancelled=true;job.finish(AtomicWorkbenchExtractionResult.failure(job.request,AtomicWorkbenchExtractionResult.State.CANCELLED));}
    }
    @Override public void close() { closed=true;source.disconnect();cancel(null); }

    private void run(Job job) {
        AtomicWorkbenchExtractionRequest request=job.request;
        AtomicWorkbenchExtractionAuthority.Proof proof=null;
        AtomicWorkbenchExtractionResult result=null;
        try {
            job.checkpoint();
            proof=authority.prepare(request);
            job.checkpoint();
            if(proof==null||!proof.matches(request,SystemClock.elapsedRealtime())||!environment.sourceAllowed(proof)
                    ||!authority.validate(request,proof))throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.REJECTED);
            job.checkpoint();
            AtomicWorkbenchExtractionAccessibilitySource.Read read=source.read(proof,job::checkpoint);
            job.checkpoint();
            if(!source.current(read)||!environment.sourceAllowed(proof)||!authority.validate(request,proof))
                throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.STALE);
            job.checkpoint();
            var candidate=read.candidate;var m=candidate.metadata;
            job.read=read;
            result=AtomicWorkbenchExtractionResult.ready(request,candidate.kind,candidate.text,proof,m.left,m.top,m.right,m.bottom);
        } catch(AtomicWorkbenchExtractionAuthority.Denied denied){result=AtomicWorkbenchExtractionResult.failure(request,denied.state);}
        catch(AtomicWorkbenchExtractionAccessibilitySource.Failure known){result=AtomicWorkbenchExtractionResult.failure(request,known.state);}
        catch(Exception unavailable){result=AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE);}
        finally {
            try {
                if(proof!=null)authority.release(request,proof);
            } catch(Exception pending){result=AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE);}
            finally {
                if(job.deadline!=null)job.deadline.cancel(false);
                synchronized(OWNERSHIP){if(working==job)working=null;}
            }
        }
        if(result==null)result=AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE);
        if(!job.cancelled&&!closed&&SystemClock.elapsedRealtime()<request.deadlineAt)job.finish(result);
        else job.finish(AtomicWorkbenchExtractionResult.failure(request,closed?AtomicWorkbenchExtractionResult.State.CANCELLED:AtomicWorkbenchExtractionResult.State.TIMEOUT));
    }
    private static final class Job {
        final AtomicWorkbenchExtractionEngine owner;
        final AtomicWorkbenchExtractionRequest request;
        final Consumer<AtomicWorkbenchExtractionResult> callback;
        final AtomicBoolean completed=new AtomicBoolean();
        volatile boolean cancelled;
        volatile ScheduledFuture<?> deadline;
        volatile AtomicWorkbenchExtractionAccessibilitySource.Read read;
        long environmentChecked=Long.MIN_VALUE;
        Job(AtomicWorkbenchExtractionEngine owner,AtomicWorkbenchExtractionRequest r,Consumer<AtomicWorkbenchExtractionResult> cb){this.owner=owner;request=r;callback=cb;}
        void checkpoint() throws AtomicWorkbenchExtractionAccessibilitySource.Failure {
            if(cancelled||owner.closed)throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.CANCELLED);
            long now=SystemClock.elapsedRealtime();
            if(!request.fresh(now))throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.TIMEOUT);
            if(ResetWriteFence.stale(request.resetGeneration))throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.STALE);
            if(environmentChecked==Long.MIN_VALUE||now-environmentChecked>=16){
                if(!owner.environment.current(request))throw new AtomicWorkbenchExtractionAccessibilitySource.Failure(AtomicWorkbenchExtractionResult.State.REJECTED);
                environmentChecked=now;
            }
        }
        void finish(AtomicWorkbenchExtractionResult value) {
            if(!completed.compareAndSet(false,true))return;
            try { owner.callbacks.execute(()->{
                try {
                    AtomicWorkbenchExtractionResult delivered=value;
                    if(value.state==AtomicWorkbenchExtractionResult.State.READY&&(cancelled||owner.closed||!request.fresh(SystemClock.elapsedRealtime())
                            ||ResetWriteFence.stale(request.resetGeneration)||!owner.source.current(read)||!owner.currentForDelivery(request)))
                        delivered=AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.STALE);
                    callback.accept(delivered);
                } finally { if(owner.pendingDelivery==this)owner.pendingDelivery=null; }
            }); } catch(RuntimeException ignored) { if(owner.pendingDelivery==this)owner.pendingDelivery=null; }
        }
    }

    private boolean currentForDelivery(AtomicWorkbenchExtractionRequest request) {
        try { return environment.current(request); } catch(RuntimeException unavailable) { return false; }
    }

    private static final class PhoneEnvironment implements Environment {
        final Context context;
        final AppConfig config;
        PhoneEnvironment(Context context){this.context=context;config=new AppConfig(context);}
        @Override public boolean current(AtomicWorkbenchExtractionRequest request) {
            try {
                if(Process.myUid()!=request.moduleUid||Process.myUid()/100000!=request.userId||ResetWriteFence.stale(request.resetGeneration))return false;
                UserManager users=context.getSystemService(UserManager.class);PowerManager power=context.getSystemService(PowerManager.class);KeyguardManager keys=context.getSystemService(KeyguardManager.class);
                if(users==null||!users.isUserUnlocked()||power==null||!power.isInteractive()||keys==null||keys.isDeviceLocked())return false;
                ConfigSnapshot state=config.configSnapshot();
                return state!=null&&state.revision==request.configRevision&&request.configChecksum.equals(state.checksum)
                        &&ConfigSchema.truthy(state.get(AtomicWorkbenchConfig.ENABLED))
                        &&ConfigSchema.truthy(state.get(AtomicWorkbenchExtractionPolicy.ENABLED))&&ConfigSchema.truthy(state.get(AtomicWorkbenchExtractionPolicy.TEXT_ENABLED))
                        &&(context.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE||ConfigSchema.truthy(state.get(AtomicWorkbenchExtractionPolicy.LANDSCAPE)));
            } catch(RuntimeException unavailable){return false;}
        }
        @Override public boolean sourceAllowed(AtomicWorkbenchExtractionAuthority.Proof proof) {
            try {
                if(proof.moduleUid!=Process.myUid()||proof.userId!=Process.myUid()/100000||proof.packageName.equals(context.getPackageName())
                        ||context.getPackageManager().getPackageUid(proof.packageName,0)!=proof.targetUid)return false;
                ConfigSnapshot state=config.configSnapshot();if(state==null)return false;
                String blocked=state.get(AtomicWorkbenchExtractionPolicy.BLACKLIST);
                if(blocked!=null)for(String pkg:blocked.split("[\\s,;]+"))if(pkg.equals(proof.packageName))return false;
                ResolveInfo home=context.getPackageManager().resolveActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME),PackageManager.MATCH_DEFAULT_ONLY);
                if(home!=null&&home.activityInfo!=null&&proof.packageName.equals(home.activityInfo.packageName))return false;
                String ime=Settings.Secure.getString(context.getContentResolver(),Settings.Secure.DEFAULT_INPUT_METHOD);
                ComponentName component=ime==null?null:ComponentName.unflattenFromString(ime);
                return component==null||!proof.packageName.equals(component.getPackageName());
            } catch(PackageManager.NameNotFoundException|RuntimeException unavailable){return false;}
        }
    }
}
