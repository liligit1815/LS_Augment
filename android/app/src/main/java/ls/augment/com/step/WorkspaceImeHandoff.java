package ls.augment.com.step;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import static ls.augment.com.step.StepRuntime.*;
import static ls.augment.com.step.NativeWorkspaceGuard.*;

/** Let the native IME close before its editor becomes a non-interactive preview. */
final class WorkspaceImeHandoff {
    static boolean probed;
    static Object service;
    static Method hide;
    static int reason;

    static Method scopedHide(Class<?> type) throws NoSuchMethodException {
        Method method=OwnershipBridge.method(type,"hideInputMethod",int.class,int.class);
        if(method.getReturnType()!=void.class || Modifier.isStatic(method.getModifiers()))
            throw new NoSuchMethodException("display-scoped IME hide signature");
        return method;
    }
    static void probe(){
        if(probed)return;probed=true;
        try{
            ClassLoader loader=Wm.service.getClass().getClassLoader();
            Class<?> type=Class.forName("com.android.server.inputmethod.InputMethodManagerInternal",false,loader);
            Method candidate=scopedHide(type);
            Class<?> local=Class.forName("com.android.server.LocalServices",false,loader);
            Object found=OwnershipBridge.method(local,"getService",Class.class).invoke(null,type);
            if(!type.isInstance(found))throw new IllegalStateException("native IME service unavailable");
            Class<?> reasons=Class.forName("com.android.internal.inputmethod.SoftInputShowHideReason",false,loader);
            java.lang.reflect.Field field=StepMembers.findField(reasons,"HIDE_WHEN_INPUT_TARGET_INVISIBLE");
            if(field.getType()!=int.class || !Modifier.isStatic(field.getModifiers()))
                throw new NoSuchFieldException("native IME hide reason");
            reason=field.getInt(null);service=found;hide=candidate;
        }catch(ReflectiveOperationException|RuntimeException|LinkageError missing){
            service=null;hide=null;
            diagnostic("IME_HANDOFF","native_continue;missing_display_scoped_hide="+missing);
        }
    }
    static Object inputWindow(){
        Object target=call(Wm.display,"getImeInputTarget");
        return target==null?null:call(target,"getWindowState");
    }
    static boolean visible() throws ReflectiveOperationException {
        Object source=WorkspaceIme.source.invoke(WorkspaceIme.sourceProvider.invoke(WorkspaceIme.controller));
        return Boolean.TRUE.equals(WorkspaceIme.visible.invoke(source));
    }
    static boolean eligible(NativeFlip moving,Object window){
        SavedTask outgoing=moving.actors[0];
        return outgoing!=null && window!=null && call(window,"getDisplayContent")==Wm.display
                && call(window,"getTask")==outgoing.task
                && liveTask(outgoing.id,outgoing.token)==outgoing.task
                && call(outgoing.task,"getParent")==outgoing.parent
                && (Integer)call(outgoing.task,"getWindowingMode")==1
                && call(Wm.display,"getFocusedRootTask")==outgoing.task;
    }
    static void prepare(NativeFlip moving,Runnable ready){
        try{
            if(!WorkspaceIme.available || !eligible(moving,inputWindow()) || !visible()){ready.run();return;}
            probe();
            if(hide==null){ready.run();return;}
            Object window=inputWindow();
            if(!eligible(moving,window))throw new IllegalStateException("IME editor changed before handoff");
            // The verified native method posts to IMMS without acquiring ImfLock.
            // Keep focus and task roles unchanged until its hide is read back, so
            // a delayed request cannot close the next application's keyboard.
            hide.invoke(service,reason,(Integer)call(Wm.display,"getDisplayId"));
            diagnostic("IME_HANDOFF","hide_requested;task="+moving.outgoing);
            awaitHidden(moving,window,ready,android.os.SystemClock.uptimeMillis()+900);
        }catch(Exception|LinkageError error){finish("键盘交接准备失败："+error);}
    }
    static void awaitHidden(NativeFlip moving,Object window,Runnable ready,long deadline){
        if(flip!=moving || ending)return;
        try{
            synchronized(Wm.lock){
                if(flip!=moving || ending)return;
                moving.validate();
                if(!visible()){
                    diagnostic("IME_HANDOFF","hidden_confirmed;task="+moving.outgoing);
                    ready.run();return;
                }
                if(inputWindow()!=window || !eligible(moving,window))
                    throw new IllegalStateException("IME editor changed while hiding");
            }
            if(android.os.SystemClock.uptimeMillis()>=deadline){finish("键盘收起未确认，归还原任务");return;}
            Wm.handler.postDelayed(()->awaitHidden(moving,window,ready,deadline),16);
        }catch(Exception|LinkageError error){finish("键盘交接读回失败："+error);}
    }
}
