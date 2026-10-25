package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.text.TextUtils;
import android.view.DragAndDropPermissions;
import android.view.DragEvent;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Supplier;

/** User-initiated phone-side content transfer. The destination app owns recipient selection and sending. */
final class AtomicWorkbenchTransfer {
    interface Callback {
        void onChanged();
        void onSend(Intent sanitizedShare, String packageName);
        default void onDragState(boolean active) { }
    }
    static final String EXTRA_DELIVERY = "ls.augment.com.atomic_workbench.transfer_delivery";
    private static final String DRAG_MIME = "application/vnd.lsaugment.transfer-session";
    private static final String DRAG_NONCE = "duo_drag_nonce", DRAG_ID = "duo_drag_id", DRAG_REVISION = "duo_drag_revision";
    private static final int PICK_FILES = 0x4a71;
    private static final int PICK_DIRECTORY = 0x4a72, READ_MEDIA = 0x4a73;
    static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "LSA-WorkbenchTransfer"); thread.setDaemon(true); return thread;
    });
    private final Activity activity;
    private final Callback callback;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final LinearLayout root;
    private final TextView summary;
    private final Button clear;
    private final android.widget.ImageButton help;
    private UiKit ui;
    private final AtomicWorkbenchPendingRepository repository;
    private AutoCloseable subscription;
    private AtomicWorkbenchPendingPayload current;
    private volatile boolean closed;
    private boolean loading, initializing = true, foreground = true;
    private long operation;
    private long targetQuery;
    private Dialog dialog, targetManagementDialog;
    private AtomicWorkbenchPendingControls controls;
    private AtomicWorkbenchPendingImport pendingImport;
    private AtomicWorkbenchTransferStage.Job stage;
    private DragSession activeDrag;
    // One in-process text gesture from the private extraction Activity. It is never
    // populated by external ClipData, files, or a pending-queue drag.

    // Drag owner is retained only for its active session and released by finish/cancel/close.
    //noinspection StaticFieldLeak
    private static DragSession extractedTextDrag;
    private ContentRead contentRead;
    private AtomicWorkbenchContentPanel.DragSource contentDragState;
    private View contentDragView;
    private AtomicWorkbenchPendingPayload targetSnapshot;
    private java.util.function.Consumer<String> textTool;
    private final AtomicWorkbenchContentCollector collector;
    private final AtomicWorkbenchContentPanel contentPanel;
    private final AtomicWorkbenchSharePreferences sharePreferences;
    private AtomicWorkbenchDragScroller scroller;
    private View hovered;
    private android.graphics.drawable.Drawable hoverForeground;
    private java.util.Set<String> supportedPackages;

    AtomicWorkbenchTransfer(Activity activity, UiKit ui, Callback callback) {
        this.activity = activity; this.ui = ui; this.callback = callback;
        repository = AtomicWorkbenchPendingStorage.repository(activity);
        root = ui.card(); root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(ui.dp(8), 0, ui.dp(4), 0);
        root.setTag("atomic-workbench-transfer");
        collector = new AtomicWorkbenchContentCollector(activity);
        sharePreferences = new AtomicWorkbenchSharePreferences(activity);
        contentPanel = new AtomicWorkbenchContentPanel(activity, ui, collector, new AtomicWorkbenchContentPanel.Callback() {
            @Override public void onUse(java.util.List<AtomicWorkbenchContentItem> items, boolean open) { useContent(items, open); }
            @Override public void onDrag(View source, AtomicWorkbenchContentItem item, AtomicWorkbenchContentPanel.DragSource state) { startContentDrag(source, item, state); }
            @Override public void onCancelDrag() { cancelContentDrag(); }
            @Override public void onPermission(AtomicWorkbenchContentItem.Kind kind) { requestContentAccess(kind); }
            @Override public void onPickFiles() { contentPanel.dismiss(); pickFiles(); }
            @Override public void onPickDirectory() { contentPanel.dismiss(); pickDirectory(); }
        });
        LinearLayout staged = new LinearLayout(activity); staged.setGravity(Gravity.CENTER_VERTICAL);
        root.addView(staged, new LinearLayout.LayoutParams(-1, -2));
        summary = ui.text("已存素材 · 点按管理", 12, ui.muted, false);
        summary.setSingleLine(true); summary.setEllipsize(TextUtils.TruncateAt.END);
        summary.setMinimumHeight(ui.dp(48)); summary.setGravity(Gravity.CENTER_VERTICAL);
        summary.setContentDescription("已存素材，点按管理");
        summary.setOnClickListener(v -> showMenu());
        staged.addView(summary, new LinearLayout.LayoutParams(0, -2, 1));
        clear = ui.button("×"); clear.setContentDescription("清除流转素材");
        clear.setPadding(0, 0, 0, 0); clear.setMinWidth(0); clear.setMinimumWidth(0); clear.setMinimumHeight(ui.dp(48));
        clear.setOnClickListener(v -> clear()); staged.addView(clear, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        help = ui.helpButton("流转与素材历史", helpText());
        staged.addView(help, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        LinearLayout regions = new LinearLayout(activity);
        for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
            Button region = ui.button(kind == AtomicWorkbenchContentItem.Kind.MEDIA ? "媒体" : kind == AtomicWorkbenchContentItem.Kind.FILES ? "文件" : "剪贴板");
            region.setMinimumHeight(ui.dp(48)); region.setTag("atomic-workbench-content-open:" + kind.name());
            region.setOnClickListener(v -> { dismissMenu(); contentPanel.toggle(kind); });
            regions.addView(region, new LinearLayout.LayoutParams(0, -2, 1));
        }
        root.addView(regions, new LinearLayout.LayoutParams(-1, -2));
        subscription = repository.subscribe(snapshot -> main.post(() -> { if (!closed) apply(snapshot); }));
        acceptPending(); render(); initializing = false;
    }

    View view() { return root; }
    void showTools() {
        if (closed || activity.isDestroyed()) return;
        dismissMenu();
        if (root.getParent() instanceof android.view.ViewGroup)
            ((android.view.ViewGroup) root.getParent()).removeView(root);
        dialog = ui.glassDialog("素材与历史", root, null, null, "关闭");
    }
    void setTextTool(java.util.function.Consumer<String> value) { textTool = value; contentPanel.setTextTool(value); if (controls != null) controls.setTextTool(value); }

    boolean acceptPending() {
        if (closed) return false;
        IO.execute(() -> { AtomicWorkbenchPendingPayload latest = repository.load(); main.post(() -> { if (!closed) apply(latest); }); });
        return true;
    }

    private void apply(AtomicWorkbenchPendingPayload latest) {
        if (current != null && current.id.equals(latest.id) && latest.revision < current.revision) return;
        boolean changed = current == null || !current.signature().equals(latest.signature()) || current.state != latest.state;
        current = latest;
        if (!changed) { render(); return; }
        supportedPackages = null;
        if (latest.empty() || !latest.deliverable()) { render(); if (!initializing && callback != null) callback.onChanged(); return; }
        String signature = latest.signature();
        AtomicWorkbenchShareTargetRepository.Descriptor descriptor = descriptor(latest);
        IO.execute(() -> {
            AtomicWorkbenchShareTargetRepository.Result result = AtomicWorkbenchShareTargetRepository.load(activity.getApplicationContext(), descriptor, android.os.Process.myUid() / 100000);
            main.post(() -> {
                if (closed || current == null || !signature.equals(current.signature()) || !result.available) return;
                java.util.HashSet<String> packages = new java.util.HashSet<>();
                for (AtomicWorkbenchShareTargetRepository.Target target : result.targets) packages.add(target.component.getPackageName());
                supportedPackages = packages;
            });
        });
        render(); if (!initializing && callback != null) callback.onChanged();
    }

    void refreshAppearance(UiKit value) {
        ui = value; root.setBackground(ui.round(ui.card, ui.surfaceRadiusDp(18)));
        contentPanel.refreshAppearance(value);
        dismissMenu(); clearHover(); if (scroller != null) scroller.stop();
        if (controls != null) { controls.close(); controls = null; }
        summary.setTextColor(current == null || current.empty() ? ui.muted : ui.text);
        clear.setTextColor(ui.text); help.setColorFilter(ui.accent); render();
    }

    private void showMenu() {
        if (closed || activity.isDestroyed()) return;
        if (current == null || current.state == AtomicWorkbenchPendingPayload.State.READ_FAILED) { acceptPending(); notice("正在重新读取素材记录，请稍后重试"); return; }
        if (current != null && !current.empty()) { showControls(); return; }
        if (dialog != null) dialog.dismiss();
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        Button files = ui.button("选择图片、视频或文件");
        files.setOnClickListener(v -> { dismissMenu(); pickFiles(); }); body.addView(files, ui.wrap());
        Button clipboard = ui.button("读取剪贴板文字");
        clipboard.setOnClickListener(v -> { dismissMenu(); readClipboard(); }); body.addView(clipboard, ui.margins(0, 8, 0, 0));
        TextView hint = ui.text("添加后可在已存素材中管理、分享或长按拖出；由接收应用选择好友并确认发送。", 12, ui.muted, false);
        body.addView(hint, ui.margins(0, 8, 0, 0));
        dialog = ui.glassDialog("流转素材", body, null, null, "关闭");
    }

    private void dismissMenu() {
        if (targetManagementDialog != null) { targetManagementDialog.dismiss(); targetManagementDialog = null; }
        if (dialog != null) { dialog.dismiss(); dialog = null; }
    }

    private void showControls() {
        dismissMenu(); if (controls != null) controls.close();
        controls = new AtomicWorkbenchPendingControls(activity, ui, repository, new AtomicWorkbenchPendingControls.Callback() {
            @Override public void add() { controls.close(); controls = null; showAddMenu(); }
            @Override public void share() { showShareTargets(); }
            @Override public void open(AtomicWorkbenchPendingPayload snapshot, String id) { openPending(snapshot, id); }
            @Override public boolean drag(View source, AtomicWorkbenchPendingPayload snapshot, String id, boolean textOnly, Runnable onEnded) {
                return startPendingDrag(source, snapshot, id, textOnly, onEnded);
            }
        }); controls.setTextTool(textTool); controls.show(current);
    }

    private void showAddMenu() {
        if (closed) return; dismissMenu();
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        Button files = ui.button("选择图片、视频或文件"); files.setMinimumHeight(ui.dp(48));
        files.setOnClickListener(v -> { dismissMenu(); pickFiles(); }); body.addView(files, ui.wrap());
        Button clipboard = ui.button("读取剪贴板文字"); clipboard.setMinimumHeight(ui.dp(48));
        clipboard.setOnClickListener(v -> { dismissMenu(); readClipboard(); }); body.addView(clipboard, ui.margins(0, 8, 0, 0));
        dialog = ui.glassDialog("添加流转素材", body, null, null, "取消");
    }

    private void showShareTargets() {
        if (current == null || closed) return;
        showShareTargets(current);
    }

    private void showShareTargets(AtomicWorkbenchPendingPayload snapshot) {
        if (snapshot == null || !snapshot.deliverable() || closed) { notice("有素材已失效，请先移除或选择有效单项"); return; }
        dismissMenu();
        targetSnapshot = snapshot;
        AtomicWorkbenchShareTargetRepository.Descriptor descriptor = descriptor(snapshot);
        long request = ++targetQuery;
        LinearLayout body = new LinearLayout(activity); body.setOrientation(LinearLayout.VERTICAL);
        TextView state = ui.text("正在读取支持此内容的手机分享入口…", 13, ui.muted, false); body.addView(state, ui.wrap());
        Dialog opening = ui.glassDialog("选择分享入口", body, null, null, "取消"); dialog = opening;
        IO.execute(() -> {
            AtomicWorkbenchShareTargetRepository.Result result = AtomicWorkbenchShareTargetRepository.load(activity.getApplicationContext(), descriptor, android.os.Process.myUid() / 100000);
            main.post(() -> {
                if (closed || request != targetQuery || dialog != opening || !opening.isShowing() || targetSnapshot != snapshot) return;
                renderShareTargets(body, state, opening, result, descriptor, snapshot);
            });
        });
    }

    private void renderShareTargets(LinearLayout body, TextView state, Dialog opening,
            AtomicWorkbenchShareTargetRepository.Result result, AtomicWorkbenchShareTargetRepository.Descriptor descriptor, AtomicWorkbenchPendingPayload snapshot) {
        if (closed || dialog != opening || !opening.isShowing() || targetSnapshot != snapshot) return;
        body.removeAllViews();
        java.util.List<AtomicWorkbenchShareTargetRepository.Target> visible = sharePreferences.visibleOrdered(result.targets);
        String error = sharePreferences.status();
        String message = !error.isEmpty() ? error : !result.message.isEmpty() ? result.message
                : visible.isEmpty() ? "当前入口已隐藏，可在管理中恢复" : "";
        if (!message.isEmpty()) { state.setText(message); body.addView(state, ui.wrap()); }
        Button manage = ui.button("管理分享入口"); manage.setMinimumHeight(ui.dp(48));
        manage.setOnClickListener(v -> {
            if (targetManagementDialog != null) targetManagementDialog.dismiss();
            targetManagementDialog = AtomicWorkbenchShareTargetControls.show(activity, ui, result.targets, sharePreferences,
                    () -> renderShareTargets(body, state, opening, result, descriptor, snapshot));
        }); body.addView(manage, ui.margins(0, 0, 0, 4));
        if (error.isEmpty()) for (AtomicWorkbenchShareTargetRepository.Target target : visible) {
                    Button choice = ui.button(target.appLabel.equals(target.label) ? target.label : target.appLabel + " · " + target.label);
                    choice.setMinimumHeight(ui.dp(48)); choice.setTag("atomic-workbench-share-target:" + target.key());
                    choice.setOnClickListener(v -> {
                        choice.setEnabled(false);
                        IO.execute(() -> {
                            boolean valid = AtomicWorkbenchShareTargetRepository.contains(activity.getApplicationContext(), descriptor, target);
                            main.post(() -> {
                                if (closed || dialog != opening || !opening.isShowing() || targetSnapshot != snapshot) return;
                                choice.setEnabled(true);
                                if (!valid) { notice("此入口已变化或不再支持当前内容，请重新选择"); return; }
                                dismissMenu(); send(snapshot, target.component.getPackageName(), target.component);
                            });
                        });
                    });
                    body.addView(choice, ui.margins(0, 4, 0, 0));
                }
    }

    private void pickFiles() {
        Intent request = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*").putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try { activity.startActivityForResult(request, PICK_FILES); }
        catch (RuntimeException unavailable) { notice("系统文件选择器不可用"); }
    }

    private void readClipboard() {
        collector.readCurrentClipboard();
        try {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            String text = clip == null || clip.getItemCount() == 0 ? "" : AtomicWorkbenchTransferPolicy.text(clip.getItemAt(0).getText());
            if (text.isEmpty()) { notice("剪贴板中没有可流转的文字"); return; }
            addText(text);
        } catch (IOException | RuntimeException error) { notice(error instanceof IOException ? error.getMessage() : "暂时无法读取剪贴板文字"); }
    }

    boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == PICK_DIRECTORY) {
            if (resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
                try {
                    if ((data.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) == 0
                            || activity.checkUriPermission(data.getData(), android.os.Process.myPid(), android.os.Process.myUid(),
                                    Intent.FLAG_GRANT_READ_URI_PERMISSION) != android.content.pm.PackageManager.PERMISSION_GRANTED)
                        throw new SecurityException("Directory read permission was not granted");
                    activity.getContentResolver().takePersistableUriPermission(data.getData(), Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    collector.repository.refresh(AtomicWorkbenchContentItem.Kind.FILES, true);
                    notice("已允许读取此文件夹，可在文件区查看");
                } catch (RuntimeException denied) { notice("此文件夹没有提供持续读取授权，请重新选择"); }
            }
            return true;
        }
        if (requestCode != PICK_FILES) return false;
        if (resultCode == Activity.RESULT_OK && data != null) importContent(new Intent(data), true, null, null);
        return true;
    }

    private void pickDirectory() {
        Intent request = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        try { activity.startActivityForResult(request, PICK_DIRECTORY); }
        catch (RuntimeException unavailable) { notice("系统文件夹选择器不可用"); }
    }

    private void requestContentAccess(AtomicWorkbenchContentItem.Kind kind) {
        try {
            if (kind == AtomicWorkbenchContentItem.Kind.MEDIA) {
                activity.requestPermissions(new String[]{android.Manifest.permission.READ_MEDIA_IMAGES,
                        android.Manifest.permission.READ_MEDIA_VIDEO, android.Manifest.permission.READ_MEDIA_VISUAL_USER_SELECTED}, READ_MEDIA);
            } else {
                contentPanel.dismiss();
                activity.startActivity(new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                        Uri.parse("package:" + activity.getPackageName())));
            }
        } catch (RuntimeException unavailable) { notice("无法打开内容访问设置，可先选择文件或授权文件夹"); }
    }

    boolean onRequestPermissionsResult(int requestCode) {
        if (requestCode != READ_MEDIA) return false;
        collector.repository.refresh(AtomicWorkbenchContentItem.Kind.MEDIA, true); return true;
    }

    void setForeground(boolean foreground) {
        this.foreground = foreground;
        collector.setForeground(foreground);
        if (!foreground) {
            revokeExtractedTextDrag();
            ++operation; if (stage != null) { stage.cancel(); stage = null; }
            if (pendingImport != null) { pendingImport.close(); pendingImport = null; } loading = false;
            contentPanel.dismiss(); dismissMenu(); if (controls != null) { controls.close(); controls = null; }
            clearHover(); if (scroller != null) scroller.stop(); render();
        }
    }

    private void useContent(java.util.List<AtomicWorkbenchContentItem> items, boolean open) {
        if (closed || loading || items == null || items.isEmpty()) return;
        try {
            boolean text = items.get(0).kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD;
            Intent source = text ? AtomicWorkbenchContentSelection.textResult(items.get(0)) : AtomicWorkbenchContentSelection.pickerResult(items);
            importContent(source, !text, null, null, open);
        } catch (IOException invalid) { notice(invalid.getMessage()); }
    }

    private void openPending(AtomicWorkbenchPendingPayload snapshot, String id) {
        IO.execute(() -> {
            AtomicWorkbenchPendingPayload selected = null;
            try { selected = repository.delivery(snapshot.id, snapshot.revision, id, false); check(selected); }
            catch (IOException | RuntimeException failed) { selected = null; }
            AtomicWorkbenchPendingPayload value = selected;
            main.post(() -> { if (!closed) { if (value == null) notice("此素材已变化或无法读取，请重新选择"); else openFrozen(value); } });
        });
    }
    private void openFrozen(AtomicWorkbenchPendingPayload snapshot) {
        if (snapshot.files.size() != 1) { notice("请选择一个文件打开"); return; }
        AtomicWorkbenchPendingPayload.FileItem file = snapshot.files.get(0);
        try {
            Intent view = new Intent(Intent.ACTION_VIEW).setDataAndType(Uri.parse(file.uri), file.mime)
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            view.setClipData(clip(snapshot)); activity.startActivity(view);
        } catch (RuntimeException unavailable) { notice("此文件暂时无法打开，可选择其他手机应用或刷新内容"); }
    }

    void bindDropTarget(View view, Supplier<String> packageName) {
        view.setOnDragListener((target, event) -> onDrag(target, event, packageName.get()));
    }

    void bindScrollTarget(android.widget.HorizontalScrollView viewport) {
        if (scroller != null) scroller.close();
        scroller = new AtomicWorkbenchDragScroller(viewport, activity.getResources().getDisplayMetrics().density);
        viewport.setOnDragListener((target, event) -> {
            if (closed || event.getClipDescription() == null || sortEvent(event)) return false;
            scroller.event(target, event);
            return event.getAction() != DragEvent.ACTION_DROP;
        });
    }

    private void clearHover() {
        if (hovered != null) { hovered.setForeground(hoverForeground); hovered = null; hoverForeground = null; render(); }
    }

    private void hover(View target, String packageName, boolean supported) {
        if (hovered == target) return;
        clearHover(); hovered = target; hoverForeground = target.getForeground();
        target.setForeground(ui.roundStroke(android.graphics.Color.TRANSPARENT, ui.surfaceRadiusDp(14), supported ? ui.accent : ui.muted, 2));
        target.performHapticFeedback(android.view.HapticFeedbackConstants.VIRTUAL_KEY);
        String label = "此应用";
        try { label = activity.getPackageManager().getApplicationLabel(activity.getPackageManager().getApplicationInfo(packageName, 0)).toString(); }
        catch (RuntimeException | android.content.pm.PackageManager.NameNotFoundException unavailable) { }
        summary.setText(supported ? "松开后尝试分享给“" + label + "”" : "“" + label + "”不支持当前内容");
    }

    boolean onDrag(View target, DragEvent event, String packageName) {
        if (sortEvent(event)) return false;
        if (scroller != null) scroller.event(target, event);
        if (event.getAction() == DragEvent.ACTION_DRAG_EXITED || event.getAction() == DragEvent.ACTION_DRAG_ENDED
                || event.getAction() == DragEvent.ACTION_DROP) clearHover();
        DragSession session = session(event);
        if (closed || !AtomicWorkbenchTransferPolicy.validPackage(packageName) || activity.getPackageName().equals(packageName)) return false;
        boolean own = event.getLocalState() instanceof DragSession || ownDescription(event);
        boolean supported = !own || session != null && (current == null || session.frozen != current || supportedPackages == null || supportedPackages.contains(packageName));
        switch (event.getAction()) {
            case DragEvent.ACTION_DRAG_STARTED:
                return event.getClipDescription() != null && (!own || session != null);
            case DragEvent.ACTION_DROP:
                if (!supported) { notice("此应用不支持当前内容，请选择其他分享入口"); return false; }
                if (own) { if (session == null || session.consumed) return false; session.consumed = true; send(session.frozen, packageName, null); return true; }
                if (loading) return false;
                if (event.getClipData() == null) return false;
                DragAndDropPermissions permission = activity.requestDragAndDropPermissions(event);
                Intent incoming = new Intent(Intent.ACTION_SEND_MULTIPLE);
                incoming.setClipData(event.getClipData());
                importContent(incoming, false, permission, packageName); return true;
            case DragEvent.ACTION_DRAG_ENTERED:
            case DragEvent.ACTION_DRAG_LOCATION:
                hover(target, packageName, supported); return true;
            case DragEvent.ACTION_DRAG_EXITED:
            case DragEvent.ACTION_DRAG_ENDED:
                return true;
            default: return false;
        }
    }

    static final class DeliverySnapshot {
        final String payloadId, text; final long revision;
        final boolean hasFiles, ready, textReady;
        private final AtomicWorkbenchPendingPayload frozen;
        DeliverySnapshot(AtomicWorkbenchPendingPayload value) {
            frozen = value; payloadId = value.id; revision = value.revision; text = value.text;
            hasFiles = !value.files.isEmpty(); ready = value.deliverable();
            textReady = !value.text.isEmpty() && !value.textExpired && value.state != AtomicWorkbenchPendingPayload.State.READ_FAILED;
        }
    }
    DeliverySnapshot deliverySnapshot() { return current == null ? null : new DeliverySnapshot(current); }
    DeliverySnapshot snapshotForDrop(DragEvent event) { DragSession value = session(event); return value == null || value.consumed ? null : new DeliverySnapshot(value.frozen); }
    boolean acceptsDrop(DeliverySnapshot snapshot, String packageName, int uid) {
        return snapshot != null && snapshot.ready && AtomicWorkbenchShareTargetRepository.accepts(activity,
                descriptor(snapshot.frozen), packageName, uid);
    }
    /** The authenticated private source owns the top window after a refused drop. */
    boolean requestExtractedTextPasteSetup(DragEvent event) {
        DragSession value = session(event);
        if (value == null || event.getAction() != DragEvent.ACTION_DROP || value.owner == this
                || !(value.owner.activity instanceof AtomicWorkbenchExtractionActivity)) return false;
        value.pasteSetupRequested = true;
        return true;
    }
    boolean consumeDrop(DragEvent event, DeliverySnapshot snapshot) {
        return consumeDrop(event, snapshot, null);
    }
    /** Only the authenticated private source defers delivery until both source windows restore. */
    boolean consumeDrop(DragEvent event, DeliverySnapshot snapshot, java.util.function.Consumer<Boolean> delivery) {
        DragSession value = session(event);
        if (snapshot == null || value == null || value.consumed || value.frozen != snapshot.frozen
                || !value.frozen.id.equals(snapshot.payloadId) || value.frozen.revision != snapshot.revision
                || event.getAction() != DragEvent.ACTION_DROP) return false;
        value.consumed = true;
        if (delivery != null) {
            if (value.owner != this && value.owner.activity instanceof AtomicWorkbenchExtractionActivity) {
                value.windowDelivery = () -> {
                    if (!closed && foreground && !activity.isFinishing() && !activity.isDestroyed()
                            && !value.expired && !value.owner.closed
                            && ((AtomicWorkbenchExtractionActivity) value.owner.activity).currentTextDeliverySource())
                        delivery.accept(true);
                };
            } else delivery.accept(false);
        }
        return true;
    }
    void shareSnapshot(DeliverySnapshot snapshot, String packageName, java.util.function.Consumer<Intent> delivery) {
        if (snapshot == null || !snapshot.ready || delivery == null) { notice("此素材无法整体分享，请重新选择有效单项"); return; }
        send(snapshot.frozen, packageName, null, delivery);
    }
    private DragSession session(DragEvent event) {
        if (event == null || sortEvent(event) || closed) return null;
        DragSession value = activeDrag;
        boolean extracted = false;
        if (value == null && activity instanceof AtomicWorkbenchActivity && foreground
                && !activity.isDestroyed() && !activity.isFinishing()) {
            value = extractedTextDrag;
            extracted = value != null && extractedTextDragCurrent(value);
        }
        if (value == null || value.owner != this && !extracted || value.ended || value.consumed || value.expired) return null;
        Object local = event.getLocalState();
        if (local != null && local != value) return null;
        if (local != null && !extracted) return value;
        // Dialog and Activity are separate ViewRoots; Android intentionally omits localState
        // there. A per-gesture capability identifies only this live frozen payload.
        if (!ownDescription(event)) return null;
        try {
            android.os.PersistableBundle extras = event.getClipDescription().getExtras();
            return extras != null && value.nonce.equals(extras.getString(DRAG_NONCE))
                    && value.frozen.id.equals(extras.getString(DRAG_ID))
                    && value.frozen.revision == extras.getLong(DRAG_REVISION, -1) ? value : null;
        } catch (RuntimeException invalid) { return null; }
    }
    private static boolean extractedTextDragCurrent(DragSession value) {
        AtomicWorkbenchTransfer source = value.owner;
        if (extractedTextDrag != value || source.closed || source.activeDrag != value
                || value.ended || value.consumed || value.expired || !value.frozen.files.isEmpty()
                || !(source.activity instanceof AtomicWorkbenchExtractionActivity)) return false;
        // The source rechecks its accepted capture/configuration and STARTED lifetime.
        // Check the exact lease again because revocation may close its source dialogs.
        if (!((AtomicWorkbenchExtractionActivity) source.activity).currentTextDragSource()) {
            source.revokeExtractedTextDrag(); return false;
        }
        return extractedTextDrag == value && source.activeDrag == value && !source.closed
                && !value.ended && !value.consumed && !value.expired;
    }
    private void revokeExtractedTextDrag() {
        DragSession value = extractedTextDrag;
        if (value == null || value.owner != this) return;
        extractedTextDrag = null; value.expired = true;
        try { value.source.cancelDragAndDrop(); } catch (RuntimeException ignored) { }
        finally { endDrag(value); }
    }
    private static boolean ownDescription(DragEvent event) { return event.getClipDescription() != null && event.getClipDescription().hasMimeType(DRAG_MIME); }
    private static boolean sortEvent(DragEvent event) { return event.getClipDescription() != null && event.getClipDescription().hasMimeType(AtomicWorkbenchPendingControls.SORT_MIME); }
    private static final class DragSession {
        final AtomicWorkbenchTransfer owner; final AtomicWorkbenchPendingPayload frozen; final Runnable onEnded;
        final View source;
        final String nonce = java.util.UUID.randomUUID().toString().replace("-", "");
        Runnable timeout;
        Runnable windowDelivery;
        boolean ended, consumed, expired, pasteSetupRequested;
        DragSession(AtomicWorkbenchTransfer owner, View source, AtomicWorkbenchPendingPayload frozen, Runnable onEnded) { this.owner = owner; this.source = source; this.frozen = frozen; this.onEnded = onEnded; }
    }
    private void endDrag(Object state) {
        if (!(state instanceof DragSession)) return;
        DragSession value = (DragSession) state;
        if (value.owner != this || value.ended) return;
        if (value.timeout != null) main.removeCallbacks(value.timeout);
        if (extractedTextDrag == value) extractedTextDrag = null;
        value.ended = true; if (activeDrag == value) activeDrag = null;
        Runnable delivery = value.windowDelivery; value.windowDelivery = null;
        if (value.onEnded != null) try { value.onEnded.run(); } catch (RuntimeException ignored) { }
        // The source restores its Dialog and Activity leases in onEnded before opening this dialog.
        if (value.pasteSetupRequested && !value.expired && !closed
                && activity instanceof AtomicWorkbenchExtractionActivity)
            ((AtomicWorkbenchExtractionActivity) activity).showTextPasteSetup();
        // Do not race ACTION_DRAG_ENDED's Window attribute restoration with target input binding.
        if (delivery != null && !value.expired && !closed) main.post(delivery);
    }
    private boolean startPendingDrag(View source, AtomicWorkbenchPendingPayload snapshot, String itemId, boolean textOnly, Runnable ended) {
        AtomicWorkbenchPendingPayload selected;
        try {
            selected = repository.delivery(snapshot.id, snapshot.revision, itemId, textOnly);
            check(selected);
        } catch (IOException | RuntimeException invalid) { ended(ended); notice("素材不存在或已过期，请重新添加"); return false; }
        return beginDrag(source, selected, ended);
    }
    private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended) {
        return beginDrag(source, snapshot, ended, false);
    }
    private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended, boolean accessibility) {
        return beginDrag(source, snapshot, ended, accessibility, false);
    }
    private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended, boolean accessibility, boolean extractedText) {
        return beginDrag(source, snapshot, ended, accessibility, extractedText, null);
    }
    private boolean beginDrag(View source, AtomicWorkbenchPendingPayload snapshot, Runnable ended, boolean accessibility, boolean extractedText,
            AtomicWorkbenchSourceDragData appSource) {
        if (closed || source == null || !snapshot.deliverable()) { ended(ended); return false; }
        if (activeDrag != null) { ended(ended); notice("请先结束当前拖动"); return false; }
        DragSession session = new DragSession(this, source, snapshot, ended); activeDrag = session;
        if (extractedText && activity instanceof AtomicWorkbenchExtractionActivity) {
            if (!snapshot.files.isEmpty() || !((AtomicWorkbenchExtractionActivity) activity).currentTextDragSource()) {
                endDrag(session); return false;
            }
            if (extractedTextDrag != null && extractedTextDragCurrent(extractedTextDrag)) {
                endDrag(session); notice("请先结束当前拖动"); return false;
            }
            extractedTextDrag = session;
        }
        // The originating Dialog remains alive; Root controls its temporary window flags.
        source.setOnDragListener((view, event) -> { if (event.getAction() == DragEvent.ACTION_DRAG_ENDED) endDrag(event.getLocalState()); return event.getLocalState() == session; });
        boolean started = false;
        ClipData clip = dragClip(snapshot, session.nonce);
        View.DragShadowBuilder shadow = new View.DragShadowBuilder(source);
        if (appSource != null) {
            ClipDescription description = new ClipDescription(appSource.label, mimeTypes(clip.getDescription()));
            android.os.PersistableBundle extras = new android.os.PersistableBundle(appSource.decoration);
            extras.putAll(clip.getDescription().getExtras()); description.setExtras(extras);
            // Native receivers (including the OEM station) retain the original media URI.
            // Our authenticated window drop still delivers the verified frozen cache bytes.
            ClipData original = appSource.clip;
            ClipData decorated = new ClipData(description, original.getItemAt(0));
            for (int i = 1; i < original.getItemCount(); i++) decorated.addItem(original.getItemAt(i));
            clip = decorated; shadow = sourceShadow(source, snapshot);
        }
        try { started = source.startDragAndDrop(clip, shadow, session,
                View.DRAG_FLAG_GLOBAL | (snapshot.files.isEmpty() ? 0 : View.DRAG_FLAG_GLOBAL_URI_READ)
                        | (accessibility ? View.DRAG_FLAG_ACCESSIBILITY_ACTION : 0)); }
        catch (RuntimeException unavailable) { }
        if (!started) { endDrag(session); notice("暂时无法开始拖拽，请重试"); }
        else if (!session.ended) {
            session.timeout = () -> {
                if (activeDrag != session || session.ended) return;
                session.expired = true; activeDrag = null; // Revoke before requesting cancellation.
                try { source.cancelDragAndDrop(); } catch (RuntimeException ignored) { }
                finally { endDrag(session); } // Cancellation completion/cleanup, never proof of delivery.
            };
            main.postDelayed(session.timeout, 120_000L);
        }
        return started;
    }

    private static String[] mimeTypes(ClipDescription description) {
        String[] types = new String[description.getMimeTypeCount()];
        for (int i = 0; i < types.length; i++) types[i] = description.getMimeType(i);
        return types;
    }
    private View.DragShadowBuilder sourceShadow(View source, AtomicWorkbenchPendingPayload snapshot) {
        final int width = ui.dp(112), height = ui.dp(64), background = ui.cardHigh, foreground = ui.text;
        final String label = snapshot.files.isEmpty() ? "文字" : snapshot.files.size() > 1 ? snapshot.files.size() + " 个文件"
                : snapshot.files.get(0).image() ? "图片" : snapshot.files.get(0).video() ? "视频" : "文件";
        return new View.DragShadowBuilder(source) {
            @Override public void onProvideShadowMetrics(android.graphics.Point size, android.graphics.Point touch) {
                size.set(width, height); touch.set(width / 2, height / 2);
            }
            @Override public void onDrawShadow(android.graphics.Canvas canvas) {
                android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
                paint.setColor(background); canvas.drawRoundRect(0, 0, width, height, ui.dp(12), ui.dp(12), paint);
                paint.setColor(foreground); paint.setTextSize(android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP, 16,
                        source.getResources().getDisplayMetrics())); paint.setTextAlign(android.graphics.Paint.Align.CENTER);
                canvas.drawText(label, width / 2f, height / 2f - (paint.ascent() + paint.descent()) / 2f, paint);
            }
        };
    }

    boolean beginAppSourceDrag(View source, AtomicWorkbenchPendingPayload snapshot, AtomicWorkbenchContentPanel.DragSource state,
            AtomicWorkbenchSourceDragData payload) {
        if (closed || !foreground || !state.held() || activeDrag != null) { state.ended(); return false; }
        contentDragState = state; contentDragView = source; state.starting();
        if (callback != null) callback.onDragState(true);
        boolean started = beginDrag(source, snapshot, () -> {
            state.ended();
            if (contentDragState == state) {
                contentDragState = null; contentDragView = null;
                if (callback != null) callback.onDragState(false);
            }
        }, false, false, payload);
        if (started && contentDragState == state) state.started();
        return started;
    }

    private static final class ContentRead {
        final View source; final AtomicWorkbenchContentPanel.DragSource state;
        AtomicWorkbenchTransferStage.Job job;
        ContentRead(View source, AtomicWorkbenchContentPanel.DragSource state) { this.source = source; this.state = state; }
    }

    /** A direct history drag is independent of the user's pending queue. Source reads never run on the UI thread. */
    private void startContentDrag(View source, AtomicWorkbenchContentItem item, AtomicWorkbenchContentPanel.DragSource state) {
        if (closed || !foreground || !state.held() || activeDrag != null || contentRead != null) {
            state.ended(); notice("请先结束当前操作，再拖出此项"); return;
        }
        if (item.kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD) {
            try { beginContentDrag(source, textSnapshot(item.text()), state); }
            catch (IOException invalid) { state.ended(); notice(invalid.getMessage()); }
            return;
        }
        final Intent input;
        try { input = AtomicWorkbenchContentSelection.pickerResult(java.util.List.of(item)); }
        catch (IOException invalid) { state.ended(); notice(invalid.getMessage()); return; }
        ContentRead read = new ContentRead(source, state); contentRead = read;
        notice("正在准备此项；保持按住，松手可取消");
        read.job = AtomicWorkbenchTransferStage.start(activity, input, true, (staged, failure) -> {
            if (failure != null || staged == null) {
                main.post(() -> {
                    if (contentRead != read) return;
                    contentRead = null; state.ended(); notice(failure);
                });
                return;
            }
            IO.execute(() -> {
                AtomicWorkbenchPendingPayload prepared = null;
                try {
                    prepared = AtomicWorkbenchTransferStore.batch(activity, staged);
                    if (prepared.files.size() != 1) throw new IOException();
                    check(prepared);
                } catch (IOException | RuntimeException invalid) { prepared = null; /* Nothing is published or queued on failure. */ }
                AtomicWorkbenchPendingPayload ready = prepared;
                main.post(() -> {
                    if (contentRead != read || closed || !foreground || !state.held()) {
                        IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(activity, staged));
                        if (contentRead == read) { contentRead = null; state.ended(); }
                        return;
                    }
                    contentRead = null;
                    if (ready != null && beginContentDrag(source, ready, state)) AtomicWorkbenchTransferStore.published(staged);
                    else {
                        IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(activity, staged));
                        state.ended(); if (ready == null) notice("此项无法读取，请刷新或重新授权后重试");
                    }
                });
            });
        });
    }

    private boolean beginContentDrag(View source, AtomicWorkbenchPendingPayload snapshot, AtomicWorkbenchContentPanel.DragSource state) {
        if (closed || !foreground || !state.held()) { state.ended(); return false; }
        contentDragState = state; contentDragView = source;
        state.starting();
        if (callback != null) callback.onDragState(true);
        boolean started = beginDrag(source, snapshot, () -> {
            state.ended();
            if (contentDragState == state) {
                contentDragState = null; contentDragView = null;
                if (callback != null) callback.onDragState(false);
            }
        }, state.accessibility());
        if (started && contentDragState == state) state.started();
        return started;
    }

    private void cancelContentDrag() {
        ContentRead reading = contentRead; contentRead = null;
        if (reading != null) { if (reading.job != null) reading.job.cancel(); reading.state.ended(); }
        AtomicWorkbenchContentPanel.DragSource state = contentDragState;
        if (state != null) {
            DragSession drag = activeDrag;
            try { if (contentDragView != null) contentDragView.cancelDragAndDrop(); }
            catch (RuntimeException ignored) { }
            finally { endDrag(drag); }
        }
    }
    boolean startTextDrag(View source, String selectedText, Runnable onEnded) {
        try { return beginDrag(source, textSnapshot(selectedText), onEnded, false, true); }
        catch (IOException invalid) { ended(onEnded); notice(invalid.getMessage()); return false; }
    }
    private static void ended(Runnable callback) { if (callback != null) try { callback.run(); } catch (RuntimeException ignored) { } }
    void shareText(String selectedText) {
        try { showShareTargets(textSnapshot(selectedText)); }
        catch (IOException invalid) { notice(invalid.getMessage()); }
    }
    private static AtomicWorkbenchPendingPayload textSnapshot(String raw) throws IOException {
        String text = AtomicWorkbenchPendingPayload.text(raw); if (text.isEmpty()) throw new IOException("请先选择文字");
        return new AtomicWorkbenchPendingPayload(java.util.UUID.randomUUID().toString(), 0, text, System.currentTimeMillis(), false, java.util.List.of(), AtomicWorkbenchPendingPayload.State.READY);
    }
    void addText(String raw) {
        if (closed || loading) { notice("正在接收素材，请稍后再添加"); return; }
        try {
            AtomicWorkbenchPendingPayload value = textSnapshot(raw);
            presentImport(new AtomicWorkbenchTransferStore.Payload(value.text, value.textCreated), current, null);
        } catch (IOException invalid) { notice(invalid.getMessage()); }
    }

    private void send(AtomicWorkbenchPendingPayload snapshot, String packageName, android.content.ComponentName component) {
        send(snapshot, packageName, component, intent -> { if (callback != null) callback.onSend(intent, packageName); });
    }
    private void send(AtomicWorkbenchPendingPayload snapshot, String packageName, android.content.ComponentName component,
            java.util.function.Consumer<Intent> delivery) {
        if (closed || snapshot == null || !AtomicWorkbenchTransferPolicy.validPackage(packageName)) return;
        IO.execute(() -> {
          try {
            check(snapshot);
            AtomicWorkbenchShareTargetRepository.Result targets = AtomicWorkbenchShareTargetRepository.load(activity.getApplicationContext(), descriptor(snapshot), android.os.Process.myUid() / 100000);
            boolean found = false;
            for (AtomicWorkbenchShareTargetRepository.Target target : targets.targets)
                if (packageName.equals(target.component.getPackageName()) && (component == null || component.equals(target.component))) { found = true; break; }
            if (!targets.available || !found) throw new IOException();
            AtomicWorkbenchTransferStore.Payload payload = AtomicWorkbenchTransferStore.payload(snapshot);
            Intent share = new Intent(payload.uris.size() > 1 ? Intent.ACTION_SEND_MULTIPLE : Intent.ACTION_SEND)
                    .setType(AtomicWorkbenchTransferPolicy.commonMime(payload.mimes)).setPackage(packageName);
            if (component != null) share.setComponent(component);
            if (!payload.text.isEmpty()) share.putExtra(Intent.EXTRA_TEXT, payload.text);
            if (payload.uris.size() == 1) share.putExtra(Intent.EXTRA_STREAM, payload.uris.get(0));
            else if (payload.uris.size() > 1) share.putParcelableArrayListExtra(Intent.EXTRA_STREAM, new java.util.ArrayList<>(payload.uris));
            share.setClipData(clip(snapshot));
            if (closed) return;
            if (!payload.uris.isEmpty()) {
                share.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                // Root launches the task; the app owning this provider issues the read grant.
                // Removing a pending row never revokes an already delivered grant.
                for (Uri uri : payload.uris) activity.grantUriPermission(packageName, uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            }
            main.post(() -> { if (!closed) delivery.accept(share); });
          } catch (IOException | RuntimeException unavailable) { main.post(() -> notice("素材无法交给此应用，请重新添加或更换应用")); }
        });
    }

    private void check(AtomicWorkbenchPendingPayload value) throws IOException {
        if (!value.deliverable() || !value.text.isEmpty() && !AtomicWorkbenchTransferPolicy.fresh(value.textCreated, System.currentTimeMillis())) throw new IOException();
        long bytes = 0;
        for (AtomicWorkbenchPendingPayload.FileItem item : value.files) {
            long count = AtomicWorkbenchTransferStore.resolve(activity, Uri.parse(item.uri)).file.length();
            if (count > AtomicWorkbenchTransferPolicy.MAX_BYTES - bytes) throw new IOException(); bytes += count;
        }
    }

    private static ClipData clip(AtomicWorkbenchPendingPayload value) {
        return contentClip(value, null);
    }
    private static ClipData dragClip(AtomicWorkbenchPendingPayload value, String nonce) { return contentClip(value, nonce); }
    private static ClipData contentClip(AtomicWorkbenchPendingPayload value, String nonce) {
        ClipData data;
        java.util.LinkedHashSet<String> mimes = new java.util.LinkedHashSet<>();
        if (!value.text.isEmpty()) mimes.add("text/plain");
        for (AtomicWorkbenchPendingPayload.FileItem file : value.files) mimes.add(file.mime);
        if (nonce != null) mimes.add(DRAG_MIME);
        if (value.files.isEmpty()) data = new ClipData("流转文字", mimes.toArray(new String[0]), new ClipData.Item(value.text));
        else {
            data = new ClipData("流转文件", mimes.toArray(new String[0]), new ClipData.Item(value.text.isEmpty() ? null : value.text, null, null, Uri.parse(value.files.get(0).uri)));
            for (int index = 1; index < value.files.size(); index++) data.addItem(new ClipData.Item(Uri.parse(value.files.get(index).uri)));
        }
        if (nonce != null) {
            android.os.PersistableBundle extras = new android.os.PersistableBundle();
            extras.putString(DRAG_NONCE, nonce); extras.putString(DRAG_ID, value.id); extras.putLong(DRAG_REVISION, value.revision);
            data.getDescription().setExtras(extras);
        }
        return data;
    }

    private void importContent(Intent source, boolean picker, DragAndDropPermissions permission, String target) {
        importContent(source, picker, permission, target, false);
    }

    private void importContent(Intent source, boolean picker, DragAndDropPermissions permission, String target, boolean open) {
        if (loading || closed) { if (permission != null) permission.release(); return; }
        loading = true; long request = ++operation; render();
        Context application = activity.getApplicationContext();
        AtomicWorkbenchPendingPayload before = current;
        // Load the expected revision before any potentially blocking source reads.
        IO.execute(() -> {
            AtomicWorkbenchPendingPayload expected = before == null ? repository.load() : before;
            main.post(() -> {
                if (closed || activity.isDestroyed() || request != operation) { if (permission != null) permission.release(); return; }
                stage = AtomicWorkbenchTransferStage.start(application, source, picker, (next, failure) -> {
                    if (permission != null) permission.release();
                    main.post(() -> {
                        if (closed || activity.isDestroyed() || request != operation || !foreground) { IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(application, next)); return; }
                        stage = null; loading = false; render();
                        if (failure != null || next == null) { notice(failure); return; }
                        if (open) {
                            IO.execute(() -> {
                                AtomicWorkbenchPendingPayload one = null;
                                try { one = AtomicWorkbenchTransferStore.batch(application, next); if (one.files.size() != 1) throw new IOException(); check(one); AtomicWorkbenchTransferStore.published(next); }
                                catch (IOException | RuntimeException invalid) { AtomicWorkbenchTransferStore.discardUnpublished(application, next); one = null; }
                                AtomicWorkbenchPendingPayload selected = one;
                                main.post(() -> { if (!closed && request == operation) { if (selected == null) notice("请选择一个可读取的文件打开"); else openFrozen(selected); } });
                            });
                        } else presentImport(next, expected, target);
                    });
                });
            });
        });
    }

    private void presentImport(AtomicWorkbenchTransferStore.Payload next, AtomicWorkbenchPendingPayload expected, String target) {
        if (pendingImport != null) pendingImport.close();
        loading = true; render();
        if (expected == null) { IO.execute(() -> { AtomicWorkbenchPendingPayload before = repository.load(); main.post(() -> { if (closed) IO.execute(() -> AtomicWorkbenchTransferStore.discardUnpublished(activity, next)); else presentImport(next, before, target); }); }); return; }
        AtomicWorkbenchPendingImport[] owner = new AtomicWorkbenchPendingImport[1];
        owner[0] = new AtomicWorkbenchPendingImport(activity, ui, repository, expected, next, (result, failure) -> {
            if (closed || pendingImport != owner[0]) return;
            pendingImport = null; loading = false;
            if (result != null) { apply(result.snapshot); if (!result.success) notice(result.message); else if (target != null) send(result.snapshot, target, null); }
            else if (failure != null) notice(failure);
            render();
        });
        pendingImport = owner[0]; pendingImport.show();
    }

    private void clear() {
        if (current == null || current.empty()) return;
        AtomicWorkbenchPendingPayload captured = current;
        ui.glassDialog("清空流转素材", "仅移出流转队列，不删除原文件，已分享的缓存按原有效期保留。", "清空素材", () -> {
            ++operation; if (stage != null) { stage.cancel(); stage = null; } if (pendingImport != null) { pendingImport.close(); pendingImport = null; } loading = false;
            IO.execute(() -> { AtomicWorkbenchPendingRepository.Result result = repository.clear(captured.id, captured.revision); main.post(() -> { if (!closed) { apply(result.snapshot); if (!result.success) notice(result.message); } }); });
        }, "取消");
    }
    private void render() {
        String label = current == null ? "正在恢复已存素材…" : current.state == AtomicWorkbenchPendingPayload.State.READ_FAILED ? "素材记录读取失败 · 点按重试"
                : current.empty() ? "已存素材 · 点按管理" : "已存素材 · " + current.summary() + (current.state == AtomicWorkbenchPendingPayload.State.PARTIAL ? " · 部分失效" : current.state == AtomicWorkbenchPendingPayload.State.SAVE_FAILED ? " · 保存失败，原内容已保留" : "");
        summary.setText(loading ? "正在接收素材 · " + label : label);
        summary.setTextColor(current == null || current.empty() ? ui.muted : ui.text);
        clear.setVisibility(current == null || current.empty() ? View.GONE : View.VISIBLE); clear.setEnabled(true);
    }
    private void notice(String value) { if (value != null && !closed) Toast.makeText(activity, value, Toast.LENGTH_LONG).show(); }
    void close() {
        if (closed) return; closed = true; ++operation; ++targetQuery;
        cancelContentDrag();
        revokeExtractedTextDrag();
        if (activeDrag != null) endDrag(activeDrag);
        if (stage != null) stage.cancel(); if (pendingImport != null) pendingImport.close(); if (controls != null) controls.close();
        if (subscription != null) try { subscription.close(); } catch (Exception ignored) { }
        dismissMenu(); clearHover(); if (scroller != null) scroller.close(); contentPanel.close(); collector.close();
    }
    private static AtomicWorkbenchShareTargetRepository.Descriptor descriptor(AtomicWorkbenchPendingPayload value) { return AtomicWorkbenchShareTargetRepository.Descriptor.from(AtomicWorkbenchTransferStore.payload(value)); }
    private static String helpText() {
        return "应用间流转的目标是：在来源应用中长按图片、视频、文件或文字，直接拖到工作台里已打开的目标应用，松手交给该应用。允许进入目标应用自己的接收界面，最终发送由你确认。来源应用和跨窗口接收仍在适配，未打通的组合不能称为已支持。\n\n"
                + "按目标应用实际接收能力适配文字、图片、视频和文件，不以应用名单代替能力检查。优先核对图库到微信、QQ、浏览器，微信到QQ、浏览器，MT管理器到微信、QQ、浏览器。浏览器只接收图片或文字并执行搜索，不接收视频和文件。文字搜索打开必应网页；图片搜索仍待适配。不支持时提示“当前app暂不支持”。\n\n"
                + "这里的素材清单是独立辅助工具，可导入或保存文字和文件，每次最多16个文件、合计512MB，手机缓存保留24小时。手动选择分享入口仍可使用；它不等于来源应用间的直接拖拽。";
    }
}
