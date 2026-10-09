package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Checks the game directory and its five group pages without saving settings or operating shoulder keys. */
final class GameSettingsUiCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray screenshots=new JSONArray();
    private final JSONArray groupPages=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private int checks,aliasesChecked;
    private float navigationGapDp;
    private float switchRightSpreadDp;
    private int alignedSwitches;
    private int bottomScrollY,observedOrientation;
    private float observedDensity,observedFontScale;
    private boolean lastFeatureFullyVisible=true,landscapeRecreated;
    private boolean rapidCompatible;
    private boolean rapidCompatibilityPromptObserved,rapidCompatibilityReturned;
    private float rapidCompatibilityGapDp;
    private float rapidCompatibilityFontScale;
    private int rapidCompatibilityOrientation;
    private int currentBreadcrumbChecks;
    private float minimumBreadcrumbRightGapDp;
    private boolean rapidCleanDraftRecreated,rapidDirtyDraftPreserved;
    private Activity shoulderRecreateSource;
    private volatile Activity shoulderRecreated;
    private String shoulderRecreatedCount;
    private boolean shoulderRecreatedDirty;
    private int shoulderRecreatedPendingSaves;
    private Throwable shoulderRecreationError;
    private final boolean layoutOnly,landscape;
    private GameSettingsUiCases(Instrumentation test,boolean layoutOnly,boolean landscape){this.test=test;context=test.getTargetContext();this.layoutOnly=layoutOnly||landscape;this.landscape=landscape;}
    static JSONObject run(Instrumentation test,boolean layoutOnly,boolean landscape)throws Exception{return new GameSettingsUiCases(test,layoutOnly,landscape).execute();}

    private JSONObject execute()throws Exception{
        directory=new File(context.getExternalFilesDir(null),"game-settings-ui-"+BuildConfig.VERSION_CODE);
        require(directory.isDirectory()||directory.mkdirs(),"Screenshot directory is available");
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        SharedPreferences prefs=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> rawBefore=new LinkedHashMap<>(prefs.getAll());
        SharedPreferences consent=context.getSharedPreferences("ls_augment_consent",0);
        Object accepted=consent.getAll().get("accepted_version"),marker=consent.getAll().get("ui_navigation_test");
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            require(consent.edit().putInt("accepted_version",ModuleLegal.VERSION).putBoolean("ui_navigation_test",true).commit(),"Test consent is prepared");
            test.startActivitySync(new Intent(context,SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            Activity home=await("home");
            clickText(home,"游戏空间与游戏助手");
            Activity opened=await("target-game");
            Activity directoryPage=landscape?landscapePage(opened,"target-game"):opened;settle();
            checkDirectory(directoryPage,before);
            if(!layoutOnly){directoryPage=checkDirectoryRecreation(directoryPage,before);checkDirectory(directoryPage,before);}
            capture("01-second-level-directory");
            int index=2;
            for(ModuleHierarchy.Section section:ModuleHierarchy.sections("game")){
                clickTag(directoryPage,"navigation:"+section.route());
                Activity entered=await(section.route());
                Activity selectedPage=landscape?landscapePage(entered,section.route()):entered;settle();
                JSONObject groupReport=checkGroup(selectedPage,section,before);
                String shot=String.format(java.util.Locale.ROOT,"%02d-third-level-%s",index++,section.id);
                capture(shot+"-top");
                Activity gatedPage="shoulder".equals(section.id)?checkRapidGate(selectedPage):selectedPage;
                Activity page=!layoutOnly&&"shoulder".equals(section.id)?checkShoulderDraftRecreation(gatedPage,before):gatedPage;
                if(!layoutOnly&&"combo".equals(section.id))checkComboFold(page);
                if(!layoutOnly&&"shoulder".equals(section.id))checkExpandedRapidAlignment(page);
                require(before.equals(config.snapshot())&&rawBefore.equals(prefs.getAll()),"In-memory parameter and compatibility checks never save configuration: "+section.id);
                revealLastFeature(page,section,groupReport);capture(shot+"-bottom");groupPages.put(groupReport);
                if(index%2==0)onMain(()->{page.onBackPressed();return null;});
                else clickTag(page,"breadcrumb:target-game");
                Activity returnedDirectory=await("target-game");
                require(landscape||returnedDirectory==directoryPage,"Group returns to its directory, retaining its instance when configuration is unchanged: "+section.id);
                directoryPage=returnedDirectory;settle();
            }
            require(groupPages.length()==5,"All five third-level game pages were inspected");
            clickTag(directoryPage,"breadcrumb:home");Activity returnedHome=await("home");require(landscape||returnedHome==home,"Game directory breadcrumb returns to Home, retaining its instance when configuration is unchanged");
            if(!layoutOnly){
                Map<String,String> aliases=new LinkedHashMap<>();
                aliases.put("shoulder","group/game/shoulder");aliases.put("combo_speed","group/game/combo");
                aliases.put("super_resolution","group/game/performance");aliases.put("diablo_coexist","group/game/performance");aliases.put("rm:game","target-game");
                for(ModuleHierarchy.Section section:ModuleHierarchy.sections("game"))aliases.put(section.route(),section.route());
                for(Map.Entry<String,String> alias:aliases.entrySet()){
                    onMain(()->{ModuleNavigation.open(home,alias.getKey());return null;});
                    Activity moved=await(alias.getValue());settle();onMain(()->{assertDestination(moved,alias.getValue(),alias.getKey());return null;});aliasesChecked++;
                    clickTag(moved,"breadcrumb:home");require(await("home")==home,"Old game route breadcrumb reaches Home: "+alias.getKey());
                }
                for(String route:Arrays.asList("shoulder","combo_speed","super_resolution","diablo_coexist")){
                    onMain(()->{home.startActivity(new Intent(home,FeatureActivity.class).putExtra(FeatureActivity.EXTRA_MODULE,route));return null;});
                    Activity moved=await(aliases.get(route));settle();onMain(()->{assertDestination(moved,aliases.get(route),"direct activity "+route);return null;});aliasesChecked++;
                    clickTag(moved,"breadcrumb:target-game");Activity restoredDirectory=await("target-game");settle();checkDirectory(restoredDirectory,before);
                    clickTag(restoredDirectory,"breadcrumb:home");await("home");
                }
                onMain(()->{home.startActivity(new Intent(home,EnhancementSettingsActivity.class).putExtra("group","game"));return null;});
                Activity legacyGroup=await("target-game");settle();checkDirectory(legacyGroup,before);aliasesChecked++;
                onMain(()->{legacyGroup.onBackPressed();return null;});await("home");
            }
            require(before.equals(config.snapshot())&&rawBefore.equals(prefs.getAll()),"Opening all old routes preserves every saved configuration value");
        }catch(Throwable error){failure=error;try{capture("failure");}catch(Throwable captureError){error.addSuppressed(captureError);}}
        finally{
            try{
                onMain(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed())activity.finish();return null;});settle();
                app.unregisterActivityLifecycleCallbacks(this);
                SharedPreferences.Editor restore=consent.edit().remove("accepted_version").remove("ui_navigation_test");
                if(accepted instanceof Integer)restore.putInt("accepted_version",(Integer)accepted);
                if(marker instanceof Boolean)restore.putBoolean("ui_navigation_test",(Boolean)marker);
                require(restore.commit(),"Original consent state is restored");
                require(before.equals(config.snapshot())&&rawBefore.equals(prefs.getAll()),"Game page lifecycle leaves all original configuration unchanged");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
        }
        JSONObject report=new JSONObject().put("success",failure==null).put("version",BuildConfig.VERSION_NAME)
                .put("checks",checks).put("aliasesChecked",aliasesChecked).put("navigationGapDp",navigationGapDp)
                .put("rapidCompatibleOnDevice",rapidCompatible).put("configurationUnchanged",before.equals(config.snapshot()))
                .put("rapidCompatibilityPromptObserved",rapidCompatibilityPromptObserved)
                .put("rapidCompatibilityReturned",rapidCompatibilityReturned).put("rapidCompatibilityGapDp",rapidCompatibilityGapDp)
                .put("rapidCompatibilityFontScale",rapidCompatibilityFontScale).put("rapidCompatibilityOrientation",rapidCompatibilityOrientation)
                .put("currentBreadcrumbChecks",currentBreadcrumbChecks).put("minimumBreadcrumbRightGapDp",minimumBreadcrumbRightGapDp)
                .put("rapidCleanDraftRecreated",rapidCleanDraftRecreated).put("rapidDirtyDraftPreserved",rapidDirtyDraftPreserved)
                .put("layoutOnly",layoutOnly).put("density",observedDensity)
                .put("landscapeRequested",landscape).put("landscapeRecreated",landscapeRecreated)
                .put("bottomScrollY",bottomScrollY).put("lastFeatureFullyVisible",lastFeatureFullyVisible)
                .put("alignedSwitches",alignedSwitches).put("switchRightSpreadDp",switchRightSpreadDp)
                .put("fontScale",observedFontScale)
                .put("orientation",observedOrientation).put("groupPages",groupPages).put("screenshots",screenshots);
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Game settings UI regression failed",failure);
        return report;
    }

    private void checkDirectory(Activity activity,Map<String,String> before)throws Exception{onMain(()->{
        observedDensity=activity.getResources().getDisplayMetrics().density;
        observedFontScale=activity.getResources().getConfiguration().fontScale;
        observedOrientation=activity.getResources().getConfiguration().orientation;
        assertDestination(activity,"target-game","Game directory");
        View root=activity.getWindow().getDecorView();
        View card=tag(activity,"application-groups:game");
        require(card!=null,"Second-level game page contains its group directory card");
        int rows=0;
        for(View view:all(root)){
            require(!(view instanceof Switch),"Game directory contains navigation without functional switches");
            if(view.getTag() instanceof String&&((String)view.getTag()).startsWith("navigation:"))rows++;
        }
        List<ModuleHierarchy.Section> sections=ModuleHierarchy.sections("game");
        require(rows==5&&sections.size()==5,"Game directory has exactly its five existing groups");
        for(ModuleHierarchy.Section section:sections){
            require(tag(activity,"navigation:"+section.route())!=null,"Directory has the current group entry: "+section.title);
            require(tag(activity,"application-category:game:"+section.id)==null,"Group controls appear only inside their third-level page: "+section.id);
            TextView badge=(TextView)tag(activity,"setting-count:"+section.route());
            int expected=ModuleHierarchy.activeCount(section,before::get);
            require(badge!=null&&badge.getVisibility()==(expected==0?View.GONE:View.VISIBLE)
                    &&("✓ 已设置 "+expected+" 项").contentEquals(badge.getText()),"Directory badge reflects all saved generic and embedded controls: "+section.id);
        }
        require(editors(activity).isEmpty(),"The group directory instantiates no embedded editor");
        navigationGapDp=checkGap(activity,card,"Game directory");
        return null;
    });}

    private JSONObject checkGroup(Activity activity,ModuleHierarchy.Section section,Map<String,String> before)throws Exception{return onMain(()->{
        assertDestination(activity,section.route(),"Directory group "+section.id);
        View card=tag(activity,"application-category:game:"+section.id);
        require(card!=null&&tag(activity,"application-groups:game")==null,"Third-level page renders its own controls: "+section.id);
        int totalSwitches=0;
        for(View view:all(activity.getWindow().getDecorView())){
            if(view instanceof Switch)totalSwitches++;
            if(!(view.getTag() instanceof String))continue;
            String label=(String)view.getTag();
            require(!label.startsWith("navigation:"),"Group features do not add a fourth-level navigation row: "+section.id);
            require(!label.startsWith("section-title:"),"Group title is not repeated below its breadcrumb: "+section.id);
        }
        require(totalSwitches==featureCount(section.id),"Group owns the expected number of functional switches: "+section.id+" = "+totalSwitches);
        for(ModuleHierarchy.Section other:ModuleHierarchy.sections("game"))if(!other.id.equals(section.id))
            require(tag(activity,"application-category:game:"+other.id)==null,"Sibling controls are confined to their own group: "+other.id);
        for(NativeFeatureGroups.Feature feature:section.features)for(String key:feature.allKeys()){
            Switch control=(Switch)tag(activity,"config:"+key);
            require(control!=null&&control.isChecked()==ConfigSchema.truthy(before.get(key)),"Generic game control preserves saved state: "+key);
        }
        Map<String,NativeEditorController> editors=editors(activity);
        require(editors.keySet().equals(new java.util.LinkedHashSet<>(section.entries)),"Only the group's existing editors are embedded: "+section.id);
        for(String route:editors.keySet()){
            FeatureEditorController editor=(FeatureEditorController)editors.get(route);
            View content=tag(activity,"inline-editor:"+route);
            require(editor.embedded&&content!=null&&content.getParent()==card,"Existing editor is embedded in the same group card: "+route);
            require(!(Boolean)get(editor,"dirty"),"Opening embedded editor queues no save: "+route);
            for(Map.Entry<String,Switch> control:switches(editor).entrySet())
                require(control.getValue().isChecked()==ConfigSchema.truthy(before.get(control.getKey())),"Embedded control retains saved value: "+control.getKey());
        }
        if("shoulder".equals(section.id)){
            rapidCompatible=(Boolean)get(editors.get("shoulder"),"rapidFeatureUnlocked");
            require(((Map<?,?>)get(editors.get("shoulder"),"sliders")).containsKey(AppConfig.TGK_RAPID_FIRE_COUNT),"Existing rapid frequency parameter remains available");
            checkRapidRow(activity,(FeatureEditorController)editors.get("shoulder"));
        }
        if("combo".equals(section.id))require(((Map<?,?>)get(editors.get("combo_speed"),"sliders")).containsKey(AppConfig.COMBO_SPEED_RATE),"Existing combo multiplier remains available");
        JSONObject report=checkSwitchAlignment(activity,section.id,false);
        return report.put("route",section.route()).put("featureCount",totalSwitches)
                .put("navigationGapDp",checkGap(activity,card,section.id))
                .put("density",activity.getResources().getDisplayMetrics().density)
                .put("fontScale",activity.getResources().getConfiguration().fontScale)
                .put("orientation",activity.getResources().getConfiguration().orientation);
    });}

    private float checkGap(Activity activity,View first,String source){
        View path=tag(activity,"page-path");require(path!=null&&first!=null,"Navigation and first content bounds are available: "+source);
        checkCurrentBreadcrumb(activity,path,source);
        float gap=(top(first)-top(path)-path.getHeight())/activity.getResources().getDisplayMetrics().density;
        require(gap>=7.5f&&gap<=12.5f,"Actual breadcrumb-to-first-card gap is 8–12dp: "+source+" = "+gap);
        return gap;
    }

    private void checkCurrentBreadcrumb(Activity activity,View path,String source){
        String route=ModuleHierarchy.resolve(ModuleNavigation.route(activity));
        View current=tag(activity,"breadcrumb:"+route);
        require(current instanceof TextView&&current.isShown(),"Current breadcrumb is present and visible: "+source);
        Rect visible=new Rect(),pathVisible=new Rect();
        require(current.getGlobalVisibleRect(visible)&&path.getGlobalVisibleRect(pathVisible),"Current breadcrumb and navigation viewport have visible bounds: "+source);
        require(visible.width()>=current.getWidth()-1&&visible.height()>=current.getHeight()-1,"Current breadcrumb is completely visible without clipping: "+source);
        TextView label=(TextView)current;
        require(label.getLayout()!=null&&label.getLayout().getEllipsisCount(0)==0,"Current breadcrumb title is not ellipsized: "+source);
        int[] labelPoint=new int[2],pathPoint=new int[2];current.getLocationInWindow(labelPoint);path.getLocationInWindow(pathPoint);
        int rightGap=pathPoint[0]+path.getWidth()-labelPoint[0]-current.getWidth();
        float density=activity.getResources().getDisplayMetrics().density;
        require(path.getPaddingRight()/density>=19.5f,"Navigation retains its shared 20dp trailing inset: "+source);
        require(rightGap>=path.getPaddingRight()-1,"Current breadcrumb ends before the navigation trailing inset: "+source+" = "+rightGap/density+"dp");
        require(labelPoint[0]>=pathPoint[0]-1,"Current breadcrumb start remains inside the navigation viewport: "+source);
        minimumBreadcrumbRightGapDp=currentBreadcrumbChecks==0?rightGap/density:Math.min(minimumBreadcrumbRightGapDp,rightGap/density);
        currentBreadcrumbChecks++;
    }

    private Activity checkDirectoryRecreation(Activity original,Map<String,String> before)throws Exception{
        String key=GameOptions.REDMAGIC_TIME;
        onMain(()->{
            Map<String,String> draft=(Map<String,String>)get(original,"draft");
            require(draft.containsKey(key),"Directory test can represent an obsolete in-memory game value");
            draft.put(key,ConfigSchema.truthy(before.get(key))?"0":"1");
            require(((FieldEditQueue)get(original,"pending")).restorableValues().isEmpty(),"Read-only stale directory preview queues no save");
            original.recreate();return null;
        });
        long end=SystemClock.uptimeMillis()+12000;
        while(SystemClock.uptimeMillis()<end){
            Activity candidate=resumed;
            if(candidate!=null&&candidate!=original&&!candidate.isFinishing()&&"target-game".equals(ModuleNavigation.route(candidate))){
                settle();onMain(()->{
                    require(((FieldEditQueue)get(candidate,"pending")).restorableValues().isEmpty(),"Recreated directory does not restore stale values as pending saves");
                    require(before.get(key).equals(((Map<?,?>)get(candidate,"draft")).get(key)),"Recreated directory reads the saved value instead of its stale snapshot");
                    return null;
                });return candidate;
            }
            SystemClock.sleep(50);
        }
        throw new AssertionError("Game directory did not recreate after the read-only stale draft preview");
    }

    private Activity landscapePage(Activity original,String route)throws Exception{
        boolean needsRecreation=onMain(()->original.getResources().getConfiguration().orientation!=Configuration.ORIENTATION_LANDSCAPE);
        onMain(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
        long end=SystemClock.uptimeMillis()+15000;
        while(SystemClock.uptimeMillis()<end){
            Activity candidate=resumed;
            if(candidate!=null&&(!needsRecreation||candidate!=original)&&onMain(()->!candidate.isFinishing()
                    &&route.equals(ModuleNavigation.route(candidate))
                    &&candidate.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE)){
                landscapeRecreated|=candidate!=original;
                require(!needsRecreation||candidate!=original,"Landscape request recreates the game activity before inspection: "+route);
                return candidate;
            }
            SystemClock.sleep(50);
        }
        throw new AssertionError("Game activity did not reach landscape after an activity-only orientation request");
    }

    private Activity checkShoulderDraftRecreation(Activity original,Map<String,String> before)throws Exception{
        String key=AppConfig.TGK_RAPID_FIRE_COUNT,expected=before.get(key);
        int stale="1".equals(expected)?2:1;
        onMain(()->{
            FeatureEditorController editor=(FeatureEditorController)editors(original).get("shoulder");
            require(!(Boolean)get(editor,"dirty")&&(Integer)get(editor,"pendingSaves")==0,"Clean shoulder page has no unsaved work before recreation");
            boolean loading=(Boolean)get(editor,"loading");
            set(editor,"loading",true);setRapidFrequency(editor,stale);set(editor,"loading",loading);
            Bundle state=new Bundle();editor.onSaveInstanceState(state);
            require(!state.getBoolean("shoulder-draft-dirty",true),"Saved shoulder state records that its frequency snapshot is clean");
            require(String.valueOf(stale).equals(state.getBundle("editor-values").getString(key)),"Clean saved shoulder snapshot contains an obsolete frequency for the recreation test");
            require(!(Boolean)get(editor,"dirty"),"Preparing an obsolete clean snapshot queues no save");
            shoulderRecreateSource=original;shoulderRecreated=null;shoulderRecreationError=null;
            original.recreate();return null;
        });
        Activity candidate=null;
        try{
            long end=SystemClock.uptimeMillis()+12000;
            while(SystemClock.uptimeMillis()<end){
                Activity restored=shoulderRecreated;
                if(restored!=null&&restored!=original&&restored==resumed){candidate=restored;break;}
                SystemClock.sleep(50);
            }
            require(candidate!=null,"Shoulder page is recreated from its clean obsolete saved state");settle();
            Activity recreated=candidate;
            onMain(()->{
                if(shoulderRecreationError!=null)throw new AssertionError("Could not inspect recreated shoulder state",shoulderRecreationError);
                require(expected.equals(shoulderRecreatedCount),"Clean shoulder restore reads current persisted frequency instead of its obsolete saved snapshot");
                require(!shoulderRecreatedDirty&&shoulderRecreatedPendingSaves==0,"Clean shoulder restore does not mark the obsolete frequency dirty or queue a write");
                FeatureEditorController editor=(FeatureEditorController)editors(recreated).get("shoulder");
                require(expected.equals(rapidFrequency(editor))&&!(Boolean)get(editor,"dirty"),"Recreated shoulder page retains current frequency after resume");
                return null;
            });
            require(before.equals(new AppConfig(context).snapshot()),"Clean shoulder recreation leaves persistent configuration unchanged");
            rapidCleanDraftRecreated=true;
            checkShoulderDirtyDraft(candidate,before);
            return candidate;
        }finally{onMain(()->{shoulderRecreateSource=null;return null;});}
    }

    /** Restore a real dirty draft and cancel its debounce within the same UI turn. */
    private void checkShoulderDirtyDraft(Activity activity,Map<String,String> before)throws Exception{onMain(()->{
        FeatureEditorController editor=(FeatureEditorController)editors(activity).get("shoulder");
        String current=rapidFrequency(editor);int edited="1".equals(current)?2:1;
        boolean loading=(Boolean)get(editor,"loading"),dirty=(Boolean)get(editor,"dirty");
        long generation=(Long)get(editor,"changeGeneration"),queued=(Long)get(editor,"queuedGeneration");
        Handler main=(Handler)get(editor,"main");Runnable save=(Runnable)get(editor,"statusAutoSave");
        android.widget.Button saveButton=(android.widget.Button)get(editor,"save");boolean saveEnabled=saveButton.isEnabled();
        Bundle draft=new Bundle();editor.onSaveInstanceState(draft);
        draft.putBoolean("shoulder-draft-dirty",true);draft.getBundle("editor-values").putString(AppConfig.TGK_RAPID_FIRE_COUNT,String.valueOf(edited));
        Method restore=FeatureEditorController.class.getDeclaredMethod("restoreDraft",Bundle.class);restore.setAccessible(true);
        try{
            restore.invoke(editor,draft);
            require(String.valueOf(edited).equals(rapidFrequency(editor))&&(Boolean)get(editor,"dirty"),"An actual dirty shoulder draft preserves its edited frequency for later saving");
            Bundle saved=new Bundle();editor.onSaveInstanceState(saved);
            require(saved.getBoolean("shoulder-draft-dirty",false)&&String.valueOf(edited).equals(saved.getBundle("editor-values").getString(AppConfig.TGK_RAPID_FIRE_COUNT)),"Dirty shoulder state keeps both its edit and dirty marker");
            require((Integer)get(editor,"pendingSaves")==0,"Dirty-draft regression inspects the debounce before any write begins");
            rapidDirtyDraftPreserved=true;
        }finally{
            main.removeCallbacks(save);set(editor,"loading",true);setRapidFrequency(editor,Integer.parseInt(current));
            set(editor,"dirty",dirty);set(editor,"changeGeneration",generation);set(editor,"queuedGeneration",queued);set(editor,"loading",loading);
            ((UiKit)get(editor,"ui")).setButtonEnabled(saveButton,saveEnabled);
        }
        require(before.equals(new AppConfig(context).snapshot())&&!(Boolean)get(editor,"dirty"),"Dirty shoulder draft preview restores all in-memory state without saving configuration");
        return null;
    });}

    private static String rapidFrequency(FeatureEditorController editor)throws Exception{
        Object slider=((Map<?,?>)get(editor,"sliders")).get(AppConfig.TGK_RAPID_FIRE_COUNT);
        Method serialized=slider.getClass().getDeclaredMethod("serialized");serialized.setAccessible(true);return (String)serialized.invoke(slider);
    }
    private static void setRapidFrequency(FeatureEditorController editor,int value)throws Exception{
        Object slider=((Map<?,?>)get(editor,"sliders")).get(AppConfig.TGK_RAPID_FIRE_COUNT);
        Method change=slider.getClass().getDeclaredMethod("setValue",int.class);change.setAccessible(true);change.invoke(slider,value);
    }

    private void revealLastFeature(Activity activity,ModuleHierarchy.Section section,JSONObject report)throws Exception{
        onMain(()->{
            ScrollView scroll=(ScrollView)tag(activity,"detail-scroll");
            require(scroll!=null&&scroll.isShown()&&scroll.getChildCount()==1,"The tagged detail scroll contains the actual game content");
            scroll.scrollTo(0,scroll.getChildAt(0).getHeight());return null;
        });
        settle();
        onMain(()->{
            ScrollView scroll=(ScrollView)tag(activity,"detail-scroll");
            View last=tag(activity,"native-feature:"+section.features.get(section.features.size()-1).id);
            Rect featureBounds=new Rect(),scrollBounds=new Rect(),screenBounds=new Rect();
            require(last!=null&&last.isShown(),"Last group feature remains in the visible game page: "+section.id);
            require(last.getGlobalVisibleRect(featureBounds)&&scroll.getGlobalVisibleRect(scrollBounds)
                    &&activity.getWindow().getDecorView().getGlobalVisibleRect(screenBounds),"Actual bottom feature and viewport bounds are available");
            boolean fullyVisible=featureBounds.width()>=last.getWidth()-1&&featureBounds.height()>=last.getHeight()-1
                    &&scrollBounds.contains(featureBounds)&&screenBounds.contains(featureBounds);
            lastFeatureFullyVisible&=fullyVisible;
            require(fullyVisible,"Last group feature is fully inside the on-screen scroll viewport: "+section.id);
            bottomScrollY=Math.max(bottomScrollY,scroll.getScrollY());
            require(scroll.getChildAt(0).getHeight()<=scroll.getHeight()||scroll.getScrollY()>0,"Long group page has actually scrolled down before the bottom screenshot: "+section.id);
            report.put("bottomScrollY",scroll.getScrollY()).put("lastFeatureFullyVisible",fullyVisible);
            return null;
        });
    }

    private void assertDestination(Activity activity,String route,String source){
        require(activity instanceof EnhancementSettingsActivity&&route.equals(ModuleNavigation.route(activity)),"Entry reaches the expected game page: "+source+" -> "+route);
        require(tag(activity,"breadcrumb:home")!=null&&tag(activity,"breadcrumb:target-game")!=null,"Game page retains Home and game directory in its breadcrumb: "+source);
        int crumbs=0;
        for(View view:all(activity.getWindow().getDecorView()))if(view.getTag() instanceof String&&((String)view.getTag()).startsWith("breadcrumb:"))crumbs++;
        require(crumbs==("target-game".equals(route)?2:3),"Game pages have exactly two or three breadcrumb levels: "+source);
        for(ModuleHierarchy.Section section:ModuleHierarchy.sections("game"))
            require((tag(activity,"breadcrumb:"+section.route())!=null)==section.route().equals(route),"Only the current group occurs in breadcrumbs: "+section.route());
        for(String editor:Arrays.asList("shoulder","combo_speed","super_resolution"))
            require((tag(activity,"inline-editor:"+editor)!=null)==ModuleHierarchy.resolve(editor).equals(route),"Page contains only its own embedded editor: "+editor);
    }

    private void checkComboFold(Activity activity)throws Exception{onMain(()->{
        FeatureEditorController editor=(FeatureEditorController)editors(activity).get("combo_speed");
        Switch toggle=switches(editor).get(AppConfig.COMBO_SPEED_ENABLED);
        UiKit.Fold fold=((List<UiKit.Fold>)get(editor,"folds")).get(0);
        boolean loading=(Boolean)get(editor,"loading"),checked=toggle.isChecked(),expanded=fold.content.getVisibility()==View.VISIBLE;
        Object slider=((Map<?,?>)get(editor,"sliders")).get(AppConfig.COMBO_SPEED_RATE);
        SeekBar bar=(SeekBar)get(slider,"bar");int progress=bar.getProgress();
        try{
            set(editor,"loading",true);toggle.setChecked(false);fold.sync();fold.show(true);
            require(fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled combo cannot expand its parameter");
            toggle.setChecked(true);fold.sync();require(fold.content.getVisibility()==View.VISIBLE,"Enabling combo expands its parameter");
            fold.arrow.performClick();require(toggle.isChecked()&&fold.content.getVisibility()==View.GONE,"Collapsing combo preserves its enabled state");
            fold.arrow.performClick();require(fold.content.getVisibility()==View.VISIBLE,"Combo parameter expands again on the same page");
            require(bar.getProgress()==progress,"Closing or reopening combo preserves the multiplier");
        }finally{toggle.setChecked(checked);fold.sync();fold.show(expanded);set(editor,"loading",loading);}
        require(!(Boolean)get(editor,"dirty"),"In-memory fold preview queues no configuration save");
        return null;
    });}

    private void checkRapidRow(Activity activity,FeatureEditorController editor)throws Exception{
        Switch rapid=switches(editor).get(AppConfig.TGK_RAPID_FIRE_ENABLED);
        Switch shoulder=switches(editor).get(AppConfig.SHOULDER_ENABLED);
        ViewGroup rapidRow=(ViewGroup)rapid.getParent(),shoulderRow=(ViewGroup)shoulder.getParent();
        require("feature-row".equals(rapidRow.getTag())&&"feature-row".equals(shoulderRow.getTag()),"Rapid and all-app shoulder use the shared feature row");
        require(rapid.getVisibility()==View.VISIBLE&&rapid.isEnabled()&&rapid.isClickable(),"Rapid switch is visible and interactive before compatibility succeeds");
        require(rapidRow.getChildCount()==3&&rapidRow.getChildAt(1)==rapid,"Rapid row retains the shared title, switch and expansion columns");
        int textCount=0;TextView rapidTitle=null,shoulderTitle=null;
        for(View child:all(rapidRow))if(child instanceof TextView&&!(child instanceof Switch)){
            textCount++;rapidTitle=(TextView)child;
            require("极速连点".contentEquals(rapidTitle.getText()),"Rapid row contains its title without inline descriptions or test actions");
        }
        for(View child:all(shoulderRow))if(child instanceof TextView&&!(child instanceof Switch))shoulderTitle=(TextView)child;
        require(textCount==1&&rapidTitle!=null&&shoulderTitle!=null,"Both feature rows have their normal title");
        require(rapidTitle.getTextSize()==shoulderTitle.getTextSize()&&rapidTitle.getCurrentTextColor()==shoulderTitle.getCurrentTextColor(),"Rapid title uses the same typography and color as all-app shoulder");
        require(Math.abs(rapidRow.getHeight()-shoulderRow.getHeight())<=1,"Rapid row has the same actual height as all-app shoulder");
        require(tag(activity,"rapid-compatibility-panel")==null,"Shoulder page contains no inline compatibility panel");
        for(View view:all(activity.getWindow().getDecorView()))if(view instanceof TextView)
            require(!"兼容性测试".contentEquals(((TextView)view).getText()),"Shoulder page contains no standalone compatibility entry");
    }

    private Activity checkRapidGate(Activity activity)throws Exception{
        FeatureEditorController editor=(FeatureEditorController)editors(activity).get("shoulder");
        long identityEnd=SystemClock.uptimeMillis()+10000;
        while(onMain(()->(Boolean)get(editor,"rapidFingerprintLoading"))&&SystemClock.uptimeMillis()<identityEnd)SystemClock.sleep(50);
        require(!onMain(()->(Boolean)get(editor,"rapidFingerprintLoading")),"Device identity read settles before the read-only compatibility preview");
        Switch toggle=switches(editor).get(AppConfig.TGK_RAPID_FIRE_ENABLED);
        View parameters=(View)get(editor,"rapidParameters"),arrow=(View)get(editor,"rapidExpand");
        Handler main=(Handler)get(editor,"main");Runnable poll=(Runnable)get(editor,"statusPoll");
        boolean[] state=onMain(()->new boolean[]{(Boolean)get(editor,"loading"),toggle.isChecked(),(Boolean)get(editor,"rapidFeatureUnlocked"),(Boolean)get(editor,"rapidParametersExpanded")});
        Object fingerprint=onMain(()->get(editor,"rapidFingerprint"));
        AppConfig config=new AppConfig(context);Map<String,String> configBefore=new LinkedHashMap<>(config.snapshot());
        String storedSession=config.get(AppConfig.TGK_RAPID_FIRE_TEST_SESSION);
        Method update=FeatureEditorController.class.getDeclaredMethod("updateRapidFeatureUi",boolean.class);update.setAccessible(true);
        Activity returned=activity;
        try{
            onMain(()->{
                main.removeCallbacks(poll);set(editor,"loading",true);toggle.setChecked(false);
                set(editor,"rapidFingerprint","");update.invoke(editor,false);set(editor,"loading",false);
                require(toggle.getVisibility()==View.VISIBLE&&toggle.isEnabled(),"Unverified rapid fire keeps its actionable switch");
                require(parameters.getVisibility()==View.GONE&&!arrow.isEnabled(),"Unverified rapid fire has no editable frequency");
                return null;
            });
            test.getUiAutomation().executeAndWaitForEvent(()->{
                try{onMain(()->{toggle.performClick();return null;});}
                catch(Exception error){throw new AssertionError(error);}
            },event->event.getEventType()==android.view.accessibility.AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED
                    &&event.getText().toString().contains("请先进入兼容性测试"),5000).recycle();
            rapidCompatibilityPromptObserved=true;
            Activity entered=await("rapid_compatibility");
            Activity compatibility=landscape?landscapePage(entered,"rapid_compatibility"):entered;settle();
            onMain(()->{
                require(!toggle.isChecked()&&!(Boolean)get(editor,"dirty"),"Blocked enabling resets the switch without queuing a save");
                checkRapidCompatibilityPage(compatibility,storedSession);
                return null;
            });
            require(configBefore.equals(config.snapshot()),"Opening compatibility does not enable rapid fire or save a new test session");
            capture("02-fourth-level-rapid-compatibility");
            onMain(()->{set(editor,"rapidFingerprint",fingerprint);return null;});
            clickTag(compatibility,"breadcrumb:group/game/shoulder");
            Activity resumedShoulder=await("group/game/shoulder");
            returned=landscape?landscapePage(resumedShoulder,"group/game/shoulder"):resumedShoulder;settle();
            require(landscape||returned==activity,"Compatibility breadcrumb returns to the same shoulder page, retaining its instance when configuration is unchanged");
            if(returned!=activity)checkGroup(returned,ModuleHierarchy.group("group/game/shoulder"),configBefore);
            rapidCompatibilityReturned=true;
            if(!layoutOnly)onMain(()->{
                main.removeCallbacks(poll);set(editor,"loading",true);set(editor,"rapidFingerprint",fingerprint);
                toggle.setChecked(false);update.invoke(editor,true);
                require(toggle.getVisibility()==View.VISIBLE&&toggle.isEnabled()&&!toggle.isChecked(),"Successful compatibility leaves rapid fire off until explicitly enabled");
                require(parameters.getVisibility()==View.GONE&&!arrow.isEnabled(),"Compatible but disabled rapid fire cannot expand");
                toggle.setChecked(true);set(editor,"rapidParametersExpanded",true);update.invoke(editor,true);
                require(parameters.getVisibility()==View.VISIBLE&&arrow.isEnabled(),"Enabled compatible rapid fire exposes the existing frequency parameter");
                arrow.performClick();require(toggle.isChecked()&&parameters.getVisibility()==View.GONE,"Collapsing rapid parameters preserves enabled state");
                toggle.setChecked(false);update.invoke(editor,true);
                require(parameters.getVisibility()==View.GONE,"Disabling rapid fire collapses its frequency parameter");
                return null;
            });
        }finally{
            onMain(()->{if(activity.isDestroyed())return null;set(editor,"loading",true);set(editor,"rapidFingerprint",fingerprint);toggle.setChecked(state[1]);set(editor,"rapidParametersExpanded",state[3]);update.invoke(editor,state[2]);set(editor,"loading",state[0]);main.removeCallbacks(poll);if(resumed==activity)main.post(poll);return null;});
        }
        require(!(Boolean)get(editor,"dirty")&&configBefore.equals(config.snapshot()),"Compatibility UI checks never save settings, issue an unlock token or operate shoulder keys");
        return returned;
    }

    private void checkRapidCompatibilityPage(Activity activity,String storedSession)throws Exception{
        require(activity instanceof FeatureActivity&&"rapid_compatibility".equals(ModuleNavigation.route(activity)),"Rapid enabling opens the independent compatibility activity");
        List<String> expected=Arrays.asList("home","target-game","group/game/shoulder","rapid_compatibility");int crumbs=0;
        for(View view:all(activity.getWindow().getDecorView())){
            require(!(view instanceof Switch),"Compatibility page only contains the testing workflow");
            if(view.getTag() instanceof String&&((String)view.getTag()).startsWith("breadcrumb:"))crumbs++;
        }
        require(crumbs==4,"Compatibility page displays exactly four breadcrumb levels");
        for(String route:expected)require(tag(activity,"breadcrumb:"+route)!=null,"Compatibility breadcrumb includes "+route);
        View panel=tag(activity,"rapid-compatibility-panel");
        require(panel!=null&&panel.isShown(),"Compatibility workflow is visible on its dedicated page");
        require(tag(activity,"rapid-compatibility-status") instanceof TextView&&tag(activity,"rapid-compatibility-start")!=null&&tag(activity,"rapid-compatibility-cancel")!=null,"Existing test status, start and cancellation controls remain available");
        FeatureEditorController editor=(FeatureEditorController)get(activity,"editor");
        require(!editor.embedded&&FeatureEditorController.MODULE_RAPID_COMPATIBILITY.equals(get(editor,"section")),"Standalone compatibility uses the existing feature controller in its dedicated mode");
        require(!(Boolean)get(editor,"dirty")&&!(Boolean)get(editor,"rapidCaptureInFlight"),"Entering the compatibility page does not begin physical capture or queue a save");
        RapidFireCompatibility.Session session=(RapidFireCompatibility.Session)get(editor,"rapidSession");
        require(session==null||session.serialize().equals(storedSession),"Entering compatibility only reads the existing test session");
        require(storedSession.equals(new AppConfig(context).get(AppConfig.TGK_RAPID_FIRE_TEST_SESSION)),"Compatibility entry never creates or advances the stored test session");
        rapidCompatibilityGapDp=checkGap(activity,panel,"Rapid compatibility");
        rapidCompatibilityFontScale=activity.getResources().getConfiguration().fontScale;
        rapidCompatibilityOrientation=activity.getResources().getConfiguration().orientation;
        require(Math.abs(rapidCompatibilityFontScale-observedFontScale)<.001f,"Compatibility page keeps the device font scale used for the group layout check");
        require(!landscape||rapidCompatibilityOrientation==Configuration.ORIENTATION_LANDSCAPE,"Compatibility page is actually rendered in landscape before its screenshot");
    }

    /** Suspend read-only polling while previewing the compatible expanded layout; no save is scheduled. */
    private void checkExpandedRapidAlignment(Activity activity)throws Exception{
        FeatureEditorController editor=(FeatureEditorController)editors(activity).get("shoulder");
        Switch toggle=switches(editor).get(AppConfig.TGK_RAPID_FIRE_ENABLED);
        Handler main=(Handler)get(editor,"main");Runnable poll=(Runnable)get(editor,"statusPoll");
        Method update=FeatureEditorController.class.getDeclaredMethod("updateRapidFeatureUi",boolean.class);update.setAccessible(true);
        boolean[] state=onMain(()->new boolean[]{(Boolean)get(editor,"loading"),toggle.isChecked(),(Boolean)get(editor,"rapidFeatureUnlocked"),(Boolean)get(editor,"rapidParametersExpanded")});
        try{
            onMain(()->{main.removeCallbacks(poll);set(editor,"loading",true);toggle.setChecked(true);set(editor,"rapidParametersExpanded",true);update.invoke(editor,true);return null;});
            settle();
            onMain(()->{require(((View)get(editor,"rapidParameters")).getVisibility()==View.VISIBLE,"Rapid frequency is expanded for switch-column measurement");checkSwitchAlignment(activity,"shoulder",true);return null;});
            capture("02-third-level-shoulder-rapid-expanded");
        }finally{
            onMain(()->{toggle.setChecked(state[1]);set(editor,"rapidParametersExpanded",state[3]);update.invoke(editor,state[2]);set(editor,"loading",state[0]);main.removeCallbacks(poll);main.post(poll);return null;});
        }
        require(!(Boolean)get(editor,"dirty"),"Rapid layout preview queues no configuration save");
    }

    private JSONObject checkSwitchAlignment(Activity activity,String group,boolean rapidVisible)throws Exception{
        float left=Float.MAX_VALUE,right=-Float.MAX_VALUE,density=activity.getResources().getDisplayMetrics().density;
        int count=0;
        for(View view:all(activity.getWindow().getDecorView()))if(view instanceof Switch&&view.getVisibility()==View.VISIBLE){
            int[] point=new int[2];view.getLocationInWindow(point);float end=point[0]+view.getWidth();
            left=Math.min(left,end);right=Math.max(right,end);count++;
            require(Math.abs(view.getWidth()/density-46)<1,"Every game switch retains the public 46dp width");
        }
        float spread=(right-left)/density;
        if(!rapidVisible)alignedSwitches+=count;
        switchRightSpreadDp=Math.max(switchRightSpreadDp,spread);
        int expected=featureCount(group);
        require(count==expected,"All expected group switches participate in actual column measurement: "+group+" = "+count);
        require(spread<=1,"Group switch right edges share one column: "+group+" = "+spread+"dp");
        return new JSONObject().put("alignedSwitches",count).put("switchRightSpreadDp",spread);
    }

    private static int featureCount(String group){
        switch(group){case "shoulder":return 3;case "combo":return 2;case "performance":return 6;case "plugins":return 2;case "game_capture":return 4;default:throw new AssertionError("Unknown game group: "+group);}
    }

    private static Map<String,NativeEditorController> editors(Activity activity)throws Exception{return (Map<String,NativeEditorController>)get(activity,"editors");}
    private static Map<String,Switch> switches(FeatureEditorController editor)throws Exception{return (Map<String,Switch>)get(editor,"switches");}
    private static Object get(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private static void set(Object owner,String name,Object value)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);field.set(owner,value);}
    private static View tag(Activity activity,String tag){return activity.getWindow().getDecorView().findViewWithTag(tag);}
    private static float top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private static List<View> all(View view){List<View> list=new ArrayList<>();list.add(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)list.addAll(all(((ViewGroup)view).getChildAt(i)));return list;}
    private static <T extends View>T find(View root,Class<T> type){for(View view:all(root))if(type.isInstance(view))return type.cast(view);return null;}
    private void clickText(Activity activity,String label)throws Exception{onMain(()->{View found=null;for(View view:all(activity.getWindow().getDecorView()))if(view instanceof TextView&&label.contentEquals(((TextView)view).getText())){found=view;break;}while(found!=null&&!found.isClickable())found=found.getParent() instanceof View?(View)found.getParent():null;require(found!=null&&found.performClick(),"Click "+label);return null;});}
    private void clickTag(Activity activity,String value)throws Exception{onMain(()->{View view=tag(activity,value);require(view!=null&&view.performClick(),"Click "+value);return null;});}
    private Activity await(String route){long end=SystemClock.uptimeMillis()+12000;while(SystemClock.uptimeMillis()<end){Activity activity=resumed;if(activity!=null&&!activity.isFinishing()&&route.equals(ModuleNavigation.route(activity)))return activity;SystemClock.sleep(50);}throw new AssertionError("Timed out awaiting "+route);}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(200);}
    private void capture(String name)throws Exception{settle();Bitmap image=test.getUiAutomation().takeScreenshot();require(image!=null,"Screenshot available");File file=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(file)){image.compress(Bitmap.CompressFormat.PNG,100,out);}finally{image.recycle();}screenshots.put(file.getAbsolutePath());}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return value.get();}
    @Override public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);if(activity instanceof SettingsActivity)try{set(activity,"environmentLoading",true);set(activity,"requestedRoot",true);}catch(Exception error){throw new AssertionError(error);}}
    @Override public void onActivityResumed(Activity activity){
        resumed=activity;
        if(shoulderRecreateSource!=null&&activity!=shoulderRecreateSource&&"group/game/shoulder".equals(ModuleNavigation.route(activity))){
            try{
                FeatureEditorController editor=(FeatureEditorController)editors(activity).get("shoulder");
                shoulderRecreatedCount=rapidFrequency(editor);shoulderRecreatedDirty=(Boolean)get(editor,"dirty");shoulderRecreatedPendingSaves=(Integer)get(editor,"pendingSaves");
                // Even a regression must not flush the injected obsolete value during failure cleanup.
                ((Handler)get(editor,"main")).removeCallbacks((Runnable)get(editor,"statusAutoSave"));set(editor,"dirty",false);
            }catch(Throwable error){shoulderRecreationError=error;}
            finally{shoulderRecreateSource=null;shoulderRecreated=activity;}
        }
    }
    @Override public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityStarted(Activity activity){}
    @Override public void onActivityStopped(Activity activity){}
    @Override public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
