import java.util.Locale;
import ls.augment.com.LauncherMemoryPresentation;

public final class TestLauncherMemoryPresentation {
    private static int checks;

    private static void expect(String wanted, String actual) {
        checks++;
        if (!wanted.equals(actual)) throw new AssertionError("Expected [" + wanted + "] but got [" + actual + "]");
    }

    public static void main(String[] args) {
        long gib = 1024L * 1024L * 1024L;
        String[][] expected = {
                {"可用 3.00 GB  已用 5.00 GB  总量 8.00 GB", "可用 3.00 GB  已用 5.00 GB", "可用 3.00 GB", "已用 5.00 GB", "总量 8.00 GB"},
                {"可用 3.00 GB (37.5%)\n已用 5.00 GB (62.5%)\n总量 8.00 GB", "可用 3.00 GB (37.5%)\n已用 5.00 GB (62.5%)", "可用 3.00 GB (37.5%)", "已用 5.00 GB (62.5%)", "总量 8.00 GB"}
        };
        Locale previous = Locale.getDefault();
        try {
            // Locale changes must not corrupt decimals or the configured line layout.
            Locale.setDefault(Locale.GERMANY);
            for (int style = 0; style < 2; style++)
                for (int content = 0; content < 5; content++)
                    expect(expected[style][content], LauncherMemoryPresentation.format(8 * gib, 3 * gib, style, content));
            expect("", LauncherMemoryPresentation.format(0, gib, 1, 0));
            expect("", LauncherMemoryPresentation.format(-1, 0, 0, 4));
            expect("可用 0.00 GB (0.0%)\n已用 8.00 GB (100.0%)", LauncherMemoryPresentation.format(8 * gib, -1, 1, 1));
            expect("可用 8.00 GB (100.0%)\n已用 0.00 GB (0.0%)", LauncherMemoryPresentation.format(8 * gib, 9 * gib, 1, 1));
            expect("总量 7.50 GB", LauncherMemoryPresentation.format(15 * gib / 2, gib, 0, 4));
            expect(expected[0][0], LauncherMemoryPresentation.format(8 * gib, 3 * gib, 99, 99));
            // Multiplying the physical byte count must never overflow percentage math.
            expect("已用 0.00 GB (0.0%)", LauncherMemoryPresentation.format(Long.MAX_VALUE, Long.MAX_VALUE, 1, 3));
        } finally { Locale.setDefault(previous); }
        System.out.println("PASS LauncherMemoryPresentation " + checks + " cases");
    }
}
