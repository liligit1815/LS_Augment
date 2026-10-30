package ls.augment.com;

import android.app.*;
import android.content.*;
import android.content.ClipboardManager;
import android.graphics.Rect;
import android.os.*;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.*;

/** Direct application controls backed by the real catalogue and reusable native editors. */
public class EnhancementSettingsActivity extends Activity implements NativeEditorController.Host, ScopeRestartDialog.Preparation {
    // Retain admission/order across configuration recreation, without retaining an Activity.
    private static final class InputSession {
        final ExecutorService worker=Executors.newSingleThreadExecutor();
        final FieldEditQueue pending=new FieldEditQueue();
        final BatteryHealthPanel.State batteryHealth=new BatteryHealthPanel.State();
        Bundle invalidInputs;
        private String failure;
        synchronized void failed(String message){failure=message;}
        synchronized String takeFailure(){String message=failure;failure=null;return message;}
    }
    private InputSession inputSession;
    private ExecutorService worker;
    private final Handler main=new Handler(Looper.getMainLooper());
    private final LinkedHashMap<String,String> draft=new LinkedHashMap<>();
    private FieldEditQueue pending;
    private Bundle invalidInputs;
    private final Map<String,EnhancementOption> options=new LinkedHashMap<>();
    private final Map<String,NativeEditorController> editors=new LinkedHashMap<>();
    private final Map<String,View> controls=new LinkedHashMap<>();
    private final Map<String,TextView> inputErrors=new LinkedHashMap<>();
    private final Map<String,TextView> aodParameterStates=new LinkedHashMap<>();
    private final Map<String,Button> aodParameterRestores=new LinkedHashMap<>();
    private final Runnable autoSave=this::flush;
    private Dialog islandAppStyleDialog;
    private boolean bindingIslandMaster;
    private UiKit.Fold nativeScenesFold;
    private SharedPreferences islandPreferences;
    private SharedPreferences sceneDiagnostics;
    private final SharedPreferences.OnSharedPreferenceChangeListener sceneDiagnosticListener=(prefs,key)->{
        if(key!=null&&(key.equals(NativeIslandMode.DIAGNOSTIC)||key.equals(MagicIslandPolicy.CAPABILITY)||key.startsWith(NativeIslandSceneOptions.ENABLED+"_")&&key.endsWith("_capability")))main.post(this::refreshIslandMaster);
    };
    private final SharedPreferences.OnSharedPreferenceChangeListener islandListener=(prefs,key)->{
        if(key==null||SystemUiOptions.ISLAND.equals(key)||ConfigSchema.NATIVE_ISLAND_SELECTED.equals(key))main.post(this::refreshIslandMaster);
    };
    private UiKit ui;private AppConfig config;private LinearLayout body;private SharedPreferences gateMemory;
    private String group,targetId,query="",fontKey,pendingEditor;
    private static final String AOD_FONT_KEY=SystemUiOptions.PREFIX+"aod_clock_font";
    // Main-thread request state only; restoring the font retires old import callbacks.
    private long aodFontGeneration,aodFontPickerGeneration;
    private boolean aodFontPickerPending,aodFontImportPending;
    private boolean resumedDirectory;
    private View queryAnchor;private Bundle editorStates;
    private ArrayAdapter<String> memoryContentAdapter;
    private View memoryColorsRow;
    private SeekBar recentsRadiusSlider;
    private TextView recentsRadiusValue,recentsRadiusStatus;
    private RecentsCardRadiusUiRange recentsRadiusRange;
    private int recentsRadiusRequest;
    private boolean recentsRadiusActive,recentsRadiusLoading,recentsRadiusTracking,recentsRadiusUpdatePending;
    private RecentsCardRadiusUiRange recentsRadiusPendingRange;
    private SharedPreferences recentsRadiusPreferences;
    private final SharedPreferences.OnSharedPreferenceChangeListener recentsRadiusListener=(prefs,key)->{
        if(recentsRadiusActive&&(key==null||RecentsCardRadiusStore.KEY.equals(key)))loadRecentsRadiusRange();
    };
    private LinearLayout updateLinksContent;
    private SharedPreferences updateLinksPreferences;
    private int updateLinksRequest;
    private final Runnable reloadUpdateLinks=this::refreshUpdateLinks;
    private final SharedPreferences.OnSharedPreferenceChangeListener updateLinksListener=(prefs,key)->{
        main.removeCallbacks(reloadUpdateLinks);main.post(reloadUpdateLinks);
    };
    private BackGestureIconEditor backGestureIcons;
    private ExtraDimTilePreference extraDimTile;
    private LiftArcSettingsEditor liftArcEditor;
    private BatteryHealthPanel batteryHealthPanel;
    private final Map<String,ModuleHierarchy.Section> sectionStates=new LinkedHashMap<>();
    private SharedPreferences sectionPreferences;
    private final SharedPreferences.OnSharedPreferenceChangeListener sectionListener=(prefs,key)->runOnUiThread(this::refreshSectionCounts);
    private static final String UI_MEMORY="native_value_overrides";
    public static void open(Activity owner,String group){owner.startActivity(new Intent(owner,EnhancementSettingsActivity.class).putExtra("group",group));}
    @Override public void onCreate(Bundle state){
        super.onCreate(state);
        Object retained=getLastNonConfigurationInstance();
        inputSession=retained instanceof InputSession?(InputSession)retained:new InputSession();
        worker=inputSession.worker;pending=inputSession.pending;invalidInputs=inputSession.invalidInputs;
        if(state!=null&&retained==null)inputSession.batteryHealth.restore(state.getBundle("batteryHealth"));
        config=new AppConfig(this);ui=new UiKit(this);
        group=getIntent().getStringExtra("group");if(group==null)group="system";
        targetId=getIntent().getStringExtra("target");if("collab".equals(targetId))targetId="theme";query=getIntent().getStringExtra("query");if(query==null)query="";
        if(!(this instanceof StatusBarSettingsActivity||this instanceof StatusBarWorkspaceActivity)&&(targetId!=null||getIntent().hasExtra("group"))){
            String route=ModuleHierarchy.resolve(ModuleNavigation.route(this));
            if(!route.startsWith("target-")&&ModuleHierarchy.group(route)==null){ModuleNavigation.open(this,route);finish();return;}
            getIntent().putExtra(ModuleNavigation.EXTRA_ROUTE,route);
            if(ModuleHierarchy.isRestricted(route)&&!HiddenEntrySession.isUnlocked()){finish();return;}
            ModuleHierarchy.Section selected=ModuleHierarchy.group(route);if(selected!=null)targetId=selected.target;
            else if(route.startsWith("target-"))targetId=route.substring(7);
        }
        if(targetId!=null&&ModulePresentationCatalog.find(targetId)==null){toast("未找到此功能分组");finish();return;}
        // Snapshot intent before confirmed: completion may remove it only after durable publication.
        Map<String,String> retainedValues=pending.restorableValues();
        for(EnhancementOption o:EnhancementCatalog.options()){options.put(o.key,o);draft.put(o.key,config.get(o.key));}
        gateMemory=getSharedPreferences(UI_MEMORY,MODE_PRIVATE);
        if(state!=null){
            fontKey=state.getString("fontKey");pendingEditor=state.getString("pendingEditor");editorStates=state.getBundle("editors");
            aodFontGeneration=state.getLong("aodFontGeneration",0);
            aodFontPickerGeneration=state.getLong("aodFontPickerGeneration",0);
            aodFontPickerPending=state.getBoolean("aodFontPickerPending",false);
            // A retained queue is newer than the Bundle snapshot and already owns old in-flight writes.
            Bundle saved=isApplicationDirectory()||retained instanceof InputSession?null:state.getBundle("draft");
            if(saved!=null)for(String key:saved.keySet()){
                if(!draft.containsKey(key))continue;
                String value=saved.getString(key);if(value==null)continue;
                String normalized=ConfigSchema.normalize(key,value);
                if(normalized!=null){draft.put(key,normalized);if(!normalized.equals(config.get(key)))pending.put(key,normalized);}
            }
        }
        draft.putAll(retainedValues);
        if(this instanceof StatusBarSettingsActivity||this instanceof StatusBarWorkspaceActivity){
            StatusBarEditorController editor=new StatusBarEditorController(this,ModuleNavigation.route(this),false);
            editor.setRelatedFeatures(this instanceof StatusBarWorkspaceActivity?NativeFeatureGroups.forGroup("statusbar"):ModuleHierarchy.statusBarFeatures(),this::feature);
            editors.put(editor.route,editor);
            editor.onCreate(editorStates==null?null:editorStates.getBundle(editor.route));
        }else {render(state==null?0:state.getInt("scrollY"));ui.restoreState(state);if(liftArcEditor!=null)liftArcEditor.restoreState(state,()->body.post(()->{ScrollView scroll=scrollView();if(scroll!=null)scroll.scrollTo(0,state.getInt("scrollY"));}));}
        if(!sectionStates.isEmpty()){sectionPreferences=getSharedPreferences(AppConfig.PREFS,MODE_PRIVATE);sectionPreferences.registerOnSharedPreferenceChangeListener(sectionListener);refreshSectionCounts();}
        if(!pending.isEmpty())main.post(autoSave);
        if("group/notifications/island".equals(ModuleNavigation.route(this))){
            islandPreferences=getSharedPreferences(AppConfig.PREFS,MODE_PRIVATE);
            islandPreferences.registerOnSharedPreferenceChangeListener(islandListener);
            sceneDiagnostics=getSharedPreferences(AppConfig.DIAGNOSTICS,MODE_PRIVATE);
            sceneDiagnostics.registerOnSharedPreferenceChangeListener(sceneDiagnosticListener);
        }
        // Old-save failure remains visible after a configuration recreation.
        worker.execute(()->main.post(this::showSaveFailure));
    }
    void registerStatusAssets(StatusBarAssetsController editor){editors.put("status_assets",editor);}
    void flushStatusbarForReset(Runnable ready,Runnable failed){
        flush();worker.execute(()->main.post(()->{if(isFinishing()||isDestroyed())return;if(!pending.isEmpty()){toast("配置尚未保存，请修正输入后重试重置");failed.run();}else ready.run();}));
    }
    void refreshStatusbarAfterReset(){
        SharedPreferences.Editor memory=gateMemory.edit();
        memory.remove("remember:"+ConfigSchema.STATUSBAR_GRID);
        for(String key:options.keySet())if(StatusBarWorkspaceSpec.ownsKey(key)){
            draft.put(key,config.get(key));memory.remove("open:"+key).remove("value:"+key).remove("remember:"+key);
            if(invalidInputs!=null)invalidInputs.remove(key);
        }
        memory.apply();
    }
    void applyStatusbarPresetValues(Map<String,String> values){
        SharedPreferences.Editor memory=gateMemory.edit();
        if(values.containsKey(ConfigSchema.STATUSBAR_GRID))memory.remove("remember:"+ConfigSchema.STATUSBAR_GRID);
        for(Map.Entry<String,String> entry:values.entrySet())if(options.containsKey(entry.getKey())&&StatusBarWorkspaceSpec.ownsKey(entry.getKey())){
            String key=entry.getKey(),value=ConfigSchema.normalize(key,entry.getValue());
            if(value==null)continue;
            // Replace any older native edit, including one already in flight,
            // so its own save queue also converges on the applied preset.
            draft.put(key,value);if(pending.needsSubmission(key))pending.put(key,value);
            memory.remove("open:"+key).remove("value:"+key).remove("remember:"+key);
            if(invalidInputs!=null)invalidInputs.remove(key);
        }
        memory.apply();
        if(!pending.isEmpty()){main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);}
    }
    void statusWorkspaceBack(){for(NativeEditorController editor:editors.values())if(editor instanceof StatusBarEditorController){((StatusBarEditorController)editor).workspaceBack();return;}}
    void statusWorkspaceAncestor(String route){for(NativeEditorController editor:editors.values())if(editor instanceof StatusBarEditorController){((StatusBarEditorController)editor).workspaceAncestor(route);return;}}
    private void render(int previousY){
        stopRecentsRadiusRange();recentsRadiusSlider=null;recentsRadiusValue=null;recentsRadiusStatus=null;
        recentsRadiusRange=null;recentsRadiusLoading=true;
        if(liftArcEditor!=null){liftArcEditor.onDestroy();liftArcEditor=null;}
        String route=ModuleNavigation.route(this);
        ModulePresentationCatalog.Category target=ModulePresentationCatalog.find(targetId);
        ModuleHierarchy.Section selected=ModuleHierarchy.group(route);
        String scope=selected!=null?ModuleHierarchy.restartScope(selected):target!=null&&target.restartScope!=null?ModuleHierarchy.restartScopeForCategory(target.id):null;
        String title=ModuleHierarchy.title(route);
        body=ui.detailPage(title.isEmpty()?EnhancementCatalog.title(group):title,scope);
        sectionStates.clear();aodParameterStates.clear();aodParameterRestores.clear();
        if(target!=null&&selected==null){
            LinearLayout card=ui.preferenceCard();card.setTag("application-groups:"+targetId);body.addView(card,ui.wrap());
            for(ModuleHierarchy.Section section:ModuleHierarchy.sections(targetId)){
                if(section.restricted&&!HiddenEntrySession.isUnlocked())continue;
                if(card.getChildCount()>0)divider(card);
                String label=section.title,summary=ModuleHierarchy.summary(section);
                card.addView(ui.preferenceRow(section.route(),label,label.equals(summary)?"":summary,()->ModuleNavigation.open(this,section.route())),ui.wrap());
                sectionStates.put(section.route(),section);
            }
        }else if(selected!=null&&"battery".equals(selected.id)){
            LinearLayout batteryCard=category("battery","省电模式");
            addSectionFeatures(batteryCard,selected.features);
            ui.addDetailSectionTitle(body,"电池健康度检测");
            if(batteryHealthPanel!=null)batteryHealthPanel.close();
            batteryHealthPanel=new BatteryHealthPanel(ui,inputSession.batteryHealth,worker);
            body.addView(batteryHealthPanel.view(),ui.wrap());
        }else if(selected!=null&&"liftarc".equals(selected.id)){
            liftArcEditor=new LiftArcSettingsEditor(this,ui,new LiftArcSettingsEditor.Host(){
                public String value(String key){return EnhancementSettingsActivity.this.value(key);}
                public View input(EnhancementOption option){return EnhancementSettingsActivity.this.input(option);}
                public void change(String key,String value,View control){EnhancementSettingsActivity.this.change(key,value,control);}
                public void changeAll(Map<String,String> values){changeLiftArcSettings(values);}
                public void refresh(String key,String value){refreshInput(key,value);}
            },config,worker);
            body.addView(liftArcEditor.view(),ui.wrap());
        }else if(selected!=null&&ModuleHierarchy.hasInlineEditors(selected)){
            renderInlineSection(selected);
        }else{
            List<NativeFeatureGroups.Feature> features=selected==null?NativeFeatureGroups.forGroup(group):selected.features;
            if(selected!=null&&!selected.entries.isEmpty()){
                LinearLayout links=ui.preferenceCard();body.addView(links,ui.margins(0,0,0,features.isEmpty()?0:12));
                for(String entry:selected.entries){
                    if(links.getChildCount()>0)divider(links);
                    links.addView(ui.preferenceRow(entry,ModuleHierarchy.title(entry),null,()->ModuleNavigation.open(this,entry)),ui.wrap());
                }
            }
            if(!features.isEmpty()){
                LinearLayout card=category(selected==null?group:selected.id,title);
                addSectionFeatures(card,features);
            }
            String id=selected==null?group:selected.id;
            if("island".equals(id)){
                LinearLayout nativeCard=ui.preferenceCard();
                nativeCard.addView(ui.preferenceRow("native-island-settings","打开"+NativeIslandMode.name(NativeIslandMode.detect(this))+"设置",
                        "选择原厂岛后，自动关闭Duo灵动岛",()->{
                            flush();NativeIslandSettings.open(this,worker);
                        }),ui.wrap());
                body.addView(nativeCard,ui.margins(0,12,0,0));
            }
            if(selected!=null&&!selected.deviceSettings.isEmpty())DeviceSettingsActions.add(this,ui,category(id,title),worker,selected.deviceSettings.toArray(new String[0]));
            if("collab_audio".equals(id))CollabAudioImporter.addAction(this,ui,category(id,title),worker);
        }
        addRelated(route);
        refreshSectionCounts();
        body.post(()->{ScrollView scroll=scrollView();if(scroll!=null)scroll.scrollTo(0,previousY);});
    }
    private void addRelated(String route){
        List<ModulePresentationCatalog.Related> links=ModulePresentationCatalog.related(route);
        if(links.isEmpty())return;
        ui.addDetailSectionTitle(body,"相关功能");
        LinearLayout card=ui.preferenceCard();body.addView(card,ui.wrap());
        for(ModulePresentationCatalog.Related link:links){
            if(ModuleHierarchy.isRestricted(link.route)&&!HiddenEntrySession.isUnlocked())continue;
            if(card.getChildCount()>0)divider(card);
            card.addView(ui.preferenceRow(link.route,link.title,link.summary,()->ModuleNavigation.open(this,link.route)),ui.wrap());
        }
    }
    private void renderInlineSection(ModuleHierarchy.Section section){
        LinearLayout card=category(section.id,section.title);
        for(String entry:section.entries){
            if(card.getChildCount()>0)divider(card);
            if("extra_dim".equals(entry)){
                extraDimTile=new ExtraDimTilePreference(this,ui,worker);
                LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
                content.setTag("inline-editor:"+entry);content.addView(extraDimTile.view(),ui.wrap());card.addView(content,ui.wrap());
                continue;
            }
            NativeEditorController editor="launcher_custom".equals(entry)
                    ?new LauncherEditorController(this,entry,true):new FeatureEditorController(this,entry,true);
            editors.put(entry,editor);
            editor.onCreate(editorStates==null?null:editorStates.getBundle(entry));
            View content=editor.view();content.setTag("inline-editor:"+entry);
            card.addView(content,ui.wrap());
        }
        addSectionFeatures(card,section.features);
    }
    private void addSectionFeatures(LinearLayout card,List<NativeFeatureGroups.Feature> features){
        Set<String> shown=new HashSet<>();
        for(NativeFeatureGroups.Feature feature:features){
            String object=NativeFeatureGroups.objectGroup(feature);
            if(!object.isEmpty()&&!shown.add(object))continue;
            if(card.getChildCount()>0)divider(card);
            if(object.isEmpty())card.addView(feature(feature),ui.wrap());
            else{
                LinearLayout settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);settings.setPadding(ui.dp(12),0,0,0);
                for(NativeFeatureGroups.Feature member:features)if(object.equals(NativeFeatureGroups.objectGroup(member))){
                    if(settings.getChildCount()>0)divider(settings);settings.addView(feature(member),ui.wrap());
                }
                card.addView(ui.foldingSection(object,settings,false),ui.wrap());
            }
        }
    }
    private void refreshUpdateLinks(){
        if(updateLinksContent==null||worker.isShutdown())return;
        int request=++updateLinksRequest;
        worker.execute(()->{
            List<OtaCapturedLinks.Entry> entries=OtaCapturedLinks.read(updateLinksPreferences);
            runOnUiThread(()->{if(!isDestroyed()&&!isFinishing()&&request==updateLinksRequest)renderUpdateLinks(entries);});
        });
    }
    private void renderUpdateLinks(List<OtaCapturedLinks.Entry> entries){
        updateLinksContent.removeAllViews();
        if(entries.isEmpty()){
            TextView empty=ui.text("尚未提取到更新链接\n更新应用准备安装时，提取到的更新包会显示在这里。",13,ui.muted,false);
            empty.setTag("update-links-empty");empty.setLineSpacing(ui.dp(3),1);
            updateLinksContent.addView(empty,ui.margins(0,8,0,12));return;
        }
        int index=0;
        for(OtaCapturedLinks.Entry entry:entries){
            OtaPackageLabel label=entry.label();
            if(index>0)divider(updateLinksContent);
            LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.VERTICAL);
            row.setTag("update-link:"+index++);row.setMinimumHeight(ui.dp(48));row.setPadding(0,ui.dp(10),0,ui.dp(10));
            TextView name=ui.text(label.title,14,ui.accent,true);name.setMaxLines(3);name.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(name,ui.wrap());
            TextView source=ui.text(label.details,12,ui.muted,false);source.setMaxLines(3);source.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(source,ui.margins(0,4,0,0));
            String time=entry.time<=0?"":android.text.format.DateFormat.format("MM-dd HH:mm",entry.time)+" 提取 · ";
            row.addView(ui.text(time+"点击复制链接",12,ui.muted,false),ui.margins(0,4,0,0));
            row.setFocusable(true);row.setScreenReaderFocusable(true);
            row.setForeground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT,12)));
            row.setOnClickListener(v->{
                ClipboardManager clipboard=getSystemService(ClipboardManager.class);
                if(clipboard==null){toast("暂时无法复制链接");return;}
                clipboard.setPrimaryClip(ClipData.newPlainText("系统更新链接",entry.url));
                Toast.makeText(this,"系统更新链接已复制",Toast.LENGTH_SHORT).show();
            });
            updateLinksContent.addView(row,ui.wrap());
        }
    }
    private LinearLayout category(String id,String title){
        String tag="application-category:"+targetId+":"+id;
        LinearLayout existing=body.findViewWithTag(tag);if(existing!=null)return existing;
        LinearLayout card=ui.card();card.setTag(tag);card.setPadding(ui.dp(14),ui.dp(2),ui.dp(14),ui.dp(2));body.addView(card,ui.wrap());return card;
    }
    private void refreshSectionCounts(){
        if(body==null||isDestroyed())return;
        for(ModuleHierarchy.Section section:sectionStates.values()){
            TextView label=body.findViewWithTag("setting-count:"+section.route());if(label==null)continue;
            int count=ModuleHierarchy.activeCount(section,config::get);label.setText(label.getContext().getString(R.string.status_enhancementsettingsactivity_11 ,String.valueOf(count)));label.setVisibility(count==0?View.GONE:View.VISIBLE);
        }
    }
    void selectStatusComponent(String id){for(NativeEditorController editor:editors.values())if(editor instanceof StatusBarEditorController)((StatusBarEditorController)editor).selectComponent(id);}
    private void divider(LinearLayout card){card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));}
    private View feature(NativeFeatureGroups.Feature f){
        boolean updateLink="ls_augment_rm_ota_capture_url".equals(f.id);
        LinearLayout card=new LinearLayout(this);card.setOrientation(LinearLayout.VERTICAL);card.setTag("native-feature:"+f.id);
        String key=f.toggleKey==null?f.parameterKeys[0]:f.toggleKey;EnhancementOption option=options.get(key);
        if(f.toggleKey==null&&("systemui:aod_clock_font".equals(f.id)||"systemui:aod_clock_scale".equals(f.id)))
            return aodParameter(f,option);
        if("systemui:qs_carrier".equals(f.id)){
            // This single choice already includes the native/no-override state.
            View choice=input(option);
            choice.setPadding(choice.getPaddingLeft(),0,choice.getPaddingRight(),choice.getPaddingBottom());
            card.addView(choice,ui.wrap());
            considerQuery(card,option.title,option.summary);
            return card;
        }
        Switch toggle=new Switch(this);toggle.setTag("config:"+key);
        boolean active=f.toggleKey!=null?ConfigSchema.truthy(value(key)):ValueOverrideState.active(f.comparison,value(key),f.noOpValue);
        if(f.toggleKey==null&&gateMemory.contains("value:"+key)
                &&!ValueOverrideState.active(f.comparison,value(key),gateMemory.getString("value:"+key,value(key))))
            active=gateMemory.getBoolean("open:"+key,active);
        String unavailable=FanFeatureAvailability.reason(this,key);
        if(SystemUiOptions.ISLAND.equals(key)&&NativeIslandMode.MODERN.equals(NativeIslandMode.detect(this)))
            unavailable="当前魔力岛显示分支尚不支持Duo自定义岛，请使用下方魔力岛场景支持";
        if(SystemUiOptions.VOLUME_SAME_SIDE.equals(key)&&!VolumePositionSettings.multiAppEnabled(this))unavailable="请先在系统设置中开启多应用音量调节功能";
        if(NativeIslandSceneOptions.ENABLED.equals(key)&&!nativeIslandEnabled())unavailable=nativeIslandUnavailable();
        if(SystemUiOptions.ISLAND_STATUS_AVOIDANCE.equals(key)){
            String capability=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString("ls_augment_island_avoidance_capability","");
            if(capability.startsWith("unavailable:"))unavailable="当前系统缺少状态栏避让接口，保留原厂行为";
        }
        if(key.startsWith(NativeIslandSceneOptions.ENABLED+"_"))unavailable=nativeSceneUnavailable(key);
        boolean available=unavailable.isEmpty();
        toggle.setChecked(active&&available);toggle.setEnabled(available);
        String featureTitle=NativeIslandSceneOptions.ENABLED.equals(key)?NativeIslandMode.name(NativeIslandMode.detect(this))+"场景支持":f.title;
        String featureHelp=available||key.startsWith(NativeIslandSceneOptions.ENABLED)?FeatureHelp.forOption(option):unavailable;
        if(key.startsWith(NativeIslandSceneOptions.ENABLED)&&NativeIslandMode.MODERN.equals(NativeIslandMode.detect(this)))
            featureHelp=(key.equals(NativeIslandSceneOptions.ENABLED)?"":MagicIslandPolicy.detail(key.substring((NativeIslandSceneOptions.ENABLED+"_").length())))
                    +"控制已核验的原厂魔力岛场景，保留原厂内容、按钮和业务条件。关闭单项会撤下该场景；重新开启随新的原厂状态更新生效。关闭场景支持恢复原厂选择，不回放过期卡片。魔力岛已完成接口与离线验证，红魔 12 尚未完成真机验收。";
        card.addView(ui.featureRow(featureTitle,featureHelp,toggle),ui.wrap());
        if(!available||key.startsWith(NativeIslandSceneOptions.ENABLED)){
            TextView state=ui.text(unavailable,12,ui.muted,false);state.setTag("device-feature-unavailable:"+key);
            if(available)state.setVisibility(View.GONE);
            card.addView(state,ui.margins(0,4,0,8));
        }
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(ui.dp(12),0,0,0);
        if("systemui:back_icon_enabled".equals(f.id)){
            backGestureIcons=new BackGestureIconEditor(this,ui,worker,this::value,(k,v)->change(k,v,null));
            content.addView(backGestureIcons.view(),ui.wrap());
        }
        else if("ls_augment_rm_recents_memory_custom".equals(f.id))memoryControls(content);
        else if("systemui:island_enabled".equals(f.id))islandControls(content);
        else if(GameOptions.PERFORMANCE_MONITOR.equals(f.id))monitorControls(content);
        else if("systemui:qs_grid".equals(f.id)){
            content.addView(new ControlCenterGridEditor(this,ui,this::value,(k,v)->change(k,v,null)).view(),ui.wrap());
        }
        else if("launcher:launcher_grid".equals(f.id)){
            LauncherGridEditor grid=new LauncherGridEditor(this,ui,this::value,this::changeLauncherGrid);
            content.addView(grid.view(),ui.wrap());
        }
        else if(updateLink){
            content.setTag("update-link-actions");updateLinksContent=content;
            content.addView(ui.text("正在读取已提取的更新链接…",13,ui.muted,false),ui.margins(0,8,0,12));
            updateLinksPreferences=getSharedPreferences(OtaCapturedLinks.PREFS,MODE_PRIVATE);
            updateLinksPreferences.registerOnSharedPreferenceChangeListener(updateLinksListener);
        }
        else for(String parameter:f.parameterKeys){
            EnhancementOption parameterOption=options.get(parameter);
            boolean parentOwnsTitle=f.toggleKey==null&&f.parameterKeys.length==1
                    &&f.children.length==0&&f.title.equals(parameterOption.title);
            content.addView(input(parameterOption,parentOwnsTitle),ui.wrap());
        }
        for(NativeFeatureGroups.Feature child:f.children)content.addView(feature(child),ui.wrap());
        syncConditionalInputs();
        UiKit.Fold fold=null;if(f.hasConfiguration()||updateLink){card.addView(content,ui.wrap());fold=ui.fold(toggle,content);}
        final UiKit.Fold configFold=fold;
        if(NativeIslandSceneOptions.ENABLED.equals(key))nativeScenesFold=fold;
        toggle.setOnCheckedChangeListener((view,on)->{
            if(on&&SystemUiOptions.VOLUME_SAME_SIDE.equals(key)&&!VolumePositionSettings.multiAppEnabled(this)){
                toggle.setChecked(false);android.widget.Toast.makeText(this,"请先开启多应用音量调节功能",android.widget.Toast.LENGTH_SHORT).show();return;
            }
            if(configFold!=null)configFold.sync();
            if(bindingIslandMaster&&(SystemUiOptions.ISLAND.equals(key)||key.startsWith(NativeIslandSceneOptions.ENABLED)))return;
            if(f.toggleKey!=null)change(key,on?"1":"0",toggle);
            else{
                SharedPreferences.Editor memory=gateMemory.edit().putBoolean("open:"+key,on);String next;
                if(!on){memory.putString("remember:"+key,value(key));next=f.noOpValue;}
                else next=ValueOverrideState.restore(option,gateMemory.getString("remember:"+key,value(key)),f.noOpValue);
                memory.putString("value:"+key,next).apply();change(key,next,toggle);refreshInput(key,next);
            }
        });
        for(String owned:f.allKeys()){EnhancementOption o=options.get(owned);if(o!=null)considerQuery(card,o.title,o.summary);}
        return card;
    }
    /** These values are real configuration, not Boolean feature gates. */
    private View aodParameter(NativeFeatureGroups.Feature feature,EnhancementOption option){
        String key=option.key;boolean font="systemui:aod_clock_font".equals(feature.id);
        TextView state=ui.text("",13,ui.muted,false);
        state.setTag("aod-parameter-state:"+key);state.setMaxLines(3);
        state.setEllipsize(TextUtils.TruncateAt.END);aodParameterStates.put(key,state);
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(ui.dp(12),0,0,0);
        if(font){
            Button select=ui.tonalButton(value(key).isEmpty()?"选择字体文件":"更换字体");
            select.setTag("aod-parameter-select:"+key);aodParameterActionSize(select);
            controls.put(key,select);content.addView(select,ui.wrap());
            select.setOnClickListener(v->selectAodFont());
        }else content.addView(input(option,true),ui.wrap());
        Button restore=ui.tonalButton(font?"恢复原厂字体":"恢复原厂大小");
        restore.setTag("aod-parameter-restore:"+key);aodParameterActionSize(restore);
        aodParameterRestores.put(key,restore);content.addView(restore,ui.margins(0,8,0,8));
        restore.setOnClickListener(v->{
            if(font)cancelAodFontImport();
            change(key,feature.noOpValue,controls.get(key));refreshInput(key,feature.noOpValue);
        });
        LinearLayout section=ui.parameterSection(feature.title,FeatureHelp.forOption(option),state,content,true);
        section.setTag("native-feature:"+feature.id);refreshAodParameterState(key);
        considerQuery(section,option.title,option.summary);return section;
    }
    private void aodParameterActionSize(Button button){
        button.setMinHeight(ui.dp(48));button.setMinimumHeight(ui.dp(48));
    }
    private void refreshAodParameterState(String key){
        TextView state=aodParameterStates.get(key);if(state==null)return;
        String selected=value(key);boolean font=key.endsWith("_clock_font");
        boolean original=font?selected.isEmpty():!ValueOverrideState.active("number",selected,"1.0");
        if(font){
            String name=original?"原厂字体":getSharedPreferences("statusbar_asset_names",MODE_PRIVATE).getString(selected,"");
            if(name==null||name.trim().isEmpty())name=selected.startsWith("/")?new java.io.File(selected).getName():"已选择自定义字体";
            state.setText(state.getContext().getString(R.string.status_enhancementsettingsactivity_12 ,String.valueOf(name), String.valueOf((aodFontImportPending?"\n正在导入字体…":""))));
        }else state.setText(original?"原厂大小（1.0 倍）":selected+" 倍");
        Button restore=aodParameterRestores.get(key);
        boolean importing=font&&(aodFontPickerPending||aodFontImportPending);
        if(restore!=null){
            if(font)restore.setText(importing?"取消导入并恢复原厂字体":"恢复原厂字体");
            restore.setEnabled(!original||pending.isInvalid(key)||importing);
        }
    }
    private void selectAodFont(){
        fontKey=AOD_FONT_KEY;aodFontPickerGeneration=++aodFontGeneration;
        aodFontPickerPending=true;aodFontImportPending=false;refreshAodParameterState(AOD_FONT_KEY);
        try{startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),84);}
        catch(RuntimeException error){
            aodFontPickerPending=false;refreshAodParameterState(AOD_FONT_KEY);
            toast("无法选择字体文件："+error.getMessage());
        }
    }
    private void cancelAodFontImport(){
        ++aodFontGeneration;aodFontPickerPending=false;aodFontImportPending=false;
    }
    private boolean currentAodFontRequest(long generation){return generation==aodFontGeneration;}
    private void importAodFont(android.net.Uri uri,long generation){
        try{worker.execute(()->{
            try(InputStream in=getContentResolver().openInputStream(uri)){
                if(in==null)throw new IllegalArgumentException("无法打开文件");
                String reference=ManagedFont.importFile(this,in);
                runOnUiThread(()->{
                    if(isDestroyed()||!currentAodFontRequest(generation))return;
                    aodFontImportPending=false;
                    change(AOD_FONT_KEY,reference,controls.get(AOD_FONT_KEY));refreshInput(AOD_FONT_KEY,reference);
                });
            }catch(Exception error){runOnUiThread(()->aodFontImportFailed(generation,error));}
        });}catch(RejectedExecutionException error){aodFontImportFailed(generation,error);}
    }
    private void aodFontImportFailed(long generation,Exception error){
        if(isDestroyed()||!currentAodFontRequest(generation))return;
        aodFontImportPending=false;refreshAodParameterState(AOD_FONT_KEY);
        toast("字体未导入："+error.getMessage());
    }
    private void islandControls(LinearLayout content){
        content.setPadding(0,0,0,0);
        content.addView(ui.text("有活动时出现 · 轻点打开 · 长按展开",12,ui.muted,false),ui.margins(0,8,0,8));
        for(String suffix:new String[]{"music","notifications","charging"}){
            String key=SystemUiOptions.PREFIX+"island_"+suffix;
            EnhancementOption option=options.get(key);
            Switch control=new Switch(this);control.setTag("config:"+key);control.setChecked(ConfigSchema.truthy(value(key)));
            controls.put(key,control);
            content.addView(ui.featureRow(option.title,FeatureHelp.forOption(option),control),ui.wrap());
            control.setOnCheckedChangeListener((button,on)->change(key,on?"1":"0",control));
            if("notifications".equals(suffix)){
                LinearLayout timing=new LinearLayout(this);timing.setOrientation(LinearLayout.VERTICAL);timing.setPadding(ui.dp(12),0,0,0);
                timing.addView(input(options.get(SystemUiOptions.PREFIX+"island_notice_seconds")),ui.wrap());content.addView(timing,ui.wrap());
                UiKit.Fold timingFold=ui.fold(control,timing);
                control.setOnCheckedChangeListener((button,on)->{timingFold.sync();change(key,on?"1":"0",control);});
            }
            divider(content);
        }
        EnhancementOption transparent=options.get(SystemUiOptions.ISLAND_TRANSPARENT);
        content.addView(input(transparent),ui.wrap());
        divider(content);
        EnhancementOption appStyle=options.get(SystemUiOptions.ISLAND_APP_STYLE);
        LinearLayout styleContent=new LinearLayout(this);styleContent.setOrientation(LinearLayout.VERTICAL);
        styleContent.setPadding(ui.dp(12),0,0,ui.dp(8));
        styleContent.addView(input(appStyle,true),ui.wrap());
        LinearLayout styleSection=ui.parameterSection(appStyle.title,FeatureHelp.forOption(appStyle),null,styleContent,false);
        styleSection.setTag("island-app-style-section");styleContent.setTag("island-app-style-options");
        content.addView(styleSection,ui.wrap());divider(content);
        LinearLayout geometry=new LinearLayout(this);geometry.setOrientation(LinearLayout.VERTICAL);geometry.setPadding(ui.dp(12),0,0,0);
        for(String suffix:new String[]{"width","height","offset_x","offset_y"})geometry.addView(input(options.get(SystemUiOptions.PREFIX+"island_"+suffix)),ui.wrap());
        content.addView(ui.foldingSection("大小与位置",geometry,false),ui.wrap());
        refreshIslandRanges();
    }
    private void refreshIslandRanges(){
        for(String suffix:new String[]{"width","height","offset_x","offset_y"}){
            String key=SystemUiOptions.PREFIX+"island_"+suffix;View control=controls.get(key);
            if(control instanceof ParameterSlider)PhoneParameterRanges.island(this,(ParameterSlider)control,key,this::value);
        }
    }
    private void monitorControls(LinearLayout content){
        content.addView(ui.featureTitle("监测项目","勾选游戏空间性能监控弹窗需要显示的项目，至少保留一项。时间为当前时间，游戏时长由原厂插件统计。"),ui.margins(0,3,0,0));
        LinearLayout checks=new LinearLayout(this);checks.setOrientation(LinearLayout.VERTICAL);
        checks.setTag("config:"+GameOptions.MONITOR_ITEMS);controls.put(GameOptions.MONITOR_ITEMS,checks);content.addView(checks,ui.wrap());
        String[] items=GamePerformanceMonitorConfig.items(),labels=GamePerformanceMonitorConfig.labels();
        for(int i=0;i<items.length;i++){
            String item=items[i];CheckBox box=new CheckBox(this);box.setTag(item);box.setText(labels[i]);
            ui.styleCheckBox(box);box.setTextSize(UiKit.compactTextSize(14f));
            box.setChecked(GamePerformanceMonitorConfig.selected(value(GameOptions.MONITOR_ITEMS),item));checks.addView(box,ui.wrap());
            box.setOnCheckedChangeListener((button,on)->{
                Set<String> selected=tokens(value(GameOptions.MONITOR_ITEMS));
                if(on)selected.add(item);else selected.remove(item);
                if(selected.isEmpty()){box.setChecked(true);toast("至少保留一项监测项目");return;}
                change(GameOptions.MONITOR_ITEMS,String.join(",",selected),box);
            });
        }
        content.addView(input(options.get(GameOptions.MONITOR_TRANSPARENCY)),ui.margins(0,8,0,0));
        content.addView(input(options.get(GameOptions.MONITOR_MARGIN)),ui.wrap());
        View margin=controls.get(GameOptions.MONITOR_MARGIN);
        SharedPreferences calibration=getSharedPreferences(AppConfig.DIAGNOSTICS,MODE_PRIVATE);
        SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{
            if(GamePerformanceMonitorConfig.GEOMETRY.equals(key))main.post(this::refreshMonitorRange);
        };
        margin.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){calibration.registerOnSharedPreferenceChangeListener(listener);refreshMonitorRange();}
            public void onViewDetachedFromWindow(View view){calibration.unregisterOnSharedPreferenceChangeListener(listener);}
        });
        refreshMonitorRange();
    }
    private void refreshMonitorRange(){
        View control=controls.get(GameOptions.MONITOR_MARGIN);if(!(control instanceof ParameterSlider)||isDestroyed())return;
        ParameterSlider slider=(ParameterSlider)control;
        GamePerformanceMonitorConfig.Geometry geometry=GamePerformanceMonitorConfig.Geometry.parse(
                getSharedPreferences(AppConfig.DIAGNOSTICS,MODE_PRIVATE).getString(GamePerformanceMonitorConfig.GEOMETRY,""));
        android.util.DisplayMetrics metrics=getResources().getDisplayMetrics();
        if(geometry==null||Math.abs(geometry.density-metrics.density)>.01f||Math.abs(geometry.scaledDensity-metrics.scaledDensity)>.01f){
            slider.range(0,0,"");slider.unavailable("请先打开一次游戏空间性能监测，读取当前字号的实际可调范围");return;
        }
        int[] range=geometry.range(value(GameOptions.MONITOR_ITEMS));
        slider.range(range[0],range[1],range[0]==range[1]?"当前项目组合没有可调间隔":"按最近一次监测布局："+range[0]+"～"+range[1]+" dp");
        slider.bar.setEnabled("1".equals(value(GameOptions.PERFORMANCE_MONITOR))&&range[0]!=range[1]);
    }
    private void memoryControls(LinearLayout content){
        String prefix="ls_augment_rm_recents_memory_";
        for(String key:new String[]{"style","content","color_mode"})content.addView(input(options.get(prefix+key)),ui.wrap());
        memoryColorsRow=memoryPair(content,prefix+"light_color",prefix+"dark_color");
        syncMemoryColorsVisibility();
        for(String[] pair:new String[][]{{"simple_size","detailed_size"},
                {"portrait_top","portrait_left"},{"landscape_top","landscape_left"},
                {"portrait_height","landscape_height"}})
            memoryPair(content,prefix+pair[0],prefix+pair[1]);
    }
    private LinearLayout memoryPair(LinearLayout parent,String left,String right){
        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.HORIZONTAL);row.setBaselineAligned(false);
        LinearLayout.LayoutParams first=new LinearLayout.LayoutParams(0,-2,1);first.setMarginEnd(ui.dp(6));
        LinearLayout.LayoutParams second=new LinearLayout.LayoutParams(0,-2,1);second.setMarginStart(ui.dp(6));
        row.addView(input(options.get(left)),first);row.addView(input(options.get(right)),second);parent.addView(row,ui.wrap());
        return row;
    }
    private void syncMemoryColorsVisibility(){
        if(memoryColorsRow!=null)memoryColorsRow.setVisibility("2".equals(value("ls_augment_rm_recents_memory_color_mode"))?View.VISIBLE:View.GONE);
    }
    private String value(String key){return draft.getOrDefault(key,config.get(key));}
    private View input(EnhancementOption option){return input(option,false);}
    private View input(EnhancementOption option,boolean parentOwnsTitle){
        if(option.kind==EnhancementOption.Kind.BOOLEAN){
            Switch control=new Switch(this);control.setTag("config:"+option.key);control.setChecked(ConfigSchema.truthy(value(option.key)));
            controls.put(option.key,control);LinearLayout row=ui.featureRow(option.title,FeatureHelp.forOption(option),control);
            control.setOnCheckedChangeListener((button,on)->change(option.key,on?"1":"0",control));return row;
        }
        LinearLayout row=ui.parameterInputGroup(!parentOwnsTitle);
        LinearLayout parameterTitle=null;
        if(!parentOwnsTitle||RecentsCardRadiusOptions.OFFSET.equals(option.key)){
            LinearLayout title=ui.featureTitle(option.title,FeatureHelp.forOption(option));
            parameterTitle=title;
            if(RecentsCardRadiusOptions.OFFSET.equals(option.key)){
                for(int i=0;i<title.getChildCount();i++)if(title.getChildAt(i) instanceof TextView){
                    recentsRadiusValue=(TextView)title.getChildAt(i);recentsRadiusValue.setTag("value:"+option.key);break;
                }
            }
            row.addView(title,ui.wrap());
        }
        if(CollabOptions.THEME_VARIANT.equals(option.key))return themeChoice(row,option);
        if(RecentsCardRadiusOptions.OFFSET.equals(option.key)){
            SeekBar slider=ui.slider();
            // No guessed endpoints: the launcher supplies an authenticated resting-card range.
            slider.setMin(0);slider.setMax(0);slider.setEnabled(false);recentsRadiusSlider=slider;
            slider.setKeyProgressIncrement(1);
            slider.setContentDescription(option.title);slider.setTag("config:"+option.key);
            slider.setProgressTintList(android.content.res.ColorStateList.valueOf(ui.accent));
            slider.setThumbTintList(android.content.res.ColorStateList.valueOf(ui.accent));
            recentsRadiusStatus=ui.text("",12,ui.muted,false);recentsRadiusStatus.setVisibility(View.GONE);
            recentsRadiusStatus.setTag("recents-radius-status");
            row.addView(recentsRadiusStatus,ui.wrap());row.addView(slider,ui.wrap());
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
                public void onStartTrackingTouch(SeekBar bar){recentsRadiusTracking=true;}
                public void onStopTrackingTouch(SeekBar bar){
                    if(recentsRadiusRange!=null&&bar.isEnabled())change(option.key,String.valueOf(bar.getProgress()),bar);
                    recentsRadiusTracking=false;
                    if(recentsRadiusUpdatePending){
                        RecentsCardRadiusUiRange next=recentsRadiusPendingRange;
                        recentsRadiusUpdatePending=false;recentsRadiusPendingRange=null;applyRecentsRadiusRange(next);
                    }
                    renderRecentsRadiusValue();flush();
                }
                public void onProgressChanged(SeekBar bar,int progress,boolean user){
                    if(user&&recentsRadiusRange!=null&&bar.isEnabled())change(option.key,String.valueOf(progress),bar);
                    renderRecentsRadiusValue();
                }
            });
            renderRecentsRadiusValue();controls.put(option.key,slider);
            NumericParameterEditor.linear(ui,slider,option.title,0,1," dp",parameterTitle,recentsRadiusValue);
        }else if(option.kind==EnhancementOption.Kind.INTEGER||option.kind==EnhancementOption.Kind.DECIMAL){
            ParameterSlider slider=new ParameterSlider(ui,option,value(option.key),next->change(option.key,next,controls.get(option.key)));
            slider.bindTitle(parameterTitle);
            row.addView(slider,ui.wrap());controls.put(option.key,slider);
            if((SystemUiOptions.PREFIX+"onehand_offset").equals(option.key))PhoneParameterRanges.oneHand(this,slider);
        }else if(option.kind==EnhancementOption.Kind.CHOICE){
            Spinner choice=ui.choiceSpinner("选择选项","ls_augment_rm_recents_memory_content".equals(option.key)?this::memoryExampleText:null);choice.setContentDescription(option.title);if("ls_augment_rm_recents_memory_content".equals(option.key)){
                memoryContentAdapter=new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,option.choices){
                    @Override public View getView(int position,View recycled,ViewGroup parent){return memoryContentExample(option,position,false);}
                    @Override public View getDropDownView(int position,View recycled,ViewGroup parent){return memoryContentExample(option,position,true);}
                };
                choice.setAdapter(memoryContentAdapter);
            }else choice.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,option.choices));choice.setSelection(Integer.parseInt(value(option.key)));row.addView(choice,ui.wrap());controls.put(option.key,choice);
            choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int position,long id){change(option.key,String.valueOf(position),choice);}});
        }else if(RecentsPrivacyOptions.APPS.equals(option.key)){
            Button button=ui.textButton(RecentsPrivacyOptions.selectionLabel(value(option.key)));
            button.setTag("config:"+option.key);row.addView(button,ui.wrap());controls.put(option.key,button);
            button.setOnClickListener(v->AppSelectionDialog.show(this,ui,option.title,value(option.key),next->{
                if(isFinishing()||isDestroyed()||!button.isEnabled()||!ConfigSchema.truthy(value(RecentsPrivacyOptions.ENABLED)))return;
                change(option.key,next,button);refreshInput(option.key,next);
            }));
        }else if(NotificationSummaryOptions.ASSET.equals(option.key)){
            Button button=ui.tonalButton(value(option.key).isEmpty()?"选择图片":"更换图片");row.addView(button,ui.wrap());controls.put(option.key,button);
            button.setOnClickListener(v->AppDialogs.builder(this).setTitle(option.title).setItems(new String[]{"选择图片","移除图片"},(d,i)->{
                if(i==1){change(option.key,"",button);refreshInput(option.key,"");return;}
                startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*"),85);
            }).show());
        }else if(option.key.endsWith("_clock_font")){
            Button button=ui.tonalButton(value(option.key).isEmpty()?"选择字体文件":"更换字体");row.addView(button,ui.wrap());controls.put(option.key,button);
            button.setOnClickListener(v->AppDialogs.builder(this).setTitle(option.title).setItems(new String[]{"选择字体文件","恢复原厂字体"},(d,i)->{if(i==1){change(option.key,"",button);refreshInput(option.key,"");return;}fontKey=option.key;startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*"),84);}).show());
        }else if(option.key.endsWith("hidden_icon_slots")){
            String[] labels={"闹钟","蓝牙","勿扰模式","耳机","VPN","定位","飞行模式","投屏","旋转锁定","热点","NFC"};String[] slots={"alarm_clock","bluetooth","zen","headset","vpn","location","airplane","cast","rotate","hotspot","nfc"};
            LinearLayout checks=new LinearLayout(this);checks.setOrientation(LinearLayout.VERTICAL);controls.put(option.key,checks);row.addView(checks,ui.wrap());
            for(int i=0;i<slots.length;i++){String slot=slots[i];CheckBox box=new CheckBox(this);box.setTag(slot);box.setText(labels[i]);ui.styleCheckBox(box);box.setChecked(tokens(value(option.key)).contains(slot));checks.addView(box,ui.wrap());box.setOnCheckedChangeListener((v,on)->{Set<String> selected=tokens(value(option.key));if(on)selected.add(slot);else selected.remove(slot);change(option.key,String.join(",",selected),box);});}
        }else{
            EditText field=new EditText(this);ui.styleInput(field);field.setContentDescription(option.title);field.setText(value(option.key));
            if(GameOptions.MONITOR_TRANSPARENCY.equals(option.key))field.setTag("config:"+option.key);
            if(option.kind==EnhancementOption.Kind.INTEGER)field.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_SIGNED);
            else if(option.kind==EnhancementOption.Kind.DECIMAL)field.setInputType(InputType.TYPE_CLASS_NUMBER|InputType.TYPE_NUMBER_FLAG_DECIMAL|InputType.TYPE_NUMBER_FLAG_SIGNED);
            row.addView(option.kind==EnhancementOption.Kind.COLOR?ui.colorInput(field,option.title):field,ui.wrap());controls.put(option.key,field);
            TextView error=ui.inlineInputError(field,option.key);inputErrors.put(option.key,error);row.addView(error,ui.margins(0,4,0,0));
            field.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){
                String normalized=option.normalize(s.toString());
                if(normalized==null){invalidInput(option);return;}
                if(option.kind==EnhancementOption.Kind.COLOR&&option.key.startsWith(LiftArcOptions.PREFIX)&&normalized.length()==7){
                    try{Integer argb=ColorEditorDialog.parse(normalized,android.graphics.Color.parseColor(value(option.key)));if(argb!=null)normalized=String.format(Locale.ROOT,"#%08X",argb);}catch(IllegalArgumentException ignored){}
                }
                error.setText("");error.setVisibility(View.GONE);change(option.key,normalized,field);
            }public void afterTextChanged(Editable e){}});
            // Invalid raw text is UI state only; it must never become a restorable save intent.
            String invalid=invalidInputs==null?null:invalidInputs.getString(option.key);
            if(invalid!=null&&option.normalize(invalid)==null){invalidInputs.remove(option.key);field.setText(invalid);}
        }
        return row;
    }
    private View themeChoice(LinearLayout row,EnhancementOption option){
        int[] variants=CollabPolicy.themeVariants(android.os.Build.DEVICE,android.os.Build.MODEL);
        if(variants.length==0){row.addView(ui.text("当前机型暂无匹配的联名主题",14,ui.muted,false),ui.wrap());return row;}
        String[] labels=new String[variants.length];int selected=CollabPolicy.resolveThemeVariant(Integer.parseInt(value(option.key)),android.os.Build.DEVICE,android.os.Build.MODEL),position=0;
        for(int i=0;i<variants.length;i++){labels[i]=option.choices[variants[i]];if(variants[i]==selected)position=i;}
        Spinner choice=ui.choiceSpinner("选择本机联名主题",null);choice.setContentDescription(option.title);
        choice.setTag(variants);choice.setAdapter(new ArrayAdapter<>(this,android.R.layout.simple_spinner_dropdown_item,labels));choice.setSelection(position);
        row.addView(choice,ui.wrap());controls.put(option.key,choice);
        if(!String.valueOf(selected).equals(value(option.key)))change(option.key,String.valueOf(selected),choice);
        choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int index,long id){if(index>=0&&index<variants.length)change(option.key,String.valueOf(variants[index]),choice);}});
        return row;
    }
    private String memoryExampleText(int position){
        int style="1".equals(value("ls_augment_rm_recents_memory_style"))?1:0;
        long gib=1024L*1024L*1024L;
        return "示例："+LauncherMemoryPresentation.format(8*gib,3*gib,style,position);
    }
    private View memoryContentExample(EnhancementOption option,int position,boolean dropdown){
        LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(ui.dp(12),ui.dp(8),ui.dp(12),ui.dp(8));
        if(dropdown)row.setBackgroundColor(ui.card);
        String example=memoryExampleText(position);
        row.addView(ui.text(option.choices[position],14,ui.text,true),ui.wrap());
        row.addView(ui.text(example,12,ui.muted,false),ui.wrap());
        row.setContentDescription(option.choices[position]+"，"+example);
        return row;
    }
    private static Set<String> tokens(String value){Set<String> result=new LinkedHashSet<>();for(String token:value.split(","))if(!token.trim().isEmpty())result.add(token.trim());return result;}
    private static String signedRadius(int value){return (value>0?"+":"")+value+" dp";}
    private void renderRecentsRadiusValue(){
        if(recentsRadiusSlider==null||recentsRadiusValue==null)return;
        int saved=Integer.parseInt(value(RecentsCardRadiusOptions.OFFSET));
        String text=signedRadius(saved)+(saved==0?"（原厂）":""),status="";
        if(recentsRadiusRange!=null){
            int actual=recentsRadiusRange.clamp(saved);
            if(actual!=saved)status="实际为"+(saved<actual?"直角 ":"最圆 ")+signedRadius(actual)+"；调节后保存";
        }else if(!recentsRadiusLoading)status="请先进入一次最近任务，读取卡片圆角范围";
        recentsRadiusValue.setText(recentsRadiusValue.getContext().getString(R.string.status_enhancementsettingsactivity_13 ,String.valueOf(signedRadius(saved))));
        recentsRadiusStatus.setText(status);recentsRadiusStatus.setVisibility(status.isEmpty()?View.GONE:View.VISIBLE);
        recentsRadiusSlider.setStateDescription(text+(status.isEmpty()?"":"，"+status));
    }
    private void startRecentsRadiusRange(){
        if(recentsRadiusSlider==null)return;
        stopRecentsRadiusRange();recentsRadiusActive=true;recentsRadiusLoading=recentsRadiusRange==null;
        recentsRadiusPreferences=getSharedPreferences(RecentsCardRadiusStore.PREFS,MODE_PRIVATE);
        recentsRadiusPreferences.registerOnSharedPreferenceChangeListener(recentsRadiusListener);
        renderRecentsRadiusValue();
        loadRecentsRadiusRange();
    }
    private void stopRecentsRadiusRange(){
        recentsRadiusActive=false;recentsRadiusRequest++;recentsRadiusTracking=false;
        recentsRadiusUpdatePending=false;recentsRadiusPendingRange=null;
        if(recentsRadiusPreferences!=null){
            recentsRadiusPreferences.unregisterOnSharedPreferenceChangeListener(recentsRadiusListener);
            recentsRadiusPreferences=null;
        }
    }
    private void applyRecentsRadiusRange(RecentsCardRadiusUiRange range){
        recentsRadiusLoading=false;
        if(recentsRadiusTracking){recentsRadiusPendingRange=range;recentsRadiusUpdatePending=true;return;}
        recentsRadiusRange=range;
        if(range!=null){
            recentsRadiusSlider.setMin(range.minOffsetDp);recentsRadiusSlider.setMax(range.maxOffsetDp);
            recentsRadiusSlider.setKeyProgressIncrement(1);
            recentsRadiusSlider.setProgress(range.clamp(Integer.parseInt(value(RecentsCardRadiusOptions.OFFSET))));
        }
        recentsRadiusSlider.setEnabled(range!=null);renderRecentsRadiusValue();
    }
    private void loadRecentsRadiusRange(){
        if(!recentsRadiusActive||recentsRadiusSlider==null||worker.isShutdown())return;
        int request=++recentsRadiusRequest;
        android.util.DisplayMetrics real=new android.util.DisplayMetrics();
        Display display=getDisplay();if(display==null){applyRecentsRadiusRange(null);return;}display.getRealMetrics(real);
        int width=real.widthPixels,height=real.heightPixels,density=getResources().getDisplayMetrics().densityDpi;
        worker.execute(()->{
            // App-private calibration only. No live launcher query, diagnostic TTL or polling.
            RecentsCardRadiusUiRange received=RecentsCardRadiusStore.load(getApplicationContext(),density,width,height);
            main.post(()->{
                if(!recentsRadiusActive||request!=recentsRadiusRequest||isDestroyed()||isFinishing())return;
                applyRecentsRadiusRange(received);
            });
        });
    }
    private void refreshInput(String key,String next){
        View view=controls.get(key);if(view instanceof EditText){EditText field=(EditText)view;if(!next.contentEquals(field.getText()))field.setText(next);}
        else if(view instanceof ParameterSlider){((ParameterSlider)view).setValue(next);}
        else if(view instanceof SeekBar){int number=Integer.parseInt(next);((SeekBar)view).setProgress(RecentsCardRadiusOptions.OFFSET.equals(key)&&recentsRadiusRange!=null?recentsRadiusRange.clamp(number):number);if(RecentsCardRadiusOptions.OFFSET.equals(key))renderRecentsRadiusValue();}
        else if(view instanceof Spinner){
            Spinner spinner=(Spinner)view;int selected=Integer.parseInt(next);
            if(spinner.getTag() instanceof int[]){int[] variants=(int[])spinner.getTag();int position=0;for(int i=0;i<variants.length;i++)if(variants[i]==selected)position=i;spinner.setSelection(position);}
            else spinner.setSelection(selected);
        }
        else if(view instanceof Button){
            if(RecentsPrivacyOptions.APPS.equals(key))((Button)view).setText(RecentsPrivacyOptions.selectionLabel(next));
            else if(SystemUiOptions.ISLAND_APP_STYLE.equals(key)){
                ((Button)view).setText(options.get(key).choices[Integer.parseInt(next)]);
                view.setContentDescription(options.get(key).title+"，当前："+((Button)view).getText());
            }
            else ((Button)view).setText(NotificationSummaryOptions.ASSET.equals(key)?(next.isEmpty()?"选择图片":"更换图片"):(next.isEmpty()?"选择字体文件":"更换字体"));
        }
        else if(view instanceof LinearLayout){LinearLayout checks=(LinearLayout)view;Set<String> selected=tokens(next);for(int i=0;i<checks.getChildCount();i++){CheckBox box=(CheckBox)checks.getChildAt(i);box.setChecked(selected.contains(box.getTag()));}}
        refreshAodParameterState(key);
        if(GameOptions.MONITOR_ITEMS.equals(key)||GameOptions.PERFORMANCE_MONITOR.equals(key))refreshMonitorRange();
    }
    private String invalidMessage(EnhancementOption option){
        if(option.kind==EnhancementOption.Kind.INTEGER)return "请输入 "+(long)option.minimum+"～"+(long)option.maximum+" 之间的整数";
        if(option.kind==EnhancementOption.Kind.DECIMAL)return "请输入 "+option.minimum+"～"+option.maximum+" 之间的有效数值";
        if(option.kind==EnhancementOption.Kind.COLOR)return "请输入 #RRGGBB 或 #AARRGGBB 颜色";
        return "请输入有效内容";
    }
    private void invalidFeedback(EnhancementOption option,String saved){
        TextView error=inputErrors.get(option.key);if(error==null)return;
        error.setText(error.getContext().getString(R.string.status_enhancementsettingsactivity_14 ,String.valueOf(invalidMessage(option)), String.valueOf(saved)));error.setVisibility(View.VISIBLE);
    }
    private void confirmInvalidInput(EnhancementOption option,long generation){
        if(isDestroyed()||!pending.isInvalid(option.key,generation))return;
        try{String saved=config.get(option.key);draft.put(option.key,saved);invalidFeedback(option,"已保存："+(saved.isEmpty()?"空内容":saved));refreshAodParameterState(option.key);}
        catch(RuntimeException failure){invalidFeedback(option,"暂时无法确认已保存值，请重新打开此页");}
    }
    private void invalidInput(EnhancementOption option){
        long generation=pending.invalidate(option.key);refreshAodParameterState(option.key);
        if(pending.isEmpty())main.removeCallbacks(autoSave);
        // Do not promise cancellation after claim. The same FIFO confirms the durable outcome.
        try{draft.put(option.key,config.get(option.key));}
        catch(RuntimeException failure){invalidFeedback(option,"暂时无法确认已保存值，请重新打开此页");return;}
        if(pending.isInFlight(option.key))invalidFeedback(option,"正在确认已保存值…");
        else confirmInvalidInput(option,generation);
        try{worker.execute(()->main.post(()->confirmInvalidInput(option,generation)));}
        catch(RejectedExecutionException failure){invalidFeedback(option,"暂时无法确认已保存值，请重新打开此页");}
    }
    private void change(String key,String value,View control){
        String normalized=ConfigSchema.normalize(key,value);if(normalized==null)return;
        if(SystemUiOptions.SIGNAL_DUAL.equals(key)&&ConfigSchema.truthy(normalized)
                &&(ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))
                ||config.getBoolean(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))){
            if(control instanceof Switch)((Switch)control).setChecked(false);
            toast("请先关闭三合一图标");return;
        }
        if(normalized.equals(draft.get(key))&&!pending.needsSubmission(key))return;
        draft.put(key,normalized);pending.put(key,normalized);main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);
        if(GameOptions.MONITOR_ITEMS.equals(key)||GameOptions.PERFORMANCE_MONITOR.equals(key))refreshMonitorRange();
        if(LauncherGridSpec.ENABLED.equals(key))traceLauncherGridIntent("toggle");
        refreshAodParameterState(key);
        if("ls_augment_rm_recents_memory_style".equals(key)&&memoryContentAdapter!=null)memoryContentAdapter.notifyDataSetChanged();
        if((SystemUiOptions.PREFIX+"island_width").equals(key)||(SystemUiOptions.PREFIX+"island_height").equals(key))refreshIslandRanges();
        if("ls_augment_rm_recents_memory_color_mode".equals(key))syncMemoryColorsVisibility();
        syncConditionalInputs();
        if(liftArcEditor!=null)liftArcEditor.changed(key);
    }
    private void changeLiftArcSettings(Map<String,String> values){
        LinkedHashMap<String,String> normalized=new LinkedHashMap<>();
        for(Map.Entry<String,String> entry:values.entrySet()){
            if(!entry.getKey().startsWith(LiftArcOptions.PREFIX)){toast("默认参数未填入，请重新打开此页。");return;}
            String next=ConfigSchema.normalize(entry.getKey(),entry.getValue());if(next==null){toast("默认参数未填入，请重新打开此页。");return;}normalized.put(entry.getKey(),next);
        }
        draft.putAll(normalized);pending.putAll(normalized);main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);
        for(Map.Entry<String,String> entry:normalized.entrySet())refreshInput(entry.getKey(),entry.getValue());
        if(liftArcEditor!=null)liftArcEditor.changed(LiftArcOptions.ENABLED);
    }
    private void syncConditionalInputs(){
        inputVisible(NotificationAppearanceOptions.STACK_START,ConfigSchema.truthy(value(NotificationAppearanceOptions.STACK_SHADE)));
        inputVisible(NotificationAppearanceOptions.STACK_LOCK_START,ConfigSchema.truthy(value(NotificationAppearanceOptions.STACK_LOCK)));
        String mode=value(NotificationSummaryOptions.MODE);
        inputVisible(NotificationSummaryOptions.SYMBOL,"0".equals(mode));
        inputVisible(NotificationSummaryOptions.TEXT,"1".equals(mode));
        inputVisible(NotificationSummaryOptions.ASSET,"2".equals(mode));
        for(String panel:CarrierTextOptions.PANELS){
            String carrierMode=value(CarrierTextOptions.key(panel,"mode"));
            inputVisible(CarrierTextOptions.key(panel,"text"),"1".equals(carrierMode));
            inputVisible(CarrierTextOptions.key(panel,"pattern"),"2".equals(carrierMode));
        }
        boolean gradient="1".equals(value(ControlCenterAppearanceOptions.TILE_GRADIENT));
        for(String key:new String[]{ControlCenterAppearanceOptions.TILE_END_LIGHT,ControlCenterAppearanceOptions.TILE_END_DARK,ControlCenterAppearanceOptions.TILE_DIRECTION})inputVisible(key,gradient);
        boolean glow="1".equals(value(ControlCenterAppearanceOptions.MEDIA_GLOW));
        inputVisible(ControlCenterAppearanceOptions.GLOW_OPACITY,glow);inputVisible(ControlCenterAppearanceOptions.GLOW_WIDTH,glow);
    }
    private void inputVisible(String key,boolean visible){
        View control=controls.get(key);if(control!=null&&control.getParent() instanceof View)((View)control.getParent()).setVisibility(visible?View.VISIBLE:View.GONE);
    }
    /** Validate the full preset first; all three keys then share the existing atomic save batch. */
    private void changeLauncherGrid(Map<String,String> values){
        LinkedHashMap<String,String> normalized=new LinkedHashMap<>();
        for(String key:new String[]{LauncherGridSpec.ENABLED,LauncherGridSpec.ROWS,LauncherGridSpec.COLUMNS}){
            String next=ConfigSchema.normalize(key,values.get(key));
            if(next==null){toast("桌面布局未保存，请选择 3～12 行和列。");return;}
            normalized.put(key,next);
        }
        if(normalized.entrySet().stream().allMatch(entry->entry.getValue().equals(draft.get(entry.getKey()))&&!pending.needsSubmission(entry.getKey())))return;
        draft.putAll(normalized);pending.putAll(normalized);main.removeCallbacks(autoSave);main.postDelayed(autoSave,280);
        traceLauncherGridIntent("dimensions");
    }
    private void traceLauncherGridIntent(String source){
        LinkedHashMap<String,String> requested=new LinkedHashMap<>();
        for(String key:new String[]{LauncherGridSpec.ENABLED,LauncherGridSpec.ROWS,LauncherGridSpec.COLUMNS})
            requested.put(key,value(key));
        Context app=getApplicationContext();
        // Preserve FIFO with saves while keeping file I/O away from touch handling.
        worker.execute(()->AppConfig.traceLauncherGrid(app,"UI_REQUEST",requested,0,"source="+source));
    }
    @Override public void prepareScopeRestart(Runnable restart){
        if(isFinishing()||isDestroyed()||worker.isShutdown())return;
        if(liftArcEditor!=null)for(Map.Entry<String,View> entry:controls.entrySet())if(entry.getKey().startsWith(LiftArcOptions.PREFIX)&&pending.isInvalid(entry.getKey())){
            entry.getValue().requestFocus();toast("锁屏上滑参数有无效输入，请修正或恢复默认值后再重启。");return;
        }
        flush();
        worker.execute(()->main.post(()->{
            if(isFinishing()||isDestroyed())return;
            if(!pending.isEmpty()){toast("配置尚未保存，暂未重启。请确认设置后重试。");return;}
            prepareEditorRestart(editors.values().iterator(),restart);
        }));
    }
    private void prepareEditorRestart(Iterator<NativeEditorController> remaining,Runnable restart){
        if(isFinishing()||isDestroyed())return;
        if(remaining.hasNext())remaining.next().prepareScopeRestart(()->prepareEditorRestart(remaining,restart));
        else restart.run();
    }
    private void flush(){
        main.removeCallbacks(autoSave);if(pending.isEmpty()||worker.isShutdown())return;
        FieldEditQueue.Batch batch=pending.takePending();
        worker.execute(()->{
            FieldEditQueue.Batch claimed=pending.claim(batch);if(claimed.isEmpty())return;
            boolean saved=false;String failure=null;
            try{
                Map<String,String> values=claimed.values();AppConfig.SaveResult result=config.save(values);saved=result.success;
                if(saved){
                    SharedPreferences.Editor memory=gateMemory.edit();
                    for(Map.Entry<String,String> entry:values.entrySet())memory.putString("value:"+entry.getKey(),entry.getValue());
                    if(!memory.commit())failure="配置已保存，但输入记忆未保存，请重新打开此页确认";
                }else failure="未保存："+result.message;
            }catch(RuntimeException error){
                if(AppConfig.touchesLauncherGrid(claimed.values()))AppConfig.traceLauncherGrid(getApplicationContext(),
                        "SAVE_EXCEPTION",claimed.values(),0,"error="+error.getClass().getSimpleName()+";durableResult="+(saved?"COMMITTED":"UNCONFIRMED"));
                failure=saved?"配置已保存，但输入记忆未完成，请重新打开此页确认":"保存状态暂时无法确认，请重新打开此页确认";
            }
            finally{pending.complete(claimed,saved);}
            if(failure!=null){inputSession.failed(failure);main.post(this::showSaveFailure);}
        });
    }
    private void showSaveFailure(){
        if(isDestroyed())return;String message=inputSession.takeFailure();if(message!=null)toast(message);
    }
    private void refreshIslandMaster(){
        refreshNativeSceneGate();
        if(isDestroyed()||body==null||islandPreferences==null||pending.restorableValues().containsKey(SystemUiOptions.ISLAND))return;
        String saved=config.get(SystemUiOptions.ISLAND);
        draft.put(SystemUiOptions.ISLAND,saved);
        View toggle=body.findViewWithTag("config:"+SystemUiOptions.ISLAND);
        bindingIslandMaster=true;
        try{if(toggle instanceof Switch){
            boolean modern=NativeIslandMode.MODERN.equals(NativeIslandMode.detect(this));
            toggle.setEnabled(!modern);((Switch)toggle).setChecked(!modern&&ConfigSchema.truthy(saved));
            View state=body.findViewWithTag("device-feature-unavailable:"+SystemUiOptions.ISLAND);
            if(state instanceof TextView){((TextView)state).setText(modern?"当前魔力岛显示分支尚不支持Duo自绘灵动岛，请使用原厂魔力岛及场景支持":"");state.setVisibility(modern?View.VISIBLE:View.GONE);}
        }}
        finally{bindingIslandMaster=false;}
    }
    private boolean nativeIslandEnabled(){
        return config.getBoolean(ConfigSchema.NATIVE_ISLAND_SELECTED)
                &&!config.getBoolean(SystemUiOptions.ISLAND)&&NativeIslandMode.enabled(this,NativeIslandMode.detect(this))
                &&magicHostUnavailable().isEmpty();
    }
    private String magicHostUnavailable(){
        if(!NativeIslandMode.MODERN.equals(NativeIslandMode.detect(this)))return "";
        String capability=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(MagicIslandPolicy.CAPABILITY,"");
        if(("ready:"+BuildConfig.VERSION_CODE).equals(capability))return "";
        return capability.startsWith("unavailable:")?"魔力岛显示接口不完整，保留原厂行为":"等待魔力岛显示接口检测，请确认系统界面作用域";
    }
    private String nativeIslandUnavailable(){
        String mode=NativeIslandMode.detect(this),name=NativeIslandMode.name(mode);
        if(!NativeIslandMode.known(mode))return "等待原厂岛能力检测，请确认系统界面作用域";
        if(!NativeIslandMode.enabled(this,mode))return "请先在"+name+"设置中开启"+name;
        if(NativeIslandMode.LEGACY.equals(mode))return config.getBoolean(SystemUiOptions.ISLAND)
                ?"当前使用Duo灵动岛；请在星云岛设置中重新开启星云岛"
                :"请在星云岛设置中重新开启星云岛，以切换到原厂岛";
        if(config.getBoolean(ConfigSchema.NATIVE_ISLAND_SELECTED)&&!magicHostUnavailable().isEmpty())return magicHostUnavailable();
        return "原厂"+name+"已开启，等待Duo联动；请确认系统界面作用域并重启";
    }
    private void refreshNativeSceneGate(){
        if(body==null||isDestroyed())return;
        View view=body.findViewWithTag("config:"+NativeIslandSceneOptions.ENABLED);
        if(!(view instanceof Switch))return;
        boolean available=nativeIslandEnabled();
        boolean expanded=nativeScenesFold!=null&&nativeScenesFold.content.getVisibility()==View.VISIBLE;
        bindingIslandMaster=true;
        try{view.setEnabled(available);((Switch)view).setChecked(available&&ConfigSchema.truthy(value(NativeIslandSceneOptions.ENABLED)));
            if(nativeScenesFold!=null){nativeScenesFold.sync();nativeScenesFold.show(expanded);}
            for(String id:NativeIslandSceneOptions.IDS){
                String key=NativeIslandSceneOptions.key(id),reason=nativeSceneUnavailable(key);
                View child=body.findViewWithTag("config:"+key);
                if(child instanceof Switch){child.setEnabled(reason.isEmpty());((Switch)child).setChecked(reason.isEmpty()&&ConfigSchema.truthy(value(key)));}
                View status=body.findViewWithTag("device-feature-unavailable:"+key);
                if(status instanceof TextView){((TextView)status).setText(reason);status.setVisibility(reason.isEmpty()?View.GONE:View.VISIBLE);}
            }
        }
        finally{bindingIslandMaster=false;}
        View state=body.findViewWithTag("device-feature-unavailable:"+NativeIslandSceneOptions.ENABLED);
        if(state instanceof TextView){((TextView)state).setText(available?"":nativeIslandUnavailable());state.setVisibility(available?View.GONE:View.VISIBLE);}
    }
    private String nativeSceneUnavailable(String key){
        if(NativeIslandMode.MODERN.equals(NativeIslandMode.detect(this))){
            String id=key.substring((NativeIslandSceneOptions.ENABLED+"_").length());
            String source=MagicIslandPolicy.source(id);
            if(source==null)return MagicIslandPolicy.unavailable(id);
            try{if(!getPackageManager().getApplicationInfo(source,0).enabled)return "请启用对应原厂服务";}
            catch(android.content.pm.PackageManager.NameNotFoundException missing){return "未安装对应原厂服务";}
            SharedPreferences diagnostics=getSharedPreferences(AppConfig.DIAGNOSTICS,0);
            String host=diagnostics.getString(MagicIslandPolicy.CAPABILITY,"");
            if(!("ready:"+BuildConfig.VERSION_CODE).equals(host))return host.startsWith("unavailable:")?"魔力岛显示接口不完整，保留原厂行为":"等待魔力岛显示接口检测";
            if(MagicIslandPolicy.personal(id)){
                String producer=diagnostics.getString(key+"_magic_source_capability","");
                if(!("ready:"+BuildConfig.VERSION_CODE).equals(producer))return producer.startsWith("unavailable:")&&!producer.endsWith("personal_service_stopped")?"此场景缺少已核验的原厂适配器":"请启用魔姬建议服务及其作用域，等待场景检测";
            }
            if(MagicIslandPolicy.appSource(id)){
                String producer=diagnostics.getString(key+"_magic_source_capability","");
                String ready;
                try{ready="ready:"+BuildConfig.VERSION_CODE+":"+getPackageManager().getPackageInfo(source,0).lastUpdateTime;}
                catch(android.content.pm.PackageManager.NameNotFoundException missing){return "未安装对应原厂服务";}
                if(!ready.equals(producer))return producer.startsWith("unavailable:")&&!producer.endsWith("disconnected")
                        ?"原厂来源、卡片或操作接口不完整，保留原厂行为":"请启用来源应用作用域并启动对应功能，等待原厂卡片服务连接";
                if("ai_memory".equals(id))try{
                    android.content.pm.ActivityInfo detail=getPackageManager().getActivityInfo(new android.content.ComponentName("com.zte.aimemory","com.zte.aimemory.activities.MemoryDetailFavoriteActivity"),0);
                    if(!detail.enabled||!detail.applicationInfo.enabled)return "请启用 AI 记忆及其原厂详情入口";
                }catch(android.content.pm.PackageManager.NameNotFoundException missing){return "缺少 AI 记忆原厂详情入口";}
            }
            return "";
        }
        if(key.equals(NativeIslandSceneOptions.key("ai_writing"))||key.equals(NativeIslandSceneOptions.key("taxi"))
                ||key.equals(NativeIslandSceneOptions.key("takeout"))||key.equals(NativeIslandSceneOptions.key("train_12306"))
                ||key.equals(NativeIslandSceneOptions.key("train_travel")))return "当前旧版星云岛尚未接入此场景";
        if(NativeIslandSceneOptions.key("calendar_meeting").equals(key)||NativeIslandSceneOptions.key("scenic_guide").equals(key)||NativeIslandSceneOptions.key("nearby_charging").equals(key)||NativeIslandSceneOptions.key("cycling").equals(key)||NativeIslandSceneOptions.key("flight").equals(key)||NativeIslandSceneOptions.key("preflight_battery").equals(key)||NativeIslandSceneOptions.key("weather_travel").equals(key)){
            try{getPackageManager().getApplicationInfo("com.zte.personalagent",0);}
            catch(android.content.pm.PackageManager.NameNotFoundException missing){return "未安装小星建议（魔姬建议）";}
            String source=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key+"_source_capability","");
            if(source.equals("unavailable:missing_weather_navigation_target"))return "请启用原厂助手或安装可用地图，重启后等待检测";
            if(source.equals("unavailable:missing_flight_launch_target"))return "请安装飞常准或启用原厂应用商店，重启后等待检测";
            if(source.equals("unavailable:return_bike_tool_not_registered"))return "请先启用原厂一步助手，等待还车能力就绪";
            if(source.startsWith("unavailable:")&&!source.equals("unavailable:personal_service_stopped"))return "此场景缺少所需的原厂能力，具体原因已记录到日志";
            if(!("ready:"+BuildConfig.VERSION_CODE).equals(source))return "请先启用原厂建议服务及其作用域，重启后等待能力检测";
        }
        if(NativeIslandSceneOptions.key("transfer").equals(key)||NativeIslandSceneOptions.key("nfc_transfer").equals(key)){
            boolean nfc=NativeIslandSceneOptions.key("nfc_transfer").equals(key);
            String app=nfc?"多屏协同":"系统互传";
            try{getPackageManager().getApplicationInfo(nfc?"com.zte.multscr":"com.zte.cn.zteshare",0);}
            catch(android.content.pm.PackageManager.NameNotFoundException missing){return "未安装"+app;}
            String source=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key+"_source_capability","");
            if(!("ready:"+BuildConfig.VERSION_CODE).equals(source))return nfc?"请启用多屏协同作用域并重启手机，等待能力检测":"请启用系统互传作用域并打开互传，等待能力检测";
        }
        String capability=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString(key+"_capability","");
        if("ready".equals(capability))return "";
        if(capability.contains("recorder_waiting_user_unlock"))return "解锁手机后会自动检测录音支持";
        return capability.startsWith("unavailable:")?"此场景暂不可用，具体原因已记录到日志":"等待星云岛报告场景能力";
    }
    private void considerQuery(View view,String title,String summary){if(queryAnchor==null&&!query.isEmpty()&&(title+summary).toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT)))queryAnchor=view;}
    private boolean isApplicationDirectory(){return targetId!=null&&ModuleHierarchy.group(ModuleNavigation.route(this))==null;}
    private ScrollView scrollView(){ViewParent parent=body==null?null:body.getParent();while(parent!=null){if(parent instanceof ScrollView)return (ScrollView)parent;parent=parent.getParent();}return null;}
    @Override public void launchEditorResult(NativeEditorController editor,Intent intent,int request){pendingEditor=editor.route;startActivityForResult(intent,request);}
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(backGestureIcons!=null&&backGestureIcons.onResult(request,result,data))return;
        if(pendingEditor!=null){NativeEditorController editor=editors.get(pendingEditor);pendingEditor=null;if(editor!=null)editor.onActivityResult(request,result,data);return;}
        if(request==85){
            if(result!=RESULT_OK||data==null||data.getData()==null||worker.isShutdown())return;
            worker.execute(()->{try(InputStream in=getContentResolver().openInputStream(data.getData())){
                if(in==null)throw new IllegalArgumentException("无法打开图片");
                String name="通知汇总图片";
                try(android.database.Cursor cursor=getContentResolver().query(data.getData(),new String[]{android.provider.OpenableColumns.DISPLAY_NAME},null,null,null)){
                    if(cursor!=null&&cursor.moveToFirst()&&cursor.getString(0)!=null)name=cursor.getString(0);
                }
                String hash=StatusBarAssetStore.importFile(this,in,name);
                runOnUiThread(()->{if(isDestroyed()||isFinishing())return;change(NotificationSummaryOptions.ASSET,hash,controls.get(NotificationSummaryOptions.ASSET));refreshInput(NotificationSummaryOptions.ASSET,hash);});
            }catch(Exception error){runOnUiThread(()->{if(!isDestroyed())toast("图片未导入："+error.getMessage());});}});
            return;
        }
        if(request==84&&AOD_FONT_KEY.equals(fontKey)){
            long generation=aodFontPickerGeneration;
            if(!aodFontPickerPending||!currentAodFontRequest(generation))return;
            aodFontPickerPending=false;
            if(result!=RESULT_OK||data==null||data.getData()==null){refreshAodParameterState(AOD_FONT_KEY);return;}
            aodFontImportPending=true;refreshAodParameterState(AOD_FONT_KEY);
            importAodFont(data.getData(),generation);return;
        }
        if(request!=84||result!=RESULT_OK||data==null||data.getData()==null||fontKey==null)return;
        String key=fontKey;worker.execute(()->{try(InputStream in=getContentResolver().openInputStream(data.getData())){if(in==null)throw new IllegalArgumentException("无法打开文件");String reference=ManagedFont.importFile(this,in);runOnUiThread(()->{if(isDestroyed())return;change(key,reference,controls.get(key));refreshInput(key,reference);});}catch(Exception error){runOnUiThread(()->{if(!isDestroyed())toast("字体未导入："+error.getMessage());});}});
    }
    @Override protected void onResume(){super.onResume();if(ModuleHierarchy.isRestricted(ModuleNavigation.route(this))&&!HiddenEntrySession.isUnlocked()){finish();return;}if(resumedDirectory&&(isApplicationDirectory()||"group/audio/volume_position".equals(ModuleNavigation.route(this)))){ScrollView scroll=scrollView();render(scroll==null?0:scroll.getScrollY());}resumedDirectory=true;refreshIslandMaster();if(extraDimTile!=null)extraDimTile.refresh();refreshUpdateLinks();startRecentsRadiusRange();if(liftArcEditor!=null)liftArcEditor.onResume();for(NativeEditorController editor:editors.values())editor.onResume();}
    @Override protected void onPause(){stopRecentsRadiusRange();if(liftArcEditor!=null)liftArcEditor.onPause();for(NativeEditorController editor:editors.values())editor.onPause();flush();super.onPause();}
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);ui.saveState(state);state.putString("fontKey",fontKey);state.putString("pendingEditor",pendingEditor);
        state.putBundle("batteryHealth",inputSession.batteryHealth.save());
        // A pending picker can return to the recreated page; an old Activity import is not resumed.
        state.putLong("aodFontGeneration",aodFontGeneration);state.putLong("aodFontPickerGeneration",aodFontPickerGeneration);
        state.putBoolean("aodFontPickerPending",aodFontPickerPending);ScrollView scroll=scrollView();state.putInt("scrollY",scroll==null?0:scroll.getScrollY());if(!isApplicationDirectory()){
            Bundle values=new Bundle();
            for(Map.Entry<String,String> e:pending.restorableValues().entrySet())values.putString(e.getKey(),e.getValue());
            state.putBundle("draft",values);
        }Bundle saved=new Bundle();for(Map.Entry<String,NativeEditorController> entry:editors.entrySet()){Bundle b=new Bundle();entry.getValue().onSaveInstanceState(b);saved.putBundle(entry.getKey(),b);}state.putBundle("editors",saved);}
    @Override protected void onDestroy(){if(batteryHealthPanel!=null)batteryHealthPanel.close();if(sceneDiagnostics!=null)sceneDiagnostics.unregisterOnSharedPreferenceChangeListener(sceneDiagnosticListener);if(islandPreferences!=null)islandPreferences.unregisterOnSharedPreferenceChangeListener(islandListener);stopRecentsRadiusRange();if(liftArcEditor!=null)liftArcEditor.onDestroy();if(islandAppStyleDialog!=null)islandAppStyleDialog.dismiss();if(sectionPreferences!=null)sectionPreferences.unregisterOnSharedPreferenceChangeListener(sectionListener);if(updateLinksPreferences!=null)updateLinksPreferences.unregisterOnSharedPreferenceChangeListener(updateLinksListener);main.removeCallbacks(reloadUpdateLinks);main.removeCallbacks(autoSave);flush();for(NativeEditorController editor:editors.values())editor.onDestroy();if(!isChangingConfigurations())worker.shutdown();super.onDestroy();}
    @Override public Object onRetainNonConfigurationInstance(){
        Bundle invalid=new Bundle();
        for(Map.Entry<String,View> e:controls.entrySet())if(pending.isInvalid(e.getKey())&&e.getValue() instanceof EditText)invalid.putString(e.getKey(),((EditText)e.getValue()).getText().toString());
        inputSession.invalidInputs=invalid;return inputSession;
    }
    private void toast(String message){Toast.makeText(this,message,Toast.LENGTH_LONG).show();}
}
