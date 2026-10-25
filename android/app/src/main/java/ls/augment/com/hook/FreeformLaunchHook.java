package ls.augment.com.hook;

import android.app.ActivityOptions;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import java.lang.reflect.Method;
import java.util.Set;
import ls.augment.com.AppPackageSet;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.FreeformLaunchPolicy;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Runs after Android's resolution and permission checks, under the existing launch lock. */
final class FreeformLaunchHook {
    private static final String STARTER="com.android.server.wm.ActivityStarter";
    private static final ThreadLocal<Launch> ACTIVE=new ThreadLocal<>();
    private static Method markWindowReply;
    private static volatile ConfigSnapshot cached;
    private static volatile Set<String> excluded=java.util.Collections.emptySet();


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader){
        try{
            Class<?> starter=Class.forName(STARTER,false,loader);
            // RedMagic only accepts mode 5 tasks marked as its native WindowReply.
            // Resolve this before installing, so an unsupported ROM retains normal launches.
            Class<?> record=Class.forName("com.android.server.wm.ActivityRecord",false,loader);
            markWindowReply=Class.forName("com.android.server.wm.TaskDisplayAreaMifavor",false,loader)
                    .getDeclaredMethod("addWRIntentId_WindowReply_ActivityRecord",record);
            markWindowReply.setAccessible(true);
            // Verify both result-preservation methods before enabling result-based login launches.
            Method cancel=starter.getDeclaredMethod("sendNewTaskResultRequestIfNeeded");
            Method task=starter.getDeclaredMethod("computeTargetTask");
            cancel.setAccessible(true);task.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(cancel,"freeform.launch.keep_result",true).intercept(chain->{
                Launch active=ACTIVE.get();
                if(active!=null&&active.starter==chain.getThisObject()&&active.resultExpected)return null;
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(task,"freeform.launch.separate_task",true).intercept(chain->{
                Launch active=ACTIVE.get();
                if(active!=null&&active.starter==chain.getThisObject()&&active.resultExpected)return null;
                return chain.proceed();
            }));
            module.deoptimize(cancel);module.deoptimize(task);
            int count=2;
            for(Method method:starter.getDeclaredMethods()){
                Class<?>[] types=method.getParameterTypes();
                if(!method.getName().equals("startActivityInner")||types.length<7
                        ||!types[0].getName().equals("com.android.server.wm.ActivityRecord")
                        ||types[1]!=types[0]||types[5]!=ActivityOptions.class)continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,"freeform.launch.redirect",true).intercept(chain->{
                    Object[] args=chain.getArgs().toArray();Launch launch=null;
                    try{launch=prepare(chain.getThisObject(),args);}
                    catch(Throwable failure){module.logFeatureError("FREEFORM_REDIRECT_PREPARE",failure);
                        FeatureSettings.diagnostic(context(field(chain.getThisObject(),"mService")),
                                "ls_augment_freeform_redirect_error",failure.toString());}
                    if(launch==null)return chain.proceed();
                    Launch previous=ACTIVE.get();ACTIVE.set(launch);
                    try{return chain.proceed(args);}
                    finally{if(previous==null)ACTIVE.remove();else ACTIVE.set(previous);}
                }));
                module.deoptimize(method);count++;
            }
            // Callers can inline the result cancellation and target-task computation.
            for(Method method:starter.getDeclaredMethods())if(method.getName().equals("setInitialState")
                    ||method.getName().equals("startActivityUnchecked"))module.deoptimize(method);
            module.logFeatureInfo("FREEFORM_REDIRECT_READY hooks="+count);return count>2?count:0;
        }catch(Throwable failure){module.logFeatureError("FREEFORM_REDIRECT_UNAVAILABLE",failure);return 0;}
    }

    private static Launch prepare(Object starter,Object[] args)throws ReflectiveOperationException{
        Object service=field(starter,"mService");Context context=context(service);
        ConfigSnapshot snapshot=FeatureSettings.snapshot(context);
        boolean login=ConfigSchema.truthy(snapshot.get(ConfigSchema.FREEFORM_GAME_LOGIN));
        boolean external=ConfigSchema.truthy(snapshot.get(ConfigSchema.FREEFORM_EXTERNAL_APPS));
        if(!login&&!external)return null;
        if(snapshot!=cached){
            excluded=AppPackageSet.parse(snapshot.get(ConfigSchema.FREEFORM_EXCLUDED_APPS));cached=snapshot;
        }
        Object target=args[0],source=args[1];if(target==null)return null;
        if(source==null)source=foregroundCaller(starter,target);
        if(source==null)return skip(context,target,"no_foreground_caller");
        Object targetInfo=field(target,"info"),sourceInfo=field(source,"info"),rawIntent=field(target,"intent");
        if(!(targetInfo instanceof ActivityInfo)||!(sourceInfo instanceof ActivityInfo)||!(rawIntent instanceof Intent))return null;
        ActivityInfo to=(ActivityInfo)targetInfo,from=(ActivityInfo)sourceInfo;
        if(to.applicationInfo==null||from.applicationInfo==null)return null;
        Intent intent=(Intent)rawIntent;
        // Explicit task/display placement, embedded activities and special launch flows retain OEM behavior.
        if(args[6]!=null||(args.length>7&&args[7]!=null)||args[2]!=null||args[3]!=null
                ||intent.hasCategory(Intent.CATEGORY_HOME)
                ||(intent.getFlags()&(Intent.FLAG_ACTIVITY_FORWARD_RESULT|Intent.FLAG_ACTIVITY_LAUNCH_ADJACENT))!=0)return skip(context,target,"explicit_task_or_special_launch");
        ActivityOptions original=(ActivityOptions)args[5];
        if(original!=null){
            if(((Number)call(original,"getLaunchWindowingMode")).intValue()!=0
                    ||((Number)call(original,"getLaunchTaskId")).intValue()!=-1
                    ||((Number)call(original,"getLaunchDisplayId")).intValue()!=-1
                    ||call(original,"getLaunchRootTask")!=null)return skip(context,target,"explicit_window_or_display");
        }
        Object sourceResult=field(source,"resultTo");
        Object returnPackage=field(sourceResult,"packageName");
        boolean thirdParty=(to.applicationInfo.flags&(ApplicationInfo.FLAG_SYSTEM|ApplicationInfo.FLAG_UPDATED_SYSTEM_APP))==0;
        if(!FreeformLaunchPolicy.shouldOpen(login,external,from.packageName,to.packageName,
                Boolean.TRUE.equals(call(source,"isVisibleRequested")),
                Boolean.TRUE.equals(call(source,"isActivityTypeStandard")),
                Boolean.TRUE.equals(call(target,"isActivityTypeStandardOrUndefined")),thirdParty,
                false,isNativeGame(to),FreeformLaunchPolicy.loginTarget(to.packageName,to.name),
                excluded.contains(to.packageName)||excluded.contains(from.packageName),to.packageName.equals(returnPackage)))return skip(context,target,"policy;source="+from.packageName
                        +";visible="+call(source,"isVisibleRequested")+";source_standard="+call(source,"isActivityTypeStandard")
                        +";target_standard_or_undefined="+call(target,"isActivityTypeStandardOrUndefined")+";third_party="+thirdParty);
        ActivityOptions options=original==null?ActivityOptions.makeBasic()
                :(ActivityOptions)call(original,"fromBundle",original.toBundle());
        call(options,"setLaunchWindowingMode",5);
        markWindowReply.invoke(null,target);
        // Retain the same Intent object, extras and URI grants; only add task separation.
        // Result-based auth keeps resultTo via the two narrowly scoped hooks above.
        Launch launch=new Launch(starter,field(target,"resultTo")!=null);
        FeatureSettings.diagnostic(context,"ls_augment_freeform_redirect_last_hit",from.packageName+" -> "+to.packageName);
        args[5]=options;intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return launch;
    }
    private static Object foregroundCaller(Object starter,Object target)throws ReflectiveOperationException{
        Object root=field(starter,"mRootWindowContainer");if(root==null)return null;
        Object top=call(root,"getTopResumedActivity");if(top==null)return null;
        Object caller=field(target,"launchedFromPackage"),uid=field(target,"launchedFromUid"),info=field(top,"info");
        if(!(caller instanceof String)||!(uid instanceof Integer)||!(info instanceof ActivityInfo))return null;
        ActivityInfo activity=(ActivityInfo)info;
        return caller.equals(activity.packageName)&&activity.applicationInfo!=null
                &&((Integer)uid)==activity.applicationInfo.uid?top:null;
    }
    private static Launch skip(Context context,Object target,String reason){
        FeatureSettings.diagnostic(context,"ls_augment_freeform_redirect_last_skip",String.valueOf(field(target,"packageName"))+":"+reason);
        return null;
    }
    @SuppressWarnings("deprecation")
    private static boolean isNativeGame(ActivityInfo info){
        return info.applicationInfo.category==ApplicationInfo.CATEGORY_GAME
                ||(info.applicationInfo.flags&ApplicationInfo.FLAG_IS_GAME)!=0;
    }
    private static final class Launch{
        final Object starter;final boolean resultExpected;
        Launch(Object starter,boolean resultExpected){this.starter=starter;this.resultExpected=resultExpected;}
    }
}
