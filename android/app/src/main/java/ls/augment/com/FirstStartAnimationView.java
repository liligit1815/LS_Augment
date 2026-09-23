package ls.augment.com;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.widget.FrameLayout;

/** A bounded, muted platform decoder for the device's original boot-animation frames. */
final class FirstStartAnimationView extends FrameLayout implements TextureView.SurfaceTextureListener {
    private final TextureView texture;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable finished;
    private final Runnable timeout = () -> complete("decoder timeout");
    private MediaPlayer player;
    private Surface surface;
    private boolean resumed, prepared, seeking, released, completed;
    private int position, duration = 2000, videoWidth = 608, videoHeight = 1344;

    FirstStartAnimationView(Context context, int restoredPosition, Runnable finished) {
        super(context);
        this.finished = finished;
        position = Math.max(0, restoredPosition);
        setBackgroundColor(Color.BLACK);
        setContentDescription("红魔原厂开机动画");
        texture = new TextureView(context);
        texture.setOpaque(true);
        texture.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        texture.setSurfaceTextureListener(this);
        addView(texture, new FrameLayout.LayoutParams(-1, -1));
    }

    void resumePlayback() {
        if (released || completed) return;
        resumed = true;
        main.removeCallbacks(timeout);
        main.postDelayed(timeout, 6000);
        if (player == null && surface != null) open();
        else startWhenReady();
    }

    void pausePlayback() {
        resumed = false;
        rememberPosition();
        releasePlayer();
    }

    int positionMs() { rememberPosition(); return position; }

    void release() {
        if (released) return;
        released = true;
        resumed = false;
        releasePlayer();
        if (surface != null) { surface.release(); surface = null; }
    }

    private void open() {
        if (released || completed || !resumed || surface == null) return;
        try {
            MediaPlayer next = new MediaPlayer();
            player = next;
            next.setSurface(surface);
            next.setVolume(0f, 0f);
            next.setLooping(false);
            next.setOnVideoSizeChangedListener((current, width, height) -> {
                if (current != player || width <= 0 || height <= 0) return;
                videoWidth = width; videoHeight = height; fitVideo();
            });
            next.setOnPreparedListener(current -> {
                if (current != player || released || completed) return;
                prepared = true;
                duration = Math.max(1, current.getDuration());
                if (position >= duration - 30) { complete(null); return; }
                if (position > 0) {
                    seeking = true;
                    current.seekTo((long) position, MediaPlayer.SEEK_CLOSEST);
                } else startWhenReady();
            });
            next.setOnSeekCompleteListener(current -> {
                if (current != player) return;
                seeking = false;
                startWhenReady();
            });
            next.setOnCompletionListener(current -> {
                if (current == player) complete(null);
            });
            next.setOnErrorListener((current, what, extra) -> {
                if (current == player) complete("media error " + what + "/" + extra);
                return true;
            });
            try (AssetFileDescriptor asset = getResources().openRawResourceFd(R.raw.redmagic_first_start)) {
                if (asset == null) throw new IllegalStateException("Missing first-start animation");
                next.setDataSource(asset.getFileDescriptor(), asset.getStartOffset(), asset.getLength());
            }
            next.prepareAsync();
            main.removeCallbacks(timeout);
            main.postDelayed(timeout, 6000);
        } catch (Exception | LinkageError | OutOfMemoryError error) {
            complete(error.getClass().getSimpleName());
        }
    }

    private void startWhenReady() {
        if (!resumed || released || completed || !prepared || seeking || player == null) return;
        try {
            player.start();
            main.removeCallbacks(timeout);
            main.postDelayed(timeout, Math.max(1000, duration - position + 2000));
        } catch (IllegalStateException failure) {
            complete("cannot start decoder");
        }
    }

    private void rememberPosition() {
        if (player != null && prepared && !seeking) {
            try { position = Math.max(position, player.getCurrentPosition()); }
            catch (IllegalStateException ignored) { }
        }
    }

    private void complete(String failure) {
        if (completed || released) return;
        completed = true;
        if (failure != null) Log.w("FirstStartAnimation", "Continue to welcome: " + failure);
        releasePlayer();
        finished.run();
    }

    private void releasePlayer() {
        main.removeCallbacks(timeout);
        MediaPlayer old = player;
        player = null;
        prepared = false;
        seeking = false;
        if (old != null) {
            old.setOnPreparedListener(null);
            old.setOnSeekCompleteListener(null);
            old.setOnCompletionListener(null);
            old.setOnErrorListener(null);
            old.setOnVideoSizeChangedListener(null);
            old.release();
        }
    }

    private void fitVideo() {
        int width = texture.getWidth(), height = texture.getHeight();
        if (width <= 0 || height <= 0) return;
        float scale = Math.min(width / (float) videoWidth, height / (float) videoHeight);
        Matrix matrix = new Matrix();
        matrix.setScale(videoWidth * scale / width, videoHeight * scale / height, width / 2f, height / 2f);
        texture.setTransform(matrix);
    }

    @Override public void onSurfaceTextureAvailable(SurfaceTexture value, int width, int height) {
        if (released) return;
        try {
            surface = new Surface(value);
            fitVideo();
            if (resumed) open();
        } catch (RuntimeException | OutOfMemoryError failure) {
            complete("surface unavailable");
        }
    }

    @Override public void onSurfaceTextureSizeChanged(SurfaceTexture value, int width, int height) { fitVideo(); }
    @Override public void onSurfaceTextureUpdated(SurfaceTexture value) { }
    @Override public boolean onSurfaceTextureDestroyed(SurfaceTexture value) {
        rememberPosition();
        releasePlayer();
        if (surface != null) { surface.release(); surface = null; }
        return true;
    }
    @Override protected void onDetachedFromWindow() { release(); super.onDetachedFromWindow(); }
}
