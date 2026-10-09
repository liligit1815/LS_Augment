package com.android.systemui.shade;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;

/** ROM setters transcribed from this device's smali; the solver and View tree are real AndroidX. */
public final class NotificationsQuickSettingsContainer extends ConstraintLayout {
    public View mStackScroller;
    public int marginCalls,rejectMode;
    public ls.augment.com.hook.AugmentModule hookModule;
    public NotificationsQuickSettingsContainer(Context context){super(context);setClipChildren(false);}
    public void setNotificationsMarginBottom(int value){
        if(hookModule!=null)try{if(!hookModule.isOriginal(this,"setNotificationsMarginBottom",1)){hookModule.invoke(this,"setNotificationsMarginBottom",value);return;}}catch(Exception error){throw new RuntimeException(error);}
        marginCalls++;if(rejectMode==1)throw new IllegalStateException("fixture native setter rejected");if(rejectMode==2)return;
        ViewGroup.MarginLayoutParams lp=(ViewGroup.MarginLayoutParams)mStackScroller.getLayoutParams();
        lp.bottomMargin=value;mStackScroller.setLayoutParams(lp);
    }
    public void applyConstraints(ConstraintSet set){
        if(hookModule!=null)try{if(!hookModule.isOriginal(this,"applyConstraints",1)){hookModule.invoke(this,"applyConstraints",set);return;}}catch(Exception error){throw new RuntimeException(error);}
        set.applyTo(this);
    }
}
