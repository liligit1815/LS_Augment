package ls.augment.com;

import java.util.HashSet;
import java.util.Set;

public final class TestNotificationLayoutPolicy {
    static int checks;
    static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
    static void near(float actual,float expected,String message){check(Math.abs(actual-expected)<.01f,message+": "+actual+" != "+expected);}
    public static void main(String[] args){
        near(NotificationLayoutPolicy.clockSize(64,24,0,120),64,"initial clock");
        near(NotificationLayoutPolicy.clockSize(64,24,120,120),24,"collapsed clock");
        near(NotificationLayoutPolicy.clockSize(64,24,-40,120),64,"overscroll must not grow clock");
        near(NotificationLayoutPolicy.clockSize(24,48,120,120),24,"compact size never enlarges clock");
        float previous=Float.MAX_VALUE;
        for(int scroll=0;scroll<=400;scroll++){
            float size=NotificationLayoutPolicy.clockSize(64,24,scroll,120);
            check(size<=previous&&size>=24&&size<=64,"continuous monotonic clock collapse");previous=size;
        }
        check(NotificationLayoutPolicy.shadeAllowed(0,false,false,true),"normal notification shade allowed");
        for(int state:new int[]{-1,1,2})check(!NotificationLayoutPolicy.shadeAllowed(state,false,false,true),"unknown, keyguard and shade-locked retain native layout");
        check(!NotificationLayoutPolicy.shadeAllowed(0,true,false,true)&&!NotificationLayoutPolicy.shadeAllowed(0,false,true,true)
                &&!NotificationLayoutPolicy.shadeAllowed(0,false,false,false),"doze, lockscreen transition and closed shade preserve native");
        check(NotificationLayoutPolicy.stackScrollRange(640,0,100,340)==400,"mixed-height list below viewport still requires compact scroll");
        check(NotificationLayoutPolicy.stackScrollRange(240,400,100,340)==400,"full native flow extent is independent of current scroll");
        check(NotificationLayoutPolicy.stackScrollRange(696,0,100,340)==456,"native section/footer flow included");
        check(NotificationLayoutPolicy.stackScrollRange(100,0,100,340)==0,"all rows fit compact boundary");
        check(NotificationLayoutPolicy.stackScrollRange(Float.NaN,0,100,340)==0,"invalid flow cannot create unbounded scrolling");
        check(NotificationLayoutPolicy.scrollRange(900,400,true)==900,"larger native keyboard/boundary range preserved");
        check(NotificationLayoutPolicy.scrollRange(0,400,true)==400,"native short-list range extended");
        check(NotificationLayoutPolicy.scrollRange(0,400,false)==0,"disable returns original range");
        near(NotificationLayoutPolicy.alignedX(1,400,180,16,0),110,"center alignment");
        near(NotificationLayoutPolicy.alignedX(2,400,180,16,120),220,"keep right hit area inside parent");
        NotificationLayoutPolicy.Row normal=NotificationLayoutPolicy.stacked(100,100,400,200,0,8,6,7,3,.7f);
        near(normal.y,100,"full row keeps native position");check(normal.clipTop==7&&normal.clipBottom==3&&!normal.hidden,"native clip preserved");near(normal.alpha,.7f,"native alpha preserved");
        NotificationLayoutPolicy.Row first=NotificationLayoutPolicy.stacked(208,100,400,200,1,8,6,0,0,1);
        NotificationLayoutPolicy.Row next=NotificationLayoutPolicy.stacked(316,100,400,200,2,8,6,0,0,1);
        near(first.y+first.clipTop,200,"first tail starts after full row native hit area");
        near(next.y+next.clipTop,first.y+100-first.clipBottom,"second tail starts after first tail hit area");
        check(first.scaleX>next.scaleX&&next.scaleX>0,"deeper native rows narrow");
        check(NotificationLayoutPolicy.stacked(532,100,400,200,4,8,6,0,0,1).hidden,"unexposed deep row must not retain touch target");
        float lastBottom=200;
        for(int i=0;i<=100;i++){
            float depth=i/100f;
            NotificationLayoutPolicy.Row row=NotificationLayoutPolicy.stacked(100+depth*108,100,400,200,depth,8,6,0,0,1);
            check(row.y+100-row.clipBottom>=lastBottom-.001f&&row.clipTop==0&&row.clipBottom>=0&&row.clipBottom<=100,"transition row geometry bounded and monotonic");lastBottom=row.y+100-row.clipBottom;
        }
        // Fixed measured geometry is independent of the current formula implementation.
        NotificationLayoutPolicy.Row measured=NotificationLayoutPolicy.stacked(1540,210,1092,1642,108f/236f,26,19.5f,0,0,1);
        near(measured.y,1527.8983f,"measured visible top stays fixed while the native row starts at its title");
        check(measured.clipTop==0&&measured.clipBottom==84,"measured 126px window contains prefix instead of body suffix");
        near(measured.y+210-measured.clipBottom,1653.8983f,"measured bottom retained");
        check(35>=measured.clipTop&&70<=210-measured.clipBottom,"unchanged-size native title band remains wholly visible");
        for(int height:new int[]{42,100,210,599})for(int step:new int[]{8,26,65}){
            if(step>height)continue;
            for(int top:new int[]{0,7})for(int bottom:new int[]{0,9}){
                if(bottom>step||top+bottom>=height)continue;
                float previousY=Float.NaN;
                for(int index=0;index<=4000;index++){
                    float d=index/1000f,nativeY=1000-height+d*(height+26);
                    NotificationLayoutPolicy.Row row=NotificationLayoutPolicy.stacked(nativeY,height,1092,1000,d,step,19.5f,top,bottom,.8f);
                    // Original visible edges are the contract. The title offset must remain native.
                    float originalY=1000+Math.min(3f,d)*step-height;
                    int originalTop=Math.max(top,Math.round(Math.min(1f,d)*(height-step)));
                    near(row.y+row.clipTop,originalY+originalTop,"prefix keeps original top hit boundary");
                    near(row.y+height-row.clipBottom,originalY+height-bottom,"prefix keeps original bottom hit boundary");
                    check(row.clipTop==top&&row.clipBottom>=bottom&&row.clipBottom+top<=height,"native clips remain bounded and only suffix is folded");
                    if(index>0)check(Math.abs(row.y-previousY)<=1.07f,"depth scan has no full-card pop at 0, 1, 2, 3 or 4");
                    previousY=row.y;
                    check(row.hidden==(d>=4),"hidden deep card threshold unchanged");
                }
            }
        }
        Set<String> keys=new HashSet<>();
        for(EnhancementOption option:NotificationAppearanceOptions.options()){
            check(keys.add(option.key),"duplicate option key");check(option.normalize(option.defaultValue)!=null,"invalid default");
            if(option.kind==EnhancementOption.Kind.INTEGER){check(option.normalize("NaN")==null,"reject invalid integer");check(option.normalize(String.valueOf((int)option.maximum+1))==null,"reject value beyond real parameter bound");}
        }
        check(keys.contains(NotificationAppearanceOptions.CLOCK_PORTRAIT)&&keys.contains(NotificationAppearanceOptions.CLOCK_LANDSCAPE),"independent orientation master switches");
        check(!NotificationAppearanceOptions.clock(false,"size").equals(NotificationAppearanceOptions.clock(true,"size")),"orientation settings cannot overwrite each other");
        check(keys.contains(NotificationAppearanceOptions.STACK_BIG)&&keys.contains(NotificationAppearanceOptions.STACK_SMALL),"big and same-app stack controls are both exposed");
        check(!NotificationAppearanceOptions.STACK_BIG.equals(NotificationAppearanceOptions.STACK_SMALL),"big and small stacks must not share a persisted setting");
        check(!keys.contains(NotificationAppearanceOptions.STACK_COUNT)&&!keys.contains(NotificationAppearanceOptions.STACK_STEP)
                &&!keys.contains(NotificationAppearanceOptions.STACK_INSET),"obsolete whole-list geometry is absent from user-facing settings");
        for(EnhancementOption option:NotificationAppearanceOptions.options())
            if(option.key.equals(NotificationAppearanceOptions.STACK_BIG)||option.key.equals(NotificationAppearanceOptions.STACK_SMALL))
                check(option.kind==EnhancementOption.Kind.BOOLEAN&&"0".equals(option.defaultValue),"new stack modes are independent switches and default disabled");
        System.out.println("Notification policy "+checks+" checks: native scene exclusions, clock collapse, retained clip geometry primitives and "+keys.size()+" valid independent options passed; grouped stack behavior tested separately");
    }
}
