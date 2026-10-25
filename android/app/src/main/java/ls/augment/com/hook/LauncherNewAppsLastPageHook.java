package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.UserHandle;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;
import ls.augment.com.BuildConfig;
import ls.augment.com.LauncherOptions;

/** Route real package additions through the OEM writer; never relocate existing items. */
final class LauncherNewAppsLastPageHook {
    static final String DIAGNOSTIC="ls_augment_launcher_new_apps_last_page_runtime";
    private static boolean installed;

    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        try{
            Targets t=new Targets(loader);Controller c=new Controller(module,t);
            module.registerFeatureHook(module.prepareFeatureHook(t.loaderRun,"launcher.new_apps.loader",true).intercept(chain->{
                boolean before=c.loading.get();c.loading.set(true);
                try{return chain.proceed();}finally{c.loading.set(before);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.packageAdded,"launcher.new_apps.event",true).intercept(chain->{
                Event before=c.event.get();
                c.stage(c.loading.get()?"loaderEventsIgnored":"packageAddedEvents");
                // The OEM loader also calls onPackageAdded while restoring its model.
                c.event.set(c.loading.get()?null:new Event((String)chain.getArg(0),(UserHandle)chain.getArg(1)));
                try{return chain.proceed();}finally{c.event.set(before);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.enqueue,"launcher.new_apps.queue",true).intercept(chain->{
                Object task=chain.getArg(0);Event event=c.event.get();Scope scope=c.installing.get();
                try{
                    if(t.packageTask.isInstance(task))c.stage("packageTasksQueued");
                    if(t.addTask.isInstance(task))c.stage("addTasksQueued");
                    if(event!=null&&t.packageTask.isInstance(task)&&c.matchesPackage(task,event)){c.packages.put(task,event);c.stage("matchedPackageTasksQueued");}
                    else if(scope!=null&&t.addTask.isInstance(task)){c.additions.put(task,scope.event);c.stage("matchedAddTasksQueued");}
                }catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_QUEUE",failure);}
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.packageExecute,"launcher.new_apps.package",true).intercept(chain->{
                Event event=c.packages.remove(chain.getThisObject());Scope before=c.installing.get();
                c.stage("packageTasksExecuted");if(event!=null)c.stage("matchedPackageTasksExecuted");
                try{
                    Context context=t.context(chain.getArg(0));
                    c.lastContext=context;
                    c.installing.set(event!=null&&c.matchesPackage(chain.getThisObject(),event)
                            &&FeatureSettings.enabled(context,LauncherOptions.NEW_APPS_LAST_PAGE)?new Scope(event,context):null);
                }catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_PACKAGE",failure);c.installing.set(null);}
                try{return chain.proceed();}finally{c.installing.set(before);}
            }));
            if(t.bindAdded!=null)module.registerFeatureHook(module.prepareFeatureHook(t.bindAdded,"launcher.new_apps.force_add",true).intercept(chain->{
                boolean before=c.forceAdd.get();c.forceAdd.set(c.installing.get()!=null);
                c.stage(c.forceAdd.get()?"forcedAddBindings":"nativeAddBindings");
                // Keep the native AppInfo conversion, callbacks and model queue. The
                // scoped layer check admits just this installation in drawer mode.
                try{return chain.proceed();}finally{c.forceAdd.set(before);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.singleLayer,"launcher.new_apps.layer_gate",true).intercept(chain->{
                return (c.forceAdd.get()||(t.coordinates&&c.installing.get()!=null))?true:chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.addExecute,"launcher.new_apps.add",true).intercept(chain->{
                Event event=c.additions.remove(chain.getThisObject());Scope before=c.adding.get();
                c.stage("addTasksExecuted");if(event!=null)c.stage("matchedAddTasksExecuted");
                try{
                    Context context=t.context(chain.getArg(0));
                    c.lastContext=context;if(t.moveData.getBoolean(chain.getThisObject()))c.stage("migrationAddTasksIgnored");
                    c.adding.set(event!=null&&!t.moveData.getBoolean(chain.getThisObject())
                            &&FeatureSettings.enabled(context,LauncherOptions.NEW_APPS_LAST_PAGE)?new Scope(event,context):null);
                }catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_ADD",failure);c.adding.set(null);}
                try{return chain.proceed();}finally{c.adding.set(before);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.savedLocation,"launcher.new_apps.saved_location",true).intercept(chain->{
                Scope scope=c.adding.get();
                c.stage(scope==null?"nativeSavedLocationCalls":"matchedSavedLocationCalls");
                if(scope!=null){
                    scope.item=null;
                    try{if(c.newApplication(chain.getArg(1),scope.event)){scope.item=chain.getArg(1);c.stage("newApplicationItems");return null;}}
                    catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_ITEM",failure);}
                }
                return chain.proceed();
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.findSpace,"launcher.new_apps.last_page",true).intercept(chain->{
                Scope scope=c.adding.get();
                c.stage(scope==null||scope.item==null?"nativePlacementCalls":"matchedPlacementCalls");
                if(scope==null||scope.item==null)return chain.proceed();
                if(t.coordinates) {
                    if(Boolean.TRUE.equals(chain.getArg(4)))return chain.proceed();
                    try {
                        return c.findCoordinates(scope,chain.getThisObject(),(ArrayList<?>)chain.getArg(0),
                                (Integer)chain.getArg(1),(Integer)chain.getArg(2),chain.getArg(3));
                    }catch(Exception failure){module.logFeatureError("LAUNCHER_NEW_APPS_COORDINATES",failure);return chain.proceed();}
                }
                Object screens=chain.getArg(t.named?2:0),added=chain.getArg(t.named?3:1);
                int[] beforeScreens=null,beforeAdded=null;
                try{
                    Object state=t.named?chain.getArg(0):null,bg=t.named?chain.getArg(1):t.finderData.get(chain.getThisObject());
                    beforeScreens=((int[])t.listArray.invoke(screens)).clone();beforeAdded=((int[])t.listArray.invoke(added)).clone();
                    int x=(Integer)chain.getArg(t.named?4:2),y=(Integer)chain.getArg(t.named?5:3);
                    return c.findSpace(scope,chain.getThisObject(),state,bg,screens,added,x,y);
                }catch(Throwable failure){
                    module.logFeatureError("LAUNCHER_NEW_APPS_SPACE",failure);
                    // A failed append must not leave a phantom screen for the
                    // native fallback or its subsequent item callbacks.
                    if(beforeScreens!=null&&beforeAdded!=null){c.replace(screens,beforeScreens);c.replace(added,beforeAdded);}
                    return chain.proceed();
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.layout,"launcher.new_apps.page_order",true).intercept(chain->{
                Object result=chain.proceed();
                try{c.capture(chain.getThisObject());}catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_ORDER",failure);}
                return result;
            }));
            installed=true;
        }catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_INSTALL",failure);}
    }

    static final class Event {
        final String packageName;final UserHandle user;
        Event(String packageName,UserHandle user){this.packageName=packageName;this.user=user;}
    }
    static final class Scope {
        final Event event;final Context context;Object item;
        Scope(Event event,Context context){this.event=event;this.context=context;}
    }
    static final class Controller {
        final AugmentModule module;final Targets t;
        final ThreadLocal<Boolean> loading=ThreadLocal.withInitial(()->false),forceAdd=ThreadLocal.withInitial(()->false);
        final ThreadLocal<Event> event=new ThreadLocal<>();
        final ThreadLocal<Scope> installing=new ThreadLocal<>(),adding=new ThreadLocal<>();
        final Map<Object,Event> packages=Collections.synchronizedMap(new WeakHashMap<>()),additions=Collections.synchronizedMap(new WeakHashMap<>());
        volatile int[] pageOrder=new int[0];volatile boolean firstPageProtected;
        volatile int lastPlacedPage=-1;volatile boolean createdLastPage;String lastReport="";
        volatile Context lastContext;final Map<String,Integer> stages=new LinkedHashMap<>();
        Controller(AugmentModule module,Targets t){this.module=module;this.t=t;}
        boolean matchesPackage(Object task,Event event)throws Exception{
            if(t.coordinates) {
                java.util.Set<?> names=(java.util.Set<?>)t.packageNames.get(task);
                return !t.operation.getBoolean(task)&&event.user.equals(t.packageUser.get(task))
                        &&names.size()==1&&names.contains(event.packageName);
            }
            String[] names=(String[])t.packageNames.get(task);
            return t.operation.getInt(task)==1&&event.user.equals(t.packageUser.get(task))&&names.length==1&&event.packageName.equals(names[0]);
        }
        boolean newApplication(Object item,Event event)throws Exception{
            if(t.itemId.getInt(item)>=0){stage("existingItemIdsIgnored");return false;}
            if(t.itemType.getInt(item)!=0){stage("nonApplicationItemsIgnored");return false;}
            if(!event.user.equals(t.itemUser.get(item))){stage("differentUsersIgnored");return false;}
            ComponentName component=(ComponentName)t.component.invoke(item);
            boolean matching=component!=null&&event.packageName.equals(component.getPackageName());
            if(!matching)stage("differentPackagesIgnored");return matching;
        }
        void capture(Object workspace)throws Exception{
            int[] order=((int[])t.listArray.invoke(t.screenOrder.invoke(workspace))).clone();
            Object launcher=t.workspaceLauncher.get(workspace);
            firstPageProtected=!t.coordinates&&t.firstScreen.getBoolean(t.bindingModel.get(launcher))&&!t.vendorFirstScreen.getBoolean(null);
            pageOrder=order;
            Context context=((View)workspace).getContext();lastContext=context;report(context,-1,false);
        }
        int[] findSpace(Scope scope,Object finder,Object state,Object bg,Object screens,Object added,int spanX,int spanY)throws Exception{
            if(spanX!=1||spanY!=1)throw new IllegalStateException("新增应用图标占位不匹配");
            int[] nativeOrder=(int[])t.listArray.invoke(screens),newOrder=(int[])t.listArray.invoke(added);
            LinkedHashSet<Integer> order=new LinkedHashSet<>();
            int[] visible=pageOrder;
            for(int id:visible)if(id>=0)order.add(id);
            if(visible.length==0){
                // The model can finish an installation before the first layout.
                // Reuse the page owner's persisted visual order in that window;
                // its retained empty pages are absent from the native item map.
                SharedPreferences prefs=LauncherOwnedStateClient.readyPreferences(scope.context,"pages");
                if(prefs!=null){
                    boolean keep=prefs.getBoolean("keep_empty",false);
                    for(int id:LauncherPageOrder.parse(prefs.getString("order","")))
                        if(id>=0&&(keep||contains(nativeOrder,id)))order.add(id);
                }
            }
            // An item task can add multiple pages before the main-thread callback
            // lays them out. Append these native IDs after the captured visual order.
            for(int id:nativeOrder)if(id>=0)order.add(id);
            for(int id:newOrder)if(id>=0){order.remove(id);order.add(id);}
            int future=t.futureId==null?-1:(Integer)t.futureId.invoke(null,scope.context);
            int last=-1;
            for(int id:order)if(id!=future&&(id!=0||!firstPageProtected))last=id;
            int[] cell=new int[2];
            if(last>=0&&vacant(finder,state,bg,last,cell,spanX,spanY)){
                // Ensure native callbacks know a retained empty page is a valid
                // screen, while leaving its existing order and IDs untouched.
                if(!contains(nativeOrder,last))t.listAdd.invoke(screens,last);
                report(scope.context,last,false);return new int[]{last,cell[0],cell[1]};
            }
            Object model=t.named?t.stateModel.invoke(state):t.finderModel.get(finder);
            Object db=t.database.invoke(model);int next=-1;
            for(int i=0;i<=order.size();i++){
                int candidate=(Integer)t.nextId.invoke(db);
                if(candidate>=0&&candidate!=future&&!order.contains(candidate)){next=candidate;break;}
            }
            if(next<0||!vacant(finder,state,bg,next,cell,spanX,spanY))throw new IllegalStateException("桌面无法分配新增页面");
            t.listAdd.invoke(screens,next);t.listAdd.invoke(added,next);
            report(scope.context,next,true);return new int[]{next,cell[0],cell[1]};
        }
        Object findCoordinates(Scope scope,Object finder,ArrayList<?> pending,int spanX,int spanY,Object excluded)throws Exception {
            if(spanX!=1||spanY!=1)throw new IllegalStateException("new_app_span");
            Object bg=t.finderData.get(finder),model=t.finderModel.get(finder);
            ArrayList<Object> items=new ArrayList<>();
            LinkedHashSet<Integer> nativePages=new LinkedHashSet<>();
            synchronized(bg){for(Object item:(Iterable<?>)t.items.get(bg))if(item!=null&&t.itemContainer.getInt(item)==-100){
                items.add(item);nativePages.add(t.itemScreen.getInt(item));
            }}
            LinkedHashSet<Integer> order=new LinkedHashSet<>();
            for(int id:pageOrder)if(id>=0)order.add(id);
            if(order.isEmpty()) {
                SharedPreferences prefs=LauncherOwnedStateClient.readyPreferences(scope.context,"pages");
                if(prefs!=null){
                    boolean keep=prefs.getBoolean("keep_empty",false);
                    for(int id:LauncherPageOrder.parse(prefs.getString("order","")))
                        if(id>=0&&(keep||nativePages.contains(id)))order.add(id);
                }
            }
            order.addAll(nativePages);
            for(Object item:pending)if(item!=null&&t.itemContainer.getInt(item)==-100){
                items.add(item);int id=t.itemScreen.getInt(item);order.remove(id);order.add(id);
            }
            int future=(Integer)t.futureId.invoke(null,scope.context);
            boolean pinned=(Boolean)t.firstCard.invoke(t.finderIdp.get(finder));
            int last=-1;
            for(int id:order)if(id>=0&&id!=future&&(!pinned||id!=0)&&!(Boolean)t.excludedContains.invoke(excluded,id))last=id;
            int[] cell=new int[2];
            boolean created=false;
            if(last<0||!vacantCoordinates(finder,items,last,cell)) {
                Object db=t.database.invoke(model);last=-1;
                for(int i=0;i<=order.size()+1;i++) {
                    int candidate=(Integer)t.nextId.invoke(db);
                    if(candidate>=0&&candidate!=future&&(!pinned||candidate!=0)&&!order.contains(candidate)
                            &&!(Boolean)t.excludedContains.invoke(excluded,candidate)){last=candidate;break;}
                }
                if(last<0||!vacantCoordinates(finder,items,last,cell))throw new IllegalStateException("new_app_native_space_missing");
                created=true;
            }
            Object result=t.coordinatesConstructor.newInstance(last,cell[0],cell[1]);
            // Only return a native value object. OEM task owns IDs, persistence and callbacks.
            report(scope.context,last,created);return result;
        }
        boolean vacantCoordinates(Object finder,ArrayList<Object> all,int page,int[] cell)throws Exception {
            ArrayList<Object> items=new ArrayList<>();
            for(Object item:all)if(t.itemScreen.getInt(item)==page)items.add(item);
            return (Boolean)t.vacant.invoke(finder,items,0,0,1,1,cell);
        }
        boolean vacant(Object finder,Object state,Object bg,int screen,int[] cell,int x,int y)throws Exception{
            ArrayList<Object> items=new ArrayList<>();
            synchronized(bg){for(Object item:(Iterable<?>)t.items.get(bg))
                if(t.itemContainer.getInt(item)==-100&&t.itemScreen.getInt(item)==screen)items.add(item);}
            // The OEM occupancy helper accounts for actual widget/folder spans
            // and the currently selected grid. The OEM task still owns every write.
            return (Boolean)(t.named?t.vacant.invoke(finder,state,items,cell,x,y):t.vacant.invoke(finder,items,cell,x,y));
        }
        void replace(Object list,int[] values)throws Exception{t.listClear.invoke(list);for(int value:values)t.listAdd.invoke(list,value);}
        synchronized void stage(String key){
            // Ordinary package refreshes should not consume the shared diagnostic
            // writer while this feature is disabled. Early startup counters remain
            // in memory until a verified launcher context becomes available.
            if(lastContext!=null&&!FeatureSettings.enabled(lastContext,LauncherOptions.NEW_APPS_LAST_PAGE))return;
            stages.put(key,stages.getOrDefault(key,0)+1);if(lastContext!=null)report(lastContext,-1,false);
        }
        synchronized void report(Context context,int page,boolean created){
            if(page>=0){lastPlacedPage=page;createdLastPage=created;}
            boolean enabled=FeatureSettings.enabled(context,LauncherOptions.NEW_APPS_LAST_PAGE);
            String report=enabled+":"+lastPlacedPage+":"+createdLastPage+":"+pageOrder.length+":"+stages;
            if(report.equals(lastReport))return;
            try{JSONObject progress=new JSONObject();for(Map.Entry<String,Integer> entry:stages.entrySet())progress.put(entry.getKey(),entry.getValue());
                FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject().put("version",BuildConfig.VERSION_CODE)
                    .put("pid",android.os.Process.myPid()).put("adapter",t.named?"android15_named":"android16_obfuscated")
                    .put("supported",true).put("enabled",enabled)
                    .put("nativeInstallationPipeline",true).put("nativePlacementAndPersistence",true)
                    .put("lastPage",lastPlacedPage).put("createdPage",createdLastPage).put("capturedPages",pageOrder.length).put("stages",progress).toString());lastReport=report;
            }catch(Throwable failure){module.logFeatureError("LAUNCHER_NEW_APPS_EVIDENCE",failure);}
        }
        static boolean contains(int[] values,int expected){for(int value:values)if(value==expected)return true;return false;}
    }

    /** Validate one complete ROM family before registering any boundary. */
    static final class Targets {
        final boolean named,coordinates;final Class<?> packageTask,addTask;
        final java.lang.reflect.Constructor<?> coordinatesConstructor;
        final Method excludedContains,firstCard;final Field finderIdp;
        final Method loaderRun,packageAdded,enqueue,packageExecute,bindAdded,singleLayer,addExecute,savedLocation,findSpace,layout;
        final Method controllerApp,controllerContext,stateContext,stateModel,database,nextId,component,screenOrder,listArray,listAdd,listClear,vacant,futureId;
        final Field operation,packageNames,packageUser,moveData,itemId,itemType,itemUser,itemContainer,itemScreen,items;
        final Field finderData,finderModel,workspaceLauncher,bindingModel,firstScreen,vendorFirstScreen;

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Targets(ClassLoader loader)throws Exception{
            boolean family;try{Class.forName("com.android.launcher3.F1",false,loader);family=false;}catch(ClassNotFoundException absent){family=true;}named=family;
            Class<?> callbacks=type(loader,named?"com.android.launcher3.model.ModelLauncherCallbacks":"z1.Q2");
            Class<?> model=type(loader,named?"com.android.launcher3.LauncherModel":"com.android.launcher3.D3");
            Class<?> modelTask=type(loader,named?"com.android.launcher3.LauncherModel$ModelUpdateTask":"com.android.launcher3.D3$d");
            Class<?> controller=type(loader,named?"com.android.launcher3.model.ModelTaskController":"z1.o3");
            Class<?> bg=type(loader,named?"com.android.launcher3.model.BgDataModel":"z1.y0");
            Class<?> apps=type(loader,named?"com.android.launcher3.model.AllAppsList":"z1.m");
            Class<?> state=type(loader,named?"com.android.launcher3.LauncherAppState":"com.android.launcher3.P2");
            Class<?> db=type(loader,named?"com.android.launcher3.model.ModelDbController":"z1.k2");
            Class<?> finder=type(loader,named?"com.android.launcher3.model.WorkspaceItemSpaceFinder":"z1.z5");
            Class<?> list=type(loader,named?"com.android.launcher3.util.IntArray":"com.android.launcher3.util.x0");
            Class<?> item=type(loader,named?"com.android.launcher3.model.data.ItemInfo":"com.android.launcher3.model.data.y");
            Class<?> launcher=type(loader,named?"com.android.launcher3.Launcher":"com.android.launcher3.C2");
            Class<?> workspace=type(loader,"com.android.launcher3.Workspace");
            Class<?> packageType;
            try{packageType=type(loader,named?"com.android.launcher3.model.PackageUpdatedTask":"z1.h4");}
            catch(ClassNotFoundException moved){if(!named)throw moved;packageType=type(loader,"com.android.launcher3.model.tasks.PackageUpdatedTask");}
            packageTask=packageType;coordinates=packageType.getName().contains(".model.tasks.");
            addTask=type(loader,coordinates?"com.android.launcher3.model.tasks.AddWorkspaceItemsTask":named?"com.android.launcher3.model.AddWorkspaceItemsTask":"z1.j");
            loaderRun=method(type(loader,named?"com.android.launcher3.model.LoaderTask":"z1.c2"),"run",void.class,false);
            packageAdded=method(callbacks,"onPackageAdded",void.class,false,String.class,UserHandle.class);
            enqueue=method(model,named?"enqueueModelUpdateTask":"W",void.class,false,modelTask);
            packageExecute=method(packageTask,named?"execute":"a",void.class,false,controller,bg,apps);
            addExecute=method(addTask,named?"execute":"a",void.class,false,controller,bg,apps);
            bindAdded=coordinates?null:method(controller,named?"bindAddedWorkspaceItems":"x",void.class,false,ArrayList.class);
            singleLayer=method(type(loader,named?"com.android.launcher3.resource.ResourceManagerProxy":"com.android.launcher3.resource.g0"),named?"isSingleLayer":"M0",boolean.class,false);
            savedLocation=method(addTask,named?"useSavedLocation":"g",int[].class,false,controller,item,bg);
            Class<?> coordinateType=coordinates?type(loader,"com.android.launcher3.model.data.WorkspaceItemCoordinates"):null;
            Class<?> excludedType=coordinates?type(loader,"com.android.launcher3.util.IntSet"):null;
            coordinatesConstructor=coordinates?coordinateType.getDeclaredConstructor(int.class,int.class,int.class):null;
            excludedContains=coordinates?method(excludedType,"contains",boolean.class,false,int.class):null;
            finderIdp=coordinates?field(finder,"mIDP",type(loader,"com.android.launcher3.InvariantDeviceProfile"),false):null;
            firstCard=coordinates?method(finderIdp.getType(),"getBestieNeedCardPageScreen",boolean.class,false):null;
            findSpace=coordinates?method(finder,"findSpaceForItem",coordinateType,false,ArrayList.class,int.class,int.class,excludedType,boolean.class):named?method(finder,"findSpaceForItem",int[].class,false,state,bg,list,list,int.class,int.class,boolean.class)
                    :method(finder,"c",int[].class,false,list,list,int.class,int.class,boolean.class);
            vacant=coordinates?method(finder,"findNextAvailableIconSpaceInScreen",boolean.class,false,java.util.List.class,int.class,int.class,int.class,int.class,int[].class):named?method(finder,"findNextAvailableIconSpaceInScreen",boolean.class,false,state,ArrayList.class,int[].class,int.class,int.class)
                    :method(finder,"a",boolean.class,false,ArrayList.class,int[].class,int.class,int.class);
            controllerApp=named&&!coordinates?method(controller,"getApp",state,false):null;
            controllerContext=coordinates?method(controller,"getContext",Context.class,false):named?null:method(controller,"V",Context.class,false);
            stateContext=named?method(state,"getContext",Context.class,false):null;
            stateModel=named?method(state,"getModel",model,false):null;
            database=method(model,named?"getModelDbController":"m0",db,false);nextId=method(db,named?"getNewScreenId":"F",int.class,false);
            component=method(item,"getTargetComponent",ComponentName.class,false);
            layout=method(workspace,"onLayout",void.class,false,boolean.class,int.class,int.class,int.class,int.class);
            screenOrder=method(workspace,"getScreenOrder",list,false);listArray=method(list,named?"toArray":"A",int[].class,false);listAdd=method(list,named?"add":"m",void.class,false,int.class);
            listClear=method(list,"clear",void.class,false);
            operation=field(packageTask,coordinates?"mIsUpdate":named?"mOp":"a",coordinates?boolean.class:int.class,false);packageNames=field(packageTask,named?"mPackages":"c",coordinates?java.util.Set.class:String[].class,false);packageUser=field(packageTask,named?"mUser":"b",UserHandle.class,false);
            moveData=field(addTask,named?"isMoveDataFlag":"c",boolean.class,false);
            itemId=field(item,"id",int.class,false);itemType=field(item,"itemType",int.class,false);itemUser=field(item,"user",UserHandle.class,false);
            itemContainer=field(item,"container",int.class,false);itemScreen=field(item,"screenId",int.class,false);
            items=field(bg,named?"itemsIdMap":"a",null,false);
            if(!Iterable.class.isAssignableFrom(items.getType()))throw new IllegalStateException("新增应用占用表接口不匹配");
            finderData=coordinates?field(finder,"mDataModel",bg,false):named?null:field(finder,"a",bg,false);finderModel=coordinates?field(finder,"mModel",model,false):named?null:field(finder,"c",model,false);
            workspaceLauncher=field(workspace,named?"mLauncher":"x",launcher,false);
            Class<?> modelCallbacks=type(loader,named?"com.android.launcher3.ModelCallbacks":"com.android.launcher3.B4");
            bindingModel=coordinates?null:field(launcher,named?"mModelCallbacks":"h",modelCallbacks,false);
            firstScreen=coordinates?null:field(modelCallbacks,named?"isFirstPagePinnedItemEnabled":"j",boolean.class,false);
            vendorFirstScreen=coordinates?null:field(type(loader,named?"com.android.launcher3.Utilities":"com.android.launcher3.N5"),named?"SHOULD_SHOW_FIRST_PAGE_WIDGET":"j",boolean.class,true);
            futureId=named&&!coordinates?null:method(type(loader,"com.android.launcher3.widget.custom.future.AIFutureWidgetUtils"),coordinates?"getAIFutureScreenId":"l",int.class,true,Context.class);
        }
        Context context(Object controller)throws Exception{return (Context)(named&&!coordinates?stateContext.invoke(controllerApp.invoke(controller)):controllerContext.invoke(controller));}
        static Class<?> type(ClassLoader loader,String name)throws Exception{return Class.forName(name,false,loader);}
        static Method method(Class<?> owner,String name,Class<?> result,boolean isStatic,Class<?>...args)throws Exception{
            Method method=null;
            for(Class<?> at=owner;at!=null;at=at.getSuperclass())try{method=at.getDeclaredMethod(name,args);break;}catch(NoSuchMethodException absent){}
            if(method==null)throw new NoSuchMethodException(owner.getName()+"."+name);
            if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())!=isStatic||Modifier.isAbstract(method.getModifiers()))throw new IllegalStateException("新增应用方法接口不匹配："+name);
            method.setAccessible(true);return method;
        }
        static Field field(Class<?> owner,String name,Class<?> type,boolean isStatic)throws Exception{
            Field field=owner.getDeclaredField(name);
            if(type!=null&&field.getType()!=type||Modifier.isStatic(field.getModifiers())!=isStatic)throw new IllegalStateException("新增应用字段接口不匹配："+name);
            field.setAccessible(true);return field;
        }
    }
    private LauncherNewAppsLastPageHook(){}
}
