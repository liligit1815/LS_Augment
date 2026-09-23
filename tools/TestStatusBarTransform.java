package ls.augment.com;

public final class TestStatusBarTransform {
    private static void near(float expected,float actual){
        if(Math.abs(expected-actual)>.001f)throw new AssertionError(expected+" != "+actual);
    }
    public static void main(String[] args){
        for(float ancestor:new float[]{.5f,.8f,1f,1.4f,2f})
            for(float left:new float[]{-6,0,3})
                for(float pivot:new float[]{0,12,30}){
                    float size=27,desired=13,target=143.25f,parentOffset=31.5f;
                    float scale=StatusBarTransform.scale(desired,size,ancestor);
                    near(desired,size*scale*ancestor);
                    // An OEM animation resets translations between frames. The
                    // same target must be restored without accumulating offsets.
                    for(int frame=0;frame<1000;frame++){
                        float translation=StatusBarTransform.translation((target-parentOffset)/ancestor,left,pivot,scale);
                        float actual=parentOffset+ancestor*(translation+pivot+(left-pivot)*scale);
                        near(target,actual);
                        near(target+desired,parentOffset+ancestor*(translation+pivot+(left+size-pivot)*scale));
                    }
                }
        System.out.println("PASS status bar: ancestor scale, overflow bounds, pivots and repeated absolute placement");
    }
}
