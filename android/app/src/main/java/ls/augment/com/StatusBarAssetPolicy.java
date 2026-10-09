package ls.augment.com;

/** Pure decisions shared by device rendering and previews; unknown state must preserve live system information. */
public final class StatusBarAssetPolicy {
    public static final class Resolution {
        public final StatusBarThemeSpec.Binding binding;
        public final String code,reason;
        private Resolution(StatusBarThemeSpec.Binding binding,String code,String reason){this.binding=binding;this.code=code;this.reason=reason;}
    }
    private StatusBarAssetPolicy() { }
    public static boolean composite(String id){return id.equals("wifi")||id.equals("secondary_wifi")||id.matches("mobile(?:[12]|_data)")
            ||id.equals("battery")||id.equals("connectivity")||id.equals("dual_signal")||id.equals("privacy.chip")||id.endsWith(".activity_inout");}
    public static boolean needsLiveState(String id){
        return id.equals("wifi")||id.equals("secondary_wifi")||id.equals("wifi.signal")||id.equals("secondary_wifi.signal")
                ||id.matches("mobile(?:[12]|_data)(?:\\.signal|\\.type)?")||id.endsWith(".standard")
                ||id.equals("battery")||id.equals("battery.fill")||id.equals("bluetooth")||id.equals("bluetooth.battery")
                ||id.equals("connectivity")||id.equals("dual_signal")||id.equals("volume")||id.equals("refresh_rate");
    }
    public static Resolution resolve(StatusBarThemeSpec theme,String id,String[] states,String layer,String surface){
        StatusBarThemeSpec.Binding binding=theme.resolve(id,states,layer,surface);
        if(binding==null)return new Resolution(null,"native_unmapped","当前状态未配置素材，保留原厂显示");
        if(layer.equals("whole")&&composite(id))return new Resolution(null,"native_composite","整组包含多个独立动态信息；请更换子组件样式或使用装饰图层");
        if(layer.equals("whole")&&needsLiveState(id)){
            // A single bitmap cannot stand for every signal/battery/network state. Old packages still load,
            // but their ambiguous whole/default binding no longer erases live state or error indicators.
            if(binding.state.equals("default"))return new Resolution(null,"native_dynamic_default","默认整图不能表达动态状态；请配置状态组或使用装饰图层");
            boolean known=false;if(states!=null)for(String state:states)if(!state.equals("default")&&!state.equals("unknown")){known=true;break;}
            if(!known)return new Resolution(null,"native_unknown_state","尚未取得可靠状态，保留原厂显示");
            if(id.endsWith(".signal")&&states!=null)for(String state:states)
                if(state.equals("disconnected")||state.equals("no_internet")){
                    if(!binding.state.equals(state))return new Resolution(null,"native_exceptional_state","当前断网状态没有对应素材，保留原厂提示");
                    break;
                }
        }
        return new Resolution(binding,"matched","已匹配素材");
    }
}
