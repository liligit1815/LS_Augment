package ls.augment.com;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Production widgets, one shared preview, draft recreation, and native legacy entry. */
final class StatusBarWorkspaceUiCases {
    private final Instrumentation test;
    private int checks;
    private File folder;
    private final JSONArray shots=new JSONArray();
    private StatusBarWorkspaceUiCases(Instrumentation test){this.test=test;}
    static JSONObject run(Instrumentation test)throws Exception{return new StatusBarWorkspaceUiCases(test).run();}
    static JSONObject transactions(Instrumentation test)throws Exception{return new StatusBarWorkspaceUiCases(test).transactions();}
    private JSONObject transactions()throws Exception{
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        android.content.SharedPreferences memory=context.getSharedPreferences("native_value_overrides",0);Map<String,?> memoryBefore=new LinkedHashMap<>(memory.getAll());
        Map<String,String> restore=new LinkedHashMap<>();for(String key:before.keySet())if(StatusBarWorkspaceSpec.ownsKey(key))restore.put(key,before.get(key));
        File baseline=new File(context.getFilesDir(),"statusbar-workspace-baseline.json");require(!baseline.exists(),"no unfinished workspace transaction test");
        java.nio.file.Files.write(baseline.toPath(),new JSONObject(restore).toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
        Activity page=test.startActivitySync(new Intent(context,StatusBarWorkspaceActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        StatusBarEditorController editor=controller(page);
        try{
            main(()->{page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);Spinner presets=find(page.getWindow().getDecorView(),Spinner.class,"预设方案");require(presets!=null&&presets.getAdapter().getCount()==2,"two action dropdown choices");presets.performClick();return null;});settle();
            main(()->{View choice=null;for(View root:android.view.inspector.WindowInspector.getGlobalWindowViews()){View option=root.findViewWithTag("choice-option:0");if(option!=null&&option.isShown())choice=option;}require(choice!=null&&choice.performClick(),"first dropdown option starts an explicit preview");return null;});settle();
            require(before.equals(config.snapshot()),"preview stays unsaved");
            main(()->{require(text(page,"应用方案").performClick(),"apply actual preset button");return null;});
            await(()->"1".equals(config.get(StatusBarWorkspaceSpec.ROWS))&&"1".equals(config.get(ConfigSchema.SYSTEMUI_MASTER)));
            require(before.get(StatusBarThemeSpec.KEY).equals(config.get(StatusBarThemeSpec.KEY)),"property preset preserves artwork");
            require(StatusBarWorkspaceSpec.preset(false).get(ConfigSchema.STATUSBAR_GRID).equals(config.get(ConfigSchema.STATUSBAR_GRID)),"single preset installs complete single-row layout");
            require("0".equals(config.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&"0".equals(config.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)),"single preset restores native clock and battery");
            StatusBarGridSpec.Item desired=new StatusBarGridSpec.Item("L2",897,15,true);
            main(()->{invoke(editor,"workspacePlace",new Class[]{String.class,StatusBarGridSpec.Item.class},"bluetooth",desired);return null;});
            await(()->{StatusBarWorkspaceSpec spec=StatusBarWorkspaceSpec.parse(config.get(StatusBarWorkspaceSpec.ICONS));return spec!=null&&spec.get("bluetooth")!=null&&spec.get("bluetooth").order==897;});
            require(StatusBarWorkspaceSpec.parse(config.get(StatusBarWorkspaceSpec.ICONS)).get("bluetooth").zone.equals("L2"),"saved second-row position retained in single-row mode");
            Map<String,String> singleSaved=new LinkedHashMap<>(config.snapshot());
            Map<String,String> dual=StatusBarWorkspaceSpec.preset(true,singleSaved);
            main(()->{invoke(editor,"previewWorkspacePreset",new Class[]{boolean.class},true);return null;});settle();
            main(()->{ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");for(Map.Entry<String,String> e:dual.entrySet())require(Objects.equals(e.getValue(),draft.get(e.getKey())),"dual preview matches applied contract: "+e.getKey());return null;});
            require(singleSaved.equals(config.snapshot()),"dual preview remains unsaved");
            main(()->{invoke(editor,"cancelPreset",new Class[0]);return null;});settle();
            require(singleSaved.equals(config.snapshot()),"dual cancel leaves saved configuration intact");
            main(()->{
                Map<String,String> nativeDraft=(Map<String,String>)get(page,"draft");
                nativeDraft.put(SystemUiOptions.PREFIX+"metrics_charging_only","1");
                FieldEditQueue nativePending=(FieldEditQueue)get(page,"pending");nativePending.put(SystemUiOptions.PREFIX+"metrics_charging_only","1");
                memory.edit().putString("remember:"+SystemUiOptions.PREFIX+"metric_width_power","77").commit();
                invoke(editor,"previewWorkspacePreset",new Class[]{boolean.class},true);require(text(page,"应用方案").performClick(),"apply actual two-row preset button");
                require("0".equals(nativeDraft.get(SystemUiOptions.PREFIX+"metrics_charging_only")),"native metric controls share applied preset values");
                require("0".equals(nativePending.restorableValues().get(SystemUiOptions.PREFIX+"metrics_charging_only")),"older queued native values are superseded by the preset");
                require(!memory.contains("remember:"+SystemUiOptions.PREFIX+"metric_width_power"),"preset clears outdated numeric input memory only for replaced values");
                return null;
            });
            await(()->{for(Map.Entry<String,String> e:dual.entrySet())if(!Objects.equals(ConfigSchema.normalize(e.getKey(),e.getValue()),config.get(e.getKey())))return false;return true;});
            require(before.get(StatusBarThemeSpec.KEY).equals(config.get(StatusBarThemeSpec.KEY))&&before.get(StatusBarFontSpec.KEY).equals(config.get(StatusBarFontSpec.KEY)),"dual preset preserves artwork and fonts");
            folder=new File(context.getExternalFilesDir(null),"statusbar-workspace-transactions");folder.mkdirs();
            SystemClock.sleep(2500);settle();capture(page,"01-dual-applied");
            Bitmap screen=test.getUiAutomation().takeScreenshot();require(screen!=null,"capture actual SystemUI with applied preset");
            try(OutputStream out=new FileOutputStream(new File(folder,"02-dual-systemui.png"))){screen.compress(Bitmap.CompressFormat.PNG,100,out);}finally{screen.recycle();}
            refinements(page,editor,config);
            main(()->{
                StatusBarAssetsController assets=(StatusBarAssetsController)get(editor,"workspaceAssets");set(assets,"fonts",StatusBarFontSpec.empty().with("clock","original","control"));
                memory.edit().putString("remember:"+SystemUiOptions.PREFIX+"hidden_icon_slots","vpn").putBoolean("open:"+SystemUiOptions.PREFIX+"hidden_icon_slots",false).commit();
                ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");draft.put(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP,"8");invoke(editor,"changed",new Class[0]);
                invoke(editor,"confirmWorkspaceReset",new Class[0]);return null;
            });settle();
            main(()->{View confirm=null;for(View root:android.view.inspector.WindowInspector.getGlobalWindowViews()){View candidate=root.findViewWithTag("glass-dialog-confirm");if(candidate!=null&&candidate.isShown())confirm=candidate;}require(confirm!=null&&confirm.performClick(),"confirmed actual full-reset dialog");return null;});
            Map<String,String> expected=StatusBarWorkspaceSpec.reset();await(()->{Map<String,String> current=config.snapshot();for(Map.Entry<String,String> e:expected.entrySet())if(!Objects.equals(e.getValue(),current.get(e.getKey())))return false;return true;});
            SystemClock.sleep(700);require("0".equals(config.get(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP)),"queued edits do not return after reset");
            main(()->{require(!((StatusBarAssetsController)get(editor,"workspaceAssets")).workspaceDirty(),"reset clears unpublished asset/font drafts");return null;});
            require(!memory.contains("remember:"+SystemUiOptions.PREFIX+"hidden_icon_slots"),"reset clears disabled-setting memory");
            Map<String,String> untouched=new LinkedHashMap<>(config.snapshot());
            main(()->{((ScrollView)get(editor,"configScroll")).scrollTo(0,0);return null;});settle();
            main(()->{Switch master=page.findViewById(android.R.id.content).findViewWithTag("config:"+ConfigSchema.SYSTEMUI_MASTER);require(master!=null&&!master.isChecked(),"actual master switch starts disabled");master.performClick();require(master.isChecked(),"actual master switch enables native baseline");return null;});
            await(()->"1".equals(config.get(ConfigSchema.SYSTEMUI_MASTER)));SystemClock.sleep(700);
            for(String key:untouched.keySet())if(!ConfigSchema.SYSTEMUI_MASTER.equals(key))require(Objects.equals(untouched.get(key),config.get(key)),"master alone does not save implicit field: "+key);
            require(config.get(ConfigSchema.STATUSBAR_GRID).isEmpty()&&config.get(StatusBarEditPolicy.KEY).isEmpty(),"switch writes neither default grid nor full-layout ownership");
            settle();main(()->{View master=tag(page,"config:"+ConfigSchema.SYSTEMUI_MASTER);Rect visible=new Rect();require(master!=null&&master.getGlobalVisibleRect(visible)&&visible.height()>0,"enabled master remains visible in configuration page");return null;});capture(page,"03-only-master-enabled");
            main(()->{StatusBarGridSpec.Item old=(StatusBarGridSpec.Item)invoke(editor,"workspaceItem",new Class[]{String.class},"bluetooth");invoke(editor,"workspacePlace",new Class[]{String.class,StatusBarGridSpec.Item.class},"bluetooth",new StatusBarGridSpec.Item(old.zone,old.order,12,old.visible));return null;});
            await(()->StatusBarEditPolicy.resolve(config::get).owns("bluetooth","size"));
            StatusBarEditPolicy selective=StatusBarEditPolicy.resolve(config::get);
            require(!selective.full&&!selective.owns("bluetooth","zone")&&!selective.owns("bluetooth","order")&&!selective.item("battery"),"one icon size saves only its own field");
            for(String key:before.keySet())if(!StatusBarWorkspaceSpec.ownsKey(key))require(Objects.equals(before.get(key),config.get(key)),"unrelated setting preserved: "+key);
            return new JSONObject().put("success",true).put("checks",checks).put("evidenceScope","native preset/save/reset and durable configuration; no SystemUI visual claim");
        }catch(Exception|AssertionError failure){java.nio.file.Files.write(new File(context.getFilesDir(),"statusbar-workspace-failure.txt").toPath(),failure.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));throw failure;
        }finally{
            ExecutorService nativeWorker=(ExecutorService)get(page,"worker");main(()->{page.finish();return null;});settle();
            StatusBarEditSession.WORKER.submit(()->{}).get(10,TimeUnit.SECONDS);
            if(nativeWorker.isShutdown())require(nativeWorker.awaitTermination(10,TimeUnit.SECONDS),"native writer drained");else nativeWorker.submit(()->{}).get(10,TimeUnit.SECONDS);
            settle();AppConfig.SaveResult result=config.save(restore);boolean restored=result.success&&before.equals(config.snapshot());
            android.content.SharedPreferences.Editor restoreMemory=memory.edit();for(String key:memory.getAll().keySet())if(memoryKey(key))restoreMemory.remove(key);
            for(Map.Entry<String,?> entry:memoryBefore.entrySet())if(memoryKey(entry.getKey())){Object value=entry.getValue();if(value instanceof Boolean)restoreMemory.putBoolean(entry.getKey(),(Boolean)value);else if(value instanceof String)restoreMemory.putString(entry.getKey(),(String)value);}
            restoreMemory.commit();require(memoryBefore.equals(memory.getAll()),"transaction test restores input memory");
            require(restored,"transaction test restores original settings");
            java.nio.file.Files.delete(baseline.toPath());
        }
    }
    private static boolean memoryKey(String key){int colon=key.indexOf(':');return colon>=0&&StatusBarWorkspaceSpec.ownsKey(key.substring(colon+1));}
    private void refinements(Activity page,StatusBarEditorController editor,AppConfig config)throws Exception{
        final int savedSystemSize=StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID)).get("system_icons").size;
        main(()->{tag(page,"status-group:1").performClick();return null;});settle();
        main(()->{require(text(page,"系统图标默认设置")==null&&text(page,"硬件指标共用设置")==null,"redundant system wrappers removed");
            View general=(View)((Map<?,?>)get(editor,"advancedViews")).get("workspace-general");if(general.getVisibility()!=View.VISIBLE)((ViewGroup)general.getParent()).getChildAt(0).performClick();return null;});settle();
        main(()->{LinearLayout general=(LinearLayout)((Map<?,?>)get(editor,"advancedViews")).get("workspace-general");
            int[] unitsAt=new int[2],hiddenAt=new int[2],chargingAt=new int[2];text(general,"温度与电量隐藏单位").getLocationOnScreen(unitsAt);text(general,"隐藏指定图标").getLocationOnScreen(hiddenAt);text(general,"仅充电时显示电流和功率").getLocationOnScreen(chargingAt);
            require(unitsAt[1]<hiddenAt[1]&&hiddenAt[1]<chargingAt[1],"exact general tail order: "+Arrays.toString(unitsAt)+" / "+Arrays.toString(hiddenAt)+" / "+Arrays.toString(chargingAt)+" shown="+general.isShown()+" children="+general.getChildCount());
            int[] order=new int[2],sibling=new int[2];text(general,"显示顺序").getLocationOnScreen(order);text(general,"系统图标大小").getLocationOnScreen(sibling);require(Math.abs(order[0]-sibling[0])<=1,"numeric order aligns with system feature titles");
            Switch size=find(page.getWindow().getDecorView(),Switch.class,"系统图标大小");require(size!=null&&size.isChecked(),"full preset has explicit system size");size.performClick();return null;});
        await(()->StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID)).get("system_icons").size==0);settle();
        main(()->{require(find(page.getWindow().getDecorView(),SeekBar.class,"图标大小（dp）")==null,"size slider absent when disabled");find(page.getWindow().getDecorView(),Switch.class,"系统图标大小").performClick();return null;});
        await(()->StatusBarGridSpec.parse(config.get(ConfigSchema.STATUSBAR_GRID)).get("system_icons").size==savedSystemSize);settle();
        main(()->{SeekBar size=find(page.getWindow().getDecorView(),SeekBar.class,"图标大小（dp）");require(size!=null&&size.isShown(),"enabling system size reveals its slider");return null;});capture(page,"04-general-open");
        main(()->{Switch combined=find(page.getWindow().getDecorView(),Switch.class,"三合一图标");require(combined!=null&&combined.isChecked(),"single combined switch");combined.performClick();return null;});
        await(()->"0".equals(config.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)));settle();
        main(()->{require(find(page.getWindow().getDecorView(),SeekBar.class,"圆形组件大小（dp）")==null,"combined settings absent when off");find(page.getWindow().getDecorView(),Switch.class,"三合一图标").performClick();return null;});
        await(()->"1".equals(config.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)));settle();
        main(()->{UiKit.Fold combined=(UiKit.Fold)get(editor,"connectivityFold");require(combined.content.getVisibility()==View.VISIBLE,"enabling combined reveals parameters");
            require(text(combined.content,"高级设置：三合一图标")==null&&text(page,"三合一图形图标")==null&&text(combined.content,"位置")!=null&&text(combined.content,"内部上方")!=null,"combined parameters flattened with position entry");
            int[] order=new int[2],size=new int[2];text(combined.content,"显示顺序").getLocationOnScreen(order);text(combined.content,"圆形组件大小（dp）").getLocationOnScreen(size);require(Math.abs(order[0]-size[0])<=1,"combined order aligns with numeric peers");
            View general=(View)((Map<?,?>)get(editor,"advancedViews")).get("workspace-general");if(general.getVisibility()==View.VISIBLE)((ViewGroup)general.getParent()).getChildAt(0).performClick();((ScrollView)get(editor,"configScroll")).scrollTo(0,0);return null;});settle();capture(page,"05-three-in-one-open");
        main(()->{tag(page,"status-group:0").performClick();return null;});settle();
    }
    private void await(java.util.function.BooleanSupplier condition)throws Exception{long until=SystemClock.uptimeMillis()+15000;while(!condition.getAsBoolean()&&SystemClock.uptimeMillis()<until){SystemClock.sleep(100);test.waitForIdleSync();}require(condition.getAsBoolean(),"configuration reached expected state");}
    private JSONObject run()throws Exception{
        Context context=test.getTargetContext();AppConfig config=new AppConfig(context);Map<String,String> before=new LinkedHashMap<>(config.snapshot());
        Activity page=test.startActivitySync(new Intent(context,StatusBarWorkspaceActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        folder=new File(context.getExternalFilesDir(null),"statusbar-workspace-ui");folder.mkdirs();
        StatusBarEditorController editor=controller(page);
        main(()->{page.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);return null;});
        try{
            settle();capture(page,"01-properties");
            main(()->{
                require("status_layout".equals(ModuleNavigation.route(page)),"new route");
                View preview=tag(page,"statusbar-shared-preview");require(preview!=null,"shared preview");
                View path=tag(page,"page-path"),card=(View)preview.getParent();int[] pathAt=new int[2],cardAt=new int[2];path.getLocationOnScreen(pathAt);card.getLocationOnScreen(cardAt);float gap=(cardAt[1]-pathAt[1]-path.getHeight())/context.getResources().getDisplayMetrics().density;
                require(gap>=8f&&gap<=12f,"breadcrumb to first card gap: "+gap);
                View first=tag(page,"status-group:0");int[] start=new int[2];first.getLocationOnScreen(start);
                for(int i=0;i<4;i++){View button=tag(page,"status-group:"+i);int[] at=new int[2];button.getLocationOnScreen(at);require(button.isShown()&&at[1]==start[1],"all four groups on same row: "+i+" at="+at[1]+" expected="+start[1]+" shown="+button.isShown());require(button.getWidth()>0,"tab has width");}
                Spinner rows=find(page.getWindow().getDecorView(),Spinner.class,"状态栏排数");require(rows!=null&&rows.getAdapter().getCount()==2,"only single/double row choices");
                int[] rowAt=new int[2],edgeAt=new int[2],choiceAt=new int[2];TextView rowTitle=text(page,"状态栏排数"),edgeTitle=text(page,"高度与四边边距");
                rowTitle.getLocationOnScreen(rowAt);edgeTitle.getLocationOnScreen(edgeAt);rows.getLocationOnScreen(choiceAt);
                require(Math.abs(rowAt[0]-edgeAt[0])<=1,"row-count title aligns with adjacent section");
                ViewGroup row=(ViewGroup)rows.getParent();require(rows.getRight()<=row.getWidth()-row.getPaddingRight(),"row-count choice stays inside its row");
                require(rowAt[0]+rowTitle.getWidth()<=choiceAt[0],"title does not overlap choice");
                TextView selected=(TextView)rows.getSelectedView();require(selected!=null&&selected.getPaint().measureText(selected.getText().toString())<=selected.getWidth()-selected.getPaddingLeft()-selected.getPaddingRight(),"selected row label fits fully");
                require(text(page,"恢复本组属性")==null&&text(page,"重置状态栏配置")!=null,"one full reset entry");
                return null;
            });
            View shared=tag(page,"statusbar-shared-preview");
            if(context.getResources().getConfiguration().orientation==android.content.res.Configuration.ORIENTATION_LANDSCAPE){
                main(()->{TextView collapse=text(page,"收起");require(collapse!=null&&collapse.performClick(),"landscape preview can collapse to expose settings");return null;});settle();capture(page,"01-landscape-compact");
                main(()->{require(((ScrollView)get(editor,"configScroll")).getHeight()>=64*context.getResources().getDisplayMetrics().density,"collapsed landscape preview leaves usable configuration area");return null;});
            }
            main(()->{View edges=(View)((Map<?,?>)get(editor,"advancedViews")).get("workspace-edges");((ViewGroup)edges.getParent()).getChildAt(0).performClick();for(String side:new String[]{"左","上","右","下"}){SeekBar margin=find(page.getWindow().getDecorView(),SeekBar.class,side+"侧边距（0 原厂）");require(margin!=null&&margin.getMax()==128,"signed OEM margin range exposed: "+side);}return null;});settle();capture(page,"01-signed-margins");
            main(()->{View edges=(View)((Map<?,?>)get(editor,"advancedViews")).get("workspace-edges");((ViewGroup)edges.getParent()).getChildAt(0).performClick();return null;});
            main(()->{Spinner presets=find(page.getWindow().getDecorView(),Spinner.class,"预设方案");require(presets!=null&&presets.getAdapter().getCount()==2,"preset dropdown contains exactly two choices");require(!((Map<?,?>)get(editor,"advancedViews")).containsKey("workspace-presets"),"no obsolete preset description group");return null;});settle();capture(page,"01-presets");
            main(()->{invoke(editor,"previewWorkspacePreset",new Class[]{boolean.class},false);return null;});settle();
            main(()->{ConfigEditDraft draft=(ConfigEditDraft)get(editor,"draft");require("1".equals(draft.get(StatusBarWorkspaceSpec.ROWS)),"single preset preview");require(before.equals(config.snapshot()),"preset preview does not save");invoke(editor,"cancelPreset",new Class[0]);return null;});
            main(()->{tag(page,"status-group:1").performClick();return null;});settle();capture(page,"02-system");
            main(()->{
                LinearLayout content=(LinearLayout)get(editor,"content");require(content.getChildCount()==1,"one system card");
                require(text(page,"通用设置")!=null&&text(page,"三合一图标")!=null&&text(page,"独立图标配置")!=null,"three sections together");
                require(shared==tag(page,"statusbar-shared-preview"),"preview instance survives tab");
                return null;
            });
            main(()->{View directory=(View)((Map<?,?>)get(editor,"advancedViews")).get("workspace-directory");((ViewGroup)directory.getParent()).getChildAt(0).performClick();return null;});settle();capture(page,"02-directory-loaded");
            main(()->{
                Spinner filter=find(page.getWindow().getDecorView(),Spinner.class,"筛选图标");ImageButton refresh=find(page.getWindow().getDecorView(),ImageButton.class,"刷新本机图标");
                require(filter!=null&&filter.getAdapter().getCount()==4,"four icon filters");require(refresh!=null&&text(page,"刷新本机图标")==null,"refresh is a compact icon action");
                require(refresh.getLeft()>=filter.getRight()&&refresh.getHeight()>=44*context.getResources().getDisplayMetrics().density,"refresh sits right of filter with full touch area");
                filter.setSelection(3);return null;
            });settle();capture(page,"02-directory-all");
            main(()->{require(tag(page,"navigation:status-icon:bluetooth").performClick(),"open independent Bluetooth entry");return null;});settle();capture(page,"02-bluetooth-order");
            main(()->{require(text(page,"显示顺序")!=null,"independent order is directly accessible");require(text(page,"网速显示高级设置")==null&&text(page,"隐藏移动网络类型")==null,"unrelated network options removed from icon detail");editor.workspaceBack();return null;});settle();
            main(()->{require(tag(page,"navigation:status-icon:wifi").performClick(),"open Wi-Fi entry");return null;});settle();capture(page,"02-wifi-specific");
            main(()->{require(text(page,"隐藏 Wi-Fi 收发箭头")!=null&&text(page,"隐藏移动网络类型")==null&&text(page,"网速显示高级设置")==null,"Wi-Fi owns only Wi-Fi settings");editor.workspaceBack();return null;});settle();
            main(()->{require(tag(page,"navigation:status-icon:network").performClick(),"open network-speed entry");return null;});settle();capture(page,"02-network-specific");
            main(()->{require(text(page,"网速显示高级设置")!=null&&text(page,"隐藏卡 1 信号")==null,"network speed owns only its settings");editor.workspaceBack();return null;});settle();
            main(()->{
                JSONObject real=(JSONObject)get(editor,"workspaceInventory");long now=System.currentTimeMillis();
                JSONObject fixture=new JSONObject().put("observedSurfaces",new JSONArray().put("main")).put("surfaceObservedAt",new JSONObject().put("main",now))
                    .put("surfaces",new JSONObject().put("main",new JSONArray().put(new JSONObject().put("id","wifi").put("state","visible")).put(new JSONObject().put("id","bluetooth").put("state","hidden"))));
                set(editor,"workspaceInventory",fixture);set(editor,"workspaceScope","all");set(editor,"workspaceFilter",0);invoke(editor,"renderWorkspace",new Class[0]);
                require(tag(page,"navigation:status-icon:wifi")!=null&&tag(page,"navigation:status-icon:bluetooth")!=null&&tag(page,"navigation:status-icon:power")==null,"loaded includes visible and hidden observations only");
                set(editor,"workspaceFilter",2);invoke(editor,"renderWorkspace",new Class[0]);require(tag(page,"navigation:status-icon:wifi")==null&&tag(page,"navigation:status-icon:bluetooth")!=null,"not-shown excludes visible and never-observed items");
                fixture.getJSONObject("surfaceObservedAt").put("main",now-31000);set(editor,"workspaceFilter",0);invoke(editor,"renderWorkspace",new Class[0]);require(tag(page,"navigation:status-icon:wifi")==null,"stale observations do not count as loaded");
                set(editor,"workspaceInventory",real);set(editor,"workspaceFilter",3);invoke(editor,"renderWorkspace",new Class[0]);
                FrameLayout nativeRoot=new FrameLayout(context);nativeRoot.setPadding(23,7,31,9);nativeRoot.layout(0,0,300,100);
                StatusBarNativeGeometry geometry=StatusBarNativeGeometry.read(nativeRoot);require(geometry!=null&&geometry.left==23&&geometry.top==7&&geometry.right==31&&geometry.bottom==9,"OEM root padding is measured without invented 4dp inset");
                nativeRoot.setTranslationX(80);nativeRoot.setScaleX(.5f);StatusBarNativeGeometry after=StatusBarNativeGeometry.read(nativeRoot);require(after.left==geometry.left&&after.right==geometry.right,"render transforms do not feed back into OEM baseline");
                nativeRoot.setPadding(0,0,0,0);require(StatusBarNativeGeometry.read(nativeRoot)==null,"unknown content geometry is not treated as zero OEM margins");
                Context systemContext=context.createPackageContext("com.android.systemui",Context.CONTEXT_IGNORE_SECURITY);
                FrameLayout edgeRoot=new FrameLayout(systemContext);View carrier=new View(systemContext),icons=new View(systemContext);
                carrier.setId(systemContext.getResources().getIdentifier("keyguard_carrier_text","id","com.android.systemui"));icons.setId(systemContext.getResources().getIdentifier("system_icons_container","id","com.android.systemui"));
                require(carrier.getId()!=0&&icons.getId()!=0,"keyguard edge resource capability available on this device");edgeRoot.addView(carrier);edgeRoot.addView(icons);edgeRoot.layout(0,0,300,100);carrier.layout(19,0,180,100);carrier.setPadding(3,7,0,9);icons.layout(190,7,275,91);
                StatusBarNativeGeometry edges=StatusBarNativeGeometry.read(edgeRoot);require(edges!=null&&edges.left==22&&edges.top==7&&edges.right==25&&edges.bottom==9,"older keyguard edge margins are preserved");
                FrameLayout sharedRoot=new FrameLayout(systemContext);View contents=new View(systemContext);contents.setId(systemContext.getResources().getIdentifier("status_bar_contents","id","com.android.systemui"));require(contents.getId()!=0,"shared content resource capability available on this device");sharedRoot.addView(contents);sharedRoot.layout(0,0,300,100);contents.layout(9,3,289,97);contents.setPadding(11,2,13,4);contents.setTranslationX(60);contents.setScaleX(.3f);
                StatusBarNativeGeometry sharedGeometry=StatusBarNativeGeometry.read(sharedRoot);require(sharedGeometry!=null&&sharedGeometry.left==20&&sharedGeometry.top==5&&sharedGeometry.right==24&&sharedGeometry.bottom==7,"shared content uses OEM layout and padding, excluding transforms");
                return null;
            });
            main(()->{tag(page,"status-group:3").performClick();return null;});settle();
            final Bundle saved=new Bundle();
            main(()->{
                StatusBarAssetsController assets=(StatusBarAssetsController)get(editor,"workspaceAssets");
                // A draft-only original font choice requires no imported file or system write.
                set(assets,"fonts",StatusBarFontSpec.empty().with("clock","original","control"));
                invoke(assets,"showPage",new Class[0]);
                tag(page,"status-group:2").performClick();require(assets.workspaceDirty(),"asset draft survives tab change");
                require(shared==tag(page,"statusbar-shared-preview"),"notification tab uses same preview");
                editor.onSaveInstanceState(saved);require(saved.getBundle("workspace-assets")!=null,"nested asset state saved");
                assets.workspaceReset();return null;
            });settle();capture(page,"03-notifications");
            main(()->{tag(page,"status-group:3").performClick();return null;});settle();capture(page,"04-assets");
            // Recreate the controller from its actual saved state, using the same production host.
            main(()->{
                editor.onDestroy();StatusBarEditorController restored=new StatusBarEditorController(page,"status_layout",false);
                restored.onCreate(saved);restored.onResume();
                StatusBarAssetsController assets=(StatusBarAssetsController)get(restored,"workspaceAssets");
                require("original".equals(assets.workspaceFonts().get("clock","control")),"scoped font draft survives reconstruction");
                require((Integer)get(restored,"workspaceGroup")==2,"selected group survives reconstruction");
                require((Integer)get(restored,"workspaceFilter")==3,"icon filter survives reconstruction");
                assets.workspaceReset();restored.onPause();restored.onDestroy();return null;
            });
            require(before.equals(config.snapshot()),"workspace navigation and draft checks leave settings unchanged");
            Activity legacy=test.startActivitySync(new Intent(context,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_legacy").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            try{settle();require("status_legacy".equals(ModuleNavigation.route(legacy)),"legacy route retained");capture(legacy,"05-legacy");}finally{main(()->{legacy.finish();return null;});}
            return new JSONObject().put("success",true).put("checks",checks).put("settingsUnchanged",true).put("screenshots",shots).put("directory",folder.getAbsolutePath());
        }finally{main(()->{StatusBarAssetsController assets=(StatusBarAssetsController)get(editor,"workspaceAssets");assets.workspaceReset();page.finish();return null;});require(before.equals(config.snapshot()),"cleanup leaves settings unchanged");}
    }
    private StatusBarEditorController controller(Activity page)throws Exception{Map<?,?> editors=(Map<?,?>)get(page,"editors");for(Object value:editors.values())if(value instanceof StatusBarEditorController)return (StatusBarEditorController)value;throw new AssertionError("missing workspace controller");}
    private <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);test.runOnMainSync(task);return task.get();}
    private void settle(){test.waitForIdleSync();SystemClock.sleep(250);test.waitForIdleSync();}
    private void capture(Activity page,String name)throws Exception{main(()->{View view=page.getWindow().getDecorView();Bitmap bitmap=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);view.draw(new Canvas(bitmap));try(OutputStream out=new FileOutputStream(new File(folder,name+".png"))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}bitmap.recycle();shots.put(name+".png");return null;});}
    private void require(boolean okay,String message){checks++;if(!okay)throw new AssertionError(message);}
    private static View tag(Activity page,String value){return page.getWindow().getDecorView().findViewWithTag(value);}
    private static TextView text(Activity page,String value){return text(page.getWindow().getDecorView(),value);}
    private static TextView text(View view,String value){if(view instanceof TextView&&value.contentEquals(((TextView)view).getText()))return (TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView found=text(((ViewGroup)view).getChildAt(i),value);if(found!=null)return found;}return null;}
    private static <T extends View>T find(View root,Class<T> type,String description){if(type.isInstance(root)&&description.contentEquals(root.getContentDescription()==null?"":root.getContentDescription()))return type.cast(root);if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){T found=find(((ViewGroup)root).getChildAt(i),type,description);if(found!=null)return found;}return null;}
    private static Field field(Object object,String name)throws Exception{for(Class<?> type=object.getClass();type!=null;type=type.getSuperclass())try{Field found=type.getDeclaredField(name);found.setAccessible(true);return found;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static Object get(Object object,String name)throws Exception{return field(object,name).get(object);}
    private static void set(Object object,String name,Object value)throws Exception{field(object,name).set(object,value);}
    private static Object invoke(Object object,String name,Class<?>[] types,Object...args)throws Exception{Method method=object.getClass().getDeclaredMethod(name,types);method.setAccessible(true);return method.invoke(object,args);}
}
