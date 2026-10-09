package ls.augment.com;

/** Header rows at their requested sizes. No scale or clipping escape hatch. */
public final class HeaderClockGeometry {
    private HeaderClockGeometry() { }
    public static final class Plan {
        public final boolean valid,stacked,splitFooter;
        public final int clockTop,dateTop,footerTop,bottom,maximumIconBottom;
        Plan(boolean valid,boolean stacked,boolean split,int clock,int date,int footer,int bottom,int maximumIconBottom){
            this.valid=valid;this.stacked=stacked;splitFooter=split;clockTop=clock;dateTop=date;footerTop=footer;this.bottom=bottom;
            this.maximumIconBottom=maximumIconBottom;
        }
    }
    public static Plan place(int width,int limit,int originalTop,int iconBottom,int accessoryBottom,
            int iconWidth,int clockWidth,int clockHeight,int dateWidth,int dateHeight,
            int footerWidth,int footerHeight,int gap,int dateGap,int belowHeight,boolean forceStack){
        if(width<=0||limit<=0||clockWidth>width||dateWidth>width||iconWidth>width||footerWidth>width
                ||clockHeight<=0||dateHeight<=0)return new Plan(false,true,false,0,0,0,0,-1);
        boolean stacked=forceStack||(long)clockWidth+iconWidth+gap>width;
        int top=Math.max(originalTop,accessoryBottom>0?accessoryBottom+gap:0);
        if(stacked)top=Math.max(top,iconBottom+gap);
        int date=Math.max(top+clockHeight+dateGap,iconBottom+gap);
        boolean split=footerWidth>0&&(long)dateWidth+footerWidth+gap>width;
        int footer=split?date+dateHeight+gap:date;
        int bottom=Math.max(date+dateHeight,footer+footerHeight)+Math.max(0,belowHeight);
        // An absolute viewport budget, independent of the currently enlarged row.
        // Reserve a complete stacked clock at its requested font even when this
        // frame can use a single row. Increasing spacing cannot fund itself.
        int tail=gap+clockHeight+dateGap+(split?dateHeight+gap+footerHeight:Math.max(dateHeight,footerHeight))+Math.max(0,belowHeight);
        return new Plan(bottom<=limit,stacked,split,top,date,footer,bottom,Math.max(0,limit-tail));
    }
}
