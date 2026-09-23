package ls.augment.com;

import android.os.Binder;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Objects;
import io.github.libxposed.api.XposedInterface.ExceptionMode;
import io.github.libxposed.api.XposedInterface.Hooker;

/** Fixed-OEM command adapter candidate. No hook is installed by this class. */
final class RootCommandEntry {
    @FunctionalInterface interface Original { Object proceed() throws Throwable; }
    private final Class<?> shellClass,ipmClass,pmsClass;
    private final Field shellIpm,ipmPms,basePms;
    private final Method commandMethod,permission,nextArg,outWriter;
    private final Object boundIpm,boundPms;
    private final HideRootServer server;
    private final java.util.function.Supplier<String> observationDiagnostic;

    /** Supply the same process-lifetime server and representative native owner used by the engine. */
    RootCommandEntry(ClassLoader loader,Object representativeShell,HideRootServer server)
            throws ReflectiveOperationException {
        this(loader,representativeShell,server,null);
    }
    RootCommandEntry(ClassLoader loader,Object representativeShell,HideRootServer server,
            java.util.function.Supplier<String> observationDiagnostic) throws ReflectiveOperationException {
        this.server=Objects.requireNonNull(server);
        this.observationDiagnostic=observationDiagnostic;
        shellClass=type(loader,"com.android.server.pm.PackageManagerShellCommand");
        ipmClass=type(loader,"com.android.server.pm.PackageManagerService$IPackageManagerImpl");
        pmsClass=type(loader,"com.android.server.pm.PackageManagerService");
        Class<?> ipmBase=type(loader,"com.android.server.pm.IPackageManagerBase");
        Class<?> stub=type(loader,"android.content.pm.IPackageManager$Stub");
        Class<?> shellBase=type(loader,"android.os.ShellCommand");
        Class<?> basic=type(loader,"com.android.modules.utils.BasicShellCommandHandler");
        if (shellClass.getSuperclass()!=shellBase || shellBase.getSuperclass()!=basic
                || ipmClass.getSuperclass()!=ipmBase || ipmBase.getSuperclass()!=stub)
            throw new NoSuchMethodException("Unexpected fixed-OEM shell hierarchy");
        shellIpm=field(shellClass,"mInterface",type(loader,"android.content.pm.IPackageManager"));
        ipmPms=field(ipmClass,"this$0",pmsClass);
        basePms=field(ipmBase,"mService",pmsClass);
        commandMethod=method(shellClass,"onCommand",int.class,String.class);
        permission=method(stub,"setApplicationHiddenSettingAsUser_enforcePermission",void.class);
        if (!Modifier.isProtected(permission.getModifiers()))
            throw new NoSuchMethodException("Unexpected permission helper visibility");
        nextArg=method(basic,"getNextArg",String.class);
        outWriter=method(basic,"getOutPrintWriter",PrintWriter.class);
        exact(representativeShell,shellClass);
        boundIpm=shellIpm.get(representativeShell); exact(boundIpm,ipmClass);
        boundPms=ipmPms.get(boundIpm); exact(boundPms,pmsClass);
        if (basePms.get(boundIpm)!=boundPms) throw new IllegalStateException("IPM owner mismatch");
    }

    Method targetMethod() { return commandMethod; }
    static ExceptionMode requiredMode() { return ExceptionMode.PASSTHROUGH; }
    Hooker callback() {
        return chain -> dispatch(chain.getThisObject(),chain.getArg(0),chain::proceed);
    }

    Object dispatch(Object shell,Object command,Original original) throws Throwable {
        // In particular, preserve the very same Throwable from every ordinary command.
        if (!HideRootProtocol.COMMAND.equals(command)) return Objects.requireNonNull(original).proceed();
        String failureCode="ENTRY_FAILED";
        int failureExit=75;
        boolean publishing=false;
        try {
            int uid=Binder.getCallingUid(); // Full original Binder identity, before any dispatch/clear.
            if (uid!=0) return diagnostic(shell,"ROOT_REQUIRED",77);
            exact(shell,shellClass);
            Object ipm=shellIpm.get(shell); exact(ipm,ipmClass);
            if (ipm!=boundIpm || ipmPms.get(ipm)!=boundPms || basePms.get(ipm)!=boundPms)
                throw new IllegalStateException("Foreign native command owner");
            failureCode="PERMISSION_REJECTED"; failureExit=77;
            invoke(permission,ipm); // Original MANAGE_USERS helper on the original Binder thread.
            failureCode="INVALID_REQUEST"; failureExit=75;
            ArrayList<String> arguments=new ArrayList<>();
            arguments.add(HideRootProtocol.COMMAND);
            // Each explicitly versioned form retains exactly one bounded trailing lookahead.
            int remaining=5;
            for (int index=0;index<=remaining;index++) {
                String value=(String)invoke(nextArg,shell);
                if (value==null) break;
                if(index==0 && ("RESTORE".equals(value)||"RESTORE_STATUS".equals(value)))remaining=6;
                if(index==0 && "PREPARE_RECOVERY".equals(value))remaining=6;
                if(index==0 && ("RECOVER".equals(value)||"RECOVERY_STATUS".equals(value)))remaining=10;
                if (index==remaining) throw new IllegalArgumentException("Extra argument");
                arguments.add(value);
            }
            // Read-only, fixed diagnostic of this same bound runtime. It passes
            // every Root/native-owner/permission check above, never reserves a
            // transaction, and accepts no target, path, or additional argument.
            if(arguments.size()==2 && "OBSERVATION".equals(arguments.get(1)) && observationDiagnostic!=null) {
                String report=Objects.requireNonNull(observationDiagnostic.get());
                if(report.isEmpty() || report.length()>4096)throw new IllegalStateException("Observation report length");
                for(int index=0;index<report.length();index++) {
                    char c=report.charAt(index);
                    if(c!='\n' && (c<32 || c>126))throw new IllegalStateException("Observation report framing");
                }
                String encoded=report.stripTrailing();
                if(encoded.isEmpty() || encoded.length()+1>4096)
                    throw new IllegalStateException("Observation wire report length");
                publishing=true;
                return write(shell,encoded,0);
            }
            HideRootProtocol.Reply reply=server.handle(uid,arguments.toArray(new String[0]));
            String encoded=reply.encode();
            if (encoded.length()==0 || encoded.length()+1>reply.request.maxBytes())
                throw new IllegalStateException("Reply length");
            for (int index=0;index<encoded.length();index++)
                if (encoded.charAt(index)<33 || encoded.charAt(index)>126)
                    throw new IllegalStateException("Reply framing");
            publishing=true;
            return write(shell,encoded,reply.exitCode());
        } catch (Throwable failure) {
            // A matched command is always consumed. No ordinary/numeric-command rescue path.
            return publishing ? 74 : diagnostic(shell,failureCode,failureExit);
        }
    }

    private int diagnostic(Object shell,String code,int exit) {
        try { exact(shell,shellClass); return write(shell,"LSAUTX_ERROR|"+code,exit); }
        catch (Throwable unavailableOutput) { return 74; }
    }
    private int write(Object shell,String line,int exit) throws Throwable {
        Object raw=invoke(outWriter,shell);
        if (!(raw instanceof PrintWriter)) throw new IllegalStateException("Missing command output");
        PrintWriter writer=(PrintWriter)raw;
        writer.print(line); writer.print('\n'); writer.flush();
        return writer.checkError() ? 74 : exit;
    }
    private static Class<?> type(ClassLoader loader,String name) throws ClassNotFoundException {
        return Class.forName(name,false,loader);
    }
    private static Field field(Class<?> owner,String name,Class<?> type) throws ReflectiveOperationException {
        Field found=owner.getDeclaredField(name);
        int modifiers=found.getModifiers();
        if (found.getType()!=type || Modifier.isStatic(modifiers) || !Modifier.isFinal(modifiers))
            throw new NoSuchFieldException(owner.getName()+"."+name);
        found.setAccessible(true); return found;
    }
    private static Method method(Class<?> owner,String name,Class<?> result,Class<?>...args)
            throws ReflectiveOperationException {
        Method found=owner.getDeclaredMethod(name,args);
        if (found.getReturnType()!=result || Modifier.isStatic(found.getModifiers()))
            throw new NoSuchMethodException(owner.getName()+"."+name);
        found.setAccessible(true); return found;
    }
    private static void exact(Object value,Class<?> type) {
        if (value==null || value.getClass()!=type) throw new IllegalStateException("Unexpected native object");
    }
    private static Object invoke(Method method,Object receiver,Object...args) throws Throwable {
        try { return method.invoke(receiver,args); }
        catch (InvocationTargetException failure) { throw failure.getCause(); }
    }
}
