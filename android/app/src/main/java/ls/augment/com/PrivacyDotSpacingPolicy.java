package ls.augment.com;

/** Pixel geometry for the OEM dot's existing FrameLayout. Never enlarges its window. */
public final class PrivacyDotSpacingPolicy {
    public static final class Box {
        public final int left,top,right,bottom;
        public Box(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
        public boolean contains(Box b){return b.left>=left&&b.top>=top&&b.right<=right&&b.bottom<=bottom;}
        public boolean intersects(Box b){return left<b.right&&right>b.left&&top<b.bottom&&bottom>b.top;}
    }
    public interface Safety { boolean contains(Box glyph); }
    public static final class RoundCorner {
        public final int x,y,radius,position;
        public RoundCorner(int x,int y,int radius,int position){this.x=x;this.y=y;this.radius=radius;this.position=position;}
    }
    /** Display/cutout/rounded-corner evidence is copied, never written back into ROM caches. */
    public static final class SafeArea implements Safety {
        private final Box visible;
        private final Box[] cutouts;
        private final RoundCorner[] corners;
        public SafeArea(Box visible,Box[] cutouts,RoundCorner[] corners){this.visible=visible;this.cutouts=cutouts.clone();this.corners=corners.clone();}
        @Override public boolean contains(Box b){
            if(!visible.contains(b))return false;
            for(Box cut:cutouts)if(cut.intersects(b))return false;
            for(RoundCorner c:corners){
                boolean left=c.position==0||c.position==3,top=c.position==0||c.position==1;
                int x=left?b.left:b.right,y=top?b.top:b.bottom;
                if((left?x<c.x:x>c.x)&&(top?y<c.y:y>c.y)){
                    long dx=x-c.x,dy=y-c.y;if(dx*dx+dy*dy>(long)c.radius*c.radius)return false;
                }
            }
            return true;
        }
    }
    public static final class Limits {
        public final boolean available;
        public final int horizontal,vertical;
        Limits(boolean available,int horizontal,int vertical){this.available=available;this.horizontal=horizontal;this.vertical=vertical;}
        public boolean accepts(StatusBarIconSpacingSpec.Insets edge){return available&&edge.horizontal()<=horizontal&&edge.vertical()<=vertical;}
        public int maximum(int edge,int opposite){return Math.max(0,Math.min(StatusBarIconSpacingSpec.MAX_DP,(edge==0||edge==2?horizontal:vertical)-opposite));}
    }
    public final Box content;
    public final int width,height,left,top,right,bottom,horizontalGravity,verticalGravity;
    public final float density;
    private final Safety safety;
    /** Gravity: -1 = left/top, 0 = centre, +1 = right/bottom. Margins are native physical px. */
    public PrivacyDotSpacingPolicy(Box content,int width,int height,int left,int top,int right,int bottom,
                                   int horizontalGravity,int verticalGravity,float density,Safety safety){
        this.content=content;this.width=width;this.height=height;this.left=left;this.top=top;this.right=right;this.bottom=bottom;
        this.horizontalGravity=horizontalGravity;this.verticalGravity=verticalGravity;this.density=density;this.safety=safety;
    }
    private int px(int dp){return Math.round(dp*density);}
    private int x(int extraLeft,int extraRight){
        if(horizontalGravity<0)return content.left+left+extraLeft;
        if(horizontalGravity>0)return content.right-width-right-extraRight;
        // Android FrameLayout centres in the padded parent, then adds the full margin difference.
        return content.left+(content.right-content.left-width)/2+left-right+extraLeft-extraRight;
    }
    private int y(int extraTop,int extraBottom){
        if(verticalGravity<0)return content.top+top+extraTop;
        if(verticalGravity>0)return content.bottom-height-bottom-extraBottom;
        return content.top+(content.bottom-content.top-height)/2+top-bottom+extraTop-extraBottom;
    }
    public Box glyph(StatusBarIconSpacingSpec.Insets edge,boolean rtl){
        int x=x(px(edge.left(rtl)),px(edge.right(rtl))),y=y(px(edge.top),px(edge.bottom));
        return new Box(x,y,x+width,y+height);
    }
    private int largestPixelSum(int total){
        int max=0;for(int first=0;first<=24&&first<=total;first++)max=Math.max(max,px(first)+px(Math.min(24,total-first)));return max;
    }
    private boolean envelopeFits(int h,int v){
        if(largestPixelSum(h)>content.right-content.left-width-left-right||largestPixelSum(v)>content.bottom-content.top-height-top-bottom)return false;
        int dx=px(Math.min(24,h)),dy=px(Math.min(24,v));
        Box envelope=new Box(Math.min(x(dx,0),x(0,dx)),Math.min(y(dy,0),y(0,dy)),
                Math.max(x(dx,0),x(0,dx))+width,Math.max(y(dy,0),y(0,dy))+height);
        return content.contains(envelope)&&safety.contains(envelope);
    }
    /** A conservative rectangle of coupled totals: every combination advertised by the UI fits. */
    public Limits limits(){
        if(width<=0||height<=0||!Float.isFinite(density)||density<=0||left<0||top<0||right<0||bottom<0||!envelopeFits(0,0))return new Limits(false,0,0);
        int bestH=0,bestV=0,bestScore=1;
        for(int h=0;h<=48;h++)for(int v=0;v<=48;v++)if(envelopeFits(h,v)){
            int score=(h+1)*(v+1);if(score>bestScore||score==bestScore&&h+v>bestH+bestV){bestScore=score;bestH=h;bestV=v;}
        }
        return new Limits(true,bestH,bestV);
    }
    public boolean fits(StatusBarIconSpacingSpec.Insets edge,boolean rtl,Limits limits){
        return limits.accepts(edge)&&content.contains(glyph(edge,rtl))&&safety.contains(glyph(edge,rtl));
    }
}
