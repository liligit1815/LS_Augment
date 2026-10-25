package ls.augment.com;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.os.SystemClock;
import android.view.Surface;
import android.view.TextureView;

/** A stable VD consumer. Role/size changes retain the last buffer and expose real frame updates. */
final class AtomicWorkbenchSurface extends TextureView implements TextureView.SurfaceTextureListener {
    interface Callback {
        void surfaceCreated(Output output);
        void surfaceChanged(Output output, int format, int width, int height);
        void surfaceDestroyed(Output output);
        void frameAvailable(long frame, long elapsed);
    }

    final class Output {
        private Surface surface;
        private int width = 1, height = 1;
        private boolean dimensionChangePending;
        private Callback callback;
        Surface getSurface() { return bufferConfigured ? surface : null; }
        boolean isValid() { return bufferConfigured && surface != null && surface.isValid(); }
        void setFixedSize(int width, int height) {
            if (width < 1 || height < 1) throw new IllegalArgumentException("invalid output dimensions");
            boolean changed = this.width != width || this.height != height;
            this.width = width; this.height = height;
            dimensionChangePending |= changed;
            if (changed) ++bufferGeometryGeneration;
            // Even an unchanged request must repair a framework overwrite of the buffer size.
            if (activeTexture == null || !configureBuffer(false)) return;
            if (surface == null) activateProducer();
            else notifyDimensionsChanged();
        }
        void addCallback(Callback value) { callback = value; }
    }

    private final Output output = new Output();
    private long frames, lastFrameElapsed, frameTimestampNanos, frameObservedNanos;
    private SurfaceTexture activeTexture;
    private boolean bufferConfigured;
    private int viewWidth, viewHeight, configuredWidth, configuredHeight;
    private long bufferApplyAttempts, bufferApplySequence, resizeRepairs, bufferApplyFailures;
    private long surfaceGeneration, lastFrameBufferSequence;
    private long bufferGeometryGeneration = 1L, lastFrameGeometryGeneration;
    private boolean geometryRecoveryPending;
    private String bufferError = "";
    private boolean dispatchingCallbacks, creationNotificationPending, dimensionDrainPosted;
    private final Runnable dimensionDrain = () -> { dimensionDrainPosted = false; notifyDimensionsChanged(); };

    AtomicWorkbenchSurface(Context context) {
        super(context);
        setOpaque(true);
        setSurfaceTextureListener(this);
    }

    Output getHolder() { return output; }
    long frameCount() { return frames; }
    long lastFrameElapsed() { return lastFrameElapsed; }
    long lastFrameTimestampNanos() { return frameTimestampNanos; }
    long lastFrameObservedNanos() { return frameObservedNanos; }
    long bufferGeometryGeneration() { return bufferGeometryGeneration; }
    long lastFrameGeometryGeneration() { return lastFrameGeometryGeneration; }
    /** A callback followed this geometry configuration; this does not inspect the buffer's pixels. */
    boolean isFrameFromConfiguredGeometry() {
        return output.isValid() && frames > 0 && lastFrameGeometryGeneration == bufferGeometryGeneration;
    }
    // Legacy conversion only; SurfaceTexture does not establish this producer's clock domain.
    long lastFrameUptimeMillis() { return frameTimestampNanos > 0 ? frameTimestampNanos / 1000000L : -1L; }

    /** Configuration acknowledgements and callback metadata, never a claim about frame contents. */
    String diagnosticState() {
        return "buffer_expected_width=" + output.width + ";buffer_expected_height=" + output.height
                + ";buffer_configured_width=" + configuredWidth + ";buffer_configured_height=" + configuredHeight
                + ";buffer_configured=" + bufferConfigured + ";texture_view_width=" + viewWidth + ";texture_view_height=" + viewHeight
                + ";buffer_apply_count=" + bufferApplyAttempts + ";buffer_apply_seq=" + bufferApplySequence
                + ";buffer_resize_repairs=" + resizeRepairs + ";buffer_apply_failures=" + bufferApplyFailures
                + ";buffer_error=" + bufferError + ";surface_generation=" + surfaceGeneration
                + ";frame_raw_ns=" + frameTimestampNanos + ";frame_observed_elapsed=" + lastFrameElapsed
                + ";frame_observed_nano_ns=" + frameObservedNanos
                + ";frame_observed_buffer_seq=" + lastFrameBufferSequence + ";frames=" + frames
                + ";buffer_geometry_generation=" + bufferGeometryGeneration + ";frame_geometry_generation=" + lastFrameGeometryGeneration
                + ";frame_from_configured_geometry=" + isFrameFromConfiguredGeometry()
                + ";texture_active=" + (activeTexture != null) + ";surface_valid=" + output.isValid()
                + ";buffer_evidence=set_default_ack;frame_geometry_evidence=callback_after_configuration"
                + ";frame_clock=producer_unspecified;frame_observation_clock=system_nano_time";
    }

    private boolean configureBuffer(boolean resize) {
        if (activeTexture == null) return false;
        ++bufferApplyAttempts;
        try {
            activeTexture.setDefaultBufferSize(output.width, output.height);
            if (geometryRecoveryPending) { ++bufferGeometryGeneration; geometryRecoveryPending = false; }
            configuredWidth = output.width; configuredHeight = output.height;
            bufferConfigured = true; bufferError = ""; ++bufferApplySequence;
            if (resize) ++resizeRepairs;
            return true;
        } catch (RuntimeException unavailable) {
            bufferConfigured = false; configuredWidth = configuredHeight = 0;
            geometryRecoveryPending = true;
            bufferError = unavailable.getClass().getSimpleName(); ++bufferApplyFailures;
            return false;
        }
    }

    private void activateProducer() {
        if (!bufferConfigured || activeTexture == null || output.surface != null) return;
        output.surface = new Surface(activeTexture);
        ++surfaceGeneration;
        frames = lastFrameElapsed = frameTimestampNanos = frameObservedNanos = lastFrameBufferSequence = lastFrameGeometryGeneration = 0;
        creationNotificationPending = true;
        output.dimensionChangePending = true;
        notifyDimensionsChanged();
    }

    private void notifyDimensionsChanged() {
        // Slot callbacks can prepare the same producer synchronously. Treat creation and
        // dimension delivery as one transaction so they cannot start a nested HOME request.
        if (dispatchingCallbacks) return;
        dispatchingCallbacks = true;
        try {
            int delivered = 0;
            while (output.isValid() && output.callback != null && delivered++ < 16) {
                if (creationNotificationPending) {
                    creationNotificationPending = false;
                    output.callback.surfaceCreated(output);
                } else if (output.dimensionChangePending) {
                    int width = output.width, height = output.height;
                    // Consume before entering client code. A genuinely different reentrant
                    // size sets pending again and is delivered after this callback returns.
                    output.dimensionChangePending = false;
                    output.callback.surfaceChanged(output, 1, width, height);
                } else break;
            }
        } finally { dispatchingCallbacks = false; }
        // Bound synchronous work if a client repeatedly changes dimensions in its callback.
        if (output.isValid() && output.callback != null && (creationNotificationPending || output.dimensionChangePending)
                && !dimensionDrainPosted) {
            dimensionDrainPosted = true;
            if (!post(dimensionDrain)) dimensionDrainPosted = false;
        }
    }

    @Override public void onSurfaceTextureAvailable(SurfaceTexture texture, int width, int height) {
        viewWidth = width; viewHeight = height;
        if (activeTexture == texture && (width != output.width || height != output.height)) ++bufferGeometryGeneration;
        if (activeTexture != texture) {
            if (output.surface != null) output.surface.release();
            output.surface = null; activeTexture = texture;
            bufferConfigured = false;
            frames = lastFrameElapsed = frameTimestampNanos = frameObservedNanos = lastFrameBufferSequence = lastFrameGeometryGeneration = 0;
        }
        // TextureView.getTextureLayer sets the View size before notifying availability.
        if (configureBuffer(false)) {
            if (output.surface == null) activateProducer(); else notifyDimensionsChanged();
        }
    }

    @Override public void onSurfaceTextureSizeChanged(SurfaceTexture texture, int width, int height) {
        if (texture != activeTexture) return;
        viewWidth = width; viewHeight = height;
        if (width != output.width || height != output.height) ++bufferGeometryGeneration;
        // The ROM's TextureView.onSizeChanged first writes the View dimensions to the
        // SurfaceTexture. Restore the VD dimensions without replacing its producer.
        if (configureBuffer(true)) {
            if (output.surface == null) activateProducer(); else notifyDimensionsChanged();
        }
    }

    @Override public boolean onSurfaceTextureDestroyed(SurfaceTexture texture) {
        if (texture != activeTexture) return true;
        if (output.surface != null && output.callback != null) output.callback.surfaceDestroyed(output);
        if (output.surface != null) output.surface.release();
        output.surface = null; activeTexture = null; bufferConfigured = false;
        creationNotificationPending = false; output.dimensionChangePending = false;
        viewWidth = viewHeight = configuredWidth = configuredHeight = 0;
        frames = lastFrameElapsed = frameTimestampNanos = frameObservedNanos = lastFrameBufferSequence = lastFrameGeometryGeneration = 0;
        return true;
    }

    @Override public void onSurfaceTextureUpdated(SurfaceTexture texture) {
        if (texture != activeTexture || !output.isValid()) return;
        frameTimestampNanos = texture.getTimestamp();
        frameObservedNanos = System.nanoTime();
        lastFrameElapsed = SystemClock.elapsedRealtime();
        lastFrameBufferSequence = bufferApplySequence;
        lastFrameGeometryGeneration = bufferGeometryGeneration;
        ++frames;
        if (output.callback != null) output.callback.frameAvailable(frames, lastFrameElapsed);
    }
}
