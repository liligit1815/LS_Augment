package ls.augment.com;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashSet;

/** Read-only ARM64 control-flow/field-layout probe; no device, ROM or hash allowlist. */
public final class RapidFireNativeLayout {
    public static final String SYMBOL = "_ZN7android13EventProducer22updateTgkRapidFireDataEi";
    public static final String PROFILE = "arm64_tgk_split_phase_v1";
    // Complete split-phase algorithm, including all branch destinations and stores.
    // Only key immediates and object field offsets vary. Keep native probe in sync.
    static final int[] PATTERN = {
        0xd503233f, 0xa9be7bfd, 0xf9000bf3, 0x910003fd, 0x7102283f, 0xaa0003f3,
        0x540001a0, 0x7102243f, 0x54000941, 0xb9406268, 0x7100191f, 0x5400024b,
        0xf9400268, 0x529c2001, 0x529c3802, 0xaa1303e0, 0x72a0bea1, 0x72a01c82,
        0x14000025, 0xb9406668, 0x7100191f, 0x5400022b, 0xf9400268, 0x529c2001,
        0x529c3802, 0xaa1303e0, 0x72a0bea1, 0x72a01c82, 0x14000028, 0x71000d1f,
        0x5400022b, 0xf9400268, 0x52984001, 0x529e1002, 0xaa1303e0, 0x72a17d61,
        0x72a05f42, 0x14000012, 0x71000d1f, 0x540002ab, 0xf9400268, 0x52984001,
        0x529e1002, 0xaa1303e0, 0x72a17d61, 0x72a05f42, 0x14000016, 0x7100051f,
        0x540004cb, 0xf9400268, 0x528ca001, 0x52984002, 0xaa1303e0, 0x72a3b9a1,
        0x72a17d62, 0xf9403d08, 0xd63f0100, 0x52800a88, 0x52800a09, 0x1400000d,
        0x7100051f, 0x5400036b, 0xf9400268, 0x528ca001, 0x52984002, 0xaa1303e0,
        0x72a3b9a1, 0x72a17d62, 0xf9403d08, 0xd63f0100, 0x52800b88, 0x52800b09,
        0x528cccea, 0x72acccca, 0x9b2a7c0a, 0xd37ffd4b, 0x9361fd4a, 0x0b0b014a,
        0x531f794b, 0x0b0a016a, 0xb8296a6a, 0xb8286a6b, 0xf9400bf3, 0xa8c27bfd,
        0xd50323bf, 0xd65f03c0, 0x2a1f03e0, 0x17ffffe2, 0x2a1f03e0, 0x17ffffed,
    };

    public static final class Layout {
        public final int firstKey, secondKey, firstCount, secondCount;
        public final int firstDown, firstUp, secondDown, secondUp;
        Layout(int[] code) {
            firstKey = (code[7] >>> 10) & 4095;
            secondKey = (code[4] >>> 10) & 4095;
            firstCount = ((code[9] >>> 10) & 4095) * 4;
            secondCount = ((code[19] >>> 10) & 4095) * 4;
            firstDown = (code[58] >>> 5) & 65535;
            firstUp = (code[57] >>> 5) & 65535;
            secondDown = (code[71] >>> 5) & 65535;
            secondUp = (code[70] >>> 5) & 65535;
        }
    }

    public static Layout inspectCode(byte[] bytes) {
        if (bytes == null || bytes.length < 4) return null;
        ByteBuffer buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        int prefix = buffer.getInt(0) == 0xd503245f ? 4 : 0; // Optional BTI landing pad.
        if (bytes.length != PATTERN.length * 4 + prefix) return null;
        int[] code = new int[PATTERN.length];
        for (int i = 0; i < code.length; i++) {
            code[i] = buffer.getInt(prefix + i * 4);
            int mask = -1;
            if (i == 4 || i == 7 || i == 9 || i == 19) mask = ~0x003ffc00;
            if (i == 57 || i == 58 || i == 70 || i == 71) mask = ~0x001fffe0;
            if ((code[i] & mask) != (PATTERN[i] & mask)) return null;
        }
        Layout layout = new Layout(code);
        if (layout.firstKey == 0 || layout.secondKey == 0 || layout.firstKey == layout.secondKey) return null;
        HashSet<Integer> fields = new HashSet<>();
        for (int offset : new int[]{layout.firstCount, layout.secondCount, layout.firstDown,
                layout.firstUp, layout.secondDown, layout.secondUp}) {
            if (offset < 16 || offset > 1024 || offset % 4 != 0 || !fields.add(offset)) return null;
        }
        return layout;
    }

    public static Layout inspectFile(File file) {
        try {
            if (file.length() < 64 || file.length() > 64 * 1024 * 1024) return null;
            return inspectElf(Files.readAllBytes(file.toPath()));
        } catch (Exception ignored) { return null; }
    }

    public static Layout inspectElf(byte[] file) {
        try {
            if (file == null || file.length < 64 || file.length > 64 * 1024 * 1024) return null;
            ByteBuffer b = ByteBuffer.wrap(file).order(ByteOrder.LITTLE_ENDIAN);
            if (b.getInt(0) != 0x464c457f || file[4] != 2 || file[5] != 1
                    || b.getShort(16) != 3 || b.getShort(18) != 183
                    || b.getShort(58) != 64) return null;
            long table = b.getLong(40);
            int sections = b.getShort(60) & 65535;
            if (sections == 0 || !range(table, sections * 64L, file.length)) return null;
            long foundAddress = -1;
            Layout found = null;
            for (int i = 0; i < sections; i++) {
                int section = (int) table + i * 64;
                int kind = b.getInt(section + 4);
                if (kind != 2 && kind != 11) continue;
                long offset = b.getLong(section + 24), size = b.getLong(section + 32);
                long stride = b.getLong(section + 56);
                int link = b.getInt(section + 40);
                if (link < 0 || link >= sections || stride < 24 || stride > file.length
                        || size % stride != 0 || !range(offset, size, file.length)) return null;
                int stringSection = (int) table + link * 64;
                long strings = b.getLong(stringSection + 24), stringSize = b.getLong(stringSection + 32);
                if (b.getInt(stringSection + 4) != 3 || !range(strings, stringSize, file.length)) return null;
                for (long n = 0; n < size; n += stride) {
                    int symbol = (int) (offset + n), name = b.getInt(symbol);
                    if ((file[symbol + 4] & 15) != 2 || name < 0 || name >= stringSize) continue;
                    int start = (int) (strings + name), end = start;
                    while (end < strings + stringSize && end - start <= 256 && file[end] != 0) end++;
                    if (end >= strings + stringSize || end - start > 256
                            || !SYMBOL.equals(new String(file, start, end - start, StandardCharsets.US_ASCII))) continue;
                    int owner = b.getShort(symbol + 6) & 65535;
                    long address = b.getLong(symbol + 8), codeSize = b.getLong(symbol + 16);
                    if (owner == 0 || owner >= sections || codeSize > 512 || codeSize <= 0) return null;
                    int codeSection = (int) table + owner * 64;
                    long delta = address - b.getLong(codeSection + 16);
                    if ((b.getLong(codeSection + 8) & 4) == 0
                            || !range(delta, codeSize, b.getLong(codeSection + 32))) return null;
                    long codeOffset = b.getLong(codeSection + 24) + delta;
                    if (!range(codeOffset, codeSize, file.length)) return null;
                    Layout layout = inspectCode(java.util.Arrays.copyOfRange(file, (int) codeOffset, (int) (codeOffset + codeSize)));
                    if (layout == null || (found != null && foundAddress != address)) return null;
                    found = layout;
                    foundAddress = address;
                }
            }
            return found;
        } catch (RuntimeException ignored) { return null; }
    }

    private static boolean range(long offset, long length, long total) {
        return offset >= 0 && length >= 0 && offset <= total && length <= total - offset;
    }
}
