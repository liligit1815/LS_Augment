package ls.augment.com.hook;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Re-dispatch the native palette after moving an icon, including its contrast tint. */
final class StatusBarTintHook {
    private static final Map<View,Registration> RECEIVERS=new WeakHashMap<>();
    private static Method applyDark;
    private static boolean replaying;
    private static long paletteGeneration;
    private static final Map<View,Long> REFRESHED=new WeakHashMap<>();
    private StatusBarTintHook() { }

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static int install(AugmentModule module,ClassLoader loader) {
        int count=0;
        try {
            Class<?> dispatcher=Class.forName("com.android.systemui.statusbar.phone.DarkIconDispatcherImpl",false,loader);
            Class<?> receiver=Class.forName("com.android.systemui.plugins.DarkIconDispatcher$DarkReceiver",false,loader);
            applyDark=dispatcher.getDeclaredMethod("applyDark",receiver);
            applyDark.setAccessible(true);
            String name=dispatcher.getName();
            count+=hookNamed(module,loader,"grid_tint",name,"addDarkReceiver",1,null,(o,a,r)->{
                if(a[0] instanceof View&&receiver.isInstance(a[0])){RECEIVERS.put((View)a[0],new Registration(o));paletteGeneration++;}
                return PASS;
            });
            count+=hookNamed(module,loader,"grid_tint",name,"removeDarkReceiver",1,null,(o,a,r)->{
                RECEIVERS.remove(a[0]);paletteGeneration++;return PASS;
            });
            // Theme/app changes can dispatch while the OEM coordinates are restored.
            // Mark these dirty even when the final grid position has not changed.
            for(String method:new String[]{"applyIconTint","applyDark"})
                count+=hookNamed(module,loader,"grid_tint",name,method,-1,null,(o,a,r)->{
                    if(replaying)return PASS;
                    paletteGeneration++;
                    for(Registration entry:RECEIVERS.values())if(entry.dispatcher.get()==o)entry.dirty=true;
                    return PASS;
                });
            Class<?> api=Class.forName("com.android.systemui.plugins.DarkIconDispatcher",false,loader);
            Method area=api.getDeclaredMethod("isInArea",Rect.class,View.class);
            module.registerFeatureHook(module.prepareFeatureHook(area,"systemui.grid.tint_area",true).intercept(chain->{
                View view=(View)chain.getArgs().get(1);
                if(!managed(view))return chain.proceed();
                Rect region=(Rect)chain.getArgs().get(0);RectF ink=screenBounds(view);
                if(ink.isEmpty())return chain.proceed();
                return region.isEmpty()||region.top<=0&&
                        Math.max(0,Math.min(region.right,ink.right)-Math.max(region.left,ink.left))*2>ink.width();
            }));count++;
        } catch(ReflectiveOperationException error) { module.logFeatureError("GRID_TINT_INSTALL",error); }
        return count;
    }
    static RectF screenBounds(View view) {
        RectF ink=new RectF(StatusBarContentBounds.of(view));
        if(ink.isEmpty())return ink;
        Matrix transform=new Matrix();view.transformMatrixToGlobal(transform);transform.mapRect(ink);
        return ink;
    }
    static void refresh(View root) {
        refresh(root,true);
    }
    /** Palette-only frames do not repack geometry or scan receivers when no native delivery occurred. */
    static void refreshDirty(View root) {
        Long seen=REFRESHED.get(root);if(seen!=null&&seen.longValue()==paletteGeneration)return;
        refresh(root,false);
    }
    private static boolean managed(View view) {return StatusBarGridHook.hasGridTransform(view)||DualSignalTint.managed(view);}
    private static void refresh(View root,boolean geometryChanged) {
        if(applyDark==null)return;
        for(Map.Entry<View,Registration> entry:new ArrayList<>(RECEIVERS.entrySet())) {
            View view=entry.getKey();Registration registration=entry.getValue();
            if(view==null||!under(view,root)||!managed(view)||!geometryChanged&&!registration.dirty)continue;
            Object dispatcher=registration.dispatcher.get();if(dispatcher==null)continue;
            RectF bounds=screenBounds(view);if(bounds.isEmpty())continue;
            if(!registration.dirty&&bounds.equals(registration.bounds))continue;
            try {
                replaying=true;
                applyDark.invoke(dispatcher,view);
                registration.bounds=bounds;registration.dirty=false;
                view.invalidate();
            } catch(ReflectiveOperationException error) {
                // Retain native colors and retry on the next palette/layout change.
                registration.bounds=bounds;registration.dirty=false;
                FeatureSettings.diagnosticError(view.getContext(),"ls_augment_statusbar_tint_error","native_tint",error);
            } finally {replaying=false;}
        }
        REFRESHED.put(root,paletteGeneration);
    }
    private static boolean under(View view,View root) {
        for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)
            if(current==root)return true;
        return false;
    }
    private static final class Registration {
        final WeakReference<Object> dispatcher;
        RectF bounds;boolean dirty=true;
        Registration(Object owner){dispatcher=new WeakReference<>(owner);}
    }
}
