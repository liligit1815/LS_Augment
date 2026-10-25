package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Inspected SystemUI Resource contracts. Unknown models never substitute an icon. */
final class IconResourceAccess {
    private final Method getter;
    private final Field field;
    final String description;
    private IconResourceAccess(Method getter,Field field,String description){
        this.getter=getter;this.field=field;this.description=description;
    }
    static IconResourceAccess resolve(Class<?> type){
        for(String name:new String[]{"getResId","getRes"}){
            for(Class<?> at=type;at!=null;at=at.getSuperclass())try{
                Method method=at.getDeclaredMethod(name);
                if(Modifier.isStatic(method.getModifiers())||Modifier.isAbstract(method.getModifiers())
                        ||method.isBridge()||method.isSynthetic()
                        ||method.getReturnType()!=int.class&&method.getReturnType()!=Integer.class)continue;
                method.setAccessible(true);return new IconResourceAccess(method,null,name);
            }catch(NoSuchMethodException ignored){ }
        }
        for(String name:new String[]{"resId","res"}){
            for(Class<?> at=type;at!=null;at=at.getSuperclass())try{
                Field field=at.getDeclaredField(name);
                if(Modifier.isStatic(field.getModifiers())||field.getType()!=int.class)continue;
                field.setAccessible(true);return new IconResourceAccess(null,field,name);
            }catch(NoSuchFieldException ignored){ }
        }
        return new IconResourceAccess(null,null,"unsupported: integer getResId/getRes/resId/res missing");
    }
    int read(Object value)throws ReflectiveOperationException{
        Object result=getter!=null?getter.invoke(value):field!=null?field.get(value):null;
        return result instanceof Integer&&(Integer)result>0?(Integer)result:0;
    }
}
