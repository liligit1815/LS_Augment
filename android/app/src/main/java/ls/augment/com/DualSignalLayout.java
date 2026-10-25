package ls.augment.com;

/** Fixed two-row reference, with a genuinely compact single-row plan for one visible SIM. */
public final class DualSignalLayout {
    public final float width,height;
    public final float labelWidth,signalX;
    /** Glyph scale stays fixed when independently configured cell margins grow. */
    public final float referenceHeight;
    /** PNG rows use their own ink dimensions, rather than the wide Honor bar cell. */
    public final boolean ios;
    public final float referenceUnits,rowUnits,signalUnits,badgeUnits,badgeTop,gapUnits;
    private final boolean single;
    public final Plan plan;
    public final boolean activity;
    public DualSignalLayout(float height,boolean activity){
        this(height,activity,0);
    }
    public DualSignalLayout(float height,boolean activity,float typeAspect){
        this(height,activity,typeAspect,false,false);
    }
    private DualSignalLayout(float height,boolean activity,float typeAspect,boolean single,boolean ios){
        this.ios=ios;this.single=single;
        referenceUnits=ios?37:75;rowUnits=ios?(single?42:17.5f):35;signalUnits=ios?47:85;
        badgeUnits=ios?(single?37:16):32;badgeTop=ios?(single?3:.75f):1.5f;gapUnits=ios?2:5;
        this.height=height;this.referenceHeight=single?height*referenceUnits/rowUnits:height;this.activity=activity;this.plan=null;
        float u=unit();
        labelWidth=typeAspect>0?badgeUnits*u*Math.min(3,Math.max(.5f,typeAspect)):0;
        signalX=(labelWidth>0?labelWidth+badgeGap()*u:0)+(ios&&activity?(activityWidth()+activityGap())*u:0);
        width=signalX+(signalUnits+1)*u;
    }
    public static DualSignalLayout single(float height,boolean activity,float typeAspect){
        return new DualSignalLayout(height,activity,typeAspect,true,false);
    }
    public static DualSignalLayout ios(float height,boolean activity,float typeAspect){return new DualSignalLayout(height,activity,typeAspect,false,true);}
    public static DualSignalLayout iosSingle(float height,boolean activity,float typeAspect){return new DualSignalLayout(height,activity,typeAspect,true,true);}
    public float unit(){return referenceHeight/referenceUnits;}
    /** The compact iOS artwork has a tall upper SIM and a short lower dot row. */
    public float signalTop(int row){return ios&&!single&&row==1?28:row*(rowUnits+gapUnits);}
    public float signalHeight(int row){return ios&&!single?(row==0?26:9):rowUnits;}
    // Traffic keeps a stable, compact column as packets arrive. Honor's inset
    // arrows clear the first two low bars without widening the signal glyph.
    public float activityHeight(){return Math.min(ios&&single?21:14,rowUnits);}
    public float activityWidth(){return 31*activityHeight()/21;}
    public float badgeGap(){return ios?2:5;}
    public float activityGap(){return ios?2:5;}
    private DualSignalLayout(DualSignalLayout original,Plan plan){
        ios=original.ios;single=original.single;referenceUnits=original.referenceUnits;rowUnits=original.rowUnits;signalUnits=original.signalUnits;
        badgeUnits=original.badgeUnits;badgeTop=original.badgeTop;gapUnits=original.gapUnits;
        referenceHeight=original.referenceHeight;activity=original.activity;
        labelWidth=original.labelWidth;signalX=original.signalX;
        this.plan=plan;width=plan.width;height=plan.height;
    }
    public interface Edges { StatusBarIconSpacingSpec.Insets get(int physicalSlot,String part); }
    public static final class Box {
        public final float x,y,width,height;
        Box(float x,float y,float w,float h){this.x=x;this.y=y;width=w;height=h;}
        public Box offset(float dx,float dy){return new Box(x+dx,y+dy,width,height);}
    }
    public static final class Row {
        public final int slot;
        public final Box signal,activity;
        public final Box[] badges;
        Row(int slot,Box signal,Box activity,Box[] badges){this.slot=slot;this.signal=signal;this.activity=activity;this.badges=badges;}
    }
    public static final class Plan {
        public final Row[] rows;
        public final float width,height;
        public final boolean hasSpacing;
        Plan(Row[] rows,float width,float height,boolean changed){this.rows=rows;this.width=width;this.height=height;hasSpacing=changed;}
    }
    private static final String[] BADGES={"type","roaming","volte"};
    /** dpToLocal already compensates the grid's later fixed glyph transform. */
    public static DualSignalLayout spaced(float height,boolean activity,int[] slots,
            float[][] aspects,int activityRow,Edges edges,float dpToLocal,boolean rtl){
        return spaced(height,activity,slots,aspects,activityRow,edges,dpToLocal,rtl,false);
    }
    public static DualSignalLayout spaced(float height,boolean activity,int[] slots,
            float[][] aspects,int activityRow,Edges edges,float dpToLocal,boolean rtl,boolean ios){
        if(slots==null||slots.length<1||slots.length>2||aspects==null||aspects.length!=slots.length
                ||!Float.isFinite(height)||height<=0||!Float.isFinite(dpToLocal)||dpToLocal<=0)
            throw new IllegalArgumentException("invalid dual-signal geometry");
        float[] total=new float[slots.length];
        float max=0;
        for(int r=0;r<slots.length;r++){
            if(slots[r]<0||slots[r]>1||aspects[r].length!=3||r>0&&slots[r]==slots[r-1])
                throw new IllegalArgumentException("invalid physical SIM slot");
            for(float a:aspects[r]){if(!Float.isFinite(a)||a<0)throw new IllegalArgumentException("invalid badge aspect");if(a>0)total[r]+=a+(total[r]>0?.12f:0);}
            max=Math.max(max,total[r]);
        }
        DualSignalLayout original=ios?(slots.length==1?iosSingle(height,activity,max):ios(height,activity,max))
                :slots.length==1?single(height,activity,max):new DualSignalLayout(height,activity,max);
        float u=original.unit(),labelColumn=original.labelWidth,badgeHeight=original.badgeUnits*u;
        float[][] widths=new float[slots.length][3];
        float[] badgeCells=new float[slots.length],rowHeights=new float[slots.length];
        StatusBarIconSpacingSpec.Insets[][] b=new StatusBarIconSpacingSpec.Insets[slots.length][3];
        StatusBarIconSpacingSpec.Insets[] s=new StatusBarIconSpacingSpec.Insets[slots.length],a=new StatusBarIconSpacingSpec.Insets[slots.length];
        boolean changed=false;
        // The original arrows fit in Honor's wide low bars. A narrower PNG needs
        // its own column so activity never paints over a signal-strength column.
        float arrowHeight=original.activityHeight()*u,arrowWidth=original.activityWidth()*u;
        float extraActivityColumn=ios&&activity?arrowWidth+original.activityGap()*u:0;
        for(int r=0;r<slots.length;r++){
            s[r]=edge(edges,slots[r],"signal");
            a[r]=activity&&r==activityRow?edge(edges,slots[r],"activity_inout"):StatusBarIconSpacingSpec.ZERO;
            changed|=!s[r].isZero()||!a[r].isZero();
            // OEM badges are cropped to their ink before measuring. Keep that
            // ink at one height in both rows, independent of HD/roaming badges.
            // Grow the measured column; the host's existing capacity check owns
            // overflow fallback, rather than shrinking an individual SIM row.
            rowHeights[r]=original.rowUnits*u+s[r].vertical()*dpToLocal;
            for(int i=0;i<3;i++){
                b[r][i]=aspects[r][i]>0?edge(edges,slots[r],BADGES[i]):StatusBarIconSpacingSpec.ZERO;
                changed|=!b[r][i].isZero();
                if(aspects[r][i]<=0)continue;
                if(badgeCells[r]>0)badgeCells[r]+=.12f*badgeHeight;
                widths[r][i]=aspects[r][i]*badgeHeight;
                badgeCells[r]+=widths[r][i]+b[r][i].horizontal()*dpToLocal;
                rowHeights[r]=Math.max(rowHeights[r],original.rowUnits*u+b[r][i].vertical()*dpToLocal);
            }
            labelColumn=Math.max(labelColumn,badgeCells[r]);
            // Zero keeps the OEM inset-arrow relationship. An explicit nonzero
            // arrow boundary creates a separate full-canvas cell, never shrinking
            // arrows or using their transparent corners as space for another icon.
            if(!a[r].isZero()){
                extraActivityColumn=Math.max(extraActivityColumn,arrowWidth+a[r].horizontal()*dpToLocal+original.activityGap()*u);
                rowHeights[r]=Math.max(rowHeights[r],arrowHeight+a[r].vertical()*dpToLocal);
            }
        }
        Row[] result=new Row[slots.length];
        float signalCellX=(labelColumn>0?labelColumn+original.badgeGap()*u:0)+extraActivityColumn;
        float y=0,width=original.width;
        for(int r=0;r<slots.length;r++){
            float signalOffset=original.signalTop(r)-r*(original.rowUnits+original.gapUnits);
            Box signal=new Box(signalCellX+s[r].left(rtl)*dpToLocal,y+signalOffset*u+s[r].top*dpToLocal,original.signalUnits*u,original.signalHeight(r)*u);
            Box arrow;
            if(a[r].isZero()&&!ios)arrow=new Box(signal.x,signal.y,arrowWidth,arrowHeight);
            else arrow=new Box(signalCellX-extraActivityColumn+a[r].left(rtl)*dpToLocal,y+a[r].top*dpToLocal,arrowWidth,arrowHeight);
            Box[] badges=new Box[3];float x=labelColumn-badgeCells[r];
            for(int i=0;i<3;i++){
                if(aspects[r][i]<=0)continue;
                badges[i]=new Box(x+b[r][i].left(rtl)*dpToLocal,y+original.badgeTop*u+b[r][i].top*dpToLocal,widths[r][i],badgeHeight);
                x+=widths[r][i]+b[r][i].horizontal()*dpToLocal+.12f*badgeHeight;
            }
            result[r]=new Row(slots[r],signal,arrow,badges);
            width=Math.max(width,signalCellX+(original.signalUnits+1)*u+s[r].horizontal()*dpToLocal);
            y+=rowHeights[r]+(r+1<slots.length?original.gapUnits*u:0);
        }
        return new DualSignalLayout(original,new Plan(result,width,y,changed));
    }
    private static StatusBarIconSpacingSpec.Insets edge(Edges edges,int slot,String part){
        StatusBarIconSpacingSpec.Insets value=edges==null?null:edges.get(slot,part);
        return value==null?StatusBarIconSpacingSpec.ZERO:value;
    }
}
