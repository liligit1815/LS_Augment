package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import static ls.augment.com.hook.SystemUiAdapter.field;

/** The two OEM panels coexist in the APK; discover controls only inside their live content. */
final class ControlCenterGlassTargets {
    static final String MODERN="com.zte.mifavor.qs.MfvQSContainerImpl";
    static final String CONTENT="com.zte.mifavor.qs.MfvQSContent";
    interface Visitor { void tile(View view); void slider(View frame,SeekBar seek); default void media(View view){ } }
    private ControlCenterGlassTargets(){ }
    static boolean isType(View view,String name){
        for(Class<?> type=view==null?null:view.getClass();type!=null;type=type.getSuperclass())
            if(name.equals(type.getName()))return true;
        return false;
    }
    static boolean modern(View panel){return isType(panel,MODERN);}
    static void collect(View panel,Visitor visitor){
        Object content=field(panel,"qsContent");
        if(content instanceof View)scan((View)content,visitor,0,new int[]{512});
        // qsContent owns the paged and quick panels; detail/customizer are sibling
        // windows and deliberately never scanned. Horizontal brightness owns its
        // real SeekBar track, unlike the rotated legacy frame.
        Object brightness=field(panel,"brightnessView"),seek=field(brightness,"mSlider");
        if(seek instanceof SeekBar)visitor.slider((SeekBar)seek,(SeekBar)seek);
    }

    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static void scan(View view,Visitor visitor,int depth,int[] budget){
        if(depth>12||budget[0]--<=0)return;
        String name=view.getClass().getName();
        if(isType(view,"com.zte.qs.tileimpl.QSTileViewWide")||isType(view,"com.zte.qs.tileimpl.QSTileViewCircle")){
            visitor.tile(view);return;
        }
        if(isType(view,"com.android.systemui.util.animation.TransitionLayout")){
            for(String idName:new String[]{"qs_media_controls","qs_media_controls_zte"}){
                int id=view.getResources().getIdentifier(idName,"id","com.android.systemui");
                if(id!=0&&view.findViewById(id)==view){visitor.media(view);return;}
            }
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount()&&budget[0]>0;i++)scan(group.getChildAt(i),visitor,depth+1,budget);
        }
    }
}
