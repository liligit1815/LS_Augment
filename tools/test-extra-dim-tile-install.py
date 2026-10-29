"""Exercise production Extra Dim installation and callbacks across inspected OEM shapes."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
JDK = Path(os.environ.get('JAVA_HOME', 'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
source = (SRC / 'ExtraDimTileHook.java').read_text(encoding='utf-8')


def member(marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


FILES = {
    'android/content/ComponentName.java': '''package android.content;public class ComponentName{
public final String pkg,cls;public ComponentName(String p,String c){pkg=p;cls=c;}
public String getPackageName(){return pkg;}public String getClassName(){return cls;}}''',
    'android/view/View.java': 'package android.view;public class View{}',
    'android/view/ViewGroup.java': '''package android.view;public class ViewGroup extends View{
public static class LayoutParams{public static final int WRAP_CONTENT=-2;public int width,height;}}''',
    'android/os/Handler.java': '''package android.os;public class Handler{
public final java.util.List<Runnable> jobs=new java.util.ArrayList<>();public void post(Runnable r){jobs.add(r);}
public void drain(){for(Runnable r:new java.util.ArrayList<>(jobs))r.run();jobs.clear();}}''',
    'com/android/systemui/animation/Expandable.java': 'package com.android.systemui.animation;public interface Expandable{}',
    'com/android/systemui/plugins/qs/QSTile.java': 'package com.android.systemui.plugins.qs;public interface QSTile{}',
    'com/android/systemui/plugins/qs/DetailAdapter.java': 'package com.android.systemui.plugins.qs;public interface DetailAdapter{}',
    'com/android/systemui/qs/tileimpl/TileParent.java': '''package com.android.systemui.qs.tileimpl;
import com.android.systemui.plugins.qs.*;import com.android.systemui.animation.Expandable;
public class TileParent implements QSTile{public static final DetailAdapter NATIVE=new DetailAdapter(){};public int shown,longClicks;
public DetailAdapter getDetailAdapter(){return NATIVE;}public void showDetail(boolean on){if(on)shown++;}
public void fireToggleStateChanged(boolean on){}public void handleLongClick(Expandable v){longClicks++;}}''',
    'com/android/systemui/qs/tileimpl/QSTileImpl.java': 'package com.android.systemui.qs.tileimpl;public class QSTileImpl extends TileParent{}',
    'com/android/systemui/qs/external/CustomTile.java': '''package com.android.systemui.qs.external;
public class CustomTile extends com.android.systemui.qs.tileimpl.QSTileImpl{
public android.content.ComponentName component;public CustomTile(String p,String c){component=new android.content.ComponentName(p,c);}
public android.content.ComponentName getComponent(){return component;}}''',
    'io/github/libxposed/api/XposedInterface.java': '''package io.github.libxposed.api;
public interface XposedInterface{interface HookHandle{void unhook();}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import io.github.libxposed.api.XposedInterface.HookHandle;
public class AugmentModule{
static final Map<Method,List<Handle>> hooks=new HashMap<>();int prepared,registered,errors,failHook,failRegister,unhookFailures;Throwable error;
interface Callback{Object call(Chain c)throws Throwable;}interface Chain{Object getThisObject();Object getArg(int i);Object proceed()throws Throwable;}
class Handle implements HookHandle{final Method method;final Callback callback;Handle(Method m,Callback c){method=m;callback=c;}
public void unhook(){if(unhookFailures-->0)throw new IllegalStateException("unhook failed");hooks.get(method).remove(this);}}
class Builder{final Method method;Builder(Method m){method=m;}HookHandle intercept(Callback c){
if(prepared==failHook)throw new IllegalStateException("hook failed");Handle h=new Handle(method,c);hooks.computeIfAbsent(method,k->new ArrayList<>()).add(h);return h;}}
Builder prepareFeatureHook(Method m,String id,boolean before){prepared++;return new Builder(m);}
void registerFeatureHook(HookHandle h){registered++;if(registered==failRegister)throw new IllegalStateException("registration failed");}
void logFeatureError(String stage,Throwable e){errors++;error=e;}
static Method method(Class<?> type,String name,Class<?>...params)throws Exception{for(Class<?> t=type;t!=null;t=t.getSuperclass())try{
Method m=t.getDeclaredMethod(name,params);m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}throw new NoSuchMethodException(name);}
static Object invoke(Object owner,String name,Class<?>[] params,Object...args)throws Throwable{
Method m=method(owner.getClass(),name,params);List<Handle> handlers=new ArrayList<>(hooks.getOrDefault(m,List.of()));
class Invocation implements Chain{int index;public Object getThisObject(){return owner;}public Object getArg(int i){return args[i];}
public Object proceed()throws Throwable{if(index<handlers.size())return handlers.get(index++).callback.call(this);
try{return m.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}}return new Invocation().proceed();}
static long liveHandles(){return hooks.values().stream().mapToInt(List::size).sum();}
}''',
}
FILES['ls/augment/com/hook/ExtraDimTileHook.java'] = '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.atomic.AtomicBoolean;
import android.content.ComponentName;import android.view.View;import io.github.libxposed.api.XposedInterface.HookHandle;
class ExtraDimTileHook{
static boolean installed;static final android.os.Handler MAIN=new android.os.Handler();
static final Map<Object,Boolean> LAYOUTS=Collections.synchronizedMap(new WeakHashMap<>());
static final Object EXTRA=new com.android.systemui.plugins.qs.DetailAdapter(){};
static class Detail{final Object adapter=EXTRA;}static Detail detail(Object o,Class<?> t,Method m){return new Detail();}
''' + '\n'.join(member(marker) for marker in (
    '    static synchronized int install(', '    private static List<Method> detailLayouts(',
    '    private static boolean matches(')) + '\n}'
FILES['ls/augment/com/hook/TestExtraDimTile.java'] = '''package ls.augment.com.hook;
import java.lang.reflect.*;import java.util.*;import android.view.*;import com.android.systemui.plugins.qs.*;
import com.android.systemui.qs.external.CustomTile;import com.android.systemui.qs.tileimpl.TileParent;
public class TestExtraDimTile{
static int checks;static void check(boolean ok,String why){checks++;if(!ok)throw new AssertionError(why);}
static final ClassLoader LOADER=TestExtraDimTile.class.getClassLoader();
static void reset(){ExtraDimTileHook.installed=false;ExtraDimTileHook.LAYOUTS.clear();ExtraDimTileHook.MAIN.jobs.clear();AugmentModule.hooks.clear();}
static CustomTile own(){return new CustomTile("ls.augment.com","ls.augment.com.ExtraDimTileService");}
static Object get(Object tile)throws Throwable{return AugmentModule.invoke(tile,"getDetailAdapter",new Class<?>[0]);}
static void choose(Object owner,QSTile tile,boolean on)throws Throwable{AugmentModule.invoke(owner,"handleShowDetailTile",new Class<?>[]{QSTile.class,boolean.class,boolean.class,boolean.class},tile,on,false,false);}
static void height(Object owner,Method m,ViewGroup.LayoutParams p)throws Throwable{Object[] args=m.getParameterCount()==1?new Object[]{p}:new Object[]{p,new View()};AugmentModule.invoke(owner,m.getName(),m.getParameterTypes(),args);}
public static void main(String[] args)throws Throwable{
 boolean reject=args[0].equals("reject");Class<?> cls=Class.forName("com.zte.feature.qs.layout.QsDetailModule");
 reset();AugmentModule module=new AugmentModule();int count=ExtraDimTileHook.install(module,LOADER);
 if(reject){check(count==0&&module.prepared==0&&module.registered==0&&AugmentModule.liveHandles()==0&&!ExtraDimTileHook.installed,"unknown contract installed partial interception");check(module.errors==1,"missing capability not recorded");System.out.println("PASS "+args[1]+": "+checks+" assertions");return;}
 int expected=Integer.parseInt(args[0]);check(count==expected&&module.registered==expected&&module.errors==0,"complete installation failed");
 check(ExtraDimTileHook.install(module,LOADER)==0&&module.prepared==expected,"repeated install duplicated hooks");
 Object layout=cls.getConstructor().newInstance(),other=cls.getConstructor().newInstance();CustomTile tile=own(),foreign=new CustomTile("other.app","ls.augment.com.ExtraDimTileService"),wrong=new CustomTile("ls.augment.com","other.Tile");
 check(get(tile)==ExtraDimTileHook.EXTRA,"own tile detail not replaced");check(get(foreign)==TileParent.NATIVE&&get(wrong)==TileParent.NATIVE,"foreign component intercepted");
 AugmentModule.invoke(tile,"handleLongClick",new Class<?>[]{com.android.systemui.animation.Expandable.class},new Object[]{null});ExtraDimTileHook.MAIN.drain();
 check(tile.shown==1&&tile.longClicks==0,"own long click did not open detail");
 AugmentModule.invoke(foreign,"handleLongClick",new Class<?>[]{com.android.systemui.animation.Expandable.class},new Object[]{null});
 check(foreign.longClicks==1&&foreign.shown==0,"foreign long click suppressed");
 List<Method> measures=new ArrayList<>();for(Method m:cls.getMethods())if(m.getName().equals("updateDetailContainerLayout"))measures.add(m);
 check(measures.size()==expected-3,"recognized overload omitted");
 for(Method m:measures){ViewGroup.LayoutParams p=new ViewGroup.LayoutParams();choose(layout,tile,true);height(layout,m,p);
 check(p.height==-2&&p.width==711,"own content height or native width lost");height(other,m,p);check(p.height==432,"other owner changed");
 choose(layout,foreign,true);height(layout,m,p);check(p.height==432,"next native tile kept extra dim height");
 choose(layout,tile,true);choose(layout,tile,false);height(layout,m,p);check(p.height==432,"hidden detail ownership retained");
 cls.getField("failChoose").setBoolean(layout,true);try{choose(layout,tile,true);throw new AssertionError("expected OEM failure");}catch(IllegalStateException expectedFailure){}
 cls.getField("failChoose").setBoolean(layout,false);height(layout,m,p);check(p.height==432,"failed selection left active layout");
 choose(layout,tile,true);cls.getField("failChoose").setBoolean(layout,true);try{choose(layout,foreign,true);throw new AssertionError("expected OEM failure");}catch(IllegalStateException expectedFailure){}
 cls.getField("failChoose").setBoolean(layout,false);height(layout,m,p);check(p.height==-2,"failed native selection lost previous owner");}
 for(int point=1;point<=expected;point++){reset();module=new AugmentModule();module.failHook=point;
 check(ExtraDimTileHook.install(module,LOADER)==0&&AugmentModule.liveHandles()==0&&!ExtraDimTileHook.installed,"partial installation not rolled back at "+point);
 check(get(tile)==TileParent.NATIVE,"failed install replaced native detail");module.failHook=0;
 check(ExtraDimTileHook.install(module,LOADER)==expected,"failed install could not retry");}
 reset();module=new AugmentModule();module.failRegister=2;module.unhookFailures=1;
 check(ExtraDimTileHook.install(module,LOADER)==0&&!ExtraDimTileHook.installed,"registration failure marked installed");
 check(AugmentModule.liveHandles()==1&&module.error.getSuppressed().length==1,"cleanup failure evidence missing");
 check(get(tile)==TileParent.NATIVE,"leftover interception active after rollback");
 choose(layout,tile,true);for(Method m:measures){ViewGroup.LayoutParams p=new ViewGroup.LayoutParams();height(layout,m,p);check(p.height==432,"leftover layout interception active");}
 System.out.println("PASS "+args[1]+": "+checks+" assertions; native isolation, lifecycle, rollback and retry");
}}
'''

choose = '''public boolean failChoose;public void handleShowDetailTile(com.android.systemui.plugins.qs.QSTile tile,boolean show,boolean quick,boolean fullscreen){if(failChoose)throw new IllegalStateException("OEM selection failed");}'''
legacy = 'public void updateDetailContainerLayout(android.view.ViewGroup.LayoutParams p){p.height=432;p.width=711;}'
modern = 'public void updateDetailContainerLayout(android.view.ViewGroup.LayoutParams p,android.view.View v){p.height=432;p.width=711;}'
variants = {
    'legacy': legacy, 'modern': modern, 'both': legacy + modern,
    'inherited-legacy': legacy, 'inherited-modern': modern,
    'missing': '', 'static': legacy.replace('public void', 'public static void'),
    'wrong-return': legacy.replace('public void', 'public int').replace('p.width=711;', 'p.width=711;return 1;'),
    'abstract': 'public abstract void updateDetailContainerLayout(android.view.ViewGroup.LayoutParams p);',
    'missing-choose': modern,
}
for variant, methods in variants.items():
    files = dict(FILES)
    parent = variant.startswith('inherited')
    abstract = variant == 'abstract'
    body = (choose if variant != 'missing-choose' else choose.replace('handleShowDetailTile', 'unrelated')) + methods
    name = 'LayoutParent' if parent else 'QsDetailModule'
    files[f'com/zte/feature/qs/layout/{name}.java'] = f'package com.zte.feature.qs.layout;public {"abstract " if abstract else ""}class {name}{{{body}}}'
    if parent:
        files['com/zte/feature/qs/layout/QsDetailModule.java'] = 'package com.zte.feature.qs.layout;public class QsDetailModule extends LayoutParent{}'
    expected = '5' if variant == 'both' else '4' if variant in ('legacy', 'modern', 'inherited-legacy', 'inherited-modern') else 'reject'
    with tempfile.TemporaryDirectory(prefix='duo-extra-dim-tile-') as directory:
        folder = Path(directory)
        for name, text in files.items():
            file = folder / name
            file.parent.mkdir(parents=True, exist_ok=True)
            file.write_text(text, encoding='utf-8')
        subprocess.run([str(JDK / 'javac.exe'), '-encoding', 'UTF-8', '--release', '17', '-d', directory,
                        *map(str, folder.rglob('*.java')), str(SRC / 'HookCompatibility.java')], check=True)
        subprocess.run([str(JDK / 'java.exe'), '-cp', directory, 'ls.augment.com.hook.TestExtraDimTile', expected, variant], check=True, timeout=30)
