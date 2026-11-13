"""Exercise production old/new capture protection controls, inheritance and missing interfaces."""
from pathlib import Path
import os, subprocess, tempfile
root=Path(__file__).resolve().parents[1]
sources={
'android/window/ScreenCapture.java':'''package android.window;public class ScreenCapture {public static class ScreenCaptureParams {
public static final int SECURE_CONTENT_POLICY_REDACT=4,PROTECTED_CONTENT_POLICY_REDACT=7;
}}''',
'ls/augment/com/step/CaptureCases.java':'''package ls.augment.com.step;
public class CaptureCases {
 static int checks;static void check(boolean ok){checks++;if(!ok)throw new AssertionError("capture safety "+checks);}
 public static class Old {boolean s=true,p=true;public Old setCaptureSecureLayers(boolean v){s=v;return this;}public Old setAllowProtected(boolean v){p=v;return this;}}
 public static class Child extends Old {}
 public static class New {int s=-1,p=-1;public New setSecureContentPolicy(int v){s=v;return this;}public New setProtectedContentPolicy(int v){p=v;return this;}}
 public static class ChildNew extends New {}
 public static class Missing {public void setSecureContentPolicy(int v){throw new AssertionError("must probe both controls before mutation");}}
 public static class Wrong {public void setSecureContentPolicy(boolean v){}public void setProtectedContentPolicy(int v){}}
 public static class InvalidConstants {public static int SECURE_CONTENT_POLICY_REDACT=0;}
 public static void main(String[]args)throws Exception {
  ClassLoader cl=CaptureCases.class.getClassLoader();
  for(Old old:new Old[]{new Old(),new Child()}){check(CaptureSafety.configure(old,cl).equals("boolean_redact"));check(!old.s&&!old.p);}
  for(New next:new New[]{new New(),new ChildNew()}){check(CaptureSafety.configure(next,cl).equals("enum_redact"));check(next.s==4&&next.p==7);}
  for(Object missing:new Object[]{new Missing(),new Wrong(),new Object()}){try{CaptureSafety.configure(missing,cl);throw new AssertionError("unknown path accepted");}catch(NoSuchMethodException expected){checks++;}}
  try{CaptureSafety.constant(InvalidConstants.class,"SECURE_CONTENT_POLICY_REDACT");throw new AssertionError("mutable constant accepted");}catch(NoSuchFieldException expected){checks++;}
  ClassLoader absent=new ClassLoader(cl){@Override protected Class<?> loadClass(String name,boolean resolve)throws ClassNotFoundException{
   if(name.equals("android.window.ScreenCapture$ScreenCaptureParams"))throw new ClassNotFoundException(name);return super.loadClass(name,resolve);}};
  New b=new New();try{CaptureSafety.configure(b,absent);throw new AssertionError("missing policy accepted");}catch(ClassNotFoundException expected){check(b.s==-1&&b.p==-1);}
  System.out.println("PASS "+checks+" capture capability checks: old/new policies, inherited APIs, runtime constants and rejected incomplete interfaces");
 }
}'''}
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-capture-') as tmp:
 p=Path(tmp)
 for name,code in sources.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(code,encoding='utf-8')
 code=root/'android/app/src/main/java/ls/augment/com/step'
 subprocess.run([java/'javac','-encoding','UTF-8','-d',p,*p.rglob('*.java'),code/'CaptureSafety.java',code/'OwnershipBridge.java'],check=True)
 subprocess.run([java/'java','-cp',p,'ls.augment.com.step.CaptureCases'],check=True)
