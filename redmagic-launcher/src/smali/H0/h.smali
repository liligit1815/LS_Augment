.class public final LH0/h;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final a:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/graphics/PathMeasure;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/graphics/Path;",
            ">;"
        }
    .end annotation
.end field

.field private static final c:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/graphics/Path;",
            ">;"
        }
    .end annotation
.end field

.field private static final d:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "[F>;"
        }
    .end annotation
.end field

.field private static final e:F


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LH0/h$a;

    .line 2
    .line 3
    invoke-direct {v0}, LH0/h$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LH0/h;->a:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, LH0/h$b;

    .line 9
    .line 10
    invoke-direct {v0}, LH0/h$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, LH0/h;->b:Ljava/lang/ThreadLocal;

    .line 14
    .line 15
    new-instance v0, LH0/h$c;

    .line 16
    .line 17
    invoke-direct {v0}, LH0/h$c;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, LH0/h;->c:Ljava/lang/ThreadLocal;

    .line 21
    .line 22
    new-instance v0, LH0/h$d;

    .line 23
    .line 24
    invoke-direct {v0}, LH0/h$d;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, LH0/h;->d:Ljava/lang/ThreadLocal;

    .line 28
    .line 29
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 30
    .line 31
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    div-double/2addr v2, v0

    .line 36
    double-to-float v0, v2

    .line 37
    sput v0, LH0/h;->e:F

    .line 38
    .line 39
    return-void
.end method

.method public static a(Landroid/graphics/Path;FFF)V
    .locals 10

    .line 1
    const-string v0, "applyTrimPathIfNeeded"

    .line 2
    .line 3
    invoke-static {v0}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, LH0/h;->a:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/graphics/PathMeasure;

    .line 13
    .line 14
    sget-object v2, LH0/h;->b:Ljava/lang/ThreadLocal;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/graphics/Path;

    .line 21
    .line 22
    sget-object v3, LH0/h;->c:Ljava/lang/ThreadLocal;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Landroid/graphics/Path;

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-virtual {v1, p0, v4}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/graphics/PathMeasure;->getLength()F

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const/high16 v5, 0x3f800000    # 1.0f

    .line 39
    .line 40
    cmpl-float v6, p1, v5

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    if-nez v6, :cond_0

    .line 44
    .line 45
    cmpl-float v6, p2, v7

    .line 46
    .line 47
    if-nez v6, :cond_0

    .line 48
    .line 49
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    cmpg-float v6, v4, v5

    .line 54
    .line 55
    if-ltz v6, :cond_9

    .line 56
    .line 57
    sub-float v6, p2, p1

    .line 58
    .line 59
    sub-float/2addr v6, v5

    .line 60
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    float-to-double v5, v5

    .line 65
    const-wide v8, 0x3f847ae147ae147bL    # 0.01

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    cmpg-double v5, v5, v8

    .line 71
    .line 72
    if-gez v5, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    mul-float/2addr p1, v4

    .line 76
    mul-float/2addr p2, v4

    .line 77
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    mul-float/2addr p3, v4

    .line 86
    add-float/2addr v5, p3

    .line 87
    add-float/2addr p1, p3

    .line 88
    cmpl-float p2, v5, v4

    .line 89
    .line 90
    if-ltz p2, :cond_2

    .line 91
    .line 92
    cmpl-float p2, p1, v4

    .line 93
    .line 94
    if-ltz p2, :cond_2

    .line 95
    .line 96
    invoke-static {v5, v4}, LH0/g;->f(FF)I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    int-to-float v5, p2

    .line 101
    invoke-static {p1, v4}, LH0/g;->f(FF)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    int-to-float p1, p1

    .line 106
    :cond_2
    cmpg-float p2, v5, v7

    .line 107
    .line 108
    if-gez p2, :cond_3

    .line 109
    .line 110
    invoke-static {v5, v4}, LH0/g;->f(FF)I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    int-to-float v5, p2

    .line 115
    :cond_3
    cmpg-float p2, p1, v7

    .line 116
    .line 117
    if-gez p2, :cond_4

    .line 118
    .line 119
    invoke-static {p1, v4}, LH0/g;->f(FF)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    int-to-float p1, p1

    .line 124
    :cond_4
    cmpl-float p2, v5, p1

    .line 125
    .line 126
    if-nez p2, :cond_5

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/graphics/Path;->reset()V

    .line 129
    .line 130
    .line 131
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_5
    if-ltz p2, :cond_6

    .line 136
    .line 137
    sub-float/2addr v5, v4

    .line 138
    :cond_6
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 139
    .line 140
    .line 141
    const/4 p2, 0x1

    .line 142
    invoke-virtual {v1, v5, p1, v2, p2}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 143
    .line 144
    .line 145
    cmpl-float p3, p1, v4

    .line 146
    .line 147
    if-lez p3, :cond_7

    .line 148
    .line 149
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 150
    .line 151
    .line 152
    rem-float/2addr p1, v4

    .line 153
    invoke-virtual {v1, v7, p1, v3, p2}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 154
    .line 155
    .line 156
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_7
    cmpg-float p1, v5, v7

    .line 161
    .line 162
    if-gez p1, :cond_8

    .line 163
    .line 164
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 165
    .line 166
    .line 167
    add-float/2addr v5, v4

    .line 168
    invoke-virtual {v1, v5, v4, v3, p2}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 169
    .line 170
    .line 171
    invoke-virtual {v2, v3}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 172
    .line 173
    .line 174
    :cond_8
    :goto_0
    invoke-virtual {p0, v2}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 175
    .line 176
    .line 177
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_9
    :goto_1
    invoke-static {v0}, Lv0/c;->b(Ljava/lang/String;)F

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public static b(Landroid/graphics/Path;Lx0/u;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lx0/u;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lx0/u;->j()Ly0/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ly0/d;

    .line 15
    .line 16
    invoke-virtual {v0}, Ly0/d;->p()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1}, Lx0/u;->e()Ly0/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ly0/d;

    .line 25
    .line 26
    invoke-virtual {v1}, Ly0/d;->p()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1}, Lx0/u;->h()Ly0/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ly0/d;

    .line 35
    .line 36
    invoke-virtual {p1}, Ly0/d;->p()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/high16 v2, 0x42c80000    # 100.0f

    .line 41
    .line 42
    div-float/2addr v0, v2

    .line 43
    div-float/2addr v1, v2

    .line 44
    const/high16 v2, 0x43b40000    # 360.0f

    .line 45
    .line 46
    div-float/2addr p1, v2

    .line 47
    invoke-static {p0, v0, v1, p1}, LH0/h;->a(Landroid/graphics/Path;FFF)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public static c(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    throw p0

    .line 9
    :catch_1
    :cond_0
    return-void
.end method

.method public static d(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/Path;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 7
    .line 8
    iget v2, p0, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/graphics/PointF;->length()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    cmpl-float v1, v1, v2

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/graphics/PointF;->length()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    cmpl-float v1, v1, v2

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    :cond_0
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    iget v2, p2, Landroid/graphics/PointF;->x:F

    .line 37
    .line 38
    add-float/2addr v1, v2

    .line 39
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 40
    .line 41
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 42
    .line 43
    add-float v2, p0, p2

    .line 44
    .line 45
    iget v5, p1, Landroid/graphics/PointF;->x:F

    .line 46
    .line 47
    iget p0, p3, Landroid/graphics/PointF;->x:F

    .line 48
    .line 49
    add-float v3, v5, p0

    .line 50
    .line 51
    iget v6, p1, Landroid/graphics/PointF;->y:F

    .line 52
    .line 53
    iget p0, p3, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    add-float v4, v6, p0

    .line 56
    .line 57
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 58
    .line 59
    .line 60
    return-object v0

    .line 61
    :cond_1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 62
    .line 63
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 64
    .line 65
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public static e()F
    .locals 1

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    return v0
.end method

.method public static f(Landroid/content/Context;)F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "animator_duration_scale"

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static g(Landroid/graphics/Matrix;)F
    .locals 6

    .line 1
    sget-object v0, LH0/h;->d:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    aput v2, v0, v1

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    aput v2, v0, v3

    .line 15
    .line 16
    sget v2, LH0/h;->e:F

    .line 17
    .line 18
    const/4 v4, 0x2

    .line 19
    aput v2, v0, v4

    .line 20
    .line 21
    const/4 v5, 0x3

    .line 22
    aput v2, v0, v5

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 25
    .line 26
    .line 27
    aget p0, v0, v4

    .line 28
    .line 29
    aget v1, v0, v1

    .line 30
    .line 31
    sub-float/2addr p0, v1

    .line 32
    aget v1, v0, v5

    .line 33
    .line 34
    aget v0, v0, v3

    .line 35
    .line 36
    sub-float/2addr v1, v0

    .line 37
    float-to-double v2, p0

    .line 38
    float-to-double v0, v1

    .line 39
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    double-to-float p0, v0

    .line 44
    return p0
.end method

.method public static h(Landroid/graphics/Matrix;)Z
    .locals 6

    .line 1
    sget-object v0, LH0/h;->d:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    aput v2, v0, v1

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    aput v2, v0, v3

    .line 15
    .line 16
    const v2, 0x471212bb

    .line 17
    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    aput v2, v0, v4

    .line 21
    .line 22
    const v2, 0x471a973c

    .line 23
    .line 24
    .line 25
    const/4 v5, 0x3

    .line 26
    aput v2, v0, v5

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 29
    .line 30
    .line 31
    aget p0, v0, v1

    .line 32
    .line 33
    aget v2, v0, v4

    .line 34
    .line 35
    cmpl-float p0, p0, v2

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    aget p0, v0, v3

    .line 40
    .line 41
    aget v0, v0, v5

    .line 42
    .line 43
    cmpl-float p0, p0, v0

    .line 44
    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    return v1

    .line 49
    :cond_1
    :goto_0
    return v3
.end method

.method public static i(FFFF)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p0, v0

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    const/16 v1, 0x20f

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    mul-float/2addr v1, p0

    .line 10
    float-to-int p0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 p0, 0x11

    .line 13
    .line 14
    :goto_0
    cmpl-float v1, p1, v0

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    mul-int/lit8 p0, p0, 0x1f

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    mul-float/2addr p0, p1

    .line 22
    float-to-int p0, p0

    .line 23
    :cond_1
    cmpl-float p1, p2, v0

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    mul-int/lit8 p0, p0, 0x1f

    .line 28
    .line 29
    int-to-float p0, p0

    .line 30
    mul-float/2addr p0, p2

    .line 31
    float-to-int p0, p0

    .line 32
    :cond_2
    cmpl-float p1, p3, v0

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    mul-int/lit8 p0, p0, 0x1f

    .line 37
    .line 38
    int-to-float p0, p0

    .line 39
    mul-float/2addr p0, p3

    .line 40
    float-to-int p0, p0

    .line 41
    :cond_3
    return p0
.end method

.method public static j(IIIIII)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ge p0, p3, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-le p0, p3, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    if-ge p1, p4, :cond_2

    .line 10
    .line 11
    return v0

    .line 12
    :cond_2
    if-le p1, p4, :cond_3

    .line 13
    .line 14
    return v1

    .line 15
    :cond_3
    if-lt p2, p5, :cond_4

    .line 16
    .line 17
    return v1

    .line 18
    :cond_4
    return v0
.end method

.method public static k(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Ljava/net/SocketException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Ljava/nio/channels/ClosedChannelException;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p0, Ljava/io/InterruptedIOException;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    instance-of v0, p0, Ljava/net/ProtocolException;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    instance-of v0, p0, Ljavax/net/ssl/SSLException;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    instance-of v0, p0, Ljava/net/UnknownHostException;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    instance-of p0, p0, Ljava/net/UnknownServiceException;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public static l(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p2, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, p1, p2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public static m(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 1

    .line 1
    const/16 v0, 0x1f

    .line 2
    .line 3
    invoke-static {p0, p1, p2, v0}, LH0/h;->n(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static n(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;I)V
    .locals 0

    .line 1
    const-string p3, "Utils#saveLayer"

    .line 2
    .line 3
    invoke-static {p3}, Lv0/c;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;)I

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Lv0/c;->b(Ljava/lang/String;)F

    .line 10
    .line 11
    .line 12
    return-void
.end method
