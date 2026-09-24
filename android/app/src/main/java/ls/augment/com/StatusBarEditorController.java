package ls.augment.com;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** One validated draft and live preview, saved automatically across all status-bar tabs. */
final class StatusBarEditorController extends NativeEditorController {
    StatusBarEditorController(Activity owner,String route,boolean embedded){super(owner,route,embedded);}
    // All editor instances share submission order, including pages already closed.
    private static final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final ConfigEditDraft draft = new ConfigEditDraft();
    private final LinkedHashMap<String, String> rawInputs = new LinkedHashMap<>();
    private AppConfig config;
    private UiKit ui;
    private LinearLayout content;
    private ScrollView configScroll;
    private Preview preview;
    private View previewHost;
    private final ConnectivityIconPainter connectivityPainter=new ConnectivityIconPainter();
    private int exampleBattery=73,exampleCards=2;
    private boolean exampleCharging=true,exampleBypass,exampleWifi=true;
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
    private final Map<String,UiKit.Fold> componentFolds=new LinkedHashMap<>();
    private final Map<String,Boolean> expandedComponents=new LinkedHashMap<>();
    private final Map<String,View> componentViews=new LinkedHashMap<>();
    private final Map<String,TextView> componentSummaries=new LinkedHashMap<>();
    private final Map<Integer,Integer> scrollPositions=new LinkedHashMap<>();
    private final java.util.List<Button> tabButtons=new java.util.ArrayList<>();
    private String selectedComponent="";
    private TextView layoutFeedback;
    private HorizontalScrollView tabHost;
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
        for(NativeFeatureGroups.Feature feature:relatedFeatures){
            if(!destination.equals(NativeFeatureGroups.statusBarDestination(feature)))continue;
            // Both palettes have one owner and one draft inside the three-in-one
            // settings. Do not create a second pair of controls in related items.
            if("systemui:battery_colors".equals(feature.id)||"systemui:battery_text_colors".equals(feature.id))continue;
            View view=relatedViews.get(feature.id);
            if(view==null){view=featureFactory.apply(feature);relatedViews.put(feature.id,view);}
            if(view.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)view.getParent()).removeView(view);
            parent.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
            parent.addView(view,ui.wrap());
        }
    }
    private UiKit.Fold masterFold;
    private Switch masterControl;
    private EditText clockSizeInput;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        config = new AppConfig(this); ui = editorUi();
        for (String key : ConfigSchema.keys()) if (key.startsWith("ls_augment_statusbar_")
                || key.equals(ConfigSchema.SYSTEMUI_MASTER)
                || key.equals(SystemUiOptions.PREFIX+"battery_colors")
                || key.startsWith(SystemUiOptions.PREFIX+"battery_color_")
                || key.equals(SystemUiOptions.PREFIX+"battery_charging_color")
                || key.startsWith(SystemUiOptions.PREFIX+"battery_text_")) draft.seed(key, config.get(key));
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
            Bundle expanded=state.getBundle("expanded-components");if(expanded!=null)for(String key:expanded.keySet())expandedComponents.put(key,expanded.getBoolean(key));
            Bundle advanced=state.getBundle("advanced-expanded");if(advanced!=null)for(String key:advanced.keySet())advancedExpanded.put(key,advanced.getBoolean(key));
            Bundle positions=state.getBundle("tab-scroll");if(positions!=null)for(String key:positions.keySet())scrollPositions.put(Integer.parseInt(key),positions.getInt(key));
            Bundle undo=state.getBundle("layout-undo");if(undo!=null){lastLayoutBackup=new LinkedHashMap<>();for(String key:undo.keySet())lastLayoutBackup.put(key,undo.getString(key));}
        }
        grid = StatusBarGridSpec.parse(draft.get(ConfigSchema.STATUSBAR_GRID));
        if (grid == null) grid = StatusBarGridSpec.defaults();
        LinearLayout page = new LinearLayout(this);page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(0,0,0,0);if(!embedded)page.setBackground(ui.backgroundDrawable());
        ui.setContentView(page);ui.applyGestureInset(page,0);
        if(!embedded){LinearLayout header=ui.header("状态栏",true);header.setPadding(ui.dp(10),ui.dp(4),ui.dp(12),ui.dp(2));ScopeRestartDialog.addButton(owner,ui,header,ScopeRestartDialog.SYSTEM_UI);page.addView(header);page.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));}
        masterControl=new Switch(this);masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));
        LinearLayout masterRow=ui.featureRow("启用自定义状态栏","控制自定义布局、时钟和实时信息。按实际对象集中配置；原厂图标等独立设置按各自开关生效。",masterControl);if(!embedded)masterRow.setPadding(ui.dp(14),0,ui.dp(14),0);page.addView(masterRow,ui.wrap());
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(embedded?0:ui.dp(14),ui.dp(8),embedded?0:ui.dp(14),0);
        int editorHeight=Math.max(ui.dp(200),Math.min(ui.dp(560),getResources().getDisplayMetrics().heightPixels-ui.dp(220)));
        page.addView(body,embedded?new LinearLayout.LayoutParams(-1,editorHeight):new LinearLayout.LayoutParams(-1,0,1));
        if(embedded)masterFold=ui.fold(masterControl,body,true);
        masterControl.setOnCheckedChangeListener((button,on)->{draft.put(ConfigSchema.SYSTEMUI_MASTER,on?"1":"0");changed();});
        body.addView(ui.text("示例预览 · 点选内容可编辑，也可使用下方分类",11,ui.muted,false),ui.wrap());
        preview = new Preview();preview.setLayoutParams(new LinearLayout.LayoutParams(-1,ui.dp(62)));
        body.addView(preview);previewHost=preview;
        layoutFeedback=ui.text("已开启自动避让",11,ui.accent,false);body.addView(layoutFeedback,ui.margins(0,3,0,3));
        LinearLayout layoutActions=new LinearLayout(this);
        Button arrange=ui.tonalButton("自动整理"),presets=ui.tonalButton("选择预设");undoLayout=ui.tonalButton("恢复方案前");
        for(Button button:new Button[]{arrange,presets,undoLayout}){button.setTextSize(11);addSpacedButton(layoutActions,button);}
        arrange.setOnClickListener(v->arrangeLayout());presets.setOnClickListener(v->choosePreset());undoLayout.setOnClickListener(v->restoreLayout());body.addView(layoutActions,ui.margins(0,0,0,8));
        presetActions=new LinearLayout(this);Button accept=ui.accentButton("使用此预设"),cancel=ui.tonalButton("取消预览");
        addSpacedButton(presetActions,accept);addSpacedButton(presetActions,cancel);
        accept.setOnClickListener(v->confirmPreset());cancel.setOnClickListener(v->cancelPreset());presetActions.setVisibility(View.GONE);body.addView(presetActions,ui.margins(0,0,0,8));
        LinearLayout tabs = new LinearLayout(this);
        tabs.setBaselineAligned(false);
        String[] names = {"布局", "时钟", "通知", "硬件网速", "图标", "电池"};
        for (int i = 0; i < names.length; i++) {
            final int selected = i; Button button = ui.tonalButton(names[i]); button.setTextSize(11);
            button.setMinWidth(0);button.setMinimumWidth(0);button.setPadding(ui.dp(4),0,ui.dp(4),0);
            button.setSingleLine(true);button.setGravity(Gravity.CENTER);button.setIncludeFontPadding(false);
            button.setAutoSizeTextTypeUniformWithConfiguration(8,11,1,android.util.TypedValue.COMPLEX_UNIT_SP);
            button.setOnClickListener(v -> switchTab(selected));tabButtons.add(button);
            addSpacedButton(tabs,button);
        }
        tabHost=new HorizontalScrollView(this);tabHost.setFillViewport(true);tabHost.setHorizontalScrollBarEnabled(false);tabHost.addView(tabs);body.addView(tabHost,ui.wrap());
        configScroll=new ScrollView(this){
            @Override public boolean dispatchTouchEvent(android.view.MotionEvent event){
                // The inner settings own this gesture; scrolling them must not move their preview.
                if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);
                boolean handled=super.dispatchTouchEvent(event);
                if(event.getActionMasked()==android.view.MotionEvent.ACTION_UP||event.getActionMasked()==android.view.MotionEvent.ACTION_CANCEL)
                    if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(false);
                return handled;
            }
        };configScroll.setFillViewport(true);
        content = new LinearLayout(this); content.setOrientation(LinearLayout.VERTICAL);content.setPadding(0,ui.dp(8),0,ui.dp(12));
        configScroll.addView(content,new ScrollView.LayoutParams(-1,-2));body.addView(configScroll,new LinearLayout.LayoutParams(-1,0,1));
        LinearLayout actions = new LinearLayout(this);
        reset = ui.tonalButton("恢复整个状态栏编辑器默认配置");
        reset.setOnClickListener(v -> {
            ui.glassDialog("恢复状态栏默认配置","将重置此编辑器的布局、时钟、硬件与图标配置。原厂独立功能开关不变；可用上方撤销按钮恢复。","恢复默认",()->{
                lastLayoutBackup=snapshot();rawInputs.clear();loading=true;
                for(String key:draft.keySet())draft.force(key,ConfigSchema.defaultValue(key));
                masterControl.setChecked(ConfigSchema.truthy(draft.get(ConfigSchema.SYSTEMUI_MASTER)));loading=false;
                grid=StatusBarGridSpec.defaults();changed();render();
            },"取消");
        });
        apply = ui.accentButton("应用");
        apply.setOnClickListener(v -> save());

        render();
        configScroll.post(()->configScroll.scrollTo(0,scrollPositions.getOrDefault(tab,0)));
        if(dirty)main.post(autoSave);
    }

    private void render() {
        render(false);
    }
    private void render(boolean preserveExpanded) {
        for(Map.Entry<String,View> entry:advancedViews.entrySet())advancedExpanded.put(entry.getKey(),entry.getValue().getVisibility()==View.VISIBLE);
        advancedViews.clear();
        for(Map.Entry<String,UiKit.Fold> entry:componentFolds.entrySet())
            expandedComponents.put(entry.getKey(),entry.getValue().content.getVisibility()==View.VISIBLE);
        componentFolds.clear();componentViews.clear();componentSummaries.clear();
        if(connectivityFold!=null)connectivityExpanded=connectivityFold.content.getVisibility()==View.VISIBLE;
        connectivityFold=null;
        if(nativeBatteryFold!=null)nativeBatteryExpanded=nativeBatteryFold.content.getVisibility()==View.VISIBLE;
        nativeBatteryFold=null;
        loading = true; sectionFold=null;clockSizeInput=null;controls.clear();content.removeAllViews();configScroll.scrollTo(0,0);
        presetActions.setVisibility(previewBackup==null?View.GONE:View.VISIBLE);undoLayout.setEnabled(lastLayoutBackup!=null&&previewBackup==null);
        undoLayout.setAlpha(undoLayout.isEnabled()?1f:.45f);
        masterControl.setEnabled(previewBackup==null);
        if(previewBackup!=null){
            content.addView(ui.text("正在预览："+presetName,17,ui.text,true),ui.margins(0,16,0,8));
            content.addView(ui.text("顶部为示例效果，手机尚未应用此预设。选择“使用此预设”后保存；取消或离开页面会恢复预览前的设置。",13,ui.muted,false));
        } else if (tab == 0) {
            toggle(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY, "仅调整位置和大小");
            content.addView(ui.text("先选择预设或自动整理；需要精调时再展开下方高级设置。",12,ui.muted,false));
            LinearLayout root=content;content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
            number(ConfigSchema.STATUSBAR_HEIGHT_DP, "状态栏高度（0 原厂，负数减小）", ConfigSchema.STATUSBAR_HEIGHT_MIN_DP, ConfigSchema.STATUSBAR_HEIGHT_MAX_DP);
            number(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP, "左侧留白", 0, 40);
            number(ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP, "右侧留白", 0, 40);
            number(ConfigSchema.STATUSBAR_TOP_MARGIN_DP, "顶部留白", 0, 12);
            number(ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP, "底部留白", 0, 12);
            if(!positionSizeOnly())number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP, "两排间距", -8, 8);
            LinearLayout settings=content;content=root;advanced(content,"layout-spacing","高级：高度、留白与两排间距",settings);
            related("layout",content);
        } else if (tab == 1) {
            component("clock", "时钟");
            related("clock",content);
        } else if (tab == 2) {
            component("notifications","通知图标");
            if(!positionSizeOnly())number(ConfigSchema.STATUSBAR_NOTIFICATION_MAX,"最多显示通知数（0 跟随系统）",0,20);
            related("notifications",content);
        } else if (tab == 3) {
            if(positionSizeOnly()){
                LinearLayout network=new LinearLayout(this);network.setOrientation(LinearLayout.VERTICAL);nativeNetworkSize(network);
                content.addView(ui.collapsible("网速","调整原生网速字号；自定义网速设置会保留，关闭仅调整位置和大小模式后可继续配置。",network,false),ui.wrap());
                content.addView(ui.text("当前仅调整原生组件的位置和大小。硬件信息和自定义网速已暂停，原有设置保留；可在布局页关闭此模式后继续设置。",12,ui.muted,false));
            }
            else{
                component("network","网速");
                content.addView(ui.text("CPU、GPU、电池温度、电流和功率可分别设置位置、大小、顺序与小数位数。", 12, ui.muted, false));
                for (int i = 4; i < StatusBarGridSpec.IDS.length; i++) if(!StatusBarGridSpec.IDS[i].equals("network"))component(StatusBarGridSpec.IDS[i], StatusBarGridSpec.LABELS[i]);
            }
            related("metrics",content);
        } else if(tab==4) {
            content.addView(ui.text(positionSizeOnly()?"保留原生行数、字体、图标样式和显示状态；通知图标与系统图标均按整组移动和缩放。":"双排图标统一使用状态栏的上下两排，可选择左侧、中间或右侧；间距跟随布局页设置。", 12, ui.muted, false));
            component("system_icons","系统图标");
            related("icons",content);
        } else {
            if(!positionSizeOnly())connectivitySection();
            nativeBatterySection();
        }
        if(reset.getParent()!=null)((android.view.ViewGroup)reset.getParent()).removeView(reset);
        if(tab==0&&previewBackup==null)content.addView(reset,ui.margins(0,20,0,0));
        for(int i=0;i<tabButtons.size();i++){
            Button button=tabButtons.get(i);boolean selected=i==tab;button.setSelected(selected);
            button.setBackgroundTintList(android.content.res.ColorStateList.valueOf(selected?ui.accent:ui.cardHigh));
            button.setTextColor(selected?android.graphics.Color.WHITE:ui.accent);
        }
        loading = false; preview.invalidate();
    }

    private void switchTab(int selected){
        scrollPositions.put(tab,configScroll.getScrollY());tab=selected;render(true);
        int y=scrollPositions.getOrDefault(tab,0);configScroll.post(()->configScroll.scrollTo(0,y));
        tabHost.post(()->tabHost.smoothScrollTo(Math.max(0,tabButtons.get(tab).getLeft()-ui.dp(16)),0));
    }
    private Map<String,String> snapshot(){Map<String,String> result=new LinkedHashMap<>();for(Map.Entry<String,String> entry:draft.entrySet())result.put(entry.getKey(),entry.getValue());return result;}
    private void syncDraftUi(){
        grid=StatusBarGridSpec.parse(draft.get(ConfigSchema.STATUSBAR_GRID));if(grid==null)grid=StatusBarGridSpec.defaults();
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
            for(Map.Entry<String,String> entry:StatusBarPresets.values(index).entrySet())draft.seed(entry.getKey(),entry.getValue());
            syncDraftUi();
        });
    }
    private void confirmPreset(){
        if(previewBackup==null)return;
        Map<String,String> candidate=snapshot();lastLayoutBackup=new LinkedHashMap<>(previewBackup);
        for(Map.Entry<String,String> entry:previewBackup.entrySet())draft.seed(entry.getKey(),entry.getValue());
        previewBackup=null;rawInputs.clear();
        for(Map.Entry<String,String> entry:candidate.entrySet())draft.put(entry.getKey(),entry.getValue());
        syncDraftUi();changed();Toast.makeText(this,"已使用“"+presetName+"”，可恢复方案前配置",Toast.LENGTH_SHORT).show();
    }
    private void cancelPreset(){
        if(previewBackup==null)return;
        for(Map.Entry<String,String> entry:previewBackup.entrySet())draft.seed(entry.getKey(),entry.getValue());
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
        LinearLayout group=new LinearLayout(this);group.setOrientation(LinearLayout.VERTICAL);
        LinearLayout header=new LinearLayout(this);header.setGravity(Gravity.CENTER_VERTICAL);
        header.addView(ui.text(title,12,ui.text,true),new LinearLayout.LayoutParams(0,-2,1));
        ImageButton arrow=new ImageButton(this);arrow.setImageResource(R.drawable.ic_expand_more);arrow.setColorFilter(ui.muted);arrow.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        header.addView(arrow,new LinearLayout.LayoutParams(ui.dp(44),ui.dp(44)));
        group.addView(header,ui.wrap());group.addView(settings,ui.wrap());
        settings.setVisibility(Boolean.TRUE.equals(advancedExpanded.get(id))?View.VISIBLE:View.GONE);advancedViews.put(id,settings);
        Runnable update=()->{boolean open=settings.getVisibility()==View.VISIBLE;arrow.setRotation(open?180:0);arrow.setContentDescription((open?"收起":"展开")+title);};
        View.OnClickListener toggle=v->{boolean open=settings.getVisibility()!=View.VISIBLE;settings.setVisibility(open?View.VISIBLE:View.GONE);advancedExpanded.put(id,open);update.run();};
        header.setOnClickListener(toggle);arrow.setOnClickListener(toggle);update.run();parent.addView(group,ui.margins(0,8,0,8));
    }
    private void selectComponent(String id){
        selectedComponent=id;
        int destination=id.equals("clock")?1:id.equals("notifications")?2:id.equals("system_icons")?4:id.equals("battery")?5:3;
        switchTab(destination);
        UiKit.Fold fold=componentFolds.get(id);if(fold!=null)fold.show(true);
        if(id.equals("battery")&&connectivityFold!=null)connectivityFold.show(true);
        if(id.equals("battery")&&nativeBatteryFold!=null)nativeBatteryFold.show(true);
        View target=componentViews.get(id);
        if(target!=null)configScroll.post(()->{android.graphics.Rect r=new android.graphics.Rect();target.getDrawingRect(r);content.offsetDescendantRectToMyCoords(target,r);configScroll.smoothScrollTo(0,r.top);});
        preview.invalidate();
    }

    private void connectivitySection(){
        toggle(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,"三合一图形图标");
        Switch control=controls.get(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);
        LinearLayout row=(LinearLayout)control.getParent();int index=content.indexOfChild(row);
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        if(connectivityGroup()){
            component("battery","三合一图标配置");
            LinearLayout settings=(LinearLayout)content.getChildAt(index+1);
            content.removeView(settings);
            while(settings.getChildCount()>0){View child=settings.getChildAt(0);settings.removeViewAt(0);body.addView(child);}
        }
        content.removeView(row);LinearLayout card=ui.card();card.addView(row);card.addView(body);
        content.addView(card,index,ui.margins(0,8,0,8));
        if(connectivityGroup())componentViews.put("battery",card);
        connectivityFold=ui.fold(control,body);connectivityFold.show(connectivityExpanded);
        control.setOnCheckedChangeListener((button,on)->{if(!loading)setBatteryMode(true,on);});
    }

    private void nativeBatterySection(){
        LinearLayout card=ui.card(),body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        boolean active=positionSizeOnly()||nativeBatteryEnabled();
        Switch control=new Switch(this);control.setChecked(active);
        String description=positionSizeOnly()
                ?"仅调整位置和大小模式下使用原生外观，三合一暂时停止显示，已选功能及其配置保留。关闭此模式后可继续切换电池功能。"
                :"开启时自动关闭三合一，可展开设置电池的位置、大小、样式、百分号、固定宽度和不透明度。关闭时不会开启三合一。两项都关闭时恢复默认电池外观与布局，并跟随状态栏整体布局；两边配置均保留。";
        card.addView(ui.featureRow("原生电池图标",description,control),ui.margins(0,4,0,4));card.addView(body);
        if(active){
            LinearLayout root=content;content=body;
            component("battery","显示电池图标");
            // Keep the existing visibility and layout controls inside one outer card.
            LinearLayout settings=(LinearLayout)body.getChildAt(0);body.removeView(settings);
            while(settings.getChildCount()>0){View child=settings.getChildAt(0);settings.removeViewAt(0);body.addView(child);}
            related("battery",body);content=root;
            componentViews.put("battery",card);
        }
        content.addView(card,ui.margins(0,8,0,8));
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
        if(threeInOne){circle=enabled;if(enabled)nativeIcon=false;}
        else{nativeIcon=enabled;if(enabled)circle=false;}
        draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,circle?"1":"0");
        draft.put(ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED,nativeIcon?"1":"0");
        changed();renderKeepingScroll();
        UiKit.Fold active=threeInOne?connectivityFold:nativeBatteryFold;
        if(active!=null)active.show(enabled);
    }

    private void component(String id, String title) {
        LinearLayout card = ui.card(); content.addView(card, ui.margins(0, 8, 0, 8));componentViews.put(id,card);
        StatusBarGridSpec.Item item = grid.get(id);
        boolean circle=id.equals("battery")&&connectivityGroup();
        if(circle){
            card.addView(ui.featureTitle(title,"这里调整三合一图标整体的大小和位置。展开高级设置，可分别调整三个内部区域的内容、位置、大小，以及普通充电闪电和旁路充电插头的样式。"));
        }
        else if(positionSizeOnly())card.addView(ui.featureTitle(title,"保留原生显示状态、行数、字体和图标样式，仅调整整组的位置、大小和顺序。"));
        else{
            String description=id.equals("battery")&&connectivityGroup()?FeatureDescriptions.forKey(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP,title):FeatureDescriptions.statusComponent(id,title);
            Switch visible = new Switch(this);visible.setChecked(itemVisible(id,item));card.addView(ui.featureRow(title,description,visible));
            TextView summary=ui.text(componentSummary(id),11,ui.muted,false);card.addView(summary,ui.margins(0,0,0,6));componentSummaries.put(id,summary);
            LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);card.addView(body);UiKit.Fold fold=ui.fold(visible,body,true);
            componentFolds.put(id,fold);fold.show(Boolean.TRUE.equals(expandedComponents.get(id)));
            card=body;
            visible.setOnCheckedChangeListener((button, checked) -> {fold.sync();updateItem(id,null,-1,-1,checked);});
        }
        if(!positionSizeOnly()&&id.equals("notifications"))toggle(card,ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS,"通知图标分两排");
        if(!positionSizeOnly()&&id.equals("system_icons"))toggle(card,ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS,"系统图标分两排");
        if(!positionSizeOnly()&&id.equals("network")){
            nativeNetworkSize(card);
            card.addView(ui.featureTitle("显示方式", "选择网速显示的上下行组合和排数。上下行同时显示为双排时，会共用该区域的上下两排。"));
            Spinner mode=ui.choiceSpinner("网速显示方式");
            mode.setAdapter(choiceAdapter(StatusBarNetworkDisplay.LABELS));
            mode.setSelection(networkMode()-1);card.addView(mode);
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
        if(!positionSizeOnly()&&id.equals("clock")){
            card.addView(ui.featureTitle("显示排数", "选择时钟使用一排还是上下两排。双排文字需要同时设置第二行格式。"));Spinner rows=ui.choiceSpinner("选择选项");rows.setContentDescription("时钟显示排数");
            rows.setAdapter(choiceAdapter(new String[]{"单排","双排"}));rows.setSelection(number(ConfigSchema.STATUSBAR_CLOCK_ROWS)-1);card.addView(rows);
            rows.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int pos,long rowId){if(!loading&&number(ConfigSchema.STATUSBAR_CLOCK_ROWS)!=pos+1){draft.put(ConfigSchema.STATUSBAR_CLOCK_ROWS,""+(pos+1));changed();renderKeepingScroll();}}});
        }
        Spinner zone = ui.choiceSpinner("显示区域");
        card.addView(ui.featureTitle("显示区域", positionSizeOnly()?"选择整组位于状态栏左侧、中间或右侧。保留原生行数，布局会避开屏幕开孔。":"选择当前组件位于状态栏左侧、中间或右侧，以及上排、下排或跨两排。布局会避开屏幕开孔，并在空间不足时缩小内容。"));
        boolean paired=circle||positionSizeOnly()||isTwoRows(id);
        String[] zones=paired?new String[]{"LS","CS","RS"}:StatusBarGridSpec.ZONES;
        String[] labels=positionSizeOnly()||circle?new String[]{"左侧","中间","右侧"}:paired?new String[]{"左侧（上下两排）","中间（上下两排）","右侧（上下两排）"}:StatusBarGridSpec.ZONE_LABELS;
        zone.setAdapter(choiceAdapter(labels));
        zone.setSelection(java.util.Arrays.asList(zones).indexOf(paired?item.zone.substring(0,1)+"S":item.zone)); card.addView(zone);
        zone.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(AdapterView<?> p, View v, int position, long ignored) {
                String current=grid.get(id).zone;
                if (!(paired?current.substring(0,1)+"S":current).equals(zones[position])) updateItem(id, zones[position], -1, -1, null);
            }
            @Override public void onNothingSelected(AdapterView<?> p) { }
        });
        if(circle)slider(card,"圆形组件大小（dp）",number(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE),18,40,value->{draft.put(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE,""+value);changed();});
        else slider(card, "大小（dp）", item.size, 6, 32, value -> updateItem(id, null, -1, value, null));
        orderControls(card,id);
        if(circle){LinearLayout internal=new LinearLayout(this);internal.setOrientation(LinearLayout.VERTICAL);connectivityControls(internal);advanced(card,"connectivity-internal","高级设置：三合一图标",internal);}
        if(!positionSizeOnly()&&precisionKey(id)!=null){LinearLayout detail=new LinearLayout(this);detail.setOrientation(LinearLayout.VERTICAL);precision(detail,id);advanced(card,"precision-"+id,"高级：小数精度",detail);}
        if(!positionSizeOnly()&&id.equals("network"))related("network",card);
        if(!positionSizeOnly()&&id.equals("clock"))clockConfiguration(card);
    }
    private String componentSummary(String id){
        StatusBarGridSpec.Item item=grid.get(id);
        int zone=java.util.Arrays.asList(StatusBarGridSpec.ZONES).indexOf(item.zone);
        return (itemVisible(id,item)?"已开启":"未开启")+" · "+StatusBarGridSpec.ZONE_LABELS[zone]+" · "+item.size+" dp";
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
    private void orderControls(LinearLayout parent,String id){
        java.util.List<String> ids=regionItems(id);int current=ids.indexOf(id);
        java.util.List<String> labels=new java.util.ArrayList<>();for(String item:ids)labels.add(componentName(item));
        parent.addView(ui.text("同侧顺序："+String.join(" → ",labels),11,ui.muted,false),ui.margins(0,6,0,3));
        LinearLayout actions=new LinearLayout(this);Button before=ui.tonalButton("前移"),after=ui.tonalButton("后移"),drag=ui.tonalButton("拖动排序");
        before.setContentDescription(componentName(id)+"前移");after.setContentDescription(componentName(id)+"后移");
        before.setEnabled(current>0);after.setEnabled(current>=0&&current<ids.size()-1);
        before.setAlpha(before.isEnabled()?1f:.45f);after.setAlpha(after.isEnabled()?1f:.45f);
        addSpacedButton(actions,before);addSpacedButton(actions,after);addSpacedButton(actions,drag);parent.addView(actions);
        before.setOnClickListener(v->moveItem(id,-1));after.setOnClickListener(v->moveItem(id,1));
        drag.setContentDescription(componentName(id)+"同侧拖动排序");drag.setOnClickListener(v->dragOrder(id));
    }
    private void moveItem(String id,int direction){
        java.util.List<String> ids=regionItems(id);int index=ids.indexOf(id),next=index+direction;if(index<0||next<0||next>=ids.size())return;
        java.util.Collections.swap(ids,index,next);
        applyOrder(ids);
    }
    private void applyOrder(java.util.List<String> ids){
        for(int i=0;i<ids.size();i++){String key=ids.get(i);StatusBarGridSpec.Item item=grid.get(key);grid=grid.with(key,new StatusBarGridSpec.Item(item.zone,i*10,item.size,item.visible));}
        changed();renderKeepingScroll();
    }
    private void dragOrder(String id){
        java.util.List<String> ids=regionItems(id);LinearLayout list=new LinearLayout(this);list.setOrientation(LinearLayout.VERTICAL);
        Runnable[] rebuild=new Runnable[1];rebuild[0]=()->{
            list.removeAllViews();list.addView(ui.text("长按项目拖到目标位置，确认后应用。也可关闭此窗口使用前移 / 后移。",12,ui.muted,false));
            for(String item:ids){
                Button row=ui.tonalButton(componentName(item));row.setContentDescription("拖动排序："+componentName(item));list.addView(row,ui.margins(0,8,0,0));
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
        if(number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==2)edit(formats,ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND,"第二行格式，例如 MM/dd E",false);
        formats.addView(ui.featureTitle("时间格式说明", "HH 为 24 小时、hh 为 12 小时；固定文字用单引号。N 农历月、NN 农历月干支、NNN 完整农历日期、NNNN 日期与节气、e 农历日、Y 干支年、A 生肖、t 节气；I 时辰地支、II 时干支（按午夜换日）、aa 中文时段。农历和节气采用香港天文台 1901–2100 年历表，按手机显示的公历日期查询。"));
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
    private void updateItem(String id, String zone, int order, int size, Boolean visible) {
        if (loading) return;
        if (id.equals("notifications") && visible != null)
            draft.put(ConfigSchema.STATUSBAR_NOTIFICATION_HIDE, visible ? "0" : "1");
        if (id.equals("clock") && size >= 0 && !positionSizeOnly()) {
            draft.put(ConfigSchema.STATUSBAR_CLOCK_SIZE_SP, "0");
            if(clockSizeInput!=null&&!clockSizeInput.getText().toString().equals("0"))clockSizeInput.setText("0");
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
    private void toggle(LinearLayout parent,String key, String label) {
        Switch s = new Switch(this);s.setChecked(ConfigSchema.truthy(draft.get(key)));controls.put(key,s);parent.addView(ui.featureRow(label,FeatureDescriptions.forKey(key,label),s),ui.margins(0,4,0,4));
        s.setOnCheckedChangeListener((b, checked) -> { if (!loading) { draft.put(key, checked ? "1" : "0"); changed();
            if(key.equals(ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS)||key.equals(ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS)||key.equals(ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY)||key.equals(ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP))renderKeepingScroll();
        } });
    }
    private void edit(String key, String label) {
        edit(content,key,label,false);
    }
    private EditText edit(LinearLayout parent,String key,String label,boolean numeric) {
        parent.addView(ui.featureTitle(label, FeatureDescriptions.forKey(key,label)));
        EditText e = new EditText(this);ui.styleInput(e); e.setSingleLine(true);e.setContentDescription(label);
        if(numeric)e.setInputType(android.text.InputType.TYPE_CLASS_NUMBER|android.text.InputType.TYPE_NUMBER_FLAG_DECIMAL|android.text.InputType.TYPE_NUMBER_FLAG_SIGNED);
        e.setText(rawInputs.containsKey(key)?rawInputs.get(key):draft.get(key)); parent.addView(e);
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
        clockSizeInput=edit(font,ConfigSchema.STATUSBAR_CLOCK_SIZE_SP,"单独字号 sp（0 使用上方大小）",true);
        font.addView(ui.text("单独字号大于 0 时优先使用；拖动上方大小会重新跟随布局。空间不足时仍会缩小以避免重叠。",11,ui.muted,false));
        edit(font,ConfigSchema.STATUSBAR_CLOCK_WEIGHT,"字重（100–900）",true);
        edit(font,ConfigSchema.STATUSBAR_CLOCK_LETTER_SPACING,"字间距（-0.20 至 1.00）",true);
        font.addView(ui.text("双排时钟与硬件信息使用同一排对齐；两排间距统一在布局分类中调整。",11,ui.muted,false));
        edit(font,ConfigSchema.STATUSBAR_CLOCK_WIDTH_DP,"固定宽度 dp（0 自动）",true);
        font.addView(ui.featureTitle("文字对齐",FeatureDescriptions.forKey(ConfigSchema.STATUSBAR_CLOCK_TEXT_ALIGN,"文字对齐")));
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
        font.addView(align);
        advanced(parent,"clock-typography","高级：字体与排版",font);
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
        return prefix+ls.augment.com.hook.StatusBarMetricsFormatter.number(value,number(precisionKey(id)))+unit;
    }
    private interface ValueChanged { void set(int value); }
    private void number(String key, String label, int min, int max) {
        int value; try { value = Integer.parseInt(draft.get(key)); } catch (Exception e) { value = min; }
        slider(content, label, value, min, max, v -> { draft.put(key, String.valueOf(v)); changed(); });
    }
    private void slider(LinearLayout parent, String label, int value, int min, int max, ValueChanged changed) {
        parent.addView(ui.featureTitle(label,FeatureDescriptions.layoutValue(label)+" 可选范围："+min+"–"+max+"。"));
        TextView text = ui.text("当前：" + value, 12, ui.muted, false); parent.addView(text);
        SeekBar bar = new SeekBar(this); bar.setContentDescription(label); bar.setMax(max - min); bar.setProgress(value - min); parent.addView(bar);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar b, int p, boolean fromUser) {
                text.setText("当前：" + (p + min)); if (fromUser && !loading) changed.set(p + min);
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
        if(masterFold!=null)masterFold.sync();
        if(sectionFold!=null)sectionFold.sync();
        if(connectivityFold!=null)connectivityFold.sync();
        if(nativeBatteryFold!=null)nativeBatteryFold.sync();
        draft.put(ConfigSchema.STATUSBAR_GRID, grid.serialize());
        for(Map.Entry<String,TextView> entry:componentSummaries.entrySet())entry.getValue().setText(componentSummary(entry.getKey()));
        if (preview != null) preview.invalidate();
        if(!loading&&previewBackup==null){dirty=draft.hasPending();main.removeCallbacks(autoSave);main.postDelayed(autoSave,450);}
    }
    private void save() {
        if (previewBackup!=null||!draft.hasPending()) return;main.removeCallbacks(autoSave);
        if(!positionSizeOnly()&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))&&!previewClock().valid){
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
                draft.complete(batch,result.success);saving=false;dirty=draft.hasPending();
                if(isDestroyed())return;
                if(!result.success)Toast.makeText(this,result.message,Toast.LENGTH_LONG).show();
                else if(dirty)main.post(autoSave);
            });
        });
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if(previewBackup!=null)cancelPreset();
        Bundle b = new Bundle(); for (Map.Entry<String, String> e : draft.unsaved().entrySet()) b.putString(e.getKey(), e.getValue());
        state.putBundle("draft-edits", b); state.putInt("tab", tab); super.onSaveInstanceState(state);
        state.putBoolean("connectivity-expanded",connectivityFold!=null?connectivityFold.content.getVisibility()==View.VISIBLE:connectivityExpanded);
        state.putBoolean("native-battery-expanded",nativeBatteryFold!=null?nativeBatteryFold.content.getVisibility()==View.VISIBLE:nativeBatteryExpanded);
        Bundle raw=new Bundle();for(Map.Entry<String,String> entry:rawInputs.entrySet())raw.putString(entry.getKey(),entry.getValue());state.putBundle("raw-inputs",raw);
        for(Map.Entry<String,UiKit.Fold> entry:componentFolds.entrySet())expandedComponents.put(entry.getKey(),entry.getValue().content.getVisibility()==View.VISIBLE);
        for(Map.Entry<String,View> entry:advancedViews.entrySet())advancedExpanded.put(entry.getKey(),entry.getValue().getVisibility()==View.VISIBLE);
        scrollPositions.put(tab,configScroll.getScrollY());state.putString("selected-component",selectedComponent);
        Bundle expanded=new Bundle();for(Map.Entry<String,Boolean> entry:expandedComponents.entrySet())expanded.putBoolean(entry.getKey(),entry.getValue());state.putBundle("expanded-components",expanded);
        Bundle advanced=new Bundle();for(Map.Entry<String,Boolean> entry:advancedExpanded.entrySet())advanced.putBoolean(entry.getKey(),entry.getValue());state.putBundle("advanced-expanded",advanced);
        Bundle positions=new Bundle();for(Map.Entry<Integer,Integer> entry:scrollPositions.entrySet())positions.putInt(String.valueOf(entry.getKey()),entry.getValue());state.putBundle("tab-scroll",positions);
        if(lastLayoutBackup!=null){Bundle undo=new Bundle();for(Map.Entry<String,String> entry:lastLayoutBackup.entrySet())undo.putString(entry.getKey(),entry.getValue());state.putBundle("layout-undo",undo);}
    }
    @Override protected void onPause(){if(previewBackup!=null)cancelPreset();main.removeCallbacks(autoSave);save();super.onPause();}
    @Override public void onDestroy() { main.removeCallbacks(autoSave);save();super.onDestroy(); }

    private ls.augment.com.hook.StatusBarClockFormatter.FormatResult previewClock(){
        return ls.augment.com.hook.StatusBarClockFormatter.formatDetailed(System.currentTimeMillis(),java.util.Locale.getDefault(),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_24H)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_SECONDS)),
                ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_PERIOD)),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_WEEK)),
                draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN),number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==1?"":draft.get(ConfigSchema.STATUSBAR_CLOCK_PATTERN_SECOND));
    }
    private int number(String key){try{return Integer.parseInt(draft.get(key));}catch(Exception ignored){return 0;}}
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
        card.addView(powerPreview);
        String[] titles={"内部上方","内部","内部下方"};
        for(int i=0;i<3;i++){
            final int region=i;String key=ConfigSchema.CONNECTIVITY_CONTENT_KEYS[i];
            LinearLayout settings=new LinearLayout(this);settings.setOrientation(LinearLayout.VERTICAL);
            settings.addView(ui.featureTitle("显示内容","选择此区域的内容，再调整位置和大小。设为“不显示”时保留位置和大小，方便以后重新启用。"));
            Spinner content=ui.choiceSpinner("选择选项");content.setContentDescription(titles[i]+"显示内容");
            content.setAdapter(choiceAdapter(ConfigSchema.CONNECTIVITY_CONTENT_LABELS));
            content.setSelection(Math.max(0,java.util.Arrays.asList(ConfigSchema.CONNECTIVITY_CONTENT_VALUES).indexOf(draft.get(key))));
            settings.addView(content);
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
        if(positionSizeOnly())return false;
        if(id.equals("clock"))return number(ConfigSchema.STATUSBAR_CLOCK_ROWS)==2;
        if(id.equals("network"))return networkMode()==4;
        String key=id.equals("network")?ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS:id.equals("notifications")?ConfigSchema.STATUSBAR_NOTIFICATION_TWO_ROWS:id.equals("system_icons")?ConfigSchema.STATUSBAR_SYSTEM_TWO_ROWS:null;
        return key!=null&&ConfigSchema.truthy(draft.get(key));
    }
    private int networkMode(){return StatusBarNetworkDisplay.resolve(draft.get(ConfigSchema.STATUSBAR_NETWORK_DISPLAY),ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_NETWORK_TWO_ROWS)));}
    private static String baseId(String id){int split=id.indexOf('#');return split<0?id:id.substring(0,split);}
    private float previewTextSize(String id){
        if(id.equals("battery")&&!positionSizeOnly()&&!connectivityGroup()&&!nativeBatteryEnabled())return ui.dp(StatusBarGridSpec.DEFAULT_BATTERY.size);
        if(!positionSizeOnly()&&id.equals("clock")&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
            try{float size=Float.parseFloat(draft.get(ConfigSchema.STATUSBAR_CLOCK_SIZE_SP));
                if(size>0&&size<=40)return android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP,size,getResources().getDisplayMetrics());
            }catch(Exception ignored){}
        }
        return ui.dp(grid.get(id).size);
    }
    private void previewTypeface(Paint paint,String id){
        android.graphics.Typeface typeface=android.graphics.Typeface.DEFAULT;
        if(!positionSizeOnly()&&id.equals("clock")&&ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
            android.graphics.Typeface family=android.graphics.Typeface.create(draft.get(ConfigSchema.STATUSBAR_CLOCK_FONT_FAMILY),android.graphics.Typeface.NORMAL);
            typeface=android.graphics.Typeface.create(family,Math.max(100,Math.min(900,number(ConfigSchema.STATUSBAR_CLOCK_WEIGHT))),false);
        }
        paint.setTypeface(typeface);
    }

    private final class Preview extends View {
        final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Map<String,android.graphics.RectF> hits=new LinkedHashMap<>();
        final class IconSample {
            final String text;final float size;
            IconSample(String text,float size){this.text=text;this.size=size;}
            float width(){p.setTextSize(size);p.setTypeface(android.graphics.Typeface.DEFAULT);return p.measureText(text);}
        }
        Preview() { super(StatusBarEditorController.this); setContentDescription("状态栏示例预览，点击时钟、图标或信息编辑；也可使用下方分类");setClickable(true); }
        @Override public boolean performClick(){super.performClick();return true;}
        @Override public boolean onTouchEvent(android.view.MotionEvent event){
            if(event.getActionMasked()==android.view.MotionEvent.ACTION_UP){
                performClick();String selected=null;float distance=Float.MAX_VALUE;
                for(Map.Entry<String,android.graphics.RectF> entry:hits.entrySet()){
                    android.graphics.RectF r=new android.graphics.RectF(entry.getValue());r.inset(-ui.dp(7),-ui.dp(9));
                    if(!r.contains(event.getX(),event.getY()))continue;
                    float d=Math.abs(entry.getValue().centerX()-event.getX())+Math.abs(entry.getValue().centerY()-event.getY());
                    if(d<distance){distance=d;selected=entry.getKey();}
                }
                if(selected!=null)selectComponent(selected);return true;
            }
            return true;
        }
        @Override protected void onDraw(Canvas c) {
            p.setColor(ui.cardHigh); c.drawRoundRect(0, 0, getWidth(), getHeight(), ui.dp(12), ui.dp(12), p);
            p.setColor(ui.outline); c.drawLine(0, getHeight()/2f, getWidth(), getHeight()/2f, p);
            for (int i = 1; i < 3; i++) c.drawLine(getWidth()*i/3f, 0, getWidth()*i/3f, getHeight(), p);
            java.util.ArrayList<Map.Entry<String, StatusBarGridSpec.Item>> entries = new java.util.ArrayList<>(grid.items().entrySet());
            entries.sort(java.util.Comparator.comparingInt(e -> e.getValue().order));
            java.util.List<StatusBarGridLayout.Node> nodes = new java.util.ArrayList<>();
            java.util.Map<String, String> labels = new java.util.LinkedHashMap<>();
            java.util.Map<String, Float> baselines = new java.util.LinkedHashMap<>();
            java.util.Map<String, java.util.List<IconSample>> iconSamples = new java.util.LinkedHashMap<>();
            for (Map.Entry<String, StatusBarGridSpec.Item> e : entries) {
                StatusBarGridSpec.Item item = e.getValue();
                if(e.getKey().equals("battery")&&!positionSizeOnly()&&!connectivityGroup()&&!nativeBatteryEnabled())item=StatusBarGridSpec.DEFAULT_BATTERY;
                if (!itemVisible(e.getKey(),item)) continue;
                String id = e.getKey();
                if(id.equals("battery")&&connectivityGroup()){
                    float size=ui.dp(number(ConfigSchema.STATUSBAR_CONNECTIVITY_SIZE));
                    nodes.add(new StatusBarGridLayout.Node(id,item.zone.substring(0,1)+"S",item.order,size,size));continue;}
                if(id.equals("system_icons")){
                    java.util.List<IconSample> samples=new java.util.ArrayList<>();float size=previewTextSize(id);
                    if(!connectivityGroup()){samples.add(new IconSample("⌁",size));samples.add(new IconSample("▂▄▆",size));}
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
                    continue;
                }
                String label = id.equals("clock") ? "12:30" : id.equals("network") ? StatusBarNetworkDisplay.format(networkMode(),"12K","36K",draft.get(ConfigSchema.STATUSBAR_NETWORK_UPLOAD_MARK),draft.get(ConfigSchema.STATUSBAR_NETWORK_DOWNLOAD_MARK)) : id.equals("notifications") ? "● ●\n● ●" : id.equals("battery") ? "▱82%" : metricPreview(id);
                if (!positionSizeOnly()&&id.equals("clock") && ConfigSchema.truthy(draft.get(ConfigSchema.STATUSBAR_CLOCK_CUSTOM))){
                    ls.augment.com.hook.StatusBarClockFormatter.FormatResult clock=previewClock();label=clock.valid?clock.text:"格式有误";
                }
                if (positionSizeOnly()||(id.equals("network") && networkMode()!=4)
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
            java.util.Map<String, StatusBarGridLayout.Box> boxes = StatusBarGridLayout.pack(nodes, barWidth, barHeight,
                    ui.dp(4+number(ConfigSchema.STATUSBAR_LEFT_MARGIN_DP)),ui.dp(4+number(ConfigSchema.STATUSBAR_RIGHT_MARGIN_DP)),
                    ui.dp(number(ConfigSchema.STATUSBAR_TOP_MARGIN_DP)),ui.dp(number(ConfigSchema.STATUSBAR_BOTTOM_MARGIN_DP)),
                    positionSizeOnly()?0:ui.dp(number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP)),cutLeft,cutRight);
            float scale=Math.min(getWidth()/barWidth,(getHeight()-ui.dp(8))/barHeight);
            float offsetX=(getWidth()-barWidth*scale)/2,offsetY=(getHeight()-barHeight*scale)/2;
            hits.clear();boolean crowded=false;
            for(Map.Entry<String,StatusBarGridLayout.Box> entry:boxes.entrySet()){
                StatusBarGridLayout.Box b=entry.getValue();String id=baseId(entry.getKey());
                android.graphics.RectF r=new android.graphics.RectF(offsetX+b.x*scale,offsetY+b.y*scale,offsetX+(b.x+b.width)*scale,offsetY+(b.y+b.height)*scale);
                if(hits.containsKey(id))hits.get(id).union(r);else hits.put(id,r);
                if(b.scale<.7f||(!id.equals("battery")&&previewTextSize(id)*b.scale<ui.dp(8)))crowded=true;
            }
            final String feedback=!masterControl.isChecked()?"自定义布局未开启 · 可先查看示例和配置":crowded?"预览较拥挤 · 建议自动整理，或减少内容 / 调整区域":number(ConfigSchema.STATUSBAR_DUAL_ROW_GAP_DP)<0?"自动避让已保护交叠区域 · 原间距配置保留":"自动避让已开启 · 实际效果随通知和数据长度变化";
            if(layoutFeedback!=null&&!feedback.contentEquals(layoutFeedback.getText()))main.post(()->{if(!isDestroyed())layoutFeedback.setText(feedback);});
            c.save();c.translate(offsetX,offsetY);c.scale(scale,scale);
            for (Map.Entry<String, StatusBarGridLayout.Box> e : boxes.entrySet()) {
                StatusBarGridLayout.Box b = e.getValue();
                if(e.getKey().equals("battery")&&connectivityGroup()){
                    drawConnectivity(c,b.x,b.y,b.width,ui.text);continue;}
                java.util.List<IconSample> samples=iconSamples.get(e.getKey());
                if(samples!=null){
                    float x=b.x;p.setColor(ui.text);p.setTextAlign(Paint.Align.LEFT);
                    for(IconSample sample:samples){
                        float width=sample.width()*b.scale,h=sample.size*1.15f*b.scale;
                        p.setTextSize(sample.size*b.scale);c.drawText(sample.text,x,b.y+(b.height-h)/2+h*.82f,p);x+=width+ui.dp(1)*b.scale;
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
    }
}
