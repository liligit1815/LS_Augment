package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** One scene selection shared by the UI, native renderers and source processes. */
public final class IslandSceneRegistry {
    public static final String SCHEMA = "ls_augment_island_scene_schema";
    public static final String VERSION = "2";
    public static final class Scene {
        public final String id, title, key, group;
        Scene(String id, String title, String group) {
            this.id=id; this.title=title; this.group=group; this.key=key(id);
        }
    }
    private static final List<Scene> SCENES;
    static {
        ArrayList<Scene> scenes = new ArrayList<>();
        scenes.add(new Scene("notifications", "普通通知", "通知与传输"));
        scenes.add(new Scene("downloads", "上传与下载", "通知与传输"));
        for (int i=0;i<NativeIslandSceneOptions.IDS.length;i++) {
            String id=NativeIslandSceneOptions.IDS[i];
            String group=MagicIslandPolicy.personal(id)?"出行与生活服务"
                    :"transfer".equals(id)||"nfc_transfer".equals(id)?"通知与传输"
                    :"record".equals(id)||"call".equals(id)||"meeting".equals(id)||id.startsWith("ai")?"通话录音与AI":"系统活动";
            scenes.add(new Scene(id,NativeIslandSceneOptions.LABELS[i],group));
        }
        scenes.add(new Scene("navigation", "地图导航", "出行与生活服务"));
        scenes.add(new Scene("screen_record", "屏幕录制", "系统活动"));
        scenes.add(new Scene("hotspot", "个人热点", "系统活动"));
        SCENES=Collections.unmodifiableList(scenes);
    }
    public static List<Scene> scenes() { return SCENES; }
    public static String key(String id) {
        if ("media".equals(id)) return SystemUiOptions.PREFIX+"island_music";
        if ("charging".equals(id)||"notifications".equals(id)) return SystemUiOptions.PREFIX+"island_"+id;
        if ("downloads".equals(id)) return IslandDownloadConfig.ENABLED;
        return NativeIslandSceneOptions.key(id);
    }
    public static boolean known(String id) {
        for (Scene scene:SCENES) if (scene.id.equals(id)) return true;
        return false;
    }
    public static List<EnhancementOption> additionalOptions() {
        ArrayList<EnhancementOption> options=new ArrayList<>();
        options.add(EnhancementOption.internal(SCHEMA,"0",value->"0".equals(value)||VERSION.equals(value)?value:null));
        for (Scene scene:SCENES) if ("navigation".equals(scene.id)||"screen_record".equals(scene.id)||"hotspot".equals(scene.id))
            options.add(EnhancementOption.toggle(scene.key,"systemui",scene.title,
                    "navigation".equals(scene.id)?"读取地图导航的持续通知，内容与操作来自原通知。仅在来源和显示条件满足时上岛，关闭或无法显示时保留原厂提醒；不会自行开始导航。"
                    :"screen_record".equals(scene.id)?"读取系统录屏的真实状态，展开后沿用原厂录屏操作。关闭后恢复原厂提醒；开启本项不会开始录屏。"
                    :"热点已开启时显示实际连接设备数，可进入系统热点管理。关闭或无法接管时保留原厂提醒；开启本项不会打开热点。"));
        return options;
    }
    /** Old completion toggles did not disable existing native scenes. Preserve that behavior. */
    public static Map<String,String> migrate(Map<String,String> old, boolean fullscreen) {
        if (VERSION.equals(old.get(SCHEMA))) return Collections.emptyMap();
        LinkedHashMap<String,String> next=new LinkedHashMap<>();
        boolean supplement=truth(old.get(NativeIslandSceneOptions.ENABLED));
        for (int i=0;i<NativeIslandSceneOptions.IDS.length;i++) {
            String id=NativeIslandSceneOptions.IDS[i];
            if ("media".equals(id)||"charging".equals(id)) continue;
            boolean enabled=i<NativeIslandSceneOptions.TYPES.length || fullscreen&&MagicIslandPolicy.managed(id)
                    || supplement&&truth(old.get(NativeIslandSceneOptions.key(id)));
            next.put(key(id),enabled?"1":"0");
        }
        next.put(SCHEMA,VERSION);
        return next;
    }
    public static String[] parameterKeys() {
        ArrayList<String> keys=new ArrayList<>();
        for(Scene scene:SCENES)keys.add(scene.key);
        Collections.addAll(keys,SystemUiOptions.ISLAND_FIRST_EXPAND,IslandNoticeRules.KEY,IslandNoticeBlacklist.KEY,IslandDownloadConfig.CHANNELS,
                SystemUiOptions.PREFIX+"island_notice_seconds");
        return keys.toArray(new String[0]);
    }
    /** Recognized only for legacy data cleanup/import; never registered as active settings. */
    static boolean retiredSetting(String key) {
        return "ls_augment_island_custom_appearance".equals(key)
                || "ls_augment_rm_island_width".equals(key) || "ls_augment_rm_island_height".equals(key)
                || "ls_augment_rm_island_offset_x".equals(key) || "ls_augment_rm_island_offset_y".equals(key)
                || "ls_augment_rm_island_transparent".equals(key) || "ls_augment_rm_island_app_style".equals(key)
                || NativeIslandSceneOptions.key("media").equals(key) || NativeIslandSceneOptions.key("charging").equals(key);
    }
    /** Validate old checksummed snapshots before discarding their inactive fields. */
    static boolean validRetiredValue(String key,String value) {
        if(!retiredSetting(key))return false;
        int min=0,max=1;
        if("ls_augment_rm_island_width".equals(key)){min=96;max=240;}
        else if("ls_augment_rm_island_height".equals(key)){min=20;max=48;}
        else if("ls_augment_rm_island_offset_x".equals(key)){min=-120;max=120;}
        else if("ls_augment_rm_island_offset_y".equals(key)){min=-24;max=24;}
        else if("ls_augment_rm_island_transparent".equals(key))max=2;
        try{int number=Integer.parseInt(value);return number>=min&&number<=max&&String.valueOf(number).equals(value);}
        catch(NumberFormatException invalid){return false;}
    }
    private static boolean truth(String value) { return "1".equals(value)||"true".equalsIgnoreCase(value); }
    private IslandSceneRegistry() { }
}
