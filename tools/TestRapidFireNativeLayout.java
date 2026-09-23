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
        pairedStores();
        for (String path : args) check(RapidFireNativeLayout.inspectFile(new java.io.File(path)) != null,
                "real OEM ELF accepted: " + path);
        System.out.println("PASS TestRapidFireNativeLayout");
    }

    private static void pairedStores() {
        ByteBuffer bytes = ByteBuffer.allocate(RapidFireNativeLayout.PAIRED_STORE_PATTERN.length * 4)
                .order(ByteOrder.LITTLE_ENDIAN);
        for (int word : RapidFireNativeLayout.PAIRED_STORE_PATTERN) bytes.putInt(word);
        byte[] original = bytes.array();
        RapidFireNativeLayout.Layout layout = RapidFireNativeLayout.inspectCode(original);
        check(layout != null && layout.firstKey == 137 && layout.secondKey == 138
                && layout.firstCount == 96 && layout.secondCount == 100
                && layout.firstDown == 80 && layout.firstUp == 84
                && layout.secondDown == 88 && layout.secondUp == 92, "paired stores derive both complete layouts");
        check(RapidFireNativeLayout.inspectElf(elf(original)) != null, "paired-store ELF");
        byte[] bti = new byte[original.length + 4];
        ByteBuffer.wrap(bti).order(ByteOrder.LITTLE_ENDIAN).putInt(0xd503245f).put(original);
        check(RapidFireNativeLayout.inspectCode(bti) != null, "paired-store BTI");
        ByteBuffer changed = ByteBuffer.wrap(original.clone()).order(ByteOrder.LITTLE_ENDIAN);
        for (int i : new int[]{9, 19}) changed.putInt(i * 4, changed.getInt(i * 4) + (0x80 / 4 << 10));
        for (int i : new int[]{65, 85}) changed.putInt(i * 4, changed.getInt(i * 4) + (0x80 / 4 << 15));
        for (int i : new int[]{4, 7}) changed.putInt(i * 4, changed.getInt(i * 4) + (20 << 10));
        layout = RapidFireNativeLayout.inspectCode(changed.array());
        check(layout != null && layout.firstKey == 157 && layout.firstCount == 224
                && layout.firstDown == 208 && layout.secondUp == 220, "paired offsets and keys are derived");
        changed.putInt(85 * 4, changed.getInt(65 * 4));
        check(RapidFireNativeLayout.inspectCode(changed.array()) == null, "overlapping paired fields rejected");
        changed = ByteBuffer.wrap(original.clone()).order(ByteOrder.LITTLE_ENDIAN);
        changed.putInt(65 * 4, (changed.getInt(65 * 4) & ~0x003f8000) | (127 << 15));
        check(RapidFireNativeLayout.inspectCode(changed.array()) == null, "negative STP displacement rejected");
        changed = ByteBuffer.wrap(original.clone()).order(ByteOrder.LITTLE_ENDIAN);
        changed.putInt(7 * 4, changed.getInt(4 * 4));
        check(RapidFireNativeLayout.inspectCode(changed.array()) == null, "duplicate native keys rejected");
        byte[] paddedOld = java.util.Arrays.copyOf(code(), original.length);
        check(RapidFireNativeLayout.inspectCode(paddedOld) == null, "length alone cannot admit another body");
        strictMutationSweep(code(), false);
        strictMutationSweep(original, true);
    }

    private static void strictMutationSweep(byte[] original, boolean paired) {
        for (int i = 0; i < original.length / 4; i++) {
            int variable = 0;
            if (i == 4 || i == 7 || i == 9 || i == 19) variable = 0x003ffc00;
            if (!paired && (i == 57 || i == 58 || i == 70 || i == 71)) variable = 0x001fffe0;
            if (paired && (i == 65 || i == 85)) variable = 0x003f8000;
            for (int bit = 0; bit < 32; bit++) {
                if ((variable & (1 << bit)) != 0) continue;
                ByteBuffer mutation = ByteBuffer.wrap(original.clone()).order(ByteOrder.LITTLE_ENDIAN);
                mutation.putInt(i * 4, mutation.getInt(i * 4) ^ (1 << bit));
                check(RapidFireNativeLayout.inspectCode(mutation.array()) == null,
                        "fixed instruction bit rejected: " + paired + "/" + i + "/" + bit);
            }
        }
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
