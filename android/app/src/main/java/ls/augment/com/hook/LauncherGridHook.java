package ls.augment.com.hook;

import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Point;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashSet;
import java.util.Set;
import java.util.LinkedHashMap;
import java.util.WeakHashMap;
import java.util.Collections;
import org.json.JSONObject;
import org.json.JSONArray;
import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSnapshot;
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

    // Process-owned hook/controller or explicitly retired session; retain its existing owner lifecycle (see stage3 lint ledger).
    //noinspection StaticFieldLeak
    private static volatile Controller controller;
    private static final ThreadLocal<Boolean> FITTING=ThreadLocal.withInitial(()->false);

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        String phase="resolve_interfaces";
        try {
            Targets t = new Targets(loader);
            // Resolve configuration during installation, before an IDP or loader hook
            // owns launcher locks. A slow first mirror must not freeze its placeholder off.
            phase="await_configuration";
            FeatureSettings.awaitLauncherGridSnapshot();
            Controller c = new Controller(module,t);
            phase="register_hooks";
            // r() is called while IDP is being built, before DeviceProfiles and loader occupancy maps.
            module.registerFeatureHook(module.prepareFeatureHook(t.setGrid,"launcher.grid.profile",true).intercept(chain -> {
                if(!c.ready)return chain.proceed();
                Context context = (Context)chain.getArg(1);
                int rows=(Integer)chain.getArg(2), cols=(Integer)chain.getArg(3);
                c.configure(context,chain.getThisObject(),chain.getArg(0),rows,cols);
                boolean own=c.ownsCurrentTable();
                c.acceptNativeTarget(rows,cols);
                Object result;
                try{result=own?chain.proceed(new Object[]{chain.getArg(0),context,c.rows,c.cols}):chain.proceed();}
                catch(Throwable failure){c.profileFailed(failure);c.report(false);throw failure;}
                if(c.storageUnavailable)c.t.resizing.setBoolean(chain.getThisObject(),false);
                c.profile=chain.getArg(0);
                c.profileApplied();
                c.report(false);
                return result;
            }));
            // OEM constructors and rotation code consult all three getters after r().
            for (Method getter : new Method[]{t.getPoint,t.getRawPoint,t.getEncoded})
                module.registerFeatureHook(module.prepareFeatureHook(getter,"launcher.grid."+getter.getName(),true).intercept(chain -> {
                    if (!c.ownsCurrentTable()) return chain.proceed();
                    return getter.getReturnType()==int.class ? (c.rows<<4)+c.cols : new Point(c.rows,c.cols);
                }));
            module.registerFeatureHook(module.prepareFeatureHook(t.placeItem,"launcher.grid.place",true).intercept(chain -> {
                if (!c.ownsCurrentTable() || !t.resizing.getBoolean(chain.getThisObject())) return chain.proceed();
                Object item=chain.getArg(2);
                boolean accepted=preservePlacement(chain.getThisObject(),item,chain.getArg(3),c.rows,c.cols,t);
                if(accepted){
                    if(c.loadingItems.isEmpty())c.migratedRows=null;
                    c.loadingItems.put(t.itemId.getLong(item),item);
                }
                return accepted;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.repack,"launcher.grid.repack",true).intercept(chain -> {
                if (!c.ownsCurrentTable()) return chain.proceed();
                // The true branch allocates as many overflow pages as necessary. The false OEM branch
                // can allocate only one overflow page for each source screen.
                Object result=chain.proceed(new Object[]{chain.getArg(0),chain.getArg(1),chain.getArg(2),true});
                c.freezeMigration();
                c.repacked=true;
                c.event("model_repacked", "accepted="+(c.migratedRows==null?-1:c.migratedRows.size()));
                c.report(false);
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(t.finished,"launcher.grid.bound",true).intercept(chain -> {
                Object result=chain.proceed();
                c.bound(chain.getThisObject());
                return result;
            }));
            if(t.split!=null)module.registerFeatureHook(module.prepareFeatureHook(t.split.factory,"launcher.grid.workspaceProfile",true).intercept(chain->{
                Object result=chain.proceed();
                if(result==null||!c.ownsCurrentTable()||chain.getArg(4)!=c.profile)return result;
                try{return t.split.fit(result,((Context)chain.getArg(0)).getResources().getDisplayMetrics().density);}
                catch(Exception failure){module.logFeatureError("LAUNCHER_WORKSPACE_PROFILE_FIT",failure);return result;}
            }));
            if(t.drawerMetrics!=null)module.registerFeatureHook(module.prepareFeatureHook(t.drawerMetrics,"launcher.grid.drawerMetrics",true).intercept(chain -> {
                Object dp=chain.getThisObject();Glyphs nativeGlyphs=c.glyphs.get(dp);
                if(!c.ownsCurrentTable()||nativeGlyphs==null||!t.currentProfile(dp,c.profile)||!nativeGlyphs.matches(t,dp))return chain.proceed();
                int icon=t.iconSize.getInt(dp),text=t.textSize.getInt(dp),gap=t.iconGap.getInt(dp);
                // X3.F copies workspace B1/C1/D1 into all-apps J2/N2/K2 and derives drawer geometry.
                // Let that native calculation see its original glyph metrics, then restore the workspace.
                try{
                    t.iconSize.setInt(dp,nativeGlyphs.icon);t.textSize.setInt(dp,nativeGlyphs.text);t.iconGap.setInt(dp,nativeGlyphs.gap);
                    return chain.proceed();
                }finally{t.iconSize.setInt(dp,icon);t.textSize.setInt(dp,text);t.iconGap.setInt(dp,gap);}
            }));
            if(t.metrics!=null)module.registerFeatureHook(module.prepareFeatureHook(t.metrics,"launcher.grid.iconFit",true).intercept(chain -> {
                Object result=chain.proceed();
                if(c.ownsCurrentTable()&&!FITTING.get()&&t.currentProfile(chain.getThisObject(),c.profile)
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
                if(!c.ownsCurrentTable()||original==null||!t.currentProfile(dp,c.profile)
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
            publishInstallation(FeatureSettings.from(null),c,null,"");
        } catch (Throwable failure) {
            final String failedPhase=phase;
            module.logFeatureError("LAUNCHER_GRID_INSTALL",failure);
            publishInstallation(FeatureSettings.from(null),null,failure,failedPhase);
            // Package-ready can precede the application Context. Preserve installation
            // evidence in the same process once that Context exists, without touching data.
            if(!installObserverRegistered)try{
                Method created=Instrumentation.class.getDeclaredMethod("callApplicationOnCreate",Application.class);
                module.registerFeatureHook(module.prepareFeatureHook(created,"launcher.grid.install_status",true).intercept(chain->{
                    Object result=chain.proceed();Controller current=controller;
                    if(current==null||!current.decided)publishInstallation((Application)chain.getArg(0),current,failure,failedPhase);
                    return result;
                }));
                installObserverRegistered=true;
            }catch(Throwable evidenceFailure){module.logFeatureError("LAUNCHER_GRID_INSTALL_EVIDENCE",evidenceFailure);}
        }
    }

    private static void publishInstallation(Context context,Controller ready,Throwable failure,String phase){
        if(context==null||ready!=null&&ready.decided)return;
        try{FeatureSettings.diagnostic(context,DIAGNOSTIC,new JSONObject()
                .put("version",BuildConfig.VERSION_CODE).put("pid",android.os.Process.myPid())
                .put("adapter",ready==null?"none":ready.t.adapter).put("supported",ready!=null)
                .put("state",ready==null?"unsupported":"registered").put("bound",false)
                .put("error",ready==null?"当前桌面缺少兼容布局接口":"")
                .put("errorClass",ready!=null||failure==null?"":failure.getClass().getSimpleName())
                .put("phase",ready==null?phase:"")
                .put("missingInterface",ready==null?missingInterface(failure):"").toString());
        }catch(Exception ignored){ }
    }
    private static String missingInterface(Throwable failure){
        if(failure==null)return "";
        String detail=failure.getMessage();if(detail==null)return "";
        // ART appends its complete DexPathList to class errors. Keep only the
        // identifier/signature; never export that path or arbitrary host data.
        if(failure instanceof ClassNotFoundException){
            int start=detail.indexOf('"'),end=start<0?-1:detail.indexOf('"',start+1);
            if(start>=0&&end>start)detail=detail.substring(start+1,end);
        }
        return detail.matches("[A-Za-z0-9_.$,()\\[\\];<> ]{1,240}")?detail:"";
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
        final LauncherWorkspaceProfile split;
        final Method setGrid,getPoint,getRawPoint,getEncoded,placeItem,repack,finished,workspace,getCountX,getCountY;
        final Method vacant,mark,metrics,drawerMetrics,cellSize,deviceProfile,glyphMetrics;
        final Method refreshProfile;
        final Field dpIdp, observedDpIdp;
        final Field favoritesTable;
        final Field nativePreferences,migrationSourceKey;
        final Method readNativePreference;
        final Field iconSize,textSize,iconGap,scalable,responsive;
        final Field resizing,pending,container,cellX,cellY,spanX,spanY,screen,itemId,idpRows,idpCols,dbFile;

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Targets(ClassLoader loader) throws Exception {
            boolean named=namedProfile(loader);
            Class<?> desktop=Class.forName(named?"com.android.launcher3.DesktopGrid":"com.android.launcher3.b0",false,loader);
            // The July Android 16 build reuses b0/F1/C2 for different classes.
            // Select its whole mapping from the actual profile setter signature,
            // not from the mere presence of an obfuscated class name.
            boolean july=!named&&julyProfile(desktop,loader);
            // Resolve one complete, verified ROM contract before any grid hook is registered.
            // A changed member must not fall back to a mixture of the two class families.
            Class<?> idp=Class.forName(named?"com.android.launcher3.InvariantDeviceProfile":july?"com.android.launcher3.H1":"com.android.launcher3.F1",false,loader);
            Method refresh=null;
            try{refresh=method(idp,named?"onConfigChanged":july?"L0":"K0",void.class,Context.class);}
            catch(ReflectiveOperationException unsupported){
                if(named)try{refresh=method(idp,"onConfigChanged",void.class);}catch(ReflectiveOperationException absent){ }
            }
            refreshProfile=refresh;
            Class<?> item=Class.forName(named?"com.android.launcher3.model.data.ItemInfo":"com.android.launcher3.model.data.y",false,loader);
            Class<?> occupied=Class.forName(named?"com.android.launcher3.util.GridOccupancy":july?"com.android.launcher3.util.u0":"com.android.launcher3.util.t0",false,loader);
            Class<?> model=Class.forName(named?"com.android.launcher3.model.BgDataModel":july?"C1.y0":"z1.y0",false,loader);
            Class<?> launcher=Class.forName(named?"com.android.launcher3.Launcher":july?"com.android.launcher3.E2":"com.android.launcher3.C2",false,loader);
            Class<?> cell=Class.forName("com.android.launcher3.CellLayout",false,loader);
            Class<?> dp=Class.forName(named?"com.android.launcher3.DeviceProfile":"com.android.launcher3.h0",false,loader);
            boolean separate=false;
            if(named)for(Method m:dp.getDeclaredMethods())if(m.getName().equals("getWorkspaceProfile")&&m.getParameterCount()==0
                    &&m.getReturnType().getName().equals("com.android.launcher3.deviceprofile.WorkspaceProfile"))separate=true;
            split=separate?new LauncherWorkspaceProfile(loader,dp,idp):null;
            adapter=split!=null?"named_workspace_profile":named?"android15_named":july?"android16_260731":"android16_obfuscated";
            Class<?> ws=Class.forName("com.android.launcher3.Workspace",false,loader);
            if(!ViewGroup.class.isAssignableFrom(cell)||!ViewGroup.class.isAssignableFrom(ws))throw new IllegalStateException("桌面容器接口不匹配");
            metrics=split!=null?null:method(dp,named?"updateIconSize":july?"s1":"p1",void.class,float.class,Context.class);
            drawerMetrics=split!=null?null:method(dp,named?"updateAllAppsContainerWidth":july?"k1":"h1",void.class,Context.class);
            cellSize=split!=null?split.cellSize:method(dp,named?"getCellSize":july?"n0":"k0",Point.class);deviceProfile=method(cell,"getDeviceProfile",dp);
            iconSize=split!=null?split.icon:writable(field(dp,named?"iconSizePx":july?"C1":"B1",int.class));
            textSize=split!=null?split.text:writable(field(dp,named?"iconTextSizePx":july?"D1":"C1",int.class));
            iconGap=split!=null?split.gap:writable(field(dp,named?"iconDrawablePaddingPx":july?"E1":"D1",int.class));
            scalable=field(dp,named?"mIsScalableGrid":july?"a1":"Z0",boolean.class);responsive=field(dp,named?"mIsResponsiveGrid":july?"c1":"b1",boolean.class);
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
            idpRows=field(idp,named?"numRows":july?"K0":"G0",int.class);idpCols=field(idp,named?"numColumns":july?"L0":"H0",int.class);
            dbFile=field(idp,named?"dbFile":july?"I1":"E1",String.class);
            observedDpIdp=field(dp,named?"inv":july?"D0":"C0",idp);
            if(july){
                favoritesTable=Class.forName("com.android.launcher3.Y3",false,loader).getDeclaredField("a");
                if(favoritesTable.getType()!=String.class||!Modifier.isStatic(favoritesTable.getModifiers()))
                    throw new IllegalStateException("桌面原厂数据表接口不匹配");
                favoritesTable.setAccessible(true);
                Class<?> prefs=Class.forName("com.android.launcher3.P3",false,loader);
                Class<?> key=Class.forName("com.android.launcher3.X",false,loader);
                nativePreferences=field(idp,"I0",prefs);
                migrationSourceKey=prefs.getDeclaredField("m");
                if(migrationSourceKey.getType()!=key||!Modifier.isStatic(migrationSourceKey.getModifiers()))
                    throw new IllegalStateException("桌面原厂数据库选择接口不匹配");
                migrationSourceKey.setAccessible(true);
                readNativePreference=method(prefs,"h",Object.class,key);
            }else{favoritesTable=null;nativePreferences=null;migrationSourceKey=null;readNativePreference=null;}
            finished=method(launcher,named?"finishBindingItems":july?"i":"h",void.class,
                    Class.forName(named?"com.android.launcher3.util.IntSet":july?"com.android.launcher3.util.A0":"com.android.launcher3.util.z0",false,loader));
            workspace=method(launcher,named?"getWorkspace":july?"C2":"B2",ws);
            getCountX=method(cell,"getCountX",int.class);getCountY=method(cell,"getCountY",int.class);
            if(!Map.class.isAssignableFrom(pending.getType())||!Set.of(byte.class,short.class,int.class,long.class).contains(itemId.getType()))
                throw new IllegalStateException("桌面迁移字段接口不匹配");
            if(named||july){
                dpIdp=observedDpIdp;
                glyphMetrics=split!=null?null:method(Class.forName(named?"com.android.launcher3.MFVDeviceProfile":"com.android.launcher3.d4",false,loader),
                        named?"updateIconSize_DeviceProfile":"L",void.class,dp,Resources.class,float.class);
            }else{dpIdp=null;glyphMetrics=null;}
        }

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        private static boolean namedProfile(ClassLoader loader)throws Exception{
            try{
                Class<?> desktop=Class.forName("com.android.launcher3.DesktopGrid",false,loader);
                Class<?> idp=Class.forName("com.android.launcher3.InvariantDeviceProfile",false,loader);
                method(desktop,"setGridSize",void.class,idp,Context.class,int.class,int.class);return true;
            }catch(ReflectiveOperationException absent){return false;}
        }

        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        private static boolean julyProfile(Class<?> desktop,ClassLoader loader)throws Exception{
            final Class<?> profile;
            try{profile=Class.forName("com.android.launcher3.H1",false,loader);}
            catch(ClassNotFoundException absent){return false;}
            try{method(desktop,"r",void.class,profile,Context.class,int.class,int.class);return true;}
            catch(NoSuchMethodException absent){return false;}
        }
        boolean currentProfile(Object dp,Object profile)throws Exception{return dpIdp==null||profile!=null&&dpIdp.get(dp)==profile;}
        String tableName()throws IllegalAccessException{
            String name=favoritesTable==null?"favorites":(String)favoritesTable.get(null);
            return name!=null&&name.matches("[A-Za-z0-9_]{1,64}")?name:"invalid";
        }
        boolean nativeDatabaseMatches(Object idp)throws Exception{
            if(readNativePreference==null)return true;
            Object source=readNativePreference.invoke(nativePreferences.get(idp),migrationSourceKey.get(null));
            if(!(source instanceof String))throw new IllegalStateException("桌面原厂数据库选择状态不可读取");
            // This key persists after migration: the OEM writes the target dbFile
            // back into it. A nonempty equal value is a normal steady-state boot.
            return ((String)source).isEmpty()||source.equals(dbFile.get(idp));
        }
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
        // Match the OEM NoLocaleSQLiteHelper without ever creating or upgrading a database.
        static final int OPEN_FLAGS=SQLiteDatabase.OPEN_READONLY|SQLiteDatabase.NO_LOCALIZED_COLLATORS;
        final List<LauncherGridSafety.Item> items=new ArrayList<>();
        final List<LauncherGridMigrationCheck.Row> placements=new ArrayList<>();
        final List<long[]> slots=new ArrayList<>();
        boolean complete; int extentRows,extentCols;
        String state="not_read",stage="validate",error="";
        LauncherDatabaseIdentity.Snapshot source;
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
            if(name==null||!name.matches("[A-Za-z0-9_\\-]+\\.db")){result.state="invalid_name";return result;}
            try {
                result.stage="path";
                result.source=LauncherDatabaseIdentity.read(context,name);
                File file=context.getDatabasePath(name);
                if(!file.isFile()){result.state="missing";return result;}
                result.stage="open";
                try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getAbsolutePath(),null,OPEN_FLAGS)) {
                    result.stage="query";
                    try(Cursor cursor=db.rawQuery("SELECT _id,container,cellX,cellY,spanX,spanY,screen FROM favorites",null)) {
                        result.stage="rows";
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
                        result.stage="cursor_close";
                    }
                    result.stage="database_close";
                }
                LauncherDatabaseIdentity.Snapshot after=LauncherDatabaseIdentity.read(context,name);
                if(result.source==null||!result.source.valid()||!after.valid()
                        ||!result.source.signature().equals(after.signature())) {
                    result.items.clear();result.slots.clear();result.placements.clear();result.extentRows=result.extentCols=0;
                    result.state="source_changed_or_unverified";result.stage="source_verify";result.source=after;return result;
                }
                result.source=after;result.complete=true;result.state="complete";result.stage="complete";
            }catch(Exception failure){result.items.clear();result.slots.clear();result.placements.clear();result.extentRows=result.extentCols=0;
                result.state="read_failed";result.error=failure.getClass().getSimpleName();}
            return result;
        }
    }

    static final class Controller {
        final AugmentModule module;final Targets t;
        Context context;SharedPreferences saved;volatile Object profile;
        LauncherGridSpec requested;
        LauncherGridSpec latestRequested;
        long receivedRevision,latestRevision,configuredAt,profileAppliedAt,boundAt;
        boolean configurationVerified,bindingObserved,workspaceConsistent;
        boolean settingsPending;
        String observedState,observedError,observedApplicationResult;
        String decision="not_configured",applicationResult="not_attempted",migrationResult="not_required",readState="not_read",readStage="not_read",readError="";
        int databaseItems,workspacePages;
        JSONArray workspaceGeometry=new JSONArray();
        final List<String> events=new ArrayList<>();
        final Map<Object,Glyphs> glyphs=Collections.synchronizedMap(new WeakHashMap<>());
        final Map<Long,Object> loadingItems=new LinkedHashMap<>();
        volatile List<LauncherGridMigrationCheck.Row> migratedRows;
        volatile boolean ready,decided,owns;
        boolean repacked,subscribed,storageUnavailable;
        boolean privateSubscribed,privateReady,recoveryQueued,recovering;
        Object desktop;
        WeakReference<Object> boundLauncher=new WeakReference<>(null);
        int initialNativeRows,initialNativeCols;
        final Handler main=new Handler(Looper.getMainLooper());
        int rows,cols,baseRows,baseCols,actualRows,actualCols,workspaceRows,workspaceCols,cellWidth,cellHeight,iconPixels,labelPixels;
        String state="native",error="",database,databaseTable="unobserved";
        boolean readBlocked,tableRejected,sourceRejected;
        String databaseSelection="unobserved";
        LauncherDatabaseIdentity.Snapshot configuredSource,readSource;
        int configuredIdpIdentity,configureContextIdentity,configureDisplay=-1;
        int boundIdpIdentity; boolean boundIdpConsistent;
        String configureContextClass="";
        Controller(AugmentModule module,Targets t){this.module=module;this.t=t;}

        synchronized boolean ownsCurrentTable(){
            if(!owns||tableRejected||sourceRejected)return false;
            try{databaseTable=t.tableName();if("favorites".equals(databaseTable))return true;}
            catch(IllegalAccessException unavailable){databaseTable="unavailable";}
            // This guard runs inside profile/getter/loader callbacks: reflection
            // only, with no Provider, preference, file or database operations.
            rejectTable();
            return false;
        }
        private void rejectTable(){
            tableRejected=true;owns=false;readBlocked=false;state="blocked";decision="unsupported_table";applicationResult="blocked";
            error="当前桌面模式暂不支持安全布局迁移，保留恢复信息";
        }
        private void rejectNativeDatabase(){
            sourceRejected=true;owns=false;readBlocked=false;state="blocked";applicationResult="blocked";
            decision="unavailable".equals(databaseSelection)?"native_database_unavailable":"native_database_pending";
            error="unavailable".equals(databaseSelection)?"无法核对原厂数据库选择，保留布局与恢复信息":"原厂正在使用另一迁移源数据库，完成后重启桌面再应用";
        }

        synchronized void configure(Context supplied,Object desktop,Object idp,int nativeRows,int nativeCols) {
            if(decided) return;
            this.desktop=desktop;initialNativeRows=nativeRows;initialNativeCols=nativeCols;
            context=supplied.getApplicationContext();if(context==null)context=supplied;
            configuredIdpIdentity=System.identityHashCode(idp);configureContextIdentity=System.identityHashCode(supplied);
            configureContextClass=supplied.getClass().getName();
            try{android.view.Display display=supplied.getDisplay();configureDisplay=display==null?-1:display.getDisplayId();}
            catch(RuntimeException unassociated){configureDisplay=-1;}
            readBlocked=false;
            Map<String,?> before=Collections.emptyMap();
            try {
                configuredAt=System.currentTimeMillis();
                ConfigSnapshot snapshot=FeatureSettings.verifiedSnapshot(context);
                captureConfiguration(snapshot);
                event("configuration_received",snapshot==null?"unverified":describe(requested)+"|revision="+snapshot.revision);
                databaseTable=t.tableName();
                if(!"favorites".equals(databaseTable)){
                    rows=nativeRows;cols=nativeCols;profile=idp;decided=true;rejectTable();
                    readState="unsupported_table";readStage="table";
                    event("grid_decision","unsupported_table|table="+databaseTable);report(false);return;
                }
                try{databaseSelection=t.nativeDatabaseMatches(idp)?"profile":"native_source_mismatch";}
                catch(Exception unavailable){databaseSelection="unavailable";}
                if(!"profile".equals(databaseSelection)){
                    rows=nativeRows;cols=nativeCols;profile=idp;decided=true;rejectNativeDatabase();
                    readState=decision;readStage="database_selection";
                    event("grid_decision",decision);report(false);return;
                }
                saved=LauncherOwnedStateClient.preferences(context,"grid");
                before=saved.getAll();
                // Private-state startup and configuration refresh run independently. Select
                // one fresh immutable publication after the existing private-state barrier.
                ConfigSnapshot settled=FeatureSettings.verifiedSnapshot(context);
                if(settled!=snapshot){captureConfiguration(settled);snapshot=settled;
                    event("configuration_refreshed",snapshot==null?"unverified":describe(requested)+"|revision="+snapshot.revision);}
                if(snapshot!=null&&requested==null)throw new IllegalStateException("桌面行列配置无效");
                baseRows=saved.getInt("original_rows",nativeRows);baseCols=saved.getInt("original_columns",nativeCols);
                int previousRows=saved.getInt("effective_rows",nativeRows),previousCols=saved.getInt("effective_columns",nativeCols);
                boolean retained=saved.getBoolean("owned",false);
                if(!configurationVerified) {
                    rows=previousRows;cols=previousCols;owns=retained;state="pending_restart";
                    decision="waiting_config";error=retained?"配置尚未就绪，保留上次安全网格":"配置尚未就绪，保留原厂布局；配置就绪后需重启桌面";
                    if(retained&&saved.getBoolean("migration_pending",false))t.resizing.setBoolean(desktop,true);
                } else if(!requested.enabled&&!retained) {
                    rows=nativeRows;cols=nativeCols;state="native";decision="saved_disabled";
                } else {
                    database=(String)t.dbFile.get(idp);
                    Readout data=Readout.read(context,database);
                    captureReadout(data);
                    configuredSource=data.source;
                    event("database_preflight","state="+readState+"|stage="+readStage+"|error="+readError+"|items="+databaseItems);
                    int targetRows=requested.enabled?requested.rows:baseRows,targetCols=requested.enabled?requested.columns:baseCols;
                    LauncherGridSafety.Result safety=LauncherGridSafety.check(new LauncherGridSpec(true,targetRows,targetCols),data.complete,data.items);
                    if(!safety.safe) {
                        rows=previousRows;cols=previousCols;owns=retained;state="blocked";error=safety.reason;
                        if(!data.complete)error+="（"+readState+" / "+readStage+(readError.isEmpty()?"":" / "+readError)+"）";
                        decision="precheck_blocked";
                        readBlocked=!data.complete;
                        if(retained&&saved.getBoolean("migration_pending",false))t.resizing.setBoolean(desktop,true);
                    }else{
                        rows=targetRows;cols=targetCols;owns=true;state=requested.enabled?"active":"restored";decision=requested.enabled?"custom_selected":"native_restore_selected";
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
                profile=idp;decided=true;event("grid_decision",decision+"|target="+cols+"x"+rows+"|owns="+owns+"|read="+readState);
                if(!subscribed){subscribed=true;FeatureSettings.addSnapshotListener(context,this::settingsChanged);}
                report(false);
            }catch(Throwable failure){
                // A failed read must never expose a smaller native grid to already-migrated items.
                if(saved==null){
                    storageUnavailable=true;
                    try{database=(String)t.dbFile.get(idp);}catch(Exception ignored){ }
                    Readout existing=Readout.read(context,database);
                    captureReadout(existing);
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
                state="blocked";error=String.valueOf(failure.getMessage());decided=true;decision=storageUnavailable?"private_state_unavailable":"precheck_exception";
                event("grid_decision",decision+"|target="+cols+"x"+rows+"|error="+failure.getClass().getSimpleName());
                if(!subscribed){subscribed=true;FeatureSettings.addSnapshotListener(context,this::settingsChanged);}
                module.logFeatureError("LAUNCHER_GRID_PRECHECK",failure);report(false);
                if(storageUnavailable&&!privateSubscribed){
                    privateSubscribed=LauncherOwnedStateClient.addReadyListener(context,"grid",()->main.post(()->{
                        synchronized(Controller.this){privateReady=true;queuePrivateRecovery();}
                    }));
                }
            }
        }

        /** Re-enter the normal preflight only after the first OEM model binding finishes. */
        private synchronized void queuePrivateRecovery(){
            if(!storageUnavailable||!privateReady||!bindingObserved||recoveryQueued||recovering)return;
            recoveryQueued=true;main.post(this::recoverPrivateState);
        }
        private synchronized void recoverPrivateState(){
            recoveryQueued=false;
            if(controller!=this||!storageUnavailable||!privateReady||!bindingObserved||recovering)return;
            if(LauncherOwnedStateClient.readyPreferences(context,"grid")==null||FeatureSettings.verifiedSnapshot(context)==null)return;
            if(t.refreshProfile==null){
                error="恢复信息已就绪，当前桌面缺少安全刷新接口，请重启桌面";
                event("private_state_ready","refresh_unsupported");report(true);return;
            }
            recovering=true;
            try{
                Object priorProfile=profile;
                int retainedRows=rows,retainedCols=cols;
                boolean retainedOwnership=owns;
                // Existing placements and recovery ownership are read again; no cached
                // startup decision or native fallback is promoted to a successful apply.
                decided=false;storageUnavailable=false;settingsPending=false;error="";
                state="native";applicationResult="not_attempted";migrationResult="not_required";
                loadingItems.clear();migratedRows=null;repacked=false;
                event("private_state_ready","rechecking");
                configure(context,desktop,priorProfile,initialNativeRows,initialNativeCols);
                if(storageUnavailable||"blocked".equals(state)||"pending_restart".equals(state)){
                    // The rejected target must not replace the larger geometry that
                    // protected already-placed items while private state was absent.
                    rows=retainedRows;cols=retainedCols;owns=retainedOwnership;report(true);return;
                }
                Object launcher=boundLauncher.get();
                if(launcher!=null&&actualRows==rows&&actualCols==cols&&workspaceConsistent
                        &&workspaceRows==rows&&workspaceCols==cols&&!saved.getBoolean("migration_pending",false)){
                    event("private_state_refresh","existing_geometry_verified");bound(launcher);return;
                }
                bindingObserved=false;workspaceGeometry=new JSONArray();workspacePages=0;
                // OEM onConfigChanged rebuilds DeviceProfiles using the hooked grid
                // getters, then notifies its existing model/launcher listeners. Their
                // ordinary placement/pagination hooks retain all migration safeguards.
                if(t.refreshProfile.getParameterCount()==0)t.refreshProfile.invoke(priorProfile);
                else t.refreshProfile.invoke(priorProfile,context);
                profileApplied();event("private_state_refresh","native_profile_requested");report(false);
            }catch(Throwable failure){
                applicationResult="profile_refresh_failed";error="恢复信息已就绪，桌面刷新未完成，请重启桌面";
                event("private_state_refresh","failed|error="+failure.getClass().getSimpleName());
                module.logFeatureError("LAUNCHER_GRID_PRIVATE_READY",failure);report(false);
            }finally{recovering=false;}
        }

        synchronized void settingsChanged(){
            if(!decided)return;
            queuePrivateRecovery();
            ConfigSnapshot snapshot=FeatureSettings.verifiedSnapshot(context);if(snapshot==null)return;
            LauncherGridSpec next=LauncherGridSpec.parse(snapshot.get(LauncherGridSpec.ENABLED),snapshot.get(LauncherGridSpec.ROWS),snapshot.get(LauncherGridSpec.COLUMNS));
            if(next==null)return;
            boolean changed=latestRequested==null||!same(next,latestRequested);
            latestRevision=snapshot.revision;latestRequested=next;
            if(changed)event("saved_configuration_observed",describe(next)+"|revision="+snapshot.revision);
            if(requested==null||!same(next,requested)){
                if(!settingsPending){settingsPending=true;savePendingOverlay();}
                if(changed)report(bindingObserved);
            }else if(settingsPending){
                restoreObservedResult();settingsPending=false;
                event("saved_configuration_matches_current","result="+applicationResult+"|revision="+snapshot.revision);
                report(bindingObserved);
            }
        }

        /** Pending settings are an overlay, not a replacement for actual application evidence. */
        void restoreObservedResult(){
            if(!settingsPending)return;
            state=observedState;error=observedError;applicationResult=observedApplicationResult;
        }
        void savePendingOverlay(){
            if(!settingsPending)return;
            observedState=state;observedError=error;observedApplicationResult=applicationResult;
            state="pending_restart";error="配置已保存，重启桌面后应用";applicationResult="pending_restart";
        }
        synchronized void profileFailed(Throwable failure){
            restoreObservedResult();applicationResult="native_profile_failed";
            error="原厂桌面行列设置失败："+failure.getClass().getSimpleName();
            event("profile_result","result=native_profile_failed|error="+failure.getClass().getSimpleName());
            savePendingOverlay();
        }
        synchronized void acceptNativeTarget(int nativeRows,int nativeCols){
            // Once customization has been safely relinquished, later OEM changes are
            // authoritative, including while a future custom request awaits restart.
            // That saved request remains an overlay; it cannot take ownership here.
            if(owns||storageUnavailable||requested==null||requested.enabled)return;
            if(!"saved_disabled".equals(decision)&&!"native_restore_selected".equals(decision))return;
            String actualState=settingsPending?observedState:state;
            if(!"native".equals(actualState)&&!"restored".equals(actualState))return;
            if(rows!=nativeRows||cols!=nativeCols){rows=nativeRows;cols=nativeCols;
                event("native_configuration_changed","rows="+rows+"|columns="+cols);}
        }

        static boolean same(LauncherGridSpec a,LauncherGridSpec b){return a.enabled==b.enabled&&a.rows==b.rows&&a.columns==b.columns;}
        static String describe(LauncherGridSpec spec){return spec==null?"invalid":"enabled="+spec.enabled+"|rows="+spec.rows+"|columns="+spec.columns;}
        void captureConfiguration(ConfigSnapshot snapshot){
            configurationVerified=snapshot!=null;
            requested=snapshot==null?null:LauncherGridSpec.parse(snapshot.get(LauncherGridSpec.ENABLED),
                    snapshot.get(LauncherGridSpec.ROWS),snapshot.get(LauncherGridSpec.COLUMNS));
            if(snapshot!=null){receivedRevision=latestRevision=snapshot.revision;latestRequested=requested;}
        }
        synchronized void event(String phase,String detail){
            if(events.size()==12){
                // Keep the one-shot startup selection when later rotations and binds
                // replace recent observations. The exported current snapshot must still
                // explain which saved request originally selected this process's grid.
                int remove=0;
                for(int i=0;i<events.size();i++)if(!events.get(i).contains("|configuration_received|")
                        &&!events.get(i).contains("|configuration_refreshed|")&&!events.get(i).contains("|database_preflight|")
                        &&!events.get(i).contains("|grid_decision|")){remove=i;break;}
                events.remove(remove);
            }
            events.add(System.currentTimeMillis()+"|"+phase+"|"+detail);
        }
        void captureReadout(Readout data){readState=data.state;readStage=data.stage;readError=data.error;databaseItems=data.items.size();readSource=data.source;}

        /** Reconsider only an incomplete read, using this process's original request.
         * No profile refresh, placement update, native preference or database write occurs here. */
        private void reconsiderReadBlocked(Readout data,Object observedProfile,boolean profileConsistent) throws Exception {
            if(!readBlocked||data==null||!data.complete||requested==null||saved==null)return;
            if(configuredSource==null||!data.source.valid()||!configuredSource.sameLocation(data.source)
                    ||configuredIdpIdentity!=System.identityHashCode(profile)||observedProfile!=profile||!profileConsistent
                    ||configuredSource.exists&&(configuredSource.device!=data.source.device||configuredSource.inode!=data.source.inode)) {
                error="桌面数据来源已改变，保留当前布局并等待重新核验";
                event("database_recheck","result=source_changed");return;
            }
            int targetRows=requested.enabled?requested.rows:baseRows,targetCols=requested.enabled?requested.columns:baseCols;
            LauncherGridSafety.Result safety=LauncherGridSafety.check(new LauncherGridSpec(true,targetRows,targetCols),true,data.items);
            if(!safety.safe){error=safety.reason;event("database_recheck","result=safety_blocked");return;}
            if(actualRows!=targetRows||actualCols!=targetCols||workspacePages<=0||!workspaceConsistent
                    ||workspaceRows!=targetRows||workspaceCols!=targetCols
                    ||saved.getBoolean("migration_pending",false)) {
                error="桌面数据已可读取，当前布局仍需通过原厂迁移流程，保留现状";
                event("database_recheck","result=geometry_or_migration_pending");return;
            }
            if(!owns&&!saved.edit().putInt("original_rows",baseRows).putInt("original_columns",baseCols)
                    .putInt("effective_rows",targetRows).putInt("effective_columns",targetCols)
                    .putBoolean("owned",true).putBoolean("migration_pending",false).commit()) {
                error="桌面布局已核验，但无法保存恢复责任";event("database_recheck","result=recovery_commit_failed");return;
            }
            rows=targetRows;cols=targetCols;owns=true;readBlocked=false;error="";
            state=requested.enabled?"active":"restored";
            decision=requested.enabled?"custom_existing_verified":"native_existing_verified";
            event("database_recheck","result=existing_geometry_verified");
        }
        synchronized void profileApplied() {
            if(profile==null||!decided)return;
            restoreObservedResult();
            try{
                actualRows=t.idpRows.getInt(profile);actualCols=t.idpCols.getInt(profile);profileAppliedAt=System.currentTimeMillis();
                if(tableRejected){rejectTable();}
                else if(sourceRejected){rejectNativeDatabase();}
                else if(actualRows!=rows||actualCols!=cols){applicationResult="profile_mismatch";error="桌面配置未按目标行列应用";}
                else if("saved_disabled".equals(decision)||!owns&&requested!=null&&!requested.enabled
                        &&"native_restore_selected".equals(decision))applicationResult="native_profile";
                else if("waiting_config".equals(decision)||"pending_restart".equals(state))applicationResult="pending_restart";
                else if("blocked".equals(state))applicationResult="blocked";
                else applicationResult="profile_applied_waiting_bind";
                event("profile_result","result="+applicationResult+"|target="+cols+"x"+rows+"|actual="+actualCols+"x"+actualRows);
            }catch(Exception failure){applicationResult="profile_check_failed";error="无法核对桌面实际行列";
                event("profile_result","result=profile_check_failed|error="+failure.getClass().getSimpleName());
                module.logFeatureError("LAUNCHER_GRID_PROFILE_EVIDENCE",failure);}
            finally{savePendingOverlay();}
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

        synchronized void bound(Object launcher){
            if(!decided)return;
            boundLauncher=new WeakReference<>(launcher);
            restoreObservedResult();
            bindingObserved=true;boundAt=System.currentTimeMillis();
            try{
                if(sourceRejected){rejectNativeDatabase();report(true);return;}
                databaseTable=t.tableName();
                if(tableRejected||!"favorites".equals(databaseTable)){
                    rejectTable();
                    event("binding_result","unsupported_table|table="+databaseTable);report(true);return;
                }
                ViewGroup ws=(ViewGroup)t.workspace.invoke(launcher);
                Object observedProfile=null;boolean profileConsistent=true;
                workspaceRows=workspaceCols=workspacePages=0;workspaceConsistent=true;workspaceGeometry=new JSONArray();
                if(ws!=null)for(int i=0;i<ws.getChildCount();i++){
                    View child=ws.getChildAt(i);
                    if(t.getCountX.getDeclaringClass().isInstance(child)){
                        int cols=(Integer)t.getCountX.invoke(child),rows=(Integer)t.getCountY.invoke(child);
                        if(workspacePages<64)workspaceGeometry.put(new JSONObject().put("childIndex",i).put("rows",rows).put("columns",cols));
                        if(workspacePages++==0){workspaceCols=cols;workspaceRows=rows;}
                        if(cols!=this.cols||rows!=this.rows)workspaceConsistent=false;
                    }
                }
                if(ws!=null)for(int i=0;i<ws.getChildCount();i++){
                    View child=ws.getChildAt(i);
                    if(t.deviceProfile.getDeclaringClass().isInstance(child)){
                        Object dp=t.deviceProfile.invoke(child);Object metrics=t.split==null?dp:t.split.workspace.invoke(dp);
                        Point size=(Point)t.cellSize.invoke(metrics);
                        Object actualProfile=t.observedDpIdp.get(dp);
                        if(observedProfile==null)observedProfile=actualProfile;
                        else if(observedProfile!=actualProfile)profileConsistent=false;
                        cellWidth=size.x;cellHeight=size.y;iconPixels=t.iconSize.getInt(metrics);labelPixels=t.textSize.getInt(metrics);
                    }
                }
                if(profile!=null){actualRows=t.idpRows.getInt(profile);actualCols=t.idpCols.getInt(profile);}
                boundIdpIdentity=observedProfile==null?0:System.identityHashCode(observedProfile);
                boundIdpConsistent=profileConsistent&&observedProfile==profile;
                boolean geometryMatches=workspacePages>0&&workspaceConsistent&&actualRows==rows&&actualCols==cols;
                String currentDatabase=observedProfile==null?database:(String)t.dbFile.get(observedProfile);
                Readout data=(owns||readBlocked)&&!storageUnavailable?Readout.read(context,currentDatabase):null;
                if(data!=null)captureReadout(data);
                reconsiderReadBlocked(data,observedProfile,profileConsistent);
                boolean pending=saved!=null&&saved.getBoolean("migration_pending",false);
                LauncherGridMigrationCheck.Result migration=owns&&!storageUnavailable&&pending?
                        LauncherGridMigrationCheck.check(data.complete,data.placements,migratedRows,rows,cols):null;
                boolean complete=owns&&!storageUnavailable&&(!pending||migration.complete);
                migrationResult=storageUnavailable?"private_state_unavailable":migration==null?"not_required":migration.complete?"persisted":migration.reason;
                boolean savedResult=true;
                if(complete&&geometryMatches) {
                    SharedPreferences.Editor edit=saved.edit();
                    if("restored".equals(state))edit.clear();
                    else edit.putBoolean("migration_pending",false);
                    savedResult=edit.commit();
                    if(savedResult&&"restored".equals(state))owns=false;
                    if(!savedResult){migrationResult="recovery_commit_failed";error="桌面布局已绑定，但无法保存迁移完成状态";}
                }
                if(!geometryMatches){applicationResult=workspacePages==0?"workspace_unobserved":"geometry_mismatch";
                    if(workspacePages>0)error="桌面实际行列与目标不一致";}
                else if("pending_restart".equals(state)||"waiting_config".equals(decision))applicationResult="pending_restart";
                else if("blocked".equals(state))applicationResult="blocked";
                else if(!savedResult)applicationResult="recovery_commit_failed";
                else if(pending&&!complete){applicationResult="migration_incomplete";error=migrationResult;}
                else {applicationResult=requested!=null&&requested.enabled?"applied":"native_bound";error="";}
                event("binding_result","result="+applicationResult+"|target="+cols+"x"+rows
                        +"|profile="+actualCols+"x"+actualRows+"|workspace="+workspaceCols+"x"+workspaceRows
                        +"|pages="+workspacePages+"|consistent="+workspaceConsistent+"|migration="+migrationResult);
                savePendingOverlay();report(true);queuePrivateRecovery();
            }catch(Throwable failure){applicationResult="binding_check_failed";error=String.valueOf(failure.getMessage());
                event("binding_result","result=binding_check_failed|error="+failure.getClass().getSimpleName());
                module.logFeatureError("LAUNCHER_GRID_EVIDENCE",failure);savePendingOverlay();report(true);}
        }

        synchronized void report(boolean bound){
            if(context==null)return;
            try{
                if(profile!=null){actualRows=t.idpRows.getInt(profile);actualCols=t.idpCols.getInt(profile);}
                JSONObject json=new JSONObject().put("pid",android.os.Process.myPid()).put("version",BuildConfig.VERSION_CODE)
                        .put("adapter",t.adapter).put("supported",true)
                        .put("configurationVerified",configurationVerified).put("receivedRevision",receivedRevision).put("latestRevision",latestRevision)
                        .put("savedEnabled",latestRequested!=null&&latestRequested.enabled)
                        .put("savedRows",latestRequested==null?0:latestRequested.rows).put("savedColumns",latestRequested==null?0:latestRequested.columns)
                        .put("requestedRows",requested==null?0:requested.rows).put("requestedColumns",requested==null?0:requested.columns)
                        .put("enabled",requested!=null&&requested.enabled).put("effectiveRows",actualRows).put("effectiveColumns",actualCols)
                        .put("workspaceRows",workspaceRows).put("workspaceColumns",workspaceCols).put("state",state).put("error",error)
                        .put("cellWidthPx",cellWidth).put("cellHeightPx",cellHeight).put("iconSizePx",iconPixels).put("labelSizePx",labelPixels)
                        .put("migrationPending",saved!=null&&saved.getBoolean("migration_pending",false))
                        .put("loadedItems",migratedRows==null?-1:migratedRows.size())
                        .put("databaseSource",readSource==null?new JSONObject():readSource.json())
                        .put("databaseTable",databaseTable)
                        .put("databaseSelection",databaseSelection)
                        .put("databaseConfiguredSource",configuredSource==null?new JSONObject():configuredSource.json())
                        .put("configureContextClass",configureContextClass).put("configureContextIdentity",configureContextIdentity)
                        .put("configureDisplay",configureDisplay).put("configuredIdpIdentity",configuredIdpIdentity)
                        .put("boundIdpIdentity",boundIdpIdentity).put("boundIdpConsistent",boundIdpConsistent)
                        .put("currentIdpIdentity",profile==null?0:System.identityHashCode(profile))
                        .put("bound",bound).put("repacked",repacked).put("database",database==null?"":database)
                        .put("decision",decision).put("applicationResult",applicationResult).put("migrationResult",migrationResult)
                        .put("settingsPending",settingsPending)
                        .put("observedApplicationResult",settingsPending?observedApplicationResult:applicationResult)
                        .put("observedError",settingsPending?observedError:error)
                        .put("customApplied","applied".equals(applicationResult))
                        .put("databaseReadState",readState).put("databaseReadStage",readStage).put("databaseReadError",readError).put("databaseItems",databaseItems)
                        .put("targetRows",rows).put("targetColumns",cols).put("workspacePages",workspacePages).put("workspaceConsistent",workspaceConsistent)
                        .put("workspaceGeometry",workspaceGeometry).put("workspaceGeometryTruncated",workspacePages>64)
                        .put("configuredAt",configuredAt).put("profileAppliedAt",profileAppliedAt).put("boundAt",boundAt)
                        .put("events",new JSONArray(events));
                FeatureSettings.diagnostic(context,DIAGNOSTIC,json.toString());
            }catch(Exception failure){module.logFeatureError("LAUNCHER_GRID_DIAGNOSTIC",failure);}
        }
    }

    private LauncherGridHook(){}
}
