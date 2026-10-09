package ls.augment.com;

import java.util.*;

/** Immutable circle geometry. Coordinates are final local pixels, never frame ink. */
public final class CircleConnectivityPlan {
    /** Extra native Wi-Fi ink in its unscaled local glyph coordinates. */
    public static final float WIFI_CONTRAST_INSET=1.5f;
    public interface Edges { StatusBarIconSpacingSpec.Insets get(String semantic); }
    /** Optional union of decoded full canvases after their existing binding transforms. */
    public interface Footprints { Box get(int region,String semantic,Box originalGlyph); }
    public static final class Box {
        public final float left,top,right,bottom;
        public Box(float l,float t,float r,float b){left=l;top=t;right=r;bottom=b;}
        public float width(){return right-left;}
        public float height(){return bottom-top;}
        public Box offset(float x,float y){return new Box(left+x,top+y,right+x,bottom+y);}
        public Box union(Box b){return new Box(Math.min(left,b.left),Math.min(top,b.top),Math.max(right,b.right),Math.max(bottom,b.bottom));}
        public boolean valid(){return Float.isFinite(left)&&Float.isFinite(top)&&Float.isFinite(right)&&Float.isFinite(bottom)&&right>left&&bottom>top;}
        public boolean intersects(Box b){return Math.min(right,b.right)>Math.max(left,b.left)+.0001f&&Math.min(bottom,b.bottom)>Math.max(top,b.top)+.0001f;}
    }
    public static final class Cell {
        public final int region,slot;
        public final String semantic;
        public final Box originalGlyph,glyph,footprint,cell;
        public final float dx,dy;
        public final boolean spaced;
        Cell(int region,int slot,String id,Box glyph,Box ink,StatusBarIconSpacingSpec.Insets e,float density,boolean rtl){
            this.region=region;this.slot=slot;semantic=id;originalGlyph=glyph;
            dx=e.left(rtl)*density;dy=e.top*density;this.glyph=glyph.offset(dx,dy);
            footprint=ink.offset(dx,dy);
            cell=new Box(ink.left,ink.top,ink.right+e.horizontal()*density,ink.bottom+e.vertical()*density);
            spaced=!e.isZero();
        }
    }
    public final boolean accepted,hasSpacing,wholeCovered;
    public final String reason,geometryKey;
    public final float diameterPx,density,originX,originY,width,height,signalGap;
    public final Box outerBounds;
    public final List<Cell> cells;
    public final Measured measured;
    private CircleConnectivityPlan(boolean ok,String why,boolean changed,boolean whole,float d,float density,
            Box box,float gap,List<Cell> cells,String key){this(ok,why,changed,whole,d,density,box,gap,cells,key,null);}
    private CircleConnectivityPlan(boolean ok,String why,boolean changed,boolean whole,float d,float density,
            Box box,float gap,List<Cell> cells,String key,Measured measured){
        this.measured=measured;accepted=ok;reason=why;hasSpacing=changed;wholeCovered=whole;diameterPx=d;this.density=density;
        outerBounds=box;originX=-box.left;originY=-box.top;width=box.width();height=box.height();signalGap=gap;
        this.cells=Collections.unmodifiableList(new ArrayList<>(cells));geometryKey=key;
    }
    public Cell cell(int region,int slot){for(Cell c:cells)if(c.region==region&&c.slot==slot)return c;return null;}
    public boolean matches(float diameter,ConnectivityIconState state,String[] contents,int[] scales,float stroke,ConnectivityIconLayout layout){
        return matches(diameter,state,contents,scales,stroke,layout,true);
    }
    public boolean matches(float diameter,ConnectivityIconState state,String[] contents,int[] scales,float stroke,ConnectivityIconLayout layout,boolean wifiContrast){
        return geometryKey.equals(key(diameter,state,contents,scales,stroke,layout)+"/wifiOutline="+(wifiContrast?WIFI_CONTRAST_INSET:0));
    }
    public static CircleConnectivityPlan create(float diameter,float density,ConnectivityIconState state,String[] contents,
            int[] scales,float stroke,ConnectivityIconLayout layout,Edges edges,boolean rtl,List<Box> stationary,
            Footprints artwork,float maxWidth,float maxHeight,boolean ringArtwork,boolean wholeCovered){
        return create(diameter,density,state,contents,scales,stroke,layout,edges,rtl,stationary,artwork,maxWidth,maxHeight,ringArtwork,wholeCovered,id->true);
    }
    /** Eligibility removes a cell without reindexing other native SIM anchors. */
    public static CircleConnectivityPlan create(float diameter,float density,ConnectivityIconState state,String[] contents,
            int[] scales,float stroke,ConnectivityIconLayout layout,Edges edges,boolean rtl,List<Box> stationary,
            Footprints artwork,float maxWidth,float maxHeight,boolean ringArtwork,boolean wholeCovered,java.util.function.Predicate<String> shown){
        return create(diameter,density,state,contents,scales,stroke,layout,edges,rtl,stationary,artwork,maxWidth,maxHeight,ringArtwork,wholeCovered,shown,true);
    }
    public static CircleConnectivityPlan create(float diameter,float density,ConnectivityIconState state,String[] contents,
            int[] scales,float stroke,ConnectivityIconLayout layout,Edges edges,boolean rtl,List<Box> stationary,
            Footprints artwork,float maxWidth,float maxHeight,boolean ringArtwork,boolean wholeCovered,java.util.function.Predicate<String> shown,boolean wifiContrast){
        if(!Float.isFinite(diameter)||diameter<=0||!Float.isFinite(density)||density<=0||state==null||layout==null
                ||!Float.isFinite(stroke)||!Float.isFinite(maxWidth)||!Float.isFinite(maxHeight)||maxWidth<=0||maxHeight<=0)
            throw new IllegalArgumentException("Invalid measured circle inputs");
        String key=key(diameter,state,contents,scales,stroke,layout)+"/wifiOutline="+(wifiContrast?WIFI_CONTRAST_INSET:0);
        boolean ringShown=shown.test("battery.shell")||shown.test("battery.fill");
        float u=diameter/100f,gap=ConnectivityIconLayout.signalGap(state,contents,scales,stroke,layout);
        Box outer=new Box(0,0,diameter,diameter);List<Cell> cells=new ArrayList<>();
        if(wholeCovered)return new Measured(diameter,density,stroke,gap,rtl,ringArtwork,true,ringShown,cells,stationary,key).solve(edges,maxWidth,maxHeight);
        for(int region=0;region<3;region++){
            String content=ConnectivityIconLayout.content(contents,region);float scale=ConnectivityIconLayout.contentScale(scales,region);
            if(content.equals("wifi")&&state.wifiKnown&&shown.test("wifi.signal")){
                float fit=ConnectivityIconLayout.contentFit(content,region,scale),cy=region==0?23:region==1?49:73;
                Box glyph=px(new Box(50+layout.x[region]-24*fit,cy+layout.y[region]-13*fit,
                        50+layout.x[region]+24*fit,cy+layout.y[region]+14*fit),u);
                // The legacy artwork canvas is shorter than the outer arc's
                // round stroke and (when disconnected) the slash's round cap.
                float outline=wifiContrast?WIFI_CONTRAST_INSET:0;
                Box nativeInk=px(new Box(50+layout.x[region]-(24+outline)*fit,cy+layout.y[region]-(15+outline)*fit,
                        50+layout.x[region]+(24+outline)*fit,cy+layout.y[region]+((state.wifiConnected?14:15.5f)+outline)*fit),u);
                cells.add(cell(region,-1,"wifi.signal",glyph,nativeInk,null,density,rtl,artwork));
            }else if(content.equals("dual")||content.equals("data")||content.equals("other")){
                int first=content.equals("other")?state.otherDataRow():content.equals("data")?state.activeDataRow():0;
                int count=content.equals("dual")?state.sims.size():first>=0&&first<state.sims.size()?1:0;
                Set<Integer> selectedSlots=new HashSet<>();
                for(int row=0;row<count;row++){
                    int sim=first+row,slot=state.sims.get(sim).slot;
                    if(slot<0||slot>1)return reject("slot_unknown",diameter,density,outer,gap,cells,key);
                    if(!selectedSlots.add(slot))return reject("slot_ambiguous",diameter,density,outer,gap,cells,key);
                    float[] b=ConnectivityIconLayout.signalBox(state,region,row,sim,count,scale);
                    Box glyph=px(new Box(b[0]+layout.x[region],b[1]+layout.y[region],b[2]+layout.x[region],b[3]+layout.y[region]),u);
                    String id="mobile"+(slot+1)+".signal";
                    if(shown.test(id))cells.add(cell(region,slot,id,glyph,glyph,null,density,rtl,artwork));
                }
            }
        }
        return new Measured(diameter,density,stroke,gap,rtl,ringArtwork,wholeCovered,ringShown,cells,stationary,key).solve(edges,maxWidth,maxHeight);
    }
    private static CircleConnectivityPlan solveMeasured(Measured measured,Edges edges,float maxWidth,float maxHeight){
        float diameter=measured.diameter,density=measured.density,stroke=measured.stroke,gap=measured.gap,u=measured.diameter/100f;
        boolean rtl=measured.rtl,ringArtwork=measured.ringArtwork;
        String key=measured.geometryKey;List<Box> stationary=measured.stationary;
        Box outer=new Box(0,0,diameter,diameter);List<Cell> cells=new ArrayList<>();
        if(measured.wholeCovered)return new CircleConnectivityPlan(false,"whole_covered",false,true,diameter,density,outer,gap,cells,key);
        for(Seed seed:measured.seeds){StatusBarIconSpacingSpec.Insets edge=edges==null?StatusBarIconSpacingSpec.ZERO:edges.get(seed.semantic());
            cells.add(new Cell(seed.region,seed.slot,seed.semantic(),seed.glyph,seed.footprint,edge==null?StatusBarIconSpacingSpec.ZERO:edge,density,rtl));}
        boolean changed=false,lowerChanged=false;
        for(Cell c:cells){changed|=c.spaced;lowerChanged|=c.spaced&&c.region==2&&c.slot>=0;outer=outer.union(c.cell);}
        // Zero is a strict compatibility path, including a user's pre-existing offsets.
        if(!changed)return new CircleConnectivityPlan(true,"legacy_zero",false,false,diameter,density,new Box(0,0,diameter,diameter),gap,cells,key);
        if(stationary==null)return reject("unmeasured_stationary",diameter,density,outer,gap,cells,key);
        for(Box b:stationary){if(b==null||!b.valid())return reject("invalid_stationary",diameter,density,outer,gap,cells,key);outer=outer.union(b);}
        for(int i=0;i<cells.size();i++){
            Cell c=cells.get(i);
            for(int j=i+1;j<cells.size();j++)if((c.spaced||cells.get(j).spaced)&&c.cell.intersects(cells.get(j).cell))
                return reject("cell_overlap",diameter,density,outer,gap,cells,key);
            if(c.spaced)for(Box b:stationary)if(c.cell.intersects(b))return reject("stationary_overlap",diameter,density,outer,gap,cells,key);
            if(measured.ringShown&&c.spaced&&(c.region!=2||c.slot<0)&&hitsRing(c.cell,diameter,stroke))
                return reject("nonlower_ring_overlap",diameter,density,outer,gap,cells,key);
        }
        if(lowerChanged&&measured.ringShown){
            float needed=0;
            for(Cell c:cells)if(c.region==2&&c.slot>=0&&hitsRing(c.cell,diameter,stroke)){
                float padding=(Math.max(3,Math.min(10,stroke))/2+1.1f)*u;
                Box b=new Box(c.cell.left-padding,c.cell.top-padding,c.cell.right+padding,c.cell.bottom+padding);
                if(b.top<=diameter/2)return reject("ring_interval_unsupported",diameter,density,outer,gap,cells,key);
                float angle=(float)Math.toDegrees(Math.atan2(Math.max(Math.abs(b.left-diameter/2),Math.abs(b.right-diameter/2)),b.top-diameter/2));
                needed=Math.max(needed,angle);
            }
            if(!Float.isFinite(needed)||needed>=90)return reject("ring_interval_unsupported",diameter,density,outer,gap,cells,key);
            if(ringArtwork&&Math.abs(needed-gap)>.0001f)return reject("ring_material_gap",diameter,density,outer,gap,cells,key);
            gap=needed;
        }
        outer=new Box((float)Math.floor(outer.left),(float)Math.floor(outer.top),(float)Math.ceil(outer.right),(float)Math.ceil(outer.bottom));
        if(outer.width()>maxWidth+.0001f||outer.height()>maxHeight+.0001f)return reject("capacity",diameter,density,outer,gap,cells,key);
        return new CircleConnectivityPlan(true,"ok",true,false,diameter,density,outer,gap,cells,key);
    }
    /** Android/font/resource measurement is complete before this immutable DTO is created. */
    public static final class Seed {
        public final int region,slot;public final Box glyph,footprint;
        public Seed(int region,int slot,Box glyph,Box footprint){
            if(region<0||region>2||slot< -1||slot>1||glyph==null||footprint==null||!glyph.valid()||!footprint.valid())throw new IllegalArgumentException("Invalid measured cell");
            this.region=region;this.slot=slot;this.glyph=glyph;this.footprint=footprint;}
        public String semantic(){return slot<0?"wifi.signal":"mobile"+(slot+1)+".signal";}
    }
    public static final class Measured {
        public final float diameter,density,stroke,gap;public final boolean rtl,ringArtwork,wholeCovered,ringShown;
        public final List<Seed> seeds;public final List<Box> stationary;public final String geometryKey;
        private Measured(float d,float density,float stroke,float gap,boolean rtl,boolean ring,boolean whole,boolean ringShown,List<Cell> cells,List<Box> stationary,String key){
            this(d,density,stroke,gap,rtl,ring,whole,ringShown,toSeeds(cells),stationary,key);}
        public Measured(float d,float density,float stroke,float gap,boolean rtl,boolean ring,boolean whole,boolean ringShown,Collection<Seed> seeds,List<Box> stationary,String key){
            if(!Float.isFinite(d)||d<=0||d>4096||!Float.isFinite(density)||density<=0||density>100||!Float.isFinite(stroke)||stroke<0||stroke>100||!Float.isFinite(gap)||gap<0||gap>180||seeds==null||seeds.size()>6||stationary!=null&&stationary.size()>6||key==null)throw new IllegalArgumentException("Invalid measured circle");
            Set<String> seen=new HashSet<>();for(Seed seed:seeds)if(seed==null||!seen.add(seed.region+":"+seed.slot))throw new IllegalArgumentException("Duplicate measured cell");
            if(stationary!=null)for(Box box:stationary)if(box==null||!box.valid())throw new IllegalArgumentException("Invalid measured blocker");
            diameter=d;this.density=density;this.stroke=stroke;this.gap=gap;this.rtl=rtl;ringArtwork=ring;wholeCovered=whole;this.ringShown=ringShown;
            this.seeds=Collections.unmodifiableList(new ArrayList<>(seeds));this.stationary=stationary==null?null:Collections.unmodifiableList(new ArrayList<>(stationary));geometryKey=key;
        }
        private static List<Seed> toSeeds(List<Cell> cells){List<Seed> result=new ArrayList<>();for(Cell c:cells)result.add(new Seed(c.region,c.slot,c.originalGlyph,c.footprint.offset(-c.dx,-c.dy)));return result;}
        public CircleConnectivityPlan solve(Edges edges,float maxWidth,float maxHeight){
            if(!Float.isFinite(maxWidth)||!Float.isFinite(maxHeight)||maxWidth<=0||maxHeight<=0)throw new IllegalArgumentException("Invalid capacity");
            CircleConnectivityPlan p=solveMeasured(this,edges,maxWidth,maxHeight);
            return new CircleConnectivityPlan(p.accepted,p.reason,p.hasSpacing,p.wholeCovered,p.diameterPx,p.density,p.outerBounds,p.signalGap,p.cells,p.geometryKey,this);
        }
    }
    private static Cell cell(int region,int slot,String id,Box glyph,Box nativeInk,Edges edges,float density,boolean rtl,Footprints artwork){
        StatusBarIconSpacingSpec.Insets e=edges==null?StatusBarIconSpacingSpec.ZERO:edges.get(id);if(e==null)e=StatusBarIconSpacingSpec.ZERO;
        Box footprint=artwork==null?glyph:artwork.get(region,id,glyph);
        if(footprint==null||!footprint.valid())throw new IllegalArgumentException("Unmeasured current artwork canvas");
        return new Cell(region,slot,id,glyph,glyph.union(nativeInk).union(footprint),e,density,rtl);
    }
    private static CircleConnectivityPlan reject(String reason,float d,float density,Box box,float gap,List<Cell> cells,String key){
        return new CircleConnectivityPlan(false,reason,true,false,d,density,box,gap,cells,key);
    }
    private static Box px(Box b,float u){return new Box(b.left*u,b.top*u,b.right*u,b.bottom*u);}
    private static boolean hitsRing(Box b,float d,float stroke){
        float x=d/2,y=d/2,r=43*d/100f,p=(Math.max(3,Math.min(10,stroke))/2+1.1f)*d/100f;
        float nearX=Math.max(b.left,Math.min(x,b.right)),nearY=Math.max(b.top,Math.min(y,b.bottom));
        float near=(float)Math.hypot(nearX-x,nearY-y),far=0;
        for(float a:new float[]{b.left,b.right})for(float z:new float[]{b.top,b.bottom})far=Math.max(far,(float)Math.hypot(a-x,z-y));
        return near<=r+p&&far>=r-p;
    }
    private static String key(float diameter,ConnectivityIconState s,String[] contents,int[] scales,float stroke,ConnectivityIconLayout layout){
        StringBuilder b=new StringBuilder().append(diameter).append('/').append(stroke).append('/').append(s.wifiKnown).append('/').append(s.wifiConnected)
                .append('/').append(s.battery).append('/').append(s.charging).append('/').append(s.bypassCharging)
                .append('/').append(s.activeDataSubscription).append('/').append(s.defaultDataSubscription);
        for(int i=0;i<3;i++)b.append('/').append(ConnectivityIconLayout.content(contents,i)).append(':').append(ConnectivityIconLayout.contentScale(scales,i)).append(':').append(layout.x[i]).append(':').append(layout.y[i]);
        for(int i=0;i<2;i++)b.append('/').append(layout.powerX[i]).append(':').append(layout.powerY[i]).append(':').append(layout.powerScale[i]);
        for(ConnectivityIconState.Sim sim:s.sims)b.append('/').append(sim.subscriptionId).append(':').append(sim.slot).append(':').append(sim.bars);
        return b.toString();
    }
}
