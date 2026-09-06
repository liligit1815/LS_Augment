.class public Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;
.super Ljava/lang/Object;
.source "RecentsWindowProtoLogProxy.java"


# static fields
.field private static final ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/A0;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/util/A0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-direct {v0, v1, v2}, Landroid/window/DesktopModeFlags$DesktopModeFlag;-><init>(Ljava/util/function/BooleanSupplier;Z)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static logCleanup(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->isProtoLogInitialized()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v1, "Cleaning up recents window: isShow= %b"

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Lcom/android/internal/protolog/ProtoLog;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public static logOnStateSetEnd(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->isProtoLogInitialized()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 17
    .line 18
    const-string v1, "onStateSetEnd: %s"

    .line 19
    .line 20
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, v1, p0}, Lcom/android/internal/protolog/ProtoLog;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public static logOnStateSetStart(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->isProtoLogInitialized()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 17
    .line 18
    const-string v1, "onStateSetStart: %s"

    .line 19
    .line 20
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {v0, v1, p0}, Lcom/android/internal/protolog/ProtoLog;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public static logStartRecentsWindow(ZZ)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/RecentsWindowProtoLogProxy;->ENABLE_RECENTS_WINDOW_PROTO_LOG:Landroid/window/DesktopModeFlags$DesktopModeFlag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags$DesktopModeFlag;->isTrue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->isProtoLogInitialized()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "Starting recents window: isShow= %b, windowViewIsNull=%b"

    .line 31
    .line 32
    invoke-static {v0, p1, p0}, Lcom/android/internal/protolog/ProtoLog;->d(Lcom/android/internal/protolog/common/IProtoLogGroup;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method
