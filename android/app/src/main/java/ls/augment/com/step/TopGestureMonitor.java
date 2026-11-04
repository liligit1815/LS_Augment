package ls.augment.com.step;

import android.os.Looper;
import android.view.*;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import static ls.augment.com.step.StepRuntime.*;

/** Observes the original stream. No single-finger event is consumed by this monitor. */
final class TopGestureMonitor implements AutoCloseable {
    final UpperPane pane;
    Object monitor,receiver,platform;
    Method pilfer,disposeMonitor,disposeReceiver;
    int first=-1,second=-1;
    float x1,y1,x2,y2;
    boolean active;
    TopGestureMonitor(UpperPane pane){this.pane=pane;}
    static TopGestureMonitor open(UpperPane pane){
        TopGestureMonitor g=new TopGestureMonitor(pane);
        try{
            ClassLoader cl=StepRuntime.Shell.loader;
            String base="com.android.systemui.shared.system.";
            Class<?> mon=Class.forName(base+"InputMonitorCompat",false,cl);
            Class<?> sink=Class.forName(base+"InputChannelCompat$InputEventListener",false,cl);
            Class<?> rec=Class.forName(base+"InputChannelCompat$InputEventReceiver",false,cl);
            Class<?> nativeMon=Class.forName("android.view.InputMonitor",false,cl);
            Method factory=OwnershipBridge.method(mon,"getInputReceiver",Looper.class,Choreographer.class,sink);
            g.disposeMonitor=OwnershipBridge.method(mon,"dispose");g.disposeReceiver=OwnershipBridge.method(rec,"dispose");
            g.pilfer=OwnershipBridge.method(nativeMon,"pilferPointers");
            if(!sink.isInterface() || factory.getReturnType()!=rec || OwnershipBridge.method(sink,"onInputEvent",InputEvent.class).getReturnType()!=void.class
                    || g.pilfer.getReturnType()!=void.class || g.disposeReceiver.getReturnType()!=void.class || g.disposeMonitor.getReturnType()!=void.class)
                throw new NoSuchMethodException("未知输入监视器签名");
            g.monitor=mon.getConstructor(String.class,int.class).newInstance("StepUpperGesture",0);
            g.platform=field(g.monitor,"mInputMonitor");
            if(!nativeMon.isInstance(g.platform))throw new IllegalStateException("原屏输入监视器不可用");
            Object consumer=Proxy.newProxyInstance(sink.getClassLoader(),new Class<?>[]{sink},(p,m,a)->{
                if(m.getName().equals("hashCode"))return System.identityHashCode(p);
                if(m.getName().equals("equals"))return p==a[0];
                if(m.getName().equals("toString"))return "StepUpperGesture";
                if(g.monitor!=null && a!=null && a.length==1 && a[0] instanceof MotionEvent)
                    try{g.onTouch((MotionEvent)a[0]);}catch(Exception|LinkageError e){g.reset();pane.host.log("顶区手势中止："+e);}
                return null;
            });
            g.receiver=factory.invoke(g.monitor,Looper.getMainLooper(),Choreographer.getInstance(),consumer);
            if(g.receiver==null)throw new IllegalStateException("缺少手势接收器");
            return g;
        }catch(Exception|LinkageError missing){g.close();pane.host.log("双指翻面不可用："+missing);return null;}
    }
    void reset(){
        first=second=-1;
        if(active && !pane.owner.closed && pane.roll.running)pane.roll.settle(false);
        active=false;
    }
    boolean inside(MotionEvent e,int n){
        return e.getRawY(n)>=0 && e.getRawY(n)<pane.host.geometry.top && e.getRawX(n)>=0 && e.getRawX(n)<pane.host.geometry.width;
    }
    void onTouch(MotionEvent e)throws Exception{
        if(!e.isFromSource(InputDevice.SOURCE_TOUCHSCREEN) || (Integer)call(e,"getDisplayId")!=0)return;
        int op=e.getActionMasked();
        if(op==MotionEvent.ACTION_DOWN){
            reset();if(pane.canSwitch() && inside(e,0))first=e.getPointerId(0);return;
        }
        if(first<0)return;
        if(!pane.canSwitch() || op==MotionEvent.ACTION_CANCEL || e.getPointerCount()>2){reset();return;}
        if(op==MotionEvent.ACTION_POINTER_DOWN && e.getPointerCount()==2){
            if(!inside(e,0)||!inside(e,1)||e.getPointerId(0)!=first){reset();return;}
            second=e.getPointerId(1);x1=e.getRawX(0);y1=e.getRawY(0);x2=e.getRawX(1);y2=e.getRawY(1);return;
        }
        int a=e.findPointerIndex(first),b=e.findPointerIndex(second);
        if(a<0 || b<0){if(op==MotionEvent.ACTION_UP)reset();return;}
        float dy1=e.getRawY(a)-y1,dy2=e.getRawY(b)-y2,dy=(dy1+dy2)/2;
        float dx=Math.max(Math.abs(e.getRawX(a)-x1),Math.abs(e.getRawX(b)-x2));
        if(op==MotionEvent.ACTION_MOVE){
            if(!active){
                if(dy1*dy2<=0 || Math.min(Math.abs(dy1),Math.abs(dy2))<pane.owner.dp(16) || Math.abs(dy)<1.5f*dx)return;
                if(pane.roll.running)return;
                pilfer.invoke(platform);if(!pane.roll.begin())return;active=true;
            }
            pane.roll.drag(dy);
        }else if(op==MotionEvent.ACTION_POINTER_UP || op==MotionEvent.ACTION_UP){
            boolean done=active && Math.abs(dy)>=Math.max(pane.owner.dp(30),pane.host.geometry.top*.14f);
            if(active){active=false;pane.roll.settle(done);}
            reset();
        }
    }
    @Override public void close(){reset();if(receiver!=null)try{disposeReceiver.invoke(receiver);}catch(Exception ignored){}
        if(monitor!=null)try{disposeMonitor.invoke(monitor);}catch(Exception ignored){}receiver=monitor=platform=null;}
}
