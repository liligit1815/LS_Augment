package ls.augment.com;

import android.accessibilityservice.AccessibilityService;
import android.graphics.Rect;
import android.os.Build;
import android.os.SystemClock;
import android.util.SparseArray;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Reads only the proved application window; events update identities without fetching event text. */
final class AtomicWorkbenchExtractionAccessibilitySource {
    interface Gate { void checkpoint() throws Failure; }
    static final class Failure extends Exception {
        final AtomicWorkbenchExtractionResult.State state;
        Failure(AtomicWorkbenchExtractionResult.State state) { super(state.name());this.state=state; }
    }
    static final class Read {
        final AtomicWorkbenchExtractionNodePolicy.Candidate candidate;
        final int window;
        final long lifecycle,epoch;
        Read(AtomicWorkbenchExtractionNodePolicy.Candidate c,int w,long life,long epoch) { candidate=c;window=w;lifecycle=life;this.epoch=epoch; }
    }
    private static final class Pending {
        final AccessibilityNodeInfo node;
        final int depth;
        final boolean web;
        Pending(AccessibilityNodeInfo n,int depth,boolean web){node=n;this.depth=depth;this.web=web;}
    }
    private static final class Entry {
        final AccessibilityNodeInfo node;
        final AtomicWorkbenchExtractionNodePolicy.Metadata metadata;
        Entry(AccessibilityNodeInfo n,AtomicWorkbenchExtractionNodePolicy.Metadata m){node=n;metadata=m;}
    }
    private final AccessibilityService service;
    private final Map<Integer,Long> epochs=new HashMap<>();
    private long lifecycle;
    private boolean connected;
    AtomicWorkbenchExtractionAccessibilitySource(AccessibilityService service) { if(service==null)throw new IllegalArgumentException("missing_extraction_service");this.service=service; }
    synchronized void connect() { lifecycle++;connected=true;epochs.clear(); }
    synchronized void disconnect() { lifecycle++;connected=false;epochs.clear(); }
    synchronized void interrupted() { lifecycle++;epochs.clear(); }
    synchronized void event(int type,int window) {
        int relevant=AccessibilityEvent.TYPE_WINDOWS_CHANGED|AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED|AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
                |AccessibilityEvent.TYPE_VIEW_SCROLLED|AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED|AccessibilityEvent.TYPE_VIEW_TEXT_SELECTION_CHANGED;
        if((type&relevant)==0)return;
        if(window<0){lifecycle++;epochs.clear();return;}
        if(epochs.size()>=256&&!epochs.containsKey(window)){lifecycle++;epochs.clear();}
        epochs.put(window,epoch(window)+1);
    }
    private long epoch(int window) { Long value=epochs.get(window);return value==null?0:value; }
    synchronized boolean current(Read read) { return connected&&read!=null&&read.lifecycle==lifecycle&&read.epoch==epoch(read.window); }
    private synchronized void check(long life,int window,long epoch) throws Failure {
        if(!connected)throw new Failure(AtomicWorkbenchExtractionResult.State.UNAVAILABLE);
        if(life!=lifecycle||epoch!=epoch(window))throw new Failure(AtomicWorkbenchExtractionResult.State.STALE);
    }

    Read read(AtomicWorkbenchExtractionAuthority.Proof proof,Gate gate) throws Failure {
        final long life,epoch;
        synchronized(this){if(!connected)throw new Failure(AtomicWorkbenchExtractionResult.State.UNAVAILABLE);life=lifecycle;epoch=epoch(proof.accessibilityWindowId);}
        List<AccessibilityWindowInfo> ownedWindows=new ArrayList<>();
        IdentityHashMap<AccessibilityNodeInfo,Boolean> nodes=new IdentityHashMap<>();
        try {
            gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
            SparseArray<List<AccessibilityWindowInfo>> displays=service.getWindowsOnAllDisplays();
            AccessibilityWindowInfo exact=null;
            if(displays!=null)for(int d=0;d<displays.size();d++){
                List<AccessibilityWindowInfo> windows=displays.valueAt(d);if(windows==null)continue;
                for(AccessibilityWindowInfo w:windows){
                    if(w==null)continue;ownedWindows.add(w);
                    if(displays.keyAt(d)==proof.displayId&&w.getDisplayId()==proof.displayId&&w.getId()==proof.accessibilityWindowId&&w.getType()==AccessibilityWindowInfo.TYPE_APPLICATION){
                        if(exact!=null)throw new Failure(AtomicWorkbenchExtractionResult.State.STALE);exact=w;
                    }
                }
            }
            if(exact==null)throw new Failure(AtomicWorkbenchExtractionResult.State.NO_NODE);
            gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
            AccessibilityNodeInfo root=exact.getRoot(0);
            if(root==null)throw new Failure(AtomicWorkbenchExtractionResult.State.NO_NODE);
            nodes.put(root,Boolean.TRUE);
            ArrayDeque<Pending> stack=new ArrayDeque<>();stack.push(new Pending(root,0,false));
            ArrayList<Entry> candidates=new ArrayList<>();
            int visited=0;long started=SystemClock.elapsedRealtime();
            // First collect only metadata. A password/sensitive hit must reject before any getText.
            while(!stack.isEmpty()){
                gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
                if(++visited>AtomicWorkbenchExtractionPolicy.MAX_NODES||SystemClock.elapsedRealtime()-started>AtomicWorkbenchExtractionPolicy.NODE_BUDGET_MS)
                    throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                Pending next=stack.pop();AccessibilityNodeInfo node=next.node;
                if(next.depth>AtomicWorkbenchExtractionPolicy.MAX_DEPTH)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                Rect bounds=new Rect();node.getBoundsInScreen(bounds);
                CharSequence packageValue=node.getPackageName();String pkg=packageValue==null?null:packageValue.toString();
                if(node.getWindowId()!=proof.accessibilityWindowId||!proof.packageName.equals(pkg))throw new Failure(AtomicWorkbenchExtractionResult.State.STALE);
                if(!node.isVisibleToUser()||!bounds.contains((int)Math.floor(proof.pointX),(int)Math.floor(proof.pointY)))continue;
                String cls=node.getClassName()==null?"":node.getClassName().toString();boolean web=next.web||"android.webkit.WebView".equals(cls);
                int children=node.getChildCount();if(children<0||children>AtomicWorkbenchExtractionPolicy.MAX_NODES)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                var m=new AtomicWorkbenchExtractionNodePolicy.Metadata(pkg,cls,node.getWindowId(),bounds.left,bounds.top,bounds.right,bounds.bottom,
                        next.depth,visited,node.getInputType(),children,true,node.isPassword(),node.isAccessibilityDataSensitive(),node.isEditable(),web);
                if(m.protectedNode())throw new Failure(AtomicWorkbenchExtractionResult.State.PROTECTED);
                if(m.textualContainer())candidates.add(new Entry(node,m));
                if(next.depth==AtomicWorkbenchExtractionPolicy.MAX_DEPTH&&children>0)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                for(int child=children-1;child>=0;child--){
                    gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
                    if(nodes.size()>=AtomicWorkbenchExtractionPolicy.MAX_NODES)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                    AccessibilityNodeInfo value=node.getChild(child);if(value==null)continue;
                    if(nodes.put(value,Boolean.TRUE)!=null)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                    stack.push(new Pending(value,next.depth+1,web));
                }
            }
            AtomicWorkbenchExtractionNodePolicy.Candidate selected=null;int total=0;
            for(Entry entry:candidates){
                gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
                if(SystemClock.elapsedRealtime()-started>AtomicWorkbenchExtractionPolicy.NODE_BUDGET_MS)throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                AccessibilityNodeInfo node=entry.node;
                if(!node.refresh()||node.getWindowId()!=proof.accessibilityWindowId||node.getPackageName()==null||!proof.packageName.contentEquals(node.getPackageName()))
                    throw new Failure(AtomicWorkbenchExtractionResult.State.STALE);
                if(node.isPassword()||AtomicWorkbenchExtractionPolicy.password(node.getInputType())||node.isAccessibilityDataSensitive())
                    throw new Failure(AtomicWorkbenchExtractionResult.State.PROTECTED);
                Rect fresh=new Rect();node.getBoundsInScreen(fresh);
                var m=entry.metadata;
                if(!node.isVisibleToUser()||fresh.left!=m.left||fresh.top!=m.top||fresh.right!=m.right||fresh.bottom!=m.bottom)
                    throw new Failure(AtomicWorkbenchExtractionResult.State.STALE);
                CharSequence raw=node.getText();AtomicWorkbenchExtractionResult.Kind kind=AtomicWorkbenchExtractionResult.Kind.NODE_TEXT;
                if(raw!=null&&raw.length()>AtomicWorkbenchExtractionPolicy.MAX_TEXT)throw new Failure(AtomicWorkbenchExtractionResult.State.TOO_LARGE);
                if(raw==null||raw.toString().isBlank()){raw=node.getContentDescription();kind=AtomicWorkbenchExtractionResult.Kind.NODE_DESCRIPTION;}
                if(raw==null)continue;
                if(raw.length()>AtomicWorkbenchExtractionPolicy.MAX_TEXT)throw new Failure(AtomicWorkbenchExtractionResult.State.TOO_LARGE);
                if(total>AtomicWorkbenchExtractionPolicy.MAX_TREE_TEXT-raw.length())throw new Failure(AtomicWorkbenchExtractionResult.State.TRAVERSAL_LIMIT);
                total+=raw.length();String text=raw.toString();if(text.isBlank())continue;
                selected=AtomicWorkbenchExtractionNodePolicy.select(selected,new AtomicWorkbenchExtractionNodePolicy.Candidate(m,kind,text));
            }
            gate.checkpoint();check(life,proof.accessibilityWindowId,epoch);
            if(selected==null)throw new Failure(AtomicWorkbenchExtractionResult.State.NO_NODE);
            return new Read(selected,proof.accessibilityWindowId,life,epoch);
        } catch(Failure known){throw known;}
        catch(RuntimeException unavailable){throw new Failure(AtomicWorkbenchExtractionResult.State.UNAVAILABLE);}
        finally {
            for(AccessibilityNodeInfo node:nodes.keySet())try{node.recycle();}catch(RuntimeException ignored){}
            IdentityHashMap<AccessibilityWindowInfo,Boolean> released=new IdentityHashMap<>();
            for(AccessibilityWindowInfo w:ownedWindows)if(released.put(w,Boolean.TRUE)==null)try{w.recycle();}catch(RuntimeException ignored){}
        }
    }
}
