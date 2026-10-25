"""Run the complete production HOME hook suite against the observed six-argument API."""
from pathlib import Path
import runpy
import tempfile

base=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-home-hook.py')))
sources=dict(base['SOURCES'])
root='com/android/server/wm/RootWindowContainer.java'
sources[root]=sources[root].replace('boolean allow,boolean key){originalHomeCalls++', 'boolean allow,boolean key,boolean onTop){originalHomeCalls++')
assert 'boolean onTop' in sources[root]
test=base['TEST'].replace('TaskDisplayArea.class,boolean.class,boolean.class},CAN=', 'TaskDisplayArea.class,boolean.class,boolean.class,boolean.class},CAN=')
test=test.replace('new TaskDisplayArea(d),false,true);', 'new TaskDisplayArea(d),false,true,true);')
test=test.replace('new TaskDisplayArea(f.root.primary),false,false);', 'new TaskDisplayArea(f.root.primary),false,false,true);')
extra=r'''
  test("false deoptimization receipt rejects HOME before any callback",()->{
   Fixture f=new Fixture();Field installed=AtomicWorkbenchHomeHook.class.getDeclaredField("installed");installed.setAccessible(true);installed.set(null,false);
   AugmentModule denied=new AugmentModule();denied.denyDeopt=true;
   check(AtomicWorkbenchHomeHook.install(denied,TestNativeHomeHook.class.getClassLoader())==0&&denied.callbacks.isEmpty(),"false receipt published partial HOME bridge");
  });
  test("modern background HOME must not steal focus or return physical HOME",()->{
   Fixture f=new Fixture();f.borrow();int fronts=f.root.task.fronts;
   Object result=f.module.invoke(f.root,"startHomeOnTaskDisplayArea",HOME,0,"background repair",f.root.display.area,false,false,false);
   check(Boolean.TRUE.equals(result)&&f.root.task.fronts==fronts&&f.root.originalHomeCalls==0,"onTop=false moved HOME to front or created secondary HOME");
   f.module.invoke(f.root,"startHomeOnTaskDisplayArea",HOME,0,"physical background",f.root.primary.area,false,true,false);
   check(f.root.task.display==88&&f.root.originalHomeCalls==1,"background request stole lease or suppressed native default-display path");
  });
  test("complete HOME capability contracts reject malformed shapes",()->{
   Class<?> access=Class.forName("ls.augment.com.hook.AtomicWorkbenchHomeHook$HomeStartAccess");
   Constructor<?> ctor=access.getDeclaredConstructor(Class.class,Class.class);ctor.setAccessible(true);
   Object old=ctor.newInstance(LegacyHome.class,TaskDisplayArea.class),modern=ctor.newInstance(ChildHome.class,TaskDisplayArea.class);
   Field placement=access.getDeclaredField("hasPlacement");placement.setAccessible(true);
   check(!placement.getBoolean(old)&&placement.getBoolean(modern),"signature adapter lost old or inherited modern path");
   for(Class<?> bad:new Class<?>[]{Object.class,WrongHome.class,StaticHome.class}){
    try{ctor.newInstance(bad,TaskDisplayArea.class);throw new AssertionError("accepted unsupported HOME shape");}
    catch(InvocationTargetException e){check(e.getCause() instanceof NoSuchMethodException,"unexpected capability rejection");}
   }
  });
'''
test=test.replace('  System.out.println("NATIVE HOME HOOK RESULT', extra+'  System.out.println("NATIVE HOME HOOK RESULT')
shapes=r'''
 static class LegacyHome {boolean startHomeOnTaskDisplayArea(int u,String r,TaskDisplayArea a,boolean i,boolean k){return true;}}
 static class ModernHome {boolean startHomeOnTaskDisplayArea(int u,String r,TaskDisplayArea a,boolean i,boolean k,boolean top){return true;}}
 static class ChildHome extends ModernHome {}
 static class WrongHome {int startHomeOnTaskDisplayArea(int u,String r,TaskDisplayArea a,boolean i,boolean k){return 1;}}
 static class StaticHome extends LegacyHome {static boolean startHomeOnTaskDisplayArea(int u,String r,TaskDisplayArea a,boolean i,boolean k,boolean top){return true;}}
'''
test=test.rsplit('}',1)[0]+shapes+'\n}'
sources['ls/augment/com/hook/TestNativeHomeHook.java']=test
with tempfile.TemporaryDirectory(prefix='duo-modern-home-') as folder:
    base['SUPPORT']['compile_run'](Path(folder), sources, ['hook/AtomicWorkbenchHomeHook.java'], 'ls.augment.com.hook.TestNativeHomeHook')
