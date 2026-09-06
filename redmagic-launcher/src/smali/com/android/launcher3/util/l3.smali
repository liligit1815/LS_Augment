.class public Lcom/android/launcher3/util/l3;
.super Ljava/lang/Object;
.source "WallpaperOffsetInterpolator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/l3$a;
    }
.end annotation


# static fields
.field private static final j:[I


# instance fields
.field private final a:Lcom/android/launcher3/util/x2;

.field private final b:Lcom/android/launcher3/Workspace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/Workspace<",
            "*>;"
        }
    .end annotation
.end field

.field private final c:Z

.field private final d:Landroid/os/Handler;

.field private e:Z

.field private f:Landroid/os/IBinder;

.field private g:Z

.field private h:Z

.field private i:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/android/launcher3/util/l3;->j:[I

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/Workspace<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/util/l3;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/x2;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 16
    .line 17
    new-instance v3, Lcom/android/launcher3/util/k3;

    .line 18
    .line 19
    invoke-direct {v3, p0}, Lcom/android/launcher3/util/k3;-><init>(Lcom/android/launcher3/util/l3;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/util/l3;->a:Lcom/android/launcher3/util/x2;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput-boolean v0, p0, Lcom/android/launcher3/util/l3;->c:Z

    .line 36
    .line 37
    new-instance v0, Lcom/android/launcher3/util/l3$a;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/l3$a;-><init>(Landroid/content/Context;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/launcher3/util/l3;->d:Landroid/os/Handler;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/l3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/l3;->h(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/l3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->r1()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sub-int/2addr v0, p0

    .line 25
    :cond_0
    return v0
.end method

.method private e()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    div-float/2addr v0, p0

    .line 14
    float-to-double v0, v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    double-to-int p0, v0

    .line 20
    return p0
.end method

.method private synthetic h(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/util/l3;->g:Z

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->o()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/j3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/j3;-><init>(Lcom/android/launcher3/util/l3;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/l3;->d:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/l3;->d()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    iget-object p0, p0, Lcom/android/launcher3/util/l3;->f:Landroid/os/IBinder;

    .line 9
    .line 10
    const/4 v3, 0x4

    .line 11
    invoke-static {v0, v3, v1, v2, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private q(II[I)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    aput v0, p3, v0

    .line 3
    .line 4
    iget-boolean v1, p0, Lcom/android/launcher3/util/l3;->h:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v1, :cond_6

    .line 8
    .line 9
    if-gt p2, v0, :cond_0

    .line 10
    .line 11
    goto :goto_3

    .line 12
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/util/l3;->g:Z

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    move v1, p2

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 v1, 0x4

    .line 19
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->c()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    sub-int/2addr v3, v0

    .line 28
    iget-boolean v4, p0, Lcom/android/launcher3/util/l3;->c:Z

    .line 29
    .line 30
    if-eqz v4, :cond_2

    .line 31
    .line 32
    move v5, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_2
    move v5, v2

    .line 35
    :goto_1
    if-eqz v4, :cond_3

    .line 36
    .line 37
    move v3, v2

    .line 38
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 39
    .line 40
    invoke-virtual {v4, v5}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v5, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 45
    .line 46
    invoke-virtual {v5, v3}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    sub-int/2addr v3, v4

    .line 51
    if-gtz v3, :cond_4

    .line 52
    .line 53
    aput v2, p3, v2

    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    sub-int/2addr p1, v4

    .line 57
    iget-object v4, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 58
    .line 59
    invoke-virtual {v4, v2}, Lcom/android/launcher3/V4;->getLayoutTransitionOffsetForPage(I)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    sub-int/2addr p1, v4

    .line 64
    invoke-static {p1, v2, v3}, Lcom/android/launcher3/N5;->c(III)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    sub-int/2addr v1, v0

    .line 69
    mul-int/2addr v1, v3

    .line 70
    aput v1, p3, v0

    .line 71
    .line 72
    iget-boolean p0, p0, Lcom/android/launcher3/util/l3;->c:Z

    .line 73
    .line 74
    if-eqz p0, :cond_5

    .line 75
    .line 76
    add-int/lit8 p0, p2, -0x1

    .line 77
    .line 78
    mul-int/2addr p0, v3

    .line 79
    sub-int/2addr v1, p0

    .line 80
    goto :goto_2

    .line 81
    :cond_5
    move v1, v2

    .line 82
    :goto_2
    sub-int/2addr p2, v0

    .line 83
    mul-int/2addr p1, p2

    .line 84
    add-int/2addr v1, p1

    .line 85
    aput v1, p3, v2

    .line 86
    .line 87
    return-void

    .line 88
    :cond_6
    :goto_3
    iget-boolean p0, p0, Lcom/android/launcher3/util/l3;->c:Z

    .line 89
    .line 90
    aput p0, p3, v2

    .line 91
    .line 92
    return-void
.end method


# virtual methods
.method public d()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/l3;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/util/l3;->i:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 v0, 0x4

    .line 9
    iget p0, p0, Lcom/android/launcher3/util/l3;->i:I

    .line 10
    .line 11
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/l3;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/l3;->d:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    iget-object p0, p0, Lcom/android/launcher3/util/l3;->f:Landroid/os/IBinder;

    .line 5
    .line 6
    invoke-static {v0, v1, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/util/l3;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/l3;->d:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    iget-object p0, p0, Lcom/android/launcher3/util/l3;->f:Landroid/os/IBinder;

    .line 5
    .line 6
    invoke-static {v0, v1, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m(Landroid/os/IBinder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/l3;->f:Landroid/os/IBinder;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/util/l3;->e:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/util/l3;->a:Lcom/android/launcher3/util/x2;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/util/x2;->v()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/android/launcher3/util/l3;->e:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-boolean p1, p0, Lcom/android/launcher3/util/l3;->e:Z

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/util/l3;->a:Lcom/android/launcher3/util/x2;

    .line 25
    .line 26
    const-string v0, "android.intent.action.WALLPAPER_CHANGED"

    .line 27
    .line 28
    filled-new-array {v0}, [Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->j()V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    iput-boolean p1, p0, Lcom/android/launcher3/util/l3;->e:Z

    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public n()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/util/l3;->b:Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sget-object v2, Lcom/android/launcher3/util/l3;->j:[I

    .line 12
    .line 13
    invoke-direct {p0, v1, v0, v2}, Lcom/android/launcher3/util/l3;->q(II[I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/util/l3;->d:Landroid/os/Handler;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aget v3, v2, v3

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    aget v2, v2, v4

    .line 23
    .line 24
    iget-object v5, p0, Lcom/android/launcher3/util/l3;->f:Landroid/os/IBinder;

    .line 25
    .line 26
    const/4 v6, 0x2

    .line 27
    invoke-static {v1, v6, v3, v2, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, p0, Lcom/android/launcher3/util/l3;->i:I

    .line 32
    .line 33
    if-eq v0, v2, :cond_1

    .line 34
    .line 35
    if-lez v2, :cond_0

    .line 36
    .line 37
    iput v4, v1, Landroid/os/Message;->what:I

    .line 38
    .line 39
    :cond_0
    iput v0, p0, Lcom/android/launcher3/util/l3;->i:I

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->o()V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public p(I)F
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/l3;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/android/launcher3/util/l3;->j:[I

    .line 6
    .line 7
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/util/l3;->q(II[I)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    aget p0, v1, p0

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    const/4 p1, 0x1

    .line 15
    aget p1, v1, p1

    .line 16
    .line 17
    int-to-float p1, p1

    .line 18
    div-float/2addr p0, p1

    .line 19
    return p0
.end method
