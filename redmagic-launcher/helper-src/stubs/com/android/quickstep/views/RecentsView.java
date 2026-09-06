package com.android.quickstep.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.OverScroller;

import com.android.quickstep.orientation.RecentsPagedOrientationHandler;

public abstract class RecentsView extends ViewGroup {
    protected RecentsView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public abstract int getScrollForPage(int page);
    public abstract int getCurrentPage();
    public abstract int getNextPage();
    public abstract boolean isHandlingTouch();
    public abstract boolean isPageInTransition();
    public abstract OverScroller getScroller();
    public abstract void setCurrentPage(int page);
    public abstract void updateScrollSynchronously();
    public abstract int getRunningTaskIndex();
    public abstract boolean isRecentsAnimationRunning();
    public abstract RecentsPagedOrientationHandler getPagedOrientationHandler();
    public abstract TaskView getCurrentPageTaskView();
    public abstract int getTaskViewCount();
    public abstract TaskView getTaskViewAt(int index);
    public abstract TaskView getTaskViewByTaskId(int taskId);
    public abstract boolean isTaskViewVisible(TaskView taskView);
    public abstract boolean isNativeStackStyle();
    public abstract boolean isNativeStackApplied();
    public abstract void setNativeStackApplied(boolean applied);
    public abstract boolean isNativeStackEntryPending();
    public abstract void setNativeStackEntryPending(boolean pending);
    public abstract void setNativeStackOverviewPage(int page);
}
