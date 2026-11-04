package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.widget.Toast;

/** Stock barcode readers return the decoded text to their caller. */
public final class StepBarcodeActivity extends Activity {
    private static final String SCAN = "com.google.zxing.client.android.SCAN";
    private static final String RESULT = "SCAN_RESULT";
    private static final int READ_CODE = 41;
    private Dialog resultDialog;

    public static ComponentName decoder(Context context) {
        PackageManager pm = context.getPackageManager();
        for (ResolveInfo entry : pm.queryIntentActivities(new Intent(SCAN),
                PackageManager.MATCH_DEFAULT_ONLY | PackageManager.MATCH_SYSTEM_ONLY)) {
            ActivityInfo info = entry.activityInfo;
            if (info != null && info.exported && info.enabled && info.applicationInfo.enabled &&
                    (info.permission == null || pm.checkPermission(info.permission, "ls.augment.com")
                            == PackageManager.PERMISSION_GRANTED)) {
                return new ComponentName(info.packageName, info.name);
            }
        }
        return null;
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) {
            String retained = (String) getLastNonConfigurationInstance();
            if (retained != null) showResult(retained);
            else if (state.getBoolean("resultShown")) finish();
            return;
        }
        ComponentName target = decoder(this);
        if (target != null) {
            try {
                startActivityForResult(new Intent(SCAN).setComponent(target).putExtra("SCAN_MODE", "QR_CODE_MODE"), READ_CODE);
                return;
            } catch (ActivityNotFoundException | SecurityException unavailable) { /* The provider may have changed. */ }
        }
        Toast.makeText(this, "系统扫码服务不可用", Toast.LENGTH_SHORT).show();
        finish();
    }

    private String resultText;
    private void showResult(String text) {
        resultText = text;
        resultDialog = new UiKit(this).glassDialog("扫码结果", text, "关闭", this::finish, null);
        resultDialog.setOnCancelListener(dialog -> finish());
    }

    @Override protected void onActivityResult(int request, int status, Intent data) {
        super.onActivityResult(request, status, data);
        if (request != READ_CODE) return;
        String value = status == RESULT_OK && data != null ? data.getStringExtra(RESULT) : null;
        if (value == null || value.isEmpty()) finish();
        else showResult(value);
    }

    @Override public Object onRetainNonConfigurationInstance() { return resultText; }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putBoolean("resultShown", resultText != null);
    }

    @Override protected void onDestroy() {
        if (resultDialog != null) resultDialog.dismiss();
        super.onDestroy();
    }
}
