package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Consumer;

/** Owns only the extra WindowManager move animation policy, never the island's view animations. */
final class IslandWindowMotion {
    private final Map<Object,Boolean> originals=new WeakHashMap<>();
    private static final ClassValue<Access> ACCESS=new ClassValue<>() {
        @Override protected Access computeValue(Class<?> type){return new Access(type);}
    };

    boolean suppress(Object params,Consumer<String> report) {
        if(params==null)return false;
        Access access=ACCESS.get(params.getClass());
        if(access.missing!=null){report.accept("move_animation_unavailable:"+access.missing);return false;}
        try{
            if(!originals.containsKey(params))originals.put(params,access.read(params));
            access.write(params,false);
            if(access.read(params))throw new IllegalStateException("readback_enabled");
            report.accept("move_animation_suppressed:"+access.route);return true;
        }catch(ReflectiveOperationException|RuntimeException failure){
            restore(params,report);
            report.accept("move_animation_failed:"+failure.getClass().getSimpleName());return false;
        }
    }

    void restore(Object params,Consumer<String> report) {
        Boolean original=originals.get(params);if(original==null)return;
        try{
            Access access=ACCESS.get(params.getClass());access.write(params,original);
            if(access.read(params)!=original)throw new IllegalStateException("restore_readback");
            originals.remove(params);report.accept("move_animation_restored");
        }catch(ReflectiveOperationException|RuntimeException failure){
            report.accept("move_animation_restore_failed:"+failure.getClass().getSimpleName());
        }
    }
    void restoreAll(Consumer<String> report) {
        for(Object params:new ArrayList<>(originals.keySet()))restore(params,report);
    }

    private static final class Access {
        Method getter,setter;Field flags;int mask;String route,missing;
        Access(Class<?> type){
            try{
                getter=method(type,"canPlayMoveAnimation",boolean.class);
                setter=method(type,"setCanPlayMoveAnimation",void.class,boolean.class);
                if(getter!=null&&setter!=null){route="methods";return;}
                getter=null;setter=null;
                flags=field(type,"privateFlags");Field constant=field(type,"PRIVATE_FLAG_NO_MOVE_ANIMATION");
                if(flags==null||flags.getType()!=int.class||Modifier.isStatic(flags.getModifiers())
                        ||constant==null||constant.getType()!=int.class||!Modifier.isStatic(constant.getModifiers())
                        ||!Modifier.isFinal(constant.getModifiers()))throw new NoSuchFieldException("move_flag_contract");
                mask=constant.getInt(null);
                if(Integer.bitCount(mask)!=1)throw new IllegalStateException("move_flag_not_single_bit");
                route="named_flag";
            }catch(ReflectiveOperationException|RuntimeException failure){missing=failure.getClass().getSimpleName();}
        }
        boolean read(Object params)throws ReflectiveOperationException {
            return getter!=null?(Boolean)getter.invoke(params):(flags.getInt(params)&mask)==0;
        }
        void write(Object params,boolean enabled)throws ReflectiveOperationException {
            if(setter!=null)setter.invoke(params,enabled);
            else{int value=flags.getInt(params);flags.setInt(params,enabled?value&~mask:value|mask);}
        }
        private static Method method(Class<?> type,String name,Class<?> result,Class<?>... args){
            for(Class<?> current=type;current!=null;current=current.getSuperclass())try{
                Method method=current.getDeclaredMethod(name,args);
                if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers()))return null;
                method.setAccessible(true);return method;
            }catch(NoSuchMethodException ignored){}
            return null;
        }
        private static Field field(Class<?> type,String name){
            for(Class<?> current=type;current!=null;current=current.getSuperclass())try{
                Field field=current.getDeclaredField(name);field.setAccessible(true);return field;
            }catch(NoSuchFieldException ignored){}
            return null;
        }
    }
}
