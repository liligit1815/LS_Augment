"""Run production new-install hooks against both audited OEM API families.

Boundary doubles exercise real hook dispatch, queues, native deduplication and
placement writes. This does not claim phone installation behavior is verified.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com/hook/LauncherNewAppsLastPageHook.java'


COMMON = {
    'android/content/Context.java': 'package android.content;public class Context {}',
    'android/content/SharedPreferences.java': 'package android.content;public interface SharedPreferences {boolean getBoolean(String k,boolean d);String getString(String k,String d);}',
    'android/content/ComponentName.java': '''package android.content;public class ComponentName {final String p;
        public ComponentName(String p){this.p=p;}public String getPackageName(){return p;}}''',
    'android/os/UserHandle.java': '''package android.os;public class UserHandle {final int id;public UserHandle(int i){id=i;}
        public boolean equals(Object o){return o instanceof UserHandle&&((UserHandle)o).id==id;}public int hashCode(){return id;}}''',
    'android/os/Process.java': 'package android.os;public class Process {public static int myPid(){return 993;}}',
    'android/view/View.java': 'package android.view;public class View {final android.content.Context c;public View(android.content.Context c){this.c=c;}public android.content.Context getContext(){return c;}}',
    'org/json/JSONObject.java': 'package org.json;public class JSONObject {public JSONObject put(String k,Object v){return this;}public String toString(){return "{}";}}',
    'ls/augment/com/BuildConfig.java': 'package ls.augment.com;public class BuildConfig {public static final int VERSION_CODE=20544;}',
    'ls/augment/com/LauncherOptions.java': 'package ls.augment.com;public class LauncherOptions {public static final String NEW_APPS_LAST_PAGE="new_apps";}',
    'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;class FeatureSettings {static boolean enabled;
        static boolean enabled(android.content.Context c,String k){return enabled;}static void diagnostic(android.content.Context c,String k,String v){}}''',
    'ls/augment/com/hook/LauncherOwnedStateClient.java': '''package ls.augment.com.hook;class LauncherOwnedStateClient {static String order="";static boolean keep;
        static android.content.SharedPreferences readyPreferences(android.content.Context c,String key){return new android.content.SharedPreferences(){
        public boolean getBoolean(String k,boolean d){return keep;}public String getString(String k,String d){return order;}};}}''',
    'ls/augment/com/hook/LauncherPageOrder.java': '''package ls.augment.com.hook;class LauncherPageOrder {
        static java.util.List<Integer> parse(String raw){java.util.List<Integer> values=new java.util.ArrayList<>();if(!raw.isEmpty())for(String part:raw.split(","))values.add(Integer.valueOf(part));return values;}}''',
    'ls/augment/com/hook/AugmentModule.java': '''package ls.augment.com.hook;import java.lang.reflect.*;import java.util.*;
        public class AugmentModule {public static AugmentModule active;public AugmentModule(){active=this;}
        final Map<Method,Hook> hooks=new LinkedHashMap<>();final List<Throwable> errors=new ArrayList<>();
        interface Interceptor {Object call(Chain c)throws Throwable;}static class Hook {final Method m;Interceptor i;Hook(Method m){this.m=m;}
        Hook intercept(Interceptor i){this.i=i;return this;}}Hook prepareFeatureHook(Method m,String id,boolean b){return new Hook(m);}
        void registerFeatureHook(Hook h){hooks.put(h.m,h);}void logFeatureError(String k,Throwable t){errors.add(t);}
        static class Chain {final Object owner;final Method method;final Object[] args;Chain(Object o,Method m,Object[] a){owner=o;method=m;args=a;}
        Object getThisObject(){return owner;}Object getArg(int i){return args[i];}Object proceed()throws Throwable{try{method.setAccessible(true);
        return method.invoke(owner,args);}catch(InvocationTargetException e){throw e.getCause();}}}
        public Object call(Object o,Method m,Object...args)throws Throwable{Hook h=hooks.get(m);return h==null?new Chain(o,m,args).proceed():h.i.call(new Chain(o,m,args));}}''',
}


def sources(named):
    n = dict(model='com.android.launcher3.LauncherModel', state='com.android.launcher3.LauncherAppState',
             callbacks='com.android.launcher3.model.ModelLauncherCallbacks', controller='com.android.launcher3.model.ModelTaskController',
             bg='com.android.launcher3.model.BgDataModel', apps='com.android.launcher3.model.AllAppsList',
             package='com.android.launcher3.model.PackageUpdatedTask', add='com.android.launcher3.model.AddWorkspaceItemsTask',
             loader='com.android.launcher3.model.LoaderTask', finder='com.android.launcher3.model.WorkspaceItemSpaceFinder',
             array='com.android.launcher3.util.IntArray', db='com.android.launcher3.model.ModelDbController',
             resource='com.android.launcher3.resource.ResourceManagerProxy', launcher='com.android.launcher3.Launcher',
             mc='com.android.launcher3.ModelCallbacks', util='com.android.launcher3.Utilities', item='com.android.launcher3.model.data.ItemInfo',
             enqueue='enqueueModelUpdateTask', execute='execute', bind='bindAddedWorkspaceItems', layer='isSingleLayer',
             saved='useSavedLocation', database='getModelDbController', next='getNewScreenId', array_get='toArray', array_add='add',
             op='mOp', packages='mPackages', user='mUser', move='isMoveDataFlag', items='itemsIdMap',
             wslauncher='mLauncher', binding='mModelCallbacks', pinned='isFirstPagePinnedItemEnabled', vendor='SHOULD_SHOW_FIRST_PAGE_WIDGET')
    if not named:
        n.update(model='com.android.launcher3.D3', state='com.android.launcher3.P2', callbacks='z1.Q2', controller='z1.o3',
                 bg='z1.y0', apps='z1.m', package='z1.h4', add='z1.j', loader='z1.c2', finder='z1.z5',
                 array='com.android.launcher3.util.x0', db='z1.k2', resource='com.android.launcher3.resource.g0',
                 launcher='com.android.launcher3.C2', mc='com.android.launcher3.B4', util='com.android.launcher3.N5',
                 item='com.android.launcher3.model.data.y', enqueue='W', execute='a', bind='x', layer='M0', saved='g',
                 database='m0', next='F', array_get='A', array_add='m', op='a', packages='c', user='b', move='c',
                 items='a', wslauncher='x', binding='h', pinned='j', vendor='j')
    n['task'] = n['model'] + ('.ModelUpdateTask' if named else '.d')
    data = dict(COMMON)
    def add(key, body):
        name = n.get(key, key)
        package, cls = name.rsplit('.', 1)
        data[name.replace('.', '/')+'.java'] = 'package '+package+';'+body.replace('CLASS', cls).format(**n)
    if not named:
        add('com.android.launcher3.F1', 'public class CLASS {{}}')
    add('item', '''public class CLASS {{public int id=-1,itemType,container=-100,screenId,spanX=1,spanY=1,cellX,cellY;
        public android.os.UserHandle user;public String pkg;public boolean hidden;
        public CLASS(String p,android.os.UserHandle u){{pkg=p;user=u;}}public android.content.ComponentName getTargetComponent(){{return new android.content.ComponentName(pkg);}}}}''')
    add('array', '''public class CLASS {{public final java.util.List<Integer> ids=new java.util.ArrayList<>();public boolean failOnce;
        public CLASS(int...v){{for(int i:v)ids.add(i);}}public int[] {array_get}(){{return ids.stream().mapToInt(i->i).toArray();}}
        public void {array_add}(int i){{ids.add(i);if(failOnce){{failOnce=false;throw new IllegalStateException("native append failure");}}}}public void clear(){{ids.clear();}}}}''')
    add('bg', '''public class CLASS {{public final java.util.List<{item}> {items}=new java.util.ArrayList<>();public int writes;
        public boolean exists({item} i){{for({item} x:{items})if(x.pkg.equals(i.pkg)&&x.user.equals(i.user))return true;return false;}}
        public {array} screens(){{java.util.TreeSet<Integer> s=new java.util.TreeSet<>();for({item} i:{items})if(i.container==-100)s.add(i.screenId);
        if(s.isEmpty())s.add(0);return new {array}(s.stream().mapToInt(i->i).toArray());}}}}''')
    add('apps', 'public class CLASS {{}}')
    add('db', 'public class CLASS {{public int next=3;public int {next}(){{return next++;}}}}')
    state_methods = 'public android.content.Context getContext(){{return context;}}public {model} getModel(){{return model;}}' if named else ''
    add('state', 'public class CLASS {{public android.content.Context context;public {model} model;public CLASS(android.content.Context c,{model} m){{context=c;model=m;}}'+state_methods+'}}')
    add('resource', 'public class CLASS {{public boolean nativeLayer;public boolean {layer}(){{return nativeLayer;}}}}')
    task_cls = 'ModelUpdateTask' if named else 'd'
    add('model', '''public class CLASS {{public interface '''+task_cls+''' {{void {execute}({controller} c,{bg} b,{apps} a);}}
        public final java.util.List<{task}> queue=new java.util.ArrayList<>();public final {db} db=new {db}();public final android.content.Context context;
        public CLASS(android.content.Context c){{context=c;}}public void {enqueue}({task} task){{queue.add(task);}}public {db} {database}(){{return db;}}
        public void add(java.util.ArrayList<{item}> items, {finder} finder){{ls.augment.com.hook.Dispatch.enqueue(this,new {add}(items,finder));}}
        public void drain({controller} c,{bg} b,{apps} a){{while(!queue.isEmpty())ls.augment.com.hook.Dispatch.execute(queue.remove(0),c,b,a);}}}}''')
    context_methods = ('public {state} getApp(){{return state;}}' if named else 'public android.content.Context V(){{return state.context;}}')
    add('controller', '''public class CLASS {{public final {state} state;public final {resource} resource=new {resource}();public {finder} finder;
        public CLASS({state} s){{state=s;}}'''+context_methods+'''
        public void {bind}(java.util.ArrayList<{item}> items){{if(ls.augment.com.hook.Dispatch.layer(resource))state.model.add(items,finder);}}}}''')
    add('package', '''public class CLASS implements {task} {{private final int {op};private final String[] {packages};private final android.os.UserHandle {user};
        public java.util.ArrayList<{item}> incoming=new java.util.ArrayList<>();public boolean fail;
        public CLASS(int op,android.os.UserHandle u,String pkg){{{op}=op;{packages}=new String[]{{pkg}};{user}=u;incoming.add(new {item}(pkg,u));}}
        public void {execute}({controller} c,{bg} b,{apps} a){{ls.augment.com.hook.Dispatch.bind(c,incoming);if(fail)throw new IllegalStateException("native package failure");}}}}''')
    add('callbacks', '''public class CLASS {{public final {model} model;public CLASS({model} m){{model=m;}}
        public void onPackageAdded(String p,android.os.UserHandle u){{ls.augment.com.hook.Dispatch.enqueue(model,new {package}(1,u,p));}}}}''')
    add('loader', '''public class CLASS {{public {callbacks} callback;public android.os.UserHandle user;public CLASS({callbacks} c,android.os.UserHandle u){{callback=c;user=u;}}
        public void run(){{ls.augment.com.hook.Dispatch.event(callback,"restored",user);}}}}''')
    vacancy = '''boolean result=ls.augment.com.hook.Dispatch.vacant(items,cell,x,y);return result;'''
    if named:
        finder_body = '''public class CLASS {{public final {bg} data;public final {model} model;public CLASS({bg} d,{model} m){{data=d;model=m;}}
            private boolean findNextAvailableIconSpaceInScreen({state} s,java.util.ArrayList<{item}> items,int[]cell,int x,int y){{'''+vacancy+'''}}
            public int[] findSpaceForItem({state} state,{bg} data,{array} screens,{array} added,int x,int y,boolean collision){{return nativeSpace(screens,added);}}
            public int[] nativeSpace({array} screens,{array} added){{return new int[]{{0,0,0}};}}}}'''
    else:
        finder_body = '''public class CLASS {{private final {bg} a;private final {model} c;public CLASS({bg} d,{model} m){{a=d;c=m;}}
            private boolean a(java.util.ArrayList<{item}> items,int[]cell,int x,int y){{'''+vacancy+'''}}
            public int[] c({array} screens,{array} added,int x,int y,boolean collision){{return new int[]{{0,0,0}};}}}}'''
    add('finder', finder_body)
    add('add', '''public class CLASS implements {task} {{private boolean {move};public final java.util.List<{item}> list;public final {finder} finder;
        public int savedCalls;public boolean failAppend;public {array} lastScreens,lastAdded;public CLASS(java.util.List<{item}> l,{finder} f){{list=l;finder=f;}}
        public void setMove(boolean b){{{move}=b;}}private int[] {saved}({controller} c,{item} i,{bg} b){{savedCalls++;return new int[]{{0,1,1}};}}
        public void {execute}({controller} c,{bg} b,{apps} a){{{array} screens=b.screens(),added=new {array}();lastScreens=screens;lastAdded=added;added.failOnce=failAppend;
            for({item} i:list){{if(i.hidden||b.exists(i))continue;int[] p=ls.augment.com.hook.Dispatch.saved(this,c,i,b);
                if(p==null)p=ls.augment.com.hook.Dispatch.space(finder,c.state,b,screens,added,i.spanX,i.spanY);
                i.screenId=p[0];i.cellX=p[1];i.cellY=p[2];i.id=100+b.writes++;b.{items}.add(i);}}}}}}''')
    add('mc', 'public class CLASS {{public boolean {pinned};}}')
    add('util', 'public class CLASS {{public static boolean {vendor};}}')
    add('launcher', 'public class CLASS {{public final {mc} {binding}=new {mc}();}}')
    add('com.android.launcher3.Workspace', '''public class CLASS extends android.view.View {{public final {launcher} {wslauncher}=new {launcher}();
        public {array} order=new {array}(2,0,1);public CLASS(android.content.Context c){{super(c);}}
        public {array} getScreenOrder(){{return order;}}protected void onLayout(boolean change,int l,int t,int r,int b){{}}}}''')
    if not named:
        add('com.android.launcher3.widget.custom.future.AIFutureWidgetUtils', 'public class CLASS {{public static int future=-1;public static int l(android.content.Context c){{return future;}}}}')
    named_space = 'return (int[])call(finder,"findSpaceForItem",state,b,screens,added,x,y,false);' if named else 'return (int[])call(finder,"c",screens,added,x,y,false);'
    add('ls.augment.com.hook.Dispatch', '''public class CLASS {{public static Object call(Object owner,String name,Object...args){{try{{
        for(java.lang.reflect.Method m:owner.getClass().getDeclaredMethods())if(m.getName().equals(name)&&m.getParameterCount()==args.length)return AugmentModule.active.call(owner,m,args);
        throw new NoSuchMethodException(name);}}catch(Throwable t){{throw new RuntimeException(t);}}}}
        public static void enqueue({model} model,{task} task){{call(model,"{enqueue}",task);}}
        public static void execute({task} task,{controller} c,{bg} b,{apps} a){{call(task,"{execute}",c,b,a);}}
        public static void event({callbacks} c,String p,android.os.UserHandle u){{call(c,"onPackageAdded",p,u);}}
        public static boolean layer({resource} r){{return (Boolean)call(r,"{layer}");}}
        public static void bind({controller} c,java.util.ArrayList<{item}> l){{call(c,"{bind}",l);}}
        public static int[] saved({add} task,{controller} c,{item} i,{bg} b){{return (int[])call(task,"{saved}",c,i,b);}}
        public static int[] space({finder} finder,{state} state,{bg} b,{array} screens,{array} added,int x,int y){{'''+named_space+'''}}
        public static boolean vacant(java.util.ArrayList<{item}> items,int[] cell,int sx,int sy){{boolean[][] occupied=new boolean[2][2];
            for({item} i:items)for(int y=i.cellY;y<Math.min(2,i.cellY+i.spanY);y++)for(int x=i.cellX;x<Math.min(2,i.cellX+i.spanX);x++)occupied[x][y]=true;
            for(int y=0;y<2;y++)for(int x=0;x<2;x++)if(!occupied[x][y]){{cell[0]=x;cell[1]=y;return true;}}return false;}}
        }}''')
    add('ls.augment.com.hook.TestNewApps', '''public class CLASS {{static int checks;static void check(boolean v,String label){{checks++;if(!v)throw new AssertionError(label);}}
        public static void main(String[]args)throws Throwable{{android.content.Context context=new android.content.Context();AugmentModule module=new AugmentModule();
            LauncherNewAppsLastPageHook.install(module,TestNewApps.class.getClassLoader());check(module.errors.isEmpty(),"complete native contract installed");
            check(module.hooks.size()==10,"all pipeline boundaries registered");
            {model} model=new {model}(context);{bg} bg=new {bg}();{apps} apps=new {apps}();{state} state=new {state}(context,model);
            {controller} ctl=new {controller}(state);{finder} finder=new {finder}(bg,model);ctl.finder=finder;
            {callbacks} callbacks=new {callbacks}(model);android.os.UserHandle user=new android.os.UserHandle(0),work=new android.os.UserHandle(10);
            com.android.launcher3.Workspace workspace=new com.android.launcher3.Workspace(context);Dispatch.call(workspace,"onLayout",false,0,0,500,500);
            FeatureSettings.enabled=false;Dispatch.event(callbacks,"disabled",user);model.drain(ctl,bg,apps);check(bg.writes==0,"disabled drawer mode remains native");
            FeatureSettings.enabled=true;Dispatch.event(callbacks,"new",user);model.drain(ctl,bg,apps);
            check(bg.writes==1&&bg.{items}.get(0).screenId==1,"new app follows visual last page rather than largest screen ID");
            check(!Dispatch.layer(ctl.resource),"layer preference remains unchanged outside installation bind");
            Dispatch.event(callbacks,"new",user);model.drain(ctl,bg,apps);check(bg.writes==1,"duplicate event preserves existing user icon");
            Dispatch.enqueue(model,new {package}(2,user,"updated"));model.drain(ctl,bg,apps);check(bg.writes==1,"package updates not forced");
            Dispatch.enqueue(model,new {package}(1,user,"available"));model.drain(ctl,bg,apps);check(bg.writes==1,"available/re-enable task is not a new-install event");
            Dispatch.call(new {loader}(callbacks,user),"run");model.drain(ctl,bg,apps);check(bg.writes==1,"model restore callback not forced");
            Dispatch.event(callbacks,"cancel",user);FeatureSettings.enabled=false;model.drain(ctl,bg,apps);check(bg.writes==1,"disable before package execution cancels force");
            FeatureSettings.enabled=true;Dispatch.event(callbacks,"new",work);model.drain(ctl,bg,apps);check(bg.writes==2,"same package in work profile remains independent");
            bg.{items}.clear();bg.writes=0;
            {item} widget=new {item}("widget",user);widget.id=10;widget.itemType=4;widget.screenId=1;widget.spanX=2;widget.spanY=2;bg.{items}.add(widget);
            Dispatch.event(callbacks,"overflow",user);model.drain(ctl,bg,apps);check(bg.writes==1&&bg.{items}.get(1).screenId==3,"full last page allocates next native screen");
            check(widget.screenId==1&&widget.spanX==2&&widget.spanY==2,"existing widget geometry preserved");
            Dispatch.event(callbacks,"batch",user);model.drain(ctl,bg,apps);check(bg.{items}.get(2).screenId==3,"unbound newly generated page remains last for next install");
            LauncherNewAppsLastPageHook.Targets targets=new LauncherNewAppsLastPageHook.Targets(TestNewApps.class.getClassLoader());
            LauncherNewAppsLastPageHook.Controller c=new LauncherNewAppsLastPageHook.Controller(module,targets);
            LauncherNewAppsLastPageHook.Scope scope=new LauncherNewAppsLastPageHook.Scope(new LauncherNewAppsLastPageHook.Event("x",user),context);
            {array} one=new {array}(0),newScreens=new {array}();{bg} blank=new {bg}();{finder} blankFinder=new {finder}(blank,model);
            int[] p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==0&&newScreens.ids.isEmpty(),"single empty last page accepts new application");
            c.pageOrder=new int[]{{7,0,5}};one=new {array}(0,5,7);p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==5,"reordered last page is chosen by position");
            c.pageOrder=new int[]{{7,0,9}};one=new {array}(0,7);p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==9&&one.ids.contains(9),"retained empty last page is included without changing its ID");
            c.pageOrder=new int[0];one=new {array}(0,5,7);p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==7,"before workspace capture native last-page fallback works");
            LauncherOwnedStateClient.order="7,0,5";p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==5,"before first layout persisted page position overrides numeric ordering");
            LauncherOwnedStateClient.order="7,0,9";LauncherOwnedStateClient.keep=true;one=new {array}(0,7);
            p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);check(p[0]==9,"before first layout retained empty last page remains available");
            LauncherOwnedStateClient.keep=false;one=new {array}(0,7);p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);
            check(p[0]==0,"removed non-retained page in old snapshot is excluded");LauncherOwnedStateClient.order="";
            c.pageOrder=new int[]{{0}};c.firstPageProtected=true;one=new {array}(0);newScreens=new {array}();model.db.next=9;
            p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);check(p[0]==9,"protected first page is skipped");
            c.firstPageProtected=false;c.pageOrder=new int[]{{9}};one=new {array}(9);newScreens=new {array}();model.db.next=9;
            {item} full=new {item}("full",user);full.id=4;full.screenId=9;full.spanX=2;full.spanY=2;blank.{items}.add(full);
            p=c.findSpace(scope,blankFinder,'''+('state' if named else 'null')+''',blank,one,newScreens,1,1);check(p[0]==10,"native ID allocation avoids retained empty-page collision");
            // Exercise a failure after a native list append through the real hooks.
            bg.{items}.clear();bg.writes=0;bg.{items}.add(widget);workspace.order=new {array}(0,1);Dispatch.call(workspace,"onLayout",false,0,0,500,500);
            Dispatch.event(callbacks,"rollback",user);Dispatch.execute(model.queue.remove(0),ctl,bg,apps);
            {add} failing=({add})model.queue.remove(0);failing.failAppend=true;Dispatch.execute(failing,ctl,bg,apps);
            check(bg.writes==1&&bg.{items}.get(1).screenId==0,"append failure falls back to native placement without corrupting item");
            check(failing.lastScreens.ids.equals(java.util.List.of(1))&&failing.lastAdded.ids.isEmpty(),"native lists roll back after partially completed page append");
            check(module.errors.size()==1,"only intentional append failure is reported");
            FeatureSettings.enabled=true;{add} unrelated=new {add}(new java.util.ArrayList<>(java.util.List.of(new {item}("manual",user))),finder);
            Dispatch.execute(unrelated,ctl,bg,apps);check(unrelated.savedCalls==1,"manual shortcut/task retains native saved location");
            Dispatch.event(callbacks,"migration",user);Dispatch.execute(model.queue.remove(0),ctl,bg,apps);
            {add} moving=({add})model.queue.remove(0);moving.setMove(true);Dispatch.execute(moving,ctl,bg,apps);
            check(moving.savedCalls==1,"marked migration task retains OEM saved location");
            Dispatch.event(callbacks,"queued-disable",user);Dispatch.execute(model.queue.remove(0),ctl,bg,apps);
            {add} cancelled=({add})model.queue.remove(0);FeatureSettings.enabled=false;Dispatch.execute(cancelled,ctl,bg,apps);
            check(cancelled.savedCalls==1,"disable before item task executes retains OEM saved location");
            System.out.println("new-apps '''+('named' if named else 'obfuscated')+''': "+checks+" assertions passed");
        }} }}''')
    return data


def main():
    for named in (True, False):
        with tempfile.TemporaryDirectory(prefix='launcher-new-apps-') as directory:
            root = Path(directory)
            for name, content in sources(named).items():
                target = root / name
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(content, encoding='utf-8')
            subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(root), *map(str, root.rglob('*.java')), str(JAVA)], check=True)
            subprocess.run(['java', '-cp', str(root), 'ls.augment.com.hook.TestNewApps'], check=True)


if __name__ == '__main__':
    main()
