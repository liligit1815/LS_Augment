package ls.augment.com;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Sparse worksheet coordinates are independent of the fixed status-bar output paper. */
public final class StatusBarSheetSpec {
    public static final String KEY="ls_augment_statusbar_sheet", MODE_KEY="ls_augment_statusbar_layout_mode";
    /** Actual configuration transport capacity, not a row, column or cell-count limit. */
    public static final int MAX_SERIALIZED_BYTES=64*1024;
    public static final String[] CONTENT_IDS={"clock","notifications","system_icons","battery","cpu","gpu","battery_temp","current","power","network","wifi","mobile","bluetooth","alarm","mute","headphones","vpn","fan","text","image"};
    public static final String[] CONTENT_LABELS={"时钟","通知图标","系统图标组","电池 / 三合一","CPU 温度","GPU 温度","电池温度","电流","功率","网速","Wi-Fi","移动信号","蓝牙","闹钟","静音","耳机","VPN","风扇","自定义文字 / 符号","自定义图片"};
    public static final String[] LABELS=CONTENT_LABELS.clone();
    private static final Set<String> CONTENTS=Collections.unmodifiableSet(new HashSet<>(Arrays.asList(CONTENT_IDS)));
    private static final Set<String> TEXT=Collections.unmodifiableSet(new HashSet<>(Arrays.asList("clock","cpu","gpu","battery_temp","current","power","network","text")));
    public final int rows,cols;
    public final float defaultRowHeight,defaultColWidth,rowGap,colGap,outputScale,outputOffsetX,outputOffsetY;
    public final String fitMode;
    public final Map<Integer,Float> rowOverrides,colOverrides;
    public final List<Cell> cells;

    public StatusBarSheetSpec(int rows,int cols,float defaultRowHeight,float defaultColWidth,
            Map<Integer,Float> rowOverrides,Map<Integer,Float> colOverrides,float rowGap,float colGap,
            List<Cell> cells,float outputScale,float outputOffsetX,float outputOffsetY,String fitMode){
        if(rows<1||cols<1)throw new IllegalArgumentException("行数和列数须为正整数");
        positive(defaultRowHeight,"默认行高");positive(defaultColWidth,"默认列宽");nonnegative(rowGap,"行间距");nonnegative(colGap,"列间距");
        positive(outputScale,"输出比例");finite(outputOffsetX,"输出水平位置");finite(outputOffsetY,"输出垂直位置");
        if(!Arrays.asList("manual","width","page").contains(fitMode))throw new IllegalArgumentException("输出缩放方式无效");
        this.rows=rows;this.cols=cols;this.defaultRowHeight=defaultRowHeight;this.defaultColWidth=defaultColWidth;
        this.rowGap=rowGap;this.colGap=colGap;this.outputScale=outputScale;this.outputOffsetX=outputOffsetX;this.outputOffsetY=outputOffsetY;this.fitMode=fitMode;
        this.rowOverrides=tracks(rowOverrides,rows,defaultRowHeight,"行高");this.colOverrides=tracks(colOverrides,cols,defaultColWidth,"列宽");
        if(cells==null)throw new IllegalArgumentException("单元格列表无效");
        List<Cell> copy=new ArrayList<>(cells);for(Cell c:copy)if(c==null)throw new IllegalArgumentException("单元格无效");
        copy.sort(Comparator.comparingInt((Cell c)->c.row).thenComparingInt(c->c.col));
        Set<String> used=new HashSet<>();
        for(int i=0;i<copy.size();i++){
            Cell c=copy.get(i);if(c.endRow()>rows||c.endCol()>cols)throw new IllegalArgumentException(c.address()+" 超出画布，请先扩展行列或移动内容");
            if(!c.content.isEmpty()&&!c.content.equals("text")&&!c.content.equals("image")&&!used.add(c.content))throw new IllegalArgumentException(label(c.content)+"只能放置一次，不能重复使用原生组件");
            for(int j=0;j<i;j++)if(overlaps(c,copy.get(j)))throw new IllegalArgumentException(c.address()+" 与其他单元格重叠，请先移动或清空");
        }
        this.cells=Collections.unmodifiableList(copy);checkCapacity(encode());
    }
    /** Compatibility constructor converts caller-owned legacy arrays to sparse overrides immediately. */
    public StatusBarSheetSpec(int rows,int cols,float[] rowHeights,float[] colWidths,float rowGap,float colGap,List<Cell> cells){
        this(rows,cols,arrayDefault(rowHeights,rows,"行高"),arrayDefault(colWidths,cols,"列宽"),arrayTracks(rowHeights),arrayTracks(colWidths),rowGap,colGap,cells,1,0,0,"manual");
    }
    private static float arrayDefault(float[] values,int count,String title){if(values==null||values.length!=count||count<1)throw new IllegalArgumentException(title+"数量与画布不一致");return values[0];}
    private static Map<Integer,Float> arrayTracks(float[] values){Map<Integer,Float> result=new TreeMap<>();for(int i=0;i<values.length;i++)if(values[i]!=values[0])result.put(i,values[i]);return result;}
    private static Map<Integer,Float> tracks(Map<Integer,Float> input,int count,float defaultValue,String label){
        if(input==null)throw new IllegalArgumentException(label+"配置无效");TreeMap<Integer,Float> result=new TreeMap<>();
        for(Map.Entry<Integer,Float> e:input.entrySet()){if(e.getKey()==null||e.getKey()<0||e.getKey()>=count||e.getValue()==null)throw new IllegalArgumentException(label+"索引无效");positive(e.getValue(),label);result.put(e.getKey(),e.getValue());}
        return Collections.unmodifiableMap(result);
    }
    public static StatusBarSheetSpec empty(int rows,int cols){return new StatusBarSheetSpec(rows,cols,15,26,Collections.emptyMap(),Collections.emptyMap(),2,2,Collections.emptyList(),1,0,0,"manual");}
    public static StatusBarSheetSpec defaults(){return new StatusBarSheetSpec(2,8,new float[]{15,15},new float[]{36,36,30,30,24,24,24,28},2,2,Arrays.asList(
            new Cell(0,0,2,2,"clock",12,0,0,0,0,"left","",""),new Cell(0,2,2,2,"notifications",14,0,0,0,0,"center","",""),
            new Cell(0,4,2,2,"system_icons",14,0,0,0,0,"center","",""),new Cell(0,6,2,2,"battery",24,0,0,0,0,"center","","")));}
    public static boolean isText(String content){return TEXT.contains(content);}
    /** Suggested numeric editor step; structural validation accepts any finite positive size. */
    public static float minimumSize(String content){return .1f;}
    public static float recommendedMinimumSize(String content){return isText(content)||"".equals(content)?12:14;}
    public static String label(String content){for(int i=0;i<CONTENT_IDS.length;i++)if(CONTENT_IDS[i].equals(content))return CONTENT_LABELS[i];return "空白";}
    public float rowHeight(int row){index(row,rows,"行");return rowOverrides.getOrDefault(row,defaultRowHeight);}
    public float colWidth(int col){index(col,cols,"列");return colOverrides.getOrDefault(col,defaultColWidth);}
    public double rowStart(int row){index(row,rows,"行");return trackStart(row,defaultRowHeight,rowGap,rowOverrides);}
    public double colStart(int col){index(col,cols,"列");return trackStart(col,defaultColWidth,colGap,colOverrides);}
    public double rowSpanHeight(int row,int span){span(row,span,rows,"行");return trackExtent(row,span,defaultRowHeight,rowGap,rowOverrides);}
    public double colSpanWidth(int col,int span){span(col,span,cols,"列");return trackExtent(col,span,defaultColWidth,colGap,colOverrides);}
    public double widthExact(){return trackExtent(0,cols,defaultColWidth,colGap,colOverrides);}
    public double heightExact(){return trackExtent(0,rows,defaultRowHeight,rowGap,rowOverrides);}
    public float width(){return (float)Math.min(Float.MAX_VALUE,widthExact());}
    public float height(){return (float)Math.min(Float.MAX_VALUE,heightExact());}
    private static double trackStart(int index,float size,float gap,Map<Integer,Float> overrides){double explicit=0;int used=0;for(Map.Entry<Integer,Float> e:overrides.entrySet()){if(e.getKey()>=index)break;used++;explicit+=e.getValue();}return (double)(index-used)*size+(double)index*gap+explicit;}
    private static double trackExtent(int from,int count,float size,float gap,Map<Integer,Float> overrides){double explicit=0;int used=0;long to=(long)from+count;for(Map.Entry<Integer,Float> e:overrides.entrySet()){if(e.getKey()>=to)break;if(e.getKey()>=from){used++;explicit+=e.getValue();}}return (double)(count-used)*size+(count-1d)*gap+explicit;}
    /** Binary search supports viewport virtualization without enumerating the logical canvas. */
    public int rowAt(double y){return trackAt(y,rows,true);}public int colAt(double x){return trackAt(x,cols,false);}
    private int trackAt(double position,int count,boolean row){if(Double.isNaN(position))throw new IllegalArgumentException("画布坐标无效");if(position<=0)return 0;int low=0,high=count-1;while(low<high){int mid=(int)(((long)low+high+1)/2);double start=row?rowStart(mid):colStart(mid);if(start<=position)low=mid;else high=mid-1;}return low;}
    private static void index(int value,int extent,String label){if(value<0||value>=extent)throw new IllegalArgumentException(label+"索引超出画布");}
    private static void span(int start,int count,int extent,String label){if(start<0||count<1||(long)start+count>extent)throw new IllegalArgumentException(label+"范围超出画布");}
    public Cell cellAt(int row,int col){for(Cell cell:cells)if(cell.covers(row,col))return cell;return null;}

    public StatusBarSheetSpec withRowHeight(int row,float height){index(row,rows,"行");Map<Integer,Float> values=new TreeMap<>(rowOverrides);values.put(row,height);return copy(rows,cols,defaultRowHeight,defaultColWidth,values,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withColWidth(int col,float width){index(col,cols,"列");Map<Integer,Float> values=new TreeMap<>(colOverrides);values.put(col,width);return copy(rows,cols,defaultRowHeight,defaultColWidth,rowOverrides,values,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withoutRowHeight(int row){index(row,rows,"行");Map<Integer,Float> values=new TreeMap<>(rowOverrides);values.remove(row);return copy(rows,cols,defaultRowHeight,defaultColWidth,values,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withoutColWidth(int col){index(col,cols,"列");Map<Integer,Float> values=new TreeMap<>(colOverrides);values.remove(col);return copy(rows,cols,defaultRowHeight,defaultColWidth,rowOverrides,values,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withDefaultRowHeight(float height){return copy(rows,cols,height,defaultColWidth,rowOverrides,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withDefaultColWidth(float width){return copy(rows,cols,defaultRowHeight,width,rowOverrides,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withGaps(float rowGap,float colGap){return copy(rows,cols,defaultRowHeight,defaultColWidth,rowOverrides,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    public StatusBarSheetSpec withOutput(float scale,float offsetX,float offsetY,String fitMode){return copy(rows,cols,defaultRowHeight,defaultColWidth,rowOverrides,colOverrides,rowGap,colGap,cells,scale,offsetX,offsetY,fitMode);}
    public StatusBarSheetSpec withDimensions(float[] heights,float[] widths,float rowGap,float colGap){return copy(rows,cols,arrayDefault(heights,rows,"行高"),arrayDefault(widths,cols,"列宽"),arrayTracks(heights),arrayTracks(widths),rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    private StatusBarSheetSpec copy(List<Cell> cells){return copy(rows,cols,defaultRowHeight,defaultColWidth,rowOverrides,colOverrides,rowGap,colGap,cells,outputScale,outputOffsetX,outputOffsetY,fitMode);}
    private static StatusBarSheetSpec copy(int rows,int cols,float h,float w,Map<Integer,Float> rh,Map<Integer,Float> cw,float rg,float cg,List<Cell> cells,float scale,float x,float y,String fit){return new StatusBarSheetSpec(rows,cols,h,w,rh,cw,rg,cg,cells,scale,x,y,fit);}
    public StatusBarSheetSpec withCell(Cell cell){
        if(cell==null)throw new IllegalArgumentException("单元格无效");List<Cell> result=new ArrayList<>();
        for(Cell c:cells){if(c.row==cell.row&&c.col==cell.col)continue;if(overlaps(c,cell)){if(!c.content.isEmpty())throw new IllegalArgumentException("范围包含 "+c.address()+" 的"+label(c.content)+"，请先移动或清空");addOutside(result,c,cell);}else result.add(c);}
        result.add(cell);return copy(result);
    }
    public StatusBarSheetSpec withoutCell(int row,int col){Cell target=cellAt(row,col);if(target==null)return this;List<Cell> result=new ArrayList<>(cells);result.remove(target);return copy(result);}
    public StatusBarSheetSpec resize(int rows,int cols){
        if(rows<1||cols<1)throw new IllegalArgumentException("行数和列数须为正整数");List<Cell> result=new ArrayList<>();
        for(Cell cell:cells){if(cell.endRow()>rows||cell.endCol()>cols){if(!cell.content.isEmpty())throw new IllegalArgumentException(cell.address()+" 的"+label(cell.content)+"超出新画布，请先移动或清空");if(cell.row<rows&&cell.col<cols)result.add(cell.withSpan(Math.min(cell.rowSpan,rows-cell.row),Math.min(cell.colSpan,cols-cell.col)));}else result.add(cell);}
        Map<Integer,Float> rh=new TreeMap<>(),cw=new TreeMap<>();for(Map.Entry<Integer,Float> e:rowOverrides.entrySet())if(e.getKey()<rows)rh.put(e.getKey(),e.getValue());for(Map.Entry<Integer,Float> e:colOverrides.entrySet())if(e.getKey()<cols)cw.put(e.getKey(),e.getValue());
        return copy(rows,cols,defaultRowHeight,defaultColWidth,rh,cw,rowGap,colGap,result,outputScale,outputOffsetX,outputOffsetY,fitMode);
    }
    public StatusBarSheetSpec merge(int row,int col,int rowSpan,int colSpan){
        span(row,rowSpan,rows,"行");span(col,colSpan,cols,"列");Cell existing=cellAt(row,col);
        if(existing!=null&&(existing.row!=row||existing.col!=col))throw new IllegalArgumentException("请从合并格左上角 "+existing.address()+" 调整范围");
        Cell rectangle=(existing==null?Cell.empty(row,col):existing).withSpan(rowSpan,colSpan),content=null;
        for(Cell c:cells)if(overlaps(c,rectangle)&&!c.content.isEmpty()){
            if(content!=null)throw new IllegalArgumentException("合并范围有多个内容，请先移动或清空其中一个");
            if(c.row<row||c.col<col||c.endRow()>rectangle.endRow()||c.endCol()>rectangle.endCol())throw new IllegalArgumentException("请完整选中 "+c.address()+" 的合并范围");content=c;
        }
        if(content!=null&&(content.row!=row||content.col!=col)){List<Cell> result=new ArrayList<>(cells);result.remove(content);return copy(result).withCell(content.at(row,col).withSpan(rowSpan,colSpan));}
        return withCell(rectangle);
    }
    public StatusBarSheetSpec unmerge(int row,int col){Cell cell=cellAt(row,col);return cell==null?this:withCell(cell.withSpan(1,1));}
    public StatusBarSheetSpec move(int row,int col,int toRow,int toCol){
        Cell source=cellAt(row,col);if(source==null)throw new IllegalArgumentException("选中的格子没有内容或布局");if(source.row==toRow&&source.col==toCol)return this;
        Cell target=cellAt(toRow,toCol);if(target==source)target=null;if(target!=null&&(target.row!=toRow||target.col!=toCol))throw new IllegalArgumentException("请移动到合并格左上角 "+target.address());
        List<Cell> result=new ArrayList<>(cells);result.remove(source);result.remove(target);if(target!=null)result.add(target.at(source.row,source.col));result.add(source.at(toRow,toCol));return copy(result);
    }
    private static boolean overlaps(Cell a,Cell b){return a.row<b.endRow()&&a.endRow()>b.row&&a.col<b.endCol()&&a.endCol()>b.col;}
    /** Rectangle subtraction makes at most four sparse cells, regardless of merged area. */
    private static void addOutside(List<Cell> result,Cell source,Cell removed){
        long top=Math.max(source.row,removed.row),bottom=Math.min(source.endRow(),removed.endRow()),left=Math.max(source.col,removed.col),right=Math.min(source.endCol(),removed.endCol());
        part(result,source,source.row,source.col,top-source.row,source.colSpan);part(result,source,bottom,source.col,source.endRow()-bottom,source.colSpan);
        part(result,source,top,source.col,bottom-top,left-source.col);part(result,source,top,right,bottom-top,source.endCol()-right);
    }
    private static void part(List<Cell> result,Cell source,long row,long col,long rows,long cols){if(rows>0&&cols>0)result.add(new Cell((int)row,(int)col,(int)rows,(int)cols,source.content,source.size,source.paddingX,source.paddingY,source.offsetX,source.offsetY,source.align,source.text,source.image));}

    public static String columnName(int col){if(col<0||col==Integer.MAX_VALUE)throw new IllegalArgumentException("列索引无效");long value=(long)col+1;StringBuilder name=new StringBuilder();while(value>0){value--;name.append((char)('A'+value%26));value/=26;}return name.reverse().toString();}
    public static String address(int row,int col){if(row<0||row==Integer.MAX_VALUE)throw new IllegalArgumentException("行索引无效");return columnName(col)+((long)row+1);}
    public static Address parseAddress(String value){
        if(value==null)throw new IllegalArgumentException("单元格地址无效");String s=value.trim().toUpperCase(Locale.ROOT);int at=0;long column=0;
        while(at<s.length()&&s.charAt(at)>='A'&&s.charAt(at)<='Z'){int digit=s.charAt(at++)-'A'+1;if(column>(Integer.MAX_VALUE-digit)/26L)throw new IllegalArgumentException("单元格列号超出整数范围");column=column*26+digit;}
        if(column==0||at==s.length()||s.charAt(at)=='0')throw new IllegalArgumentException("请输入单元格地址，例如 AA12");long row=0;
        while(at<s.length()){char c=s.charAt(at++);if(c<'0'||c>'9'||row>(Integer.MAX_VALUE-(c-'0'))/10L)throw new IllegalArgumentException("单元格行号无效");row=row*10+c-'0';}
        if(row<1)throw new IllegalArgumentException("行号从 1 开始");return new Address((int)row-1,(int)column-1);
    }
    public static final class Address {public final int row,col;private Address(int row,int col){this.row=row;this.col=col;}public String toString(){return address(row,col);}}
    private static void positive(float value,String label){if(!Float.isFinite(value)||value<=0)throw new IllegalArgumentException(label+"须为有限正数");}
    private static void nonnegative(float value,String label){if(!Float.isFinite(value)||value<0)throw new IllegalArgumentException(label+"须为有限非负数");}
    private static void finite(float value,String label){if(!Float.isFinite(value))throw new IllegalArgumentException(label+"须为有限数值");}
    private static String number(float v){return (double)v==(int)v?Integer.toString((int)v):Float.toString(v);}
    private static String encoded(String value){return Base64.getUrlEncoder().withoutPadding().encodeToString(value.getBytes(StandardCharsets.UTF_8));}
    private static String decoded(String value){
        if(!value.matches("[A-Za-z0-9_-]*"))throw new IllegalArgumentException("文字编码无效");
        try{String result=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(Base64.getUrlDecoder().decode(value))).toString();if(!encoded(result).equals(value))throw new IllegalArgumentException("文字编码不是规范格式");return result;}
        catch(CharacterCodingException error){throw new IllegalArgumentException("文字编码无效");}
    }
    private static String trackEncoding(Map<Integer,Float> values){StringBuilder result=new StringBuilder();for(Map.Entry<Integer,Float> e:values.entrySet()){if(result.length()>0)result.append(',');result.append(e.getKey()).append(':').append(number(e.getValue()));}return result.toString();}
    private static void checkCapacity(String value){if(value.length()>MAX_SERIALIZED_BYTES)throw new IllegalArgumentException("内容或独立尺寸配置过多，超出 64 KiB 配置容量；请减少内容或使用默认行高列宽");}
    private String encode(){
        StringBuilder result=new StringBuilder("SS2;").append(rows).append(',').append(cols).append(',').append(number(defaultRowHeight)).append(',').append(number(defaultColWidth)).append(',')
                .append(number(rowGap)).append(',').append(number(colGap)).append(',').append(number(outputScale)).append(',').append(number(outputOffsetX)).append(',').append(number(outputOffsetY)).append(',').append(fitMode)
                .append(';').append(trackEncoding(rowOverrides)).append(';').append(trackEncoding(colOverrides));
        for(Cell c:cells)result.append(';').append(c.row).append(',').append(c.col).append(',').append(c.rowSpan).append(',').append(c.colSpan).append(',').append(c.content).append(',').append(number(c.size)).append(',')
                .append(number(c.paddingX)).append(',').append(number(c.paddingY)).append(',').append(number(c.offsetX)).append(',').append(number(c.offsetY)).append(',').append(c.align).append(',').append(encoded(c.text)).append(',').append(encoded(c.image));
        return result.toString();
    }
    /** Every edited specification writes SS2; valid SS1 input retains its geometry. */
    public String serialize(){return encode();}
    public static StatusBarSheetSpec parse(String raw){return parseResult(raw).spec;}
    public static ParseResult parseResult(String raw){
        if(raw==null||raw.trim().isEmpty())return new ParseResult(true,null,"");
        try{
            checkCapacity(raw);String[] entries=raw.split(";",-1);if(entries.length<4)throw new IllegalArgumentException("表格配置格式无效");
            String[] m=entries[1].split(",",-1);List<Cell> cells=new ArrayList<>();for(int i=4;i<entries.length;i++)cells.add(parseCell(entries[i]));StatusBarSheetSpec spec;
            if(entries[0].equals("SS1")&&m.length==4){spec=new StatusBarSheetSpec(Integer.parseInt(m[0]),Integer.parseInt(m[1]),numbers(entries[2]),numbers(entries[3]),Float.parseFloat(m[2]),Float.parseFloat(m[3]),cells);}
            else if(entries[0].equals("SS2")&&m.length==10){spec=new StatusBarSheetSpec(Integer.parseInt(m[0]),Integer.parseInt(m[1]),Float.parseFloat(m[2]),Float.parseFloat(m[3]),parseTracks(entries[2]),parseTracks(entries[3]),Float.parseFloat(m[4]),Float.parseFloat(m[5]),cells,Float.parseFloat(m[6]),Float.parseFloat(m[7]),Float.parseFloat(m[8]),m[9]);}
            else throw new IllegalArgumentException("表格配置版本或字段数量无效");return new ParseResult(true,spec,"");
        }catch(IllegalArgumentException error){return new ParseResult(false,null,error.getMessage()==null?"表格配置格式无效":error.getMessage());}
    }
    private static Cell parseCell(String entry){String[] p=entry.split(",",-1);if(p.length!=13)throw new IllegalArgumentException("单元格字段数量无效");return new Cell(Integer.parseInt(p[0]),Integer.parseInt(p[1]),Integer.parseInt(p[2]),Integer.parseInt(p[3]),p[4],Float.parseFloat(p[5]),Float.parseFloat(p[6]),Float.parseFloat(p[7]),Float.parseFloat(p[8]),Float.parseFloat(p[9]),p[10],decoded(p[11]),decoded(p[12]));}
    private static float[] numbers(String input){String[] p=input.split(",",-1);float[] result=new float[p.length];for(int i=0;i<p.length;i++)result[i]=Float.parseFloat(p[i]);return result;}
    private static Map<Integer,Float> parseTracks(String input){Map<Integer,Float> result=new TreeMap<>();if(input.isEmpty())return result;for(String entry:input.split(",",-1)){String[] p=entry.split(":",-1);if(p.length!=2)throw new IllegalArgumentException("稀疏行列尺寸无效");int index=Integer.parseInt(p[0]);if(result.put(index,Float.parseFloat(p[1]))!=null)throw new IllegalArgumentException("行列尺寸重复");}return result;}
    /** Grow each old region as needed; retain every visible SG2 component and its chosen size. */
    public static MigrationResult fromGrid(StatusBarGridSpec grid){
        if(grid==null)return new MigrationResult(false,null,"原区域布局无效","");List<Cell> cells=new ArrayList<>();Map<Integer,Float> widths=new TreeMap<>();int base=0;
        for(int side=0;side<3;side++){final char region="LCR".charAt(side);List<String> items=new ArrayList<>();for(String id:StatusBarGridSpec.IDS)if(grid.get(id).visible&&grid.get(id).zone.charAt(0)==region)items.add(id);items.sort(Comparator.comparingInt(id->grid.get(id).order));int[] cursor={0,0};
            for(String id:items){StatusBarGridSpec.Item old=grid.get(id);int row=old.zone.charAt(1)=='2'?1:0,span=old.zone.charAt(1)=='S'?2:1,colSpan=id.equals("clock")?2:1,col=span==2?Math.max(cursor[0],cursor[1]):cursor[row];
                Cell cell=new Cell(row,base+col,span,colSpan,id,old.size,0,0,0,0,side==0?"left":side==2?"right":"center","","");cells.add(cell);
                float desired=id.equals("clock")?old.size*5:isText(id)?old.size*(id.equals("current")?5:4):old.size*(id.equals("system_icons")||id.equals("notifications")?3:1);
                for(int c=cell.col;c<cell.col+colSpan;c++)widths.put(c,Math.max(widths.getOrDefault(c,18f),(float)Math.ceil(desired/colSpan)));
                if(span==2)cursor[0]=cursor[1]=col+colSpan;else cursor[row]=col+colSpan;
            }base+=Math.max(4,Math.max(cursor[0],cursor[1]));
        }
        StatusBarSheetSpec result=new StatusBarSheetSpec(2,base,15,18,Collections.emptyMap(),widths,2,2,cells,1,0,0,"manual");
        return new MigrationResult(true,result,"","原区域内容、大小和上下排已保留；画布可继续扩展，超出固定状态栏纸张的部分会裁切。请按需要调整输出缩放与位置。");
    }
    public static final class Cell {
        public final int row,col,rowSpan,colSpan;public final String content,align,text,image;public final float size,paddingX,paddingY,offsetX,offsetY;
        public Cell(int row,int col,int rowSpan,int colSpan,String content,float size,float paddingX,float paddingY,float offsetX,float offsetY,String align,String text,String image){
            if(row<0||col<0||rowSpan<1||colSpan<1||(long)row+rowSpan>Integer.MAX_VALUE||(long)col+colSpan>Integer.MAX_VALUE)throw new IllegalArgumentException("单元格坐标或合并范围超出整数范围");
            if(content==null||!content.isEmpty()&&!CONTENTS.contains(content))throw new IllegalArgumentException("单元格内容类型无效");positive(size,"内容大小");nonnegative(paddingX,"左右内边距");nonnegative(paddingY,"上下内边距");finite(offsetX,"水平偏移");finite(offsetY,"垂直偏移");
            if(!Arrays.asList("left","center","right").contains(align))throw new IllegalArgumentException("对齐方式无效");
            if(text==null||text.indexOf('\0')>=0||!new String(text.getBytes(StandardCharsets.UTF_8),StandardCharsets.UTF_8).equals(text))throw new IllegalArgumentException("自定义文字编码无效");
            if(image==null||!image.isEmpty()&&!image.matches("[0-9a-f]{64}"))throw new IllegalArgumentException("图片须引用已导入素材的 SHA-256，不能使用路径或内嵌图片");
            this.row=row;this.col=col;this.rowSpan=rowSpan;this.colSpan=colSpan;this.content=content;this.size=size;this.paddingX=paddingX;this.paddingY=paddingY;this.offsetX=offsetX;this.offsetY=offsetY;this.align=align;this.text=text;this.image=image;
        }
        public long endRow(){return (long)row+rowSpan;}public long endCol(){return (long)col+colSpan;}
        public String address(){return StatusBarSheetSpec.address(row,col);}public boolean covers(int r,int c){return r>=row&&r<endRow()&&c>=col&&c<endCol();}
        public static Cell empty(int row,int col){return new Cell(row,col,1,1,"",14,0,0,0,0,"center","","");}
        public Cell withContent(String content){return new Cell(row,col,rowSpan,colSpan,content,size,paddingX,paddingY,offsetX,offsetY,align,text,image);}
        public Cell withSize(float size){return new Cell(row,col,rowSpan,colSpan,content,size,paddingX,paddingY,offsetX,offsetY,align,text,image);}
        public Cell withSpan(int rowSpan,int colSpan){return new Cell(row,col,rowSpan,colSpan,content,size,paddingX,paddingY,offsetX,offsetY,align,text,image);}
        public Cell at(int row,int col){return new Cell(row,col,rowSpan,colSpan,content,size,paddingX,paddingY,offsetX,offsetY,align,text,image);}
    }
    public static final class ParseResult {public final boolean valid;public final StatusBarSheetSpec spec;public final String error;private ParseResult(boolean valid,StatusBarSheetSpec spec,String error){this.valid=valid;this.spec=spec;this.error=error;}}
    public static final class MigrationResult {public final boolean valid;public final StatusBarSheetSpec spec;public final String error,warning;private MigrationResult(boolean valid,StatusBarSheetSpec spec,String error,String warning){this.valid=valid;this.spec=spec;this.error=error;this.warning=warning;}}
}
