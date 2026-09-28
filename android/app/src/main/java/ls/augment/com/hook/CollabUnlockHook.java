package ls.augment.com.hook;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.File;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import ls.augment.com.CollabOptions;
import ls.augment.com.CollabPolicy;
import static ls.augment.com.hook.OemHooks.*;

/** Uses native, device-owned collaboration resources. No global property or resource mutation. */
public final class CollabUnlockHook {
    private static final String THEME_UTIL="com.zte.beautify.view.common.tools.Utilities";
    private static final String FP_PROCESS="com.zte.fingerprint.theme.FingerprintAnimProcess";
    private static final String FP_SERVICE_UTIL="com.fingerprint.sensorservice.utils.Utils";
    private static final String FP_SETTINGS_CONFIG="com.zte.fingerprint.config.OperatorConfig";
    private static final String FP_SERVICE_CONFIG="com.fingerprint.sensorservice.config.OperatorConfig";
    private static final Set<java.lang.reflect.Method> DEOPTIMIZED=ConcurrentHashMap.newKeySet();
    private static final String CHARGE="com.zte.feature.charging.ChargeUtils";
    private static final ThreadLocal<Boolean> NATIVE_FINGERPRINT=ThreadLocal.withInitial(()->false);
    // Keep the independent GOLDEN SAGA item separate from native flags 16 and 20.
    private static final ThreadLocal<Boolean> MATRIX_FINGERPRINT=ThreadLocal.withInitial(()->false);
    private static final Set<Boolean> FP_RETRY_SCHEDULED=Collections.synchronizedSet(new HashSet<>());
    private static final Set<String> LOGGED=Collections.synchronizedSet(new HashSet<>());
    private static final ConcurrentHashMap<String,String> DIAGNOSTIC_STATE=new ConcurrentHashMap<>();
    private CollabUnlockHook() { }

    public static int install(AugmentModule module,ClassLoader loader,String pkg){
        if("com.zte.beautify".equals(pkg))return theme(module,loader);
        if("com.zte.fingerprints".equals(pkg))return fingerprintWithRetry(module,loader,false);
        if("com.fingerprint.sensorservice".equals(pkg))return fingerprintWithRetry(module,loader,true);
        if("com.android.systemui".equals(pkg))return charging(module,loader);
        return 0;
    }

    private static int theme(AugmentModule module,ClassLoader loader){
        int count=methods(module,loader,THEME_UTIL,"getThemeResourceFeature",String.class,0,CollabOptions.THEME,chain->{
            Context c=context(chain.getThisObject(),chain.getArgs());String replacement=themeValue(module,c,false);
            return replacement==null?chain.proceed():replacement;
        });
        count+=methods(module,loader,THEME_UTIL,"getStringSystemProperties",String.class,1,CollabOptions.THEME,chain->{
            if(!"persist.vendor.custom.variant.id".equals(chain.getArg(0)))return chain.proceed();
            Context c=context(chain.getThisObject(),chain.getArgs());String replacement=themeValue(module,c,true);
            return replacement==null?chain.proceed():replacement;
        });
        return count;
    }
    private static String themeValue(AugmentModule module,Context c,boolean property){
        if(c==null)return null;
        int index=FeatureSettings.integer(c,CollabOptions.THEME_VARIANT,0,0,7);
        index=CollabPolicy.resolveThemeVariant(index,android.os.Build.DEVICE,android.os.Build.MODEL);
        if(index<0){report(module,c,"theme","unsupported_device");return null;}
        String feature=CollabPolicy.themeFeature(index);
        // Utilities selects the native resource variant. Its resource layout is not
        // verified, so filename guesses must not block this documented selector.
        report(module,c,"theme","native_variant_selected:"+feature+";resource_availability_unconfirmed");
        return property?CollabPolicy.themeProperty(index):feature;
    }

    private static int fingerprintWithRetry(AugmentModule module,ClassLoader loader,boolean service){
        int count=fingerprint(module,loader,service);
        // Some ROMs install the application loader after PackageReady. Retry against the
        // real context loader without globally hooking ClassLoader or unrelated methods.
        if(android.os.Looper.getMainLooper()!=null&&FP_RETRY_SCHEDULED.add(service)){
            android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
            handler.postDelayed(new Runnable(){int attempts;public void run(){
                Context c=FeatureSettings.from(null);
                ClassLoader actual=c==null?loader:c.getClassLoader();
                int installed=fingerprint(module,actual,service);
                reportFingerprintInstall(module,c,actual,service,installed);
                if((installed==0||c==null)&&++attempts<3)handler.postDelayed(this,2000);
            }},1000);
        }
        return count;
    }
    private static void reportFingerprintInstall(AugmentModule module,Context c,ClassLoader loader,boolean service,int count){
        String name=fingerprintOwner(loader,service);
        String state="registered="+count+";";
        try{
            Class<?> type=Class.forName(name,false,loader);List<String> candidates=new ArrayList<>();
            for(java.lang.reflect.Method method:type.getDeclaredMethods())
                if(method.getName().startsWith("isCustomizeFor")||method.getName().equals("getAllFpAnim"))candidates.add(method.toGenericString());
            state+="class_present;methods="+String.join("|",candidates);
        }catch(Throwable unavailable){state+="class_unavailable:"+unavailable.getClass().getSimpleName();}
        report(module,c,service?"fingerprint_service_install":"fingerprint_settings_install",state);
    }
    private static int fingerprint(AugmentModule module,ClassLoader loader,boolean service){
        String type=fingerprintOwner(loader,service);int count=0;
        boolean modern=type.endsWith("OperatorConfig");
        for(String method:new String[]{"isCustomizeForCN_IP_PB","isCustomizeForGENPBUS","isCustomizeForGENPBEU","isCustomizeForTTYE"})
            count+=fingerprintGate(module,loader,type,method,CollabOptions.FP_GOLD,false);
        count+=fingerprintGate(module,loader,type,"isCustomizeForWutheringWaves",CollabOptions.FP_CHUN,!modern);
        count+=fingerprintGate(module,loader,type,"isCustomizeForFighting",CollabOptions.FP_FIGHTING,false);
        count+=fingerprintGate(module,loader,type,modern?"isCustomizeForChisa":"isCustomizeForWutheringWaves809J",CollabOptions.FP_CHISA,false);
        count+=fingerprintGate(module,loader,type,"isCustomizeForLTY",CollabOptions.FP_LTY,false);
        if(modern)count+=fingerprintMatrixScopes(module,loader,service);
        if(!service){
            for(int argc:new int[]{1,6}){
            Class<?>[] parameters=fingerprintListParameters(loader,argc);
            if(parameters==null)continue;
            count+=methods(module,loader,FP_PROCESS,"getAllFpAnim",ArrayList.class,argc,"",chain->{
                Context c=context(chain.getThisObject(),chain.getArgs());
                if(!fingerprintEnabled(c))return chain.proceed();
                Object result;
                try{result=chain.proceed();}
                catch(Throwable missing){
                    if(missing instanceof VirtualMachineError||missing instanceof ThreadDeath)throw missing;
                    report(module,c,"fingerprint_list","native_style_failed:"+missing.getClass().getSimpleName());
                    boolean previous=NATIVE_FINGERPRINT.get();NATIVE_FINGERPRINT.set(true);
                    try{return chain.proceed();}finally{NATIVE_FINGERPRINT.set(previous);}
                }
                if(!(result instanceof List)||c==null)return result;
                ArrayList<Object> items=new ArrayList<>((List<?>)result);
                List<String> missingStyles=new ArrayList<>();
                if(modern&&FeatureSettings.enabled(c,CollabOptions.FP_CHUN))
                    if(!hasFingerprint(items,"com.zte.fingerprint.theme.normal.WutheringWaves"))missingStyles.add("WutheringWaves");
                if(modern&&FeatureSettings.enabled(c,CollabOptions.FP_GOLD))
                    if(!GoldFingerprintHook.append(c,loader,items))missingStyles.add("GoldenSaga");
                if(FeatureSettings.enabled(c,CollabOptions.FP_CHISA))
                    if(!appendFingerprint(c,loader,items,"com.zte.fingerprint.theme.normal.Chisa"))missingStyles.add("Chisa");
                if(FeatureSettings.enabled(c,CollabOptions.FP_LTY))
                    if(!appendFingerprint(c,loader,items,"com.zte.fingerprint.theme.normal.LTYIPAnimation"))missingStyles.add("LTYIPAnimation");
                for(Object item:items){
                    String label=fingerprintLabel(c,item);
                    if(label!=null)set(item,label,"fingerprintAnimName");
                }
                // Keep list completeness separate from boolean selector qualifications;
                // subsequent renderer checks must not erase a missing-style diagnosis.
                report(module,c,"fingerprint_list",missingStyles.isEmpty()?"native_list_ready":"native_list_incomplete:"+String.join(",",missingStyles));
                return items;
            },parameters);
            }
        }
        if(modern&&count>0)deoptimizeFingerprintCallers(module,loader,service);
        // The service gates select the OEM renderer's existing frame arrays for flags 16/20.
        // No guessed bitmap paths, drawable IDs, or persistent animation selections are written.
        return count;
    }
    private static String fingerprintOwner(ClassLoader loader,boolean service){
        String modern=service?FP_SERVICE_CONFIG:FP_SETTINGS_CONFIG;
        try{Class.forName(modern,false,loader);return modern;}
        catch(ClassNotFoundException|LinkageError absent){return service?FP_SERVICE_UTIL:FP_PROCESS;}
    }
    private static int fingerprintMatrixScopes(AugmentModule module,ClassLoader loader,boolean service){
        if(service){
            int count=matrixScope(module,loader,"com.fingerprint.sensorservice.view.FloatWindowAnimalView",
                    "setAuthAnimalBackground",new Class<?>[]{String.class},0);
            return count+matrixScope(module,loader,"com.fingerprint.sensorservice.view.FloatWindowSensorView",
                    "setSensorViewIconForRedMagic",new Class<?>[]{boolean.class,int.class,String.class},2);
        }
        int count=matrixScope(module,loader,FP_PROCESS,"createForceMatrixAnimation",
                new Class<?>[]{Context.class,boolean.class},-1);
        count+=methods(module,loader,"com.zte.fingerprint.theme.FingerprintAnimStyle","getName",String.class,1,"",chain->{
            Context c=context(chain.getThisObject(),chain.getArgs());
            String label=fingerprintLabel(c,chain.getThisObject());
            return label==null?chain.proceed():label;
        },new Class<?>[]{Context.class});
        return count;
    }
    private static int matrixScope(AugmentModule module,ClassLoader loader,String owner,String method,Class<?>[] args,int flagIndex){
        return methods(module,loader,owner,method,null,args.length,"",chain->{
            boolean previous=MATRIX_FINGERPRINT.get();
            MATRIX_FINGERPRINT.set(flagIndex<0||"16".equals(chain.getArg(flagIndex)));
            try{return chain.proceed();}finally{MATRIX_FINGERPRINT.set(previous);}
        },args);
    }
    private static boolean hasFingerprint(List<Object> items,String name){
        for(Object item:items)if(item!=null&&item.getClass().getName().equals(name))return true;
        return false;
    }
    private static String fingerprintLabel(Context c,Object item){
        if(item==null||NATIVE_FINGERPRINT.get())return null;
        String name=item.getClass().getName();
        if(name.equals("com.zte.fingerprint.theme.normal.WutheringWaves")&&FeatureSettings.enabled(c,CollabOptions.FP_CHUN))return "椿 · 鸣潮";
        if(GoldFingerprintHook.FLAG.equals(field(item,"fingerprintStyleFlag")))return GoldFingerprintHook.NAME;
        return null;
    }
    private static Class<?>[] fingerprintListParameters(ClassLoader loader,int argc){
        try{
            Class<?> process=Class.forName(FP_PROCESS,false,loader);
            Class<?>[] parameters=argc==1?new Class<?>[]{Context.class}:new Class<?>[]{Context.class,
                    Class.forName("com.zte.fingerprint.model.PhoneInfo",false,loader),boolean.class,String.class,boolean.class,boolean.class};
            java.lang.reflect.Method method=process.getDeclaredMethod("getAllFpAnim",parameters);
            return java.lang.reflect.Modifier.isStatic(method.getModifiers())&&method.getReturnType()==ArrayList.class?parameters:null;
        }catch(ReflectiveOperationException|LinkageError absent){return null;}
    }
    private static void deoptimizeFingerprintCallers(AugmentModule module,ClassLoader loader,boolean service){
        // These are the direct callers (and their list/playback entry points) in the supplied
        // Android 16 APKs. Re-evaluate the tiny static gates even when ART has inlined them.
        String[][] targets=service?new String[][]{
                {"com.fingerprint.sensorservice.view.FloatWindowAnimalView","setAuthAnimalBackground"},
                {"com.fingerprint.sensorservice.view.FloatWindowSensorView","setSensorViewIconForRedMagic","updateSensorViewIconForStyle"},
                {"com.fingerprint.sensorservice.view.FloatWindowManager","setAnimalByStyle"}
        }:new String[][]{
                {FP_PROCESS,"getAllFpAnim","createAllFpAnim","createAnimationInstances","createForceMatrixAnimation","addRedMagicAnimations","addNonRedMagicAnimations"},
                {"com.zte.fingerprint.theme.normal.FlameCipher","createAnimation"},
                {"com.zte.fingerprint.theme.FingerprintAnimStyle","playAnimation"},
                {"com.zte.fingerprint.theme.StyleFlag","getAnimStyleName"}
        };
        for(String[] target:targets)try{
            for(java.lang.reflect.Method method:Class.forName(target[0],false,loader).getDeclaredMethods())
                for(int i=1;i<target.length;i++)if(method.getName().equals(target[i])&&!DEOPTIMIZED.contains(method)){
                    if(module.deoptimize(method))DEOPTIMIZED.add(method);
                }
        }catch(ClassNotFoundException absent){/* Optional on older ROMs. */}
        catch(LinkageError|RuntimeException unavailable){module.logFeatureError("FP_DEOPT "+target[0],unavailable);}
    }
    private static int fingerprintGate(AugmentModule module,ClassLoader loader,String type,String method,String key,boolean lowerPriority){
        return methods(module,loader,type,method,boolean.class,0,"",chain->{
            Context c=context(chain.getThisObject(),chain.getArgs());
            if(NATIVE_FINGERPRINT.get())return chain.proceed();
            if(type.endsWith("OperatorConfig")&&key.equals(CollabOptions.FP_GOLD))
                return GoldFingerprintHook.scoped()?true:chain.proceed();
            if(MATRIX_FINGERPRINT.get()&&key.equals(CollabOptions.FP_GOLD)
                    &&(FeatureSettings.enabled(c,CollabOptions.FP_GOLD)||FeatureSettings.enabled(c,CollabOptions.FP_CHUN)))return false;
            if(!FeatureSettings.enabled(c,key))return chain.proceed();
            if(lowerPriority&&"gold".equals(CollabPolicy.fingerprintBranch(true,FeatureSettings.enabled(c,CollabOptions.FP_GOLD))))return false;
            report(module,c,"fingerprint",type.startsWith("com.fingerprint.sensorservice.")?"native_renderer_qualified":"native_selector_qualified");
            return true;
        });
    }
    private static boolean fingerprintEnabled(Context c){return FeatureSettings.enabled(c,CollabOptions.FP_CHISA)||FeatureSettings.enabled(c,CollabOptions.FP_CHUN)
            ||FeatureSettings.enabled(c,CollabOptions.FP_FIGHTING)||FeatureSettings.enabled(c,CollabOptions.FP_GOLD)||FeatureSettings.enabled(c,CollabOptions.FP_LTY);}
    private static boolean appendFingerprint(Context c,ClassLoader loader,List<Object> items,String name){
        for(Object item:items)if(item!=null&&item.getClass().getName().equals(name))return true;
        try{
            Class<?> type=Class.forName(name,false,loader);Constructor<?> constructor=type.getDeclaredConstructor();constructor.setAccessible(true);
            Object item=invoke(constructor.newInstance(),"create",c);
            if(item!=null){items.add(Math.min(1,items.size()),item);return true;}
        }catch(ReflectiveOperationException|RuntimeException missing){}
        return false;
    }

    private static int charging(AugmentModule module,ClassLoader loader){
        // Do not force isRedmagicConfigCustom: each frame is replaced only after a successful decode.
        // Keeping this native predicate untouched guarantees the original drawable path on failure.
        int count=0;
        for(int argc:new int[]{7,8})count+=methods(module,loader,CHARGE,"getChargeBitmapByIndex",Bitmap.class,argc,CollabOptions.CHARGING,chain->{
            List<Object> args=chain.getArgs();Context c=context(chain.getThisObject(),args);
            if(!(args.get(0) instanceof Integer)||!(args.get(1) instanceof Resources)||!(args.get(5) instanceof Boolean)||!(args.get(6) instanceof Integer))return chain.proceed();
            // The 8-argument OEM overload also draws layered middle/bottom animations; leave them intact.
            if(args.size()==8&&args.get(7)!=null)return chain.proceed();
            int index=(Integer)args.get(0),style=FeatureSettings.integer(c,CollabOptions.CHARGING_STYLE,0,0,1);
            String filename=CollabPolicy.chargeFilename(index,(Boolean)args.get(5),(Integer)args.get(6),style);
            if(filename==null)return chain.proceed();
            File file=new File(CollabPolicy.CHARGE_DIRECTORY,filename);
            BitmapFactory.Options options=args.get(4) instanceof BitmapFactory.Options?(BitmapFactory.Options)args.get(4):null;
            Bitmap bitmap=decodeFrame(file,options);
            if(bitmap==null){report(module,c,"charging","missing_or_invalid_frame:"+filename);return chain.proceed();}
            report(module,c,"charging","device_frames_ready");return bitmap;
        });
        return count;
    }
    private static Bitmap decodeFrame(File file,BitmapFactory.Options options){
        try{
            if(!file.isFile()||file.length()<=0||file.length()>8L*1024*1024||!file.getCanonicalPath().equals(file.getAbsolutePath()))return null;
            BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeFile(file.getPath(),bounds);
            if(bounds.outWidth<=0||bounds.outHeight<=0||(long)bounds.outWidth*bounds.outHeight>16_000_000)return null;
            return BitmapFactory.decodeFile(file.getPath(),options);
        }catch(RuntimeException|java.io.IOException invalid){return null;}
    }
    private static void report(AugmentModule module,Context context,String feature,String value){
        // Persist state changes independently of one-time log deduplication. Missing
        // frame names share one state so an absent sequence cannot flood the provider.
        String category=value.startsWith("missing_or_invalid_frame:")?"missing_or_invalid_frame":value;
        if(context!=null&&!category.equals(DIAGNOSTIC_STATE.put(feature,category)))
            FeatureSettings.diagnostic(context,"ls_augment_collab_"+feature+"_runtime",category);
        String key=feature+":"+category;
        if(LOGGED.size()<128&&LOGGED.add(key))module.logFeatureInfo("COLLAB "+feature+" "+value);
    }
}
