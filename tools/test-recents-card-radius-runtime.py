"""Run the production radius hook against native-call boundary doubles.

The fixtures preserve the inspected stock/260005/260027 calculation, snapshot
dispatch and live-surface consumption order. They do not emulate GPU pixels.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/util/DisplayMetrics.java': '''package android.util;public class DisplayMetrics {public float density=2f;public int densityDpi=320,widthPixels=1000,heightPixels=2100;}''',
    'android/content/res/Resources.java': '''package android.content.res;public class Resources {public final android.util.DisplayMetrics metrics=new android.util.DisplayMetrics();public android.util.DisplayMetrics getDisplayMetrics(){return metrics;}}''',
    'android/content/Context.java': '''package android.content;public class Context {public final android.content.res.Resources resources=new android.content.res.Resources();public final android.view.Display display=new android.view.Display();public final android.content.pm.PackageManager packages=new android.content.pm.PackageManager();public Context getApplicationContext(){return this;}public android.content.res.Resources getResources(){return resources;}public android.content.pm.PackageManager getPackageManager(){return packages;}public String getPackageName(){return "com.zte.mifavor.launcher";}}''',
    'android/content/pm/PackageManager.java': '''package android.content.pm;public class PackageManager {public PackageInfo getPackageInfo(String name,int flags)throws Exception{return new PackageInfo();}}''',
    'android/content/pm/PackageInfo.java': '''package android.content.pm;public class PackageInfo {public long getLongVersionCode(){return 260028L;}}''',
    'android/view/Display.java': '''package android.view;public class Display {public int width=1200,height=2400;public void getRealMetrics(android.util.DisplayMetrics out){out.widthPixels=width;out.heightPixels=height;}}''',
    'android/os/Process.java': '''package android.os;public class Process {public static int myPid(){return 1234;}}''',
    'android/os/SystemClock.java': '''package android.os;public class SystemClock {public static long now=10000;public static long elapsedRealtime(){return now;}}''',
    'android/os/Looper.java': '''package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}''',
    'android/os/Handler.java': '''package android.os;import java.util.*;public class Handler {static final Map<Runnable,Long> queue=new LinkedHashMap<>();public Handler(Looper loop){}public boolean postDelayed(Runnable r,long delay){queue.put(r,SystemClock.now+delay);return true;}public static void advance(long time){SystemClock.now+=time;for(int i=0;i<100;i++){Runnable ready=null;for(Map.Entry<Runnable,Long> e:queue.entrySet())if(e.getValue()<=SystemClock.now){ready=e.getKey();break;}if(ready==null)return;queue.remove(ready);ready.run();}throw new AssertionError("unbounded sampler callbacks");}}''',
    'ls/augment/com/BuildConfig.java': '''package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20511;}''',
    'android/graphics/Rect.java': '''package android.graphics;public class Rect {public int width=300,height=600;public int width(){return width;}public int height(){return height;}}''',
    'android/view/View.java': '''package android.view;public class View {public static final int VISIBLE=0;public int width=300,height=600,invalidations,windowVisibility,visibleWidth=-1,visibleHeight=-1;public float alpha=1,scaleX=1,scaleY=1;public boolean attached=true,shown=true;public final android.content.Context context;public View(android.content.Context c){context=c;}public android.content.Context getContext(){return context;}public int getWidth(){return width;}public int getHeight(){return height;}public boolean isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public int getWindowVisibility(){return windowVisibility;}public float getAlpha(){return alpha;}public float getScaleX(){return scaleX;}public float getScaleY(){return scaleY;}public Display getDisplay(){return context.display;}public boolean getGlobalVisibleRect(android.graphics.Rect out){out.width=visibleWidth<0?width:visibleWidth;out.height=visibleHeight<0?height:visibleHeight;return out.width>0&&out.height>0;}public void invalidate(){invalidations++;}}''',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
import java.util.*;import android.content.Context;
public class FeatureSettings {
    static boolean enabled;static int offset;static final List<Runnable> listeners=new ArrayList<>();
    static void diagnostic(Context c,String key,String value){throw new AssertionError("radius must not use diagnostics");}
    static boolean enabled(Context c,String k){return enabled;}static int integer(Context c,String k,int fallback,int min,int max){return Math.max(min,Math.min(max,offset));}
    static boolean addSnapshotListener(Context c,Runnable listener){listeners.add(listener);return true;}
    static void publish(boolean e,int o){enabled=e;offset=o;for(Runnable r:new ArrayList<>(listeners))r.run();}
}''',
    'ls/augment/com/hook/LauncherRecentsRadiusPublisher.java': '''package ls.augment.com.hook;
final class LauncherRecentsRadiusPublisher {static String identity,payload;LauncherRecentsRadiusPublisher(android.content.Context context){}void publish(String geometry,String value){identity=geometry;payload=value;}}
''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
    public static AugmentModule active;public AugmentModule(){active=this;}
    interface Interceptor {Object intercept(Chain c)throws Throwable;}
    interface Chain {Object getThisObject();Object getArg(int index);Object proceed()throws Throwable;}
    static class Registration {final Method method;final String id;final Interceptor interceptor;Registration(Method m,String id,Interceptor i){method=m;this.id=id;interceptor=i;}}
    static class Builder {final Method method;final String id;Builder(Method m,String id){method=m;this.id=id;}Registration intercept(Interceptor i){return new Registration(method,id,i);}}
    final Map<String,Registration> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();final List<Method> deoptimized=new ArrayList<>();
    Builder prepareFeatureHook(Method m,String id,boolean before){return new Builder(m,id);}void registerFeatureHook(Registration r){hooks.put(r.id,r);}void logFeatureError(String n,Throwable e){errors.add(e);}void deoptimize(Method m){deoptimized.add(m);}
    public Object call(String id,Object owner,Object...args)throws Throwable {Registration r=hooks.get("launcher.recents.radius."+id);if(r==null)throw new AssertionError("missing "+id);return r.interceptor.intercept(new Chain(){public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}public Object proceed()throws Throwable {try{return r.method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}});}
}''',
    'com/android/quickstep/FullscreenDrawParams.java': '''package com.android.quickstep;
public class FullscreenDrawParams {public float currentCornerRadius,taskCornerRadius=30,windowCornerRadius=50;public int calls;
    public void setProgress(float p,float s,float t){calls++;currentCornerRadius=((1f-p)*taskCornerRadius+p*windowCornerRadius)/s/t;}
}''',
    'com/android/quickstep/DesktopFullscreenDrawParams.java': '''package com.android.quickstep;public class DesktopFullscreenDrawParams extends FullscreenDrawParams {}''',
    'com/android/quickstep/views/TaskContainer.java': '''package com.android.quickstep.views;public class TaskContainer {public android.view.View snapshot;public TaskContainer(android.view.View view){snapshot=view;}public final android.view.View getSnapshotView(){return snapshot;}}''',
    'com/android/quickstep/task/thumbnail/TaskThumbnailView.java': '''package com.android.quickstep.task.thumbnail;public final class TaskThumbnailView extends android.view.View {public android.graphics.Rect outline;public TaskThumbnailView(android.content.Context c){super(c);}public android.graphics.Rect getOutlineBounds(){return outline;}}''',
    'com/android/quickstep/views/RecentsView.java': '''package com.android.quickstep.views;public class RecentsView extends android.view.View {public int redraws,rotation;public boolean mOverviewStateEnabled=true;public int getCurRotation(){return rotation;}public com.android.quickstep.util.TaskViewSimulator live;public RecentsView(android.content.Context c){super(c);}public void redrawLiveTile()throws Throwable {redraws++;if(live!=null)ls.augment.com.hook.AugmentModule.active.call("live",live,new com.android.quickstep.util.TransformParams(),new com.android.quickstep.util.SurfaceTransaction(),false);}}''',
    'com/android/quickstep/views/TaskView.java': '''package com.android.quickstep.views;
import android.content.Context;import android.view.View;import java.util.*;import com.android.quickstep.FullscreenDrawParams;import ls.augment.com.hook.AugmentModule;
public class TaskView extends View {
    public final FullscreenDrawParams params=new FullscreenDrawParams();public FullscreenDrawParams extra;public float progress,recentsScale=1,taskScale=1,drawnRadius;
    public boolean fan,fail,skip;public final List<TaskContainer> cards=new ArrayList<>();public final RecentsView recents;
    public TaskView(Context c,RecentsView r){super(c);recents=r;cards.add(new TaskContainer(new View(c)));}
    public final List<TaskContainer> getTaskContainers(){return cards;}public final RecentsView getRecentsView(){return recents;}
    protected void updateFullscreenParams()throws Throwable {AugmentModule.active.call("task",this,params);drawnRadius=params.currentCornerRadius;}
    protected final void updateFullscreenParams(FullscreenDrawParams value)throws Throwable {
        if(skip)return;
        if(extra!=null)AugmentModule.active.call("progress",extra,0f,1f,1f);
        AugmentModule.active.call("progress",value,progress,recentsScale,taskScale);
        if(fan){float shortSide=Float.POSITIVE_INFINITY;for(TaskContainer card:cards)shortSide=Math.min(shortSide,Math.min(card.snapshot.width,card.snapshot.height));float base=Math.min(value.currentCornerRadius,shortSide*.1f);value.currentCornerRadius=base+(value.currentCornerRadius-base)*progress;}
        if(fail)throw new IllegalStateException("native failure");
    }
    public void render()throws Throwable {updateFullscreenParams();}
}''',
    'com/android/quickstep/util/TransformParams.java': '''package com.android.quickstep.util;public class TransformParams {}''',
    'com/android/quickstep/util/SurfaceTransaction.java': '''package com.android.quickstep.util;public class SurfaceTransaction {}''',
    'com/android/quickstep/util/TaskViewSimulator.java': '''package com.android.quickstep.util;
import android.content.Context;import android.graphics.Rect;import com.android.quickstep.FullscreenDrawParams;import ls.augment.com.hook.AugmentModule;
public class TaskViewSimulator {
    public final Context mContext;public FullscreenDrawParams mCurrentFullscreenParams=new FullscreenDrawParams();public final Rect mTaskRect=new Rect();
    public float progress,recentsScale=1,taskScale=1,surfaceRadius;public boolean fail;public com.android.quickstep.views.TaskView nestedTask;
    public TaskViewSimulator(Context c){mContext=c;}
    public void apply(TransformParams transform,SurfaceTransaction transaction,boolean flag)throws Throwable {
        if(nestedTask!=null)nestedTask.render();
        AugmentModule.active.call("progress",mCurrentFullscreenParams,progress,recentsScale,taskScale);
        surfaceRadius=mCurrentFullscreenParams.currentCornerRadius;
        if(fail)throw new IllegalStateException("native live failure");
    }
    public void render()throws Throwable {AugmentModule.active.call("live",this,new TransformParams(),new SurfaceTransaction(),false);}
}''',
    'ls/augment/com/hook/TestRecentsCardRadiusRuntime.java': '''package ls.augment.com.hook;
import android.content.Context;import android.view.View;import com.android.quickstep.*;import com.android.quickstep.views.*;import com.android.quickstep.util.*;
public class TestRecentsCardRadiusRuntime {
    static int checks;
    static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static void near(float actual,float expected,String why){check(Math.abs(actual-expected)<.0001f,why+": "+actual+" != "+expected);}
    public static void main(String[] args)throws Throwable {
        AugmentModule module=new AugmentModule();LauncherRecentsCardRadiusHook.install(module,TestRecentsCardRadiusRuntime.class.getClassLoader());
        check(module.hooks.size()==3,"all exact native boundaries installed");check(module.errors.isEmpty(),"no install error");
        Context context=new Context();RecentsView recents=new RecentsView(context);TaskView task=new TaskView(context,recents);TaskViewSimulator live=new TaskViewSimulator(context);recents.live=live;
        for(String variant:new String[]{"stock","260005","260027-fan"}) {
            task.fan=variant.endsWith("fan");task.params.taskCornerRadius=70;
            FeatureSettings.publish(false,20);task.render();float original=task.drawnRadius;
            FeatureSettings.publish(true,0);task.render();check(Float.floatToRawIntBits(task.drawnRadius)==Float.floatToRawIntBits(original),variant+" zero exact native");
            FeatureSettings.publish(true,20);near(task.drawnRadius,original+40,variant+" positive relative to complete native result");
            for(int i=0;i<50;i++)task.render();near(task.drawnRadius,original+40,variant+" repeated frames never accumulate");
            near(task.params.taskCornerRadius,70,"task baseline never written");near(task.params.windowCornerRadius,50,"window baseline never written");
            FeatureSettings.publish(true,-10);near(task.drawnRadius,original-20,variant+" negative sharpens");
            FeatureSettings.publish(true,-100);near(task.drawnRadius,0,variant+" no negative radius");
            FeatureSettings.publish(true,100);near(task.drawnRadius,150,variant+" snapshot half-short-side maximum");
            FeatureSettings.publish(false,100);near(task.drawnRadius,original,variant+" off restores without relaunch");check(FeatureSettings.offset==100,"off retains value");
        }
        task.fan=false;task.params.taskCornerRadius=30;FeatureSettings.publish(true,10);task.recentsScale=2;task.taskScale=.5f;task.render();near(task.drawnRadius,50,"both native scale factors");
        task.progress=.5f;task.recentsScale=2;task.taskScale=1;task.render();near(task.drawnRadius,25,"native interpolation plus fading task delta");
        task.progress=1;task.render();near(task.drawnRadius,25,"full-screen untouched despite active offset");
        FeatureSettings.publish(true,-100);task.render();near(task.drawnRadius,25,"full-screen native survives sharpest setting");
        task.progress=0;task.recentsScale=1;task.taskScale=1;FeatureSettings.publish(true,100);
        View split=new View(context);split.width=80;split.height=300;task.cards.add(new TaskContainer(split));task.render();near(task.drawnRadius,40,"split snapshots use smallest actual thumbnail");task.cards.remove(1);
        task.cards.get(0).snapshot.width=0;task.render();near(task.drawnRadius,30,"unmeasured thumbnails left native");task.cards.get(0).snapshot.width=300;
        FeatureSettings.publish(true,10);task.extra=new FullscreenDrawParams();task.render();near(task.extra.currentCornerRadius,30,"foreign params nested in owner untouched");task.extra=null;
        FullscreenDrawParams unrelated=new FullscreenDrawParams();module.call("progress",unrelated,0f,1f,1f);near(unrelated.currentCornerRadius,30,"unscoped params untouched");
        task.fail=true;try{task.render();throw new AssertionError("native exception lost");}catch(IllegalStateException expected){}task.fail=false;
        module.call("progress",unrelated,0f,1f,1f);near(unrelated.currentCornerRadius,30,"task failure always clears scope");
        task.render();near(task.drawnRadius,50,"fresh render recovers after failure");task.skip=true;float previous=task.drawnRadius;task.render();near(task.drawnRadius,previous,"no native compute never adjusts retained value");task.skip=false;
        live.render();near(live.surfaceRadius,50,"live surface consumes adjusted native value inside apply");
        for(int i=0;i<50;i++)live.render();near(live.surfaceRadius,50,"live frames never accumulate");
        live.progress=.5f;live.recentsScale=2;live.render();near(live.surfaceRadius,25,"live interpolation uses native scales");
        live.progress=1;live.render();near(live.surfaceRadius,25,"live full-screen unaffected");
        live.progress=0;live.recentsScale=1;live.mTaskRect.width=60;FeatureSettings.publish(true,100);near(live.surfaceRadius,30,"live crop half-short-side cap");
        FeatureSettings.publish(false,100);near(live.surfaceRadius,30,"off invokes live redraw with native radius");live.mTaskRect.width=300;
        FeatureSettings.publish(true,10);live.nestedTask=task;live.render();near(task.drawnRadius,50,"nested snapshot own scope");near(live.surfaceRadius,50,"outer live scope restored after nested task");live.nestedTask=null;
        live.mCurrentFullscreenParams=new DesktopFullscreenDrawParams();live.render();near(live.surfaceRadius,30,"desktop window subtype excluded");live.mCurrentFullscreenParams=new FullscreenDrawParams();
        live.fail=true;try{live.render();throw new AssertionError("live exception lost");}catch(IllegalStateException expected){}live.fail=false;
        module.call("progress",unrelated,0f,1f,1f);near(unrelated.currentCornerRadius,30,"live failure clears scope");
        task.attached=false;float detached=task.drawnRadius;FeatureSettings.publish(true,-10);near(task.drawnRadius,detached,"detached task not refreshed");task.attached=true;task.render();near(task.drawnRadius,10,"reattached uses current config");
        check(FeatureSettings.listeners.size()==1,"one process listener, no listener per card");check(recents.redraws>0,"snapshot notifications refresh live surface");
        near(RecentsCardRadiusPolicy.adjust(30,10,2,0,0,1,300),30,"zero scale ignored");
        near(RecentsCardRadiusPolicy.adjust(30,10,Float.NaN,0,1,1,300),30,"invalid density ignored");
        near(RecentsCardRadiusPolicy.adjust(30,10,2,Float.NaN,1,1,300),30,"invalid progress ignored");
        near(RecentsCardRadiusPolicy.adjust(30,10,2,-1,1,1,300),30,"out-of-range progress ignored");
        near(RecentsCardRadiusPolicy.adjust(30,10,2,0,1,1,Float.POSITIVE_INFINITY),30,"invalid bounds ignored");
        near(RecentsCardRadiusPolicy.adjust(30,0,2,0,1,1,20),30,"zero bypasses even half-side clamp");
        check(module.errors.isEmpty(),"all expected native errors propagate without hook errors");
        System.out.println("PASS Recents card radius runtime "+checks+" checks (stock/260005/260027 native-call doubles)");
    }
}''',
    'ls/augment/com/hook/TestRecentsCardRadiusSampling.java': '''package ls.augment.com.hook;
import android.content.Context;import android.os.Handler;import android.os.SystemClock;import android.view.View;
import com.android.quickstep.views.*;import com.android.quickstep.util.*;import ls.augment.com.RecentsCardRadiusRange;
public class TestRecentsCardRadiusSampling {
    static int checks;
    static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
    static String raw(){return LauncherRecentsRadiusPublisher.payload;}
    static double number(String key){String text=raw();check(text!=null,"measurement exists for "+key);String token="\\\""+key+"\\\":";int start=text.indexOf(token);check(start>=0,"JSON field "+key);start+=token.length();int end=start;while(end<text.length()&&text.charAt(end)!=','&&text.charAt(end)!='}')end++;return Double.parseDouble(text.substring(start,end));}
    static void empty(){LauncherRecentsRadiusPublisher.payload=null;}
    static void settle() {Handler.advance(180);Handler.advance(180);}
    static void endpoints(int min,int max,String reason){check(number("minOffsetDp")==min&&number("maxOffsetDp")==max,reason);}
    public static void main(String[] args)throws Throwable {
        AugmentModule module=new AugmentModule();LauncherRecentsCardRadiusHook.install(module,TestRecentsCardRadiusSampling.class.getClassLoader());
        check(module.errors.isEmpty(),"sampler installs independently");Context context=new Context();RecentsView recents=new RecentsView(context);
        TaskView front=new TaskView(context,recents);recents.mOverviewStateEnabled=false;front.attached=false;
        FeatureSettings.publish(false,60);front.render();int nativeCalls=front.params.calls;Handler.advance(180);check(raw()==null,"invisible entry is not a measured range");
        recents.mOverviewStateEnabled=true;front.attached=true;settle();
        endpoints(-15,60,"initial p=0 captured before attach/overview eventually samples while disabled");
        check(front.params.calls==nativeCalls,"sampler never re-enters native renderer");
        check(number("schema")==2&&number("build")==20511&&number("pid")==1234,"versioned source identity");
        check(number("launcherVersion")==260028&&number("densityDpi")==320,"launcher and density identity");
        check(number("displayWidthPx")==1200&&number("displayHeightPx")==2400,"real display not inset resource window");
        check(number("nativeRadiusDp")==15&&number("maxRadiusDp")==75,"JSON units already screen dp");
        check(number("observedElapsed")<=SystemClock.now,"monotonic native observation time");
        Handler.advance(1100);empty();FeatureSettings.publish(true,60);front.render();settle();
        endpoints(-15,60,"enabled modified radius never feeds back into native range");check(front.drawnRadius==150,"render still uses saved positive value");
        Handler.advance(1100);empty();FeatureSettings.publish(true,0);front.render();settle();endpoints(-15,60,"native zero also measures");
        TaskView back=new TaskView(context,recents);back.taskScale=.5f;back.params.taskCornerRadius=20;
        Handler.advance(1100);empty();front.render();back.render();settle();endpoints(-15,60,"largest screen snapshot wins over shrunken background card");
        Handler.advance(1100);empty();front.render();Handler.advance(100);back.params.taskCornerRadius=40;back.render();Handler.advance(80);
        endpoints(-15,60,"changing back card does not reset stable front-card deadline");
        front.shown=false;back.shown=false;Handler.advance(2100);empty();TaskViewSimulator simulator=new TaskViewSimulator(context);simulator.render();settle();check(raw()==null,"live simulator never publishes card bounds");
        front.shown=true;front.progress=.1f;front.render();settle();check(raw()==null,"nonzero progress cannot publish resting endpoints");
        front.progress=0;recents.mOverviewStateEnabled=false;front.render();Handler.advance(2100);check(raw()==null,"hidden overview cannot publish");
        recents.mOverviewStateEnabled=true;front.windowVisibility=4;front.render();Handler.advance(2100);check(raw()==null,"invisible window cannot publish");
        front.windowVisibility=0;front.alpha=0;front.render();Handler.advance(2100);check(raw()==null,"transparent card cannot publish");front.alpha=1;
        front.cards.get(0).snapshot.scaleX=-.8f;front.render();Handler.advance(2100);check(raw()==null,"negative inner thumbnail scale cannot claim rounded range");front.cards.get(0).snapshot.scaleX=1;
        View image=front.cards.get(0).snapshot;image.visibleWidth=0;front.render();Handler.advance(2100);check(raw()==null,"offscreen snapshot cannot publish");image.visibleWidth=-1;
        front.render();Handler.advance(100);front.taskScale=.8f;front.render();Handler.advance(80);check(raw()==null,"geometry change restarts only its own stable deadline");Handler.advance(100);endpoints(-15,45,"settled scale gets current geometry");
        Handler.advance(1100);empty();front.taskScale=1;front.fan=true;front.params.taskCornerRadius=70;front.render();settle();endpoints(-15,60,"fan final native cap is measured before module adjustment");
        Handler.advance(1100);empty();front.fan=false;front.params.taskCornerRadius=30;View split=new View(context);split.width=80;split.height=300;front.cards.add(new TaskContainer(split));front.render();settle();endpoints(-15,5,"selected split card uses its smallest thumbnail");front.cards.remove(1);
        Handler.advance(1100);empty();com.android.quickstep.task.thumbnail.TaskThumbnailView modern=new com.android.quickstep.task.thumbnail.TaskThumbnailView(context);modern.scaleX=.8f;front.cards.get(0).snapshot=modern;front.render();settle();endpoints(-15,45,"modern thumbnail positive inner scale uses actual outline saturation");
        Handler.advance(1100);empty();modern.outline=new android.graphics.Rect();modern.outline.width=200;modern.outline.height=600;front.render();settle();endpoints(-15,25,"modern custom outline bounds intersect module view-size cap");front.cards.get(0).snapshot=image;
        Handler.advance(1100);empty();recents.rotation=1;context.display.width=2400;context.display.height=1200;front.render();settle();
        check(number("rotation")==1&&number("displayWidthPx")==2400&&number("displayHeightPx")==1200,"launcher logical rotation and real landscape profile published");
        Handler.advance(1100);empty();context.resources.metrics.density=3.25f;context.resources.metrics.densityDpi=520;front.render();settle();endpoints(-10,37,"density change recomputes integer endpoints");
        context.resources.metrics.density=2f;context.resources.metrics.densityDpi=320;front.params.taskCornerRadius=32;image.width=446;front.render();settle();endpoints(-16,96,"fractional upper-radius baseline");
        String integerIdentity=LauncherRecentsRadiusPublisher.identity;double maxBefore=number("maxRadiusDp"),nativeBefore=number("nativeRadiusDp");
        image.width=447;front.params.taskCornerRadius=32.00001f;front.render();settle();endpoints(-16,96,"native and maximum float variation retain integer endpoints");
        check(integerIdentity.equals(LauncherRecentsRadiusPublisher.identity),"floating-point-only variation has identical publisher dedup identity");
        check(number("maxRadiusDp")>maxBefore&&number("nativeRadiusDp")>nativeBefore,"full measured floats remain in validation payload");
        image.width=449;front.render();settle();endpoints(-16,97,"integer upper endpoint changes when card exceeds prior range");
        check(!integerIdentity.equals(LauncherRecentsRadiusPublisher.identity),"crossing integer endpoint changes publisher identity");
        String retained=raw();front.progress=1;front.render();recents.mOverviewStateEnabled=false;settle();check(retained.equals(raw()),"exiting overview preserves last confirmed sample for editor return");
        check(module.errors.isEmpty(),"sampling never introduces native hook failures");System.out.println("PASS Recents card radius sampling "+checks+" checks (phone boundary doubles)");
    }
}''',
}


def main():
    with tempfile.TemporaryDirectory(prefix='lsa-recents-radius-') as directory:
        root = Path(directory)
        for name, source in SOURCES.items():
            path = root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source, encoding='utf-8')
        src = ROOT / 'android/app/src/main/java/ls/augment/com'
        files = list(root.rglob('*.java')) + [
            src / 'EnhancementOption.java', src / 'RecentsCardRadiusOptions.java', src / 'RecentsCardRadiusRange.java',
            src / 'hook/HookCompatibility.java', src / 'hook/RecentsCardRadiusPolicy.java',
            src / 'hook/LauncherRecentsCardRadiusHook.java', src / 'hook/LauncherRecentsRadiusSampler.java',
            ROOT / 'tools/TestRecentsCardRadiusRange.java',
        ]
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestRecentsCardRadiusRuntime'], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.TestRecentsCardRadiusRange'], check=True)
        subprocess.run(['java', '-cp', str(root / 'classes'), 'ls.augment.com.hook.TestRecentsCardRadiusSampling'], check=True)


if __name__ == '__main__':
    main()
