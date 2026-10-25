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
            return machine + " 尚未验证风扇硬件档位，固定转速与磁贴增强暂不可用。请先核验本机风扇作用域的驱动与接口。";
        if (ConfigSchema.FAN_SCREEN_OFF_ENABLED.equals(key)
                && !screen)
            return machine + " 的原厂息屏风扇策略尚未适配，息屏延续暂不可用。";
        return "";
    }
}
