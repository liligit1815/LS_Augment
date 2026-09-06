package ls.augment.com;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;

public final class TestRapidFireNativeLayout {
    public static void main(String[] args) {
        byte[] code = code();
        RapidFireNativeLayout.Layout layout = RapidFireNativeLayout.inspectCode(code);
        check(layout != null && layout.firstKey == 137 && layout.secondKey == 138
                && layout.firstCount == 0x60 && layout.firstDown == 0x50 && layout.secondUp == 0x5c,
                "derive actual field and key relationships");
        byte[] elf = elf(code);
        check(RapidFireNativeLayout.inspectElf(elf) != null, "valid executable ELF");
        elf[0x80] = 93;
        check(RapidFireNativeLayout.inspectElf(elf) != null, "unknown whole-file hash must be testable");
        ByteBuffer changed = ByteBuffer.wrap(code.clone()).order(ByteOrder.LITTLE_ENDIAN);
        for (int index : new int[]{9, 19}) changed.putInt(index * 4, changed.getInt(index * 4) + (0x80 / 4 << 10));
        for (int index : new int[]{57, 58, 70, 71}) changed.putInt(index * 4, changed.getInt(index * 4) + (0x80 << 5));
        changed.putInt(7 * 4, changed.getInt(7 * 4) + (20 << 10));
        changed.putInt(4 * 4, changed.getInt(4 * 4) + (20 << 10));
        layout = RapidFireNativeLayout.inspectCode(changed.array());
        check(layout != null && layout.firstCount == 0xe0 && layout.firstDown == 0xd0
                && layout.firstKey == 157, "changed fields and input codes derived without old offsets");
        changed.putInt(57 * 4, changed.getInt(57 * 4) - (4 << 5));
        check(RapidFireNativeLayout.inspectCode(changed.array()) == null, "overlapping fields rejected");
        for (int index : new int[]{6, 8, 18, 28, 37, 46, 59, 80, 81, 87, 89}) {
            byte[] mutation = code.clone(); mutation[index * 4] ^= 16;
            check(RapidFireNativeLayout.inspectCode(mutation) == null, "changed control flow/store rejected " + index);
        }
        byte[] bti = new byte[code.length + 4];
        ByteBuffer.wrap(bti).order(ByteOrder.LITTLE_ENDIAN).putInt(0xd503245f).put(code);
        check(RapidFireNativeLayout.inspectCode(bti) != null, "BTI landing pad accepted");
        ByteBuffer malformed = ByteBuffer.wrap(elf.clone()).order(ByteOrder.LITTLE_ENDIAN);
        malformed.putLong(40, Long.MAX_VALUE);
        check(RapidFireNativeLayout.inspectElf(malformed.array()) == null, "overflowing ELF section table rejected");
        malformed = ByteBuffer.wrap(elf.clone()).order(ByteOrder.LITTLE_ENDIAN);
        malformed.putLong(0x548, 0);
        check(RapidFireNativeLayout.inspectElf(malformed.array()) == null, "nonexecutable function rejected");
        for (int length = 0; length < 128; length++) check(RapidFireNativeLayout.inspectElf(new byte[length]) == null, "truncated ELF");
        if (args.length > 0) check(RapidFireNativeLayout.inspectFile(new java.io.File(args[0])) != null, "connected device ELF");
        System.out.println("PASS TestRapidFireNativeLayout");
    }

    private static byte[] code() {
        ByteBuffer bytes = ByteBuffer.allocate(RapidFireNativeLayout.PATTERN.length * 4).order(ByteOrder.LITTLE_ENDIAN);
        for (int word : RapidFireNativeLayout.PATTERN) bytes.putInt(word);
        return bytes.array();
    }
    private static byte[] elf(byte[] code) {
        ByteBuffer b = ByteBuffer.allocate(0x600).order(ByteOrder.LITTLE_ENDIAN);
        b.putInt(0, 0x464c457f); b.put(4, (byte) 2); b.put(5, (byte) 1);
        b.putShort(16, (short) 3); b.putShort(18, (short) 183);
        b.putLong(40, 0x500); b.putShort(58, (short) 64); b.putShort(60, (short) 4);
        b.position(0x100); b.put(code);
        b.position(0x301); b.put(RapidFireNativeLayout.SYMBOL.getBytes(StandardCharsets.US_ASCII));
        b.putInt(0x418, 1); b.put(0x41c, (byte) 0x12); b.putShort(0x41e, (short) 1);
        b.putLong(0x420, 0x1000); b.putLong(0x428, code.length);
        b.putInt(0x544, 1); b.putLong(0x548, 6); b.putLong(0x550, 0x1000);
        b.putLong(0x558, 0x100); b.putLong(0x560, code.length);
        b.putInt(0x584, 3); b.putLong(0x598, 0x300); b.putLong(0x5a0, 128);
        b.putInt(0x5c4, 11); b.putLong(0x5d8, 0x400); b.putLong(0x5e0, 48);
        b.putInt(0x5e8, 2); b.putLong(0x5f8, 24);
        return b.array();
    }
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
}
