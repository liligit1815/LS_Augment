package ls.augment.com.hook;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import android.view.View;
import android.widget.*;
import java.util.List;
import java.util.function.BiConsumer;
import ls.augment.com.IslandDownloadPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Content in a verified OEM app panel, retaining its window, animation and touch ownership. */
final class DuoDownloadPanel {
    private final Context context;
    private final FrameLayout host;
    private final TextView title,detail,status;
    private final ImageView icon;
    private final ProgressBar progress;
    private final LinearLayout buttons;
    private final Button[] actionButtons=new Button[3];
    private int foreground=Color.WHITE;
    DuoDownloadPanel(View panel)throws Exception{
        Object list=field(panel,"mViewList");
        if(!(panel instanceof FrameLayout)||!(list instanceof List))throw new IllegalStateException("download_panel_contract_missing");
        context=panel.getContext();host=(FrameLayout)panel;
        ScrollView scroll=new ScrollView(context);scroll.setFillViewport(true);
        LinearLayout content=new LinearLayout(context);content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(16),dp(12),dp(16),dp(12));scroll.addView(content,new ScrollView.LayoutParams(-1,-2));
        LinearLayout heading=new LinearLayout(context);heading.setGravity(android.view.Gravity.CENTER_VERTICAL);
        icon=new ImageView(context);icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        heading.addView(icon,new LinearLayout.LayoutParams(dp(32),dp(32)));
        title=text(15);title.setMaxLines(2);title.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams label=new LinearLayout.LayoutParams(0,-2,1);label.setMarginStart(dp(12));heading.addView(title,label);
        content.addView(heading,new LinearLayout.LayoutParams(-1,-2));
        detail=text(13);detail.setMaxLines(2);detail.setEllipsize(TextUtils.TruncateAt.END);
        content.addView(detail,new LinearLayout.LayoutParams(-1,-2));
        status=text(13);content.addView(status,new LinearLayout.LayoutParams(-1,-2));
        progress=new ProgressBar(context,null,android.R.attr.progressBarStyleHorizontal);progress.setMax(100);
        content.addView(progress,new LinearLayout.LayoutParams(-1,dp(8)));
        buttons=new LinearLayout(context);buttons.setOrientation(LinearLayout.VERTICAL);
        content.addView(buttons,new LinearLayout.LayoutParams(-1,-2));
        for(int i=0;i<actionButtons.length;i++){
            Button button=new Button(context);button.setAllCaps(false);button.setTextSize(14);
            button.setMinHeight(dp(48));button.setMinimumHeight(dp(48));button.setMaxLines(2);button.setVisibility(View.GONE);
            buttons.addView(button,new LinearLayout.LayoutParams(-1,-2));actionButtons[i]=button;
        }
        // All contract checks precede mutation; only this newly-created Duo panel is modified.
        host.removeAllViews();host.setPadding(0,0,0,0);host.setLayoutParams(new FrameLayout.LayoutParams(-1,-1));
        host.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        @SuppressWarnings("unchecked") List<View> views=(List<View>)list;views.clear();views.add(scroll);
        panel.setOnClickListener(null);foreground(Color.WHITE);
    }
    void bind(IslandDownloadPolicy.Entry<StatusBarNotification> entry,Drawable artwork,String app,
            BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> action){
        Notification n=entry.source.getNotification();CharSequence heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
        host.setPadding(0,0,0,0);
        title.setText(TextUtils.isEmpty(heading)?app:heading);
        CharSequence body=n.extras.getCharSequence(Notification.EXTRA_TEXT);detail.setText(body);
        detail.setVisibility(TextUtils.isEmpty(body)?View.GONE:View.VISIBLE);
        status.setText(app+" · "+(entry.indeterminate?"下载中":"已下载 "+entry.percent+"%"));
        icon.setImageDrawable(artwork);NativeIslandHost.applyIconShape(icon,
                FeatureSettings.integer(context,ls.augment.com.SystemUiOptions.ISLAND_APP_STYLE,0,0,1)==1,dp(5));
        progress.setIndeterminate(entry.indeterminate);if(!entry.indeterminate)progress.setProgress(entry.percent);
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            if(i>=available.size()){button.setVisibility(View.GONE);button.setOnClickListener(null);continue;}
            Notification.Action original=available.get(i);button.setText(original.title);button.setVisibility(View.VISIBLE);
            button.setOnClickListener(v->action.accept(entry,original.actionIntent));
        }
    }
    void clear(){
        icon.setImageDrawable(null);icon.setOnClickListener(null);title.setText("");title.setOnClickListener(null);
        detail.setText("");status.setText("");progress.setIndeterminate(false);progress.setProgress(0);
        for(Button button:actionButtons){button.setOnClickListener(null);button.setText("");button.setVisibility(View.GONE);}
    }
    void foreground(int color){
        foreground=color;title.setTextColor(color);detail.setTextColor(color);status.setTextColor(color);
        progress.setProgressTintList(ColorStateList.valueOf(color));progress.setIndeterminateTintList(ColorStateList.valueOf(color));
        for(int i=0;i<buttons.getChildCount();i++){Button button=(Button)buttons.getChildAt(i);button.setTextColor(color);
            button.setBackgroundTintList(ColorStateList.valueOf((color&0x00ffffff)|0x22000000));}
    }
    private TextView text(int size){TextView view=new TextView(context);view.setTextSize(size);return view;}
    private int dp(int size){return Math.round(size*context.getResources().getDisplayMetrics().density);}
}
