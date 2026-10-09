package com.zte.controlcenter.view;
/** Native owner contract taken from the extracted ROM; Android layout classes are real. */
public final class ControlCenterPanelView extends android.widget.FrameLayout {
    public android.view.View ccHeaderView;
    public int nativeHeight=360,nativeWidth=988,calls;
    public ControlCenterPanelView(android.content.Context context){super(context);}
    public void checkTopPanel(){calls++;ccHeaderView.getLayoutParams().height=nativeHeight;ccHeaderView.requestLayout();}
    public void updateResources(){calls++;ccHeaderView.getLayoutParams().height=nativeHeight;ccHeaderView.getLayoutParams().width=nativeWidth;ccHeaderView.requestLayout();}
}
