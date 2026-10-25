package ls.augment.com.hook;

import java.lang.reflect.Field;

/** Only the verified OEM presentation flags; never alter package/session verdicts. */
final class InstallerWarningContract {
    enum Result { COMPLETE, LEGACY_PURE_ONLY, UNAVAILABLE }
    static Result apply(Object flags) throws IllegalAccessException {
        if (flags == null) return Result.UNAVAILABLE;
        String[] names={"hidePureModeSwitchLayout","hideWarningLayout","showRiskCheckbox","showSwlimitLearnMore","cleanBgColor"};
        Field[] fields=new Field[names.length];
        for(int i=0;i<names.length;i++) {
            for(Class<?> type=flags.getClass();type!=null;type=type.getSuperclass()) {
                try { fields[i]=type.getDeclaredField(names[i]); break; }
                catch(NoSuchFieldException ignored) { }
            }
            if(fields[i]==null||fields[i].getType()!=boolean.class
                    ||java.lang.reflect.Modifier.isStatic(fields[i].getModifiers())
                    ||java.lang.reflect.Modifier.isFinal(fields[i].getModifiers()))return legacy(flags);
            fields[i].setAccessible(true);
        }
        boolean[] values={true,true,false,false,true};
        boolean[] original=new boolean[fields.length];
        for(int i=0;i<fields.length;i++)original[i]=fields[i].getBoolean(flags);
        try { for(int i=0;i<fields.length;i++)fields[i].setBoolean(flags,values[i]); }
        catch(IllegalAccessException|RuntimeException failure) {
            for(int i=0;i<fields.length;i++)fields[i].setBoolean(flags,original[i]);
            throw failure;
        }
        return Result.COMPLETE;
    }
    private static Result legacy(Object flags)throws IllegalAccessException {
        for(Class<?> type=flags.getClass();type!=null;type=type.getSuperclass())try{
            Field pure=type.getDeclaredField("hidePureModeSwitchLayout");
            if(pure.getType()!=boolean.class||java.lang.reflect.Modifier.isStatic(pure.getModifiers())
                    ||java.lang.reflect.Modifier.isFinal(pure.getModifiers()))return Result.UNAVAILABLE;
            pure.setAccessible(true);pure.setBoolean(flags,true);return Result.LEGACY_PURE_ONLY;
        }catch(NoSuchFieldException absent){/* Preserve the inherited, previously supported path. */}
        return Result.UNAVAILABLE;
    }
    private InstallerWarningContract() { }
}
