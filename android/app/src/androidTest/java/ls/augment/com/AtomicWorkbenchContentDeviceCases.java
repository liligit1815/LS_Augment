package ls.augment.com;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Dialog;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcel;
import android.os.SystemClock;
import android.provider.MediaStore;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Developer-APK-only phone-content acceptance. Original clip values and private
 * file names/contents remain in memory or a private, verified move-only backup.
 * UI actions use physical display-0 input; no share receiver is ever activated.
 */
final class AtomicWorkbenchContentDeviceCases {
    private final Instrumentation test;
    private final Context target;
    private final String token;
    private String prefix;
    private final JSONArray cases = new JSONArray(), untested = new JSONArray(), screens = new JSONArray();
    private final JSONArray clicks = new JSONArray(), layouts = new JSONArray();
    private final ArrayList<Activity> settings = new ArrayList<>();
    private final ArrayList<Backup> backups = new ArrayList<>();
    private final LinkedHashMap<String, Owned> owned = new LinkedHashMap<>();
    private final LinkedHashSet<Uri> inserted = new LinkedHashSet<>();
    private final ArrayList<AtomicWorkbenchContentRepository> extraRepositories = new ArrayList<>();
    private final File evidenceDirectory, backupDirectory;
    private Activity activity;
    private AtomicWorkbenchTransfer transfer;
    private AtomicWorkbenchContentCollector collector;
    private AtomicWorkbenchContentRepository repository;
    private AtomicWorkbenchContentPanel panel;
    private ClipboardManager clipboard;
    private ClipData originalClip;
    private Map<String, Object> originalPreferences;
    private boolean clipSaved, isolated, prefsSaved, transferClosed, sessionOwned;
    private long cutoff;
    private int failed, skipped;
    private String stage = "prepare";
    private JSONObject checkpoint;

    private AtomicWorkbenchContentDeviceCases(Instrumentation test) {
        this(test, UUID.randomUUID().toString().replace("-", ""));
    }
    private AtomicWorkbenchContentDeviceCases(Instrumentation test, String token) {
        this.token = token;
        this.test = test;
        target = test.getTargetContext();
        prefix = "DuoContentTest_" + token.substring(0, 12);
        evidenceDirectory = new File(target.getExternalFilesDir(null), "atomic-workbench-content-" + token.substring(0, 8));
        backupDirectory = new File(target.getFilesDir(), "workbench-content-acceptance-backup-" + token);
    }

    static JSONObject run(Instrumentation test, Bundle arguments) throws Exception {
        return new AtomicWorkbenchContentDeviceCases(test).execute(arguments == null ? new Bundle() : arguments);
    }

    private JSONObject execute(Bundle arguments) throws Exception {
        JSONObject report = new JSONObject().put("scope", "PHONE_SOURCE_REAL_COLLECTOR_REAL_WORKBENCH_CONTENT_UI")
                .put("inputMethod", "UI_AUTOMATION_INJECT_INPUT_EVENT_DISPLAY_0")
                .put("fontScale", target.getResources().getConfiguration().fontScale)
                .put("density", target.getResources().getDisplayMetrics().density)
                .put("systemPermissionsChanged", false).put("fontScaleChanged", false)
                .put("shareReceiverActivated", false).put("messagesSent", false)
                .put("originalClipboardRecorded", false).put("originalPrivateContentsRecorded", false)
                .put("cases", cases).put("untested", untested).put("screens", screens)
                .put("physicalInputs", clicks).put("actualBounds", layouts);
        boolean restored = false;
        try {
            stage = "preconditions";
            progress("begin");
            String fixtureLabel = arguments.getString("fixtureLabel", "");
            require(fixtureLabel != null && (fixtureLabel.isEmpty() || fixtureLabel.matches("[A-Za-z0-9_-]{1,24}")),
                    "INVALID_VISIBLE_FIXTURE_LABEL");
            if (!fixtureLabel.isEmpty()) prefix = "DuoContentTest_" + fixtureLabel;
            report.put("fixtureLabel", fixtureLabel.isEmpty() ? "UNIQUE_PER_RUN" : fixtureLabel);
            require(android.os.Build.VERSION.SDK_INT >= 34, "PUBLIC_DISPLAY_INPUT_API34_REQUIRED_FOR_ACCEPTANCE");
            require(new AppConfig(target).getBoolean(AtomicWorkbenchConfig.ENABLED), "WORKBENCH_MUST_ALREADY_BE_ENABLED");
            require(!AtomicWorkbenchCleanup.pending(), "PREVIOUS_WORKBENCH_CLEANUP_PENDING");
            require(!target.isDeviceProtectedStorage(), "CREDENTIAL_PROTECTED_CONTEXT_REQUIRED");
            File[] pendingBackups = target.getFilesDir().listFiles(file -> file.getName().startsWith("workbench-content-acceptance-backup-"));
            require(pendingBackups != null && pendingBackups.length == 0, "EXISTING_PRIVATE_ACCEPTANCE_BACKUP_REQUIRES_EXPLICIT_RECOVERY");
            require(noExistingWorkbenchTask(), "EXISTING_WORKBENCH_TASK_MUST_BE_CLOSED_BEFORE_ACCEPTANCE");
            android.os.PowerManager power = target.getSystemService(android.os.PowerManager.class);
            android.app.KeyguardManager keyguard = target.getSystemService(android.app.KeyguardManager.class);
            require(power != null && power.isInteractive() && keyguard != null && !keyguard.isKeyguardLocked(),
                    "PHONE_MUST_BE_AWAKE_AND_UNLOCKED");
            require(evidenceDirectory.isDirectory() || evidenceDirectory.mkdirs(), "EVIDENCE_DIRECTORY_UNAVAILABLE");
            progress("before_settings_open");
            Activity safe = openSettings();
            progress("after_settings_open");
            await(() -> main(safe::hasWindowFocus), "SETTINGS_FOREGROUND_REQUIRED_FOR_CLIP_BACKUP", 10_000L);
            clipboard = target.getSystemService(ClipboardManager.class);
            require(clipboard != null, "CLIPBOARD_SERVICE_UNAVAILABLE");
            main(() -> {
                boolean present = clipboard.hasPrimaryClip();
                ClipData value = clipboard.getPrimaryClip();
                require(!present || value != null, "ORIGINAL_CLIP_CANNOT_BE_SAFELY_BACKED_UP");
                originalClip = value == null ? null : new ClipData(value);
                return null;
            });
            // Refuse unsupported clips before any clipboard, preference or tree mutation.
            byte[] durableClip = encodeDurableClip(originalClip);
            progress("complete");
            stage = "isolate_private_state";
            progress("begin");
            AtomicWorkbenchTransfer.IO.submit(() -> { }).get(30, TimeUnit.SECONDS);
            progress("transfer_io_drained");
            require(backupDirectory.mkdir(), "PRIVATE_BACKUP_DIRECTORY_UNAVAILABLE");
            checkpoint = new JSONObject().put("session", token).put("uid", android.os.Process.myUid())
                    .put("user", android.os.Process.myUserHandle().toString()).put("boot", bootId())
                    .put("package", target.getPackageName()).put("prefix", prefix)
                    .put("clipPresent", originalClip != null).put("trees", new JSONArray()).put("rows", new JSONArray());
            writePrivate(new File(backupDirectory, "clipboard.parcel"), durableClip);
            require(sameClip(originalClip, decodeDurableClip(Files.readAllBytes(new File(backupDirectory, "clipboard.parcel").toPath()), originalClip != null)),
                    "PRIVATE_CLIPBOARD_PARCEL_READBACK_FAILED");
            saveCheckpoint(); clipSaved = true;
            progress("clipboard_checkpoint_verified");
            report.put("privateRecoverySession", token).put("clipBackup", "PRIVATE_PARCEL_SAME_BOOT_USER_SESSION_ONLY");
            isolate(new File(target.getFilesDir(), "workbench-content"), "content");
            isolate(new File(target.getFilesDir(), "atomic-workbench-share"), "share");
            isolate(new File(target.getCacheDir(), "workbench-transfer"), "transfer");
            isolate(new File(target.getFilesDir(), "workbench-pending-v2.bin"), "pending");
            isolate(new File(target.getFilesDir(), "workbench-pending-v2.bin.bak"), "pending-bak");
            isolate(new File(target.getFilesDir(), "workbench-pending-v2.bin.new"), "pending-new");
            progress("private_trees_isolated");
            SharedPreferences preferences = transferPreferences();
            originalPreferences = copyPreferences(preferences.getAll()); prefsSaved = true;
            checkpoint.put("preferences", encodePreferences(originalPreferences)); saveCheckpoint();
            require(originalPreferences.equals(decodePreferences(new JSONObject(new String(Files.readAllBytes(
                    new File(backupDirectory, "checkpoint.json").toPath()), StandardCharsets.UTF_8)).getJSONArray("preferences"))),
                    "PRIVATE_PREFERENCE_CHECKPOINT_READBACK_MISMATCH");
            require(preferences.edit().clear().commit(), "TRANSFER_PREFERENCES_ISOLATION_FAILED");
            isolated = true;
            cutoff = System.currentTimeMillis();
            AtomicWorkbenchContentStore.Stored clean = new AtomicWorkbenchContentStore.Stored();
            clean.clearedThrough.put(AtomicWorkbenchContentItem.Kind.MEDIA, cutoff);
            clean.clearedThrough.put(AtomicWorkbenchContentItem.Kind.FILES, cutoff);
            new AtomicWorkbenchContentStore(contentDirectory()).write(clean);
            main(() -> { clipboard.setPrimaryClip(ClipData.newPlainText("Duo acceptance", clipText("initial"))); return null; });
            progress("complete");
            stage = "open_empty_workbench";
            progress("before_activity_start");
            activity = test.startActivitySync(new Intent(target, AtomicWorkbenchActivity.class)
                    .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            progress("after_activity_start");
            sessionOwned = true;
            transfer = main(() -> (AtomicWorkbenchTransfer) get(activity, "transfer"));
            collector = (AtomicWorkbenchContentCollector) get(transfer, "collector");
            repository = collector.repository;
            panel = (AtomicWorkbenchContentPanel) get(transfer, "contentPanel");
            await(() -> main(() -> get(activity, "client") != null
                    && (Boolean) invoke(activity, "mainReady", new Class<?>[0])), "EMPTY_WORKBENCH_HOME_NOT_READY", 20_000L);
            Bundle initial = client().status();
            ArrayList<Bundle> windows = initial.getParcelableArrayList("windows", Bundle.class);
            require(windows != null, "INITIAL_WORKBENCH_STATUS_UNAVAILABLE");
            for (Bundle window : windows) {
                ArrayList<String> running = window.getStringArrayList("running_packages");
                require(running != null && running.isEmpty(), "WORKBENCH_CONTAINS_USER_APPLICATION_TASKS");
            }
            report.put("emptySessionVerified", true);
            progress("complete");
            runCase("three_region_controls_and_bounds", () -> {
                main(() -> { transfer.showTools(); return null; });
                test.waitForIdleSync();
                for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                    View view = main(() -> transfer.view()
                            .findViewWithTag("atomic-workbench-content-open:" + kind.name()));
                    require(view != null, "REGION_CONTROL_MISSING");
                    JSONObject bounds = main(() -> rectangle(view));
                    require(view.getHeight() / target.getResources().getDisplayMetrics().density >= 47.5f,
                            "REGION_TOUCH_HEIGHT_LESS_THAN_48_DP");
                    layouts.put(bounds.put("region", kind.name()));
                }
                capture("01-three-regions", transfer.view());
                main(() -> { ((Dialog) get(transfer, "dialog")).dismiss(); return null; });
            });
            runCase("clipboard_foreground_listener_and_disk_restore", this::clipboardCaptureAndRestore);
            runCase("phone_source_automatic_add_delete_observer", this::phoneObserver);
            runCase("media_physical_preview_and_staging", this::mediaUi);
            runCase("downloads_physical_selection_and_staging", this::filesUi);
            runCase("share_management_physical_safe_controls", this::shareManagement);
            runCase("clipboard_physical_copy_single_delete_clear", this::clipboardUi);
            runCase("content_physical_direct_drag_cancel_and_queue_preservation", this::directContentDrags);
        } catch (Untested unavailable) {
            skipped++;
            cases.put(new JSONObject().put("name", stage).put("status", "untested").put("reason", unavailable.code));
            untested.put(unavailable.code);
        } catch (Exception | AssertionError failure) {
            failed++;
            cases.put(new JSONObject().put("name", stage).put("status", "failed").put("failure", safeFailure(failure)));
        } finally {
            JSONObject recovery = new JSONObject();
            report.put("recovery", recovery);
            boolean stopped = false, rootReturned = !sessionOwned, publicRemoved = true, privateRestored = true,
                    prefsRestored = !prefsSaved, clipRestored = !clipSaved;
            try {
                stage = "stop_collectors_and_drain";
                progress("begin");
                if (transfer != null) main(() -> { transfer.close(); return null; });
                // Collector.close posts to the main queue; this sync callback runs behind it.
                main(() -> null);
                progress("main_queue_drained");
                if (repository != null) drainRepository(repository);
                for (AtomicWorkbenchContentRepository extra : extraRepositories) {
                    extra.close(); drainRepository(extra);
                }
                await(() -> !AtomicWorkbenchTransferStage.busy(), "CONTENT_SOURCE_COPY_DID_NOT_STOP_BEFORE_PRIVATE_RESTORE", 15_000L);
                AtomicWorkbenchTransfer.IO.submit(() -> { }).get(30, TimeUnit.SECONDS);
                main(() -> null);
                transferClosed = true; stopped = true;
                recovery.put("collectorClosedAndWorkersDrained", true);
                progress("complete");
            } catch (Exception | AssertionError failure) {
                recovery.put("workerDrainFailure", safeFailure(failure));
                progress("failed");
            }
            if (sessionOwned && activity != null) try {
                stage = "restore_home_session";
                progress("begin");
                main(() -> { invoke(activity, "requestCloseAll", new Class<?>[]{boolean.class}, true); return null; });
                ((ExecutorService) get(activity, "WORKER")).submit(() -> { }).get(25, TimeUnit.SECONDS);
                await(() -> !AtomicWorkbenchCleanup.pending(), "PHONE_HOME_RECOVERY_NOT_CONFIRMED", 30_000L);
                rootReturned = true; recovery.put("rootCleanupConfirmed", true);
                progress("complete");
            } catch (Exception | AssertionError failure) { recovery.put("rootRecoveryFailure", safeFailure(failure)); progress("failed"); }
            // Delete only exact content URIs returned by our own insert calls.
            stage = "remove_owned_public_rows";
            progress("begin");
            for (Uri uri : new ArrayList<>(inserted)) try { deleteOwned(uri); }
            catch (Exception failure) { publicRemoved = false; }
            recovery.put("ownedMediaStoreRowsRemoved", publicRemoved);
            progress(publicRemoved ? "complete" : "failed");
            stage = "restore_private_state";
            progress("begin");
            if (stopped) {
                for (int index = backups.size() - 1; index >= 0; index--) try { backups.get(index).restore(); }
                catch (Exception | AssertionError failure) { privateRestored = false; }
                recovery.put("originalPrivateTreesByteVerified", privateRestored);
                if (!privateRestored) recovery.put("originalBackupsRetained", true)
                        .put("privateBackupDirectory", backupDirectory.getAbsolutePath());
                if (prefsSaved) try {
                    restorePreferences(originalPreferences);
                    prefsRestored = originalPreferences.equals(copyPreferences(transferPreferences().getAll()));
                } catch (Exception failure) { prefsRestored = false; }
                recovery.put("originalTransferPreferenceMapRestored", prefsRestored);
            } else {
                privateRestored = false;
                recovery.put("originalBackupsRetained", true).put("privateBackupDirectory", backupDirectory.getAbsolutePath());
            }
            progress(privateRestored && prefsRestored ? "complete" : "failed");
            // Restore only after a Collector-free page owns foreground clipboard access.
            stage = "restore_original_clipboard";
            progress("begin");
            if (clipSaved && stopped) try {
                Activity safe = openSettings();
                await(() -> main(safe::hasWindowFocus), "SETTINGS_NOT_FOREGROUND_FOR_CLIP_RESTORE", 10_000L);
                main(() -> { if (originalClip == null) clipboard.clearPrimaryClip(); else clipboard.setPrimaryClip(originalClip); return null; });
                clipRestored = main(() -> sameClip(originalClip, clipboard.getPrimaryClip()));
            } catch (Exception | AssertionError failure) { recovery.put("clipboardRecoveryFailure", safeFailure(failure)); }
            recovery.put("originalClipDataRestoredAndCompared", clipRestored);
            progress(clipRestored ? "complete" : "failed");
            restored = stopped && rootReturned && publicRemoved && privateRestored && prefsRestored && clipRestored;
            if (restored && backupDirectory.isDirectory()) {
                deleteIsolatedTree(backupDirectory);
            }
            if (restored) for (Activity safe : settings) try {
                main(() -> { if (!safe.isFinishing() && !safe.isDestroyed()) safe.finish(); return null; });
            } catch (Exception ignored) { }
        }
        untested.put("REAL_PROCESS_DEATH_RESTORE_NEW_REPOSITORY_ONLY");
        untested.put("THIRD_PARTY_RECEIVER_ACTIVATION_RECIPIENTS_AND_SENDING");
        untested.put("DIRECT_DRAG_FINAL_DROP_PASTE_SHARE_AND_EXTERNAL_APP_SOURCE_BRIDGE");
        untested.put("VIDEO_GIF_SAF_TREE_AND_PERMISSION_CHANGE_SCENARIOS");
        untested.put("OTHER_FONT_SCALES_LANDSCAPE_AND_LARGE_SCREENS_UNLESS_EXTERNALLY_RUN");
        return report.put("failedCases", failed).put("untestedCases", skipped)
                .put("recoveryConfirmed", restored).put("success", failed == 0 && restored)
                .put("status", failed > 0 || !restored ? "FAILED" : skipped > 0 ? "PARTIAL" : "PASSED_WITH_DECLARED_SCOPE");
    }

    private void clipboardCaptureAndRestore() throws Exception {
        openRegion(AtomicWorkbenchContentItem.Kind.CLIPBOARD);
        Dialog foreground = panelDialog();
        await(() -> main(() -> foreground != null && foreground.isShowing()
                && foreground.getWindow().getDecorView().hasWindowFocus()), "CLIPBOARD_DIALOG_NOT_FOCUSED_FOR_LISTENER", 8_000L);
        await(() -> containsText(clipText("initial")), "INITIAL_FOREGROUND_CLIP_NOT_CAPTURED", 12_000L);
        for (String label : new String[]{"A", "B"}) {
            main(() -> { clipboard.setPrimaryClip(ClipData.newPlainText("Duo acceptance", clipText(label))); return null; });
            await(() -> containsText(clipText(label)), "FOREGROUND_CLIP_LISTENER_DID_NOT_CAPTURE_OWN_TEXT", 10_000L);
        }
        AtomicWorkbenchContentRepository restored = new AtomicWorkbenchContentRepository(
                new AtomicWorkbenchPhoneContentSource(target), new AtomicWorkbenchContentStore(contentDirectory()),
                command -> new android.os.Handler(android.os.Looper.getMainLooper()).post(command));
        extraRepositories.add(restored);
        await(() -> hasText(restored.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD), clipText("A"))
                && hasText(restored.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD), clipText("B")),
                "NEW_REPOSITORY_DID_NOT_RESTORE_PRIVATE_CLIP_HISTORY", 10_000L);
        restored.close(); drainRepository(restored);
        closePanel();
    }

    private void phoneObserver() throws Exception {
        openRegion(AtomicWorkbenchContentItem.Kind.MEDIA);
        await(() -> !repository.snapshot(AtomicWorkbenchContentItem.Kind.MEDIA).loading
                && !repository.snapshot(AtomicWorkbenchContentItem.Kind.FILES).loading
                && !repository.snapshot(AtomicWorkbenchContentItem.Kind.MEDIA).cached
                && !repository.snapshot(AtomicWorkbenchContentItem.Kind.FILES).cached,
                "INITIAL_PHONE_SCAN_DID_NOT_SETTLE", 40_000L);
        Object source = get(repository, "source");
        await(() -> (Boolean) get(source, "observing"), "REAL_PHONE_SOURCE_OBSERVER_NOT_ACTIVE", 5_000L);
        long insertedAt = System.currentTimeMillis();
        Owned media = insert(true, "primary", png());
        Owned file = insert(false, "primary", (prefix + " owned text payload\n").getBytes(StandardCharsets.UTF_8));
        if (media.modified <= cutoff || file.modified <= cutoff)
            throw new Untested("PROVIDER_DID_NOT_PRESERVE_OWN_FUTURE_DATE_MODIFIED");
        await(() -> find(media) != null && find(file) != null, "OBSERVER_DID_NOT_AUTO_ADD_OWN_MEDIA_AND_DOWNLOAD", 40_000L);
        require(repository.snapshot(AtomicWorkbenchContentItem.Kind.MEDIA).updatedAt >= insertedAt
                && repository.snapshot(AtomicWorkbenchContentItem.Kind.FILES).updatedAt >= insertedAt,
                "OBSERVER_DID_NOT_PUBLISH_NEW_SNAPSHOTS");
        Owned temporaryMedia = insert(true, "observer_delete", png());
        Owned temporaryFile = insert(false, "observer_delete", (prefix + " temporary\n").getBytes(StandardCharsets.UTF_8));
        await(() -> find(temporaryMedia) != null && find(temporaryFile) != null, "OBSERVER_DID_NOT_ADD_TEMPORARY_OWN_ROWS", 40_000L);
        deleteOwned(temporaryMedia.uri); deleteOwned(temporaryFile.uri);
        await(() -> find(temporaryMedia) == null && find(temporaryFile) == null
                && find(media) != null && find(file) != null, "OBSERVER_DID_NOT_AUTO_REMOVE_DELETED_OWN_ROWS", 40_000L);
        assertOnlyOwned();
        closePanel();
    }

    private void mediaUi() throws Exception {
        Owned media = owned.get("media:primary");
        requireAvailable(media);
        openRegion(AtomicWorkbenchContentItem.Kind.MEDIA);
        AtomicWorkbenchContentItem item = awaitOwned(media);
        assertOnlyOwned();
        Dialog region = panelDialog();
        capture("02-media-region", region.getWindow().getDecorView());
        tap(() -> tagged(region, "atomic-workbench-content-item:" + item.key), "open_owned_image_preview");
        await(() -> main(() -> {
            Object preview = get(panel, "preview");
            return preview != null && get(preview, "imageView") != null
                    && ((ImageView) get(preview, "imageView")).getDrawable() != null;
        }), "REAL_IMAGE_DECODER_DID_NOT_RENDER_OWN_PNG", 15_000L);
        Object preview = main(() -> get(panel, "preview"));
        Dialog previewDialog = (Dialog) get(preview, "dialog");
        main(() -> {
            Drawable drawable = ((ImageView) get(preview, "imageView")).getDrawable();
            require(drawable instanceof BitmapDrawable, "OWN_PNG_PREVIEW_IS_NOT_A_DECODED_BITMAP");
            Bitmap original = ((BitmapDrawable) drawable).getBitmap();
            Bitmap readable = original.getConfig() == Bitmap.Config.HARDWARE
                    ? original.copy(Bitmap.Config.ARGB_8888, false) : original;
            require(readable != null && readable.getWidth() == 160 && readable.getHeight() == 96,
                    "OWN_PNG_DECODED_DIMENSIONS_DIFFER");
            require(readable.getPixel(10, 10) == Color.rgb(24, 96, 168)
                    && readable.getPixel(120, 70) == Color.rgb(232, 144, 32), "OWN_PNG_DECODED_PIXELS_DIFFER");
            if (readable != original) readable.recycle(); return null;
        });
        capture("03-decoded-own-image-preview", previewDialog.getWindow().getDecorView());
        tap(() -> text(previewDialog, "关闭"), "close_image_preview");
        stageFromPanel(media, item);
    }

    private void filesUi() throws Exception {
        Owned file = owned.get("file:primary");
        requireAvailable(file);
        closePanel(); openRegion(AtomicWorkbenchContentItem.Kind.FILES);
        AtomicWorkbenchContentItem item = awaitOwned(file);
        capture("04-files-region", panelDialog().getWindow().getDecorView());
        stageFromPanel(file, item);
    }

    private void stageFromPanel(Owned value, AtomicWorkbenchContentItem item) throws Exception {
        Dialog region = panelDialog();
        tap(() -> {
            View label = tagged(region, "atomic-workbench-content-item:" + item.key);
            return label == null ? null : child((ViewGroup) label.getParent(), CheckBox.class, null);
        }, "select_owned_content");
        tap(() -> textStarting(panelDialog(), "添加 1 项到流转"), "stage_owned_content_through_real_transfer");
        await(() -> main(() -> stagedAs(value) || pendingImportDialog() != null
                && text(pendingImportDialog(), "替换全部素材") != null), "REAL_IMPORT_DECISION_OR_RESULT_NOT_READY", 15_000L);
        if (!main(() -> stagedAs(value)))
            tap(() -> text(pendingImportDialog(), "替换全部素材"), "explicit_replace_of_isolated_test_pending_queue");
        await(() -> main(() -> !(Boolean) get(transfer, "loading")
                && stagedAs(value)),
                "REAL_TRANSFER_DID_NOT_STAGE_SELECTED_CONTENT", 15_000L);
        AtomicWorkbenchTransferStore.Payload payload = main(() -> AtomicWorkbenchTransferStore.payload(pendingSnapshot()));
        AtomicWorkbenchTransferStore.Entry entry = AtomicWorkbenchTransferStore.resolve(target, payload.uris.get(0));
        require(Arrays.equals(value.bytes, Files.readAllBytes(entry.file.toPath())), "STAGED_CACHE_BYTES_DIFFER_FROM_OWN_ORIGINAL");
        try (InputStream input = target.getContentResolver().openInputStream(payload.uris.get(0))) {
            require(Arrays.equals(value.bytes, read(input, value.bytes.length + 1)), "STAGED_PROVIDER_BYTES_DIFFER_FROM_OWN_ORIGINAL");
        }
        require(ownSourceExists(value), "STAGING_REMOVED_OWN_SOURCE_FILE");
    }

    private void shareManagement() throws Exception {
        AtomicWorkbenchPendingPayload pending = main(this::pendingSnapshot);
        if (pending == null || !pending.deliverable()) throw new Untested("NO_OWN_STAGED_PAYLOAD_FOR_SHARE_MANAGEMENT");
        AtomicWorkbenchTransferStore.Payload payload = AtomicWorkbenchTransferStore.payload(pending);
        closePanel();
        main(() -> { transfer.showTools(); return null; });
        tap(() -> (View) get(transfer, "summary"), "open_transfer_menu");
        tap(() -> text(transferDialog(), "选择分享入口"), "open_public_share_catalog_without_sending");
        await(() -> main(() -> text(transferDialog(), "管理分享入口") != null), "SHARE_CATALOG_UI_NOT_READY", 15_000L);
        tap(() -> text(transferDialog(), "管理分享入口"), "open_share_management");
        Dialog management = main(() -> (Dialog) get(transfer, "targetManagementDialog"));
        require(management != null && management.isShowing(), "REAL_SHARE_MANAGEMENT_DIALOG_MISSING");
        AtomicWorkbenchShareTargetRepository.Result catalog = AtomicWorkbenchShareTargetRepository.load(target,
                AtomicWorkbenchShareTargetRepository.Descriptor.from(payload), android.os.Process.myUid() / 100000);
        if (!catalog.available || catalog.targets.isEmpty()) throw new Untested("NO_CURRENT_PUBLIC_SHARE_TARGETS_TO_MANAGE");
        AtomicWorkbenchSharePreferences preferences = (AtomicWorkbenchSharePreferences) get(transfer, "sharePreferences");
        tap(() -> text(management, "全不选"), "hide_all_current_share_entries");
        require(preferences.visibleOrdered(catalog.targets).isEmpty(), "PHYSICAL_SELECT_NONE_DID_NOT_PERSIST");
        tap(() -> text(management, "全选"), "show_all_current_share_entries");
        require(preferences.visibleOrdered(catalog.targets).size() == catalog.targets.size(), "PHYSICAL_SELECT_ALL_DID_NOT_PERSIST");
        tap(() -> text(management, "全部折叠"), "collapse_all_share_apps");
        for (AtomicWorkbenchShareTargetRepository.Target value : catalog.targets)
            require(!preferences.expanded(value), "PHYSICAL_COLLAPSE_ALL_DID_NOT_PERSIST");
        tap(() -> text(management, "全部展开"), "expand_all_share_apps");
        for (AtomicWorkbenchShareTargetRepository.Target value : catalog.targets)
            require(preferences.expanded(value), "PHYSICAL_EXPAND_ALL_DID_NOT_PERSIST");
        AtomicWorkbenchShareTargetRepository.Target first = preferences.managedOrdered(catalog.targets).get(0);
        String appTag = "share-app:" + preferences.appKey(first);
        tap(() -> child((ViewGroup) tagged(management, appTag), CheckBox.class, null), "hide_first_share_app");
        require(!preferences.appVisible(first), "PHYSICAL_APP_VISIBILITY_DID_NOT_PERSIST");
        tap(() -> child((ViewGroup) tagged(management, appTag), CheckBox.class, null), "restore_first_share_app_visibility");
        require(preferences.appVisible(first), "PHYSICAL_APP_VISIBILITY_RESTORE_FAILED");
        tap(() -> descendantText(tagged(management, appTag), "置顶应用"), "pin_first_share_app");
        require(preferences.appPinned(first), "PHYSICAL_APP_PIN_DID_NOT_PERSIST");
        tap(() -> descendantText(tagged(management, appTag), "取消应用置顶"), "unpin_first_share_app");
        require(!preferences.appPinned(first), "PHYSICAL_APP_UNPIN_DID_NOT_PERSIST");
        String targetTag = "share-activity:" + first.key();
        tap(() -> child((ViewGroup) tagged(management, targetTag), CheckBox.class, null), "hide_first_public_share_entry");
        require(!preferences.targetVisible(first), "PHYSICAL_ENTRY_VISIBILITY_DID_NOT_PERSIST");
        tap(() -> child((ViewGroup) tagged(management, targetTag), CheckBox.class, null), "restore_first_public_share_entry");
        require(preferences.targetVisible(first), "PHYSICAL_ENTRY_VISIBILITY_RESTORE_FAILED");
        tap(() -> descendantText(tagged(management, targetTag), "置顶入口"), "pin_first_public_share_entry");
        require(preferences.targetPinned(first), "PHYSICAL_ENTRY_PIN_DID_NOT_PERSIST");
        tap(() -> descendantText(tagged(management, targetTag), "取消入口置顶"), "unpin_first_public_share_entry");
        require(!preferences.targetPinned(first), "PHYSICAL_ENTRY_UNPIN_DID_NOT_PERSIST");
        capture("05-share-management-safe-actions", management.getWindow().getDecorView());
        tap(() -> text(management, "完成"), "close_share_management");
        Dialog catalogDialog = transferDialog();
        tap(() -> text(catalogDialog, "取消"), "close_share_catalog_without_receiver_activation");
    }

    private void clipboardUi() throws Exception {
        closePanel();
        for (String label : new String[]{"A", "B"}) if (!containsText(clipText(label)))
            throw new Untested("OWN_CLIPBOARD_PRECONDITION_FROM_LISTENER_NOT_AVAILABLE");
        openRegion(AtomicWorkbenchContentItem.Kind.CLIPBOARD);
        AtomicWorkbenchContentItem a = clipboardItem(clipText("A")), b = clipboardItem(clipText("B"));
        require(a != null && b != null, "OWN_CLIPBOARD_ITEMS_MISSING");
        capture("06-clipboard-own-history", panelDialog().getWindow().getDecorView());
        tap(() -> tagged(panelDialog(), "atomic-workbench-content-item:" + a.key), "copy_own_history_item_A");
        await(() -> main(() -> currentClipEquals(clipText("A"))), "PHYSICAL_HISTORY_TAP_DID_NOT_COPY_TO_SYSTEM_CLIPBOARD", 8_000L);
        tap(() -> {
            View label = tagged(panelDialog(), "atomic-workbench-content-item:" + b.key);
            return label == null ? null : child((ViewGroup) label.getParent(), Button.class, "从历史移除此项");
        }, "remove_one_own_clipboard_history_item");
        await(() -> !containsText(clipText("B")) && containsText(clipText("A")), "PHYSICAL_SINGLE_HISTORY_DELETE_FAILED", 8_000L);
        require(main(() -> currentClipEquals(clipText("A"))), "SINGLE_HISTORY_DELETE_CHANGED_SYSTEM_CLIPBOARD");
        tap(() -> text(panelDialog(), "清空历史"), "confirm_clear_own_history_and_current_clip");
        Dialog confirmation = main(() -> (Dialog) get(panel, "confirmation"));
        require(confirmation != null && confirmation.isShowing(), "CLEAR_HISTORY_CONFIRMATION_MISSING");
        tap(() -> text(confirmation, "清空历史"), "clear_own_history_and_system_clipboard");
        await(() -> repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).items.isEmpty()
                && main(() -> clipboard.getPrimaryClip() == null), "PHYSICAL_CLEAR_DID_NOT_CLEAR_HISTORY_AND_SYSTEM_CLIP", 10_000L);
        main(() -> { clipboard.setPrimaryClip(ClipData.newPlainText("Duo acceptance", clipText("afterClear"))); return null; });
        await(() -> containsText(clipText("afterClear")), "FOREGROUND_LISTENER_DID_NOT_RESUME_AFTER_CLEAR", 8_000L);
        capture("07-clipboard-new-content-after-clear", panelDialog().getWindow().getDecorView());
        closePanel();
    }

    /** A real display-0 drag is cancelled before any DROP; no receiving app is opened. */
    private void directContentDrags() throws Exception {
        openRegion(AtomicWorkbenchContentItem.Kind.CLIPBOARD);
        Dialog foreground = panelDialog();
        await(() -> main(() -> foreground != null && foreground.isShowing()
                && foreground.getWindow().getDecorView().hasWindowFocus()), "CLIPBOARD_DIALOG_NOT_FOCUSED_FOR_DIRECT_DRAG_SOURCE", 8_000L);
        main(() -> { clipboard.setPrimaryClip(ClipData.newPlainText("Duo acceptance", clipText("direct drag"))); return null; });
        await(() -> containsText(clipText("direct drag")), "DIRECT_DRAG_OWN_CLIP_NOT_CAPTURED", 10_000L);
        closePanel();
        for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
            Owned original = kind == AtomicWorkbenchContentItem.Kind.MEDIA ? owned.get("media:primary")
                    : kind == AtomicWorkbenchContentItem.Kind.FILES ? owned.get("file:primary") : null;
            if (kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD) requireAvailable(original);
            openRegion(kind);
            AtomicWorkbenchContentItem item = original == null ? clipboardItem(clipText("direct drag")) : awaitOwned(original);
            require(item != null, "DIRECT_DRAG_OWN_ITEM_MISSING");
            Dialog owner = panelDialog();
            Rect bounds = physicalBounds(() -> tagged(owner, "atomic-workbench-content-item:" + item.key), "direct_drag_" + kind.name());
            int flags = main(() -> owner.getWindow().getAttributes().flags);
            float alpha = main(() -> owner.getWindow().getAttributes().alpha);
            AtomicWorkbenchPendingPayload queued = AtomicWorkbenchPendingStorage.repository(target).load();
            File manifest = new File(target.getFilesDir(), "workbench-pending-v2.bin");
            byte[] before = manifest.isFile() ? Files.readAllBytes(manifest.toPath()) : null;
            long down = SystemClock.uptimeMillis(); boolean held = false;
            float x = bounds.exactCenterX(), y = bounds.exactCenterY();
            JSONObject evidence = new JSONObject().put("action", "physical_hold_move_cancel_" + kind.name())
                    .put("display", 0).put("bounds", bounds.flattenToString()).put("dropInjected", false);
            clicks.put(evidence);
            try {
                require(inject(down, MotionEvent.ACTION_DOWN, x, y), "DIRECT_DRAG_PHYSICAL_DOWN_REJECTED"); held = true;
                await(() -> main(() -> get(transfer, "activeDrag") != null && get(panel, "sourceDrag") != null
                        && (Boolean) get(get(panel, "sourceDrag"), "started")
                        && owner.isShowing() && owner.getWindow().getAttributes().alpha == 0f),
                        "DIRECT_DRAG_PLATFORM_START_OR_SOURCE_VEIL_NOT_CONFIRMED", 15_000L);
                AtomicWorkbenchPendingPayload frozen = main(() -> (AtomicWorkbenchPendingPayload) get(get(transfer, "activeDrag"), "frozen"));
                require(!frozen.id.equals(queued.id) && frozen.deliverable(), "DIRECT_DRAG_REUSED_PENDING_ID_OR_INVALID_PAYLOAD");
                if (original == null) require(frozen.files.isEmpty() && item.text().equals(frozen.text), "DIRECT_DRAG_TEXT_BYTES_DIFFER");
                else {
                    require(frozen.files.size() == 1 && frozen.text.isEmpty(), "DIRECT_DRAG_FILE_PAYLOAD_NOT_SINGLE_ITEM");
                    Uri cached = Uri.parse(frozen.files.get(0).uri);
                    require(AtomicWorkbenchTransferStore.authority(target).equals(cached.getAuthority()), "DIRECT_DRAG_EXPOSED_ORIGINAL_URI");
                    try (InputStream input = target.getContentResolver().openInputStream(cached)) {
                        require(Arrays.equals(original.bytes, read(input, original.bytes.length + 1)), "DIRECT_DRAG_PROVIDER_BYTES_DIFFER");
                    }
                }
                float density = target.getResources().getDisplayMetrics().density;
                for (int index = 1; index <= 4; index++) {
                    SystemClock.sleep(25L);
                    require(inject(down, MotionEvent.ACTION_MOVE, x + 16f * density * index / 4f, y), "DIRECT_DRAG_PHYSICAL_MOVE_REJECTED");
                }
                require(inject(down, MotionEvent.ACTION_CANCEL, x + 16f * density, y), "DIRECT_DRAG_PHYSICAL_CANCEL_REJECTED"); held = false;
                await(() -> main(() -> get(transfer, "activeDrag") == null && get(panel, "sourceDrag") == null
                        && get(panel, "dialog") == owner && owner.isShowing()
                        && owner.getWindow().getDecorView().hasWindowFocus()
                        && owner.getWindow().getAttributes().flags == flags && owner.getWindow().getAttributes().alpha == alpha
                        && !(Boolean) get(activity, "hostDragActive")), "DIRECT_DRAG_SOURCE_DIALOG_OR_HOST_NOT_RESTORED", 10_000L);
                AtomicWorkbenchTransfer.IO.submit(() -> { }).get(10, TimeUnit.SECONDS);
                AtomicWorkbenchPendingPayload after = AtomicWorkbenchPendingStorage.repository(target).load();
                require(queued.signature().equals(after.signature()) && Arrays.equals(before,
                        manifest.isFile() ? Files.readAllBytes(manifest.toPath()) : null), "DIRECT_DRAG_CHANGED_PENDING_QUEUE");
                if (original != null) require(ownSourceExists(original), "DIRECT_DRAG_REMOVED_OWN_SOURCE");
                evidence.put("platformStartConfirmed", true).put("independentPayloadBytesVerified", true)
                        .put("pendingManifestUnchanged", true).put("sourceDialogRestored", true).put("completed", true);
            } finally {
                if (held) inject(down, MotionEvent.ACTION_CANCEL, x, y);
            }
            closePanel();
        }
    }

    private Owned insert(boolean image, String label, byte[] bytes) throws Exception {
        String key = (image ? "media:" : "file:") + label;
        String name = prefix + "_" + label + (image ? ".png" : ".txt");
        long futureSeconds = Math.max(cutoff, System.currentTimeMillis()) / 1000L + 2L;
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        values.put(MediaStore.MediaColumns.MIME_TYPE, image ? "image/png" : "text/plain");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH,
                (image ? Environment.DIRECTORY_PICTURES : Environment.DIRECTORY_DOWNLOADS) + "/DuoContentAcceptance/" + token);
        values.put(MediaStore.MediaColumns.DATE_MODIFIED, futureSeconds);
        values.put(MediaStore.MediaColumns.IS_PENDING, 1);
        Uri uri = target.getContentResolver().insert(image ? MediaStore.Images.Media.EXTERNAL_CONTENT_URI
                : MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
        require(uri != null, "OWN_MEDIASTORE_INSERT_RETURNED_NO_URI"); inserted.add(uri);
        checkpoint.getJSONArray("rows").put(uri.toString()); saveCheckpoint();
        try (OutputStream output = target.getContentResolver().openOutputStream(uri, "w")) {
            require(output != null, "OWN_MEDIASTORE_OUTPUT_UNAVAILABLE"); output.write(bytes);
        }
        ContentValues ready = new ContentValues(); ready.put(MediaStore.MediaColumns.IS_PENDING, 0);
        ready.put(MediaStore.MediaColumns.DATE_MODIFIED, futureSeconds);
        target.getContentResolver().update(uri, ready, null, null);
        ContentValues date = new ContentValues(); date.put(MediaStore.MediaColumns.DATE_MODIFIED, futureSeconds);
        target.getContentResolver().update(uri, date, null, null);
        long modified = -1;
        try (Cursor cursor = target.getContentResolver().query(uri,
                new String[]{MediaStore.MediaColumns.DATE_MODIFIED}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) modified = cursor.getLong(0) * 1000L;
        }
        Owned result = new Owned(image, name, uri, bytes, modified); owned.put(key, result); return result;
    }

    private boolean ownSourceExists(Owned value) throws Exception {
        try (InputStream input = target.getContentResolver().openInputStream(value.uri)) {
            return Arrays.equals(value.bytes, read(input, value.bytes.length + 1));
        }
    }
    private void deleteOwned(Uri uri) throws Exception {
        require(inserted.contains(uri), "REFUSE_DELETE_OF_NON_OWN_MEDIASTORE_URI");
        target.getContentResolver().delete(uri, null, null);
        try (Cursor cursor = target.getContentResolver().query(uri, new String[]{MediaStore.MediaColumns._ID}, null, null, null)) {
            require(cursor == null || !cursor.moveToFirst(), "OWN_MEDIASTORE_ROW_STILL_EXISTS_AFTER_DELETE");
        }
        inserted.remove(uri);
    }
    private AtomicWorkbenchContentItem find(Owned value) {
        if (value == null) return null;
        for (AtomicWorkbenchContentItem item : repository.snapshot(value.image ? AtomicWorkbenchContentItem.Kind.MEDIA
                : AtomicWorkbenchContentItem.Kind.FILES).items) if (ownedMatches(value, item)) return item;
        return null;
    }
    private static boolean ownedMatches(Owned value, AtomicWorkbenchContentItem item) {
        try { return value.name.equals(item.name) && "media".equals(Uri.parse(item.uri).getAuthority())
                && ContentUris.parseId(value.uri) == ContentUris.parseId(Uri.parse(item.uri)); }
        catch (RuntimeException invalid) { return false; }
    }
    private void requireAvailable(Owned value) throws Exception {
        if (value == null || value.modified <= cutoff || find(value) == null)
            throw new Untested("OWN_RECENT_SOURCE_ITEM_NOT_AVAILABLE_WITH_CURRENT_PHONE_ACCESS");
    }
    private AtomicWorkbenchContentItem awaitOwned(Owned value) throws Exception {
        await(() -> find(value) != null && !repository.snapshot(value.image ? AtomicWorkbenchContentItem.Kind.MEDIA
                : AtomicWorkbenchContentItem.Kind.FILES).loading, "OWN_ITEM_NOT_VISIBLE_IN_REAL_REPOSITORY", 40_000L);
        assertOnlyOwned(); return find(value);
    }
    private void assertOnlyOwned() throws Exception {
        if (repository == null) return;
        for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values())
            for (AtomicWorkbenchContentItem item : repository.snapshot(kind).items) {
                boolean safe = kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD ? item.text().startsWith(prefix + " ") : false;
                if (kind != AtomicWorkbenchContentItem.Kind.CLIPBOARD)
                    for (Owned value : owned.values()) if (ownedMatches(value, item)) { safe = true; break; }
                if (!safe) throw new Untested("NON_OWN_VISIBLE_CONTENT_SCREENSHOT_AND_UI_ACTIONS_PROHIBITED");
            }
    }
    private void openRegion(AtomicWorkbenchContentItem.Kind kind) throws Exception {
        closePanel();
        main(() -> { transfer.showTools(); return null; });
        tap(() -> transfer.view().findViewWithTag("atomic-workbench-content-open:" + kind.name()),
                "open_region_" + kind.name());
        await(() -> main(() -> get(panel, "dialog") instanceof Dialog
                && ((Dialog) get(panel, "dialog")).isShowing() && get(panel, "kind") == kind), "REGION_DIALOG_NOT_VISIBLE", 8_000L);
    }
    private void closePanel() throws Exception {
        if (panel == null) return;
        Dialog dialog = main(() -> (Dialog) get(panel, "dialog"));
        if (dialog != null && dialog.isShowing()) tap(() -> text(dialog, "关闭"), "close_content_region");
    }
    private Dialog panelDialog() throws Exception { return main(() -> (Dialog) get(panel, "dialog")); }
    private AtomicWorkbenchPendingPayload pendingSnapshot() throws Exception { return (AtomicWorkbenchPendingPayload) get(transfer, "current"); }
    private boolean stagedAs(Owned value) throws Exception {
        AtomicWorkbenchPendingPayload pending = pendingSnapshot();
        return pending != null && pending.deliverable() && pending.files.size() == 1 && value.name.equals(pending.files.get(0).name);
    }
    private Dialog pendingImportDialog() throws Exception {
        Object importing = get(transfer, "pendingImport"); return importing == null ? null : (Dialog) get(importing, "dialog");
    }
    private Dialog transferDialog() throws Exception { return main(() -> {
        Dialog direct = (Dialog) get(transfer, "dialog"); if (direct != null) return direct;
        Object controls = get(transfer, "controls"); return controls == null ? null : (Dialog) get(controls, "dialog");
    }); }
    private String clipText(String label) { return prefix + " " + label; }
    private boolean containsText(String text) { return hasText(repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD), text); }
    private static boolean hasText(AtomicWorkbenchContentSnapshot snapshot, String text) {
        for (AtomicWorkbenchContentItem item : snapshot.items) if (text.equals(item.text())) return true; return false;
    }
    private AtomicWorkbenchContentItem clipboardItem(String text) {
        for (AtomicWorkbenchContentItem item : repository.snapshot(AtomicWorkbenchContentItem.Kind.CLIPBOARD).items)
            if (text.equals(item.text())) return item; return null;
    }
    private boolean currentClipEquals(String value) {
        ClipData clip = clipboard.getPrimaryClip();
        return clip != null && clip.getItemCount() == 1 && value.contentEquals(clip.getItemAt(0).getText());
    }

    /** Resolve actual visible bounds every time; never execute a View click callback directly. */
    private Rect physicalBounds(ViewSource source, String action) throws Exception {
        assertOnlyOwned();
        Rect rect = null;
        long deadline = SystemClock.uptimeMillis() + 12_000L;
        int scrolls = 0;
        while (rect == null && SystemClock.uptimeMillis() < deadline) {
            Rect[] location = main(() -> {
                View view = source.get();
                if (view == null || !view.isAttachedToWindow() || !view.isShown() || !view.isEnabled()
                        || view.getWindowVisibility() != View.VISIBLE) return null;
                for (View entry = view; entry != null; entry = entry.getParent() instanceof View ? (View) entry.getParent() : null)
                    require(!(entry.getTag() instanceof String)
                            || !((String) entry.getTag()).startsWith("atomic-workbench-share-target:"),
                            "SHARE_RECEIVER_ACTIVATION_IS_PROHIBITED_IN_ACCEPTANCE");
                Rect visible = new Rect();
                int minimum = Math.min(view.getHeight(), Math.max(8, Math.round(24 * target.getResources().getDisplayMetrics().density)));
                if (view.getGlobalVisibleRect(visible) && visible.width() >= 8 && visible.height() >= minimum)
                    return new Rect[]{visible};
                ScrollView parent = null;
                for (android.view.ViewParent ancestor = view.getParent(); ancestor != null; ancestor = ancestor.getParent())
                    if (ancestor instanceof ScrollView) { parent = (ScrollView) ancestor; break; }
                Rect scroll = new Rect();
                if (parent == null || !parent.getGlobalVisibleRect(scroll)) return null;
                int[] origin = new int[2]; view.getLocationOnScreen(origin);
                return new Rect[]{null, scroll, new Rect(0, origin[1] + view.getHeight() / 2, 0, 0)};
            });
            if (location != null && location[0] != null) {
                if (physicalTargetMatches(source, location[0])) { rect = location[0]; break; }
                SystemClock.sleep(100L); continue;
            }
            if (location != null && location.length == 3 && scrolls++ < 8) {
                Rect scroll = location[1];
                float x = scroll.exactCenterX();
                boolean downward = location[2].top >= scroll.exactCenterY();
                float start = scroll.top + scroll.height() * (downward ? .74f : .26f);
                float finish = scroll.top + scroll.height() * (downward ? .26f : .74f);
                long downAt = SystemClock.uptimeMillis();
                require(inject(downAt, MotionEvent.ACTION_DOWN, x, start), "PHYSICAL_SCROLL_DOWN_REJECTED");
                for (int index = 1; index <= 8; index++) {
                    SystemClock.sleep(20L);
                    require(inject(downAt, MotionEvent.ACTION_MOVE, x, start + (finish - start) * index / 8f),
                            "PHYSICAL_SCROLL_MOVE_REJECTED");
                }
                require(inject(downAt, MotionEvent.ACTION_UP, x, finish), "PHYSICAL_SCROLL_UP_REJECTED");
                clicks.put(new JSONObject().put("action", "physical_scroll_to_" + action).put("display", 0));
                main(() -> null); SystemClock.sleep(100L);
            } else SystemClock.sleep(100L);
        }
        require(rect != null, "PHYSICAL_ACTION_TARGET_NOT_VISIBLE");
        return rect;
    }

    /** Input focus may belong to a hosted VD. Verify the actual top window at the display-0 touch point instead. */
    private boolean physicalTargetMatches(ViewSource source, Rect visible) throws Exception {
        PhysicalTarget expected = main(() -> {
            View view = source.get(); Rect current = new Rect();
            if (view == null || !view.isAttachedToWindow() || !view.isShown() || !view.isEnabled()
                    || !view.getGlobalVisibleRect(current) || !visible.equals(current)) return null;
            android.view.accessibility.AccessibilityNodeInfo local = view.createAccessibilityNodeInfo();
            if (local == null) return null;
            try {
                int[] origin = new int[2]; view.getLocationOnScreen(origin);
                return new PhysicalTarget(local.getWindowId(), local.getPackageName(), local.getClassName(),
                        local.getText(), local.getContentDescription(), new Rect(origin[0], origin[1],
                        origin[0] + view.getWidth(), origin[1] + view.getHeight()));
            } finally { local.recycle(); }
        });
        if (expected == null || expected.window < 0 || !target.getPackageName().equals(expected.pkg)) return false;
        UiAutomation automation = test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES);
        android.accessibilityservice.AccessibilityServiceInfo info = automation.getServiceInfo();
        if (info == null) return false;
        int retrieve = android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
        int added = retrieve & ~info.flags;
        android.util.SparseArray<List<android.view.accessibility.AccessibilityWindowInfo>> displays = null;
        try {
            if (added != 0) { info.flags |= added; automation.setServiceInfo(info); }
            displays = automation.getWindowsOnAllDisplays();
            List<android.view.accessibility.AccessibilityWindowInfo> windows = displays == null ? null : displays.get(0);
            if (windows == null) return false;
            android.view.accessibility.AccessibilityWindowInfo top = null;
            for (android.view.accessibility.AccessibilityWindowInfo window : windows) {
                Rect bounds = new Rect(); window.getBoundsInScreen(bounds);
                if (window.getDisplayId() == 0 && bounds.contains(visible.centerX(), visible.centerY())
                        && (top == null || window.getLayer() > top.getLayer())) top = window;
            }
            // A foreign overlay, IME or different same-package dialog must not be clicked through.
            if (top == null || top.getType() != android.view.accessibility.AccessibilityWindowInfo.TYPE_APPLICATION
                    || top.getId() != expected.window) return false;
            android.view.accessibility.AccessibilityNodeInfo root = top.getRoot();
            if (root == null) return false;
            java.util.ArrayDeque<android.view.accessibility.AccessibilityNodeInfo> nodes = new java.util.ArrayDeque<>();
            nodes.add(root); int checked = 0;
            try {
                while (!nodes.isEmpty() && checked++ < 5000) {
                    android.view.accessibility.AccessibilityNodeInfo node = nodes.removeFirst();
                    try {
                        if (!target.getPackageName().contentEquals(node.getPackageName() == null ? "" : node.getPackageName())) continue;
                        Rect bounds = new Rect(); node.getBoundsInScreen(bounds);
                        if (node.isVisibleToUser() && node.getWindowId() == expected.window
                                && expected.type.equals(plain(node.getClassName())) && expected.text.equals(plain(node.getText()))
                                && expected.description.equals(plain(node.getContentDescription()))
                                && (bounds.equals(expected.bounds) || bounds.equals(visible))) return true;
                        for (int index = 0; index < node.getChildCount(); index++) {
                            android.view.accessibility.AccessibilityNodeInfo child = node.getChild(index);
                            if (child != null) nodes.add(child);
                        }
                    } finally { node.recycle(); }
                }
                return false;
            } finally { while (!nodes.isEmpty()) nodes.removeFirst().recycle(); }
        } finally {
            if (displays != null) for (int index = 0; index < displays.size(); index++)
                for (android.view.accessibility.AccessibilityWindowInfo window : displays.valueAt(index)) window.recycle();
            if (added != 0) {
                android.accessibilityservice.AccessibilityServiceInfo current = automation.getServiceInfo();
                if (current != null) { current.flags &= ~added; automation.setServiceInfo(current); }
            }
        }
    }
    private static String plain(CharSequence value) { return value == null ? "" : value.toString(); }
    private static final class PhysicalTarget {
        final int window; final String pkg, type, text, description; final Rect bounds;
        PhysicalTarget(int window, CharSequence pkg, CharSequence type, CharSequence text, CharSequence description, Rect bounds) {
            this.window = window; this.pkg = plain(pkg); this.type = plain(type); this.text = plain(text);
            this.description = plain(description); this.bounds = bounds;
        }
    }
    private void tap(ViewSource source, String action) throws Exception {
        Rect rect = physicalBounds(source, action);
        JSONObject evidence = new JSONObject().put("action", action).put("display", 0).put("bounds", rect.flattenToString());
        clicks.put(evidence);
        long down = SystemClock.uptimeMillis();
        require(inject(down, MotionEvent.ACTION_DOWN, rect.exactCenterX(), rect.exactCenterY()), "PHYSICAL_DOWN_INJECTION_REJECTED");
        SystemClock.sleep(60L);
        require(inject(down, MotionEvent.ACTION_UP, rect.exactCenterX(), rect.exactCenterY()), "PHYSICAL_UP_INJECTION_REJECTED");
        main(() -> null); SystemClock.sleep(100L);
        evidence.put("completed", true);
    }
    private boolean inject(long down, int action, float x, float y) throws Exception {
        MotionEvent.PointerProperties pointer = new MotionEvent.PointerProperties();
        pointer.id = 0; pointer.toolType = MotionEvent.TOOL_TYPE_FINGER;
        MotionEvent.PointerCoords position = new MotionEvent.PointerCoords();
        position.x = x; position.y = y; position.pressure = 1f; position.size = 1f;
        // This SDK-34 public overload explicitly supplies displayId=0.
        MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, 1,
                new MotionEvent.PointerProperties[]{pointer}, new MotionEvent.PointerCoords[]{position},
                0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0, 0, 0);
        require(event != null, "PHYSICAL_EVENT_CREATION_FAILED");
        try {
            return test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).injectInputEvent(event, true);
        } finally { event.recycle(); }
    }
    private void capture(String name, View region) throws Exception {
        assertOnlyOwned();
        Rect rect = main(() -> {
            // Shared glass dialogs use a transparent full-screen native window.
            // Crop the actual opaque glass panel, never that window's HOME backdrop.
            View safeRegion = region == null ? null : region.findViewWithTag("liquid-glass-dialog");
            if (safeRegion == null) safeRegion = region;
            Rect result = new Rect(); require(safeRegion != null && safeRegion.getGlobalVisibleRect(result), "SCREENSHOT_REGION_NOT_VISIBLE");
            return result;
        });
        Bitmap full = test.getUiAutomation(UiAutomation.FLAG_DONT_SUPPRESS_ACCESSIBILITY_SERVICES).takeScreenshot();
        require(full != null, "SCREENSHOT_UNAVAILABLE");
        Bitmap crop = null;
        try {
            require(rect.intersect(0, 0, full.getWidth(), full.getHeight()), "SCREENSHOT_BOUNDS_OUTSIDE_DISPLAY");
            crop = Bitmap.createBitmap(full, rect.left, rect.top, rect.width(), rect.height());
            File file = new File(evidenceDirectory, name + ".png");
            try (FileOutputStream output = new FileOutputStream(file)) {
                require(crop.compress(Bitmap.CompressFormat.PNG, 100, output), "SCREENSHOT_ENCODING_FAILED");
            }
            screens.put(new JSONObject().put("path", file.getAbsolutePath()).put("bounds", rect.flattenToString())
                    .put("fontScale", target.getResources().getConfiguration().fontScale).put("ownedVisibleContentVerified", true));
            layouts.put(new JSONObject().put("name", name).put("bounds", rect.flattenToString()));
        } finally { if (crop != null && crop != full) crop.recycle(); full.recycle(); }
    }
    private static View tagged(Dialog dialog, String tag) { return dialog == null ? null : dialog.getWindow().getDecorView().findViewWithTag(tag); }
    private static View text(Dialog dialog, String text) { return dialog == null ? null : descendantText(dialog.getWindow().getDecorView(), text); }
    private static View textStarting(Dialog dialog, String prefix) {
        return dialog == null ? null : search(dialog.getWindow().getDecorView(), view -> view instanceof TextView
                && ((TextView) view).getText().toString().startsWith(prefix) && view.isClickable());
    }
    private static View descendantText(View root, String text) {
        return search(root, view -> view instanceof TextView && text.contentEquals(((TextView) view).getText()) && view.isClickable());
    }
    private static View child(ViewGroup root, Class<?> type, String description) {
        return search(root, view -> type.isInstance(view) && (description == null
                || java.util.Objects.equals(description, view.getContentDescription() == null ? null : view.getContentDescription().toString())));
    }
    private interface Match { boolean matches(View view); }
    private static View search(View root, Match match) {
        if (root == null) return null;
        if (match.matches(root)) return root;
        if (root instanceof ViewGroup) for (int index = 0; index < ((ViewGroup) root).getChildCount(); index++) {
            View found = search(((ViewGroup) root).getChildAt(index), match); if (found != null) return found;
        }
        return null;
    }
    private JSONObject rectangle(View view) throws Exception {
        int[] location = new int[2]; view.getLocationOnScreen(location);
        return new JSONObject().put("left", location[0]).put("top", location[1])
                .put("width", view.getWidth()).put("height", view.getHeight());
    }

    private Activity openSettings() throws Exception {
        Activity retained = main(() -> {
            for (int index = settings.size() - 1; index >= 0; index--) {
                Activity candidate = settings.get(index);
                if (!candidate.isFinishing() && !candidate.isDestroyed()) return candidate;
            }
            return null;
        });
        Intent intent = new Intent(target, AtomicWorkbenchSettingsActivity.class)
                .putExtra(ModuleNavigation.EXTRA_ROUTE, "atomic_workbench").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (retained != null) {
            // Bringing an existing task forward can deliver onNewIntent without creating
            // an Activity. startActivitySync would then wait for a new Activity forever.
            intent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            main(() -> { target.startActivity(intent); return null; });
            await(() -> main(() -> !retained.isFinishing() && !retained.isDestroyed() && retained.hasWindowFocus()),
                    "REUSED_SETTINGS_NOT_FOREGROUND", 10_000L);
            return retained;
        }
        Activity safe = test.startActivitySync(intent);
        settings.add(safe); main(() -> null); SystemClock.sleep(100L); return safe;
    }
    private boolean noExistingWorkbenchTask() {
        ActivityManager manager = target.getSystemService(ActivityManager.class);
        if (manager == null) return false;
        for (ActivityManager.AppTask task : manager.getAppTasks()) {
            ActivityManager.RecentTaskInfo info = task.getTaskInfo();
            if (info.topActivity != null && AtomicWorkbenchActivity.class.getName().equals(info.topActivity.getClassName())
                    || info.baseActivity != null && AtomicWorkbenchActivity.class.getName().equals(info.baseActivity.getClassName())) return false;
        }
        return true;
    }
    private AtomicWorkbenchClient client() throws Exception { return main(() -> (AtomicWorkbenchClient) get(activity, "client")); }
    private File contentDirectory() { return new File(target.getFilesDir(), "workbench-content"); }
    private SharedPreferences transferPreferences() { return target.getSharedPreferences("atomic-workbench-transfer", Context.MODE_PRIVATE); }
    private void isolate(File source, String label) throws Exception {
        Backup backup = new Backup(source, new File(backupDirectory, label));
        backups.add(backup); backup.isolate();
    }
    private static String bootId() throws Exception {
        return new String(Files.readAllBytes(new File("/proc/sys/kernel/random/boot_id").toPath()), StandardCharsets.US_ASCII).trim();
    }
    private static void writePrivate(File file, byte[] bytes) throws Exception {
        File temporary = new File(file.getParentFile(), file.getName() + ".new");
        try (FileOutputStream output = new FileOutputStream(temporary)) { output.write(bytes); output.getFD().sync(); }
        Files.move(temporary.toPath(), file.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        require(Arrays.equals(bytes, Files.readAllBytes(file.toPath())), "PRIVATE_CHECKPOINT_READBACK_FAILED");
    }
    private void saveCheckpoint() throws Exception {
        writePrivate(new File(backupDirectory, "checkpoint.json"), checkpoint.toString().getBytes(StandardCharsets.UTF_8));
    }
    private static byte[] encodeDurableClip(ClipData clip) throws Exception {
        if (clip == null) return new byte[0];
        // URI grants, Intents, spans and Binder/FD references cannot be restored by marshalling alone.
        if (clip.getDescription().getLabel() != null && !(clip.getDescription().getLabel() instanceof String))
            throw new Untested("ORIGINAL_CLIP_LABEL_REQUIRES_NON_PERSISTENT_STATE");
        for (int i = 0; i < clip.getItemCount(); i++) {
            ClipData.Item item = clip.getItemAt(i);
            if (item.getUri() != null || item.getIntent() != null || item.getText() != null && !(item.getText() instanceof String))
                throw new Untested("ORIGINAL_CLIP_URI_INTENT_OR_SPANS_CANNOT_BE_DURABLY_RESTORED");
        }
        Parcel parcel = Parcel.obtain();
        try {
            clip.writeToParcel(parcel, 0);
            if (parcel.hasFileDescriptors()) throw new Untested("ORIGINAL_CLIP_CONTAINS_FILE_DESCRIPTOR");
            final boolean binders;
            try {
                Method check = Parcel.class.getDeclaredMethod("hasBinders"); check.setAccessible(true);
                binders = (Boolean) check.invoke(parcel);
            } catch (ReflectiveOperationException | RuntimeException unavailable) {
                throw new Untested("ORIGINAL_CLIP_BINDER_ABSENCE_CANNOT_BE_PROVEN");
            }
            if (binders) throw new Untested("ORIGINAL_CLIP_CONTAINS_BINDER");
            byte[] bytes = parcel.marshall();
            ClipData roundTrip = decodeDurableClip(bytes, true);
            require(sameClip(clip, roundTrip), "ORIGINAL_CLIP_PARCEL_ROUND_TRIP_MISMATCH");
            Parcel second = Parcel.obtain();
            try {
                roundTrip.writeToParcel(second, 0);
                require(Arrays.equals(bytes, second.marshall()), "ORIGINAL_CLIP_FULL_PARCEL_ROUND_TRIP_MISMATCH");
            } finally { second.recycle(); }
            return bytes;
        } finally { parcel.recycle(); }
    }
    private static ClipData decodeDurableClip(byte[] bytes, boolean present) throws Exception {
        if (!present) { require(bytes.length == 0, "EMPTY_CLIP_CHECKPOINT_NOT_EMPTY"); return null; }
        Parcel parcel = Parcel.obtain();
        try {
            parcel.unmarshall(bytes, 0, bytes.length); parcel.setDataPosition(0);
            ClipData value = ClipData.CREATOR.createFromParcel(parcel);
            require(parcel.dataAvail() == 0 && !parcel.hasFileDescriptors(), "CLIP_CHECKPOINT_TRAILING_OR_DESCRIPTOR_DATA");
            return value;
        } finally { parcel.recycle(); }
    }
    private static JSONArray encodePreferences(Map<String, Object> values) throws Exception {
        JSONArray result = new JSONArray();
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            Object value = entry.getValue(); String type;
            if (value instanceof String) type = "string";
            else if (value instanceof Boolean) type = "boolean";
            else if (value instanceof Integer) type = "integer";
            else if (value instanceof Long) type = "long";
            else if (value instanceof Float) type = "float_bits";
            else if (value instanceof Set) type = "string_set";
            else throw new AssertionError("UNSUPPORTED_ORIGINAL_PREFERENCE_TYPE");
            Object encoded = value instanceof Set ? new JSONArray((Set<?>) value)
                    : value instanceof Float ? Float.floatToRawIntBits((Float) value) : value;
            result.put(new JSONObject().put("key", entry.getKey()).put("type", type).put("value", encoded));
        }
        return result;
    }
    private static Map<String, Object> decodePreferences(JSONArray rows) throws Exception {
        Map<String, Object> values = new HashMap<>();
        for (int i = 0; i < rows.length(); i++) {
            JSONObject row = rows.getJSONObject(i); Object value;
            switch (row.getString("type")) {
                case "string": value = row.getString("value"); break;
                case "boolean": value = row.getBoolean("value"); break;
                case "integer": value = row.getInt("value"); break;
                case "long": value = row.getLong("value"); break;
                case "float_bits": value = Float.intBitsToFloat(row.getInt("value")); break;
                case "string_set": {
                    Set<String> set = new HashSet<>(); JSONArray array = row.getJSONArray("value");
                    for (int j = 0; j < array.length(); j++) set.add(array.getString(j)); value = set; break;
                }
                default: throw new AssertionError("UNKNOWN_CHECKPOINT_PREFERENCE_TYPE");
            }
            values.put(row.getString("key"), value);
        }
        return values;
    }
    /** Explicit developer recovery; refuses another boot, user, package or random session. */
    static JSONObject restorePrivate(Instrumentation test, Bundle arguments) throws Exception {
        String session = arguments.getString("recoverySession", "");
        require(session.matches("[a-f0-9]{32}"), "EXACT_PRIVATE_RECOVERY_SESSION_REQUIRED");
        AtomicWorkbenchContentDeviceCases self = new AtomicWorkbenchContentDeviceCases(test, session);
        require(self.backupDirectory.isDirectory() && !Files.isSymbolicLink(self.backupDirectory.toPath()), "PRIVATE_RECOVERY_DIRECTORY_INVALID");
        self.checkpoint = new JSONObject(new String(Files.readAllBytes(new File(self.backupDirectory, "checkpoint.json").toPath()), StandardCharsets.UTF_8));
        JSONObject point = self.checkpoint;
        require(session.equals(point.getString("session")) && bootId().equals(point.getString("boot"))
                && android.os.Process.myUid() == point.getInt("uid")
                && android.os.Process.myUserHandle().toString().equals(point.getString("user"))
                && self.target.getPackageName().equals(point.getString("package")), "PRIVATE_RECOVERY_IDENTITY_OR_BOOT_MISMATCH_REFUSE_OVERWRITE");
        require(!AtomicWorkbenchCleanup.pending() && self.noExistingWorkbenchTask(), "CLOSE_WORKBENCH_AND_CONFIRM_ROOT_RECOVERY_FIRST");
        // A fresh instrumentation process has no Collector; require a Collector-free foreground page.
        Activity safe = self.openSettings();
        self.await(() -> self.main(safe::hasWindowFocus), "RECOVERY_SETTINGS_NOT_FOREGROUND", 10_000L);
        JSONArray trees = point.getJSONArray("trees");
        for (int i = trees.length() - 1; i >= 0; i--) {
            JSONObject tree = trees.getJSONObject(i); String label = tree.getString("label");
            File source;
            switch (label) {
                case "content": source = new File(self.target.getFilesDir(), "workbench-content"); break;
                case "share": source = new File(self.target.getFilesDir(), "atomic-workbench-share"); break;
                case "transfer": source = new File(self.target.getCacheDir(), "workbench-transfer"); break;
                case "pending": source = new File(self.target.getFilesDir(), "workbench-pending-v2.bin"); break;
                case "pending-bak": source = new File(self.target.getFilesDir(), "workbench-pending-v2.bin.bak"); break;
                case "pending-new": source = new File(self.target.getFilesDir(), "workbench-pending-v2.bin.new"); break;
                default: throw new AssertionError("UNKNOWN_PRIVATE_RECOVERY_TREE");
            }
            File backup = new File(self.backupDirectory, label);
            Map<String, String> expected = new LinkedHashMap<>(); JSONObject hashes = tree.getJSONObject("fingerprint");
            for (java.util.Iterator<String> keys = hashes.keys(); keys.hasNext();) { String key = keys.next(); expected.put(key, hashes.getString(key)); }
            if (backup.exists()) {
                require(expected.equals(fingerprint(backup)), "PRIVATE_RECOVERY_BACKUP_SHA_MISMATCH");
                deleteIsolatedTree(source); Files.move(backup.toPath(), source.toPath(), StandardCopyOption.ATOMIC_MOVE);
            } else if (!tree.getBoolean("existed")) deleteIsolatedTree(source);
            require(expected.equals(fingerprint(source)), "PRIVATE_RECOVERY_ORIGINAL_TREE_NOT_CONFIRMED");
        }
        if (point.has("preferences")) {
            Map<String, Object> original = decodePreferences(point.getJSONArray("preferences")); self.restorePreferences(original);
            require(original.equals(copyPreferences(self.transferPreferences().getAll())), "PRIVATE_RECOVERY_PREFS_MISMATCH");
        }
        JSONArray rows = point.getJSONArray("rows");
        self.prefix = point.getString("prefix");
        for (int i = 0; i < rows.length(); i++) {
            Uri uri = Uri.parse(rows.getString(i)); require("media".equals(uri.getAuthority()), "PRIVATE_RECOVERY_NON_MEDIA_URI");
            try (Cursor row = self.target.getContentResolver().query(uri, new String[]{MediaStore.MediaColumns.DISPLAY_NAME, MediaStore.MediaColumns.RELATIVE_PATH}, null, null, null)) {
                if (row != null && row.moveToFirst()) require(row.getString(0).startsWith(self.prefix + "_")
                        && row.getString(1) != null && row.getString(1).endsWith("/DuoContentAcceptance/" + session + "/"), "PRIVATE_RECOVERY_ROW_NOT_OWNED");
            }
            self.inserted.add(uri); self.deleteOwned(uri);
        }
        ClipData clip = decodeDurableClip(Files.readAllBytes(new File(self.backupDirectory, "clipboard.parcel").toPath()), point.getBoolean("clipPresent"));
        // Re-run all non-persistent-reference checks before writing the persisted value.
        encodeDurableClip(clip);
        ClipboardManager manager = self.target.getSystemService(ClipboardManager.class);
        self.main(() -> { if (clip == null) manager.clearPrimaryClip(); else manager.setPrimaryClip(clip); return null; });
        require(self.main(() -> sameClip(clip, manager.getPrimaryClip())), "PRIVATE_RECOVERY_CLIP_MISMATCH");
        deleteIsolatedTree(self.backupDirectory);
        self.main(() -> { safe.finish(); return null; });
        return new JSONObject().put("success", true).put("sameBootUserSessionVerified", true)
                .put("originalPrivateTreesPreferencesClipboardRestored", true).put("privateBackupRemoved", true)
                .put("originalContentExported", false);
    }
    private void drainRepository(AtomicWorkbenchContentRepository value) throws Exception {
        ExecutorService worker = (ExecutorService) get(value, "ownedWorker");
        require(worker != null && worker.isShutdown(), "CONTENT_REPOSITORY_WORKER_NOT_CLOSED");
        require(worker.awaitTermination(40, TimeUnit.SECONDS), "CONTENT_REPOSITORY_WORKER_DID_NOT_DRAIN");
    }
    private static Map<String, Object> copyPreferences(Map<String, ?> source) {
        Map<String, Object> result = new HashMap<>();
        for (Map.Entry<String, ?> entry : source.entrySet())
            result.put(entry.getKey(), entry.getValue() instanceof Set ? new HashSet<>((Set<?>) entry.getValue()) : entry.getValue());
        return result;
    }
    @SuppressWarnings("unchecked") private void restorePreferences(Map<String, Object> values) throws Exception {
        SharedPreferences.Editor editor = transferPreferences().edit().clear();
        for (Map.Entry<String, Object> entry : values.entrySet()) {
            Object value = entry.getValue(); String key = entry.getKey();
            if (value instanceof String) editor.putString(key, (String) value);
            else if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
            else if (value instanceof Integer) editor.putInt(key, (Integer) value);
            else if (value instanceof Long) editor.putLong(key, (Long) value);
            else if (value instanceof Float) editor.putFloat(key, (Float) value);
            else if (value instanceof Set) editor.putStringSet(key, (Set<String>) value);
            else throw new AssertionError("UNKNOWN_ORIGINAL_PREFERENCE_VALUE_TYPE");
        }
        require(editor.commit(), "ORIGINAL_TRANSFER_PREFERENCES_RESTORE_FAILED");
    }
    private static boolean sameClip(ClipData expected, ClipData actual) {
        if (expected == null || actual == null) return expected == actual;
        if (expected.getItemCount() != actual.getItemCount()) return false;
        android.content.ClipDescription aDescription = expected.getDescription(), bDescription = actual.getDescription();
        if (!android.text.TextUtils.equals(aDescription.getLabel(), bDescription.getLabel())
                || aDescription.getMimeTypeCount() != bDescription.getMimeTypeCount()) return false;
        for (int index = 0; index < aDescription.getMimeTypeCount(); index++)
            if (!aDescription.getMimeType(index).equals(bDescription.getMimeType(index))) return false;
        if (!samePersistable(aDescription.getExtras(), bDescription.getExtras())) return false;
        for (int index = 0; index < expected.getItemCount(); index++) {
            ClipData.Item a = expected.getItemAt(index), b = actual.getItemAt(index);
            if (!java.util.Objects.equals(a.getText() == null ? null : a.getText().toString(), b.getText() == null ? null : b.getText().toString())
                    || !java.util.Objects.equals(a.getHtmlText(), b.getHtmlText()) || !java.util.Objects.equals(a.getUri(), b.getUri())) return false;
            if (a.getIntent() == null ? b.getIntent() != null : b.getIntent() == null
                    || !a.getIntent().toUri(0).equals(b.getIntent().toUri(0))) return false;
        }
        return true;
    }
    private static boolean samePersistable(android.os.PersistableBundle expected, android.os.PersistableBundle actual) {
        if (expected == null || actual == null) return expected == actual;
        if (!expected.keySet().equals(actual.keySet())) return false;
        for (String key : expected.keySet()) {
            Object a = expected.get(key), b = actual.get(key);
            if (a instanceof android.os.PersistableBundle || b instanceof android.os.PersistableBundle) {
                if (!(a instanceof android.os.PersistableBundle) || !(b instanceof android.os.PersistableBundle)
                        || !samePersistable((android.os.PersistableBundle) a, (android.os.PersistableBundle) b)) return false;
            } else if (!java.util.Objects.deepEquals(a, b)) return false;
        }
        return true;
    }
    private void runCase(String name, Work<Void> work) throws Exception {
        stage = name;
        progress("begin");
        JSONObject value = new JSONObject().put("name", name); cases.put(value);
        try { work.run(); value.put("status", "passed"); progress("passed"); }
        catch (Untested unavailable) { skipped++; value.put("status", "untested").put("reason", unavailable.code); untested.put(name + ":" + unavailable.code); progress("untested"); }
        catch (Exception | AssertionError failure) { failed++; value.put("status", "failed").put("failure", safeFailure(failure)); progress("failed"); }
        finally {
            progress("case_cleanup_begin");
            // Failure recovery only: a preview or management dialog must never
            // obscure the next case's physical coordinates.
            try { main(() -> {
                if (panel != null) panel.dismiss();
                if (transfer != null) invoke(transfer, "dismissMenu", new Class<?>[0]);
                if (transfer != null) {
                    Object controls = get(transfer, "controls");
                    if (controls instanceof AtomicWorkbenchPendingControls) ((AtomicWorkbenchPendingControls) controls).close();
                }
                return null;
            }); } catch (Exception ignored) { }
            if (repository != null) {
                JSONArray snapshots = new JSONArray();
                for (AtomicWorkbenchContentItem.Kind kind : AtomicWorkbenchContentItem.Kind.values()) {
                    AtomicWorkbenchContentSnapshot snapshot = repository.snapshot(kind);
                    snapshots.put(new JSONObject().put("kind", kind.name()).put("count", snapshot.items.size())
                            .put("state", snapshot.state.name()).put("scope", snapshot.permission.scope.name())
                            .put("loading", snapshot.loading).put("cached", snapshot.cached).put("storageAvailable", snapshot.storageAvailable));
                }
                value.put("snapshotSummary", snapshots);
            }
            progress("case_cleanup_complete");
        }
    }
    private void runCase(String name, Action action) throws Exception { runCase(name, () -> { action.run(); return null; }); }
    private static String safeFailure(Throwable value) {
        // Exceptions from file/provider APIs can contain original private names.
        return value instanceof AssertionError && value.getMessage() != null && value.getMessage().matches("[A-Z0-9_]+")
                ? value.getMessage() : value.getClass().getSimpleName();
    }
    private static byte[] png() throws Exception {
        Bitmap bitmap = Bitmap.createBitmap(160, 96, Bitmap.Config.ARGB_8888);
        bitmap.setDensity(Bitmap.DENSITY_NONE); bitmap.eraseColor(Color.rgb(24, 96, 168));
        for (int y = 48; y < 96; y++) for (int x = 80; x < 160; x++) bitmap.setPixel(x, y, Color.rgb(232, 144, 32));
        try (ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            require(bitmap.compress(Bitmap.CompressFormat.PNG, 100, output), "OWN_PNG_ENCODING_FAILED"); return output.toByteArray();
        } finally { bitmap.recycle(); }
    }
    private static byte[] read(InputStream input, int maximum) throws Exception {
        require(input != null, "OWN_INPUT_STREAM_UNAVAILABLE");
        ByteArrayOutputStream output = new ByteArrayOutputStream(); byte[] buffer = new byte[8192]; int count;
        while ((count = input.read(buffer)) >= 0) {
            if (count == 0) continue; require(output.size() + count <= maximum, "OWN_INPUT_STREAM_EXCEEDS_EXPECTED_LENGTH"); output.write(buffer, 0, count);
        }
        return output.toByteArray();
    }
    private static Map<String, String> fingerprint(File root) throws Exception {
        Map<String, String> result = new LinkedHashMap<>();
        if (!root.exists()) return result;
        fingerprint(root, root, result); return result;
    }
    private static void fingerprint(File root, File entry, Map<String, String> result) throws Exception {
        require(!Files.isSymbolicLink(entry.toPath()), "PRIVATE_BACKUP_SYMLINK_NOT_SUPPORTED");
        String relative = root.toPath().relativize(entry.toPath()).toString();
        if (entry.isDirectory()) {
            result.put(relative, "directory"); File[] children = entry.listFiles();
            require(children != null, "PRIVATE_BACKUP_DIRECTORY_UNREADABLE");
            Arrays.sort(children, java.util.Comparator.comparing(File::getName));
            for (File child : children) fingerprint(root, child, result);
        } else {
            require(entry.isFile(), "PRIVATE_BACKUP_ENTRY_NOT_A_REGULAR_FILE");
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            try (InputStream input = new FileInputStream(entry)) { byte[] buffer = new byte[8192]; int n; while ((n = input.read(buffer)) >= 0) if (n > 0) digest.update(buffer, 0, n); }
            StringBuilder hash = new StringBuilder(); for (byte value : digest.digest()) hash.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
            result.put(relative, entry.length() + ":" + hash);
        }
    }
    private static void deleteIsolatedTree(File root) throws Exception {
        if (!Files.exists(root.toPath(), LinkOption.NOFOLLOW_LINKS)) return;
        require(!Files.isSymbolicLink(root.toPath()), "REFUSE_RECURSIVE_DELETE_OF_PRIVATE_SYMLINK");
        if (root.isDirectory()) {
            File[] children = root.listFiles(); require(children != null, "ISOLATED_DIRECTORY_UNREADABLE");
            for (File child : children) {
                require(child.getCanonicalFile().getParentFile().equals(root.getCanonicalFile()), "ISOLATED_DELETE_ESCAPES_PARENT"); deleteIsolatedTree(child);
            }
        }
        require(root.delete(), "ISOLATED_TEST_ENTRY_DELETE_FAILED");
    }
    private final class Backup {
        final File source, backup;
        boolean existed, moved;
        Map<String, String> before;
        Backup(File source, File backup) { this.source = source; this.backup = backup; }
        void isolate() throws Exception {
            existed = Files.exists(source.toPath(), LinkOption.NOFOLLOW_LINKS);
            before = fingerprint(source);
            checkpoint.getJSONArray("trees").put(new JSONObject().put("label", backup.getName())
                    .put("existed", existed).put("fingerprint", new JSONObject(before)));
            saveCheckpoint();
            if (existed) {
                Files.move(source.toPath(), backup.toPath(), StandardCopyOption.ATOMIC_MOVE); moved = true;
                require(before.equals(fingerprint(backup)), "ORIGINAL_PRIVATE_TREE_MOVE_SHA_VERIFICATION_FAILED");
            }
        }
        void restore() throws Exception {
            // If isolation failed before the move, this original is still in place.
            if (existed && !moved) { require(before == null || before.equals(fingerprint(source)), "UNMOVED_ORIGINAL_TREE_CHANGED"); return; }
            deleteIsolatedTree(source);
            if (moved) {
                Files.move(backup.toPath(), source.toPath(), StandardCopyOption.ATOMIC_MOVE);
                require(before.equals(fingerprint(source)), "ORIGINAL_PRIVATE_TREE_RESTORE_SHA_VERIFICATION_FAILED"); moved = false;
            } else require(!source.exists(), "ORIGINALLY_ABSENT_PRIVATE_TREE_WAS_NOT_REMOVED");
        }
    }
    private static final class Owned {
        final boolean image; final String name; final Uri uri; final byte[] bytes; final long modified;
        Owned(boolean image, String name, Uri uri, byte[] bytes, long modified) {
            this.image = image; this.name = name; this.uri = uri; this.bytes = bytes; this.modified = modified;
        }
    }
    private static final class Untested extends Exception { final String code; Untested(String code) { this.code = code; } }
    private static Object get(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(owner);
    }
    private static Object invoke(Object owner, String name, Class<?>[] parameters, Object... arguments) throws Exception {
        Method method = owner.getClass().getDeclaredMethod(name, parameters); method.setAccessible(true); return method.invoke(owner, arguments);
    }
    private void await(Check check, String reason, long timeout) throws Exception {
        progress("await_begin_" + reason);
        long deadline = SystemClock.uptimeMillis() + timeout;
        do { if (check.run()) { progress("await_complete_" + reason); return; } SystemClock.sleep(100L); } while (SystemClock.uptimeMillis() < deadline);
        progress("await_failed_" + reason);
        throw new AssertionError(reason);
    }
    private void progress(String phase) {
        // Fixed test stage/phase codes only; no original names, clipboard or URI data.
        Bundle status = new Bundle();
        status.putString("workbench_content_stage", stage);
        status.putString("workbench_content_phase", phase);
        try { test.sendStatus(0, status); } catch (RuntimeException ignored) { }
    }
    private <T> T main(Work<T> work) throws Exception {
        if (android.os.Looper.myLooper() == android.os.Looper.getMainLooper()) return work.run();
        AtomicReference<T> result = new AtomicReference<>(); AtomicReference<Throwable> error = new AtomicReference<>();
        test.runOnMainSync(() -> { try { result.set(work.run()); } catch (Throwable failure) { error.set(failure); } });
        if (error.get() instanceof Exception) throw (Exception) error.get();
        if (error.get() instanceof AssertionError) throw (AssertionError) error.get();
        if (error.get() != null) throw new RuntimeException(error.get()); return result.get();
    }
    private static void require(boolean value, String reason) { if (!value) throw new AssertionError(reason); }
    private interface Check { boolean run() throws Exception; }
    private interface Action { void run() throws Exception; }
    private interface Work<T> { T run() throws Exception; }
    private interface ViewSource { View get() throws Exception; }
}
