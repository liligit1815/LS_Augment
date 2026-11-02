"""Exercise the real WMS capability adapter and root Binder acquisition boundary."""
from pathlib import Path
import os, subprocess, tempfile

ROOT=Path(__file__).resolve().parents[1]
S={
'android/os/IBinder.java':'package android.os;public interface IBinder {}',
'android/os/ServiceManager.java':'package android.os;public class ServiceManager {public static IBinder token=new IBinder(){};public static IBinder getService(String n){if(!n.equals("window"))throw new AssertionError(n);return token;}}',
'android/view/IWindowManager.java':'package android.view;public interface IWindowManager {public static class Stub {public static IWindowManager service=new IWindowManager(){};public static IWindowManager asInterface(android.os.IBinder b){return service;}}}',
'android/view/WindowManagerGlobal.java':'package android.view;public class WindowManagerGlobal {public static Object getWindowManagerService(){throw new AssertionError("root must not initialize ApplicationSharedMemory");}}',
'ls/augment/com/TestSystemDecorations.java':'''package ls.augment.com;
public class TestSystemDecorations {
 static int checks;static void yes(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}interface Action{void run()throws Exception;}static void fails(Action a)throws Exception{boolean failed=false;try{a.run();}catch(Exception expected){failed=true;}yes(failed,"missing/failed capability must fail closed");}
 public static class Old {boolean decor;int writes;public boolean shouldShowSystemDecors(int d){return decor;}public void setShouldShowSystemDecors(int d,boolean b){decor=b;writes++;}}
 public static class Child extends Old {}
 public static class New {boolean decor=true;public boolean shouldShowSystemDecors(int d){return decor;}}
 public static class WrongSetter extends New {public int setShouldShowSystemDecors(int d,boolean b){return 1;}}
 public static class WrongReader {public int shouldShowSystemDecors(int d){return 1;}}
 public static class Throwing extends Old {public void setShouldShowSystemDecors(int d,boolean b){throw new IllegalStateException("denied");}}
 public static void main(String[] args)throws Exception{
 for(Old o:new Old[]{new Old(),new Child()}){yes(!AtomicWorkbenchSystemDecorations.requiresCreationFlag(o),"legacy including inherited setter");AtomicWorkbenchSystemDecorations.enable(o,88);yes(o.decor&&o.writes==1,"old enable");AtomicWorkbenchSystemDecorations.release(o,88);yes(!o.decor&&o.writes==2,"old release");}
 New n=new New();yes(AtomicWorkbenchSystemDecorations.requiresCreationFlag(n),"new creation policy");AtomicWorkbenchSystemDecorations.enable(n,88);AtomicWorkbenchSystemDecorations.release(n,88);yes(n.decor,"immutable policy retained until owned display release");n.decor=false;fails(()->AtomicWorkbenchSystemDecorations.enable(n,88));
 fails(()->AtomicWorkbenchSystemDecorations.requiresCreationFlag(new WrongSetter()));fails(()->AtomicWorkbenchSystemDecorations.requiresCreationFlag(new WrongReader()));fails(()->AtomicWorkbenchSystemDecorations.requiresCreationFlag(new Object()));fails(()->AtomicWorkbenchSystemDecorations.enable(new Throwing(),88));
 yes(AtomicWorkbenchSystemDecorations.windowService()==android.view.IWindowManager.Stub.service,"direct Binder bypasses app-only initialization");android.os.ServiceManager.token=null;fails(()->AtomicWorkbenchSystemDecorations.windowService());android.os.ServiceManager.token=new android.os.IBinder(){};android.view.IWindowManager.Stub.service=null;fails(()->AtomicWorkbenchSystemDecorations.windowService());
 System.out.println("PASS system decorations: "+checks+" checks");
 }}'''
}
with tempfile.TemporaryDirectory(prefix='duo-system-decors-') as temp:
    paths=[]
    for name,code in S.items():
        path=Path(temp)/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(code,encoding='utf8');paths.append(path)
    paths.append(ROOT/'android/app/src/main/java/ls/augment/com/AtomicWorkbenchSystemDecorations.java')
    bin=Path(os.environ['JAVA_HOME'])/'bin'
    subprocess.run([str(bin/'javac.exe'),'-encoding','UTF-8','--release','17','-d',temp,*map(str,paths)],check=True)
    subprocess.run([str(bin/'java.exe'),'-cp',temp,'ls.augment.com.TestSystemDecorations'],check=True)
