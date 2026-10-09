package ls.augment.privacycamerafixture;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.Size;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.Collections;

/** Temporary non-fullscreen preview. Frames go only to the visible SurfaceView. */
public final class PrivacyCameraActivity extends Activity implements SurfaceHolder.Callback {
    private static final String TAG = "DuoPrivacyCameraFixture";
    private static final long MAX_OPEN_MS = 120_000L;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private CameraDevice camera;
    private CameraCaptureSession session;
    private SurfaceView preview;
    private TextView status;
    private Button end;
    private boolean resumed, opening, ended, surfaceReady;
    private int generation;
    private long deadline;
    private final Runnable timeout = () -> stop("已关闭：达到 120 秒上限");

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        setTitle("隐私指示器验证");
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE);
        if (android.os.Build.VERSION.SDK_INT >= 30) {
            getWindow().setDecorFitsSystemWindows(true);
            WindowInsetsController insets = getWindow().getInsetsController();
            if (insets != null) insets.show(WindowInsets.Type.statusBars() | WindowInsets.Type.navigationBars());
        }
        ScrollView scroll = new ScrollView(this);
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(dp(16), dp(8), dp(16), dp(16));
        scroll.addView(body);
        status = text("等待授权：尚未使用相机", 16);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        body.addView(status, row());
        body.addView(text("此临时页面显示本地实时预览，用于观察系统原生隐私提示。\n不会拍照、录制、读取、保存或发送画面。", 14), row());
        body.addView(text("始终保留状态栏。最多运行 120 秒；离开页面或点击结束会立即关闭相机。", 14), row());
        end = new Button(this);
        end.setText("结束验证");
        end.setMinHeight(dp(48));
        end.setOnClickListener(v -> { if (ended) finish(); else stop("已关闭：手动结束"); });
        body.addView(end, row());
        preview = new SurfaceView(this);
        preview.setContentDescription("本地实时相机预览");
        preview.getHolder().addCallback(this);
        body.addView(preview, new LinearLayout.LayoutParams(-1, dp(240)));
        setContentView(scroll);
    }

    @Override public void onResume() {
        super.onResume();
        resumed = true;
        startCamera();
    }

    private void startCamera() {
        if (ended || opening || camera != null) return;
        if (checkSelfPermission(Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            show("等待授权：未授予 CAMERA，相机未打开");
            return; // Never request permission or redirect the user to settings.
        }
        if (!resumed || !surfaceReady || !preview.getHolder().getSurface().isValid()) {
            show("等待预览窗口：尚未打开相机");
            return;
        }
        final int token = ++generation;
        deadline = SystemClock.elapsedRealtime() + MAX_OPEN_MS;
        handler.postDelayed(timeout, MAX_OPEN_MS);
        opening = true;
        show("正在打开：准备本地预览");
        try {
            CameraManager manager = getSystemService(CameraManager.class);
            String chosen = null;
            for (String id : manager.getCameraIdList()) {
                if (chosen == null) chosen = id;
                Integer facing = manager.getCameraCharacteristics(id).get(CameraCharacteristics.LENS_FACING);
                if (Integer.valueOf(CameraCharacteristics.LENS_FACING_BACK).equals(facing)) { chosen = id; break; }
            }
            if (chosen == null) { stop("错误：没有可用相机，句柄已关闭"); return; }
            StreamConfigurationMap streams = manager.getCameraCharacteristics(chosen)
                    .get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
            Size[] available = streams == null ? null : streams.getOutputSizes(SurfaceHolder.class);
            Size size = null;
            if (available != null) for (Size option : available) {
                if (size == null || (long)option.getWidth()*option.getHeight() < (long)size.getWidth()*size.getHeight()) size = option;
                if (option.getWidth() == 640 && option.getHeight() == 480) { size = option; break; }
            }
            if (size == null) { stop("错误：相机不支持可见预览窗口"); return; }
            preview.getHolder().setFixedSize(size.getWidth(), size.getHeight());
            manager.openCamera(chosen, new CameraDevice.StateCallback() {
                @Override public void onOpened(CameraDevice device) {
                    if (token != generation || !resumed || ended || SystemClock.elapsedRealtime() >= deadline) {
                        device.close();
                        return;
                    }
                    opening = false;
                    camera = device;
                    show("已打开：正在配置本地预览");
                    startPreview(device, token);
                }
                @Override public void onDisconnected(CameraDevice device) {
                    device.close();
                    if (token == generation) stop("已关闭：相机连接断开");
                }
                @Override public void onError(CameraDevice device, int error) {
                    device.close();
                    if (token == generation) stop("错误：相机错误 " + error + "，句柄已关闭");
                }
            }, handler);
        } catch (Exception error) {
            stop("错误：" + error.getClass().getSimpleName() + "，相机句柄已关闭");
        }
    }

    private void startPreview(CameraDevice device, int token) {
        Surface surface = preview.getHolder().getSurface();
        if (!surfaceReady || !surface.isValid()) { stop("已关闭：预览窗口不可用"); return; }
        try {
            // The sole output is visible. No ImageReader/recorder/encoder or CPU readback.
            device.createCaptureSession(Collections.singletonList(surface), new CameraCaptureSession.StateCallback() {
                @Override public void onConfigured(CameraCaptureSession configured) {
                    if (token != generation || ended || !resumed || !surfaceReady
                            || camera != device || !surface.isValid() || SystemClock.elapsedRealtime() >= deadline) {
                        configured.close();
                        return;
                    }
                    session = configured;
                    try {
                        CaptureRequest.Builder request = device.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
                        request.addTarget(surface);
                        configured.setRepeatingRequest(request.build(), null, handler);
                        show("预览中：请求已提交\n画面仅在本页显示，120 秒内自动关闭");
                    } catch (Exception error) { stop("错误：预览请求失败，句柄已关闭"); }
                }
                @Override public void onConfigureFailed(CameraCaptureSession failed) {
                    failed.close();
                    if (token == generation) stop("错误：预览配置失败，句柄已关闭");
                }
            }, handler);
        } catch (Exception error) { stop("错误：无法建立本地预览，句柄已关闭"); }
    }

    @Override public void surfaceCreated(SurfaceHolder holder) {
        surfaceReady = true;
        if (resumed) startCamera();
    }
    @Override public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        surfaceReady = holder.getSurface().isValid();
        if (resumed) startCamera();
    }
    @Override public void surfaceDestroyed(SurfaceHolder holder) {
        surfaceReady = false;
        if (!ended) stop("已关闭：预览窗口销毁");
    }

    private void stop(String message) {
        ended = true;
        opening = false;
        ++generation; // Invalidates an asynchronous open callback arriving after pause/timeout.
        handler.removeCallbacks(timeout);
        CameraCaptureSession ownedSession = session;
        session = null;
        if (ownedSession != null) {
            try { ownedSession.stopRepeating(); } catch (Exception ignored) {}
            ownedSession.close();
        }
        CameraDevice owned = camera;
        camera = null;
        if (owned != null) owned.close();
        if (preview != null) preview.setVisibility(View.GONE);
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        show(message);
        if (end != null) end.setText("退出");
    }

    @Override public void onPause() {
        resumed = false;
        stop("已关闭：页面离开前台");
        super.onPause();
    }

    @Override public void onDestroy() {
        resumed = false;
        stop("已关闭：页面销毁");
        super.onDestroy();
    }

    private void show(String message) {
        if (status != null) status.setText(message);
        Log.i(TAG, message);
    }
    private TextView text(String value, int sp) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextIsSelectable(true);
        return view;
    }
    private LinearLayout.LayoutParams row() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = dp(12);
        return params;
    }
    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
