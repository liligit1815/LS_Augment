package ls.augment.com.step;

import java.util.ArrayList;

/** Every submitted surface must acknowledge before input or recovery ownership is released. */
public final class CommitBarrier {
    private final ArrayList<Boolean> commits = new ArrayList<>();
    private boolean sealed, cancelled;
    private Runnable readyListener;
    public synchronized int add() {
        if (sealed || cancelled) throw new IllegalStateException("commit group closed");
        commits.add(false); return commits.size()-1;
    }
    public void commit(int index) {
        Runnable notify;
        synchronized(this){
            if (!cancelled && index >= 0 && index < commits.size()) commits.set(index, true);
            notify=takeReadyListener();
        }
        if(notify!=null)notify.run();
    }
    public void seal() {
        Runnable notify;
        synchronized(this){sealed=true;notify=takeReadyListener();}
        if(notify!=null)notify.run();
    }
    public void whenReady(Runnable listener){
        Runnable notify;
        synchronized(this){if(cancelled)return;readyListener=listener;notify=takeReadyListener();}
        if(notify!=null)notify.run();
    }
    private Runnable takeReadyListener(){
        if(!ready())return null;
        Runnable result=readyListener;readyListener=null;return result;
    }
    public synchronized void cancel() { cancelled = true; readyListener=null; }
    public synchronized boolean ready() { return sealed && !cancelled && !commits.contains(false); }
    public synchronized String snapshot() { return "sealed="+sealed+";cancelled="+cancelled+";commits="+commits; }
}
