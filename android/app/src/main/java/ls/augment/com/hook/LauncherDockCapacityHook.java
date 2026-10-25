package ls.augment.com.hook;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import java.lang.ref.WeakReference;
import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.WeakHashMap;
import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;
import ls.augment.com.BuildConfig;
import ls.augment.com.LauncherOptions;

/** Remove the OEM count cap while retaining native drag, arrangement and database ownership. */
final class LauncherDockCapacityHook {
    static final String DIAGNOSTIC="ls_augment_launcher_dock_capacity_runtime";
    static final String ICON_DIAGNOSTIC="ls_augment_launcher_dock_icon_fit_runtime";
    static final String MIGRATION_DIAGNOSTIC="ls_augment_launcher_dock_migration_runtime";
    private static boolean installed;
    private static boolean installObserverRegistered;
    // Only the OEM divide animation needs an extra prospective slot. Measurement uses actual content count.
    private static final ThreadLocal<Boolean> EXPANDING=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Boolean> MEASURING=ThreadLocal.withInitial(()->false);
    private static final ThreadLocal<Boolean> FITTING=ThreadLocal.withInitial(()->false);
    // OEM folder sizing is gated by recent-app Dock support. Enable only its native
    // sizing/preview call, never the launcher-wide recent-app feature or layout.
    private static final ThreadLocal<Boolean> FOLDER_SIZING=ThreadLocal.withInitial(()->false);

    static synchronized void install(AugmentModule module,ClassLoader loader){
        if(installed)return;
        String stage="resolve_targets";
        try{
            Targets targets=Targets.resolve(loader);Controller controller=new Controller(module,targets);
            stage="register_hooks";
            installIconFit(module,controller);
            module.registerFeatureHook(module.prepareFeatureHook(targets.capacity,"launcher.dock.capacity",true).intercept(chain->{
                int nativeCount=(Integer)chain.proceed();controller.nativeCapacity=nativeCount;Context context=(Context)chain.getArg(0);
                try{
                    ViewGroup hotseat=controller.hotseat.get();int count=hotseat==null?0:controller.childCount(hotseat);
                    boolean enabled=FeatureSettings.enabled(context,LauncherOptions.DOCK_UNLIMITED);
                    int effective=Math.max(nativeCount,count);
                    if(enabled&&EXPANDING.get()&&!MEASURING.get()&&count<Integer.MAX_VALUE)effective=Math.max(effective,count+1);
                    controller.report(context,enabled,nativeCount,count,effective);return effective;
                }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_CAPACITY_READ",failure);return nativeCount;}
            }));
            for(Method method:new Method[]{targets.enter,targets.reset})
                module.registerFeatureHook(module.prepareFeatureHook(method,"launcher.dock.expand."+method.getName(),true).intercept(chain->{
                    try{
                        ViewGroup hotseat=(ViewGroup)targets.hotseat.invoke(targets.animationLauncher.get(chain.getThisObject()));
                        controller.hotseat=new WeakReference<>(hotseat);
                    }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_EXPANSION",failure);return chain.proceed();}
                    boolean before=EXPANDING.get();EXPANDING.set(true);
                    try{return chain.proceed();}finally{EXPANDING.set(before);}
                }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.measure,"launcher.dock.measure",true).intercept(chain->{
                if(!targets.hotseatType.isInstance(chain.getThisObject()))return chain.proceed();
                controller.hotseat=new WeakReference<>((ViewGroup)chain.getThisObject());
                boolean before=MEASURING.get();MEASURING.set(true);
                try{return chain.proceed();}finally{
                    MEASURING.set(before);controller.reportGeometrySafely((ViewGroup)chain.getThisObject());
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.bindCount,"launcher.dock.bind",true).intercept(chain->{
                ViewGroup dock=(ViewGroup)chain.getArg(0);controller.hotseat=new WeakReference<>(dock);
                int count=(Integer)chain.getArg(1),extent=controller.pendingExtent;
                ViewGroup children=(ViewGroup)targets.children.invoke(dock);
                for(int i=0;i<children.getChildCount();i++){
                    Object item=children.getChildAt(i).getTag();
                    if(targets.screen.getDeclaringClass().isInstance(item)&&targets.container.getInt(item)==-101){
                        int rank=targets.screen.getInt(item);
                        if(rank>=0&&(long)rank+1<=Runtime.getRuntime().maxMemory()/128)extent=Math.max(extent,rank+1);
                    }
                }
                // Binding is scheduled before the views exist. Retain the loaded rank
                // extent so a sparse stored item is not rejected by a count-only grid.
                Object result=chain.proceed(new Object[]{chain.getArg(0),Math.max(count,extent)});
                controller.pendingExtent=0;return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.migration,"launcher.dock.migration",true).intercept(chain->{
                // Grid migration runs before LoaderCursor, copying only as many saved Dock
                // items as DeviceGridState's OEM count (normally five). Protect that copy
                // independently of the feature switch and of initial configuration loading.
                // Only this native call's bounds grow; IDP, grid preferences and positions
                // remain owned by the native migration/writer.
                Object source=chain.getArg(targets.sourceReaderIndex),destination=chain.getArg(targets.destinationReaderIndex);
                Object[] args;
                try{
                    DockRows from=controller.savedDockRows(source),to=controller.savedDockRows(destination);
                    int sourceBound=(Integer)chain.getArg(targets.sourceBoundIndex);
                    int targetBound=(Integer)chain.getArg(targets.destinationBoundIndex);
                    long unionBound=from.database==to.database&&from.table.equals(to.table)
                            ?Math.max(from.count,to.count):(long)from.count+to.count;
                    int required=(int)Math.min(Integer.MAX_VALUE,Math.max(Math.max(sourceBound,targetBound),
                            Math.max(Math.max(from.extent,to.extent),unionBound)));
                    args=new Object[targets.migration.getParameterCount()];
                    for(int i=0;i<args.length;i++)args[i]=chain.getArg(i);
                    args[targets.sourceBoundIndex]=required;args[targets.destinationBoundIndex]=required;
                    controller.reportMigration(source,sourceBound,targetBound,from,to,required);
                }catch(Throwable failure){
                    // Do not swallow native migration failures or run a partially completed
                    // migration twice. Only preparation failures fall back to its original call.
                    module.logFeatureError("LAUNCHER_DOCK_MIGRATION_PREPARE",failure);
                    return chain.proceed();
                }
                return chain.proceed(args);
            }));
            module.registerFeatureHook(module.prepareFeatureHook(targets.placement,"launcher.dock.load",true).intercept(chain->{
                Object item=chain.getArg(0),cursor=chain.getThisObject(),idp;int nativeCount,required;
                int container;
                try{container=targets.container.getInt(item);}
                catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_LOAD_ITEM",failure);return chain.proceed();}
                if(container!=-101)return chain.proceed();
                try{
                    int rank=targets.screen.getInt(item);idp=targets.cursorIdp.get(cursor);nativeCount=targets.databaseCount.getInt(idp);
                    // A sparse rank outside this query must match the exact persisted item
                    // before allocating. Hidden/removed apps can leave gaps in native ranks.
                    int visibleRows=((Cursor)cursor).getCount();
                    // The priority loader filters hidden/options rows. Its getCount() is
                    // not the count of favorites: a stored sparse rank must not be marked
                    // "overlapping" and subsequently deleted merely by that filter.
                    if(rank<0)return false;
                    if(rank>=Math.max(nativeCount,visibleRows)&&!controller.isSavedDockItem(cursor,idp,item,rank))return false;
                    // Preserve an authenticated persisted row even if its damaged rank
                    // would require an unreasonable native dense array. Keep it in the
                    // model without allocating that array or returning the delete signal.
                    if((long)rank+1>Runtime.getRuntime().maxMemory()/128)
                        return controller.retainSparseRank(cursor,rank);
                    required=Math.max(nativeCount,rank+1);controller.growOccupancy(cursor,required);
                    targets.databaseCount.setInt(idp,required);
                }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_LOAD_PREPARE",failure);return chain.proceed();}
                // Retain already stored extra apps even when disabled. The temporary model bound never
                // changes DeviceGridState, native grid preferences or migration decisions.
                try{
                    Object accepted=chain.proceed();
                    if(Boolean.TRUE.equals(accepted))controller.pendingExtent=Math.max(controller.pendingExtent,required);
                    return accepted;
                }finally{targets.databaseCount.setInt(idp,nativeCount);}
            }));
            installed=true;publishInstallation(module,controller,null,"hooks_registered");
        }catch(Throwable failure){
            module.logFeatureError("LAUNCHER_DOCK_CAPACITY_INSTALL",failure);
            publishInstallation(module,null,failure,stage);
        }
    }

    /** Package-ready may precede the application Context; keep both success and
     * missing-interface evidence even when the feature switch remains off. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    // Injected host contract: no public SDK equivalent; retain runtime lookup and failure handling.
    //noinspection DiscouragedPrivateApi,PrivateApi
    private static void publishInstallation(AugmentModule module,Controller ready,Throwable failure,String stage){
        Context context=null;
        try{context=(Context)Class.forName("android.app.ActivityThread").getDeclaredMethod("currentApplication").invoke(null);}
        catch(ReflectiveOperationException|RuntimeException ignored){ }
        if(context!=null){publishInstallation(context,ready,failure,stage);return;}
        if(installObserverRegistered)return;
        try{
            Class<?> application=Class.forName("android.app.Application");
            Method created=Class.forName("android.app.Instrumentation").getDeclaredMethod("callApplicationOnCreate",application);
            module.registerFeatureHook(module.prepareFeatureHook(created,"launcher.dock.install_status",true).intercept(chain->{
                Object result=chain.proceed();publishInstallation((Context)chain.getArg(0),ready,failure,stage);return result;
            }));
            installObserverRegistered=true;
        }catch(ClassNotFoundException frameworkUnavailable){
            // Host contract fixtures need not provide Android's application lifecycle.
        }catch(ReflectiveOperationException|RuntimeException evidenceFailure){
            module.logFeatureError("LAUNCHER_DOCK_INSTALL_EVIDENCE",evidenceFailure);
        }
    }
    private static void publishInstallation(Context context,Controller ready,Throwable failure,String stage){
        if(ready!=null&&ready.executionObserved)return;
        try{FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject()
                .put("version",BuildConfig.VERSION_CODE).put("pid",android.os.Process.myPid())
                .put("adapter",ready==null?"none":ready.targets.adapter).put("supported",ready!=null)
                .put("state",ready==null?"unsupported":"registered")
                .put("stage",stage)
                .put("enabled",FeatureSettings.enabled(context,LauncherOptions.DOCK_UNLIMITED))
                .put("executionConfirmed",false)
                .put("missingInterfaces",failure==null?"":String.valueOf(failure.getMessage()))
                .put("errorClass",failure==null?"":failure.getClass().getSimpleName()).toString());
        }catch(Exception ignored){ }
    }

    private static void installIconFit(AugmentModule module,Controller controller){
        Targets t=controller.targets;
        module.registerFeatureHook(module.prepareFeatureHook(t.supportRecent,"launcher.dock.folder.size.scope",true).intercept(chain->
                FOLDER_SIZING.get()?true:chain.proceed()));
        for(Method measure:new Method[]{t.bubbleMeasure,t.folderMeasure})
            module.registerFeatureHook(module.prepareFeatureHook(measure,"launcher.dock.icon.measure."+measure.getDeclaringClass().getSimpleName(),true).intercept(chain->{
                View view=(View)chain.getThisObject();
                controller.fitSafely(view,View.MeasureSpec.getSize((Integer)chain.getArg(0)),View.MeasureSpec.getSize((Integer)chain.getArg(1)));
                Object result=chain.proceed();
                // Native measurement can adjust padding or the recent-Dock icon size.
                controller.fitSafely(view,view.getMeasuredWidth(),view.getMeasuredHeight());return result;
            }));
        for(Method setter:new Method[]{t.bubbleSetSize,t.bubbleSetSize3,t.folderSetSize,t.folderSetSize3})
            module.registerFeatureHook(module.prepareFeatureHook(setter,"launcher.dock.icon.size."+setter.getDeclaringClass().getSimpleName()+"."+setter.getParameterCount(),true).intercept(chain->{
                if(FITTING.get())return chain.proceed();
                View view=(View)chain.getThisObject();int requested=(Integer)chain.getArg(0),size=requested;
                try{size=controller.nativeSize(view,requested);}catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_ICON_SIZE",failure);}
                Object[] args=setter.getParameterCount()==1?new Object[]{size}:new Object[]{size,chain.getArg(1),chain.getArg(2)};
                boolean previous=FITTING.get(),folderPrevious=FOLDER_SIZING.get();FITTING.set(true);
                if(t.folderType.isInstance(view)&&controller.owningHotseat(view)!=null)FOLDER_SIZING.set(true);
                try{return chain.proceed(args);}finally{FOLDER_SIZING.set(folderPrevious);FITTING.set(previous);}
            }));
        for(Method drawables:new Method[]{t.bubbleApply,t.bubbleBoundsScale})
            module.registerFeatureHook(module.prepareFeatureHook(drawables,"launcher.dock.icon.bounds."+drawables.getName(),true).intercept(chain->{
                Object result=chain.proceed();
                try{controller.clampBounds((View)chain.getThisObject());}catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_ICON_BOUNDS",failure);}
                return result;
            }));
        module.registerFeatureHook(module.prepareFeatureHook(t.viewRemoved,"launcher.dock.icon.removed",true).intercept(chain->{
            Object result=chain.proceed();
            try{controller.restore((View)chain.getArg(0));}catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_ICON_RESTORE",failure);}
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(t.previewSetup,"launcher.dock.folder.preview",true).intercept(chain->{
            View view=(View)chain.getArg(2);boolean previous=FOLDER_SIZING.get();
            // The native setup reads FolderIcon.getIconSize() in this scoped branch,
            // then rebuilds its background and preview positions from that size.
            if(controller.folderFitted(view))FOLDER_SIZING.set(true);
            try{return chain.proceed();}finally{FOLDER_SIZING.set(previous);}
        }));
    }

    static final class Targets {
        final String adapter;final boolean named;final Class<?> hotseatType;
        final int sourceReaderIndex,destinationReaderIndex,sourceBoundIndex,destinationBoundIndex;
        final Method capacity,enter,reset,measure,bindCount,hotseat,children,placement,migration;
        final Class<?> bubbleType,folderType;
        final Method countX,countY,bubbleMeasure,folderMeasure,bubbleGetSize,folderGetSize,bubbleSetSize,folderSetSize,
                bubbleSetSize3,folderSetSize3,bubbleApply,bubbleBoundsScale,bubbleIcon,viewRemoved,previewSetup,supportRecent;
        final Field animationLauncher,cursorIdp,cursorContext,occupied,cells,databaseCount,databaseFile,favoritesTable,itemId,container,screen,readerDatabase,readerTable,readerContext;
        final Constructor<?> occupancy;
        static Targets resolve(ClassLoader loader)throws Exception{
            StringBuilder missing=new StringBuilder();Exception last=null;
            // F1/C2 are reused for unrelated synthetic classes on the July ROM.
            // Select a family only after its complete persistence and view contract resolves.
            for(int family:new int[]{3,2,1,0})try{return new Targets(loader,family);}
            catch(Exception failure){
                if(missing.length()>0)missing.append(" | ");missing.append(failure.getMessage());last=failure;
            }
            throw new IllegalStateException(missing.toString(),last);
        }

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Targets(ClassLoader loader,int family)throws Exception{
            named=family==0||family==3;boolean july=family==2,coordinates=family==3;
            sourceReaderIndex=coordinates?2:1;destinationReaderIndex=coordinates?3:2;
            sourceBoundIndex=coordinates?0:3;destinationBoundIndex=coordinates?1:named?3:4;
            adapter=coordinates?"named_workspace_data":july?"android16_h1_c1":named?"android15_named":"android16_obfuscated";
            String phase="profile_and_native_flow";
            try{
            Class<?> launcher=Class.forName(july?"com.android.launcher3.E2":named?"com.android.launcher3.Launcher":"com.android.launcher3.C2",false,loader);
            Class<?> idp=Class.forName(july?"com.android.launcher3.H1":named?"com.android.launcher3.InvariantDeviceProfile":"com.android.launcher3.F1",false,loader);
            Class<?> utils=Class.forName(july?"r1.f":named?"com.android.launcher3.hotseat.HotseatUtils":"p1.f",false,loader);
            Class<?> animation=Class.forName(july?"r1.a":named?"com.android.launcher3.hotseat.HotseatDivideAnimation":"p1.a",false,loader);
            Class<?> item=Class.forName(named?"com.android.launcher3.model.data.ItemInfo":"com.android.launcher3.model.data.y",false,loader);
            Class<?> cell=Class.forName("com.android.launcher3.CellLayout",false,loader);
            hotseatType=Class.forName("com.android.launcher3.Hotseat",false,loader);
            if(!ViewGroup.class.isAssignableFrom(hotseatType))throw new IllegalStateException("Dock容器接口不匹配");
            capacity=method(utils,named?"getNumHotseatIcons":"g",int.class,true,Context.class);
            bindCount=method(utils,named?"setHotseatCountXY":"A",void.class,true,hotseatType,int.class);
            enter=method(animation,named?"enterHotseatLayout":"c",void.class,false,cell,View.class,boolean.class);
            reset=method(animation,named?"resetHotseatChildPosition":"i",void.class,false,boolean.class);
            animationLauncher=field(animation,named?"mLauncher":"g",launcher);
            hotseat=method(launcher,july?"Y1":named?"getHotseat":"X1",hotseatType,false);
            children=cell.getDeclaredMethod("getShortcutsAndWidgets");children.setAccessible(true);
            if(!ViewGroup.class.isAssignableFrom(children.getReturnType())||Modifier.isStatic(children.getModifiers()))
                throw new IllegalStateException("Dock子项接口不匹配");
            measure=method(cell,"onMeasure",void.class,false,int.class,int.class);
            countX=method(cell,"getCountX",int.class,false);countY=method(cell,"getCountY",int.class,false);
            phase="icon_and_folder_geometry";
            bubbleType=Class.forName("com.android.launcher3.BubbleTextView",false,loader);
            folderType=Class.forName("com.android.launcher3.folder.FolderIcon",false,loader);
            if(!View.class.isAssignableFrom(bubbleType)||!ViewGroup.class.isAssignableFrom(folderType))
                throw new IllegalStateException("Dock图标控件接口不匹配");
            bubbleMeasure=method(bubbleType,"onMeasure",void.class,false,int.class,int.class);
            folderMeasure=method(folderType,"onMeasure",void.class,false,int.class,int.class);
            bubbleGetSize=method(bubbleType,"getIconSize",int.class,false);folderGetSize=method(folderType,"getIconSize",int.class,false);
            bubbleSetSize=method(bubbleType,"setIconSize",void.class,false,int.class);folderSetSize=method(folderType,"setIconSize",void.class,false,int.class);
            bubbleSetSize3=method(bubbleType,named?"setIconSize":"K0",void.class,false,int.class,int.class,int.class);
            folderSetSize3=method(folderType,named?"setIconSize":"k0",void.class,false,int.class,int.class,int.class);
            bubbleApply=method(bubbleType,named?"applyCompoundDrawables":"t",void.class,false,Drawable.class);
            bubbleBoundsScale=method(bubbleType,"setIconBoundsScale",void.class,false,float.class);
            bubbleIcon=bubbleType.getDeclaredMethod("getIcon");bubbleIcon.setAccessible(true);
            if(!Drawable.class.isAssignableFrom(bubbleIcon.getReturnType())||Modifier.isStatic(bubbleIcon.getModifiers()))
                throw new IllegalStateException("Dock图标Drawable接口不匹配");
            viewRemoved=method(children.getReturnType(),"onViewRemoved",void.class,false,View.class);
            Class<?> preview=Class.forName(named?"com.android.launcher3.folder.PreviewBackground":"com.android.launcher3.folder.u0",false,loader);
            Class<?> activity=Class.forName(named?"com.android.launcher3.views.ActivityContext":"com.android.launcher3.views.k",false,loader);
            previewSetup=method(preview,named?"setup":"Z0",void.class,false,Context.class,activity,View.class,int.class,int.class);
            Class<?> mfv=Class.forName(july?"z1.Q":named?"com.android.launcher3.mfvUtil.MFVUtils":"x1.O",false,loader);
            supportRecent=method(mfv,july?"M3":named?"isSupportHotseatRecent":"C3",boolean.class,true);
            phase="saved_items_loader";
            Class<?> cursor=Class.forName(july?"C1.y1":named?"com.android.launcher3.model.LoaderCursor":"z1.y1",false,loader);
            if(!Cursor.class.isAssignableFrom(cursor))throw new IllegalStateException("Dock原生游标接口不匹配");
            Class<?> grid=Class.forName(july?"com.android.launcher3.util.u0":named?"com.android.launcher3.util.GridOccupancy":"com.android.launcher3.util.t0",false,loader);
            placement=coordinates?method(cursor,"checkItemPlacement",boolean.class,false,item):method(cursor,named?"checkItemPlacement":"e",boolean.class,false,item,boolean.class);
            cursorIdp=field(cursor,coordinates?"idp":named?"mIDP":"l",idp);occupied=field(cursor,coordinates?"occupied":named?"mOccupied":"p",null);
            if(!SparseArray.class.isAssignableFrom(occupied.getType()))throw new IllegalStateException("Dock加载占用表接口不匹配");
            cells=field(grid,named?"cells":"c",boolean[][].class);
            occupancy=grid.getDeclaredConstructor(int.class,int.class);occupancy.setAccessible(true);
            databaseCount=field(idp,july?"i1":named?"numDatabaseHotseatIcons":"e1",int.class);
            if(Modifier.isFinal(databaseCount.getModifiers()))throw new IllegalStateException("Dock模型边界不可调整");
            container=field(item,"container",int.class);screen=field(item,"screenId",int.class);
            itemId=field(item,"id",null);
            if(itemId.getType()!=int.class&&itemId.getType()!=long.class)throw new IllegalStateException("Dock项目身份接口不匹配");
            cursorContext=field(cursor,coordinates?"context":named?"mContext":"h",Context.class);
            databaseFile=field(idp,july?"I1":named?"dbFile":"E1",String.class);
            Class<?> favorites=Class.forName(july?"com.android.launcher3.Y3":named?"com.android.launcher3.LauncherSettings$Favorites":"com.android.launcher3.S3",false,loader);
            favoritesTable=favorites.getDeclaredField(named?"TABLE_NAME":"a");favoritesTable.setAccessible(true);
            if(favoritesTable.getType()!=String.class||!Modifier.isStatic(favoritesTable.getModifiers()))
                throw new IllegalStateException("Dock原生数据表接口不匹配");
            phase="native_database_migration";
            Class<?> migrationType=Class.forName(coordinates?"com.android.launcher3.model.GridSizeMigrationLogic":july?"C1.i1":named?"com.android.launcher3.model.GridSizeMigrationUtil":"z1.i1",false,loader);
            Class<?> reader=Class.forName(coordinates?"com.android.launcher3.model.DbReader":july?"C1.i1$a":named?"com.android.launcher3.model.GridSizeMigrationUtil$DbReader":"z1.i1$a",false,loader);
            Class<?> helper=Class.forName(july?"C1.I0":named?"com.android.launcher3.model.DatabaseHelper":"z1.I0",false,loader);
            Class<?> state=Class.forName(july?"C1.L0":named?"com.android.launcher3.model.DeviceGridState":"z1.L0",false,loader);
            migration=coordinates?method(migrationType,"migrateHotseat",void.class,false,int.class,int.class,reader,reader,helper,java.util.List.class)
                    :named?method(migrationType,"migrate",boolean.class,true,helper,reader,reader,int.class,Point.class,state,state)
                    :method(migrationType,"t",boolean.class,true,helper,reader,reader,int.class,int.class,Point.class,state,state);
            readerDatabase=field(reader,named?"mDb":"a",SQLiteDatabase.class);
            readerTable=field(reader,named?"mTableName":"b",String.class);
            readerContext=field(reader,named?"mContext":"c",Context.class);
            }catch(Exception failure){
                throw new IllegalStateException(adapter+";stage="+phase+";missing="+failure.getClass().getSimpleName()+":"+failure.getMessage(),failure);
            }
        }
        static Method method(Class<?> owner,String name,Class<?> result,boolean isStatic,Class<?>...args)throws Exception{
            Method method=owner.getDeclaredMethod(name,args);
            if(method.getReturnType()!=result||Modifier.isStatic(method.getModifiers())!=isStatic||Modifier.isAbstract(method.getModifiers()))
                throw new IllegalStateException("Dock方法接口不匹配："+name);
            method.setAccessible(true);return method;
        }
        static Field field(Class<?> owner,String name,Class<?> type)throws Exception{
            Field field=owner.getDeclaredField(name);
            if(type!=null&&field.getType()!=type||Modifier.isStatic(field.getModifiers()))throw new IllegalStateException("Dock字段接口不匹配："+name);
            field.setAccessible(true);return field;
        }
    }
    static final class Controller {
        final AugmentModule module;final Targets targets;WeakReference<ViewGroup> hotseat=new WeakReference<>(null);String lastReport="";
        final WeakHashMap<View,IconState> icons=new WeakHashMap<>();int nativeCapacity;volatile int pendingExtent;String lastGeometry="";
        final WeakHashMap<Object,Map<Long,Integer>> storedItems=new WeakHashMap<>();
        final WeakHashMap<Object,Set<Integer>> sparseRanks=new WeakHashMap<>();
        volatile boolean executionObserved;
        Controller(AugmentModule module,Targets targets){this.module=module;this.targets=targets;}
        boolean isSavedDockItem(Object loader,Object idp,Object item,int rank)throws Exception{
            synchronized(storedItems){
                Map<Long,Integer> cached=storedItems.get(loader);
                if(cached!=null)return Integer.valueOf(rank).equals(cached.get(((Number)targets.itemId.get(item)).longValue()));
                Cursor loading=(Cursor)loader;Context context=(Context)targets.cursorContext.get(loader);
                String name=loading.getExtras().getString("db_name",(String)targets.databaseFile.get(idp));
                String table=(String)targets.favoritesTable.get(null);
                if(name==null||!name.matches("[A-Za-z0-9_\\-]+\\.db")||table==null||!table.matches("[A-Za-z_][A-Za-z0-9_]*"))
                    throw new IllegalStateException("Dock加载数据库接口不匹配");
                File file=context.getDatabasePath(name);
                if(!file.isFile())throw new IllegalStateException("Dock加载数据库尚未就绪");
                try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getAbsolutePath(),null,SQLiteDatabase.OPEN_READONLY);
                    Cursor rows=db.rawQuery("SELECT _id,screen FROM \""+table+"\" WHERE container=-101",null)){
                    cached=new HashMap<>();while(rows.moveToNext())cached.put(rows.getLong(0),rows.getInt(1));
                    storedItems.put(loader,cached);
                    return Integer.valueOf(rank).equals(cached.get(((Number)targets.itemId.get(item)).longValue()));
                }
            }
        }
        boolean retainSparseRank(Object loader,int rank)throws Exception{
            synchronized(sparseRanks){
                boolean retained=sparseRanks.computeIfAbsent(loader,key->new HashSet<>()).add(rank);
                FeatureSettings.diagnostic((Context)targets.cursorContext.get(loader),MIGRATION_DIAGNOSTIC,new JSONObject()
                        .put("version",BuildConfig.VERSION_CODE).put("pid",android.os.Process.myPid()).put("adapter",targets.adapter)
                        .put("state","stored_rank_outside_dense_memory_budget").put("storedItemRetained",retained)
                        .put("nativeGridPreferencesChanged",false).toString());
                return retained;
            }
        }
        DockRows savedDockRows(Object reader)throws Exception{
            SQLiteDatabase db=(SQLiteDatabase)targets.readerDatabase.get(reader);
            String table=(String)targets.readerTable.get(reader);
            if(table==null||!table.matches("[A-Za-z_][A-Za-z0-9_]*"))throw new IllegalStateException("Dock迁移表名接口不匹配");
            String quoted="\""+table+"\"";DockRows rows=new DockRows();rows.database=db;rows.table=table;
            // Read the transaction's actual source/destination tables. The bound derives
            // from stored rows, not a cached configuration or a fixed artificial app cap.
            try(Cursor cursor=db.rawQuery("SELECT screen FROM "+quoted+" WHERE container=-101",null)){
                while(cursor.moveToNext()){
                    long rank=cursor.getLong(0);
                    if(rank<0||rank>=Integer.MAX_VALUE)continue;
                    rows.count++;
                    if(rank+1<=Runtime.getRuntime().maxMemory()/128)rows.extent=Math.max(rows.extent,(int)rank+1);
                    else rows.sparse=true;
                }
            }
            return rows;
        }
        void reportMigration(Object reader,int sourceBound,int targetBound,DockRows source,DockRows target,int required){
            try{FeatureSettings.diagnostic((Context)targets.readerContext.get(reader),MIGRATION_DIAGNOSTIC,new JSONObject()
                    .put("version",BuildConfig.VERSION_CODE).put("pid",android.os.Process.myPid()).put("adapter",targets.adapter)
                    .put("sourceCount",source.count).put("targetCount",target.count).put("sourceExtent",source.extent).put("targetExtent",target.extent)
                    .put("nativeSourceCapacity",sourceBound).put("nativeTargetCapacity",targetBound).put("temporaryCapacity",required)
                    .put("sourceRankOutsideDenseMemoryBudget",source.sparse).put("targetRankOutsideDenseMemoryBudget",target.sparse)
                    .put("preserveExistingWhenDisabled",true).put("nativeGridPreferencesChanged",false).toString());
            }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_MIGRATION_EVIDENCE",failure);}
        }
        int childCount(ViewGroup hotseat)throws Exception{return ((ViewGroup)targets.children.invoke(hotseat)).getChildCount();}
        ViewGroup owningHotseat(View view){
            // Only direct Dock items. Folder names/contents and workspace shortcuts
            // also use BubbleTextView and must retain their own native sizes.
            ViewParent parent=view.getParent();if(!(parent instanceof ViewGroup))return null;
            ViewParent owner=parent.getParent();return targets.hotseatType.isInstance(owner)?(ViewGroup)owner:null;
        }
        boolean folderFitted(View view){IconState state=icons.get(view);return targets.folderType.isInstance(view)&&state!=null&&state.applied<state.original&&owningHotseat(view)!=null;}
        boolean supportedIcon(View view){return targets.bubbleType.isInstance(view)||targets.folderType.isInstance(view);}
        int iconSize(View view)throws Exception{return (Integer)(targets.folderType.isInstance(view)?targets.folderGetSize:targets.bubbleGetSize).invoke(view);}
        IconState state(View view)throws Exception{
            int current=iconSize(view);IconState state=icons.get(view);
            if(state==null){state=new IconState(current);icons.put(view,state);}
            else if(current!=state.applied&&current>0){state.original=current;state.applied=current;}
            return state;
        }
        void fitSafely(View view,int width,int height){
            if(!supportedIcon(view)||FITTING.get())return;
            try{
                ViewGroup dock=owningHotseat(view);if(dock==null){restore(view);return;}
                IconState state=state(view);state.width=width;state.height=height;
                apply(view,state,fittedSize(view,dock,state,state.original));
            }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_ICON_FIT",failure);}
        }
        int nativeSize(View view,int requested)throws Exception{
            IconState state=icons.get(view);ViewGroup dock=owningHotseat(view);
            if(dock==null){icons.remove(view);return requested;}
            if(state==null)state=state(view);state.original=requested;
            int result=fittedSize(view,dock,state,requested);state.applied=result;return result;
        }
        int fittedSize(View view,ViewGroup dock,IconState state,int original)throws Exception{
            if(original<=0)return original;
            int x=(Integer)targets.countX.invoke(dock),y=(Integer)targets.countY.invoke(dock);
            ViewGroup content=(ViewGroup)targets.children.invoke(dock);
            boolean vertical=y>x;int count=Math.max(content.getChildCount(),Math.max(x,y));
            int capacity=(Integer)targets.capacity.invoke(null,dock.getContext());
            int nativeCount=nativeCapacity>0?nativeCapacity:capacity;
            // Disabled with saved extra items still needs readable icons. Once the
            // count returns to the native capacity the native icon size is restored.
            if(!FeatureSettings.enabled(dock.getContext(),LauncherOptions.DOCK_UNLIMITED)&&count<=nativeCount)return original;
            int width=state.width>0?state.width:view.getMeasuredWidth(),height=state.height>0?state.height:view.getMeasuredHeight();
            int extent=vertical?content.getMeasuredHeight()-content.getPaddingTop()-content.getPaddingBottom()
                    :content.getMeasuredWidth()-content.getPaddingLeft()-content.getPaddingRight();
            int slot=extent>0&&count>0?extent/count:vertical?height:width;
            if(slot<=0||width<=0||height<=0)return original;
            // Reserve proportional breathing room and native press/reorder animation
            // headroom; never enlarge an icon or scale the touch/drag View itself.
            int widthSpace=Math.max(1,width-view.getPaddingLeft()-view.getPaddingRight());
            int heightSpace=Math.max(1,height-view.getPaddingTop()-view.getPaddingBottom());
            return Math.max(1,Math.min(original,Math.min((int)Math.floor(slot*0.84f),Math.min(widthSpace,heightSpace))));
        }
        void apply(View view,IconState state,int size)throws Exception{
            if(iconSize(view)==size){state.applied=size;return;}
            boolean previous=FITTING.get(),folderPrevious=FOLDER_SIZING.get();FITTING.set(true);
            if(targets.folderType.isInstance(view))FOLDER_SIZING.set(true);
            try{
                (targets.folderType.isInstance(view)?targets.folderSetSize:targets.bubbleSetSize).invoke(view,size);
                state.applied=size;view.invalidate();
            }finally{FOLDER_SIZING.set(folderPrevious);FITTING.set(previous);}
        }
        void restore(View view)throws Exception{
            IconState state=icons.remove(view);if(state!=null&&supportedIcon(view))apply(view,state,state.original);
        }
        void clampBounds(View view)throws Exception{
            if(!targets.bubbleType.isInstance(view)||owningHotseat(view)==null)return;
            IconState state=icons.get(view);if(state==null||state.applied>=state.original)return;
            Drawable icon=(Drawable)targets.bubbleIcon.invoke(view);if(icon==null)return;Rect bounds=icon.getBounds();
            int side=Math.max(1,Math.min(state.applied,Math.min(bounds.width(),bounds.height())));
            // Compound drawables are centered by their own width. Keeping an inset
            // from the OEM default size would shift the already fitted image again.
            if(bounds.left==0&&bounds.top==0&&bounds.width()==side&&bounds.height()==side)return;
            icon.setBounds(0,0,side,side);view.invalidate();
        }
        void reportGeometrySafely(ViewGroup dock){
            try{
                ViewGroup content=(ViewGroup)targets.children.invoke(dock);int x=Math.max(1,(Integer)targets.countX.invoke(dock));
                int y=Math.max(1,(Integer)targets.countY.invoke(dock));
                int width=content.getMeasuredWidth()-content.getPaddingLeft()-content.getPaddingRight();
                int height=content.getMeasuredHeight()-content.getPaddingTop()-content.getPaddingBottom();
                JSONArray items=new JSONArray();
                for(int i=0;i<content.getChildCount();i++){
                    View view=content.getChildAt(i);if(!supportedIcon(view))continue;IconState state=icons.get(view);
                    int size=iconSize(view);JSONObject item=new JSONObject().put("index",i)
                            .put("kind",targets.folderType.isInstance(view)?"folder":"application")
                            .put("nativeSize",state==null?size:state.original).put("iconSize",size)
                            .put("measuredWidth",view.getMeasuredWidth()).put("measuredHeight",view.getMeasuredHeight());
                    if(targets.bubbleType.isInstance(view)){
                        Drawable icon=(Drawable)targets.bubbleIcon.invoke(view);
                        if(icon!=null)item.put("drawableWidth",icon.getBounds().width()).put("drawableHeight",icon.getBounds().height());
                    }
                    items.put(item);
                }
                JSONObject geometry=new JSONObject().put("childCount",content.getChildCount()).put("countX",x).put("countY",y)
                        .put("availableWidth",width).put("availableHeight",height).put("slotWidth",width/x).put("slotHeight",height/y)
                        .put("items",items);String signature=geometry.toString();if(signature.equals(lastGeometry))return;lastGeometry=signature;
                FeatureSettings.diagnostic(dock.getContext(),ICON_DIAGNOSTIC,geometry.put("version",BuildConfig.VERSION_CODE)
                        .put("pid",android.os.Process.myPid()).put("adapter",targets.adapter).put("nativeTouchBounds",true)
                        .put("nativeFolderPreview",true).toString());
            }catch(Throwable failure){module.logFeatureError("LAUNCHER_DOCK_ICON_EVIDENCE",failure);}
        }
        @SuppressWarnings("unchecked") void growOccupancy(Object cursor,int required)throws Exception{
            SparseArray<Object> occupied=(SparseArray<Object>)targets.occupied.get(cursor);Object prior=occupied.get(-101);
            if(prior==null)return;
            boolean[][] cells=(boolean[][])targets.cells.get(prior);if(cells.length>=required)return;
            Object grown=targets.occupancy.newInstance(required,1);boolean[][] next=(boolean[][])targets.cells.get(grown);
            for(int i=0;i<cells.length;i++)if(cells[i].length>0)next[i][0]=cells[i][0];
            occupied.put(-101,grown);
        }
        void report(Context context,boolean enabled,int nativeCount,int count,int effective){
            executionObserved=true;
            String state=enabled+":"+nativeCount+":"+count+":"+effective;if(state.equals(lastReport))return;lastReport=state;
            try{FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject().put("version",BuildConfig.VERSION_CODE)
                    .put("pid",android.os.Process.myPid()).put("adapter",targets.adapter).put("supported",true)
                    .put("enabled",enabled).put("state",enabled?"active":count>nativeCount?"retained":"native")
                    .put("stage","capacity_callback").put("executionConfirmed",true)
                    .put("nativeCount",nativeCount).put("childCount",count).put("effectiveCapacity",effective)
                    .put("dynamicCapacity",true).put("nativePlacementAndPersistence",true).toString());
            }catch(Exception failure){module.logFeatureError("LAUNCHER_DOCK_CAPACITY_EVIDENCE",failure);}
        }
    }
    static final class DockRows {SQLiteDatabase database;String table;int count,extent;boolean sparse;}
    static final class IconState {
        int original,applied,width,height;IconState(int original){this.original=original;this.applied=original;}
    }
    private LauncherDockCapacityHook(){}
}
