package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Read-only observations. A matching version never stands for behavioral acceptance. */
public final class CompatibilityReport {
    public enum State { MATCH, NEEDS_VERIFICATION, UNAVAILABLE, MISMATCH }

    public static final class Item {
        public final String title, summary, detail;
        public final State state;

        public Item(String title, State state, String summary, String detail) {
            this.title = clean(title);
            this.state = state;
            this.summary = clean(summary);
            this.detail = clean(detail);
        }
    }

    public final long checkedAt;
    public final List<Item> framework, system, software;

    public CompatibilityReport(long checkedAt, List<Item> framework, List<Item> system,
            List<Item> software) {
        this.checkedAt = checkedAt;
        this.framework = immutable(framework);
        this.system = immutable(system);
        this.software = immutable(software);
    }

    public static boolean systemMatches(String model, int sdk, String rom, String fingerprint,
            String expectedModel, int expectedSdk, String expectedRom, String expectedFingerprint) {
        return !clean(expectedModel).isEmpty() && expectedSdk > 0 && !clean(expectedRom).isEmpty()
                && !clean(expectedFingerprint).isEmpty()
                && clean(expectedModel).equals(clean(model)) && sdk == expectedSdk
                && clean(expectedRom).equals(clean(rom))
                && clean(expectedFingerprint).equals(clean(fingerprint));
    }

    public static Item application(String title, String packageName, boolean installed,
            boolean enabled, String version, long versionCode, String expectedVersion,
            long expectedCode, boolean systemMatches, String readError) {
        String identity = clean(packageName);
        boolean hasBaseline = !clean(expectedVersion).isEmpty() && expectedCode >= 0;
        String expected = hasBaseline
                ? "记录基准：" + expectedVersion + "（" + expectedCode + "）"
                : "记录基准：本版本未收录该应用的版本样本";
        if (!clean(readError).isEmpty()) return new Item(title, State.UNAVAILABLE,
                "读取失败 · 状态未知", identity + "\n" + readError + "\n" + expected);
        if (!installed) return new Item(title, State.UNAVAILABLE, "本机未找到此包",
                identity + "\n" + expected + "\n该包对应的功能暂不具备运行条件。");
        String current = "当前版本：" + (clean(version).isEmpty() ? "未提供版本名" : version)
                + "（" + versionCode + "）";
        if (!enabled) return new Item(title, State.UNAVAILABLE, "已安装 · 当前已停用",
                identity + "\n" + current + "\n" + expected);
        if (!hasBaseline) return new Item(title, State.NEEDS_VERIFICATION,
                "已安装 · 适配需要验证", identity + "\n" + current + "\n" + expected);
        boolean versionMatches = expectedVersion.equals(version) && expectedCode == versionCode;
        if (!versionMatches) return new Item(title, State.NEEDS_VERIFICATION,
                "版本不同 · 适配需要验证", identity + "\n" + current + "\n" + expected);
        return new Item(title, systemMatches ? State.MATCH : State.NEEDS_VERIFICATION,
                systemMatches ? "版本与基准一致 · 功能需实测" : "软件版本一致 · 系统需要验证",
                identity + "\n" + current + "\n" + expected);
    }

    private static String clean(String value) { return value == null ? "" : value.trim(); }

    private static List<Item> immutable(List<Item> values) {
        return Collections.unmodifiableList(new ArrayList<>(values));
    }
}
