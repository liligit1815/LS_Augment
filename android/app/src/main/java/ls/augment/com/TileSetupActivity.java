package ls.augment.com;

import android.app.Activity;
import android.app.StatusBarManager;
import android.content.ComponentName;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

/**
 * Foreground trampoline for Android 13+ Quick Settings Placement API.
 * The platform requires the requesting app to be in the foreground.
 */
public final class TileSetupActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        registerSystemBackCallback();
        if (Build.VERSION.SDK_INT < 33) {
            Toast.makeText(this, "当前系统请在快捷设置编辑页手动添加 LS_Augment", Toast.LENGTH_LONG).show();
            finish();
            return;
        }
        StatusBarManager manager = getSystemService(StatusBarManager.class);
        if (manager == null) {
            Toast.makeText(this, "无法连接 SystemUI", Toast.LENGTH_LONG).show();
            finish();
            return;
        }
        ComponentName component = new ComponentName(this, AugmentTileService.class);
        Icon icon = Icon.createWithResource(this, R.drawable.ic_tile);
        try {
            manager.requestAddTileService(
                    component,
                    TilePresentation.label(this),
                    icon,
                    getMainExecutor(),
                    result -> {
                        String text;
                        if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ADDED) {
                            text = "LS_Augment 磁贴已添加";
                        } else if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ALREADY_ADDED) {
                            text = "LS_Augment 磁贴已存在";
                        } else if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_NOT_ADDED) {
                            text = "未添加 LS_Augment 磁贴";
                        } else {
                            text = "添加磁贴失败，代码 " + result;
                        }
                        Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
                        finish();
                    });
        } catch (Throwable error) {
            Toast.makeText(this, "添加磁贴失败: " + error.getClass().getSimpleName(), Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override
    public void onBackPressed() {
        finish();
    }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::finish);
    }
}
