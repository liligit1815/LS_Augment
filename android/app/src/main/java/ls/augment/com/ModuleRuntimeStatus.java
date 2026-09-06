package ls.augment.com;

/** A past probe is not evidence that this process loaded the currently installed APK. */
public final class ModuleRuntimeStatus {
    private ModuleRuntimeStatus() { }

    public static boolean matches(String witness, String version, String currentPid) {
        if (witness == null || witness.isEmpty() || version == null || currentPid == null
                || !currentPid.trim().matches("[1-9][0-9]*")) return false;
        String observedVersion = null, observedPid = null, loaded = null;
        for (String field : witness.split("[|;]")) {
            int split = field.indexOf('=');
            if (split <= 0) continue;
            String key = field.substring(0, split), value = field.substring(split + 1);
            if ("version".equals(key)) observedVersion = value;
            else if ("pid".equals(key)) observedPid = value;
            else if ("loaderReady".equals(key)) loaded = value;
        }
        return version.equals(observedVersion) && currentPid.trim().equals(observedPid)
                && "1".equals(loaded);
    }

    public static boolean matches(String witness, String version, String currentPid, String bootId) {
        return bootId != null && bootId.matches("[a-f0-9-]{36}")
                && matches(witness, version, currentPid)
                && java.util.Arrays.asList(witness.split("[|;]")).contains("boot=" + bootId);
    }

    public static String bootId() {
        try (java.io.BufferedReader reader = new java.io.BufferedReader(
                new java.io.FileReader("/proc/sys/kernel/random/boot_id"))) {
            String value = reader.readLine();
            return value == null ? "" : value.trim();
        } catch (Exception unavailable) { return ""; }
    }

    public static String apiVersion(String witness) {
        if(witness!=null)for(String field:witness.split("[|;]"))
            if(field.matches("api=[1-9][0-9]*"))return field.substring(4);
        return "";
    }
}
