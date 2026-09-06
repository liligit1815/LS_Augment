.class public final LV1/b;
.super Ljava/lang/Object;
.source "BubbleAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LV1/b$a;,
        LV1/b$b;,
        LV1/b$c;
    }
.end annotation


# static fields
.field public static final g:LV1/b$a;


# instance fields
.field private final a:F

.field private final b:F

.field private final c:I

.field private final d:Z

.field private e:LV1/b$c;

.field private f:Ly/z;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LV1/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LV1/b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LV1/b;->g:LV1/b$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(FFIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LV1/b;->a:F

    .line 5
    .line 6
    iput p2, p0, LV1/b;->b:F

    .line 7
    .line 8
    iput p3, p0, LV1/b;->c:I

    .line 9
    .line 10
    iput-boolean p4, p0, LV1/b;->d:Z

    .line 11
    .line 12
    sget-object p1, LV1/b$c$c;->a:LV1/b$c$c;

    .line 13
    .line 14
    iput-object p1, p0, LV1/b;->e:LV1/b$c;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(LV1/b$b;Ly/d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, LV1/b;->i(LV1/b$b;Ly/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic b(LV1/b;LV1/b$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LV1/b;->e:LV1/b$c;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic f(LV1/b;ILjava/lang/Integer;LV1/b$b;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x2

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, LV1/b;->e(ILjava/lang/Integer;LV1/b$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final h(LV1/b$b;)Ly/z;
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ly/z;->B([F)Ly/z;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0xfa

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ly/z;->G(J)Ly/z;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, LV1/a;

    .line 18
    .line 19
    invoke-direct {v1, p1}, LV1/a;-><init>(LV1/b$b;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ly/d;->c(Ly/d$c;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, LV1/b$d;

    .line 26
    .line 27
    invoke-direct {v1, p1, p0}, LV1/b$d;-><init>(LV1/b$b;LV1/b;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ly/d;->b(Ly/d$a;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static final i(LV1/b$b;Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "null cannot be cast to non-null type androidx.core.animation.ValueAnimator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    check-cast p1, Ly/z;

    .line 7
    .line 8
    invoke-virtual {p1}, Ly/z;->s()F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-interface {p0, p1}, LV1/b$b;->c(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final k(LV1/b$c$a;)F
    .locals 4

    .line 1
    iget v0, p0, LV1/b;->c:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    invoke-virtual {p1}, LV1/b$c$a;->d()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, LV1/b$c$a;->a()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-le v1, v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, LV1/b$c$a;->b()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p1}, LV1/b$c$a;->c()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-le v2, p1, :cond_1

    .line 26
    .line 27
    add-int/lit8 v2, v2, -0x1

    .line 28
    .line 29
    :cond_1
    iget p1, p0, LV1/b;->a:F

    .line 30
    .line 31
    iget v3, p0, LV1/b;->b:F

    .line 32
    .line 33
    add-float/2addr p1, v3

    .line 34
    invoke-direct {p0, v1, v0}, LV1/b;->q(II)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-float v1, v1

    .line 39
    mul-float/2addr v1, p1

    .line 40
    invoke-direct {p0, v2, v0}, LV1/b;->q(II)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    int-to-float v0, v0

    .line 45
    mul-float/2addr v0, p1

    .line 46
    sub-float/2addr v0, v1

    .line 47
    iget-object p1, p0, LV1/b;->f:Ly/z;

    .line 48
    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    const-string p1, "animator"

    .line 52
    .line 53
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    :cond_2
    invoke-virtual {p1}, Ly/z;->s()F

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    mul-float/2addr v0, p1

    .line 62
    add-float/2addr v1, v0

    .line 63
    iget p0, p0, LV1/b;->a:F

    .line 64
    .line 65
    const/high16 p1, 0x40000000    # 2.0f

    .line 66
    .line 67
    div-float/2addr p0, p1

    .line 68
    add-float/2addr v1, p0

    .line 69
    return v1
.end method

.method private final l(LV1/b$c$b;)F
    .locals 7

    .line 1
    iget-object v0, p0, LV1/b;->f:Ly/z;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "animator"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Ly/z;->s()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, LV1/b$c$b;->b()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-direct {p0, v3, v4, v0}, LV1/b;->p(IIF)F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    iget v5, p0, LV1/b;->a:F

    .line 26
    .line 27
    const/high16 v6, 0x40000000    # 2.0f

    .line 28
    .line 29
    div-float/2addr v5, v6

    .line 30
    add-float/2addr v3, v5

    .line 31
    invoke-virtual {p1}, LV1/b$c$b;->a()Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    if-eqz v5, :cond_4

    .line 36
    .line 37
    invoke-virtual {p1}, LV1/b$c$b;->a()Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-nez v5, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    if-nez v5, :cond_2

    .line 49
    .line 50
    move v5, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    :goto_0
    const/high16 v5, 0x3f800000    # 1.0f

    .line 53
    .line 54
    :goto_1
    invoke-virtual {p1}, LV1/b$c$b;->a()Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-direct {p0, p1, v4, v0}, LV1/b;->p(IIF)F

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget v0, p0, LV1/b;->a:F

    .line 67
    .line 68
    mul-float/2addr v0, v5

    .line 69
    div-float/2addr v0, v6

    .line 70
    add-float/2addr p1, v0

    .line 71
    sub-float/2addr p1, v3

    .line 72
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 73
    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    move-object v1, p0

    .line 81
    :goto_2
    invoke-virtual {v1}, Ly/z;->s()F

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    mul-float/2addr p1, p0

    .line 86
    add-float/2addr v3, p1

    .line 87
    :cond_4
    return v3
.end method

.method private final m(LV1/b$c$d;)F
    .locals 6

    .line 1
    invoke-virtual {p1}, LV1/b$c$d;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const-string v3, "animator"

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    const/high16 v5, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-ne v0, v1, :cond_6

    .line 16
    .line 17
    invoke-virtual {p1}, LV1/b$c$d;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_2

    .line 24
    :cond_0
    iget v0, p0, LV1/b;->a:F

    .line 25
    .line 26
    iget v1, p0, LV1/b;->b:F

    .line 27
    .line 28
    add-float/2addr v0, v1

    .line 29
    invoke-virtual {p1}, LV1/b$c$d;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    iget-boolean v1, p0, LV1/b;->d:Z

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget v1, p0, LV1/b;->c:I

    .line 40
    .line 41
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    sub-int/2addr v1, p1

    .line 46
    sub-int/2addr v1, v4

    .line 47
    int-to-float p1, v1

    .line 48
    mul-float/2addr p1, v0

    .line 49
    iget p0, p0, LV1/b;->a:F

    .line 50
    .line 51
    div-float/2addr p0, v5

    .line 52
    add-float/2addr p1, p0

    .line 53
    return p1

    .line 54
    :cond_1
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    int-to-float p1, p1

    .line 59
    mul-float/2addr p1, v0

    .line 60
    iget v1, p0, LV1/b;->a:F

    .line 61
    .line 62
    div-float/2addr v1, v5

    .line 63
    add-float/2addr p1, v1

    .line 64
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 65
    .line 66
    if-nez p0, :cond_2

    .line 67
    .line 68
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    move-object v2, p0

    .line 73
    :goto_0
    invoke-virtual {v2}, Ly/z;->s()F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    mul-float/2addr p0, v0

    .line 78
    sub-float/2addr p1, p0

    .line 79
    return p1

    .line 80
    :cond_3
    iget-boolean v1, p0, LV1/b;->d:Z

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    iget v1, p0, LV1/b;->c:I

    .line 85
    .line 86
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    sub-int/2addr v1, p1

    .line 91
    sub-int/2addr v1, v4

    .line 92
    int-to-float p1, v1

    .line 93
    mul-float/2addr p1, v0

    .line 94
    iget v1, p0, LV1/b;->a:F

    .line 95
    .line 96
    div-float/2addr v1, v5

    .line 97
    add-float/2addr p1, v1

    .line 98
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 99
    .line 100
    if-nez p0, :cond_4

    .line 101
    .line 102
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    move-object v2, p0

    .line 107
    :goto_1
    invoke-virtual {v2}, Ly/z;->s()F

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    mul-float/2addr p0, v0

    .line 112
    sub-float/2addr p1, p0

    .line 113
    return p1

    .line 114
    :cond_5
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    int-to-float p1, p1

    .line 119
    mul-float/2addr p1, v0

    .line 120
    iget p0, p0, LV1/b;->a:F

    .line 121
    .line 122
    div-float/2addr p0, v5

    .line 123
    add-float/2addr p1, p0

    .line 124
    return p1

    .line 125
    :cond_6
    :goto_2
    invoke-virtual {p1}, LV1/b$c$d;->d()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p1}, LV1/b$c$d;->a()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    int-to-float v1, v4

    .line 134
    iget-object v4, p0, LV1/b;->f:Ly/z;

    .line 135
    .line 136
    if-nez v4, :cond_7

    .line 137
    .line 138
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_7
    move-object v2, v4

    .line 143
    :goto_3
    invoke-virtual {v2}, Ly/z;->s()F

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    sub-float/2addr v1, v2

    .line 148
    invoke-direct {p0, v0, p1, v1}, LV1/b;->p(IIF)F

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    iget p0, p0, LV1/b;->a:F

    .line 153
    .line 154
    div-float/2addr p0, v5

    .line 155
    add-float/2addr p1, p0

    .line 156
    return p1
.end method

.method private final o(IIIFF)F
    .locals 14

    .line 1
    move/from16 v1, p2

    .line 2
    .line 3
    move/from16 v2, p3

    .line 4
    .line 5
    iget v3, p0, LV1/b;->a:F

    .line 6
    .line 7
    iget v4, p0, LV1/b;->b:F

    .line 8
    .line 9
    add-float/2addr v4, v3

    .line 10
    const/4 v5, 0x1

    .line 11
    int-to-float v6, v5

    .line 12
    sub-float v7, p4, v6

    .line 13
    .line 14
    mul-float/2addr v7, v3

    .line 15
    const/high16 v8, 0x40000000    # 2.0f

    .line 16
    .line 17
    div-float/2addr v7, v8

    .line 18
    sub-float v6, p5, v6

    .line 19
    .line 20
    mul-float/2addr v6, v3

    .line 21
    div-float/2addr v6, v8

    .line 22
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result v8

    .line 30
    add-int/lit8 v9, v3, 0x1

    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    if-gt v9, p1, :cond_0

    .line 34
    .line 35
    if-ge p1, v8, :cond_0

    .line 36
    .line 37
    move v9, v5

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v9, v10

    .line 40
    :goto_0
    iget-boolean v11, p0, LV1/b;->d:Z

    .line 41
    .line 42
    if-ge v2, v1, :cond_1

    .line 43
    .line 44
    move v12, v5

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v12, v10

    .line 47
    :goto_1
    if-ne v11, v12, :cond_2

    .line 48
    .line 49
    move v11, v5

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v11, v10

    .line 52
    :goto_2
    const/4 v12, 0x2

    .line 53
    const/4 v13, 0x0

    .line 54
    invoke-static {p0, p1, v10, v12, v13}, LV1/b;->r(LV1/b;IIILjava/lang/Object;)I

    .line 55
    .line 56
    .line 57
    move-result v12

    .line 58
    if-eqz v9, :cond_4

    .line 59
    .line 60
    if-eqz v11, :cond_3

    .line 61
    .line 62
    sub-int/2addr v12, v5

    .line 63
    int-to-float p0, v12

    .line 64
    add-float p0, p0, p5

    .line 65
    .line 66
    :goto_3
    mul-float/2addr p0, v4

    .line 67
    return p0

    .line 68
    :cond_3
    sub-int/2addr v12, v5

    .line 69
    int-to-float p0, v12

    .line 70
    add-float p0, p0, p4

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_4
    if-ne p1, v2, :cond_6

    .line 74
    .line 75
    if-eqz v11, :cond_5

    .line 76
    .line 77
    sub-int/2addr v12, v5

    .line 78
    int-to-float p0, v12

    .line 79
    add-float p0, p0, p5

    .line 80
    .line 81
    :goto_4
    mul-float/2addr p0, v4

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    int-to-float p0, v12

    .line 84
    goto :goto_4

    .line 85
    :goto_5
    add-float/2addr p0, v7

    .line 86
    return p0

    .line 87
    :cond_6
    if-ne p1, v1, :cond_8

    .line 88
    .line 89
    if-eqz v11, :cond_7

    .line 90
    .line 91
    int-to-float v0, v12

    .line 92
    iget v1, p0, LV1/b;->a:F

    .line 93
    .line 94
    mul-float/2addr v0, v1

    .line 95
    sub-int/2addr v12, v5

    .line 96
    int-to-float v1, v12

    .line 97
    add-float v1, v1, p5

    .line 98
    .line 99
    iget p0, p0, LV1/b;->b:F

    .line 100
    .line 101
    mul-float/2addr v1, p0

    .line 102
    add-float/2addr v0, v1

    .line 103
    goto :goto_6

    .line 104
    :cond_7
    sub-int/2addr v12, v5

    .line 105
    int-to-float p0, v12

    .line 106
    add-float p0, p0, p4

    .line 107
    .line 108
    mul-float v0, p0, v4

    .line 109
    .line 110
    :goto_6
    add-float/2addr v0, v6

    .line 111
    return v0

    .line 112
    :cond_8
    iget-boolean p0, p0, LV1/b;->d:Z

    .line 113
    .line 114
    if-eqz p0, :cond_a

    .line 115
    .line 116
    if-ge p1, v3, :cond_9

    .line 117
    .line 118
    goto :goto_7

    .line 119
    :cond_9
    move v5, v10

    .line 120
    goto :goto_7

    .line 121
    :cond_a
    if-le p1, v8, :cond_9

    .line 122
    .line 123
    :goto_7
    sub-int/2addr v12, v5

    .line 124
    int-to-float p0, v12

    .line 125
    goto :goto_3
.end method

.method private final p(IIF)F
    .locals 6

    .line 1
    iget v0, p0, LV1/b;->a:F

    .line 2
    .line 3
    iget v1, p0, LV1/b;->b:F

    .line 4
    .line 5
    add-float v2, v0, v1

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    int-to-float v4, v3

    .line 9
    sub-float/2addr v4, p3

    .line 10
    neg-float v4, v4

    .line 11
    mul-float/2addr v4, v0

    .line 12
    const/high16 v5, 0x40000000    # 2.0f

    .line 13
    .line 14
    div-float/2addr v4, v5

    .line 15
    iget-boolean v5, p0, LV1/b;->d:Z

    .line 16
    .line 17
    if-eqz v5, :cond_2

    .line 18
    .line 19
    if-ge p1, p2, :cond_0

    .line 20
    .line 21
    iget p0, p0, LV1/b;->c:I

    .line 22
    .line 23
    sub-int/2addr p0, p1

    .line 24
    add-int/lit8 p0, p0, -0x2

    .line 25
    .line 26
    int-to-float p0, p0

    .line 27
    add-float/2addr p0, p3

    .line 28
    :goto_0
    mul-float/2addr p0, v2

    .line 29
    return p0

    .line 30
    :cond_0
    if-ne p1, p2, :cond_1

    .line 31
    .line 32
    iget p0, p0, LV1/b;->c:I

    .line 33
    .line 34
    sub-int p2, p0, p1

    .line 35
    .line 36
    sub-int/2addr p2, v3

    .line 37
    int-to-float p2, p2

    .line 38
    mul-float/2addr p2, v0

    .line 39
    sub-int/2addr p0, p1

    .line 40
    add-int/lit8 p0, p0, -0x2

    .line 41
    .line 42
    int-to-float p0, p0

    .line 43
    mul-float/2addr p0, v1

    .line 44
    mul-float/2addr p3, v1

    .line 45
    add-float/2addr p2, p0

    .line 46
    add-float/2addr p2, p3

    .line 47
    add-float/2addr p2, v4

    .line 48
    return p2

    .line 49
    :cond_1
    iget p0, p0, LV1/b;->c:I

    .line 50
    .line 51
    sub-int/2addr p0, p1

    .line 52
    sub-int/2addr p0, v3

    .line 53
    int-to-float p0, p0

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    if-ge p1, p2, :cond_3

    .line 56
    .line 57
    int-to-float p0, p1

    .line 58
    mul-float/2addr v2, p0

    .line 59
    return v2

    .line 60
    :cond_3
    if-ne p1, p2, :cond_4

    .line 61
    .line 62
    int-to-float p0, p1

    .line 63
    mul-float/2addr v2, p0

    .line 64
    add-float/2addr v2, v4

    .line 65
    return v2

    .line 66
    :cond_4
    sub-int/2addr p1, v3

    .line 67
    int-to-float p0, p1

    .line 68
    add-float/2addr p0, p3

    .line 69
    mul-float/2addr v2, p0

    .line 70
    return v2
.end method

.method private final q(II)I
    .locals 0

    .line 1
    iget-boolean p0, p0, LV1/b;->d:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sub-int/2addr p2, p1

    .line 6
    add-int/lit8 p2, p2, -0x1

    .line 7
    .line 8
    return p2

    .line 9
    :cond_0
    return p1
.end method

.method static synthetic r(LV1/b;IIILjava/lang/Object;)I
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    iget p2, p0, LV1/b;->c:I

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0, p1, p2}, LV1/b;->q(II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public final c(IIIILV1/b$b;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p5}, LV1/b;->h(LV1/b$b;)Ly/z;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    iput-object p5, p0, LV1/b;->f:Ly/z;

    .line 11
    .line 12
    new-instance p5, LV1/b$c$a;

    .line 13
    .line 14
    invoke-direct {p5, p1, p2, p3, p4}, LV1/b$c$a;-><init>(IIII)V

    .line 15
    .line 16
    .line 17
    iput-object p5, p0, LV1/b;->e:LV1/b$c;

    .line 18
    .line 19
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const-string p0, "animator"

    .line 24
    .line 25
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ly/z;->L()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final d(ILV1/b$b;)V
    .locals 7

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v5, 0x2

    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move v2, p1

    .line 11
    move-object v4, p2

    .line 12
    invoke-static/range {v1 .. v6}, LV1/b;->f(LV1/b;ILjava/lang/Integer;LV1/b$b;ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e(ILjava/lang/Integer;LV1/b$b;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p3}, LV1/b;->h(LV1/b$b;)Ly/z;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    iput-object p3, p0, LV1/b;->f:Ly/z;

    .line 11
    .line 12
    new-instance p3, LV1/b$c$b;

    .line 13
    .line 14
    invoke-direct {p3, p1, p2}, LV1/b$c$b;-><init>(ILjava/lang/Integer;)V

    .line 15
    .line 16
    .line 17
    iput-object p3, p0, LV1/b;->e:LV1/b$c;

    .line 18
    .line 19
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const-string p0, "animator"

    .line 24
    .line 25
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ly/z;->L()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g(IIZZLV1/b$b;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p5}, LV1/b;->h(LV1/b$b;)Ly/z;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    iput-object p5, p0, LV1/b;->f:Ly/z;

    .line 11
    .line 12
    new-instance p5, LV1/b$c$d;

    .line 13
    .line 14
    invoke-direct {p5, p1, p2, p3, p4}, LV1/b$c$d;-><init>(IIZZ)V

    .line 15
    .line 16
    .line 17
    iput-object p5, p0, LV1/b;->e:LV1/b$c;

    .line 18
    .line 19
    iget-object p0, p0, LV1/b;->f:Ly/z;

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const-string p0, "animator"

    .line 24
    .line 25
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ly/z;->L()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final j()F
    .locals 2

    .line 1
    iget-object v0, p0, LV1/b;->e:LV1/b$c;

    .line 2
    .line 3
    sget-object v1, LV1/b$c$c;->a:LV1/b$c$c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    instance-of v1, v0, LV1/b$c$b;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, LV1/b$c$b;

    .line 18
    .line 19
    invoke-direct {p0, v0}, LV1/b;->l(LV1/b$c$b;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    instance-of v1, v0, LV1/b$c$d;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    check-cast v0, LV1/b$c$d;

    .line 29
    .line 30
    invoke-direct {p0, v0}, LV1/b;->m(LV1/b$c$d;)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_2
    instance-of v1, v0, LV1/b$c$a;

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    check-cast v0, LV1/b$c$a;

    .line 40
    .line 41
    invoke-direct {p0, v0}, LV1/b;->k(LV1/b$c$a;)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_3
    new-instance p0, Lh4/j;

    .line 47
    .line 48
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 49
    .line 50
    .line 51
    throw p0
.end method

.method public final n(I)F
    .locals 11

    .line 1
    iget-object v0, p0, LV1/b;->e:LV1/b$c;

    .line 2
    .line 3
    sget-object v1, LV1/b$c$c;->a:LV1/b$c$c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    instance-of v1, v0, LV1/b$c$b;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, "animator"

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, LV1/b;->f:Ly/z;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object v2, v0

    .line 29
    :goto_0
    invoke-virtual {v2}, Ly/z;->s()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, p1, v1, v0}, LV1/b;->p(IIF)F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_2
    instance-of v1, v0, LV1/b$c$d;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    if-eqz v1, :cond_4

    .line 43
    .line 44
    check-cast v0, LV1/b$c$d;

    .line 45
    .line 46
    invoke-virtual {v0}, LV1/b$c$d;->a()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    int-to-float v1, v4

    .line 51
    iget-object v4, p0, LV1/b;->f:Ly/z;

    .line 52
    .line 53
    if-nez v4, :cond_3

    .line 54
    .line 55
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    move-object v2, v4

    .line 60
    :goto_1
    invoke-virtual {v2}, Ly/z;->s()F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    sub-float/2addr v1, v2

    .line 65
    invoke-direct {p0, p1, v0, v1}, LV1/b;->p(IIF)F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :cond_4
    instance-of v1, v0, LV1/b$c$a;

    .line 71
    .line 72
    if-eqz v1, :cond_7

    .line 73
    .line 74
    check-cast v0, LV1/b$c$a;

    .line 75
    .line 76
    invoke-virtual {v0}, LV1/b$c$a;->c()I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    invoke-virtual {v0}, LV1/b$c$a;->a()I

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    iget-object v0, p0, LV1/b;->f:Ly/z;

    .line 85
    .line 86
    if-nez v0, :cond_5

    .line 87
    .line 88
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    move-object v0, v2

    .line 92
    :cond_5
    invoke-virtual {v0}, Ly/z;->s()F

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    int-to-float v0, v4

    .line 97
    iget-object v1, p0, LV1/b;->f:Ly/z;

    .line 98
    .line 99
    if-nez v1, :cond_6

    .line 100
    .line 101
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_6
    move-object v2, v1

    .line 106
    :goto_2
    invoke-virtual {v2}, Ly/z;->s()F

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    sub-float v10, v0, v1

    .line 111
    .line 112
    move-object v5, p0

    .line 113
    move v6, p1

    .line 114
    invoke-direct/range {v5 .. v10}, LV1/b;->o(IIIFF)F

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    return p0

    .line 119
    :cond_7
    new-instance p0, Lh4/j;

    .line 120
    .line 121
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 122
    .line 123
    .line 124
    throw p0
.end method

.method public final s()F
    .locals 5

    .line 1
    iget-object v0, p0, LV1/b;->e:LV1/b$c;

    .line 2
    .line 3
    sget-object v1, LV1/b$c$c;->a:LV1/b$c$c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    goto :goto_2

    .line 14
    :cond_0
    instance-of v1, v0, LV1/b$c$b;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    const-string v4, "animator"

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, LV1/b;->f:Ly/z;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object v3, v0

    .line 30
    :goto_0
    invoke-virtual {v3}, Ly/z;->s()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    instance-of v1, v0, LV1/b$c$d;

    .line 36
    .line 37
    if-eqz v1, :cond_4

    .line 38
    .line 39
    int-to-float v0, v2

    .line 40
    iget-object v1, p0, LV1/b;->f:Ly/z;

    .line 41
    .line 42
    if-nez v1, :cond_3

    .line 43
    .line 44
    invoke-static {v4}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    move-object v3, v1

    .line 49
    :goto_1
    invoke-virtual {v3}, Ly/z;->s()F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    sub-float/2addr v0, v1

    .line 54
    :goto_2
    iget v1, p0, LV1/b;->c:I

    .line 55
    .line 56
    add-int/lit8 v3, v1, -0x2

    .line 57
    .line 58
    int-to-float v3, v3

    .line 59
    add-float/2addr v3, v0

    .line 60
    iget v4, p0, LV1/b;->b:F

    .line 61
    .line 62
    mul-float/2addr v3, v4

    .line 63
    sub-int/2addr v1, v2

    .line 64
    int-to-float v1, v1

    .line 65
    add-float/2addr v1, v0

    .line 66
    iget p0, p0, LV1/b;->a:F

    .line 67
    .line 68
    mul-float/2addr v1, p0

    .line 69
    add-float/2addr v1, v3

    .line 70
    return v1

    .line 71
    :cond_4
    instance-of v0, v0, LV1/b$c$a;

    .line 72
    .line 73
    if-eqz v0, :cond_5

    .line 74
    .line 75
    iget v0, p0, LV1/b;->c:I

    .line 76
    .line 77
    add-int/lit8 v1, v0, -0x2

    .line 78
    .line 79
    int-to-float v1, v1

    .line 80
    iget v3, p0, LV1/b;->b:F

    .line 81
    .line 82
    mul-float/2addr v1, v3

    .line 83
    sub-int/2addr v0, v2

    .line 84
    int-to-float v0, v0

    .line 85
    iget p0, p0, LV1/b;->a:F

    .line 86
    .line 87
    mul-float/2addr v0, p0

    .line 88
    add-float/2addr v0, v1

    .line 89
    return v0

    .line 90
    :cond_5
    new-instance p0, Lh4/j;

    .line 91
    .line 92
    invoke-direct {p0}, Lh4/j;-><init>()V

    .line 93
    .line 94
    .line 95
    throw p0
.end method

.method public final t()Z
    .locals 1

    .line 1
    iget-object p0, p0, LV1/b;->e:LV1/b$c;

    .line 2
    .line 3
    sget-object v0, LV1/b$c$c;->a:LV1/b$c$c;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method
