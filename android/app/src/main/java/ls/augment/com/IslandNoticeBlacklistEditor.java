package ls.augment.com;

import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.util.function.Consumer;
import java.util.function.Supplier;

final class IslandNoticeBlacklistEditor {
    private final Activity activity;
    private final UiKit ui;
    private final Supplier<String> read;
    private final Consumer<String> write;
    private final LinearLayout content;
    private final int user=android.os.Process.myUid()/100000;
    IslandNoticeBlacklistEditor(Activity activity,UiKit ui,Supplier<String> read,Consumer<String> write) {
        this.activity=activity;this.ui=ui;this.read=read;this.write=write;
        content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);render();
    }
    View view(){return content;}
    private void render() {
        content.removeAllViews();IslandNoticeBlacklist value=IslandNoticeBlacklist.parse(read.get());
        Button edit=ui.textButton("通知黑名单 · "+(value==null?"配置无效":value.packages(user).size()+" 个应用"));
        edit.setTag("island-notice-blacklist");
        edit.setOnClickListener(v->{
            IslandNoticeBlacklist current=IslandNoticeBlacklist.parse(read.get());
            if(current==null)return;
            AppSelectionDialog.notifications(activity,ui,"通知黑名单",String.join(";",current.packages(user)),selected->{
                if(activity.isDestroyed()||activity.isFinishing()||!content.isShown())return;
                IslandNoticeBlacklist latest=IslandNoticeBlacklist.parse(read.get());
                String next=latest==null?null:latest.updated(user,selected);
                if(next==null){Toast.makeText(activity,"最多选择128个应用，请减少选择后重试",Toast.LENGTH_SHORT).show();return;}
                write.accept(next);render();
            });
        });
        content.addView(edit,ui.wrap());
        content.addView(ui.text("仅阻止名单中的普通通知在红魔Duo上岛，系统通知与原厂提醒保持原样。音乐、导航和上传下载由各自场景控制。",12,ui.muted,false),ui.wrap());
    }
}
