.class public Lcom/android/launcher3/taskbar/l3;
.super Ljava/lang/Object;
.source "TaskbarNavButtonController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/l3$a;
    }
.end annotation


# instance fields
.field private g:J

.field private h:Z

.field private i:Z

.field private j:I

.field private k:I

.field private final l:I

.field private final m:Lcom/android/launcher3/taskbar/l3$a;

.field private final n:Lcom/android/quickstep/SystemUiProxy;

.field private final o:Landroid/os/Handler;

.field private final p:Lcom/android/quickstep/util/ContextualSearchInvoker;

.field private q:Lcom/android/launcher3/logging/StatsLogManager;

.field private final r:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(ILcom/android/launcher3/taskbar/l3$a;Lcom/android/quickstep/SystemUiProxy;Landroid/os/Handler;Lcom/android/quickstep/util/ContextualSearchInvoker;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/taskbar/k3;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/k3;-><init>(Lcom/android/launcher3/taskbar/l3;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/taskbar/l3;->r:Ljava/lang/Runnable;

    .line 16
    .line 17
    iput p1, p0, Lcom/android/launcher3/taskbar/l3;->l:I

    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/launcher3/taskbar/l3;->m:Lcom/android/launcher3/taskbar/l3$a;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 22
    .line 23
    iput-object p4, p0, Lcom/android/launcher3/taskbar/l3;->o:Landroid/os/Handler;

    .line 24
    .line 25
    iput-object p5, p0, Lcom/android/launcher3/taskbar/l3;->p:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/l3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(I)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->d()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private d()Z
    .locals 8

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/l3;->h:Z

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    return v3

    .line 11
    :cond_0
    iget-wide v4, p0, Lcom/android/launcher3/taskbar/l3;->g:J

    .line 12
    .line 13
    const-wide/16 v6, 0x0

    .line 14
    .line 15
    cmp-long v2, v4, v6

    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/l3;->g:J

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/taskbar/l3;->o:Landroid/os/Handler;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->r:Ljava/lang/Runnable;

    .line 29
    .line 30
    const-wide/16 v1, 0x12c

    .line 31
    .line 32
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 33
    .line 34
    .line 35
    return v6

    .line 36
    :cond_1
    sub-long/2addr v0, v4

    .line 37
    const-wide/16 v4, 0xc8

    .line 38
    .line 39
    cmp-long v0, v0, v4

    .line 40
    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->s()V

    .line 44
    .line 45
    .line 46
    return v3

    .line 47
    :cond_2
    iget v0, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 48
    .line 49
    const/4 v1, 0x5

    .line 50
    and-int/2addr v0, v1

    .line 51
    if-ne v0, v1, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->stopScreenPinning()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/taskbar/l3;->o:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/android/launcher3/taskbar/l3;->r:Ljava/lang/Runnable;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->s()V

    .line 66
    .line 67
    .line 68
    :cond_3
    return v6
.end method

.method private e(Landroid/view/KeyEvent;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isCanceled()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    :cond_0
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->x2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 17
    .line 18
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    sget-object v3, Lw2/a;->g:Lw2/a;

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 30
    .line 31
    iget v2, p0, Lcom/android/launcher3/taskbar/l3;->l:I

    .line 32
    .line 33
    invoke-virtual {v1, p1, v2}, Lcom/android/quickstep/SystemUiProxy;->onBackEvent(Landroid/view/KeyEvent;I)V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    :cond_2
    iput v0, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 43
    .line 44
    return-void
.end method

.method private i(Lcom/android/launcher3/logging/StatsLogManager$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->q:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "TaskbarNavButtonController"

    .line 6
    .line 7
    const-string p1, "No stats log manager to log taskbar button event"

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private j()V
    .locals 1

    .line 1
    const-string v0, "homekey"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->m:Lcom/android/launcher3/taskbar/l3$a;

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/l3$a;->onNavigateHome()V

    .line 9
    .line 10
    .line 11
    const-string p0, "TaskbarNavButtonController"

    .line 12
    .line 13
    const-string v0, "navigateHome,start home "

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/l3;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "Main"

    .line 7
    .line 8
    const-string v1, "onOverviewToggle"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "recentapps"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->m:Lcom/android/launcher3/taskbar/l3$a;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/l3$a;->onToggleOverview()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private l(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->notifyAccessibilityButtonLongClicked()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    iget p0, p0, Lcom/android/launcher3/taskbar/l3;->l:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemUiProxy;->notifyAccessibilityButtonClicked(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->onImeSwitcherLongPress()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->onImeSwitcherPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/l3;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/l3;->i:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/l3;->p:Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 11
    .line 12
    const/4 v1, 0x5

    .line 13
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->tryStartAssistOverride(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "invocation_type"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SystemUiProxy;->startAssistant(Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method private s()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/l3;->e(Landroid/view/KeyEvent;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/android/launcher3/taskbar/l3;->k:I

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/l3;->g:J

    .line 16
    .line 17
    return-void
.end method

.method private v()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->toggleNotificationPanel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private w()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->toggleNotificationPanel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "TaskbarNavButtonController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tmLastScreenPinLongPress="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/l3;->g:J

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmScreenPinned="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/l3;->h:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "\tmLastSentBackAction="

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget p0, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 85
    .line 86
    invoke-static {p0}, Landroid/view/KeyEvent;->actionToString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public f(I)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_6

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_5

    .line 6
    .line 7
    const/4 p0, 0x4

    .line 8
    if-eq p1, p0, :cond_4

    .line 9
    .line 10
    const/16 p0, 0x8

    .line 11
    .line 12
    if-eq p1, p0, :cond_3

    .line 13
    .line 14
    const/16 p0, 0x10

    .line 15
    .line 16
    if-eq p1, p0, :cond_2

    .line 17
    .line 18
    const/16 p0, 0x20

    .line 19
    .line 20
    if-eq p1, p0, :cond_1

    .line 21
    .line 22
    const/16 p0, 0x40

    .line 23
    .line 24
    if-eq p1, p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_0
    const p0, 0x7f140425

    .line 29
    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    const p0, 0x7f140426

    .line 33
    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    const p0, 0x7f140421

    .line 37
    .line 38
    .line 39
    return p0

    .line 40
    :cond_3
    const p0, 0x7f140424

    .line 41
    .line 42
    .line 43
    return p0

    .line 44
    :cond_4
    const p0, 0x7f140427

    .line 45
    .line 46
    .line 47
    return p0

    .line 48
    :cond_5
    const p0, 0x7f140423

    .line 49
    .line 50
    .line 51
    return p0

    .line 52
    :cond_6
    const p0, 0x7f140422

    .line 53
    .line 54
    .line 55
    return p0
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l3;->m:Lcom/android/launcher3/taskbar/l3$a;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/taskbar/l3$a;->onHideOverview()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lcom/android/launcher3/taskbar/R1;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/R1;->h()Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/launcher3/taskbar/l3;->q:Lcom/android/launcher3/logging/StatsLogManager;

    .line 10
    .line 11
    return-void
.end method

.method public m(ILandroid/view/View;)V
    .locals 1

    .line 1
    const/16 p2, 0x80

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, LG2/c;->j()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    iget p2, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 13
    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    const-string p0, "TaskbarNavButtonController"

    .line 17
    .line 18
    const-string p1, "Button click ignored while back button is pressed"

    .line 19
    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    const/4 p2, 0x1

    .line 25
    if-eq p1, p2, :cond_8

    .line 26
    .line 27
    const/4 p2, 0x2

    .line 28
    const/4 v0, 0x0

    .line 29
    if-eq p1, p2, :cond_7

    .line 30
    .line 31
    const/4 p2, 0x4

    .line 32
    if-eq p1, p2, :cond_6

    .line 33
    .line 34
    const/16 p2, 0x8

    .line 35
    .line 36
    if-eq p1, p2, :cond_5

    .line 37
    .line 38
    const/16 p2, 0x10

    .line 39
    .line 40
    if-eq p1, p2, :cond_4

    .line 41
    .line 42
    const/16 p2, 0x20

    .line 43
    .line 44
    if-eq p1, p2, :cond_3

    .line 45
    .line 46
    const/16 p2, 0x40

    .line 47
    .line 48
    if-eq p1, p2, :cond_2

    .line 49
    .line 50
    :goto_0
    return-void

    .line 51
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->v()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->w()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->A2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 60
    .line 61
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/l3;->l(Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_5
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->z2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 69
    .line 70
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->q()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_6
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->y2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 83
    .line 84
    sget-object p2, Lw2/a;->i:Lw2/a;

    .line 85
    .line 86
    invoke-virtual {p1, v0, p2}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->k()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_7
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->w2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 94
    .line 95
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/android/launcher3/taskbar/l3;->n:Lcom/android/quickstep/SystemUiProxy;

    .line 99
    .line 100
    sget-object p2, Lw2/a;->h:Lw2/a;

    .line 101
    .line 102
    invoke-virtual {p1, v0, p2}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->j()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_8
    const/4 p1, 0x0

    .line 110
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->e(Landroid/view/KeyEvent;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public n(ILandroid/view/View;)Z
    .locals 5

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {}, LG2/c;->j()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x4

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    if-eq p1, v3, :cond_1

    .line 20
    .line 21
    if-eq p1, v2, :cond_1

    .line 22
    .line 23
    const-string p0, "TaskbarNavButtonController"

    .line 24
    .line 25
    const-string p1, "Button long click ignored while back button is pressed"

    .line 26
    .line 27
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    const/4 v0, 0x2

    .line 32
    if-eq p1, v0, :cond_3

    .line 33
    .line 34
    invoke-static {}, LG2/c;->j()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    if-eq p1, v3, :cond_3

    .line 41
    .line 42
    :cond_2
    invoke-virtual {p2, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 43
    .line 44
    .line 45
    :cond_3
    if-eq p1, v3, :cond_9

    .line 46
    .line 47
    if-eq p1, v0, :cond_8

    .line 48
    .line 49
    if-eq p1, v2, :cond_7

    .line 50
    .line 51
    const/16 p2, 0x8

    .line 52
    .line 53
    if-eq p1, p2, :cond_5

    .line 54
    .line 55
    const/16 p2, 0x10

    .line 56
    .line 57
    if-eq p1, p2, :cond_4

    .line 58
    .line 59
    return v1

    .line 60
    :cond_4
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->E2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 61
    .line 62
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/l3;->l(Z)V

    .line 66
    .line 67
    .line 68
    return v3

    .line 69
    :cond_5
    invoke-static {}, Landroid/view/inputmethod/Flags;->imeSwitcherRevamp()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_6

    .line 74
    .line 75
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->C3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 76
    .line 77
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->p()V

    .line 81
    .line 82
    .line 83
    return v3

    .line 84
    :cond_6
    return v1

    .line 85
    :cond_7
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->D2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 86
    .line 87
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 88
    .line 89
    .line 90
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->c(I)Z

    .line 91
    .line 92
    .line 93
    return v3

    .line 94
    :cond_8
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->B2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 95
    .line 96
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/l3;->r()V

    .line 100
    .line 101
    .line 102
    return v3

    .line 103
    :cond_9
    sget-object p2, Lcom/android/launcher3/logging/StatsLogManager$e;->C2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 104
    .line 105
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/l3;->i(Lcom/android/launcher3/logging/StatsLogManager$e;)V

    .line 106
    .line 107
    .line 108
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/l3;->c(I)Z

    .line 109
    .line 110
    .line 111
    return v3
.end method

.method public o()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/l3;->q:Lcom/android/launcher3/logging/StatsLogManager;

    .line 3
    .line 4
    return-void
.end method

.method t(IZ)V
    .locals 9

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/l3;->j:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    new-instance v1, Landroid/view/KeyEvent;

    .line 11
    .line 12
    const/4 v7, 0x4

    .line 13
    const/4 v8, 0x0

    .line 14
    move-wide v4, v2

    .line 15
    move v6, p1

    .line 16
    invoke-direct/range {v1 .. v8}, Landroid/view/KeyEvent;-><init>(JJIII)V

    .line 17
    .line 18
    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/KeyEvent;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/l3;->e(Landroid/view/KeyEvent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/l3;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    and-long/2addr p1, v0

    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long p1, p1, v0

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/l3;->h:Z

    .line 14
    .line 15
    return-void
.end method
