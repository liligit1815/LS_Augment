package ls.augment.com;

import java.util.*;

/** Semantic roles, independent of OEM slot names and of whether an icon is currently visible. */
public final class StatusBarIconCatalog {
    public static final class Icon {
        public final String id, title, group;
        public final String[] states, layers;
        private Icon(String id,String title,String group,String[] states) {
            this.id=id;this.title=title;this.group=group;this.states=states.clone();
            this.layers=new String[]{"whole","background","foreground"};
        }
    }
    private static final LinkedHashMap<String,Icon> ICONS=new LinkedHashMap<>();
    private static final String[] BASIC={"default"};
    private static final String[] SIGNAL={"default","disconnected","no_internet","level0","level1","level2","level3","level4","level5"};
    private static final String[] POWER={"default","charging","bypass","power_save","battery0_19","battery20_50","battery51_79","battery80_100"};
    static {
        add("wifi","Wi-Fi","网络与连接",SIGNAL);
        add("secondary_wifi","副 Wi-Fi","网络与连接",SIGNAL);
        for(String base:new String[]{"wifi","secondary_wifi"}) {
            String title=base.equals("wifi")?"Wi-Fi":"副 Wi-Fi";
            add(base+".signal",title+"强度","网络附属元素",SIGNAL);
            add(base+".activity_in",title+"下载箭头","网络附属元素",BASIC);
            add(base+".activity_out",title+"上传箭头","网络附属元素",BASIC);
            add(base+".activity_inout",title+"收发箭头（合并）","网络附属元素",BASIC);
            add(base+".standard",title+"标准数字","网络附属元素",new String[]{"default","wifi4","wifi5","wifi6","wifi7"});
        }
        for(int card=1;card<=2;card++) {
            String id="mobile"+card,title="卡 "+card;
            add(id,title+"信号","网络与连接",SIGNAL);
            add(id+".signal",title+"强度","网络附属元素",SIGNAL);
            add(id+".type",title+"网络类型图片","网络附属元素",new String[]{"default","2g","3g","4g","4g_plus","5g","5g_plus"});
            for(String part:new String[]{"activity_in","activity_out","activity_inout","roaming","volte","no_network"})
                add(id+"."+part,title+partLabel(part),"网络附属元素",BASIC);
        }
        add("mobile_data","当前上网卡","网络与连接",SIGNAL);
        add("mobile_data.signal","当前上网卡强度","网络附属元素",SIGNAL);
        add("mobile_data.type","当前上网卡网络类型图片","网络附属元素",new String[]{"default","2g","3g","4g","4g_plus","5g","5g_plus"});
        for(String part:new String[]{"activity_in","activity_out","activity_inout","roaming","volte","no_network"})
            add("mobile_data."+part,"当前上网卡"+partLabel(part),"网络附属元素",BASIC);
        add("bluetooth","蓝牙","网络与连接",new String[]{"default","connected","disconnected"});
        add("bluetooth.battery","蓝牙设备电量","电量",POWER);
        for(String[] entry:new String[][]{{"hotspot","热点"},{"nfc","NFC"},{"location","定位"},{"airplane","飞行模式"},{"vpn","VPN"},{"cast","投屏"},{"connected_display","连接显示器"},{"ethernet","有线网络"},{"data_saver","流量节省"},{"satellite","卫星连接"},{"ims_icon","HD / IMS"}})
            add(entry[0],entry[1],"网络与连接",BASIC);
        add("battery","电池整体","电量",POWER);
        for(String[] entry:new String[][]{{"shell","电池外壳"},{"fill","电池填充 / 圆环"},{"charging","充电标记"},{"bypass","旁路充电标记"}})
            add("battery."+entry[0],entry[1],"电量",POWER);
        add("connectivity","三合一整体","电量",POWER);
        add("dual_signal","双排信号整体","网络与连接",SIGNAL);
        for(String[] entry:new String[][]{{"alarm_clock","闹钟"},{"zen","勿扰"},{"mute","静音"},{"volume","振动 / 静音"},{"headset","耳机"},{"rotate","旋转锁定"},{"tty","TTY"},{"managed_profile","工作资料"},{"sensors_off","传感器关闭"},{"screen_record","录屏"}})
            add(entry[0],entry[1],"声音与设备状态",entry[0].equals("volume")?new String[]{"default","vibrate","silent"}:BASIC);
        add("cooling_fan","散热风扇","红魔专属",new String[]{"default","active"});
        add("liquid_cooling","液冷","红魔专属",new String[]{"default","active"});
        add("refresh_rate","刷新率","红魔专属",new String[]{"default","60","90","120","144","165","auto"});
        for(String[] entry:new String[][]{{"privacy.camera","摄像头提示"},{"privacy.microphone","麦克风提示"},{"privacy.location","定位提示"},{"privacy.projection","屏幕共享提示"},{"privacy.dot","隐私圆点"},{"privacy.chip","隐私提示胶囊"},{"system_activity","系统活动标志"}})
            add(entry[0],entry[1],"隐私与系统提示",BASIC);
        add("user_switcher","切换用户图标","其他系统对象",BASIC);
        add("user_avatar","锁屏用户头像","其他系统对象",BASIC);
    }
    private StatusBarIconCatalog() { }
    private static void add(String id,String title,String group,String[] states){ICONS.put(id,new Icon(id,title,group,states));}
    public static List<Icon> all(){return Collections.unmodifiableList(new ArrayList<>(ICONS.values()));}
    public static Icon find(String id){return ICONS.get(id);}
    public static boolean validId(String id){return id!=null&&id.matches("[A-Za-z][A-Za-z0-9_.:-]{0,79}");}
    public static String layerLabel(String layer){return "background".equals(layer)?"背景层":"foreground".equals(layer)?"前景层":"整图";}
    public static String stateLabel(String state){
        if(state==null)return "";
        switch(state){case "default":return "默认 / 其余状态";case "connected":return "已连接";case "disconnected":return "未连接";
            case "no_internet":return "无互联网";case "charging":return "充电中";case "bypass":return "旁路充电";case "power_save":return "省电模式";case "active":return "运行中";case "vibrate":return "振动";case "silent":return "静音";case "auto":return "自动";}
        if(state.startsWith("level"))return "强度 "+state.substring(5);
        if(state.matches("battery[0-9]+_[0-9]+"))return "电量 "+state.substring(7).replace('_','–')+"%";
        return state;
    }
    private static String partLabel(String part){switch(part){case "activity_in":return "下载箭头";case "activity_out":return "上传箭头";case "activity_inout":return "收发箭头（合并）";case "roaming":return "漫游";case "volte":return "HD / VoLTE";default:return "无网络标记";}}
}
