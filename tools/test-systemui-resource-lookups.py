"""Invalid view IDs must not reach Android's logging resource resolver during hot walks."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
HOOK = ROOT / 'android/app/src/main/java/ls/augment/com/hook'
targets = [
    ('StatusBarGridHook', 'name'), ('RedMagicLegacyUiHook', 'id'),
    ('RedMagicSystemUiHook', 'resourceName'), ('StatusBarHeaderSpacingHook', 'name'),
    ('WifiStandardHook', 'resourceName'), ('ControlCenterGridHook', 'id'),
    ('StatusBarAssetsHook', 'name'),
]
methods = []
for index, (file, method) in enumerate(targets):
    source = (HOOK / (file + '.java')).read_text(encoding='utf-8')
    start = source.index('private static String ' + method + '(')
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    methods.append(source[start:end].replace(method + '(', 'name' + str(index) + '(', 1))
harness = '''import java.lang.reflect.*;
public class TestResourceLookups {
 static class Resources {int calls;String getResourceEntryName(int id){calls++;if(id==0x7f000001||id==0x80000003)return "clock";throw new IllegalArgumentException("Invalid resource ID");}}
 static class View {static final int NO_ID=-1;final Resources resources=new Resources();int id;int getId(){return id;}Resources getResources(){return resources;}}
 METHODS
 public static void main(String[] args)throws Exception{int checks=0;
  for(int n=0;n<COUNT;n++){Method m=TestResourceLookups.class.getDeclaredMethod("name"+n,View.class);View v=new View();
   for(int id:new int[]{-1,0}){v.id=id;for(int i=0;i<5000;i++)if(!"".equals(m.invoke(null,v)))throw new AssertionError("id-less view matched a resource");}
   if(v.resources.calls!=0)throw new AssertionError("hot walk must not produce NO_ID log traffic");checks++;
   for(int id:new int[]{0x7f000001,0x80000003}){v.id=id;if(!"clock".equals(m.invoke(null,v)))throw new AssertionError("valid resource including signed package ID lost");checks++;}
   v.id=0x7f000002;if(!"".equals(m.invoke(null,v))||v.resources.calls!=3)throw new AssertionError("unknown valid ID must preserve native lookup and fallback");checks++;
  }System.out.println("PASS resource lookups: "+checks+" assertions, 70000 id-less visits without resource queries");
 }
}'''.replace('METHODS', '\n'.join(methods)).replace('COUNT', str(len(methods)))
java = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8')) / 'bin'
with tempfile.TemporaryDirectory(prefix='duo-resource-lookups-') as folder:
    path = Path(folder) / 'TestResourceLookups.java'
    path.write_text(harness, encoding='utf-8')
    subprocess.run([str(java / 'javac'), '-encoding', 'UTF-8', '-d', folder, str(path)], check=True)
    subprocess.run([str(java / 'java'), '-cp', folder, 'TestResourceLookups'], check=True)
