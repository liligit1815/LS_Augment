"""Execute the production animation input capability adapter against native API shapes."""
import os,subprocess,tempfile
from pathlib import Path
root=Path(__file__).resolve().parents[1]
sources={
'android/view/SurfaceControl.java':"""package android.view;public class SurfaceControl {public int drop;public static class Transaction {public int calls;public SurfaceControl last;public Transaction setDropInputMode(SurfaceControl s,int v){calls++;last=s;s.drop=v;return this;}}}""",
'android/gui/DropInputMode.java':"""package android.gui;public class DropInputMode {public static final int NONE=0,ALL=1;}""",
'ls/augment/com/OwnershipBridge.java':"""package ls.augment.com.step;import java.lang.reflect.*;class OwnershipBridge {static Method method(Class<?> c,String n,Class<?>... a)throws NoSuchMethodException{for(Class<?> k=c;k!=null;k=k.getSuperclass())try{Method m=k.getDeclaredMethod(n,a);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(n);}}""",
'ls/augment/com/StepMembers.java':"""package ls.augment.com.step;import java.lang.reflect.*;class StepMembers {static Field findField(Class<?> c,String n)throws NoSuchFieldException{for(Class<?> k=c;k!=null;k=k.getSuperclass())try{Field f=k.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(n);}}""",
'ls/augment/com/WorkspaceSurfaceInput.java':(root/'android/app/src/main/java/ls/augment/com/step/WorkspaceSurfaceInput.java').read_text(encoding='utf-8'),
'ls/augment/com/Cases.java':r"""package ls.augment.com.step;import android.view.SurfaceControl;public class Cases {
static int checks;static void check(boolean x,String m){checks++;if(!x)throw new AssertionError(m);}
public static class ChildTx extends SurfaceControl.Transaction {}
public static class WrongResult {public void setDropInputMode(SurfaceControl s,int m){}}
public static class StaticSetter {public static SurfaceControl.Transaction setDropInputMode(SurfaceControl s,int m){return null;}}
public static class WrongArgs {public SurfaceControl.Transaction setDropInputMode(SurfaceControl s,long m){return null;}}
public static class Modes {public static int ALL=9,NONE=3;}public static class ChildModes extends Modes {}
public static class BadModes {public static String ALL="1";public static int NONE=0;}
public static class InstanceModes {public int ALL=1;public static int NONE=0;}
public static class SameModes {public static int ALL=0,NONE=0;}
public static void main(String[] args)throws Exception {
SurfaceControl band=new SurfaceControl(),guard=new SurfaceControl(),task=new SurfaceControl();ChildTx tx=new ChildTx();
WorkspaceSurfaceInput.blockChildren(tx,band);
check(tx.calls==1&&tx.last==band&&band.drop==1,"only owned band gets native drop mode");
check(task.drop==0&&guard.drop==0,"original task and input guard keep their own policy");
check(WorkspaceSurfaceInput.setter(ChildTx.class).getDeclaringClass()==SurfaceControl.Transaction.class,"inherited native setter");
check(WorkspaceSurfaceInput.mode(ChildModes.class)==9,"runtime constants and inherited fields");
for(Class<?> type:new Class<?>[]{WrongResult.class,StaticSetter.class,WrongArgs.class,Object.class}){try{WorkspaceSurfaceInput.setter(type);throw new AssertionError("unsupported setter");}catch(ReflectiveOperationException expected){checks++;}}
for(Class<?> type:new Class<?>[]{BadModes.class,InstanceModes.class,SameModes.class,Object.class}){try{WorkspaceSurfaceInput.mode(type);throw new AssertionError("unsupported modes");}catch(ReflectiveOperationException|IllegalStateException expected){checks++;}}
System.out.println("PASS "+checks+" production surface input checks: scoped mutation, native and inherited API, missing/wrong capabilities and runtime constants");
}}
"""}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-input-drop-') as tmp:
 folder=Path(tmp);files=[]
 for n,s in sources.items():
  p=folder/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
 subprocess.run([java/'javac','-encoding','UTF-8','-d',folder,*files],check=True)
 subprocess.run([java/'java','-cp',folder,'ls.augment.com.step.Cases'],check=True)
