package ls.augment.com;

import io.github.libxposed.api.XposedInterface;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicLong;

/** Finite native causal evidence. No public recovery authority or ART coverage claim. */
final class RootOwnedMutationAdapter {
    private static final String PMS="com.android.server.pm.PackageManagerService";
    private static final String IPM=PMS+"$IPackageManagerImpl";
    private static final String LAMBDA=IPM+"$$ExternalSyntheticLambda8";
    private static final String MUTATOR="com.android.server.pm.pkg.mutate.PackageStateMutator";
    private static final String WRITE=MUTATOR+"$StateWriteWrapper";
    private static final String USER=WRITE+"$UserStateWriteWrapper";
    private static final String STATE="com.android.server.pm.pkg.PackageUserStateImpl";
    private static final String RESULT=MUTATOR+"$Result";
    private enum Kind { LEAF, USER, STATE, ACCEPT, CHANGED, COMMIT }
    private enum Step { ACCEPT, USER_STATE, USER_RETURN, WRAPPER, LEAF, LEAF_RETURN,
        WRAPPER_RETURN, ACCEPT_RETURN, CHANGED, CHANGED_RETURN, DONE }
    private static final class Bound {
        final Object pms,monitor;
        final HiddenOwnershipCore core;
        final RootOwnershipObservation.Bound observer;
        Bound(Object pms,Object monitor,HiddenOwnershipCore core,RootOwnershipObservation.Bound observer) {
            this.pms=pms;this.monitor=monitor;this.core=core;this.observer=observer;
        }
        boolean same(Object pms,Object monitor,HiddenOwnershipCore core,RootOwnershipObservation.Bound observer) {
            return this.pms==pms&&this.monitor==monitor&&this.core==core&&this.observer==observer;
        }
    }
    private static final class Active {
        final RootHiddenRequestIngress.CommitPermit permit;
        final Bound bound;
        final HiddenOwnershipCore.Live before;
        final Object write,user;
        Step step=Step.ACCEPT;
        boolean invalid;
        Active(RootHiddenRequestIngress.CommitPermit permit,Bound bound,HiddenOwnershipCore.Live before,
                Object write,Object user) {
            this.permit=permit;this.bound=bound;this.before=before;this.write=write;this.user=user;
        }
    }

    private final RootHiddenRequestIngress ingress;
    private final RootEarlyModule module;
    private final RootOwnershipProfile.Resolved profile;
    private final Method[] hooks=new Method[6];
    // Receipt states: 0 not started, 1 started, 2 threw, 3 null, 4 untrusted, 5 trusted.
    private final int[] registrations=new int[6];
    private final XposedInterface.HookHandle[] retained=new XposedInterface.HookHandle[6];
    private final int[] deopts=new int[7]; // 0 not attempted, 1 true, 2 false, 3 threw.
    private final Throwable[] deoptErrors=new Throwable[7];
    private final Field pmsMutator,mutatorWrite,writeState,writeUser,userState,lambdaUser,lambdaHidden,success;
    private final Class<?> mutatorClass,writeClass,userClass,stateClass,lambdaClass,resultClass;
    private final Object control=new Object();
    private long prebindingActive;
    private volatile Bound binding;
    private volatile boolean installed,attempted;
    private final ThreadLocal<Active> active=new ThreadLocal<>();
    private final ThreadLocal<Integer> ordinaryDepth=new ThreadLocal<>();
    private final AtomicLong minted=new AtomicLong(),confirmed=new AtomicLong(),discarded=new AtomicLong(),restored=new AtomicLong();

    RootOwnedMutationAdapter(RootHiddenRequestIngress ingress,RootEarlyModule module,
            RootOwnershipProfile.Resolved profile) throws ReflectiveOperationException {
        this.ingress=Objects.requireNonNull(ingress);this.module=Objects.requireNonNull(module);
        this.profile=Objects.requireNonNull(profile);
        hooks[0]=profile.method("Lcom/android/server/pm/pkg/PackageUserStateImpl;->setHidden(Z)Lcom/android/server/pm/pkg/PackageUserStateImpl;");
        hooks[1]=profile.method("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper$UserStateWriteWrapper;->setHidden(Z)Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;");
        hooks[2]=profile.method("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->userState(I)Lcom/android/server/pm/pkg/mutate/PackageUserStateWrite;");
        hooks[3]=profile.method("Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl$$ExternalSyntheticLambda8;->accept(Ljava/lang/Object;)V");
        hooks[4]=profile.method("Lcom/android/server/pm/pkg/mutate/PackageStateMutator$StateWriteWrapper;->onChanged()V");
        hooks[5]=profile.method("Lcom/android/server/pm/PackageManagerService;->commitPackageStateMutation(Lcom/android/server/pm/pkg/mutate/PackageStateMutator$InitialState;Ljava/lang/String;Ljava/util/function/Consumer;)Lcom/android/server/pm/pkg/mutate/PackageStateMutator$Result;");
        pmsMutator=profile.field(PMS+"#mPackageStateMutator");mutatorWrite=profile.field(MUTATOR+"#mStateWrite");
        writeState=profile.field(WRITE+"#mState");writeUser=profile.field(WRITE+"#mUserStateWrite");
        userState=profile.field(USER+"#mUserState");lambdaUser=profile.field(LAMBDA+"#f$0");
        lambdaHidden=profile.field(LAMBDA+"#f$1");success=profile.field(RESULT+"#SUCCESS");
        mutatorClass=profile.type(MUTATOR);writeClass=profile.type(WRITE);userClass=profile.type(USER);
        stateClass=profile.type(STATE);lambdaClass=profile.type(LAMBDA);resultClass=profile.type(RESULT);
        if(profile.callers.size()!=7)throw new IllegalStateException("Owned caller contract differs");
    }

    void install(long deadline) {
        try {
            if(attempted)throw new IllegalStateException("Owned installation already attempted");
            attempted=true;
            for(int i=0;i<hooks.length;i++) {
                final Kind kind=Kind.values()[i];Method target=hooks[i];
                window(deadline);
                XposedInterface.HookBuilder builder=Objects.requireNonNull(module.hook(target));
                window(deadline);
                builder=Objects.requireNonNull(builder.setExceptionMode(XposedInterface.ExceptionMode.PASSTHROUGH));
                window(deadline);registrations[i]=1;
                XposedInterface.HookHandle handle;
                try {handle=builder.intercept(chain->intercept(kind,chain));}
                catch(Throwable error){registrations[i]=2;throw error;}
                retained[i]=handle;registrations[i]=handle==null?3:4;
                window(deadline);
                if(handle==null||!target.equals(handle.getExecutable()))
                    throw new IllegalStateException("Owned hook handle differs");
                window(deadline);ingress.requireDistinctOwnershipHandle(this,handle);
                for(int j=0;j<i;j++)if(retained[j]==handle)
                    throw new IllegalStateException("Owned hook reused cleanup handle");
                window(deadline);registrations[i]=5;
            }
            for(int i=0;i<deopts.length;i++) {
                window(deadline);boolean yes;
                try {yes=module.deoptimize(profile.callers.get(i));}
                catch(Throwable error){deopts[i]=3;deoptErrors[i]=error;throw error;}
                deopts[i]=yes?1:2;window(deadline);
                if(!yes)throw new IllegalStateException("Owned deopt returned false");
            }
            window(deadline);installed=true;
        }catch(Throwable error){fail(error);}
    }
    private void window(long deadline)throws Exception {ingress.checkOwnershipWindow(this,deadline);}

    /** Caller already owns PMS; control never spans a native call or a PMS wait. */
    void attach(Object pms,Object monitor,HiddenOwnershipCore core,RootOwnershipObservation.Bound observer) {
        if(!Thread.holdsLock(monitor))throw new IllegalStateException("Owned attach requires held PMS");
        synchronized(control) {
            try {
            if(!installed||!ingress.available())throw new IllegalStateException("Owned adapter unavailable");
            if(binding!=null) {
                if(!binding.same(pms,monitor,core,observer))throw new IllegalStateException("Owned binding differs");
                return;
            }
            if(prebindingActive!=0)throw new IllegalStateException("Unbound state write remains in flight");
            binding=new Bound(pms,monitor,core,observer);
            }catch(Throwable error){fail(error);throw error;}
        }
    }

    /** Pure structural check under the already-held PMS monitor; never installs or acquires another lock. */
    void requirePreparationBinding(Object pms,Object monitor,HiddenOwnershipCore core,RootOwnershipObservation.Bound observer) {
        Bound exact=binding;
        if(!Thread.holdsLock(monitor)||!installed||!ingress.available()||exact==null
                ||!exact.same(pms,monitor,core,observer))
            throw new IllegalStateException("Owned hide preparation binding unavailable");
    }

    private Object intercept(Kind kind,XposedInterface.Chain chain)throws Throwable {
        if(kind==Kind.COMMIT)return commit(chain);
        Active own=active.get();boolean matched=false;
        try {
            if(own!=null&&depth()==0) {
                requireActive(own);
                if(!hooks[kind.ordinal()].equals(chain.getExecutable()))throw mismatch();
                matchEntry(kind,own,chain);matched=true;
            }
        }catch(Throwable error){if(own!=null)own.invalid=true;fail(error);}
        if(!matched)return ordinary(kind,chain);
        final Object result;
        try {
            if(kind==Kind.LEAF)
                result=own.bound.core.hiddenWrite(chain.getThisObject(),own.permit.hidden,chain::proceed);
            else result=chain.proceed();
        }catch(Throwable original){own.invalid=true;throw original;}
        try {requireActive(own);matchReturn(kind,own,result);}
        catch(Throwable error){own.invalid=true;fail(error);}
        return result;
    }

    private void matchEntry(Kind kind,Active own,XposedInterface.Chain chain)throws Throwable {
        Object receiver=chain.getThisObject();List<Object> args=chain.getArgs();
        if(args==null)throw mismatch();
        switch(kind) {
            case ACCEPT -> {
                if(own.step!=Step.ACCEPT||receiver!=own.permit.consumer||args.size()!=1||args.get(0)!=own.write)throw mismatch();
                requireConsumer(own.permit);requireWrappers(own,false);own.step=Step.USER_STATE;
            }
            case STATE -> {
                if(own.step!=Step.USER_STATE||receiver!=own.write||args.size()!=1||!(args.get(0) instanceof Integer)
                        ||(Integer)args.get(0)!=own.permit.frame.userId())throw mismatch();
                requireWrappers(own,false);own.step=Step.USER_RETURN;
            }
            case USER -> {
                if(own.step!=Step.WRAPPER||receiver!=own.user||!booleanArgument(args,own.permit.hidden))throw mismatch();
                requireWrappers(own,true);own.step=Step.LEAF;
            }
            case LEAF -> {
                if(own.step!=Step.LEAF||receiver!=own.before.state||receiver.getClass()!=stateClass||!booleanArgument(args,own.permit.hidden))throw mismatch();
                requireWrappers(own,true);own.step=Step.LEAF_RETURN;
            }
            case CHANGED -> {
                if(own.step!=Step.CHANGED||receiver!=own.write||!args.isEmpty())throw mismatch();
                requireWrappers(own,true);own.step=Step.CHANGED_RETURN;
            }
            default -> throw mismatch();
        }
    }
    private void matchReturn(Kind kind,Active own,Object result)throws Throwable {
        switch(kind) {
            case STATE -> {
                if(own.step!=Step.USER_RETURN||result!=own.user)throw mismatch();
                requireWrappers(own,true);own.step=Step.WRAPPER;
            }
            case LEAF -> {
                if(own.step!=Step.LEAF_RETURN||result!=own.before.state)throw mismatch();
                requireWrappers(own,true);own.step=Step.WRAPPER_RETURN;
            }
            case USER -> {
                if(own.step!=Step.WRAPPER_RETURN||result!=own.user)throw mismatch();
                requireWrappers(own,true);own.step=Step.ACCEPT_RETURN;
            }
            case ACCEPT -> {
                if(own.step!=Step.ACCEPT_RETURN||result!=null)throw mismatch();
                requireConsumer(own.permit);requireWrappers(own,true);own.step=Step.CHANGED;
            }
            case CHANGED -> {
                if(own.step!=Step.CHANGED_RETURN||result!=null)throw mismatch();
                requireWrappers(own,true);own.step=Step.DONE;
            }
            default -> throw mismatch();
        }
    }

    private Object commit(XposedInterface.Chain chain)throws Throwable {
        // Reentrant commits are ordinary, even while the outer IPM scope is private.
        // Preserve their original once while making the enclosing proof unusable.
        if(active.get()!=null||depth()!=0) {
            Active own=active.get();if(own!=null)own.invalid=true;
            fail(mismatch());return ordinary(Kind.COMMIT,chain);
        }
        RootHiddenRequestIngress.CommitPermit permit=null;
        try {
            if(!installed||!ingress.available())ingress.rejectPrivateCommitFailure(mismatch());
            if(installed&&ingress.available()) {
                if(!hooks[5].equals(chain.getExecutable()))throw mismatch();
                List<Object> args=chain.getArgs();
                if(args==null||args.size()!=3)throw mismatch();
                // A non-private call is transparent, including nonnull InitialState.
                permit=ingress.claimCommitPermit(this,chain.getThisObject(),args.get(0),args.get(1),args.get(2));
                if(permit!=null)requireConsumer(permit);
            }
        }catch(Throwable error){
            fail(error);
            if(permit!=null||error instanceof RootHiddenRequestIngress.PrivateCommitRejection)throw error;
            ingress.rejectPrivateCommitFailure(error);
        }
        if(permit==null)return ordinary(Kind.COMMIT,chain);
        final RootHiddenRequestIngress.CommitPermit exact=permit;
        Bound bound=binding;
        if(bound==null||bound.pms!=exact.pms||bound.monitor!=exact.monitor) {
            IllegalStateException error=mismatch();fail(error);throw error;
        }
        // Only the already-authorized null-InitialState commit receives this lock.
        // The enclosing IPM call, process kills and broadcasts stay outside it.
        synchronized(bound.monitor) {
            try {
                ingress.requireCommitPermit(this,exact);
                HiddenOwnershipCore.Target target=new HiddenOwnershipCore.Target(exact.frame.userId(),exact.frame.serial(),exact.frame.packageName());
                HiddenOwnershipCore.Probe probe=()->bound.observer.probe(exact.frame.instance,target,exact.frame.appId());
                HiddenOwnershipCore.Live before=probe.read();
                Object mutator=pmsMutator.get(bound.pms);
                if(mutator==null||mutator.getClass()!=mutatorClass)throw mismatch();
                Object write=mutatorWrite.get(mutator);
                if(write==null||write.getClass()!=writeClass)throw mismatch();
                Object user=writeUser.get(write);
                if(user==null||user.getClass()!=userClass||before==null)throw mismatch();
                Active own=new Active(exact,bound,before,write,user);
                HiddenOwnershipCore.Commit original=()->{
                    if(active.get()!=null)throw mismatch();
                    active.set(own);
                    try {
                        // The Core frame now exists. A probe-tail ordinary write
                        // must invalidate that pending frame, and an earlier
                        // complete hide cannot be claimed as our false->true write.
                        requireActive(own);
                        HiddenOwnershipCore.Live armed=probe.read();
                        requireActive(own);
                        if(armed==null||armed.hidden==exact.hidden||!armed.ordinaryInstalled()||!before.sameInstance(armed))throw mismatch();
                        Object result=chain.proceed();
                        requireActive(own);
                        if(own.step!=Step.DONE||result==null||result.getClass()!=resultClass||result!=success.get(null))throw mismatch();
                        return result;
                    }finally{active.remove();}
                };
                if(exact.hidden) {
                    HiddenOwnershipCore.HidePreparation preparation=ingress.claimPreparedHideCommit(this,exact);
                    HiddenOwnershipCore.HideReceipt receipt=bound.core.hideCommit(preparation,target,probe,original);
                    ingress.retainCommitReceipt(this,exact,target,receipt);
                    if(receipt.token!=null)count(minted);
                    return receipt.nativeResult;
                }
                HiddenOwnershipCore.RestoreAttempt attempt=ingress.newRestoreAttempt(this,exact);
                try {
                    Object result=bound.core.restoreCommit(attempt,probe,original);
                    ingress.retainRestoreReceipt(this,exact,attempt);
                    return result;
                }catch(Throwable failure) {
                    try{bound.core.abandonRestore(attempt);}catch(Throwable cleanup){fail(cleanup);}
                    throw failure;
                }
            }catch(Throwable original){fail(original);throw original;}
        }
    }

    /** Ordinary originals remain outside bookkeeping catches and execute once. */
    private Object ordinary(Kind kind,XposedInterface.Chain chain)throws Throwable {
        int previous=depth();boolean depthSet=false,early=false;
        HiddenOwnershipCore.OrdinaryStateWrite scope=null;
        try {
            if(previous==Integer.MAX_VALUE)throw new IllegalStateException("Ordinary adapter depth exhausted");
            ordinaryDepth.set(previous+1);depthSet=true;
            if(kind==Kind.LEAF) {
                Bound bound;
                synchronized(control) {
                    bound=binding;
                    if(bound==null) {
                        if(prebindingActive==Long.MAX_VALUE)throw new IllegalStateException("Early state write count exhausted");
                        prebindingActive++;early=true;
                    }
                }
                if(bound!=null) {
                    if(!Thread.holdsLock(bound.monitor))throw new IllegalStateException("Ordinary leaf lacks native PMS lock");
                    scope=bound.core.beginOrdinaryStateWrite(chain.getThisObject());
                }
            }
        }catch(Throwable error){fail(error);}
        try{return chain.proceed();}
        finally {
            if(scope!=null)try{scope.close();}catch(Throwable error){fail(error);}
            if(early)try {
                synchronized(control) {
                    if(prebindingActive<=0)throw new IllegalStateException("Early state write count corrupted");
                    prebindingActive--;
                }
            }catch(Throwable error){fail(error);}
            if(depthSet)try{if(previous==0)ordinaryDepth.remove();else ordinaryDepth.set(previous);}
            catch(Throwable error){fail(error);}
        }
    }
    private int depth(){Integer value=ordinaryDepth.get();return value==null?0:value;}
    private void requireActive(Active own)throws Throwable {
        if(active.get()!=own||own.invalid||binding!=own.bound||!Thread.holdsLock(own.bound.monitor)||depth()!=0)throw mismatch();
        ingress.requireCommitPermit(this,own.permit);
    }
    private void requireConsumer(RootHiddenRequestIngress.CommitPermit permit)throws Throwable {
        Object consumer=permit.consumer;
        if(consumer==null||consumer.getClass()!=lambdaClass||lambdaUser.getInt(consumer)!=permit.frame.userId()
                ||lambdaHidden.getBoolean(consumer)!=permit.hidden)throw mismatch();
    }
    private void requireWrappers(Active own,boolean selected)throws Throwable {
        Object mutator=pmsMutator.get(own.bound.pms);
        if(mutator==null||mutator.getClass()!=mutatorClass||mutatorWrite.get(mutator)!=own.write
                ||writeState.get(own.write)!=own.before.pkg||writeUser.get(own.write)!=own.user
                ||selected&&userState.get(own.user)!=own.before.state)throw mismatch();
    }
    private static boolean booleanArgument(List<Object> args,boolean value){return args.size()==1&&Boolean.valueOf(value).equals(args.get(0));}
    private static IllegalStateException mismatch(){return new IllegalStateException("Owned native causal stage differs");}
    private void fail(Throwable error){ingress.revoke(error);}
    private void count(AtomicLong counter) {
        for(;;){long value=counter.get();if(value==Long.MAX_VALUE){IllegalStateException error=new IllegalStateException("Owned counter exhausted");fail(error);throw error;}
            if(counter.compareAndSet(value,value+1))return;}
    }
    void confirmed(){count(confirmed);}
    void restored(){count(restored);}
    void discarded(){count(discarded);}
    String diagnostic() {
        StringBuilder registration=new StringBuilder();for(int value:registrations)registration.append(value);
        StringBuilder deopt=new StringBuilder();for(int value:deopts)deopt.append(value);
        return "OWNED_ADAPTER hooks="+registration+" deopt="+deopt+" bound="+(binding!=null)
                +" minted="+minted.get()+" confirmed="+confirmed.get()+" discarded="+discarded.get()+" restored="+restored.get()+"\n";
    }
}
