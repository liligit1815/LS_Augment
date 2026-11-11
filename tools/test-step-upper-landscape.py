"""Exercise the production upper canvas, local display contract and input geometry."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1];step=root/'android/app/src/main/java/ls/augment/com/step'
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
def method(file,signature):
 s=(step/file).read_text(encoding='utf-8');a=s.index(signature);b=s.index('{',a)+1;depth=1
 while depth:depth+=(s[b]=='{')-(s[b]=='}');b+=1
 return s[a:b]
sources={
'android/graphics/Point.java':'package android.graphics;public class Point {public int x,y;}',
'android/view/SurfaceControl.java':'''package android.view;public class SurfaceControl {public static class Transaction {public float m00,m11,x,y;public android.graphics.Rect crop;public Transaction setMatrix(SurfaceControl s,float a,float b,float c,float d){m00=a;m11=d;return this;}public Transaction setPosition(SurfaceControl s,float a,float b){x=a;y=b;return this;}public Transaction setWindowCrop(SurfaceControl s,android.graphics.Rect r){crop=r;return this;}}}''',
'android/graphics/Rect.java':'''package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public Rect(Rect r){this(r.left,r.top,r.right,r.bottom);}public int width(){return right-left;}public int height(){return bottom-top;}public boolean equals(Object o){return o instanceof Rect r && left==r.left && top==r.top && right==r.right && bottom==r.bottom;}}''',
'android/os/IBinder.java':'package android.os;public interface IBinder{}',
'android/app/WindowConfiguration.java':'''package android.app;import android.graphics.Rect;public class WindowConfiguration {public int displayRotation,rotation,mode=6;public Rect max,bounds,app;public void setDisplayRotation(int r){displayRotation=r;}public void setMaxBounds(Rect r){max=r;}public void setBounds(Rect r){bounds=r;}public void setAppBounds(Rect r){app=r;}public void setWindowingMode(int m){mode=m;}}''',
'android/content/res/Configuration.java':'''package android.content.res;public class Configuration {public static final int ORIENTATION_PORTRAIT=1,ORIENTATION_LANDSCAPE=2;public int orientation=1,densityDpi=520,screenLayout=0x22,screenWidthDp=374,screenHeightDp=336,smallestScreenWidthDp=374,compatScreenWidthDp=374,compatScreenHeightDp=336,compatSmallestScreenWidthDp=374;public android.app.WindowConfiguration windowConfiguration=new android.app.WindowConfiguration();}''',
'com/android/server/wm/Task.java':'''package com.android.server.wm;import android.content.res.Configuration;import android.view.SurfaceControl.Transaction;public class Task {public void resolveOverrideConfiguration(Configuration c){}public Configuration getConfiguration(){return new Configuration();}public Configuration getResolvedOverrideConfiguration(){return null;}public void prepareSurfaces(){}public void clearMagnificationSpec(Transaction t){}public Transaction getSyncTransaction(){return null;}}''',
'com/android/server/wm/ActivityRecord.java':'''package com.android.server.wm;import android.content.res.Configuration;public class ActivityRecord {public void resolveOverrideConfiguration(Configuration c){}public Configuration getResolvedOverrideConfiguration(){return null;}public Task getTask(){return null;}public int getRequestedOrientation(){return 0;}public void setRequestedOrientation(int o){}public void onConfigurationChanged(Configuration c){}public boolean ensureActivityConfiguration(boolean b){return true;}}''',
'ls/augment/com/step/UpperCases.java':r'''
package ls.augment.com.step;
import java.lang.reflect.*;import android.graphics.Rect;import android.content.res.Configuration;import android.view.SurfaceControl;
class StepHook{protected void afterHookedMethod(MethodHookParam p){}static class MethodHookParam{Object thisObject;Object[] args;boolean hasThrowable(){return false;}}}
class StepHooks{static int hooks;static StepHook request;static void hookMethod(Method m,StepHook h){hooks++;if(m.getName().equals("setRequestedOrientation"))request=h;}}
class StepRuntime{
 static class Handler{void post(Runnable r){r.run();}}
 static class Wm{static boolean active=true;static Object lock=new Object(),context=new Object(),display=new Object();static Handler handler=new Handler();}
 static Object call(Object o,String n,Object... a){return StepMembers.callMethod(o,n,a);}
 static void diagnostic(String a,String b){}static Object field(Object o,String n){return StepMembers.getObjectField(o,n);}
}
class NativeWorkspaceGuard{
 static boolean active=true,ending;static int principal,recoveries;static android.os.IBinder owner;static Object live;
 static Object liveTask(int id,Object token){return live;}
 static void report(Object o,int c,String d,int id){}static void finish(String r){recoveries++;}
 static class SavedTask{boolean dirty=true;int id=42,user,layerId=7;Object task,token=new Object(),parent;}
}
class WorkspaceUsers{static boolean allows(Object c,int p,int u){return p==u;}}
class NativeTopTask{static NativeWorkspaceGuard.SavedTask upper,app,navigation;HELDstatic Rect bounds,viewport=new Rect(0,0,1216,684);static float progress=1f;}
class UpperMotion {POSITION}
class LocalLandscape{
 static String missing;
 static Method exact(Class<?> c,String name,Class<?> result,Class<?>... args)throws ReflectiveOperationException{
  if(name.equals(missing))throw new NoSuchMethodException(name);
  Method m=c.getMethod(name,args);if(m.getReturnType()!=result || Modifier.isStatic(m.getModifiers()))throw new NoSuchMethodException(name);return m;
 }
}
class Surface extends SurfaceControl{int id=7;int getLayerId(){return id;}}
class Task {
 int mode=6;Object parent=new Object(),display=StepRuntime.Wm.display;Rect bounds=new Rect(0,0,2162,1216);
 Surface surface=new Surface();Configuration resolved=new Configuration();
 int getWindowingMode(){return mode;}Object getParent(){return parent;}Object getDisplayContent(){return display;}Object getRootTask(){return this;}
 Surface getSurfaceControl(){return surface;}Rect getRequestedOverrideBounds(){return bounds;}
 Configuration getResolvedOverrideConfiguration(){return resolved;}Configuration getConfiguration(){return new Configuration();}
 android.graphics.Point getRelativePosition(){return new android.graphics.Point();}
}
class ChildTask extends Task{}
class Activity {Task task;int ensures;Object getTask(){return task;}void onConfigurationChanged(Configuration c){UpperAppLayout.update(task,this);}boolean ensureActivityConfiguration(boolean b){ensures++;return true;}int requested=0;int getRequestedOrientation(){return requested;}Configuration resolved=new Configuration();Configuration getResolvedOverrideConfiguration(){return resolved;}}
public class UpperCases{
 static int checks;static void check(boolean pass,String why){checks++;if(!pass)throw new AssertionError(why);}
 static void near(double a,double b,String why){check(Math.abs(a-b)<.001,why);}
 static void verify(Task t,Activity app){UpperAppLayout.update(t,app);}
 public static void main(String[] args)throws Exception{
  for(String missing:new String[]{"resolveOverrideConfiguration","getTask","getResolvedOverrideConfiguration","setDisplayRotation","setMaxBounds","setWindowCrop","prepareSurfaces","clearMagnificationSpec","getSyncTransaction"}){
   LocalLandscape.missing=missing;UpperAppLayout.available=false;UpperAppLayout.install(UpperCases.class.getClassLoader());check(!UpperAppLayout.available,"missing capability preserves native behavior");
  }
  for(String missing:new String[]{"setBounds","setAppBounds","setWindowingMode","getConfiguration"}){
   LocalLandscape.missing=missing;UpperAppLayout.available=false;StepHooks.hooks=0;UpperAppLayout.install(UpperCases.class.getClassLoader());
   check(UpperAppLayout.available && !UpperAppLayout.fullscreenConfig && StepHooks.hooks==5,"missing full-canvas capability preserves older landscape path");
  }
  LocalLandscape.missing=null;StepHooks.hooks=0;UpperAppLayout.install(UpperCases.class.getClassLoader());check(UpperAppLayout.available && UpperAppLayout.fullscreenConfig && StepHooks.hooks==5,"verified native task, activity and surface lifecycle hooks");
  Rect viewport=new Rect(0,0,1216,684);
  for(int dpi:new int[]{160,320,420,520,640}){
   Rect wide=UpperAppLayout.landscapeCanvas(viewport,1216,dpi);
   check(wide.height()>=Math.round(dpi*480f/160f),"landscape app has room for native controls");
   float fit=UpperAppLayout.scale(wide,viewport);
   check(Math.abs(wide.width()*fit-1216)<1 && Math.abs(wide.height()*fit-684)<1,"larger app canvas preserves physical 16:9 region");
  }
  UpperAppLayout.fullscreenConfig=false;
  check(UpperAppLayout.landscapeCanvas(viewport,1216,520).height()==1216,"missing complete canvas preserves original short edge");
  UpperAppLayout.fullscreenConfig=true;
  for(int width:new int[]{720,1080,1216,1440}){
   Rect physical=new Rect(0,0,width,Math.round(width*9f/16));Rect canvas=UpperAppLayout.canvas(physical,width);float scale=UpperAppLayout.scale(canvas,physical);
   check(canvas.width()>canvas.height() && canvas.height()==width,"normal landscape short edge preserved");
   check(Math.abs(canvas.width()*scale-physical.width())<1 && Math.abs(canvas.height()*scale-physical.height())<1,"full canvas fits with less than one pixel rounding");
   for(float progress:new float[]{.02f,.5f,1f}){
    SurfaceControl.Transaction tx=new SurfaceControl.Transaction();UpperMotion.position(tx,new SurfaceControl(),canvas,physical,0,0,progress);
    float fitted=tx.m00,x=tx.x,y=tx.y;
    check(canvas.equals(tx.crop),"organized modal app and activity input sink have a bounded native crop");
    check(x+tx.crop.left*fitted>=-.001 && y+tx.crop.top*fitted>=-.001
      && x+tx.crop.right*fitted<=physical.width()+.001 && y+tx.crop.bottom*fitted<=physical.height()+.001,
      "native input aperture stays inside upper region throughout animation");
    near(tx.m00,tx.m11,"native upper surface uses uniform scale");
    near(x+canvas.width()*fitted/2,physical.width()/2f,"animation centered horizontally");
    near(y+canvas.height()*fitted/2,physical.height()/2f,"animation centered vertically");
    for(float point:new float[]{0f,.5f,1f}){
     double originalX=point*canvas.width(),originalY=point*canvas.height();
     near((x+originalX*fitted-x)/fitted,originalX,"native inverse maps horizontal touch");
     near((y+originalY*fitted-y)/fitted,originalY,"native inverse maps vertical touch");
    }
   }
  }
  for(String missing:new String[]{"getRequestedOrientation","setRequestedOrientation","onConfigurationChanged","ensureActivityConfiguration"}){
   LocalLandscape.missing=missing;StepHooks.hooks=0;UpperAppLayout.install(UpperCases.class.getClassLoader());
   check(UpperAppLayout.available && !UpperAppLayout.requestedOrientation && StepHooks.hooks==4,"missing orientation API keeps previous upper path");
  }
  LocalLandscape.missing=null;UpperAppLayout.install(UpperCases.class.getClassLoader());UpperAppLayout.requestedOrientation=false;
  for(Task task:new Task[]{new Task(),new ChildTask()}){
   var record=new NativeWorkspaceGuard.SavedTask();record.task=task;record.parent=task.parent;NativeTopTask.upper=NativeTopTask.app=record;NativeTopTask.bounds=task.bounds;NativeWorkspaceGuard.live=task;
   Activity app=new Activity();app.task=task;verify(task,app);check(app.resolved.orientation==1,"window lock required");
   synchronized(StepRuntime.Wm.lock){
    UpperAppLayout.update(task,task);verify(task,app);
    check(task.resolved.orientation==2 && app.resolved.orientation==2,"task and app agree on landscape");
    check(app.resolved.windowConfiguration.displayRotation==1 && app.resolved.windowConfiguration.max.equals(task.bounds),"display queries report landscape canvas");
    check(app.resolved.windowConfiguration.rotation==0 && app.resolved.densityDpi==520,"physical rotation and density untouched");
    check(task.resolved.windowConfiguration.mode==6 && app.resolved.windowConfiguration.mode==1,"organized task retained while child activity fills its independent canvas");
    check(app.resolved.windowConfiguration.app.equals(task.bounds) && app.resolved.windowConfiguration.bounds.equals(task.bounds),"portrait display does not clip application width");
    check(app.resolved.screenWidthDp==665 && app.resolved.screenHeightDp==374 && app.resolved.smallestScreenWidthDp==374,"resource dimensions match full 16:9 canvas at original density");
    check(app.resolved.compatScreenWidthDp==665 && app.resolved.compatScreenHeightDp==374,"compat metrics match app bounds");
    app.resolved.densityDpi=0;verify(task,app);check(app.resolved.screenWidthDp==665 && app.resolved.densityDpi==0,"inherited density computes sizes without overriding density");app.resolved.densityDpi=520;
    UpperAppLayout.fullscreenConfig=false;app.resolved=new Configuration();verify(task,app);
    check(app.resolved.orientation==2 && app.resolved.windowConfiguration.mode==6 && app.resolved.screenWidthDp==374,"old landscape behavior remains when full-canvas contract is missing");UpperAppLayout.fullscreenConfig=true;
    SurfaceControl.Transaction tx=new SurfaceControl.Transaction();UpperAppLayout.fit(task,tx);near(tx.m00,1216f/2162,"native layout reapplies settled top scale");
    check(task.bounds.equals(tx.crop),"native layout replays input crop with settled transform");tx.crop=null;
    NativeTopTask.progress=.5f;UpperAppLayout.fit(task,tx);near(tx.m00,1216f/2162*.5f,"native layout retains active animation progress");check(task.bounds.equals(tx.crop),"native replay restores lost crop during animation");NativeTopTask.progress=1f;
    UpperAppLayout.requestedOrientation=true;app.requested=1;
    StepHook.MethodHookParam request=new StepHook.MethodHookParam();request.thisObject=app;request.args=new Object[]{1};StepHooks.request.afterHookedMethod(request);
    check(app.ensures==1,"native orientation request publishes changed child configuration");
    check(app.resolved.orientation==2 && app.resolved.windowConfiguration.displayRotation==1,"portrait request cannot select portrait resources in wide upper window");
    for(int requested:new int[]{1,7,9,12}){app.requested=requested;verify(task,app);check(app.resolved.orientation==2 && app.resolved.screenWidthDp>app.resolved.screenHeightDp,"every fixed/sensor/user portrait request retains wide resource layout");}
    app.requested=0;verify(task,app);check(app.resolved.orientation==2 && app.resolved.windowConfiguration.displayRotation==1,"fullscreen request reaches landscape resources");
    app.requested=1;verify(task,app);check(app.resolved.orientation==2 && app.resolved.windowConfiguration.bounds.equals(task.bounds),"exit fullscreen retains landscape upper layout");UpperAppLayout.requestedOrientation=false;
    NativeTopTask.upper=null;NativeTopTask.progress=.02f;UpperAppLayout.fit(task,tx);near(tx.m00,1216f/2162,"parked video is not shrunk by the map page animation");
    NativeTopTask.app=null;NativeTopTask.navigation=record;verify(task,app);check(app.resolved.orientation==2,"hidden navigation keeps its own native canvas");
    NativeTopTask.navigation=null;NativeTopTask.upper=NativeTopTask.app=record;NativeTopTask.progress=1f;
    task.mode=1;app.resolved=new Configuration();verify(task,app);check(app.resolved.orientation==1,"returned main task receives original native config");task.mode=6;
    NativeWorkspaceGuard.ending=true;verify(task,app);check(app.resolved.orientation==1,"exit retains native resolution");NativeWorkspaceGuard.ending=false;
    record.dirty=false;verify(task,app);check(app.resolved.orientation==1,"released owner is ignored");record.dirty=true;
    int previous=NativeWorkspaceGuard.recoveries;task.parent=new Object();verify(task,app);check(NativeWorkspaceGuard.recoveries==previous+1 && app.resolved.orientation==1,"changed parent recovers before mutation");task.parent=record.parent;
    previous=NativeWorkspaceGuard.recoveries;task.surface.id=8;verify(task,app);check(NativeWorkspaceGuard.recoveries==previous+1,"changed surface rejected");task.surface.id=7;
    previous=NativeWorkspaceGuard.recoveries;record.user=10;verify(task,app);check(NativeWorkspaceGuard.recoveries==previous+1,"foreign user rejected");record.user=0;
    previous=NativeWorkspaceGuard.recoveries;NativeWorkspaceGuard.live=new Task();verify(task,app);check(NativeWorkspaceGuard.recoveries==previous+1,"reused task id rejected");NativeWorkspaceGuard.live=task;
    previous=NativeWorkspaceGuard.recoveries;task.bounds=new Rect(0,0,100,100);verify(task,app);check(NativeWorkspaceGuard.recoveries==previous+1,"foreign bounds rejected");
   }
  }
  System.out.println("PASS "+checks+" upper landscape capability, geometry, identity and restoration checks");
 }
}
'''.replace('HELD',method('NativeTopTask.java','    static SavedTask held(Object task)').replace('SavedTask','NativeWorkspaceGuard.SavedTask')).replace('POSITION',method('UpperMotion.java','    static void position(').replace('call(tx,','StepRuntime.call(tx,'))}
with tempfile.TemporaryDirectory(prefix='step-upper-landscape-') as directory:
 p=Path(directory)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 files=list(p.rglob('*.java'))+[step/'UpperAppLayout.java',step/'StepMembers.java']
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*files],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.UpperCases'],check=True)
