package ls.augment.com;
import android.content.Context;
import android.os.Build;
public final class FanFeatureAvailability {
    public static boolean levels(Context context){return FanTilePolicy.supportedDevice(Build.DEVICE,Build.MODEL,Build.PRODUCT)
            ||FanCapabilityEvidence.levels(evidence(context,FanCapabilityEvidence.LEVELS),FanHardwareIdentity.current());}
    public static boolean screen(Context context){return FanScreenOffPolicy.supportedDevice(Build.DEVICE,Build.PRODUCT,Build.MODEL)
            ||FanCapabilityEvidence.screen(evidence(context,FanCapabilityEvidence.SCREEN),FanHardwareIdentity.current());}
    private static String evidence(Context context,String key){return context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key,"");}
    public static String reason(Context context,String key){return DeviceFeatureAvailability.unavailableReason(key,Build.DEVICE,Build.MODEL,Build.PRODUCT,levels(context),screen(context));}
    private FanFeatureAvailability(){}
}
