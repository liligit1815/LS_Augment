package ls.augment.com.hook;

import android.app.Activity;
import android.app.Dialog;
import android.app.ActivityOptions;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Window;
import android.view.WindowManager;
import ls.augment.com.SystemOptions;
import java.lang.reflect.Method;

/** Make only the OEM compact install host transparent; preserve the confirmation card. */
final class InstallerPresentationHook {
    private static final String CTS="com.android.packageinstaller.CtsPackageInstallerActivity";
    static void install(AugmentModule module,ClassLoader loader) {
        for(String type:new String[]{CTS,"com.android.packageinstaller.InstallStaging","com.android.packageinstaller.InstallStart"}) {
            OemHooks.methods(module,loader,type,"onCreate",void.class,1,"",chain->{
                Activity owner=(Activity)chain.getThisObject();
                boolean enabled=FeatureSettings.enabled(owner,SystemOptions.key("installer_cts"));
                Object result=chain.proceed();
                if(enabled&&(CTS.equals(type)||owner.getIntent().getBooleanExtra("isCtsInstall",false))){
                    try{
                        Method convert=Activity.class.getDeclaredMethod("convertToTranslucent",
                                Class.forName("android.app.Activity$TranslucentConversionListener"),ActivityOptions.class);
                        if(convert.getReturnType()!=boolean.class)throw new NoSuchMethodException("convertToTranslucent:return");
                        convert.setAccessible(true);convert.invoke(owner,null,null);
                        transparent(owner.getWindow());
                        FeatureSettings.diagnostic(owner,"ls_augment_installer_compact_window","transparent;dim=0;theme=native;host="+type);
                    }catch(ReflectiveOperationException|RuntimeException unavailable){
                        module.logFeatureInfo("INSTALLER_PRESENTATION_UNAVAILABLE reason=translucent_window;host="+type+";native_preserved=true");
                    }
                }
                return result;
            },new Class<?>[]{android.os.Bundle.class});
        }
        OemHooks.methods(module,loader,Dialog.class.getName(),"show",void.class,0,"",chain->{
            Dialog dialog=(Dialog)chain.getThisObject();
            Object result=chain.proceed();
            Activity owner=activity(dialog.getContext());
            if(owner!=null&&compact(owner.getClass())
                    &&FeatureSettings.enabled(owner,SystemOptions.key("installer_cts")))clearDim(dialog.getWindow());
            return result;
        });
    }
    private static boolean compact(Class<?> type){
        for(Class<?> current=type;current!=null;current=current.getSuperclass())if(CTS.equals(current.getName()))return true;
        return false;
    }
    private static Activity activity(Context context) {
        for(int i=0;i<8&&context!=null;i++) {
            if(context instanceof Activity)return (Activity)context;
            if(!(context instanceof ContextWrapper))return null;
            Context next=((ContextWrapper)context).getBaseContext();if(next==context)return null;context=next;
        }
        return null;
    }
    private static void clearDim(Window window) {
        if(window==null)return;
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0f);
    }
    private static void transparent(Window window) {
        if(window==null)return;clearDim(window);
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
    }
    private InstallerPresentationHook() { }
}
