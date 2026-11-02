package ls.augment.com;

/** Uses the native SeekBar thumb travel, including padding, thumb offset and RTL. */
final class SliderMarkerPosition {
    private SliderMarkerPosition() { }
    static float x(int progress,int minimum,int maximum,int width,int left,int right,int thumb,int offset,boolean rtl) {
        float travel=Math.max(0,width-left-right-thumb+2*offset);
        float fraction=maximum==minimum?0:(progress-minimum)/(float)(maximum-minimum);
        fraction=Math.max(0,Math.min(1,fraction));
        if(rtl)fraction=1-fraction;
        return left+thumb/2f-offset+travel*fraction;
    }
}
