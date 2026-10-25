package ls.augment.com;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.ScrollView;
import java.util.ArrayList;

/** Native slider, with one explicit edit transaction for the shared numeric dialog. */
// Code-only control created by UiKit; no XML inflation.
//noinspection ViewConstructor
final class ParameterSeekBar extends SeekBar {
    private OnSeekBarChangeListener listener;
    private boolean settingExactValue;
    private Runnable editorStateChanged;
    private final ArrayList<SliderTouchDelegate> touchDelegates=new ArrayList<>();

    ParameterSeekBar(Context context) {
        super(context);
        super.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            public void onStartTrackingTouch(SeekBar bar) { if (listener != null) listener.onStartTrackingTouch(bar); }
            public void onStopTrackingTouch(SeekBar bar) { if (listener != null) listener.onStopTrackingTouch(bar); }
            public void onProgressChanged(SeekBar bar, int progress, boolean user) {
                if (!settingExactValue && listener != null) listener.onProgressChanged(bar, progress, user);
            }
        });
    }
    @Override public void setOnSeekBarChangeListener(OnSeekBarChangeListener listener) { this.listener = listener; }
    @Override public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        if (editorStateChanged != null) editorStateChanged.run();
    }
    void observeEditorState(Runnable changed) { editorStateChanged = changed; changed.run(); }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        // An inner numeric row may end directly below the track. Register its
        // enclosing groups too, so their empty padding remains usable.
        for(android.view.ViewParent parent=getParent();parent instanceof ViewGroup&&!(parent instanceof ScrollView);parent=parent.getParent()){
            ViewGroup group=(ViewGroup)parent;
            // Tighten only plain slider parameter rows; folding boundaries and
            // non-slider editors keep their own spacing.
            if(Boolean.TRUE.equals(group.getTag(R.id.parameter_input_group))&&group.getBackground()==null)
                group.setPadding(group.getPaddingLeft(),group.getPaddingTop(),group.getPaddingRight(),Math.round(4*getResources().getDisplayMetrics().density));
            touchDelegates.add(SliderTouchDelegate.attach(group,this));
        }
    }
    @Override protected void onDetachedFromWindow() {
        for(SliderTouchDelegate delegate:touchDelegates)delegate.remove(this);touchDelegates.clear();
        super.onDetachedFromWindow();
    }
    /** Candidate region; existing title/help targets keep priority in shared space. */
    Rect expandedTouchBounds() {
        return expandedTouchBounds((ViewGroup)getParent());
    }
    Rect expandedTouchBounds(ViewGroup owner) {
        Rect bounds=nativeBounds(owner);
        int extra=Math.max(0,Math.round(48*getResources().getDisplayMetrics().density)-bounds.height());
        bounds.top-=extra/2;bounds.bottom+=extra-extra/2;return bounds;
    }
    Rect nativeBounds(ViewGroup owner){Rect bounds=new Rect(0,0,getWidth(),getHeight());owner.offsetDescendantRectToMyCoords(this,bounds);return bounds;}

    void commitExactProgress(int progress) {
        if (!isEnabled() || progress < getMin() || progress > getMax()) return;
        OnSeekBarChangeListener current = listener;
        if (current == null) return;
        // Keep both continuous and release-only consumers on their existing validation/save path.
        current.onStartTrackingTouch(this);
        try {
            settingExactValue = true;
            try { setProgress(progress); } finally { settingExactValue = false; }
            current.onProgressChanged(this, getProgress(), true);
        } finally { current.onStopTrackingTouch(this); }
    }
}
