package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Capacity preflight agrees with OEM repacking, which can add pages but must keep widget spans. */
public final class TestLauncherGridSafety {
    private static int checks;
    public static void main(String[] args){
        LauncherGridSpec small=LauncherGridSpec.square(3);
        require(!LauncherGridSafety.canFit(small,false,List.of()),"unread database is not an empty workspace");
        require(!LauncherGridSafety.canFit(small,true,null),"null snapshot unsafe");
        require(!LauncherGridSafety.canFit(null,true,List.of()),"unknown destination unsafe");
        require(!LauncherGridSafety.canFit(small,true,Arrays.asList((LauncherGridSafety.Item)null)),"partial row cannot be ignored");
        require(LauncherGridSafety.canFit(small,true,List.of()),"verified empty workspace can resize");
        List<LauncherGridSafety.Item> many=new ArrayList<>();for(int i=0;i<1000;i++)many.add(new LauncherGridSafety.Item(i,-100,1,1));
        LauncherGridSafety.Result pages=LauncherGridSafety.check(small,true,many);
        require(pages.safe&&pages.workspaceItems==1000,"capacity is not limited to one original or one overflow page");
        require(many.size()==1000,"preflight does not remove icons");
        LauncherGridSafety.Item wide=new LauncherGridSafety.Item(500,-100,4,2);
        LauncherGridSafety.Result rejected=LauncherGridSafety.check(small,true,List.of(wide));
        require(!rejected.safe&&rejected.blockingItemId==500&&!rejected.reason.isEmpty(),"full widget width must fit without implicit resize");
        require(wide.spanX==4&&wide.spanY==2,"widget remains unchanged after refusal");
        require(LauncherGridSafety.canFit(new LauncherGridSpec(true,3,4),true,List.of(wide)),"rectangular destination honors columns then rows");
        require(!LauncherGridSafety.canFit(small,true,List.of(new LauncherGridSafety.Item(501,-100,2,4))),"tall widget must fit in destination rows");
        for(int span:new int[]{Integer.MIN_VALUE,-1,0,Integer.MAX_VALUE}){
            require(!LauncherGridSafety.canFit(small,true,List.of(new LauncherGridSafety.Item(1,-100,span,1))),"invalid or huge horizontal footprint refused");
            require(!LauncherGridSafety.canFit(small,true,List.of(new LauncherGridSafety.Item(1,-100,1,span))),"invalid or huge vertical footprint refused");
        }
        require(LauncherGridSafety.canFit(small,true,List.of(new LauncherGridSafety.Item(2,-101,100,100),new LauncherGridSafety.Item(3,20,100,100))),"hotseat and folder children are not workspace grid footprints");
        require(!LauncherGridSafety.canFit(small.withEnabled(false),true,List.of(wide)),"disable cannot bypass destination footprint safety");
        for(int rows=3;rows<=12;rows++)for(int columns=3;columns<=12;columns++){
            LauncherGridSpec target=new LauncherGridSpec(true,rows,columns);
            LauncherGridSafety.Item exact=new LauncherGridSafety.Item(5,-100,columns,rows);
            require(LauncherGridSafety.canFit(target,true,List.of(exact)),"full-page widget preserved exactly");
            require(!LauncherGridSafety.canFit(target,true,List.of(new LauncherGridSafety.Item(5,-100,columns+1,rows))),"one column beyond page refused");
            require(!LauncherGridSafety.canFit(target,true,List.of(new LauncherGridSafety.Item(5,-100,columns,rows+1))),"one row beyond page refused");
        }
        System.out.println("PASS LauncherGridSafety: "+checks+" checks for complete reads, multi-page icons, full widget spans and safe destination capacity");
    }
    private static void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
}
