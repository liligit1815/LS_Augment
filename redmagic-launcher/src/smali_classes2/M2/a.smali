.class public LM2/a;
.super Ljava/lang/Object;
.source "Interpolators.java"


# static fields
.field public static final a:Landroid/view/animation/Interpolator;

.field public static final b:Landroid/view/animation/Interpolator;

.field public static final c:Landroid/view/animation/Interpolator;

.field public static final d:Landroid/view/animation/Interpolator;

.field public static final e:Landroid/view/animation/Interpolator;

.field public static final f:Landroid/view/animation/Interpolator;

.field public static final g:Landroid/view/animation/Interpolator;

.field public static final h:Landroid/view/animation/Interpolator;

.field public static final i:Landroid/view/animation/Interpolator;

.field public static final j:Landroid/view/animation/Interpolator;

.field public static final k:Landroid/view/animation/Interpolator;

.field public static final l:Landroid/view/animation/Interpolator;

.field public static final m:Landroid/view/animation/Interpolator;

.field public static final n:Landroid/view/animation/PathInterpolator;

.field public static final o:Landroid/view/animation/PathInterpolator;

.field public static final p:Landroid/view/animation/PathInterpolator;

.field public static final q:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM2/a;->a:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 9
    .line 10
    const v1, 0x3ecccccd    # 0.4f

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/high16 v3, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 17
    .line 18
    .line 19
    sput-object v0, LM2/a;->b:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 22
    .line 23
    const v4, 0x3f4ccccd    # 0.8f

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, v2, v2, v4, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 27
    .line 28
    .line 29
    sput-object v0, LM2/a;->c:Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2, v3, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 34
    .line 35
    .line 36
    sput-object v0, LM2/a;->d:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 39
    .line 40
    const v5, 0x3e4ccccd    # 0.2f

    .line 41
    .line 42
    .line 43
    invoke-direct {v0, v1, v2, v5, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 44
    .line 45
    .line 46
    sput-object v0, LM2/a;->e:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 49
    .line 50
    invoke-direct {v0, v2, v2, v5, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 51
    .line 52
    .line 53
    sput-object v0, LM2/a;->f:Landroid/view/animation/Interpolator;

    .line 54
    .line 55
    invoke-static {}, LM2/a;->a()Landroid/view/animation/PathInterpolator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, LM2/a;->g:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 62
    .line 63
    const v1, 0x3e19999a    # 0.15f

    .line 64
    .line 65
    .line 66
    const v5, 0x3e99999a    # 0.3f

    .line 67
    .line 68
    .line 69
    invoke-direct {v0, v5, v2, v4, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 70
    .line 71
    .line 72
    sput-object v0, LM2/a;->h:Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 75
    .line 76
    const v1, 0x3d4ccccd    # 0.05f

    .line 77
    .line 78
    .line 79
    const v4, 0x3f333333    # 0.7f

    .line 80
    .line 81
    .line 82
    const v6, 0x3dcccccd    # 0.1f

    .line 83
    .line 84
    .line 85
    invoke-direct {v0, v1, v4, v6, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 86
    .line 87
    .line 88
    sput-object v0, LM2/a;->i:Landroid/view/animation/Interpolator;

    .line 89
    .line 90
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 91
    .line 92
    invoke-direct {v0, v5, v2, v3, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 93
    .line 94
    .line 95
    sput-object v0, LM2/a;->j:Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 98
    .line 99
    invoke-direct {v0, v2, v2, v2, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 100
    .line 101
    .line 102
    sput-object v0, LM2/a;->k:Landroid/view/animation/Interpolator;

    .line 103
    .line 104
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 105
    .line 106
    invoke-direct {v0, v5, v2, v6, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 107
    .line 108
    .line 109
    sput-object v0, LM2/a;->l:Landroid/view/animation/Interpolator;

    .line 110
    .line 111
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 112
    .line 113
    const/high16 v1, 0x3f000000    # 0.5f

    .line 114
    .line 115
    invoke-direct {v0, v5, v2, v1, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 116
    .line 117
    .line 118
    sput-object v0, LM2/a;->m:Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 121
    .line 122
    invoke-direct {v0, v1, v3, v1, v3}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 123
    .line 124
    .line 125
    sput-object v0, LM2/a;->n:Landroid/view/animation/PathInterpolator;

    .line 126
    .line 127
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 128
    .line 129
    const v1, 0x3f051eb8    # 0.52f

    .line 130
    .line 131
    .line 132
    const v2, -0x421eb852    # -0.11f

    .line 133
    .line 134
    .line 135
    const v3, 0x3e6b851f    # 0.23f

    .line 136
    .line 137
    .line 138
    const v4, 0x3f5eb852    # 0.87f

    .line 139
    .line 140
    .line 141
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 142
    .line 143
    .line 144
    sput-object v0, LM2/a;->o:Landroid/view/animation/PathInterpolator;

    .line 145
    .line 146
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 147
    .line 148
    const v1, 0x3f547ae1    # 0.83f

    .line 149
    .line 150
    .line 151
    invoke-direct {v0, v3, v4, v1, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 152
    .line 153
    .line 154
    sput-object v0, LM2/a;->p:Landroid/view/animation/PathInterpolator;

    .line 155
    .line 156
    new-instance v0, Landroid/view/animation/BackGestureInterpolator;

    .line 157
    .line 158
    invoke-direct {v0}, Landroid/view/animation/BackGestureInterpolator;-><init>()V

    .line 159
    .line 160
    .line 161
    sput-object v0, LM2/a;->q:Landroid/view/animation/Interpolator;

    .line 162
    .line 163
    return-void
.end method

.method private static a()Landroid/view/animation/PathInterpolator;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 8
    .line 9
    .line 10
    const v5, 0x3e2aaa7e

    .line 11
    .line 12
    .line 13
    const v6, 0x3ecccccd    # 0.4f

    .line 14
    .line 15
    .line 16
    const v1, 0x3d4ccccd    # 0.05f

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const v3, 0x3e088872

    .line 21
    .line 22
    .line 23
    const v4, 0x3d75c28f    # 0.06f

    .line 24
    .line 25
    .line 26
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 27
    .line 28
    .line 29
    const/high16 v5, 0x3f800000    # 1.0f

    .line 30
    .line 31
    const/high16 v6, 0x3f800000    # 1.0f

    .line 32
    .line 33
    const v1, 0x3e55553f    # 0.208333f

    .line 34
    .line 35
    .line 36
    const v2, 0x3f51eb85    # 0.82f

    .line 37
    .line 38
    .line 39
    const/high16 v3, 0x3e800000    # 0.25f

    .line 40
    .line 41
    const/high16 v4, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Landroid/view/animation/PathInterpolator;-><init>(Landroid/graphics/Path;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method
