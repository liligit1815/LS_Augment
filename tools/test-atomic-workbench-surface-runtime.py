"""Run the production VD consumer against the target ROM's TextureView resize order.

NX809J framework-current.jar!classes4.dex TextureView.onSizeChanged (0x3186a4)
calls SurfaceTexture.setDefaultBufferSize(getWidth(), getHeight()) before its
listener. The double below reproduces that overwrite and the getTextureLayer
availability ordering; a listener-only no-op cannot pass these cases.
"""
from pathlib import Path
import runpy
import tempfile

SUPPORT = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-engine.py")))
MEMBER = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-lifecycle.py")))["member"]

SOURCES = {
    "android/content/Context.java": "package android.content;public class Context {}",
    "android/os/SystemClock.java": "package android.os;public class SystemClock {public static long now=1000;public static long elapsedRealtime(){return now;}}",
    "android/graphics/SurfaceTexture.java": r'''package android.graphics;
public class SurfaceTexture {public int width,height,sets;public long timestamp;public boolean abandoned,failNext;
 public void setDefaultBufferSize(int w,int h){if(abandoned||failNext){failNext=false;throw new IllegalStateException("private producer text");}width=w;height=h;sets++;}
 public long getTimestamp(){if(abandoned)throw new IllegalStateException("abandoned");return timestamp;}}
''',
    "android/widget/FrameLayout.java": "package android.widget;public class FrameLayout {public int width,height;public FrameLayout(int w,int h){width=w;height=h;}public int getWidth(){return width;}public int getHeight(){return height;}public static class LayoutParams{public int width,height;public LayoutParams(int w,int h){width=w;height=h;}}}",
    "android/view/TextureView.java": r'''package android.view;
import android.graphics.SurfaceTexture;import android.widget.FrameLayout;
public class TextureView {
 public interface SurfaceTextureListener {void onSurfaceTextureAvailable(SurfaceTexture t,int w,int h);void onSurfaceTextureSizeChanged(SurfaceTexture t,int w,int h);boolean onSurfaceTextureDestroyed(SurfaceTexture t);void onSurfaceTextureUpdated(SurfaceTexture t);}
 public SurfaceTexture texture;private SurfaceTextureListener listener;private int width,height;private boolean layer;public final java.util.ArrayDeque<Runnable> posted=new java.util.ArrayDeque<>();
 private FrameLayout.LayoutParams layout=new FrameLayout.LayoutParams(1,1);
 public TextureView(android.content.Context c){}public boolean post(Runnable r){posted.add(r);return true;}public void drainPosted(){int n=0;while(!posted.isEmpty()&&n++<20)posted.remove().run();if(!posted.isEmpty())throw new AssertionError("unbounded callback drain");}public void setOpaque(boolean value){}public void setSurfaceTextureListener(SurfaceTextureListener l){listener=l;}
 public SurfaceTexture getSurfaceTexture(){return texture;}public int getWidth(){return width;}public int getHeight(){return height;}
 public Object getLayoutParams(){return layout;}public void setLayoutParams(FrameLayout.LayoutParams p){layout=p;romResize(p.width,p.height);}
 public void romGetTextureLayer(SurfaceTexture next,int w,int h){texture=next;width=w;height=h;if(!layer){layer=true;texture.setDefaultBufferSize(w,h);listener.onSurfaceTextureAvailable(texture,w,h);}}
 public void romResize(int w,int h){width=w;height=h;if(texture!=null){texture.setDefaultBufferSize(w,h);listener.onSurfaceTextureSizeChanged(texture,w,h);}}
 public void romFrame(long ns){texture.timestamp=ns;listener.onSurfaceTextureUpdated(texture);}
 public void romDestroy(){SurfaceTexture former=texture;if(former!=null&&listener.onSurfaceTextureDestroyed(former))former.abandoned=true;texture=null;layer=false;}
}
''',
    "android/view/Surface.java": "package android.view;public class Surface {public final android.graphics.SurfaceTexture texture;public int releases;public Surface(android.graphics.SurfaceTexture t){texture=t;}public boolean isValid(){return releases==0&&!texture.abandoned;}public void release(){releases++;}}",
}

HEAD = r'''package ls.augment.com;
import android.graphics.SurfaceTexture;import android.view.Surface;import android.os.SystemClock;import android.widget.FrameLayout;import java.util.*;
public class TestSurfaceRuntime {
 static int cases,checks;interface Case{void run();}static void test(Case c){SystemClock.now=1000;c.run();cases++;}
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static long metric(AtomicWorkbenchSurface v,String key){for(String part:v.diagnosticState().split(";"))if(part.startsWith(key+"="))return Long.parseLong(part.substring(key.length()+1));throw new AssertionError("missing "+key);}
 static void size(SurfaceTexture t,int w,int h){check(t.width==w&&t.height==h,"buffer uses View dimensions instead of VD dimensions: "+t.width+"x"+t.height);}
 static class Fixture implements AtomicWorkbenchSurface.Callback {
  final AtomicWorkbenchSurface view=new AtomicWorkbenchSurface(new android.content.Context());final SurfaceTexture texture=new SurfaceTexture();int created,changed,destroyed,frames;
  Fixture(){view.getHolder().addCallback(this);view.getHolder().setFixedSize(1216,2688);}void attach(){view.romGetTextureLayer(texture,873,1930);}
  public void surfaceCreated(AtomicWorkbenchSurface.Output h){created++;check(h.isValid(),"callback received invalid producer");}
  public void surfaceChanged(AtomicWorkbenchSurface.Output h,int format,int w,int t){changed++;check(w==metric(view,"buffer_expected_width")&&t==metric(view,"buffer_expected_height"),"VD callback reports fitted View size");}
  public void surfaceDestroyed(AtomicWorkbenchSurface.Output h){destroyed++;}public void frameAvailable(long frame,long at){frames++;check(at==SystemClock.now,"observation elapsed clock lost");}
 }
 static class Slot {
  final FrameLayout frame=new FrameLayout(873,2300);final AtomicWorkbenchSurface surface;int displayWidth=1216,displayHeight=2688,cancels;
  final int id=0;int invalidations;
  Slot(AtomicWorkbenchSurface value){surface=value;}void cancelGesture(){cancels++;}void invalidateMainLayout(int id){invalidations++;}
'''

TEST = r'''
 }
 public static void main(String[]args){
 test(()->{Fixture f=new Fixture();check(!f.view.getHolder().isValid()&&f.view.getHolder().getSurface()==null,"unavailable consumer published");check(metric(f.view,"buffer_apply_count")==0&&metric(f.view,"buffer_expected_width")==1216,"pre-availability configuration touched native texture");});
 test(()->{Fixture f=new Fixture();f.attach();size(f.texture,1216,2688);check(f.texture.sets==2,"getTextureLayer overwrite was not simulated and repaired");check(f.created==1&&f.changed==1&&f.view.frameCount()==0,"availability counted a frame or duplicated lifecycle");check(metric(f.view,"texture_view_width")==873&&metric(f.view,"buffer_configured_width")==1216,"View and buffer metadata collapsed");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.view.romFrame(123456789012L);long frameSeq=metric(f.view,"frame_observed_buffer_seq");f.view.romResize(290,641);size(f.texture,1216,2688);check(f.view.getHolder().getSurface()==producer&&producer.releases==0,"resize replaced consumer");check(f.created==1&&f.changed==1&&f.destroyed==0,"visual resize changed VD lifecycle");check(f.view.frameCount()==1&&f.view.lastFrameTimestampNanos()==123456789012L,"resize discarded the retained buffer observation");check(metric(f.view,"buffer_resize_repairs")==1&&metric(f.view,"buffer_apply_seq")>frameSeq&&metric(f.view,"frame_observed_buffer_seq")==frameSeq,"resize repair impersonated a newly consumed frame");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();for(int[] wh:new int[][]{{290,641},{1,1},{873,1930},{280,600},{873,1930}}){f.view.romResize(wh[0],wh[1]);size(f.texture,1216,2688);check(f.view.getHolder().getSurface()==producer,"slot promotion changed consumer");}check(metric(f.view,"buffer_resize_repairs")==5&&metric(f.view,"surface_generation")==1,"role changes changed producer generation");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.texture.setDefaultBufferSize(320,700);f.view.getHolder().setFixedSize(1216,2688);size(f.texture,1216,2688);check(f.changed==1&&f.view.getHolder().getSurface()==producer,"same-size repair emitted resize or replaced producer");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.view.getHolder().setFixedSize(1080,2400);size(f.texture,1080,2400);check(f.changed==2&&f.view.getHolder().getSurface()==producer,"VD resolution update replaced consumer");f.view.romResize(600,1333);size(f.texture,1080,2400);});
 test(()->{Fixture f=new Fixture();f.attach();long ns=128474123456L;SystemClock.now=987654;long before=System.nanoTime();f.view.romFrame(ns);long after=System.nanoTime();check(f.view.lastFrameObservedNanos()>=before&&f.view.lastFrameObservedNanos()<=after&&metric(f.view,"frame_observed_nano_ns")==f.view.lastFrameObservedNanos(),"callback nano observation missing or outside observation interval");check(f.view.lastFrameTimestampNanos()==ns&&f.view.lastFrameElapsed()==987654,"producer time was converted or replaced by callback time");check(metric(f.view,"frame_raw_ns")==ns&&f.view.diagnosticState().contains("frame_clock=producer_unspecified"),"diagnostics claimed an unproved timestamp clock domain");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.view.romFrame(9000);f.view.romDestroy();check(producer.releases==1&&f.destroyed==1&&!f.view.getHolder().isValid(),"destroy did not release exact consumer once");check(f.view.frameCount()==0&&f.view.lastFrameTimestampNanos()==0&&f.view.lastFrameElapsed()==0&&f.view.lastFrameObservedNanos()==0&&metric(f.view,"buffer_configured_width")==0,"destroy retained frame/readiness metadata");int sets=f.texture.sets;f.view.getHolder().setFixedSize(1080,2400);check(f.texture.sets==sets,"fixed-size request touched destroyed texture");});
 test(()->{Fixture f=new Fixture();f.attach();Surface old=f.view.getHolder().getSurface();f.view.romFrame(1000);f.view.romDestroy();SurfaceTexture next=new SurfaceTexture();f.view.romGetTextureLayer(next,600,1200);size(next,1216,2688);check(f.view.frameCount()==0&&metric(f.view,"surface_generation")==2&&f.created==2,"new consumer inherited old frame evidence");f.view.onSurfaceTextureSizeChanged(f.texture,2,2);f.view.onSurfaceTextureUpdated(f.texture);f.view.onSurfaceTextureDestroyed(f.texture);check(f.view.getHolder().isValid()&&old.releases==1&&f.destroyed==1,"late old-texture callback affected new consumer");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.view.romFrame(7654);f.texture.setDefaultBufferSize(10,10);f.view.onSurfaceTextureAvailable(f.texture,10,10);size(f.texture,1216,2688);check(f.view.getHolder().getSurface()==producer&&f.created==1&&f.view.frameCount()==1,"duplicate availability rebuilt current producer");});
 test(()->{Fixture f=new Fixture();f.attach();Surface producer=f.view.getHolder().getSurface();f.texture.failNext=true;f.view.getHolder().setFixedSize(1080,2400);check(!f.view.getHolder().isValid()&&f.view.getHolder().getSurface()==null,"failed buffer request exposed wrong-size output");check(metric(f.view,"buffer_apply_failures")==1&&!f.view.diagnosticState().contains("private producer text"),"failure metadata absent or disclosed message");f.view.romFrame(1000);check(f.view.frameCount()==0,"unconfigured output admitted frame evidence");f.view.getHolder().setFixedSize(1080,2400);size(f.texture,1080,2400);check(f.view.getHolder().getSurface()==producer&&f.created==1&&f.changed==2,"same-size retry failed to recover existing consumer or lost pending VD-dimensions notification");});
 test(()->{Fixture f=new Fixture();f.texture.failNext=true;f.view.onSurfaceTextureAvailable(f.texture,873,1930);check(f.view.getHolder().getSurface()==null&&f.created==0,"failed initial buffer created usable producer");f.view.onSurfaceTextureSizeChanged(f.texture,873,1930);check(f.view.getHolder().isValid()&&f.created==1&&f.changed==1,"initial configuration failure could not recover");size(f.texture,1216,2688);});
 test(()->{Fixture f=new Fixture();f.attach();int sets=f.texture.sets;boolean denied=false;try{f.view.getHolder().setFixedSize(0,2400);}catch(IllegalArgumentException e){denied=true;}check(denied&&f.texture.sets==sets&&metric(f.view,"buffer_expected_width")==1216,"invalid size changed active producer");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(700);f.view.romDestroy();long attempts=metric(f.view,"buffer_apply_count");f.view.onSurfaceTextureDestroyed(f.texture);f.view.onSurfaceTextureSizeChanged(f.texture,30,30);f.view.onSurfaceTextureUpdated(f.texture);check(f.destroyed==1&&metric(f.view,"buffer_apply_count")==attempts&&f.view.frameCount()==0,"late destroyed callbacks mutated lifecycle");});
 test(()->{Fixture f=new Fixture();f.attach();Slot slot=new Slot(f.view);Surface producer=f.view.getHolder().getSurface();for(int[] wh:new int[][]{{873,2300},{290,770},{1,1},{873,2300}}){slot.frame.width=wh[0];slot.frame.height=wh[1];slot.fitSurface();size(f.texture,1216,2688);check(f.view.getHolder().getSurface()==producer,"fitSurface rebuilt producer");float expected=Math.min(wh[0]/1216f,wh[1]/2688f);check(f.view.getWidth()==Math.max(1,Math.round(1216*expected))&&f.view.getHeight()==Math.max(1,Math.round(2688*expected)),"production aspect-fit layout changed");AtomicWorkbenchInputPolicy.Geometry g=AtomicWorkbenchInputPolicy.Geometry.create(0,0,f.view.getWidth(),f.view.getHeight(),1216,2688,0);float[] far=g.map(f.view.getWidth(),f.view.getHeight());check(Math.abs(far[0]-1215)<0.01&&Math.abs(far[1]-2687)<0.01,"fitted input no longer reaches full VD");}check(slot.cancels>0&&f.created==1,"geometry change missed gesture cancel or rebuilt consumer");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(1000);long geometry=f.view.bufferGeometryGeneration(),ack=metric(f.view,"buffer_apply_seq");check(f.view.isFrameFromConfiguredGeometry(),"initial observed frame has no geometry identity");f.view.getHolder().setFixedSize(1216,2688);check(metric(f.view,"buffer_apply_seq")>ack&&f.view.bufferGeometryGeneration()==geometry&&f.view.lastFrameGeometryGeneration()==geometry&&f.view.isFrameFromConfiguredGeometry(),"same-size static retry invalidated a valid frame with an ACK sequence");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(1000);long old=f.view.lastFrameGeometryGeneration();f.view.romResize(290,641);check(f.view.bufferGeometryGeneration()>old&&f.view.lastFrameGeometryGeneration()==old&&!f.view.isFrameFromConfiguredGeometry(),"real ROM resize admitted its retained pre-repair frame");check(f.view.frameCount()==1,"geometry invalidation discarded frame history");f.view.romFrame(2000);check(f.view.isFrameFromConfiguredGeometry()&&f.view.lastFrameGeometryGeneration()==f.view.bufferGeometryGeneration(),"post-repair callback did not establish new geometry observation");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(1000);long old=f.view.bufferGeometryGeneration();f.view.getHolder().setFixedSize(1080,2400);check(f.view.bufferGeometryGeneration()>old&&!f.view.isFrameFromConfiguredGeometry(),"changed VD resolution reused old frame geometry");f.view.romFrame(2000);check(f.view.isFrameFromConfiguredGeometry(),"new VD resolution callback remained rejected");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(1000);long old=f.view.bufferGeometryGeneration();f.texture.failNext=true;f.view.getHolder().setFixedSize(1216,2688);check(!f.view.isFrameFromConfiguredGeometry()&&f.view.bufferGeometryGeneration()==old,"configuration failure left a healthy frame or pretended a repaired generation");f.view.getHolder().setFixedSize(1216,2688);check(f.view.getHolder().isValid()&&f.view.bufferGeometryGeneration()>old&&!f.view.isFrameFromConfiguredGeometry(),"failure recovery reused the pre-failure frame");f.view.romFrame(2000);check(f.view.isFrameFromConfiguredGeometry(),"post-recovery frame remained rejected");check(metric(f.view,"buffer_geometry_generation")==f.view.bufferGeometryGeneration()&&metric(f.view,"frame_geometry_generation")==f.view.lastFrameGeometryGeneration(),"typed geometry identity differs from diagnostics");});
 test(()->{Fixture f=new Fixture();f.attach();f.view.romFrame(1000);long geometry=f.view.bufferGeometryGeneration();f.view.romResize(1216,2688);check(f.view.bufferGeometryGeneration()==geometry&&f.view.isFrameFromConfiguredGeometry(),"ROM writing identical VD dimensions forced unnecessary redraw");f.view.romResize(1,1);check(f.view.bufferGeometryGeneration()>geometry&&!f.view.isFrameFromConfiguredGeometry(),"temporary off-screen geometry retained old readiness");});
 test(()->{Fixture f=new Fixture(){public void surfaceCreated(AtomicWorkbenchSurface.Output h){super.surfaceCreated(h);h.setFixedSize(1216,2688);check(changed==0,"dimensions reentered creation callback");}public void surfaceChanged(AtomicWorkbenchSurface.Output h,int format,int w,int t){super.surfaceChanged(h,format,w,t);h.setFixedSize(w,t);}};f.attach();check(f.created==1&&f.changed==1,"same-size callback reentry repeated lifecycle");check(f.view.posted.isEmpty(),"stable callback unnecessarily posted a drain");});
 test(()->{Fixture f=new Fixture(){public void surfaceCreated(AtomicWorkbenchSurface.Output h){super.surfaceCreated(h);h.setFixedSize(1080,2400);h.setFixedSize(720,1600);check(changed==0,"new dimensions reentered creation");}};f.attach();size(f.texture,720,1600);check(f.created==1&&f.changed==1,"creation did not coalesce latest reentrant dimensions");});
 test(()->{List<String> delivered=new ArrayList<>();Fixture f=new Fixture(){int depth;public void surfaceChanged(AtomicWorkbenchSurface.Output h,int format,int w,int t){check(++depth==1,"different dimensions recursively reentered changed");try{super.surfaceChanged(h,format,w,t);delivered.add(w+"x"+t);if(changed==1)h.setFixedSize(1080,2400);else if(changed==2)h.setFixedSize(720,1600);}finally{depth--;}}};f.attach();check(delivered.equals(List.of("1216x2688","1080x2400","720x1600")),"real reentrant dimension change was lost or misordered: "+delivered);check(f.created==1&&f.changed==3&&metric(f.view,"surface_generation")==1,"dimension drain recreated producer");});
 test(()->{Fixture f=new Fixture(){int depth;public void surfaceChanged(AtomicWorkbenchSurface.Output h,int format,int w,int t){check(++depth==1,"bounded drain used recursive callback");try{super.surfaceChanged(h,format,w,t);if(changed<25)h.setFixedSize(1216-changed,2688-changed);}finally{depth--;}}};f.attach();check(f.changed<25&&f.changed<=16&&f.view.posted.size()==1,"reentrant client monopolized a synchronous dispatch");f.view.drainPosted();check(f.created==1&&f.changed==25&&f.view.posted.isEmpty(),"deferred drain lost latest dimensions or duplicated creation");size(f.texture,1192,2664);});
 test(()->{Fixture f=new Fixture(){public void surfaceCreated(AtomicWorkbenchSurface.Output h){super.surfaceCreated(h);throw new IllegalStateException("client callback failure");}};boolean failed=false;try{f.attach();}catch(IllegalStateException expected){failed=true;}check(failed&&f.created==1,"client callback exception was swallowed or repeated creation");f.view.getHolder().setFixedSize(1216,2688);check(f.changed==1&&f.view.getHolder().isValid(),"callback exception stranded dispatch guard/pending dimensions");});
 System.out.println("SURFACE RUNTIME RESULT "+cases+" cases; "+checks+" assertions");}
}
'''


# Explicit original consumer-only scenario: no physical shield stream exists here.
_candidate=(SUPPORT["SRC"] / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
HEAD=HEAD.replace('import android.graphics.SurfaceTexture;', 'import static ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.*;import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.RailSide;import android.graphics.SurfaceTexture;')
HEAD+=MEMBER(_candidate,'private static final class NativeShieldLayoutHold')+"\nNativeShieldLayoutHold nativeShieldLayoutHold;boolean nativeShieldLayoutDeferred;\n"+MEMBER(_candidate,'private boolean deferNativeShieldLayout()')+"\nboolean nativeShieldLayoutCurrent(NativeShieldLayoutHold hold){throw new AssertionError(\"physical identity is not configured in original consumer fixture\");}void nativeShieldLayoutDiagnostic(NativeShieldLayoutHold hold,String stage,long event){throw new AssertionError(\"physical diagnostics are not configured in original consumer fixture\");}\n"
for _name in ['AtomicWorkbenchWindowPresentationPolicy.java','AtomicWorkbenchWindowLayoutPlan.java']:
 SOURCES['ls/augment/com/'+_name]=(SUPPORT["SRC"]/_name).read_text(encoding='utf-8')

def main():
    activity = (SUPPORT["SRC"] / "AtomicWorkbenchActivity.java").read_text(encoding="utf-8")
    source = HEAD + MEMBER(activity, "void fitSurface()") + TEST
    with tempfile.TemporaryDirectory(prefix="lsa-workbench-surface-") as temporary:
        SUPPORT["compile_run"](Path(temporary), {**SOURCES, "ls/augment/com/TestSurfaceRuntime.java": source},
                               ["AtomicWorkbenchSurface.java", "AtomicWorkbenchInputPolicy.java"],
                               "ls.augment.com.TestSurfaceRuntime")


if __name__ == "__main__":
    main()
