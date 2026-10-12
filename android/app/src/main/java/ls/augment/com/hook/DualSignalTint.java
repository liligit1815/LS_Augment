package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.graphics.BlendModeColorFilter;
import android.graphics.ColorFilter;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Foreground delivered by the native mobile receiver, independent of application night mode. */
final class DualSignalTint {
    private static final String MODERN="com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView";
    private static final Map<View,Integer> NATIVE=new WeakHashMap<>();
    private static final Map<View,Watch> WATCHED=new WeakHashMap<>();
    private static final class Watch {
        WeakReference<ImageView> signal;int references=1;
        Watch(ImageView view){signal=new WeakReference<>(view);}
    }
    private DualSignalTint() { }

    static int install(AugmentModule module,ClassLoader loader) {
        try {
            Class<?> view=Class.forName(MODERN,false,loader);
            Class<?> api=Class.forName("com.android.systemui.plugins.DarkIconDispatcher",false,loader);
            Method resolve=api.getDeclaredMethod("getTint",Collection.class,View.class,int.class);
            Method contrast=view.getDeclaredMethod("onDarkChangedWithContrast",ArrayList.class,int.class,int.class);
            Method statics=view.getDeclaredMethod("setStaticDrawableColor",int.class,int.class);
            if(!View.class.isAssignableFrom(view)||!Modifier.isStatic(resolve.getModifiers())||resolve.getReturnType()!=int.class
                    ||contrast.getReturnType()!=void.class||statics.getReturnType()!=void.class)
                throw new NoSuchMethodException("Native mobile foreground tint contract");
            resolve.setAccessible(true);contrast.setAccessible(true);statics.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(contrast,"systemui.dual_signal.native_contrast_tint",false).intercept(chain->{
                Object result=chain.proceed();
                try {
                    View owner=(View)chain.getThisObject();
                    int color=((Number)resolve.invoke(null,chain.getArg(0),owner,((Number)chain.getArg(1)).intValue())).intValue();
                    received(owner,color);
                } catch(ReflectiveOperationException|RuntimeException error) { module.logFeatureError("DUAL_SIGNAL_NATIVE_TINT",error); }
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(statics,"systemui.dual_signal.native_static_tint",false).intercept(chain->{
                Object result=chain.proceed();received((View)chain.getThisObject(),((Number)chain.getArg(0)).intValue());return result;
            }));
            // The single-int overload is a native no-op. Decor tint belongs to the overflow dot.
            module.deoptimize(contrast);module.deoptimize(statics);
            return 2;
        } catch(ReflectiveOperationException|LinkageError error) {
            module.logFeatureError("DUAL_SIGNAL_TINT_UNAVAILABLE",error);return 0;
        }
    }

    private static void received(View owner,int color) {
        Integer previous=NATIVE.put(owner,color);
        // Cache before a pair exists too: initial native delivery normally precedes module layout.
        if(previous==null||previous.intValue()!=color)RedMagicSystemUiHook.signalTintChanged(owner);
    }
    static void watch(View owner,ImageView signal) {
        if(owner==null||signal==null)return;
        Watch watch=WATCHED.get(owner);
        if(watch==null)WATCHED.put(owner,new Watch(signal));
        else{watch.references++;watch.signal=new WeakReference<>(signal);}
    }
    static void unwatch(View owner) {
        Watch watch=WATCHED.get(owner);if(watch!=null&&--watch.references==0)WATCHED.remove(owner);
    }
    static boolean managed(View owner) {
        Watch watch=WATCHED.get(owner);ImageView signal=watch==null?null:watch.signal.get();
        if(signal==null){WATCHED.remove(owner);return false;}
        for(View at=signal;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at==owner)return true;
        WATCHED.remove(owner);return false;
    }

    /** Unknown means the caller must retain the native presentation, never invent a white glyph. */
    static Integer color(View owner,ImageView signal) {
        if(owner==null||signal==null)return null;
        Integer nativeColor=NATIVE.get(owner);if(nativeColor!=null)return nativeColor;
        ColorStateList colors=signal.getImageTintList();
        if(colors!=null)return colors.getColorForState(signal.getDrawableState(),colors.getDefaultColor());
        Integer filter=filterColor(signal.getColorFilter());if(filter!=null)return filter;
        Drawable original=StatusBarAssetsHook.nativeDrawable(signal);
        filter=filterColor(original==null?null:original.getColorFilter());if(filter!=null)return filter;
        // Cold start: the ROM binding already holds a foreground even before its collector writes ImageTint.
        Object binding=field(owner,"binding"),flow=field(binding,"$iconTint","iconTint");
        try {
            Object value=call(flow,"getValue");
            if(value instanceof Number)return ((Number)value).intValue();
            Object tint=call(value,"getTint");return tint instanceof Number?((Number)tint).intValue():null;
        } catch(ReflectiveOperationException|RuntimeException unavailable) { return null; }
    }
    private static Integer filterColor(ColorFilter filter) {
        if(filter instanceof BlendModeColorFilter)return ((BlendModeColorFilter)filter).getColor();
        if(filter instanceof PorterDuffColorFilter)try {
            Object value=call(filter,"getColor");return value instanceof Number?((Number)value).intValue():null;
        } catch(ReflectiveOperationException|RuntimeException unavailable) { }
        return null;
    }
}
