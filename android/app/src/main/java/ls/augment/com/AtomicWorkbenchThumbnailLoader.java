package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.util.Size;
import android.widget.ImageView;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Loads visible thumbnails after scrolling settles; previews and file imports have separate workers. */
final class AtomicWorkbenchThumbnailLoader implements AutoCloseable {
    private static final class Entry {
        final ImageView view;
        final AtomicWorkbenchContentItem item;
        final long generation;
        boolean requested;
        Entry(ImageView view, AtomicWorkbenchContentItem item, long generation) { this.view = view; this.item = item; this.generation = generation; }
    }
    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ThreadPoolExecutor worker = new ThreadPoolExecutor(2, 2, 10, TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(24), task -> { Thread thread = new Thread(task, "DuoContentThumbnail"); thread.setDaemon(true); return thread; }, new ThreadPoolExecutor.AbortPolicy());
    private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(8 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap bitmap) { return bitmap.getAllocationByteCount(); }
    };
    private final ArrayList<Entry> entries = new ArrayList<>();
    private final ArrayList<Future<?>> pending = new ArrayList<>();
    private final Runnable loadVisible = this::loadVisible;
    private long generation;
    private boolean closed;
    private final int edge;

    AtomicWorkbenchThumbnailLoader(Context context) {
        this.context = context.getApplicationContext(); edge = Math.max(48, Math.min(256, Math.round(48 * context.getResources().getDisplayMetrics().density)));
    }
    void bind(ImageView view, AtomicWorkbenchContentItem item) {
        Entry entry = new Entry(view, item, generation); entries.add(entry); view.setTag(entry);
        Bitmap ready = cache.get(item.historyKey());
        if (ready != null) { view.setImageBitmap(ready); entry.requested = true; }
        schedule();
    }
    void schedule() { if (!closed) { main.removeCallbacks(loadVisible); main.postDelayed(loadVisible, 120L); } }
    private void loadVisible() {
        if (closed) return;
        pending.removeIf(Future::isDone);
        for (Entry entry : entries) {
            if (entry.requested || !entry.view.isShown() || !entry.view.getGlobalVisibleRect(new Rect())) continue;
            entry.requested = true;
            try { pending.add(worker.submit(() -> decode(entry))); }
            catch (java.util.concurrent.RejectedExecutionException busy) { entry.requested = false; }
        }
    }
    private void decode(Entry entry) {
        Bitmap bitmap = null;
        try {
            Uri uri = Uri.parse(entry.item.uri);
            {
                try { bitmap = context.getContentResolver().loadThumbnail(uri, new Size(edge, edge), null); }
                catch (Exception unsupportedThumbnail) { }
            }
            if (bitmap == null && entry.item.image() && !Thread.currentThread().isInterrupted()) {
                BitmapFactory.Options options = new BitmapFactory.Options(); options.inJustDecodeBounds = true;
                try (InputStream input = context.getContentResolver().openInputStream(uri)) { BitmapFactory.decodeStream(input, null, options); }
                options.inJustDecodeBounds = false; options.inSampleSize = 1;
                while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > edge * 2) options.inSampleSize *= 2;
                if (!Thread.currentThread().isInterrupted())
                    try (InputStream input = context.getContentResolver().openInputStream(uri)) { bitmap = BitmapFactory.decodeStream(input, null, options); }
            }
        } catch (Exception | OutOfMemoryError unavailable) { }
        Bitmap ready = bitmap;
        main.post(() -> {
            if (closed || generation != entry.generation || entry.view.getTag() != entry) { if (ready != null) ready.recycle(); return; }
            if (ready != null) { cache.put(entry.item.historyKey(), ready); entry.view.setImageBitmap(ready); }
        });
    }
    void reset() {
        ++generation; main.removeCallbacks(loadVisible);
        for (Future<?> task : pending) task.cancel(true);
        pending.clear(); worker.purge(); entries.clear();
    }
    @Override public void close() { closed = true; reset(); worker.shutdownNow(); cache.evictAll(); }
}
