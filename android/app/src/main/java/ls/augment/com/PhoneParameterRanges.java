package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;

/** Geometry comes from the phone's current OEM resources, never a desktop helper. */
final class PhoneParameterRanges {
    private PhoneParameterRanges() { }
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
