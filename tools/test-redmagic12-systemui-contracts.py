"""Execute production reflection adapters against old/new/subclass/unknown OEM contracts."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / 'android/app/src/main/java/ls/augment/com/hook'


def extract(source, marker):
    start = source.index(marker)
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]


grid = (HOOK / 'StatusBarGridHook.java').read_text(encoding='utf-8')
adapters = '\n'.join([
    extract(grid, 'private static final class NotificationCapacity'),
    extract(grid, 'private static Method find('),
])
harness = r'''
package ls.augment.com.hook;
import java.lang.reflect.*;
public class TestContracts {
 // ADAPTERS
 static int checks;
 static void check(boolean ok,String message){checks++;if(!ok)throw new AssertionError(message);}
 interface Checked {void run()throws Exception;}
 static void rejected(Checked work,String message)throws Exception{
  try{work.run();throw new AssertionError(message);}catch(ReflectiveOperationException expected){checks++;}
 }
 static class LegacyIcons {private int mMaxIcons=3,mActualLayoutWidth=120,mSpeedBumpIndex=2;void calculateIconXTranslations(){}}
 static class LegacyChild extends LegacyIcons {}
 static class ModernIcons {private int mMaxIcons=4,mActualLayoutWidth=150;void calculateIconXTranslations(){}boolean shouldForceOverflow(int n,float amount,int max){return n>=max&&amount>0;}}
 static class ModernChild extends ModernIcons {}
 static class MissingOverflow {int mMaxIcons=4,mActualLayoutWidth=120;void calculateIconXTranslations(){}}
 static class WrongField extends ModernIcons {String mSpeedBumpIndex="unknown";}
 static class WrongResult {int mMaxIcons,mActualLayoutWidth;void calculateIconXTranslations(){}int shouldForceOverflow(int n,float f,int max){return 1;}}
 static void icons(Object target)throws Exception{
  NotificationCapacity a=new NotificationCapacity(target.getClass());int[] before=a.snapshot(target);
  try{a.apply(target,12,500);int[] now=a.snapshot(target);check(now[0]==12&&now[1]==500,"expanded count and width reach native algorithm");
   if(a.speedBump!=null)check(now[2]==-1,"legacy speed bump temporarily cleared");
   throw new IllegalStateException("native calculation failed");
  }catch(IllegalStateException expected){}finally{a.restore(target,before);}
  check(java.util.Arrays.equals(before,a.snapshot(target)),"native fields restored even on failure");
 }
 public static void main(String[] args)throws Exception{
  icons(new LegacyIcons());icons(new LegacyChild());icons(new ModernIcons());icons(new ModernChild());
  rejected(()->new NotificationCapacity(MissingOverflow.class),"unknown overflow must not install");
  rejected(()->new NotificationCapacity(WrongField.class),"wrong field type must not be ignored");
  rejected(()->new NotificationCapacity(WrongResult.class),"wrong method return type must not install");
  System.out.println("PASS SystemUI compatibility contracts: "+checks+" assertions");
 }
}
'''.replace('// ADAPTERS', adapters)

files = {'ls/augment/com/hook/TestContracts.java': harness}
java = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='duo-systemui-contracts-') as folder:
    paths = []
    for name, source in files.items():
        path = Path(folder) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source, encoding='utf-8')
        paths.append(str(path))
    subprocess.run([str(java / 'javac'), '-encoding', 'UTF-8', '-d', folder, *paths], check=True)
    subprocess.run([str(java / 'java'), '-cp', folder, 'ls.augment.com.hook.TestContracts'], check=True)
