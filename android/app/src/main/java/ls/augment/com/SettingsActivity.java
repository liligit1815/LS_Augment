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

/** App-oriented home, module settings and about, with persistent bottom navigation. */
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
    private AboutHeaderMotion aboutMotion;
    private int renderGeneration;
    private TextView runtimeState,rootState;
    private EditText search;
    private String selected=HOME,query="",appearanceSignature;
    private String runtimeText="正在检查模块状态…",rootText="正在读取运行环境";
    private boolean runtimeActive,environmentLoading,requestedRoot,resumedOnce;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN
                | android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        if(state!=null){selected=state.getString("tab",HOME);query=state.getString("query","");for(String tab:new String[]{HOME,SETTINGS,ABOUT})positions.put(tab,state.getInt("scroll_"+tab));}
        if(!Arrays.asList(HOME,SETTINGS,ABOUT).contains(selected))selected=HOME;
        buildScaffold();
        if(Build.VERSION.SDK_INT>=33)getOnBackInvokedDispatcher().registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,this::navigateBack);
        if(OnboardingActivity.needsConsent(this))OnboardingActivity.open(this);
    }
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
    @Override protected void onDestroy(){if(aboutMotion!=null)aboutMotion.dispose();main.removeCallbacksAndMessages(null);worker.shutdownNow();super.onDestroy();}
    private String appearanceKey(){AppConfig c=new AppConfig(this);return c.get(AppearanceOptions.THEME)+":"+c.get(AppearanceOptions.BLUR)+":"+c.get(AppearanceOptions.LIGHT_MASK)+":"+c.get(AppearanceOptions.DARK_MASK);}
    private void buildScaffold(){
        if(aboutMotion!=null){aboutMotion.dispose();aboutMotion=null;}
        ui=new UiKit(this);appearanceSignature=appearanceKey();
        root=new FrameLayout(this);
        scroll=new AboutScrollView(this);scroll.setTag("about-motion-scroll");scroll.setFillViewport(true);scroll.setVerticalScrollBarEnabled(false);scroll.setClipToPadding(false);scroll.setFocusableInTouchMode(true);scroll.setDescendantFocusability(android.view.ViewGroup.FOCUS_BEFORE_DESCENDANTS);
        page=new LinearLayout(this);page.setOrientation(LinearLayout.VERTICAL);page.setPadding(ui.dp(14),ui.dp(10),ui.dp(14),ui.dp(96));
        scroll.addView(page,new ScrollView.LayoutParams(-1,-2));root.addView(scroll,new FrameLayout.LayoutParams(-1,-1));
        navigation=new LiquidGlassLayout(ui,32);navigation.setTag("liquid-glass-navigation");navigation.setGravity(Gravity.CENTER);navigation.setPadding(ui.dp(6),ui.dp(5),ui.dp(6),ui.dp(5));
        if(Build.VERSION.SDK_INT>=28){navigation.setOutlineSpotShadowColor(0x203986bb);navigation.setOutlineAmbientShadowColor(0x203986bb);}
        FrameLayout.LayoutParams nav=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM);nav.setMargins(ui.dp(24),0,ui.dp(24),ui.dp(10));root.addView(navigation,nav);
        ui.setContentView(root);ui.applyGestureInset(root,0,true);renderPage();scroll.requestFocus();
    }
    private void rememberScroll(){if(scroll!=null)positions.put(selected,scroll.getScrollY());}
    private void selectTab(String tab){if(tab.equals(selected))return;rememberScroll();getSystemService(InputMethodManager.class).hideSoftInputFromWindow(scroll.getWindowToken(),0);selected=tab;renderPage();scroll.requestFocus();}
    private void renderPage(){
        if(aboutMotion!=null){aboutMotion.dispose();aboutMotion=null;}
        int generation=++renderGeneration;
        page.removeAllViews();appList=null;search=null;runtimeState=null;rootState=null;
        int position=positions.getOrDefault(selected,0);
        if(ABOUT.equals(selected)) {
            aboutMotion=new AboutHeaderMotion(ui,root,scroll,page,(LiquidGlassLayout)navigation,v->onSystemVersionTapped(),position);
        } else {
        TextView brand=ui.text("LS_Augment",12,ui.accent,true);page.addView(brand,ui.margins(2,2,0,8));
        if(HOME.equals(selected))page.addView(ui.text("让红魔更顺手",12,ui.muted,false),ui.margins(1,0,0,18));
        if(HOME.equals(selected))renderHome();else renderSettings();
        }
        renderNavigation();scroll.post(()->{if(!isDestroyed()&&generation==renderGeneration){scroll.scrollTo(0,position);if(aboutMotion!=null)aboutMotion.apply(scroll.getScrollY());((LiquidGlassLayout)navigation).refreshBackdrop();}});
    }
    private void renderNavigation(){
        navigation.removeAllViews();String[] tabs={HOME,SETTINGS,ABOUT},labels={"主页","设置","关于"};
        for(int i=0;i<tabs.length;i++){
            String tab=tabs[i];boolean active=tab.equals(selected);LinearLayout item=new LinearLayout(this);item.setOrientation(LinearLayout.VERTICAL);item.setGravity(Gravity.CENTER);item.setMinimumHeight(ui.dp(50));item.setPadding(ui.dp(6),ui.dp(4),ui.dp(6),ui.dp(4));
            item.setBackground(ui.pressable(ui.round(Color.TRANSPARENT,24)));
            ImageView icon=new ImageView(this);icon.setImageDrawable(new GlassIcon(tab,active?ui.accent:ui.muted));item.addView(icon,new LinearLayout.LayoutParams(ui.dp(22),ui.dp(22)));
            TextView label=ui.text(labels[i],11,active?ui.accent:ui.muted,active);label.setGravity(Gravity.CENTER);item.addView(label,ui.margins(0,3,0,0));
            item.setContentDescription(labels[i]);item.setSelected(active);item.setClickable(true);item.setFocusable(true);item.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);item.setOnClickListener(v->selectTab(tab));navigation.addView(item,new LinearLayout.LayoutParams(0,-2,1));
            if(active)((LiquidGlassLayout)navigation).select(i,true);
        }
    }
    private void renderHome(){
        LinearLayout box=new LiquidGlassLayout(ui,22,true);box.setGravity(Gravity.CENTER_VERTICAL);box.setPadding(ui.dp(14),ui.dp(2),ui.dp(8),ui.dp(2));
        ImageView magnifier=new ImageView(this);magnifier.setImageDrawable(new GlassIcon("search",ui.muted));box.addView(magnifier,new LinearLayout.LayoutParams(ui.dp(20),ui.dp(20)));
        search=new EditText(this);search.setSingleLine(true);search.setTextSize(12.5f);search.setTextColor(ui.text);search.setHintTextColor(ui.muted);search.setHint("搜索应用或功能");search.setContentDescription("搜索应用或功能");search.setBackgroundColor(Color.TRANSPARENT);search.setPadding(ui.dp(12),ui.dp(12),ui.dp(6),ui.dp(12));search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);search.setText(query);box.addView(search,new LinearLayout.LayoutParams(0,ui.dp(46),1));
        TextView clear=ui.text("清除",12,ui.accent,true);clear.setGravity(Gravity.CENTER);clear.setContentDescription("清除搜索");clear.setVisibility(query.isEmpty()?View.GONE:View.VISIBLE);clear.setOnClickListener(v->search.setText(""));box.addView(clear,new LinearLayout.LayoutParams(ui.dp(48),ui.dp(48)));
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){query=s.toString();clear.setVisibility(query.isEmpty()?View.GONE:View.VISIBLE);renderAppList();}public void afterTextChanged(Editable e){}});
        search.setOnFocusChangeListener((v,focused)->{if(focused)scroll.post(()->scroll.smoothScrollTo(0,Math.max(0,box.getTop()-ui.dp(8))));});
        search.setOnEditorActionListener((v,action,event)->{getSystemService(InputMethodManager.class).hideSoftInputFromWindow(search.getWindowToken(),0);search.clearFocus();return true;});page.addView(box,ui.margins(0,0,0,18));
        appList=new LinearLayout(this);appList.setOrientation(LinearLayout.VERTICAL);page.addView(appList);renderAppList();
    }
    private void renderAppList(){
        if(appList==null)return;appList.removeAllViews();String q=query.trim().toLowerCase(Locale.ROOT);int count=0;
        LinearLayout panel=new LinearLayout(this);panel.setOrientation(LinearLayout.VERTICAL);
        for(HookAppCatalog.Target target:HookAppCatalog.targets()){String match=matchingCopy(target,q);if(match==null)continue;count++;panel.addView(appRow(target,match,q),ui.margins(0,0,0,9));}
        LinearLayout heading=new LinearLayout(this);heading.setGravity(Gravity.CENTER_VERTICAL);heading.addView(ui.text(q.isEmpty()?"应用配置":"搜索结果",13,ui.muted,true),new LinearLayout.LayoutParams(0,-2,1));heading.addView(ui.text(count+" 个应用",11,ui.muted,false));appList.addView(heading,ui.margins(3,0,3,16));
        if(count>0)appList.addView(panel);else{TextView empty=ui.text("没有找到相关应用或功能\n试试“时钟”“音量”或“桌面”",14,ui.muted,false);empty.setGravity(Gravity.CENTER);empty.setPadding(ui.dp(16),ui.dp(34),ui.dp(16),ui.dp(34));appList.addView(empty);}
        if(HiddenEntrySession.isUnlocked()&&q.isEmpty())appList.addView(applicationRow("消失吧APP","应用隐藏、锁屏自动隐藏与快捷磁贴",getPackageName(),getApplicationInfo().loadIcon(getPackageManager()),"hide",v->ModuleNavigation.open(this,"hide")),ui.margins(0,0,0,9));
    }
    private String matchingCopy(HookAppCatalog.Target target,String q){
        if(q.isEmpty()||(target.title+target.summary+String.join(" ",target.packages)).toLowerCase(Locale.ROOT).contains(q))return target.summary;
        for(HookAppCatalog.Section section:HookAppCatalog.sections(target.id))for(EnhancementOption o:section.options)if((o.title+o.summary).toLowerCase(Locale.ROOT).contains(q))return "包含："+o.title;
        for(HookAppCatalog.Entry entry:HookAppCatalog.entries(target.id))if((entry.title+entry.summary).toLowerCase(Locale.ROOT).contains(q))return "包含："+entry.title;
        return null;
    }
    private LinearLayout appRow(HookAppCatalog.Target target,String detail,String q){
        Drawable actual=icons.get(target.id);
        return applicationRow(target.title,detail,(missing.contains(target.id)?"当前设备未安装 · ":"")+target.packageName,actual,target.id,v->ModuleNavigation.openTarget(this,target.id,q));
    }
    private LinearLayout applicationRow(String title,String detail,String packageName,Drawable actual,String id,View.OnClickListener action){
        LinearLayout row=ui.card();row.setOrientation(LinearLayout.HORIZONTAL);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(ui.dp(76));row.setPadding(ui.dp(15),ui.dp(11),ui.dp(12),ui.dp(11));
        ImageView icon=new ImageView(this);
        icon.setTag("hook-app-icon:"+id);icon.setImageDrawable(actual!=null?actual:getPackageManager().getDefaultActivityIcon());
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);icon.setPadding(0,0,0,0);icon.setBackground(null);icon.setImageTintList(null);
        row.addView(icon,new LinearLayout.LayoutParams(ui.dp(43),ui.dp(43)));
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);copy.addView(ui.text(title,15,ui.text,true));TextView summary=ui.text(detail,11.5f,ui.muted,false);summary.setMaxLines(2);copy.addView(summary,ui.margins(0,4,0,0));
        TextView pkg=ui.text(packageName,9.5f,ui.muted,false);pkg.setMaxLines(1);pkg.setEllipsize(android.text.TextUtils.TruncateAt.END);copy.addView(pkg,ui.margins(0,3,0,0));
        LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.setMargins(ui.dp(12),0,ui.dp(8),0);row.addView(copy,p);ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));row.addView(arrow,new LinearLayout.LayoutParams(ui.dp(15),ui.dp(15)));
        row.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));row.setClickable(true);row.setFocusable(true);row.setOnClickListener(action);return row;
    }
    private void renderSettings(){
        group("模块设置");launcherIconSetting();
        group("配置与维护");
        LinearLayout maintenance=ui.card();maintenance.setPadding(ui.dp(12),0,ui.dp(12),0);
        maintenanceRow(maintenance,"导出配置","导出功能设置及自定义资源。","export");
        maintenanceRow(maintenance,"导入配置","选择配置文件，校验并确认后导入。","import");
        maintenanceRow(maintenance,"恢复默认设置","确认后恢复全部模块设置。","reset");
        maintenanceRow(maintenance,"日志及运行诊断","检查框架、系统与桌面兼容性，查看日志与诊断。",null);
        page.addView(maintenance,ui.margins(0,0,0,16));
    }
    private void maintenanceRow(LinearLayout card,String title,String help,String action){
        if(card.getChildCount()>0)card.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
        LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);row.setMinimumHeight(ui.dp(56));
        row.addView(ui.featureTitle(title,help),new LinearLayout.LayoutParams(0,-2,1));
        ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));row.addView(arrow,new LinearLayout.LayoutParams(ui.dp(18),ui.dp(22)));
        row.setBackground(ui.pressable(ui.round(Color.TRANSPARENT,12)));row.setClickable(true);row.setFocusable(true);
        row.setOnClickListener(v->{if(action==null)ModuleNavigation.open(this,"compatibility_help");else startActivity(new Intent(this,ConfigTransferActivity.class).putExtra("action",action));});
        card.addView(row,ui.wrap());
    }
    private void launcherIconSetting(){
        LinearLayout card=settingCard("桌面图标","显示或隐藏 LS_Augment 的桌面入口。隐藏后仍可从 LSPosed 管理器的模块设置进入。","apps");
        Switch toggle=new Switch(this);ui.styleSwitch(toggle);
        toggle.setTag("settings-launcher-icon-switch");toggle.setContentDescription("桌面图标");
        ComponentName alias=new ComponentName(this,getPackageName()+".LauncherAlias");
        PackageManager packages=getPackageManager();
        toggle.setChecked(packages.getComponentEnabledSetting(alias)!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED);
        card.addView(toggle,new LinearLayout.LayoutParams(-2,ui.dp(44)));
        card.addView(ui.switchSlot(),new LinearLayout.LayoutParams(ui.dp(28),ui.dp(44)));
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
        page.addView(card,ui.margins(0,0,0,9));
    }
    private void group(String title){page.addView(ui.text(title,12,ui.muted,true),ui.margins(3,8,0,16));}
    private void setting(String title,String summary,String glyph,String route){
        LinearLayout card=settingCard(title,summary,glyph);
        ImageView arrow=new ImageView(this);arrow.setImageDrawable(new GlassIcon("arrow",ui.muted));card.addView(arrow,new LinearLayout.LayoutParams(ui.dp(15),ui.dp(15)));card.setForeground(ui.pressable(ui.round(Color.TRANSPARENT,22)));card.setClickable(true);card.setFocusable(true);
        card.setOnClickListener(v->ModuleNavigation.open(this,route));page.addView(card,ui.margins(0,0,0,9));
    }
    private LinearLayout settingCard(String title,String summary,String glyph){
        LinearLayout card=ui.card();card.setOrientation(LinearLayout.HORIZONTAL);card.setGravity(Gravity.CENTER_VERTICAL);card.setMinimumHeight(ui.dp(76));
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
    private void refreshEnvironment(){
        if(environmentLoading)return;environmentLoading=true;boolean request=!requestedRoot;requestedRoot=true;
        worker.execute(()->{RootHideManager manager=new RootHideManager(this);RootHideManager.RootStatus root=request?manager.requestRootStatus():manager.rootStatus();
            RootShell.Result posed=root.state==RootHideManager.RootState.GRANTED?RootShell.run("pidof system_server; cat /proc/sys/kernel/random/boot_id",null,6,4096):new RootShell.Result(126,"",false);
            String[] values=posed.output.split("\\r?\\n",2);String pid=values.length>0?values[0].trim():"",boot=values.length>1?values[1].trim():"";
            String witness=getSharedPreferences(AppConfig.DIAGNOSTICS,0).getString("ls_augment_system_server_lifecycle","");boolean active=posed.isSuccess()&&ModuleRuntimeStatus.matches(witness,BuildConfig.VERSION_NAME,pid,boot);
            String status=active?"●  模块已激活":"○  当前版本等待框架加载";String detail=root.state==RootHideManager.RootState.GRANTED?"Root 已授权 · "+BuildConfig.VERSION_NAME:"配置需要 Root 权限 · 点此重新检测";
            main.post(()->{if(isDestroyed())return;environmentLoading=false;runtimeActive=active;runtimeText=status;rootText=detail;if(runtimeState!=null){runtimeState.setText(status);runtimeState.setTextColor(active?ui.cyan:ui.accent);}if(rootState!=null)rootState.setText(detail);});});
    }
}
