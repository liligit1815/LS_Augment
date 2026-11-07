"""Validate native brightness mappings, including optimized SystemUI without constants."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
source=ROOT/'android/app/src/main/java/ls/augment/com/step/NativeBrightnessScale.java'
harness=r'''
package ls.augment.com.step;
public class TestBrightness {
    static int checks;
    static void check(boolean b,String msg){checks++;if(!b)throw new AssertionError(msg);}
    public static class Inlined {
        public static float convertGammaToLinearFloat(int p,float min,float max){
            float n=p/65535f;return min+(max-min)*n*n;
        }
        public static int convertLinearToGammaFloat(float b,float min,float max){return Math.round((float)Math.sqrt((b-min)/(max-min))*65535);}
    }
    public static class Legacy extends Inlined {public static final int GAMMA_SPACE_MAX=65535;}
    public static class Child extends Inlined {}
    public static class WrongConstant extends Inlined {public static final int GAMMA_SPACE_MAX=1023;}
    public static class Broken extends Inlined {public static float convertGammaToLinearFloat(int p,float min,float max){return max;}}
    public static class NonFinite extends Inlined {public static float convertGammaToLinearFloat(int p,float min,float max){return Float.NaN;}}
    public static class Missing {}
    public static class Changed extends Inlined {public static float convertGammaToLinearFloat(int p,float min,float max){return min==0?Inlined.convertGammaToLinearFloat(p,min,max):max;}}
    public static class Oem {
        public int getMax(int fallback){return 1000;}
        public float convertToBrightVal(float p,float min,float max,float fallback){return p/1000f;}
        public int convertToSliderVal(float value,float min,float max,int fallback){return Math.round(value*1000);}
    }
    public static class ChildOem extends Oem {}
    public static class DisabledOem extends Oem {
        public int getMax(int fallback){return fallback;}
        public float convertToBrightVal(float p,float min,float max,float fallback){return fallback;}
        public int convertToSliderVal(float value,float min,float max,int fallback){return fallback;}
    }
    public static class BrokenOem extends Oem {public float convertToBrightVal(float p,float min,float max,float fallback){return 2;}}
    // OEM's non-gamma branch (BrightnessControllerAdapt), including its special
    // inverse at the capped endpoint. The stock SeekBar clamps that result.
    public static class NativeLinearOem {
        public int getMax(int fallback){return 254;}
        public float convertToBrightVal(float p,float min,float max,float fallback){return Math.min((p+1)/255f*(max-min),1);}
        public int convertToSliderVal(float v,float min,float max,int fallback){
            if(v==max)v/=max-min;
            return (int)(v/(max-min)*255-1);
        }
    }
    public static class ChildLinearOem extends NativeLinearOem {}
    public static class WrongInverse extends NativeLinearOem {
        public int convertToSliderVal(float v,float min,float max,int fallback){return 900;}
    }
    interface Action {void run()throws Exception;}
    static void refuses(Action action,String why)throws Exception {try{action.run();throw new AssertionError(why);}catch(ReflectiveOperationException|IllegalArgumentException|IllegalStateException expected){checks++;}}
    public static void main(String[] args)throws Exception {
        for(Class<?> type:new Class<?>[]{Inlined.class,Legacy.class,Child.class}){
            NativeBrightnessScale s=new NativeBrightnessScale(type);
            check(s.maximum==65535,"range derives from native inverse");
            for(float[] range:new float[][]{{0,1},{0,.8583f},{.02f,.78f}}){
                for(float p:new float[]{0,.1f,.5f,.9f,1}){
                    float actual=s.value(p,range[0],range[1]);
                    check(actual>=range[0] && actual<=range[1],"honors actual display cap");
                    check(Math.abs(s.fraction(actual,range[0],range[1])-p)<.00003f,"native round trip");
                }
            }
        }
        refuses(()->new NativeBrightnessScale(Missing.class),"missing conversions");
        refuses(()->new NativeBrightnessScale(WrongConstant.class),"conflicting declared range");
        refuses(()->new NativeBrightnessScale(Broken.class),"broken native mapping");
        refuses(()->new NativeBrightnessScale(NonFinite.class),"NaN conversion");
        NativeBrightnessScale s=new NativeBrightnessScale(Inlined.class);
        refuses(()->s.validate(1,0),"reversed native range");refuses(()->s.validate(0,0),"empty range");
        refuses(()->s.validate(0,Float.NaN),"unknown cap");refuses(()->s.validate(0,2),"unknown linear scale");
        refuses(()->s.fraction(.9f,0,.8f),"readback out of cap");refuses(()->s.value(Float.NaN,0,1),"NaN request");
        refuses(()->new NativeBrightnessScale(Changed.class).validate(.1f,.8f),"revalidate changed display range");
        for(Object adapter:new Object[]{new Oem(),new ChildOem()}){
            NativeBrightnessScale o=new NativeBrightnessScale(Inlined.class,adapter);
            check(o.maximum==1000,"native controller determines its own slider range");
            check(o.fraction(.5f,0,1)==.5f,"OEM linear percent differs from AOSP gamma percent");
            check(o.value(.5f,0,1)==.5f,"writes use the same native conversion");
            check(o.value(1,.02f,.8f)==.8f,"OEM full scale still respects actual display cap");
            check(o.value(0,.02f,.8f)==.02f,"OEM mapping cannot write below display minimum");
            check(o.fraction(.8f,.02f,.8f)==.8f,"display readback uses native percentage under cap");
        }
        NativeBrightnessScale disabled=new NativeBrightnessScale(Inlined.class,new DisabledOem());
        check(Math.abs(disabled.value(.5f,0,1)-.25f)<.0001f,"disabled OEM branch preserves stock gamma fallback");
        refuses(()->new NativeBrightnessScale(Inlined.class,new BrokenOem()),"invalid OEM calibration rejected");
        for(Object adapter:new Object[]{new NativeLinearOem(),new ChildLinearOem()}){
            NativeBrightnessScale nativeLinear=new NativeBrightnessScale(Inlined.class,adapter);
            for(float cap:new float[]{1,.8583f,.6f}){
                check(nativeLinear.fraction(cap,0,cap)==1,"native capped endpoint matches stock clamped slider");
                check(nativeLinear.fraction(0,0,cap)==0,"native lower endpoint matches stock clamped slider");
                for(float p:new float[]{0,.1f,.5f,.9f,1}){
                    float value=nativeLinear.value(p,0,cap);
                    check(value>=0 && value<=cap,"native capped linear write stays within display limits");
                    check(Math.abs(nativeLinear.fraction(value,0,cap)-p)<.008f,"native linear curve validated including endpoint discontinuity");
                }
            }
        }
        refuses(()->new NativeBrightnessScale(Inlined.class,new WrongInverse()),"broken inverse is not hidden by range clamping");
        System.out.println("PASS "+checks+" Step brightness checks: original/inlined/inherited converters, caps, round trip, missing and invalid capabilities");
    }
}
'''
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-brightness-') as tmp:
    folder=Path(tmp);test=folder/'TestBrightness.java';test.write_text(harness,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,source,test],check=True)
    subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.TestBrightness'],check=True)
