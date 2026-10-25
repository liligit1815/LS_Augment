package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Read-only production navigation. Expanded controls and inheritance are exercised in memory only. */
final class StatusBarCustomizationUiCases implements Application.ActivityLifecycleCallbacks {
    private final Instrumentation test;
    private final Context context;
    private final List<Activity> activities=new ArrayList<>();
    private volatile Activity resumed;
    private int checks;
    private File directory;
    private final JSONArray pages=new JSONArray(),screenshots=new JSONArray(),spacingLayouts=new JSONArray(),spacingViolations=new JSONArray();
    private StatusBarCustomizationUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new StatusBarCustomizationUiCases(test).execute();}
    private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,?> rawBefore=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        directory=new File(context.getExternalFilesDir(null),"statusbar-customization-ui");require(directory.isDirectory()||directory.mkdirs(),"Screenshot directory exists");
        try{
            Activity home=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_layout").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle(home);measure(home);capture(home,"01-statusbar-home");
            main(()->{
                for(String route:StatusBarPages.ROUTES)require(tagCount(home.getWindow().getDecorView(),"navigation:"+route)==1,"Exactly one home entry for "+route);
                for(String title:StatusBarPages.GROUP_TITLES)require(tag(home,"section-title:"+title)!=null,"Shared section title exists: "+title);
                require(tag(home,"navigation:status_surfaces")==null,"Surface selection has one owner inside resources");
                Switch master=(Switch)tag(home,"config:"+ConfigSchema.SYSTEMUI_MASTER);require(master!=null,"Real custom-layout switch remains reachable");
                require(tag(home,"navigation:status_assets").isShown(),"Independent resources remain available regardless of layout switch");
                require(text(home,"区域布局（原有）")==null&&text(home,"表格布局（逐格编辑）")==null,"Home does not expose competing layout modes");return null;
            });
            int index=2;
            for(String route:StatusBarPages.ROUTES){
                main(()->{require(tag(home,"navigation:"+route).performClick(),"Open "+route);return null;});
                Activity page=await(route);settle(page);measure(page);capture(page,String.format(Locale.ROOT,"%02d-%s",index++,route));
                if(Arrays.asList("status_clock","status_notifications","status_metrics","status_battery","status_icons").contains(route))pageSpacing(page);
                if("status_battery".equals(route))threeInOne(page);
                if("status_notifications".equals(route))main(()->{require(text(page,"通知图标数量解限")!=null,"Notification limit override remains reachable");return null;});
                if("status_network".equals(route))main(()->{require(text(page,"双排信号图标")!=null&&text(page,"隐藏移动网络收发箭头")!=null,"Signal and activity controls remain together");require(tag(page,"navigation:asset/mobile1.signal")==null,"Signal materials have one owner in resources");return null;});
                if("status_arrangement".equals(route))main(()->{SeekBar gap=description(page.getWindow().getDecorView(),"两排间距",SeekBar.class);if(gap!=null)require(gap.getMax()==72,"Row-gap UI exposes the full -8 through 64dp schema range");require(text(page,"高级兼容：旧版表格")==null&&tag(page,"navigation:status_canvas")==null,"Arrangement has no worksheet mode or entry");return null;});
                if("status_assets".equals(route))resourceScopes(page);
                else main(()->{require(tag(page,"navigation:status_assets")==null,"Feature pages do not repeat the resource entrance");require(description(page.getWindow().getDecorView(),"显示区域",Spinner.class)==null,"Placement is edited only in arrangement");return null;});
                if("status_clock".equals(route))main(()->{require(text(page,"启用时钟毫秒刷新")!=null,"Millisecond refresh remains reachable");return null;});
                main(()->{page.onBackPressed();return null;});require(await("status_layout")==home,"Normal back returns to existing home");
                require(before.equals(config.snapshot()),"Browsing "+route+" preserves every setting");
            }
            main(()->{home.startActivity(new Intent(home,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_surfaces"));return null;});Activity surfaces=await("status_surfaces");settle(surfaces);measure(surfaces);
            for(String surface:StatusBarSurfaceSpec.SURFACES){
                String route="status_surface/"+surface;main(()->{require(tag(surfaces,"navigation:"+route).performClick(),"Open surface "+surface);return null;});
                Activity page=await(route);settle(page);measure(page);capture(page,"surface-"+surface);
                main(()->{require(tag(page,"navigation:asset/wifi")!=null,"Surface contains icon display and style entry");tag(page,"navigation:asset/wifi").performClick();return null;});
                Activity assets=await("asset/wifi");settle(assets);main(()->{require(surface.equals(get(assets,"scope")),"Object editor receives exact surface");return null;});
                main(()->{assets.onBackPressed();return null;});require(await(route)==page,"Direct object back returns to selected surface");
                main(()->{page.onBackPressed();return null;});require(await("status_surfaces")==surfaces,"Surface back returns to position list");
            }
            main(()->{surfaces.onBackPressed();return null;});await("status_layout");
            Activity scoped=test.startActivitySync(new Intent(context,StatusBarAssetsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"asset/wifi.signal").putExtra("status_surface","control").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle(scoped);scopeInheritance(scoped);measure(scoped);capture(scoped,"scope-inheritance");main(()->{scoped.onBackPressed();return null;});await("status_layout");
            main(()->{home.startActivity(new Intent(home,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_canvas"));return null;});Activity legacy=await("status_arrangement");settle(legacy);measure(legacy);capture(legacy,"legacy-link-redirected");
            main(()->{require("status_arrangement".equals(ModuleNavigation.route(legacy)),"Direct legacy intent resolves to component arrangement");require(text(legacy,"左侧组件")!=null&&text(legacy,"高级兼容：旧版表格")==null,"Old link cannot reopen worksheet configuration");legacy.onBackPressed();return null;});await("status_layout");
            require(before.equals(config.snapshot()),"All legacy layouts, assets, fonts and feature values stay unchanged");
            require(rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Browsing does not rewrite raw configuration storage");
            JSONObject report=new JSONObject().put("success",spacingViolations.length()==0).put("checks",checks).put("settingsUnchanged",true).put("rawSettingsUnchanged",true).put("pages",pages).put("spacingLayouts",spacingLayouts).put("spacingViolations",spacingViolations).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
            Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
            require(spacingViolations.length()==0,"Status-bar page spacing follows the shared UI; inspect statusbar-customization-ui/report.json");
            return report;
        }finally{
            main(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isFinishing())activity.finish();return null;});
            app.unregisterActivityLifecycleCallbacks(this);
            require(before.equals(config.snapshot()),"Test cleanup leaves the original configuration intact");
            require(rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Cleanup leaves raw configuration unchanged");
        }
    }
    private void resourceScopes(Activity page)throws Exception{
        for(String surface:StatusBarSurfaceSpec.SURFACES){
            main(()->{Spinner selector=description(page.getWindow().getDecorView(),"配置作用位置",Spinner.class);require(selector!=null,"Resources own surface selection");selector.setSelection(Arrays.asList(StatusBarSurfaceSpec.SCOPES).indexOf(surface));return null;});settle(page);
            main(()->{require(surface.equals(get(page,"scope")),"Selected surface survives rebuild: "+surface);require(tag(page,"navigation:asset/wifi").performClick(),"Wi-Fi is reachable in resources");return null;});settle(page);
            main(()->{require(surface.equals(get(page,"scope")),"Object inherits selected surface");require(text(page,"现有显示设置")==null,"Object does not duplicate original system controls");require(text(page,"在"+StatusBarSurfaceSpec.label(surface)+"额外隐藏")!=null,"Scoped visibility remains editable");return null;});
            measure(page);capture(page,"resource-surface-"+surface);main(()->{page.onBackPressed();return null;});settle(page);
            require("status_assets".equals(ModuleNavigation.route(page)),"Object returns to its single resource owner");
        }
    }
    private void pageSpacing(Activity page)throws Exception{
        String route=ModuleNavigation.route(page);
        StatusBarEditorController editor=main(()->(StatusBarEditorController)((Map<?,?>)get(page,"editors")).get(route));
        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");Map<String,String> saved=new LinkedHashMap<>();
        for(Map.Entry<String,String> entry:draft.entrySet())saved.put(entry.getKey(),entry.getValue());
        StatusBarGridSpec grid=(StatusBarGridSpec)get(editor,"grid");
        String[] ids="status_clock".equals(route)?new String[]{"clock"}:"status_notifications".equals(route)?new String[]{"notifications"}:"status_metrics".equals(route)?new String[]{"cpu","gpu","battery_temp","current","power"}:"status_icons".equals(route)?new String[]{"system_icons"}:new String[]{"battery"};
        Map<String,Boolean> expanded=new LinkedHashMap<>((Map<String,Boolean>)get(editor,"expandedComponents"));
        Map<String,Boolean> advanced=new LinkedHashMap<>((Map<String,Boolean>)get(editor,"advancedExpanded"));
        boolean connectivityExpanded=(Boolean)get(editor,"connectivityExpanded"),nativeExpanded=(Boolean)get(editor,"nativeBatteryExpanded");
        try{
            for(String mode:"status_battery".equals(route)?new String[]{"three-in-one","native"}:new String[]{"component"}){
                main(()->{seedSpacing(editor,grid,ids,true,mode);showEditorFolds(editor,false);return null;});settle(page);
                measureSpacing(page,editor,route+"-"+mode+"-collapsed");capture(page,route+"-"+mode+"-collapsed");
                main(()->{showEditorFolds(editor,true);openAdvanced(editor);return null;});settle(page);
                measureSpacing(page,editor,route+"-"+mode+"-expanded");capture(page,route+"-"+mode+"-expanded-top");
                main(()->{ScrollView scroll=(ScrollView)get(editor,"configScroll");scroll.scrollTo(0,scroll.getChildAt(0).getHeight());return null;});settle(page);
                capture(page,route+"-"+mode+"-expanded-bottom");
                main(()->{showEditorFolds(editor,false);require(!draft.hasPending(),"Collapsing enabled components preserves their settings");seedSpacing(editor,grid,ids,false,mode);showEditorFolds(editor,true);
                    if("status_battery".equals(route)){for(String field:new String[]{"connectivityFold","nativeBatteryFold"}){UiKit.Fold fold=(UiKit.Fold)get(editor,field);require(!fold.control.isChecked()&&fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled battery mode cannot expand: "+field);}}
                    else for(String id:ids){UiKit.Fold fold=(UiKit.Fold)((Map<?,?>)get(editor,"componentFolds")).get(id);require(fold!=null&&!fold.control.isChecked()&&fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled component cannot expand: "+id);}
                    require(!draft.hasPending(),"Disabled fixtures never queue a save");return null;});settle(page);
                measureSpacing(page,editor,route+"-"+mode+"-disabled");capture(page,route+"-"+mode+"-disabled");
            }
        }finally{main(()->{for(Map.Entry<String,String> entry:saved.entrySet())draft.seed(entry.getKey(),entry.getValue());set(editor,"grid",grid);
            require(!draft.hasPending(),"All UI fixtures retain an unedited draft");invoke(editor,"render");
            Map<String,Boolean> expandedState=(Map<String,Boolean>)get(editor,"expandedComponents");expandedState.clear();expandedState.putAll(expanded);
            Map<String,Boolean> advancedState=(Map<String,Boolean>)get(editor,"advancedExpanded");advancedState.clear();advancedState.putAll(advanced);
            set(editor,"connectivityExpanded",connectivityExpanded);set(editor,"nativeBatteryExpanded",nativeExpanded);
            // Restore visual expansion after render, without invoking any configuration listener.
            for(Map.Entry<?,?> entry:((Map<?,?>)get(editor,"componentFolds")).entrySet())((UiKit.Fold)entry.getValue()).show(Boolean.TRUE.equals(expanded.get(entry.getKey())));
            for(String field:new String[]{"connectivityFold","nativeBatteryFold"}){UiKit.Fold fold=(UiKit.Fold)get(editor,field);if(fold!=null)fold.show("connectivityFold".equals(field)?connectivityExpanded:nativeExpanded);}
            for(Map.Entry<?,?> entry:((Map<?,?>)get(editor,"advancedViews")).entrySet()){View view=(View)entry.getValue();if((view.getVisibility()==View.VISIBLE)!=Boolean.TRUE.equals(advanced.get(entry.getKey()))){ViewGroup header=(ViewGroup)((ViewGroup)view.getParent()).getChildAt(0);header.getChildAt(header.getChildCount()-1).performClick();}}
            return null;});}
    }
    private void seedSpacing(StatusBarEditorController editor,StatusBarGridSpec original,String[] ids,boolean enabled,String mode)throws Exception{
        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");
        draft.seed(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE,enabled?"0":"1");draft.seed(ConfigSchema.STATUSBAR_CLOCK_CUSTOM,"1");draft.seed(ConfigSchema.STATUSBAR_CLOCK_ROWS,"2");
        if("status_icons".equals(editor.route))draft.seed(StatusBarIconOrderPolicy.ENABLED,enabled?"1":"0");
        if("status_battery".equals(editor.route)){draft.seed(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,enabled&&"three-in-one".equals(mode)?"1":"0");draft.seed(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,enabled&&"native".equals(mode)?"1":"0");}
        StatusBarGridSpec fixture=original;for(String id:ids){StatusBarGridSpec.Item item=fixture.get(id);fixture=fixture.with(id,new StatusBarGridSpec.Item(item.zone,item.order,item.size,enabled));}
        set(editor,"grid",fixture);invoke(editor,"render");require(!draft.hasPending(),"State fixtures are seeded without a save");
    }
    private void showEditorFolds(StatusBarEditorController editor,boolean expanded)throws Exception{
        for(Object value:((Map<?,?>)get(editor,"componentFolds")).values())((UiKit.Fold)value).show(expanded);
        for(String field:new String[]{"connectivityFold","nativeBatteryFold"}){UiKit.Fold fold=(UiKit.Fold)get(editor,field);if(fold!=null)fold.show(expanded);}
        if("status_icons".equals(editor.route)){
            java.util.function.Consumer<Boolean> show=(java.util.function.Consumer<Boolean>)((Map<?,?>)get(get(editor,"ui"),"foldSetters")).get("switch:feature-control:"+StatusBarIconOrderPolicy.ENABLED);
            require(show!=null,"System hint priority has its shared fold");show.accept(expanded);
        }
    }
    private void openAdvanced(StatusBarEditorController editor)throws Exception{
        for(Object value:((Map<?,?>)get(editor,"advancedViews")).values()){
            View content=(View)value;if(content.getVisibility()==View.VISIBLE)continue;
            ViewGroup group=(ViewGroup)content.getParent();ViewGroup header=(ViewGroup)group.getChildAt(0);
            require(header.getChildAt(header.getChildCount()-1).performClick(),"Advanced parameters expand in memory");
        }
    }
    private void measureSpacing(Activity page,StatusBarEditorController editor,String state)throws Exception{main(()->{
        float density=page.getResources().getDisplayMetrics().density;View path=tag(page,"page-path"),preview=(View)get(editor,"previewHost");
        float navigationGap=(top(preview)-bottom(path))/density;
        spacing(navigationGap>=7.5f&&navigationGap<=12.5f,state,"Navigation to preview is 8–12dp",new JSONObject().put("gapDp",navigationGap));
        ViewGroup content=(ViewGroup)get(editor,"content");JSONArray features=new JSONArray(),parameters=new JSONArray(),adjacentFeatures=new JSONArray();
        for(View view:all(content))if(view instanceof TextView){String value=((TextView)view).getText().toString();
            spacing(!value.matches("^(组件)?(已开启|未开启) · .*"),state,"Component state, placement and size summaries are removed",new JSONObject().put("text",value));
            if("status_icons".equals(editor.route))spacing(!value.startsWith("设置系统图标的大小、单双排和显示规则")&&!value.startsWith("当前保留原生样式，仅调整系统图标组的大小"),state,"System-icon introductory small text is removed",new JSONObject().put("text",value));
        }
        for(View view:all(content))if(view.isShown()&&view.getHeight()>0){
            if("feature-row".equals(view.getTag())){ViewGroup row=(ViewGroup)view;Switch control=find(row,Switch.class);View slot=row.getChildAt(row.getChildCount()-1);
                spacing(row.getHeight()/density>=43.5f,state,"Feature header retains a 44dp touch target",bounds(row,density));
                spacing(control!=null&&Math.abs(control.getWidth()/density-46)<=.5f&&Math.abs(slot.getWidth()/density-25)<=.5f,state,"Feature switches and arrow slots use shared widths",bounds(row,density));
                features.put(new JSONObject().put("title",control==null?"":control.getContentDescription()).put("bounds",bounds(row,density)).put("switchRightDp",control==null?0:right(control)/density).put("slotRightDp",right(slot)/density));
            }
            if(view instanceof EditText||view instanceof Spinner||view instanceof SeekBar){
                ViewGroup group=parameterGroup(view);spacing(group!=null,state,"Editor parameter uses the shared compact input group",bounds(view,density));
                spacing((view instanceof ParameterSeekBar?((ParameterSeekBar)view).expandedTouchBounds().height():view.getHeight())/density>=47.5f,state,"Parameter control retains a 48dp region (sliders extend into empty space)",bounds(view,density));
                if(group!=null){View header=group.getChildAt(0);JSONObject parameter=new JSONObject().put("description",view.getContentDescription()).put("control",bounds(view,density)).put("header",bounds(header,density)).put("group",bounds(group,density));
                    ViewGroup parent=(ViewGroup)group.getParent();int index=parent.indexOfChild(group);View next=null;
                    for(int i=index+1;i<parent.getChildCount();i++)if(parent.getChildAt(i).getVisibility()==View.VISIBLE){next=parent.getChildAt(i);break;}
                    if(next instanceof ViewGroup&&inputGroup((ViewGroup)next)){float gap=(top(((ViewGroup)next).getChildAt(0))-bottom(view))/density;parameter.put("nextParameterGapDp",gap);float expected=view instanceof SeekBar?4:8;spacing(Math.abs(gap-expected)<=.5f,state,"Adjacent parameters use 4dp for sliders and 8dp for other inputs",parameter);}
                    parameters.put(parameter);
                }
            }
        }
        View previous=null;boolean onlyDividers=true;
        for(int i=0;i<content.getChildCount();i++){View child=content.getChildAt(i);if(child.getVisibility()!=View.VISIBLE)continue;View header=leadingFeature(child);
            if(header!=null){if(state.endsWith("-collapsed")||state.endsWith("-disabled")){ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)child.getLayoutParams();spacing(child.getPaddingTop()==0&&child.getPaddingBottom()==0&&margins.topMargin==0&&margins.bottomMargin==0,state,"Top-level feature block has no extra vertical padding or margin",new JSONObject().put("bounds",bounds(child,density)).put("paddingTopDp",child.getPaddingTop()/density).put("paddingBottomDp",child.getPaddingBottom()/density).put("marginTopDp",margins.topMargin/density).put("marginBottomDp",margins.bottomMargin/density));}
                if(previous!=null&&onlyDividers&&Math.abs(previous.getHeight()-leadingFeature(previous).getHeight())<=1){float gap=(top(header)-bottom(leadingFeature(previous)))/density;JSONObject adjacent=new JSONObject().put("gapDp",gap).put("previous",bounds(leadingFeature(previous),density)).put("next",bounds(header,density));adjacentFeatures.put(adjacent);spacing(gap>=-.5f&&gap<=1.5f,state,"Adjacent collapsed feature headers use only the divider spacing",adjacent);}
                previous=child;onlyDividers=true;
            }else if(child.getHeight()/density<=1.5f&&!(child instanceof ViewGroup)){spacing(Math.abs(child.getHeight()/density-1)<=.5f,state,"Feature divider is 1dp",bounds(child,density));}
            else onlyDividers=false;
        }
        spacingLayouts.put(new JSONObject().put("state",state).put("route",editor.route).put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale).put("orientation",page.getResources().getConfiguration().orientation).put("navigationGapDp",navigationGap).put("featureHeaders",features).put("parameterRows",parameters).put("adjacentFeatures",adjacentFeatures));
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Layout measurement queues no writes");return null;
    });}
    private void spacing(boolean condition,String state,String rule,JSONObject details)throws Exception{checks++;if(!condition)spacingViolations.put(new JSONObject().put("state",state).put("rule",rule).put("observed",details));}
    private static boolean inputGroup(ViewGroup group){float density=group.getResources().getDisplayMetrics().density;return Boolean.TRUE.equals(group.getTag(R.id.parameter_input_group))&&Math.abs(group.getPaddingTop()/density)<=.5f&&(Math.abs(group.getPaddingBottom()/density-8)<=.5f||Math.abs(group.getPaddingBottom()/density-4)<=.5f);}
    private static ViewGroup parameterGroup(View control){View parent=control.getParent() instanceof View?(View)control.getParent():null;while(parent instanceof ViewGroup){if(inputGroup((ViewGroup)parent))return (ViewGroup)parent;parent=parent.getParent() instanceof View?(View)parent.getParent():null;}return null;}
    private static View leadingFeature(View view){if("feature-row".equals(view.getTag()))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View child=((ViewGroup)view).getChildAt(i);if(child.getVisibility()==View.VISIBLE&&child.getHeight()>0)return leadingFeature(child);}return null;}
    private static List<View> all(View root){List<View> result=new ArrayList<>();result.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)result.addAll(all(((ViewGroup)root).getChildAt(i)));return result;}
    private static JSONObject bounds(View view,float density)throws Exception{return new JSONObject().put("leftDp",left(view)/density).put("topDp",top(view)/density).put("rightDp",right(view)/density).put("bottomDp",bottom(view)/density).put("widthDp",view.getWidth()/density).put("heightDp",view.getHeight()/density);}
    private void threeInOne(Activity page)throws Exception{
        StatusBarEditorController editor=main(()->(StatusBarEditorController)((Map<?,?>)get(page,"editors")).get("status_battery"));
        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");Map<String,String> saved=new LinkedHashMap<>();
        for(String key:new String[]{ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY})saved.put(key,draft.get(key));
        try{
            main(()->{draft.seed(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"1");draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");invoke(editor,"render");
                UiKit.Fold fold=(UiKit.Fold)get(editor,"connectivityFold");fold.show(true);
                require(text(page,"高级设置：三合一图标")!=null,"Three-in-one retains its internal editor");
                require(text(page,"内部上方左右移动（直径 %）")!=null&&text(page,"内部下方大小（%）")!=null,"All three internal regions retain transform controls");
                require(text(page,"充电标志颜色（#AARRGGBB）")!=null,"Charge and bypass style controls remain available");
                require(!draft.hasPending(),"In-memory expansion never queues a real change");return null;});
            settle(page);capture(page,"three-in-one-preserved");
        }finally{main(()->{for(Map.Entry<String,String> entry:saved.entrySet())draft.seed(entry.getKey(),entry.getValue());invoke(editor,"render");return null;});}
    }
    private void scopeInheritance(Activity page)throws Exception{
        Map<String,String> baseline=(Map<String,String>)get(page,"visibilityBaseline");String original=baseline.get(StatusBarVisibilitySpec.KEY);
        try{
            main(()->{baseline.put(StatusBarVisibilitySpec.KEY,StatusBarVisibilitySpec.empty().with("all","wifi",true).serialize());invoke(page,"showPage");
                require("control".equals(get(page,"scope")),"Control-center scope retained");
                TextView inherited=text(page,"当前继承了共享方案或所属图标的隐藏规则。");require(inherited!=null,"Inherited hiding is explained separately");
                View label=text(page,"在控制中心额外隐藏");require(label!=null,"Surface-specific hide setting exists");
                View row=label;while(row!=null&&!"feature-row".equals(row.getTag()))row=row.getParent() instanceof View?(View)row.getParent():null;
                Switch control=find(row,Switch.class);require(control!=null&&!control.isChecked(),"Inherited rule does not pretend to be an explicit surface toggle");
                require(!(Boolean)invoke(page,"dirty"),"In-memory inheritance check does not create a draft");return null;});
            settle(page);capture(page,"scope-inheritance-active");
        }finally{main(()->{baseline.put(StatusBarVisibilitySpec.KEY,original);invoke(page,"showPage");return null;});}
    }
    private void measure(Activity activity)throws Exception{main(()->{View path=tag(activity,"page-path");require(path!=null,"Common breadcrumb exists");ViewGroup chrome=(ViewGroup)path.getParent();View first=firstContent(chrome.getChildAt(chrome.indexOfChild(path)+2));float gap=(top(first)-top(path)-path.getHeight())/activity.getResources().getDisplayMetrics().density;require(gap>=7.5f&&gap<=12.5f,"First-content gap is 8–12dp: "+ModuleNavigation.route(activity)+" = "+gap);pages.put(new JSONObject().put("route",ModuleNavigation.route(activity)).put("contentGapDp",gap).put("density",activity.getResources().getDisplayMetrics().density).put("fontScale",activity.getResources().getConfiguration().fontScale));return null;});}
    private void settle(Activity activity)throws Exception{test.waitForIdleSync();CountDownLatch frames=new CountDownLatch(1);main(()->{activity.getWindow().getDecorView().postOnAnimation(()->activity.getWindow().getDecorView().postOnAnimation(frames::countDown));return null;});require(frames.await(3,TimeUnit.SECONDS),"Page laid out");test.waitForIdleSync();}
    private void capture(Activity activity,String name)throws Exception{
        settle(activity);long until=SystemClock.uptimeMillis()+5000;boolean focused=false;
        while(SystemClock.uptimeMillis()<until){focused=main(()->resumed==activity&&!activity.isFinishing()&&!activity.isDestroyed()&&activity.getWindow().getDecorView().hasWindowFocus());if(focused)break;SystemClock.sleep(30);}
        require(focused,"Screenshot activity owns the focused window: "+name);
        // Activity layout can finish while the compositor still shows the previous navigation frame.
        SystemClock.sleep(450);settle(activity);
        require(main(()->resumed==activity&&activity.getWindow().getDecorView().hasWindowFocus()),"Screenshot window remains focused after navigation settles: "+name);
        Bitmap image=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(image!=null,"Physical device screenshot is available");File output=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(output)){require(image.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot is saved");}finally{image.recycle();}screenshots.put(output.getAbsolutePath());
    }
    private Activity await(String route){long until=SystemClock.uptimeMillis()+10000;while(SystemClock.uptimeMillis()<until){Activity page=resumed;if(page!=null&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(30);}throw new AssertionError("Page did not resume: "+route);}
    private static View tag(Activity page,String tag){return page.getWindow().getDecorView().findViewWithTag(tag);}
    private static int tagCount(View view,String tag){int count=tag.equals(view.getTag())?1:0;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=tagCount(((ViewGroup)view).getChildAt(i),tag);return count;}
    private static float left(View view){if(view.getParent() instanceof View){View parent=(View)view.getParent();return left(parent)+view.getLeft()-parent.getScrollX();}int[] xy=new int[2];view.getLocationInWindow(xy);return xy[0];}
    private static float top(View view){if(view.getParent() instanceof View){View parent=(View)view.getParent();return top(parent)+view.getTop()-parent.getScrollY();}int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private static float right(View view){return left(view)+view.getWidth();}
    private static float bottom(View view){return top(view)+view.getHeight();}
    private static View firstContent(View view){if(view instanceof LiquidGlassLayout||view instanceof TextView||!(view instanceof ViewGroup))return view;ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child.getVisibility()==View.VISIBLE&&child.getHeight()>0)return firstContent(child);}return view;}
    private static TextView text(Activity page,String label){return text(page.getWindow().getDecorView(),label);}
    private static TextView text(View view,String label){if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return (TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView result=text(((ViewGroup)view).getChildAt(i),label);if(result!=null)return result;}return null;}
    private static <T extends View>T find(View view,Class<T> type){if(type.isInstance(view))return type.cast(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T found=find(((ViewGroup)view).getChildAt(i),type);if(found!=null)return found;}return null;}
    private static <T extends View>T description(View view,String label,Class<T> type){if(type.isInstance(view)&&label.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return type.cast(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T result=description(((ViewGroup)view).getChildAt(i),label,type);if(result!=null)return result;}return null;}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static void set(Object object,String name,Object value)throws Exception{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);field.set(object,value);}
    private static Object invoke(Object object,String name)throws Exception{Method method=object.getClass().getDeclaredMethod(name);method.setAccessible(true);return method.invoke(object);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);}
    public void onActivityResumed(Activity activity){resumed=activity;}
    public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityStarted(Activity activity){}public void onActivityStopped(Activity activity){}public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
