package ls.augment.com.step;

import android.os.Looper;
import android.view.*;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import static ls.augment.com.step.StepRuntime.*;

/** Preserve native input until a page swipe or parallel two-finger task gesture locks. */
final class TopGestureMonitor implements AutoCloseable {
    final UpperPane pane;
    Object monitor,receiver,platform;
    Method pilfer,disposeMonitor,disposeReceiver;
    int first=-1,second=-1;
    float x1,y1,x2,y2;
    boolean active,horizontal;
    int edge=-1;
    boolean edgeRejected,edgeOpened,edgeClaimed,edgeHandle;
    final UpperAppGesture appGesture;
    TopGestureMonitor(UpperPane pane){this.pane=pane;appGesture=new UpperAppGesture(this);}
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
            try{
                Method batching=OwnershipBridge.method(rec,"setBatchingEnabled",boolean.class);
                if(batching.getReturnType()!=void.class)throw new NoSuchMethodException("input batching contract");
                batching.invoke(g.receiver,false);
            }catch(ReflectiveOperationException unavailable){diagnostic("UPPER_GESTURE","native_batching;reason="+unavailable);}
            return g;
        }catch(Exception|LinkageError missing){g.close();pane.host.log("顶部翻页及双指操作不可用："+missing);return null;}
    }
    void reset(){
        appGesture.reset();
        first=second=-1;
        if(active && !pane.owner.closed && pane.roll.running)pane.roll.settle(false);
        active=false;horizontal=false;
        edge=-1;edgeRejected=edgeOpened=edgeClaimed=edgeHandle=false;
    }
    boolean inside(MotionEvent e,int n){
        return e.getRawY(n)>=0 && e.getRawY(n)<pane.host.geometry.contentHeight && e.getRawX(n)>=0 && e.getRawX(n)<pane.host.geometry.width;
    }
    void onTouch(MotionEvent e)throws Exception{
        if(!e.isFromSource(InputDevice.SOURCE_TOUCHSCREEN) || (Integer)call(e,"getDisplayId")!=0)return;
        int op=e.getActionMasked();
        // Also restore upper input after touching the native top page; older
        // EdgeBack handlers retain this observed-touch fallback.
        WorkspaceBackFocus.observe(e);
        WorkspaceSideToolbar toolbar=pane.owner.sideToolbar;
        if(op==MotionEvent.ACTION_DOWN){
            reset();
            if(toolbar!=null)edge=toolbar.edgeStart(e.getRawX(),e.getRawY());
            if(edge>=0){
                x1=e.getRawX();y1=e.getRawY();
                edgeHandle=toolbar.handleContains(x1,y1);
                // The dedicated handle already consumes this entire stream.
                // Reserve it at DOWN so a game's global monitor cannot steal it
                // before our view receives its first MOVE. Content-edge taps
                // and scrolling still wait for a confirmed inward direction.
                if(edgeHandle){pilfer.invoke(platform);edgeClaimed=true;}
                return;
            }
        }
        // Lock ownership to the DOWN origin until UP/CANCEL, across every
        // wallpaper/music/native page. Taps and vertical scrolls stay native.
        if(edge>=0){
            float dx=e.getRawX()-x1,dy=e.getRawY()-y1;
            if(e.getPointerCount()>1 || Math.abs(dy)>pane.owner.dp(8) && Math.abs(dy)>=Math.abs(dx))edgeRejected=true;
            if(op==MotionEvent.ACTION_MOVE && !edgeRejected && !edgeOpened && toolbar!=null && toolbar.usable()
                    && GameSpacePanelMotion.inward(dx,dy,edge==1,Math.max(4,pane.owner.dp(2)))){
                if(!edgeClaimed){pilfer.invoke(platform);edgeClaimed=true;}
                edgeOpened=true;toolbar.setOpen(true);
            }
            if(op==MotionEvent.ACTION_UP && edgeHandle && !edgeRejected && !edgeOpened
                    && toolbar!=null && toolbar.usable() && Math.hypot(dx,dy)<pane.owner.dp(8))toolbar.setOpen(true);
            if(op==MotionEvent.ACTION_UP || op==MotionEvent.ACTION_CANCEL)reset();
            return;
        }
        // Sidebar edge streams must not park or replace the native upper task.
        if(pane.owner.sideToolbar!=null && pane.owner.sideToolbar.ownsGesture(e.getRawX(),e.getRawY())){reset();return;}
        if(appGesture.onTouch(e)){first=second=-1;horizontal=false;return;}
        if(op==MotionEvent.ACTION_DOWN){
            if(pane.canSwitch() && inside(e,0)){first=e.getPointerId(0);x1=e.getRawX();y1=e.getRawY();}return;
        }
        if(first<0)return;
        if(!pane.canSwitch() || op==MotionEvent.ACTION_CANCEL || e.getPointerCount()>2){reset();return;}
        if(pane.visible && second<0 && e.getPointerCount()==1){
            float dx=e.getRawX()-x1,dy=e.getRawY()-y1;
            if(op==MotionEvent.ACTION_MOVE && !horizontal && Math.abs(dx)>pane.owner.dp(24) && Math.abs(dx)>Math.abs(dy)*1.6f){
                pilfer.invoke(platform);horizontal=true;
            }
            if(op==MotionEvent.ACTION_UP){
                boolean switchPage=horizontal && Math.abs(dx)>Math.max(pane.owner.dp(40),pane.host.geometry.width*.15f);
                reset();if(switchPage)pane.owner.deck.fromUpper(dx<0?1:-1);
            }
            return;
        }
        if(op==MotionEvent.ACTION_POINTER_DOWN || op==MotionEvent.ACTION_UP)reset();
    }

    @Override public void close(){reset();if(receiver!=null)try{disposeReceiver.invoke(receiver);}catch(Exception ignored){}
        if(monitor!=null)try{disposeMonitor.invoke(monitor);}catch(Exception ignored){}receiver=monitor=platform=null;}
}
