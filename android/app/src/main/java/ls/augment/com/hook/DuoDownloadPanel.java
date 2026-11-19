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
    private final TextView title,detail,status,conversationLabel,emphasis;
    private final ImageView icon;
    private final ProgressBar progress;
    private final LinearLayout headingRow,trackRow,buttons,labels;
    private String layoutMode="image_buttons";
    private final Button[] actionButtons=new Button[3];
    private final TextView nativeTitle,nativeDetail;
    private final LinearLayout body;
    private final IslandMessageControls messageControls;
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
        labels=new LinearLayout(context);labels.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams label=new LinearLayout.LayoutParams(0,-2,1);label.setMarginStart(dp(Native12IslandStyle.TEXT_GAP));
        headingRow.addView(labels,label);labels.addView(title,new LinearLayout.LayoutParams(-1,-2));
        detail=text(12);detail.setMaxLines(2);detail.setEllipsize(TextUtils.TruncateAt.END);
        copyTextAppearance(nativeDetail,detail);
        LinearLayout.LayoutParams detailParams=new LinearLayout.LayoutParams(-1,-2);detailParams.topMargin=dp(4);
        labels.addView(detail,detailParams);
        conversationLabel=text(12);conversationLabel.setTextColor(ls.augment.com.IslandVisualSpec.SECONDARY);
        conversationLabel.setVisibility(View.GONE);labels.addView(conversationLabel,1,new LinearLayout.LayoutParams(-1,-2));
        status=text(14);status.setTypeface(android.graphics.Typeface.create("sans-serif-medium",android.graphics.Typeface.NORMAL));
        copyTextAppearance(nativeTitle,status);
        LinearLayout.LayoutParams metric=new LinearLayout.LayoutParams(-2,-2);metric.setMarginStart(dp(8));headingRow.addView(status,metric);
        content.addView(headingRow,new LinearLayout.LayoutParams(-1,-2));
        emphasis=text(28);emphasis.setTextColor(ls.augment.com.IslandVisualSpec.PRIMARY);emphasis.setMaxLines(3);
        emphasis.setVisibility(View.GONE);content.addView(emphasis,new LinearLayout.LayoutParams(-1,-2));
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
                int orientation="primary_action".equals(layoutMode)||(needed>available&&available>0)?VERTICAL:HORIZONTAL;
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
        messageControls=new IslandMessageControls(content,detail,buttons);
        // All contract checks precede mutation; only this newly-created Duo panel is modified.
        host.removeAllViews();host.setLayoutParams(new FrameLayout.LayoutParams(-1,-1));
        host.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        @SuppressWarnings("unchecked") List<View> views=(List<View>)list;views.clear();views.add(scroll);
        panel.setOnClickListener(null);panel.setClickable(false);nativeAppearance();
    }
    void bind(IslandDownloadPolicy.Entry<StatusBarNotification> entry,Drawable artwork,String app,
            BiConsumer<IslandDownloadPolicy.Entry<StatusBarNotification>,PendingIntent> action){
        messageControls.bind(null);conversationLabel.setVisibility(View.GONE);emphasis.setVisibility(View.GONE);
        detail.setMaxLines(Integer.MAX_VALUE);
        nativeAppearance();
        trackRow.setVisibility(View.VISIBLE);progress.setVisibility(View.VISIBLE);
        Notification n=entry.source.getNotification();ls.augment.com.IslandNotificationContent data=IslandNotificationText.read(entry.source.getPackageName(),n);
        title.setText(data.title.isEmpty()?app:data.title);
        // Native multi-task downloads put their file list in EXTRA_TEXT_LINES; retain
        // that list and the source's remaining-time/info fields in the bounded scroller.
        String file=DuoCompactText.fileName(n);
        if(!file.isEmpty())title.setText(file);
        String body=data.detail();
        detail.setText(body.equals(file)?"":body);detail.setVisibility(TextUtils.isEmpty(detail.getText())?View.GONE:View.VISIBLE);
        IslandContentPresentation display=IslandContentPresentation.source(context,entry.source,app,"downloads","",
                title.getText().toString(),detail.getText().toString(),entry.indeterminate?"":entry.percent+"%",entry.paused?"已暂停":entry.indeterminate?"传输中":entry.percent+"%");
        title.setText(display.title);detail.setText(display.detail);
        status.setVisibility(View.VISIBLE);status.setText(entry.paused?"已暂停":entry.indeterminate?"传输中":entry.percent+"%");
        icon.setImageDrawable(IslandNotificationArtwork.resolve(context,entry.source,"downloads",true,artwork));NativeIslandHost.applyIconShape(icon,
                false,dp(5));
        progress.setIndeterminate(entry.indeterminate&&!entry.paused);if(!entry.indeterminate)progress.setProgress(entry.percent);
        if(entry.paused&&entry.indeterminate){progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);}
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(entry,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,intent->action.accept(entry,intent));
        applyLayout(IslandContentPresentation.layout(context,entry.source.getUserId(),"downloads",entry.source.getPackageName(),n.getChannelId()),
                ls.augment.com.IslandNotificationProgress.of(entry.indeterminate?null:entry.percent,100,entry.indeterminate&&!entry.paused),status.getText().toString());
    }
    void bindNotice(StatusBarNotification source,Drawable artwork,String app,
            BiConsumer<StatusBarNotification,PendingIntent> action){
        emphasis.setVisibility(View.GONE);
        // The native viewport remains bounded and scrollable. Do not permanently discard
        // a long body or the additional standard fields after compact presentation.
        detail.setMaxLines(Integer.MAX_VALUE);
        nativeAppearance();
        Notification n=source.getNotification();ls.augment.com.IslandNotificationContent data=IslandNotificationText.read(source.getPackageName(),n);
        title.setText(DuoCompactText.senderOrTitle(n,app));
        String message=DuoCompactText.messageBody(n);
        detail.setText(message.isEmpty()?data.detail():message);
        CharSequence name=n.extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE);
        String conversation=name==null?"":name.toString();
        conversationLabel.setText(conversation.isEmpty()||conversation.contentEquals(title.getText())?app:conversation+" · "+app);
        conversationLabel.setVisibility(message.isEmpty()?View.GONE:View.VISIBLE);
        IslandContentPresentation display=IslandContentPresentation.source(context,source,app,"notifications","",title.getText().toString(),detail.getText().toString(),"","");
        title.setText(display.title);detail.setText(display.detail);
        detail.setVisibility(View.VISIBLE);status.setVisibility(View.GONE);
        progress.setIndeterminate(false);progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);icon.setImageDrawable(IslandNotificationArtwork.resolve(context,source,"notifications",true,artwork));
        title.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        icon.setOnClickListener(v->{if(n.contentIntent!=null)action.accept(source,n.contentIntent);});
        List<Notification.Action> available=IslandDownloadSource.actions(n);
        bindButtons(available,intent->action.accept(source,intent));
        ls.augment.com.IslandNotificationProgress model=IslandNotificationText.progress(n);
        applyLayout(IslandContentPresentation.layout(context,source.getUserId(),"notifications",source.getPackageName(),n.getChannelId()),model,model.status());
        messageControls.bind(source);
    }
    void bindEvent(IslandEvent event,java.util.function.Consumer<IslandEvent.Action> dispatch){
        messageControls.bind(null);conversationLabel.setVisibility(View.GONE);
        detail.setMaxLines(event.detailLines);
        IslandContentPresentation display=IslandContentPresentation.event(context,event);
        boolean customRate=event.contentFields.containsKey("rate_detail")&&!display.detail.equals(event.detail);
        String metric=customRate?"":event.contentFields.getOrDefault("emphasis","");
        String description=customRate?display.detail:event.contentFields.getOrDefault("rate_detail",display.detail);
        nativeAppearance();title.setText(display.title);detail.setText(description);detail.setVisibility(description.isEmpty()?View.GONE:View.VISIBLE);
        emphasis.setText(metric);emphasis.setVisibility(metric.isEmpty()?View.GONE:View.VISIBLE);
        icon.setImageDrawable(event.expandedIcon);title.setOnClickListener(null);title.setClickable(false);
        icon.setOnClickListener(null);icon.setClickable(false);
        status.setVisibility(View.GONE);progress.setIndeterminate(false);progress.setVisibility(View.GONE);trackRow.setVisibility(View.GONE);
        buttons.setVisibility(event.actions.isEmpty()?View.GONE:View.VISIBLE);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            if(i>=event.actions.size()){button.setVisibility(View.GONE);button.setOnClickListener(null);continue;}
            IslandEvent.Action action=event.actions.get(i);button.setText(action.label);button.setVisibility(View.VISIBLE);
            button.setOnClickListener(v->dispatch.accept(action));
        }
        String mode=ls.augment.com.IslandContentRules.SCENES.contains(event.scene)
                ?IslandContentPresentation.layout(context,event.user,event.scene,event.sourcePackage,event.sourceChannel):"auto";
        applyLayout(mode,event.progress,event.progress.status());
    }
    private void applyLayout(String requested,ls.augment.com.IslandNotificationProgress model,String metric){
        layoutMode="auto".equals(requested)?(model.present?"image_progress":"image_buttons"):requested;
        boolean textFirst="text_progress".equals(layoutMode);
        boolean separateBody=textFirst||"cover_buttons".equals(layoutMode)||"auto".equals(requested);
        boolean bar=model.present&&(textFirst||"image_progress".equals(layoutMode));
        boolean hasIcon=icon.getDrawable()!=null;
        icon.setVisibility(hasIcon?View.VISIBLE:View.GONE);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        // Change ownership only when the layout changes; source refreshes keep the live scroller.
        LinearLayout detailParent=separateBody?body:labels;
        if(detail.getParent()!=detailParent){
            ((android.view.ViewGroup)detail.getParent()).removeView(detail);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.topMargin=dp(separateBody?8:4);
            detailParent.addView(detail,separateBody?2:detailParent.getChildCount(),params);
        }
        detail.setVisibility(TextUtils.isEmpty(detail.getText())?View.GONE:View.VISIBLE);
        title.setMaxLines(separateBody?Integer.MAX_VALUE:2);
        LinearLayout metricParent=textFirst?trackRow:headingRow;
        if(status.getParent()!=metricParent){
            ((android.view.ViewGroup)status.getParent()).removeView(status);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-2,-2);params.setMarginStart(dp(8));metricParent.addView(status,params);
        }
        // Xiaomi's right-side text layout maps to the OEM panel's right-side source icon.
        int iconIndex=textFirst?headingRow.getChildCount()-1:0;
        if(headingRow.getChildAt(iconIndex)!=icon){
            headingRow.removeView(icon);headingRow.addView(icon,textFirst?headingRow.getChildCount():0,new LinearLayout.LayoutParams(dp(Native12IslandStyle.PANEL_ICON),dp(Native12IslandStyle.PANEL_ICON)));
        }
        LinearLayout.LayoutParams label=(LinearLayout.LayoutParams)labels.getLayoutParams();
        label.setMarginStart(hasIcon&&!textFirst?dp(Native12IslandStyle.TEXT_GAP):0);
        label.setMarginEnd(hasIcon&&textFirst?dp(Native12IslandStyle.TEXT_GAP):0);labels.setLayoutParams(label);
        status.setText(metric);status.setVisibility(metric.isEmpty()?View.GONE:View.VISIBLE);
        progress.setIndeterminate(bar&&model.indeterminate);progress.setProgress(model.present&&!model.indeterminate?model.percent:0);
        progress.setVisibility(bar?View.VISIBLE:View.GONE);
        trackRow.setVisibility(bar||(textFirst&&!metric.isEmpty())?View.VISIBLE:View.GONE);
        for(int i=0;i<actionButtons.length;i++){
            Button button=actionButtons[i];
            boolean primary=i==0&&model.present;
            button.setTextColor(primary?ls.augment.com.IslandVisualSpec.INFORMATION:ls.augment.com.IslandVisualSpec.PRIMARY);
            button.setTypeface(android.graphics.Typeface.create(primary?"sans-serif-medium":"sans-serif",android.graphics.Typeface.NORMAL));
        }
        buttons.requestLayout();
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
        messageControls.bind(null);emphasis.setVisibility(View.GONE);emphasis.setText("");conversationLabel.setText("");conversationLabel.setVisibility(View.GONE);
        icon.setImageDrawable(null);icon.setOnClickListener(null);title.setText("");title.setOnClickListener(null);
        detail.setText("");status.setText("");progress.setIndeterminate(false);progress.setProgress(0);
        for(Button button:actionButtons){button.setOnClickListener(null);button.setText("");button.setVisibility(View.GONE);}
    }
    void foreground(int color){
        color=ls.augment.com.IslandVisualSpec.PRIMARY;
        foreground=color;title.setTextColor(color);detail.setTextColor(ls.augment.com.IslandVisualSpec.SECONDARY);
        int accent=ls.augment.com.IslandVisualSpec.INFORMATION;status.setTextColor(accent);
        progress.setProgressBackgroundTintList(ColorStateList.valueOf(ls.augment.com.IslandVisualSpec.TRACK));
        progress.setProgressTintList(ColorStateList.valueOf(accent));progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
        for(Button button:actionButtons){Native12IslandStyle.action(button);button.setTextColor(color);}
    }
    private void nativeAppearance(){
        foreground(ls.augment.com.IslandVisualSpec.PRIMARY);
        int accent=ls.augment.com.IslandVisualSpec.INFORMATION;
        status.setTextColor(accent);progress.setProgressTintList(ColorStateList.valueOf(accent));
        progress.setIndeterminateTintList(ColorStateList.valueOf(accent));
        {
            Native12IslandStyle.panel(host);Native12IslandStyle.text(title,Native12IslandStyle.TITLE,true);
            Native12IslandStyle.text(detail,Native12IslandStyle.DETAIL,false);Native12IslandStyle.text(status,Native12IslandStyle.COMPACT_TEXT,false);
            status.setTextColor(accent);
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
