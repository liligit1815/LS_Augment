.class Lcom/android/quickstep/AbsSwipeUpHandler$16;
.super Ljava/lang/Object;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->createBreakAppOpenAnim(Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/MultiAnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$createTransactionHelper:Lcom/android/quickstep/utils/CreateTransactionHelper;

.field final synthetic val$floatRef:Lkotlin/jvm/internal/A;

.field final synthetic val$matrix:Landroid/graphics/Matrix;

.field final synthetic val$rectF3:Landroid/graphics/RectF;

.field final synthetic val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

.field final synthetic val$taskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

.field final synthetic val$transformParams3:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

.field final synthetic val$transformParams4:Lcom/android/quickstep/util/TransformParams;

.field final synthetic val$tryConnectExistingAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/Matrix;Landroid/graphics/RectF;Lcom/android/quickstep/utils/CreateTransactionHelper;Lcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/util/TaskViewSimulator;Lkotlin/jvm/internal/A;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$matrix:Landroid/graphics/Matrix;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectF3:Landroid/graphics/RectF;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$createTransactionHelper:Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams3:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$tryConnectExistingAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$taskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 16
    .line 17
    iput-object p9, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$floatRef:Lkotlin/jvm/internal/A;

    .line 18
    .line 19
    iput-object p10, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams4:Lcom/android/quickstep/util/TransformParams;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;FFFF)V
    .locals 11

    .line 1
    const-string v0, "curRectF"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$matrix:Landroid/graphics/Matrix;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectF3:Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$createTransactionHelper:Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/quickstep/utils/CreateTransactionHelper;->createSurfaceTransaction()Lcom/android/quickstep/util/SurfaceTransaction;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams3:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectF3:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/util/animation/RectTransformHelper;->calculateWindowScale(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$tryConnectExistingAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMStartRadius()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    cmpl-float v0, p4, v0

    .line 36
    .line 37
    if-lez v0, :cond_0

    .line 38
    .line 39
    const v0, 0x3f8ccccd    # 1.1f

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$tryConnectExistingAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMStartRadius()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$taskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {p4, v0, v1}, Lcom/android/launcher3/N5;->e(FFF)F

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$tryConnectExistingAnim:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMStartRadius()F

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$taskViewSimulator:Lcom/android/quickstep/util/TaskViewSimulator;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$floatRef:Lkotlin/jvm/internal/A;

    .line 72
    .line 73
    iget v8, v0, Lkotlin/jvm/internal/A;->g:F

    .line 74
    .line 75
    const v9, 0x3f8ccccd    # 1.1f

    .line 76
    .line 77
    .line 78
    sget-object v10, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 79
    .line 80
    invoke-static/range {v5 .. v10}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams3:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectF3:Landroid/graphics/RectF;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setRadiusWeight(F)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setScale(F)V

    .line 92
    .line 93
    .line 94
    move/from16 p1, p5

    .line 95
    .line 96
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setAlpha(F)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, p4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setRadius(F)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, p3}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setRadio(F)V

    .line 103
    .line 104
    .line 105
    iget p1, v2, Landroid/graphics/RectF;->left:F

    .line 106
    .line 107
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setX(F)V

    .line 108
    .line 109
    .line 110
    iget p1, v2, Landroid/graphics/RectF;->top:F

    .line 111
    .line 112
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setY(F)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams4:Lcom/android/quickstep/util/TransformParams;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object v2, p1, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 122
    .line 123
    const-string p1, "transformParams.targetSet.unfilteredApps"

    .line 124
    .line 125
    invoke-static {v2, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$transformParams3:Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 131
    .line 132
    iget-object v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectF3:Landroid/graphics/RectF;

    .line 133
    .line 134
    const/4 v7, 0x1

    .line 135
    const/4 v3, 0x1

    .line 136
    const/4 v5, 0x0

    .line 137
    invoke-virtual/range {v0 .. v7}, Lcom/android/quickstep/util/animation/RectTransformHelper;->applySurfaceParams(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;[Lu2/s;ILcom/android/quickstep/util/SurfaceTransaction;Lu2/s$a;Landroid/graphics/RectF;Z)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 143
    .line 144
    if-eqz p1, :cond_2

    .line 145
    .line 146
    const/4 p2, 0x0

    .line 147
    aget-object p1, p1, p2

    .line 148
    .line 149
    if-eqz p1, :cond_2

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    if-nez p1, :cond_1

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getActualMatrixBeforeGestureEnd()Landroid/graphics/Matrix;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getMTmpMatrix()Landroid/graphics/Matrix;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getActualClipRectBeforeGestureEnd()Landroid/graphics/Rect;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$16;->val$rectTransformHelper:Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getMClipRect()Landroid/graphics/Rect;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p1, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 182
    .line 183
    .line 184
    :cond_2
    :goto_1
    return-void
.end method
