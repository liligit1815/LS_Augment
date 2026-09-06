.class public Lcom/android/launcher3/aitools/ArrangeLauncherScreenExecutor;
.super Lcom/zte/toolsdk/producer/ToolsExecutor;
.source "ArrangeLauncherScreenExecutor.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "ArrangeLauncherScreenExecutor"


# instance fields
.field private mLauncher:Lcom/android/launcher3/C2;

.field private mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public execute(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "execute, json = "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string p2, "ArrangeLauncherScreenExecutor"

    .line 19
    .line 20
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/android/launcher3/aitools/ArrangeLauncherScreenExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/android/launcher3/aitools/ToolsUtils;->jumpToLauncherSettins(Landroid/content/Context;)Z

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/android/launcher3/aitools/ArrangeLauncherScreenExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    const v0, 0x7f140069

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/android/launcher3/aitools/ArrangeLauncherScreenExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    const v0, 0x7f1403cf

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p3, p0, Lcom/android/launcher3/aitools/ArrangeLauncherScreenExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 66
    .line 67
    const-string p0, ""

    .line 68
    .line 69
    const/4 p2, 0x1

    .line 70
    invoke-interface {p3, p0, p1, p2}, Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;->onResult(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public initView()Z
    .locals 1

    .line 1
    const-string p0, "ArrangeLauncherScreenExecutor"

    .line 2
    .line 3
    const-string v0, "initView()"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public update(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "update, viewId = "

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "ArrangeLauncherScreenExecutor"

    .line 19
    .line 20
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public updateView()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
