package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real own Views and normal routes only. No feature save, permission/font change or workspace entry. */
final class AppsLicensesUiDeviceCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final List<Activity> owned = Collections.synchronizedList(new ArrayList<>());
    private final JSONArray layouts = new JSONArray(), recreations = new JSONArray(), screens = new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private String stage = "start";
    private float density, fontScale;

    private AppsLicensesUiDeviceCases(Instrumentation test) { this.test=test;context=test.getTargetContext(); }
    static JSONObject run(Instrumentation test) throws Exception { return new AppsLicensesUiDeviceCases(test).execute(); }
    static JSONObject runManagement(Instrumentation test) throws Exception { return new AppsLicensesUiDeviceCases(test).executeManagement(); }
    static JSONObject observeManagementDrag(Instrumentation test)throws Exception{return new AppsLicensesUiDeviceCases(test).executeDragObservation();}
    private JSONObject executeDragObservation()throws Exception {
        directory=new File(context.getExternalFilesDir(null),"apps-drag-observe/"+UUID.randomUUID());require(directory.mkdirs(),"Own observation directory");
        PreferenceGuard guard=new PreferenceGuard();Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        JSONObject result=new JSONObject().put("scope","OWNED_APP_ROW_LONG_PRESS_CANCEL_BEFORE_ANY_MOVE_OR_DROP");
        Throwable failure=null;boolean restored=false,held=false;long down=0;float x=0,y=0;
        try {
            Activity anchor=test.startActivitySync(new Intent(context,SettingsActivity.class).putExtra("tab","settings").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(()->{density=anchor.getResources().getDisplayMetrics().density;fontScale=anchor.getResources().getConfiguration().fontScale;
                ModuleNavigation.open(anchor,"atomic_workbench");return null;});
            Activity parent=await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null);click(parent,"navigation:atomic_workbench_apps");
            Activity page=await(AtomicWorkbenchAppsActivity.class,"atomic_workbench_apps",null);ready(page);require(managementState(page).mode==0,"Existing manual mode; observation never changes preferences");
            AtomicWorkbenchAppRepository.App own=null;for(AtomicWorkbenchAppRepository.App item:managementCatalog(page))if(item.packageName.equals("ls.augment.workbench.fixture.one")){own=item;break;}
            require(own!=null,"Real owned source");final AtomicWorkbenchAppRepository.App source=own;
            View handle=main(()->managementButton(managementRow(page,source),"移序",false));physicalBounds(page,handle,true);draw(page);
            main(()->{int[] point=new int[2],origin=new int[2];handle.getLocationOnScreen(point);ScrollView s=scroll(page);s.getLocationOnScreen(origin);
                s.scrollBy(0,point[1]+handle.getHeight()/2-origin[1]-s.getHeight()/2);return null;});draw(page);
            Rect point=physicalBounds(page,handle,false);x=point.exactCenterX();y=point.exactCenterY();final float sourceY=y;
            JSONObject before=main(()->{ScrollView s=scroll(page);int[] origin=new int[2];s.getLocationOnScreen(origin);float relative=sourceY-origin[1];
                require(relative>page.getResources().getDisplayMetrics().density*64&&relative<s.getHeight()-page.getResources().getDisplayMetrics().density*64,"Source is well inside the viewport");
                JSONObject state=managementDragState(page);
                return new JSONObject().put("scrollY",s.getScrollY()).put("sourceYInViewport",relative).put("viewportHeight",s.getHeight()).put("dragY",state.get("pointerY")).put("dragImplementation",state.get("implementation"));});
            result.put("focusBeforeDown",managementFocusOwner());capture(page,"00-before-owned-long-press");
            down=SystemClock.uptimeMillis();managementTouch(down,0,x,y);held=true;SystemClock.sleep(900);
            JSONObject after=main(()->{JSONObject state=managementDragState(page);return new JSONObject().put("scrollY",scroll(page).getScrollY()).put("dragY",state.get("pointerY")).put("sourceDragging",state.get("active")).put("dragImplementation",state.get("implementation"));});
            require(after.getBoolean("sourceDragging"),"Real long press started the actual page drag");
            result.put("before",before).put("afterLongPressBeforeAnyMove",after).put("injectedMoveCount",0).put("dropInjected",false)
                    .put("prematureScrollObserved",before.getInt("scrollY")!=after.getInt("scrollY"));
            result.put("focusAfterLongPress",managementFocusOwner());
            if("page_local_pointer".equals(after.getString("dragImplementation"))&&main(()->foreground(page)))capture(page,"01-held-local-pointer");
            else result.put("heldScreenshotSkipped","Do not capture an external panel after the native drag changes focus");
            managementTouch(down,3,x,y);held=false;
        }catch(Exception|AssertionError error){failure=error;
            try{Activity page=resumed;if(page instanceof AtomicWorkbenchAppsActivity){
                result.put("failureUiState",main(()->new JSONObject().put("busy",field(page,"busy")).put("readable",field(page,"readable"))
                        .put("windowFocused",page.hasWindowFocus()).put("route",ModuleNavigation.route(page))
                        .put("status",((TextView)field(page,"status")).getText().toString())));capture(page,"99-observation-failure");
            }}catch(Exception|AssertionError diagnostic){error.addSuppressed(diagnostic);}
        }
        finally {
            if(held)try{managementTouch(down,3,x,y);}catch(Exception|AssertionError cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            try{main(()->{List<Activity> pages;synchronized(owned){pages=new ArrayList<>(owned);}Collections.reverse(pages);for(Activity page:pages)if(!page.isDestroyed()&&!page.isFinishing())page.finish();return null;});test.waitForIdleSync();guard.restore();restored=true;}
            catch(Exception|AssertionError cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}finally{app.unregisterActivityLifecycleCallbacks(this);}
        }
        result.put("success",failure==null&&restored).put("preferencesExactlyRestored",restored).put("evidenceDirectory",directory.getAbsolutePath()).put("screens",screens);
        if(failure!=null)result.put("failure",android.util.Log.getStackTraceString(failure));
        try(FileOutputStream out=new FileOutputStream(new File(directory,"report.json"))){out.write(result.toString(2).getBytes(StandardCharsets.UTF_8));}return result;
    }
    /** Separate recovery receipt; never rewrites the original failed UI result. */
    static JSONObject recoverManagement(Instrumentation test,String name)throws Exception {
        require(name!=null&&name.matches("[0-9a-f-]{36}"),"Exact owned fixture directory identity");
        Context context=test.getTargetContext();File directory=new File(context.getExternalFilesDir(null),"apps-management-ui/"+name);
        JSONObject report=new JSONObject(new String(readBytes(()->new FileInputStream(new File(directory,"report.json"))),StandardCharsets.UTF_8));
        require("REAL_APP_LIST_CONTROLS_PERSISTENCE_AND_PHYSICAL_DRAG".equals(report.getString("scope"))
                &&"real-manual-drag".equals(report.getString("stage"))&&!report.getBoolean("preferencesExactlyRestored")
                &&report.getJSONArray("steps").length()==10,"Original failed test reached only the owned drag after ten confirmed writes");
        int user=android.os.Process.myUid()/100000;File file=new File(context.getFilesDir(),"atomic-workbench-apps/user-"+user+".bin");
        File backup=new File(directory,"preferences-before.bin");byte[] original=backup.exists()?readBytes(()->new FileInputStream(backup)):null;
        byte[] actual=readBytes(()->new FileInputStream(file));
        ArrayList<AtomicWorkbenchAppRepository.App> catalog=AtomicWorkbenchAppRepository.load(context),fixtures=new ArrayList<>();
        require(catalog.size()==report.getJSONArray("steps").getJSONObject(7).getInt("allRealCandidatesVerified"),"Real catalog has not changed");
        for(AtomicWorkbenchAppRepository.App item:catalog)if(item.packageName.matches("ls\\.augment\\.workbench\\.fixture\\.(one|two|three|four)"))fixtures.add(item);
        require(fixtures.size()==4,"Same owned candidates");AtomicWorkbenchAppRepository.App own=fixtures.get(0);
        AtomicWorkbenchAppListModel.State prior=AtomicWorkbenchAppListModel.decode(original,user).mode(0);
        prior=prior.visible(own.key(),prior.entry(own.key()).visible).pinned(own.key(),prior.entry(own.key()).pinned)
                .select(catalog,false).select(catalog,true).select(catalog,false);
        ArrayList<AtomicWorkbenchAppRepository.App> ordered=AtomicWorkbenchAppListModel.ordered(catalog,prior,AtomicWorkbenchAppListModel.Usage.unavailable(""),false,Collections.emptyList());
        AtomicWorkbenchAppRepository.App source=null;
        for(int i=1;i<ordered.size();i++)if(fixtures.contains(ordered.get(i-1))&&fixtures.contains(ordered.get(i))
                &&prior.entry(ordered.get(i-1).key()).pinned==prior.entry(ordered.get(i).key()).pinned){source=ordered.get(i);break;}
        require(source!=null,"Original deterministic owned drag source");ArrayList<String> matches=new ArrayList<>();
        for(AtomicWorkbenchAppRepository.App target:catalog)try{
            if(java.util.Arrays.equals(actual,AtomicWorkbenchAppListModel.encode(prior.move(catalog,source.key(),target.key()))))matches.add(target.key());
        }catch(IllegalArgumentException differentGroup){ }
        require(matches.size()==1,"Persisted state is exactly one native move from the original owned source");
        try(FileOutputStream out=new FileOutputStream(new File(directory,"unexpected-order-before-recovery.bin"))){out.write(actual);}
        Field lock=AtomicWorkbenchAppPreferences.class.getDeclaredField("LOCK");lock.setAccessible(true);
        synchronized(lock.get(null)){synchronized(ResetWriteFence.class){
            require(!ResetWriteFence.active()&&java.util.Arrays.equals(actual,readBytes(()->new FileInputStream(file))),"No newer reset or preference writer");
            android.util.AtomicFile atomic=new android.util.AtomicFile(file);
            if(original==null)atomic.delete();else{FileOutputStream out=null;try{out=atomic.startWrite();out.write(original);out.getFD().sync();atomic.finishWrite(out);}
                catch(Exception failure){if(out!=null)atomic.failWrite(out);throw failure;}}
            require(original==null?!file.exists():java.util.Arrays.equals(original,readBytes(()->new FileInputStream(file))),"Exact original preference file restored");
        }}
        JSONObject receipt=new JSONObject().put("success",true).put("originalFailedRecordUntouched",true)
                .put("originalPreferenceFileWasAbsent",original==null).put("verifiedNativeDragSource",source.key())
                .put("observedSingleNativeMoveTarget",matches.get(0)).put("preferencesExactlyRestored",true);
        try(FileOutputStream out=new FileOutputStream(new File(directory,"independent-recovery.json"))){out.write(receipt.toString(2).getBytes(StandardCharsets.UTF_8));}return receipt;
    }

    /** Writes only private list preferences through real controls, then restores the exact prior file. */
    private JSONObject executeManagement() throws Exception {
        directory=new File(context.getExternalFilesDir(null),"apps-management-ui/"+UUID.randomUUID());
        require(directory.mkdirs(),"Own evidence directory");
        JSONObject result=new JSONObject().put("scope","REAL_APP_LIST_CONTROLS_PERSISTENCE_AND_PHYSICAL_DRAG")
                .put("steps",new JSONArray()).put("screens",screens).put("layouts",layouts)
                .put("workspaceOpened",false).put("permissionChanged",false).put("fontChanged",false)
                .put("searchInput","Real EditText.setText; keyboard typing is not asserted");
        PreferenceGuard guard=new PreferenceGuard();String configBefore=new AppConfig(context).configSnapshot().checksum;
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;boolean restored=false;
        try {
            Activity anchor=test.startActivitySync(new Intent(context,SettingsActivity.class).putExtra("tab","settings").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(()->{density=anchor.getResources().getDisplayMetrics().density;fontScale=anchor.getResources().getConfiguration().fontScale;
                ModuleNavigation.open(anchor,"atomic_workbench");return null;});
            Activity parent=await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null);
            click(parent,"navigation:atomic_workbench_app_sort");
            Activity page=await(AtomicWorkbenchAppsActivity.class,"atomic_workbench_app_sort",null);ready(page);
            String[] names={"手动（默认）","使用频率","首字母"};
            for(int mode:new int[]{1,2,0}) {
                stage="save-mode-"+mode;AtomicWorkbenchAppListModel.State expected=managementState(page).mode(mode);
                guard.plan(expected);final Activity current=page;final String name=names[mode];
                physicalTap(page,main(()->managementButton(current.getWindow().getDecorView(),name,true)));
                awaitManagementState(page,expected);guard.confirm(expected);
                page=recreate(page);ready(page);awaitManagementState(page,expected);
                result.getJSONArray("steps").put(new JSONObject().put("case",stage).put("persistedAcrossRecreation",true));
            }
            measure(page,"management-sort");capture(page,"01-sort-saved");
            click(page,"breadcrumb:atomic_workbench");require(await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null)==parent,"Same parent retained");
            click(parent,"navigation:atomic_workbench_apps");page=await(AtomicWorkbenchAppsActivity.class,"atomic_workbench_apps",null);ready(page);
            ArrayList<AtomicWorkbenchAppRepository.App> catalog=managementCatalog(page);
            ArrayList<AtomicWorkbenchAppRepository.App> fixtures=new ArrayList<>();
            for(AtomicWorkbenchAppRepository.App item:catalog)if(item.packageName.matches("ls\\.augment\\.workbench\\.fixture\\.(one|two|three|four)"))fixtures.add(item);
            require(fixtures.size()==4,"Four real owned launcher candidates");
            AtomicWorkbenchAppRepository.App own=fixtures.get(0);
            managementSearch(page,own.packageName);
            for(int toggle=0;toggle<2;toggle++) {
                stage="visibility-"+toggle;AtomicWorkbenchAppListModel.State prior=managementState(page);
                AtomicWorkbenchAppListModel.State expected=prior.visible(own.key(),!prior.entry(own.key()).visible);guard.plan(expected);
                final Activity current=page;
                physicalTap(page,main(()->first(managementRow(current,own),android.widget.CheckBox.class)));
                awaitManagementState(page,expected);guard.confirm(expected);
                page=recreate(page);ready(page);awaitManagementState(page,expected);
                result.getJSONArray("steps").put(new JSONObject().put("case",stage).put("visible",expected.entry(own.key()).visible).put("persistedAcrossRecreation",true));
            }
            for(int toggle=0;toggle<2;toggle++) {
                stage="pin-"+toggle;AtomicWorkbenchAppListModel.State prior=managementState(page);
                AtomicWorkbenchAppListModel.State expected=prior.pinned(own.key(),!prior.entry(own.key()).pinned);guard.plan(expected);
                final Activity current=page;String label=prior.entry(own.key()).pinned?"取消置顶":"置顶";
                physicalTap(page,main(()->managementButton(managementRow(current,own),label,false)));
                awaitManagementState(page,expected);guard.confirm(expected);
                result.getJSONArray("steps").put(new JSONObject().put("case",stage).put("pinned",expected.entry(own.key()).pinned));
            }
            for(boolean invert:new boolean[]{false,true,false}) {
                stage=invert?"batch-invert-with-search":"batch-select-all-with-search";
                AtomicWorkbenchAppListModel.State expected=managementState(page).select(catalog,invert);guard.plan(expected);
                final Activity current=page;String label=invert?"反选":"全选";
                physicalTap(page,main(()->managementButton(current.getWindow().getDecorView(),label,false)));
                awaitManagementState(page,expected);guard.confirm(expected);
                result.getJSONArray("steps").put(new JSONObject().put("case",stage).put("allRealCandidatesVerified",catalog.size()).put("searchStillRestrictedToOwnedPackage",true));
            }
            managementSearch(page,"");stage="real-manual-drag";
            AtomicWorkbenchAppListModel.State prior=managementState(page);
            ArrayList<AtomicWorkbenchAppRepository.App> ordered=AtomicWorkbenchAppListModel.ordered(catalog,prior,AtomicWorkbenchAppListModel.Usage.unavailable(""),false,Collections.emptyList());
            AtomicWorkbenchAppRepository.App before=null,source=null;
            for(int i=1;i<ordered.size();i++)if(fixtures.contains(ordered.get(i-1))&&fixtures.contains(ordered.get(i))
                    &&prior.entry(ordered.get(i-1).key()).pinned==prior.entry(ordered.get(i).key()).pinned){before=ordered.get(i-1);source=ordered.get(i);break;}
            require(source!=null,"Adjacent owned drag candidates in the same native group");
            AtomicWorkbenchAppListModel.State expected=prior.move(catalog,source.key(),before.key());guard.plan(expected);
            physicalManagementDrag(page,source,before);awaitManagementState(page,expected);guard.confirm(expected);
            result.getJSONArray("steps").put(new JSONObject().put("case",stage).put("realLongPressMoveDrop",true));
            page=recreate(page);ready(page);awaitManagementState(page,expected);
            measure(page,"management-display");capture(page,"02-management-after-recreate");
            require(configBefore.equals(new AppConfig(context).configSnapshot().checksum),"Main feature configuration unchanged");
        } catch(Exception|AssertionError error){failure=error;}
        finally {
            try {
                main(()->{List<Activity> pages; synchronized(owned){pages=new ArrayList<>(owned);}Collections.reverse(pages);
                    for(Activity page:pages)if(!page.isDestroyed()&&!page.isFinishing())page.finish();return null;});test.waitForIdleSync();
                guard.restore();restored=true;
                require(configBefore.equals(new AppConfig(context).configSnapshot().checksum),"Final feature configuration unchanged");
            } catch(Exception|AssertionError cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            finally {app.unregisterActivityLifecycleCallbacks(this);}
        }
        result.put("success",failure==null&&restored).put("stage",stage).put("preferencesExactlyRestored",restored)
                .put("fontScale",fontScale).put("density",density).put("evidenceDirectory",directory.getAbsolutePath());
        if(failure!=null)result.put("failure",android.util.Log.getStackTraceString(failure));
        try(FileOutputStream out=new FileOutputStream(new File(directory,"report.json"))){out.write(result.toString(2).getBytes(StandardCharsets.UTF_8));}
        return result;
    }

    private final class PreferenceGuard {
        final File file=new File(context.getFilesDir(),"atomic-workbench-apps/user-"+(android.os.Process.myUid()/100000)+".bin");
        final byte[] original;final long generation=ResetWriteFence.generation();final java.util.Set<String> allowed=new java.util.HashSet<>();
        PreferenceGuard() throws Exception {
            require(!new File(file.getPath()+".bak").exists(),"No unresolved AtomicFile backup before management test");
            original=file.exists()?readBytes(()->new FileInputStream(file)):null;allowed.add(fileHash());
            if(original!=null)try(FileOutputStream out=new FileOutputStream(new File(directory,"preferences-before.bin"))){out.write(original);}
        }
        String fileHash()throws Exception{return file.exists()?sha(readBytes(()->new FileInputStream(file))):"ABSENT";}
        void plan(AtomicWorkbenchAppListModel.State next)throws Exception{require(allowed.contains(fileHash()),"No foreign preference write before action");allowed.add(sha(AtomicWorkbenchAppListModel.encode(next)));}
        void confirm(AtomicWorkbenchAppListModel.State next)throws Exception{require(sha(AtomicWorkbenchAppListModel.encode(next)).equals(fileHash()),"Actual persisted bytes match the UI operation");}
        void restore()throws Exception {
            Field field=AtomicWorkbenchAppPreferences.class.getDeclaredField("LOCK");field.setAccessible(true);
            synchronized(field.get(null)){synchronized(ResetWriteFence.class){
                require(!ResetWriteFence.stale(generation)&&allowed.contains(fileHash()),"Restore preserves a newer user/reset write");
                android.util.AtomicFile atomic=new android.util.AtomicFile(file);
                if(original==null)atomic.delete();else{FileOutputStream out=null;try{out=atomic.startWrite();out.write(original);out.getFD().sync();atomic.finishWrite(out);}
                    catch(Exception failure){if(out!=null)atomic.failWrite(out);throw failure;}}
                require((original==null?"ABSENT":sha(original)).equals(fileHash())&&!new File(file.getPath()+".bak").exists(),"Exact preference bytes/existence restored");
            }}
        }
    }
    private AtomicWorkbenchAppListModel.State managementState(Activity page)throws Exception{return main(()->(AtomicWorkbenchAppListModel.State)field(page,"state"));}
    @SuppressWarnings("unchecked") private ArrayList<AtomicWorkbenchAppRepository.App> managementCatalog(Activity page)throws Exception{return main(()->new ArrayList<>((ArrayList<AtomicWorkbenchAppRepository.App>)field(page,"catalog")));}
    private void awaitManagementState(Activity page,AtomicWorkbenchAppListModel.State expected)throws Exception {
        String hash=sha(AtomicWorkbenchAppListModel.encode(expected));long end=SystemClock.uptimeMillis()+8000;
        do{if(main(()->!(Boolean)field(page,"busy")&&(Boolean)field(page,"readable")&&hash.equals(sha(AtomicWorkbenchAppListModel.encode((AtomicWorkbenchAppListModel.State)field(page,"state"))))))return;SystemClock.sleep(40);}while(SystemClock.uptimeMillis()<end);
        throw new AssertionError("UI save/state not confirmed: "+stage);
    }
    private void managementSearch(Activity page,String query)throws Exception{main(()->{((EditText)field(page,"search")).setText(query);return null;});test.waitForIdleSync();ready(page);}
    private static View managementRow(Activity page,AtomicWorkbenchAppRepository.App app){
        ArrayList<View> matches=new ArrayList<>();managementFind(page.getWindow().getDecorView(),v->(app.label+"，"+app.component.flattenToShortString()).contentEquals(v.getContentDescription()==null?"":v.getContentDescription()),matches);
        require(matches.size()==1,"One actual owned application row");return (View)((View)matches.get(0).getParent()).getParent();
    }
    private static View managementButton(View root,String label,boolean mode){
        ArrayList<View> matches=new ArrayList<>();managementFind(root,v->v instanceof android.widget.Button&&!(v instanceof android.widget.CheckBox)
                &&(mode?label.equals(((TextView)v).getText().toString().replace("✓ ","")):label.contentEquals(((TextView)v).getText())),matches);
        require(matches.size()==1,"One actual action: "+label);return matches.get(0);
    }
    private static void managementFind(View root,java.util.function.Predicate<View> predicate,List<View> matches){if(predicate.test(root))matches.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)managementFind(((ViewGroup)root).getChildAt(i),predicate,matches);}
    private Rect physicalBounds(Activity page,View view,boolean reveal)throws Exception {
        return main(()->{require(resumed==page&&page.hasWindowFocus()&&page.getDisplay().getDisplayId()==0,"Exact own foreground phone page");
            require(view!=null&&view.isAttachedToWindow()&&view.isShown()&&view.isEnabled(),"Live enabled action");
            if(reveal)view.requestRectangleOnScreen(new Rect(0,0,view.getWidth(),view.getHeight()),true);
            Rect bounds=new Rect();require(view.getGlobalVisibleRect(bounds)&&bounds.width()>12&&bounds.height()>12,"Physical action bounds visible");return bounds;});
    }
    private void physicalTap(Activity page,View view)throws Exception {
        physicalBounds(page,view,true);draw(page);Rect rect=physicalBounds(page,view,false);long down=SystemClock.uptimeMillis();boolean held=false;
        try{managementTouch(down,0,rect.exactCenterX(),rect.exactCenterY());held=true;SystemClock.sleep(48);managementTouch(down,1,rect.exactCenterX(),rect.exactCenterY());held=false;}
        finally{if(held)managementTouch(down,3,rect.exactCenterX(),rect.exactCenterY());}test.waitForIdleSync();
    }
    private void physicalManagementDrag(Activity page,AtomicWorkbenchAppRepository.App source,AtomicWorkbenchAppRepository.App before)throws Exception {
        View handle=main(()->managementButton(managementRow(page,source),"移序",false));physicalBounds(page,handle,true);draw(page);
        main(()->{int[] point=new int[2],origin=new int[2];handle.getLocationOnScreen(point);ScrollView s=scroll(page);s.getLocationOnScreen(origin);
            s.scrollBy(0,point[1]+handle.getHeight()/2-origin[1]-s.getHeight()/2);return null;});draw(page);
        Rect from=physicalBounds(page,handle,false),to=physicalBounds(page,main(()->managementRow(page,before)),false);long down=SystemClock.uptimeMillis();boolean held=false;
        try{managementTouch(down,0,from.exactCenterX(),from.exactCenterY());held=true;SystemClock.sleep(900);
            for(int i=1;i<=12;i++){managementTouch(down,2,from.exactCenterX()+(to.exactCenterX()-from.exactCenterX())*i/12,from.exactCenterY()+(to.exactCenterY()-from.exactCenterY())*i/12);SystemClock.sleep(24);}
            require(main(()->managementDragState(page).getBoolean("active")),"Real long press started the unmodified page drag");
            require(main(()->{Rect current=new Rect();return managementRow(page,before).getGlobalVisibleRect(current)
                    &&current.contains((int)to.exactCenterX(),(int)to.exactCenterY());}),"Original target still under release point; otherwise cancel without writing");
            managementTouch(down,1,to.exactCenterX(),to.exactCenterY());held=false;
        }finally{if(held)managementTouch(down,3,to.exactCenterX(),to.exactCenterY());}test.waitForIdleSync();
    }
    private void managementTouch(long down,int action,float x,float y){
        android.view.MotionEvent.PointerProperties property=new android.view.MotionEvent.PointerProperties();property.id=0;property.toolType=android.view.MotionEvent.TOOL_TYPE_FINGER;
        android.view.MotionEvent.PointerCoords point=new android.view.MotionEvent.PointerCoords();point.x=x;point.y=y;point.pressure=action==1||action==3?0:1;point.size=1;
        android.view.MotionEvent event=android.view.MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,1,new android.view.MotionEvent.PointerProperties[]{property},new android.view.MotionEvent.PointerCoords[]{point},0,0,1,1,0,0,android.view.InputDevice.SOURCE_TOUCHSCREEN,0);
        try{require(test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).injectInputEvent(event,true),"Physical action accepted");}finally{event.recycle();}
    }
    private String managementFocusOwner()throws Exception {
        android.os.ParcelFileDescriptor descriptor=test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).executeShellCommand("dumpsys window displays");
        try(java.io.InputStream input=new android.os.ParcelFileDescriptor.AutoCloseInputStream(descriptor);ByteArrayOutputStream out=new ByteArrayOutputStream()){
            byte[] bytes=new byte[4096];int n;while((n=input.read(bytes))!=-1){require(out.size()+n<=512*1024,"Bounded window metadata only");out.write(bytes,0,n);}
            java.util.regex.Matcher match=java.util.regex.Pattern.compile("(?m)^\\s*mCurrentFocus=(.*)$").matcher(out.toString(StandardCharsets.UTF_8));return match.find()?match.group(1).trim():"unavailable";
        }
    }
    private static JSONObject managementDragState(Activity page)throws Exception {
        try{
            Object touch=field(page,"orderTouch");java.lang.reflect.Method active=touch.getClass().getDeclaredMethod("active"),pointer=touch.getClass().getDeclaredMethod("pointerY");
            active.setAccessible(true);pointer.setAccessible(true);
            return new JSONObject().put("implementation","page_local_pointer").put("active",active.invoke(touch)).put("pointerY",pointer.invoke(touch));
        }catch(NoSuchFieldException legacy){return new JSONObject().put("implementation","android_drag_drop").put("active",field(page,"dragging")).put("pointerY",field(page,"dragY"));}
    }

    private JSONObject execute() throws Exception {
        directory=new File(context.getExternalFilesDir(null),"apps-licenses-ui/"+UUID.randomUUID().toString());
        require(directory.mkdirs(),"Fresh evidence directory");
        Map<String,String> before=appPreferenceBytes();
        JSONObject result=new JSONObject().put("layouts",layouts).put("recreations",recreations).put("screens",screens)
                .put("featurePreferencesWritten",false).put("permissionChanged",false).put("fontChanged",false)
                .put("workspaceOpened",false).put("rootRequested",false).put("clockTouched",false)
                .put("scrollInput","Actual ScrollView.scrollTo state; physical drag/swipe is not asserted")
                .put("sortCoverage","Current saved/effective mode and its real controls only; no mode is saved by this group");
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try {
            Activity anchor=test.startActivitySync(new Intent(context,SettingsActivity.class)
                    .putExtra("tab","settings").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            main(()->{density=anchor.getResources().getDisplayMetrics().density;
                fontScale=anchor.getResources().getConfiguration().fontScale;ModuleNavigation.open(anchor,"atomic_workbench");return null;});
            Activity parent=await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null);
            stage="apps-display";click(parent,"navigation:atomic_workbench_apps");
            Activity display=await(AtomicWorkbenchAppsActivity.class,"atomic_workbench_apps",null);ready(display);
            measure(display,"apps-display");capture(display,"01-apps-display");
            display=searchAndGroupRecreation(display);
            display=scrollRecreation(display,"apps-display-scrolled");
            click(display,"breadcrumb:atomic_workbench");
            require(await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null)==parent,"Display breadcrumb retains actual parent");
            stage="apps-sort";click(parent,"navigation:atomic_workbench_app_sort");
            Activity sort=await(AtomicWorkbenchAppsActivity.class,"atomic_workbench_app_sort",null);ready(sort);
            measure(sort,"apps-sort");capture(sort,"02-apps-sort");
            final Activity sortPage=sort;
            result.put("sortModes",main(()->{
                AtomicWorkbenchAppListModel.State state=(AtomicWorkbenchAppListModel.State)field(sortPage,"state");
                AtomicWorkbenchAppListModel.Usage usage=(AtomicWorkbenchAppListModel.Usage)field(sortPage,"usage");
                return new JSONObject().put("requested",state.mode).put("effective",AtomicWorkbenchAppListModel.effectiveMode(state,usage))
                        .put("usageAvailable",usage.available).put("savedModeChanged",false);
            }));
            sort=scrollRecreation(sort,"apps-sort-scrolled");
            click(sort,"breadcrumb:atomic_workbench");
            require(await(AtomicWorkbenchSettingsActivity.class,"atomic_workbench",null)==parent,"Sort breadcrumb retains actual parent");
            stage="licenses-list";main(()->{ModuleNavigation.open(parent,"licenses");return null;});
            Activity list=await(ModuleLicensesActivity.class,"licenses",null);ready(list);
            measure(list,"licenses-list");capture(list,"03-licenses-list");
            list=scrollRecreation(list,"licenses-list-scrolled");
            final Activity listPage=list;
            int listY=main(()->scroll(listPage).getScrollY());
            stage="license-document";click(list,"navigation:license:liftarc");
            Activity document=await(ModuleLicensesActivity.class,"license_document",null);ready(document);
            measure(document,"license-document");capture(document,"04-license-document");
            final Activity textPage=document;
            result.put("document",main(()->{
                TextView text=(TextView)tag(textPage,"license-full-text");
                byte[] asset=readBytes(new FileInputStreamSource(context,"licenses/liftarc-GPL-3.0.txt"));
                byte[] visible=text.getText().toString().getBytes(StandardCharsets.UTF_8);
                require(java.util.Arrays.equals(asset,visible),"Full body equals this APK's complete asset bytes");
                return new JSONObject().put("id","liftarc").put("assetBytes",asset.length).put("bodyUtf8Sha256",sha(visible))
                        .put("textSizePx",text.getTextSize()).put("textSizeSp",text.getTextSize()/text.getResources().getDisplayMetrics().scaledDensity)
                        .put("selectable",text.isTextSelectable()).put("layoutLines",text.getLineCount());
            }));
            document=scrollRecreation(document,"license-document-scrolled");
            click(document,"breadcrumb:licenses");
            require(await(ModuleLicensesActivity.class,"licenses",null)==list,"Document breadcrumb returns to same list");
            require(main(()->Math.abs(scroll(listPage).getScrollY()-listY)<=1),"Returning preserves list scroll");
            require(before.equals(appPreferenceBytes()),"App preference bytes unchanged");
        } catch(Exception|AssertionError error) { failure=error; }
        finally {
            try { main(()->{List<Activity> pages; synchronized(owned){pages=new ArrayList<>(owned);}
                Collections.reverse(pages);for(Activity page:pages)if(!page.isDestroyed()&&!page.isFinishing())page.finish();return null;});
                test.waitForIdleSync();require(before.equals(appPreferenceBytes()),"Final app preference bytes unchanged");
            } catch(Exception|AssertionError cleanup) { if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup); }
            finally { app.unregisterActivityLifecycleCallbacks(this); }
        }
        result.put("success",failure==null).put("stage",stage).put("phoneValidated",failure==null)
                .put("fontScale",fontScale).put("density",density).put("evidenceDirectory",directory.getAbsolutePath());
        if(failure!=null)result.put("failure",android.util.Log.getStackTraceString(failure));
        try(FileOutputStream out=new FileOutputStream(new File(directory,"report.json"))) {
            out.write(result.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        return result;
    }

    private Activity searchAndGroupRecreation(Activity page) throws Exception {
        int expectedGroup=main(()->{
            @SuppressWarnings("unchecked") ArrayList<AtomicWorkbenchAppRepository.App> apps=(ArrayList<AtomicWorkbenchAppRepository.App>)field(page,"catalog");
            require(!apps.isEmpty(),"At least one current candidate is necessary for search/group case");
            AtomicWorkbenchAppListModel.State state=(AtomicWorkbenchAppListModel.State)field(page,"state");
            int group=state.entry(apps.get(0).key()).visible?AtomicWorkbenchAppListModel.SELECTED:AtomicWorkbenchAppListModel.HIDDEN;
            ((EditText)field(page,"search")).setText(".");
            Spinner filter=first(page.getWindow().getDecorView(),Spinner.class);require(filter!=null,"Real group Spinner");
            filter.setSelection(group);return group;
        });
        test.waitForIdleSync();Activity replacement=recreate(page);ready(replacement);
        require(main(()->".".contentEquals(((EditText)field(replacement,"search")).getText())
                &&((Number)field(replacement,"group")).intValue()==expectedGroup),"Recreation retains actual query and selected group");
        recreations.put(new JSONObject().put("case","apps-query-group").put("nonEmptyQueryRestored",true).put("group",expectedGroup));
        return replacement;
    }
    private Activity scrollRecreation(Activity page,String name) throws Exception {
        ready(page);int range=main(()->range(scroll(page)));
        if(range<=0) {
            Activity replacement=recreate(page);ready(replacement);
            require(main(()->scroll(replacement).getScrollY()==0),"Zero-range page remains at its real top after recreation");
            recreations.put(new JSONObject().put("case",name).put("status","RECREATED_WITHOUT_POSITIVE_SCROLL_RANGE")
                    .put("positiveScrollRestorationTested",false).put("rangePx",range));return replacement;
        }
        int target=Math.min(range,Math.max(1,Math.round(240*density)));
        main(()->{scroll(page).scrollTo(0,target);return null;});draw(page);int before=main(()->scroll(page).getScrollY());
        require(before>0,"A real positive scroll position was reached");Activity replacement=recreate(page);ready(replacement);
        int after=main(()->scroll(replacement).getScrollY()),nextRange=main(()->range(scroll(replacement)));
        require(Math.abs(after-Math.min(before,nextRange))<=1,"Recreation preserves scroll within actual new content range");
        recreations.put(new JSONObject().put("case",name).put("status","OBSERVED_RESTORED").put("beforePx",before)
                .put("afterPx",after).put("oldRangePx",range).put("newRangePx",nextRange));return replacement;
    }
    private Activity recreate(Activity original) throws Exception {
        String route=main(()->ModuleNavigation.route(original));Class<? extends Activity> type=original.getClass();
        main(()->{original.recreate();return null;});return await(type,route,original);
    }
    private void measure(Activity page,String name) throws Exception {
        main(()->{scroll(page).scrollTo(0,0);return null;});draw(page);
        layouts.put(main(()->{
            require(foreground(page),"Own page focused and unlocked at View measurement");
            View path=tag(page,"page-path");View first=page instanceof AtomicWorkbenchAppsActivity
                    ?tag(page,"atomic-workbench-app-preferences-status"):section(page.getWindow().getDecorView());
            require(path!=null&&first!=null&&path.isShown()&&first.isShown(),"Attached real path and first content");
            require(path.getWindowToken()==first.getWindowToken(),"Both measurements use the same actual Window");
            Rect nav=bounds(path),content=bounds(first);float d=page.getResources().getDisplayMetrics().density;
            require(d==density&&page.getResources().getConfiguration().fontScale==fontScale,"Device density/fontScale remain unchanged");
            int gap=content.top-nav.bottom;require(gap>=8*d-1&&gap<=12*d+1,"Actual path-to-first-control total gap is 8–12dp (one-pixel rounding)");
            TextView text=(TextView)first;TextView crumb=(TextView)tag(page,"breadcrumb:"+ModuleNavigation.route(page));
            require(crumb!=null,"Actual current breadcrumb View");
            return new JSONObject().put("name",name).put("route",ModuleNavigation.route(page)).put("pathTag",String.valueOf(path.getTag()))
                    .put("firstTag",String.valueOf(first.getTag())).put("pathBoundsPx",rect(nav)).put("firstBoundsPx",rect(content))
                    .put("gapPx",gap).put("gapDp",gap/d).put("roundingTolerancePx",1).put("density",d)
                    .put("fontScale",fontScale).put("firstTextSizePx",text.getTextSize()).put("breadcrumbTextSizePx",crumb.getTextSize())
                    .put("firstTextSizeSp",text.getTextSize()/page.getResources().getDisplayMetrics().scaledDensity)
                    .put("firstLines",text.getLineCount()).put("windowMeasured",true);
        }));
    }
    private void ready(Activity page) throws Exception {
        awaitCheck(()->main(()->{
            if(page.isDestroyed()||!page.getWindow().getDecorView().isAttachedToWindow()||!foreground(page))return false;
            if(page instanceof AtomicWorkbenchAppsActivity)return !((Boolean)field(page,"busy"))&&((Boolean)field(page,"readable"))&&field(page,"state")!=null;
            return !(Boolean)field(page,"loading");
        }),"Real asynchronous page load");draw(page);
    }
    private Activity await(Class<? extends Activity> type,String route,Activity previous) throws Exception {
        awaitCheck(()->{Activity page=resumed;return page!=null&&page!=previous&&type.isInstance(page)
                &&main(()->!page.isDestroyed()&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)));},"Actual resumed route "+route);
        return resumed;
    }
    private void click(Activity page,String name) throws Exception {
        main(()->{View view=tag(page,name);require(view!=null&&view.isShown()&&view.isEnabled(),"Normal route View "+name);
            require(view.performClick(),"Route click dispatched");return null;});test.waitForIdleSync();
    }
    private void draw(Activity page) throws Exception {
        CountDownLatch latch=new CountDownLatch(1);AtomicReference<ViewTreeObserver.OnDrawListener> listener=new AtomicReference<>();
        ViewTreeObserver tree=main(()->{
            View decor=page.getWindow().getDecorView();require(decor.isAttachedToWindow(),"Own page attached");
            ViewTreeObserver observer=decor.getViewTreeObserver();ViewTreeObserver.OnDrawListener callback=new ViewTreeObserver.OnDrawListener(){boolean seen;
                public void onDraw(){if(seen)return;seen=true;decor.postOnAnimation(()->decor.postOnAnimation(latch::countDown));}};
            listener.set(callback);observer.addOnDrawListener(callback);decor.invalidate();return observer;
        });
        try { require(latch.await(8,TimeUnit.SECONDS),"Actual draw and two frames"); }
        finally { main(()->{if(tree.isAlive())tree.removeOnDrawListener(listener.get());return null;}); }
        test.waitForIdleSync();
    }
    private void capture(Activity page,String name) throws Exception {
        draw(page);require(main(()->foreground(page)),"Own page focused and unlocked before screenshot");
        Bitmap image=test.getUiAutomation(android.app.UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(image!=null,"Actual screenshot");
        try {
            require(main(()->foreground(page)),"Own page still focused and unlocked after screenshot");
            File file=new File(directory,name+".png");
            try(FileOutputStream out=new FileOutputStream(file)){require(image.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot saved");}
            screens.put(new JSONObject().put("name",name).put("path",file.getAbsolutePath()).put("viewMeasurementsSeparate",true));
        } finally { image.recycle(); }
    }
    private static boolean foreground(Activity page) {
        android.app.KeyguardManager keyguard=page.getSystemService(android.app.KeyguardManager.class);
        return page.hasWindowFocus()&&keyguard!=null&&!keyguard.isKeyguardLocked();
    }
    private Map<String,String> appPreferenceBytes() throws Exception {
        Map<String,String> result=new LinkedHashMap<>();String relative="atomic-workbench-apps/user-"+(android.os.Process.myUid()/100000)+".bin";
        for(String suffix:new String[]{"",".bak"}){File file=new File(context.getFilesDir(),relative+suffix);
            result.put(relative+suffix,file.exists()?sha(readBytes(()->new FileInputStream(file))):"ABSENT");}return result;
    }
    private interface Input { java.io.InputStream open() throws Exception; }
    private static final class FileInputStreamSource implements Input {
        final Context context;final String path;FileInputStreamSource(Context context,String path){this.context=context;this.path=path;}
        public java.io.InputStream open() throws Exception{return context.getAssets().open(path);}
    }
    private static byte[] readBytes(Input source) throws Exception {
        try(java.io.InputStream in=source.open();ByteArrayOutputStream out=new ByteArrayOutputStream()){
            byte[] bytes=new byte[4096];int n;while((n=in.read(bytes))!=-1){require(out.size()+n<=2*1024*1024,"Bounded own file/asset read");out.write(bytes,0,n);}return out.toByteArray();}
    }
    private static String sha(byte[] value) throws Exception {StringBuilder out=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(value))out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return out.toString();}
    private static ScrollView scroll(Activity page) throws Exception {ScrollView view=page instanceof AtomicWorkbenchAppsActivity?(ScrollView)field(page,"scroll"):(ScrollView)tag(page,"detail-scroll");require(view!=null,"Actual content ScrollView");return view;}
    private static int range(ScrollView s){return s.getChildCount()==0?0:Math.max(0,s.getChildAt(0).getHeight()-Math.max(0,s.getHeight()-s.getPaddingTop()-s.getPaddingBottom()));}
    private static Object field(Object owner,String name) throws Exception {Field f=owner.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(owner);}
    private static View tag(Activity page,String name){return page.getWindow().getDecorView().findViewWithTag(name);}
    private static View section(View root){Object t=root.getTag();if(t instanceof String&&((String)t).startsWith("section-title:"))return root;
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){View result=section(((ViewGroup)root).getChildAt(i));if(result!=null)return result;}return null;}
    private static <T extends View>T first(View root,Class<T> type){if(type.isInstance(root))return type.cast(root);
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T value=first(((ViewGroup)root).getChildAt(i),type);if(value!=null)return value;}return null;}
    private static Rect bounds(View view){int[] xy=new int[2];view.getLocationInWindow(xy);return new Rect(xy[0],xy[1],xy[0]+view.getWidth(),xy[1]+view.getHeight());}
    private static JSONObject rect(Rect r)throws Exception{return new JSONObject().put("left",r.left).put("top",r.top).put("right",r.right).put("bottom",r.bottom);}
    private interface Check{boolean get() throws Exception;}private interface Work<T>{T get() throws Exception;}
    private void awaitCheck(Check check,String detail)throws Exception{long until=SystemClock.uptimeMillis()+8000;while(!check.get()&&SystemClock.uptimeMillis()<until)SystemClock.sleep(50);require(check.get(),detail);test.waitForIdleSync();}
    private <T>T main(Work<T> work)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(work.get());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError(error.get());return value.get();}
    private static void require(boolean value,String detail){if(!value)throw new AssertionError(detail);}
    @Override public void onActivityCreated(Activity a,Bundle state){if(a instanceof SettingsActivity||a instanceof AtomicWorkbenchSettingsActivity||a instanceof AtomicWorkbenchAppsActivity||a instanceof ModuleLicensesActivity)owned.add(a);}
    @Override public void onActivityResumed(Activity a){resumed=a;}
    @Override public void onActivityStarted(Activity a){} @Override public void onActivityPaused(Activity a){}
    @Override public void onActivityStopped(Activity a){} @Override public void onActivitySaveInstanceState(Activity a,Bundle b){}
    @Override public void onActivityDestroyed(Activity a){}
}
