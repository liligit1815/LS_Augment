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
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Original PNGs in the module APK; never decode an image on a draw/layout callback. */
public final class IosSignalAssets {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService READER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "LS-ios-signal"); thread.setDaemon(true); return thread;
    });
    private static final Map<String, Bitmap> CACHE = new HashMap<>();
    private static final Map<String, ArrayList<Runnable>> PENDING = new HashMap<>();
    private static final Set<String> FAILED = new HashSet<>();
    private IosSignalAssets() { }

    public static synchronized Bitmap cached(String name) { return CACHE.get(name); }

    public static boolean ready(Context context, String name, Runnable invalidated) {
        synchronized (IosSignalAssets.class) {
            if (CACHE.containsKey(name)) return true;
            if (FAILED.contains(name)) return false;
            ArrayList<Runnable> waiting = PENDING.get(name);
            if (waiting != null) {
                if (invalidated != null && !waiting.contains(invalidated)) waiting.add(invalidated);
                return false;
            }
            waiting = new ArrayList<>(); if (invalidated != null) waiting.add(invalidated);
            PENDING.put(name, waiting);
            Context application = context.getApplicationContext();
            Context source = application == null ? context : application;
            READER.execute(() -> decode(source, name));
            return false;
        }
    }

    private static void decode(Context source, String name) {
        Bitmap result = null;
        try {
            Context module = "ls.augment.com".equals(source.getPackageName()) ? source
                    : source.createPackageContext("ls.augment.com", 0);
            try (InputStream stream = module.getAssets().open(IosSignalPolicy.ASSET_DIRECTORY + name)) {
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inScaled = false;
                Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
                if (bitmap != null && bitmap.getWidth() == 61 && bitmap.getHeight() == 60) result = bitmap;
                else if (bitmap != null) bitmap.recycle();
            }
        } catch (Exception ignored) { }
        ArrayList<Runnable> waiting;
        synchronized (IosSignalAssets.class) {
            waiting = PENDING.remove(name);
            if (result == null) FAILED.add(name); else CACHE.put(name, result);
        }
        MAIN.post(() -> { if (waiting != null) for (Runnable callback : waiting) callback.run(); });
    }
}
