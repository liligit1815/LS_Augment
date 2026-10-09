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
    private final JSONArray pages=new JSONArray(),screenshots=new JSONArray();
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
                if("status_battery".equals(route))threeInOne(page);
                if("status_notifications".equals(route))main(()->{require(text(page,"通知图标数量解限")!=null,"Notification limit override remains reachable");return null;});
                if("status_network".equals(route))main(()->{require(text(page,"双排信号图标")!=null&&text(page,"隐藏移动网络收发箭头")!=null,"Signal and activity controls remain together");require(tag(page,"navigation:asset/mobile1.signal")==null,"Signal materials have one owner in resources");return null;});
                if("status_arrangement".equals(route))main(()->{SeekBar gap=description(page.getWindow().getDecorView(),"两排间距",SeekBar.class);if(gap!=null)require(gap.getMax()==72,"Row-gap UI exposes the full -8 through 64dp schema range");require(text(page,"高级兼容：旧版表格")==null&&tag(page,"navigation:status_canvas")==null,"Arrangement has no worksheet mode or entry");return null;});
                if("status_assets".equals(route))resourceScopes(page);
                else main(()->{require(tag(page,"navigation:status_assets")==null,"Feature pages do not repeat the resource entrance");require(description(page.getWindow().getDecorView(),"显示区域",Spinner.class)==null,"Placement is edited only in arrangement");return null;});
                if("status_metrics".equals(route))disabledComponent(page);
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
            return new JSONObject().put("success",true).put("checks",checks).put("settingsUnchanged",true).put("rawSettingsUnchanged",true).put("pages",pages).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        }finally{
            main(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isFinishing())activity.finish();return null;});
            app.unregisterActivityLifecycleCallbacks(this);
            require(before.equals(config.snapshot()),"Test cleanup leaves the original configuration intact");
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
    private void disabledComponent(Activity page)throws Exception{
        StatusBarEditorController editor=main(()->(StatusBarEditorController)((Map<?,?>)get(page,"editors")).get("status_metrics"));
        ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");String old=draft.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);
        StatusBarGridSpec original=(StatusBarGridSpec)get(editor,"grid");
        try{main(()->{draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");Field grid=editor.getClass().getDeclaredField("grid");grid.setAccessible(true);StatusBarGridSpec.Item cpu=original.get("cpu");grid.set(editor,original.with("cpu",new StatusBarGridSpec.Item(cpu.zone,cpu.order,cpu.size,false)));invoke(editor,"render");
            UiKit.Fold fold=(UiKit.Fold)((Map<?,?>)get(editor,"componentFolds")).get("cpu");require(fold!=null,"CPU feature owns its configuration fold");fold.show(true);require(fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled component cannot expand configuration");require(!draft.hasPending(),"Inspecting disabled controls does not save settings");return null;});}
        finally{main(()->{draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,old);Field grid=editor.getClass().getDeclaredField("grid");grid.setAccessible(true);grid.set(editor,original);invoke(editor,"render");return null;});}
    }
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
    private void capture(Activity activity,String name)throws Exception{settle(activity);Bitmap image=main(()->{View root=activity.getWindow().getDecorView();Bitmap result=Bitmap.createBitmap(root.getWidth(),root.getHeight(),Bitmap.Config.ARGB_8888);root.draw(new Canvas(result));return result;});File output=new File(directory,name+".png");try(FileOutputStream out=new FileOutputStream(output)){image.compress(Bitmap.CompressFormat.PNG,100,out);}finally{image.recycle();}screenshots.put(output.getAbsolutePath());}
    private Activity await(String route){long until=SystemClock.uptimeMillis()+10000;while(SystemClock.uptimeMillis()<until){Activity page=resumed;if(page!=null&&!page.isFinishing()&&route.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(30);}throw new AssertionError("Page did not resume: "+route);}
    private static View tag(Activity page,String tag){return page.getWindow().getDecorView().findViewWithTag(tag);}
    private static int tagCount(View view,String tag){int count=tag.equals(view.getTag())?1:0;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=tagCount(((ViewGroup)view).getChildAt(i),tag);return count;}
    private static float top(View view){int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private static View firstContent(View view){if(view instanceof LiquidGlassLayout||view instanceof TextView||!(view instanceof ViewGroup))return view;ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View child=group.getChildAt(i);if(child.getVisibility()==View.VISIBLE&&child.getHeight()>0)return firstContent(child);}return view;}
    private static TextView text(Activity page,String label){return text(page.getWindow().getDecorView(),label);}
    private static TextView text(View view,String label){if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return (TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView result=text(((ViewGroup)view).getChildAt(i),label);if(result!=null)return result;}return null;}
    private static <T extends View>T find(View view,Class<T> type){if(type.isInstance(view))return type.cast(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T found=find(((ViewGroup)view).getChildAt(i),type);if(found!=null)return found;}return null;}
    private static <T extends View>T description(View view,String label,Class<T> type){if(type.isInstance(view)&&label.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return type.cast(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T result=description(((ViewGroup)view).getChildAt(i),label,type);if(result!=null)return result;}return null;}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
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
