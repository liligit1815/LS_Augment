.class public final Lcom/android/launcher3/anim/x;
.super Ljava/lang/Object;
.source "AppLaunchAnimSpeedHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/anim/x$a;
    }
.end annotation


# static fields
.field public static final c:Lcom/android/launcher3/anim/x$a;

.field private static final d:Z

.field public static e:I

.field public static f:F

.field public static g:J

.field public static h:F

.field public static i:F

.field public static j:F


# instance fields
.field private a:Lcom/android/launcher3/C2;

.field private b:Lcom/android/launcher3/util/Y1;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/x$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/x$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 8
    .line 9
    invoke-static {}, LM3/a;->g()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput-boolean v0, Lcom/android/launcher3/anim/x;->d:Z

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    sput v0, Lcom/android/launcher3/anim/x;->e:I

    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    sput v0, Lcom/android/launcher3/anim/x;->f:F

    .line 21
    .line 22
    const-wide/16 v1, -0x1

    .line 23
    .line 24
    sput-wide v1, Lcom/android/launcher3/anim/x;->g:J

    .line 25
    .line 26
    sput v0, Lcom/android/launcher3/anim/x;->h:F

    .line 27
    .line 28
    sput v0, Lcom/android/launcher3/anim/x;->i:F

    .line 29
    .line 30
    sput v0, Lcom/android/launcher3/anim/x;->j:F

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/anim/x;->b:Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/anim/x;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    const-string p1, "initSpeed"

    .line 14
    .line 15
    const-wide/16 v0, 0x8

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/android/launcher3/anim/x;->a:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/android/launcher3/util/p2;

    .line 29
    .line 30
    const-string v2, "animator_duration_scale"

    .line 31
    .line 32
    invoke-static {v2}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Lcom/android/launcher3/anim/t;

    .line 37
    .line 38
    invoke-direct {v3, p0}, Lcom/android/launcher3/anim/t;-><init>(Lcom/android/launcher3/anim/x;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v2, v3}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/p2;->h(Landroid/net/Uri;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    const/high16 v5, 0x3f800000    # 1.0f

    .line 49
    .line 50
    invoke-direct {p0, v4, v5}, Lcom/android/launcher3/anim/x;->h(Ljava/lang/String;F)F

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    sput v4, Lcom/android/launcher3/anim/x;->h:F

    .line 55
    .line 56
    iget-object v4, p0, Lcom/android/launcher3/anim/x;->b:Lcom/android/launcher3/util/Y1;

    .line 57
    .line 58
    new-instance v6, Lcom/android/launcher3/anim/u;

    .line 59
    .line 60
    invoke-direct {v6, p1, v2, v3}, Lcom/android/launcher3/anim/u;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "global_animation_scale"

    .line 67
    .line 68
    invoke-static {v2}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    new-instance v3, Lcom/android/launcher3/anim/v;

    .line 73
    .line 74
    invoke-direct {v3, p0}, Lcom/android/launcher3/anim/v;-><init>(Lcom/android/launcher3/anim/x;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v2, v3}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/p2;->h(Landroid/net/Uri;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-direct {p0, v4, v5}, Lcom/android/launcher3/anim/x;->h(Ljava/lang/String;F)F

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    sput v4, Lcom/android/launcher3/anim/x;->i:F

    .line 89
    .line 90
    invoke-static {v4}, Lx1/O;->L4(F)V

    .line 91
    .line 92
    .line 93
    sget v4, Lcom/android/launcher3/anim/x;->j:F

    .line 94
    .line 95
    const/high16 v6, 0x3fc00000    # 1.5f

    .line 96
    .line 97
    cmpl-float v6, v4, v6

    .line 98
    .line 99
    if-ltz v6, :cond_0

    .line 100
    .line 101
    const/high16 v6, 0x3f400000    # 0.75f

    .line 102
    .line 103
    div-float/2addr v4, v6

    .line 104
    sput v4, Lcom/android/launcher3/anim/x;->j:F

    .line 105
    .line 106
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/anim/x;->b:Lcom/android/launcher3/util/Y1;

    .line 107
    .line 108
    new-instance v4, Lcom/android/launcher3/anim/w;

    .line 109
    .line 110
    invoke-direct {v4, p1, v2, v3}, Lcom/android/launcher3/anim/w;-><init>(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v4}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    sget p0, Lcom/android/launcher3/anim/x;->h:F

    .line 117
    .line 118
    invoke-static {p0, v5}, Lx1/O;->Y1(FF)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_1

    .line 123
    .line 124
    sget p0, Lcom/android/launcher3/anim/x;->i:F

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    sget p0, Lcom/android/launcher3/anim/x;->h:F

    .line 128
    .line 129
    :goto_0
    sput p0, Lcom/android/launcher3/anim/x;->f:F

    .line 130
    .line 131
    invoke-static {v0, v1}, Landroid/os/Trace;->traceEnd(J)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/anim/x;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/anim/x;->e(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/p2;Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/anim/x;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/anim/x;->f(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/anim/x;->h(Ljava/lang/String;F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sput p0, Lcom/android/launcher3/anim/x;->h:F

    .line 8
    .line 9
    invoke-static {p0, v0}, Lx1/O;->Y1(FF)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/android/launcher3/anim/x;->i:F

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p0, Lcom/android/launcher3/anim/x;->h:F

    .line 19
    .line 20
    :goto_0
    sput p0, Lcom/android/launcher3/anim/x;->f:F

    .line 21
    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v0, "onAnimatorDurationChangeListenerString value= \""

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, "\""

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "AppLaunchAnimSpeedHandler"

    .line 45
    .line 46
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic f(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/anim/x;->h(Ljava/lang/String;F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sput p0, Lcom/android/launcher3/anim/x;->i:F

    .line 8
    .line 9
    invoke-static {p0}, Lx1/O;->L4(F)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/android/launcher3/anim/x;->j:F

    .line 13
    .line 14
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 15
    .line 16
    cmpl-float v1, p0, v1

    .line 17
    .line 18
    if-ltz v1, :cond_0

    .line 19
    .line 20
    const/high16 v1, 0x3f400000    # 0.75f

    .line 21
    .line 22
    div-float/2addr p0, v1

    .line 23
    sput p0, Lcom/android/launcher3/anim/x;->j:F

    .line 24
    .line 25
    :cond_0
    sget p0, Lcom/android/launcher3/anim/x;->h:F

    .line 26
    .line 27
    invoke-static {p0, v0}, Lx1/O;->Y1(FF)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    sget p0, Lcom/android/launcher3/anim/x;->i:F

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget p0, Lcom/android/launcher3/anim/x;->h:F

    .line 37
    .line 38
    :goto_0
    sput p0, Lcom/android/launcher3/anim/x;->f:F

    .line 39
    .line 40
    new-instance p0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v0, "onGlobalDurationChangeListenerString value= \""

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, "\""

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "AppLaunchAnimSpeedHandler"

    .line 63
    .line 64
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private h(Ljava/lang/String;F)F
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return p2

    .line 8
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 9
    .line 10
    .line 11
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return p0

    .line 13
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "Failed to parse float from string: "

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, ", using default: "

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "AppLaunchAnimSpeedHandler"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return p2
.end method


# virtual methods
.method public final g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/x;->b:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
