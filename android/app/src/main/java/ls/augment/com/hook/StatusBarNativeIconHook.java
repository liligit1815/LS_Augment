package ls.augment.com.hook;

import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Method;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Keep the OEM visibility model, but isolate its single-row animation coordinates. */
final class StatusBarNativeIconHook {
    private StatusBarNativeIconHook() { }
    static int install(AugmentModule module,ClassLoader loader) {
        int count=0;
        try {
            Class<?> type=Class.forName("com.android.systemui.statusbar.phone.StatusIconContainer",false,loader);
            Method calculate=type.getDeclaredMethod("calculateIconTranslations");
            java.lang.reflect.Field underflow=type.getDeclaredField("mNeedsUnderflow");
            java.lang.reflect.Field restrict=type.getDeclaredField("mShouldRestrictIcons");
            underflow.setAccessible(true);restrict.setAccessible(true);
            module.registerFeatureHook(module.prepareFeatureHook(calculate,"systemui.grid.bluetooth_capacity",true).intercept(chain->{
                View view=(View)chain.getThisObject();
                if(!StatusBarGridHook.ownsIconLayout(view))return chain.proceed();
                // The grid packs every eligible icon, including native Bluetooth and
                // expanded dual signals. Its capacity is independent of icon artwork;
                // retain OEM data/blocked/ignored filtering, not single-row overflow.
                boolean oldUnderflow=underflow.getBoolean(view),oldRestrict=restrict.getBoolean(view);
                underflow.setBoolean(view,false);restrict.setBoolean(view,false);
                try{return chain.proceed();}
                finally{underflow.setBoolean(view,oldUnderflow);restrict.setBoolean(view,oldRestrict);}
            }));
            module.deoptimize(calculate);count++;
            Method layout=type.getDeclaredMethod("onLayout",boolean.class,int.class,int.class,int.class,int.class);
            module.deoptimize(layout);
        }catch(ReflectiveOperationException error){module.logFeatureError("GRID_BLUETOOTH_CAPACITY",error);}
        for(String container:new String[]{"StatusIconContainer","NotificationIconContainer"}) {
            String name="com.android.systemui.statusbar.phone."+container;
            try {
                Class<?> containerType=Class.forName(name,false,loader);
                // These small final methods are otherwise inlined into the OEM pass.
                for(Method method:containerType.getDeclaredMethods())
                    if(method.getName().equals("onLayout")||method.getName().equals("updateState")
                            ||method.getName().equals("applyIconStates"))module.deoptimize(method);
            } catch(ClassNotFoundException error) { module.logFeatureError("GRID_NATIVE_CONTAINER_"+container,error); }
            count+=hookNamed(module,loader,"grid_native",name,"resetViewStates",0,(o,a,r)->{
                if(o instanceof ViewGroup)StatusBarGridHook.prepareNativeIcons((ViewGroup)o);
                return PASS;
            },null);
            String stateName=name+(container.equals("StatusIconContainer")?"$StatusIconState":"$IconState");
            String flag=container.equals("StatusIconContainer")?"qsExpansionTransitioning":"noAnimations";
            try {
                Class<?> type=Class.forName(stateName,false,loader);
                Method apply=type.getDeclaredMethod("applyToView",View.class);
                java.lang.reflect.Field animationFlag=type.getDeclaredField(flag);
                animationFlag.setAccessible(true);
                Method cancel=type.getMethod("cancelAnimations",View.class);
                module.registerFeatureHook(module.prepareFeatureHook(apply,"systemui.grid.native_apply."+container,false).intercept(chain->{
                    View view=(View)chain.getArgs().get(0);
                    if(!StatusBarGridHook.ownsIconLayout(view))return chain.proceed();
                    Object state=chain.getThisObject();boolean original=animationFlag.getBoolean(state);
                    cancel.invoke(state,view);
                    animationFlag.setBoolean(state,true);
                    try{return chain.proceed();}
                    finally{animationFlag.setBoolean(state,original);StatusBarGridHook.invalidateLayout(view);}
                }));count++;
            } catch(ReflectiveOperationException error) { module.logFeatureError("GRID_NATIVE_ANIMATION_"+container,error); }
        }
        // Internal icon/dot cross-fades also change the measured content bounds.
        // Only disable these for icons in a live grid, preserving OEM hidden/dot states.
        for(String type:new String[]{"com.android.systemui.statusbar.StatusBarIconView",
                "com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView"})
            count+=hookNamed(module,loader,"grid_native",type,"setVisibleState",-1,(o,a,r)->{
                if(o instanceof View&&StatusBarGridHook.ownsIconLayout((View)o)&&a.length>=2&&a[1] instanceof Boolean)a[1]=false;
                return PASS;
            },(o,a,r)->{if(o instanceof View)StatusBarGridHook.invalidateLayout((View)o);return PASS;});
        return count;
    }
}
