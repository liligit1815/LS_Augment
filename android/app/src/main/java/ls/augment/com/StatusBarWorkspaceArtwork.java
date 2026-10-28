package ls.augment.com;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import java.util.LinkedHashMap;
import java.util.Map;

/** Bounded, asynchronous artwork cache for the shared settings example. */
final class StatusBarWorkspaceArtwork {
    private final Context context;
    private final Runnable changed;
    private final Handler main=new Handler(Looper.getMainLooper());
    private Map<String,Drawable> images=new LinkedHashMap<>();
    private StatusBarThemeSpec theme=StatusBarThemeSpec.empty();
    private String signature="",scope="all";
    private int generation;
    StatusBarWorkspaceArtwork(Context context,Runnable changed){this.context=context;this.changed=changed;}
    void update(StatusBarThemeSpec next,String surface){
        String key=surface+next.serialize();if(key.equals(signature))return;
        signature=key;theme=next;scope=surface;int expected=++generation;
        StatusBarEditSession.WORKER.execute(()->{
            Map<String,Drawable> loaded=new LinkedHashMap<>();
            for(StatusBarThemeSpec.Binding binding:next.entries())if(loaded.size()<32&&!loaded.containsKey(binding.asset)){
                try{loaded.put(binding.asset,StatusBarAssetStore.decode(StatusBarAssetStore.read(context,binding.asset),256));}
                catch(Exception unavailable){/* Same missing-asset policy as runtime: keep native sample. */}
            }
            main.post(()->{if(expected==generation){images=loaded;changed.run();}});
        });
    }
    void close(){generation++;images.clear();}
    boolean draw(Canvas canvas,String id,String state,RectF bounds,int tint,String layer){
        StatusBarThemeSpec.Binding binding=StatusBarAssetPolicy.resolve(theme,id,new String[]{state,"default"},layer,scope).binding;
        if(binding==null)return false;Drawable image=images.get(binding.asset);if(image==null)return false;
        float density=context.getResources().getDisplayMetrics().density;
        float scale=Math.min(bounds.width()/Math.max(1,image.getIntrinsicWidth()),bounds.height()/Math.max(1,image.getIntrinsicHeight()))*binding.scale/100f;
        int w=Math.max(1,Math.round(image.getIntrinsicWidth()*scale)),h=Math.max(1,Math.round(image.getIntrinsicHeight()*scale));
        int saved=canvas.save();canvas.translate(bounds.centerX()+binding.offsetX*density,bounds.centerY()+binding.offsetY*density);
        if(binding.mirror)canvas.scale(-1,1);
        image.setBounds(-w/2,-h/2,(w+1)/2,(h+1)/2);image.setAlpha(binding.opacity*255/100);
        image.setColorFilter(binding.originalColor?null:new PorterDuffColorFilter(tint,PorterDuff.Mode.SRC_IN));image.draw(canvas);canvas.restoreToCount(saved);return true;
    }
}
