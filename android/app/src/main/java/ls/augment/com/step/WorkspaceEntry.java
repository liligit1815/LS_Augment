package ls.augment.com.step;

import android.os.Handler;
import android.view.SurfaceControl;
import android.view.View;
import java.util.function.Consumer;
import static ls.augment.com.step.StepRuntime.call;

/** One invisible parent for preparation, retained until its original tasks have been returned. */
final class WorkspaceEntry implements AutoCloseable {
    static final long TIMEOUT_MS=12000;
    final SurfaceControl surface;
    final int parentLayer;
    boolean preparing=true, finishing, complete, closed;
    int frameGeneration;

    WorkspaceEntry(SurfaceControl parent) throws Exception {
        NativeWorkspaceGuard.validSurface(parent);
        parentLayer=(Integer)call(parent,"getLayerId");
        SurfaceControl.Builder builder=new SurfaceControl.Builder().setName("StepEntryGroup").setParent(parent).setHidden(true);
        call(builder,"setContainerLayer");
        surface=builder.build();
        try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            // Keep WM visibility/drawing intact. Only composition is gated, so a
            // restored application's real window can finish drawing behind it.
            WorkspaceSurfaceInput.blockChildren(tx,surface);
            tx.setAlpha(surface,0).setVisibility(surface,true).apply();
        }catch(Exception|Error failure){close();throw failure;}
    }
    SurfaceControl parent(SurfaceControl actual){
        NativeWorkspaceGuard.validSurface(actual);NativeWorkspaceGuard.validSurface(surface);
        if(closed || (Integer)call(actual,"getLayerId")!=parentLayer)
            throw new IllegalStateException("整组副栏父层已经重建");
        return surface;
    }
    void frames(Handler handler,Runnable done,Consumer<String> failure,View... views){
        final int generation=++frameGeneration;
        final CommitBarrier group=new CommitBarrier();
        final boolean[] delivered={false};
        try{for(View view:views){
            if(view==null || !view.isAttachedToWindow() || !view.isHardwareAccelerated())
                throw new IllegalStateException("整组工作区绘制窗口未就绪");
            final int index=group.add();
            view.getViewTreeObserver().registerFrameCommitCallback(()->handler.post(()->{
                if(closed || generation!=frameGeneration || delivered[0])return;
                group.commit(index);
                if(group.ready()){
                    delivered[0]=true;
                    try{done.run();}catch(RuntimeException|LinkageError error){failure.accept("整组绘制收尾失败："+error);}
                }
            }));
        }
        group.seal();
        for(View view:views)view.invalidate();
        handler.postDelayed(()->{
            if(!closed && generation==frameGeneration && !delivered[0]){
                delivered[0]=true;failure.accept("整组工作区绘制提交超时");
            }
        },1200);
        }catch(RuntimeException|LinkageError error){delivered[0]=true;failure.accept("整组绘制确认不可用："+error);}
    }
    void cancelFrames(){frameGeneration++;}
    @Override public void close(){
        if(closed)return;
        closed=true;cancelFrames();
        try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            if(surface.isValid())tx.setVisibility(surface,false).reparent(surface,null).apply();
        }finally{surface.release();}
    }
}
