.class public Lcom/android/launcher3/aitools/LockLayoutExecutor;
.super Lcom/zte/toolsdk/producer/ToolsExecutor;
.source "LockLayoutExecutor.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "LockLayoutExecutor"


# instance fields
.field private mCardTitle:Ljava/lang/String;

.field private mIsLock:Z

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

.method private isLockScreen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->q()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private setCardTitle()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const v1, 0x7f140069

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const v1, 0x7f140068

    .line 12
    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    const v2, 0x7f140066

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mCardTitle:Ljava/lang/String;

    .line 43
    .line 44
    return-void
.end method

.method private setLockScreenStatus(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setLockScreenStatus to "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "LockLayoutExecutor"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/r4;->K(Z)V

    .line 34
    .line 35
    .line 36
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
    const-string v0, "LockLayoutExecutor"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    invoke-static {p2}, Lcom/android/launcher3/aitools/ToolsUtils;->getArgumentsFromJson(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/android/launcher3/aitools/ToolsUtils;->getActionFromJson(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "LOCK"

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 38
    .line 39
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 44
    .line 45
    iget-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->isLockScreen()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eq p1, p2, :cond_0

    .line 52
    .line 53
    iget-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 54
    .line 55
    invoke-direct {p0, p1}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->setLockScreenStatus(Z)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->setCardTitle()V

    .line 59
    .line 60
    .line 61
    iput-object p3, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 62
    .line 63
    new-instance p1, Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 64
    .line 65
    invoke-direct {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string p2, ""

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setText(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mCardTitle:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setResponse(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const/4 p2, 0x1

    .line 81
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setFinish(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->build()Lcom/zte/toolsdk/producer/ToolsParams;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 90
    .line 91
    invoke-interface {p0, p1}, Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;->onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public initView()Z
    .locals 3

    .line 1
    const-string v0, "LockLayoutExecutor"

    .line 2
    .line 3
    const-string v1, "initView()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 9
    .line 10
    const v1, 0x7f0e004d

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setLayoutId(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 19
    .line 20
    const v2, 0x7f0b05a3

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setSwitchState(IZ)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setOnCheckedChangeListener(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/zte/toolsdk/producer/ToolsExecutor;->mRemoteViewsHelper:Lcom/zte/toolsdk/producer/RemoteViewsHelper;

    .line 32
    .line 33
    const v0, 0x7f0b033d

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/producer/RemoteViewsHelper;->setOnClickListener(I)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public update(IILjava/lang/Object;Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;)V
    .locals 1

    .line 1
    const p1, 0x7f0b05a3

    .line 2
    .line 3
    .line 4
    const-string p4, "viewId = "

    .line 5
    .line 6
    const-string v0, "LockLayoutExecutor"

    .line 7
    .line 8
    if-ne p2, p1, :cond_1

    .line 9
    .line 10
    check-cast p3, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 17
    .line 18
    new-instance p1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p2, ", checked state = "

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean p2, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->isLockScreen()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eq p1, p2, :cond_0

    .line 53
    .line 54
    iget-boolean p1, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mIsLock:Z

    .line 55
    .line 56
    invoke-direct {p0, p1}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->setLockScreenStatus(Z)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/aitools/LockLayoutExecutor;->setCardTitle()V

    .line 60
    .line 61
    .line 62
    new-instance p1, Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 63
    .line 64
    invoke-direct {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string p2, ""

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setText(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p2, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mCardTitle:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setResponse(Ljava/lang/String;)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const/4 p2, 0x1

    .line 80
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->setFinish(Z)Lcom/zte/toolsdk/producer/ToolsParams$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/zte/toolsdk/producer/ToolsParams$Builder;->build()Lcom/zte/toolsdk/producer/ToolsParams;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mOnToolsResultListener:Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;

    .line 89
    .line 90
    invoke-interface {p0, p1}, Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;->onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    const p1, 0x7f0b033d

    .line 95
    .line 96
    .line 97
    if-ne p2, p1, :cond_2

    .line 98
    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string p2, "on click"

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/android/launcher3/aitools/LockLayoutExecutor;->mLauncher:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    invoke-static {p0}, Lcom/android/launcher3/aitools/ToolsUtils;->jumpToLauncherSettins(Landroid/content/Context;)Z

    .line 125
    .line 126
    .line 127
    :cond_2
    return-void
.end method

.method public updateView()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
