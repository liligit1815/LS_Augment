package ls.augment.com;

public final class TestStatusBarAssetPolicy {
    private static final String A="a".repeat(64),B="b".repeat(64);
    private static int checks;
    private static void check(boolean condition,String reason){checks++;if(!condition)throw new AssertionError(reason);}
    private static StatusBarThemeSpec.Binding b(String id,String state,String surface){return new StatusBarThemeSpec.Binding(id,state,"whole",A,false,100,0,0,100,false,surface);}
    public static void main(String[] args){
        StatusBarThemeSpec legacy=StatusBarThemeSpec.empty().with(b("wifi.signal","level2","all"));
        check(legacy.serialize().startsWith("1;"),"unchanged shared themes retain the old wire format");
        check(StatusBarThemeSpec.parse(legacy.serialize()).serialize().equals(legacy.serialize()),"old packages retain canonical representation");
        StatusBarThemeSpec scoped=legacy.with(b("wifi.signal","level3","lock"));
        check(scoped.serialize().startsWith("2;")&&StatusBarThemeSpec.parse(scoped.serialize()).serialize().equals(scoped.serialize()),"scoped theme roundtrip");
        check(scoped.resolve("wifi.signal",new String[]{"level2"},"whole","main")!=null,"ordinary statusbar inherits shared theme");
        check(scoped.resolve("wifi.signal",new String[]{"level2"},"whole","lock")==null,"a partial lock theme cannot silently borrow another scheme's missing state");
        check(scoped.resolve("wifi.signal",new String[]{"level3"},"whole","lock").surface.equals("lock"),"lock uses its exact override");
        check(scoped.without("wifi.signal","lock").serialize().equals(legacy.serialize()),"restoring one surface preserves shared theme");
        for(String surface:StatusBarSurfaceSpec.SURFACES)check(StatusBarSurfaceSpec.valid(surface),"four surfaces valid");
        check(StatusBarSurfaceSpec.fromPanelType(1).equals("control")&&StatusBarSurfaceSpec.fromPanelType(2).equals("notification")
                &&StatusBarSurfaceSpec.fromPanelType(3).equals("notification")&&StatusBarSurfaceSpec.fromPanelType(99).isEmpty(),"native panel roles do not guess unknown roles or confuse merged controls");
        StatusBarFontSpec fonts=StatusBarFontSpec.empty().with("global","font:"+A).with("clock","font:"+B,"lock");
        check(fonts.resolve("clock","main").equals("font:"+A)&&fonts.resolve("clock","lock").equals("font:"+B),"font scope inheritance");
        check(fonts.with("global","original","control").resolve("clock","control").equals("original"),"surface original bypasses inherited fonts");
        check(StatusBarFontSpec.parse(fonts.serialize()).serialize().equals(fonts.serialize()),"font v2 roundtrip");
        check(StatusBarFontSpec.parse("1;global=font:"+A).serialize().equals("1;global=font:"+A),"font v1 roundtrip");
        check(StatusBarFontSpec.parse("2;shade:clock=original")==null,"unknown font context rejected");
        check(StatusBarThemeSpec.parse("2;wifi.signal,level2,whole,"+A+",0,100,0,0,100,0,shade")==null,"unknown asset context rejected");
        StatusBarThemeSpec defaultSignal=StatusBarThemeSpec.empty().with(b("mobile1.signal","default","all"));
        check(StatusBarAssetPolicy.resolve(defaultSignal,"mobile1.signal",new String[]{"level5"},"whole","main").code.equals("native_dynamic_default"),"a default bitmap cannot invent a full signal");
        for(String id:new String[]{"mobile1","mobile2","mobile_data","wifi","secondary_wifi","battery","dual_signal","connectivity"}){
            StatusBarThemeSpec theme=StatusBarThemeSpec.empty().with(b(id,"level3","all"));
            check(StatusBarAssetPolicy.resolve(theme,id,new String[]{"level3"},"whole","main").code.equals("native_composite"),"composite keeps independently changing data: "+id);
        }
        check(StatusBarAssetPolicy.resolve(legacy,"wifi.signal",new String[]{"no_internet","level2"},"whole","main").code.equals("native_exceptional_state"),"missing no-internet asset must preserve native warning");
        check(StatusBarAssetPolicy.resolve(legacy,"wifi.signal",new String[]{"level2"},"whole","main").binding!=null,"exact known signal state may replace its shape");
        check(StatusBarAssetPolicy.resolve(legacy,"wifi.signal",new String[]{"unknown"},"whole","main").binding==null,"unknown state preserves native");
        StatusBarThemeSpec shell=StatusBarThemeSpec.empty().with(b("battery.shell","default","all"));
        check(StatusBarAssetPolicy.resolve(shell,"battery.shell",new String[]{"battery57"},"whole","main").binding!=null,"static shell remains replaceable while fill and charging stay live");
        StatusBarThemeSpec ranges=StatusBarThemeSpec.empty().with(b("battery.fill","battery0_19","all")).with(b("battery.fill","battery0_50","lock"));
        check(ranges.resolve("battery.fill",new String[]{"battery35"},"whole","main")==null&&ranges.resolve("battery.fill",new String[]{"battery35"},"whole","lock")!=null,"battery ranges overlap only across independent surfaces");
        System.out.println("Status-bar scoped assets and live-state policy: "+checks+" assertions passed");
    }
}
