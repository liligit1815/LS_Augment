.class public Lz1/Y4;
.super Ljava/lang/Object;
.source "WidgetInfoChangedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Landroid/os/UserHandle;

.field private b:Z

.field private c:I

.field private d:I

.field private e:Landroid/content/ComponentName;

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method public constructor <init>(Landroid/os/UserHandle;ZIILandroid/content/ComponentName;IIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/Y4;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    iput-boolean p2, p0, Lz1/Y4;->b:Z

    .line 7
    .line 8
    iput p3, p0, Lz1/Y4;->c:I

    .line 9
    .line 10
    iput p4, p0, Lz1/Y4;->d:I

    .line 11
    .line 12
    iput-object p5, p0, Lz1/Y4;->e:Landroid/content/ComponentName;

    .line 13
    .line 14
    iput p6, p0, Lz1/Y4;->f:I

    .line 15
    .line 16
    iput p7, p0, Lz1/Y4;->g:I

    .line 17
    .line 18
    iput p8, p0, Lz1/Y4;->h:I

    .line 19
    .line 20
    iput p9, p0, Lz1/Y4;->i:I

    .line 21
    .line 22
    iput p10, p0, Lz1/Y4;->j:I

    .line 23
    .line 24
    iput p11, p0, Lz1/Y4;->k:I

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 11

    .line 1
    iget-boolean p3, p0, Lz1/Y4;->b:Z

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    monitor-enter p2

    .line 6
    :try_start_0
    iget v2, p0, Lz1/Y4;->c:I

    .line 7
    .line 8
    iget v3, p0, Lz1/Y4;->d:I

    .line 9
    .line 10
    iget-object v4, p0, Lz1/Y4;->e:Landroid/content/ComponentName;

    .line 11
    .line 12
    iget v5, p0, Lz1/Y4;->f:I

    .line 13
    .line 14
    iget v6, p0, Lz1/Y4;->g:I

    .line 15
    .line 16
    iget v7, p0, Lz1/Y4;->h:I

    .line 17
    .line 18
    iget v8, p0, Lz1/Y4;->i:I

    .line 19
    .line 20
    iget v9, p0, Lz1/Y4;->j:I

    .line 21
    .line 22
    iget v10, p0, Lz1/Y4;->k:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 23
    .line 24
    move-object v1, p2

    .line 25
    :try_start_1
    invoke-virtual/range {v1 .. v10}, Lz1/y0;->y(IILandroid/content/ComponentName;IIIIII)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Lcom/android/launcher3/util/E;

    .line 29
    .line 30
    iget-object p0, p0, Lz1/Y4;->e:Landroid/content/ComponentName;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 p1, 0x1

    .line 48
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/H5;->t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;

    .line 49
    .line 50
    .line 51
    monitor-exit v1

    .line 52
    return-void

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    :goto_0
    move-object p0, v0

    .line 55
    goto :goto_1

    .line 56
    :catchall_1
    move-exception v0

    .line 57
    move-object v1, p2

    .line 58
    goto :goto_0

    .line 59
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    throw p0

    .line 61
    :cond_0
    return-void
.end method
