package ls.augment.com;

/** Known hardware restrictions shared with native controls; unknown features keep their own gates. */
public final class DeviceFeatureAvailability {
    private DeviceFeatureAvailability() { }

    public static boolean available(String key, String device, String model, String product) {
        return unavailableReason(key, device, model, product).isEmpty();
    }

    public static String unavailableReason(String key, String device, String model, String product) {
        return unavailableReason(key,device,model,product,FanTilePolicy.supportedDevice(device,model,product),
                FanScreenOffPolicy.supportedDevice(device,product,model));
    }
    public static String unavailableReason(String key,String device,String model,String product,boolean levels,boolean screen) {
        String name = model == null || model.isEmpty() ? device : model;
        String machine = name == null || name.isEmpty() ? "此机型" : "本机 " + name;
        if ((ConfigSchema.FAN_FIXED_ENABLED.equals(key) || ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED.equals(key))
                && !levels)
            return machine + " 尚未识别到可用的风扇档位。请启用原厂风扇作用域并重启该作用域，识别完成后自动开放固定转速与磁贴增强；仍不可用时可导出日志核对驱动。";
        if (ConfigSchema.FAN_SCREEN_OFF_ENABLED.equals(key)
                && !screen)
            return machine + " 尚未识别到兼容的原厂息屏风扇策略。请启用并重启风扇作用域，识别完成后自动开放息屏延续。";
        return "";
    }
}
