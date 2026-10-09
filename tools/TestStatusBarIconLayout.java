package ls.augment.com;

import java.util.*;

/** Boundary rules survive import/reset, and priority never promotes an ineligible system object. */
public final class TestStatusBarIconLayout {
    private static void check(boolean value,String reason){if(!value)throw new AssertionError(reason);}
    private static void same(StatusBarIconSpacingSpec.Insets value,int start,int top,int end,int bottom){check(value.start==start&&value.top==top&&value.end==end&&value.bottom==bottom,"wrong inherited edge values");}
    public static void main(String[] args){
        StatusBarIconSpacingSpec.Insets space=new StatusBarIconSpacingSpec.Insets(3,2,9,4);
        StatusBarIconSpacingSpec spec=StatusBarIconSpacingSpec.empty().with("all","wifi",space).with("lock","wifi",StatusBarIconSpacingSpec.ZERO).with("main","notifications",new StatusBarIconSpacingSpec.Insets(1,0,2,0));
        same(spec.resolve("main","wifi"),3,2,9,4);same(spec.resolve("lock","wifi"),0,0,0,0);
        same(spec.resolve("main","mobile1"),0,0,0,0);same(spec.resolve("control","notifications"),0,0,0,0);
        check(space.left(false)==3&&space.right(false)==9&&space.left(true)==9&&space.right(true)==3,"RTL must mirror logical boundaries");
        String canonical=spec.serialize();check(canonical.equals(StatusBarIconSpacingSpec.parse(canonical).serialize()),"spacing round trip");
        same(StatusBarIconSpacingSpec.parse(canonical).resolve("lock","wifi"),0,0,0,0);
        StatusBarIconSpacingSpec inherited=spec.with("lock","wifi",null);same(inherited.resolve("lock","wifi"),3,2,9,4);
        same(inherited.with("all","wifi",null).resolve("main","wifi"),0,0,0,0);
        check(StatusBarIconSpacingSpec.empty().serialize().isEmpty(),"empty/default should not invent a rule");
        for(String malformed:new String[]{"IS2;all,wifi,1,1,1,1","IS1;all,wifi,-1,0,0,0","IS1;all,wifi,25,0,0,0","IS1;all,wifi,1.5,0,0,0","IS1;main,wifi,0,0,0,0;main,wifi,1,1,1,1","IS1;shade,wifi,0,0,0,0","IS1;all,wifi.standard,1,1,1,1","IS1;all,unknown_icon,1,1,1,1","IS1;all,wifi,0,0,0","IS1;"})
            check(StatusBarIconSpacingSpec.parse(malformed)==null,"invalid/overlapping spacing accepted: "+malformed);
        for(String id:new String[]{"wifi","secondary_wifi","mobile1","mobile2","bluetooth","vpn","battery","connectivity","notifications","privacy.camera"})check(StatusBarIconSpacingSpec.supported(id),"missing independent icon: "+id);
        for(String id:new String[]{"wifi.signal","wifi.activity_inout","secondary_wifi.signal","secondary_wifi.activity_inout","mobile1.signal","mobile2.type","mobile1.activity_inout","mobile2.roaming","mobile1.volte","user_avatar","user_switcher","privacy.microphone","privacy.location","privacy.projection"}){
            check(StatusBarIconSpacingSpec.supported(id),"verified independent child missing: "+id);
            check(StatusBarIconSpacingSpec.parse(StatusBarIconSpacingSpec.empty().with("control",id,space).serialize())!=null,"independent child wire round trip: "+id);
        }
        check(StatusBarIconSpacingSpec.supported("privacy.dot")&&!StatusBarIconSpacingSpec.independentChild("privacy.dot"),"dot requires its dedicated bounded adapter, never ordinary child margins");
        for(String id:new String[]{"battery.fill","wifi.activity_in","mobile1.activity_out","mobile1.no_network","mobile_data.type","dual_signal","unknown:mobile","privacy.chip","bluetooth.battery","battery.charging"})check(!StatusBarIconSpacingSpec.supported(id),"painted/unsupported object offered false boundary control: "+id);

        List<String> eligible=Arrays.asList("wifi","bluetooth","vpn","mobile1","alarm_clock","battery","unknown_oem");
        Set<String> kept=StatusBarIconOrderPolicy.retain(eligible,x->x,"",1);
        check(kept.containsAll(Arrays.asList("wifi","mobile1","battery","unknown_oem","vpn"))&&!kept.contains("bluetooth")&&!kept.contains("alarm_clock"),"cap must keep core connectivity and highest eligible hint");
        check(!kept.contains("privacy.camera")&&!kept.contains("screen_record"),"priority must never invent a blocked/inactive icon");
        check(StatusBarIconOrderPolicy.retain(eligible,x->x,"",0).containsAll(eligible),"zero additional limit must preserve all eligible icons");
        check(StatusBarIconOrderPolicy.retain(eligible,x->x,"bluetooth",1).contains("bluetooth"),"custom priority ignored");
        check(StatusBarIconOrderPolicy.normalize(" bluetooth, vpn ").equals("bluetooth,vpn"),"order canonicalization");
        for(String malformed:new String[]{"wifi","bluetooth,bluetooth","vpn,","notifications","battery","unknown"})check(StatusBarIconOrderPolicy.normalize(malformed)==null,"invalid/non-hint priority accepted");
        check(new HashSet<>(StatusBarIconOrderPolicy.order("bluetooth")).size()==StatusBarIconOrderPolicy.IDS.size(),"partial order must append each remaining hint once");
        List<String> priority=StatusBarIconOrderPolicy.prioritize(Arrays.asList("bluetooth","vpn","bluetooth","wifi"),x->x,"");
        check(priority.equals(Arrays.asList("vpn","bluetooth","bluetooth")),"stable OEM tie order and hints-only ranking");
        Set<String> fitted=StatusBarIconOrderPolicy.fitHints(eligible,x->x,x->x.equals("vpn")?30:10,"",3,25);
        check(fitted.equals(new LinkedHashSet<>(Arrays.asList("alarm_clock","bluetooth"))),"oversized high-priority hint should not overlap; smaller eligible hints may use remaining room");
        check(StatusBarIconOrderPolicy.fitHints(eligible,x->x,x->10,"",0,100).isEmpty(),"no OEM capacity must not display hints");
        check(StatusBarIconOrderPolicy.fitHints(eligible,x->x,x->10,"",5,0).isEmpty(),"no physical room must not display hints");
        check(StatusBarIconOrderPolicy.fitHints(eligible,x->x,x->10,"",2,20).contains("vpn"),"important hint should survive exact-width boundary");
        check(StatusBarIconOrderPolicy.fitHints(eligible,x->x,x->Double.NaN,"",3,Double.POSITIVE_INFINITY).isEmpty(),"invalid measurements cannot corrupt layout");
        Map<String,EnhancementOption> options=new HashMap<>();for(EnhancementOption option:StatusBarIconLayoutOptions.options()){check(option.normalize(option.defaultValue)!=null,"invalid config default");options.put(option.key,option);}
        check(options.size()==4&&options.get(StatusBarIconSpacingSpec.KEY).normalize(canonical).equals(canonical),"four canonical options missing");
        check(options.get(StatusBarIconOrderPolicy.LIMIT).normalize("21")==null&&options.get(StatusBarIconOrderPolicy.LIMIT).normalize("-1")==null,"limit import bounds");
        check(options.get(StatusBarIconSpacingSpec.KEY).normalize("IS1;all,wifi,-2,0,0,0")==null,"negative import must not overlap icons");
        System.out.println("PASS: per-icon boundary inheritance/reset/RTL, malformed imports, eligible-only priority and physical-capacity limits");
    }
}
