.class public Lcom/android/launcher3/taskbar/O2;
.super Ljava/lang/Object;
.source "TaskbarKeyguardController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:J

.field private i:Z

.field private j:Lcom/android/launcher3/taskbar/M0;

.field private final k:Landroid/app/KeyguardManager;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/O2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    const-class v0, Landroid/app/KeyguardManager;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/ContextThemeWrapper;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/app/KeyguardManager;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/taskbar/O2;->k:Landroid/app/KeyguardManager;

    .line 15
    .line 16
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/taskbar/O2;->h:J

    .line 2
    .line 3
    const-wide/32 v2, 0x400000

    .line 4
    .line 5
    .line 6
    and-long/2addr v0, v2

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/O2;->k:Landroid/app/KeyguardManager;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isDeviceSecure()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/O2;->i:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 29
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/O2;->j:Lcom/android/launcher3/taskbar/M0;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/M0;->P0(Z)V

    .line 32
    .line 33
    .line 34
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
    const-string v1, "TaskbarKeyguardController:"

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
    const-string v1, "\tmKeyguardSysuiFlags="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/O2;->h:J

    .line 35
    .line 36
    invoke-static {v1, v2}, Lcom/android/systemui/shared/system/QuickStepContract;->getSystemUiStateString(J)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, "\tmBouncerShowing="

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/O2;->i:Z

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public b(Lcom/android/launcher3/taskbar/M0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/O2;->j:Lcom/android/launcher3/taskbar/M0;

    .line 2
    .line 3
    return-void
.end method

.method public d(J)V
    .locals 9

    .line 1
    const-wide/32 v0, 0x306003c8

    .line 2
    .line 3
    .line 4
    and-long/2addr v0, p1

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/taskbar/O2;->h:J

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/O2;->h:J

    .line 13
    .line 14
    const-wide/16 v0, 0x8

    .line 15
    .line 16
    and-long/2addr v0, p1

    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    move v0, v4

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v0, v1

    .line 28
    :goto_0
    const-wide/16 v5, 0x40

    .line 29
    .line 30
    and-long/2addr v5, p1

    .line 31
    cmp-long v5, v5, v2

    .line 32
    .line 33
    if-eqz v5, :cond_2

    .line 34
    .line 35
    move v5, v4

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    move v5, v1

    .line 38
    :goto_1
    const-wide/16 v6, 0x200

    .line 39
    .line 40
    and-long/2addr v6, p1

    .line 41
    cmp-long v6, v6, v2

    .line 42
    .line 43
    if-eqz v6, :cond_3

    .line 44
    .line 45
    move v6, v4

    .line 46
    goto :goto_2

    .line 47
    :cond_3
    move v6, v1

    .line 48
    :goto_2
    const-wide/32 v7, 0x200000

    .line 49
    .line 50
    .line 51
    and-long/2addr v7, p1

    .line 52
    cmp-long v7, v7, v2

    .line 53
    .line 54
    if-eqz v7, :cond_4

    .line 55
    .line 56
    move v7, v4

    .line 57
    goto :goto_3

    .line 58
    :cond_4
    move v7, v1

    .line 59
    :goto_3
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/O2;->i:Z

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/taskbar/O2;->j:Lcom/android/launcher3/taskbar/M0;

    .line 62
    .line 63
    if-nez v5, :cond_6

    .line 64
    .line 65
    if-eqz v7, :cond_5

    .line 66
    .line 67
    goto :goto_4

    .line 68
    :cond_5
    move v7, v1

    .line 69
    goto :goto_5

    .line 70
    :cond_6
    :goto_4
    move v7, v4

    .line 71
    :goto_5
    invoke-virtual {v0, v7, v6}, Lcom/android/launcher3/taskbar/M0;->R0(ZZ)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/O2;->c()V

    .line 75
    .line 76
    .line 77
    const-wide/32 v6, 0x10000000

    .line 78
    .line 79
    .line 80
    and-long/2addr v6, p1

    .line 81
    cmp-long v0, v6, v2

    .line 82
    .line 83
    if-nez v0, :cond_7

    .line 84
    .line 85
    move v0, v4

    .line 86
    goto :goto_6

    .line 87
    :cond_7
    move v0, v1

    .line 88
    :goto_6
    if-nez v5, :cond_9

    .line 89
    .line 90
    if-eqz v0, :cond_8

    .line 91
    .line 92
    goto :goto_7

    .line 93
    :cond_8
    return-void

    .line 94
    :cond_9
    :goto_7
    const-wide/32 v5, 0x30000000

    .line 95
    .line 96
    .line 97
    and-long/2addr p1, v5

    .line 98
    cmp-long p1, p1, v2

    .line 99
    .line 100
    if-eqz p1, :cond_a

    .line 101
    .line 102
    move v1, v4

    .line 103
    :cond_a
    iget-object p0, p0, Lcom/android/launcher3/taskbar/O2;->g:Lcom/android/launcher3/taskbar/I1;

    .line 104
    .line 105
    const p1, 0x7ffeffff

    .line 106
    .line 107
    .line 108
    invoke-static {p0, v1, p1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 109
    .line 110
    .line 111
    return-void
.end method
