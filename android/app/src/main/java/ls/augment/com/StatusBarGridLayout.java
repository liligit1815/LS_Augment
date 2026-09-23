package ls.augment.com;

import java.util.*;

/** Pure packing shared with the editor preview. Span items reserve both rows. */
public final class StatusBarGridLayout {
    private StatusBarGridLayout() { }
    public static final class Node {
        public final String id, zone;
        public final int order;
        public final float width, height, baseline;
        public Node(String id, String zone, int order, float width, float height) {
            this(id,zone,order,width,height,-1);
        }
        public Node(String id, String zone, int order, float width, float height,float baseline) {
            this.id = id; this.zone = zone; this.order = order;
            this.width = Math.max(1, width); this.height = Math.max(1, height);
            this.baseline=baseline<0?-1:Math.max(0,Math.min(this.height,baseline));
        }
    }
    public static final class Box {
        public final float x, y, width, height, scale;
        Box(float x, float y, float width, float height, float scale) {
            this.x=x; this.y=y; this.width=width; this.height=height; this.scale=scale;
        }
    }
    public static Map<String, Box> pack(List<Node> nodes, float width, float height,
            float left, float right, float top, float bottom, float gap,
            float cutoutLeft, float cutoutRight) {
        LinkedHashMap<String, Box> result = new LinkedHashMap<>();
        float usableW = Math.max(0, width-left-right), usableH = Math.max(0, height-top-bottom);
        if (usableW < 3 || usableH < 2) return result;
        gap = Math.max(-usableH / 4, Math.min(gap, usableH / 4));
        // Negative spacing brings rows closer without increasing their glyph sizes.
        float rowH = (usableH-Math.max(0,gap))/2;
        float[] ascent={0,0},descent={0,0},rowFit={1,1};
        for(Node n:nodes)if(n.zone.charAt(1)!='S'&&n.baseline>=0){
            int r=n.zone.charAt(1)=='2'?1:0;float s=Math.min(1,rowH/n.height);
            ascent[r]=Math.max(ascent[r],n.baseline*s);descent[r]=Math.max(descent[r],(n.height-n.baseline)*s);
        }
        for(int r=0;r<2;r++){rowFit[r]=Math.min(1,rowH/Math.max(1,ascent[r]+descent[r]));ascent[r]*=rowFit[r];descent[r]*=rowFit[r];}
        float itemSpacing=Math.max(2,Math.min(8,usableH/18));
        boolean centerUsed=false;
        float[] demand=new float[3];
        for(Node n:nodes){int col="LCR".indexOf(n.zone.charAt(0));if(col>=0)demand[col]+=n.width+itemSpacing;if(col==1)centerUsed=true;}
        // Empty center space belongs to the populated sides. Keep a central
        // cutout clear; never move an explicitly centered component elsewhere.
        float split=left+usableW*(demand[0]+demand[2]==0?.5f:
                Math.max(1f/3,Math.min(2f/3,demand[0]/(demand[0]+demand[2]))));
        for (int col=0; col<3; col++) {
            char region = "LCR".charAt(col);
            float start = left+usableW*col/3, end = left+usableW*(col+1)/3;
            if(!centerUsed){
                if(col==0){start=left;end=cutoutRight>cutoutLeft?Math.max(left,cutoutLeft):split;}
                if(col==2){start=cutoutRight>cutoutLeft?Math.min(width-right,cutoutRight):split;end=width-right;}
            }
            // Any zone intersecting an actual cutout uses its larger clear interval.
            if (cutoutRight > cutoutLeft && cutoutLeft < end && cutoutRight > start) {
                float before = Math.max(0, cutoutLeft-start), after = Math.max(0, end-cutoutRight);
                if (before >= after) end = Math.max(start, cutoutLeft); else start = Math.min(end, cutoutRight);
            }
            float available = Math.max(0, end-start);
            ArrayList<Node> group = new ArrayList<>();
            for (Node node : nodes) if (node.zone.charAt(0) == region) group.add(node);
            group.sort(Comparator.comparingInt(n -> n.order));
            // Pack inward from the right edge so short upper rows stay close
            // to the network and battery instead of inheriting lower-row blanks.
            if(col==2)Collections.reverse(group);
            float[] cursor = {0,0};
            Set<String> pairedTop=new HashSet<>(),pairedBottom=new HashSet<>(),pairsAligned=new HashSet<>();
            for (Node n : group) {
                if (n.id.endsWith("#0") && n.zone.charAt(1)=='1') pairedTop.add(n.id.substring(0,n.id.length()-2));
                if (n.id.endsWith("#1") && n.zone.charAt(1)=='2') pairedBottom.add(n.id.substring(0,n.id.length()-2));
            }
            Map<String,Float> pairWidths=new HashMap<>();
            for(Node n:group)if(n.id.endsWith("#0")||n.id.endsWith("#1")){
                String pair=n.id.substring(0,n.id.length()-2);int r=n.zone.charAt(1)=='2'?1:0;
                pairWidths.put(pair,Math.max(pairWidths.getOrDefault(pair,0f),n.width*Math.min(1,rowH/n.height)*rowFit[r]));
            }
            Map<String, float[]> raw = new LinkedHashMap<>();
            for (Node n : group) {
                // Preceding content can have different widths in each row.
                // Keep both notification rows and upload/download rows together.
                String pair=(n.id.endsWith("#0")||n.id.endsWith("#1"))?n.id.substring(0,n.id.length()-2):null;
                if (pair!=null && pairedTop.contains(pair) && pairedBottom.contains(pair) && pairsAligned.add(pair)) {
                    cursor[0]=cursor[1]=Math.max(cursor[0],cursor[1]);
                }
                boolean span = n.zone.charAt(1)=='S'; int row=n.zone.charAt(1)=='2'?1:0;
                float h = span?usableH:rowH;
                float scale = Math.min(1, h/n.height)*(span?1:rowFit[row]);
                float w=n.width*scale, itemH=n.height*scale;
                float x=span?Math.max(cursor[0],cursor[1]):cursor[row];
                float reserved=col==2&&pair!=null&&pairedTop.contains(pair)&&pairedBottom.contains(pair)?pairWidths.get(pair):w;
                raw.put(n.id,new float[]{x+(col==2?reserved-w:0), 0, w,itemH,scale,span?-1:row,n.baseline<0?-1:n.baseline*scale});
                if (span) cursor[0]=cursor[1]=x+w+itemSpacing; else cursor[row]=x+reserved+itemSpacing;
            }
            float used = Math.max(0,Math.max(cursor[0],cursor[1])-itemSpacing);
            float fit = used==0?1:Math.min(1,available/used);
            float origin = col==2?end-used*fit:col==1?start+(available-used*fit)/2:start;
            float safeGap=gap;
            if(gap<0){
                // A negative preference is allowed only when the two rows do
                // not actually intersect. Test measured bounds after fitting.
                for(float[] a:raw.values())for(float[] b:raw.values()){
                    if(a[5]!=0||b[5]!=1)continue;
                    float horizontal=Math.min(a[0]+a[2],b[0]+b[2])-Math.max(a[0],b[0]);
                    if(horizontal>0&&fit>0)safeGap=0;
                }
            }
            for (Map.Entry<String,float[]> e : raw.entrySet()) {
                float[] a=e.getValue(); float scaledH=a[3]*fit;
                // Both rows share their inner edges, including after width
                // fitting. The configured gap is the actual space between rows,
                // rather than padding between two oversized half-height cells.
                float middle=top+usableH/2;
                float y=a[5]<0?middle-scaledH/2:a[5]==0?middle-safeGap/2-scaledH:middle+safeGap/2;
                if(a[5]>=0&&a[6]>=0)y=a[5]==0?middle-Math.max(0,gap)/2-descent[0]-a[6]*fit:middle+Math.max(0,gap)/2+ascent[1]-a[6]*fit;
                result.put(e.getKey(), new Box(col==2?end-(a[0]+a[2])*fit:origin+a[0]*fit, y,
                        a[2]*fit, scaledH,a[4]*fit));
            }
        }
        return result;
    }
}
