"""Replay the inspected OEM crop geometry through the production gallery hook.

Uses focused JADX output from the user's two APKs in the ignored analysis directory
and the project's cached standalone Android/Robolectric runtime. No device needed.
The only BoundedRect decompiler repair initializes its native sentinel to -1;
no crop movement algorithm is replaced by a test implementation.
"""
import argparse
import hashlib
import os
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
JAVA = Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
DEPS = ROOT/'out/header-clock-20455/android-runtime/deps'
ANALYSIS = ROOT/'out/crop-unlimited-analysis-20261013/photoeditor'
BASE = ROOT/'out/crop-unlimited-analysis-20261013/gallery-runtime'


def method(source, name):
    declaration = re.search(r'    public static [^\n]+\b'+re.escape(name)+r'\(',source)
    assert declaration, f'Inspected OEM helper missing: {name}'
    start = declaration.start()
    opening = source.index('{', start)
    depth = 1
    end = opening + 1
    while depth:
        if source[end] == '{': depth += 1
        elif source[end] == '}': depth -= 1
        end += 1
    return source[start:end]


SOURCES = {
'com/android/gallery3d/filtershow/app/Log.java': '''package com.android.gallery3d.filtershow.app;
public class Log {public static void i(String a,String b){}}''',
'ls/augment/com/SystemOptions.java': '''package ls.augment.com;
public class SystemOptions {public static String key(String s){return "ls_augment_rm_"+s;}}''',
'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
class AugmentModule {void logFeatureError(String s,Throwable t){throw new AssertionError(s,t);}
void logFeatureInfo(String s){}}''',
'ls/augment/com/hook/OemHooks.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;
class OemHooks {
 interface Action {Object intercept(Chain c)throws Throwable;}
 static final Map<Method,Action> hooks=new HashMap<>();static boolean enabled;static boolean throwNative;
 static int methods(AugmentModule m,ClassLoader l,String type,String name,Class<?> r,int argc,String key,Action a,Class<?>[] p){
 try {Method method=Class.forName(type,false,l).getDeclaredMethod(name,p);
 if(method.getReturnType()!=r||method.getParameterCount()!=argc)return 0;
 if(!key.equals("ls_augment_rm_gallery_crop_unlimited"))throw new AssertionError("wrong settings key");
 hooks.put(method,a);return 1;}catch(ReflectiveOperationException e){return 0;}}
 static Object call(Object owner,String name,Class<?>[] types,Object...args)throws Throwable {
 Method m=owner.getClass().getDeclaredMethod(name,types);Action a=hooks.get(m);Chain c=new Chain(owner,m,args);
 return enabled&&a!=null?a.intercept(c):c.proceed();}
 static class Chain {final Object owner;final Method method;final Object[] args;
 Chain(Object o,Method m,Object[] a){owner=o;method=m;args=a;}
 Object getThisObject(){return owner;}
 Object proceed()throws Throwable {if(throwNative)throw new IllegalStateException("native failure");
 try{return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}}
}''',
'ls/augment/com/hook/GalleryCropRuntimeTest.java': '''package ls.augment.com.hook;
import android.graphics.*;import java.lang.reflect.*;import org.junit.*;
import org.junit.runner.RunWith;import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;import org.robolectric.annotation.GraphicsMode;
import com.android.gallery3d.filtershow.crop.CropObject;
import com.android.gallery3d.filtershow.imageshow.GeometryMathUtils;
@RunWith(RobolectricTestRunner.class) @Config(sdk=36,manifest=Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class GalleryCropRuntimeTest {
 static final Class<?>[] TWO={float.class,float.class}, THREE={float.class,float.class,float.class};
 static Field minimum;static boolean initialized;
 @Before public void before()throws Exception {
  if(!initialized){GalleryCropHook.install(new AugmentModule(),getClass().getClassLoader(),"com.android.gallery3d");
   Assert.assertEquals("gallery only launches editor",0,OemHooks.hooks.size());
   GalleryCropHook.install(new AugmentModule(),getClass().getClassLoader(),"cn.nubia.photoeditor");
   Assert.assertEquals("exact ordinary move and two aspect methods",3,OemHooks.hooks.size());initialized=true;}
  minimum=CropObject.class.getDeclaredField("mMinSideSize");minimum.setAccessible(true);
  OemHooks.enabled=true;OemHooks.throwNative=false;
 }
 static CropObject crop(float min){CropObject c=new CropObject(new RectF(0,0,1000,1000),new RectF(100,100,400,400),0);
  c.setMinInnerSideSize(min);c.selectEdge(CropObject.TOP_LEFT);return c;}
 static boolean move(CropObject c,float x,float y)throws Throwable{return (Boolean)OemHooks.call(c,"moveCurrentSelection",TWO,x,y);}
 static void valid(RectF r){Assert.assertTrue("finite ordered crop "+r,Float.isFinite(r.left)&&Float.isFinite(r.top)&&Float.isFinite(r.right)&&Float.isFinite(r.bottom)&&r.width()>0&&r.height()>0);
  Rect pixels=GeometryMathUtils.roundNearest(r);Assert.assertTrue("native save rounding must stay nonempty "+pixels,pixels.width()>0&&pixels.height()>0);}
 @Test public void dragBelowStockAndHotDisable()throws Throwable {
  CropObject c=crop(90);OemHooks.enabled=false;move(c,10000,10000);Assert.assertEquals(90,c.getInnerBounds().width(),.0001);
  c=crop(90);OemHooks.enabled=true;move(c,250,250);Assert.assertEquals(50,c.getInnerBounds().width(),.0001);Assert.assertEquals(90,minimum.getFloat(c),0);
  move(c,10000,10000);Assert.assertEquals(1,c.getInnerBounds().width(),.0001);valid(c.getInnerBounds());
  OemHooks.enabled=false;move(c,0,0);Assert.assertEquals("native minimum restored on next operation",90,c.getInnerBounds().width(),.0001);
  Assert.assertEquals(90,minimum.getFloat(c),0);
 }
 @Test public void scaleDependentMinimumAndNoTightening()throws Throwable {
  for(float scale:new float[]{.1f,1f,10f}){CropObject c=crop(90*scale);move(c,10000,10000);valid(c.getInnerBounds());Assert.assertEquals(90*scale,minimum.getFloat(c),0);}
  CropObject c=crop(.25f);move(c,10000,10000);Assert.assertEquals("already smaller native floor must remain smaller",.25f,c.getInnerBounds().width(),.0001);Assert.assertEquals(.25f,minimum.getFloat(c),0);
 }
 @Test public void aspectProjectionCrossingAndNoSelection()throws Throwable {
  for(float[] ratio:new float[][]{{1,1},{9,16},{16,9},{1,20},{20,1}})
   for(int edge:new int[]{CropObject.TOP_LEFT,CropObject.TOP_RIGHT,CropObject.BOTTOM_LEFT,CropObject.BOTTOM_RIGHT}){
    CropObject c=crop(90);Assert.assertEquals(true,OemHooks.call(c,"setInnerAspectRatio",TWO,ratio[0],ratio[1]));
    c.selectEdge(edge);move(c,(edge&CropObject.MOVE_LEFT)!=0?100000:-100000,(edge&CropObject.MOVE_TOP)!=0?100000:-100000);
    RectF r=c.getInnerBounds();valid(r);Assert.assertEquals(ratio[0]/ratio[1],r.width()/r.height(),.003);Assert.assertEquals(90,minimum.getFloat(c),0);
   }
  CropObject c=crop(90);c.clearSelectState();Assert.assertFalse(move(c,10,10));Assert.assertEquals(new RectF(100,100,400,400),c.getInnerBounds());
 }
 @Test public void retainedBoundsAndRotation()throws Throwable {
  CropObject c=crop(90);c.selectEdge(CropObject.MOVE_BLOCK);move(c,-100000,-100000);
  RectF r=c.getInnerBounds();Assert.assertEquals(0,r.left,.001);Assert.assertEquals(0,r.top,.001);Assert.assertEquals(300,r.width(),.001);
  move(c,100000,100000);r=c.getInnerBounds();Assert.assertEquals(1000,r.right,.001);Assert.assertEquals(1000,r.bottom,.001);valid(r);
  c=crop(90);CropObject reference=crop(90);reference.moveCurrentSelection(9999,9999,0);
  OemHooks.call(c,"moveCurrentSelection",THREE,9999f,9999f,0f);Assert.assertEquals("rotate/straighten overload retains native geometry",reference.getInnerBounds(),c.getInnerBounds());Assert.assertEquals(90,minimum.getFloat(c),0);
  c=new CropObject(new RectF(0,0,1000,1000),new RectF(250,250,750,750),17);c.setMinInnerSideSize(200);c.selectEdge(CropObject.TOP_LEFT);
  move(c,100,100);valid(c.getInnerBounds());Assert.assertEquals(200,minimum.getFloat(c),0);
 }
 @Test public void nativeAspectFailureAndThrowableRestoration()throws Throwable {
  CropObject c=new CropObject(new RectF(0,0,4,4),new RectF(0,0,4,4),0);c.setMinInnerSideSize(90);
  OemHooks.enabled=false;Assert.assertEquals(false,OemHooks.call(c,"setInnerAspectRatio",TWO,1f,1f));
  OemHooks.enabled=true;Assert.assertEquals(true,OemHooks.call(c,"setInnerAspectRatio",TWO,1f,1f));Assert.assertEquals(90,minimum.getFloat(c),0);
  OemHooks.call(c,"setInnerAspectNoRatio",TWO,4f,4f);Assert.assertEquals(90,minimum.getFloat(c),0);
  try{OemHooks.call(c,"setInnerAspectRatio",TWO,0f,1f);Assert.fail("native invalid ratio accepted");}catch(IllegalArgumentException expected){}
  Assert.assertEquals(90,minimum.getFloat(c),0);OemHooks.throwNative=true;
  try{move(c,1,1);Assert.fail("native failure swallowed");}catch(IllegalStateException expected){}
  Assert.assertEquals(90,minimum.getFloat(c),0);OemHooks.throwNative=false;
  Rect empty=GeometryMathUtils.roundNearest(new RectF(2,2,2,2));Assert.assertFalse(empty.width()>0&&empty.height()>0);
 }
}'''
}


def run():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--analysis-dir',type=Path,default=ANALYSIS)
    parser.add_argument('--runtime-deps',type=Path,default=DEPS)
    parser.add_argument('--android-jar',type=Path,default=ROOT/'audit-output/android-sdk/platforms/android-36/android.jar')
    parser.add_argument('--java-home',type=Path,default=Path(os.environ['JAVA_HOME']) if os.environ.get('JAVA_HOME') else None)
    parser.add_argument('--photoeditor-apk',type=Path)
    parser.add_argument('--gallery-apk',type=Path)
    args=parser.parse_args()
    if args.java_home:
        java=args.java_home/'bin'/('java.exe' if os.name=='nt' else 'java')
        javac=args.java_home/'bin'/('javac.exe' if os.name=='nt' else 'javac')
    elif shutil.which('java') and shutil.which('javac'):
        java=Path(shutil.which('java'));javac=Path(shutil.which('javac'))
    else:
        java=JAVA/'java.exe';javac=JAVA/'javac.exe'
    if not java.is_file() or not javac.is_file():parser.error('A JDK is required; pass --java-home, set JAVA_HOME, or add java/javac to PATH')
    if not args.android_jar.is_file():parser.error('Android 36 SDK android.jar unavailable; pass --android-jar')
    if not (args.runtime_deps/'robolectric-4.16.1.jar').is_file():parser.error('Cached standalone Android/Robolectric runtime unavailable; pass --runtime-deps (see tools/test-header-clock-android.py --bootstrap)')
    for name in ['CropObject.java','CropMath.java','BoundedRect-bad.java','GeometryMathUtils.java','ImageRotateStraighten.java']:
        if not (args.analysis_dir/name).is_file():parser.error(f'Focused OEM analysis file unavailable: {name}; pass --analysis-dir for the inspected photo editor JADX sources')
    for path,sha in [(args.photoeditor_apk,'6fd79cbbc06e58351871478c19f2b9e2863055afda50171a1bf9581777261b18'),
                     (args.gallery_apk,'77daa4090bc975bcad44e565e85828900f3a35b7213945f382520b33062ee95a')]:
        if path:assert hashlib.sha256(path.read_bytes()).hexdigest()==sha, f'{path}: different APK, inspect before replay'
    base=BASE/'src';classes=BASE/'classes';base.mkdir(parents=True,exist_ok=True);classes.mkdir(parents=True,exist_ok=True)
    sources=dict(SOURCES)
    for name in ['CropObject','CropMath']:
        sources[f'com/android/gallery3d/filtershow/crop/{name}.java']=(args.analysis_dir/f'{name}.java').read_text(encoding='utf-8')
    bounded=(args.analysis_dir/'BoundedRect-bad.java').read_text(encoding='utf-8')
    assert bounded.count('        int i;')==1
    sources['com/android/gallery3d/filtershow/crop/BoundedRect.java']=bounded.replace('        int i;','        int i = -1;',1)
    geometry=(args.analysis_dir/'GeometryMathUtils.java').read_text(encoding='utf-8')
    names=['clamp','lineIntersect','shortestVectorFromPointToLine','dotProduct','normalize','scalarProjection','vectorLength','roundNearest']
    sources['com/android/gallery3d/filtershow/imageshow/GeometryMathUtils.java']='package com.android.gallery3d.filtershow.imageshow;import android.graphics.*;public class GeometryMathUtils {\n'+ '\n'.join(method(geometry,n) for n in names)+'\n}'
    rotation=(args.analysis_dir/'ImageRotateStraighten.java').read_text(encoding='utf-8')
    sources['com/android/gallery3d/filtershow/imageshow/ImageRotateStraighten.java']='package com.android.gallery3d.filtershow.imageshow;import android.graphics.RectF;public class ImageRotateStraighten {\n'+method(rotation,'getUntranslatedStraightenCropBounds')+'\n}'
    files=[]
    for name,source in sources.items():
        path=base/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(source,encoding='utf-8');files.append(path)
    files.append(ROOT/'android/app/src/main/java/ls/augment/com/hook/GalleryCropHook.java')
    jars=list(args.runtime_deps.glob('*.jar'))
    compile_cp=os.pathsep.join([str(args.android_jar),*map(str,jars)])
    subprocess.run([str(javac),'-J-Duser.language=en','-encoding','UTF-8','-cp',compile_cp,'-d',str(classes),*map(str,files)],check=True)
    runtime=os.pathsep.join([str(classes),*map(str,jars)])
    subprocess.run([str(java),'-Drobolectric.dependency.repo.url=https://repo.maven.apache.org/maven2','-cp',runtime,'org.junit.runner.JUnitCore','ls.augment.com.hook.GalleryCropRuntimeTest'],cwd=BASE,check=True)
    print('Gallery crop replay passed: exact editor scope/signatures, native below-floor drag, bounds, projection/aspect, scale, hot-disable and throwable restore; save integer-validity retained')


if __name__=='__main__':run()
