package ls.augment.com;

import java.util.*;

/** Pure packing shared with the editor preview. Span items reserve both rows. */
public final class StatusBarGridLayout {
    private StatusBarGridLayout() { }
    public static final class Node {
        public final String id, zone;
        public final int order;
        public final float width, height;
        public Node(String id, String zone, int order, float width, float height) {
            this.id = id; this.zone = zone; this.order = order;
            this.width = Math.max(1, width); this.height = Math.max(1, height);
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
        gap = Math.min(Math.max(0, gap), usableH / 4);
        float rowH = (usableH-gap)/2;
        for (int col=0; col<3; col++) {
            char region = "LCR".charAt(col);
            float start = left+usableW*col/3, end = left+usableW*(col+1)/3;
            // Any zone intersecting an actual cutout uses its larger clear interval.
            if (cutoutRight > cutoutLeft && cutoutLeft < end && cutoutRight > start) {
                float before = Math.max(0, cutoutLeft-start), after = Math.max(0, end-cutoutRight);
                if (before >= after) end = Math.max(start, cutoutLeft); else start = Math.min(end, cutoutRight);
            }
            float available = Math.max(0, end-start);
            ArrayList<Node> group = new ArrayList<>();
            for (Node node : nodes) if (node.zone.charAt(0) == region) group.add(node);
            group.sort(Comparator.comparingInt(n -> n.order));
            float[] cursor = {0,0};
            boolean notificationTop=false, notificationBottom=false, notificationsAligned=false;
            for (Node n : group) {
                if (n.id.equals("notifications#0") && n.zone.charAt(1)=='1') notificationTop=true;
                if (n.id.equals("notifications#1") && n.zone.charAt(1)=='2') notificationBottom=true;
            }
            Map<String, float[]> raw = new LinkedHashMap<>();
            for (Node n : group) {
                // Hardware text before the icons can occupy different widths in
                // each row. Reserve a common left edge for the notification pair
                // before packing either row, so neither overlaps earlier content.
                if (notificationTop && notificationBottom && !notificationsAligned
                        && (n.id.equals("notifications#0") || n.id.equals("notifications#1"))) {
                    cursor[0]=cursor[1]=Math.max(cursor[0],cursor[1]);
                    notificationsAligned=true;
                }
                boolean span = n.zone.charAt(1)=='S'; int row=n.zone.charAt(1)=='2'?1:0;
                float h = span?usableH:rowH;
                float scale = Math.min(1, h/n.height);
                float w=n.width*scale, itemH=n.height*scale;
                float x=span?Math.max(cursor[0],cursor[1]):cursor[row];
                raw.put(n.id,new float[]{x, 0, w,itemH,scale,span?-1:row});
                if (span) cursor[0]=cursor[1]=x+w+2; else cursor[row]=x+w+2;
            }
            float used = Math.max(0,Math.max(cursor[0],cursor[1])-2);
            float fit = used==0?1:Math.min(1,available/used);
            float origin = col==2?end-used*fit:col==1?start+(available-used*fit)/2:start;
            for (Map.Entry<String,float[]> e : raw.entrySet()) {
                float[] a=e.getValue(); float scaledH=a[3]*fit;
                // Both rows share their inner edges, including after width
                // fitting. The configured gap is the actual space between rows,
                // rather than padding between two oversized half-height cells.
                float middle=top+usableH/2;
                float y=a[5]<0?middle-scaledH/2:a[5]==0?middle-gap/2-scaledH:middle+gap/2;
                result.put(e.getKey(), new Box(origin+a[0]*fit, y,
                        a[2]*fit, scaledH,a[4]*fit));
            }
        }
        return result;
    }
}
