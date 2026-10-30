package ls.augment.com;

/** Only verified OEM routes are selectable; unknown cards always keep native behavior. */
public final class MagicIslandPolicy {
    public static final String CAPABILITY="ls_augment_magic_island_capability";
    public static String scene(String key){
        if("charging_island".equals(key))return "charging";
        if("media_island".equals(key))return "media";
        if("cn.zte.aigcinput_notebook_ai_text_generation_progress".equals(key))return "ai_writing";
        if("com.zte.ai.knowledge_aik_island_main_card".equals(key))return "ai_memory";
        for(String source:new String[]{"zte.com.cn.alarmclock","com.zte.cn.zteshare","cn.zte.recorder",
                "com.android.dialer","com.zte.nebulatranslation","com.zte.multscr"}){
            String scene=NativeIslandCardProtocol.scene(source,key);if(scene!=null)return scene;
        }
        return null;
    }
    public static String source(String id){
        if("charging".equals(id)||"media".equals(id))return "com.android.systemui";
        if("ai_writing".equals(id))return "cn.zte.aigcinput";
        if("ai_memory".equals(id))return "com.zte.ai.knowledge";
        if(personal(id))return "com.zte.personalagent";
        if("countdown".equals(id)||"transfer".equals(id)||appSource(id))return NativeIslandCardProtocol.sourcePackage(id);
        return null;
    }
    public static boolean personal(String id){
        return "calendar_meeting".equals(id)||"scenic_guide".equals(id)||"nearby_charging".equals(id)
                ||"cycling".equals(id)||"flight".equals(id)||"preflight_battery".equals(id)||"weather_travel".equals(id)
                ||"taxi".equals(id)||"takeout".equals(id)||"train_12306".equals(id)||"train_travel".equals(id);
    }
    public static boolean managed(String id){return source(id)!=null;}
    public static boolean appSource(String id){return "record".equals(id)||"call".equals(id)
            ||"meeting".equals(id)||"ai".equals(id)||"nfc_transfer".equals(id)||"ai_memory".equals(id);}
    public static String detail(String id){
        if("record".equals(id))return "录音来自原厂录音机，保留原厂计时、标记、暂停或继续及结束操作。";
        if("call".equals(id))return "通话来自原厂拨号器，保留大卡片和当前通话状态允许的接听、挂断、音频切换及返回通话操作。";
        if("meeting".equals(id))return "会议指原厂会议转写卡片，可返回转写页面；日程提醒由单独的日程会议场景控制。";
        if("ai".equals(id))return "此处为原厂通话 AI 辅助卡片，可返回 AI 通话页面，不代表所有 AI 助手或一步助手场景。";
        if("ai_memory".equals(id))return "记忆卡片由原厂 AI 知识后台服务发送，显示处理中、成功、失败或取消；成功卡片沿用原厂详情入口及自动关闭时间。请启用 AI 知识后台服务作用域。";
        if("nfc_transfer".equals(id))return "文件传输来自多屏协同，保留等待确认、进度、结果及当前状态允许的接受、拒绝和取消操作，不包含 NFC 支付或门禁。";
        return "";
    }
    public static String unavailable(String id){
        if("face".equals(id))return "已核验固件在魔力岛模式跳过人脸岛，不能用旧版开关启用";
        if("torch".equals(id))return "已核验固件只有旧版手电筒岛，魔力岛拒绝此类视图";
        if("low_power".equals(id)||"bluetooth".equals(id)||"headset".equals(id))
            return "已核验固件在魔力岛模式停用旧版短时提示岛，未提供对应魔力岛卡片";
        return "当前魔力岛分支尚未核验此场景，保留原厂行为";
    }
    private MagicIslandPolicy(){}
}
