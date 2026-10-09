package ls.augment.com;

/** Short, profile-bound evidence of the currently bound native Wi-Fi carrier. */
public final class StatusBarWifiSpacingObservation {
    public static final String KEY="ls_augment_statusbar_wifi_spacing_contract_";
    public final String reason;
    public final StatusBarHeaderSpacingObservation profile;
    public StatusBarWifiSpacingObservation(String reason,StatusBarHeaderSpacingObservation profile){this.reason=reason;this.profile=profile;}
    public String serialize(){return reason+";"+profile.serialize();}
    public static StatusBarWifiSpacingObservation parse(String raw){
        if(raw==null||raw.length()>280)return null;int split=raw.indexOf(';');if(split<1)return null;
        String reason=raw.substring(0,split);if(!java.util.Arrays.asList("native","missing","gravity","asset","asset_cells","mirror","scale","size","drawable","hidden","direction").contains(reason))return null;
        StatusBarHeaderSpacingObservation profile=StatusBarHeaderSpacingObservation.parse(raw.substring(split+1));return profile==null?null:new StatusBarWifiSpacingObservation(reason,profile);
    }
    public static String key(String surface,int rotation,String id){return KEY+surface+"_"+rotation+"_"+id.substring(0,id.indexOf('.'));}
    public String explanation(){
        switch(reason){
            case "native":return "已观察到可适配的原厂 Wi-Fi 图层";
            case "asset":return "当前子图层使用自定义素材，独立间距尚未适配；当前保留原厂边距，已保存参数保留";
            case "asset_cells":return "自定义素材使用独立画布，信号和活动箭头分别预留空间；未知或不足的空间保留原厂显示";
            case "mirror":return "当前图案自行镜像，尚未确认安全的图层位置；当前保留原厂边距";
            case "gravity":return "当前图层锚点不同于已适配的原厂布局；当前保留原厂边距";
            case "scale":return "当前图层缩放方式不同于已适配的原厂布局；当前保留原厂边距";
            case "size":return "当前两个图层尺寸不一致；当前保留原厂边距";
            case "direction":return "当前图层与父容器的排列方向不一致；当前保留原厂边距";
            case "hidden":return "当前原生 Wi-Fi 信号组未显示；当前保留原厂边距，请在原生图标出现后刷新";
            default:return "当前未取得完整的原厂 Wi-Fi 图层；当前保留原厂边距";
        }
    }
}
