package ls.augment.com;

import android.Manifest;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.UriPermission;
import android.content.pm.PackageManager;
import android.content.res.AssetFileDescriptor;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.UserManager;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.provider.OpenableColumns;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/**
 * Phone-only recent content source. It retains private content references, never filesystem paths,
 * never grants original URIs to another app, and never logs filenames, URIs, or file contents.
 * All scans perform I/O and belong on the repository worker, not the main thread.
 */
final class AtomicWorkbenchPhoneContentSource implements AtomicWorkbenchContentSource {
    private static final long CHANGE_MERGE_MS = 250L;
    private static final long SCAN_TIMEOUT_MS = 30_000L;
    private static final int MAX_DOCUMENT_GRANTS = 128;
    private static final int MAX_TREE_DEPTH = 8, MAX_TREE_DIRECTORIES = 256, MAX_TREE_ENTRIES = 6000;
    private static final Uri MEDIA_ROOT = Uri.parse("content://media");
    private static final String[] MEDIA_COLUMNS = {
            MediaStore.MediaColumns._ID, MediaStore.MediaColumns.DISPLAY_NAME,
            MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.DATE_MODIFIED,
            MediaStore.MediaColumns.DATE_ADDED, MediaStore.MediaColumns.SIZE,
            MediaStore.MediaColumns.DURATION
    };
    private static final String[] DOCUMENT_COLUMNS = {
            DocumentsContract.Document.COLUMN_DOCUMENT_ID, DocumentsContract.Document.COLUMN_MIME_TYPE,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME, DocumentsContract.Document.COLUMN_LAST_MODIFIED,
            DocumentsContract.Document.COLUMN_SIZE, DocumentsContract.Document.COLUMN_FLAGS
    };
    private static final String[] OPENABLE_COLUMNS = { OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE };

    private final Context context;
    private final ContentResolver resolver;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Object lifecycle = new Object();
    private boolean closed, observing, receiverRegistered;
    private Runnable changed;
    private Set<String> observedGrants = Set.of();
    private final Set<CancellationSignal> activeScans = new HashSet<>();
    private final Set<Future<Result>> activeFutures = new HashSet<>();
    private final ThreadPoolExecutor providerWorker = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), task -> {
                Thread thread = new Thread(task, "DuoPhoneContentQuery");
                thread.setDaemon(true);
                return thread;
            }, new ThreadPoolExecutor.AbortPolicy());
    private final ThreadPoolExecutor cancelWorker = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), task -> {
                Thread thread = new Thread(task, "DuoPhoneContentCancel");
                thread.setDaemon(true);
                return thread;
            }, new ThreadPoolExecutor.AbortPolicy());

    private final Runnable deliverChange = () -> {
        // Serialize delivery with close: no queued callback can start after close returns.
        synchronized (lifecycle) {
            if (!closed && observing && changed != null) changed.run();
        }
    };
    private final ContentObserver observer = new ContentObserver(handler) {
        @Override public void onChange(boolean selfChange) { hint(); }
        @Override public void onChange(boolean selfChange, Uri uri) { hint(); }
    };
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context ignored, Intent intent) { hint(); }
    };
    AtomicWorkbenchPhoneContentSource(Context context) {
        if (context == null) throw new NullPointerException("Phone context required");
        Context app = context.getApplicationContext();
        this.context = app != null ? app : context;
        resolver = this.context.getContentResolver();
    }

    @Override public Result scan(AtomicWorkbenchContentItem.Kind kind) {
        if (kind == null || kind == AtomicWorkbenchContentItem.Kind.CLIPBOARD || isClosed())
            return unavailable();
        CancellationSignal cancellation = new CancellationSignal();
        synchronized (lifecycle) {
            if (closed) return unavailable();
            activeScans.add(cancellation);
        }
        Future<Result> future = null;
        Runnable timeout = null;
        try {
            Future<Result> submitted = providerWorker.submit(() -> scan(kind, cancellation));
            future = submitted;
            synchronized (lifecycle) {
                if (closed) future.cancel(true);
                else activeFutures.add(future);
            }
            timeout = () -> {
                submitted.cancel(true);
                cancelAsync(cancellation);
            };
            handler.postDelayed(timeout, SCAN_TIMEOUT_MS);
            // Provider cancellation is cooperative. Bound the repository caller even when a
            // broken provider ignores it or blocks in getType (which has no cancellation API).
            return future.get(SCAN_TIMEOUT_MS, TimeUnit.MILLISECONDS);
        } catch (TimeoutException | CancellationException | ExecutionException | RejectedExecutionException unavailable) {
            if (future != null) future.cancel(true);
            cancelAsync(cancellation);
            return unavailable();
        } catch (InterruptedException cancelled) {
            if (future != null) future.cancel(true);
            cancelAsync(cancellation);
            Thread.currentThread().interrupt();
            // A timed-out/cancelled scan cannot certify even its earlier rows as a fresh snapshot.
            return unavailable();
        } finally {
            if (future != null && !future.isDone()) future.cancel(true);
            // Remove a cancelled queued request if an earlier uncooperative provider still owns
            // the sole query thread. Repeated refreshes never build an unbounded backlog.
            providerWorker.purge();
            if (timeout != null) handler.removeCallbacks(timeout);
            synchronized (lifecycle) {
                activeScans.remove(cancellation);
                if (future != null) activeFutures.remove(future);
            }
        }
    }

    private Result scan(AtomicWorkbenchContentItem.Kind kind, CancellationSignal cancellation) {
        // One retry handles permission changes while a provider is being read. Never publish rows
        // read under a grant which no longer exists when the scan finishes.
        for (int attempt = 0; attempt < 2; attempt++) {
            cancellation.throwIfCanceled();
            Access before;
            try { before = access(); }
            catch (RuntimeException unavailable) { return unavailable(); }
            if (!before.unlocked) return locked();
            Scan scan = new Scan(kind, cancellation);
            scanMedia(scan);
            scanDocuments(before, scan);
            cancellation.throwIfCanceled();
            if (isClosed()) return unavailable();
            Access after;
            try { after = access(); }
            catch (RuntimeException unavailable) { return unavailable(); }
            if (!after.unlocked) return locked();
            if (!before.sameAccess(after)) {
                if (attempt == 0) continue;
                AtomicWorkbenchContentPermissionState permission = after.permission(kind, 0);
                return new Result(List.of(), permission, permission.accessible()
                        ? State.UNAVAILABLE : State.PERMISSION_REQUIRED);
            }
            updateDocumentObservers(after);
            AtomicWorkbenchContentPermissionState permission = after.permission(kind, scan.validatedGrants);
            List<AtomicWorkbenchContentItem> items = AtomicWorkbenchContentPolicy.merge(kind, scan.items, Set.of());
            if (!permission.accessible() && !items.isEmpty()) {
                // Apps can always read their own public MediaStore entries without a broad grant.
                permission = new AtomicWorkbenchContentPermissionState(
                        AtomicWorkbenchContentPermissionState.Scope.LIMITED,
                        after.images, after.videos, after.audio, after.selected, after.allFiles, scan.validatedGrants);
            }
            if (scan.denied > 0 && items.isEmpty() && scan.failed == 0) {
                return new Result(List.of(), AtomicWorkbenchContentPermissionState.simple(
                        AtomicWorkbenchContentPermissionState.Scope.DENIED), State.PERMISSION_REQUIRED);
            }
            if (!permission.accessible()) return new Result(List.of(), permission,
                    scan.failed > 0 ? State.ERROR : scan.bounded ? State.UNAVAILABLE : State.PERMISSION_REQUIRED);
            if (scan.failed > 0 || scan.denied > 0) {
                // An unreadable candidate must never look like a successful empty library.
                if (items.isEmpty()) return new Result(List.of(), permission,
                        scan.denied > 0 && scan.failed == 0 ? State.PERMISSION_REQUIRED : State.ERROR);
                return new Result(items, permission, State.PARTIAL);
            }
            if (scan.successfulQueries == 0) return new Result(List.of(), permission, State.UNAVAILABLE);
            return new Result(items, permission, scan.bounded || before.grantsTruncated ? State.PARTIAL : State.READY);
        }
        return unavailable();
    }

    private void scanMedia(Scan scan) {
        Set<String> volumes;
        try { volumes = MediaStore.getExternalVolumeNames(context); }
        catch (SecurityException denied) { scan.denied++; return; }
        catch (RuntimeException unavailable) { scan.failed++; return; }
        ArrayList<String> orderedVolumes = new ArrayList<>(volumes);
        Collections.sort(orderedVolumes);
        int limit = AtomicWorkbenchContentPolicy.limit(scan.kind);
        for (String volume : orderedVolumes) {
            if (isClosed()) return;
            scan.cancellation.throwIfCanceled();
            Uri collection = MediaStore.Files.getContentUri(volume);
            String selection = MediaStore.MediaColumns.IS_PENDING + "=0 AND "
                    + MediaStore.MediaColumns.IS_TRASHED + "=0 AND ("
                    + MediaStore.MediaColumns.MIME_TYPE + " LIKE ? OR "
                    + MediaStore.MediaColumns.MIME_TYPE + " LIKE ?"
                    + (scan.kind == AtomicWorkbenchContentItem.Kind.FILES
                    ? " OR " + MediaStore.MediaColumns.MIME_TYPE + " LIKE ? OR "
                    + MediaStore.MediaColumns.MIME_TYPE + " LIKE ?" : "") + ')';
            Bundle query = new Bundle();
            query.putString(ContentResolver.QUERY_ARG_SQL_SELECTION, selection);
            query.putStringArray(ContentResolver.QUERY_ARG_SQL_SELECTION_ARGS,
                    scan.kind == AtomicWorkbenchContentItem.Kind.MEDIA
                            ? new String[] { "image/%", "video/%" }
                            : new String[] { "video/%", "audio/%", "text/%", "application/%" });
            query.putStringArray(ContentResolver.QUERY_ARG_SORT_COLUMNS,
                    new String[] { MediaStore.MediaColumns.DATE_MODIFIED, MediaStore.MediaColumns.DATE_ADDED,
                            MediaStore.MediaColumns._ID });
            query.putInt(ContentResolver.QUERY_ARG_SORT_DIRECTION, ContentResolver.QUERY_SORT_DIRECTION_DESCENDING);
            // Allow unreadable metadata rows to be skipped while bounding work even if a provider
            // ignores QUERY_ARG_LIMIT. Final policy enforces the per-page 600 / 1000 item limits.
            query.putInt(ContentResolver.QUERY_ARG_LIMIT, limit * 2);
            try (Cursor cursor = resolver.query(collection, MEDIA_COLUMNS, query, scan.cancellation)) {
                if (cursor == null) { scan.failed++; continue; }
                int rows = 0;
                int found = 0;
                while (cursor.moveToNext()) {
                    if (isClosed()) return;
                    scan.cancellation.throwIfCanceled();
                    if (rows++ >= limit * 2) { scan.bounded = true; break; }
                    long id = number(cursor, MediaStore.MediaColumns._ID, -1);
                    String mime = AtomicWorkbenchContentPolicy.mime(value(cursor, MediaStore.MediaColumns.MIME_TYPE));
                    if (id < 0 || !accepts(scan.kind, mime)) continue;
                    Uri uri = ContentUris.withAppendedId(collection, id);
                    if (!readable(uri, scan)) continue;
                    long modified = secondsToMillis(number(cursor, MediaStore.MediaColumns.DATE_MODIFIED, 0));
                    if (modified == 0) modified = secondsToMillis(number(cursor, MediaStore.MediaColumns.DATE_ADDED, 0));
                    scan.items.add(AtomicWorkbenchContentItem.file(scan.kind,
                            AtomicWorkbenchContentItem.Source.MEDIA_STORE, uri.toString(), mime,
                            value(cursor, MediaStore.MediaColumns.DISPLAY_NAME), modified,
                            number(cursor, MediaStore.MediaColumns.SIZE, -1),
                            number(cursor, MediaStore.MediaColumns.DURATION, 0)));
                    found++;
                }
                if (rows >= limit * 2 && found < limit) scan.bounded = true;
                scan.successfulQueries++;
            } catch (SecurityException denied) { scan.denied++; }
            catch (RuntimeException unavailable) { scan.failed++; }
        }
    }

    private void scanDocuments(Access access, Scan scan) {
        for (Uri grant : access.grants) {
            if (isClosed()) return;
            scan.cancellation.throwIfCanceled();
            try {
                boolean verified;
                if (DocumentsContract.isTreeUri(grant)) verified = scanTree(grant, scan);
                else verified = scanSingle(grant, scan);
                if (verified) scan.validatedGrants++;
            } catch (SecurityException denied) { scan.denied++; }
            catch (RuntimeException unavailable) { scan.failed++; }
        }
    }

    private boolean scanSingle(Uri uri, Scan scan) {
        boolean document = DocumentsContract.isDocumentUri(context, uri);
        try (Cursor cursor = resolver.query(uri, document ? DOCUMENT_COLUMNS : OPENABLE_COLUMNS,
                null, null, null, scan.cancellation)) {
            if (cursor == null || !cursor.moveToFirst()) { scan.failed++; return false; }
            String mime = document ? value(cursor, DocumentsContract.Document.COLUMN_MIME_TYPE) : resolver.getType(uri);
            mime = AtomicWorkbenchContentPolicy.mime(mime);
            // A single granted PDF cannot make the media page appear authorized, and an image-only
            // grant does not authorize the non-image file page. Tree grants are broader by design.
            if (!accepts(scan.kind, mime)) return false;
            if (document && (number(cursor, DocumentsContract.Document.COLUMN_FLAGS, 0)
                    & DocumentsContract.Document.FLAG_VIRTUAL_DOCUMENT) != 0) {
                // A virtual document requires a separate typed-format choice before byte delivery.
                scan.bounded = true;
                return false;
            }
            if (!readable(uri, scan)) return false;
            scan.successfulQueries++;
            scan.items.add(AtomicWorkbenchContentItem.file(scan.kind,
                    AtomicWorkbenchContentItem.Source.DOCUMENTS, uri.toString(), mime,
                    value(cursor, OpenableColumns.DISPLAY_NAME),
                    document ? number(cursor, DocumentsContract.Document.COLUMN_LAST_MODIFIED, 0) : 0,
                    number(cursor, OpenableColumns.SIZE, -1), 0));
            return true;
        }
    }

    private boolean scanTree(Uri tree, Scan scan) {
        String root = DocumentsContract.getTreeDocumentId(tree);
        ArrayDeque<Directory> pending = new ArrayDeque<>();
        Set<String> visited = new HashSet<>();
        pending.add(new Directory(root, 0));
        boolean rootReadable = false;
        while (!pending.isEmpty()) {
            if (isClosed()) return false;
            scan.cancellation.throwIfCanceled();
            if (scan.directories >= MAX_TREE_DIRECTORIES || scan.treeEntries >= MAX_TREE_ENTRIES) {
                scan.bounded = true;
                break;
            }
            Directory directory = pending.removeFirst();
            if (!visited.add(directory.id)) continue;
            scan.directories++;
            Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(tree, directory.id);
            try (Cursor cursor = resolver.query(children, DOCUMENT_COLUMNS, null, null,
                    null, scan.cancellation)) {
                if (cursor == null) { scan.failed++; continue; }
                while (cursor.moveToNext()) {
                    if (isClosed()) return false;
                    scan.cancellation.throwIfCanceled();
                    if (scan.treeEntries++ >= MAX_TREE_ENTRIES) { scan.bounded = true; break; }
                    String id = value(cursor, DocumentsContract.Document.COLUMN_DOCUMENT_ID);
                    String rawMime = value(cursor, DocumentsContract.Document.COLUMN_MIME_TYPE);
                    if (id == null || id.isEmpty()) { scan.failed++; continue; }
                    if (DocumentsContract.Document.MIME_TYPE_DIR.equals(rawMime)) {
                        if (directory.depth < MAX_TREE_DEPTH) pending.addLast(new Directory(id, directory.depth + 1));
                        else scan.bounded = true;
                        continue;
                    }
                    String mime = AtomicWorkbenchContentPolicy.mime(rawMime);
                    if (!accepts(scan.kind, mime)) continue;
                    if ((number(cursor, DocumentsContract.Document.COLUMN_FLAGS, 0)
                            & DocumentsContract.Document.FLAG_VIRTUAL_DOCUMENT) != 0) {
                        scan.bounded = true;
                        continue;
                    }
                    Uri uri = DocumentsContract.buildDocumentUriUsingTree(tree, id);
                    if (!readable(uri, scan)) continue;
                    scan.items.add(AtomicWorkbenchContentItem.file(scan.kind,
                            AtomicWorkbenchContentItem.Source.DOCUMENTS, uri.toString(), mime,
                            value(cursor, DocumentsContract.Document.COLUMN_DISPLAY_NAME),
                            number(cursor, DocumentsContract.Document.COLUMN_LAST_MODIFIED, 0),
                            number(cursor, DocumentsContract.Document.COLUMN_SIZE, -1), 0));
                }
                if (cursor.getExtras().getBoolean(DocumentsContract.EXTRA_LOADING, false)) scan.bounded = true;
                scan.successfulQueries++;
                if (directory.depth == 0) rootReadable = true;
            } catch (SecurityException denied) { scan.denied++; }
            catch (RuntimeException unavailable) { scan.failed++; }
        }
        return rootReadable;
    }

    private boolean readable(Uri uri, Scan scan) {
        scan.cancellation.throwIfCanceled();
        if (!AtomicWorkbenchContentItem.contentUri(uri.toString())) { scan.failed++; return false; }
        try (AssetFileDescriptor descriptor = resolver.openAssetFileDescriptor(uri, "r", scan.cancellation)) {
            if (descriptor == null) { scan.failed++; return false; }
            // Query visibility is weaker than read access. Read one byte, then discard it. Empty
            // files are valid. No preview bytes or original source grants cross this boundary.
            try (InputStream input = descriptor.createInputStream()) {
                scan.cancellation.setOnCancelListener(() -> {
                    try { input.close(); } catch (IOException ignored) { }
                });
                try {
                    scan.cancellation.throwIfCanceled();
                    input.read();
                    scan.cancellation.throwIfCanceled();
                } finally { scan.cancellation.setOnCancelListener(null); }
            }
            return true;
        } catch (SecurityException denied) { scan.denied++; return false; }
        catch (IOException | RuntimeException unavailable) { scan.failed++; return false; }
    }

    private Access access() {
        UserManager users = context.getSystemService(UserManager.class);
        if (users == null) throw new IllegalStateException("User state unavailable");
        if (!users.isUserUnlocked()) return new Access(false, false, false, false, false, false, List.of(), false);
        ArrayList<Uri> grants = new ArrayList<>();
        boolean truncated = false;
        for (UriPermission grant : resolver.getPersistedUriPermissions()) {
            Uri uri = grant.getUri();
            if (!grant.isReadPermission() || uri == null || !AtomicWorkbenchContentItem.contentUri(uri.toString())) continue;
            if (grants.size() >= MAX_DOCUMENT_GRANTS) { truncated = true; break; }
            grants.add(uri);
        }
        grants.sort((left, right) -> left.toString().compareTo(right.toString()));
        return new Access(true, granted(Manifest.permission.READ_MEDIA_IMAGES),
                granted(Manifest.permission.READ_MEDIA_VIDEO), granted(Manifest.permission.READ_MEDIA_AUDIO),
                granted(Manifest.permission.READ_MEDIA_VISUAL_USER_SELECTED), Environment.isExternalStorageManager(),
                List.copyOf(grants), truncated);
    }

    private boolean granted(String permission) {
        return context.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED;
    }

    @Override public void start(Runnable changed) {
        if (changed == null) throw new NullPointerException("Change callback required");
        synchronized (lifecycle) {
            if (closed) return;
            this.changed = changed;
            if (observing) return;
            observing = true;
            try { resolver.registerContentObserver(MEDIA_ROOT, true, observer); }
            catch (RuntimeException unavailable) { /* Scan still reports provider access independently. */ }
            try {
                context.registerReceiver(receiver, new IntentFilter(Intent.ACTION_USER_UNLOCKED), Context.RECEIVER_NOT_EXPORTED);
                receiverRegistered = true;
                IntentFilter storage = new IntentFilter();
                storage.addAction(Intent.ACTION_MEDIA_MOUNTED);
                storage.addAction(Intent.ACTION_MEDIA_UNMOUNTED);
                storage.addAction(Intent.ACTION_MEDIA_EJECT);
                storage.addAction(Intent.ACTION_MEDIA_REMOVED);
                storage.addAction(Intent.ACTION_MEDIA_BAD_REMOVAL);
                storage.addDataScheme("file");
                context.registerReceiver(receiver, storage, Context.RECEIVER_NOT_EXPORTED);
            } catch (RuntimeException unavailable) { /* Foreground refresh and source queries remain authoritative. */ }
            try { updateDocumentObservers(access()); }
            catch (RuntimeException unavailable) { hint(); }
        }
    }

    private void updateDocumentObservers(Access access) {
        synchronized (lifecycle) {
            if (closed || !observing) return;
            Set<String> current = new HashSet<>();
            for (Uri uri : access.grants) current.add(uri.toString());
            if (current.equals(observedGrants)) return;
            // Unregister all registrations of this observer before replacing the grant set.
            try { resolver.unregisterContentObserver(observer); } catch (RuntimeException ignored) { }
            try { resolver.registerContentObserver(MEDIA_ROOT, true, observer); } catch (RuntimeException ignored) { }
            for (Uri uri : access.grants) {
                try {
                    resolver.registerContentObserver(uri, true, observer);
                    if (DocumentsContract.isTreeUri(uri)) resolver.registerContentObserver(
                            DocumentsContract.buildChildDocumentsUriUsingTree(uri, DocumentsContract.getTreeDocumentId(uri)),
                            true, observer);
                } catch (RuntimeException ignored) { /* A revoked grant is handled by the next scan. */ }
            }
            observedGrants = Set.copyOf(current);
        }
    }

    private void hint() {
        synchronized (lifecycle) {
            if (closed || !observing) return;
            handler.removeCallbacks(deliverChange);
            handler.postDelayed(deliverChange, CHANGE_MERGE_MS);
        }
    }

    @Override public void stop() {
        synchronized (lifecycle) {
            detachObservers();
        }
    }

    @Override public void close() {
        List<CancellationSignal> cancellations;
        List<Future<Result>> futures;
        synchronized (lifecycle) {
            if (closed) return;
            closed = true;
            detachObservers();
            cancellations = List.copyOf(activeScans);
            futures = List.copyOf(activeFutures);
        }
        // Cancel outside the lifecycle lock: a provider's cancellation callback may close a stream
        // concurrently with the scan finishing and acquiring that same lifecycle lock.
        for (Future<Result> future : futures) future.cancel(true);
        for (CancellationSignal cancellation : cancellations) cancelAsync(cancellation);
        providerWorker.shutdownNow();
        // Drain already queued cancellation requests, without waiting for provider code to finish.
        cancelWorker.shutdown();
    }

    private void cancelAsync(CancellationSignal cancellation) {
        if (cancellation.isCanceled()) return;
        try { cancelWorker.execute(cancellation::cancel); }
        catch (RejectedExecutionException busyOrClosed) {
            // One stuck provider cancellation cannot block callers or grow another thread/queue.
            // Future cancellation independently prevents the result from being published.
        }
    }

    private void detachObservers() {
        changed = null;
        observing = false;
        handler.removeCallbacks(deliverChange);
        try { resolver.unregisterContentObserver(observer); } catch (RuntimeException ignored) { }
        if (receiverRegistered) {
            try { context.unregisterReceiver(receiver); } catch (RuntimeException ignored) { }
            receiverRegistered = false;
        }
        observedGrants = Set.of();
    }

    private boolean isClosed() { synchronized (lifecycle) { return closed; } }
    private static boolean accepts(AtomicWorkbenchContentItem.Kind kind, String mime) {
        if (kind == AtomicWorkbenchContentItem.Kind.MEDIA) return mime.startsWith("image/") || mime.startsWith("video/");
        return kind == AtomicWorkbenchContentItem.Kind.FILES && (mime.startsWith("video/") || mime.startsWith("audio/")
                || mime.startsWith("text/") || mime.startsWith("application/"));
    }
    private static String value(Cursor cursor, String name) {
        int column = cursor.getColumnIndex(name);
        return column < 0 || cursor.isNull(column) ? null : cursor.getString(column);
    }
    private static long number(Cursor cursor, String name, long fallback) {
        int column = cursor.getColumnIndex(name);
        return column < 0 || cursor.isNull(column) ? fallback : cursor.getLong(column);
    }
    private static long secondsToMillis(long value) {
        return value <= 0 ? 0 : value > Long.MAX_VALUE / 1000 ? Long.MAX_VALUE : value * 1000;
    }
    private static Result unavailable() { return new Result(List.of(), AtomicWorkbenchContentPermissionState.simple(
            AtomicWorkbenchContentPermissionState.Scope.UNAVAILABLE), State.UNAVAILABLE); }
    private static Result locked() { return new Result(List.of(), AtomicWorkbenchContentPermissionState.simple(
            AtomicWorkbenchContentPermissionState.Scope.LOCKED), State.LOCKED); }
    @Override public String toString() { return "WorkbenchPhoneContentSource"; }

    private static final class Directory {
        final String id;
        final int depth;
        Directory(String id, int depth) { this.id = id; this.depth = depth; }
        @Override public String toString() { return "WorkbenchContentDirectory"; }
    }
    private static final class Scan {
        final AtomicWorkbenchContentItem.Kind kind;
        final CancellationSignal cancellation;
        final ArrayList<AtomicWorkbenchContentItem> items = new ArrayList<>();
        int failed, denied, successfulQueries, validatedGrants, directories, treeEntries;
        boolean bounded;
        Scan(AtomicWorkbenchContentItem.Kind kind, CancellationSignal cancellation) {
            this.kind = kind; this.cancellation = cancellation;
        }
        @Override public String toString() { return "WorkbenchContentScan(" + kind + ')'; }
    }
    private static final class Access {
        final boolean unlocked, images, videos, audio, selected, allFiles, grantsTruncated;
        final List<Uri> grants;
        Access(boolean unlocked, boolean images, boolean videos, boolean audio, boolean selected,
                boolean allFiles, List<Uri> grants, boolean grantsTruncated) {
            this.unlocked = unlocked; this.images = images; this.videos = videos; this.audio = audio;
            this.selected = selected; this.allFiles = allFiles; this.grants = grants; this.grantsTruncated = grantsTruncated;
        }
        AtomicWorkbenchContentPermissionState permission(AtomicWorkbenchContentItem.Kind kind, int validGrants) {
            return AtomicWorkbenchContentAccess.permission(kind, images, videos, audio, selected, allFiles, validGrants);
        }
        boolean sameAccess(Access other) {
            return unlocked == other.unlocked && images == other.images && videos == other.videos && audio == other.audio
                    && selected == other.selected && allFiles == other.allFiles && grants.equals(other.grants)
                    && grantsTruncated == other.grantsTruncated;
        }
        @Override public String toString() { return "WorkbenchContentAccess"; }
    }
}
