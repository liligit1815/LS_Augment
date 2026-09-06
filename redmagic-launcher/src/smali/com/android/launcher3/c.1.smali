.class public Lcom/android/launcher3/c;
.super Ljava/lang/Object;
.source "Alarm.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private g:J

.field private h:Z

.field private i:Landroid/os/Handler;

.field private j:Lcom/android/launcher3/L4;

.field private k:Z

.field private l:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/launcher3/c;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/c;->k:Z

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/launcher3/c;->i:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/c;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/c;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/c;->l:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d(J)V
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 v2, 0x1

    .line 6
    iput-boolean v2, p0, Lcom/android/launcher3/c;->k:Z

    .line 7
    .line 8
    iget-wide v3, p0, Lcom/android/launcher3/c;->g:J

    .line 9
    .line 10
    add-long v5, v0, p1

    .line 11
    .line 12
    iput-wide v5, p0, Lcom/android/launcher3/c;->g:J

    .line 13
    .line 14
    iput-wide p1, p0, Lcom/android/launcher3/c;->l:J

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/android/launcher3/c;->h:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    cmp-long p1, v3, v5

    .line 21
    .line 22
    if-lez p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/c;->i:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Lcom/android/launcher3/c;->h:Z

    .line 31
    .line 32
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/c;->h:Z

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/android/launcher3/c;->i:Landroid/os/Handler;

    .line 37
    .line 38
    iget-wide v3, p0, Lcom/android/launcher3/c;->g:J

    .line 39
    .line 40
    sub-long/2addr v3, v0

    .line 41
    invoke-virtual {p1, p0, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 42
    .line 43
    .line 44
    iput-boolean v2, p0, Lcom/android/launcher3/c;->h:Z

    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public e(Lcom/android/launcher3/L4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/c;->j:Lcom/android/launcher3/L4;

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/c;->h:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lcom/android/launcher3/c;->k:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iget-wide v3, p0, Lcom/android/launcher3/c;->g:J

    .line 13
    .line 14
    cmp-long v5, v3, v1

    .line 15
    .line 16
    if-lez v5, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/c;->i:Landroid/os/Handler;

    .line 19
    .line 20
    const-wide/16 v5, 0x0

    .line 21
    .line 22
    sub-long/2addr v3, v1

    .line 23
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/android/launcher3/c;->h:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iput-boolean v0, p0, Lcom/android/launcher3/c;->k:Z

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/c;->j:Lcom/android/launcher3/L4;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    invoke-interface {v0, p0}, Lcom/android/launcher3/L4;->a(Lcom/android/launcher3/c;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method
