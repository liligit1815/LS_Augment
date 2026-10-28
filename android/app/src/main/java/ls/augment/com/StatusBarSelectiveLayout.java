package ls.augment.com;

import java.util.*;

/** Places only requested edits. Untouched native rectangles are immutable obstacles. */
public final class StatusBarSelectiveLayout {
    public static final class Item {
        public final String id,zone;public final StatusBarGridLayout.Box nativeBox;public final float width,height;
        public final boolean changed,relocate;public final int order;
        public Item(String id,String zone,StatusBarGridLayout.Box nativeBox,float width,float height,boolean changed,boolean relocate,int order){this.id=id;this.zone=zone;this.nativeBox=nativeBox;this.width=width;this.height=height;this.changed=changed;this.relocate=relocate;this.order=order;}
    }
    public static final class Result {
        public final boolean valid;public final String reason;public final Map<String,StatusBarGridLayout.Box> boxes;
        Result(boolean valid,String reason,Map<String,StatusBarGridLayout.Box> boxes){this.valid=valid;this.reason=reason;this.boxes=Collections.unmodifiableMap(boxes);}
    }
    /** Reorder within one native row, retaining its measured spacing and edge anchor. */
    public static Map<String,StatusBarGridLayout.Box> reorder(List<Item> items,boolean right){
        Map<String,StatusBarGridLayout.Box> result=new LinkedHashMap<>();if(items.isEmpty())return result;
        List<Item> nativeOrder=new ArrayList<>(items);nativeOrder.sort(Comparator.comparingDouble(i->i.nativeBox.x));
        float start=nativeOrder.get(0).nativeBox.x,end=0;List<Float> gaps=new ArrayList<>();
        for(int i=0;i<nativeOrder.size();i++){StatusBarGridLayout.Box b=nativeOrder.get(i).nativeBox;end=Math.max(end,b.x+b.width);
            if(i>0){StatusBarGridLayout.Box before=nativeOrder.get(i-1).nativeBox;gaps.add(Math.max(0,b.x-before.x-before.width));}}
        Collections.sort(gaps);float gap=gaps.isEmpty()?0:gaps.get(gaps.size()/2),total=gap*Math.max(0,items.size()-1);
        for(Item item:items)total+=item.width;float x=right?end-total:start;
        // Stable sorting keeps OEM order for equal user numbers.
        nativeOrder.sort(Comparator.comparingInt(i->i.order));
        for(Item item:nativeOrder){result.put(item.id,new StatusBarGridLayout.Box(x,item.nativeBox.y+(item.nativeBox.height-item.height)/2,item.width,item.height,1));x+=item.width+gap;}
        return result;
    }
    public static Result place(List<Item> items,float width,float height,float left,float top,float right,float bottom,float cutLeft,float cutRight){
        return place(items,width,height,left,top,right,bottom,cutLeft,cutRight,0);
    }
    public static Result place(List<Item> items,float width,float height,float left,float top,float right,float bottom,float cutLeft,float cutRight,float rowGap){
        Map<String,StatusBarGridLayout.Box> result=new LinkedHashMap<>();List<StatusBarGridLayout.Box> occupied=new ArrayList<>();Map<StatusBarGridLayout.Box,String> zones=new IdentityHashMap<>();
        for(Item item:items)if(!item.changed&&item.nativeBox!=null){occupied.add(item.nativeBox);zones.put(item.nativeBox,item.zone);}
        List<Item> ordered=new ArrayList<>(items);ordered.sort(Comparator.comparingInt(i->i.order));
        for(Item item:ordered){if(!item.changed)continue;StatusBarGridLayout.Box old=item.nativeBox;float x,y;
            char side=item.zone.charAt(0),row=item.zone.charAt(1);float usableH=height-top-bottom;
            y=top+(row=='1'?usableH/4:row=='2'?usableH*3/4:usableH/2)-item.height/2;
            if(rowGap!=0&&row!='S')y=top+usableH/2+(row=='1'?-item.height-rowGap/2:rowGap/2);
            if(!item.relocate&&old!=null){x=old.x+(old.width-item.width)/2;y=old.y+(old.height-item.height)/2;}
            else x=side=='L'?left:side=='R'?width-right-item.width:(width+left-right-item.width)/2;
            StatusBarGridLayout.Box candidate=new StatusBarGridLayout.Box(x,y,item.width,item.height,1);
            if(item.relocate){
                // Search native gaps without moving or shrinking an untouched neighbour.
                List<Float> starts=new ArrayList<>();starts.add(x);
                for(StatusBarGridLayout.Box box:occupied){starts.add(box.x+box.width+1);starts.add(box.x-item.width-1);}
                starts.sort(Comparator.comparingDouble(value->Math.abs(value-x)));
                candidate=null;for(float start:starts){StatusBarGridLayout.Box trial=new StatusBarGridLayout.Box(start,y,item.width,item.height,1);
                    boolean region=side=='L'?start+item.width<=width/2:side=='R'?start>=width/2:true;
                    if(region&&fits(trial,occupied,width,height,cutLeft,cutRight,zones,item.zone,rowGap)){candidate=trial;break;}}
            }
            if(candidate==null||!fits(candidate,occupied,width,height,cutLeft,cutRight,zones,item.zone,rowGap))return new Result(false,"当前修改与原厂图标或屏幕边界冲突，请调整大小或位置",Collections.emptyMap());
            result.put(item.id,candidate);occupied.add(candidate);zones.put(candidate,item.zone);
        }
        return new Result(true,"",result);
    }
    private static boolean fits(StatusBarGridLayout.Box box,List<StatusBarGridLayout.Box> occupied,float width,float height,float cutLeft,float cutRight,Map<StatusBarGridLayout.Box,String> zones,String zone,float rowGap){
        if(!Float.isFinite(box.x)||!Float.isFinite(box.y)||!Float.isFinite(box.width)||!Float.isFinite(box.height)||box.width<=0||box.height<=0||box.x<0||box.y<0||box.x+box.width>width+.1f||box.y+box.height>height+.1f)return false;
        if(cutRight>cutLeft&&box.x<cutRight&&box.x+box.width>cutLeft)return false;
        for(StatusBarGridLayout.Box other:occupied)if(!StatusBarAdaptiveLayout.requestedRowOverlap(rowGap,zone,zones.get(other))&&Math.min(box.x+box.width,other.x+other.width)-Math.max(box.x,other.x)>.1f&&Math.min(box.y+box.height,other.y+other.height)-Math.max(box.y,other.y)>.1f)return false;
        return true;
    }
    private StatusBarSelectiveLayout(){}
}
