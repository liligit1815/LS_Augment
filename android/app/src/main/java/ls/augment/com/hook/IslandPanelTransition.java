package ls.augment.com.hook;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/** One owned panel transition at a time; finish callbacks run before a scene can be removed. */
final class IslandPanelTransition {
    private Animator animation;
    private Object island;
    private boolean closing;

    boolean prepareClose(Object target) {
        if (animation != null && island == target && closing) return false;
        finish();
        return true;
    }
    void track(Object target,Animator next,boolean close) {
        finish();
        island=target;animation=next;closing=close;
        next.addListener(new AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(Animator ended) {
                ended.removeListener(this);
                if (animation==ended) { animation=null;island=null;closing=false; }
            }
        });
    }
    void finish() {
        Animator pending=animation;
        if (pending!=null) pending.end();
    }
}
