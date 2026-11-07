"""Run production compatibility paths against old/new/unknown OEM shapes; no device claims."""
from pathlib import Path
import ast, importlib.util, os, subprocess, tempfile
ROOT=Path(__file__).resolve().parents[1]
JAVA=ROOT/'android/app/src/main/java'
JDK=Path(os.environ['JAVA_HOME'])/'bin'
def prefix(name,marker):
    path=ROOT/'tools'/name; scope={'__file__':str(path),'__name__':'fixture_support'}
    exec(path.read_text(encoding='utf8').split(marker)[0],scope)
    return scope
def run(files,production,main,label):
    with tempfile.TemporaryDirectory(prefix='duo-20729-') as folder:
        root=Path(folder);sources=[]
        for name,content in files.items():
            path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(content,encoding='utf8');sources.append(str(path))
        sources += [str(JAVA/p) for p in production]
        subprocess.run([str(JDK/'javac.exe'),'-encoding','UTF-8','-d',folder,*sources],check=True)
        subprocess.run([str(JDK/'java.exe'),'-cp',folder,main],check=True,timeout=30)
    print('PASS',label,flush=True)

def calls():
    base=prefix('test-native-island-call-cards.py','with tempfile.TemporaryDirectory(')['files']
    key='com/android/incallui/zte/island/IslandCardManager.java'
    for variant in ('direct','inherited-direct','missing-direct','wrong-direct'):
        files=dict(base);src=files[key]
        old='private boolean tryWaitLauncherIslandEnterAnimEndThenShow(Context c,boolean fallback){return true;}'
        direct='public boolean mHasPushedCard;private void showIslandCardForActiveCallInternal(Context c){}private void createSmallIsland(){}private void updateSmallIsland(){}'
        src=src.replace(old,direct if variant!='missing-direct' else '')
        if variant=='inherited-direct':
            src=src.replace(direct,'').replace('public class IslandCardManager {','class DirectBase {'+direct+'}\npublic class IslandCardManager extends DirectBase {')
        if variant=='wrong-direct':src=src.replace('public boolean mHasPushedCard','public String mHasPushedCard')
        files[key]=src
        test=files['ls/augment/com/hook/TestCallCards.java'].replace('hooks.size()==14','hooks.size()==13')
        test='\n'.join(' IslandCardManager owner=IslandCardManager.sInstance;' if 'ordinary host cannot wait forever' in line else line for line in test.splitlines())
        if variant in ('missing-direct','wrong-direct'):
            test='''package ls.augment.com.hook;public class TestCallCards {public static void main(String[]a){AugmentModule m=new AugmentModule();NativeIslandCallCards.install(m,TestCallCards.class.getClassLoader());if(m.errors==0||!AugmentModule.hooks.isEmpty())throw new AssertionError("unknown direct layout must retain native behavior");}}'''
        files['ls/augment/com/hook/TestCallCards.java']=test
        run(files,['ls/augment/com/hook/'+n+'.java' for n in ['NativeIslandCallCards','NativeIslandSceneContract','NativeIslandScenePolicy']], 'ls.augment.com.hook.TestCallCards','call '+variant)

def cycling():
    path=ROOT/'tools/test-native-island-personal-cycling.py';spec=importlib.util.spec_from_file_location('cycle_fixture',path);scope=importlib.util.module_from_spec(spec);spec.loader.exec_module(scope)
    files=dict(scope.files);key='com/zte/toolsdk/common/ToolsCapabilityHandler.java'
    files[key]=files[key].replace('public static ToolsCapabilityHandler getInstance(){return instance;}','')
    files['com/zte/toolsdk/consumer/ToolsCapabilityManager.java']='''package com.zte.toolsdk.consumer;import android.content.Context;import com.zte.toolsdk.common.ToolsCapabilityHandler;
class ManagerBase {protected ToolsCapabilityHandler getToolsCapabilityHandler(){return ToolsCapabilityHandler.instance;}}
public class ToolsCapabilityManager extends ManagerBase {static final ToolsCapabilityManager INSTANCE=new ToolsCapabilityManager();public static ToolsCapabilityManager getInstance(Context c){return INSTANCE;}}'''
    files['ls/augment/com/hook/TestPersonalCycling.java']=files['ls/augment/com/hook/TestPersonalCycling.java'].replace('ToolsCapabilityHandler.getInstance()','ToolsCapabilityHandler.instance')
    scope.base.guide.base.run_fixture(files,'ls.augment.com.hook.TestPersonalCycling')
    print('PASS cycling manager-owned capability including inherited getter',flush=True)

def keyguard():
    base=prefix('test-system-rules-async.py','with tempfile.TemporaryDirectory(')['SOURCES']
    files=dict(base)
    files['com/android/server/policy/keyguard/KeyguardServiceDelegate.java']='''package com.android.server.policy.keyguard;import android.content.*;import com.android.internal.policy.IKeyguardService;
public class KeyguardServiceDelegate {public interface StateCallback{}public static class Connection {public void onServiceDisconnected(ComponentName n){}}
 public static class KeyguardReportedState {public volatile boolean showing=true;}
 public final KeyguardReportedState mKeyguardReportedState=new KeyguardReportedState();public IKeyguardService mKeyguardService;
 public KeyguardServiceDelegate(Context c,StateCallback cb){}public void update(boolean showing,int user){if(user==10)mKeyguardReportedState.showing=showing;}}
'''
    files['ls/augment/com/hook/TestReportedKeyguard.java']='''package ls.augment.com.hook;import java.lang.reflect.*;import android.content.Context;import com.android.server.policy.keyguard.KeyguardServiceDelegate;
public class TestReportedKeyguard {
 static Object state()throws Exception{Method m=SystemRulesHook.class.getDeclaredMethod("keyguardShowing");m.setAccessible(true);return m.invoke(null);}
 public static void main(String[]args)throws Throwable{AugmentModule module=new AugmentModule();ClassLoader loader=new ClassLoader(TestReportedKeyguard.class.getClassLoader()) {public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith("KeyguardStateMonitor"))throw new ClassNotFoundException(n);return super.loadClass(n);}};
 Method install=SystemRulesHook.class.getDeclaredMethod("installKeyguardMemory",AugmentModule.class,ClassLoader.class);install.setAccessible(true);install.invoke(null,module,loader);
 if(module.constructors.size()!=1||state()!=null)throw new AssertionError("new contract preflight");
 Executable constructor=module.constructors.keySet().iterator().next();KeyguardServiceDelegate owner=new Child(new Context(),null);
 module.constructors.get(constructor).intercept(new TestSystemRulesAsync.Call(owner,constructor,new Object[]{new Context(),null},null));
 if(state()!=null)throw new AssertionError("disconnected state must be unknown");owner.mKeyguardService=new com.android.internal.policy.IKeyguardService(){};
 if(!Boolean.TRUE.equals(state()))throw new AssertionError("native locked memory");owner.update(false,11);if(!Boolean.TRUE.equals(state()))throw new AssertionError("foreign user callback");owner.update(false,10);if(!Boolean.FALSE.equals(state()))throw new AssertionError("native unlocked memory");
 owner.mKeyguardService=null;owner.mKeyguardReportedState.showing=true;owner.update(false,10);if(state()!=null)throw new AssertionError("late disconnected callback");
 owner.mKeyguardReportedState.showing=true;owner.mKeyguardService=new com.android.internal.policy.IKeyguardService(){};if(!Boolean.TRUE.equals(state()))throw new AssertionError("reconnection");System.out.println("PASS modern keyguard: initialization, subclass, user filtering, disconnect, late callback and reconnect");}
 static class Child extends KeyguardServiceDelegate {Child(Context c,StateCallback s){super(c,s);}}}
'''
    run(files,[],'ls.augment.com.hook.TestReportedKeyguard','reported keyguard memory')

def battery():
    scope=prefix('test-battery-watermark-runtime.py',"if __name__=='__main__':")
    for bad in (False,True):
        files=dict(scope['FILES']);files.pop('ls/augment/com/hook/TestBatteryWatermark.java')
        for k,s in list(files.items()):
            files[k]=s.replace('@LOW@','PRIORITY_LOW_POWER_MODE_RENDER_RATE').replace('@THERMAL@','boolean').replace('@SET_THERMAL@','isHighTemperature=lastValue==1')
        compact=files['com/android/server/am/ScreenRefreshRateController.java']
        for old,new in [('ScreenRefreshRateController','CompactController'),('isInPowerSaveMode','d'),('isInSuperPowerSaveMode','e'),('isHighTemperature','f'),('mContext','o'),('mHandler','p'),('FLAG_POWER_SAVE','V1'),('updateFpsForPowerSave','D4'),('initController','E1')]:compact=compact.replace(old,new)
        compact=compact.replace('public static final int V1=1000;','public static final int V1=1000,W1=1001,Y1='+('999' if bad else '1003')+';')
        files['com/android/server/am/CompactController.java']=compact
        files.pop('com/android/server/am/ScreenRefreshRateController.java')
        files['com/android/server/am/ScreenRefreshRateService.java']='package com.android.server.am;public class ScreenRefreshRateService {public CompactController getController(){return null;}}'
        files['com/android/server/SystemServiceManager.java']='''package com.android.server;public class SystemServiceManager {public static Class<?> loadClassFromLoader(String name,ClassLoader loader){return (Class<?>)fixture.Dispatch.call(null,SystemServiceManager.class,"loadClassFromLoader",new Class<?>[]{String.class,ClassLoader.class},new Object[]{name,loader},a->Class.forName((String)a[0],false,(ClassLoader)a[1]));}}'''
        files['ls/augment/com/hook/TestVendorLoader.java']='''package ls.augment.com.hook;import com.android.server.am.*;import com.android.server.SystemServiceManager;
public class TestVendorLoader {static void check(boolean b,String m){if(!b)throw new AssertionError(m);}static class Child extends CompactController{}
 public static void main(String[]a){boolean bad=BAD;AugmentModule module=new AugmentModule();ClassLoader boot=new ClassLoader(TestVendorLoader.class.getClassLoader()){public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith("ScreenRefreshRateController")||n.endsWith("ScreenRefreshRateService"))throw new ClassNotFoundException(n);return super.loadClass(n);}};
 BatteryRefreshRateHook.install(module,boot);check(module.errors.isEmpty(),"vendor absence is deferred");
 ClassLoader vendor=new ClassLoader(TestVendorLoader.class.getClassLoader()){public Class<?> loadClass(String n)throws ClassNotFoundException{if(n.endsWith("ScreenRefreshRateController"))throw new ClassNotFoundException(n);return super.loadClass(n);}};
 SystemServiceManager.loadClassFromLoader("com.android.server.am.ScreenRefreshRateService",vendor);int count=module.hooks.size();SystemServiceManager.loadClassFromLoader("com.android.server.am.ScreenRefreshRateService",vendor);check(count==module.hooks.size(),"no duplicate vendor hooks");
 CompactController c=new Child();c.E1();FeatureSettings.change(true);check(c.d==bad,"initial power-save reapply");c.send(1000,1);check(c.d==bad,"normal-save only");c.send(1003,1);check(c.f,"thermal retained");c.send(1001,1);check(c.e,"super-save retained");FeatureSettings.change(false);check(c.d,"restore actual native power-save");c.send(1000,0);FeatureSettings.change(true);FeatureSettings.change(false);check(!c.d,"no stale saved state");check(module.errors.isEmpty()!=bad,"invalid compact constants rejected");System.out.println("PASS delayed vendor loader, compact controller, subclass, toggles and thermal isolation bad="+bad);}}
'''.replace('BAD',str(bad).lower())
        run(files,['ls/augment/com/hook/BatteryRefreshRateHook.java'],'ls.augment.com.hook.TestVendorLoader','vendor late loader')

if __name__=='__main__':
    calls();cycling();keyguard();battery()
