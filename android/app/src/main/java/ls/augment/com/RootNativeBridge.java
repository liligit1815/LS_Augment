package ls.augment.com;

import android.os.Binder;
import android.os.Handler;
import android.os.Looper;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Objects;

/**
 * OFFLINE platform-adapter candidate, not installed or called by production.
 * Resolving this shape does not establish ROM provenance, hook/deopt readiness,
 * lifecycle exclusion or notification completion. A real enclosing transaction
 * must supply those guarantees before any mutation method is callable.
 */
final class RootNativeBridge {
    sealed interface Lease permits RootTransactionEngine.Frame {
        /** Must check the actual owning thread, gate and readiness generation; no IPC or locking. */
        void requireCurrent();
        void requireBridgeOwner(Bound expected);
        void requireProcessGroupScope(Bound expected);
        void claimProcessGroupBridge(Bound expected);
        int userId();
        long serial();
        String packageName();
        int appId();
    }
    static final class UserEvidence {
        final Object instance;
        final int userId, serial;
        final boolean active;
        UserEvidence(Object instance, int userId, int serial, boolean active) {
            this.instance = instance; this.userId = userId; this.serial = serial; this.active = active;
        }
    }
    static final class PackageEvidence {
        final int appId;
        final boolean system, installed, hidden, stopped;
        PackageEvidence(int appId, boolean system, boolean installed, boolean hidden, boolean stopped) {
            this.appId = appId; this.system = system; this.installed = installed;
            this.hidden = hidden; this.stopped = stopped;
        }
    }
    private final Class<?> shellClass, pmsClass, ipmClass, umsClass, userDataClass, userInfoClass;
    private final Class<?> amsClass, amLocalClass, stateClass, userStateClass, computerClass;
    private final Field shellIpm, ipmPms, amLocalAms, amsHandler;
    private final Field pmLock, pmWriteLock, umsPackagesLock, usersLock, users, removing, userDataInfo;
    private final Field userId, userSerial, partial, preCreated, userFlags;
    private final Method getUms, getLocalService, snapshot, packageState, appId, system;
    private final Method userState, installed, hidden, stopped, publicStop, hide, syncKill;
    private final Class<?> amInternalClass;
    private final RootProcessGroupProfile.Resolved processGroup;
    private final RootOwnershipObservation observation;

    RootNativeBridge(ClassLoader loader,RootProcessGroupProfile.Resolved processGroup) throws ReflectiveOperationException {
        this(loader,processGroup,null);
    }
    RootNativeBridge(ClassLoader loader,RootProcessGroupProfile.Resolved processGroup,RootOwnershipObservation observation) throws ReflectiveOperationException {
        this.observation=observation;
        // Only the private-constructor source-attested profile supplies these new methods.
        // Never resolve Process/Trace afresh from an arbitrary convenience loader.
        this.processGroup=Objects.requireNonNull(processGroup);
        shellClass = type(loader, "com.android.server.pm.PackageManagerShellCommand");
        pmsClass = type(loader, "com.android.server.pm.PackageManagerService");
        ipmClass = type(loader, "com.android.server.pm.PackageManagerService$IPackageManagerImpl");
        umsClass = type(loader, "com.android.server.pm.UserManagerService");
        userDataClass = type(loader, "com.android.server.pm.UserManagerService$UserData");
        userInfoClass = type(loader, "android.content.pm.UserInfo");
        amsClass = type(loader, "com.android.server.am.ActivityManagerService");
        amLocalClass = type(loader, "com.android.server.am.ActivityManagerService$LocalService");
        amInternalClass = type(loader, "android.app.ActivityManagerInternal");
        computerClass = type(loader, "com.android.server.pm.Computer");
        stateClass = type(loader, "com.android.server.pm.pkg.PackageStateInternal");
        userStateClass = type(loader, "com.android.server.pm.pkg.PackageUserStateInternal");
        Class<?> stateBase = type(loader, "com.android.server.pm.pkg.PackageState");
        Class<?> userStateBase = type(loader, "com.android.server.pm.pkg.PackageUserState");
        shellIpm = field(shellClass, "mInterface", type(loader, "android.content.pm.IPackageManager"));
        ipmPms = field(ipmClass, "this$0", pmsClass);
        amLocalAms = field(amLocalClass, "this$0", amsClass);
        amsHandler = field(amsClass, "mHandler", type(loader, "com.android.server.am.ActivityManagerService$MainHandler"));
        Class<?> tracedLock = type(loader, "com.android.server.pm.PackageManagerTracedLock");
        pmLock = field(pmsClass, "mLock", tracedLock);
        pmWriteLock = field(pmsClass, "mPackageStateWriteLock", tracedLock);
        umsPackagesLock = field(umsClass, "mPackagesLock", Object.class);
        usersLock = field(umsClass, "mUsersLock", Object.class);
        users = field(umsClass, "mUsers", SparseArray.class);
        removing = field(umsClass, "mRemovingUserIds", SparseBooleanArray.class);
        userDataInfo = field(userDataClass, "info", userInfoClass);
        userId = field(userInfoClass, "id", int.class);
        userSerial = field(userInfoClass, "serialNumber", int.class);
        partial = field(userInfoClass, "partial", boolean.class);
        preCreated = field(userInfoClass, "preCreated", boolean.class);
        userFlags = field(userInfoClass, "flags", int.class);
        getUms = method(umsClass, "getInstance", umsClass, true);
        getLocalService = method(type(loader, "com.android.server.LocalServices"), "getService", Object.class, true, Class.class);
        snapshot = method(pmsClass, "snapshotComputer", computerClass, false);
        packageState = method(computerClass, "getPackageStateInternal", stateClass, false, String.class);
        appId = method(stateBase, "getAppId", int.class, false);
        system = method(stateBase, "isSystem", boolean.class, false);
        // This interface has two covariant-return methods with identical name/args.
        userState = method(stateClass, "getUserStateOrDefault", userStateClass, false, int.class);
        installed = method(userStateBase, "isInstalled", boolean.class, false);
        hidden = method(userStateBase, "isHidden", boolean.class, false);
        stopped = method(userStateBase, "isStopped", boolean.class, false);
        publicStop = method(amsClass, "forceStopPackage", void.class, false, String.class, int.class);
        hide = method(ipmClass, "setApplicationHiddenSettingAsUser", boolean.class, false,
                String.class, boolean.class, int.class);
        syncKill = method(amLocalClass, "killApplicationSync", void.class, false,
                String.class, int.class, int.class, String.class, int.class);
    }

    /** Called from the authenticated command without holding any framework monitor. No PM writes. */
    Bound bind(Object shell) throws Throwable {
        exact(shell, shellClass);
        Object ipm = shellIpm.get(shell); exact(ipm, ipmClass);
        Object pms = ipmPms.get(ipm); exact(pms, pmsClass);
        Object ums = invoke(getUms, null); exact(ums, umsClass);
        Object local = invoke(getLocalService, null, amInternalClass); exact(local, amLocalClass);
        Object ams = amLocalAms.get(local); exact(ams, amsClass);
        processGroup.requireOomBinding(ams);
        Object pLock = pmLock.get(pms), pWrite = pmWriteLock.get(pms), uPackages = umsPackagesLock.get(ums);
        Object uLock = usersLock.get(ums);
        if (pLock == null || pWrite != pLock || uPackages != pLock || uLock == null || uLock == pLock)
            throw new IllegalStateException("Unexpected native lock identity");
        Object rawHandler = amsHandler.get(ams);
        if (!(rawHandler instanceof Handler)) throw new IllegalStateException("Missing ActivityManager lane");
        Handler handler = (Handler) rawHandler;
        if (handler.getLooper() == null) throw new IllegalStateException("Missing ActivityManager looper");
        return new Bound(ipm, pms, ums, local, ams, pLock, uLock, handler);
    }

    final class Bound {
        private final Object ipm, pms, ums, local, ams, packageLock, userLock;
        private final RootOwnershipObservation.Bound observed;
        final Handler handler;
        Bound(Object ipm, Object pms, Object ums, Object local, Object ams,
              Object packageLock, Object userLock, Handler handler) {
            this.ipm=ipm; this.pms=pms; this.ums=ums; this.local=local; this.ams=ams;
            this.packageLock=packageLock; this.userLock=userLock; this.handler=handler;
            observed=observation==null?null:observation.bind(pms,packageLock);
        }
        void requireStartupOwner(RootStartupBinding startup){
            startup.requireNativeOwner(pms,ams,ums,handler);
            if(observed!=null){observed.start();observed.bindRequests(ipm,this);}
        }
        void observeHideTarget(Lease lease) {
            requireLaneAndUnlocked(lease);
            requireApplicationTarget(lease,lease.packageName(),lease.userId());
            RootTransactionEngine.Frame frame=(RootTransactionEngine.Frame)requireActualFrame(lease);
            if(observed!=null)observed.track(frame.instance,lease.userId(),lease.serial(),lease.packageName(),lease.appId());
        }
        void prepareHideOwnership(RootTransactionEngine.Frame frame) throws Throwable {
            requireLaneAndUnlocked(frame);
            requireApplicationTarget(frame,frame.packageName(),frame.userId());
            frame.requireHidePreparationScope(this);
            if(observed==null)throw new IllegalStateException("Hide has no native ownership observer");
            RootHiddenRequestIngress.HidePreparation prepared=observed.preparePrivateHide(frame,this);
            if(prepared==null||prepared!=frame.hidePreparation())
                throw new IllegalStateException("Hide preparation was not retained by its exact frame");
        }
        void requireHidePrepared(RootTransactionEngine.Frame frame) throws Throwable {
            requireLaneAndUnlocked(frame);
            requireApplicationTarget(frame,frame.packageName(),frame.userId());
            frame.requireHidePreparedScope(this);
            if(observed==null)throw new IllegalStateException("Hide lost its native ownership observer");
            observed.requirePrivateHidePrepared(frame,this,frame.hidePreparation());
        }
        /** Exact retained identity permits cleanup after a sticky lease failure. */
        void releaseHidePreparation(RootTransactionEngine.Frame frame,RootHiddenRequestIngress.HidePreparation preparation) {
            if(preparation==null)return;
            if(observed==null)throw new IllegalStateException("Hide preparation lost its observer during cleanup");
            observed.releasePrivateHidePreparation(frame,this,preparation);
        }
        /** Nonblocking lookup only; authorization is rechecked with the new actual lease. */
        RootHiddenRequestIngress.ConfirmedHide captureRestoreSource(HideRootProtocol.Request request) {
            return observed==null?null:observed.captureRestoreSource(this,request);
        }
        boolean validateRestoreOwnership(RootTransactionEngine.Frame frame,
                RootHiddenRequestIngress.ConfirmedHide source) throws Throwable {
            requireLaneAndUnlocked(frame);
            frame.requireRestoreValidationScope(this);
            return observed!=null&&observed.validateRestoreOwnership(frame,this,source);
        }
        void requireLaneAndUnlocked(Lease lease) {
            requireActualFrame(lease).requireBridgeOwner(this);
            if (Looper.myLooper() != handler.getLooper()) throw new IllegalStateException("Wrong native lane");
            if (Binder.getCallingUid() != 1000) throw new IllegalStateException("Native lane must use its own system identity");
            if (Thread.holdsLock(packageLock) || Thread.holdsLock(userLock) || Thread.holdsLock(ams))
                throw new IllegalStateException("Framework monitor retained across native operation");
            requireOomBinding();
        }
        UserEvidence readUser(Lease lease, int expectedId) throws Throwable {
            requireLaneAndUnlocked(lease);
            if (expectedId < 0 || expectedId != lease.userId()) throw new IllegalArgumentException("Exact leased user required");
            long expectedSerial = lease.serial();
            UserEvidence result;
            synchronized (userLock) {
                Object rawUsers=users.get(ums), rawRemoving=removing.get(ums);
                exact(rawUsers, SparseArray.class); exact(rawRemoving, SparseBooleanArray.class);
                Object data=((SparseArray<?>)rawUsers).get(expectedId);
                if (data == null) return null;
                exact(data, userDataClass);
                Object info=userDataInfo.get(data); exact(info, userInfoClass);
                int id=userId.getInt(info), serial=userSerial.getInt(info);
                boolean active=id==expectedId && serial>=0 && serial==expectedSerial && !partial.getBoolean(info)
                        && !preCreated.getBoolean(info) && (userFlags.getInt(info)&0x40)==0
                        && !((SparseBooleanArray)rawRemoving).get(expectedId);
                result=new UserEvidence(info,id,serial,active);
            }
            lease.requireCurrent(); // no external callback under the native Users monitor
            return result;
        }
        PackageEvidence readPackage(Lease lease, String name, int targetUser) throws Throwable {
            requireLaneAndUnlocked(lease);
            requireTarget(lease,name,targetUser);
            Object computer=invoke(snapshot,pms);
            if (!computerClass.isInstance(computer)) throw new IllegalStateException("Unknown Computer");
            Object state=invoke(packageState,computer,name);
            if (state == null) return null;
            if (!stateClass.isInstance(state)) throw new IllegalStateException("Unknown package state");
            Object perUser=invoke(userState,state,targetUser);
            if (!userStateClass.isInstance(perUser)) throw new IllegalStateException("Unknown user package state");
            return new PackageEvidence((Integer)invoke(appId,state),(Boolean)invoke(system,state),
                    (Boolean)invoke(installed,perUser),(Boolean)invoke(hidden,perUser),(Boolean)invoke(stopped,perUser));
        }
        void forceStop(Lease lease, String name, int targetUser) throws Throwable {
            requireLaneAndUnlocked(lease);
            requireApplicationTarget(lease,name,targetUser);
            RootTransactionEngine.Frame frame=(RootTransactionEngine.Frame)requireActualFrame(lease);
            frame.requireStopRequestScope(this);
            requireHidePrepared(frame);
            frame.claimStopRequestScope(this);
            invoke(publicStop,ams,name,targetUser); // full native public stop, including stopped state/finish
        }
        boolean hide(Lease lease, String name, int targetUser) throws Throwable {
            requireLaneAndUnlocked(lease);
            requireApplicationTarget(lease,name,targetUser);
            RootTransactionEngine.Frame frame=(RootTransactionEngine.Frame)requireActualFrame(lease);
            frame.requireHiddenRequestScope(this);
            if(frame.restoring()||observed==null)throw new IllegalStateException("No prepared native hide path");
            requireHidePrepared(frame);
            // The one-shot exemption covers this exact native invocation only.
            // Native checks, commit, notifications and scheduling remain intact.
            return (Boolean)observed.privateHide(frame,this,ipm,()->invoke(hide,ipm,name,true,targetUser));
        }
        boolean restore(Lease lease,String name,int targetUser) throws Throwable {
            throw new IllegalStateException("Legacy ownership restore execution is disabled; a new manual SHOW is required");
        }
        boolean show(Lease lease,String name,int targetUser) throws Throwable {
            requireLaneAndUnlocked(lease);
            requireApplicationTarget(lease,name,targetUser);
            RootTransactionEngine.Frame frame=(RootTransactionEngine.Frame)requireActualFrame(lease);
            frame.claimManualShowScope(this);
            // Fresh current-target control uses the ordinary native request. No
            // private ownership ticket is created; permission and ordinary setter
            // hooks retain their native behavior and invalidate stale ownership.
            return (Boolean)invoke(hide,ipm,name,false,targetUser);
        }
        boolean completeHideOwnership(RootTransactionEngine.Frame frame,
                RootHiddenRequestIngress.PendingHide pending) throws Throwable {
            requireLaneAndUnlocked(frame);
            frame.requireHideCompletionScope(this);
            if(pending==null)return false;
            if(observed==null)throw new IllegalStateException("Pending hide lost its native observer");
            return observed.completePrivateHide(frame,this,pending);
        }
        /** Cleanup may run after a sticky lease failure; it must not replace that failure. */
        void discardHideOwnership(RootTransactionEngine.Frame frame,
                RootHiddenRequestIngress.PendingHide pending) {
            if(pending!=null && observed!=null)observed.discardPrivateHide(frame,this,pending);
        }
        boolean completeRestoreOwnership(RootTransactionEngine.Frame frame,
                RootHiddenRequestIngress.PendingRestore pending) throws Throwable {
            requireLaneAndUnlocked(frame);
            frame.requireRestoreCompletionScope(this);
            if(observed==null||pending==null)throw new IllegalStateException("Restore lost its completion witness");
            return observed.completePrivateRestore(frame,this,pending);
        }
        void discardRestoreOwnership(RootTransactionEngine.Frame frame,
                RootHiddenRequestIngress.PendingRestore pending) {
            if(pending!=null&&observed!=null)observed.discardPrivateRestore(frame,this,pending);
        }
        void syncKill(Lease lease, Object actualPms, String name, int targetAppId, int targetUser,
                      String reason, int reasonCode) throws Throwable {
            requireLaneAndUnlocked(lease);
            requireApplicationTarget(lease,name,targetUser);
            if (actualPms != pms) throw new IllegalStateException("Foreign PMS kill");
            if (targetAppId != lease.appId() || !"hiding pkg".equals(reason) || reasonCode != 13)
                throw new IllegalStateException("Unexpected native hide kill arguments");
            // Preserve the original PMS.killApplication identity discipline; never move a token across threads.
            long identity=Binder.clearCallingIdentity();
            try { invoke(syncKill,local,name,targetAppId,targetUser,reason,reasonCode); }
            finally { Binder.restoreCallingIdentity(identity); }
        }
        /** The original ProcessRecord path may already hold AMS/Proc monitors here. */
        void killProcessGroupInRoot(Lease lease,int uid,int pid) throws Throwable {
            requireActualFrame(lease).claimProcessGroupBridge(this);
            if(Looper.myLooper()!=handler.getLooper() || Binder.getCallingUid()!=1000)
                throw new IllegalStateException("Process group native call left its system AMS thread");
            requireOomBinding();
            // Native provider-dependency cleanup can select another app/user and isolated UID.
            // Retain those exact native parameters; only malformed numeric identities are rejected.
            if(uid<0 || pid<=0)throw new IllegalArgumentException("Invalid native process group uid/pid");
            Throwable failure=null;
            boolean tracing=false;
            try {
                invoke(processGroup.traceBegin,null,64L,"killProcessGroup");tracing=true;
                lease.requireProcessGroupScope(this);
                int result=(Integer)invoke(processGroup.nativeProcessKill,null,uid,pid);
                if(result!=0)throw new ProcessGroupResultException(uid,pid,result);
                lease.requireProcessGroupScope(this);
            } catch(Throwable error) { failure=error;throw error; }
            finally {
                if(tracing)try { invoke(processGroup.traceEnd,null,64L); }
                catch(Throwable endFailure) {
                    // Preserve the original native error/return fact if trace cleanup also fails.
                    if(failure==null)throw endFailure;
                    if(endFailure!=failure)try { failure.addSuppressed(endFailure); }
                    catch(Throwable suppressionFailure) { /* Never replace the original native failure. */ }
                }
            }
        }
        private void requireOomBinding() {
            // Read-only attested field agreement; no lock acquisition, IPC or OOM invocation.
            // KG reaches this while the original native path can already own AMS/Proc monitors.
            try { processGroup.requireOomBinding(ams); }
            catch(ReflectiveOperationException error) {
                throw new IllegalStateException("Actual OOM binding is no longer usable",error);
            }
        }
        private void requireTarget(Lease lease,String name,int targetUser) {
            if (targetUser < 0 || targetUser != lease.userId() || name == null || !name.equals(lease.packageName()))
                throw new IllegalArgumentException("Exact leased target required");
        }
        private void requireApplicationTarget(Lease lease,String name,int targetUser) {
            requireTarget(lease,name,targetUser);
            // Prevent SYSTEM_UID's native same-app exception from admitting shared system UIDs.
            // The controller must also validate the actual current package is a non-system app.
            if (lease.appId() < 10000) throw new IllegalArgumentException("Application UID required");
        }
    }
    private static Lease requireActualFrame(Lease lease) {
        // Keep a runtime identity check too: Android/D8 need not enforce Java's sealed metadata.
        if(lease==null || lease.getClass()!=RootTransactionEngine.Frame.class)
            throw new IllegalStateException("Only the exact Engine Frame can authorize native access");
        return lease;
    }
    /** A factual native return, not a claim about errno, missing processes or kernel completion. */
    static final class ProcessGroupResultException extends IllegalStateException {
        final int uid,pid,result;
        ProcessGroupResultException(int uid,int pid,int result) {
            super("Native process group returned "+result+" for uid="+uid+" pid="+pid);
            this.uid=uid;this.pid=pid;this.result=result;
        }
    }
    private static Class<?> type(ClassLoader loader, String name) throws ClassNotFoundException {
        return Class.forName(name,false,loader);
    }
    private static Field field(Class<?> owner,String name,Class<?> type) throws ReflectiveOperationException {
        Field f=owner.getDeclaredField(name);
        if (f.getType()!=type || Modifier.isStatic(f.getModifiers())) throw new NoSuchFieldException(owner.getName()+"."+name);
        f.setAccessible(true); return f;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,boolean isStatic,Class<?>... args)
            throws ReflectiveOperationException {
        Method selected=null;
        for (Method m:owner.getDeclaredMethods()) {
            if (m.getName().equals(name) && m.getReturnType()==result && Arrays.equals(m.getParameterTypes(),args)
                    && Modifier.isStatic(m.getModifiers())==isStatic) {
                if (selected!=null) throw new NoSuchMethodException("Ambiguous native method "+owner.getName()+"."+name);
                selected=m;
            }
        }
        if (selected==null) throw new NoSuchMethodException(owner.getName()+"."+name+" -> "+result.getName());
        selected.setAccessible(true); return selected;
    }
    private static void exact(Object value,Class<?> type) {
        if (value==null || value.getClass()!=type) throw new IllegalStateException("Unexpected native object "+type.getName());
    }
    private static Object invoke(Method method,Object receiver,Object... args) throws Throwable {
        try { return method.invoke(receiver,args); }
        catch (InvocationTargetException error) { throw error.getCause(); }
    }
}
