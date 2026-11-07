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
    static long completedAt,reasonAt;
    static void describe(Bundle b){
        b.putLong("entryCompletedAt",completedAt);b.putLong("entryReasonAt",reasonAt);
        b.putString("entryReason",lastReason);b.putBoolean("entryEnabled",StepRuntime.enabled);
    }
    static long events,downs,corners,recognized,submitted,lastDiagnostic;
    static String lastReason="not_observed";
    static int windowType=-1,rootHeight,barHeight;
    static String snapshot(){
        return "events="+events+";downs="+downs+";corners="+corners+";recognized="+recognized+";submitted="+submitted
                +";reason="+lastReason+";window_type="+windowType+";root_height="+rootHeight+";bar_height="+barHeight
                +";enabled="+StepRuntime.enabled+";server_ready="+StepRuntime.Shell.serverReady;
    }
    static void observe(String reason,boolean force){
        lastReason=reason;
        reasonAt=android.os.SystemClock.elapsedRealtime();
        if("tracking".equals(reason))return;
        long now=android.os.SystemClock.elapsedRealtime();
        if(force||now-lastDiagnostic>=2000){lastDiagnostic=now;StepRuntime.diagnostic("ENTRY",snapshot());}
    }
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
            StepRuntime.diagnostic("ENTRY_INSTALLED","owner="+dispatch.getDeclaringClass().getName());
        }catch(Throwable error){capability="不可用："+error;StepRuntime.report(null,-1,capability,-1);}
    }
    static boolean eligible(View v){
        return blocked(v)==null;
    }
    static String blocked(View v){
        if(!StepRuntime.enabled)return "disabled";
        if(!StepRuntime.Shell.serverReady)return "handshake_pending";
        if(!v.isShown() || !v.isAttachedToWindow())return "bar_not_visible";
        if(v.getDisplay()==null || v.getDisplay().getDisplayId()!=0)return "not_primary_display";
        if(StepRuntime.Shell.context==null || StepRuntime.Shell.factory==null || StepRuntime.Shell.executor==null
                || StepRuntime.Shell.transitions==null)return "shell_components_missing";
        if(LiveWorkspace.running())return "workspace_running";
        if(!StepRuntime.interactive(v.getContext()))return "locked_or_screen_off";
        android.view.ViewGroup.LayoutParams lp=v.getRootView().getLayoutParams();
        windowType=lp instanceof WindowManager.LayoutParams?((WindowManager.LayoutParams)lp).type:-1;
        rootHeight=v.getRootView().getHeight();barHeight=v.getHeight();
        if(windowType!=WindowManager.LayoutParams.TYPE_STATUS_BAR)return "not_status_bar_window";
        Rect bounds=v.getContext().getSystemService(WindowManager.class).getMaximumWindowMetrics().getBounds();
        WorkspaceLayout layout=new WorkspaceLayout(bounds.width(),bounds.height(),v.getResources().getDisplayMetrics().density,false);
        if(layout.top<StepMaterial.dp(v.getContext(),92))return "workspace_too_small";
        return rootHeight<bounds.height()/4?null:"bar_window_expanded";
    }
    static void handle(View view,MotionEvent e,Method dispatch,StepHook.MethodHookParam p)throws Throwable {
        int action=e.getActionMasked();
        events++;
        if(owned==view && action!=MotionEvent.ACTION_DOWN){
            p.setResult(true);if(action==MotionEvent.ACTION_UP || action==MotionEvent.ACTION_CANCEL)owned=null;
            return;
        }
        if(action==MotionEvent.ACTION_DOWN){
            downs++;
            candidate=null;owned=null;
            if(e.getPointerCount()!=1 || !e.isFromSource(android.view.InputDevice.SOURCE_TOUCHSCREEN))return;
            int width=view.getResources().getDisplayMetrics().widthPixels;
            float x=e.getRawX();
            direction=CornerEntryPolicy.direction(width,view.getHeight(),view.getResources().getDisplayMetrics().density,x,e.getRawY());
            if(direction==0)return;
            corners++;
            String reason=opening?"launch_pending":blocked(view);
            if(reason!=null){observe(reason,false);return;}
            observe("tracking",false);
            candidate=view;pointer=e.getPointerId(0);startX=x;startY=e.getRawY();started=e.getEventTime();rotation=view.getDisplay().getRotation();return;
        }
        if(candidate!=view)return;
        // Some short swipes have their final displacement only on UP. Evaluate
        // that sample before ending the stream, with the same native guards.
        if((action!=MotionEvent.ACTION_MOVE && action!=MotionEvent.ACTION_UP) || e.getPointerCount()!=1 || e.getPointerId(0)!=pointer ||
                e.getEventTime()-started>CornerEntryPolicy.DURATION_MS || view.getDisplay().getRotation()!=rotation){candidate=null;observe("stream_cancelled",false);return;}
        float dx=(e.getRawX()-startX)*direction,dy=Math.abs(e.getRawY()-startY);
        if(dy>StepMaterial.dp(view.getContext(),CornerEntryPolicy.VERTICAL_DP) || dx< -StepMaterial.dp(view.getContext(),CornerEntryPolicy.BACKTRACK_DP)){candidate=null;observe("not_inward_horizontal",false);return;}
        if(dx<StepMaterial.dp(view.getContext(),CornerEntryPolicy.INWARD_DP) || dx<=dy*2){if(action==MotionEvent.ACTION_UP){candidate=null;observe("distance_short",false);}return;}
        String reason=blocked(view);
        if(reason!=null){candidate=null;observe(reason,false);return;}
        boolean left=direction==1;
        MotionEvent cancel=MotionEvent.obtain(e);cancel.setAction(MotionEvent.ACTION_CANCEL);
        try{StepHooks.invokeOriginalMethod(dispatch,view,new Object[]{cancel});}finally{cancel.recycle();}
        owned=action==MotionEvent.ACTION_UP?null:view;candidate=null;p.setResult(true);opening=true;
        recognized++;observe("recognized",true);
        new Thread(()->{
            Bundle options=null;
            try{options=StepRuntime.Shell.context.getContentResolver().call(WorkspacePrefsProvider.URI,"read",null,null);}
            catch(RuntimeException error){StepRuntime.report(null,-1,"角部入口无法读取当前用户配置："+error,-1);}
            final Bundle snapshot=options;
            StepRuntime.Shell.main.post(()->{
                opening=false;
                if(snapshot==null){observe("configuration_unavailable",true);return;}
                if(!snapshot.getBoolean("enabled")){observe("configuration_disabled",true);return;}
                String unavailable=blocked(view);
                if(unavailable!=null){observe(unavailable,true);return;}
                submitted++;observe("launch_submitted",true);
                LiveWorkspace.open(null,new Intent().putExtras(snapshot).putExtra("leftSide",left).putExtra("normalEntry",true));
            });
        },"StepCornerEntry").start();
    }
}
