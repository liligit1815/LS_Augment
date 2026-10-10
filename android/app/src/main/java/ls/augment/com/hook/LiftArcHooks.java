package ls.augment.com.hook;

import android.view.MotionEvent;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import io.github.libxposed.api.XposedInterface;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** RedMagic 11.5/Android 16 entry points, inspected from the target SystemUI APK. */
final class LiftArcHooks {
    private static final String WINDOW="com.android.systemui.shade.NotificationShadeWindowView";
    private static final String MANAGER="com.android.systemui.statusbar.phone.StatusBarKeyguardViewManager";
    static void install(AugmentModule module,ClassLoader loader) {
        LiftArcConfig config=new LiftArcConfig();
        int attached=hookNamed(module,loader,"liftarc",WINDOW,"onAttachedToWindow",0,null,(o,a,r)-> {
            try { LiftArcController.onWindowAttached(o,config,module); }
            catch(Throwable error) { LiftArcRuntime.error("窗口建立",error); } return PASS;
        });
        hookNamed(module,loader,"liftarc",WINDOW,"onDetachedFromWindow",0,(o,a,r)-> {
            LiftArcController.onWindowDetached(o);return PASS;
        },null);
        int touches=0;
        try {
            Class<?> window=Class.forName(WINDOW,false,loader);
            Method dispatch=window.getDeclaredMethod("dispatchTouchEvent",MotionEvent.class);
            module.registerFeatureHook(module.prepareFeatureHook(dispatch,"liftarc.touch",true).intercept(chain-> {
                MotionEvent event=(MotionEvent)chain.getArg(0);int mode=LiftArcController.TOUCH_PASS;
                try { mode=LiftArcController.onWindowTouchPre(chain.getThisObject(),config,event); }
                catch(Throwable error) { LiftArcRuntime.error("触摸接管",error); }
                if(mode==LiftArcController.TOUCH_SWALLOW)return Boolean.TRUE;
                Object result;
                if(mode==LiftArcController.TOUCH_PASS_AS_CANCEL) {
                    MotionEvent cancel=MotionEvent.obtain(event);cancel.setAction(MotionEvent.ACTION_CANCEL);
                    try { result=chain.proceed(new Object[]{cancel}); } finally { cancel.recycle(); }
                } else result=chain.proceed();
                try { LiftArcController.onWindowTouchPost(chain.getThisObject(),config); }
                catch(Throwable error) { LiftArcRuntime.error("触摸复位",error); }
                return mode==LiftArcController.TOUCH_PASS_AS_CANCEL?Boolean.TRUE:result;
            }));touches=1;
        } catch(ReflectiveOperationException error) { module.logFeatureError("LIFTARC_TOUCH_INSTALL",error); }
        hookNamed(module,loader,"liftarc",WINDOW,"onInterceptTouchEvent",1,null,(o,a,r)-> {
            int mode=LiftArcController.onWindowIntercept(o,config,(MotionEvent)a[0]);
            return mode==LiftArcController.INTERCEPT_NO?Boolean.FALSE:PASS;
        });
        int state=hookNamed(module,loader,"liftarc","com.android.systemui.statusbar.policy.KeyguardStateControllerImpl","notifyKeyguardState",2,null,(o,a,r)-> {
            LiftArcController.onKeyguardState(Boolean.TRUE.equals(a[0]),Boolean.TRUE.equals(a[1]));return PASS;
        });
        int managerCount=0;
        try {
            Class<?> manager=Class.forName(MANAGER,false,loader);
            manager.getDeclaredMethod("showPrimaryBouncer",boolean.class,String.class);
            for(Constructor<?> constructor:manager.getDeclaredConstructors()) {
                module.registerFeatureHook(module.hook(constructor).setId("ls_augment.api102.liftarc.manager."+constructor.getParameterCount())
                        .setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE).intercept(chain-> {
                            Object result=chain.proceed();LiftArcUnlock.capture(chain.getThisObject());syncManager(chain.getThisObject());return result;
                        }));managerCount++;
            }
        } catch(ReflectiveOperationException error) { module.logFeatureError("LIFTARC_MANAGER_INSTALL",error); }
        for(String name:new String[]{"show","hide","reset","setOccluded","setDozing","onDozingChanged","showPrimaryBouncer","setQsExpansion"})
            hookNamed(module,loader,"liftarc",MANAGER,name,-1,null,(o,a,r)-> {
                LiftArcUnlock.capture(o);syncManager(o);
                if("setQsExpansion".equals(name)&&a.length>0&&a[0] instanceof Number)
                    LiftArcController.onControlCenterOpen(((Number)a[0]).floatValue()>.001f);
                return PASS;
            });
        hookNamed(module,loader,"liftarc","com.android.systemui.shade.NotificationPanelViewController","onQsExpansionChanged",1,null,(o,a,r)-> {
            Object qs=callIfPresent(o,"isQsExpanded");LiftArcController.onControlCenterOpen(Boolean.TRUE.equals(qs));return PASS;
        });
        hookNamed(module,loader,"liftarc","com.android.systemui.shade.NotificationPanelViewController","setDozing",2,null,(o,a,r)-> {
            LiftArcController.onDozing(Boolean.TRUE.equals(a[0]));return PASS;
        });
        LiftArcRuntime.installed(attached>0&&touches>0&&state>0&&managerCount>0);
        module.logFeatureInfo("LIFTARC_READY window="+attached+" touch="+touches+" state="+state+" manager="+managerCount);
    }
    private static void syncManager(Object owner) {
        Object state=field(owner,"mKeyguardStateController"),dozing=field(owner,"mDozing");
        try {
            Object showing=callIfPresent(state,"isShowing"),occluded=callIfPresent(state,"isOccluded");
            if(showing instanceof Boolean&&occluded instanceof Boolean)LiftArcController.onKeyguardState((Boolean)showing,(Boolean)occluded);
        } catch(ReflectiveOperationException ignored) { }
        LiftArcController.onDozing(Boolean.TRUE.equals(dozing));
        try { LiftArcController.onBouncer(Boolean.TRUE.equals(callIfPresent(owner,"isBouncerShowing"))); }
        catch(ReflectiveOperationException ignored) { }
    }
    private LiftArcHooks() { }
}
