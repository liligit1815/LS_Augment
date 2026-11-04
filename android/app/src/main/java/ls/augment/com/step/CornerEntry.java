package ls.augment.com.step;

import android.content.*;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.*;
import java.lang.reflect.Method;

/** Observe only a touch stream already dispatched to the native, collapsed status bar. */
final class CornerEntry {
    static boolean supported;
    static String capability="未检查";
    static View candidate,owned;
    static float startX,startY;
    static int pointer,direction,rotation;
    static long started;
    static boolean opening;
    static void install(ClassLoader loader) {
        try {
            Class<?> bar=Class.forName("com.android.systemui.statusbar.phone.PhoneStatusBarView",false,loader);
            if(!ViewGroup.class.isAssignableFrom(bar))throw new IllegalStateException("状态栏宿主类型未知");
            Method dispatch=OwnershipBridge.method(bar,"dispatchTouchEvent",MotionEvent.class);
            if(dispatch.getReturnType()!=boolean.class)throw new IllegalStateException("状态栏触摸签名不匹配");
            StepHooks.hookMethod(dispatch,new StepHook(){
                @Override protected void beforeHookedMethod(MethodHookParam p){
                    if(!bar.isInstance(p.thisObject))return;
                    try { handle((View)p.thisObject,(MotionEvent)p.args[0],dispatch,p); }
                    catch(Throwable failure){candidate=null;owned=null;StepRuntime.report(null,-1,"角部手势保留原生处理："+failure,-1);}
                }
            });
            supported=true;capability="已注册可见状态栏横滑";
        }catch(Throwable error){capability="不可用："+error;StepRuntime.report(null,-1,capability,-1);}
    }
    static boolean eligible(View v){
        if(!StepRuntime.enabled || !StepRuntime.Shell.serverReady || !v.isShown() || !v.isAttachedToWindow() || v.getDisplay()==null || v.getDisplay().getDisplayId()!=0
                || StepRuntime.Shell.context==null || StepRuntime.Shell.factory==null || StepRuntime.Shell.executor==null
                || StepRuntime.Shell.transitions==null || LiveWorkspace.running() || !StepRuntime.interactive(v.getContext()))return false;
        android.view.ViewGroup.LayoutParams lp=v.getRootView().getLayoutParams();
        if(!(lp instanceof WindowManager.LayoutParams) || ((WindowManager.LayoutParams)lp).type!=WindowManager.LayoutParams.TYPE_STATUS_BAR)return false;
        Rect bounds=v.getContext().getSystemService(WindowManager.class).getMaximumWindowMetrics().getBounds();
        WorkspaceLayout layout=new WorkspaceLayout(bounds.width(),bounds.height(),v.getResources().getDisplayMetrics().density,false);
        return layout.top>=StepMaterial.dp(v.getContext(),92) && v.getRootView().getHeight()<bounds.height()/4;
    }
    static void handle(View view,MotionEvent e,Method dispatch,StepHook.MethodHookParam p)throws Throwable {
        int action=e.getActionMasked();
        if(owned==view && action!=MotionEvent.ACTION_DOWN){
            p.setResult(true);if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL)owned=null;
            return;
        }
        if(action==MotionEvent.ACTION_DOWN){
            candidate=null;owned=null;
            if(opening || !eligible(view) || e.getPointerCount()!=1 || !e.isFromSource(android.view.InputDevice.SOURCE_TOUCHSCREEN))return;
            int width=view.getResources().getDisplayMetrics().widthPixels,edge=StepMaterial.dp(view.getContext(),72);
            float x=e.getRawX();
            direction=x<=edge?1:(x>=width-edge?-1:0);
            if(direction==0 || e.getRawY()<0 || e.getRawY()>=edge)return;
            candidate=view;pointer=e.getPointerId(0);startX=x;startY=e.getRawY();started=e.getEventTime();rotation=view.getDisplay().getRotation();return;
        }
        if(candidate!=view)return;
        if(action!=MotionEvent.ACTION_MOVE || e.getPointerCount()!=1 || e.getPointerId(0)!=pointer ||
                e.getEventTime()-started>500 || view.getDisplay().getRotation()!=rotation){candidate=null;return;}
        float dx=(e.getRawX()-startX)*direction,dy=Math.abs(e.getRawY()-startY);
        if(dy>StepMaterial.dp(view.getContext(),24) || dx< -StepMaterial.dp(view.getContext(),6)){candidate=null;return;}
        if(dx<StepMaterial.dp(view.getContext(),58) || dx<=dy*2)return;
        if(!eligible(view)){candidate=null;return;}
        boolean left=direction==1;
        MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);
        try{StepHooks.invokeOriginalMethod(dispatch,view,new Object[]{cancel});}finally{cancel.recycle();}
        owned=view;candidate=null;p.setResult(true);opening=true;
        new Thread(()->{
            Bundle options=null;
            try{options=StepRuntime.Shell.context.getContentResolver().call(WorkspacePrefsProvider.URI,"read",null,null);}
            catch(RuntimeException error){StepRuntime.report(null,-1,"角部入口无法读取当前用户配置："+error,-1);}
            final Bundle snapshot=options;
            StepRuntime.Shell.main.post(()->{
                opening=false;
                if(snapshot==null || !snapshot.getBoolean("enabled") || !eligible(view))return;
                LiveWorkspace.open(null,new Intent().putExtras(snapshot).putExtra("leftSide",left).putExtra("normalEntry",true));
            });
        },"StepCornerEntry").start();
    }
}
