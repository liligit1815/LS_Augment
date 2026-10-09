package ls.augment.com;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Build;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.MotionEvent;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Spinner;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.EditText;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Exercises the real shared selection dialog. Persistence is opt-in and restores the baseline. */
final class StatusBarIconStyleUiCases implements Application.ActivityLifecycleCallbacks {
    private static final String ROUTE="status_icons", BLUETOOTH="蓝牙图标样式", VPN="VPN图标样式";
    private static final String[] BLUETOOTH_OPTIONS={"原厂","小米 · 胶囊电量","圆环 · 电量百分比"};
    private static final String[] VPN_OPTIONS={"原厂","圆环样式"};
    private static final int LEGACY_LIGHT_BARS=View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
    private static final int LIGHT_BARS=WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS|WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
    private final Instrumentation test;
    private final Context context;
    private final boolean persist;
    private final boolean keyboard;
    private final String requestedOrientation;
    private final String label;
    private final List<Activity> activities=new ArrayList<>();
    private final JSONArray dialogs=new JSONArray(), selections=new JSONArray(), screenshots=new JSONArray(), controlDiagnostics=new JSONArray(), scrollDiagnostics=new JSONArray();
    private volatile Activity resumed;
    private File directory;
    private StatusBarEditorController editor;
    private int checks;

    private StatusBarIconStyleUiCases(Instrumentation test,Bundle arguments){
        this.test=test;context=test.getTargetContext();
        persist=Boolean.parseBoolean(arguments.getString("persist","false"));
        keyboard=Boolean.parseBoolean(arguments.getString("keyboard","false"));
        requestedOrientation=arguments.getString("orientation","current");
        if(!requestedOrientation.equals("current")&&!requestedOrientation.equals("landscape"))throw new IllegalArgumentException("orientation must be current or landscape");
        label=arguments.getString("label","latest");
        if(!label.matches("[A-Za-z0-9_.-]+"))throw new IllegalArgumentException("Invalid evidence label");
    }
    static JSONObject run(Instrumentation test,Bundle arguments)throws Exception{
        return new StatusBarIconStyleUiCases(test,arguments).execute();
    }

    private JSONObject execute()throws Exception{
        AppConfig config=new AppConfig(context);
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        SharedPreferences preferences=context.getSharedPreferences(AppConfig.PREFS,0);
        Map<String,?> rawBefore=new LinkedHashMap<>(preferences.getAll());
        directory=new File(context.getExternalFilesDir(null),"statusbar-icon-style-ui/"+label);
        require(directory.isDirectory()||directory.mkdirs(),"Evidence directory exists");
        Application app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(this);
        Throwable failure=null;
        JSONObject layout=new JSONObject();
        try{
            Activity page=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE,ROUTE).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            settle(page);page=orient(page);prepare(page);
            layout=inspectPage(page);capture(page,"01-page-top");
            inspectDialog(page,BLUETOOTH,BLUETOOTH_OPTIONS,"02-bluetooth-options");
            inspectDialog(page,VPN,VPN_OPTIONS,"03-vpn-options");
            if(keyboard)inspectKeyboardDialog(page);
            require(before.equals(config.snapshot()),"Opening and cancelling both dialogs preserves all settings");
            require(rawBefore.equals(preferences.getAll()),"Read-only selection dialog checks preserve raw settings");
            if(persist){
                for(int position:new int[]{1,2,0})select(page,config,BLUETOOTH,ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,BLUETOOTH_OPTIONS,position);
                for(int position:new int[]{1,0})select(page,config,VPN,ConfigSchema.STATUSBAR_VPN_STYLE,VPN_OPTIONS,position);
                // Retain non-default values across a real Activity recreation, then restore in finally.
                select(page,config,BLUETOOTH,ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,BLUETOOTH_OPTIONS,2);
                select(page,config,VPN,ConfigSchema.STATUSBAR_VPN_STYLE,VPN_OPTIONS,1);
                Activity previous=page;
                main(()->{previous.recreate();return null;});page=await(previous);settle(page);prepare(page);
                Activity recreated=page;
                main(()->{
                    require(spinner(recreated,BLUETOOTH).getSelectedItemPosition()==2,"Bluetooth selection survives Activity recreation");
                    require(spinner(recreated,VPN).getSelectedItemPosition()==1,"VPN ring selection survives Activity recreation");
                    return null;
                });
                inspectPage(page);capture(page,"04-recreated-selections");
                Map<String,String> remaining=new LinkedHashMap<>(config.snapshot());
                remaining.put(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,before.get(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE));
                remaining.put(ConfigSchema.STATUSBAR_VPN_STYLE,before.get(ConfigSchema.STATUSBAR_VPN_STYLE));
                require(before.equals(remaining),"Actual style selections leave all other configuration values intact");
            }
        }catch(Throwable error){
            failure=error;
            try{captureCurrent("99-failure");}catch(Throwable capture){failure.addSuppressed(capture);}
        }
        finally{
            try{
                // Close production editors before restoring values so no queued save can overwrite cleanup.
                main(()->{for(Activity activity:new ArrayList<>(activities))if(!activity.isDestroyed()&&!activity.isFinishing())activity.finish();return null;});
                test.waitForIdleSync();awaitSaves();
                if(persist){
                    Map<String,String> restore=new LinkedHashMap<>();
                    // Also undo an unexpected listener side effect after recording the failure above.
                    for(Map.Entry<String,String> original:before.entrySet())
                        if(!original.getValue().equals(config.get(original.getKey())))restore.put(original.getKey(),original.getValue());
                    if(!restore.isEmpty()){
                        AppConfig.SaveResult saved=config.save(restore);require(saved.success,"Original settings are restored: "+saved.message);
                    }
                }
                require(before.equals(config.snapshot()),"Cleanup restores the original configuration");
                if(!persist)require(rawBefore.equals(preferences.getAll()),"Read-only cleanup preserves raw settings");
            }catch(Throwable cleanup){if(failure==null)failure=cleanup;else failure.addSuppressed(cleanup);}
            app.unregisterActivityLifecycleCallbacks(this);
        }
        JSONObject report=new JSONObject().put("success",failure==null).put("checks",checks)
                .put("version",BuildConfig.VERSION_NAME).put("versionCode",BuildConfig.VERSION_CODE)
                .put("persistenceTested",persist).put("configurationRestored",before.equals(config.snapshot()))
                .put("keyboardTested",keyboard)
                .put("requestedOrientation",requestedOrientation)
                .put("expectedOrientation",requestedOrientation.equals("landscape")?Configuration.ORIENTATION_LANDSCAPE:JSONObject.NULL)
                .put("actualOrientation",layout.opt("orientation"))
                .put("rawSettingsUnchanged",rawBefore.equals(preferences.getAll()))
                .put("deviceInteractive",context.getSystemService(PowerManager.class).isInteractive())
                .put("layout",layout).put("dialogs",dialogs).put("selections",selections)
                .put("controlDiagnostics",controlDiagnostics)
                .put("scrollDiagnostics",scrollDiagnostics)
                .put("screenshots",screenshots).put("directory",directory.getAbsolutePath());
        if(failure!=null)report.put("failure",android.util.Log.getStackTraceString(failure));
        Files.write(new File(directory,"report.json").toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        if(failure!=null)throw new AssertionError("Icon style UI checks failed; inspect "+directory,failure);
        return report;
    }

    private void prepare(Activity page)throws Exception{
        main(()->{
            editor=(StatusBarEditorController)((Map<?,?>)get(page,"editors")).get(ROUTE);
            require(editor!=null,"Production system icon editor exists");
            ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");
            require(!draft.hasPending(),"Opening the editor queues no save");
            // These are display fixtures only. They allow the controls to be checked if position-only mode is saved.
            draft.seed(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");
            draft.seed(ConfigSchema.STATUSBAR_GRID,((StatusBarGridSpec)get(editor,"grid")).serialize());
            invoke(editor,"render");require(!draft.hasPending(),"Display fixtures never queue a configuration write");
            return null;
        });settle(page);
    }

    private Activity orient(Activity initial)throws Exception{
        if(!requestedOrientation.equals("landscape"))return initial;
        main(()->{initial.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
        long until=SystemClock.uptimeMillis()+10000;
        Activity stable=null;long stableSince=0;
        while(SystemClock.uptimeMillis()<until){
            test.waitForIdleSync();
            Activity page=resumed;
            boolean ready=page!=null&&main(()->{
                View decor=page.getWindow().getDecorView();
                return resumed==page&&!page.isDestroyed()&&!page.isFinishing()&&ROUTE.equals(ModuleNavigation.route(page))
                        &&page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE
                        &&decor.isAttachedToWindow()&&decor.isLaidOut()&&decor.isShown();
            });
            if(ready){
                if(stable!=page){stable=page;stableSince=SystemClock.uptimeMillis();}
                // Configuration can update the outgoing Activity before its replacement resumes.
                // Wait for one live, attached Activity to stay current before posting frame work.
                if(SystemClock.uptimeMillis()-stableSince>=500){
                    settle(page);
                    require(resumed==page&&!page.isDestroyed()&&!page.isFinishing(),"Landscape frame checks use the current live Activity");
                    require(main(()->page.getRequestedOrientation()==ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE),"The test Activity retains its temporary landscape request");
                    require(main(()->page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE),"The resumed test Activity has a stable actual landscape configuration");
                    return page;
                }
            }else{stable=null;stableSince=0;}
            SystemClock.sleep(50);
        }
        throw new AssertionError("The test Activity did not reach a stable landscape configuration");
    }

    private JSONObject inspectPage(Activity page)throws Exception{return main(()->{
        View root=page.getWindow().getDecorView(),path=root.findViewWithTag("page-path"),preview=(View)get(editor,"previewHost");
        float density=page.getResources().getDisplayMetrics().density;
        if(requestedOrientation.equals("landscape"))require(page.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE,"Actual page layout uses the requested landscape configuration");
        require(path!=null&&preview!=null,"Breadcrumb and first content expose real layout bounds");
        float gap=(top(preview)-bottom(path))/density;
        require(gap>=7.5f&&gap<=12.5f,"Breadcrumb to first content is 8–12dp, observed "+gap+"dp");
        for(View view:all(root)){
            if(view.getTag() instanceof String)require(!((String)view.getTag()).startsWith("icon-style-preview:"),"Collapsed page has no standalone icon style preview");
            if(view instanceof TextView)require(!((TextView)view).getText().toString().startsWith("样式示例"),"Old standalone Bluetooth sample label is removed");
            CharSequence description=view.getContentDescription();
            require(description==null||!description.toString().startsWith("蓝牙图标示例"),"Old standalone Bluetooth sample view is removed");
        }
        for(String title:new String[]{BLUETOOTH,VPN}){
            Spinner choice=spinner(page,title);require(choice!=null,"Real style control exists: "+title);
            JSONObject observed=controlDiagnostic(choice,density).put("title",title)
                    .put("deviceInteractive",context.getSystemService(PowerManager.class).isInteractive());
            controlDiagnostics.put(observed);
            require(choice.getHeight()/density>=47.5f,"Style control retains its 48dp touch target: "+observed);
            String[] names=BLUETOOTH.equals(title)?BLUETOOTH_OPTIONS:VPN_OPTIONS;
            require(choice.getAdapter().getCount()==names.length,"Style control exposes the expected number of choices: "+title);
            for(int i=0;i<names.length;i++){
                require(names[i].equals(String.valueOf(choice.getAdapter().getItem(i))),"Expected style label exists: "+names[i]);
                require(choice.getAdapter().getView(i,null,choice) instanceof TextView,"Collapsed style remains a plain text value: "+names[i]);
            }
        }
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Page inspection queues no configuration write");
        return new JSONObject().put("density",density).put("fontScale",page.getResources().getConfiguration().fontScale)
                .put("orientation",page.getResources().getConfiguration().orientation).put("navigationGapDp",gap)
                .put("appDarkTheme",((UiKit)get(editor,"ui")).dark)
                .put("nightMode",page.getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK);
    });}

    private void inspectDialog(Activity page,String title,String[] names,String screenshot)throws Exception{
        JSONObject hostBefore=main(()->systemBars(page.getWindow()));
        Dialog dialog=open(page,title);AccessibilityNodeInfo root=dialogRoot(title);
        JSONObject appearance=main(()->inspectSystemBars(page,dialog)).put("hostBefore",hostBefore);
        JSONObject evidence=new JSONObject().put("title",title).put("systemBars",appearance);
        try{
            List<AccessibilityNodeInfo> previews=new ArrayList<>();
            for(AccessibilityNodeInfo node:nodes(root))if(node.getContentDescription()!=null&&node.getContentDescription().toString().startsWith(title+"，"))previews.add(node);
            require(previews.size()==names.length,"Every selection option includes one accessible preview: "+title);
            JSONArray options=new JSONArray();
            for(int index=0;index<names.length;index++){
                final int rowIndex=index;String name=names[index];
                JSONObject scrollTrace=main(()->{
                    View row=dialog.getWindow().getDecorView().findViewWithTag("choice-option:"+rowIndex);
                    require(row!=null,"Production option row exists before scrolling: "+name);
                    ScrollView scroll=scrollAncestor(row);View content=scroll.getChildAt(0);
                    require(content instanceof ViewGroup,"Production option list exposes its real scroll content");
                    Rect bounds=new Rect(0,0,row.getWidth(),row.getHeight());
                    ((ViewGroup)content).offsetDescendantRectToMyCoords(row,bounds);
                    int viewport=scroll.getHeight()-scroll.getPaddingTop()-scroll.getPaddingBottom();
                    int max=Math.max(0,content.getHeight()-viewport),target=Math.min(max,Math.max(0,bounds.bottom-viewport));
                    JSONObject trace=new JSONObject().put("title",title).put("label",name).put("scrollYBefore",scroll.getScrollY())
                            .put("targetScrollY",target).put("maxScrollY",max).put("contentHeightPx",content.getHeight())
                            .put("contentMeasuredHeightPx",content.getMeasuredHeight()).put("viewportHeightPx",viewport)
                            .put("rowInContentPx",bounds.toShortString());
                    scroll.scrollTo(0,target);return trace.put("scrollYImmediately",scroll.getScrollY());
                });settle(page);
                scrollTrace.put("afterLayout",main(()->{
                    View row=dialog.getWindow().getDecorView().findViewWithTag("choice-option:"+rowIndex);
                    View preview=row.findViewWithTag("icon-style-preview:"+title+":"+rowIndex);
                    require(preview!=null,"Production option retains its actual preview View: "+name);
                    ScrollView scroll=scrollAncestor(row);Rect visible=new Rect(),rowVisible=new Rect(),viewport=new Rect();
                    boolean shown=preview.getGlobalVisibleRect(visible),rowShown=row.getGlobalVisibleRect(rowVisible);
                    scroll.getGlobalVisibleRect(viewport);Rect bounds=screenBounds(preview);
                    return new JSONObject().put("scrollY",scroll.getScrollY()).put("previewVisible",shown)
                            .put("previewFullyVisible",shown&&visible.contains(bounds)).put("previewBoundsPx",bounds.toShortString())
                            .put("previewVisibleBoundsPx",visible.toShortString()).put("rowVisible",rowShown)
                            .put("rowBoundsPx",screenBounds(row).toShortString()).put("rowVisibleBoundsPx",rowVisible.toShortString())
                            .put("viewportBoundsPx",viewport.toShortString());
                }));
                scrollDiagnostics.put(scrollTrace);
                require(scrollTrace.getJSONObject("afterLayout").getBoolean("previewFullyVisible"),"The actual preview View is fully inside the production scroll viewport: "+scrollTrace);
                scrollTrace.put("accessibilityCacheCleared",test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).clearCache());
                AccessibilityNodeInfo visibleRoot=dialogRoot(title);
                try{
                    AccessibilityNodeInfo option=option(visibleRoot,name),matching=null;
                    require(option!=null,"Real selection dialog contains "+name);
                    Rect rowBounds=new Rect();clickable(option).getBoundsInScreen(rowBounds);
                    for(AccessibilityNodeInfo preview:nodes(visibleRoot))
                        if(preview.getContentDescription()!=null&&preview.getContentDescription().toString().startsWith(title+"，")
                                &&preview.getContentDescription().toString().contains(name+"示例")){matching=preview;break;}
                    require(matching!=null,"Preview matches its option label: "+name);
                    Rect previewBounds=new Rect();matching.getBoundsInScreen(previewBounds);
                    require(matching.isVisibleToUser(),"The production list can scroll each preview into view: "+name);
                    require(!previewBounds.isEmpty()&&rowBounds.contains(previewBounds),"Preview lies inside its own visible selection row: "+name);
                    options.put(new JSONObject().put("label",name).put("description",matching.getContentDescription())
                            .put("rowBoundsPx",rowBounds.toShortString()).put("previewBoundsPx",previewBounds.toShortString()));
                }finally{visibleRoot.recycle();}
            }
            evidence.put("options",options);dialogs.put(evidence);
            capture(page,screenshot);AccessibilityNodeInfo cancelRoot=dialogRoot(title);
            try{
                AccessibilityNodeInfo cancel=option(cancelRoot,"取消");require(cancel!=null,"Dialog cancel remains reachable");
                require(clickable(cancel).performAction(AccessibilityNodeInfo.ACTION_CLICK),"Cancel the real selection dialog");
            }finally{cancelRoot.recycle();}
        }finally{root.recycle();}
        settle(page);appearance.put("hostAfterCancel",main(()->{
            require(!dialog.isShowing(),"Cancel closes the real choice window");
            return inspectHostAfterClose(page,hostBefore);
        }));
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Cancelling previews does not edit a setting");
        // Choosing the already selected row closes the same window without a configuration update.
        Dialog current=open(page,title);AccessibilityNodeInfo currentRoot=dialogRoot(title);
        try{
            appearance.put("currentChoice",main(()->inspectSystemBars(page,current)));
            int position=main(()->spinner(page,title).getSelectedItemPosition());
            AccessibilityNodeInfo selected=option(currentRoot,names[position]);require(selected!=null,"Current selection remains reachable");
            require(clickable(selected).performAction(AccessibilityNodeInfo.ACTION_CLICK),"Choose the current style without editing settings");
        }finally{currentRoot.recycle();}
        settle(page);appearance.put("hostAfterCurrentChoice",main(()->{
            require(!current.isShowing(),"Current selection closes the real choice window");
            return inspectHostAfterClose(page,hostBefore);
        }));
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Choosing the current style queues no configuration save");
        Dialog outside=open(page,title);
        // Two layout frames do not finish the native window scale animation. Keep animations
        // enabled and wait for the touchable window to reach the bounds measured below.
        SystemClock.sleep(500);settle(page);
        appearance.put("outsideTapAnimationWaitMs",500);
        appearance.put("outsideTap",main(()->inspectSystemBars(page,outside)));
        float[] tap=main(()->{
            Rect panel=screenBounds(outside.getWindow().getDecorView().findViewWithTag("liquid-glass-dialog"));
            Rect window=screenBounds(outside.getWindow().getDecorView());
            float x=(window.left+panel.left)/2f,y=panel.centerY();
            require(x<panel.left&&x>window.left,"The compact panel retains an outside touch area");
            return new float[]{x,y};
        });
        long down=SystemClock.uptimeMillis();
        for(int action:new int[]{MotionEvent.ACTION_DOWN,MotionEvent.ACTION_UP}){
            MotionEvent touch=MotionEvent.obtain(down,SystemClock.uptimeMillis(),action,tap[0],tap[1],0);
            touch.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);
            try{require(test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).injectInputEvent(touch,true),"Inject a real outside-panel touch");}
            finally{touch.recycle();}
        }
        settle(page);appearance.put("hostAfterOutsideTap",main(()->{
            require(!outside.isShowing(),"Tapping outside the compact panel cancels its full window");
            return inspectHostAfterClose(page,hostBefore);
        }));
        require(!((ConfigEditDraft)get(editor,"draft")).hasPending(),"Outside cancellation queues no configuration save");
    }

    private void select(Activity page,AppConfig config,String title,String key,String[] names,int position)throws Exception{
        JSONObject hostBefore=main(()->systemBars(page.getWindow()));
        Dialog dialog=open(page,title);AccessibilityNodeInfo root=dialogRoot(title);
        JSONObject appearance=main(()->inspectSystemBars(page,dialog)).put("hostBefore",hostBefore);
        try{
            AccessibilityNodeInfo selected=option(root,names[position]);require(selected!=null,"Selection option is reachable: "+names[position]);
            require(clickable(selected).performAction(AccessibilityNodeInfo.ACTION_CLICK),"Click the real style option: "+names[position]);
        }finally{root.recycle();}
        settle(page);long until=SystemClock.uptimeMillis()+20000;
        while(SystemClock.uptimeMillis()<until){
            boolean idle=main(()->!((Boolean)get(editor,"saving"))&&!((Boolean)get(editor,"dirty")));
            if(idle&&String.valueOf(position).equals(config.get(key)))break;
            SystemClock.sleep(60);
        }
        require(String.valueOf(position).equals(config.get(key)),"Selection is persisted by the production save path: "+title+" / "+names[position]);
        require(main(()->!((Boolean)get(editor,"saving"))&&!((Boolean)get(editor,"dirty"))),"Style auto-save completes before the next interaction");
        main(()->{require(spinner(page,title).getSelectedItemPosition()==position,"Collapsed value follows the selected style");return null;});
        appearance.put("hostAfterSelection",main(()->{
            require(!dialog.isShowing(),"Selecting a style closes the real choice window");
            return inspectHostAfterClose(page,hostBefore);
        }));
        selections.put(new JSONObject().put("title",title).put("choice",names[position]).put("persistedValue",config.get(key)).put("systemBars",appearance));
    }

    private Dialog open(Activity page,String title)throws Exception{
        main(()->{Spinner choice=spinner(page,title);require(choice!=null,"Style choice is present: "+title);
            Rect rectangle=new Rect(0,0,choice.getWidth(),choice.getHeight());choice.requestRectangleOnScreen(rectangle,true);return null;});
        settle(page);main(()->{require(spinner(page,title).performClick(),"Open the production selection dialog: "+title);return null;});settle(page);
        return main(()->{
            Dialog dialog=(Dialog)get(spinner(page,title),"selectionDialog");
            require(dialog!=null&&dialog.isShowing(),"The production spinner exposes its real open Dialog");return dialog;
        });
    }
    private JSONObject inspectSystemBars(Activity page,Dialog dialog)throws Exception{
        JSONObject host=systemBars(page.getWindow()),floating=systemBars(dialog.getWindow());
        boolean dark=((UiKit)get(editor,"ui")).dark;
        require(host.getInt("legacyLightBars")== (dark?0:LEGACY_LIGHT_BARS),"Host legacy system bar colors follow the page theme");
        require(floating.getInt("legacyLightBars")==host.getInt("legacyLightBars"),"Real Dialog legacy system bar colors match its host");
        if(Build.VERSION.SDK_INT>=30){
            require(host.getInt("lightBarsAppearance")== (dark?0:LIGHT_BARS),"Host inset system bar colors follow the page theme");
            require(floating.getInt("lightBarsAppearance")==host.getInt("lightBarsAppearance"),"Real Dialog inset system bar colors match its host");
        }
        require((floating.getInt("windowFlags")&WindowManager.LayoutParams.FLAG_DIM_BEHIND)!=0,"System bar inheritance preserves the glass dialog dim flag");
        require(Math.abs(floating.getDouble("dimAmount")-(dark?.28f:.12f))<.001,"System bar inheritance preserves the glass dialog dim amount");
        require((floating.getInt("windowFlags")&WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)!=0,"Dialog participates in native system bar background policy");
        require(floating.getInt("statusBarColor")==host.getInt("statusBarColor"),"Dialog inherits its host status bar background");
        require(floating.getInt("navigationBarColor")==host.getInt("navigationBarColor"),"Dialog inherits its host navigation bar background");
        if(Build.VERSION.SDK_INT>=29){
            require(floating.getBoolean("statusBarContrastEnforced")==host.getBoolean("statusBarContrastEnforced"),"Dialog inherits host status bar contrast policy");
            require(floating.getBoolean("navigationBarContrastEnforced")==host.getBoolean("navigationBarContrastEnforced"),"Dialog inherits host navigation bar contrast policy");
        }
        if(Build.VERSION.SDK_INT>=30)require(floating.getInt("fitInsetsTypes")==0,"The Dialog window frame includes native system bar regions");
        View shell=dialog.getWindow().getDecorView().findViewWithTag("glass-dialog-window");
        View panel=dialog.getWindow().getDecorView().findViewWithTag("liquid-glass-dialog");
        require(shell!=null&&panel!=null,"The real Dialog keeps its compact panel inside the transparent shell");
        Rect frame=screenBounds(dialog.getWindow().getDecorView()),display=page.getSystemService(WindowManager.class).getCurrentWindowMetrics().getBounds();
        require(frame.left<=display.left&&frame.top<=display.top&&frame.right>=display.right,"The Dialog window includes the full status bar width and top edge");
        WindowInsets insets=shell.getRootWindowInsets();
        if(insets==null||!insets.isVisible(WindowInsets.Type.ime()))require(frame.bottom>=display.bottom,"Without a keyboard the Dialog includes the navigation bar region");
        int expectedWidth=Math.min(((UiKit)get(editor,"ui")).dp(420),shell.getWidth()-shell.getPaddingLeft()-shell.getPaddingRight()-((UiKit)get(editor,"ui")).dp(36));
        require(Math.abs(panel.getWidth()-expectedWidth)<=1,"The visible panel keeps its original compact width");
        require(Math.abs((panel.getLeft()+panel.getRight())-(shell.getPaddingLeft()+shell.getWidth()-shell.getPaddingRight()))<=2,"The visible panel remains horizontally centered in its safe area");
        require(Math.abs((panel.getTop()+panel.getBottom())-(shell.getPaddingTop()+shell.getHeight()-shell.getPaddingBottom()))<=2,"The visible panel remains vertically centered in its safe area");
        Rect safe=new Rect(shell.getPaddingLeft(),shell.getPaddingTop(),shell.getWidth()-shell.getPaddingRight(),shell.getHeight()-shell.getPaddingBottom());
        require(safe.contains(panel.getLeft(),panel.getTop())&&panel.getRight()<=safe.right&&panel.getBottom()<=safe.bottom,"The panel stays clear of native bars, cutouts and the keyboard");
        View cancel=null;for(View view:all(dialog.getWindow().getDecorView()))if(view instanceof TextView&&"取消".contentEquals(((TextView)view).getText()))cancel=view;
        require(cancel!=null,"The real Dialog retains its cancel button outside the scrolling option list");
        Rect cancelBounds=screenBounds(cancel),visibleCancel=new Rect(),shellBounds=screenBounds(shell);
        Rect safeScreen=new Rect(shellBounds.left+safe.left,shellBounds.top+safe.top,shellBounds.left+safe.right,shellBounds.top+safe.bottom);
        require(cancel.getGlobalVisibleRect(visibleCancel)&&visibleCancel.contains(cancelBounds),"The cancel button remains fully visible");
        require(safeScreen.contains(cancelBounds),"The cancel button remains inside the system bar, cutout and keyboard safe area");
        return new JSONObject().put("hostWhileOpen",host).put("dialog",floating)
                .put("windowBoundsPx",frame.toShortString()).put("panelBoundsPx",screenBounds(panel).toShortString()).put("panelSafeBoundsPx",safe.toShortString())
                .put("cancelBoundsPx",cancelBounds.toShortString());
    }
    private JSONObject inspectHostAfterClose(Activity page,JSONObject before)throws Exception{
        JSONObject after=systemBars(page.getWindow());
        require(after.getInt("legacyLightBars")==before.getInt("legacyLightBars"),"Closing the Dialog preserves host legacy system bar colors");
        if(Build.VERSION.SDK_INT>=30)require(after.getInt("lightBarsAppearance")==before.getInt("lightBarsAppearance"),"Closing the Dialog preserves host inset system bar colors");
        return after;
    }
    private static JSONObject systemBars(Window window)throws Exception{
        int legacy=window.getDecorView().getSystemUiVisibility();
        JSONObject result=new JSONObject().put("legacyFlags",legacy).put("legacyLightBars",legacy&LEGACY_LIGHT_BARS)
                .put("windowFlags",window.getAttributes().flags).put("windowAnimations",window.getAttributes().windowAnimations)
                .put("dimAmount",window.getAttributes().dimAmount).put("statusBarColor",window.getStatusBarColor())
                .put("navigationBarColor",window.getNavigationBarColor());
        if(Build.VERSION.SDK_INT>=29)result.put("statusBarContrastEnforced",window.isStatusBarContrastEnforced()).put("navigationBarContrastEnforced",window.isNavigationBarContrastEnforced());
        if(Build.VERSION.SDK_INT>=30){
            result.put("fitInsetsTypes",window.getAttributes().getFitInsetsTypes());
            WindowInsetsController controller=window.getInsetsController();
            if(controller==null)throw new AssertionError("Attached Window exposes its inset controller");
            int appearance=controller.getSystemBarsAppearance();
            result.put("appearance",appearance).put("lightBarsAppearance",appearance&LIGHT_BARS);
        }
        return result;
    }
    private void inspectKeyboardDialog(Activity page)throws Exception{
        JSONObject hostBefore=main(()->systemBars(page.getWindow()));
        EditText input=main(()->{
            EditText field=new EditText(page);((UiKit)get(editor,"ui")).styleInput(field);
            field.setHint("输入安全区检查");field.setSingleLine(true);return field;
        });
        Dialog dialog=main(()->((UiKit)get(editor,"ui")).glassDialog("输入安全区检查",input,"完成",null,"取消"));
        try{
            settle(page);main(()->{
                require(input.requestFocus(),"The real glass Dialog input receives focus");
                page.getSystemService(InputMethodManager.class).showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);return null;
            });
            long until=SystemClock.uptimeMillis()+6000;
            while(SystemClock.uptimeMillis()<until&&!main(()->input.getRootWindowInsets()!=null&&input.getRootWindowInsets().isVisible(WindowInsets.Type.ime())))SystemClock.sleep(60);
            settle(page);JSONObject appearance=main(()->{
                require(input.getRootWindowInsets()!=null&&input.getRootWindowInsets().isVisible(WindowInsets.Type.ime()),"The actual keyboard becomes visible for the dialog input");
                JSONObject bars=inspectSystemBars(page,dialog);Rect visible=new Rect();
                require(input.getGlobalVisibleRect(visible)&&visible.height()>=input.getHeight()-1,"The keyboard leaves the dialog input fully visible");
                View cancel=null;for(View view:all(dialog.getWindow().getDecorView()))if(view instanceof TextView&&"取消".contentEquals(((TextView)view).getText()))cancel=view;
                require(cancel!=null&&cancel.getGlobalVisibleRect(visible)&&visible.height()>=cancel.getHeight()-1,"The keyboard leaves the dialog cancel button fully visible");
                return bars;
            });
            capture(page,"05-keyboard-safe-area");
            dialogs.put(new JSONObject().put("title","输入安全区检查").put("systemBars",appearance));
        }finally{
            main(()->{
                page.getSystemService(InputMethodManager.class).hideSoftInputFromWindow(input.getWindowToken(),0);
                dialog.cancel();return null;
            });settle(page);main(()->{inspectHostAfterClose(page,hostBefore);return null;});
        }
    }
    private static Rect screenBounds(View view){int[] xy=new int[2];view.getLocationOnScreen(xy);return new Rect(xy[0],xy[1],xy[0]+view.getWidth(),xy[1]+view.getHeight());}
    private static ScrollView scrollAncestor(View view){
        for(View parent=view.getParent() instanceof View?(View)view.getParent():null;parent!=null;parent=parent.getParent() instanceof View?(View)parent.getParent():null)
            if(parent instanceof ScrollView)return (ScrollView)parent;
        throw new AssertionError("Production option row has no ScrollView ancestor");
    }
    private AccessibilityNodeInfo dialogRoot(String title){
        long until=SystemClock.uptimeMillis()+3000;
        while(SystemClock.uptimeMillis()<until){
            AccessibilityNodeInfo root=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).getRootInActiveWindow();
            if(root!=null){if(option(root,title)!=null&&option(root,"取消")!=null)return root;root.recycle();}
            SystemClock.sleep(60);
        }
        throw new AssertionError("Style selection dialog did not become accessible: "+title);
    }
    private static AccessibilityNodeInfo option(AccessibilityNodeInfo root,String label){
        for(AccessibilityNodeInfo node:nodes(root))if(node.getText()!=null&&(label.contentEquals(node.getText())||(label+" · 当前").contentEquals(node.getText())))return node;
        return null;
    }
    private static AccessibilityNodeInfo clickable(AccessibilityNodeInfo node){
        while(node!=null&&!node.isClickable())node=node.getParent();
        if(node==null)throw new AssertionError("Selection row has no accessible click action");return node;
    }
    private static List<AccessibilityNodeInfo> nodes(AccessibilityNodeInfo root){
        List<AccessibilityNodeInfo> values=new ArrayList<>();values.add(root);
        for(int i=0;i<root.getChildCount();i++){AccessibilityNodeInfo child=root.getChild(i);if(child!=null)values.addAll(nodes(child));}return values;
    }
    private void awaitSaves()throws Exception{
        long until=SystemClock.uptimeMillis()+20000;
        while(editor!=null&&SystemClock.uptimeMillis()<until){
            if(main(()->!((Boolean)get(editor,"saving"))&&!((ConfigEditDraft)get(editor,"draft")).hasPending()))return;
            SystemClock.sleep(60);
        }
        require(editor==null||main(()->!((Boolean)get(editor,"saving"))&&!((ConfigEditDraft)get(editor,"draft")).hasPending()),"Editor saves finish before restoring the baseline");
    }
    private Activity await(Activity previous){long until=SystemClock.uptimeMillis()+10000;while(SystemClock.uptimeMillis()<until){Activity page=resumed;if(page!=null&&page!=previous&&!page.isFinishing()&&ROUTE.equals(ModuleNavigation.route(page)))return page;SystemClock.sleep(30);}throw new AssertionError("System icon page did not resume after recreation");}
    private void settle(Activity page)throws Exception{test.waitForIdleSync();CountDownLatch frames=new CountDownLatch(1);main(()->{page.getWindow().getDecorView().postOnAnimation(()->page.getWindow().getDecorView().postOnAnimation(frames::countDown));return null;});require(frames.await(3,TimeUnit.SECONDS),"Page laid out");test.waitForIdleSync();}
    private void capture(Activity page,String name)throws Exception{settle(page);captureCurrent(name);}
    private void captureCurrent(String name)throws Exception{Bitmap image=test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();require(image!=null,"Device screenshot is available");File file=new File(directory,name+".png");try(FileOutputStream stream=new FileOutputStream(file)){require(image.compress(Bitmap.CompressFormat.PNG,100,stream),"Screenshot saved");}finally{image.recycle();}screenshots.put(file.getAbsolutePath());}
    private static JSONObject controlDiagnostic(View view,float density)throws Exception{
        JSONObject result=viewDiagnostic(view,density);JSONArray parents=new JSONArray();
        for(View parent=view.getParent() instanceof View?(View)view.getParent():null;parent!=null;parent=parent.getParent() instanceof View?(View)parent.getParent():null)parents.put(viewDiagnostic(parent,density));
        return result.put("parents",parents);
    }
    private static JSONObject viewDiagnostic(View view,float density)throws Exception{
        int[] xy=new int[2];view.getLocationInWindow(xy);Rect visible=new Rect();boolean inViewport=view.getGlobalVisibleRect(visible);
        JSONObject result=new JSONObject().put("class",view.getClass().getName()).put("tag",String.valueOf(view.getTag()))
                .put("heightPx",view.getHeight()).put("heightDp",view.getHeight()/density).put("widthPx",view.getWidth())
                .put("measuredHeightPx",view.getMeasuredHeight()).put("minimumHeightPx",view.getMinimumHeight())
                .put("visibility",view.getVisibility()).put("shown",view.isShown()).put("attached",view.isAttachedToWindow())
                .put("laidOut",view.isLaidOut()).put("layoutRequested",view.isLayoutRequested())
                .put("locationInWindowPx",new JSONArray().put(xy[0]).put(xy[1]))
                .put("inViewport",inViewport).put("visibleRectPx",visible.toShortString());
        if(view.getLayoutParams()!=null)result.put("layoutHeight",view.getLayoutParams().height).put("layoutWidth",view.getLayoutParams().width);
        return result;
    }
    private static Spinner spinner(Activity page,String title){for(View view:all(page.getWindow().getDecorView()))if(view instanceof Spinner&&title.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return (Spinner)view;return null;}
    private static List<View> all(View root){List<View> views=new ArrayList<>();views.add(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)views.addAll(all(((ViewGroup)root).getChildAt(i)));return views;}
    private static float top(View view){if(view.getParent() instanceof View){View parent=(View)view.getParent();return top(parent)+view.getTop()-parent.getScrollY();}int[] xy=new int[2];view.getLocationInWindow(xy);return xy[1];}
    private static float bottom(View view){return top(view)+view.getHeight();}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static Object invoke(Object object,String name)throws Exception{Method method=object.getClass().getDeclaredMethod(name);method.setAccessible(true);return method.invoke(object);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> action)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(action.run());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new AssertionError("UI operation failed",error.get());return result.get();}
    private void require(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public void onActivityCreated(Activity activity,Bundle state){activities.add(activity);activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);}
    public void onActivityResumed(Activity activity){resumed=activity;}
    public void onActivityPaused(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityDestroyed(Activity activity){if(resumed==activity)resumed=null;}
    public void onActivityStarted(Activity activity){}public void onActivityStopped(Activity activity){}public void onActivitySaveInstanceState(Activity activity,Bundle state){}
}
