package ls.augment.com;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.*;
import java.util.concurrent.*;

/** Task-oriented home, module settings and about, with persistent bottom navigation. */
public final class SettingsActivity extends Activity {
    private static final String HOME="home", SETTINGS="settings", ABOUT="about";
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Map<String,Integer> positions=new HashMap<>();
    private final Map<String,Drawable> icons=new HashMap<>();
    private final Set<String> missing=new HashSet<>();
    private final java.util.concurrent.atomic.AtomicInteger inventoryRequest=new java.util.concurrent.atomic.AtomicInteger();
    private int inventoryGeneration;
    private UiKit ui;
    private LinearLayout page,navigation,appList;
    private AboutScrollView scroll;
    private FrameLayout root;
    private DeviceInfoObserver aboutDeviceObserver;
    private int renderGeneration;
    private TextView runtimeState,rootState;
    private LiquidGlassLayout runtimeCard;
    private boolean rootGranted, environmentKnown;
    private final Runnable environmentChanged=this::refreshEnvironment;
    private EditText search;
    private String selected=HOME,query="",appearanceSignature;
    private String runtimeText="正在检查模块状态…",rootText="正在读取运行环境";
    private boolean runtimeActive,environmentLoading,requestedRoot,resumedOnce;
    private String loadedModuleVersion="";

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                | android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if(state!=null){selected=state.getString("tab",HOME);query=state.getString("query","");for(String tab:new String[]{HOME,SETTINGS,ABOUT})positions.put(tab,state.getInt("scroll_"+tab));}
        else if(getIntent().hasExtra("tab"))selected=getIntent().getStringExtra("tab");
        if(!Arrays.asList(HOME,SETTINGS,ABOUT).contains(selected))selected=HOME;
        buildScaffold();ModuleScopeService.addListener(environmentChanged);
        if(Build.VERSION.SDK_INT>=33)getOnBackInvokedDispatcher().registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,this::navigateBack);
        if(OnboardingActivity.needsConsent(this))OnboardingActivity.open(this);
    }
    @Override protected void onNewIntent(Intent intent){super.onNewIntent(intent);setIntent(intent);String tab=intent.getStringExtra("tab");if(Arrays.asList(HOME,SETTINGS,ABOUT).contains(tab))selectTab(tab);}
    @Override protected void onResume(){
        super.onResume();if(OnboardingActivity.needsConsent(this))return;
        if(resumedOnce){rememberScroll();if(!appearanceKey().equals(appearanceSignature))buildScaffold();else renderPage();}
        resumedOnce=true;
        loadInventory();refreshEnvironment();
    }
    @Override protected void onSaveInstanceState(Bundle state){rememberScroll();state.putString("tab",selected);state.putString("query",query);for(String tab:new String[]{HOME,SETTINGS,ABOUT})state.putInt("scroll_"+tab,positions.getOrDefault(tab,0));super.onSaveInstanceState(state);}
    // Gesture navigation is registered separately with the platform dispatcher.
    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed(){navigateBack();}
    private void navigateBack(){if(!HOME.equals(selected))selectTab(HOME);else if(!query.isEmpty()&&search!=null)search.setText("");else finish();}
    @Override protected void onPause(){if(scroll!=null)scroll.cancelRebound();super.onPause();}
    @Override protected void onDestroy(){closeAboutObserver();ModuleScopeService.removeListener(environmentChanged);main.removeCallbacksAndMessages(null);worker.shutdownNow();super.onDestroy();}
    private String appearanceKey(){AppConfig c=new AppConfig(this);return c.get(AppearanceOptions.THEME)+":"+c.get(AppearanceOptions.BLUR)+":"+c.get(AppearanceOptions.LIGHT_MASK)+":"+c.get(AppearanceOptions.DARK_MASK)+":"+c.get(AppearanceOptions.ANGULAR_CARDS);}
    private void buildScaffold(){
        closeAboutObserver();
        ui=new UiKit(this);appearanceSignature=appearanceKey();
        root=new FrameLayout(this);
        scroll=new AboutScrollView(this);scroll.setTag("main-page-scroll");scroll.setFillViewport(true);scroll.setVerticalScrollBarEnabled(false);scroll.setClipToPadding(false);scroll.setFocusableInTouchMode(true);scroll.setDescendantFocusability(android.view.ViewGroup.FOCUS_BEFORE_DESCENDANTS);
        page=new LinearLayout(this);page.setOrientation(LinearLayout.VERTICAL);page.setPadding(ui.dp(16),ui.dp(8),ui.dp(16),ui.dp(100));
        scroll.addView(page,new ScrollView.LayoutParams(-1,-2));root.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        navigation=new LiquidGlassLayout(ui,33,false,true);navigation.setTag("liquid-glass-navigation");navigation.setGravity(Gravity.CENTER);navigation.setPadding(ui.dp(7),ui.dp(8),ui.dp(7),ui.dp(8));
        ((LiquidGlassLayout)navigation).setNavigationListener(index->selectTab(new String[]{HOME,SETTINGS,ABOUT}[index]));
        ((LiquidGlassLayout)navigation).setFocusListener(this::updateNavigationFocus);
        scroll.setOnScrollChangeListener((v,x,y,oldX,oldY)->refreshPageGlass());
        if(Build.VERSION.SDK_INT>=28){navigation.setOutlineSpotShadowColor(0x203986bb);navigation.setOutlineAmbientShadowColor(0x203986bb);}
        FrameLayout.LayoutParams nav=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM);nav.setMargins(ui.dp(16),0,ui.dp(16),ui.dp(10));root.addView(navigation,nav);
        ui.setContentView(root);ui.applyGestureInset(root,0,true);renderPage();scroll.requestFocus();
    }
    private void rememberScroll(){if(scroll!=null)positions.put(selected,scroll.getScrollY());}
    private void selectTab(String tab){if(tab.equals(selected))return;rememberScroll();getSystemService(InputMethodManager.class).hideSoftInputFromWindow(scroll.getWindowToken(),0);selected=tab;renderPage();scroll.requestFocus();}
    private void renderPage(){
        closeAboutObserver();
        int generation=++renderGeneration;
        page.removeAllViews();appList=null;search=null;runtimeState=null;rootState=null;runtimeCard=null;
        // All three destinations share the same heading and status-bar spacing.
        page.setPadding(ui.dp(16),ui.dp(8),ui.dp(16),ui.dp(100));
        int position=positions.getOrDefault(selected,0);
        renderBrandHeading();
        if(HOME.equals(selected))renderHome();else if(SETTINGS.equals(selected))renderSettings();else renderAbout();
        renderNavigation();scroll.post(()->{if(!isDestroyed()&&generation==renderGeneration){scroll.scrollTo(0,position);refreshPageGlass();}});
    }
    private void renderAbout(){
        View hardware=ModuleAbout.appendCards(this,ui,page,v->onSystemVersionTapped());
        aboutDeviceObserver=DeviceInfoObserver.watch(this,()->{
            if(!isDestroyed()&&ABOUT.equals(selected)){ModuleAbout.refreshDevice(this,hardware);refreshPageGlass();}
        });
    }
    private void closeAboutObserver(){
        if(aboutDeviceObserver!=null){aboutDeviceObserver.close();aboutDeviceObserver=null;}
    }
    private void refreshPageGlass(){
        if(page==null||scroll==null||navigation==null)return;
        for(int i=0;i<page.getChildCount();i++){
            View child=page.getChildAt(i);
            if(child instanceof LiquidGlassLayout&&child.getBottom()>scroll.getScrollY()
                    &&child.getTop()<scroll.getScrollY()+scroll.getHeight())((LiquidGlassLayout)child).refreshBackdrop();
        }
        ((LiquidGlassLayout)navigation).refreshBackdrop();
    }
    private void renderBrandHeading(){
        page.addView(ui.brandHeading(),ui.margins(6,4,0,22));
    }
    private void renderNavigation(){
        String[] tabs={HOME,SETTINGS,ABOUT},labels={"主页","模块","关于"};
        if(navigation.getChildCount()==tabs.length){
            for(int i=0;i<tabs.length;i++){
                LinearLayout item=(LinearLayout)navigation.getChildAt(i);boolean active=tabs[i].equals(selected);
                item.setSelected(active);
                if(active)((LiquidGlassLayout)navigation).select(i,true);
            }return;
        }
        for(int i=0;i<tabs.length;i++){
            String tab=tabs[i];boolean active=tab.equals(selected);LinearLayout item=new LinearLayout(this);item.setOrientation(LinearLayout.VERTICAL);item.setGravity(Gravity.CENTER);item.setMinimumHeight(ui.dp(50));item.setPadding(ui.dp(6),ui.dp(4),ui.dp(6),ui.dp(4));
            item.setBackground(ui.pressable(ui.round(Color.TRANSPARENT,28)));
            ImageView icon=new ImageView(this);icon.setTag("navigation-icon:"+tab);icon.setImageDrawable(new GlassIcon(SETTINGS.equals(tab)?"module":tab,active?ui.accent:ui.muted));item.addView(icon,new LinearLayout.LayoutParams(ui.dp(22),ui.dp(22)));
            TextView label=ui.text(labels[i],11,active?ui.accent:ui.muted,active);label.setGravity(Gravity.CENTER);item.addView(label,ui.margins(0,3,0,0));
            item.setContentDescription(labels[i]);item.setSelected(active);item.setClickable(true);item.setFocusable(true);item.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);item.setOnClickListener(v->selectTab(tab));navigation.addView(item,new LinearLayout.LayoutParams(0,-2,1));
            if(active)((LiquidGlassLayout)navigation).select(i,true);
        }
    }
    private void updateNavigationFocus(int focus){
        String[] tabs={HOME,SETTINGS,ABOUT};
        for(int i=0;i<navigation.getChildCount();i++){
            LinearLayout item=(LinearLayout)navigation.getChildAt(i);boolean active=i==focus;
            ((ImageView)item.getChildAt(0)).setImageDrawable(new GlassIcon(SETTINGS.equals(tabs[i])?"module":tabs[i],active?ui.accent:ui.muted));
            TextView label=(TextView)item.getChildAt(1);label.setTextColor(active?ui.accent:ui.muted);
            label.setTypeface(null,active?android.graphics.Typeface.BOLD:android.graphics.Typeface.NORMAL);
        }
    }
    private void renderHome(){
        LinearLayout box=new LiquidGlassLayout(ui,4,true);box.setGravity(Gravity.CENTER_VERTICAL);box.setPadding(ui.dp(14),0,ui.dp(8),0);
        ImageView magnifier=new ImageView(this);magnifier.setImageDrawable(new GlassIcon("search",ui.muted));box.addView(magnifier,new LinearLayout.LayoutParams(ui.dp(20),ui.dp(20)));
        search=new EditText(this);search.setSingleLine(true);search.setTextSize(14.5f);search.setTextColor(ui.text);search.setHintTextColor(ui.muted);search.setHint("搜索分组或功能");search.setContentDescription("搜索分组或功能");search.setBackgroundColor(Color.TRANSPARENT);search.setPadding(ui.dp(12),ui.dp(12),ui.dp(6),ui.dp(12));search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);search.setText(query);box.addView(search,new LinearLayout.LayoutParams(0,ui.dp(48),1));
        TextView clear=ui.text("清除",12,ui.accent,true);clear.setGravity(Gravity.CENTER);clear.setContentDescription("清除搜索");clear.setVisibility(query.isEmpty()?View.GONE:View.VISIBLE);clear.setOnClickListener(v->search.setText(""));box.addView(clear,new LinearLayout.LayoutParams(ui.dp(48),ui.dp(48)));
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){query=s.toString();clear.setVisibility(query.isEmpty()?View.GONE:View.VISIBLE);renderAppList();}public void afterTextChanged(Editable e){}});
        search.setOnFocusChangeListener((v,focused)->{if(focused)scroll.post(()->scroll.smoothScrollTo(0,Math.max(0,box.getTop()-ui.dp(8))));});
        search.setOnEditorActionListener((v,action,event)->{getSystemService(InputMethodManager.class).hideSoftInputFromWindow(search.getWindowToken(),0);search.clearFocus();return true;});page.addView(box,ui.margins(0,0,0,12));
        appList=new LinearLayout(this);appList.setOrientation(LinearLayout.VERTICAL);page.addView(appList);renderAppList();
    }
    private void renderRuntimeCard(){
        runtimeCard=new LiquidGlassLayout(ui,4,true);runtimeCard.setTag("module-runtime-card");runtimeCard.setGravity(Gravity.CENTER_VERTICAL);runtimeCard.setPadding(ui.dp(12),ui.dp(8),ui.dp(12),ui.dp(8));runtimeCard.setMinimumHeight(ui.dp(78));
        ImageView health=new ImageView(this);health.setImageResource(R.drawable.module_status);health.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);runtimeCard.addView(health,new LinearLayout.LayoutParams(ui.dp(46),ui.dp(46)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.text("模块状态",15,ui.text,true));
        runtimeState=ui.text("正在读取 LSP 与 ROOT 状态…",12,ui.muted,false);copy.addView(runtimeState,ui.margins(0,3,0,0));
        rootState=ui.text("",12,ui.muted,false);copy.addView(rootState,ui.margins(0,3,0,0));LinearLayout.LayoutParams cp=new LinearLayout.LayoutParams(0,-2,1);cp.leftMargin=ui.dp(12);runtimeCard.addView(copy,cp);
        runtimeCard.setOnClickListener(v->{requestedRoot=false;refreshEnvironment();});runtimeCard.setContentDescription("模块状态，点按刷新权限");page.addView(runtimeCard,ui.margins(0,0,0,12));applyEnvironment();

    }
    private void renderAppList(){
        if(appList==null)return;appList.removeAllViews();String q=query.trim().toLowerCase(Locale.ROOT);int count=0;
        LinearLayout panel=ui.card();panel.setTag("home-app-groups");panel.setPadding(ui.dp(14),0,ui.dp(14),0);panel.setOrientation(LinearLayout.VERTICAL);
        if(q.isEmpty())for(ModulePresentationCatalog.Category category:ModulePresentationCatalog.categories()){
            if(count++>0)panel.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
            Drawable icon=icons.get(category.icon);
            LinearLayout row=applicationRow(category.title,icon!=null?icon:new GlassIcon("system",ui.accent),category.id,v->openHomeRoute(category.route()));
            row.setTag("home-category:"+category.id);panel.addView(row,ui.wrap());
        }else for(ModuleFeatureSearch.Result result:ModuleFeatureSearch.search(q,HiddenEntrySession.isUnlocked())){
            if(count++>0)panel.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
            View row=ui.preferenceRow(result.route,result.title,result.path,()->openHomeRoute(result.route));
            row.setTag("search-result:"+result.route);panel.addView(row,ui.wrap());
        }
        if(count>0)appList.addView(panel);else{TextView empty=ui.text("没有找到相关分组或功能\n试试“时钟”“USB”或“截图”",14,ui.muted,false);empty.setGravity(Gravity.CENTER);empty.setPadding(ui.dp(16),ui.dp(34),ui.dp(16),ui.dp(34));appList.addView(empty);}
    }
    private void openHomeRoute(String route){
        getSystemService(InputMethodManager.class).hideSoftInputFromWindow(search.getWindowToken(),0);
        query="";search.clearFocus();ModuleNavigation.open(this,route);
    }
    private LinearLayout applicationRow(String title,Drawable actual,String id,View.OnClickListener action){
        LinearLayout row=ui.groupRow();row.setPadding(0,ui.dp(4),0,ui.dp(4));
        ImageView icon=new ImageView(this);
        icon.setTag("hook-app-icon:"+id);icon.setImageDrawable(actual!=null?actual:getPackageManager().getDefaultActivityIcon());
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);icon.setPadding(0,0,0,0);icon.setBackground(null);icon.setImageTintList(null);
        icon.setScaleX(.87f);icon.setScaleY(.87f);
        row.addView(icon,new LinearLayout.LayoutParams(ui.dp(40),ui.dp(40)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.text(title,15,ui.text,true));
        LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(ui.dp(12),0,ui.dp(8),0);row.addView(copy,p);ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));row.addView(arrow,new LinearLayout.LayoutParams(ui.dp(15),ui.dp(15)));
        row.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));row.setClickable(true);row.setFocusable(true);row.setOnClickListener(action);return row;
    }
    private void renderSettings(){
        renderRuntimeCard();
        group("模块设置");LinearLayout settings=ui.card();settings.setPadding(ui.dp(16),0,ui.dp(16),0);
        launcherIconSetting(settings);settings.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));angularCardSetting(settings);
        page.addView(settings,ui.margins(0,0,0,9));
        group("配置管理");LinearLayout maintenance=ui.card();maintenance.setPadding(ui.dp(16),0,ui.dp(16),0);
        maintenanceRow(maintenance,"导出配置","保存设置与自定义资源","export");
        maintenanceRow(maintenance,"导入配置","选择备份文件","import");
        maintenanceRow(maintenance,"重置配置","恢复默认设置并清除模块信息","reset");page.addView(maintenance,ui.margins(0,0,0,16));
        group("日志");LinearLayout logs=ui.card();logs.setPadding(ui.dp(16),0,ui.dp(16),0);
        maintenanceRow(logs,"导出日志","设备、权限、功能配置与运行记录","logs");page.addView(logs,ui.wrap());
    }
    private void maintenanceRow(LinearLayout card,String title,String help,String action){
        if(card.getChildCount()>0)card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        LinearLayout row=ui.groupRow();
        ImageView icon=new ImageView(this);icon.setImageDrawable(new GlassIcon("reset".equals(action)?"reset":"import".equals(action)?"upload":"download",ui.accent));row.addView(icon,new LinearLayout.LayoutParams(ui.dp(28),ui.dp(28)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.text(title,15,"reset".equals(action)?0xffa56515:ui.text,true));copy.addView(ui.text(help,12,ui.muted,false),ui.margins(0,4,0,0));LinearLayout.LayoutParams cp=new LinearLayout.LayoutParams(0,-2,1);cp.leftMargin=ui.dp(12);row.addView(copy,cp);
        row.setBackground(ui.pressable(ui.round(Color.TRANSPARENT,4)));row.setContentDescription(title);row.setClickable(true);row.setFocusable(true);
        row.setOnClickListener(v->{if("logs".equals(action))startActivity(new Intent(this,LogExportActivity.class));else startActivity(new Intent(this,ConfigTransferActivity.class).putExtra("action",action));});card.addView(row,ui.wrap());
    }
    private void launcherIconSetting(LinearLayout parent){
        LinearLayout card=moduleSettingRow("桌面图标","显示或隐藏 红魔Duo 的桌面入口。隐藏后仍可从 LSPosed 管理器的模块设置进入。","apps");
        Switch toggle=new Switch(this);ui.styleSwitch(toggle);

        toggle.setTag("settings-launcher-icon-switch");toggle.setContentDescription("桌面图标");
        ComponentName alias=new ComponentName(this,getPackageName()+".LauncherAlias");
        PackageManager packages=getPackageManager();
        toggle.setChecked(packages.getComponentEnabledSetting(alias)!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED);
        card.addView(toggle,new LinearLayout.LayoutParams(-2,ui.dp(44)));
        card.addView(ui.switchSlot(),new LinearLayout.LayoutParams(ui.dp(25),ui.dp(44)));
        boolean[] binding={false};
        toggle.setOnCheckedChangeListener((button,visible)->{
            if(binding[0])return;
            try {
                packages.setComponentEnabledSetting(alias,visible?PackageManager.COMPONENT_ENABLED_STATE_ENABLED:
                        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,PackageManager.DONT_KILL_APP);
            } catch(RuntimeException error) {
                binding[0]=true;
                try { toggle.setChecked(packages.getComponentEnabledSetting(alias)!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED); }
                finally { binding[0]=false; }
                Toast.makeText(this,"桌面图标未能更新，请重试",Toast.LENGTH_SHORT).show();
            }
        });
        card.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));card.setClickable(true);
        card.setOnClickListener(v->toggle.toggle());
        parent.addView(card,ui.wrap());
    }
    private void angularCardSetting(LinearLayout parent){
        LinearLayout card=moduleSettingRow("棱角卡片","开启时使用小圆角棱角卡片，关闭时使用圆角卡片。立即应用于模块所有页面。","card-corners");
        Switch toggle=new Switch(this);ui.styleSwitch(toggle);

        toggle.setTag("settings-angular-cards-switch");toggle.setContentDescription("棱角卡片");
        toggle.setChecked(ui.angularCards);
        card.addView(toggle,new LinearLayout.LayoutParams(-2,ui.dp(44)));
        card.addView(ui.switchSlot(),new LinearLayout.LayoutParams(ui.dp(25),ui.dp(44)));
        boolean[] binding={false};
        toggle.setOnCheckedChangeListener((button,angular)->{
            if(binding[0])return;
            AppConfig.SaveResult saved=new AppConfig(this).save(Collections.singletonMap(AppearanceOptions.ANGULAR_CARDS,angular?"1":"0"));
            if(!saved.success){binding[0]=true;toggle.setChecked(ui.angularCards);binding[0]=false;Toast.makeText(this,saved.message,Toast.LENGTH_SHORT).show();return;}
            rememberScroll();buildScaffold();
        });
        card.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,4)));card.setClickable(true);
        card.setOnClickListener(v->toggle.toggle());parent.addView(card,ui.wrap());
    }
    private LinearLayout moduleSettingRow(String title,String summary,String glyph){
        LinearLayout row=ui.groupRow();
        ImageView icon=new ImageView(this);icon.setImageDrawable(new GlassIcon(glyph,ui.accent));icon.setPadding(ui.dp(8),ui.dp(8),ui.dp(8),ui.dp(8));icon.setBackground(ui.round(ui.accentContainer,12));row.addView(icon,new LinearLayout.LayoutParams(ui.dp(38),ui.dp(38)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.featureTitle(title,summary));LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(ui.dp(12),0,ui.dp(6),0);row.addView(copy,p);
        return row;
    }
    private void group(String title){page.addView(ui.text(title,12,ui.muted,true),ui.margins(3,8,0,16));}
    private void setting(String title,String summary,String glyph,String route){
        LinearLayout card=settingCard(title,summary,glyph);
        ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));card.addView(arrow,new LinearLayout.LayoutParams(ui.dp(15),ui.dp(15)));card.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));card.setClickable(true);card.setFocusable(true);
        card.setOnClickListener(v->ModuleNavigation.open(this,route));page.addView(card,ui.margins(0,0,0,9));
    }
    private LinearLayout settingCard(String title,String summary,String glyph){
        LinearLayout card=ui.card();card.setOrientation(LinearLayout.HORIZONTAL);card.setGravity(Gravity.CENTER_VERTICAL);card.setPadding(ui.dp(16),ui.dp(2),ui.dp(16),ui.dp(2));card.setMinimumHeight(ui.dp(48));
        ImageView icon=new ImageView(this);icon.setImageDrawable(new GlassIcon(glyph,ui.accent));icon.setPadding(ui.dp(8),ui.dp(8),ui.dp(8),ui.dp(8));icon.setBackground(ui.round(ui.accentContainer,12));card.addView(icon,new LinearLayout.LayoutParams(ui.dp(38),ui.dp(38)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.featureTitle(title,summary));LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(ui.dp(12),0,ui.dp(6),0);card.addView(copy,p);
        return card;
    }
    private void onSystemVersionTapped(){if(!ABOUT.equals(selected))return;HiddenEntrySession.TapResult result=HiddenEntrySession.recordSystemVersionTap(SystemClock.uptimeMillis());if(result==HiddenEntrySession.TapResult.NONE)return;Toast.makeText(this,"完整功能已开放",Toast.LENGTH_SHORT).show();}
    int iconGeneration(){return inventoryGeneration;}
    private void loadInventory(){
        int request=inventoryRequest.incrementAndGet();
        worker.execute(()->{
            if(request!=inventoryRequest.get())return;
            Map<String,Drawable> found=new HashMap<>();Set<String> absent=new HashSet<>();
            for(HookAppCatalog.Target target:HookAppCatalog.targets()){
                boolean installed=false;
                for(String scope:target.packages)try{
                    // The RedMagic PackageManager applies the current icon theme itself.
                    // "system" is a hook scope, while its display icon belongs to Android.
                    String pkg="system".equals(scope)?"android":scope;
                    found.put(target.id,getPackageManager().getApplicationIcon(pkg));installed=true;break;
                }catch(android.content.pm.PackageManager.NameNotFoundException ignored){}
                catch(RuntimeException unavailable){
                    found.put(target.id,getPackageManager().getDefaultActivityIcon());installed=true;break;
                }
                if(!installed)absent.add(target.id);
            }
            main.post(()->{
                if(isDestroyed()||request!=inventoryRequest.get())return;
                icons.clear();icons.putAll(found);missing.clear();missing.addAll(absent);inventoryGeneration=request;
                renderAppList();((LiquidGlassLayout)navigation).refreshBackdrop();
            });
        });
    }
    private void applyEnvironment(){
        if(runtimeCard==null)return;
        if(environmentLoading||!environmentKnown){runtimeState.setText("正在读取 LSP 与 ROOT 状态…");return;}
        ModuleEnvironmentState state=ModuleEnvironmentState.of(runtimeActive,rootGranted,
                BuildConfig.VERSION_NAME.equals(loadedModuleVersion));
        runtimeCard.setSurfaceTint(state.tint);runtimeState.setText(state.summary);rootState.setText(state.message);
        boolean healthy=runtimeActive&&rootGranted&&BuildConfig.VERSION_NAME.equals(loadedModuleVersion);
        int foreground=healthy?ui.muted:ui.dark?(runtimeActive||rootGranted?ui.warning:ui.danger):state.foreground;runtimeState.setTextColor(foreground);rootState.setTextColor(foreground);
    }
    private void refreshEnvironment(){
        if(environmentLoading||isDestroyed())return;environmentLoading=true;boolean request=!requestedRoot;requestedRoot=true;applyEnvironment();
        worker.execute(()->{
            RootHideManager manager=new RootHideManager(this);RootHideManager.RootStatus root=request?manager.requestRootStatus():manager.rootStatus();
            boolean granted=root.state==RootHideManager.RootState.GRANTED;
            boolean active=RuntimeEnvironment.injected(this);
            String loadedVersion=active?BuildConfig.VERSION_NAME:"";
            if(!active&&granted){RootShell.Result probe=RootShell.run("pidof system_server; cat /proc/sys/kernel/random/boot_id",null,6,4096);String[] values=probe.output.split("\\r?\\n",2);
                String witness=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString("ls_augment_system_server_lifecycle","");
                active=probe.isSuccess()&&values.length==2&&ModuleRuntimeStatus.matches(witness,BuildConfig.VERSION_NAME,values[0].trim(),values[1].trim());
                if(active)loadedVersion=BuildConfig.VERSION_NAME;
                else if(probe.isSuccess()&&values.length==2){loadedVersion=RuntimeEnvironment.telemetryVersion(this,values[0].trim());active=!loadedVersion.isEmpty();}}
            boolean injected=active;String observedVersion=loadedVersion;
            main.post(()->{if(isDestroyed())return;environmentLoading=false;environmentKnown=true;runtimeActive=injected;loadedModuleVersion=observedVersion;rootGranted=granted;applyEnvironment();});
        });
    }
}
