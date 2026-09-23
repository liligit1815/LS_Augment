package ls.augment.com.hook;

import android.content.Context;
import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.concurrent.atomic.AtomicBoolean;
import static ls.augment.com.hook.OemHooks.*;

/** Opens OEM HOME candidates without changing CTS detection in permission/security flows. */
public final class DefaultLauncherRoleHook {
    private static final String PKG="com.android.permissioncontroller";
    private static final String KEY="ls_augment_rm_third_party_launcher";
    private static final AtomicBoolean RESOLVING=new AtomicBoolean();
    private static volatile boolean qualificationReady;
    private static final String FRAGMENT="com.android.permissioncontroller.role.ui.DefaultAppChildFragment";
    private static final ThreadLocal<Boolean> HOME_LIST=ThreadLocal.withInitial(()->false);
    private static final Map<Object,HomePage> PAGES=new WeakHashMap<>();
    private DefaultLauncherRoleHook(){ }
    public static int install(AugmentModule module,ClassLoader loader,String pkg){
        if(!PKG.equals(pkg))return 0;
        final HomeContract contract;
        try{
            contract=HomeContract.resolve(loader);
        }catch(ReflectiveOperationException unavailable){module.logFeatureError("HOME_CONTRACT_UNAVAILABLE",unavailable);return 0;}
        try{
        module.registerFeatureHook(module.prepareFeatureHook(contract.list,"home.candidate_list",false).intercept(chain->{
            Object owner=chain.getThisObject();
            boolean home=isHome(owner);
            Context context=home?context(owner,chain.getArgs()):null;
            boolean active=home&&FeatureSettings.enabled(context,KEY)&&matches(context);
            HomePage page=home?page(owner,context,contract):null;
            // Native LiveData can rebuild before the queued snapshot listener. Clear once at
            // the first OFF category so later categories keep any genuine OEM CTS result.
            if(page!=null&&Boolean.TRUE.equals(page.rendered)&&!active&&matches(context))set(owner,false,"isCtsPkg");
            boolean previous=HOME_LIST.get();
            // A nested non-HOME list must not inherit the outer HOME allowance.
            HOME_LIST.set(active);
            try{
                Object result=chain.proceed();
                if(page!=null)page.rendered=active;
                return result;
            }finally{HOME_LIST.set(previous);}
        }));
        installPageRefresh(module,contract);
        }catch(Exception unavailable){module.logFeatureError("HOME_LIST_INSTALL",unavailable);return 0;}
        resolveAsync(module,loader,FeatureSettings.from(null),contract);
        return 3;
    }

    private static boolean isHome(Object owner){return "android.app.role.HOME".equals(field(owner,"mRoleName"));}
    private static boolean matches(Context context){return qualificationReady;}
    private static void resolveAsync(AugmentModule module,ClassLoader loader,Context supplied,HomeContract contract){
        if(qualificationReady||!RESOLVING.compareAndSet(false,true))return;
        Thread worker=new Thread(()->{
            Context context=supplied;
            try{
                for(int attempt=0;context==null&&attempt<30;attempt++){
                    context=FeatureSettings.from(null);
                    if(context==null)Thread.sleep(1000);
                }
                if(context==null){RESOLVING.set(false);return;}
                if(!PKG.equals(context.getPackageName()))throw new IllegalStateException("wrong HOME host");
                android.content.pm.ApplicationInfo info=context.getApplicationInfo();
                ArrayList<String> paths=new ArrayList<>();paths.add(info.sourceDir);
                if(info.splitSourceDirs!=null)java.util.Collections.addAll(paths,info.splitSourceDirs);
                String[] archives=paths.toArray(new String[0]);
                long[] stamps=archiveStamps(archives);
                HomeCandidateDexResolver.Target target=HomeCandidateDexResolver.find(archives,contract.list.getName());
                if(!java.util.Arrays.equals(stamps,archiveStamps(archives)))throw new IllegalStateException("HOME APK changed during lookup");
                Class<?> owner=Class.forName(target.className(),false,loader);
                Method predicate=HookCompatibility.method(owner,boolean.class,true,new String[]{target.name},String.class);
                module.registerFeatureHook(module.prepareFeatureHook(predicate,"home.candidate_qualification",false).intercept(chain->{
                    if(!HOME_LIST.get())return chain.proceed();
                    FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_rm_third_party_launcher_runtime","home_candidates_executed");
                    return true;
                }));
                qualificationReady=true;
                FeatureSettings.diagnostic(context,"ls_augment_rm_third_party_launcher_compat",
                        "resolved="+predicate.toGenericString()+"|list="+contract.list.getName()+"|semantic=cts_home_candidate|validation=pending");
                android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
                main.post(()->{
                    ArrayList<HomePage> pages;
                    synchronized(DefaultLauncherRoleHook.class){pages=new ArrayList<>(PAGES.values());}
                    for(HomePage page:pages)page.requestRefresh();
                });
            }catch(Exception error){
                module.logFeatureError("HOME_AUTO_RESOLVE",error);
                FeatureSettings.diagnostic(context,"ls_augment_rm_third_party_launcher_compat",
                        "unsupported="+error.getClass().getSimpleName()+":"+error.getMessage());
            }
        },"LSA-HomeCompatibility");
        worker.setDaemon(true);worker.start();
    }
    private static long[] archiveStamps(String[] paths){
        long[] stamps=new long[paths.length*2];
        for(int i=0;i<paths.length;i++){
            java.io.File file=new java.io.File(paths[i]);stamps[i*2]=file.length();stamps[i*2+1]=file.lastModified();
        }
        return stamps;
    }
    private static synchronized HomePage page(Object owner,Context context,HomeContract contract){
        HomePage page=PAGES.get(owner);
        if(page==null){page=new HomePage(owner,context,contract);PAGES.put(owner,page);}
        return page;
    }
    private static synchronized void removePage(Object owner){
        HomePage page=PAGES.remove(owner);if(page!=null)page.close();
    }
    private static void installPageRefresh(AugmentModule module,HomeContract contract){
            module.registerFeatureHook(module.prepareFeatureHook(contract.destroy,"home.page_destroy",false).intercept(chain->{
                removePage(chain.getThisObject());
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(contract.attach,"home.page_attach",false).intercept(chain->{
                Object result=chain.proceed(),owner=chain.getThisObject();
                if(isHome(owner))try{
                    Context context=context(owner,chain.getArgs());
                    // Refresh the first open page when background semantic lookup finishes.
                    page(owner,context,contract).attach();
                    resolveAsync(module,owner.getClass().getClassLoader(),context,contract);
                }catch(Exception error){module.logFeatureError("HOME_LIST_ATTACH",error);}
                return result;
            }));
    }

    /** Both inspected list shapes are exact contracts, including their refresh sources. */
    private static final class HomeContract{
        final Method list,refresh,attach,destroy;
        final Field model;
        final DataSource current,recommended;
        HomeContract(Method list,Method refresh,Method attach,Method destroy,Field model,
                DataSource current,DataSource recommended){
            this.list=list;this.refresh=refresh;this.attach=attach;this.destroy=destroy;
            this.model=model;this.current=current;this.recommended=recommended;
        }
        static HomeContract resolve(ClassLoader loader)throws ReflectiveOperationException{
            Class<?> fragment=Class.forName(FRAGMENT,false,loader);
            Class<?> preference=Class.forName("androidx.preference.PreferenceGroup",false,loader);
            Method modern=optional(fragment,"addApplicationPreferences",preference,List.class,android.util.ArrayMap.class,Context.class);
            Method legacy=optional(fragment,"onRoleChanged",List.class);
            if((modern==null)==(legacy==null))throw new NoSuchMethodException("missing or ambiguous HOME list contract");
            HookCompatibility.field(fragment,String.class,false,"mRoleName");
            HookCompatibility.field(fragment,boolean.class,false,"isCtsPkg");
            Class<?> model=Class.forName("com.android.permissioncontroller.role.ui.DefaultAppViewModel",false,loader);
            Field modelField=HookCompatibility.field(fragment,model,false,"mViewModel");
            Method attach=HookCompatibility.method(fragment,void.class,false,new String[]{"onActivityCreated"},Bundle.class);
            Method destroy=HookCompatibility.method(Class.forName("androidx.fragment.app.Fragment",false,loader),void.class,false,new String[]{"onDestroy"});
            Method list=modern==null?legacy:modern;
            Method refresh=modern==null?legacy:HookCompatibility.method(fragment,void.class,false,new String[]{"onApplicationListChanged"});
            return new HomeContract(list,refresh,attach,destroy,modelField,
                    new DataSource(model,modern==null?"getRoleLiveData":"getLiveData"),
                    modern==null?null:new DataSource(model,"getRecommendedLiveData"));
        }
        static Method optional(Class<?> owner,String name,Class<?>...args){
            try{return HookCompatibility.method(owner,void.class,false,new String[]{name},args);}
            catch(NoSuchMethodException absent){return null;}
        }
        Object[] refreshArgs(Object fragment)throws ReflectiveOperationException{
            Object viewModel=model.get(fragment);
            if(viewModel==null)return null;
            Object value=current.read(viewModel);
            if(!(value instanceof List))return null;
            if(recommended==null)return new Object[]{value};
            if(!(recommended.read(viewModel) instanceof List))return null;
            return new Object[0];
        }
    }
    private static final class DataSource{
        final Method getter,value;
        DataSource(Class<?> owner,String name)throws ReflectiveOperationException{
            getter=owner.getDeclaredMethod(name);
            if(Modifier.isStatic(getter.getModifiers())||Modifier.isAbstract(getter.getModifiers())
                    ||getter.getReturnType().isPrimitive())throw new NoSuchMethodException("invalid HOME data source: "+name);
            getter.setAccessible(true);
            // LiveData itself is obfuscated in one supported ROM; validate its API shape.
            value=HookCompatibility.method(getter.getReturnType(),Object.class,false,new String[]{"getValue"});
        }
        Object read(Object model)throws ReflectiveOperationException{
            Object data=getter.invoke(model);return data==null?null:value.invoke(data);
        }
    }

    private static final class HomePage{
        final WeakReference<Object> owner;
        final Context context;
        final HomeContract contract;
        final Handler main=new Handler(Looper.getMainLooper());
        final Runnable update=this::refresh;
        final Runnable listener=this::requestRefresh;
        Boolean rendered;
        boolean attached,closed,refreshing;
        HomePage(Object owner,Context context,HomeContract contract){
            this.owner=new WeakReference<>(owner);
            this.contract=contract;
            Context application=context==null?null:context.getApplicationContext();
            this.context=application==null?context:application;
        }
        void attach(){
            if(!closed&&!attached&&context!=null){
                attached=FeatureSettings.addSnapshotListener(context,listener);
            }
            requestRefresh();
        }
        void requestRefresh(){if(!closed){main.removeCallbacks(update);main.post(update);}}
        void close(){closed=true;attached=false;main.removeCallbacks(update);FeatureSettings.removeSnapshotListener(listener);}
        void refresh(){
            if(closed||refreshing)return;
            Object fragment=owner.get();
            if(fragment==null){close();return;}
            if(!isHome(fragment)||!FeatureSettings.hasVerifiedSnapshot(context)||!matches(context))return;
            boolean active=FeatureSettings.enabled(context,KEY);
            if(rendered!=null&&rendered==active)return;
            try{
                if(!Boolean.TRUE.equals(invoke(fragment,"isAdded"))||Boolean.TRUE.equals(invoke(fragment,"isRemoving")))return;
                Object activity=invoke(fragment,"getActivity");
                if(!(activity instanceof Activity)||((Activity)activity).isFinishing()||((Activity)activity).isDestroyed())return;
                // The controller has no own View. Its parent owns the actual preference screen.
                Object parent=invoke(fragment,"getParentFragment");
                if(parent==null||!(invoke(parent,"getView") instanceof View))return;
                Object[] args=contract.refreshArgs(fragment);
                if(args==null)return;
                refreshing=true;
                // The OEM ORs this flag across candidates. Recompute it when rebuilding after ON/OFF.
                set(fragment,false,"isCtsPkg");
                contract.refresh.invoke(fragment,args);
            }catch(Exception error){
                FeatureSettings.diagnostic(context,"ls_augment_rm_third_party_launcher_refresh_error",error.getClass().getSimpleName());
            }finally{refreshing=false;}
        }
    }
}
