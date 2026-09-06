.class Lcom/android/launcher3/q5$I;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "I"
.end annotation


# instance fields
.field private final g:[Landroid/view/RemoteAnimationTarget;

.field private final h:Landroid/graphics/Matrix;

.field private final i:Landroid/graphics/Point;

.field private final j:Landroid/graphics/RectF;

.field private final k:F

.field private final l:F

.field private final m:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field private final n:Landroid/graphics/Rect;

.field private final o:Landroid/graphics/Rect;

.field private final p:Landroid/graphics/Rect;

.field final q:I

.field final r:F

.field final s:F

.field final t:Z

.field final synthetic u:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$I;->u:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Point;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/q5$I;->i:Landroid/graphics/Point;

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 26
    .line 27
    new-instance v0, Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/q5$I;->n:Landroid/graphics/Rect;

    .line 33
    .line 34
    new-instance v1, Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 40
    .line 41
    new-instance v2, Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/android/launcher3/q5$I;->g:[Landroid/view/RemoteAnimationTarget;

    .line 49
    .line 50
    iput p6, p0, Lcom/android/launcher3/q5$I;->k:F

    .line 51
    .line 52
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 53
    .line 54
    .line 55
    move-result p6

    .line 56
    const/high16 v2, 0x3f800000    # 1.0f

    .line 57
    .line 58
    invoke-static {v2, p6}, Ljava/lang/Math;->max(FF)F

    .line 59
    .line 60
    .line 61
    move-result p6

    .line 62
    const/high16 v2, 0x40000000    # 2.0f

    .line 63
    .line 64
    div-float/2addr p6, v2

    .line 65
    iput p6, p0, Lcom/android/launcher3/q5$I;->l:F

    .line 66
    .line 67
    new-instance p6, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 68
    .line 69
    iget-object v2, p1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 70
    .line 71
    invoke-direct {p6, v2}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    iput-object p6, p0, Lcom/android/launcher3/q5$I;->m:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 75
    .line 76
    invoke-virtual {v0, p4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    const/4 p6, 0x1

    .line 83
    const/4 v0, 0x0

    .line 84
    if-eqz p2, :cond_1

    .line 85
    .line 86
    array-length v1, p2

    .line 87
    move v2, v0

    .line 88
    :goto_0
    if-ge v2, v1, :cond_1

    .line 89
    .line 90
    aget-object v3, p2, v2

    .line 91
    .line 92
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 93
    .line 94
    if-ne v4, p6, :cond_0

    .line 95
    .line 96
    new-instance p2, Landroid/graphics/RectF;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/android/launcher3/q5$I;->n:Landroid/graphics/Rect;

    .line 99
    .line 100
    invoke-direct {p2, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 101
    .line 102
    .line 103
    new-instance v1, Landroid/graphics/RectF;

    .line 104
    .line 105
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v3, p2, v0, v1}, Lcom/android/launcher3/q5;->d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Lcom/android/launcher3/q5$I;->n:Landroid/graphics/Rect;

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2, p5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v3, p2, v0, v1}, Lcom/android/launcher3/q5;->d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 123
    .line 124
    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_1
    :goto_1
    iput p8, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 132
    .line 133
    iput p7, p0, Lcom/android/launcher3/q5$I;->r:F

    .line 134
    .line 135
    iput p9, p0, Lcom/android/launcher3/q5$I;->s:F

    .line 136
    .line 137
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    int-to-float p1, p1

    .line 142
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    int-to-float p2, p2

    .line 147
    div-float/2addr p1, p2

    .line 148
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    div-float/2addr p2, p3

    .line 157
    cmpl-float p1, p1, p2

    .line 158
    .line 159
    if-lez p1, :cond_2

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_2
    move p6, v0

    .line 163
    :goto_2
    iput-boolean p6, p0, Lcom/android/launcher3/q5$I;->t:Z

    .line 164
    .line 165
    return-void
.end method


# virtual methods
.method public a(F)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/q5$I;->k:F

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/q5$I;->l:F

    .line 4
    .line 5
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public b(F)F
    .locals 6

    .line 1
    sget v2, Lcom/android/launcher3/anim/C;->W:F

    .line 2
    .line 3
    iget v3, p0, Lcom/android/launcher3/q5$I;->r:F

    .line 4
    .line 5
    iget v4, p0, Lcom/android/launcher3/q5$I;->s:F

    .line 6
    .line 7
    sget-object v5, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v0, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected c(F)F
    .locals 8

    .line 1
    iget p0, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    sget v3, Lcom/android/launcher3/anim/C;->W:F

    .line 9
    .line 10
    sget v4, Lcom/android/launcher3/anim/C;->X:F

    .line 11
    .line 12
    const/high16 v6, 0x3f800000    # 1.0f

    .line 13
    .line 14
    sget-object v7, Lcom/android/launcher3/anim/L;->A:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    move v2, p1

    .line 18
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    sub-float/2addr v1, p0

    .line 23
    return v1

    .line 24
    :cond_0
    move v2, p1

    .line 25
    const/4 p1, 0x2

    .line 26
    if-ne p0, p1, :cond_1

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    sget-object v7, Lcom/android/launcher3/anim/L;->B:Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    const/high16 v4, 0x3f000000    # 0.5f

    .line 33
    .line 34
    const/high16 v5, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p1, 0x3

    .line 42
    if-ne p0, p1, :cond_2

    .line 43
    .line 44
    const/4 v6, 0x0

    .line 45
    sget-object v7, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    const v4, 0x3f5eb852    # 0.87f

    .line 49
    .line 50
    .line 51
    const/high16 v5, 0x3f800000    # 1.0f

    .line 52
    .line 53
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_2
    const/4 p1, 0x5

    .line 59
    if-ne p0, p1, :cond_3

    .line 60
    .line 61
    return v1

    .line 62
    :cond_3
    sget v3, Lcom/android/launcher3/anim/C;->W:F

    .line 63
    .line 64
    sget v4, Lcom/android/launcher3/anim/C;->X:F

    .line 65
    .line 66
    cmpg-float p0, v2, v3

    .line 67
    .line 68
    if-gtz p0, :cond_4

    .line 69
    .line 70
    return v1

    .line 71
    :cond_4
    cmpl-float p0, v2, v4

    .line 72
    .line 73
    if-ltz p0, :cond_5

    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return p0

    .line 77
    :cond_5
    const/4 v6, 0x0

    .line 78
    sget-object v7, Lcom/android/launcher3/anim/L;->A:Landroid/view/animation/Interpolator;

    .line 79
    .line 80
    const/high16 v5, 0x3f800000    # 1.0f

    .line 81
    .line 82
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0
.end method

.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 11

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/q5$I;->g:[Landroid/view/RemoteAnimationTarget;

    .line 7
    .line 8
    array-length v1, v1

    .line 9
    const/4 v2, 0x1

    .line 10
    sub-int/2addr v1, v2

    .line 11
    :goto_0
    if-ltz v1, :cond_9

    .line 12
    .line 13
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->g:[Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    aget-object v3, v3, v1

    .line 16
    .line 17
    iget-object v4, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 18
    .line 19
    invoke-virtual {v0, v4}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v5, v3, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 24
    .line 25
    if-eqz v5, :cond_0

    .line 26
    .line 27
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->i:Landroid/graphics/Point;

    .line 28
    .line 29
    iget v7, v5, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    invoke-virtual {v6, v7, v5}, Landroid/graphics/Point;->set(II)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object v5, p0, Lcom/android/launcher3/q5$I;->i:Landroid/graphics/Point;

    .line 38
    .line 39
    iget-object v6, v3, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 40
    .line 41
    iget v7, v6, Landroid/graphics/Point;->x:I

    .line 42
    .line 43
    iget v6, v6, Landroid/graphics/Point;->y:I

    .line 44
    .line 45
    invoke-virtual {v5, v7, v6}, Landroid/graphics/Point;->set(II)V

    .line 46
    .line 47
    .line 48
    :goto_1
    iget v5, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 49
    .line 50
    const/high16 v6, 0x3f800000    # 1.0f

    .line 51
    .line 52
    if-ne v5, v2, :cond_7

    .line 53
    .line 54
    iget-object v5, p0, Lcom/android/launcher3/q5$I;->u:Lcom/android/launcher3/q5;

    .line 55
    .line 56
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 57
    .line 58
    const/4 v8, 0x0

    .line 59
    invoke-virtual {v5, v3, p1, v8, v7}, Lcom/android/launcher3/q5;->d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    int-to-float v3, v3

    .line 69
    iget-object v5, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 70
    .line 71
    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    int-to-float v5, v5

    .line 76
    div-float/2addr v3, v5

    .line 77
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    div-float/2addr v5, v7

    .line 86
    cmpl-float v3, v3, v5

    .line 87
    .line 88
    const/4 v5, 0x5

    .line 89
    if-lez v3, :cond_1

    .line 90
    .line 91
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 92
    .line 93
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 98
    .line 99
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    int-to-float v7, v7

    .line 104
    div-float/2addr v3, v7

    .line 105
    invoke-static {v6, v3}, Ljava/lang/Math;->min(FF)F

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 110
    .line 111
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 112
    .line 113
    .line 114
    move-result v7

    .line 115
    div-float/2addr v6, v3

    .line 116
    mul-float/2addr v7, v6

    .line 117
    float-to-int v6, v7

    .line 118
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 119
    .line 120
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    sub-int/2addr v7, v6

    .line 125
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 126
    .line 127
    iget-object v9, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 128
    .line 129
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    .line 130
    .line 131
    .line 132
    move-result v9

    .line 133
    iget-object v10, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 134
    .line 135
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    .line 136
    .line 137
    .line 138
    move-result v10

    .line 139
    sub-int/2addr v10, v7

    .line 140
    invoke-virtual {v6, v8, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 141
    .line 142
    .line 143
    iget v6, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 144
    .line 145
    if-ne v6, v5, :cond_2

    .line 146
    .line 147
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 148
    .line 149
    invoke-virtual {v6, v8, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 154
    .line 155
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 160
    .line 161
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    int-to-float v7, v7

    .line 166
    div-float/2addr v3, v7

    .line 167
    invoke-static {v6, v3}, Ljava/lang/Math;->min(FF)F

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 172
    .line 173
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    div-float/2addr v6, v3

    .line 178
    mul-float/2addr v7, v6

    .line 179
    float-to-int v6, v7

    .line 180
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 181
    .line 182
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 183
    .line 184
    .line 185
    move-result v7

    .line 186
    sub-int/2addr v7, v6

    .line 187
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 188
    .line 189
    iget-object v9, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 190
    .line 191
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    sub-int/2addr v9, v7

    .line 196
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 197
    .line 198
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 199
    .line 200
    .line 201
    move-result v7

    .line 202
    invoke-virtual {v6, v8, v8, v9, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 203
    .line 204
    .line 205
    :cond_2
    :goto_2
    iget v6, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 206
    .line 207
    if-ne v6, v2, :cond_3

    .line 208
    .line 209
    iget v6, p0, Lcom/android/launcher3/q5$I;->k:F

    .line 210
    .line 211
    iget v7, p0, Lcom/android/launcher3/q5$I;->s:F

    .line 212
    .line 213
    invoke-static {p2, v6, v7}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 218
    .line 219
    .line 220
    move-result v7

    .line 221
    iget-object v8, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 222
    .line 223
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    int-to-float v8, v8

    .line 228
    div-float/2addr v7, v8

    .line 229
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    iget-object v9, p0, Lcom/android/launcher3/q5$I;->o:Landroid/graphics/Rect;

    .line 234
    .line 235
    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    .line 236
    .line 237
    .line 238
    move-result v9

    .line 239
    int-to-float v9, v9

    .line 240
    div-float/2addr v8, v9

    .line 241
    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    div-float/2addr v6, v7

    .line 246
    goto :goto_4

    .line 247
    :cond_3
    iget-boolean v6, p0, Lcom/android/launcher3/q5$I;->t:Z

    .line 248
    .line 249
    if-eqz v6, :cond_4

    .line 250
    .line 251
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 252
    .line 253
    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    .line 254
    .line 255
    .line 256
    move-result v6

    .line 257
    int-to-float v6, v6

    .line 258
    invoke-virtual {p0, p2}, Lcom/android/launcher3/q5$I;->b(F)F

    .line 259
    .line 260
    .line 261
    move-result v7

    .line 262
    :goto_3
    mul-float/2addr v6, v7

    .line 263
    goto :goto_4

    .line 264
    :cond_4
    iget-object v6, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 265
    .line 266
    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    .line 267
    .line 268
    .line 269
    move-result v6

    .line 270
    int-to-float v6, v6

    .line 271
    invoke-virtual {p0, p2}, Lcom/android/launcher3/q5$I;->b(F)F

    .line 272
    .line 273
    .line 274
    move-result v7

    .line 275
    goto :goto_3

    .line 276
    :goto_4
    iget v7, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 277
    .line 278
    if-ne v7, v5, :cond_5

    .line 279
    .line 280
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 281
    .line 282
    new-instance v7, Landroid/graphics/RectF;

    .line 283
    .line 284
    iget-object v8, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 285
    .line 286
    invoke-direct {v7, v8}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 287
    .line 288
    .line 289
    iget-object v8, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 290
    .line 291
    sget-object v9, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 292
    .line 293
    invoke-virtual {v3, v7, v8, v9}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 294
    .line 295
    .line 296
    goto :goto_5

    .line 297
    :cond_5
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 298
    .line 299
    invoke-virtual {v7, v3, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 300
    .line 301
    .line 302
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 303
    .line 304
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->j:Landroid/graphics/RectF;

    .line 305
    .line 306
    iget v8, v7, Landroid/graphics/RectF;->left:F

    .line 307
    .line 308
    iget v7, v7, Landroid/graphics/RectF;->top:F

    .line 309
    .line 310
    invoke-virtual {v3, v8, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 311
    .line 312
    .line 313
    :goto_5
    invoke-virtual {p0, p2}, Lcom/android/launcher3/q5$I;->c(F)F

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    iget v7, p0, Lcom/android/launcher3/q5$I;->q:I

    .line 318
    .line 319
    if-ne v7, v5, :cond_6

    .line 320
    .line 321
    invoke-static {p2}, Lcom/android/launcher3/anim/C;->a0(F)I

    .line 322
    .line 323
    .line 324
    move-result v5

    .line 325
    goto :goto_6

    .line 326
    :cond_6
    const/4 v5, -0x1

    .line 327
    :goto_6
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 328
    .line 329
    invoke-virtual {v4, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    iget-object v7, p0, Lcom/android/launcher3/q5$I;->p:Landroid/graphics/Rect;

    .line 334
    .line 335
    invoke-virtual {v4, v7}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    invoke-virtual {v4, v5}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowBlurRadius(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 340
    .line 341
    .line 342
    move-result-object v4

    .line 343
    invoke-virtual {v4, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    invoke-virtual {v3, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 348
    .line 349
    .line 350
    goto :goto_7

    .line 351
    :cond_7
    if-nez v5, :cond_8

    .line 352
    .line 353
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 354
    .line 355
    iget-object v5, p0, Lcom/android/launcher3/q5$I;->i:Landroid/graphics/Point;

    .line 356
    .line 357
    iget v7, v5, Landroid/graphics/Point;->x:I

    .line 358
    .line 359
    int-to-float v7, v7

    .line 360
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 361
    .line 362
    int-to-float v5, v5

    .line 363
    invoke-virtual {v3, v7, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 364
    .line 365
    .line 366
    iget-object v3, p0, Lcom/android/launcher3/q5$I;->h:Landroid/graphics/Matrix;

    .line 367
    .line 368
    invoke-virtual {v4, v3}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 369
    .line 370
    .line 371
    move-result-object v3

    .line 372
    invoke-virtual {v3, v6}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 373
    .line 374
    .line 375
    :cond_8
    :goto_7
    add-int/lit8 v1, v1, -0x1

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :cond_9
    iget-object p0, p0, Lcom/android/launcher3/q5$I;->m:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 380
    .line 381
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 382
    .line 383
    .line 384
    return-void
.end method
