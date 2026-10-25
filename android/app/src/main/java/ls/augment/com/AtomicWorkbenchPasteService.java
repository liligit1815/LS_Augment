package ls.augment.com;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.accessibilityservice.InputMethod;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.SparseArray;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.SurroundingText;
import java.util.List;
import java.util.ArrayDeque;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.util.concurrent.atomic.AtomicBoolean;

/** User-enabled phone service. Editing requires a drop lease; extraction requires a system pointer lease. */
public final class AtomicWorkbenchPasteService extends AccessibilityService {
    private static volatile AtomicWorkbenchPasteService live;
    private final Handler main = new Handler(Looper.getMainLooper());
    // Framework InputMethod callbacks and all lease identity checks execute on main.
    private WorkbenchInputMethod method;
    private long generation;
    private boolean connected, started;
    private String editorPackage;
    private int editorType, editorField;
    private volatile AtomicWorkbenchExtractionEngine extraction;
    // Native node identity from an explicit, Root-window-authorized focus action; never its text.
    private static final Map<String, VisibleFocus> visibleFocus = new LinkedHashMap<>();
    private static final class VisibleFocus {
        final AtomicWorkbenchEditorEvidence.WindowEvidence window;
        final AccessibilityNodeInfo node;
        final AtomicWorkbenchPasteService owner;
        final long deadline;
        final long generationFloor;
        boolean valid=true;
        VisibleFocus(AtomicWorkbenchPasteService owner,AtomicWorkbenchPasteRequest request,AtomicWorkbenchEditorEvidence.WindowEvidence window,AccessibilityNodeInfo node,long generationFloor){
            this.owner=owner;deadline=request.deadlineAt;this.window=window;this.node=node;this.generationFloor=generationFloor;
        }
    }

    /** Only an authenticated system pointer ticket can reach the new read-only extraction backend. */
    static boolean requestExtraction(AtomicWorkbenchExtractionRequest request, Consumer<AtomicWorkbenchExtractionResult> callback) {
        AtomicWorkbenchPasteService service=live;
        AtomicWorkbenchExtractionEngine engine=service==null?null:service.extraction;
        if(engine==null){
            if(request==null||callback==null)throw new IllegalArgumentException("missing_extraction_request");
            new Handler(Looper.getMainLooper()).post(()->callback.accept(AtomicWorkbenchExtractionResult.failure(request,AtomicWorkbenchExtractionResult.State.UNAVAILABLE)));
            return false;
        }
        return engine.submit(request,callback);
    }
    static void cancelExtraction(String requestId) {
        AtomicWorkbenchPasteService service=live;AtomicWorkbenchExtractionEngine engine=service==null?null:service.extraction;if(engine!=null)engine.cancel(requestId);
    }

    static boolean available() { AtomicWorkbenchPasteService s = live; return s != null && s.connected; }

    static boolean focusFirstVisible(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence.WindowEvidence window)throws Exception {
        AtomicWorkbenchPasteService service=live;if(service==null)throw new IllegalStateException("service_not_enabled");
        AtomicBoolean waiting=new AtomicBoolean(true);
        try{
            boolean focused=service.onMain(r,()->service.focusVisibleOnMain(r,window,waiting));
            if(!focused)return false;
            long until=Math.min(r.deadlineAt,SystemClock.elapsedRealtime()+1000L);
            do{
                boolean ready=service.onMain(r,()->{
                    VisibleFocus receipt=service.visibleFocus.get(r.id);
                    return live==service&&service.connected&&receipt!=null&&receipt.valid&&receipt.owner==service&&receipt.node.refresh()&&receipt.node.isFocused()
                            &&service.generation>receipt.generationFloor&&service.started&&service.method!=null
                            &&service.method.getCurrentInputStarted()&&r.packageName.equals(service.editorPackage);
                });
                if(ready)return true;
                Thread.sleep(20L);
            }while(SystemClock.elapsedRealtime()<until);
            throw new IllegalStateException("editor_evidence_unavailable");
        }finally{waiting.set(false);}
    }
    static void releaseVisibleFocus(AtomicWorkbenchPasteRequest r){
        new Handler(Looper.getMainLooper()).post(()->visibleFocus.remove(r.id));
    }
    private AccessibilityNodeInfo windowRoot(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence.WindowEvidence proof){
        if(!proof.matches(r,SystemClock.elapsedRealtime()))return null;
        SparseArray<List<AccessibilityWindowInfo>> all=getWindowsOnAllDisplays();List<AccessibilityWindowInfo> windows=all==null?null:all.get(r.displayId);
        AccessibilityNodeInfo found=null;
        if(windows!=null)for(AccessibilityWindowInfo window:windows){
            if(window==null||window.getDisplayId()!=r.displayId||window.getId()!=proof.accessibilityWindowId
                    ||window.getType()!=AccessibilityWindowInfo.TYPE_APPLICATION||!window.isFocused())continue;
            AccessibilityNodeInfo root=window.getRoot(0);
            if(root==null||root.getPackageName()==null||!r.packageName.contentEquals(root.getPackageName())||found!=null)return null;
            found=root;
        }
        return found;
    }
    private boolean focusVisibleOnMain(AtomicWorkbenchPasteRequest r,AtomicWorkbenchEditorEvidence.WindowEvidence proof,AtomicBoolean waiting){
        if(!connected||live!=this||!waiting.get()||proof==null||!proof.matches(r,SystemClock.elapsedRealtime()))return false;
        visibleFocus.entrySet().removeIf(entry->SystemClock.elapsedRealtime()>=entry.getValue().deadline);
        if(visibleFocus.containsKey(r.id)||visibleFocus.size()>=16)return false;
        AccessibilityNodeInfo root=windowRoot(r,proof);if(root==null)return false;
        AccessibilityNodeInfo current=root.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
        // Existing editor/caret paths keep their original refusal; discovery does not refocus them.
        if(current!=null&&current.isEditable()){
            if(current.isPassword()||AtomicWorkbenchPastePolicy.password(current.getInputType()))throw new IllegalStateException("password_editor");
            return false;
        }
        ArrayDeque<AccessibilityNodeInfo> nodes=new ArrayDeque<>();nodes.push(root);int visited=0;
        long until=Math.min(r.deadlineAt,SystemClock.elapsedRealtime()+600L);
        while(!nodes.isEmpty()&&visited++<128&&waiting.get()&&SystemClock.elapsedRealtime()<until){
            AccessibilityNodeInfo node=nodes.pop();
            if(!node.isVisibleToUser())continue;
            if(node.getWindowId()!=proof.accessibilityWindowId||node.getPackageName()==null||!r.packageName.contentEquals(node.getPackageName()))return false;
            if(node.isEditable()&&node.isEnabled()){
                if(node.isPassword()||AtomicWorkbenchPastePolicy.password(node.getInputType()))throw new IllegalStateException("password_editor");
                if(!node.refresh()||!node.isVisibleToUser()||!node.isEnabled()||!node.isEditable()
                        ||node.getWindowId()!=proof.accessibilityWindowId||node.getPackageName()==null||!r.packageName.contentEquals(node.getPackageName())
                        ||node.isPassword()||AtomicWorkbenchPastePolicy.password(node.getInputType())
                        ||!waiting.get()||!proof.matches(r,SystemClock.elapsedRealtime()))return false;
                AccessibilityNodeInfo freshRoot=windowRoot(r,proof);if(freshRoot==null)return false;
                AccessibilityNodeInfo freshFocus=freshRoot.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
                if(freshFocus!=null&&freshFocus.isEditable())return false;
                long before=generation;
                if(!node.performAction(AccessibilityNodeInfo.ACTION_FOCUS))return false;
                visibleFocus.put(r.id,new VisibleFocus(this,r,proof,node,before));return true;
            }
            int count=node.getChildCount();if(count<0||count>128-visited)return false;
            for(int index=count-1;index>=0;index--){AccessibilityNodeInfo child=node.getChild(index);if(child==null)return false;nodes.push(child);}
        }
        return false;
    }

    static AtomicWorkbenchPasteCoordinator.Backend backend() {
        return (request, evidence) -> {
            AtomicWorkbenchPasteService service = live;
            if (service == null) throw new IllegalStateException("service_not_enabled");
            return service.onMain(request, () -> service.capture(request, evidence));
        };
    }

    @Override public InputMethod onCreateInputMethod() {
        method = new WorkbenchInputMethod(); return method;
    }
    @Override protected void onServiceConnected() {
        super.onServiceConnected();
        for(VisibleFocus receipt:visibleFocus.values())if(receipt.owner==this)receipt.valid=false;
        AccessibilityServiceInfo info = getServiceInfo();
        connected = info != null && (info.flags & AccessibilityServiceInfo.FLAG_INPUT_METHOD_EDITOR) != 0;
        generation++; live = this;
        if(extraction!=null)extraction.close();extraction=null;
        if(info!=null&&(info.getCapabilities()&AccessibilityServiceInfo.CAPABILITY_CAN_RETRIEVE_WINDOW_CONTENT)!=0
                &&(info.flags&AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS)!=0)
            extraction=new AtomicWorkbenchExtractionEngine(this,task->main.post(task));
        AtomicWorkbenchExtractionSystemBridge.disconnect(this);
        if(extraction!=null)AtomicWorkbenchExtractionSystemBridge.connect(this);
    }
    @Override public void onAccessibilityEvent(AccessibilityEvent event) {
        // Metadata invalidation only. Never collect event text, event source nodes or clipboard.
        if(extraction!=null&&event!=null)extraction.event(event.getEventType(),event.getWindowId());
    }
    @Override public void onInterrupt() {
        AtomicWorkbenchExtractionSystemBridge.disconnect(this);
        for(VisibleFocus receipt:visibleFocus.values())if(receipt.owner==this)receipt.valid=false;
        generation++; if(extraction!=null){extraction.interrupt();AtomicWorkbenchExtractionSystemBridge.connect(this);}
    }
    @Override public boolean onUnbind(Intent intent) { disconnect(); return super.onUnbind(intent); }
    @Override public void onDestroy() { disconnect(); super.onDestroy(); }
    private void disconnect() { AtomicWorkbenchExtractionSystemBridge.disconnect(this); generation++; connected = false; started = false; for(VisibleFocus receipt:visibleFocus.values())if(receipt.owner==this)receipt.valid=false; if(extraction!=null){extraction.close();extraction=null;} if (live == this) live = null; }

    private final class WorkbenchInputMethod extends InputMethod {
        WorkbenchInputMethod() { super(AtomicWorkbenchPasteService.this); }
        @Override public void onStartInput(EditorInfo info, boolean restarting) {
            generation++; started = false;
            super.onStartInput(info, restarting);
            if (info != null) { editorPackage = info.packageName; editorType = info.inputType; editorField = info.fieldId; started = true; }
        }
        @Override public void onFinishInput() {
            generation++; started = false; editorPackage = null;
            super.onFinishInput();
        }
    }

    private AtomicWorkbenchPasteCoordinator.Editor capture(AtomicWorkbenchPasteRequest r, AtomicWorkbenchEditorEvidence e) {
        if (!connected) throw new IllegalStateException("service_not_enabled");
        if (AtomicWorkbenchPastePolicy.password(editorType)) throw new IllegalStateException("password_editor");
        if (!e.matches(r, SystemClock.elapsedRealtime())) throw new IllegalStateException("editor_evidence_unavailable");
        if (method == null || !started || !method.getCurrentInputStarted() || !r.packageName.equals(editorPackage)
                || editorType != e.inputType || editorField != e.fieldId)
            throw new IllegalStateException("editor_not_bound");
        AccessibilityNodeInfo node = focusedNode(r, e);
        if (node == null) throw new IllegalStateException("editor_missing");
        VisibleFocus receipt=visibleFocus.get(r.id);
        if(receipt!=null&&(!receipt.valid||receipt.owner!=this||!receipt.window.matches(r,SystemClock.elapsedRealtime())||!receipt.window.sameWindow(e)
                ||!receipt.node.refresh()||!node.equals(receipt.node)))throw new IllegalStateException("editor_changed");
        InputMethod.AccessibilityInputConnection connection = method.getCurrentInputConnection();
        if (connection == null) throw new IllegalStateException("editor_connection_missing");
        return new Lease(r, e, node, connection, generation);
    }

    private AccessibilityNodeInfo focusedNode(AtomicWorkbenchPasteRequest r, AtomicWorkbenchEditorEvidence e) {
        SparseArray<List<AccessibilityWindowInfo>> displays = getWindowsOnAllDisplays();
        List<AccessibilityWindowInfo> windows = displays == null ? null : displays.get(r.displayId);
        AccessibilityNodeInfo found = null;
        if (windows == null) return null;
        for (AccessibilityWindowInfo window : windows) {
            if (window == null || window.getDisplayId() != r.displayId || window.getId() != e.accessibilityWindowId
                    || window.getType() != AccessibilityWindowInfo.TYPE_APPLICATION || !window.isFocused()) continue;
            AccessibilityNodeInfo root = window.getRoot(0);
            AccessibilityNodeInfo node = root == null ? null : root.findFocus(AccessibilityNodeInfo.FOCUS_INPUT);
            if (!usable(node, r, e)) return null;
            if (found != null && !found.equals(node)) return null;
            found = node;
        }
        return found;
    }

    private static boolean usable(AccessibilityNodeInfo node, AtomicWorkbenchPasteRequest r, AtomicWorkbenchEditorEvidence e) {
        return node != null && node.getWindowId() == e.accessibilityWindowId && node.isEditable() && node.isFocused()
                && node.isVisibleToUser() && !node.isPassword() && !AtomicWorkbenchPastePolicy.password(node.getInputType())
                && node.getPackageName() != null && r.packageName.contentEquals(node.getPackageName())
                && (node.getInputType() == 0 || node.getInputType() == e.inputType);
    }

    private static boolean emptySelectionCandidate(AccessibilityNodeInfo node) {
        if (node.getTextSelectionStart() != -1 || node.getTextSelectionEnd() != -1) return false;
        CharSequence text = node.getText();
        return node.isShowingHintText() || text == null || text.length() == 0;
    }
    private static boolean emptyOrigin(AtomicWorkbenchPastePolicy.Snapshot value) {
        return value != null && value.text.isEmpty() && value.start == 0 && value.end == 0 && value.offset == 0;
    }
    private static boolean selectionMatches(AccessibilityNodeInfo node, AtomicWorkbenchPastePolicy.Snapshot value) {
        return node.getTextSelectionStart() == value.offset + value.start && node.getTextSelectionEnd() == value.offset + value.end
                || emptyOrigin(value) && emptySelectionCandidate(node);
    }

    private final class Lease implements AtomicWorkbenchPasteCoordinator.Editor {
        final AtomicWorkbenchPasteRequest request;
        final AtomicWorkbenchEditorEvidence evidence;
        final AccessibilityNodeInfo node;
        final InputMethod.AccessibilityInputConnection connection;
        final long epoch;
        volatile boolean closed;
        private AtomicWorkbenchPastePolicy.Snapshot lastRead;
        Lease(AtomicWorkbenchPasteRequest r, AtomicWorkbenchEditorEvidence e, AccessibilityNodeInfo node,
                InputMethod.AccessibilityInputConnection connection, long epoch) {
            request = r; evidence = e; this.node = node; this.connection = connection; this.epoch = epoch;
        }
        @Override public boolean current() throws Exception { return onMain(request, this::currentOnMain); }
        private boolean currentOnMain() {
            if (closed || !connected || !started || generation != epoch || method == null
                    || !method.getCurrentInputStarted() || SystemClock.elapsedRealtime() >= request.deadlineAt
                    || !request.packageName.equals(editorPackage) || editorType != evidence.inputType || editorField != evidence.fieldId)
                return false;
            if (!node.refresh() || !usable(node, request, evidence)) return false;
            AccessibilityNodeInfo focused = focusedNode(request, evidence);
            // Node equals includes source-node identity, unlike a newly allocated IC wrapper.
            return focused != null && node.equals(focused);
        }
        @Override public AtomicWorkbenchPastePolicy.Snapshot read() throws Exception {
            if (!current()) throw new IllegalStateException("editor_changed");
            boolean emptyCandidate = onMain(request, () -> emptySelectionCandidate(node));
            boolean boundedSelection = onMain(request, () -> node.getTextSelectionStart() >= 0 && node.getTextSelectionEnd() >= 0
                    && Math.abs((long) node.getTextSelectionStart() - node.getTextSelectionEnd())
                        <= AtomicWorkbenchPastePolicy.MAX_READ - 2L * AtomicWorkbenchPastePolicy.CONTEXT);
            if (!boundedSelection && !emptyCandidate) throw new IllegalStateException("verification_unavailable");
            SurroundingText value = connection.getSurroundingText(AtomicWorkbenchPastePolicy.CONTEXT, AtomicWorkbenchPastePolicy.CONTEXT, 0);
            if (value == null || value.getText() == null || value.getText().length() > AtomicWorkbenchPastePolicy.MAX_READ
                    || !current()) throw new IllegalStateException("verification_unavailable");
            AtomicWorkbenchPastePolicy.Snapshot snapshot = new AtomicWorkbenchPastePolicy.Snapshot(value.getText().toString(),
                    value.getSelectionStart(), value.getSelectionEnd(), value.getOffset());
            // Some native empty editors expose no a11y selection. The captured connection must
            // independently prove the entire empty origin; nonempty/offset/unknown replies reject.
            if (!boundedSelection && !emptyOrigin(snapshot)) throw new IllegalStateException("verification_unavailable");
            lastRead = snapshot; return snapshot;
        }
        @Override public void commit(String text) throws Exception {
            onMain(request, () -> {
                AtomicWorkbenchPastePolicy.Snapshot observed = lastRead;
                if (!currentOnMain() || observed == null
                        || !selectionMatches(node, observed)
                        || SystemClock.elapsedRealtime() >= request.deadlineAt)
                    throw new IllegalStateException("selection_changed");
                // Captured once at acquisition. Never obtain a newer current connection here.
                connection.commitText(text, 1, null);
                return null;
            });
        }
        @Override public void close() { closed = true; lastRead = null; }
    }

    private <T> T onMain(AtomicWorkbenchPasteRequest request, Callable<T> action) throws Exception {
        long remaining = request.deadlineAt - SystemClock.elapsedRealtime();
        if (remaining <= 0) throw new IllegalStateException("deadline");
        if (Looper.myLooper() == Looper.getMainLooper()) return action.call();
        FutureTask<T> task = new FutureTask<>(() -> {
            if (SystemClock.elapsedRealtime() >= request.deadlineAt) throw new IllegalStateException("deadline");
            return action.call();
        });
        if (!main.post(task)) throw new IllegalStateException("service_unavailable");
        try { return task.get(Math.min(remaining, 2000), TimeUnit.MILLISECONDS); }
        finally { if (!task.isDone()) task.cancel(false); }
    }
}
