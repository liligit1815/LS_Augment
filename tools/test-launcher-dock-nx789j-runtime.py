"""Run production Dock hooks with H1/C1 metadata and misleading old F1/C2 names.

Reuses the established behavioral doubles to preserve the sparse-row, migration,
geometry and native failure checks, plus application-lifecycle diagnostics.
"""
import importlib.util
from pathlib import Path
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('old_dock_runtime', ROOT/'tools/test-launcher-widget-dock-runtime.py')
BASE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BASE)


def sources():
    # These exact H1/C1 names are independently checked against the user's APK.
    replacements = {'F1':'H1', 'C2':'E2', 't0':'u0', 'A0':'B0', 'e1':'i1', 'E1':'I1',
                    'G0':'K0', 'H0':'L0', 'X1':'Y1', 'S3':'Y3', 'p1':'r1', 'z1':'C1',
                    'C3':'M3'}
    def translate(value):
        value = value.replace('x1.O', '__NX789J_MFV__').replace('x1/O', '__NX789J_MFV_PATH__')
        value = re.sub(r'\b('+ '|'.join(replacements)+r')\b', lambda m: replacements[m[0]], value)
        return value.replace('__NX789J_MFV__', 'z1.Q').replace('__NX789J_MFV_PATH__', 'z1/Q')
    data = {translate(k):translate(v) for k,v in BASE.sources(False).items()}
    # The source key and the Java simple class token need the same rename.
    data['z1/Q.java'] = data.pop('x1/O.java', data.get('z1/Q.java', '')).replace('package x1;', 'package z1;').replace('class O ', 'class Q ')
    data['com/android/launcher3/F1.java'] = 'package com.android.launcher3;public class F1 implements java.util.function.Predicate<Object>{public boolean test(Object v){return false;}}'
    data['com/android/launcher3/C2.java'] = 'package com.android.launcher3;public class C2 implements Runnable {public void run(){}}'
    data['android/app/Application.java'] = '''package android.app;public class Application extends android.content.Context {
        public Runnable callback;public void onCreate(){if(callback!=null)callback.run();}}'''
    data['android/app/ActivityThread.java'] = '''package android.app;public class ActivityThread {
        public static Application current;public static Application currentApplication(){return current;}}'''
    data['android/app/Instrumentation.java'] = '''package android.app;public class Instrumentation {
        public void callApplicationOnCreate(Application app){app.onCreate();}}'''
    data['ls/augment/com/hook/TestDockNx789j.java'] = r'''package ls.augment.com.hook;
import android.content.Context;import android.app.*;import android.view.*;import com.android.launcher3.*;
import com.android.launcher3.model.data.y;import java.lang.reflect.*;import ls.augment.com.LauncherOptions;
public class TestDockNx789j {
    static int checks;static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    static void reset()throws Exception {for(String name:new String[]{"installed","installObserverRegistered"}){
        Field f=LauncherDockCapacityHook.class.getDeclaredField(name);f.setAccessible(true);f.setBoolean(null,false);}
        FeatureSettings.values.clear();FeatureSettings.reports.clear();}
    static String report(){return FeatureSettings.reports.get(LauncherDockCapacityHook.DIAGNOSTIC);}
    public static void main(String[] args)throws Throwable {
        Application app=new Application();ActivityThread.current=app;Context context=app;
        AugmentModule m=new AugmentModule();LauncherDockCapacityHook.install(m,TestDockNx789j.class.getClassLoader());
        check(m.errors.isEmpty(),"full July ROM installs despite F1/C2 decoy classes");
        check(report().contains("adapter=android16_h1_c1")&&report().contains("state=registered")&&report().contains("enabled=false"),
              "disabled feature still reports exact registered adapter before capacity callback");
        check(report().contains("executionConfirmed=false"),"registration is not declared execution");
        E2 launcher=new E2(context);Class<?> utils=Class.forName("r1.f"),animType=Class.forName("r1.a");
        Method bind=utils.getDeclaredMethod("A",Hotseat.class,int.class),cap=utils.getDeclaredMethod("g",Context.class);
        Object animation=animType.getConstructor(E2.class).newInstance(launcher);
        Method enter=animType.getDeclaredMethod("c",CellLayout.class,View.class,boolean.class),reset=animType.getDeclaredMethod("i",boolean.class);
        Field observed=animType.getField("observedCapacity");
        for(int n:new int[]{4,5,6,7,8,17,27}) {
            launcher.dock.content.children.clear();for(int i=0;i<n;i++)launcher.dock.content.addView(new View(context));
            m.call(null,bind,launcher.dock,n);FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);
            check((Integer)m.call(null,cap,context)==n,"stable count uses actual native content "+n);
            m.call(animation,enter,launcher.dock,null,false);check(observed.getInt(animation)==n+1,"drag accepts next slot "+n);
            check(launcher.dock.measuredCapacity==n,"nested measure excludes speculative slot "+n);
            FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,false);m.call(animation,enter,launcher.dock,null,false);
            check(observed.getInt(animation)==n,"disable preserves extras and stops expansion "+n);
            m.call(animation,reset,false);check(observed.getInt(animation)==n,"native reset preserves extra count "+n);
        }
        FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);animType.getField("fail").setBoolean(animation,true);
        boolean threw=false;try{m.call(animation,enter,launcher.dock,null,false);}catch(IllegalStateException expected){threw=true;}
        check(threw&&(Integer)m.call(null,cap,context)==27,"native drag exception propagates and restores expansion scope");
        H1 idp=new H1();Class<?> cursorType=Class.forName("C1.y1");
        Method placement=cursorType.getDeclaredMethod("e",y.class,boolean.class);
        Object cursor=cursorType.getConstructor(H1.class).newInstance(idp);FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,false);
        for(int rank:new int[]{0,1,5,6,7,26}){y item=new y();item.screenId=rank;
            check((Boolean)m.call(cursor,placement,item,false),"reload retains stored extra rank "+rank);
            check(idp.i1==4,"temporary native model bound restored "+rank);}
        y duplicate=new y();duplicate.screenId=6;check(!(Boolean)m.call(cursor,placement,duplicate,false),"native overlap check survives growth");
        cursorType.getField("fail").setBoolean(cursor,true);y extra=new y();extra.screenId=40;threw=false;
        try{m.call(cursor,placement,extra,false);}catch(IllegalStateException expected){threw=true;}
        check(threw&&idp.i1==4,"loader exception restores H1 capacity");
        TestWidgetDock.geometry(m,launcher,bind,context);
        TestWidgetDock.sparseLoader(m,context,idp,cursorType,placement,bind,launcher);
        TestWidgetDock.migration(m,context);
        check(m.errors.size()==1&&"read failed".equals(m.errors.get(0).getMessage()),
              "only deliberately injected migration read failure is diagnosed");
        diagnostics(app,cap);
        System.out.println("Dock H1/C1 runtime: "+(checks+TestWidgetDock.checks)+" assertions passed");
    }
    static void diagnostics(Application app,Method capacity)throws Throwable {
        Method created=Instrumentation.class.getDeclaredMethod("callApplicationOnCreate",Application.class);
        for(boolean capacityDuringCreate:new boolean[]{false,true}){
            reset();ActivityThread.current=null;AugmentModule module=new AugmentModule();
            LauncherDockCapacityHook.install(module,TestDockNx789j.class.getClassLoader());
            check(report()==null&&module.errors.isEmpty(),"registration waits for same-process Context");
            FeatureSettings.change(LauncherOptions.DOCK_UNLIMITED,true);
            app.callback=capacityDuringCreate?()->{try{module.call(null,capacity,app);}catch(Throwable t){throw new RuntimeException(t);}}:null;
            module.call(new Instrumentation(),created,app);
            check(report().contains("adapter=android16_h1_c1"),"application lifecycle publishes adapter");
            check(report().contains(capacityDuringCreate?"executionConfirmed=true":"executionConfirmed=false"),
                  "lifecycle cannot replace observed execution with registration-only state");
        }
        for(String hidden:new String[]{"C1.y1","C1.i1$a"}){
            reset();ActivityThread.current=null;AugmentModule rejected=new AugmentModule();
            ClassLoader missing=new ClassLoader(TestDockNx789j.class.getClassLoader()){
                protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{
                    if(name.equals(hidden))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
            LauncherDockCapacityHook.install(rejected,missing);
            check(rejected.hooks.size()==1&&rejected.hooks.containsKey(created),"incomplete contract registers only read-only diagnostic lifecycle");
            app.callback=null;rejected.call(new Instrumentation(),created,app);
            check(report().contains("supported=false")&&report().contains("state=unsupported")&&report().contains("enabled=false"),
                  "unsupported is visible with switch off");
            check(report().contains(hidden)&&report().contains(hidden.equals("C1.y1")?"saved_items_loader":"native_database_migration"),
                  "diagnostic identifies missing interface and exact persistence stage");
            check(!report().contains("hooks_registered"),"incomplete targets never claim registration success");
        }
    }
}'''
    return data


def main():
    with tempfile.TemporaryDirectory(prefix='dock-nx789j-') as directory:
        temp = Path(directory)
        for name, content in sources().items():
            target = temp/name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(content, encoding='utf-8')
        production = [BASE.JAVA/'hook/LauncherDockCapacityHook.java', BASE.JAVA/'hook/LauncherWidgetResizeHook.java']
        subprocess.run(['javac','-encoding','UTF-8','-d',str(temp),*map(str,temp.rglob('*.java')),*map(str,production)],check=True)
        subprocess.run(['java','-cp',str(temp),'ls.augment.com.hook.TestDockNx789j'],check=True)


if __name__ == '__main__':
    main()
