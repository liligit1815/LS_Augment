package ls.augment.com;
import java.util.*;
public final class TestStatusBarCustomization {
    public static void main(String[] args){
        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.empty().with("main","wifi.activity_in",true).with("lock","mobile1",true);
        check(visibility.hidden("main","wifi.activity_in"),"main hidden");
        check(!visibility.hidden("control","wifi.activity_in"),"surface isolation");
        check(visibility.hidden("lock","mobile1.signal"),"parent rule");
        check(!visibility.explicitlyHidden("lock","mobile1.signal"),"inherited distinguishable");
        check(!visibility.with("lock","mobile1",false).hidden("lock","mobile1.signal"),"restore inheritance");
        visibility=visibility.with("all","bluetooth",true);
        check(visibility.hidden("notification","bluetooth"),"all inherited");
        check(visibility.serialize().equals(StatusBarVisibilitySpec.parse(visibility.serialize()).serialize()),"roundtrip");
        check(StatusBarVisibilitySpec.parse("SV1;control,bluetooth,show")==null,"reject force visibility");
        check(StatusBarVisibilitySpec.parse("SV1;bogus,bluetooth,hide")==null,"reject unknown surface");
        check(StatusBarVisibilitySpec.parse("SV1;main,bluetooth,hide;main,bluetooth,hide")==null,"reject duplicate");
        List<StatusBarGridLayout.Node> asymmetric=Arrays.asList(n("clock","LS",0,170,16),n("battery","RS",1,28,16));
        StatusBarAdaptiveLayout.Result r=pack(asymmetric,240,32,0,0);
        check(r.valid&&r.boxes.get("clock").scale==1,"unequal sides retain readable size");
        check(Math.abs(r.boxes.get("battery").x-208)<.02,"right anchored");
        check(!pack(asymmetric,180,32,0,0).valid,"reject horizontal crowding without shrink");
        check(!pack(Collections.singletonList(n("clock","CS",0,60,16)),240,32,108,132).valid,"cutout conflict explicit");
        check(pack(Arrays.asList(n("clock","LS",0,90,16),n("battery","RS",1,90,16)),240,32,108,132).valid,"safe side intervals");
        List<StatusBarGridLayout.Node> rows=Arrays.asList(n("network#0","R1",0,30,12),n("network#1","R2",0,52,12),n("battery","RS",1,20,22));
        r=pack(rows,240,32,0,0);check(r.valid,"paired rows fit");
        check(Math.abs(r.boxes.get("network#0").x-r.boxes.get("network#1").x)<.03,"paired rows stay aligned");
        List<StatusBarGridLayout.Node> spaced=Arrays.asList(n("up","L1",0,20,10),n("down","L2",0,20,10));
        r=StatusBarAdaptiveLayout.pack(spaced,240,60,4,4,0,0,28,0,0);
        check(r.valid,"large row gap fits with sufficient height");
        check(Math.abs(r.boxes.get("down").y-r.boxes.get("up").y-r.boxes.get("up").height-28)<.03,"row gap above one-quarter height is honored");
        check(!StatusBarAdaptiveLayout.pack(spaced,240,30,4,4,0,0,28,0,0).valid,"unfittable row gap is reported, not silently clamped");
        Random random=new Random(20441);int accepted=0,rejected=0;
        for(int trial=0;trial<1000;trial++){
            List<StatusBarGridLayout.Node> nodes=new ArrayList<>();
            for(int i=0;i<8;i++)nodes.add(n("i"+i,""+"LCR".charAt(random.nextInt(3))+"12S".charAt(random.nextInt(3)),i,8+random.nextInt(85),8+random.nextInt(16)));
            r=pack(nodes,360,48,0,0);if(!r.valid){rejected++;check(r.boxes.isEmpty()&&!r.reason.isEmpty(),"invalid layout cannot partially apply");continue;}
            accepted++;for(StatusBarGridLayout.Box a:r.boxes.values())for(StatusBarGridLayout.Box b:r.boxes.values())if(a!=b)
                check(Math.min(a.x+a.width,b.x+b.width)-Math.max(a.x,b.x)<.04||Math.min(a.y+a.height,b.y+b.height)-Math.max(a.y,b.y)<.04,"no overlap");
        }
        check(accepted>0&&rejected>0,"exercise fit and overflow");
        System.out.println("Status bar customization: visibility and 1000 measured layout cases passed");
    }
    private static StatusBarGridLayout.Node n(String id,String zone,int order,float w,float h){return new StatusBarGridLayout.Node(id,zone,order,w,h);}
    private static StatusBarAdaptiveLayout.Result pack(List<StatusBarGridLayout.Node> n,float w,float h,float l,float r){return StatusBarAdaptiveLayout.pack(n,w,h,4,4,0,0,2,l,r);}
    private static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
