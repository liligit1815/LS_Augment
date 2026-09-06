.class public LB/d;
.super Ljava/lang/Object;
.source "TypefaceCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LB/d$a;
    }
.end annotation


# static fields
.field private static final a:LB/f;

.field private static final b:Lo/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/l<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "TypefaceCompat static init"

    .line 2
    .line 3
    invoke-static {v0}, Lk0/a;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, LB/e;

    .line 7
    .line 8
    invoke-direct {v0}, LB/e;-><init>()V

    .line 9
    .line 10
    .line 11
    sput-object v0, LB/d;->a:LB/f;

    .line 12
    .line 13
    new-instance v0, Lo/l;

    .line 14
    .line 15
    const/16 v1, 0x10

    .line 16
    .line 17
    invoke-direct {v0, v1}, Lo/l;-><init>(I)V

    .line 18
    .line 19
    .line 20
    sput-object v0, LB/d;->b:Lo/l;

    .line 21
    .line 22
    invoke-static {}, Lk0/a;->b()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 9
    .line 10
    const-string p1, "Context cannot be null"

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public static b(Landroid/content/Context;Landroid/os/CancellationSignal;[LG/g$b;I)Landroid/graphics/Typeface;
    .locals 1

    .line 1
    const-string v0, "TypefaceCompat.createFromFontInfo"

    .line 2
    .line 3
    invoke-static {v0}, Lk0/a;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v0, LB/d;->a:LB/f;

    .line 7
    .line 8
    invoke-virtual {v0, p0, p1, p2, p3}, LB/f;->b(Landroid/content/Context;Landroid/os/CancellationSignal;[LG/g$b;I)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-static {}, Lk0/a;->b()V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-static {}, Lk0/a;->b()V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public static c(Landroid/content/Context;Landroid/os/CancellationSignal;Ljava/util/List;I)Landroid/graphics/Typeface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/CancellationSignal;",
            "Ljava/util/List<",
            "[",
            "LG/g$b;",
            ">;I)",
            "Landroid/graphics/Typeface;"
        }
    .end annotation

    .line 1
    const-string v0, "TypefaceCompat.createFromFontInfoWithFallback"

    .line 2
    .line 3
    invoke-static {v0}, Lk0/a;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v0, LB/d;->a:LB/f;

    .line 7
    .line 8
    invoke-virtual {v0, p0, p1, p2, p3}, LB/f;->c(Landroid/content/Context;Landroid/os/CancellationSignal;Ljava/util/List;I)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    invoke-static {}, Lk0/a;->b()V

    .line 13
    .line 14
    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    invoke-static {}, Lk0/a;->b()V

    .line 18
    .line 19
    .line 20
    throw p0
.end method

.method public static d(Landroid/content/Context;LA/e$b;Landroid/content/res/Resources;ILjava/lang/String;IILA/h$f;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .locals 12

    .line 1
    move-object/from16 v0, p7

    .line 2
    .line 3
    move-object/from16 v1, p8

    .line 4
    .line 5
    instance-of v2, p1, LA/e$e;

    .line 6
    .line 7
    if-eqz v2, :cond_6

    .line 8
    .line 9
    check-cast p1, LA/e$e;

    .line 10
    .line 11
    invoke-virtual {p1}, LA/e$e;->d()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, LB/d;->h(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, LA/h$f;->d(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object v2

    .line 27
    :cond_1
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x1

    .line 29
    if-eqz p9, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1}, LA/e$e;->b()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-nez v4, :cond_2

    .line 36
    .line 37
    :goto_0
    move v8, v3

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    move v8, v2

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :goto_1
    if-eqz p9, :cond_4

    .line 45
    .line 46
    invoke-virtual {p1}, LA/e$e;->e()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    :goto_2
    move v9, v2

    .line 51
    goto :goto_3

    .line 52
    :cond_4
    const/4 v2, -0x1

    .line 53
    goto :goto_2

    .line 54
    :goto_3
    invoke-static {v1}, LA/h$f;->e(Landroid/os/Handler;)Landroid/os/Handler;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    new-instance v11, LB/d$a;

    .line 59
    .line 60
    invoke-direct {v11, v0}, LB/d$a;-><init>(LA/h$f;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, LA/e$e;->a()LG/e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    invoke-virtual {p1}, LA/e$e;->c()LG/e;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1}, LA/e$e;->a()LG/e;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {v0, p1}, Ljava/util/List;->of(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    :goto_4
    move-object v5, p0

    .line 82
    move-object v6, p1

    .line 83
    move/from16 v7, p6

    .line 84
    .line 85
    goto :goto_5

    .line 86
    :cond_5
    invoke-virtual {p1}, LA/e$e;->c()LG/e;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-static {p1}, Ljava/util/List;->of(Ljava/lang/Object;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    goto :goto_4

    .line 95
    :goto_5
    invoke-static/range {v5 .. v11}, LG/g;->a(Landroid/content/Context;Ljava/util/List;IZILandroid/os/Handler;LG/g$c;)Landroid/graphics/Typeface;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    move/from16 v7, p6

    .line 100
    .line 101
    goto :goto_6

    .line 102
    :cond_6
    sget-object v2, LB/d;->a:LB/f;

    .line 103
    .line 104
    check-cast p1, LA/e$c;

    .line 105
    .line 106
    move/from16 v7, p6

    .line 107
    .line 108
    invoke-virtual {v2, p0, p1, p2, v7}, LB/f;->a(Landroid/content/Context;LA/e$c;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    if-eqz v0, :cond_8

    .line 113
    .line 114
    if-eqz p0, :cond_7

    .line 115
    .line 116
    invoke-virtual {v0, p0, v1}, LA/h$f;->d(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    .line 117
    .line 118
    .line 119
    goto :goto_6

    .line 120
    :cond_7
    const/4 p1, -0x3

    .line 121
    invoke-virtual {v0, p1, v1}, LA/h$f;->c(ILandroid/os/Handler;)V

    .line 122
    .line 123
    .line 124
    :cond_8
    :goto_6
    if-eqz p0, :cond_9

    .line 125
    .line 126
    sget-object p1, LB/d;->b:Lo/l;

    .line 127
    .line 128
    invoke-static/range {p2 .. p6}, LB/d;->f(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-virtual {p1, p2, p0}, Lo/l;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    :cond_9
    return-object p0
.end method

.method public static e(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;
    .locals 6

    .line 1
    sget-object v0, LB/d;->a:LB/f;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p5

    .line 8
    invoke-virtual/range {v0 .. v5}, LB/f;->d(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {v2, v3, v4, p4, v5}, LB/d;->f(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object p2, LB/d;->b:Lo/l;

    .line 19
    .line 20
    invoke-virtual {p2, p1, p0}, Lo/l;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-object p0
.end method

.method private static f(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 p0, 0x2d

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static g(Landroid/content/res/Resources;ILjava/lang/String;II)Landroid/graphics/Typeface;
    .locals 1

    .line 1
    sget-object v0, LB/d;->b:Lo/l;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, p4}, LB/d;->f(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lo/l;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/graphics/Typeface;

    .line 12
    .line 13
    return-object p0
.end method

.method private static h(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 17
    .line 18
    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    return-object v0
.end method
