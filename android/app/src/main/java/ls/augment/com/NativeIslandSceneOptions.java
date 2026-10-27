package ls.augment.com;

import java.util.ArrayList;
import java.util.List;

/** Shared scene identifiers; unknown OEM scenes retain their native behavior. */
public final class NativeIslandSceneOptions {
    public static final String ENABLED = "ls_augment_native_island_scene_support";
    public static final String[] IDS = {"record", "torch", "call", "media", "countdown", "face", "meeting", "ai", "ai_memory", "charging", "low_power", "bluetooth", "headset", "transfer", "nfc_transfer", "calendar_meeting", "scenic_guide", "nearby_charging", "cycling", "flight", "preflight_battery", "weather_travel"};
    public static final String[] LABELS = {"录音", "手电筒", "通话", "音乐播放", "倒计时", "人脸识别", "会议", "AI 助手", "AI 记忆", "充电", "低电量", "蓝牙", "耳机", "互传", "NFC 文件传输", "日程会议提醒", "景区导览", "附近充电宝", "骑行与还车", "航班行程", "出行前省电建议", "异常天气出行建议"};
    // App-provided cards have no ordinary *Island class; only the first 13 map here.
    public static final String[] TYPES = {"RecorderIsland", "FlashlightIsland", "CallIsland", "MediaIsland", "CountDownIsland", "FaceDetectIsland", "MeetingIsland", "AIIsland", "AIMemIsland", "ChargingIsland", "LowPowerIsland", "BluetoothIsland", "HeadsetIsland"};
    public static String key(String id) { return ENABLED + "_" + id; }
    public static String id(Class<?> type) {
        for (Class<?> current = type; current != null; current = current.getSuperclass())
            for (int i = 0; i < TYPES.length; i++)
                if (current.getName().equals("com.zte.feature.dynamicisland.islands." + TYPES[i])) return IDS[i];
        return null;
    }
    public static List<EnhancementOption> options() {
        List<EnhancementOption> options = new ArrayList<>();
        options.add(EnhancementOption.toggle(ENABLED, "systemui", "星云岛场景支持",
                "开启星云岛后，可展开选择需要支持的场景。关闭本项恢复原厂场景选择；各场景仍须具备原厂接口，未知结构保持原生行为。"));
        for (int i = 0; i < IDS.length; i++) options.add(EnhancementOption.toggle(key(IDS[i]), "systemui", LABELS[i],
                "transfer".equals(IDS[i])
                        ? "系统互传发送或接收文件时显示真实进度。轻点展开，点进度控件取消本次传输。需启用系统互传作用域并通过原厂能力检测。"
                        : "nfc_transfer".equals(IDS[i])
                        ? "NFC 碰一碰文件传输时显示等待、进度和结果，沿用原厂取消操作。需启用多屏协同作用域并通过能力检测，不适用于 NFC 支付或门禁。"
                        : "calendar_meeting".equals(IDS[i])
                        ? "显示小星建议（魔姬建议）识别的日程会议提醒。轻点展开原厂卡片，可进入会议、忽略或打开日历详情。需先在原厂应用启用服务及会议提醒，再启用其作用域；普通日程不一定产生会议卡片。"
                        : "scenic_guide".equals(IDS[i])
                        ? "显示小星建议（魔姬建议）产生的景区导览提醒。轻点展开，点击正文或图标打开原厂景区详情。需启用原厂建议服务、景区导览提醒及其作用域，并等待能力检测通过；开启本项不会自行生成景区提醒。"
                        : "nearby_charging".equals(IDS[i])
                        ? "显示小星建议（魔姬建议）产生的附近充电宝提醒，沿用原厂未充电且电量不高于 30% 的条件。轻点展开，按钮优先打开怪兽充电小程序；原厂入口不可用时退回微信首页。需启用原厂建议服务、充电宝提醒及其作用域，并通过能力检测；开始充电或电量回升后由原厂撤卡。"
                        : "flight".equals(IDS[i])
                        ? "显示原厂建议识别的航班行程，沿用各阶段的显示时限。轻点展开；旧版卡片保留详情入口，新版卡片可按行程阶段提供去机场、打车或订票入口，操作以打开的应用为准。需启用原厂建议、飞机出行服务及其作用域，并具备当前卡片所需的应用、网页或地图入口。开启本项不会自行查询航班，多日前及飞行中阶段按原厂规则不展示。"
                        : "weather_travel".equals(IDS[i])
                        ? "显示原厂根据天气和通勤目的地产生的出行建议。轻点展开，可选择更多出行方式或打车，沿用原厂助手入口；助手不可用时通过原厂地图入口打开路线或打车页面。需启用原厂建议服务、异常天气提醒及其作用域，并具备可用的助手、地图或原厂商店入口；实际出行操作以打开的应用为准。"
                        : "preflight_battery".equals(IDS[i])
                        ? "显示原厂在航班出发前产生的低电量省电建议。轻点展开，点击“开启”、正文或图标沿用原厂省电操作；无法直接开启时打开省电设置。已开启省电时显示充电提醒并隐藏按钮。需启用原厂建议服务、相关出行与低电量提醒及其作用域，并通过能力检测；不会自行生成行程或模拟电量。"
                        : "cycling".equals(IDS[i])
                        ? "显示原厂建议识别的骑行时长、还车中和骑行结束状态。轻点展开；正文或图标打开来源骑行应用，“还车”由原厂一步助手操作该平台，结果以实际车辆和平台状态为准。需启用原厂建议服务、共享单车提醒及其作用域，并等待原厂还车能力就绪；开启本项不会自行识别骑行或启动还车。"
                        : "允许此场景在星云岛显示。开启后随下一次场景状态更新生效；缺少原厂能力时保留原生行为并记录原因。"));
        return options;
    }
    public static NativeFeatureGroups.Feature feature() {
        NativeFeatureGroups.Feature[] children = new NativeFeatureGroups.Feature[IDS.length];
        for (int i = 0; i < IDS.length; i++) children[i] = new NativeFeatureGroups.Feature(key(IDS[i]), LABELS[i], key(IDS[i]), new String[0], "boolean", "0", new NativeFeatureGroups.Feature[0]);
        return new NativeFeatureGroups.Feature(ENABLED, "星云岛场景支持", ENABLED, new String[0], "boolean", "0", children);
    }
    private NativeIslandSceneOptions() { }
}
