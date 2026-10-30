package ls.augment.com.hook;

/** Screen-space placement of the existing OEM entrance above the volume slider. */
final class VolumeEntrancePlacement {
    static final int GAP_DP=24;
    static int panelTop(int nativeTop,int available,int panelHeight,int entranceHeight,int gap) {
        int min=entranceHeight+gap,max=available-panelHeight;
        return min>max?-1:Math.max(min,Math.min(nativeTop,max));
    }
    static int entranceTop(int sliderTop,int surfaceHeight,int windowHeight,int gap) {
        return sliderTop-gap-windowHeight+Math.max(0,(windowHeight-surfaceHeight)/2);
    }
    private VolumeEntrancePlacement() { }
}
