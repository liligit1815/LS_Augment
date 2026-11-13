package ls.augment.com.hook;

import android.content.Context;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import ls.augment.com.IslandVisualSpec;

/** One native width contract for the material, content, hit area and status-bar reservation. */
final class IslandCompactWidth {
    private final Context context;
    private final Object manager;
    private final View island;
    private final Field single,multi;
    private final Method clamp,update;
    IslandCompactWidth(Context context,Object manager,View island)throws Exception{
        this.context=context;this.manager=manager;this.island=island;
        single=MagicIslandScenes.typed(island.getClass(),"mIslandWidth",int.class);
        multi=MagicIslandScenes.typed(island.getClass(),"mMultiIslandWidth",int.class);
        Class<?> base=Class.forName("com.zte.feature.dynamicisland.DynamicPermanentIsland",false,island.getClass().getClassLoader());
        clamp=MagicIslandScenes.exact(manager.getClass(),"getIslandWidth",int.class,int.class,boolean.class);
        update=MagicIslandScenes.exact(manager.getClass(),"updateIslandWidth",void.class,base);
    }
    void apply(float textWidth,boolean published)throws Exception{
        int screen=context.getResources().getDisplayMetrics().widthPixels;
        int available=Math.max(1,screen-dp(32));
        int lower=Math.min(dp(IslandVisualSpec.COMPACT_MIN),available);
        int upper=Math.min(dp(IslandVisualSpec.COMPACT_MAX),available);
        int desired=Math.max(lower,Math.min(upper,(int)Math.ceil(textWidth)+dp(48)));
        int one=(Integer)clamp.invoke(manager,desired,true),many=(Integer)clamp.invoke(manager,desired,false);
        if(one<=0||many<=0||one>available||many>available)throw new IllegalStateException("compact_safe_width_missing");
        int previousSingle=single.getInt(island),previousMulti=multi.getInt(island);
        boolean changed=previousSingle!=one||previousMulti!=many;
        if(!changed)return;
        single.setInt(island,one);multi.setInt(island,many);
        if(published)try{update.invoke(manager,island);}catch(Exception unavailable){
            single.setInt(island,previousSingle);multi.setInt(island,previousMulti);
            try{update.invoke(manager,island);}catch(Exception ignored){}
            throw unavailable;
        }
    }
    private int dp(int value){return Math.round(value*context.getResources().getDisplayMetrics().density);}
}
