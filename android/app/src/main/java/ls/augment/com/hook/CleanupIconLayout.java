package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;

/** Resize only the attested control, never the legacy recents scroll page. */
final class CleanupIconLayout {
    private final WeakReference<View> image,clickHost;
    private int nativeWidth,nativeHostWidth,appliedWidth,appliedHostWidth;
    private boolean changed;
    CleanupIconLayout(View image,View host){this.image=new WeakReference<>(image);clickHost=new WeakReference<>(host);}
    void update(boolean c17){
        View view=image.get(),host=clickHost.get();if(view==null)return;
        ViewGroup.LayoutParams params=view.getLayoutParams();if(params==null)return;
        // ClearAllButton is a page in RecentsView: its size participates in native
        // task/scroll geometry. Only the separately attested ImageView may widen.
        if(!c17||!(view instanceof android.widget.ImageView)){restore(view,host,params);return;}
        int height=params.height>0?params.height:view.getHeight();if(height<=0)return;
        if(!changed){nativeWidth=params.width;nativeHostWidth=host!=null&&host.getLayoutParams()!=null?host.getLayoutParams().width:0;}
        int width=Math.round(CleanupCapsule.width(view)),screen=view.getRootView().getWidth();
        if(screen>0)width=Math.min(width,screen);
        appliedWidth=width;changed=true;
        if(params.width!=width){params.width=width;view.setLayoutParams(params);}
        if(host!=null&&host!=view&&host.getLayoutParams()!=null&&nativeHostWidth>0){
            ViewGroup.LayoutParams hostParams=host.getLayoutParams();
            appliedHostWidth=width+Math.max(0,nativeHostWidth-Math.max(0,nativeWidth));
            if(screen>0)appliedHostWidth=Math.min(appliedHostWidth,screen);
            if(hostParams.width!=appliedHostWidth){hostParams.width=appliedHostWidth;host.setLayoutParams(hostParams);}
        }
    }
    private void restore(View view,View host,ViewGroup.LayoutParams params){
        if(!changed)return;
        if(params.width==appliedWidth){params.width=nativeWidth;view.setLayoutParams(params);}
        if(host!=null&&host.getLayoutParams()!=null&&appliedHostWidth>0&&host.getLayoutParams().width==appliedHostWidth){
            ViewGroup.LayoutParams hostParams=host.getLayoutParams();hostParams.width=nativeHostWidth;host.setLayoutParams(hostParams);
        }
        changed=false;appliedHostWidth=0;
    }
}
