package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Validated AudioService contracts; the extra device argument is not a version gate. */
final class AudioGainTargets {
    enum Kind { ADJUST, SET, CURRENT, MAXIMUM, LAST_AUDIBLE, APP_OP, DND, PLAYBACK }
    private static final String I="int",Z="boolean",S="java.lang.String";
    private static final String DEVICE="android.media.AudioDeviceAttributes";

    static Kind kind(Method method){
        if(Modifier.isStatic(method.getModifiers()))return null;
        switch(method.getName()){
            case "adjustStreamVolume":
                if(signature(method,void.class,I,I,I,S,S,I,I,S,Z,I)
                        ||signature(method,void.class,I,I,I,DEVICE,S,S,I,I,S,Z,I))return Kind.ADJUST;
                break;
            case "setStreamVolume":
                if(signature(method,void.class,I,I,I,DEVICE,S,S,S,I,Z,Z))return Kind.SET;
                break;
            case "getStreamVolume":if(signature(method,int.class,I))return Kind.CURRENT;break;
            case "getStreamMaxVolume":if(signature(method,int.class,I))return Kind.MAXIMUM;break;
            case "getLastAudibleStreamVolume":if(signature(method,int.class,I))return Kind.LAST_AUDIBLE;break;
            case "checkNoteAppOp":if(signature(method,boolean.class,I,I,S,S))return Kind.APP_OP;break;
            case "volumeAdjustmentAllowedByDnd":if(signature(method,boolean.class,I,I))return Kind.DND;break;
            case "onPlaybackConfigChange":if(signature(method,void.class,"java.util.List"))return Kind.PLAYBACK;break;
        }
        return null;
    }
    static List<Method> resolve(Class<?> service)throws ReflectiveOperationException{
        List<Method> result=new ArrayList<>();Set<String> seen=new HashSet<>();
        EnumSet<Kind> missing=EnumSet.allOf(Kind.class);
        for(Class<?> type=service;type!=null;type=type.getSuperclass())for(Method method:type.getDeclaredMethods()){
            if(!seen.add(method.getName()+Arrays.toString(method.getParameterTypes())))continue;
            Kind kind=kind(method);if(kind==null)continue;
            method.setAccessible(true);result.add(method);missing.remove(kind);
        }
        // Do not expose an extended maximum when its write/policy path is absent.
        if(!missing.isEmpty())throw new NoSuchMethodException("AudioService missing capabilities: "+missing);
        return result;
    }
    static int deviceArgument(Method method){
        Kind kind=kind(method);
        return kind==Kind.SET||kind==Kind.ADJUST&&method.getParameterCount()==11?3:-1;
    }
    private static boolean signature(Method method,Class<?> result,String...parameters){
        if(method.getReturnType()!=result)return false;
        Class<?>[] actual=method.getParameterTypes();if(actual.length!=parameters.length)return false;
        for(int i=0;i<actual.length;i++)if(!actual[i].getName().equals(parameters[i]))return false;
        return true;
    }
    private AudioGainTargets(){}
}
