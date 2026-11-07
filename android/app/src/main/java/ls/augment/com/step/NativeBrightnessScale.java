package ls.augment.com.step;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** The owning SystemUI's converters define its range, even after constants are inlined. */
final class NativeBrightnessScale {
    final Method linear,gamma;
    final Object adapter;
    final Method adaptedLinear,adaptedGamma;
    final int gammaMaximum;
    final int maximum;
    final String source;
    private float checkedMin=Float.NaN,checkedMax=Float.NaN;

    NativeBrightnessScale(Class<?> owner) throws ReflectiveOperationException {
        this(owner,null);
    }
    NativeBrightnessScale(Class<?> owner,Object adapter) throws ReflectiveOperationException {
        this.adapter=adapter;
        linear=owner.getMethod("convertGammaToLinearFloat",int.class,float.class,float.class);
        gamma=owner.getMethod("convertLinearToGammaFloat",float.class,float.class,float.class);
        if(linear.getReturnType()!=float.class || gamma.getReturnType()!=int.class
                || !Modifier.isStatic(linear.getModifiers()) || !Modifier.isStatic(gamma.getModifiers()))
            throw new NoSuchMethodException("native brightness conversion signature");
        int endpoint=(Integer)gamma.invoke(null,1f,0f,1f);
        String path="native_endpoints";
        try {
            Field constant=owner.getField("GAMMA_SPACE_MAX");
            if(constant.getType()!=int.class || !Modifier.isStatic(constant.getModifiers()) || constant.getInt(null)!=endpoint)
                throw new IllegalStateException("brightness constant disagrees with native converter");
            path="native_constant";
        } catch(NoSuchFieldException inlined) { /* Retain native conversion, not a guessed range. */ }
        if(endpoint<=0)throw new IllegalStateException("native brightness endpoint unavailable");
        gammaMaximum=endpoint;
        if(adapter!=null){
            Class<?> type=adapter.getClass();
            adaptedLinear=type.getMethod("convertToBrightVal",float.class,float.class,float.class,float.class);
            adaptedGamma=type.getMethod("convertToSliderVal",float.class,float.class,float.class,int.class);
            Method max=type.getMethod("getMax",int.class);
            if(adaptedLinear.getReturnType()!=float.class || adaptedGamma.getReturnType()!=int.class || max.getReturnType()!=int.class
                    || Modifier.isStatic(adaptedLinear.getModifiers()) || Modifier.isStatic(adaptedGamma.getModifiers()) || Modifier.isStatic(max.getModifiers()))
                throw new NoSuchMethodException("OEM brightness mapping signature");
            maximum=(Integer)max.invoke(adapter,endpoint);
            if(maximum<=0)throw new IllegalStateException("OEM brightness endpoint unavailable");
            path="native_controller_adapter";
        }else{adaptedLinear=adaptedGamma=null;maximum=endpoint;}
        source=path;
        validate(0f,1f);
    }
    private float toLinear(int position,float min,float max)throws ReflectiveOperationException{
        float base=(Float)linear.invoke(null,position,min,max);
        return adapter==null?base:(Float)adaptedLinear.invoke(adapter,(float)position,min,max,Math.min(base,max));
    }
    private int toGamma(float value,float min,float max)throws ReflectiveOperationException{
        int base=(Integer)gamma.invoke(null,value,min,max);
        return adapter==null?base:(Integer)adaptedGamma.invoke(adapter,value,min,max,base);
    }
    private int sliderPosition(float value,float min,float max)throws ReflectiveOperationException{
        int result=toGamma(value,min,max);
        if(adapter==null || result>=0 && result<=maximum)return result;
        // Stock sliders saturate the OEM inverse at their actual endpoints. In
        // the linear OEM branch, value == max is normalized twice under a cap.
        // Accept only a verified boundary discontinuity, never an invalid curve.
        if(result>maximum && value==max){
            float end=toLinear(maximum,min,max);
            int below=toGamma(Math.nextDown(max),min,max);
            if(Math.abs(end-max)<=Math.max(0.000001f,(max-min)*0.00001f)
                    && below>=maximum-1 && below<=maximum)return maximum;
        }
        if(result<0 && value>=min && value<=toLinear(0,min,max)){
            int start=toGamma(toLinear(0,min,max),min,max);
            if(start>=-1 && start<=0)return 0;
        }
        return result;
    }
    void validate(float min,float max) throws ReflectiveOperationException {
        if(!Float.isFinite(min)||!Float.isFinite(max)||min<0||max>1||min>=max)
            throw new IllegalStateException("invalid native display brightness limits");
        if(min==checkedMin && max==checkedMax)return;
        if((Integer)gamma.invoke(null,min,min,max)!=0 || (Integer)gamma.invoke(null,max,min,max)!=gammaMaximum)
            throw new IllegalStateException("native gamma endpoints changed");
        float previous=Float.NEGATIVE_INFINITY,tolerance=Math.max(0.000001f,(max-min)*0.00001f);
        for(int n=0;n<=16;n++) {
            int position=(int)Math.round(maximum*(n/16d));
            float value=toLinear(position,min,max);
            // OEM nonlinear sliders can keep their full 0..1 scale under a thermal/HBM cap.
            // Validate that mapping independently; value() still enforces the actual display limits.
            if(!Float.isFinite(value)||value<(adapter==null?min:0)-tolerance||value>(adapter==null?max:1)+tolerance||value<previous
                    || Math.abs((long)sliderPosition(value,min,max)-position)>Math.max(1,adapter==null?1:maximum/1000)
                    || adapter==null && (n==0 && Math.abs(value-min)>tolerance || n==16 && Math.abs(value-max)>tolerance))
                throw new IllegalStateException("native brightness mapping did not round trip;position="+position+";value="+value
                        +";inverse="+toGamma(value,min,max)+";range="+min+":"+max+";maximum="+maximum);
            previous=value;
        }
        checkedMin=min;checkedMax=max;
    }
    float value(float fraction,float min,float max) throws ReflectiveOperationException {
        validate(min,max);
        if(!Float.isFinite(fraction)||fraction<0||fraction>1)throw new IllegalArgumentException("brightness fraction");
        float value=toLinear(Math.round(fraction*maximum),min,max);
        if(adapter!=null && Float.isFinite(value) && value>=0 && value<=1)value=Math.max(min,Math.min(max,value));
        if(!Float.isFinite(value)||value<min||value>max)throw new IllegalStateException("native brightness outside display limits");
        return value;
    }
    float fraction(float value,float min,float max) throws ReflectiveOperationException {
        validate(min,max);
        if(!Float.isFinite(value)||value<min||value>max)throw new IllegalStateException("brightness readback outside display limits");
        int position=sliderPosition(value,min,max);
        if(position<0||position>maximum)throw new IllegalStateException("native gamma readback outside range;value="+value
                +";position="+position+";range="+min+":"+max+";maximum="+maximum);
        return position/(float)maximum;
    }
}
