"""Exercise the production Recents privacy hook against inspected drawing boundaries.

The doubles model snapshot/live-tile dispatch, not GPU compositing; device screenshots
remain necessary. Reuse only the hook dispatcher from the radius fixture.
"""
import ast
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
tree = ast.parse((ROOT / 'tools/test-recents-card-radius-runtime.py').read_text(encoding='utf-8'))
base = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
            and any(isinstance(t, ast.Name) and t.id == 'SOURCES' for t in n.targets))
SOURCES = {
    'ls/augment/com/hook/AugmentModule.java': base['ls/augment/com/hook/AugmentModule.java'].replace('launcher.recents.radius.', 'launcher.recents.privacy.'),
    'android/content/ComponentName.java': 'package android.content;public class ComponentName {final String pkg;public ComponentName(String p){pkg=p;}public String getPackageName(){return pkg;}}',
    'android/util/DisplayMetrics.java': 'package android.util;public class DisplayMetrics {public float density=2;}',
    'android/content/res/Configuration.java': 'package android.content.res;public class Configuration {public static final int UI_MODE_NIGHT_MASK=48,UI_MODE_NIGHT_YES=32;public int uiMode;}',
    'android/content/res/Resources.java': 'package android.content.res;public class Resources {public final Configuration config=new Configuration();public Configuration getConfiguration(){return config;}public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();}}',
    'android/content/pm/PackageManager.java': 'package android.content.pm;public class PackageManager {public static class NameNotFoundException extends Exception {}public android.graphics.drawable.Drawable getApplicationIcon(String pkg)throws NameNotFoundException {if(!pkg.equals("ls.augment.com"))throw new AssertionError("wrong icon");return new android.graphics.drawable.Drawable();}}',
    'android/content/Context.java': 'package android.content;public class Context {final android.content.res.Resources res=new android.content.res.Resources();public android.content.res.Resources getResources(){return res;}public android.content.pm.PackageManager getPackageManager(){return new android.content.pm.PackageManager();}}',
    'android/graphics/Paint.java': 'package android.graphics;public class Paint {public static final int ANTI_ALIAS_FLAG=1;public int color;public Paint(int f){}public void setColor(int c){color=c;}}',
    'android/graphics/Canvas.java': 'package android.graphics;public class Canvas {public int masks,icons,nativeDraws,color;public Bitmap source;public Matrix matrix;public float radius;public void drawRoundRect(float l,float t,float r,float b,float x,float y,Paint p){masks++;color=p.color;radius=x;}}',
    'android/graphics/Bitmap.java': 'package android.graphics;public class Bitmap {}',
    'android/graphics/Matrix.java': 'package android.graphics;public class Matrix {public Matrix(){}public Matrix(Matrix source){}public void postTranslate(float x,float y){}}',
    'android/widget/ImageView.java': 'package android.widget;public class ImageView extends android.view.View {public android.graphics.Matrix getImageMatrix(){return new android.graphics.Matrix();}public int getLeft(){return 0;}public int getTop(){return 0;}}',
    'ls/augment/com/hook/RecentsPrivacyBackdrop.java': '''package ls.augment.com.hook;import android.graphics.*;import android.view.View;public class RecentsPrivacyBackdrop {RecentsPrivacyBackdrop(AugmentModule m){}void clear(){}void release(View v){}void draw(View v,Object t,Bitmap b,Matrix m,Canvas c,float l,float top,float r,float bottom,float radius){c.source=b;c.matrix=m;Paint p=new Paint(1);p.setColor(0xff20242b);c.drawRoundRect(l,top,r,bottom,radius,radius,p);}}''',
    'android/graphics/Rect.java': 'package android.graphics;public class Rect {public int left,top,right,bottom;public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public boolean isEmpty(){return left>=right||top>=bottom;}}',
    'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable;public class Drawable {public Drawable mutate(){return this;}public void setBounds(int l,int t,int r,int b){}public void draw(android.graphics.Canvas c){c.icons++;}}',
    'android/view/ViewParent.java': 'package android.view;public interface ViewParent {ViewParent getParent();}',
    'android/view/View.java': 'package android.view;public class View implements ViewParent {public ViewParent parent;public int invalidations;final android.content.Context ctx=new android.content.Context();public ViewParent getParent(){return parent;}public android.content.Context getContext(){return ctx;}public android.content.res.Resources getResources(){return ctx.getResources();}public void postInvalidateOnAnimation(){invalidations++;}public int getWidth(){return 300;}public int getHeight(){return 600;}}',
    'android/view/ViewGroup.java': 'package android.view;public class ViewGroup extends View {protected void dispatchDraw(android.graphics.Canvas c){c.nativeDraws++;}}',
    'ls/augment/com/ConfigSnapshot.java': 'package ls.augment.com;public class ConfigSnapshot {final boolean on;final String apps;public ConfigSnapshot(boolean e,String a){on=e;apps=a;}public String get(String k){return k.equals(RecentsPrivacyOptions.ENABLED)?on?"1":"0":apps;}}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;import java.util.*;import ls.augment.com.*;import android.content.Context;
public class FeatureSettings {static ConfigSnapshot current=new ConfigSnapshot(false,"");static final List<Runnable> listeners=new ArrayList<>();static ConfigSnapshot snapshot(Context c){return current;}static boolean addSnapshotListener(Context c,Runnable r){listeners.add(r);return true;}static void publish(boolean on,String apps){current=new ConfigSnapshot(on,apps);for(Runnable r:listeners)r.run();}}''',
    'com/android/systemui/shared/recents/model/Task.java': '''package com.android.systemui.shared.recents.model;import android.content.ComponentName;
public class Task {public TaskKey key;public ThumbnailData thumbnail=new ThumbnailData();public Task(String p){key=new TaskKey(p);}public static class TaskKey {final ComponentName component;public TaskKey(String p){component=new ComponentName(p);}public ComponentName getComponent(){return component;}}}''',
    'com/android/systemui/shared/recents/model/ThumbnailData.java': 'package com.android.systemui.shared.recents.model;public class ThumbnailData {public android.graphics.Bitmap thumbnail=new android.graphics.Bitmap();public android.graphics.Bitmap getThumbnail(){return thumbnail;}}',
    'com/android/quickstep/views/TaskThumbnailViewDeprecated.java': '''package com.android.quickstep.views;import com.android.systemui.shared.recents.model.Task;import android.graphics.Canvas;
public class TaskThumbnailViewDeprecated extends android.view.View {private Task mTask;public android.graphics.Bitmap thumb=new android.graphics.Bitmap();public android.graphics.Bitmap getThumbnail(){return thumb;}public android.graphics.Matrix getThumbnailMatrix(){return new android.graphics.Matrix();}public void bind(Task t){mTask=t;}public void drawOnCanvas(Canvas c,float l,float t,float r,float b,float radius){c.nativeDraws++;}}''',
    'com/android/quickstep/views/TaskContainer.java': '''package com.android.quickstep.views;import com.android.systemui.shared.recents.model.Task;public class TaskContainer {public Task task;public android.view.View snapshot;public TaskContainer(Task t,android.view.View v){task=t;snapshot=v;}public Task getTask(){return task;}public android.view.View getSnapshotView(){return snapshot;}}''',
    'com/android/quickstep/views/TaskView.java': '''package com.android.quickstep.views;import java.util.*;public class TaskView extends android.view.ViewGroup {public final List<TaskContainer> items=new ArrayList<>();public List<TaskContainer> getTaskContainers(){return items;}}''',
    'com/android/quickstep/task/thumbnail/TaskThumbnailUiState.java': '''package com.android.quickstep.task.thumbnail;public class TaskThumbnailUiState {public static class Snapshot extends TaskThumbnailUiState {public android.graphics.Bitmap getBitmap(){return image;}public final android.graphics.Bitmap image=new android.graphics.Bitmap();}}''',
    'com/android/quickstep/task/thumbnail/TaskThumbnailView.java': '''package com.android.quickstep.task.thumbnail;public class TaskThumbnailView extends android.view.ViewGroup {public TaskThumbnailUiState uiState=new TaskThumbnailUiState.Snapshot();private android.widget.ImageView getThumbnailView(){return new android.widget.ImageView();}public float getCornerRadius(){return 18f;}public android.graphics.Rect getOutlineBounds(){return new android.graphics.Rect(0,0,300,600);}}''',
    'ls/augment/com/hook/TestRecentsPrivacy.java': '''package ls.augment.com.hook;
import android.graphics.*;import com.android.quickstep.views.*;import com.android.systemui.shared.recents.model.Task;import ls.augment.com.*;
public class TestRecentsPrivacy {
 static int checks;static void check(boolean b,String msg){checks++;if(!b)throw new AssertionError(msg);}
 static class ChildLegacy extends TaskThumbnailViewDeprecated {}static class ChildModern extends com.android.quickstep.task.thumbnail.TaskThumbnailView {}
 public static void main(String[] args)throws Throwable {
  String mode=args[0];ClassLoader loader=new ClassLoader(TestRecentsPrivacy.class.getClassLoader()){
   public Class<?> loadClass(String n)throws ClassNotFoundException {if(mode.equals("legacy")&&n.equals("com.android.quickstep.task.thumbnail.TaskThumbnailView")||mode.equals("modern")&&n.equals("com.android.quickstep.views.TaskThumbnailViewDeprecated"))throw new ClassNotFoundException(n);return super.loadClass(n);}};
  AugmentModule m=new AugmentModule();LauncherRecentsPrivacyHook.install(m,loader);
  check(AppPackageSet.normalize("b.app,a.app;b.app").equals("a.app;b.app"),"shared canonical selection");
  check(AppPackageSet.normalize("bad/app")==null,"invalid package rejected");
  if(mode.equals("missing")){check(m.hooks.isEmpty()&&!m.errors.isEmpty(),"missing signatures preserve OEM and diagnose");System.out.println("PASS missing capabilities "+checks);return;}
  boolean legacy=m.hooks.containsKey("launcher.recents.privacy.legacy"),modern=m.hooks.containsKey("launcher.recents.privacy.modern");
  check(legacy==!mode.equals("modern"),"legacy capability chosen");check(modern==!mode.equals("legacy"),"modern capability chosen");
  Task secret=new Task("secret.app"),normal=new Task("normal.app");
  if(legacy){ChildLegacy v=new ChildLegacy();v.bind(secret);Canvas c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.nativeDraws==1,"disabled native");
   FeatureSettings.publish(true,"secret.app");check(v.invalidations>0,"hot config invalidates existing card");c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.masks==1&&c.icons==1&&c.nativeDraws==0,"selected snapshot and live clear suppressed");check(c.radius==24&&c.color>>>24==255,"native radius and opaque mask");
   check(c.source==v.thumb&&c.matrix!=null,"legacy native bitmap and crop passed to blur");v.thumb=null;c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.source==secret.thumbnail.thumbnail&&c.matrix==null,"legacy live tile uses task snapshot fallback");
   v.bind(normal);c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.masks==0&&c.nativeDraws==1,"recycled task unmasked");
   v.bind(secret);FeatureSettings.publish(false,"secret.app");c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.nativeDraws==1,"off restores OEM with selection preserved");
   FeatureSettings.publish(true,"secret.app.extra");c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.nativeDraws==1,"exact package match");
   v.bind(null);FeatureSettings.publish(true,"secret.app");c=new Canvas();m.call("legacy",v,c,0f,0f,300f,600f,24f);check(c.nativeDraws==1,"unbound card native");}
  if(modern){TaskView owner=new TaskView();ChildModern a=new ChildModern(),b=new ChildModern();android.view.ViewGroup wrapper=new android.view.ViewGroup();wrapper.parent=owner;a.parent=wrapper;b.parent=owner;TaskContainer first=new TaskContainer(secret,a);owner.items.add(first);owner.items.add(new TaskContainer(normal,b));FeatureSettings.publish(true,"secret.app");
   Canvas c=new Canvas();m.call("modern",a,c);check(c.masks==1&&c.nativeDraws==0&&c.icons==1,"inherited dispatch covers modern live child");check(c.radius==18,"modern radius");
   check(c.source!=null&&c.matrix!=null,"modern state bitmap uses native image matrix");a.uiState=null;c=new Canvas();m.call("modern",a,c);check(c.source==secret.thumbnail.thumbnail&&c.matrix==null,"modern live tile uses task snapshot fallback");
   c=new Canvas();m.call("modern",b,c);check(c.nativeDraws==1,"split task other half native");
   first.task=normal;c=new Canvas();m.call("modern",a,c);check(c.nativeDraws==1&&c.masks==0,"rebind resolves current task");
   first.task=secret;FeatureSettings.publish(true,"");c=new Canvas();m.call("modern",a,c);check(c.nativeDraws==1,"empty selection native");
   FeatureSettings.publish(true,"secret.app");c=new Canvas();m.call("modern",new android.view.ViewGroup(),c);check(c.nativeDraws==1&&c.masks==0,"unrelated ViewGroup untouched");
   a.parent=null;c=new Canvas();m.call("modern",a,c);check(c.nativeDraws==1,"detached thumbnail native");
   a.parent=owner;secret.thumbnail=null;c=new Canvas();m.call("modern",a,c);check(c.source==null&&c.masks==1&&c.nativeDraws==0,"missing screenshot stays covered");}
  check(m.errors.isEmpty(),"no reflection failures on known capabilities");check(FeatureSettings.listeners.size()==1,"one listener across snapshots and families");System.out.println("PASS "+mode+" privacy runtime "+checks+" assertions");
 }
}'''
}

SOURCES['android/view/ViewTreeObserver.java']='package android.view;import java.util.*;public class ViewTreeObserver{public interface OnPreDrawListener{boolean onPreDraw();}public final List<OnPreDrawListener> listeners=new ArrayList<>();public boolean isAlive(){return true;}public void addOnPreDrawListener(OnPreDrawListener l){listeners.add(l);}public void removeOnPreDrawListener(OnPreDrawListener l){listeners.remove(l);}}'
SOURCES['android/graphics/ColorFilter.java']='package android.graphics;public class ColorFilter{}'
SOURCES['android/graphics/PixelFormat.java']='package android.graphics;public class PixelFormat{public static final int TRANSLUCENT=-3;}'
SOURCES['android/graphics/drawable/Drawable.java']=SOURCES['android/graphics/drawable/Drawable.java'].replace('public Drawable mutate()', 'public void invalidateSelf(){}public void setAlpha(int a){}public void setColorFilter(android.graphics.ColorFilter f){}public int getOpacity(){return -3;}public Drawable mutate()')
SOURCES['android/view/View.java']=SOURCES['android/view/View.java'].replace('public ViewParent parent;', 'public interface OnAttachStateChangeListener{void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}public java.util.List<OnAttachStateChangeListener> attaches=new java.util.ArrayList<>();public final ViewTreeObserver observer=new ViewTreeObserver();public ViewTreeObserver getViewTreeObserver(){return observer;}public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attaches.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attaches.remove(l);}public boolean isAttachedToWindow(){return true;}public void invalidate(){invalidations++;}public static class Overlay{public java.util.List<android.graphics.drawable.Drawable> items=new java.util.ArrayList<>();public void add(android.graphics.drawable.Drawable d){items.add(d);}public void remove(android.graphics.drawable.Drawable d){items.remove(d);}}public final Overlay overlay=new Overlay();public Overlay getOverlay(){return overlay;}public ViewParent parent;')
SOURCES['ls/augment/com/hook/FeatureSettings.java']=SOURCES['ls/augment/com/hook/FeatureSettings.java'].replace('static ConfigSnapshot', 'static void diagnostic(android.content.Context c,String k,String v){}static ConfigSnapshot',1)
SOURCES['ls/augment/com/hook/RecentsPrivacyOverlay.java']=(ROOT/'android/app/src/main/java/ls/augment/com/hook/RecentsPrivacyOverlay.java').read_text(encoding='utf-8')

for mode in ('both', 'legacy', 'modern', 'nested', 'missing', 'field_data', 'abstract_snapshot'):
    sources = dict(SOURCES)
    if mode == 'nested':
        body = sources.pop('com/android/quickstep/views/TaskContainer.java').split('public class TaskContainer', 1)[1]
        sources['com/android/quickstep/views/TaskView.java'] = sources['com/android/quickstep/views/TaskView.java'].replace('import java.util.*;', 'import java.util.*;import com.android.systemui.shared.recents.model.Task;').replace('public final List', 'public static class TaskContainer' + body + ' public final List')
        sources['ls/augment/com/hook/TestRecentsPrivacy.java'] = sources['ls/augment/com/hook/TestRecentsPrivacy.java'].replace('import android.graphics.*;', 'import android.graphics.*;import com.android.quickstep.views.TaskView.TaskContainer;')
    if mode == 'missing':
        sources['com/android/quickstep/views/TaskThumbnailViewDeprecated.java'] = sources['com/android/quickstep/views/TaskThumbnailViewDeprecated.java'].replace('drawOnCanvas(', 'unsupportedDraw(')
        sources['com/android/quickstep/task/thumbnail/TaskThumbnailView.java'] = sources['com/android/quickstep/task/thumbnail/TaskThumbnailView.java'].replace('float getCornerRadius(){return 18f;}', 'int getCornerRadius(){return 18;}')
    if mode == 'field_data':
        sources['com/android/systemui/shared/recents/model/ThumbnailData.java'] = sources['com/android/systemui/shared/recents/model/ThumbnailData.java'].replace('public android.graphics.Bitmap getThumbnail(){return thumbnail;}', '')
    if mode == 'abstract_snapshot':
        sources['com/android/quickstep/task/thumbnail/TaskThumbnailUiState.java'] = '''package com.android.quickstep.task.thumbnail;public class TaskThumbnailUiState {public static abstract class Snapshot extends TaskThumbnailUiState {public abstract android.graphics.Bitmap getBitmap();public static class WithHeader extends Snapshot {final android.graphics.Bitmap image=new android.graphics.Bitmap();public android.graphics.Bitmap getBitmap(){return image;}}}}'''
        sources['com/android/quickstep/task/thumbnail/TaskThumbnailView.java'] = sources['com/android/quickstep/task/thumbnail/TaskThumbnailView.java'].replace('new TaskThumbnailUiState.Snapshot()', 'new TaskThumbnailUiState.Snapshot.WithHeader()')
    with tempfile.TemporaryDirectory(prefix='lsa-privacy-') as temp:
        directory = Path(temp)
        for name, content in sources.items():
            path = directory / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding='utf-8')
        files = list(directory.rglob('*.java'))
        files += [ROOT / 'android/app/src/main/java/ls/augment/com' / name for name in (
            'AppPackageSet.java', 'EnhancementOption.java', 'RecentsPrivacyOptions.java',
            'hook/HookCompatibility.java', 'hook/LauncherRecentsPrivacyHook.java')]
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(directory / 'classes'), *map(str, files)], check=True)
        subprocess.run(['java', '-cp', str(directory / 'classes'), 'ls.augment.com.hook.TestRecentsPrivacy', mode], check=True)
