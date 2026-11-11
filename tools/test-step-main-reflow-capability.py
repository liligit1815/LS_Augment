"""Run the production method probe against new, old, inherited and missing shapes."""
from pathlib import Path
import os,subprocess,tempfile
root=Path(__file__).resolve().parents[1]
step=root/'android/app/src/main/java/ls/augment/com/step'
def method(file,signature):
    s=(step/file).read_text(encoding='utf-8');start=s.index(signature);end=s.index('{',start)+1;depth=1
    while depth:
        depth+=(s[end]=='{')-(s[end]=='}');end+=1
    return s[start:end]
s=(step/'WorkspaceMainBounds.java').read_text(encoding='utf-8')
a=s.index('            try{ensure=');b=s.index('            Method activityResolve',a)
probe=s[a:b].replace('LocalLandscape.exact','exact')
code=r'''
import java.lang.reflect.*;
public class MainCapability {
 static Method ensure;static int checks;
 LOOKUP
 EXACT
 static void probe(Class<?> activity)throws Exception{PROBE}
 INVOKE
 static void check(boolean ok){checks++;if(!ok)throw new AssertionError();}
 public static class Current {int calls;boolean ensureActivityConfiguration(){calls++;return true;}}
 public static class Child extends Current {}
 public static class Old {int changes=-1;boolean preserve=true;boolean ensureActivityConfiguration(int changes,boolean preserve){this.changes=changes;this.preserve=preserve;return true;}}
 public static class OldChild extends Old {}
 public static class Missing {}
 public static class WrongReturn {void ensureActivityConfiguration(){}}
 public static class WrongParameters {boolean ensureActivityConfiguration(boolean force){return true;}}
 public static class StaticOnly {static boolean ensureActivityConfiguration(){return true;}}
 public static void main(String[] args)throws Exception{
  for(Class<?> c:new Class<?>[]{Current.class,Child.class}){probe(c);Current value=(Current)c.getDeclaredConstructor().newInstance();ensure(value);check(value.calls==1);check(ensure.getParameterCount()==0);}
  for(Class<?> c:new Class<?>[]{Old.class,OldChild.class}){probe(c);Old value=(Old)c.getDeclaredConstructor().newInstance();ensure(value);check(value.changes==0 && !value.preserve);check(ensure.getParameterCount()==2);}
  for(Class<?> c:new Class<?>[]{Missing.class,WrongReturn.class,WrongParameters.class,StaticOnly.class}){
   try{probe(c);throw new AssertionError("Unknown interface accepted");}catch(NoSuchMethodException expected){checks++;}
  }
  System.out.println("PASS "+checks+" native reflow capability shape checks");
 }
}
'''.replace('LOOKUP',method('OwnershipBridge.java','public static Method method(')).replace('EXACT',method('LocalLandscape.java','static Method exact(').replace('OwnershipBridge.method','method')).replace('PROBE',probe).replace('INVOKE',method('WorkspaceMainBounds.java','    static void ensure('))
java=Path(os.environ.get('JAVA_HOME','C:/Program Files/Android/openjdk/jdk-21.0.8'))/'bin'
with tempfile.TemporaryDirectory(prefix='step-main-capability-') as directory:
    p=Path(directory);source=p/'MainCapability.java';source.write_text(code,encoding='utf-8')
    subprocess.run([java/'javac','-encoding','UTF-8','-d',p,source],check=True)
    subprocess.run([java/'java','-cp',p,'MainCapability'],check=True)
