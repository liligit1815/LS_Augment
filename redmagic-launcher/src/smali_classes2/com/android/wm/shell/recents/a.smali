.class public interface abstract Lcom/android/wm/shell/recents/a;
.super Ljava/lang/Object;
.source "IRecentTasks.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wm/shell/recents/a$a;
    }
.end annotation


# virtual methods
.method public abstract K(Lcom/android/wm/shell/recents/b;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract P(Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/os/Bundle;Landroid/app/IApplicationThread;Lcom/android/wm/shell/recents/d;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract c2(I)[Landroid/app/ActivityManager$RunningTaskInfo;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getRecentTasks(III)[Lcom/android/wm/shell/shared/i;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract o(Lcom/android/wm/shell/recents/b;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
