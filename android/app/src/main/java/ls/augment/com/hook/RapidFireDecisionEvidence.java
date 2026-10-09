package ls.augment.com.hook;

/** Decision witnesses deliberately contain no token, session ID or device fingerprint. */
final class RapidFireDecisionEvidence {
    private RapidFireDecisionEvidence() { }

    static String tokenStatus(boolean present, boolean parsed, boolean identityReady,
            boolean valid, boolean currentIdentity) {
        if (!present) return "MISSING";
        if (!parsed) return "MALFORMED";
        if (!identityReady) return "IDENTITY_NOT_READY";
        if (!valid) return "ENVIRONMENT_MISMATCH";
        return currentIdentity ? "VALID_CURRENT" : "VALID_LEGACY_EQUIVALENT";
    }

    static String disabledReason(boolean master, boolean requested, String tokenStatus,
            boolean fused) {
        if (!master) return "GAME_MASTER_OFF";
        if (!requested) return "FEATURE_OFF";
        if (!tokenStatus.startsWith("VALID_")) return "TOKEN_" + tokenStatus;
        return fused ? "FUSED" : "NATIVE_UNAVAILABLE";
    }

    static String describe(String module, int pid, long time, String sessionState,
            boolean sessionActive, boolean sessionMatches, String tokenStatus,
            boolean effective, String reason, String nativeState) {
        String state = effective ? "ACTIVE" : reason.startsWith("TEST_") ? "TESTING"
                : reason.equals("NATIVE_UNAVAILABLE") ? "UNAVAILABLE" : "DISABLED";
        // Native status can include checksums and route details; only its state is needed here.
        String nativeSummary = nativeState == null ? "unknown" : nativeState.split("\\|", 2)[0];
        return "module=" + module + "|pid=" + pid + "|time=" + time + "|state=" + state
                + "|sessionState=" + sessionState + "|sessionActiveForTest=" + sessionActive
                + "|sessionMatchesEnvironment=" + sessionMatches + "|tokenStatus=" + tokenStatus
                + "|effectiveEnabled=" + effective + "|reason=" + reason
                + "|nativeState=" + nativeSummary;
    }
}
