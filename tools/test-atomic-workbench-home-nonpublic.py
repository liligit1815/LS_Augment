"""Run complete HOME lease regression with package-private framework task lookup."""
from pathlib import Path
import runpy
import tempfile

base = runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-home-hook.py')))
sources = dict(base['SOURCES'])
root = 'com/android/server/wm/RootWindowContainer.java'
sources[root] = sources[root].replace('public Task getRootTask(', 'Task getRootTask(')
assert sources[root] != base['SOURCES'][root]
sources[root] = sources[root].replace('Task getRootTask(', 'public Task rootForTest(int id){return getRootTask(id);} Task getRootTask(', 1)
test = base['TEST'].replace('f.root.getRootTask(72)', 'f.root.rootForTest(72)')
extra = r'''
  test("nonpublic inherited invocation and missing shape",()->{
   Method call=AtomicWorkbenchHomeHook.class.getDeclaredMethod("call",Object.class,String.class,Class[].class,Object[].class);call.setAccessible(true);
   Object result=call.invoke(null,new HiddenChild(),"probe",new Class<?>[]{int.class},new Object[]{7});
   check(Integer.valueOf(8).equals(result),"inherited package-private method not called");
   check(Integer.valueOf(9).equals(call.invoke(null,new HiddenChild(),"interfaceProbe",new Class<?>[]{int.class},new Object[]{7})),"existing interface default path lost");
   for(String name:new String[]{"missing","staticProbe"}){
    try{call.invoke(null,new HiddenChild(),name,new Class<?>[]{int.class},new Object[]{7});throw new AssertionError("accepted unsupported shape");}
    catch(InvocationTargetException expected){check(expected.getCause() instanceof NoSuchMethodException,"missing capability must be specific");}
   }
  });
'''
test = test.replace('  System.out.println("NATIVE HOME HOOK RESULT', extra+'  System.out.println("NATIVE HOME HOOK RESULT')
test = test.rsplit('}', 1)[0]+'''
 static class HiddenBase {int probe(int value){return value+1;}static int staticProbe(int value){return value;}}
 interface DefaultProbe {default int interfaceProbe(int value){return value+2;}}
 static class HiddenChild extends HiddenBase implements DefaultProbe {}
}
'''
sources['ls/augment/com/hook/TestNativeHomeHook.java'] = test
with tempfile.TemporaryDirectory(prefix='duo-home-nonpublic-') as folder:
    base['SUPPORT']['compile_run'](Path(folder), sources, ['hook/AtomicWorkbenchHomeHook.java'], 'ls.augment.com.hook.TestNativeHomeHook')
