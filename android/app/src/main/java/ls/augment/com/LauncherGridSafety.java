package ls.augment.com;

import java.util.List;

/** Preflight for the OEM repack path that preserves item spans and creates overflow pages.
 * This is not permission to delete rows, resize widgets or discard an incomplete database read.
 */
public final class LauncherGridSafety {
    public static final long WORKSPACE = -100;
    private LauncherGridSafety() { }
    public static final class Item {
        public final long id, container;
        public final int spanX, spanY;
        public Item(long id, long container, int spanX, int spanY) {
            this.id=id; this.container=container; this.spanX=spanX; this.spanY=spanY;
        }
    }
    public static final class Result {
        public final boolean safe;
        public final String reason;
        public final long blockingItemId;
        public final int workspaceItems;
        private Result(boolean safe,String reason,long id,int count) {
            this.safe=safe;this.reason=reason;this.blockingItemId=id;this.workspaceItems=count;
        }
    }
    /** target is the actual destination shape, including an OEM shape when disabling custom grids. */
    public static Result check(LauncherGridSpec target, boolean completeSnapshot, List<Item> items) {
        if(target==null)return new Result(false,"目标桌面行列无效，保持当前布局",-1,0);
        if(!completeSnapshot||items==null)return new Result(false,"尚未完整读取桌面数据，保持当前布局",-1,0);
        int count=0;
        for(Item item:items){
            if(item==null)return new Result(false,"桌面数据读取不完整，保持当前布局",-1,count);
            if(item.container!=WORKSPACE)continue;
            count++;
            if(item.spanX<1||item.spanY<1)return new Result(false,"桌面项目 "+item.id+" 的占用范围无效，保持当前布局",item.id,count);
            if(item.spanX>target.columns||item.spanY>target.rows)
                return new Result(false,"桌面项目 "+item.id+" 占用 "+item.spanX+" × "+item.spanY+" 格，无法放入 "+target.label()+"；请先手动调整该小组件",item.id,count);
        }
        return new Result(true,"",-1,count);
    }
    public static boolean canFit(LauncherGridSpec target, boolean completeSnapshot, List<Item> items) {
        return check(target,completeSnapshot,items).safe;
    }
}
