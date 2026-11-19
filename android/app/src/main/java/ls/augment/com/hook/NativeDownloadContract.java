package ls.augment.com.hook;

import java.lang.reflect.*;
import java.util.Arrays;

/** All required provider capabilities are resolved before any hook is registered. */
final class NativeDownloadContract {
    final Method update,grouping,refresh,created;
    final Field context;
    final String[] projection;
    final String listAction;
    NativeDownloadContract(Class<?> notifier,Class<?> provider,Class<?> receiver,Class<?> constants,Class<?> query,Class<?> impl,
            Class<?> contextType,Class<?> cursorType,Class<?> uriType,Class<?> providerBase,Class<?> receiverBase,Object allUri)throws ReflectiveOperationException{
        if(!providerBase.isAssignableFrom(provider)||!receiverBase.isAssignableFrom(receiver))throw new NoSuchMethodException("provider/receiver types");
        update=method(notifier,"updateWithLocked",void.class,false,cursorType);
        grouping=method(notifier,"buildNotificationTag",String.class,true,cursorType);
        refresh=method(notifier,"update",void.class,false);
        created=method(provider,"onCreate",boolean.class,false);
        context=field(notifier,"mContext",contextType,false);
        String[] original=(String[])field(query,"PROJECTION",String[].class,true).get(null);
        if(original==null)throw new NoSuchFieldException("native grouping projection");projection=original.clone();
        if(projection.length<4||!Arrays.equals(Arrays.copyOf(projection,4),new String[]{"_id","status","visibility","notificationpackage"}))throw new NoSuchFieldException("native grouping projection");
        for(String name:new String[]{"STATUS_PENDING","STATUS_RUNNING","STATUS_PAUSED_BY_APP","CONTROL_RUN","CONTROL_PAUSED"}){
            int expected=switch(name){case "STATUS_PENDING"->190;case "STATUS_RUNNING"->192;case "STATUS_PAUSED_BY_APP"->193;case "CONTROL_PAUSED"->1;default->0;};
            if(field(impl,name,int.class,true).getInt(null)!=expected)throw new NoSuchFieldException("provider control constant "+name);
        }
        if(!allUri.equals(field(impl,"ALL_DOWNLOADS_CONTENT_URI",uriType,true).get(null)))throw new NoSuchFieldException("provider authority");
        listAction=(String)field(constants,"ACTION_LIST",String.class,true).get(null);
        if(listAction==null||listAction.isEmpty())throw new NoSuchFieldException("native list action");
    }
    static Method method(Class<?> type,String name,Class<?> result,boolean isStatic,Class<?>... arguments)throws NoSuchMethodException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{
            Method method=c.getDeclaredMethod(name,arguments);
            if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())!=isStatic||Modifier.isAbstract(method.getModifiers()))throw new NoSuchMethodException(name+" shape");
            method.setAccessible(true);return method;
        }catch(NoSuchMethodException missing){
            for(Method declared:c.getDeclaredMethods())if(declared.getName().equals(name)&&Arrays.equals(declared.getParameterTypes(),arguments))throw missing;
        }
        throw new NoSuchMethodException(name);
    }
    static Field field(Class<?> type,String name,Class<?> expected,boolean isStatic)throws NoSuchFieldException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{
            Field field=c.getDeclaredField(name);
            if(field.getType()!=expected||Modifier.isStatic(field.getModifiers())!=isStatic)throw new NoSuchFieldException(name+" type");
            field.setAccessible(true);return field;
        }catch(NoSuchFieldException missing){for(Field declared:c.getDeclaredFields())if(declared.getName().equals(name))throw missing;}
        throw new NoSuchFieldException(name);
    }
}
