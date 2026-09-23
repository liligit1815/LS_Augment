package ls.augment.com;

import java.util.*;

/** Reproduces the unequal preceding content observed on the real status bar. */
public final class TestPairedStatusBarRows {
    public static void main(String[] args) {
        int cases=0;
        for(String pair:new String[]{"network","notifications","system_icons"})
        for(String column:new String[]{"L","C","R"})
        for(int width:new int[]{240,608,1216})
        for(boolean upperLonger:new boolean[]{true,false}) {
            List<StatusBarGridLayout.Node> nodes=Arrays.asList(
                new StatusBarGridLayout.Node("beforeTop",column+"1",0,upperLonger?150:30,46),
                new StatusBarGridLayout.Node("beforeBottom",column+"2",0,upperLonger?30:150,46),
                new StatusBarGridLayout.Node(pair+"#0",column+"1",100,120,56),
                new StatusBarGridLayout.Node(pair+"#1",column+"2",100,220,56),
                new StatusBarGridLayout.Node("after",column+"S",200,40,80));
            Map<String,StatusBarGridLayout.Box> placed=StatusBarGridLayout.pack(nodes,width,260,13,13,0,0,4,0,0);
            StatusBarGridLayout.Box up=placed.get(pair+"#0"),down=placed.get(pair+"#1");
            require(Math.abs(up.x-down.x)<.001f,pair+" rows must start at the same x: "+up.x+" / "+down.x);
            List<StatusBarGridLayout.Box> boxes=new ArrayList<>(placed.values());
            for(StatusBarGridLayout.Box box:boxes)require(box.x>=0&&box.x+box.width<=width+.001f,"within screen");
            for(int a=0;a<boxes.size();a++)for(int b=a+1;b<boxes.size();b++){
                StatusBarGridLayout.Box first=boxes.get(a),second=boxes.get(b);
                require(Math.min(first.x+first.width,second.x+second.width)-Math.max(first.x,second.x)<.001f
                    ||Math.min(first.y+first.height,second.y+second.height)-Math.max(first.y,second.y)<.001f,"no overlap");
            }
            cases++;
        }
        for(int height:new int[]{8,32,64})for(int gap:new int[]{-1,-4,-8}){
            List<StatusBarGridLayout.Node> nodes=Arrays.asList(
                new StatusBarGridLayout.Node("up","L1",0,12,10),
                new StatusBarGridLayout.Node("down","L2",0,12,10));
            Map<String,StatusBarGridLayout.Box> zero=StatusBarGridLayout.pack(nodes,180,height,0,0,0,0,0,0,0);
            Map<String,StatusBarGridLayout.Box> negative=StatusBarGridLayout.pack(nodes,180,height,0,0,0,0,gap,0,0);
            StatusBarGridLayout.Box up=negative.get("up"),down=negative.get("down");
            require(Math.abs(up.y-zero.get("up").y)<.001f&&Math.abs(down.y-zero.get("down").y)<.001f,"unsafe negative gap uses safe row edges");
            require(Math.abs(up.height-zero.get("up").height)<.001f&&Math.abs(down.width-zero.get("down").width)<.001f,"negative gap preserves glyph size");
            require(down.y>=up.y+up.height-.001f,"negative preference must not overlap measured content");
            require(up.y>=0&&down.y+down.height<=height,"negative gap remains inside the bar");
            cases++;
        }
        System.out.println("Paired status-bar rows: "+cases+" cases passed");
    }
    private static void require(boolean condition,String message){if(!condition)throw new AssertionError(message);}
}
