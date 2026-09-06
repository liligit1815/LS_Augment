package ls.augment.com.hook;

import java.lang.reflect.*;

/** Named methods plus exact argument compatibility; never invokes a random overload. */
final class TargetReflection {
    static Object call(Object owner,String name,Object...args) throws ReflectiveOperationException {
        Class<?> type=owner instanceof Class?(Class<?>)owner:owner.getClass();
        java.util.List<Method> methods=new java.util.ArrayList<>();
        for(Class<?> c=type;c!=null;c=c.getSuperclass())java.util.Collections.addAll(methods,c.getDeclaredMethods());
        // Room DAOs also inherit public default methods from their interfaces.
        java.util.Collections.addAll(methods,type.getMethods());
        for(Method m:methods) {
            if(!m.getName().equals(name)||m.getParameterCount()!=args.length)continue;
            if(owner instanceof Class&&!Modifier.isStatic(m.getModifiers()))continue;
            Class<?>[] types=m.getParameterTypes();boolean match=true;
            for(int i=0;i<types.length;i++) {
                if(args[i]==null){if(types[i].isPrimitive())match=false;}
                else if(!box(types[i]).isInstance(args[i]))match=false;
            }
            if(!match)continue;
            m.setAccessible(true);return m.invoke(owner instanceof Class?null:owner,args);
        }
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
    static Object field(Object owner,String name) throws ReflectiveOperationException {
        for(Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();c!=null;c=c.getSuperclass())
            try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner instanceof Class?null:owner);}
            catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(name);
    }
    static Object singleton(Class<?> type) throws ReflectiveOperationException {
        for(String name:new String[]{"INSTANCE","Companion"})try{return field(type,name);}catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(type.getName()+" singleton");
    }
    static Class<?> box(Class<?> t){
        if(t==int.class)return Integer.class;if(t==long.class)return Long.class;
        if(t==boolean.class)return Boolean.class;if(t==float.class)return Float.class;
        if(t==double.class)return Double.class;if(t==byte.class)return Byte.class;
        if(t==short.class)return Short.class;if(t==char.class)return Character.class;return t;
    }
}
