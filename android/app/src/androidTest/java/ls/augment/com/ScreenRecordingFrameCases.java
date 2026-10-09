package ls.augment.com;

import android.app.Instrumentation;
import android.graphics.Bitmap;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMetadataRetriever;
import android.os.Bundle;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

/** Development-only decoding of a supplied screen recording; does not modify configuration. */
final class ScreenRecordingFrameCases {
    static JSONObject run(Instrumentation test, Bundle arguments) throws Exception {
        String label = arguments.getString("label", "latest");
        if (!label.matches("[A-Za-z0-9_.-]+")) throw new IllegalArgumentException("Invalid recording label");
        int fps = Integer.parseInt(arguments.getString("fps", "30"));
        int topPx = Integer.parseInt(arguments.getString("topPx", "160"));
        if (fps < 1 || fps > 60) throw new IllegalArgumentException("fps must be 1..60");
        if (topPx < 1 || topPx > 512) throw new IllegalArgumentException("topPx must be 1..512");
        File external = test.getTargetContext().getExternalFilesDir(null);
        if (external == null) throw new IOException("External app files are unavailable");
        File directory = new File(external, "statusbar-flicker");
        File video = new File(directory, label + ".mp4");
        if (!video.isFile()) throw new IOException("Missing recording: " + video);
        File output = new File(directory, label + "-frames");
        if (!output.isDirectory() && !output.mkdirs()) throw new IOException("Cannot create frame directory");

        List<Long> timestamps = videoSampleTimes(video);
        if (timestamps.isEmpty()) throw new IOException("Recording has no video samples");
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try (FileInputStream input = openRecording(video, "retriever")) {
            // The media service may not reopen a scoped-storage path with the app's identity.
            // Pass the app-opened descriptor, and keep it open throughout decoding instead.
            try {
                retriever.setDataSource(input.getFD(), 0, video.length());
            } catch (RuntimeException failure) {
                throw new IOException("Cannot initialize recording retriever via FD; " + fileContext(video), failure);
            }
            long durationMs = metadataLong(retriever, MediaMetadataRetriever.METADATA_KEY_DURATION, -1);
            long frameCount = metadataLong(retriever, MediaMetadataRetriever.METADATA_KEY_VIDEO_FRAME_COUNT, -1);
            long lastTimeUs = timestamps.get(timestamps.size() - 1);
            JSONArray frames = new JSONArray();
            long previousTimeUs = -1;
            int selectedIndex = 0;
            for (int tick = 0; ; tick++) {
                long requestedUs = Math.round(tick * (1_000_000d / fps));
                if (requestedUs > lastTimeUs) break;
                while (selectedIndex + 1 < timestamps.size()
                        && distance(timestamps.get(selectedIndex + 1), requestedUs)
                        <= distance(timestamps.get(selectedIndex), requestedUs)) selectedIndex++;
                long frameTimeUs = timestamps.get(selectedIndex);
                // Low-rate recordings can share the same nearest frame across several ticks.
                if (frameTimeUs == previousTimeUs) continue;
                previousTimeUs = frameTimeUs;
                Bitmap decoded;
                try {
                    decoded = retriever.getFrameAtTime(frameTimeUs, MediaMetadataRetriever.OPTION_CLOSEST);
                } catch (RuntimeException failure) {
                    throw new IOException("Cannot decode frame at " + frameTimeUs + " us; " + fileContext(video), failure);
                }
                if (decoded == null) throw new IOException("Decoder returned no frame at " + frameTimeUs + " us");
                Bitmap crop = null;
                try {
                    int height = Math.min(topPx, decoded.getHeight());
                    crop = Bitmap.createBitmap(decoded, 0, 0, decoded.getWidth(), height);
                    String name = String.format(Locale.ROOT, "%05d-t%012dus.png", frames.length(), frameTimeUs);
                    File image = new File(output, name);
                    try (FileOutputStream stream = new FileOutputStream(image)) {
                        if (!crop.compress(Bitmap.CompressFormat.PNG, 100, stream))
                            throw new IOException("Cannot encode frame: " + image);
                    }
                    frames.put(new JSONObject().put("index", frames.length()).put("requestedTimeUs", requestedUs)
                            .put("frameTimeUs", frameTimeUs).put("sampleIndex", selectedIndex)
                            .put("file", image.getAbsolutePath()).put("widthPx", crop.getWidth())
                            .put("heightPx", height).put("decodedHeightPx", decoded.getHeight()));
                } finally {
                    if (crop != null && crop != decoded) crop.recycle();
                    decoded.recycle();
                }
            }
            if (frames.length() == 0) throw new IOException("No recording frames were extracted");
            JSONObject report = new JSONObject().put("success", true).put("video", video.getAbsolutePath())
                    .put("durationMs", durationMs).put("frameCount", frameCount)
                    .put("videoBytes", video.length()).put("dataSource", "App-opened FileInputStream descriptor")
                    .put("videoSampleCount", timestamps.size()).put("requestedFps", fps).put("topPx", topPx)
                    .put("decoder", "Android MediaMetadataRetriever OPTION_CLOSEST")
                    .put("frameTimeSource", "Nearest actual video sample presentation timestamp")
                    .put("outputDirectory", output.getAbsolutePath()).put("extractedCount", frames.length())
                    .put("frames", frames).put("configurationChanged", false);
            File manifest = new File(output, "frames.json");
            report.put("manifest", manifest.getAbsolutePath());
            Files.write(manifest.toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
            return report;
        } finally {
            retriever.release();
        }
    }

    private static List<Long> videoSampleTimes(File video) throws IOException {
        MediaExtractor extractor = new MediaExtractor();
        try (FileInputStream input = openRecording(video, "extractor")) {
            extractor.setDataSource(input.getFD(), 0, video.length());
            int videoTrack = -1;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat format = extractor.getTrackFormat(i);
                String mime = format.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("video/")) { videoTrack = i; break; }
            }
            if (videoTrack < 0) throw new IOException("Recording contains no video track");
            extractor.selectTrack(videoTrack);
            List<Long> timestamps = new ArrayList<>();
            do {
                long time = extractor.getSampleTime();
                if (time < 0) break;
                timestamps.add(time);
            } while (extractor.advance());
            // Presentation order can differ from encoded sample order for recordings with B frames.
            Collections.sort(timestamps);
            return timestamps;
        } catch (IOException | RuntimeException failure) {
            throw new IOException("Cannot extract recording sample times via FD; " + fileContext(video), failure);
        } finally {
            extractor.release();
        }
    }

    private static FileInputStream openRecording(File video, String stage) throws IOException {
        try { return new FileInputStream(video); }
        catch (IOException failure) {
            throw new IOException("Cannot open recording for " + stage + "; " + fileContext(video), failure);
        }
    }

    private static String fileContext(File video) {
        return "path=" + video.getAbsolutePath() + ", bytes=" + video.length()
                + ", readable=" + video.canRead() + ", uid=" + android.os.Process.myUid();
    }

    private static long metadataLong(MediaMetadataRetriever retriever, int key, long fallback) {
        String value = retriever.extractMetadata(key);
        try { return value == null ? fallback : Long.parseLong(value); }
        catch (NumberFormatException ignored) { return fallback; }
    }

    private static long distance(long timestamp, long requested) { return Math.abs(timestamp - requested); }
}
