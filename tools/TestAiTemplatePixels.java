package ls.augment.com.hook;

public final class TestAiTemplatePixels {
    public static void main(String[] args) throws Throwable {
        // The OEM's default 325-square selection becomes a 517 x 581 search window.
        int step = AiTemplatePixels.samplingStep(581, 517, 325, 325);
        equal(2, step);
        check(AiTemplatePixels.read(new FakeMat(581, 517, 3)) == null,
                "The unrelated full-frame reader must keep its allocation cap");
        AiTemplatePixels screen = AiTemplatePixels.read(new FakeMat(581, 517, 3), step);
        equal(291, screen.rows);
        equal(259, screen.cols);
        equal(226107, screen.values.length);
        pixelsMatchSource(screen, step);
        AiTemplatePixels template = AiTemplatePixels.read(new FakeMat(325, 325, 3), step);
        equal(163, template.rows);
        equal(163, template.cols);
        pixelsMatchSource(template, step);

        // Small, existing policies retain every original pixel.
        equal(1, AiTemplatePixels.samplingStep(234, 167, 74, 71));
        pixelsMatchSource(AiTemplatePixels.read(new FakeMat(74, 71, 4)), 1);
        equal(5, AiTemplatePixels.samplingStep(1216, 2688, 1000, 2400));
        AiTemplatePixels full = AiTemplatePixels.read(new FakeMat(1216, 2688, 4), 5);
        equal(244, full.rows);
        equal(538, full.cols);
        check(full.values.length <= AiTemplatePixels.MAX_PIXELS * 4, "bounded full-screen sample");
        pixelsMatchSource(full, 5);
        check(AiTemplatePixels.read(new FakeMat(2, 3, 1), 8193) == null, "invalid step");
        check(AiTemplatePixels.read(new FakeMat(10, 10, 5)) == null, "invalid channels");
        check(AiTemplatePixels.read(new FakeMat(10, 10, 3, true)) == null, "partial native read");
        check(AiTemplatePixels.read(new FakeMat(581, 517, 3, true), 2) == null,
                "partial sampled row must not leave stale pixels");
        equal(0, AiTemplatePixels.samplingStep(Integer.MAX_VALUE, Integer.MAX_VALUE, 1, 1));
        equal(0, AiTemplatePixels.samplingStep(8192, 8192, 1, 1));
        equal(0, AiTemplatePixels.samplingStep(100, 100, 0, 100));
        System.out.println("PASS TestAiTemplatePixels: native default crop, large/small images, byte identity, read failure and bounds");
    }

    private static void pixelsMatchSource(AiTemplatePixels result, int step) {
        check(result != null, "pixels expected");
        for (int row = 0; row < result.rows; row++) {
            for (int col = 0; col < result.cols; col++) {
                for (int channel = 0; channel < result.channels; channel++) {
                    equal(FakeMat.pixel(row * step, col * step, channel),
                            result.values[(row * result.cols + col) * result.channels + channel] & 255);
                }
            }
        }
    }

    public static final class FakeMat {
        private final int rows, cols, channels;
        private final boolean partial;
        FakeMat(int rows, int cols, int channels) { this(rows, cols, channels, false); }
        FakeMat(int rows, int cols, int channels, boolean partial) {
            this.rows = rows; this.cols = cols; this.channels = channels; this.partial = partial;
        }
        public int rows() { return rows; }
        public int cols() { return cols; }
        public int channels() { return channels; }
        public int get(int row, int col, byte[] buffer) {
            int start = (row * cols + col) * channels;
            for (int i = 0; i < buffer.length; i++) {
                int pixel = (start + i) / channels;
                buffer[i] = (byte) pixel(pixel / cols, pixel % cols, (start + i) % channels);
            }
            return partial ? buffer.length - 1 : buffer.length;
        }
        static int pixel(int row, int col, int channel) {
            return (row * 17 + col * 7 + channel * 13) & 255;
        }
    }

    private static void equal(int expected, int actual) {
        if (expected != actual) throw new AssertionError("expected=" + expected + " actual=" + actual);
    }
    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
