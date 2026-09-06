.class public LQ1/d;
.super Ljava/lang/Object;
.source "RotationHelper.java"

# interfaces
.implements Lcom/android/launcher3/F3;
.implements Lcom/android/launcher3/X3$b;
.implements Lcom/android/launcher3/util/Z$b;


# instance fields
.field private g:Z

.field private final h:Lcom/android/launcher3/v;

.field private final i:Landroid/os/Handler;

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:Z

.field private r:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/v;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LQ1/d;->g:Z

    .line 6
    .line 7
    iput v0, p0, LQ1/d;->m:I

    .line 8
    .line 9
    iput v0, p0, LQ1/d;->n:I

    .line 10
    .line 11
    iput v0, p0, LQ1/d;->o:I

    .line 12
    .line 13
    const/16 v0, -0x3e7

    .line 14
    .line 15
    iput v0, p0, LQ1/d;->r:I

    .line 16
    .line 17
    iput-object p1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 18
    .line 19
    new-instance p1, Landroid/os/Handler;

    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, LQ1/c;

    .line 28
    .line 29
    invoke-direct {v1, p0}, LQ1/c;-><init>(LQ1/d;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p1, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, LQ1/d;->i:Landroid/os/Handler;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(LQ1/d;Landroid/os/Message;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LQ1/d;->n(Landroid/os/Message;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static b(II)I
    .locals 0

    .line 1
    sub-int/2addr p1, p0

    .line 2
    if-gez p1, :cond_0

    .line 3
    .line 4
    add-int/lit8 p1, p1, 0x4

    .line 5
    .line 6
    :cond_0
    return p1
.end method

.method public static e(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->P0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->g0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static f(Lcom/android/launcher3/util/Z$c;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    iget v0, p0, Landroid/graphics/Point;->x:I

    .line 4
    .line 5
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 6
    .line 7
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    int-to-float p0, p0

    .line 12
    sget v0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 v0, 0x44160000    # 600.0f

    .line 19
    .line 20
    cmpl-float p0, p0, v0

    .line 21
    .line 22
    if-ltz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private h()V
    .locals 4

    .line 1
    iget-boolean v0, p0, LQ1/d;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, LQ1/d;->g:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/16 v0, 0xb

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_1
    iget v0, p0, LQ1/d;->m:I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    const/16 v2, 0xe

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    if-ne v0, v3, :cond_6

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    iget v0, p0, LQ1/d;->n:I

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    if-ne v0, v3, :cond_6

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    iget v0, p0, LQ1/d;->o:I

    .line 37
    .line 38
    if-ne v0, v3, :cond_4

    .line 39
    .line 40
    :goto_0
    move v0, v2

    .line 41
    goto :goto_2

    .line 42
    :cond_4
    iget-boolean v2, p0, LQ1/d;->j:Z

    .line 43
    .line 44
    if-nez v2, :cond_6

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    if-eq v0, v2, :cond_6

    .line 48
    .line 49
    iget-boolean v0, p0, LQ1/d;->l:Z

    .line 50
    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    iget-boolean v0, p0, LQ1/d;->k:Z

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_5
    const/4 v0, 0x5

    .line 59
    goto :goto_2

    .line 60
    :cond_6
    :goto_1
    move v0, v1

    .line 61
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v2, "notifyChange() activityFlags "

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v2, " - "

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget v2, p0, LQ1/d;->r:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v2, "RotationHelper"

    .line 89
    .line 90
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    iget v1, p0, LQ1/d;->r:I

    .line 94
    .line 95
    if-eq v0, v1, :cond_7

    .line 96
    .line 97
    iput v0, p0, LQ1/d;->r:I

    .line 98
    .line 99
    const-string v1, "b/380940677"

    .line 100
    .line 101
    invoke-virtual {p0}, LQ1/d;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, LQ1/d;->i:Landroid/os/Handler;

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 111
    .line 112
    .line 113
    :cond_7
    :goto_3
    return-void
.end method

.method private i(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean v0, p0, LQ1/d;->j:Z

    .line 7
    .line 8
    if-eq v0, p1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0, p1}, LQ1/d;->m(Z)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, LQ1/d;->h()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method private m(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-boolean v2, p0, LQ1/d;->q:Z

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-boolean p1, p0, LQ1/d;->j:Z

    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v2, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Lcom/android/launcher3/J3;->i(Lcom/android/launcher3/Y;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput-boolean p1, p0, LQ1/d;->l:Z

    .line 31
    .line 32
    iget-object p1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-array v1, v1, [Lcom/android/launcher3/H1;

    .line 39
    .line 40
    aput-object v2, v1, v0

    .line 41
    .line 42
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object p1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-array v1, v1, [Lcom/android/launcher3/H1;

    .line 53
    .line 54
    sget-object v2, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 55
    .line 56
    aput-object v2, v1, v0

    .line 57
    .line 58
    invoke-virtual {p1, p0, v1}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private n(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object p0, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 8
    .line 9
    iget p1, p1, Landroid/os/Message;->what:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 12
    .line 13
    .line 14
    return v1
.end method


# virtual methods
.method public c()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-boolean v1, p0, LQ1/d;->q:Z

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput-boolean v0, p0, LQ1/d;->q:Z

    .line 8
    .line 9
    iget-object v1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 10
    .line 11
    invoke-interface {v1, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 15
    .line 16
    iget-object v2, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/util/Z;

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/Z;->P(Lcom/android/launcher3/util/Z$b;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-array v0, v0, [Lcom/android/launcher3/H1;

    .line 34
    .line 35
    sget-object v2, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aput-object v2, v0, v3

    .line 39
    .line 40
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public d(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, LQ1/d;->k:Z

    .line 7
    .line 8
    invoke-direct {p0}, LQ1/d;->h()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-boolean v0, p0, LQ1/d;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LQ1/d;->p:Z

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    iget-object v1, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/util/Z;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, v1, Lcom/android/launcher3/util/Z$c;->i:Lcom/android/launcher3/util/p3;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-direct {p0, v1}, LQ1/d;->m(Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 36
    .line 37
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, LQ1/d;->h()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public j(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setCurrentStateRequest mCurrentStateRequest: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, LQ1/d;->o:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " ,request: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " ,mLastActivityFlags: "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v1, p0, LQ1/d;->r:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "RotationHelper"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget v0, p0, LQ1/d;->o:I

    .line 48
    .line 49
    if-ne v0, p1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iput p1, p0, LQ1/d;->o:I

    .line 53
    .line 54
    invoke-direct {p0}, LQ1/d;->h()V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public k(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, LQ1/d;->n:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput p1, p0, LQ1/d;->n:I

    .line 11
    .line 12
    invoke-direct {p0}, LQ1/d;->h()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, LQ1/d;->g:Z

    .line 2
    .line 3
    invoke-direct {p0}, LQ1/d;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setStateHandlerRequest mStateHandlerRequest: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, LQ1/d;->m:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " ,request: "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, " ,mLastActivityFlags: "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v1, p0, LQ1/d;->r:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "RotationHelper"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget v0, p0, LQ1/d;->m:I

    .line 48
    .line 49
    if-ne v0, p1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iput p1, p0, LQ1/d;->m:I

    .line 53
    .line 54
    invoke-direct {p0}, LQ1/d;->h()V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->G0:Z

    .line 2
    .line 3
    invoke-direct {p0, p1}, LQ1/d;->i(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 0

    .line 1
    iget-object p1, p2, Lcom/android/launcher3/util/Z$c;->i:Lcom/android/launcher3/util/p3;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-direct {p0, p1}, LQ1/d;->i(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onPrefChanged(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, LQ1/d;->q:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, LQ1/d;->j:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean p1, p0, LQ1/d;->l:Z

    .line 11
    .line 12
    iget-object v0, p0, LQ1/d;->h:Lcom/android/launcher3/v;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/J3;->v:Lcom/android/launcher3/Y;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/J3;->i(Lcom/android/launcher3/Y;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput-boolean v0, p0, LQ1/d;->l:Z

    .line 31
    .line 32
    if-eq v0, p1, :cond_1

    .line 33
    .line 34
    invoke-direct {p0}, LQ1/d;->h()V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 1
    iget v0, p0, LQ1/d;->m:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v0, p0, LQ1/d;->o:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget v0, p0, LQ1/d;->r:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    iget-boolean v0, p0, LQ1/d;->j:Z

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget-boolean v0, p0, LQ1/d;->l:Z

    .line 26
    .line 27
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    iget-boolean v0, p0, LQ1/d;->k:Z

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    iget-boolean v0, p0, LQ1/d;->q:Z

    .line 38
    .line 39
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    iget-boolean p0, p0, LQ1/d;->g:Z

    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string v0, "[mStateHandlerRequest=%d, mCurrentStateRequest=%d, mLastActivityFlags=%d, mIgnoreAutoRotateSettings=%b, mHomeRotationEnabled=%b, mForceAllowRotationForTesting=%b, mDestroyed=%b, mIsFixedLandscape=%b]"

    .line 54
    .line 55
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method
