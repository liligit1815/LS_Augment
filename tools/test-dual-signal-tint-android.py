"""Execute the production dual-signal palette bridge on real Android Views.

OEM classes model the audited signatures. The stable-frame method is copied
verbatim from production; this runner performs no APK or device operations.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import subprocess

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin")
DEPS = ROOT / "out/header-clock-20455/android-runtime/deps"


def method(source, marker):
    start = source.index(marker)
    end = source.index("{", start) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


SUPPORT = {
"ls/augment/com/hook/AugmentModule.java": r'''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
public class AugmentModule {
 public static AugmentModule current;public int errors;final Map<Method,List<Interceptor>> hooks=new HashMap<>();
 public interface Interceptor{Object run(Chain chain)throws Throwable;}
 public class Hook{final Method method;Interceptor action;Hook(Method m){method=m;}public Hook intercept(Interceptor a){action=a;return this;}}
 public Hook prepareFeatureHook(Method m,String id,boolean fast){m.setAccessible(true);return new Hook(m);}
 public void registerFeatureHook(Hook h){hooks.computeIfAbsent(h.method,k->new ArrayList<>()).add(h.action);}
 public void logFeatureError(String name,Throwable error){errors++;}public void logFeatureInfo(String name){}public void deoptimize(Method m){}
 public static class Chain{final Object owner;final Method method;final AugmentModule module;Object[] args;int index;
  Chain(AugmentModule m,Object o,Method method,Object[] a){module=m;owner=o;this.method=method;args=a;}
  public Object getThisObject(){return owner;}public List<Object> getArgs(){return Arrays.asList(args);}public Object getArg(int i){return args[i];}
  public Object proceed()throws Throwable{return proceed(args);}public Object proceed(Object[] next)throws Throwable{args=next;List<Interceptor> list=module.hooks.get(method);
   if(list!=null&&index<list.size())return list.get(index++).run(this);
   Method original=method;try{original=method.getDeclaringClass().getDeclaredMethod("native_"+method.getName(),method.getParameterTypes());original.setAccessible(true);}catch(NoSuchMethodException absent){}
   try{return original.invoke(owner,args);}catch(InvocationTargetException error){throw error.getCause();}}
 }
 public static Object invoke(Object owner,Class<?> type,String name,Class<?>[] params,Object...args)throws Throwable{
  Method m=type.getMethod(name,params);return new Chain(current,owner,m,args).proceed();
 }
}''',
"ls/augment/com/hook/FeatureSettings.java": r'''package ls.augment.com.hook;
public class FeatureSettings{static int errors;static android.content.Context from(Object owner){return org.robolectric.RuntimeEnvironment.getApplication();}static void diagnostic(Object context,String key,String value){}static void diagnosticError(Object context,String key,String stage,Throwable error){errors++;}}''',
"ls/augment/com/hook/LiftArcLog.java": r'''package ls.augment.com.hook;public class LiftArcLog{static boolean e(String name,Throwable error){return true;}static void w(String name,Throwable error){}}''',
"ls/augment/com/hook/RedMagicSystemUiHook.java": r'''package ls.augment.com.hook;import android.view.View;public class RedMagicSystemUiHook{
 static int changes;static View last;static void signalTintChanged(View owner){if(DualSignalTint.managed(owner)){changes++;last=owner;owner.invalidate();}}}''',
"ls/augment/com/hook/StatusBarGridHook.java": r'''package ls.augment.com.hook;import android.view.View;import java.util.*;
public class StatusBarGridHook{static final Set<View> transformed=Collections.newSetFromMap(new WeakHashMap<>());static boolean hasGridTransform(View owner){return transformed.contains(owner);}}''',
"ls/augment/com/hook/StatusBarContentBounds.java": r'''package ls.augment.com.hook;import android.view.View;import android.graphics.RectF;import java.util.*;
public class StatusBarContentBounds{static final Map<View,RectF> ink=new WeakHashMap<>();static RectF of(View owner){RectF value=ink.get(owner);return value==null?new RectF(0,0,owner.getWidth(),owner.getHeight()):new RectF(value);}}''',
"ls/augment/com/hook/StatusBarAssetsHook.java": r'''package ls.augment.com.hook;import android.widget.ImageView;import android.graphics.drawable.Drawable;
public class StatusBarAssetsHook{static Drawable nativeDrawable(ImageView owner){Drawable value=owner.getDrawable();while(value instanceof Wrapped)value=((Wrapped)value).source;return value;}
 public static class Wrapped extends Drawable{final Drawable source;public Wrapped(Drawable d){source=d;}public void draw(android.graphics.Canvas c){source.draw(c);}public void setAlpha(int a){source.setAlpha(a);}public void setColorFilter(android.graphics.ColorFilter c){source.setColorFilter(c);}public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}}}''',
"com/android/systemui/plugins/DarkIconDispatcher.java": r'''package com.android.systemui.plugins;
import android.view.View;import android.graphics.Rect;import java.util.*;import ls.augment.com.hook.AugmentModule;
public class DarkIconDispatcher{
 public interface DarkReceiver{void onDarkChangedWithContrast(ArrayList<Rect> areas,int tint,int contrast);}
 public static boolean isInArea(Rect area,View owner){try{return (Boolean)AugmentModule.invoke(null,DarkIconDispatcher.class,"isInArea",new Class<?>[]{Rect.class,View.class},area,owner);}catch(Throwable e){throw new RuntimeException(e);}}
 public static boolean native_isInArea(Rect area,View owner){int[] at=new int[2];owner.getLocationOnScreen(at);return area.isEmpty()||area.top<=0&&Math.max(0,Math.min(area.right,at[0]+owner.getWidth())-Math.max(area.left,at[0]))*2>owner.getWidth();}
 public static int getTint(Collection<Rect> areas,View owner,int color){if(areas.isEmpty())return color;for(Rect area:areas)if(isInArea(area,owner))return color;return 0xffffffff;}
}''',
"com/android/systemui/statusbar/pipeline/shared/ui/view/ModernStatusBarView.java": r'''package com.android.systemui.statusbar.pipeline.shared.ui.view;
import android.content.Context;import android.graphics.Rect;import android.content.res.ColorStateList;import android.widget.FrameLayout;import android.widget.ImageView;import java.util.*;import com.android.systemui.plugins.DarkIconDispatcher;
public class ModernStatusBarView extends FrameLayout implements DarkIconDispatcher.DarkReceiver{
 public static class Colors{final int tint;Colors(int value){tint=value;}public int getTint(){return tint;}}
 public static class Flow{Object value;Flow(int tint){value=new Colors(tint);}public Object getValue(){return value;}}
 public static class Binding{public Flow $iconTint=new Flow(0xff888888);int decor;void foreground(int tint){$iconTint.value=new Colors(tint);}}
 public Binding binding=new Binding();public ImageView signal;public RuntimeException failure;
 public ModernStatusBarView(Context context){super(context);}
 public void onDarkChanged(ArrayList<Rect> areas,float intensity,int color){}
 @Override public void onDarkChangedWithContrast(ArrayList<Rect> areas,int color,int contrast){if(failure!=null)throw failure;int effective=DarkIconDispatcher.getTint(areas,this,color);if(binding!=null)binding.foreground(effective);if(signal!=null)signal.setImageTintList(ColorStateList.valueOf(effective));}
 public void setStaticDrawableColor(int color){}
 public void setStaticDrawableColor(int color,int contrast){if(failure!=null)throw failure;if(binding!=null)binding.foreground(color);if(signal!=null)signal.setImageTintList(ColorStateList.valueOf(color));}
 public void setDecorColor(int color){if(binding!=null)binding.decor=color;}
}''',
"com/android/systemui/statusbar/phone/DarkIconDispatcherImpl.java": r'''package com.android.systemui.statusbar.phone;
import java.util.*;import android.graphics.Rect;import com.android.systemui.plugins.DarkIconDispatcher.DarkReceiver;import com.android.systemui.statusbar.pipeline.shared.ui.view.ModernStatusBarView;import ls.augment.com.hook.AugmentModule;
public class DarkIconDispatcherImpl{
 public final List<DarkReceiver> receivers=new ArrayList<>();public final ArrayList<Rect> areas=new ArrayList<>();public int tint=0xff333333,contrast=0xffffffff,applies;
 public void addDarkReceiver(DarkReceiver owner){receivers.add(owner);apply(owner);}public void removeDarkReceiver(DarkReceiver owner){receivers.remove(owner);}
 public void applyDark(DarkReceiver owner){applies++;try{AugmentModule.invoke(owner,ModernStatusBarView.class,"onDarkChangedWithContrast",new Class<?>[]{ArrayList.class,int.class,int.class},areas,tint,contrast);}catch(Throwable e){throw new RuntimeException(e);}}
 public void applyIconTint(){for(DarkReceiver owner:receivers)apply(owner);}
 private void apply(DarkReceiver owner){try{AugmentModule.invoke(this,DarkIconDispatcherImpl.class,"applyDark",new Class<?>[]{DarkReceiver.class},owner);}catch(Throwable e){throw new RuntimeException(e);}}
}''',
}


def run(args):
    output = args.output_root
    output.mkdir(parents=True, exist_ok=True)
    support = output / "support"
    classes = output / "classes"
    classes.mkdir(exist_ok=True)
    prod = args.source_root / "android/app/src/main/java/ls/augment/com/hook"
    grid_source = args.grid_source or prod / "StatusBarGridHook.java"
    body = method(grid_source.read_text("utf-8"), "boolean beforeDraw(){")
    frame = '''package ls.augment.com.hook;import android.view.*;import android.os.SystemClock;import java.util.*;
final class TintStableFrame{final ViewGroup root;boolean active=true,layoutDirty,packingSuspended;Object packingCapacityBlock,batteryInk;
 long batteryInkAt;int layouts;final List<Object> frameWitnesses=new ArrayList<>();TintStableFrame(ViewGroup r){root=r;}
 boolean visibleFrame(View v){return true;}void syncOverlayAlpha(){}boolean unchangedFrame(){return true;}
 void layout(){layouts++;StatusBarTintHook.refresh(root);}boolean syncNativeIconCapacity(){return true;}void captureFrame(View v){}
''' + body + "\n}"
    files = dict(SUPPORT)
    files["ls/augment/com/hook/TintStableFrame.java"] = frame
    sources = []
    for name, code in files.items():
        path = support / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(code, "utf-8")
        sources.append(path)
    tint_source = args.tint_source or prod / "StatusBarTintHook.java"
    bridge_source = args.bridge_source or prod / "DualSignalTint.java"
    sources += [prod / "SystemUiAdapter.java", tint_source, bridge_source, ROOT / "tools/tests/DualSignalTintAndroidTest.java"]
    cp = os.pathsep.join(str(path) for path in DEPS.glob("*.jar"))
    subprocess.run([str(JAVA / "javac.exe"), "-encoding", "UTF-8", "-cp", cp, "-d", str(classes), *map(str, sources)], check=True)
    result = subprocess.run([str(JAVA / "java.exe"), "-Dfile.encoding=UTF-8", "-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2", "-cp", str(classes) + os.pathsep + cp, "org.junit.runner.JUnitCore", "ls.augment.com.hook.DualSignalTintAndroidTest"], text=True, capture_output=True, timeout=120)
    (output / "runtime.txt").write_text(result.stdout + result.stderr, "utf-8")
    print(result.stdout + result.stderr)
    evidence = {"status": "pass" if result.returncode == 0 else "failed", "realAndroidViews": True, "nativeSystemUiClasses": "facades of audited ROM contracts", "productionStableFrameMethodExecuted": True, "deviceOperations": False, "sources": {path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in [grid_source, tint_source, bridge_source]}, "output": result.stdout}
    (output / "verification.json").write_text(json.dumps(evidence, ensure_ascii=False, indent=2), "utf-8")
    return result.returncode


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-root", type=Path, default=ROOT)
    parser.add_argument("--output-root", type=Path, default=ROOT / "out/dual-signal-tint-20528")
    parser.add_argument("--grid-source", type=Path)
    parser.add_argument("--tint-source", type=Path)
    parser.add_argument("--bridge-source", type=Path)
    raise SystemExit(run(parser.parse_args()))
