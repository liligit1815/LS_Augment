package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Bounded pixels for the independent same-frame AI match check. */
final class AiTemplatePixels {
    static final int MAX_PIXELS = 160_000;
    private static final int MAX_DIMENSION = 8192;
    private static final long MAX_SOURCE_PIXELS = 16_777_216L;
    final int rows;
    final int cols;
    final int channels;
    final byte[] values;

    private AiTemplatePixels(int rows, int cols, int channels, byte[] values) {
        this.rows = rows;
        this.cols = cols;
        this.channels = channels;
        this.values = values;
    }

    static int samplingStep(int screenRows, int screenCols, int templateRows, int templateCols) {
        if (!validDimensions(screenRows, screenCols)
                || !validDimensions(templateRows, templateCols)) return 0;
        int step = 1;
        while (sampleCount(screenRows, screenCols, step) > MAX_PIXELS
                || sampleCount(templateRows, templateCols, step) > MAX_PIXELS) step++;
        return step;
    }

    private static boolean validDimensions(int rows, int cols) {
        return rows > 0 && cols > 0 && rows <= MAX_DIMENSION && cols <= MAX_DIMENSION
                && (long) rows * cols <= MAX_SOURCE_PIXELS;
    }

    private static long sampleCount(int rows, int cols, int step) {
        return (long) ((rows + step - 1) / step) * ((cols + step - 1) / step);
    }

    static AiTemplatePixels read(Object mat) throws Throwable {
        return read(mat, 1);
    }

    /** Use the same grid for the frame and its template; never allocate a full large Mat. */
    static AiTemplatePixels read(Object mat, int step) throws Throwable {
        if (mat == null) return null;
        Method rowsMethod = mat.getClass().getMethod("rows");
        Method colsMethod = mat.getClass().getMethod("cols");
        Method channelsMethod = mat.getClass().getMethod("channels");
        int rows = ((Number) rowsMethod.invoke(mat)).intValue();
        int cols = ((Number) colsMethod.invoke(mat)).intValue();
        int channels = ((Number) channelsMethod.invoke(mat)).intValue();
        if (!validDimensions(rows, cols) || channels <= 0 || channels > 4 || step <= 0
                || step > MAX_DIMENSION || sampleCount(rows, cols, step) > MAX_PIXELS) return null;
        int sampledRows = (rows + step - 1) / step;
        int sampledCols = (cols + step - 1) / step;
        byte[] values = new byte[sampledRows * sampledCols * channels];
        Method get = mat.getClass().getMethod("get", int.class, int.class, byte[].class);
        if (step == 1) {
            if (!readBytes(get, mat, 0, values)) return null;
        } else {
            byte[] row = new byte[cols * channels];
            int destination = 0;
            for (int sourceRow = 0; sourceRow < rows; sourceRow += step) {
                if (!readBytes(get, mat, sourceRow, row)) return null;
                for (int col = 0; col < cols; col += step) {
                    System.arraycopy(row, col * channels, values, destination, channels);
                    destination += channels;
                }
            }
        }
        return new AiTemplatePixels(sampledRows, sampledCols, channels, values);
    }

    private static boolean readBytes(Method get, Object mat, int row, byte[] destination)
            throws Throwable {
        Object copied = get.invoke(mat, row, 0, destination);
        return copied instanceof Number && ((Number) copied).intValue() == destination.length;
    }

    double[] borderAverage() {
        double[] sum = new double[Math.min(channels, 3)];
        int count = 0;
        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                if (row != 0 && row != rows - 1 && col != 0 && col != cols - 1) continue;
                int offset = (row * cols + col) * channels;
                for (int channel = 0; channel < sum.length; channel++) {
                    sum[channel] += unsigned(values[offset + channel]);
                }
                count++;
            }
        }
        if (count == 0) return sum;
        for (int channel = 0; channel < sum.length; channel++) sum[channel] /= count;
        return sum;
    }

    double distance(int offset, double[] background) {
        double sum = 0.0;
        for (int channel = 0; channel < background.length; channel++) {
            double delta = unsigned(values[offset + channel]) - background[channel];
            sum += delta * delta;
        }
        return Math.sqrt(sum);
    }

    boolean distanceTo(int offset, AiTemplatePixels other, double limit) {
        return distanceTo(offset, other, offset, limit);
    }

    boolean distanceTo(int offset, AiTemplatePixels other, int otherOffset, double limit) {
        double sum = 0.0;
        int count = Math.min(Math.min(channels, other.channels), 3);
        for (int channel = 0; channel < count; channel++) {
            double delta = unsigned(values[offset + channel])
                    - unsigned(other.values[otherOffset + channel]);
            sum += delta * delta;
        }
        return Math.sqrt(sum) <= limit;
    }

    double luma(int offset) {
        int count = Math.min(channels, 3);
        if (count <= 0) return 0.0;
        double sum = 0.0;
        for (int channel = 0; channel < count; channel++) {
            sum += unsigned(values[offset + channel]);
        }
        return sum / count;
    }

    List<Integer> foregroundAnchors(int limit) {
        ArrayList<Integer> result = new ArrayList<>();
        ArrayList<Integer> detail = new ArrayList<>();
        double[] background = borderAverage();
        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                int offset = (row * cols + col) * channels;
                if (distance(offset, background) <= 24.0) continue;
                result.add(offset);
                // Flat card colours must not outvote a missing symbol inside the card.
                // Prefer local shape transitions, retaining the old fallback for soft images.
                if (row > 0 && row < rows - 1 && col > 0 && col < cols - 1
                        && (!distanceTo(offset, this, offset - channels, 24.0)
                        || !distanceTo(offset, this, offset + channels, 24.0)
                        || !distanceTo(offset, this, offset - cols * channels, 24.0)
                        || !distanceTo(offset, this, offset + cols * channels, 24.0))) {
                    detail.add(offset);
                }
            }
        }
        if (detail.size() >= 8) result = detail;
        if (result.size() <= limit) return result;
        ArrayList<Integer> sampled = new ArrayList<>(limit);
        int stride = Math.max(1, (result.size() + limit - 1) / limit);
        for (int i = 0; i < result.size() && sampled.size() < limit; i += stride) {
            sampled.add(result.get(i));
        }
        return sampled;
    }

    private static int unsigned(byte value) {
        return value & 0xff;
    }
}
