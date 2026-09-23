package ls.augment.validation;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;

/** Synthetic, empty-content target for FLAG_SECURE screenshot validation. */
public final class SecureTestActivity extends Activity {
    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        TextView view=new TextView(this);view.setBackgroundColor(Color.WHITE);view.setTextColor(0xff12345a);view.setTextSize(26);view.setGravity(Gravity.CENTER);
        view.setText("LS 安全截图测试\n\nFLAG_SECURE 已启用\n此页没有个人数据");view.setContentDescription("fixture_secure_page");setContentView(view);
        android.util.Log.i("LSA-Validation","secure_fixture_opened;flag_secure=true");
    }
}
