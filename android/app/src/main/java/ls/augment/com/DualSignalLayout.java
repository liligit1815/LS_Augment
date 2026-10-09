package ls.augment.com;

/** Fixed reference ink box, including single-SIM mode. */
public final class DualSignalLayout {
    public final float width,height;
    public final float labelWidth,signalX;
    /** Glyph height remains the original 85-unit reference even when cells grow. */
    public final float referenceHeight;
    public final Plan plan;
    public final boolean activity;
    public DualSignalLayout(float height,boolean activity){
        this(height,activity,0);
    }
    public DualSignalLayout(float height,boolean activity,float typeAspect){
        this.height=height;this.referenceHeight=height;this.activity=activity;this.plan=null;
        labelWidth=typeAspect>0?height*37f/85f*Math.min(3,Math.max(.5f,typeAspect)):0;
        signalX=labelWidth>0?labelWidth+height*5f/85f:0;
        width=signalX+height*108f/85f;
    }
    private DualSignalLayout(DualSignalLayout original,Plan plan){
        referenceHeight=original.height;activity=original.activity;
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
        DualSignalLayout original=new DualSignalLayout(height,activity,max);
        float u=height/85f,labelColumn=original.labelWidth;
        float[][] widths=new float[slots.length][3];
        float[] fits=new float[slots.length],badgeCells=new float[slots.length],rowHeights=new float[slots.length];
        StatusBarIconSpacingSpec.Insets[][] b=new StatusBarIconSpacingSpec.Insets[slots.length][3];
        StatusBarIconSpacingSpec.Insets[] s=new StatusBarIconSpacingSpec.Insets[slots.length],a=new StatusBarIconSpacingSpec.Insets[slots.length];
        boolean changed=false;
        float extraActivityColumn=0;
        for(int r=0;r<slots.length;r++){
            s[r]=edge(edges,slots[r],"signal");
            a[r]=activity&&r==activityRow?edge(edges,slots[r],"activity_inout"):StatusBarIconSpacingSpec.ZERO;
            changed|=!s[r].isZero()||!a[r].isZero();
            fits[r]=total[r]>0?Math.min(37*u,original.labelWidth/total[r]):0;
            rowHeights[r]=40*u+s[r].vertical()*dpToLocal;
            for(int i=0;i<3;i++){
                b[r][i]=aspects[r][i]>0?edge(edges,slots[r],BADGES[i]):StatusBarIconSpacingSpec.ZERO;
                changed|=!b[r][i].isZero();
                if(aspects[r][i]<=0)continue;
                if(badgeCells[r]>0)badgeCells[r]+=.12f*fits[r];
                widths[r][i]=aspects[r][i]*fits[r];
                badgeCells[r]+=widths[r][i]+b[r][i].horizontal()*dpToLocal;
                rowHeights[r]=Math.max(rowHeights[r],40*u+b[r][i].vertical()*dpToLocal);
            }
            labelColumn=Math.max(labelColumn,badgeCells[r]);
            // Zero keeps the OEM inset-arrow relationship. An explicit nonzero
            // arrow boundary creates a separate full-canvas cell, never shrinking
            // arrows or using their transparent corners as space for another icon.
            if(!a[r].isZero()){
                extraActivityColumn=Math.max(extraActivityColumn,31*u+a[r].horizontal()*dpToLocal+5*u);
                rowHeights[r]=Math.max(rowHeights[r],21*u+a[r].vertical()*dpToLocal);
            }
        }
        Row[] result=new Row[slots.length];
        float signalCellX=(labelColumn>0?labelColumn+5*u:0)+extraActivityColumn;
        float y=slots.length==1?45*u:0,width=original.width;
        for(int r=0;r<slots.length;r++){
            Box signal=new Box(signalCellX+s[r].left(rtl)*dpToLocal,y+s[r].top*dpToLocal,107*u,40*u);
            Box arrow;
            if(a[r].isZero())arrow=new Box(signal.x,signal.y-u,31*u,21*u);
            else arrow=new Box(signalCellX-extraActivityColumn+a[r].left(rtl)*dpToLocal,y+a[r].top*dpToLocal,31*u,21*u);
            Box[] badges=new Box[3];float x=labelColumn-badgeCells[r];
            for(int i=0;i<3;i++){
                if(aspects[r][i]<=0)continue;
                badges[i]=new Box(x+b[r][i].left(rtl)*dpToLocal,y+3*u+b[r][i].top*dpToLocal,widths[r][i],37*u);
                x+=widths[r][i]+b[r][i].horizontal()*dpToLocal+.12f*fits[r];
            }
            result[r]=new Row(slots[r],signal,arrow,badges);
            width=Math.max(width,signalCellX+108*u+s[r].horizontal()*dpToLocal);
            y+=rowHeights[r]+(r+1<slots.length?5*u:0);
        }
        return new DualSignalLayout(original,new Plan(result,width,y,changed));
    }
    private static StatusBarIconSpacingSpec.Insets edge(Edges edges,int slot,String part){
        StatusBarIconSpacingSpec.Insets value=edges==null?null:edges.get(slot,part);
        return value==null?StatusBarIconSpacingSpec.ZERO:value;
    }
}
