.class public abstract Lcom/zte/toolsdk/producer/ToolsExecutor;
.super Ljava/lang/Object;
.source "ToolsExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;,
        Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;,
        Lcom/zte/toolsdk/producer/ToolsExecutor$ViewUpdateStatus;
    }
.end annotation


# static fields
.field public static final APPEND:I = 0x1

.field public static final NONE:I = 0x0

.field public static final REPLACE:I = 0x2


# instance fields
.field private mContext:Landroid/content/Context;

.field protected mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

.field private mRemoteViewsId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsId:I

    .line 6
    .line 7
    return-void
.end method

.method private updateRemoteViewsId()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsId:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    add-int/2addr v2, v0

    .line 10
    :goto_0
    iput v2, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsId:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public declared-synchronized createRemoteViews(Ljava/lang/String;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    invoke-direct {v0, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setRemotePackageName(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;->initView()Z

    .line 16
    .line 17
    .line 18
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;->updateRemoteViewsId()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->getRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 30
    .line 31
    .line 32
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    monitor-exit p0

    .line 34
    return-object p1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    throw p1
.end method

.method public abstract execute(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
.end method

.method public getRemoteViewsId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsId:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract initView()Z
.end method

.method public requestDismissKeyguard(Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;)V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "keyguard"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/KeyguardManager;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v1, Lcom/zte/toolsdk/producer/ToolsExecutor$1;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/zte/toolsdk/producer/ToolsExecutor$1;-><init>(Lcom/zte/toolsdk/producer/ToolsExecutor;Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :try_start_1
    const-string p1, "requestDismissKeyguardByZte"

    .line 30
    .line 31
    const-class v2, Landroid/os/Handler;

    .line 32
    .line 33
    const-class v3, Ljava/lang/CharSequence;

    .line 34
    .line 35
    const-class v4, Landroid/app/KeyguardManager$KeyguardDismissCallback;

    .line 36
    .line 37
    filled-new-array {v2, v3, v4}, [Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 42
    .line 43
    .line 44
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    const/4 p1, 0x0

    .line 46
    :try_start_2
    filled-new-array {p1, p1, v1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-interface {p1}, Lcom/zte/toolsdk/producer/ToolsExecutor$KeyguardDismissListener;->onDismissSucceeded()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :catch_0
    move-exception p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    :catch_1
    :cond_2
    return-void
.end method

.method public run(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 0

    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/producer/ToolsExecutor;->update(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V

    return-void
.end method

.method public run(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mContext:Landroid/content/Context;

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/producer/ToolsExecutor;->execute(Landroid/content/Context;Ljava/lang/String;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V

    return-void
.end method

.method public abstract update(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
.end method

.method public declared-synchronized updateRemoteViews(Ljava/lang/String;)Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    invoke-direct {v0, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p1, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setRemotePackageName(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;->updateView()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    new-instance p1, Landroid/util/Pair;

    .line 22
    .line 23
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-direct {p1, v1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-object p1

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x2

    .line 34
    if-ne p1, v0, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    :cond_1
    :try_start_1
    iget-object p1, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->getRemoteViews()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/zte/toolsdk/producer/ToolsExecutor;->updateRemoteViewsId()V

    .line 46
    .line 47
    .line 48
    :cond_2
    new-instance v0, Landroid/util/Pair;

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-object v0

    .line 59
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    throw p1
.end method

.method public abstract updateView()I
.end method
