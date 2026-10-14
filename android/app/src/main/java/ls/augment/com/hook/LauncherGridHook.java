package ls.augment.com.hook;

import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Point;
import android.view.View;
import android.view.ViewGroup;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashSet;
import java.util.Set;
import java.util.LinkedHashMap;
import java.util.WeakHashMap;
import java.util.Collections;
import org.json.JSONObject;
import ls.augment.com.BuildConfig;
import ls.augment.com.LauncherGridSafety;
import ls.augment.com.LauncherGridSpec;
import ls.augment.com.LauncherGridMigrationCheck;

/** RedMagic DesktopGrid adapter. The OEM model writer owns every placement update.
 * No database names, item identities, widget IDs, folder contents or native grid preferences change.
 */
final class LauncherGridHook {
    static final String DIAGNOSTIC = "ls_augment_launcher_grid_runtime";
    private static boolean installed;
    private static boolean installObserverRegistered;
    private static volatile Controller controller;
    private static final ThreadLocal<Boolean> FITTING=ThreadLocal.withInitial(()->false);

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Targets t = new Targets(loader);
            Controller c = new Controller(module,t);
            // r() is called while IDP is being built, before DeviceProfiles and loader occupancy maps.
            module.registerFeatureHook(module.prepareFeatureHook(t.setGrid,"launcher.grid.profile",true).intercept(chain -> {
                if(!c.ready)return chain.proceed();
                Context context = (Context)chain.getArg(1);
                int rows=(Integer)chain.getArg(2), cols=(Integer)chain.getArg(3);
                c.configure(context,chain.getThisObject(),chain.getArg(0),rows,cols);
                Object result=c.owns?chain.proceed(new Object[]{chain.getArg(0),context,c.rows,c.cols}):chain.proceed();
                if(c.storageUnavailable)c.t.resizing.setBoolean(chain.getThisObject(),false);
                c.profile=chain.getArg(0);
                c.report(false);
                return result;
            }));
            // OEM constructors and rotation code consult all three getters after r().
            for (Method getter : new Method[]{t.getPoint,t.getRawPoint,t.getEncoded})
                module.registerFeatureHook(module.prepareFeatureHook(getter,"launcher.grid."+getter.getName(),true).intercept(chain -> {
                    if (!c.owns) return chain.proceed();
                    return getter.getReturnType()==int.class ? (c.rows<<4)+c.cols : new Point(c.rows,c.cols);
                }));
            module.registerFeatureHook(module.prepareFeatureHook(t.placeItem,"launcher.grid.place",true).intercept(chain -> {
                if (!c.owns || !t.resizing.getBoolean(chain.getThisObject())) return chain.proceed();
                Object item=chain.getArg(2);
                boolean accepted=preservePlacement(chain.getThisObject(),item,chain.getArg(3),c.rows,c.cols,t);
                if(accepted){
                    if(c.loadingItems.isEmpty())c.migratedRows=null;
                    c.loadingItems.put(t.itemId.getLong(item),item);
                }
                return accepted;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.repack,"launcher.grid.repack",true).intercept(chain -> {
                if (!c.owns) return chain.proceed();
                // The true branch allocates as many overflow pages as necessary. The false OEM branch
                // can allocate only one overflow page for each source screen.
                Object result=chain.proceed(new Object[]{chain.getArg(0),chain.getArg(1),chain.getArg(2),true});
                c.freezeMigration();
                c.repacked=true;
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.finished,"launcher.grid.bound",true).intercept(chain -> {
                Object result=chain.proceed();
                c.bound(chain.getThisObject());
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.drawerMetrics,"launcher.grid.drawerMetrics",true).intercept(chain -> {
                Object dp=chain.getThisObject();Glyphs nativeGlyphs=c.glyphs.get(dp);
                if(!c.owns||nativeGlyphs==null||!t.currentProfile(dp,c.profile)||!nativeGlyphs.matches(t,dp))return chain.proceed();
                int icon=t.iconSize.getInt(dp),text=t.textSize.getInt(dp),gap=t.iconGap.getInt(dp);
                // X3.F copies workspace B1/C1/D1 into all-apps J2/N2/K2 and derives drawer geometry.
                // Let that native calculation see its original glyph metrics, then restore the workspace.
                try{
                    t.iconSize.setInt(dp,nativeGlyphs.icon);t.textSize.setInt(dp,nativeGlyphs.text);t.iconGap.setInt(dp,nativeGlyphs.gap);
                    return chain.proceed();
                }finally{t.iconSize.setInt(dp,icon);t.textSize.setInt(dp,text);t.iconGap.setInt(dp,gap);}
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.metrics,"launcher.grid.iconFit",true).intercept(chain -> {
                Object result=chain.proceed();
                if(c.owns&&!FITTING.get()&&t.currentProfile(chain.getThisObject(),c.profile)
                        &&!t.scalable.getBoolean(chain.getThisObject())&&!t.responsive.getBoolean(chain.getThisObject())){
                    Object dp=chain.getThisObject();Context context=(Context)chain.getArg(1);
                    Point cell=(Point)t.cellSize.invoke(dp);
                    LauncherGridIconFit.Fit fit=LauncherGridIconFit.fit(t.iconSize.getInt(dp),t.textSize.getInt(dp),
                            t.iconGap.getInt(dp),cell.x,cell.y,context.getResources().getDisplayMetrics().density);
                    if(fit.icon!=t.iconSize.getInt(dp)||fit.text!=t.textSize.getInt(dp)){
                        Glyphs nativeGlyphs=c.glyphs.get(dp);
                        if(nativeGlyphs==null||!nativeGlyphs.matches(t,dp))
                            nativeGlyphs=new Glyphs(t.iconSize.getInt(dp),t.textSize.getInt(dp),t.iconGap.getInt(dp));
                        nativeGlyphs.fittedIcon=fit.icon;nativeGlyphs.fittedText=fit.text;c.glyphs.put(dp,nativeGlyphs);
                        t.iconSize.setInt(dp,fit.icon);t.textSize.setInt(dp,fit.text);
                        // Re-run native spacing, folder/drop target and drag geometry with these native sizes.
                        // drawerMetrics keeps the OEM all-apps calculation on its original inputs.
                        FITTING.set(true);
                        try{t.metrics.invoke(dp,chain.getArg(0),context);}finally{FITTING.set(false);}
                    }else{
                        Glyphs prior=c.glyphs.get(dp);
                        if(prior!=null&&!prior.matches(t,dp))c.glyphs.remove(dp);
                    }
                }
                return result;
            }));
            if(t.glyphMetrics!=null)module.registerFeatureHook(module.prepareFeatureHook(t.glyphMetrics,"launcher.grid.nativeGlyphs",true).intercept(chain->{
                Object dp=chain.getArg(0);Glyphs original=c.glyphs.get(dp);
                if(!c.owns||original==null||!t.currentProfile(dp,c.profile)
                        ||t.scalable.getBoolean(dp)||t.responsive.getBoolean(dp))return chain.proceed();
                // The named OEM helper resets label size from IDP on every call. Ordinary
                // refreshes must start with native inputs; our second pass must retain the
                // fitted inputs before native folder, drag and drawer geometry is derived.
                if(!FITTING.get()){
                    if(original.matches(t,dp)){
                        // Fitting never changes the gap. Retain a native gap-only style
                        // update so this refresh can capture and fit the new style.
                        t.iconSize.setInt(dp,original.icon);t.textSize.setInt(dp,original.text);
                    }
                    return chain.proceed();
                }
                try{return chain.proceed();}
                finally{t.iconSize.setInt(dp,original.fittedIcon);t.textSize.setInt(dp,original.fittedText);}
            }));
            controller=c; installed=true;c.ready=true;
            publishInstallation(FeatureSettings.from(null),c,null);
        } catch (Throwable failure) {
            module.logFeatureError("LAUNCHER_GRID_INSTALL",failure);
            publishInstallation(FeatureSettings.from(null),null,failure);
            // Package-ready can precede the application Context. Preserve installation
            // evidence in the same process once that Context exists, without touching data.
            if(!installObserverRegistered)try{
                Method created=Instrumentation.class.getDeclaredMethod("callApplicationOnCreate",Application.class);
                module.registerFeatureHook(module.prepareFeatureHook(created,"launcher.grid.install_status",true).intercept(chain->{
                    Object result=chain.proceed();Controller current=controller;
                    if(current==null||!current.decided)publishInstallation((Application)chain.getArg(0),current,failure);
                    return result;
                }));
                installObserverRegistered=true;
            }catch(Throwable evidenceFailure){module.logFeatureError("LAUNCHER_GRID_INSTALL_EVIDENCE",evidenceFailure);}
        }
    }

    private static void publishInstallation(Context context,Controller ready,Throwable failure){
        if(context==null||ready!=null&&ready.decided)return;
        try{FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject()
                .put("version",BuildConfig.VERSION_CODE).put("pid",android.os.Process.myPid())
                .put("adapter",ready==null?"none":ready.t.adapter).put("supported",ready!=null)
                .put("state",ready==null?"unsupported":"registered").put("bound",false)
                .put("error",ready==null?"当前桌面缺少兼容布局接口":"")
                .put("errorClass",ready!=null||failure==null?"":failure.getClass().getSimpleName()).toString());
        }catch(Exception ignored){ }
    }

    static final class Glyphs {
        final int icon,text,gap;int fittedIcon,fittedText;
        Glyphs(int icon,int text,int gap){this.icon=icon;this.text=text;this.gap=gap;}
        boolean matches(Targets t,Object dp)throws Exception{return t.iconSize.getInt(dp)==fittedIcon&&t.textSize.getInt(dp)==fittedText;}
    }

    /** Keep valid coordinates; queue overflow with the complete original span for OEM pagination.
     * Unlike DesktopGrid.u(), this never changes a widget's span based on a theme provider.
     */
    @SuppressWarnings("unchecked")
    static boolean preservePlacement(Object desktop,Object item,Object occupancy,int rows,int cols,Targets t) throws Exception {
        if(t.container.getInt(item)!=-100)return false;
        int x=t.cellX.getInt(item), y=t.cellY.getInt(item), sx=t.spanX.getInt(item), sy=t.spanY.getInt(item);
        if(sx<1||sy<1||sx>cols||sy>rows)
            throw new IllegalStateException("桌面项目占用在迁移中改变，已停止重排");
        if(x>=0&&y>=0&&(long)x+sx<=cols&&(long)y+sy<=rows
                &&(Boolean)t.vacant.invoke(occupancy,x,y,sx,sy)) {
            t.mark.invoke(occupancy,item,true); return true;
        }
        Map<Integer,ArrayList<Object>> pending=(Map<Integer,ArrayList<Object>>)t.pending.get(desktop);
        int screen=t.screen.getInt(item);
        ArrayList<Object> items=pending.get(screen);
        if(items==null){items=new ArrayList<>();pending.put(screen,items);}
        if(!items.contains(item))items.add(item);
        return true;
    }

    static final class Targets {
        final String adapter;
        final Method setGrid,getPoint,getRawPoint,getEncoded,placeItem,repack,finished,workspace,getCountX,getCountY;
        final Method vacant,mark,metrics,drawerMetrics,cellSize,deviceProfile,glyphMetrics;
        final Field dpIdp;
        final Field iconSize,textSize,iconGap,scalable,responsive;
        final Field resizing,pending,container,cellX,cellY,spanX,spanY,screen,itemId,idpRows,idpCols,dbFile;
        Targets(ClassLoader loader) throws Exception {
            Class<?> desktop;boolean named;
            try{desktop=Class.forName("com.android.launcher3.b0",false,loader);named=false;}
            catch(ClassNotFoundException absent){desktop=Class.forName("com.android.launcher3.DesktopGrid",false,loader);named=true;}
            adapter=named?"android15_named":"android16_obfuscated";
            // Resolve one complete, verified ROM contract before any grid hook is registered.
            // A changed member must not fall back to a mixture of the two class families.
            Class<?> idp=Class.forName(named?"com.android.launcher3.InvariantDeviceProfile":"com.android.launcher3.F1",false,loader);
            Class<?> item=Class.forName(named?"com.android.launcher3.model.data.ItemInfo":"com.android.launcher3.model.data.y",false,loader);
            Class<?> occupied=Class.forName(named?"com.android.launcher3.util.GridOccupancy":"com.android.launcher3.util.t0",false,loader);
            Class<?> model=Class.forName(named?"com.android.launcher3.model.BgDataModel":"z1.y0",false,loader);
            Class<?> launcher=Class.forName(named?"com.android.launcher3.Launcher":"com.android.launcher3.C2",false,loader);
            Class<?> cell=Class.forName("com.android.launcher3.CellLayout",false,loader);
            Class<?> dp=Class.forName(named?"com.android.launcher3.DeviceProfile":"com.android.launcher3.h0",false,loader);
            Class<?> ws=Class.forName("com.android.launcher3.Workspace",false,loader);
            if(!ViewGroup.class.isAssignableFrom(cell)||!ViewGroup.class.isAssignableFrom(ws))throw new IllegalStateException("桌面容器接口不匹配");
            metrics=method(dp,named?"updateIconSize":"p1",void.class,float.class,Context.class);
            drawerMetrics=method(dp,named?"updateAllAppsContainerWidth":"h1",void.class,Context.class);
            cellSize=method(dp,named?"getCellSize":"k0",Point.class);deviceProfile=method(cell,"getDeviceProfile",dp);
            iconSize=writable(field(dp,named?"iconSizePx":"B1",int.class));
            textSize=writable(field(dp,named?"iconTextSizePx":"C1",int.class));
            iconGap=writable(field(dp,named?"iconDrawablePaddingPx":"D1",int.class));
            scalable=field(dp,named?"mIsScalableGrid":"Z0",boolean.class);responsive=field(dp,named?"mIsResponsiveGrid":"b1",boolean.class);
            setGrid=method(desktop,named?"setGridSize":"r",void.class,idp,Context.class,int.class,int.class);
            getPoint=method(desktop,named?"getGridNumOfRowsAndColumns":"i",Point.class,Context.class);
            getRawPoint=method(desktop,named?"getRowsAndColumnsFromInt":"k",Point.class,Context.class);
            getEncoded=method(desktop,named?"getGridNumOfRowsAndColumnsInt":"j",int.class,Context.class);
            placeItem=method(desktop,named?"updateGridData":"u",boolean.class,Context.class,idp,item,occupied);
            repack=method(desktop,named?"doReGridData":"g",void.class,idp,model,Context.class,boolean.class);
            resizing=writable(field(desktop,named?"mShouldResize":"d",boolean.class));pending=field(desktop,named?"mResizeGridMap":"a");
            vacant=method(occupied,named?"isRegionVacant":"d",boolean.class,int.class,int.class,int.class,int.class);
            mark=method(occupied,named?"markCells":"g",void.class,item,boolean.class);
            container=field(item,"container",int.class);cellX=field(item,"cellX",int.class);cellY=field(item,"cellY",int.class);
            spanX=field(item,"spanX",int.class);spanY=field(item,"spanY",int.class);screen=field(item,"screenId",int.class);
            itemId=field(item,"id");
            idpRows=field(idp,named?"numRows":"G0",int.class);idpCols=field(idp,named?"numColumns":"H0",int.class);
            dbFile=field(idp,named?"dbFile":"E1",String.class);
            finished=method(launcher,named?"finishBindingItems":"h",void.class,
                    Class.forName(named?"com.android.launcher3.util.IntSet":"com.android.launcher3.util.z0",false,loader));
            workspace=method(launcher,named?"getWorkspace":"B2",ws);
            getCountX=method(cell,"getCountX",int.class);getCountY=method(cell,"getCountY",int.class);
            if(!Map.class.isAssignableFrom(pending.getType())||!Set.of(byte.class,short.class,int.class,long.class).contains(itemId.getType()))
                throw new IllegalStateException("桌面迁移字段接口不匹配");
            if(named){
                dpIdp=field(dp,"inv",idp);
                glyphMetrics=method(Class.forName("com.android.launcher3.MFVDeviceProfile",false,loader),
                        "updateIconSize_DeviceProfile",void.class,dp,Resources.class,float.class);
            }else{dpIdp=null;glyphMetrics=null;}
        }
        boolean currentProfile(Object dp,Object profile)throws Exception{return dpIdp==null||profile!=null&&dpIdp.get(dp)==profile;}
        static Method method(Class<?> c,String name,Class<?> result,Class<?>...args)throws Exception{
            Method m=c.getDeclaredMethod(name,args);
            if(m.getReturnType()!=result||Modifier.isStatic(m.getModifiers())||Modifier.isAbstract(m.getModifiers()))
                throw new IllegalStateException("桌面方法接口不匹配："+name);
            m.setAccessible(true);return m;
        }
        static Field field(Class<?> c,String name,Class<?> type)throws Exception{
            Field f=field(c,name);if(f.getType()!=type)throw new IllegalStateException("桌面字段类型不匹配："+name);return f;
        }
        static Field field(Class<?> c,String name)throws Exception{
            Field f=c.getDeclaredField(name);if(Modifier.isStatic(f.getModifiers()))throw new IllegalStateException("桌面字段必须属于实例："+name);
            f.setAccessible(true);return f;
        }
        static Field writable(Field field){
            if(Modifier.isFinal(field.getModifiers()))throw new IllegalStateException("桌面字段不可调整："+field.getName());return field;
        }
    }

    static final class Readout {
        final List<LauncherGridSafety.Item> items=new ArrayList<>();
        final List<LauncherGridMigrationCheck.Row> placements=new ArrayList<>();
        final List<long[]> slots=new ArrayList<>();
        boolean complete; int extentRows,extentCols;
        boolean fits(int rows,int cols) {
            if(!complete)return false;
            Set<String> occupied=new HashSet<>();
            for(long[] s:slots){
                if(s[1]<0||s[2]<0||s[3]<1||s[4]<1||s[1]+s[3]>cols||s[2]+s[4]>rows)return false;
                for(long x=s[1];x<s[1]+s[3];x++)for(long y=s[2];y<s[2]+s[4];y++)
                    if(!occupied.add(s[0]+":"+x+":"+y))return false;
            }
            return true;
        }
        static Readout read(Context context,String name) {
            Readout result=new Readout();
            // A database path must originate in the verified IDP, and remain in this app's database directory.
            if(name==null||!name.matches("[A-Za-z0-9_\\-]+\\.db"))return result;
            File file=context.getDatabasePath(name);
            if(!file.isFile())return result;
            try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getAbsolutePath(),null,SQLiteDatabase.OPEN_READONLY);
                Cursor cursor=db.rawQuery("SELECT _id,container,cellX,cellY,spanX,spanY,screen FROM favorites",null)) {
                while(cursor.moveToNext()) {
                    long id=cursor.getLong(0),container=cursor.getLong(1);
                    int x=cursor.getInt(2),y=cursor.getInt(3),sx=cursor.getInt(4),sy=cursor.getInt(5);
                    result.items.add(new LauncherGridSafety.Item(id,container,sx,sy));
                    if(container==-100) {
                        result.slots.add(new long[]{cursor.getLong(6),x,y,sx,sy});
                        result.placements.add(new LauncherGridMigrationCheck.Row(id,cursor.getLong(6),x,y,sx,sy));
                        result.extentCols=Math.max(result.extentCols,(int)Math.min(Integer.MAX_VALUE,(long)Math.max(0,x)+sx));
                        result.extentRows=Math.max(result.extentRows,(int)Math.min(Integer.MAX_VALUE,(long)Math.max(0,y)+sy));
                    }
                }
                result.complete=true;
            }catch(Exception failure){result.items.clear();}
            return result;
        }
    }

    static final class Controller {
        final AugmentModule module;final Targets t;
        Context context;SharedPreferences saved;volatile Object profile;
        LauncherGridSpec requested;
        final Map<Object,Glyphs> glyphs=Collections.synchronizedMap(new WeakHashMap<>());
        final Map<Long,Object> loadingItems=new LinkedHashMap<>();
        volatile List<LauncherGridMigrationCheck.Row> migratedRows;
        volatile boolean ready,decided,owns;
        boolean repacked,subscribed,storageUnavailable;
        int rows,cols,baseRows,baseCols,actualRows,actualCols,workspaceRows,workspaceCols,cellWidth,cellHeight,iconPixels,labelPixels;
        String state="native",error="",database;
        Controller(AugmentModule module,Targets t){this.module=module;this.t=t;}

        synchronized void configure(Context supplied,Object desktop,Object idp,int nativeRows,int nativeCols) {
            if(decided) return;
            context=supplied.getApplicationContext();if(context==null)context=supplied;
            Map<String,?> before=Collections.emptyMap();
            try {
                saved=LauncherOwnedStateClient.preferences(context,"grid");
                before=saved.getAll();
                boolean verified=FeatureSettings.hasVerifiedSnapshot(context);
                requested=LauncherGridSpec.parse(FeatureSettings.text(context,LauncherGridSpec.ENABLED,"0"),
                        FeatureSettings.text(context,LauncherGridSpec.ROWS,"6"),FeatureSettings.text(context,LauncherGridSpec.COLUMNS,"4"));
                if(requested==null)throw new IllegalStateException("桌面行列配置无效");
                baseRows=saved.getInt("original_rows",nativeRows);baseCols=saved.getInt("original_columns",nativeCols);
                int previousRows=saved.getInt("effective_rows",nativeRows),previousCols=saved.getInt("effective_columns",nativeCols);
                boolean retained=saved.getBoolean("owned",false);
                if(!verified && retained) {
                    rows=previousRows;cols=previousCols;owns=true;state="pending_restart";error="配置尚未就绪，保留上次安全网格";
                    if(saved.getBoolean("migration_pending",false))t.resizing.setBoolean(desktop,true);
                } else if(!requested.enabled&&!retained) {
                    rows=nativeRows;cols=nativeCols;state="native";
                } else {
                    database=(String)t.dbFile.get(idp);
                    Readout data=Readout.read(context,database);
                    int targetRows=requested.enabled?requested.rows:baseRows,targetCols=requested.enabled?requested.columns:baseCols;
                    LauncherGridSafety.Result safety=LauncherGridSafety.check(new LauncherGridSpec(true,targetRows,targetCols),data.complete,data.items);
                    if(!safety.safe) {
                        rows=previousRows;cols=previousCols;owns=retained;state="blocked";error=safety.reason;
                        if(retained&&saved.getBoolean("migration_pending",false))t.resizing.setBoolean(desktop,true);
                    }else{
                        rows=targetRows;cols=targetCols;owns=true;state=requested.enabled?"active":"restored";
                        // Dormant/hidden database entries can legally overlap visible items. Only a
                        // changed requested shape or an unfinished model migration requires repacking.
                        boolean changed=rows!=previousRows||cols!=previousCols||saved.getBoolean("migration_pending",false);
                        // Persist recovery geometry before the OEM starts placing items. Original preferences remain intact.
                        if(!saved.edit().putInt("original_rows",baseRows).putInt("original_columns",baseCols)
                                .putInt("effective_rows",rows).putInt("effective_columns",cols).putBoolean("owned",true)
                                .putBoolean("migration_pending",changed).commit())
                            throw new IllegalStateException("无法保存桌面恢复信息，保持当前布局");
                        if(changed)t.resizing.setBoolean(desktop,true);
                    }
                }
                profile=idp;decided=true;
                if(!subscribed){subscribed=true;FeatureSettings.addSnapshotListener(context,this::settingsChanged);}
                report(false);
            }catch(Throwable failure){
                // A failed read must never expose a smaller native grid to already-migrated items.
                if(saved==null){
                    storageUnavailable=true;
                    try{database=(String)t.dbFile.get(idp);}catch(Exception ignored){ }
                    Readout existing=Readout.read(context,database);
                    rows=Math.max(nativeRows,existing.extentRows);cols=Math.max(nativeCols,existing.extentCols);
                    owns=existing.complete&&(rows!=nativeRows||cols!=nativeCols);
                }else{
                    // A worker may finish a timed-out commit later. This constructor
                    // must retain the trusted pre-transaction geometry regardless.
                    Object priorRows=before.get("effective_rows"),priorCols=before.get("effective_columns");
                    rows=priorRows instanceof Integer?(Integer)priorRows:nativeRows;
                    cols=priorCols instanceof Integer?(Integer)priorCols:nativeCols;
                    owns=Boolean.TRUE.equals(before.get("owned"));
                    if(owns&&Boolean.TRUE.equals(before.get("migration_pending")))try{t.resizing.setBoolean(desktop,true);}catch(Exception ignored){}
                }
                state="blocked";error=String.valueOf(failure.getMessage());decided=true;
                module.logFeatureError("LAUNCHER_GRID_PRECHECK",failure);report(false);
            }
        }

        void settingsChanged(){
            if(!decided||requested==null)return;
            LauncherGridSpec next=LauncherGridSpec.parse(FeatureSettings.text(context,LauncherGridSpec.ENABLED,"0"),
                    FeatureSettings.text(context,LauncherGridSpec.ROWS,"6"),FeatureSettings.text(context,LauncherGridSpec.COLUMNS,"4"));
            if(next!=null&&(next.enabled!=requested.enabled||next.rows!=requested.rows||next.columns!=requested.columns)){
                state="pending_restart";error="配置已保存，重启桌面后应用";report(false);
            }
        }

        void freezeMigration() throws Exception {
            List<LauncherGridMigrationCheck.Row> placed=new ArrayList<>();
            for(Map.Entry<Long,Object> entry:loadingItems.entrySet()){
                Object item=entry.getValue();
                placed.add(new LauncherGridMigrationCheck.Row(entry.getKey(),t.screen.getInt(item),t.cellX.getInt(item),
                        t.cellY.getInt(item),t.spanX.getInt(item),t.spanY.getInt(item)));
            }
            migratedRows=java.util.Collections.unmodifiableList(placed);loadingItems.clear();
        }

        void bound(Object launcher){
            if(!decided||storageUnavailable)return;
            try{
                ViewGroup ws=(ViewGroup)t.workspace.invoke(launcher);
                workspaceRows=workspaceCols=0;
                if(ws!=null)for(int i=0;i<ws.getChildCount();i++){
                    View child=ws.getChildAt(i);
                    if(t.getCountX.getDeclaringClass().isInstance(child)){
                        workspaceCols=(Integer)t.getCountX.invoke(child);workspaceRows=(Integer)t.getCountY.invoke(child);break;
                    }
                }
                if(ws!=null)for(int i=0;i<ws.getChildCount();i++){
                    View child=ws.getChildAt(i);
                    if(t.deviceProfile.getDeclaringClass().isInstance(child)){
                        Object dp=t.deviceProfile.invoke(child);Point size=(Point)t.cellSize.invoke(dp);
                        cellWidth=size.x;cellHeight=size.y;iconPixels=t.iconSize.getInt(dp);labelPixels=t.textSize.getInt(dp);break;
                    }
                }
                Readout data=owns?Readout.read(context,database):null;
                boolean complete=owns&&(!saved.getBoolean("migration_pending",false)
                        ||LauncherGridMigrationCheck.check(data.complete,data.placements,migratedRows,rows,cols).complete);
                if(complete&&workspaceRows==rows&&workspaceCols==cols) {
                    SharedPreferences.Editor edit=saved.edit();
                    if("restored".equals(state))edit.clear();
                    else edit.putBoolean("migration_pending",false);
                    if(edit.commit()&&"restored".equals(state))owns=false;
                }
                report(true);
            }catch(Throwable failure){module.logFeatureError("LAUNCHER_GRID_EVIDENCE",failure);}
        }

        void report(boolean bound){
            if(context==null)return;
            try{
                if(profile!=null){actualRows=t.idpRows.getInt(profile);actualCols=t.idpCols.getInt(profile);}
                JSONObject json=new JSONObject().put("pid",android.os.Process.myPid()).put("version",BuildConfig.VERSION_CODE)
                        .put("adapter",t.adapter).put("supported",true)
                        .put("requestedRows",requested==null?0:requested.rows).put("requestedColumns",requested==null?0:requested.columns)
                        .put("enabled",requested!=null&&requested.enabled).put("effectiveRows",actualRows).put("effectiveColumns",actualCols)
                        .put("workspaceRows",workspaceRows).put("workspaceColumns",workspaceCols).put("state",state).put("error",error)
                        .put("cellWidthPx",cellWidth).put("cellHeightPx",cellHeight).put("iconSizePx",iconPixels).put("labelSizePx",labelPixels)
                        .put("migrationPending",saved!=null&&saved.getBoolean("migration_pending",false))
                        .put("loadedItems",migratedRows==null?-1:migratedRows.size())
                        .put("bound",bound).put("repacked",repacked).put("database",database==null?"":database);
                FeatureSettings.diagnostic(context,DIAGNOSTIC,json.toString());
            }catch(Exception failure){module.logFeatureError("LAUNCHER_GRID_DIAGNOSTIC",failure);}
        }
    }

    private LauncherGridHook(){}
}
