package ls.augment.com.step;

import android.content.Context;
import android.graphics.PixelFormat;
import android.os.Handler;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import java.util.function.Consumer;

/** Short lived, non-focusable touch owner; never waits indefinitely for a system callback. */
final class WorkspaceInput {
    static final String TITLE = "DuoStepInputGuard";
    final Context context;
    final Handler main;
    final WindowManager windows;
    final Consumer<String> log, failure;
    final InputLease lease = new InputLease();
    View view;
    long ticket, began;
    long groupDeadline;
    int touches;
    Runnable released;
    void holdEntry(long deadline){groupDeadline=deadline;}
    void endEntryHold(){groupDeadline=0;began=SystemClock.uptimeMillis();}
    WorkspaceInput(Context context, Handler main, Consumer<String> log, Consumer<String> failure) {
        this.context=context; this.main=main; this.log=log; this.failure=failure;
        windows=context.getSystemService(WindowManager.class);
    }
    void acquire(Runnable ready) {
        final long expected = ticket = lease.acquire();
        released = null;
        try {
            if (view==null) {
                began = SystemClock.uptimeMillis();
                touches = 0;
                view=new android.widget.FrameLayout(context); view.setBackgroundColor(0x01000000);
                view.setOnTouchListener((v,event)->{
                    touches++; lease.touch(event.getActionMasked()); maybeRelease(expectedTicket()); return true;
                });
                WindowManager.LayoutParams p=new WindowManager.LayoutParams(-1,-1,
                        WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                        WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE|WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                                |WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED,PixelFormat.TRANSLUCENT);
                p.gravity=Gravity.TOP|Gravity.LEFT; p.setFitInsetsTypes(0); p.setTitle(TITLE);
                p.layoutInDisplayCutoutMode=WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
                windows.addView(view,p);
                trace("acquired");
            }
            afterFrame(expected,ready);
            main.postAtTime(()->{
                if (!lease.current(expected)) return;
                trace("timeout");forceRemove(); failure.accept("输入保护等待超时，已解除触摸拦截并请求归还");
            }, groupDeadline>0?groupDeadline:began+4000);
        } catch(Throwable error) { forceRemove(); failure.accept("输入保护不可用: "+error); }
    }
    long expectedTicket(){return ticket;}
    void afterFrame(long expected,Runnable action) {
        View target=view;
        if(target==null)throw new IllegalStateException("input window missing");
        target.getViewTreeObserver().registerFrameCommitCallback(()->main.post(()->{
            if(lease.current(expected)&&target==view)try{action.run();}
            catch(Throwable error){forceRemove();failure.accept("交接末帧处理失败: "+error);}
        }));
        target.invalidate();
    }
    void release(Runnable done) {
        if(view==null){done.run();return;}
        final long expected=ticket;
        released=done;
        trace("release_requested");
        try { afterFrame(expected,()->{lease.frame(expected);maybeRelease(expected);}); }
        catch(Throwable error){forceRemove();failure.accept("输入保护末帧未确认: "+error);}
    }
    void maybeRelease(long expected) {
        if(!lease.releasable(expected))return;
        Runnable done=released;
        log.accept("输入保护解除；触摸事件="+touches+"；持有="+(SystemClock.uptimeMillis()-began)+"ms");
        forceRemove();if(done!=null)done.run();
    }
    void forceRemove() {
        lease.close();released=null;groupDeadline=0;
        if(view!=null){try{windows.removeViewImmediate(view);}catch(IllegalArgumentException detached){}finally{view=null;trace("removed");}}
    }
    void trace(String phase){
        StepRuntime.diagnostic("INPUT_GUARD","phase="+phase+";ticket="+ticket+";attached="+(view!=null && view.isAttachedToWindow())
                +";touches="+touches+";heldMs="+(SystemClock.uptimeMillis()-began));
    }
}
