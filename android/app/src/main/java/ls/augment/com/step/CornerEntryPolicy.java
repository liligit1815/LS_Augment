package ls.augment.com.step;

/** Shared physical status-bar geometry for the real entry and its user guide. */
public final class CornerEntryPolicy {
    public static final int EDGE_DP=72, INWARD_DP=58, VERTICAL_DP=24, BACKTRACK_DP=6;
    public static final long DURATION_MS=500;
    private CornerEntryPolicy(){}
    public static boolean completedAfter(long started,long now,long completed){return started>=0 && completed>0 && completed>=started && completed<=now;}
    public static int edge(int width,float density){return Math.min(width/2,Math.round(EDGE_DP*density));}
    public static int height(int statusBarHeight,float density){return Math.min(statusBarHeight,Math.round(EDGE_DP*density));}
    public static int direction(int width,int statusBarHeight,float density,float x,float y){
        if(width<=0 || statusBarHeight<=0 || !Float.isFinite(density) || density<=0
                || !Float.isFinite(x) || !Float.isFinite(y) || x<0 || x>=width || y<0 || y>=height(statusBarHeight,density))return 0;
        int edge=edge(width,density);
        return x<=edge?1:x>=width-edge?-1:0;
    }
}
