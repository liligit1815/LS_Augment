package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Matrix;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.DragEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.GridLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.Rect;
import ls.augment.com.AtomicWorkbenchWindowLayoutPlan.RailSide;
import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.EntryKey;
import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.Lease;
import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.Receipt;
import ls.augment.com.AtomicWorkbenchWindowPresentationPolicy.Roles;

/** Independent phone-side workspace; visual role changes keep each window and its buffer consumer. */
public final class AtomicWorkbenchActivity extends Activity implements ModuleNavigation.AncestorHandler {
    private static final int COUNT = AtomicWorkbenchPoolTopology.POOL_SIZE;
    private static volatile java.lang.ref.WeakReference<AtomicWorkbenchActivity> extractionHost = new java.lang.ref.WeakReference<>(null);
    private static final String EXTRA_TASK_ID = "atomic_workbench_task_id";
    // Serialize operations; exited clients are owned only by the phone-side cleanup queue.
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "LSA-WorkbenchSession"); thread.setDaemon(true); return thread;
    });
    private static final ExecutorService APP_READER = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "LSA-WorkbenchApps"); thread.setDaemon(true); return thread;
    });
    private static final java.util.concurrent.atomic.AtomicBoolean TASK_SNAPSHOT_DIAGNOSTIC_QUEUED = new java.util.concurrent.atomic.AtomicBoolean();
    private final Object sessionLock = new Object();
    private volatile long sessionGeneration = 1L;
    private long pollGeneration;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable poll = this::pollStatus;
    private final Runnable mediaPoll = this::pollMedia;
    private final Runnable cleanupPoll = this::refreshCleanupWait;
    private final Runnable homePresentationPoll = this::pollHomePresentation;
    private final AtomicWorkbenchLifecyclePolicy.Gate lifecycleGate = new AtomicWorkbenchLifecyclePolicy.Gate();
    private final AtomicWorkbenchWorkspaceModel model = new AtomicWorkbenchWorkspaceModel();
    private final AtomicWorkbenchWindowPresentationPolicy presentationPolicy = new AtomicWorkbenchWindowPresentationPolicy();
    private Receipt pendingPresentationFocus, homePresentationReceipt, taskPresentationReceipt;
    private EntryProof pendingLayoutProof;
    private final Runnable entrySideDispatch = this::dispatchEntrySide;
    private final Slot[] slots = new Slot[COUNT];
    // HOME can acquire a display before its first reply marks the empty slot as hosted.
    private final boolean[] pendingHomeSurfaces = new boolean[COUNT];
    private final String[] pendingTaskAllocations = new String[COUNT];
    private final ArrayList<AtomicWorkbenchAppRepository.App> apps = new ArrayList<>();
    private final ArrayList<AtomicWorkbenchAppRepository.App> filtered = new ArrayList<>();
    private volatile AtomicWorkbenchClient client;
    private volatile boolean destroyed, active, closing, surfaceUnavailable;
    // At most one mutating operation owns busy/epoch. Keep its actual result over a transient stop.
    private Runnable deferredOperation;
    private PendingAppSurfaceLaunch pendingAppSurfaceLaunch;
    private volatile int epoch;
    private UiKit ui;
    private AppConfig config;
    private FrameLayout workspace;
    private ImageView homeTransitionCover;
    private Bitmap homeTransitionBitmap;
    private LinearLayout desktop, appStrip, workspaceRoot, workspaceToolbar;
    private HorizontalScrollView appStripScroll;
    private GridLayout appGrid;
    private EditText search;
    private TextView desktopState, pageLabel, status;
    private Button previousPage, nextPage;
    private ImageButton appBack, desktopButton, exit, settingsButton, expandMain, focusReturn, reloadMain, mediaPrevious, mediaPlay, mediaNext, mediaFavorite;
    private AppPlacementDrag appPlacementDrag;
    private static final String APP_PLACEMENT_MIME = "application/vnd.redmagic.duo.workspace-app";
    private long reloadAvailableAt;
    private AtomicWorkbenchWindowMotion windowMotion;

    /** Local drag capability: ClipData alone can never request an application launch. */
    private final class AppPlacementDrag {
        final AtomicWorkbenchAppRepository.App app;
        final long revision = model.revision(), session = sessionGeneration, created = SystemClock.elapsedRealtime();
        final int operation = epoch;
        int target = -1;
        boolean ended;
        AppPlacementDrag(AtomicWorkbenchAppRepository.App app) { this.app = app; }
        boolean current() {
            long now = SystemClock.elapsedRealtime();
            return appPlacementDrag == this && !ended && active && !destroyed && !closing
                    && quickOpenApps && config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS)
                    && session == sessionGeneration && operation == epoch && revision == model.revision()
                    && now >= created && now - created < 30_000 && !ResetWriteFence.stale(launchGeneration)
                    && apps.contains(app) && appPreferencesState.entry(app.key()).visible;
        }
    }
    private AtomicWorkbenchTransfer transfer;
    private AtomicWorkbenchTextTool textTool;
    private AtomicWorkbenchPasteCoordinator pasteCoordinator;
    private volatile boolean hostDialogActive;
    private volatile boolean resumed;
    private int hostInputPending;
    private long hostInputSequence;
    private volatile boolean hostDragActive, textDeliveryActive;
    private Intent pendingTransfer;
    private String pendingTransferPackage;
    private long pendingTransferStarted;
    private final Runnable transferDispatch = this::dispatchPendingTransfer;
    private LinearLayout mediaCard;
    private AtomicWorkbenchCardPager cardPager;
    private AtomicWorkbenchNotificationCards notificationCards;
    private TextView navigationTitle, navigationSubtitle, cardPageHint;
    private TextView navigationSpeed, navigationSpeedUnit, navigationRemaining;
    private ImageView navigationIcon;
    private LinearLayout navigationPage, navigationSpeedColumn, navigationMetricsColumn;
    private ImageView mediaArtwork;
    private TextView mediaTitle, mediaSubtitle, mediaProgress;
    private Dialog closeDialog, settingsDialog;
    private final AtomicWorkbenchTaskReferenceUiState taskReferenceUiState = new AtomicWorkbenchTaskReferenceUiState(AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
    private AtomicWorkbenchTaskReferenceControls taskReferenceControls;
    private boolean showMedia, quickOpenApps, mediaBusy, mediaPlaying, mediaAvailable, mediaRetryRequired;
    private Bundle lastMediaState;
    private volatile boolean mediaEnabled;
    private volatile boolean connectionRetryRequired;
    private AtomicWorkbenchClient connectionCleanupClient;
    private long connectionCleanupSession = -1L;
    private volatile long mediaGeneration;
    private int emptySideSlots = 3;
    private int requestedSideCount = 3;
    private boolean sideCountPending;
    private String mediaSessionId = "", navigationPackage = "";
    private boolean busy, polling, appsLoaded, nativeHomePending = true, appListRequested;
    private volatile boolean exitRequested, recoveryPending, waitingForCleanup;
    private int displayWidth, displayHeight, density, page, gridRows = 4, focusedWindow = -1;
    private int mainLayoutWindow = -1, mainLayoutWidth, mainLayoutHeight, mainLayoutLeft, mainLayoutTop;
    private int mainLayoutDisplayWidth, mainLayoutDisplayHeight;
    private boolean mainLayoutPresented;
    private boolean hostTouchActive;
    // A native side tap owns its original View rectangle through the posted click.
    private NativeShieldLayoutHold nativeShieldLayoutHold;
    private boolean nativeShieldLayoutDeferred, nativeShieldDispatchingUp;
    private long nativeShieldTouchSequence, nativeShieldDownTime, nativeShieldEventTime;
    private static final java.util.concurrent.atomic.AtomicInteger NATIVE_SHIELD_DIAGNOSTIC_PENDING = new java.util.concurrent.atomic.AtomicInteger();
    private static final java.util.concurrent.atomic.AtomicLong NATIVE_SHIELD_DIAGNOSTIC_DROPPED = new java.util.concurrent.atomic.AtomicLong();
    private volatile boolean outputsSyncing, outputsParked;
    private boolean outputFocusPending, outputsNeedRetry, outputSyncAgain;
    private long outputSequence;
    private AtomicWorkbenchTaskOperationRequest pendingTaskOperation;
    private boolean taskQueryPending;
    private AtomicWorkbenchTaskUiSnapshot lastTaskSnapshot;
    private long taskSnapshotElapsed = -1;
    private long taskSnapshotDiagnosticLast, taskSnapshotDiagnosticSuppressed;
    private long extractionInputRevision = -1, extractionGeometryRevision;
    private boolean extractionGeometryPending, extractionGeometryAttempted;
    private String extractionGeometrySignature = "";
    private final Runnable extractionGeometryTick = this::refreshExtractionGeometry;
    private volatile long outputTransition;
    // Presentation only: this never authorizes task mutation or declares cleanup complete.
    private int taskStorageNotice; // 0=no current warning, 1=unverified, 2=not configured
    private String statusMessage, taskStorageStatusProblem;
    private volatile long taskStorageProbeGeneration;
    private long taskStorageProbeSequence, taskStorageProbeInFlight;
    private long taskStorageProbeDelay = 2000L;
    private boolean taskStorageRecheckWanted;
    private final Runnable taskStorageRecheck = this::recheckTaskStorageScope;
    private long launchGeneration;
    private String returnRoute, restoreNotice, entryProblemText, operationNotice, stripSignature = "", gridSignature = "";
    private ComponentName incomingComponent;
    private volatile EntryProof incomingProof;
    private int incomingTaskId = -1;
    private boolean incomingPending;
    private MotionEvent lastTouch;
    private AtomicWorkbenchInputPolicy.Geometry gestureGeometry;
    private int gestureWindow = -1, gestureDisplay = -1;
    private int homePresentationWindow = -1, homePresentationEpoch;
    private long homePresentationStarted, homePresentationStartedUptime, homePresentationFrame;
    private int homePresentationSurfaceLifecycle;
    private boolean homePresentationAllowReuse;
    private Bundle homePresentationState;
    private boolean homePresentationPolling;
    private boolean entryFocusLogged;
    private long homePresentationPollGeneration;
    private boolean presentationNeedsRetry;
    private int homePresentationRetryWindow = -1;
    private long homePresentationLastWaitLog;
    private long homePresentationLastProducerNanos;
    private String homePresentationRejectReason = "", homePresentationLastLoggedReason = "";

    /** One immutable automatic handoff; ordinary later app clicks have no entry deadline. */
    private static final class EntryProof {
        final long revision, triggered, resetGeneration;
        final int build, userId;
        final String checksum;
        final RailSide side;
        EntryProof(Intent intent) {
            revision = intent.getLongExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_REVISION, -1L);
            checksum = intent.getStringExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_CHECKSUM);
            triggered = intent.getLongExtra(AtomicWorkbenchConfig.EXTRA_TRIGGER_ELAPSED, -1L);
            build = intent.getIntExtra(AtomicWorkbenchConfig.EXTRA_ENTRY_BUILD, -1);
            resetGeneration = intent.getLongExtra(AtomicWorkbenchSettingsActivity.EXTRA_GENERATION, ResetWriteFence.generation());
            userId = android.os.Process.myUid() / 100000;
            String value = intent.getStringExtra(AtomicWorkbenchConfig.EXTRA_SIDE);
            side = "left".equals(value) ? RailSide.LEFT : "right".equals(value) ? RailSide.RIGHT : null;
        }
        EntryKey key() { return new EntryKey(userId, resetGeneration, build, revision, checksum, triggered); }
    }
    /** One original App request waiting only for its real output producer, never a new allocation permit. */
    private final class PendingAppSurfaceLaunch {
        final AtomicWorkbenchWorkspaceModel.LaunchPlan plan;
        final Receipt presentation;
        final Roles expectedRoles, previousRoles;
        final Lease lease;
        final AtomicWorkbenchClient connected;
        final long session, reset, entry;
        final int request, previousMain, initialLifecycle;
        final boolean previousDesktop, previousExpanded;
        final Runnable dispatch;
        boolean layoutPrepared, dispatched, outputSyncRequested;
        PendingAppSurfaceLaunch(AtomicWorkbenchWorkspaceModel.LaunchPlan plan, Receipt presentation,
                int request, long session, int previousMain, boolean previousDesktop,
                boolean previousExpanded, Roles previousRoles, Runnable dispatch) {
            this.plan = plan; this.presentation = presentation; this.request = request; this.session = session;
            this.previousMain = previousMain; this.previousDesktop = previousDesktop;
            this.previousExpanded = previousExpanded; this.previousRoles = previousRoles; this.dispatch = dispatch;
            expectedRoles = presentationRoles(); lease = presentationLease(plan.windowId); connected = client;
            reset = launchGeneration; entry = presentationPolicy.entryGeneration();
            initialLifecycle = slots[plan.windowId].surfaceLifecycle;
        }
    }

    private static final class EntryRejected extends Exception {
        EntryRejected(String message) { super(message); }
    }
    private static final class CleanupPending extends Exception {
        CleanupPending() { super("正在释放桌面资源，请稍后再试。"); }
    }


    // Workbench display/input coordinates are calibrated in portrait; allowing rotation requires a separate coordinate contract.
    //noinspection SourceLockedOrientationActivity
    @Override public void onCreate(Bundle state) {
        AppCrashDiagnostics.stage("atomic_workbench_create");
        super.onCreate(state);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        DisplayMetrics metrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getRealMetrics(metrics);
        displayWidth = Math.min(metrics.widthPixels, metrics.heightPixels);
        displayHeight = Math.max(metrics.widthPixels, metrics.heightPixels);
        density = metrics.densityDpi;
        setIntent(prepareEntryIntent(getIntent(), state != null));
        readIncoming(getIntent());
        AppCrashDiagnostics.stage("atomic_workbench_content");
        ui = new UiKit(this);
        ui.setHostInputObserver(this::onHostDialogInput);
        config = new AppConfig(this);
        showMedia = config.getBoolean(AtomicWorkbenchConfig.SHOW_MEDIA); mediaEnabled = showMedia;
        quickOpenApps = config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        emptySideSlots = Math.max(0, Math.min(3, config.getInt(AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS, 3)));
        requestedSideCount = Math.max(3, Math.min(6, config.getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3)));
        // This changes presentation only. Actual new high IDs still require the backend's real admission.
        model.configureCapacity(requestedSideCount, false);
        LinearLayout root = workspaceRoot = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(ui.backgroundDrawable());
        root.setPadding(ui.dp(6), 0, ui.dp(6), 0);
        createMediaCard(root);
        LinearLayout toolbar = workspaceToolbar = new LinearLayout(this);
        toolbar.setTag("atomic-workbench-toolbar");
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        appBack = iconTool("返回", "back", "atomic-workbench-app-back", this::applicationBack);
        desktopButton = iconTool("桌面", "home", "atomic-workbench-home", this::showDesktop);
        settingsButton = iconTool("工作台设置", "settings", "atomic-workbench-settings", this::showWorkspaceSettings);
        expandMain = iconTool("展开主应用", "card-corners", "atomic-workbench-expand", () -> setMainExpanded(true));
        exit = iconTool("退出工作台", "exit", "atomic-workbench-exit", () -> requestCloseAll(true));
        toolbar.addView(appBack, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        toolbar.addView(desktopButton, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        reloadMain = iconTool("重载当前应用画面", "refresh", "atomic-workbench-reload", this::reloadMainOutput);
        toolbar.addView(reloadMain, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        TextView heading = ui.text("红魔Step", 16, ui.text, true);
        heading.setGravity(Gravity.CENTER); heading.setMaxLines(1); heading.setEllipsize(TextUtils.TruncateAt.END);
        heading.setAccessibilityHeading(true);
        toolbar.addView(heading, new LinearLayout.LayoutParams(0, -2, 1));
        toolbar.addView(settingsButton, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        toolbar.addView(expandMain, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        toolbar.addView(exit, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        root.addView(toolbar, new LinearLayout.LayoutParams(-1, -2));
        createAppStrip(root);
        transfer = new AtomicWorkbenchTransfer(this, ui, new AtomicWorkbenchTransfer.Callback() {
            @Override public void onChanged() { cancelGesture(); }
            @Override public void onSend(Intent share, String packageName) { sendTransfer(share, packageName); }
            @Override public void onDragState(boolean value) {
                hostDragActive = value;
                if (value) cancelGesture();
                else if (hostDialogActive && !busy) queueHostInput(true);
            }
        });
        textTool = new AtomicWorkbenchTextTool(ui, new AtomicWorkbenchTextTool.Actions() {
            @Override public void shareText(String value) { transfer.shareText(value); }
            @Override public boolean startTextDrag(View source, String value, Runnable ended) {
                return transfer.startTextDrag(source, value, ended);
            }
        });
        textTool.setDragObserver(value -> {
            hostDragActive = value;
            if (!value && hostDialogActive && !busy) queueHostInput(true);
        });
        transfer.setTextTool(textTool::show);
        if (state != null) textTool.restoreState(state.getBundle("atomic_workbench_text_tool"));
        pasteCoordinator = new AtomicWorkbenchPasteCoordinator(SystemClock::elapsedRealtime,
                AtomicWorkbenchPasteService.backend(), command -> main.post(command));
        transfer.bindScrollTarget(appStripScroll);
        workspace = new FrameLayout(this);
        workspace.setTag("atomic-workbench-workspace");
        root.addView(workspace, new LinearLayout.LayoutParams(-1, 0, 1));
        for (int id = 0; id < COUNT; id++) {
            slots[id] = new Slot(id);
            workspace.addView(slots[id].frame, new FrameLayout.LayoutParams(1, 1));
        }
        windowMotion = new AtomicWorkbenchWindowMotion(workspace);
        createDesktop();
        desktop.setOnDragListener((view, event) -> event.getLocalState() instanceof AtomicWorkbenchActivity.AppPlacementDrag
                && onAppPlacementDrag(model.mainWindowId(), event));
        workspace.addView(desktop, new FrameLayout.LayoutParams(1, 1));
        homeTransitionCover = new ImageView(this);
        homeTransitionCover.setScaleType(ImageView.ScaleType.FIT_CENTER);
        homeTransitionCover.setBackground(ui.round(ui.cardHigh, ui.surfaceRadiusDp(18)));
        homeTransitionCover.setClipToOutline(true);
        homeTransitionCover.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        homeTransitionCover.setVisibility(View.GONE);
        workspace.addView(homeTransitionCover, new FrameLayout.LayoutParams(1, 1));
        status = ui.text("正在读取本机应用…", 12, ui.muted, false);
        status.setTag("atomic-workbench-session-status");
        status.setGravity(Gravity.CENTER);
        status.setPadding(ui.dp(12), ui.dp(10), ui.dp(12), ui.dp(10));
        status.setBackground(ui.round(ui.cardHigh, ui.surfaceRadiusDp(16)));
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        status.setOnClickListener(view -> {
            operationNotice = null;
            if (waitingForCleanup) refreshCleanupWait();
            else if (recoveryPending) requestCloseAll(exitRequested);
            else if (pendingTaskOperation != null) queryPendingTaskOperation();
            else if (taskStorageNotice != 0) {
                // A busy unknown-scope click must not fall through to the old
                // resume/focus producer path. This branch only requests a read.
                if (active && !busy && client != null) {
                    taskStorageRecheckWanted = true;
                    recheckTaskStorageScope();
                }
            }
            else if ((outputsParked || outputsNeedRetry) && active) syncWorkspaceOutputs();
            else if (presentationNeedsRetry) retryHomePresentation();
            else if (!busy && client != null) pollStatus();
        });
        workspace.addView(status, new FrameLayout.LayoutParams(1, -2, Gravity.BOTTOM));
        focusReturn = iconTool("返回工作区", "module", "atomic-workbench-return-workspace", () -> setMainExpanded(false));
        focusReturn.setBackground(ui.pressable(ui.round(ui.cardHigh, ui.surfaceRadiusDp(14))));
        focusReturn.setVisibility(View.GONE);
        workspace.addView(focusReturn, new FrameLayout.LayoutParams(ui.dp(48), ui.dp(48), Gravity.TOP | Gravity.END));
        workspace.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> layoutWorkspace());
        workspace.getViewTreeObserver().addOnPreDrawListener(this::onWorkspacePreDraw);
        ui.setContentView(root);
        ui.applyGestureInset(root, 4, true);
        root.setFocusableInTouchMode(true);
        root.requestFocus();
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, this::applicationBack);
        renderWorkspace();
        transfer.acceptPending();
        loadApps();
        AppCrashDiagnostics.stage("atomic_workbench_returned");
        lifecycleDiagnostic("UI_ENTRY_CREATED", "gesture=" + (incomingProof != null)
                + ";request_elapsed=" + (incomingProof == null ? -1L : incomingProof.triggered)
                + ";activity_created=true;visual_content=UNVERIFIED");
    }

    private Button tool(String text, String tag, Runnable action) {
        Button button = ui.tonalButton(text);
        button.setMinWidth(0); button.setMinimumWidth(0);
        button.setTag(tag); button.setOnClickListener(view -> action.run()); return button;
    }

    private ImageButton iconTool(String label, String glyph, String tag, Runnable action) {
        ImageButton button = new ImageButton(this);
        button.setImageDrawable(new GlassIcon(glyph, ui.text));
        button.setScaleType(ImageView.ScaleType.FIT_CENTER); button.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
        button.setBackground(ui.pressable(ui.round(android.graphics.Color.TRANSPARENT, ui.surfaceRadiusDp(14))));
        button.setMinimumWidth(ui.dp(48)); button.setMinimumHeight(ui.dp(48));
        button.setContentDescription(label); button.setTooltipText(label); button.setTag(tag);
        button.setOnClickListener(view -> action.run()); return button;
    }

    private void createAppStrip(LinearLayout root) {
        appStripScroll = new HorizontalScrollView(this);
        appStripScroll.setTag("atomic-workbench-app-strip");
        appStripScroll.setHorizontalScrollBarEnabled(false);
        appStrip = new LinearLayout(this);
        appStrip.setTag("atomic-workbench-app-strip-items");
        appStrip.setGravity(Gravity.CENTER_VERTICAL);
        appStripScroll.addView(appStrip, new HorizontalScrollView.LayoutParams(-2, -1));
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, ui.dp(60));
        layout.topMargin = ui.dp(4); layout.bottomMargin = ui.dp(6);
        appStripScroll.setVisibility(quickOpenApps ? View.VISIBLE : View.GONE);
        root.addView(appStripScroll, layout);
    }

    private void createMediaCard(LinearLayout root) {
        mediaCard = ui.preferenceCard(); mediaCard.setOrientation(LinearLayout.VERTICAL);
        mediaCard.setTag("atomic-workbench-media"); mediaCard.setGravity(Gravity.CENTER_VERTICAL);
        mediaCard.setPadding(ui.dp(10), ui.dp(8), ui.dp(6), ui.dp(8));
        LinearLayout musicPage = new LinearLayout(this); musicPage.setGravity(Gravity.CENTER_VERTICAL);
        musicPage.setMinimumHeight(ui.dp(72));
        mediaArtwork = new ImageView(this); mediaArtwork.setScaleType(ImageView.ScaleType.CENTER_CROP);
        mediaArtwork.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        mediaArtwork.setFocusable(true); mediaArtwork.setContentDescription("选择媒体来源");
        mediaArtwork.setTooltipText("选择媒体来源"); mediaArtwork.setTag("atomic-workbench-media-sources");
        mediaArtwork.setOnClickListener(view -> showMediaSources());
        mediaArtwork.setImageDrawable(new GlassIcon("music", ui.muted));
        musicPage.addView(mediaArtwork, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        LinearLayout labels = new LinearLayout(this); labels.setOrientation(LinearLayout.VERTICAL);
        mediaTitle = ui.text("暂无媒体", 14, ui.text, true);
        mediaTitle.setMaxLines(1); mediaTitle.setEllipsize(TextUtils.TruncateAt.END);
        mediaSubtitle = ui.text("媒体控制会显示在这里", 11, ui.muted, false);
        mediaSubtitle.setMaxLines(2); mediaSubtitle.setEllipsize(TextUtils.TruncateAt.END);
        labels.addView(mediaTitle, ui.wrap()); labels.addView(mediaSubtitle, ui.wrap());
        mediaProgress = ui.text("", 10, ui.muted, false); mediaProgress.setTag("atomic-workbench-media-progress");
        mediaProgress.setMaxLines(1); mediaProgress.setVisibility(View.GONE); labels.addView(mediaProgress, ui.wrap());
        labels.setMinimumHeight(ui.dp(48)); labels.setGravity(Gravity.CENTER_VERTICAL);
        labels.setOnClickListener(view -> openMediaSource()); labels.setContentDescription("返回当前媒体来源应用");
        LinearLayout.LayoutParams textLayout = new LinearLayout.LayoutParams(0, -2, 1);
        textLayout.leftMargin = ui.dp(8); musicPage.addView(labels, textLayout);
        mediaPrevious = iconTool("上一首", "previous", "atomic-workbench-media-previous", () -> commandMedia("previous"));
        mediaPlay = iconTool("播放", "play", "atomic-workbench-media-play", () -> commandMedia(mediaPlaying ? "pause" : "play"));
        mediaNext = iconTool("下一首", "next", "atomic-workbench-media-next", () -> commandMedia("next"));
        mediaFavorite = iconTool("收藏", "heart", "atomic-workbench-media-favorite", this::favoriteMedia);
        musicPage.addView(mediaPrevious, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        musicPage.addView(mediaPlay, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        musicPage.addView(mediaNext, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        musicPage.addView(mediaFavorite, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        navigationPage = new LinearLayout(this); navigationPage.setGravity(Gravity.CENTER_VERTICAL);
        navigationPage.setOrientation(LinearLayout.VERTICAL);
        navigationPage.setPadding(ui.dp(4), 0, ui.dp(6), 0);
        navigationPage.setTag("atomic-workbench-navigation"); navigationPage.setMinimumHeight(ui.dp(56));
        navigationPage.setOnClickListener(view -> openNavigationWindow());
        navigationPage.setContentDescription("查看导航地图窗口");
        LinearLayout navigationMain = new LinearLayout(this); navigationMain.setGravity(Gravity.CENTER_VERTICAL);
        navigationIcon = new ImageView(this); navigationIcon.setImageDrawable(new GlassIcon("navigation", 0xffffffff));
        navigationIcon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        navigationIcon.setTag("atomic-workbench-navigation-maneuver");
        navigationIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        navigationMain.addView(navigationIcon, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        LinearLayout navigationLabels = new LinearLayout(this); navigationLabels.setOrientation(LinearLayout.VERTICAL);
        navigationTitle = ui.text("", 25, 0xffffffff, true); navigationTitle.setMaxLines(1); navigationTitle.setEllipsize(TextUtils.TruncateAt.END);
        navigationTitle.setTag("atomic-workbench-navigation-distance");
        navigationSubtitle = ui.text("", 11, 0xbfffffff, false); navigationSubtitle.setMaxLines(2); navigationSubtitle.setEllipsize(TextUtils.TruncateAt.END);
        navigationSubtitle.setTag("atomic-workbench-navigation-roads");
        navigationLabels.addView(navigationTitle, ui.wrap()); navigationLabels.addView(navigationSubtitle, ui.wrap());
        LinearLayout.LayoutParams navigationLayout = new LinearLayout.LayoutParams(0, -2, 1); navigationLayout.leftMargin = ui.dp(8);
        navigationMain.addView(navigationLabels, navigationLayout);
        navigationMetricsColumn = new LinearLayout(this); navigationMetricsColumn.setOrientation(LinearLayout.VERTICAL);
        navigationMetricsColumn.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        navigationSpeedColumn = new LinearLayout(this); navigationSpeedColumn.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        navigationSpeedColumn.setTag("atomic-workbench-navigation-speed");
        navigationSpeed = ui.text("", 23, 0xffffffff, true); navigationSpeed.setGravity(Gravity.END); navigationSpeed.setMaxLines(1);
        navigationSpeedUnit = ui.text("km/h", 10, 0xbfffffff, false); navigationSpeedUnit.setPadding(ui.dp(4), 0, 0, 0);
        navigationSpeedColumn.addView(navigationSpeed, new LinearLayout.LayoutParams(-2, -2));
        navigationSpeedColumn.addView(navigationSpeedUnit, new LinearLayout.LayoutParams(-2, -2));
        navigationMetricsColumn.addView(navigationSpeedColumn, new LinearLayout.LayoutParams(-1, -2));
        navigationRemaining = ui.text("", 12, 0xd9ffffff, false); navigationRemaining.setMaxLines(2); navigationRemaining.setGravity(Gravity.END);
        navigationRemaining.setTag("atomic-workbench-navigation-remaining");
        LinearLayout.LayoutParams remainingLayout = new LinearLayout.LayoutParams(-1, -2);
        remainingLayout.topMargin = ui.dp(4);
        navigationMetricsColumn.addView(navigationRemaining, remainingLayout);
        LinearLayout.LayoutParams metricsLayout = new LinearLayout.LayoutParams(ui.dp(118), -2); metricsLayout.leftMargin = ui.dp(8);
        navigationMain.addView(navigationMetricsColumn, metricsLayout);
        navigationPage.addView(navigationMain, new LinearLayout.LayoutParams(-1, -2));
        navigationMetricsColumn.setVisibility(View.GONE); navigationSpeedColumn.setVisibility(View.GONE); navigationRemaining.setVisibility(View.GONE);
        cardPageHint = ui.text("", 10, ui.muted, false); cardPageHint.setGravity(Gravity.CENTER);
        cardPageHint.setTag("atomic-workbench-card-page");
        cardPager = new AtomicWorkbenchCardPager(this); cardPager.setTag("atomic-workbench-card-pager");
        cardPager.setPages(musicPage, navigationPage, this::updateCardPageHint);
        notificationCards = new AtomicWorkbenchNotificationCards(ui, this::recordNotificationTimer, this::runNotificationSourceAction, this::updateNotificationPages);
        cardPager.setOnClickListener(view -> openSelectedCard());
        mediaCard.addView(cardPager, new LinearLayout.LayoutParams(-1, -2)); mediaCard.addView(cardPageHint, ui.wrap());
        mediaCard.setOnClickListener(view -> openSelectedCard());
        mediaCard.setVisibility(showMedia ? View.VISIBLE : View.GONE); updateMediaButtons();
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2);
        layout.topMargin = ui.dp(4); layout.bottomMargin = ui.dp(4); root.addView(mediaCard, layout);
    }

    private void retryMediaConnection() {
        if (!mediaRetryRequired || !canPollMedia()) return;
        mediaRetryRequired = false; connectionRetryRequired = false; mediaSubtitle.setText("正在重新连接…"); scheduleMedia();
    }

    private void updateCardPageHint() {
        cardPageHint.setVisibility(cardPager.pageCount() > 1 ? View.VISIBLE : View.GONE);
        cardPageHint.setText(cardPager.indicator());
        cardPageHint.setContentDescription(cardPager.pageDescription());
        updateNavigationSurface();
    }

    private void openSelectedCard() {
        if ("music".equals(cardPager.pageId())) { if (mediaRetryRequired) retryMediaConnection(); else openMediaSource(); }
        else if ("navigation".equals(cardPager.pageId())) openNavigationWindow();
    }

    private void updateNotificationPages() {
        if (cardPager != null && notificationCards != null)
            cardPager.setNotificationPages(notificationCards.pages(), notificationCards.trustedComplete());
    }

    private void runNotificationSourceAction(String operation,Bundle request,java.util.function.Consumer<Bundle> reply){
        AtomicWorkbenchClient connected=client;final long session=sessionGeneration,generation=mediaGeneration;
        final long entry=presentationPolicy.entryGeneration();Bundle frozen=new Bundle(request);
        WORKER.execute(()->{
            Bundle response;
            try{response=connected!=null&&connected==client&&session==sessionGeneration&&generation==mediaGeneration&&canPollMedia()
                    ?connected.notificationAction(operation,frozen):failure("通知来源已变化，请重新查看。");}
            catch(Exception unknown){response=failure("通知操作结果尚未确认，请打开来源核对；不会自动重发。");}
            Bundle result=response;
            main.post(()->{
                if(destroyed||connected!=client||session!=sessionGeneration||generation!=mediaGeneration)return;
                if(operation.equals("describe_open")&&result.getBoolean("success")){
                    try{
                        AtomicWorkbenchNotificationOpenRequest target=AtomicWorkbenchNotificationOpenRequest.fromDescriptor(result);
                        AtomicWorkbenchAppRepository.App app=findApp(target.component);
                        if(entry!=presentationPolicy.entryGeneration()||!canInteract()||app==null
                                ||notificationCards==null||!notificationCards.currentSource(target.sourceId,target.generation,target.revision)
                                ||!notificationOpenDescriptorCurrent(target.descriptor(),target.sourceId))throw new IllegalStateException();
                        launchSourceApp(app,-1,null,AtomicWorkbenchWorkspaceOpenRequest.notification(target));
                    }catch(RuntimeException invalid){result.putBoolean("success",false);result.putString("message","来源入口或工作区已变化，请重新点按来源。");}
                }
                reply.accept(result);
            });
        });
    }
    private boolean workspaceOpenDescriptorCurrent(AtomicWorkbenchWorkspaceOpenRequest source){
        return source.media!=null?mediaOpenDescriptorCurrent(source.media.descriptor(),source.sourceId)
                :notificationOpenDescriptorCurrent(source.notification.descriptor(),source.sourceId);
    }
    private boolean notificationOpenDescriptorCurrent(Bundle metadata,String sourceId){
        try{
            AtomicWorkbenchNotificationOpenRequest target=AtomicWorkbenchNotificationOpenRequest.fromDescriptor(metadata);
            if(!sourceId.equals(target.sourceId)||!target.fresh(SystemClock.elapsedRealtime())||target.userId!=android.os.Process.myUid()/100000)return false;
            ComponentName component=ComponentName.unflattenFromString(target.component);
            android.content.pm.ActivityInfo info=getPackageManager().getActivityInfo(component,0);
            return AtomicWorkbenchAppRepository.allowed(info,getPackageName())&&info.applicationInfo.uid==target.ownerUid
                    &&component.getPackageName().equals(target.packageName);
        }catch(android.content.pm.PackageManager.NameNotFoundException|RuntimeException unavailable){return false;}
    }

    private void recordNotificationTimer(Bundle request, java.util.function.Consumer<Bundle> reply) {
        AtomicWorkbenchClient connected = client; final long session = sessionGeneration, generation = mediaGeneration;
        Bundle frozen = new Bundle(request);
        WORKER.execute(() -> {
            Bundle response;
            try {
                response = connected != null && connected == client && session == sessionGeneration
                        && generation == mediaGeneration && canPollMedia() ? connected.recordTimer(frozen)
                        : failure("计时来源已变化，请重新查看。");
            } catch (Exception unknown) { response = failure("记录结果尚未确认，请刷新查看。"); }
            Bundle result = response;
            main.post(() -> { if (!destroyed && connected == client && session == sessionGeneration && generation == mediaGeneration) reply.accept(result); });
        });
    }

    private void updateNavigationSurface() {
        boolean navigation = "navigation".equals(cardPager.pageId());
        mediaCard.setPadding(ui.dp(10), ui.dp(navigation ? 4 : 8), ui.dp(6), ui.dp(navigation ? 4 : 8));
        if (mediaCard instanceof LiquidGlassLayout) ((LiquidGlassLayout) mediaCard).setSurfaceTint(navigation ? 0xe8101216 : 0);
        else mediaCard.setBackground(navigation ? ui.round(0xe8101216, ui.surfaceRadiusDp(26)) : null);
        cardPageHint.setTextColor(navigation ? 0xbfffffff : ui.muted);
    }

    private void applyNavigationState(Bundle state) {
        AtomicWorkbenchNavigationCardData card = AtomicWorkbenchNavigationCardData.from(state);
        navigationPackage = card.packageName;
        navigationTitle.setText(card.title); navigationSubtitle.setText(card.subtitle);
        updateNavigationDetails(card);
        cardPager.setNavigationSource(card.available, card.sourceGeneration);
    }

    private void updateNavigationDetails(AtomicWorkbenchNavigationCardData card) {
        navigationTitle.setTextSize(UiKit.compactTextSize(card.structured ? 25 : 14));
        navigationSubtitle.setVisibility(card.subtitle.isEmpty() ? View.GONE : View.VISIBLE);
        navigationIcon.setImageDrawable(new GlassIcon(card.glyph, 0xffffffff));
        navigationIcon.setContentDescription(card.maneuver);
        navigationSpeed.setText(card.speed);
        navigationSpeedColumn.setVisibility(card.speed.isEmpty() ? View.GONE : View.VISIBLE);
        navigationRemaining.setText(card.remaining);
        navigationRemaining.setVisibility(card.remaining.isEmpty() ? View.GONE : View.VISIBLE);
        navigationMetricsColumn.setVisibility(card.speed.isEmpty() && card.remaining.isEmpty() ? View.GONE : View.VISIBLE);
        navigationPage.setContentDescription(card.available ? card.maneuver + "，" + card.title + "，" + card.subtitle
                + (card.speed.isEmpty() ? "" : "，速度 " + card.speed + " km/h")
                + (card.remaining.isEmpty() ? "" : "，剩余 " + card.remaining) + "，查看导航地图窗口" : "查看导航地图窗口");
    }

    private void openNavigationWindow() {
        if (!canInteract() || navigationPackage.isEmpty()) return;
        for (AtomicWorkbenchAppRepository.App app : apps) {
            if (navigationPackage.equals(app.component.getPackageName())) { launchApp(app, -1); return; }
        }
        showStatus("未找到导航应用入口，请切换到已打开的地图窗口。");
    }

    private void showWorkspaceSettings() {
        if (destroyed || closing || (settingsDialog != null && settingsDialog.isShowing())) return;
        AtomicWorkbenchAppearanceControls controls = new AtomicWorkbenchAppearanceControls(
                this, ui, config, launchGeneration, WORKER, this::refreshAppearance);
        LinearLayout content = new LinearLayout(this); content.setOrientation(LinearLayout.VERTICAL);
        content.addView(controls, ui.wrap());
        Button materials = ui.tonalButton("文字工具"); materials.setMinimumHeight(ui.dp(48));
        materials.setTag("atomic-workbench-text-tools");
        materials.setOnClickListener(view -> { if (settingsDialog != null) settingsDialog.dismiss(); textTool.show(""); });
        content.addView(materials, ui.margins(0, 8, 0, 0));
        Button shelf = ui.tonalButton("暂存与移出任务"); shelf.setMinimumHeight(ui.dp(48));
        shelf.setTag("atomic-workbench-task-shelf");
        shelf.setOnClickListener(view -> { if (settingsDialog != null) settingsDialog.dismiss(); showTaskShelf(); });
        content.addView(shelf, ui.margins(0, 8, 0, 0));
        Button references = ui.tonalButton("管理暂存记录"); references.setMinimumHeight(ui.dp(48));
        references.setTag("atomic-workbench-task-reference-management");
        references.setOnClickListener(view -> { if (settingsDialog != null) settingsDialog.dismiss(); showTaskReferenceManagement(); });
        content.addView(references, ui.margins(0, 8, 0, 0));
        settingsDialog = ui.glassDialog("工作台设置", content, "完成", () -> { }, null);
    }

    private void showTaskReferenceManagement() {
        closeTaskReferenceManagement();
        AtomicWorkbenchClient connected = client;
        final long session = sessionGeneration, reset = launchGeneration;
        if (connected == null || !active || destroyed || closing || exitRequested || recoveryPending || waitingForCleanup
                || ResetWriteFence.stale(reset)) { showStatus("工作台连接或配置已变化，请先核实当前会话。"); return; }
        taskReferenceControls = AtomicWorkbenchTaskReferenceControls.show(this, ui, WORKER, connected::manageTaskReferences,
                () -> connected == client && session == sessionGeneration && active && !destroyed && !closing
                        && !exitRequested && !recoveryPending && !waitingForCleanup && !ResetWriteFence.stale(reset),
                taskReferenceUiState, connected, session, reset, () -> { lastTaskSnapshot = null; taskSnapshotElapsed = -1; });
    }

    private void closeTaskReferenceManagement() {
        AtomicWorkbenchTaskReferenceControls controls = taskReferenceControls;
        taskReferenceControls = null;
        if (controls != null) controls.close();
    }

    private void showTaskShelf() {
        if (!canInteract()) return;
        if (pendingTaskOperation != null) { queryPendingTaskOperation(); return; }
        if (client == null) { showStatus("工作台连接尚未就绪，请稍后查看任务。"); return; }
        readTaskSnapshot(snapshot -> {
            if (snapshot.entries.isEmpty()) { showStatus("当前没有已确认可恢复的暂存或移出任务。"); return; }
            String[] names = new String[snapshot.entries.size()], descriptions = new String[names.length];
            for (int i = 0; i < names.length; i++) {
                AtomicWorkbenchTaskUiSnapshot.Entry entry = snapshot.entries.get(i);
                names[i] = taskLabel(entry.identity); descriptions[i] = "任务 " + entry.identity.taskId + " · 恢复同一个应用任务";
            }
            closeDialog = ui.choiceDialog("恢复任务", names, descriptions, selected -> restoreShelvedTask(snapshot, snapshot.entries.get(selected)));
        }, null);
    }

    private void refreshAppearance() {
        if (transfer != null) transfer.refreshAppearance(ui);
        emptySideSlots = Math.max(0, Math.min(3, config.getInt(AtomicWorkbenchConfig.EMPTY_SIDE_SLOTS, 3)));
        requestedSideCount = Math.max(3, Math.min(6, config.getInt(AtomicWorkbenchConfig.SIDE_COUNT, 3)));
        sideCountPending = requestedSideCount != model.topology().sideIds().size();
        quickOpenApps = config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS);
        boolean closePicker = !quickOpenApps && appListRequested;
        if (closePicker) {
            appListRequested = false;
            hideHostKeyboard();
            // Hiding the quick entry must not create or refocus any app display. If an
            // existing main window was covered, its shield lets the user resume it by tap.
            nativeHomePending = false;
        }
        boolean visible = config.getBoolean(AtomicWorkbenchConfig.SHOW_MEDIA);
        if (visible != showMedia) {
            showMedia = visible; mediaEnabled = visible; stopMedia();
            mediaRetryRequired = false; mediaCard.setVisibility(visible ? View.VISIBLE : View.GONE);
        }
        renderWorkspace();
        scheduleMedia();
    }

    private boolean canPollMedia() {
        return active && !destroyed && mediaEnabled && !closing && !exitRequested && !recoveryPending && !waitingForCleanup
                && !ResetWriteFence.stale(launchGeneration);
    }

    private void stopMedia() {
        ++mediaGeneration; main.removeCallbacks(mediaPoll);
        if (notificationCards != null) { notificationCards.setActive(false); notificationCards.apply(null, notificationCards.beginUpdate()); }
        AtomicWorkbenchClient connected = client;
        if (connected != null) connected.stopNavigation();
        if (cardPager != null) applyNavigationState(null);
        lastMediaState = null; mediaAvailable = false; mediaSessionId = ""; updateMediaButtons();
    }

    private void scheduleMedia() {
        main.removeCallbacks(mediaPoll);
        if (notificationCards != null) notificationCards.setActive(canPollMedia());
        if (canPollMedia() && !mediaRetryRequired && !mediaBusy) {
            AtomicWorkbenchClient connected = client;
            if (connected != null) connected.resumeNavigation();
            main.postDelayed(mediaPoll, 1000L);
        }
    }

    private void pollMedia() {
        if (!canPollMedia() || mediaBusy || mediaRetryRequired) return;
        runMedia(null);
    }

    private void commandMedia(String command) {
        if (!canPollMedia() || mediaBusy || !mediaAvailable || mediaSessionId.isEmpty() || cardPager.page() != 0) return;
        if (lastMediaState == null || !lastMediaState.getBoolean("can_" + command, false)) return;
        runMedia(command);
    }

    private void runMedia(String command) {
        final long generation = mediaGeneration;
        final long session = sessionGeneration;
        final String sessionId = mediaSessionId;
        final long notificationUpdate = notificationCards == null ? -1 : notificationCards.beginUpdate();
        final String notificationPage=cardPager==null?"":cardPager.pageId();
        final String notificationSource=notificationPage.startsWith("notification:")?notificationPage.substring("notification:".length()):"";
        mediaBusy = true; updateMediaButtons(); main.removeCallbacks(mediaPoll);
        WORKER.execute(() -> {
            Bundle result = null, navigation = null, notifications = null; String problem = null; boolean cleanup = false;
            try {
                if (canPollMedia() && generation == mediaGeneration) {
                    if (client == null && connectionRetryRequired) throw new IllegalStateException("需要点按重试连接");
                    AtomicWorkbenchClient connected = ensureClient(session);
                    if (canPollMedia() && generation == mediaGeneration) {
                        result = command == null ? connected.mediaState() : connected.mediaCommand(command, sessionId);
                        if (canPollMedia() && generation == mediaGeneration) navigation = connected.navigationState();
                        if (canPollMedia() && generation == mediaGeneration)
                            try { notifications = connected.notificationStateWithActions(notificationSource); } catch (Exception unavailable) { /* Isolated notification failure leaves music and navigation intact. */ }
                    }
                }
            } catch (CleanupPending pending) { cleanup = true; }
            catch (Exception failed) { problem = "连接失败，点此重试"; }
            final Bundle response = result; final String failure = problem;
            final Bundle navigationResponse = navigation;
            final Bundle notificationResponse = notifications;
            final boolean pendingCleanup = cleanup;
            main.post(() -> {
                if (destroyed || session != sessionGeneration) return;
                mediaBusy = false;
                if (generation != mediaGeneration || !canPollMedia()) { scheduleMedia(); return; }
                if (notificationCards != null) notificationCards.apply(notificationResponse, notificationUpdate);
                if (pendingCleanup) { showCleanupPending(true); return; }
                else if (failure != null) {
                    applyNavigationState(null);
                    mediaRetryRequired = true; lastMediaState = null; mediaAvailable = false; mediaSessionId = "";
                    mediaTitle.setText("媒体连接不可用"); mediaSubtitle.setText(failure);
                    mediaArtwork.setImageDrawable(new GlassIcon("music", ui.muted));
                    mediaProgress.setVisibility(View.GONE);
                    mediaCard.setContentDescription("媒体连接不可用，点按重试"); updateMediaButtons();
                } else {
                    if (response != null) applyMediaState(response);
                    applyNavigationState(navigationResponse);
                }
                scheduleMedia();
            });
        });
    }

    private void applyMediaState(Bundle state) {
        lastMediaState = state;
        mediaAvailable = state.getBoolean("available", false) && state.getBoolean("has_session", false);
        mediaSessionId = mediaAvailable ? state.getString("session_id", "") : "";
        mediaPlaying = mediaAvailable && state.getBoolean("playing", false);
        String title = mediaAvailable ? state.getString("title", "") : "";
        mediaTitle.setText(!state.getBoolean("available", false) ? "媒体不可用" : !mediaAvailable ? "暂无媒体"
                : title.isEmpty() ? "正在播放的媒体" : title);
        String subtitle = mediaAvailable ? state.getString("subtitle", "") : "媒体控制会显示在这里";
        if (!state.getBoolean("success", true) || !state.getBoolean("available", false))
            subtitle = state.getString("message", "当前无法读取媒体");
        mediaSubtitle.setText(subtitle);
        boolean positionKnown = mediaAvailable && state.getBoolean("position_known", false);
        boolean durationKnown = mediaAvailable && state.getBoolean("duration_known", false);
        mediaProgress.setVisibility(positionKnown || durationKnown ? View.VISIBLE : View.GONE);
        mediaProgress.setText(mediaProgress.getContext().getString(R.string.status_atomicworkbenchactivity_1 ,String.valueOf((positionKnown ? mediaTime(state.getLong("position_ms", -1)) : "--:--")), String.valueOf((durationKnown ? mediaTime(state.getLong("duration_ms", -1)) : "--:--"))));
        boolean favorite = state.getBoolean("favorite_known", false) && state.getBoolean("favorite", false);
        mediaFavorite.setImageDrawable(new GlassIcon("heart", favorite ? ui.accent : ui.text));
        mediaFavorite.setSelected(favorite);
        mediaFavorite.setContentDescription(favorite ? "取消收藏" : state.getBoolean("favorite_known", false) ? "收藏" : "收藏状态未知");
        mediaArtwork.setContentDescription("选择媒体来源" + (state.getString("app_label", "").isEmpty() ? "" : "，当前" + state.getString("app_label", "")));
        Bitmap artwork = state.getParcelable("art");
        if (mediaAvailable && artwork != null) mediaArtwork.setImageBitmap(artwork);
        else mediaArtwork.setImageDrawable(new GlassIcon("music", ui.muted));
        mediaCard.setContentDescription(null);
        mediaPlay.setImageDrawable(new GlassIcon(mediaPlaying ? "pause" : "play", ui.text));
        mediaPlay.setContentDescription(mediaPlaying ? "暂停" : "播放"); mediaPlay.setTooltipText(mediaPlaying ? "暂停" : "播放");
        updateMediaButtons();
    }

    private void updateMediaButtons() {
        if (mediaPlay == null) return;
        boolean available = canPollMedia() && !mediaBusy && mediaAvailable && !mediaSessionId.isEmpty() && lastMediaState != null;
        mediaButton(mediaPrevious, available && lastMediaState.getBoolean("can_previous", false));
        mediaButton(mediaPlay, available && lastMediaState.getBoolean(mediaPlaying ? "can_pause" : "can_play", false));
        mediaButton(mediaNext, available && lastMediaState.getBoolean("can_next", false));
        mediaButton(mediaFavorite, available && lastMediaState.getBoolean("can_favorite", false) && lastMediaState.getBoolean("favorite_known", false));
        mediaArtwork.setEnabled(canPollMedia() && !mediaBusy && lastMediaState != null);
    }

    private static String mediaTime(long milliseconds) {
        if (milliseconds < 0) return "--:--";
        long seconds = milliseconds / 1000L;
        return seconds >= 3600 ? String.format(Locale.ROOT, "%d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60)
                : String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    private void showMediaSources() {
        if (!canPollMedia() || mediaBusy || lastMediaState == null) return;
        ArrayList<Bundle> sources = lastMediaState.getParcelableArrayList("sources");
        if (sources == null || sources.isEmpty()) { showStatus("暂无可用媒体来源。"); return; }
        final ArrayList<Bundle> frozen = new ArrayList<>();
        for (Bundle source : sources) if (source != null && frozen.size() < 64) frozen.add(new Bundle(source));
        String[] labels = new String[frozen.size()], descriptions = new String[frozen.size()];
        for (int i = 0; i < frozen.size(); i++) {
            Bundle source = frozen.get(i);
            labels[i] = source.getString("app_label", source.getString("package", "媒体来源"));
            descriptions[i] = (source.getBoolean("selected", false) ? "当前来源 · " : "")
                    + (source.getBoolean("playing", false) ? "正在播放" : "已连接");
        }
        ui.choiceDialog("媒体来源", labels, descriptions, index -> {
            if (index >= 0 && index < frozen.size()) runMediaAction("select_source", frozen.get(index).getString("source_id", ""), "");
        });
    }

    private void favoriteMedia() {
        if (lastMediaState == null || !lastMediaState.getBoolean("can_favorite", false) || !lastMediaState.getBoolean("favorite_known", false)) return;
        runMediaAction(lastMediaState.getBoolean("favorite", false) ? "favorite_off" : "favorite_on",
                lastMediaState.getString("source_id", ""), lastMediaState.getString("track_id", ""));
    }

    private void openMediaSource() {
        if (lastMediaState == null || cardPager.page() != 0 || !lastMediaState.getBoolean("can_open_source", false)) return;
        if (!canInteract()) { showStatus("工作台画面正在准备，请稍后打开媒体来源。"); return; }
        runMediaAction("describe_open", lastMediaState.getString("source_id", ""), "");
    }

    private void runMediaAction(String action, String sourceId, String trackId) {
        if (!canPollMedia() || mediaBusy || client == null) return;
        final long generation = mediaGeneration, session = sessionGeneration;
        final long entryGeneration = presentationPolicy.entryGeneration();
        final AtomicWorkbenchClient connected = client;
        final Bundle metadata = new Bundle();
        long created = SystemClock.elapsedRealtime();
        metadata.putInt("schema", 1); metadata.putString("request_id", java.util.UUID.randomUUID().toString().replace("-", ""));
        metadata.putString("source_id", sourceId); metadata.putString("track_id", trackId);
        metadata.putLong("created_elapsed", created); metadata.putLong("deadline_elapsed", Math.addExact(created, 5000L));
        mediaBusy = true; updateMediaButtons(); main.removeCallbacks(mediaPoll);
        WORKER.execute(() -> {
            Bundle result;
            try { result = canPollMedia() && generation == mediaGeneration && connected == client
                    ? connected.mediaAction(action, metadata) : failure("媒体来源已变化，请重新选择。"); }
            catch (Exception unavailable) { result = failure("媒体操作结果尚未确认，请在来源应用中核对后再操作。"); }
            if ("describe_open".equals(action) && result.getBoolean("success", false) && !mediaOpenDescriptorCurrent(result, sourceId)) {
                result.putBoolean("success", false); result.putString("message", "媒体来源入口已变化，请重新选择来源。");
            }
            Bundle response = result;
            main.post(() -> {
                if (destroyed || session != sessionGeneration || connected != client) return;
                mediaBusy = false;
                if (generation != mediaGeneration || !canPollMedia()) { scheduleMedia(); return; }
                if (response.containsKey("available")) applyMediaState(response);
                if (!response.getBoolean("success", false)) showStatus(response.getString("message", "媒体操作未确认，请在来源应用中核对。"));
                else if ("describe_open".equals(action)) {
                    if (entryGeneration != presentationPolicy.entryGeneration()) {
                        showStatus("工作区入口已变化，请重新点按媒体来源。"); scheduleMedia(); return;
                    }
                    String component = response.getString("open_component", "");
                    AtomicWorkbenchAppRepository.App app = findApp(component);
                    if (app != null && app.component.getPackageName().equals(response.getString("open_package", ""))
                            && response.getInt("open_user_id", -1) == android.os.Process.myUid() / 100000
                            && response.getLong("open_deadline_elapsed", -1) > SystemClock.elapsedRealtime()) {
                        if (canInteract()) launchApp(app, -1, null, AtomicWorkbenchMediaOpenRequest.fromDescriptor(response));
                        else showStatus("工作台状态已变化，请重新点按打开媒体来源。");
                    }
                    else showStatus("未找到可用的媒体来源入口，请从手机应用列表打开。");
                } else if ("favorite_on".equals(action) || "favorite_off".equals(action))
                    showStatus(response.getString("message", "已发送收藏请求，请以播放器实际状态为准。"));
                updateMediaButtons(); scheduleMedia();
            });
        });
    }

    private boolean mediaOpenDescriptorCurrent(Bundle state, String sourceId) {
        try {
            if (!sourceId.equals(state.getString("open_source_id", ""))
                    || state.getLong("open_deadline_elapsed", -1) <= SystemClock.elapsedRealtime()
                    || state.getInt("open_user_id", -1) != android.os.Process.myUid() / 100000) return false;
            ComponentName component = ComponentName.unflattenFromString(state.getString("open_component", ""));
            if (component == null || !component.getPackageName().equals(state.getString("open_package", ""))) return false;
            android.content.pm.ActivityInfo info = getPackageManager().getActivityInfo(component, 0);
            return AtomicWorkbenchAppRepository.allowed(info, getPackageName())
                    && info.applicationInfo.uid == state.getInt("open_owner_uid", -1);
        } catch (android.content.pm.PackageManager.NameNotFoundException | RuntimeException unavailable) { return false; }
    }

    private void mediaButton(ImageButton button, boolean enabled) { button.setEnabled(enabled); button.setAlpha(enabled ? 1f : .35f); }

    private void createDesktop() {
        desktop = new LinearLayout(this);
        desktop.setTag("atomic-workbench-desktop");
        desktop.setOrientation(LinearLayout.VERTICAL);
        desktop.setFocusableInTouchMode(true);
        desktop.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(4));
        desktop.setBackground(ui.round(ui.card, ui.surfaceRadiusDp(22)));
        search = new EditText(this);
        search.setTag("atomic-workbench-search"); search.setSingleLine(true); search.setHint("搜索本机应用");
        ui.styleInput(search);
        desktop.addView(search, new LinearLayout.LayoutParams(-1, -2));
        desktopState = ui.text("本机应用", 11, ui.muted, false);
        desktopState.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(4));
        desktop.addView(desktopState, new LinearLayout.LayoutParams(-1, -2));
        appGrid = new GridLayout(this);
        appGrid.setTag("atomic-workbench-app-grid"); appGrid.setColumnCount(3);
        desktop.addView(appGrid, new LinearLayout.LayoutParams(-1, 0, 1));
        appGrid.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> {
            int rows = Math.max(2, Math.min(5, (b - t) / Math.max(1, ui.dp(84))));
            if (rows != gridRows) { gridRows = rows; page = 0; renderDesktop(); }
        });
        LinearLayout pages = new LinearLayout(this); pages.setGravity(Gravity.CENTER_VERTICAL);
        previousPage = tool("上一页", "atomic-workbench-page-previous", () -> { page--; renderDesktop(); });
        nextPage = tool("下一页", "atomic-workbench-page-next", () -> { page++; renderDesktop(); });
        pages.addView(previousPage, new LinearLayout.LayoutParams(0, -2, 1));
        pageLabel = ui.text("1 / 1", 12, ui.muted, false); pageLabel.setGravity(Gravity.CENTER);
        pages.addView(pageLabel, new LinearLayout.LayoutParams(ui.dp(52), -2));
        pages.addView(nextPage, new LinearLayout.LayoutParams(0, -2, 1));
        desktop.addView(pages, new LinearLayout.LayoutParams(-1, -2));
        search.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence value, int start, int count, int after) { }
            public void onTextChanged(CharSequence value, int start, int before, int count) { page = 0; renderDesktop(); }
            public void afterTextChanged(Editable value) { }
        });
    }

    private AtomicWorkbenchAppListModel.State appPreferencesState=new AtomicWorkbenchAppListModel.State(android.os.Process.myUid()/100000);
    private AtomicWorkbenchAppListModel.Usage appUsage=AtomicWorkbenchAppListModel.Usage.unavailable("");
    private boolean appLoadQueued,appReloadPending,appPackagesRegistered;
    private long appCatalogRevision;
    private final android.content.BroadcastReceiver appPackages=new android.content.BroadcastReceiver(){
        @Override public void onReceive(android.content.Context context,Intent intent){loadApps();}
    };
    private void loadApps() {
        if(destroyed)return;
        if(appLoadQueued){appReloadPending=true;return;}
        appLoadQueued=true;
        final long generation=launchGeneration;
        final AtomicWorkbenchAppListModel.State previousPreferences=appPreferencesState;
        APP_READER.execute(() -> {
            ArrayList<AtomicWorkbenchAppRepository.App> found;
            String error = null;
            try { found = AtomicWorkbenchAppRepository.load(getApplicationContext()); }
            catch (RuntimeException failed) { found = new ArrayList<>(); error = "无法读取本机应用，请退出后重试。"; }
            AtomicWorkbenchAppPreferences.Result preference=new AtomicWorkbenchAppPreferences(getApplicationContext()).read();
            AtomicWorkbenchAppListModel.State selected=preference.success?preference.state:previousPreferences;
            AtomicWorkbenchAppListModel.Usage stats=AtomicWorkbenchAppUsage.read(getApplicationContext(),selected.mode);
            ArrayList<AtomicWorkbenchAppRepository.App> result = found;
            String failure = error!=null?error:!preference.success?preference.message:
                    selected.mode==AtomicWorkbenchAppListModel.USAGE&&!stats.available?stats.message:null;
            main.post(() -> {
                appLoadQueued=false;
                if (destroyed || generation!=launchGeneration || ResetWriteFence.stale(generation)) return;
                appPreferencesState=selected;appUsage=stats;appCatalogRevision++;
                apps.clear(); apps.addAll(result); appsLoaded = true;
                renderStrip(); renderDesktop();
                if (failure != null || (!closing && !recoveryPending && !busy))
                    showStatus(failure == null ? entryProblemText : failure);
                tryIncoming();
                if(appReloadPending){appReloadPending=false;loadApps();}
            });
        });
    }

    private View appTile(AtomicWorkbenchAppRepository.App app, boolean compact) {
        LinearLayout tile = new LinearLayout(this);
        tile.setOrientation(LinearLayout.VERTICAL); tile.setGravity(Gravity.CENTER);
        tile.setPadding(ui.dp(3), ui.dp(4), ui.dp(3), ui.dp(4));
        boolean running = findRunningApp(app) >= 0;
        tile.setBackground(ui.round(running ? ui.accentContainer : ui.card, ui.surfaceRadiusDp(14)));
        tile.setContentDescription(app.label + (running ? "，已在工作台，点按切换" : "，打开应用") + "，长按拖到指定窗口");
        tile.setTooltipText(app.label + " · 长按拖到指定窗口"); tile.setMinimumWidth(ui.dp(48)); tile.setMinimumHeight(ui.dp(48));
        tile.setTag((compact ? "atomic-workbench-quick-app:" : "atomic-workbench-picker-app:") + app.key());
        ImageView icon = new ImageView(this);
        if (app.icon != null) {
            Drawable.ConstantState copy = app.icon.getConstantState();
            icon.setImageDrawable(copy == null ? app.icon : copy.newDrawable(getResources()));
        } else { icon.setImageResource(R.drawable.ice_app_window); icon.setColorFilter(ui.accent); }
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        tile.addView(icon, new LinearLayout.LayoutParams(ui.dp(38), ui.dp(38)));
        tile.setOnClickListener(view -> openQuickApp(app));
        tile.setOnLongClickListener(view -> {
            if (!canInteract() || !quickOpenApps || !apps.contains(app) || appPlacementDrag != null) return false;
            AppPlacementDrag drag = new AppPlacementDrag(app);
            appPlacementDrag = drag;
            view.setOnDragListener((source, event) -> {
                if (event.getAction() == DragEvent.ACTION_DRAG_ENDED) {
                    onAppPlacementDrag(-1, event);
                    transfer.bindDropTarget(source, () -> app.component.getPackageName());
                }
                return event.getLocalState() == drag && event.getAction() != DragEvent.ACTION_DROP;
            });
            android.content.ClipData clip = new android.content.ClipData("工作区应用",
                    new String[]{APP_PLACEMENT_MIME}, new android.content.ClipData.Item(""));
            boolean started = view.startDragAndDrop(clip, new View.DragShadowBuilder(view), drag, 0);
            if (!started) { appPlacementDrag = null; transfer.bindDropTarget(view, () -> app.component.getPackageName()); }
            else {
                hostDragActive = true; cancelGesture(); invalidateExtractionGeometry();
                main.postDelayed(() -> {
                    if (appPlacementDrag == drag) {
                        drag.ended = true; appPlacementDrag = null; hostDragActive = false;
                        view.cancelDragAndDrop();
                        for (Slot slot : slots) slot.clearDropHover();
                    }
                }, 30_000);
            }
            return started;
        });
        transfer.bindDropTarget(tile, () -> app.component.getPackageName());
        if (compact) return tile;
        TextView label = ui.text(app.label, 11, running ? ui.accent : ui.text, running);
        label.setGravity(Gravity.CENTER); label.setMaxLines(2); label.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams name = new LinearLayout.LayoutParams(-1, -2); name.topMargin = ui.dp(4);
        tile.addView(label, name); return tile;
    }

    private void openQuickApp(AtomicWorkbenchAppRepository.App app) {
        // This also rejects clicks delivered through a detached tile after the row is hidden.
        if (!quickOpenApps || !config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS)) return;
        if(!apps.contains(app)||!appPreferencesState.entry(app.key()).visible){showStatus("应用入口已变化，请重新选择。");loadApps();return;}
        openAppOrShelvedTask(app);
    }

    /** Query references before launching: restoring an existing Task never falls through to an Intent. */
    private void openAppOrShelvedTask(AtomicWorkbenchAppRepository.App app) {
        if (!canInteract() || app == null) return;
        if (findRunningApp(app) >= 0 || client == null) { launchApp(app, -1); return; }
        readTaskSnapshot(snapshot -> {
            ArrayList<AtomicWorkbenchTaskUiSnapshot.Entry> matches = new ArrayList<>();
            for (AtomicWorkbenchTaskUiSnapshot.Entry entry : snapshot.entries) {
                ComponentName base = ComponentName.unflattenFromString(entry.identity.baseComponent);
                if (base != null && base.getPackageName().equals(app.component.getPackageName())) matches.add(entry);
            }
            if (matches.isEmpty()) { launchApp(app, -1); return; }
            String[] names = new String[matches.size() + 1], descriptions = new String[names.length];
            for (int i = 0; i < matches.size(); i++) {
                names[i] = "恢复" + app.label + " · 任务 " + matches.get(i).identity.taskId;
                descriptions[i] = "继续此前暂存或移出的同一个任务";
            }
            names[matches.size()] = "新开应用"; descriptions[matches.size()] = "使用应用自身的启动方式";
            closeDialog = ui.choiceDialog(app.label, names, descriptions, selected -> {
                if (selected == matches.size()) launchApp(app, -1);
                else restoreShelvedTask(snapshot, matches.get(selected));
            });
        }, () -> {
            // An unavailable shelf cannot prove that an old Task is absent.
            closeDialog = ui.glassDialog(app.label, "暂存任务状态尚未确认。可稍后重试，或明确新开应用。",
                    "新开应用", () -> launchApp(app, -1), "取消");
        });
    }

    private void readTaskSnapshot(java.util.function.Consumer<AtomicWorkbenchTaskUiSnapshot> ready, Runnable unavailable) {
        if (!canInteract() || client == null) return;
        AtomicWorkbenchClient connected = client; final long session = sessionGeneration; final int request = ++epoch;
        final long entryGeneration = presentationPolicy.entryGeneration();
        busy = true; cancelGesture(); invalidateExtractionGeometry();
        WORKER.execute(() -> {
            AtomicWorkbenchTaskUiSnapshot snapshot = null;
            String stage = "READ";
            try {
                if (mutationAllowed(request)) {
                    Bundle state = connected.taskShelfState();
                    stage = "DTO";
                    snapshot = new AtomicWorkbenchTaskUiSnapshot(state, AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
                }
            } catch (Exception invalid) {
                // Keep the same unknown branch; observation neither retries nor validates again.
                try {
                    long now = System.nanoTime();
                    if (taskSnapshotDiagnosticLast != 0 && now - taskSnapshotDiagnosticLast < 3_000_000_000L
                            || !TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.compareAndSet(false, true)) taskSnapshotDiagnosticSuppressed++;
                    else {
                        taskSnapshotDiagnosticLast = now;
                        long suppressed = taskSnapshotDiagnosticSuppressed; taskSnapshotDiagnosticSuppressed = 0;
                        final String detail = "owner_id=TASK_C13_UI_01;diag_abi=1;stage=" + stage + ";success=false;suppressed=" + suppressed;
                        final long generation = launchGeneration;
                        final android.content.Context diagnosticContext = getApplicationContext();
                        final int diagnosticUser = android.os.Process.myUid() / 100000;
                        APP_READER.execute(() -> {
                            try { AtomicWorkbenchDiagnostics.record(diagnosticContext, generation,
                                    "ATOMIC_TASK_UI_SNAPSHOT", -1, diagnosticUser, "", -1, detail, invalid); }
                            catch (Throwable ignored) { }
                            finally { TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.set(false); }
                        });
                    }
                } catch (Throwable ignored) { TASK_SNAPSHOT_DIAGNOSTIC_QUEUED.set(false); taskSnapshotDiagnosticSuppressed++; }
            }
            AtomicWorkbenchTaskUiSnapshot response = snapshot;
            final long observedElapsed = SystemClock.elapsedRealtime();
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || !active || closing || request != epoch || session != sessionGeneration || connected != client) return;
                busy = false;
                if (entryGeneration != presentationPolicy.entryGeneration()) {
                    showStatus("工作区入口已变化，原任务已保留。"); renderWorkspace(); schedulePoll(); tryIncoming(); return;
                }
                if (response == null) { showStatus("任务状态尚未确认，原任务已保留。"); if (unavailable != null) unavailable.run(); }
                else { lastTaskSnapshot = response; taskSnapshotElapsed = observedElapsed; ready.accept(response); }
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private void showWindowTaskMenu(int id) {
        if (!canInteract() || !model.hasWindow(id) || id == model.mainWindowId()) return;
        final long revision = model.revision(), session = sessionGeneration;
        closeDialog = ui.choiceDialog("窗口操作", new String[]{"切换为主窗口", "暂存任务", "移出工作台", "结束任务…", "关闭并恢复整个窗口"},
                new String[]{"保留原任务，将此窗口与主窗口交换", "保留同一个任务，之后可恢复到工作区", "移回手机后台，保留任务运行", "仅结束选中的任务，需再次确认", "关闭此窗口，将其中任务移回手机屏幕"}, selected -> {
                    if (revision != model.revision() || session != sessionGeneration || !canInteract()) return;
                    if (selected == 0) focusWindow(id);
                    else if (selected == 4) confirmCloseWindow(id);
                    else chooseWindowTask(id, selected == 1 ? AtomicWorkbenchTaskOperationRequest.Action.SHELVE
                            : selected == 2 ? AtomicWorkbenchTaskOperationRequest.Action.MOVE_OUT : AtomicWorkbenchTaskOperationRequest.Action.END_TASK);
                });
    }

    private void confirmCloseWindow(int id) {
        closeDialog = ui.glassDialog("关闭窗口", "关闭这个工作区窗口，并将其中任务移回手机屏幕。其他窗口继续保留。",
                "关闭并恢复", () -> requestCloseWindow(id), "取消");
    }

    private void chooseWindowTask(int id, AtomicWorkbenchTaskOperationRequest.Action action) {
        if (pendingTaskOperation != null) { queryPendingTaskOperation(); return; }
        if (!canInteract() || client == null || !model.hasWindow(id)) return;
        Slot captured = slots[id]; int display = captured.displayId;
        String unique = captured.displayUniqueId, windowSession = captured.windowSession;
        readTaskSnapshot(snapshot -> {
            AtomicWorkbenchTaskUiSnapshot.Window window = snapshot.window(id);
            if (window == null || !window.matches(display, unique, windowSession) || window.tasks.isEmpty()) {
                showStatus("此窗口没有可操作的应用任务，或任务已变化。"); return;
            }
            selectTaskInWindow(window, action);
        }, null);
    }

    private void selectTaskInWindow(AtomicWorkbenchTaskUiSnapshot.Window window, AtomicWorkbenchTaskOperationRequest.Action action) {
            java.util.function.Consumer<AtomicWorkbenchTaskIdentity> selected = task -> {
                if (action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK)
                    closeDialog = ui.glassDialog("结束" + taskLabel(task), "结束选中的任务 " + task.taskId + "。此任务中的未保存内容可能丢失。",
                            "结束任务", () -> performTaskAction(window, task, action, AtomicWorkbenchTaskUiSnapshot.nonce()), "取消");
                else performTaskAction(window, task, action, "");
            };
            if (window.tasks.size() == 1) selected.accept(window.tasks.get(0));
            else {
                String[] names = new String[window.tasks.size()], descriptions = new String[names.length];
                for (int i = 0; i < names.length; i++) { AtomicWorkbenchTaskIdentity task = window.tasks.get(i);
                    names[i] = taskLabel(task); descriptions[i] = "任务 " + task.taskId + " · 仅操作此任务"; }
                closeDialog = ui.choiceDialog("选择应用任务", names, descriptions, i -> selected.accept(window.tasks.get(i)));
            }
    }

    private String taskLabel(AtomicWorkbenchTaskIdentity identity) {
        AtomicWorkbenchAppRepository.App app = findDisplayApp(identity.realComponent);
        if (app == null) app = findDisplayApp(identity.baseComponent);
        return app == null ? ComponentName.unflattenFromString(identity.baseComponent).getPackageName() : app.label;
    }

    private void performTaskAction(AtomicWorkbenchTaskUiSnapshot.Window window, AtomicWorkbenchTaskIdentity task,
            AtomicWorkbenchTaskOperationRequest.Action action, String confirmation) {
        if (!canInteract() || client == null || pendingTaskOperation != null) return;
        beginTaskMutation(connected -> {
            AtomicWorkbenchTaskUiSnapshot fresh = new AtomicWorkbenchTaskUiSnapshot(connected.taskShelfState(), AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8);
            return fresh.action(window, task, action, SystemClock.elapsedRealtime(), confirmation);
        }, -1);
    }

    private void restoreShelvedTask(AtomicWorkbenchTaskUiSnapshot snapshot, AtomicWorkbenchTaskUiSnapshot.Entry entry) {
        if (!canInteract() || client == null || pendingTaskOperation != null) return;
        int receiver = -1;
        int[] order = presentationOrder(false);
        for (int id : order) {
            AtomicWorkbenchTaskUiSnapshot.Window window = snapshot.window(id);
            if (window != null && window.tasks.isEmpty() && window.matches(slots[id].displayId, slots[id].displayUniqueId, slots[id].windowSession)) { receiver = id; break; }
        }
        if (receiver >= 0) {
            AtomicWorkbenchTaskUiSnapshot.Window target = snapshot.window(receiver);
            beginTaskMutation(connected -> new AtomicWorkbenchTaskUiSnapshot(connected.taskShelfState(), AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
                    .restore(entry, target, SystemClock.elapsedRealtime()), receiver);
            return;
        }
        for (int id : order) if (!model.hasWindow(id) && !pendingHomeSurfaces[id]) { receiver = id; break; }
        if (receiver < 0) { showStatus("当前可用工作区已占用，请先暂存一个任务或关闭并恢复窗口。"); return; }
        allocateTaskReceiver(receiver, entry);
    }

    private void allocateTaskReceiver(int id, AtomicWorkbenchTaskUiSnapshot.Entry entry) {
        if (!canInteract() || client == null || model.hasWindow(id)) return;
        Slot slot = slots[id];
        try { slot.surface.getHolder().setFixedSize(slot.displayWidth, slot.displayHeight); }
        catch (RuntimeException unavailable) { showStatus("接收窗口的显示缓冲尚未就绪，请稍后重试。"); return; }
        android.view.Surface output = slot.surface.getHolder().getSurface();
        if (output == null || !output.isValid()) { showStatus("接收窗口的画面尚未就绪，请稍后重试。"); return; }
        final AtomicWorkbenchClient connected = client; final int request = ++epoch;
        final long session = sessionGeneration, generation = ++outputSequence;
        final String allocation = AtomicWorkbenchTaskUiSnapshot.nonce();
        busy = true; pendingHomeSurfaces[id] = true; pendingTaskAllocations[id] = allocation;
        cancelGesture(); invalidateExtractionGeometry();
        WORKER.execute(() -> {
            Bundle result;
            try { result = mutationAllowed(request) ? connected.allocateTaskDisplay(id, output, displayWidth, displayHeight, density, generation, allocation)
                    : failure("工作区已离开，未分配接收窗口。"); }
            catch (Exception unknown) { result = failure("接收窗口分配结果尚未确认。原任务已保留，请等待状态核对。"); result.putBoolean("operation_unconfirmed", true); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || !active || closing || request != epoch || session != sessionGeneration || connected != client) return;
                busy = false;
                if (response.getInt("display_id", -1) > 0 && allocation.equals(response.getString("allocation_id"))) {
                    model.setHostedWindow(id, true); pendingHomeSurfaces[id] = false; pendingTaskAllocations[id] = null; applyWindowStatus(id, response);
                } else if (!response.getBoolean("operation_unconfirmed", false) && response.containsKey("display_id") && response.getInt("display_id", -1) <= 0) {
                    pendingHomeSurfaces[id] = false; pendingTaskAllocations[id] = null;
                }
                if (response.getBoolean("success", false) && response.getBoolean("retained_empty_task_display", false)
                        && allocation.equals(response.getString("allocation_id"))) {
                    readTaskSnapshot(fresh -> {
                        AtomicWorkbenchTaskUiSnapshot.Window target = fresh.window(id);
                        if (target == null || !target.matches(slot.displayId, slot.displayUniqueId, slot.windowSession) || !target.tasks.isEmpty()) {
                            showStatus("接收窗口已变化，暂存任务保持原状。"); return;
                        }
                        beginTaskMutation(current -> new AtomicWorkbenchTaskUiSnapshot(current.taskShelfState(), AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8)
                                .restore(entry, target, SystemClock.elapsedRealtime()), id);
                    }, null);
                } else showStatus(response.getString("message", "接收窗口尚未确认，暂存任务保持原状。"));
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private interface TaskRequestFactory { AtomicWorkbenchTaskOperationRequest create(AtomicWorkbenchClient connected) throws Exception; }
    private void beginTaskMutation(TaskRequestFactory factory, int restoreTarget) {
        if (!canInteract() || client == null || pendingTaskOperation != null) return;
        AtomicWorkbenchClient connected = client; final long session = sessionGeneration; final int request = ++epoch;
        if (restoreTarget >= 0) taskPresentationReceipt = presentationPolicy.begin(restoreTarget, session, request,
                presentationRoles(), presentationLease(restoreTarget));
        else { presentationPolicy.invalidate(); taskPresentationReceipt = null; }
        busy = true; cancelGesture(); invalidateExtractionGeometry();
        WORKER.execute(() -> {
            AtomicWorkbenchTaskOperationRequest sent = null; Bundle result;
            try {
                if (!mutationAllowed(request)) throw new IllegalStateException();
                sent = factory.create(connected);
                if (!mutationAllowed(request)) { sent = null; throw new IllegalStateException(); }
                // The request is frozen once. No exception path may issue CHANGE again.
                result = connected.changeTask(sent.toBundle());
            } catch (Exception unavailable) { result = failure(sent == null ? "任务已变化或状态不可用，请重新选择。" : "任务操作结果尚未确认，正在核对原操作。"); }
            AtomicWorkbenchTaskOperationRequest submitted = sent; Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || !active || closing || request != epoch || session != sessionGeneration || connected != client) return;
                busy = false;
                if (submitted != null) { pendingTaskOperation = submitted; acceptTaskReply(response, submitted, restoreTarget); }
                else { presentationPolicy.cancel(taskPresentationReceipt); taskPresentationReceipt = null; showStatus(response.getString("message")); }
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private void acceptTaskReply(Bundle response, AtomicWorkbenchTaskOperationRequest sent, int restoreTarget) {
        try {
            AtomicWorkbenchTaskOperationResult result = AtomicWorkbenchTaskOperationResult.fromBundle(response, sent);
            if (result.success) {
                pendingTaskOperation = null;
                if (sent.action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE && restoreTarget >= 0) {
                    Slot receiver = slots[restoreTarget];
                    if (!model.hasWindow(restoreTarget) || receiver.displayId != sent.targetDisplayId
                            || !receiver.displayName.equals(sent.targetDisplayName) || !receiver.displayUniqueId.equals(sent.targetDisplayUnique)
                            || !receiver.windowSession.equals(sent.targetWindowSession)) {
                        presentationPolicy.cancel(taskPresentationReceipt); taskPresentationReceipt = null;
                        showStatus("原任务恢复已核对，工作区已变化，请以当前窗口为准。"); return;
                    }
                    if (!presentationPolicy.eligible(taskPresentationReceipt, sessionGeneration, presentationRoles())
                            || taskPresentationReceipt.lease == null || !taskPresentationReceipt.lease.equals(presentationLease(restoreTarget))) {
                        presentationPolicy.cancel(taskPresentationReceipt); taskPresentationReceipt = null;
                        showStatus("原任务恢复已核对，工作区已变化，请以当前窗口为准。"); return;
                    }
                    model.setHostedWindow(restoreTarget, true); model.promote(restoreTarget);
                    pendingPresentationFocus = proposalPresentation(taskPresentationReceipt); taskPresentationReceipt = null;
                    appListRequested = false; focusedWindow = -2;
                }
                showStatus(sent.action == AtomicWorkbenchTaskOperationRequest.Action.SHELVE ? "任务已暂存，点应用可恢复。"
                        : sent.action == AtomicWorkbenchTaskOperationRequest.Action.MOVE_OUT ? "任务已移回手机后台。"
                        : sent.action == AtomicWorkbenchTaskOperationRequest.Action.END_TASK ? "选中的任务已结束。" : "原任务已恢复，正在确认画面。");
            } else if (!result.cleanupPending && (result.status == AtomicWorkbenchTaskOperationResult.Status.REJECTED
                    || result.status == AtomicWorkbenchTaskOperationResult.Status.CANCELLED || result.status == AtomicWorkbenchTaskOperationResult.Status.STALE)) {
                pendingTaskOperation = null; showStatus("任务已变化或操作未执行，原任务状态已保留。请重新选择。");
                presentationPolicy.cancel(taskPresentationReceipt); taskPresentationReceipt = null;
            } else showStatus("任务操作结果尚未确认，原任务和窗口已保留。点此核对。");
        } catch (RuntimeException unknown) { showStatus("任务操作结果尚未确认，原任务和窗口已保留。点此核对。"); }
    }

    private void queryPendingTaskOperation() {
        AtomicWorkbenchTaskOperationRequest pending = pendingTaskOperation; AtomicWorkbenchClient connected = client;
        if (pending == null || connected == null || taskQueryPending || !active || destroyed || closing) return;
        final long session = sessionGeneration; taskQueryPending = true;
        WORKER.execute(() -> {
            Bundle result;
            try { result = connected.taskOperationState(pending.operationId); }
            catch (Exception unknown) { result = failure("任务操作结果尚未确认，原任务已保留。"); }
            Bundle response = result;
            main.post(() -> {
                if (destroyed || session != sessionGeneration || connected != client) return;
                taskQueryPending = false;
                if (pendingTaskOperation != pending || !active || closing) return;
                acceptTaskReply(response, pending, pending.action == AtomicWorkbenchTaskOperationRequest.Action.RESTORE ? pending.targetSlot : -1);
                renderWorkspace(); schedulePoll();
            });
        });
    }

    private String transferPackage(int id) {
        if (!model.hasWindow(id)) return null;
        Slot slot = slots[id];
        if (!slot.nativeHome && !slot.topComponent.isEmpty()) {
            ComponentName top = ComponentName.unflattenFromString(slot.topComponent);
            return top != null && AtomicWorkbenchTransferPolicy.validPackage(top.getPackageName()) ? top.getPackageName() : null;
        }
        AtomicWorkbenchAppRepository.App app = findDisplayApp(slot.topComponent);
        if (app == null && !slot.nativeHome) app = findApp(model.component(id));
        return app == null ? null : app.component.getPackageName();
    }

    private boolean workspaceDropReady(int id) {
        Slot slot = slots[id];
        return canInteract() && client != null && model.hasWindow(id) && slot.ready && !slot.nativeHome
                && slot.targetUid >= 10000 && slot.targetTaskId >= 0 && !slot.displayName.isEmpty()
                && !slot.displayUniqueId.isEmpty() && transferPackage(id) != null;
    }

    private boolean onWorkspaceDrag(int id, View view, DragEvent event) {
        if (event.getLocalState() instanceof AtomicWorkbenchActivity.AppPlacementDrag)
            return onAppPlacementDrag(id, event);
        Slot slot = slots[id];
        int action = event.getAction();
        if (action == DragEvent.ACTION_DRAG_EXITED || action == DragEvent.ACTION_DRAG_ENDED || action == DragEvent.ACTION_DROP)
            slot.clearDropHover();
        AtomicWorkbenchTransfer.DeliverySnapshot payload = transfer.snapshotForDrop(event);
        if (action == DragEvent.ACTION_DRAG_ENDED || action == DragEvent.ACTION_DRAG_EXITED) return true;
        if (payload == null) {
            // An unadapted native source never becomes an import/share request. No ClipData body or URI is read.
            if (!workspaceDropReady(id) || event.getClipDescription() == null) return false;
            if (action == DragEvent.ACTION_DROP) { showStatus(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED); return false; }
            if (action == DragEvent.ACTION_DRAG_ENTERED || action == DragEvent.ACTION_DRAG_LOCATION) {
                slot.showDropHover(false); slot.frame.setContentDescription(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED);
            }
            return action == DragEvent.ACTION_DRAG_STARTED || action == DragEvent.ACTION_DRAG_ENTERED || action == DragEvent.ACTION_DRAG_LOCATION;
        }
        if (payload == null || !workspaceDropReady(id) || !(payload.textReady || payload.hasFiles && payload.ready)) return false;
        if (action == DragEvent.ACTION_DRAG_STARTED) return true;
        if (action == DragEvent.ACTION_DRAG_ENTERED || action == DragEvent.ACTION_DRAG_LOCATION) {
            slot.showDropHover(payload.hasFiles); return true;
        }
        if (action != DragEvent.ACTION_DROP) return false;
        final boolean browser = AtomicWorkbenchBrowserSearch.browser(this, transferPackage(id), slot.targetUid);
        if (browser && AtomicWorkbenchDragDeliveryPolicy.browser(
                payload.hasFiles ? AtomicWorkbenchDragDeliveryPolicy.Kind.FILE : AtomicWorkbenchDragDeliveryPolicy.Kind.TEXT,
                payload.textReady && AtomicWorkbenchBrowserSearch.textReceiver(this, transferPackage(id), slot.targetUid) != null,
                false) != AtomicWorkbenchDragDeliveryPolicy.Action.TEXT_SEARCH) {
            showStatus(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED); return false;
        }
        final boolean publicReceive = !browser && transfer.acceptsDrop(payload, transferPackage(id), slot.targetUid);
        if (payload.hasFiles && !publicReceive) {
            showStatus(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED); return false;
        }
        if (!browser && !payload.hasFiles && !publicReceive && !AtomicWorkbenchPasteService.available()) {
            if (!transfer.requestExtractedTextPasteSetup(event)) showPasteSetup();
            return false;
        }
        final AtomicWorkbenchDeliveryTarget target;
        try {
            target = new AtomicWorkbenchDeliveryTarget(client.inputSession(), launchGeneration, epoch,
                    id, slot.displayId, slot.displayName, slot.displayUniqueId,
                    android.os.Process.myUid() / 100000, android.os.Process.myUid(), slot.targetUid,
                    slot.targetTaskId, transferPackage(id), payload.payloadId, payload.revision, SystemClock.elapsedRealtime());
        } catch (IllegalArgumentException invalid) { showStatus("目标窗口尚未确认，素材已保留，请重新拖动。"); return false; }
        return transfer.consumeDrop(event, payload, sourceOwnedInput -> {
            cancelGesture();
            if (browser) dispatchExactSearch(target, payload.text);
            else if (payload.hasFiles || !AtomicWorkbenchPasteService.available())
                transfer.shareSnapshot(payload, target.packageName, intent -> dispatchExactShare(client, target, intent));
            else pasteIntoWindow(target, payload.text, sourceOwnedInput);
        });
    }

    private void dispatchExactSearch(AtomicWorkbenchDeliveryTarget target, String text) {
        AtomicWorkbenchClient connected = client;
        if (!canInteract() || !deliveryCurrent(connected, target)) { showStatus("目标窗口已变化，请重新拖动。"); return; }
        Intent search;
        try { search = AtomicWorkbenchBrowserSearch.textIntent(this, target.packageName, target.targetUid, text); }
        catch (IllegalArgumentException rejected) { showStatus(AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED); return; }
        cancelGesture(); busy = true; final int request = epoch;
        showStatus("正在目标浏览器中搜索…"); renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try { result = mutationAllowed(request) && connected == client ? connected.shareExact(target, search) : failure("工作区已离开，未发起搜索。"); }
            catch (Exception unavailable) { result = failure("搜索结果尚未确认，请检查目标浏览器。未自动重试。"); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (connected != client || request != epoch || !active || destroyed || closing) return;
                busy = false;
                if (response.containsKey("display_id")) applyWindowStatus(target.windowId, response);
                focusedWindow = response.getInt("focused_window_id", -2);
                showStatus(response.getString("message", AtomicWorkbenchDragDeliveryPolicy.UNSUPPORTED));
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private boolean onAppPlacementDrag(int id, DragEvent event) {
        AppPlacementDrag drag = (AppPlacementDrag) event.getLocalState();
        int action = event.getAction();
        if (action == DragEvent.ACTION_DRAG_ENDED) {
            if (appPlacementDrag != drag || drag.ended) return true;
            boolean valid = drag.current(); int target = drag.target;
            drag.ended = true; appPlacementDrag = null; hostDragActive = false;
            for (Slot slot : slots) slot.clearDropHover();
            if (valid && event.getResult() && target >= 0)
                main.post(() -> {
                    if (active && drag.session == sessionGeneration && drag.operation == epoch
                            && drag.revision == model.revision() && quickOpenApps
                            && config.getBoolean(AtomicWorkbenchConfig.QUICK_OPEN_APPS)
                            && appPreferencesState.entry(drag.app.key()).visible) placeAppAt(drag.app, target);
                });
            return true;
        }
        if (!drag.current() || !model.topology().eligible(id) || !canInteract()) return false;
        if (action == DragEvent.ACTION_DRAG_STARTED)
            return event.getClipDescription() != null && event.getClipDescription().hasMimeType(APP_PLACEMENT_MIME);
        if (action == DragEvent.ACTION_DRAG_EXITED) { slots[id].clearDropHover(); return true; }
        if (action == DragEvent.ACTION_DRAG_ENTERED || action == DragEvent.ACTION_DRAG_LOCATION) {
            slots[id].showDropHover(false);
            slots[id].frame.setContentDescription(model.hasWindow(id) ? "松开后在此格放置应用，已有窗口需确认替换" : "松开后在此格打开应用");
            return true;
        }
        if (action == DragEvent.ACTION_DROP && drag.target < 0) { drag.target = id; return true; }
        return false;
    }

    private void chooseAppDestination(AtomicWorkbenchAppRepository.App app) {
        final int[] ids = model.eligibleWindowIds();
        final long revision = model.revision(), session = sessionGeneration;
        String[] labels = new String[ids.length], details = new String[ids.length];
        for (int i = 0; i < ids.length; i++) {
            labels[i] = model.topology().roleOf(ids[i]) == AtomicWorkbenchPoolTopology.Role.MAIN
                    ? "放入主窗口" : "放入副窗口 " + (model.sideIndexOf(ids[i]) + 1);
            details[i] = model.hasWindow(ids[i]) ? "原窗口任务先移回手机后台，再打开" + app.label : "在此格打开" + app.label;
        }
        closeDialog = ui.choiceDialog("选择放置位置", labels, details, selected -> {
            if (revision != model.revision() || session != sessionGeneration || !canInteract()) {
                showStatus("工作区已变化，请重新选择位置。"); return;
            }
            placeAppAt(app, ids[selected]);
        });
    }

    private void placeAppAt(AtomicWorkbenchAppRepository.App app, int target) {
        if (!canInteract() || app == null || !apps.contains(app) || !model.topology().eligible(target)) return;
        int running = findRunningApp(app);
        if (running >= 0) {
            cancelGesture(); presentationPolicy.invalidate(); pendingPresentationFocus = null;
            beginWindowMotion(() -> {
                if (!active || destroyed || closing) return;
                if (model.hasWindow(model.mainWindowId())) focusWindow(model.mainWindowId());
                else openEmptyWorkspace(model.mainWindowId());
            });
            if (model.placeWindowAt(running, target)) {
                invalidatePresentationGeometry(); renderWorkspace();
            }
            return;
        }
        if (model.hasWindow(target) && !model.planLaunchAt(app.key(), target).accepted()) {
            final long revision = model.revision(), session = sessionGeneration;
            closeDialog = ui.glassDialog("替换此窗口", "将此窗口的任务移回手机后台，再在原位置打开" + app.label + "。其他窗口保留。",
                    "替换窗口", () -> {
                        if (!canInteract() || revision != model.revision() || session != sessionGeneration) {
                            showStatus("目标窗口已变化，请重新选择。"); return;
                        }
                        requestCloseWindow(target, () -> {
                            if (session == sessionGeneration && !model.hasWindow(target) && model.topology().eligible(target))
                                launchSourceApp(app, -1, null, null, target);
                        });
                    }, "取消");
        } else launchSourceApp(app, -1, null, null, target);
    }

    private void showPasteSetup() {
        showPasteSetup(ui, this::showStatus);
    }

    static void showPasteSetup(UiKit hostUi, java.util.function.Consumer<String> failure) {
        hostUi.glassDialog("启用文字填入", "请在系统无障碍设置中启用“红魔Step文字填入”，然后重新拖入。素材会继续保留。",
                "打开设置", () -> {
                    try { hostUi.activity.startActivity(new Intent(android.provider.Settings.ACTION_ACCESSIBILITY_SETTINGS)); }
                    catch (RuntimeException unavailable) { failure.accept("无法打开系统无障碍设置，请从手机设置进入。"); }
                }, "取消");
    }

    private boolean deliveryCurrent(AtomicWorkbenchClient connected, AtomicWorkbenchDeliveryTarget target) {
        Bundle stamp = target.metadata();
        int id = stamp.getInt("window", -1);
        return connected != null && connected == client && connected.inputSession() == stamp.getLong("session", -1)
                && mutationAllowed((int) stamp.getLong("epoch", -1)) && !ResetWriteFence.stale(stamp.getLong("reset", -1))
                && id >= 0 && id < COUNT && model.hasWindow(id) && slots[id].ready
                && slots[id].displayId == stamp.getInt("display", -1)
                && slots[id].displayUniqueId.equals(stamp.getString("unique", ""))
                && slots[id].targetTaskId == stamp.getInt("task", -1) && slots[id].targetUid == stamp.getInt("target_uid", -1)
                && stamp.getString("package", "").equals(transferPackage(id))
                && SystemClock.elapsedRealtime() < stamp.getLong("deadline", -1);
    }

    private void pasteIntoWindow(AtomicWorkbenchDeliveryTarget target, String text) {
        pasteIntoWindow(target, text, false);
    }
    private void pasteIntoWindow(AtomicWorkbenchDeliveryTarget target, String text, boolean sourceOwnedInput) {
        AtomicWorkbenchClient connected = client;
        if (!canInteract() || !deliveryCurrent(connected, target)) { showStatus("目标窗口已变化，文字已保留，请重新拖动。"); return; }
        if (!AtomicWorkbenchPasteService.available()) { showPasteSetup(); return; }
        final AtomicWorkbenchPasteRequest request;
        try { request = target.paste(text); }
        catch (IllegalArgumentException invalid) { showStatus("文字已过期或无法填入，请重新选择。"); return; }
        cancelGesture(); textDeliveryActive = true; busy = true; renderWorkspace(); showStatus("正在核对目标输入框并填入文字…");
        pasteCoordinator.submit(request, new AtomicWorkbenchPasteCoordinator.Host() {
            private boolean current() {
                return !destroyed && active && !closing && !surfaceUnavailable && connected == client
                        && request.uiEpoch == epoch && !ResetWriteFence.stale(request.resetGeneration);
            }
            @Override public AtomicWorkbenchEditorEvidence prepare(AtomicWorkbenchPasteRequest value) throws Exception {
                if (!current()) throw new IllegalStateException("editor_changed");
                if ((hostDialogActive || sourceOwnedInput) && !connected.focusHostInput().getBoolean("success", false))
                    throw new IllegalStateException("editor_evidence_unavailable");
                Bundle result = connected.preparePaste(value);
                if(!result.getBoolean("success",false)&&"editable_focus_required".equals(result.getString("reason"))){
                    AtomicWorkbenchEditorEvidence.WindowEvidence window=AtomicWorkbenchEditorEvidence.WindowEvidence.fromBundle(result.getBundle("window_evidence"));
                    if(!current()||!window.matches(value,SystemClock.elapsedRealtime())||!AtomicWorkbenchPasteService.focusFirstVisible(value,window)||!current())
                        throw new IllegalStateException("editor_evidence_unavailable");
                    result=connected.preparePaste(value);
                }
                if (!result.getBoolean("success", false)) {
                    String reason = result.getString("reason", "");
                    throw new IllegalStateException("editor_evidence_unavailable".equals(reason) ? reason
                            : "deadline".equals(reason) || result.getBoolean("operation_unconfirmed", false) ? "deadline" : "editor_changed");
                }
                return AtomicWorkbenchEditorEvidence.fromBundle(result.getBundle("evidence"));
            }
            @Override public boolean validate(AtomicWorkbenchPasteRequest value, AtomicWorkbenchEditorEvidence evidence) throws Exception {
                if (!current()) return false;
                Bundle response = connected.validatePaste(value, evidence);
                if (!response.getBoolean("success", false) || !current()) return false;
                AtomicWorkbenchEditorEvidence fresh = AtomicWorkbenchEditorEvidence.fromBundle(response.getBundle("evidence"));
                return fresh.matches(value, SystemClock.elapsedRealtime()) && evidence.sameEditor(fresh);
            }
            @Override public boolean release(AtomicWorkbenchPasteRequest value, AtomicWorkbenchEditorEvidence evidence) throws Exception {
                // Even a partially failed prepare owns cleanup; Root decides whether a
                // newer action has already taken ownership and must remain focused.
                try{return connected.releasePaste(value).getBoolean("focus_restored", false);}
                finally{AtomicWorkbenchPasteService.releaseVisibleFocus(value);}
            }
        }, outcome -> completeOperation((int) request.uiEpoch, () -> {
            if (connected != client) return;
            textDeliveryActive = false; busy = false;
            String message = outcome.verified ? "已核对文字填入位置和相邻正文。"
                    : outcome.dispatched ? "已发出填入操作，但无法核对结果。请检查目标输入框，避免重复填入。"
                    : "目标输入框暂不可核对，文字已保留。请先选中可编辑的输入框；密码框不支持填入。";
            if ("service_not_enabled".equals(outcome.reason)) message = "文字填入服务未启用，素材已保留。";
            else if ("password_editor".equals(outcome.reason)) message = "密码输入框不支持文字填入，素材已保留。";
            else if (!outcome.dispatched && "deadline".equals(outcome.reason)) message = "此次填入已过期，文字未发出，素材已保留。";
            else if (!outcome.dispatched && "editor_evidence_unavailable".equals(outcome.reason)) message = "当前系统的编辑连接暂不可核对，素材已保留；可以改用流转菜单中的分享入口。";
            else if (!outcome.dispatched && ("editor_changed".equals(outcome.reason) || "selection_changed".equals(outcome.reason)))
                message = "目标应用、输入框或选区已变化，文字未发出，素材已保留。";
            showStatus(message); renderWorkspace();
            queueHostInput(hostDialogActive); schedulePoll();
        }));
    }

    private void dispatchExactShare(AtomicWorkbenchClient connected, AtomicWorkbenchDeliveryTarget target, Intent intent) {
        if (!canInteract() || !deliveryCurrent(connected, target)) { showStatus("目标窗口已变化，素材已保留，请重新拖动。"); return; }
        cancelGesture(); busy = true; int request = epoch;
        showStatus("正在打开所选窗口的分享入口…"); renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try { result = mutationAllowed(request) && connected == client ? connected.shareExact(target, intent) : failure("工作区已离开，素材已保留。"); }
            catch (Exception unavailable) { result = failure("分享结果尚未确认，请检查目标应用。素材已保留。"); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (connected != client) return;
                busy = false;
                int id = target.metadata().getInt("window", -1);
                if (response.containsKey("display_id")) applyWindowStatus(id, response);
                focusedWindow = response.getInt("focused_window_id", -2);
                showStatus(response.getString("message", "应用未确认接收素材，内容已保留。"));
                renderWorkspace(); queueHostInput(hostDialogActive); schedulePoll();
            }));
        });
    }

    private void sendTransfer(Intent share, String packageName) {
        if (!canInteract()) { showStatus("工作区正在准备，请稍后重新拖动内容。"); return; }
        if (share != null && share.getComponent() != null) {
            int id = model.mainWindowId();
            if (!packageName.equals(share.getComponent().getPackageName()) || !model.hasWindow(id) || !slots[id].ready) {
                showStatus("当前工作区尚未就绪，内容已保留，请稍后重新选择分享入口。"); return;
            }
            dispatchShare(id, new Intent(share), packageName); return;
        }
        AtomicWorkbenchAppRepository.App target = null;
        for (AtomicWorkbenchAppRepository.App app : apps)
            if (app.component.getPackageName().equals(packageName)) { target = app; break; }
        if (target == null) { showStatus("此应用没有桌面入口，请在流转素材菜单中选择具体分享入口。"); return; }
        pendingTransfer = new Intent(share);
        pendingTransferPackage = packageName;
        pendingTransferStarted = SystemClock.elapsedRealtime();
        launchApp(target, -1);
        main.removeCallbacks(transferDispatch);
        main.postDelayed(transferDispatch, 200L);
    }

    private void dispatchPendingTransfer() {
        if (pendingTransfer == null) return;
        if (!active || destroyed || closing || exitRequested || recoveryPending
                || SystemClock.elapsedRealtime() - pendingTransferStarted > 15_000L) {
            pendingTransfer = null; pendingTransferPackage = null;
            if (active && !destroyed) showStatus("目标工作区未就绪，内容已保留，可重新拖动。");
            return;
        }
        int id = model.mainWindowId();
        if (busy || !mainReady() || !pendingTransferPackage.equals(transferPackage(id))) {
            main.postDelayed(transferDispatch, 200L); return;
        }
        Intent share = pendingTransfer; String packageName = pendingTransferPackage;
        pendingTransfer = null; pendingTransferPackage = null;
        dispatchShare(id, share, packageName);
    }

    private void dispatchShare(int id, Intent share, String packageName) {
        AtomicWorkbenchClient connected = client;
        if (connected == null) { showStatus("工作台连接不可用，内容已保留。"); return; }
        cancelGesture(); hideHostKeyboard(); busy = true;
        int request = ++epoch;
        renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try { result = mutationAllowed(request) ? connected.shareWindow(id, share, packageName)
                    : failure("工作区已离开，内容未流转"); }
            catch (Exception error) { result = failure("目标应用未接收内容：" + safeMessage(error)); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (request != epoch || connected != client) return;
                busy = false;
                if (response.containsKey("display_id")) applyWindowStatus(id, response);
                focusedWindow = response.getInt("focused_window_id", -2);
                showStatus(response.getString("message", response.getBoolean("success", false)
                        ? "已打开应用接收页面，请在应用内选择联系人并确认发送。" : "目标应用暂不支持接收这类内容。"));
                if (response.getBoolean("success", false)) focusWindow(id);
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (transfer != null && transfer.onActivityResult(requestCode, resultCode, data)) return;
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (transfer != null) transfer.onRequestPermissionsResult(requestCode);
    }

    private String appsSignature() {
        StringBuilder signature = new StringBuilder().append(appCatalogRevision).append(':').append(appsLoaded).append(':').append(apps.size())
                .append(':').append(model.mainWindowId());
        for (int id : model.topology().allSideIds()) signature.append('/').append(id);
        signature.append(':').append(requestedSideCount).append(':').append(emptySideSlots);
        for (int id = 0; id < COUNT; id++) signature.append('|').append(model.component(id));
        for (Slot slot : slots) signature.append('|').append(slot.topComponent).append(':').append(slot.runningPackages);
        return signature.toString();
    }

    private ArrayList<AtomicWorkbenchAppRepository.App> quickAppOrder() {
        ArrayList<AtomicWorkbenchAppRepository.App> ordered = new ArrayList<>();
        // Live foregrounds precede background tasks, in the same visual order as
        // the main pane and the side panes. Native HOME has no invented app tile.
        for (int id : presentationOrder(true)) {
            if (!model.hasWindow(id)) continue;
            AtomicWorkbenchAppRepository.App foreground = findDisplayApp(slots[id].topComponent);
            if (foreground == null && slots[id].topComponent.isEmpty()) foreground = findApp(model.component(id));
            if (foreground != null && !ordered.contains(foreground)) ordered.add(foreground);
        }
        for (AtomicWorkbenchAppRepository.App app : apps)
            if (findRunningApp(app) >= 0 && !ordered.contains(app)) ordered.add(app);
        ArrayList<String> runningFirst=new ArrayList<>();
        for(AtomicWorkbenchAppRepository.App app:ordered)runningFirst.add(app.key());
        return AtomicWorkbenchAppListModel.ordered(apps,appPreferencesState,appUsage,true,runningFirst);
    }

    private void renderStrip() {
        if (appPlacementDrag != null) return;
        appStripScroll.setVisibility(quickOpenApps ? View.VISIBLE : View.GONE);
        appStripScroll.setEnabled(quickOpenApps);
        if (!quickOpenApps) {
            stripSignature = "";
            appStrip.removeAllViews();
            return;
        }
        String signature = appsSignature();
        if (signature.equals(stripSignature)) return;
        stripSignature = signature; appStrip.removeAllViews();
        ArrayList<AtomicWorkbenchAppRepository.App> ordered = quickAppOrder();
        for (AtomicWorkbenchAppRepository.App app : ordered) {
            LinearLayout.LayoutParams item = new LinearLayout.LayoutParams(ui.dp(60), -1);
            item.rightMargin = ui.dp(4);
            appStrip.addView(appTile(app, true), item);
        }
    }

    private void renderDesktop() {
        if (appPlacementDrag != null) return;
        if (appGrid == null) return;
        String query = search.getText().toString().trim().toLowerCase(Locale.ROOT);
        filtered.clear();
        for (AtomicWorkbenchAppRepository.App app : quickAppOrder()) if (app.searchKey.contains(query)) filtered.add(app);
        int capacity = gridRows * 3, pages = Math.max(1, (filtered.size() + capacity - 1) / capacity);
        page = Math.max(0, Math.min(pages - 1, page));
        String signature = quickOpenApps + "/" + appsSignature() + '/' + query + '/' + page + '/' + gridRows;
        if (signature.equals(gridSignature)) return;
        gridSignature = signature; appGrid.removeAllViews(); appGrid.setRowCount(gridRows);
        for (int cell = 0; cell < capacity; cell++) {
            int index = page * capacity + cell;
            View tile = index < filtered.size() ? appTile(filtered.get(index), false) : new View(this);
            GridLayout.LayoutParams layout = new GridLayout.LayoutParams(
                    GridLayout.spec(cell / 3, 1f), GridLayout.spec(cell % 3, 1f));
            layout.width = 0; layout.height = 0;
            layout.setMargins(ui.dp(2), ui.dp(2), ui.dp(2), ui.dp(2)); layout.setGravity(Gravity.FILL);
            appGrid.addView(tile, layout);
        }
        pageLabel.setText(pageLabel.getContext().getString(R.string.status_atomicworkbenchactivity_1 ,String.valueOf((page + 1)), String.valueOf(pages)));
        previousPage.setEnabled(quickOpenApps && page > 0); nextPage.setEnabled(quickOpenApps && page + 1 < pages);
        desktopState.setText(!appsLoaded ? "正在读取本机应用…" : filtered.isEmpty()
                ? "没有找到可用应用" : "本机应用 · " + filtered.size());
    }


    // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
    //noinspection RtlHardcoded
    private void layoutWorkspace() {
        if (deferNativeShieldLayout()) return;
        nativeShieldLayoutDeferred = false;
        if (workspace == null || workspace.getWidth() <= 0 || workspace.getHeight() <= 0) return;
        Roles roles = presentationRoles(); presentationPolicy.observeRoles(roles);
        AtomicWorkbenchCapacityLayoutPlan plan;
        try {
            plan = AtomicWorkbenchCapacityLayoutPlan.calculate(
                    AtomicWorkbenchCapacityLayoutPlan.Rect.size(0, 0, workspace.getWidth(), workspace.getHeight()),
                    ui.dp(4), roles.topology(), presentationPolicy.railSide() == RailSide.LEFT
                            ? AtomicWorkbenchCapacityLayoutPlan.Rail.LEFT : AtomicWorkbenchCapacityLayoutPlan.Rail.RIGHT,
                    model.mainExpanded(), emptySideSlots);
        } catch (IllegalArgumentException invalid) {
            invalidatePresentationGeometry();
            for (Slot slot : slots) { slot.shield.setEnabled(false); slot.swipe.setEnabled(false); }
            showStatus("工作区尺寸尚未就绪，窗口和任务已保留。"); return;
        }
        AtomicWorkbenchCapacityLayoutPlan.Rect mainBounds = plan.activeMainBounds();
        prepareMainLayout(roles.mainId, mainBounds.left, mainBounds.top, mainBounds.width(), mainBounds.height());
        workspace.setClipChildren(true);
        for (AtomicWorkbenchCapacityLayoutPlan.Frame frame : plan.framesById().values()) {
            Slot slot = slots[frame.windowId]; AtomicWorkbenchCapacityLayoutPlan.Rect bounds = frame.bounds;
            setSlotVisible(slot, frame.visible);
            slot.swipe.setEnabled(frame.visible && frame.role == AtomicWorkbenchPoolTopology.Role.SIDE
                    && model.hasWindow(frame.windowId) && !slot.retainedEmptyTaskDisplay);
            place(slot.frame, bounds.left, bounds.top, bounds.width(), bounds.height());
            if (frame.role == AtomicWorkbenchPoolTopology.Role.SIDE)
                slot.swipe.setOutwardSign(presentationPolicy.railSide() == RailSide.LEFT ? -1 : 1);
        }
        place(desktop, mainBounds.left, mainBounds.top, mainBounds.width(), mainBounds.height());
        place(homeTransitionCover, mainBounds.left, mainBounds.top, mainBounds.width(), mainBounds.height());
        FrameLayout.LayoutParams message = (FrameLayout.LayoutParams) status.getLayoutParams();
        int bottom = workspace.getHeight() - mainBounds.bottom;
        if (message.width != mainBounds.width() || message.leftMargin != mainBounds.left || message.topMargin != 0
                || message.rightMargin != 0 || message.bottomMargin != bottom || message.gravity != (Gravity.BOTTOM | Gravity.LEFT)
                || message.isMarginRelative()) {
            message.width = mainBounds.width(); message.leftMargin = mainBounds.left; message.topMargin = message.rightMargin = 0;
            message.bottomMargin = bottom; message.gravity = Gravity.BOTTOM | Gravity.LEFT;
            message.setMarginStart(Integer.MIN_VALUE); message.setMarginEnd(Integer.MIN_VALUE); status.setLayoutParams(message);
        }
        for (Slot slot : slots) slot.fitSurface();
    }

    private void prepareMainLayout(int id, int left, int top, int width, int height) {
        Slot slot = slots[id];
        if (mainLayoutWindow == id && mainLayoutLeft == left && mainLayoutTop == top && mainLayoutWidth == width && mainLayoutHeight == height
                && mainLayoutDisplayWidth == slot.displayWidth && mainLayoutDisplayHeight == slot.displayHeight) return;
        mainLayoutWindow = id; mainLayoutLeft = left; mainLayoutTop = top; mainLayoutWidth = width; mainLayoutHeight = height;
        mainLayoutDisplayWidth = slot.displayWidth; mainLayoutDisplayHeight = slot.displayHeight;
        invalidateMainLayout(id);
    }

    private void invalidateMainLayout(int id) {
        invalidateExtractionGeometry();
        if (id != mainLayoutWindow) return;
        mainLayoutPresented = false;
        cancelGesture();
        AtomicWorkbenchClient connected = client;
        if (connected != null) connected.clearGestureTarget();
    }


    // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
    //noinspection RtlHardcoded
    private boolean mainLayoutMatches(int id) {
        if (id != mainLayoutWindow || mainLayoutWidth < 1 || mainLayoutHeight < 1
                || mainLayoutDisplayWidth < 1 || mainLayoutDisplayHeight < 1) return false;
        Slot slot = slots[id];
        if (slot.displayWidth != mainLayoutDisplayWidth || slot.displayHeight != mainLayoutDisplayHeight
                || slot.frame.getLeft() != mainLayoutLeft || slot.frame.getTop() != mainLayoutTop
                || slot.frame.getWidth() != mainLayoutWidth || slot.frame.getHeight() != mainLayoutHeight) return false;
        FrameLayout.LayoutParams frame = (FrameLayout.LayoutParams) slot.frame.getLayoutParams();
        if (frame.leftMargin != mainLayoutLeft || frame.topMargin != mainLayoutTop || frame.width != mainLayoutWidth
                || frame.height != mainLayoutHeight || frame.gravity != (Gravity.TOP | Gravity.LEFT) || frame.isMarginRelative()) return false;
        float scale = Math.min(mainLayoutWidth / (float) mainLayoutDisplayWidth, mainLayoutHeight / (float) mainLayoutDisplayHeight);
        int width = Math.max(1, Math.round(mainLayoutDisplayWidth * scale));
        int height = Math.max(1, Math.round(mainLayoutDisplayHeight * scale));
        FrameLayout.LayoutParams output = (FrameLayout.LayoutParams) slot.surface.getLayoutParams();
        return output.width == width && output.height == height
                && slot.surface.getWidth() == width && slot.surface.getHeight() == height
                && slot.surface.getLeft() == (mainLayoutWidth - width) / 2
                && slot.surface.getTop() == (mainLayoutHeight - height) / 2;
    }

    private boolean onWorkspacePreDraw() {
        int id = model.mainWindowId();
        boolean matches = mainLayoutMatches(id);
        if (mainLayoutPresented && !matches) invalidateMainLayout(mainLayoutWindow);
        // A role change updates LayoutParams before Android lays out the old side
        // Surface. Only publish input after both frame and fitted output are real.
        if (!mainLayoutPresented && matches && !workspace.isLayoutRequested()
                && !slots[id].frame.isLayoutRequested() && !slots[id].surface.isLayoutRequested()) {
            mainLayoutPresented = true;
            appBack.setEnabled(!closing && (pendingAppSurfaceLaunch != null && !pendingAppSurfaceLaunch.dispatched
                || model.desktopVisible() || mainReady()));
            publishGestureTarget();
        }
        finishOutputPresentation();
        continuePendingAppSurfaceLaunch();
        return true;
    }

    private void setSlotVisible(Slot slot, boolean visible) {
        // Do not use GONE/INVISIBLE: that destroys the Surface and forces task restoration.
        slot.frame.setImportantForAccessibility(visible ? View.IMPORTANT_FOR_ACCESSIBILITY_AUTO
                : View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        slot.shield.setEnabled(visible);
    }


    // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
    //noinspection RtlHardcoded
    private void place(View view, int left, int top, int width, int height) {
        FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) view.getLayoutParams();
        if (layout.leftMargin == left && layout.topMargin == top && layout.width == width && layout.height == height
                && layout.rightMargin == 0 && layout.bottomMargin == 0 && layout.gravity == (Gravity.TOP | Gravity.LEFT)
                && !layout.isMarginRelative()) return;
        cancelGesture();
        layout.leftMargin = left; layout.topMargin = top; layout.width = width; layout.height = height;
        layout.rightMargin = layout.bottomMargin = 0; layout.gravity = Gravity.TOP | Gravity.LEFT;
        layout.setMarginStart(Integer.MIN_VALUE); layout.setMarginEnd(Integer.MIN_VALUE);
        view.setLayoutParams(layout);
    }

    private Roles presentationRoles() {
        return new Roles(model.topology());
    }

    private int[] presentationOrder(boolean includeHidden) {
        ArrayList<Integer> ids = new ArrayList<>(); ids.add(model.mainWindowId());
        for (int id : model.topology().mainIdsOuterToRail()) if (!ids.contains(id)) ids.add(id);
        for (int id : model.topology().sideIds()) if (!ids.contains(id)) ids.add(id);
        if (includeHidden) for (int id : model.topology().allSideIds()) if (!ids.contains(id)) ids.add(id);
        int[] order = new int[ids.size()]; for (int i = 0; i < order.length; i++) order[i] = ids.get(i);
        return order;
    }

    private boolean outputPresented(int id) {
        if (model.mainExpanded()) return id == model.mainWindowId();
        if (model.topology().mainIdsOuterToRail().contains(id)) return true;
        for (int visible : model.visibleSideWindowIds(emptySideSlots)) if (visible == id) return true;
        return false;
    }

    private void applyPendingSideCount() {
        if (!sideCountPending && requestedSideCount == model.topology().sideIds().size()) return;
        if (busy || hostTouchActive || hostDialogActive || hostDragActive || outputsSyncing
                || closing || recoveryPending || waitingForCleanup || ResetWriteFence.stale(launchGeneration)) return;
        sideCountPending = false;
        if (!model.configureCapacity(requestedSideCount, false)) return;
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        invalidatePresentationGeometry();
        // Reuses the output-only path: hidden owners detach, never close or reallocate.
        if (active && client != null) main.post(this::syncWorkspaceOutputs);
    }

    private Lease presentationLease(int id) {
        if (id < 0 || id >= slots.length || slots[id] == null) return null;
        Slot slot = slots[id];
        try { return new Lease(id, slot.displayId, slot.displayName, slot.displayUniqueId, slot.windowSession); }
        catch (IllegalArgumentException unknown) { return null; }
    }

    private Receipt beginPresentationFocus(int id, int request) {
        Receipt prior = pendingPresentationFocus;
        if (prior != null && prior.targetId == id) {
            pendingPresentationFocus = null;
            Receipt continued = presentationPolicy.continueFocus(prior, sessionGeneration, request, presentationRoles(), presentationLease(id));
            if (continued != null) return continued;
        }
        return presentationPolicy.begin(id, sessionGeneration, request, presentationRoles(), presentationLease(id));
    }

    private Receipt proposalPresentation(Receipt receipt) {
        Receipt proposed = presentationPolicy.proposal(receipt, presentationRoles());
        if (proposed == null) presentationPolicy.observeRoles(presentationRoles());
        return proposed;
    }

    private Receipt bindPresentationReply(Receipt receipt, int id, Bundle response) {
        Lease actual = presentationLease(id);
        if (actual == null || !response.getBoolean("success", false) || response.getBoolean("operation_unconfirmed", false)
                || response.getBoolean("recovery_pending", false) || response.getInt("window_id", -1) != id
                || response.getInt("focused_window_id", -2) != id
                || response.getInt("display_id", -1) != actual.displayId || !actual.name.equals(response.getString("display_name", ""))
                || !actual.unique.equals(response.getString("display_unique_id", ""))
                || !actual.windowSession.equals(response.getString("window_session", ""))) {
            presentationPolicy.cancel(receipt); return null;
        }
        return presentationPolicy.bindLease(receipt, actual);
    }

    /** A new HOME owner changes observation only; its frame still owns promotion. */
    private Receipt bindHomePresentationReply(Receipt receipt, int id, Bundle response) {
        Receipt bound = bindPresentationReply(receipt, id, response);
        if (bound == null) return null;
        Roles observed = presentationRoles();
        if (bound.expectedRoles.equals(observed)) return bound;
        return presentationPolicy.observeAllocation(bound, observed, presentationLease(id));
    }

    /** Only callers with a current Root focus ACK / accepted native HOME frame enter here. */
    private boolean confirmPresentationPromotion(int id, Receipt receipt) {
        Lease actual = presentationLease(id);
        if (!presentationPolicy.eligible(receipt, sessionGeneration, presentationRoles()) || receipt.uiEpoch != epoch
                || actual == null || !actual.equals(receipt.lease)) {
            presentationPolicy.cancel(receipt); return false;
        }
        if (id != model.mainWindowId()) beginWindowMotion(null);
        if (!model.promote(id)) { if (windowMotion != null) windowMotion.close(); presentationPolicy.cancel(receipt); return false; }
        boolean flipped = presentationPolicy.confirm(receipt, sessionGeneration, epoch, presentationRoles(), actual);
        presentationPolicy.observeRoles(presentationRoles());
        if (flipped) invalidatePresentationGeometry();
        return true;
    }

    private void invalidatePresentationGeometry() {
        mainLayoutPresented = false; cancelGesture(); invalidateExtractionGeometry();
        AtomicWorkbenchClient connected = client;
        if (connected != null) connected.clearGestureTarget();
    }

    private void beginWindowMotion(Runnable after) {
        if (windowMotion == null) { if (after != null) main.post(after); return; }
        cancelGesture(); invalidateExtractionGeometry();
        View[] frames = new View[COUNT];
        for (int i = 0; i < COUNT; i++) { slots[i].swipe.cancel(); frames[i] = slots[i].frame; }
        windowMotion.begin(frames, () -> {
            if (!active || destroyed || closing) return;
            invalidatePresentationGeometry(); renderWorkspace();
            if (after != null) after.run(); else tryIncoming();
        });
    }

    private void dispatchEntrySide() {
        main.removeCallbacks(entrySideDispatch);
        EntryProof proof = pendingLayoutProof;
        if (proof == null || destroyed || closing) return;
        String problem = entryProblem(proof);
        if (!problem.isEmpty()) {
            presentationPolicy.discardEntry(proof.key()); pendingLayoutProof = null;
            if (incomingProof == proof) { incomingPending = false; incomingTaskId = -1; incomingComponent = null; incomingProof = null; entryProblemText = problem; }
            if (ui != null) showStatus(problem);
            return;
        }
        if (!canInteract() || workspace == null || workspace.getWidth() < 1 || workspace.getHeight() < 1
                || lifecycleGate.surfaceMissing() || AtomicWorkbenchCleanup.pending() || incomingPending && !appsLoaded) {
            if (active) main.postDelayed(entrySideDispatch, 100L);
            return;
        }
        AtomicWorkbenchWindowPresentationPolicy.Consumption consumed = presentationPolicy.consumeEntry(proof.key(), SystemClock.elapsedRealtime(), true);
        pendingLayoutProof = null;
        if (getIntent() != null) getIntent().removeExtra(AtomicWorkbenchConfig.EXTRA_SIDE);
        if (consumed == AtomicWorkbenchWindowPresentationPolicy.Consumption.EXPIRED) {
            if (incomingProof == proof) { incomingPending = false; incomingTaskId = -1; incomingComponent = null; incomingProof = null;
                entryProblemText = "本次入口请求已过期，请重新滑入。"; }
            showStatus("本次入口请求已过期，请重新滑入。"); return;
        }
        if (consumed == AtomicWorkbenchWindowPresentationPolicy.Consumption.CHANGED) {
            invalidatePresentationGeometry(); renderWorkspace();
        }
        if (consumed == AtomicWorkbenchWindowPresentationPolicy.Consumption.CHANGED
                || consumed == AtomicWorkbenchWindowPresentationPolicy.Consumption.UNCHANGED) main.post(this::tryIncoming);
    }

    private void renderWorkspace() {
        if (destroyed) return;
        applyPendingSideCount();
        if (taskReferenceControls != null && (closing || recoveryPending || waitingForCleanup || ResetWriteFence.stale(launchGeneration)))
            closeTaskReferenceManagement();
        boolean expanded = model.mainExpanded();
        workspaceToolbar.setVisibility(expanded ? View.GONE : View.VISIBLE);
        mediaCard.setVisibility(!expanded && showMedia ? View.VISIBLE : View.GONE);
        appStripScroll.setVisibility(!expanded && quickOpenApps ? View.VISIBLE : View.GONE);
        focusReturn.setVisibility(expanded ? View.VISIBLE : View.GONE);
        workspaceRoot.setPadding(ui.dp(expanded ? 0 : 6), workspaceRoot.getPaddingTop(),
                ui.dp(expanded ? 0 : 6), workspaceRoot.getPaddingBottom());
        for (Slot slot : slots) slot.render();
        desktop.setVisibility(quickOpenApps && model.desktopVisible() && appListRequested ? View.VISIBLE : View.GONE);
        // The opaque desktop covers the main buffer without detaching its consumer.
        homeTransitionCover.bringToFront(); desktop.bringToFront(); status.bringToFront(); focusReturn.bringToFront();
        appBack.setEnabled(!closing && (pendingAppSurfaceLaunch != null && !pendingAppSurfaceLaunch.dispatched
                || model.desktopVisible() || mainReady()));
        desktopButton.setEnabled(!closing && !busy); exit.setEnabled(!closing); settingsButton.setEnabled(!closing);
        expandMain.setEnabled(canInteract() && !model.desktopVisible() && slots[model.mainWindowId()].ready);
        reloadMain.setEnabled(mainReady() && !slots[model.mainWindowId()].nativeHome
                && SystemClock.elapsedRealtime() >= reloadAvailableAt);
        focusReturn.setEnabled(!closing && !outputsSyncing);
        search.setEnabled(quickOpenApps && appListRequested && !closing && !busy && focusedWindow == -1 && !recoveryPending);
        layoutWorkspace(); renderStrip(); renderDesktop();
        finishOutputPresentation();
        publishGestureTarget();
    }

    private void setMainExpanded(boolean expanded) {
        if (!canInteract() || expanded && !mainReady()) return;
        if (model.mainExpanded() == expanded || !model.setMainExpanded(expanded)) return;
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        cancelGesture();
        if (client != null) client.clearGestureTarget();
        invalidateMainLayout(model.mainWindowId());
        renderWorkspace();
        syncWorkspaceOutputs();
    }

    /** Reconnect only the current producer. Tasks, display identity and other windows stay owned. */
    private void reloadMainOutput() {
        if (!mainReady() || hostDragActive || SystemClock.elapsedRealtime() < reloadAvailableAt) return;
        final int id = model.mainWindowId(); final Slot slot = slots[id];
        if (slot.nativeHome) return;
        final Lease lease = presentationLease(id);
        final android.view.Surface producer = duplicateOutput(slot.surface.getHolder().getSurface());
        if (lease == null || producer == null || !producer.isValid()) {
            if (producer != null) producer.release(); showStatus("当前画面尚未准备，请稍后重试。"); return;
        }
        final long session = sessionGeneration, lifecycle = slot.surfaceLifecycle;
        final long detachSequence = outputSequence + 1; outputSequence += 2;
        final int request = ++epoch; final AtomicWorkbenchClient connected = client;
        reloadAvailableAt = SystemClock.elapsedRealtime() + 800;
        cancelGesture(); invalidateExtractionGeometry(); busy = true; focusedWindow = -2;
        slot.outputAwaitingFrame = true; slot.outputFrameBoundary = slot.surface.frameCount();
        reloadMain.animate().cancel(); reloadMain.setRotation(0);
        reloadMain.animate().rotation(360).setDuration(600).withEndAction(() -> reloadMain.setRotation(0)).start();
        showStatus("正在重载当前应用画面…"); renderWorkspace();
        WORKER.execute(() -> {
            Bundle response;
            try {
                if (!mutationAllowed(request) || connected != client || session != sessionGeneration
                        || lifecycle != slot.surfaceLifecycle) throw new IllegalStateException("原窗口已变化");
                Bundle state = poolStatus(connected.status());
                ArrayList<Bundle> windows = poolWindowsOrNull(state);
                Bundle window = windows == null ? null : findWindow(windows, id);
                if (window == null || !window.getBoolean("success") || window.getInt("display_id", -1) != lease.displayId
                        || !lease.unique.equals(window.getString("display_unique_id", ""))
                        || !lease.name.equals(window.getString("display_name", ""))
                        || !lease.windowSession.equals(window.getString("window_session", ""))
                        || window.getBoolean("recovery_pending", true) || window.getBoolean("operation_unconfirmed", false))
                    throw new IllegalStateException("原窗口身份尚未确认");
                Bundle expected = outputIdentity(window);
                response = connected.updateOutput(id, expected, detachSequence, null);
                if (!response.getBoolean("success") || !response.getBoolean("output_attached_known")
                        || response.getBoolean("output_attached", true) || response.getBoolean("output_transition_pending", true))
                    throw new IllegalStateException("原画面断开尚未确认");
                // STOP queues its own newer park request. Never reattach behind that transition.
                if (!mutationAllowed(request) || connected != client || session != sessionGeneration
                        || lifecycle != slot.surfaceLifecycle) throw new IllegalStateException("工作区已离开");
                response = connected.updateOutput(id, expected, detachSequence + 1, producer);
                if (!response.getBoolean("success") || !response.getBoolean("output_attached_known")
                        || !response.getBoolean("output_attached") || response.getBoolean("output_transition_pending", true))
                    throw new IllegalStateException("原画面连接尚未确认");
            } catch (Exception failure) { response = failure("画面重载未确认，任务已保留：" + safeMessage(failure)); }
            finally { producer.release(); }
            final Bundle result = response;
            main.post(() -> completeOperation(request, () -> {
                if (!active || destroyed || closing || connected != client || request != epoch || session != sessionGeneration) return;
                busy = false;
                if (result.getBoolean("success")) {
                    applyWindowStatus(id, result); slot.outputFrameBoundary = slot.surface.frameCount();
                    slot.outputAwaitingFrame = true; showStatus(null); focusWindow(id);
                    main.postDelayed(() -> {
                        if (active && session == sessionGeneration && model.mainWindowId() == id && slot.outputAwaitingFrame) {
                            outputsNeedRetry = true;
                            showStatus("原任务保持原位，重载后尚未收到新画面。可点此核对连接。");
                        }
                    }, 3000);
                } else { outputsNeedRetry = true; slot.ready = false; showStatus(result.getString("message")); }
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private void finishOutputPresentation() {
        if (!outputFocusPending || outputsSyncing || outputsParked || !active || destroyed || closing || busy
                || recoveryPending || waitingForCleanup || client == null) return;
        int id = model.mainWindowId();
        if (!model.desktopVisible() && (!slots[id].ready || !slots[id].surface.getHolder().isValid() || slots[id].outputAwaitingFrame
                || !slots[id].outputRetainsProducer && !slots[id].surface.isFrameFromConfiguredGeometry()
                || !mainLayoutPresented || !mainLayoutMatches(id))) return;
        outputFocusPending = false;
        queueHostInput(hostDialogActive || model.desktopVisible());
    }

    /** Reserve the whole batch on the UI thread so a later stop fences every pending output. */
    private void syncWorkspaceOutputs() {
        PendingAppSurfaceLaunch preparing = pendingAppSurfaceLaunch;
        if (preparing != null && !preparing.dispatched) { preparing.outputSyncRequested = true; return; }
        AtomicWorkbenchClient connected = client;
        if (!active || destroyed || closing || recoveryPending || waitingForCleanup || connected == null
                || ResetWriteFence.stale(launchGeneration)) return;
        if (outputsSyncing) { outputSyncAgain = true; return; }
        cancelTaskStorageRecheck();
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        final long session = sessionGeneration, transition = ++outputTransition;
        final long sequence = outputSequence + 1;
        outputSequence += COUNT + 1;
        final boolean expanded = model.mainExpanded();
        final int mainId = model.mainWindowId();
        final Roles outputRoles = presentationRoles();
        final int outputEmptyLimit = emptySideSlots;
        final boolean[] presented = new boolean[COUNT];
        for (int id = 0; id < COUNT; id++) presented[id] = outputPresented(id);
        final android.view.Surface[] outputs = new android.view.Surface[COUNT];
        final int[] lifecycles = new int[COUNT];
        final String[] expectedUnique = new String[COUNT];
        for (Slot slot : slots) {
            lifecycles[slot.id] = slot.surfaceLifecycle;
            expectedUnique[slot.id] = slot.displayUniqueId;
            boolean visible = presented[slot.id];
            if (visible && slot.surface.getHolder().isValid()) outputs[slot.id] = duplicateOutput(slot.surface.getHolder().getSurface());
            // Resizing this consumer's View does not resize the VD buffer. An already
            // admitted producer retains its complete buffer; a replacement needs a frame.
            slot.outputRetainsProducer = outputs[slot.id] != null && slot.ready && slot.surface.frameCount() > 0;
            slot.ready = false;
            slot.outputAwaitingFrame = outputs[slot.id] != null && !slot.outputRetainsProducer;
            slot.outputFrameBoundary = slot.surface.frameCount();
        }
        outputsSyncing = true; outputsNeedRetry = false; outputFocusPending = true; focusedWindow = -2;
        cancelGesture(); connected.clearGestureTarget(); invalidateMainLayout(mainId);
        WORKER.execute(() -> {
            Bundle result = null;
            String message = "";
            boolean resumeConfirmed = false, snapshotConfirmed = false;
            try {
                if (!outputSessionCurrent(connected, session, transition)) return;
                Bundle resumed = connected.resumeUi(sequence);
                if (!resumed.getBoolean("success", false)) { result = resumed; return; }
                resumeConfirmed = !resumed.getBoolean("ui_parked", true);
                if (!resumeConfirmed) { result = resumed; return; }
                if (!outputSessionCurrent(connected, session, transition)) return;
                // This Activity is visible again; only this path may borrow its physical input.
                connected.focusHostInput();
                if (!outputSessionCurrent(connected, session, transition)) return;
                Bundle fresh = poolStatus(connected.status());
                ArrayList<Bundle> windows = poolWindowsOrNull(fresh);
                if (windows == null || !fresh.getBoolean("success", false)) { result = fresh; return; }
                snapshotConfirmed = true;
                for (int id = 0; id < COUNT && outputSessionCurrent(connected, session, transition); id++) {
                    Bundle window = findWindow(windows, id);
                    if (window == null || window.getInt("display_id", -1) <= 0) continue;
                    if (presented[id] && outputs[id] == null) message = "部分窗口画面正在准备，任务已保留；画面就绪后会重新连接。";
                    if (!expectedUnique[id].isEmpty() && !expectedUnique[id].equals(window.getString("display_unique_id", ""))) {
                        message = "原窗口身份已变化，画面未替换；请退出恢复后重新进入。";
                        continue;
                    }
                    Bundle response = connected.updateOutput(id, outputIdentity(window), sequence + 1 + id, outputs[id]);
                    if (!response.getBoolean("success", false)) message = response.getString("message", "部分窗口画面尚未连接，任务已保留。");
                }
                if (outputSessionCurrent(connected, session, transition)) result = poolStatus(connected.status());
            } catch (Exception unavailable) { message = "画面连接结果尚未确认，任务已保留；点此重新核对。"; }
            finally {
                for (android.view.Surface output : outputs) if (output != null) output.release();
                Bundle response = result;
                String notice = message;
                boolean admitted = resumeConfirmed && snapshotConfirmed;
                main.post(() -> {
                    if (destroyed || transition != outputTransition || session != sessionGeneration || connected != client || closing || !active) return;
                    boolean changed = outputSyncAgain || expanded != model.mainExpanded() || mainId != model.mainWindowId()
                            || !outputRoles.equals(presentationRoles()) || outputEmptyLimit != emptySideSlots;
                    for (Slot slot : slots) changed |= slot.surfaceLifecycle != lifecycles[slot.id];
                    if (changed) {
                        outputsSyncing = false; outputSyncAgain = false; outputsParked = true;
                        main.post(this::syncWorkspaceOutputs);
                        return;
                    }
                    outputsSyncing = false;
                    outputsNeedRetry = !notice.isEmpty();
                    outputsParked = !admitted || response == null || response.getBoolean("ui_parked", true);
                    surfaceUnavailable = false; lifecycleGate.restored();
                    if (!outputsParked) resumeDeferredOperation();
                    if (destroyed || closing || session != sessionGeneration || connected != client) return;
                    ArrayList<Bundle> windows = poolWindowsOrNull(response);
                    if (windows != null) for (Bundle window : windows) {
                        int id = window.getInt("window_id", -1);
                        if (id >= 0 && id < COUNT && (model.hasWindow(id) || window.getInt("display_id", -1) > 0)) applyWindowStatus(id, window);
                    }
                    observeTaskStorageScope(response);
                    if (!notice.isEmpty()) showStatus(notice);
                    else if (outputsParked) showStatus("工作台画面尚未恢复，任务已保留；点此重试。");
                    else if (operationNotice != null) showStatus(operationNotice);
                    else showStatus(null);
                    for (Slot slot : slots) {
                        if (slot.surface.frameCount() > slot.outputFrameBoundary && slot.surface.isFrameFromConfiguredGeometry()) slot.outputAwaitingFrame = false;
                    }
                    resumePendingHomeAfterOutputs();
                    renderWorkspace();
                    if (!outputsParked) { tryIncoming(); schedulePoll(); scheduleMedia(); }
                });
            }
        });
    }

    private boolean outputSessionCurrent(AtomicWorkbenchClient connected, long session, long transition) {
        return active && !destroyed && !closing && transition == outputTransition
                && connected == client && session == sessionGeneration && !ResetWriteFence.stale(launchGeneration);
    }

    private void resumePendingHomeAfterOutputs() {
        if (outputsParked || homePresentationWindow < 0 || homePresentationEpoch != epoch) return;
        int id = homePresentationWindow;
        clearHomePresentation(); dismissHomeTransitionCover(); busy = false;
        // Reacquire actual Root focus before accepting a fresh HOME presentation.
        // The old request's Surface/lifecycle and deadline never certify the new one.
        if (model.hasWindow(id) && slots[id].nativeHome && slots[id].surface.getHolder().isValid()) focusWindow(id);
        else showStatus("原桌面画面已变化，应用任务仍保留，可重新点按窗口继续。");
    }

    private static android.view.Surface duplicateOutput(android.view.Surface source) {
        android.os.Parcel parcel = android.os.Parcel.obtain();
        try {
            parcel.writeTypedObject(source, 0); parcel.setDataPosition(0);
            return parcel.readTypedObject(android.view.Surface.CREATOR);
        } catch (RuntimeException unavailable) { return null; }
        finally { parcel.recycle(); }
    }

    private static Bundle findWindow(ArrayList<Bundle> windows, int id) {
        for (Bundle window : windows) if (window != null && window.getInt("window_id", -1) == id) return window;
        return null;
    }

    /** Same-query strict full-pool decoding; legacy four-window projections are never high-ID proof. */
    private static ArrayList<Bundle> poolWindowsOrNull(Bundle status) {
        if (status == null) return null;
        try { return AtomicWorkbenchClient.recoveryPoolWindows(status); }
        catch (IllegalArgumentException incomplete) { return null; }
    }

    private static Bundle poolStatus(Bundle status) {
        if (poolWindowsOrNull(status) != null) return status;
        Bundle unknown = status == null ? new Bundle() : new Bundle(status);
        unknown.putBoolean("success", false); unknown.putBoolean("operation_unconfirmed", true);
        unknown.putString("message", "完整工作区状态尚未确认，原窗口和任务已保留。");
        return unknown;
    }

    private static Bundle outputIdentity(Bundle window) {
        Bundle expected = new Bundle();
        expected.putInt("display_id", window.getInt("display_id", -1));
        expected.putInt("user_id", window.getInt("user_id", -1));
        expected.putString("display_name", window.getString("display_name", ""));
        expected.putString("display_unique_id", window.getString("display_unique_id", ""));
        return expected;
    }

    private void parkWorkspaceOutputs() {
        cancelTaskStorageRecheck();
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        outputsParked = true; outputsSyncing = false; outputFocusPending = outputSyncAgain = false;
        ++outputTransition;
        final long sequence = ++outputSequence, session = sessionGeneration;
        final AtomicWorkbenchClient connected = client;
        if (connected == null) return;
        for (Slot slot : slots) slot.ready = false;
        WORKER.execute(() -> {
            if (destroyed || closing || session != sessionGeneration || connected != client) return;
            try { connected.parkUi(sequence); }
            catch (Exception unavailable) { lifecycleDiagnostic("UI_OUTPUT_PARK_PENDING", "acknowledged=false"); }
        });
    }

    private void publishGestureTarget() {
        AtomicWorkbenchClient connected = client;
        if (connected == null) return;
        int id = model.mainWindowId();
        if (mainReady() && !exitRequested && !waitingForCleanup)
            connected.publishGestureTarget(slots[id].displayId, id, getTaskId(), slots[id].displayUniqueId);
        else connected.clearGestureTarget();
    }

    private AtomicWorkbenchAppRepository.App findApp(String key) {
        if (key != null) for (AtomicWorkbenchAppRepository.App app : apps) if (key.equals(app.key())) return app;
        return null;
    }

    private AtomicWorkbenchAppRepository.App findDisplayApp(String component) {
        AtomicWorkbenchAppRepository.App exact = findApp(component);
        if (exact != null) return exact;
        ComponentName name = ComponentName.unflattenFromString(component == null ? "" : component);
        if (name != null) for (AtomicWorkbenchAppRepository.App app : apps)
            if (app.component.getPackageName().equals(name.getPackageName())) return app;
        return null;
    }

    private int findRunningApp(AtomicWorkbenchAppRepository.App app) {
        for (Slot slot : slots) if (model.hasWindow(slot.id) && slot.runningPackages.contains(app.component.getPackageName())) return slot.id;
        return model.find(app.key());
    }

    private void launchApp(AtomicWorkbenchAppRepository.App app, int taskId) {
        launchApp(app, taskId, null);
    }

    private void launchApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof) {
        launchApp(app,taskId,proof,null);
    }

    private void launchApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof, AtomicWorkbenchMediaOpenRequest mediaOpen) {
        launchSourceApp(app,taskId,proof,AtomicWorkbenchWorkspaceOpenRequest.media(mediaOpen));
    }

    private void launchSourceApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof, AtomicWorkbenchWorkspaceOpenRequest mediaOpen) {
        launchSourceApp(app, taskId, proof, mediaOpen, -1);
    }

    private void launchSourceApp(AtomicWorkbenchAppRepository.App app, int taskId, EntryProof proof,
            AtomicWorkbenchWorkspaceOpenRequest mediaOpen, int exactTarget) {
        if (!canInteract() || app == null) return;
        operationNotice = null;
        if (mediaOpen != null && (!mediaOpen.component.equals(app.key()) || !mediaOpen.fresh(SystemClock.elapsedRealtime()))) {
            showStatus("来源打开请求已过期，请重新点按来源。"); return;
        }
        presentationNeedsRetry = false;
        dismissHomeTransitionCover();
        nativeHomePending = false;
        if (proof == null && taskId <= 0) entryProblemText = null;
        int running = findRunningApp(app);
        if (running >= 0) {
            if (exactTarget >= 0) placeAppAt(app, exactTarget);
            else focusSourceAppWindow(running, app.component, mediaOpen, proof);
            return;
        }
        AtomicWorkbenchWorkspaceModel.LaunchPlan plan = exactTarget < 0 ? model.planLaunch(app.key()) : model.planLaunchAt(app.key(), exactTarget);
        if (!plan.accepted()) {
            if (exactTarget < 0 && proof == null && taskId <= 0 && mediaOpen == null) chooseAppDestination(app);
            else showStatus("目标位置尚未释放或来源请求已变化，请重新选择。");
            return;
        }
        if (plan.existing) {
            if (mediaOpen == null) focusWindow(plan.windowId, proof); else focusSourceAppWindow(plan.windowId,app.component,mediaOpen,proof);
            return;
        }
        Slot slot = slots[plan.windowId];
        if (pendingHomeSurfaces[plan.windowId]) { showStatus("此窗口的原分配结果尚未确认，请稍后核对或退出恢复。"); return; }
        hideHostKeyboard(); cancelGesture();
        final int previousMain = model.mainWindowId();
        final boolean previousDesktop = model.desktopVisible(), previousExpanded = model.mainExpanded();
        final Roles previousRoles = presentationRoles();
        Receipt launchBefore = presentationPolicy.begin(plan.windowId, sessionGeneration, epoch + 1, presentationRoles(), presentationLease(plan.windowId));
        if (!model.commitLaunch(plan)) { presentationPolicy.cancel(launchBefore); return; }
        final Receipt launchPresentation = proposalPresentation(launchBefore);
        slot.ready = false; slot.message = "正在打开" + app.label + "…";
        busy = true; focusedWindow = -2;
        int request = ++epoch;
        final long session = sessionGeneration;
        Runnable dispatch = () -> {
            android.view.Surface output = slot.surface.getHolder().getSurface();
        WORKER.execute(() -> {
            Bundle result;
            boolean attemptedOpen = false;
            try {
                if (ResetWriteFence.stale(launchGeneration)) throw new IllegalStateException("配置已重置，请重新进入工作台");
                if (proof != null || taskId > 0) requireCurrentEntry(proof);
                AtomicWorkbenchClient connected = ensureClient(session);
                if (!mutationAllowed(request)) result = failure("工作区已离开，正在恢复任务");
                else {
                    // Root authorization/connection can finish much later than the triggering gesture.
                    // Never turn an expired original-task handoff into a fresh application launch.
                    if (proof != null || taskId > 0) requireCurrentEntry(proof);
                    if (mediaOpen != null && !workspaceOpenDescriptorCurrent(mediaOpen))
                        throw new EntryRejected("来源或打开时限已变化，请重新点按来源。");
                    if(!AtomicWorkbenchAppRepository.current(getApplicationContext(),app))
                        throw new IllegalStateException("应用入口已卸载、替换或失效，请重新打开应用列表。");
                    attemptedOpen = true;
                    result = mediaOpen != null
                            ? mediaOpen.open(connected,plan.windowId,output,displayWidth,displayHeight,density,app.component)
                            : taskId > 0
                            ? connected.openTaskWindow(plan.windowId, output, displayWidth, displayHeight, density, app.component, taskId)
                            : connected.openWindow(plan.windowId, output, displayWidth, displayHeight, density, app.component);
                }
            } catch (EntryRejected expired) {
                result = failure(expired.getMessage()); result.putBoolean(mediaOpen == null ? "entry_rejected" : mediaOpen.rejectedKey(), true);
            } catch (CleanupPending pending) { result = cleanupPending(); }
            catch (Exception error) {
                result = failure("应用打开结果尚未确认：" + safeMessage(error));
                if (mediaOpen != null && attemptedOpen) result.putBoolean("operation_unconfirmed",true);
            }
            Bundle response = result;
            boolean openAttempted = attemptedOpen;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || request != epoch || !active || closing) return;
                if (pendingAppSurfaceLaunch != null && pendingAppSurfaceLaunch.request == request
                        && pendingAppSurfaceLaunch.session == session) pendingAppSurfaceLaunch = null;
                busy = false;
                if (!response.getBoolean("success", false)) presentationPolicy.cancel(launchPresentation);
                if (mediaOpen != null && response.getBoolean("operation_unconfirmed",false)) {
                    operationNotice = "来源打开结果尚未确认，原窗口和任务已保留，请核对后再操作。";
                    showStatus(operationNotice);
                    renderWorkspace(); schedulePoll(); return;
                }
                if (response.getBoolean(mediaOpen==null?"media_open_rejected":mediaOpen.rejectedKey(),false)) {
                    if (plan.replacesEmptyHome) model.rollbackEmptyHomeReplacement(plan);
                    else if (response.getInt("display_id",-1)<=0) {model.removeWindow(plan.windowId);slots[plan.windowId].clear();}
                    if (response.containsKey("display_id")) applyWindowStatus(plan.windowId,response);
                    showStatus(response.getString("message","来源已变化，请重新点按来源。"));
                    renderWorkspace(); schedulePoll(); return;
                }
                if (response.getBoolean("cleanup_pending", false)) {
                    if (response.getBoolean("no_session", !plan.replacesEmptyHome)) {
                        model.removeWindow(plan.windowId); slots[plan.windowId].clear();
                    } else if (plan.replacesEmptyHome) model.rollbackEmptyHomeReplacement(plan);
                    showCleanupPending(response.getBoolean("cleanup_barrier", false));
                    renderWorkspace(); schedulePoll(); return;
                }
                if (response.getBoolean("entry_rejected", false)) {
                    // No OPEN was issued. Other live windows and their recovery ownership stay intact.
                    if (plan.replacesEmptyHome) model.rollbackEmptyHomeReplacement(plan);
                    else { model.removeWindow(plan.windowId); slots[plan.windowId].clear(); }
                    if (incomingProof == proof) rejectIncoming(response.getString("message", "旧手势请求已取消，请重新滑入。"));
                    else showStatus(response.getString("message", "旧手势请求已取消，请重新滑入。"));
                    renderWorkspace(); schedulePoll(); return;
                }
                boolean failedHomeReplacement = plan.replacesEmptyHome && !response.getBoolean("success", false);
                boolean retainedHome = failedHomeReplacement
                        && (response.getBoolean("home_only", false)
                            || response.getBoolean("existing_session_preserved", false))
                        && response.getInt("display_id", -1) > 0;
                boolean unknownReplacement = failedHomeReplacement && !response.containsKey("home_only");
                if (retainedHome || unknownReplacement) model.rollbackEmptyHomeReplacement(plan);
                applyWindowStatus(plan.windowId, response);
                if (!response.getBoolean("success", false)) {
                    restoreNotice = response.getString("message", "应用未打开。请关闭并恢复窗口后重试。");
                    if (plan.windowId >= 4) restoreNotice += " 副窗数量设置已保留，当前连接尚未确认此窗口可用。";
                    showStatus(restoreNotice);
                    if (retainedHome) {
                        // A new native app may have occupied the formerly empty HOME display.
                        // Keep its real tasks and recovery record; the failed proposal owns nothing.
                        if (response.containsKey("focused_window_id")) focusedWindow = response.getInt("focused_window_id", -2);
                    } else if (unknownReplacement) {
                        recoveryPending = true;
                        showStatus(restoreNotice + "。未确认原工作区状态，点此重试恢复任务。");
                    } else if (openAttempted && client != null) requestCloseWindow(plan.windowId);
                    else {
                        recoveryPending = true;
                        if (taskId > 0) requestCloseAll(false, "launch_failure");
                    }
                } else if (slot.ready) {
                    int focus = plan.exactPlacement ? model.mainWindowId() : plan.windowId;
                    if (focus == plan.windowId) pendingPresentationFocus = launchPresentation;
                    else presentationPolicy.cancel(launchPresentation);
                    focusWindow(focus, proof);
                }
                else presentationPolicy.cancel(launchPresentation);
                renderWorkspace(); schedulePoll(); tryIncoming();
            }));
        });
        };
        PendingAppSurfaceLaunch pending = new PendingAppSurfaceLaunch(plan, launchPresentation, request,
                session, previousMain, previousDesktop, previousExpanded, previousRoles, dispatch);
        pendingAppSurfaceLaunch = pending;
        // This can synchronously notify a recovered producer; dispatch waits until the real role layout is requested.
        try { slot.surface.getHolder().setFixedSize(slot.displayWidth, slot.displayHeight); }
        catch (RuntimeException unavailable) { cancelPendingAppSurfaceLaunch(true); return; }
        showStatus(null); renderWorkspace();
        pending.layoutPrepared = true;
        continuePendingAppSurfaceLaunch();
    }

    /** Real Surface callbacks may complete this request; they never repeat an OPEN already submitted. */
    private void continuePendingAppSurfaceLaunch() {
        PendingAppSurfaceLaunch pending = pendingAppSurfaceLaunch;
        if (pending == null || pending.dispatched || !pending.layoutPrepared) return;
        int id = pending.plan.windowId;
        Lease actual = presentationLease(id);
        boolean sameLease = pending.lease == null ? actual == null : pending.lease.equals(actual);
        if (destroyed || !active || closing || exitRequested || recoveryPending || waitingForCleanup
                || surfaceUnavailable || outputsSyncing || outputsParked
                || pending.request != epoch || pending.session != sessionGeneration || pending.connected != client
                || pending.reset != launchGeneration || ResetWriteFence.stale(pending.reset)
                || pending.entry != presentationPolicy.entryGeneration()
                || !pending.expectedRoles.equals(presentationRoles())
                || !pending.plan.component.equals(model.component(id)) || !sameLease
                || slots[id].surfaceLifecycle < pending.initialLifecycle
                || slots[id].surfaceLifecycle > pending.initialLifecycle + 1) {
            cancelPendingAppSurfaceLaunch(true); return;
        }
        // A first output has no frames until the original OPEN creates its producer. Validity is never relaxed.
        if (!slots[id].surface.getHolder().isValid()) return;
        pending.dispatched = true; // Retire the callback's right to submit before running the original continuation.
        pending.dispatch.run();
        if (pending.outputSyncRequested) main.post(this::syncWorkspaceOutputs);
    }

    /** Only a provably unissued, unchanged local proposal can be undone. Native owners are never cleared here. */
    private void cancelPendingAppSurfaceLaunch(boolean redraw) {
        PendingAppSurfaceLaunch pending = pendingAppSurfaceLaunch;
        if (pending == null || pending.dispatched) return;
        pendingAppSurfaceLaunch = null;
        if (pending.request != epoch || pending.session != sessionGeneration) return;
        int id = pending.plan.windowId;
        Lease actual = presentationLease(id);
        boolean sameLease = pending.lease == null ? actual == null : pending.lease.equals(actual);
        if (pending.connected == client && pending.expectedRoles.equals(presentationRoles()) && sameLease
                && pending.plan.component.equals(model.component(id))) {
            // No WORKER OPEN was submitted. Remove only this local component proposal, or retain its original HOME.
            if (pending.plan.replacesEmptyHome) model.rollbackEmptyHomeReplacement(pending.plan);
            else if (pending.lease == null) { model.removeWindow(id); slots[id].clear(); }
            if (pending.previousMain != id && model.hasWindow(pending.previousMain)) model.promote(pending.previousMain);
            if (model.mainWindowId() == pending.previousMain && pending.previousDesktop) model.showDesktop();
            if (model.mainWindowId() == pending.previousMain && pending.previousExpanded) model.setMainExpanded(true);
            // The two promotion swaps restore the old main and full side order; no role is reconstructed by ID alone.
            if (!pending.previousRoles.equals(presentationRoles())) {
                showStatus("工作区角色仍未确认，原窗口和任务已保留。");
            }
            presentationPolicy.observeRoles(presentationRoles());
        }
        presentationPolicy.cancel(pending.presentation);
        busy = false; ++epoch;
        if (redraw && active && !destroyed && !closing) {
            showStatus("应用打开请求已变化，未发起新的打开。原窗口和任务已保留。");
            renderWorkspace(); schedulePoll();
            if (pending.outputSyncRequested) main.post(this::syncWorkspaceOutputs);
        }
    }

    /** Only called on WORKER, shared by launches and media to prevent duplicate root sessions. */
    private AtomicWorkbenchClient ensureClient(long session) throws Exception {
        if (session != sessionGeneration) throw new IllegalStateException("工作区入口已更新");
        if (destroyed || !active || closing || surfaceUnavailable || exitRequested || recoveryPending || ResetWriteFence.stale(launchGeneration))
            throw new IllegalStateException("工作区已离开或配置已变化");
        AtomicWorkbenchClient connected = client;
        if (connected != null) return connected;
        if (AtomicWorkbenchCleanup.pending()) throw new CleanupPending();
        if (destroyed || !active || closing || surfaceUnavailable || exitRequested || ResetWriteFence.stale(launchGeneration))
            throw new IllegalStateException("工作区已离开或配置已变化");
        try { connected = AtomicWorkbenchClient.connect(getApplicationContext()); }
        catch (Exception failed) {
            synchronized (sessionLock) { if (session == sessionGeneration) connectionRetryRequired = true; }
            throw failed;
        }
        // A slow authorization may complete after explicit exit or a new singleTask entry.
        // Such a client belongs only to cleanup and can never enter the next UI generation.
        synchronized (sessionLock) {
            if (session != sessionGeneration || destroyed || exitRequested || closing) {
                AtomicWorkbenchCleanup.take(connected, "abandoned_connect");
                throw new IllegalStateException("工作区入口已更新，手机正在释放连接");
            }
            client = connected;
            connectionRetryRequired = false;
            AtomicWorkbenchClient established = connected;
            connected.setFailureListener(message -> handleConnectionFailure(established, session, message));
        }
        return connected;
    }

    /** A failed session leaves display/journal recovery with the phone cleanup owner. */
    private void handleConnectionFailure(AtomicWorkbenchClient established, long session, String message) {
        synchronized (sessionLock) {
            if (destroyed || session != sessionGeneration || client != established
                    || connectionCleanupClient == established && connectionCleanupSession == session) return;
            connectionCleanupClient = established; connectionCleanupSession = session;
            recoveryPending = waitingForCleanup = true;
            ++epoch; busy = false; focusedWindow = -2;
            ++outputTransition; outputFocusPending = false;
        }
        try {
            cancelTaskStorageRecheck();
            clearHomePresentation(); dismissHomeTransitionCover();
            cancelGesture(); main.removeCallbacks(poll); stopMedia();
            for (Slot item : slots) item.ready = false;
            showStatus("工作区连接中断，手机正在后台归还任务。未确认前会保留恢复责任，可直接退出。" + message);
            renderWorkspace();
        } finally {
            AtomicWorkbenchCleanup.take(established, "recovery_retry");
            main.removeCallbacks(cleanupPoll);
            if (active && !destroyed && !exitRequested) main.postDelayed(cleanupPoll, 500L);
        }
    }

    private static final class FocusOutput {
        final android.view.Surface surface;
        final Lease lease;
        final long session, transition, sequence;
        final int lifecycle;
        FocusOutput(android.view.Surface surface, Lease lease, long session, long transition, long sequence, int lifecycle) {
            this.surface = surface; this.lease = lease; this.session = session; this.transition = transition;
            this.sequence = sequence; this.lifecycle = lifecycle;
        }
    }

    private FocusOutput captureFocusOutput(int id) {
        Lease lease = presentationLease(id);
        if (lease == null || !slots[id].surface.getHolder().isValid()) return null;
        android.view.Surface output = duplicateOutput(slots[id].surface.getHolder().getSurface());
        return output == null ? null : new FocusOutput(output, lease, sessionGeneration, outputTransition,
                ++outputSequence, slots[id].surfaceLifecycle);
    }

    private boolean focusOutputCurrent(int id, int request, AtomicWorkbenchClient connected, FocusOutput output) {
        return mutationAllowed(request) && connected == client && output.session == sessionGeneration
                && output.transition == outputTransition && output.lifecycle == slots[id].surfaceLifecycle;
    }

    /** Null means the existing producer was acknowledged; a failure never authorizes focus. */
    private Bundle attachFocusOutput(int id, int request, AtomicWorkbenchClient connected, FocusOutput output) throws Exception {
        if (output == null) return null;
        if (!focusOutputCurrent(id, request, connected, output))
            return focusOutputFailure(id, output.lease, "工作区已变化，未重新连接隐藏窗口。");
        Bundle status = poolStatus(connected.status());
        ArrayList<Bundle> windows = poolWindowsOrNull(status);
        Bundle window = windows == null ? null : findWindow(windows, id);
        Lease lease = output.lease;
        if (window == null || !window.getBoolean("success", false) || window.getBoolean("recovery_pending", false)
                || window.getBoolean("operation_unconfirmed", false) || window.getInt("display_id", -1) != lease.displayId
                || !lease.name.equals(window.getString("display_name", "")) || !lease.unique.equals(window.getString("display_unique_id", ""))
                || !lease.windowSession.equals(window.getString("window_session", ""))
                || !focusOutputCurrent(id, request, connected, output))
            return focusOutputFailure(id, lease, "原窗口身份尚未确认，任务已保留。");
        Bundle attached = connected.updateOutput(id, outputIdentity(window), output.sequence, output.surface);
        if (!attached.getBoolean("success", false) || !attached.getBoolean("output_attached_known", false)
                || !attached.getBoolean("output_attached", false) || attached.getBoolean("output_transition_pending", true)
                || attached.getBoolean("recovery_pending", false) || attached.getBoolean("operation_unconfirmed", false)
                || !focusOutputCurrent(id, request, connected, output))
            return focusOutputFailure(id, lease, "原窗口画面连接尚未确认，任务已保留；未派发焦点切换。");
        return null;
    }

    private static Bundle focusOutputFailure(int id, Lease lease, String message) {
        Bundle failed = failure(message);
        failed.putInt("window_id", id); failed.putInt("display_id", lease.displayId);
        failed.putString("display_name", lease.name); failed.putString("display_unique_id", lease.unique);
        failed.putString("window_session", lease.windowSession); failed.putBoolean("operation_unconfirmed", true);
        return failed;
    }

    private void focusWindow(int id) {
        focusWindow(id, null);
    }

    private void focusWindow(int id, EntryProof proof) {
        if (hostDragActive || textDeliveryActive || !canInteract() || !model.hasWindow(id) || client == null) return;
        if (slots[id].nativeHome && !prepareHomeSurface(slots[id])) return;
        // Preparing a recovered producer can synchronously run its lifecycle
        // callback. That callback may already own the next operation.
        if (hostDragActive || textDeliveryActive || !canInteract() || !model.hasWindow(id) || client == null) return;
        final boolean requireResumed = resumed;
        final boolean hiddenOutput = !outputPresented(id);
        final FocusOutput revealOutput = hiddenOutput ? captureFocusOutput(id) : null;
        if (hiddenOutput && revealOutput == null) { showStatus("原窗口画面尚未准备，任务已保留。"); return; }
        cancelGesture(); releaseHostSearchInput(); busy = true;
        int request = ++epoch; AtomicWorkbenchClient connected = client;
        final Receipt presentation = beginPresentationFocus(id, request);
        beginHomePresentation(id, request);
        homePresentationReceipt = presentation;
        lifecycleDiagnostic("UI_FOCUS_REQUEST", "window=" + id + ";display=" + slots[id].displayId
                + ";epoch=" + request + ";native_home=" + slots[id].nativeHome + ";" + slots[id].surface.diagnosticState());
        renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try {
                if (!mutationAllowed(request) || hostDragActive || textDeliveryActive || requireResumed && !resumed) result = failure("工作区已离开或正在拖动，未切换焦点");
                else {
                    if (proof != null) requireCurrentEntry(proof);
                    Bundle attachFailure = attachFocusOutput(id, request, connected, revealOutput);
                    if (attachFailure != null) result = attachFailure;
                    else if (!mutationAllowed(request) || hostDragActive || textDeliveryActive || requireResumed && !resumed) result = failure("工作区已离开或正在拖动，未切换焦点");
                    else { if (proof != null) requireCurrentEntry(proof); result = connected.focusWindow(id); }
                }
            } catch (EntryRejected expired) { result = failure(expired.getMessage()); result.putBoolean("entry_rejected", true); }
            catch (Exception error) { result = failure("窗口切换失败：" + safeMessage(error)); }
            finally { if (revealOutput != null) revealOutput.surface.release(); }
            Bundle response = result;
            lifecycleDiagnostic("UI_FOCUS_RESULT", "window=" + id + ";epoch=" + request
                    + ";success=" + response.getBoolean("success", false) + ";native_home=" + response.getBoolean("native_home", false)
                    + ";display=" + response.getInt("display_id", -1) + ";home_task=" + response.getInt("home_task_id", -1)
                    + ";readiness_state=" + readinessText(response, "readiness_state")
                    + ";readiness_error=" + readinessText(response, "readiness_error"));
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || request != epoch || connected != client || closing || !active) return;
                busy = false;
                if (response.getBoolean("entry_rejected", false)) {
                    presentationPolicy.cancel(presentation); clearHomePresentation(); dismissHomeTransitionCover();
                    showStatus(response.getString("message", "旧手势请求已取消，请重新滑入。"));
                    renderWorkspace(); schedulePoll(); tryIncoming(); return;
                }
                applyWindowStatus(id, response);
                if (response.getBoolean("success", false)) {
                    Receipt confirmed = bindPresentationReply(presentation, id, response);
                    appListRequested = false;
                    if (response.getBoolean("native_home", false)) { homePresentationReceipt = confirmed; acceptHomePresentation(response); }
                    else { clearHomePresentation(); dismissHomeTransitionCover(); boolean promoted = confirmPresentationPromotion(id, confirmed);
                        focusedWindow = id; showStatus(promoted ? null : "工作区请求已变化，未切换主位。"); }
                } else { presentationPolicy.cancel(presentation); clearHomePresentation(); dismissHomeTransitionCover(); focusedWindow = -2; showStatus(response.getString("message", "窗口尚未就绪，请稍后点按切换。")); }
                renderWorkspace(); schedulePoll(); tryIncoming();
            }));
        });
    }

    private void focusAppWindow(int id, ComponentName component) {
        focusAppWindow(id,component,null);
    }

    private void focusAppWindow(int id, ComponentName component, AtomicWorkbenchMediaOpenRequest mediaOpen) {
        focusAppWindow(id, component, mediaOpen, null);
    }

    private void focusAppWindow(int id, ComponentName component, AtomicWorkbenchMediaOpenRequest mediaOpen, EntryProof proof) {
        focusSourceAppWindow(id,component,AtomicWorkbenchWorkspaceOpenRequest.media(mediaOpen),proof);
    }

    private void focusSourceAppWindow(int id, ComponentName component, AtomicWorkbenchWorkspaceOpenRequest mediaOpen, EntryProof proof) {
        if (!canInteract() || !model.hasWindow(id) || client == null) return;
        presentationNeedsRetry = false;
        dismissHomeTransitionCover();
        final boolean hiddenOutput = !outputPresented(id);
        final FocusOutput revealOutput = hiddenOutput ? captureFocusOutput(id) : null;
        if (hiddenOutput && revealOutput == null) { showStatus("原窗口画面尚未准备，任务已保留。"); return; }
        cancelGesture(); releaseHostSearchInput(); busy = true;
        int request = ++epoch; AtomicWorkbenchClient connected = client;
        final Receipt presentation = beginPresentationFocus(id, request); renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try {
                if (!mutationAllowed(request)) result = failure("工作区已离开，未切换应用");
                else {
                    if (proof != null) requireCurrentEntry(proof);
                    Bundle attachFailure = attachFocusOutput(id, request, connected, revealOutput);
                    if (attachFailure != null) result = attachFailure;
                    else if (!mutationAllowed(request)) result = failure("工作区已离开，未切换应用");
                    else {
                        if (proof != null) requireCurrentEntry(proof);
                        result = mediaOpen == null ? connected.focusAppWindow(id, component.flattenToString())
                                : mediaOpen.focus(connected,id,component);
                    }
                }
            } catch (EntryRejected expired) { result = failure(expired.getMessage()); result.putBoolean("entry_rejected", true); }
            catch (Exception error) {
                result = failure("应用切换失败：" + safeMessage(error));
                if (mediaOpen != null) result.putBoolean("operation_unconfirmed", true);
            } finally { if (revealOutput != null) revealOutput.surface.release(); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || request != epoch || closing || !active || connected != client) return;
                if (response.getBoolean("entry_rejected", false)) {
                    presentationPolicy.cancel(presentation); busy = false;
                    showStatus(response.getString("message", "旧手势请求已取消，请重新滑入。"));
                    renderWorkspace(); schedulePoll(); tryIncoming(); return;
                }
                if (mediaOpen != null && response.getBoolean("operation_unconfirmed", false)) {
                    presentationPolicy.cancel(presentation);
                    busy = false; focusedWindow = -2;
                    operationNotice = "来源切换结果尚未确认，原窗口和任务已保留，请核对后再操作。";
                    showStatus(operationNotice); renderWorkspace(); schedulePoll(); return;
                }
                busy = false; applyWindowStatus(id, response);
                if (response.getBoolean("success", false)) {
                    boolean promoted = confirmPresentationPromotion(id, bindPresentationReply(presentation, id, response));
                    focusedWindow = id; appListRequested = false; showStatus(promoted ? null : "工作区请求已变化，未切换主位。");
                } else { presentationPolicy.cancel(presentation); focusedWindow = -2; showStatus(response.getString("message", "应用尚未就绪，请重试。")); }
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private void showDesktop() {
        entryProblemText = null;
        if (presentationNeedsRetry) { retryHomePresentation(); return; }
        // A retained HOME can sit behind an app. Focusing that display leaves the app in front.
        showNativeHome(-1);
    }

    private void retryHomePresentation() {
        if (!canInteract()) return;
        int id = homePresentationRetryWindow;
        if (id < 0 || id >= COUNT) { presentationNeedsRetry = false; showNativeHome(-1); return; }
        lifecycleDiagnostic("HOME_PRESENTATION_RETRY", "window=" + id + ";display=" + slots[id].displayId
                + ";home_task=" + slots[id].homeTaskId + ";readiness_generation_nanos=" + slots[id].homeReadinessGenerationNanos);
        // Focusing a retained HOME preserves the WM lease/generation. Reattaching
        // its Surface would create a new lease and discard a valid static frame.
        if (client != null && model.hasWindow(id) && slots[id].displayId > 0 && slots[id].nativeHome) focusWindow(id);
        else showNativeHome(id == model.mainWindowId() ? -1 : model.sideIndexOf(id));
    }

    private void openEmptyWorkspace(int id) {
        if (!canInteract() || model.hasWindow(id) && !slots[id].retainedEmptyTaskDisplay) return;
        showNativeHome(model.sideIndexOf(id));
    }

    private void tryNativeHome() {
        if (!nativeHomePending || incomingPending || pendingLayoutProof != null || entryProblemText != null || !canInteract()) return;
        int id = model.mainWindowId();
        if (slots[id].surface.isAvailable()) showNativeHome(-1);
    }

    private void showNativeHome(int emptySide) {
        if (!canInteract()) return;
        int id = emptySide < 0 ? model.mainWindowId() : model.sideWindowId(emptySide);
        if (pendingTaskAllocations[id] != null) { showStatus("接收窗口分配结果尚未确认，请稍后核对或退出恢复。"); return; }
        Slot slot = slots[id];
        if (!prepareHomeSurface(slot)) return;
        if (!canInteract()) return; // A recovered Surface callback may have started HOME already.
        android.view.Surface output = slot.surface.getHolder().getSurface();
        if (output == null || !output.isValid()) { showStatus("桌面画面正在准备，请稍后重试。"); return; }
        nativeHomePending = false; appListRequested = false;
        cancelGesture(); hideHostKeyboard(); busy = true; focusedWindow = -2;
        pendingHomeSurfaces[id] = true;
        int request = ++epoch;
        final Receipt presentation = beginPresentationFocus(id, request);
        beginHomePresentation(id, request);
        homePresentationReceipt = presentation;
        final long session = sessionGeneration;
        showStatus("正在打开手机桌面…"); renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try {
                AtomicWorkbenchClient connected = ensureClient(session);
                result = !mutationAllowed(request) ? failure("工作区已离开，正在恢复任务")
                        : connected.showNativeHome(id, output, displayWidth, displayHeight, density);
            } catch (CleanupPending pending) { result = cleanupPending(); }
            catch (Exception error) { result = failure("桌面未打开：" + safeMessage(error)); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || !active || closing || request != epoch) return;
                busy = false;
                if (response.getBoolean("cleanup_pending", false)) {
                    clearHomePresentation();
                    dismissHomeTransitionCover();
                    pendingHomeSurfaces[id] = false;
                    if (response.getBoolean("no_session", !model.hasWindow(id))) {
                        model.removeWindow(id); slot.clear();
                    }
                    showCleanupPending(response.getBoolean("cleanup_barrier", false));
                    renderWorkspace(); schedulePoll(); return;
                }
                if (response.getInt("display_id", -1) > 0) {
                    model.setHostedWindow(id, true);
                    pendingHomeSurfaces[id] = false; // Responsibility has transferred to the hosted model slot.
                } else if (response.containsKey("display_id") && !response.getBoolean("recovery_pending", false)) {
                    pendingHomeSurfaces[id] = false; // Backend explicitly confirmed that no display remains.
                }
                applyWindowStatus(id, response);
                if (response.getBoolean("success", false)) {
                    homePresentationReceipt = bindHomePresentationReply(presentation, id, response);
                    acceptHomePresentation(response);
                } else { presentationPolicy.cancel(presentation); clearHomePresentation(); dismissHomeTransitionCover(); showStatus(response.getString("message", "桌面未打开，请重试或退出恢复。")); }
                renderWorkspace(); schedulePoll();
            }));
        });
    }

    private boolean prepareHomeSurface(Slot slot) {
        String reason = "surface_not_available";
        try {
            // A previous setDefaultBufferSize failure can be repaired with the
            // same requested size; status polling must not configure the buffer.
            slot.surface.getHolder().setFixedSize(slot.displayWidth, slot.displayHeight);
            if (slot.surface.getHolder().isValid()) return true;
        } catch (RuntimeException unavailable) { reason = unavailable.getClass().getSimpleName(); }
        presentationNeedsRetry = true; homePresentationRetryWindow = slot.id;
        lifecycleDiagnostic("HOME_SURFACE_RETRY_REQUIRED", "window=" + slot.id + ";reason=" + reason + ";" + slot.surface.diagnosticState());
        showStatus("桌面显示缓冲尚未就绪，点此重试。"); renderWorkspace();
        return false;
    }

    private void beginHomePresentation(int id, int request) {
        presentationNeedsRetry = false;
        captureHomeTransitionCover();
        clearHomePresentation();
        Slot slot = slots[id];
        homePresentationWindow = id; homePresentationEpoch = request;
        homePresentationStarted = SystemClock.elapsedRealtime();
        homePresentationStartedUptime = SystemClock.uptimeMillis();
        homePresentationFrame = slot.surface.frameCount();
        homePresentationSurfaceLifecycle = slot.surfaceLifecycle;
        homePresentationAllowReuse = canReuseHomeFrame(slot);
        long initialProducer = slot.surface.lastFrameTimestampNanos();
        homePresentationLastProducerNanos = initialProducer > 0 && initialProducer <= slot.surface.lastFrameObservedNanos() ? initialProducer : 0L;
        homePresentationRetryWindow = -1;
        homePresentationLastWaitLog = 0; homePresentationLastLoggedReason = homePresentationRejectReason = "";
    }

    /** Freeze only the currently displayed in-memory buffer while its HOME leaves that VD. */
    private void captureHomeTransitionCover() {
        if (homeTransitionCover == null || homeTransitionBitmap != null) return;
        Slot source = slots[model.mainWindowId()];
        if (!model.hasWindow(source.id) || !source.wasActive || !source.ready
                || source.surface.frameCount() <= 0 || !source.surface.isAvailable()
                || (source.nativeHome && !canReuseHomeFrame(source))) return;
        try {
            Bitmap frame = source.surface.getBitmap();
            if (frame == null) return;
            homeTransitionBitmap = frame;
            homeTransitionCover.setImageBitmap(frame);
            homeTransitionCover.setVisibility(View.VISIBLE);
            lifecycleDiagnostic("HOME_TRANSITION_COVER", "source_window=" + source.id
                    + ";source_display=" + source.displayId + ";buffer=in_memory;persisted=false");
        } catch (RuntimeException | OutOfMemoryError unavailable) {
            // Keep the normal preparing placeholder if this optional copy cannot be allocated.
            lifecycleDiagnostic("HOME_TRANSITION_COVER_UNAVAILABLE", "reason=" + unavailable.getClass().getSimpleName());
        }
    }

    private void dismissHomeTransitionCover() {
        if (homeTransitionCover != null) {
            homeTransitionCover.setVisibility(View.GONE);
            homeTransitionCover.setImageDrawable(null);
        }
        // A render thread may still hold the previous drawable; let Bitmap reference counting release it.
        homeTransitionBitmap = null;
    }

    private void acceptHomePresentation(Bundle response) {
        busy = true; homePresentationState = new Bundle(response);
        if (!completeHomePresentation()) {
            showStatus("正在准备桌面画面…");
            main.postDelayed(homePresentationPoll, 100L);
        }
    }

    private boolean completeHomePresentation() {
        int id = homePresentationWindow;
        if (id < 0 || homePresentationEpoch != epoch || !active || closing || destroyed || homePresentationState == null) return false;
        Slot slot = slots[id];
        boolean sameSurface = slot.surfaceLifecycle == homePresentationSurfaceLifecycle;
        boolean configuredGeometry = slot.surface.isFrameFromConfiguredGeometry();
        boolean sameTask = slot.homeTaskId >= 0 && slot.homeTaskId == homePresentationState.getInt("home_task_id", -1);
        boolean sameDisplay = slot.displayId > 0 && slot.displayId == homePresentationState.getInt("display_id", -1)
                && !slot.displayUniqueId.isEmpty() && slot.displayUniqueId.equals(homePresentationState.getString("display_unique_id", ""));
        long generation = homePresentationState.getLong("readiness_generation_nanos", -1L);
        long backendRequest = homePresentationState.getLong("readiness_request_nanos", -1L);
        boolean sameGeneration = generation > 0 && backendRequest > 0 && generation >= backendRequest
                && generation == slot.homeReadinessGenerationNanos && backendRequest == slot.homeReadinessRequestNanos;
        long producerRaw = slot.surface.lastFrameTimestampNanos();
        boolean producerClockValid = producerRaw > 0 && producerRaw <= slot.surface.lastFrameObservedNanos() && producerRaw <= System.nanoTime()
                && producerRaw >= homePresentationLastProducerNanos;
        if (producerClockValid) homePresentationLastProducerNanos = producerRaw;
        long drawBoundary = homeDrawBoundary(homePresentationState);
        // Keep the backend's migration/draw boundary across a static-HOME focus
        // retry. Clicking later is not evidence that this retained buffer is old.
        boolean producerAfterDraw = drawBoundary > 0 && producerRaw > 0 && producerRaw / 1000000L >= drawBoundary
                && producerRaw >= generation && producerRaw >= backendRequest;
        boolean newFrame = slot.surface.frameCount() > homePresentationFrame;
        boolean reusedFrame = homePresentationAllowReuse && canReuseHomeFrame(slot)
                && slot.presentedHomeDrawBoundary >= drawBoundary && drawBoundary > 0
                && homePresentationState.getBoolean("home_reused_visible", false);
        boolean consumed = sameSurface && sameTask && sameDisplay && sameGeneration
                && slot.surface.frameCount() > 0 && configuredGeometry && producerClockValid && (producerAfterDraw || reusedFrame);
        boolean drawn = homePresentationState.getBoolean("home_surface_ready", false);
        boolean wallpaper = homePresentationState.getBoolean("wallpaper_interface_ready", false)
                && homePresentationState.getBoolean("wallpaper_frame_verified", false);
        homePresentationRejectReason = !slot.ready ? "window_not_ready" : !slot.nativeHome ? "not_native_home"
                : !sameSurface ? "surface_changed" : !sameTask ? "task_mismatch" : !sameDisplay ? "display_identity_mismatch"
                : !sameGeneration ? "readiness_generation_mismatch" : !drawn ? "home_not_drawn"
                : !wallpaper ? "wallpaper_not_ready" : slot.surface.frameCount() <= 0 ? "no_consumed_frame"
                : !configuredGeometry ? "buffer_geometry_unobserved"
                : !producerClockValid ? "producer_clock_invalid"
                : !consumed ? "producer_before_backend_draw" : "";
        if (!homePresentationRejectReason.isEmpty()) {
            long now = SystemClock.elapsedRealtime();
            if (!homePresentationRejectReason.equals(homePresentationLastLoggedReason) || now - homePresentationLastWaitLog >= 1000L) {
                homePresentationLastWaitLog = now; homePresentationLastLoggedReason = homePresentationRejectReason;
                homePresentationDiagnostic("HOME_PRESENTATION_WAIT", slot, homePresentationRejectReason, "");
            }
            return false;
        }
        homePresentationDiagnostic("HOME_PRESENTATION_READY", slot, "accepted",
                ";new_frame=" + newFrame + ";retained_frame=" + !newFrame + ";reused_frame=" + reusedFrame
                + ";evidence=texture_timestamp_and_wm_drawn;visual_content=UNVERIFIED");
        slot.presentedHomeTaskId = slot.homeTaskId;
        slot.presentedHomeSurfaceLifecycle = slot.surfaceLifecycle;
        slot.presentedHomeDisplayId = slot.displayId; slot.presentedHomeDisplayUniqueId = slot.displayUniqueId;
        slot.presentedHomeReadinessGenerationNanos = generation;
        slot.presentedHomeProducerTimestampNanos = producerRaw; slot.presentedHomeDrawBoundary = drawBoundary;
        boolean promoted = confirmPresentationPromotion(id, homePresentationReceipt); focusedWindow = id; busy = false;
        clearHomePresentation(); dismissHomeTransitionCover(); showStatus(promoted ? null : "桌面画面已核对，工作区请求已变化，未切换主位。"); renderWorkspace(); schedulePoll(); tryIncoming();
        return true;
    }

    private static long homeDrawBoundary(Bundle state) {
        if (state == null) return -1L;
        long started = state.getLong("readiness_started_uptime", -1L), home = state.getLong("home_drawn_uptime", -1L),
                wallpaper = state.getLong("wallpaper_drawn_uptime", -1L);
        // isDrawn may predate this module's optional draw callback. Zero is a
        // valid retained-drawn observation; a missing/negative field is not.
        return started > 0 && home >= 0 && wallpaper >= 0 ? Math.max(started, Math.max(home, wallpaper)) : -1L;
    }

    private static String readinessText(Bundle state, String key) {
        if (state == null) return "missing";
        String value = state.getString(key, "");
        return value.length() > 160 ? "oversize" : value.replaceAll("[^A-Za-z0-9_:.|=-]", "_");
    }

    private String homePresentationDetail(Slot slot, String reason) {
        Bundle state = homePresentationState;
        long raw = slot.surface.lastFrameTimestampNanos();
        return "window=" + slot.id + ";display=" + slot.displayId + ";home_task=" + slot.homeTaskId
                + ";epoch=" + homePresentationEpoch + ";reason=" + reason + ";frames=" + slot.surface.frameCount()
                + ";request_frame=" + homePresentationFrame + ";same_surface=" + (slot.surfaceLifecycle == homePresentationSurfaceLifecycle)
                + ";same_task=" + (state != null && slot.homeTaskId == state.getInt("home_task_id", -1))
                + ";same_display=" + (state != null && slot.displayId == state.getInt("display_id", -1) && !slot.displayUniqueId.isEmpty() && slot.displayUniqueId.equals(state.getString("display_unique_id", "")))
                + ";same_generation=" + (state != null && slot.homeReadinessGenerationNanos > 0 && slot.homeReadinessGenerationNanos == state.getLong("readiness_generation_nanos", -1L))
                + ";frame_raw_ns=" + raw + ";producer_ms=" + (raw > 0 ? raw / 1000000L : -1L)
                + ";buffer_geometry_generation=" + slot.surface.bufferGeometryGeneration()
                + ";frame_geometry_generation=" + slot.surface.lastFrameGeometryGeneration()
                + ";configured_geometry_frame=" + slot.surface.isFrameFromConfiguredGeometry()
                + ";geometry_evidence=callback_after_configuration_ack;raster_dimensions=UNVERIFIED"
                + ";draw_boundary=" + homeDrawBoundary(state) + ";request_started_uptime=" + homePresentationStartedUptime
                + ";readiness_generation_nanos=" + slot.homeReadinessGenerationNanos + ";readiness_request_nanos=" + slot.homeReadinessRequestNanos
                + ";home_drawn=" + (state != null && state.getBoolean("home_surface_ready", false))
                + ";wallpaper_drawn=" + (state != null && state.getBoolean("wallpaper_interface_ready", false) && state.getBoolean("wallpaper_frame_verified", false))
                + ";readiness_state=" + readinessText(state, "readiness_state") + ";readiness_error=" + readinessText(state, "readiness_error")
                + ";readiness_reason=" + readinessText(state, "readiness_reason")
                + ";now_nanos=" + System.nanoTime() + ";now_uptime=" + SystemClock.uptimeMillis()
                + ";now_elapsed=" + SystemClock.elapsedRealtime() + ";elapsed_ms=" + (SystemClock.elapsedRealtime() - homePresentationStarted)
                + ";producer_source=sf_virtual_display_monotonic_contract;rom_native_clock=unverified";
    }

    private void homePresentationDiagnostic(String event, Slot slot, String reason, String extra) {
        lifecycleDiagnostic(event, homePresentationDetail(slot, reason) + extra);
        // Keep full buffer metadata in its own bounded record; the shared frame,
        // request epoch and identity correlate it without truncating the gate result.
        lifecycleDiagnostic("HOME_PRESENTATION_BUFFER", "phase=" + event + ";window=" + slot.id
                + ";display=" + slot.displayId + ";home_task=" + slot.homeTaskId + ";epoch=" + homePresentationEpoch
                + ";frame=" + slot.surface.frameCount() + ";" + slot.surface.diagnosticState());
    }

    private boolean canReuseHomeFrame(Slot slot) {
        return slot.nativeHome && slot.ready && slot.surface.frameCount() > 0 && slot.surface.isFrameFromConfiguredGeometry() && slot.homeTaskId >= 0
                && slot.presentedHomeTaskId == slot.homeTaskId
                && slot.presentedHomeSurfaceLifecycle == slot.surfaceLifecycle
                && slot.displayId > 0 && slot.presentedHomeDisplayId == slot.displayId
                && !slot.displayUniqueId.isEmpty() && slot.presentedHomeDisplayUniqueId.equals(slot.displayUniqueId)
                && slot.homeReadinessGenerationNanos > 0 && slot.presentedHomeReadinessGenerationNanos == slot.homeReadinessGenerationNanos
                && slot.presentedHomeProducerTimestampNanos > 0 && slot.surface.lastFrameTimestampNanos() >= slot.presentedHomeProducerTimestampNanos;
    }

    private void pollHomePresentation() {
        int id = homePresentationWindow, request = homePresentationEpoch;
        AtomicWorkbenchClient connected = client;
        if (id < 0 || request != epoch || destroyed || closing || !active || connected == null || homePresentationPolling) return;
        if (SystemClock.elapsedRealtime() - homePresentationStarted > 5000L) {
            homePresentationDiagnostic("HOME_PRESENTATION_TIMEOUT", slots[id], homePresentationRejectReason, "");
            homePresentationRetryWindow = id;
            clearHomePresentation(); presentationNeedsRetry = true; busy = false; focusedWindow = -2;
            dismissHomeTransitionCover();
            showStatus("桌面画面尚未就绪，点此重试或退出恢复。"); renderWorkspace(); schedulePoll(); return;
        }
        homePresentationPolling = true;
        final long pollTicket = ++homePresentationPollGeneration;
        final long session = sessionGeneration;
        WORKER.execute(() -> {
            Bundle result;
            try { result = poolStatus(connected.status()); }
            catch (Exception failure) { result = failure("桌面画面状态读取失败"); }
            Bundle response = result;
            main.post(() -> {
                if (session != sessionGeneration || pollTicket != homePresentationPollGeneration) return;
                homePresentationPolling = false;
                if (homePresentationWindow != id || request != epoch || connected != client || destroyed || closing || !active) return;
                observeTaskStorageScope(response);
                ArrayList<Bundle> windows = poolWindowsOrNull(response);
                boolean observed = false;
                if (windows != null) for (Bundle window : windows) if (window.getInt("window_id", -1) == id) {
                    applyWindowStatus(id, window); homePresentationState = new Bundle(window); observed = true; break;
                }
                if (!observed) {
                    // A transport/missing-window reply cannot refresh earlier ready
                    // evidence. Keep recovery ownership, but require a new observation.
                    homePresentationState = new Bundle(response);
                    homePresentationState.putBoolean("home_surface_ready", false);
                    homePresentationState.putBoolean("wallpaper_interface_ready", false);
                    homePresentationState.putBoolean("wallpaper_frame_verified", false);
                    homePresentationState.putString("readiness_state", "unknown");
                    homePresentationState.putString("readiness_error", windows == null ? "status_unavailable" : "window_missing");
                }
                if (!completeHomePresentation()) main.postDelayed(homePresentationPoll, 100L);
            });
        });
    }

    private void clearHomePresentation() {
        main.removeCallbacks(homePresentationPoll);
        homePresentationWindow = -1; homePresentationState = null;
        homePresentationReceipt = null;
        homePresentationPolling = false; ++homePresentationPollGeneration;
    }

    private void switchToDesktop(int emptySide) {
        if (!canInteract()) return;
        if (model.desktopVisible() && focusedWindow == -1) {
            search.clearFocus(); showStatus(entryProblemText); renderWorkspace(); return;
        }
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        cancelGesture(); hideHostKeyboard(); busy = true;
        int request = ++epoch; AtomicWorkbenchClient connected = client;
        renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try { result = !mutationAllowed(request) ? failure("工作区已离开，未切换焦点")
                    : connected == null ? success() : connected.focusWindow(-1); }
            catch (Exception error) { result = failure("桌面焦点未恢复：" + safeMessage(error)); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || request != epoch || closing || !active || connected != client) return;
                busy = false;
                if (response.getBoolean("success", false)) {
                    if (emptySide >= 0) model.parkMainInEmptySide(emptySide); else model.showDesktop();
                    focusedWindow = -1; showStatus(entryProblemText);
                } else showStatus(response.getString("message", "无法回到桌面，请重试或退出恢复。"));
                renderWorkspace(); schedulePoll(); tryIncoming();
            }));
        });
    }

    private static final class NativeShieldLayoutHold {
        final int id, epoch;
        final long session, sequence, downTime, eventTime;
        final Lease lease;
        final Roles roles;
        final RailSide railSide;
        boolean terminal, cancelled, clicked, deferLogged;
        NativeShieldLayoutHold(int id, int epoch, long session, long sequence, long downTime, long eventTime,
                Lease lease, Roles roles, RailSide railSide) {
            this.id = id; this.epoch = epoch; this.session = session; this.sequence = sequence;
            this.downTime = downTime; this.eventTime = eventTime; this.lease = lease;
            this.roles = roles; this.railSide = railSide;
        }
    }

    private void beginNativeShieldLayout(int id) {
        if (!hostTouchActive || !canInteract() || hostDialogActive || hostDragActive
                || !presentationRoles().isSide(id) || !outputPresented(id) || !model.hasWindow(id) || slots[id].retainedEmptyTaskDisplay) return;
        Lease lease = presentationLease(id);
        if (lease == null) return;
        NativeShieldLayoutHold hold = new NativeShieldLayoutHold(id, epoch, sessionGeneration,
                nativeShieldTouchSequence, nativeShieldDownTime, nativeShieldEventTime, lease,
                presentationRoles(), presentationPolicy.railSide());
        nativeShieldLayoutHold = hold;
        nativeShieldLayoutDiagnostic(hold, "DOWN", hold.eventTime);
    }

    private boolean nativeShieldLayoutCurrent(NativeShieldLayoutHold hold) {
        return hold != null && !hold.cancelled && active && !destroyed && !closing && !surfaceUnavailable
                && !outputsSyncing && !outputsParked && !recoveryPending && !hostDialogActive && !hostDragActive
                && hold.sequence == nativeShieldTouchSequence && hold.session == sessionGeneration && hold.epoch == epoch
                && model.hasWindow(hold.id) && presentationRoles().isSide(hold.id) && outputPresented(hold.id)
                && hold.roles.equals(presentationRoles()) && hold.railSide == presentationPolicy.railSide()
                && hold.lease.equals(presentationLease(hold.id));
    }

    private boolean deferNativeShieldLayout() {
        NativeShieldLayoutHold hold = nativeShieldLayoutHold;
        if (hold == null || hold.cancelled) return false;
        if (!nativeShieldLayoutCurrent(hold)) { cancelGesture(); return false; }
        nativeShieldLayoutDeferred = true;
        if (!hold.deferLogged) {
            hold.deferLogged = true; nativeShieldLayoutDiagnostic(hold, "LAYOUT_DEFER", hold.eventTime);
        }
        return true;
    }

    private boolean acceptNativeShieldClick(int id) {
        NativeShieldLayoutHold hold = nativeShieldLayoutHold;
        if (hold == null) return true; // Preserve existing explicit performClick callbacks without a physical stream.
        if (hold.id != id || hold.clicked || !(hold.terminal || nativeShieldDispatchingUp)
                || !nativeShieldLayoutCurrent(hold)) { cancelNativeShieldLayout("CLICK_REJECT"); return false; }
        hold.clicked = true;
        nativeShieldLayoutDiagnostic(hold, "CLICK_ACCEPT", hold.eventTime);
        return true;
    }

    private void cancelNativeShieldLayout(String stage) {
        NativeShieldLayoutHold hold = nativeShieldLayoutHold;
        if (hold == null || hold.cancelled) return;
        hold.cancelled = true;
        // CANCEL/cancelLongPress alone does not remove View's posted performClick.
        // Keep the tombstone until the terminal FIFO fence retires this stream.
        try { slots[hold.id].shield.cancelPendingInputEvents(); } catch (Throwable unavailable) { }
        nativeShieldLayoutDiagnostic(hold, stage, hold.eventTime);
    }

    private void retireNativeShieldLayout(String stage) {
        NativeShieldLayoutHold hold = nativeShieldLayoutHold;
        cancelNativeShieldLayout(stage);
        if (hold != null) try { slots[hold.id].shield.cancelPendingInputEvents(); } catch (Throwable unavailable) { }
        nativeShieldLayoutHold = null;
        ++nativeShieldTouchSequence; // An older flush cannot retire a new DOWN or a stopped Activity.
    }

    private void finishNativeShieldTouch(MotionEvent event) {
        if (event.getDownTime() != nativeShieldDownTime) return;
        NativeShieldLayoutHold hold = nativeShieldLayoutHold;
        if (hold == null) {
            hostTouchActive = false;
            if (nativeShieldLayoutDeferred) postNativeShieldLayoutFlush(null, nativeShieldTouchSequence, sessionGeneration);
            return;
        }
        hold.terminal = true;
        if (event.getActionMasked() == MotionEvent.ACTION_CANCEL) cancelNativeShieldLayout("CANCEL");
        else nativeShieldLayoutDiagnostic(hold, "UP", event.getEventTime());
        // View.onTouchEvent(UP) has already posted (or synchronously run) its own
        // click. Keep both geometry and hostTouchActive through that callback.
        postNativeShieldLayoutFlush(hold, hold.sequence, hold.session);
    }

    private void postNativeShieldLayoutFlush(NativeShieldLayoutHold expected, long sequence, long session) {
        boolean posted = main.post(() -> {
            if (sequence != nativeShieldTouchSequence || session != sessionGeneration || nativeShieldLayoutHold != expected) return;
            boolean current = expected == null || nativeShieldLayoutCurrent(expected);
            nativeShieldLayoutHold = null; hostTouchActive = false;
            if (expected != null) nativeShieldLayoutDiagnostic(expected, current ? "FLUSH" : "FLUSH_STALE", expected.eventTime);
            // This is fresh layout of the current model, never the old hold's geometry.
            if (nativeShieldLayoutDeferred && active && !destroyed && !closing) layoutWorkspace();
        });
        if (!posted && sequence == nativeShieldTouchSequence && nativeShieldLayoutHold == expected) {
            cancelNativeShieldLayout("FLUSH_UNAVAILABLE"); nativeShieldLayoutHold = null; hostTouchActive = false;
        }
    }

    /** Bounded observation only; live input, queue rejection and IO failures are independent. */
    private void nativeShieldLayoutDiagnostic(NativeShieldLayoutHold hold, String stage, long eventTime) {
        boolean reserved = false;
        try {
            for (;;) {
                int count = NATIVE_SHIELD_DIAGNOSTIC_PENDING.get();
                if (count >= 16) { NATIVE_SHIELD_DIAGNOSTIC_DROPPED.incrementAndGet(); return; }
                if (NATIVE_SHIELD_DIAGNOSTIC_PENDING.compareAndSet(count, count + 1)) { reserved = true; break; }
            }
            final android.content.Context application = getApplicationContext();
            final long generation = launchGeneration;
            final String detail = "stage=" + stage + ";at_uptime=" + SystemClock.uptimeMillis()
                    + ";event_time=" + eventTime + ";down_time=" + hold.downTime + ";slot=" + hold.id
                    + ";stream=" + hold.sequence + ";epoch=" + epoch + ";session=" + sessionGeneration + ";main=" + model.mainWindowId()
                    + ";display=" + hold.lease.displayId + ";workspace_width=" + workspace.getWidth()
                    + ";workspace_height=" + workspace.getHeight() + ";dropped=" + NATIVE_SHIELD_DIAGNOSTIC_DROPPED.get();
            final int window = hold.id, display = hold.lease.displayId, user = android.os.Process.myUid() / 100000;
            APP_READER.execute(() -> {
                try { AtomicWorkbenchDiagnostics.record(application, generation, "UI_NATIVE_SHIELD", window, user, "", display, detail, null); }
                catch (Throwable unavailable) { NATIVE_SHIELD_DIAGNOSTIC_DROPPED.incrementAndGet(); }
                finally { NATIVE_SHIELD_DIAGNOSTIC_PENDING.decrementAndGet(); }
            });
        } catch (Throwable unavailable) {
            if (reserved) NATIVE_SHIELD_DIAGNOSTIC_PENDING.decrementAndGet();
            NATIVE_SHIELD_DIAGNOSTIC_DROPPED.incrementAndGet();
        }
    }

    private boolean canInteract() {
        if (ResetWriteFence.stale(launchGeneration)) { showStatus("配置已重置，请退出恢复后重新进入工作台。"); return false; }
        return active && !destroyed && !surfaceUnavailable && !outputsSyncing && !outputsParked && !busy && !closing && !exitRequested && !recoveryPending && !waitingForCleanup
                && (windowMotion == null || !windowMotion.running());
    }

    private boolean mainReady() {
        int id = model.mainWindowId();
        return active && !destroyed && !surfaceUnavailable && !outputsSyncing && !outputsParked && !slots[id].outputAwaitingFrame
                && (windowMotion == null || !windowMotion.running())
                && !hostDialogActive && hostInputPending == 0 && !ResetWriteFence.stale(launchGeneration)
                && !model.desktopVisible() && !busy && !closing && !recoveryPending
                && focusedWindow == id && slots[id].ready && slots[id].surface.getHolder().isValid()
                && mainLayoutPresented && mainLayoutMatches(id);
    }

    private void onHostDialogInput(boolean visible) {
        invalidateExtractionGeometry();
        hostDialogActive = visible;
        cancelGesture();
        if (client != null) client.clearGestureTarget();
        if (!active || destroyed || closing || surfaceUnavailable) return;
        if (visible || !busy) queueHostInput(visible);
        else schedulePoll();
    }

    /** Preserve every enter/leave in the serial queue, including a fast open/close. */
    private void queueHostInput(boolean enter) {
        AtomicWorkbenchClient connected = client;
        if (connected == null || !active || destroyed || closing || surfaceUnavailable || outputsSyncing || outputsParked) return;
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        final long session = sessionGeneration, sequence = ++hostInputSequence;
        final int request = epoch;
        final int target = enter || model.desktopVisible() ? -1 : model.mainWindowId();
        final String unique = target >= 0 ? slots[target].displayUniqueId : "";
        ++hostInputPending;
        WORKER.execute(() -> {
            Bundle result;
            boolean current = !destroyed && active && !closing && !surfaceUnavailable && !outputsSyncing && !outputsParked
                    && session == sessionGeneration && connected == client && !ResetWriteFence.stale(launchGeneration);
            try {
                // An enter is still necessary if its Dialog has already closed: it supplies
                // the real focus-loss half before the queued restore gains input again.
                if (!current || hostDragActive || textDeliveryActive
                        || !enter && (hostDialogActive || request != epoch)) result = null;
                else result = target == -1 ? connected.focusHostInput() : connected.focusWindow(target);
            } catch (Exception unavailable) { result = failure("输入焦点尚未恢复，应用任务已保留。"); }
            Bundle response = result;
            main.post(() -> {
                hostInputPending = Math.max(0, hostInputPending - 1);
                if (destroyed || session != sessionGeneration || connected != client || closing || !active) return;
                if (response != null && sequence == hostInputSequence && request == epoch
                        && (target < 0 || target == model.mainWindowId() && unique.equals(slots[target].displayUniqueId))) {
                    focusedWindow = response.getBoolean("success", false) ? target : -2;
                    if (!response.getBoolean("success", false)) showStatus(response.getString("message"));
                }
                publishGestureTarget(); schedulePoll();
            });
        });
    }

    private void applicationBack() {
        if (pendingAppSurfaceLaunch != null && !pendingAppSurfaceLaunch.dispatched) {
            cancelPendingAppSurfaceLaunch(true); return;
        }
        if (model.desktopVisible()) {
            if (appListRequested && search.getText().length() > 0) { search.setText(""); return; }
            search.clearFocus(); hideHostKeyboard();
            int id = model.mainWindowId();
            if (!model.hasWindow(id)) showDesktop(); else focusWindow(id);
            return;
        }
        AtomicWorkbenchClient connected = client;
        if (mainReady() && connected != null) { cancelGesture(); connected.keyWindow(model.mainWindowId(), KeyEvent.KEYCODE_BACK); }
    }

    private void requestCloseWindow(int id) {
        requestCloseWindow(id, null);
    }

    private void requestCloseWindow(int id, Runnable afterRecovery) {
        if (destroyed || closing || busy || client == null || !model.hasWindow(id)) return;
        presentationPolicy.invalidate(); pendingPresentationFocus = null;
        cancelGesture(); busy = true; slots[id].ready = false;
        int request = ++epoch; AtomicWorkbenchClient connected = client;
        showStatus("正在关闭窗口并恢复任务…"); renderWorkspace();
        WORKER.execute(() -> {
            Bundle result;
            try { result = connected.closeWindow(id); }
            catch (Exception error) { result = failure("窗口恢复未完成：" + safeMessage(error)); }
            Bundle response = result;
            main.post(() -> completeOperation(request, () -> {
                if (destroyed || request != epoch || closing || connected != client || !active) return;
                busy = false;
                if (restored(response)) {
                    model.removeWindow(id); slots[id].clear(); recoveryPending = false;
                    showStatus(restoreNotice); restoreNotice = null;
                    if (afterRecovery == null && model.desktopVisible()) returnDesktopFocusAfterClose();
                } else {
                    recoveryPending = true;
                    showStatus(response.getString("message", "窗口恢复未完成") + "。点此重试恢复全部任务。");
                }
                renderWorkspace(); schedulePoll();
                if (restored(response) && afterRecovery != null) afterRecovery.run();
            }));
        });
    }

    private void returnDesktopFocusAfterClose() {
        if (!appListRequested) {
            // Wait for a usable Surface, then make one HOME attempt. Its failure clears pending,
            // so an unavailable system hook cannot cause an automatic retry loop.
            nativeHomePending = true; tryNativeHome(); return;
        }
        AtomicWorkbenchClient connected = client; int request = epoch;
        WORKER.execute(() -> {
            Bundle result;
            try { result = !mutationAllowed(request) ? failure("工作区已离开，未切换焦点")
                    : connected == null ? success() : connected.focusWindow(-1); }
            catch (Exception error) { result = failure("桌面焦点未恢复：" + safeMessage(error)); }
            Bundle response = result;
            main.post(() -> {
                if (destroyed || request != epoch || closing || connected != client) return;
                if (response.getBoolean("success", false)) focusedWindow = -1;
                else showStatus(response.getString("message", "请退出并恢复任务后重试。"));
                renderWorkspace();
            });
        });
    }

    private void schedulePoll() {
        main.removeCallbacks(poll);
        if (active && !destroyed && !closing && !presentationNeedsRetry && client != null) main.postDelayed(poll, 1000L);
    }

    private void pollStatus() {
        AtomicWorkbenchClient connected = client;
        if (!active || destroyed || closing || outputsSyncing || outputsParked || busy || polling || taskStorageProbeInFlight != 0L || presentationNeedsRetry || connected == null) { schedulePoll(); return; }
        if (connected.nativeGestureActive()) { publishGestureTarget(); schedulePoll(); return; }
        polling = true; int request = epoch;
        final long session = sessionGeneration;
        final long pollTicket = ++pollGeneration;
        final boolean readTasks = !hostTouchActive && gestureWindow < 0 && pendingTaskOperation == null
                && SystemClock.elapsedRealtime() - taskSnapshotElapsed > 1500L;
        WORKER.execute(() -> {
            Bundle result;
            AtomicWorkbenchTaskUiSnapshot taskSnapshot = null;
            try { result = poolStatus(connected.status()); }
            catch (Exception error) { result = failure("无法读取工作区状态：" + safeMessage(error)); }
            if (readTasks && active && !destroyed && connected == client && request == epoch && !hostTouchActive)
                try { taskSnapshot = new AtomicWorkbenchTaskUiSnapshot(connected.taskShelfState(), AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8); } catch (Exception unavailable) { /* No stale proof is renewed on failure. */ }
            Bundle response = result;
            AtomicWorkbenchTaskUiSnapshot observedTasks = taskSnapshot;
            final long tasksObservedElapsed = SystemClock.elapsedRealtime();
            main.post(() -> {
                if (destroyed || session != sessionGeneration || pollTicket != pollGeneration) return;
                polling = false;
                if (connected != client || closing || request != epoch || !active) return;
                // A poll already in flight must not clear the target or refocus HOME
                // between the native consumer's DOWN and UP/CANCEL.
                if (connected.nativeGestureActive()) { publishGestureTarget(); schedulePoll(); return; }
                observeTaskStorageScope(response);
                if (observedTasks != null) { lastTaskSnapshot = observedTasks; taskSnapshotElapsed = tasksObservedElapsed; }
                extractionInputRevision = response.getLong("input_revision", -1L);
                if (response.containsKey("focused_window_id")) focusedWindow = response.getInt("focused_window_id", -2);
                ArrayList<Bundle> windows = poolWindowsOrNull(response);
                if (windows != null) for (Bundle window : windows) {
                    int id = window.getInt("window_id", -1);
                    if (id >= 0 && id < COUNT && pendingTaskAllocations[id] != null
                            && pendingTaskAllocations[id].equals(window.getString("allocation_id"))
                            && window.getInt("display_id", -1) > 0) {
                        model.setHostedWindow(id, true); pendingHomeSurfaces[id] = false; pendingTaskAllocations[id] = null;
                    }
                    if (id >= 0 && id < COUNT && model.hasWindow(id)) {
                        String state = window.getString("state", "");
                        boolean launching = "prepared".equals(state) || "launching".equals(state);
                        // Back can finish the last Activity while leaving an empty, live VD.
                        // A zero task count before the first confirmed active task is normal startup.
                        if (shouldCloseExitedWindow(id, window)) {
                            requestCloseWindow(id);
                            return; // The close gets its own epoch; do not apply this older snapshot.
                        }
                        if ("closed".equals(window.getString("state"))
                                && window.getInt("display_id", -1) <= 0
                                && !window.getBoolean("recovery_pending", false)) {
                            boolean wasMain = id == model.mainWindowId();
                            if (!slots[id].wasActive && !window.getBoolean("success", false))
                                showStatus(window.getString("message", "应用未能进入工作区，可重新打开或点桌面。"));
                            presentationPolicy.invalidate(); pendingPresentationFocus = null;
                            cancelGesture(); model.removeWindow(id); slots[id].clear();
                            if (wasMain) { returnDesktopFocusAfterClose(); renderWorkspace(); schedulePoll(); return; }
                        } else applyWindowStatus(id, window);
                    }
                }
                if (!response.getBoolean("success", false) && windows == null) {
                    if (response.getBoolean("operation_unconfirmed", false)) {
                        operationNotice = response.getString("message", "工作区状态尚未确认，原任务已保留，请稍后再检查。");
                        showStatus(operationNotice);
                        renderWorkspace(); schedulePoll(); return;
                    }
                    recoveryPending = true;
                    showStatus(response.getString("message", "工作区状态不可用") + "。点此重试恢复任务。");
                }
                int desired = model.mainWindowId(); renderWorkspace();
                if (pendingTaskOperation != null) queryPendingTaskOperation();
                // Physical host input temporarily focuses display 0. A poll between
                // DOWN and UP must not refocus the old main and consume a side tap.
                if (resumed && hostDialogActive && !hostDragActive && focusedWindow != -1 && hostInputPending == 0) {
                    queueHostInput(true);
                    schedulePoll();
                } else if (resumed && !hostDialogActive && !hostDragActive && !textDeliveryActive && hostInputPending == 0 && !hostTouchActive && !model.desktopVisible() && slots[desired].ready
                        && !slots[desired].outputAwaitingFrame && mainLayoutPresented && mainLayoutMatches(desired)
                        && focusedWindow != desired && !recoveryPending) focusWindow(desired);
                else schedulePoll();
            });
        });
    }

    private boolean shouldCloseExitedWindow(int id, Bundle window) {
        String state = window.getString("state", "");
        return slots[id].wasActive && !"prepared".equals(state) && !"launching".equals(state)
                && window.getBoolean("success", false) && !window.getBoolean("operation_unconfirmed", false)
                && !window.getBoolean("retained_empty_task_display", false)
                && (pendingTaskOperation == null || pendingTaskOperation.sourceSlot != id)
                && window.getInt("task_count", -1) == 0 && !window.getBoolean("recovery_pending", false);
    }

    private void applyWindowStatus(int id, Bundle result) {
        Slot slot = slots[id]; String state = result.getString("state", "");
        if (result.getBoolean("success", false) && result.containsKey("window_session"))
            slot.windowSession = result.getString("window_session", "");
        if (result.getBoolean("success", false) && result.containsKey("retained_empty_task_display"))
            slot.retainedEmptyTaskDisplay = result.getBoolean("retained_empty_task_display", false)
                    && result.getInt("task_count", -1) == 0 && result.getInt("display_id", -1) > 0
                    && !result.getBoolean("operation_unconfirmed", false) && !result.getBoolean("recovery_pending", false);
        slot.nativeHome = result.getBoolean("native_home", slot.nativeHome);
        slot.homeTaskId = result.getInt("home_task_id", slot.homeTaskId);
        slot.displayUniqueId = result.getString("display_unique_id", slot.displayUniqueId);
        slot.displayName = result.getString("display_name", "");
        slot.targetUid = result.getInt("target_uid", -1);
        slot.targetTaskId = result.getInt("task_id", -1);
        slot.homeReadinessGenerationNanos = result.getLong("readiness_generation_nanos", slot.homeReadinessGenerationNanos);
        slot.homeReadinessRequestNanos = result.getLong("readiness_request_nanos", slot.homeReadinessRequestNanos);
        slot.topComponent = result.getString("top_component", slot.topComponent);
        int nextDisplay = result.getInt("display_id", slot.displayId);
        ArrayList<String> packages = result.getStringArrayList("running_packages");
        boolean taskSnapshot = result.getBoolean("success", false) && "active".equals(state)
                && nextDisplay > 0 && result.containsKey("display_id")
                && result.getInt("task_count", -1) >= 0 && packages != null
                && !result.getBoolean("recovery_pending", false);
        // A live ordinary app display can later contain only its borrowed HOME. Its
        // lease survives the old app binding; only a confirmed close releases it.
        if (result.containsKey("display_id")) model.setHostedWindow(id, nextDisplay > 0);
        if (taskSnapshot) {
            model.setRunningPackages(id, packages, true);
            slot.runningPackages.clear(); slot.runningPackages.addAll(packages);
            String launchFailure = result.getString("launch_failure", "");
            if (!launchFailure.isEmpty()) showStatus(launchFailure);
        }
        if (taskSnapshot) {
            // An exited root can remain in task_count for one observation after its
            // package disappears. Keep its live HOME as the reopen candidate now;
            // Root rechecks the exact HOME-only task set before dispatching a launch.
            // Partial/failure replies cannot revoke a successful task observation.
            model.setEmptyHomeWindow(id, result.getInt("home_task_id", -1) >= 0
                    && packages.isEmpty());
        }
        boolean launching = "launching".equals(state) || "prepared".equals(state);
        if (result.getBoolean("recovery_pending", false) && !launching && !"active".equals(state)) recoveryPending = true;
        if (slot.displayId != nextDisplay) cancelGesture();
        slot.displayId = nextDisplay;
        int width = result.getInt("width", slot.displayWidth), height = result.getInt("height", slot.displayHeight);
        if (width > 0 && height > 0 && (width != slot.displayWidth || height != slot.displayHeight)) {
            cancelGesture(); slot.displayWidth = width; slot.displayHeight = height;
            slot.surface.getHolder().setFixedSize(width, height); slot.fitSurface();
        }
        boolean nextReady = result.getBoolean("success", false) && "active".equals(state)
                && nextDisplay > 0 && result.getInt("task_count", 0) > 0
                && result.getInt("ime_policy", -1) == AtomicWorkbenchProtocol.IME_POLICY_PHONE_DISPLAY
                && result.getBoolean("output_attached", true) && result.getBoolean("output_attached_known", true)
                && !result.getBoolean("output_transition_pending", false);
        if (result.getBoolean("success", false) && "active".equals(state)
                && nextDisplay > 0 && result.getInt("task_count", 0) > 0) slot.wasActive = true;
        if (slot.ready && !nextReady) cancelGesture();
        slot.ready = nextReady;
        slot.message = launching ? "正在确认应用启动…" : nextReady ? "" : result.getString("message", "窗口尚未就绪");
    }

    private boolean forwardTouch(int id, MotionEvent event) {
        AtomicWorkbenchClient connected = client;
        if (id != model.mainWindowId() || !mainReady() || connected == null) return true;
        Slot slot = slots[id]; int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            cancelGesture();
            try {
                AtomicWorkbenchInputPolicy.Geometry geometry = AtomicWorkbenchInputPolicy.Geometry.create(
                        0, 0, slot.surface.getWidth(), slot.surface.getHeight(), slot.displayWidth, slot.displayHeight, 0);
                if (!geometry.contains(event.getX(), event.getY())) return true;
                gestureGeometry = geometry; gestureWindow = id; gestureDisplay = slot.displayId;
            } catch (IllegalArgumentException invalid) { return true; }
        }
        if (gestureGeometry == null || gestureWindow != id || gestureDisplay != slot.displayId) return true;
        MotionEvent mapped = MotionEvent.obtain(event); Matrix transform = new Matrix();
        transform.setValues(gestureGeometry.matrixValues()); mapped.transform(transform);
        if (lastTouch != null) lastTouch.recycle();
        lastTouch = MotionEvent.obtain(mapped); connected.touchWindow(id, mapped); mapped.recycle();
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) clearGesture();
        return true;
    }





    /** Uses the actual TextureView content rectangle, never the surrounding letterbox frame. */
    private Bundle captureExtractionGeometry() {
        if (!mainReady() || client == null || extractionInputRevision < 1 || hostDragActive || textDeliveryActive) return null;
        int id = model.mainWindowId(); Slot slot = slots[id];
        if (slot.nativeHome || slot.displayId <= 0 || slot.displayName.isEmpty() || slot.displayUniqueId.isEmpty()) return null;
        View source = slot.surface;
        for (View view = source; view != null; view = view.getParent() instanceof View ? (View) view.getParent() : null)
            if (!view.getMatrix().isIdentity() || view.getAlpha() != 1f || view.getTranslationX() != 0f || view.getTranslationY() != 0f) return null;
        if (!slot.surface.getTransform(new Matrix()).isIdentity()) return null;
        android.graphics.Rect visible = new android.graphics.Rect(); int[] location = new int[2]; source.getLocationOnScreen(location);
        if (!source.getGlobalVisibleRect(visible) || visible.left != location[0] || visible.top != location[1]
                || visible.width() != source.getWidth() || visible.height() != source.getHeight()
                || source.getWindowToken() == null) return null;
        if (slot.frame.getClipToOutline() && slot.frame.getOutlineProvider() != null) {
            android.graphics.Outline outline = new android.graphics.Outline();
            slot.frame.getOutlineProvider().getOutline(slot.frame, outline);
            android.graphics.Rect bounds = new android.graphics.Rect();
            if (!outline.getRect(bounds)) return null;
            float radius = outline.getRadius();
            for (float x : new float[]{source.getLeft(), source.getRight()})
                for (float y : new float[]{source.getTop(), source.getBottom()}) {
                    if (x < bounds.left || x > bounds.right || y < bounds.top || y > bounds.bottom) return null;
                    float cx = Math.max(bounds.left + radius, Math.min(bounds.right - radius, x));
                    float cy = Math.max(bounds.top + radius, Math.min(bounds.bottom - radius, y));
                    if (radius > 0 && (x - cx) * (x - cx) + (y - cy) * (y - cy) > radius * radius) return null;
                }
        }
        Bundle geometry = new Bundle(); geometry.putInt("window_id", id); geometry.putInt("display_id", slot.displayId);
        geometry.putString("display_name", slot.displayName); geometry.putString("unique_id", slot.displayUniqueId);
        geometry.putBinder("host_window", source.getWindowToken()); geometry.putInt("host_task", getTaskId());
        geometry.putFloat("left", location[0]); geometry.putFloat("top", location[1]);
        geometry.putFloat("right", location[0] + source.getWidth()); geometry.putFloat("bottom", location[1] + source.getHeight());
        geometry.putInt("buffer_width", slot.displayWidth); geometry.putInt("buffer_height", slot.displayHeight);
        geometry.putLong("input_revision", extractionInputRevision); geometry.putLong("ui_epoch", (long) epoch + 1);
        return geometry;
    }

    private void refreshExtractionGeometry() {
        main.removeCallbacks(extractionGeometryTick);
        if (!active || destroyed || closing) return;
        main.postDelayed(extractionGeometryTick, 1100L);
        if (hostTouchActive || gestureGeometry != null || extractionGeometryPending) return;
        if (config == null || !config.getBoolean(AtomicWorkbenchConfig.ENABLED)
                || !config.getBoolean(AtomicWorkbenchExtractionPolicy.ENABLED)
                || !config.getBoolean(AtomicWorkbenchExtractionPolicy.TEXT_ENABLED)) {
            if (!extractionGeometrySignature.isEmpty()) invalidateExtractionGeometry(); return;
        }
        Bundle geometry = captureExtractionGeometry();
        if (geometry == null) { if (!extractionGeometrySignature.isEmpty()) invalidateExtractionGeometry(); return; }
        AtomicWorkbenchClient connected = client; long session = sessionGeneration, sequence = ++extractionGeometryRevision;
        geometry.putLong("revision", sequence); geometry.putLong("deadline", SystemClock.elapsedRealtime() + 2400L);
        extractionGeometrySignature = geometry.getInt("window_id") + "/" + geometry.getString("unique_id") + "/" + sequence;
        extractionGeometryPending = true;
        extractionGeometryAttempted = true;
        WORKER.execute(() -> {
            try {
                if (!destroyed && active && session == sessionGeneration && connected == client)
                    connected.registerExtractionGeometry(geometry);
            } catch (Exception unavailable) { /* Ordinary touch never waits for or depends on extraction. */ }
            finally { main.post(() -> { if (!destroyed && session == sessionGeneration) extractionGeometryPending = false; }); }
        });
    }

    private void invalidateExtractionGeometry() {
        long revision = ++extractionGeometryRevision;
        extractionGeometrySignature = "";
        AtomicWorkbenchClient connected = client;
        if (connected != null && extractionGeometryAttempted) connected.invalidateExtractionGeometry(revision);
    }

    private void cancelGesture() {
        cancelNativeShieldLayout("SEMANTIC_CANCEL");
        for (Slot slot : slots) if (slot != null && slot.swipe != null) slot.swipe.cancel();
        if (lastTouch != null && gestureGeometry != null && gestureWindow >= 0) {
            AtomicWorkbenchClient connected = client;
            if (connected != null) {
                MotionEvent cancelled = MotionEvent.obtain(lastTouch); cancelled.setAction(MotionEvent.ACTION_CANCEL);
                connected.touchWindow(gestureWindow, cancelled); cancelled.recycle();
            }
        }
        clearGesture();
    }
    private void clearGesture() {
        if (lastTouch != null) lastTouch.recycle();
        lastTouch = null; gestureGeometry = null; gestureWindow = gestureDisplay = -1;
    }

    private void requestCloseAll(boolean finishWhenRestored) {
        requestCloseAll(finishWhenRestored, finishWhenRestored ? "user_exit" : "recovery_retry");
    }

    private void requestCloseAll(boolean finishWhenRestored, String requestedReason) {
        final String reason = AtomicWorkbenchLifecyclePolicy.requireReason(requestedReason);
        if (finishWhenRestored) {
            String destination = returnRoute;
            retireSession(reason, true);
            lifecycleDiagnostic("UI_EXIT_BACKGROUND_CLEANUP", "ui_state_saved=false;cleanup_pending=" + AtomicWorkbenchCleanup.pending());
            if (destination != null) ModuleNavigation.returnTo(this, destination);
            else finish();
            return;
        }
        cancelPendingAppSurfaceLaunch(false);
        if (connectionCleanupClient != null && connectionCleanupClient == client
                && connectionCleanupSession == sessionGeneration) {
            // The cleanup worker already owns this exact client; do not issue a second close.
            refreshCleanupWait(); return;
        }
        cancelTaskStorageRecheck();
        presentationPolicy.invalidate(); pendingPresentationFocus = taskPresentationReceipt = null;
        clearHomePresentation();
        dismissHomeTransitionCover();
        if (client != null) client.clearGestureTarget();
        exitRequested |= finishWhenRestored; cancelGesture(); focusedWindow = -2; main.removeCallbacks(poll);
        stopMedia();
        deferredOperation = null;
        incomingPending = false; incomingComponent = null; incomingProof = null; incomingTaskId = -1;
        clearEntryExtras(getIntent());
        lifecycleGate.closing();
        lifecycleDiagnostic("UI_CLOSE_REQUEST", "reason=" + reason + ";finish=" + finishWhenRestored
                + ";already_closing=" + closing);
        if (closing) return;
        closing = true; busy = polling = false; ++epoch; ++pollGeneration;
        operationNotice = null;
        ++outputTransition; outputsSyncing = outputsParked = outputFocusPending = outputsNeedRetry = outputSyncAgain = false;
        for (Slot slot : slots) if (slot != null) slot.ready = false;
        if (!destroyed) { showStatus("正在将工作区应用移回手机屏幕…"); renderWorkspace(); }
        final long session = sessionGeneration;
        final AtomicWorkbenchClient connected = client;
        WORKER.execute(() -> {
            Bundle result;
            try { result = connected == null ? success() : connected.close(reason); }
            catch (Exception error) { result = failure("恢复未完成：" + safeMessage(error)); }
            boolean restored = restored(result);
            lifecycleDiagnostic("UI_CLOSE_RESULT", "reason=" + reason + ";restored=" + restored
                    + ";recovery_pending=" + result.getBoolean("recovery_pending", false));
            if (restored && connected != null) {
                connected.setFailureListener(null);
                synchronized (sessionLock) {
                    if (client == connected && connectionCleanupClient != connected) client = null;
                }
            }
            Bundle response = result;
            main.post(() -> {
                if (destroyed || session != sessionGeneration
                        || connectionCleanupClient == connected && connectionCleanupSession == session) return;
                closing = false;
                recoveryPending = !restored;
                if (restored) {
                    surfaceUnavailable = false;
                    lifecycleGate.restored();
                    java.util.Arrays.fill(pendingHomeSurfaces, false);
                    java.util.Arrays.fill(pendingTaskAllocations, null); pendingTaskOperation = null; taskQueryPending = false;
                    lastTaskSnapshot = null; taskSnapshotElapsed = -1;
                    if (notificationCards != null) notificationCards.reset();
                    if (cardPager != null) { cardPager.resetNotificationPages(); cardPager.resetNavigationSource(); }
                    presentationPolicy.invalidate(); pendingPresentationFocus = homePresentationReceipt = taskPresentationReceipt = null;
                    model.reset(); for (Slot slot : slots) slot.clear(); focusedWindow = -1;
                    nativeHomePending = true; appListRequested = false;
                    showStatus(restoreNotice); restoreNotice = null; renderWorkspace();
                    if (active) { tryIncoming(); scheduleMedia(); }
                } else {
                    showStatus(response.getString("message", "应用任务尚未归还完成") + "。点此重试归还任务，或直接退出。"); renderWorkspace();
                }
            });
        });
    }

    /** Forget the UI immediately; only cleanup may retain ownership of departed task resources. */
    private void retireSession(String reason, boolean leaving) {
        pendingAppSurfaceLaunch = null;
        cancelTaskStorageRecheck(); taskStorageNotice = 0; statusMessage = taskStorageStatusProblem = null;
        closeTaskReferenceManagement();
        presentationPolicy.reset(); pendingPresentationFocus = homePresentationReceipt = taskPresentationReceipt = null;
        pendingLayoutProof = null; main.removeCallbacks(entrySideDispatch);
        pendingTransfer = null; pendingTransferPackage = null;
        main.removeCallbacks(transferDispatch);
        clearHomePresentation();
        dismissHomeTransitionCover();
        if (client != null) client.clearGestureTarget();
        cancelGesture(); stopMedia();
        main.removeCallbacks(poll); main.removeCallbacks(cleanupPoll);
        lifecycleGate.closing();
        retireNativeShieldLayout("SESSION_END"); hostTouchActive = false;
        AtomicWorkbenchClient departed;
        synchronized (sessionLock) {
            ++sessionGeneration;
            extractionInputRevision = -1; extractionGeometryPending = extractionGeometryAttempted = false;
            departed = client;
            client = null;
            connectionCleanupClient = null; connectionCleanupSession = -1L;
            if (departed != null) AtomicWorkbenchCleanup.take(departed, reason);
        }
        ++epoch; ++pollGeneration;
        operationNotice = null;
        ++outputTransition; outputsSyncing = outputsParked = outputFocusPending = outputsNeedRetry = outputSyncAgain = false;
        deferredOperation = null;
        busy = polling = mediaBusy = closing = recoveryPending = waitingForCleanup = surfaceUnavailable = presentationNeedsRetry = false;
        homePresentationRetryWindow = -1;
        exitRequested = leaving;
        connectionRetryRequired = mediaRetryRequired = false;
        java.util.Arrays.fill(pendingHomeSurfaces, false);
        java.util.Arrays.fill(pendingTaskAllocations, null); pendingTaskOperation = null; taskQueryPending = false;
        lastTaskSnapshot = null; taskSnapshotElapsed = -1;
        if (notificationCards != null) notificationCards.reset();
        if (cardPager != null) { cardPager.resetNotificationPages(); cardPager.resetNavigationSource(); }
        model.reset();
        for (Slot slot : slots) if (slot != null) slot.clear();
        focusedWindow = -1;
        nativeHomePending = appListRequested = incomingPending = false;
        incomingComponent = null; incomingProof = null; incomingTaskId = -1;
        entryProblemText = restoreNotice = returnRoute = null;
        stripSignature = gridSignature = "";
        page = 0;
        if (search != null) { search.setText(""); hideHostKeyboard(); }
        clearEntryExtras(getIntent());
        if (closeDialog != null) closeDialog.dismiss();
        if (settingsDialog != null) settingsDialog.dismiss();
        lifecycleGate.restored();
        showStatus(null);
        if (workspace != null) renderWorkspace();
        lifecycleDiagnostic("UI_SESSION_DISCARDED", "reason=" + reason + ";ui_session=" + sessionGeneration + ";saved=false");
    }

    private void showCleanupPending(boolean barrier) {
        waitingForCleanup = barrier;
        if (barrier) cancelTaskStorageRecheck();
        showStatus("正在释放桌面资源，请稍后再试。");
        if (barrier) {
            stopMedia();
            main.removeCallbacks(cleanupPoll);
            if (active && !destroyed && !exitRequested) main.postDelayed(cleanupPoll, 500L);
        }
    }

    private void refreshCleanupWait() {
        main.removeCallbacks(cleanupPoll);
        if (!waitingForCleanup || destroyed || !active || exitRequested) return;
        if (connectionCleanupClient != null) {
            boolean pending = AtomicWorkbenchCleanup.pending();
            synchronized (sessionLock) {
                if (connectionCleanupSession != sessionGeneration || client != connectionCleanupClient) return;
                if (pending) { main.postDelayed(cleanupPoll, 500L); return; }
                // All handed-off owners have an actual complete close receipt. Detach before
                // retiring UI so the already-completed client cannot be handed off again.
                client = null;
            }
            retireSession("recovery_retry", false);
            showStatus("原工作区的任务恢复已确认。可退出；重新滑入可开始新的工作区。");
            return; // Never re-open HOME, replay an entry, focus, or resume media automatically.
        }
        if (AtomicWorkbenchCleanup.pending()) { main.postDelayed(cleanupPoll, 500L); return; }
        waitingForCleanup = false;
        showStatus(null); renderWorkspace(); tryIncoming(); scheduleMedia();
    }

    /** A system recreation/history Intent is not a fresh handoff from the user. */
    private static Intent prepareEntryIntent(Intent intent, boolean recreated) {
        Intent entry = intent == null ? new Intent() : new Intent(intent);
        if (recreated || (entry.getFlags() & Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY) != 0)
            clearEntryExtras(entry);
        return entry;
    }

    private static void clearEntryExtras(Intent entry) {
        if (entry == null) return;
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_ENTRY);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_SIDE);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_COMPONENT);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_TASK_ID);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_REVISION);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_CONFIG_CHECKSUM);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_TRIGGER_ELAPSED);
        entry.removeExtra(AtomicWorkbenchConfig.EXTRA_ENTRY_BUILD);
        entry.removeExtra(AtomicWorkbenchSettingsActivity.EXTRA_GENERATION);
    }

    private boolean readIncoming(Intent intent) {
        long nextGeneration = intent.getLongExtra(AtomicWorkbenchSettingsActivity.EXTRA_GENERATION, ResetWriteFence.generation());
        if (ui == null) launchGeneration = nextGeneration;
        boolean gesture = "gesture".equals(intent.getStringExtra(AtomicWorkbenchConfig.EXTRA_ENTRY));
        EntryProof proof = gesture ? new EntryProof(intent) : null;
        if (gesture) {
            String problem = entryProblem(proof);
            if (!problem.isEmpty()) {
                clearEntryExtras(intent);
                if (ui == null) { incomingProof = proof; rejectIncoming(problem); }
                else showStatus(problem); // An invalid new Intent cannot replace a frozen valid pending entry.
                return false;
            }
            AtomicWorkbenchWindowPresentationPolicy.Offer offered = presentationPolicy.offerEntry(proof.key(), proof.side,
                    SystemClock.elapsedRealtime(), AtomicWorkbenchConfig.REQUEST_MAX_AGE_MS);
            if (offered != AtomicWorkbenchWindowPresentationPolicy.Offer.NEW) {
                clearEntryExtras(intent);
                if (offered == AtomicWorkbenchWindowPresentationPolicy.Offer.REJECTED && ui != null)
                    showStatus("此入口请求已失效，请重新滑入。");
                return false;
            }
            pendingLayoutProof = proof; main.removeCallbacks(entrySideDispatch); main.post(entrySideDispatch);
        }
        launchGeneration = nextGeneration;
        incomingProof = proof;
        entryProblemText = null;
        String raw = intent.getStringExtra(AtomicWorkbenchSettingsActivity.EXTRA_COMPONENT);
        incomingComponent = raw == null || raw.length() > 1024 ? null : ComponentName.unflattenFromString(raw);
        incomingTaskId = intent.getIntExtra(EXTRA_TASK_ID, -1); incomingPending = incomingComponent != null;
        String problem = gesture || incomingTaskId > 0 ? entryProblem(incomingProof) : "";
        if (!problem.isEmpty()) rejectIncoming(problem);
        return problem.isEmpty();
    }
    private void tryIncoming() {
        if (lifecycleGate.surfaceMissing() || outputsSyncing || outputsParked) return;
        // Keep only this entry's immutable handoff while departed resources are returned.
        // On release the ordinary proof/TTL checks below run again before any task is used.
        if (active && client == null && (incomingPending || nativeHomePending) && AtomicWorkbenchCleanup.pending()) {
            showCleanupPending(true); return;
        }
        dispatchEntrySide();
        if (pendingLayoutProof != null) return; // Direction admission and task handoff share the original TTL.
        tryNativeHome();
        if (entryProblemText != null) {
            if (active && !busy && !closing && (!model.desktopVisible() || focusedWindow != -1)) {
                if (ResetWriteFence.stale(launchGeneration)) {
                    restoreNotice = entryProblemText; requestCloseAll(false, "config_reset");
                } else switchToDesktop(-1);
            }
            return;
        }
        if (!canInteract() || !appsLoaded || !incomingPending) return;
        if (ResetWriteFence.stale(launchGeneration)) { incomingPending = false; showStatus("配置已重置，请重新进入工作台。"); return; }
        if (incomingProof != null || incomingTaskId > 0) {
            String problem = entryProblem(incomingProof);
            if (!problem.isEmpty()) { rejectIncoming(problem); return; }
        }
        AtomicWorkbenchAppRepository.App target = findApp(incomingComponent.flattenToString());
        if (target == null) for (AtomicWorkbenchAppRepository.App app : apps)
            if (app.component.getPackageName().equals(incomingComponent.getPackageName())) { target = app; break; }
        if (target == null) { incomingPending = false; showStatus("未找到可接管的本机应用入口，可点顶部桌面或空白工作区的“＋”继续。"); return; }
        AtomicWorkbenchWorkspaceModel.LaunchPlan plan = model.planLaunch(target.key());
        if (plan.accepted() && !slots[plan.windowId].surface.getHolder().isValid()) return;
        incomingPending = false; launchApp(target, incomingTaskId, incomingProof);
    }
    @Override protected void onNewIntent(Intent intent) {
        AppCrashDiagnostics.stage("atomic_workbench_new_intent");
        super.onNewIntent(intent);
        if (intent != null && intent.getBooleanExtra(AtomicWorkbenchTransfer.EXTRA_DELIVERY, false)) {
            // A share delivery is content for this workspace, not a new gesture session.
            transfer.acceptPending();
            return;
        }
        cancelTaskStorageRecheck();
        entryFocusLogged = false;
        Intent nextEntry = prepareEntryIntent(intent, false);
        if (client != null && !closing && !recoveryPending && !ResetWriteFence.stale(launchGeneration)) {
            EntryProof proof = "gesture".equals(nextEntry.getStringExtra(AtomicWorkbenchConfig.EXTRA_ENTRY)) ? new EntryProof(nextEntry) : null;
            String problem = proof == null ? "" : entryProblem(proof);
            setIntent(nextEntry);
            if (!problem.isEmpty()) {
                clearEntryExtras(nextEntry); showStatus(problem); return;
            }
            // Showing the existing session needs no task handoff. Only a fresh gesture
            // may supply another application's task, and launchApp rechecks that proof.
            if (proof == null) clearEntryExtras(nextEntry);
            else if (!readIncoming(nextEntry)) return;
            if (model.mainExpanded()) { presentationPolicy.invalidate(); model.setMainExpanded(false); }
            renderWorkspace();
            if (active) syncWorkspaceOutputs();
            lifecycleDiagnostic("UI_ENTRY_RECEIVED", "gesture=" + (proof != null)
                    + ";request_elapsed=" + (proof == null ? -1L : proof.triggered)
                    + ";new_intent_delivered=true;session_retained=true;visual_content=UNVERIFIED");
            lifecycleDiagnostic("UI_SESSION_REENTERED", "gesture=" + (proof != null) + ";session_retained=true");
            return;
        }
        retireSession("connection_replaced", false);
        setIntent(nextEntry);
        // A rejected handoff must not become an automatic HOME connection.
        if (!readIncoming(nextEntry)) { renderWorkspace(); return; }
        lifecycleDiagnostic("UI_ENTRY_RECEIVED", "gesture=" + (incomingProof != null)
                + ";request_elapsed=" + (incomingProof == null ? -1L : incomingProof.triggered)
                + ";new_intent_delivered=true;visual_content=UNVERIFIED");
        nativeHomePending = true;
        showStatus(entryProblemText); renderWorkspace(); tryIncoming();
        AppCrashDiagnostics.stage("atomic_workbench_reentered");
    }

    private String entryProblem(EntryProof proof) {
        if (proof == null) return "未收到有效的手势凭证，未接管原应用。请重新滑入。";
        if (proof.side == null) return "未收到有效的入口方向，请重新滑入。";
        if (proof.userId != android.os.Process.myUid() / 100000 || ResetWriteFence.stale(proof.resetGeneration)
                || ResetWriteFence.stale(launchGeneration)) return "配置或用户已变化，旧手势请求已取消。请重新滑入。";
        ConfigSnapshot local = new AppConfig(getApplicationContext()).configSnapshot();
        boolean enabled = local != null && ConfigSchema.truthy(local.get(AtomicWorkbenchConfig.ENABLED));
        if (local != null && AtomicWorkbenchConfig.requestCurrent(proof.revision, proof.checksum,
                local.revision, local.checksum, enabled, proof.triggered, SystemClock.elapsedRealtime(),
                proof.build, BuildConfig.VERSION_CODE)) return "";
        if (proof.build != BuildConfig.VERSION_CODE) return "模块版本已变化，旧手势请求已取消。请重启手机后重新滑入。";
        if (!enabled) return "全局手势已关闭，旧请求未执行。";
        if (local == null || proof.revision != local.revision || !local.checksum.equals(proof.checksum))
            return "配置已变化，旧手势请求已取消。请重新滑入。";
        return "本次手势请求已过期或无效，未接管原应用。请重新滑入。";
    }

    private void requireCurrentEntry(EntryProof proof) throws EntryRejected {
        if (proof != incomingProof) throw new EntryRejected("工作区入口已变化，旧手势请求已取消。");
        String problem = entryProblem(proof);
        if (!problem.isEmpty()) throw new EntryRejected(problem);
        if (proof != incomingProof) throw new EntryRejected("工作区入口已变化，旧手势请求已取消。");
    }

    private void rejectIncoming(String reason) {
        if (pendingLayoutProof != null && pendingLayoutProof == incomingProof) {
            presentationPolicy.discardEntry(pendingLayoutProof.key()); pendingLayoutProof = null; main.removeCallbacks(entrySideDispatch);
        }
        incomingPending = false; incomingTaskId = -1; incomingComponent = null; incomingProof = null;
        getIntent().removeExtra(EXTRA_TASK_ID);
        getIntent().removeExtra(AtomicWorkbenchConfig.EXTRA_COMPONENT);
        getIntent().removeExtra(AtomicWorkbenchConfig.EXTRA_SIDE);
        entryProblemText = reason;
        if (ui == null) return;
        showStatus(reason);
        if (active && !busy && !closing && (!model.desktopVisible() || focusedWindow != -1)) {
            if (ResetWriteFence.stale(launchGeneration)) { restoreNotice = reason; requestCloseAll(false, "config_reset"); }
            else switchToDesktop(-1);
        }
    }
    @Override protected void onStart() {
        AppCrashDiagnostics.stage("atomic_workbench_started");
        super.onStart(); active = true; lifecycleGate.started();
        main.removeCallbacks(extractionGeometryTick); main.postDelayed(extractionGeometryTick, 1100L);
        if (transfer != null) transfer.setForeground(true);
        lifecycleDiagnostic("UI_STARTED", "surface_missing=" + lifecycleGate.surfaceMissing());
        refreshAppearance();loadApps();
        if(!appPackagesRegistered){
            android.content.IntentFilter changes=new android.content.IntentFilter();changes.addAction(Intent.ACTION_PACKAGE_ADDED);
            changes.addAction(Intent.ACTION_PACKAGE_REMOVED);changes.addAction(Intent.ACTION_PACKAGE_CHANGED);changes.addDataScheme("package");
            try{registerReceiver(appPackages,changes,android.content.Context.RECEIVER_NOT_EXPORTED);appPackagesRegistered=true;}
            catch(RuntimeException unavailable){showStatus("应用变化监听暂不可用，返回工作台时会重新读取应用列表。");}
        }
        if (waitingForCleanup) refreshCleanupWait();
        if (client != null && !closing && !recoveryPending) {
            syncWorkspaceOutputs();
        } else {
            outputsParked = outputsSyncing = false;
            surfaceUnavailable = false; lifecycleGate.restored();
            resumeDeferredOperation();
            if (homePresentationWindow >= 0) main.post(homePresentationPoll);
            tryIncoming(); schedulePoll(); scheduleMedia(); publishGestureTarget();
        }
    }
    @Override protected void onResume() {
        super.onResume(); resumed = true;
        extractionHost = new java.lang.ref.WeakReference<>(this);
        if (active && client != null && !destroyed && !closing) schedulePoll();
    }
    @Override protected void onPause() {
        // A floating phone Activity leaves the workbench STARTED and visible.
        // Its UI owns physical input until RESUME; polling may observe the VDs
        // meanwhile, but must not steal that UI's long press/focus.
        resumed = false; super.onPause();
    }
    @Override public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (!hasFocus || entryFocusLogged || destroyed) return;
        entryFocusLogged = true;
        if (incomingProof != null && entryProblem(incomingProof).isEmpty())
            AtomicWorkbenchGestureGuide.entered(this, incomingProof.triggered);
        AppCrashDiagnostics.stage("atomic_workbench_focused");
        lifecycleDiagnostic("UI_ENTRY_FOCUSED", "gesture=" + (incomingProof != null)
                + ";request_elapsed=" + (incomingProof == null ? -1L : incomingProof.triggered)
                + ";window_focused=true;visual_content=UNVERIFIED");
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            retireNativeShieldLayout("NEW_DOWN");
            nativeShieldDownTime = event.getDownTime(); nativeShieldEventTime = event.getEventTime();
            if (active && !busy && !closing) { presentationPolicy.invalidate(); pendingPresentationFocus = null; }
            hostTouchActive = true;
        }
        boolean priorUp = nativeShieldDispatchingUp;
        nativeShieldDispatchingUp = action == MotionEvent.ACTION_UP && event.getDownTime() == nativeShieldDownTime;
        try { return super.dispatchTouchEvent(event); }
        finally {
            nativeShieldDispatchingUp = priorUp;
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) finishNativeShieldTouch(event);
        }
    }
    @Override public void finish() {
        final long generation = launchGeneration;
        final Throwable caller = new Throwable("workbench_finish_caller");
        APP_READER.execute(() -> AtomicWorkbenchDiagnostics.record(getApplicationContext(), generation,
                "UI_FINISH_REQUEST", -1, android.os.Process.myUid() / 100000, "", -1, "source=Activity.finish", caller));
        super.finish();
    }

    @Override protected void onStop() {
        resumed = false;
        if (extractionHost.get() == this) extractionHost = new java.lang.ref.WeakReference<>(null);
        if(appPackagesRegistered){try{unregisterReceiver(appPackages);}catch(RuntimeException unavailable){ }finally{appPackagesRegistered=false;}}
        closeTaskReferenceManagement();
        main.removeCallbacks(entrySideDispatch);
        invalidateExtractionGeometry(); main.removeCallbacks(extractionGeometryTick);
        cancelPendingAppSurfaceLaunch(false);
        active = false;
        if (windowMotion != null) windowMotion.close();
        if (appPlacementDrag != null) appPlacementDrag.ended = true;
        appPlacementDrag = null; hostDragActive = false;
        retireNativeShieldLayout("STOP");
        hostTouchActive = false;
        textDeliveryActive = false;
        if (pasteCoordinator != null) pasteCoordinator.cancelAll();
        if (transfer != null) transfer.setForeground(false);
        if (client != null) client.clearGestureTarget();
        main.removeCallbacks(homePresentationPoll);
        if (closeDialog != null) closeDialog.dismiss();
        if (settingsDialog != null) settingsDialog.dismiss();
        cancelGesture(); main.removeCallbacks(poll); main.removeCallbacks(cleanupPoll); stopMedia();
        lifecycleDiagnostic("UI_STOPPED", "changing_configuration=" + isChangingConfigurations());
        lifecycleGate.stopped();
        parkWorkspaceOutputs();
        super.onStop();
    }
    /** Main-thread, same-UID owner for a private floating extraction page. */
    static AtomicWorkbenchActivity extractionHost() {
        if (Looper.myLooper() != Looper.getMainLooper()) return null;
        AtomicWorkbenchActivity host = extractionHost.get();
        return host != null && host.active && host.resumed && !host.destroyed && !host.closing
                && !host.isFinishing() && !host.isDestroyed() && host.getTaskId() > 0
                && host.getDisplay() != null && host.getDisplay().getDisplayId() == 0 ? host : null;
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if (textTool != null) state.putBundle("atomic_workbench_text_tool", textTool.saveState());
        super.onSaveInstanceState(state);
    }
    @Override protected void onDestroy() {
        closeTaskReferenceManagement();
        main.removeCallbacks(entrySideDispatch);
        invalidateExtractionGeometry(); main.removeCallbacks(extractionGeometryTick);
        destroyed = true; active = false;
        retireNativeShieldLayout("DESTROY"); hostTouchActive = false;
        if (pasteCoordinator != null) pasteCoordinator.close();
        if (textTool != null) textTool.close();
        if (ui != null) ui.closeHostDialogs();
        lifecycleDiagnostic("UI_DESTROYED", "changing_configuration=" + isChangingConfigurations()
                + ";finishing=" + isFinishing());
        retireSession("host_destroyed", true);
        if (transfer != null) transfer.close();
        if (notificationCards != null) notificationCards.close();
        for (Slot slot : slots) if (slot != null) slot.swipe.close();
        main.removeCallbacks(transferDispatch);
        if (closeDialog != null) closeDialog.dismiss();
        if (settingsDialog != null) settingsDialog.dismiss();
        super.onDestroy();
    }
    @Override public void navigateToAncestor(String route) { returnRoute = route; requestCloseAll(true, "navigation"); }

    private void scheduleLifecycleClose(int ticket, String reason) {
        main.postDelayed(() -> {
            if (destroyed || closing || !lifecycleGate.shouldClose(ticket)) return;
            lifecycleDiagnostic("UI_LIFECYCLE_CLOSE", "reason=" + reason + ";active=" + active
                    + ";surface_missing=" + lifecycleGate.surfaceMissing());
            requestCloseAll(false, reason);
        }, AtomicWorkbenchLifecyclePolicy.STOP_GRACE_MS);
    }

    private boolean mutationAllowed(int request) {
        return !destroyed && active && !closing && !surfaceUnavailable && request == epoch;
    }

    private void completeOperation(int request, Runnable completion) {
        if (destroyed || closing || request != epoch || surfaceUnavailable) return;
        if (!active || outputsSyncing || outputsParked) {
            deferredOperation = () -> completeOperation(request, completion);
            lifecycleDiagnostic("UI_OPERATION_DEFERRED", "epoch=" + request);
            return;
        }
        completion.run();
    }

    private void resumeDeferredOperation() {
        if (surfaceUnavailable) return; // A lost display surface requires restoration, never result replay.
        Runnable completion = deferredOperation;
        deferredOperation = null;
        if (completion != null) completion.run();
    }

    private void onWindowSurfaceDestroyed(int id) {
        if (pendingAppSurfaceLaunch != null && !pendingAppSurfaceLaunch.dispatched
                && pendingAppSurfaceLaunch.plan.windowId == id) cancelPendingAppSurfaceLaunch(true);
        if ((model.hasWindow(id) || pendingHomeSurfaces[id]) && !closing) {
            if (client != null) client.clearGestureTarget();
            slots[id].ready = false;
            slots[id].outputAwaitingFrame = slots[id].outputRetainsProducer = false;
            if (active) main.post(this::syncWorkspaceOutputs);
        }
    }

    private void lifecycleDiagnostic(String event, String detail) {
        final long generation = launchGeneration;
        APP_READER.execute(() -> AtomicWorkbenchDiagnostics.record(getApplicationContext(), generation,
                event, -1, android.os.Process.myUid() / 100000, "", -1, detail, null));
    }

    private void releaseHostSearchInput() {
        // A virtual editor uses the phone IME too. Only relinquish a real host
        // search connection; requesting desktop focus would replace that editor.
        if (search != null && search.hasFocus()) hideHostKeyboard();
    }

    private void hideHostKeyboard() {
        search.clearFocus();
        desktop.requestFocus();
        InputMethodManager ime = getSystemService(InputMethodManager.class);
        if (ime != null) ime.hideSoftInputFromWindow(search.getWindowToken(), 0);
    }
    /** Uses only the actual typed scope metadata; missing/failed replies cannot certify READY. */
    private void observeTaskStorageScope(Bundle response) {
        int scope = AtomicWorkbenchClient.taskStorageScope(response);
        if (scope < 0) return;
        taskStorageNotice = scope;
        if (scope == 0) {
            if (Boolean.TRUE.equals(response.get("success"))) taskStorageStatusProblem = null;
            else {
                Object problem = response.get("message");
                taskStorageStatusProblem = problem instanceof String && !((String) problem).isEmpty()
                        ? (String) problem : "历史任务记录已核对；工作区状态仍未确认，请核对当前窗口。";
            }
            cancelTaskStorageRecheck();
        }
        renderSessionStatus();
        // A normal displayed workspace already has pollStatus. Only the parked-output
        // dead end needs an extra observer, and it never resumes input or producers.
        if (taskStorageNotice != 0 && outputsParked) scheduleTaskStorageRecheck();
    }

    private boolean taskStorageRecheckAllowed() {
        return active && !destroyed && !closing && !exitRequested && !recoveryPending
                && !waitingForCleanup && client != null && taskStorageNotice != 0
                && !ResetWriteFence.stale(launchGeneration);
    }

    private boolean taskStorageProbeCurrent(AtomicWorkbenchClient connected, long generation,
            long session, long transition, long reset, long entry, int request) {
        return generation == taskStorageProbeGeneration && taskStorageRecheckAllowed()
                && connected == client && session == sessionGeneration && transition == outputTransition
                && reset == launchGeneration && request == epoch && entry == presentationPolicy.entryGeneration();
    }

    private void cancelTaskStorageRecheck() {
        ++taskStorageProbeGeneration;
        taskStorageRecheckWanted = false;
        taskStorageProbeDelay = 2000L;
        main.removeCallbacks(taskStorageRecheck);
        // The one outstanding worker retains its slot until it really returns.
        // Cancellation invalidates publication; it cannot cancel an in-flight Binder.
    }

    private void scheduleTaskStorageRecheck() {
        if (!taskStorageRecheckAllowed()) return;
        taskStorageRecheckWanted = true;
        main.removeCallbacks(taskStorageRecheck);
        main.postDelayed(taskStorageRecheck, taskStorageProbeDelay);
    }

    private void recheckTaskStorageScope() {
        main.removeCallbacks(taskStorageRecheck);
        if (!taskStorageRecheckWanted || !taskStorageRecheckAllowed()) return;
        if (busy || polling || outputsSyncing || taskStorageProbeInFlight != 0L) {
            scheduleTaskStorageRecheck(); return;
        }
        final AtomicWorkbenchClient connected = client;
        final long generation = taskStorageProbeGeneration, session = sessionGeneration;
        final long transition = outputTransition, reset = launchGeneration;
        final long entry = presentationPolicy.entryGeneration();
        final int request = epoch;
        final long flight = ++taskStorageProbeSequence;
        taskStorageProbeInFlight = flight;
        WORKER.execute(() -> {
            Bundle result = null;
            try {
                if (taskStorageProbeCurrent(connected, generation, session, transition, reset, entry, request)
                        && !busy && !polling && !outputsSyncing) result = connected.statusForStorageRecheck();
            } catch (Exception unavailable) { /* No missing response renews proof or clears the warning. */ }
            final Bundle response = result;
            main.post(() -> {
                if (taskStorageProbeInFlight == flight) taskStorageProbeInFlight = 0L;
                if (generation != taskStorageProbeGeneration) return;
                if (!taskStorageProbeCurrent(connected, generation, session, transition, reset, entry, request)) {
                    cancelTaskStorageRecheck(); return;
                }
                observeTaskStorageScope(response);
                if (taskStorageNotice != 0) {
                    taskStorageProbeDelay = Math.min(30000L, taskStorageProbeDelay * 2L);
                    scheduleTaskStorageRecheck();
                } else {
                    // READY certifies only the Store read. A global failure is still
                    // retained in taskStorageStatusProblem; neither result resumes input.
                    // No resumeUi/focus/OPEN/Task mutation or output setter is invoked here.
                    if (!outputsParked) schedulePoll();
                }
            });
        });
    }

    private void showStatus(String message) {
        statusMessage = message;
        renderSessionStatus();
    }

    private void renderSessionStatus() {
        if (status == null || destroyed) return;
        String warning = taskStorageNotice == 1
                ? "历史任务记录尚未核查，记录管理暂不可用。点此重查。"
                : taskStorageNotice == 2 ? "历史任务管理尚未就绪，当前记录未获核实。点此重查。" : "";
        if (taskStorageStatusProblem != null && !taskStorageStatusProblem.isEmpty())
            warning = warning.isEmpty() ? taskStorageStatusProblem : warning + "\n" + taskStorageStatusProblem;
        String message = statusMessage == null ? "" : statusMessage;
        String visible = warning.isEmpty() ? message : message.isEmpty() ? warning : message + "\n" + warning;
        if (!TextUtils.equals(status.getText(), visible)) status.setText(visible);
        int visibility = visible.isEmpty() ? View.GONE : View.VISIBLE;
        if (status.getVisibility() != visibility) status.setVisibility(visibility);
    }

    private final class Slot implements AtomicWorkbenchSurface.Callback {
        final int id;
        final FrameLayout frame;
        final AtomicWorkbenchSurface surface;
        final TextView placeholder, label;
        final View shield;
        AtomicWorkbenchSideSwipe swipe;
        private AtomicWorkbenchTaskUiSnapshot.Window swipeWindow;
        private int swipeEpoch;
        private long swipeSession;
        int displayWidth = AtomicWorkbenchActivity.this.displayWidth;
        int displayHeight = AtomicWorkbenchActivity.this.displayHeight;
        int displayId = -1;
        int homeTaskId = -1, presentedHomeTaskId = -1, presentedHomeSurfaceLifecycle = -1;
        int presentedHomeDisplayId = -1;
        String displayUniqueId = "", presentedHomeDisplayUniqueId = "";
        String displayName = "", windowSession = "";
        int targetUid = -1, targetTaskId = -1;
        Drawable dropForeground;
        boolean dropHovered;
        long homeReadinessGenerationNanos = -1L, homeReadinessRequestNanos = -1L;
        long presentedHomeReadinessGenerationNanos = -1L, presentedHomeProducerTimestampNanos = -1L, presentedHomeDrawBoundary = -1L;
        boolean ready, wasActive, nativeHome, retainedEmptyTaskDisplay;
        String topComponent = "";
        final ArrayList<String> runningPackages = new ArrayList<>();
        volatile int surfaceLifecycle;
        int surfaceChanges, surfaceChangeLogs, lastSurfaceWidth, lastSurfaceHeight;
        boolean outputAwaitingFrame, outputRetainsProducer;
        long outputFrameBoundary;
        long lastSurfaceLog;
        String message = "";

        // Gesture observer/forwarder retains native click handling or its separate accessible actions; do not synthesize a second click.
        //noinspection ClickableViewAccessibility
        Slot(int id) {
            this.id = id;
            frame = new FrameLayout(AtomicWorkbenchActivity.this);
            frame.setTag("atomic-workbench-window-" + id);
            frame.setBackground(ui.round(ui.cardHigh, ui.surfaceRadiusDp(18))); frame.setClipToOutline(true);
            frame.setOnDragListener((view, event) -> onWorkspaceDrag(id, view, event));
            surface = new AtomicWorkbenchSurface(AtomicWorkbenchActivity.this);
            surface.setTag("atomic-workbench-surface-" + id); surface.setContentDescription("工作区应用窗口" + (id + 1));
            surface.getHolder().setFixedSize(displayWidth, displayHeight); surface.getHolder().addCallback(this);
            surface.setOnTouchListener((view, event) -> forwardTouch(id, event));
            frame.addView(surface, new FrameLayout.LayoutParams(1, 1, Gravity.CENTER));
            placeholder = ui.text("＋", 24, ui.muted, false);
            placeholder.setGravity(Gravity.CENTER); placeholder.setPadding(ui.dp(6), ui.dp(6), ui.dp(6), ui.dp(6));
            placeholder.setBackground(ui.round(ui.cardHigh, ui.surfaceRadiusDp(18)));
            frame.addView(placeholder, new FrameLayout.LayoutParams(-1, -1));
            label = ui.text("", 11, ui.accent, true); label.setMaxLines(1); label.setEllipsize(TextUtils.TruncateAt.END);
            label.setPadding(ui.dp(5), ui.dp(4), ui.dp(5), ui.dp(4));
            label.setBackground(ui.round(ui.accentContainer, ui.surfaceRadiusDp(10)));
            frame.addView(label, new FrameLayout.LayoutParams(-1, -2, Gravity.TOP));
            shield = new View(AtomicWorkbenchActivity.this);
            shield.setTag("atomic-workbench-window-action-" + id);
            shield.setOnClickListener(view -> {
                if (!outputPresented(id)) return;
                if (!canInteract()) {
                    if (nativeShieldLayoutHold != null) nativeShieldLayoutDiagnostic(nativeShieldLayoutHold, "CLICK_BLOCKED", nativeShieldLayoutHold.eventTime);
                    return;
                }
                if (!acceptNativeShieldClick(id)) return;
                if (!model.hasWindow(id) || retainedEmptyTaskDisplay) openEmptyWorkspace(id);
                else focusWindow(id);
            });
            shield.setOnLongClickListener(view -> {
                if (!outputPresented(id)) return false;
                swipe.markLongPressed();
                showWindowTaskMenu(id);
                return true;
            });
            swipe = AtomicWorkbenchSideSwipe.install(shield, frame, 1, new AtomicWorkbenchSideSwipe.Callback() {
                @Override public void onDown() {
                    beginNativeShieldLayout(id);
                    swipeWindow = null; swipeEpoch = epoch; swipeSession = sessionGeneration;
                    long age = SystemClock.elapsedRealtime() - taskSnapshotElapsed;
                    if (id != model.mainWindowId() && model.hasWindow(id) && !busy && !hostDialogActive && !hostDragActive
                            && pendingTaskOperation == null && lastTaskSnapshot != null && age >= 0 && age <= 2000) {
                        AtomicWorkbenchTaskUiSnapshot.Window observed = lastTaskSnapshot.window(id);
                        if (observed != null && !observed.tasks.isEmpty() && observed.matches(displayId, displayUniqueId, windowSession)) swipeWindow = observed;
                    }
                }
                @Override public void onAction(AtomicWorkbenchSideSwipePolicy.Action action) {
                    AtomicWorkbenchTaskUiSnapshot.Window selected = swipeWindow;
                    if (!canInteract() || hostDialogActive || hostDragActive || id == model.mainWindowId() || swipeEpoch != epoch || swipeSession != sessionGeneration
                            || selected != null && !selected.matches(displayId, displayUniqueId, windowSession)) return;
                    if (selected == null) {
                        showStatus("任务状态正在确认，请重试滑动或长按选择任务。");
                        readTaskSnapshot(ready -> { }, null); return;
                    }
                    selectTaskInWindow(selected, action == AtomicWorkbenchSideSwipePolicy.Action.UP
                            ? AtomicWorkbenchTaskOperationRequest.Action.SHELVE : AtomicWorkbenchTaskOperationRequest.Action.MOVE_OUT);
                }
                @Override public void onFinished() { swipeWindow = null; }
            });
            frame.addView(shield, new FrameLayout.LayoutParams(-1, -1));
            frame.addOnLayoutChangeListener((view, l, t, r, b, ol, ot, or, ob) -> {
                if (l != ol || t != ot || r != or || b != ob) cancelGesture(); fitSurface();
            });
        }
        void fitSurface() {
            if (deferNativeShieldLayout()) return;
            int width = frame.getWidth(), height = frame.getHeight();
            if (width < 1 || height < 1) return;
            float scale = Math.min(width / (float) displayWidth, height / (float) displayHeight);
            int targetWidth = Math.max(1, Math.round(displayWidth * scale)), targetHeight = Math.max(1, Math.round(displayHeight * scale));
            FrameLayout.LayoutParams layout = (FrameLayout.LayoutParams) surface.getLayoutParams();
            if (layout.width == targetWidth && layout.height == targetHeight) return;
            invalidateMainLayout(id);
            cancelGesture(); layout.width = targetWidth; layout.height = targetHeight; surface.setLayoutParams(layout);
        }
        void render() {
            String key = model.component(id); boolean side = presentationRoles().isSide(id);
            swipe.setEnabled(side && outputPresented(id) && model.hasWindow(id) && !retainedEmptyTaskDisplay);
            if (!side) swipe.cancel();
            AtomicWorkbenchAppRepository.App app = findApp(key);
            AtomicWorkbenchAppRepository.App top = findDisplayApp(topComponent);
            boolean occupied = model.hasWindow(id);
            String name = retainedEmptyTaskDisplay ? "空白工作区" : nativeHome ? "手机桌面" : top != null ? top.label : app != null ? app.label : "应用窗口";
            label.setText(occupied ? name : ""); label.setVisibility(side && occupied ? View.VISIBLE : View.GONE);
            placeholder.setText(!occupied || retainedEmptyTaskDisplay ? "＋" : message.isEmpty() ? "正在准备画面…" : message);
            placeholder.setTextSize(UiKit.compactTextSize(!occupied || retainedEmptyTaskDisplay ? 24 : 12));
            boolean awaitingHome = homePresentationWindow == id || (presentationNeedsRetry && homePresentationRetryWindow == id);
            placeholder.setVisibility(!occupied || !ready || awaitingHome ? View.VISIBLE : View.GONE);
            boolean resumeMain = !side && occupied && model.desktopVisible() && !appListRequested;
            shield.setVisibility(side || !occupied || retainedEmptyTaskDisplay || resumeMain ? View.VISIBLE : View.GONE);
            shield.setContentDescription(!occupied || retainedEmptyTaskDisplay ? "空白工作区，打开手机原生桌面"
                    : resumeMain ? name + "，点按继续操作" : name + "，点按提升，长按窗口操作");
        }
        void clear() { ready = false; wasActive = false; nativeHome = false; retainedEmptyTaskDisplay = false; displayId = -1;
            outputAwaitingFrame = outputRetainsProducer = false; outputFrameBoundary = 0;
            clearDropHover(); displayName = windowSession = ""; targetUid = targetTaskId = -1;
            homeTaskId = presentedHomeTaskId = presentedHomeSurfaceLifecycle = -1;
            presentedHomeDisplayId = -1; displayUniqueId = presentedHomeDisplayUniqueId = "";
            homeReadinessGenerationNanos = homeReadinessRequestNanos = presentedHomeReadinessGenerationNanos = presentedHomeProducerTimestampNanos = presentedHomeDrawBoundary = -1L;
            message = ""; topComponent = ""; runningPackages.clear(); }
        void showDropHover(boolean files) {
            if (dropHovered) return;
            dropHovered = true; dropForeground = frame.getForeground();
            frame.setForeground(ui.roundStroke(android.graphics.Color.TRANSPARENT, ui.surfaceRadiusDp(18), ui.accent, 2));
            frame.performHapticFeedback(android.view.HapticFeedbackConstants.VIRTUAL_KEY);
            frame.setContentDescription(files ? "松开后选择分享到此窗口，或仅填入文字" : "松开后填入此窗口当前选中的输入框");
        }
        void clearDropHover() {
            if (!dropHovered) return;
            frame.setForeground(dropForeground); frame.setContentDescription(null); dropForeground = null; dropHovered = false;
        }
        @Override public void surfaceCreated(AtomicWorkbenchSurface.Output holder) {
            invalidateMainLayout(id);
            ++surfaceLifecycle; surfaceChanges = surfaceChangeLogs = 0; lastSurfaceLog = 0;
            lastSurfaceWidth = lastSurfaceHeight = 0;
            surfaceDiagnostic("SURFACE_CREATED", ""); tryIncoming();
            if (pendingAppSurfaceLaunch != null && pendingAppSurfaceLaunch.plan.windowId == id) {
                continuePendingAppSurfaceLaunch(); return;
            }
            if (active && client != null && model.hasWindow(id) && !outputsSyncing) main.post(AtomicWorkbenchActivity.this::syncWorkspaceOutputs);
        }
        @Override public void surfaceChanged(AtomicWorkbenchSurface.Output holder, int format, int width, int height) {
            cancelGesture();
            if (width != lastSurfaceWidth || height != lastSurfaceHeight) {
                ++surfaceChanges; lastSurfaceWidth = width; lastSurfaceHeight = height;
                long now = SystemClock.elapsedRealtime();
                if (surfaceChangeLogs < 4 && (surfaceChangeLogs == 0 || now - lastSurfaceLog >= 1000L)) {
                    ++surfaceChangeLogs; lastSurfaceLog = now;
                    surfaceDiagnostic("SURFACE_CHANGED", "width=" + width + " height=" + height);
                }
            }
            tryIncoming(); continuePendingAppSurfaceLaunch();
        }
        @Override public void surfaceDestroyed(AtomicWorkbenchSurface.Output holder) {
            ++surfaceLifecycle;
            outputRetainsProducer = false;
            invalidateMainLayout(id);
            cancelGesture();
            surfaceDiagnostic("SURFACE_DESTROYED", "width=" + lastSurfaceWidth + " height=" + lastSurfaceHeight
                    + " changes=" + surfaceChanges + " change_logs=" + surfaceChangeLogs);
            onWindowSurfaceDestroyed(id);
        }
        @Override public void frameAvailable(long frameNumber, long elapsed) {
            if (outputAwaitingFrame && frameNumber > outputFrameBoundary && surface.isFrameFromConfiguredGeometry()) {
                outputAwaitingFrame = false;
            }
            finishOutputPresentation();
            if (homePresentationWindow == id && frameNumber > homePresentationFrame) completeHomePresentation();
        }
        private void surfaceDiagnostic(String event, String detail) {
            final long generation = launchGeneration;
            final int display = displayId;
            final String captured = "lifecycle=" + surfaceLifecycle + " " + detail + ";" + surface.diagnosticState();
            APP_READER.execute(() -> AtomicWorkbenchDiagnostics.record(getApplicationContext(), generation,
                    event, id, android.os.Process.myUid() / 100000, "", display, captured, null));
        }
    }

    private static boolean restored(Bundle result) {
        return result != null && result.getBoolean("success", false) && !result.getBoolean("recovery_pending", false);
    }
    private static Bundle success() { Bundle result = new Bundle(); result.putBoolean("success", true); return result; }
    private static Bundle cleanupPending() {
        Bundle result = failure("正在释放桌面资源，请稍后再试。");
        result.putBoolean("cleanup_pending", true); result.putBoolean("cleanup_barrier", true);
        result.putBoolean("no_session", true); result.putInt("display_id", -1);
        return result;
    }
    private static Bundle failure(String message) {
        Bundle result = new Bundle(); result.putBoolean("success", false); result.putString("message", message); return result;
    }
    private static String safeMessage(Exception error) {
        String message = error.getMessage(); return message == null || message.isEmpty() ? error.getClass().getSimpleName() : message;
    }
}
