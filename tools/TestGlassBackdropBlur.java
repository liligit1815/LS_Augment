package ls.augment.com;

import java.util.Arrays;
import java.util.Random;

public final class TestGlassBackdropBlur {
    public static void main(String[] args) {
        Random random = new Random(0x1ceB10eL);
        for (int trial = 0; trial < 500; trial++) {
            int width = 1 + random.nextInt(13), height = 1 + random.nextInt(13);
            int radius = random.nextInt(30);
            int[] original = new int[width * height];
            for (int i = 0; i < original.length; i++) original[i] = 0xff000000 | random.nextInt(0x1000000);
            compare(original, width, height, radius, slowReference(original, width, height, radius, false));
        }
        for (int color : new int[]{0xff000000, 0xffffffff, 0xff4c98e5, 0xff010203}) {
            for (int radius : new int[]{0, 1, 8, 40, Integer.MAX_VALUE}) {
                int[] solid = new int[7 * 4];
                Arrays.fill(solid, color);
                compare(solid, 7, 4, radius, solid);
            }
        }
        int[] strip = {0xff000000, 0xffff0010, 0xff125aff, 0xffffffff};
        for (int radius : new int[]{1, 8, 100, Integer.MAX_VALUE - 1, Integer.MAX_VALUE}) {
            compare(strip, 1, 4, radius, slowReference(strip, 1, 4, radius, true));
            compare(strip, 4, 1, radius, slowReference(strip, 4, 1, radius, true));
            compare(strip, 2, 2, radius, slowReference(strip, 2, 2, radius, true));
        }
        int[] impulse = new int[9 * 9];
        Arrays.fill(impulse, 0xff000000);
        impulse[4 * 9 + 4] = 0xffffffff;
        int[] blurred = impulse.clone();
        GlassBackdropBlur.blur(blurred, new int[blurred.length], 9, 9, 2);
        check(!Arrays.equals(impulse, blurred), "nonuniform content must be blurred");
        check(blurred[4 * 9 + 3] != 0xff000000, "light must spread to adjacent pixels");
        compare(impulse, 9, 9, 2, slowReference(impulse, 9, 9, 2, false));

        rejected(null, new int[1], 1, 1, 1);
        rejected(new int[1], null, 1, 1, 1);
        int[] alias = {0xff123456};
        rejected(alias, alias, 1, 1, 1);
        rejected(new int[1], new int[1], 0, 1, 1);
        rejected(new int[1], new int[1], 1, 0, 1);
        rejected(new int[1], new int[1], -1, 1, 1);
        rejected(new int[1], new int[1], 1, -1, 1);
        rejected(new int[1], new int[1], 1, 1, -1);
        rejected(new int[3], new int[4], 2, 2, 1);
        rejected(new int[4], new int[3], 2, 2, 1);
        rejected(new int[1], new int[1], 65536, 65536, 1);
        rejected(new int[1], new int[1], Integer.MAX_VALUE, Integer.MAX_VALUE, 1);
        System.out.println("PASS GlassBackdropBlur: 500 random references, solid colors, edge clamps, huge radii, tails and invalid inputs.");
    }

    private static void compare(int[] source, int width, int height, int radius, int[] expected) {
        int count = width * height;
        int[] actual = Arrays.copyOf(source, count + 2), scratch = new int[count + 2];
        actual[count] = 0x10203040; actual[count + 1] = 0x50607080;
        Arrays.fill(scratch, 0x24681357);
        GlassBackdropBlur.blur(actual, scratch, width, height, radius);
        for (int i = 0; i < count; i++) {
            check(actual[i] == expected[i], "reference mismatch w=" + width + " h=" + height
                    + " r=" + radius + " pixel=" + i + " expected=" + Integer.toHexString(expected[i])
                    + " actual=" + Integer.toHexString(actual[i]));
            check((actual[i] >>> 24) == 255, "output alpha must stay opaque");
            if (radius == 0) check(scratch[i] == 0x24681357, "zero radius must leave scratch unchanged");
        }
        check(actual[count] == 0x10203040 && actual[count + 1] == 0x50607080, "pixel tail modified");
        check(scratch[count] == 0x24681357 && scratch[count + 1] == 0x24681357, "scratch tail modified");
    }

    /** Deliberately recomputes the complete kernel independently for every output pixel. */
    private static int[] slowReference(int[] input, int width, int height, int radius, boolean hugeKernel) {
        int[] result = input.clone();
        for (int pass = 0; pass < 3; pass++) {
            result = referenceAxis(result, width, height, radius, true, hugeKernel);
            result = referenceAxis(result, width, height, radius, false, hugeKernel);
        }
        return result;
    }

    private static int[] referenceAxis(int[] input, int width, int height, int radius,
            boolean horizontal, boolean hugeKernel) {
        int[] output = new int[input.length];
        long diameter = 2L * radius + 1;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int position = horizontal ? x : y, length = horizontal ? width : height;
                long red = 0, green = 0, blue = 0;
                if (!hugeKernel) {
                    for (int delta = -radius; delta <= radius; delta++) {
                        int sample = Math.max(0, Math.min(length - 1, position + delta));
                        int color = input[horizontal ? y * width + sample : sample * width + x];
                        red += (color >>> 16) & 255;
                        green += (color >>> 8) & 255;
                        blue += color & 255;
                    }
                } else {
                    // For enormous kernels, count the clamped preimage of each actual pixel.
                    long start = (long) position - radius, end = (long) position + radius;
                    for (int sample = 0; sample < length; sample++) {
                        long first = sample == 0 ? start : Math.max(start, sample);
                        long last = sample == length - 1 ? end : Math.min(end, sample);
                        long repetitions = Math.max(0, last - first + 1);
                        int color = input[horizontal ? y * width + sample : sample * width + x];
                        red += ((color >>> 16) & 255) * repetitions;
                        green += ((color >>> 8) & 255) * repetitions;
                        blue += (color & 255) * repetitions;
                    }
                }
                output[y * width + x] = 0xff000000 | ((int) ((red + diameter / 2) / diameter) << 16)
                        | ((int) ((green + diameter / 2) / diameter) << 8)
                        | (int) ((blue + diameter / 2) / diameter);
            }
        }
        return output;
    }

    private static void rejected(int[] pixels, int[] scratch, int width, int height, int radius) {
        int[] original = pixels == null ? null : pixels.clone();
        int[] oldScratch = scratch == null ? null : scratch.clone();
        try {
            GlassBackdropBlur.blur(pixels, scratch, width, height, radius);
            throw new AssertionError("invalid input accepted");
        } catch (IllegalArgumentException expected) {
            check(Arrays.equals(pixels, original), "invalid input modified pixels");
            check(Arrays.equals(scratch, oldScratch), "invalid input modified scratch");
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
