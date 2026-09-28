package ls.augment.com;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.InputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

/** Original transparent PNG pair supplied in 素材/初音未来.zip. */
final class BackGesturePresets {
    static final String ROOT="gesture-presets/miku/";
    private BackGesturePresets() { }
    static String[] importMiku(Context context)throws Exception {
        String[] hashes=new String[2];
        String[] names={"gesture_back_arrow.png","gesture_back_background.png"};
        for(int i=0;i<names.length;i++)try(InputStream in=context.getAssets().open(ROOT+names[i])){
            Bitmap image=BitmapFactory.decodeStream(in);
            if(image==null)throw new IOException("初音未来素材读取失败");
            try{hashes[i]=LauncherIconStore.save(context,image);}finally{image.recycle();}
        }
        return hashes;
    }
    static Map<String,String> values(int side,String[] hashes){
        Map<String,String> out=new LinkedHashMap<>();
        for(String field:BackGestureIconPolicy.FIELDS){String key=BackGestureIconPolicy.key(side,field);out.put(key,ConfigSchema.defaultValue(key));}
        out.put(BackGestureIconPolicy.key(side,"asset"),hashes[0]);
        out.put(BackGestureIconPolicy.key(side,"background_asset"),hashes[1]);
        out.put(BackGestureIconPolicy.key(side,"mode"),"1");
        out.put(BackGestureIconPolicy.key(side,"scale_percent"),"200");
        out.put(BackGestureIconPolicy.key(side,"inset_dp"),"6");
        out.put(BackGestureIconPolicy.key(side,"mirror"),side==1?"1":"0");
        return out;
    }
}
