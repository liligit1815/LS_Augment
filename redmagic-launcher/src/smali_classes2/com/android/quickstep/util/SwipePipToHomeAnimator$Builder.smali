.class public Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
.super Ljava/lang/Object;
.source "SwipePipToHomeAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SwipePipToHomeAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mActivityInfo:Landroid/content/pm/ActivityInfo;

.field private mAppBounds:Landroid/graphics/Rect;

.field private mAppIconSizePx:I

.field private mAttachedView:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mCornerRadius:I

.field private mDestinationBounds:Landroid/graphics/Rect;

.field private final mDestinationBoundsTransformed:Landroid/graphics/Rect;

.field private mDisplayCutoutInsets:Landroid/graphics/Rect;

.field private mFromRotation:I

.field private mHomeToWindowPositionMap:Landroid/graphics/Matrix;

.field private mLeash:Landroid/view/SurfaceControl;

.field private mShadowRadius:I

.field private mSourceRectHint:Landroid/graphics/Rect;

.field private mStartBounds:Landroid/graphics/RectF;

.field private mTaskId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mFromRotation:I

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public build()Lcom/android/quickstep/util/SwipePipToHomeAnimator;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget-object v2, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBounds:Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mSourceRectHint:Landroid/graphics/Rect;

    .line 19
    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    iget-object v2, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDisplayCutoutInsets:Landroid/graphics/Rect;

    .line 23
    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    iget v3, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mFromRotation:I

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 33
    .line 34
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v4, 0x1

    .line 39
    if-ne v3, v4, :cond_2

    .line 40
    .line 41
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 44
    .line 45
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Rect;->offset(II)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 v1, 0x3

    .line 50
    if-ne v3, v1, :cond_3

    .line 51
    .line 52
    iget-object v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAppBounds:Landroid/graphics/Rect;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/graphics/Rect;->inset(Landroid/graphics/Rect;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    :goto_0
    new-instance v3, Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 58
    .line 59
    iget-object v4, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mContext:Landroid/content/Context;

    .line 60
    .line 61
    iget v5, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mTaskId:I

    .line 62
    .line 63
    iget-object v6, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 64
    .line 65
    iget v7, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAppIconSizePx:I

    .line 66
    .line 67
    iget-object v8, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mLeash:Landroid/view/SurfaceControl;

    .line 68
    .line 69
    iget-object v9, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mSourceRectHint:Landroid/graphics/Rect;

    .line 70
    .line 71
    iget-object v10, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAppBounds:Landroid/graphics/Rect;

    .line 72
    .line 73
    iget-object v11, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 74
    .line 75
    iget-object v12, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mStartBounds:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget-object v13, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBounds:Landroid/graphics/Rect;

    .line 78
    .line 79
    iget v14, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mFromRotation:I

    .line 80
    .line 81
    iget-object v15, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 82
    .line 83
    iget v1, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mCornerRadius:I

    .line 84
    .line 85
    iget v2, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mShadowRadius:I

    .line 86
    .line 87
    iget-object v0, v0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAttachedView:Landroid/view/View;

    .line 88
    .line 89
    const/16 v19, 0x0

    .line 90
    .line 91
    move-object/from16 v18, v0

    .line 92
    .line 93
    move/from16 v16, v1

    .line 94
    .line 95
    move/from16 v17, v2

    .line 96
    .line 97
    invoke-direct/range {v3 .. v19}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;-><init>(Landroid/content/Context;ILandroid/content/pm/ActivityInfo;ILandroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/Rect;ILandroid/graphics/Rect;IILandroid/view/View;Lcom/android/quickstep/util/r1;)V

    .line 98
    .line 99
    .line 100
    return-object v3
.end method

.method public setActivityInfo(Landroid/content/pm/ActivityInfo;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAppBounds(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAppBounds:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-object p0
.end method

.method public setAppIconSizePx(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAppIconSizePx:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setAttachedView(Landroid/view/View;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mAttachedView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public setContext(Landroid/content/Context;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCornerRadius(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mCornerRadius:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setDestinationBounds(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBounds:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-object p0
.end method

.method public setDisplayCutoutInsets(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDisplayCutoutInsets:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-object p0
.end method

.method public setFromRotation(Lcom/android/quickstep/util/TaskViewSimulator;ILandroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-eq p2, v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string p3, "Not a supported rotation, rotation="

    .line 13
    .line 14
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "SwipePipToHomeAnimator"

    .line 25
    .line 26
    invoke-static {p2, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    .line 31
    .line 32
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Landroid/graphics/RectF;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBounds:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {p1, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Landroid/graphics/RectF;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBounds:Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDestinationBoundsTransformed:Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 58
    .line 59
    .line 60
    iput p2, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mFromRotation:I

    .line 61
    .line 62
    if-eqz p3, :cond_1

    .line 63
    .line 64
    new-instance p1, Landroid/graphics/Rect;

    .line 65
    .line 66
    invoke-direct {p1, p3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mDisplayCutoutInsets:Landroid/graphics/Rect;

    .line 70
    .line 71
    :cond_1
    return-object p0
.end method

.method public setHomeToWindowPositionMap(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-object p0
.end method

.method public setLeash(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mLeash:Landroid/view/SurfaceControl;

    .line 2
    .line 3
    return-object p0
.end method

.method public setShadowRadius(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mShadowRadius:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setSourceRectHint(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mSourceRectHint:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-object p0
.end method

.method public setStartBounds(Landroid/graphics/RectF;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mStartBounds:Landroid/graphics/RectF;

    .line 7
    .line 8
    return-object p0
.end method

.method public setTaskId(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->mTaskId:I

    .line 2
    .line 3
    return-object p0
.end method
