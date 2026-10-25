package ls.augment.com.hook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Calendar;

/** The native TextClock and ZTE AnimatableClockView format contracts, including subclasses. */
final class AodClockAccess {
    final String adapter;
    private final Field active,calendar;
    private final Method get12,get24,set12,set24,zone,refresh;
    private AodClockAccess(Field active,Field calendar,Method get12,Method get24,
            Method set12,Method set24,Method zone,Method refresh){
        this.active=active;this.calendar=calendar;this.get12=get12;this.get24=get24;
        this.set12=set12;this.set24=set24;this.zone=zone;this.refresh=refresh;
        adapter=calendar==null?"text_clock":"zte_animatable_clock";
    }
    static boolean aodOwner(Class<?> type){
        for(Class<?> at=type;at!=null;at=at.getSuperclass()){
            String name=at.getName();
            if(name.startsWith("com.zte.feature.doze.AodClock.")
                    ||name.startsWith("com.zte.mifavor.keyguard.dualclock.Aod"))return true;
        }
        return false;
    }
    static AodClockAccess resolve(Class<?> type){
        try{return new AodClockAccess(field(type,"mFormat",CharSequence.class),null,
                method(type,"getFormat12Hour",CharSequence.class),method(type,"getFormat24Hour",CharSequence.class),
                method(type,"setFormat12Hour",void.class,CharSequence.class),method(type,"setFormat24Hour",void.class,CharSequence.class),
                method(type,"getTimeZone",String.class),null);
        }catch(ReflectiveOperationException ignored){ }
        // Do not treat arbitrary TextViews with a field called format as clocks.
        for(Class<?> at=type;at!=null;at=at.getSuperclass())if(at.getName().equals("com.zte.mifavor.keyguard.clock.AnimatableClockView"))try{
            return new AodClockAccess(field(at,"format",CharSequence.class),field(at,"calendar",Calendar.class),
                    null,null,null,null,null,method(at,"refreshTime",void.class));
        }catch(ReflectiveOperationException ignored){return null;}
        return null;
    }
    CharSequence active(Object view)throws IllegalAccessException{return (CharSequence)active.get(view);}
    CharSequence format(Object view,boolean hour24)throws ReflectiveOperationException{
        return calendar!=null?active(view):(CharSequence)(hour24?get24:get12).invoke(view);
    }
    void format(Object view,boolean hour24,CharSequence value)throws ReflectiveOperationException{
        if(calendar!=null){active.set(view,value);refresh.invoke(view);}
        else (hour24?set24:set12).invoke(view,value);
    }
    String zone(Object view)throws ReflectiveOperationException{
        if(calendar==null)return (String)zone.invoke(view);
        Calendar value=(Calendar)calendar.get(view);return value==null?null:value.getTimeZone().getID();
    }
    private static Field field(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException{
        for(Class<?> at=type;at!=null;at=at.getSuperclass())try{
            Field f=at.getDeclaredField(name);
            if(f.getType()!=expected||Modifier.isStatic(f.getModifiers()))throw new IllegalAccessException(name+" type");
            f.setAccessible(true);return f;
        }catch(NoSuchFieldException ignored){ }
        throw new NoSuchFieldException(name);
    }
    private static Method method(Class<?> type,String name,Class<?> result,Class<?>...args)throws ReflectiveOperationException{
        for(Class<?> at=type;at!=null;at=at.getSuperclass())try{
            Method m=at.getDeclaredMethod(name,args);
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+" signature");
            m.setAccessible(true);return m;
        }catch(NoSuchMethodException ignored){ }
        throw new NoSuchMethodException(name);
    }
}
