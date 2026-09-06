.class public final Lcom/android/launcher3/anim/y;
.super Ljava/lang/Object;
.source "AppLaunchAnimUtil.kt"


# static fields
.field public static final a:Lcom/android/launcher3/anim/y;

.field private static final b:[J

.field private static final c:Landroid/view/animation/PathInterpolator;

.field private static final d:Landroid/view/animation/PathInterpolator;

.field private static e:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/y;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/anim/y;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/anim/y;->a:Lcom/android/launcher3/anim/y;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [J

    .line 10
    .line 11
    fill-array-data v0, :array_0

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/launcher3/anim/y;->b:[J

    .line 15
    .line 16
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 17
    .line 18
    const v1, 0x3e051eb8    # 0.13f

    .line 19
    .line 20
    .line 21
    const v2, 0x3e19999a    # 0.15f

    .line 22
    .line 23
    .line 24
    const v3, 0x3dcccccd    # 0.1f

    .line 25
    .line 26
    .line 27
    const/high16 v4, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/android/launcher3/anim/y;->c:Landroid/view/animation/PathInterpolator;

    .line 33
    .line 34
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 35
    .line 36
    const v1, 0x3ed70a3d    # 0.42f

    .line 37
    .line 38
    .line 39
    const v2, 0x3e23d70a    # 0.16f

    .line 40
    .line 41
    .line 42
    const v3, 0x3eeb851f    # 0.46f

    .line 43
    .line 44
    .line 45
    invoke-direct {v0, v3, v1, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/android/launcher3/anim/y;->d:Landroid/view/animation/PathInterpolator;

    .line 49
    .line 50
    const-wide/16 v0, -0x1

    .line 51
    .line 52
    sput-wide v0, Lcom/android/launcher3/anim/y;->e:J

    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 8
        0x1c2
        0x1c2
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a()J
    .locals 4

    .line 1
    invoke-static {}, LM3/a;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-wide v0, Lcom/android/launcher3/anim/x;->g:J

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v3, "getAnimDuration, sEvaluationDuration = "

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "AppLaunchAnimUtil"

    .line 27
    .line 28
    invoke-static {v1, v0}, LM3/a;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    sget-object v0, Lcom/android/launcher3/anim/x;->c:Lcom/android/launcher3/anim/x$a;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/anim/x$a;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    sget-wide v0, Lcom/android/launcher3/anim/x;->g:J

    .line 40
    .line 41
    return-wide v0

    .line 42
    :cond_1
    sget-object v0, Lcom/android/launcher3/anim/y;->b:[J

    .line 43
    .line 44
    sget v1, Lcom/android/launcher3/anim/x;->e:I

    .line 45
    .line 46
    aget-wide v0, v0, v1

    .line 47
    .line 48
    return-wide v0
.end method

.method public static final b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;
    .locals 17

    .line 1
    move/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v12, p2

    .line 4
    .line 5
    const-string v0, "targets"

    .line 6
    .line 7
    move-object/from16 v5, p0

    .line 8
    .line 9
    invoke-static {v5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "launcher"

    .line 13
    .line 14
    invoke-static {v12, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget v0, Lcom/android/launcher3/anim/x;->e:I

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v3, "getLightWindowAnimation, isOpen = "

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v3, ", sSpeedLevel = "

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v2, "AppLaunchAnimUtil"

    .line 45
    .line 46
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    new-instance v15, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 50
    .line 51
    invoke-virtual {v12}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {v15, v0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    new-instance v10, Landroid/graphics/Matrix;

    .line 59
    .line 60
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 61
    .line 62
    .line 63
    new-instance v13, Landroid/graphics/Point;

    .line 64
    .line 65
    invoke-direct {v13}, Landroid/graphics/Point;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v14, Landroid/graphics/Rect;

    .line 69
    .line 70
    invoke-direct {v14}, Landroid/graphics/Rect;-><init>()V

    .line 71
    .line 72
    .line 73
    new-instance v6, Lkotlin/jvm/internal/A;

    .line 74
    .line 75
    invoke-direct {v6}, Lkotlin/jvm/internal/A;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v12}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 83
    .line 84
    int-to-float v0, v0

    .line 85
    const/high16 v2, 0x40000000    # 2.0f

    .line 86
    .line 87
    div-float/2addr v0, v2

    .line 88
    iput v0, v6, Lkotlin/jvm/internal/A;->g:F

    .line 89
    .line 90
    new-instance v7, Lkotlin/jvm/internal/A;

    .line 91
    .line 92
    invoke-direct {v7}, Lkotlin/jvm/internal/A;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v12}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 100
    .line 101
    int-to-float v0, v0

    .line 102
    div-float/2addr v0, v2

    .line 103
    iput v0, v7, Lkotlin/jvm/internal/A;->g:F

    .line 104
    .line 105
    invoke-static {}, Lcom/android/launcher3/anim/y;->a()J

    .line 106
    .line 107
    .line 108
    move-result-wide v2

    .line 109
    if-eqz v1, :cond_0

    .line 110
    .line 111
    sget-object v0, Lcom/android/launcher3/anim/y;->c:Landroid/view/animation/PathInterpolator;

    .line 112
    .line 113
    :goto_0
    move-object v4, v0

    .line 114
    goto :goto_1

    .line 115
    :cond_0
    sget-object v0, Lcom/android/launcher3/anim/y;->d:Landroid/view/animation/PathInterpolator;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :goto_1
    invoke-static {v12}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    if-eqz v0, :cond_1

    .line 123
    .line 124
    const/4 v0, 0x1

    .line 125
    :goto_2
    move v9, v0

    .line 126
    goto :goto_3

    .line 127
    :cond_1
    const/4 v0, 0x0

    .line 128
    goto :goto_2

    .line 129
    :goto_3
    const/4 v0, 0x2

    .line 130
    new-array v0, v0, [F

    .line 131
    .line 132
    fill-array-data v0, :array_0

    .line 133
    .line 134
    .line 135
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 143
    .line 144
    .line 145
    move-object v8, v0

    .line 146
    new-instance v0, Lcom/android/launcher3/anim/y$a;

    .line 147
    .line 148
    move/from16 v11, p3

    .line 149
    .line 150
    move-object/from16 v16, v8

    .line 151
    .line 152
    move/from16 v8, p4

    .line 153
    .line 154
    invoke-direct/range {v0 .. v15}, Lcom/android/launcher3/anim/y$a;-><init>(ZJLandroid/view/animation/PathInterpolator;[Lu2/s;Lkotlin/jvm/internal/A;Lkotlin/jvm/internal/A;ZZLandroid/graphics/Matrix;FLcom/android/launcher3/C2;Landroid/graphics/Point;Landroid/graphics/Rect;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 155
    .line 156
    .line 157
    move-object/from16 v8, v16

    .line 158
    .line 159
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 160
    .line 161
    .line 162
    new-instance v0, Lcom/android/launcher3/anim/y$b;

    .line 163
    .line 164
    invoke-direct {v0, v1, v12}, Lcom/android/launcher3/anim/y$b;-><init>(ZLcom/android/launcher3/C2;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v8}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    return-object v8

    .line 174
    nop

    .line 175
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
