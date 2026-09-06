package ls.augment.com.hook;

import android.content.Context;
import android.os.SystemClock;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Allows a differently signed APK to update the already installed package
 * with the same package name. Normal verification runs first and only the
 * specific UPDATE_INCOMPATIBLE signature failure is recovered.
 *
 * <p>Shared-user membership and cross-package signature permissions remain on
 * the platform implementation.</p>
 */
final class SignatureMismatchInstallHook {
    private static final String PACKAGE_MANAGER_UTILS =
            "com.android.server.pm.PackageManagerServiceUtils";
    private static final String PACKAGE_SETTING =
            "com.android.server.pm.PackageSetting";
    private static final String INSTALL_PACKAGE_HELPER =
            "com.android.server.pm.InstallPackageHelper";
    private static final String INSTALL_REQUEST =
            "com.android.server.pm.InstallRequest";
    private static final String PARSED_PACKAGE =
            "com.android.internal.pm.parsing.pkg.ParsedPackage";
    private static final String SIGNING_DETAILS =
            "android.content.pm.SigningDetails";
    private static final int DIRECT_SIGNATURE_CHECKS = 2;
    private static final long HIT_DIAGNOSTIC_INTERVAL_MS = 1000L;

    private static volatile long lastHitDiagnostic;
    private static volatile long lastHitLog;
    private static final ThreadLocal<InstallAttempt> CURRENT_INSTALL = new ThreadLocal<>();

    private SignatureMismatchInstallHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        try {
            Class<?> verifier = Class.forName(PACKAGE_MANAGER_UTILS, false, classLoader);
            for (Method method : verifier.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!"verifySignatures".equals(method.getName())
                        || method.getReturnType() != boolean.class
                        || parameters.length != 7
                        || !PACKAGE_SETTING.equals(parameters[0].getName())) {
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "signature_install.verify_signatures", true)
                        .intercept(chain -> interceptVerify(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                module.logFeatureInfo("SIGNATURE_INSTALL_VERIFY_HOOK "
                        + method.toGenericString());
            }

            Class<?> installer = Class.forName(INSTALL_PACKAGE_HELPER, false, classLoader);
            for (Method method : installer.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!"doesSignatureMatchForPermissions".equals(method.getName())
                        || method.getReturnType() != boolean.class
                        || parameters.length != 3
                        || parameters[0] != String.class
                        || !PARSED_PACKAGE.equals(parameters[1].getName())
                        || parameters[2] != int.class) {
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "signature_install.own_permission_declarations", true)
                        .intercept(chain -> interceptOwnPermissionDeclarations(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                module.logFeatureInfo("SIGNATURE_INSTALL_PERMISSION_HOOK "
                        + method.toGenericString());
            }

            for (Method method : installer.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!"preparePackage".equals(method.getName())
                        || method.getReturnType() != void.class
                        || parameters.length != 1
                        || !INSTALL_REQUEST.equals(parameters[0].getName())) {
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "signature_install.prepare_package", true)
                        .intercept(chain -> interceptPreparePackage(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                module.logFeatureInfo("SIGNATURE_INSTALL_PREPARE_HOOK "
                        + method.toGenericString());
            }

            Class<?> signingDetails = Class.forName(SIGNING_DETAILS, false, classLoader);
            for (Method method : signingDetails.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!"checkCapability".equals(method.getName())
                        || method.getReturnType() != boolean.class
                        || parameters.length != 2
                        || parameters[0] != signingDetails
                        || parameters[1] != int.class) {
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "signature_install.check_capability", true)
                        .intercept(chain -> interceptCheckCapability(module, chain));
                module.registerFeatureHook(handle);
                installed++;
                module.logFeatureInfo("SIGNATURE_INSTALL_CAPABILITY_HOOK "
                        + method.toGenericString());
            }

            FeatureSettings.diagnostic(systemContext(),
                    FeatureSettings.SIGNATURE_INSTALL_INSTALLED,
                    String.valueOf(installed));
            if (installed == 0) {
                FeatureSettings.diagnostic(systemContext(),
                        FeatureSettings.SIGNATURE_INSTALL_LAST_ERROR,
                        "no_supported_package_manager_method");
            }
        } catch (Throwable error) {
            module.logFeatureError("SIGNATURE_INSTALL_SETUP_FAILED", error);
            FeatureSettings.diagnostic(systemContext(),
                    FeatureSettings.SIGNATURE_INSTALL_LAST_ERROR,
                    error.getClass().getSimpleName() + ":" + safe(error.getMessage()));
        }
        return installed;
    }

    private static Object interceptVerify(AugmentModule module, Chain chain) throws Throwable {
        Context context = systemContext();
        if (!isEnabled(context)) return chain.proceed();

        String packageName = packageName(chain.getArg(0));
        InstallAttempt attempt = CURRENT_INSTALL.get();
        boolean hasSharedUser = chain.getArg(1) != null || hasSharedUser(chain.getArg(0));
        if (attempt != null && packageName != null) {
            attempt.packageName = packageName;
            attempt.hasSharedUser = hasSharedUser;
            attempt.directChecksRemaining = DIRECT_SIGNATURE_CHECKS;
            attempt.verifying = true;
        }
        try {
            return chain.proceed();
        } catch (Throwable error) {
            int errorCode = integerField(error, "error", Integer.MIN_VALUE);
            if (!SignatureMismatchInstallPolicy.shouldBypassUpdate(
                    packageName, hasSharedUser, errorCode, error.getMessage())) {
                throw error;
            }
            if (attempt != null) {
                attempt.packageName = packageName;
                attempt.hasSharedUser = hasSharedUser;
                attempt.directChecksRemaining = DIRECT_SIGNATURE_CHECKS;
            }
            reportHit(module, context, packageName, "verifySignatures");
            // verifySignatures returns whether legacy key-set data was
            // recovered. false means continue the update without that cleanup.
            return false;
        } finally {
            if (attempt != null) attempt.verifying = false;
        }
    }

    /**
     * Android 16 performs a second, inline signature check in
     * InstallPackageHelper.preparePackage() after verifySignatures(). Keep
     * the package identity on this thread so the capability hook can affect
     * only that single update attempt.
     */
    private static Object interceptPreparePackage(AugmentModule module, Chain chain)
            throws Throwable {
        InstallAttempt previous = CURRENT_INSTALL.get();
        InstallAttempt attempt = new InstallAttempt(
                packageNameFromInstallRequest(chain.getArg(0)));
        CURRENT_INSTALL.set(attempt);
        try {
            return chain.proceed();
        } finally {
            if (previous == null) CURRENT_INSTALL.remove();
            else CURRENT_INSTALL.set(previous);
        }
    }

    /**
     * Bypass only the two failed capability calls used by the inline update
     * gate. Calls made from verifySignatures itself are always left intact.
     */
    private static Object interceptCheckCapability(AugmentModule module, Chain chain)
            throws Throwable {
        Object result = chain.proceed();
        if (Boolean.TRUE.equals(result)) return result;

        InstallAttempt attempt = CURRENT_INSTALL.get();
        if (attempt == null || attempt.verifying || !isEnabled(systemContext())) {
            return result;
        }

        Object capabilityArg = chain.getArg(1);
        int capability = capabilityArg instanceof Integer ? (Integer) capabilityArg : -1;
        if (!SignatureMismatchInstallPolicy.shouldBypassDirectCapability(
                attempt.packageName, attempt.hasSharedUser, capability,
                Boolean.TRUE.equals(result), attempt.directChecksRemaining)) {
            return result;
        }

        attempt.directChecksRemaining--;
        reportHit(module, systemContext(), attempt.packageName,
                "preparePackage.checkCapability");
        return true;
    }

    private static Object interceptOwnPermissionDeclarations(
            AugmentModule module, Chain chain) throws Throwable {
        Object result = chain.proceed();
        if (Boolean.TRUE.equals(result)) return result;

        Context context = systemContext();
        if (!isEnabled(context)) return result;
        String ownerPackage = chain.getArg(0) instanceof String
                ? (String) chain.getArg(0) : null;
        String incomingPackage = packageName(chain.getArg(1));
        if (!SignatureMismatchInstallPolicy.shouldPreserveOwnPermissionDeclarations(
                ownerPackage, incomingPackage)) {
            return result;
        }
        reportHit(module, context, incomingPackage, "ownPermissionDeclarations");
        return true;
    }

    private static void reportHit(
            AugmentModule module, Context context, String packageName, String method) {
        FeatureSettings.diagnostic(
                context, FeatureSettings.SIGNATURE_INSTALL_ACTIVE, "1");
        long now = SystemClock.uptimeMillis();
        if (now - lastHitDiagnostic >= HIT_DIAGNOSTIC_INTERVAL_MS) {
            lastHitDiagnostic = now;
            FeatureSettings.diagnostic(context,
                    FeatureSettings.SIGNATURE_INSTALL_LAST_HIT,
                    packageName + "|" + method + "|" + System.currentTimeMillis());
        }
        if (now - lastHitLog >= 5000L) {
            lastHitLog = now;
            module.logFeatureInfo("SIGNATURE_INSTALL_HIT package="
                    + packageName + " method=" + method);
        }
    }

    private static boolean isEnabled(Context context) {
        if (context == null) return false;
        // Runtime configuration is consumed from one checksummed snapshot;
        // never combine a legacy per-key Global value with provider data.
        return FeatureSettings.enabled(
                context, FeatureSettings.ALLOW_SIGNATURE_MISMATCH, false);
    }

    private static String packageName(Object owner) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Method method = type.getDeclaredMethod("getPackageName");
                method.setAccessible(true);
                Object value = method.invoke(owner);
                return value instanceof String ? (String) value : null;
            } catch (NoSuchMethodException ignored) {
                // Continue through PackageSetting / ParsedPackage hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static String packageNameFromInstallRequest(Object request) {
        if (request == null) return null;
        String value = packageName(FeatureSettings.field(request, "mParsedPackage"));
        if (value == null) value = packageName(FeatureSettings.field(request, "mPackageLite"));
        if (value == null) value = packageName(FeatureSettings.field(request, "mPkg"));
        if (value == null) value = stringField(request, "mName");
        if (value == null) value = stringField(request, "mExistingPackageName");
        return value;
    }

    private static String stringField(Object owner, String name) {
        Object value = FeatureSettings.field(owner, name);
        return value instanceof String && !((String) value).isEmpty()
                ? (String) value : null;
    }

    private static boolean hasSharedUser(Object packageSetting) {
        if (packageSetting == null) return false;
        try {
            Method method = packageSetting.getClass().getMethod("hasSharedUser");
            method.setAccessible(true);
            return Boolean.TRUE.equals(method.invoke(packageSetting));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isEligiblePackage(String packageName) {
        return packageName != null && !packageName.isEmpty()
                && !"android".equals(packageName);
    }

    private static int integerField(Object owner, String name, int fallback) {
        if (owner == null) return fallback;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.getInt(owner);
            } catch (NoSuchFieldException ignored) {
                // Continue through PackageManagerException hierarchy.
            } catch (Throwable ignored) {
                return fallback;
            }
        }
        return fallback;
    }

    private static Context systemContext() {
        Context context = FeatureSettings.from(null);
        if (context != null) return context;
        try {
            Class<?> activityThread = Class.forName(
                    "android.app.ActivityThread", false,
                    SignatureMismatchInstallHook.class.getClassLoader());
            Method current = activityThread.getDeclaredMethod("currentActivityThread");
            current.setAccessible(true);
            Object thread = current.invoke(null);
            if (thread == null) return null;
            Method system = activityThread.getDeclaredMethod("getSystemContext");
            system.setAccessible(true);
            Object value = system.invoke(thread);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String safe(String value) {
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ');
    }

    private static final class InstallAttempt {
        String packageName;
        boolean hasSharedUser;
        boolean verifying;
        int directChecksRemaining;

        InstallAttempt(String packageName) {
            this.packageName = packageName;
            this.directChecksRemaining = isEligiblePackage(packageName)
                    ? DIRECT_SIGNATURE_CHECKS : 0;
        }
    }
}
