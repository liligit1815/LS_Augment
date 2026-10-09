package ls.augment.com;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Confirms persistence of the rows the native loader actually accepted.
 * Dormant favorites can legally retain overlapping coordinates; they are not occupancy evidence.
 */
public final class LauncherGridMigrationCheck {
    private LauncherGridMigrationCheck() { }

    /** A workspace row only; callers exclude hotseat and folder children before creating this list. */
    public static final class Row {
        public final long id, screen;
        public final int x, y, spanX, spanY;
        public Row(long id,long screen,int x,int y,int spanX,int spanY) {
            this.id=id;this.screen=screen;this.x=x;this.y=y;this.spanX=spanX;this.spanY=spanY;
        }
    }

    public static final class Result {
        public final boolean complete;
        public final String reason;
        private Result(boolean complete,String reason) { this.complete=complete;this.reason=reason; }
    }

    /** loadedFinalRows must be a frozen snapshot after a successful native repack, never a view list.
     * Null means no completed load was captured; an empty non-null snapshot means an empty workspace.
     * Unknown database rows are preserved, but do not affect the placement of the accepted rows.
     */
    public static Result check(boolean completeDB,List<Row> allWorkspaceDBRows,
            List<Row> loadedFinalRows,int rows,int cols) {
        if(!completeDB||allWorkspaceDBRows==null)return fail("桌面数据库尚未完整读取");
        if(loadedFinalRows==null)return fail("原生桌面重排尚未完成");
        if(rows<1||cols<1)return fail("目标桌面行列无效");
        Map<Long,Row> persisted=new HashMap<>();
        for(Row row:allWorkspaceDBRows) {
            if(row==null)return fail("桌面数据库快照不完整");
            if(persisted.put(row.id,row)!=null)return fail("桌面数据库项目编号重复");
        }
        Set<Long> acceptedIds=new HashSet<>();
        Map<Long,List<Row>> pages=new HashMap<>();
        for(Row expected:loadedFinalRows) {
            if(expected==null)return fail("原生桌面项目快照不完整");
            if(!acceptedIds.add(expected.id))return fail("原生桌面项目编号重复");
            if(expected.x<0||expected.y<0||expected.spanX<1||expected.spanY<1
                    ||(long)expected.x+expected.spanX>cols||(long)expected.y+expected.spanY>rows)
                return fail("原生桌面项目 "+expected.id+" 尚未放入目标网格");
            Row actual=persisted.get(expected.id);
            if(actual==null)return fail("桌面项目 "+expected.id+" 尚未保存");
            if(actual.screen!=expected.screen||actual.x!=expected.x||actual.y!=expected.y
                    ||actual.spanX!=expected.spanX||actual.spanY!=expected.spanY)
                return fail("桌面项目 "+expected.id+" 的最终位置尚未保存");
            List<Row> page=pages.computeIfAbsent(expected.screen,unused->new ArrayList<>());
            for(Row other:page) {
                if(expected.x<(long)other.x+other.spanX && other.x<(long)expected.x+expected.spanX
                        && expected.y<(long)other.y+other.spanY && other.y<(long)expected.y+expected.spanY)
                    return fail("原生桌面项目 "+expected.id+" 的位置仍有重叠");
            }
            page.add(expected);
        }
        return new Result(true,"");
    }

    private static Result fail(String reason) { return new Result(false,reason); }
}
