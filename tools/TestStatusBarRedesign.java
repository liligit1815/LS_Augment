package ls.augment.com;

import java.util.*;

/** Behaviour tests: dense real-world layouts, cutouts and non-destructive presets. */
public final class TestStatusBarRedesign {
    public static void main(String[] args){
        for(int preset=0;preset<StatusBarPresets.NAMES.length;preset++){
            Map<String,String> values=StatusBarPresets.values(preset);
            for(Map.Entry<String,String> e:values.entrySet()){
                require(e.getKey().equals(ConfigSchema.SYSTEMUI_MASTER)||e.getKey().startsWith("ls_augment_statusbar_"),"preset changed unrelated setting");
                require(ConfigSchema.normalize(e.getKey(),e.getValue())!=null,"invalid preset: "+e.getKey());
            }
            require(StatusBarGridSpec.parse(values.get(ConfigSchema.STATUSBAR_GRID))!=null,"preset grid round trip");
        }
        StatusBarGridSpec input=StatusBarGridSpec.defaults().with("current",new StatusBarGridSpec.Item("C1",87,21,true));
        StatusBarGridSpec arranged=StatusBarPresets.arrange(input);
        for(String id:StatusBarGridSpec.IDS){require(input.get(id).size==arranged.get(id).size,"organize preserves sizes");require(input.get(id).visible==arranged.get(id).visible,"organize preserves chosen contents");}
        Random random=new Random(20313);
        for(int trial=0;trial<3000;trial++){
            int width=new int[]{240,360,608,1216}[trial%4],height=24+random.nextInt(100);
            float cutL=trial%3==0?width*.46f:0,cutR=trial%3==0?width*.54f:0;
            List<StatusBarGridLayout.Node> nodes=new ArrayList<>();
            for(int i=0;i<10;i++){
                String zone=""+"LCR".charAt(random.nextInt(3))+"12S".charAt(random.nextInt(3));
                float h=8+random.nextInt(60);
                nodes.add(new StatusBarGridLayout.Node("item"+i,zone,i,10+random.nextInt(250),h,trial%2==0?h*(.6f+random.nextFloat()*.35f):-1));
            }
            Map<String,StatusBarGridLayout.Box> boxes=StatusBarGridLayout.pack(nodes,width,height,4,4,0,0,-8+random.nextInt(17),cutL,cutR);
            require(boxes.size()==nodes.size(),"all requested contents have placement");
            for(StatusBarGridLayout.Box box:boxes.values()){
                require(Float.isFinite(box.x)&&box.x>=3.99f&&box.x+box.width<=width-3.99f,"horizontal bounds");
                require(box.y>=-.01f&&box.y+box.height<=height+.01f,"vertical bounds");
                if(cutR>cutL)require(box.x+box.width<=cutL+.01f||box.x>=cutR-.01f,"cutout avoidance");
                for(StatusBarGridLayout.Box other:boxes.values())if(other!=box){
                    float x=Math.min(box.x+box.width,other.x+other.width)-Math.max(box.x,other.x);
                    float y=Math.min(box.y+box.height,other.y+other.height)-Math.max(box.y,other.y);
                    require(x<.01f||y<.01f,"content overlap");
                }
            }
        }
        // Empty middle should improve readability without moving explicit center content.
        List<StatusBarGridLayout.Node> side=Arrays.asList(new StatusBarGridLayout.Node("a","L1",0,150,12),new StatusBarGridLayout.Node("b","R1",0,150,12));
        Map<String,StatusBarGridLayout.Box> expanded=StatusBarGridLayout.pack(side,360,32,0,0,0,0,2,0,0);
        require(expanded.get("a").scale==1&&expanded.get("b").scale==1,"empty center reclaimed");
        // Two clock rows use the same baseline as adjacent hardware text.
        List<StatusBarGridLayout.Node> aligned=Arrays.asList(
                new StatusBarGridLayout.Node("clock#0","L1",0,150,30,28),
                new StatusBarGridLayout.Node("clock#1","L2",0,150,30,28),
                new StatusBarGridLayout.Node("cpu","L2",1,80,24,23),new StatusBarGridLayout.Node("rightText","R2",0,70,25,21));
        Map<String,StatusBarGridLayout.Box> text=StatusBarGridLayout.pack(aligned,1216,107,13,13,0,0,-8,0,0);
        StatusBarGridLayout.Box date=text.get("clock#1"),cpu=text.get("cpu"),time=text.get("clock#0");
        require(Math.abs(date.y+28*date.scale-cpu.y-23*cpu.scale)<.001,"date and hardware share a baseline");
        StatusBarGridLayout.Box otherSide=text.get("rightText");
        require(Math.abs(date.y+28*date.scale-otherSide.y-21*otherSide.scale)<.001,"left and right text share a baseline");
        require(date.y-time.y-time.height<.001,"no extra internal clock line padding");
        // A long lower row must not push Bluetooth away from the paired network.
        List<StatusBarGridLayout.Node> right=Arrays.asList(
                new StatusBarGridLayout.Node("current","R2",0,130,24,23),new StatusBarGridLayout.Node("power","R2",0,90,24,23),
                new StatusBarGridLayout.Node("bluetooth","R1",2,30,39),new StatusBarGridLayout.Node("network#0","R1",2,40,24,23),
                new StatusBarGridLayout.Node("network#1","R2",2,60,24,23),new StatusBarGridLayout.Node("battery","RS",3,90,90));
        Map<String,StatusBarGridLayout.Box> compact=StatusBarGridLayout.pack(right,1216,107,13,13,0,0,0,0,0);
        StatusBarGridLayout.Box bt=compact.get("bluetooth"),up=compact.get("network#0"),down=compact.get("network#1");
        require(Math.abs(up.x-down.x)<.001,"network rows stay paired");
        require(up.x-(bt.x+bt.width)<8,"Bluetooth directly precedes upload rate");
        System.out.println("Status-bar redesign: 3000 packing scenarios, 3 validated presets, preservation and space reuse passed");
    }
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
