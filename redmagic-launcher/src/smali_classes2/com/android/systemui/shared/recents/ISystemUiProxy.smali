.class public interface abstract Lcom/android/systemui/shared/recents/ISystemUiProxy;
.super Ljava/lang/Object;
.source "ISystemUiProxy.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/recents/ISystemUiProxy$_Parcel;,
        Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub;,
        Lcom/android/systemui/shared/recents/ISystemUiProxy$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.android.systemui.shared.recents.ISystemUiProxy"


# virtual methods
.method public abstract animateNavBarLongPress(ZZJ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract expandNotificationPanel()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyAccessibilityButtonClicked(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyAccessibilityButtonLongClicked()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyGestureCourseIndentifiedCompleted(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyHomeGestureAnimationFinished()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyHomeGestureSuccess()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyInjectAllEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/MotionEvent;",
            "Landroid/view/MotionEvent;",
            "Ljava/util/List<",
            "Landroid/view/MotionEvent;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyInjectEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyKeyEvent(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyPrioritizedRotation(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyTaskbarAutohideSuspend(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract notifyTaskbarStatus(ZZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantGestureCompletion(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantGestureStart(FF)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantProgress(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onBackEvent(Landroid/view/KeyEvent;I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onGestureCourseIndentifiedCompleted(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onGestureCourseProgress(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onImeSwitcherLongPress()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onImeSwitcherPressed()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onKeyEvent(II)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onLauncherDestroy()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onOverviewShown(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onStatusBarTouchEvent(Landroid/view/MotionEvent;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onStatusBarTrackpadEvent(Landroid/view/MotionEvent;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setAssistantOverridesRequested([I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setHomeRotationEnabled(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract setOverrideHomeButtonLongPress(JFZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract startAssistant(Landroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract startScreenPinning(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract stopScreenPinning()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract takeScreenshot(Lcom/android/internal/util/ScreenshotRequest;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract toggleNotificationPanel()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract toggleQuickSettingsPanel()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract updateContextualEduStats(ZLjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
