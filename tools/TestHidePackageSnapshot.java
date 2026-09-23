package ls.augment.com;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

public final class TestHidePackageSnapshot {
    private static int checks;
    public static void main(String[] args) {
        Set<String> packages = new LinkedHashSet<>(Arrays.asList("com.example.one", "com.example.two"));
        String first = "LSA_BEGIN:com.example.one:0\n"
                + "    User 0: ceDataInode=123 installed=true hidden=false stopped=false\n"
                + "    User 999: installed=true hidden=true stopped=true\n"
                + "    User 12: installed=false hidden=true\nLSA_END:com.example.one\n";
        Map<String, HidePackageSnapshot.PackageState> data = HidePackageSnapshot.parse(first, packages);
        check(data.get("com.example.one").user(0) == HideBatchExecutor.State.VISIBLE, "owner visible");
        check(data.get("com.example.one").user(999) == HideBatchExecutor.State.HIDDEN, "other user hidden");
        check(data.get("com.example.one").user(12) == HideBatchExecutor.State.MISSING, "uninstalled wins over hidden");
        check(data.get("com.example.one").user(15) == HideBatchExecutor.State.MISSING, "absent user in a valid dump is missing");
        check(!data.containsKey("com.example.two"), "unreturned package not guessed");
        check(HidePackageSnapshot.parse(first.replace("LSA_END:com.example.one", ""), packages).isEmpty(),
                "truncated frame cannot establish state");
        check(HidePackageSnapshot.parse(first.replace(":0\n", ":1\n"), packages).get("com.example.one").user(0)
                == HideBatchExecutor.State.ERROR, "nonzero dumpsys rc fails closed");
        check(state("Permission Denial: can't dump package") == HideBatchExecutor.State.ERROR,
                "exit zero permission denial is not missing or visible");
        check(state("User 0: hidden=false") == HideBatchExecutor.State.ERROR, "missing installed field fails closed");
        check(state("User 0: installed=true") == HideBatchExecutor.State.ERROR, "missing hidden field fails closed");
        check(state("User 0: installed=true hidden=true\nUser 0: installed=true hidden=false")
                == HideBatchExecutor.State.ERROR, "duplicate user state is ambiguous");
        check(state("Unable to find package: com.example.one") == HideBatchExecutor.State.MISSING,
                "explicit nonexistent package is missing");
        check(state("Unable to find package: com.example.one\nUser 0: installed=true hidden=false")
                == HideBatchExecutor.State.ERROR, "contradictory dump fails closed");
        check(state("User 0: notinstalled=true hidden=false") == HideBatchExecutor.State.ERROR, "field names matched exactly");
        String command = HidePackageSnapshot.command(packages);
        check(command.split("/system/bin/dumpsys package", -1).length - 1 == 2,
                "one dump per package, not per selected Android user");
        // Actual NX809J Android 16 dumpsys rows captured in stage18 call 27.
        String oemPackageAndQueries = "    User 0: ceDataInode=362168 deDataInode=361847 installed=true hidden=false suspended=false distractionFlags=0 stopped=true notLaunched=true enabled=0 instant=false virtual=false quarantined=false\n    User 999: ceDataInode=362618 deDataInode=362468 installed=true hidden=false suspended=false distractionFlags=0 stopped=true notLaunched=true enabled=0 instant=false virtual=false quarantined=false\nQueries:\n    User 0:\n    User 999:\n";
        Map<String, HidePackageSnapshot.PackageState> oem = HidePackageSnapshot.parse(
                "LSA_BEGIN:com.example.one:0\n" + oemPackageAndQueries + "LSA_END:com.example.one\n", packages);
        check(oem.get("com.example.one").user(0) == HideBatchExecutor.State.VISIBLE,
                "query interaction heading cannot replace owner package state");
        check(oem.get("com.example.one").user(999) == HideBatchExecutor.State.VISIBLE,
                "query interaction heading cannot replace second-user package state");
        check(state("User 0:\nQueries:\nUser 0:") == HideBatchExecutor.State.ERROR,
                "empty package-state user still fails closed");
        check(state("User 0: hidden=false\nQueries:\nUser 0:") == HideBatchExecutor.State.ERROR,
                "query section cannot hide missing installed field");
        check(state("User 0: installed=true\nQueries:\nUser 0:") == HideBatchExecutor.State.ERROR,
                "query section cannot hide missing hidden field");
        check(state("User 0: installed=true hidden=false\nUser 0: installed=true hidden=true\nQueries:\nUser 0:")
                == HideBatchExecutor.State.ERROR, "duplicate package state still fails before Queries");
        check(state("Queries:\nUser 0:") == HideBatchExecutor.State.ERROR,
                "query headings alone establish no package state");
        check(state("User 0: installed=true hidden=false\n  Queries:\nUser 0:") == HideBatchExecutor.State.ERROR,
                "only the exact top-level Queries boundary is recognized");
        String frames = "LSA_BEGIN:com.example.one:0\nUser 0: installed=true hidden=false\nQueries:\nUser 0:\nLSA_END:com.example.one\n"
                + "LSA_BEGIN:com.example.two:0\nUser 0: installed=true hidden=true\nLSA_END:com.example.two\n";
        check(HidePackageSnapshot.parse(frames, packages).get("com.example.two").user(0)
                == HideBatchExecutor.State.HIDDEN, "query-section state resets for the next package frame");
        check(command.contains("|^Queries:|"), "command preserves the query-section boundary");
        check(!command.contains("dump=$(") && !command.contains("\"$dump\""), "large dumps never become one exec argument");
        String stream = "LSA_BEGIN:com.example.one:STREAM\nUser 0: installed=true hidden=false\nQueries:\nUser 0:\nLSA_DUMP_RC:0\nLSA_END:com.example.one\n";
        check(HidePackageSnapshot.parse(stream, packages).get("com.example.one").user(0)
                == HideBatchExecutor.State.VISIBLE, "stream completion after Queries accepted");
        check(HidePackageSnapshot.parse(stream.replace("LSA_DUMP_RC:0\n", ""), packages).get("com.example.one").user(0)
                == HideBatchExecutor.State.ERROR, "stream without exit status rejected");
        check(HidePackageSnapshot.parse(stream.replace("LSA_DUMP_RC:0", "LSA_DUMP_RC:1"), packages).get("com.example.one").user(0)
                == HideBatchExecutor.State.ERROR, "stream failure rejected despite visible row");
        check(HidePackageSnapshot.parse(stream.replace("LSA_DUMP_RC:0", "LSA_DUMP_RC:0\nLSA_DUMP_RC:0"), packages).get("com.example.one").user(0)
                == HideBatchExecutor.State.ERROR, "duplicate stream completion rejected");
        boolean rejected = false;
        try { HidePackageSnapshot.command(Set.of("com.example.app; id")); }
        catch (IllegalArgumentException expected) { rejected = true; }
        check(rejected, "shell input validated");
        System.out.println("Hide package snapshot checks: " + checks + " OK");
    }
    private static HideBatchExecutor.State state(String body) {
        return HidePackageSnapshot.parse("LSA_BEGIN:com.example.one:0\n" + body
                + "\nLSA_END:com.example.one\n", Set.of("com.example.one")).get("com.example.one").user(0);
    }
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
}
