package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static ls.augment.com.CompatibilityReport.State.MATCH;
import static ls.augment.com.CompatibilityReport.State.NEEDS_VERIFICATION;
import static ls.augment.com.CompatibilityReport.State.UNAVAILABLE;

/** JVM coverage of report truth rules, not a simulation of the Android framework Binder. */
public final class TestCompatibilityReport {
    private static final String MODEL = "NX809J";
    private static final String ROM = "RedMagicOS11.5.7MR1";
    private static final String FINGERPRINT = "recorded-build-fingerprint";
    private static final String VERSION = "module-test20284";
    private static final String BOOT = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee";
    private static int checks;

    public static void main(String[] args) {
        systemIdentity();
        applicationIdentity();
        immutableIndependentResults();
        runtimeEvidence();
        System.out.println("PASS CompatibilityReport: " + checks
                + " checks for system/app identity, unavailable evidence, immutable results and runtime witness validation");
    }

    private static void systemIdentity() {
        require(system(MODEL, 36, ROM, FINGERPRINT), "complete recorded system identity matches");
        require(!system("NX999J", 36, ROM, FINGERPRINT), "another model needs verification");
        require(!system(MODEL, 35, ROM, FINGERPRINT), "another Android API needs verification");
        require(!system(MODEL, 36, "RedMagicOS11.5.7MR2", FINGERPRINT), "MR2 must not reuse MR1 acceptance");
        require(!system(MODEL, 36, ROM, "another-build"), "same model and ROM label do not hide a changed build");
        require(!system(null, 36, ROM, FINGERPRINT), "unknown actual model does not match");
        require(!system(MODEL, 36, null, FINGERPRINT), "unknown actual ROM does not match");
        require(!system(MODEL, 36, ROM, null), "unknown actual fingerprint does not match");
        require(!CompatibilityReport.systemMatches(MODEL, 36, ROM, FINGERPRINT,
                "", 36, ROM, FINGERPRINT), "missing baseline model stays unknown");
        require(!CompatibilityReport.systemMatches(MODEL, 36, ROM, FINGERPRINT,
                MODEL, -1, ROM, FINGERPRINT), "missing baseline Android API stays unknown");
        require(!CompatibilityReport.systemMatches(MODEL, 36, ROM, FINGERPRINT,
                MODEL, 36, "", FINGERPRINT), "missing baseline ROM stays unknown");
        require(!CompatibilityReport.systemMatches(MODEL, 36, ROM, FINGERPRINT,
                MODEL, 36, ROM, ""), "missing baseline fingerprint stays unknown");
        require(!CompatibilityReport.systemMatches("", -1, "", "", "", -1, "", ""),
                "two missing identities must never become a match");
    }

    private static boolean system(String model, int sdk, String rom, String fingerprint) {
        return CompatibilityReport.systemMatches(model, sdk, rom, fingerprint,
                MODEL, 36, ROM, FINGERPRINT);
    }

    private static void applicationIdentity() {
        CompatibilityReport.Item matched = app(true, true, "v1", 42, "v1", 42, true, "");
        expect(MATCH, matched, "installed and enabled with both version fields and system identity matching");
        require(matched.summary.contains("需实测"), "matching metadata must still distinguish behavioral acceptance");
        require(matched.detail.contains("sample.package") && matched.detail.contains("v1")
                && matched.detail.contains("42"), "report preserves package and observed version");
        expect(NEEDS_VERIFICATION, app(true, true, "v2", 42, "v1", 42, true, ""),
                "same code with a changed version name needs verification");
        expect(NEEDS_VERIFICATION, app(true, true, "v1", 43, "v1", 42, true, ""),
                "same version name with a changed code needs verification");
        expect(NEEDS_VERIFICATION, app(true, true, "v1", 42, "v1", 42, false, ""),
                "an application match cannot promote an unknown system");
        expect(NEEDS_VERIFICATION, app(true, true, "v1", 42, "", -1, true, ""),
                "installation alone is not a recorded baseline");
        expect(NEEDS_VERIFICATION, app(true, true, "v1", 42, null, 42, true, ""),
                "partial baseline without version name stays unknown");
        expect(NEEDS_VERIFICATION, app(true, true, "v1", 42, "v1", -1, true, ""),
                "partial baseline without version code stays unknown");
        expect(NEEDS_VERIFICATION, app(true, true, null, 42, "v1", 42, true, ""),
                "missing installed version name is not a match");
        expect(NEEDS_VERIFICATION, app(true, true, "", -1, "", -1, true, ""),
                "identical unknown version fields cannot produce a match");
        expect(UNAVAILABLE, app(false, false, "", -1, "v1", 42, true, ""), "missing package is unavailable");
        expect(UNAVAILABLE, app(false, true, "v1", 42, "v1", 42, true, ""),
                "metadata left from an earlier read cannot override current absence");
        CompatibilityReport.Item disabled = app(true, false, "v1", 42, "v1", 42, true, "");
        expect(UNAVAILABLE, disabled, "a disabled application is not ready even when versions match");
        require(disabled.summary.contains("停用"), "disabled status is distinguishable from absence");
        CompatibilityReport.Item failed = app(true, true, "v1", 42, "v1", 42, true, "read failed");
        expect(UNAVAILABLE, failed, "read failure overrides apparently matching partial observations");
        require(failed.detail.contains("read failed"), "read error remains reviewable");
        expect(UNAVAILABLE, app(false, false, "", -1, "v1", 42, true, "read failed"),
                "failed read must not be presented as proven absence");
        require(app(false, false, "", -1, "v1", 42, true, "read failed").summary.contains("未知"),
                "read failure explicitly remains unknown");
    }

    private static CompatibilityReport.Item app(boolean installed, boolean enabled, String version,
            long code, String expectedVersion, long expectedCode, boolean systemMatches, String error) {
        return CompatibilityReport.application("Sample", "sample.package", installed, enabled,
                version, code, expectedVersion, expectedCode, systemMatches, error);
    }

    private static void immutableIndependentResults() {
        CompatibilityReport.Item connected = new CompatibilityReport.Item("框架连接", MATCH,
                "已连接", "Framework sample 1.2.3 (123)");
        CompatibilityReport.Item unknownApi = new CompatibilityReport.Item("框架 API", UNAVAILABLE,
                "API未知", "");
        CompatibilityReport.Item unknownLoad = new CompatibilityReport.Item("当前模块加载", UNAVAILABLE,
                "尚无法确认", "");
        List<CompatibilityReport.Item> framework = new ArrayList<>(Arrays.asList(connected, unknownApi, unknownLoad));
        List<CompatibilityReport.Item> system = new ArrayList<>(Arrays.asList(
                new CompatibilityReport.Item("设备", NEEDS_VERIFICATION, "需要验证", "unknown model")));
        List<CompatibilityReport.Item> software = new ArrayList<>(Arrays.asList(
                app(true, true, "v1", 42, "v1", 42, false, "")));
        CompatibilityReport report = new CompatibilityReport(123456789L, framework, system, software);
        framework.clear(); system.clear(); software.clear();
        require(report.checkedAt == 123456789L, "report preserves its observation time");
        require(report.framework.size() == 3 && report.system.size() == 1 && report.software.size() == 1,
                "later refresh buffers cannot rewrite an already displayed report");
        require(report.framework.get(0).detail.equals("Framework sample 1.2.3 (123)"),
                "framework name/version observation is preserved without alteration");
        require(report.framework.get(1).state == UNAVAILABLE && report.framework.get(2).state == UNAVAILABLE,
                "connected framework must not promote unknown API or unknown current loading");
        require(report.system.get(0).state == NEEDS_VERIFICATION && report.software.get(0).state == NEEDS_VERIFICATION,
                "framework connection must not promote unrelated system or software results");
        immutable(report.framework, "framework"); immutable(report.system, "system"); immutable(report.software, "software");
    }

    private static void runtimeEvidence() {
        // This tests the existing pure witness validator. ModuleHelpActivity's optional
        // public running-target query requires separate Android integration coverage.
        String witness = "version=" + VERSION + "|api=102|pid=457|boot=" + BOOT + "|loaderReady=1";
        require(ModuleRuntimeStatus.matches(witness, VERSION, "457", BOOT), "fresh exact process witness accepted");
        require(!ModuleRuntimeStatus.matches(witness, "module-test20285", "457", BOOT), "old module version rejected");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "458", BOOT), "previous process rejected");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "457", "ffffffff-bbbb-cccc-dddd-eeeeeeeeeeee"),
                "PID reused after a reboot cannot reuse a prior boot witness");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "0", BOOT), "invalid current PID rejected");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "457 458", BOOT), "ambiguous current PID rejected");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "457", null), "unknown boot rejected");
        require(!ModuleRuntimeStatus.matches(witness, VERSION, "457", "invalid"), "malformed boot rejected");
        require(!ModuleRuntimeStatus.matches(null, VERSION, "457", BOOT), "missing witness rejected");
        require(!ModuleRuntimeStatus.matches(witness.replace("loaderReady=1", "loaderReady=0"), VERSION, "457", BOOT),
                "module presence without a ready loader rejected");
        require(!ModuleRuntimeStatus.matches("version=" + VERSION + "|api=102|framework=sample|pid=457|boot=" + BOOT,
                VERSION, "457", BOOT), "framework identity and API alone are not loaded-module evidence");
        require(ModuleRuntimeStatus.apiVersion(witness).equals("102"), "actual witness API preserved");
        require(ModuleRuntimeStatus.apiVersion("api=101").equals("101"), "older observed API is never upgraded to the requirement");
        for (String value : new String[]{null, "", "framework=sample", "api=", "api=0", "api=-1", "api=unknown"}) {
            require(ModuleRuntimeStatus.apiVersion(value).isEmpty(), "missing/malformed API stays unknown: " + value);
        }
        require(ModuleRuntimeStatus.apiVersion("framework=sample;api=103;pid=457").equals("103"),
                "semicolon witness format preserves actual API");
    }

    private static void immutable(List<CompatibilityReport.Item> values, String label) {
        try { values.clear(); throw new AssertionError(label + " results must be immutable"); }
        catch (UnsupportedOperationException expected) { checks++; }
    }
    private static void expect(CompatibilityReport.State expected, CompatibilityReport.Item actual, String message) {
        require(actual.state == expected, message + ": " + actual.state);
    }
    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
        checks++;
    }
}
