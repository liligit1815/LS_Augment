package ls.augment.com.step;

import android.view.WindowManager;
import java.lang.reflect.Method;
import static ls.augment.com.step.NativeWorkspaceGuard.*;
import static ls.augment.com.step.StepRuntime.*;

/** Let the stock IME and all its children render and receive input on display zero. */
final class PhysicalIme {
    static Method container, updateParent;
    static int exclusions;
    static void install(ClassLoader cl){
        try{
            Class<?> dc=Wm.display.getClass(),wc=Class.forName("com.android.server.wm.WindowContainer",false,cl);
            Method method=OwnershipBridge.method(dc,"getImeContainer");
            if(!wc.isAssignableFrom(method.getReturnType()))throw new NoSuchMethodException("IME container type");
            Method parenting=LocalLandscape.exact(dc,"shouldImeAttachedToApp",boolean.class);
            StepHooks.hookMethod(parenting,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(!p.hasThrowable() && current() && p.thisObject==Wm.display)p.setResult(false);
            }});
            updateParent=LocalLandscape.exact(dc,"updateImeParent",void.class);container=method;
        }catch(Throwable e){report(null,0,"整屏输入法不可用："+e,-1);}
    }
    static void refreshParent(){
        if(container==null)return;
        synchronized(Wm.lock){
            try{updateParent.invoke(Wm.display);}
            catch(ReflectiveOperationException problem){report(null,-1,"输入法原厂父层更新失败："+problem,-1);}
        }
    }
    static boolean current(){return container!=null && active && !ending;}
    static boolean ownsContainer(Object candidate){
        if(!current() || !container.getReturnType().isInstance(candidate))return false;
        try{return container.invoke(Wm.display)==candidate;}
        catch(ReflectiveOperationException ex){throw new IllegalStateException("输入法容器身份已变化",ex);}
    }
    static boolean window(Object w, WindowManager.LayoutParams attrs){
        if(!current())return false;
        if(attrs.type==WindowManager.LayoutParams.TYPE_INPUT_METHOD || attrs.type==WindowManager.LayoutParams.TYPE_INPUT_METHOD_DIALOG)return true;
        if(attrs.type<WindowManager.LayoutParams.FIRST_SUB_WINDOW || attrs.type>WindowManager.LayoutParams.LAST_SUB_WINDOW)return false;
        Object parent=call(w,"getParentWindow");
        return parent!=null && ((WindowManager.LayoutParams)field(parent,"mAttrs")).type==WindowManager.LayoutParams.TYPE_INPUT_METHOD;
    }
}
