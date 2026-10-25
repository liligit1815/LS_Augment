package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

/** APK-owned immutable artwork, decoded off the UI thread and shared by preview and SystemUI. */
public final class IosBatteryAssets {
    private static final int CACHE_BYTES = 12 * 1024 * 1024;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService READER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "LS-ios-battery"); thread.setDaemon(true); return thread;
    });
    private static final LinkedHashMap<String, Sheet> CACHE = new LinkedHashMap<>(16, .75f, true);
    private static final Map<String, ArrayList<Consumer<Sheet>>> PENDING = new HashMap<>();
    private static final Set<String> FAILED = new HashSet<>();
    private static int cacheBytes;
    private IosBatteryAssets() { }

    public static final class Sheet {
        public final Bitmap bitmap;
        public final int frames;
        private Sheet(Bitmap bitmap) {
            this.bitmap = bitmap; frames = bitmap.getHeight() / IosBatteryPolicy.FRAME_HEIGHT;
        }
    }

    public static synchronized Sheet cached(String name) { return CACHE.get(name); }

    public static void request(Context context, String name, Consumer<Sheet> ready) {
        Sheet existing;
        synchronized (IosBatteryAssets.class) {
            existing = CACHE.get(name);
            if (existing == null && !FAILED.contains(name)) {
                ArrayList<Consumer<Sheet>> waiting = PENDING.get(name);
                if (waiting != null) { waiting.add(ready); return; }
                waiting = new ArrayList<>(); waiting.add(ready); PENDING.put(name, waiting);
                Context application = context.getApplicationContext();
                Context source = application == null ? context : application;
                READER.execute(() -> decode(source, name)); return;
            }
        }
        Sheet result = existing; MAIN.post(() -> ready.accept(result));
    }

    private static void decode(Context source, String name) {
        Sheet result = null;
        try {
            // SystemUI can read the installed module APK through a resource-only Context.
            Context module = "ls.augment.com".equals(source.getPackageName()) ? source
                    : source.createPackageContext("ls.augment.com", 0);
            try (InputStream stream = module.getAssets().open(IosBatteryPolicy.ASSET_DIRECTORY + name)) {
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inScaled = false;
                Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
                if (bitmap != null && bitmap.getWidth() >= 80 && bitmap.getWidth() <= 100
                        && (bitmap.getHeight() == 6000 || bitmap.getHeight() == 600)) result = new Sheet(bitmap);
                else if (bitmap != null) bitmap.recycle();
            }
        } catch (Exception ignored) { }
        ArrayList<Consumer<Sheet>> waiting;
        synchronized (IosBatteryAssets.class) {
            waiting = PENDING.remove(name);
            if (result == null) FAILED.add(name);
            else {
                CACHE.put(name, result); cacheBytes += result.bitmap.getAllocationByteCount();
                while (cacheBytes > CACHE_BYTES && CACHE.size() > 1) {
                    String oldest = CACHE.keySet().iterator().next();
                    cacheBytes -= CACHE.remove(oldest).bitmap.getAllocationByteCount();
                    // A live drawable may still own this sheet; never recycle a published bitmap.
                }
            }
        }
        Sheet published = result;
        MAIN.post(() -> { if (waiting != null) for (Consumer<Sheet> callback : waiting) callback.accept(published); });
    }
}
