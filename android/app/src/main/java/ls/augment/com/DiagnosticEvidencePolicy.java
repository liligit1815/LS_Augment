package ls.augment.com;

/** Attribution is separate from feature success and never expires a saved credential. */
public final class DiagnosticEvidencePolicy {
    private DiagnosticEvidencePolicy() { }
    public static String classify(boolean valueMatches, String version, String currentVersion,
            int boot, int currentBoot, int pid, boolean ownerAlive,
            long observedElapsed, long nowElapsed, long receivedElapsed) {
        if (!valueMatches || version == null || version.isEmpty() || boot < 0
                || currentBoot < 0 || pid <= 0 || observedElapsed <= 0 || receivedElapsed <= 0)
            return "LEGACY_OR_UNVERIFIED";
        if (!version.equals(currentVersion) || boot != currentBoot || !ownerAlive
                || observedElapsed > nowElapsed || receivedElapsed > nowElapsed
                || observedElapsed > receivedElapsed)
            return "HISTORICAL";
        if (nowElapsed - observedElapsed > 60_000L) return "OLDER_OBSERVATION";
        return "CURRENT_PROCESS_OBSERVATION";
    }

    public static boolean currentProcessSnapshot(String version, String currentVersion,
            int pid, boolean ownerAlive, boolean moduleLoaded, long moduleLoadedElapsed,
            long nowElapsed, long receivedAt, long nowWall, int receivedBoot, int currentBoot) {
        return version != null && !version.isEmpty() && version.equals(currentVersion)
                && pid > 0 && ownerAlive && moduleLoaded
                && moduleLoadedElapsed > 0 && moduleLoadedElapsed <= nowElapsed
                && receivedBoot >= 0 && receivedBoot == currentBoot
                && receivedAt > 0 && receivedAt <= nowWall && nowWall - receivedAt < 60_000L;
    }
}
