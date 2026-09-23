package ls.augment.com;

import io.github.libxposed.api.XposedModule;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletionStage;

/** API102 entry candidate. Production Root admission remains separate from protective installation. */
public abstract class RootEarlyModule extends XposedModule {
    public enum Mode { PREPARE_ONLY, INSTALL_DORMANT, INSTALL_PROTECTIVE }
    private final WindowAuthority authority=new WindowAuthority(this);
    private final RootEarlyCoordinator coordinator=new RootEarlyCoordinator(authority);
    private final EntryAuthority entryAuthority=new EntryAuthority(this,coordinator);
    private final Mode mode;
    protected RootEarlyModule(){this(Mode.PREPARE_ONLY);}
    protected RootEarlyModule(Mode mode){this.mode=java.util.Objects.requireNonNull(mode);}

    @Override public final void onModuleLoaded(ModuleLoadedParam param) {
        authority.open();
        Result result;
        try {
            // The attested framework/profile is Android 16 only. Other Android
            // versions still receive the module's ordinary initialization.
            result=android.os.Build.VERSION.SDK_INT==36
                    ? coordinator.onModuleLoaded(this,param,mode)
                    : new Result("SKIPPED_ANDROID_VERSION","Root transaction profile requires Android 16",
                            null,0,0,android.os.Process.myPid(),android.os.Process.myUid(),
                            0,0,0,Collections.emptyList(),false);
        }finally{authority.close();}
        // The coordinator's private window has already closed. This is data only.
        try{onModuleLoadedAfterEarly(param,result);}catch(Throwable observerFailure){/* Must not replace the framework's ordinary continuation. */}
    }
    /** Original module initialization can retain its real parameter after the early scope is closed. */
    protected void onModuleLoadedAfterEarly(ModuleLoadedParam param,Result result){onEarlyResult(result);}
    protected void onEarlyResult(Result result) { }
    @Override public final void onSystemServerStarting(SystemServerStartingParam param) {
        try {
            if(mode==Mode.INSTALL_PROTECTIVE && android.os.Build.VERSION.SDK_INT==36) {
                entryAuthority.open();
                coordinator.installRuntimeEntry(this,param.getClassLoader(),entryAuthority);
            }
        }catch(Throwable failure){coordinator.retire();}
        finally{entryAuthority.close();}
        try{onSystemServerStartingAfterRoot(param);}catch(Throwable observerFailure){/* Preserve framework startup. */}
    }
    /** Retains the module's existing system-server initialization after the private entry window. */
    protected void onSystemServerStartingAfterRoot(SystemServerStartingParam param){ }
    public final CompletionStage<Result> retireEarly(){return coordinator.retire();}
    /** Current immutable diagnostics only; no service, method, installer or admission token leaves here. */
    public final String startupDiagnostic(){return coordinator.startupDiagnostic();}
    public final String protectionDiagnostic(){return coordinator.protectionDiagnostic();}

    static final class EntryAuthority {
        private final RootEarlyModule module;private final RootEarlyCoordinator coordinator;
        private boolean used,open;private Thread thread;
        private EntryAuthority(RootEarlyModule m,RootEarlyCoordinator c){module=m;coordinator=c;}
        private synchronized void open(){if(!used){used=true;open=true;thread=Thread.currentThread();}}
        private synchronized void close(){open=false;}
        synchronized void require(RootEarlyModule m,RootEarlyCoordinator c) {
            if(!open || module!=m || coordinator!=c || thread!=Thread.currentThread())
                throw new IllegalStateException("Not the module's private system-server entry callback");
        }
    }

    /** Only this outer final entry can create/open the lease; it never leaves this module/coordinator pair. */
    static final class WindowAuthority {
        private final RootEarlyModule owner;
        private RootEarlyCoordinator coordinator;
        private Thread thread;
        private boolean used,open;
        private WindowAuthority(RootEarlyModule owner){this.owner=owner;}
        synchronized void bind(RootEarlyCoordinator coordinator) {
            if(this.coordinator!=null)throw new IllegalStateException("authority already bound");
            this.coordinator=java.util.Objects.requireNonNull(coordinator);
        }
        private synchronized void open(){if(!used){used=true;open=true;thread=Thread.currentThread();}}
        private synchronized void close(){open=false;}
        synchronized void require(RootEarlyCoordinator coordinator,RootEarlyModule owner) {
            if(!open || this.coordinator!=coordinator || this.owner!=owner || thread!=Thread.currentThread())
                throw new IllegalStateException("not the module's private live callback authority");
        }
        synchronized void requireCurrent(RootEarlyCoordinator coordinator){require(coordinator,owner);}
    }

    public static final class OwnerSource {
        public final String owner,loaderType,archiveSha256,dexEntry;
        OwnerSource(RootCriticalProfile.SourceEvidence evidence) {
            owner=clean(evidence.owner.getName(),256);
            loaderType=evidence.definingLoader==null?"bootstrap-null":clean(evidence.definingLoader.getClass().getName(),128);
            archiveSha256=clean(evidence.archiveSha256,64);dexEntry=clean(evidence.dexEntry,32);
        }
    }
    /** Immutable observation; contains no Origins/Profile/Method/installer/token/future capability. */
    public static final class Result {
        public final String status,reason,cause;
        public final long elapsedMillis,preparationMillis;
        public final int pid,uid,profileCount,additionalCount,unresolvedCount;
        public final boolean restartRequired;
        public final List<OwnerSource> owners;
        Result(String status,String reason,Throwable failure,long elapsed,long preparation,int pid,int uid,
               int profileCount,int additionalCount,int unresolvedCount,List<OwnerSource> owners,boolean restart) {
            this.status=clean(status,64);this.reason=clean(reason,192);this.cause=describe(failure);
            elapsedMillis=elapsed;preparationMillis=preparation;this.pid=pid;this.uid=uid;
            this.profileCount=profileCount;this.additionalCount=additionalCount;this.unresolvedCount=unresolvedCount;restartRequired=restart;
            this.owners=Collections.unmodifiableList(new ArrayList<>(owners));
        }
        public String renderDiagnostic() {
            StringBuilder out=new StringBuilder();
            out.append("EARLY_COORDINATOR_V1 status=").append(status).append(" modeReady=false pid=").append(pid).append(" uid=").append(uid)
                .append(" elapsedMs=").append(elapsedMillis).append(" preparationMs=").append(preparationMillis)
                .append(" profileCount=").append(profileCount).append(" additionalCount=").append(additionalCount).append(" unresolved=").append(unresolvedCount)
                .append(" restartRequired=").append(restartRequired).append('\n')
                .append("REASON ").append(reason).append('\n').append("CAUSE ").append(cause).append('\n');
            for(OwnerSource owner:owners)out.append("OWNER ").append(owner.owner).append(" loaderType=").append(owner.loaderType)
                .append(" archiveSha256=").append(owner.archiveSha256).append(" dexEntry=").append(owner.dexEntry).append('\n');
            // Additional fixed native callers introduce more actual owner rows.
            // Keep a finite ASCII budget while preserving this deployment's complete source list.
            boolean truncated=out.length()>32000;if(truncated)out.setLength(32000);
            out.append("\nEARLY_DIAGNOSTIC_END truncated=").append(truncated).append(" maxAsciiBytes=32768\n");
            return out.toString();
        }
    }
    static String clean(String input,int max) {
        if(input==null)return "null";StringBuilder out=new StringBuilder(Math.min(max,input.length()));
        for(int i=0;i<input.length()&&out.length()<max;i++){char c=input.charAt(i);out.append(c>=32&&c<=126?c:'?');}return out.toString();
    }
    private static String describe(Throwable failure) {
        if(failure==null)return "none";StringBuilder out=new StringBuilder();
        for(int n=0;failure!=null&&n<3;n++) {
            if(n>0)out.append(" <- ");out.append(clean(failure.getClass().getName(),128)).append(':').append(clean(failure.getMessage(),320));
            Throwable next=failure.getCause();if(next==failure)break;failure=next;
        }
        return out.toString();
    }
}
