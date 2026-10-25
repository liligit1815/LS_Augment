package ls.augment.com;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/** Immutable all-pool geometry. Hidden producers retain their owner but expose no input geometry.
 * Android adapters must still validate the actual Surface/frame/lease and capability.
 */
public final class AtomicWorkbenchCapacityLayoutPlan {
    public enum Rail { LEFT, RIGHT }
    public static final class Rect {
        public final int left,top,right,bottom;
        public Rect(int left,int top,int right,int bottom){
            long w=(long)right-left,h=(long)bottom-top;
            if(w<1||h<1||w>Integer.MAX_VALUE||h>Integer.MAX_VALUE)throw new IllegalArgumentException("rectangle");
            this.left=left;this.top=top;this.right=right;this.bottom=bottom;
        }
        public static Rect size(int x,int y,int w,int h){if(w<1||h<1)throw new IllegalArgumentException("size");return new Rect(x,y,integer((long)x+w),integer((long)y+h));}
        public int width(){return right-left;} public int height(){return bottom-top;}
        public boolean overlaps(Rect r){return left<r.right&&r.left<right&&top<r.bottom&&r.top<bottom;}
        public boolean contains(Rect r){return left<=r.left&&top<=r.top&&right>=r.right&&bottom>=r.bottom;}
        @Override public boolean equals(Object v){return v instanceof Rect&&left==((Rect)v).left&&top==((Rect)v).top&&right==((Rect)v).right&&bottom==((Rect)v).bottom;}
        @Override public int hashCode(){return Objects.hash(left,top,right,bottom);}
        @Override public String toString(){return "["+left+","+top+","+right+","+bottom+"]";}
    }
    public static final class Frame {
        public final int windowId;
        public final AtomicWorkbenchPoolTopology.Role role;
        public final boolean visible,retainsOwnedResponsibility,inputGeometryEligible;
        public final Rect bounds;
        private Frame(int id,AtomicWorkbenchPoolTopology topology,boolean visible,Rect bounds){
            windowId=id;role=topology.roleOf(id);retainsOwnedResponsibility=topology.owned(id);this.visible=visible;this.bounds=bounds;inputGeometryEligible=visible&&id==topology.activeMainId;
        }
    }
    public final AtomicWorkbenchPoolTopology topology;
    public final Rail rail;
    public final Rect viewport;
    public final boolean fullscreen;
    public final int sideRows,sideColumns;
    private final Map<Integer,Frame> frames;
    private AtomicWorkbenchCapacityLayoutPlan(AtomicWorkbenchPoolTopology topology,Rail rail,Rect viewport,boolean fullscreen,
            int rows,int columns,Map<Integer,Frame> frames){
        this.topology=topology;this.rail=rail;this.viewport=viewport;this.fullscreen=fullscreen;sideRows=rows;sideColumns=columns;
        this.frames=Collections.unmodifiableMap(new LinkedHashMap<>(frames));verify();
    }
    public static boolean dualApplicable(int smallestWidthDp,int widthDp,int heightDp){
        return smallestWidthDp>=600&&widthDp>0&&heightDp>0
                && (long)Math.min(widthDp,heightDp)*100 >= (long)Math.max(widthDp,heightDp)*72;
    }
    public static AtomicWorkbenchCapacityLayoutPlan calculate(Rect viewport,int gap,AtomicWorkbenchPoolTopology topology,Rail rail,boolean fullscreen){
        return calculate(viewport,gap,topology,rail,fullscreen,topology==null?0:topology.sideIds().size());
    }
    /** gap is a measured UiKit pixel value. Van uses dp(2); the current Duo caller uses dp(4).
     * The caller supplies the final content viewport once, excluding its existing chrome/insets.
     */
    public static AtomicWorkbenchCapacityLayoutPlan calculate(Rect v,int gap,AtomicWorkbenchPoolTopology t,Rail rail,boolean fullscreen,int maxEmpty){
        if(v==null||t==null||rail==null||v.left<0||v.top<0||gap<0)throw new IllegalArgumentException("layout input");
        List<Integer> shown=fullscreen?Collections.emptyList():t.visibleSides(maxEmpty);
        // Validate maxEmpty even in fullscreen: hidden state must not launder invalid input.
        if(fullscreen)t.visibleSides(maxEmpty);
        int count=shown.size();
        int rows=count==0?0:t.dual()?Math.min(3,count):count;
        int columns=count==0?0:t.dual()?(count+rows-1)/rows:1;
        Map<Integer,Frame> frames=new LinkedHashMap<>();
        for(int id:t.poolIds())frames.put(id,new Frame(id,t,false,hiddenProducer()));
        if(fullscreen)frames.put(t.activeMainId,new Frame(t.activeMainId,t,true,v));
        else if(t.dual())layoutDual(v,gap,t,rail,shown,rows,columns,frames);
        else layoutSingle(v,gap,t,rail,shown,frames);
        return new AtomicWorkbenchCapacityLayoutPlan(t,rail,v,fullscreen,rows,columns,frames);
    }
    private static void layoutSingle(Rect v,int gap,AtomicWorkbenchPoolTopology t,Rail rail,List<Integer> shown,Map<Integer,Frame> frames){
        int count=shown.size(),width=v.width(),height=v.height();
        if(count==0){frames.put(t.activeMainId,new Frame(t.activeMainId,t,true,v));return;}
        int availableWidth=integer((long)width-gap);
        int availableHeight=integer((long)height-(count-1L)*gap);
        if(availableWidth<2||availableHeight<count)throw new IllegalArgumentException("single layout infeasible");
        int sideHeight=availableHeight/count;
        // Same positive-pixel rounding and final equal-height rows as Van calculateHorizontal.
        int sideWidth=Math.round(sideHeight*(float)availableWidth/(height+(float)sideHeight));
        sideWidth=Math.max(1,Math.min(availableWidth-1,sideWidth));
        int mainWidth=availableWidth-sideWidth;
        int mainLeft=rail==Rail.LEFT?integer((long)v.left+sideWidth+gap):v.left;
        int sideLeft=rail==Rail.LEFT?v.left:integer((long)mainLeft+mainWidth+gap);
        frames.put(t.activeMainId,new Frame(t.activeMainId,t,true,Rect.size(mainLeft,v.top,mainWidth,height)));
        for(int i=0;i<count;i++){
            int id=shown.get(i),top=integer((long)v.top+i*(sideHeight+(long)gap));
            frames.put(id,new Frame(id,t,true,Rect.size(sideLeft,top,sideWidth,sideHeight)));
        }
    }
    private static void layoutDual(Rect v,int gap,AtomicWorkbenchPoolTopology t,Rail rail,List<Integer> shown,int rows,int columns,Map<Integer,Frame> frames){
        int width=v.width(),height=v.height();
        int gapCount=columns==0?1:columns+1;
        int availableTileWidth=integer((long)width-(long)gap*gapCount);
        int sideHeightTotal=integer((long)height-(long)gap*Math.max(0,rows-1));
        if(availableTileWidth<2+columns||rows>0&&sideHeightTotal<rows)throw new IllegalArgumentException("dual layout infeasible");
        int averageSideHeight=columns==0?0:sideHeightTotal/rows;
        long tileHeightSum=(long)height*2+(long)columns*averageSideHeight;
        int mainWidth=Math.max(1,Math.round(availableTileWidth*(float)height/tileHeightSum));
        mainWidth=Math.min(mainWidth,Math.max(1,(availableTileWidth-columns)/2));
        int sideTilesWidth=Math.max(columns,availableTileWidth-mainWidth*2);
        int sideGridWidth=columns==0?0:integer((long)sideTilesWidth+(columns-1L)*gap);
        int mainLeft=rail==Rail.RIGHT||columns==0?v.left:integer((long)v.left+sideGridWidth+gap);
        int sideLeft=rail==Rail.RIGHT?integer((long)mainLeft+mainWidth*2L+gap*2L):v.left;
        List<Integer> ordered=t.mainIdsOuterToRail();
        for(int physical=0;physical<2;physical++){
            int id=ordered.get(rail==Rail.RIGHT?physical:1-physical);
            int x=integer((long)mainLeft+physical*(mainWidth+(long)gap));
            frames.put(id,new Frame(id,t,true,Rect.size(x,v.top,mainWidth,height)));
        }
        for(int i=0;i<shown.size();i++){
            int column=i/rows,row=i%rows,id=shown.get(i);
            int x=integer((long)sideLeft+offset(sideTilesWidth,columns,column,gap));
            int y=integer((long)v.top+offset(sideHeightTotal,rows,row,gap));
            frames.put(id,new Frame(id,t,true,Rect.size(x,y,part(sideTilesWidth,columns,column),part(sideHeightTotal,rows,row))));
        }
    }
    public Map<Integer,Frame> framesById(){return frames;}
    public Frame frameFor(int id){Frame frame=frames.get(id);if(frame==null)throw new IllegalArgumentException("identity");return frame;}
    /** Only the visible active main exposes a rectangle for direct input routing. */
    public Rect inputBoundsFor(int id) {
        Frame frame = frameFor(id);
        if (!frame.inputGeometryEligible) throw new IllegalStateException("window is not the visible input target");
        return frame.bounds;
    }
    public Rect activeMainBounds(){return frameFor(topology.activeMainId).bounds;}
    public Rect desktopBounds(){return activeMainBounds();}
    public Rect coverBounds(){return activeMainBounds();}
    public Rect statusBounds(){return activeMainBounds();}
    private static Rect hiddenProducer(){return Rect.size(-2,-2,1,1);}
    private static int part(int total,int count,int index){return total/count+(index<total%count?1:0);}
    private static long offset(int total,int count,int index,int gap){return (long)index*(total/count)+Math.min(index,total%count)+(long)index*gap;}
    private static int integer(long value){if(value<Integer.MIN_VALUE||value>Integer.MAX_VALUE)throw new IllegalArgumentException("coordinate overflow");return (int)value;}
    private void verify(){
        if(frames.size()!=8)throw new IllegalArgumentException("missing identity");
        List<Frame> visible=new ArrayList<>();
        for(int id:topology.poolIds()){
            Frame f=frameFor(id);
            if(f.windowId!=id||f.role!=topology.roleOf(id)||f.retainsOwnedResponsibility!=topology.owned(id))throw new IllegalArgumentException("frame identity");
            if(f.visible){if(f.role==AtomicWorkbenchPoolTopology.Role.NONE||!viewport.contains(f.bounds))throw new IllegalArgumentException("visible frame");visible.add(f);}
            else if(!f.bounds.equals(hiddenProducer()))throw new IllegalArgumentException("hidden producer");
        }
        for(int i=0;i<visible.size();i++)for(int j=i+1;j<visible.size();j++)if(visible.get(i).bounds.overlaps(visible.get(j).bounds))throw new IllegalArgumentException("overlap");
        if(!frameFor(topology.activeMainId).visible)throw new IllegalArgumentException("active main hidden");
    }
}
