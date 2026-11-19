package ls.augment.com.hook;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.res.Configuration;
import android.os.PowerManager;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/** Read the old ordinary host's real lifecycle; missing modern flags are not false. */
final class IslandGestureHostState {
    private static String lastMissing="";
    static boolean allowed(Context context,Object engine,boolean verifiedLegacyLifecycle){
        if(context==null||engine==null)return false;
        try{
            PowerManager power=context.getSystemService(PowerManager.class);
            KeyguardManager keyguard=context.getSystemService(KeyguardManager.class);
            if(power==null||keyguard==null||!power.isInteractive()||keyguard.isKeyguardLocked()
                    ||context.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE)return false;
            if(!Boolean.TRUE.equals(required(engine,"mIsDynamicIslandEnable",boolean.class))
                    ||!Boolean.FALSE.equals(required(engine,"mOnKeyguard",boolean.class))
                    ||!Boolean.FALSE.equals(required(engine,"mAODVisibility",boolean.class)))return false;
            Object rotation=required(engine,"mCurRotation",int.class);
            if(!(rotation instanceof Integer)||((Integer)rotation!=0&&(Integer)rotation!=2))return false;
            Object interactive=value(engine,"mInteractive",boolean.class);
            if(interactive==null&&!verifiedLegacyLifecycle)throw new NoSuchFieldException("unverified_legacy_interactive");
            if(interactive!=null&&!Boolean.TRUE.equals(interactive))return false;
            if(verifiedLegacyLifecycle){
                Object expanded=required(engine,"mIsExpanded",boolean.class),chip=required(engine,"mChipVisibility",boolean.class);
                // The old engine hides its island only when both native states are true.
                if(Boolean.TRUE.equals(expanded)&&Boolean.TRUE.equals(chip))return false;
            }
            for(String flag:new String[]{"mQsPanelExpanded","mControlPanelExpanded","mPayJoyControlled","mSuperPowerSave"})
                if(Boolean.TRUE.equals(value(engine,flag,boolean.class)))return false;
            return true;
        }catch(ReflectiveOperationException|RuntimeException unavailable){
            String missing=engine.getClass().getName()+":"+unavailable.getClass().getSimpleName()+":"+unavailable.getMessage();
            if(!missing.equals(lastMissing)){lastMissing=missing;FeatureRuntimeLog.event("ISLAND_GESTURE","host_state_unavailable:"+missing);}
            return false;
        }
    }
    private static Object required(Object owner,String name,Class<?> expected)throws ReflectiveOperationException{
        Object value=value(owner,name,expected);if(value==null)throw new NoSuchFieldException(name+":"+expected.getSimpleName());return value;
    }
    private static Object value(Object owner,String name,Class<?> expected)throws ReflectiveOperationException{
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass()){
            Field field;
            try{field=type.getDeclaredField(name);}catch(NoSuchFieldException absent){continue;}
            if(field.getType()!=expected||Modifier.isStatic(field.getModifiers()))throw new NoSuchFieldException(name+":"+expected.getSimpleName());
            field.setAccessible(true);return field.get(owner);
        }
        return null;
    }
    private IslandGestureHostState(){}
}
