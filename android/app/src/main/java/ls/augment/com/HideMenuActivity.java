package ls.augment.com;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.LinearLayout;

public final class HideMenuActivity extends Activity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        UiKit ui=new UiKit(this);LinearLayout page=ui.scrollPage();
        page.addView(ui.header("消失吧APP",true));
        String[] titles={"应用管理","自动隐藏","快捷磁贴"};
        String[] descriptions={"按空间选择应用，执行隐藏或显示。","锁屏时自动隐藏指定应用。","设置磁贴图片、名称和说明。"};
        for(int i=0;i<titles.length;i++) {
            final int section=i;
            page.addView(ui.categoryCard("",titles[i],descriptions[i],"",v->startActivity(new Intent(this,HideAppsActivity.class).putExtra("section",section))),ui.margins(0,10,0,0));
        }
    }
}
