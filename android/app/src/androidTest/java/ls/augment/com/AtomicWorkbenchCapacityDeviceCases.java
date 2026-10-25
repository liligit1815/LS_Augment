package ls.augment.com;

import android.app.Activity;
import android.app.BroadcastOptions;
import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test APK only: single-main seven-fixture capacity, genuine UI input and same-Task recovery. */
final class AtomicWorkbenchCapacityDeviceCases {
    private static final String[] PACKAGES={"ls.augment.workbench.fixture.one","ls.augment.workbench.fixture.two",
            "ls.augment.workbench.fixture.three","ls.augment.workbench.fixture.four","ls.augment.workbench.fixture.five",
            "ls.augment.workbench.fixture.six","ls.augment.workbench.fixture.seven"};
    private static final String[] CONFIG={AtomicWorkbenchConfig.SIDE_COUNT,AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS,
            AtomicWorkbenchConfig.QUICK_OPEN_APPS};
    private static final String[] COUNTERS={"click_count","touch_down_count","touch_up_count","touch_cancel_count",
            "long_click_count","pointer_down_count","pointer_up_count","touch_event_count"};
    private final Instrumentation test;
    private final Context target;
    private final AppConfig config;
    private final Object observationLock=new Object();
    private final Map<String,Integer> uids=new HashMap<>();
    private final Map<String,String> nonces=new HashMap<>();
    private final Map<String,Bundle> observations=new HashMap<>();
    private final Map<String,Owner> owners=new LinkedHashMap<>();
    private final Map<String,Long> attempts=new LinkedHashMap<>();
    private final JSONArray actions=new JSONArray();
    private Activity activity;
    private String stage="preflight";
    private boolean ownsSession;
    private final BroadcastReceiver receiver=new BroadcastReceiver(){
        @Override public void onReceive(Context context,Intent intent){
            try {
                if(intent==null||intent.getExtras()==null)return;
                Bundle value=new Bundle(intent.getExtras());Object p=value.get("fixture_package");
                if(!(p instanceof String))return;String pkg=(String)p;Integer uid=uids.get(pkg);
                if(uid==null||getSentFromUid()!=uid||!Integer.valueOf(AtomicWorkbenchFixtureActivity.PROTOCOL).equals(value.get("fixture_protocol"))
                        ||!(value.get("at_uptime") instanceof Long)||!(value.get("task_id") instanceof Integer)
                        ||!(value.get("display_id") instanceof Integer)||!(value.get("destroyed") instanceof Boolean))return;
                synchronized(observationLock){
                    if(!nonces.getOrDefault(pkg,"").equals(value.get("nonce")))return;
                    Bundle previous=observations.get(pkg);
                    if(previous!=null&&(previous.getLong("at_uptime")>value.getLong("at_uptime")
                            ||previous.getBoolean("destroyed")&&!value.getBoolean("destroyed")))return;
                    observations.put(pkg,value);
                }
            }catch(RuntimeException malformed){ /* No unauthenticated/malformed event can become a test fact. */ }
        }
    };

    private AtomicWorkbenchCapacityDeviceCases(Instrumentation test){
        this.test=test;target=test.getTargetContext();config=new AppConfig(target);
    }
    private boolean placementRun;
    static JSONObject run(Instrumentation test)throws Exception{return new AtomicWorkbenchCapacityDeviceCases(test).execute(false);}
    static JSONObject runPlacement(Instrumentation test)throws Exception{return new AtomicWorkbenchCapacityDeviceCases(test).execute(true);}

    private JSONObject execute(boolean placement)throws Exception{
        placementRun=placement;
        JSONObject report=new JSONObject().put("success",false).put("scope","SINGLE_MAIN_SEVEN_REAL_FIXTURES")
                .put("simultaneouslyVisibleLimit",7).put("dualTested",false).put("eightVisibleClaimed",false)
                .put("launchMethod","REAL_NORMAL_APP_TILE").put("actions",actions)
                .put("firstTouchTimingClaimed",false).put("wholeGoalVerified",false);
        Map<String,String> original=new LinkedHashMap<>();for(String key:CONFIG)original.put(key,config.get(key));
        boolean registered=false,changed=false,business=false,recovered=false,finished=false,settingsRestored=false;
        try{
            require(config.getBoolean(AtomicWorkbenchConfig.ENABLED),"workbench_not_enabled");
            require(!AtomicWorkbenchCleanup.pending(),"prior_cleanup_pending");
            android.os.PowerManager power=target.getSystemService(android.os.PowerManager.class);
            android.app.KeyguardManager keyguard=target.getSystemService(android.app.KeyguardManager.class);
            require(power!=null&&power.isInteractive()&&keyguard!=null&&!keyguard.isKeyguardLocked(),"awake_unlocked_required");
            for(String pkg:PACKAGES)uids.put(pkg,target.getPackageManager().getApplicationInfo(pkg,0).uid);
            require(new HashSet<>(uids.values()).size()==7,"seven_distinct_fixture_uids_required");
            target.registerReceiver(receiver,new IntentFilter(AtomicWorkbenchFixtureActivity.ACTION_STATE),Context.RECEIVER_EXPORTED);registered=true;
            stage="configure_six_sides";changed=true;save(Map.of(AtomicWorkbenchConfig.SIDE_COUNT,placement?"3":"6",AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS,"0",AtomicWorkbenchConfig.QUICK_OPEN_APPS,"1"));
            activity=test.startActivitySync(new Intent(target,AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,"atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));ownsSession=true;
            main(()->{activity.getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
            await(()->main(()->field("client")!=null&&(Boolean)invoke("mainReady",new Class<?>[0])
                    &&(Boolean)invoke("canInteract",new Class<?>[0])),"initial_home_ready");
            requireRoles(placement?3:6);
            for(Bundle state:pool())requireInitialWindow(state,android.os.Process.myUid());
            for(int index=0;index<(placement?4:7);index++){String pkg=PACKAGES[index];stage="normal_app_launch_"+pkg;owners.put(pkg,launch(pkg));}
            if(placement){
                report.put("scope","EXACT_APP_PLACEMENT_AND_OUTPUT_RELOAD").put("simultaneouslyVisibleLimit",4);
                verifyPlacement(report); business=true;
            } else {
            HashSet<Integer> tasks=new HashSet<>(),windows=new HashSet<>(),displays=new HashSet<>();
            for(Owner owner:owners.values()){tasks.add(owner.task);windows.add(owner.window);displays.add(owner.display);}
            require(tasks.size()==7&&windows.size()==7&&displays.size()==7,"seven_unique_task_window_display_required");
            report.put("sevenOwners",assertOwners(true));requireRoles(6);
            int high=0;
            for(Owner owner:owners.values())if(owner.window>=4){
                high++;stage="high_input_"+owner.window;promoteSide(owner);verifyInput(owner);
            }
            require(high>=3,"three_real_high_owners_required");report.put("highOwnersWithInput",high);
            stage="shrink_six_to_three";changeSides(3);assertOwners(false);
            Owner hidden=null;
            for(Owner owner:owners.values())if(owner.window>=4&&!main(()->model().topology().eligible(owner.window))){hidden=owner;break;}
            require(hidden!=null,"high_hidden_owner_required");final Owner returning=hidden;
            Bundle detached=state(pool(),hidden.window);
            require(Boolean.TRUE.equals(detached.get("output_attached_known"))&&Boolean.FALSE.equals(detached.get("output_attached")),"hidden_output_not_detached");
            require(main(()->{
                View frame=(View)slot(returning.window,"frame");Rect clipped=new Rect();
                return !model().topology().eligible(returning.window)&&(!frame.getGlobalVisibleRect(clipped)||clipped.isEmpty());
            }),"hidden_frame_not_clipped_outside_workspace");
            report.put("hiddenOwnerBeforeRecall",hidden.json());
            stage="normal_app_recall_hidden";clickApp(hidden.pkg,false);awaitMain(hidden);
            assertOwners(false);Bundle recalled=query(hidden.pkg,v->sameOwner(returning,v));
            require(recalled.getInt("task_id")==hidden.task,"hidden_app_created_replacement_task");
            report.put("hiddenRecall",hidden.json().put("sameTaskConfirmed",true).put("method","NORMAL_APP_TILE"));
            stage="expand_three_to_six";changeSides(6);report.put("afterExpand",assertOwners(true));
            business=true;
            }
        }catch(Exception|AssertionError invalid){report.put("failureStage",stage).put("failureType",invalid.getClass().getName()).put("failureReason",failureReason(invalid));
            try{report.put("cachedUiFailure",cachedUiFailureSnapshot());}catch(Throwable ignored){ /* Diagnostic failure never skips the original finally. */ }
        }
        finally{
            try{
                if(ownsSession){
                    stage="normal_close_and_recovery";
                    recovered=recover(report);
                    if(recovered)finished=finishReturned(report);
                }
            }catch(Exception|AssertionError invalid){report.put("recoveryFailureStage",stage).put("recoveryFailureType",invalid.getClass().getName()).put("recoveryFailureReason",failureReason(invalid));}
            finally{
                if(registered)try{target.unregisterReceiver(receiver);}catch(RuntimeException invalid){report.put("unregisterFailureType",invalid.getClass().getName());recovered=false;}
                try{if(changed)save(original);for(Map.Entry<String,String> entry:original.entrySet())
                    require(entry.getValue().equals(config.get(entry.getKey())),"original_configuration_readback_changed");settingsRestored=true;}
                catch(Exception|AssertionError invalid){report.put("configurationRestoreFailureType",invalid.getClass().getName()).put("configurationRestoreFailureReason",failureReason(invalid));}
            }
        }
        return report.put("businessChecksPassed",business).put("sameFixtureTasksReturned",recovered)
                .put("fixturesFinishedAfterReturn",finished).put("originalThreeSettingsRestored",settingsRestored)
                .put("success",business&&recovered&&finished&&settingsRestored);
    }

    private void verifyPlacement(JSONObject report)throws Exception{
        stage="reload_original_main";
        int mainId=main(()->model().mainWindowId());Owner activeOwner=null;
        for(Owner owner:owners.values())if(owner.window==mainId)activeOwner=owner;
        require(activeOwner!=null,"placement_main_missing");final Owner originalMain=activeOwner;
        await(()->main(()->{View reload=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-reload");
            return reload!=null&&reload.isEnabled()&&(Boolean)invoke("mainReady",new Class<?>[0]);}),"reload_button_unavailable");
        long sequence=main(()->(Long)field("outputSequence"));
        main(()->{View reload=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-reload");
            require(reload!=null&&reload.isEnabled()&&reload.performClick(),"reload_button_unavailable");
            reload.performClick();return null;});
        awaitMain(originalMain);
        long afterSequence=main(()->(Long)field("outputSequence"));report.put("reloadOutputSequenceBefore",sequence).put("reloadOutputSequenceAfter",afterSequence);
        require(afterSequence==sequence+2,"reload_repeated_or_other_output_changed");
        assertOwners(true);report.put("reloadSameOwner",originalMain.json());screenshot("placement-reloaded");

        stage="side_long_press_promote";int side=main(()->model().sideWindowIds()[0]);Owner sideOwner=null;
        for(Owner owner:owners.values())if(owner.window==side)sideOwner=owner;
        require(sideOwner!=null,"placement_side_missing");final Owner promoted=sideOwner;
        main(()->{require(((View)slot(side,"shield")).performLongClick(),"side_long_click_rejected");return null;});
        choice(0);awaitMain(promoted);assertOwners(true);report.put("longPressSameOwner",promoted.json());

        stage="cancel_full_destination";String added=PACKAGES[4];
        int targetId=main(()->model().sideWindowIds()[1]);Owner displaced=null;
        for(Owner owner:owners.values())if(owner.window==targetId)displaced=owner;
        require(displaced!=null,"placement_target_missing");final Owner oldTarget=displaced;
        clickApp(added,false);dialog();main(()->{((android.app.Dialog)field("closeDialog")).cancel();return null;});
        await(()->main(()->(Boolean)invoke("canInteract",new Class<?>[0])&&!(Boolean)field("hostDialogActive")),"placement_cancel_dialog_focus");
        assertOwners(true);report.put("fullCancelPreservedOwners",true);

        stage="replace_exact_side_from_full";clickApp(added,false);choice(2);dialog();
        main(()->{android.app.Dialog d=(android.app.Dialog)field("closeDialog");
            View button=findText(d.getWindow().getDecorView(),"替换窗口");require(button!=null&&button.performClick(),"replacement_confirm_missing");
            attempts.put(added,SystemClock.uptimeMillis());return null;});
        await(()->main(()->model().component(targetId)!=null&&component(added).equals(model().component(targetId))
                &&model().mainWindowId()==promoted.window&&(Boolean)invoke("mainReady",new Class<?>[0])
                &&(Boolean)invoke("canInteract",new Class<?>[0])),"exact_side_new_owner_not_ready");
        Owner replacement=new Owner(added,state(pool(),targetId));owners.put(added,replacement);
        query(added,v->sameOwner(replacement,v)&&geometry(v));
        require(taskOnPhone(oldTarget),"displaced_task_not_on_phone");
        for(Owner owner:owners.values())if(owner!=oldTarget)require(owner.matches(state(pool(),owner.window)),"unrelated_replacement_owner_changed");
        report.put("exactReplacement",replacement.json()).put("displacedSameTaskOnPhone",oldTarget.json());screenshot("placement-replaced-side");

        stage="real_app_drag_swap_sides";
        int[] before=main(()->model().sideWindowIds());int destination=before[0];
        dragApp(added,destination,false);
        await(()->main(()->model().sideWindowIds()[0]==replacement.window&&(Boolean)invoke("canInteract",new Class<?>[0])
                &&(Boolean)invoke("mainReady",new Class<?>[0])),"exact_drag_role_not_committed");
        require(replacement.matches(state(pool(),replacement.window)),"drag_changed_native_owner");
        require(main(()->model().mainWindowId())==promoted.window,"side_drag_stole_main_position");
        report.put("realDragSameOwner",replacement.json());screenshot("placement-dragged-side");
        stage="real_app_drag_cancel";int[] stable=main(()->model().sideWindowIds());
        dragApp(added,main(()->model().mainWindowId()),true);
        require(java.util.Arrays.equals(stable,main(()->model().sideWindowIds())),"cancelled_drag_changed_roles");
        report.put("realDragCancelPreservedRoles",true).put("wholeGoalVerified",false);
    }
    private void dragApp(String pkg,int destination,boolean cancel)throws Exception{
        main(()->{View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+component(pkg));
            require(tile!=null,"app_drag_tile_missing");tile.requestRectangleOnScreen(new Rect(0,0,tile.getWidth(),tile.getHeight()),true);return null;});
        SystemClock.sleep(150);
        float[] from=main(()->center(activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+component(pkg))));
        float[] to=main(()->center((View)slot(destination,"frame")));
        long down=SystemClock.uptimeMillis();boolean released=false;
        try{
            inject(down,MotionEvent.ACTION_DOWN,from);SystemClock.sleep(android.view.ViewConfiguration.getLongPressTimeout()+250L);
            await(()->main(()->field("appPlacementDrag")!=null),"real_app_drag_not_started");
            for(int step=1;step<=16;step++){float p=step/16f;inject(down,MotionEvent.ACTION_MOVE,new float[]{from[0]+(to[0]-from[0])*p,from[1]+(to[1]-from[1])*p});SystemClock.sleep(24);}
            inject(down,cancel?MotionEvent.ACTION_CANCEL:MotionEvent.ACTION_UP,to);released=true;
        }finally{if(!released)inject(down,MotionEvent.ACTION_CANCEL,to);}
        await(()->main(()->field("appPlacementDrag")==null&&!(Boolean)field("hostDragActive")),"real_app_drag_did_not_end");
    }
    private static float[] center(View view){Rect visible=new Rect();require(view!=null&&view.getGlobalVisibleRect(visible)&&!visible.isEmpty(),"app_drag_view_not_visible");return new float[]{visible.exactCenterX(),visible.exactCenterY()};}
    private void dialog()throws Exception{await(()->main(()->field("closeDialog") instanceof android.app.Dialog&&((android.app.Dialog)field("closeDialog")).isShowing()),"placement_dialog_missing");}
    private void choice(int index)throws Exception{dialog();main(()->{android.app.Dialog d=(android.app.Dialog)field("closeDialog");View row=d.getWindow().getDecorView().findViewWithTag("choice-option:"+index);require(row!=null&&row.performClick(),"placement_choice_missing");return null;});}
    private static View findText(View view,String text){
        if(view instanceof android.widget.TextView&&text.contentEquals(((android.widget.TextView)view).getText())&&view.isClickable())return view;
        if(view instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View found=findText(group.getChildAt(i),text);if(found!=null)return found;}}
        return null;
    }
    private void screenshot(String name)throws Exception{
        android.graphics.Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"placement_screenshot_failed");
        java.io.File directory=new java.io.File(target.getFilesDir(),"device-regression-results");require(directory.isDirectory()||directory.mkdirs(),"screenshot_directory_failed");
        try(java.io.FileOutputStream output=new java.io.FileOutputStream(new java.io.File(directory,name+".png"))){require(bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output),"screenshot_encoding_failed");}finally{bitmap.recycle();}
    }

    /** Catch-thread cache reads only: no main-thread wait, query, client call, or UI mutation. */
    private JSONObject cachedUiFailureSnapshot() throws Exception {
        try {
            Activity cached=activity;
            if(cached==null)return new JSONObject().put("status","UNKNOWN").put("reason","ACTIVITY_NOT_CACHED");
            AtomicWorkbenchWorkspaceModel observed=(AtomicWorkbenchWorkspaceModel)get(cached,"model");
            // roles is a single immutable object; other nonvolatile caches are best-effort, not one atomic observation.
            AtomicWorkbenchPoolTopology roles=(AtomicWorkbenchPoolTopology)get(observed,"roles");
            String[] components=((String[])get(observed,"components")).clone();
            boolean[] hosted=((boolean[])get(observed,"hosted")).clone();
            Object[] cachedSlots=((Object[])get(cached,"slots")).clone();
            boolean[] pendingHome=((boolean[])get(cached,"pendingHomeSurfaces")).clone();
            String[] pendingAllocation=((String[])get(cached,"pendingTaskAllocations")).clone();
            if(components.length!=8||hosted.length!=8||cachedSlots.length!=8||pendingHome.length!=8||pendingAllocation.length!=8)
                return new JSONObject().put("status","UNKNOWN").put("reason","CACHED_POOL_SHAPE_UNAVAILABLE");
            int target=-1;
            for(int i=0;i<PACKAGES.length;i++)if(stage.equals("normal_app_launch_"+PACKAGES[i]))target=i;
            JSONObject result=new JSONObject().put("status","CACHED_FIELDS_OBSERVED")
                    .put("sampling","BEST_EFFORT_CACHED_NON_ATOMIC").put("capturedUptime",SystemClock.uptimeMillis())
                    .put("capturedElapsed",SystemClock.elapsedRealtime()).put("targetFixtureIndex",target)
                    .put("epoch",(Integer)get(cached,"epoch")).put("sessionGeneration",(Long)get(cached,"sessionGeneration"))
                    .put("focusedWindow",(Integer)get(cached,"focusedWindow")).put("activeMain",roles.activeMainId)
                    .put("mainIds",new JSONArray(roles.mainIdsOuterToRail())).put("visibleSideIds",new JSONArray(roles.sideIds()))
                    .put("fullSideOrder",new JSONArray(roles.allSideIds()))
                    .put("canInteract","UNKNOWN_NOT_SAMPLED").put("mainReady","UNKNOWN_NOT_SAMPLED")
                    .put("dialogKind","UNKNOWN_NO_CACHED_CODE").put("openDispatched","UNKNOWN_NOT_CACHED")
                    .put("readTaskSnapshotResult","UNKNOWN_NO_CACHED_PER_REQUEST_RESULT");
            for(String flag:new String[]{"active","destroyed","surfaceUnavailable","outputsSyncing","outputsParked","busy",
                    "closing","exitRequested","recoveryPending","waitingForCleanup","hostDialogActive","nativeHomePending",
                    "presentationNeedsRetry","mainLayoutPresented","polling"})result.put(flag,(Boolean)get(cached,flag));
            result.put("cachedInteractionFlagsAllow",result.getBoolean("active")&&!result.getBoolean("destroyed")
                    &&!result.getBoolean("surfaceUnavailable")&&!result.getBoolean("outputsSyncing")&&!result.getBoolean("outputsParked")
                    &&!result.getBoolean("busy")&&!result.getBoolean("closing")&&!result.getBoolean("exitRequested")
                    &&!result.getBoolean("recoveryPending")&&!result.getBoolean("waitingForCleanup")); // Excludes the unsampled ResetWriteFence.
            Object dialog=get(cached,"closeDialog");
            result.put("cachedCloseDialogPresent",dialog!=null)
                    .put("cachedCloseDialogShowing",dialog instanceof android.app.Dialog?((android.app.Dialog)dialog).isShowing():JSONObject.NULL);
            int notice=(Integer)get(cached,"taskStorageNotice");
            result.put("cachedTaskStorageNotice",notice>=0&&notice<=2?notice:JSONObject.NULL);
            AtomicWorkbenchTaskUiSnapshot shelf=(AtomicWorkbenchTaskUiSnapshot)get(cached,"lastTaskSnapshot");
            result.put("cachedTaskSnapshotPresent",shelf!=null).put("cachedTaskSnapshotElapsed",(Long)get(cached,"taskSnapshotElapsed"));
            if(shelf!=null)result.put("cachedShelfRevision",shelf.revision).put("cachedShelfInputRevision",shelf.inputRevision)
                    .put("cachedShelfEntryCount",shelf.entries.size()).put("cachedShelfWindowCount",shelf.windows.size());
            JSONArray windows=new JSONArray();
            for(int id=0;id<8;id++){
                Object slot=cachedSlots[id];
                if(slot==null){windows.put(new JSONObject().put("window",id).put("status","UNKNOWN_SLOT_NOT_CACHED"));continue;}
                AtomicWorkbenchSurface surface=(AtomicWorkbenchSurface)get(slot,"surface");
                int modelFixture=cachedFixedFixture(components[id]),topFixture=cachedFixedFixture((String)get(slot,"topComponent"));
                String name=(String)get(slot,"displayName"),unique=(String)get(slot,"displayUniqueId"),session=(String)get(slot,"windowSession");
                int display=(Integer)get(slot,"displayId");
                JSONObject value=new JSONObject().put("window",id).put("role",roles.roleOf(id).name())
                        .put("modelWindowPresent",components[id]!=null||hosted[id]).put("cachedModelFixtureIndex",modelFixture)
                        .put("cachedTopFixtureIndex",topFixture).put("targetModelMatch",target>=0&&modelFixture==target)
                        .put("display",display).put("leaseIdentityFieldsPresent",display>0&&name!=null&&!name.isEmpty()
                                &&unique!=null&&!unique.isEmpty()&&session!=null&&!session.isEmpty())
                        .put("ready",(Boolean)get(slot,"ready")).put("nativeHome",(Boolean)get(slot,"nativeHome"))
                        .put("pendingHomeSurface",pendingHome[id]).put("pendingTaskAllocation",pendingAllocation[id]!=null&&!pendingAllocation[id].isEmpty())
                        .put("outputAwaitingFrame",(Boolean)get(slot,"outputAwaitingFrame")).put("outputRetainsProducer",(Boolean)get(slot,"outputRetainsProducer"))
                        .put("surfaceLifecycle",(Integer)get(slot,"surfaceLifecycle"));
                if(modelFixture>=0||topFixture>=0)value.put("cachedTaskIdForFixedFixture",(Integer)get(slot,"targetTaskId"))
                        .put("cachedUidForFixedFixture",(Integer)get(slot,"targetUid"));
                if(surface==null)value.put("surfaceStatus","UNKNOWN_NOT_CACHED");
                else value.put("surfaceStatus","CACHED").put("available",surface.isAvailable()).put("outputValid",surface.getHolder().isValid())
                        .put("frames",surface.frameCount()).put("bufferGeometryGeneration",surface.bufferGeometryGeneration())
                        .put("frameGeometryGeneration",surface.lastFrameGeometryGeneration()).put("surfaceGeneration",(Long)get(surface,"surfaceGeneration"))
                        .put("cachedViewWidth",(Integer)get(surface,"viewWidth")).put("cachedViewHeight",(Integer)get(surface,"viewHeight"))
                        .put("cachedConfiguredWidth",(Integer)get(surface,"configuredWidth")).put("cachedConfiguredHeight",(Integer)get(surface,"configuredHeight"));
                windows.put(value);
            }
            return result.put("windows",windows).put("backendOrFixtureQueryPerformed",false);
        } catch(Throwable unavailable) {
            return new JSONObject().put("status","UNKNOWN").put("reason","CACHED_SNAPSHOT_UNAVAILABLE");
        }
    }
    private static int cachedFixedFixture(String value){
        for(int i=0;i<PACKAGES.length;i++)if(component(PACKAGES[i]).equals(value))return i;
        return -1;
    }

    /** Match the actual Platform fields and Engine's empty native-HOME admission, not a Launcher package allowlist. */
    private static void requireInitialWindow(Bundle state,int appUid){
        ArrayList<String> running=state.getStringArrayList("running_packages");
        require(running!=null&&running.isEmpty(),"empty_workspace_required_no_user_task_replacement");
        require(Boolean.TRUE.equals(state.get("success"))&&Boolean.FALSE.equals(state.get("recovery_pending"))
                &&state.get("user_id") instanceof Integer&&Integer.valueOf(appUid/100000).equals(state.get("user_id"))
                &&state.get("window_id") instanceof Integer&&state.getInt("window_id")>=0&&state.getInt("window_id")<8
                &&state.get("task_count") instanceof Integer&&state.get("task_id") instanceof Integer
                &&state.get("home_task_id") instanceof Integer&&state.get("display_id") instanceof Integer
                &&state.get("native_home") instanceof Boolean&&state.get("state") instanceof String
                &&state.get("window_session") instanceof String&&state.get("display_name") instanceof String
                &&state.get("display_unique_id") instanceof String,"initial_window_typed_identity_unknown");
        if("closed".equals(state.get("state"))){
            require(state.getInt("display_id")==-1&&state.getInt("task_id")==-1&&state.getInt("home_task_id")==-1
                    &&state.getInt("task_count")==0&&Boolean.FALSE.equals(state.get("native_home"))
                    &&"".equals(state.get("window_session"))&&"".equals(state.get("display_name"))
                    &&"".equals(state.get("display_unique_id")),"initial_empty_slot_not_closed");
            return;
        }
        require("active".equals(state.get("state"))&&Boolean.TRUE.equals(state.get("native_home"))
                &&state.getInt("home_task_id")>=0&&state.getInt("task_id")==state.getInt("home_task_id")
                &&state.getInt("task_count")==1&&state.getInt("display_id")>0
                &&state.get("home_component") instanceof String&&!state.getString("home_component").isEmpty()
                &&state.get("top_component") instanceof String&&!state.getString("top_component").isEmpty()
                &&state.get("target_uid") instanceof Integer&&state.getInt("target_uid")>=0
                &&state.getInt("target_uid")/100000==appUid/100000,"initial_native_home_not_confirmed");
        String session=state.getString("window_session");
        require(UUID.fromString(session).toString().equals(session)
                &&("DuoAtomic-"+appUid+"-w"+state.getInt("window_id")+"-"+session).equals(state.get("display_name"))
                &&!state.getString("display_unique_id").isEmpty(),"initial_native_home_full_lease_unknown");
    }

    private static final java.util.Set<String> FAILURE_REASONS=java.util.Set.of(
            "all_seven_frames_must_be_visible","attempted_fixture_window_unknown","awake_unlocked_required","button_touch_cancelled",
            "configuration_save_failed","editor_cursor_not_at_end","editor_text_unknown","empty_workspace_required_no_user_task_replacement",
            "existing_client_unavailable","fixture_coordinate_type_unknown","fixture_counter_type_unknown","fixture_real_main_after_app_click",
            "fixture_target_outside_surface","fresh_authenticated_fixture_event","hidden_app_created_replacement_task","hidden_frame_not_clipped_outside_workspace",
            "hidden_output_not_detached","high_hidden_owner_required","initial_empty_slot_not_closed","initial_home_ready",
            "initial_native_home_full_lease_unknown","initial_native_home_not_confirmed","initial_window_typed_identity_unknown","input_geometry_unknown",
            "multiple_fixture_windows","normal_app_tile_available","normal_app_tile_center_visible","normal_app_tile_not_visible_enabled",
            "normal_app_tile_rejected","normal_capacity_configuration_applied","normal_close_cleanup_pending","original_configuration_readback_changed",
            "original_owner_task_display_identity_changed","other_fixture_editor_changed","other_fixture_received_input","owner_changed_at_main",
            "physical_display0_required","physical_surface_target_not_visible","physical_target_not_ready_main","physical_touch_not_accepted",
            "prior_cleanup_pending","real_fixture_frame","real_owner_identity_incomplete","real_owner_lease_incomplete",
            "real_phone_ime_target_unknown","real_side_shield_rejected","same_owner_main_ready","seven_distinct_fixture_uids_required",
            "seven_unique_task_window_display_required","side_promotion_busy","single_main_role_contract","three_real_high_owners_required",
            "workbench_not_enabled");
    private static String failureReason(Throwable failure){
        try{
            if(!(failure instanceof AssertionError))return "UNKNOWN";
            String reason=failure.getMessage();
            return reason!=null&&(FAILURE_REASONS.contains(reason)||Set.of("placement_main_missing","reload_button_unavailable",
                    "reload_repeated_or_other_output_changed","placement_side_missing","side_long_click_rejected",
                    "placement_target_missing","placement_cancel_dialog_focus","replacement_confirm_missing",
                    "exact_side_new_owner_not_ready","unrelated_replacement_owner_changed","exact_drag_role_not_committed",
                    "drag_changed_native_owner","side_drag_stole_main_position","cancelled_drag_changed_roles",
                    "app_drag_tile_missing","real_app_drag_not_started","real_app_drag_did_not_end","app_drag_view_not_visible",
                    "placement_dialog_missing","placement_choice_missing","placement_screenshot_failed").contains(reason))?reason:"UNKNOWN";
        }catch(Throwable observationFailure){return "UNKNOWN";}
    }

    private Owner launch(String pkg)throws Exception{
        clickApp(pkg,true);AtomicReference<Bundle> found=new AtomicReference<>();
        await(()->{
            int id=main(()->model().mainWindowId());Bundle value=state(pool(),id);
            if(!isApp(value,pkg)||!main(()->component(pkg).equals(model().component(id))&&(Boolean)invoke("mainReady",new Class<?>[0])))return false;
            found.set(value);return true;
        },"fixture_real_main_after_app_click");
        Owner owner=new Owner(pkg,found.get());query(pkg,v->sameOwner(owner,v)&&geometry(v));
        await(()->main(()->((AtomicWorkbenchSurface)slot(owner.window,"surface")).frameCount()>0),"real_fixture_frame");return owner;
    }
    private void clickApp(String pkg,boolean allocationAttempt)throws Exception{
        await(()->main(()->(Boolean)invoke("canInteract",new Class<?>[0])&&activity.getWindow().getDecorView()
                .findViewWithTag("atomic-workbench-quick-app:"+component(pkg))!=null),"normal_app_tile_available");
        main(()->{
            View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+component(pkg));
            tile.requestRectangleOnScreen(new Rect(0,0,tile.getWidth(),tile.getHeight()),true);return null;
        });
        await(()->main(()->{
            View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+component(pkg));
            if(tile==null||!tile.isEnabled()||!tile.isShown())return false;
            Rect rect=new Rect();int[] origin=new int[2];tile.getLocationOnScreen(origin);
            return tile.getGlobalVisibleRect(rect)&&rect.contains(origin[0]+tile.getWidth()/2,origin[1]+tile.getHeight()/2);
        }),"normal_app_tile_center_visible");
        main(()->{
            View tile=activity.getWindow().getDecorView().findViewWithTag("atomic-workbench-quick-app:"+component(pkg));
            require(tile.isEnabled()&&tile.isShown(),"normal_app_tile_not_visible_enabled");
            if(allocationAttempt)attempts.put(pkg,SystemClock.uptimeMillis());
            require(tile.performClick(),"normal_app_tile_rejected");return null;
        });
    }
    private void promoteSide(Owner owner)throws Exception{
        if(main(()->model().mainWindowId())!=owner.window)main(()->{
            require((Boolean)invoke("canInteract",new Class<?>[0]),"side_promotion_busy");View shield=(View)slot(owner.window,"shield");
            require(shield.isEnabled()&&shield.isShown()&&shield.performClick(),"real_side_shield_rejected");return null;
        });
        awaitMain(owner);
    }
    private void awaitMain(Owner owner)throws Exception{
        await(()->main(()->model().mainWindowId()==owner.window&&(Boolean)invoke("mainReady",new Class<?>[0])
                &&(Boolean)invoke("canInteract",new Class<?>[0])),"same_owner_main_ready");
        require(owner.matches(state(pool(),owner.window)),"owner_changed_at_main");
    }
    private void verifyInput(Owner owner)throws Exception{
        Map<String,Bundle> before=observeOwners();Bundle old=before.get(owner.pkg);
        final long buttonUp=tap(owner,old,"button");
        Bundle clicked=query(owner.pkg,v->sameOwner(owner,v)&&v.getLong("at_uptime")>=buttonUp
                &&integer(v,"click_count")==integer(old,"click_count")+1
                &&integer(v,"touch_down_count")==integer(old,"touch_down_count")+1
                &&integer(v,"touch_up_count")==integer(old,"touch_up_count")+1);
        require(integer(clicked,"touch_cancel_count")==integer(old,"touch_cancel_count"),"button_touch_cancelled");
        assertOthers(owner.pkg,before,observeOwners());
        Map<String,Bundle> beforeEditor=observeOwners();Bundle editorBefore=beforeEditor.get(owner.pkg);
        final long editorUp=tap(owner,editorBefore,"editor");
        Bundle editor=query(owner.pkg,v->sameOwner(owner,v)&&v.getLong("at_uptime")>=editorUp&&Boolean.TRUE.equals(v.get("editor_focused")));
        require(editor.get("editor_text") instanceof String,"editor_text_unknown");
        JSONObject ime=AtomicWorkbenchImeDeviceProbe.awaitVisible(test,owner.pkg,uids.get(owner.pkg),owner.display,12_000L);
        require(ime.getBoolean("success"),"real_phone_ime_target_unknown");
        String marker="capacity"+owner.window+"q7",expected=editor.getString("editor_text")+marker;
        require(editor.getInt("editor_selection_start",-1)==editor.getString("editor_text").length()
                &&editor.getInt("editor_selection_end",-1)==editor.getString("editor_text").length(),"editor_cursor_not_at_end");
        AtomicWorkbenchImeDeviceProbe.sendLatinText(test,owner.display,marker);
        Bundle typed=query(owner.pkg,v->sameOwner(owner,v)&&expected.equals(v.get("editor_text")));
        assertOthers(owner.pkg,beforeEditor,observeOwners());
        actions.put(owner.json().put("action","HIGH_BUTTON_AND_REAL_INPUT_TEXT").put("clickCount",integer(clicked,"click_count"))
                .put("fixtureReportedText",typed.getString("editor_text")).put("ime",ime).put("success",true));
    }
    private long tap(Owner owner,Bundle fixture,String prefix)throws Exception{
        float[] point=main(()->{
            require(model().mainWindowId()==owner.window&&(Boolean)invoke("mainReady",new Class<?>[0]),"physical_target_not_ready_main");
            AtomicWorkbenchSurface surface=(AtomicWorkbenchSurface)slot(owner.window,"surface");
            int width=(Integer)slot(owner.window,"displayWidth"),height=(Integer)slot(owner.window,"displayHeight");
            require(width>1&&height>1&&surface.getWidth()>0&&surface.getHeight()>0&&geometry(fixture),"input_geometry_unknown");
            float x=number(fixture,prefix+"_x")*surface.getWidth()/(width-1f),y=number(fixture,prefix+"_y")*surface.getHeight()/(height-1f);
            require(Float.isFinite(x)&&Float.isFinite(y)&&x>=0&&y>=0&&x<surface.getWidth()&&y<surface.getHeight(),"fixture_target_outside_surface");
            int[] origin=new int[2];surface.getLocationOnScreen(origin);Rect visible=new Rect();
            require(surface.isShown()&&surface.getGlobalVisibleRect(visible)&&visible.contains((int)(origin[0]+x),(int)(origin[1]+y)),"physical_surface_target_not_visible");
            return new float[]{origin[0]+x,origin[1]+y};
        });
        long down=SystemClock.uptimeMillis();inject(down,MotionEvent.ACTION_DOWN,point);SystemClock.sleep(48L);
        long up=SystemClock.uptimeMillis();inject(down,MotionEvent.ACTION_UP,point);return up;
    }
    private void inject(long down,int action,float[]point)throws Exception{
        MotionEvent event=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,point[0],point[1],0);event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try{require(Integer.valueOf(0).equals(MotionEvent.class.getMethod("getDisplayId").invoke(event)),"physical_display0_required");
            require(test.getUiAutomation().injectInputEvent(event,true),"physical_touch_not_accepted");}
        finally{event.recycle();}
    }
    private void changeSides(int count)throws Exception{
        save(Map.of(AtomicWorkbenchConfig.SIDE_COUNT,Integer.toString(count)));
        // The same production appearance reader is called by onStart; never set model roles or resources in the test.
        main(()->{invoke("refreshAppearance",new Class<?>[0]);return null;});
        await(()->main(()->model().configuredSideCount()==count&&(Boolean)invoke("canInteract",new Class<?>[0])
                &&!(Boolean)field("outputsSyncing")),"normal_capacity_configuration_applied");requireRoles(count);
        assertOwners(count==6);
    }
    private void requireRoles(int sides)throws Exception{
        require(main(()->!model().dualMain()&&model().mainWindowIds().length==1&&model().configuredSideCount()==sides
                &&model().eligibleWindowIds().length==sides+1&&!model().mainExpanded()),"single_main_role_contract");
    }
    private JSONArray assertOwners(boolean visible)throws Exception{
        ArrayList<Bundle> states=pool();JSONArray result=new JSONArray();
        for(Owner owner:owners.values()){
            Bundle value=state(states,owner.window);require(owner.matches(value),"original_owner_task_display_identity_changed");
            query(owner.pkg,v->sameOwner(owner,v));
            if(visible)require(main(()->{View frame=(View)slot(owner.window,"frame");Rect rect=new Rect();return frame.isShown()&&frame.getGlobalVisibleRect(rect)&&!rect.isEmpty();}),"all_seven_frames_must_be_visible");
            result.put(owner.json().put("outputAttachedKnown",value.get("output_attached_known"))
                    .put("outputAttached",value.get("output_attached")));
        }
        return result;
    }
    private boolean recover(JSONObject report)throws Exception{
        boolean workComplete=true;
        try{((ExecutorService)get(activity,"WORKER")).submit(()->{}).get(20,TimeUnit.SECONDS);}
        catch(Exception failure){workComplete=false;report.put("launchWorkUnconfirmed",true);}
        boolean exact=workComplete;long closeAt;
        try{
            ArrayList<Bundle> current=null;
            try{current=pool();}catch(Exception|AssertionError invalid){exact=false;report.put("preClosePoolUnknown",true);}
            for(String pkg:attempts.keySet())if(!owners.containsKey(pkg)){
                try{
                    Bundle found=null;if(current!=null)for(Bundle value:current)if(isApp(value,pkg)){require(found==null,"multiple_fixture_windows");found=value;}
                    require(found!=null,"attempted_fixture_window_unknown");Owner owner=new Owner(pkg,found);
                    query(pkg,v->sameOwner(owner,v));owners.put(pkg,owner);
                }catch(Exception|AssertionError unknown){exact=false;}
            }
            JSONArray identities=new JSONArray();for(Owner owner:owners.values())identities.put(owner.json());report.put("ownersBeforeClose",identities);
        }finally{
            closeAt=SystemClock.uptimeMillis();
            main(()->{invoke("requestCloseAll",new Class<?>[]{boolean.class},true);return null;});
        }
        Map<String,Owner> frozen=Collections.unmodifiableMap(new LinkedHashMap<>(owners));
        await(()->!AtomicWorkbenchCleanup.pending(),"normal_close_cleanup_pending");
        JSONArray returned=new JSONArray();
        for(Owner owner:frozen.values())try{
            if(placementRun){
                require(taskOnPhone(owner),"returned_fixture_task_not_on_phone");
                returned.put(owner.json().put("actualDisplay",0).put("observation","fresh_activity_manager_task"));
            } else {
                Bundle value=query(owner.pkg,v->!v.getBoolean("destroyed")&&v.getInt("task_id")==owner.task
                        &&v.getInt("display_id")==0&&v.getLong("at_uptime")>=closeAt);
                returned.put(owner.json().put("actualDisplay",value.getInt("display_id")).put("observedAt",value.getLong("at_uptime")));
            }
        }catch(Exception|AssertionError unknown){exact=false;}
        report.put("returnedSameTasksOnPhone",returned);
        return exact&&frozen.size()==attempts.size();
    }
    private boolean finishReturned(JSONObject report)throws Exception{
        JSONArray results=new JSONArray();report.put("explicitFixtureFinish",results);
        // All attempted identities returned before this method is reachable; each target is freshly rechecked again.
        for(Owner owner:owners.values()){
            stage="explicit_finish_"+owner.pkg;
            if(placementRun){
                require(taskOnPhone(owner),"fixture_finish_owner_not_on_phone");
                // Only after native recovery, wake this exact self-owned physical Task for
                // its authenticated finish receipt. The ROM may freeze a cached fixture.
                String output;
                try(android.os.ParcelFileDescriptor descriptor=test.getUiAutomation().executeShellCommand(
                        "am start -W --user "+(android.os.Process.myUid()/100000)+" --display 0 --task "+owner.task
                                +" -n "+component(owner.pkg)+" --activity-reorder-to-front");
                        java.io.InputStream input=new android.os.ParcelFileDescriptor.AutoCloseInputStream(descriptor)){
                    byte[] bytes=input.readNBytes(16385);require(bytes.length<=16384,"fixture_wake_output_truncated");
                    output=new String(bytes,java.nio.charset.StandardCharsets.UTF_8);
                }
                require(output.contains("Status: ok")&&taskOnPhone(owner),"fixture_wake_not_same_returned_task");
                report.put("finishObservationMethod","EXACT_RETURNED_FIXTURE_TASK_FOREGROUND_THEN_AUTHENTICATED_FINISH");
            }
            query(owner.pkg,v->!v.getBoolean("destroyed")&&v.getInt("task_id")==owner.task&&v.getInt("display_id")==0);
            String nonce=freshNonce(owner.pkg);long at=SystemClock.uptimeMillis();
            control(owner.pkg,AtomicWorkbenchFixtureActivity.ACTION_FINISH,nonce);
            Bundle destroyed=awaitEvent(owner.pkg,nonce,at,v->v.getBoolean("destroyed")&&v.getInt("task_id")==owner.task&&v.getInt("display_id")==0);
            results.put(owner.json().put("destroyed",true).put("atUptime",destroyed.getLong("at_uptime")));
        }
        return true;
    }

    /** Cached background broadcasts may be deferred; query the actual Task without waking the app. */
    private boolean taskOnPhone(Owner owner)throws Exception{
        boolean identified=false;
        test.getUiAutomation().adoptShellPermissionIdentity("android.permission.REAL_GET_TASKS");
        try{
            for(android.app.ActivityManager.RunningTaskInfo task:target.getSystemService(android.app.ActivityManager.class).getRunningTasks(200)){
                if(task.taskId==owner.task)identified=task.baseActivity!=null&&component(owner.pkg).equals(task.baseActivity.flattenToString());
            }
        }finally{test.getUiAutomation().dropShellPermissionIdentity();}
        if(!identified)return false;
        // displayId is hidden from the SDK and blocked by this ROM's reflection filter.
        // Development observation only: fixed read command; no module runtime dependency.
        String raw;
        try(android.os.ParcelFileDescriptor descriptor=test.getUiAutomation().executeShellCommand("dumpsys activity activities");
                java.io.InputStream input=new android.os.ParcelFileDescriptor.AutoCloseInputStream(descriptor)){
            byte[] bytes=input.readNBytes(1024*1024+1);require(bytes.length<=1024*1024,"task_observation_truncated");
            raw=new String(bytes,java.nio.charset.StandardCharsets.UTF_8);
        }
        int display=-1,matches=0,observed=-1;
        for(String line:raw.split("\\r?\\n")){
            if(line.startsWith("Display #")&&line.endsWith(" (activities from top to bottom):"))
                display=Integer.parseInt(line.substring(9,line.indexOf(' ',9)));
            if(line.startsWith("  * Task{")&&line.contains(" #"+owner.task+" ")
                    &&line.contains(" A="+uids.get(owner.pkg)+":"+owner.pkg+" U="+(android.os.Process.myUid()/100000)+" ")){
                matches++;observed=display;
            }
        }
        return matches==1&&observed==0;
    }

    private Map<String,Bundle> observeOwners()throws Exception{
        Map<String,Bundle> result=new LinkedHashMap<>();for(Owner owner:owners.values())result.put(owner.pkg,query(owner.pkg,v->sameOwner(owner,v)&&geometry(v)));return result;
    }
    private static void assertOthers(String target,Map<String,Bundle> before,Map<String,Bundle> after){
        for(String pkg:before.keySet())if(!target.equals(pkg)){
            for(String counter:COUNTERS)require(integer(before.get(pkg),counter)==integer(after.get(pkg),counter),"other_fixture_received_input");
            require(before.get(pkg).get("editor_text") instanceof String&&before.get(pkg).get("editor_text").equals(after.get(pkg).get("editor_text")),"other_fixture_editor_changed");
        }
    }
    private Bundle query(String pkg,Predicate<Bundle> condition)throws Exception{
        String nonce=freshNonce(pkg);long at=SystemClock.uptimeMillis();control(pkg,AtomicWorkbenchFixtureActivity.ACTION_QUERY,nonce);return awaitEvent(pkg,nonce,at,condition);
    }
    private String freshNonce(String pkg){
        String nonce=UUID.randomUUID().toString().replace("-","");synchronized(observationLock){nonces.put(pkg,nonce);observations.remove(pkg);}return nonce;
    }
    private Bundle awaitEvent(String pkg,String nonce,long at,Predicate<Bundle> condition)throws Exception{
        AtomicReference<Bundle> answer=new AtomicReference<>();await(()->{
            synchronized(observationLock){Bundle value=observations.get(pkg);if(value!=null&&nonce.equals(value.get("nonce"))
                    &&value.getLong("at_uptime")>=at&&condition.test(value)){answer.set(new Bundle(value));return true;}}return false;
        },"fresh_authenticated_fixture_event");return answer.get();
    }
    private void control(String pkg,String action,String nonce){
        target.sendBroadcast(new Intent(action).setPackage(pkg).addFlags(Intent.FLAG_RECEIVER_FOREGROUND).putExtra("nonce",nonce),null,
                BroadcastOptions.makeBasic().setShareIdentityEnabled(true)
                        .setDeferralPolicy(BroadcastOptions.DEFERRAL_POLICY_NONE).toBundle());
    }
    private ArrayList<Bundle> pool()throws Exception{
        AtomicWorkbenchClient client=main(()->(AtomicWorkbenchClient)field("client"));require(client!=null,"existing_client_unavailable");
        return AtomicWorkbenchClient.recoveryPoolWindows(client.status()); // Exactly one real status; no windows4 fallback.
    }
    private static Bundle state(ArrayList<Bundle> states,int id){for(Bundle value:states)if(Integer.valueOf(id).equals(value.get("window_id")))return value;throw new AssertionError("pool_owner_missing");}
    private static boolean isApp(Bundle value,String pkg){return Boolean.TRUE.equals(value.get("success"))&&"active".equals(value.get("state"))
            &&value.get("task_id") instanceof Integer&&value.getInt("task_id")>0&&value.get("display_id") instanceof Integer&&value.getInt("display_id")>0
            &&value.get("top_component") instanceof String&&pkg.equals(packageOf(value.getString("top_component")));}
    private static boolean sameOwner(Owner owner,Bundle value){return !value.getBoolean("destroyed")&&value.getInt("task_id")==owner.task&&value.getInt("display_id")==owner.display;}
    private static boolean geometry(Bundle value){return Boolean.TRUE.equals(value.get("geometry_ready"))&&integer(value,"button_width")>0&&integer(value,"button_height")>0;}
    private static int integer(Bundle b,String key){require(b.get(key) instanceof Integer,"fixture_counter_type_unknown");return b.getInt(key);}
    private static float number(Bundle b,String key){require(b.get(key) instanceof Float,"fixture_coordinate_type_unknown");return b.getFloat(key);}
    private void save(Map<String,String> values){AppConfig.SaveResult result=config.save(values);require(result.success,"configuration_save_failed");}
    private AtomicWorkbenchWorkspaceModel model()throws Exception{return (AtomicWorkbenchWorkspaceModel)field("model");}
    private Object field(String name)throws Exception{return get(activity,name);}
    private Object slot(int id,String name)throws Exception{return get(((Object[])field("slots"))[id],name);}
    private static Object get(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private Object invoke(String name,Class<?>[]types,Object...args)throws Exception{Method method=activity.getClass().getDeclaredMethod(name,types);method.setAccessible(true);return method.invoke(activity,args);}
    private <T>T main(Callable<T> operation)throws Exception{
        AtomicReference<T> answer=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();
        test.runOnMainSync(()->{try{answer.set(operation.call());}catch(Throwable failed){error.set(failed);}});
        if(error.get() instanceof Exception)throw (Exception)error.get();if(error.get() instanceof AssertionError)throw (AssertionError)error.get();
        if(error.get()!=null)throw new RuntimeException(error.get());return answer.get();
    }
    private static void await(Callable<Boolean> condition,String reason)throws Exception{
        long end=SystemClock.uptimeMillis()+15_000L;do{if(condition.call())return;SystemClock.sleep(100L);}while(SystemClock.uptimeMillis()<end);throw new AssertionError(reason);
    }
    private static void require(boolean value,String reason){if(!value)throw new AssertionError(reason);}
    private static String component(String pkg){return pkg+"/"+pkg+".AtomicWorkbenchFixtureActivity";}
    private static String packageOf(String component){int slash=component.indexOf('/');return slash<0?component:component.substring(0,slash);}
    private static final class Owner{
        final String pkg,unique,session;final int window,task,display;
        Owner(String pkg,Bundle state){
            require(isApp(state,pkg)&&state.get("window_id") instanceof Integer&&state.get("display_unique_id") instanceof String
                    &&state.get("window_session") instanceof String,"real_owner_identity_incomplete");
            this.pkg=pkg;window=state.getInt("window_id");task=state.getInt("task_id");display=state.getInt("display_id");
            unique=state.getString("display_unique_id");session=state.getString("window_session");
            require(window>=0&&window<8&&!unique.isEmpty()&&!session.isEmpty(),"real_owner_lease_incomplete");
        }
        boolean matches(Bundle value){return isApp(value,pkg)&&Integer.valueOf(window).equals(value.get("window_id"))
                &&Integer.valueOf(task).equals(value.get("task_id"))&&Integer.valueOf(display).equals(value.get("display_id"))
                &&unique.equals(value.get("display_unique_id"))&&session.equals(value.get("window_session"));}
        JSONObject json()throws Exception{return new JSONObject().put("package",pkg).put("window",window).put("task",task)
                .put("display",display).put("displayUnique",unique).put("windowSession",session);}
    }
}
