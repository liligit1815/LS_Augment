package ls.augment.com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import ls.augment.com.LauncherGridMigrationCheck.Row;

public final class TestLauncherGridMigrationCheck {
    private static int checks;
    private static Row row(long id,long screen,int x,int y,int sx,int sy) {
        return new Row(id,screen,x,y,sx,sy);
    }
    private static void expect(boolean value,String label) {
        checks++;if(!value)throw new AssertionError(label);
    }
    private static boolean complete(List<Row> db,List<Row> loaded) {
        return LauncherGridMigrationCheck.check(true,db,loaded,6,4).complete;
    }
    public static void main(String[] args) {
        Row a=row(44,0,0,0,1,1), dormant=row(54,0,0,0,1,1), widget=row(70,0,1,0,3,2);
        List<Row> db=Arrays.asList(a,dormant,widget);
        List<Row> loaded=Arrays.asList(a,widget);
        expect(complete(db,loaded),"preexisting dormant duplicate must not hold migration pending");
        expect(!complete(db,db),"duplicate when both native rows accepted must remain pending");
        expect(!complete(Arrays.asList(dormant,widget),loaded),"missing accepted id cannot masquerade as completion");
        expect(!complete(Arrays.asList(a,dormant,row(70,0,1,1,3,2)),loaded),"old database position before model writer flush");
        expect(!complete(Arrays.asList(a,dormant,row(70,0,1,0,2,2)),loaded),"widget span must be preserved");
        expect(!complete(Arrays.asList(a,dormant,row(70,1,1,0,3,2)),loaded),"overflow screen must be persisted");
        expect(!LauncherGridMigrationCheck.check(false,db,loaded,6,4).complete,"partial database read");
        expect(!complete(db,null),"no native repack snapshot");
        expect(complete(db,Collections.emptyList()),"successfully loaded empty workspace can contain dormant records");
        expect(!complete(null,loaded),"missing database snapshot");
        expect(!complete(Arrays.asList(a,a),Arrays.asList(a)),"database identity ambiguity");
        expect(!complete(db,Arrays.asList(a,a)),"native snapshot identity ambiguity");
        expect(!complete(Arrays.asList(a,null),Arrays.asList(a)),"null database row");
        expect(!complete(db,Arrays.asList((Row)null)),"null accepted row");
        expect(complete(Arrays.asList(a,row(90,0,-9,999,0,Integer.MAX_VALUE)),Arrays.asList(a)),
                "unknown dormant geometry has no effect on accepted occupancy");
        Row next=row(80,1,0,0,4,6);
        expect(complete(Arrays.asList(a,next),Arrays.asList(a,next)),"different pages are independent");
        Row edge=row(81,0,0,1,1,5);
        expect(complete(Arrays.asList(a,edge),Arrays.asList(a,edge)),"touching edges do not overlap");
        Row over=row(82,0,3,5,2,1);
        expect(!complete(Arrays.asList(over),Arrays.asList(over)),"out of bounds final geometry");
        Row huge=row(83,0,Integer.MAX_VALUE,0,Integer.MAX_VALUE,1);
        expect(!complete(Arrays.asList(huge),Arrays.asList(huge)),"addition must not wrap into grid");
        Row negative=row(84,0,-1,0,1,1);
        expect(!complete(Arrays.asList(negative),Arrays.asList(negative)),"negative final position");
        expect(!LauncherGridMigrationCheck.check(true,db,loaded,0,4).complete,"invalid target shape");
        // Every supported shape can spill many pages without inventing a per-page or item-count cap.
        for(int rows=3;rows<=12;rows++)for(int cols=3;cols<=12;cols++) {
            List<Row> pages=new ArrayList<>();
            for(int screen=0;screen<20;screen++)pages.add(row(screen+1,screen,0,0,cols,rows));
            List<Row> saved=new ArrayList<>(pages);
            saved.add(row(999,0,0,0,1,1));
            expect(LauncherGridMigrationCheck.check(true,saved,pages,rows,cols).complete,"multi-page "+rows+"x"+cols);
            expect(saved.size()==21&&pages.size()==20,"snapshots must not be mutated");
        }
        expect(db.get(0)==a&&loaded.get(1)==widget,"check must preserve caller lists and immutable rows");
        System.out.println("PASS LauncherGridMigrationCheck: "+checks+" checks");
    }
}
