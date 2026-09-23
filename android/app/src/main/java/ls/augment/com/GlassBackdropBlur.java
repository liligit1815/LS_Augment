package ls.augment.com;

/** Allocation-free, three-pass box approximation for an opaque glass backdrop. */
public final class GlassBackdropBlur {
    private GlassBackdropBlur() { }

    /**
     * Blurs the first width * height opaque ARGB pixels in place.
     * Each of three rounds averages horizontally into scratch, then vertically
     * back into pixels. Edges repeat the nearest pixel; RGB averages round to
     * the nearest integer after each axis. Scratch must not alias pixels.
     *
     * @throws IllegalArgumentException before writing if dimensions, radius,
     *         buffers or buffer sizes are invalid
     */
    public static void blur(int[] pixels, int[] scratch, int width, int height, int radius) {
        if (pixels == null || scratch == null || pixels == scratch)
            throw new IllegalArgumentException("Distinct pixel and scratch buffers are required");
        if (width <= 0 || height <= 0 || radius < 0)
            throw new IllegalArgumentException("Positive dimensions and a nonnegative radius are required");
        long count = (long) width * height;
        if (count > pixels.length || count > scratch.length)
            throw new IllegalArgumentException("Buffers are smaller than the image dimensions");
        if (radius == 0) return;
        long diameter = 2L * radius + 1;
        for (int pass = 0; pass < 3; pass++) {
            horizontal(pixels, scratch, width, height, radius, diameter);
            vertical(scratch, pixels, width, height, radius, diameter);
        }
    }

    private static void horizontal(int[] source, int[] target, int width, int height,
            int radius, long diameter) {
        int limit = Math.min(radius, width - 1);
        long leftWeight = (long) radius + 1;
        long rightWeight = (long) radius - limit;
        long rounding = diameter / 2;
        for (int y = 0; y < height; y++) {
            int row = y * width;
            int first = source[row], last = source[row + width - 1];
            long red = ((first >>> 16) & 255) * leftWeight + ((last >>> 16) & 255) * rightWeight;
            long green = ((first >>> 8) & 255) * leftWeight + ((last >>> 8) & 255) * rightWeight;
            long blue = (first & 255) * leftWeight + (last & 255) * rightWeight;
            // Only visit actual pixels, even when the kernel is wider than the image.
            for (int x = 1; x <= limit; x++) {
                int color = source[row + x];
                red += (color >>> 16) & 255;
                green += (color >>> 8) & 255;
                blue += color & 255;
            }
            for (int x = 0; x < width; x++) {
                target[row + x] = 0xff000000 | ((int) ((red + rounding) / diameter) << 16)
                        | ((int) ((green + rounding) / diameter) << 8)
                        | (int) ((blue + rounding) / diameter);
                int outgoing = source[row + (x > radius ? x - radius : 0)];
                int incoming = source[row + (radius < width - x - 1 ? x + radius + 1 : width - 1)];
                red += ((incoming >>> 16) & 255) - ((outgoing >>> 16) & 255);
                green += ((incoming >>> 8) & 255) - ((outgoing >>> 8) & 255);
                blue += (incoming & 255) - (outgoing & 255);
            }
        }
    }

    private static void vertical(int[] source, int[] target, int width, int height,
            int radius, long diameter) {
        int limit = Math.min(radius, height - 1);
        long topWeight = (long) radius + 1;
        long bottomWeight = (long) radius - limit;
        long rounding = diameter / 2;
        for (int x = 0; x < width; x++) {
            int first = source[x], last = source[(height - 1) * width + x];
            long red = ((first >>> 16) & 255) * topWeight + ((last >>> 16) & 255) * bottomWeight;
            long green = ((first >>> 8) & 255) * topWeight + ((last >>> 8) & 255) * bottomWeight;
            long blue = (first & 255) * topWeight + (last & 255) * bottomWeight;
            for (int y = 1; y <= limit; y++) {
                int color = source[y * width + x];
                red += (color >>> 16) & 255;
                green += (color >>> 8) & 255;
                blue += color & 255;
            }
            for (int y = 0; y < height; y++) {
                target[y * width + x] = 0xff000000 | ((int) ((red + rounding) / diameter) << 16)
                        | ((int) ((green + rounding) / diameter) << 8)
                        | (int) ((blue + rounding) / diameter);
                int outgoing = source[(y > radius ? y - radius : 0) * width + x];
                int incoming = source[(radius < height - y - 1 ? y + radius + 1 : height - 1) * width + x];
                red += ((incoming >>> 16) & 255) - ((outgoing >>> 16) & 255);
                green += ((incoming >>> 8) & 255) - ((outgoing >>> 8) & 255);
                blue += (incoming & 255) - (outgoing & 255);
            }
        }
    }
}
