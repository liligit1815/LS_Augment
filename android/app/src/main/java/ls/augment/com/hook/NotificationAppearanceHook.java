package ls.augment.com.hook;

import android.animation.ValueAnimator;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.NotificationLayoutPolicy;
import ls.augment.com.HeaderClockGeometry;
import ls.augment.com.HeaderClockLayout;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Device-backed CCHeaderView and FooterView changes; native text, listeners and list retain ownership. */
final class NotificationAppearanceHook {
    private static final String HEADER="com.zte.controlcenter.widget.CCHeaderView";
    private static final String STACK="com.android.systemui.statusbar.notification.stack.NotificationStackScrollLayout";
    private static final String FOOTER="com.android.systemui.statusbar.notification.footer.ui.view.FooterView";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<View,HeaderState> HEADERS=new WeakHashMap<>();
    private static final Map<View,StackState> STACKS=new WeakHashMap<>();
    private static final Map<View,FooterState> FOOTERS=new WeakHashMap<>();
    private static final Runnable CHANGED=()->MAIN.post(NotificationAppearanceHook::refreshAll);
    private static boolean observing;
    private static AugmentModule module;
    private NotificationAppearanceHook() { }

    static int install(AugmentModule owner,ClassLoader loader){
        module=owner;int count=0;
        for(String name:new String[]{"onAttachedToWindow","updateHeaderResources","updateVisibilities","onConfigurationChanged","setViewType"}){
            count+=hookNamed(owner,loader,"notification.appearance",HEADER,name,-1,(target,args,result)->{
                HeaderState state=HEADERS.get(target);if(state!=null)state.beginNative();return PASS;
            },(target,args,result)->{
                HeaderState state=header((View)target);state.endNative();return PASS;
            });
        }
        count+=hookNamed(owner,loader,"notification.appearance",HEADER,"onDetachedFromWindow",0,null,(target,args,result)->{
            HeaderState state=HEADERS.remove(target);if(state!=null)state.close();return PASS;
        });
        // The outer control panel rewrites its header height independently of CCHeaderView.
        for(String name:new String[]{"checkTopPanel","updateResources"})
            count+=hookNamed(owner,loader,"notification.appearance","com.zte.controlcenter.view.ControlCenterPanelView",name,0,
                    (target,args,result)->{Object h=field(target,"ccHeaderView");HeaderState s=HEADERS.get(h);if(s!=null)s.beginNative();return PASS;},
                    (target,args,result)->{Object h=field(target,"ccHeaderView");if(h instanceof View)header((View)h).endNative();return PASS;});
        for(String name:new String[]{"onLayout","setStatusBarState","setIsExpanded"}){
            count+=hookNamed(owner,loader,"notification.appearance",STACK,name,-1,null,(target,args,result)->{
                StackState state=stack((View)target);state.refresh();return PASS;
            });
        }
        // The OEM pre-draw updater clears its requested flag only AFTER
        // updateChildren returns. A padding write in an after-hook is too late
        // for this frame and its request for another update is swallowed.
        count+=hookNamed(owner,loader,"notification.appearance",STACK,"updateChildren",0,(target,args,result)->{
            stack((View)target).refresh();return PASS;
        },null);
        count+=hookNamed(owner,loader,"notification.appearance",STACK,"updateTopPadding",2,(target,args,result)->{
            StackState state=stack((View)target);
            if(!state.adjusting)state.beforeNativePadding(((Number)args[0]).floatValue());
            // A reentrant viewport/header refresh may finish a newer allocation after
            // updatePadding computed its argument. Revalidate our own write as well.
            args[0]=state.desiredPadding(state.nativePadding);
            if(state.ownsHeader()){
                args[1]=false;
                // Also guard the caller: ART can inline the final internal
                // onTopPaddingChanged callback. Consume its pending flag only
                // for an actual integer padding change, just as the ROM does.
                if(((Number)args[0]).intValue()!=integer(field(field(target,"mAmbientState"),"mTopPadding"),Integer.MIN_VALUE))
                    set(target,"mAnimateNextTopPaddingChange",false);
            }
            return PASS;
        },null);
        count+=hookNamed(owner,loader,"notification.appearance",STACK,"onTopPaddingChanged",1,(target,args,result)->{
            StackState state=STACKS.get(target);
            if(state!=null&&state.ownsHeader()){
                // This allocation already follows the current header/scroll
                // geometry. Animating it again retargets the notification rows.
                // The native callback also merges a pending animation flag,
                // even when updateTopPadding was called with animate=false.
                args[0]=false;set(target,"mAnimateNextTopPaddingChange",false);
            }
            return PASS;
        },null);
        count+=hookNamed(owner,loader,"notification.appearance",NotificationViewportInset.CONTAINER,"setNotificationsMarginBottom",1,
                (target,args,result)->{StackState s=STACKS.get(field(target,"mStackScroller"));if(s!=null)args[0]=s.viewport.beforeNativeMargin(((Number)args[0]).intValue());return PASS;},
                (target,args,result)->{StackState s=STACKS.get(field(target,"mStackScroller"));if(s!=null&&!s.viewport.isWriting())s.refresh();return PASS;});
        count+=hookNamed(owner,loader,"notification.appearance",NotificationViewportInset.CONTAINER,"applyConstraints",1,
                (target,args,result)->{StackState s=STACKS.get(field(target,"mStackScroller"));if(s!=null)s.viewport.beginNative();return PASS;},
                (target,args,result)->{StackState s=STACKS.get(field(target,"mStackScroller"));if(s!=null){s.viewport.endNative();s.refresh();}return PASS;});
        count+=hookNamed(owner,loader,"notification.appearance",STACK,"onDetachedFromWindow",0,null,(target,args,result)->{
            StackState state=STACKS.get(target);if(state!=null){state.viewport.close();STACKS.remove(target);}return PASS;
        });
        count+=hookNamed(owner,loader,"notification.appearance",STACK,"updateClipping",0,(target,args,result)->{
            StackState state=STACKS.get(target);if(state!=null)state.viewport.beginNativeClip();return PASS;
        },(target,args,result)->{
            StackState state=STACKS.get(target);if(state!=null)state.viewport.endNativeClip();return PASS;
        });
        for(String name:new String[]{"onFinishInflate","onConfigurationChanged","setClearAllButtonVisible"}){
            count+=hookNamed(owner,loader,"notification.appearance",FOOTER,name,-1,null,(target,args,result)->{
                footer((View)target).refresh();return PASS;
            });
        }
        count+=hookNamed(owner,loader,"notification.appearance",FOOTER,"updateColors",0,(target,args,result)->{
            FooterState state=FOOTERS.get(target);if(state!=null)state.releaseStyle();return PASS;
        },(target,args,result)->{footer((View)target).refresh();return PASS;});
        count+=OemNotificationClearHook.install(owner,loader);
        owner.logFeatureInfo("NOTIFICATION_APPEARANCE_READY native=CCHeaderView,FooterView,DismissNotificationFeature hooks="+count);
        return count;
    }
    private static void observe(View view){if(!observing)observing=FeatureSettings.addSnapshotListener(view.getContext(),CHANGED);}
    private static HeaderState header(View view){HeaderState state=HEADERS.get(view);if(state==null){state=new HeaderState(view);HEADERS.put(view,state);observe(view);}return state;}
    private static StackState stack(View view){StackState state=STACKS.get(view);if(state==null){state=new StackState(view);STACKS.put(view,state);observe(view);}return state;}
    private static FooterState footer(View view){FooterState state=FOOTERS.get(view);if(state==null){state=new FooterState(view);FOOTERS.put(view,state);observe(view);}return state;}
    private static void refreshAll(){for(HeaderState state:new ArrayList<>(HEADERS.values()))state.refresh();for(StackState state:new ArrayList<>(STACKS.values()))state.refresh();for(FooterState state:new ArrayList<>(FOOTERS.values()))state.refresh();}
    /** The expanded notification clock owns its size until the native layout is restored. */
    static boolean ownsClock(TextView clock){
        for(HeaderState state:HEADERS.values())if(state.applied&&field(state.header.get(),"mClockView")==clock)return true;
        return false;
    }
    /** Resource callbacks can run after this hook reapplies the expanded layout. */
    static float nativeClockSize(TextView clock){
        for(HeaderState state:HEADERS.values())if(state.applied)
            for(Original original:state.originals)if(original.view.get()==clock&&original.size>=0)return original.size;
        return clock.getTextSize();
    }
    static void clockChanged(TextView clock){
        for(HeaderState state:new ArrayList<>(HEADERS.values()))if(field(state.header.get(),"mClockView")==clock)state.refresh();
    }
    /** Absolute header coordinate, derived from viewport/text, never current row growth. */
    static float iconSpacingBottom(View header){HeaderState state=HEADERS.get(header);return state!=null&&state.applied?Math.max(0,state.iconLimit):-1;}
    /** Only this adapter's committed right-column allocation may contain blank
     * clock/date rows. Other native containers retain their full occupancy. */
    static View ownedIconBand(View header,View right){
        HeaderState state=HEADERS.get(header);
        if(state==null||!state.applied||state.nativeDepth!=0||state.refreshing||state.contentBottom<=0
                ||right==null||right.getParent()!=header||right!=nativeChild(header,"status_icons_group_container"))return null;
        View row=nativeChild(header,"status_icons_group");
        return row!=null&&row.getParent()==right?row:null;
    }
    /** Weather must not apply the old whole-header width to an owned date row. */
    static boolean ownsWeather(TextView text){for(HeaderState state:HEADERS.values())if(state.applied&&state.weather==text)return true;return false;}

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static View nativeChild(View view,String id){int key=view.getResources().getIdentifier(id,"id","com.android.systemui");return key==0?null:view.findViewById(key);}
    private static View findStack(View source){
        for(android.view.ViewParent p=source.getParent();p instanceof View;p=p.getParent())if(STACK.equals(p.getClass().getName()))return (View)p;
        View root=source.getRootView();for(View view:new ArrayList<>(STACKS.keySet()))if(view.isAttachedToWindow()&&view.getRootView()==root)return view;
        return nativeChild(root,"notification_stack_scroller");
    }
    private static boolean shade(View view){
        if(view==null)return false;Object ambient=field(view,"mAmbientState");
        return NotificationLayoutPolicy.shadeAllowed(integer(field(ambient,"mStatusBarState"),-1),
                Boolean.TRUE.equals(field(ambient,"mDozing")),Boolean.TRUE.equals(field(ambient,"mShowingStackOnLockscreen")),
                Boolean.TRUE.equals(field(ambient,"mShadeExpanded")));
    }
    private static int integer(Object value,int fallback){return value instanceof Number?((Number)value).intValue():fallback;}
    private static float decimal(Object value,float fallback){return value instanceof Number?((Number)value).floatValue():fallback;}
    private static float dp(View view,float value){return value*view.getResources().getDisplayMetrics().density;}
    private static boolean landscape(View view){return view.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE;}
    private static boolean headerWork(View view){
        if(FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.CLOCK_PORTRAIT)
                ||FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.CLOCK_LANDSCAPE)
                ||FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_seconds")
                ||FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_period"))return true;
        // A just-disabled header still owns its allocation until its restore pass.
        for(HeaderState header:HEADERS.values())if(header.applied)return true;
        return false;
    }
    private static int option(View view,String key,int value,int min,int max){return FeatureSettings.integer(view.getContext(),key,value,min,max);}
    private static int clock(View view,boolean wide,String key,int value,int min,int max){return option(view,NotificationAppearanceOptions.clock(wide,key),value,min,max);}
    private static void changedSize(View view,int width,int height){ViewGroup.LayoutParams lp=view.getLayoutParams();if(lp!=null&&(lp.width!=width||lp.height!=height)){lp.width=width;lp.height=height;view.setLayoutParams(lp);}}
    private static void textSize(TextView view,float px){if(Math.abs(view.getTextSize()-px)>.15f)view.setTextSize(TypedValue.COMPLEX_UNIT_PX,px);}
    private static float textHeight(TextView text){android.graphics.Paint.FontMetrics metrics=text.getPaint().getFontMetrics();return metrics.bottom-metrics.top+text.getCompoundPaddingTop()+text.getCompoundPaddingBottom();}
    private static void translate(View view,float x,float y){if(Math.abs(view.getTranslationX()-x)>.1f)view.setTranslationX(x);if(Math.abs(view.getTranslationY()-y)>.1f)view.setTranslationY(y);}

    private static ViewGroup.LayoutParams copy(ViewGroup.LayoutParams lp){
        if(lp instanceof RelativeLayout.LayoutParams)return new RelativeLayout.LayoutParams((RelativeLayout.LayoutParams)lp);
        if(lp instanceof android.widget.FrameLayout.LayoutParams)return new android.widget.FrameLayout.LayoutParams((android.widget.FrameLayout.LayoutParams)lp);
        if(lp instanceof ViewGroup.MarginLayoutParams)return new ViewGroup.MarginLayoutParams((ViewGroup.MarginLayoutParams)lp);
        return new ViewGroup.LayoutParams(lp);
    }
    private static final class Original {
        final WeakReference<View> view;final ViewGroup.LayoutParams layout;final float size;
        final TextUtils.TruncateAt ellipsize;
        final boolean singleLine,horizontalScroll;final int maxLines,maxWidth,visibility;
        final android.text.method.TransformationMethod transformation;
        final boolean heightOnly,weatherPayload;int ownedHeight;
        Original(View v){this(v,false);}
        Original(View v,boolean heightOnly){view=new WeakReference<>(v);layout=v.getLayoutParams()==null?null:copy(v.getLayoutParams());size=v instanceof TextView?((TextView)v).getTextSize():-1;ellipsize=v instanceof TextView?((TextView)v).getEllipsize():null;this.heightOnly=heightOnly;weatherPayload="ls_augment_notification_weather".equals(v.getTag());ownedHeight=layout==null?0:layout.height;
            TextView t=v instanceof TextView?(TextView)v:null;singleLine=t!=null&&t.isSingleLine();horizontalScroll=t!=null&&t.isHorizontallyScrollable();maxLines=t==null?0:t.getMaxLines();maxWidth=t==null?0:t.getMaxWidth();transformation=t==null?null:t.getTransformationMethod();visibility=v.getVisibility();}
        void observeHeight(){View v=view.get();ViewGroup.LayoutParams current=v==null?null:v.getLayoutParams();if(heightOnly&&layout!=null&&current!=null&&current.height!=ownedHeight)layout.height=current.height;}
        void restore(){View v=view.get();if(v==null)return;
            if(heightOnly){ViewGroup.LayoutParams current=v.getLayoutParams();if(layout!=null&&current!=null&&current.height==ownedHeight)changedSize(v,current.width,layout.height);return;}
            if(layout!=null)v.setLayoutParams(copy(layout));if(size>=0){TextView t=(TextView)v;if(!weatherPayload)textSize(t,size);t.setSingleLine(singleLine);t.setHorizontallyScrolling(horizontalScroll);t.setMaxLines(maxLines);if(maxWidth>=0&&t.getMaxWidth()!=maxWidth)t.setMaxWidth(maxWidth);t.setTransformationMethod(transformation);t.setEllipsize(ellipsize);}if(!weatherPayload&&v.getVisibility()!=visibility)v.setVisibility(visibility);}
    }
    private static final class HeaderState implements ViewTreeObserver.OnGlobalLayoutListener {
        final WeakReference<View> header;
        final ArrayList<Original> originals=new ArrayList<>();
        int nativeDepth;boolean applied,refreshing,allocating,failed,inactive;
        float originalGroupTop,contentBottom,listGap,iconLimit;int nativeClockHeight,nativeDateHeight,formatMode;boolean formatted,expandedMode;
        HeaderClockLayout.Below[] belowItems=new HeaderClockLayout.Below[0];
        String lastReport="",rejectedSpace;
        TextView weather;
        Original nativePeriod;
        HeaderState(View view){header=new WeakReference<>(view);view.getViewTreeObserver().addOnGlobalLayoutListener(this);}
        void beginNative(){if(nativeDepth++==0){rejectedSpace=null;restore();}}
        void endNative(){nativeDepth=Math.max(0,nativeDepth-1);if(nativeDepth==0)refresh();}
        void restoreNativePeriod(){if(nativePeriod!=null){nativePeriod.restore();nativePeriod=null;}}
        void restore(){restoreNativePeriod();if(!applied)return;for(Original original:originals)original.restore();originals.clear();belowItems=new HeaderClockLayout.Below[0];weather=null;applied=false;}
        void close(){restore();View view=header.get();if(view!=null&&view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnGlobalLayoutListener(this);}
        @Override public void onGlobalLayout(){refresh();}
        boolean requested(View view){return FeatureSettings.enabled(view.getContext(),
                landscape(view)?NotificationAppearanceOptions.CLOCK_LANDSCAPE:NotificationAppearanceOptions.CLOCK_PORTRAIT)&&integer(field(view,"panelType"),-1)==2;}
        void refresh(){
            View view=header.get();if(view==null||refreshing||nativeDepth>0)return;refreshing=true;
            try{
                int nextFormat=(FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_seconds")?1:0)|(FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_period")?2:0);
                // Protect only a mode that actually owns vertical header layout. Format-only
                // landscape and disabled/native modes must release the previous allocation.
                allocating=requested(view)||nextFormat!=0&&!landscape(view);
                if(nextFormat==0&&!requested(view)){
                    // Both shade headers share the window's pre-draw callbacks.
                    // Leave native geometry alone without scanning that window on
                    // every animation frame. Disabling still restores owned state.
                    rejectedSpace=null;
                    if(!inactive||applied){inactive=true;boolean owned=applied;restore();Object c=field(view,"mClockView");if(c instanceof TextView)ControlCenterHeaderHook.spaceBlocked((TextView)c,false);if(owned){View nativeStack=findStack(view);if(nativeStack!=null)stack(nativeStack).updatePadding();}}
                    formatted=false;formatMode=0;expandedMode=false;report(view,"native");return;
                }
                inactive=false;
                View nativeStack=findStack(view);boolean notification=integer(field(view,"panelType"),-1)==2;
                boolean expanded=requested(view)&&shade(nativeStack);
                boolean format=nextFormat!=0;
                boolean enabled=expanded||format&&(!notification||shade(nativeStack));
                if(!enabled){rejectedSpace=null;restore();Object c=field(view,"mClockView");if(c instanceof TextView)ControlCenterHeaderHook.spaceBlocked((TextView)c,false);if(nativeStack!=null)stack(nativeStack).updatePadding();report(view,"native");return;}
                if(rejectedSpace!=null&&rejectedSpace.equals(spaceSignature(view,nativeStack)))return;
                if(applied&&(formatMode!=nextFormat||expandedMode!=expanded))restore();formatted=format;formatMode=nextFormat;expandedMode=expanded;
                rejectedSpace=null;
                Object rawClock=field(view,"mClockView"),rawDate=field(view,"mDateView"),rawGroup=field(view,"mTimeGroup"),rawDateGroup=field(view,"mDateViewContainer");
                if(!(rawClock instanceof TextView)||!(rawDate instanceof TextView)||!(rawGroup instanceof View)||!(rawDateGroup instanceof View))return;
                TextView time=(TextView)rawClock,date=(TextView)rawDate;View group=(View)rawGroup,dateGroup=(View)rawDateGroup;
                if(format&&!expanded&&landscape(view)){
                    // Landscape primitive mode anchors date END_OF(time), while
                    // the separate QS panel can hide both groups entirely. Their
                    // WRAP_CONTENT clocks already measure the formatted string.
                    // Replacing those rules/outer height with vertical rows moves
                    // content into fixed native tiles and reserves phantom space.
                    if(applied)restore();
                    ControlCenterHeaderHook.spaceBlocked(time,false);
                    ControlCenterHeaderHook.renderClock(time);
                    View period=nativeChild(view,"am_pm_view");
                    if(period!=null&&FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_period")){
                        if(nativePeriod!=null&&nativePeriod.view.get()!=period)restoreNativePeriod();
                        if(nativePeriod==null)nativePeriod=new Original(period);
                        if(period.getVisibility()!=View.GONE)period.setVisibility(View.GONE);
                    }else restoreNativePeriod();
                    if(nativeStack!=null)stack(nativeStack).updatePadding();
                    report(view,"clock;mode=native;size="+time.getTextSize()+";orientation=landscape");
                    return;
                }
                restoreNativePeriod();
                TextView nextWeather=HeaderClockLayout.weather(dateGroup);
                if(applied&&weather!=nextWeather)restore();
                ControlCenterHeaderHook.spaceBlocked(time,false);
                if(group.getParent()!=view||dateGroup.getParent()!=view||!(group.getLayoutParams() instanceof RelativeLayout.LayoutParams)||!(dateGroup.getLayoutParams() instanceof RelativeLayout.LayoutParams)||view.getWidth()<=0)return;
                View right=nativeChild(view,"status_icons_group_container"),icons=nativeChild(view,"status_icons_group");
                if(right==null||right.getParent()!=view||icons==null||icons.getParent()!=right||!(right.getLayoutParams() instanceof RelativeLayout.LayoutParams))return;
                View footer=nativeChild(view,"qs_footer_actions_container"),period=nativeChild(view,"am_pm_view"),below=nativeChild(view,"cell_date_usage");
                if(!applied){
                    // Only height is owned on the outer header. Parent width/margins
                    // may already contain the new orientation before this callback.
                    originals.add(new Original(view,true));
                    for(View child:new View[]{time,date,group,dateGroup,right,footer,period,below})if(child!=null)originals.add(new Original(child));
                    weather=nextWeather;if(weather!=null)originals.add(new Original(weather));
                    ArrayList<HeaderClockLayout.Below> payloads=new ArrayList<>();
                    for(int i=0;i<((ViewGroup)view).getChildCount();i++){
                        View child=((ViewGroup)view).getChildAt(i);if(!(child.getLayoutParams() instanceof RelativeLayout.LayoutParams))continue;
                        if(((RelativeLayout.LayoutParams)child.getLayoutParams()).getRule(RelativeLayout.BELOW)!=dateGroup.getId())continue;
                        payloads.add(new HeaderClockLayout.Below(child));if(child!=below)originals.add(new Original(child));
                    }
                    belowItems=payloads.toArray(new HeaderClockLayout.Below[0]);
                    originalGroupTop=((RelativeLayout.LayoutParams)group.getLayoutParams()).topMargin;
                    nativeClockHeight=Math.max(0,time.getLayoutParams().height);nativeDateHeight=Math.max(0,date.getLayoutParams().height);
                    applied=true;
                }
                originals.get(0).observeHeight();
                boolean wide=landscape(view);float scaled=view.getResources().getDisplayMetrics().scaledDensity;
                listGap=expanded?dp(view,clock(view,wide,"list_gap",16,4,64)):dp(view,8);
                if(expanded){
                    int scroll=Math.max(0,integer(field(nativeStack,"mOwnScrollY"),0));
                    float size=NotificationLayoutPolicy.clockSize(clock(view,wide,"size",wide?44:64,24,100),
                            clock(view,wide,"compact_size",24,16,48),scroll,dp(view,clock(view,wide,"collapse_distance",120,40,300)))*scaled;
                    textSize(time,size);textSize(date,clock(view,wide,"date_size",14,10,24)*scaled);
                }
                // There is one formatter, including the period-only accessibility description.
                ControlCenterHeaderHook.renderClock(time);
                if(period!=null&&FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_period"))period.setVisibility(View.GONE);
                int accessories=(int)Math.ceil(topAccessories(view,group,dateGroup,right,below));
                float limit=headerBudget(view,notification?nativeStack:null)-view.getPaddingTop()-view.getPaddingBottom()-listGap;
                int align=expanded?clock(view,wide,"align",0,0,2):(view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?2:0);
                HeaderClockGeometry.Plan plan=HeaderClockLayout.apply((ViewGroup)view,time,date,group,dateGroup,right,icons,footer,period,belowItems,
                        Math.round(originalGroupTop),expanded?0:nativeClockHeight,expanded?0:nativeDateHeight,accessories,
                        Math.max(0,(int)Math.floor(limit)),Math.round(dp(view,expanded?12:8)),expanded?Math.round(dp(view,clock(view,wide,"date_gap",6,0,24))):0,
                        align,expanded?Math.round(dp(view,clock(view,wide,"x",0,-120,120))):0,
                        expanded?Math.round(dp(view,clock(view,wide,"y",0,0,100))):0,expanded);
                if(plan==null||!plan.valid){restore();ControlCenterHeaderHook.spaceBlocked(time,true);rejectedSpace=spaceSignature(view,nativeStack);if(nativeStack!=null)stack(nativeStack).updatePadding();report(view,"native;insufficient-space");return;}
                contentBottom=view.getPaddingTop()+plan.bottom+view.getPaddingBottom();
                iconLimit=view.getPaddingTop()+plan.maximumIconBottom;
                originals.get(0).ownedHeight=view.getLayoutParams().height;
                if(nativeStack!=null)stack(nativeStack).updatePadding();
                report(view,"clock;mode="+(plan.stacked?"rows":"inline")+";size="+time.getTextSize()+";orientation="+(wide?"landscape":"portrait"));
            }catch(RuntimeException error){if(!failed){failed=true;module.logFeatureError("NOTIFICATION_CLOCK_APPLY",error);}restore();}
            finally{allocating=false;refreshing=false;}
        }
        void report(View view,String stage){if(!stage.equals(lastReport)){lastReport=stage;String value="adapter=CCHeaderView;panel="+integer(field(view,"panelType"),-1)+";"+stage;FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_clock_runtime",value);FeatureSettings.diagnostic(view.getContext(),"ls_augment_header_clock_runtime_"+integer(field(view,"panelType"),-1)+"_"+(landscape(view)?"landscape":"portrait"),value);}}
        String spaceSignature(View view,View nativeStack){
            boolean wide=landscape(view);
            StringBuilder value=new StringBuilder().append(wide).append('|').append(view.getWidth()).append('|').append(nativeStack==null?view.getRootView().getHeight():stack(nativeStack).viewport.heightForHeader()).append('|').append(headerLayoutTop(view,nativeStack)).append('|').append(view.getResources().getDisplayMetrics().scaledDensity).append('|').append(integer(field(nativeStack,"mOwnScrollY"),0)).append('|').append(FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_seconds")).append('|').append(FeatureSettings.enabled(view.getContext(),"ls_augment_rm_qs_clock_period"));
            for(String key:new String[]{"size","compact_size","collapse_distance","align","x","y","date_size","date_gap","list_gap"})value.append('|').append(clock(view,wide,key,Integer.MIN_VALUE,Integer.MIN_VALUE,Integer.MAX_VALUE));
            View icons=nativeChild(view,"status_icons_group"),right=nativeChild(view,"status_icons_group_container");
            if(icons!=null&&right!=null)value.append('|').append(iconBandHeight(right,icons)).append('|').append(HeaderClockLayout.naturalWidth(icons));
            Object rawDate=field(view,"mDateViewContainer");TextView currentWeather=rawDate instanceof View?HeaderClockLayout.weather((View)rawDate):null;
            value.append('|').append(currentWeather==null?"no-weather":currentWeather.getText()).append('|').append(currentWeather==null?0:currentWeather.getTextSize());
            return value.toString();
        }
        float bottomInStack(View nativeStack){
            View view=header.get();if(!applied||contentBottom<=0||view==null||integer(field(view,"panelType"),-1)!=2||(!requested(view)&&!formatted)||!shade(nativeStack))return -1;
            return headerLayoutTop(view,nativeStack)+contentBottom+listGap;
        }
    }
    private static boolean visibleContent(View view){
        if(view==null||view.getVisibility()!=View.VISIBLE)return false;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;if(group.getChildCount()>0){for(int i=0;i<group.getChildCount();i++)if(visibleContent(group.getChildAt(i)))return true;return false;}}
        return true;
    }
    private static float verticalMargins(View view){ViewGroup.LayoutParams p=view.getLayoutParams();return p instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)p).topMargin+((ViewGroup.MarginLayoutParams)p).bottomMargin:0;}
    private static float naturalHeight(View view){
        ViewGroup.LayoutParams lp=view.getLayoutParams();if(lp!=null&&lp.height>=0)return lp.height;
        if(view instanceof TextView)return textHeight((TextView)view);
        if(view instanceof ViewGroup){float height=0;ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(visibleContent(child))height=Math.max(height,naturalHeight(child)+verticalMargins(child));}return height+view.getPaddingTop()+view.getPaddingBottom();}
        return Math.max(0,view.getMeasuredHeight());
    }
    private static float iconBandHeight(View right,View icons){
        float height=naturalHeight(icons)+verticalMargins(icons)+right.getPaddingTop()+right.getPaddingBottom();
        if(right instanceof ViewGroup){ViewGroup group=(ViewGroup)right;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child!=icons&&visibleContent(child))height+=naturalHeight(child)+verticalMargins(child)+dp(right,8);}}
        return Math.max(1,height);
    }
    private static float topAccessories(View header,View time,View date,View right,View below){
        float bottom=0;if(!(header instanceof ViewGroup))return bottom;ViewGroup group=(ViewGroup)header;
        for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child==time||child==date||child==right||child==below||!visibleContent(child)||!(child.getLayoutParams() instanceof RelativeLayout.LayoutParams))continue;
            RelativeLayout.LayoutParams lp=(RelativeLayout.LayoutParams)child.getLayoutParams();
            if(lp.getRule(RelativeLayout.BELOW)==time.getId()||lp.getRule(RelativeLayout.BELOW)==date.getId())continue;
            if(lp.height==ViewGroup.LayoutParams.MATCH_PARENT)continue;
            bottom=Math.max(bottom,Math.max(0,lp.topMargin)+naturalHeight(child)+Math.max(0,child.getTranslationY()));
        }return bottom;
    }
    /** The OEM QS root's drawing motion is shared with notification row motion. */
    private static float headerLayoutTop(View header,View stack){
        int[] a=new int[2],b=new int[2];header.getLocationOnScreen(a);if(stack!=null)stack.getLocationOnScreen(b);
        float top=a[1]-b[1];
        for(View ancestor=header;ancestor!=null;ancestor=ancestor.getParent() instanceof View?(View)ancestor.getParent():null){
            boolean qs=false;
            for(Class<?> type=ancestor.getClass();type!=null;type=type.getSuperclass())
                if("com.zte.mifavor.qs.MfvQSContainerImpl".equals(type.getName())){qs=true;break;}
            if(!qs)continue;
            // MfvQSFragment translates this root during shade entry and springback. The
            // native stack applies that motion independently (StackY/SpringYOffset).
            // Feeding it into topPadding adds the motion twice, then snaps on return.
            boolean shared=false;
            for(View parent=stack;parent!=null;parent=parent.getParent() instanceof View?(View)parent.getParent():null)
                if(parent==ancestor){shared=true;break;}
            if(!shared)top-=Math.round(ancestor.getTranslationY());
            break;
        }
        // Screen locations and the removed root motion use the same pixel rounding,
        // including half-pixel frames, rather than feeding a fractional remainder back.
        return Math.round(top);
    }
    private static float headerBudget(View header,View stack){
        int height=stack==null?header.getRootView().getHeight():stack(stack).viewport.heightForHeader();if(height<=0)return stack==null?Float.MAX_VALUE:0;
        // Always leave a useful notification viewport, especially in landscape/large font.
        float reserve=Math.min(dp(header,160),height*.45f);
        return Math.max(0,height-headerLayoutTop(header,stack)-reserve);
    }
    private static final class StackState {
        final WeakReference<View> view;final NotificationViewportInset viewport;float nativePadding=Float.NaN,ownedPadding=Float.NaN;boolean adjusting,paddingOwned,refreshing;
        StackState(View source){view=new WeakReference<>(source);nativePadding=decimal(field(field(source,"mAmbientState"),"mTopPadding"),0);viewport=new NotificationViewportInset(source,this::ownsHeader,this::refresh);}
        boolean headerUpdating(){
            View source=view.get();if(source==null||!headerWork(source)||!shade(source))return false;
            for(HeaderState state:new ArrayList<>(HEADERS.values())){View h=state.header.get();
                if(h!=null&&findStack(h)==source&&(state.nativeDepth>0||state.allocating&&state.rejectedSpace==null)&&state.contentBottom>0
                        &&integer(field(h,"panelType"),-1)==2&&(state.formatted||state.requested(h)))return true;
            }return false;
        }
        void beforeNativePadding(float value){
            // A resource callback can feed the current allocated padding back
            // while its header is temporarily restored. That is our value,
            // not a new native baseline to retain after the feature is disabled.
            if(!headerUpdating()||!Float.isFinite(ownedPadding)||Math.abs(value-ownedPadding)>=1f)nativePadding=value;
        }
        boolean ownsHeader(){View source=view.get();if(source==null||!headerWork(source)||Boolean.TRUE.equals(field(source,"mLaunchingNotification")))return false;if(headerUpdating()&&Float.isFinite(ownedPadding))return true;for(HeaderState state:new ArrayList<>(HEADERS.values())){View h=state.header.get();if(h!=null&&findStack(h)==source&&state.bottomInStack(source)>=0)return true;}return false;}
        float desiredPadding(float original){
            View source=view.get();if(source==null)return original;float bottom=-1;
            if(headerWork(source)){
                for(HeaderState header:new ArrayList<>(HEADERS.values())){View h=header.header.get();if(h!=null&&findStack(h)==source)bottom=Math.max(bottom,header.bottomInStack(source));}
                // Keep the committed allocation through a synchronous header
                // header transaction, until its new rows have been committed.
                if(bottom<0&&headerUpdating()&&Float.isFinite(ownedPadding))bottom=ownedPadding;
            }
            // The owned header already includes the requested list gap. A late
            // OEM expansion padding must not add another gap underneath it.
            float result=bottom>=0?bottom:original;ownedPadding=bottom>=0?result:Float.NaN;
            paddingOwned=Math.abs(result-original)>.5f;return result;
        }
        void updatePadding(){View source=view.get();if(source==null||adjusting||!headerWork(source)&&!paddingOwned&&!viewport.hasOwnedState())return;viewport.refresh();float wanted=desiredPadding(nativePadding);
            float current=decimal(field(field(source,"mAmbientState"),"mTopPadding"),wanted);
            if(Math.abs(current-wanted)<1f)return;adjusting=true;try{call(source,"updateTopPadding",wanted,false);}catch(ReflectiveOperationException error){module.logFeatureError("NOTIFICATION_CLOCK_PADDING",error);}finally{adjusting=false;}}
        void refresh(){if(refreshing||adjusting)return;View source=view.get();if(source==null)return;refreshing=true;
            try{
                if(headerWork(source)||paddingOwned||viewport.hasOwnedState()){
                    for(HeaderState state:new ArrayList<>(HEADERS.values())){View h=state.header.get();if(h!=null&&findStack(h)==source)state.refresh();}updatePadding();
                }
                if(FeatureSettings.enabled(source.getContext(),NotificationAppearanceOptions.CLEAR)){Object footer=field(source,"mFooterView");if(footer instanceof View)footer((View)footer).refresh();}
            }
            finally{refreshing=false;}}
    }

    private static final class FooterState implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<View> footer;
        WeakReference<View> button=new WeakReference<>(null);
        Drawable originalBackground,appliedBackground;float originalX,originalY,entry=1f;int appliedColor;
        boolean styled,wasShown,refreshing,failed;ValueAnimator animator;String lastReport="";
        FooterState(View view){footer=new WeakReference<>(view);view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        @Override public void onViewAttachedToWindow(View view){if(view.getViewTreeObserver().isAlive()){view.getViewTreeObserver().removeOnPreDrawListener(this);view.getViewTreeObserver().addOnPreDrawListener(this);}}
        @Override public void onViewDetachedFromWindow(View view){if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);releaseStyle();wasShown=false;}
        @Override public boolean onPreDraw(){refresh();return true;}
        void releaseStyle(){
            if(animator!=null){animator.cancel();animator=null;}entry=1;
            View b=button.get();if(styled&&b!=null){b.setBackground(originalBackground);translate(b,originalX,originalY);}
            styled=false;appliedBackground=null;originalBackground=null;
        }
        void refresh(){
            View owner=footer.get();if(owner==null||refreshing)return;refreshing=true;
            try{
                if(!FeatureSettings.enabled(owner.getContext(),NotificationAppearanceOptions.CLEAR)){
                    if(styled||animator!=null)releaseStyle();wasShown=false;report(owner,"native");return;
                }
                // RedMagic's visible X is owned by DismissNotificationFeature, outside FooterView.
                // Do not style the unused AOSP clear button or overwrite the OEM diagnostic.
                if(nativeChild(owner.getRootView(),"iv_dismiss_notification_view")!=null){releaseStyle();wasShown=false;return;}
                Object raw=field(owner,"mClearAllButton");if(!(raw instanceof View))return;View b=(View)raw;
                boolean active=FeatureSettings.enabled(owner.getContext(),NotificationAppearanceOptions.CLEAR)&&shade(findStack(owner));
                if(!active){releaseStyle();wasShown=false;report(owner,"native");return;}
                if(button.get()!=b){releaseStyle();button=new WeakReference<>(b);wasShown=false;}
                if(!styled){originalBackground=b.getBackground();originalX=b.getTranslationX();originalY=b.getTranslationY();styled=true;}
                boolean dark=(owner.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;
                int color=Color.parseColor(FeatureSettings.text(owner.getContext(),dark?NotificationAppearanceOptions.CLEAR_DARK:NotificationAppearanceOptions.CLEAR_LIGHT,dark?"#44444C":"#E3E3E8"));
                if(appliedBackground==null||appliedColor!=color){
                    if(originalBackground!=null&&originalBackground.getConstantState()!=null){Drawable background=originalBackground.getConstantState().newDrawable(b.getResources()).mutate();
                        if(background instanceof RippleDrawable){RippleDrawable ripple=(RippleDrawable)background;for(int i=0;i<ripple.getNumberOfLayers();i++)if(ripple.getId(i)!=android.R.id.mask)ripple.getDrawable(i).setTint(color);}
                        else background.setTint(color);appliedBackground=background;appliedColor=color;b.setBackground(background);
                    }
                }
                boolean shown=b.isShown()&&b.getAlpha()>0f&&owner.isShown();
                if(shown&&!wasShown)enter(owner);wasShown=shown;
                if(!shown&&animator!=null){animator.cancel();animator=null;entry=1;}
                if(!(b.getParent() instanceof ViewGroup))return;ViewGroup parent=(ViewGroup)b.getParent();
                int align=option(owner,NotificationAppearanceOptions.CLEAR_ALIGN,0,0,3);
                float desired=align==0?b.getLeft()+originalX:NotificationLayoutPolicy.alignedX(align-1,parent.getWidth(),b.getWidth(),dp(owner,16),0);
                desired+=dp(owner,option(owner,NotificationAppearanceOptions.CLEAR_X,0,-120,120));
                desired=Math.max(0,Math.min(Math.max(0,parent.getWidth()-b.getWidth()),desired));
                // Keep adjacent native manage/history/settings buttons reachable.
                for(int i=0;i<parent.getChildCount();i++){View other=parent.getChildAt(i);if(other==b||other.getVisibility()!=View.VISIBLE||!other.isClickable())continue;
                    float left=other.getLeft()+other.getTranslationX(),right=left+other.getWidth();
                    if(desired<right&&desired+b.getWidth()>left){float after=right+dp(owner,8),before=left-dp(owner,8)-b.getWidth();desired=after+b.getWidth()<=parent.getWidth()?after:before>=0?before:b.getLeft()+originalX;}
                }
                float y=b.getTop()+originalY+dp(owner,option(owner,NotificationAppearanceOptions.CLEAR_Y,0,-24,24));
                float maxY=Math.max(0,parent.getHeight()-b.getHeight());y=Math.max(0,Math.min(maxY,y));
                float travel=dp(owner,option(owner,NotificationAppearanceOptions.CLEAR_TRAVEL,12,0,40));
                float movement=Math.min(travel,maxY-y);if(movement<1)movement=-Math.min(travel,y);
                translate(b,desired-b.getLeft(),y-b.getTop()+movement*(1-entry));
                report(owner,"active;shown="+shown+";align="+align+";theme="+(dark?"dark":"light")+";material="+(appliedBackground==null?"native-unavailable":"native-ripple-preserved"));
            }catch(RuntimeException error){if(!failed){failed=true;module.logFeatureError("NOTIFICATION_CLEAR_APPLY",error);}releaseStyle();}
            finally{refreshing=false;}
        }
        void report(View owner,String state){if(!state.equals(lastReport)){lastReport=state;FeatureSettings.diagnostic(owner.getContext(),"ls_augment_notification_clear_runtime","adapter=FooterViewButton;"+state);}}
        void enter(View owner){
            if(animator!=null)animator.cancel();int duration=option(owner,NotificationAppearanceOptions.CLEAR_DURATION,220,0,600);
            if(duration==0||!ValueAnimator.areAnimatorsEnabled()){entry=1;return;}
            animator=ValueAnimator.ofFloat(0f,1f);animator.setDuration(duration);animator.setInterpolator(new DecelerateInterpolator());
            animator.addUpdateListener(value->{entry=(Float)value.getAnimatedValue();View view=footer.get();if(view!=null){refresh();view.invalidate();}});animator.start();
        }
    }
}
