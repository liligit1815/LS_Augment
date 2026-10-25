package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.PopupWindow;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Multi-space hide, recovery and automation manager. */
public class HideAppsActivity extends Activity implements ModuleNavigation.AncestorHandler {

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final ExecutorService actionExecutor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<RootHideManager.Target> selected = new LinkedHashSet<>();
    private final Set<RootHideManager.Target> savedTargets = new LinkedHashSet<>();
    private final List<AppItem> loaded = new ArrayList<>();
    private UiKit ui;
    private AppConfig config;
    private RootHideManager manager;
    private TextView environment;
    private TextView summary;
    private TextView userStatus;
    private Button spaceSelector, refreshAppsButton, chooseAppsButton;
    private ImageButton appsExpand;
    private PopupWindow spacePopup;
    private LinearLayout appConfigBody;
    private TextView saveStatus;
    private boolean allSpaces = true;
    private LinearLayout appBrowser;
    private LinearLayout appList;
    private LinearLayout retainedList;
    private LinearLayout appsPanel;
    private LinearLayout automationPanel;
    private LinearLayout tilePanel;
    private EditText search;
    private EditText tileLabel;
    private EditText tileDescription;
    private Switch master;
    private Switch automationEnabled;
    private Switch tileEnabled;
    private Switch automationAllUsers;
    private Button hideAllButton, showAllButton;
    private Button sort;
    private List<RootHideManager.UserRecord> userRecords = new ArrayList<>();
    private UserResolution currentUser = UserResolution.failure("尚未检测当前用户");
    private int activeUserId = -1;
    private long activeUserSerial = -1;
    private long appLoadGeneration;
    private String selectionProblem = "正在读取应用名单…";
    private boolean selectionReady, selectionLoading;
    private long selectionRevision = -1;
    private boolean loading = true;
    private boolean dirty;
    private long editGeneration;
    private boolean saving, saveFailed;
    private UiKit.Fold automationFold, tileFold;
    private final List<Button> filterButtons = new ArrayList<>();
    private int listFilter;
    private boolean rootReady, rootGranted, checkingEnvironment, updatingControls;
    private String rootProblem = "正在检查运行条件，请稍候";
    private ScrollView pageScroll;
    private Bundle restoredState, pendingDraft;
    private Runnable leaveAction;
    private boolean automationReady, automationNeedsScope;
    private String automationProblem="正在检查系统作用域";
    private TileImageEditor tileImage;
    private final Runnable autoSave = () -> { if (dirty) saveSettings(); };
    private boolean sortByInstall;
    private boolean operating, resultDialogVisible;
    private TextView operationStatus, automationStatus, tileStatus;
    private Dialog actionDialog;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        restoredState = state;
        pendingDraft=state!=null&&state.containsKey("hide-draft-selection")?new Bundle(state):null;
        ui = new UiKit(this);
        config = new AppConfig(this);
        manager = new RootHideManager(this);
        build();
        inspectEnvironment();
        loadSelection();
        loadUsers();
        registerSystemBackCallback();
    }

    @Override protected void onPause() { if(spacePopup!=null){spacePopup.dismiss();spacePopup=null;} if(actionDialog!=null){actionDialog.dismiss();actionDialog=null;} if (dirty && !saving) saveSettings(); main.removeCallbacks(autoSave); super.onPause(); }
    @Override protected void onDestroy() { executor.shutdown(); actionExecutor.shutdown(); super.onDestroy(); }

    // Gesture navigation is registered separately with the platform dispatcher.
    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() { requestLeave(() -> super.finish()); }

    private void registerSystemBackCallback() {
        {}
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                () -> requestLeave(() -> super.finish()));
    }

    @Override protected void onResume() {
        super.onResume();
        if (!HiddenEntrySession.isUnlocked()) { finish(); return; }
        if (manager != null && appList != null && !loading) {
            inspectEnvironment();
            if (!dirty && !saving) loadSelection();
            refreshAppStates();
        }
    }

    private void build() {
        LinearLayout page=ui.detailPage(ModuleHierarchy.title(ModuleNavigation.route(this)),null);
        page.setTag("hide-management");
        pageScroll=(ScrollView)page.getParent();
        LinearLayout masterCard=ui.preferenceCard();
        masterCard.addView(switchRow("应用隐藏",
                "开启后可手动隐藏已配置应用。关闭不自动显示应用，名单与显示操作仍可使用。",
                master=new Switch(this),config.getBoolean(AppConfig.HIDE_MASTER)),ui.wrap());
        // Running-condition detail belongs in help and action feedback, not below the switch.
        environment=ui.text("",12,ui.muted,false);
        page.addView(masterCard,ui.wrap());

        appsPanel=ui.preferenceCard();appsPanel.setTag("hide-app-management");
        appConfigBody=new LinearLayout(this);appConfigBody.setOrientation(LinearLayout.VERTICAL);
        LinearLayout listTools=new LinearLayout(this);listTools.setOrientation(LinearLayout.VERTICAL);
        LinearLayout listSection=ui.foldingSection("应用名单",listTools,appConfigBody,false);
        listTools.setPadding(ui.dp(12),0,ui.dp(8),0);
        LinearLayout listHeading=(LinearLayout)listSection.getChildAt(0);
        listHeading.setTag("hide-list-header");
        appsExpand=(ImageButton)listHeading.getChildAt(listHeading.getChildCount()-1);
        appsExpand.setTag("hide-list-toggle");
        summary=ui.text("正在读取…",12,ui.muted,false);summary.setMaxLines(2);
        summary.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        listHeading.addView(summary,listHeading.getChildCount()-1,new LinearLayout.LayoutParams(-2,-2));
        appsExpand.setOnClickListener(v->showAppList(appConfigBody.getVisibility()!=View.VISIBLE));
        listHeading.setOnClickListener(v->showAppList(appConfigBody.getVisibility()!=View.VISIBLE));

        LinearLayout spaceRow=new LinearLayout(this);spaceRow.setGravity(Gravity.CENTER_VERTICAL);
        spaceSelector=ui.button("全部空间 ▾");spaceSelector.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
        spaceSelector.setOnClickListener(v->showSpaceChoices());
        spaceRow.addView(spaceSelector,new LinearLayout.LayoutParams(0,-2,1));
        refreshAppsButton=ui.tonalButton("刷新");
        refreshAppsButton.setContentDescription("重新检查运行条件并刷新当前范围的应用");
        refreshAppsButton.setOnClickListener(v->{
            if(loading||operating)return;
            inspectEnvironment(true);
            if(!selectionReady&&!saving)loadSelection();
            loadUsers();
        });
        LinearLayout.LayoutParams refreshParams=new LinearLayout.LayoutParams(-2,-2);
        refreshParams.leftMargin=ui.dp(8);spaceRow.addView(refreshAppsButton,refreshParams);
        listTools.addView(spaceRow,ui.margins(0,6,0,6));
        hideAllButton=ui.accentButton("全部隐藏");showAllButton=ui.tonalButton("全部显示");
        hideAllButton.setOnClickListener(v->confirmAction("隐藏已配置应用","隐藏后应用将停止运行，应用数据保留。",true));
        showAllButton.setOnClickListener(v->confirmAction("显示已配置应用","恢复应用的显示状态，应用数据保留。",false));
        chooseAppsButton=ui.button("选择应用");chooseAppsButton.setTag("hide-choose-apps");
        chooseAppsButton.setOnClickListener(v->{listFilter=2;showAppList(true);});
        LinearLayout actions=new LinearLayout(this);actions.setTag("hide-batch-actions");
        Button[] actionButtons={hideAllButton,showAllButton,chooseAppsButton};
        for(int i=0;i<actionButtons.length;i++){
            Button action=actionButtons[i];action.setMinimumHeight(ui.dp(48));
            action.setPadding(ui.dp(4),ui.dp(8),ui.dp(4),ui.dp(8));
            LinearLayout.LayoutParams ap=new LinearLayout.LayoutParams(0,-2,1);
            if(i>0)ap.leftMargin=ui.dp(6);actions.addView(action,ap);
        }
        listTools.addView(actions,ui.margins(0,0,0,8));
        userStatus=ui.text("正在核验用户空间…",11,ui.muted,false);
        userStatus.setVisibility(View.GONE);listTools.addView(userStatus,ui.margins(0,4,0,8));
        operationStatus=ui.text("",12,ui.accent,false);operationStatus.setTag("hide-operation-status");
        operationStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        operationStatus.setVisibility(View.GONE);listTools.addView(operationStatus,ui.margins(0,0,0,8));
        saveStatus=ui.text("",12,ui.muted,false);saveStatus.setVisibility(View.GONE);
        saveStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        saveStatus.setOnClickListener(v->{if(dirty&&!saving)saveSettings();});listTools.addView(saveStatus,ui.margins(0,0,0,8));

        LinearLayout searchRow=new LinearLayout(this);searchRow.setGravity(Gravity.CENTER_VERTICAL);
        search=new EditText(this);search.setHint("搜索应用名称或包名");search.setSingleLine(true);
        search.setContentDescription("搜索应用名称或包名");ui.styleInput(search);
        search.addTextChangedListener(new TextWatcher(){
            @Override public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            @Override public void onTextChanged(CharSequence s,int start,int before,int count){renderApps();}
            @Override public void afterTextChanged(Editable s){}
        });
        searchRow.addView(search,new LinearLayout.LayoutParams(0,-2,1));
        sort=ui.button("名称排序");sort.setTag("hide-sort");
        sort.setOnClickListener(v->{sortByInstall=!sortByInstall;sort.setText(sortByInstall?"时间排序":"名称排序");renderApps();});
        LinearLayout.LayoutParams sortParams=new LinearLayout.LayoutParams(-2,-2);sortParams.leftMargin=ui.dp(6);
        searchRow.addView(sort,sortParams);appConfigBody.addView(searchRow,ui.margins(0,0,0,8));
        LinearLayout filters=new LinearLayout(this);filters.setGravity(Gravity.CENTER_VERTICAL);
        String[] labels={"已配置","已隐藏","全部应用"};
        for(int i=0;i<labels.length;i++){
            final int filter=i;Button choice=ui.tonalButton(labels[i]);choice.setTag("hide-filter:"+i);
            choice.setPadding(ui.dp(3),ui.dp(8),ui.dp(3),ui.dp(8));
            choice.setOnClickListener(v->{listFilter=filter;renderApps();});filterButtons.add(choice);
            LinearLayout.LayoutParams fp=new LinearLayout.LayoutParams(0,-2,1);
            if(i>0)fp.leftMargin=ui.dp(6);filters.addView(choice,fp);
        }
        appConfigBody.addView(filters,ui.margins(0,0,0,8));
        retainedList=new LinearLayout(this);retainedList.setOrientation(LinearLayout.VERTICAL);
        appConfigBody.addView(retainedList,ui.wrap());
        appBrowser=new LinearLayout(this);appBrowser.setOrientation(LinearLayout.VERTICAL);
        appList=new LinearLayout(this);appList.setOrientation(LinearLayout.VERTICAL);
        appBrowser.addView(appList,ui.wrap());appConfigBody.addView(appBrowser,ui.margins(0,0,0,8));
        appsPanel.addView(listSection,ui.wrap());
        page.addView(appsPanel,ui.margins(0,8,0,0));

        ui.addDetailSectionTitle(page,"自动与快捷操作");
        automationPanel=new LinearLayout(this);automationPanel.setOrientation(LinearLayout.VERTICAL);
        LinearLayout automationCard=ui.preferenceCard();
        automationCard.addView(switchRow("锁屏自动隐藏",
                "屏幕熄灭后隐藏已保存名单；需要开启应用隐藏。解锁不自动显示。",
                automationEnabled=new Switch(this),config.getBoolean(AppConfig.AUTOMATION_ENABLED)),ui.wrap());
        automationStatus=ui.text("",12,ui.muted,false);automationStatus.setVisibility(View.GONE);
        automationStatus.setOnClickListener(v->ModuleNavigation.open(this,"scope"));
        automationCard.addView(automationStatus,ui.margins(0,4,0,8));
        LinearLayout automation=new LinearLayout(this);automation.setOrientation(LinearLayout.VERTICAL);
        automation.addView(switchRow("处理所有已配置空间","关闭时仅处理当前正在使用的空间；身份无法核验时暂停执行。",
                automationAllUsers=new Switch(this),"all".equals(config.get(AppConfig.AUTOMATION_SCOPE))),ui.wrap());
        automationAllUsers.setOnClickListener(v->{if(!automationAllUsers.isChecked()&&!currentUser.resolved)
            Toast.makeText(this,"无法识别当前用户时，自动隐藏暂停执行",Toast.LENGTH_LONG).show();});
        automationPanel.addView(automation,ui.margins(0,8,0,10));
        automationCard.addView(automationPanel,ui.wrap());page.addView(automationCard,ui.margins(0,0,0,8));
        automationFold=ui.fold(automationEnabled,automationPanel);
        automationFold.show(automationEnabled.isChecked());

        tilePanel=new LinearLayout(this);tilePanel.setOrientation(LinearLayout.VERTICAL);
        LinearLayout tileCard=ui.preferenceCard();
        tileCard.addView(switchRow("快捷磁贴","点击磁贴切换全部已配置应用的显隐；混合状态优先显示。需要开启应用隐藏。",
                tileEnabled=new Switch(this),config.getBoolean(AppConfig.TILE_ENABLED)),ui.wrap());
        tileStatus=ui.text("",12,ui.muted,false);tileStatus.setVisibility(View.GONE);
        tileCard.addView(tileStatus,ui.margins(0,4,0,8));
        LinearLayout tile=new LinearLayout(this);tile.setOrientation(LinearLayout.VERTICAL);
        tileLabel=textInput("磁贴名称",config.get(AppConfig.TILE_LABEL),30);
        tileDescription=textInput("磁贴说明",config.get(AppConfig.TILE_DESCRIPTION),60);
        tileImage=new TileImageEditor(this,ui,config,executor);tile.addView(tileImage.view(),ui.margins(0,8,0,10));
        tile.addView(ui.section("磁贴名称","最多30个字符；留空使用红魔Duo。"),ui.wrap());
        tile.addView(tileLabel,ui.margins(0,8,0,10));
        tile.addView(ui.section("磁贴说明","最多60个字符；留空使用应用隐藏。"),ui.wrap());
        tile.addView(tileDescription,ui.margins(0,8,0,10));
        Button addTile=ui.button("添加到快捷设置");
        addTile.setOnClickListener(v->startActivity(new Intent(this,TileSetupActivity.class)));
        tile.addView(addTile,ui.wrap());tilePanel.addView(tile,ui.margins(0,0,0,10));
        tileCard.addView(tilePanel,ui.wrap());page.addView(tileCard,ui.wrap());
        tileFold=ui.fold(tileEnabled,tilePanel);tileFold.show(tileEnabled.isChecked());
        if(restoredState!=null){
            listFilter=Math.max(0,Math.min(2,restoredState.getInt("hide-filter",0)));
            allSpaces=restoredState.getBoolean("hide-all-spaces",true);
            activeUserId=restoredState.getInt("hide-user",-1);activeUserSerial=restoredState.getLong("hide-serial",-1);
            sortByInstall=restoredState.getBoolean("hide-sort",false);sort.setText(sortByInstall?"时间排序":"名称排序");
            search.setText(restoredState.getString("hide-search",""));
            showAppList(restoredState.getBoolean("hide-list-expanded",false));
            automationFold.show(restoredState.getBoolean("hide-automation-fold",automationEnabled.isChecked()));
            tileFold.show(restoredState.getBoolean("hide-tile-fold",tileEnabled.isChecked()));

        }
    }

    private View switchRow(String title, String description, Switch control, boolean checked) {
        control.setChecked(checked);
        LinearLayout row=ui.featureRow(title,description,control);
        control.setOnCheckedChangeListener((button,value)->{
            if(updatingControls)return;
            String problem=value?activationProblem(control):"";
            if(!problem.isEmpty()){
                updatingControls=true;control.setChecked(false);updatingControls=false;
                if(control==automationEnabled&&!automationReady&&problem.equals(automationProblem))
                    ui.glassDialog("自动隐藏暂不可用",problem,automationNeedsScope?"设置作用域":"重新检查",
                            ()->{if(automationNeedsScope)ModuleNavigation.open(this,"scope");else inspectEnvironment(true);},"返回");
                else Toast.makeText(this,problem,Toast.LENGTH_LONG).show();
                return;
            }
            markDirty();
        });return row;
    }

    private String activationProblem(Switch control){
        if(control==automationAllUsers)return "";
        if(!rootReady)return rootProblem;
        if(!selectionReady||selectionLoading||loading)return "请等待应用名单和用户空间读取完成";
        if(control!=master&&!master.isChecked())return "请先开启应用隐藏";
        if(control==automationEnabled&&!automationReady)return automationProblem;
        if(control!=master&&savedTargets.isEmpty())return "请先从全部应用中配置名单";
        return "";
    }

    private EditText textInput(String hint, String value, int maximum) {
        EditText input = new EditText(this);
        input.setHint(hint);
        input.setFilters(new InputFilter[]{(source, start, end, dest, dstart, dend) -> {
            int remaining = maximum - Character.codePointCount(dest, 0, dstart)
                    - Character.codePointCount(dest, dend, dest.length());
            if (remaining <= 0) return "";
            if (Character.codePointCount(source, start, end) <= remaining) return null;
            return source.subSequence(start, Character.offsetByCodePoints(source, start, remaining));
        }});
        input.setText(value);
        input.setSingleLine(true);
        ui.styleInput(input);
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { markDirty(); }
            @Override public void afterTextChanged(Editable s) { }
        });
        return input;
    }

    private void inspectEnvironment(){inspectEnvironment(false);}

    private void inspectEnvironment(boolean requestAuthorization) {
        if(checkingEnvironment||isFinishing()||isDestroyed())return;
        checkingEnvironment=true;
        executor.execute(()->{
            RootHideManager.RootStatus root=requestAuthorization?manager.requestRootStatus():manager.rootStatus();
            RootHideManager.ConflictState conflict=root.state==RootHideManager.RootState.GRANTED
                    ?manager.conflictState():new RootHideManager.ConflictState(false,false,"");
            ModuleScopeService.Snapshot scope=ModuleScopeService.read(this);
            HideAutomationReadiness.Result readiness=HideAutomationReadiness.inspect(scope.connected,scope.actual,
                    BuildConfig.VERSION_NAME,getSharedPreferences(AppConfig.DIAGNOSTICS,0).getAll(),
                    RuntimeEnvironment.bootCount(this),System.currentTimeMillis(),android.os.SystemClock.elapsedRealtime());
            main.post(()->{
                if(isFinishing()||isDestroyed())return;
                checkingEnvironment=false;
                automationReady=readiness.ready;automationNeedsScope=readiness.needsScope;
                automationProblem=readiness.message;
                rootGranted=root.state==RootHideManager.RootState.GRANTED;
                rootReady=rootGranted&&!conflict.hasConflict();
                rootProblem=!rootGranted?"Root未授权，请在Root管理器中授权后点击重试"
                        :conflict.hasConflict()?"检测到旧隐藏架构冲突，请先处理冲突后重试":"";
                environment.setText(rootReady?"运行条件已就绪 · 点击重新检查":rootProblem);
                environment.setTextColor(rootReady?ui.muted:ui.danger);
                updateActionButtons();renderApps();
                if(requestAuthorization&&rootGranted&&!selectionReady&&!selectionLoading){loadSelection();loadUsers();}
            });
        });
    }

    private void loadSelection() {
        if (operating || selectionLoading || saving || isFinishing() || isDestroyed()) return;
        selectionLoading = true;
        selectionReady = false;
        selectionProblem = "正在读取应用名单…";
        renderApps();
        executor.execute(() -> {
            RootHideManager.OperationResult result;
            HideTargetCodec.Selection loadedSelection;
            long revision;
            RootHideManager.ACTION_LOCK.lock();
            try {
                RootHideManager.RootStatus root = manager.rootStatus();
                result = root.state == RootHideManager.RootState.GRANTED ? manager.refreshTargets()
                        : RootHideManager.OperationResult.failure(root.message);
                loadedSelection = manager.selectionStatus();
                revision = manager.targetRevision();
            } catch (RuntimeException failure) {
                result = RootHideManager.OperationResult.failure("应用名单读取未完成，请重新读取");
                loadedSelection = HideTargetCodec.parse("!unavailable");
                revision = -1;
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
            RootHideManager.OperationResult outcome = result;
            HideTargetCodec.Selection snapshot = loadedSelection;
            long publishedRevision = revision;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                selectionLoading = false;
                if (outcome.success && snapshot.valid && publishedRevision >= 0) {
                    savedTargets.clear(); selected.clear();
                    for (HideTargetCodec.Entry entry : snapshot.entries)
                        savedTargets.add(new RootHideManager.Target(entry));
                    selected.addAll(savedTargets);
                    selectionRevision = publishedRevision;
                    selectionProblem = "";
                    selectionReady = true;
                    if(pendingDraft!=null)restoreDraft();
                    if (dirty&&!saveFailed) main.post(autoSave);
                } else {
                    selectionProblem = outcome.message;
                    // Keep any displayed selection; failed reads never become an empty save.
                    Toast.makeText(this, outcome.message, Toast.LENGTH_LONG).show();
                }
                renderApps();
            });
        });
    }

    private boolean currentBinding(RootHideManager.Target target) {
        if (!target.isBound()) return false;
        for (RootHideManager.UserRecord user : userRecords)
            if (user.userId == target.userId && user.serial >= 0 && user.serial == target.userSerial) return true;
        return false;
    }

    private List<RootHideManager.Target> retainedTargets() {
        List<RootHideManager.Target> retained = new ArrayList<>();
        for (RootHideManager.Target target : selected) if (!currentBinding(target)) retained.add(target);
        return retained;
    }

    private void renderRetainedTargets() {
        if (retainedList == null) return;
        retainedList.removeAllViews();
        if (!selectionProblem.isEmpty()) {
            retainedList.addView(ui.text("原应用清单无法解析，已完整保留：" + selectionProblem
                    + "。仍可修改其他设置；请先导出备份，当前不能编辑名单。", 12, ui.danger, false), ui.wrap());
            return;
        }
        List<RootHideManager.Target> retained = retainedTargets();
        if (retained.isEmpty()) return;
        retainedList.addView(ui.text("待确认或空间已变化的选择：" + retained.size()
                + " 个。记录继续保留，不会用于隐藏；请在当前空间重新勾选需要的应用。移除只改变名单，历史仍会归档。",
                12, ui.danger, false), ui.wrap());
        for (RootHideManager.Target target : retained) {
            LinearLayout row = new LinearLayout(this);
            row.setGravity(Gravity.CENTER_VERTICAL);
            String identity = target.userSerial < 0 ? "身份未确认" : "原空间序列号 " + target.userSerial;
            row.addView(ui.text(target.packageName + "\n空间 " + target.userId + " · " + identity,
                    11, ui.muted, false), new LinearLayout.LayoutParams(0, -2, 1));
            Button remove = ui.button("移除选择");
            styleActionButton(remove, !loading);
            remove.setOnClickListener(view -> removeRetainedTarget(target));
            row.addView(remove, new LinearLayout.LayoutParams(-2, -2));
            retainedList.addView(row, ui.wrap());
        }
    }

    private void removeRetainedTarget(RootHideManager.Target target) {
        if (loading || operating || !selectionProblem.isEmpty() || currentBinding(target)) return;
        if (selected.remove(target)) { markDirty(); renderApps(); }
    }

    private void selectTarget(AppItem item, boolean checked) {
        RootHideManager.Target target = item.record.target;
        if (loading || operating || !selectionReady || selectionLoading || !selectionProblem.isEmpty() || !loaded.contains(item) || item.record.protectedApp
                || !target.isBound() || !inSelectedSpace(target) || !currentBinding(target)) return;
        if (checked) {
            // Only an explicit selection of this displayed app can replace an old binding.
            selected.removeIf(old -> old.userId == target.userId && old.packageName.equals(target.packageName));
            selected.add(target);
        } else selected.remove(target);
        markDirty();
        renderApps();
    }

    private void loadUsers() {
        loading = true;
        renderApps();
        final int previousUser = activeUserId;
        final long previousSerial = activeUserSerial;
        final long generation = ++appLoadGeneration;
        executor.execute(() -> {
            RootHideManager.UserDirectory directory = manager.userDirectory();
            UserResolution resolved = manager.currentUser(directory);
            main.post(() -> {
                if (isFinishing() || isDestroyed() || generation != appLoadGeneration) return;
                userRecords = new ArrayList<>(directory.users);
                currentUser = resolved;
                activeUserId = -1;
                activeUserSerial = -1;
                for (RootHideManager.UserRecord user : userRecords) {
                    if (directory.success && user.serial >= 0 && (activeUserId < 0
                            || resolved.resolved && user.userId == resolved.userId)) {
                        activeUserId = user.userId;
                        activeUserSerial = user.serial;
                    }
                }
                if (!allSpaces) {
                    boolean retained = false;
                    for (RootHideManager.UserRecord user : userRecords)
                        if (user.userId == previousUser && user.serial == previousSerial && user.serial >= 0) {
                            activeUserId = user.userId; activeUserSerial = user.serial; retained = true; break;
                        }
                    if (!retained) allSpaces = true;
                }
                loading = false;
                updateUserAvailability(directory);
                renderSpaceSelector();
                if (activeUserId >= 0) {
                    loadApps(activeUserId);
                    if (dirty) main.post(autoSave);
                } else {
                    loaded.clear();
                    summary.setText("无法读取已验证的用户空间，未执行任何应用操作。");
                    renderApps();
                }
            });
        });
    }

    private void updateUserAvailability(RootHideManager.UserDirectory directory) {
        if (userStatus == null) return;
        userStatus.setVisibility(!directory.success||!currentUser.resolved?View.VISIBLE:View.GONE);
        if (!directory.success) {
            userStatus.setText(userStatus.getContext().getString(R.string.status_hideappsactivity_25 ,String.valueOf(directory.message)));
            userStatus.setTextColor(ui.danger);
        } else if (!currentUser.resolved) {
            userStatus.setText(userStatus.getContext().getString(R.string.status_hideappsactivity_26 ,String.valueOf(currentUser.message)));
            userStatus.setTextColor(ui.danger);
        } else {
            userStatus.setText(userStatus.getContext().getString(R.string.status_hideappsactivity_27 ,String.valueOf(currentUser.userId)));
            userStatus.setTextColor(ui.muted);
        }
    }

    private void showAppList(boolean expanded){
        if(appsExpand==null||operating)return;
        ui.setGroupExpanded("应用名单",expanded);
        if(!expanded&&search!=null){
            search.clearFocus();
            android.view.inputmethod.InputMethodManager keyboard=getSystemService(android.view.inputmethod.InputMethodManager.class);
            if(keyboard!=null)keyboard.hideSoftInputFromWindow(search.getWindowToken(),0);
        }
        renderApps();
    }

    private String spaceLabel() {
        if (allSpaces) return "全部空间";
        for (RootHideManager.UserRecord user : userRecords)
            if (user.userId == activeUserId && user.serial == activeUserSerial)
                return user.name + " · 空间 " + user.userId;
        return "空间 " + activeUserId;
    }

    private boolean inSelectedSpace(RootHideManager.Target target) {
        return allSpaces || target.userId == activeUserId && target.userSerial == activeUserSerial;
    }

    private void renderSpaceSelector() {
        if (spaceSelector == null) return;
        spaceSelector.setText(spaceSelector.getContext().getString(R.string.status_hideappsactivity_28 ,String.valueOf(spaceLabel())));
        spaceSelector.setContentDescription("选择应用空间：" + spaceLabel());
        styleActionButton(spaceSelector, !loading && !operating && !userRecords.isEmpty());
        styleActionButton(refreshAppsButton, !loading && !operating);
        if (sort != null) styleActionButton(sort, !loading && !operating);
    }

    private void showSpaceChoices() {
        if (loading || operating || userRecords.isEmpty()) return;
        if (spacePopup != null) spacePopup.dismiss();
        LiquidGlassLayout choices = new LiquidGlassLayout(ui, 18);
        choices.setOrientation(LinearLayout.VERTICAL);
        choices.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
        Button all = ui.button("全部空间");
        all.setTag("space-all"); styleSpaceOption(all, allSpaces, true);
        all.setOnClickListener(v -> { spacePopup.dismiss(); selectSpace(-1, -1); });
        choices.addView(all, new LinearLayout.LayoutParams(-1, ui.dp(48)));
        for (RootHideManager.UserRecord user : userRecords) {
            Button option = ui.button(user.name + " · 空间 " + user.userId);
            option.setTag("space-" + user.userId);
            styleSpaceOption(option, !allSpaces && user.userId == activeUserId
                    && user.serial == activeUserSerial, user.serial >= 0);
            option.setOnClickListener(v -> { spacePopup.dismiss(); selectSpace(user.userId, user.serial); });
            LinearLayout.LayoutParams optionParams = new LinearLayout.LayoutParams(-1, ui.dp(48));
            optionParams.topMargin = ui.dp(8);
            choices.addView(option, optionParams);
        }
        ScrollView scroll = new ScrollView(this);
        scroll.addView(choices);
        int height = Math.min(ui.dp(16 + 48 * (userRecords.size() + 1) + 8 * userRecords.size()),
                getResources().getDisplayMetrics().heightPixels / 2);
        spacePopup = new PopupWindow(scroll, spaceSelector.getWidth(), height, true);
        spacePopup.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(Color.TRANSPARENT));
        spacePopup.setOutsideTouchable(true);
        spaceSelector.setSelected(true);
        spacePopup.setOnDismissListener(() -> spaceSelector.setSelected(false));
        spacePopup.setElevation(ui.dp(10));
        spacePopup.showAsDropDown(spaceSelector, 0, ui.dp(5));
        choices.refreshBackdrop();
    }

    private void styleSpaceOption(Button option, boolean selected, boolean enabled) {
        option.setSelected(selected);
        styleActionButton(option, enabled);
    }

    private void styleActionButton(Button button, boolean enabled) {
        if(button==null)return;
        button.setEnabled(enabled);
        button.setAlpha(enabled?1f:.45f);
    }

    private void selectSpace(int userId, long serial) {
        boolean requestedAll = userId == -1;
        if (loading || operating || !requestedAll && serial < 0
                || requestedAll == allSpaces && (requestedAll || userId == activeUserId && serial == activeUserSerial)) return;
        allSpaces = requestedAll;
        if (!allSpaces) { activeUserId = userId; activeUserSerial = serial; }
        loaded.clear();
        if (search != null) search.setText("");
        renderSpaceSelector();
        loadApps(activeUserId);
    }

    private void loadApps(int userId) {
        final long serial = activeUserSerial;
        final boolean includeAll = allSpaces;
        final List<RootHideManager.UserRecord> spaces = new ArrayList<>();
        for (RootHideManager.UserRecord user : userRecords)
            if (user.serial >= 0 && (includeAll || user.userId == userId && user.serial == serial)) spaces.add(user);
        final long generation = ++appLoadGeneration;
        if (spaces.isEmpty()) {
            loading = false;
            loaded.clear();
            summary.setText("没有可安全操作的用户空间。");
            renderApps();
            return;
        }
        loading = true;
        loaded.clear();
        summary.setText(summary.getContext().getString(R.string.status_hideappsactivity_29 ,String.valueOf(spaceLabel())));
        renderApps();
        Set<RootHideManager.Target> checked = stateTargets(userId, serial);
        executor.execute(() -> {
            List<RootHideManager.AppRecord> records = new ArrayList<>();
            for (RootHideManager.UserRecord user : spaces) records.addAll(manager.listApps(user.userId, user.serial));
            Map<RootHideManager.Target, RootHideManager.State> states = manager.queryStates(checked);
            ArrayList<AppItem> items = new ArrayList<>();
            for (RootHideManager.AppRecord record : records) {
                if (record.target.isBound() && (includeAll || record.target.userId == userId
                        && record.target.userSerial == serial))
                    items.add(new AppItem(record, states.get(record.target)));
            }
            main.post(() -> {
                if (isFinishing() || isDestroyed() || generation != appLoadGeneration
                        || activeUserId != userId || activeUserSerial != serial || allSpaces != includeAll) return;
                loaded.clear();
                loaded.addAll(items);
                loading = false;
                renderApps();
            });
        });
    }

    private Set<RootHideManager.Target> stateTargets(int userId, long serial) {
        Set<RootHideManager.Target> checked = new LinkedHashSet<>();
        for (RootHideManager.Target target : selected)
            if (target.isBound() && (allSpaces || target.userId == userId && target.userSerial == serial)) checked.add(target);
        for (RootHideManager.Target target : savedTargets)
            if (target.isBound() && (allSpaces || target.userId == userId && target.userSerial == serial)) checked.add(target);
        return checked;
    }

    /** Visibility actions do not invalidate labels, icons or installation dates. */
    private void refreshAppStates() {
        if (operating || activeUserId < 0 || activeUserSerial < 0 || loading) return;
        final int userId = activeUserId;
        final long serial = activeUserSerial;
        final long generation = appLoadGeneration;
        Set<RootHideManager.Target> checked = stateTargets(userId, serial);
        executor.execute(() -> {
            Map<RootHideManager.Target, RootHideManager.State> states = manager.queryStates(checked);
            main.post(() -> {
                if (isFinishing() || isDestroyed() || activeUserId != userId || activeUserSerial != serial
                        || generation != appLoadGeneration || loading) return;
                for (int i = 0; i < loaded.size(); i++) {
                    AppItem item = loaded.get(i);
                    loaded.set(i, new AppItem(item.record, states.get(item.record.target)));
                }
                renderApps();
            });
        });
    }

    private void renderApps() {
        if(appList==null)return;
        updateActionButtons();renderSpaceSelector();updateSaveStatus();
        for(int i=0;i<filterButtons.size();i++){
            Button choice=filterButtons.get(i);boolean chosen=listFilter==i;
            choice.setSelected(chosen);choice.setTextColor(chosen?ui.accent:ui.muted);
            choice.setBackground(ui.pressable(ui.controlGlass(choice,16,chosen
                    ?IceGlassControlDrawable.TONAL:IceGlassControlDrawable.NEUTRAL)));
            styleActionButton(choice,!operating);
        }
        if(operating||resultDialogVisible)return;
        appList.removeAllViews();renderRetainedTargets();
        if(loading||selectionLoading){
            summary.setText(loading?"正在读取"+spaceLabel()+"的应用…":"正在读取保存名单…");
            appList.addView(ui.text("正在读取应用，请稍候…",12,ui.muted,false),ui.margins(4,8,0,8));return;
        }
        String query=search.getText().toString().trim().toLowerCase(Locale.ROOT);
        ArrayList<AppItem> visible=new ArrayList<>();int configured=0,hidden=0;
        for(AppItem item:loaded){
            if(item.record.system)continue;
            boolean managed=selected.contains(item.record.target)||savedTargets.contains(item.record.target);
            if(selected.contains(item.record.target))configured++;
            if(managed&&item.state==RootHideManager.State.HIDDEN)hidden++;
            if(listFilter==0&&!managed||listFilter==1&&(!managed||item.state!=RootHideManager.State.HIDDEN))continue;
            if(!query.isEmpty()&&!item.record.label.toLowerCase(Locale.ROOT).contains(query)
                    &&!item.record.target.packageName.toLowerCase(Locale.ROOT).contains(query))continue;
            visible.add(item);
        }
        Comparator<AppItem> order=Comparator.comparing((AppItem item)->!selected.contains(item.record.target));
        order=sortByInstall?order.thenComparing((AppItem item)->item.record.installedAt,Comparator.reverseOrder())
                :order.thenComparing(item->item.record.label,String.CASE_INSENSITIVE_ORDER);
        visible.sort(order.thenComparing(item->item.record.target.packageName).thenComparingInt(item->item.record.target.userId));
        summary.setText(summary.getContext().getString(R.string.status_hideappsactivity_30 ,String.valueOf(configured), String.valueOf(hidden)));
        if(appConfigBody.getVisibility()!=View.VISIBLE)return;
        if(visible.isEmpty()){
            LinearLayout empty=new LinearLayout(this);empty.setOrientation(LinearLayout.VERTICAL);
            empty.setPadding(0,ui.dp(8),0,ui.dp(8));
            empty.addView(ui.text(!query.isEmpty()?"没有找到匹配的应用":listFilter==0?"尚未配置应用"
                    :listFilter==1?"当前范围没有已隐藏的配置应用":"当前空间没有可配置的普通应用",14,ui.text,true),ui.wrap());
            if(query.isEmpty()&&listFilter!=2){
                empty.addView(ui.text("从全部应用中勾选名单，勾选后会自动保存。",12,ui.muted,false),ui.margins(0,6,0,10));
                Button add=ui.tonalButton("选择应用");add.setOnClickListener(v->{listFilter=2;renderApps();});empty.addView(add,ui.wrap());
            }
            appList.addView(empty,ui.wrap());return;
        }
        LinearLayout rows=new LinearLayout(this);rows.setOrientation(LinearLayout.VERTICAL);
        for(AppItem item:visible){
            if(rows.getChildCount()>0)rows.addView(ui.divider(),new LinearLayout.LayoutParams(-1,ui.dp(1)));
            rows.addView(appRow(item),ui.wrap());
        }
        appList.addView(rows,ui.wrap());
        if(restoredState!=null){
            int y=restoredState.getInt("hide-scroll",0);pageScroll.post(()->pageScroll.scrollTo(0,y));restoredState=null;
        }
    }

    private View appRow(AppItem item) {
        LinearLayout row=new LinearLayout(this);row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(ui.dp(68));row.setPadding(0,ui.dp(10),0,ui.dp(10));
        row.setTag("app-"+item.record.target.userId+"-"+item.record.target.packageName);
        ImageView icon=new ImageView(this);Drawable drawable;
        try{PackageManager packages=getPackageManager();drawable=packages.getApplicationIcon(packages.getApplicationInfo(
                item.record.target.packageName,RootHideManager.APP_METADATA_FLAGS));}
        catch(PackageManager.NameNotFoundException error){drawable=getDrawable(R.drawable.ic_tile);}
        icon.setImageDrawable(drawable);icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(ui.dp(36),ui.dp(36));ip.rightMargin=ui.dp(10);row.addView(icon,ip);
        LinearLayout copy=new LinearLayout(this);copy.setOrientation(LinearLayout.VERTICAL);
        TextView name=ui.text(item.record.label,15,ui.text,true);name.setMaxLines(2);copy.addView(name,ui.wrap());
        boolean selectedNow=selected.contains(item.record.target),saved=savedTargets.contains(item.record.target);
        String state=selectedNow&&!saved?"待保存":!selectedNow&&saved?"待移除"
                :item.state==null?selectedNow?"状态待核验":"未配置":localizedState(item.state);
        TextView status=ui.text("空间 "+item.record.target.userId+" · "+state,12,
                item.state==RootHideManager.State.HIDDEN?ui.accent:ui.muted,false);
        copy.addView(status,ui.margins(0,4,0,0));
        TextView pkg=ui.text(item.record.target.packageName,11,ui.muted,false);
        pkg.setSingleLine(true);pkg.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        copy.addView(pkg,ui.margins(0,3,0,0));
        row.addView(copy,new LinearLayout.LayoutParams(0,-2,1));
        if(listFilter==2){
            CheckBox box=new CheckBox(this);ui.styleCheckBox(box);box.setChecked(selectedNow);
            box.setContentDescription("配置"+item.record.label+"，空间 "+item.record.target.userId);
            box.setEnabled(!operating&&!loading&&selectionReady&&selectionProblem.isEmpty()&&!item.record.protectedApp&&currentBinding(item.record.target));
            box.setOnCheckedChangeListener((button,checked)->selectTarget(item,checked));
            row.addView(box,new LinearLayout.LayoutParams(ui.dp(48),ui.dp(48)));
            copy.setOnClickListener(v->{if(box.isEnabled())box.performClick();});
        }else{
            boolean hide=item.state==RootHideManager.State.VISIBLE;
            Button action=ui.tonalButton(hide?"隐藏":item.state==RootHideManager.State.HIDDEN?"显示":"核验");
            action.setMinimumHeight(ui.dp(48));
            action.setContentDescription(action.getText()+item.record.label+"，空间 "+item.record.target.userId);
            styleActionButton(action,canOperate(hide)&&saved&&selectedNow&&currentBinding(item.record.target));
            action.setOnClickListener(v->{
                if(item.state!=RootHideManager.State.VISIBLE&&item.state!=RootHideManager.State.HIDDEN){refreshAppStates();return;}
                confirmTargets(hide?"隐藏应用":"显示应用",item.record.label+" · 空间 "+item.record.target.userId,
                        hide,new LinkedHashSet<>(java.util.Collections.singleton(item.record.target)));
            });
            LinearLayout.LayoutParams ap=new LinearLayout.LayoutParams(-2,-2);ap.leftMargin=ui.dp(6);row.addView(action,ap);
            copy.setClickable(true);copy.setFocusable(true);copy.setBackground(ui.pressable(ui.round(Color.TRANSPARENT,8)));
            copy.setContentDescription(item.record.label+"，查看配置详情");
            copy.setOnClickListener(v->{
                if(operating||loading)return;
                ui.glassDialog(item.record.label,"空间 "+item.record.target.userId+" · "+state+"\n"+item.record.target.packageName
                        +"\n\n移除只改变自动隐藏及磁贴使用的名单，不会显示应用。如需恢复，请先点显示。",
                        "移除名单",()->selectTarget(item,false),"返回");
            });
        }
        return row;
    }

    private static String localizedState(RootHideManager.State state) {
        switch (state) {
            case VISIBLE: return "已显示";
            case HIDDEN: return "已隐藏";
            case MISSING: return "未安装";
            default: return "状态未知";
        }
    }

    private void saveSettings() {
        if (saving || !dirty || !selectionReady || selectionLoading || selectionRevision < 0) return;
        // Persist the chosen scope; RootHideManager resolves the current user again before execution.
        LinkedHashMap<String, String> update = new LinkedHashMap<>();
        update.put(AppConfig.HIDE_MASTER, master.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_ENABLED, automationEnabled.isChecked() ? "1" : "0");
        update.put(AppConfig.AUTOMATION_SCOPE, automationAllUsers.isChecked() ? "all" : "current");
        update.put(AppConfig.TILE_ENABLED, tileEnabled.isChecked() ? "1" : "0");
        update.put(AppConfig.TILE_LABEL, tileLabel.getText().toString());
        update.put(AppConfig.TILE_DESCRIPTION, tileDescription.getText().toString());
        final long generation=editGeneration;
        final long expectedRevision = selectionRevision;
        final Set<RootHideManager.Target> targets=new LinkedHashSet<>(selected);
        final boolean targetsChanged = !targets.equals(savedTargets);
        saving=true;
        saveFailed=false;
        updateSaveStatus();
        updateActionButtons();
        executor.execute(() -> {
            RootHideManager.OperationResult targetsResult;
            long committedRevision = expectedRevision;
            boolean settingsSaved=false;
            RootHideManager.ACTION_LOCK.lock();
            try {
                if (!targetsChanged) {
                    AppConfig.SaveResult saved = config.save(update);
                    settingsSaved=saved.success;
                    targetsResult = saved.success ? RootHideManager.OperationResult.success(saved.message)
                            : RootHideManager.OperationResult.failure(saved.message);
                } else targetsResult = manager.saveTargets(targets, update, expectedRevision);
                if (targetsChanged && targetsResult.success) committedRevision = manager.targetRevision();
                if(targetsChanged&&targetsResult.success){
                    // The authoritative list can commit before the other settings. Verify both.
                    Map<String,String> settings=new LinkedHashMap<>(update);
                    settings.put(AppConfig.HIDE_TARGETS,HideTargetCodec.encode(targets));
                    AppConfig.SaveResult saved=config.save(settings);
                    settingsSaved=saved.success;
                    if(!settingsSaved)targetsResult=RootHideManager.OperationResult.success(
                            "名单已保存，但设置未保存："+saved.message);
                }
                if(targetsResult.success&&settingsSaved)ScreenAutomation.sync(this);
            } catch (RuntimeException error) {
                targetsResult = RootHideManager.OperationResult.failure("保存未完成："
                        + error.getClass().getSimpleName() + "。修改仍保留在当前页面。");
            } finally { RootHideManager.ACTION_LOCK.unlock(); }
            final long savedRevision = committedRevision;
            final boolean settingsComplete=settingsSaved;
            RootHideManager.OperationResult result = targetsResult;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                saving=false;
                if (!result.success||!settingsComplete) {
                    saveFailed=true;
                    updateSaveStatus();
                    Toast.makeText(this, result.message, Toast.LENGTH_LONG).show();
                }
                if (result.success) {
                    if (targetsChanged) {
                        savedTargets.clear();
                        savedTargets.addAll(targets);
                        selectionRevision = savedRevision;
                    }
                    dirty = editGeneration != generation||!settingsComplete;
                    renderApps();
                    if(targetsChanged)refreshAppStates();
                    if(dirty&&settingsComplete)main.post(autoSave);
                }
                updateActionButtons();
                if(leaveAction!=null){
                    if(result.success&&settingsComplete&&!dirty){Runnable leave=leaveAction;leaveAction=null;leave.run();}
                    else if(!result.success||!settingsComplete){Runnable leave=leaveAction;leaveAction=null;showSaveFailure(leave);}
                }
            });
        });
    }

    private Set<RootHideManager.Target> scopedTargets(){
        Set<RootHideManager.Target> targets=new LinkedHashSet<>();
        for(RootHideManager.Target target:savedTargets)if(inSelectedSpace(target))targets.add(target);
        return targets;
    }

    private boolean canOperate(boolean hide){
        return selectionReady&&!selectionLoading&&!loading&&!saving&&!dirty&&!operating
                &&rootGranted&&(!hide||rootReady&&master.isChecked());
    }

    private void confirmAction(String title,String message,boolean hide){
        Set<RootHideManager.Target> requested=scopedTargets();
        confirmTargets(title,spaceLabel()+" · "+requested.size()+" 个已配置应用\n"+message
                +"\n搜索和状态筛选不改变本次操作范围。",hide,requested);
    }

    private void confirmTargets(String title,String message,boolean hide,Set<RootHideManager.Target> requested){
        if(!canOperate(hide)||requested.isEmpty())return;
        final Set<RootHideManager.Target> confirmed=new LinkedHashSet<>(savedTargets);
        final Set<RootHideManager.Target> actionTargets=new LinkedHashSet<>(requested);
        actionDialog=ui.glassDialog(title,message,hide?"确认隐藏":"确认显示",
                ()->runOperation(hide,confirmed,actionTargets),"取消");
    }

    private void styleDialogActions(Dialog dialog) {
        Button confirm = dialog.getWindow().getDecorView().findViewWithTag("glass-dialog-confirm");
        if (confirm == null) return;
        android.view.ViewGroup actions = (android.view.ViewGroup) confirm.getParent();
        for (int i = 0; i < actions.getChildCount(); i++) {
            View action = actions.getChildAt(i);
            if (action instanceof Button) styleActionButton((Button) action, action.isEnabled());
        }
    }

    private void runOperation(boolean hide, Set<RootHideManager.Target> confirmed, Set<RootHideManager.Target> requested) {
        if (!canOperate(hide)) return;
        operating = true;
        hideAllButton.setActivated(hide);
        showAllButton.setActivated(!hide);
        operationStatus.setText(hide ? "正在准备隐藏…" : "正在准备显示…");
        operationStatus.setVisibility(View.VISIBLE);
        setOperationControls(false);
        // UI feedback is constant-cost. The action has its own worker and manager,
        // so a pending app-list query cannot hold it behind the page's executor.
        actionExecutor.execute(() -> {
            RootHideManager.OperationResult completed;
            try {
                RootHideManager actionManager = new RootHideManager(getApplicationContext());
                completed = actionManager.changeConfirmed(hide, confirmed, requested, message -> main.post(() -> {
                    if (operating && !isFinishing() && !isDestroyed()) operationStatus.setText(message);
                }));
            } catch (RuntimeException error) { completed = RootHideManager.OperationResult.failure(
                    "操作未完成：" + error.getClass().getSimpleName()); }
            RootHideManager.OperationResult result = completed;
            main.post(() -> {
                if (isFinishing() || isDestroyed()) return;
                operating = false;
                hideAllButton.setActivated(false);
                showAllButton.setActivated(false);
                operationStatus.setVisibility(View.GONE);
                setOperationControls(true);
                resultDialogVisible = true;
                actionDialog = ui.glassDialog(result.success ? "操作完成" : "操作未完成",
                        result.message, "知道了", null, null);
                styleDialogActions(actionDialog);
                // Let the completion dialog draw immediately. Lists are refreshed
                // after acknowledgement, rather than rebuilding beneath its first frame.
                actionDialog.setOnDismissListener(dialog -> {
                    resultDialogVisible = false;
                    if (isFinishing() || isDestroyed()) return;
                    if (!dirty && !saving) loadSelection();
                    refreshAppStates();
                });
            });
        });
    }

    private void setOperationControls(boolean enabled) {
        master.setEnabled(enabled); automationEnabled.setEnabled(enabled); tileEnabled.setEnabled(enabled);
        automationAllUsers.setEnabled(enabled); tileLabel.setEnabled(enabled); tileDescription.setEnabled(enabled);
        search.setEnabled(enabled);
        updateActionButtons(); renderSpaceSelector();
        for(Button filter:filterButtons)styleActionButton(filter,enabled);
        styleActionButton(chooseAppsButton,enabled);appsExpand.setEnabled(enabled);
        if(automationFold!=null)automationFold.sync();if(tileFold!=null)tileFold.sync();
        // Existing selection listeners also reject changes while operating.
        for (int i=0;i<appList.getChildCount();i++) appList.getChildAt(i).setAlpha(enabled ? 1f : .55f);
    }

    private void updateActionButtons() {
        if(master==null)return;
        int count=scopedTargets().size();
        styleActionButton(chooseAppsButton,!operating&&!loading&&selectionReady);
        if(automationStatus!=null){
            String reason=!master.isChecked()?"已暂停：应用隐藏未开启":!rootReady?rootProblem
                    :!automationReady?automationProblem:savedTargets.isEmpty()?"已暂停：尚未配置应用":"";
            automationStatus.setText(reason);automationStatus.setVisibility(automationEnabled.isChecked()&&!reason.isEmpty()?View.VISIBLE:View.GONE);
        }
        if(tileStatus!=null){
            String reason=!master.isChecked()?"已暂停：应用隐藏未开启":!rootReady?rootProblem
                    :savedTargets.isEmpty()?"已暂停：尚未配置应用":"";
            tileStatus.setText(reason);tileStatus.setVisibility(tileEnabled.isChecked()&&!reason.isEmpty()?View.VISIBLE:View.GONE);
        }
        if(hideAllButton!=null){
            hideAllButton.setText(allSpaces?"全部隐藏":"隐藏本空间");
            hideAllButton.setContentDescription(hideAllButton.getText()+"，"+spaceLabel()+"，"+count+"个已保存应用");
            styleActionButton(hideAllButton,canOperate(true)&&count>0);
        }
        if(showAllButton!=null){
            showAllButton.setText(allSpaces?"全部显示":"显示本空间");
            showAllButton.setContentDescription(showAllButton.getText()+"，"+spaceLabel()+"，"+count+"个已保存应用");
            styleActionButton(showAllButton,canOperate(false)&&count>0);
        }
    }

    private void updateSaveStatus() {
        if(saveStatus==null)return;
        saveStatus.setVisibility(saving||saveFailed||dirty?View.VISIBLE:View.GONE);
        saveStatus.setText(saving?"正在保存名单与设置…":saveFailed?"保存未完成，点击重试":dirty?"正在等待保存…":"");
        saveStatus.setTextColor(saveFailed?ui.danger:ui.muted);
    }

    private void markDirty() {
        if(updatingControls)return;
        if (automationFold!=null) automationFold.sync();
        if (tileFold!=null) tileFold.sync();
        editGeneration++;
        saveFailed = false;
        dirty = true;
        updateActionButtons();
        main.removeCallbacks(autoSave);main.postDelayed(autoSave,450);
        updateSaveStatus();
    }

    private void restoreDraft(){
        Bundle draft=pendingDraft;
        if(draft==null)return;
        HideTargetCodec.Selection baseline=HideTargetCodec.parse(draft.getString("hide-draft-baseline",""));
        HideTargetCodec.Selection desired=HideTargetCodec.parse(draft.getString("hide-draft-selection",""));
        Set<RootHideManager.Target> before=new LinkedHashSet<>(),after=new LinkedHashSet<>();
        for(HideTargetCodec.Entry entry:baseline.entries)before.add(new RootHideManager.Target(entry));
        for(HideTargetCodec.Entry entry:desired.entries)after.add(new RootHideManager.Target(entry));
        if(!baseline.valid||!desired.valid){saveFailed=true;saveStatus.setText("草稿无法解析，请保留页面并重试");return;}
        if(savedTargets.equals(before)||savedTargets.equals(after)){applyDraft(draft);return;}
        // Rotation must not turn an old edit into an automatic overwrite of a newer list.
        Dialog conflict=ui.glassDialog("保存名单已变化","此页仍保留未保存草稿。可以重新确认草稿，或使用当前已保存的名单与设置。",
                "重新确认草稿",()->applyDraft(draft),"用已保存内容");
        conflict.setCancelable(false);
        conflict.setOnCancelListener(dialog->pendingDraft=null);
    }

    private void applyDraft(Bundle draft){
        HideTargetCodec.Selection desired=HideTargetCodec.parse(draft.getString("hide-draft-selection",""));
        selected.clear();for(HideTargetCodec.Entry entry:desired.entries)selected.add(new RootHideManager.Target(entry));
        updatingControls=true;
        master.setChecked(draft.getBoolean("hide-draft-master"));
        automationEnabled.setChecked(draft.getBoolean("hide-draft-automation"));
        automationAllUsers.setChecked(draft.getBoolean("hide-draft-all-users"));
        tileEnabled.setChecked(draft.getBoolean("hide-draft-tile"));
        tileLabel.setText(draft.getString("hide-draft-label",""));
        tileDescription.setText(draft.getString("hide-draft-description",""));
        updatingControls=false;pendingDraft=null;
        boolean settingsChanged=master.isChecked()!=config.getBoolean(AppConfig.HIDE_MASTER)
                ||automationEnabled.isChecked()!=config.getBoolean(AppConfig.AUTOMATION_ENABLED)
                ||automationAllUsers.isChecked()!= "all".equals(config.get(AppConfig.AUTOMATION_SCOPE))
                ||tileEnabled.isChecked()!=config.getBoolean(AppConfig.TILE_ENABLED)
                ||!tileLabel.getText().toString().equals(config.get(AppConfig.TILE_LABEL))
                ||!tileDescription.getText().toString().equals(config.get(AppConfig.TILE_DESCRIPTION));
        dirty=!selected.equals(savedTargets)||settingsChanged;saveFailed=false;editGeneration++;
        if(automationFold!=null)automationFold.sync();if(tileFold!=null)tileFold.sync();
        updateSaveStatus();renderApps();if(dirty)main.post(autoSave);
    }

    @Override public void navigateToAncestor(String route){requestLeave(()->ModuleNavigation.returnTo(this,route));}

    private void requestLeave(Runnable leave){
        if(operating){Toast.makeText(this,"正在核验操作结果，请稍候",Toast.LENGTH_SHORT).show();return;}
        if(!dirty&&!saving){leave.run();return;}
        leaveAction=leave;
        if(saveFailed||!selectionReady||selectionLoading){leaveAction=null;showSaveFailure(leave);return;}
        if(!saving)saveSettings();
    }

    private void showSaveFailure(Runnable leave){
        ui.glassDialog("修改尚未保存","当前修改仍保留在页面中，可继续编辑并点击保存状态重试。放弃修改只丢弃未保存的设置和名单草稿。",
                "放弃并返回",()->{dirty=false;leave.run();},"继续编辑");
    }

    @Override protected void onSaveInstanceState(Bundle state){
        state.putBoolean("hide-list-expanded",appConfigBody.getVisibility()==View.VISIBLE);
        state.putBoolean("hide-all-spaces",allSpaces);state.putInt("hide-user",activeUserId);
        state.putLong("hide-serial",activeUserSerial);state.putInt("hide-filter",listFilter);
        state.putBoolean("hide-sort",sortByInstall);state.putString("hide-search",search.getText().toString());
        state.putInt("hide-scroll",pageScroll.getScrollY());
        state.putBoolean("hide-automation-fold",automationPanel.getVisibility()==View.VISIBLE);
        state.putBoolean("hide-tile-fold",tilePanel.getVisibility()==View.VISIBLE);
        if(dirty||saving){
            state.putString("hide-draft-selection",HideTargetCodec.encode(selected));
            state.putString("hide-draft-baseline",HideTargetCodec.encode(savedTargets));
            state.putBoolean("hide-draft-master",master.isChecked());
            state.putBoolean("hide-draft-automation",automationEnabled.isChecked());
            state.putBoolean("hide-draft-all-users",automationAllUsers.isChecked());
            state.putBoolean("hide-draft-tile",tileEnabled.isChecked());
            state.putString("hide-draft-label",tileLabel.getText().toString());
            state.putString("hide-draft-description",tileDescription.getText().toString());
        }
        super.onSaveInstanceState(state);
    }

    @Override protected void onActivityResult(int request,int result,Intent data) { super.onActivityResult(request,result,data); if(tileImage!=null)tileImage.onResult(request,result,data); }


    private static final class AppItem {
        final RootHideManager.AppRecord record;
        final RootHideManager.State state;
        AppItem(RootHideManager.AppRecord record, RootHideManager.State state) {
            this.record = record;
            this.state = state;
        }
    }
}
