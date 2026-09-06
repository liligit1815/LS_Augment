.class public final enum Lcom/android/quickstep/util/QuickstepProtoLogGroup;
.super Ljava/lang/Enum;
.source "QuickstepProtoLogGroup.java"

# interfaces
.implements Lcom/android/internal/protolog/common/IProtoLogGroup;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/QuickstepProtoLogGroup$Variables;,
        Lcom/android/quickstep/util/QuickstepProtoLogGroup$Constants;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/quickstep/util/QuickstepProtoLogGroup;",
        ">;",
        "Lcom/android/internal/protolog/common/IProtoLogGroup;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/quickstep/util/QuickstepProtoLogGroup;

.field public static final enum ACTIVE_GESTURE_LOG:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

.field public static final enum LAUNCHER_STATE_MANAGER:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

.field public static final enum RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;


# instance fields
.field private final mEnabled:Z

.field private volatile mLogToLogcat:Z

.field private volatile mLogToProto:Z

.field private final mTag:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/android/quickstep/util/QuickstepProtoLogGroup;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->ACTIVE_GESTURE_LOG:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 4
    .line 5
    sget-object v2, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->LAUNCHER_STATE_MANAGER:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const-string v6, "ActiveGestureLog"

    .line 5
    .line 6
    const-string v1, "ACTIVE_GESTURE_LOG"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x1

    .line 11
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;-><init>(Ljava/lang/String;IZZZLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->ACTIVE_GESTURE_LOG:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    const-string v7, "RecentsWindow"

    .line 20
    .line 21
    const-string v2, "RECENTS_WINDOW"

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;-><init>(Ljava/lang/String;IZZZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v1, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->RECENTS_WINDOW:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 28
    .line 29
    new-instance v2, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 30
    .line 31
    const/4 v7, 0x1

    .line 32
    const-string v8, "LauncherStateManager"

    .line 33
    .line 34
    const-string v3, "LAUNCHER_STATE_MANAGER"

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    const/4 v6, 0x1

    .line 38
    invoke-direct/range {v2 .. v8}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;-><init>(Ljava/lang/String;IZZZLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v2, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->LAUNCHER_STATE_MANAGER:Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 42
    .line 43
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->$values()[Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->$VALUES:[Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 48
    .line 49
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mEnabled:Z

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToProto:Z

    .line 7
    .line 8
    iput-boolean p5, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToLogcat:Z

    .line 9
    .line 10
    iput-object p6, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mTag:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static initProtoLog()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Variables;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "QuickstepProtoLogGroup"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "Attempting to re-initialize ProtoLog."

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string v0, "Initializing ProtoLog."

    .line 21
    .line 22
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {v0}, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Variables;->b(Z)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->values()[Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/android/internal/protolog/ProtoLog;->init([Lcom/android/internal/protolog/common/IProtoLogGroup;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static isProtoLogInitialized()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Variables;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "QuickstepProtoLogGroup"

    .line 13
    .line 14
    const-string v2, "Attempting to log to ProtoLog before initializing it."

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Variables;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/quickstep/util/QuickstepProtoLogGroup;
    .locals 1

    .line 1
    const-class v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/android/quickstep/util/QuickstepProtoLogGroup;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->$VALUES:[Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/android/quickstep/util/QuickstepProtoLogGroup;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/android/quickstep/util/QuickstepProtoLogGroup;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getId()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/QuickstepProtoLogGroup$Constants;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mTag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLogToAny()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToLogcat:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToProto:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public isLogToLogcat()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToLogcat:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLogToProto()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToProto:Z

    .line 2
    .line 3
    return p0
.end method

.method public setLogToLogcat(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToLogcat:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLogToProto(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/QuickstepProtoLogGroup;->mLogToProto:Z

    .line 2
    .line 3
    return-void
.end method
