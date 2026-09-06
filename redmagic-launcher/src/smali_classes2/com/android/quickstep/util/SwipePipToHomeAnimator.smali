.class public Lcom/android/quickstep/util/SwipePipToHomeAnimator;
.super Lcom/android/quickstep/util/RectFSpringAnim;
.source "SwipePipToHomeAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;,
        Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    }
.end annotation


# static fields
.field private static final END_PROGRESS:F = 1.0f

.field private static final TAG:Ljava/lang/String; = "SwipePipToHomeAnimator"


# instance fields
.field private final mActivityInfo:Landroid/content/pm/ActivityInfo;

.field private final mAppBounds:Landroid/graphics/Rect;

.field private final mCurrentBounds:Landroid/graphics/Rect;

.field private final mCurrentBoundsF:Landroid/graphics/RectF;

.field private final mDestinationBounds:Landroid/graphics/Rect;

.field private final mDestinationBoundsTransformed:Landroid/graphics/Rect;

.field private final mFromRotation:I

.field private mHasAnimationEnded:Z

.field private final mHomeToWindowPositionMap:Landroid/graphics/Matrix;

.field private final mInsetsEvaluator:Landroid/animation/RectEvaluator;

.field private final mLeash:Landroid/view/SurfaceControl;

.field private mPipContentOverlay:LS2/a;

.field private final mSourceHintRectInsets:Landroid/graphics/Rect;

.field private final mSourceInsets:Landroid/graphics/Rect;

.field private final mSourceRectHint:Landroid/graphics/Rect;

.field private final mStartBounds:Landroid/graphics/Rect;

.field private final mSurfaceTransactionHelper:Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;

.field private final mTaskId:I


# direct methods
.method private constructor <init>(Landroid/content/Context;ILandroid/content/pm/ActivityInfo;ILandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/Rect;ILandroid/graphics/Rect;IILandroid/view/View;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v8, p12

    .line 2
    new-instance v9, Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;

    new-instance v10, Landroid/graphics/RectF;

    invoke-direct {v10, v8}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    const/4 v11, 0x0

    invoke-direct {v9, v1, v11, v6, v10}, Lcom/android/quickstep/util/RectFSpringAnim$DefaultSpringConfig;-><init>(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    invoke-direct {v0, v9}, Lcom/android/quickstep/util/RectFSpringAnim;-><init>(Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;)V

    .line 3
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    iput-object v9, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceRectHint:Landroid/graphics/Rect;

    .line 4
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    iput-object v10, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mAppBounds:Landroid/graphics/Rect;

    .line 5
    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    iput-object v12, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 6
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    iput-object v13, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mStartBounds:Landroid/graphics/Rect;

    .line 7
    new-instance v14, Landroid/graphics/RectF;

    invoke-direct {v14}, Landroid/graphics/RectF;-><init>()V

    iput-object v14, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBoundsF:Landroid/graphics/RectF;

    .line 8
    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14}, Landroid/graphics/Rect;-><init>()V

    iput-object v14, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBounds:Landroid/graphics/Rect;

    .line 9
    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14}, Landroid/graphics/Rect;-><init>()V

    iput-object v14, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBounds:Landroid/graphics/Rect;

    .line 10
    new-instance v15, Landroid/animation/RectEvaluator;

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    invoke-direct {v15, v11}, Landroid/animation/RectEvaluator;-><init>(Landroid/graphics/Rect;)V

    iput-object v15, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mInsetsEvaluator:Landroid/animation/RectEvaluator;

    .line 11
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    iput-object v11, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceInsets:Landroid/graphics/Rect;

    .line 12
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    iput-object v11, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    move/from16 v15, p2

    .line 13
    iput v15, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mTaskId:I

    .line 14
    iput-object v2, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 15
    iput-object v3, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mLeash:Landroid/view/SurfaceControl;

    .line 16
    invoke-virtual {v10, v5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object/from16 v15, p8

    .line 17
    invoke-virtual {v12, v15}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 18
    invoke-virtual {v6, v13}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 19
    invoke-virtual {v14, v7}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move/from16 v6, p11

    .line 20
    iput v6, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mFromRotation:I

    .line 21
    invoke-virtual {v11, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 22
    new-instance v6, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;

    move/from16 v8, p13

    move/from16 v11, p14

    invoke-direct {v6, v8, v11}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;-><init>(II)V

    iput-object v6, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSurfaceTransactionHelper:Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;

    .line 23
    new-instance v6, Landroid/util/Rational;

    .line 24
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v11

    invoke-direct {v6, v8, v11}, Landroid/util/Rational;-><init>(II)V

    .line 25
    new-instance v8, Landroid/graphics/Rect;

    iget v11, v5, Landroid/graphics/Rect;->left:I

    add-int/lit8 v11, v11, -0x1

    iget v12, v5, Landroid/graphics/Rect;->top:I

    add-int/lit8 v12, v12, -0x1

    iget v13, v5, Landroid/graphics/Rect;->right:I

    add-int/lit8 v13, v13, 0x1

    iget v15, v5, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v15, v15, 0x1

    invoke-direct {v8, v11, v12, v13, v15}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    invoke-virtual {v4}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 27
    const-string v11, "Source rect hint is empty"

    goto/16 :goto_1

    .line 28
    :cond_0
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v11

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v12

    if-lt v11, v12, :cond_4

    .line 29
    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v11

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v12

    if-ge v11, v12, :cond_1

    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {v8, v4}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 31
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Source rect hint exceeds display bounds "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 32
    invoke-virtual {v4}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_1

    .line 33
    :cond_2
    new-instance v8, Landroid/util/Rational;

    .line 34
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v11

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v12

    invoke-direct {v8, v11, v12}, Landroid/util/Rational;-><init>(II)V

    .line 35
    invoke-static {v7, v8}, Landroid/app/PictureInPictureParams;->isSameAspectRatio(Landroid/graphics/Rect;Landroid/util/Rational;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 36
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Source rect hint:"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v11, " does not match destination bounds:"

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 37
    invoke-virtual {v4}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_1

    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    .line 38
    :cond_4
    :goto_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Source rect hint is too small "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 39
    invoke-virtual {v4}, Landroid/graphics/Rect;->setEmpty()V

    .line 40
    :goto_1
    invoke-virtual {v4}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 41
    invoke-virtual {v6}, Landroid/util/Rational;->floatValue()F

    move-result v4

    invoke-direct {v0, v5, v4}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getEnterPipWithOverlaySrcRectHint(Landroid/graphics/Rect;F)Landroid/graphics/Rect;

    move-result-object v4

    .line 42
    invoke-virtual {v9, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 43
    new-instance v4, LS2/a$a;

    invoke-virtual/range {p15 .. p15}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Ls1/T;

    invoke-direct {v7, v1}, Ls1/T;-><init>(Landroid/content/Context;)V

    .line 44
    invoke-virtual {v7, v2}, Ls1/T;->j(Landroid/content/pm/ComponentInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    move/from16 p13, p4

    move-object/from16 p12, v1

    move-object/from16 p8, v4

    move-object/from16 p9, v6

    move-object/from16 p10, v10

    move-object/from16 p11, v14

    invoke-direct/range {p8 .. p13}, LS2/a$a;-><init>(Landroid/content/Context;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/drawable/Drawable;I)V

    move-object/from16 v1, p8

    iput-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mPipContentOverlay:LS2/a;

    .line 45
    new-instance v1, Landroid/view/SurfaceControl$Transaction;

    invoke-direct {v1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 46
    iget-object v2, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mPipContentOverlay:LS2/a;

    invoke-virtual {v2, v1, v3}, LS2/a;->a(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;)V

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getContentOverlay()Landroid/view/SurfaceControl;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " is created: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SwipePipToHomeAnimator"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 48
    :cond_5
    invoke-virtual {v9, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 49
    :goto_2
    new-instance v1, Landroid/graphics/Rect;

    iget v2, v9, Landroid/graphics/Rect;->left:I

    iget v3, v5, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    iget v3, v9, Landroid/graphics/Rect;->top:I

    iget v4, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    iget v4, v5, Landroid/graphics/Rect;->right:I

    iget v6, v9, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v6

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    iget v6, v9, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceHintRectInsets:Landroid/graphics/Rect;

    .line 50
    new-instance v1, Lcom/android/quickstep/util/SwipePipToHomeAnimator$1;

    move-object/from16 v2, p15

    invoke-direct {v1, v0, v2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$1;-><init>(Lcom/android/quickstep/util/SwipePipToHomeAnimator;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 51
    new-instance v1, Lcom/android/quickstep/util/p1;

    invoke-direct {v1, v0}, Lcom/android/quickstep/util/p1;-><init>(Lcom/android/quickstep/util/SwipePipToHomeAnimator;)V

    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;ILandroid/content/pm/ActivityInfo;ILandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/Rect;ILandroid/graphics/Rect;IILandroid/view/View;Lcom/android/quickstep/util/r1;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p15}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;-><init>(Landroid/content/Context;ILandroid/content/pm/ActivityInfo;ILandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/Rect;ILandroid/graphics/Rect;IILandroid/view/View;)V

    return-void
.end method

.method private getEnterPipWithOverlaySrcRectHint(Landroid/graphics/Rect;F)Landroid/graphics/Rect;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v0, v0

    .line 11
    div-float/2addr p0, v0

    .line 12
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 15
    .line 16
    cmpg-float p0, p0, p2

    .line 17
    .line 18
    if-gez p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-float v1, p0

    .line 25
    div-float/2addr v1, p2

    .line 26
    float-to-int p2, v1

    .line 27
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    sub-int/2addr p1, p2

    .line 34
    div-int/lit8 p1, p1, 0x2

    .line 35
    .line 36
    add-int/2addr v1, p1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    int-to-float v0, p0

    .line 43
    mul-float/2addr v0, p2

    .line 44
    float-to-int p2, v0

    .line 45
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    sub-int/2addr p1, p2

    .line 52
    div-int/lit8 p1, p1, 0x2

    .line 53
    .line 54
    add-int/2addr v0, p1

    .line 55
    move v2, p2

    .line 56
    move p2, p0

    .line 57
    move p0, v2

    .line 58
    :goto_0
    new-instance p1, Landroid/graphics/Rect;

    .line 59
    .line 60
    add-int/2addr p0, v0

    .line 61
    add-int/2addr p2, v1

    .line 62
    invoke-direct {p1, v0, v1, p0, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 63
    .line 64
    .line 65
    return-object p1
.end method

.method private getRotatedPosition(F)Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;
    .locals 5

    .line 1
    sget-boolean v0, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    .line 2
    .line 3
    const/high16 v1, 0x42b40000    # 90.0f

    .line 4
    .line 5
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mFromRotation:I

    .line 11
    .line 12
    const/high16 v4, 0x3f800000    # 1.0f

    .line 13
    .line 14
    if-ne v0, v3, :cond_0

    .line 15
    .line 16
    sub-float/2addr v4, p1

    .line 17
    mul-float/2addr v2, v4

    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 19
    .line 20
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mStartBounds:Landroid/graphics/Rect;

    .line 23
    .line 24
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    sub-int/2addr v1, v3

    .line 27
    int-to-float v1, v1

    .line 28
    mul-float/2addr v1, p1

    .line 29
    int-to-float v3, v3

    .line 30
    add-float/2addr v1, v3

    .line 31
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 32
    .line 33
    iget v3, p0, Landroid/graphics/Rect;->top:I

    .line 34
    .line 35
    sub-int/2addr v0, v3

    .line 36
    int-to-float v0, v0

    .line 37
    mul-float/2addr p1, v0

    .line 38
    int-to-float v0, v3

    .line 39
    add-float/2addr p1, v0

    .line 40
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 41
    .line 42
    int-to-float p0, p0

    .line 43
    mul-float/2addr p0, v4

    .line 44
    :goto_0
    add-float/2addr p1, p0

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    sub-float/2addr v4, p1

    .line 47
    mul-float v2, v4, v1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 50
    .line 51
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mStartBounds:Landroid/graphics/Rect;

    .line 54
    .line 55
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 56
    .line 57
    sub-int/2addr v1, v3

    .line 58
    int-to-float v1, v1

    .line 59
    mul-float/2addr v1, p1

    .line 60
    int-to-float v3, v3

    .line 61
    add-float/2addr v1, v3

    .line 62
    iget v3, p0, Landroid/graphics/Rect;->right:I

    .line 63
    .line 64
    int-to-float v3, v3

    .line 65
    mul-float/2addr v3, v4

    .line 66
    add-float/2addr v1, v3

    .line 67
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 70
    .line 71
    :goto_1
    sub-int/2addr v0, p0

    .line 72
    int-to-float v0, v0

    .line 73
    mul-float/2addr p1, v0

    .line 74
    int-to-float p0, p0

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mFromRotation:I

    .line 77
    .line 78
    if-ne v0, v3, :cond_2

    .line 79
    .line 80
    mul-float/2addr v2, p1

    .line 81
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 82
    .line 83
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mStartBounds:Landroid/graphics/Rect;

    .line 86
    .line 87
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 88
    .line 89
    sub-int/2addr v1, v3

    .line 90
    int-to-float v1, v1

    .line 91
    mul-float/2addr v1, p1

    .line 92
    int-to-float v3, v3

    .line 93
    add-float/2addr v1, v3

    .line 94
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    mul-float v2, p1, v1

    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mStartBounds:Landroid/graphics/Rect;

    .line 106
    .line 107
    iget v3, p0, Landroid/graphics/Rect;->left:I

    .line 108
    .line 109
    sub-int/2addr v1, v3

    .line 110
    int-to-float v1, v1

    .line 111
    mul-float/2addr v1, p1

    .line 112
    int-to-float v3, v3

    .line 113
    add-float/2addr v1, v3

    .line 114
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 115
    .line 116
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :goto_2
    new-instance p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;

    .line 120
    .line 121
    const/4 v0, 0x0

    .line 122
    invoke-direct {p0, v2, v1, p1, v0}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;-><init>(FFFLcom/android/quickstep/util/r1;)V

    .line 123
    .line 124
    .line 125
    return-object p0
.end method

.method public static synthetic m(Lcom/android/quickstep/util/SwipePipToHomeAnimator;Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->onAnimationUpdate(Landroid/graphics/RectF;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n(Lcom/android/quickstep/util/SwipePipToHomeAnimator;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mHasAnimationEnded:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic o(Lcom/android/quickstep/util/SwipePipToHomeAnimator;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mHasAnimationEnded:Z

    .line 2
    .line 3
    return-void
.end method

.method private onAnimationScaleAndCrop(FLandroid/view/SurfaceControl$Transaction;Landroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mInsetsEvaluator:Landroid/animation/RectEvaluator;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceInsets:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceHintRectInsets:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1, v2}, Landroid/animation/RectEvaluator;->evaluate(FLandroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    iget v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mFromRotation:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    :cond_0
    move v10, p1

    .line 20
    move-object v4, p2

    .line 21
    move-object v7, p3

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSurfaceTransactionHelper:Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;

    .line 24
    .line 25
    iget-object v5, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mLeash:Landroid/view/SurfaceControl;

    .line 26
    .line 27
    iget-object v6, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceRectHint:Landroid/graphics/Rect;

    .line 28
    .line 29
    iget-object v7, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mAppBounds:Landroid/graphics/Rect;

    .line 30
    .line 31
    move v10, p1

    .line 32
    move-object v4, p2

    .line 33
    move-object v9, v8

    .line 34
    move-object v8, p3

    .line 35
    invoke-virtual/range {v3 .. v10}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->scaleAndCrop(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;F)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :goto_0
    invoke-direct {p0, v10}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getRotatedPosition(F)Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v3, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSurfaceTransactionHelper:Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;

    .line 45
    .line 46
    iget-object v5, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mLeash:Landroid/view/SurfaceControl;

    .line 47
    .line 48
    iget-object v6, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mAppBounds:Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->c(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    invoke-static {p1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->d(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F

    .line 55
    .line 56
    .line 57
    move-result v10

    .line 58
    invoke-static {p1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;->e(Lcom/android/quickstep/util/SwipePipToHomeAnimator$RotatedPosition;)F

    .line 59
    .line 60
    .line 61
    move-result v11

    .line 62
    invoke-virtual/range {v3 .. v11}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->scaleAndRotate(Landroid/view/SurfaceControl$Transaction;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;FFF)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method private onAnimationUpdate(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/RectF;F)Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 1

    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBounds:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 9
    iget-object p2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mPipContentOverlay:LS2/a;

    if-eqz p2, :cond_0

    .line 10
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBounds:Landroid/graphics/Rect;

    invoke-virtual {p2, p1, v0, p3}, LS2/a;->c(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/Rect;F)V

    .line 11
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBounds:Landroid/graphics/Rect;

    invoke-direct {p0, p3, p1, p2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->onAnimationScaleAndCrop(FLandroid/view/SurfaceControl$Transaction;Landroid/graphics/Rect;)Landroid/window/PictureInPictureSurfaceTransaction;

    move-result-object p0

    return-object p0
.end method

.method private onAnimationUpdate(Landroid/graphics/RectF;F)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mHasAnimationEnded:Z

    if-eqz v0, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-static {}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newSurfaceControlTransaction()Landroid/view/SurfaceControl$Transaction;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mLeash:Landroid/view/SurfaceControl;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 4
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mCurrentBoundsF:Landroid/graphics/RectF;

    invoke-direct {p0, v0, p1, p2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->onAnimationUpdate(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/RectF;F)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 6
    invoke-virtual {v0}, Landroid/view/SurfaceControl$Transaction;->apply()V

    return-void

    .line 7
    :cond_2
    :goto_0
    const-string p0, "SwipePipToHomeAnimator"

    const-string p1, "leash is not valid"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public getAppBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mAppBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/pm/ActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getContentOverlay()Landroid/view/SurfaceControl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mPipContentOverlay:LS2/a;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, LS2/a;->b()Landroid/view/SurfaceControl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getDestinationBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFinishTransaction()Landroid/window/PictureInPictureSurfaceTransaction;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/pip/PipSurfaceTransactionHelper;->newSurfaceControlTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mDestinationBounds:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-direct {p0, v0, v1, v2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->onAnimationUpdate(Landroid/view/SurfaceControl$Transaction;Landroid/graphics/RectF;F)Landroid/window/PictureInPictureSurfaceTransaction;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Landroid/window/PictureInPictureSurfaceTransaction;->setShouldDisableCanAffectSystemUiFlags(Z)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public getSourceRectHint()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mSourceRectHint:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->mTaskId:I

    .line 2
    .line 3
    return p0
.end method
