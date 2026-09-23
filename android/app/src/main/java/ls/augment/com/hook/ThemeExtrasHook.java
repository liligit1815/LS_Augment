package ls.augment.com.hook;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import java.lang.reflect.Constructor;
import static ls.augment.com.hook.OemHooks.*;

/** Continues native free/trial downloads at their local account gate. No entitlement is forged. */
public final class ThemeExtrasHook {
    private static final String PKG="com.zte.beautify",KEY="ls_augment_rm_theme_no_login";
    private static final String HASH="8be52b9cf0690c760e3f6d6b696212fe8a06b86c1d6eb17746ca230d17d60ed1";
    private static final String BASE="com.zte.beautify.view.common.preview.",AOD=BASE+"online.AodPreviewFragment";
    private static final ThreadLocal<Request> DOWNLOAD=new ThreadLocal<>();
    private ThemeExtrasHook(){ }
    public static int install(AugmentModule module,ClassLoader loader,String pkg){
        if(!PKG.equals(pkg))return 0;
        OemBinaryGate.prepare(PKG,161000,HASH);
        int count=scope(module,loader,BASE+"online.OnlineThemePreviewFragment","themeDownload",boolean.class,1,0);
        count+=scope(module,loader,AOD,"aodDownload",boolean.class,0,1);
        count+=scope(module,loader,BASE+"BeautyPreviewActivity","ResourceDownload",void.class,1,2);
        count+=methods(module,loader,BASE+"BeautyPreviewActivity","startAccountManager",void.class,0,"",chain->{
            Request request=DOWNLOAD.get();if(request==null)return chain.proceed();
            try {
            Object activity=request.kind==2?request.owner:invoke(request.owner,"getActivity");
            if(activity!=chain.getThisObject()||!(activity instanceof Activity)||((Activity)activity).isFinishing())return chain.proceed();
            Context context=(Context)activity;
            if(!allowed(context)||!loggedOut(loader))return chain.proceed();
            Object bean=field(request.owner,"mBean");if(bean==null)return chain.proceed();
            // Only a native free/owned resource or an explicitly requested trial bypasses login.
            if(!request.trial&&!free(bean))return chain.proceed();
            if(request.kind==0)invoke(request.owner,"doDownload",invoke(bean,"getSrcId"),request.trial);
            else if(request.kind==1)invoke(request.owner,"doDownload",invoke(bean,"getSrcId"));
            else invoke(request.owner,"doDownload",request.trial);
            FeatureSettings.diagnostic(context,"ls_augment_rm_theme_no_login_runtime","native_download_executed");
            return null;
            }catch(ReflectiveOperationException unavailable){module.logFeatureError("RM_THEME_DOWNLOAD",unavailable);return chain.proceed();}
        });
        // On this binary the original AOD trial click is a log-only stub. Restore its existing
        // native trial task/listener; keep normal purchase and free-download buttons separate.
        count+=methods(module,loader,AOD+"$5","onNoDoubleClick",void.class,1,"",chain->{
            Object arg=chain.getArgs().get(0);if(!(arg instanceof View))return chain.proceed();
            try {
            View view=(View)arg;if(!allowed(view.getContext())||!loggedOut(loader))return chain.proceed();
            Object fragment;
            try{fragment=invoke(Class.forName("androidx.fragment.app.FragmentManager",false,loader),"findFragment",view);}catch(ReflectiveOperationException missing){return chain.proceed();}
            if(fragment==null||!fragment.getClass().getName().equals(AOD)||field(fragment,"mBeautyBtnTry")!=view)return chain.proceed();
            Object bean=field(fragment,"mBean");if(bean==null||!Boolean.TRUE.equals(invoke(fragment,"checkDownloadUrl")))return chain.proceed();
            if(free(bean)){invoke(fragment,"doDownload",invoke(bean,"getSrcId"));return null;}
            Object task=construct(loader,"com.zte.beautify.view.common.tools.SaveAodPreviewTask",new Class<?>[]{int.class,bean.getClass()},0,bean);
            Object executor=construct(loader,"com.zte.beautify.util.CommonExecUtil",new Class<?>[0]);
            invoke(executor,"setFuncAndExec",task,"SaveAodPreviewTask");
            invoke(bean,"setDownloadTime",String.valueOf(System.currentTimeMillis()));
            Object listener=construct(loader,AOD+"$AodTryDownloadListener",new Class<?>[]{Object.class,fragment.getClass()},"AodPreviewFragment",fragment);
            Object manager=invoke(Class.forName("com.zte.beautify.model.download.DownloadManager",false,loader),"getInstance");
            invoke(manager,"startDownloadTask",bean,listener,"try");
            FeatureSettings.diagnostic(view.getContext(),"ls_augment_rm_theme_no_login_runtime","aod_trial_executed");
            return null;
            }catch(ReflectiveOperationException unavailable){module.logFeatureError("RM_THEME_AOD_TRIAL",unavailable);return chain.proceed();}
        });
        return count;
    }
    private static int scope(AugmentModule module,ClassLoader loader,String type,String method,Class<?> result,int argc,int kind){
        return methods(module,loader,type,method,result,argc,"",chain->{
            Context context=context(chain.getThisObject(),chain.getArgs());if(!allowed(context))return chain.proceed();
            Request previous=DOWNLOAD.get();DOWNLOAD.set(new Request(chain.getThisObject(),kind,argc==1&&Boolean.TRUE.equals(chain.getArgs().get(0))));
            try{return chain.proceed();}finally{if(previous==null)DOWNLOAD.remove();else DOWNLOAD.set(previous);}
        });
    }
    private static boolean allowed(Context context){return FeatureSettings.enabled(context,KEY)&&OemBinaryGate.matches(context,PKG,161000,HASH);}
    private static boolean loggedOut(ClassLoader loader)throws ReflectiveOperationException{return invoke(invoke(Class.forName("com.zte.beautify.model.remote.zteaccount.ZteAccountManager",false,loader),"getInstance"),"getCurrentUserInfo")==null;}
    private static boolean free(Object bean)throws ReflectiveOperationException{return Boolean.TRUE.equals(invoke(bean,"isFree"))||Boolean.TRUE.equals(invoke(bean,"getIsCharge"))||Boolean.TRUE.equals(invoke(bean,"isTimeLimitFree"));}
    private static Object construct(ClassLoader loader,String name,Class<?>[] signature,Object...args)throws ReflectiveOperationException{Constructor<?> ctor=Class.forName(name,false,loader).getDeclaredConstructor(signature);ctor.setAccessible(true);return ctor.newInstance(args);}
    private static final class Request{final Object owner;final int kind;final boolean trial;Request(Object owner,int kind,boolean trial){this.owner=owner;this.kind=kind;this.trial=trial;}}
}
