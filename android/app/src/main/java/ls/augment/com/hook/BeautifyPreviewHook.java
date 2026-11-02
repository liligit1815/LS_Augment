package ls.augment.com.hook;

import android.content.Context;
import android.view.View;
import android.widget.Button;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.InvocationTargetException;

/** Native preview layouts and native non-trial application for locally downloaded resources. */
final class BeautifyPreviewHook {
    private BeautifyPreviewHook() {}
    static int install(AugmentModule module,ClassLoader loader) {
        try {
            Contract c=new Contract(loader);
            module.registerFeatureHook(module.prepareFeatureHook(c.trial,"beautify.unlimited_trial.normal_application",true).intercept(chain->{
                Context context=FeatureSettings.from(chain.getArg(0));Object bean=chain.getArg(1);
                if(!c.supported(bean)||!BeautifyTrialGate.enabled(context))return chain.proceed();
                int type=(Integer)c.resourceType.invoke(bean);
                // Do not create the service-side trial flag, timer or five-minute progress message.
                // Keep the original resource paths, compatibility dialogs and asynchronous apply tasks.
                (type==1?c.themeTrying:c.fontTrying).invoke(null,false);
                try { c.normal.invoke(chain.getThisObject(),chain.getArg(0),bean); }
                catch(InvocationTargetException error){throw error.getCause();}
                FeatureSettings.diagnostic(context,"ls_augment_beautify_preview_runtime","normal_application_requested:type="+type);
                return null;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(c.buttons,"beautify.unlimited_trial.preview_buttons",true).intercept(chain->{
                Object owner=chain.getThisObject(),bean=c.bean.get(owner);
                Context context=(Context)c.context.get(owner);
                if(!c.supported(bean)||!BeautifyTrialGate.enabled(context)||!c.ready(owner))return chain.proceed();
                int original=(Integer)chain.getArg(0);
                // Attested native states: 0=trial download/purchase, 12=trial apply/purchase,
                // 3=single download, 6=normal apply. Other progress/update states remain native.
                int mapped=original==0?3:original==12?6:original;
                Object result=chain.proceed(new Object[]{mapped});
                if(original==0)((Button)c.buy.get(owner)).setOnClickListener((View.OnClickListener)c.download.get(owner));
                if(original==12)((Button)c.apply.get(owner)).setOnClickListener((View.OnClickListener)c.use.get(owner));
                if(mapped==6||mapped==7||mapped==23||mapped==26)((Button)c.apply.get(owner)).setText("使用");
                if(mapped!=original)FeatureSettings.diagnostic(context,"ls_augment_beautify_preview_runtime","buttons="+original+"->"+mapped);
                return result;
            }));
            FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_beautify_preview_capability","native_buttons_and_normal_application_ready");
            return 2;
        }catch(Throwable error){
            FeatureSettings.diagnostic(FeatureSettings.from(null),"ls_augment_beautify_preview_capability",
                    "unavailable:"+error.getClass().getSimpleName()+":"+error.getMessage());
            module.logFeatureError("BEAUTIFY_PREVIEW_CAPABILITY",error);return 0;
        }
    }
    static final class Contract {
        final Class<?> beanType;
        final Method resourceType,resourceId,trial,normal,buttons,themeTrying,fontTrying;
        final Field bean,context,buy,apply,download,use;
        Contract(ClassLoader loader) throws Exception {
            beanType=Class.forName("com.zte.beautify.model.local.data.Bean",false,loader);
            Class<?> preview=Class.forName("com.zte.beautify.view.common.preview.online.OnlineThemePreviewFragment",false,loader);
            Class<?> manager=Class.forName("com.zte.beautify.view.base.BaseSetWallPaperManager",false,loader);
            Class<?> helper=Class.forName("com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper",false,loader);
            resourceType=method(beanType,"getResType",int.class,false);resourceId=method(beanType,"getSrcId",String.class,false);
            trial=method(manager,"tryUseDirectly",void.class,false,Context.class,beanType);
            normal=method(manager,"showDialogOnPreview",void.class,false,Context.class,beanType);
            buttons=method(preview,"showButton",void.class,false,int.class);
            method(preview,"refreshButtonState",void.class,false);
            method(preview,"themeDownload",boolean.class,false,boolean.class);
            method(preview,"doApplyTheme",void.class,false);method(preview,"doApplyFont",void.class,false);
            themeTrying=method(helper,"setTringTheme",void.class,true,boolean.class);
            fontTrying=method(helper,"setTringFont",void.class,true,boolean.class);
            bean=field(preview,"mBean",beanType);context=field(preview,"mContext",Context.class);
            buy=field(preview,"mBeautyBtnBuy",Button.class);apply=field(preview,"mBeautyBtnApplication",Button.class);
            field(preview,"mBeautyBtnTry",Button.class);field(preview,"currentButtonState",int.class);
            download=field(preview,"tryDownloadListener",View.OnClickListener.class);
            use=field(preview,"tryApplyListener",View.OnClickListener.class);
        }
        boolean supported(Object value) throws Exception {
            if(value==null||!beanType.isInstance(value))return false;
            int type=(Integer)resourceType.invoke(value);String id=(String)resourceId.invoke(value);
            return (type==1||type==4)&&id!=null&&!id.isEmpty();
        }
        boolean ready(Object owner) throws Exception {
            return context.get(owner)!=null&&buy.get(owner)!=null&&apply.get(owner)!=null
                    &&download.get(owner)!=null&&use.get(owner)!=null;
        }
        static Method method(Class<?> type,String name,Class<?> result,boolean isStatic,Class<?>...args)throws Exception {
            for(Class<?> owner=type;owner!=null;owner=owner.getSuperclass())try{
                Method m=owner.getDeclaredMethod(name,args);
                if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())!=isStatic||Modifier.isAbstract(m.getModifiers()))throw new NoSuchMethodException(name+" signature");
                m.setAccessible(true);return m;
            }catch(NoSuchMethodException absent){if(owner.getSuperclass()==null)throw absent;}
            throw new NoSuchMethodException(name);
        }
        static Field field(Class<?> type,String name,Class<?> expected)throws Exception {
            Field f=type.getDeclaredField(name);
            if(!expected.isAssignableFrom(f.getType())||Modifier.isStatic(f.getModifiers()))throw new NoSuchFieldException(name+" type");
            f.setAccessible(true);return f;
        }
    }
}
