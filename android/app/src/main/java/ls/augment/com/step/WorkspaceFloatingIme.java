package ls.augment.com.step;

import android.graphics.Rect;
import android.view.WindowInsets;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Session-scoped floating presentation of the original IME with native surface input. */
final class WorkspaceFloatingIme {
    static boolean available;
    static Object surface;
    static Constructor<?> copy;
    static void install(ClassLoader loader){
        try{
            if(PhysicalIme.container==null)throw new NoSuchMethodException("physical IME container");
            LocalLandscape.exact(PhysicalIme.container.getReturnType(),"getLastSurfacePosition",android.graphics.Point.class);
            Class<?> window=Class.forName("com.android.server.wm.WindowState",false,loader);
            Class<?> state=Class.forName("android.view.InsetsState",false,loader);
            Class<?> source=Class.forName("android.view.InsetsSource",false,loader);
            copy=state.getDeclaredConstructor(state,boolean.class);copy.setAccessible(true);
            Method insets=LocalLandscape.exact(window,"getInsetsState",state,boolean.class);
            LocalLandscape.exact(state,"sourceSize",int.class);
            LocalLandscape.exact(state,"sourceAt",source,int.class);
            LocalLandscape.exact(source,"getType",int.class);
            LocalLandscape.exact(source,"setFrame",source,int.class,int.class,int.class,int.class);
            LocalLandscape.exact(source,"setVisibleFrame",source,Rect.class);
            StepHooks.hookMethod(insets,new StepHook(){protected void afterHookedMethod(MethodHookParam p){
                if(p.hasThrowable() || !forWindow(p.thisObject))return;
                try{
                    Object adjusted=copy.newInstance(p.getResult(),true);
                    for(int n=0;n<(Integer)call(adjusted,"sourceSize");n++){
                        Object item=call(adjusted,"sourceAt",n);
                        if(((Integer)call(item,"getType")&WindowInsets.Type.ime())==0)continue;
                        // Floating IME stays visible but reserves no docked app viewport.
                        call(item,"setFrame",0,0,0,0);call(item,"setVisibleFrame",(Object)null);
                    }
                    p.setResult(adjusted);
                }catch(Exception|LinkageError error){report(null,0,"悬浮键盘边界保留原厂处理："+error,-1);}
            }});
            available=true;
        }catch(Exception|LinkageError missing){report(null,0,"悬浮键盘接口不可用："+missing,-1);}
    }
    static boolean forWindow(Object window){
        if(!available || !WorkspaceIme.available || !active || ending || !LocalLandscape.scene() || window==null)return false;
        Object app=field(window,"mActivityRecord");
        return app!=null && LocalLandscape.owned(app) && app==LocalLandscape.main();
    }
    static boolean update(boolean shown,Rect keyboard,Object input)throws Exception{
        if(!shown || !forWindow(input) || PhysicalIme.container==null || keyboard.isEmpty()){
            reset();return false;
        }
        Object container=PhysicalIme.container.invoke(Wm.display),target=call(container,"getSurfaceControl");validSurface(target);
        android.graphics.Point position=(android.graphics.Point)call(container,"getLastSurfacePosition");
        if(position.x!=0 || position.y!=0 || keyboard.left!=0 || keyboard.right!=logical.width()){
            reset();return false; // Already-floating or unknown native layouts remain native.
        }
        if(surface!=null && surface!=target)reset();
        WorkspaceLayout layout=WorkspaceLayout.create(logical.width(),logical.height(),Wm.context.getResources().getDisplayMetrics().density,sideLeft,layoutCount,layoutInset,mainReflow);
        float scale=Math.min(.75f,(layout.width*layout.mainScale-2*layout.gap)/keyboard.width());
        float x=layout.mainX+(layout.width*layout.mainScale-keyboard.width()*scale)/2f;
        float bottom=logical.height()-24*Wm.context.getResources().getDisplayMetrics().density;
        WorkspaceTransform pose=new WorkspaceTransform(scale,x,bottom-keyboard.bottom*scale)
                .inside(NativeTransitionPose.inherited(call(container,"getParent")));
        Object tx=call(Wm.display,"getPendingTransaction");
        call(tx,"setMatrix",target,pose.scale,0f,0f,pose.scale);call(tx,"setPosition",target,pose.x,pose.y);
        call(tx,"apply");
        if(surface==null)diagnostic("FLOATING_IME","shown;scale="+scale+";x="+x+";bottom="+bottom+";nativeSurfaceInput=true");
        surface=target;
        call(field(Wm.display,"mInputMonitor"),"updateInputWindowsLw",true);
        return true;
    }
    static void reset()throws Exception{
        if(surface==null)return;
        Object target=surface;
        if(Boolean.TRUE.equals(call(target,"isValid")) && PhysicalIme.container!=null){
            Object container=PhysicalIme.container.invoke(Wm.display);
            if(call(container,"getSurfaceControl")==target){
                android.graphics.Point p=(android.graphics.Point)call(container,"getLastSurfacePosition");
                Object tx=call(Wm.display,"getPendingTransaction");
                call(tx,"setMatrix",target,1f,0f,0f,1f);call(tx,"setPosition",target,(float)p.x,(float)p.y);
                if(pendingCommit!=null)trackCommit(tx,pendingCommit);
                call(tx,"apply");
            }
        }
        surface=null;diagnostic("FLOATING_IME","restored");
    }
}
