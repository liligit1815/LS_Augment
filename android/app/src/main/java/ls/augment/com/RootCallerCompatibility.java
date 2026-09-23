package ls.augment.com;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Objects;
import java.util.function.Consumer;

/**
 * Read-only, fixed-OEM identity-compatibility candidate. Not installed in production.
 * A Ticket witnesses initialization and object identities, NOT Root authorization,
 * lifecycle exclusion, package ownership, ART readiness or permission to mutate.
 * The enclosing command must authenticate the complete Binder UID and retain the
 * native permission gates. No native setter/stop/init method is resolved here.
 */
final class RootCallerCompatibility {
    static final class Preparation {
        final boolean success;
        final String message;
        final Ticket ticket;
        private Preparation(Ticket ticket, String message) {
            this.success = ticket != null; this.ticket = ticket; this.message = message;
        }
    }
    static final class TargetEvidence {
        final int userId, appId;
        final String packageName;
        private TargetEvidence(int userId, String packageName, int appId) {
            this.userId = userId; this.packageName = packageName; this.appId = appId;
        }
    }
    /** Immutable reference identities; referenced OEM objects themselves remain live. */
    static final class Ticket {
        private final RootCallerCompatibility owner;
        private final Binding binding;
        private final Looper mainLooper;
        private final Object helper;
        private final boolean feature;
        private final int skipUid;
        private Ticket(RootCallerCompatibility owner, Binding binding, Looper mainLooper,
                       Object helper, boolean feature, int skipUid) {
            this.owner = owner; this.binding = binding; this.mainLooper = mainLooper;
            this.helper = helper; this.feature = feature; this.skipUid = skipUid;
        }
    }
    private static final class State {
        final Object attempt;
        final Ticket ticket;
        State(Object attempt, Ticket ticket) { this.attempt = attempt; this.ticket = ticket; }
    }
    private static final class CompatibilityFailure extends IllegalStateException {
        final String reason;
        CompatibilityFailure(String reason) { super(reason); this.reason=reason; }
    }
    private static final class Binding {
        final Object shell, ipm, pms, pmi, zte, context, handler, broadcast, installer;
        Binding(Object shell, Object ipm, Object pms, Object pmi, Object zte,
                Object context, Object handler, Object broadcast, Object installer) {
            this.shell=shell; this.ipm=ipm; this.pms=pms; this.pmi=pmi; this.zte=zte;
            this.context=context; this.handler=handler; this.broadcast=broadcast; this.installer=installer;
        }
        boolean same(Binding other) {
            return shell==other.shell && ipm==other.ipm && pms==other.pms && pmi==other.pmi
                    && zte==other.zte && context==other.context && handler==other.handler
                    && broadcast==other.broadcast && installer==other.installer;
        }
    }

    private final Object publicationLock = new Object();
    private volatile State state = new State(new Object(), null);
    private final Class<?> shellClass, ipmClass, pmsClass, pmiClass, pmiApi, helperClass, zteClass;
    private final Class<?> computerClass, stateClass, packageClass;
    private final Field shellIpm, ipmPms, ipmBasePms, pmiPms, pmiBasePms;
    private final Field pmsContext, pmsHandler, pmsBroadcast, pmsInstaller, pmsZte;
    private final Field ztePms, zteContext, zteBroadcast, zteFeature;
    private final Field helperFeature, helperInstance, helperSkip;
    private final Field helperContext, helperHandler, helperBroadcast, helperInstaller, helperPmi;
    private final Method localService, snapshot, packageState, packageName, appId, system;
    private final Method getPackage, packageUid, instantCaller;

    /** Resolves exact signatures/modifiers only. Class.forName initialization is disabled. */
    RootCallerCompatibility(ClassLoader loader) throws ReflectiveOperationException {
        shellClass=type(loader,"com.android.server.pm.PackageManagerShellCommand");
        ipmClass=type(loader,"com.android.server.pm.PackageManagerService$IPackageManagerImpl");
        pmsClass=type(loader,"com.android.server.pm.PackageManagerService");
        pmiClass=type(loader,"com.android.server.pm.PackageManagerService$PackageManagerInternalImpl");
        pmiApi=type(loader,"android.content.pm.PackageManagerInternal");
        helperClass=type(loader,"com.android.server.pm.PrivateSpaceHelper");
        zteClass=type(loader,"com.android.server.pm.PackageManagerServiceZteHook");
        computerClass=type(loader,"com.android.server.pm.Computer");
        stateClass=type(loader,"com.android.server.pm.pkg.PackageStateInternal");
        Class<?> stateBase=type(loader,"com.android.server.pm.pkg.PackageState");
        packageClass=type(loader,"com.android.internal.pm.parsing.pkg.AndroidPackageInternal");
        Class<?> packageBase=type(loader,"com.android.server.pm.pkg.AndroidPackage");
        Class<?> ipmBase=type(loader,"com.android.server.pm.IPackageManagerBase");
        Class<?> pmiBase=type(loader,"com.android.server.pm.PackageManagerInternalBase");
        Class<?> broadcast=type(loader,"com.android.server.pm.BroadcastHelper");
        Class<?> installer=type(loader,"com.android.server.pm.PackageInstallerService");
        if (ipmClass.getSuperclass()!=ipmBase || pmiClass.getSuperclass()!=pmiBase
                || !pmiApi.isAssignableFrom(pmiClass) || !stateBase.isAssignableFrom(stateClass)
                || !packageBase.isAssignableFrom(packageClass))
            throw new NoSuchFieldException("Unexpected fixed-OEM hierarchy");
        shellIpm=field(shellClass,"mInterface",type(loader,"android.content.pm.IPackageManager"),false,true);
        ipmPms=field(ipmClass,"this$0",pmsClass,false,true);
        ipmBasePms=field(ipmBase,"mService",pmsClass,false,true);
        pmiPms=field(pmiClass,"this$0",pmsClass,false,true);
        pmiBasePms=field(pmiBase,"mService",pmsClass,false,true);
        pmsContext=field(pmsClass,"mContext",Context.class,false,true);
        pmsHandler=field(pmsClass,"mHandler",Handler.class,false,true);
        pmsBroadcast=field(pmsClass,"mBroadcastHelper",broadcast,false,true);
        pmsInstaller=field(pmsClass,"mInstallerService",installer,false,true);
        pmsZte=field(pmsClass,"mZteHook",zteClass,false,true);
        ztePms=field(zteClass,"mPm",pmsClass,false,true);
        zteContext=field(zteClass,"mContext",Context.class,false,true);
        zteBroadcast=field(zteClass,"mBroadcastHelper",broadcast,false,true);
        zteFeature=field(zteClass,"ZTE_FEATURE_NEW_PRIVATE_SPACE",boolean.class,true,true);
        helperFeature=field(helperClass,"ZTE_FEATURE_NEW_PRIVATE_SPACE",boolean.class,true,true);
        helperInstance=field(helperClass,"sInstance",helperClass,true,false);
        helperSkip=field(helperClass,"mSkipFilterCallingUid",int.class,true,false);
        helperContext=field(helperClass,"mContext",Context.class,false,true);
        helperHandler=field(helperClass,"mHandler",Handler.class,false,true);
        helperBroadcast=field(helperClass,"mBroadcastHelper",broadcast,false,true);
        helperInstaller=field(helperClass,"mInstallerService",installer,false,true);
        helperPmi=field(helperClass,"mPmi",pmiApi,false,true);
        localService=method(type(loader,"com.android.server.LocalServices"),"getService",Object.class,true,Class.class);
        snapshot=method(pmsClass,"snapshotComputer",computerClass,false);
        packageState=method(computerClass,"getPackageStateInternal",stateClass,false,String.class);
        packageName=method(stateBase,"getPackageName",String.class,false);
        appId=method(stateBase,"getAppId",int.class,false);
        system=method(stateBase,"isSystem",boolean.class,false);
        getPackage=method(stateClass,"getPkg",packageClass,false);
        packageUid=method(packageBase,"getUid",int.class,false);
        instantCaller=method(computerClass,"getInstantAppPackageName",String.class,false,int.class);
    }

    /**
     * Nonblocking. Call without official monitors or the external lifecycle gate.
     * A new attempt revokes all previous tickets/attempts. Success runs on the
     * SystemServer main Looper; scheduling failure may call back on this thread.
     * An external deadline can call invalidate(); there is no synchronous wait.
     */
    void prepareAsync(Object shell, Consumer<Preparation> completion) {
        Objects.requireNonNull(completion,"completion");
        Object attempt=new Object();
        synchronized (publicationLock) { state=new State(attempt,null); }
        try {
            Looper main=Looper.getMainLooper();
            if (main==null) throw failure("MAIN_LOOPER_UNAVAILABLE");
            if (!new Handler(main).post(() -> prepareOnMain(attempt,main,shell,completion)))
                finishFailure(attempt,"MAIN_POST_REJECTED",completion);
        } catch (Throwable error) { finishFailure(attempt,"MAIN_SCHEDULING_FAILED",completion); }
    }

    private void prepareOnMain(Object attempt, Looper main, Object shell, Consumer<Preparation> completion) {
        try {
            if (state.attempt!=attempt) throw failure("PREPARATION_REVOKED");
            if (Looper.myLooper()!=main || Looper.getMainLooper()!=main) throw failure("WRONG_MAIN_LANE");
            Binding bound=bind(shell);
            boolean feature=helperFeature.getBoolean(null);
            Object helper=null; int skip=0;
            if (feature) {
                helper=checkedHelper(bound);
                skip=helperSkip.getInt(null);
                requireSkip(skip);
            }
            Ticket ticket=new Ticket(this,bound,main,helper,feature,skip);
            synchronized (publicationLock) {
                if (state.attempt!=attempt) throw failure("PREPARATION_REVOKED");
                state=new State(attempt,ticket);
            }
            // Revocation can occur after this check too: every consumer must requireCurrent.
            requireCurrent(ticket);
            notifyCompletion(completion,new Preparation(ticket,"IDENTITY_INITIALIZATION_OBSERVED"));
        } catch (Throwable error) { finishFailure(attempt,reason(error),completion); }
    }

    void invalidate() {
        synchronized (publicationLock) { state=new State(new Object(),null); }
    }
    Ticket currentTicket() { return state.ticket; }
    /** Pure-memory identity check: no reflection, clock, IPC, blocking or official monitor. */
    void requireCurrent(Ticket ticket) {
        if (ticket==null || ticket.owner!=this || state.ticket!=ticket) throw failure("TICKET_REVOKED");
    }

    /**
     * Read-only OEM queries, with no official monitors held by the caller.
     * The enclosing engine must hold its actual lifecycle lease and revalidate
     * serial/generation at the final mutation boundary; this method supplies no lock.
     * Every failed verification revokes this ticket, never a newer preparation.
     */
    TargetEvidence verify(Ticket ticket, Object currentShell, int userId, String name) throws Throwable {
        requireCurrent(ticket);
        try {
            if (userId<0 || userId>99999 || name==null || name.length()>255
                    || !name.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+"))
                throw failure("INVALID_TARGET");
            Binding current=checkBinding(ticket,currentShell);
            Object computer=invoke(snapshot,current.pms);
            instance(computer,computerClass,"COMPUTER_UNAVAILABLE");
            if (invoke(instantCaller,computer,0)!=null || invoke(instantCaller,computer,1000)!=null)
                throw failure("PRIVILEGED_CALLER_IS_INSTANT");
            Object target=invoke(packageState,computer,name);
            instance(target,stateClass,"PACKAGE_STATE_UNAVAILABLE");
            if (!name.equals(invoke(packageName,target))) throw failure("PACKAGE_NAME_MISMATCH");
            int actualAppId=(Integer)invoke(appId,target);
            if ((Boolean)invoke(system,target) || actualAppId<10000 || actualAppId>=100000)
                throw failure("ORDINARY_APPLICATION_REQUIRED");
            Object pkg=invoke(getPackage,target);
            instance(pkg,packageClass,"ANDROID_PACKAGE_UNAVAILABLE");
            // Fixed OEM AndroidPackage is global: its UID is this appId, not user*100000+appId.
            if ((Integer)invoke(packageUid,pkg)!=actualAppId) throw failure("PACKAGE_UID_MISMATCH");
            // Read-only queries can block or reenter. Catch observed drift before returning;
            // two reads still cannot supply atomic exclusion against external OEM changes.
            checkBinding(ticket,currentShell);
            requireCurrent(ticket);
            return new TargetEvidence(userId,name,actualAppId);
        } catch (Throwable error) { revoke(ticket); throw error; }
    }

    private Binding checkBinding(Ticket ticket,Object shell) throws Throwable {
        if (Looper.getMainLooper()!=ticket.mainLooper) throw failure("MAIN_LOOPER_DRIFT");
        Binding current=bind(shell);
        if (!ticket.binding.same(current)) throw failure("NATIVE_OBJECT_DRIFT");
        if (helperFeature.getBoolean(null)!=ticket.feature) throw failure("PRIVATE_FEATURE_DRIFT");
        if (ticket.feature) {
            if (checkedHelper(current)!=ticket.helper) throw failure("PRIVATE_HELPER_DRIFT");
            int skip=helperSkip.getInt(null);
            requireSkip(skip);
            if (skip!=ticket.skipUid) throw failure("PRIVATE_SKIP_DRIFT");
        }
        return current;
    }

    private Binding bind(Object shell) throws Throwable {
        exact(shell,shellClass,"SHELL_SHAPE");
        Object ipm=shellIpm.get(shell); exact(ipm,ipmClass,"IPM_SHAPE");
        Object pms=ipmPms.get(ipm); exact(pms,pmsClass,"PMS_SHAPE");
        if (ipmBasePms.get(ipm)!=pms) throw failure("IPM_OWNER_MISMATCH");
        Object pmi=invoke(localService,null,pmiApi); exact(pmi,pmiClass,"PMI_SHAPE");
        if (pmiPms.get(pmi)!=pms || pmiBasePms.get(pmi)!=pms) throw failure("PMI_OWNER_MISMATCH");
        Object context=pmsContext.get(pms), handler=pmsHandler.get(pms);
        Object broadcast=pmsBroadcast.get(pms), installer=pmsInstaller.get(pms);
        if (context==null || handler==null || broadcast==null || installer==null)
            throw failure("PMS_DEPENDENCY_UNAVAILABLE");
        Object zte=pmsZte.get(pms); exact(zte,zteClass,"ZTE_SHAPE");
        if (ztePms.get(zte)!=pms || zteContext.get(zte)!=context || zteBroadcast.get(zte)!=broadcast)
            throw failure("ZTE_OWNER_MISMATCH");
        return new Binding(shell,ipm,pms,pmi,zte,context,handler,broadcast,installer);
    }

    private Object checkedHelper(Binding bound) throws Throwable {
        if (!zteFeature.getBoolean(null)) throw failure("PRIVATE_INITIALIZATION_GATE_OFF");
        Object helper=helperInstance.get(null); exact(helper,helperClass,"PRIVATE_HELPER_UNAVAILABLE");
        if (helperContext.get(helper)!=bound.context || helperHandler.get(helper)!=bound.handler
                || helperBroadcast.get(helper)!=bound.broadcast || helperInstaller.get(helper)!=bound.installer
                || helperPmi.get(helper)!=bound.pmi) throw failure("PRIVATE_HELPER_OWNER_MISMATCH");
        return helper;
    }

    private void finishFailure(Object attempt, String reason, Consumer<Preparation> completion) {
        synchronized (publicationLock) {
            if (state.attempt==attempt) state=new State(attempt,null);
            else reason="PREPARATION_REVOKED";
        }
        notifyCompletion(completion,new Preparation(null,reason));
    }
    private void notifyCompletion(Consumer<Preparation> completion, Preparation result) {
        try { completion.accept(result); }
        catch (Throwable ignored) { if (result.ticket!=null) revoke(result.ticket); }
    }
    private void revoke(Ticket ticket) {
        synchronized (publicationLock) {
            if (state.ticket==ticket) state=new State(new Object(),null);
        }
    }
    private static void requireSkip(int uid) {
        if (uid==0 || uid==1000) throw failure("PRIVATE_SKIP_DISTINGUISHES_ROOT_SYSTEM");
    }
    private static IllegalStateException failure(String reason) { return new CompatibilityFailure(reason); }
    private static String reason(Throwable error) {
        // Do not call an OEM Throwable's overridable getMessage while reporting a failure.
        return error instanceof CompatibilityFailure ? ((CompatibilityFailure)error).reason : "OEM_READ_FAILED";
    }
    private static Class<?> type(ClassLoader loader,String name) throws ClassNotFoundException {
        return Class.forName(name,false,loader);
    }
    private static Field field(Class<?> owner,String name,Class<?> type,boolean isStatic,boolean isFinal)
            throws ReflectiveOperationException {
        Field found=owner.getDeclaredField(name);
        int modifiers=found.getModifiers();
        if (found.getType()!=type || !Modifier.isPublic(modifiers)
                || Modifier.isStatic(modifiers)!=isStatic || Modifier.isFinal(modifiers)!=isFinal)
            throw new NoSuchFieldException(owner.getName()+"."+name);
        found.setAccessible(true); return found;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,boolean isStatic,Class<?>...args)
            throws ReflectiveOperationException {
        Method found=null;
        for (Method candidate:owner.getDeclaredMethods()) {
            if (candidate.getName().equals(name) && candidate.getReturnType()==result
                    && Arrays.equals(candidate.getParameterTypes(),args)
                    && Modifier.isPublic(candidate.getModifiers())
                    && Modifier.isStatic(candidate.getModifiers())==isStatic) {
                if (found!=null) throw new NoSuchMethodException("Ambiguous "+owner.getName()+"."+name);
                found=candidate;
            }
        }
        if (found==null) throw new NoSuchMethodException(owner.getName()+"."+name);
        found.setAccessible(true); return found;
    }
    private static void exact(Object value,Class<?> type,String reason) {
        if (value==null || value.getClass()!=type) throw failure(reason);
    }
    private static void instance(Object value,Class<?> type,String reason) {
        if (value==null || !type.isInstance(value)) throw failure(reason);
    }
    private static Object invoke(Method method,Object receiver,Object...args) throws Throwable {
        try { return method.invoke(receiver,args); }
        catch (InvocationTargetException failure) { throw failure.getCause(); }
    }
}
