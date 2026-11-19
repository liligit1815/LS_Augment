package ls.augment.com.hook;

import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.IdentityHashMap;
import java.util.Map;
import ls.augment.com.IslandMediaGeometry;
import ls.augment.com.IslandVisualSpec;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** Rearranges verified native media views; their controllers, listeners and artwork stay native. */
final class IslandMediaLayout {
    private final Map<View,Saved> saved=new IdentityHashMap<>();
    private View owner;
    private boolean changed;
    private static final String[] DIRECT={"mDisplayImageContainer","mDisplayContainer","mSeekBarGroup","mControlGroup","mPanelFavorite","mPanelCast","mMediaContainer","mMusicWaveView"};
    private static View view(Object owner,String name){Object value=field(owner,name);return value instanceof View?(View)value:null;}
    private static boolean compatible(View panel){
        if(!(panel instanceof FrameLayout)||panel.getLayoutParams()==null)return false;
        for(String name:DIRECT){View child=view(panel,name);if(child==null||child.getParent()!=panel||!(child.getLayoutParams() instanceof FrameLayout.LayoutParams))return false;}
        for(String name:new String[]{"mDisplayTitle","mDisplayText","mElapsedTime","mTotalTime"})if(!(view(panel,name) instanceof TextView))return false;
        for(String name:new String[]{"mPanelPrev","mPanelPlayPause","mPanelNext","mDisplayFirstImage","mDisplaySecondImage"})if(!(view(panel,name) instanceof ImageView)||view(panel,name).getLayoutParams()==null)return false;
        View seek=view(panel,"mProgressSeekBar"),group=view(panel,"mSeekBarGroup"),labels=view(panel,"mDisplayContainer");
        if(!(seek instanceof android.widget.SeekBar)||!(group instanceof LinearLayout)||!(labels instanceof LinearLayout))return false;
        if(((LinearLayout)group).getOrientation()!=LinearLayout.HORIZONTAL||((LinearLayout)labels).getOrientation()!=LinearLayout.VERTICAL)return false;
        if(seek.getParent()!=group||!(seek.getLayoutParams() instanceof LinearLayout.LayoutParams)||((LinearLayout.LayoutParams)seek.getLayoutParams()).weight<=0)return false;
        return view(panel,"mElapsedTime").getParent()==group&&view(panel,"mTotalTime").getParent()==group
                &&view(panel,"mDisplayTitle").getParent()==labels&&view(panel,"mDisplayText").getParent()==labels;
    }
    static boolean supportsLyrics(View panel){
        return panel instanceof FrameLayout&&view(panel,"mSeekBarGroup") instanceof LinearLayout
                &&view(panel,"mElapsedTime") instanceof TextView&&view(panel,"mPanelCast") instanceof ImageView
                &&view(panel,"mDisplayContainer") instanceof LinearLayout;
    }
    void apply(View panel,Runnable resized){
        if(owner!=panel){clear();if(!compatible(panel)){
            FeatureRuntimeLog.state("ISLAND_MEDIA_LAYOUT","native","frame_groups_or_controls_missing");return;
        }owner=panel;}
        int width=panel.getWidth();if(width<=0)width=panel.getMeasuredWidth();
        int padding=dp(panel,IslandVisualSpec.PANEL_PADDING),content=width-2*padding;
        if(content<dp(panel,144))return;
        changed=false;remember(panel);padding(panel,padding,padding,padding,padding);
        int icon=dp(panel,IslandVisualSpec.PANEL_ICON),gap=dp(panel,12),wave=dp(panel,28);
        frame(view(panel,"mDisplayImageContainer"),icon,icon,Gravity.TOP|Gravity.START,0,0,0);
        for(String name:new String[]{"mDisplayFirstImage","mDisplaySecondImage"})size(view(panel,name),icon,icon);
        int textWidth=Math.max(1,content-icon-gap-wave-dp(panel,8));
        View labels=view(panel,"mDisplayContainer");
        frame(labels,textWidth,-2,Gravity.TOP|Gravity.START,icon+gap,0,wave+dp(panel,8));
        for(String name:new String[]{"mDisplayTitle","mDisplayText"}){
            TextView text=(TextView)view(panel,name);remember(text);
            if(text.getMaxWidth()!=textWidth){text.setMaxWidth(textWidth);changed=true;}
            size(text,-1,-2);
        }
        labels.measure(View.MeasureSpec.makeMeasureSpec(textWidth,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        TextView elapsed=(TextView)view(panel,"mElapsedTime"),total=(TextView)view(panel,"mTotalTime");
        // Retain the actual time TextViews, moving only their layout out of the weighted seek row.
        // The full-width track remains the native SeekBar with its original seek listener.
        remember(elapsed);remember(total);
        moveTime(elapsed,(FrameLayout)panel);moveTime(total,(FrameLayout)panel);
        int timeWidth=(content-dp(panel,8))/2;
        int timeHeight=0;
        for(TextView time:new TextView[]{elapsed,total}){
            time.measure(View.MeasureSpec.makeMeasureSpec(timeWidth,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            timeHeight=Math.max(timeHeight,time.getMeasuredHeight());
        }
        int headerHeight=Math.max(icon,labels.getMeasuredHeight());
        View lyric=panel.findViewWithTag("duo_media_lyrics");
        if(lyric!=null&&lyric.getParent()==panel&&lyric.getVisibility()==View.VISIBLE){
            lyric.measure(View.MeasureSpec.makeMeasureSpec(content,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            int lyricTop=headerHeight+dp(panel,8);
            FrameLayout.LayoutParams position=(FrameLayout.LayoutParams)lyric.getLayoutParams();
            if(position.topMargin!=lyricTop||position.width!=content){position.topMargin=lyricTop;position.width=content;lyric.setLayoutParams(position);changed=true;}
            headerHeight=lyricTop+lyric.getMeasuredHeight();
        }
        IslandMediaGeometry g=new IslandMediaGeometry(content,headerHeight,timeHeight,panel.getResources().getDisplayMetrics().density);
        frame(view(panel,"mSeekBarGroup"),content,dp(panel,44),Gravity.TOP|Gravity.START,0,g.seekTop,0);
        View seek=view(panel,"mProgressSeekBar");size(seek,0,dp(panel,44));
        padding(seek,0,dp(panel,20),0,dp(panel,20));
        frame(elapsed,timeWidth,-2,Gravity.TOP|Gravity.START,0,g.timeTop,0);
        frame(total,timeWidth,-2,Gravity.TOP|Gravity.END,0,g.timeTop,0);
        frame(view(panel,"mControlGroup"),g.controlsWidth,dp(panel,48),Gravity.TOP|Gravity.CENTER_HORIZONTAL,0,g.controlsTop,0);
        for(String name:new String[]{"mPanelPrev","mPanelPlayPause","mPanelNext"}){
            View control=view(panel,name);size(control,dp(panel,48),dp(panel,48));
            int inset=dp(panel,"mPanelPlayPause".equals(name)?10:12);padding(control,inset,inset,inset,inset);
        }
        frame(view(panel,"mPanelFavorite"),dp(panel,48),dp(panel,48),Gravity.TOP|Gravity.START,0,g.auxTop,0);
        frame(view(panel,"mPanelCast"),dp(panel,48),dp(panel,48),Gravity.TOP|Gravity.END,0,g.auxTop,0);
        for(String name:new String[]{"mPanelFavorite","mPanelCast"}){View control=view(panel,name);int inset=dp(panel,12);padding(control,inset,inset,inset,inset);}
        frame(view(panel,"mMediaContainer"),wave,dp(panel,20),Gravity.TOP|Gravity.END,0,dp(panel,4),0);
        frame(view(panel,"mMusicWaveView"),dp(panel,20),dp(panel,20),Gravity.TOP|Gravity.END,0,dp(panel,4),0);
        size(panel,panel.getLayoutParams().width,g.height);
        if(changed){panel.requestLayout();panel.post(()->{if(owner==panel)resized.run();});}
    }
    private static int dp(View view,int value){return Native12IslandStyle.dp(view.getContext(),value);}
    private void remember(View view){saved.computeIfAbsent(view,Saved::new);}
    private void moveTime(TextView time,FrameLayout panel){if(time.getParent()==panel)return;
        saved.get(time).moved=true;((ViewGroup)time.getParent()).removeView(time);panel.addView(time,new FrameLayout.LayoutParams(-2,-2));changed=true;}
    private void padding(View view,int l,int t,int r,int b){remember(view);if(view.getPaddingLeft()!=l||view.getPaddingTop()!=t||view.getPaddingRight()!=r||view.getPaddingBottom()!=b){view.setPadding(l,t,r,b);changed=true;}}
    private void size(View view,int width,int height){remember(view);ViewGroup.LayoutParams p=view.getLayoutParams();if(p!=null&&(p.width!=width||p.height!=height)){p.width=width;p.height=height;view.setLayoutParams(p);changed=true;}}
    private void frame(View view,int width,int height,int gravity,int start,int top,int end){
        remember(view);FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)view.getLayoutParams();
        if(p.width==width&&p.height==height&&p.gravity==gravity&&p.getMarginStart()==start&&p.getMarginEnd()==end&&p.topMargin==top&&p.bottomMargin==0)return;
        p.width=width;p.height=height;p.gravity=gravity;p.setMarginStart(start);p.setMarginEnd(end);p.topMargin=top;p.bottomMargin=0;
        view.setLayoutParams(p);changed=true;
    }
    void clear(){for(Map.Entry<View,Saved> entry:saved.entrySet())entry.getValue().restore(entry.getKey());saved.clear();owner=null;}
    private static final class Saved{
        final ViewGroup.LayoutParams params;final int width,height,left,top,right,bottom,maxWidth;
        final ViewGroup parent;final int index;
        boolean moved;
        final FrameLayout.LayoutParams frame;
        Saved(View view){params=view.getLayoutParams();width=params==null?0:params.width;height=params==null?0:params.height;
            parent=view.getParent() instanceof ViewGroup?(ViewGroup)view.getParent():null;index=parent==null?-1:parent.indexOfChild(view);
            frame=params instanceof FrameLayout.LayoutParams?new FrameLayout.LayoutParams((FrameLayout.LayoutParams)params):null;
            left=view.getPaddingLeft();top=view.getPaddingTop();right=view.getPaddingRight();bottom=view.getPaddingBottom();
            maxWidth=view instanceof TextView?((TextView)view).getMaxWidth():0;}
        void restore(View view){
            if(moved&&parent!=null&&view.getParent()!=parent){if(view.getParent() instanceof ViewGroup)((ViewGroup)view.getParent()).removeView(view);parent.addView(view,Math.min(index,parent.getChildCount()),params);}
            if(params!=null){params.width=width;params.height=height;view.setLayoutParams(frame==null?params:frame);}
            view.setPadding(left,top,right,bottom);if(view instanceof TextView)((TextView)view).setMaxWidth(maxWidth);}
    }
}
