"""Execute the production window geometry path with WM snapshots and rotation providers."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'


def body(text, marker):
    first = text.index('{', text.index(marker))
    end, depth = first + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[first:end]


height_body = body((SRC / 'ConfigSchema.java').read_text(encoding='utf-8'), 'public static int statusBarHeightPx(')
grid_height_body = body((SRC / 'hook/StatusBarGridHook.java').read_text(encoding='utf-8'), 'void applyHeight(int dp)')
# Exact provider-update block from test20511, retained as the negative control.
previous_provider_patch = '''Object providers=TargetReflection.field(params,"providedInsets");
 if(android.os.Build.VERSION.SDK_INT>=29&&providers instanceof Object[])for(Object provider:(Object[])providers)
  TargetReflection.call(provider,"setInsetsSize",Insets.of(0,height,0,0));'''
support = {
    'android/graphics/Insets.java': '''package android.graphics;
public final class Insets {public final int left,top,right,bottom;
 private Insets(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
 public static Insets of(int l,int t,int r,int b){return new Insets(l,t,r,b);}}
''',
    'android/content/Context.java': '''package android.content;
public class Context {public String getPackageName(){return "systemui";}public android.content.res.Resources getResources(){return new android.content.res.Resources();}}''',
    'android/content/res/Resources.java': '''package android.content.res;
public class Resources {public Metrics getDisplayMetrics(){return new Metrics();}public int getIdentifier(String a,String b,String c){return 0;}public int getDimensionPixelSize(int id){return 107;}public static class Metrics {public float density=3.25f;}}''',
    'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new Looper();}}',
    'android/os/Handler.java': 'package android.os;public class Handler {public Handler(Looper l){}public void removeCallbacks(Runnable r){}public void post(Runnable r){}}',
    'android/view/View.java': 'package android.view;public class View {public boolean isAttachedToWindow(){return true;}}',
    'android/view/ViewGroup.java': 'package android.view;public class ViewGroup {public static class LayoutParams {public int height=107;}}',
    'android/view/WindowInsets.java': '''package android.view;
public class WindowInsets {public static class Type {public static int statusBars(){return 1;}public static int tappableElement(){return 64;}}}''',
    'android/view/WindowManager.java': '''package android.view;
public interface WindowManager {void updateViewLayout(View view,LayoutParams params);
 public static class LayoutParams {public static final int MATCH_PARENT=-1;public int height;public Object[] providedInsets;public LayoutParams[] paramsForRotation;
 public int copyFrom(LayoutParams p){height=p.height;providedInsets=p.providedInsets;paramsForRotation=p.paramsForRotation;return 0;}}}
''',
    'com/android/internal/policy/SystemBarUtils.java': '''package com.android.internal.policy;
public class SystemBarUtils {public static int portrait=107,landscape=70;
 public static int getStatusBarHeight(android.content.Context c){return portrait;}
 public static int getStatusBarHeightForRotation(android.content.Context c,int r){return r%2==0?portrait:landscape;}}''',
    'ls/augment/com/ConfigSchema.java': '''package ls.augment.com;
public class ConfigSchema {public static final int STATUSBAR_HEIGHT_MIN_DP=-32,STATUSBAR_HEIGHT_MAX_DP=96;
 public static final String SYSTEMUI_MASTER="master",STATUSBAR_HEIGHT_DP="height";
 public static int statusBarHeightPx(int nativePx,int configuredDp,float density) HEIGHT_BODY}
'''.replace('HEIGHT_BODY', height_body),
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;
class FeatureSettings {static final String SYSTEMUI_LAST_ERROR="error";static boolean master=true;static int height=-4;
 static boolean enabled(android.content.Context c,String key){return master;}
 static int integer(android.content.Context c,String key,int fallback,int min,int max){return height;}
 static void diagnostic(android.content.Context c,String key,String value){}
 static void addSnapshotListener(android.content.Context c,Runnable r){}static void removeSnapshotListener(Runnable r){}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
class AugmentModule {interface Chain {Object proceed()throws Throwable;Object getThisObject();Object getArg(int i);}
 interface Callback {Object run(Chain chain)throws Throwable;}static class Builder {Builder intercept(Callback c){return this;}}
 Builder prepareFeatureHook(java.lang.reflect.Method m,String key,boolean b){return new Builder();}void registerFeatureHook(Builder b){}
 void deoptimize(java.lang.reflect.Method m){}void logFeatureInfo(String v){}void logFeatureError(String k,Throwable e){throw new AssertionError(k,e);}}''',
}

runner = r'''package ls.augment.com.hook;
import android.content.Context;import android.graphics.Insets;import android.view.*;import java.lang.reflect.*;import ls.augment.com.ConfigSchema;
public class WindowGeometryTest {
 public static class Phone {public int mStatusBarHeight=107;final ViewGroup.LayoutParams p=new ViewGroup.LayoutParams();
  public ViewGroup.LayoutParams getLayoutParams(){return p;}public void setLayoutParams(ViewGroup.LayoutParams p){this.p.height=p.height;}}
 static class Grid {final Phone root=new Phone();final Context context=new Context();int nativeHeight=107;
  boolean isKeyguard(Phone p){return false;}void applyHeight(int dp) GRID_HEIGHT_BODY}
 public static class Override {final int type;final Insets insets;
  public Override(int t,Insets i){type=t;insets=i;}public int getWindowType(){return type;}public Insets getInsetsSize(){return insets;}}
 public static class Provider {final int type;Insets inset,minimum;Override[] overrides;
  Provider(int t,int h,int min,int override){type=t;inset=Insets.of(0,h,0,0);minimum=min==0?null:Insets.of(0,min,0,0);overrides=override<0?null:new Override[]{new Override(2011,Insets.of(0,override,0,0))};}
  public int getType(){return type;}public Insets getInsetsSize(){return inset;}public Insets getMinimalInsetsSizeInDisplayCutoutSafe(){return minimum;}
  public Override[] getInsetsSizeOverrides(){return overrides;}public void setInsetsSize(Insets i){inset=i;}
  public void setMinimalInsetsSizeInDisplayCutoutSafe(Insets i){minimum=i;}public void setInsetsSizeOverrides(Override[] o){overrides=o;}}
 public static class State {public boolean mIsLaunchAnimationRunning;}
 public static class Wm implements WindowManager {int submitted,lastHeight,lastTop,lastRotationTop;
  public void updateViewLayout(View v,LayoutParams p){submitted++;lastHeight=p.height;lastTop=((Provider)p.providedInsets[0]).inset.top;lastRotationTop=((Provider)p.paramsForRotation[1].providedInsets[0]).inset.top;}}
 public static class Controller {
  public android.content.Context mContext=new android.content.Context();public int mBarHeight=107;
  public State mCurrentState=new State();public WindowManager.LayoutParams mLpChanged=params(107);
  public WindowManager.LayoutParams mLp=new WindowManager.LayoutParams();public View mStatusBarWindowView=new View();public Wm mWindowManager=new Wm();
  Controller(){mLpChanged.paramsForRotation=new WindowManager.LayoutParams[]{params(107),params(70),params(107),params(70)};mLp.copyFrom(mLpChanged);}}
 static WindowManager.LayoutParams params(int h){WindowManager.LayoutParams p=new WindowManager.LayoutParams();p.height=h;
  p.providedInsets=new Object[]{new Provider(1,h,h,h),new Provider(64,h,h,-1),new Provider(32,h,120,-1)};return p;}
 static Method sync;static int checks;
 static void apply(Controller c,boolean submit)throws Exception{try{sync.invoke(null,c,submit);}catch(InvocationTargetException e){throw new AssertionError(e.getCause());}}
 static void check(boolean condition,String message){checks++;if(!condition)throw new AssertionError(message);}
 static Provider status(WindowManager.LayoutParams p){return (Provider)p.providedInsets[0];}
 public static void main(String[] args)throws Exception{
  sync=StatusBarWindowSizingHook.class.getDeclaredMethod("synchronizeWindow",Object.class,boolean.class);sync.setAccessible(true);
  Controller c=new Controller();apply(c,false);
  check(c.mBarHeight==94&&c.mLpChanged.height==94,"cached height and actual window must agree");
  check(status(c.mLpChanged).inset.top==94,"base application inset tracks reduced height");
  check(c.mLpChanged.paramsForRotation[1].height==57&&status(c.mLpChanged.paramsForRotation[1]).inset.top==57,"rotation height and inset use rotation-native baseline");
  check(status(c.mLpChanged).minimum.top==94&&status(c.mLpChanged).overrides[0].insets.top==94,"OEM app-inset minimum and IME override cannot retain old height");
  check(((Provider)c.mLpChanged.providedInsets[2]).minimum.top==120,"mandatory gesture cutout touch safety is preserved");
  apply(c,true);check(c.mWindowManager.submitted==1&&c.mWindowManager.lastTop==94&&c.mWindowManager.lastRotationTop==57,"provider sharing cannot suppress WM submission");
  apply(c,true);check(c.mBarHeight==94&&status(c.mLpChanged.paramsForRotation[1]).inset.top==57,"repeated application never accumulates negative offsets");
  c.mCurrentState.mIsLaunchAnimationRunning=true;apply(c,true);
  check(c.mLpChanged.height==-1&&c.mLpChanged.paramsForRotation[1].height==-1,"launch animations keep full-window geometry");
  check(status(c.mLpChanged).inset.top==94&&status(c.mLpChanged.paramsForRotation[1]).inset.top==57,"launch animation never gives apps fullscreen statusbar insets");
  FeatureSettings.height=0;apply(c,false);apply(c,true);
  check(c.mWindowManager.lastTop==107&&c.mWindowManager.lastRotationTop==70,"clearing height submits restored insets even during fullscreen animation");
  check(status(c.mLpChanged).minimum.top==107&&status(c.mLpChanged).overrides[0].insets.top==107,"clearing restores OEM minima and overrides exactly");
  c.mCurrentState.mIsLaunchAnimationRunning=false;FeatureSettings.height=-4;apply(c,true);FeatureSettings.master=false;apply(c,false);apply(c,true);
  check(c.mLpChanged.height==107&&status(c.mLpChanged).inset.top==107,"master off restores actual geometry and app insets");
  FeatureSettings.master=true;FeatureSettings.height=-4;apply(c,true);
  com.android.internal.policy.SystemBarUtils.portrait=120;FeatureSettings.height=0;apply(c,false);apply(c,true);
  check(c.mBarHeight==120&&c.mLpChanged.height==120&&status(c.mLpChanged).inset.top==120,"restore resolves latest native dimensions rather than saved adjusted height");
  FeatureSettings.height=48;apply(c,true);check(c.mLpChanged.height==156&&status(c.mLpChanged).inset.top==156,"legacy positive configured minimum reaches WM");
  Grid grid=new Grid();grid.applyHeight(-4);check(grid.root.p.height==107&&grid.root.mStatusBarHeight==107,"phone root and native ongoing-indicator cache follow the new native baseline together");
  com.android.internal.policy.SystemBarUtils.portrait=107;grid.applyHeight(-4);
  check(grid.root.p.height==94&&grid.root.mStatusBarHeight==94,"phone ongoing-indicator cached height shrinks with the root");
  grid.applyHeight(0);check(grid.root.p.height==107&&grid.root.mStatusBarHeight==107,"phone height cache restores with root");
  System.out.println("Status bar window geometry: "+checks+" production-path assertions passed");
 }
}'''.replace('GRID_HEIGHT_BODY', grid_height_body)

with tempfile.TemporaryDirectory(prefix='lsa-statusbar-window-geometry-') as temp:
    temp = Path(temp)
    for name, text in support.items():
        target = temp / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
    for name in ['StatusBarWindowSizingHook.java', 'SystemUiCompatibility.java', 'TargetReflection.java']:
        (temp / 'ls/augment/com/hook' / name).write_text((SRC / 'hook' / name).read_text(encoding='utf-8'), encoding='utf-8')
    (temp / 'ls/augment/com/hook/WindowGeometryTest.java').write_text(runner, encoding='utf-8')
    java_home = os.environ.get('JAVA_HOME')
    javac = str(Path(java_home) / 'bin/javac.exe') if os.name == 'nt' and java_home else 'javac'
    java = str(Path(java_home) / 'bin/java.exe') if os.name == 'nt' and java_home else 'java'
    subprocess.run([javac, '-encoding', 'UTF-8', '-d', str(temp), *map(str, temp.rglob('*.java'))], check=True)
    subprocess.run([java, '-cp', str(temp), 'ls.augment.com.hook.WindowGeometryTest'], check=True)

# Use the real Android 16 providers, LayoutParams and InsetsState as a second
# boundary. No fabricated provider equals/hashCode or fake app-inset calculator.
framework = ROOT / 'out/header-clock-20455/android-runtime/deps/android-all-16-robolectric-13921718.jar'
if not framework.exists():
    raise RuntimeError('Pinned Android 16 framework test dependency is missing: ' + str(framework))
framework_runner = r'''package ls.augment.com.hook;
import android.graphics.*;import android.view.*;import java.lang.reflect.*;
import org.junit.Test;import org.junit.runner.RunWith;import org.robolectric.RobolectricTestRunner;import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=36,manifest=Config.NONE)
public class FrameworkWindowInsetsTest {
 static Method apply;static int checks;static Object owner=new Object();
 static void check(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
 static WindowManager.LayoutParams params(int h){WindowManager.LayoutParams p=new WindowManager.LayoutParams();p.height=h;
  p.providedInsets=new InsetsFrameProvider[]{
   new InsetsFrameProvider(owner,0,WindowInsets.Type.statusBars()).setInsetsSize(Insets.of(0,h,0,0)).setMinimalInsetsSizeInDisplayCutoutSafe(Insets.of(0,h,0,0))
    .setInsetsSizeOverrides(new InsetsFrameProvider.InsetsSizeOverride[]{new InsetsFrameProvider.InsetsSizeOverride(2011,Insets.of(0,h,0,0)),new InsetsFrameProvider.InsetsSizeOverride(2012,Insets.NONE)}),
   new InsetsFrameProvider(owner,0,WindowInsets.Type.tappableElement()).setInsetsSize(Insets.of(0,h,0,0)),
   new InsetsFrameProvider(owner,0,WindowInsets.Type.mandatorySystemGestures()).setInsetsSize(Insets.of(0,h,0,0)).setMinimalInsetsSizeInDisplayCutoutSafe(Insets.of(0,120,0,0))};return p;}
 static void set(WindowManager.LayoutParams p,int nativeH,int h,boolean launch,boolean enabled)throws Exception{apply.invoke(null,p,nativeH,h,launch,enabled);}
 static void previousProviderPatch(WindowManager.LayoutParams params,int height)throws Exception{PREVIOUS_PROVIDER_PATCH}
 static int appInset(WindowManager.LayoutParams p){InsetsFrameProvider provider=p.providedInsets[0];int h=provider.getInsetsSize().top;
  if(provider.getMinimalInsetsSizeInDisplayCutoutSafe()!=null)h=Math.max(h,provider.getMinimalInsetsSizeInDisplayCutoutSafe().top);
  InsetsState state=new InsetsState();Rect frame=new Rect(0,0,1216,2688);state.setDisplayFrame(frame);
  state.getOrCreateSource(provider.getId(),provider.getType()).setVisible(true).setFrame(0,0,1216,h);
  return state.calculateInsets(frame,WindowInsets.Type.statusBars(),true).top;}
 @Test public void realFrameworkInsets()throws Exception{
  apply=StatusBarWindowSizingHook.class.getDeclaredMethod("applyLayoutHeight",WindowManager.LayoutParams.class,int.class,int.class,boolean.class,boolean.class);apply.setAccessible(true);
  WindowManager.LayoutParams previous=params(107);previousProviderPatch(previous,94);
  check(previous.providedInsets[0].getInsetsSize().top==94&&appInset(previous)==107,"previous production base-only patch reduces paint height but leaves an OEM-minimum app inset at native height");
  check(previous.providedInsets[0].getInsetsSizeOverrides()[0].getInsetsSize().top==107,"previous production patch leaves window-type overrides stale");
  for(int rotation=0;rotation<4;rotation++){
   int nativeH=rotation%2==0?107:70,h=nativeH-13;WindowManager.LayoutParams p=params(nativeH);WindowManager.LayoutParams copy=new WindowManager.LayoutParams();copy.copyFrom(p);
   check(copy.providedInsets==p.providedInsets,"real LayoutParams shares provider array, explicit submit is required");
   set(p,nativeH,h,false,true);set(p,nativeH,h,false,true);
   check(p.height==h&&appInset(p)==h,"real app inset shrinks on rotation "+rotation);
   check(p.providedInsets[0].getInsetsSizeOverrides()[0].getInsetsSize().top==h,"mutable provider hash cannot accumulate override offsets on rotation "+rotation);
   check(p.providedInsets[0].getInsetsSizeOverrides()[1].getInsetsSize().top==0,"zero override remains zero");
   check(p.providedInsets[2].getMinimalInsetsSizeInDisplayCutoutSafe().top==120,"gesture safety minimum remains independent");
   set(p,nativeH,h,true,true);check(p.height==-1&&appInset(p)==h,"real app inset remains finite during launch on rotation "+rotation);
   set(p,nativeH,nativeH,false,false);
   check(p.height==nativeH&&appInset(p)==nativeH,"real app inset restores on rotation "+rotation);
   check(p.providedInsets[0].getMinimalInsetsSizeInDisplayCutoutSafe().top==nativeH&&p.providedInsets[0].getInsetsSizeOverrides()[0].getInsetsSize().top==nativeH,"real provider minima and overrides restore exactly");
  }
  System.out.println("Android 16 window insets: "+checks+" real-framework assertions passed");
 }
}'''.replace('PREVIOUS_PROVIDER_PATCH', previous_provider_patch)
with tempfile.TemporaryDirectory(prefix='lsa-statusbar-real-insets-') as temp:
    temp = Path(temp)
    for name, text in support.items():
        if not name.startswith('ls/'):
            continue
        target = temp / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding='utf-8')
    for name in ['StatusBarWindowSizingHook.java', 'SystemUiCompatibility.java', 'TargetReflection.java']:
        (temp / 'ls/augment/com/hook' / name).write_text((SRC / 'hook' / name).read_text(encoding='utf-8'), encoding='utf-8')
    (temp / 'ls/augment/com/hook/FrameworkWindowInsetsTest.java').write_text(framework_runner, encoding='utf-8')
    dependencies = sorted(framework.parent.glob('*.jar'))
    classpath = os.pathsep.join(map(str, dependencies))
    subprocess.run([javac, '-encoding', 'UTF-8', '-cp', classpath, '-d', str(temp), *map(str, temp.rglob('*.java'))], check=True)
    subprocess.run([java, '-Dfile.encoding=UTF-8', '-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2',
                    '-cp', os.pathsep.join([str(temp), classpath]), 'org.junit.runner.JUnitCore', 'ls.augment.com.hook.FrameworkWindowInsetsTest'], check=True)
