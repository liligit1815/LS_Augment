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

/** Production arrangement buttons/dialogs and normal autosave; no visual-rendering claim. */
final class StatusBarArrangementDeviceCases {
    private final Instrumentation test;
    private final Context context;
    private final AppConfig config;
    private final JSONArray cases=new JSONArray();
    private final File baseline,reportFile;
    private Activity page;
    private Object editor;
    private int failures;
    private StatusBarArrangementDeviceCases(Instrumentation test){
        this.test=test;context=test.getTargetContext();config=new AppConfig(context);
        baseline=new File(context.getFilesDir(),"statusbar-arrangement-baseline.json");
        reportFile=new File(context.getExternalFilesDir(null),"statusbar-arrangement-results.json");
    }
    static JSONObject run(Instrumentation test)throws Exception{return new StatusBarArrangementDeviceCases(test).execute();}
    static JSONObject restore(Instrumentation test)throws Exception{StatusBarArrangementDeviceCases s=new StatusBarArrangementDeviceCases(test);s.restoreBaseline();return new JSONObject().put("success",true).put("settingsRestored",true);}
    private JSONObject execute()throws Exception{
        require(!baseline.exists(),"Previous arrangement baseline exists; restore first");
        Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Files.write(baseline.toPath(),new JSONObject(before).toString().getBytes(StandardCharsets.UTF_8));
        JSONObject report=new JSONObject().put("cases",cases).put("evidenceScope","actual production buttons/dialogs, autosave, all expected preferences and ConfigSchema.isRuntimeKey provider values; no SystemUI visual claim");
        try{
            prepare();open();
            for(int preset=0;preset<3;preset++){
                final int choice=preset;final Map<String,String> start=new LinkedHashMap<>(config.snapshot());
                check("preset-"+preset+"-preview-cancel",()->{
                    choosePreset(choice);quiet();assertSaved(start);
                    main(()->{ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");
                        for(Map.Entry<String,String> entry:StatusBarPresets.values(choice).entrySet())require(Objects.equals(entry.getValue(),draft.get(entry.getKey())),"preview draft "+entry.getKey());return null;});
                    clickPage("取消预览");quiet();assertSaved(start);
                    require(main(()->get(editor,"previewBackup"))==null,"preview cancelled");
                });
                check("preset-"+preset+"-confirm",()->{choosePreset(choice);clickPage("使用此预设");readback(StatusBarPresets.values(choice));require(main(()->get(editor,"previewBackup"))==null,"preview accepted");});
                check("preset-"+preset+"-undo",()->{clickPage("恢复方案前");clickDialog("恢复",false);readback(start);});
            }
            final Map<String,String> preArrange=new LinkedHashMap<>(config.snapshot());
            check("arrange-apply",()->{
                StatusBarGridSpec original=StatusBarGridSpec.parse(preArrange.get(ConfigSchema.STATUSBAR_GRID));
                clickPage("自动整理");Map<String,String> expected=new LinkedHashMap<>();expected.put(ConfigSchema.STATUSBAR_GRID,StatusBarPresets.arrange(original).serialize());expected.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"2");readback(expected);
            });
            check("arrange-undo",()->{clickPage("恢复方案前");clickDialog("恢复",false);readback(preArrange);});
            for(String zone:new String[]{"L1","C1","R1"}){final String target=zone;check("move-clock-"+zone,()->move("clock",target));}
            for(String id:StatusBarGridSpec.IDS){final String component=id;check("move-"+id+"-L1",()->move(component,"L1"));}
            check("order-cancel",()->{
                Map<String,String> saved=new LinkedHashMap<>(config.snapshot());clickPage("调整这一侧的顺序");clickDialog(StatusBarGridSpec.LABELS[0]+"后移",true);clickDialog("取消",false);quiet();assertSaved(saved);
            });
            // Every component participates in an actual adjacent reorder and an apply operation.
            for(String id:StatusBarGridSpec.IDS){final String component=id;check("order-"+id,()->reorder(component));}
        }finally{
            try{close();}finally{restoreBaseline();}
            report.put("success",failures==0).put("failures",failures).put("settingsRestored",before.equals(config.snapshot()));
            Files.write(reportFile.toPath(),report.toString(2).getBytes(StandardCharsets.UTF_8));
        }
        return report.put("reportFile",reportFile.getAbsolutePath());
    }
    private void prepare(){
        Map<String,String> setup=new LinkedHashMap<>();
        setup.put(ConfigSchema.SYSTEMUI_MASTER,"1");setup.put(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"0");
        setup.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,"1");setup.put(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"0");setup.put(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"0");
        setup.put(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE,"0");setup.put(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"0");setup.put(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,"1");
        setup.put(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,"1");setup.put(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,"0");
        setup.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"7");
        StatusBarGridSpec grid=StatusBarGridSpec.defaults();int order=0;
        for(String id:StatusBarGridSpec.IDS){StatusBarGridSpec.Item old=grid.get(id);grid=grid.with(id,new StatusBarGridSpec.Item("R1",order++,old.size,true));}
        setup.put(ConfigSchema.STATUSBAR_GRID,grid.serialize());require(config.save(setup).success,"isolated arrangement setup");
    }
    private void choosePreset(int index)throws Exception{clickPage("选择预设");clickDialog(StatusBarPresets.NAMES[index],false);test.waitForIdleSync();}
    private void move(String id,String zone)throws Exception{
        StatusBarGridSpec grid=StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID));StatusBarGridSpec.Item old=grid.get(id);
        String expected=grid.with(id,new StatusBarGridSpec.Item(zone,old.order,old.size,old.visible)).serialize();
        main(()->{View row=page.getWindow().getDecorView().findViewWithTag("placement:"+id);require(row!=null,"placement row "+id);View button=find(row,"移动",false);require(button!=null,"move button "+id);button.performClick();return null;});
        clickDialog(StatusBarGridSpec.ZONE_LABELS[Arrays.asList(StatusBarGridSpec.ZONES).indexOf(zone)],false);
        readback(Collections.singletonMap(ConfigSchema.STATUSBAR_GRID,expected));
    }
    private void reorder(String id)throws Exception{
        StatusBarGridSpec grid=StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID));List<String> ids=new ArrayList<>(Arrays.asList(StatusBarGridSpec.IDS));ids.sort(Comparator.comparingInt(key->grid.get(key).order));
        int at=ids.indexOf(id),direction=at==ids.size()-1?-1:1;Collections.swap(ids,at,at+direction);
        StatusBarGridSpec expected=grid;for(int n=0;n<ids.size();n++){String key=ids.get(n);StatusBarGridSpec.Item old=expected.get(key);expected=expected.with(key,new StatusBarGridSpec.Item(old.zone,n*10,old.size,old.visible));}
        clickPage("调整这一侧的顺序");clickDialog(StatusBarGridSpec.LABELS[Arrays.asList(StatusBarGridSpec.IDS).indexOf(id)]+(direction<0?"前移":"后移"),true);clickDialog("应用顺序",false);
        readback(Collections.singletonMap(ConfigSchema.STATUSBAR_GRID,expected.serialize()));
    }
    private void clickPage(String label)throws Exception{main(()->{View found=find(page.getWindow().getDecorView(),label,false);require(found!=null&&found.isEnabled(),"page button "+label);require(found.performClick(),"page click "+label);return null;});test.waitForIdleSync();}
    private void clickDialog(String label,boolean description)throws Exception{
        test.waitForIdleSync();long deadline=SystemClock.uptimeMillis()+4000;
        do{AccessibilityNodeInfo root=test.getUiAutomation().getRootInActiveWindow();AccessibilityNodeInfo node=node(root,label,description);
            if(node!=null){while(!node.isClickable()&&node.getParent()!=null)node=node.getParent();
                if(!node.isVisibleToUser()){node.performAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SHOW_ON_SCREEN.getId());test.waitForIdleSync();SystemClock.sleep(60);continue;}
                require(node.isEnabled()&&node.performAction(AccessibilityNodeInfo.ACTION_CLICK),"dialog click "+label);test.waitForIdleSync();return;}
            AccessibilityNodeInfo scroll=scrollable(root);if(scroll!=null)scroll.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);SystemClock.sleep(80);
        }while(SystemClock.uptimeMillis()<deadline);throw new AssertionError("Dialog control absent: "+label);
    }
    private static AccessibilityNodeInfo node(AccessibilityNodeInfo root,String label,boolean description){if(root==null)return null;CharSequence value=description?root.getContentDescription():root.getText();if(value!=null&&label.contentEquals(value))return root;for(int i=0;i<root.getChildCount();i++){AccessibilityNodeInfo found=node(root.getChild(i),label,description);if(found!=null)return found;}return null;}
    private static AccessibilityNodeInfo scrollable(AccessibilityNodeInfo root){if(root==null)return null;if(root.isScrollable())return root;for(int i=0;i<root.getChildCount();i++){AccessibilityNodeInfo found=scrollable(root.getChild(i));if(found!=null)return found;}return null;}
    private static View find(View view,String label,boolean description){CharSequence value=description?view.getContentDescription():view instanceof TextView?((TextView)view).getText():null;if(value!=null&&label.contentEquals(value))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View found=find(((ViewGroup)view).getChildAt(i),label,description);if(found!=null)return found;}return null;}
    private interface Action{void run()throws Exception;}
    private void check(String name,Action action)throws Exception{
        JSONObject item=new JSONObject().put("case",name).put("visualEffectVerified",false).put("key",ConfigSchema.STATUSBAR_GRID);
        try{action.run();item.put("pass",true);}catch(Throwable failure){failures++;StringWriter stack=new StringWriter();failure.printStackTrace(new PrintWriter(stack));item.put("pass",false).put("error",failure.toString()).put("stackTrace",stack.toString());throw failure;}finally{cases.put(item);Files.write(reportFile.toPath(),new JSONObject().put("cases",cases).put("failures",failures).toString(2).getBytes(StandardCharsets.UTF_8));}
    }
    private void quiet(){test.waitForIdleSync();SystemClock.sleep(750);test.waitForIdleSync();}
    private void assertSaved(Map<String,String> expected)throws Exception{require(expected.equals(config.snapshot()),"preview/cancel must not save any config");readback(expected);}
    private void readback(Map<String,String> expected)throws Exception{
        Map<String,String> normalized=new LinkedHashMap<>();
        for(Map.Entry<String,String> entry:expected.entrySet()){
            String value=ConfigSchema.normalize(entry.getKey(),entry.getValue());
            require(value!=null,"Invalid test expectation for "+entry.getKey()+": "+entry.getValue());
            normalized.put(entry.getKey(),value);
        }
        long deadline=SystemClock.uptimeMillis()+8000;String mismatch="";
        do{Bundle bundle=context.getContentResolver().call(Uri.parse("content://ls.augment.com.config"),"snapshot",null,null);ConfigSnapshot provider=bundle==null?null:ConfigSnapshot.parse(bundle.getString("snapshot"));mismatch=provider==null?"Provider snapshot missing or invalid":"";
            // Preferences also contain local appearance settings. The production schema,
            // not whatever happened to arrive in the snapshot, defines runtime membership.
            // Thus a missing runtime value still fails instead of being silently skipped.
            for(Map.Entry<String,String> entry:normalized.entrySet()){
                String key=entry.getKey(),stored=config.get(key);boolean runtime=ConfigSchema.isRuntimeKey(key);
                if(!Objects.equals(entry.getValue(),stored)||(runtime&&(provider==null||!Objects.equals(entry.getValue(),provider.get(key))))){mismatch=key+" expected="+entry.getValue()+" stored="+stored+" runtime="+runtime+" provider="+(provider==null?null:provider.get(key));break;}
            }
            if(mismatch.isEmpty())return;SystemClock.sleep(80);
        }while(SystemClock.uptimeMillis()<deadline);throw new AssertionError(mismatch);
    }
    private void open()throws Exception{page=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_arrangement").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));test.waitForIdleSync();editor=main(()->((Map<?,?>)get(page,"editors")).get("status_arrangement"));require(editor!=null,"arrangement editor");}
    private void close()throws Exception{if(page==null)return;main(()->{page.finish();return null;});test.waitForIdleSync();((ExecutorService)get(editor,"worker")).submit(()->{}).get(10,TimeUnit.SECONDS);ExecutorService worker=(ExecutorService)get(page,"worker");if(worker.isShutdown())require(worker.awaitTermination(10,TimeUnit.SECONDS),"activity worker drained");else worker.submit(()->{}).get(10,TimeUnit.SECONDS);test.waitForIdleSync();}
    private void restoreBaseline()throws Exception{require(baseline.isFile(),"durable baseline missing");JSONObject saved=new JSONObject(new String(Files.readAllBytes(baseline.toPath()),StandardCharsets.UTF_8));Map<String,String> values=new LinkedHashMap<>();for(Iterator<String> it=saved.keys();it.hasNext();){String key=it.next();values.put(key,saved.getString(key));}require(config.save(values).success,"baseline restore");require(values.equals(config.snapshot()),"all baseline values restored");require(baseline.delete(),"baseline cleanup");}
    private static Object get(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(object);}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private interface Main<T>{T run()throws Exception;}
    private <T>T main(Main<T> work)throws Exception{AtomicReference<T> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();test.runOnMainSync(()->{try{result.set(work.run());}catch(Throwable failure){error.set(failure);}});if(error.get()!=null)throw new AssertionError("UI operation failed: "+error.get(),error.get());return result.get();}
    private static void require(boolean ok,String message){if(!ok)throw new AssertionError(message);}
}
