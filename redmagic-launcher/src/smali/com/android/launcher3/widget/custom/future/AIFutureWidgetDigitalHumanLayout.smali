.class public Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;
.super Landroid/widget/FrameLayout;
.source "AIFutureWidgetDigitalHumanLayout.java"


# instance fields
.field private g:Ljava/lang/String;

.field private h:Z

.field private i:I

.field private j:Z

.field private final k:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

.field private l:Landroid/content/BroadcastReceiver;

.field private m:Z

.field private n:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    const-string p1, "AIFutureWidgetDigitalHumanLayout"

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->h:Z

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j:Z

    .line 6
    new-instance p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;

    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$d;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->k:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 7
    new-instance p2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$e;

    invoke-direct {p2, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$e;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->l:Landroid/content/BroadcastReceiver;

    .line 8
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->m:Z

    .line 9
    new-instance p1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;

    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$f;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->n:Landroid/content/BroadcastReceiver;

    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "AIFutureWidgetDigitalHumanLayout{"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "}"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "bindService"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;->getDefault()Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->bindService(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;)Z

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->k:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->registerCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "bindService error"

    .line 33
    .line 34
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private j()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "clearDigitalHuman this=0x"

    .line 13
    .line 14
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->y()V

    .line 36
    .line 37
    .line 38
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->hide()V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->k:Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;

    .line 56
    .line 57
    invoke-interface {v2, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->unregisterCallback(Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception v2

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 64
    .line 65
    const-string v3, "clearDigitalHuman error, not isReady"

    .line 66
    .line 67
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 72
    .line 73
    const-string v4, "clearDigitalHuman unregisterCallback error"

    .line 74
    .line 75
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    .line 77
    .line 78
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 79
    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v4, "clearDigitalHuman unregisterCallback hao="

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 91
    .line 92
    .line 93
    move-result-wide v4

    .line 94
    sub-long/2addr v4, v0

    .line 95
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v0, "ms"

    .line 99
    .line 100
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 111
    .line 112
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$c;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "hideDigitalHuman"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->pauseMotion()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->hide()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "hideDigitalHuman error, not isReady"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "hideDigitalHuman pauseMotion hide"

    .line 41
    .line 42
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "hideDigitalHuman hide error"

    .line 49
    .line 50
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "initDigitalHuman"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$a;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "initDigitalHumanViewAfterServiceConnected before"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout$b;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "registerEventReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    .line 9
    .line 10
    const-string v1, "com.zte.mifavor.launcher.AIFutureDigitalHuman.onEvent"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->n:Landroid/content/BroadcastReceiver;

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "registerEventReceiver error"

    .line 30
    .line 31
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private v()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "registerMotionReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    .line 9
    .line 10
    const-string v1, "com.zte.mifavor.launcher.AIFutureDigitalHuman.startMotion"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->l:Landroid/content/BroadcastReceiver;

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "registerMotionReceiver error"

    .line 30
    .line 31
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "showDigitalHuman"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->show()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->resumeMotion()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "showDigitalHuman error, not isReady"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "showDigitalHuman show resumeMotion"

    .line 41
    .line 42
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "showDigitalHuman show error"

    .line 49
    .line 50
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "unregisterEventReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->n:Landroid/content/BroadcastReceiver;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "unregisterEventReceiver error"

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "unregisterMotionReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->l:Landroid/content/BroadcastReceiver;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "unregisterMotionReceiver error"

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method protected n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onAIFutureScreenWidgetHostViewRemoved"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->x()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected o(ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "onAIFutureWidgetScreenStateChanged launcherVisible="

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " isInAIFutureWidgetScreen="

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " mIsInAIFutureWidgetScreen="

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->h:Z

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-boolean p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->h:Z

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    :try_start_0
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->isReady()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;->Specify:Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;

    .line 58
    .line 59
    const/16 v1, 0x3e8

    .line 60
    .line 61
    invoke-interface {p1, v1, v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;->startMotion(ILcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :catchall_0
    move-exception p1

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 68
    .line 69
    const-string v0, "onAIFutureWidgetScreenStateChanged startMotion error, not isReady"

    .line 70
    .line 71
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 76
    .line 77
    const-string v1, "onAIFutureWidgetScreenStateChanged startMotion error"

    .line 78
    .line 79
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_1
    iput-boolean p2, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->h:Z

    .line 83
    .line 84
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "onAttachedToWindow"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "onDetachedFromWindow"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 5
    .line 6
    const-string v0, "onFinishInflate"

    .line 7
    .line 8
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->i:I

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v3, 0x0

    .line 18
    cmpl-float v0, v0, v3

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v4, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->i:I

    .line 27
    .line 28
    int-to-float v4, v4

    .line 29
    cmpg-float v0, v0, v4

    .line 30
    .line 31
    if-gez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    cmpl-float v0, v0, v3

    .line 38
    .line 39
    if-lez v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    int-to-float v3, v3

    .line 50
    cmpg-float v0, v0, v3

    .line 51
    .line 52
    if-gez v0, :cond_0

    .line 53
    .line 54
    move v0, v2

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    move v0, v1

    .line 57
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j:Z

    .line 58
    .line 59
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-boolean v3, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j:Z

    .line 64
    .line 65
    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eq v0, v2, :cond_2

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v2, 0x3

    .line 79
    if-ne v0, v2, :cond_3

    .line 80
    .line 81
    :cond_2
    iput-boolean v1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->j:Z

    .line 82
    .line 83
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    return p0
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/high16 v0, 0x437f0000    # 255.0f

    .line 6
    .line 7
    invoke-static {p2, v0}, Lx1/O;->F(Landroid/content/Context;F)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/high16 v0, 0x40000000    # 2.0f

    .line 12
    .line 13
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method protected p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->x()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected r()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "onLauncherResumed"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherStarted"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->w()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->g:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "onLauncherStopped"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->k()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected z(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetDigitalHumanLayout;->i:I

    .line 2
    .line 3
    return-void
.end method
