package ls.augment.com;

import java.util.ArrayList;
import java.util.List;

/** Shared scene identifiers; unknown OEM scenes retain their native behavior. */
public final class NativeIslandSceneOptions {
    public static final String ENABLED = "ls_augment_native_island_scene_support";
    public static final String[] IDS = {"record", "torch", "call", "media", "countdown", "face", "meeting", "ai", "ai_memory", "charging", "low_power", "bluetooth", "headset"};
    public static final String[] LABELS = {"录音", "手电筒", "通话", "音乐播放", "倒计时", "人脸识别", "会议", "AI 助手", "AI 记忆", "充电", "低电量", "蓝牙", "耳机"};
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
                "允许此场景在星云岛显示。开启后随下一次场景状态更新生效；缺少原厂能力时保留原生行为并记录原因。"));
        return options;
    }
    public static NativeFeatureGroups.Feature feature() {
        NativeFeatureGroups.Feature[] children = new NativeFeatureGroups.Feature[IDS.length];
        for (int i = 0; i < IDS.length; i++) children[i] = new NativeFeatureGroups.Feature(key(IDS[i]), LABELS[i], key(IDS[i]), new String[0], "boolean", "0", new NativeFeatureGroups.Feature[0]);
        return new NativeFeatureGroups.Feature(ENABLED, "星云岛场景支持", ENABLED, new String[0], "boolean", "0", children);
    }
    private NativeIslandSceneOptions() { }
}
