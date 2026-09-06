.class public Lcom/android/quickstep/utils/DefalutInterceptKeyEventHelper;
.super Ljava/lang/Object;
.source "DefalutInterceptKeyEventHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public sendBackKeyEvent(Landroid/content/Context;)V
    .locals 0

    .line 1
    const-string p0, "context"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInterceptKeyEventEnabled(ZLandroid/window/IRemoteTransitionInputCallback;)V
    .locals 0

    .line 3
    const-string p0, "inputCallback"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public setInterceptKeyEventEnabled(ZLcom/android/wm/shell/recents/d;Landroid/window/IRemoteTransitionInputCallback;)V
    .locals 0

    .line 1
    const-string p0, "runner"

    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    const-string p0, "inputCallback"

    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
