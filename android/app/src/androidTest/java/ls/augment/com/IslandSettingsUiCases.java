package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Uses production rows and click handlers with seeded in-memory values; never saves a setting. */
final class IslandSettingsUiCases {
    private static final String P=SystemUiOptions.PREFIX+"island_";
    private static final String ROUTE="group/notifications/island";
    private final Instrumentation test;
    private final Context context;
    private final JSONArray screenshots=new JSONArray(),measurements=new JSONArray();
    private Activity activity;
    private File directory;
    private Map<String,String> draft,originalDraft;
    private FieldEditQueue pending;
    private Map<String,View> controls;
    private int checks;
    private IslandSettingsUiCases(Instrumentation test){this.test=test;context=test.getTargetContext();}
    static JSONObject run(Instrumentation test)throws Exception{return new IslandSettingsUiCases(test).execute();}

    @SuppressWarnings("unchecked") private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Map<String,?> rawBefore=new LinkedHashMap<>(context.getSharedPreferences(AppConfig.PREFS,0).getAll());
        Map<String,?> memoryBefore=new LinkedHashMap<>(context.getSharedPreferences("native_value_overrides",0).getAll());
        try{
            activity=test.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                    .putExtra("target","notifications").putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle();
            float fontScale=activity.getResources().getConfiguration().fontScale;
            directory=new File(context.getExternalFilesDir(null),"island-settings-ui-"+BuildConfig.VERSION_CODE+"-font-"+String.format(Locale.ROOT,"%.2f",fontScale));
            require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
            main(()->{
                draft=(Map<String,String>)get(activity,"draft");pending=(FieldEditQueue)get(activity,"pending");
                controls=(Map<String,View>)get(activity,"controls");originalDraft=new LinkedHashMap<>(draft);
                require(ROUTE.equals(ModuleNavigation.route(activity)),"Island opens its single third-level page");
                for(String route:new String[]{"home","target-notifications",ROUTE})require(tag("breadcrumb:"+route)!=null,"Breadcrumb includes "+route);
                require(countTag(root(),"native-feature:systemui:island_enabled")==1,"Island has one master entry");
                require(tag("navigation:native-island-settings")!=null&&tag("navigation:native-island-settings").isShown(),"OEM settings entry is available without expanding Duo");
                require(pending.restorableValues().isEmpty(),"Browsing begins without pending writes");return null;
            });
            require("0".equals(ConfigSchema.defaultValue(SystemUiOptions.ISLAND_OFFSET_Y)),"New vertical offset defaults to centered");
            require("0".equals(ConfigSchema.defaultValue(SystemUiOptions.ISLAND_TRANSPARENT)),"New transparent style is opt-in");
            require("0".equals(ConfigSchema.defaultValue(SystemUiOptions.ISLAND_APP_STYLE)),"App display style preserves the rounded-square default");
            require(ConfigSchema.runtimeDefaults().containsKey(SystemUiOptions.ISLAND_OFFSET_Y)
                    &&ConfigSchema.runtimeDefaults().containsKey(SystemUiOptions.ISLAND_TRANSPARENT)
                    &&ConfigSchema.runtimeDefaults().containsKey(SystemUiOptions.ISLAND_APP_STYLE),"New island parameters reach the SystemUI configuration snapshot");
            measure("saved");capture("01-saved");unchanged(config,before,rawBefore,memoryBefore);
            checkNativeScenes();unchanged(config,before,rawBefore,memoryBefore);

            main(()->{
                draft.put(SystemUiOptions.ISLAND,"0");
                for(String suffix:new String[]{"music","notifications","charging"})draft.put(P+suffix,"1");
                draft.put(SystemUiOptions.ISLAND_TRANSPARENT,"0");
                draft.put(SystemUiOptions.ISLAND_APP_STYLE,"0");
                render();
                require(!master().isChecked()&&masterContent().getVisibility()==View.GONE,"Disabled master hides its settings");
                require(!arrow(master()).isEnabled(),"Disabled master cannot expand");
                for(String suffix:new String[]{"enabled","music","notifications","charging"}){
                    String key=P+suffix;
                    require(countTag(root(),"config:"+key)==1,"One switch owns "+key);
                    require(tag("config:"+key) instanceof Switch,"Boolean uses public switch: "+key);
                }
                require(all(root(),Spinner.class).size()==2,"Background and icon styles use shared choice spinners");
                require(all(root(),Spinner.class).contains(appStyle()),"App style has one mapped shared choice control");
                require(all(appStyleSection(),Switch.class).isEmpty(),"App style has no pseudo feature switch");
                require(!appStyle().isShown(),"Disabled master hides app display style");
                noPending();return null;
            });
            settle();measure("disabled");capture("02-disabled");
            main(()->{
                clickSeeded(SystemUiOptions.ISLAND,true);
                require(masterContent().getVisibility()==View.VISIBLE,"Enabling master expands configuration");
                for(String suffix:new String[]{"music","notifications","charging"})require(toggle(P+suffix).isShown(),"Activity source is reachable: "+suffix);
                require(control(SystemUiOptions.ISLAND_TRANSPARENT) instanceof Spinner&&control(SystemUiOptions.ISLAND_TRANSPARENT).isShown(),"Background style uses a reachable shared choice control");
                require(appStyleSection().isShown()&&text(appStyleSection(),"灵动岛显示样式")!=null,"App display style is a function row on the island page");
                require(appStyleContent().getVisibility()==View.GONE&&!appStyle().isShown(),"App display style options are folded by default");
                require("圆角方形".contentEquals(String.valueOf(appStyle().getSelectedItem())),"Folded app style retains the rounded-square default");
                require(text(root(),"有活动时出现 · 轻点打开 · 长按展开")!=null,"Real event and gesture behavior is stated in place");
                require(!control(P+"width").isShown(),"Geometry is folded by default");
                require(!control(P+"notice_seconds").isShown(),"Notification duration begins in its own fold");
                noPending();return null;
            });
            settle();measure("enabled");checkSwitchGeometry();capture("03-active-sources");

            for(int background:new int[]{1,2,0})selectBackgroundSeeded(background);

            checkAppStyleFold(false,0);capture("03a-app-style-collapsed");
            setAppStyleExpanded(true);checkAppStyleFold(true,0);checkAppStyle(0);capture("03b-app-style-expanded");
            selectAppStyleSeeded(1,"03c-app-style-choice-dialog");checkAppStyle(1);capture("03d-app-circle");
            setAppStyleExpanded(false);checkAppStyleFold(false,1);capture("03e-app-circle-collapsed");
            setAppStyleExpanded(true);checkAppStyleFold(true,1);
            selectAppStyleSeeded(0,null);checkAppStyle(0);
            selectAppStyleSeeded(1,null);checkAppStyle(1);

            main(()->{
                Switch notifications=toggle(P+"notifications");
                require(arrow(notifications).performClick(),"Notification duration expands from its source row");
                require(control(P+"notice_seconds").isShown(),"Notification duration appears under notifications");
                String duration=draft.get(P+"notice_seconds");
                clickSeeded(P+"notifications",false);
                require(!control(P+"notice_seconds").isShown()&&!arrow(notifications).isEnabled(),"Disabling notifications hides and locks their parameters");
                require(duration.equals(draft.get(P+"notice_seconds")),"Disabling notifications preserves duration");
                clickSeeded(P+"notifications",true);
                require(control(P+"notice_seconds").isShown(),"Re-enabling notifications reopens their parameters");
                noPending();return null;
            });
            settle();checkSwitchGeometry();capture("04-notification-duration");
            main(()->{
                Switch notifications=toggle(P+"notifications");
                require(arrow(notifications).performClick(),"Notification parameters collapse independently");
                require(notifications.isChecked()&&!control(P+"notice_seconds").isShown(),"Collapsing parameters keeps notification activity enabled");
                for(String suffix:new String[]{"music","charging"}){
                    clickSeeded(P+suffix,false);require(!toggle(P+suffix).isChecked(),"Source can be independently disabled: "+suffix);
                    require(master().isChecked()&&notifications.isChecked(),"Source switch preserves master and notifications: "+suffix);
                    clickSeeded(P+suffix,true);
                }
                View geometry=description(root(),"展开大小与位置");require(geometry!=null&&geometry.performClick(),"Geometry uses a single in-page fold");
                for(String suffix:new String[]{"width","height","offset_x","offset_y"})require(control(P+suffix).isShown(),"Geometry control is reachable: "+suffix);
                noPending();return null;
            });
            settle();capture("05-geometry-top");
            main(()->{
                View field=control(SystemUiOptions.ISLAND_OFFSET_Y);ScrollView scroll=scroll();
                View parent=field;
                while(parent!=scroll&&parent.getParent() instanceof View)parent=(View)parent.getParent();
                require(parent==scroll,"Last island input belongs to the public content scroll, not the adaptive rail");
                field.requestRectangleOnScreen(new Rect(0,0,field.getWidth(),field.getHeight()),true);return null;
            });
            settle();
            main(()->{
                View field=control(SystemUiOptions.ISLAND_OFFSET_Y);ScrollView scroll=scroll();
                Rect visible=new Rect(),viewport=new Rect();int[] point=new int[2];field.getLocationOnScreen(point);
                require(scroll.getGlobalVisibleRect(viewport),"Public island scroll viewport is physically visible");
                viewport.left+=scroll.getPaddingLeft();viewport.top+=scroll.getPaddingTop();
                viewport.right-=scroll.getPaddingRight();viewport.bottom-=scroll.getPaddingBottom();
                require(field.getGlobalVisibleRect(visible)&&visible.width()>=field.getWidth()-1&&visible.height()>=field.getHeight()-1,
                        "Last island input is fully visible after its own rectangle request");
                require(point[0]>=viewport.left-1&&point[1]>=viewport.top-1
                        &&point[0]+field.getWidth()<=viewport.right+1&&point[1]+field.getHeight()<=viewport.bottom+1,
                        "Vertical-offset input fits entirely inside the real on-screen content viewport");
                measurements.put(new JSONObject().put("state","geometry-bottom").put("lastInputFullyVisible",true)
                        .put("scrollY",scroll.getScrollY()).put("fieldTopPx",point[1]).put("fieldBottomPx",point[1]+field.getHeight())
                        .put("viewportTopPx",viewport.top).put("viewportBottomPx",viewport.bottom));return null;
            });
            capture("06-geometry-bottom");
            main(()->{
                float density=activity.getResources().getDisplayMetrics().density;
                for(String suffix:new String[]{"width","height","offset_x","offset_y","notice_seconds"}){
                    View field=control(P+suffix);require(field instanceof ParameterSlider,"Numeric parameter uses the shared slider: "+suffix);
                    ParameterSlider slider=(ParameterSlider)field;
                    require(slider.bar.getMax()>slider.bar.getMin(),"Slider has a usable device range: "+suffix);
                    if(field.isShown()){
                        require(((ParameterSeekBar)slider.bar).expandedTouchBounds().height()/density>=47.5f,"Slider extends a 48dp touch region: "+suffix);
                        measurements.put(new JSONObject().put("slider",suffix).put("min",slider.bar.getMin())
                                .put("max",slider.bar.getMax()).put("visualHeightDp",slider.bar.getHeight()/density).put("expandedTouchHeightDp",((ParameterSeekBar)slider.bar).expandedTouchBounds().height()/density));
                    }
                }return null;
            });
            main(()->{
                ScrollView scroll=scroll();scroll.scrollTo(0,0);
                require(arrow(master()).performClick(),"Master parameters collapse");
                require(master().isChecked()&&masterContent().getVisibility()==View.GONE,"Collapsing configuration leaves island enabled");
                require(arrow(master()).performClick(),"Master parameters reopen");
                Map<String,String> parameters=new LinkedHashMap<>();
                for(String suffix:new String[]{"width","height","offset_x","offset_y","transparent","app_style","notice_seconds","music","notifications","charging"})parameters.put(P+suffix,draft.get(P+suffix));
                clickSeeded(SystemUiOptions.ISLAND,false);
                require(masterContent().getVisibility()==View.GONE&&!arrow(master()).isEnabled(),"Disabling island collapses all settings");
                for(Map.Entry<String,String> entry:parameters.entrySet())require(entry.getValue().equals(draft.get(entry.getKey())),"Disabling island preserves "+entry.getKey());
                noPending();return null;
            });
            settle();measure("disabled-after-use");capture("07-disabled-preserves-values");
            main(()->{clickSeeded(SystemUiOptions.ISLAND,true);return null;});
            settle();measure("enabled-restored");checkAppStyle(1);capture("08-app-circle-restored");
            unchanged(config,before,rawBefore,memoryBefore);
            return new JSONObject().put("success",true).put("checks",checks).put("route",ROUTE)
                    .put("fontScale",fontScale).put("density",activity.getResources().getDisplayMetrics().density)
                    .put("settingsUnchanged",true).put("rawSettingsUnchanged",true).put("memoryUnchanged",true)
                    .put("measurements",measurements).put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        }finally{
            if(activity!=null)main(()->{
                if(originalDraft!=null){draft.clear();draft.putAll(originalDraft);}
                if(pending!=null){((Handler)get(activity,"main")).removeCallbacks((Runnable)get(activity,"autoSave"));for(String key:pending.restorableValues().keySet())pending.invalidate(key);}
                activity.finish();return null;
            });
            test.waitForIdleSync();unchanged(config,before,rawBefore,memoryBefore);
        }
    }

    private void checkNativeScenes()throws Exception{
        main(()->{
            require(!ConfigSchema.runtimeDefaults().containsKey("ls_augment_native_island_scenes"),"Scene diagnostic key remains outside configuration");
            draft.put(NativeIslandSceneOptions.ENABLED,"0");render();
            Switch master=toggle(NativeIslandSceneOptions.ENABLED);
            UiKit.Fold fold=(UiKit.Fold)get(activity,"nativeScenesFold");
            require(fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabled native scenes cannot expand");
            require(master.isEnabled(),"Physical native island is enabled for scene acceptance");
            clickSeeded(NativeIslandSceneOptions.ENABLED,true);
            require(fold.content.getVisibility()==View.VISIBLE,"Enabling native scenes expands individual choices");
            for(String id:NativeIslandSceneOptions.IDS){String key=NativeIslandSceneOptions.key(id);Switch child=toggle(key);
                String capability=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key+"_capability","");
                boolean sourceRequired=java.util.Arrays.asList("transfer","nfc_transfer","calendar_meeting","scenic_guide","nearby_charging","cycling","flight","preflight_battery","weather_travel").contains(id);
                String source=context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key+"_source_capability","");
                require(child.isEnabled()==("ready".equals(capability)&&(!sourceRequired||("ready:"+BuildConfig.VERSION_CODE).equals(source))),"Scene control matches host and source capability: "+id);
                if(child.isEnabled()){boolean value=child.isChecked();clickSeeded(key,!value);clickSeeded(key,value);}
            }
            require(fold.arrow.performClick(),"Native scenes collapse through public arrow");
            Method refresh=activity.getClass().getDeclaredMethod("refreshNativeSceneGate");refresh.setAccessible(true);refresh.invoke(activity);
            require(master.isChecked()&&fold.content.getVisibility()==View.GONE,"Capability refresh preserves collapsed enabled scenes");
            fold.arrow.performClick();noPending();return null;
        });
        settle();capture("01a-native-scenes-top");
        main(()->{scroll().fullScroll(View.FOCUS_DOWN);return null;});capture("01b-native-scenes-bottom");
        main(()->{
            UiKit.Fold fold=(UiKit.Fold)get(activity,"nativeScenesFold");
            clickSeeded(NativeIslandSceneOptions.ENABLED,false);
            require(fold.content.getVisibility()==View.GONE&&!fold.arrow.isEnabled(),"Disabling native scenes closes parameters");
            draft.clear();draft.putAll(originalDraft);render();scroll().scrollTo(0,0);noPending();return null;
        });settle();
    }

    private void clickSeeded(String key,boolean enabled){
        Switch control=toggle(key);require(control.isChecked()!=enabled,"State transition is exercised: "+key);
        draft.put(key,enabled?"1":"0");
        // CompoundButton toggles and delivers OnCheckedChangeListener before
        // returning View.performClick's result. Without an OnClickListener that
        // result may be false even though the user's switch action succeeded.
        control.performClick();
        require(control.isChecked()==enabled,"Production switch handler reaches requested state: "+key);
        noPending();
    }
    private void noPending(){require(pending.restorableValues().isEmpty(),"In-memory interaction queues no configuration write");}
    private void setAppStyleExpanded(boolean expanded)throws Exception{
        main(()->{
            String value=draft.get(SystemUiOptions.ISLAND_APP_STYLE);
            require((appStyleContent().getVisibility()==View.VISIBLE)!=expanded,"App style exercises a real fold transition");
            require(appStyleArrow().performClick(),"App style uses the public fold arrow");
            require(value.equals(draft.get(SystemUiOptions.ISLAND_APP_STYLE)),"Folding app style preserves its selected value");
            noPending();return null;
        });
        settle();
    }
    private void checkAppStyleFold(boolean expanded,int selection)throws Exception{main(()->{
        require((appStyleContent().getVisibility()==View.VISIBLE)==expanded,"App style options have the requested fold state");
        require(appStyle().isShown()==expanded,"Only expanding app style reveals its value action");
        require(String.valueOf(selection).equals(draft.get(SystemUiOptions.ISLAND_APP_STYLE)),"Expanding or collapsing app style does not change its value");
        String action=(expanded?"收起":"展开")+"灵动岛显示样式";
        require(action.contentEquals(appStyleArrow().getContentDescription()),"App style arrow describes its fold action");
        require(appStyleArrow().getRotation()==(expanded?180f:0f),"App style arrow tracks its expanded state");
        noPending();return null;
    });}
    private void selectAppStyleSeeded(int selection,String screenshotName)throws Exception{
        main(()->{Spinner choice=appStyle();require(choice.isShown(),"App style action is reachable before selection");
            choice.requestRectangleOnScreen(new Rect(0,0,choice.getWidth(),choice.getHeight()),true);return null;});
        settle();
        Dialog dialog=main(()->{
            Spinner choice=appStyle();int current=Integer.parseInt(draft.get(SystemUiOptions.ISLAND_APP_STYLE));
            require(current!=selection,"App style exercises a real transition");
            require(choice.performClick(),"App style opens the public choice dialog");
            Dialog shown=(Dialog)get(choice,"selectionDialog");require(shown!=null&&shown.isShowing(),"App style uses the common glass choice dialog");
            View body=shown.getWindow().getDecorView();
            require(text(body,"灵动岛显示样式")!=null,"Choice dialog has the requested feature name");
            for(int index=0;index<2;index++){
                View row=body.findViewWithTag("choice-option:"+index);require(row!=null,"Choice dialog has option "+index);
                String label=index==0?"圆角方形":"圆形";
                if(index==current)label+=" · 当前";
                require(text(row,label)!=null,"Choice dialog labels its current app style: "+label);
            }
            require(body.findViewWithTag("choice-option:2")==null,"Choice dialog does not invent additional styles");
            require(all(body,Spinner.class).isEmpty()&&all(body,Switch.class).isEmpty(),"Choice dialog contains two public option rows without extra switches or selectors");
            noPending();return shown;
        });
        try{
            settleDialog(dialog);
            if(screenshotName!=null)capturePhysical(screenshotName);
            main(()->{
                // Seed the target before invoking the production click handler, so
                // its callback refreshes the value without queuing a configuration write.
                draft.put(SystemUiOptions.ISLAND_APP_STYLE,String.valueOf(selection));
                View row=dialog.getWindow().getDecorView().findViewWithTag("choice-option:"+selection);
                require(row.performClick(),"Requested app style can be selected in the public dialog");
                require(!dialog.isShowing(),"Selecting app style closes the dialog");return null;
            });
        }finally{main(()->{if(dialog.isShowing())dialog.dismiss();return null;});}
        settle();
    }
    private void checkAppStyle(int selection)throws Exception{
        main(()->{Spinner choice=appStyle();choice.requestRectangleOnScreen(new Rect(0,0,choice.getWidth(),choice.getHeight()),true);return null;});
        settle();main(()->{
        Spinner choice=appStyle();String label=selection==0?"圆角方形":"圆形";
        require(choice.isShown(),"App style exposes its value only inside the expanded function");
        require(String.valueOf(selection).equals(draft.get(SystemUiOptions.ISLAND_APP_STYLE)),"App style retains its in-memory configuration value");
        require(label.equals(String.valueOf(choice.getSelectedItem())),"App style action displays its current choice: "+label);
        float density=activity.getResources().getDisplayMetrics().density;
        float expectedTextPx=TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,UiKit.compactTextSize(14f),activity.getResources().getDisplayMetrics());
        UiKit ui=(UiKit)get(activity,"ui");TextView title=text(appStyleSection(),"灵动岛显示样式");
        require(Math.abs(((TextView)choice.getSelectedView()).getTextSize()-expectedTextPx)<.5f,"App style value uses the public compact 14sp button typography");
        require(title!=null&&((TextView)choice.getSelectedView()).getTextSize()<=title.getTextSize(),"App style value is no larger than its feature title");
        require(((TextView)choice.getSelectedView()).getCurrentTextColor()==ui.text,"App style value uses the public text color");
        require(choice.getHeight()/density>=47.5f,"App style retains the common 48dp selection touch target");
        require(Math.abs(appStyleContent().getPaddingLeft()/density-12f)<1,"App style value uses the common 12dp expanded-content indent");
        List<Spinner> actions=all(appStyleContent(),Spinner.class);
        require(actions.size()==1&&actions.get(0)==choice,"Expanded app style contains only its current-value action");
        Rect visible=new Rect();require(choice.getGlobalVisibleRect(visible)&&visible.height()>=choice.getHeight()-1,"App style value is fully visible in its screenshot");
        measurements.put(new JSONObject().put("state","app-style-"+selection).put("label",label)
                .put("buttonHeightDp",choice.getHeight()/density).put("contentIndentDp",appStyleContent().getPaddingLeft()/density)
                .put("textSizePx",((TextView)choice.getSelectedView()).getTextSize()).put("expectedTextSizePx",expectedTextPx)
                .put("titleTextSizePx",title.getTextSize()).put("textUsesThemeColor",true));
        noPending();return null;
    });}
    private void unchanged(AppConfig config,Map<String,String> before,Map<String,?> rawBefore,Map<String,?> memoryBefore){
        require(before.equals(config.snapshot()),"All saved settings remain unchanged");
        require(rawBefore.equals(context.getSharedPreferences(AppConfig.PREFS,0).getAll()),"Raw configuration storage remains unchanged");
        require(memoryBefore.equals(context.getSharedPreferences("native_value_overrides",0).getAll()),"Per-feature memory remains unchanged");
    }
    private void measure(String state)throws Exception{main(()->{
        View path=tag("page-path"),card=tag("application-category:notifications:island");
        require(path!=null&&card!=null,"Common breadcrumb and preference card exist");
        float density=activity.getResources().getDisplayMetrics().density;
        float gap=(top(card)-top(path)-path.getHeight())/density;
        require(gap>=7.5f&&gap<=12.5f,"Navigation-to-card gap is 8–12dp: "+state+" = "+gap);
        measurements.put(new JSONObject().put("state",state).put("contentGapDp",gap));return null;
    });}
    private void checkSwitchGeometry()throws Exception{main(()->{
        float density=activity.getResources().getDisplayMetrics().density,low=Float.MAX_VALUE,high=-Float.MAX_VALUE;
        View styleArrow=appStyleArrow(),styleHelp=description(appStyleSection(),"查看灵动岛显示样式说明");
        require(styleHelp instanceof ImageButton,"App style uses the public feature-help action");
        ViewGroup styleHead=(ViewGroup)appStyleSection().getChildAt(0);
        require(styleHead.getHeight()/density>=43.5f,"App style header retains the public 44dp function-row touch target");
        require(Math.abs(styleArrow.getWidth()/density-25)<1&&Math.abs(styleArrow.getHeight()/density-44)<1,"App style has the common 25 by 44dp fold column");
        require(Math.abs(styleHelp.getWidth()/density-25)<1&&Math.abs(styleHelp.getHeight()/density-44)<1,"App style has the common 25 by 44dp help column");
        for(String suffix:new String[]{"enabled","music","notifications","charging"}){
            Switch control=toggle(P+suffix);ViewGroup row=(ViewGroup)control.getParent();
            require(row.getHeight()/density>=43.5f,"Switch row retains 44dp touch target: "+suffix);
            require(Math.abs(control.getWidth()/density-46)<1,"Switch uses common 46dp width: "+suffix);
            int[] position=new int[2];control.getLocationInWindow(position);float switchRight=(position[0]+control.getWidth())/density;
            low=Math.min(low,switchRight);high=Math.max(high,switchRight);
            View tail=row.getChildAt(row.getChildCount()-1);require(Math.abs(tail.getWidth()/density-25)<1,"Action column retains common 25dp width: "+suffix);
            View help=description(row,"查看"+control.getContentDescription()+"说明");
            require(help!=null&&Math.abs(right(help)-right(styleHelp))/density<=1,"App style help aligns with the public feature-help column: "+suffix);
            require(Math.abs(right(tail)-right(styleArrow))/density<=1,"App style fold arrow aligns with the public trailing column: "+suffix);
        }
        require(high-low<=1,"Master and source switches share a trailing column: "+(high-low));return null;
    });}
    private void render()throws Exception{Method method=activity.getClass().getDeclaredMethod("render",int.class);method.setAccessible(true);method.invoke(activity,0);}
    private void selectBackgroundSeeded(int selection)throws Exception{
        Dialog dialog=main(()->{
            Spinner choice=(Spinner)control(SystemUiOptions.ISLAND_TRANSPARENT);
            require(choice.performClick(),"Background selector opens its shared dialog");
            Dialog shown=(Dialog)get(choice,"selectionDialog");
            require(shown!=null&&shown.isShowing(),"Background uses the common glass choice dialog");return shown;
        });
        try{
            settleDialog(dialog);
            main(()->{
                String[] labels={"经典黑色","透明","液态玻璃"};
                for(int index=0;index<labels.length;index++)require(dialog.getWindow().getDecorView().findViewWithTag("choice-option:"+index)!=null,"Background option exists: "+labels[index]);
                draft.put(SystemUiOptions.ISLAND_TRANSPARENT,String.valueOf(selection));
                require(dialog.getWindow().getDecorView().findViewWithTag("choice-option:"+selection).performClick(),"Background choice selects");
                require(((Spinner)control(SystemUiOptions.ISLAND_TRANSPARENT)).getSelectedItemPosition()==selection,"Background selection updates");
                require(master().isChecked()&&toggle(P+"music").isChecked(),"Background style preserves enabled sources");
                noPending();return null;
            });
        }finally{main(()->{if(dialog.isShowing())dialog.dismiss();return null;});}
        settle();
    }
    private View root(){return activity.getWindow().getDecorView();}
    private View tag(String key){return root().findViewWithTag(key);}
    private Switch toggle(String key){View view=tag("config:"+key);require(view instanceof Switch,"Switch exists: "+key);return (Switch)view;}
    private Switch master(){return toggle(SystemUiOptions.ISLAND);}
    private Spinner appStyle(){View view=control(SystemUiOptions.ISLAND_APP_STYLE);require(view instanceof Spinner,"App display style uses the public choice spinner");return (Spinner)view;}
    private ViewGroup appStyleSection(){View view=tag("island-app-style-section");require(view instanceof ViewGroup,"App style uses the public parameter section");return (ViewGroup)view;}
    private ViewGroup appStyleContent(){View view=tag("island-app-style-options");require(view instanceof ViewGroup,"App style options belong to its fold content");return (ViewGroup)view;}
    private ImageButton appStyleArrow(){ViewGroup row=(ViewGroup)appStyleSection().getChildAt(0);View view=row.getChildAt(row.getChildCount()-1);require(view instanceof ImageButton,"App style uses the public fold arrow");return (ImageButton)view;}
    private View masterContent(){return ((ViewGroup)tag("native-feature:systemui:island_enabled")).getChildAt(1);}
    private View control(String key){View view=controls.get(key);require(view!=null,"Parameter exists: "+key);return view;}
    private ScrollView scroll(){View view=tag("detail-scroll");require(view instanceof ScrollView,"Public detail content scroll exists");return (ScrollView)view;}
    private ImageButton arrow(Switch control){ViewGroup row=(ViewGroup)control.getParent();View view=row.getChildAt(row.getChildCount()-1);require(view instanceof ImageButton,"Public fold arrow exists");return (ImageButton)view;}
    private static float top(View view){int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private float right(View view){
        Rect visible=new Rect();require(view.getGlobalVisibleRect(visible),"Aligned feature action is physically visible");
        // Window positions map the local origin through the view's transform.
        // An expanded arrow rotates 180 degrees, so origin + width is not its
        // actual right edge. Measure the transformed visible rectangle instead.
        return visible.right;
    }
    private static TextView text(View view,String label){if(view instanceof TextView&&label.contentEquals(((TextView)view).getText()))return (TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=text(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;}
    private static View description(View view,String label){if(label.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=description(((ViewGroup)view).getChildAt(i),label);if(found!=null)return found;}return null;}
    private static int countTag(View view,String label){int count=label.equals(view.getTag())?1:0;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)count+=countTag(((ViewGroup)view).getChildAt(i),label);return count;}
    private static <T extends View>List<T> all(View view,Class<T> type){List<T> found=new ArrayList<>();if(type.isInstance(view))found.add(type.cast(view));if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)found.addAll(all(((ViewGroup)view).getChildAt(i),type));return found;}
    private static Object get(Object object,String name)throws Exception{Field field=object.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(object);}
    private void settle()throws Exception{
        test.waitForIdleSync();long deadline=SystemClock.uptimeMillis()+3000;
        while(!main(()->activity.hasWindowFocus()&&root().isShown())){
            require(SystemClock.uptimeMillis()<deadline,"Island window is foreground before measuring");SystemClock.sleep(30);
        }
        CountDownLatch frames=new CountDownLatch(1);
        main(()->{root().postDelayed(()->root().postOnAnimation(()->root().postOnAnimation(frames::countDown)),300);return null;});
        require(frames.await(3,TimeUnit.SECONDS),"Page transitions and layout settled");test.waitForIdleSync();
    }
    private void capture(String name)throws Exception{
        settle();capturePhysical(name);
    }
    private void settleDialog(Dialog dialog)throws Exception{
        test.waitForIdleSync();long deadline=SystemClock.uptimeMillis()+3000;
        while(!main(()->dialog.isShowing()&&dialog.getWindow().getDecorView().hasWindowFocus())){
            require(SystemClock.uptimeMillis()<deadline,"App style choice dialog is foreground before capture");SystemClock.sleep(30);
        }
        CountDownLatch frames=new CountDownLatch(1);
        main(()->{View decor=dialog.getWindow().getDecorView();decor.postDelayed(()->decor.postOnAnimation(()->decor.postOnAnimation(frames::countDown)),300);return null;});
        require(frames.await(3,TimeUnit.SECONDS),"App style choice-dialog layout settled");test.waitForIdleSync();
    }
    private void capturePhysical(String name)throws Exception{
        Bitmap bitmap=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();
        require(bitmap!=null,"Physical device screenshot is available");File output=new File(directory,name+".png");
        try(FileOutputStream out=new FileOutputStream(output)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,out),"Screenshot encoded");}
        finally{bitmap.recycle();}screenshots.put(output.getAbsolutePath());
    }
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable error){failure.set(error);}});if(failure.get()!=null)throw new AssertionError("Island UI action failed",failure.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
}
