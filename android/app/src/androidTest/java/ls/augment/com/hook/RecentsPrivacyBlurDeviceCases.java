package ls.augment.com.hook;

import android.graphics.Bitmap;
import org.json.JSONObject;

/** Real Android pixels, including hardware screenshot readback; no launcher/app state changes. */
public final class RecentsPrivacyBlurDeviceCases {
    public static JSONObject run()throws Exception{
        Bitmap source=Bitmap.createBitmap(384,768,Bitmap.Config.ARGB_8888);
        int[] pixels=new int[384*768];
        for(int y=0;y<768;y++)for(int x=0;x<384;x++){
            int base=y<384?0xffff4020:0xff2060ff;
            pixels[y*384+x]=(x/4+y/4)%2==0?base:0xff101010;
        }
        source.setPixels(pixels,0,384,0,0,384,768);
        int generation=source.getGenerationId();
        Bitmap blurred=RecentsPrivacyBackdrop.createBlur(source);
        check(blurred.getWidth()==96&&blurred.getHeight()==192,"bounded aspect-preserving output");
        check(source.getGenerationId()==generation&&!source.isRecycled(),"native bitmap is read-only");
        check(blurred.getPixel(48,48)!=blurred.getPixel(48,144),"image colors remain, no solid replacement");
        int strongest=0;
        for(int y=20;y<70;y++)for(int x=20;x<70;x++){
            int a=blurred.getPixel(x,y),b=blurred.getPixel(x+1,y);
            strongest=Math.max(strongest,Math.abs((a>>16&255)-(b>>16&255)));
            check((a>>>24)==255,"blurred pixels opaque over live surface");
        }
        check(strongest<12,"fine checker/text detail suppressed");
        Bitmap hardware=source.copy(Bitmap.Config.HARDWARE,false);
        check(hardware!=null&&hardware.getConfig()==Bitmap.Config.HARDWARE,"hardware screenshot fixture");
        Bitmap hardwareBlur=RecentsPrivacyBackdrop.createBlur(hardware);
        check(hardwareBlur!=null&&hardwareBlur.getPixel(48,48)==blurred.getPixel(48,48),"hardware and software pixels match");
        check(!hardware.isRecycled(),"hardware source preserved");
        Bitmap transparent=Bitmap.createBitmap(1,1,Bitmap.Config.ARGB_8888),tiny=RecentsPrivacyBackdrop.createBlur(transparent);
        check(tiny.getWidth()==1&&(tiny.getPixel(0,0)>>>24)==255,"transparent small input safely opaque");
        tiny.recycle();transparent.recycle();hardwareBlur.recycle();hardware.recycle();blurred.recycle();source.recycle();
        check(RecentsPrivacyBackdrop.createBlur(source)==null&&RecentsPrivacyBackdrop.createBlur(null)==null,"recycled/missing source skipped");
        return new JSONObject().put("success",true).put("hardwareReadback",true).put("maxFineDetailStep",strongest).put("sourceUnchanged",true);
    }
    private static void check(boolean okay,String message){if(!okay)throw new AssertionError(message);}
}
