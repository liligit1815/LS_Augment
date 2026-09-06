package ls.augment.com.hook;

import java.util.Locale;

/** Pure policy for the narrowly scoped package-update signature bypass. */
final class SignatureMismatchInstallPolicy {
    static final int INSTALL_FAILED_UPDATE_INCOMPATIBLE = -7;
    static final int CAPABILITY_PERMISSION = 1;
    static final int CAPABILITY_ROLLBACK = 8;

    private SignatureMismatchInstallPolicy() { }

    static boolean shouldBypassUpdate(
            String packageName,
            boolean hasSharedUser,
            int errorCode,
            String message) {
        if (packageName == null || packageName.isEmpty()
                || "android".equals(packageName)
                || hasSharedUser
                || errorCode != INSTALL_FAILED_UPDATE_INCOMPATIBLE) {
            return false;
        }
        String normalized = message == null
                ? "" : message.toLowerCase(Locale.ROOT);
        return normalized.contains("signature");
    }

    static boolean shouldPreserveOwnPermissionDeclarations(
            String permissionOwnerPackage,
            String incomingPackage) {
        return incomingPackage != null
                && !incomingPackage.isEmpty()
                && !"android".equals(incomingPackage)
                && incomingPackage.equals(permissionOwnerPackage);
    }

    static boolean shouldBypassDirectCapability(
            String packageName,
            boolean hasSharedUser,
            int capability,
            boolean originalResult,
            int remainingChecks) {
        if (originalResult || remainingChecks <= 0
                || packageName == null || packageName.isEmpty()
                || "android".equals(packageName) || hasSharedUser) {
            return false;
        }
        return capability == CAPABILITY_PERMISSION || capability == CAPABILITY_ROLLBACK;
    }
}
