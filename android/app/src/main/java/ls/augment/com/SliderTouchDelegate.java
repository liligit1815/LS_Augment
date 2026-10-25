package ls.augment.com;

import android.graphics.Rect;
import android.graphics.Region;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo.TouchDelegateInfo;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/** Extends compact native sliders into unused space without intercepting sibling controls. */
final class SliderTouchDelegate extends TouchDelegate {
    private final ViewGroup owner;
    private final TouchDelegate previous;
    private final ArrayList<ParameterSeekBar> sliders=new ArrayList<>();
    private ParameterSeekBar active;

    private SliderTouchDelegate(ViewGroup owner,TouchDelegate previous){super(new Rect(),owner);this.owner=owner;this.previous=previous;}
    static SliderTouchDelegate attach(ViewGroup owner,ParameterSeekBar slider){
        TouchDelegate current=owner.getTouchDelegate();
        SliderTouchDelegate delegate=current instanceof SliderTouchDelegate?(SliderTouchDelegate)current:new SliderTouchDelegate(owner,current);
        if(!delegate.sliders.contains(slider))delegate.sliders.add(slider);
        owner.setTouchDelegate(delegate);return delegate;
    }
    void remove(ParameterSeekBar slider){
        sliders.remove(slider);if(active==slider)active=null;
        if(sliders.isEmpty()&&owner.getTouchDelegate()==this)owner.setTouchDelegate(previous);
    }
    @Override public boolean onTouchEvent(MotionEvent event){
        if(event.getActionMasked()==MotionEvent.ACTION_DOWN){
            active=null;float nearest=Float.MAX_VALUE;
            for(ParameterSeekBar slider:sliders){
                if(!slider.isShown()||!slider.isEnabled())continue;
                Rect bounds=slider.expandedTouchBounds(owner);
                if(bounds.contains((int)event.getX(),(int)event.getY())){
                    float distance=Math.abs(event.getY()-bounds.exactCenterY());
                    if(distance<nearest){active=slider;nearest=distance;}
                }
            }
        }
        if(active==null)return previous!=null&&previous.onTouchEvent(event);
        // Native TouchDelegate centers X, which would jump a slider to 50%.
        // Preserve the pointer's horizontal coordinate and its complete gesture.
        MotionEvent forwarded=MotionEvent.obtain(event);Rect nativeBounds=active.nativeBounds(owner);
        forwarded.offsetLocation(-nativeBounds.left,active.getHeight()/2f-event.getY());
        boolean handled=active.dispatchTouchEvent(forwarded);forwarded.recycle();
        if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL)active=null;
        return handled;
    }
    @Override public TouchDelegateInfo getTouchDelegateInfo(){
        Map<Region,View> regions=new LinkedHashMap<>();
        for(ParameterSeekBar slider:sliders)if(slider.isShown()&&slider.isEnabled())regions.put(new Region(slider.expandedTouchBounds(owner)),slider);
        return regions.isEmpty()?super.getTouchDelegateInfo():new TouchDelegateInfo(regions);
    }
}
