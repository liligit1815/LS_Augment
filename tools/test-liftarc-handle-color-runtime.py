"""Execute native-color adaptation and unchanged production attachment/alpha bodies.

Android Paint/View and the native NavigationHandle are offline doubles. This
checks real production branches, not device pixels, themes, or unlock efficacy.
"""
from pathlib import Path
import argparse
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / "android/app/src/main/java/ls/augment/com/hook"


def extract(source, marker):
    start = source.index(marker)
    end = source.index("{", start) + 1
    depth = 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


STUBS = {
    "android/graphics/Paint.java": """package android.graphics;
public class Paint {
 public int writes; public boolean failRead,failWrite; private int color;
 public Paint(int initial){color=initial;}
 public int getColor(){if(failRead)throw new IllegalStateException("paint read failed");return color;}
 public void setColor(int value){if(failWrite)throw new IllegalStateException("paint write failed");writes++;color=value;}
}""",
    "android/content/Context.java": """package android.content;
public class Context {
 private final ClassLoader loader;
 public final android.content.res.Resources resources=new android.content.res.Resources();public final Theme theme=new Theme();
 public Context(){this(Context.class.getClassLoader());}
 public Context(ClassLoader value){loader=value;}
 public ClassLoader getClassLoader(){return loader;}
 public android.content.res.Resources getResources(){return resources;}public Theme getTheme(){return theme;}
 public static class Theme {
  public boolean resolves;public int type=28,color,resourceId;
  public boolean resolveAttribute(int id,android.util.TypedValue value,boolean resolve){value.type=type;value.data=color;value.resourceId=resourceId;return resolves;}
 }
}""",
    "android/util/TypedValue.java": """package android.util;public class TypedValue {public static final int TYPE_FIRST_COLOR_INT=28,TYPE_LAST_COLOR_INT=31;public int type,data,resourceId;}""",
    "android/content/res/Resources.java": """package android.content.res;public class Resources {
 public int attributeId,type=28,color;
 public int getIdentifier(String name,String kind,String pkg){return attributeId;}
 public void getValue(int id,android.util.TypedValue value,boolean resolve){value.type=type;value.data=color;}
}""",
    "android/view/View.java": """package android.view;
public class View {
 public static final int VISIBLE=0; public int invalidations; private float alpha=1f;
 private final java.util.List<Runnable> posts=new java.util.ArrayList<>();
 private android.content.Context context;public View(android.content.Context c){context=c;}
 public void setContext(android.content.Context c){context=c;}public android.content.Context getContext(){return context;}
 public android.content.res.Resources getResources(){return context.getResources();}
 public void invalidate(){invalidations++;} public float getAlpha(){return alpha;}
 public void setAlpha(float value){alpha=value;} public int getVisibility(){return VISIBLE;}
 public void post(Runnable runnable){posts.add(runnable);}
 public void flushPosts(){for(Runnable r:new java.util.ArrayList<>(posts))r.run();posts.clear();}
}""",
    "com/android/systemui/navigationbar/gestural/NavigationHandle.java": """package com.android.systemui.navigationbar.gestural;
// Matches the audited NX809J API: public final mPaint, no getHandleColor().
public class NavigationHandle extends android.view.View {
 public final android.graphics.Paint mPaint;
 public static NavigationHandle last; public static int initial=0xff123456;
 public static boolean failConstructor,failDark,failRead,failWrite; public int darkCalls;
 public NavigationHandle(android.content.Context c){super(c);
  if(failConstructor)throw new IllegalStateException("native constructor failed");
  mPaint=new android.graphics.Paint(initial);mPaint.failRead=failRead;mPaint.failWrite=failWrite;last=this;
 }
 public void setDarkIntensity(float amount){darkCalls++;if(failDark)throw new IllegalStateException("native dark intensity failed");}
}""",
}

HARNESS = r'''package ls.augment.com.hook;
import android.content.Context;import android.graphics.Paint;import android.view.View;
import com.android.systemui.navigationbar.gestural.NavigationHandle;
import java.util.*;
public class TestLiftArcHandleColor {
 static int checks; static final int FALLBACK=0x80ffffff;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 static LiftArcController attach(int initial){
  NavigationHandle.initial=initial;NavigationHandle.failConstructor=false;NavigationHandle.failDark=false;
  NavigationHandle.failRead=false;NavigationHandle.failWrite=false;
  LiftArcController c=new LiftArcController();c.runAttach(new Context());return c;
 }
 static NavigationHandle nativeChild(LiftArcController c){
  check(c.handle.getChildCount()==1&&!c.handle.fallback,"Native child stays installed, self-drawn fallback stays disabled");
  check(c.handle.getChildAt(0)==NavigationHandle.last,"The actual constructor result is attached");
  return NavigationHandle.last;
 }
 static class PrivatePaintBase extends View {
  private final Paint mPaint=new Paint(0);
  PrivatePaintBase(){super(new Context());} Paint drawingPaint(){return mPaint;}
 }
 static class PrivatePaintChild extends PrivatePaintBase {}
 static class MisleadingGetter extends View {
  public final Paint mPaint=new Paint(0x40123456);int calls;
  MisleadingGetter(){super(new Context());}
  public int getHandleColor(){calls++;return 0;}
 }
 static class GetterOnly extends View {
  int color=0x80abcdef;GetterOnly(){super(new Context());}
  public int getHandleColor(){return color;}
 }
 public static void main(String[] args)throws Exception {
  LiftArcController c=attach(0xff123456);NavigationHandle nav=nativeChild(c);
  check(c.warnings.isEmpty(),"Missing optional getter emits no runtime warning");
  check(nav.mPaint.getColor()==0xff123456&&nav.mPaint.writes==0&&nav.invalidations==0,"Valid native theme color is not rewritten");
  check(nav.darkCalls==1,"Original dark-intensity initialization is retained");
  c.handle.setAlpha(.35f);nav.setAlpha(0);c.handle.flushPosts();
  check(nav.getAlpha()==1f&&c.handle.getAlpha()==.35f,"Native child alpha restoration preserves the user's parent opacity");
  c.config.handleAlpha=.4f;c.runFade(.5f);
  check(Math.abs(c.handle.getAlpha()-.3f)<.00001f,"Existing handleAlpha and gesture fade still compose once");
  c.config.showHandle=false;c.runFade(0);
  check(c.handle.getAlpha()==0,"showHandle=false keeps the gesture view transparent");

  c=attach(0);nav=nativeChild(c);
  check(nav.mPaint.getColor()==FALLBACK&&nav.mPaint.writes==1,"No-getter NX809J transparent Paint is actually compensated");
  check(nav.invalidations==1&&c.warnings.isEmpty(),"Compensated native Paint invalidates once without a spurious WARN");
  for(int color:new int[]{0xff000000,0x08010203,0x80112233}){
   c=attach(color);nav=nativeChild(c);
   check(nav.mPaint.getColor()==color&&nav.mPaint.writes==0,"Opaque, translucent, and alpha=8 native colors are preserved");
  }
  c=attach(0x07010203);nav=nativeChild(c);
  check(nav.mPaint.getColor()==FALLBACK,"Only the existing near-transparent threshold is compensated");
  Context themed=new Context();themed.resources.attributeId=1;themed.theme.resolves=true;themed.theme.color=0x40234567;
  attach(0);c=new LiftArcController();c.runAttach(themed);nav=nativeChild(c);
  check(nav.mPaint.getColor()==0x40234567,"Transparent native Paint is compensated with the valid theme color, not an arbitrary white");
  themed.theme.color=0;c=new LiftArcController();c.runAttach(themed);nav=nativeChild(c);
  check(nav.mPaint.getColor()==FALLBACK,"A transparent resolved theme attribute uses the existing visible default");
  themed.theme.type=0;themed.theme.resourceId=42;themed.resources.color=0x50123456;
  c=new LiftArcController();c.runAttach(themed);nav=nativeChild(c);
  check(nav.mPaint.getColor()==0x50123456,"A valid theme color resource is preserved during necessary compensation");
  themed.resources.color=0;c=new LiftArcController();c.runAttach(themed);nav=nativeChild(c);
  check(nav.mPaint.getColor()==FALLBACK,"A transparent theme color resource cannot defeat visibility compensation");
  PrivatePaintChild inherited=new PrivatePaintChild();
  LiftArcHandleColor.ensureVisible(inherited,FALLBACK);
  check(inherited.drawingPaint().getColor()==FALLBACK,"Inherited private Paint is found without a getter");
  MisleadingGetter misleading=new MisleadingGetter();LiftArcHandleColor.ensureVisible(misleading,FALLBACK);
  check(misleading.calls==0&&misleading.mPaint.getColor()==0x40123456,"Actual drawing Paint wins over a misleading cached getter");
  GetterOnly only=new GetterOnly();
  check(LiftArcHandleColor.ensureVisible(only,FALLBACK).equals("ok(getter)")&&only.color==0x80abcdef,"A getter-only ROM preserves a known valid color");
  only.color=0;
  check(LiftArcHandleColor.ensureVisible(only,FALLBACK).equals("color:transparent(no-paint)")&&only.color==0,"No writable Paint means no invented repair");
  check(LiftArcHandleColor.ensureVisible(new View(new Context()),FALLBACK).equals("color:unverified"),"Missing optional capabilities return an honest unverified status");
  inherited=new PrivatePaintChild();
  check(LiftArcHandleColor.ensureVisible(inherited,0).equals("color:transparent")&&inherited.drawingPaint().writes==0,"An invalid compensation color cannot falsely report a repair");

  attach(0xff123456);NavigationHandle.failRead=true;c=new LiftArcController();c.runAttach(new Context());nav=nativeChild(c);
  check(c.warnings.equals(List.of("handle color failed")),"A real Paint read failure remains visible, unlike a missing getter");
  check(nav.mPaint.writes==0,"Read failure cannot trigger an unverified color overwrite");
  attach(0);NavigationHandle.failWrite=true;c=new LiftArcController();c.runAttach(new Context());nav=nativeChild(c);
  check(c.warnings.equals(List.of("handle color failed"))&&nav.mPaint.getColor()==0,"Real write failure is reported while native attachment survives");
  attach(0xff123456);NavigationHandle.failDark=true;c=new LiftArcController();c.runAttach(new Context());nav=nativeChild(c);
  check(c.warnings.equals(List.of("setDarkIntensity failed"))&&c.status.contains("darkIntensity:"),"A real native initialization failure is not masked by a valid color");
  check(nav.mPaint.getColor()==0xff123456,"Failed intensity initialization cannot blindly overwrite a valid Paint");
  attach(0xff123456);NavigationHandle.failConstructor=true;c=new LiftArcController();c.runAttach(new Context());
  check(c.handle.getChildCount()==0&&c.handle.fallback&&c.status.startsWith("handle=fallback(ctor:"),"Constructor failure retains the original self-drawn fallback");
  c=new LiftArcController();c.runAttach(new Context(new ClassLoader(Context.class.getClassLoader()){
   @Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{
    if(name.equals("com.android.systemui.navigationbar.gestural.NavigationHandle"))throw new ClassNotFoundException(name);
    return super.loadClass(name,resolve);
   }
  }));
  check(c.handle.fallback&&c.status.startsWith("handle=fallback(class:"),"Missing native class retains the original fallback");
  System.out.println("PASS LiftArc native color/production attachment/alpha: "+checks+" assertions (offline facade, not device pixels)");
 }
}
'''


def sources():
    controller = (HOOK / "LiftArcController.java").read_text(encoding="utf-8")
    handle = (HOOK / "LiftArcHandleView.java").read_text(encoding="utf-8")
    files = dict(STUBS)
    files["ls/augment/com/hook/LiftArcController.java"] = """package ls.augment.com.hook;
import android.content.Context;import android.view.View;
class LiftArcController {
 final LiftArcHandleView handle=new LiftArcHandleView();final java.util.List<String> warnings=new java.util.ArrayList<>();String status="";
 static class Config{boolean showHandle=true;float handleAlpha=1f;}final Config config=new Config();View hint;
 void log(String text,Throwable error){warnings.add(text);}void debugStatus(String text){status=text;}
 void runAttach(Context c){handle.setContext(c);attachSystemHandle(c);}void runFade(float p){fadeHandle(p);}
""" + extract(controller, "private void attachSystemHandle(Context ctx)") + "\n" + extract(controller, "private void fadeHandle(float p)") + "\n" + extract(controller, "private static String brief(Throwable t)") + "\n}"
    files["ls/augment/com/hook/LiftArcHandleView.java"] = """package ls.augment.com.hook;
import android.view.View;import android.util.TypedValue;
class LiftArcHandleView extends View {
 boolean fallback=true;final java.util.List<View> children=new java.util.ArrayList<>();
 LiftArcHandleView(){super(new android.content.Context());}
 static class LayoutParams{static final int MATCH_PARENT=-1;LayoutParams(int w,int h){}}
 void addView(View child,LayoutParams lp){children.add(child);}int getChildCount(){return children.size();}View getChildAt(int i){return children.get(i);}
""" + extract(handle, "void attachSystemHandle(View systemHandle)") + "\n" + extract(handle, "private void restoreChildAlpha()") + "\n" + extract(handle, "int systemHandleColor()") + "\n}"
    files["ls/augment/com/hook/TestLiftArcHandleColor.java"] = HARNESS
    return files


def run(jdk, support, adapter):
    with tempfile.TemporaryDirectory(prefix="liftarc-handle-color-") as directory:
        folder = Path(directory)
        files = dict(support)
        files["ls/augment/com/hook/LiftArcHandleColor.java"] = adapter
        paths = []
        for name, text in files.items():
            path = folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            paths.append(str(path))
        suffix = ".exe" if (jdk / "javac.exe").is_file() else ""
        compile_result = subprocess.run([str(jdk / ("javac" + suffix)), "-J-Dfile.encoding=UTF-8", "-J-Duser.language=en", "-J-Duser.country=US", "-encoding", "UTF-8", "--release", "17", "-d", str(folder / "classes"), *paths], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=45)
        if compile_result.returncode:
            raise RuntimeError(compile_result.stdout + compile_result.stderr)
        return subprocess.run([str(jdk / ("java" + suffix)), "-Dfile.encoding=UTF-8", "-cp", str(folder / "classes"), "ls.augment.com.hook.TestLiftArcHandleColor"], capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jdk", type=Path, help="JDK bin directory")
    args = parser.parse_args()
    candidates = [args.jdk]
    if os.environ.get("JAVA_HOME"):
        candidates.append(Path(os.environ["JAVA_HOME"]) / "bin")
    if shutil.which("javac"):
        candidates.append(Path(shutil.which("javac")).resolve().parent)
    candidates.append(Path("C:/Program Files/Android/openjdk/jdk-21.0.8/bin"))
    jdk = next((p for p in candidates if p and ((p / "javac.exe").is_file() or (p / "javac").is_file())), None)
    if not jdk:
        parser.error("Pass --jdk or set JAVA_HOME")
    support = sources()
    adapter = (HOOK / "LiftArcHandleColor.java").read_text(encoding="utf-8")
    result = run(jdk, support, adapter)
    print(result.stdout + result.stderr, end="")
    if result.returncode:
        return result.returncode
    mutants = {
        "getter-only adaptation": adapter.replace("Paint paint = nativePaint(handle);", "Paint paint = null;"),
        "unconditional native color overwrite": adapter.replace('if ((paint.getColor() >>> 24) >= 8) return "ok(paint)";', ""),
    }
    for name, mutant in mutants.items():
        if mutant == adapter:
            raise AssertionError("Mutation point missing: " + name)
        result = run(jdk, support, mutant)
        if result.returncode == 0:
            raise AssertionError("Unsafe mutation survived: " + name)
        print("PASS rejected mutation: " + name)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
