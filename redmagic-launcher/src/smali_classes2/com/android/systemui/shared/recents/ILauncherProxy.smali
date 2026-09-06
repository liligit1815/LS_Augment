.class public interface abstract Lcom/android/systemui/shared/recents/ILauncherProxy;
.super Ljava/lang/Object;
.source "ILauncherProxy.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/shared/recents/ILauncherProxy$_Parcel;,
        Lcom/android/systemui/shared/recents/ILauncherProxy$Stub;,
        Lcom/android/systemui/shared/recents/ILauncherProxy$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.android.systemui.shared.recents.ILauncherProxy"


# virtual methods
.method public abstract appTransitionPending(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract checkNavBarModes(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract disable(IIIZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract enterStageSplitFromRunningApp(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract finishBarAnimations(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onActiveNavBarRegionChanges(Landroid/graphics/Region;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantAvailable(ZZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantOverrideInvoked(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAssistantVisibilityChanged(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onDisplayAddSystemDecorations(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onDisplayRemoveSystemDecorations(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onDisplayRemoved(I)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onInitialize(Landroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onNavButtonsDarkIntensityChanged(F)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onNavigationBarLumaSamplingEnabled(IZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onNotificationEventUp()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onOverviewHidden(ZZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onOverviewShown(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onOverviewToggle()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onRotationProposal(IZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onStatusBarVisibleChanged(Z)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSystemBarAttributesChanged(II)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSystemUiStateChanged(JI)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onTaskbarToggled()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onTransitionModeUpdated(IZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onUnbind(Landroid/os/IRemoteCallback;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract touchAutoDim(IZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract transitionTo(IIZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract updateWallpaperVisibility(IZ)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
