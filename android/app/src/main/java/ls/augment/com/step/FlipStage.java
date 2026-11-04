package ls.augment.com.step;

import android.os.Bundle;
import android.view.AttachedSurfaceControl;
import android.view.SurfaceControl;
import android.view.View;
import static ls.augment.com.step.StepRuntime.call;

/** Physical, non-interactive animation parent below the input guard's transparent buffer. */
final class FlipStage implements AutoCloseable {
    final SurfaceControl band;
    final SurfaceControl[] lanes=new SurfaceControl[SideSlots.MAX_COUNT+1];
    SurfaceControl backdrop;
    final SurfaceControl[] hints=new SurfaceControl[2];

    FlipStage(View guard,WorkspaceLayout layout,int selected,int[] tasks,int count,boolean sideLeft,android.graphics.Bitmap wallpaper) throws Exception {
        AttachedSurfaceControl root=guard.getRootSurfaceControl();
        int[] at=new int[2]; guard.getLocationOnScreen(at);
        if(root==null || at[0]>0 || at[1]>layout.top || guard.getWidth()+at[0]<layout.width
                || guard.getHeight()+at[1]<layout.height)throw new IllegalStateException("输入保护未覆盖转场区域");
        SurfaceControl.Builder b=new SurfaceControl.Builder().setName("StepFlipBand").setHidden(true);
        call(b,"setColorLayer");
        band=b.build();
        try(SurfaceControl.Transaction tx=root.buildReparentTransaction(band)) {
            if(tx==null)throw new IllegalStateException("原屏动画父层无法挂载");
            tx.setLayer(band,-1).setPosition(band,-at[0],layout.top-at[1])
                    .setCrop(band,new android.graphics.Rect(0,0,layout.width,layout.railHeight));
            call(tx,"setColor",band,new float[]{.125f,.13f,.15f});
            for(int i=0;i<lanes.length;i++){
                if(i>0 && tasks[i-1]<0)continue;
                SurfaceControl.Builder lane=new SurfaceControl.Builder().setName("StepFlipLane"+i).setParent(band);
                call(lane,"setContainerLayer");
                lanes[i]=lane.build();
                tx.setLayer(lanes[i],i==selected+1?11:i==0?10:i).setVisibility(lanes[i],true);
            }
            tx.apply(); // The band stays hidden until all original layers are attached in one transaction.
        } catch(Exception|Error e){close();throw e;}
        if(wallpaper!=null && !wallpaper.isRecycled())wallpaperLayer(layout,wallpaper);
        boolean swaps=tasks[selected]>=0;
        for(int face=0;face<(swaps?2:1);face++){
            try{hints[face]=emptyHints(layout,count,tasks,selected,face==0?sideLeft:!sideLeft,face==1);}
            catch(RuntimeException|LinkageError unsupported){StepRuntime.report(null,0,"空格转场底图不可用："+unsupported,-1);}
        }
    }
    void wallpaperLayer(WorkspaceLayout layout,android.graphics.Bitmap source){
        int w=Math.max(1,layout.width/24),h=Math.max(1,layout.railHeight/24);
        try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            android.graphics.Bitmap small=android.graphics.Bitmap.createBitmap(w,h,android.graphics.Bitmap.Config.ARGB_8888);
            android.graphics.Canvas canvas=new android.graphics.Canvas(small);
            float scale=Math.max((float)layout.width/source.getWidth(),(float)layout.height/source.getHeight());
            float x=(layout.width-source.getWidth()*scale)/2,y=(layout.height-source.getHeight()*scale)/2-layout.top;
            canvas.scale(w/(float)layout.width,h/(float)layout.railHeight);
            canvas.drawBitmap(source,null,new android.graphics.RectF(x,y,x+source.getWidth()*scale,y+source.getHeight()*scale),
                    new android.graphics.Paint(android.graphics.Paint.FILTER_BITMAP_FLAG));
            canvas.drawColor(0x60303943);
            android.graphics.Bitmap gpu=small.copy(android.graphics.Bitmap.Config.HARDWARE,false);
            if(gpu==null)return;
            try(android.hardware.HardwareBuffer buffer=gpu.getHardwareBuffer()){
                if(buffer==null)return;
                backdrop=new SurfaceControl.Builder().setName("StepFlipWallpaper").setParent(band).setBufferSize(w,h).build();
                tx.setBuffer(backdrop,buffer).setScale(backdrop,(float)layout.width/w,(float)layout.railHeight/h)
                        .setLayer(backdrop,-1).setVisibility(backdrop,true).apply();
            }
        }catch(RuntimeException|LinkageError unavailable){if(backdrop!=null){backdrop.release();backdrop=null;}}
    }
    private SurfaceControl emptyHints(WorkspaceLayout l,int count,int[] tasks,int selected,boolean left,boolean destination){
        int w=Math.max(1,l.sideWidth/3),h=Math.max(1,l.railHeight/3);
        android.graphics.Bitmap bitmap=android.graphics.Bitmap.createBitmap(w,h,android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas=new android.graphics.Canvas(bitmap);canvas.scale(w/(float)l.sideWidth,h/(float)l.railHeight);
        android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        for(int i=0;i<count;i++)if(tasks[i]<0 && !(destination && i==selected)){
            int y=l.rowTop(i,count),height=l.rowHeight(i,count);
            paint.setColor(0x70abb8c8);canvas.drawRect(0,y,l.sideWidth,y+height,paint);
            float x=l.sideWidth*.5f,mid=y+height*.5f,r=Math.min(height,l.sideWidth)*.12f;
            paint.setColor(0xb51d2937);paint.setStrokeWidth(Math.max(3,r*.12f));
            canvas.drawLine(x-r,mid,x+r,mid,paint);canvas.drawLine(x,mid-r,x,mid+r,paint);
        }
        android.graphics.Bitmap gpu=bitmap.copy(android.graphics.Bitmap.Config.HARDWARE,false);if(gpu==null)return null;
        SurfaceControl sc=null;
        try(android.hardware.HardwareBuffer buf=gpu.getHardwareBuffer(); SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            if(buf==null)return null;
            sc=new SurfaceControl.Builder().setName("StepEmptySlots").setParent(band).setBufferSize(w,h).build();
            tx.setBuffer(sc,buf).setScale(sc,l.sideWidth/(float)w,l.railHeight/(float)h)
                    .setPosition(sc,left?0:l.width-l.sideWidth,0).setLayer(sc,0).setAlpha(sc,destination?0:1).setVisibility(sc,true).apply();
            return sc;
        }catch(RuntimeException|Error failure){if(sc!=null)sc.release();throw failure;}
    }
    Bundle surfaces(Bundle args){
        args.putParcelable("band",band);args.putParcelableArray("hints",hints);
        args.putParcelableArray("lanes",lanes);
        return args;
    }
    @Override public void close(){
        try(SurfaceControl.Transaction tx=new SurfaceControl.Transaction()){
            if(band.isValid())tx.setVisibility(band,false).reparent(band,null).apply();
        }finally{
            for(SurfaceControl lane:lanes)if(lane!=null)lane.release();
            if(backdrop!=null)backdrop.release();
            for(SurfaceControl hint:hints)if(hint!=null)hint.release();
            band.release();
        }
    }
}
