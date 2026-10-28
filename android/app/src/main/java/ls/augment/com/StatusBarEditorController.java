package ls.augment.com;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Grouped status-bar pages with one validated draft and live preview per editor. */
final class StatusBarEditorController extends NativeEditorController {
    StatusBarEditorController(Activity owner,String route,boolean embedded){super(owner,route,embedded);}
    // All editor instances share submission order, including pages already closed.
    private static final ExecutorService worker = StatusBarEditSession.WORKER;
    private final ConfigEditDraft draft = new ConfigEditDraft();
    private final LinkedHashMap<String, String> rawInputs = new LinkedHashMap<>();
    private AppConfig config;
    private UiKit ui;
    private LinearLayout content;
    private ScrollView configScroll;
    private Preview preview;
    private android.content.SharedPreferences previewPreferences;
    private final android.content.SharedPreferences.OnSharedPreferenceChangeListener previewPreferenceListener=(prefs,key)->{
        if(workspace()&&StatusBarWorkspaceSpec.ownsKey(key))runOnUiThread(()->{
            if(isDestroyed()||this.previewBackup!=null||this.workspaceResetting)return;
            if(draft.refresh(key,savedValue(key))&&(ConfigSchema.STATUSBAR_GRID.equals(key)||StatusBarEditPolicy.KEY.equals(key))){
                grid=editorGrid();
            }
            if(this.workspaceAssets!=null){this.workspaceAssets.workspaceRefreshSaved();updateWorkspacePreviewLabel();}
            if(preview!=null)preview.invalidate();
        });
        if(SystemUiOptions.SIGNAL_DUAL.equals(key)||SystemUiOptions.SIGNAL_DUAL_STYLE.equals(key)||ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP.equals(key))
            runOnUiThread(this::refreshStoredSignalModes);
        if(preview!=null&&(SystemUiOptions.SIGNAL_DUAL.equals(key)||SystemUiOptions.SIGNAL_DUAL_STYLE.equals(key)
                ||(SystemUiOptions.PREFIX+"hide_mobile_type").equals(key)
                ||(SystemUiOptions.PREFIX+"hide_mobile_activity").equals(key)
                ||(SystemUiOptions.PREFIX+"metrics_custom").equals(key)
                ||(SystemUiOptions.PREFIX+"metrics_hide_units").equals(key)
                ||(key!=null&&key.startsWith(SystemUiOptions.PREFIX+"metric_prefix_"))))preview.invalidate();
    };
    private View previewHost;
    private final ConnectivityIconPainter connectivityPainter=new ConnectivityIconPainter();
    private int exampleBattery=73,exampleCards=2;
    private boolean exampleCharging=true,exampleBypass,exampleWifi=true;
    private IosBatteryDrawable previewBatteryArtwork;
    private String previewBatteryAsset="",previewBatteryRequested="";
    private Button apply;
    private StatusBarGridSpec grid;
    private int tab;
    private boolean loading, saving, dirty;
    private final android.os.Handler main=new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable autoSave=()->save();
    private Button reset;
    private final Map<String,Switch> controls=new LinkedHashMap<>();
    private UiKit.Fold sectionFold;
    private UiKit.Fold connectivityFold;
    private boolean connectivityExpanded;
    private UiKit.Fold nativeBatteryFold;
    private boolean nativeBatteryExpanded;
    private UiKit.Fold dualAppearanceFold;
    private boolean dualAppearanceExpanded;
    private final Map<String,UiKit.Fold> componentFolds=new LinkedHashMap<>();
    private final Map<String,Boolean> expandedComponents=new LinkedHashMap<>();
    private final Map<String,View> componentViews=new LinkedHashMap<>();
    private final Map<Integer,Integer> scrollPositions=new LinkedHashMap<>();
    private String selectedComponent="";
    private TextView layoutFeedback;
    private TextView runtimeFeedback;
    private final Map<String,Boolean> advancedExpanded=new LinkedHashMap<>();
    private final Map<String,View> advancedViews=new LinkedHashMap<>();
    private Map<String,String> previewBackup,lastLayoutBackup;
    private String presetName="";
    private LinearLayout presetActions;
    private Button undoLayout;
    private java.util.List<NativeFeatureGroups.Feature> relatedFeatures=java.util.Collections.emptyList();
    private java.util.function.Function<NativeFeatureGroups.Feature,View> featureFactory;
    private final Map<String,View> relatedViews=new LinkedHashMap<>();
    void setRelatedFeatures(java.util.List<NativeFeatureGroups.Feature> features,
            java.util.function.Function<NativeFeatureGroups.Feature,View> factory){relatedFeatures=features;featureFactory=factory;}
    private void related(String destination,LinearLayout parent){
        for(NativeFeatureGroups.Feature feature:workspace()?StatusBarWorkspaceItems.features(relatedFeatures):relatedFeatures){
            if(isIconLayoutFeature(feature))continue;
            if(!destination.equals(workspace()?StatusBarWorkspaceItems.destination(feature):StatusBarPages.destination(feature)))continue;
            if(SystemUiOptions.SIGNAL_DUAL.equals(feature.toggleKey)){
                dualAppearanceSection(parent,feature.title);continue;
            }
            // Preset-owned switches share the same preview, cancel and save transaction.
            if(StatusBarPresets.ownsRelatedKey(feature.toggleKey)){
                toggle(parent,feature.toggleKey,feature.title);continue;
            }
            // Both palettes have one owner and one draft inside the three-in-one
            // settings. Do not create a second pair of controls in related items.
            if("systemui:battery_colors".equals(feature.id)||"systemui:battery_text_colors".equals(feature.id))continue;
            if("systemui:battery_style".equals(feature.id)){batteryAppearanceChoices(parent);continue;}
            View view=relatedViews.get(feature.id);
            if(view==null){view=featureFactory.apply(feature);relatedViews.put(feature.id,view);}
            if(view.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)view.getParent()).removeView(view);
            addFeatureBlock(parent,view);
        }
    }
    private static boolean isIconLayoutFeature(NativeFeatureGroups.Feature feature){for(String key:feature.allKeys())if(StatusBarIconLayoutOptions.ownsKey(key))return true;return false;}
    private UiKit.Fold masterFold;
    private Switch masterControl;
    private LinearLayout masterRow;
    private ParameterSlider clockSizeInput;
    private boolean workspace(){return owner instanceof StatusBarWorkspaceActivity;}
    private int workspaceGroup;
    private String workspaceDetail="",workspaceScope="all",workspaceQuery="";
    private LinearLayout workspaceTabs,workspaceAssetHost;
    private StatusBarAssetsController workspaceAssets;
    private TextView workspacePreviewStatus;
    private boolean workspaceResetting;
    private LinearLayout workspaceBody;
    private StatusBarWorkspaceArtwork workspaceArtwork;
    private org.json.JSONObject workspaceInventory=new org.json.JSONObject();
    private final java.util.LinkedHashMap<String,String> workspaceObserved=new java.util.LinkedHashMap<>();
    private final java.util.Set<String> workspaceVisible=new java.util.LinkedHashSet<>();
    private int workspaceFilter;
    private boolean workspaceRefreshing;
    private ImageButton workspaceRefreshButton;
    private boolean inventoryObserving;
    private final android.database.ContentObserver inventoryObserver=new android.database.ContentObserver(main){
        @Override public void onChange(boolean selfChange){refreshWorkspaceInventory(false);}
    };

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        config = new AppConfig(this); ui = editorUi();
        previewPreferences=getSharedPreferences(AppConfig.PREFS,MODE_PRIVATE);
        previewPreferences.registerOnSharedPreferenceChangeListener(previewPreferenceListener);
        for (String key : ConfigSchema.keys()) if (workspace()&&StatusBarWorkspaceSpec.ownsKey(key)||!key.equals(StatusBarThemeSpec.KEY)
                && !key.equals(StatusBarSheetSpec.KEY) && !key.equals(StatusBarSheetSpec.MODE_KEY)
                && !key.equals(StatusBarFontSpec.KEY) && (key.startsWith("ls_augment_statusbar_")
                || key.equals(ConfigSchema.SYSTEMUI_MASTER)
                || StatusBarPresets.ownsRelatedKey(key)
                || key.equals(SystemUiOptions.SIGNAL_DUAL_STYLE)
                || key.startsWith(SystemUiOptions.PREFIX+"battery_"))) draft.seed(key, savedValue(key));
        if (state != null) {
            Bundle saved = state.getBundle("draft-edits");
            if (saved != null) for (String key : draft.keySet()) {
                if(!saved.containsKey(key))continue;
                String value=saved.getString(key), normalized=ConfigSchema.normalize(key,value);
                if (normalized!=null) {draft.force(key,normalized);dirty=true;}
            }
            Bundle raw=state.getBundle("raw-inputs");if(raw!=null)for(String key:raw.keySet())if(draft.containsKey(key))rawInputs.put(key,raw.getString(key));
            tab = state.getInt("tab");
            selectedComponent=state.getString("selected-component","");
            connectivityExpanded=state.getBoolean("connectivity-expanded",false);
            nativeBatteryExpanded=state.getBoolean("native-battery-expanded",false);
            dualAppearanceExpanded=state.getBoolean("dual-appearance-expanded",false);
            Bundle expanded=state.getBundle("expanded-components");if(expanded!=null)for(String key:expanded.keySet())expandedComponents.put(key,expanded.getBoolean(key));
            Bundle advanced=state.getBundle("advanced-expanded");if(advanced!=null)for(String key:advanced.keySet())advancedExpanded.put(key,advanced.getBoolean(key));
            Bundle positions=state.getBundle("tab-scroll");if(positions!=null)for(String key:positions.keySet())scrollPositions.put(Integer.parseInt(key),positions.getInt(key));
            Bundle undo=state.getBundle("layout-undo");if(undo!=null){lastLayoutBackup=new LinkedHashMap<>();for(String key:undo.keySet())if(draft.containsKey(key))lastLayoutBackup.put(key,undo.getString(key));}
        }
        if(ConfigSchema.truthy(draft.get(SystemUiOptions.SIGNAL_DUAL))&&signalEnableBlocked())
            draft.put(SystemUiOptions.SIGNAL_DUAL,"0");
        grid = editorGrid();
        if(workspace()){createWorkspace(state);return;}
        tab=StatusBarPages.tab(route);
        LinearLayout page=embedded?new LinearLayout(this):ui.detailChrome(StatusBarPages.title(route),ScopeRestartDialog.SYSTEM_UI);
        page.setOrientation(LinearLayout.VERTICAL);
        ui.setContentView(page);ui.applyGestureInset(page,0);
        masterControl=new Switch(this);masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));
        masterControl.setTag("config:"+ConfigSchema.SYSTEMUI_MASTER);
        masterRow=ui.featureRow("自定义状态栏","控制组件排列、自定义文字与实时指标。关闭后保留参数；系统图标的独立开关、素材和字体继续按各自设置生效。",masterControl);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(embedded?0:ui.dp(16),0,embedded?0:ui.dp(16),0);
        int editorHeight=Math.max(ui.dp(200),Math.min(ui.dp(560),getResources().getDisplayMetrics().heightPixels-ui.dp(220)));
        page.addView(body,embedded?new LinearLayout.LayoutParams(-1,editorHeight):new LinearLayout.LayoutParams(-1,0,1));
        if(embedded)masterFold=ui.fold(masterControl,body,true);
        masterControl.setOnCheckedChangeListener((button,on)->{draft.put(ConfigSchema.SYSTEMUI_MASTER,on?"1":"0");changed();});

        preview = new Preview();preview.setLayoutParams(new LinearLayout.LayoutParams(-1,ui.dp(62)));
        FrameLayout previewFrame=new FrameLayout(this);previewFrame.addView(preview,new FrameLayout.LayoutParams(-1,-1));body.addView(previewFrame,new LinearLayout.LayoutParams(-1,ui.dp(62)));previewHost=previewFrame;
        boolean directoryPage=("status_layout".equals(route)||"status_legacy".equals(route))||"status_surfaces".equals(route)||StatusBarPages.surface(route)!=null;
        if(directoryPage)previewFrame.setVisibility(View.GONE);
        layoutFeedback=ui.text("已开启自动避让",11,ui.accent,false);layoutFeedback.setMaxLines(2);layoutFeedback.setEllipsize(android.text.TextUtils.TruncateAt.END);layoutFeedback.setOnClickListener(v->ui.glassDialog("预览说明",layoutFeedback.getText().toString(),"知道了",null,null));body.addView(layoutFeedback,ui.margins(0,3,0,3));
        if(directoryPage)layoutFeedback.setVisibility(View.GONE);
        LinearLayout layoutActions=new LinearLayout(this);
        Button arrange=ui.tonalButton("自动整理"),presets=ui.tonalButton("选择预设");undoLayout=ui.tonalButton("恢复方案前");
        for(Button button:new Button[]{arrange,presets,undoLayout}){button.setTextSize(11);addSpacedButton(layoutActions,button);}
        arrange.setOnClickListener(v->arrangeLayout());presets.setOnClickListener(v->choosePreset());undoLayout.setOnClickListener(v->restoreLayout());body.addView(layoutActions,ui.margins(0,0,0,8));layoutActions.setVisibility("status_arrangement".equals(route)?View.VISIBLE:View.GONE);
        presetActions=new LinearLayout(this);Button accept=ui.accentButton("使用此预设"),cancel=ui.tonalButton("取消预览");
        addSpacedButton(presetActions,accept);addSpacedButton(presetActions,cancel);
        accept.setOnClickListener(v->confirmPreset());cancel.setOnClickListener(v->cancelPreset());presetActions.setVisibility(View.GONE);body.addView(presetActions,ui.margins(0,0,0,8));
        configScroll=new ScrollView(this){
            @Override public boolean dispatchTouchEvent(android.view.MotionEvent event){
                // The inner settings own this gesture; scrolling them must not move their preview.
                if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);
                boolean handled=super.dispatchTouchEvent(event);
                if(event.getActionMasked()==android.view.MotionEvent.ACTION_UP||event.getActionMasked()==android.view.MotionEvent.ACTION_CANCEL)
                    if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);
                return handled;
            }
        };configScroll.setFillViewport(false);configScroll.setVerticalScrollBarEnabled(false);
        content = ("status_layout".equals(route)||"status_legacy".equals(route))?new LinearLayout(this):ui.preferenceCard();content.setOrientation(LinearLayout.VERTICAL);
        configScroll.addView(content,new ScrollView.LayoutParams(-1,-2));body.addView(configScroll,new LinearLayout.LayoutParams(-1,0,1));
        LinearLayout actions = new LinearLayout(this);
        reset = ui.tonalButton("恢复整个状态栏编辑器默认配置");
        reset.setOnClickListener(v -> {
            ui.glassDialog("恢复状态栏默认配置","将重置布局、时钟、硬件信息与原有组件样式。导入的图标素材与统一字体由“素材与字体”页面单独管理；原厂独立功能开关不变。可用上方撤销按钮恢复。","恢复默认",()->{
                lastLayoutBackup=snapshot();rawInputs.clear();loading=true;
                for(String key:draft.keySet())draft.force(key,ConfigSchema.defaultValue(key));
                masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));loading=false;
                grid=StatusBarGridSpec.defaults();changed();render();
            },"取消");
        });
        apply = ui.accentButton("应用");
        apply.setOnClickListener(v -> save());

        render();
        refreshWorkspaceInventory();String requestedComponent=getIntent().getStringExtra("status_component");if(requestedComponent!=null)revealComponent(requestedComponent);
        configScroll.post(()->configScroll.scrollTo(0,scrollPositions.getOrDefault(tab,0)));
        if(dirty)main.post(autoSave);
    }

    private void createWorkspace(Bundle state){
        for(String key:ConfigSchema.keys())if(StatusBarWorkspaceSpec.ownsKey(key)&&!draft.containsKey(key))draft.seed(key,savedValue(key));
        if(state!=null){workspaceGroup=state.getInt("workspace-group");workspaceDetail=state.getString("workspace-detail","");workspaceScope=state.getString("workspace-scope","all");workspaceQuery=state.getString("workspace-query","");workspaceFilter=state.getInt("workspace-filter",0);}
        ui.setBackAction(this::workspaceBack);LinearLayout page=ui.detailChrome("状态栏自定义",ScopeRestartDialog.SYSTEM_UI);ui.setContentView(page);ui.applyGestureInset(page,0);
        LinearLayout body=new LinearLayout(this);workspaceBody=body;body.setOrientation(LinearLayout.VERTICAL);body.setPadding(ui.dp(16),0,ui.dp(16),0);page.addView(body,new LinearLayout.LayoutParams(-1,0,1));
        LinearLayout previewCard=ui.preferenceCard(),heading=new LinearLayout(this);heading.setGravity(Gravity.CENTER_VERTICAL);
        workspacePreviewStatus=ui.text("状态栏预览 · 示例",14,ui.text,true);heading.addView(workspacePreviewStatus,new LinearLayout.LayoutParams(0,-2,1));
        Button scene=ui.textButton("显示位置");scene.setOnClickListener(v->{String[] labels=new String[StatusBarSurfaceSpec.SCOPES.length];for(int i=0;i<labels.length;i++)labels[i]=StatusBarSurfaceSpec.label(StatusBarSurfaceSpec.SCOPES[i]);ui.choiceDialog("预览、素材、隐藏与间距的作用位置",labels,null,index->{workspaceScope=StatusBarSurfaceSpec.SCOPES[index];workspaceAssets.workspaceScope(workspaceScope);renderWorkspace();refreshWorkspaceInventory();});});heading.addView(scene);
        Button collapse=ui.textButton("收起");heading.addView(collapse);previewCard.addView(heading,ui.wrap());
        preview=new Preview();preview.setTag("statusbar-shared-preview");previewHost=preview;previewCard.addView(preview,new LinearLayout.LayoutParams(-1,ui.dp(62)));
        collapse.setOnClickListener(v->{boolean open=preview.getVisibility()!=View.VISIBLE;preview.setVisibility(open?View.VISIBLE:View.GONE);collapse.setText(open?"收起":"展开");});
        layoutFeedback=ui.text("预览使用示例数据，实际显示遵循本机能力与空间。",11,ui.muted,false);previewCard.addView(layoutFeedback,ui.margins(0,4,0,8));
        presetActions=new LinearLayout(this);Button accept=ui.accentButton("应用方案"),cancel=ui.tonalButton("取消预览");addSpacedButton(presetActions,cancel);addSpacedButton(presetActions,accept);cancel.setOnClickListener(v->cancelPreset());accept.setOnClickListener(v->confirmWorkspacePreset());previewCard.addView(presetActions,ui.wrap());body.addView(previewCard,ui.wrap());
        HorizontalScrollView tabScroll=new HorizontalScrollView(this);tabScroll.setHorizontalScrollBarEnabled(false);tabScroll.setFillViewport(true);workspaceTabs=new LinearLayout(this);workspaceTabs.setBaselineAligned(false);workspaceTabs.setGravity(Gravity.TOP);
        String[] labels={"状态栏","系统图标","通知图标","素材与字体"};for(int i=0;i<labels.length;i++){final int index=i;Button button=ui.sectionTab(labels[i]);button.setTag("status-group:"+i);button.setMinWidth(ui.dp(Math.round(labels[i].length()*UiKit.compactTextSize(14)*getResources().getConfiguration().fontScale+16)));button.setOnClickListener(v->{scrollPositions.put(workspaceGroup,configScroll.getScrollY());workspaceGroup=index;workspaceDetail="";renderWorkspace();configScroll.post(()->configScroll.scrollTo(0,scrollPositions.getOrDefault(index,0)));});workspaceTabs.addView(button,new LinearLayout.LayoutParams(0,-2,1));}
        tabScroll.addView(workspaceTabs,new HorizontalScrollView.LayoutParams(-1,-2));body.addView(tabScroll,ui.margins(0,8,0,8));
        configScroll=new ScrollView(this);configScroll.setVerticalScrollBarEnabled(false);content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);configScroll.addView(content);body.addView(configScroll,new LinearLayout.LayoutParams(-1,0,1));
        masterControl=new Switch(this);masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));masterControl.setTag("config:"+ConfigSchema.SYSTEMUI_MASTER);masterRow=ui.featureRow("启用状态栏自定义","关闭保留配置；独立原生功能、素材和字体遵循各自设置。",masterControl);masterControl.setOnCheckedChangeListener((v,on)->{if(!loading){draft.put(ConfigSchema.SYSTEMUI_MASTER,on?"1":"0");changed();renderKeepingScroll();}});
        workspaceArtwork=new StatusBarWorkspaceArtwork(this,()->{if(preview!=null&&!isDestroyed())preview.invalidate();});
        workspaceAssets=new StatusBarAssetsController(owner,true);workspaceAssets.bindWorkspace(view->{if(workspaceGroup==3&&workspaceAssetHost!=null){detach(view);workspaceAssetHost.removeAllViews();workspaceAssetHost.addView(view,ui.wrap());}if(preview!=null)preview.invalidate();},()->{if(preview!=null)preview.invalidate();updateWorkspacePreviewLabel();});
        workspaceAssets.onCreate(state==null?null:state.getBundle("workspace-assets"));
        ((EnhancementSettingsActivity)owner).registerStatusAssets(workspaceAssets);
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,this::workspaceBack);
        renderWorkspace();refreshWorkspaceInventory();
        if(state!=null&&state.getBoolean("workspace-preview-hidden")){previewHost.setVisibility(View.GONE);collapse.setText("展开");}
        configScroll.post(()->configScroll.scrollTo(0,scrollPositions.getOrDefault(workspaceGroup,0)));if(dirty)main.post(autoSave);
    }
    private static void detach(View view){if(view.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)view.getParent()).removeView(view);}
    private void updateWorkspacePreviewLabel(){if(workspaceArtwork!=null&&workspaceAssets!=null&&workspaceAssets.workspaceTheme()!=null)workspaceArtwork.update(workspaceAssets.workspaceTheme(),workspaceScope);if(workspacePreviewStatus!=null)workspacePreviewStatus.setText(previewBackup!=null?"预览："+presetName+" · 尚未应用":workspaceAssets!=null&&workspaceAssets.workspaceDirty()?"状态栏预览 · 包含素材草稿":"状态栏预览 · 示例");}
    private LinearLayout workspaceCard(){boolean flat=ui.flatCards;ui.flatCards=false;LinearLayout card=ui.preferenceCard();ui.flatCards=flat;content.addView(card,ui.margins(0,0,0,8));return card;}
    private LinearLayout column(){LinearLayout value=new LinearLayout(this);value.setOrientation(LinearLayout.VERTICAL);return value;}
    private void renderWorkspace(){
        indexWorkspaceInventory();
        boolean flat=ui.flatCards;ui.flatCards=true;loading=true;
        if(connectivityFold!=null)connectivityExpanded=connectivityFold.content.getVisibility()==View.VISIBLE;
        if(nativeBatteryFold!=null)nativeBatteryExpanded=nativeBatteryFold.content.getVisibility()==View.VISIBLE;
        if(dualAppearanceFold!=null)dualAppearanceExpanded=dualAppearanceFold.content.getVisibility()==View.VISIBLE;
        connectivityFold=null;nativeBatteryFold=null;dualAppearanceFold=null;
        for(Map.Entry<String,View> e:advancedViews.entrySet())advancedExpanded.put(e.getKey(),e.getValue().getVisibility()==View.VISIBLE);advancedViews.clear();
        for(Map.Entry<String,UiKit.Fold> e:componentFolds.entrySet())expandedComponents.put(e.getKey(),e.getValue().content.getVisibility()==View.VISIBLE);componentFolds.clear();componentViews.clear();
        content.removeAllViews();workspaceAssetHost=null;controls.clear();presetActions.setVisibility(previewBackup==null?View.GONE:View.VISIBLE);
        for(int i=0;i<workspaceTabs.getChildCount();i++){View button=workspaceTabs.getChildAt(i);button.setSelected(i==workspaceGroup);}
        try{
            if(!workspaceDetail.isEmpty()){
                Button back=ui.tonalButton("返回"+(workspaceGroup==2?"通知图标":"系统图标"));back.setOnClickListener(v->{workspaceDetail="";renderWorkspace();});content.addView(back,ui.wrap());
                renderWorkspaceIcon(workspaceDetail);
            }else if(workspaceGroup==0)renderWorkspaceProperties();
            else if(workspaceGroup==1)renderWorkspaceSystem();
            else if(workspaceGroup==2){LinearLayout outer=content;content=workspaceCard();component("notifications","通知图标");workspacePlacement(content,"notifications");workspaceSpacing(content,"notifications");related("notifications",content);content=outer;}
            else{workspaceAssetHost=column();content.addView(workspaceAssetHost,ui.wrap());View assets=workspaceAssets.view();detach(assets);workspaceAssetHost.addView(assets,ui.wrap());}
            if(previewBackup!=null||workspaceResetting)setWorkspaceEnabled(content,false);
        }finally{loading=false;ui.flatCards=flat;updateWorkspacePreviewLabel();preview.invalidate();}
    }
    private static void setWorkspaceEnabled(View root,boolean enabled){root.setEnabled(enabled);if(root instanceof android.view.ViewGroup)for(int i=0;i<((android.view.ViewGroup)root).getChildCount();i++)setWorkspaceEnabled(((android.view.ViewGroup)root).getChildAt(i),enabled);}
    private void renderWorkspaceProperties(){
        LinearLayout card=workspaceCard();detach(masterRow);card.addView(masterRow,ui.wrap());
        LinearLayout presets=new LinearLayout(this);presets.setGravity(Gravity.CENTER_VERTICAL);presets.setPadding(ui.dp(8),0,0,0);
        presets.addView(ui.featureTitle("预设方案",""),new LinearLayout.LayoutParams(0,-2,1));
        Spinner preset=ui.actionChoiceSpinner("预设方案",index->previewWorkspacePreset(index==1));preset.setContentDescription("预设方案");
        preset.setAdapter(new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,new String[]{"简洁单排","常规双排"}){
            @Override public View getView(int position,View convert,ViewGroup parent){TextView label=(TextView)super.getView(position,convert,parent);label.setText(previewBackup==null?"选择预设":presetName);return label;}
        });presets.addView(preset,new LinearLayout.LayoutParams(-2,-2));workspaceCard().addView(presets,ui.wrap());
        LinearLayout outer=content;content=workspaceCard();LinearLayout properties=content;
        workspaceRowCount(content);
        LinearLayout edges=column();content=edges;number(ConfigSchema.STATUSBAR_HEIGHT_DP,"状态栏高度（0 原厂，负数减小）",ConfigSchema.STATUSBAR_HEIGHT_MIN_DP,ConfigSchema.STATUSBAR_HEIGHT_MAX_DP);marginInputs();advanced(properties,"workspace-edges","高度与四边边距",edges);
        if(!"1".equals(draft.get(StatusBarWorkspaceSpec.ROWS))){LinearLayout gap=column();content=gap;number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"上下两排间距",-8,64);advanced(properties,"workspace-gap","双排间距",gap);}
        if(!ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)))setWorkspaceEnabled(properties,false);
        content=outer;LinearLayout behavior=column();related("layout",behavior);related("gesture",behavior);advanced(workspaceCard(),"workspace-behavior","显示与交互",behavior);
        if(positionSizeOnly()){LinearLayout mode=workspaceCard();toggle(mode,ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY,"仅调整位置和大小（旧方案）");}
        LinearLayout resetCard=workspaceCard();Button resetAll=ui.textButton("重置状态栏配置");resetAll.setTextColor(ui.danger);resetAll.setTag("statusbar-reset-all");resetAll.setOnClickListener(v->confirmWorkspaceReset());resetCard.addView(resetAll,ui.wrap());TextView resetHint=ui.text("清除四个分组的全部配置，恢复原厂样式。",12,ui.muted,false);resetHint.setGravity(Gravity.CENTER);resetCard.addView(resetHint,ui.margins(0,0,0,10));
    }
    private void workspaceRowCount(LinearLayout parent){
        LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);row.setPadding(ui.dp(8),0,0,0);
        row.addView(ui.featureTitle("状态栏排数","单排时暂停第二排配置，切回双排保留原行位置。"),new LinearLayout.LayoutParams(0,-2,1));
        Spinner input=ui.inlineChoiceSpinner("状态栏排数");input.setContentDescription("状态栏排数");
        input.setAdapter(choiceAdapter(new String[]{"单排","双排"}));final int[] previous={singleRow()?0:1};input.setSelection(previous[0]);
        row.addView(input,new LinearLayout.LayoutParams(-2,-2));parent.addView(row,ui.wrap());
        input.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View view,int index,long id){if(!loading&&index!=previous[0]){previous[0]=index;draft.put(StatusBarWorkspaceSpec.ROWS,index==0?"1":"2");changed();renderKeepingScroll();}}});
    }
    private void renderWorkspaceSystem(){
        LinearLayout outer=content,card=workspaceCard(),general=column();content=general;
        if(!singleRow())toggle(general,ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"系统图标分两排");
        workspaceSystemSize(general);workspacePlacement(general,"system_icons");workspaceSpacing(general,"system_icons");hintPrioritySection();related("icons",general);
        LinearLayout network=column();related("general-network",network);advanced(general,"workspace-network-common","移动网络与信号",network);
        toggle(general,SystemUiOptions.PREFIX+"metrics_hide_units","温度与电量隐藏单位");related("hidden-icons",general);
        toggle(general,SystemUiOptions.PREFIX+"metrics_charging_only","仅充电时显示电流和功率");
        content=outer;advanced(card,"workspace-general","通用设置",general);
        workspaceConnectivity(card);
        LinearLayout directory=column();EditText search=new EditText(this);search.setSingleLine();search.setHint("搜索名称或图标标识");search.setContentDescription("搜索系统图标");ui.styleInput(search);search.setText(workspaceQuery);directory.addView(search,ui.wrap());
        LinearLayout actions=new LinearLayout(this);actions.setGravity(Gravity.CENTER_VERTICAL);
        Spinner filter=ui.choiceSpinner("筛选图标");filter.setContentDescription("筛选图标");filter.setAdapter(choiceAdapter(StatusBarWorkspaceItems.FILTERS));filter.setSelection(workspaceFilter);actions.addView(filter,new LinearLayout.LayoutParams(0,-2,1));
        ImageButton refresh=ui.iconAction(R.drawable.ic_restart_scope,"刷新本机图标");workspaceRefreshButton=refresh;refresh.setEnabled(!workspaceRefreshing);refresh.setAlpha(workspaceRefreshing?.5f:1);refresh.setOnClickListener(v->{refresh.setEnabled(false);refreshWorkspaceInventory();});
        LinearLayout.LayoutParams refreshSize=new LinearLayout.LayoutParams(ui.dp(48),ui.dp(48));refreshSize.setMarginStart(ui.dp(8));actions.addView(refresh,refreshSize);directory.addView(actions,ui.margins(0,8,0,8));
        LinearLayout list=column();directory.addView(list,ui.wrap());populateWorkspaceDirectory(list);search.addTextChangedListener(new android.text.TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){workspaceQuery=s.toString();populateWorkspaceDirectory(list);}public void afterTextChanged(android.text.Editable e){}});
        filter.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int index,long id){if(workspaceFilter!=index){workspaceFilter=index;populateWorkspaceDirectory(list);}}});
        advanced(card,"workspace-directory","独立图标配置",directory);
    }
    private void workspaceSystemSize(LinearLayout parent){
        StatusBarGridSpec.Item item=grid.get("system_icons");Switch enabled=new Switch(this);enabled.setChecked(item.size>0);
        enabled.setTag("statusbar-system-size");parent.addView(ui.featureRow("系统图标大小","关闭时使用原厂大小；开启后可调整系统图标的大小。",enabled),ui.wrap());
        LinearLayout settings=column();parent.addView(settings,ui.wrap());
        if(item.size>0)slider(settings,"图标大小（dp）",item.size,6,32,value->updateItem("system_icons",null,-1,value,null));
        UiKit.Fold fold=ui.fold(enabled,settings);componentFolds.put("system_icons_size",fold);fold.show(Boolean.TRUE.equals(expandedComponents.get("system_icons_size")));
        enabled.setOnCheckedChangeListener((button,on)->{if(loading)return;
            android.content.SharedPreferences memory=getSharedPreferences("native_value_overrides",MODE_PRIVATE);String key="remember:"+ConfigSchema.STATUSBAR_GRID;int size=13;
            if(on){try{int remembered=Integer.parseInt(memory.getString(key,"13"));if(remembered>=6&&remembered<=32)size=remembered;}catch(NumberFormatException ignored){}}
            else memory.edit().putString(key,String.valueOf(workspaceItem("system_icons").size)).apply();
            expandedComponents.put("system_icons_size",on);fold.show(on);updateItem("system_icons",null,-1,on?size:0,null);renderKeepingScroll();});
    }
    private void workspaceConnectivity(LinearLayout parent){
        Switch enabled=new Switch(this);enabled.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)));controls.put(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,enabled);
        enabled.setTag("config:"+ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);parent.addView(ui.featureRow("三合一图标",FeatureDescriptions.forKey(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"三合一图标"),enabled),ui.wrap());
        LinearLayout settings=column();parent.addView(settings,ui.wrap());
        if(connectivityGroup()){
            slider(settings,"圆形组件大小（dp）",number(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE),18,40,value->{draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,String.valueOf(value));changed();});
            workspacePlacement(settings,"battery");connectivityControls(settings);
        }
        connectivityFold=ui.fold(enabled,settings);connectivityFold.show(connectivityExpanded);
        enabled.setOnCheckedChangeListener((button,on)->{if(!loading)setBatteryMode(true,on);});
    }
    private void populateWorkspaceDirectory(LinearLayout list){
        list.removeAllViews();java.util.LinkedHashMap<String,String> names=new java.util.LinkedHashMap<>();for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all())names.put(icon.id,icon.title);
        for(int i=0;i<StatusBarGridSpec.IDS.length;i++)if(!java.util.Arrays.asList("notifications","system_icons").contains(StatusBarGridSpec.IDS[i]))names.put(StatusBarGridSpec.IDS[i],StatusBarGridSpec.LABELS[i]);
        for(String id:workspaceObserved.keySet())names.putIfAbsent(id,id);
        for(String id:StatusBarWorkspaceItems.configuredIds(draft::get,workspaceAssets.workspaceTheme()))names.putIfAbsent(id,id);
        list.addView(ui.text(workspaceObserved.isEmpty()?"当前显示位置暂无最新检测结果，可选择全部图标预先配置。":"当前显示位置已加载 "+workspaceObserved.size()+" 项。",12,ui.muted,false),ui.wrap());int count=0;
        String query=workspaceQuery.toLowerCase(java.util.Locale.ROOT);for(Map.Entry<String,String> e:names.entrySet())if((e.getKey()+e.getValue()).toLowerCase(java.util.Locale.ROOT).contains(query)){
            String id=e.getKey();boolean modified=StatusBarWorkspaceItems.changed(id,draft::get,workspaceAssets.workspaceTheme(),workspaceAssets.workspaceFonts(),workspaceScope);
            if(!StatusBarWorkspaceItems.matches(workspaceFilter,workspaceObserved.containsKey(id),workspaceVisible.contains(id),modified))continue;
            String hint=workspaceObserved.getOrDefault(id,"尚未检测到")+(modified?" · 已修改":"");count++;
            list.addView(ui.preferenceRow("status-icon:"+id,e.getValue(),hint,()->{workspaceDetail=id;renderWorkspace();configScroll.scrollTo(0,0);}),ui.wrap());
        }
        if(count==0)list.addView(ui.text("没有符合筛选条件的图标。",12,ui.muted,false),ui.wrap());
    }
    private void refreshWorkspaceInventory(){refreshWorkspaceInventory(true);}
    private void finishWorkspaceRefresh(){workspaceRefreshing=false;if(workspaceRefreshButton!=null){workspaceRefreshButton.setEnabled(true);workspaceRefreshButton.setAlpha(1);}}
    private void refreshWorkspaceInventory(boolean redrawDirectory){if(workspaceRefreshing||isDestroyed())return;workspaceRefreshing=true;worker.execute(()->{try{
        Bundle response=getContentResolver().call(android.net.Uri.parse("content://ls.augment.com.config"),"statusbar_inventory_get",null,null);String raw=response==null?"":response.getString("payload","");
        org.json.JSONObject next=raw.isEmpty()?new org.json.JSONObject():new org.json.JSONObject(raw);
        runOnUiThread(()->{finishWorkspaceRefresh();if(isDestroyed())return;workspaceInventory=next;indexWorkspaceInventory();preview.invalidate();if(redrawDirectory&&workspaceGroup==1&&workspaceDetail.isEmpty())renderKeepingScroll();});
    }catch(Exception error){runOnUiThread(()->{finishWorkspaceRefresh();if(!isDestroyed()&&redrawDirectory){Toast.makeText(this,"本机图标读取失败，保留上次结果",Toast.LENGTH_SHORT).show();if(workspaceGroup==1&&workspaceDetail.isEmpty())renderKeepingScroll();}});}});}
    private void indexWorkspaceInventory(){
        workspaceObserved.clear();workspaceVisible.clear();org.json.JSONArray active=workspaceInventory.optJSONArray("observedSurfaces");org.json.JSONObject times=workspaceInventory.optJSONObject("surfaceObservedAt");
        if(active==null)return;
        for(int s=0;s<active.length();s++){String scope=active.optString(s);if(!workspaceScope.equals("all")&&!workspaceScope.equals(scope))continue;
            long when=times==null?workspaceInventory.optLong("observedAt"):times.optLong(scope);long age=System.currentTimeMillis()-when;if(when<=0||age<0||age>30000)continue;
            for(String source:new String[]{"surfaces","workspaceItems"}){org.json.JSONObject surfaces=workspaceInventory.optJSONObject(source);org.json.JSONArray rows=surfaces==null?null:surfaces.optJSONArray(scope);if(rows==null)continue;
                for(int i=0;i<rows.length();i++){org.json.JSONObject row=rows.optJSONObject(i);if(row==null)continue;String id=row.optString("id"),state=row.optString("state");if(!StatusBarIconCatalog.validId(id))continue;
                    boolean visible=state.equals("visible")||state.equals("dot");if(visible)workspaceVisible.add(id);
                    String label=StatusBarSurfaceSpec.label(scope)+(visible?" · 正在显示":state.equals("unsupported")?" · 已加载，暂未适配":" · 当前未显示");
                    if(!workspaceObserved.containsKey(id)||visible)workspaceObserved.put(id,label);
                }
            }
        }
    }
    private void renderWorkspaceIcon(String id){
        if(id.equals("connectivity")){renderWorkspaceIcon("battery");return;}
        LinearLayout outer=content;content=workspaceCard();boolean component=java.util.Arrays.asList(StatusBarGridSpec.IDS).contains(id);
        if(component){if("battery".equals(id)){if(connectivityGroup())workspaceConnectivity(content);else nativeBatterySection();}else component(id,componentName(id));if(!"battery".equals(id)||!connectivityGroup())workspacePlacement(content,id);workspaceSpacing(content,id);
            if(StatusBarWorkspaceItems.METRICS.contains(id)){toggle(content,SystemUiOptions.PREFIX+"metrics_custom","自定义前缀与宽度");LinearLayout specific=column();related(id,specific);content.addView(specific,ui.wrap());if(!ConfigSchema.truthy(draft.get(SystemUiOptions.PREFIX+"metrics_custom")))setWorkspaceEnabled(specific,false);}
            else related(id,content);
        }
        else {
            StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(id);content.addView(ui.text(icon==null?id:icon.title,14,ui.text,true),ui.wrap());
            StatusBarVisibilitySpec visible=StatusBarVisibilitySpec.parse(draft.get(StatusBarVisibilitySpec.KEY));if(visible==null)visible=StatusBarVisibilitySpec.empty();final StatusBarVisibilitySpec before=visible;
            Switch hide=new Switch(this);hide.setChecked(visible.explicitlyHidden(workspaceScope,id));content.addView(ui.featureRow("隐藏图标","关闭后遵循共享方案及原厂显示条件。",hide),ui.wrap());hide.setOnCheckedChangeListener((v,on)->{if(!loading){draft.put(StatusBarVisibilitySpec.KEY,before.with(workspaceScope,id,on).serialize());changed();}});
            if(StatusBarWorkspaceSpec.independentSlot(id)&&!(connectivityGroup()&&java.util.Arrays.asList("wifi","mobile1","mobile2").contains(id)))workspacePlacement(content,id);
            else {String parent=StatusBarWorkspaceItems.parent(id,connectivityGroup());workspaceOwnerLink(content,parent,"前往"+(parent.equals("battery")?"三合一":parent.equals("general-network")?"移动网络与信号":parent.equals("system_icons")?"通用":StatusBarIconCatalog.find(parent)==null?parent:StatusBarIconCatalog.find(parent).title)+"配置","该元素由所属图标统一排列，显示顺序在所属图标中设置。");}
            workspaceSpacing(content,id);if("bluetooth".equals(id))bluetoothSection();if("vpn".equals(id))vpnSection();related(id,content);
        }content=outer;
    }
    private void workspaceOwnerLink(LinearLayout parent,String target,String title,String hint){parent.addView(ui.preferenceRow("workspace-owner:"+target,title,hint,()->{
        workspaceGroup=1;if(target.startsWith("general-")||target.equals("system_icons")){workspaceDetail="";advancedExpanded.put("workspace-general",true);if(target.equals("general-network"))advancedExpanded.put("workspace-network-common",true);}else workspaceDetail=target;
        renderWorkspace();configScroll.scrollTo(0,0);
    }),ui.wrap());}
    private void workspaceChoice(LinearLayout parent,String title,String[] labels,int current,java.util.function.IntConsumer change){
        parent.addView(ui.featureTitle(title,"选择后保存；切换分组保留当前配置。"),ui.wrap());Spinner input=ui.choiceSpinner(title);input.setContentDescription(title);input.setAdapter(choiceAdapter(labels));input.setSelection(current);parent.addView(input,ui.wrap());final int[] previous={current};input.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View view,int index,long id){if(!loading&&index!=previous[0]){previous[0]=index;change.accept(index);}}});
    }
    private void workspacePlacement(LinearLayout parent,String id){
        boolean component=grid.get(id)!=null;StatusBarGridSpec.Item item=workspaceItem(id);
        LinearLayout order=column();slider(order,"显示顺序",item.order+1,1,999,n->{StatusBarGridSpec.Item value=workspaceItem(id);workspacePlace(id,new StatusBarGridSpec.Item(value.zone,n-1,value.size,value.visible));});parent.addView(order,ui.wrap());if(!ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)))setWorkspaceEnabled(order,false);
        LinearLayout fields=column();workspaceChoice(fields,"所在区域",new String[]{"左侧","中间","右侧"},"LCR".indexOf(item.zone.charAt(0)),index->{StatusBarGridSpec.Item value=workspaceItem(id);workspacePlace(id,new StatusBarGridSpec.Item("LCR".substring(index,index+1)+value.zone.substring(1),value.order,value.size,value.visible));});
        if(!"1".equals(draft.get(StatusBarWorkspaceSpec.ROWS)))workspaceChoice(fields,"行位置",new String[]{"上排","下排","跨两排"},"12S".indexOf(item.zone.charAt(1)),index->{StatusBarGridSpec.Item value=workspaceItem(id);workspacePlace(id,new StatusBarGridSpec.Item(value.zone.substring(0,1)+"12S".substring(index,index+1),value.order,value.size,value.visible));});
        if(!component){Switch nativeSize=new Switch(this);nativeSize.setChecked(item.size==0);fields.addView(ui.featureRow("跟随原生大小","关闭后可指定当前图标大小。",nativeSize),ui.wrap());nativeSize.setOnCheckedChangeListener((v,on)->{if(!loading){StatusBarGridSpec.Item value=workspaceItem(id);workspacePlace(id,new StatusBarGridSpec.Item(value.zone,value.order,on?0:13,value.visible));renderKeepingScroll();}});if(item.size>0)slider(fields,"图标大小（dp）",item.size,6,32,n->{StatusBarGridSpec.Item value=workspaceItem(id);workspacePlace(id,new StatusBarGridSpec.Item(value.zone,value.order,n,value.visible));});}
        if(!ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)))setWorkspaceEnabled(fields,false);
        advanced(parent,"workspace-placement:"+id,"位置",fields);
    }
    private StatusBarGridSpec.Item workspaceItem(String id){if(grid.get(id)!=null)return grid.get(id);StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(draft.get(StatusBarWorkspaceSpec.ICONS));StatusBarGridSpec.Item item=positions==null?null:positions.get(id);return item==null?grid.get("system_icons"):item;}
    private void workspacePlace(String id,StatusBarGridSpec.Item item){if(workspaceResetting)return;if(grid.get(id)!=null)grid=grid.with(id,item);else{
        StatusBarGridSpec.Item old=workspaceItem(id);StatusBarEditPolicy policy=StatusBarEditPolicy.resolve(draft::get);
        if(!old.zone.equals(item.zone))policy=policy.with(id,"zone",true);
        if(old.order!=item.order)policy=policy.with(id,"order",true);
        if(old.size!=item.size)policy=policy.with(id,"size",item.size!=0);
        StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(draft.get(StatusBarWorkspaceSpec.ICONS));if(positions==null)positions=StatusBarWorkspaceSpec.empty();
        draft.put(StatusBarEditPolicy.KEY,policy.serialize());draft.put(StatusBarWorkspaceSpec.ICONS,positions.with(id,item).serialize());}changed();}
    private void workspaceSpacing(LinearLayout parent,String id){if(!StatusBarIconSpacingSpec.supported(id))return;StatusBarIconSpacingEditor.add(this,ui,parent,workspaceScope,id,()->draft.get(StatusBarIconSpacingSpec.KEY),value->{draft.put(StatusBarIconSpacingSpec.KEY,value);changed();},this::renderKeepingScroll);}
    private void previewWorkspacePreset(boolean dual){save();main.removeCallbacks(autoSave);previewBackup=snapshot();presetName=dual?"常规双排":"简洁单排";StatusBarPresetPreview.preview(draft,StatusBarWorkspaceSpec.preset(dual,previewBackup));syncDraftUi();}
    private void confirmWorkspacePreset(){if(previewBackup==null)return;Map<String,String> chosen=StatusBarWorkspaceSpec.preset("常规双排".equals(presetName),previewBackup);StatusBarPresetPreview.restore(draft,previewBackup);previewBackup=null;for(Map.Entry<String,String> e:chosen.entrySet())draft.put(e.getKey(),e.getValue());((EnhancementSettingsActivity)owner).applyStatusbarPresetValues(chosen);relatedViews.clear();syncDraftUi();changed();Toast.makeText(this,"已应用"+presetName,Toast.LENGTH_SHORT).show();}
    private void confirmWorkspaceReset(){ui.glassDialog("重置状态栏配置","清除状态栏属性、系统图标、三合一、硬件指标、通知图标、所有显示位置的素材与字体配置及未应用草稿，关闭状态栏自定义，恢复原厂样式。其它模块设置不变。","确认重置",()->{
        if(workspaceAssets.workspaceSaving()){Toast.makeText(this,"素材正在保存，请完成后重置",Toast.LENGTH_SHORT).show();return;}
        if(previewBackup!=null)cancelPreset();main.removeCallbacks(autoSave);save();workspaceResetting=true;setWorkspaceEnabled(workspaceBody,false);
        ((EnhancementSettingsActivity)owner).flushStatusbarForReset(()->worker.execute(()->{AppConfig.SaveResult result=config.save(StatusBarWorkspaceSpec.reset());runOnUiThread(()->{if(isDestroyed())return;workspaceResetting=false;setWorkspaceEnabled(workspaceBody,true);if(result.success){Map<String,String> saved=new LinkedHashMap<>();for(String key:draft.keySet())saved.put(key,savedValue(key));draft.replaceSaved(saved);grid=editorGrid();rawInputs.clear();lastLayoutBackup=null;relatedViews.clear();((EnhancementSettingsActivity)owner).refreshStatusbarAfterReset();workspaceAssets.workspaceReset();loading=true;masterControl.setChecked(false);loading=false;}renderWorkspace();Toast.makeText(this,result.success?"已重置状态栏配置":result.message,Toast.LENGTH_LONG).show();});}),()->{workspaceResetting=false;setWorkspaceEnabled(workspaceBody,true);renderWorkspace();});
    },"取消");}
    void workspaceBack(){if(workspaceResetting)return;if(!workspaceDetail.isEmpty()){workspaceDetail="";renderWorkspace();return;}if(previewBackup!=null){cancelPreset();return;}if(workspaceGroup==3&&workspaceAssets.workspaceBack())return;workspaceAssets.workspaceExit(()->{save();finish();});}
    void workspaceAncestor(String route){if(workspaceResetting)return;workspaceAssets.workspaceExit(()->{if(previewBackup!=null)cancelPreset();save();ModuleNavigation.returnTo(owner,route);});}

    private void render() {
        render(false);
    }
    private void render(boolean preserveExpanded) {
        if(workspace()){renderWorkspace();return;}
        boolean previousFlat=ui.flatCards;ui.flatCards=!("status_layout".equals(route)||"status_legacy".equals(route));try {
        for(Map.Entry<String,View> entry:advancedViews.entrySet())advancedExpanded.put(entry.getKey(),entry.getValue().getVisibility()==View.VISIBLE);
        advancedViews.clear();
        for(Map.Entry<String,UiKit.Fold> entry:componentFolds.entrySet())
            expandedComponents.put(entry.getKey(),entry.getValue().content.getVisibility()==View.VISIBLE);
        componentFolds.clear();componentViews.clear();
        if(connectivityFold!=null)connectivityExpanded=connectivityFold.content.getVisibility()==View.VISIBLE;
        connectivityFold=null;
        if(nativeBatteryFold!=null)nativeBatteryExpanded=nativeBatteryFold.content.getVisibility()==View.VISIBLE;
        nativeBatteryFold=null;
        if(dualAppearanceFold!=null)dualAppearanceExpanded=dualAppearanceFold.content.getVisibility()==View.VISIBLE;
        dualAppearanceFold=null;
        loading = true; sectionFold=null;clockSizeInput=null;controls.clear();content.removeAllViews();configScroll.scrollTo(0,0);
        presetActions.setVisibility(previewBackup==null?View.GONE:View.VISIBLE);undoLayout.setEnabled(lastLayoutBackup!=null&&previewBackup==null);
        undoLayout.setAlpha(undoLayout.isEnabled()?1f:.45f);
        masterControl.setEnabled(previewBackup==null);
        if(("status_layout".equals(route)||"status_legacy".equals(route))){
            renderOverview();
        } else if("status_surfaces".equals(route)){
            renderSurfaces();
        } else if(StatusBarPages.surface(route)!=null){
            renderSurface(StatusBarPages.surface(route));
        } else if(previewBackup!=null){
            content.addView(ui.text("正在预览："+presetName,17,ui.text,true),ui.margins(0,16,0,8));
            content.addView(ui.text("顶部为示例效果，手机尚未应用此预设。选择“使用此预设”后保存；取消或离开页面会恢复预览前的设置。",13,ui.muted,false));
        } else if (tab == 0) {
            toggle(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY, "仅调整位置和大小");
            content.addView(ui.text("先选择预设或自动整理；需要精调时再展开下方高级设置。",12,ui.muted,false));
            arrangementComponents();
            LinearLayout root=content;content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
            number(ConfigSchema.STATUSBAR_HEIGHT_DP, "状态栏高度（0 原厂，负数减小）", ConfigSchema.STATUSBAR_HEIGHT_MIN_DP, ConfigSchema.STATUSBAR_HEIGHT_MAX_DP);
            marginInputs();
            if(!positionSizeOnly())number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP, "两排间距", -8, 64);
            LinearLayout settings=content;content=root;advanced(content,"layout-spacing","高级：高度、留白与两排间距",settings);
            related("layout",content);
        } else if (tab == 1) {
            component("clock", "时钟");
            related("clock",content);
        } else if (tab == 2) {
            component("notifications","通知图标");
            LinearLayout spacing=new LinearLayout(this);spacing.setOrientation(LinearLayout.VERTICAL);
            StatusBarIconSpacingEditor.add(this,ui,spacing,"all","notifications",()->draft.get(StatusBarIconSpacingSpec.KEY),value->{draft.put(StatusBarIconSpacingSpec.KEY,value);changed();},this::renderKeepingScroll);
            if(spacing.getChildCount()>0){
                LinearLayout editor=(LinearLayout)spacing.getChildAt(0);spacing.removeView(editor);
                addFeatureBlock(content,editor);
            }
            related("notifications",content);
        } else if (tab == 3) {
            if(positionSizeOnly()){
                content.addView(ui.text("当前仅调整原生组件的位置和大小。硬件信息和自定义网速已暂停，原有设置保留；可在布局页关闭此模式后继续设置。",12,ui.muted,false));
            }
            else{
                for (int i = 4; i < StatusBarGridSpec.IDS.length; i++) if(!StatusBarGridSpec.IDS[i].equals("network"))component(StatusBarGridSpec.IDS[i], StatusBarGridSpec.LABELS[i]);
            }
            related("metrics",content);
        } else if(tab==4) {
            component("system_icons","系统图标");
            if(!positionSizeOnly()){hintPrioritySection();bluetoothSection();vpnSection();}
            related("icons",content);
        } else if(tab==5) {
            if(!positionSizeOnly())connectivitySection();
            nativeBatterySection();
        } else if(tab==6){
            if(positionSizeOnly())nativeNetworkSize(content);else component("network","网速");
            related("network",content);
        }
        if(reset.getParent()!=null)((android.view.ViewGroup)reset.getParent()).removeView(reset);
        if("status_arrangement".equals(route)&&previewBackup==null)content.addView(reset,ui.margins(0,20,0,0));
        loading = false; preview.invalidate();
        } finally {ui.flatCards=previousFlat;}
    }

    private void renderOverview(){
        for(int group=0;group<StatusBarPages.GROUP_TITLES.length;group++){
            ui.addDetailSectionTitle(content,StatusBarPages.GROUP_TITLES[group]);
            LinearLayout card=ui.preferenceCard();card.setTag("statusbar-group:"+group);
            if(group==0){
                if(masterRow.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)masterRow.getParent()).removeView(masterRow);
                card.addView(masterRow,ui.wrap());
                runtimeFeedback=ui.text(runtimeMessage(),12,ui.muted,false);runtimeFeedback.setTag("statusbar-runtime-result");
                runtimeFeedback.setVisibility(runtimeMessage().isEmpty()?View.GONE:View.VISIBLE);card.addView(runtimeFeedback,ui.margins(0,0,0,8));
            }
            for(String target:StatusBarPages.GROUP_ROUTES[group]){
                int index=java.util.Arrays.asList(StatusBarPages.ROUTES).indexOf(target);
                if(card.getChildCount()>0)card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
                card.addView(ui.preferenceRow(target,StatusBarPages.TITLES[index],StatusBarPages.SUMMARIES[index],()->openPage(target)),ui.wrap());
            }
            content.addView(card,ui.margins(0,0,0,8));
        }
        java.util.List<ModulePresentationCatalog.Related> links=ModulePresentationCatalog.related(route);
        if(!links.isEmpty()){
            ui.addDetailSectionTitle(content,"相关功能");
            LinearLayout card=ui.preferenceCard();
            for(ModulePresentationCatalog.Related link:links){
                if(card.getChildCount()>0)card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
                card.addView(ui.preferenceRow(link.route,link.title,link.summary,()->openPage(link.route)),ui.wrap());
            }
            content.addView(card,ui.wrap());
        }
    }
    private void renderSurfaces(){
        for(String surface:StatusBarSurfaceSpec.SURFACES)pageLink("status_surface/"+surface,StatusBarSurfaceSpec.label(surface),"图标显示、状态素材与字体");
    }
    private void renderSurface(String surface){
        content.addView(ui.text("设置这个位置的状态栏图标。未单独设置时沿用共享方案和原厂规则。",12,ui.muted,false),ui.margins(0,0,0,12));
        if("notification".equals(surface)||"control".equals(surface))content.addView(ui.text("这里对应顶部图标区域；不改变下方磁贴或通知内容。",12,ui.muted,false),ui.margins(0,0,0,8));
        LinearLayout fonts=ui.preferenceRow("status_assets","此位置的字体","统一字体与角色覆盖",()->openAssets(surface,"fonts"));content.addView(fonts,ui.wrap());
        String previous="";
        for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all()){
            if(icon.id.contains(".")&&!icon.id.startsWith("privacy."))continue;
            if(!previous.equals(icon.group)){content.addView(ui.text(icon.group,12,ui.muted,true),ui.margins(0,16,0,4));previous=icon.group;}
            content.addView(ui.preferenceRow("asset/"+icon.id,icon.title,StatusBarIconSpacingSpec.supported(icon.id)?"显示、素材与边界间距":"显示规则与状态素材",()->openAsset(icon.id,surface)),ui.wrap());
        }
    }
    private void pageLink(String target,String title,String summary){
        if(content.getChildCount()>0)content.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        content.addView(ui.preferenceRow(target,title,summary,()->openPage(target)),ui.wrap());
    }
    private void arrangementComponents(){
        for(int region=0;region<3;region++){
            char side="LCR".charAt(region);LinearLayout list=new LinearLayout(this);list.setOrientation(LinearLayout.VERTICAL);
            java.util.List<String> ids=new java.util.ArrayList<>();for(String id:StatusBarGridSpec.IDS)if(grid.get(id).zone.charAt(0)==side&&itemVisible(id,grid.get(id)))ids.add(id);
            ids.sort(java.util.Comparator.comparingInt(id->grid.get(id).order));
            for(String id:ids){
                StatusBarGridSpec.Item item=grid.get(id);String subtitle=StatusBarGridSpec.ZONE_LABELS[java.util.Arrays.asList(StatusBarGridSpec.ZONES).indexOf(item.zone)]+" · "+(item.size==0?"原生大小":item.size+" dp");
                LinearLayout row=ui.groupRow();row.setTag("placement:"+id);
                LinearLayout label=new LinearLayout(this);label.setOrientation(LinearLayout.VERTICAL);
                label.addView(ui.text(componentName(id),14,ui.text,true),ui.wrap());label.addView(ui.text(subtitle,12,ui.muted,false),ui.wrap());
                row.addView(label,new LinearLayout.LayoutParams(0,-2,1));
                Button move=ui.tonalButton("移动");move.setContentDescription("调整"+componentName(id)+"的位置");move.setOnClickListener(v->editPlacement(id));row.addView(move,new LinearLayout.LayoutParams(-2,ui.dp(44)));list.addView(row,ui.wrap());
            }
            if(ids.isEmpty())list.addView(ui.text("当前没有组件",12,ui.muted,false),ui.margins(0,8,0,8));
            else{Button order=ui.tonalButton("调整这一侧的顺序");order.setOnClickListener(v->dragOrder(ids.get(0)));list.addView(order,ui.wrap());}
            content.addView(ui.foldingSection(new String[]{"左侧组件","中间组件","右侧组件"}[region],list,true),ui.margins(0,8,0,0));
        }
    }
    private void editPlacement(String id){
        StatusBarGridSpec.Item item=grid.get(id);boolean paired=positionSizeOnly()||isTwoRows(id)||id.equals("battery")&&connectivityGroup();
        String[] zones=paired?new String[]{"LS","CS","RS"}:StatusBarGridSpec.ZONES;
        String[] labels=paired?new String[]{"左侧 · 跨两排","中间 · 跨两排","右侧 · 跨两排"}:StatusBarGridSpec.ZONE_LABELS;
        ui.choiceDialog(componentName(id)+" · 显示位置",labels,null,index->{updateItem(id,zones[index],-1,-1,null);renderKeepingScroll();});
    }
    private String runtimeMessage(){
        String phone=config.diagnostic("ls_augment_statusbar_phone_last_error"),lock=config.diagnostic("ls_augment_statusbar_keyguard_last_error");
        if(!phone.isEmpty()||!lock.isEmpty())return "最近运行结果："+(!phone.isEmpty()?"顶部状态栏 · "+phone:"")+(!phone.isEmpty()&&!lock.isEmpty()?"\n":"")+(!lock.isEmpty()?"锁屏 · "+lock:"");
        return "";
    }
    private void openPage(String target){
        if(workspace()){if(target.equals("status_assets")){workspaceGroup=3;workspaceDetail="";}else if(target.equals("status_notifications")){workspaceGroup=2;workspaceDetail="";}else{workspaceGroup=1;workspaceDetail=target.replace("status_","");}renderWorkspace();return;}
        save();worker.execute(()->runOnUiThread(()->{if(!isDestroyed())ModuleNavigation.open(owner,target);}));
    }
    private void openComponent(String id){
        if(workspace()){workspaceGroup=id.equals("notifications")?2:1;workspaceDetail=id;renderKeepingScroll();return;}
        String target=StatusBarPages.componentRoute(id);save();worker.execute(()->runOnUiThread(()->{if(!isDestroyed())owner.startActivity(new android.content.Intent(owner,StatusBarSettingsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,target).putExtra("status_component",id));}));
    }
    private void openAsset(String id,String surface){
        openAsset(id,surface,"whole");
    }
    private void openAsset(String id,String surface,String layer){
        if(workspace()){workspaceGroup=3;workspaceDetail="";workspaceAssets.workspaceOpen(id,surface,layer);renderWorkspace();return;}
        save();worker.execute(()->runOnUiThread(()->{if(!isDestroyed())owner.startActivity(new android.content.Intent(owner,StatusBarAssetsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"asset/"+id).putExtra("status_surface",surface).putExtra("status_asset_layer",layer));}));
    }
    private void openAssets(String surface,String mode){
        if(workspace()){workspaceGroup=3;workspaceDetail="";workspaceAssets.workspaceOpenPage(surface,mode);renderWorkspace();return;}
        save();worker.execute(()->runOnUiThread(()->{if(!isDestroyed())owner.startActivity(new android.content.Intent(owner,StatusBarAssetsActivity.class).putExtra(ModuleNavigation.EXTRA_ROUTE,"status_assets").putExtra("status_surface",surface).putExtra("status_assets_page",mode));}));
    }

    private boolean resumed;
    @Override protected void onResume(){
        super.onResume();if(!inventoryObserving){getContentResolver().registerContentObserver(android.net.Uri.parse("content://ls.augment.com.config/statusbar-inventory"),false,inventoryObserver);inventoryObserving=true;}
        refreshWorkspaceInventory(false);if(!resumed){resumed=true;return;}
        // Child editors submit through the same ordered worker. Refresh only values this page
        // does not own an unsaved edit for, so returning never overwrites a child or draft.
        worker.execute(()->runOnUiThread(()->{
            if(isDestroyed())return;Map<String,String> unsaved=draft.unsaved();boolean changed=false;
            for(String key:draft.keySet())if(!unsaved.containsKey(key)){String value=savedValue(key);if(!java.util.Objects.equals(value,draft.get(key))){draft.seed(key,value);changed=true;}}
            if(changed){grid=editorGrid();loading=true;masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));loading=false;renderKeepingScroll();}
            preview.invalidate();
            refreshRuntimeFeedback();
        }));
    }

    private void hintPrioritySection(){
        LinearLayout card=ui.card(),settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(0,0,0,0);settings.setPadding(ui.dp(12),0,0,0);
        Switch enabled=new Switch(this);enabled.setTag("feature-control:"+StatusBarIconOrderPolicy.ENABLED);enabled.setChecked(ConfigSchema.truthy(draft.get(StatusBarIconOrderPolicy.ENABLED)));
        card.addView(ui.featureRow("系统提示图标优先级","空间不足时按优先级保留；不会显示原厂未允许、已屏蔽或被你隐藏的图标。",enabled),ui.wrap());
        settings.addView(ui.text("数量上限独立于通知；Wi-Fi、移动信号与电池不计入。只决定保留哪些图标，不改变正常显示位置。",12,ui.muted,false),ui.wrap());
        slider(settings,"最多系统提示图标（0 跟随原厂）",number(StatusBarIconOrderPolicy.LIMIT),0,20,value->{draft.put(StatusBarIconOrderPolicy.LIMIT,String.valueOf(value));changed();});
        Button edit=ui.tonalButton("调整保留优先级");edit.setOnClickListener(v->chooseHintPriority());settings.addView(edit,ui.wrap());
        Button reset=ui.tonalButton("恢复默认优先级与数量");reset.setOnClickListener(v->{draft.put(StatusBarIconOrderPolicy.ORDER,"");draft.put(StatusBarIconOrderPolicy.LIMIT,"0");changed();renderKeepingScroll();});settings.addView(reset,ui.wrap());
        card.addView(settings,ui.wrap());UiKit.Fold fold=ui.fold(enabled,settings);fold.sync();enabled.setOnCheckedChangeListener((button,on)->{fold.sync();if(!loading){draft.put(StatusBarIconOrderPolicy.ENABLED,on?"1":"0");changed();}});
        addFeatureBlock(content,card);
    }
    private void chooseHintPriority(){
        java.util.List<String> ids=StatusBarIconOrderPolicy.order(draft.get(StatusBarIconOrderPolicy.ORDER));String[] titles=new String[ids.size()];
        for(int i=0;i<ids.size();i++){StatusBarIconCatalog.Icon icon=StatusBarIconCatalog.find(ids.get(i));titles[i]=(i+1)+". "+(icon==null?ids.get(i):icon.title);}
        AppDialogs.builder(this).setTitle("优先保留顺序").setItems(titles,(dialog,index)->{
            String id=ids.get(index);AppDialogs.builder(this).setTitle(titles[index]).setItems(new String[]{"置于首位","上移一位","下移一位"},(action,choice)->{
                int destination=choice==0?0:choice==1?Math.max(0,index-1):Math.min(ids.size()-1,index+1);ids.remove(index);ids.add(destination,id);draft.put(StatusBarIconOrderPolicy.ORDER,String.join(",",ids));changed();chooseHintPriority();
            }).setNegativeButton("取消",null).show();
        }).setNegativeButton("完成",null).show();
    }
    private void bluetoothSection(){
        LinearLayout style=ui.parameterInputGroup();addFeatureBlock(content,style);
        style.addView(ui.featureTitle("蓝牙图标样式","连接设备电量跟随系统更新；未上报电量时仅显示蓝牙符号。仅调整位置和大小模式下保留原厂样式。"));
        Spinner styles=ui.choiceSpinner("蓝牙图标样式",
                index->index==0?"保留系统蓝牙图标":"样式示例 · 电量 80%",
                index->iconStylePreview("bluetooth",index));
        styles.setContentDescription("蓝牙图标样式");
        styles.setAdapter(choiceAdapter(new String[]{"原厂","小米 · 胶囊电量","圆环 · 电量百分比"}));
        styles.setSelection(number(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE));style.addView(styles);
        styles.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                if(!loading&&number(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE)!=position){
                    draft.put(ConfigSchema.STATUSBAR_BLUETOOTH_STYLE,String.valueOf(position));changed();
                }
            }
        });
    }

    private void vpnSection(){
        LinearLayout style=ui.parameterInputGroup();addFeatureBlock(content,style);
        style.addView(ui.featureTitle("VPN图标样式","圆环样式与蓝牙圆环共用矢量绘制，跟随系统状态栏颜色切换；仅在系统显示 VPN 图标时替换。已导入的 VPN 素材优先显示；要使用圆环，请先在素材与字体的 VPN 设置中清除已绑定的素材并应用，素材文件会保留。仅调整位置和大小模式下保留原厂样式。"));
        Spinner styles=ui.choiceSpinner("VPN图标样式",null,index->iconStylePreview("vpn",index));
        styles.setContentDescription("VPN图标样式");
        styles.setAdapter(choiceAdapter(new String[]{"原厂","圆环样式"}));
        styles.setSelection(number(ConfigSchema.STATUSBAR_VPN_STYLE));style.addView(styles);
        styles.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                if(!loading&&number(ConfigSchema.STATUSBAR_VPN_STYLE)!=position){
                    draft.put(ConfigSchema.STATUSBAR_VPN_STYLE,String.valueOf(position));changed();
                }
            }
        });
    }

    private View iconStylePreview(String icon,int selected){
        View sample=new View(this){
            private final BluetoothIconPainter bluetooth=new BluetoothIconPainter();
            private final VpnIconPainter vpn=new VpnIconPainter(StatusBarEditorController.this);
            private final StatusBarIconSamples nativeSample=new StatusBarIconSamples();
            @Override protected void onMeasure(int widthSpec,int heightSpec){
                super.onMeasure(widthSpec,View.MeasureSpec.makeMeasureSpec(ui.dp(36),View.MeasureSpec.EXACTLY));
            }

            // Bounded settings preview builds a coherent layout/hit-test snapshot on redraw; retained allocation tradeoff, not a hot SystemUI hook.
            //noinspection DrawAllocation
            @Override protected void onDraw(Canvas canvas){
                super.onDraw(canvas);float height=ui.dp(28),top=(getHeight()-height)/2f;
                if(selected==0)nativeSample.draw(canvas,icon,"default",new android.graphics.RectF(0,top,height,top+height),ui.text);
                else if(icon.equals("bluetooth"))bluetooth.draw(canvas,0,top,Math.min(getWidth(),ui.dp(112)),height,selected,80,ui.text);
                else vpn.draw(canvas,0,top,height,height,ui.dark?Color.WHITE:Color.BLACK);
            }
        };
        String title=icon.equals("bluetooth")?"蓝牙图标样式":"VPN图标样式";
        sample.setTag("icon-style-preview:"+title+":"+selected);
        String label=icon.equals("bluetooth")
                ?new String[]{"原厂","小米 · 胶囊电量","圆环 · 电量百分比"}[selected]
                :new String[]{"原厂","圆环样式"}[selected];
        sample.setContentDescription(title+"，"+label+"示例"+(icon.equals("bluetooth")&&selected>0?"，设备电量 80%":""));
        return sample;
    }

    private Map<String,String> snapshot(){Map<String,String> result=new LinkedHashMap<>();for(Map.Entry<String,String> entry:draft.entrySet())result.put(entry.getKey(),entry.getValue());return result;}
    private void syncDraftUi(){
        grid=editorGrid();
        loading=true;masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));loading=false;render(true);
    }
    private void arrangeLayout(){
        if(previewBackup!=null){Toast.makeText(this,"请先使用或取消当前预设预览",Toast.LENGTH_SHORT).show();return;}
        lastLayoutBackup=snapshot();grid=StatusBarPresets.arrange(grid);
        draft.put(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP,"2");
        changed();renderKeepingScroll();Toast.makeText(this,"已整理位置并设置安全行距，可恢复整理前配置",Toast.LENGTH_SHORT).show();
    }
    private void choosePreset(){
        if(previewBackup!=null){Toast.makeText(this,"请先使用或取消当前预设预览",Toast.LENGTH_SHORT).show();return;}
        ui.choiceDialog("选择预设 · 先预览再应用",StatusBarPresets.NAMES,StatusBarPresets.DESCRIPTIONS,index->{
            save();main.removeCallbacks(autoSave);previewBackup=snapshot();presetName=StatusBarPresets.NAMES[index];
            StatusBarPresetPreview.preview(draft,StatusBarPresets.values(index));
            syncDraftUi();
        });
    }
    private void confirmPreset(){
        if(previewBackup==null)return;
        Map<String,String> candidate=snapshot();lastLayoutBackup=new LinkedHashMap<>(previewBackup);
        StatusBarPresetPreview.restore(draft,previewBackup);
        previewBackup=null;rawInputs.clear();
        for(Map.Entry<String,String> entry:candidate.entrySet())draft.put(entry.getKey(),entry.getValue());
        syncDraftUi();changed();Toast.makeText(this,"已使用“"+presetName+"”，可恢复方案前配置",Toast.LENGTH_SHORT).show();
    }
    private void cancelPreset(){
        if(previewBackup==null)return;
        StatusBarPresetPreview.restore(draft,previewBackup);
        previewBackup=null;syncDraftUi();
    }
    private void restoreLayout(){
        if(lastLayoutBackup==null||previewBackup!=null)return;
        ui.glassDialog("恢复方案前配置","恢复到最近一次整理、预设或整体重置前的状态栏编辑器配置，包括之后的手动调整。","恢复",()->{
            Map<String,String> previous=lastLayoutBackup;lastLayoutBackup=null;rawInputs.clear();
            for(Map.Entry<String,String> entry:previous.entrySet())draft.put(entry.getKey(),entry.getValue());
            syncDraftUi();changed();
        },"取消");
    }
    private void advanced(LinearLayout parent,String id,String title,View settings){
        settings.setPadding(ui.dp(12),0,0,0);
        LinearLayout group=ui.foldingSection(title,settings,Boolean.TRUE.equals(advancedExpanded.get(id)));
        advancedViews.put(id,settings);addFeatureBlock(parent,group);
        if(workspace())ui.setGroupExpanded(title,Boolean.TRUE.equals(advancedExpanded.get(id)));
    }
    private void addFeatureBlock(LinearLayout parent,View block){
        if(parent.getChildCount()>0)parent.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        parent.addView(block,ui.wrap());
    }
    void selectComponent(String id){
        if(!StatusBarPages.componentRoute(id).equals(route)){openComponent(id);return;}
        revealComponent(id);
    }
    private void revealComponent(String id){
        selectedComponent=id;
        UiKit.Fold fold=componentFolds.get(id);if(fold!=null)fold.show(true);
        if(id.equals("battery")&&connectivityFold!=null)connectivityFold.show(true);
        if(id.equals("battery")&&nativeBatteryFold!=null)nativeBatteryFold.show(true);
        View target=componentViews.get(id);
        if(target!=null)configScroll.post(()->{android.graphics.Rect r=new android.graphics.Rect();target.getDrawingRect(r);content.offsetDescendantRectToMyCoords(target,r);configScroll.smoothScrollTo(0,r.top);});
        preview.invalidate();
    }

    private void connectivitySection(){
        LinearLayout card=ui.card();card.setPadding(0,0,0,0);
        toggle(card,ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"三合一图形图标");
        Switch control=controls.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        if(connectivityGroup()){
            LinearLayout root=content;content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
            LinearLayout settings=component("battery","三合一图标配置");content.removeView(settings);content=root;
            while(settings.getChildCount()>0){View child=settings.getChildAt(0);settings.removeViewAt(0);body.addView(child);}
        }
        card.addView(body,ui.wrap());addFeatureBlock(content,card);
        if(connectivityGroup())componentViews.put("battery",card);
        connectivityFold=ui.fold(control,body);connectivityFold.show(connectivityExpanded);
        control.setOnCheckedChangeListener((button,on)->{if(!loading)setBatteryMode(true,on);});
    }

    private void nativeBatterySection(){
        LinearLayout card=ui.card(),body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(0,0,0,0);
        boolean active=positionSizeOnly()||nativeBatteryEnabled();
        Switch control=new Switch(this);control.setChecked(active);
        String description=positionSizeOnly()
                ?"仅调整位置和大小模式下使用原生外观，三合一暂时停止显示，已选功能及其配置保留。关闭此模式后可继续切换电池功能。"
                :"开启时自动关闭三合一，可展开设置电池的位置、大小、样式、百分号、固定宽度和不透明度。关闭时不会开启三合一。两项都关闭时恢复默认电池外观与布局，并跟随状态栏整体布局；两边配置均保留。";
        card.addView(ui.featureRow("原生电池图标",description,control),ui.wrap());card.addView(body,ui.wrap());
        if(active){
            LinearLayout root=content;content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
            LinearLayout settings=component("battery","显示电池图标");content.removeView(settings);content=root;
            // Keep the existing visibility and layout controls inside one outer card.
            while(settings.getChildCount()>0){View child=settings.getChildAt(0);settings.removeViewAt(0);body.addView(child);}
            related("battery",body);
            componentViews.put("battery",card);
        }
        addFeatureBlock(content,card);
        nativeBatteryFold=ui.fold(control,body);nativeBatteryFold.show(nativeBatteryExpanded);
        if(positionSizeOnly()){
            // This mode temporarily forces native icons without overwriting the saved choice.
            control.setClickable(false);control.setFocusable(false);control.setAlpha(.5f);
        }else control.setOnCheckedChangeListener((button,on)->{if(!loading)setBatteryMode(false,on);});
    }

    private boolean nativeBatteryEnabled(){
        return !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))
                &&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED));
    }
    private void setBatteryMode(boolean threeInOne,boolean enabled){
        boolean circle=ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP));
        boolean nativeIcon=nativeBatteryEnabled();
        if(threeInOne){circle=enabled;if(enabled){nativeIcon=false;draft.put(SystemUiOptions.SIGNAL_DUAL,"0");}}
        else{nativeIcon=enabled;if(enabled)circle=false;}
        draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,circle?"1":"0");
        draft.put(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,nativeIcon?"1":"0");
        changed();renderKeepingScroll();
        UiKit.Fold active=threeInOne?connectivityFold:nativeBatteryFold;
        if(active!=null)active.show(enabled);
    }

    private void batteryAppearanceChoices(LinearLayout parent){
        LinearLayout group=parameterInputGroup(parent);
        for(String key:new String[]{SystemUiOptions.BATTERY_PRESET,SystemUiOptions.PREFIX+"battery_style"}){
            EnhancementOption option=null;
            for(EnhancementOption candidate:SystemUiOptions.options())if(candidate.key.equals(key)){option=candidate;break;}
            if(option==null)continue;
            group.addView(ui.featureTitle(option.title,option.summary));
            Spinner choice=ui.choiceSpinner(option.title);
            choice.setContentDescription(option.title);choice.setTag("config:"+key);
            choice.setAdapter(choiceAdapter(option.choices));choice.setSelection(number(key));group.addView(choice,ui.wrap());
            choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> owner){}
                public void onItemSelected(AdapterView<?> owner,View view,int selected,long row){
                    if(!loading&&selected!=number(key)){draft.put(key,String.valueOf(selected));changed();}
                }
            });
        }
    }

    private void dualAppearanceSection(LinearLayout parent,String title){
        LinearLayout section=new LinearLayout(this);section.setOrientation(LinearLayout.VERTICAL);
        toggle(section,SystemUiOptions.SIGNAL_DUAL,title);
        Switch control=controls.get(SystemUiOptions.SIGNAL_DUAL);control.setTag("config:"+SystemUiOptions.SIGNAL_DUAL);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(ui.dp(12),0,0,0);
        LinearLayout fields=parameterInputGroup(body);
        fields.addView(ui.featureTitle("信号样式",FeatureDescriptions.forKey(SystemUiOptions.SIGNAL_DUAL_STYLE,"信号样式")));
        Spinner choice=ui.choiceSpinner("信号样式");choice.setContentDescription("信号样式");choice.setTag("config:"+SystemUiOptions.SIGNAL_DUAL_STYLE);
        choice.setAdapter(choiceAdapter(new String[]{"荣耀双排","iOS双排"}));choice.setSelection(number(SystemUiOptions.SIGNAL_DUAL_STYLE));fields.addView(choice,ui.wrap());
        choice.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> owner){}
            public void onItemSelected(AdapterView<?> owner,View view,int selected,long row){
                if(!loading&&selected!=number(SystemUiOptions.SIGNAL_DUAL_STYLE)){draft.put(SystemUiOptions.SIGNAL_DUAL_STYLE,String.valueOf(selected));changed();}
            }
        });
        section.addView(body,ui.wrap());addFeatureBlock(parent,section);
        dualAppearanceFold=ui.fold(control,body);dualAppearanceFold.show(dualAppearanceExpanded);
    }

    private IosBatteryDrawable previewIosBattery(){
        int display=number(SystemUiOptions.PREFIX+"battery_style");
        boolean dark=Color.red(ui.text)*.299f+Color.green(ui.text)*.587f+Color.blue(ui.text)*.114f<128;
        String asset=IosBatteryPolicy.asset(IosBatteryPolicy.containsDigits(display,1),exampleCharging,false,false,dark);
        if(!asset.equals(previewBatteryAsset)){
            IosBatteryAssets.Sheet sheet=IosBatteryAssets.cached(asset);
            if(sheet!=null){previewBatteryAsset=asset;previewBatteryArtwork=new IosBatteryDrawable(sheet,exampleBattery,getResources().getDisplayMetrics().density);}
            else if(!asset.equals(previewBatteryRequested)){
                previewBatteryRequested=asset;
                java.lang.ref.WeakReference<StatusBarEditorController> reference=new java.lang.ref.WeakReference<>(this);
                IosBatteryAssets.request(this,asset,loaded->{StatusBarEditorController owner=reference.get();
                    if(owner!=null&&!owner.isDestroyed()&&loaded!=null&&asset.equals(owner.previewBatteryRequested)){
                        owner.previewBatteryAsset=asset;owner.previewBatteryArtwork=new IosBatteryDrawable(loaded,owner.exampleBattery,owner.getResources().getDisplayMetrics().density);
                        if(owner.preview!=null)owner.preview.invalidate();
                    }});
            }
        }
        if(previewBatteryArtwork!=null)previewBatteryArtwork.updateLevel(exampleBattery);
        return previewBatteryArtwork;
    }

    private LinearLayout component(String id, String title) {
        LinearLayout card = ui.card();
        card.setPadding(0,0,0,0);addFeatureBlock(content,card);componentViews.put(id,card);
        LinearLayout outer=card;
        StatusBarGridSpec.Item item = grid.get(id);
        boolean circle=id.equals("battery")&&connectivityGroup();
        if(circle){
            LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(ui.dp(12),0,0,0);
            card.addView(body,ui.wrap());card=body;
        }
        else if(positionSizeOnly())card.addView(ui.featureTitle(title,"保留原生显示状态、行数、字体和图标样式，仅调整整组的位置、大小和顺序。"));
        else{
            String description=id.equals("battery")&&connectivityGroup()?FeatureDescriptions.forKey(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,title):FeatureDescriptions.statusComponent(id,title);
            Switch visible = new Switch(this);visible.setChecked(itemVisible(id,item));card.addView(ui.featureRow(title,description,visible));
            LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
            body.setPadding(ui.dp(12),0,0,0);
            card.addView(body);UiKit.Fold fold=ui.fold(visible,body);
            componentFolds.put(id,fold);fold.show(Boolean.TRUE.equals(expandedComponents.get(id)));
            card=body;
            visible.setOnCheckedChangeListener((button, checked) -> {fold.sync();updateItem(id,null,-1,-1,checked);});
        }
        if(!positionSizeOnly()&&id.equals("notifications")){
            if(!singleRow())toggle(card,ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"通知图标分两排");
            toggle(card,ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED,"通知图标数量解限");
            LinearLayout root=content;content=card;
            number(ConfigSchema.STATUSBAR_NOTIFICATION_MAX,"最多显示通知数（0 跟随系统）",0,20);content=root;
            if(ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NOTIFICATION_UNLIMITED)))card.addView(ui.text("数量解限已开启，数量设置保留但暂不参与限制；超出可用空间时仍显示溢出提示。",12,ui.muted,false),ui.wrap());
        }
        if(!positionSizeOnly()&&!singleRow()&&id.equals("system_icons"))toggle(card,ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"系统图标分两排");
        if(!positionSizeOnly()&&id.equals("network")){
            nativeNetworkSize(card);
            LinearLayout display=parameterInputGroup(card);
            display.addView(ui.featureTitle("显示方式", "选择网速显示的上下行组合和排数。上下行同时显示为双排时，会共用该区域的上下两排。"));
            Spinner mode=ui.choiceSpinner("网速显示方式");
            mode.setAdapter(choiceAdapter(singleRow()?java.util.Arrays.copyOf(StatusBarNetworkDisplay.LABELS,3):StatusBarNetworkDisplay.LABELS));
            mode.setSelection(networkMode()-1);display.addView(mode,ui.wrap());
            mode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> parent){}
                public void onItemSelected(AdapterView<?> parent,View view,int position,long rowId){
                    if(loading||position+1==networkMode())return;
                    draft.put(ConfigSchema.STATUSBAR_NETWORK_DISPLAY,String.valueOf(position+1));
                    draft.put(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS,position==3?"1":"0");
                    changed();renderKeepingScroll();
                }
            });
            edit(card,ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK,"上行标志（留空不显示）",false);
            edit(card,ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK,"下行标志（留空不显示）",false);
        }
        if(!positionSizeOnly()&&!singleRow()&&id.equals("clock")){
            LinearLayout display=parameterInputGroup(card);
            display.addView(ui.featureTitle("显示排数", "选择时钟使用一排还是上下两排。双排文字需要同时设置第二行格式。"));Spinner rows=ui.choiceSpinner("选择选项");rows.setContentDescription("时钟显示排数");
            rows.setAdapter(choiceAdapter(new String[]{"单排","双排"}));rows.setSelection(number(ConfigSchema.STATUSBAR_CLOCK_ROWS)-1);display.addView(rows);
            rows.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int pos,long rowId){if(!loading&&number(ConfigSchema.STATUSBAR_CLOCK_ROWS)!=pos+1){draft.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,""+(pos+1));changed();renderKeepingScroll();}}});
        }
        if(circle)slider(card,"圆形组件大小（dp）",number(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE),18,40,value->{draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,""+value);changed();});
        else {
            if(StatusBarGridSpec.nativeComponent(id)){
                Switch nativeSize=new Switch(this);nativeSize.setChecked(item.size==0);
                card.addView(ui.featureRow("跟随原生大小","保留本机原厂字号与图标尺寸；关闭后使用下方指定大小。",nativeSize),ui.wrap());
                nativeSize.setOnCheckedChangeListener((button,on)->{if(!loading){updateItem(id,null,-1,on?0:13,null);renderKeepingScroll();}});
            }
            if(item.size!=0)slider(card, "大小（dp）", item.size, 6, 32, value -> updateItem(id, null, -1, value, null));
        }
        if(circle){LinearLayout internal=new LinearLayout(this);internal.setOrientation(LinearLayout.VERTICAL);connectivityControls(internal);advanced(card,"connectivity-internal","高级设置：三合一图标",internal);}
        if(!positionSizeOnly()&&precisionKey(id)!=null){LinearLayout detail=new LinearLayout(this);detail.setOrientation(LinearLayout.VERTICAL);precision(detail,id);advanced(card,"precision-"+id,"高级：小数精度",detail);}
        if(!positionSizeOnly()&&id.equals("clock"))clockConfiguration(card);
        return outer;
    }
    private java.util.List<String> regionItems(String id){
        java.util.List<String> ids=new java.util.ArrayList<>();
        for(String candidate:StatusBarGridSpec.IDS)if(grid.get(candidate).zone.charAt(0)==grid.get(id).zone.charAt(0)
                &&(candidate.equals(id)||itemVisible(candidate,grid.get(candidate))))ids.add(candidate);
        ids.sort(java.util.Comparator.comparingInt(candidate->grid.get(candidate).order));return ids;
    }
    private String componentName(String id){int i=java.util.Arrays.asList(StatusBarGridSpec.IDS).indexOf(id);return id.equals("battery")&&connectivityGroup()?"三合一":StatusBarGridSpec.LABELS[i];}
    private void addSpacedButton(LinearLayout row,Button button){
        LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(0,ui.dp(44),1);
        if(row.getChildCount()>0)params.setMarginStart(ui.dp(8));
        row.addView(button,params);
    }
    private void applyOrder(java.util.List<String> ids){
        for(int i=0;i<ids.size();i++){String key=ids.get(i);StatusBarGridSpec.Item item=grid.get(key);grid=grid.with(key,new StatusBarGridSpec.Item(item.zone,i*10,item.size,item.visible));}
        changed();renderKeepingScroll();
    }
    private void dragOrder(String id){
        java.util.List<String> ids=regionItems(id);LinearLayout list=new LinearLayout(this);list.setOrientation(LinearLayout.VERTICAL);
        Runnable[] rebuild=new Runnable[1];rebuild[0]=()->{
            list.removeAllViews();list.addView(ui.text("长按组件拖动，或使用上下按钮调整；确认后应用。",12,ui.muted,false));
            for(String item:ids){
                LinearLayout itemRow=new LinearLayout(this);itemRow.setGravity(Gravity.CENTER_VERTICAL);
                Button row=ui.tonalButton(componentName(item));row.setContentDescription("拖动排序："+componentName(item));itemRow.addView(row,new LinearLayout.LayoutParams(0,-2,1));
                for(int direction:new int[]{-1,1}){Button move=ui.tonalButton(direction<0?"↑":"↓");move.setContentDescription(componentName(item)+(direction<0?"前移":"后移"));move.setMinWidth(0);move.setMinimumWidth(0);move.setPadding(0,0,0,0);int destination=ids.indexOf(item)+direction;move.setEnabled(destination>=0&&destination<ids.size());move.setOnClickListener(v->{java.util.Collections.swap(ids,ids.indexOf(item),ids.indexOf(item)+direction);rebuild[0].run();});itemRow.addView(move,new LinearLayout.LayoutParams(ui.dp(44),ui.dp(44)));}
                list.addView(itemRow,ui.margins(0,8,0,0));
                // Local state is sufficient; a text payload opens the ROM's
                // transfer sidebar even though this drag stays in the dialog.
                row.setOnLongClickListener(v->v.startDragAndDrop(null,new View.DragShadowBuilder(v),item,0));
                row.setOnDragListener((v,event)->{
                    if(!(event.getLocalState() instanceof String)||!ids.contains((String)event.getLocalState()))return false;
                    if(event.getAction()==android.view.DragEvent.ACTION_DRAG_ENTERED)v.setAlpha(.5f);
                    if(event.getAction()==android.view.DragEvent.ACTION_DRAG_EXITED||event.getAction()==android.view.DragEvent.ACTION_DRAG_ENDED)v.setAlpha(1f);
                    if(event.getAction()==android.view.DragEvent.ACTION_DROP){String source=(String)event.getLocalState();int target=ids.indexOf(item);ids.remove(source);ids.add(Math.min(target,ids.size()),source);list.post(rebuild[0]);}
                    return true;
                });
            }
        };rebuild[0].run();ui.glassDialog("调整同侧显示顺序",list,"应用顺序",()->applyOrder(ids),"取消");
    }
    private void clockConfiguration(LinearLayout parent){
        toggle(parent,ConfigSchema.STATUSBAR_CLOCK_CUSTOM,"自定义时钟文字");
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);parent.addView(body);
        sectionFold=ui.fold(controls.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM),body);
        componentFolds.put("clock-custom",sectionFold);sectionFold.show(Boolean.TRUE.equals(expandedComponents.get("clock-custom")));
        LinearLayout formats=new LinearLayout(this);formats.setOrientation(LinearLayout.VERTICAL);
        edit(formats,ConfigSchema.STATUSBAR_CLOCK_PATTERN,"第一行格式，例如 HH:mm",false);
        if(!singleRow()&&number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==2)edit(formats,ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,"第二行格式，例如 MM/dd E",false);
        Button formatHelp=ui.button("查看完整时间格式与示例");
        formatHelp.setOnClickListener(v->ui.showFeatureHelp("时间格式说明",StatusBarClockFormatHelp.text()));
        formats.addView(formatHelp,ui.wrap());
        advanced(body,"clock-format","高级：自定义时间格式",formats);
        toggle(body,ConfigSchema.STATUSBAR_CLOCK_24H,"默认使用 24 小时制");
        toggle(body,ConfigSchema.STATUSBAR_CLOCK_SECONDS,"默认显示秒");
        toggle(body,ConfigSchema.STATUSBAR_CLOCK_PERIOD,"默认显示时段");
        toggle(body,ConfigSchema.STATUSBAR_CLOCK_WEEK,"默认显示星期");
        clockTypography(body);
    }
    private void nativeNetworkSize(LinearLayout parent){
        slider(parent,"原生网速字号（0 跟随系统图标）",number(ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP),0,32,
                value->{draft.put(ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP,String.valueOf(value));changed();});
    }
    private LinearLayout parameterInputGroup(LinearLayout parent){
        LinearLayout group=ui.parameterInputGroup(workspace());parent.addView(group,ui.wrap());return group;
    }
    private void updateItem(String id, String zone, int order, int size, Boolean visible) {
        if (loading) return;
        if (id.equals("notifications") && visible != null)
            draft.put(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE, visible ? "0" : "1");
        if (id.equals("clock") && size >= 0 && !positionSizeOnly()) {
            draft.put(ConfigSchema.STATUSBAR_CLOCK_SIZE_SP, "0");
            if(clockSizeInput!=null)clockSizeInput.setValue("0");
        }
        StatusBarGridSpec.Item old = grid.get(id);
        grid = grid.with(id, new StatusBarGridSpec.Item(zone == null ? old.zone : zone,
                order < 0 ? old.order : order, size < 0 ? old.size : size, visible == null ? old.visible : visible));
        changed();
    }
    private boolean itemVisible(String id, StatusBarGridSpec.Item item) {
        if(id.equals("battery")&&connectivityGroup())return true;
        if(positionSizeOnly())return id.equals("clock")||id.equals("notifications")||id.equals("system_icons")||id.equals("battery");
        return item.visible && (!id.equals("notifications")
                || !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE)));
    }
    private void toggle(String key, String label) {
        toggle(content,key,label);
    }
    private void renderKeepingScroll(){int y=configScroll.getScrollY();render(true);configScroll.post(()->configScroll.scrollTo(0,y));}
    private LinearLayout toggle(LinearLayout parent,String key, String label) {
        Switch s = new Switch(this);s.setChecked(ConfigSchema.truthy(draft.get(key)));controls.put(key,s);
        LinearLayout row=ui.featureRow(label,FeatureDescriptions.forKey(key,label),s);addFeatureBlock(parent,row);
        s.setOnCheckedChangeListener((b, checked) -> { if (!loading) {
            if(SystemUiOptions.SIGNAL_DUAL.equals(key)&&checked&&signalEnableBlocked()){
                loading=true;s.setChecked(false);loading=false;
                refreshStoredSignalModes();
                Toast.makeText(this,"请先关闭三合一图标",Toast.LENGTH_LONG).show();return;
            }
            draft.put(key, checked ? "1" : "0");
            if(ConfigSchema.STATUSBAR_CLOCK_CUSTOM.equals(key)&&checked){
                draft.put(ConfigSchema.SYSTEMUI_MASTER,"1");
                boolean wasLoading=loading;loading=true;
                try{masterControl.setChecked(true);}finally{loading=wasLoading;}
            }
            changed();
            if(key.equals(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)||key.equals(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS)||key.equals(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)||key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)||key.equals(SystemUiOptions.PREFIX+"metrics_custom"))renderKeepingScroll();
        } });
        return row;
    }
    private boolean signalEnableBlocked(){
        return ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))
                ||(!draft.unsaved().containsKey(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)
                &&config.getBoolean(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP));
    }
    private void refreshStoredSignalModes(){
        if(config==null||preview==null||isDestroyed()||previewBackup!=null)return;
        boolean refreshed=draft.refresh(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,config.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP));
        refreshed|=draft.refresh(SystemUiOptions.SIGNAL_DUAL,config.get(SystemUiOptions.SIGNAL_DUAL));
        refreshed|=draft.refresh(SystemUiOptions.SIGNAL_DUAL_STYLE,config.get(SystemUiOptions.SIGNAL_DUAL_STYLE));
        if(refreshed)renderKeepingScroll();else preview.invalidate();
    }
    private void edit(String key, String label) {
        edit(content,key,label,false);
    }
    private EditText edit(LinearLayout parent,String key,String label,boolean numeric) {
        parent=parameterInputGroup(parent);
        parent.addView(ui.featureTitle(label, FeatureDescriptions.forKey(key,label)));
        EditText e = new EditText(this);ui.styleInput(e); e.setSingleLine(true);e.setContentDescription(label);
        if(numeric)e.setInputType(android.text.InputType.TYPE_CLASS_NUMBER|android.text.InputType.TYPE_NUMBER_FLAG_DECIMAL|android.text.InputType.TYPE_NUMBER_FLAG_SIGNED);
        e.setText(rawInputs.containsKey(key)?rawInputs.get(key):draft.get(key));
        EnhancementOption colorOption=null;
        for(EnhancementOption candidate:EnhancementCatalog.options())if(candidate.key.equals(key)){colorOption=candidate;break;}
        boolean color=colorOption!=null&&colorOption.kind==EnhancementOption.Kind.COLOR
                ||draft.get(key)!=null&&draft.get(key).matches("#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?");
        parent.addView(color?ui.colorInput(e,label):e);
        e.setError(validInput(key,e.getText().toString())==null?"格式或数值无效，已保留上次有效值":null);
        e.addTextChangedListener(new android.text.TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int c, int n) { }
            public void onTextChanged(CharSequence s, int a, int b, int c) { if (!loading) {
                rawInputs.put(key,s.toString());String valid=validInput(key,s.toString());
                e.setError(valid==null?"格式或数值无效，已保留上次有效值":null);
                if(valid!=null){draft.put(key,valid);changed();}
            } }
            public void afterTextChanged(android.text.Editable e) { }
        });
        return e;
    }
    private String validInput(String key,String value){
        String normalized=ConfigSchema.normalize(key,value);if(normalized==null)return null;
        if(key.equals(ConfigSchema.STATUSBAR_CLOCK_PATTERN)||key.equals(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND)){
            if(!ls.augment.com.hook.StatusBarClockFormatter.formatDetailed(System.currentTimeMillis(),java.util.Locale.getDefault(),true,false,false,false,normalized,"").valid)return null;
        }
        return normalized;
    }
    private void clockTypography(LinearLayout parent){
        LinearLayout font=new LinearLayout(this);font.setOrientation(LinearLayout.VERTICAL);
        edit(font,ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY,"字体名称（sans-serif / serif / monospace）",false);
        clockSizeInput=editNumber(font,ConfigSchema.STATUSBAR_CLOCK_SIZE_SP,"单独字号 sp（0 使用上方大小）");
        font.addView(ui.text("单独字号大于 0 时优先使用；拖动上方大小会重新跟随布局。空间不足时可减小字号或调整组件位置。",11,ui.muted,false));
        editNumber(font,ConfigSchema.STATUSBAR_CLOCK_WEIGHT,"字重（100–900）");
        editNumber(font,ConfigSchema.STATUSBAR_CLOCK_LETTER_SPACING,"字间距（-0.20 至 1.00）");
        font.addView(ui.text("双排时钟与硬件信息使用同一排对齐；两排间距统一在布局分类中调整。",11,ui.muted,false));
        editNumber(font,ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,"固定宽度 dp（0 自动）");
        LinearLayout alignment=parameterInputGroup(font);
        alignment.addView(ui.featureTitle("文字对齐",FeatureDescriptions.forKey(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN,"文字对齐")));
        Spinner align=ui.choiceSpinner("选择选项");align.setContentDescription("文字对齐");
        String[] values={"left","center","right"};
        align.setAdapter(choiceAdapter(new String[]{"靠左","居中","靠右"}));
        align.setSelection(java.util.Arrays.asList(values).indexOf(draft.get(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN)));
        align.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long rowId){
                if(!loading&&!values[position].equals(draft.get(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN))){draft.put(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN,values[position]);changed();}
            }
        });
        alignment.addView(align);
        advanced(parent,"clock-typography","高级：字体与排版",font);
    }
    private ParameterSlider editNumber(LinearLayout parent,String key,String label){
        parent=parameterInputGroup(parent);
        View title=ui.featureTitle(label,FeatureDescriptions.forKey(key,label));parent.addView(title);
        ParameterSlider slider=new ParameterSlider(ui,ConfigSchema.numericOption(key,label),draft.get(key),next->{
            if(loading)return;String normalized=validInput(key,next);
            if(normalized!=null){rawInputs.remove(key);draft.put(key,normalized);changed();}
        });
        slider.bindTitle(title);parent.addView(slider);return slider;
    }
    private static String precisionKey(String id){
        switch(id){
            case "cpu":return ConfigSchema.STATUSBAR_CPU_DECIMALS;
            case "gpu":return ConfigSchema.STATUSBAR_GPU_DECIMALS;
            case "battery_temp":return ConfigSchema.STATUSBAR_BATTERY_TEMP_DECIMALS;
            case "current":return ConfigSchema.STATUSBAR_CURRENT_DECIMALS;
            case "power":return ConfigSchema.STATUSBAR_POWER_DECIMALS;
            default:return null;
        }
    }
    private void precision(LinearLayout parent,String id){
        parent=parameterInputGroup(parent);
        String key=precisionKey(id);if(key==null)return;
        parent.addView(ui.featureTitle("保留小数位数",FeatureDescriptions.forKey(key,"保留小数位数")));
        Spinner digits=ui.choiceSpinner("选择选项");digits.setContentDescription("保留小数位数");
        digits.setAdapter(choiceAdapter(new String[]{"0 位（整数）","1 位小数","2 位小数","3 位小数"}));
        digits.setSelection(number(key));parent.addView(digits);
        digits.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long rowId){
                if(!loading&&number(key)!=position){draft.put(key,String.valueOf(position));changed();}
            }
        });
    }
    private String metricPreview(String id){
        double value=id.equals("cpu")?37.25:id.equals("gpu")?36.125:id.equals("battery_temp")?33.5:id.equals("current")?600.25:2.401;
        String prefix=id.equals("cpu")?"C:":id.equals("gpu")?"G:":id.equals("battery_temp")?"B:":id.equals("current")?"I:":"P:";
        String unit=id.equals("current")?"mA":id.equals("power")?"W":"°";
        // Related advanced controls own these preferences outside this editor's draft.
        if(ConfigSchema.truthy(config.get(SystemUiOptions.PREFIX+"metrics_custom"))){
            String customPrefix=config.get(SystemUiOptions.PREFIX+"metric_prefix_"+id);
            if(customPrefix!=null&&!"null".equals(customPrefix))prefix=customPrefix;
        }
        if(ConfigSchema.truthy(draft.get(SystemUiOptions.PREFIX+"metrics_hide_units")))unit="";
        return prefix+ls.augment.com.hook.StatusBarMetricsFormatter.number(value,number(precisionKey(id)))+unit;
    }
    private interface ValueChanged { void set(int value); }
    private void number(String key, String label, int min, int max) {
        int value; try { value = Integer.parseInt(draft.get(key)); } catch (Exception e) { value = min; }
        slider(content, label, value, min, max, v -> { draft.put(key, String.valueOf(v)); changed(); });
    }
    private void slider(LinearLayout parent, String label, int value, int min, int max, ValueChanged changed) {
        parent=parameterInputGroup(parent);
        View numericTitle=ui.featureTitle(label,FeatureDescriptions.layoutValue(label)+" 可选范围："+min+"–"+max+"。");
        parent.addView(numericTitle);
        TextView text = ui.text("当前：" + value, 12, ui.muted, false); parent.addView(text);
        SeekBar bar = ui.slider(); bar.setContentDescription(label); bar.setMax(max - min); bar.setProgress(value - min); parent.addView(bar,ui.wrap());
        NumericParameterEditor.linear(ui,bar,label,min,1,"",numericTitle,text);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar b, int p, boolean fromUser) {
                text.setText(text.getContext().getString(R.string.status_featureeditorcontroller_18 ,String.valueOf((p + min)))); if (fromUser && !loading) changed.set(p + min);
            }
            public void onStartTrackingTouch(SeekBar b) { }
            public void onStopTrackingTouch(SeekBar b) { }
        });
    }
    private ArrayAdapter<String> choiceAdapter(String[] labels) {
        return new ArrayAdapter<String>(this,android.R.layout.simple_spinner_dropdown_item,labels) {
            @Override public View getView(int position,View convertView,android.view.ViewGroup parent){
                View view=super.getView(position,convertView,parent);if(view instanceof TextView){((TextView)view).setTextSize(12.5f);((TextView)view).setTextColor(ui.text);}return view;
            }
            @Override public View getDropDownView(int position,View convertView,android.view.ViewGroup parent){
                View view=super.getDropDownView(position,convertView,parent);if(view instanceof TextView)((TextView)view).setTextSize(13);return view;
            }
        };
    }
    private void changed() {
        if(workspaceResetting)return;
        if(masterFold!=null)masterFold.sync();
        if(sectionFold!=null)sectionFold.sync();
        if(connectivityFold!=null)connectivityFold.sync();
        if(nativeBatteryFold!=null)nativeBatteryFold.sync();
        if(dualAppearanceFold!=null)dualAppearanceFold.sync();
        recordExplicitEdits();
        if (preview != null) preview.invalidate();
        refreshRuntimeFeedback();
        if(!loading&&previewBackup==null){dirty=draft.hasPending();main.removeCallbacks(autoSave);main.postDelayed(autoSave,450);}
    }
    private String savedValue(String key){return StatusBarEditPolicy.resolve(config::get).effective(key,config.get(key));}
    private StatusBarGridSpec editorGrid(){return StatusBarEditPolicy.resolve(draft::get).grid(draft.get(ConfigSchema.STATUSBAR_GRID));}
    private void recordExplicitEdits(){
        StatusBarEditPolicy policy=StatusBarEditPolicy.resolve(draft::get);StatusBarGridSpec previous=policy.grid(draft.get(ConfigSchema.STATUSBAR_GRID));boolean gridChanged=false;
        for(String id:StatusBarGridSpec.IDS){StatusBarGridSpec.Item a=previous.get(id),b=grid.get(id);
            if(!a.zone.equals(b.zone)){policy=policy.with(id,"zone",true);gridChanged=true;}
            if(a.order!=b.order){policy=policy.with(id,"order",true);gridChanged=true;}
            if(a.size!=b.size){policy=policy.with(id,"size",b.size!=0);gridChanged=true;}
            if(a.visible!=b.visible){policy=policy.with(id,"visible",b.visible!=StatusBarEditPolicy.nativeGrid().get(id).visible);gridChanged=true;}
        }
        Map<String,String> pending=draft.unsaved();boolean rowsChanged=false;
        for(String id:new String[]{"clock","notifications","system_icons"}){String key=id.equals("clock")?ConfigSchema.STATUSBAR_CLOCK_ROWS:id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS;
            if(pending.containsKey(key)){policy=policy.with(id,"rows",id.equals("clock")?"2".equals(draft.get(key)):ConfigSchema.truthy(draft.get(key)));rowsChanged=true;}}
        if(gridChanged||rowsChanged){draft.put(StatusBarEditPolicy.KEY,policy.serialize());if(gridChanged)draft.put(ConfigSchema.STATUSBAR_GRID,grid.serialize());}
    }
    private void refreshRuntimeFeedback(){if(runtimeFeedback!=null){String message=runtimeMessage();runtimeFeedback.setText(message);runtimeFeedback.setVisibility(message.isEmpty()?View.GONE:View.VISIBLE);}}
    private void save() {
        if (previewBackup!=null||!draft.hasPending()) return;main.removeCallbacks(autoSave);
        if(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER))&&!positionSizeOnly()&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&!previewClock().valid){
            Toast.makeText(this,"时钟格式有误，请检查当前显示排数对应的格式",Toast.LENGTH_LONG).show();return;
        }
        for (Map.Entry<String, String> e : draft.entrySet()) if (ConfigSchema.normalize(e.getKey(), e.getValue()) == null) {
            Toast.makeText(this, "请检查格式或数值", Toast.LENGTH_LONG).show(); return;
        }
        ConfigEditDraft.Batch batch = draft.takePending();
        if(batch.values.isEmpty())return;
        saving=true;dirty=false;
        worker.execute(() -> {
            AppConfig.SaveResult result = config.save(batch.values);
            runOnUiThread(() -> {
                boolean reverted=!result.success&&previewBackup==null
                        &&draft.reconcile(batch,SystemUiOptions.SIGNAL_DUAL,config.get(SystemUiOptions.SIGNAL_DUAL));
                draft.complete(batch,result.success);saving=false;dirty=draft.hasPending();
                if(isDestroyed())return;
                refreshStoredSignalModes();
                if(reverted)renderKeepingScroll();
                if(!result.success)Toast.makeText(this,result.message,Toast.LENGTH_LONG).show();
                if(dirty&&(result.success||"请先关闭三合一图标".equals(result.message)))main.post(autoSave);
            });
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if(previewBackup!=null)cancelPreset();
        Bundle b = new Bundle(); for (Map.Entry<String, String> e : draft.unsaved().entrySet()) b.putString(e.getKey(), e.getValue());
        state.putBundle("draft-edits", b); state.putInt("tab", tab); super.onSaveInstanceState(state);
        state.putBoolean("connectivity-expanded",connectivityFold!=null?connectivityFold.content.getVisibility()==View.VISIBLE:connectivityExpanded);
        state.putBoolean("native-battery-expanded",nativeBatteryFold!=null?nativeBatteryFold.content.getVisibility()==View.VISIBLE:nativeBatteryExpanded);
        state.putBoolean("dual-appearance-expanded",dualAppearanceFold!=null?dualAppearanceFold.content.getVisibility()==View.VISIBLE:dualAppearanceExpanded);
        Bundle raw=new Bundle();for(Map.Entry<String,String> entry:rawInputs.entrySet())raw.putString(entry.getKey(),entry.getValue());state.putBundle("raw-inputs",raw);
        for(Map.Entry<String,UiKit.Fold> entry:componentFolds.entrySet())expandedComponents.put(entry.getKey(),entry.getValue().content.getVisibility()==View.VISIBLE);
        for(Map.Entry<String,View> entry:advancedViews.entrySet())advancedExpanded.put(entry.getKey(),entry.getValue().getVisibility()==View.VISIBLE);
        scrollPositions.put(workspace()?workspaceGroup:tab,configScroll.getScrollY());state.putString("selected-component",selectedComponent);
        if(workspace()){
            state.putInt("workspace-group",workspaceGroup);state.putString("workspace-detail",workspaceDetail);
            state.putString("workspace-scope",workspaceScope);state.putString("workspace-query",workspaceQuery);state.putInt("workspace-filter",workspaceFilter);
            Bundle assets=new Bundle();workspaceAssets.onSaveInstanceState(assets);state.putBundle("workspace-assets",assets);
            state.putBoolean("workspace-preview-hidden",previewHost.getVisibility()!=View.VISIBLE);
        }
        Bundle expanded=new Bundle();for(Map.Entry<String,Boolean> entry:expandedComponents.entrySet())expanded.putBoolean(entry.getKey(),entry.getValue());state.putBundle("expanded-components",expanded);
        Bundle advanced=new Bundle();for(Map.Entry<String,Boolean> entry:advancedExpanded.entrySet())advanced.putBoolean(entry.getKey(),entry.getValue());state.putBundle("advanced-expanded",advanced);
        Bundle positions=new Bundle();for(Map.Entry<Integer,Integer> entry:scrollPositions.entrySet())positions.putInt(String.valueOf(entry.getKey()),entry.getValue());state.putBundle("tab-scroll",positions);
        if(lastLayoutBackup!=null){Bundle undo=new Bundle();for(Map.Entry<String,String> entry:lastLayoutBackup.entrySet())undo.putString(entry.getKey(),entry.getValue());state.putBundle("layout-undo",undo);}
    }
    private void stopInventoryObservation(){if(inventoryObserving){getContentResolver().unregisterContentObserver(inventoryObserver);inventoryObserving=false;}}
    @Override protected void onPause(){stopInventoryObservation();if(previewBackup!=null)cancelPreset();main.removeCallbacks(autoSave);save();super.onPause();}
    @Override public void onDestroy() { main.removeCallbacks(autoSave);save();
        stopInventoryObservation();
        if(workspaceArtwork!=null)workspaceArtwork.close();
        if(previewPreferences!=null)previewPreferences.unregisterOnSharedPreferenceChangeListener(previewPreferenceListener);
        super.onDestroy(); }

    private ls.augment.com.hook.StatusBarClockFormatter.FormatResult previewClock(){
        return ls.augment.com.hook.StatusBarClockFormatter.formatDetailed(System.currentTimeMillis(),java.util.Locale.getDefault(),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_24H)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_SECONDS)),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_PERIOD)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_WEEK)),
                draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN),singleRow()||number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==1?"":draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND));
    }
    private int number(String key){try{return Integer.parseInt(draft.get(key));}catch(Exception ignored){return 0;}}
    private void marginInputs(){String[] labels={"左侧边距（0 原厂）","上侧边距（0 原厂）","右侧边距（0 原厂）","下侧边距（0 原厂）"};for(int i=0;i<StatusBarMargins.KEYS.length;i++)number(StatusBarMargins.KEYS[i],labels[i],StatusBarMargins.MIN_DP,StatusBarMargins.MAX_DP);}
    private org.json.JSONObject previewNativeGeometry(){
        org.json.JSONObject geometry=workspaceInventory.optJSONObject("nativeGeometry");if(geometry==null)return null;
        org.json.JSONObject box=geometry.optJSONObject(workspaceScope.equals("lock")?"lock":"main");
        float widthDp=getResources().getDisplayMetrics().widthPixels/getResources().getDisplayMetrics().density;
        return box!=null&&Math.abs(box.optDouble("width")-widthDp)<2?box:null;
    }
    private float previewMargin(org.json.JSONObject geometry,String side,String key){float density=getResources().getDisplayMetrics().density;return StatusBarMargins.resolve(geometry==null?0:(float)geometry.optDouble(side,0)*density,number(key),density);}
    private boolean positionSizeOnly(){return ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY));}
    private boolean connectivityGroup(){return !positionSizeOnly()&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP));}
    private ConnectivityIconState exampleState(){java.util.List<ConnectivityIconState.Sim> sims=new java.util.ArrayList<>();
        int bars="5".equals(config.diagnostic("ls_augment_statusbar_signal_bars"))?5:4;
        if(exampleCards>0)sims.add(new ConnectivityIconState.Sim(10,0,bars,bars));
        if(exampleCards>1)sims.add(new ConnectivityIconState.Sim(20,1,2,bars));
        return new ConnectivityIconState(exampleBattery,exampleBypass?ConnectivityIconState.PowerState.BYPASS
                :exampleCharging?ConnectivityIconState.PowerState.CHARGING:ConnectivityIconState.PowerState.NONE,exampleWifi,3,false,10,sims);}
    private void drawConnectivity(Canvas canvas,float x,float y,float size,int tint){
        int[] batteryColors=connectivityPalette(false),textColors=connectivityPalette(true);
        connectivityPainter.draw(canvas,x,y,size,exampleState(),tint,number(ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE),
                number(ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS)),
                new String[]{draft.get(ConfigSchema.CONNECTIVITY_CONTENT_KEYS[0]),draft.get(ConfigSchema.CONNECTIVITY_CONTENT_KEYS[1]),draft.get(ConfigSchema.CONNECTIVITY_CONTENT_KEYS[2])},
                new int[]{number(ConfigSchema.CONNECTIVITY_SCALE_KEYS[0]),number(ConfigSchema.CONNECTIVITY_SCALE_KEYS[1]),number(ConfigSchema.CONNECTIVITY_SCALE_KEYS[2])},batteryColors,textColors,Color.parseColor(draft.get(ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR)),ConnectivityIconLayout.read(draft::get));}
    private int[] connectivityPalette(boolean text){
        String base=SystemUiOptions.PREFIX+(text?"battery_text_":"battery_");
        if(!ConfigSchema.truthy(draft.get(base+"colors")))return null;
        int[] colors=new int[5];
        for(int i=0;i<colors.length;i++){
            String key=base+(i==4?"charging_color":"color_"+i);
            String value=draft.get(key);colors[i]=Color.parseColor(value==null?ConfigSchema.defaultValue(key):value);
        }
        return colors;
    }
    private void connectivityPaletteControls(LinearLayout card,boolean text){
        String base=SystemUiOptions.PREFIX+(text?"battery_text_":"battery_");
        String title=text?"电量字体":"电池圆环";
        toggle(card,base+"colors","按电量设置"+title+"颜色");
        LinearLayout fields=new LinearLayout(this);fields.setOrientation(LinearLayout.VERTICAL);
        String[] bands={"0%～19%","20%～50%","51%～79%","80%～100%","充电时"};
        for(int i=0;i<5;i++)edit(fields,base+(i==4?"charging_color":"color_"+i),bands[i]+" "+title+"颜色（#AARRGGBB）",false);
        card.addView(fields);Switch control=controls.get(base+"colors");UiKit.Fold fold=ui.fold(control,fields);fold.sync();
        control.setOnCheckedChangeListener((button,on)->{fold.sync();if(!loading){draft.put(base+"colors",on?"1":"0");changed();}});
    }
    private void connectivityControls(LinearLayout card){
        card.addView(ui.text("三个内部区域分别设置，互不影响。位置以图标直径为单位：左右负数向左、正数向右；上下负数向上、正数向下。0 为原有位置。",11,ui.muted,false));
        Spinner powerPreview=ui.choiceSpinner("预览充电状态");
        powerPreview.setContentDescription("预览充电状态");
        powerPreview.setAdapter(choiceAdapter(new String[]{"预览：未充电","预览：普通充电","预览：旁路充电"}));
        powerPreview.setSelection(exampleBypass?2:exampleCharging?1:0);
        powerPreview.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            public void onNothingSelected(AdapterView<?> parent){}
            public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                exampleCharging=position==1;exampleBypass=position==2;if(preview!=null)preview.invalidate();
            }
        });
        parameterInputGroup(card).addView(powerPreview,ui.wrap());
        String[] titles={"内部上方","内部","内部下方"};
        for(int i=0;i<3;i++){
            final int region=i;String key=ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i];
            LinearLayout settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);
            LinearLayout display=parameterInputGroup(settings);
            display.addView(ui.featureTitle("显示内容","选择此区域的内容，再调整位置和大小。设为“不显示”时保留位置和大小，方便以后重新启用。"));
            Spinner content=ui.choiceSpinner("选择选项");content.setContentDescription(titles[i]+"显示内容");
            content.setAdapter(choiceAdapter(ConfigSchema.CONNECTIVITY_CONTENT_LABELS));
            content.setSelection(Math.max(0,java.util.Arrays.asList(ConfigSchema.CONNECTIVITY_CONTENT_VALUES).indexOf(draft.get(key))));
            display.addView(content);
            content.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onNothingSelected(AdapterView<?> parent){}
                public void onItemSelected(AdapterView<?> parent,View view,int position,long id){
                    String value=ConfigSchema.CONNECTIVITY_CONTENT_VALUES[position];
                    if(!loading&&!value.equals(draft.get(key))){draft.put(key,value);changed();}
                }
            });
            connectivityTransformControls(settings,titles[i],ConfigSchema.CONNECTIVITY_X_KEYS[region],ConfigSchema.CONNECTIVITY_Y_KEYS[region],ConfigSchema.CONNECTIVITY_SCALE_KEYS[region]);
            advanced(card,"connectivity-slot-"+i,titles[i],settings);
        }
        for(int i=0;i<2;i++){
            String title=i==0?"普通充电 · 闪电":"旁路充电 · 插头";
            LinearLayout settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);
            settings.addView(ui.text("默认显示在电量数字右侧，并随电量数字移动和缩放。在此基础上，可单独移动和缩放此标志，不影响数字或另一种充电状态。没有电量数字时不显示标志。",11,ui.muted,false));
            connectivityTransformControls(settings,title,ConfigSchema.CONNECTIVITY_POWER_X_KEYS[i],ConfigSchema.CONNECTIVITY_POWER_Y_KEYS[i],ConfigSchema.CONNECTIVITY_POWER_SCALE_KEYS[i]);
            advanced(card,"connectivity-power-"+i,title,settings);
        }
        LinearLayout style=new LinearLayout(this);style.setOrientation(LinearLayout.VERTICAL);
        connectivityPaletteControls(style,false);connectivityPaletteControls(style,true);
        edit(style,ConfigSchema.STATUSBAR_CONNECTIVITY_PLUG_COLOR,"充电标志颜色（#AARRGGBB）",false);
        slider(style,"电量弧粗细（占组件直径 %）",number(ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE),3,10,value->{draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_STROKE,""+value);changed();});
        slider(style,"未点亮部分不透明度（%）",number(ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE),10,65,value->{draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_INACTIVE,""+value);changed();});
        toggle(style,ConfigSchema.STATUSBAR_CONNECTIVITY_COLORS,"圆环充电与低电量着色");
        advanced(card,"connectivity-style","圆环与颜色",style);
        card.addView(ui.text("大小可调至 50%–300%。移动或放大后可能重叠，超出组件边界的部分可能被裁切，请结合顶部预览调整。移动底部信号后，圆环原来的信号缺口会闭合。",11,ui.muted,false));
    }
    private void connectivityTransformControls(LinearLayout parent,String title,String xKey,String yKey,String scaleKey){
        slider(parent,title+"左右移动（直径 %）",number(xKey),-ConfigSchema.CONNECTIVITY_OFFSET_LIMIT,ConfigSchema.CONNECTIVITY_OFFSET_LIMIT,value->{draft.put(xKey,""+value);changed();});
        slider(parent,title+"上下移动（直径 %）",number(yKey),-ConfigSchema.CONNECTIVITY_OFFSET_LIMIT,ConfigSchema.CONNECTIVITY_OFFSET_LIMIT,value->{draft.put(yKey,""+value);changed();});
        slider(parent,title+"大小（%）",number(scaleKey),ConfigSchema.CONNECTIVITY_SCALE_MIN,ConfigSchema.CONNECTIVITY_SCALE_MAX,value->{draft.put(scaleKey,""+value);changed();});
        Button restore=ui.button("恢复"+title+"默认位置和大小");parent.addView(restore,ui.wrap());
        restore.setOnClickListener(v->{for(String key:new String[]{xKey,yKey,scaleKey})draft.put(key,ConfigSchema.defaultValue(key));changed();renderKeepingScroll();});
    }
    private boolean isTwoRows(String id){
        if(positionSizeOnly()||singleRow())return false;
        if(id.equals("clock"))return number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==2;
        if(id.equals("network"))return networkMode()==4;
        String key=id.equals("network")?ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS:id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:id.equals("system_icons")?ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS:null;
        return key!=null&&ConfigSchema.truthy(draft.get(key));
    }
    private boolean singleRow(){return "1".equals(draft.get(StatusBarWorkspaceSpec.ROWS));}
    private int networkMode(){int mode=StatusBarNetworkDisplay.resolve(draft.get(ConfigSchema.STATUSBAR_NETWORK_DISPLAY),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS)));return singleRow()&&mode==4?3:mode;}
    private static String baseId(String id){int icon=id.indexOf("#icon:");if(icon>=0)return id.substring(icon+6);int split=id.indexOf('#');return split<0?id:id.substring(0,split);}
    private float previewTextSize(String id){
        if(id.equals("battery")&&!positionSizeOnly()&&!connectivityGroup()&&!nativeBatteryEnabled())return ui.dp(13);
        if(!positionSizeOnly()&&id.equals("clock")&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
            try{float size=Float.parseFloat(draft.get(ConfigSchema.STATUSBAR_CLOCK_SIZE_SP));
                if(size>0&&size<=40)return android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,size,getResources().getDisplayMetrics());
            }catch(Exception ignored){}
        }
        // A schematic preview cannot measure another process's OEM glyphs.
        StatusBarGridSpec.Item item=grid.get(id);if(item==null)item=workspaceItem(id);return ui.dp(item.size==0?13:item.size);
    }
    private void previewTypeface(Paint paint,String id){
        android.graphics.Typeface typeface=android.graphics.Typeface.DEFAULT;
        if(!positionSizeOnly()&&id.equals("clock")&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
            android.graphics.Typeface family=android.graphics.Typeface.create(draft.get(ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY),android.graphics.Typeface.NORMAL);
            typeface=android.graphics.Typeface.create(family,Math.max(100,Math.min(900,number(ConfigSchema.STATUSBAR_CLOCK_WEIGHT))),false);
        }
        if(workspaceAssets!=null){
            String role=java.util.Arrays.asList("cpu","gpu","battery_temp","current","power").contains(id)?"metrics":java.util.Arrays.asList("clock","network","battery","bluetooth").contains(id)?id:"other";
            String choice=workspaceAssets.workspaceFonts().resolve(role,workspaceScope);
            if("original".equals(choice))typeface=android.graphics.Typeface.DEFAULT;
            else {android.graphics.Typeface imported=ManagedFont.loadAsync(this,choice,()->{if(preview!=null&&!isDestroyed())preview.invalidate();});if(imported!=null)typeface=imported;}
        }
        paint.setTypeface(typeface);
    }

    private final class Preview extends View {
        final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        final CompactSignalPainter signalPainter=new CompactSignalPainter();
        final DualSignalPainter dualPainter=new DualSignalPainter();
        final IosSignalPainter iosSignalPainter=new IosSignalPainter();
        DualSignalLayout dualLayout(float height){
            boolean activity=!ConfigSchema.truthy(config.get(SystemUiOptions.PREFIX+"hide_mobile_activity"));
            float aspect=ConfigSchema.truthy(config.get(SystemUiOptions.PREFIX+"hide_mobile_type"))?0:1.5f;
            if(number(SystemUiOptions.SIGNAL_DUAL_STYLE)==1)return exampleCards==1?DualSignalLayout.iosSingle(height,activity,aspect):DualSignalLayout.ios(height,activity,aspect);
            return exampleCards==1?DualSignalLayout.single(height,activity,aspect):new DualSignalLayout(height,activity,aspect);
        }
        final Map<String,android.graphics.RectF> hits=new LinkedHashMap<>();
        final class IconSample {
            final String text;final float size;final String semantic;
            IconSample(String text,float size){this(text,size,"");}
            IconSample(String text,float size,String semantic){this.text=text;this.size=size;this.semantic=semantic;}
            float width(){if(!semantic.isEmpty())return size;if(text.equals("signal"))return size*107f/85f;p.setTextSize(size);p.setTypeface(android.graphics.Typeface.DEFAULT);return p.measureText(text);}
        }
        final StatusBarIconSamples semanticSamples=new StatusBarIconSamples();
        Preview() { super(StatusBarEditorController.this); setContentDescription("状态栏布局示例，实际图标由系统状态决定"); }

        // Bounded settings preview builds a coherent layout/hit-test snapshot on redraw; retained allocation tradeoff, not a hot SystemUI hook.
        // Measure the host's actual system inset resource; the existing missing-ID fallback is required across OEM layouts.
        // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
        //noinspection DiscouragedApi,DrawAllocation,InternalInsetResource
        @Override protected void onDraw(Canvas c) {
            p.setColor(ui.cardHigh); c.drawRoundRect(0, 0, getWidth(), getHeight(), ui.dp(12), ui.dp(12), p);
            p.setColor(ui.outline); if(!singleRow())c.drawLine(0, getHeight()/2f, getWidth(), getHeight()/2f, p);
            for (int i = 1; i < 3; i++) c.drawLine(getWidth()*i/3f, 0, getWidth()*i/3f, getHeight(), p);
            java.util.ArrayList<Map.Entry<String, StatusBarGridSpec.Item>> entries = new java.util.ArrayList<>(StatusBarWorkspaceSpec.effectiveGrid(grid,draft.get(StatusBarWorkspaceSpec.ROWS)).items().entrySet());
            entries.sort(java.util.Comparator.comparingInt(e -> e.getValue().order));
            java.util.List<StatusBarGridLayout.Node> nodes = new java.util.ArrayList<>();
            java.util.Map<String, String> labels = new java.util.LinkedHashMap<>();
            java.util.Map<String, Float> baselines = new java.util.LinkedHashMap<>();
            java.util.Map<String, java.util.List<IconSample>> iconSamples = new java.util.LinkedHashMap<>();
            boolean iosBattery=!positionSizeOnly()&&!connectivityGroup()&&nativeBatteryEnabled()&&number(SystemUiOptions.BATTERY_PRESET)==1;
            int batteryDisplay=number(SystemUiOptions.PREFIX+"battery_style");
            IosBatteryDrawable iosArtwork=iosBattery&&batteryDisplay<5?previewIosBattery():null;
            float iosIconWidth=0,iosIconHeight=0;
            for (Map.Entry<String, StatusBarGridSpec.Item> e : entries) {
                StatusBarGridSpec.Item item = e.getValue();
                if(e.getKey().equals("battery")&&!positionSizeOnly()&&!connectivityGroup()&&!nativeBatteryEnabled())item=StatusBarGridSpec.DEFAULT_BATTERY;
                if (!itemVisible(e.getKey(),item)) continue;
                String id = e.getKey();
                if(id.equals("battery")&&connectivityGroup()){
                    float size=ui.dp(number(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE));
                    nodes.add(new StatusBarGridLayout.Node(id,item.zone.substring(0,1)+"S",item.order,size,size));continue;}
                if(id.equals("battery")&&iosBattery){
                    if(batteryDisplay==6)continue;
                    float textSize=previewTextSize(id);p.setTextSize(textSize);
                    String outside=batteryDisplay==2||batteryDisplay==3||batteryDisplay==5
                            ?exampleBattery+(ConfigSchema.truthy(draft.get(SystemUiOptions.PREFIX+"battery_hide_percent"))?"":"%") : "";
                    iosIconHeight=textSize*1.15f;iosIconWidth=batteryDisplay==5?0:iosIconHeight*82/60f;
                    float width=iosIconWidth+p.measureText(outside)+(outside.isEmpty()||batteryDisplay==5?0:ui.dp(2));
                    int fixed=number(SystemUiOptions.PREFIX+"battery_width_dp");if(fixed>0)width=Math.max(width,ui.dp(fixed));
                    nodes.add(new StatusBarGridLayout.Node(id,item.zone,item.order,width,iosIconHeight));labels.put(id,outside);continue;
                }
                if(id.equals("system_icons")){
                    if(workspace()){
                        java.util.LinkedHashSet<String> samples=new java.util.LinkedHashSet<>();
                        if(!connectivityGroup()){samples.add("wifi");samples.add("mobile1");}
                        samples.add("bluetooth");samples.add("alarm_clock");
                        StatusBarWorkspaceSpec positions=StatusBarWorkspaceSpec.parse(draft.get(StatusBarWorkspaceSpec.ICONS));
                        if(positions!=null)samples.addAll(positions.ids());
                        if(StatusBarWorkspaceSpec.independentSlot(workspaceDetail)&&grid.get(workspaceDetail)==null)samples.add(workspaceDetail);
                        StatusBarVisibilitySpec visibility=StatusBarVisibilitySpec.parse(draft.get(StatusBarVisibilitySpec.KEY));
                        StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY));
                        int n=0;for(String semantic:samples){
                            if(visibility!=null&&visibility.hidden(workspaceScope,semantic)||connectivityGroup()&&java.util.Arrays.asList("wifi","mobile1","mobile2").contains(semantic))continue;
                            StatusBarGridSpec.Item own=positions==null?null:positions.get(semantic);
                            StatusBarGridSpec.Item effective=StatusBarWorkspaceSpec.effectiveItem(own==null?item:own,draft.get(StatusBarWorkspaceSpec.ROWS));
                            String zone=own==null&&isTwoRows(id)?effective.zone.substring(0,1)+(n++%2+1):effective.zone;
                            float size=ui.dp(effective.size==0?13:effective.size);String part="system_icons#icon:"+semantic;
                            StatusBarIconSpacingSpec.Insets edges=spacing==null?StatusBarIconSpacingSpec.ZERO:spacing.resolve(workspaceScope,semantic);
                            nodes.add(new StatusBarGridLayout.Node(part,zone,effective.order,size+ui.dp(edges.horizontal()),size*1.15f+ui.dp(edges.vertical())));
                            iconSamples.put(part,java.util.Collections.singletonList(new IconSample("",size,semantic)));
                        }continue;
                    }
                    java.util.List<IconSample> samples=new java.util.ArrayList<>();float size=previewTextSize(id);
                    boolean dual=!connectivityGroup()&&ConfigSchema.truthy(draft.get(SystemUiOptions.SIGNAL_DUAL));
                    if(!connectivityGroup()){samples.add(new IconSample("⌁",size));if(!dual)samples.add(new IconSample("signal",size));}
                    samples.add(new IconSample("◉",size));samples.add(new IconSample("◇",size));
                    // The native sample belongs to the system group; custom network text replaces it.
                    if(positionSizeOnly()||!grid.get("network").visible){
                        int sp=number(ConfigSchema.STATUSBAR_NATIVE_NETWORK_SIZE_SP);
                        float networkSize=sp>0?android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,sp,getResources().getDisplayMetrics()):size;
                        samples.add(new IconSample("36K",networkSize));
                    }
                    boolean paired=isTwoRows(id);int rows=paired?2:1;
                    for(int row=0;row<rows;row++){
                        java.util.List<IconSample> members=new java.util.ArrayList<>();float width=0,height=0;
                        for(int i=row;i<samples.size();i+=rows){IconSample sample=samples.get(i);members.add(sample);width+=sample.width()+ui.dp(1);height=Math.max(height,sample.size*1.15f);}
                        if(members.isEmpty())continue;
                        String part=paired?id+"#"+row:id;
                        String zone=positionSizeOnly()?item.zone.substring(0,1)+"S":paired?item.zone.substring(0,1)+(row+1):item.zone;
                        nodes.add(new StatusBarGridLayout.Node(part,zone,item.order,Math.max(1,width-ui.dp(1)),height));iconSamples.put(part,members);
                    }
                    if(dual)nodes.add(new StatusBarGridLayout.Node("system_icons#dual",item.zone.substring(0,1)+"S",item.order,dualLayout(size).width,size));
                    continue;
                }
                String label = id.equals("clock") ? "12:30" : id.equals("network") ? StatusBarNetworkDisplay.format(networkMode(),"12K","36K",draft.get(ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK),draft.get(ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK)) : id.equals("notifications") ? "● ●\n● ●" : id.equals("battery") ? "▱82%" : metricPreview(id);
                if (!positionSizeOnly()&&id.equals("clock") && ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
                    ls.augment.com.hook.StatusBarClockFormatter.FormatResult clock=previewClock();label=clock.valid?clock.text:"格式有误";
                }
                if (singleRow()||positionSizeOnly()||(id.equals("network") && networkMode()!=4)
                        || (id.equals("notifications") && !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)))
                        || (id.equals("system_icons") && !ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS)))) label = label.replace('\n', ' ');
                float textSize=previewTextSize(id);p.setTextSize(textSize);previewTypeface(p,id);String[] lines = label.split("\n");
                boolean textNode=!id.equals("notifications")&&!id.equals("battery");
                float clockWidth=ui.dp(number(ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP));
                if(id.equals("clock"))for(String line:lines)clockWidth=Math.max(clockWidth,p.measureText(line));
                if(isTwoRows(id)){
                    for(int row=0;row<lines.length;row++){
                        String part=id+"#"+row;
                        android.graphics.Rect ink=new android.graphics.Rect();p.getTextBounds(lines[row],0,lines[row].length(),ink);
                        float h=textNode&&!ink.isEmpty()?ink.height():textSize*1.15f,baseline=textNode&&!ink.isEmpty()?-ink.top:-1;
                        nodes.add(new StatusBarGridLayout.Node(part,item.zone.substring(0,1)+(row+1),item.order,id.equals("clock")?clockWidth:p.measureText(lines[row]),h,baseline));
                        baselines.put(part,baseline);
                        labels.put(part,lines[row]);
                    }
                }else{
                    float width=1;for(String line:lines)width=Math.max(width,p.measureText(line));
                    android.graphics.Rect ink=new android.graphics.Rect();p.getTextBounds(label,0,label.length(),ink);
                    float h=textNode&&lines.length==1&&!ink.isEmpty()?ink.height():textSize*lines.length*1.15f,baseline=textNode&&lines.length==1&&!ink.isEmpty()?-ink.top:-1;
                    nodes.add(new StatusBarGridLayout.Node(id,positionSizeOnly()?item.zone.substring(0,1)+"S":item.zone,item.order,width,h,baseline));labels.put(id,label);baselines.put(id,baseline);
                }
            }
            int heightId=getResources().getIdentifier("status_bar_height","dimen","android");
            int nativeHeight=heightId==0?ui.dp(24):getResources().getDimensionPixelSize(heightId);
            int selectedHeight=number(ConfigSchema.STATUSBAR_HEIGHT_DP);
            float barHeight=ConfigSchema.statusBarHeightPx(nativeHeight,selectedHeight,getResources().getDisplayMetrics().density);
            float barWidth=getResources().getDisplayMetrics().widthPixels,cutLeft=0,cutRight=0;
            android.view.WindowInsets insets=getRootWindowInsets();
            if(insets!=null&&insets.getDisplayCutout()!=null)for(android.graphics.Rect r:insets.getDisplayCutout().getBoundingRects()){
                if(r.top<barHeight&&r.bottom>0){cutLeft=r.left-ui.dp(2);cutRight=r.right+ui.dp(2);}
            }
            if(workspace())nodes.sort(java.util.Comparator.comparingInt((StatusBarGridLayout.Node node)->node.order).thenComparing(node->StatusBarWorkspaceSpec.stableOrderKey(node.id)));
            org.json.JSONObject nativeGeometry=previewNativeGeometry();
            StatusBarAdaptiveLayout.Result arrangement = StatusBarAdaptiveLayout.pack(nodes, barWidth, barHeight,
                    previewMargin(nativeGeometry,"left",ConfigSchema.STATUSBAR_LEFT_MARGIN_DP),previewMargin(nativeGeometry,"right",ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP),
                    previewMargin(nativeGeometry,"top",ConfigSchema.STATUSBAR_TOP_MARGIN_DP),previewMargin(nativeGeometry,"bottom",ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP),
                    positionSizeOnly()||singleRow()?0:ui.dp(number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP)),cutLeft,cutRight);
            java.util.Map<String, StatusBarGridLayout.Box> boxes=arrangement.boxes;
            float scale=Math.min(getWidth()/barWidth,(getHeight()-ui.dp(8))/barHeight);
            float offsetX=(getWidth()-barWidth*scale)/2,offsetY=(getHeight()-barHeight*scale)/2;
            hits.clear();boolean crowded=false;
            for(Map.Entry<String,StatusBarGridLayout.Box> entry:boxes.entrySet()){
                StatusBarGridLayout.Box b=entry.getValue();String id=baseId(entry.getKey());
                android.graphics.RectF r=new android.graphics.RectF(offsetX+b.x*scale,offsetY+b.y*scale,offsetX+(b.x+b.width)*scale,offsetY+(b.y+b.height)*scale);
                if(hits.containsKey(id))hits.get(id).union(r);else hits.put(id,r);
                if(b.scale<.7f||(!id.equals("battery")&&previewTextSize(id)*b.scale<ui.dp(8)))crowded=true;
            }
            final String feedback=!arrangement.valid?"空间不足："+arrangement.reason:!masterControl.isChecked()?"自定义布局未开启 · 可先查看示例和配置":nativeGeometry==null?"布局示例 · 原厂边距等待本机检测":crowded?"预览较拥挤 · 建议减少内容或调整位置":"布局示例 · 实际效果随通知和数据长度变化";
            if(layoutFeedback!=null&&!feedback.contentEquals(layoutFeedback.getText()))main.post(()->{if(!isDestroyed())layoutFeedback.setText(feedback);});
            c.save();c.translate(offsetX,offsetY);c.scale(scale,scale);
            if(!arrangement.valid){p.setColor(ui.danger);p.setTextSize(ui.dp(12));p.setTextAlign(Paint.Align.CENTER);c.drawText("当前内容放不下，请调整组件排列",barWidth/2,barHeight/2, p);}
            for (Map.Entry<String, StatusBarGridLayout.Box> e : boxes.entrySet()) {
                StatusBarGridLayout.Box b = e.getValue();
                if(e.getKey().equals("battery")&&connectivityGroup()){
                    drawConnectivity(c,b.x,b.y,b.width,ui.text);continue;}
                if(e.getKey().equals("battery")&&iosBattery){
                    String outside=labels.get("battery");p.setColor(ui.text);p.setTextAlign(Paint.Align.LEFT);p.setTextSize(previewTextSize("battery")*b.scale);
                    float textWidth=p.measureText(outside),gap=outside.isEmpty()||batteryDisplay==5?0:ui.dp(2)*b.scale;
                    float iconX=b.x+(batteryDisplay==3?textWidth+gap:0);
                    if(iosArtwork!=null&&batteryDisplay<5){
                        iosArtwork.setBounds(Math.round(iconX),Math.round(b.y),Math.round(iconX+iosIconWidth*b.scale),Math.round(b.y+iosIconHeight*b.scale));
                        iosArtwork.setAlpha(Math.round(number(SystemUiOptions.PREFIX+"battery_alpha_percent")*2.55f));iosArtwork.draw(c);
                    }
                    if(!outside.isEmpty())c.drawText(outside,b.x+(batteryDisplay==2?iosIconWidth*b.scale+gap:0),b.y+b.height*.82f,p);
                    continue;
                }
                int signalBars="5".equals(config.diagnostic("ls_augment_statusbar_signal_bars"))?5:4;
                if(e.getKey().equals("system_icons#dual")){
                    if(number(SystemUiOptions.SIGNAL_DUAL_STYLE)==1){
                        drawIosRows(c,b,signalBars);continue;
                    }
                    dualPainter.setArtwork(null);
                    dualPainter.draw(c,b.x,b.y,dualLayout(b.height),signalBars,signalBars-1,signalBars,signalBars,exampleCards==1?1:2,ui.text,3,
                            (canvas,row,x,y,w,h,color)->{p.setColor(color);p.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);p.setTextAlign(Paint.Align.LEFT);p.setTextSize(h);
                                int save=canvas.save();canvas.translate(x,y);canvas.scale(w/p.measureText("5A"),h/(p.descent()-p.ascent()));canvas.drawText("5A",0,-p.ascent(),p);canvas.restoreToCount(save);});continue;
                }
                java.util.List<IconSample> samples=iconSamples.get(e.getKey());
                if(samples!=null){
                    float x=b.x;p.setColor(ui.text);p.setTextAlign(Paint.Align.LEFT);
                    for(IconSample sample:samples){
                        float width=sample.width()*b.scale,h=sample.size*1.15f*b.scale;
                        if(!sample.semantic.isEmpty()){
                            StatusBarIconSpacingSpec spacing=StatusBarIconSpacingSpec.parse(draft.get(StatusBarIconSpacingSpec.KEY));StatusBarIconSpacingSpec.Insets edge=spacing==null?StatusBarIconSpacingSpec.ZERO:spacing.resolve(workspaceScope,sample.semantic);
                            android.graphics.RectF r=new android.graphics.RectF(x+ui.dp(edge.start)*b.scale,b.y+ui.dp(edge.top)*b.scale,x+ui.dp(edge.start)*b.scale+width,b.y+ui.dp(edge.top)*b.scale+h);
                            String state=sample.semantic.contains("wifi")?"level3":sample.semantic.startsWith("mobile")?"level4":"default";
                            workspaceArtwork.draw(c,sample.semantic,state,r,ui.text,"background");
                            if(!workspaceArtwork.draw(c,sample.semantic,state,r,ui.text,"whole"))semanticSamples.draw(c,sample.semantic,state,r,ui.text);
                            workspaceArtwork.draw(c,sample.semantic,state,r,ui.text,"foreground");
                        }else if(sample.text.equals("signal"))signalPainter.draw(c,x,b.y+(b.height-h)/2,width,h,signalBars,0,signalBars,signalBars,1,ui.text,28);
                        else {p.setTextSize(sample.size*b.scale);c.drawText(sample.text,x,b.y+(b.height-h)/2+h*.82f,p);}
                        x+=width+ui.dp(1)*b.scale;
                    }
                    continue;
                }
                String[] lines = labels.get(e.getKey()).split("\n");
                String id=baseId(e.getKey());p.setColor(ui.text); p.setTextAlign(Paint.Align.LEFT); p.setTextSize(previewTextSize(id)*b.scale);previewTypeface(p,id);
                for (int i=0; i<lines.length; i++){
                    float x=b.x,baseline=baselines.getOrDefault(e.getKey(),-1f);
                    if(id.equals("clock")){String align=draft.get(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN);float spare=b.width-p.measureText(lines[i]);if("center".equals(align))x+=spare/2;else if("right".equals(align))x+=spare;}
                    c.drawText(lines[i],x,baseline>=0?b.y+baseline*b.scale:b.y+(i+.82f)*b.height/lines.length,p);
                }
            }
            c.restore();
            android.graphics.RectF selected=hits.get(selectedComponent);
            if(selected!=null){p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(ui.dp(1));p.setColor(ui.accent);android.graphics.RectF r=new android.graphics.RectF(selected);r.inset(-ui.dp(2),-ui.dp(2));c.drawRoundRect(r,ui.dp(3),ui.dp(3),p);p.setStyle(Paint.Style.FILL);}
        }
        private void drawIosRows(Canvas canvas,StatusBarGridLayout.Box box,int bars){
            DualSignalLayout reference=dualLayout(box.height);
            boolean types=!ConfigSchema.truthy(config.get(SystemUiOptions.PREFIX+"hide_mobile_type"));
            int[] slots=exampleCards==1?new int[]{0}:new int[]{0,1};
            float[][] aspects=exampleCards==1?new float[][]{{types?1.5f:0,0,0}}:new float[][]{{types?1.5f:0,0,0},{types?1.5f:0,0,0}};
            int active=slots.length-1;
            DualSignalLayout layout=DualSignalLayout.spaced(box.height,reference.activity,slots,aspects,active,
                    null,1,false,true);
            dualPainter.setArtwork((target,part,layer,l,t,r,b,color)->{
                if(!part.startsWith("row")||!part.endsWith(".signal")||!layer.equals("whole"))return false;
                int row=part.startsWith("row0")?0:1;
                iosSignalPainter.drawRow(getContext(),target,l,t,r,b,row==0?bars:bars-1,
                        bars,false,color,row,exampleCards==1,this::invalidate);
                return true;
            });
            dualPainter.drawSpaced(canvas,box.x,box.y,layout,bars,bars-1,bars,bars,ui.text,3,active,
                    (target,row,badge,cell,color)->{
                        if(badge!=0)return;
                        p.setColor(color);p.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);p.setTextAlign(Paint.Align.LEFT);p.setTextSize(cell.height);
                        int save=target.save();target.translate(cell.x,cell.y);target.scale(cell.width/p.measureText("5A"),cell.height/(p.descent()-p.ascent()));
                        target.drawText("5A",0,-p.ascent(),p);target.restoreToCount(save);
                    });
            dualPainter.setArtwork(null);
        }
    }
}
