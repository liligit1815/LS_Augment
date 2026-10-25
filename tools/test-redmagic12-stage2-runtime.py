"""Run the new coordinate and framework-MTP adapters with independent OEM boundary doubles."""
from pathlib import Path
import runpy
import subprocess
import tempfile
import re

ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT/'android/app/src/main/java/ls/augment/com'
base = runpy.run_path(str(ROOT/'tools/test-launcher-new-apps-runtime.py'))


def run(sources, production, main):
    with tempfile.TemporaryDirectory(prefix='duo-stage2-') as folder:
        p = Path(folder)
        for name, content in sources.items():
            target = p/name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(content, encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', str(p), *map(str, p.rglob('*.java')),
                        *[str(JAVA/x) for x in production]], check=True)
        subprocess.run(['java', '-cp', str(p), main], check=True)


def coordinates():
    data = base['sources'](True)
    for name in list(data):
        text = data.pop(name)
        for cls in ['PackageUpdatedTask', 'AddWorkspaceItemsTask']:
            text = text.replace('com.android.launcher3.model.'+cls, 'com.android.launcher3.model.tasks.'+cls)
            if name.endswith('/'+cls+'.java'):
                name = name.replace('/model/', '/model/tasks/')
                text = text.replace('package com.android.launcher3.model;', 'package com.android.launcher3.model.tasks;')
        data[name] = text
    def put(name, text):
        data[name.replace('.', '/')+'.java'] = text
    n = 'com/android/launcher3/model/tasks/PackageUpdatedTask.java'
    data[n] = data[n].replace('int mOp;', 'boolean mIsUpdate;').replace('String[] mPackages;', 'java.util.Set<String> mPackages;')
    data[n] = data[n].replace('mOp=op;mPackages=new String[]{pkg};', 'mIsUpdate=op!=1;mPackages=java.util.Set.of(pkg);')
    n = 'com/android/launcher3/model/ModelTaskController.java'
    data[n] = data[n].replace('public com.android.launcher3.LauncherAppState getApp(){return state;}',
                            'public android.content.Context getContext(){return state.context;}')
    put('com.android.launcher3.MFVInvariantDeviceProfile', '''package com.android.launcher3;public class MFVInvariantDeviceProfile {
        public boolean card; public boolean getBestieNeedCardPageScreen(){return card;}}''')
    put('com.android.launcher3.InvariantDeviceProfile', '''package com.android.launcher3;public class InvariantDeviceProfile extends MFVInvariantDeviceProfile {}''')
    put('com.android.launcher3.util.IntSet', '''package com.android.launcher3.util;public class IntSet {
        public java.util.Set<Integer> values=new java.util.HashSet<>();public boolean contains(int id){return values.contains(id);}}''')
    put('com.android.launcher3.widget.custom.future.AIFutureWidgetUtils', '''package com.android.launcher3.widget.custom.future;
        public class AIFutureWidgetUtils {public static int page=-1;public static int getAIFutureScreenId(android.content.Context c){return page;}}''')
    put('com.android.launcher3.model.data.WorkspaceItemCoordinates', '''package com.android.launcher3.model.data;
        public class WorkspaceItemCoordinates {public final int screenId,cellX,cellY;public WorkspaceItemCoordinates(int s,int x,int y){screenId=s;cellX=x;cellY=y;}}''')
    put('com.android.launcher3.model.WorkspaceItemSpaceFinder', '''package com.android.launcher3.model;
        public class WorkspaceItemSpaceFinder {public final BgDataModel mDataModel;public final com.android.launcher3.LauncherModel mModel;
        public final com.android.launcher3.InvariantDeviceProfile mIDP=new com.android.launcher3.InvariantDeviceProfile();
        public boolean fail,collision,failNative;public int nativeCalls;
        public WorkspaceItemSpaceFinder(BgDataModel d,com.android.launcher3.LauncherModel m){mDataModel=d;mModel=m;}
        public boolean findNextAvailableIconSpaceInScreen(java.util.List<com.android.launcher3.model.data.ItemInfo> items,int startX,int startY,int sx,int sy,int[] cell){
            if(fail)throw new IllegalStateException("native occupancy failure");
            return ls.augment.com.hook.Dispatch.vacant(new java.util.ArrayList<>(items),cell,sx,sy);}
        public com.android.launcher3.model.data.WorkspaceItemCoordinates findSpaceForItem(java.util.ArrayList<com.android.launcher3.model.data.ItemInfo> pending,int x,int y,com.android.launcher3.util.IntSet excluded,boolean collision){
            nativeCalls++;if(failNative)throw new IllegalStateException("native allocation failure");return new com.android.launcher3.model.data.WorkspaceItemCoordinates(0,0,0);}}''')
    n = 'com/android/launcher3/model/tasks/AddWorkspaceItemsTask.java'
    start = data[n].index('        public void execute(')
    data[n] = data[n][:start]+'''public void execute(com.android.launcher3.model.ModelTaskController c,com.android.launcher3.model.BgDataModel b,com.android.launcher3.model.AllAppsList a){
        java.util.ArrayList<com.android.launcher3.model.data.ItemInfo> pending=new java.util.ArrayList<>();
        for(com.android.launcher3.model.data.ItemInfo i:list){if(i.hidden||b.exists(i))continue;
            int[] saved=ls.augment.com.hook.Dispatch.saved(this,c,i,b);
            com.android.launcher3.model.data.WorkspaceItemCoordinates at=saved==null?
                (com.android.launcher3.model.data.WorkspaceItemCoordinates)ls.augment.com.hook.Dispatch.call(finder,"findSpaceForItem",pending,i.spanX,i.spanY,new com.android.launcher3.util.IntSet(),finder.collision)
                :new com.android.launcher3.model.data.WorkspaceItemCoordinates(saved[0],saved[1],saved[2]);
            i.screenId=at.screenId;i.cellX=at.cellX;i.cellY=at.cellY;i.id=100+b.writes++;pending.add(i);
        }b.itemsIdMap.addAll(pending);}}'''
    # Remove obsolete dispatcher: it intentionally cannot call the new signature.
    n = 'ls/augment/com/hook/Dispatch.java'
    begin = data[n].index('        public static int[] space(')
    end = data[n].index('        public static boolean vacant', begin)
    data[n] = data[n][:begin]+data[n][end:]
    test = '''package ls.augment.com.hook;
        import com.android.launcher3.*;import com.android.launcher3.model.*;import com.android.launcher3.model.data.*;
        import com.android.launcher3.model.tasks.*;import com.android.launcher3.util.*;import android.os.UserHandle;
        public class TestNewApps {static int count;static void check(boolean b,String m){count++;if(!b)throw new AssertionError(m);}
        public static void main(String[]args)throws Exception {
            android.content.Context context=new android.content.Context();AugmentModule module=new AugmentModule();
            LauncherNewAppsLastPageHook.install(module,TestNewApps.class.getClassLoader());check(module.errors.isEmpty(),"new targets install");check(module.hooks.size()==9,"obsolete bind boundary absent");
            LauncherModel model=new LauncherModel(context);BgDataModel bg=new BgDataModel();AllAppsList apps=new AllAppsList();
            LauncherAppState state=new LauncherAppState(context,model);ModelTaskController ctl=new ModelTaskController(state);
            WorkspaceItemSpaceFinder finder=new WorkspaceItemSpaceFinder(bg,model);ctl.finder=finder;
            ModelLauncherCallbacks callbacks=new ModelLauncherCallbacks(model);UserHandle user=new UserHandle(0),work=new UserHandle(10);
            Workspace ws=new Workspace(context);Dispatch.call(ws,"onLayout",false,0,0,400,400);
            FeatureSettings.enabled=false;Dispatch.event(callbacks,"off",user);model.drain(ctl,bg,apps);check(bg.writes==0,"disabled drawer native");
            FeatureSettings.enabled=true;Dispatch.event(callbacks,"new",user);model.drain(ctl,bg,apps);check(bg.writes==1&&bg.itemsIdMap.get(0).screenId==1,"visual last page");
            Dispatch.event(callbacks,"new",user);model.drain(ctl,bg,apps);check(bg.writes==1,"duplicate kept native filtering");
            Dispatch.event(callbacks,"new",work);model.drain(ctl,bg,apps);check(bg.writes==2,"work profile separate");
            Dispatch.call(new LoaderTask(callbacks,user),"run");model.drain(ctl,bg,apps);check(bg.writes==2,"loader restore not forced");
            Dispatch.event(callbacks,"hidden",user);Dispatch.execute(model.queue.remove(0),ctl,bg,apps);
            AddWorkspaceItemsTask hidden=(AddWorkspaceItemsTask)model.queue.remove(0);hidden.list.get(0).hidden=true;Dispatch.execute(hidden,ctl,bg,apps);check(bg.writes==2,"hidden native filtering");
            Dispatch.event(callbacks,"migrate",user);Dispatch.execute(model.queue.remove(0),ctl,bg,apps);
            AddWorkspaceItemsTask moving=(AddWorkspaceItemsTask)model.queue.remove(0);moving.setMove(true);Dispatch.execute(moving,ctl,bg,apps);check(moving.savedCalls==1,"migration saved location retained");
            Dispatch.event(callbacks,"cancel",user);FeatureSettings.enabled=false;model.drain(ctl,bg,apps);check(bg.writes==3,"disable cancels queued force");FeatureSettings.enabled=true;
            bg.itemsIdMap.clear();ItemInfo widget=new ItemInfo("widget",user);widget.id=40;widget.itemType=4;widget.screenId=1;widget.spanX=2;widget.spanY=2;bg.itemsIdMap.add(widget);
            Dispatch.event(callbacks,"full",user);model.drain(ctl,bg,apps);check(bg.itemsIdMap.get(1).screenId==3,"full page uses native ID allocator");
            Dispatch.event(callbacks,"again",user);model.drain(ctl,bg,apps);check(bg.itemsIdMap.get(2).screenId==3,"unbound new page remains last");check(widget.screenId==1&&widget.spanX==2,"existing widget intact");
            LauncherNewAppsLastPageHook.Targets t=new LauncherNewAppsLastPageHook.Targets(TestNewApps.class.getClassLoader());
            LauncherNewAppsLastPageHook.Controller c=new LauncherNewAppsLastPageHook.Controller(module,t);
            LauncherNewAppsLastPageHook.Scope scope=new LauncherNewAppsLastPageHook.Scope(new LauncherNewAppsLastPageHook.Event("x",user),context);
            bg.itemsIdMap.clear();c.pageOrder=new int[]{0,8,2};java.util.ArrayList<ItemInfo> pending=new java.util.ArrayList<>();
            ItemInfo p=new ItemInfo("pending",user);p.screenId=2;pending.add(p);IntSet excluded=new IntSet();
            WorkspaceItemCoordinates at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);
            check(at.screenId==2&&!(at.cellX==0&&at.cellY==0),"pending batch counted before writer publishes model");
            excluded.values.add(2);at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);check(at.screenId==8,"excluded page respected");
            com.android.launcher3.widget.custom.future.AIFutureWidgetUtils.page=8;
            at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);check(at.screenId==0,"AI page protected");
            finder.mIDP.card=true;at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);check(at.screenId!=0&&at.screenId!=2&&at.screenId!=8,"first card and excluded pages protected");
            com.android.launcher3.widget.custom.future.AIFutureWidgetUtils.page=-1;finder.mIDP.card=false;finder.fail=true;
            Dispatch.event(callbacks,"fallback",user);model.drain(ctl,bg,apps);check(finder.nativeCalls==1,"occupancy failure runs native exactly once");
            check(module.errors.size()==1,"only deliberate failure recorded");
            finder.fail=false;bg.itemsIdMap.clear();pending.clear();excluded.values.clear();c.pageOrder=new int[0];
            ItemInfo existing=new ItemInfo("existing",user);existing.screenId=7;bg.itemsIdMap.add(existing);
            LauncherOwnedStateClient.order="7,9";LauncherOwnedStateClient.keep=false;
            at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);check(at.screenId==7,"stale non-retained page ignored before first layout");
            LauncherOwnedStateClient.keep=true;at=(WorkspaceItemCoordinates)c.findCoordinates(scope,finder,pending,1,1,excluded);
            check(at.screenId==9,"retained empty page remains last before first layout");LauncherOwnedStateClient.order="";LauncherOwnedStateClient.keep=false;
            finder.collision=true;finder.failNative=true;int beforeNative=finder.nativeCalls;boolean nativeFailure=false;
            try{Dispatch.event(callbacks,"native_failure",user);model.drain(ctl,bg,apps);}catch(RuntimeException expected){nativeFailure=true;}
            check(nativeFailure&&finder.nativeCalls==beforeNative+1,"native collision allocation failure propagates without retrying writes");
            finder.collision=false;finder.failNative=false;
            ClassLoader missing=new ClassLoader(TestNewApps.class.getClassLoader()) {protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {
                if(n.equals("com.android.launcher3.model.data.WorkspaceItemCoordinates"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
            boolean rejected=false;try{new LauncherNewAppsLastPageHook.Targets(missing);}catch(Exception expected){rejected=true;}check(rejected,"missing coordinate contract rejected before hooks");
            System.out.println("PASS coordinate adapter: "+count+" lifecycle/placement checks");}}
    '''
    put('ls.augment.com.hook.TestNewApps', test)
    run(data, ['hook/LauncherNewAppsLastPageHook.java'], 'ls.augment.com.hook.TestNewApps')


def mtp():
    common = base['COMMON']
    data = {name: common[name] for name in ['ls/augment/com/hook/AugmentModule.java']}
    data.update({
        'android/content/Context.java': 'package android.content;public class Context {}',
        'android/content/Intent.java': 'package android.content;public class Intent {}',
        'android/app/Service.java': 'package android.app;public class Service extends android.content.Context {}',
        'ls/augment/com/SystemOptions.java': 'package ls.augment.com;public class SystemOptions {public static String key(String k){return k;}}',
        'ls/augment/com/hook/FeatureSettings.java': '''package ls.augment.com.hook;class FeatureSettings {
            static boolean enabled=true,ready=true;static boolean hasVerifiedSnapshot(android.content.Context c){return ready;}
            static boolean enabled(android.content.Context c,String k,boolean fallback){return enabled;}
            static String text(android.content.Context c,String k,String fallback){return "Duo storage";}}''',
        'ls/augment/com/hook/MtpStartupHook.java': 'package ls.augment.com.hook;class MtpStartupHook {static int install(AugmentModule m,ClassLoader l,String s){return 2;}}',
        'com/android/mtp/MtpService.java': '''package com.android.mtp;public class MtpService extends android.app.Service {
            public boolean mPtpMode;public int onStartCommand(android.content.Intent i,int f,int id){return 3;}public void onDestroy(){}}''',
        'android/mtp/MtpStorage.java': '''package android.mtp;public class MtpStorage {
            public final String mDescription;public String volume="external_primary";public boolean removable,failIdentity;
            public MtpStorage(String d){mDescription=d;}public String getVolumeName(){if(failIdentity)throw new IllegalStateException("identity unavailable");return volume;}public boolean isRemovable(){return removable;}}''',
        'android/mtp/MtpServer.java': '''package android.mtp;public class MtpServer {
            public final android.content.Context mContext;public String published;public boolean fail;public int calls;
            public MtpServer(android.content.Context c){mContext=c;}public void addStorage(MtpStorage s){calls++;published=s.mDescription;if(fail)throw new IllegalStateException("native");}}''',
        'ls/augment/com/hook/TestMtp.java': '''package ls.augment.com.hook;import android.mtp.*;public class TestMtp {
            static int count;static void check(boolean v,String s){count++;if(!v)throw new AssertionError(s);}
            static class Derived extends MtpServer {Derived(android.content.Context c){super(c);}}
            static class Wrong {String mPtpMode;}
            public static void main(String[]args)throws Throwable {
                AugmentModule m=new AugmentModule();check(MtpFrameworkHook.install(m,TestMtp.class.getClassLoader())==3,"complete contract installs");
                com.android.mtp.MtpService service=new com.android.mtp.MtpService();MtpServer server=new Derived(service);MtpStorage storage=new MtpStorage("Original");
                java.lang.reflect.Method add=MtpFrameworkHook.method(server.getClass(),"addStorage",void.class,MtpStorage.class);
                m.call(server,add,storage);check("Duo storage".equals(server.published)&&"Original".equals(storage.mDescription),"JNI sees custom name; Java field restored");
                storage.volume="external_12";m.call(server,add,storage);check("Original".equals(server.published),"removable/secondary identity not inferred from storage ID");
                storage.volume="external_primary";service.mPtpMode=true;m.call(server,add,storage);check("Original".equals(server.published),"PTP unchanged");service.mPtpMode=false;
                FeatureSettings.enabled=false;m.call(server,add,storage);check("Original".equals(server.published),"disabled unchanged");FeatureSettings.enabled=true;
                FeatureSettings.ready=false;m.call(server,add,storage);check("Original".equals(server.published),"unverified snapshot unchanged");FeatureSettings.ready=true;
                storage.removable=true;m.call(server,add,storage);check("Original".equals(server.published),"removable primary-like identity unchanged");storage.removable=false;
                storage.failIdentity=true;int beforeIdentity=server.calls;m.call(server,add,storage);
                check(server.calls==beforeIdentity+1&&"Original".equals(server.published),"failed identity falls back exactly once");storage.failIdentity=false;
                server.fail=true;int before=server.calls;boolean failed=false;try{m.call(server,add,storage);}catch(Throwable expected){failed=true;}
                check(failed&&server.calls==before+1&&"Original".equals(storage.mDescription),"native failure propagated once, name restored");
                boolean rejected=false;try{MtpFrameworkHook.field(Wrong.class,"mPtpMode",boolean.class);}catch(Exception expected){rejected=true;}check(rejected,"wrong field type rejected");
                ClassLoader absent=new ClassLoader(TestMtp.class.getClassLoader()){protected Class<?> loadClass(String n,boolean resolve)throws ClassNotFoundException {
                    if(n.equals("android.mtp.MtpStorage"))throw new ClassNotFoundException(n);return super.loadClass(n,resolve);}};
                AugmentModule missing=new AugmentModule();check(MtpFrameworkHook.install(missing,absent)==0&&missing.hooks.isEmpty(),"missing storage rejects before mutation");
                System.out.println("PASS framework MTP: "+count+" identity/lifecycle/failure checks");}}
        '''
    })
    data['ls/augment/com/hook/AugmentModule.java'] = data['ls/augment/com/hook/AugmentModule.java'].replace(
        'class AugmentModule {', 'class AugmentModule {void logFeatureInfo(String value){}')
    run(data, ['hook/MtpFrameworkHook.java'], 'ls.augment.com.hook.TestMtp')


def pages():
    data = dict(runpy.run_path(str(ROOT/'tools/test-launcher-pages-named-lifecycle.py'))['sources'])
    n='com/android/launcher3/Launcher.java'
    data[n]=data[n].replace('new ModelCallbacks()', 'new ModelCallbacks(this)').replace('void bindScreens(', 'void nativeBindScreens(')
    data['com/android/launcher3/ModelCallbacks.java']='''package com.android.launcher3;public class ModelCallbacks {
        public final Launcher launcher;public boolean isFirstPagePinnedItemEnabled;
        public ModelCallbacks(Launcher l){launcher=l;}public void bindScreens(com.android.launcher3.util.IntArray ids){launcher.nativeBindScreens(ids);}}'''
    data['com/android/launcher3/widget/custom/future/AIFutureWidgetUtils.java']='''package com.android.launcher3.widget.custom.future;
        public class AIFutureWidgetUtils {public static int page=99;public static int getAIFutureScreenId(android.content.Context c){return page;}}'''
    n='ls/augment/com/hook/TestLauncherPagesNamedLifecycle.java'
    t=data[n].replace('"bindScreens",launcher,', '"bindScreens",launcher.mModelCallbacks,')
    t=t.replace('c().t.adapter.equals("android15_named")&&c().t.future==null', 'c().t.callbackBinding&&c().t.future!=null')
    start=t.index('public static void main(')
    # Keep the existing independent lifecycle helpers, replace only the legacy scenarios.
    t=t[:start]+'''public static void main(String[]args)throws Throwable {
        setup();enable();bind(0,10,20);check(c().t.bind.getDeclaringClass()==ModelCallbacks.class,"bind belongs to callback owner");
        check(c().fixed(0)&&!c().fixed(10)&&c().fixed(99),"native first and AI pages protected");
        content(10,"original");check(launcher.binds==1&&launcher.finishes==1,"original bind and launcher finish called once");
        action("move",20,10);order(0,20,10);check(ws.getScreenWithId(10).contents.getChildCount()==1,"reorder preserves existing view content");
        action("move",0,10);order(0,20,10);check(c().fixed(0),"first page cannot be moved");
        launcher.failBindOnce=true;boolean failed=false;try{module.call("bindScreens",launcher.mModelCallbacks,new IntArray(0,10,20));}catch(Exception expected){failed=true;}
        check(failed&&!c().binding,"native partial bind propagates and releases binding lifecycle");
        bind(0,10,20);check(c().ready&&!c().binding,"next native bind recovers after failure");
        ClassLoader missing=namedLoader("com.android.launcher3.ModelCallbacks");boolean incomplete=false;
        try{new LauncherPagesHook.Targets(missing);}catch(Exception expected){incomplete=true;}check(incomplete,"missing callback owner rejected");
        System.out.println("PASS callback page adapter: "+checks+" ownership/rollback checks");}
        static LauncherPagesHook.Controller c()throws Exception{return (LauncherPagesHook.Controller)controller();}
        static ClassLoader namedLoader(String blocked){return new ClassLoader(TestLauncherPagesNamedLifecycle.class.getClassLoader()){
            protected Class<?> loadClass(String n,boolean r)throws ClassNotFoundException{
                if(n.equals("com.android.launcher3.C2")||n.equals(blocked))throw new ClassNotFoundException(n);return super.loadClass(n,r);}};}}
    '''
    data[n]=t
    run(data,['hook/LauncherPagesHook.java','hook/LauncherPageOrder.java','hook/TargetReflection.java','LauncherPageOrigins.java'],
        'ls.augment.com.hook.TestLauncherPagesNamedLifecycle')


def dock():
    data = dict(runpy.run_path(str(ROOT/'tools/test-launcher-widget-dock-runtime.py'))['sources'](True))
    n='com/android/launcher3/model/LoaderCursor.java'
    data[n]=data[n].replace('mIDP','idp').replace('mOccupied','occupied').replace('mContext','context')
    data[n]=data[n].replace('idp=idp;', 'this.idp=idp;').replace('ItemInfo item,boolean allApps','ItemInfo item')
    data.pop('com/android/launcher3/model/GridSizeMigrationUtil.java')
    data['com/android/launcher3/model/DbReader.java']='''package com.android.launcher3.model;public class DbReader {
        private final android.database.sqlite.SQLiteDatabase mDb;private final String mTableName;private final android.content.Context mContext;
        public DbReader(android.database.sqlite.SQLiteDatabase db,String table,android.content.Context context){mDb=db;mTableName=table;mContext=context;}}'''
    data['com/android/launcher3/model/GridSizeMigrationLogic.java']='''package com.android.launcher3.model;public class GridSizeMigrationLogic {
        public static int calls,observedBound;public static boolean fail;
        public void migrateHotseat(int sourceSize,int targetSize,DbReader from,DbReader to,DatabaseHelper helper,java.util.List<Integer> ids){
            calls++;if(sourceSize!=targetSize)throw new AssertionError("source/destination bound mismatch");observedBound=targetSize;
            if(fail)throw new IllegalStateException("native migration failed");}}'''
    n='ls/augment/com/hook/TestWidgetDock.java';t=data[n]
    t=t.replace('"checkItemPlacement",ItemInfo.class,boolean.class','"checkItemPlacement",ItemInfo.class')
    t=re.sub(r'm.call\(([^,]+),placement,([^,]+),false\)', r'm.call(\1,placement,\2)',t)
    t=t.replace('com.android.launcher3.model.GridSizeMigrationUtil$DbReader','com.android.launcher3.model.DbReader').replace('com.android.launcher3.model.GridSizeMigrationUtil','com.android.launcher3.model.GridSizeMigrationLogic')
    t=t.replace('.equals("migrate")', '.equals("migrateHotseat")')
    t=t.replace('Object[] args=method.getParameterCount()==7?new Object[]{null,s,d,5,null,null,null}:new Object[]{null,s,d,5,5,null,null,null};',
                'Object migration=type.getConstructor().newInstance();Object[] args=new Object[]{5,5,s,d,null,new java.util.ArrayList<Integer>()};')
    t=t.replace('int targetIndex=method.getParameterCount()==7?3:4;', 'int targetIndex=1;')
    t=t.replace('(Boolean)m.call(null,method,args)', 'm.call(migration,method,args)==null').replace('m.call(null,method,args)', 'm.call(migration,method,args)')
    t=t.replace('args[2]=same','args[3]=same').replace('args[2]=d','args[3]=d')
    data[n]=t.replace('Android 15 named', 'coordinate loader / split migration')
    run(data,['hook/LauncherWidgetResizeHook.java','hook/LauncherDockCapacityHook.java'],'ls.augment.com.hook.TestWidgetDock')


if __name__ == '__main__':
    coordinates()
    mtp()
    pages()
    dock()
