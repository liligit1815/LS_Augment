package ls.augment.com;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Actual production controls -> normal autosave -> preferences and provider readback.
 * This intentionally does not claim that provider readback proves SystemUI rendering.
 * Test APK only; the baseline is durable and is restored even after an assertion fails.
 */
final class StatusBarControlRoundTripCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final JSONArray results=new JSONArray();
    private Activity page;
    private StatusBarEditorController editor;
    private String route;
    private int failures;
    private final File baseline,reportFile;
    private StatusBarControlRoundTripCases(Instrumentation test){
        this.test=test;context=test.getTargetContext();config=new AppConfig(context);
        baseline=new File(context.getFilesDir(),"statusbar-controls-baseline.json");
        reportFile=new File(context.getExternalFilesDir(null),"statusbar-controls-results.json");
    }
    static JSONObject run(Instrumentation test)throws Exception{return new StatusBarControlRoundTripCases(test).execute();}
    static JSONObject restore(Instrumentation test)throws Exception{
        StatusBarControlRoundTripCases suite=new StatusBarControlRoundTripCases(test);
        suite.restoreBaseline();return new JSONObject().put("success",true).put("settingsRestored",true);
    }
    private JSONObject execute()throws Exception{
        require(!baseline.exists(),"Previous roundtrip baseline exists; run restore before retrying");
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        JSONObject savedBaseline=new JSONObject().put("settings",new JSONObject(before))
                .put("nativeValueOverrides",new JSONObject(context.getSharedPreferences("native_value_overrides",0).getAll()));
        Files.write(baseline.toPath(),savedBaseline.toString().getBytes(StandardCharsets.UTF_8));
        JSONObject report=new JSONObject().put("evidenceScope","production controls + autosave + preferences + provider; not SystemUI visual verification")
                .put("cases",results).put("baseline",baseline.getAbsolutePath());
        try{
            Map<String,String> setup=new LinkedHashMap<>();
            for(String key:ConfigSchema.keys())if(key.startsWith("ls_augment_statusbar_")||key.equals(ConfigSchema.SYSTEMUI_MASTER))setup.put(key,ConfigSchema.defaultValue(key));
            // Preserve user assets/fonts; layout controls are tested independently of their rendering.
            setup.remove(StatusBarThemeSpec.KEY);setup.remove(StatusBarFontSpec.KEY);setup.remove(StatusBarVisibilitySpec.KEY);
            setup.put(ConfigSchema.SYSTEMUI_MASTER,"1");setup.put(ConfigSchema.STATUSBAR_CLOCK_CUSTOM,"1");
            setup.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN,"HH:mm:ss");setup.put(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,"MM/dd E");
            StatusBarGridSpec grid=StatusBarGridSpec.defaults();
            for(String id:StatusBarGridSpec.IDS){StatusBarGridSpec.Item i=grid.get(id);grid=grid.with(id,new StatusBarGridSpec.Item(i.zone,i.order,i.size,true));}
            setup.put(ConfigSchema.STATUSBAR_GRID,grid.serialize());
            require(config.save(setup).success,"Prepare isolated layout controls");
            open("status_layout");toggle("自定义状态栏",ConfigSchema.SYSTEMUI_MASTER,false);toggle("自定义状态栏",ConfigSchema.SYSTEMUI_MASTER,true);close();
            open("status_arrangement");
            for(String[] item:new String[][]{{ConfigSchema.STATUSBAR_HEIGHT_DP,"状态栏高度（0 原厂，负数减小）","-32","48"},{ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,"左侧留白","0","12"},{ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP,"右侧留白","0","10"},{ConfigSchema.STATUSBAR_TOP_MARGIN_DP,"顶部留白","0","4"},{ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP,"底部留白","0","3"},{ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"两排间距","-8","8"}})
                slider(item[1],item[0],Integer.parseInt(item[2]),Integer.parseInt(item[3]));
            toggle("仅调整位置和大小",ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,true);toggle("仅调整位置和大小",ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,false);related("layout");close();
            open("status_clock");componentControls("clock","时钟");
            spinner("时钟显示排数",ConfigSchema.STATUSBAR_CLOCK_ROWS,1,"2");spinner("时钟显示排数",ConfigSchema.STATUSBAR_CLOCK_ROWS,0,"1");spinner("时钟显示排数",ConfigSchema.STATUSBAR_CLOCK_ROWS,1,"2");
            toggle("自定义时钟文字",ConfigSchema.STATUSBAR_CLOCK_CUSTOM,false);toggle("自定义时钟文字",ConfigSchema.STATUSBAR_CLOCK_CUSTOM,true);
            for(String[] item:new String[][]{{ConfigSchema.STATUSBAR_CLOCK_PATTERN,"第一行格式，例如 HH:mm","HH:mm:ss.SSS"},{ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,"第二行格式，例如 MM/dd E","'SECOND' MM/dd"},{ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY,"字体名称（sans-serif / serif / monospace）","monospace"},{ConfigSchema.STATUSBAR_CLOCK_SIZE_SP,"单独字号 sp（0 使用上方大小）","17"},{ConfigSchema.STATUSBAR_CLOCK_WEIGHT,"字重（100–900）","700"},{ConfigSchema.STATUSBAR_CLOCK_LETTER_SPACING,"字间距（-0.20 至 1.00）","0.12"},{ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,"固定宽度 dp（0 自动）","88"}})text(item[1],item[0],item[2]);
            for(String[] item:new String[][]{{ConfigSchema.STATUSBAR_CLOCK_24H,"默认使用 24 小时制"},{ConfigSchema.STATUSBAR_CLOCK_SECONDS,"默认显示秒"},{ConfigSchema.STATUSBAR_CLOCK_PERIOD,"默认显示时段"},{ConfigSchema.STATUSBAR_CLOCK_WEEK,"默认显示星期"}}){toggle(item[1],item[0],true);toggle(item[1],item[0],false);}
            for(int i=0;i<3;i++)spinner("文字对齐",ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN,i,new String[]{"left","center","right"}[i]);
            invalidClock();related("clock");close();
            open("status_notifications");componentControls("notifications","通知图标");
            toggle("通知图标分两排",ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,false);toggle("通知图标分两排",ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,true);
            slider("最多显示通知数（0 跟随系统）",ConfigSchema.STATUSBAR_NOTIFICATION_MAX,0,3);
            toggle("通知图标数量解限",ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED,true);toggle("通知图标数量解限",ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED,false);related("notifications");close();
            open("status_metrics");
            for(String id:new String[]{"cpu","gpu","battery_temp","current","power"}){
                componentControls(id,StatusBarGridSpec.LABELS[Arrays.asList(StatusBarGridSpec.IDS).indexOf(id)]);
                String key="ls_augment_statusbar_"+id+"_decimals";
                mutate("precision "+id,key,"3",()->{View scope=component(id);Spinner s=find(scope,"保留小数位数",Spinner.class);require(s!=null,"precision control "+id);s.setSelection(3);});
            }
            related("metrics");close();
            open("status_network");componentControls("network","网速");
            for(int mode=1;mode<=4;mode++)spinner("网速显示方式",ConfigSchema.STATUSBAR_NETWORK_DISPLAY,mode-1,String.valueOf(mode));
            text("上行标志（留空不显示）",ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK,"U:");text("下行标志（留空不显示）",ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK,"D:");
            slider("原生网速字号（0 跟随系统图标）",ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,0,18);related("network");close();
            open("status_icons");componentControls("system_icons","系统图标");toggle("系统图标分两排",ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,false);toggle("系统图标分两排",ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,true);
            for(int style=0;style<3;style++)spinner("蓝牙图标样式",ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,style,String.valueOf(style));related("icons");close();
            open("status_battery");
            toggle("原生电池图标",ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true);componentControls("battery","显示电池图标");related("battery");
            toggle("三合一图形图标",ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,true);
            checkpoint("three-in-one disables native battery",ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,"0");
            slider("圆形组件大小（dp）",ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,18,30);
            String[] labels={"内部上方","内部","内部下方"};
            for(int i=0;i<3;i++){
                spinner(labels[i]+"显示内容",ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i],5,"none");spinner(labels[i]+"显示内容",ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i],i,ConfigSchema.CONNECTIVITY_CONTENT_VALUES[i]);
                transforms(labels[i],ConfigSchema.CONNECTIVITY_X_KEYS[i],ConfigSchema.CONNECTIVITY_Y_KEYS[i],ConfigSchema.CONNECTIVITY_SCALE_KEYS[i]);
            }
            for(int i=0;i<2;i++)transforms(i==0?"普通充电 · 闪电":"旁路充电 · 插头",ConfigSchema.CONNECTIVITY_POWER_X_KEYS[i],ConfigSchema.CONNECTIVITY_POWER_Y_KEYS[i],ConfigSchema.CONNECTIVITY_POWER_SCALE_KEYS[i]);
            slider("电量弧粗细（占组件直径 %）",ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE,3,8);slider("未点亮部分不透明度（%）",ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE,10,42);
            text("充电标志颜色（#AARRGGBB）",ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR,"#FFFF00FF");toggle("圆环充电与低电量着色",ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS,false);toggle("圆环充电与低电量着色",ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS,true);
            for(boolean digits:new boolean[]{false,true}){
                String prefix=SystemUiOptions.PREFIX+(digits?"battery_text_":"battery_");
                String paletteTitle=digits?"电量字体":"电池圆环";
                toggle("按电量设置"+paletteTitle+"颜色",prefix+"colors",true);
                String[] bands={"0%～19%","20%～50%","51%～79%","80%～100%","充电时"};
                for(int band=0;band<5;band++){
                    String key=prefix+(band==4?"charging_color":"color_"+band);
                    text(bands[band]+" "+paletteTitle+"颜色（#AARRGGBB）",key,"#FF12AB34");
                }
            }
            toggle("原生电池图标",ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,true);checkpoint("native battery disables three-in-one",ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"0");
            close();
        }finally{
            try{close();}finally{restoreBaseline();}
            report.put("success",failures==0).put("failures",failures).put("settingsRestored",before.equals(config.snapshot()));
            Files.write(reportFile.toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        return report.put("reportFile",reportFile.getAbsolutePath());
    }
    private void transforms(String title,String x,String y,String scale)throws Exception{
        slider(title+"左右移动（直径 %）",x,-100,17);slider(title+"上下移动（直径 %）",y,-100,-12);slider(title+"大小（%）",scale,50,125);
    }
    private void componentControls(String id,String title)throws Exception{
        for(boolean visible:new boolean[]{false,true}){
            StatusBarGridSpec grid=StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID));StatusBarGridSpec.Item old=grid.get(id);
            String expected=grid.with(id,new StatusBarGridSpec.Item(old.zone,old.order,old.size,visible)).serialize();
            mutate(title+" visibility",ConfigSchema.STATUSBAR_GRID,expected,()->{Switch control=switchForTitle(title);require(control!=null,"component switch "+title);clickSwitch(control,visible,title);});
            if(id.equals("notifications"))checkpoint("notification visibility also updates hide key",ConfigSchema.STATUSBAR_NOTIFICATION_HIDE,visible?"0":"1");
        }
        StatusBarGridSpec grid=StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID));StatusBarGridSpec.Item old=grid.get(id);
        String expected=grid.with(id,new StatusBarGridSpec.Item(old.zone,old.order,15,old.visible)).serialize();
        mutate(title+" size",ConfigSchema.STATUSBAR_GRID,expected,()->{
            SeekBar bar=find(component(id),"大小（dp）",SeekBar.class);require(bar!=null,"component slider "+id);
            Bundle args=new Bundle();args.putFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,15-6);
            require(bar.performAccessibilityAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId(),args),"component progress action "+id);
        });
    }
    private void related(String destination)throws Exception{
        for(NativeFeatureGroups.Section section:NativeFeatureGroups.forTarget("systemui"))if(section.id.equals("statusbar"))
            for(NativeFeatureGroups.Feature feature:section.features)if(destination.equals(StatusBarPages.destination(feature)))relatedFeature(feature);
    }
    private void relatedFeature(NativeFeatureGroups.Feature feature)throws Exception{
        if(feature.id.equals("systemui:battery_colors")||feature.id.equals("systemui:battery_text_colors"))return;
        if(feature.toggleKey!=null){toggle(feature.title,feature.toggleKey,true);toggle(feature.title,feature.toggleKey,false);if(feature.parameterKeys.length>0||feature.children.length>0)toggle(feature.title,feature.toggleKey,true);}
        else main(()->{Switch gate=(Switch)page.getWindow().getDecorView().findViewWithTag("config:"+feature.parameterKeys[0]);require(gate!=null,"scalar gate "+feature.id);if(!gate.isChecked())gate.performClick();return null;});
        for(String key:feature.parameterKeys){
            EnhancementOption option=option(key);String value;
            if(key.endsWith("hidden_icon_slots")){
                mutate("hidden icon checkbox",key,"alarm_clock",()->{View controls=((Map<String,View>)get(page,"controls")).get(key);require(controls!=null,"icon checkboxes");for(String slot:new String[]{"alarm_clock","bluetooth","zen","headset","vpn","location","airplane","cast","rotate","hotspot","nfc"}){CheckBox box=(CheckBox)controls.findViewWithTag(slot);require(box!=null,"checkbox "+slot);box.setChecked(slot.equals("alarm_clock"));}});continue;
            }
            if(option.kind==EnhancementOption.Kind.CHOICE){int selected=option.choices.length>1?1:0;spinner(option.title,key,selected,String.valueOf(selected));continue;}
            if(option.kind==EnhancementOption.Kind.INTEGER)value=String.valueOf((int)Math.max(option.minimum,Math.min(option.maximum,key.endsWith("clock_refresh_ms")?250:Math.max(option.minimum+1,5))));
            else if(option.kind==EnhancementOption.Kind.COLOR)value="#FF12AB34";
            else value="T=";
            text(option.title,key,value);
        }
        for(NativeFeatureGroups.Feature child:feature.children)relatedFeature(child);
    }
    private EnhancementOption option(String key){for(EnhancementOption o:EnhancementCatalog.options())if(key.equals(o.key))return o;throw new AssertionError("Unknown option "+key);}
    private void toggle(String title,String key,boolean value)throws Exception{mutate(title,key,value?"1":"0",()->{Switch s=(Switch)page.getWindow().getDecorView().findViewWithTag("config:"+key);if(s==null)s=switchForTitle(title);require(s!=null,"switch "+title);clickSwitch(s,value,title);});}
    private static void clickSwitch(Switch control,boolean value,String title){
        require(control.isEnabled(),"enabled switch "+title);
        if(control.isChecked()!=value)control.performClick();
        // CompoundButton toggles and invokes OnCheckedChangeListener before returning the
        // base View click result. A false return without an OnClickListener is not a failed toggle.
        require(control.isChecked()==value,"switch state after click "+title);
    }
    private void spinner(String title,String key,int index,String value)throws Exception{mutate(title,key,value,()->{
        Spinner s=find(page.getWindow().getDecorView(),title,Spinner.class);
        // choiceSpinner's dialog title is not a contentDescription. Resolve existing labels
        // and their adjacent control, rather than requiring a test-only product accessibility tag.
        if(s==null&&ConfigSchema.STATUSBAR_NETWORK_DISPLAY.equals(key))s=followingLabel(component("network"),"显示方式",Spinner.class);
        if(s==null)s=followingLabel(page.getWindow().getDecorView(),title,Spinner.class);
        require(s!=null,"spinner "+title);require(index>=0&&index<s.getCount(),"spinner index "+title);s.setSelection(index);
    });}
    private void text(String title,String key,String value)throws Exception{mutate(title,key,ConfigSchema.normalize(key,value),()->{EditText field=find(page.getWindow().getDecorView(),title,EditText.class);require(field!=null,"input "+title);field.setText(value);require(field.getError()==null,"valid input "+title);});}
    private void slider(String title,String key,int minimum,int value)throws Exception{mutate(title,key,String.valueOf(value),()->{SeekBar bar=find(page.getWindow().getDecorView(),title,SeekBar.class);require(bar!=null,"slider "+title);Bundle args=new Bundle();args.putFloat(AccessibilityNodeInfo.ACTION_ARGUMENT_PROGRESS_VALUE,value-minimum);require(bar.performAccessibilityAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SET_PROGRESS.getId(),args),"user progress action "+title);});}
    private void invalidClock()throws Exception{
        String before=config.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN);
        mutate("invalid clock rejected",ConfigSchema.STATUSBAR_CLOCK_PATTERN,before,()->{EditText field=find(page.getWindow().getDecorView(),"第一行格式，例如 HH:mm",EditText.class);field.setText("'");require(field.getError()!=null,"invalid format has error");});
        text("第一行格式，例如 HH:mm",ConfigSchema.STATUSBAR_CLOCK_PATTERN,before);
    }
    private interface Action{void run()throws Exception;}
    private void mutate(String label,String key,String expected,Action action)throws Exception{
        JSONObject item=new JSONObject().put("route",route).put("control",label).put("key",key).put("expected",expected)
                .put("before",config.get(key)).put("valueTransition",!Objects.equals(expected,config.get(key))).put("visualEffectVerified",false);
        String stage="control-action";
        try{main(()->{expand();action.run();return null;});stage="save-readback";readback(key,expected);item.put("pass",true).put("evidence","actual control callback, normal autosave, preferences and provider snapshot");}
        catch(Throwable error){failures++;StringWriter stack=new StringWriter();error.printStackTrace(new PrintWriter(stack));
            item.put("pass",false).put("failureStage",stage).put("error",causes(error)).put("stackTrace",stack.toString()).put("storedAfter",config.get(key));}
        results.put(item);Files.write(reportFile.toPath(),new JSONObject().put("cases",results).put("failures",failures).toString(2).getBytes(StandardCharsets.UTF_8));
    }
    private void checkpoint(String label,String key,String expected)throws Exception{mutate(label,key,expected,()->{});}
    private void readback(String key,String expected)throws Exception{
        long deadline=SystemClock.uptimeMillis()+8000;String stored="",runtime="";
        do{stored=config.get(key);Bundle bundle=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"snapshot",null,null);
            ConfigSnapshot snapshot=bundle==null?null:ConfigSnapshot.parse(bundle.getString("snapshot"));runtime=snapshot==null?"":snapshot.get(key);
            if(Objects.equals(expected,stored)&&Objects.equals(expected,runtime)){test.waitForIdleSync();return;}SystemClock.sleep(80);
        }while(SystemClock.uptimeMillis()<deadline);
        throw new AssertionError(key+" expected="+expected+" stored="+stored+" provider="+runtime);
    }
    private void open(String route)throws Exception{
        this.route=route;page=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,route).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));test.waitForIdleSync();
        editor=main(()->(StatusBarEditorController)((Map<?,?>)get(page,"editors")).get(route));require(editor!=null,"production editor "+route);
    }
    private void close()throws Exception{
        if(page==null)return;Activity old=page;StatusBarEditorController oldEditor=editor;
        main(()->{old.finish();return null;});test.waitForIdleSync();
        ((ExecutorService)get(oldEditor,"worker")).submit(()->{}).get(10,TimeUnit.SECONDS);
        ExecutorService activityWorker=(ExecutorService)get(old,"worker");
        if(activityWorker.isShutdown())require(activityWorker.awaitTermination(10,TimeUnit.SECONDS),"activity saves drained");
        else activityWorker.submit(()->{}).get(10,TimeUnit.SECONDS);
        test.waitForIdleSync();page=null;editor=null;
    }
    private void restoreBaseline()throws Exception{
        require(baseline.isFile(),"No durable baseline");JSONObject baselineJson=new JSONObject(new String(Files.readAllBytes(baseline.toPath()),StandardCharsets.UTF_8));
        JSONObject json=baselineJson.getJSONObject("settings");Map<String,String> saved=new LinkedHashMap<>();
        for(Iterator<String> it=json.keys();it.hasNext();){String key=it.next();saved.put(key,json.getString(key));}
        require(config.save(saved).success,"restore settings");require(saved.equals(config.snapshot()),"all settings restored");
        JSONObject memory=baselineJson.getJSONObject("nativeValueOverrides");SharedPreferences.Editor edit=context.getSharedPreferences("native_value_overrides",0).edit().clear();
        for(Iterator<String> it=memory.keys();it.hasNext();){String key=it.next();Object value=memory.get(key);if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else if(value instanceof Number)throw new AssertionError("Unexpected numeric UI memory; baseline retained");else edit.putString(key,(String)value);}
        require(edit.commit(),"restore remembered scalar controls");require(baseline.delete(),"remove completed baseline");
    }
    private void expand()throws Exception{
        for(Object fold:((Map<?,?>)get(editor,"componentFolds")).values())((UiKit.Fold)fold).show(true);
        for(String name:new String[]{"nativeBatteryFold","connectivityFold"}){UiKit.Fold fold=(UiKit.Fold)get(editor,name);if(fold!=null)fold.show(true);}
        for(Object item:((Map<?,?>)get(editor,"advancedViews")).values()){View view=(View)item;if(view.getVisibility()!=View.VISIBLE){ViewGroup parent=(ViewGroup)view.getParent();parent.getChildAt(0).performClick();}}
        expandArrows(page.getWindow().getDecorView());
    }
    private static void expandArrows(View view){if(view instanceof ImageButton&&view.isEnabled()&&view.getContentDescription()!=null&&view.getContentDescription().toString().startsWith("展开"))view.performClick();if(view instanceof ViewGroup){ViewGroup g=(ViewGroup)view;for(int i=0;i<g.getChildCount();i++)expandArrows(g.getChildAt(i));}}
    private View component(String id)throws Exception{return (View)((Map<?,?>)get(editor,"componentViews")).get(id);}
    private Switch switchForTitle(String title){
        View root=page.getWindow().getDecorView();Switch described=find(root,title,Switch.class);if(described!=null)return described;
        List<TextView> labels=new ArrayList<>();labels(root,title,labels);
        for(TextView label:labels){View row=label;while(row!=null&&!"feature-row".equals(row.getTag()))row=row.getParent() instanceof View?(View)row.getParent():null;Switch found=find(row,null,Switch.class);if(found!=null)return found;}
        return null;
    }
    private static void labels(View view,String title,List<TextView> out){
        if(view instanceof TextView&&title.contentEquals(((TextView)view).getText()))out.add((TextView)view);
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)labels(((ViewGroup)view).getChildAt(i),title,out);
    }
    private static <T extends View>T followingLabel(View scope,String title,Class<T> type){
        List<TextView> labels=new ArrayList<>();labels(scope,title,labels);T best=null;int bestDepth=Integer.MAX_VALUE;
        for(TextView label:labels){
            View branch=label;
            for(int depth=0;depth<3&&branch!=scope&&branch.getParent() instanceof ViewGroup;depth++){
                ViewGroup parent=(ViewGroup)branch.getParent();int index=parent.indexOfChild(branch);
                if(index>=0&&index+1<parent.getChildCount()){
                    T candidate=find(parent.getChildAt(index+1),null,type);
                    if(candidate!=null&&depth<bestDepth){best=candidate;bestDepth=depth;}
                    else if(candidate!=null&&depth==bestDepth&&candidate!=best)throw new AssertionError("Ambiguous labeled "+type.getSimpleName()+": "+title);
                }
                branch=parent;
            }
        }
        return best;
    }
    private static TextView text(View view,String title){if(view instanceof TextView&&title.contentEquals(((TextView)view).getText()))return(TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=text(((ViewGroup)view).getChildAt(i),title);if(found!=null)return found;}return null;}
    private static <T extends View>T find(View view,String description,Class<T> type){if(type.isInstance(view)&&(description==null||description.contentEquals(view.getContentDescription()==null?"":view.getContentDescription())))return type.cast(view);if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){T found=find(((ViewGroup)view).getChildAt(i),description,type);if(found!=null)return found;}return null;}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError("UI operation failed: "+causes(error.get()),error.get());return result.get();}
    private static String causes(Throwable error){StringBuilder result=new StringBuilder();Set<Throwable> seen=Collections.newSetFromMap(new IdentityHashMap<>());for(Throwable current=error;current!=null&&seen.add(current);current=current.getCause()){if(result.length()>0)result.append(" <- ");result.append(current);}return result.toString();}
    private static void require(boolean value,String label){if(!value)throw new AssertionError(label);}
}
