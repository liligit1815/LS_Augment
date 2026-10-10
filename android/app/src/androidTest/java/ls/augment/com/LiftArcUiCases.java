package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.Button;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real page geometry with memory-only previews: never invokes a setting mutation. */
final class LiftArcUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String ROUTE="group/lockscreen/liftarc";
    private final DeviceRegressionRunner runner;
    private final Context context;
    private final boolean strict;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray layouts=new JSONArray(),screenshots=new JSONArray(),violations=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private int checks;
    private int editorContracts;
    private boolean draftsRestored=true;
    private LiftArcUiCases(DeviceRegressionRunner runner,Bundle arguments){
        this.runner=runner;context=runner.getTargetContext();
        strict=Boolean.parseBoolean(arguments.getString("strict","true"));
    }
    static JSONObject run(DeviceRegressionRunner runner,Bundle arguments)throws Exception{
        return new LiftArcUiCases(runner,arguments).execute();
    }
    private JSONObject execute()throws Exception{
        SharedPreferences preferences=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> before=copy(preferences.getAll());
        directory=new File(context.getExternalFilesDir(null),"liftarc-ui");
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
        Application application=(Application)context.getApplicationContext();
        application.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        try{
            scenario("01-normal",false,false);
            scenario("02-large-font",true,false);
            scenario("03-landscape",false,true);
        }catch(Throwable error){failure=error;}
        finally{
            try{main(()->{for(Activity page:new ArrayList<>(activities))if(!page.isDestroyed()&&!page.isFinishing())page.finish();return null;});runner.waitForIdleSync();}
            catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            application.unregisterActivityLifecycleCallbacks(this);
        }
        boolean unchanged=before.equals(preferences.getAll());
        if(!unchanged&&failure==null)failure=new AssertionError("UI inspection changed persisted configuration");
        boolean compliant=violations.length()==0;
        JSONObject report=new JSONObject().put("version",BuildConfig.VERSION_NAME).put("versionCode",BuildConfig.VERSION_CODE)
                .put("success",failure==null&&(!strict||compliant)).put("compliant",compliant).put("strict",strict)
                .put("checks",checks).put("inMemoryPreview",true).put("configurationUnchanged",unchanged)
                .put("draftsRestored",draftsRestored).put("numericInputsRemoved",editorContracts==3).put("pageDefaultActionsRemoved",editorContracts==3)
                .put("configurationKeysBefore",before.size()).put("configurationKeysAfter",preferences.getAll().size())
                .put("featureEfficacyChecked",false).put("systemDisplaySettingsChanged",false)
                .put("layouts",layouts).put("screenshots",screenshots).put("violations",violations)
                .put("directory",directory.getAbsolutePath());
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("LiftArc UI-only checks failed; inspect "+directory,failure);
        if(strict&&!compliant)throw new AssertionError("LiftArc UI geometry violations; inspect "+directory);
        return report;
    }
    private void scenario(String name,boolean large,boolean landscape)throws Exception{
        Activity page=runner.startActivitySync(new Intent(context,EnhancementSettingsActivity.class)
                .putExtra("group","liftarc").putExtra("target","lockscreen")
                .putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        Configuration originalConfiguration=null;DisplayMetrics originalMetrics=null;
        Activity launched=page;
        int originalOrientation=main(()->pageOrientation(launched));
        Map<String,String> originalDraft=null;LiftArcSettingsEditor editor=null;
        try{
            settle();
            if(landscape){
                Activity original=page;
                main(()->{original.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
                page=awaitLandscape(original);settle();
            }
            Activity owner=page;
            if(large){
                originalConfiguration=main(()->new Configuration(owner.getResources().getConfiguration()));
                originalMetrics=main(()->{DisplayMetrics metrics=new DisplayMetrics();metrics.setTo(owner.getResources().getDisplayMetrics());return metrics;});
                main(()->{
                    Configuration enlarged=new Configuration(owner.getResources().getConfiguration());
                    enlarged.fontScale=Math.max(1.5f,enlarged.fontScale);
                    // Temporary Resources configuration; no Settings.Global/System write.
                    owner.getResources().updateConfiguration(enlarged,owner.getResources().getDisplayMetrics());
                    set(owner,"ui",new UiKit(owner));invoke(owner,"render",new Class<?>[]{int.class},0);return null;
                });settle();
            }
            editor=main(()->(LiftArcSettingsEditor)get(owner,"liftArcEditor"));
            require(editor!=null,"Production lockscreen swipe editor exists");
            LiftArcSettingsEditor previewEditor=editor;
            originalDraft=main(()->new LinkedHashMap<>(draft(owner)));
            main(()->{
                // Cancel the live reader before any fixture is seeded. The editor remains
                // drawable, while an old background reply can no longer override it.
                previewEditor.onDestroy();
                for(View view:all(owner.getWindow().getDecorView())){
                    if(view instanceof Switch)((Switch)view).setOnCheckedChangeListener(null);
                    if(view instanceof Spinner)((Spinner)view).setOnItemSelectedListener(null);
                }
                require(pending(owner).isEmpty()&&pending(owner).restorableValues().isEmpty(),"Opening queues no configuration write");
                return null;
            });
            measure(owner,editor,name+"-actual",large,landscape);capture(owner,name+"-actual");
            seed(owner,editor);settle();
            main(()->{expandTools(previewEditor);scroll(owner).scrollTo(0,0);return null;});settle();
            checkEditors(owner,editor,name);
            measure(owner,editor,name+"-expanded-preview",large,landscape);capture(owner,name+"-expanded-preview");
            checkFolds(owner,editor,name);settle();
            // The intentionally rejected disabled-fold action emits a short toast.
            // Wait only here so the bottom evidence captures unobscured controls.
            SystemClock.sleep(2500);runner.waitForIdleSync();
            main(()->{
                View last=owner.getWindow().getDecorView().findViewWithTag("liftarc-input:hint_offset_x");
                SeekBar field=find(last,SeekBar.class);require(field!=null,"Final text position slider exists without a numeric input");
                field.requestRectangleOnScreen(new Rect(0,0,field.getWidth(),field.getHeight()),true);return null;
            });settle();
            main(()->{
                SeekBar field=find(owner.getWindow().getDecorView().findViewWithTag("liftarc-input:hint_offset_x"),SeekBar.class);
                Rect visible=new Rect();observe(field.getGlobalVisibleRect(visible)&&visible.height()>=field.getHeight()-1,
                        name,"Final parameter remains fully reachable",new JSONObject().put("heightPx",field.getHeight()).put("visiblePx",visible.height()));
                return null;
            });capture(owner,name+"-bottom-preview");
            main(()->{require(pending(owner).isEmpty()&&pending(owner).restorableValues().isEmpty(),"Memory preview schedules no save");return null;});
        }finally{
            Activity owner=page;Map<String,String> restoreDraft=originalDraft;
            Configuration restoreConfiguration=originalConfiguration;DisplayMetrics restoreMetrics=originalMetrics;
            main(()->{
                if(restoreDraft!=null){draft(owner).clear();draft(owner).putAll(restoreDraft);draftsRestored&=restoreDraft.equals(draft(owner));require(draftsRestored,"Original page draft is restored before closing");}
                if(restoreConfiguration!=null)owner.getResources().updateConfiguration(restoreConfiguration,restoreMetrics);
                if(!owner.isDestroyed()){
                    owner.setRequestedOrientation(originalOrientation);owner.finish();
                }
                return null;
            });settle();
        }
    }
    private void seed(Activity page,LiftArcSettingsEditor editor)throws Exception{main(()->{
        Map<String,String> values=draft(page);
        for(String suffix:new String[]{"enabled","show_handle","flick_unlock","arc_enabled","blur_enabled","glass_live"})values.put(LiftArcOptions.key(suffix),"1");
        values.put(LiftArcOptions.key("arc_dim"),"0");values.put(LiftArcOptions.key("parallax"),"0");
        JSONObject runtime=new JSONObject().put("state","ready").put("build",BuildConfig.VERSION_CODE)
                .put("installed",true).put("gesture",true).put("arc",true).put("blur",true).put("glass",true)
                .put("configChecksum",((AppConfig)get(page,"config")).configSnapshot().checksum)
                .put("observedAt",System.currentTimeMillis()).put("observedElapsed",SystemClock.elapsedRealtime());
        set(editor,"runtime",runtime);set(editor,"runtimeCurrent",true);setOptional(editor,"runtimeFresh",true);
        invoke(editor,"sync",new Class<?>[0]);
        return null;
    });}
    private void expandTools(LiftArcSettingsEditor editor)throws Exception{
        UiKit.Fold master=(UiKit.Fold)get(editor,"masterFold");master.show(true);
        for(Object fold:((Map<?,?>)get(editor,"folds")).values())((UiKit.Fold)fold).show(true);
        for(View view:all(editor.view()))if(view.getContentDescription()!=null
                &&view.getContentDescription().toString().startsWith("展开")&&view.isEnabled())view.performClick();
    }
    @SuppressWarnings("unchecked")
    private void checkEditors(Activity page,LiftArcSettingsEditor editor,String name)throws Exception{main(()->{
        Map<String,SeekBar> sliders=(Map<String,SeekBar>)get(editor,"sliders");
        Map<String,String> original=new LinkedHashMap<>(draft(page));JSONArray ranges=new JSONArray();
        try{
            int numericCount=0;
            for(EnhancementOption option:LiftArcOptions.options())if(option.kind==EnhancementOption.Kind.INTEGER||option.kind==EnhancementOption.Kind.DECIMAL){
                numericCount++;String suffix=option.key.substring(LiftArcOptions.PREFIX.length());SeekBar slider=sliders.get(suffix);
                View row=editor.view().findViewWithTag("liftarc-input:"+suffix);
                require(slider!=null&&countTag(row,"liftarc-slider:"+suffix)==1,"Every numeric setting has one slider");
                require(find(row,EditText.class)==null,"Numeric slider has no duplicate input");
                require(slider.getMax()==("hint_weight".equals(suffix)?8:1000),"Existing slider tick count is preserved");
                String low=(String)invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},suffix,0);
                String high=(String)invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},suffix,slider.getMax());
                require(Math.abs(Double.parseDouble(low)-option.minimum)<1e-8&&Math.abs(Double.parseDouble(high)-option.maximum)<1e-8,"Slider endpoints match the configuration range");
                String midpoint=(String)invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},suffix,slider.getMax()/2);
                require(option.normalize(midpoint)!=null,"Slider midpoint remains a valid configuration value");
                TextView label=(TextView)row.findViewWithTag("liftarc-value:"+suffix);
                String expectedUnit=unit(suffix);
                require(label!=null&&label.getText().toString().contains("范围")
                        &&(expectedUnit.isEmpty()||label.getText().toString().contains(expectedUnit)),"Slider keeps the live value, range and unit");
                if("hint_weight".equals(suffix))for(int tick=0;tick<=8;tick++)require(String.valueOf(100+tick*100).equals(invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},suffix,tick)),"Font weight retains 100-point steps");
                else{
                    boolean hundredths=suffix.endsWith("alpha")||suffix.endsWith("strength")||suffix.startsWith("glass_")||"drag_ratio".equals(suffix);
                    String next=(String)invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},suffix,1);
                    require(option.normalize(next)!=null&&new java.math.BigDecimal(next).scale()<=(hundredths?2:1),"Slider keeps its original decimal precision");
                }
                ranges.put(new JSONObject().put("key",option.key).put("minimum",option.minimum).put("maximum",option.maximum)
                        .put("ticks",slider.getMax()).put("tickStepBeforeRounding",(option.maximum-option.minimum)/slider.getMax())
                        .put("unit",expectedUnit).put("minimumValue",low).put("maximumValue",high).put("midpointValue",midpoint));
                draft(page).put(option.key,low);
            }
            require(sliders.size()==numericCount,"Slider coverage matches every numeric setting");
            invoke(editor,"sync",new Class<?>[0]);
            for(Map.Entry<String,SeekBar> item:sliders.entrySet()){
                require(item.getValue().getProgress()==0,"Imported minimum is reflected by slider position without saving");
                TextView label=(TextView)editor.view().findViewWithTag("liftarc-value:"+item.getKey());
                require(label.getText().toString().startsWith(display(item.getKey(),LiftArcOptions.option(item.getKey()).minimum)+" ·"),"Live value reflects the minimum draft");
            }
            for(Map.Entry<String,SeekBar> item:sliders.entrySet())draft(page).put(LiftArcOptions.key(item.getKey()),(String)invoke(editor,"sliderValue",new Class<?>[]{String.class,int.class},item.getKey(),item.getValue().getMax()));
            invoke(editor,"sync",new Class<?>[0]);
            for(Map.Entry<String,SeekBar> item:sliders.entrySet()){
                require(item.getValue().getProgress()==item.getValue().getMax(),"Imported maximum is reflected by slider position without saving");
                TextView label=(TextView)editor.view().findViewWithTag("liftarc-value:"+item.getKey());
                require(label.getText().toString().startsWith(display(item.getKey(),LiftArcOptions.option(item.getKey()).maximum)+" ·"),"Live value reflects the maximum draft");
            }
            for(View control:all(editor.view())){
                if(control instanceof EditText)require((((EditText)control).getInputType()&android.text.InputType.TYPE_MASK_CLASS)!=android.text.InputType.TYPE_CLASS_NUMBER,"Page contains no numeric text input");
                if(control instanceof Button)require(!((Button)control).getText().toString().contains("恢复"),"Page contains no restore-default action");
                if(control instanceof TextView&&!(control instanceof EditText))require(!((TextView)control).getText().toString().contains("提示文字留空，锁屏中隐藏")&&!((TextView)control).getText().toString().contains("留空即隐藏文字"),"Removed hint note is absent from page text");
            }
            for(String suffix:new String[]{"hint_text","arc_color","hint_color"})require(find(editor.view().findViewWithTag("liftarc-input:"+suffix),EditText.class)!=null,"Nonduplicate text and color inputs remain");
            require(find(editor.view().findViewWithTag("liftarc-input:hint_font"),Spinner.class)!=null,"Font choice remains");
            require(find(editor.view().findViewWithTag("liftarc-binary:arc_dim"),Spinner.class)!=null&&find(editor.view().findViewWithTag("liftarc-binary:dim_upper"),Spinner.class)!=null,"Boundary style and effect position choices remain");
            draft(page).put(LiftArcOptions.key("hint_text"),"");invoke(editor,"sync",new Class<?>[0]);
            TextView hint=(TextView)editor.view().findViewWithTag("liftarc-hint-preview");
            require(hint.getText().length()==0&&hint.getVisibility()==View.GONE&&editor.view().findViewWithTag("liftarc-hint-preview-title").getVisibility()==View.GONE,"Empty hint adds no replacement note or preview caption");
            require(editor.view().findViewWithTag("liftarc-input:hint_text").isShown(),"Hint text editor remains available when empty");
            draft(page).put(LiftArcOptions.key("hint_text"),"锁屏文字样式预览");invoke(editor,"sync",new Class<?>[0]);
            require("锁屏文字样式预览".contentEquals(hint.getText())&&hint.getVisibility()==View.VISIBLE,"Nonempty hint retains the style preview");
            require(pending(page).isEmpty()&&pending(page).restorableValues().isEmpty(),"Slider range and text previews queue no save");
            layouts.put(new JSONObject().put("state",name+"-slider-contract").put("inMemoryPreview",true)
                    .put("numericInputs",0).put("restoreDefaultActions",0).put("numericSliders",numericCount).put("sliders",ranges)
                    .put("hintTextRetained",true).put("emptyHintNoteAbsent",true));
            editorContracts++;
        }finally{draft(page).clear();draft(page).putAll(original);invoke(editor,"sync",new Class<?>[0]);expandTools(editor);require(original.equals(draft(page)),"Inspection restores every memory-only parameter draft");}
        return null;
    });}
    private static String unit(String suffix){
        if(suffix.endsWith("alpha")||suffix.endsWith("strength")||"drag_ratio".equals(suffix)||java.util.Arrays.asList("glass_opacity","glass_diffuse","glass_refract","glass_edge_ref","glass_refract_w","glass_fresnel","glass_highlight").contains(suffix))return "%";
        if(java.util.Arrays.asList("arc_width","glass_thick","hint_gap","hint_offset_x").contains(suffix))return "dp";
        if("flick_velocity".equals(suffix))return "dp/s";if("unlock_ms".equals(suffix))return "ms";
        if("glass_blur".equals(suffix))return "px";if("hint_size".equals(suffix))return "sp";
        return "glass_hl_width".equals(suffix)?"倍":"";
    }
    private static String display(String suffix,double n){String unit=unit(suffix);return "%".equals(unit)?Math.round(n*100)+"%":java.math.BigDecimal.valueOf(n).stripTrailingZeros().toPlainString()+(unit.isEmpty()?"":" "+unit);}
    private void checkFolds(Activity page,LiftArcSettingsEditor editor,String name)throws Exception{main(()->{
        UiKit.Fold master=(UiKit.Fold)get(editor,"masterFold");
        master.show(false);require(master.control.isChecked()&&master.content.getVisibility()==View.GONE,"Manual collapse preserves enabled memory state");
        master.arrow.performClick();require(master.content.getVisibility()==View.VISIBLE,"Enabled feature can expand in place");
        master.control.setChecked(false);master.sync();master.arrow.performClick();
        require(!master.control.isChecked()&&master.content.getVisibility()==View.GONE,"Disabled feature refuses expansion");
        invoke(editor,"sync",new Class<?>[0]);expandTools(editor);
        Map<String,String> values=draft(page);values.put(LiftArcOptions.key("show_handle"),"0");invoke(editor,"sync",new Class<?>[0]);
        UiKit.Fold alpha=(UiKit.Fold)((Map<?,?>)get(editor,"folds")).get("show_handle");
        require(alpha.content.getVisibility()==View.GONE,"Hidden indicator collapses only its opacity");
        require(page.getWindow().getDecorView().findViewWithTag("liftarc-input:hint_text").isShown(),"Hint text editor remains independent of indicator visibility");
        View drag=page.getWindow().getDecorView().findViewWithTag("liftarc-input:drag_ratio");
        require(drag.isShown(),"Gesture range remains available with parallax off");
        values.put(LiftArcOptions.key("show_handle"),"1");invoke(editor,"sync",new Class<?>[0]);expandTools(editor);
        require(ColorEditorDialog.parse("#123456",0xA0FFEEDD)==0xA0123456,"Six-digit RGB preserves alpha and replaces RGB");
        require(ColorEditorDialog.parse("#55123456",0xA0FFEEDD)==0x55123456,"Eight-digit ARGB replaces all channels");
        layouts.put(new JSONObject().put("state",name+"-fold-semantics").put("inMemoryPreview",true)
                .put("collapsePreservesEnabled",true).put("disabledCannotExpand",true)
                .put("hintIndependent",true).put("parallaxDoesNotGateGestures",true).put("colorAlphaPreserved",true));
        return null;
    });}
    private void measure(Activity page,LiftArcSettingsEditor editor,String state,boolean large,boolean landscape)throws Exception{main(()->{
        View decor=page.getWindow().getDecorView(),path=decor.findViewWithTag("page-path");
        require(page.hasWindowFocus()&&decor.isShown(),"Page must be visible and focused; lockscreen/AOD cannot be measured as settings UI");
        View card=((ViewGroup)editor.view()).getChildAt(0);float density=page.getResources().getDisplayMetrics().density;
        require(path!=null&&card!=null,"Common breadcrumb and first card exist");
        scroll(page).scrollTo(0,0);
        float gap=(top(card)-bottom(path))/density;
        observe(gap>=7.5f&&gap<=12.5f,state,"Breadcrumb to first card is 8–12dp",new JSONObject().put("gapDp",gap));
        View host=(View)editor.view().getParent();float leftInset=(left(card)-left(host))/density;
        float rightInset=(left(host)+host.getWidth()-left(card)-card.getWidth())/density;
        observe(Math.abs(leftInset-16)<=.5f&&Math.abs(rightInset-16)<=.5f,state,"Content keeps 16dp side insets",new JSONObject().put("leftDp",leftInset).put("rightDp",rightInset));
        if(large)require(page.getResources().getConfiguration().fontScale>=1.49f,"Large font configuration is actually applied");
        if(landscape)require(page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE,"Landscape is actually rendered");
        Set<String> covered=new HashSet<>();
        for(Object suffix:((Map<?,?>)get(editor,"switches")).keySet())covered.add(LiftArcOptions.key(String.valueOf(suffix)));
        for(Object suffix:((Map<?,?>)get(editor,"sliders")).keySet())covered.add(LiftArcOptions.key(String.valueOf(suffix)));
        for(Object key:((Map<?,?>)get(page,"controls")).keySet())if(String.valueOf(key).startsWith(LiftArcOptions.PREFIX))covered.add(String.valueOf(key));
        covered.add(LiftArcOptions.key("arc_dim"));covered.add(LiftArcOptions.key("dim_upper"));
        require(covered.size()==39,"All 39 unique settings have page controls");
        require(countTag(editor.view(),"liftarc-binary:arc_dim")==1&&countTag(editor.view(),"liftarc-binary:dim_upper")==1
                &&countTag(editor.view(),"liftarc-input:dim_strength")==1,"Shared fields occur once");
        JSONArray rows=new JSONArray();
        for(View view:all(editor.view()))if("feature-row".equals(view.getTag())&&view.isShown()){
            Switch control=find(view,Switch.class);require(control!=null,"Native feature row keeps switch");
            observe(view.getHeight()/density>=43.5f,state,"Feature row keeps 44dp touch target",bounds(view,density));
            observe(Math.abs(control.getTrackDrawable().getIntrinsicHeight()/density-28)<=1,state,"Switch track keeps 28dp height",bounds(control,density));
            observe(Math.abs(control.getThumbDrawable().getIntrinsicWidth()/density-22)<=1,state,"Switch thumb keeps 22dp width",bounds(control,density));
            Rect visible=new Rect();boolean visibleNow=control.getGlobalVisibleRect(visible);
            boolean fullyVisible=visibleNow&&visible.width()>=control.getWidth()-1&&visible.height()>=control.getHeight()-1;
            observe(Math.abs(control.getWidth()/density-46)<=1&&Math.abs(control.getHeight()/density-44)<=1,
                    state,"Switch keeps the shared 46×44dp layout slot",bounds(control,density));
            if(("config:"+LiftArcOptions.ENABLED).equals(control.getTag()))
                observe(fullyVisible,state,"Master switch remains fully visible without parent clipping",bounds(control,density));
            rows.put(new JSONObject().put("control",control.getTag()).put("bounds",bounds(view,density))
                    .put("switchBounds",bounds(control,density)).put("switchVisible",visibleNow)
                    .put("switchFullyVisible",fullyVisible).put("switchVisibleRectPx",visible.toShortString()));
        }
        for(View view:all(editor.view()))if((view instanceof EditText||view instanceof Spinner||view instanceof SeekBar)&&view.isShown())
            observe(view.getHeight()/density>=47.5f,state,"Input keeps 48dp touch target",bounds(view,density));
        layouts.put(new JSONObject().put("state",state).put("inMemoryPreview",state.contains("preview"))
                .put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale)
                .put("orientation",page.getResources().getConfiguration().orientation)
                .put("breadcrumb",bounds(path,density)).put("firstCard",bounds(card,density)).put("navigationGapDp",gap)
                .put("sideInsetsDp",new JSONObject().put("left",leftInset).put("right",rightInset))
                .put("uniqueConfigurationControls",covered.size()).put("featureRows",rows));return null;
    });}
    private void capture(Activity page,String name)throws Exception{
        main(()->{require(page.hasWindowFocus()&&page.getWindow().getDecorView().isShown(),"Screenshot requires the visible settings Activity, not lockscreen/AOD");return null;});
        runner.waitForIdleSync();Bitmap bitmap=runner.getUiAutomation().takeScreenshot();require(bitmap!=null,"Screenshot captured");
        try{
            File target=new File(directory,name+".png");try(FileOutputStream output=new FileOutputStream(target)){require(bitmap.compress(Bitmap.CompressFormat.PNG,100,output),"Screenshot saved");}
            JSONObject metadata=main(()->new JSONObject().put("name",name).put("path",target.getAbsolutePath())
                    .put("fontScale",page.getResources().getConfiguration().fontScale)
                    .put("orientation",page.getResources().getConfiguration().orientation));
            screenshots.put(metadata.put("widthPx",bitmap.getWidth()).put("heightPx",bitmap.getHeight()).put("inMemoryPreview",name.contains("preview")));
        }finally{bitmap.recycle();}
    }
    private Activity awaitLandscape(Activity original)throws Exception{
        long deadline=SystemClock.uptimeMillis()+15000;
        while(SystemClock.uptimeMillis()<deadline){Activity candidate=resumed;
            if(candidate!=null&&candidate.getClass()==original.getClass()&&main(()->!candidate.isDestroyed()&&!candidate.isFinishing()
                    &&candidate.getTaskId()==original.getTaskId()&&candidate.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE))return candidate;
            SystemClock.sleep(50);
        }throw new AssertionError("Landscape Activity did not resume");
    }
    private void settle(){runner.waitForIdleSync();SystemClock.sleep(450);runner.waitForIdleSync();}
    private void require(boolean valid,String message){checks++;if(!valid)throw new AssertionError(message);}
    private void observe(boolean valid,String state,String message,JSONObject evidence)throws Exception{
        checks++;if(!valid)violations.put(new JSONObject().put("state",state).put("message",message).put("evidence",evidence));
    }
    private interface Action<T>{T run()throws Exception;}
    private <T>T main(Action<T> action)throws Exception{
        AtomicReference<T> value=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();
        runner.runOnMainSync(()->{try{value.set(action.run());}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new AssertionError("UI-only inspection failed",error.get());return value.get();
    }
    @SuppressWarnings("unchecked") private static Map<String,String> draft(Activity page)throws Exception{return (Map<String,String>)get(page,"draft");}
    private static FieldEditQueue pending(Activity page)throws Exception{return (FieldEditQueue)get(page,"pending");}
    private static int pageOrientation(Activity page){return page.getRequestedOrientation();}
    private static Object get(Object owner,String name)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(owner);}
    private static void set(Object owner,String name,Object value)throws Exception{Field field=owner.getClass().getDeclaredField(name);field.setAccessible(true);field.set(owner,value);}
    private static void setOptional(Object owner,String name,Object value)throws Exception{try{set(owner,name,value);}catch(NoSuchFieldException absent){}}
    private static Object invoke(Object owner,String name,Class<?>[] types,Object... arguments)throws Exception{Method method=owner.getClass().getDeclaredMethod(name,types);method.setAccessible(true);return method.invoke(owner,arguments);}
    private static List<View> all(View root){List<View> result=new ArrayList<>();if(root==null)return result;result.add(root);if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)result.addAll(all(group.getChildAt(i)));}return result;}
    private static <T extends View>T find(View root,Class<T> type){for(View view:all(root))if(type.isInstance(view))return type.cast(view);return null;}
    private static int countTag(View root,String tag){int count=0;for(View view:all(root))if(tag.equals(view.getTag()))count++;return count;}
    private static ScrollView scroll(Activity page){return (ScrollView)page.getWindow().getDecorView().findViewWithTag("detail-scroll");}
    private static int top(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[1];}
    private static int left(View view){int[] point=new int[2];view.getLocationInWindow(point);return point[0];}
    private static int bottom(View view){return top(view)+view.getHeight();}
    private static JSONObject bounds(View view,float density)throws Exception{int[] point=new int[2];view.getLocationInWindow(point);return new JSONObject().put("leftDp",point[0]/density).put("topDp",point[1]/density).put("widthDp",view.getWidth()/density).put("heightDp",view.getHeight()/density);}
    private static Map<String,?> copy(Map<String,?> values){Map<String,Object> copy=new LinkedHashMap<>();for(Map.Entry<String,?> entry:values.entrySet())copy.put(entry.getKey(),entry.getValue() instanceof Set?new HashSet<>((Set<?>)entry.getValue()):entry.getValue());return copy;}
    @Override public void onActivityCreated(Activity page,Bundle state){
        activities.add(page);
        page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }
    @Override public void onActivityResumed(Activity page){resumed=page;}
    @Override public void onActivityPaused(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityDestroyed(Activity page){if(resumed==page)resumed=null;}
    @Override public void onActivityStarted(Activity page){}
    @Override public void onActivityStopped(Activity page){}
    @Override public void onActivitySaveInstanceState(Activity page,Bundle state){}
}
