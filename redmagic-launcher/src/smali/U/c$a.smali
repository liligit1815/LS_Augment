.class public final LU/c$a;
.super Ljava/lang/Object;
.source "Cubic.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LU/c$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(FFFFFF)LU/c;
    .locals 17

    .line 1
    move/from16 v0, p3

    .line 2
    .line 3
    move/from16 v1, p4

    .line 4
    .line 5
    move/from16 v6, p5

    .line 6
    .line 7
    move/from16 v7, p6

    .line 8
    .line 9
    sub-float v2, v0, p1

    .line 10
    .line 11
    sub-float v3, v1, p2

    .line 12
    .line 13
    invoke-static {v2, v3}, LU/C;->c(FF)J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    sub-float v8, v6, p1

    .line 18
    .line 19
    sub-float v9, v7, p2

    .line 20
    .line 21
    invoke-static {v8, v9}, LU/C;->c(FF)J

    .line 22
    .line 23
    .line 24
    move-result-wide v10

    .line 25
    invoke-static {v4, v5}, LU/C;->g(J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v12

    .line 29
    invoke-static {v10, v11}, LU/C;->g(J)J

    .line 30
    .line 31
    .line 32
    move-result-wide v14

    .line 33
    invoke-static {v12, v13, v8, v9}, LU/r;->c(JFF)F

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    const/4 v9, 0x0

    .line 38
    cmpl-float v8, v8, v9

    .line 39
    .line 40
    const/4 v9, 0x1

    .line 41
    if-ltz v8, :cond_0

    .line 42
    .line 43
    move v8, v9

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v8, 0x0

    .line 46
    :goto_0
    invoke-static {v4, v5, v10, v11}, LU/r;->d(JJ)F

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    const v5, 0x3f7fbe77    # 0.999f

    .line 51
    .line 52
    .line 53
    cmpl-float v5, v4, v5

    .line 54
    .line 55
    if-lez v5, :cond_1

    .line 56
    .line 57
    move-object/from16 v5, p0

    .line 58
    .line 59
    invoke-virtual {v5, v0, v1, v6, v7}, LU/c$a;->c(FFFF)LU/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    return-object v0

    .line 64
    :cond_1
    invoke-static {v2, v3}, LU/C;->d(FF)F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/high16 v3, 0x40800000    # 4.0f

    .line 69
    .line 70
    mul-float/2addr v2, v3

    .line 71
    const/high16 v3, 0x40400000    # 3.0f

    .line 72
    .line 73
    div-float/2addr v2, v3

    .line 74
    const/4 v3, 0x2

    .line 75
    int-to-float v3, v3

    .line 76
    int-to-float v5, v9

    .line 77
    sub-float v9, v5, v4

    .line 78
    .line 79
    mul-float/2addr v3, v9

    .line 80
    float-to-double v10, v3

    .line 81
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 82
    .line 83
    .line 84
    move-result-wide v10

    .line 85
    double-to-float v3, v10

    .line 86
    mul-float/2addr v4, v4

    .line 87
    sub-float/2addr v5, v4

    .line 88
    float-to-double v4, v5

    .line 89
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide v4

    .line 93
    double-to-float v4, v4

    .line 94
    sub-float/2addr v3, v4

    .line 95
    mul-float/2addr v2, v3

    .line 96
    div-float/2addr v2, v9

    .line 97
    if-eqz v8, :cond_2

    .line 98
    .line 99
    const/high16 v3, 0x3f800000    # 1.0f

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_2
    const/high16 v3, -0x40800000    # -1.0f

    .line 103
    .line 104
    :goto_1
    mul-float/2addr v2, v3

    .line 105
    invoke-static {v12, v13}, LU/r;->h(J)F

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    mul-float/2addr v3, v2

    .line 110
    add-float/2addr v3, v0

    .line 111
    invoke-static {v12, v13}, LU/r;->i(J)F

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    mul-float/2addr v4, v2

    .line 116
    add-float/2addr v4, v1

    .line 117
    invoke-static {v14, v15}, LU/r;->h(J)F

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    mul-float/2addr v5, v2

    .line 122
    sub-float v5, v6, v5

    .line 123
    .line 124
    invoke-static {v14, v15}, LU/r;->i(J)F

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    mul-float/2addr v8, v2

    .line 129
    sub-float v2, v7, v8

    .line 130
    .line 131
    move/from16 v16, v5

    .line 132
    .line 133
    move v5, v2

    .line 134
    move v2, v3

    .line 135
    move v3, v4

    .line 136
    move/from16 v4, v16

    .line 137
    .line 138
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    return-object v0
.end method

.method public final b(FF)LU/c;
    .locals 8

    .line 1
    move v2, p1

    .line 2
    move v3, p2

    .line 3
    move v4, p1

    .line 4
    move v5, p2

    .line 5
    move v6, p1

    .line 6
    move v7, p2

    .line 7
    move v0, p1

    .line 8
    move v1, p2

    .line 9
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final c(FFFF)LU/c;
    .locals 8

    .line 1
    const p0, 0x3eaaaaab

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p3, p0}, LU/C;->e(FFF)F

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-static {p2, p4, p0}, LU/C;->e(FFF)F

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const p0, 0x3f2aaaab

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p3, p0}, LU/C;->e(FFF)F

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {p2, p4, p0}, LU/C;->e(FFF)F

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    move v0, p1

    .line 24
    move v1, p2

    .line 25
    move v6, p3

    .line 26
    move v7, p4

    .line 27
    invoke-static/range {v0 .. v7}, LU/d;->a(FFFFFFFF)LU/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
