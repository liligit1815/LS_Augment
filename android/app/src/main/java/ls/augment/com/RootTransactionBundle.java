package ls.augment.com;

import java.util.function.Consumer;

/**
 * One owner graph for a future process-lifetime coordinator. This class does not
 * install hooks, issue runtime Admission, create a service or accept a command.
 * Retain one instance across ShellCommand wrappers; never rebuild to retry a nonce.
 */
final class RootTransactionBundle {
    final RootLifecycleDomain domain;
    final RootCallerCompatibility compatibility;
    final RootTransactionEngine engine;
    final HideRootServer server;
    final RootCommandEntry entry;
    final RootOwnershipObservation observation;
    private final Object representativeShell;

    private RootTransactionBundle(RootLifecycleDomain domain,ClassLoader loader,RootProcessGroupProfile.Resolved processGroup,Object representativeShell,
                          RootTransactionEngine.Admission runtimeAdmission,RootOwnershipObservation observation) throws Throwable {
        // The installer created this same domain before native services existed.
        // Never create another domain here or replace it to retry an operation.
        this.domain=java.util.Objects.requireNonNull(domain);
        this.representativeShell=representativeShell;
        this.observation=java.util.Objects.requireNonNull(observation);
        RootNativeBridge nativeBridge=new RootNativeBridge(loader,processGroup,observation);
        RootNativeBridge.Bound nativeOwner=nativeBridge.bind(representativeShell);
        compatibility=new RootCallerCompatibility(loader);
        engine=new RootTransactionEngine(domain,representativeShell,nativeOwner,compatibility,runtimeAdmission);
        server=new HideRootServer(8192,engine);
        entry=new RootCommandEntry(loader,representativeShell,server,observation::diagnostic);
    }

    static RootTransactionBundle createForRuntime(RootRuntimeAdmission.BundlePermit permit)throws Throwable {
        RootRuntimeAdmission.BundleInputs input=java.util.Objects.requireNonNull(permit).consume();
        RootOwnershipObservation observation=RootOwnershipObservation.prepare(input.module,input.loader,input.ownershipProfile,input.ownershipProfileFailure,input.hiddenRequests,input.hiddenRequestFailure);
        return new RootTransactionBundle(input.domain,input.loader,input.processGroup,input.shell,input.admission,observation);
    }

    boolean isNativeLane(){return engine.isNativeLane();}
    void requireStartupOwner(RootStartupBinding startup){engine.requireStartupOwner(startup);}

    /** Read-only main-Looper preparation; success is identity compatibility, never runtime READY. */
    void prepareIdentity(Consumer<RootCallerCompatibility.Preparation> completion) {
        compatibility.prepareAsync(representativeShell,completion);
    }
}
