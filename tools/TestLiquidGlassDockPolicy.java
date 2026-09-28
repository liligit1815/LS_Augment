package ls.augment.com;

import java.util.Arrays;

public final class TestLiquidGlassDockPolicy {
    public static void main(String[] args){
        expect(new int[]{12,2,988,138},LiquidGlassDockPolicy.bounds(1000,220,20,10,980,130,8,36,180));
        expect(new int[]{0,0,1000,138},LiquidGlassDockPolicy.bounds(1000,220,3,2,998,130,8,36,180));
        require(LiquidGlassDockPolicy.bounds(1000,220,0,0,1000,220,8,36,180)==null,"reject tall workspace bounds");
        require(LiquidGlassDockPolicy.bounds(1000,220,0,0,1000,10,8,36,180)==null,"reject gesture-sized strip");
        require(LiquidGlassDockPolicy.bounds(1000,220,40,40,30,80,8,36,180)==null,"reject inverted icon bounds");
        require(LiquidGlassDockPolicy.bounds(0,220,0,0,1000,100,8,36,180)==null,"reject unmeasured layout");
        require(LiquidGlassDockPolicy.bounds(1000,220,Integer.MAX_VALUE,0,Integer.MAX_VALUE,100,8,36,180)==null,"no overflow");
        expect(new int[]{0,40,160,172},LiquidGlassDockPolicy.bounds(180,240,8,48,152,164,8,36,180));
        expect(new int[]{24,8,88,72},LiquidGlassDockPolicy.iconBounds(112,240,64,64,8));
        expect(new int[]{0,0,64,64},LiquidGlassDockPolicy.iconBounds(64,64,64,64,0));
        require(LiquidGlassDockPolicy.iconBounds(64,96,0,64,0)==null,"no unmeasured drawable");
        require(LiquidGlassDockPolicy.iconBounds(64,96,80,64,0)==null,"reject drawable outside cell");
        require(LiquidGlassDockPolicy.iconBounds(64,96,64,64,40)==null,"reject bottom overflow");
        require(LiquidGlassDockPolicy.iconBounds(64,Integer.MAX_VALUE,64,64,Integer.MAX_VALUE)==null,"no padding overflow");
        require(LiquidGlassDockPolicy.bounds(100,100,10,10,90,90,12,0,100)==null,"reject invalid height policy");
        require(LiquidGlassDockPolicy.bounds(100,100,10,10,90,90,12,60,40)==null,"reject inverted height policy");
        // 1216px/520dpi fixture: five native icons remain above the host's gesture margin.
        expect(new int[]{33,8,207,182},LiquidGlassDockPolicy.iconBounds(240,260,174,174,8));
        expect(new int[]{2,5,1214,257},LiquidGlassDockPolicy.bounds(1216,352,41,44,1175,218,39,117,585));
        System.out.println("Dock material geometry passed");
    }
    private static void expect(int[] expected,int[] actual){require(Arrays.equals(expected,actual),"bounds "+Arrays.toString(actual));}
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
}
