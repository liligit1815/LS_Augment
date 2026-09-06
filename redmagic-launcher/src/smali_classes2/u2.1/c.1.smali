.class public final Lu2/c;
.super Ljava/lang/Object;
.source "ActivityTransitionAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lu2/c$a;,
        Lu2/c$b;,
        Lu2/c$c;,
        Lu2/c$d;,
        Lu2/c$e;,
        Lu2/c$f;
    }
.end annotation


# static fields
.field public static final a:Lu2/c$c;

.field public static final b:Lu2/F$l;

.field private static final c:Lu2/F$j;

.field private static final d:Lu2/F$l;

.field private static final e:Lu2/F$e;

.field private static final f:Lu2/F$e;

.field public static final g:Z

.field private static final h:J

.field private static final i:Landroid/view/animation/Interpolator;

.field private static final j:Landroid/view/animation/PathInterpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lu2/c$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lu2/c$c;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lu2/c;->a:Lu2/c$c;

    .line 8
    .line 9
    new-instance v2, Lu2/F$l;

    .line 10
    .line 11
    const-wide/16 v9, 0x96

    .line 12
    .line 13
    const-wide/16 v11, 0xb7

    .line 14
    .line 15
    const-wide/16 v3, 0x1f4

    .line 16
    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    const-wide/16 v7, 0x96

    .line 20
    .line 21
    invoke-direct/range {v2 .. v12}, Lu2/F$l;-><init>(JJJJJ)V

    .line 22
    .line 23
    .line 24
    sput-object v2, Lu2/c;->b:Lu2/F$l;

    .line 25
    .line 26
    new-instance v0, Lu2/F$j;

    .line 27
    .line 28
    const v1, 0x3f59999a    # 0.85f

    .line 29
    .line 30
    .line 31
    const v3, 0x3e0a3d71    # 0.135f

    .line 32
    .line 33
    .line 34
    const/4 v15, 0x0

    .line 35
    const v4, 0x3f4ccccd    # 0.8f

    .line 36
    .line 37
    .line 38
    invoke-direct {v0, v15, v4, v1, v3}, Lu2/F$j;-><init>(FFFF)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lu2/c;->c:Lu2/F$j;

    .line 42
    .line 43
    const/16 v13, 0x13

    .line 44
    .line 45
    const/4 v14, 0x0

    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    const-wide/16 v7, 0xc8

    .line 49
    .line 50
    const-wide/16 v9, 0xc8

    .line 51
    .line 52
    const-wide/16 v11, 0x0

    .line 53
    .line 54
    invoke-static/range {v2 .. v14}, Lu2/F$l;->b(Lu2/F$l;JJJJJILjava/lang/Object;)Lu2/F$l;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sput-object v0, Lu2/c;->d:Lu2/F$l;

    .line 59
    .line 60
    new-instance v3, Lu2/F$e;

    .line 61
    .line 62
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 63
    .line 64
    const-string v1, "EMPHASIZED"

    .line 65
    .line 66
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object v1, LJ0/h;->b:Landroid/view/animation/Interpolator;

    .line 70
    .line 71
    const-string v4, "EMPHASIZED_COMPLEMENT"

    .line 72
    .line 73
    invoke-static {v1, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object v4, LJ0/h;->t:Landroid/view/animation/Interpolator;

    .line 77
    .line 78
    const-string v5, "LINEAR_OUT_SLOW_IN"

    .line 79
    .line 80
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    new-instance v5, Landroid/view/animation/PathInterpolator;

    .line 84
    .line 85
    const v6, 0x3f19999a    # 0.6f

    .line 86
    .line 87
    .line 88
    const/high16 v10, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-direct {v5, v15, v15, v6, v10}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 91
    .line 92
    .line 93
    invoke-direct {v3, v0, v1, v4, v5}, Lu2/F$e;-><init>(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    .line 94
    .line 95
    .line 96
    sput-object v3, Lu2/c;->e:Lu2/F$e;

    .line 97
    .line 98
    sget-object v6, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 99
    .line 100
    const-string v0, "DECELERATE_1_5"

    .line 101
    .line 102
    invoke-static {v6, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    sget-object v7, LJ0/h;->v:Landroid/view/animation/Interpolator;

    .line 106
    .line 107
    const-string v0, "SLOW_OUT_LINEAR_IN"

    .line 108
    .line 109
    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const/4 v8, 0x3

    .line 113
    const/4 v9, 0x0

    .line 114
    const/4 v4, 0x0

    .line 115
    const/4 v5, 0x0

    .line 116
    invoke-static/range {v3 .. v9}, Lu2/F$e;->b(Lu2/F$e;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;ILjava/lang/Object;)Lu2/F$e;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sput-object v0, Lu2/c;->f:Lu2/F$e;

    .line 121
    .line 122
    sget-boolean v0, Landroid/os/Build;->IS_DEBUGGABLE:Z

    .line 123
    .line 124
    sput-boolean v0, Lu2/c;->g:Z

    .line 125
    .line 126
    invoke-virtual {v2}, Lu2/F$l;->g()J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    const-wide/16 v2, 0x10a

    .line 131
    .line 132
    sub-long/2addr v0, v2

    .line 133
    sput-wide v0, Lu2/c;->h:J

    .line 134
    .line 135
    sget-object v0, LJ0/h;->m:Landroid/view/animation/Interpolator;

    .line 136
    .line 137
    sput-object v0, Lu2/c;->i:Landroid/view/animation/Interpolator;

    .line 138
    .line 139
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 140
    .line 141
    const v1, 0x3e4ccccd    # 0.2f

    .line 142
    .line 143
    .line 144
    invoke-direct {v0, v1, v15, v10, v10}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lu2/c;->j:Landroid/view/animation/PathInterpolator;

    .line 148
    .line 149
    return-void
.end method

.method public static final synthetic a()J
    .locals 2

    .line 1
    sget-wide v0, Lu2/c;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic b()Lu2/F$e;
    .locals 1

    .line 1
    sget-object v0, Lu2/c;->e:Lu2/F$e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic c()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    sget-object v0, Lu2/c;->i:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic d()Landroid/view/animation/PathInterpolator;
    .locals 1

    .line 1
    sget-object v0, Lu2/c;->j:Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic e()Lu2/F$e;
    .locals 1

    .line 1
    sget-object v0, Lu2/c;->f:Lu2/F$e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic f()Lu2/F$j;
    .locals 1

    .line 1
    sget-object v0, Lu2/c;->c:Lu2/F$j;

    .line 2
    .line 3
    return-object v0
.end method
