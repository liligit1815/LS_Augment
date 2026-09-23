package ls.augment.com;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

public final class TestHideTargetCodec {
    private static int assertions;
    private static void check(boolean condition, String message) {
        assertions++;
        if (!condition) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        HideTargetCodec.Selection legacy = HideTargetCodec.parse("0:com.example.a;27:com.example.b");
        check(legacy.valid && legacy.entries.size() == 2, "legacy selection retained");
        for (HideTargetCodec.Entry e : legacy.entries) {
            check(!e.isBound() && e.userSerial == -1 && !e.confirmed, "legacy not auto-bound");
        }
        check(HideTargetCodec.encode(legacy.entries).equals(legacy.raw), "legacy stable round trip");
        HideTargetCodec.Entry owner = new HideTargetCodec.Entry(0, 0, "com.example.a", true);
        HideTargetCodec.Entry oldSpace = new HideTargetCodec.Entry(27, 42, "com.example.a", true);
        HideTargetCodec.Entry newSpace = new HideTargetCodec.Entry(27, 43, "com.example.a", true);
        check(owner.isBound() && owner.encode().equals("v3:0:0:com.example.a"), "user and serial zero valid");
        check(!oldSpace.equals(newSpace) && oldSpace.sameTarget(newSpace), "reused number is a different identity");
        check(new HashSet<>(Arrays.asList(oldSpace, newSpace)).size() == 2, "distinct identities retained");
        check(!oldSpace.equals(oldSpace.asPending()), "pending is not executable equality");
        check(oldSpace.asPending().userSerial == 42 && !oldSpace.asPending().isBound(), "import keeps evidence not authority");
        check(oldSpace.asPending().encode().equals("p3:27:42:com.example.a"), "pending preserves serial");
        check(oldSpace.asPending().asPending().equals(oldSpace.asPending()), "repeated import is idempotent");
        check(!oldSpace.sameTarget(owner), "same package in separate users stays separate");
        check(!oldSpace.sameTarget(new HideTargetCodec.Entry(27, 42, "com.example.b", true)), "different package stays separate");
        check(oldSpace.toString().equals("27:com.example.a"), "label does not become storage protocol");

        List<HideTargetCodec.Entry> mixed = Arrays.asList(newSpace, owner, oldSpace.asPending(),
                legacy.entries.get(1), newSpace);
        String encoded = HideTargetCodec.encode(mixed);
        HideTargetCodec.Selection decoded = HideTargetCodec.parse(encoded);
        check(decoded.valid && decoded.entries.size() == 4, "mixed pending and bound retained; exact duplicate deduped");
        check(new HashSet<>(decoded.entries).equals(new HashSet<>(mixed)), "all identity fields round trip");
        check(HideTargetCodec.encode(decoded.entries).equals(encoded), "stable canonical encoding");
        List<HideTargetCodec.Entry> reversed = new ArrayList<>(mixed);
        Collections.reverse(reversed);
        check(HideTargetCodec.encode(reversed).equals(encoded), "deterministic ordering");
        try { decoded.entries.clear(); throw new AssertionError("mutable parsed entries"); }
        catch (UnsupportedOperationException expected) { assertions++; }
        for (String newline : new String[]{"\n", "\r\n", "\r"}) {
            HideTargetCodec.Selection root = HideTargetCodec.parse(owner.encode() + newline + oldSpace.encode() + newline);
            check(root.valid && root.entries.size() == 2, "Root line ending " + newline.length());
            check(!HideTargetCodec.encode(root.entries).contains("\n"), "write canonical single line");
        }

        String[] bad = {"v4:27:42:com.example.a", "v3:27:com.example.a", "v3:27:-1:com.example.a",
                "v3:27:+1:com.example.a", "v3:027:1:com.example.a", "v3:27:01:com.example.a",
                "p3:27:-1:com.example.a", "v3:100000:1:com.example.a", "-1:com.example.a",
                "+0:com.example.a", "0:com..example.a", "0:com.example.a;", ";0:com.example.a",
                "0:com.example.a;;1:com.example.b", "\n", "0:com.example.a\n\n",
                "0:com.example.a;v9:1:2:com.example.b", "v3:1:9223372036854775808:com.example.a",
                "v3:2147483648:1:com.example.a", "v3:1:1:com.example.a:extra", "v3:1:1:",
                "0:com.example.a\u0000", "0:com.example.a$(id)", "0:com.example.a b", " 0:com.example.a"};
        for (String raw : bad) {
            HideTargetCodec.Selection invalid = HideTargetCodec.parse(raw);
            check(!invalid.valid, "reject " + raw);
            check(invalid.raw.equals(raw) && invalid.entries.isEmpty(), "retain whole invalid raw; no partial selection");
        }
        String oversized = "x".repeat(HideTargetCodec.MAX_LENGTH + 1);
        check(!HideTargetCodec.parse(oversized).valid && HideTargetCodec.parse(oversized).raw.equals(oversized), "retain oversized raw");
        check(HideTargetCodec.parse("").valid && HideTargetCodec.parse("").entries.isEmpty(), "genuine empty distinguishable");
        check(HideTargetCodec.parseEntry("v3:27:9223372036854775807:com.example.a").userSerial == Long.MAX_VALUE,
                "serial is long without narrowing");
        check(HideTargetCodec.parseEntry("0:com." + "a".repeat(253)) == null, "overlong package rejected");
        for (HideTargetCodec.Entry badEntry : Arrays.asList(
                new HideTargetCodec.Entry(0, -1, "com.example.a", true),
                new HideTargetCodec.Entry(0, -2, "com.example.a", false),
                new HideTargetCodec.Entry(-1, 2, "com.example.a", true),
                new HideTargetCodec.Entry(0, 2, "invalid", true))) {
            check(!badEntry.isValid() && !badEntry.isBound(), "invalid cannot authorize");
            try { HideTargetCodec.encode(Arrays.asList(owner, badEntry)); throw new AssertionError("partial serialization"); }
            catch (IllegalArgumentException expected) { assertions++; }
        }
        try { HideTargetCodec.encode(Arrays.asList(owner, null)); throw new AssertionError("null silently dropped"); }
        catch (IllegalArgumentException expected) { assertions++; }
        List<HideTargetCodec.Entry> tooMany = new ArrayList<>();
        for (int i = 0; i < 4000; i++) tooMany.add(new HideTargetCodec.Entry(27, 42, "com.example.app" + i, true));
        try { HideTargetCodec.encode(tooMany); throw new AssertionError("oversized output silently truncated"); }
        catch (IllegalArgumentException expected) { assertions++; }
        System.out.println("PASS HideTargetCodec " + assertions + " assertions; no Android/Root identity inference");
    }
}
