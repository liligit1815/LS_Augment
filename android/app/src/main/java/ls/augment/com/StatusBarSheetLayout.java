package ls.augment.com;

import java.util.*;

/** Print a sparse logical worksheet onto fixed paper; overflow clips without invalidating the layout. */
public final class StatusBarSheetLayout {
    private static final double EPSILON=.0001;
    private StatusBarSheetLayout(){}
    public static final class Measure {public final String address;public final float width,height;public Measure(String address,float width,float height){this.address=address;this.width=width;this.height=height;}}
    public static final class Bounds {
        public final float x,y,width,height,density,cutoutLeft,cutoutRight;public final List<Box> cutouts;
        public Bounds(float x,float y,float width,float height,float density,float cutoutLeft,float cutoutRight){this.x=x;this.y=y;this.width=width;this.height=height;this.density=density;this.cutoutLeft=cutoutLeft;this.cutoutRight=cutoutRight;cutouts=cutoutRight>cutoutLeft?Collections.singletonList(new Box(cutoutLeft,y,cutoutRight-cutoutLeft,height)):Collections.emptyList();}
        public Bounds(float x,float y,float width,float height,float density,List<Box> cutouts){this.x=x;this.y=y;this.width=width;this.height=height;this.density=density;cutoutLeft=cutoutRight=0;this.cutouts=cutouts==null?Collections.emptyList():Collections.unmodifiableList(new ArrayList<>(cutouts));}
    }
    public static final class Box {
        public final float x,y,width,height;
        public Box(float x,float y,float width,float height){this.x=x;this.y=y;this.width=width;this.height=height;}
        public float centerX(){return clamp((double)x+width/2d);}public float centerY(){return clamp((double)y+height/2d);}
        public boolean isEmpty(){return width<=0||height<=0;}
    }
    public static final class Placement {
        public final StatusBarSheetSpec.Cell cell;public final Box rawCellBox,rawContentBox,cellBox,contentBox,visibleBox;
        public final List<Box> visibleBoxes;public final boolean clipped;
        private Placement(StatusBarSheetSpec.Cell cell,Box rawCellBox,Box rawContentBox,Box cellBox,Box contentBox,Box visibleBox,List<Box> visibleBoxes,boolean clipped){this.cell=cell;this.rawCellBox=rawCellBox;this.rawContentBox=rawContentBox;this.cellBox=cellBox;this.contentBox=contentBox;this.visibleBox=visibleBox;this.visibleBoxes=Collections.unmodifiableList(new ArrayList<>(visibleBoxes));this.clipped=clipped;}
    }
    public static final class Result {
        public final boolean valid;public final String error,warning;public final float outputScale;public final double outputScaleExact;public final Box clipBox;public final List<Box> cutouts;
        public final Map<String,Placement> placements;public final Map<String,List<Box>> visibleBoxes;
        private Result(boolean valid,String error,String warning,double scale,Box clip,List<Box> cutouts,Map<String,Placement> placements){
            this.valid=valid;this.error=error;this.warning=warning;this.outputScale=scaleFloat(scale);this.outputScaleExact=scale;this.clipBox=clip;this.cutouts=Collections.unmodifiableList(new ArrayList<>(cutouts));this.placements=Collections.unmodifiableMap(new LinkedHashMap<>(placements));Map<String,List<Box>> visible=new LinkedHashMap<>();for(Map.Entry<String,Placement> e:placements.entrySet())visible.put(e.getKey(),e.getValue().visibleBoxes);visibleBoxes=Collections.unmodifiableMap(visible);
        }
        public Placement get(String address){return placements.get(address);}
    }
    private static Result fail(String error){return new Result(false,error,"",1,new Box(0,0,0,0),Collections.emptyList(),Collections.emptyMap());}
    /** Manual scale is independent of editing zoom. Fit modes use the full logical canvas extent. */
    public static float fitScale(StatusBarSheetSpec spec,Bounds bounds){return scaleFloat(fitScaleExact(spec,bounds));}
    public static double fitScaleExact(StatusBarSheetSpec spec,Bounds bounds){
        validateBounds(bounds);if(spec==null)throw new IllegalArgumentException("表格数据缺失");
        double width=spec.widthExact()*bounds.density,height=spec.heightExact()*bounds.density;
        double value=spec.fitMode.equals("width")?bounds.width/width:spec.fitMode.equals("page")?Math.min(bounds.width/width,bounds.height/height):spec.outputScale;
        if(!Double.isFinite(value)||value<=0)throw new IllegalArgumentException("输出比例无效，请检查画布尺寸");return value;
    }
    private static float scaleFloat(double value){return (float)Math.max(Float.MIN_VALUE,Math.min(Float.MAX_VALUE,value));}
    private static void validateBounds(Bounds b){
        if(b==null||!finite(b.x,b.y,b.width,b.height,b.density,b.cutoutLeft,b.cutoutRight)||b.width<=0||b.height<=0||b.density<=0)throw new IllegalArgumentException("状态栏固定纸张范围无效");
        for(Box hole:b.cutouts)if(hole==null||!finite(hole.x,hole.y,hole.width,hole.height)||hole.width<0||hole.height<0)throw new IllegalArgumentException("屏幕开孔范围无效");
    }
    public static Result layout(StatusBarSheetSpec spec,List<Measure> measures,Bounds bounds){
        if(spec==null||measures==null)return fail("表格或测量数据缺失");
        try{
            double scale=fitScaleExact(spec,bounds);Map<String,StatusBarSheetSpec.Cell> anchors=new LinkedHashMap<>();for(StatusBarSheetSpec.Cell c:spec.cells)anchors.put(c.address(),c);
            Map<String,Measure> measured=new LinkedHashMap<>();for(Measure m:measures){if(m==null||m.address==null||!finite(m.width,m.height)||m.width<0||m.height<0)throw new IllegalArgumentException("组件测量尺寸无效");if(!anchors.containsKey(m.address))throw new IllegalArgumentException(m.address+" 的测量数据没有对应单元格");if(measured.put(m.address,m)!=null)throw new IllegalArgumentException(m.address+" 的测量数据重复");}
            double density=bounds.density,originX=bounds.x+spec.outputOffsetX*density,originY=bounds.y+spec.outputOffsetY*density;
            DBox paper=new DBox(bounds.x,bounds.y,bounds.width,bounds.height);Box clip=paper.box();Map<String,Placement> placements=new LinkedHashMap<>();LinkedHashSet<String> warnings=new LinkedHashSet<>();
            double canvasW=spec.widthExact()*density*scale,canvasH=spec.heightExact()*density*scale;
            if(!contains(paper,new DBox(originX,originY,canvasW,canvasH)))warnings.add("画布超出固定状态栏纸张，超出部分按纸张裁切");
            for(StatusBarSheetSpec.Cell cell:spec.cells){
                DBox rawCell=new DBox(spec.colStart(cell.col)*density,spec.rowStart(cell.row)*density,spec.colSpanWidth(cell.col,cell.colSpan)*density,spec.rowSpanHeight(cell.row,cell.rowSpan)*density);
                Measure m=measured.get(cell.address());double w=m==null||cell.content.isEmpty()?0:m.width,h=m==null||cell.content.isEmpty()?0:m.height;
                double px=cell.paddingX*density,py=cell.paddingY*density,innerW=rawCell.width-2*px,innerH=rawCell.height-2*py;
                double contentX=rawCell.x+px;if(cell.align.equals("right"))contentX+=innerW-w;else if(cell.align.equals("center"))contentX+=(innerW-w)/2;
                DBox rawContent=new DBox(contentX+cell.offsetX*density,rawCell.y+(rawCell.height-h)/2+cell.offsetY*density,w,h);
                if(w>0&&h>0&&(innerW<w-EPSILON||innerH<h-EPSILON||!contains(rawCell,rawContent)))warnings.add("部分内容超出单元格，保留原尺寸并仅按纸张裁切");
                if(!cell.content.isEmpty()&&cell.size*scale<StatusBarSheetSpec.recommendedMinimumSize(cell.content))warnings.add("输出后的部分文字或图标较小，请按实际阅读效果调整比例");
                DBox outputCell=rawCell.transformed(scale,originX,originY),outputContent=rawContent.transformed(scale,originX,originY);
                if(!outputCell.representable()||!outputContent.representable())warnings.add("极大坐标仅保留纸张内可见部分，远端内容仍保存在画布");
                DBox visible=intersection(outputContent,paper);List<DBox> pieces=new ArrayList<>();if(!visible.empty())pieces.add(visible);
                boolean clipped=!contains(paper,outputContent)&&!outputContent.empty();if(clipped)warnings.add("部分内容超出纸张，已裁切；画布内容仍保留");
                for(Box hole:bounds.cutouts){DBox area=new DBox(hole.x,hole.y,hole.width,hole.height);List<DBox> next=new ArrayList<>();for(DBox piece:pieces){DBox overlap=intersection(piece,area);if(!overlap.empty()){clipped=true;warnings.add("部分内容经过屏幕开孔，开孔区域不显示");subtract(next,piece,overlap);}else next.add(piece);}pieces=next;}
                List<Box> visibleParts=new ArrayList<>();for(DBox piece:pieces)visibleParts.add(piece.box());
                placements.put(cell.address(),new Placement(cell,rawCell.box(),rawContent.box(),outputCell.box(),outputContent.box(),visible.box(),visibleParts,clipped));
            }
            return new Result(true,"",String.join("；",warnings),scale,clip,bounds.cutouts,placements);
        }catch(IllegalArgumentException error){return fail(error.getMessage()==null?"输出几何数据无效":error.getMessage());}
    }
    private static final class DBox {
        final double x,y,width,height;DBox(double x,double y,double width,double height){this.x=x;this.y=y;this.width=width;this.height=height;}
        boolean empty(){return width<=0||height<=0;}DBox transformed(double scale,double ox,double oy){return new DBox(x*scale+ox,y*scale+oy,width*scale,height*scale);}
        boolean representable(){return Math.abs(x)<=Float.MAX_VALUE&&Math.abs(y)<=Float.MAX_VALUE&&width<=Float.MAX_VALUE&&height<=Float.MAX_VALUE;}
        // All visibility math occurs in double before this finite representation reaches Android APIs.
        Box box(){return new Box(clamp(x),clamp(y),clamp(width),clamp(height));}
    }
    private static float clamp(double v){return (float)Math.max(-Float.MAX_VALUE,Math.min(Float.MAX_VALUE,v));}
    private static boolean contains(DBox outer,DBox inner){return inner.empty()||inner.x>=outer.x-EPSILON&&inner.y>=outer.y-EPSILON&&inner.x+inner.width<=outer.x+outer.width+EPSILON&&inner.y+inner.height<=outer.y+outer.height+EPSILON;}
    private static DBox intersection(DBox a,DBox b){double left=Math.max(a.x,b.x),top=Math.max(a.y,b.y),right=Math.min(a.x+a.width,b.x+b.width),bottom=Math.min(a.y+a.height,b.y+b.height);if(right<=left||bottom<=top)return new DBox(Math.max(b.x,Math.min(b.x+b.width,left)),Math.max(b.y,Math.min(b.y+b.height,top)),0,0);return new DBox(left,top,right-left,bottom-top);}
    private static void subtract(List<DBox> result,DBox a,DBox b){part(result,a.x,a.y,a.width,b.y-a.y);part(result,a.x,b.y+b.height,a.width,a.y+a.height-b.y-b.height);part(result,a.x,b.y,b.x-a.x,b.height);part(result,b.x+b.width,b.y,a.x+a.width-b.x-b.width,b.height);}
    private static void part(List<DBox> result,double x,double y,double w,double h){if(w>0&&h>0)result.add(new DBox(x,y,w,h));}
    private static boolean finite(float... values){for(float value:values)if(!Float.isFinite(value))return false;return true;}
}
