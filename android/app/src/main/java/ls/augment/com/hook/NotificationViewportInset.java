package ls.augment.com.hook;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.function.BooleanSupplier;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Uses the ROM's existing notification bottom-inset contract. No drawing or touch override. */
final class NotificationViewportInset implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
    static final String CONTAINER="com.android.systemui.shade.NotificationsQuickSettingsContainer";
    private final WeakReference<View> stack;
    private final BooleanSupplier active;
    private final Runnable changed;
    private WeakReference<View> parent=new WeakReference<>(null);
    private int nativeBottom,ownedBottom=-1,nativeDepth,clipDepth,lastHeight=-1,constraintOwned=-1,failedTarget=Integer.MIN_VALUE;
    private boolean explicitNativeMargin;
    private boolean writing,closed;
    private Rect nativeClip,ownedClip;
    private String reported="";

    NotificationViewportInset(View view,BooleanSupplier active,Runnable changed){
        stack=new WeakReference<>(view);this.active=active;this.changed=changed;
        view.addOnAttachStateChangeListener(this);if(view.isAttachedToWindow())onViewAttachedToWindow(view);
    }
    private ViewGroup.MarginLayoutParams layout(){
        View view=stack.get();if(view==null||!(view.getParent() instanceof View))return null;
        View p=(View)view.getParent();ViewGroup.LayoutParams raw=view.getLayoutParams();
        if(!CONTAINER.equals(p.getClass().getName())||field(p,"mStackScroller")!=view
                ||!(raw instanceof ViewGroup.MarginLayoutParams)||raw.height!=ViewGroup.LayoutParams.MATCH_PARENT)return null;
        ViewGroup.MarginLayoutParams lp=(ViewGroup.MarginLayoutParams)raw;
        if(parent.get()!=p){parent=new WeakReference<>(p);nativeBottom=lp.bottomMargin;ownedBottom=-1;}
        else if(ownedBottom<0||lp.bottomMargin!=ownedBottom){nativeBottom=lp.bottomMargin;ownedBottom=-1;}
        return lp;
    }
    private int nativeHeight(){
        View view=stack.get(),p=parent.get();
        return view==null||p==null?0:Math.max(0,p.getHeight()-p.getPaddingBottom()-view.getTop()-nativeBottom);
    }

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private View clearButton(View source){
        int id=source.getResources().getIdentifier("iv_dismiss_notification_view","id","com.android.systemui");
        return id==0?null:source.getRootView().findViewById(id);
    }
    private int desiredHeight(boolean enabled){
        View source=stack.get();if(source==null)return 0;
        if(layout()==null)return source.getHeight();
        int height=nativeHeight();View button=enabled?clearButton(source):null;
        if(button==null||!button.isShown()||button.getWidth()<=0||button.getHeight()<=0)return height;
        // The OEM fixed clear is outside the scrolling list. A list footer is not an inset.
        for(android.view.ViewParent p=button.getParent();p instanceof View;p=p.getParent())if(p==source)return height;
        for(View v=button;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)if(v.getAlpha()<=0)return height;
        // Root/window coordinates are pixels; do not interpret a scaled parent as layout space.
        for(View v=source;v!=null;v=v.getParent() instanceof View?(View)v.getParent():null)
            if(Math.abs(v.getScaleY()-1f)>.001f||Math.abs(v.getScaleX()-1f)>.001f)return height;
        Rect visible=new Rect();if(!button.getGlobalVisibleRect(visible)||visible.isEmpty())return height;
        int[] position=new int[2];source.getLocationInWindow(position);
        if(visible.right<=position[0]||visible.left>=position[0]+source.getWidth())return height;
        int gap=Math.round(8*source.getResources().getDisplayMetrics().density);
        return Math.max(0,Math.min(height,visible.top-position[1]-gap));
    }
    /** Prospective capacity comes from the parent and latest native margin, never the owned height. */
    int heightForHeader(){return desiredHeight(true);}
    int beforeNativeMargin(int value){
        if(writing)return value;
        failedTarget=Integer.MIN_VALUE;
        if(nativeDepth>0){nativeBottom=value;explicitNativeMargin=true;return value;}
        if(layout()==null)return value;
        nativeBottom=value;
        // Suppress observation of the previous owned LP until the original setter receives its argument.
        View view=stack.get();ownedBottom=((ViewGroup.MarginLayoutParams)view.getLayoutParams()).bottomMargin;
        int target=value+Math.max(0,nativeHeight()-desiredHeight(active.getAsBoolean()));
        ownedBottom=target==value?-1:target;return target;
    }
    void beginNative(){if(nativeDepth++==0){constraintOwned=ownedBottom;explicitNativeMargin=false;restore();}}
    void endNative(){
        nativeDepth=Math.max(0,nativeDepth-1);if(nativeDepth!=0)return;
        View source=stack.get();ViewGroup.LayoutParams lp=source==null?null:source.getLayoutParams();
        // The controller clones the current ConstraintSet BEFORE calling applyConstraints.
        // That clone may contain our inset; it is not a new native resource value.
        if(!explicitNativeMargin&&constraintOwned>=0&&lp instanceof ViewGroup.MarginLayoutParams
                &&((ViewGroup.MarginLayoutParams)lp).bottomMargin==constraintOwned)write(nativeBottom);
        constraintOwned=-1;layout();refresh();
    }
    boolean isWriting(){return writing;}
    boolean hasOwnedState(){return ownedBottom>=0||ownedClip!=null;}
    boolean refresh(){
        if(closed||writing||nativeDepth>0||clipDepth>0)return false;
        boolean enabled=active.getAsBoolean();
        // Prospective header capacity is queried when a header is enabled. With
        // no owned inset/clip, native shade frames need no window/button lookup.
        if(!enabled&&!hasOwnedState()){lastHeight=-1;return false;}
        View source=stack.get();ViewGroup.MarginLayoutParams lp=layout();if(source==null)return false;
        if(lp==null){restore();return false;}
        int height=desiredHeight(enabled),wanted=nativeBottom+Math.max(0,nativeHeight()-height);
        boolean different=lp.bottomMargin!=wanted;
        if(different&&(failedTarget==wanted||!write(wanted))){
            failedTarget=wanted;
            FeatureSettings.diagnostic(source.getContext(),"ls_augment_notification_viewport_runtime","adapter=NotificationsQuickSettingsContainer;native-setter-unavailable;bottom="+lp.bottomMargin);
            return false; // Never cancel every frame or pretend a rejected layout mutation worked.
        }
        failedTarget=Integer.MIN_VALUE;
        ownedBottom=wanted==nativeBottom?-1:wanted;
        updateClip(ownedBottom>=0?height:-1);
        String state="adapter=NotificationsQuickSettingsContainer;native="+nativeBottom+";bottom="+wanted+";viewport="+height+";owned="+(ownedBottom>=0);
        if(!state.equals(reported)){reported=state;FeatureSettings.diagnostic(source.getContext(),"ls_augment_notification_viewport_runtime",state);}
        int prospective=desiredHeight(true);
        boolean capacityChanged=lastHeight!=prospective;lastHeight=prospective;
        if(capacityChanged)changed.run();
        return different;
    }
    private boolean write(int margin){
        View p=parent.get(),source=stack.get();if(p==null||source==null)return false;writing=true;
        try{call(p,"setNotificationsMarginBottom",margin);ViewGroup.LayoutParams raw=source.getLayoutParams();return raw instanceof ViewGroup.MarginLayoutParams&&((ViewGroup.MarginLayoutParams)raw).bottomMargin==margin;}
        catch(ReflectiveOperationException ignored){/* No unsupported direct LP fallback. */}
        finally{writing=false;}
        return false;
    }
    private void updateClip(int height){
        View source=stack.get();if(source==null)return;Rect current=source.getClipBounds();
        if(ownedClip==null||!ownedClip.equals(current))nativeClip=current==null?null:new Rect(current);
        Rect wanted=height<0?(nativeClip==null?null:new Rect(nativeClip)):new Rect(0,0,source.getWidth(),height);
        if(height>=0&&nativeClip!=null&&!wanted.intersect(nativeClip))wanted.setEmpty();
        if(current==null?wanted!=null:!current.equals(wanted))source.setClipBounds(wanted);
        ownedClip=height<0?null:new Rect(wanted);
    }
    void beginNativeClip(){if(clipDepth++==0)updateClip(-1);}
    void endNativeClip(){clipDepth=Math.max(0,clipDepth-1);if(clipDepth==0)refreshClip();}
    void refreshClip(){if(!writing&&nativeDepth==0&&clipDepth==0)updateClip(ownedBottom>=0&&active.getAsBoolean()?desiredHeight(true):-1);}
    void restore(){
        View source=stack.get();if(source==null)return;layout();
        ViewGroup.LayoutParams raw=source.getLayoutParams();
        if(source.getParent()==parent.get()&&ownedBottom>=0&&raw instanceof ViewGroup.MarginLayoutParams&&((ViewGroup.MarginLayoutParams)raw).bottomMargin==ownedBottom)write(nativeBottom);
        updateClip(-1);
        ownedBottom=-1;lastHeight=-1;
    }
    @Override public boolean onPreDraw(){return !refresh();}
    @Override public void onViewAttachedToWindow(View view){if(view.getViewTreeObserver().isAlive()){view.getViewTreeObserver().removeOnPreDrawListener(this);view.getViewTreeObserver().addOnPreDrawListener(this);}}
    @Override public void onViewDetachedFromWindow(View view){restore();if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);}
    void close(){restore();closed=true;View view=stack.get();if(view!=null){view.removeOnAttachStateChangeListener(this);if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);}}
}
