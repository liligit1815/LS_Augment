.class LF0/t;
.super Ljava/lang/Object;
.source "KeyframeParser.java"


# static fields
.field private static final a:Landroid/view/animation/Interpolator;

.field private static b:Lo/s;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/s<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;>;"
        }
    .end annotation
.end field

.field static c:LG0/c$a;

.field static d:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LF0/t;->a:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    const-string v7, "to"

    .line 9
    .line 10
    const-string v8, "ti"

    .line 11
    .line 12
    const-string v1, "t"

    .line 13
    .line 14
    const-string v2, "s"

    .line 15
    .line 16
    const-string v3, "e"

    .line 17
    .line 18
    const-string v4, "o"

    .line 19
    .line 20
    const-string v5, "i"

    .line 21
    .line 22
    const-string v6, "h"

    .line 23
    .line 24
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, LF0/t;->c:LG0/c$a;

    .line 33
    .line 34
    const-string v0, "x"

    .line 35
    .line 36
    const-string v1, "y"

    .line 37
    .line 38
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, LF0/t;->d:LG0/c$a;

    .line 47
    .line 48
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a(I)Ljava/lang/ref/WeakReference;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, LF0/t;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, LF0/t;->g()Lo/s;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, p0}, Lo/s;->d(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method

.method private static b(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;
    .locals 6

    .line 1
    iget v0, p0, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    const/high16 v1, -0x40800000    # -1.0f

    .line 4
    .line 5
    const/high16 v2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, LH0/g;->b(FFF)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Landroid/graphics/PointF;->x:F

    .line 12
    .line 13
    iget v0, p0, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    const/high16 v3, -0x3d380000    # -100.0f

    .line 16
    .line 17
    const/high16 v4, 0x42c80000    # 100.0f

    .line 18
    .line 19
    invoke-static {v0, v3, v4}, LH0/g;->b(FFF)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Landroid/graphics/PointF;->y:F

    .line 24
    .line 25
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, LH0/g;->b(FFF)F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 32
    .line 33
    iget v0, p1, Landroid/graphics/PointF;->y:F

    .line 34
    .line 35
    invoke-static {v0, v3, v4}, LH0/g;->b(FFF)F

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p1, Landroid/graphics/PointF;->y:F

    .line 40
    .line 41
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 42
    .line 43
    iget v3, p0, Landroid/graphics/PointF;->y:F

    .line 44
    .line 45
    iget v4, p1, Landroid/graphics/PointF;->x:F

    .line 46
    .line 47
    invoke-static {v1, v3, v4, v0}, LH0/h;->i(FFFF)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {}, Lv0/c;->c()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v3, 0x0

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    move-object v1, v3

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {v0}, LF0/t;->a(I)Ljava/lang/ref/WeakReference;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    :goto_0
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    check-cast v3, Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    :cond_1
    if-eqz v1, :cond_3

    .line 73
    .line 74
    if-nez v3, :cond_2

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    return-object v3

    .line 78
    :cond_3
    :goto_1
    :try_start_0
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 79
    .line 80
    iget v3, p0, Landroid/graphics/PointF;->y:F

    .line 81
    .line 82
    iget v4, p1, Landroid/graphics/PointF;->x:F

    .line 83
    .line 84
    iget v5, p1, Landroid/graphics/PointF;->y:F

    .line 85
    .line 86
    invoke-static {v1, v3, v4, v5}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 87
    .line 88
    .line 89
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    goto :goto_2

    .line 91
    :catch_0
    move-exception v1

    .line 92
    const-string v3, "The Path cannot loop back on itself."

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    iget v1, p0, Landroid/graphics/PointF;->x:F

    .line 105
    .line 106
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 111
    .line 112
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 113
    .line 114
    const/4 v3, 0x0

    .line 115
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 120
    .line 121
    invoke-static {v1, p0, v2, p1}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    goto :goto_2

    .line 126
    :cond_4
    new-instance p0, Landroid/view/animation/LinearInterpolator;

    .line 127
    .line 128
    invoke-direct {p0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 129
    .line 130
    .line 131
    :goto_2
    invoke-static {}, Lv0/c;->c()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_5

    .line 136
    .line 137
    :try_start_1
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 138
    .line 139
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, p1}, LF0/t;->h(ILjava/lang/ref/WeakReference;)V
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    .line 143
    .line 144
    .line 145
    :catch_1
    :cond_5
    return-object p0
.end method

.method static c(LG0/c;Lv0/h;FLF0/N;ZZ)LI0/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LG0/c;",
            "Lv0/h;",
            "F",
            "LF0/N<",
            "TT;>;ZZ)",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p0, p2, p3}, LF0/t;->e(Lv0/h;LG0/c;FLF0/N;)LI0/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    if-eqz p4, :cond_1

    .line 11
    .line 12
    invoke-static {p1, p0, p2, p3}, LF0/t;->d(Lv0/h;LG0/c;FLF0/N;)LI0/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    invoke-static {p0, p2, p3}, LF0/t;->f(LG0/c;FLF0/N;)LI0/a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private static d(Lv0/h;LG0/c;FLF0/N;)LI0/a;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lv0/h;",
            "LG0/c;",
            "F",
            "LF0/N<",
            "TT;>;)",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1}, LG0/c;->d()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    move-object v3, v0

    .line 8
    move-object v5, v3

    .line 9
    move-object v10, v5

    .line 10
    move-object v11, v10

    .line 11
    move v8, v1

    .line 12
    move v4, v2

    .line 13
    move-object v1, v11

    .line 14
    :goto_0
    invoke-virtual {p1}, LG0/c;->n()Z

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    if-eqz v6, :cond_1

    .line 19
    .line 20
    sget-object v6, LF0/t;->c:LG0/c$a;

    .line 21
    .line 22
    invoke-virtual {p1, v6}, LG0/c;->F(LG0/c$a;)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    const/high16 v7, 0x3f800000    # 1.0f

    .line 27
    .line 28
    packed-switch v6, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, LG0/c;->J()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :pswitch_0
    invoke-static {p1, p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 36
    .line 37
    .line 38
    move-result-object v11

    .line 39
    goto :goto_0

    .line 40
    :pswitch_1
    invoke-static {p1, p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 41
    .line 42
    .line 43
    move-result-object v10

    .line 44
    goto :goto_0

    .line 45
    :pswitch_2
    invoke-virtual {p1}, LG0/c;->w()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/4 v6, 0x1

    .line 50
    if-ne v4, v6, :cond_0

    .line 51
    .line 52
    move v4, v6

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v4, v2

    .line 55
    goto :goto_0

    .line 56
    :pswitch_3
    invoke-static {p1, v7}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    goto :goto_0

    .line 61
    :pswitch_4
    invoke-static {p1, v7}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    goto :goto_0

    .line 66
    :pswitch_5
    invoke-interface {p3, p1, p2}, LF0/N;->a(LG0/c;F)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    goto :goto_0

    .line 71
    :pswitch_6
    invoke-interface {p3, p1, p2}, LF0/N;->a(LG0/c;F)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    goto :goto_0

    .line 76
    :pswitch_7
    invoke-virtual {p1}, LG0/c;->v()D

    .line 77
    .line 78
    .line 79
    move-result-wide v6

    .line 80
    double-to-float v8, v6

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {p1}, LG0/c;->g()V

    .line 83
    .line 84
    .line 85
    if-eqz v4, :cond_2

    .line 86
    .line 87
    sget-object p1, LF0/t;->a:Landroid/view/animation/Interpolator;

    .line 88
    .line 89
    move-object v7, p1

    .line 90
    move-object v6, v5

    .line 91
    goto :goto_2

    .line 92
    :cond_2
    if-eqz v0, :cond_3

    .line 93
    .line 94
    if-eqz v1, :cond_3

    .line 95
    .line 96
    invoke-static {v0, v1}, LF0/t;->b(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    :goto_1
    move-object v7, p1

    .line 101
    move-object v6, v3

    .line 102
    goto :goto_2

    .line 103
    :cond_3
    sget-object p1, LF0/t;->a:Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :goto_2
    new-instance v3, LI0/a;

    .line 107
    .line 108
    const/4 v9, 0x0

    .line 109
    move-object v4, p0

    .line 110
    invoke-direct/range {v3 .. v9}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 111
    .line 112
    .line 113
    iput-object v10, v3, LI0/a;->o:Landroid/graphics/PointF;

    .line 114
    .line 115
    iput-object v11, v3, LI0/a;->p:Landroid/graphics/PointF;

    .line 116
    .line 117
    return-object v3

    .line 118
    nop

    .line 119
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static e(Lv0/h;LG0/c;FLF0/N;)LI0/a;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lv0/h;",
            "LG0/c;",
            "F",
            "LF0/N<",
            "TT;>;)",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v0}, LG0/c;->d()V

    .line 8
    .line 9
    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v7, 0x0

    .line 12
    const/4 v8, 0x0

    .line 13
    const/4 v9, 0x0

    .line 14
    const/4 v10, 0x0

    .line 15
    const/4 v11, 0x0

    .line 16
    const/4 v12, 0x0

    .line 17
    const/4 v13, 0x0

    .line 18
    const/4 v14, 0x0

    .line 19
    const/4 v15, 0x0

    .line 20
    const/16 v16, 0x0

    .line 21
    .line 22
    const/16 v17, 0x0

    .line 23
    .line 24
    :goto_0
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 25
    .line 26
    .line 27
    move-result v18

    .line 28
    if-eqz v18, :cond_11

    .line 29
    .line 30
    sget-object v3, LF0/t;->c:LG0/c$a;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, 0x1

    .line 37
    packed-switch v3, :pswitch_data_0

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, LG0/c;->J()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :pswitch_0
    invoke-static/range {p1 .. p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 45
    .line 46
    .line 47
    move-result-object v15

    .line 48
    goto :goto_0

    .line 49
    :pswitch_1
    invoke-static/range {p1 .. p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 50
    .line 51
    .line 52
    move-result-object v14

    .line 53
    goto :goto_0

    .line 54
    :pswitch_2
    invoke-virtual {v0}, LG0/c;->w()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-ne v3, v4, :cond_0

    .line 59
    .line 60
    move v6, v4

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 v6, 0x0

    .line 63
    goto :goto_0

    .line 64
    :pswitch_3
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    sget-object v5, LG0/c$b;->i:LG0/c$b;

    .line 69
    .line 70
    if-ne v3, v5, :cond_8

    .line 71
    .line 72
    invoke-virtual {v0}, LG0/c;->d()V

    .line 73
    .line 74
    .line 75
    const/4 v3, 0x0

    .line 76
    const/4 v5, 0x0

    .line 77
    const/4 v12, 0x0

    .line 78
    const/4 v13, 0x0

    .line 79
    :goto_1
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 80
    .line 81
    .line 82
    move-result v19

    .line 83
    if-eqz v19, :cond_7

    .line 84
    .line 85
    sget-object v4, LF0/t;->d:LG0/c$a;

    .line 86
    .line 87
    invoke-virtual {v0, v4}, LG0/c;->F(LG0/c$a;)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-eqz v4, :cond_4

    .line 92
    .line 93
    move/from16 v20, v6

    .line 94
    .line 95
    const/4 v6, 0x1

    .line 96
    if-eq v4, v6, :cond_1

    .line 97
    .line 98
    invoke-virtual {v0}, LG0/c;->J()V

    .line 99
    .line 100
    .line 101
    :goto_2
    move/from16 v6, v20

    .line 102
    .line 103
    const/4 v4, 0x1

    .line 104
    goto :goto_1

    .line 105
    :cond_1
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    sget-object v5, LG0/c$b;->m:LG0/c$b;

    .line 110
    .line 111
    if-ne v4, v5, :cond_2

    .line 112
    .line 113
    invoke-virtual {v0}, LG0/c;->v()D

    .line 114
    .line 115
    .line 116
    move-result-wide v4

    .line 117
    double-to-float v13, v4

    .line 118
    move v5, v13

    .line 119
    goto :goto_2

    .line 120
    :cond_2
    invoke-virtual {v0}, LG0/c;->c()V

    .line 121
    .line 122
    .line 123
    move-object v4, v14

    .line 124
    invoke-virtual {v0}, LG0/c;->v()D

    .line 125
    .line 126
    .line 127
    move-result-wide v13

    .line 128
    double-to-float v6, v13

    .line 129
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    if-ne v13, v5, :cond_3

    .line 134
    .line 135
    invoke-virtual {v0}, LG0/c;->v()D

    .line 136
    .line 137
    .line 138
    move-result-wide v13

    .line 139
    double-to-float v5, v13

    .line 140
    move v13, v5

    .line 141
    goto :goto_3

    .line 142
    :cond_3
    move v13, v6

    .line 143
    :goto_3
    invoke-virtual {v0}, LG0/c;->e()V

    .line 144
    .line 145
    .line 146
    move-object v14, v4

    .line 147
    move v5, v6

    .line 148
    goto :goto_2

    .line 149
    :cond_4
    move/from16 v20, v6

    .line 150
    .line 151
    move-object v4, v14

    .line 152
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    sget-object v6, LG0/c$b;->m:LG0/c$b;

    .line 157
    .line 158
    if-ne v3, v6, :cond_5

    .line 159
    .line 160
    move-object v14, v4

    .line 161
    invoke-virtual {v0}, LG0/c;->v()D

    .line 162
    .line 163
    .line 164
    move-result-wide v3

    .line 165
    double-to-float v12, v3

    .line 166
    move v3, v12

    .line 167
    goto :goto_2

    .line 168
    :cond_5
    move-object v14, v4

    .line 169
    invoke-virtual {v0}, LG0/c;->c()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, LG0/c;->v()D

    .line 173
    .line 174
    .line 175
    move-result-wide v3

    .line 176
    double-to-float v3, v3

    .line 177
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    if-ne v4, v6, :cond_6

    .line 182
    .line 183
    move v6, v3

    .line 184
    invoke-virtual {v0}, LG0/c;->v()D

    .line 185
    .line 186
    .line 187
    move-result-wide v3

    .line 188
    double-to-float v3, v3

    .line 189
    move v12, v3

    .line 190
    goto :goto_4

    .line 191
    :cond_6
    move v6, v3

    .line 192
    move v12, v6

    .line 193
    :goto_4
    invoke-virtual {v0}, LG0/c;->e()V

    .line 194
    .line 195
    .line 196
    move v3, v6

    .line 197
    goto :goto_2

    .line 198
    :cond_7
    move/from16 v20, v6

    .line 199
    .line 200
    new-instance v4, Landroid/graphics/PointF;

    .line 201
    .line 202
    invoke-direct {v4, v3, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 203
    .line 204
    .line 205
    new-instance v3, Landroid/graphics/PointF;

    .line 206
    .line 207
    invoke-direct {v3, v12, v13}, Landroid/graphics/PointF;-><init>(FF)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, LG0/c;->g()V

    .line 211
    .line 212
    .line 213
    move-object v13, v3

    .line 214
    move-object v12, v4

    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :cond_8
    move/from16 v20, v6

    .line 218
    .line 219
    invoke-static/range {p1 .. p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 220
    .line 221
    .line 222
    move-result-object v8

    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :pswitch_4
    move/from16 v20, v6

    .line 226
    .line 227
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    sget-object v4, LG0/c$b;->i:LG0/c$b;

    .line 232
    .line 233
    if-ne v3, v4, :cond_10

    .line 234
    .line 235
    invoke-virtual {v0}, LG0/c;->d()V

    .line 236
    .line 237
    .line 238
    const/4 v3, 0x0

    .line 239
    const/4 v4, 0x0

    .line 240
    const/4 v5, 0x0

    .line 241
    const/4 v6, 0x0

    .line 242
    :goto_5
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 243
    .line 244
    .line 245
    move-result v9

    .line 246
    if-eqz v9, :cond_f

    .line 247
    .line 248
    sget-object v9, LF0/t;->d:LG0/c$a;

    .line 249
    .line 250
    invoke-virtual {v0, v9}, LG0/c;->F(LG0/c$a;)I

    .line 251
    .line 252
    .line 253
    move-result v9

    .line 254
    if-eqz v9, :cond_c

    .line 255
    .line 256
    const/4 v11, 0x1

    .line 257
    if-eq v9, v11, :cond_9

    .line 258
    .line 259
    invoke-virtual {v0}, LG0/c;->J()V

    .line 260
    .line 261
    .line 262
    goto :goto_5

    .line 263
    :cond_9
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    sget-object v6, LG0/c$b;->m:LG0/c$b;

    .line 268
    .line 269
    if-ne v4, v6, :cond_a

    .line 270
    .line 271
    move-object/from16 v19, v12

    .line 272
    .line 273
    invoke-virtual {v0}, LG0/c;->v()D

    .line 274
    .line 275
    .line 276
    move-result-wide v11

    .line 277
    double-to-float v6, v11

    .line 278
    move v4, v6

    .line 279
    :goto_6
    move-object/from16 v12, v19

    .line 280
    .line 281
    goto :goto_5

    .line 282
    :cond_a
    move-object/from16 v19, v12

    .line 283
    .line 284
    invoke-virtual {v0}, LG0/c;->c()V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v0}, LG0/c;->v()D

    .line 288
    .line 289
    .line 290
    move-result-wide v11

    .line 291
    double-to-float v4, v11

    .line 292
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 293
    .line 294
    .line 295
    move-result-object v11

    .line 296
    if-ne v11, v6, :cond_b

    .line 297
    .line 298
    invoke-virtual {v0}, LG0/c;->v()D

    .line 299
    .line 300
    .line 301
    move-result-wide v11

    .line 302
    double-to-float v6, v11

    .line 303
    goto :goto_7

    .line 304
    :cond_b
    move v6, v4

    .line 305
    :goto_7
    invoke-virtual {v0}, LG0/c;->e()V

    .line 306
    .line 307
    .line 308
    goto :goto_6

    .line 309
    :cond_c
    move-object/from16 v19, v12

    .line 310
    .line 311
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    sget-object v5, LG0/c$b;->m:LG0/c$b;

    .line 316
    .line 317
    if-ne v3, v5, :cond_d

    .line 318
    .line 319
    invoke-virtual {v0}, LG0/c;->v()D

    .line 320
    .line 321
    .line 322
    move-result-wide v11

    .line 323
    double-to-float v5, v11

    .line 324
    move v3, v5

    .line 325
    goto :goto_6

    .line 326
    :cond_d
    invoke-virtual {v0}, LG0/c;->c()V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v0}, LG0/c;->v()D

    .line 330
    .line 331
    .line 332
    move-result-wide v11

    .line 333
    double-to-float v3, v11

    .line 334
    invoke-virtual {v0}, LG0/c;->D()LG0/c$b;

    .line 335
    .line 336
    .line 337
    move-result-object v11

    .line 338
    if-ne v11, v5, :cond_e

    .line 339
    .line 340
    invoke-virtual {v0}, LG0/c;->v()D

    .line 341
    .line 342
    .line 343
    move-result-wide v11

    .line 344
    double-to-float v5, v11

    .line 345
    goto :goto_8

    .line 346
    :cond_e
    move v5, v3

    .line 347
    :goto_8
    invoke-virtual {v0}, LG0/c;->e()V

    .line 348
    .line 349
    .line 350
    goto :goto_6

    .line 351
    :cond_f
    move-object/from16 v19, v12

    .line 352
    .line 353
    new-instance v9, Landroid/graphics/PointF;

    .line 354
    .line 355
    invoke-direct {v9, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 356
    .line 357
    .line 358
    new-instance v11, Landroid/graphics/PointF;

    .line 359
    .line 360
    invoke-direct {v11, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v0}, LG0/c;->g()V

    .line 364
    .line 365
    .line 366
    :goto_9
    move/from16 v6, v20

    .line 367
    .line 368
    goto/16 :goto_0

    .line 369
    .line 370
    :cond_10
    move-object/from16 v19, v12

    .line 371
    .line 372
    invoke-static/range {p1 .. p2}, LF0/s;->e(LG0/c;F)Landroid/graphics/PointF;

    .line 373
    .line 374
    .line 375
    move-result-object v7

    .line 376
    goto :goto_9

    .line 377
    :pswitch_5
    move/from16 v20, v6

    .line 378
    .line 379
    move-object/from16 v19, v12

    .line 380
    .line 381
    invoke-interface {v2, v0, v1}, LF0/N;->a(LG0/c;F)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v17

    .line 385
    goto/16 :goto_0

    .line 386
    .line 387
    :pswitch_6
    move/from16 v20, v6

    .line 388
    .line 389
    move-object/from16 v19, v12

    .line 390
    .line 391
    invoke-interface {v2, v0, v1}, LF0/N;->a(LG0/c;F)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v10

    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :pswitch_7
    move/from16 v20, v6

    .line 398
    .line 399
    move-object/from16 v19, v12

    .line 400
    .line 401
    invoke-virtual {v0}, LG0/c;->v()D

    .line 402
    .line 403
    .line 404
    move-result-wide v3

    .line 405
    double-to-float v3, v3

    .line 406
    move/from16 v16, v3

    .line 407
    .line 408
    goto/16 :goto_0

    .line 409
    .line 410
    :cond_11
    move/from16 v20, v6

    .line 411
    .line 412
    move-object/from16 v19, v12

    .line 413
    .line 414
    invoke-virtual {v0}, LG0/c;->g()V

    .line 415
    .line 416
    .line 417
    if-eqz v20, :cond_12

    .line 418
    .line 419
    sget-object v0, LF0/t;->a:Landroid/view/animation/Interpolator;

    .line 420
    .line 421
    move-object v3, v0

    .line 422
    move-object v11, v10

    .line 423
    :goto_a
    const/4 v12, 0x0

    .line 424
    const/4 v13, 0x0

    .line 425
    goto :goto_c

    .line 426
    :cond_12
    if-eqz v7, :cond_13

    .line 427
    .line 428
    if-eqz v8, :cond_13

    .line 429
    .line 430
    invoke-static {v7, v8}, LF0/t;->b(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    :goto_b
    move-object v3, v0

    .line 435
    move-object/from16 v11, v17

    .line 436
    .line 437
    goto :goto_a

    .line 438
    :cond_13
    if-eqz v9, :cond_14

    .line 439
    .line 440
    if-eqz v11, :cond_14

    .line 441
    .line 442
    if-eqz v19, :cond_14

    .line 443
    .line 444
    if-eqz v13, :cond_14

    .line 445
    .line 446
    move-object/from16 v12, v19

    .line 447
    .line 448
    invoke-static {v9, v12}, LF0/t;->b(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    invoke-static {v11, v13}, LF0/t;->b(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    move-object v12, v0

    .line 457
    move-object v13, v1

    .line 458
    move-object/from16 v11, v17

    .line 459
    .line 460
    const/4 v3, 0x0

    .line 461
    goto :goto_c

    .line 462
    :cond_14
    sget-object v0, LF0/t;->a:Landroid/view/animation/Interpolator;

    .line 463
    .line 464
    goto :goto_b

    .line 465
    :goto_c
    if-eqz v12, :cond_15

    .line 466
    .line 467
    if-eqz v13, :cond_15

    .line 468
    .line 469
    new-instance v8, LI0/a;

    .line 470
    .line 471
    move-object v3, v15

    .line 472
    const/4 v15, 0x0

    .line 473
    move-object/from16 v9, p0

    .line 474
    .line 475
    move-object v0, v3

    .line 476
    move-object v4, v14

    .line 477
    move/from16 v14, v16

    .line 478
    .line 479
    invoke-direct/range {v8 .. v15}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 480
    .line 481
    .line 482
    goto :goto_d

    .line 483
    :cond_15
    move-object v4, v14

    .line 484
    move-object v0, v15

    .line 485
    move/from16 v13, v16

    .line 486
    .line 487
    new-instance v8, LI0/a;

    .line 488
    .line 489
    const/4 v14, 0x0

    .line 490
    move-object/from16 v9, p0

    .line 491
    .line 492
    move-object v12, v3

    .line 493
    invoke-direct/range {v8 .. v14}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 494
    .line 495
    .line 496
    :goto_d
    iput-object v4, v8, LI0/a;->o:Landroid/graphics/PointF;

    .line 497
    .line 498
    iput-object v0, v8, LI0/a;->p:Landroid/graphics/PointF;

    .line 499
    .line 500
    return-object v8

    .line 501
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static f(LG0/c;FLF0/N;)LI0/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LG0/c;",
            "F",
            "LF0/N<",
            "TT;>;)",
            "LI0/a<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-interface {p2, p0, p1}, LF0/N;->a(LG0/c;F)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, LI0/a;

    .line 6
    .line 7
    invoke-direct {p1, p0}, LI0/a;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method private static g()Lo/s;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lo/s<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, LF0/t;->b:Lo/s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lo/s;

    .line 6
    .line 7
    invoke-direct {v0}, Lo/s;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, LF0/t;->b:Lo/s;

    .line 11
    .line 12
    :cond_0
    sget-object v0, LF0/t;->b:Lo/s;

    .line 13
    .line 14
    return-object v0
.end method

.method private static h(ILjava/lang/ref/WeakReference;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-class v0, LF0/t;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, LF0/t;->b:Lo/s;

    .line 5
    .line 6
    invoke-virtual {v1, p0, p1}, Lo/s;->i(ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method
