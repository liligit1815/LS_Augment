import java.util.*;
import ls.augment.com.ControlCenterAppearanceOptions;
import ls.augment.com.ControlCenterAppearancePolicy;
import ls.augment.com.EnhancementOption;

/** Boundary and rendering-policy checks; not a substitute for OEM/device visual checks. */
public final class TestControlCenterAppearance {
    private static int checks;
    private static void require(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
    public static void main(String[] args){
        List<EnhancementOption> options=ControlCenterAppearanceOptions.options();Set<String> keys=new HashSet<>();
        for(EnhancementOption option:options){require(keys.add(option.key),"unique preference key");require(option.normalize(option.defaultValue)!=null,"valid safe default");if(option.kind==EnhancementOption.Kind.INTEGER){require(option.normalize(String.valueOf((int)option.minimum-1))==null,"reject lower overflow");require(option.normalize(String.valueOf((int)option.maximum+1))==null,"reject upper overflow");}}
        for(String key:Arrays.asList(ControlCenterAppearanceOptions.CORNERS,ControlCenterAppearanceOptions.TILES,ControlCenterAppearanceOptions.MEDIA))require(options.stream().anyMatch(o->o.key.equals(key)&&"0".equals(o.defaultValue)),"appearance never enables itself");
        require(!ControlCenterAppearancePolicy.activeTile(0,false)&&!ControlCenterAppearancePolicy.activeTile(1,false),"unavailable and inactive stay native");
        require(ControlCenterAppearancePolicy.activeTile(2,false)&&!ControlCenterAppearancePolicy.activeTile(2,true),"only available active state is customized");
        require(ControlCenterAppearancePolicy.radius(48,3,60,100)==30,"rounding never exceeds short edge");
        require(ControlCenterAppearancePolicy.radius(24,3,1000,600)==72,"dp converted with device density");
        require(ControlCenterAppearancePolicy.radius(Float.NaN,1,100,100)==0,"nonfinite values cannot reach rendering");
        require(ControlCenterAppearancePolicy.radius(24,1,0,100)==0,"unmeasured surface does not gain fake geometry");
        for(int[] size:new int[][]{{8000,4000},{1,9000},{1024,1024},{70,100},{0,100}}){int w=ControlCenterAppearancePolicy.dimension(size[0],size[1],true),h=ControlCenterAppearancePolicy.dimension(size[0],size[1],false);require(w<=256&&h<=256,"cover dimensions are bounded");if(size[0]>0&&size[1]>0)require(w>0&&h>0,"thin covers remain drawable");}
        require(ControlCenterAppearancePolicy.color("#010203",0)==0xff010203,"RGB alpha is explicit");
        require(ControlCenterAppearancePolicy.color("#80010203",0)==0x80010203,"ARGB import preserves alpha");
        require(ControlCenterAppearancePolicy.color("#invalid",7)==7,"bad color falls back");
        require(ControlCenterAppearancePolicy.blend(0xff123456,0xffffffff,0)==0xff123456,"zero overlay preserves native color");
        require(ControlCenterAppearancePolicy.blend(0xff123456,0xffaabbcc,100)==0xffaabbcc,"full overlay uses selected color");
        require(ControlCenterAppearancePolicy.blend(0xff123456,0x00aabbcc,100)==0xff123456,"transparent ARGB preserves native color");
        Random random=new Random(20449);
        for(int i=0;i<600;i++){
            int a=0xff000000|random.nextInt(0xffffff),b=0xff000000|random.nextInt(0xffffff),foreground=i%3==0?0xffffffff:i%3==1?0xff000000:0xff777777;
            int[] stops=ControlCenterAppearancePolicy.readableGradient(a,b,foreground);
            for(int step=0;step<=100;step++)require(ControlCenterAppearancePolicy.contrast(ControlCenterAppearancePolicy.blend(stops[0],stops[1],step),foreground)>=4.49,"entire gradient keeps native foreground readable");
        }
        System.out.println("PASS Control Center appearance policy: "+checks+" boundary/contrast checks; device effects unverified");
    }
}
