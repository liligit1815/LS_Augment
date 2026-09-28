package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Resources;
import java.util.List;
import ls.augment.com.CollabOptions;
import static ls.augment.com.hook.OemHooks.*;

/** Independent persisted style. The stock FlameCipher item and flag 20 stay native. */
final class GoldFingerprintHook {
    static final String FLAG="20376", NAME="臻金 · GOLDEN SAGA";
    static final int NAME_ID=0x7e002076;
    private static final ThreadLocal<Boolean> SCOPE=ThreadLocal.withInitial(()->false);
    private static final java.util.Set<java.lang.reflect.Method> SENSOR=new java.util.HashSet<>();
    static boolean scoped(){return SCOPE.get();}
    static boolean enter(boolean gold){boolean old=SCOPE.get();SCOPE.set(gold);return old;}
    static void leave(boolean previous){SCOPE.set(previous);}

    static boolean append(Context c,ClassLoader loader,List<Object> items){
        for(Object item:items)if(FLAG.equals(field(item,"fingerprintStyleFlag")))return true;
        Resources res=c.getResources();
        int animation=res.getIdentifier("sensorui_flamecipher_goldensage_withdot_red_magic","drawable",c.getPackageName());
        int icon=res.getIdentifier("redmagic_11_saga","drawable",c.getPackageName());
        int idle=res.getIdentifier("finger_press_flamechiper_goldensaga_withdot_0001_","drawable",c.getPackageName());
        if(animation==0||icon==0||idle==0)return false;
        try{
            Object item=Class.forName("com.zte.fingerprint.theme.normal.FlameCipher",false,loader).getDeclaredConstructor().newInstance();
            invoke(item,"create",c);
            if(!set(item,FLAG,"fingerprintStyleFlag")||!set(item,NAME,"fingerprintAnimName")
                    ||!set(item,NAME_ID,"fingerprintAnimNameId")||!set(item,animation,"fingerprintDrawableId")
                    ||!set(item,icon,"fingerprintAnimIconId")||!set(item,idle,"fingerprintDefaultDrawableId"))return false;
            int position=items.size();
            for(int i=0;i<items.size();i++)if("20".equals(field(items.get(i),"fingerprintStyleFlag"))){position=i;break;}
            items.add(position,item);
            FeatureSettings.diagnostic(c,"ls_augment_gold_independent_runtime","独立条目="+FLAG+";原厂焰旋流光=20");
            return true;
        }catch(ReflectiveOperationException|RuntimeException error){return false;}
    }

    static void installSettings(AugmentModule module,ClassLoader loader){
        // The OEM carousel uses TextView.setText(resourceId), bypassing getName().
        // A private synthetic ID labels only our added item; stock resource IDs remain intact.
        for(String name:new String[]{"getText","getString"})
            methods(module,loader,"android.content.res.Resources",name,null,1,"",chain->
                    Integer.valueOf(NAME_ID).equals(chain.getArg(0))?NAME:chain.proceed(),new Class<?>[]{int.class});
        methods(module,loader,"com.zte.fingerprint.theme.StyleFlag","getAnimStyleName",String.class,2,"",chain->
                FLAG.equals(chain.getArg(0))?NAME:chain.proceed(),new Class<?>[]{String.class,Context.class});
    }

    static void installSensor(AugmentModule module,ClassLoader loader){
        try{
        java.lang.reflect.Method method=Class.forName("com.fingerprint.sensorservice.view.FloatWindowSensorView",false,loader)
                .getDeclaredMethod("setSensorViewIconForRedMagic",boolean.class,int.class,String.class);
        if(!SENSOR.add(method))return;
        method.setAccessible(true);
        module.registerFeatureHook(module.prepareFeatureHook(method,"collab.gold.independent_icon",false).intercept(chain->{
            if(!FLAG.equals(chain.getArg(2)))return chain.proceed();
            boolean previous=enter(FeatureSettings.enabled(context(chain.getThisObject(),null),CollabOptions.FP_GOLD));
            try{return chain.proceed(new Object[]{chain.getArg(0),chain.getArg(1),"20"});}
            finally{leave(previous);}
        }));
        }catch(ReflectiveOperationException|LinkageError error){module.logFeatureError("GOLD_ICON_INSTALL",error);}
    }
}
