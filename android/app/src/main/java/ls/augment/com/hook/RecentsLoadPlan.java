package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/** OEM List and List/change-id contracts. The native generation token is never replaced by a display ID. */
final class RecentsLoadPlan {
    static Method resolve(Class<?> type) throws NoSuchMethodException {
        for (Class<?>[] signature : new Class<?>[][]{{List.class}, {List.class, int.class}}) {
            for (Class<?> current=type; current!=null; current=current.getSuperclass()) {
                try {
                    Method method=current.getDeclaredMethod("applyLoadPlan",signature);
                    if(method.getReturnType()!=void.class||Modifier.isStatic(method.getModifiers())
                            ||Modifier.isAbstract(method.getModifiers()))continue;
                    method.setAccessible(true);return method;
                } catch (NoSuchMethodException absent) { }
            }
        }
        throw new NoSuchMethodException("applyLoadPlan(List) or applyLoadPlan(List,int)");
    }
    static Object[] replaceTasks(List<?> original,List<?> tasks) {
        Object[] args=original.toArray();args[0]=tasks;return args;
    }
    static void clear(Method method,Object view) throws ReflectiveOperationException {
        if(method.getParameterCount()==1){method.invoke(view,List.of());return;}
        for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())try{
            Field field=type.getDeclaredField("mAppliedTaskListChangeId");
            if(field.getType()!=int.class||Modifier.isStatic(field.getModifiers()))break;
            field.setAccessible(true);method.invoke(view,List.of(),field.getInt(view));return;
        }catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException("mAppliedTaskListChangeId:int");
    }
    private RecentsLoadPlan() { }
}
