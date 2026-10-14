package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.*;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Reads the V2 presentation hierarchy on-device. Never toggles or saves a feature. */
final class ModuleHierarchyUiCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final List<Activity> activities=new ArrayList<>();
    private final Set<String> inspected=new LinkedHashSet<>();
    private final JSONArray pages=new JSONArray(),screens=new JSONArray(),gaps=new JSONArray(),searches=new JSONArray(),aliases=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private AppConfig config;
    private SharedPreferences preferences;
    private Map<String,String> baseline;
    private Map<String,?> rawBaseline;
    private int checks,visibleControls;
    private float density,fontScale;
    private int orientation,nightMode;
    private String stage="launch";
    private ModuleHierarchyUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new ModuleHierarchyUiCases(test).execute();}

    private JSONObject execute()throws Exception{
        directory=new File(context.getExternalFilesDir(null),"native-navigation-"+BuildConfig.VERSION_CODE);
        require(directory.isDirectory()||directory.mkdirs(),"Navigation evidence directory is available");
        config=new AppConfig(context);baseline=new LinkedHashMap<>(config.snapshot());
        preferences=context.getSharedPreferences(AppConfig.PREFS,0);rawBaseline=new LinkedHashMap<>(preferences.getAll());
        SharedPreferences consent=context.getSharedPreferences("ls_augment_consent",0);
        Object accepted=consent.getAll().get("accepted_version"),marker=consent.getAll().get("ui_navigation_test");
        boolean wasUnlocked=HiddenEntrySession.isUnlocked();
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            require(consent.edit().putInt("accepted_version",ModuleLegal.VERSION).putBoolean("ui_navigation_test",true).commit(),"Navigation-only test marker is prepared");
            HiddenEntrySession.lock();
            test.startActivitySync(new Intent(context,SettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK));
            Activity home=await("home");settle();
            onMain(()->{density=home.getResources().getDisplayMetrics().density;Configuration c=home.getResources().getConfiguration();fontScale=c.fontScale;orientation=c.orientation;nightMode=c.uiMode&Configuration.UI_MODE_NIGHT_MASK;return null;});
            require(ModulePresentationCatalog.categories().size()==13,"Merged V2 has exactly 13 presentation categories");
            checkHome(home);capture("01-home-top");
            onMain(()->{ScrollView s=find(home.getWindow().getDecorView(),ScrollView.class);if(s!=null)s.fullScroll(View.FOCUS_DOWN);return null;});capture("02-home-bottom");
            onMain(()->{ScrollView s=find(home.getWindow().getDecorView(),ScrollView.class);if(s!=null)s.scrollTo(0,0);return null;});
            checkSearch(home);
            for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories()){
                stage="category:"+category.id;clickText(home,category.title);
                String categoryRoute=ModuleHierarchy.resolve(category.route());
                Activity directoryPage=await(categoryRoute);inspect(directoryPage,category.id);checkDirectoryCounts(directoryPage,category.id);
                if(Arrays.asList("connectivity","gaming","capture","multitasking","notifications","lockscreen").contains(category.id))capture("category-"+category.id);
                for(ModuleHierarchy.Section section:ModuleHierarchy.sections(category.id)){
                    if(section.restricted)continue;
                    String route=ModuleHierarchy.resolve(section.route());Activity selected;
                    if(route.equals(categoryRoute))selected=directoryPage;
                    else{clickTag(directoryPage,"navigation:"+section.route());selected=await(route);}
                    inspectSection(selected,section,category.id);
                    if(selected!=directoryPage){back(selected,categoryRoute);require(resumed==directoryPage,"Back preserves category instance: "+category.id);checkDirectoryCounts(directoryPage,category.id);}
                }
                clickTag(directoryPage,"breadcrumb:home");require(await("home")==home,"Category breadcrumb returns to original Home: "+category.id);
                unchanged("category "+category.id);writeProgress();
            }
            for(ModuleHierarchy.Section section:ModuleHierarchy.allSections())if(!section.restricted)
                require(inspected.contains(ModuleHierarchy.resolve(section.route())),"Every public section was reached through its category: "+section.route());
            checkLegacyRoutes(home);checkHiddenEntry(home);unchanged("all navigation");
        }catch(Throwable error){failure=error;try{capture("failure");}catch(Throwable shot){error.addSuppressed(shot);}}
        finally{
            try{onMain(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed())activity.finish();return null;});settle();}
            catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            try{
                app.unregisterActivityLifecycleCallbacks(this);
                SharedPreferences.Editor restore=consent.edit().remove("accepted_version").remove("ui_navigation_test");
                if(accepted instanceof Integer)restore.putInt("accepted_version",(Integer)accepted);
                if(marker instanceof Boolean)restore.putBoolean("ui_navigation_test",(Boolean)marker);
                require(restore.commit(),"Original test marker and consent state are restored");
                HiddenEntrySession.lock();if(wasUnlocked)unlockHidden();unchanged("finished activity lifecycle");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
        }
        JSONObject result=report().put("success",failure==null).put("configurationUnchanged",baseline.equals(config.snapshot()))
                .put("rawPreferencesUnchanged",rawBaseline.equals(preferences.getAll())).put("configurationKeysBefore",baseline.size())
                .put("configurationKeysAfter",config.snapshot().size()).put("changedConfigurationKeys",new JSONArray(changedKeys(baseline,config.snapshot())))
                .put("changedPreferenceKeys",new JSONArray(changedKeys(rawBaseline,preferences.getAll())));
        if(failure!=null)result.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),result.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("V2 navigation regression failed at "+stage,failure);return result;
    }

    private void checkHome(Activity home)throws Exception{onMain(()->{
        View panel=tag(home,"home-app-groups");require(panel instanceof ViewGroup,"Home category card exists");
        int categoryCount=ModulePresentationCatalog.categories().size();
        require(categoryCount==13&&((ViewGroup)panel).getChildCount()==categoryCount*2-1,"Home has 13 category rows and 12 separators");
        require(findText(panel,"状态栏与灵动岛")==null&&findText(panel,"主题资源")==null&&findText(panel,"锁屏与息屏")==null,"Merged old category titles are absent from Home");
        for(ModulePresentationCatalog.Category c:ModulePresentationCatalog.categories())require(findText(panel,c.title)!=null,"Home contains V2 category: "+c.title);
        require(findText(panel,"四大皆空")==null&&findText(panel,"应用隐藏")==null,"Hidden tools are never a separate Home category");return null;
    });}

    private void checkSearch(Activity home)throws Exception{
        for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories()){
            stage="search:"+category.id;setSearch(home,category.title);
            require(onMain(()->findText(tag(home,"home-app-groups"),category.title))!=null,"Category title remains searchable: "+category.title);
            clickTag(home,"search-result:"+ModuleHierarchy.resolve(category.route()));Activity selected=await(ModuleHierarchy.resolve(category.route()));
            require(category.id.equals(ModuleHierarchy.categoryForRoute(ModuleNavigation.route(selected))),"Search opens matching presentation category: "+category.id);
            clickTag(selected,"breadcrumb:home");require(await("home")==home,"Search result returns Home");setSearch(home,"");
            searches.put(new JSONObject().put("query",category.title).put("category",category.id));
        }
        for(String[] query:new String[][]{{"MTP","connectivity","group/connectivity/usb_mtp"},{"USB","connectivity","group/connectivity/usb"},{"截图隐藏状态栏","capture","group/capture/capture"},{"AI","gaming","ai_trigger"},{"状态栏自定义","notifications","status_layout"},{"灵动岛","notifications","group/notifications/island"},{"主题下载与使用","lockscreen","group/lockscreen/theme_download"},{"联名主题","lockscreen","group/lockscreen/collab_theme"}}){
            setSearch(home,query[0]);String destination=ModuleHierarchy.resolve(query[2]);
            require(onMain(()->tag(home,"search-result:"+destination))!=null,"Ambiguous keyword exposes a direct result at its primary location: "+query[0]);
            clickTag(home,"search-result:"+destination);Activity result=await(destination);
            require(query[1].equals(ModuleHierarchy.categoryForRoute(ModuleNavigation.route(result))),"Keyword opens its new category: "+query[0]);
            clickTag(result,"breadcrumb:home");await("home");
            searches.put(new JSONObject().put("query",query[0]).put("category",query[1]).put("destination",destination));
        }
        setSearch(home,"");checkHome(home);unchanged("search results");
    }

    private void inspectSection(Activity page,ModuleHierarchy.Section section,String category)throws Exception{
        inspect(page,category);checkFeatureControls(page,section.features);
        for(String entry:section.entries){
            if(ModuleHierarchy.isRestricted(entry))continue;
            if(ModuleHierarchy.hasInlineEditors(section)){
                onMain(()->{
                    View inline=tag(page,"inline-editor:"+entry);
                    require(inline instanceof ViewGroup&&((ViewGroup)inline).getChildCount()>0,"Section contains the real inline editor: "+entry);
                    require(!all(inline,TextView.class).isEmpty(),"Inline editor contains its actual controls and labels: "+entry);
                    return null;
                });
                continue;
            }
            ModuleHierarchy.Section child=ModuleHierarchy.group(entry);String destination=ModuleHierarchy.resolve(entry);
            if(destination.equals(ModuleNavigation.route(page)))continue;
            View navigation=onMain(()->tag(page,"navigation:"+entry));
            require(navigation!=null,"Editor/subsection has a navigation row: "+entry);
            clickTag(page,"navigation:"+entry);Activity nested=await(destination);inspect(nested,category);
            if(child!=null)inspectSection(nested,child,category);
            if("status_layout".equals(destination))inspectStatusPages(nested);
            checkDedicatedControls(nested);
            if(Arrays.asList("ai_trigger","freeform_rules","freeform_limits","status_layout").contains(destination))capture("page-"+destination);
            back(nested,ModuleNavigation.route(page));require(resumed==page,"Nested Back returns exact parent: "+entry);
        }
        String route=ModuleNavigation.route(page);
        if("status_layout".equals(route))inspectStatusPages(page);checkDedicatedControls(page);
        if(route.contains("/usb")||route.contains("/capture/")||"ai_trigger".equals(route)||route.startsWith("freeform_"))capture("page-"+route.replace('/','-'));
        unchanged(route);
    }
    private void checkDedicatedControls(Activity page)throws Exception{
        String route=ModuleNavigation.route(page);
        if("ai_trigger".equals(route))checkBoolean(page,ConfigSchema.AI_TRIGGER_ENABLED);
        if("freeform_rules".equals(route))for(String key:Arrays.asList(ConfigSchema.FREEFORM_GAME_LOGIN,ConfigSchema.FREEFORM_EXTERNAL_APPS))checkBoolean(page,key);
        if("freeform_limits".equals(route))for(String key:Arrays.asList(ConfigSchema.FREEFORM_UNLIMITED,ConfigSchema.FREEFORM_ALL_APPS))checkBoolean(page,key);
    }
    private void inspectStatusPages(Activity directoryPage)throws Exception{
        for(String route:StatusBarPages.ROUTES){
            clickTag(directoryPage,"navigation:"+route);Activity page=await(route);inspect(page,"notifications");
            if("status_arrangement".equals(route))capture("page-status-arrangement");
            back(page,"status_layout");require(resumed==directoryPage,"Status editor Back preserves directory: "+route);unchanged(route);
        }
    }

    private void inspect(Activity page,String category)throws Exception{
        stage="page:"+ModuleNavigation.route(page);settle();
        onMain(()->{
            String route=ModuleNavigation.route(page);require(category!=null&&category.equals(ModuleHierarchy.categoryForRoute(route)),"Page has expected V2 owner: "+route);
            Configuration c=page.getResources().getConfiguration();require(Math.abs(page.getResources().getDisplayMetrics().density-density)<.001f&&Math.abs(c.fontScale-fontScale)<.001f&&c.orientation==orientation&&(c.uiMode&Configuration.UI_MODE_NIGHT_MASK)==nightMode,"Same density, font scale, orientation and theme");
            View header=tag(page,"detail-header"),path=tag(page,"page-path");require(header!=null&&path!=null,"Public toolbar and breadcrumb exist: "+route);
            List<String> expected=ModuleHierarchy.path(route);require(!expected.isEmpty()&&"home".equals(expected.get(0))&&route.equals(expected.get(expected.size()-1)),"Path starts at Home and ends at current route");
            require(new HashSet<>(expected).size()==expected.size()&&expected.size()<10,"Path is acyclic: "+route);
            for(String crumb:expected)require(tag(page,"breadcrumb:"+crumb)!=null,"Actual breadcrumb includes ancestor: "+crumb);
            for(View text:all(header,TextView.class))require(((TextView)text).length()==0,"Toolbar does not repeat path title");
            for(View text:all(path,TextView.class)){
                float actualPx=((TextView)text).getTextSize();
                float expectedPx=TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,13.225f,text.getResources().getDisplayMetrics());
                require(Math.abs(actualPx-expectedPx)<.03f,"Breadcrumb keeps public font size: "+route+" (actualPx="+actualPx+", expectedPx="+expectedPx+")");
            }
            ViewGroup chrome=(ViewGroup)path.getParent();int index=chrome.indexOfChild(path)+2;
            require(index<chrome.getChildCount(),"Content follows public gap");View first=firstContent(chrome.getChildAt(index));require(first!=null,"Visible detail content exists");
            float gap=(top(first)-top(path)-path.getHeight())/density;require(gap>=7.5f&&gap<=12.5f,"Actual navigation gap is 8–12dp: "+route+" ("+gap+")");
            if(inspected.add(route)){gaps.put(new JSONObject().put("route",route).put("gapDp",gap).put("firstContent",String.valueOf(first.getTag())));pages.put(new JSONObject().put("route",route).put("category",category).put("activity",page.getClass().getSimpleName()));}
            for(View view:all(page.getWindow().getDecorView(),CompoundButton.class)){
                Object value=view.getTag();if(!(value instanceof String)||!((String)value).startsWith("config:"))continue;
                String key=((String)value).substring(7);if(!baseline.containsKey(key)||!ConfigSchema.booleanKeys().contains(key))continue;
                require(((CompoundButton)view).isChecked()==ConfigSchema.truthy(baseline.get(key)),"Moved control reads saved value: "+key);visibleControls++;
            }return null;
        });
    }
    private void checkFeatureControls(Activity page,List<NativeFeatureGroups.Feature> features)throws Exception{for(NativeFeatureGroups.Feature feature:features){if(feature.toggleKey!=null)checkBoolean(page,feature.toggleKey);checkFeatureControls(page,Arrays.asList(feature.children));}}
    private void checkBoolean(Activity page,String key)throws Exception{onMain(()->{View v=tag(page,"config:"+key);require(v instanceof CompoundButton,"Moved feature retains real control: "+key);require(((CompoundButton)v).isChecked()==config.getBoolean(key),"Moved feature preserves value: "+key);return null;});}

    private void checkDirectoryCounts(Activity page,String category)throws Exception{
        if(!ModuleNavigation.route(page).equals("target-"+category))return;
        onMain(()->{
            for(ModuleHierarchy.Section section:ModuleHierarchy.sections(category)){
                if(section.restricted&&!HiddenEntrySession.isUnlocked())continue;
                View view=tag(page,"setting-count:"+section.route());
                require(view instanceof TextView,"Directory preserves its enabled-count label: "+section.route());
                int expected=ModuleHierarchy.activeCount(section,key->baseline.getOrDefault(key,ConfigSchema.defaultValue(key)));
                require(view.getVisibility()==(expected==0?View.GONE:View.VISIBLE),"Returning from a child retains count visibility: "+section.route());
                require(("✓ 已设置 "+expected+" 项").contentEquals(((TextView)view).getText()),"Returning from a child retains the saved enabled count: "+section.route());
            }
            return null;
        });
    }

    private void checkLegacyRoutes(Activity home)throws Exception{
        String[][] routes={{"target-systemui","target-notifications"},{"target-statusbar","target-notifications"},{"group/statusbar/statusbar","status_layout"},{"group/statusbar/island","group/notifications/island"},{"target-themes","target-lockscreen"},{"group/themes/theme_download","group/lockscreen/theme_download"},{"group/themes/collab_theme","group/lockscreen/collab_theme"},{"target-files","group/connectivity/usb_mtp"},{"group/files/mtp","group/connectivity/usb_mtp"},{"group/systemui/usb","group/connectivity/usb_debug"},{"group/settings/usb","group/connectivity/usb"},{"target-ai_trigger","ai_trigger"},{"target-game","target-gaming"},{"group/game/shoulder","group/gaming/shoulder"},{"target-screenshot","target-capture"},{"group/screenshot/capture","group/capture/capture"},{"freeform","target-multitasking"},{"target-update","group/system_settings/update"},{"group/theme/collab_fingerprint","group/lockscreen/fingerprint"},{"group/theme/collab_audio","group/audio/collab_audio"},{"group/theme/theme","group/lockscreen/theme_download"}};
        for(String[] pair:routes){
            stage="legacy:"+pair[0];String expected=ModuleHierarchy.resolve(pair[1]);require(expected.equals(ModuleHierarchy.resolve(pair[0])),"Old route has intended new home: "+pair[0]);
            onMain(()->{ModuleNavigation.open(home,pair[0]);return null;});Activity page=await(expected);inspect(page,ModuleHierarchy.categoryForRoute(expected));
            aliases.put(new JSONObject().put("old",pair[0]).put("resolved",expected));clickTag(page,"breadcrumb:home");require(await("home")==home,"Old route returns without a loop: "+pair[0]);unchanged(pair[0]);
        }
        String[][] oldGroups={{"quicksettings","target-notifications"},{"system","target-system_settings"},{"audio","target-audio"},{"connections","target-connectivity"},{"interaction","target-interaction"},{"theme","target-themes"},{"usb","group/connectivity/usb"},{"statusbar","status_layout"},{"lockscreen","target-lockscreen"}};
        for(String[] pair:oldGroups){
            stage="legacy-group-intent:"+pair[0];String expected=ModuleHierarchy.resolve(pair[1]);
            // Recreate the actual old Intent shape, bypassing the modern route dispatcher.
            onMain(()->{home.startActivity(new Intent(home,EnhancementSettingsActivity.class).putExtra("group",pair[0]));return null;});
            Activity page=await(expected);inspect(page,ModuleHierarchy.categoryForRoute(expected));
            require(expected.equals(page.getIntent().getStringExtra(ModuleNavigation.EXTRA_ROUTE)),"Old group Intent is canonicalized before rendering: "+pair[0]);
            aliases.put(new JSONObject().put("oldGroupIntent",pair[0]).put("resolved",expected));
            clickTag(page,"breadcrumb:home");require(await("home")==home,"Old group Intent returns to original Home: "+pair[0]);unchanged("old group Intent "+pair[0]);
        }
        require("capture".equals(ModuleHierarchy.categoryForRoute(ModuleHierarchy.featureRoute(SystemOptions.key("screenshot_hide_status_bar")))),"Screenshot-only status-bar hiding belongs to Capture");
        require("connectivity".equals(ModuleHierarchy.categoryForRoute(ModuleHierarchy.featureRoute(SystemOptions.key("usb_auto_authorize")))),"USB authorization belongs to Connectivity");
        require("connectivity".equals(ModuleHierarchy.categoryForRoute(ModuleHierarchy.featureRoute(SystemOptions.key("mtp_name_enabled")))),"MTP naming belongs to Connectivity");
    }

    private void checkHiddenEntry(Activity home)throws Exception{
        stage="hidden-locked";HiddenEntrySession.lock();
        for(String route:Arrays.asList("group/apps/hidden","hide","hide_apps","automation","tile")){onMain(()->{ModuleNavigation.open(home,route);return null;});settle();require(resumed==home,"Locked hidden route cannot open: "+route);}
        setSearch(home,"消失");
        onMain(()->{for(View row:all(home.getWindow().getDecorView(),View.class)){String id=String.valueOf(row.getTag());if(id.startsWith("search-result:"))require(!ModuleHierarchy.isRestricted(id.substring(14)),"Locked search cannot expose a restricted route");}return null;});
        require(onMain(()->tag(home,"search-result:hide"))==null,"Locked hidden names do not leak through search");setSearch(home,"");
        clickText(home,ModulePresentationCatalog.find("apps").title);Activity apps=await(ModuleHierarchy.resolve("target-apps"));
        require(onMain(()->tag(apps,"navigation:group/apps/hidden"))==null,"Locked Applications directory omits hidden tools");clickTag(apps,"breadcrumb:home");await("home");
        unlockHidden();setSearch(home,"");checkHome(home);
        setSearch(home,"消失");require(onMain(()->tag(home,"search-result:hide"))!=null,"Unlocked hidden search exposes the one Applications-owned route");
        onMain(()->{for(View row:all(home.getWindow().getDecorView(),View.class)){String id=String.valueOf(row.getTag());if(id.startsWith("search-result:")&&ModuleHierarchy.isRestricted(id.substring(14)))require("apps".equals(ModuleHierarchy.categoryForRoute(id.substring(14))),"Restricted hidden search results belong only to Applications");}return null;});setSearch(home,"");
        clickText(home,ModulePresentationCatalog.find("apps").title);Activity unlockedApps=await(ModuleHierarchy.resolve("target-apps"));
        clickTag(unlockedApps,"navigation:group/apps/hidden");Activity hidden=await("hide");inspect(hidden,"apps");capture("page-apps-hidden");
        onMain(()->{
            require(hidden instanceof HideAppsActivity,"Third-level hidden route renders the manager directly");
            require(findText(hidden.getWindow().getDecorView(),"已配置")!=null
                    &&findText(hidden.getWindow().getDecorView(),"已隐藏")!=null
                    &&findText(hidden.getWindow().getDecorView(),"全部应用")!=null,"Third-level page exposes application filters without another navigation step");
            require(findText(hidden.getWindow().getDecorView(),"锁屏自动隐藏")!=null
                    &&findText(hidden.getWindow().getDecorView(),"快捷磁贴")!=null,"Automation and tile controls share the manager page");
            return null;
        });
        require(ModuleHierarchy.path("hide").contains("target-apps"),"Hidden tools have the Applications home");
        clickTag(hidden,"breadcrumb:target-apps");require(await("target-apps")==unlockedApps,"Hidden breadcrumb returns Applications");clickTag(unlockedApps,"breadcrumb:home");await("home");HiddenEntrySession.lock();unchanged("hidden gate");
        for(String route:Arrays.asList("hide","automation","tile")){
            stage="hidden-resume:"+route;unlockHidden();
            onMain(()->{ModuleNavigation.open(home,route);return null;});Activity editor=await(route);
            // A normal in-app page pauses the editor without destabilizing instrumentation.
            onMain(()->{ModuleNavigation.open(editor,"support");return null;});Activity covering=await("support");settle();
            require(!editor.isFinishing()&&!editor.isDestroyed(),"Hidden editor remains in the back stack before expiry: "+route);
            onMain(()->{HiddenEntrySession.lock();covering.finish();return null;});
            require(await("home")==home,"Expired hidden editor returns to Home instead of exposing controls: "+route);settle();
            require(editor.isFinishing()||editor.isDestroyed(),"Expired hidden editor closes on resume: "+route);
            unchanged("hidden resume "+route);

            stage="hidden-direct-intent:"+route;
            int before=onMain(()->activities.size());
            onMain(()->{home.startActivity(new Intent(home,"hide".equals(route)?HideMenuActivity.class:FeatureActivity.class).putExtra(FeatureActivity.EXTRA_MODULE,route));return null;});settle();
            require(await("home")==home,"Locked direct editor Intent returns safely: "+route);
            onMain(()->{
                boolean created=false;
                for(int i=before;i<activities.size();i++){
                    Activity denied=activities.get(i);
                    if((denied instanceof FeatureActivity||denied instanceof HideMenuActivity)&&route.equals(ModuleNavigation.route(denied))){
                        created=true;require(denied.isFinishing()||denied.isDestroyed(),"Locked raw editor closes before rendering: "+route);
                    }
                }
                require(created,"Raw Intent exercised the editor's own locked-entry guard: "+route);return null;
            });
            unchanged("hidden direct intent "+route);
        }
    }

    private static void unlockHidden(){for(int i=0;i<7;i++)HiddenEntrySession.recordSystemVersionTap(SystemClock.uptimeMillis());}
    private void setSearch(Activity home,String query)throws Exception{onMain(()->{EditText search=find(home.getWindow().getDecorView(),EditText.class);require(search!=null,"Home search exists");search.setText(query);return null;});settle();}
    private void back(Activity page,String expected)throws Exception{onMain(()->{page.onBackPressed();return null;});await(expected);settle();}
    private void unchanged(String action){require(baseline.equals(config.snapshot()),action+" changed configuration: "+changedKeys(baseline,config.snapshot()));require(rawBaseline.equals(preferences.getAll()),action+" changed preferences: "+changedKeys(rawBaseline,preferences.getAll()));}
    private JSONObject report()throws Exception{return new JSONObject().put("version",BuildConfig.VERSION_NAME).put("checks",checks).put("visitedPages",inspected.size()).put("checkedControls",visibleControls).put("density",density).put("fontScale",fontScale).put("orientation",orientation).put("nightMode",nightMode).put("lastStage",stage).put("pages",pages).put("searches",searches).put("aliases",aliases).put("contentGaps",gaps).put("screenshots",screens).put("limits","Read-only navigation at the existing display settings; no hardware actions, installation/debug authorization, feature effects, physical gestures, alternate font sizes or orientations tested.");}
    private void writeProgress()throws Exception{Files.write(new File(directory,"progress.json").toPath(),report().toString(2).getBytes(StandardCharsets.UTF_8));}
    private static List<String> changedKeys(Map<String,?> before,Map<String,?> after){Set<String> keys=new TreeSet<>(before.keySet());keys.addAll(after.keySet());List<String> changed=new ArrayList<>();for(String key:keys)if(before.containsKey(key)!=after.containsKey(key)||!Objects.equals(before.get(key),after.get(key)))changed.add(key);return changed;}
    private static View firstContent(View view){if(!view.isShown()||view.getHeight()==0)return null;if(view instanceof LiquidGlassLayout||view instanceof TextView||!(view instanceof ViewGroup))return view;ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View first=firstContent(group.getChildAt(i));if(first!=null)return first;}return null;}
    private static float top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private Activity await(String route){long deadline=SystemClock.uptimeMillis()+12000;while(SystemClock.uptimeMillis()<deadline){Activity page=resumed;if(page!=null&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(50);}throw new AssertionError("Timed out waiting for "+route+"; actual="+(resumed==null?"none":ModuleNavigation.route(resumed)));}
    private void clickTag(Activity page,String id)throws Exception{onMain(()->{View v=tag(page,id);require(v!=null&&v.performClick(),"Click navigation "+id);return null;});}
    private void clickText(Activity page,String text)throws Exception{onMain(()->{View v=findText(page.getWindow().getDecorView(),text);while(v!=null&&!v.isClickable())v=v.getParent() instanceof View?(View)v.getParent():null;require(v!=null&&v.performClick(),"Click category "+text);return null;});}
    private static View tag(Activity page,String id){return page.getWindow().getDecorView().findViewWithTag(id);}
    private static View findText(View view,String text){if(view==null)return null;for(View child:all(view,TextView.class))if(text.contentEquals(((TextView)child).getText()))return child;return null;}
    private static <T extends View>T find(View view,Class<T> type){List<View> views=all(view,type);return views.isEmpty()?null:type.cast(views.get(0));}
    private static List<View> all(View view,Class<? extends View> type){List<View> result=new ArrayList<>();if(type.isInstance(view))result.add(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)result.addAll(all(((ViewGroup)view).getChildAt(i),type));return result;}
    private void capture(String name)throws Exception{settle();Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot is available");File file=new File(directory,name+".png");try(FileOutputStream output=new FileOutputStream(file)){bitmap.compress(Bitmap.CompressFormat.PNG,100,output);}finally{bitmap.recycle();}screens.put(file.getAbsolutePath());}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(170);}
    private void require(boolean pass,String message){checks++;if(!pass)throw new AssertionError(message);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T onMain(Main<T> action)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable error){failure.set(error);}});if(failure.get()!=null)throw new AssertionError("UI operation failed",failure.get());return value.get();}
    @Override public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);if(activity instanceof SettingsActivity)try{for(String name:Arrays.asList("environmentLoading","requestedRoot")){Field field=SettingsActivity.class.getDeclaredField(name);field.setAccessible(true);field.setBoolean(activity,true);}}catch(Exception error){throw new AssertionError(error);}}
    @Override public void onActivityResumed(Activity activity){resumed=activity;}
    @Override public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    @Override public void onActivityStarted(Activity activity){}
    @Override public void onActivityStopped(Activity activity){}
    @Override public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
