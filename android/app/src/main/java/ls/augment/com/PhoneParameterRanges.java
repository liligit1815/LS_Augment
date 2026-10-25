package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;

/** Geometry comes from the phone's current OEM resources, never a desktop helper. */
final class PhoneParameterRanges {
    private PhoneParameterRanges() { }
    static void island(Activity activity,ParameterSlider slider,String key,java.util.function.Function<String,String> value){
        android.view.WindowMetrics metrics=activity.getSystemService(android.view.WindowManager.class).getMaximumWindowMetrics();
        float density=activity.getResources().getDisplayMetrics().density;
        int hostWidth=metrics.getBounds().width();
        int hostHeight=metrics.getWindowInsets().getInsetsIgnoringVisibility(android.view.WindowInsets.Type.statusBars()).top;
        if(hostHeight<=0){slider.unavailable("暂未读取到本机状态栏高度，请返回后重新进入");return;}
        String prefix=SystemUiOptions.PREFIX+"island_";
        int width=Math.min(Math.round(Integer.parseInt(value.apply(prefix+"width"))*density),Math.max(0,hostWidth-Math.round(16*density)));
        int height=Math.min(Math.round(Integer.parseInt(value.apply(prefix+"height"))*density),Math.max(0,hostHeight-Math.round(2*density)));
        int min=0,max=0;
        if(key.equals(prefix+"width")){min=96;max=Math.min(240,(int)Math.floor((hostWidth-Math.round(16*density))/density));}
        else if(key.equals(prefix+"height")){min=20;max=Math.min(48,(int)Math.floor((hostHeight-Math.round(2*density))/density));}
        else if(key.equals(prefix+"offset_x")){
            max=Math.min(120,Math.max(0,(int)Math.floor(((hostWidth-width)/2-Math.round(8*density))/density)));min=-max;
        }else if(key.equals(prefix+"offset_y")){
            int available=Math.max(0,hostHeight-height);
            min=-Math.min(24,(int)Math.floor((available/2)/density));
            max=Math.min(24,(int)Math.floor((available-available/2)/density));
        }
        if(max<min){slider.unavailable("当前状态栏空间不足以使用此尺寸，请先调整状态栏高度");return;}
        slider.range(min,max,"本机范围："+min+"～"+max+" dp · 随胶囊尺寸与状态栏空间变化");
    }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi,PrivateApi
    static void oneHand(Activity activity,ParameterSlider slider){
        try{
            Resources resources=activity.createPackageContext("com.android.systemui",0).getResources();
            int id=resources.getIdentifier("config_one_handed_offset","fraction","com.android.systemui");
            if(id==0)throw new Resources.NotFoundException();
            int percentage=Math.round(resources.getFraction(id,1,1)*100);
            // Same override and rounding as OneHandedController on the supported ROM.
            try{
                Class<?> properties=Class.forName("android.os.SystemProperties");
                percentage=(Integer)properties.getMethod("getInt",String.class,int.class)
                        .invoke(null,"persist.debug.one_handed_offset_percentage",percentage);
            }catch(ReflectiveOperationException|RuntimeException ignored){ }
            Rect bounds=activity.getSystemService(android.view.WindowManager.class).getMaximumWindowMetrics().getBounds();
            int original=Math.round(Math.max(bounds.width(),bounds.height())*percentage/100f);
            if(original<=0)throw new Resources.NotFoundException();
            // RedMagicAdvancedUiHook: 0 < original - delta < original * 2.5.
            int min=Math.max(-1000,original-(int)Math.ceil(original*2.5)+1);
            int max=Math.min(1000,original-1);
            slider.range(min,max,"本机范围："+min+"～"+max+" px · 原厂下移 "+original+" px");
        }catch(android.content.pm.PackageManager.NameNotFoundException|Resources.NotFoundException failure){
            slider.unavailable("未能读取本机单手模式距离，请确认系统界面适配后重新进入");
        }
    }
}
