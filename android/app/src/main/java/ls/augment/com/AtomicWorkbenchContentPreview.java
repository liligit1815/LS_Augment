package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.TextView;
import android.widget.VideoView;
import java.io.InputStream;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Real phone decoder preview. Source references remain private until separately staged. */
final class AtomicWorkbenchContentPreview implements AutoCloseable {
    private static final ThreadPoolExecutor DECODERS = new ThreadPoolExecutor(1, 2, 20L, TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(4), task -> {
                Thread thread = new Thread(task, "DuoContentPreview"); thread.setDaemon(true); return thread;
            }, new ThreadPoolExecutor.AbortPolicy());
    private final Activity activity;
    private final UiKit ui;
    private final AtomicWorkbenchContentItem item;
    private final Runnable add, open, segment;
    private final String primaryLabel;
    private Dialog dialog;
    private VideoView video;
    private ImageView imageView;
    private Drawable drawable;
    private Bitmap bitmap;
    private volatile boolean closed;
    private Future<?> decoding;

    AtomicWorkbenchContentPreview(Activity activity, UiKit ui, AtomicWorkbenchContentItem item, Runnable add, Runnable open) {
        this(activity, ui, item, "添加到流转", add, open);
    }
    AtomicWorkbenchContentPreview(Activity activity, UiKit ui, AtomicWorkbenchContentItem item,
            String primaryLabel, Runnable primary, Runnable open) {
        this(activity, ui, item, primaryLabel, primary, open, null);
    }
    AtomicWorkbenchContentPreview(Activity activity, UiKit ui, AtomicWorkbenchContentItem item,
            String primaryLabel, Runnable primary, Runnable open, Runnable segment) {
        this.activity = activity; this.ui = ui; this.item = item; this.add = primary; this.open = open; this.primaryLabel = primaryLabel; this.segment = segment;
    }

    void show() {
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        TextView state = ui.text(item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? item.text()
                : item.name + "\n" + item.mime, 13, ui.text, false);
        state.setTextIsSelectable(true); body.addView(state, ui.wrap());
        if (item.image()) {
            ImageView image = new ImageView(activity); image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView = image;
            image.setContentDescription("图片预览"); body.addView(image, new LinearLayout.LayoutParams(-1, ui.dp(240)));
            state.setText("正在读取图片…");
            try { decoding = DECODERS.submit(() -> decode(image, state)); }
            catch (java.util.concurrent.RejectedExecutionException busy) { state.setText("预览正在读取其他图片，请稍后重试"); }
        } else if (item.video()) {
            video = new VideoView(activity); body.addView(video, new LinearLayout.LayoutParams(-1, ui.dp(240)));
            MediaController controls = new MediaController(activity); controls.setAnchorView(video); video.setMediaController(controls);
            video.setOnPreparedListener(player -> { if (!closed) { video.seekTo(1); controls.show(0); } });
            video.setOnErrorListener((player, what, extra) -> { state.setText("此视频暂时无法预览，可尝试用手机应用打开"); return true; });
            try { video.setVideoURI(Uri.parse(item.uri)); }
            catch (RuntimeException unavailable) { state.setText("视频已变化或访问权限已失效，请刷新后重试"); }
        }
        LinearLayout actions = new LinearLayout(activity);
        if (add != null) {
            Button use = ui.button(primaryLabel); use.setMinimumHeight(ui.dp(48));
            use.setOnClickListener(v -> { close(); add.run(); }); actions.addView(use, new LinearLayout.LayoutParams(0, -2, 1));
        }
        if (item.kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD && open != null) {
            Button view = ui.button("用手机应用打开"); view.setMinimumHeight(ui.dp(48));
            view.setOnClickListener(v -> { close(); open.run(); }); actions.addView(view, new LinearLayout.LayoutParams(0, -2, 1));
        }
        if (item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD && segment != null) {
            Button words = ui.button("分词"); words.setMinimumHeight(ui.dp(48));
            words.setOnClickListener(v -> { close(); segment.run(); }); actions.addView(words, new LinearLayout.LayoutParams(0, -2, 1));
        }
        body.addView(actions, ui.margins(0, 8, 0, 0));
        dialog = ui.glassDialog("内容预览", body, null, null, "关闭");
        dialog.setOnDismissListener(ignored -> release());
    }

    private void decode(ImageView target, TextView state) {
        Drawable result = null; Bitmap decoded = null;
        try {
            if (closed || Thread.currentThread().isInterrupted()) return;
            {
                result = ImageDecoder.decodeDrawable(ImageDecoder.createSource(activity.getContentResolver(), Uri.parse(item.uri)), (decoder, info, source) -> {
                    int width = info.getSize().getWidth(), height = info.getSize().getHeight();
                    float scale = Math.min(1f, 2048f / Math.max(width, height));
                    decoder.setTargetSize(Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale)));
                });
            }
        } catch (Exception | OutOfMemoryError unavailable) { }
        Drawable ready = result; Bitmap readyBitmap = decoded;
        activity.runOnUiThread(() -> {
            if (closed || activity.isDestroyed()) { if (readyBitmap != null) readyBitmap.recycle(); return; }
            drawable = ready; bitmap = readyBitmap;
            if (ready != null) {
                target.setImageDrawable(ready);
                if (ready instanceof AnimatedImageDrawable) ((AnimatedImageDrawable) ready).start();
            } else if (readyBitmap != null) target.setImageBitmap(readyBitmap);
            state.setText(ready == null && readyBitmap == null ? "图片已变化、格式不支持或访问权限失效，请刷新后重试" : item.name);
        });
    }
    private void release() {
        closed = true;
        if (decoding != null) { decoding.cancel(true); decoding = null; DECODERS.purge(); }
        if (video != null) { video.stopPlayback(); video = null; }
        if (imageView != null) { imageView.setImageDrawable(null); imageView = null; }
        if (drawable instanceof AnimatedImageDrawable) ((AnimatedImageDrawable) drawable).stop();
        drawable = null;
        if (bitmap != null) { bitmap.recycle(); bitmap = null; }
    }
    @Override public void close() { if (dialog != null) { dialog.dismiss(); dialog = null; } release(); }
}
