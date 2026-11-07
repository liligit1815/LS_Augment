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
    private final LinearLayout headingRow,trackRow,buttons;
    private final Button[] actionButtons=new Button[3];
    private final Button snooze;
    private int foreground=Color.WHITE;
    DuoDownloadPanel(View panel)throws Exception{
        Object list=field(panel,"mViewList");
        if(!(panel instanceof FrameLayout)||!(list instanceof List))throw new IllegalStateException("download_panel_contract_missing");
        context=panel.getContext();host=(FrameLayout)panel;
        ScrollView scroll=new ScrollView(context);scroll.setFillViewport(true);
        LinearLayout content=new LinearLayout(context);content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(16),dp(12),dp(16),dp(8));scroll.addView(content,new ScrollView.LayoutParams(-1,-2));
        headingRow=new LinearLayout(context);headingRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        icon=new ImageView(context);icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        headingRow.addView(icon,new LinearLayout.LayoutParams(dp(28),dp(28)));
        title=text(15);title.setMaxLines(2);title.setEllipsize(TextUtils.TruncateAt.END);
        title.setTypeface(android.graphics.Typeface.create("sans-serif-medium",android.graphics.Typeface.NORMAL));
        LinearLayout labels=new LinearLayout(context);labels.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams label=new LinearLayout.LayoutParams(0,-2,1);label.setMarginStart(dp(10));
        headingRow.addView(labels,label);labels.addView(title,new LinearLayout.LayoutParams(-1,-2));
        detail=text(12);detail.setMaxLines(2);detail.setEllipsize(TextUtils.TruncateAt.END);
        labels.addView(detail,new LinearLayout.LayoutParams(-1,-2));
        status=text(14);status.setTypeface(android.graphics.Typeface.create("sans-serif-medium",android.graphics.Typeface.NORMAL));
        LinearLayout.LayoutParams metric=new LinearLayout.LayoutParams(-2,-2);metric.setMarginStart(dp(8));headingRow.addView(status,metric);
        content.addView(headingRow,new LinearLayout.LayoutParams(-1,-2));
        progress=new ProgressBar(context,null,android.R.attr.progressBarStyleHorizontal);progress.setMax(100);
        trackRow=new LinearLayout(context);trackRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams track=new LinearLayout.LayoutParams(-1,-2);track.topMargin=dp(6);
        content.addView(trackRow,track);
        trackRow.addView(progress,new LinearLayout.LayoutParams(0,dp(5),1));
        buttons=new LinearLayout(context){
            @Override protected void onMeasure(int widthSpec,int heightSpec){
                int available=View.MeasureSpec.getSize(widthSpec);
                int needed=0;
                for(int i=0;i<getChildCount();i++){
                    View child=getChildAt(i);
                    if(child.getVisibility()==View.GONE)continue;
                    needed+=child.getLayoutParams().width;
                }
                int orientation=needed>available&&available>0?VERTICAL:HORIZONTAL;
                if(getOrientation()!=orientation)setOrientation(orientation);
                super.onMeasure(widthSpec,heightSpec);
            }
        };
        buttons.setGravity(android.view.Gravity.END);
        content.addView(buttons,new LinearLayout.LayoutParams(-1,-2));
        for(int i=0;i<actionButtons.length;i++){
            Button button=new Button(context);button.setAllCaps(false);button.setTextSize(13);
            button.setMinHeight(dp(48));button.setMinimumHeight(dp(48));button.setMaxLines(2);button.setVisibility(View.GONE);
            buttons.addView(button,new LinearLayout.LayoutParams(-2,-2));actionButtons[i]=button;
        }
        snooze=new Button(context);snooze.setAllCaps(false);snooze.setTextSize(13);
        snooze.setText("15 分钟后提醒");snooze.setMinHeight(dp(48));snooze.setMinimumHeight(dp(48));
        snooze.setVisibility(View.GONE);content.addView(snooze,new LinearLayout.LayoutParams(-1,-2));
        // All contract checks precede mutation; only this newly-created Duo panel is modified.
        host.removeAllViews();host.setPadding(0,0,0,0);host.setLayoutParams(new FrameLayout.LayoutParams(-1,-1));
        host.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        @SuppressWarnings("unchecked") List<View> views=(List<View>)list;views.clear();views.add(scroll);
        panel.setOnClickListener(null);foreground(Color.WHITE);
    }
    void bind(IslandDownloadPolicy.Entry<StatusBarNotification> entry,Drawable artwork,String app,
            BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> action){
        snooze.setVisibility(View.GONE);snooze.setOnClickListener(null);
        trackRow.setVisibility(View.VISIBLE);progress.setVisibility(View.VISIBLE);
        Notification n=entry.source.getNotification();CharSequence heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
        host.setPadding(0,0,0,0);
        title.setText(TextUtils.isEmpty(heading)?app:heading);
        CharSequence body=n.extras.getCharSequence(Notification.EXTRA_TEXT);
        detail.setText(TextUtils.isEmpty(body)?app:body);detail.setVisibility(View.VISIBLE);
        status.setVisibility(View.VISIBLE);status.setText(entry.indeterminate?"下载中":entry.percent+"%");
        icon.setImageDrawable(artwork);NativeIslandHost.applyIconShape(icon,
                FeatureSettings.integer(context,ls.augment.com.SystemUiOptions.ISLAND_APP_STYLE,0,0,1)==1,dp(5));
        progress.setIndeterminate(entry.indeterminate);if(!entry.indeterminate)progress.setProgress(entry.percent);
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,trackRow,intent->action.accept(entry,intent));
    }
    void bindNotice(StatusBarNotification source,Drawable artwork,String app,
            BiConsumer<StatusBarNotification,PendingIntent> action,java.util.function.Consumer<StatusBarNotification> remind){
        Notification n=source.getNotification();CharSequence heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
        title.setText(TextUtils.isEmpty(heading)?app:heading);detail.setText(n.extras.getCharSequence(Notification.EXTRA_TEXT));
        if(TextUtils.isEmpty(detail.getText()))detail.setText(app);
        detail.setVisibility(View.VISIBLE);status.setVisibility(View.GONE);
        progress.setIndeterminate(false);progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);icon.setImageDrawable(artwork);
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,headingRow,intent->action.accept(source,intent));
        boolean canSnooze=source.isClearable();
        snooze.setVisibility(canSnooze?View.VISIBLE:View.GONE);
        snooze.setOnClickListener(canSnooze?v->remind.accept(source):null);
    }
    private void bindButtons(List<Notification.Action> available,LinearLayout inline,java.util.function.Consumer<PendingIntent> send){
        Button first=actionButtons[0];
        boolean fits=available.size()==1&&context.getResources().getConfiguration().fontScale<1.3f
                &&first.getPaint().measureText(available.get(0).title.toString())<=dp(78);
        LinearLayout target=fits?inline:buttons;
        if(first.getParent()!=target){
            ((LinearLayout)first.getParent()).removeView(first);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-2,-2);
            if(fits)params.setMarginStart(dp(8));
            if(fits)target.addView(first,params);else target.addView(first,0,params);
        }
        buttons.setVisibility(!available.isEmpty()&&!fits?View.VISIBLE:View.GONE);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            if(i>=available.size()){button.setVisibility(View.GONE);button.setOnClickListener(null);continue;}
            Notification.Action original=available.get(i);button.setText(original.title);button.setVisibility(View.VISIBLE);
            // Some OEM Button themes request half a panel even for a two-character action.
            button.setPadding(dp(10),0,dp(10),0);
            button.setMinWidth(dp(48));button.setMinimumWidth(dp(48));
            int width=Math.max(dp(48),Math.min(dp(128),(int)Math.ceil(button.getPaint().measureText(original.title.toString()))+dp(22)));
            LinearLayout.LayoutParams bounds=(LinearLayout.LayoutParams)button.getLayoutParams();
            if(bounds.width!=width){bounds.width=width;button.setLayoutParams(bounds);}
            button.setOnClickListener(v->send.accept(original.actionIntent));
        }
    }
    void clear(){
        snooze.setOnClickListener(null);snooze.setVisibility(View.GONE);
        icon.setImageDrawable(null);icon.setOnClickListener(null);title.setText("");title.setOnClickListener(null);
        detail.setText("");status.setText("");progress.setIndeterminate(false);progress.setProgress(0);
        for(Button button:actionButtons){button.setOnClickListener(null);button.setText("");button.setVisibility(View.GONE);}
    }
    void foreground(int color){
        foreground=color;title.setTextColor(color);detail.setTextColor((color&0x00ffffff)|0xb8000000);
        int accent=color==Color.WHITE?0xff9acbff:color;status.setTextColor(accent);
        progress.setProgressTintList(ColorStateList.valueOf(accent));progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
        for(Button button:actionButtons){button.setTextColor(color);
            button.setBackgroundTintList(ColorStateList.valueOf((color&0x00ffffff)|0x22000000));}
        snooze.setTextColor(color);snooze.setBackgroundTintList(ColorStateList.valueOf((color&0x00ffffff)|0x18000000));
    }
    private TextView text(int size){TextView view=new TextView(context);view.setTextSize(size);return view;}
    private int dp(int size){return Math.round(size*context.getResources().getDisplayMetrics().density);}
}
