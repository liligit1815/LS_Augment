package ls.augment.com.hook;

public final class TestSignatureMismatchInstallPolicy {
    public static void main(String[] args) {
        assertTrue("ordinary mismatch",
                SignatureMismatchInstallPolicy.shouldBypassUpdate(
                        "com.example.app", false, -7,
                        "Existing package signatures do not match newer version"));
        assertFalse("matching path has no error",
                SignatureMismatchInstallPolicy.shouldBypassUpdate(
                        "com.example.app", false, 0, ""));
        assertFalse("shared UID remains protected",
                SignatureMismatchInstallPolicy.shouldBypassUpdate(
                        "com.example.shared", true, -7, "signature mismatch"));
        assertFalse("framework package remains protected",
                SignatureMismatchInstallPolicy.shouldBypassUpdate(
                        "android", false, -7, "signature mismatch"));
        assertFalse("non-signature update error remains protected",
                SignatureMismatchInstallPolicy.shouldBypassUpdate(
                        "com.example.app", false, -7, "upgrade key set mismatch"));
        assertTrue("own permission declaration",
                SignatureMismatchInstallPolicy.shouldPreserveOwnPermissionDeclarations(
                        "com.example.app", "com.example.app"));
        assertFalse("foreign permission owner",
                SignatureMismatchInstallPolicy.shouldPreserveOwnPermissionDeclarations(
                        "com.vendor.owner", "com.example.app"));
        assertTrue("inline capability mismatch",
                SignatureMismatchInstallPolicy.shouldBypassDirectCapability(
                        "com.example.app", false, 1, false, 2));
        assertTrue("inline rollback capability mismatch",
                SignatureMismatchInstallPolicy.shouldBypassDirectCapability(
                        "com.example.app", false, 8, false, 1));
        assertFalse("inline capability shared UID remains protected",
                SignatureMismatchInstallPolicy.shouldBypassDirectCapability(
                        "com.example.shared", true, 1, false, 2));
        assertFalse("inline capability matching result remains unchanged",
                SignatureMismatchInstallPolicy.shouldBypassDirectCapability(
                        "com.example.app", false, 1, true, 2));
        System.out.println("PASS TestSignatureMismatchInstallPolicy");
    }

    private static void assertTrue(String name, boolean value) {
        if (!value) throw new AssertionError(name);
    }

    private static void assertFalse(String name, boolean value) {
        if (value) throw new AssertionError(name);
    }
}
