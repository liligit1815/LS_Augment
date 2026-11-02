package ls.augment.com;

public final class TestLauncherMemoryGeometry {
    private static int checks;
    private static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    public static void main(String[] args){
        // Real test20698 device values: launcher font scale differs from a possible settings-app override.
        LauncherMemoryGeometry g=new LauncherMemoryGeometry(1216,2688,3.25f,3.25f,2.7625f,.85f,false,1,6,11.53f,65,135,266,762);
        LauncherMemoryGeometry restored=LauncherMemoryGeometry.parse(g.encode());
        check(restored!=null&&restored.centerDp==135&&restored.maximumDp==266&&restored.maximumTopDp==762,"measurement round trip");
        check(restored.mismatch(1216,2688,3.25f,.85f,false,1,6,11.53f,65).isEmpty(),"owning launcher's measurement accepted independently of settings-app font metrics");
        check(restored.mismatch(2688,1216,3.25f,.85f,false,1,6,11.53f,65).isEmpty(),"display rotated");
        check(restored.mismatch(1080,2400,3.25f,.85f,false,1,6,11.53f,65).equals("display_size"),"different display");
        check(restored.mismatch(1216,2688,3f,.85f,false,1,6,11.53f,65).equals("display_density"),"changed physical density");
        check(restored.mismatch(1216,2688,3.25f,1f,false,1,6,11.53f,65).equals("system_font_scale"),"changed system font scale still rejected");
        check(restored.mismatch(1216,2688,3.25f,.85f,true,1,6,11.53f,65).equals("orientation"),"portrait cannot satisfy landscape");
        check(!restored.mismatch(1216,2688,3.25f,.85f,false,0,6,11.53f,65).isEmpty(),"different style");
        check(!restored.mismatch(1216,2688,3.25f,.85f,false,1,0,11.53f,65).isEmpty(),"different content");
        check(!restored.mismatch(1216,2688,3.25f,.85f,false,1,6,13,65).isEmpty(),"different size");
        check(!restored.mismatch(1216,2688,3.25f,.85f,false,1,6,11.53f,24).isEmpty(),"different fitting height");
        for(String bad:new String[]{"",null,"1;1216;2688;3.25;2.7625;1;6;11.53;65;135;266",g.encode().replace("3.25","NaN"),g.encode().replace(";135;266",";-1;266"),g.encode().replace(";135;266",";267;266"),g.encode().replace("2;1216","3;1216"),g.encode().replace(";762",";-1")})
            check(LauncherMemoryGeometry.parse(bad)==null,"invalid or incompatible geometry rejected");
        check(SliderMarkerPosition.x(0,0,200,300,16,16,24,12,false)==16,"zero at real left");
        check(SliderMarkerPosition.x(100,0,200,300,16,16,24,12,false)==150,"halfway on native track");
        check(SliderMarkerPosition.x(50,0,200,300,16,16,24,12,false)==83,"quarter position, not endpoint");
        check(SliderMarkerPosition.x(50,0,200,300,16,16,24,12,true)==217,"RTL marker follows native thumb");
        check(SliderMarkerPosition.x(100,0,200,300,10,30,40,5,false)==140,"custom native thumb geometry");
        check(Float.isFinite(SliderMarkerPosition.x(0,0,0,300,16,16,24,12,false)),"zero travel safe");
        System.out.println("PASS LauncherMemoryGeometry and slider marker: "+checks+" checks");
    }
}
