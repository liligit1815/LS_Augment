package ls.augment.com;

import java.util.Random;

/** Independent invariants, including fractional-density combinations and cutout geometry. */
public final class TestPrivacyDotSpacing {
    static int checks;
    static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static PrivacyDotSpacingPolicy.Box box(int l,int t,int r,int b){return new PrivacyDotSpacingPolicy.Box(l,t,r,b);}
    static void exercise(PrivacyDotSpacingPolicy p,PrivacyDotSpacingPolicy.SafeArea area){
        PrivacyDotSpacingPolicy.Limits limits=p.limits();check(limits.available,"native glyph must fit fixture");
        Random random=new Random(718);for(int i=0;i<400;i++){
            StatusBarIconSpacingSpec.Insets edge=new StatusBarIconSpacingSpec.Insets(random.nextInt(25),random.nextInt(25),random.nextInt(25),random.nextInt(25));
            for(boolean rtl:new boolean[]{false,true})if(limits.accepts(edge)){
                PrivacyDotSpacingPolicy.Box actual=p.glyph(edge,rtl);
                check(p.content.contains(actual)&&area.contains(actual),"advertised coupled limits must fit every accepted allocation");
                check(p.fits(edge,rtl,limits),"accepted rule must apply without hidden clamping");
                check(actual.right-actual.left==p.width&&actual.bottom-actual.top==p.height,"glyph size invariant");
            }
        }
        check(limits.maximum(0,limits.horizontal)==0&&limits.maximum(1,limits.vertical)==0,"opposite edge consumes the shared total");
    }
    public static void main(String[] args){
        for(float density:new float[]{1f,1.375f,2.625f,3.25f})for(int rotation=0;rotation<4;rotation++)for(int h=-1;h<=1;h++)for(int v=-1;v<=1;v++){
            int w=Math.round(20*density),height=Math.round(30*density),dot=Math.round(4*density);
            PrivacyDotSpacingPolicy.Box content=box(rotation*100,200,rotation*100+w,200+height);
            PrivacyDotSpacingPolicy.SafeArea safe=new PrivacyDotSpacingPolicy.SafeArea(content,new PrivacyDotSpacingPolicy.Box[0],new PrivacyDotSpacingPolicy.RoundCorner[0]);
            exercise(new PrivacyDotSpacingPolicy(content,dot,dot,0,0,0,0,h,v,density,safe),safe);
        }
        PrivacyDotSpacingPolicy.Box content=box(70,0,100,30);
        PrivacyDotSpacingPolicy.SafeArea rounded=new PrivacyDotSpacingPolicy.SafeArea(content,new PrivacyDotSpacingPolicy.Box[]{box(70,0,76,4)},new PrivacyDotSpacingPolicy.RoundCorner[]{new PrivacyDotSpacingPolicy.RoundCorner(75,25,25,1)});
        PrivacyDotSpacingPolicy roundedPolicy=new PrivacyDotSpacingPolicy(content,4,4,0,0,0,0,-1,0,1,rounded);exercise(roundedPolicy,rounded);
        check(!rounded.contains(box(95,0,99,4)),"rounded screen edge cannot be treated as a rectangle");
        check(!rounded.contains(box(70,0,74,4)),"cutout overlap forbidden even inside corner window");
        PrivacyDotSpacingPolicy.SafeArea hole=new PrivacyDotSpacingPolicy.SafeArea(content,new PrivacyDotSpacingPolicy.Box[]{box(70,12,76,18)},new PrivacyDotSpacingPolicy.RoundCorner[0]);
        check(!new PrivacyDotSpacingPolicy(content,4,4,0,0,0,0,-1,0,1,hole).limits().available,"unverified native position refuses controls");
        check(!new PrivacyDotSpacingPolicy(content,0,4,0,0,0,0,-1,0,1,rounded).limits().available,"unmeasured glyph refuses controls");
        PrivacyDotSpacingObservation o=new PrivacyDotSpacingObservation(100_000,40_000,20452,0,1,3250,1300,1,7,8,"outside_capacity");
        o=PrivacyDotSpacingObservation.parse(o.serialize());check(o!=null&&o.current(40_100,100_100,20452,0,1,3250,1300,1),"measured evidence roundtrip");
        check(!o.current(40_100,100_100,20451,0,1,3250,1300,1),"old APK evidence cannot open controls");
        check(!o.current(40_100,100_100,20452,0,0,3250,1300,1),"rotation requires own evidence");
        check(!o.current(40_100,100_100,20452,0,1,3000,1300,1),"density invalidates evidence");
        check(!o.current(40_100,100_100,20452,0,1,3250,1000,1),"font scale invalidates evidence");
        check(!o.current(40_100,100_100,20452,0,1,3250,1300,0),"RTL change invalidates evidence");
        check(!o.current(40_100,500_000,20452,0,1,3250,1300,1),"another boot invalidates evidence");
        check(!o.current(2_000_000,100_100,20452,0,1,3250,1300,1),"aged evidence cannot open controls");
        check(o.accepts(new StatusBarIconSpacingSpec.Insets(3,4,4,4))&&!o.accepts(new StatusBarIconSpacingSpec.Insets(4,4,4,4)),"oversized rule rejected whole, not silently shortened");
        check(o.maximum(0,5)==2&&o.maximum(3,7)==1,"coupled slider maxima");
        check(PrivacyDotSpacingObservation.parse("PDS1|0|0|1|0|0|1000|1000|0|49|1|native")==null,"bounded imported diagnostics");
        System.out.println("Privacy dot geometry/evidence: "+checks+" assertions passed (local policy only)");
    }
}
