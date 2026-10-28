package ls.augment.com;

import java.util.*;

/** Measured component layout. Horizontal crowding never silently shrinks every icon. */
public final class StatusBarAdaptiveLayout {
    private StatusBarAdaptiveLayout() { }
    public static final class Result {
        public final boolean valid;
        public final String reason;
        public final Map<String,StatusBarGridLayout.Box> boxes;
        private Result(boolean valid,String reason,Map<String,StatusBarGridLayout.Box> boxes) {
            this.valid=valid;this.reason=reason;this.boxes=Collections.unmodifiableMap(boxes);
        }
    }
    private static Result fail(String reason) {return new Result(false,reason,Collections.emptyMap());}
    public static Result pack(List<StatusBarGridLayout.Node> nodes,float width,float height,
            float left,float right,float top,float bottom,float gap,float cutoutLeft,float cutoutRight) {
        if(nodes==null||!finite(width,height,left,right,top,bottom,gap,cutoutLeft,cutoutRight)
                ||width<=left+right||height<=top+bottom)return fail("状态栏没有足够的可用空间");
        Set<String> ids=new HashSet<>();
        for(StatusBarGridLayout.Node n:nodes) {
            if(n==null||n.id==null||!ids.add(n.id)||n.zone==null||!n.zone.matches("[LCR][12S]")
                    ||!finite(n.width,n.height,n.baseline)||n.width<=0||n.height<=0)
                return fail("组件尺寸或位置无效");
        }
        if(nodes.isEmpty())return new Result(true,"",new LinkedHashMap<>());
        // Use the shared baseline/span/paired-row calculation at unconstrained width.
        // Horizontal positions are then anchored using actual demand rather than thirds.
        Map<String,StatusBarGridLayout.Box> natural=StatusBarGridLayout.packMeasured(nodes,65536,height,0,0,top,bottom,gap,0,0);
        float[] min={Float.MAX_VALUE,Float.MAX_VALUE,Float.MAX_VALUE},max={0,0,0},needed={0,0,0};
        for(StatusBarGridLayout.Node n:nodes) {
            StatusBarGridLayout.Box b=natural.get(n.id);
            if(b==null||b.scale<.8f)return fail("状态栏高度不足，请增加高度、减小组件或改为单排");
            int col="LCR".indexOf(n.zone.charAt(0));
            min[col]=Math.min(min[col],b.x);max[col]=Math.max(max[col],b.x+b.width);
        }
        for(int i=0;i<3;i++)if(min[i]!=Float.MAX_VALUE)needed[i]=max[i]-min[i];
        float start=left,end=width-right,spacing=Math.max(2,Math.min(8,(height-top-bottom)/18));
        boolean hole=cutoutRight>cutoutLeft&&cutoutRight>start&&cutoutLeft<end;
        float[] origin={start,start+(end-start-needed[1])/2,end-needed[2]};
        if(needed[1]>0&&hole&&origin[1]<cutoutRight&&origin[1]+needed[1]>cutoutLeft)
            return fail("中间组件经过屏幕开孔，请移到左侧或右侧");
        float leftEnd=needed[1]>0?origin[1]-spacing:end;
        float rightStart=needed[1]>0?origin[1]+needed[1]+spacing:start;
        if(hole){leftEnd=Math.min(leftEnd,Math.max(start,cutoutLeft));rightStart=Math.max(rightStart,Math.min(end,cutoutRight));}
        if(needed[0]>leftEnd-start+.01f)return fail("左侧内容放不下，请移动组件、减少通知或使用双排");
        if(needed[2]>end-rightStart+.01f)return fail("右侧内容放不下，请移动组件、减少图标或使用双排");
        if(needed[1]>end-start+.01f)return fail("中间内容放不下，请缩短文字或移到两侧");
        if(needed[1]==0&&!hole&&needed[0]>0&&needed[2]>0&&needed[0]+needed[2]+spacing>end-start+.01f)
            return fail("两侧内容相遇，请减少内容、移动到另一排或减小间距");
        Map<String,StatusBarGridLayout.Box> result=new LinkedHashMap<>();Map<String,String> zones=new HashMap<>();for(StatusBarGridLayout.Node n:nodes)zones.put(n.id,n.zone);
        for(StatusBarGridLayout.Node n:nodes){
            int col="LCR".indexOf(n.zone.charAt(0));StatusBarGridLayout.Box b=natural.get(n.id);
            StatusBarGridLayout.Box placed=new StatusBarGridLayout.Box(origin[col]+b.x-min[col],b.y,b.width,b.height,b.scale);
            if(placed.x<-.02f||placed.y<-.02f||placed.x+placed.width>width+.02f||placed.y+placed.height>height+.02f)
                return fail("负边距超出状态栏可见范围，请减小调整幅度");
            if(placed.x<start-.02f||placed.x+placed.width>end+.02f||placed.y<top-.02f||placed.y+placed.height>height-bottom+.02f)
                return fail("组件超出状态栏边界，请调整大小或间距");
            for(Map.Entry<String,StatusBarGridLayout.Box> entry:result.entrySet()){
                // Negative row spacing explicitly requests an overlap between
                // upper and lower rows. Same-row and spanning items still collide.
                if(requestedRowOverlap(gap,n.zone,zones.get(entry.getKey())))continue;
                StatusBarGridLayout.Box other=entry.getValue();
                if(Math.min(other.x+other.width,placed.x+placed.width)-Math.max(other.x,placed.x)>.03f
                        &&Math.min(other.y+other.height,placed.y+placed.height)-Math.max(other.y,placed.y)>.03f)
                    return fail("组件发生重叠，请调整排列或间距");
            }
            result.put(n.id,placed);
        }
        return new Result(true,"",result);
    }
    private static boolean finite(float... values){for(float value:values)if(!Float.isFinite(value))return false;return true;}
    public static boolean requestedRowOverlap(float gap,String one,String other){return gap<0&&one!=null&&other!=null&&one.length()==2&&other.length()==2
            &&(one.charAt(1)=='1'&&other.charAt(1)=='2'||one.charAt(1)=='2'&&other.charAt(1)=='1');}
}
