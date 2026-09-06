.class public Ly/z;
.super Ly/d;
.source "ValueAnimator.java"

# interfaces
.implements Ly/c$a;


# static fields
.field private static I:F = 1.0f

.field private static final J:Ly/n;


# instance fields
.field private A:I

.field private B:Z

.field private C:Z

.field private D:Ly/n;

.field E:[Ly/w;

.field F:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ly/w;",
            ">;"
        }
    .end annotation
.end field

.field private G:F

.field H:Ljava/lang/String;

.field k:J

.field l:F

.field private m:J

.field private n:Z

.field private o:Z

.field private p:F

.field private q:F

.field private r:J

.field private s:Z

.field private t:Z

.field private u:Z

.field v:Z

.field private w:Z

.field private x:J

.field private y:J

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ly/a;

    .line 2
    .line 3
    invoke-direct {v0}, Ly/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ly/z;->J:Ly/n;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ly/d;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ly/z;->k:J

    .line 7
    .line 8
    const/high16 v2, -0x40800000    # -1.0f

    .line 9
    .line 10
    iput v2, p0, Ly/z;->l:F

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    iput-boolean v3, p0, Ly/z;->n:Z

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    iput v4, p0, Ly/z;->p:F

    .line 17
    .line 18
    iput v4, p0, Ly/z;->q:F

    .line 19
    .line 20
    iput-wide v0, p0, Ly/z;->r:J

    .line 21
    .line 22
    iput-boolean v3, p0, Ly/z;->s:Z

    .line 23
    .line 24
    iput-boolean v3, p0, Ly/z;->t:Z

    .line 25
    .line 26
    iput-boolean v3, p0, Ly/z;->u:Z

    .line 27
    .line 28
    iput-boolean v3, p0, Ly/z;->v:Z

    .line 29
    .line 30
    iput-boolean v3, p0, Ly/z;->w:Z

    .line 31
    .line 32
    const-wide/16 v0, 0x12c

    .line 33
    .line 34
    iput-wide v0, p0, Ly/z;->x:J

    .line 35
    .line 36
    const-wide/16 v0, 0x0

    .line 37
    .line 38
    iput-wide v0, p0, Ly/z;->y:J

    .line 39
    .line 40
    iput v3, p0, Ly/z;->z:I

    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput v0, p0, Ly/z;->A:I

    .line 44
    .line 45
    iput-boolean v0, p0, Ly/z;->B:Z

    .line 46
    .line 47
    iput-boolean v3, p0, Ly/z;->C:Z

    .line 48
    .line 49
    sget-object v0, Ly/z;->J:Ly/n;

    .line 50
    .line 51
    iput-object v0, p0, Ly/z;->D:Ly/n;

    .line 52
    .line 53
    iput v2, p0, Ly/z;->G:F

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Ly/z;->H:Ljava/lang/String;

    .line 57
    .line 58
    return-void
.end method

.method private A()V
    .locals 5

    .line 1
    iget-object v0, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ly/z;->u:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Ly/d$a;

    .line 27
    .line 28
    iget-boolean v4, p0, Ly/z;->o:Z

    .line 29
    .line 30
    invoke-interface {v3, p0, v4}, Ly/d$a;->e(Ly/d;Z)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Ly/z;->u:Z

    .line 38
    .line 39
    return-void
.end method

.method public static varargs B([F)Ly/z;
    .locals 1

    .line 1
    new-instance v0, Ly/z;

    .line 2
    .line 3
    invoke-direct {v0}, Ly/z;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ly/z;->H([F)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method private C()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ly/z;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Ly/d;->l(Ly/c$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private D()F
    .locals 1

    .line 1
    iget p0, p0, Ly/z;->G:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float v0, p0, v0

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    sget p0, Ly/z;->I:F

    .line 10
    .line 11
    return p0
.end method

.method private K(IZ)Z
    .locals 2

    .line 1
    if-lez p1, :cond_4

    .line 2
    .line 3
    iget v0, p0, Ly/z;->A:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_4

    .line 7
    .line 8
    iget p0, p0, Ly/z;->z:I

    .line 9
    .line 10
    add-int/lit8 v0, p0, 0x1

    .line 11
    .line 12
    if-lt p1, v0, :cond_0

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    if-ne p0, v0, :cond_4

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    const/4 v0, 0x1

    .line 19
    if-eqz p2, :cond_2

    .line 20
    .line 21
    rem-int/2addr p1, v1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    return v0

    .line 25
    :cond_1
    return p0

    .line 26
    :cond_2
    rem-int/2addr p1, v1

    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    return p0

    .line 31
    :cond_4
    return p2
.end method

.method private M(Z)V
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iput-boolean p1, p0, Ly/z;->o:Z

    .line 8
    .line 9
    iget-boolean v0, p0, Ly/z;->C:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    xor-int/2addr v0, v1

    .line 13
    iput-boolean v0, p0, Ly/z;->B:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/high16 v2, -0x40800000    # -1.0f

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget p1, p0, Ly/z;->l:F

    .line 21
    .line 22
    cmpl-float v3, p1, v2

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    cmpl-float v3, p1, v0

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    iget v3, p0, Ly/z;->z:I

    .line 31
    .line 32
    const/4 v4, -0x1

    .line 33
    if-ne v3, v4, :cond_0

    .line 34
    .line 35
    float-to-double v3, p1

    .line 36
    float-to-double v5, p1

    .line 37
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v5

    .line 41
    sub-double/2addr v3, v5

    .line 42
    double-to-float p1, v3

    .line 43
    const/high16 v3, 0x3f800000    # 1.0f

    .line 44
    .line 45
    sub-float/2addr v3, p1

    .line 46
    iput v3, p0, Ly/z;->l:F

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    add-int/2addr v3, v1

    .line 50
    int-to-float v3, v3

    .line 51
    sub-float/2addr v3, p1

    .line 52
    iput v3, p0, Ly/z;->l:F

    .line 53
    .line 54
    :cond_1
    :goto_0
    iput-boolean v1, p0, Ly/z;->t:Z

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p0, Ly/d;->j:Z

    .line 58
    .line 59
    iput-boolean p1, p0, Ly/z;->s:Z

    .line 60
    .line 61
    iput-boolean p1, p0, Ly/z;->w:Z

    .line 62
    .line 63
    const-wide/16 v3, -0x1

    .line 64
    .line 65
    iput-wide v3, p0, Ly/z;->r:J

    .line 66
    .line 67
    iput-wide v3, p0, Ly/z;->k:J

    .line 68
    .line 69
    iget-wide v3, p0, Ly/z;->y:J

    .line 70
    .line 71
    const-wide/16 v5, 0x0

    .line 72
    .line 73
    cmp-long p1, v3, v5

    .line 74
    .line 75
    if-eqz p1, :cond_2

    .line 76
    .line 77
    iget p1, p0, Ly/z;->l:F

    .line 78
    .line 79
    cmpl-float p1, p1, v0

    .line 80
    .line 81
    if-gez p1, :cond_2

    .line 82
    .line 83
    iget-boolean p1, p0, Ly/z;->o:Z

    .line 84
    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    :cond_2
    invoke-direct {p0}, Ly/z;->N()V

    .line 88
    .line 89
    .line 90
    iget p1, p0, Ly/z;->l:F

    .line 91
    .line 92
    cmpl-float v0, p1, v2

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    invoke-virtual {p0, v5, v6}, Ly/z;->F(J)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    invoke-virtual {p0, p1}, Ly/z;->E(F)V

    .line 101
    .line 102
    .line 103
    :cond_4
    :goto_1
    invoke-direct {p0}, Ly/z;->m()V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_5
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 108
    .line 109
    const-string p1, "Animators may only be run on Looper threads"

    .line 110
    .line 111
    invoke-direct {p0, p1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw p0
.end method

.method private N()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ly/z;->w:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ly/z;->y()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ly/z;->s:Z

    .line 9
    .line 10
    iget v0, p0, Ly/z;->l:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    cmpl-float v2, v0, v1

    .line 14
    .line 15
    if-ltz v2, :cond_0

    .line 16
    .line 17
    iput v0, p0, Ly/z;->p:F

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iput v1, p0, Ly/z;->p:F

    .line 21
    .line 22
    :goto_0
    iget-object v0, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-direct {p0}, Ly/z;->A()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ly/z;->B:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Ly/d;->a(Ly/c$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private p(F)F
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget p0, p0, Ly/z;->z:I

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    add-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    int-to-float p0, p0

    .line 15
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    return p1
.end method

.method private r()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ly/z;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-direct {p0}, Ly/z;->C()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ly/z;->w:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Ly/d;->j:Z

    .line 14
    .line 15
    iget-boolean v2, p0, Ly/z;->t:Z

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    iget-boolean v2, p0, Ly/z;->s:Z

    .line 20
    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    :cond_1
    iget-object v2, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    move v0, v1

    .line 29
    :goto_0
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-boolean v2, p0, Ly/z;->s:Z

    .line 32
    .line 33
    if-nez v2, :cond_3

    .line 34
    .line 35
    invoke-direct {p0}, Ly/z;->A()V

    .line 36
    .line 37
    .line 38
    :cond_3
    iput-boolean v1, p0, Ly/z;->s:Z

    .line 39
    .line 40
    iput-boolean v1, p0, Ly/z;->t:Z

    .line 41
    .line 42
    iput-boolean v1, p0, Ly/z;->u:Z

    .line 43
    .line 44
    const-wide/16 v2, -0x1

    .line 45
    .line 46
    iput-wide v2, p0, Ly/z;->r:J

    .line 47
    .line 48
    iput-wide v2, p0, Ly/z;->k:J

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    iget-object v0, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    move v3, v1

    .line 67
    :goto_1
    if-ge v3, v2, :cond_4

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Ly/d$a;

    .line 74
    .line 75
    iget-boolean v5, p0, Ly/z;->o:Z

    .line 76
    .line 77
    invoke-interface {v4, p0, v5}, Ly/d$a;->b(Ly/d;Z)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v3, v3, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    iput-boolean v1, p0, Ly/z;->o:Z

    .line 84
    .line 85
    return-void
.end method

.method private u(F)I
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ly/z;->p(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    float-to-double v0, p0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    cmpl-double p1, v0, v2

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    cmpl-float p0, p0, p1

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    sub-double/2addr v2, p0

    .line 22
    :cond_0
    double-to-int p0, v2

    .line 23
    return p0
.end method

.method private v(FZ)F
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ly/z;->p(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Ly/z;->u(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v1, v0

    .line 10
    sub-float/2addr p1, v1

    .line 11
    invoke-direct {p0, v0, p2}, Ly/z;->K(IZ)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/high16 p0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    sub-float/2addr p0, p1

    .line 20
    return p0

    .line 21
    :cond_0
    return p1
.end method

.method private w()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ly/z;->x:J

    .line 2
    .line 3
    long-to-float v0, v0

    .line 4
    invoke-direct {p0}, Ly/z;->D()F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    mul-float/2addr v0, p0

    .line 9
    float-to-long v0, v0

    .line 10
    return-wide v0
.end method

.method private z()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ly/z;->r:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-ltz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public E(F)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ly/z;->y()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ly/z;->p(F)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-direct {p0}, Ly/z;->z()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Ly/z;->w()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    long-to-float v0, v0

    .line 19
    mul-float/2addr v0, p1

    .line 20
    float-to-long v0, v0

    .line 21
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sub-long/2addr v2, v0

    .line 26
    iput-wide v2, p0, Ly/z;->k:J

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput p1, p0, Ly/z;->l:F

    .line 30
    .line 31
    :goto_0
    iput p1, p0, Ly/z;->p:F

    .line 32
    .line 33
    iget-boolean v0, p0, Ly/z;->o:Z

    .line 34
    .line 35
    invoke-direct {p0, p1, v0}, Ly/z;->v(FZ)F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, p1}, Ly/z;->o(F)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ly/z;->x:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-lez v2, :cond_0

    .line 8
    .line 9
    long-to-float p1, p1

    .line 10
    long-to-float p2, v0

    .line 11
    div-float/2addr p1, p2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0, p1}, Ly/z;->E(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public G(J)Ly/z;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Ly/z;->x:J

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "Animators cannot have negative duration: "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw p0
.end method

.method public varargs H([F)V
    .locals 3

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_2

    .line 7
    :cond_0
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    array-length v2, v0

    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    aget-object v0, v0, v1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ly/w;->o([F)V

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_2
    :goto_0
    const-string v0, ""

    .line 23
    .line 24
    invoke-static {v0, p1}, Ly/w;->m(Ljava/lang/String;[F)Ly/w;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ly/w;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ly/z;->J([Ly/w;)V

    .line 33
    .line 34
    .line 35
    :goto_1
    iput-boolean v1, p0, Ly/z;->v:Z

    .line 36
    .line 37
    :cond_3
    :goto_2
    return-void
.end method

.method public I(Ly/n;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ly/z;->D:Ly/n;

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p1, Ly/r;

    .line 7
    .line 8
    invoke-direct {p1}, Ly/r;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ly/z;->D:Ly/n;

    .line 12
    .line 13
    return-void
.end method

.method public varargs J([Ly/w;)V
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    iput-object p1, p0, Ly/z;->E:[Ly/w;

    .line 3
    .line 4
    new-instance v1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ly/z;->F:Ljava/util/HashMap;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    if-ge v2, v0, :cond_0

    .line 14
    .line 15
    aget-object v3, p1, v2

    .line 16
    .line 17
    iget-object v4, p0, Ly/z;->F:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v3}, Ly/w;->i()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iput-boolean v1, p0, Ly/z;->v:Z

    .line 30
    .line 31
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ly/z;->M(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public cancel()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-boolean v0, p0, Ly/z;->w:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean v0, p0, Ly/z;->t:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Ly/z;->s:Z

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-boolean v0, p0, Ly/z;->s:Z

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    invoke-direct {p0}, Ly/z;->A()V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ly/d$a;

    .line 54
    .line 55
    invoke-interface {v1, p0}, Ly/d$a;->g(Ly/d;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    invoke-direct {p0}, Ly/z;->r()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_4
    new-instance p0, Landroid/util/AndroidRuntimeException;

    .line 64
    .line 65
    const-string v0, "Animators may only be run on Looper threads"

    .line 66
    .line 67
    invoke-direct {p0, v0}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/z;->q()Ly/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d()Ly/d;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/z;->q()Ly/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final doAnimationFrame(J)Z
    .locals 8

    .line 1
    iget-wide v0, p0, Ly/z;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ly/z;->o:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move-wide v0, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-wide v0, p0, Ly/z;->y:J

    .line 16
    .line 17
    long-to-float v0, v0

    .line 18
    invoke-direct {p0}, Ly/z;->D()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    mul-float/2addr v0, v1

    .line 23
    float-to-long v0, v0

    .line 24
    add-long/2addr v0, p1

    .line 25
    :goto_0
    iput-wide v0, p0, Ly/z;->k:J

    .line 26
    .line 27
    :cond_1
    iget-boolean v0, p0, Ly/d;->j:Z

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iput-wide p1, p0, Ly/z;->m:J

    .line 33
    .line 34
    invoke-direct {p0}, Ly/z;->C()V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    iget-boolean v0, p0, Ly/z;->n:Z

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iput-boolean v1, p0, Ly/z;->n:Z

    .line 43
    .line 44
    iget-wide v4, p0, Ly/z;->m:J

    .line 45
    .line 46
    cmp-long v0, v4, v2

    .line 47
    .line 48
    if-lez v0, :cond_3

    .line 49
    .line 50
    iget-wide v6, p0, Ly/z;->k:J

    .line 51
    .line 52
    sub-long v4, p1, v4

    .line 53
    .line 54
    add-long/2addr v6, v4

    .line 55
    iput-wide v6, p0, Ly/z;->k:J

    .line 56
    .line 57
    :cond_3
    iget-boolean v0, p0, Ly/z;->s:Z

    .line 58
    .line 59
    const/high16 v4, -0x40800000    # -1.0f

    .line 60
    .line 61
    if-nez v0, :cond_5

    .line 62
    .line 63
    iget-wide v5, p0, Ly/z;->k:J

    .line 64
    .line 65
    cmp-long v0, v5, p1

    .line 66
    .line 67
    if-lez v0, :cond_4

    .line 68
    .line 69
    iget v0, p0, Ly/z;->l:F

    .line 70
    .line 71
    cmpl-float v0, v0, v4

    .line 72
    .line 73
    if-nez v0, :cond_4

    .line 74
    .line 75
    return v1

    .line 76
    :cond_4
    const/4 v0, 0x1

    .line 77
    iput-boolean v0, p0, Ly/z;->s:Z

    .line 78
    .line 79
    invoke-direct {p0}, Ly/z;->N()V

    .line 80
    .line 81
    .line 82
    :cond_5
    iget-wide v0, p0, Ly/z;->r:J

    .line 83
    .line 84
    cmp-long v0, v0, v2

    .line 85
    .line 86
    if-gez v0, :cond_6

    .line 87
    .line 88
    iget v0, p0, Ly/z;->l:F

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    cmpl-float v0, v0, v1

    .line 92
    .line 93
    if-ltz v0, :cond_6

    .line 94
    .line 95
    invoke-direct {p0}, Ly/z;->w()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    long-to-float v0, v0

    .line 100
    iget v1, p0, Ly/z;->l:F

    .line 101
    .line 102
    mul-float/2addr v0, v1

    .line 103
    float-to-long v0, v0

    .line 104
    sub-long v0, p1, v0

    .line 105
    .line 106
    iput-wide v0, p0, Ly/z;->k:J

    .line 107
    .line 108
    iput v4, p0, Ly/z;->l:F

    .line 109
    .line 110
    :cond_6
    iput-wide p1, p0, Ly/z;->r:J

    .line 111
    .line 112
    iget-wide v0, p0, Ly/z;->k:J

    .line 113
    .line 114
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 115
    .line 116
    .line 117
    move-result-wide p1

    .line 118
    invoke-virtual {p0, p1, p2}, Ly/z;->n(J)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_7

    .line 123
    .line 124
    invoke-direct {p0}, Ly/z;->r()V

    .line 125
    .line 126
    .line 127
    :cond_7
    return p1
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ly/z;->s:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ly/z;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ly/d;->j:Z

    .line 2
    .line 3
    invoke-super {p0}, Ly/d;->i()V

    .line 4
    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Ly/d;->j:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    iput-wide v0, p0, Ly/z;->m:J

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Ly/z;->n:Z

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method n(J)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Ly/z;->s:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    invoke-direct {p0}, Ly/z;->w()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    const-wide/16 v4, 0x0

    .line 11
    .line 12
    cmp-long v0, v2, v4

    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    iget-wide v4, p0, Ly/z;->k:J

    .line 17
    .line 18
    sub-long/2addr p1, v4

    .line 19
    long-to-float p1, p1

    .line 20
    long-to-float p2, v2

    .line 21
    div-float/2addr p1, p2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    :goto_0
    iget p2, p0, Ly/z;->p:F

    .line 26
    .line 27
    float-to-int v2, p1

    .line 28
    float-to-int p2, p2

    .line 29
    const/4 v3, 0x1

    .line 30
    if-le v2, p2, :cond_1

    .line 31
    .line 32
    move p2, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move p2, v1

    .line 35
    :goto_1
    iget v2, p0, Ly/z;->z:I

    .line 36
    .line 37
    add-int/lit8 v4, v2, 0x1

    .line 38
    .line 39
    int-to-float v4, v4

    .line 40
    cmpl-float v4, p1, v4

    .line 41
    .line 42
    if-ltz v4, :cond_2

    .line 43
    .line 44
    const/4 v4, -0x1

    .line 45
    if-eq v2, v4, :cond_2

    .line 46
    .line 47
    move v2, v3

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v2, v1

    .line 50
    :goto_2
    if-nez v0, :cond_3

    .line 51
    .line 52
    :goto_3
    move v1, v3

    .line 53
    goto :goto_5

    .line 54
    :cond_3
    if-eqz p2, :cond_4

    .line 55
    .line 56
    if-nez v2, :cond_4

    .line 57
    .line 58
    iget-object p2, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 59
    .line 60
    if-eqz p2, :cond_5

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    move v0, v1

    .line 67
    :goto_4
    if-ge v0, p2, :cond_5

    .line 68
    .line 69
    iget-object v2, p0, Ly/d;->g:Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Ly/d$a;

    .line 76
    .line 77
    invoke-interface {v2, p0}, Ly/d$a;->d(Ly/d;)V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_4

    .line 83
    :cond_4
    if-eqz v2, :cond_5

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_5
    :goto_5
    invoke-direct {p0, p1}, Ly/z;->p(F)F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput p1, p0, Ly/z;->p:F

    .line 91
    .line 92
    iget-boolean p2, p0, Ly/z;->o:Z

    .line 93
    .line 94
    invoke-direct {p0, p1, p2}, Ly/z;->v(FZ)F

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    invoke-virtual {p0, p1}, Ly/z;->o(F)V

    .line 99
    .line 100
    .line 101
    :cond_6
    return v1
.end method

.method o(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ly/z;->D:Ly/n;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ly/n;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ly/z;->q:F

    .line 8
    .line 9
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, v0, :cond_0

    .line 15
    .line 16
    iget-object v3, p0, Ly/z;->E:[Ly/w;

    .line 17
    .line 18
    aget-object v3, v3, v2

    .line 19
    .line 20
    invoke-virtual {v3, p1}, Ly/w;->a(F)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Ly/d;->i:Ljava/util/ArrayList;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    :goto_1
    if-ge v1, p1, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ly/d;->i:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ly/d$c;

    .line 43
    .line 44
    invoke-interface {v0, p0}, Ly/d$c;->a(Ly/d;)V

    .line 45
    .line 46
    .line 47
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    return-void
.end method

.method public q()Ly/z;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ly/d;->d()Ly/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ly/z;

    .line 6
    .line 7
    iget-object v1, p0, Ly/d;->i:Ljava/util/ArrayList;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object v2, p0, Ly/d;->i:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Ly/d;->i:Ljava/util/ArrayList;

    .line 19
    .line 20
    :cond_0
    const/high16 v1, -0x40800000    # -1.0f

    .line 21
    .line 22
    iput v1, v0, Ly/z;->l:F

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, v0, Ly/z;->o:Z

    .line 26
    .line 27
    iput-boolean v1, v0, Ly/z;->v:Z

    .line 28
    .line 29
    iput-boolean v1, v0, Ly/z;->t:Z

    .line 30
    .line 31
    iput-boolean v1, v0, Ly/z;->s:Z

    .line 32
    .line 33
    iput-boolean v1, v0, Ly/d;->j:Z

    .line 34
    .line 35
    iput-boolean v1, v0, Ly/z;->n:Z

    .line 36
    .line 37
    iput-boolean v1, v0, Ly/z;->u:Z

    .line 38
    .line 39
    const-wide/16 v2, -0x1

    .line 40
    .line 41
    iput-wide v2, v0, Ly/z;->k:J

    .line 42
    .line 43
    iput-boolean v1, v0, Ly/z;->w:Z

    .line 44
    .line 45
    iput-wide v2, v0, Ly/z;->m:J

    .line 46
    .line 47
    iput-wide v2, v0, Ly/z;->r:J

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    iput v2, v0, Ly/z;->p:F

    .line 51
    .line 52
    iput v2, v0, Ly/z;->q:F

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    iput-boolean v2, v0, Ly/z;->B:Z

    .line 56
    .line 57
    iput-boolean v1, v0, Ly/z;->C:Z

    .line 58
    .line 59
    iget-object p0, p0, Ly/z;->E:[Ly/w;

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    array-length v2, p0

    .line 64
    new-array v3, v2, [Ly/w;

    .line 65
    .line 66
    iput-object v3, v0, Ly/z;->E:[Ly/w;

    .line 67
    .line 68
    new-instance v3, Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-direct {v3, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 71
    .line 72
    .line 73
    iput-object v3, v0, Ly/z;->F:Ljava/util/HashMap;

    .line 74
    .line 75
    :goto_0
    if-ge v1, v2, :cond_1

    .line 76
    .line 77
    aget-object v3, p0, v1

    .line 78
    .line 79
    invoke-virtual {v3}, Ly/w;->b()Ly/w;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iget-object v4, v0, Ly/z;->E:[Ly/w;

    .line 84
    .line 85
    aput-object v3, v4, v1

    .line 86
    .line 87
    iget-object v4, v0, Ly/z;->F:Ljava/util/HashMap;

    .line 88
    .line 89
    invoke-virtual {v3}, Ly/w;->i()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    return-object v0
.end method

.method public s()F
    .locals 0

    .line 1
    iget p0, p0, Ly/z;->q:F

    .line 2
    .line 3
    return p0
.end method

.method public t()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ly/z;->E:[Ly/w;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object p0, p0, v0

    .line 10
    .line 11
    invoke-virtual {p0}, Ly/w;->d()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ValueAnimator@"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ly/z;->E:[Ly/w;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    iget-object v2, p0, Ly/z;->E:[Ly/w;

    .line 32
    .line 33
    array-length v2, v2

    .line 34
    if-ge v1, v2, :cond_0

    .line 35
    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, "\n    "

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 50
    .line 51
    aget-object v0, v0, v1

    .line 52
    .line 53
    invoke-virtual {v0}, Ly/w;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return-object v0
.end method

.method public x()[Ly/w;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ArrayReturn"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ly/z;->E:[Ly/w;

    .line 2
    .line 3
    return-object p0
.end method

.method y()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ly/z;->v:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Ly/z;->E:[Ly/w;

    .line 12
    .line 13
    aget-object v2, v2, v1

    .line 14
    .line 15
    invoke-virtual {v2}, Ly/w;->k()V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ly/z;->v:Z

    .line 23
    .line 24
    :cond_1
    return-void
.end method
