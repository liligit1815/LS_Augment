.class public Lcom/android/launcher3/widget/f;
.super Ljava/lang/Object;
.source "AppWidgetHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/f$a;
    }
.end annotation


# static fields
.field private static volatile d:Lcom/android/launcher3/widget/f;


# instance fields
.field private a:Z

.field private b:Lcom/android/launcher3/widget/f$a;

.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->j(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->k(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->e(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/launcher3/widget/f;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/f;->h()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private e(Ljava/util/function/Consumer;)V
    .locals 2

    .line 1
    const-string v0, "APPWidgetHelper"

    .line 2
    .line 3
    const-string v1, "consumerAsync"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/f;->l()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 12
    .line 13
    new-instance v1, Lcom/android/launcher3/widget/d;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/d;-><init>(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private f(Ljava/util/function/Consumer;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string p1, "consumerRun, cost: "

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    sub-long/2addr v2, v0

    .line 24
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "APPWidgetHelper"

    .line 32
    .line 33
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static g()Lcom/android/launcher3/widget/f;
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/f;->d:Lcom/android/launcher3/widget/f;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v1, Lcom/android/launcher3/widget/f;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    sget-object v0, Lcom/android/launcher3/widget/f;->d:Lcom/android/launcher3/widget/f;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/widget/f;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/android/launcher3/widget/f;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/widget/f;->d:Lcom/android/launcher3/widget/f;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v1

    .line 23
    return-object v0

    .line 24
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0

    .line 26
    :cond_1
    return-object v0
.end method

.method private h()Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/f;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/C2;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method private synthetic j(Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->f(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k(Ljava/util/function/Consumer;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/f;->a:Z

    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Lcom/android/launcher3/widget/e;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/e;-><init>(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x32

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public i(Ljava/util/function/Consumer;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/f;->h()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "APPWidgetHelper"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "inject launcher is null"

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v2, v0, Lcom/android/launcher3/C2;->Z:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v3}, Lx1/O;->T3(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v5, "inject mCanConsumeDirectly: "

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-boolean v5, p0, Lcom/android/launcher3/widget/f;->a:Z

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v5, ",userUnlocked: "

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v5, ",isReCreated: "

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    const/4 v5, 0x0

    .line 68
    if-eqz v4, :cond_1

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Lcom/android/launcher3/D3;->u0()Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_1

    .line 79
    .line 80
    if-nez v3, :cond_1

    .line 81
    .line 82
    const-string v4, "inject: reset userUnlock state!"

    .line 83
    .line 84
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1, v5}, Lcom/android/launcher3/D3;->W0(Z)V

    .line 92
    .line 93
    .line 94
    :cond_1
    if-nez v3, :cond_4

    .line 95
    .line 96
    iget-boolean v1, p0, Lcom/android/launcher3/widget/f;->a:Z

    .line 97
    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    iput-boolean v5, p0, Lcom/android/launcher3/widget/f;->a:Z

    .line 101
    .line 102
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/widget/f;->l()V

    .line 103
    .line 104
    .line 105
    new-instance v1, Lcom/android/launcher3/widget/f$a;

    .line 106
    .line 107
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/f$a;-><init>(Lcom/android/launcher3/widget/f;Ljava/util/function/Consumer;)V

    .line 108
    .line 109
    .line 110
    iput-object v1, p0, Lcom/android/launcher3/widget/f;->b:Lcom/android/launcher3/widget/f$a;

    .line 111
    .line 112
    iget-object p0, v0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 113
    .line 114
    if-eqz v2, :cond_3

    .line 115
    .line 116
    const-wide/16 v2, 0x0

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    const-wide/16 v2, 0x320

    .line 120
    .line 121
    :goto_0
    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/f;->a:Z

    .line 126
    .line 127
    if-eqz v0, :cond_5

    .line 128
    .line 129
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->f(Ljava/util/function/Consumer;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_5
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/f;->e(Ljava/util/function/Consumer;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    const-string v0, "removeConsumerTask"

    .line 2
    .line 3
    const-string v1, "APPWidgetHelper"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/widget/f;->h()Lcom/android/launcher3/C2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p0, "removeConsumerTask launcher is null"

    .line 15
    .line 16
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/widget/f;->b:Lcom/android/launcher3/widget/f$a;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v0, v0, Lcom/android/launcher3/statemanager/h;->mHandler:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/widget/f;->b:Lcom/android/launcher3/widget/f$a;

    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public m(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/widget/f;->c:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method
