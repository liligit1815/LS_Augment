package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Method;
import ls.augment.com.ConfigSchema;

/** Verified against this device's cn.nubia.neostore ConfigMgrImp and download service. */
final class StoreDownloadHook {
    static void install(AugmentModule module,ClassLoader loader){try{
        Class<?> settings=Class.forName("cn.nubia.neostore.model.ConfigMgrImp",false,loader);
        Method count=settings.getDeclaredMethod("H0");if(count.getReturnType()!=int.class)throw new NoSuchMethodException("H0 return type");
        count.setAccessible(true);
        module.registerFeatureHook(module.prepareFeatureHook(count,"store.download_count",true).intercept(chain->{
            Context context=FeatureSettings.from(chain.getThisObject());
            if(!FeatureSettings.enabled(context,ConfigSchema.STORE_DOWNLOAD_ENABLED))return chain.proceed();
            int limit=FeatureSettings.integer(context,ConfigSchema.STORE_DOWNLOAD_COUNT,5,1,50);
            FeatureSettings.diagnostic(context,"ls_augment_store_download_runtime","limit="+limit+";source=ConfigMgrImp.H0;ts="+System.currentTimeMillis());return limit;
        }));
        Class<?> service=Class.forName("cn.nubia.neostore.service.DownloadService",false,loader);Method resize=service.getDeclaredMethod("f",int.class);resize.setAccessible(true);
        module.registerFeatureHook(module.prepareFeatureHook(resize,"store.resize_download_queue",true).intercept(chain->{
            Context context=FeatureSettings.from(chain.getThisObject());
            if(!FeatureSettings.enabled(context,ConfigSchema.STORE_DOWNLOAD_ENABLED))return chain.proceed();
            return chain.proceed(new Object[]{FeatureSettings.integer(context,ConfigSchema.STORE_DOWNLOAD_COUNT,5,1,50)});
        }));module.logFeatureInfo("STORE_DOWNLOAD_REGISTERED ConfigMgrImp.H0 / DownloadService.f(int)");
    }catch(Throwable error){module.logFeatureError("STORE_DOWNLOAD_INSTALL_FAILED",error);}}
}
