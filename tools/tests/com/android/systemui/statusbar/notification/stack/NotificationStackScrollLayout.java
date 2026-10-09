package com.android.systemui.statusbar.notification.stack;
import android.content.Context;
import android.widget.ScrollView;

/** Only the native lifecycle/ambient transport for registered-hook tests. Framework scroll is real. */
public class NotificationStackScrollLayout extends ScrollView {
    public static class Ambient {public int mStatusBarState;public boolean mDozing,mShowingStackOnLockscreen,mShadeExpanded=true;public float mTopPadding=100;}
    public final Ambient mAmbientState=new Ambient();public int mOwnScrollY;public boolean mLaunchingNotification;
    public Object mFooterView;public android.graphics.Rect mRequestedClipBounds;
    public NotificationStackScrollLayout(Context context){super(context);}
    public void updateTopPadding(float value,boolean animated){mAmbientState.mTopPadding=value;}
    public void updateClipping(){setClipBounds(mRequestedClipBounds);}
    @Override public void onDetachedFromWindow(){super.onDetachedFromWindow();}
}
