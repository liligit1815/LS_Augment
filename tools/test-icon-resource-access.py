"""Compile the production Icon.Resource resolver against old, new and unknown models."""
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]
JAVA=Path('C:/Program Files/Android/openjdk/jdk-21.0.8/bin')
HARNESS='''package ls.augment.com.hook;
public class IconResourceAccessTest {
 static int checks;
 static void check(Object model,int expected)throws Exception {
  checks++;int actual=IconResourceAccess.resolve(model.getClass()).read(model);
  if(actual!=expected)throw new AssertionError(model.getClass()+": "+actual);
 }
 static class Old { public int getRes(){return 42;} }
 static class New { public Integer getResId(){return 43;} }
 static class Inherited extends New { }
 static class FieldOnly { private final int resId=44; }
 static class OldField { private final int res=45; }
 static class InheritedField extends FieldOnly { }
 static class BridgeBase<T> { public T getResId(){return null;} }
 static class Bridge extends BridgeBase<Integer> { public Integer getResId(){return 46;} }
 static class Wrong { public String getResId(){return "42";} public String res="42"; }
 static class Static { public static int getResId(){return 42;} public static int resId=42; }
 static class BadArgs { public int getResId(int arg){return arg;} }
 static class Negative { public int getRes(){return -1;} }
 static class Null { public Integer getResId(){return null;} }
 static class Throwing { public int getResId(){throw new IllegalStateException("OEM failure");} }
 public static void main(String[] args)throws Exception {
  check(new Old(),42);check(new New(),43);check(new Inherited(),43);
  check(new FieldOnly(),44);check(new OldField(),45);check(new InheritedField(),44);check(new Bridge(),46);
  check(new Wrong(),0);check(new Static(),0);check(new BadArgs(),0);check(new Negative(),0);check(new Null(),0);check(new Object(),0);
  try{check(new Throwing(),0);throw new AssertionError("invocation failure was hidden");}
  catch(java.lang.reflect.InvocationTargetException expected){checks++;}
  System.out.println("PASS Icon.Resource access: "+checks+" assertions");
 }
}'''
with tempfile.TemporaryDirectory(prefix='icon-resource-') as temp:
    test=Path(temp)/'IconResourceAccessTest.java'
    test.write_text(HARNESS,encoding='utf-8')
    source=ROOT/'android/app/src/main/java/ls/augment/com/hook/IconResourceAccess.java'
    subprocess.run([str(JAVA/'javac.exe'),'-encoding','UTF-8','-d',temp,str(source),str(test)],check=True)
    subprocess.run([str(JAVA/'java.exe'),'-cp',temp,'ls.augment.com.hook.IconResourceAccessTest'],check=True)
