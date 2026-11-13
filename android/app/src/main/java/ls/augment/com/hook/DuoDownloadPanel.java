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
    private final TextView nativeTitle,nativeDetail;
    private final LinearLayout body;
    private int foreground=Color.WHITE;
    DuoDownloadPanel(View panel)throws Exception{
        Object list=field(panel,"mViewList");
        if(!(panel instanceof FrameLayout)||!(list instanceof List))throw new IllegalStateException("download_panel_contract_missing");
        context=panel.getContext();host=(FrameLayout)panel;
        Object primary=field(panel,"mDisplayText"),secondary=field(panel,"mDisplaySecondText"),art=field(panel,"mDisplayIcon");
        if(!(primary instanceof TextView)||!(secondary instanceof TextView)||!(art instanceof ImageView))
            throw new IllegalStateException("download_panel_text_contract_missing");
        nativeTitle=(TextView)primary;nativeDetail=(TextView)secondary;
        ScrollView scroll=new ScrollView(context);scroll.setFillViewport(true);
        LinearLayout content=new LinearLayout(context);content.setOrientation(LinearLayout.VERTICAL);
        body=content;
        // AppIslandPanel reapplies its own resource padding when attached/configured.
        // Keep that single outer inset; duplicating it here clips the progress row.
        scroll.addView(content,new ScrollView.LayoutParams(-1,-2));
        headingRow=new LinearLayout(context);headingRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        icon=new ImageView(context);icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        int iconSize=dp(Native12IslandStyle.PANEL_ICON);
        headingRow.addView(icon,new LinearLayout.LayoutParams(iconSize,iconSize));
        title=text(15);title.setMaxLines(2);title.setEllipsize(TextUtils.TruncateAt.END);
        copyTextAppearance(nativeTitle,title);
        LinearLayout labels=new LinearLayout(context);labels.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams label=new LinearLayout.LayoutParams(0,-2,1);label.setMarginStart(dp(Native12IslandStyle.TEXT_GAP));
        headingRow.addView(labels,label);labels.addView(title,new LinearLayout.LayoutParams(-1,-2));
        detail=text(12);detail.setMaxLines(2);detail.setEllipsize(TextUtils.TruncateAt.END);
        copyTextAppearance(nativeDetail,detail);
        LinearLayout.LayoutParams detailParams=new LinearLayout.LayoutParams(-1,-2);detailParams.topMargin=dp(4);
        labels.addView(detail,detailParams);
        status=text(14);status.setTypeface(android.graphics.Typeface.create("sans-serif-medium",android.graphics.Typeface.NORMAL));
        copyTextAppearance(nativeTitle,status);
        LinearLayout.LayoutParams metric=new LinearLayout.LayoutParams(-2,-2);metric.setMarginStart(dp(8));headingRow.addView(status,metric);
        content.addView(headingRow,new LinearLayout.LayoutParams(-1,-2));
        progress=new ProgressBar(context,null,android.R.attr.progressBarStyleHorizontal);progress.setMax(100);
        trackRow=new LinearLayout(context);trackRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams track=new LinearLayout.LayoutParams(-1,-2);track.topMargin=dp(12);
        content.addView(trackRow,track);
        trackRow.addView(progress,new LinearLayout.LayoutParams(0,dp(5),1));
        buttons=new LinearLayout(context){
            @Override protected void onMeasure(int widthSpec,int heightSpec){
                int available=View.MeasureSpec.getSize(widthSpec);
                int widest=0,count=0;
                for(int i=0;i<getChildCount();i++){
                    View child=getChildAt(i);
                    if(child.getVisibility()==View.GONE)continue;
                    count++;
                    widest=Math.max(widest,Math.max(dp(48),(int)Math.ceil(((TextView)child).getPaint().measureText(((TextView)child).getText().toString()))+dp(32)));
                }
                // Horizontal children share equal weights: every cell must fit the widest label.
                int needed=widest*count+Math.max(0,count-1)*dp(8);
                int orientation=needed>available&&available>0?VERTICAL:HORIZONTAL;
                if(getOrientation()!=orientation)setOrientation(orientation);
                int visible=0;
                for(int i=0;i<getChildCount();i++){
                    View child=getChildAt(i);if(child.getVisibility()==View.GONE)continue;
                    LinearLayout.LayoutParams p=(LinearLayout.LayoutParams)child.getLayoutParams();
                    int width=orientation==VERTICAL?-1:0;
                    float weight=orientation==VERTICAL?0:1;
                    int start=orientation==HORIZONTAL&&visible>0?dp(8):0,top=orientation==VERTICAL&&visible>0?dp(8):0;
                    if(p.width!=width||p.weight!=weight||p.getMarginStart()!=start||p.topMargin!=top){
                        p.width=width;p.weight=weight;p.setMarginStart(start);p.topMargin=top;child.setLayoutParams(p);
                    }
                    visible++;
                }
                super.onMeasure(widthSpec,heightSpec);
            }
        };
        buttons.setGravity(android.view.Gravity.END);
        LinearLayout.LayoutParams actions=new LinearLayout.LayoutParams(-1,-2);actions.topMargin=dp(12);
        content.addView(buttons,actions);
        for(int i=0;i<actionButtons.length;i++){
            Button button=new Button(context);button.setAllCaps(false);button.setTextSize(13);
            copyTextAppearance(nativeDetail,button);
            button.setMinHeight(dp(48));button.setMinimumHeight(dp(48));button.setMaxLines(2);button.setVisibility(View.GONE);
            buttons.addView(button,new LinearLayout.LayoutParams(-2,-2));actionButtons[i]=button;
        }
        // All contract checks precede mutation; only this newly-created Duo panel is modified.
        host.removeAllViews();host.setLayoutParams(new FrameLayout.LayoutParams(-1,-1));
        host.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        @SuppressWarnings("unchecked") List<View> views=(List<View>)list;views.clear();views.add(scroll);
        panel.setOnClickListener(null);panel.setClickable(false);nativeAppearance();
    }
    void bind(IslandDownloadPolicy.Entry<StatusBarNotification> entry,Drawable artwork,String app,
            BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> action){
        detail.setMaxLines(2);
        nativeAppearance();
        trackRow.setVisibility(View.VISIBLE);progress.setVisibility(View.VISIBLE);
        Notification n=entry.source.getNotification();CharSequence heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
        title.setText(TextUtils.isEmpty(heading)?app:heading);
        CharSequence body=n.extras.getCharSequence(Notification.EXTRA_TEXT);
        detail.setText(TextUtils.isEmpty(body)?app:body);detail.setVisibility(View.VISIBLE);
        status.setVisibility(View.VISIBLE);status.setText(entry.indeterminate?"传输中":entry.percent+"%");
        icon.setImageDrawable(artwork);NativeIslandHost.applyIconShape(icon,
                false,dp(5));
        progress.setIndeterminate(entry.indeterminate);if(!entry.indeterminate)progress.setProgress(entry.percent);
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,intent->action.accept(entry,intent));
    }
    void bindNotice(StatusBarNotification source,Drawable artwork,String app,
            BiConsumer<StatusBarNotification,PendingIntent> action){
        detail.setMaxLines(2);
        nativeAppearance();
        Notification n=source.getNotification();CharSequence heading=n.extras.getCharSequence(Notification.EXTRA_TITLE);
        title.setText(TextUtils.isEmpty(heading)?app:heading);detail.setText(n.extras.getCharSequence(Notification.EXTRA_TEXT));
        if(TextUtils.isEmpty(detail.getText()))detail.setText(app);
        detail.setVisibility(View.VISIBLE);status.setVisibility(View.GONE);
        progress.setIndeterminate(false);progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);icon.setImageDrawable(artwork);
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,intent->action.accept(source,intent));
    }
    void bindEvent(IslandEvent event,java.util.function.Consumer<IslandEvent.Action> dispatch){
        detail.setMaxLines("navigation".equals(event.scene)?4:2);
        nativeAppearance();title.setText(event.title);detail.setText(event.detail);detail.setVisibility(View.VISIBLE);
        icon.setImageDrawable(event.icon);title.setOnClickListener(null);title.setClickable(false);
        icon.setOnClickListener(null);icon.setClickable(false);
        status.setVisibility(View.GONE);progress.setIndeterminate(false);progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);
        buttons.setVisibility(event.actions.isEmpty()?View.GONE:View.VISIBLE);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            if(i>=event.actions.size()){button.setVisibility(View.GONE);button.setOnClickListener(null);continue;}
            IslandEvent.Action action=event.actions.get(i);button.setText(action.label);button.setVisibility(View.VISIBLE);
            button.setOnClickListener(v->dispatch.accept(action));
        }
    }
    private void bindButtons(List<Notification.Action> available,java.util.function.Consumer<PendingIntent> send){
        // Actions have a dedicated row; file names, message bodies and metrics keep their width.
        buttons.setVisibility(!available.isEmpty()?View.VISIBLE:View.GONE);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            if(i>=available.size()){button.setVisibility(View.GONE);button.setOnClickListener(null);continue;}
            Notification.Action original=available.get(i);button.setText(original.title);button.setVisibility(View.VISIBLE);
            button.setOnClickListener(v->send.accept(original.actionIntent));
        }
    }
    void clear(){
        icon.setImageDrawable(null);icon.setOnClickListener(null);title.setText("");title.setOnClickListener(null);
        detail.setText("");status.setText("");progress.setIndeterminate(false);progress.setProgress(0);
        for(Button button:actionButtons){button.setOnClickListener(null);button.setText("");button.setVisibility(View.GONE);}
    }
    void foreground(int color){
        foreground=color;title.setTextColor(color);detail.setTextColor((color&0x00ffffff)|0xb8000000);
        int accent=color==Color.WHITE?0xff9acbff:color;status.setTextColor(accent);
        progress.setProgressTintList(ColorStateList.valueOf(accent));progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
        for(Button button:actionButtons){Native12IslandStyle.action(button);button.setTextColor(color);}
    }
    private void nativeAppearance(){
        int primary=nativeColor("dynamic_island_panel_text_color",nativeTitle.getCurrentTextColor());
        foreground(primary);
        detail.setTextColor(nativeColor("dynamic_island_text_color",nativeDetail.getCurrentTextColor()));
        int accent=Native12IslandStyle.night(context)?0xff8ebaff:0xff1769c2;
        status.setTextColor(accent);progress.setProgressTintList(ColorStateList.valueOf(accent));
        progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
        {
            Native12IslandStyle.panel(host);Native12IslandStyle.text(title,Native12IslandStyle.TITLE,true);
            Native12IslandStyle.text(detail,Native12IslandStyle.DETAIL,false);Native12IslandStyle.text(status,Native12IslandStyle.COMPACT_TEXT,false);
        }
    }
    int desiredHeight(int width){
        body.measure(View.MeasureSpec.makeMeasureSpec(Math.max(1,width-host.getPaddingLeft()-host.getPaddingRight()),View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        return Math.max(dp(88),body.getMeasuredHeight()+host.getPaddingTop()+host.getPaddingBottom());
    }
    private int nativeColor(String name,int fallback){
        int id=context.getResources().getIdentifier(name,"color","com.android.systemui");
        return id==0?fallback:context.getColor(id);
    }
    private static void copyTextAppearance(TextView source,TextView target){
        target.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,source.getTextSize());
        target.setTypeface(source.getTypeface());target.setTextColor(source.getTextColors());
        target.setLetterSpacing(source.getLetterSpacing());target.setIncludeFontPadding(source.getIncludeFontPadding());
    }
    private TextView text(int size){TextView view=new TextView(context);view.setTextSize(size);return view;}
    private int dp(int size){return Math.round(size*context.getResources().getDisplayMetrics().density);}
}
