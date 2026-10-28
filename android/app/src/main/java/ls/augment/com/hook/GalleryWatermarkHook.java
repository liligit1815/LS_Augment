package ls.augment.com.hook;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import ls.augment.com.SystemOptions;

/** Text inputs of the OEM photo-editor templates; preview and export share these paths. */
final class GalleryWatermarkHook {
    static void install(AugmentModule module, ClassLoader loader, String pkg) {
        if (!"cn.nubia.photoeditor".equals(pkg)) return;
        int count = 0;
        try {
            Class<?> type = Class.forName("com.android.gallery3d.filtershow.watermark.BaseWaterMark", false, loader);
            for (Class<?>[] args : new Class<?>[][]{ {}, {String.class} }) {
                try {
                    Method method = type.getDeclaredMethod("getRedmagicModelNum", args);
                    if (method.getReturnType() != String.class || !Modifier.isStatic(method.getModifiers())) continue;
                    module.registerFeatureHook(module.prepareFeatureHook(method,"gallery.watermark.model",true)
                            .intercept(chain -> replacement(chain.proceed())));
                    module.deoptimize(method);count++;
                } catch (NoSuchMethodException missing) {
                    module.logFeatureInfo("GALLERY_WATERMARK missing model overload args="+args.length);
                }
            }
        } catch (Throwable error) { module.logFeatureError("GALLERY_WATERMARK legacy route unavailable",error); }
        try {
            Class<?> type = Class.forName("cn.nubia.watermark.WatermarkConfig",false,loader);
            if (!"logo_string".equals(type.getField("KEY_WATERMARK_LOGO_STRING").get(null)))
                throw new NoSuchFieldException("KEY_WATERMARK_LOGO_STRING value");
            Method method=type.getDeclaredMethod("getStringValue",String.class);
            if(method.getReturnType()!=String.class||Modifier.isStatic(method.getModifiers()))
                throw new NoSuchMethodException("getStringValue signature");
            module.registerFeatureHook(module.prepareFeatureHook(method,"gallery.watermark.config",true)
                    .intercept(chain->{Object original=chain.proceed();return "logo_string".equals(chain.getArg(0))?replacement(original):original;}));
            module.deoptimize(method);count++;
        } catch(Throwable error){module.logFeatureError("GALLERY_WATERMARK config route unavailable",error);}
        module.logFeatureInfo("GALLERY_WATERMARK registered="+count+"; unsupported templates retain native text");
    }
    private static Object replacement(Object original){
        android.content.Context context=FeatureSettings.from(null);
        if(!FeatureSettings.enabled(context,SystemOptions.GALLERY_WATERMARK,false))return original;
        String text=FeatureSettings.text(context,SystemOptions.GALLERY_WATERMARK_TEXT,"").trim();
        return text.isEmpty()||text.codePointCount(0,text.length())>80||text.matches("(?s).*[\\p{Cntrl}].*")?original:text;
    }
    private GalleryWatermarkHook(){}
}
