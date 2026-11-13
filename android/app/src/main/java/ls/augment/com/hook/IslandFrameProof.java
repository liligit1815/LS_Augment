package ls.augment.com.hook;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Objects;

/** Confirms a content revision after a draw, without creating an idle animation loop. Main-thread only. */
final class IslandFrameProof {
    private final Map<View,Object> drawn=new IdentityHashMap<>();
    private final Map<View,Pending> pending=new IdentityHashMap<>();
    private final class Pending implements ViewTreeObserver.OnDrawListener {
        final View view;final Object revision;final Runnable changed;
        boolean posted;
        Pending(View view,Object revision,Runnable changed){this.view=view;this.revision=revision;this.changed=changed;}
        @Override public void onDraw(){
            if(posted||!visible(view))return;
            posted=true;
            view.post(()->{
                if(pending.get(view)!=this)return;
                remove(view);
                if(visible(view)){drawn.put(view,revision);changed.run();}
            });
        }
    }
    boolean confirm(View view,Object revision,Runnable changed){
        if(view==null||revision==null||!visible(view))return false;
        if(Objects.equals(drawn.get(view),revision))return true;
        Pending old=pending.get(view);
        if(old==null||!Objects.equals(old.revision,revision)){
            remove(view);Pending request=new Pending(view,revision,changed);pending.put(view,request);
            view.getViewTreeObserver().addOnDrawListener(request);view.invalidate();
        }
        return false;
    }
    static boolean visible(View view){
        if(view==null||!view.isAttachedToWindow()||!view.isShown()||view.getWindowVisibility()!=View.VISIBLE
                ||view.getWidth()<=0||view.getHeight()<=0)return false;
        float alpha=1f;
        for(View current=view;current!=null;){
            alpha*=current.getAlpha();if(alpha<=.01f)return false;
            android.view.ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;
        }
        Rect bounds=new Rect();return view.getGlobalVisibleRect(bounds)&&!bounds.isEmpty();
    }
    private void remove(View view){
        Pending request=pending.remove(view);
        if(request!=null&&view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnDrawListener(request);
    }
    void forget(View view){remove(view);drawn.remove(view);}
    void retain(java.util.Set<View> live){
        for(View view:pending.keySet().toArray(new View[0]))if(!live.contains(view))forget(view);
        drawn.keySet().retainAll(live);
    }
    void clear(){for(View view:pending.keySet().toArray(new View[0]))remove(view);drawn.clear();}
}
