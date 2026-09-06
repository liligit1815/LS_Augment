.class public interface abstract Lcom/android/quickstep/RemoteRunnable;
.super Ljava/lang/Object;
.source "RemoteRunnable.java"


# annotations
.annotation runtime Ljava/lang/FunctionalInterface;
.end annotation


# direct methods
.method public static executeSafely(Lcom/android/quickstep/RemoteRunnable;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-interface {p0}, Lcom/android/quickstep/RemoteRunnable;->run()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    const-string v0, "RemoteRunnable"

    .line 7
    .line 8
    const-string v1, "Error calling remote method"

    .line 9
    .line 10
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public abstract run()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
