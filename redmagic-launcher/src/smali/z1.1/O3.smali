.class public Lz1/O3;
.super Ljava/lang/Object;
.source "PackageIncrementalDownloadUpdatedTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Landroid/os/UserHandle;

.field private final b:I

.field private final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/os/UserHandle;F)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lz1/O3;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    const/high16 p2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    sub-float/2addr p2, p3

    .line 9
    float-to-double v0, p2

    .line 10
    const-wide v2, 0x3f50624dd2f1a9fcL    # 0.001

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmpl-double p2, v0, v2

    .line 16
    .line 17
    if-lez p2, :cond_0

    .line 18
    .line 19
    const/high16 p2, 0x42c80000    # 100.0f

    .line 20
    .line 21
    mul-float/2addr p3, p2

    .line 22
    float-to-int p2, p3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 p2, 0x64

    .line 25
    .line 26
    :goto_0
    iput p2, p0, Lz1/O3;->b:I

    .line 27
    .line 28
    iput-object p1, p0, Lz1/O3;->c:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/d;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->r(Lcom/android/launcher3/model/data/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lz1/O3;LD1/f;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lz1/O3;->d(LD1/f;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(LD1/f;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/O3;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget p0, p3, Lcom/android/launcher3/model/data/z;->h:I

    .line 14
    .line 15
    and-int/lit16 p0, p0, -0x401

    .line 16
    .line 17
    iput p0, p3, Lcom/android/launcher3/model/data/z;->h:I

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Lcom/android/launcher3/model/data/z;->K(LD1/f;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 5

    .line 1
    new-instance v0, LD1/f;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/O3;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lz1/O3;->b:I

    .line 6
    .line 7
    iget-object v3, p0, Lz1/O3;->a:Landroid/os/UserHandle;

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    invoke-direct {v0, v1, v4, v2, v3}, LD1/f;-><init>(Ljava/lang/String;IILandroid/os/UserHandle;)V

    .line 11
    .line 12
    .line 13
    monitor-enter p3

    .line 14
    :try_start_0
    invoke-virtual {p3, v0}, Lz1/m;->A(LD1/f;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/android/launcher3/model/data/d;

    .line 39
    .line 40
    iget v3, v2, Lcom/android/launcher3/model/data/z;->h:I

    .line 41
    .line 42
    and-int/lit16 v3, v3, -0x401

    .line 43
    .line 44
    iput v3, v2, Lcom/android/launcher3/model/data/z;->h:I

    .line 45
    .line 46
    new-instance v3, Lz1/M3;

    .line 47
    .line 48
    invoke-direct {v3, v2}, Lz1/M3;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v3}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    invoke-virtual {p1}, Lz1/o3;->y()V

    .line 58
    .line 59
    .line 60
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    new-instance p3, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    monitor-enter p2

    .line 67
    :try_start_1
    iget-object v1, p0, Lz1/O3;->a:Landroid/os/UserHandle;

    .line 68
    .line 69
    new-instance v2, Lz1/N3;

    .line 70
    .line 71
    invoke-direct {v2, p0, v0, p3}, Lz1/N3;-><init>(Lz1/O3;LD1/f;Ljava/util/ArrayList;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2, v1, v2}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 75
    .line 76
    .line 77
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 78
    invoke-virtual {p1, p3}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catchall_1
    move-exception p0

    .line 83
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 84
    throw p0

    .line 85
    :goto_1
    :try_start_3
    monitor-exit p3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    throw p0
.end method
