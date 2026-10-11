package com.android.systemui.statusbar.notification.stack;
import android.content.Context;
import android.widget.ScrollView;

/** Native lifecycle/ambient transport for registered-hook tests. Framework scroll is real.
 * Top-padding transport follows the captured OEM setter: truncate to an int,
 * call onTopPaddingChanged only when that int changes, and merge the pending
 * animation flag even when updateTopPadding receives animated=false. This does
 * not execute the OEM StackStateAnimator or pretend to render notification rows. */
public class NotificationStackScrollLayout extends ScrollView {
    public static class Ambient {public int mStatusBarState;public boolean mDozing,mShowingStackOnLockscreen,mShadeExpanded=true;public float mTopPadding=100;}
    public final Ambient mAmbientState=new Ambient();public int mOwnScrollY;public boolean mLaunchingNotification;
    public Object mFooterView;public android.graphics.Rect mRequestedClipBounds;
    public boolean mKeyguardBypassEnabled,mAnimateNextTopPaddingChange,mTopPaddingNeedsAnimation,mNeedsAnimation;
    public boolean mAnimationsEnabled=true,mIsExpanded=true,mShouldUseSplitNotificationShade,mShouldSkipTopPaddingAnimationAfterFold;
    // Independent notification-add work is deliberately not part of top-padding ownership.
    public boolean mAddAnimationPending;
    public int childrenUpdateRequests,acceptedChildrenUpdates,expandedHeightUpdates;
    public boolean mChildrenUpdateRequested;
    public android.view.View firstCard;
    public ls.augment.com.hook.AugmentModule testModule;
    public boolean inlineTopPaddingChanged;
    public final java.util.ArrayList<Integer> cardTargets=new java.util.ArrayList<>();
    private int previousTopPadding;
    public final java.util.ArrayList<PaddingChange> paddingChanges=new java.util.ArrayList<>();
    public static final class PaddingChange {
        public final int from,to;public final boolean requestedAnimated,pendingAnimated,startedTopAnimation;
        PaddingChange(int from,int to,boolean requested,boolean pending,boolean started){this.from=from;this.to=to;requestedAnimated=requested;pendingAnimated=pending;startedTopAnimation=started;}
        @Override public String toString(){return from+"->"+to+"(explicit="+requestedAnimated+",pending="+pendingAnimated+",topAnimation="+startedTopAnimation+")";}
    }
    public NotificationStackScrollLayout(Context context){super(context);}
    public void updateTopPadding(float value,boolean animated){
        if(routeHook("updateTopPadding",value,animated))return;
        int padding=(int)value,previous=(int)mAmbientState.mTopPadding;
        if(padding!=previous){
            mAmbientState.mTopPadding=padding;
            previousTopPadding=previous;
            if(inlineTopPaddingChanged)nativeTopPaddingChanged(animated&&!mKeyguardBypassEnabled);
            else onTopPaddingChanged(animated&&!mKeyguardBypassEnabled);
        }
        expandedHeightUpdates++;
    }
    public void onTopPaddingChanged(boolean requested){
        if(routeHook("onTopPaddingChanged",requested))return;
        nativeTopPaddingChanged(requested);
    }
    private void nativeTopPaddingChanged(boolean requested){
        boolean pending=mAnimateNextTopPaddingChange,animate=requested||pending,started=false;
        if(mAmbientState.mStatusBarState==1&&!mShouldUseSplitNotificationShade&&mShouldSkipTopPaddingAnimationAfterFold)mShouldSkipTopPaddingAnimationAfterFold=false;
        else if(animate&&mAnimationsEnabled&&mIsExpanded){mTopPaddingNeedsAnimation=true;mNeedsAnimation=true;started=true;}
        requestChildrenUpdate();
        paddingChanges.add(new PaddingChange(previousTopPadding,(int)mAmbientState.mTopPadding,requested,pending,started));
        mAnimateNextTopPaddingChange=false;
    }
    private boolean routeHook(String name,Object...args){
        try{if(testModule==null||testModule.isOriginal(this,name,args.length))return false;testModule.invoke(this,name,args);return true;}
        catch(Exception error){throw new AssertionError(name,error);}
    }
    public final android.view.ViewTreeObserver.OnPreDrawListener mChildrenUpdater=new android.view.ViewTreeObserver.OnPreDrawListener(){@Override public boolean onPreDraw(){
        // Captured NSSL$1 keeps the request flag set until both the original
        // updateChildren and its registered hooks have finished.
        updateChildren();mChildrenUpdateRequested=false;
        getViewTreeObserver().removeOnPreDrawListener(this);return true;
    }};
    public void requestChildrenUpdate(){
        childrenUpdateRequests++;
        if(!mChildrenUpdateRequested){getViewTreeObserver().addOnPreDrawListener(mChildrenUpdater);mChildrenUpdateRequested=true;acceptedChildrenUpdates++;invalidate();}
    }
    public void updateChildren(){
        if(routeHook("updateChildren"))return;
        int target=(int)mAmbientState.mTopPadding;cardTargets.add(target);
        if(firstCard!=null)firstCard.setTranslationY(target);
    }
    public void dispatchChildrenPreDraw(){if(mChildrenUpdateRequested)mChildrenUpdater.onPreDraw();}
    public void addNotificationAnimation(){mAddAnimationPending=true;mNeedsAnimation=true;requestChildrenUpdate();}
    public void consumeAnimationFrame(){mTopPaddingNeedsAnimation=false;mNeedsAnimation=mAddAnimationPending;}
    public void clearPaddingChanges(){paddingChanges.clear();}
    public long topAnimationCount(){return paddingChanges.stream().filter(change->change.startedTopAnimation).count();}
    public void updateClipping(){setClipBounds(mRequestedClipBounds);}
    @Override public void onDetachedFromWindow(){super.onDetachedFromWindow();}
}
