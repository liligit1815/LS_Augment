package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Inspected adapter families. An isolated obfuscated name is never a capability. */
final class ThemeServiceContract {
    final Method combined,async,theme,wallpaper,font,trialFlag,apply;
    private ThemeServiceContract(Class<?> type,String[] names)throws ReflectiveOperationException{
        combined=method(type,names[0],int.class,true,int.class);
        async=method(type,names[1],void.class,true,int.class);
        theme=reset(type,names[2]);wallpaper=reset(type,names[3]);font=reset(type,names[4]);
        trialFlag=method(type,names[5],void.class,true,int.class);
        apply=method(type,names[6],int.class,false,int.class,String.class,String.class);
    }
    static ThemeServiceContract resolve(Class<?> type)throws ReflectiveOperationException{
        ThemeServiceContract found=null;
        for(String[] names:new String[][]{{"X","a0","Y","Z","U","b0","x"},{"Z","c0","a0","b0","W","d0","y"}}){
            ThemeServiceContract candidate;
            try{candidate=new ThemeServiceContract(type,names);}catch(NoSuchMethodException absent){continue;}
            if(found!=null)throw new NoSuchMethodException("Ambiguous theme reset/apply contract");
            found=candidate;
        }
        if(found==null)throw new NoSuchMethodException("Missing complete theme reset, trial-flag and resource-apply capability");
        return found;
    }
    private static Method reset(Class<?> type,String name)throws NoSuchMethodException{
        try{return method(type,name,int.class,true);}catch(NoSuchMethodException absent){return method(type,name,int.class,true,int.class);}
    }
    private static Method method(Class<?> type,String name,Class<?> result,boolean isStatic,Class<?>...args)throws NoSuchMethodException{
        for(Class<?> c=type;c!=null;c=c.getSuperclass())try{
            Method m=c.getDeclaredMethod(name,args);
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())!=isStatic||Modifier.isAbstract(m.getModifiers())||m.isSynthetic())break;
            m.setAccessible(true);return m;
        }catch(NoSuchMethodException absent){/* Also accept inherited vendor contracts. */}
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
}
