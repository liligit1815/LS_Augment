package ls.augment.com.step;

import android.content.Context;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;

/** The network pad and the two level controls leave the centerline for the three code actions. */
final class StepControlFace extends FrameLayout {
    private View network, device, volume, brightness;
    private boolean compact;
    private final View[] codes = new View[WorkspaceActions.Code.values().length];
    private final int[] origin = new int[2];

    StepControlFace(Context context) { super(context); }

    void setControls(View network, View device, View volume, View brightness) {
        this.network = network;
        this.device = device;
        this.volume = volume;
        this.brightness = brightness;
        for (View child : new View[]{network, device, volume, brightness}) addView(child);
    }
    void addCode(WorkspaceActions.Code kind, View child) {
        codes[kind.ordinal()] = child;
        addView(child);
    }
    void setCompact(boolean value){compact=value;}
    int codeLeft() { return codes[0].getLeft(); }
    int codeAreaWidth() { return Math.max(1,codes[codes.length-1].getRight()-codeLeft()); }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        int width = MeasureSpec.getSize(widthSpec), height = MeasureSpec.getSize(heightSpec);
        if(compact){
            int gap=StepMaterial.dp(getContext(),2),level=StepMaterial.dp(getContext(),44);
            int code=0;for(View v:codes)code=Math.max(code,v.getMinimumWidth());
            int padWidth=Math.min(StepMaterial.dp(getContext(),128),width-2*level-3*gap-3*code);
            padWidth=Math.max(StepMaterial.dp(getContext(),96),padWidth);
            int codeWidth=(width-padWidth-2*level-3*gap)/3;
            int row=StepMaterial.dp(getContext(),44),y=height-row;
            boolean showDevice=y>=StepMaterial.dp(getContext(),22);
            device.setVisibility(showDevice?VISIBLE:GONE);
            if(showDevice)place(device,0,0,width,y);
            place(network,0,y,padWidth,row);
            int x=padWidth+gap;
            for(View v:codes){place(v,x,y,codeWidth,row);x+=codeWidth;}
            x+=gap;place(brightness,x,y,level,row);
            place(volume,x+level+gap,y,level,row);
            super.onMeasure(widthSpec,heightSpec);return;
        }
        int gap = Math.max(1, Math.min(StepMaterial.dp(getContext(), 8), Math.min(width / 24, height / 12)));
        int square = Math.max(1, Math.min(height, Math.round((width - 3 * gap) * .35f)));
        int cellWidth = 0;
        for (View code : codes) cellWidth = Math.max(cellWidth, code.getMinimumWidth());
        int center = Math.min(cellWidth * codes.length, width / 2);
        square = Math.max(1, Math.min(square, (width - 2 * gap - center) / 2));
        int top = (height - square) / 2, half = Math.max(1, (square - gap) / 2);
        place(network, 0, top, square, square);
        int levelHeight=Math.max(1,(height-gap)/2);
        int levelWidth=Math.max(square,Math.min(width-square-2*gap-center,
                Math.max(brightness.getMinimumWidth(),volume.getMinimumWidth())));
        place(brightness, width-levelWidth, 0, levelWidth, levelHeight);
        place(volume, width-levelWidth, levelHeight+gap, levelWidth, height-levelHeight-gap);
        int start = square + gap, centerWidth = Math.max(1, width-start-gap-levelWidth);
        place(device, start, top, centerWidth, half);
        for (int i = 0; i < codes.length; i++) {
            int left = start + centerWidth * i / codes.length;
            int right = start + centerWidth * (i + 1) / codes.length;
            place(codes[i], left, top + square - half, right - left, half);
        }
        super.onMeasure(widthSpec, heightSpec);
    }

    private void place(View child, int x, int y, int width, int height) {
        LayoutParams p = (LayoutParams) child.getLayoutParams();
        // Insets are physical screen coordinates, including while the deck is sliding.
        int safe = 0;
        WindowInsets insets = getRootWindowInsets();
        if (insets != null && insets.getDisplayCutout() != null) {
            getLocationOnScreen(origin);
            for (Rect hole : insets.getDisplayCutout().getBoundingRects()) {
                if (hole.left < origin[0] + x + width && hole.right > origin[0] + x
                        && hole.top < origin[1] + y + height && hole.bottom > origin[1] + y)
                    safe = Math.max(safe, hole.bottom - origin[1] - y);
            }
        }
        safe = Math.min(safe, Math.max(0, height - 1));
        p.gravity = Gravity.TOP | Gravity.LEFT;
        p.leftMargin = x;
        p.topMargin = y + safe;
        p.width = Math.max(1, width);
        p.height = Math.max(1, height - safe);
    }
}
