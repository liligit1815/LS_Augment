package ls.augment.com.hook;

import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/** Fixed reference center. No task lookup, frame callback or card tracking. */
final class CleanupCapsulePosition implements View.OnLayoutChangeListener {
    // NX809J: card bottom 2194, physical bottom 2688 -> center (608, 2441).
    // The user explicitly requested this measured position be fixed in code.
    static final float CENTER_Y_FRACTION=2441f/2688f;
    private final WeakReference<View> image;
    private WeakReference<View> anchor=new WeakReference<>(null),root=new WeakReference<>(null);
    private float originalX,originalY,appliedX,appliedY;
    private boolean enabled,moved;
    private String lastDiagnostic="";
    private final Runnable initial=this::place;
    CleanupCapsulePosition(View image){this.image=new WeakReference<>(image);}
    void update(boolean value){
        View view=image.get();
        if(!value||view==null||!view.isAttachedToWindow()){
            enabled=false;
            if(view!=null){view.removeCallbacks(initial);view.removeOnLayoutChangeListener(this);}
            View host=anchor.get(),screen=root.get();
            if(host!=null)host.removeOnLayoutChangeListener(this);
            if(screen!=null)screen.removeOnLayoutChangeListener(this);
            restore();anchor.clear();root.clear();return;
        }
        if(enabled)return;
        View host=null;
        for(android.view.ViewParent p=view.getParent();p instanceof View;p=p.getParent()){
            if(isType((View)p,"com.android.quickstep.views.OverviewActionsView")){host=(View)p;break;}
            if(isType((View)p,"com.android.quickstep.views.MFVClearAllButton")){host=view;break;}
        }
        if(host==null){report(view,"native_position:missing_standalone_action_host");return;}
        enabled=true;anchor=new WeakReference<>(host);root=new WeakReference<>(view.getRootView());
        view.addOnLayoutChangeListener(this);host.addOnLayoutChangeListener(this);view.getRootView().addOnLayoutChangeListener(this);
        // Inflation may precede measurement. The layout callbacks below only run
        // when actual bounds change, not on scroll, animation or rendering frames.
        view.post(initial);
    }
    @Override public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob){
        if(l!=ol||t!=ot||r!=or||b!=ob)place();
    }
    void place(){
        View view=image.get(),host=anchor.get(),screen=root.get();
        if(!enabled||view==null||host==null||screen==null||view.getWidth()==0||screen.getHeight()==0)return;
        if(!(host.getParent() instanceof View))return;
        View parent=(View)host.getParent();
        // These inspected hosts are an unscaled standalone actions row or an
        // image inside the full-size MFV control. Preserve unknown transforms.
        for(View v=host;v!=screen;){
            if(v.getScaleX()!=1f||v.getScaleY()!=1f||v.getRotation()!=0f){restore();report(view,"native_position:transformed_action_host");return;}
            if(!(v.getParent() instanceof View)){restore();return;}v=(View)v.getParent();
        }
        RectF control=layoutBounds(view,screen),area=layoutBounds(parent,screen);
        float cx=screen.getWidth()/2f,cy=screen.getHeight()*CENTER_Y_FRACTION;
        float dx=cx-control.centerX(),dy=cy-control.centerY();
        if(otherAction(host,view)||control.left+dx<area.left||control.right+dx>area.right
                ||control.top+dy<area.top||control.bottom+dy>area.bottom){
            restore();report(view,"native_position:action_or_parent_bounds");return;
        }
        float tx=host.getTranslationX(),ty=host.getTranslationY();
        if(!moved||Math.abs(tx-appliedX)>.01f)originalX=tx;
        if(!moved||Math.abs(ty-appliedY)>.01f)originalY=ty;
        appliedX=tx+dx;appliedY=ty+dy;moved=true;
        if(Math.abs(dx)>.01f)host.setTranslationX(appliedX);
        if(Math.abs(dy)>.01f)host.setTranslationY(appliedY);
        report(view,"fixed_reference;center="+Math.round(cx)+","+Math.round(cy)+";screen="+screen.getWidth()+"x"+screen.getHeight());
    }
    static RectF layoutBounds(View view,View root){
        float x=0,y=0;View at=view;
        while(at!=root){
            x+=at.getLeft()+at.getTranslationX();y+=at.getTop()+at.getTranslationY();
            if(!(at.getParent() instanceof View))break;
            at=(View)at.getParent();x-=at.getScrollX();y-=at.getScrollY();
        }
        return new RectF(x,y,x+view.getWidth(),y+view.getHeight());
    }
    private static boolean otherAction(View root,View image){
        if(root.getVisibility()!=View.VISIBLE||root==image)return false;
        if(root.isClickable()&&!ancestor(root,image))return true;
        if(root instanceof ViewGroup){ViewGroup g=(ViewGroup)root;for(int i=0;i<g.getChildCount();i++)if(otherAction(g.getChildAt(i),image))return true;}
        return false;
    }
    private static boolean ancestor(View candidate,View child){
        for(android.view.ViewParent p=child.getParent();p instanceof View;p=p.getParent())if(p==candidate)return true;
        return false;
    }
    private static boolean isType(View view,String name){
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals(name))return true;
        return false;
    }
    private void restore(){
        View host=anchor.get();if(host!=null&&moved){
            if(Math.abs(host.getTranslationX()-appliedX)<.01f)host.setTranslationX(originalX);
            if(Math.abs(host.getTranslationY()-appliedY)<.01f)host.setTranslationY(originalY);
        }
        moved=false;
    }
    private void report(View view,String value){
        if(value.equals(lastDiagnostic))return;lastDiagnostic=value;
        FeatureSettings.diagnostic(view.getContext(),"ls_augment_cleanup_position_runtime",value);
    }
}
