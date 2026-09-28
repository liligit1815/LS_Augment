package ls.augment.com.hook;

import android.content.Context;
import android.graphics.BitmapFactory;
import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.*;
import ls.augment.com.CollabOptions;
import ls.augment.com.CollabPolicy;
import static ls.augment.com.hook.OemHooks.*;

/** Render-level corrections for the verified Android 16 components. */
final class CollabRenderHook {
    private static final Map<Object,SensorBinding> SENSORS=new WeakHashMap<>();
    private static final Set<Method> DEOPT=new HashSet<>();
    private static final Set<Method> SENSOR_HOOKS=new HashSet<>();
    private static final ThreadLocal<Integer> CHARGE_COUNT=new ThreadLocal<>();
    static void install(AugmentModule module,ClassLoader loader,String pkg){
        if(pkg.equals("com.zte.fingerprints")){
            GoldFingerprintHook.installSettings(module,loader);
        }else if(pkg.equals("com.fingerprint.sensorservice")){
            GoldFingerprintHook.installSensor(module,loader);
            try {
            Method setter=Class.forName("com.fingerprint.sensorservice.view.FloatWindowAnimalView",false,loader).getDeclaredMethod("setAuthAnimalBackground",String.class);
            if(!SENSOR_HOOKS.add(setter))return;
            setter.setAccessible(true);
            // Keep a separate hook identity from the existing matrix qualification scope.
            module.registerFeatureHook(module.prepareFeatureHook(setter,"collab.gold.renderer",false).intercept(chain->{
                Object owner=chain.getThisObject();String flag=(String)chain.getArg(0);
                boolean custom=GoldFingerprintHook.FLAG.equals(flag);
                boolean previous=GoldFingerprintHook.enter(custom&&FeatureSettings.enabled(context(owner,null),CollabOptions.FP_GOLD));
                Object result;
                try{result=custom?chain.proceed(new Object[]{"20"}):chain.proceed();}
                finally{GoldFingerprintHook.leave(previous);}
                SensorBinding binding=SENSORS.get(owner);
                if(binding==null){binding=new SensorBinding(owner,module);SENSORS.put(owner,binding);
                    FeatureSettings.addSnapshotListener(context(owner,null),binding);}
                binding.flag=flag;binding.gold=FeatureSettings.enabled(context(owner,null),CollabOptions.FP_GOLD);
                FeatureSettings.diagnostic(context(owner,null),"ls_augment_collab_gold_renderer_selection","flag="+flag+";gold="+binding.gold);
                if(binding.gold&&custom)try{
                    Context c=context(owner,null);
                    int id=c.getResources().getIdentifier("fp_animal_flamecipher_godlensaga","array",c.getPackageName());
                    if(id!=0){Object frames=invoke(owner,"getData",id);invoke(field(owner,"authAnimal"),"setBitmapResourceID",frames);
                        FeatureSettings.diagnostic(c,"ls_augment_collab_gold_renderer_runtime","gold_flame_frames="+java.lang.reflect.Array.getLength(frames));}
                }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("GOLD_RENDER",error);}
                return result;
            }));
            }catch(ReflectiveOperationException|LinkageError error){module.logFeatureError("GOLD_RENDER_INSTALL",error);}
        }else if(pkg.equals("com.android.systemui"))charging(module,loader);
    }
    private static final class SensorBinding implements Runnable{
        final WeakReference<Object> owner;final AugmentModule module;String flag;boolean gold;
        SensorBinding(Object value,AugmentModule module){owner=new WeakReference<>(value);this.module=module;}
        public void run(){Object value=owner.get();if(value==null){FeatureSettings.removeSnapshotListener(this);return;}
            boolean next=FeatureSettings.enabled(context(value,null),CollabOptions.FP_GOLD);
            if(next==gold||flag==null)return;gold=next;
            try{invoke(value,"setAuthAnimalBackground",flag);}catch(ReflectiveOperationException error){module.logFeatureError("GOLD_REFRESH",error);}
        }
    }
    private static void charging(AugmentModule module,ClassLoader loader){
        String view="com.zte.feature.charging.ChargingView";
        methods(module,loader,view,"startShowCharging",void.class,0,CollabOptions.CHARGING,chain->{
            Object owner=chain.getThisObject();Context c=context(owner,null);
            int count=0;
            try{
                boolean fast=Boolean.TRUE.equals(invoke(owner,"isFastCharging"));
                Object plug=field(owner,"mPlugType");int style=FeatureSettings.integer(c,CollabOptions.CHARGING_STYLE,0,0,1);
                count=frameCount(fast,plug instanceof Integer?(Integer)plug:1,style);
            }catch(ReflectiveOperationException|RuntimeException error){module.logFeatureError("CHARGE_SEQUENCE",error);}
            if(count<2)return chain.proceed();
            Integer previous=CHARGE_COUNT.get();CHARGE_COUNT.set(count);
            try{return chain.proceed();}finally{if(previous==null)CHARGE_COUNT.remove();else CHARGE_COUNT.set(previous);}
        },new Class<?>[]{});
        methods(module,loader,"com.zte.feature.charging.ChargeUtils","isRedmagicConfigCustom",boolean.class,0,"",chain->
                CHARGE_COUNT.get()!=null?true:chain.proceed(),new Class<?>[]{});
        methods(module,loader,view,"getConfigDrawableSize",int.class,0,"",chain->
                CHARGE_COUNT.get()!=null?CHARGE_COUNT.get():chain.proceed(),new Class<?>[]{});
        // A themed charging route can bypass ChargeUtils entirely. Select native frames only
        // inside a validated launch, not by changing system-wide collaboration properties.
        methods(module,loader,view,"getIsUsingThemeCharging",boolean.class,0,"",chain->
                CHARGE_COUNT.get()!=null?false:chain.proceed(),new Class<?>[]{});
        for(String name:new String[]{view,view+"$MemoryCache","com.zte.feature.charging.ChargeUtils"})try{
            for(Method method:Class.forName(name,false,loader).getDeclaredMethods())
                if(!DEOPT.contains(method)&&module.deoptimize(method))DEOPT.add(method);
        }catch(ClassNotFoundException|LinkageError missing){module.logFeatureError("CHARGE_DEOPT",missing);}
    }
    static int frameCount(boolean fast,int plug,int style){
        int count=0;
        for(;count<1000;count++){
            File file=new File(CollabPolicy.CHARGE_DIRECTORY,CollabPolicy.chargeFilename(count,fast,plug,style));
            if(!file.isFile())break;
            BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;
            BitmapFactory.decodeFile(file.getPath(),bounds);
            if(bounds.outWidth<=0||bounds.outHeight<=0||(long)bounds.outWidth*bounds.outHeight>16_000_000)return 0;
        }
        return count;
    }
}
