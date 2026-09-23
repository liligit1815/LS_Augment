package ls.augment.com;

import android.app.Activity;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.TextView;

/** The About destination contains the entry; this page contains the contributor list. */
public final class ContributorsActivity extends Activity {
    private static final String[] NAMES={"卒迹","绀漓丨Sevtinge","红魔助手开发团队","HyperCeiler开发团队"};
    private static final String[] DONORS={"kj2548","福福","隐隐约约月"};

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        UiKit ui=new UiKit(this);
        LinearLayout page=ui.detailPage("贡献者",null);
        page.setPadding(ui.dp(14),ui.dp(8),ui.dp(14),ui.dp(24));
        page.addView(ui.text("感谢以下个人与团队的贡献和支持。",11.5f,ui.muted,false),ui.margins(2,0,2,10));
        LinearLayout people=ui.card(); people.setPadding(ui.dp(12),ui.dp(2),ui.dp(12),ui.dp(2));
        for(int i=0;i<NAMES.length;i++) {
            LinearLayout row=new LinearLayout(this); row.setTag("contributor-entry:"+i);
            row.setOrientation(LinearLayout.VERTICAL); row.setPadding(0,ui.dp(11),0,ui.dp(11));
            TextView name=ui.text(NAMES[i],13,ui.text,true); row.addView(name,ui.wrap());
            row.addView(ui.text(i<2?"个人贡献者":"开发团队",11,ui.muted,false),ui.margins(0,4,0,0));
            people.addView(row,ui.wrap());
            if(i<NAMES.length-1) people.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        }
        page.addView(people,ui.wrap());

        TextView donationHeading=ui.text("捐赠列表",12,ui.accent,true);
        donationHeading.setAccessibilityHeading(true);
        page.addView(donationHeading,ui.margins(2,18,2,6));
        page.addView(ui.text("感谢以下捐赠者对项目的支持。",11.5f,ui.muted,false),ui.margins(2,0,2,10));
        LinearLayout donors=ui.card(); donors.setTag("donation-list");
        donors.setPadding(ui.dp(12),ui.dp(2),ui.dp(12),ui.dp(2));
        for(int i=0;i<DONORS.length;i++) {
            TextView name=ui.text(DONORS[i],13,ui.text,true);
            name.setTag("donor-entry:"+i);
            name.setPadding(0,ui.dp(11),0,ui.dp(11));
            donors.addView(name,ui.wrap());
            if(i<DONORS.length-1) donors.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        }
        page.addView(donors,ui.wrap());
    }
}
