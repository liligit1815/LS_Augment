package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import org.json.*;

/** Production layouts measured on device. Disabled folds are revealed visually, never enabled/saved. */
final class ConfigurationLayoutUiCases {
    private final Instrumentation test;
    private final Bundle args;
    private Activity activity;
    private File directory;
    private int checks,sliders,groups;
    private final JSONArray pages=new JSONArray(),measurements=new JSONArray(),violations=new JSONArray();
    private final JSONArray groupMeasurements=new JSONArray();
    private final List<Object[]> openedGroups=new ArrayList<>();
    private ConfigurationLayoutUiCases(Instrumentation test,Bundle args){this.test=test;this.args=args;}
    static JSONObject run(Instrumentation test,Bundle args)throws Exception{return new ConfigurationLayoutUiCases(test,args).execute();}
    private JSONObject execute()throws Exception{
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);
        Map<String,String> original=new LinkedHashMap<>(config.snapshot());
        DurablePreferences prefs=(DurablePreferences)field(config,"prefs");
        Map<String,?> originalPreferences=prefs.getAll();
        boolean themeFixture="dark".equals(args.getString("theme",""));
        // Layout-only theme override must reach the authoritative in-memory snapshot,
        // without writing or publishing the user's appearance preference.
        if(themeFixture){Map<String,Object> themed=new LinkedHashMap<>(originalPreferences);themed.put(AppearanceOptions.THEME,"1");setPreferenceFixture(prefs,Collections.unmodifiableMap(themed));}
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        boolean wasUnlocked=HiddenEntrySession.isUnlocked();
        directory=new File(context.getExternalFilesDir(null),"configuration-layout-"+args.getString("label","latest"));directory.mkdirs();
        LinkedHashSet<String> routes=new LinkedHashSet<>();
        String requested=args.getString("routes","");
        if(!requested.isEmpty())routes.addAll(Arrays.asList(requested.split(",")));
        else{
            for(ModuleHierarchy.Section section:ModuleHierarchy.allSections())if(!section.restricted)routes.add(ModuleHierarchy.resolve(section.route()));
            routes.addAll(Arrays.asList(StatusBarPages.ROUTES));
            routes.addAll(Arrays.asList("asset/wifi.signal","asset/mobile1.signal","asset/privacy.dot","mi_health","atomic_workbench","competitive_key"));
        }
        boolean strict=Boolean.parseBoolean(args.getString("strict","false"));
        int skip=Integer.parseInt(args.getString("skip","0")),limit=Integer.parseInt(args.getString("limit","1000"));
        List<String> selected=new ArrayList<>(routes);selected=selected.subList(Math.min(skip,selected.size()),Math.min(selected.size(),skip+limit));
        boolean landscape=Boolean.parseBoolean(args.getString("landscape","false"));
        if(landscape){require(test.getUiAutomation().setRotation(Surface.ROTATION_90),"Landscape is available");SystemClock.sleep(500);}
        try{
            int index=0;
            for(String route:selected){
                activity=test.startActivitySync(intent(context,route));
                main(()->{activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});settle();
                require(main(()->activity.getWindow().getDecorView().isShown()&&activity.hasWindowFocus()),"Page is visible and focused: "+route);
                if(landscape)require(activity.getResources().getConfiguration().orientation==android.content.res.Configuration.ORIENTATION_LANDSCAPE,"Actual landscape layout: "+route);
                if(activity instanceof ExtraDimActivity){
                    long until=SystemClock.uptimeMillis()+10000;
                    while(main(()->((TextView)field(activity,"status")).getText().toString().contains("正在读取"))&&SystemClock.uptimeMillis()<until)settle();
                    require(main(()->!((TextView)field(activity,"status")).getText().toString().contains("正在读取")),"Extra dim capability read completed before layout inspection");
                }
                if(themeFixture)require(main(()->{Set<UiKit> kits=new LinkedHashSet<>();collectKits(activity,kits,new HashSet<>());return !kits.isEmpty()&&kits.stream().allMatch(ui->ui.dark);}),"Actual page uses dark appearance: "+route);
                main(()->{openedGroups.clear();openLayouts(activity);return null;});settle();
                final String name=String.format(Locale.ROOT,"%02d-%s",++index,route.replace('/','-'));
                main(()->{inspect(activity,route,strict);return null;});
                capture(name+"-top");
                SeekBar first=main(()->{for(View view:walk(activity.getWindow().getDecorView()))if(view instanceof SeekBar&&view.isShown())return (SeekBar)view;return null;});
                if(first!=null){main(()->{scrollToParameter(first,route);return null;});settle();capture(name+"-numeric");}
                pages.put(new JSONObject().put("route",route).put("file",name).put("density",activity.getResources().getDisplayMetrics().density).put("fontScale",activity.getResources().getConfiguration().fontScale).put("orientation",activity.getResources().getConfiguration().orientation).put("dark",new AppearanceController(activity).dark));
                Bundle progress=new Bundle();progress.putString("page",route);test.sendStatus(0,progress);
                main(()->{activity.finish();return null;});settle();activity=null;
                require(before.equals(config.snapshot()),"Layout inspection must not change configuration: "+route);
                Files.write(new File(directory,"progress.json").toPath(),new JSONObject().put("pages",pages).put("measurements",measurements).put("groupMeasurements",groupMeasurements).put("violations",violations).toString(2).getBytes(StandardCharsets.UTF_8));
            }
        }finally{
            if(activity!=null)main(()->{activity.finish();return null;});
            if(landscape)test.getUiAutomation().setRotation(UiAutomation.ROTATION_UNFREEZE);
            if(!wasUnlocked)HiddenEntrySession.lock();
            if(themeFixture)setPreferenceFixture(prefs,originalPreferences);
        }
        require(original.equals(config.snapshot()),"Original settings restored after layout variants");
        JSONObject report=new JSONObject().put("success",violations.length()==0).put("checks",checks).put("pages",pages)
                .put("sliders",sliders).put("groups",groups).put("measurements",measurements).put("groupMeasurements",groupMeasurements).put("violations",violations)
                .put("settingsUnchanged",original.equals(config.snapshot())).put("disabledFoldsAreLayoutFixtures",true);
        Files.write(new File(directory,"measurements.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));return report;
    }
    private Intent intent(Context context,String route){
        Class<? extends Activity> type;
        if(StatusBarPages.editor(route))type=StatusBarSettingsActivity.class;
        else if(route.startsWith("asset/")||route.equals("status_assets"))type=StatusBarAssetsActivity.class;
        else if(route.equals("mi_health"))type=HealthSettingsActivity.class;
        else if(route.equals("atomic_workbench"))type=AtomicWorkbenchSettingsActivity.class;
        else if(route.equals("competitive_key"))type=CompetitiveKeySettingsActivity.class;
        else if(route.equals("scope"))type=ModuleScopeActivity.class;
        else if(route.equals("extra_dim"))type=ExtraDimActivity.class;
        else if(route.equals("hide_apps")){
            if(!HiddenEntrySession.isUnlocked())for(int i=0;i<7;i++)HiddenEntrySession.recordSystemVersionTap(SystemClock.uptimeMillis());
            type=HideAppsActivity.class;
        }
        else if(route.startsWith("group/")||route.startsWith("target-"))type=EnhancementSettingsActivity.class;
        else type=FeatureActivity.class;
        Intent intent=new Intent(context,type).putExtra(ModuleNavigation.EXTRA_ROUTE,route).putExtra(FeatureActivity.EXTRA_MODULE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        ModuleHierarchy.Section section=ModuleHierarchy.group(route);if(section!=null)intent.putExtra("target",section.target);return intent;
    }
    private void openLayouts(Object owner)throws Exception{
        Set<UiKit> kits=new LinkedHashSet<>();collectKits(owner,kits,new HashSet<>());
        for(UiKit ui:kits){
            Map<?,?> setters=(Map<?,?>)field(ui,"foldSetters");
            for(Map.Entry<?,?> entry:new ArrayList<>(setters.entrySet())){
                Object setter=entry.getValue();
                if(entry.getKey().toString().startsWith("group:")){
                    ((Consumer<Boolean>)setter).accept(true);groups++;
                    for(Field capture:setter.getClass().getDeclaredFields()){capture.setAccessible(true);Object v=capture.get(setter);
                        if(v instanceof View&&((View)v).getParent() instanceof ViewGroup){View content=(View)v;View header=((ViewGroup)content.getParent()).getChildAt(0);openedGroups.add(new Object[]{entry.getKey(),header,content});break;}}
                    continue;
                }
                for(Field field:setter.getClass().getDeclaredFields()){
                    field.setAccessible(true);Object captured=field.get(setter);
                    if(captured instanceof UiKit.Fold){
                        UiKit.Fold fold=(UiKit.Fold)captured;
                        fold.content.setVisibility(View.VISIBLE);fold.arrow.setRotation(180);groups++;
                        View heading=(View)fold.control.getParent();
                        // New decoration is optional so the same harness also captures the previous APK.
                        try{Object presentation=field(fold,"presentation");Method update=presentation.getClass().getDeclaredMethod("update",boolean.class);update.setAccessible(true);update.invoke(presentation,true);heading=(View)field(presentation,"header");}catch(NoSuchFieldException ignored){}
                        openedGroups.add(new Object[]{entry.getKey(),heading,fold.content});
                    }
                }
            }
        }
        // This floating activity owns its Fold directly and creates UiKit locally.
        if(owner instanceof ExtraDimActivity){
            UiKit.Fold fold=(UiKit.Fold)field(owner,"intensityFold");fold.content.setVisibility(View.VISIBLE);fold.arrow.setRotation(180);groups++;
            Object presentation=field(fold,"presentation");Method update=presentation.getClass().getDeclaredMethod("update",boolean.class);update.setAccessible(true);update.invoke(presentation,true);
            openedGroups.add(new Object[]{"extra-dim-strength",field(presentation,"header"),fold.content});
        }
    }
    private void collectKits(Object owner,Set<UiKit> kits,Set<Object> seen)throws Exception{
        if(owner==null||!seen.add(owner))return;
        for(Class<?> type=owner.getClass();type!=null&&type.getName().startsWith("ls.augment.com.");type=type.getSuperclass()){
            for(Field f:type.getDeclaredFields()){
                if(Modifier.isStatic(f.getModifiers()))continue;f.setAccessible(true);Object value=f.get(owner);
                if(value instanceof UiKit)kits.add((UiKit)value);
                else if(value instanceof NativeEditorController)collectKits(value,kits,seen);
                else if(value instanceof Map)for(Object child:((Map<?,?>)value).values())if(child instanceof NativeEditorController)collectKits(child,kits,seen);
            }
        }
    }
    private void inspect(Activity page,String route,boolean strict)throws Exception{
        float density=page.getResources().getDisplayMetrics().density;
        for(Object[] group:openedGroups){
            View header=(View)group[1],content=(View)group[2];if(!content.isShown())continue;
            float gap=(position(content)[1]-position(header)[1]-header.getHeight())/density;
            int bottom=content.getLayoutParams() instanceof ViewGroup.MarginLayoutParams?((ViewGroup.MarginLayoutParams)content.getLayoutParams()).bottomMargin:0;
            groupMeasurements.put(new JSONObject().put("route",route).put("group",group[0]).put("headerToContentDp",gap).put("contentInsetDp",content.getPaddingLeft()/density).put("endGapDp",bottom/density));
            if(strict){
                check(content.getBackground()!=null&&content.getBackground().getClass().getName().contains("ExpandedConfiguration"),route+": missing expanded boundary "+group[0]);
                check(content.getPaddingLeft()/density>=11.7,route+": missing child indent "+group[0]);
                check(bottom/density>=7.7,route+": missing group separation "+group[0]);
                if(header.getParent()==content.getParent()){
                    ViewGroup parent=(ViewGroup)header.getParent();if(parent.indexOfChild(content)==parent.indexOfChild(header)+1)check(gap>=-.4&&gap<=.4,route+": header separated from its content "+gap);
                }
            }
        }
        for(View view:walk(page.getWindow().getDecorView())){
            if(!(view instanceof SeekBar)||!view.isShown())continue;
            sliders++;ViewGroup parent=(ViewGroup)view.getParent();int i=parent.indexOfChild(view);
            View previous=null;
            for(int before=i-1;before>=0;before--)if(parent.getChildAt(before).getVisibility()!=View.GONE){previous=parent.getChildAt(before);break;}
            int[] bar=position(view);JSONObject item=new JSONObject().put("route",route).put("parameter",String.valueOf(view.getContentDescription())).put("sliderHeightDp",view.getHeight()/density);
            float trackCenter=bar[1]+view.getPaddingTop()+((SeekBar)view).getProgressDrawable().getBounds().exactCenterY();
            item.put("trackCenterDp",trackCenter/density).put("sliderTopDp",bar[1]/density);
            if(strict)check(Math.abs(view.getHeight()/density-20)<=.4,route+": slider visual row is not 20dp");
            check(((SeekBar)view).getThumb().getBounds().height()<=view.getHeight(),route+": slider thumb is clipped vertically");
            if(view instanceof ParameterSeekBar){float target=((ParameterSeekBar)view).expandedTouchBounds().height()/density;item.put("expandedTouchHeightDp",target);check(target>=47.7,route+": expanded slider region below 48dp");}
            if(previous!=null){
                int[] label=position(previous);float gap=(bar[1]-label[1]-previous.getHeight())/density;
                item.put("informationHeightDp",previous.getHeight()/density).put("informationToSliderDp",gap).put("compactHeader","numeric-parameter-header".equals(previous.getTag()));
                View title=previous;
                if(!"numeric-parameter-header".equals(previous.getTag())){
                    if(parent instanceof ParameterSlider&&parent.getParent() instanceof ViewGroup){ViewGroup owner=(ViewGroup)parent.getParent();int at=owner.indexOfChild(parent);if(at>0)title=owner.getChildAt(at-1);}
                    else if(i>1&&parent.getChildAt(i-2) instanceof ViewGroup)title=parent.getChildAt(i-2);
                }
                item.put("titleToSliderTopDp",(bar[1]-position(title)[1])/density);
                item.put("informationCenterToTrackDp",(trackCenter-label[1]-previous.getHeight()/2f)/density);
                if(strict)check(gap>=-.4&&gap<=4.4,route+": excessive information-to-slider gap "+gap);
                if("numeric-parameter-header".equals(previous.getTag())){
                    for(View child:walk(previous))if(child instanceof TextView){
                        TextView text=(TextView)child;
                        if(text.isClickable())check(text.getHeight()/density>=43.7,route+": numeric target below 44dp");
                        if(text.getLayout()!=null)for(int line=0;line<text.getLayout().getLineCount();line++)check(text.getLayout().getEllipsisCount(line)==0,route+": clipped numeric text");
                    }
                    check(previous.getWidth()<=parent.getWidth(),route+": numeric header overflows");
                }
            }
            measurements.put(item);
        }
    }
    private void check(boolean okay,String message){checks++;if(!okay)violations.put(message);}
    private void scrollToParameter(SeekBar bar,String route){
        View anchor=bar;
        if("status_arrangement".equals(route)){
            for(View v:walk(activity.getWindow().getDecorView()))if(v instanceof TextView&&((TextView)v).getText().toString().startsWith("高级：高度")){anchor=v;break;}
        }else{ViewGroup parent=(ViewGroup)bar.getParent();int at=parent.indexOfChild(bar);if(at>0)anchor=parent.getChildAt(at-1);}
        for(View p=anchor;p.getParent() instanceof View;p=(View)p.getParent())if(p.getParent() instanceof ScrollView){
            ScrollView scroll=(ScrollView)p.getParent();scroll.scrollTo(0,scroll.getScrollY()+position(anchor)[1]-position(scroll)[1]-scroll.getPaddingTop());break;
        }
    }
    private void require(boolean okay,String message){checks++;if(!okay)throw new AssertionError(message);}
    private static int[] position(View view){int[] p=new int[2];view.getLocationOnScreen(p);return p;}
    private static List<View> walk(View view){List<View> all=new ArrayList<>();all.add(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)all.addAll(walk(((ViewGroup)view).getChildAt(i)));return all;}
    private static Object field(Object owner,String name)throws Exception{for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(owner);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static void setPreferenceFixture(DurablePreferences prefs,Map<String,?> values)throws Exception{Field confirmed=DurablePreferences.class.getDeclaredField("confirmed");confirmed.setAccessible(true);confirmed.set(prefs,values);}
    private void capture(String name)throws Exception{Bitmap bitmap=test.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot available");try(FileOutputStream out=new FileOutputStream(new File(directory,name+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}finally{bitmap.recycle();}}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(400);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> operation)throws Exception{AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{value.set(operation.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError(error.get());return value.get();}
}
