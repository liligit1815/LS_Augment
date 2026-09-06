package ls.augment.com;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import android.window.OnBackInvokedDispatcher;

import java.io.File;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Secondary configuration pages. */
public final class FeatureActivity extends Activity {
    static final String EXTRA_MODULE = "module";
    static final String MODULE_SHOULDER = "shoulder";
    static final String MODULE_AI_TRIGGER = "ai_trigger";
    static final String MODULE_COMBO_SPEED = "combo_speed";
    static final String MODULE_FAN_CONTROL = "fan_control";
    static final String MODULE_FREEFORM = "freeform";
    static final String MODULE_AUDIO_GAIN = "audio_gain";
    static final String MODULE_BATTERY = "battery";
    private TextView batteryReadout;
    static final String MODULE_SUPER_RESOLUTION = "super_resolution";
    static final String MODULE_DIABLO_COEXIST = "diablo_coexist";
    static final String MODULE_STATUS_LAYOUT = "status_layout";
    static final String MODULE_STATUS_CLOCK = "status_clock";
    static final String MODULE_STATUS_METRICS = "status_metrics";
    static final String MODULE_DOUBLE_APP = "double_app";
    static final String MODULE_BEAUTIFY = "beautify";
    static final String MODULE_SIGNATURE_INSTALL = "signature_install";
    static final String MODULE_AUTOMATION = "automation";
    static final String MODULE_TILE = "tile";
    static final String MODULE_LAUNCHER_ICON = "launcher_icon";
    static final String MODULE_DIAGNOSTICS = "diagnostics";
    static final String MODULE_DETAILED_DIAGNOSTICS = "detailed_diagnostics";
    private static final int EXPORT_REQUEST = 2042;

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final ExecutorService rapidCaptureExecutor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<String, Switch> switches = new LinkedHashMap<>();
    private final Map<String, EditText> inputs = new LinkedHashMap<>();
    private final Map<String, Slider> sliders = new LinkedHashMap<>();
    private final Map<String, Choice> choices = new LinkedHashMap<>();
    private final Map<String, PositionControl> positionControls = new LinkedHashMap<>();
    private final Map<String, IconControl> iconControls = new LinkedHashMap<>();
    private final LinkedHashMap<String, StatusBarLayoutSpec.Position> positionValues =
            new LinkedHashMap<>();
    private AppConfig config;
    private UiKit ui;
    private LinearLayout page;
    private Button save;
    private TextView status;
    private boolean runtimeDetailsExpanded;
    private TextView rapidCompatibilityStatus;
    private Button rapidCompatibilityAction;
    private Button rapidCompatibilityCancel;
    private LinearLayout rapidCompatibilityPanel;
    private LinearLayout rapidParameters;
    private TextView rapidFeatureTitle;
    private TextView rapidFeatureDescription;
    private Button rapidTestEntry;
    private ImageButton rapidExpand;
    private boolean rapidFeatureUnlocked;
    private TextView fanMeasurementSummary;
    private AlertDialog fanDialog;
    private long fanRequestAt;
    private String renderedFanMeasurement;
    private boolean rapidParametersExpanded;
    private boolean rapidTestPanelRequested;
    private LinearLayout statusIconControls;
    private final LinkedHashMap<String, Boolean> renderedStatusIconSlots =
            new LinkedHashMap<>();
    private String section;
    private boolean loading = true;
    private final java.util.List<UiKit.Fold> folds = new java.util.ArrayList<>();
    private boolean dirty;
    private boolean saveInFlight;
    private boolean rapidFingerprintLoading;
    private boolean rapidAutoContinueAttempted;
    private boolean rapidDisablePersistPending;
    private long changeGeneration;
    private volatile String rapidFingerprint;
    private volatile RapidFireCompatibility.Session rapidSession;
    private RapidFirePhysicalCapture rapidPhysicalCapture;
    private boolean rapidPagePaused;
    private String rapidCaptureFeedback;
    private boolean rapidCaptureInFlight;
    private boolean rapidCaptureLeft;
    private long rapidCaptureDeadline;
    private int rapidCaptureGeneration;
    private String rapidCaptureSessionId;
    private String pendingExport = "";
    private final Runnable statusAutoSave = () -> save(true);
    private final Runnable statusPoll = new Runnable() {
        @Override public void run() {
            if ((!isStatusModule() && !MODULE_AUDIO_GAIN.equals(section) && !MODULE_FAN_CONTROL.equals(section)
                    && !MODULE_SHOULDER.equals(section)) || isFinishing()) return;
            if (isStatusModule()) refreshStatusIconControls();
            renderRuntimeStatus();
            if (MODULE_SHOULDER.equals(section)) refreshRapidCompatibilityUi();
            main.postDelayed(this, 800L);
        }
    };

    private static final String[] DEVICE_STATUS_ICON_BASELINE = {
            "vpn", "ethernet", "rotate", "screen_record", "sensors_off", "camera",
            "microphone", "data_saver", "connected_display", "cast", "tty", "satellite",
            "hotspot", "nfc", "location", "bluetooth", "alarm_clock", "zen", "mute",
            "volume", "airplane", "NET_SPEED", "secondary_wifi", "wifi", "ims_icon", "mobile"
    };

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        section = getIntent().getStringExtra(EXTRA_MODULE);
        if (section == null) section = MODULE_DIAGNOSTICS;
        if (isStatusModule()) {
            startActivity(new Intent(this, StatusBarSettingsActivity.class));
            finish();
            return;
        }
        config = new AppConfig(this);
        ui = new UiKit(this);
        build();
        loadValues();
        registerSystemBackCallback();
    }

    @Override protected void onDestroy() {
        stopRapidCapture();
        rapidCaptureExecutor.shutdown();
        main.removeCallbacks(statusAutoSave);
        main.removeCallbacks(statusPoll);
        executor.shutdown();
        super.onDestroy();
    }

    @Override public void onBackPressed() { finish(); }

    @Override protected void onResume() {
        super.onResume();
        rapidPagePaused = false;
    }

    @Override protected void onPause() {
        if (dirty && !saveInFlight) save(true);
        if(fanRequestAt>0&&isFinishing()){requestFanMeasurement(false);fanRequestAt=0;}
        rapidPagePaused = true;
        if (rapidCaptureInFlight) {
            stopRapidCapture();
            rapidCaptureFeedback = "离开页面已停止采集并交还肩键控制，返回后可重新采集";
        }
        super.onPause();
    }

    private void registerSystemBackCallback() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                this::finish);
    }

    private void build() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        root.setPadding(0, ui.topAppInset(), 0, 0);
        LinearLayout header = ui.header(title(), true);
        header.setPadding(ui.dp(10), ui.dp(4), ui.dp(12), ui.dp(2));
        if (!isStatusModule()) ScopeRestartDialog.addButton(this, ui, header, restartScope());
        root.addView(header, new LinearLayout.LayoutParams(-1, -2));
        root.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(ui.dp(14), ui.dp(10), ui.dp(14), ui.dp(26));
        scroll.addView(page, new ScrollView.LayoutParams(-1, -2));
        root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));

        TextView description = ui.text(subtitle(), 11.5f, ui.muted, false);
        description.setLineSpacing(ui.dp(1), 1.06f);

        status = ui.text("配置尚未读取", 11, ui.muted, false);
        status.setPadding(ui.dp(12), ui.dp(9), ui.dp(12), ui.dp(9));
        status.setBackground(ui.roundStroke(ui.accentContainer, 12, ui.outline, 1));
        status.setClickable(true);status.setFocusable(true);
        status.setOnClickListener(v -> { runtimeDetailsExpanded=!runtimeDetailsExpanded;renderRuntimeStatus(); });


        switch (section) {
            case MODULE_SHOULDER: buildShoulder(); break;
            case MODULE_AI_TRIGGER: buildAiTrigger(); break;
            case MODULE_COMBO_SPEED: buildComboSpeed(); break;
            case MODULE_FAN_CONTROL: buildFanControl(); break;
            case MODULE_FREEFORM: buildFreeform(); break;
            case MODULE_AUDIO_GAIN: buildAudioGain(); break;
            case MODULE_BATTERY: buildBattery(); break;
            case MODULE_SUPER_RESOLUTION: buildSuperResolution(); break;
            case MODULE_DIABLO_COEXIST: buildDiabloCoexist(); break;
            case MODULE_STATUS_LAYOUT: buildStatusLayout(); break;
            case MODULE_STATUS_CLOCK: buildStatusClock(); break;
            case MODULE_STATUS_METRICS: buildStatusMetrics(); break;
            case MODULE_DOUBLE_APP: buildDoubleApp(); break;
            case MODULE_BEAUTIFY: buildBeautify(); break;
            case MODULE_SIGNATURE_INSTALL: buildSignatureInstall(); break;
            case MODULE_AUTOMATION: buildAutomation(); break;
            case MODULE_TILE: buildTile(); break;
            case MODULE_DETAILED_DIAGNOSTICS: buildDetailedDiagnostics(); break;
            case MODULE_LAUNCHER_ICON: buildLauncherIcon(); setContentView(root); ui.applyGestureInset(root, 8); return;
            case "store_download": buildStoreDownload(); break;
            default: buildDiagnostics(); break;
        }
        save = ui.accentButton(isStatusModule() ? "立即应用（修改会自动应用）" : "保存修改");
        ui.setButtonEnabled(save, false);
        save.setOnClickListener(view -> save());
        LinearLayout saveBar = new LinearLayout(this);
        saveBar.setPadding(ui.dp(14), ui.dp(8), ui.dp(14), ui.dp(9));
        saveBar.setBackgroundColor(ui.rail);
        saveBar.addView(save, new LinearLayout.LayoutParams(-1, ui.dp(48)));

        setContentView(root);
        ui.applyGestureInset(root, 8);
    }

    private LinearLayout detailCard(String title, String description) {
        LinearLayout card = ui.card();
        if (!title.isEmpty()) card.addView(ui.section(title, description), ui.wrap());
        return card;
    }

    private void buildShoulder() {
        LinearLayout shoulder = ui.card();
        addSwitch(shoulder, AppConfig.SHOULDER_ENABLED, "全应用肩键",
                "对加入游戏空间的所有应用开放肩键使用", false);
        LinearLayout.LayoutParams separator = new LinearLayout.LayoutParams(-1, ui.dp(1));
        separator.setMargins(0, ui.dp(7), 0, ui.dp(7));
        shoulder.addView(ui.divider(), separator);
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = new LinearLayout(this);
        copy.setOrientation(LinearLayout.VERTICAL);
        rapidFeatureTitle = ui.text("极速连点", 14, ui.muted, false);
        copy.addView(rapidFeatureTitle, ui.wrap());
        rapidFeatureDescription = ui.text("请先进行兼容性测试，以确保设备支持当前功能。", 11, ui.muted, false);
        rapidFeatureDescription.setLineSpacing(ui.dp(1), 1.04f);
        copy.addView(rapidFeatureDescription, ui.margins(0, 3, 8, 0));
        row.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        rapidTestEntry = ui.button("兼容性测试");
        rapidTestEntry.setTextSize(10);
        rapidTestEntry.setMinWidth(0);
        rapidTestEntry.setMinimumWidth(0);
        rapidTestEntry.setMinHeight(0);
        rapidTestEntry.setMinimumHeight(0);
        rapidTestEntry.setPadding(ui.dp(8), ui.dp(4), ui.dp(8), ui.dp(4));
        rapidTestEntry.setOnClickListener(view -> {
            rapidTestPanelRequested = true;
            refreshRapidCompatibilityUi();
            onRapidCompatibilityAction();
        });
        row.addView(rapidTestEntry, new LinearLayout.LayoutParams(-2, ui.dp(36)));
        Switch rapidSwitch = new Switch(this);
        ui.styleSwitch(rapidSwitch);
        rapidSwitch.setContentDescription("极速连点");
        rapidSwitch.setEnabled(false);
        rapidSwitch.setVisibility(View.GONE);
        rapidSwitch.setOnCheckedChangeListener((button, checked) -> {
            rapidParametersExpanded = checked;
            markDirty();
            updateRapidFeatureUi(rapidFeatureUnlocked);
        });
        switches.put(AppConfig.TGK_RAPID_FIRE_ENABLED, rapidSwitch);
        rapidExpand = new ImageButton(this);
        rapidExpand.setImageResource(R.drawable.ic_expand_more);
        rapidExpand.setColorFilter(ui.muted);
        rapidExpand.setBackground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT, 12)));
        rapidExpand.setOnClickListener(view -> {
            if (!RapidFireLifecyclePolicy.canExpand(rapidFeatureUnlocked, rapidSwitch.isChecked())) { toast("请先开启功能"); return; }
            rapidParametersExpanded = !rapidParametersExpanded;
            updateRapidFeatureUi(rapidFeatureUnlocked);
        });
        row.addView(rapidSwitch, new LinearLayout.LayoutParams(-2, -2));
        row.addView(rapidExpand, new LinearLayout.LayoutParams(ui.dp(28), ui.dp(44)));
        shoulder.addView(row, ui.margins(0, 2, 0, 2));
        rapidParameters = new LinearLayout(this);
        rapidParameters.setOrientation(LinearLayout.VERTICAL);
        rapidParameters.addView(ui.text("建议先从 20 次/秒开始；40～50 次/秒可能被个别游戏丢弃。",
                11, ui.muted, false), ui.margins(0, 12, 0, 4));
        addSlider(rapidParameters, AppConfig.TGK_RAPID_FIRE_COUNT, "点击频率（10～50 次/秒）", 10, 50, false);
        shoulder.addView(rapidParameters, ui.wrap());
        updateRapidFeatureUi(false);
        page.addView(shoulder, ui.margins(0, 0, 0, 12));

        LinearLayout compatibility = detailCard("极速连点兼容性测试",
                "自动核验系统、调用链和原生库，再按左、右肩键分别记录实体码、中上层码与系统层码。"
                        + " 双侧稳定验证通过后只解锁开关，不会自动开启。");
        rapidCompatibilityStatus = ui.text("正在读取测试状态…", 11.5f, ui.muted, false);
        rapidCompatibilityStatus.setLineSpacing(ui.dp(1), 1.05f);
        compatibility.addView(rapidCompatibilityStatus, ui.margins(0, 9, 0, 0));
        rapidCompatibilityAction = ui.accentButton("开始兼容性测试");
        rapidCompatibilityAction.setOnClickListener(view -> onRapidCompatibilityAction());
        compatibility.addView(rapidCompatibilityAction, ui.margins(0, 9, 0, 0));
        rapidCompatibilityCancel = ui.button("取消本次测试");
        rapidCompatibilityCancel.setOnClickListener(view -> cancelRapidCompatibilityTest());
        compatibility.addView(rapidCompatibilityCancel, ui.margins(0, 6, 0, 0));
        rapidCompatibilityPanel = compatibility;
        compatibility.setVisibility(View.GONE);
        page.addView(compatibility, ui.margins(0, 0, 0, 12));
    }

    private void updateRapidFeatureUi(boolean unlocked) {
        if (rapidParameters == null) return;
        rapidFeatureUnlocked = unlocked;
        Switch control = switches.get(AppConfig.TGK_RAPID_FIRE_ENABLED);
        boolean expandable = RapidFireLifecyclePolicy.canExpand(unlocked, control.isChecked());
        if (!expandable) rapidParametersExpanded = false;
        rapidFeatureTitle.setTextColor(unlocked ? ui.text : ui.muted);
        rapidFeatureDescription.setText(unlocked
                ? "兼容性测试通过，已开放极速连点功能，开启功能后配置点击速度即可使用。"
                : "请先进行兼容性测试，以确保设备支持当前功能。");
        rapidTestEntry.setVisibility(unlocked ? View.GONE : View.VISIBLE);
        ui.setButtonEnabled(rapidTestEntry, rapidFingerprint != null && !rapidCaptureInFlight
                && (rapidSession == null || rapidSession.state != RapidFireCompatibility.State.PREFLIGHT));
        control.setVisibility(unlocked ? View.VISIBLE : View.GONE);
        rapidExpand.setVisibility(unlocked ? View.VISIBLE : View.GONE);
        rapidExpand.setEnabled(expandable);
        rapidExpand.setAlpha(expandable ? 1f : 0.35f);
        rapidExpand.setRotation(rapidParametersExpanded ? 180f : 0f);
        rapidExpand.setContentDescription(!expandable ? "开启极速连点后可展开参数"
                : rapidParametersExpanded ? "收起连点参数" : "展开连点参数");
        rapidParameters.setVisibility(rapidParametersExpanded ? View.VISIBLE : View.GONE);
        Slider slider = sliders.get(AppConfig.TGK_RAPID_FIRE_COUNT);
        if (slider != null) slider.bar.setEnabled(expandable);
    }

    private void refreshRapidCompatibilityAsync() {
        if (!MODULE_SHOULDER.equals(section) || rapidFingerprintLoading) return;
        rapidFingerprintLoading = true;
        executor.execute(() -> {
            String fingerprint = RapidFireCompatibility.currentFingerprint(this);
            RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                    config.get(AppConfig.TGK_RAPID_FIRE_TEST_SESSION));
            main.post(() -> {
                rapidFingerprintLoading = false;
                rapidFingerprint = fingerprint;
                rapidSession = session != null && session.validFor(fingerprint) ? session : null;
                refreshRapidCompatibilityUi();
                if (!rapidAutoContinueAttempted && rapidSession != null
                        && rapidSession.state == RapidFireCompatibility.State.NEEDS_RESTART) {
                    rapidAutoContinueAttempted = true;
                    runRapidPreflight(rapidSession);
                }
            });
        });
    }

    private void refreshRapidCompatibilityUi() {
        if (rapidCompatibilityStatus == null) return;
        if (rapidFingerprint == null) {
            rapidCompatibilityStatus.setText("正在计算设备兼容指纹…");
            ui.setButtonEnabled(rapidCompatibilityAction, false);
            updateRapidFeatureUi(false);
            refreshRapidCompatibilityAsync();
            return;
        }
        RapidFireCompatibility.Session storedSession = RapidFireCompatibility.Session.parse(
                config.get(AppConfig.TGK_RAPID_FIRE_TEST_SESSION));
        if (storedSession != null && !storedSession.validFor(rapidFingerprint)) {
            storedSession = null;
        }
        RapidFireCompatibility.Session memorySession = rapidSession;
        RapidFireCompatibility.Session session = memorySession != null
                && (storedSession == null || memorySession.createdAt >= storedSession.createdAt)
                ? memorySession : storedSession;
        rapidSession = session;
        RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                config.get(AppConfig.TGK_RAPID_FIRE_COMPAT_TOKEN));
        boolean fused = diagnostic("ls_augment_tgk_rapid_fire_fuse_state").startsWith("fused");
        boolean unlocked = !fused && token != null && token.validFor(rapidFingerprint);
        Switch rapid = switches.get(AppConfig.TGK_RAPID_FIRE_ENABLED);
        if (rapid != null) {
            rapid.setEnabled(unlocked);
            if (!unlocked && rapid.isChecked()) {
                boolean before = loading;
                loading = true;
                rapid.setChecked(false);
                loading = before;
                persistRapidDisabled();
            }
        }
        updateRapidFeatureUi(unlocked);

        RapidFireCompatibility.State state = fused ? RapidFireCompatibility.State.FUSED
                : unlocked ? RapidFireCompatibility.State.PASSED
                : session == null ? RapidFireCompatibility.State.UNTESTED : session.state;
        boolean expired = !unlocked && session != null && session.isExpired(System.currentTimeMillis());
        if (expired && rapidCaptureInFlight) stopRapidCapture();
        if (expired) state = RapidFireCompatibility.State.FAILED;
        if (unlocked) rapidTestPanelRequested = false;
        rapidCompatibilityPanel.setVisibility(!unlocked && (rapidTestPanelRequested
                || session != null || fused) ? View.VISIBLE : View.GONE);
        boolean capturing = !expired && rapidCaptureInFlight && session != null
                && session.id.equals(rapidCaptureSessionId)
                && ((rapidCaptureLeft && state == RapidFireCompatibility.State.WAIT_LEFT)
                || (!rapidCaptureLeft && state == RapidFireCompatibility.State.WAIT_RIGHT));
        if (capturing) {
            long remaining = Math.max(0L, rapidCaptureDeadline - System.currentTimeMillis());
            String side = rapidCaptureLeft ? "左" : "右";
            rapidCompatibilityStatus.setText(rapidCaptureFeedback != null ? rapidCaptureFeedback
                    : rapidCaptureDeadline == 0L
                    ? "正在准备肩键监听…准备完成后开始 8 秒倒计时。"
                    : "肩键已临时唤醒。请只触摸并松开" + side
                    + "肩键（剩余约 " + ((remaining + 999L) / 1000L)
                    + " 秒）；采集结束后自动恢复原状态。");
            rapidCompatibilityStatus.setTextColor(ui.muted);
            rapidCompatibilityAction.setText("正在采集" + side + "肩键…");
            ui.setButtonEnabled(rapidCompatibilityAction, false);
            rapidCompatibilityCancel.setVisibility(View.VISIBLE);
            return;
        }
        String text;
        String action;
        switch (state) {
            case PREFLIGHT:
                text = "正在预检 Root、ABI、目标包、system_server Hook、原生库与熔断状态；"
                        + "游戏空间上层调用会在左右键阶段动态验证。";
                action = "正在检测…";
                break;
            case NEEDS_RESTART:
                text = "system_server 尚未加载当前模块。重启后会自动继续预检。";
                action = "确认后重启设备";
                break;
            case WAIT_LEFT:
                text = "等待左肩键：预检完成后会自动开启 8 秒采集。采集成功后，再到游戏空间"
                        + "重新选择一次原厂连点，再按住左键约 3 秒并松开，返回检查。测试值固定为 20 次/秒，必须测到实际循环速度和松开停止。";
                action = session != null && session.physicalLeft > 0
                        ? "检查左键调用链" : "8 秒内采集左键";
                break;
            case WAIT_RIGHT:
                text = "左键已通过。按同样步骤采集并验证右肩键；左右三层编号允许不同。";
                action = session != null && session.physicalRight > 0
                        ? "检查右键调用链" : "8 秒内采集右键";
                break;
            case VERIFYING:
                long remaining = session == null ? 10_000L : Math.max(0L,
                        RapidFireCompatibility.STABILITY_REQUIRED_MS
                                - (System.currentTimeMillis() - session.verifyingSince));
                text = "双侧调用与原生应用均已出现，正在确认 system_server 稳定运行。还需约 "
                        + ((remaining + 999L) / 1000L) + " 秒。";
                action = "完成稳定性验证";
                break;
            case PASSED:
                text = unlocked ? "兼容性测试已通过，极速连点已解锁。"
                        : "设备或模块版本已变化，旧兼容令牌失效，需要重新测试。";
                action = "重新进行兼容性测试";
                break;
            case FUSED:
                text = "连续三次未稳定启动，原生极速连点已熔断。清除后仍必须重新测试。";
                action = "确认清除熔断";
                break;
            case FAILED:
                text = expired ? "本次测试已超过 10 分钟，目标已归零，请重新开始。"
                        : "兼容测试未通过；功能保持锁定，原厂肩键不受影响。";
                action = "重新开始测试";
                break;
            default:
                text = "尚未进行兼容性测试。未通过前无法开启极速连点。";
                action = "开始兼容性测试";
                break;
        }
        rapidCompatibilityStatus.setText(rapidCaptureFeedback != null
                && (state == RapidFireCompatibility.State.WAIT_LEFT
                || state == RapidFireCompatibility.State.WAIT_RIGHT)
                ? rapidCaptureFeedback + "\n\n" + text : text);
        rapidCompatibilityStatus.setTextColor(
                state == RapidFireCompatibility.State.FAILED
                        || state == RapidFireCompatibility.State.FUSED ? ui.danger : ui.muted);
        rapidCompatibilityAction.setText(action);
        ui.setButtonEnabled(rapidCompatibilityAction,
                state != RapidFireCompatibility.State.PREFLIGHT);
        rapidCompatibilityCancel.setVisibility(session != null && session.active(
                System.currentTimeMillis()) ? View.VISIBLE : View.GONE);
    }

    private void onRapidCompatibilityAction() {
        if (rapidCaptureInFlight) return;
        RapidFireCompatibility.Session session = rapidSession;
        long now = System.currentTimeMillis();
        RapidFireCompatibility.State state = session == null
                ? RapidFireCompatibility.State.UNTESTED : session.state;
        if (diagnostic("ls_augment_tgk_rapid_fire_fuse_state").startsWith("fused")) {
            clearRapidFuse();
        } else if (session == null || session.isExpired(now)
                || state == RapidFireCompatibility.State.UNTESTED
                || state == RapidFireCompatibility.State.FAILED
                || state == RapidFireCompatibility.State.PASSED) {
            stopRapidCapture();
            rapidCaptureFeedback = null;
            RapidFireCompatibility.Session created = RapidFireCompatibility.Session.start(
                    rapidFingerprint, now);
            if (created == null) {
                toast("无法建立兼容性测试会话，请重新进入此页面");
                return;
            }
            rapidSession = created;
            refreshRapidCompatibilityUi();
            runRapidPreflight(created);
        } else if (state == RapidFireCompatibility.State.NEEDS_RESTART) {
            confirmRapidRestart();
        } else if (state == RapidFireCompatibility.State.WAIT_LEFT) {
            if (session.physicalLeft <= 0) captureRapidPhysicalWithRoot(session, true);
            else verifyRapidSide(session, true);
        } else if (state == RapidFireCompatibility.State.WAIT_RIGHT) {
            if (session.physicalRight <= 0) captureRapidPhysicalWithRoot(session, false);
            else verifyRapidSide(session, false);
        } else if (state == RapidFireCompatibility.State.VERIFYING) {
            finishRapidVerification(session);
        }
    }

    private void persistRapidDisabled() {
        if (rapidDisablePersistPending) return;
        rapidDisablePersistPending = true;
        executor.execute(() -> {
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.TGK_RAPID_FIRE_ENABLED, "0");
            config.save(update);
            main.post(() -> rapidDisablePersistPending = false);
        });
    }

    private void runRapidPreflight(RapidFireCompatibility.Session session) {
        if (session == null || session.isExpired(System.currentTimeMillis())) return;
        RapidFireCompatibility.Session preflight = session.withState(
                RapidFireCompatibility.State.PREFLIGHT,
                System.currentTimeMillis());
        rapidSession = preflight;
        refreshRapidCompatibilityUi();
        executor.execute(() -> {
            RapidFireCompatibility.State result = RapidFireCompatibility.State.WAIT_LEFT;
            RootHideManager.RootStatus root = new RootHideManager(this).rootStatus();
            if (root.state != RootHideManager.RootState.GRANTED) {
                result = RapidFireCompatibility.State.FAILED;
            } else if (RapidFireCompatibility.nativeProfile() == null
                    || !packageInstalled("cn.nubia.gamelauncher")
                    || !packageInstalled("cn.nubia.gameassist")
                    || !rapidNativeLibraryPresent()) {
                result = RapidFireCompatibility.State.FAILED;
            } else {
                RootShell.Result fuse = RootShell.run(
                        "settings get global ls_augment_tgk_fuse_tripped",
                        null, 5, 1024);
                if (fuse.isSuccess() && "1".equals(fuse.output.trim())) {
                    result = RapidFireCompatibility.State.FUSED;
                } else if (!rapidSystemHookIsCurrent()) {
                    result = RapidFireCompatibility.State.NEEDS_RESTART;
                }
            }
            RapidFireCompatibility.Session resolved = preflight.withState(
                    result, System.currentTimeMillis());
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.TGK_RAPID_FIRE_ENABLED, "0");
            update.put(AppConfig.TGK_RAPID_FIRE_COMPAT_TOKEN, "");
            update.put(AppConfig.TGK_RAPID_FIRE_TEST_SESSION, resolved.serialize());
            update.put(AppConfig.TGK_RAPID_FIRE_COUNT,
                    String.valueOf(RapidFireCompatibility.TEST_CPS));
            AppConfig.SaveResult saved = config.save(update);
            main.post(() -> {
                rapidSession = resolved;
                if (!saved.success) toast(saved.message);
                refreshRapidCompatibilityUi();
                if (saved.success && resolved.state == RapidFireCompatibility.State.WAIT_LEFT
                        && isCurrentRapidSession(resolved) && !isFinishing()) {
                    main.postDelayed(() -> captureRapidPhysicalWithRoot(resolved, true), 250L);
                }
            });
        });
    }

    private boolean packageInstalled(String packageName) {
        try {
            getPackageManager().getPackageInfo(packageName, 0);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private boolean rapidNativeLibraryPresent() {
        try {
            String directory = getApplicationInfo().nativeLibraryDir;
            return directory != null && new File(directory, "liblsaugment_tgk.so").isFile();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private void captureRapidPhysicalWithRoot(RapidFireCompatibility.Session session,
            boolean left) {
        if (isFinishing() || isDestroyed() || rapidPagePaused
                || rapidCaptureInFlight || session == null || !isCurrentRapidSession(session)
                || session.isExpired(System.currentTimeMillis())
                || (left && session.state != RapidFireCompatibility.State.WAIT_LEFT)
                || (!left && session.state != RapidFireCompatibility.State.WAIT_RIGHT)) return;
        rapidCaptureInFlight = true;
        rapidCaptureLeft = left;
        rapidCaptureDeadline = 0L;
        rapidCaptureSessionId = session.id;
        int captureGeneration = ++rapidCaptureGeneration;
        rapidCaptureFeedback = null;
        RapidFirePhysicalCapture controller = new RapidFirePhysicalCapture();
        rapidPhysicalCapture = controller;
        refreshRapidCompatibilityUi();
        rapidCaptureExecutor.execute(() -> {
            RootShell.Result inventory = RootShell.run("cat /proc/bus/input/devices",
                    null, 4, 64 * 1024);
            java.util.List<RapidFireInputDetector.Device> devices = inventory.isSuccess()
                    ? RapidFireInputDetector.discover(inventory.output)
                    : Collections.emptyList();
            if (devices.isEmpty()) {
                main.post(() -> finishRapidCaptureFailure(captureGeneration, session,
                        "未识别到可安全监听的肩键输入设备；原厂肩键保持不变"));
                return;
            }
            RapidFirePhysicalCapture.Result result = controller.run(
                    getApplicationContext(), devices, left, () -> main.post(() -> {
                        if (captureGeneration != rapidCaptureGeneration || rapidPagePaused) return;
                        rapidCaptureDeadline = System.currentTimeMillis()
                                + RapidFirePhysicalCapture.CAPTURE_MS;
                        refreshRapidCompatibilityUi();
                    }), () -> main.post(() -> {
                        if (captureGeneration != rapidCaptureGeneration || rapidPagePaused) return;
                        rapidCaptureFeedback = "已收到" + (left ? "左" : "右")
                                + "肩键的按下和松开，正在结束采集并恢复原状态…";
                        refreshRapidCompatibilityUi();
                    }));
            RapidFireInputDetector.Capture capture = result.capture;
            main.post(() -> {
                if (captureGeneration != rapidCaptureGeneration
                        || !isCurrentRapidSession(session) || isFinishing() || isDestroyed()) return;
                rapidCaptureInFlight = false;
                rapidPhysicalCapture = null;
                rapidCaptureDeadline = 0L;
                rapidCaptureSessionId = null;
                if (session.isExpired(System.currentTimeMillis())) {
                    refreshRapidCompatibilityUi();
                    return;
                }
                if (capture == null) {
                    rapidCaptureFeedback = result.message;
                    toast(result.message);
                    refreshRapidCompatibilityUi();
                    return;
                }
                if (!left && capture.code == session.physicalLeft) {
                    rapidCaptureFeedback = "左右肩键输入码冲突，请确认本次只触摸右肩键后重试";
                    toast(rapidCaptureFeedback);
                    refreshRapidCompatibilityUi();
                    return;
                }
                RapidFireCompatibility.Session updated = left
                        ? session.withLeft(capture.code, session.upperLeft, session.systemLeft)
                        : session.withRight(capture.code, session.upperRight, session.systemRight);
                rapidCaptureFeedback = "已采集" + (left ? "左" : "右")
                        + "肩键的触摸/松开事件，肩键已恢复原状态";
                persistRapidSession(updated, null, rapidCaptureFeedback);
            });
        });
    }

    private void finishRapidCaptureFailure(int generation,
            RapidFireCompatibility.Session session, String message) {
        if (generation != rapidCaptureGeneration || !isCurrentRapidSession(session)) return;
        if (isFinishing() || isDestroyed()) return;
        rapidCaptureInFlight = false;
        rapidPhysicalCapture = null;
        rapidCaptureDeadline = 0L;
        rapidCaptureSessionId = null;
        rapidCaptureFeedback = message;
        toast(message);
        refreshRapidCompatibilityUi();
    }

    private boolean isCurrentRapidSession(RapidFireCompatibility.Session session) {
        RapidFireCompatibility.Session current = rapidSession;
        return session != null && current != null && session.id.equals(current.id);
    }

    private void stopRapidCapture() {
        RapidFirePhysicalCapture controller = rapidPhysicalCapture;
        rapidPhysicalCapture = null;
        if (controller != null) controller.cancel();
        rapidCaptureGeneration++;
        rapidCaptureInFlight = false;
        rapidCaptureDeadline = 0L;
        rapidCaptureSessionId = null;
    }

    private void verifyRapidSide(RapidFireCompatibility.Session session, boolean left) {
        ui.setButtonEnabled(rapidCompatibilityAction, false);
        executor.execute(() -> {
            String side = left ? "left" : "right";
            int system = diagnosticCode(
                    diagnostic("ls_augment_tgk_rapid_fire_test_system_" + side), session.id);
            RapidFireRouteEvidence routes = RapidFireRouteEvidence.parse(
                    diagnostic(RapidFireRouteEvidence.DIAGNOSTIC_PREFIX + side));
            String expectedPhase = left ? "WAIT_LEFT" : "WAIT_RIGHT";
            int upper = routes != null && routes.matches(session.id, expectedPhase)
                    ? routes.resolve(system) : -1;
            int physical = left ? session.physicalLeft : session.physicalRight;
            boolean nativeApplied = system > 0 && (nativeWitnessApplied(
                    diagnostic("ls_augment_tgk_rapid_fire_test_native_" + side),
                    session.id, side) || nativeLogContains(system, session.createdAt));
            if (physical <= 0 || upper <= 0 || system <= 0 || !nativeApplied) {
                main.post(() -> {
                    if (!isCurrentRapidSession(session) || isFinishing() || isDestroyed()) return;
                    rapidCaptureFeedback = routes != null && routes.matches(session.id, expectedPhase)
                            && routes.isConflicted()
                            ? "同一测试阶段出现不唯一的上下层对应关系，未放行；请取消本次测试后重新开始"
                            : "尚未取得当前肩键的完整调用对应关系。请在游戏空间重新选择原厂连点，按住"
                            + (left ? "左" : "右") + "肩键后再检查";
                    toast(rapidCaptureFeedback);
                    refreshRapidCompatibilityUi();
                });
                return;
            }
            if(!rapidCadenceWitnessReady(session,side,system)){
                main.post(()->{if(!isCurrentRapidSession(session)||isFinishing()||isDestroyed())return;
                    rapidCaptureFeedback="调用链已经接通，还需测量实际连点与松开停止。请再次按住"+(left?"左":"右")+"肩键约 3 秒，松开后再检查。";
                    toast(rapidCaptureFeedback);refreshRapidCompatibilityUi();});return;
            }
            RapidFireCompatibility.Session updated = left
                    ? session.withLeft(physical, upper, system).withState(
                    RapidFireCompatibility.State.WAIT_RIGHT, System.currentTimeMillis())
                    : session.withRight(physical, upper, system).withState(
                    RapidFireCompatibility.State.VERIFYING, System.currentTimeMillis());
            if (!left && (updated.physicalLeft == updated.physicalRight
                    || updated.upperLeft == updated.upperRight
                    || updated.systemLeft == updated.systemRight)) {
                updated = updated.withState(RapidFireCompatibility.State.FAILED,
                        System.currentTimeMillis());
            }
            RapidFireCompatibility.Session finalUpdated = updated;
            main.post(() -> {
                if (!isCurrentRapidSession(session) || isFinishing() || isDestroyed()) return;
                rapidCaptureFeedback = finalUpdated.state == RapidFireCompatibility.State.FAILED
                        ? "左右键映射冲突，测试失败" : left
                        ? "左键三层调用已通过，请继续右键" : "双侧已通过，开始 10 秒稳定验证";
                persistRapidSession(finalUpdated, null, rapidCaptureFeedback);
            });
        });
    }

    private static int diagnosticCode(String value, String sessionId) {
        if (value == null || sessionId == null || !value.contains("id=" + sessionId + "|")) {
            return -1;
        }
        int start = value.indexOf("|code=");
        if (start < 0) return -1;
        start += 6;
        int end = value.indexOf('|', start);
        try { return Integer.parseInt(end < 0 ? value.substring(start)
                : value.substring(start, end)); }
        catch (Throwable ignored) { return -1; }
    }

    private boolean rapidCadenceWitnessReady(RapidFireCompatibility.Session session,String side,int code){
        String value=diagnostic("ls_augment_tgk_rapid_fire_test_cadence_"+side);
        return value.contains("id="+session.id+"|")&&value.contains("|phase="+session.state.name()+"|")
                &&value.contains("|ready=1|")&&value.contains("|key="+code+"|")&&value.contains("|passed=1|");
    }

    private boolean nativeLogContains(int systemCode, long afterMillis) {
        RootShell.Result log = RootShell.run(
                "logcat -d -v epoch -s 'LS_Augment/TgkNative:I' '*:S' 2>/dev/null | tail -n 256",
                null, 6, 128 * 1024);
        if (!log.isSuccess()) return false;
        String marker = "NATIVE_HIT key=" + systemCode + " cps="
                + RapidFireCompatibility.TEST_CPS;
        for (String line : log.output.split("\\r?\\n")) {
            if (!line.contains(marker)) continue;
            int space = line.indexOf(' ');
            try {
                double seconds = Double.parseDouble(space < 0 ? line : line.substring(0, space));
                if ((long) (seconds * 1000.0) + 2_000L >= afterMillis) return true;
            } catch (Throwable ignored) { }
        }
        return false;
    }

    private void finishRapidVerification(RapidFireCompatibility.Session session) {
        long now = System.currentTimeMillis();
        long elapsed = now - session.verifyingSince;
        if (elapsed < RapidFireCompatibility.STABILITY_REQUIRED_MS) {
            toast("还需等待约 " + ((RapidFireCompatibility.STABILITY_REQUIRED_MS
                    - elapsed + 999L) / 1000L) + " 秒");
            return;
        }
        if (!rapidStabilityWitnessReady(session)) {
            toast("system_server 尚未返回完整的 10 秒稳定证明，请稍后再点一次");
            return;
        }
        executor.execute(() -> {
            RootShell.Result fuse = RootShell.run(
                    "settings get global ls_augment_tgk_fuse_tripped",
                    null, 5, 1024);
            boolean safe = fuse.isSuccess() && !"1".equals(fuse.output.trim())
                    && rapidSystemHookIsCurrent()
                    && rapidHookIsCurrent("ls_augment_tgk_rapid_fire_installed");
            RapidFireCompatibility.Token token = safe
                    ? RapidFireCompatibility.Token.issue(rapidFingerprint,
                    session.physicalLeft, session.upperLeft, session.systemLeft,
                    session.physicalRight, session.upperRight, session.systemRight, now)
                    : null;
            RapidFireCompatibility.Session completed = session.withState(token == null
                    ? RapidFireCompatibility.State.FAILED
                    : RapidFireCompatibility.State.PASSED, now);
            main.post(() -> persistRapidSession(completed, token,
                    token == null ? "稳定验证失败，功能保持锁定"
                            : "兼容性测试通过；开关已解锁但未自动开启"));
        });
    }

    private void persistRapidSession(RapidFireCompatibility.Session session,
            RapidFireCompatibility.Token token, String message) {
        executor.execute(() -> {
            if (session != null && !isCurrentRapidSession(session)) return;
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.TGK_RAPID_FIRE_ENABLED, "0");
            update.put(AppConfig.TGK_RAPID_FIRE_TEST_SESSION,
                    session == null ? "" : session.serialize());
            if (token != null) update.put(AppConfig.TGK_RAPID_FIRE_COMPAT_TOKEN,
                    token.serialize());
            AppConfig.SaveResult result = config.save(update);
            main.post(() -> {
                if (session != null && !isCurrentRapidSession(session)) return;
                rapidSession = session;
                toast(result.success ? message : result.message);
                refreshRapidCompatibilityUi();
            });
        });
    }

    private boolean rapidHookIsCurrent(String key) {
        String value = diagnostic(key);
        return value.contains("|module=" + BuildConfig.VERSION_NAME
                + "|schema=" + ConfigSchema.VERSION);
    }

    private boolean rapidSystemHookIsCurrent() {
        String value = diagnostic("ls_augment_tgk_rapid_fire_system_installed");
        if (!rapidHookIsCurrent("ls_augment_tgk_rapid_fire_system_installed")) return false;
        int marker = value.indexOf("|pid=");
        if (marker < 0) return false;
        int end = value.indexOf('|', marker + 5);
        String expected = end < 0 ? value.substring(marker + 5)
                : value.substring(marker + 5, end);
        if (!expected.matches("[0-9]+")) return false;
        RootShell.Result process = RootShell.run("pidof system_server", null, 4, 1024);
        if (!process.isSuccess()) return false;
        for (String pid : process.output.trim().split("\\s+")) {
            if (expected.equals(pid)) return true;
        }
        return false;
    }

    private static boolean nativeWitnessApplied(String value, String sessionId, String side) {
        if (value == null || sessionId == null || side == null
                || !value.contains("id=" + sessionId + "|")) return false;
        String field = "left".equals(side) ? "left_applied=" : "right_applied=";
        int start = value.indexOf(field);
        if (start < 0) return false;
        start += field.length();
        int end = value.indexOf('|', start);
        try {
            return Long.parseLong(end < 0 ? value.substring(start)
                    : value.substring(start, end)) > 0L;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private boolean rapidStabilityWitnessReady(RapidFireCompatibility.Session session) {
        if (session == null) return false;
        String witness = diagnostic("ls_augment_tgk_rapid_fire_test_stability");
        return witness.contains("id=" + session.id + "|")
                && witness.contains("|complete=1|")
                && nativeWitnessApplied(witness, session.id, "left")
                && nativeWitnessApplied(witness, session.id, "right");
    }

    private void cancelRapidCompatibilityTest() {
        stopRapidCapture();
        executor.execute(() -> {
            LinkedHashMap<String, String> update = new LinkedHashMap<>();
            update.put(AppConfig.TGK_RAPID_FIRE_ENABLED, "0");
            update.put(AppConfig.TGK_RAPID_FIRE_COMPAT_TOKEN, "");
            update.put(AppConfig.TGK_RAPID_FIRE_TEST_SESSION, "");
            AppConfig.SaveResult result = config.save(update);
            main.post(() -> {
                rapidSession = null;
                toast(result.success ? "测试已取消，原生目标已归零" : result.message);
                refreshRapidCompatibilityUi();
            });
        });
    }

    private void confirmRapidRestart() {
        new AlertDialog.Builder(this)
                .setTitle("重启设备")
                .setMessage("重启会中断当前应用与游戏。重启后再次进入本页，测试会自动继续。")
                .setNegativeButton("取消", null)
                .setPositiveButton("立即重启", (dialog, which) -> executor.execute(() ->
                        RootShell.run("reboot", null, 5, 1024)))
                .show();
    }

    private void clearRapidFuse() {
        new AlertDialog.Builder(this)
                .setTitle("清除极速连点熔断")
                .setMessage("仅清除故障锁，不会开启功能；清除后必须重新完成双侧测试。")
                .setNegativeButton("取消", null)
                .setPositiveButton("清除并重测", (dialog, which) -> executor.execute(() -> {
                    RootShell.Result clear = RootShell.run(
                            "settings put global ls_augment_tgk_fuse_tripped 0; "
                                    + "settings put global ls_augment_tgk_fuse_attempts 0; "
                                    + "settings put global ls_augment_tgk_fuse_pending 0",
                            null, 6, 4096);
                    AppConfig.SaveResult reset = new AppConfig.SaveResult(false,
                            "未清除兼容配置");
                    if (clear.isSuccess()) {
                        LinkedHashMap<String, String> update = new LinkedHashMap<>();
                        update.put(AppConfig.TGK_RAPID_FIRE_ENABLED, "0");
                        update.put(AppConfig.TGK_RAPID_FIRE_COMPAT_TOKEN, "");
                        update.put(AppConfig.TGK_RAPID_FIRE_TEST_SESSION, "");
                        reset = config.save(update);
                        if (reset.success) {
                            getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit()
                                    .putString("ls_augment_tgk_rapid_fire_fuse_state",
                                            "cleared|attempts=0")
                                    .apply();
                        }
                    }
                    AppConfig.SaveResult finalReset = reset;
                    main.post(() -> {
                        if (!clear.isSuccess()) toast("清除失败：" + clear.publicError());
                        else if (!finalReset.success) toast(finalReset.message);
                        else {
                            rapidSession = null;
                            onRapidCompatibilityAction();
                        }
                    });
                })).show();
    }

    private void buildAiTrigger() {
        LinearLayout card=featureCard(AppConfig.AI_TRIGGER_ENABLED,"AI 触发器极速响应","关闭时恢复原厂触发周期。首次启用后重启游戏作用域。");
        LinearLayout body=settingsBody(card,AppConfig.AI_TRIGGER_ENABLED);
        addSlider(body,AppConfig.AI_TRIGGER_TEMPLATE_SCAN_MS,"模板扫描间隔 ms",80,2000,false);
        addSlider(body,AppConfig.AI_TRIGGER_CLICK_MS,"点击队列间隔 ms",10,500,false);
        addSlider(body,AppConfig.AI_TRIGGER_COOLDOWN_MS,"策略冷却 ms",50,2000,false);
        addSlider(body,AppConfig.AI_TRIGGER_YOLO_SCAN_MS,"YOLO 扫描间隔 ms",150,1500,false);
    }

    private void buildComboSpeed() {
        LinearLayout card=featureCard(AppConfig.COMBO_SPEED_ENABLED,"一键连招速度","保留原始录制，修改后下一次播放使用新倍率。");
        addSlider(settingsBody(card,AppConfig.COMBO_SPEED_ENABLED),AppConfig.COMBO_SPEED_RATE,"播放倍率（×）",1,10,false);
    }

    private void buildFanControl() {
        LinearLayout fan=featureCard(AppConfig.FAN_FIXED_ENABLED,"固定风扇转速","跟随原厂风扇开关，匹配最接近的实测档位；不会自行启动风扇。");
        LinearLayout speed=settingsBody(fan,AppConfig.FAN_FIXED_ENABLED);addSlider(speed,AppConfig.FAN_TARGET_RPM,"目标转速 RPM",500,500,1,false);
        featureCard(AppConfig.FAN_UNLOCK_MAX,"解除原厂极限转速限制","允许使用已验证驱动的第 5 档；跟随原厂极速模式，不自行启动风扇。");
        LinearLayout measurement=detailCard("本机转速测量","依次检测 1～5 档，完成后恢复原厂档位。结果用于选择固定转速。");
        fanMeasurementSummary=ui.text("尚未测量",12,ui.muted,false);measurement.addView(fanMeasurementSummary);
        Button measure=ui.tonalButton("检测本机风扇转速");measure.setOnClickListener(v->showFanMeasurement());measurement.addView(measure,ui.margins(0,10,0,0));
        page.addView(measurement,ui.margins(0,0,0,12));refreshFanMeasurement();
    }
    private void showFanMeasurement(){
        fanDialog=new AlertDialog.Builder(this).setTitle("检测本机风扇转速").setMessage("请先打开原厂风扇。检测约 1 分钟，完成后恢复原档位；关闭风扇或取消即可停止。")
            .setNegativeButton("取消",(d,w)->{if(fanRequestAt>0)requestFanMeasurement(false);fanRequestAt=0;})
            .setPositiveButton("开始检测",null).create();
        fanDialog.setOnCancelListener(d->{if(fanRequestAt>0)requestFanMeasurement(false);fanRequestAt=0;});fanDialog.show();
        fanDialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{
            fanDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            executor.execute(()->{RootShell.Result result=RootShell.run("cat /sys/kernel/fan/fan_enable",null,5,1024);main.post(()->{
                if(fanDialog==null||!fanDialog.isShowing())return;
                if(!result.isSuccess()||!result.output.trim().equals("1")){fanDialog.setMessage("尚未检测到原厂风扇开启。请打开原厂风扇后重试。");fanDialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);return;}
                fanRequestAt=System.currentTimeMillis();fanDialog.setMessage("正在检测，请保持风扇开启…");requestFanMeasurement(true);
            });});
        });
    }

    private void requestFanMeasurement(boolean start) {
        executor.execute(() -> {
            LinkedHashMap<String, String> updates = new LinkedHashMap<>();
            updates.put(ConfigSchema.FAN_CALIBRATION_REQUEST, start
                    ? System.currentTimeMillis() + ":" + java.util.UUID.randomUUID().toString().replace("-", "") : "");
            AppConfig.SaveResult result = config.save(updates);
            main.post(() -> {
                toast(result.success ? (start ? "测量请求已发送，请保持原厂风扇开启" : "已请求停止测量并恢复") : result.message);
                renderRuntimeStatus();
            });
        });
    }

    private void refreshFanMeasurement() {
        if (fanMeasurementSummary == null) return;
        String encoded = config.get(ConfigSchema.FAN_MEASUREMENT);
        if(fanDialog!=null&&fanDialog.isShowing()&&fanRequestAt>0){
            FanCalibrationData measured=FanCalibrationData.parse(encoded);String state=config.diagnostic("ls_augment_fan_control_active");
            if(measured!=null&&measured.measuredAt>=fanRequestAt){fanDialog.setMessage("检测完成，已恢复原厂档位。结果已显示在页面。");fanRequestAt=0;fanDialog.getButton(AlertDialog.BUTTON_NEGATIVE).setText("完成");}
            else if(System.currentTimeMillis()-fanRequestAt>120000){requestFanMeasurement(false);fanDialog.setMessage("检测超时，已请求恢复原厂档位。请在运行诊断中导出日志排查。");fanRequestAt=0;}
            else if(state.contains("measuring;")){java.util.regex.Matcher match=java.util.regex.Pattern.compile("level=(\\d+);sample=(\\d+)").matcher(state);if(match.find())fanDialog.setMessage("正在检测第 "+match.group(1)+" / 5 档，采样 "+match.group(2)+" / 5。取消将停止并恢复原档位。");}
        }
        FanCalibrationData data = FanCalibrationData.parse(encoded);
        boolean current = data != null && data.currentFor(FanHardwareIdentity.current());
        StringBuilder text = new StringBuilder("红魔 11 Pro / 11S Pro 官方标称：24,000 RPM\n已验证驱动最高档：5（同时调用原厂最高性能模式）\n");
        if (data == null) text.append("本机实测：尚未测量");
        else {
            text.append(current ? "最近测量：" : "系统已变化，请重新测量。旧记录：")
                    .append(DateFormat.getDateTimeInstance().format(new Date(data.measuredAt)))
                    .append("\n最高档稳定转速：").append(data.rpm(5)).append(" RPM")
                    .append("\n本轮最高反馈：").append(data.peak(5)).append(" RPM");
            for (int i = 1; i <= 5; i++) text.append("\n").append(i).append(" 档：").append(data.rpm(i)).append(" RPM");
        }
        fanMeasurementSummary.setText(text);
        Slider target = sliders.get(AppConfig.FAN_TARGET_RPM);
        if (target != null) {
            target.bar.setEnabled(current);
            if (!encoded.equals(renderedFanMeasurement)) {
                int requested = renderedFanMeasurement == null || renderedFanMeasurement.isEmpty()
                        ? config.getInt(AppConfig.FAN_TARGET_RPM, 12000) : target.value();
                target.min = current ? data.rpm(1) : 500;
                target.max = current ? data.rpm(5) : 500;
                target.bar.setMax(target.max - target.min);
                target.setValue(requested);
                renderedFanMeasurement = encoded;
            }
            if (!current) target.text.setText("请先测量本机各档转速");
        }
    }

    private void buildFreeform() {
        featureCard(AppConfig.FREEFORM_UNLIMITED,"解除小窗数量上限","允许同时创建并最小化超过三个自由窗口。");
        LinearLayout card=featureCard(AppConfig.FREEFORM_ALL_APPS,"全应用支持小窗","普通应用可使用小窗；系统关键界面保持原厂保护。");
        addAppSelection(settingsBody(card,AppConfig.FREEFORM_ALL_APPS),AppConfig.FREEFORM_EXCLUDED_APPS,"遵循原厂小窗应用");
    }

    private void buildAudioGain() {
        LinearLayout card=featureCard(ConfigSchema.AUDIO_GAIN_ENABLED,"超过 100% 的音量","按输出设备和声音类型独立设置上限；设为 100% 时不增加增益。");
        LinearLayout body=settingsBody(card,ConfigSchema.AUDIO_GAIN_ENABLED);
        addSlider(body,ConfigSchema.AUDIO_GAIN_STEP,"每次按键增加的百分比",1,20,1,false);
        String[] routes={"speaker","wired","bluetooth"},labels={"扬声器","有线 / USB 耳机","蓝牙音频"};
        for(int i=0;i<routes.length;i++){
            LinearLayout channel=detailCard(labels[i],"100% 为原厂上限，实际可用增益取决于当前播放通道。");
            addSlider(channel,AudioGainPolicy.key(routes[i],3),"媒体上限（%）",100,300,5,false);
            addSlider(channel,AudioGainPolicy.key(routes[i],2),"铃声上限（%）",100,300,5,false);
            addSlider(channel,AudioGainPolicy.key(routes[i],4),"闹钟上限（%）",100,300,5,false);
            body.addView(channel,ui.margins(0,12,0,0));
        }
    }

    private void buildBattery() {
        LinearLayout card=detailCard("实际电池数据","直接读取系统电量计、厂商接口与原厂历史记录，保留每项数据的来源。");
        batteryReadout=ui.text("正在读取…",13,ui.text,false);card.addView(batteryReadout,ui.wrap());page.addView(card,ui.margins(0,0,0,12));
        featureCard(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION,"持续关闭按循环降压","部分厂商会随电池循环次数增加而降低充电电压。开启后，持续关闭已识别的这项降压策略；关闭本功能则恢复原厂策略。不修改循环次数，不修复电池老化，温度、电流和电压保护仍然保留。");
        page.addView(ui.section("关于容量","容量估计是当前充满电量与设计容量的比值，不代表锁定了固定比例的电池容量。"),ui.wrap());refreshBattery();
    }

    private void refreshBattery() {
        executor.execute(() -> {
            Map<String, String> values = BatteryLifeControl.read();
            String base = "/sys/class/power_supply/battery/", oem = "/sys/class/qcom-battery/";
            StringBuilder text = new StringBuilder();
            if (values.containsKey("error")) text.append(values.get("error"));
            else {
                text.append("系统电量计完整循环：").append(values.getOrDefault(base+"cycle_count", "未提供")).append(" 次\n");
                Long record = BatteryLifePolicy.lastRecordedCycles(values.get("/mnt/vendor/persist/zstats/cycle.dat"));
                text.append("原厂最近历史记录：").append(record == null ? "未提供" : record+" 次").append('\n');
                text.append("厂商独立累计字段：").append(values.getOrDefault(oem+"battery_cycle", "未提供")).append("（独立字段，统计口径未公开）\n");
                try {
                    long full = Long.parseLong(values.get(base+"charge_full")), design = Long.parseLong(values.get(base+"charge_full_design"));
                    if (full > 0 && design > 0) text.append(String.format(Locale.ROOT,"当前满充估计：%.0f mAh\n设计容量：%.0f mAh\n容量估计比：%.1f%%\n", full/1000d, design/1000d, full*100d/design));
                } catch (Exception ignored) { text.append("容量数据未提供\n"); }
                Boolean enabled = BatteryLifePolicy.reductionEnabled(values.get("/vendor/etc/.tp/zte_battery_life.conf"));
                text.append("按循环降压配置：").append(enabled == null ? "未识别，保持原样" : enabled ? "原厂已启用" : "已关闭");
            }
            main.post(() -> { if (batteryReadout != null) batteryReadout.setText(text); });
        });
    }

    private AppConfig.SaveResult saveConfiguration(Map<String, String> updates) {
        if (!MODULE_BATTERY.equals(section)) return config.save(updates);
        boolean before = config.getBoolean(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION);
        boolean requested = ConfigSchema.truthy(updates.get(ConfigSchema.BATTERY_DISABLE_AGE_REDUCTION));
        RootShell.Result applied = BatteryLifeControl.reconcile(this, requested);
        if (!applied.isSuccess()) return new AppConfig.SaveResult(false, applied.output);
        AppConfig.SaveResult saved = config.save(updates);
        if (!saved.success) BatteryLifeControl.reconcile(this, before);
        else main.post(this::refreshBattery);
        return saved.success ? new AppConfig.SaveResult(true, applied.output) : saved;
    }

    private void addAppSelection(LinearLayout parent, String key, String label) {
        EditText value = new EditText(this);
        inputs.put(key, value);
        Button button = ui.button(label);
        Runnable render = () -> button.setText(label + "（"
                + AppPackageSet.parse(value.getText().toString()).size() + " 个）");
        value.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                render.run();
                markDirty();
            }
            @Override public void afterTextChanged(Editable value) { }
        });
        button.setOnClickListener(view -> AppSelectionDialog.show(this, ui, label,
                value.getText().toString(), value::setText));
        parent.addView(button, ui.margins(0, 10, 0, 0));
        render.run();
    }

    private void buildSuperResolution() {
        featureCard(AppConfig.SUPER_MIRROR_LOW_MODE,"性能模式超分","允许其他性能模式使用红魔原生超分辨率。");
        featureCard(AppConfig.SUPER_MIRROR_DIABLO_COEXIST,"超分与破坏神共存","阻止两项能力互相自动关闭。");
    }

    private void buildDiabloCoexist() {
        LinearLayout mirror = detailCard("超分与破坏神共存",
                "保留用户主动关闭能力，只阻止红魔在二者之间自动互斥。");
        addSwitch(mirror, AppConfig.SUPER_MIRROR_DIABLO_COEXIST, "允许超分与破坏神共存",
                "只阻止二者互相自动关闭。", false);
        page.addView(mirror, ui.margins(0, 0, 0, 12));
    }

    private void buildStatusLayout() {
        LinearLayout master = detailCard("状态栏布局",
                "直接调整当前手机的真实状态栏；找不到 OEM 结构时保持原生布局。");
        addSwitch(master, AppConfig.SYSTEMUI_MASTER, "启用状态栏增强",
                "总开关关闭时保持红魔 SystemUI 原生布局。", true);
        addSwitch(master, AppConfig.STATUSBAR_DUAL_LEFT, "左侧双排", "左侧增加第二排实时信息。", false);
        addSwitch(master, AppConfig.STATUSBAR_DUAL_RIGHT, "右侧双排", "右侧增加第二排实时信息。", false);
        addSwitch(master, AppConfig.STATUSBAR_CLOCK_ACROSS, "时钟跨双排", "将系统时钟在双排高度内纵向居中。", false);
        addSwitch(master, AppConfig.STATUSBAR_FREE_POSITION, "自由定位",
                "关闭时位置仍会生效，但图标不会超出状态栏边界；开启后允许进入包括中间区域在内的任意位置，风险只提示，不限制。", false);
        addSwitch(master, AppConfig.STATUSBAR_DEBUG_OVERLAY, "调试框线",
                "在状态栏上绘制外框、双排分隔线与组件包围盒，直观看到当前布局状态。", false);
        page.addView(master, ui.margins(0, 0, 0, 12));
        LinearLayout spacing = new LinearLayout(this);
        spacing.setOrientation(LinearLayout.VERTICAL);
        addNumber(spacing, AppConfig.STATUSBAR_HEIGHT_DP, "状态栏高度 dp（0 跟随系统）", false);
        addNumber(spacing, AppConfig.STATUSBAR_LEFT_MARGIN_DP, "左边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_RIGHT_MARGIN_DP, "右边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_TOP_MARGIN_DP, "上边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_BOTTOM_MARGIN_DP, "下边距 dp", false);
        addNumber(spacing, AppConfig.STATUSBAR_DUAL_ROW_GAP_DP, "双排间距 dp（0 自动）", false);
        page.addView(ui.collapsible("尺寸与边距", "默认均为 0，跟随系统原值；修改后按真实状态栏重新测量。", spacing, false),
                ui.margins(0, 0, 0, 12));

        LinearLayout components = new LinearLayout(this);
        components.setOrientation(LinearLayout.VERTICAL);
        addPosition(components, "clock", "时钟", 120, 500);
        addPosition(components, "notifications", "通知图标组", 300, 500);
        addPosition(components, "system_icons", "系统图标组", 760, 500);
        addPosition(components, "battery", "电池", 930, 500);
        addPosition(components, "fan", "散热风扇", 600, 500);
        addPosition(components, "metric.thermal", "温度", 420, 760);
        addPosition(components, "metric.power", "电流与功率", 820, 760);
        page.addView(ui.collapsible("组件位置",
                "调整系统图标组、通知图标组、电池、散热风扇和温度/电流等组件的位置；配置会实时生效到状态栏。", components, false),
                ui.margins(0, 0, 0, 12));

        LinearLayout icons = new LinearLayout(this);
        icons.setOrientation(LinearLayout.VERTICAL);
        statusIconControls = icons;
        for (String slot : DEVICE_STATUS_ICON_BASELINE) addStatusIconSlot(slot, false);
        addDiscoveredStatusIconSlots();
        page.addView(ui.collapsible("系统图标（本机动态清单）",
                "这里不是固定的 26 项：以本机注册基线起步，运行时发现的新图标会继续加入。每个图标可独立控制隐藏、位置和缩放。",
                icons, false), ui.margins(0, 0, 0, 12));
    }

    private void refreshStatusIconControls() {
        if (!MODULE_STATUS_LAYOUT.equals(section) || statusIconControls == null) return;
        addDiscoveredStatusIconSlots();
    }

    private void addDiscoveredStatusIconSlots() {
        String discovered = diagnostic("ls_augment_statusbar_discovered_icons");
        LinkedHashMap<String, String> visibility = new LinkedHashMap<>();
        for (String entry : discovered.split(",")) {
            String[] parts = entry.split(":", 2);
            String slot = parts[0].trim();
            String state = parts.length > 1 ? parts[1].trim() : "visible";
            visibility.put(slot, state);
        }
        for (String slot : visibility.keySet()) {
            addStatusIconSlot(slot, "gone".equals(visibility.get(slot)));
        }
    }

    private void addStatusIconSlot(String slot, boolean initiallyHidden) {
        if (statusIconControls == null || !slot.matches("[A-Za-z0-9_.:-]{1,80}")
                || renderedStatusIconSlots.containsKey(slot)) return;
        renderedStatusIconSlots.put(slot, Boolean.TRUE);
        boolean wasLoading = loading;
        loading = true;
        String id = "slot." + slot;

        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        LinearLayout heading = new LinearLayout(this);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        heading.addView(ui.text(iconLabel(slot), 13, ui.text, true),
                new LinearLayout.LayoutParams(0, -2, 1.0f));
        Switch hidden = new Switch(this);
        ui.styleSwitch(hidden);
        hidden.setChecked(initiallyHidden);
        heading.addView(hidden, new LinearLayout.LayoutParams(-2, -2));
        block.addView(heading, ui.wrap());

        PositionControl positionControl = new PositionControl(
                id, iconLabel(slot), 760, 500, hidden, positionBar(), positionBar(),
                positionInput(id + ".x"), positionInput(id + ".y"),
                ui.text("", 11.5f, ui.muted, false),
                ui.text("", 11.5f, ui.muted, false));
        positionControls.put(id, positionControl);

        LinearLayout xRow = new LinearLayout(this);
        xRow.setOrientation(LinearLayout.HORIZONTAL);
        xRow.setGravity(Gravity.CENTER_VERTICAL);
        xRow.addView(positionControl.xValue, new LinearLayout.LayoutParams(0, -2, 1.0f));
        xRow.addView(positionControl.xInput, new LinearLayout.LayoutParams(ui.dp(64), -2));
        block.addView(xRow, ui.wrap());
        block.addView(positionControl.x, ui.wrap());

        LinearLayout yRow = new LinearLayout(this);
        yRow.setOrientation(LinearLayout.HORIZONTAL);
        yRow.setGravity(Gravity.CENTER_VERTICAL);
        yRow.addView(positionControl.yValue, new LinearLayout.LayoutParams(0, -2, 1.0f));
        yRow.addView(positionControl.yInput, new LinearLayout.LayoutParams(ui.dp(64), -2));
        block.addView(yRow, ui.wrap());
        block.addView(positionControl.y, ui.wrap());

        Slider scaleSlider = new Slider("scale:" + id, id + " 图标缩放", 50, 200, 1, true,
                scaleBar(), ui.text("", 12, ui.muted, false));
        sliders.put("scale:" + id, scaleSlider);
        block.addView(scaleSlider.text, ui.margins(0, 8, 0, 0));
        block.addView(scaleSlider.bar, ui.wrap());

        IconControl iconControl = new IconControl(id, iconLabel(slot), hidden, positionControl, scaleSlider);
        iconControls.put(id, iconControl);
        if (!positionValues.isEmpty()) {
            iconControl.load(positionValues.get(id));
        }

        statusIconControls.addView(block, ui.margins(0, 8, 0, 8));
        statusIconControls.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));
        loading = wasLoading;
    }

    private void buildStatusClock() {
        LinearLayout clock = detailCard("双行自定义时钟",
                "两行分别使用标准日期格式；第二行留空就是单行。格式错误会保留上一次有效结果。"
                        + " 扩展：N 农历月、e 农历日、Y 干支年、A 生肖、G 公元、t 节气；"
                        + " 其余字母走系统 SimpleDateFormat；不支持的字母将原样显示。");
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_CUSTOM, "自定义时钟", "替换 SystemUI 时钟文本。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_24H, "24 小时制", "第一行留空时使用；关闭为 12 小时制。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_SECONDS, "显示秒", "第一行留空时使用；自定义格式含 s/S 时会自动按秒刷新。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_PERIOD, "显示时段", "显示上午、下午等本地时段。", false);
        addSwitch(clock, AppConfig.STATUSBAR_CLOCK_WEEK, "显示星期", "使用当前语言的星期格式。", false);
        addNumber(clock, AppConfig.STATUSBAR_CLOCK_PATTERN, "第一行格式（如 yy:MM-HH:mm）", true);
        addNumber(clock, AppConfig.STATUSBAR_CLOCK_PATTERN_SECOND,
                "第二行格式（如 E/N/e；固定文字用单引号，如 'II'）", true);
        page.addView(clock, ui.margins(0, 0, 0, 12));

        LinearLayout font = new LinearLayout(this);
        font.setOrientation(LinearLayout.VERTICAL);
        addNumber(font, AppConfig.STATUSBAR_CLOCK_FONT_FAMILY,
                "字体（sans-serif / serif / monospace 等）", true);
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_SIZE_SP, "字号 sp（0 跟随系统）");
        addNumber(font, AppConfig.STATUSBAR_CLOCK_WEIGHT, "字重（100–900）", false);
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_LETTER_SPACING,
                "字间距（-0.20 至 1.00）");
        addDecimal(font, AppConfig.STATUSBAR_CLOCK_LINE_SPACING_DP,
                "两行额外间距 dp（0–32）");
        addNumber(font, AppConfig.STATUSBAR_CLOCK_WIDTH_DP, "固定宽度 dp（0 自动）", false);
        addChoice(font, AppConfig.STATUSBAR_CLOCK_TEXT_ALIGN, "文字对齐",
                new String[][]{{"left", "靠左"}, {"center", "居中"}, {"right", "靠右"}});
        page.addView(ui.collapsible("字体与排版",
                "Y 是周年份，y 是日历年份，E 是星期；不支持的格式字母不会被静默替换。",
                font, false), ui.margins(0, 0, 0, 12));
    }

    private void buildStatusMetrics() {
        LinearLayout metrics = detailCard("实时数据",
                "每一类数据都是可单独定位的真实状态栏组件；读取失败不会破坏原生状态栏。");
        addSwitch(metrics, AppConfig.STATUSBAR_THERMAL, "温度", "显示可读取的 CPU/GPU/电池温度。", false);
        addSwitch(metrics, AppConfig.STATUSBAR_BATTERY_POWER, "电流与功率", "根据电池电流和电压计算。", false);
        addNumber(metrics, AppConfig.STATUSBAR_NOTIFICATION_MAX, "通知图标最大数量（0 原生）", false);
        addSwitch(metrics, AppConfig.STATUSBAR_NOTIFICATION_HIDE, "隐藏全部通知图标",
                "开启后状态栏通知图标组完全隐藏；优先于最大数量生效。", false);
        page.addView(metrics, ui.margins(0, 0, 0, 12));
    }

    private void buildDoubleApp() {
        LinearLayout doubleApp = ui.card();
        addSwitch(doubleApp, AppConfig.DOUBLE_ANY_APP, "扩展第三方 App 双开候选",
                "只扩展红魔官方列表；双开的创建、删除和数据仍由红魔官方管理。", false);
        addSwitch(doubleApp, AppConfig.DOUBLE_LOW_MEMORY, "移除低内存限制", "关闭红魔双开页面的低内存受限分支。", false);
        page.addView(doubleApp, ui.margins(0, 0, 0, 12));
    }

    private void buildBeautify() {
        LinearLayout beautify = ui.card();
        addSwitch(beautify, AppConfig.BEAUTIFY_UNLIMITED_TRIAL, "无限期试用",
                "只阻止原厂 TryUse 到期复位任务；不改价格、购买结果或服务器权益。", false);
        page.addView(beautify, ui.margins(0, 0, 0, 12));
    }

    private void buildSignatureInstall() {
        LinearLayout install = ui.card();
        addSwitch(install, AppConfig.ALLOW_SIGNATURE_MISMATCH,
                "允许安装签名不一致的应用",
                "仅处理同包名更新的签名冲突；不放行共享 UID，也不授予其他应用的签名级权限。",
                false);
        TextView warning = ui.text(
                "风险提示：开启后会削弱 Android 的签名保护。不同签名的 APK 覆盖原应用后，"
                        + "可以读取和使用原应用已有数据；请仅安装你确认来源与内容均可信的 APK。",
                10.5f, ui.warning, false);
        warning.setLineSpacing(ui.dp(1), 1.06f);
        install.addView(warning, ui.margins(0, 11, 0, 2));
        page.addView(install, ui.margins(0, 0, 0, 12));
    }

    private void buildAutomation() {
        LinearLayout automation = detailCard("锁屏自动隐藏",
                "由 LSPosed 在系统中监听熄屏，使用 Root 隐藏队列执行，无常驻通知。");
        addSwitch(automation, AppConfig.AUTOMATION_ENABLED, "启用锁屏自动隐藏", "屏幕由亮转灭时执行一次，解锁不自动显示。", true);
        addSwitch(automation, "__scope_all", "处理所有配置用户", "关闭时只处理当前 Android 用户。", false);
        page.addView(automation, ui.margins(0, 0, 0, 12));
    }

    private void buildTile() {
        LinearLayout tile = detailCard("快捷设置磁贴",
                "混合或异常状态点击时优先恢复全部显示。");
        addSwitch(tile, AppConfig.TILE_ENABLED, "启用磁贴动作",
                "关闭后磁贴保留在控制中心，但不可执行隐藏或显示。", true);
        addNumber(tile, AppConfig.TILE_LABEL, "磁贴名称", true);
        addNumber(tile, AppConfig.TILE_DESCRIPTION, "磁贴说明", true);
        Button add = ui.button("请求添加快捷设置磁贴");
        add.setOnClickListener(view -> startActivity(new Intent(this, TileSetupActivity.class)));
        tile.addView(add, ui.margins(0, 8, 0, 0));
        page.addView(tile, ui.margins(0, 0, 0, 12));
    }

    private void buildLauncherIcon() {
        status.setText("桌面图标设置会立即生效，不需要重启作用域。");
        LinearLayout launcher = detailCard("桌面图标",
                "隐藏后仍可从 LSPosed 管理器的模块设置重新进入。");
        TextView launcherState = ui.statusChip("正在读取…", ui.accent);
        Button launcherAction = ui.tonalButton("");

        launcher.addView(launcherAction, ui.margins(0, 8, 0, 0));
        page.addView(launcher, ui.margins(0, 0, 0, 12));
        Runnable render = () -> {
            boolean visible = launcherIconVisible();
            launcherState.setText(visible ? "当前：桌面显示" : "当前：桌面隐藏");
            launcherAction.setText(visible ? "隐藏桌面图标" : "恢复桌面图标");
        };
        launcherAction.setOnClickListener(view -> {
            if (!launcherIconVisible()) {
                setLauncherIconVisible(true); render.run(); toast("桌面图标已恢复"); return;
            }
            new AlertDialog.Builder(this).setTitle("隐藏桌面图标")
                    .setMessage("隐藏后请从 LSPosed 管理器的模块设置进入。")
                    .setNegativeButton("取消", null)
                    .setPositiveButton("隐藏", (dialog, which) -> {
                        setLauncherIconVisible(false); render.run(); toast("桌面图标已隐藏");
                    }).show();
        });
        render.run();
    }

    private void buildDetailedDiagnostics() {
        LinearLayout diagnostics = detailCard("详细诊断",
                "仅排查问题时开启，排查结束后建议关闭，减少日志与额外开销。不会开启对应增强功能。");
        addSwitch(diagnostics, AppConfig.SHOULDER_DIAGNOSTICS, "肩键详细诊断",
                "记录肩键适配与调用信息；关闭时保留低频基础诊断。", false);
        addSwitch(diagnostics, AppConfig.AI_TRIGGER_DIAGNOSTICS, "AI 触发器详细诊断",
                "记录识别与点击信息；关闭时保留限频的普通日志。", false);
        page.addView(diagnostics, ui.margins(0, 0, 0, 12));
    }

    private void buildDiagnostics() {
        buildDetailedDiagnostics();
        LinearLayout card=detailCard("日志","开启所需详细诊断 → 重启相关作用域 → 复现问题 → 导出日志。开启前的调用无法补录。");
        Button export=ui.tonalButton("导出日志");card.addView(export,ui.margins(0,10,0,0));
        card.addView(ui.text("日常日志仅保留重要操作结果与异常，按大小滚动保存。导出会重新采集设备、模块、Hook 状态，并包含已开启功能的详细调用记录。",11.5f,ui.muted,false),ui.margins(0,10,0,0));
        export.setOnClickListener(v->{
            if(dirty||saveInFlight){save(true);toast("正在保存诊断设置，请稍后导出");return;}
            export.setEnabled(false);export.setText("正在收集日志…");
            executor.execute(()->{String value=DiagnosticExport.build(this);
                try(java.io.FileOutputStream cached=new java.io.FileOutputStream(new java.io.File(getCacheDir(),"pending-diagnostic-export.txt"))){cached.write(value.getBytes(StandardCharsets.UTF_8));}
                catch(java.io.IOException error){main.post(()->{export.setEnabled(true);export.setText("导出日志");toast("无法准备日志文件，请重试");});return;}
                main.post(()->{
                if(isDestroyed())return;pendingExport=value;export.setEnabled(true);export.setText("导出日志");
                startActivityForResult(new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("text/plain").putExtra(Intent.EXTRA_TITLE,"LS_Augment-logs-"+System.currentTimeMillis()+".txt"),EXPORT_REQUEST);
            });});
        });page.addView(card,ui.margins(0,0,0,12));
    }

    private void addSwitch(LinearLayout card, String key, String label, String description, boolean master) {
        Switch control = new Switch(this);
        LinearLayout row = ui.featureRow(label, description, control);
        control.setOnCheckedChangeListener((button, checked) -> markDirty());
        card.addView(row, ui.margins(0, 2, 0, 2)); switches.put(key, control);
    }
    private LinearLayout settingsBody(LinearLayout card, String key) {
        LinearLayout body = new LinearLayout(this); body.setOrientation(LinearLayout.VERTICAL);
        card.addView(body, ui.margins(0, 10, 0, 0));
        folds.add(ui.fold(switches.get(key), body)); return body;
    }
    private LinearLayout featureCard(String key, String title, String description) {
        LinearLayout card=ui.card();addSwitch(card,key,title,description,false);
        page.addView(card,ui.margins(0,0,0,12));return card;
    }
    private void buildStoreDownload() {
        LinearLayout card=featureCard(ConfigSchema.STORE_DOWNLOAD_ENABLED,"解除同时下载数量限制","设置应用商店允许同时下载的应用数量。保存后重启应用商店，使新队列配置生效。");
        addSlider(settingsBody(card,ConfigSchema.STORE_DOWNLOAD_ENABLED),ConfigSchema.STORE_DOWNLOAD_COUNT,"允许同时下载数量",1,50,false);
    }

    private void addNumber(LinearLayout card, String key, String label, boolean text) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.addView(ui.text(label, 12.5f, ui.text, true), ui.wrap());
        EditText input = new EditText(this);
        ui.styleInput(input);
        input.setSingleLine(true);
        input.setInputType(text ? InputType.TYPE_CLASS_TEXT : InputType.TYPE_CLASS_NUMBER);
        input.addTextChangedListener(new SimpleWatcher());
        row.addView(input, ui.margins(0, 7, 0, 0));
        card.addView(row, ui.margins(0, 7, 0, 5));
        inputs.put(key, input);
    }

    private void addDecimal(LinearLayout card, String key, String label) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.addView(ui.text(label, 12.5f, ui.text, true), ui.wrap());
        EditText input = new EditText(this);
        ui.styleInput(input);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL
                | InputType.TYPE_NUMBER_FLAG_SIGNED);
        input.addTextChangedListener(new SimpleWatcher());
        row.addView(input, ui.margins(0, 7, 0, 0));
        card.addView(row, ui.margins(0, 7, 0, 5));
        inputs.put(key, input);
    }

    private void addChoice(LinearLayout card, String key, String label, String[][] options) {
        TextView title = ui.text(label, 12.5f, ui.text, true);
        card.addView(title, ui.margins(0, 9, 0, 5));
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        Choice choice = new Choice(key);
        for (String[] option : options) {
            Button button = ui.tonalButton(option[1]);
            choice.values.put(option[0], button);
            button.setOnClickListener(view -> {
                choice.select(option[0]);
                markDirty();
            });
            row.addView(button, new LinearLayout.LayoutParams(0, ui.dp(42), 1.0f));
        }
        choice.select("center");
        choices.put(key, choice);
        card.addView(row, ui.margins(0, 0, 0, 5));
    }

    private void addPosition(LinearLayout card, String id, String label, int defaultX, int defaultY) {
        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        LinearLayout heading = new LinearLayout(this);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        heading.addView(ui.text(label, 13, ui.text, true),
                new LinearLayout.LayoutParams(0, -2, 1.0f));
        Switch enabled = new Switch(this);
        ui.styleSwitch(enabled);
        heading.addView(enabled, new LinearLayout.LayoutParams(-2, -2));
        block.addView(heading, ui.wrap());

        LinearLayout xRow = new LinearLayout(this);
        xRow.setOrientation(LinearLayout.HORIZONTAL);
        xRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView xValue = ui.text("", 11.5f, ui.muted, false);
        xRow.addView(xValue, new LinearLayout.LayoutParams(0, -2, 1.0f));
        EditText xInput = positionInput(id + ".x");
        xRow.addView(xInput, new LinearLayout.LayoutParams(ui.dp(64), -2));
        SeekBar x = positionBar();
        block.addView(xRow, ui.wrap());
        block.addView(x, ui.wrap());

        LinearLayout yRow = new LinearLayout(this);
        yRow.setOrientation(LinearLayout.HORIZONTAL);
        yRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView yValue = ui.text("", 11.5f, ui.muted, false);
        yRow.addView(yValue, new LinearLayout.LayoutParams(0, -2, 1.0f));
        EditText yInput = positionInput(id + ".y");
        yRow.addView(yInput, new LinearLayout.LayoutParams(ui.dp(64), -2));
        SeekBar y = positionBar();
        block.addView(yRow, ui.wrap());
        block.addView(y, ui.wrap());

        PositionControl control = new PositionControl(
                id, label, defaultX, defaultY, enabled, x, y, xInput, yInput, xValue, yValue);
        enabled.setOnCheckedChangeListener((button, checked) -> {
            control.render();
            markDirty();
        });
        SeekBar.OnSeekBarChangeListener barListener = new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                control.syncInputFromBar();
                control.render();
                if (fromUser) markDirty();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) { }
        };
        x.setOnSeekBarChangeListener(barListener);
        y.setOnSeekBarChangeListener(barListener);
        TextWatcher inputWatcher = new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                control.syncBarFromInput();
                control.render();
                markDirty();
            }
            @Override public void afterTextChanged(Editable s) { }
        };
        xInput.addTextChangedListener(inputWatcher);
        yInput.addTextChangedListener(inputWatcher);
        x.setProgress(defaultX);
        y.setProgress(defaultY);
        control.render();
        positionControls.put(id, control);
        card.addView(block, ui.margins(0, 8, 0, 8));
        card.addView(ui.divider(), new LinearLayout.LayoutParams(-1, ui.dp(1)));
    }

    private EditText positionInput(String key) {
        EditText input = new EditText(this);
        ui.styleInput(input);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setEms(5);
        input.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        return input;
    }

    private SeekBar positionBar() {
        SeekBar bar = new SeekBar(this);
        bar.setMax(1000);
        bar.setProgressTintList(ColorStateList.valueOf(ui.accent));
        bar.setThumbTintList(ColorStateList.valueOf(ui.accent));
        return bar;
    }

    private SeekBar scaleBar() {
        SeekBar bar = new SeekBar(this);
        bar.setMax(150);
        bar.setProgress(50);
        bar.setProgressTintList(ColorStateList.valueOf(ui.accent));
        bar.setThumbTintList(ColorStateList.valueOf(ui.accent));
        return bar;
    }

    private static String iconLabel(String slot) {
        switch (slot) {
            case "vpn": return "VPN（vpn）";
            case "ethernet": return "有线网络（ethernet）";
            case "screen_record": return "录屏（screen_record）";
            case "camera": return "摄像头使用提示（camera）";
            case "microphone": return "麦克风使用提示（microphone）";
            case "hotspot": return "热点（hotspot）";
            case "nfc": return "NFC（nfc）";
            case "location": return "定位（location）";
            case "bluetooth": return "蓝牙（bluetooth）";
            case "alarm_clock": return "闹钟（alarm_clock）";
            case "airplane": return "飞行模式（airplane）";
            case "wifi": return "Wi‑Fi（wifi）";
            case "mobile": return "移动网络（mobile）";
            case "ims_icon": return "IMS / HD（ims_icon）";
            case "NET_SPEED": return "系统网速（NET_SPEED）";
            default: return slot;
        }
    }

    private void addSlider(LinearLayout card, String key, String label, int min, int max, boolean percent) {
        addSlider(card, key, label, min, max, 1, percent);
    }

    private void addSlider(LinearLayout card, String key, String label,
            int min, int max, int step, boolean percent) {
        TextView value = ui.text("", 12, ui.muted, false);
        card.addView(value, ui.margins(0, 10, 0, 0));
        SeekBar bar = new SeekBar(this);
        int safeStep = Math.max(1, step);
        bar.setMax((max - min) / safeStep);
        bar.setProgressTintList(ColorStateList.valueOf(ui.accent));
        bar.setThumbTintList(ColorStateList.valueOf(ui.accent));
        Slider slider = new Slider(key, label, min, max, safeStep, percent, bar, value);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                slider.render(); if (fromUser) markDirty();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) { }
        });
        card.addView(bar, ui.wrap());
        sliders.put(key, slider);
    }

    private void loadValues() {
        loading = true;
        for (Map.Entry<String, Switch> entry : switches.entrySet()) {
            if ("__scope_all".equals(entry.getKey())) {
                entry.getValue().setChecked("all".equals(config.get(AppConfig.AUTOMATION_SCOPE)));
            } else entry.getValue().setChecked(config.getBoolean(entry.getKey()));
        }
        for (Map.Entry<String, EditText> entry : inputs.entrySet()) entry.getValue().setText(config.get(entry.getKey()));
        for (Slider slider : sliders.values()) {
            float raw = config.getFloat(slider.key, slider.percent ? slider.min / 100f : slider.min);
            int value = slider.percent ? Math.round(raw * 100f) : Math.round(raw);
            slider.bar.setProgress(Math.max(0, Math.min(
                    (slider.max - slider.min) / slider.step,
                    Math.round((value - slider.min) / (float) slider.step))));
            slider.render();
        }
        for (Choice choice : choices.values()) choice.select(config.get(choice.key));
        positionValues.clear();
        StatusBarLayoutSpec.ParseResult positions =
                StatusBarLayoutSpec.parse(config.get(AppConfig.STATUSBAR_LAYOUT_SPEC));
        if (positions.valid) positionValues.putAll(positions.spec.positions());
        for (PositionControl control : positionControls.values()) {
            StatusBarLayoutSpec.Position position = positionValues.get(control.id);
            control.load(position);
        }
        for (IconControl control : iconControls.values()) {
            control.load(positionValues.get(control.id));
        }
        for (UiKit.Fold fold : folds) fold.sync();
        loading = false;
        dirty = false;
        changeGeneration = 0L;
        if (save != null) ui.setButtonEnabled(save, false);
        renderRuntimeStatus();
        if (MODULE_SHOULDER.equals(section)) refreshRapidCompatibilityAsync();
        if (isStatusModule() || MODULE_AUDIO_GAIN.equals(section) || MODULE_FAN_CONTROL.equals(section)
                || MODULE_SHOULDER.equals(section)) {
            main.removeCallbacks(statusPoll);
            main.post(statusPoll);
        }
    }

    private void save() { save(false); }

    private void save(boolean automatic) {
        if (!dirty || saveInFlight) return;
        main.removeCallbacks(statusAutoSave);
        LinkedHashMap<String, String> updates = new LinkedHashMap<>();
        for (Map.Entry<String, Switch> entry : switches.entrySet()) {
            if ("__scope_all".equals(entry.getKey())) {
                updates.put(AppConfig.AUTOMATION_SCOPE, entry.getValue().isChecked() ? "all" : "current");
            } else updates.put(entry.getKey(), entry.getValue().isChecked() ? "1" : "0");
        }
        for (Map.Entry<String, EditText> entry : inputs.entrySet()) updates.put(entry.getKey(), entry.getValue().getText().toString());
        for (Slider slider : sliders.values()) {
            if (AppConfig.FAN_TARGET_RPM.equals(slider.key) && !slider.bar.isEnabled()) continue;
            updates.put(slider.key, slider.serialized());
        }
        for (Choice choice : choices.values()) updates.put(choice.key, choice.selected);
        if (!iconControls.isEmpty()) {
            for (IconControl control : iconControls.values()) {
                control.save(positionValues);
            }
            updates.put(AppConfig.STATUSBAR_LAYOUT_SPEC,
                    StatusBarLayoutSpec.serialize(positionValues));
        }
        if (enabledIn(updates, AppConfig.SHOULDER_ENABLED, AppConfig.TGK_RAPID_FIRE_ENABLED,
                AppConfig.AI_TRIGGER_ENABLED, AppConfig.COMBO_SPEED_ENABLED,
                AppConfig.SUPER_MIRROR_LOW_MODE, AppConfig.SUPER_MIRROR_DIABLO_COEXIST,
                AppConfig.FAN_FIXED_ENABLED, AppConfig.FAN_UNLOCK_MAX)) {
            updates.put(AppConfig.GAME_MASTER, "1");
        }
        if (enabledIn(updates, AppConfig.STATUSBAR_DUAL_LEFT, AppConfig.STATUSBAR_DUAL_RIGHT,
                AppConfig.STATUSBAR_FREE_POSITION, AppConfig.STATUSBAR_CLOCK_CUSTOM,
                AppConfig.STATUSBAR_THERMAL, AppConfig.STATUSBAR_BATTERY_POWER)) {
            updates.put(AppConfig.SYSTEMUI_MASTER, "1");
        }
        if (MODULE_FREEFORM.equals(section)) updates.put(AppConfig.FREEFORM_ENABLED, enabledIn(updates,AppConfig.FREEFORM_ALL_APPS,AppConfig.FREEFORM_UNLIMITED)?"1":"0");
        if (enabledIn(updates, AppConfig.DOUBLE_ANY_APP, AppConfig.DOUBLE_LOW_MEMORY,
                AppConfig.BEAUTIFY_UNLIMITED_TRIAL)) {
            updates.put(AppConfig.APP_MASTER, "1");
        }
        long savingGeneration = changeGeneration;
        saveInFlight = true;
        ui.setButtonEnabled(save, false);
        executor.execute(() -> {
            AppConfig.SaveResult result = saveConfiguration(updates);
            if (MODULE_AUTOMATION.equals(section) && result.success) {
                ScreenAutomation.sync(this);
            }
            main.post(() -> {
                saveInFlight = false;
                if (!automatic || !result.success) {
                    toast(result.message + "；" + restartHint());
                }
                if (result.success) {
                    dirty = savingGeneration != changeGeneration;
                    renderRuntimeStatus();
                } else {
                    dirty = true;
                }
                ui.setButtonEnabled(save, dirty);
                if (dirty && result.success) {
                    main.removeCallbacks(statusAutoSave);
                    main.postDelayed(statusAutoSave, 280L);
                }
            });
        });
    }

    private void renderRuntimeStatus() {
        String prefix;
        if (MODULE_AUDIO_GAIN.equals(section)) {
            prefix = statusLine("音频增益", diagnostic("ls_augment_audio_gain_runtime"));
        } else if (MODULE_BATTERY.equals(section)) {
            prefix = statusLine("循环降压策略", diagnostic("ls_augment_battery_policy_runtime")
                    .replace("restored_vendor_policy", "已恢复原厂策略")
                    .replace("age_voltage_reduction_disabled_and_service_reloaded", "已关闭并重新加载配置"));
        } else if (MODULE_SIGNATURE_INSTALL.equals(section)) {
            prefix = statusLine("系统安装 Hook",
                    diagnostic("ls_augment_signature_install_installed"))
                    + statusLine("最近放行",
                    diagnostic("ls_augment_signature_install_last_hit"))
                    + statusLine("最近错误",
                    diagnostic("ls_augment_signature_install_last_error"));
        } else if (isGameModule()) {
            if (MODULE_SHOULDER.equals(section)) {
                prefix = statusLine("肩键安装", diagnostic("ls_augment_shoulder_installed"))
                        + statusLine("最近命中", diagnostic("ls_augment_shoulder_last_hit"))
                        + statusLine("连点调速", diagnostic("ls_augment_tgk_rapid_fire_installed"))
                        + statusLine("连点最近命中", diagnostic("ls_augment_tgk_rapid_fire_last_hit"))
                        + statusLine("原生节拍", diagnostic("ls_augment_tgk_rapid_fire_native_state"))
                        + statusLine("系统库哈希", diagnostic("ls_augment_tgk_rapid_fire_native_sha256"))
                        + statusLine("原生最近命中", diagnostic("ls_augment_tgk_rapid_fire_native_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_tgk_rapid_fire_native_last_error"));
            } else if (MODULE_AI_TRIGGER.equals(section)) {
                prefix = statusLine("AI Hook", diagnostic("ls_augment_ai_trigger_installed"))
                        + statusLine("最近命中", diagnostic("ls_augment_ai_trigger_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_ai_trigger_last_error"));
            } else if (MODULE_COMBO_SPEED.equals(section)) {
                prefix = statusLine("速度 Hook", diagnostic("ls_augment_combo_speed_installed"))
                        + statusLine("文件缓存", diagnostic("ls_augment_combo_speed_cache_last_hit"))
                        + statusLine("最近调整", diagnostic("ls_augment_combo_speed_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_combo_speed_last_error"));
            } else if (MODULE_FAN_CONTROL.equals(section)) {
                refreshFanMeasurement();
                prefix = statusLine("风扇 Hook", diagnostic("ls_augment_fan_control_installed"))
                        + statusLine("当前控制", diagnostic("ls_augment_fan_control_active"))
                        + statusLine("最近错误", diagnostic("ls_augment_fan_control_last_error"));
            } else {
                prefix = statusLine("超镜安装", diagnostic("ls_augment_super_mirror_installed"))
                        + statusLine("最近命中", diagnostic("ls_augment_super_mirror_last_hit"))
                        + statusLine("最近错误", diagnostic("ls_augment_super_mirror_last_error"));
            }
        } else if (MODULE_FREEFORM.equals(section)) {
            prefix = statusLine("小窗 Hook", diagnostic("ls_augment_freeform_installed"))
                    + statusLine("最近命中", diagnostic("ls_augment_freeform_last_hit"))
                    + statusLine("最近错误", diagnostic("ls_augment_freeform_last_error"));
        } else if (isStatusModule()) {
            prefix = statusLine("实时链路", statusBarRealtimeState(
                    diagnostic("ls_augment_systemui_last_hit")))
                    + statusBarLayoutSummary(
                    diagnostic("ls_augment_statusbar_layout_state"))
                    + statusLine("本机当前发现图标",
                    iconCount(diagnostic("ls_augment_statusbar_discovered_icons")) + " 个（动态变化）")
                    + statusLine("时钟格式错误",
                    emptyAs(diagnostic("ls_augment_statusbar_clock_error"), "无"))
                    + statusLine("运行错误",
                    emptyAs(diagnostic("ls_augment_systemui_last_error"), "无"));
        } else if (MODULE_DOUBLE_APP.equals(section)) {
            prefix = statusLine("Hook 安装", diagnostic("ls_augment_doubleapp_installed"))
                    + statusLine("最近命中", diagnostic("ls_augment_doubleapp_last_hit"))
                    + statusLine("最近错误", diagnostic("ls_augment_doubleapp_last_error"));
        } else if (MODULE_BEAUTIFY.equals(section)) {
            prefix = statusLine("兼容", diagnostic("ls_augment_beautify_compat"))
                    + statusLine("最近命中", diagnostic("ls_augment_beautify_last_hit"))
                    + statusLine("最近错误", diagnostic("ls_augment_beautify_last_error"));
        } else if (MODULE_AUTOMATION.equals(section)) {
            prefix = getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(AppConfig.AUTOMATION_LAST_EVENT, "尚未触发")
                    + errorLine(getSharedPreferences(AppConfig.DIAGNOSTICS, 0)
                    .getString(AppConfig.AUTOMATION_LAST_ERROR, ""));
        } else if (MODULE_TILE.equals(section)) {
            prefix = "磁贴状态：" + config.get(AppConfig.TILE_STATE);
        } else if (MODULE_LAUNCHER_ICON.equals(section)) {
            prefix = launcherIconVisible() ? "当前桌面图标可见" : "当前桌面图标已隐藏";
        } else if (MODULE_DETAILED_DIAGNOSTICS.equals(section)) {
            prefix = "仅控制详细日志，不改变功能开关或兼容性测试结果";
        } else {
            prefix = "诊断与恢复工具已就绪";
        }
        status.setContentDescription(runtimeDetailsExpanded ? "收起运行详情" : "展开运行详情");
        String summary = runtimeDetailsExpanded
                ? (prefix == null || prefix.trim().isEmpty() ? "尚无运行记录" : prefix.trim())
                        + "\n生效提示：" + restartHint() + "\n收起运行详情 ▴"
                : "生效提示：" + restartHint() + "\n查看运行详情 ▾";
        if(!android.text.TextUtils.equals(status.getText(),summary))status.setText(summary);
    }

    private static String statusLine(String label, String value) {
        String clean = value == null || value.trim().isEmpty() ? "尚无记录" : value.trim();
        return label + "：" + clean + "\n";
    }

    private static String statusBarLayoutSummary(String raw) {
        if (raw == null || raw.trim().isEmpty()) return "实测范围：等待状态栏反馈\n";
        LinkedHashMap<String, String> values = new LinkedHashMap<>();
        for (String part : raw.split(";")) {
            int split = part.indexOf('=');
            if (split > 0) values.put(part.substring(0, split), part.substring(split + 1));
        }
        if (raw.startsWith("inactive")) {
            return "实时状态：增强已关闭，原生布局已恢复\n";
        }
        String size = values.getOrDefault("size", "等待测量");
        String overflow = humanIssue(values.get("overflow"));
        String collision = humanIssue(values.get("collision"));
        String risk = humanIssue(values.get("risk"));
        String error = values.get("config_error");
        return "实测可用范围：" + size + " px\n"
                + "越界：" + overflow + "\n"
                + "相互遮挡：" + collision + "\n"
                + "动态区域风险：" + risk + "\n"
                + (error == null || error.isEmpty() ? "" : "配置错误：" + error + "\n");
    }

    private static String humanIssue(String value) {
        if (value == null || value.isEmpty() || "none".equals(value)) return "无";
        String localized = value
                .replace("metric.thermal", "温度")
                .replace("metric.power", "电流与功率")
                .replace("system_icons", "系统图标组")
                .replace("notifications", "通知图标组")
                .replace("clock", "时钟")
                .replace("battery", "电池")
                .replace("fan", "散热风扇")
                .replace("@cutout_space_view", "进入中间动态占位区")
                .replace("+", " 与 ")
                .replace(",", "、");
        return localized.replace("slot.", "图标 ");
    }

    private static String statusBarRealtimeState(String value) {
        if (value == null || value.trim().isEmpty()) return "等待 SystemUI 首次反馈";
        return value.startsWith("realtime_apply")
                ? "已连接，修改会直接反馈到当前状态栏" : value.trim();
    }

    private static String emptyAs(String value, String fallback) {
        return value == null || value.trim().isEmpty() ? fallback : value.trim();
    }

    private static int iconCount(String value) {
        if (value == null || value.trim().isEmpty()) return 0;
        int count = 0;
        for (String slot : value.split(",")) if (!slot.trim().isEmpty()) count++;
        return count;
    }

    private String diagnostic(String key) {
        String value = getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getString(key, "");
        if (value != null && !value.isEmpty()) return value;
        // system_server can publish before this credential-encrypted Provider
        // is available. Its privileged Settings.Global fallback is diagnostic
        // only and must never enable a feature by itself.
        try {
            value = Settings.Global.getString(getContentResolver(), key);
            return value == null ? "" : value;
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String errorLine(String value) {
        return value == null || value.trim().isEmpty() ? "" : "\n错误：" + value.trim();
    }

    private static boolean enabledIn(Map<String, String> updates, String... keys) {
        for (String key : keys) if ("1".equals(updates.get(key))) return true;
        return false;
    }

    private String diagnosticSummary() {
        RootHideManager manager = new RootHideManager(this);
        RootHideManager.RootStatus root = manager.rootStatus();
        RootHideManager.ConflictState conflict = root.state == RootHideManager.RootState.GRANTED
                ? manager.conflictState() : new RootHideManager.ConflictState(false, false, "未检测");
        StringBuilder out = new StringBuilder();
        out.append("LS_Augment ").append(BuildConfig.VERSION_NAME).append('\n')
                .append("package=ls.augment.com\n")
                .append("time=").append(DateFormat.getDateTimeInstance().format(new Date())).append('\n')
                .append("device=").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n')
                .append("android=").append(Build.VERSION.RELEASE).append(" sdk=").append(Build.VERSION.SDK_INT).append('\n')
                .append("display=").append(Build.DISPLAY).append('\n')
                .append("root=").append(root.state).append(' ').append(root.provider).append(' ').append(root.message).append('\n')
                .append("legacy_conflict=").append(conflict.hasConflict()).append(' ').append(conflict.message).append('\n')
                .append("targets=").append(manager.targets().size()).append('\n');
        for (String packageName : new String[]{"com.android.settings", "com.android.systemui",
                "com.zte.beautify", "com.zte.beautifyadapter",
                "com.zte.cn.doubleapp",
                "cn.nubia.gameassist"}) {
            out.append(packageName).append('=').append(packageVersion(packageName)).append('\n');
        }
        RootShell.Result globals = RootShell.run(
                "settings list global 2>/dev/null | grep '^ls_augment_'",
                null, 8, 128 * 1024);
        out.append("\nGLOBAL RUNTIME MIRRORS\n")
                .append(globals.isSuccess() ? globals.output : "unavailable:" + globals.publicError())
                .append('\n');
        out.append("\nHOOK DIAGNOSTICS\n");
        Map<String, ?> diagnostics = getSharedPreferences(AppConfig.DIAGNOSTICS, 0).getAll();
        ArrayList<String> keys = new ArrayList<>(diagnostics.keySet());
        Collections.sort(keys);
        for (String key : keys) out.append(key).append('=').append(diagnostics.get(key)).append('\n');
        return out.toString();
    }

    private String packageVersion(String packageName) {
        try {
            PackageInfo info = getPackageManager().getPackageInfo(packageName, 0);
            return info.versionName + " (" + info.getLongVersionCode() + ")";
        } catch (Throwable ignored) { return "not_installed_or_hidden"; }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != EXPORT_REQUEST || resultCode != RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null) return;
        try (OutputStream output = getContentResolver().openOutputStream(uri, "wt")) {
            if (output == null) throw new IllegalStateException("no_output");
            try(java.io.FileInputStream cached=new java.io.FileInputStream(new java.io.File(getCacheDir(),"pending-diagnostic-export.txt"))){
                byte[] buffer=new byte[8192];int count;while((count=cached.read(buffer))!=-1)output.write(buffer,0,count);
            }
            toast("诊断文件已导出");
        } catch (Throwable error) { toast("导出失败：" + error.getClass().getSimpleName()); }
    }

    private void markDirty() {
        for (UiKit.Fold fold : folds) fold.sync();
        if (loading) return;
        dirty = true;
        changeGeneration++;
        if (save != null) ui.setButtonEnabled(save, true);
        {
            main.removeCallbacks(statusAutoSave);
            main.postDelayed(statusAutoSave, 320L);
        }
    }

    private String title() {
        switch (section) {
            case MODULE_SHOULDER: return "全应用肩键";
            case MODULE_AI_TRIGGER: return "AI 触发器";
            case MODULE_COMBO_SPEED: return "一键连招速度";
            case MODULE_FAN_CONTROL: return "风扇控制";
            case MODULE_FREEFORM: return "小窗增强";
            case MODULE_AUDIO_GAIN: return "音量增强";
            case MODULE_BATTERY: return "电池与循环次数";
            case MODULE_SUPER_RESOLUTION: return "超分破坏神";
            case MODULE_DIABLO_COEXIST: return "超分与破坏神";
            case MODULE_STATUS_LAYOUT: return "状态栏布局";
            case MODULE_STATUS_CLOCK: return "时钟格式";
            case MODULE_STATUS_METRICS: return "实时数据";
            case MODULE_DOUBLE_APP: return "扩展应用双开";
            case MODULE_BEAUTIFY: return "主题无限期试用";
            case MODULE_SIGNATURE_INSTALL: return "签名不一致安装";
            case MODULE_AUTOMATION: return "锁屏自动隐藏";
            case MODULE_TILE: return "快捷设置磁贴";
            case MODULE_LAUNCHER_ICON: return "桌面图标";
            case MODULE_DETAILED_DIAGNOSTICS: return "运行诊断";
            case "store_download": return "应用商店同时下载";
            default: return "运行诊断";
        }
    }

    private String subtitle() {
        switch (section) {
            case MODULE_SHOULDER: return "第三方 App 自动适配，红魔 TGK 继续负责实体按键。";
            case MODULE_AI_TRIGGER: return "降低模板、点击队列与 YOLO 的等待间隔。";
            case MODULE_COMBO_SPEED: return "为游戏助手的一键连招设置播放倍率，不改原始录制。";
            case MODULE_FAN_CONTROL: return "固定目标转速，并按需解禁驱动 5 档满速。";
            case MODULE_FREEFORM: return "解除小窗创建与最小化限制，并放行普通应用进入自由窗口。";
            case MODULE_AUDIO_GAIN: return "分别设置扬声器、耳机、蓝牙的媒体、铃声和闹钟音量上限。";
            case MODULE_BATTERY: return "读取真实循环记录和容量，关闭已确认的软件循环降压策略。";
            case MODULE_SUPER_RESOLUTION: return "扩展红魔原生超分辨率的性能模式资格。";
            case MODULE_DIABLO_COEXIST: return "控制超分辨率与破坏神模式的互斥行为。";
            case MODULE_STATUS_LAYOUT: return "在真实状态栏中实时调整双排、尺寸、组件和单个图标位置。";
            case MODULE_STATUS_CLOCK: return "双行格式、字体与排版会直接反馈到当前状态栏。";
            case MODULE_STATUS_METRICS: return "控制状态栏中的可独立定位实时数据。";
            case MODULE_DOUBLE_APP: return "只扩展候选列表，分身仍由红魔官方框架管理。";
            case MODULE_BEAUTIFY: return "仅处理原厂明确试用资源的本地到期流程。";
            case MODULE_SIGNATURE_INSTALL:
                return "只处理同包名覆盖安装的签名冲突，其他安装安全检查保持原样。";
            case MODULE_AUTOMATION: return "按需运行，无 KSU 模块依赖。";
            case MODULE_TILE: return "设置磁贴动作、名称和说明。";
            case MODULE_LAUNCHER_ICON: return "控制 LS_Augment 自身桌面入口。";
            case MODULE_DETAILED_DIAGNOSTICS: return "集中管理各子功能的详细诊断，修改后点击保存。";
            default: return "查看兼容状态、最近命中、错误与恢复入口。";
        }
    }

    private String restartHint() {
        switch (section) {
            case MODULE_DETAILED_DIAGNOSTICS: return "保存后重启游戏作用域，使全部诊断设置生效";
            case MODULE_SHOULDER:
            case MODULE_AI_TRIGGER:
            case MODULE_COMBO_SPEED:
            case MODULE_FAN_CONTROL:
            case MODULE_SUPER_RESOLUTION:
            case MODULE_DIABLO_COEXIST: return MODULE_COMBO_SPEED.equals(section)
                    ? "倍率保存后下一次连招生效；首次安装或更新需重启游戏作用域"
                    : MODULE_FAN_CONTROL.equals(section)
                    ? "保存后约 1 秒读取；首次安装或更新需重启风扇作用域"
                    : "重启游戏作用域后生效";
            case MODULE_STATUS_LAYOUT:
            case MODULE_STATUS_CLOCK:
            case MODULE_STATUS_METRICS:
                return "修改会自动保存并直接反馈；仅首次安装或更新模块代码后需重启一次 SystemUI";
            case MODULE_FREEFORM:
            case MODULE_AUDIO_GAIN:
                return "配置保存后约 1 秒读取；首次安装或更新模块代码需重启手机";
            case MODULE_DOUBLE_APP:
            case MODULE_BEAUTIFY: return "重启应用增强作用域后生效";
            case MODULE_SIGNATURE_INSTALL: return "首次安装或更新模块代码后需重启手机";
            default: return "立即生效";
        }
    }

    private String restartScope() {
        switch (section) {
            case MODULE_DETAILED_DIAGNOSTICS: return ScopeRestartDialog.GAMES;
            case MODULE_DIAGNOSTICS: return ScopeRestartDialog.GAMES;
            case "store_download": return ScopeRestartDialog.APPS;
            case MODULE_SHOULDER:
            case MODULE_AI_TRIGGER:
            case MODULE_COMBO_SPEED:
            case MODULE_FAN_CONTROL:
            case MODULE_SUPER_RESOLUTION:
            case MODULE_DIABLO_COEXIST: return ScopeRestartDialog.GAMES;
            case MODULE_STATUS_LAYOUT:
            case MODULE_STATUS_CLOCK:
            case MODULE_STATUS_METRICS: return ScopeRestartDialog.SYSTEM_UI;
            case MODULE_FREEFORM: return ScopeRestartDialog.DEVICE;
            case MODULE_AUDIO_GAIN: return ScopeRestartDialog.DEVICE;
            case MODULE_DOUBLE_APP:
            case MODULE_BEAUTIFY: return ScopeRestartDialog.APPS;
            case MODULE_SIGNATURE_INSTALL: return ScopeRestartDialog.DEVICE;
            default: return ScopeRestartDialog.SETTINGS;
        }
    }

    private boolean isGameModule() {
        return MODULE_SHOULDER.equals(section) || MODULE_AI_TRIGGER.equals(section)
                || MODULE_COMBO_SPEED.equals(section)
                || MODULE_FAN_CONTROL.equals(section)
                || MODULE_SUPER_RESOLUTION.equals(section)
                || MODULE_DIABLO_COEXIST.equals(section);
    }

    private boolean isStatusModule() {
        return MODULE_STATUS_LAYOUT.equals(section) || MODULE_STATUS_CLOCK.equals(section)
                || MODULE_STATUS_METRICS.equals(section);
    }

    private void toast(String message) { Toast.makeText(this, message, Toast.LENGTH_LONG).show(); }

    private boolean launcherIconVisible() {
        ComponentName alias = new ComponentName(this, getPackageName() + ".LauncherAlias");
        return getPackageManager().getComponentEnabledSetting(alias)
                != PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
    }

    private void setLauncherIconVisible(boolean visible) {
        ComponentName alias = new ComponentName(this, getPackageName() + ".LauncherAlias");
        getPackageManager().setComponentEnabledSetting(alias,
                visible ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }

    private final class SimpleWatcher implements TextWatcher {
        @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
        @Override public void onTextChanged(CharSequence s, int start, int before, int count) { markDirty(); }
        @Override public void afterTextChanged(Editable s) { }
    }

    private static final class Choice {
        final String key;
        final LinkedHashMap<String, Button> values = new LinkedHashMap<>();
        String selected = "";

        Choice(String key) { this.key = key; }

        void select(String value) {
            String target = values.containsKey(value) ? value
                    : values.containsKey("center") ? "center"
                    : values.isEmpty() ? "" : values.keySet().iterator().next();
            selected = target;
            for (Map.Entry<String, Button> entry : values.entrySet()) {
                entry.getValue().setAlpha(entry.getKey().equals(target) ? 1.0f : 0.48f);
            }
        }
    }

    private static final class PositionControl {
        final String id;
        final String label;
        final int defaultX;
        final int defaultY;
        final Switch enabled;
        final SeekBar x;
        final SeekBar y;
        final EditText xInput;
        final EditText yInput;
        final TextView xValue;
        final TextView yValue;

        PositionControl(String id, String label, int defaultX, int defaultY,
                Switch enabled, SeekBar x, SeekBar y,
                EditText xInput, EditText yInput, TextView xValue, TextView yValue) {
            this.id = id;
            this.label = label;
            this.defaultX = defaultX;
            this.defaultY = defaultY;
            this.enabled = enabled;
            this.x = x;
            this.y = y;
            this.xInput = xInput;
            this.yInput = yInput;
            this.xValue = xValue;
            this.yValue = yValue;
        }

        void load(StatusBarLayoutSpec.Position position) {
            x.setProgress(position == null ? defaultX : position.x);
            y.setProgress(position == null ? defaultY : position.y);
            enabled.setChecked(position != null);
            syncInputFromBar();
            render();
        }

        void syncInputFromBar() {
            syncInputFromBar(xInput, x);
            syncInputFromBar(yInput, y);
        }

        void syncInputFromBar(EditText input, SeekBar bar) {
            input.setText(String.valueOf(bar.getProgress()));
        }

        void syncBarFromInput() {
            syncBarFromInput(xInput, x);
            syncBarFromInput(yInput, y);
        }

        void syncBarFromInput(EditText input, SeekBar bar) {
            String raw = input.getText().toString().trim();
            if (raw.isEmpty()) return;
            try {
                int value = Integer.parseInt(raw);
                bar.setProgress(Math.max(0, Math.min(1000, value)));
            } catch (NumberFormatException ignored) { }
        }

        void render() {
            boolean active = enabled.isChecked();
            x.setEnabled(active);
            y.setEnabled(active);
            xInput.setEnabled(active);
            yInput.setEnabled(active);
            float alpha = active ? 1.0f : 0.35f;
            x.setAlpha(alpha); y.setAlpha(alpha);
            xInput.setAlpha(alpha); yInput.setAlpha(alpha);
            xValue.setText(String.format(Locale.CHINA, "横向 %d / 纵向 %d",
                    x.getProgress(), y.getProgress()));
            yValue.setText(String.format(Locale.CHINA, "%.1f%% / %.1f%%",
                    x.getProgress() / 10.0f, y.getProgress() / 10.0f));
        }
    }

    private static final class IconControl {
        final String id;
        final Switch hidden;
        final PositionControl position;
        final Slider scale;

        IconControl(String id, String label, Switch hidden,
                PositionControl position, Slider scale) {
            this.id = id;
            this.hidden = hidden;
            this.position = position;
            this.scale = scale;
        }

        void load(StatusBarLayoutSpec.Position pos) {
            hidden.setChecked(pos != null && pos.hidden);
            position.load(pos);
            if (pos != null && pos.scale != 1.0f) {
                scale.setValue((int) Math.round(pos.scale * 100f));
            }
        }

        void save(LinkedHashMap<String, StatusBarLayoutSpec.Position> positionValues) {
            if (hidden.isChecked()) {
                StatusBarLayoutSpec.Position pos = positionValues.get(id);
                int x = pos != null ? pos.x : position.x.getProgress();
                int y = pos != null ? pos.y : position.y.getProgress();
                float s = scale.percent ? scale.value() / 100f : scale.value();
                positionValues.put(id, new StatusBarLayoutSpec.Position(x, y, s, true));
            } else {
                StatusBarLayoutSpec.Position pos = positionValues.get(id);
                if (pos != null && pos.hidden) {
                    int x = pos.x;
                    int y = pos.y;
                    float s = scale.percent ? scale.value() / 100f : scale.value();
                    positionValues.put(id, new StatusBarLayoutSpec.Position(x, y, s, false));
                }
            }
        }
    }

    private static final class Slider {
        final String key, label;
        int min, max;
        final int step;
        final boolean percent;
        final SeekBar bar;
        final TextView text;
        Slider(String key, String label, int min, int max, int step,
                boolean percent, SeekBar bar, TextView text) {
            this.key = key; this.label = label; this.min = min; this.max = max;
            this.step = step; this.percent = percent; this.bar = bar; this.text = text;
        }
        int value() { return min + bar.getProgress() * step; }
        boolean setValue(int value) {
            int progress = Math.max(0, Math.min((max - min) / step,
                    Math.round((value - min) / (float) step)));
            if (bar.getProgress() == progress) return false;
            bar.setProgress(progress);
            render();
            return true;
        }
        void render() { text.setText(label + "：" + (percent
                ? String.format(Locale.US, "%.2f", value() / 100f) : String.valueOf(value()))); }
        String serialized() { return percent
                ? String.format(Locale.US, "%.2f", value() / 100f) : String.valueOf(value()); }
    }
}
