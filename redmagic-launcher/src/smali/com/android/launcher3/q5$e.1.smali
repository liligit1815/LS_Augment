.class Lcom/android/launcher3/q5$e;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->t0(Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic A:[Landroid/view/RemoteAnimationTarget;

.field final synthetic B:Lcom/android/quickstep/views/FloatingWidgetView;

.field final synthetic C:Landroid/view/RemoteAnimationTarget;

.field final synthetic D:Lcom/android/quickstep/util/SurfaceTransactionApplier;

.field final synthetic E:Lcom/android/launcher3/q5;

.field g:F

.field final h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic s:F

.field final synthetic t:F

.field final synthetic u:Landroid/graphics/RectF;

.field final synthetic v:Landroid/graphics/Rect;

.field final synthetic w:Landroid/graphics/Rect;

.field final synthetic x:Landroid/graphics/Matrix;

.field final synthetic y:Lcom/android/launcher3/anim/C;

.field final synthetic z:Z


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;FFLandroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Lcom/android/launcher3/anim/C;Z[Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/FloatingWidgetView;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$e;->E:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/q5$e;->s:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/q5$e;->t:F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/q5$e;->v:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/launcher3/q5$e;->w:Landroid/graphics/Rect;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 16
    .line 17
    iput-boolean p9, p0, Lcom/android/launcher3/q5$e;->z:Z

    .line 18
    .line 19
    iput-object p10, p0, Lcom/android/launcher3/q5$e;->A:[Landroid/view/RemoteAnimationTarget;

    .line 20
    .line 21
    iput-object p11, p0, Lcom/android/launcher3/q5$e;->B:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 22
    .line 23
    iput-object p12, p0, Lcom/android/launcher3/q5$e;->C:Landroid/view/RemoteAnimationTarget;

    .line 24
    .line 25
    iput-object p13, p0, Lcom/android/launcher3/q5$e;->D:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 28
    .line 29
    .line 30
    const/high16 p1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    iput p1, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 33
    .line 34
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 35
    .line 36
    sget-object p7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    sget p8, Lcom/android/launcher3/anim/C;->S:I

    .line 39
    .line 40
    int-to-float p9, p8

    .line 41
    const/4 p10, 0x0

    .line 42
    invoke-static {p7, p10, p10, p9}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    .line 45
    move-result-object p9

    .line 46
    invoke-direct {p6, p0, p1, p10, p9}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 47
    .line 48
    .line 49
    iput-object p6, p0, Lcom/android/launcher3/q5$e;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 50
    .line 51
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 52
    .line 53
    sget-wide p11, Lcom/android/launcher3/q5;->V:J

    .line 54
    .line 55
    long-to-float p9, p11

    .line 56
    const/high16 p13, 0x42960000    # 75.0f

    .line 57
    .line 58
    invoke-static {p7, p10, p13, p9}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    .line 61
    move-result-object p9

    .line 62
    invoke-direct {p6, p0, p10, p1, p9}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 63
    .line 64
    .line 65
    iput-object p6, p0, Lcom/android/launcher3/q5$e;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 66
    .line 67
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 68
    .line 69
    const/high16 p9, 0x43160000    # 150.0f

    .line 70
    .line 71
    int-to-float p8, p8

    .line 72
    invoke-static {p7, p10, p9, p8}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    .line 75
    move-result-object p7

    .line 76
    invoke-direct {p6, p0, p10, p1, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 77
    .line 78
    .line 79
    iput-object p6, p0, Lcom/android/launcher3/q5$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 80
    .line 81
    new-instance p6, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 82
    .line 83
    sget-object p7, Lcom/android/launcher3/anim/L;->J:Landroid/view/animation/Interpolator;

    .line 84
    .line 85
    invoke-direct {p6, p0, p2, p3, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 86
    .line 87
    .line 88
    iput-object p6, p0, Lcom/android/launcher3/q5$e;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 89
    .line 90
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 91
    .line 92
    invoke-direct {p2, p0, p10, p1, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 93
    .line 94
    .line 95
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 96
    .line 97
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 98
    .line 99
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerX()F

    .line 100
    .line 101
    .line 102
    move-result p3

    .line 103
    invoke-virtual {p5}, Landroid/graphics/Rect;->centerX()I

    .line 104
    .line 105
    .line 106
    move-result p6

    .line 107
    int-to-float p6, p6

    .line 108
    invoke-direct {p2, p0, p3, p6, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 109
    .line 110
    .line 111
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 112
    .line 113
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 114
    .line 115
    invoke-virtual {p4}, Landroid/graphics/RectF;->centerY()F

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    invoke-virtual {p5}, Landroid/graphics/Rect;->centerY()I

    .line 120
    .line 121
    .line 122
    move-result p6

    .line 123
    int-to-float p6, p6

    .line 124
    invoke-direct {p2, p0, p3, p6, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 125
    .line 126
    .line 127
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 128
    .line 129
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 130
    .line 131
    invoke-virtual {p4}, Landroid/graphics/RectF;->width()F

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    invoke-virtual {p5}, Landroid/graphics/Rect;->width()I

    .line 136
    .line 137
    .line 138
    move-result p6

    .line 139
    int-to-float p6, p6

    .line 140
    invoke-direct {p2, p0, p3, p6, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 141
    .line 142
    .line 143
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 144
    .line 145
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 146
    .line 147
    invoke-virtual {p4}, Landroid/graphics/RectF;->height()F

    .line 148
    .line 149
    .line 150
    move-result p3

    .line 151
    invoke-virtual {p5}, Landroid/graphics/Rect;->height()I

    .line 152
    .line 153
    .line 154
    move-result p4

    .line 155
    int-to-float p4, p4

    .line 156
    invoke-direct {p2, p0, p3, p4, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 157
    .line 158
    .line 159
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 160
    .line 161
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 162
    .line 163
    sget-object p3, Lcom/android/launcher3/q5;->Y:Landroid/view/animation/Interpolator;

    .line 164
    .line 165
    long-to-float p4, p11

    .line 166
    const/high16 p5, 0x43050000    # 133.0f

    .line 167
    .line 168
    invoke-static {p3, p10, p5, p4}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 169
    .line 170
    .line 171
    move-result-object p3

    .line 172
    invoke-direct {p2, p0, p1, p10, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 173
    .line 174
    .line 175
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 176
    .line 177
    new-instance p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 178
    .line 179
    sget-object p3, Lcom/android/launcher3/q5;->X:Landroid/view/animation/Interpolator;

    .line 180
    .line 181
    sget-wide p6, Lcom/android/launcher3/q5;->W:J

    .line 182
    .line 183
    long-to-float p4, p6

    .line 184
    long-to-float p6, p11

    .line 185
    invoke-static {p3, p4, p5, p6}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 186
    .line 187
    .line 188
    move-result-object p3

    .line 189
    invoke-direct {p2, p0, p10, p1, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 190
    .line 191
    .line 192
    iput-object p2, p0, Lcom/android/launcher3/q5$e;->r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 193
    .line 194
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 8

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->m:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    .line 5
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->o:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 8
    .line 9
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 10
    .line 11
    const/high16 v2, 0x40000000    # 2.0f

    .line 12
    .line 13
    div-float v3, v1, v2

    .line 14
    .line 15
    sub-float v3, v0, v3

    .line 16
    .line 17
    iget-object v4, p0, Lcom/android/launcher3/q5$e;->n:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 18
    .line 19
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 20
    .line 21
    iget-object v5, p0, Lcom/android/launcher3/q5$e;->p:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 22
    .line 23
    iget v5, v5, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 24
    .line 25
    div-float v6, v5, v2

    .line 26
    .line 27
    sub-float v6, v4, v6

    .line 28
    .line 29
    div-float/2addr v1, v2

    .line 30
    add-float/2addr v0, v1

    .line 31
    div-float/2addr v5, v2

    .line 32
    add-float/2addr v4, v5

    .line 33
    invoke-virtual {p2, v3, v6, v0, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->v:Landroid/graphics/Rect;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    int-to-float v0, v0

    .line 49
    div-float/2addr p2, v0

    .line 50
    iput p2, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 51
    .line 52
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->w:Landroid/graphics/Rect;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->v:Landroid/graphics/Rect;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget v2, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 67
    .line 68
    div-float/2addr v1, v2

    .line 69
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    const/4 v2, 0x0

    .line 74
    invoke-virtual {p2, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 80
    .line 81
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 82
    .line 83
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 84
    .line 85
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 86
    .line 87
    .line 88
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 89
    .line 90
    iget v0, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 91
    .line 92
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 95
    .line 96
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 97
    .line 98
    invoke-virtual {p2, v0, v0, v2, v1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->E:Lcom/android/launcher3/q5;

    .line 102
    .line 103
    invoke-static {p2}, Lcom/android/launcher3/q5;->m(Lcom/android/launcher3/q5;)Lcom/android/launcher3/M2$b;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    const/high16 v0, 0x3f800000    # 1.0f

    .line 108
    .line 109
    if-eqz p2, :cond_1

    .line 110
    .line 111
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->E:Lcom/android/launcher3/q5;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/android/launcher3/q5;->m(Lcom/android/launcher3/q5;)Lcom/android/launcher3/M2$b;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-interface {p2}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    if-eqz p2, :cond_1

    .line 122
    .line 123
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 124
    .line 125
    invoke-virtual {p2}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p2}, Lu2/e;->c()Landroid/graphics/RectF;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 134
    .line 135
    invoke-virtual {p2, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 136
    .line 137
    .line 138
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 139
    .line 140
    invoke-virtual {p2}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p2, p1}, Lu2/e;->i(F)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p1}, Lu2/e;->d()Landroid/graphics/Matrix;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 158
    .line 159
    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p1}, Lu2/e;->a()Landroid/graphics/Rect;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->w:Landroid/graphics/Rect;

    .line 173
    .line 174
    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {}, Lx1/O;->U2()Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-eqz p2, :cond_0

    .line 188
    .line 189
    move p2, v0

    .line 190
    goto :goto_0

    .line 191
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 192
    .line 193
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 194
    .line 195
    :goto_0
    invoke-virtual {p1, p2}, Lu2/e;->l(F)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {}, Lx1/O;->U2()Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    xor-int/lit8 p2, p2, 0x1

    .line 209
    .line 210
    invoke-virtual {p1, p2}, Lu2/e;->k(Z)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/android/launcher3/q5$e;->y:Lcom/android/launcher3/anim/C;

    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 220
    .line 221
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 222
    .line 223
    iget v1, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 224
    .line 225
    div-float/2addr p2, v1

    .line 226
    invoke-virtual {p1, p2}, Lu2/e;->m(F)V

    .line 227
    .line 228
    .line 229
    :cond_1
    new-instance p1, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 230
    .line 231
    invoke-direct {p1}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 232
    .line 233
    .line 234
    iget-boolean p2, p0, Lcom/android/launcher3/q5$e;->z:Z

    .line 235
    .line 236
    if-eqz p2, :cond_2

    .line 237
    .line 238
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 239
    .line 240
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 241
    .line 242
    sub-float/2addr v0, p2

    .line 243
    :cond_2
    move v3, v0

    .line 244
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->A:[Landroid/view/RemoteAnimationTarget;

    .line 245
    .line 246
    array-length p2, p2

    .line 247
    add-int/lit8 p2, p2, -0x1

    .line 248
    .line 249
    :goto_1
    if-ltz p2, :cond_4

    .line 250
    .line 251
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->A:[Landroid/view/RemoteAnimationTarget;

    .line 252
    .line 253
    aget-object v0, v0, p2

    .line 254
    .line 255
    iget-object v1, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 256
    .line 257
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 258
    .line 259
    .line 260
    move-result-object v7

    .line 261
    iget v0, v0, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 262
    .line 263
    if-nez v0, :cond_3

    .line 264
    .line 265
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->B:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 266
    .line 267
    iget-object v2, p0, Lcom/android/launcher3/q5$e;->u:Landroid/graphics/RectF;

    .line 268
    .line 269
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 270
    .line 271
    iget v4, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 272
    .line 273
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 274
    .line 275
    iget v5, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 276
    .line 277
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->l:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 278
    .line 279
    iget v6, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 280
    .line 281
    invoke-virtual/range {v1 .. v6}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 285
    .line 286
    invoke-virtual {v7, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->w:Landroid/graphics/Rect;

    .line 291
    .line 292
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 297
    .line 298
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iget-object v1, p0, Lcom/android/launcher3/q5$e;->k:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 305
    .line 306
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 307
    .line 308
    iget v2, p0, Lcom/android/launcher3/q5$e;->g:F

    .line 309
    .line 310
    div-float/2addr v1, v2

    .line 311
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 312
    .line 313
    .line 314
    :cond_3
    add-int/lit8 p2, p2, -0x1

    .line 315
    .line 316
    goto :goto_1

    .line 317
    :cond_4
    iget-object p2, p0, Lcom/android/launcher3/q5$e;->C:Landroid/view/RemoteAnimationTarget;

    .line 318
    .line 319
    if-eqz p2, :cond_6

    .line 320
    .line 321
    iget-object p2, p2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 322
    .line 323
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 328
    .line 329
    iget v1, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 330
    .line 331
    invoke-virtual {v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->getStartValue()F

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    cmpl-float v0, v1, v0

    .line 336
    .line 337
    if-lez v0, :cond_5

    .line 338
    .line 339
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->x:Landroid/graphics/Matrix;

    .line 340
    .line 341
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->w:Landroid/graphics/Rect;

    .line 346
    .line 347
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 348
    .line 349
    .line 350
    move-result-object p2

    .line 351
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->r:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 352
    .line 353
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 354
    .line 355
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 356
    .line 357
    .line 358
    goto :goto_2

    .line 359
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/q5$e;->q:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 360
    .line 361
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 362
    .line 363
    invoke-virtual {p2, v0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 364
    .line 365
    .line 366
    :cond_6
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/q5$e;->D:Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 367
    .line 368
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 369
    .line 370
    .line 371
    return-void
.end method
