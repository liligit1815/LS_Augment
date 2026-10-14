package ls.augment.com;

/** Known hardware restrictions shared with native controls; unknown features keep their own gates. */
public final class DeviceFeatureAvailability {
    private DeviceFeatureAvailability() { }

    public static boolean available(String key, String device, String model, String product) {
        return unavailableReason(key, device, model, product).isEmpty();
    }

    public static String unavailableReason(String key, String device, String model, String product) {
        String name = model == null || model.isEmpty() ? device : model;
        String machine = name == null || name.isEmpty() ? "此机型" : "本机 " + name;
        if (BrightnessRange.ENABLED.equals(key) && !BrightnessRange.supportedDevice(device, model))
            return machine + " 尚未验证完整亮度范围，暂不可用。当前仅支持 NX809J。";
        if ((ConfigSchema.FAN_FIXED_ENABLED.equals(key) || ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED.equals(key))
                && !FanTilePolicy.supportedDevice(device, model, product))
            return machine + " 尚未验证风扇硬件档位，固定转速与磁贴增强暂不可用。当前仅支持 NX809J。";
        if (ConfigSchema.FAN_SCREEN_OFF_ENABLED.equals(key)
                && !FanScreenOffPolicy.supportedDevice(device, product, model))
            return machine + " 的原厂息屏风扇策略尚未适配，息屏延续暂不可用。";
        return "";
    }
}
