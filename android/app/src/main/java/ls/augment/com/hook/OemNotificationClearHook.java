package ls.augment.com.hook;

import android.animation.ValueAnimator;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.BlendMode;
import android.graphics.BlendModeColorFilter;
import android.graphics.Insets;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageButton;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.NotificationAppearanceOptions;
import ls.augment.com.NotificationLayoutPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** NX809J's fixed dismiss button is a sibling of the stack, not FooterView.mClearAllButton.
 * The ROM feature retains its visibility rules, ImageDrawable, listener and ConstraintLayout
 * dimensions. View translations move the original touch target together with its artwork.
 */
final class OemNotificationClearHook {
    private static final String OWNER="com.zte.feature.notification.DismissNotificationFeature";
    private static final String ID="iv_dismiss_notification_view";
    private static final Map<View,State> STATES=new WeakHashMap<>();
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Runnable CHANGED=()->MAIN.post(()->{for(State state:new ArrayList<>(STATES.values()))state.refresh();});
    private static AugmentModule module;
    private static boolean observing;
    private OemNotificationClearHook(){}
    static int install(AugmentModule owner,ClassLoader loader){
        module=owner;int count=0;
        // onApplyWindowInsets calls the private updateLayoutParams; bracket both so an
        // inlined private method still restores the native background before replacement.
        for(String method:new String[]{"inflateDismissView","updateLayoutParams","onApplyWindowInsets"})
            count+=hookNamed(owner,loader,"notification.clear.oem",OWNER,method,-1,(target,args,result)->{
                State state=existing(target);if(state!=null)state.beginNative();return PASS;
            },(target,args,result)->{State state=observe(target);if(state!=null)state.endNative();return PASS;});
        for(String method:new String[]{"updateDismissViewVisibility","qsCustomizing","handleQsExpandChanged","updateNotificationPanelState"})
            count+=hookNamed(owner,loader,"notification.clear.oem",OWNER,method,-1,null,(target,args,result)->{
                State state=observe(target);if(state!=null)state.refresh();return PASS;
            });
        owner.logFeatureInfo("NOTIFICATION_CLEAR_OEM_READY owner=DismissNotificationFeature id="+ID+" hooks="+count);return count;
    }
    private static State existing(Object owner){Object button=field(owner,"mDismissView");return button instanceof View?STATES.get(button):null;}
    private static State observe(Object owner){
        Object raw=field(owner,"mDismissView");if(!(raw instanceof ImageButton))return null;View button=(View)raw;
        try{if(!ID.equals(button.getResources().getResourceEntryName(button.getId())))return null;}catch(RuntimeException absent){return null;}
        State state=STATES.get(button);if(state==null){state=new State(button,owner);STATES.put(button,state);
            if(!observing)observing=FeatureSettings.addSnapshotListener(button.getContext(),CHANGED);}
        return state;
    }
    private static int option(View view,String key,int fallback,int minimum,int maximum){return FeatureSettings.integer(view.getContext(),key,fallback,minimum,maximum);}
    private static float dp(View view,float value){return value*view.getResources().getDisplayMetrics().density;}
    private static float clamp(float value,float low,float high){return Math.max(low,Math.min(Math.max(low,high),value));}
    private static boolean same(float first,float second){return Math.abs(first-second)<.01f;}
    private static View stack(View button){int id=button.getResources().getIdentifier("notification_stack_scroller","id","com.android.systemui");return id==0?null:button.getRootView().findViewById(id);}
    private static boolean shade(View button){
        View stack=stack(button);if(stack==null)return false;Object ambient=field(stack,"mAmbientState"),status=field(ambient,"mStatusBarState");
        return status instanceof Number&&NotificationLayoutPolicy.shadeAllowed(((Number)status).intValue(),Boolean.TRUE.equals(field(ambient,"mDozing")),
                Boolean.TRUE.equals(field(ambient,"mShowingStackOnLockscreen")),Boolean.TRUE.equals(field(ambient,"mShadeExpanded")));
    }
    private static boolean visible(View button,Object owner){
        if(!button.isAttachedToWindow()||!button.isShown()||Boolean.TRUE.equals(field(owner,"mQsCustomizing"))||Boolean.TRUE.equals(field(owner,"mQsExpanded")))return false;
        Display display=button.getDisplay();if(display!=null&&display.getState()!=Display.STATE_ON)return false;
        for(View view=button;view!=null;view=view.getParent() instanceof View?(View)view.getParent():null)if(view.getAlpha()<=.01f)return false;
        return true;
    }
    private static void background(View view,Drawable drawable){
        int left=view.getPaddingLeft(),top=view.getPaddingTop(),right=view.getPaddingRight(),bottom=view.getPaddingBottom();view.setBackground(drawable);
        // A drawable's padding is appearance metadata, never permission to resize the icon.
        if(view.getPaddingLeft()!=left||view.getPaddingTop()!=top||view.getPaddingRight()!=right||view.getPaddingBottom()!=bottom)view.setPadding(left,top,right,bottom);
    }
    private static Drawable colored(View view,Drawable nativeBackground,int color){
        if(nativeBackground!=null&&nativeBackground.getConstantState()!=null){
            return nativeBackground.getConstantState().newDrawable(view.getResources()).mutate();
        }
        // Some OEM low-animation variants have no background. Supply a bounded circle,
        // preserving the ImageButton's native foreground and its independently animated X.
        GradientDrawable fill=new GradientDrawable();fill.setShape(GradientDrawable.OVAL);fill.setColor(color);
        GradientDrawable mask=new GradientDrawable();mask.setShape(GradientDrawable.OVAL);mask.setColor(Color.WHITE);
        return new RippleDrawable(ColorStateList.valueOf(0x33000000|(color&0x00ffffff)),fill,mask);
    }
    private static void colorContents(Drawable drawable,ColorFilter filter){
        if(drawable instanceof RippleDrawable){
            RippleDrawable ripple=(RippleDrawable)drawable;
            for(int i=0;i<ripple.getNumberOfLayers();i++)if(ripple.getId(i)!=android.R.id.mask)colorContents(ripple.getDrawable(i),filter);
        }else if(drawable!=null&&drawable.getColorFilter()!=filter)drawable.setColorFilter(filter);
    }
    private static String filter(ColorFilter filter){
        if(filter==null)return "none";
        if(filter instanceof BlendModeColorFilter){BlendModeColorFilter selected=(BlendModeColorFilter)filter;return "BlendMode:"+Integer.toHexString(selected.getColor())+":"+selected.getMode();}
        return filter.getClass().getSimpleName();
    }
    private static String drawable(Drawable value){
        if(value==null)return "none";
        String text=value.getClass().getSimpleName()+"/filter="+filter(value.getColorFilter());
        if(value instanceof RippleDrawable){RippleDrawable ripple=(RippleDrawable)value;for(int i=0;i<ripple.getNumberOfLayers();i++)text+="/layer"+i+"="+filter(ripple.getDrawable(i).getColorFilter());}
        return text;
    }
    private static String tint(ColorStateList tint){return tint==null?"none":Integer.toHexString(tint.getDefaultColor());}
    private static final class State implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<View> button;final WeakReference<Object> owner;
        Drawable nativeBackground,appliedBackground;ColorStateList nativeTint;BlendModeColorFilter appliedFilter;
        float nativeX,nativeY,appliedX,appliedY,entry=1f;int color,nativeDepth;
        boolean applied,wasShown,refreshing,failed;ValueAnimator animator;String lastReport="";
        State(View view,Object source){button=new WeakReference<>(view);owner=new WeakReference<>(source);view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);}
        @Override public void onViewAttachedToWindow(View view){ViewTreeObserver observer=view.getViewTreeObserver();if(observer.isAlive()){observer.removeOnPreDrawListener(this);observer.addOnPreDrawListener(this);}refresh();}
        @Override public void onViewDetachedFromWindow(View view){ViewTreeObserver observer=view.getViewTreeObserver();if(observer.isAlive())observer.removeOnPreDrawListener(this);restore();wasShown=false;}
        @Override public boolean onPreDraw(){refresh();return true;}
        void beginNative(){if(nativeDepth++==0)restore();}
        void endNative(){nativeDepth=Math.max(0,nativeDepth-1);if(nativeDepth==0)refresh();}
        void stop(){ValueAnimator running=animator;animator=null;if(running!=null){running.removeAllUpdateListeners();running.cancel();}entry=1f;}
        void restore(){
            stop();View view=button.get();if(applied&&view!=null){
                if(view.getBackground()==appliedBackground)background(view,nativeBackground);
                if(same(view.getTranslationX(),appliedX))view.setTranslationX(nativeX);
                if(same(view.getTranslationY(),appliedY))view.setTranslationY(nativeY);
            }
            applied=false;nativeBackground=null;appliedBackground=null;nativeTint=null;appliedFilter=null;
        }
        void refresh(){
            View view=button.get();if(view==null||refreshing||nativeDepth>0)return;refreshing=true;
            try{
                boolean enabled=FeatureSettings.enabled(view.getContext(),NotificationAppearanceOptions.CLEAR);
                if(!enabled){if(applied||animator!=null)restore();wasShown=false;report(view,"native;reason=disabled");return;}
                boolean shown=visible(view,owner.get());boolean allowed=shade(view);
                if(!enabled||!shown||!allowed){restore();wasShown=false;report(view,!enabled?"native;reason=disabled":!shown?"native;reason=native-hidden":"native;reason=outside-notification-shade");return;}
                if(!(view.getParent() instanceof ViewGroup)||view.getWidth()<=0||view.getHeight()<=0)return;
                ViewGroup parent=(ViewGroup)view.getParent();if(parent.getWidth()<view.getWidth()||parent.getHeight()<view.getHeight())return;
                float[] area=safeArea(parent);
                if(area[2]-area[0]<view.getWidth()||area[3]-area[1]<view.getHeight()){restore();wasShown=false;report(view,"native;reason=insufficient-safe-area");return;}
                if(!applied){nativeBackground=view.getBackground();nativeTint=view.getBackgroundTintList();nativeX=view.getTranslationX();nativeY=view.getTranslationY();appliedX=nativeX;appliedY=nativeY;applied=true;}
                else{
                    // Follow a late native theme or animation update without accumulating ours.
                    if(view.getBackground()!=appliedBackground){nativeBackground=view.getBackground();appliedBackground=null;}
                    nativeTint=view.getBackgroundTintList();
                    if(!same(view.getTranslationX(),appliedX))nativeX=view.getTranslationX();
                    if(!same(view.getTranslationY(),appliedY))nativeY=view.getTranslationY();
                }
                boolean dark=(view.getResources().getConfiguration().uiMode&Configuration.UI_MODE_NIGHT_MASK)==Configuration.UI_MODE_NIGHT_YES;
                int selected=Color.parseColor(FeatureSettings.text(view.getContext(),dark?NotificationAppearanceOptions.CLEAR_DARK:NotificationAppearanceOptions.CLEAR_LIGHT,dark?"#44444C":"#E3E3E8"));
                if(appliedBackground==null||color!=selected){color=selected;appliedBackground=colored(view,nativeBackground,color);appliedFilter=new BlendModeColorFilter(color,BlendMode.SRC_IN);}
                if(view.getBackground()!=appliedBackground)background(view,appliedBackground);
                // setBackground reapplies View's theme tint, even an explicitly null tint list.
                // A drawable tint assigned before installation can therefore be cleared again.
                // ColorFilter has defined priority over tint: own it only on our isolated content
                // clone, after installation, preserving the View's theme tint and ripple mask.
                colorContents(appliedBackground,appliedFilter);
                int align=option(view,NotificationAppearanceOptions.CLEAR_ALIGN,0,0,3);
                float width=view.getWidth(),height=view.getHeight(),x=view.getLeft()+nativeX,y=view.getTop()+nativeY;
                if(align!=0){float inset=Math.min(dp(view,16),Math.max(0,(area[2]-area[0]-width)/2f));x=align==1?area[0]+inset:align==2?(area[0]+area[2]-width)/2f:area[2]-width-inset;}
                x=clamp(x+dp(view,option(view,NotificationAppearanceOptions.CLEAR_X,0,-120,120)),area[0],area[2]-width);
                y=clamp(y+dp(view,option(view,NotificationAppearanceOptions.CLEAR_Y,0,-24,24)),area[1],area[3]-height);
                // Direct siblings at another vertical level cannot block a fixed bottom button.
                for(int i=0;i<parent.getChildCount();i++){View other=parent.getChildAt(i);if(other==view||other.getVisibility()!=View.VISIBLE||!other.isClickable())continue;
                    float left=other.getLeft()+other.getTranslationX(),top=other.getTop()+other.getTranslationY(),right=left+other.getWidth(),bottom=top+other.getHeight();
                    if(x<right&&x+width>left&&y<bottom&&y+height>top){float after=right+dp(view,8),before=left-dp(view,8)-width;
                        x=after+width<=area[2]?after:before>=area[0]?before:clamp(view.getLeft()+nativeX,area[0],area[2]-width);}
                }
                float travel=dp(view,option(view,NotificationAppearanceOptions.CLEAR_TRAVEL,12,0,40));
                float movement=Math.min(travel,Math.max(0,area[3]-height-y));if(movement<1)movement=-Math.min(travel,Math.max(0,y-area[1]));
                if(!wasShown){wasShown=true;enter(view);}appliedX=x-view.getLeft();appliedY=y-view.getTop()+movement*(1-entry);
                if(!same(view.getTranslationX(),appliedX))view.setTranslationX(appliedX);if(!same(view.getTranslationY(),appliedY))view.setTranslationY(appliedY);
                report(view,"active;shown=true;align="+align+";x="+Math.round(x)+";y="+Math.round(y)+";width="+view.getWidth()+";height="+view.getHeight()+";color="+Integer.toHexString(color)+";travel="+Math.round(movement)+";theme="+(dark?"dark":"light")
                        +";bg="+drawable(view.getBackground())+";nativeBg="+drawable(nativeBackground)+";nativeTint="+tint(nativeTint)+";viewTint="+tint(view.getBackgroundTintList())
                        +";image="+drawable(((ImageButton)view).getDrawable()));
            }catch(RuntimeException error){if(!failed){failed=true;module.logFeatureError("NOTIFICATION_CLEAR_OEM_APPLY",error);}restore();report(view,"native;reason=apply-error");}
            finally{refreshing=false;}
        }
        void enter(View view){
            stop();int duration=option(view,NotificationAppearanceOptions.CLEAR_DURATION,220,0,600);if(duration==0||!ValueAnimator.areAnimatorsEnabled())return;
            entry=0;animator=ValueAnimator.ofFloat(0f,1f);animator.setDuration(duration);animator.setInterpolator(new DecelerateInterpolator());
            animator.addUpdateListener(animation->{entry=(Float)animation.getAnimatedValue();View current=button.get();if(current!=null){refresh();current.invalidate();}});animator.start();
        }
        void report(View view,String value){if(!value.equals(lastReport)){lastReport=value;FeatureSettings.diagnostic(view.getContext(),"ls_augment_notification_clear_runtime","adapter=DismissNotificationFeature;id="+ID+";"+value);}}
    }
    private static float[] safeArea(ViewGroup parent){
        float left=parent.getPaddingLeft(),top=parent.getPaddingTop(),right=parent.getWidth()-parent.getPaddingRight(),bottom=parent.getHeight()-parent.getPaddingBottom();
        WindowInsets window=parent.getRootWindowInsets();if(window!=null){Insets insets=window.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());
            int[] location=new int[2],rootLocation=new int[2];parent.getLocationInWindow(location);parent.getRootView().getLocationInWindow(rootLocation);int x=location[0]-rootLocation[0],y=location[1]-rootLocation[1];
            left=Math.max(left,insets.left-x);top=Math.max(top,insets.top-y);right=Math.min(right,parent.getRootView().getWidth()-insets.right-x);bottom=Math.min(bottom,parent.getRootView().getHeight()-insets.bottom-y);
        }
        return new float[]{left,top,right,bottom};
    }
}
