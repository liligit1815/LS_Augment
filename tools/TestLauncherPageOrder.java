package ls.augment.com.hook;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class TestLauncherPageOrder {
    private static List<Integer> ids(Integer... ids) { return Arrays.asList(ids); }
    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        List<Integer> saved = LauncherPageOrder.parse("7,2,30");
        require(LauncherPageOrder.merge(ids(2,7), saved, true).equals(ids(7,2,30)),
                "restart restores reordered pages and an empty page without changing stable IDs");
        require(LauncherPageOrder.merge(ids(2,7), saved, false).equals(ids(7,2)),
                "disabling empty pages does not resurrect a removed page");
        require(LauncherPageOrder.merge(ids(2,7,81), saved, true).equals(ids(7,2,30,81)),
                "native pages created for newly installed apps remain present");
        require(LauncherPageOrder.merge(ids(2,7,-201), saved, true).equals(ids(7,2,30,-201)),
                "a drag placeholder stays after restored real pages");
        require(LauncherPageOrder.encode(ids(7,7,-201,30,-200)).equals("7,30"),
                "neither duplicate IDs nor temporary blank pages are persisted");
        require(LauncherPageOrder.parse("7,broken,-201,2147483648,2,7").equals(ids(7,2)),
                "malformed persisted IDs cannot enter the workspace model");
        require(LauncherPageOrder.preserveEmpty(false, false, true),
                "an unverified boot default cannot erase saved empty pages");
        require(!LauncherPageOrder.preserveEmpty(true, false, true),
                "a verified off setting restores native cleanup");
        require(LauncherPageOrder.preserveEmpty(true, true, false),
                "enabling empty pages takes effect with no previous preference");
        List<Integer> before = new ArrayList<>(ids(0,4,9,16));
        List<Integer> moved = LauncherPageOrder.move(before, 4, 16);
        require(before.equals(ids(0,4,9,16)) && moved.equals(ids(0,9,16,4)),
                "a page move is proposed without mutating the committed order");
        require(LauncherPageOrder.selectedIndex(moved, 4, 0) == 3,
                "the currently viewed page follows its stable ID after moving");
        require(LauncherPageOrder.selectedIndex(moved, 9, 0) == 1,
                "a home page keeps its identity when another page moves across it");
        require(LauncherPageOrder.move(before, -201, 9).equals(before)
                        && LauncherPageOrder.move(before, 44, 9).equals(before)
                        && LauncherPageOrder.move(before, 4, 4).equals(before),
                "cancelled, stale, temporary, and same-page drags leave the order intact");
        require(LauncherPageOrder.selectedIndex(ids(0,9), 4, 5) == 1,
                "deleting the selected empty page falls back to an existing neighbor");
        System.out.println("Launcher page order checks passed");
    }
}
