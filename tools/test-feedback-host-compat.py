"""Compile the production Step controller/display adapters and SystemUI request guard against host variants."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java'
FILES = {
    'android/view/View': 'public class View {}',
    'android/view/ViewGroup': 'public class ViewGroup extends View {}',
    'com/zte/controlcenter/widget/CCHeaderView': 'public class CCHeaderView extends android.view.ViewGroup {}',
    'com/android/systemui/statusbar/pipeline/mobile/ui/view/ModernStatusBarMobileView':
        'public class ModernStatusBarMobileView extends android.view.ViewGroup {}',
    'android/os/Bundle': '''public class Bundle {public String type="1";public String getString(String k){return type;}}''',
    'android/view/SurfaceControl': 'public class SurfaceControl {}',
    'android/window/WindowContainerToken': 'public class WindowContainerToken {}',
    'com/android/wm/shell/ShellTaskOrganizer': 'public class ShellTaskOrganizer {}',
    'com/android/wm/shell/taskview/TaskViewTaskController': '''public class TaskViewTaskController {
        private com.android.wm.shell.ShellTaskOrganizer mTaskOrganizer;
        private boolean mSurfaceCreated;private android.view.SurfaceControl mSurfaceControl;
        private android.window.WindowContainerToken mTaskToken;
    }''',
    'android/util/DisplayMetrics': 'public class DisplayMetrics {public int widthPixels,heightPixels,densityDpi;}',
    'android/view/Display': '''public class Display {public static final int DEFAULT_DISPLAY=0;
        public boolean valid=true;public int width=1216,height=2688,rotation=0,dpi=520;
        public int getRotation(){return rotation;}public boolean isValid(){return valid;}
        public void getRealMetrics(android.util.DisplayMetrics m){m.widthPixels=width;m.heightPixels=height;m.densityDpi=dpi;}
    }''',
    'android/hardware/display/DisplayManager': '''public class DisplayManager {
        public android.view.Display screen=new android.view.Display();public android.view.Display getDisplay(int n){return screen;}
    }''',
    'android/content/res/Configuration': '''public class Configuration {
        public float fontScale=1;public int uiMode=17,direction,keyboard;public String lang="zh-CN";
        public int getLayoutDirection(){return direction;}public Configuration getLocales(){return this;}
        public String toLanguageTags(){return lang;}
    }''',
    'android/content/res/Resources': '''public class Resources {public Configuration config=new Configuration();
        public Configuration getConfiguration(){return config;}}''',
    'android/content/Context': '''public class Context {
        public android.hardware.display.DisplayManager manager=new android.hardware.display.DisplayManager();
        public android.content.res.Resources res=new android.content.res.Resources();
        public android.content.res.Resources getResources(){return res;} public <T>T getSystemService(Class<T> c){return c.cast(manager);}
    }''',
    'ls/augment/com/step/CheckStep': '''import com.android.wm.shell.taskview.TaskViewTaskController;
public class CheckStep {
    static class Legacy {private final TaskViewTaskController mTaskViewTaskController=new TaskViewTaskController();}
    static class New {TaskViewTaskController controller=new TaskViewTaskController();private TaskViewTaskController getController(){return controller;}}
    static class Sub extends Legacy {}
    static class Wrong {static TaskViewTaskController mTaskViewTaskController=new TaskViewTaskController();}
    static class Untyped {Object mTaskViewTaskController=new TaskViewTaskController();}
    static class Empty {TaskViewTaskController mTaskViewTaskController;}
    static Object get(Object h)throws Exception{return TaskViewAccess.controller(h,CheckStep.class.getClassLoader());}
    static void check(boolean ok){if(!ok)throw new AssertionError();}
    public static void main(String[] a)throws Exception {
        Legacy old=new Sub();New modern=new New();
        if(a.length>0){try{get(modern);throw new AssertionError();}catch(NoSuchFieldException expected){}return;}
        check(get(old)==old.mTaskViewTaskController);check(get(modern)==modern.controller);
        for(Object host:new Object[]{new Wrong(),new Untyped(),new Object(),new Empty()}){
            try{get(host);throw new AssertionError();}catch(NoSuchFieldException|IllegalStateException expected){}
        }
        var context=new android.content.Context();var screen=context.manager.screen;var cfg=context.res.config;
        var start=WorkspaceDisplayState.read(context);cfg.keyboard=4;check(start.equals(WorkspaceDisplayState.read(context)));
        screen.rotation=2;check(!start.equals(WorkspaceDisplayState.read(context)));screen.rotation=0;
        screen.height-=100;check(!start.equals(WorkspaceDisplayState.read(context)));screen.height+=100;
        cfg.fontScale=1.25f;check(!start.equals(WorkspaceDisplayState.read(context)));cfg.fontScale=1;
        cfg.uiMode++;check(!start.equals(WorkspaceDisplayState.read(context)));cfg.uiMode--;
        cfg.lang="en-US";check(!start.equals(WorkspaceDisplayState.read(context)));cfg.lang="zh-CN";
        screen.valid=false;check(WorkspaceDisplayState.read(context)==null);screen.valid=true;
        screen.dpi=0;check(WorkspaceDisplayState.read(context)==null);
        System.out.println("PASS legacy/inherited and modern Step, missing/incorrect controller, display and accessory inputs");
    }
}''',
    'com/zte/feature/dynamicisland/DynamicPermanentIsland': 'public class DynamicPermanentIsland {}',
    'com/zte/feature/dynamicisland/PermanentIslandManager': '''import android.os.Bundle;
public class PermanentIslandManager {
    public DynamicPermanentIsland mAppIsland;public boolean crash=true,unrelated;public int calls;
    public void lambda$handleAppIslandMethod$22(String op,Bundle b){calls++;
        if(crash)throw new NullPointerException(unrelated?"different method":
            "Attempt to invoke virtual method 'void com.zte.feature.dynamicisland.DynamicPermanentIsland.initAppIsland(...)' on a null object reference");}
    public void lambda$handleAppIslandMethod$25(String op,Bundle b){}
    public void lambda$handleAppIslandMethod$26(String op,Object b){}
}''',
    'ls/augment/com/hook/FeatureRuntimeLog': '''class FeatureRuntimeLog {
        static int skipped;static void event(String s,String d){skipped++;}
    }''',
    'ls/augment/com/hook/AugmentModule': '''import java.lang.reflect.*;import java.util.*;
class AugmentModule {
    interface Handler{Object run(Chain c)throws Throwable;}
    record Chain(Method m,Object receiver,Object[] args) {
        Object getArg(int n){return args[n];}Object getThisObject(){return receiver;}
        Object proceed()throws Throwable {try{return m.invoke(receiver,args);}catch(InvocationTargetException e){throw e.getCause();}}
    }
    Map<Method,Handler> hooks=new HashMap<>();
    class Builder {Method m; Builder(Method m){this.m=m;}Handler intercept(Handler h){hooks.put(m,h);return h;}}
    Builder prepareFeatureHook(Method m,String id,boolean first){return new Builder(m);}
    void registerFeatureHook(Handler h){}void logFeatureInfo(String s){}
}''',
    'ls/augment/com/hook/CheckIsland': '''import com.zte.feature.dynamicisland.*;import android.os.Bundle;
public class CheckIsland {
    public static void main(String[] a)throws Throwable {
        var module=new AugmentModule();var manager=new PermanentIslandManager();var args=new Bundle();
        int installed=AppIslandRequestGuard.install(module,CheckIsland.class.getClassLoader());
        if(a.length>0){if(installed!=0)throw new AssertionError();return;}
        if(installed!=2)throw new AssertionError("wrong worker count");
        var m=manager.getClass().getMethod("lambda$handleAppIslandMethod$22",String.class,Bundle.class);
        for(int i=0;i<6;i++){
            String op=i==3?"setState":"showIsland";args.type=i==4?"2":"1";
            manager.mAppIsland=i==2?new DynamicPermanentIsland():null;manager.crash=i!=1;manager.unrelated=i==5;
            try{module.hooks.get(m).run(new AugmentModule.Chain(m,manager,new Object[]{op,args}));if(i>=2)throw new AssertionError("swallowed "+i);}
            catch(NullPointerException e){if(i<2)throw e;}
        }
        if(manager.calls!=6||FeatureRuntimeLog.skipped!=1)throw new AssertionError("request count");
        System.out.println("PASS exact legacy show crash, unaffected new/success paths, unrelated failures and alternate suffix");
    }
}''',
}
with tempfile.TemporaryDirectory(prefix='duo-feedback-') as name:
    out = Path(name)
    generated = []
    for path, body in FILES.items():
        file = out / (path + '.java')
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text('package ' + path.rsplit('/', 1)[0].replace('/', '.') + ';\n' + body, 'utf-8')
        generated.append(file)
    ui=(SRC/'ls/augment/com/hook/RedMagicSystemUiHook.java').read_text('utf-8')
    adapters=ui[ui.index('private static final ClassValue<Boolean> BAR_ROOT'):ui.index('private static void scan(')]
    signal=out/'SignalHosts.java'
    signal.write_text('import android.view.*;public class SignalHosts {'+adapters+'''
        static class Variant extends com.zte.controlcenter.widget.CCHeaderView {}
        static class Mobile extends com.android.systemui.statusbar.pipeline.mobile.ui.view.ModernStatusBarMobileView {}
        static class CCHeaderView extends ViewGroup {}
        public static void main(String[] args){
            if(!BAR_ROOT.get(Variant.class)||BAR_ROOT.get(CCHeaderView.class)||BAR_ROOT.get(Mobile.class)
                    ||!MOBILE_VIEW.get(Mobile.class)||MOBILE_VIEW.get(Variant.class))throw new AssertionError();
            System.out.println("PASS OEM header and mobile subclasses, unrelated containers keep native behavior");
        }
    }''','utf-8')
    generated.append(signal)
    guard=(SRC/'ls/augment/com/step/NativeWorkspaceGuard.java').read_text('utf-8')
    redraw=guard[guard.index('static void refreshExitPresentation('):guard.index('static void normalizeExit(')]
    exit_test=out/'ExitPresentation.java'
    exit_test.write_text('import java.lang.reflect.*;public class ExitPresentation {'+redraw+'''
        static boolean active,ending;static String session="current",lastLog;static int principal;
        static boolean interactive(Object context){return true;}static void diagnostic(String stage,String d){lastLog=d;}
        static class WorkspaceUsers {static int current;static int foreground(){return current;}}
        static class Wm {static Object lock=new Object(),context=new Object(),service=new Service(),display=new Display();static boolean active;}
        static class Display {Task focus=new Task();public Task getFocusedRootTask(){return focus;}}
        static class Task {public int mTaskId=7;public boolean isVisible=true;Activity activity=new Activity();
            public int getWindowingMode(){return 1;}public Object getDisplayContent(){return Wm.display;}
            public Activity topRunningActivity(){return activity;}public Task getTaskInfo(){return this;}}
        static class Activity {Window win=new Window();public Window findMainWindow(){return win;}public boolean isReportedDrawn(){return true;}}
        static class Window {boolean drawn=true;public boolean isDrawn(){return drawn;}}
        static class Root {int reconciles;public void ensureActivitiesVisible(){reconciles++;}}
        static class Service {public Root mRoot=new Root();int requests;public void requestTraversal(){requests++;}}
        static class LocalLandscape {static Method exact(Class<?> t,String n,Class<?> ret)throws ReflectiveOperationException{
            Method m=t.getMethod(n);if(m.getReturnType()!=ret)throw new NoSuchMethodException();return m;}}
        static Object call(Object target,String name)throws ReflectiveOperationException{return target.getClass().getMethod(name).invoke(target);}
        static Object field(Object target,String name)throws ReflectiveOperationException{return target.getClass().getField(name).get(target);}
        static void check(boolean v){if(!v)throw new AssertionError();}
        public static void main(String[] args){
            Display d=(Display)Wm.display;Service wm=(Service)Wm.service;
            refreshExitPresentation(d,session);check(wm.requests==0);
            d.focus.activity.win.drawn=false;refreshExitPresentation(d,"previous");check(wm.requests==0);
            active=true;refreshExitPresentation(d,session);active=false;check(wm.requests==0);
            WorkspaceUsers.current=10;refreshExitPresentation(d,session);WorkspaceUsers.current=0;check(wm.requests==0);
            Task home=new Task();home.mTaskId=1;home.isVisible=false;d.focus=home;refreshExitPresentation(d,session);
            check(wm.requests==1&&wm.mRoot.reconciles==1&&d.focus==home&&lastLog.contains("focus=1"));
            home.isVisible=true;home.activity.win=null;refreshExitPresentation(d,session);check(wm.requests==2);
            Object original=Wm.service;Wm.service=new Object();refreshExitPresentation(d,session);
            check(lastLog.contains("native_fallback")&&d.focus==home);Wm.service=original;
            System.out.println("PASS current focus redraw, Home identity, new session/user and missing native capability");
        }
    }''','utf-8')
    generated.append(exit_test)
    production = [SRC / ('ls/augment/com/' + s + '.java') for s in
                  ('step/OwnershipBridge','step/TaskViewAccess','step/WorkspaceDisplayState',
                   'hook/NativeIslandSceneContract','hook/AppIslandRequestGuard')]
    subprocess.run(['javac','-encoding','UTF-8','-d',out,*generated,*production],check=True)
    for cls in ('ls.augment.com.step.CheckStep','ls.augment.com.hook.CheckIsland','SignalHosts','ExitPresentation'):
        subprocess.run(['java','-cp',out,cls],check=True)
    for path, old, new, cls in [
        ('com/android/wm/shell/taskview/TaskViewTaskController','boolean mSurfaceCreated','int mSurfaceCreated','ls.augment.com.step.CheckStep'),
        ('com/zte/feature/dynamicisland/PermanentIslandManager','DynamicPermanentIsland mAppIsland','Object mAppIsland','ls.augment.com.hook.CheckIsland')]:
        file=out/(path+'.java')
        file.write_text(file.read_text('utf-8').replace(old,new),'utf-8')
        subprocess.run(['javac','-encoding','UTF-8','-cp',out,'-d',out,file],check=True)
        subprocess.run(['java','-cp',out,cls,'unknown'],check=True)
    print('PASS wrong OEM field types fall back')
